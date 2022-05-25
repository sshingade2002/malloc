/*
 * @file mm.c
 * @brief A 64-bit struct-based implicit free list memory allocator
 *
 * 15-213: Introduction to Computer Systems
 *
 * TODO: insert your documentation here. :)
 *
 *************************************************************************
 *
 * ADVICE FOR STUDENTS.
 * - Step 0: Please read the writeup!
 * - Step 1: Write your heap checker.
 * - Step 2: Write contracts / debugging assert statements.
 * - Good luck, and have fun!
 *
 *************************************************************************
 *
 * @author Supriya Shingade <sshingad@andrew.cmu.edu>
 */

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "memlib.h"
#include "mm.h"

/* Do not change the following! */

#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#define memset mem_memset
#define memcpy mem_memcpy
#endif /* def DRIVER */

/* You can change anything from here onward */

/*
 *****************************************************************************
 * If DEBUG is defined (such as when running mdriver-dbg), these macros      *
 * are enabled. You can use them to print debugging output and to check      *
 * contracts only in debug mode.                                             *
 *                                                                           *
 * Only debugging macros with names beginning "dbg_" are allowed.            *
 * You may not define any other macros having arguments.                     *
 *****************************************************************************
 */
#ifdef DEBUG
/* When DEBUG is defined, these form aliases to useful functions */
#define dbg_ // printf(...) ((void)// printf(__VA_ARGS__))
#define dbg_requires(expr) assert(expr)
#define dbg_assert(expr) assert(expr)
#define dbg_ensures(expr) assert(expr)
#define dbg_printheap(...) print_heap(__VA_ARGS__)
#else
/* When DEBUG is not defined, no code gets generated for these */
/* The sizeof() hack is used to avoid "unused variable" warnings */
#define dbg_ // printf(...) ((void)sizeof(__VA_ARGS__))
#define dbg_requires(expr) ((void)sizeof(expr))
#define dbg_assert(expr) ((void)sizeof(expr))
#define dbg_ensures(expr) ((void)sizeof(expr))
#define dbg_printheap(...) ((void)sizeof(__VA_ARGS__))
#endif

/* Basic constants */

typedef uint64_t word_t;

/** @brief Word and header size (bytes) */
static const size_t wsize = sizeof(word_t);

/** @brief Double word size (bytes) */
static const size_t dsize = 2 * wsize;

/** @brief Minimum block size (bytes) */
static const size_t min_block_size = dsize;

/**
 * TODO: explain what chunksize is
 * (Must be divisible by dsize)
 */
static const size_t chunksize = (1 << 12);

/**
 * used to get the last bit of the block size information
 * to see if the block is allocated (1) or not (0)
 */
static const word_t alloc_mask = 0x1;

/**
 * used to get the second last bit of the block size information
 * to see if the previous block is allocated (1) or not (0)
 */
static const word_t alloc_mask_prev = 0x2;

/**
 * used to get the third last bit of the block size information
 * to see if the previous block is mini (1) or not (0)
 */
static const word_t mask_min = 0x4;

/**
 * used to get the size of the block excluding the last
 * bit to see how large it is
 */
static const word_t size_mask = ~(word_t)0xF;

/** @brief Represents the header and payload of one block in the heap */
typedef struct block {
    /** @brief Header contains size + allocation flag */
    word_t header;

    union {
        struct {
            struct block *next;
            struct block *prev;
        };

        /**
         * @brief A pointer to the block payload.
         */
        char payload[0];
    };

} block_t;

/* Global variables */

/** @brief Pointer to first block in the heap: HEAD */
static block_t *heap_start = NULL;

/** @brief list of heads of the different segmented lists */
block_t *list_heads[15];

/*
 *****************************************************************************
 * The functions below are short wrapper functions to perform                *
 * bit manipulation, pointer arithmetic, and other helper operations.        *
 *                                                                           *
 * We've given you the function header comments for the functions below      *
 * to help you understand how this baseline code works.                      *
 *                                                                           *
 * Note that these function header comments are short since the functions    *
 * they are describing are short as well; you will need to provide           *
 * adequate details for the functions that you write yourself!               *
 *****************************************************************************
 */

/*
 * ---------------------------------------------------------------------------
 *                        BEGIN SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/**
 * @brief Returns the maximum of two integers.
 * @param[in] x
 * @param[in] y
 * @return `x` if `x > y`, and `y` otherwise.
 */
static size_t max(size_t x, size_t y) {
    return (x > y) ? x : y;
}

/**
 * @brief Rounds `size` up to next multiple of n
 * @param[in] size
 * @param[in] n
 * @return The size after rounding up
 */
static size_t round_up(size_t size, size_t n) {
    return n * ((size + (n - 1)) / n);
}

/**
 * @brief Packs the `size` and `alloc` of a block into a word suitable for
 *        use as a packed value.
 *
 * Packed values are used for both headers and footers.
 *
 * The allocation status is packed into the lowest bit of the word.
 *
 * @param[in] size The size of the block being represented
 * @param[in] alloc True if the block is allocated
 * @param[in] prev_alloc True if the previous block is allocated
 * @param[in] min_status True if the previous block is a mini
 * @return The packed value
 */
static word_t pack(size_t size, bool alloc, bool prev_alloc, bool min_status) {
    word_t word = size;
    if (alloc) {
        word |= alloc_mask;
    }
    if (prev_alloc) {
        word |= alloc_mask_prev;
    }
    if (min_status) {
        word |= mask_min;
    }
    return word;
}

/**
 * @brief Finds the bucket list according to given size
 * There are 15 buckets that each free block can be stored in
 * @param[in] size The size of the block being represented
 * @return The index corresponding to the bucket in the list
 */
static size_t find_size_list(size_t size) {
    if (size <= 16) {
        return 0;
    } else if (size <= 32) {
        return 1;
    } else if (size < 49) {
        return 2;
    } else if (size < 65) {
        return 3;
    } else if (size < 90) {
        return 4;
    } else if (size < 113) {
        return 5;
    } else if (size < 129) {
        return 6;
    } else if (size < 145) {
        return 7;
    } else if (size < 161) {
        return 8;
    } else if (size < 177) {
        return 9;
    } else if (size < 257) {
        return 10;
    } else if (size < 513) {
        return 11;
    } else if (size < 900) {
        return 12;
    } else if (size < 5000) {
        return 13;
    }

    else {
        return 14;
    }
}

/**
 * @brief Extracts the size represented in a packed word.
 *
 * This function simply clears the lowest 4 bits of the word, as the heap
 * is 16-byte aligned.
 *
 * @param[in] word
 * @return The size of the block represented by the word
 */
static size_t extract_size(word_t word) {
    return (word & size_mask);
}

/**
 * @brief Extracts the size of a block from its header.
 * @param[in] block
 * @return The size of the block
 */
static size_t get_size(block_t *block) {
    return extract_size(block->header);
}

/**
 * @brief Given a payload pointer, returns a pointer to the corresponding
 *        block.
 * @param[in] bp A pointer to a block's payload
 * @return The corresponding block
 */
static block_t *payload_to_header(void *bp) {
    return (block_t *)((char *)bp - offsetof(block_t, payload));
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        payload.
 * @param[in] block
 * @return A pointer to the block's payload
 * @pre The block must be a valid block, not a boundary tag.
 */
static void *header_to_payload(block_t *block) {
    dbg_requires(get_size(block) != 0);
    return (void *)(block->payload);
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        footer.
 * @param[in] block
 * @return A pointer to the block's footer
 * @pre The block must be a valid block, not a boundary tag.
 */
static word_t *header_to_footer(block_t *block) {
    dbg_requires(get_size(block) != 0 &&
                 "Called header_to_footer on the epilogue block");
    return (word_t *)(block->payload + get_size(block) - dsize);
}

/**
 * @brief Given a block "footer" of a mini block, returns a pointer to the
 * corresponding header of the mini block. Since mini blocks don't hold footers,
 * and footers are found by substracting by wsize, the header is recalcuated by
 * adding wsize and subtracting by min block size.
 * @param[in] footer A pointer to the block's "footer" which is just wsize to
 * the left on the heap
 * @return A pointer to the start of the block
 */
static block_t *min_footer_to_header(word_t *footer) {
    return (block_t *)((char *)footer + wsize - min_block_size);
}

/**
 * @brief Given a block footer, returns a pointer to the corresponding
 *        header.
 * @param[in] footer A pointer to the block's footer
 * @return A pointer to the start of the block
 * @pre The footer must be the footer of a valid block, not a boundary tag.
 */
static block_t *footer_to_header(word_t *footer) {
    size_t size = extract_size(*footer);
    dbg_assert(size != 0 && "Called footer_to_header on the prologue block");
    return (block_t *)((char *)footer + wsize - size);
}

/**
 * @brief Given a block that is mini, inserted into seglist (bucket 0).
 * @param[in] block the block needed to be inserted
 * @return A pointer to the start of the block inserted
 * @pre block is not null.
 */
static block_t *min_block_insertion(block_t *block) {
    block->next = list_heads[0];
    list_heads[0] = block;
    return block;
}

/**
 * @brief Given a block, insert into seglist.
 * @param[in] block the block needed to be inserted
 * @return A pointer to the start of the block insert
 * @pre block is not null.
 */
static block_t *block_insertion(block_t *block) {
    // if it is mini block, work with its singlylist link differentl
    if (get_size(block) <= min_block_size) {
        return min_block_insertion(block);
    }
    size_t index = find_size_list(get_size(block));

    // LIFO add block to start of list at head
    block->next = list_heads[index];
    block->prev = NULL;
    if (list_heads[index] != NULL) {
        list_heads[index]->prev = block;
    }
    list_heads[index] = block;

    return block;
}

/**
 * @brief Given a block, checks if block is inside seglists.
 * @param[in] block the block needed to be checked
 * @return false is block is not in seglist, true otherwise
 * @pre block is not null.
 */
static bool inside_list(block_t *block) {

    size_t index = find_size_list(get_size(block));

    for (block_t *curr = list_heads[index]; curr != NULL; curr = curr->next) {
        if (block == curr)
            return true;
    }
    return false;
}

/**
 * @brief Given a mini block, remove from seglist.
 * @param[in] block the block needed to be removed
 * @return A pointer to the start of the block removed
 * @pre block is not null.
 */
static block_t *min_block_removal(block_t *block) {
    dbg_assert(inside_list(block));

    // one element
    if (block == list_heads[0] && list_heads[0]->next == NULL) {
        block->next = NULL;
        list_heads[0] = NULL;
        return block;
    }
    // first element
    else if (block == list_heads[0]) {
        list_heads[0] = block->next;
        block->next = NULL;
        return block;
    }
    // middle element
    else {
        // loop through list to find element and set previous next to current
        // next to take out of list
        block_t *prev = NULL;
        for (block_t *curr = list_heads[0]; curr != NULL; curr = curr->next) {
            if (curr == block) {
                prev->next = curr->next;
                block->next = NULL;
                return block;
            }
            prev = curr;
        }
        return NULL;
    }
}

/**
 * @brief Given a block, remove from seglist.
 * @param[in] block the block needed to be removed
 * @return A pointer to the start of the block removed
 * @pre block is not null.
 */
static block_t *block_removal(block_t *block) {
    // if it is mini block, work with its singlylist link differently
    if (get_size(block) <= min_block_size) {
        return min_block_removal(block);
    }

    size_t index = find_size_list(get_size(block));

    dbg_assert(list_heads[index] != NULL);
    dbg_assert(inside_list(block));

    // one element
    if (block == list_heads[index] && list_heads[index]->next == NULL) {
        block->prev = NULL;
        block->next = NULL;
        list_heads[index] = NULL;

    }
    // first element
    else if (block == list_heads[index] && block->prev == NULL &&
             block->next != NULL) {
        list_heads[index] = list_heads[index]->next;
        list_heads[index]->prev = NULL;
        block->prev = NULL;
        block->next = NULL;

    }
    // last element
    else if (block->prev != NULL && block->next == NULL) {

        block->prev->next = NULL;
        block->prev = NULL;

    }
    // middle case
    else {
        block->prev->next = block->next;
        block->next->prev = block->prev;
        block->next = NULL;
        block->prev = NULL;
    }
    return block;
}

/**
 * @brief Returns the allocation status of a given header value.
 *
 * This is based on the lowest bit of the header value.
 *
 * @param[in] word
 * @return The allocation status correpsonding to the word
 */
static bool extract_alloc(word_t word) {
    return (bool)(word & alloc_mask);
}

/**
 * @brief Returns the allocation status of a block, based on its header.
 * @param[in] block
 * @return The allocation status of the block
 */
static bool get_alloc(block_t *block) {
    return extract_alloc(block->header);
}

/**
 * @brief Returns the previous allocation status of a given header value.
 *
 * This is based on the second lowest bit of the header value.
 *
 * @param[in] word
 * @return The allocation status correpsonding to the previous word
 */
static bool extract_alloc_prev(word_t word) {

    return (bool)((word & alloc_mask_prev) >> 1);
}

/**
 * @brief Returns the allocation status of a block's previous, based on its
 * header.
 * @param[in] block
 * @return The mini status of the previous block
 */
static bool get_alloc_prev(block_t *block) {
    return extract_alloc_prev(block->header);
}

/**
 * @brief Returns the previous mini status of a given header value.
 *
 * This is based on the third lowest bit of the header value.
 *
 * @param[in] word
 * @return The mini status correpsonding to the previous word
 */
static bool extract_min_status(word_t word) {

    return (bool)((word & mask_min) >> 2);
}
/**
 * @brief Returns the mini status of a block's previous, based on its header.
 * @param[in] block
 * @return The mini status of the previous block
 */
static bool get_min_status(block_t *block) {
    return extract_min_status(block->header);
}

/**
 * @brief Writes an epilogue header at the given address.
 *
 * The epilogue header has size 0, and is marked as allocated.
 *
 * @param[out] block The location to write the epilogue header
 */
static void write_epilogue(block_t *block, bool prev_alloc) {
    dbg_requires(block != NULL);
    dbg_requires((char *)block == (char *)mem_heap_hi() - 7);
    block->header = pack(0, true, prev_alloc, false);
}

/**
 * @brief Returns the payload size of a given block.
 *
 * The payload size is equal to the entire block size minus the sizes of the
 * block's header and footer.
 *
 * @param[in] block
 * @return The size of the block's payload
 */
static size_t get_payload_size(block_t *block) {
    size_t asize = get_size(block);
    if (get_alloc(block)) {
        return asize - wsize;
    } else {
        return asize - dsize;
    }
}

/**
 * @brief Finds the next consecutive block on the heap.
 *
 * This function accesses the next block in the "implicit list" of the heap
 * by adding the size of the block.
 *
 * @param[in] block A block in the heap
 * @return The next consecutive block on the heap
 * @pre The block is not the epilogue
 */
static block_t *find_next(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0 &&
                 "Called find_next on the last block in the heap");
    return (block_t *)((char *)block + get_size(block));
}

/**
 * @brief Writes a block starting at the given address.
 *
 * This function writes both a header and footer, where the location of the
 * footer is computed in relation to the header. Also writes the header of the
 * next block with the information given from the current block.
 *
 * TODO: Are there any preconditions or postconditions?
 *
 * @param[out] block The location to begin writing the block header
 * @param[in] size The size of the new block
 * @param[in] alloc The allocation status of the new block
 * @pre block is not null
 * @pre size > 0
 */
static void write_block(block_t *block, size_t size, bool alloc,
                        bool alloc_prev) {
    dbg_requires(block != NULL);
    dbg_requires(size > 0);

    block->header = pack(size, alloc, alloc_prev, get_min_status(block));
    if (!alloc && size > min_block_size) {
        word_t *footerp = header_to_footer(block);
        *footerp = pack(size, alloc, alloc_prev, get_min_status(block));
    }
    block_t *next = find_next(block);
    if (size <= min_block_size) {
        next->header = pack(get_size(next), get_alloc(next), alloc, true);
    } else {
        next->header = pack(get_size(next), get_alloc(next), alloc, false);
    }
}

/**
 * @brief Finds the footer of the previous block on the heap.
 * @param[in] block A block in the heap
 * @return The location of the previous block's footer
 */
static word_t *find_prev_footer(block_t *block) {
    // Compute previous footer position as one word before the header
    return &(block->header) - 1;
}

/**
 * @brief Finds the previous consecutive block on the heap.
 *
 * This is the previous block in the "implicit list" of the heap.
 *
 * If the function is called on the first block in the heap, NULL will be
 * returned, since the first block in the heap has no previous block!
 *
 * The position of the previous block is found by reading the previous
 * block's footer to determine its size, then calculating the start of the
 * previous block based on its size.
 *
 * @param[in] block A block in the heap
 * @return The previous consecutive block in the heap.
 */
static block_t *find_prev(block_t *block) {
    dbg_requires(block != NULL);
    word_t *footerp = find_prev_footer(block);
    if (get_min_status(block)) {
        return min_footer_to_header(footerp);
    }
    // Return NULL if called on first block in the heap
    if (extract_size(*footerp) == 0) {
        return NULL;
    }

    return footer_to_header(footerp);
}

/*
 * ---------------------------------------------------------------------------
 *                        END SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/******** The remaining content below are helper and debug routines ********/

/**
 * @brief
 *
 * This function puts all the sections of the free blocks together.
 * Requires the block to be freed so that we can put
 * it together with other freed blocks. There are 4 general cases
 * that the heap can have and each are addressed below
 *
 * @param[in] block in the heap that is freed
 * @return final block that is maximally coalesced
 */
static block_t *coalesce_block(block_t *block) {

    // block_t *previous = find_prev(block);
    // dbg_assert(block != NULL);
    block_t *next = find_next(block);

    size_t size = get_size(block);

    // Case 1: Block freed is sandwiched between two allocated blocks
    if (get_alloc_prev(block) && get_alloc(next)) {
        // printf("\ncase 1\n");
        return block;

    }
    // Case 2: Block freed is sandwiched between one allocated and one freed
    // block
    else if (get_alloc_prev(block) && !get_alloc(next)) {
        block_removal(next);
        write_block(block, size + get_size(next), false, true);

        return block;
    }
    // Case 3: Block freed is sandwiched between one freed block and one
    // allocated
    else if (!get_alloc_prev(block) && get_alloc(next)) {
        block_t *previous = find_prev(block);
        block_removal(previous);
        write_block(previous, size + get_size(previous), false,
                    get_alloc_prev(previous));

        return previous;
    }
    // Case 4: Block freed is sandwiched between two freed blocks
    else {
        block_t *previous = find_prev(block);
        block_removal(previous);
        block_removal(next);

        write_block(previous, get_size(previous) + size + get_size(next), false,
                    get_alloc_prev(previous));

        return previous;
    }
    return block;
}

/**
 * @brief
 *
 * Extends the heap by the amount of space necessary to insert and allocate a
 * new block requires size to be greater than the min block size
 *
 * @param[in] size amount of space that needs to be allocated on the heap
 * @return block that is extended off of the heap
 */
static block_t *extend_heap(size_t size) {
    void *bp;
    // Allocate an even number of words to maintain alignment
    size = round_up(size, min_block_size);
    if ((bp = mem_sbrk((intptr_t)size)) == (void *)-1) {

        return NULL;
    }

    /*
     * TODO: delete or replace this comment once you've thought about it.
     * Think about what bp represents. Why do we write the new block
     * starting one word BEFORE bp, but with the same size that we
     * originally requested?
     */

    // Initialize free block header/footer
    block_t *block = payload_to_header(bp);

    write_block(block, size, false, get_alloc_prev(block));

    // Create new epilogue header
    block_t *block_next = find_next(block);
    // // printf("called it line 633");
    write_epilogue(block_next, false);

    // Coalesce in case the previous block was free
    block = coalesce_block(block);

    // insert block into seglists
    block_insertion(block);

    return block;
}

/**
 * @brief
 *
 * splits the amount of free block into allocated and leftover free
 *
 * @param[in] block block that needs to be inserted
 * @param[in] asize actual size of memory needed for the block
 */
static void split_block(block_t *block, size_t asize) {
    dbg_requires(get_alloc(block));
    dbg_requires(asize >= min_block_size);
    size_t block_size = get_size(block);

    if ((block_size - asize) >= min_block_size) {
        block_t *block_next;
        write_block(block, asize, true, get_alloc_prev(block));

        block_next = find_next(block);
        write_block(block_next, block_size - asize, false, true);

        // insert free block into seglists
        block_insertion(block_next);
    }

    dbg_ensures(get_alloc(block));
}

/**
 * @brief
 *
 * finds a block that was previously freed to insert a new block
 * searches through the first 35 entries in each segmented lists bucket
 *
 * @param[in] asize size of the block that needs to be inserted into heap
 * @return
 */
static block_t *find_fit(size_t asize) {

    size_t index = find_size_list(asize);
    size_t count = 0;
    block_t *best = NULL;
    size_t diff = 100;
    size_t d = 0;
    while (index < 15) {

        for (block_t *curr = list_heads[index]; curr != NULL && count < 35;
             curr = curr->next) {
            count++;
            d = get_size(curr) - asize;
            if (asize <= get_size(curr) && (best == NULL || d)) {
                best = curr;
                diff = d;
            }
        }
        if (best != NULL) {
            return best;
        }
        count = 0;

        index++;
    }
    return NULL;
}

/**
 * @brief
 *
 * makes sures that the heap is correct and that all the block
 * information is being stored appropriately (does all the checks
 * on the writeup).
 *
 * @param[in] line line number that the function is called
 * @return
 */
bool mm_checkheap(int line) {

    // printf("checkheap %d\n ", line);
    word_t *prologueinfo = find_prev_footer(heap_start);
    if (!(extract_alloc(*prologueinfo) && extract_size(*prologueinfo) == 0)) {
        return false;
    }
    size_t freeblocks = 0;
    bool lastfree = false;
    block_t *block;
    for (block = heap_start; get_size(block) > 0; block = find_next(block)) {
        if (get_alloc(block)) {
            // printf("A ");
        } else {
            // printf("F ");
        }
        // printf("%zu | ", get_size(block));
        // if (get_size(block) < min_block_size) {
        //     return false;
        // }
        if (get_size(block) % 16 != 0) {
            // printf("false line 718");
            return false;
        }

        if (!get_alloc(block)) {
            freeblocks++;
            if (lastfree) {
                // printf("false line 728");
                return false;
            } else {
                lastfree = true;
            }
        } else {

            lastfree = false;
        }
    }
    // printf("\n");
    if (!(get_alloc(block) && get_size(block) == 0)) {
        // printf("false line 741\n");
        // printf("size %zu ", get_size(block));
        if (get_alloc(block)) {
            // printf("alloced\n ");
        } else {
            // printf("not\n");
        }
        return false;
    }

    size_t freelinks = 0;
    for (size_t i = 0; i < 15; i++) {
        block_t *head = list_heads[i];
        printf("\nbucket %zu ", i);
        for (block_t *curr = head; curr != NULL; curr = curr->next) {

            printf("node size %zu |", get_size(curr));

            if (i != find_size_list(get_size(curr))) {
                // printf("false line 751");
                return false;
            }
            freelinks++;
            if (get_alloc(curr)) {
                // printf("false line 756");
                return false;
            }
            if (curr < (block_t *)mem_heap_lo() ||
                curr > (block_t *)mem_heap_hi()) {
                // printf("false line 761");
                return false;
            }
            if (curr != head && curr->next != NULL &&
                get_size(curr->next) > min_block_size) {
                if (!(curr == curr->next->prev)) {
                    // printf("false line 765");
                    return false;
                }
            }
        }
    }
    // printf("\n");
    if (freelinks != freeblocks) {

        // printf("false line 774 free links %zu free blocks %zu", freelinks,
        // freeblocks);
        return false;
    }

    return true;
}

/**
 * @brief
 *
 * Initializes global variables and sets up the heap
 * including the epilogue and prologue blocks
 *
 * @return true if it was successful, false otherwise
 */
bool mm_init(void) {
    // Create the initial empty heap
    word_t *start = (word_t *)(mem_sbrk(2 * wsize));

    for (size_t i = 0; i < 15; i++) {
        list_heads[i] = NULL;
    }

    if (start == (void *)-1) {
        return false;
    }

    start[0] = pack(0, true, false, false); // Heap prologue (block footer)
    start[1] = pack(0, true, true, false);  // Heap epilogue (block header)

    // Heap starts with first "block header", currently the epilogue
    heap_start = (block_t *)&(start[1]);

    // // printf("\n\ninit");

    // Extend the empty heap with a free block of chunksize bytes
    if (extend_heap(chunksize) == NULL) {
        return false;
    }

    return true;
}

/**
 * @brief
 *
 * allocates the amount of memory given onto the heap
 * requires the size to be non negative
 * @param[in] size size that wants to be alloced onto heap
 * @return no return
 */
void *malloc(size_t size) {

    dbg_requires(mm_checkheap(__LINE__));

    size_t asize;      // Adjusted block size
    size_t extendsize; // Amount to extend heap if no fit is found
    block_t *block;
    void *bp = NULL;

    // Initialize heap if it isn't initialized
    if (heap_start == NULL) {
        mm_init();
    }

    // Ignore spurious request
    if (size == 0) {
        dbg_ensures(mm_checkheap(__LINE__));
        // // printf("\nmalloc END\n");
        return bp;
    }

    // Adjust block size to include overhead and to meet alignment requirements
    asize = max(round_up(size + wsize, dsize), min_block_size);

    // Search the free list for a fit
    block = find_fit(asize);

    // If no fit is found, request more memory, and then and place the block
    if (block == NULL) {
        // Always request at least chunksize
        extendsize = max(asize, chunksize);
        block = extend_heap(extendsize);
        // extend_heap returns an error
        if (block == NULL) {
            return bp;
        }
    }

    // The block should be marked as free
    dbg_assert(!get_alloc(block));

    // Take the free block out of the explicit list
    block_removal(block);

    // Mark block as allocated
    size_t block_size = get_size(block);
    write_block(block, block_size, true, get_alloc_prev(block));

    // Try to split the block if too large
    split_block(block, asize);

    bp = header_to_payload(block);

    block_t *ne = find_next(block);
    if (get_alloc(ne) && get_size(ne) == 0) {
        write_epilogue(ne, true);
    }

    dbg_ensures(mm_checkheap(__LINE__));

    return bp;
}

/**
 * @brief
 *
 * frees the given memory that is no longer in use
 *
 * @param[in] bp block pointer that points to the block that needs to be freed
 */
void free(void *bp) {
    dbg_requires(mm_checkheap(__LINE__));
    if (bp == NULL) {
        return;
    }

    block_t *block = payload_to_header(bp);
    size_t size = get_size(block);

    // The block should be marked as allocated
    dbg_assert(get_alloc(block));

    // Mark the block as free

    write_block(block, size, false, get_alloc_prev(block));

    // Try to coalesce the block with its neighbors
    block_t *result = coalesce_block(block);

    // Insert block into seglist
    block_insertion(result);

    dbg_ensures(mm_checkheap(__LINE__));
}

/**
 * @brief
 *
 * allocates the memory from the start
 *
 * @param[in] ptr points to the first block
 * @param[in] size size of memory to be allocated
 * @return
 */
void *realloc(void *ptr, size_t size) {
    block_t *block = payload_to_header(ptr);
    size_t copysize;
    void *newptr;

    // If size == 0, then free block and return NULL
    if (size == 0) {
        free(ptr);
        return NULL;
    }

    // If ptr is NULL, then equivalent to malloc
    if (ptr == NULL) {
        return malloc(size);
    }

    // Otherwise, proceed with reallocation
    newptr = malloc(size);

    // If malloc fails, the original block is left untouched
    if (newptr == NULL) {
        return NULL;
    }

    // Copy the old data
    copysize = get_payload_size(block); // gets size of old payload
    if (size < copysize) {
        copysize = size;
    }
    memcpy(newptr, ptr, copysize);

    // Free the old block
    free(ptr);

    return newptr;
}

/**
 * @brief
 *
 * <What does this function do?>
 * Tries to allocate memory and returns heap
 * if successful and returns null if unsuccessful
 *
 * @param[in] elements the number of elements needed
 * @param[in] size the size each element is
 * @return
 */
void *calloc(size_t elements, size_t size) {
    void *bp;
    size_t asize = elements * size;

    if (elements == 0) {
        return NULL;
    }
    if (asize / elements != size) {
        // Multiplication overflowed
        return NULL;
    }

    bp = malloc(asize);
    if (bp == NULL) {
        return NULL;
    }

    // Initialize all bits to 0
    memset(bp, 0, asize);

    return bp;
}

/*
 *****************************************************************************
 * Do not delete the following super-secret(tm) lines!                       *
 *                                                                           *
 * 53 6f 20 79 6f 75 27 72 65 20 74 72 79 69 6e 67 20 74 6f 20               *
 *                                                                           *
 * 66 69 67 75 72 65 20 6f 75 74 20 77 68 61 74 20 74 68 65 20               *
 * 68 65 78 61 64 65 63 69 6d 61 6c 20 64 69 67 69 74 73 20 64               *
 * 6f 2e 2e 2e 20 68 61 68 61 68 61 21 20 41 53 43 49 49 20 69               *
 *                                                                           *
 * 73 6e 27 74 20 74 68 65 20 72 69 67 68 74 20 65 6e 63 6f 64               *
 * 69 6e 67 21 20 4e 69 63 65 20 74 72 79 2c 20 74 68 6f 75 67               *
 * 68 21 20 2d 44 72 2e 20 45 76 69 6c 0a c5 7c fc 80 6e 57 0a               *
 *                                                                           *
 *****************************************************************************
 */
