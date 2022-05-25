; ModuleID = 'mm.c'
source_filename = "mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.block = type { i64, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { %struct.block*, %struct.block* }

@heap_start = internal unnamed_addr global %struct.block* null, align 8, !dbg !0
@list_heads = common dso_local local_unnamed_addr global [15 x %struct.block*] zeroinitializer, align 16, !dbg !47
@.str = private unnamed_addr constant [13 x i8] c"\0Abucket %zu \00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"node size %zu |\00", align 1

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @mm_checkheap(i32) local_unnamed_addr #0 !dbg !65 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !70, metadata !DIExpression()), !dbg !83
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !84, !tbaa !85
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !89, metadata !DIExpression()), !dbg !94
  %3 = getelementptr %struct.block, %struct.block* %2, i64 0, i32 0, !dbg !96
  %4 = getelementptr inbounds i64, i64* %3, i64 -1, !dbg !97
  call void @llvm.dbg.value(metadata i64* %4, metadata !71, metadata !DIExpression()), !dbg !98
  %5 = load i64, i64* %4, align 8, !dbg !99, !tbaa !101
  call void @llvm.dbg.value(metadata i64 %5, metadata !103, metadata !DIExpression()), !dbg !108
  %6 = and i64 %5, -15, !dbg !110
  %7 = icmp eq i64 %6, 1, !dbg !110
  call void @llvm.dbg.value(metadata i64 %5, metadata !111, metadata !DIExpression()), !dbg !116
  br i1 %7, label %8, label %125, !dbg !110

; <label>:8:                                      ; preds = %1
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !74, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i64 0, metadata !72, metadata !DIExpression()), !dbg !119
  %9 = load i64, i64* %3, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %9, metadata !111, metadata !DIExpression()), !dbg !122
  %10 = and i64 %9, -16, !dbg !132
  %11 = icmp eq i64 %10, 0, !dbg !133
  call void @llvm.dbg.value(metadata i64 %9, metadata !103, metadata !DIExpression()), !dbg !134
  %12 = and i64 %9, 1, !dbg !143
  %13 = icmp ne i64 %12, 0, !dbg !144
  br i1 %11, label %35, label %14, !dbg !145

; <label>:14:                                     ; preds = %8, %23
  %15 = phi i1 [ %34, %23 ], [ %13, %8 ]
  %16 = phi i64 [ %31, %23 ], [ %10, %8 ]
  %17 = phi %struct.block* [ %28, %23 ], [ %2, %8 ]
  %18 = phi i1 [ %25, %23 ], [ false, %8 ]
  %19 = phi i64 [ %24, %23 ], [ 0, %8 ]
  call void @llvm.dbg.value(metadata %struct.block* %17, metadata !74, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i64 %19, metadata !72, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.value(metadata i64 undef, metadata !111, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.value(metadata i64 undef, metadata !103, metadata !DIExpression()), !dbg !151
  br i1 %15, label %23, label %20, !dbg !155

; <label>:20:                                     ; preds = %14
  br i1 %18, label %125, label %21, !dbg !156

; <label>:21:                                     ; preds = %20
  %22 = add i64 %19, 1, !dbg !158
  call void @llvm.dbg.value(metadata i64 %22, metadata !72, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.value(metadata i8 1, metadata !73, metadata !DIExpression()), !dbg !159
  br label %23, !dbg !160

; <label>:23:                                     ; preds = %14, %21
  %24 = phi i64 [ %22, %21 ], [ %19, %14 ], !dbg !161
  %25 = phi i1 [ true, %21 ], [ false, %14 ], !dbg !162
  call void @llvm.dbg.value(metadata %struct.block* %17, metadata !165, metadata !DIExpression()), !dbg !170
  %26 = bitcast %struct.block* %17 to i8*, !dbg !172
  call void @llvm.dbg.value(metadata i64 undef, metadata !111, metadata !DIExpression()), !dbg !173
  %27 = getelementptr inbounds i8, i8* %26, i64 %16, !dbg !176
  %28 = bitcast i8* %27 to %struct.block*, !dbg !177
  call void @llvm.dbg.value(metadata %struct.block* %28, metadata !74, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.value(metadata i64 %24, metadata !72, metadata !DIExpression()), !dbg !119
  %29 = bitcast i8* %27 to i64*
  %30 = load i64, i64* %29, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %30, metadata !111, metadata !DIExpression()), !dbg !122
  %31 = and i64 %30, -16, !dbg !132
  %32 = icmp eq i64 %31, 0, !dbg !133
  call void @llvm.dbg.value(metadata i64 %30, metadata !103, metadata !DIExpression()), !dbg !134
  %33 = and i64 %30, 1, !dbg !143
  %34 = icmp ne i64 %33, 0, !dbg !144
  br i1 %32, label %35, label %14, !dbg !145, !llvm.loop !178

; <label>:35:                                     ; preds = %23, %8
  %36 = phi i64 [ 0, %8 ], [ %24, %23 ], !dbg !119
  %37 = phi i1 [ %13, %8 ], [ %34, %23 ], !dbg !144
  call void @llvm.dbg.value(metadata i64 %36, metadata !72, metadata !DIExpression()), !dbg !119
  br i1 %37, label %38, label %125, !dbg !180

; <label>:38:                                     ; preds = %35, %119
  %39 = phi i64 [ %121, %119 ], [ 0, %35 ]
  %40 = phi i64 [ %120, %119 ], [ 0, %35 ]
  call void @llvm.dbg.value(metadata i64 %39, metadata !76, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.value(metadata i64 %40, metadata !75, metadata !DIExpression()), !dbg !182
  %41 = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %39, !dbg !183
  %42 = load %struct.block*, %struct.block** %41, align 8, !dbg !183, !tbaa !85
  call void @llvm.dbg.value(metadata %struct.block* %42, metadata !78, metadata !DIExpression()), !dbg !184
  %43 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 %39), !dbg !185
  call void @llvm.dbg.value(metadata %struct.block* %42, metadata !81, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.value(metadata i64 %40, metadata !75, metadata !DIExpression()), !dbg !182
  %44 = icmp eq %struct.block* %42, null, !dbg !187
  br i1 %44, label %119, label %45, !dbg !189

; <label>:45:                                     ; preds = %38
  %46 = getelementptr inbounds %struct.block, %struct.block* %42, i64 0, i32 1, i32 0, i32 0
  br label %47

; <label>:47:                                     ; preds = %45, %116
  %48 = phi %struct.block* [ %117, %116 ], [ %42, %45 ]
  %49 = phi i64 [ %88, %116 ], [ %40, %45 ]
  call void @llvm.dbg.value(metadata %struct.block* %48, metadata !81, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.value(metadata i64 %49, metadata !75, metadata !DIExpression()), !dbg !182
  %50 = getelementptr %struct.block, %struct.block* %48, i64 0, i32 0
  %51 = load i64, i64* %50, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %51, metadata !111, metadata !DIExpression()), !dbg !190
  %52 = and i64 %51, -16, !dbg !194
  %53 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i64 %52), !dbg !195
  %54 = load i64, i64* %50, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %54, metadata !111, metadata !DIExpression()), !dbg !196
  %55 = and i64 %54, -16, !dbg !200
  call void @llvm.dbg.value(metadata i64 %55, metadata !201, metadata !DIExpression()), !dbg !206
  %56 = icmp ult i64 %55, 17, !dbg !208
  br i1 %56, label %84, label %57, !dbg !210

; <label>:57:                                     ; preds = %47
  %58 = icmp ult i64 %55, 33, !dbg !211
  br i1 %58, label %84, label %59, !dbg !213

; <label>:59:                                     ; preds = %57
  %60 = icmp ult i64 %55, 49, !dbg !214
  br i1 %60, label %84, label %61, !dbg !216

; <label>:61:                                     ; preds = %59
  %62 = icmp ult i64 %55, 65, !dbg !217
  br i1 %62, label %84, label %63, !dbg !219

; <label>:63:                                     ; preds = %61
  %64 = icmp ult i64 %55, 90, !dbg !220
  br i1 %64, label %84, label %65, !dbg !222

; <label>:65:                                     ; preds = %63
  %66 = icmp ult i64 %55, 113, !dbg !223
  br i1 %66, label %84, label %67, !dbg !225

; <label>:67:                                     ; preds = %65
  %68 = icmp ult i64 %55, 129, !dbg !226
  br i1 %68, label %84, label %69, !dbg !228

; <label>:69:                                     ; preds = %67
  %70 = icmp ult i64 %55, 145, !dbg !229
  br i1 %70, label %84, label %71, !dbg !231

; <label>:71:                                     ; preds = %69
  %72 = icmp ult i64 %55, 161, !dbg !232
  br i1 %72, label %84, label %73, !dbg !234

; <label>:73:                                     ; preds = %71
  %74 = icmp ult i64 %55, 177, !dbg !235
  br i1 %74, label %84, label %75, !dbg !237

; <label>:75:                                     ; preds = %73
  %76 = icmp ult i64 %55, 257, !dbg !238
  br i1 %76, label %84, label %77, !dbg !240

; <label>:77:                                     ; preds = %75
  %78 = icmp ult i64 %55, 513, !dbg !241
  br i1 %78, label %84, label %79, !dbg !243

; <label>:79:                                     ; preds = %77
  %80 = icmp ult i64 %55, 900, !dbg !244
  br i1 %80, label %84, label %81, !dbg !246

; <label>:81:                                     ; preds = %79
  %82 = icmp ult i64 %55, 5000, !dbg !247
  %83 = select i1 %82, i64 13, i64 14, !dbg !249
  br label %84, !dbg !249

; <label>:84:                                     ; preds = %47, %57, %59, %61, %63, %65, %67, %69, %71, %73, %75, %77, %79, %81
  %85 = phi i64 [ 0, %47 ], [ 1, %57 ], [ 2, %59 ], [ 3, %61 ], [ 4, %63 ], [ 5, %65 ], [ 6, %67 ], [ 7, %69 ], [ 8, %71 ], [ 9, %73 ], [ 10, %75 ], [ 11, %77 ], [ 12, %79 ], [ %83, %81 ], !dbg !251
  %86 = icmp eq i64 %39, %85, !dbg !253
  br i1 %86, label %87, label %125, !dbg !254

; <label>:87:                                     ; preds = %84
  %88 = add i64 %49, 1, !dbg !255
  call void @llvm.dbg.value(metadata i64 %54, metadata !103, metadata !DIExpression()), !dbg !256
  %89 = and i64 %54, 1, !dbg !260
  %90 = icmp eq i64 %89, 0, !dbg !261
  br i1 %90, label %91, label %125, !dbg !262

; <label>:91:                                     ; preds = %87
  %92 = tail call i8* @mem_heap_lo() #5, !dbg !263
  %93 = bitcast i8* %92 to %struct.block*, !dbg !265
  %94 = icmp ult %struct.block* %48, %93, !dbg !266
  br i1 %94, label %125, label %95, !dbg !267

; <label>:95:                                     ; preds = %91
  %96 = tail call i8* @mem_heap_hi() #5, !dbg !268
  %97 = bitcast i8* %96 to %struct.block*, !dbg !269
  %98 = icmp ugt %struct.block* %48, %97, !dbg !270
  br i1 %98, label %125, label %99, !dbg !271

; <label>:99:                                     ; preds = %95
  %100 = icmp eq %struct.block* %48, %42, !dbg !272
  br i1 %100, label %101, label %103, !dbg !274

; <label>:101:                                    ; preds = %99
  %102 = load %struct.block*, %struct.block** %46, align 8, !dbg !275, !tbaa !276
  br label %116, !dbg !274

; <label>:103:                                    ; preds = %99
  %104 = getelementptr inbounds %struct.block, %struct.block* %48, i64 0, i32 1, i32 0, i32 0, !dbg !277
  %105 = load %struct.block*, %struct.block** %104, align 8, !dbg !277, !tbaa !276
  %106 = icmp eq %struct.block* %105, null, !dbg !278
  br i1 %106, label %119, label %107, !dbg !279

; <label>:107:                                    ; preds = %103
  %108 = getelementptr %struct.block, %struct.block* %105, i64 0, i32 0
  %109 = load i64, i64* %108, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %109, metadata !111, metadata !DIExpression()), !dbg !280
  %110 = and i64 %109, -16, !dbg !283
  %111 = icmp ugt i64 %110, 16, !dbg !284
  br i1 %111, label %112, label %116, !dbg !285

; <label>:112:                                    ; preds = %107
  %113 = getelementptr inbounds %struct.block, %struct.block* %105, i64 0, i32 1, i32 0, i32 1, !dbg !286
  %114 = load %struct.block*, %struct.block** %113, align 8, !dbg !286, !tbaa !276
  %115 = icmp eq %struct.block* %48, %114, !dbg !289
  br i1 %115, label %116, label %125, !dbg !290

; <label>:116:                                    ; preds = %101, %107, %112
  %117 = phi %struct.block* [ %102, %101 ], [ %105, %107 ], [ %105, %112 ], !dbg !275
  call void @llvm.dbg.value(metadata %struct.block* %117, metadata !81, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.value(metadata i64 %88, metadata !75, metadata !DIExpression()), !dbg !182
  %118 = icmp eq %struct.block* %117, null, !dbg !187
  br i1 %118, label %119, label %47, !dbg !189, !llvm.loop !291

; <label>:119:                                    ; preds = %103, %116, %38
  %120 = phi i64 [ %40, %38 ], [ %88, %116 ], [ %88, %103 ], !dbg !293
  call void @llvm.dbg.value(metadata i64 undef, metadata !75, metadata !DIExpression()), !dbg !182
  %121 = add nuw nsw i64 %39, 1, !dbg !294
  call void @llvm.dbg.value(metadata i64 %121, metadata !76, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.value(metadata i64 %120, metadata !75, metadata !DIExpression()), !dbg !182
  %122 = icmp ult i64 %121, 15, !dbg !295
  br i1 %122, label %38, label %123, !dbg !296, !llvm.loop !297

; <label>:123:                                    ; preds = %119
  call void @llvm.dbg.value(metadata i64 %120, metadata !75, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %120, metadata !75, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %120, metadata !75, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %120, metadata !75, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %120, metadata !75, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.value(metadata i64 %120, metadata !75, metadata !DIExpression()), !dbg !182
  %124 = icmp eq i64 %120, %36, !dbg !299
  br label %125

; <label>:125:                                    ; preds = %20, %112, %91, %95, %84, %87, %123, %35, %1
  %126 = phi i1 [ false, %1 ], [ false, %35 ], [ %124, %123 ], [ false, %87 ], [ false, %84 ], [ false, %95 ], [ false, %91 ], [ false, %112 ], [ false, %20 ], !dbg !301
  ret i1 %126, !dbg !303
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

declare dso_local i8* @mem_heap_lo() local_unnamed_addr #2

declare dso_local i8* @mem_heap_hi() local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @mm_init() local_unnamed_addr #0 !dbg !304 {
  %1 = tail call i8* @mem_sbrk(i64 16) #5, !dbg !311
  call void @llvm.dbg.value(metadata i64 0, metadata !309, metadata !DIExpression()), !dbg !312
  call void @llvm.memset.p0i8.i64(i8* align 16 bitcast ([15 x %struct.block*]* @list_heads to i8*), i8 0, i64 120, i1 false), !dbg !313
  %2 = icmp eq i8* %1, inttoptr (i64 -1 to i8*), !dbg !316
  br i1 %2, label %8, label %3, !dbg !318

; <label>:3:                                      ; preds = %0
  call void @llvm.dbg.value(metadata i8* %1, metadata !308, metadata !DIExpression()), !dbg !319
  %4 = getelementptr inbounds i8, i8* %1, i64 8, !dbg !320
  %5 = bitcast i8* %1 to <2 x i64>*, !dbg !321
  store <2 x i64> <i64 1, i64 3>, <2 x i64>* %5, align 8, !dbg !321, !tbaa !101
  store i8* %4, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !322, !tbaa !85
  %6 = tail call fastcc %struct.block* @extend_heap(i64 4096), !dbg !323
  %7 = icmp ne %struct.block* %6, null, !dbg !325
  br label %8, !dbg !326

; <label>:8:                                      ; preds = %3, %0
  %9 = phi i1 [ false, %0 ], [ %7, %3 ], !dbg !328
  ret i1 %9, !dbg !329
}

declare dso_local i8* @mem_sbrk(i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define internal fastcc %struct.block* @extend_heap(i64) unnamed_addr #0 !dbg !330 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !334, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.value(metadata i64 %0, metadata !339, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata i64 16, metadata !344, metadata !DIExpression()), !dbg !347
  %2 = add i64 %0, 15, !dbg !348
  %3 = and i64 %2, -16, !dbg !349
  call void @llvm.dbg.value(metadata i64 %3, metadata !334, metadata !DIExpression()), !dbg !338
  %4 = tail call i8* @mem_sbrk(i64 %3) #5, !dbg !350
  call void @llvm.dbg.value(metadata i8* %4, metadata !335, metadata !DIExpression()), !dbg !352
  %5 = icmp eq i8* %4, inttoptr (i64 -1 to i8*), !dbg !353
  br i1 %5, label %84, label %6, !dbg !354

; <label>:6:                                      ; preds = %1
  call void @llvm.dbg.value(metadata i8* %4, metadata !355, metadata !DIExpression()), !dbg !360
  %7 = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !362
  %8 = bitcast i8* %7 to %struct.block*, !dbg !363
  call void @llvm.dbg.value(metadata %struct.block* %8, metadata !336, metadata !DIExpression()), !dbg !364
  %9 = bitcast i8* %7 to i64*
  %10 = load i64, i64* %9, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %10, metadata !365, metadata !DIExpression()), !dbg !368
  %11 = and i64 %10, 2, !dbg !374
  call void @llvm.dbg.value(metadata %struct.block* %8, metadata !375, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.value(metadata i64 %3, metadata !380, metadata !DIExpression()), !dbg !389
  call void @llvm.dbg.value(metadata i1 false, metadata !381, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i64 %10, metadata !391, metadata !DIExpression()), !dbg !394
  %12 = and i64 %10, 4, !dbg !400
  call void @llvm.dbg.value(metadata i64 %3, metadata !401, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.value(metadata i64 %3, metadata !409, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i64 %3, metadata !409, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.value(metadata i64 %3, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !413
  %13 = or i64 %11, %3, !dbg !414
  call void @llvm.dbg.value(metadata i64 %13, metadata !409, metadata !DIExpression()), !dbg !413
  %14 = or i64 %13, %12, !dbg !415
  call void @llvm.dbg.value(metadata i64 %14, metadata !409, metadata !DIExpression()), !dbg !413
  store i64 %14, i64* %9, align 8, !dbg !416, !tbaa !120
  %15 = icmp ugt i64 %3, 16, !dbg !417
  br i1 %15, label %16, label %21, !dbg !418

; <label>:16:                                     ; preds = %6
  call void @llvm.dbg.value(metadata %struct.block* %8, metadata !419, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.value(metadata i64 %14, metadata !111, metadata !DIExpression()), !dbg !424
  %17 = getelementptr inbounds i8, i8* %4, i64 %3, !dbg !427
  %18 = getelementptr inbounds i8, i8* %17, i64 -16, !dbg !428
  %19 = bitcast i8* %18 to i64*, !dbg !429
  call void @llvm.dbg.value(metadata i64* %19, metadata !383, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.value(metadata i64 %14, metadata !391, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata i64 %3, metadata !401, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !436
  call void @llvm.dbg.value(metadata i64 %3, metadata !409, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i64 %3, metadata !409, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i64 %3, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !437
  call void @llvm.dbg.value(metadata i64 %13, metadata !409, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i64 %14, metadata !409, metadata !DIExpression()), !dbg !437
  store i64 %14, i64* %19, align 8, !dbg !438, !tbaa !101
  %20 = load i64, i64* %9, align 8, !tbaa !120
  br label %21, !dbg !439

; <label>:21:                                     ; preds = %6, %16
  %22 = phi i64 [ %14, %6 ], [ %20, %16 ]
  call void @llvm.dbg.value(metadata %struct.block* %8, metadata !165, metadata !DIExpression()), !dbg !440
  call void @llvm.dbg.value(metadata i64 %22, metadata !111, metadata !DIExpression()), !dbg !442
  %23 = and i64 %22, -16, !dbg !445
  %24 = getelementptr inbounds i8, i8* %7, i64 %23, !dbg !446
  call void @llvm.dbg.value(metadata i8* %24, metadata !386, metadata !DIExpression()), !dbg !447
  %25 = icmp ult i64 %3, 17, !dbg !448
  %26 = bitcast i8* %24 to i64*
  %27 = load i64, i64* %26, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %27, metadata !111, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64 %27, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !454
  call void @llvm.dbg.value(metadata i64 %27, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !457
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !460
  %28 = and i64 %27, -15, !dbg !461
  call void @llvm.dbg.value(metadata i64 %28, metadata !409, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata i64 %28, metadata !409, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.value(metadata i64 %28, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !462
  call void @llvm.dbg.value(metadata i64 %28, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !463
  call void @llvm.dbg.value(metadata i64 %28, metadata !409, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata i64 %28, metadata !409, metadata !DIExpression()), !dbg !463
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !464
  call void @llvm.dbg.value(metadata i64 %27, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !462
  %29 = or i64 %28, 4, !dbg !465
  call void @llvm.dbg.value(metadata i64 %29, metadata !409, metadata !DIExpression()), !dbg !462
  %30 = select i1 %25, i64 %29, i64 %28, !dbg !468
  store i64 %30, i64* %26, align 8, !dbg !469, !tbaa !120
  call void @llvm.dbg.value(metadata %struct.block* %8, metadata !165, metadata !DIExpression()), !dbg !470
  %31 = load i64, i64* %9, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %31, metadata !111, metadata !DIExpression()), !dbg !472
  %32 = and i64 %31, -16, !dbg !475
  %33 = getelementptr inbounds i8, i8* %7, i64 %32, !dbg !476
  call void @llvm.dbg.value(metadata i8* %33, metadata !337, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.value(metadata i8* %33, metadata !478, metadata !DIExpression()), !dbg !484
  call void @llvm.dbg.value(metadata i1 false, metadata !483, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.value(metadata i64 0, metadata !401, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.value(metadata i1 true, metadata !406, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !490
  call void @llvm.dbg.value(metadata i1 false, metadata !408, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.value(metadata i64 0, metadata !409, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata i64 1, metadata !409, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata i64 3, metadata !409, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata i64 1, metadata !409, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.value(metadata i64 1, metadata !409, metadata !DIExpression()), !dbg !492
  %34 = bitcast i8* %33 to i64*, !dbg !493
  store i64 1, i64* %34, align 8, !dbg !494, !tbaa !120
  %35 = tail call fastcc %struct.block* @coalesce_block(%struct.block* nonnull %8), !dbg !495
  call void @llvm.dbg.value(metadata %struct.block* %35, metadata !336, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.value(metadata %struct.block* %35, metadata !496, metadata !DIExpression()), !dbg !500
  %36 = getelementptr %struct.block, %struct.block* %35, i64 0, i32 0
  %37 = load i64, i64* %36, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %37, metadata !111, metadata !DIExpression()), !dbg !502
  %38 = and i64 %37, -16, !dbg !506
  %39 = icmp ult i64 %38, 17, !dbg !507
  br i1 %39, label %40, label %44, !dbg !508

; <label>:40:                                     ; preds = %21
  call void @llvm.dbg.value(metadata %struct.block* %35, metadata !509, metadata !DIExpression()), !dbg !512
  %41 = load i64, i64* bitcast ([15 x %struct.block*]* @list_heads to i64*), align 16, !dbg !515, !tbaa !85
  %42 = getelementptr inbounds %struct.block, %struct.block* %35, i64 0, i32 1, !dbg !516
  %43 = bitcast %union.anon* %42 to i64*, !dbg !517
  store i64 %41, i64* %43, align 8, !dbg !517, !tbaa !276
  store %struct.block* %35, %struct.block** getelementptr inbounds ([15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 0), align 16, !dbg !518, !tbaa !85
  br label %84, !dbg !519

; <label>:44:                                     ; preds = %21
  call void @llvm.dbg.value(metadata i64 %37, metadata !111, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i64 %38, metadata !201, metadata !DIExpression()), !dbg !523
  %45 = icmp ult i64 %38, 33, !dbg !525
  br i1 %45, label %71, label %46, !dbg !526

; <label>:46:                                     ; preds = %44
  %47 = icmp ult i64 %38, 49, !dbg !527
  br i1 %47, label %71, label %48, !dbg !528

; <label>:48:                                     ; preds = %46
  %49 = icmp ult i64 %38, 65, !dbg !529
  br i1 %49, label %71, label %50, !dbg !530

; <label>:50:                                     ; preds = %48
  %51 = icmp ult i64 %38, 90, !dbg !531
  br i1 %51, label %71, label %52, !dbg !532

; <label>:52:                                     ; preds = %50
  %53 = icmp ult i64 %38, 113, !dbg !533
  br i1 %53, label %71, label %54, !dbg !534

; <label>:54:                                     ; preds = %52
  %55 = icmp ult i64 %38, 129, !dbg !535
  br i1 %55, label %71, label %56, !dbg !536

; <label>:56:                                     ; preds = %54
  %57 = icmp ult i64 %38, 145, !dbg !537
  br i1 %57, label %71, label %58, !dbg !538

; <label>:58:                                     ; preds = %56
  %59 = icmp ult i64 %38, 161, !dbg !539
  br i1 %59, label %71, label %60, !dbg !540

; <label>:60:                                     ; preds = %58
  %61 = icmp ult i64 %38, 177, !dbg !541
  br i1 %61, label %71, label %62, !dbg !542

; <label>:62:                                     ; preds = %60
  %63 = icmp ult i64 %38, 257, !dbg !543
  br i1 %63, label %71, label %64, !dbg !544

; <label>:64:                                     ; preds = %62
  %65 = icmp ult i64 %38, 513, !dbg !545
  br i1 %65, label %71, label %66, !dbg !546

; <label>:66:                                     ; preds = %64
  %67 = icmp ult i64 %38, 900, !dbg !547
  br i1 %67, label %71, label %68, !dbg !548

; <label>:68:                                     ; preds = %66
  %69 = icmp ult i64 %38, 5000, !dbg !549
  %70 = select i1 %69, i64 13, i64 14, !dbg !550
  br label %71, !dbg !550

; <label>:71:                                     ; preds = %68, %66, %64, %62, %60, %58, %56, %54, %52, %50, %48, %46, %44
  %72 = phi i64 [ 1, %44 ], [ 2, %46 ], [ 3, %48 ], [ 4, %50 ], [ 5, %52 ], [ 6, %54 ], [ 7, %56 ], [ 8, %58 ], [ 9, %60 ], [ 10, %62 ], [ 11, %64 ], [ 12, %66 ], [ %70, %68 ], !dbg !551
  call void @llvm.dbg.value(metadata i64 %72, metadata !499, metadata !DIExpression()), !dbg !552
  %73 = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %72, !dbg !553
  %74 = bitcast %struct.block** %73 to i64*, !dbg !553
  %75 = load i64, i64* %74, align 8, !dbg !553, !tbaa !85
  %76 = getelementptr inbounds %struct.block, %struct.block* %35, i64 0, i32 1, !dbg !554
  %77 = bitcast %union.anon* %76 to i64*, !dbg !555
  store i64 %75, i64* %77, align 8, !dbg !555, !tbaa !276
  %78 = getelementptr inbounds %struct.block, %struct.block* %35, i64 0, i32 1, i32 0, i32 1, !dbg !556
  store %struct.block* null, %struct.block** %78, align 8, !dbg !557, !tbaa !276
  %79 = load %struct.block*, %struct.block** %73, align 8, !dbg !558, !tbaa !85
  %80 = icmp eq %struct.block* %79, null, !dbg !560
  br i1 %80, label %83, label %81, !dbg !561

; <label>:81:                                     ; preds = %71
  %82 = getelementptr inbounds %struct.block, %struct.block* %79, i64 0, i32 1, i32 0, i32 1, !dbg !562
  store %struct.block* %35, %struct.block** %82, align 8, !dbg !564, !tbaa !276
  br label %83, !dbg !565

; <label>:83:                                     ; preds = %81, %71
  store %struct.block* %35, %struct.block** %73, align 8, !dbg !566, !tbaa !85
  br label %84

; <label>:84:                                     ; preds = %83, %40, %1
  %85 = phi %struct.block* [ null, %1 ], [ %35, %40 ], [ %35, %83 ], !dbg !567
  ret %struct.block* %85, !dbg !568
}

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_malloc(i64) local_unnamed_addr #0 !dbg !569 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !573, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.value(metadata i8* null, metadata !577, metadata !DIExpression()), !dbg !581
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !582, !tbaa !85
  %3 = icmp eq %struct.block* %2, null, !dbg !584
  br i1 %3, label %4, label %11, !dbg !585

; <label>:4:                                      ; preds = %1
  %5 = tail call i8* @mem_sbrk(i64 16) #5, !dbg !586
  call void @llvm.dbg.value(metadata i64 0, metadata !309, metadata !DIExpression()) #5, !dbg !589
  tail call void @llvm.memset.p0i8.i64(i8* align 16 bitcast ([15 x %struct.block*]* @list_heads to i8*), i8 0, i64 120, i1 false) #5, !dbg !590
  %6 = icmp eq i8* %5, inttoptr (i64 -1 to i8*), !dbg !591
  br i1 %6, label %11, label %7, !dbg !592

; <label>:7:                                      ; preds = %4
  call void @llvm.dbg.value(metadata i8* %5, metadata !308, metadata !DIExpression()) #5, !dbg !593
  %8 = getelementptr inbounds i8, i8* %5, i64 8, !dbg !594
  %9 = bitcast i8* %5 to <2 x i64>*, !dbg !595
  store <2 x i64> <i64 1, i64 3>, <2 x i64>* %9, align 8, !dbg !595, !tbaa !101
  store i8* %8, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !596, !tbaa !85
  %10 = tail call fastcc %struct.block* @extend_heap(i64 4096) #5, !dbg !597
  br label %11, !dbg !598

; <label>:11:                                     ; preds = %7, %4, %1
  %12 = icmp eq i64 %0, 0, !dbg !599
  br i1 %12, label %201, label %13, !dbg !601

; <label>:13:                                     ; preds = %11
  call void @llvm.dbg.value(metadata i64 %0, metadata !339, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !602
  call void @llvm.dbg.value(metadata i64 16, metadata !344, metadata !DIExpression()), !dbg !604
  %14 = add i64 %0, 23, !dbg !605
  %15 = and i64 %14, -16, !dbg !606
  call void @llvm.dbg.value(metadata i64 %15, metadata !607, metadata !DIExpression()), !dbg !611
  call void @llvm.dbg.value(metadata i64 16, metadata !610, metadata !DIExpression()), !dbg !613
  %16 = icmp ugt i64 %15, 16, !dbg !614
  %17 = select i1 %16, i64 %15, i64 16, !dbg !615
  call void @llvm.dbg.value(metadata i64 %17, metadata !574, metadata !DIExpression()), !dbg !616
  call void @llvm.dbg.value(metadata i64 %17, metadata !617, metadata !DIExpression()), !dbg !628
  call void @llvm.dbg.value(metadata i64 %17, metadata !201, metadata !DIExpression()), !dbg !630
  %18 = icmp ult i64 %17, 17, !dbg !632
  br i1 %18, label %46, label %19, !dbg !633

; <label>:19:                                     ; preds = %13
  %20 = icmp ult i64 %17, 33, !dbg !634
  br i1 %20, label %46, label %21, !dbg !635

; <label>:21:                                     ; preds = %19
  %22 = icmp ult i64 %17, 49, !dbg !636
  br i1 %22, label %46, label %23, !dbg !637

; <label>:23:                                     ; preds = %21
  %24 = icmp ult i64 %17, 65, !dbg !638
  br i1 %24, label %46, label %25, !dbg !639

; <label>:25:                                     ; preds = %23
  %26 = icmp ult i64 %17, 90, !dbg !640
  br i1 %26, label %46, label %27, !dbg !641

; <label>:27:                                     ; preds = %25
  %28 = icmp ult i64 %17, 113, !dbg !642
  br i1 %28, label %46, label %29, !dbg !643

; <label>:29:                                     ; preds = %27
  %30 = icmp ult i64 %17, 129, !dbg !644
  br i1 %30, label %46, label %31, !dbg !645

; <label>:31:                                     ; preds = %29
  %32 = icmp ult i64 %17, 145, !dbg !646
  br i1 %32, label %46, label %33, !dbg !647

; <label>:33:                                     ; preds = %31
  %34 = icmp ult i64 %17, 161, !dbg !648
  br i1 %34, label %46, label %35, !dbg !649

; <label>:35:                                     ; preds = %33
  %36 = icmp ult i64 %17, 177, !dbg !650
  br i1 %36, label %46, label %37, !dbg !651

; <label>:37:                                     ; preds = %35
  %38 = icmp ult i64 %17, 257, !dbg !652
  br i1 %38, label %46, label %39, !dbg !653

; <label>:39:                                     ; preds = %37
  %40 = icmp ult i64 %17, 513, !dbg !654
  br i1 %40, label %46, label %41, !dbg !655

; <label>:41:                                     ; preds = %39
  %42 = icmp ult i64 %17, 900, !dbg !656
  br i1 %42, label %46, label %43, !dbg !657

; <label>:43:                                     ; preds = %41
  %44 = icmp ult i64 %17, 5000, !dbg !658
  %45 = select i1 %44, i64 13, i64 14, !dbg !659
  br label %46, !dbg !659

; <label>:46:                                     ; preds = %43, %41, %39, %37, %35, %33, %31, %29, %27, %25, %23, %21, %19, %13
  %47 = phi i64 [ %45, %43 ], [ 12, %41 ], [ 11, %39 ], [ 10, %37 ], [ 9, %35 ], [ 8, %33 ], [ 7, %31 ], [ 6, %29 ], [ 5, %27 ], [ 4, %25 ], [ 3, %23 ], [ 2, %21 ], [ 1, %19 ], [ 0, %13 ]
  br label %51, !dbg !660

; <label>:48:                                     ; preds = %51, %56
  %49 = add nuw nsw i64 %52, 1, !dbg !661
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i64 0, metadata !621, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata i64 %52, metadata !620, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !664
  %50 = icmp ult i64 %49, 15, !dbg !665
  br i1 %50, label %51, label %79, !dbg !666, !llvm.loop !667

; <label>:51:                                     ; preds = %46, %48
  %52 = phi i64 [ %49, %48 ], [ %47, %46 ]
  call void @llvm.dbg.value(metadata i64 %52, metadata !620, metadata !DIExpression()), !dbg !664
  %53 = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %52, !dbg !660
  call void @llvm.dbg.value(metadata %struct.block** %53, metadata !625, metadata !DIExpression(DW_OP_deref)), !dbg !670
  %54 = load %struct.block*, %struct.block** %53, align 8, !dbg !671, !tbaa !276
  call void @llvm.dbg.value(metadata %struct.block* %54, metadata !625, metadata !DIExpression()), !dbg !670
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i64 0, metadata !621, metadata !DIExpression()), !dbg !663
  %55 = icmp eq %struct.block* %54, null, !dbg !673
  br i1 %55, label %48, label %58, !dbg !674

; <label>:56:                                     ; preds = %72
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  %57 = icmp eq %struct.block* %73, null, !dbg !675
  call void @llvm.dbg.value(metadata i64 0, metadata !621, metadata !DIExpression()), !dbg !663
  call void @llvm.dbg.value(metadata i64 %52, metadata !620, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !664
  br i1 %57, label %48, label %84, !dbg !677

; <label>:58:                                     ; preds = %51, %72
  %59 = phi %struct.block* [ %75, %72 ], [ %54, %51 ]
  %60 = phi %struct.block* [ %73, %72 ], [ null, %51 ]
  %61 = phi i64 [ %62, %72 ], [ 0, %51 ]
  call void @llvm.dbg.value(metadata %struct.block* %60, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i64 %61, metadata !621, metadata !DIExpression()), !dbg !663
  %62 = add nuw nsw i64 %61, 1, !dbg !678
  %63 = getelementptr %struct.block, %struct.block* %59, i64 0, i32 0
  %64 = load i64, i64* %63, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %64, metadata !111, metadata !DIExpression()), !dbg !680
  %65 = and i64 %64, -16, !dbg !683
  call void @llvm.dbg.value(metadata i64 %64, metadata !111, metadata !DIExpression()), !dbg !684
  %66 = icmp ult i64 %65, %17, !dbg !688
  br i1 %66, label %72, label %67, !dbg !689

; <label>:67:                                     ; preds = %58
  %68 = icmp eq %struct.block* %60, null, !dbg !690
  %69 = icmp ne i64 %65, %17, !dbg !691
  %70 = or i1 %68, %69, !dbg !692
  %71 = select i1 %70, %struct.block* %59, %struct.block* %60, !dbg !692
  br label %72, !dbg !692

; <label>:72:                                     ; preds = %67, %58
  %73 = phi %struct.block* [ %60, %58 ], [ %71, %67 ], !dbg !693
  %74 = getelementptr inbounds %struct.block, %struct.block* %59, i64 0, i32 1, i32 0, i32 0, !dbg !694
  call void @llvm.dbg.value(metadata %struct.block** %74, metadata !625, metadata !DIExpression(DW_OP_deref)), !dbg !670
  %75 = load %struct.block*, %struct.block** %74, align 8, !dbg !671, !tbaa !276
  call void @llvm.dbg.value(metadata %struct.block* %75, metadata !625, metadata !DIExpression()), !dbg !670
  call void @llvm.dbg.value(metadata %struct.block* %73, metadata !622, metadata !DIExpression()), !dbg !662
  call void @llvm.dbg.value(metadata i64 %62, metadata !621, metadata !DIExpression()), !dbg !663
  %76 = icmp ne %struct.block* %75, null, !dbg !673
  %77 = icmp ult i64 %62, 35, !dbg !695
  %78 = and i1 %77, %76, !dbg !696
  br i1 %78, label %58, label %56, !dbg !674, !llvm.loop !697

; <label>:79:                                     ; preds = %48
  call void @llvm.dbg.value(metadata i64 %17, metadata !607, metadata !DIExpression()), !dbg !700
  call void @llvm.dbg.value(metadata i64 4096, metadata !610, metadata !DIExpression()), !dbg !704
  %80 = icmp ugt i64 %17, 4096, !dbg !705
  %81 = select i1 %80, i64 %15, i64 4096, !dbg !706
  call void @llvm.dbg.value(metadata i64 %81, metadata !575, metadata !DIExpression()), !dbg !707
  %82 = tail call fastcc %struct.block* @extend_heap(i64 %81), !dbg !708
  call void @llvm.dbg.value(metadata %struct.block* %82, metadata !576, metadata !DIExpression()), !dbg !709
  %83 = icmp eq %struct.block* %82, null, !dbg !710
  br i1 %83, label %201, label %84, !dbg !712

; <label>:84:                                     ; preds = %56, %79
  %85 = phi %struct.block* [ %82, %79 ], [ %73, %56 ], !dbg !713
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !576, metadata !DIExpression()), !dbg !709
  tail call fastcc void @block_removal(%struct.block* nonnull %85), !dbg !714
  %86 = getelementptr %struct.block, %struct.block* %85, i64 0, i32 0
  %87 = load i64, i64* %86, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %87, metadata !111, metadata !DIExpression()), !dbg !715
  %88 = and i64 %87, -16, !dbg !718
  call void @llvm.dbg.value(metadata i64 %88, metadata !578, metadata !DIExpression()), !dbg !719
  call void @llvm.dbg.value(metadata i64 %87, metadata !365, metadata !DIExpression()), !dbg !720
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !375, metadata !DIExpression()), !dbg !723
  call void @llvm.dbg.value(metadata i64 %88, metadata !380, metadata !DIExpression()), !dbg !725
  call void @llvm.dbg.value(metadata i1 true, metadata !381, metadata !DIExpression()), !dbg !726
  call void @llvm.dbg.value(metadata i64 %87, metadata !391, metadata !DIExpression()), !dbg !727
  call void @llvm.dbg.value(metadata i64 %88, metadata !401, metadata !DIExpression()), !dbg !730
  call void @llvm.dbg.value(metadata i1 true, metadata !406, metadata !DIExpression()), !dbg !732
  call void @llvm.dbg.value(metadata i64 %88, metadata !409, metadata !DIExpression()), !dbg !733
  call void @llvm.dbg.value(metadata i64 %88, metadata !409, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !733
  call void @llvm.dbg.value(metadata i64 %88, metadata !409, metadata !DIExpression(DW_OP_constu, 3, DW_OP_or, DW_OP_stack_value)), !dbg !733
  call void @llvm.dbg.value(metadata i64 %87, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !733
  %89 = and i64 %87, -10, !dbg !734
  %90 = or i64 %89, 1, !dbg !734
  call void @llvm.dbg.value(metadata i64 %90, metadata !409, metadata !DIExpression()), !dbg !733
  store i64 %90, i64* %86, align 8, !dbg !735, !tbaa !120
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !165, metadata !DIExpression()), !dbg !736
  %91 = bitcast %struct.block* %85 to i8*, !dbg !738
  call void @llvm.dbg.value(metadata i64 %90, metadata !111, metadata !DIExpression()), !dbg !739
  %92 = getelementptr inbounds i8, i8* %91, i64 %88, !dbg !742
  call void @llvm.dbg.value(metadata i8* %92, metadata !386, metadata !DIExpression()), !dbg !743
  %93 = icmp ult i64 %88, 17, !dbg !744
  %94 = bitcast i8* %92 to i64*
  %95 = load i64, i64* %94, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %95, metadata !111, metadata !DIExpression()), !dbg !745
  call void @llvm.dbg.value(metadata i64 %95, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !748
  call void @llvm.dbg.value(metadata i64 %95, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !750
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !752
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !753
  %96 = and i64 %95, -15, !dbg !754
  call void @llvm.dbg.value(metadata i64 %96, metadata !409, metadata !DIExpression()), !dbg !755
  call void @llvm.dbg.value(metadata i64 %96, metadata !409, metadata !DIExpression()), !dbg !756
  call void @llvm.dbg.value(metadata i64 %96, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !755
  call void @llvm.dbg.value(metadata i64 %96, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !756
  call void @llvm.dbg.value(metadata i64 %96, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !755
  call void @llvm.dbg.value(metadata i64 %96, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !756
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !757
  call void @llvm.dbg.value(metadata i64 %95, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !755
  call void @llvm.dbg.value(metadata i64 %96, metadata !409, metadata !DIExpression(DW_OP_constu, 6, DW_OP_or, DW_OP_stack_value)), !dbg !755
  %97 = select i1 %93, i64 6, i64 2, !dbg !758
  %98 = or i64 %96, %97, !dbg !758
  store i64 %98, i64* %94, align 8, !dbg !759, !tbaa !120
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !760, metadata !DIExpression()), !dbg !770
  call void @llvm.dbg.value(metadata i64 %17, metadata !765, metadata !DIExpression()), !dbg !772
  %99 = load i64, i64* %86, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %99, metadata !111, metadata !DIExpression()), !dbg !773
  %100 = and i64 %99, -16, !dbg !776
  call void @llvm.dbg.value(metadata i64 %100, metadata !766, metadata !DIExpression()), !dbg !777
  %101 = sub i64 %100, %17, !dbg !778
  %102 = icmp eq i64 %101, 0, !dbg !779
  br i1 %102, label %190, label %103, !dbg !780

; <label>:103:                                    ; preds = %84
  call void @llvm.dbg.value(metadata i64 %99, metadata !365, metadata !DIExpression()), !dbg !781
  %104 = and i64 %99, 2, !dbg !784
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !375, metadata !DIExpression()), !dbg !785
  call void @llvm.dbg.value(metadata i64 %17, metadata !380, metadata !DIExpression()), !dbg !787
  call void @llvm.dbg.value(metadata i1 true, metadata !381, metadata !DIExpression()), !dbg !788
  call void @llvm.dbg.value(metadata i64 %99, metadata !391, metadata !DIExpression()), !dbg !789
  %105 = and i64 %99, 4, !dbg !792
  call void @llvm.dbg.value(metadata i64 %17, metadata !401, metadata !DIExpression()), !dbg !793
  call void @llvm.dbg.value(metadata i1 true, metadata !406, metadata !DIExpression()), !dbg !795
  call void @llvm.dbg.value(metadata i64 %17, metadata !409, metadata !DIExpression()), !dbg !796
  call void @llvm.dbg.value(metadata i64 %17, metadata !409, metadata !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value)), !dbg !796
  call void @llvm.dbg.value(metadata i64 %17, metadata !409, metadata !DIExpression(DW_OP_constu, 3, DW_OP_or, DW_OP_stack_value)), !dbg !796
  call void @llvm.dbg.value(metadata i64 undef, metadata !409, metadata !DIExpression()), !dbg !796
  %106 = or i64 %17, %104, !dbg !797
  %107 = or i64 %106, %105, !dbg !797
  %108 = or i64 %107, 1, !dbg !797
  call void @llvm.dbg.value(metadata i64 %108, metadata !409, metadata !DIExpression()), !dbg !796
  store i64 %108, i64* %86, align 8, !dbg !798, !tbaa !120
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !165, metadata !DIExpression()), !dbg !799
  call void @llvm.dbg.value(metadata i64 %108, metadata !111, metadata !DIExpression()), !dbg !801
  %109 = getelementptr inbounds i8, i8* %91, i64 %17, !dbg !804
  call void @llvm.dbg.value(metadata i8* %109, metadata !386, metadata !DIExpression()), !dbg !805
  %110 = bitcast i8* %109 to i64*
  %111 = load i64, i64* %110, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %111, metadata !111, metadata !DIExpression()), !dbg !806
  call void @llvm.dbg.value(metadata i64 %111, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !809
  call void @llvm.dbg.value(metadata i64 %111, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !811
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !813
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !814
  %112 = and i64 %111, -15, !dbg !815
  call void @llvm.dbg.value(metadata i64 %112, metadata !409, metadata !DIExpression()), !dbg !816
  call void @llvm.dbg.value(metadata i64 %112, metadata !409, metadata !DIExpression()), !dbg !817
  call void @llvm.dbg.value(metadata i64 %112, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !816
  call void @llvm.dbg.value(metadata i64 %112, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !817
  call void @llvm.dbg.value(metadata i64 %112, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !816
  call void @llvm.dbg.value(metadata i64 %112, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !817
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !818
  call void @llvm.dbg.value(metadata i64 %111, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !816
  call void @llvm.dbg.value(metadata i64 %112, metadata !409, metadata !DIExpression(DW_OP_constu, 6, DW_OP_or, DW_OP_stack_value)), !dbg !816
  %113 = select i1 %18, i64 6, i64 2, !dbg !819
  %114 = or i64 %112, %113, !dbg !819
  store i64 %114, i64* %110, align 8, !dbg !820, !tbaa !120
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !165, metadata !DIExpression()), !dbg !821
  %115 = load i64, i64* %86, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %115, metadata !111, metadata !DIExpression()), !dbg !823
  %116 = and i64 %115, -16, !dbg !826
  %117 = getelementptr inbounds i8, i8* %91, i64 %116, !dbg !827
  call void @llvm.dbg.value(metadata i64 %101, metadata !380, metadata !DIExpression()), !dbg !828
  call void @llvm.dbg.value(metadata i1 false, metadata !381, metadata !DIExpression()), !dbg !830
  call void @llvm.dbg.value(metadata i1 true, metadata !382, metadata !DIExpression()), !dbg !831
  %118 = bitcast i8* %117 to i64*
  %119 = load i64, i64* %118, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %119, metadata !391, metadata !DIExpression()), !dbg !832
  %120 = and i64 %119, 4, !dbg !835
  call void @llvm.dbg.value(metadata i64 %101, metadata !401, metadata !DIExpression()), !dbg !836
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !838
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !839
  call void @llvm.dbg.value(metadata i64 %101, metadata !409, metadata !DIExpression()), !dbg !840
  call void @llvm.dbg.value(metadata i64 %101, metadata !409, metadata !DIExpression()), !dbg !840
  %121 = or i64 %101, 2, !dbg !841
  call void @llvm.dbg.value(metadata i64 %121, metadata !409, metadata !DIExpression()), !dbg !840
  call void @llvm.dbg.value(metadata i64 %121, metadata !409, metadata !DIExpression()), !dbg !840
  %122 = or i64 %120, %121, !dbg !844
  call void @llvm.dbg.value(metadata i64 %122, metadata !409, metadata !DIExpression()), !dbg !840
  store i64 %122, i64* %118, align 8, !dbg !845, !tbaa !120
  %123 = icmp eq i64 %101, 16, !dbg !846
  br i1 %123, label %130, label %124, !dbg !847

; <label>:124:                                    ; preds = %103
  call void @llvm.dbg.value(metadata i8* %117, metadata !375, metadata !DIExpression()), !dbg !848
  call void @llvm.dbg.value(metadata i8* %117, metadata !767, metadata !DIExpression()), !dbg !849
  call void @llvm.dbg.value(metadata i8* %117, metadata !419, metadata !DIExpression()), !dbg !850
  %125 = getelementptr inbounds i8, i8* %117, i64 8, !dbg !852
  call void @llvm.dbg.value(metadata i64 %122, metadata !111, metadata !DIExpression()), !dbg !853
  %126 = getelementptr inbounds i8, i8* %125, i64 %101, !dbg !856
  %127 = getelementptr inbounds i8, i8* %126, i64 -16, !dbg !857
  %128 = bitcast i8* %127 to i64*, !dbg !858
  call void @llvm.dbg.value(metadata i64* %128, metadata !383, metadata !DIExpression()), !dbg !859
  call void @llvm.dbg.value(metadata i64 %122, metadata !391, metadata !DIExpression()), !dbg !860
  call void @llvm.dbg.value(metadata i64 %101, metadata !401, metadata !DIExpression()), !dbg !863
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !865
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !866
  call void @llvm.dbg.value(metadata i64 %101, metadata !409, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.value(metadata i64 %101, metadata !409, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.value(metadata i64 %121, metadata !409, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.value(metadata i64 %121, metadata !409, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.value(metadata i64 %122, metadata !409, metadata !DIExpression()), !dbg !867
  store i64 %122, i64* %128, align 8, !dbg !868, !tbaa !101
  %129 = load i64, i64* %118, align 8, !tbaa !120
  br label %130, !dbg !869

; <label>:130:                                    ; preds = %124, %103
  %131 = phi i64 [ %122, %103 ], [ %129, %124 ]
  call void @llvm.dbg.value(metadata i8* %117, metadata !165, metadata !DIExpression()), !dbg !870
  call void @llvm.dbg.value(metadata i64 %131, metadata !111, metadata !DIExpression()), !dbg !872
  %132 = and i64 %131, -16, !dbg !875
  %133 = getelementptr inbounds i8, i8* %117, i64 %132, !dbg !876
  call void @llvm.dbg.value(metadata i8* %133, metadata !386, metadata !DIExpression()), !dbg !877
  %134 = icmp ult i64 %101, 17, !dbg !878
  %135 = bitcast i8* %133 to i64*
  %136 = load i64, i64* %135, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %136, metadata !111, metadata !DIExpression()), !dbg !879
  call void @llvm.dbg.value(metadata i64 %136, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !882
  call void @llvm.dbg.value(metadata i64 %136, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !884
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !886
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !887
  %137 = and i64 %136, -15, !dbg !888
  call void @llvm.dbg.value(metadata i64 %137, metadata !409, metadata !DIExpression()), !dbg !889
  call void @llvm.dbg.value(metadata i64 %137, metadata !409, metadata !DIExpression()), !dbg !890
  call void @llvm.dbg.value(metadata i64 %137, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !889
  call void @llvm.dbg.value(metadata i64 %137, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !890
  call void @llvm.dbg.value(metadata i64 %137, metadata !409, metadata !DIExpression()), !dbg !889
  call void @llvm.dbg.value(metadata i64 %137, metadata !409, metadata !DIExpression()), !dbg !890
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !891
  call void @llvm.dbg.value(metadata i64 %136, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !889
  %138 = or i64 %137, 4, !dbg !892
  call void @llvm.dbg.value(metadata i64 %138, metadata !409, metadata !DIExpression()), !dbg !889
  %139 = select i1 %134, i64 %138, i64 %137, !dbg !893
  store i64 %139, i64* %135, align 8, !dbg !894, !tbaa !120
  call void @llvm.dbg.value(metadata i8* %117, metadata !496, metadata !DIExpression()), !dbg !895
  %140 = load i64, i64* %118, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %140, metadata !111, metadata !DIExpression()), !dbg !897
  %141 = and i64 %140, -16, !dbg !900
  %142 = icmp ult i64 %141, 17, !dbg !901
  br i1 %142, label %143, label %147, !dbg !902

; <label>:143:                                    ; preds = %130
  call void @llvm.dbg.value(metadata i8* %117, metadata !509, metadata !DIExpression()), !dbg !903
  %144 = load i64, i64* bitcast ([15 x %struct.block*]* @list_heads to i64*), align 16, !dbg !905, !tbaa !85
  %145 = getelementptr inbounds i8, i8* %117, i64 8, !dbg !906
  %146 = bitcast i8* %145 to i64*, !dbg !907
  store i64 %144, i64* %146, align 8, !dbg !907, !tbaa !276
  store i8* %117, i8** bitcast ([15 x %struct.block*]* @list_heads to i8**), align 16, !dbg !908, !tbaa !85
  br label %190, !dbg !909

; <label>:147:                                    ; preds = %130
  call void @llvm.dbg.value(metadata i64 %140, metadata !111, metadata !DIExpression()), !dbg !910
  call void @llvm.dbg.value(metadata i64 %141, metadata !201, metadata !DIExpression()), !dbg !913
  %148 = icmp ult i64 %141, 33, !dbg !915
  br i1 %148, label %174, label %149, !dbg !916

; <label>:149:                                    ; preds = %147
  %150 = icmp ult i64 %141, 49, !dbg !917
  br i1 %150, label %174, label %151, !dbg !918

; <label>:151:                                    ; preds = %149
  %152 = icmp ult i64 %141, 65, !dbg !919
  br i1 %152, label %174, label %153, !dbg !920

; <label>:153:                                    ; preds = %151
  %154 = icmp ult i64 %141, 90, !dbg !921
  br i1 %154, label %174, label %155, !dbg !922

; <label>:155:                                    ; preds = %153
  %156 = icmp ult i64 %141, 113, !dbg !923
  br i1 %156, label %174, label %157, !dbg !924

; <label>:157:                                    ; preds = %155
  %158 = icmp ult i64 %141, 129, !dbg !925
  br i1 %158, label %174, label %159, !dbg !926

; <label>:159:                                    ; preds = %157
  %160 = icmp ult i64 %141, 145, !dbg !927
  br i1 %160, label %174, label %161, !dbg !928

; <label>:161:                                    ; preds = %159
  %162 = icmp ult i64 %141, 161, !dbg !929
  br i1 %162, label %174, label %163, !dbg !930

; <label>:163:                                    ; preds = %161
  %164 = icmp ult i64 %141, 177, !dbg !931
  br i1 %164, label %174, label %165, !dbg !932

; <label>:165:                                    ; preds = %163
  %166 = icmp ult i64 %141, 257, !dbg !933
  br i1 %166, label %174, label %167, !dbg !934

; <label>:167:                                    ; preds = %165
  %168 = icmp ult i64 %141, 513, !dbg !935
  br i1 %168, label %174, label %169, !dbg !936

; <label>:169:                                    ; preds = %167
  %170 = icmp ult i64 %141, 900, !dbg !937
  br i1 %170, label %174, label %171, !dbg !938

; <label>:171:                                    ; preds = %169
  %172 = icmp ult i64 %141, 5000, !dbg !939
  %173 = select i1 %172, i64 13, i64 14, !dbg !940
  br label %174, !dbg !940

; <label>:174:                                    ; preds = %171, %169, %167, %165, %163, %161, %159, %157, %155, %153, %151, %149, %147
  %175 = phi i64 [ 1, %147 ], [ 2, %149 ], [ 3, %151 ], [ 4, %153 ], [ 5, %155 ], [ 6, %157 ], [ 7, %159 ], [ 8, %161 ], [ 9, %163 ], [ 10, %165 ], [ 11, %167 ], [ 12, %169 ], [ %173, %171 ], !dbg !941
  call void @llvm.dbg.value(metadata i64 %175, metadata !499, metadata !DIExpression()), !dbg !942
  %176 = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %175, !dbg !943
  %177 = bitcast %struct.block** %176 to i64*, !dbg !943
  %178 = load i64, i64* %177, align 8, !dbg !943, !tbaa !85
  %179 = getelementptr inbounds i8, i8* %117, i64 8, !dbg !944
  %180 = bitcast i8* %179 to i64*, !dbg !945
  store i64 %178, i64* %180, align 8, !dbg !945, !tbaa !276
  %181 = getelementptr inbounds i8, i8* %117, i64 16, !dbg !946
  %182 = bitcast i8* %181 to %struct.block**, !dbg !946
  store %struct.block* null, %struct.block** %182, align 8, !dbg !947, !tbaa !276
  %183 = load %struct.block*, %struct.block** %176, align 8, !dbg !948, !tbaa !85
  %184 = icmp eq %struct.block* %183, null, !dbg !949
  br i1 %184, label %188, label %185, !dbg !950

; <label>:185:                                    ; preds = %174
  %186 = getelementptr inbounds %struct.block, %struct.block* %183, i64 0, i32 1, i32 0, i32 1, !dbg !951
  %187 = bitcast %struct.block** %186 to i8**, !dbg !952
  store i8* %117, i8** %187, align 8, !dbg !952, !tbaa !276
  br label %188, !dbg !953

; <label>:188:                                    ; preds = %185, %174
  %189 = bitcast %struct.block** %176 to i8**, !dbg !954
  store i8* %117, i8** %189, align 8, !dbg !954, !tbaa !85
  br label %190

; <label>:190:                                    ; preds = %84, %143, %188
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !955, metadata !DIExpression()), !dbg !960
  %191 = getelementptr inbounds %struct.block, %struct.block* %85, i64 0, i32 1, !dbg !962
  %192 = bitcast %union.anon* %191 to i8*, !dbg !963
  call void @llvm.dbg.value(metadata i8* %192, metadata !577, metadata !DIExpression()), !dbg !581
  call void @llvm.dbg.value(metadata %struct.block* %85, metadata !165, metadata !DIExpression()), !dbg !964
  %193 = load i64, i64* %86, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %193, metadata !111, metadata !DIExpression()), !dbg !966
  %194 = and i64 %193, -16, !dbg !969
  %195 = getelementptr inbounds i8, i8* %91, i64 %194, !dbg !970
  call void @llvm.dbg.value(metadata i8* %195, metadata !579, metadata !DIExpression()), !dbg !971
  %196 = bitcast i8* %195 to i64*
  %197 = load i64, i64* %196, align 8, !tbaa !120
  %198 = and i64 %197, -15, !dbg !972
  %199 = icmp eq i64 %198, 1, !dbg !972
  call void @llvm.dbg.value(metadata i64 %197, metadata !111, metadata !DIExpression()), !dbg !974
  br i1 %199, label %200, label %201, !dbg !972

; <label>:200:                                    ; preds = %190
  call void @llvm.dbg.value(metadata i8* %195, metadata !478, metadata !DIExpression()), !dbg !977
  call void @llvm.dbg.value(metadata i1 true, metadata !483, metadata !DIExpression()), !dbg !980
  call void @llvm.dbg.value(metadata i64 0, metadata !401, metadata !DIExpression()), !dbg !981
  call void @llvm.dbg.value(metadata i1 true, metadata !406, metadata !DIExpression()), !dbg !983
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !984
  call void @llvm.dbg.value(metadata i1 false, metadata !408, metadata !DIExpression()), !dbg !985
  call void @llvm.dbg.value(metadata i64 0, metadata !409, metadata !DIExpression()), !dbg !986
  call void @llvm.dbg.value(metadata i64 1, metadata !409, metadata !DIExpression()), !dbg !986
  call void @llvm.dbg.value(metadata i64 3, metadata !409, metadata !DIExpression()), !dbg !986
  call void @llvm.dbg.value(metadata i64 3, metadata !409, metadata !DIExpression()), !dbg !986
  call void @llvm.dbg.value(metadata i64 3, metadata !409, metadata !DIExpression()), !dbg !986
  store i64 3, i64* %196, align 8, !dbg !987, !tbaa !120
  br label %201, !dbg !988

; <label>:201:                                    ; preds = %190, %200, %79, %11
  %202 = phi i8* [ null, %11 ], [ null, %79 ], [ %192, %200 ], [ %192, %190 ], !dbg !713
  ret i8* %202, !dbg !989
}

; Function Attrs: nounwind uwtable
define internal fastcc void @block_removal(%struct.block*) unnamed_addr #0 !dbg !990 {
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !992, metadata !DIExpression()), !dbg !994
  %2 = getelementptr %struct.block, %struct.block* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %3, metadata !111, metadata !DIExpression()), !dbg !995
  %4 = and i64 %3, -16, !dbg !999
  %5 = icmp ult i64 %4, 17, !dbg !1000
  br i1 %5, label %6, label %34, !dbg !1001

; <label>:6:                                      ; preds = %1
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1002, metadata !DIExpression()), !dbg !1011
  %7 = load %struct.block*, %struct.block** getelementptr inbounds ([15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 0), align 16, !dbg !1014, !tbaa !85
  %8 = icmp eq %struct.block* %7, %0, !dbg !1015
  br i1 %8, label %13, label %9, !dbg !1016

; <label>:9:                                      ; preds = %6
  call void @llvm.dbg.value(metadata %struct.block* %7, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !1005, metadata !DIExpression()), !dbg !1018
  %10 = icmp eq %struct.block* %7, null, !dbg !1019
  br i1 %10, label %99, label %11, !dbg !1021

; <label>:11:                                     ; preds = %9
  call void @llvm.dbg.value(metadata %struct.block* %7, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !1005, metadata !DIExpression()), !dbg !1018
  %12 = getelementptr inbounds %struct.block, %struct.block* %7, i64 0, i32 1, i32 0, i32 0, !dbg !1022
  br label %23, !dbg !1023

; <label>:13:                                     ; preds = %6
  %14 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !1025
  %15 = load %struct.block*, %struct.block** %14, align 8, !dbg !1025, !tbaa !276
  %16 = icmp eq %struct.block* %15, null, !dbg !1026
  br i1 %16, label %17, label %18, !dbg !1027

; <label>:17:                                     ; preds = %13
  store %struct.block* null, %struct.block** %14, align 8, !dbg !1028, !tbaa !276
  store %struct.block* null, %struct.block** getelementptr inbounds ([15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 0), align 16, !dbg !1030, !tbaa !85
  br label %99, !dbg !1031

; <label>:18:                                     ; preds = %13
  %19 = ptrtoint %struct.block* %15 to i64, !dbg !1027
  store i64 %19, i64* bitcast ([15 x %struct.block*]* @list_heads to i64*), align 16, !dbg !1032, !tbaa !85
  store %struct.block* null, %struct.block** %14, align 8, !dbg !1034, !tbaa !276
  br label %99, !dbg !1035

; <label>:20:                                     ; preds = %23
  call void @llvm.dbg.value(metadata %struct.block* %26, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1005, metadata !DIExpression()), !dbg !1018
  %21 = icmp eq %struct.block* %26, %0, !dbg !1036
  %22 = getelementptr inbounds %struct.block, %struct.block* %26, i64 0, i32 1, i32 0, i32 0, !dbg !1022
  br i1 %21, label %28, label %23, !dbg !1023, !llvm.loop !1038

; <label>:23:                                     ; preds = %11, %20
  %24 = phi %struct.block** [ %22, %20 ], [ %12, %11 ]
  %25 = phi %struct.block* [ %26, %20 ], [ %7, %11 ]
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1009, metadata !DIExpression()), !dbg !1017
  %26 = load %struct.block*, %struct.block** %24, align 8, !dbg !1041, !tbaa !276
  call void @llvm.dbg.value(metadata %struct.block* %26, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1005, metadata !DIExpression()), !dbg !1018
  %27 = icmp eq %struct.block* %26, null, !dbg !1019
  br i1 %27, label %99, label %20, !dbg !1021, !llvm.loop !1038

; <label>:28:                                     ; preds = %20
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1009, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.value(metadata %struct.block* %25, metadata !1005, metadata !DIExpression()), !dbg !1018
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1005, metadata !DIExpression()), !dbg !1018
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1005, metadata !DIExpression()), !dbg !1018
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !1005, metadata !DIExpression()), !dbg !1018
  %29 = bitcast %struct.block** %22 to i64*, !dbg !1042
  %30 = load i64, i64* %29, align 8, !dbg !1042, !tbaa !276
  %31 = getelementptr inbounds %struct.block, %struct.block* %25, i64 0, i32 1, !dbg !1044
  %32 = bitcast %union.anon* %31 to i64*, !dbg !1045
  store i64 %30, i64* %32, align 8, !dbg !1045, !tbaa !276
  %33 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !1046
  store %struct.block* null, %struct.block** %33, align 8, !dbg !1047, !tbaa !276
  br label %99

; <label>:34:                                     ; preds = %1
  call void @llvm.dbg.value(metadata i64 %3, metadata !111, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %4, metadata !201, metadata !DIExpression()), !dbg !1051
  %35 = icmp ult i64 %4, 33, !dbg !1053
  br i1 %35, label %61, label %36, !dbg !1054

; <label>:36:                                     ; preds = %34
  %37 = icmp ult i64 %4, 49, !dbg !1055
  br i1 %37, label %61, label %38, !dbg !1056

; <label>:38:                                     ; preds = %36
  %39 = icmp ult i64 %4, 65, !dbg !1057
  br i1 %39, label %61, label %40, !dbg !1058

; <label>:40:                                     ; preds = %38
  %41 = icmp ult i64 %4, 90, !dbg !1059
  br i1 %41, label %61, label %42, !dbg !1060

; <label>:42:                                     ; preds = %40
  %43 = icmp ult i64 %4, 113, !dbg !1061
  br i1 %43, label %61, label %44, !dbg !1062

; <label>:44:                                     ; preds = %42
  %45 = icmp ult i64 %4, 129, !dbg !1063
  br i1 %45, label %61, label %46, !dbg !1064

; <label>:46:                                     ; preds = %44
  %47 = icmp ult i64 %4, 145, !dbg !1065
  br i1 %47, label %61, label %48, !dbg !1066

; <label>:48:                                     ; preds = %46
  %49 = icmp ult i64 %4, 161, !dbg !1067
  br i1 %49, label %61, label %50, !dbg !1068

; <label>:50:                                     ; preds = %48
  %51 = icmp ult i64 %4, 177, !dbg !1069
  br i1 %51, label %61, label %52, !dbg !1070

; <label>:52:                                     ; preds = %50
  %53 = icmp ult i64 %4, 257, !dbg !1071
  br i1 %53, label %61, label %54, !dbg !1072

; <label>:54:                                     ; preds = %52
  %55 = icmp ult i64 %4, 513, !dbg !1073
  br i1 %55, label %61, label %56, !dbg !1074

; <label>:56:                                     ; preds = %54
  %57 = icmp ult i64 %4, 900, !dbg !1075
  br i1 %57, label %61, label %58, !dbg !1076

; <label>:58:                                     ; preds = %56
  %59 = icmp ult i64 %4, 5000, !dbg !1077
  %60 = select i1 %59, i64 13, i64 14, !dbg !1078
  br label %61, !dbg !1078

; <label>:61:                                     ; preds = %34, %36, %38, %40, %42, %44, %46, %48, %50, %52, %54, %56, %58
  %62 = phi i64 [ 1, %34 ], [ 2, %36 ], [ 3, %38 ], [ 4, %40 ], [ 5, %42 ], [ 6, %44 ], [ 7, %46 ], [ 8, %48 ], [ 9, %50 ], [ 10, %52 ], [ 11, %54 ], [ 12, %56 ], [ %60, %58 ], !dbg !1079
  call void @llvm.dbg.value(metadata i64 %62, metadata !993, metadata !DIExpression()), !dbg !1080
  %63 = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %62, !dbg !1081
  %64 = load %struct.block*, %struct.block** %63, align 8, !dbg !1081, !tbaa !85
  %65 = icmp eq %struct.block* %64, %0, !dbg !1083
  br i1 %65, label %66, label %79, !dbg !1084

; <label>:66:                                     ; preds = %61
  %67 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !1085
  %68 = load %struct.block*, %struct.block** %67, align 8, !dbg !1085, !tbaa !276
  %69 = icmp eq %struct.block* %68, null, !dbg !1086
  %70 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 1, !dbg !1087
  br i1 %69, label %71, label %73, !dbg !1089

; <label>:71:                                     ; preds = %66
  %72 = bitcast %struct.block** %67 to i8*, !dbg !1090
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %72, i8 0, i64 16, i1 false), !dbg !1092
  store %struct.block* null, %struct.block** %63, align 8, !dbg !1090, !tbaa !85
  br label %99, !dbg !1093

; <label>:73:                                     ; preds = %66
  %74 = load %struct.block*, %struct.block** %70, align 8, !dbg !1094, !tbaa !276
  %75 = icmp eq %struct.block* %74, null, !dbg !1095
  br i1 %75, label %76, label %82, !dbg !1096

; <label>:76:                                     ; preds = %73
  store %struct.block* %68, %struct.block** %63, align 8, !dbg !1097, !tbaa !85
  %77 = getelementptr inbounds %struct.block, %struct.block* %68, i64 0, i32 1, i32 0, i32 1, !dbg !1099
  store %struct.block* null, %struct.block** %77, align 8, !dbg !1100, !tbaa !276
  %78 = bitcast %struct.block** %67 to i8*, !dbg !1101
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %78, i8 0, i64 16, i1 false), !dbg !1102
  br label %99, !dbg !1101

; <label>:79:                                     ; preds = %61
  %80 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 1
  %81 = load %struct.block*, %struct.block** %80, align 8, !dbg !1103, !tbaa !276
  br label %82, !dbg !1105

; <label>:82:                                     ; preds = %73, %79
  %83 = phi %struct.block* [ %81, %79 ], [ %74, %73 ]
  %84 = phi %struct.block** [ %80, %79 ], [ %70, %73 ]
  %85 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, i32 0, i32 0, !dbg !1106
  %86 = load %struct.block*, %struct.block** %85, align 8, !dbg !1106, !tbaa !276
  %87 = icmp eq %struct.block* %86, null, !dbg !1107
  br i1 %87, label %97, label %88, !dbg !1108

; <label>:88:                                     ; preds = %82
  %89 = ptrtoint %struct.block* %86 to i64, !dbg !1108
  %90 = getelementptr inbounds %struct.block, %struct.block* %83, i64 0, i32 1, !dbg !1109
  %91 = bitcast %union.anon* %90 to i64*, !dbg !1111
  store i64 %89, i64* %91, align 8, !dbg !1111, !tbaa !276
  %92 = bitcast %struct.block** %84 to i64*, !dbg !1112
  %93 = load i64, i64* %92, align 8, !dbg !1112, !tbaa !276
  %94 = load %struct.block*, %struct.block** %85, align 8, !dbg !1113, !tbaa !276
  %95 = getelementptr inbounds %struct.block, %struct.block* %94, i64 0, i32 1, i32 0, i32 1, !dbg !1114
  %96 = bitcast %struct.block** %95 to i64*, !dbg !1115
  store i64 %93, i64* %96, align 8, !dbg !1115, !tbaa !276
  store %struct.block* null, %struct.block** %85, align 8, !dbg !1116, !tbaa !276
  store %struct.block* null, %struct.block** %84, align 8, !dbg !1117, !tbaa !276
  br label %99

; <label>:97:                                     ; preds = %82
  %98 = getelementptr inbounds %struct.block, %struct.block* %83, i64 0, i32 1, i32 0, i32 0, !dbg !1118
  store %struct.block* null, %struct.block** %98, align 8, !dbg !1120, !tbaa !276
  store %struct.block* null, %struct.block** %84, align 8, !dbg !1121, !tbaa !276
  br label %99, !dbg !1122

; <label>:99:                                     ; preds = %23, %28, %18, %17, %9, %71, %97, %88, %76
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @mm_free(i8*) local_unnamed_addr #0 !dbg !1123 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !1127, metadata !DIExpression()), !dbg !1131
  %2 = icmp eq i8* %0, null, !dbg !1132
  br i1 %2, label %75, label %3, !dbg !1134

; <label>:3:                                      ; preds = %1
  call void @llvm.dbg.value(metadata i8* %0, metadata !355, metadata !DIExpression()), !dbg !1135
  %4 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !1137
  %5 = bitcast i8* %4 to %struct.block*, !dbg !1138
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !1128, metadata !DIExpression()), !dbg !1139
  %6 = bitcast i8* %4 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %7, metadata !111, metadata !DIExpression()), !dbg !1140
  %8 = and i64 %7, -16, !dbg !1143
  call void @llvm.dbg.value(metadata i64 %8, metadata !1129, metadata !DIExpression()), !dbg !1144
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !375, metadata !DIExpression()), !dbg !1145
  call void @llvm.dbg.value(metadata i64 %8, metadata !380, metadata !DIExpression()), !dbg !1147
  call void @llvm.dbg.value(metadata i1 false, metadata !381, metadata !DIExpression()), !dbg !1148
  call void @llvm.dbg.value(metadata i64 %8, metadata !401, metadata !DIExpression()), !dbg !1149
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1151
  call void @llvm.dbg.value(metadata i64 %8, metadata !409, metadata !DIExpression()), !dbg !1152
  call void @llvm.dbg.value(metadata i64 %8, metadata !409, metadata !DIExpression()), !dbg !1152
  call void @llvm.dbg.value(metadata i64 %8, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1152
  %9 = and i64 %7, -10, !dbg !1153
  call void @llvm.dbg.value(metadata i64 %9, metadata !409, metadata !DIExpression()), !dbg !1152
  store i64 %9, i64* %6, align 8, !dbg !1154, !tbaa !120
  %10 = icmp ugt i64 %8, 16, !dbg !1155
  br i1 %10, label %11, label %16, !dbg !1156

; <label>:11:                                     ; preds = %3
  call void @llvm.dbg.value(metadata i64 %7, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_stack_value)), !dbg !1152
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !419, metadata !DIExpression()), !dbg !1157
  call void @llvm.dbg.value(metadata i64 %9, metadata !111, metadata !DIExpression()), !dbg !1159
  %12 = getelementptr inbounds i8, i8* %0, i64 %8, !dbg !1162
  %13 = getelementptr inbounds i8, i8* %12, i64 -16, !dbg !1163
  %14 = bitcast i8* %13 to i64*, !dbg !1164
  call void @llvm.dbg.value(metadata i64* %14, metadata !383, metadata !DIExpression()), !dbg !1165
  call void @llvm.dbg.value(metadata i64 %8, metadata !401, metadata !DIExpression()), !dbg !1166
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1168
  call void @llvm.dbg.value(metadata i64 %8, metadata !409, metadata !DIExpression()), !dbg !1169
  call void @llvm.dbg.value(metadata i64 %8, metadata !409, metadata !DIExpression()), !dbg !1169
  call void @llvm.dbg.value(metadata i64 %8, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1169
  call void @llvm.dbg.value(metadata i64 %7, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551602, DW_OP_and, DW_OP_stack_value)), !dbg !1169
  call void @llvm.dbg.value(metadata i64 %9, metadata !409, metadata !DIExpression()), !dbg !1169
  store i64 %9, i64* %14, align 8, !dbg !1170, !tbaa !101
  %15 = load i64, i64* %6, align 8, !tbaa !120
  br label %16, !dbg !1171

; <label>:16:                                     ; preds = %3, %11
  %17 = phi i64 [ %9, %3 ], [ %15, %11 ]
  call void @llvm.dbg.value(metadata %struct.block* %5, metadata !165, metadata !DIExpression()), !dbg !1172
  call void @llvm.dbg.value(metadata i64 %17, metadata !111, metadata !DIExpression()), !dbg !1174
  %18 = and i64 %17, -16, !dbg !1177
  %19 = getelementptr inbounds i8, i8* %4, i64 %18, !dbg !1178
  call void @llvm.dbg.value(metadata i8* %19, metadata !386, metadata !DIExpression()), !dbg !1179
  %20 = icmp ult i64 %8, 17, !dbg !1180
  %21 = bitcast i8* %19 to i64*
  %22 = load i64, i64* %21, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %22, metadata !111, metadata !DIExpression()), !dbg !1181
  call void @llvm.dbg.value(metadata i64 %22, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1184
  call void @llvm.dbg.value(metadata i64 %22, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1186
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1188
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1189
  %23 = and i64 %22, -15, !dbg !1190
  call void @llvm.dbg.value(metadata i64 %23, metadata !409, metadata !DIExpression()), !dbg !1191
  call void @llvm.dbg.value(metadata i64 %23, metadata !409, metadata !DIExpression()), !dbg !1192
  call void @llvm.dbg.value(metadata i64 %23, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1191
  call void @llvm.dbg.value(metadata i64 %23, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1192
  call void @llvm.dbg.value(metadata i64 %23, metadata !409, metadata !DIExpression()), !dbg !1191
  call void @llvm.dbg.value(metadata i64 %23, metadata !409, metadata !DIExpression()), !dbg !1192
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !1193
  call void @llvm.dbg.value(metadata i64 %22, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1191
  %24 = or i64 %23, 4, !dbg !1194
  call void @llvm.dbg.value(metadata i64 %24, metadata !409, metadata !DIExpression()), !dbg !1191
  %25 = select i1 %20, i64 %24, i64 %23, !dbg !1195
  store i64 %25, i64* %21, align 8, !dbg !1196, !tbaa !120
  %26 = tail call fastcc %struct.block* @coalesce_block(%struct.block* nonnull %5), !dbg !1197
  call void @llvm.dbg.value(metadata %struct.block* %26, metadata !1130, metadata !DIExpression()), !dbg !1198
  call void @llvm.dbg.value(metadata %struct.block* %26, metadata !496, metadata !DIExpression()), !dbg !1199
  %27 = getelementptr %struct.block, %struct.block* %26, i64 0, i32 0
  %28 = load i64, i64* %27, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %28, metadata !111, metadata !DIExpression()), !dbg !1201
  %29 = and i64 %28, -16, !dbg !1204
  %30 = icmp ult i64 %29, 17, !dbg !1205
  br i1 %30, label %31, label %35, !dbg !1206

; <label>:31:                                     ; preds = %16
  call void @llvm.dbg.value(metadata %struct.block* %26, metadata !509, metadata !DIExpression()), !dbg !1207
  %32 = load i64, i64* bitcast ([15 x %struct.block*]* @list_heads to i64*), align 16, !dbg !1209, !tbaa !85
  %33 = getelementptr inbounds %struct.block, %struct.block* %26, i64 0, i32 1, !dbg !1210
  %34 = bitcast %union.anon* %33 to i64*, !dbg !1211
  store i64 %32, i64* %34, align 8, !dbg !1211, !tbaa !276
  store %struct.block* %26, %struct.block** getelementptr inbounds ([15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 0), align 16, !dbg !1212, !tbaa !85
  br label %75, !dbg !1213

; <label>:35:                                     ; preds = %16
  call void @llvm.dbg.value(metadata i64 %28, metadata !111, metadata !DIExpression()), !dbg !1214
  call void @llvm.dbg.value(metadata i64 %29, metadata !201, metadata !DIExpression()), !dbg !1217
  %36 = icmp ult i64 %29, 33, !dbg !1219
  br i1 %36, label %62, label %37, !dbg !1220

; <label>:37:                                     ; preds = %35
  %38 = icmp ult i64 %29, 49, !dbg !1221
  br i1 %38, label %62, label %39, !dbg !1222

; <label>:39:                                     ; preds = %37
  %40 = icmp ult i64 %29, 65, !dbg !1223
  br i1 %40, label %62, label %41, !dbg !1224

; <label>:41:                                     ; preds = %39
  %42 = icmp ult i64 %29, 90, !dbg !1225
  br i1 %42, label %62, label %43, !dbg !1226

; <label>:43:                                     ; preds = %41
  %44 = icmp ult i64 %29, 113, !dbg !1227
  br i1 %44, label %62, label %45, !dbg !1228

; <label>:45:                                     ; preds = %43
  %46 = icmp ult i64 %29, 129, !dbg !1229
  br i1 %46, label %62, label %47, !dbg !1230

; <label>:47:                                     ; preds = %45
  %48 = icmp ult i64 %29, 145, !dbg !1231
  br i1 %48, label %62, label %49, !dbg !1232

; <label>:49:                                     ; preds = %47
  %50 = icmp ult i64 %29, 161, !dbg !1233
  br i1 %50, label %62, label %51, !dbg !1234

; <label>:51:                                     ; preds = %49
  %52 = icmp ult i64 %29, 177, !dbg !1235
  br i1 %52, label %62, label %53, !dbg !1236

; <label>:53:                                     ; preds = %51
  %54 = icmp ult i64 %29, 257, !dbg !1237
  br i1 %54, label %62, label %55, !dbg !1238

; <label>:55:                                     ; preds = %53
  %56 = icmp ult i64 %29, 513, !dbg !1239
  br i1 %56, label %62, label %57, !dbg !1240

; <label>:57:                                     ; preds = %55
  %58 = icmp ult i64 %29, 900, !dbg !1241
  br i1 %58, label %62, label %59, !dbg !1242

; <label>:59:                                     ; preds = %57
  %60 = icmp ult i64 %29, 5000, !dbg !1243
  %61 = select i1 %60, i64 13, i64 14, !dbg !1244
  br label %62, !dbg !1244

; <label>:62:                                     ; preds = %59, %57, %55, %53, %51, %49, %47, %45, %43, %41, %39, %37, %35
  %63 = phi i64 [ 1, %35 ], [ 2, %37 ], [ 3, %39 ], [ 4, %41 ], [ 5, %43 ], [ 6, %45 ], [ 7, %47 ], [ 8, %49 ], [ 9, %51 ], [ 10, %53 ], [ 11, %55 ], [ 12, %57 ], [ %61, %59 ], !dbg !1245
  call void @llvm.dbg.value(metadata i64 %63, metadata !499, metadata !DIExpression()), !dbg !1246
  %64 = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %63, !dbg !1247
  %65 = bitcast %struct.block** %64 to i64*, !dbg !1247
  %66 = load i64, i64* %65, align 8, !dbg !1247, !tbaa !85
  %67 = getelementptr inbounds %struct.block, %struct.block* %26, i64 0, i32 1, !dbg !1248
  %68 = bitcast %union.anon* %67 to i64*, !dbg !1249
  store i64 %66, i64* %68, align 8, !dbg !1249, !tbaa !276
  %69 = getelementptr inbounds %struct.block, %struct.block* %26, i64 0, i32 1, i32 0, i32 1, !dbg !1250
  store %struct.block* null, %struct.block** %69, align 8, !dbg !1251, !tbaa !276
  %70 = load %struct.block*, %struct.block** %64, align 8, !dbg !1252, !tbaa !85
  %71 = icmp eq %struct.block* %70, null, !dbg !1253
  br i1 %71, label %74, label %72, !dbg !1254

; <label>:72:                                     ; preds = %62
  %73 = getelementptr inbounds %struct.block, %struct.block* %70, i64 0, i32 1, i32 0, i32 1, !dbg !1255
  store %struct.block* %26, %struct.block** %73, align 8, !dbg !1256, !tbaa !276
  br label %74, !dbg !1257

; <label>:74:                                     ; preds = %72, %62
  store %struct.block* %26, %struct.block** %64, align 8, !dbg !1258, !tbaa !85
  br label %75

; <label>:75:                                     ; preds = %74, %31, %1
  ret void, !dbg !1259
}

; Function Attrs: nounwind uwtable
define internal fastcc %struct.block* @coalesce_block(%struct.block*) unnamed_addr #0 !dbg !1260 {
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1262, metadata !DIExpression()), !dbg !1272
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !165, metadata !DIExpression()), !dbg !1273
  %2 = bitcast %struct.block* %0 to i8*, !dbg !1275
  %3 = getelementptr %struct.block, %struct.block* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %4, metadata !111, metadata !DIExpression()), !dbg !1276
  %5 = and i64 %4, -16, !dbg !1279
  %6 = getelementptr inbounds i8, i8* %2, i64 %5, !dbg !1280
  %7 = bitcast i8* %6 to %struct.block*, !dbg !1281
  call void @llvm.dbg.value(metadata %struct.block* %7, metadata !1263, metadata !DIExpression()), !dbg !1282
  call void @llvm.dbg.value(metadata i64 %4, metadata !111, metadata !DIExpression()), !dbg !1283
  call void @llvm.dbg.value(metadata i64 %5, metadata !1264, metadata !DIExpression()), !dbg !1286
  call void @llvm.dbg.value(metadata i64 %4, metadata !365, metadata !DIExpression()), !dbg !1287
  %8 = and i64 %4, 2, !dbg !1290
  %9 = icmp eq i64 %8, 0, !dbg !1291
  %10 = bitcast i8* %6 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %11, metadata !103, metadata !DIExpression()), !dbg !1292
  call void @llvm.dbg.value(metadata i64 %11, metadata !103, metadata !DIExpression()), !dbg !1295
  %12 = and i64 %11, 1, !dbg !1298
  %13 = icmp ne i64 %12, 0, !dbg !1299
  br i1 %9, label %41, label %14, !dbg !1300

; <label>:14:                                     ; preds = %1
  br i1 %13, label %135, label %15, !dbg !1301

; <label>:15:                                     ; preds = %14
  call void @llvm.dbg.value(metadata i64 %4, metadata !365, metadata !DIExpression()), !dbg !1302
  call void @llvm.dbg.value(metadata i64 %11, metadata !103, metadata !DIExpression()), !dbg !1305
  tail call fastcc void @block_removal(%struct.block* nonnull %7), !dbg !1308
  %16 = load i64, i64* %10, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %16, metadata !111, metadata !DIExpression()), !dbg !1310
  %17 = and i64 %16, -16, !dbg !1313
  %18 = add i64 %17, %5, !dbg !1314
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !375, metadata !DIExpression()), !dbg !1315
  call void @llvm.dbg.value(metadata i64 %18, metadata !380, metadata !DIExpression()), !dbg !1317
  call void @llvm.dbg.value(metadata i1 false, metadata !381, metadata !DIExpression()), !dbg !1318
  call void @llvm.dbg.value(metadata i1 true, metadata !382, metadata !DIExpression()), !dbg !1319
  %19 = load i64, i64* %3, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %19, metadata !391, metadata !DIExpression()), !dbg !1320
  %20 = and i64 %19, 4, !dbg !1323
  call void @llvm.dbg.value(metadata i64 %18, metadata !401, metadata !DIExpression()), !dbg !1324
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1326
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !1327
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression()), !dbg !1328
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression()), !dbg !1328
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1328
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1328
  %21 = or i64 %18, %20, !dbg !1329
  %22 = or i64 %21, 2, !dbg !1329
  call void @llvm.dbg.value(metadata i64 %22, metadata !409, metadata !DIExpression()), !dbg !1328
  store i64 %22, i64* %3, align 8, !dbg !1330, !tbaa !120
  %23 = icmp ugt i64 %18, 16, !dbg !1331
  br i1 %23, label %24, label %31, !dbg !1332

; <label>:24:                                     ; preds = %15
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !419, metadata !DIExpression()), !dbg !1333
  %25 = getelementptr inbounds %struct.block, %struct.block* %0, i64 0, i32 1, !dbg !1335
  %26 = bitcast %union.anon* %25 to i8*, !dbg !1336
  call void @llvm.dbg.value(metadata i64 %22, metadata !111, metadata !DIExpression()), !dbg !1337
  %27 = getelementptr inbounds i8, i8* %26, i64 %18, !dbg !1340
  %28 = getelementptr inbounds i8, i8* %27, i64 -16, !dbg !1341
  %29 = bitcast i8* %28 to i64*, !dbg !1342
  call void @llvm.dbg.value(metadata i64* %29, metadata !383, metadata !DIExpression()), !dbg !1343
  call void @llvm.dbg.value(metadata i64 %22, metadata !391, metadata !DIExpression()), !dbg !1344
  call void @llvm.dbg.value(metadata i64 %18, metadata !401, metadata !DIExpression()), !dbg !1347
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1349
  call void @llvm.dbg.value(metadata i1 true, metadata !407, metadata !DIExpression()), !dbg !1350
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression()), !dbg !1351
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression()), !dbg !1351
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1351
  call void @llvm.dbg.value(metadata i64 %18, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1351
  call void @llvm.dbg.value(metadata i64 %22, metadata !409, metadata !DIExpression()), !dbg !1351
  store i64 %22, i64* %29, align 8, !dbg !1352, !tbaa !101
  %30 = load i64, i64* %3, align 8, !tbaa !120
  br label %31, !dbg !1353

; <label>:31:                                     ; preds = %15, %24
  %32 = phi i64 [ %22, %15 ], [ %30, %24 ]
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !165, metadata !DIExpression()), !dbg !1354
  call void @llvm.dbg.value(metadata i64 %32, metadata !111, metadata !DIExpression()), !dbg !1356
  %33 = and i64 %32, -16, !dbg !1359
  %34 = getelementptr inbounds i8, i8* %2, i64 %33, !dbg !1360
  call void @llvm.dbg.value(metadata i8* %34, metadata !386, metadata !DIExpression()), !dbg !1361
  %35 = icmp ult i64 %18, 17, !dbg !1362
  %36 = bitcast i8* %34 to i64*
  %37 = load i64, i64* %36, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %37, metadata !111, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.value(metadata i64 %37, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1366
  call void @llvm.dbg.value(metadata i64 %37, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1368
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1370
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1371
  %38 = and i64 %37, -15, !dbg !1372
  call void @llvm.dbg.value(metadata i64 %38, metadata !409, metadata !DIExpression()), !dbg !1373
  call void @llvm.dbg.value(metadata i64 %38, metadata !409, metadata !DIExpression()), !dbg !1374
  call void @llvm.dbg.value(metadata i64 %38, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1373
  call void @llvm.dbg.value(metadata i64 %38, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1374
  call void @llvm.dbg.value(metadata i64 %38, metadata !409, metadata !DIExpression()), !dbg !1373
  call void @llvm.dbg.value(metadata i64 %38, metadata !409, metadata !DIExpression()), !dbg !1374
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !1375
  call void @llvm.dbg.value(metadata i64 %37, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1373
  %39 = or i64 %38, 4, !dbg !1376
  call void @llvm.dbg.value(metadata i64 %39, metadata !409, metadata !DIExpression()), !dbg !1373
  %40 = select i1 %35, i64 %39, i64 %38, !dbg !1377
  br label %131, !dbg !1378

; <label>:41:                                     ; preds = %1
  call void @llvm.dbg.value(metadata i64 %4, metadata !365, metadata !DIExpression()), !dbg !1379
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1382, metadata !DIExpression()), !dbg !1386
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !1382, metadata !DIExpression()), !dbg !1388
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !89, metadata !DIExpression()), !dbg !1390
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !89, metadata !DIExpression()), !dbg !1392
  call void @llvm.dbg.value(metadata i64 %4, metadata !391, metadata !DIExpression()), !dbg !1394
  call void @llvm.dbg.value(metadata i64 %4, metadata !391, metadata !DIExpression()), !dbg !1398
  %42 = and i64 %4, 4, !dbg !1401
  %43 = icmp eq i64 %42, 0, !dbg !1402
  br i1 %13, label %44, label %86, !dbg !1403

; <label>:44:                                     ; preds = %41
  br i1 %43, label %48, label %45, !dbg !1404

; <label>:45:                                     ; preds = %44
  %46 = getelementptr inbounds i64, i64* %3, i64 -2, !dbg !1405
  %47 = bitcast i64* %46 to %struct.block*, !dbg !1413
  br label %57, !dbg !1414

; <label>:48:                                     ; preds = %44
  %49 = getelementptr inbounds i64, i64* %3, i64 -1, !dbg !1415
  call void @llvm.dbg.value(metadata i64* %49, metadata !1385, metadata !DIExpression()), !dbg !1416
  %50 = load i64, i64* %49, align 8, !dbg !1417, !tbaa !101
  call void @llvm.dbg.value(metadata i64 %50, metadata !111, metadata !DIExpression()), !dbg !1419
  %51 = and i64 %50, -16, !dbg !1421
  %52 = icmp eq i64 %51, 0, !dbg !1422
  br i1 %52, label %57, label %53, !dbg !1423

; <label>:53:                                     ; preds = %48
  call void @llvm.dbg.value(metadata i64* %49, metadata !1424, metadata !DIExpression()), !dbg !1428
  call void @llvm.dbg.value(metadata i64 %50, metadata !111, metadata !DIExpression()), !dbg !1430
  call void @llvm.dbg.value(metadata i64 %51, metadata !1427, metadata !DIExpression()), !dbg !1432
  %54 = sub i64 0, %51, !dbg !1433
  %55 = getelementptr inbounds i8, i8* %2, i64 %54, !dbg !1433
  %56 = bitcast i8* %55 to %struct.block*, !dbg !1434
  br label %57, !dbg !1435

; <label>:57:                                     ; preds = %45, %48, %53
  %58 = phi %struct.block* [ %47, %45 ], [ %56, %53 ], [ null, %48 ], !dbg !1436
  call void @llvm.dbg.value(metadata %struct.block* %58, metadata !1265, metadata !DIExpression()), !dbg !1437
  tail call fastcc void @block_removal(%struct.block* %58), !dbg !1438
  %59 = getelementptr %struct.block, %struct.block* %58, i64 0, i32 0
  %60 = load i64, i64* %59, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %60, metadata !111, metadata !DIExpression()), !dbg !1439
  %61 = and i64 %60, -16, !dbg !1442
  %62 = add i64 %61, %5, !dbg !1443
  call void @llvm.dbg.value(metadata i64 %60, metadata !365, metadata !DIExpression()), !dbg !1444
  %63 = and i64 %60, 2, !dbg !1447
  call void @llvm.dbg.value(metadata %struct.block* %58, metadata !375, metadata !DIExpression()), !dbg !1448
  call void @llvm.dbg.value(metadata i64 %62, metadata !380, metadata !DIExpression()), !dbg !1450
  call void @llvm.dbg.value(metadata i1 false, metadata !381, metadata !DIExpression()), !dbg !1451
  call void @llvm.dbg.value(metadata i64 %60, metadata !391, metadata !DIExpression()), !dbg !1452
  %64 = and i64 %60, 4, !dbg !1455
  call void @llvm.dbg.value(metadata i64 %62, metadata !401, metadata !DIExpression()), !dbg !1456
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1458
  call void @llvm.dbg.value(metadata i64 %62, metadata !409, metadata !DIExpression()), !dbg !1459
  call void @llvm.dbg.value(metadata i64 %62, metadata !409, metadata !DIExpression()), !dbg !1459
  call void @llvm.dbg.value(metadata i64 %62, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1459
  %65 = or i64 %62, %63, !dbg !1460
  call void @llvm.dbg.value(metadata i64 %65, metadata !409, metadata !DIExpression()), !dbg !1459
  %66 = or i64 %65, %64, !dbg !1461
  call void @llvm.dbg.value(metadata i64 %66, metadata !409, metadata !DIExpression()), !dbg !1459
  store i64 %66, i64* %59, align 8, !dbg !1462, !tbaa !120
  %67 = icmp ugt i64 %62, 16, !dbg !1463
  br i1 %67, label %68, label %75, !dbg !1464

; <label>:68:                                     ; preds = %57
  call void @llvm.dbg.value(metadata %struct.block* %58, metadata !419, metadata !DIExpression()), !dbg !1465
  %69 = getelementptr inbounds %struct.block, %struct.block* %58, i64 0, i32 1, !dbg !1467
  %70 = bitcast %union.anon* %69 to i8*, !dbg !1468
  call void @llvm.dbg.value(metadata i64 %66, metadata !111, metadata !DIExpression()), !dbg !1469
  %71 = getelementptr inbounds i8, i8* %70, i64 %62, !dbg !1472
  %72 = getelementptr inbounds i8, i8* %71, i64 -16, !dbg !1473
  %73 = bitcast i8* %72 to i64*, !dbg !1474
  call void @llvm.dbg.value(metadata i64* %73, metadata !383, metadata !DIExpression()), !dbg !1475
  call void @llvm.dbg.value(metadata i64 %66, metadata !391, metadata !DIExpression()), !dbg !1476
  call void @llvm.dbg.value(metadata i64 %62, metadata !401, metadata !DIExpression()), !dbg !1479
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1481
  call void @llvm.dbg.value(metadata i64 %62, metadata !409, metadata !DIExpression()), !dbg !1482
  call void @llvm.dbg.value(metadata i64 %62, metadata !409, metadata !DIExpression()), !dbg !1482
  call void @llvm.dbg.value(metadata i64 %62, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1482
  call void @llvm.dbg.value(metadata i64 %65, metadata !409, metadata !DIExpression()), !dbg !1482
  call void @llvm.dbg.value(metadata i64 %66, metadata !409, metadata !DIExpression()), !dbg !1482
  store i64 %66, i64* %73, align 8, !dbg !1483, !tbaa !101
  %74 = load i64, i64* %59, align 8, !tbaa !120
  br label %75, !dbg !1484

; <label>:75:                                     ; preds = %57, %68
  %76 = phi i64 [ %66, %57 ], [ %74, %68 ]
  call void @llvm.dbg.value(metadata %struct.block* %58, metadata !165, metadata !DIExpression()), !dbg !1485
  %77 = bitcast %struct.block* %58 to i8*, !dbg !1487
  call void @llvm.dbg.value(metadata i64 %76, metadata !111, metadata !DIExpression()), !dbg !1488
  %78 = and i64 %76, -16, !dbg !1491
  %79 = getelementptr inbounds i8, i8* %77, i64 %78, !dbg !1492
  call void @llvm.dbg.value(metadata i8* %79, metadata !386, metadata !DIExpression()), !dbg !1493
  %80 = icmp ult i64 %62, 17, !dbg !1494
  %81 = bitcast i8* %79 to i64*
  %82 = load i64, i64* %81, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %82, metadata !111, metadata !DIExpression()), !dbg !1495
  call void @llvm.dbg.value(metadata i64 %82, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1498
  call void @llvm.dbg.value(metadata i64 %82, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1500
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1502
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1503
  %83 = and i64 %82, -15, !dbg !1504
  call void @llvm.dbg.value(metadata i64 %83, metadata !409, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i64 %83, metadata !409, metadata !DIExpression()), !dbg !1506
  call void @llvm.dbg.value(metadata i64 %83, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1505
  call void @llvm.dbg.value(metadata i64 %83, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1506
  call void @llvm.dbg.value(metadata i64 %83, metadata !409, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i64 %83, metadata !409, metadata !DIExpression()), !dbg !1506
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !1507
  call void @llvm.dbg.value(metadata i64 %82, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1505
  %84 = or i64 %83, 4, !dbg !1508
  call void @llvm.dbg.value(metadata i64 %84, metadata !409, metadata !DIExpression()), !dbg !1505
  %85 = select i1 %80, i64 %84, i64 %83, !dbg !1509
  br label %131

; <label>:86:                                     ; preds = %41
  br i1 %43, label %90, label %87, !dbg !1510

; <label>:87:                                     ; preds = %86
  %88 = getelementptr inbounds i64, i64* %3, i64 -2, !dbg !1511
  %89 = bitcast i64* %88 to %struct.block*, !dbg !1513
  br label %99, !dbg !1514

; <label>:90:                                     ; preds = %86
  %91 = getelementptr inbounds i64, i64* %3, i64 -1, !dbg !1515
  call void @llvm.dbg.value(metadata i64* %91, metadata !1385, metadata !DIExpression()), !dbg !1516
  %92 = load i64, i64* %91, align 8, !dbg !1517, !tbaa !101
  call void @llvm.dbg.value(metadata i64 %92, metadata !111, metadata !DIExpression()), !dbg !1518
  %93 = and i64 %92, -16, !dbg !1520
  %94 = icmp eq i64 %93, 0, !dbg !1521
  br i1 %94, label %99, label %95, !dbg !1522

; <label>:95:                                     ; preds = %90
  call void @llvm.dbg.value(metadata i64* %91, metadata !1424, metadata !DIExpression()), !dbg !1523
  call void @llvm.dbg.value(metadata i64 %92, metadata !111, metadata !DIExpression()), !dbg !1525
  call void @llvm.dbg.value(metadata i64 %93, metadata !1427, metadata !DIExpression()), !dbg !1527
  %96 = sub i64 0, %93, !dbg !1528
  %97 = getelementptr inbounds i8, i8* %2, i64 %96, !dbg !1528
  %98 = bitcast i8* %97 to %struct.block*, !dbg !1529
  br label %99, !dbg !1530

; <label>:99:                                     ; preds = %87, %90, %95
  %100 = phi %struct.block* [ %89, %87 ], [ %98, %95 ], [ null, %90 ], !dbg !1531
  call void @llvm.dbg.value(metadata %struct.block* %100, metadata !1270, metadata !DIExpression()), !dbg !1532
  tail call fastcc void @block_removal(%struct.block* %100), !dbg !1533
  tail call fastcc void @block_removal(%struct.block* nonnull %7), !dbg !1534
  %101 = getelementptr %struct.block, %struct.block* %100, i64 0, i32 0
  %102 = load i64, i64* %101, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %102, metadata !111, metadata !DIExpression()), !dbg !1535
  %103 = and i64 %102, -16, !dbg !1538
  %104 = add i64 %103, %5, !dbg !1539
  %105 = load i64, i64* %10, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %105, metadata !111, metadata !DIExpression()), !dbg !1540
  %106 = and i64 %105, -16, !dbg !1543
  %107 = add i64 %104, %106, !dbg !1544
  call void @llvm.dbg.value(metadata i64 %102, metadata !365, metadata !DIExpression()), !dbg !1545
  %108 = and i64 %102, 2, !dbg !1548
  call void @llvm.dbg.value(metadata %struct.block* %100, metadata !375, metadata !DIExpression()), !dbg !1549
  call void @llvm.dbg.value(metadata i64 %107, metadata !380, metadata !DIExpression()), !dbg !1551
  call void @llvm.dbg.value(metadata i1 false, metadata !381, metadata !DIExpression()), !dbg !1552
  call void @llvm.dbg.value(metadata i64 %102, metadata !391, metadata !DIExpression()), !dbg !1553
  %109 = and i64 %102, 4, !dbg !1556
  call void @llvm.dbg.value(metadata i64 %107, metadata !401, metadata !DIExpression()), !dbg !1557
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1559
  call void @llvm.dbg.value(metadata i64 %107, metadata !409, metadata !DIExpression()), !dbg !1560
  call void @llvm.dbg.value(metadata i64 %107, metadata !409, metadata !DIExpression()), !dbg !1560
  call void @llvm.dbg.value(metadata i64 %107, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1560
  %110 = or i64 %107, %108, !dbg !1561
  call void @llvm.dbg.value(metadata i64 %110, metadata !409, metadata !DIExpression()), !dbg !1560
  %111 = or i64 %110, %109, !dbg !1562
  call void @llvm.dbg.value(metadata i64 %111, metadata !409, metadata !DIExpression()), !dbg !1560
  store i64 %111, i64* %101, align 8, !dbg !1563, !tbaa !120
  %112 = icmp ugt i64 %107, 16, !dbg !1564
  br i1 %112, label %113, label %120, !dbg !1565

; <label>:113:                                    ; preds = %99
  call void @llvm.dbg.value(metadata %struct.block* %100, metadata !419, metadata !DIExpression()), !dbg !1566
  %114 = getelementptr inbounds %struct.block, %struct.block* %100, i64 0, i32 1, !dbg !1568
  %115 = bitcast %union.anon* %114 to i8*, !dbg !1569
  call void @llvm.dbg.value(metadata i64 %111, metadata !111, metadata !DIExpression()), !dbg !1570
  %116 = getelementptr inbounds i8, i8* %115, i64 %107, !dbg !1573
  %117 = getelementptr inbounds i8, i8* %116, i64 -16, !dbg !1574
  %118 = bitcast i8* %117 to i64*, !dbg !1575
  call void @llvm.dbg.value(metadata i64* %118, metadata !383, metadata !DIExpression()), !dbg !1576
  call void @llvm.dbg.value(metadata i64 %111, metadata !391, metadata !DIExpression()), !dbg !1577
  call void @llvm.dbg.value(metadata i64 %107, metadata !401, metadata !DIExpression()), !dbg !1580
  call void @llvm.dbg.value(metadata i1 false, metadata !406, metadata !DIExpression()), !dbg !1582
  call void @llvm.dbg.value(metadata i64 %107, metadata !409, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %107, metadata !409, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %107, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %110, metadata !409, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.value(metadata i64 %111, metadata !409, metadata !DIExpression()), !dbg !1583
  store i64 %111, i64* %118, align 8, !dbg !1584, !tbaa !101
  %119 = load i64, i64* %101, align 8, !tbaa !120
  br label %120, !dbg !1585

; <label>:120:                                    ; preds = %99, %113
  %121 = phi i64 [ %111, %99 ], [ %119, %113 ]
  call void @llvm.dbg.value(metadata %struct.block* %100, metadata !165, metadata !DIExpression()), !dbg !1586
  %122 = bitcast %struct.block* %100 to i8*, !dbg !1588
  call void @llvm.dbg.value(metadata i64 %121, metadata !111, metadata !DIExpression()), !dbg !1589
  %123 = and i64 %121, -16, !dbg !1592
  %124 = getelementptr inbounds i8, i8* %122, i64 %123, !dbg !1593
  call void @llvm.dbg.value(metadata i8* %124, metadata !386, metadata !DIExpression()), !dbg !1594
  %125 = icmp ult i64 %107, 17, !dbg !1595
  %126 = bitcast i8* %124 to i64*
  %127 = load i64, i64* %126, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %127, metadata !111, metadata !DIExpression()), !dbg !1596
  call void @llvm.dbg.value(metadata i64 %127, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1599
  call void @llvm.dbg.value(metadata i64 %127, metadata !401, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1601
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1603
  call void @llvm.dbg.value(metadata i1 false, metadata !407, metadata !DIExpression()), !dbg !1604
  %128 = and i64 %127, -15, !dbg !1605
  call void @llvm.dbg.value(metadata i64 %128, metadata !409, metadata !DIExpression()), !dbg !1606
  call void @llvm.dbg.value(metadata i64 %128, metadata !409, metadata !DIExpression()), !dbg !1607
  call void @llvm.dbg.value(metadata i64 %128, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1606
  call void @llvm.dbg.value(metadata i64 %128, metadata !409, metadata !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value)), !dbg !1607
  call void @llvm.dbg.value(metadata i64 %128, metadata !409, metadata !DIExpression()), !dbg !1606
  call void @llvm.dbg.value(metadata i64 %128, metadata !409, metadata !DIExpression()), !dbg !1607
  call void @llvm.dbg.value(metadata i1 true, metadata !408, metadata !DIExpression()), !dbg !1608
  call void @llvm.dbg.value(metadata i64 %127, metadata !409, metadata !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value)), !dbg !1606
  %129 = or i64 %128, 4, !dbg !1609
  call void @llvm.dbg.value(metadata i64 %129, metadata !409, metadata !DIExpression()), !dbg !1606
  %130 = select i1 %125, i64 %129, i64 %128, !dbg !1610
  br label %131

; <label>:131:                                    ; preds = %31, %75, %120
  %132 = phi i64* [ %126, %120 ], [ %81, %75 ], [ %36, %31 ]
  %133 = phi i64 [ %130, %120 ], [ %85, %75 ], [ %40, %31 ]
  %134 = phi %struct.block* [ %100, %120 ], [ %58, %75 ], [ %0, %31 ]
  store i64 %133, i64* %132, align 8, !dbg !1611, !tbaa !120
  br label %135, !dbg !1612

; <label>:135:                                    ; preds = %131, %14
  %136 = phi %struct.block* [ %0, %14 ], [ %134, %131 ], !dbg !1613
  ret %struct.block* %136, !dbg !1612
}

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_realloc(i8*, i64) local_unnamed_addr #0 !dbg !1614 {
  call void @llvm.dbg.value(metadata i8* %0, metadata !1618, metadata !DIExpression()), !dbg !1623
  call void @llvm.dbg.value(metadata i64 %1, metadata !1619, metadata !DIExpression()), !dbg !1624
  call void @llvm.dbg.value(metadata i8* %0, metadata !355, metadata !DIExpression()), !dbg !1625
  %3 = getelementptr inbounds i8, i8* %0, i64 -8, !dbg !1627
  call void @llvm.dbg.value(metadata i8* %3, metadata !1620, metadata !DIExpression()), !dbg !1628
  %4 = icmp eq i64 %1, 0, !dbg !1629
  br i1 %4, label %5, label %6, !dbg !1631

; <label>:5:                                      ; preds = %2
  tail call void @mm_free(i8* %0), !dbg !1632
  br label %24, !dbg !1634

; <label>:6:                                      ; preds = %2
  %7 = icmp eq i8* %0, null, !dbg !1635
  %8 = tail call i8* @mm_malloc(i64 %1), !dbg !1637
  br i1 %7, label %24, label %9, !dbg !1638

; <label>:9:                                      ; preds = %6
  call void @llvm.dbg.value(metadata i8* %8, metadata !1622, metadata !DIExpression()), !dbg !1639
  %10 = icmp eq i8* %8, null, !dbg !1640
  br i1 %10, label %24, label %11, !dbg !1642

; <label>:11:                                     ; preds = %9
  %12 = bitcast i8* %3 to i64*
  %13 = load i64, i64* %12, align 8, !tbaa !120
  call void @llvm.dbg.value(metadata i64 %13, metadata !111, metadata !DIExpression()), !dbg !1643
  %14 = and i64 %13, -16, !dbg !1651
  call void @llvm.dbg.value(metadata i64 %14, metadata !1649, metadata !DIExpression()), !dbg !1652
  call void @llvm.dbg.value(metadata i64 %13, metadata !103, metadata !DIExpression()), !dbg !1653
  %15 = and i64 %13, 1, !dbg !1657
  %16 = icmp eq i64 %15, 0, !dbg !1658
  %17 = select i1 %16, i64 -16, i64 -8, !dbg !1659
  %18 = add i64 %17, %14, !dbg !1659
  call void @llvm.dbg.value(metadata i64 %18, metadata !1621, metadata !DIExpression()), !dbg !1660
  %19 = icmp ugt i64 %18, %1, !dbg !1661
  br i1 %19, label %22, label %20, !dbg !1663

; <label>:20:                                     ; preds = %11
  %21 = tail call i8* @mem_memcpy(i8* nonnull %8, i8* nonnull %0, i64 %18) #5, !dbg !1664
  tail call void @mm_free(i8* nonnull %0), !dbg !1665
  br label %24, !dbg !1663

; <label>:22:                                     ; preds = %11
  call void @llvm.dbg.value(metadata i64 %1, metadata !1621, metadata !DIExpression()), !dbg !1660
  %23 = tail call i8* @mem_memcpy(i8* nonnull %8, i8* nonnull %0, i64 %1) #5, !dbg !1664
  tail call void @mm_free(i8* nonnull %0), !dbg !1665
  br label %24, !dbg !1666

; <label>:24:                                     ; preds = %22, %20, %9, %6, %5
  %25 = phi i8* [ null, %5 ], [ %8, %6 ], [ null, %9 ], [ %8, %20 ], [ %8, %22 ], !dbg !1637
  ret i8* %25, !dbg !1668
}

declare dso_local i8* @mem_memcpy(i8*, i8*, i64) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local i8* @mm_calloc(i64, i64) local_unnamed_addr #0 !dbg !1669 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1673, metadata !DIExpression()), !dbg !1677
  call void @llvm.dbg.value(metadata i64 %1, metadata !1674, metadata !DIExpression()), !dbg !1678
  %3 = mul i64 %1, %0, !dbg !1679
  call void @llvm.dbg.value(metadata i64 %3, metadata !1676, metadata !DIExpression()), !dbg !1680
  %4 = icmp eq i64 %0, 0, !dbg !1681
  br i1 %4, label %13, label %5, !dbg !1683

; <label>:5:                                      ; preds = %2
  %6 = udiv i64 %3, %0, !dbg !1684
  %7 = icmp eq i64 %6, %1, !dbg !1686
  br i1 %7, label %8, label %13, !dbg !1687

; <label>:8:                                      ; preds = %5
  %9 = tail call i8* @mm_malloc(i64 %3), !dbg !1688
  call void @llvm.dbg.value(metadata i8* %9, metadata !1675, metadata !DIExpression()), !dbg !1689
  %10 = icmp eq i8* %9, null, !dbg !1690
  br i1 %10, label %13, label %11, !dbg !1692

; <label>:11:                                     ; preds = %8
  %12 = tail call i8* @mem_memset(i8* nonnull %9, i32 0, i64 %3) #5, !dbg !1693
  br label %13, !dbg !1694

; <label>:13:                                     ; preds = %8, %5, %2, %11
  %14 = phi i8* [ %9, %11 ], [ null, %2 ], [ null, %5 ], [ null, %8 ], !dbg !1695
  ret i8* %14, !dbg !1696
}

declare dso_local i8* @mem_memset(i8*, i32, i64) local_unnamed_addr #2

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!61, !62, !63}
!llvm.ident = !{!64}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "heap_start", scope: !2, file: !3, line: 140, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 (tags/RELEASE_700/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !35)
!3 = !DIFile(filename: "mm.c", directory: "/afs/andrew.cmu.edu/usr17/sshingad/private/15213/malloclab-f21-sshingade2002")
!4 = !{}
!5 = !{!6, !7, !30, !31, !32, !33}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "block_t", file: !3, line: 135, baseType: !9)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "block", file: !3, line: 119, size: 192, elements: !10)
!10 = !{!11, !16}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "header", scope: !9, file: !3, line: 121, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "word_t", file: !3, line: 77, baseType: !13)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !14, line: 55, baseType: !15)
!14 = !DIFile(filename: "/usr/include/stdint.h", directory: "/afs/andrew.cmu.edu/usr17/sshingad/private/15213/malloclab-f21-sshingade2002")
!15 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_member, scope: !9, file: !3, line: 123, baseType: !17, size: 128, offset: 64)
!17 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !9, file: !3, line: 123, size: 128, elements: !18)
!18 = !{!19, !25}
!19 = !DIDerivedType(tag: DW_TAG_member, scope: !17, file: !3, line: 124, baseType: !20, size: 128)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !17, file: !3, line: 124, size: 128, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !20, file: !3, line: 125, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "prev", scope: !20, file: !3, line: 126, baseType: !23, size: 64, offset: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !17, file: !3, line: 132, baseType: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, elements: !28)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !{!29}
!29 = !DISubrange(count: 0)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!31 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !14, line: 119, baseType: !34)
!34 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!35 = !{!36, !41, !43, !45, !47, !0, !52, !55, !57, !59}
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!37 = distinct !DIGlobalVariable(name: "min_block_size", scope: !2, file: !3, line: 86, type: !38, isLocal: true, isDefinition: true)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 62, baseType: !15)
!40 = !DIFile(filename: "/usr/local/depot/llvm-7.0/lib/clang/7.0.0/include/stddef.h", directory: "/afs/andrew.cmu.edu/usr17/sshingad/private/15213/malloclab-f21-sshingade2002")
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression(DW_OP_constu, 8, DW_OP_stack_value))
!42 = distinct !DIGlobalVariable(name: "wsize", scope: !2, file: !3, line: 80, type: !38, isLocal: true, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression(DW_OP_constu, 4096, DW_OP_stack_value))
!44 = distinct !DIGlobalVariable(name: "chunksize", scope: !2, file: !3, line: 92, type: !38, isLocal: true, isDefinition: true)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression(DW_OP_constu, 16, DW_OP_stack_value))
!46 = distinct !DIGlobalVariable(name: "dsize", scope: !2, file: !3, line: 83, type: !38, isLocal: true, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "list_heads", scope: !2, file: !3, line: 143, type: !49, isLocal: false, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 960, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 15)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression(DW_OP_constu, 1, DW_OP_stack_value))
!53 = distinct !DIGlobalVariable(name: "alloc_mask", scope: !2, file: !3, line: 98, type: !54, isLocal: true, isDefinition: true)
!54 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_stack_value))
!56 = distinct !DIGlobalVariable(name: "size_mask", scope: !2, file: !3, line: 116, type: !54, isLocal: true, isDefinition: true)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!58 = distinct !DIGlobalVariable(name: "alloc_mask_prev", scope: !2, file: !3, line: 104, type: !54, isLocal: true, isDefinition: true)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression(DW_OP_constu, 4, DW_OP_stack_value))
!60 = distinct !DIGlobalVariable(name: "mask_min", scope: !2, file: !3, line: 110, type: !54, isLocal: true, isDefinition: true)
!61 = !{i32 2, !"Dwarf Version", i32 4}
!62 = !{i32 2, !"Debug Info Version", i32 3}
!63 = !{i32 1, !"wchar_size", i32 4}
!64 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
!65 = distinct !DISubprogram(name: "mm_checkheap", scope: !3, file: !3, line: 847, type: !66, isLocal: false, isDefinition: true, scopeLine: 847, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !69)
!66 = !DISubroutineType(types: !67)
!67 = !{!31, !68}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !{!70, !71, !72, !73, !74, !75, !76, !78, !81}
!70 = !DILocalVariable(name: "line", arg: 1, scope: !65, file: !3, line: 847, type: !68)
!71 = !DILocalVariable(name: "prologueinfo", scope: !65, file: !3, line: 850, type: !30)
!72 = !DILocalVariable(name: "freeblocks", scope: !65, file: !3, line: 854, type: !39)
!73 = !DILocalVariable(name: "lastfree", scope: !65, file: !3, line: 855, type: !31)
!74 = !DILocalVariable(name: "block", scope: !65, file: !3, line: 856, type: !7)
!75 = !DILocalVariable(name: "freelinks", scope: !65, file: !3, line: 897, type: !39)
!76 = !DILocalVariable(name: "i", scope: !77, file: !3, line: 898, type: !39)
!77 = distinct !DILexicalBlock(scope: !65, file: !3, line: 898, column: 5)
!78 = !DILocalVariable(name: "head", scope: !79, file: !3, line: 899, type: !7)
!79 = distinct !DILexicalBlock(scope: !80, file: !3, line: 898, column: 37)
!80 = distinct !DILexicalBlock(scope: !77, file: !3, line: 898, column: 5)
!81 = !DILocalVariable(name: "curr", scope: !82, file: !3, line: 901, type: !7)
!82 = distinct !DILexicalBlock(scope: !79, file: !3, line: 901, column: 9)
!83 = !DILocation(line: 847, column: 23, scope: !65)
!84 = !DILocation(line: 850, column: 45, scope: !65)
!85 = !{!86, !86, i64 0}
!86 = !{!"any pointer", !87, i64 0}
!87 = !{!"omnipotent char", !88, i64 0}
!88 = !{!"Simple C/C++ TBAA"}
!89 = !DILocalVariable(name: "block", arg: 1, scope: !90, file: !3, line: 630, type: !7)
!90 = distinct !DISubprogram(name: "find_prev_footer", scope: !3, file: !3, line: 630, type: !91, isLocal: true, isDefinition: true, scopeLine: 630, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !93)
!91 = !DISubroutineType(types: !92)
!92 = !{!30, !7}
!93 = !{!89}
!94 = !DILocation(line: 630, column: 42, scope: !90, inlinedAt: !95)
!95 = distinct !DILocation(line: 850, column: 28, scope: !65)
!96 = !DILocation(line: 632, column: 21, scope: !90, inlinedAt: !95)
!97 = !DILocation(line: 632, column: 29, scope: !90, inlinedAt: !95)
!98 = !DILocation(line: 850, column: 13, scope: !65)
!99 = !DILocation(line: 851, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !65, file: !3, line: 851, column: 9)
!101 = !{!102, !102, i64 0}
!102 = !{!"long", !87, i64 0}
!103 = !DILocalVariable(name: "word", arg: 1, scope: !104, file: !3, line: 487, type: !12)
!104 = distinct !DISubprogram(name: "extract_alloc", scope: !3, file: !3, line: 487, type: !105, isLocal: true, isDefinition: true, scopeLine: 487, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !107)
!105 = !DISubroutineType(types: !106)
!106 = !{!31, !12}
!107 = !{!103}
!108 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !109)
!109 = distinct !DILocation(line: 851, column: 11, scope: !100)
!110 = !DILocation(line: 851, column: 40, scope: !100)
!111 = !DILocalVariable(name: "word", arg: 1, scope: !112, file: !3, line: 264, type: !12)
!112 = distinct !DISubprogram(name: "extract_size", scope: !3, file: !3, line: 264, type: !113, isLocal: true, isDefinition: true, scopeLine: 264, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !115)
!113 = !DISubroutineType(types: !114)
!114 = !{!39, !12}
!115 = !{!111}
!116 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !117)
!117 = distinct !DILocation(line: 851, column: 43, scope: !100)
!118 = !DILocation(line: 856, column: 14, scope: !65)
!119 = !DILocation(line: 854, column: 12, scope: !65)
!120 = !{!121, !102, i64 0}
!121 = !{!"block", !102, i64 0, !87, i64 8}
!122 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !123)
!123 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !129)
!124 = distinct !DISubprogram(name: "get_size", scope: !3, file: !3, line: 273, type: !125, isLocal: true, isDefinition: true, scopeLine: 273, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !127)
!125 = !DISubroutineType(types: !126)
!126 = !{!39, !7}
!127 = !{!128}
!128 = !DILocalVariable(name: "block", arg: 1, scope: !124, file: !3, line: 273, type: !7)
!129 = distinct !DILocation(line: 857, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !131, file: !3, line: 857, column: 5)
!131 = distinct !DILexicalBlock(scope: !65, file: !3, line: 857, column: 5)
!132 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !123)
!133 = !DILocation(line: 857, column: 46, scope: !130)
!134 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !135)
!135 = distinct !DILocation(line: 497, column: 12, scope: !136, inlinedAt: !141)
!136 = distinct !DISubprogram(name: "get_alloc", scope: !3, file: !3, line: 496, type: !137, isLocal: true, isDefinition: true, scopeLine: 496, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !139)
!137 = !DISubroutineType(types: !138)
!138 = !{!31, !7}
!139 = !{!140}
!140 = !DILocalVariable(name: "block", arg: 1, scope: !136, file: !3, line: 496, type: !7)
!141 = distinct !DILocation(line: 0, scope: !142)
!142 = distinct !DILexicalBlock(scope: !65, file: !3, line: 886, column: 9)
!143 = !DILocation(line: 488, column: 24, scope: !104, inlinedAt: !135)
!144 = !DILocation(line: 488, column: 12, scope: !104, inlinedAt: !135)
!145 = !DILocation(line: 857, column: 5, scope: !131)
!146 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !147)
!147 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !148)
!148 = distinct !DILocation(line: 867, column: 13, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !3, line: 867, column: 13)
!150 = distinct !DILexicalBlock(scope: !130, file: !3, line: 857, column: 77)
!151 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !152)
!152 = distinct !DILocation(line: 497, column: 12, scope: !136, inlinedAt: !153)
!153 = distinct !DILocation(line: 872, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 872, column: 13)
!155 = !DILocation(line: 872, column: 13, scope: !150)
!156 = !DILocation(line: 874, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 872, column: 32)
!158 = !DILocation(line: 873, column: 23, scope: !157)
!159 = !DILocation(line: 855, column: 10, scope: !65)
!160 = !DILocation(line: 880, column: 9, scope: !157)
!161 = !DILocation(line: 0, scope: !157)
!162 = !DILocation(line: 0, scope: !163)
!163 = distinct !DILexicalBlock(scope: !164, file: !3, line: 877, column: 20)
!164 = distinct !DILexicalBlock(scope: !157, file: !3, line: 874, column: 17)
!165 = !DILocalVariable(name: "block", arg: 1, scope: !166, file: !3, line: 585, type: !7)
!166 = distinct !DISubprogram(name: "find_next", scope: !3, file: !3, line: 585, type: !167, isLocal: true, isDefinition: true, scopeLine: 585, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !169)
!167 = !DISubroutineType(types: !168)
!168 = !{!7, !7}
!169 = !{!165}
!170 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !171)
!171 = distinct !DILocation(line: 857, column: 59, scope: !130)
!172 = !DILocation(line: 589, column: 24, scope: !166, inlinedAt: !171)
!173 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !174)
!174 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !175)
!175 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !171)
!176 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !171)
!177 = !DILocation(line: 589, column: 12, scope: !166, inlinedAt: !171)
!178 = distinct !{!178, !145, !179}
!179 = !DILocation(line: 884, column: 5, scope: !131)
!180 = !DILocation(line: 886, column: 28, scope: !142)
!181 = !DILocation(line: 898, column: 17, scope: !77)
!182 = !DILocation(line: 897, column: 12, scope: !65)
!183 = !DILocation(line: 899, column: 25, scope: !79)
!184 = !DILocation(line: 899, column: 18, scope: !79)
!185 = !DILocation(line: 900, column: 9, scope: !79)
!186 = !DILocation(line: 901, column: 23, scope: !82)
!187 = !DILocation(line: 901, column: 41, scope: !188)
!188 = distinct !DILexicalBlock(scope: !82, file: !3, line: 901, column: 9)
!189 = !DILocation(line: 901, column: 9, scope: !82)
!190 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !191)
!191 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !192)
!192 = distinct !DILocation(line: 903, column: 39, scope: !193)
!193 = distinct !DILexicalBlock(scope: !188, file: !3, line: 901, column: 69)
!194 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !191)
!195 = !DILocation(line: 903, column: 13, scope: !193)
!196 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !197)
!197 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !198)
!198 = distinct !DILocation(line: 905, column: 37, scope: !199)
!199 = distinct !DILexicalBlock(scope: !193, file: !3, line: 905, column: 17)
!200 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !197)
!201 = !DILocalVariable(name: "size", arg: 1, scope: !202, file: !3, line: 219, type: !39)
!202 = distinct !DISubprogram(name: "find_size_list", scope: !3, file: !3, line: 219, type: !203, isLocal: true, isDefinition: true, scopeLine: 219, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !205)
!203 = !DISubroutineType(types: !204)
!204 = !{!39, !39}
!205 = !{!201}
!206 = !DILocation(line: 219, column: 37, scope: !202, inlinedAt: !207)
!207 = distinct !DILocation(line: 905, column: 22, scope: !199)
!208 = !DILocation(line: 220, column: 14, scope: !209, inlinedAt: !207)
!209 = distinct !DILexicalBlock(scope: !202, file: !3, line: 220, column: 9)
!210 = !DILocation(line: 220, column: 9, scope: !202, inlinedAt: !207)
!211 = !DILocation(line: 222, column: 21, scope: !212, inlinedAt: !207)
!212 = distinct !DILexicalBlock(scope: !209, file: !3, line: 222, column: 16)
!213 = !DILocation(line: 222, column: 16, scope: !209, inlinedAt: !207)
!214 = !DILocation(line: 224, column: 21, scope: !215, inlinedAt: !207)
!215 = distinct !DILexicalBlock(scope: !212, file: !3, line: 224, column: 16)
!216 = !DILocation(line: 224, column: 16, scope: !212, inlinedAt: !207)
!217 = !DILocation(line: 226, column: 21, scope: !218, inlinedAt: !207)
!218 = distinct !DILexicalBlock(scope: !215, file: !3, line: 226, column: 16)
!219 = !DILocation(line: 226, column: 16, scope: !215, inlinedAt: !207)
!220 = !DILocation(line: 228, column: 21, scope: !221, inlinedAt: !207)
!221 = distinct !DILexicalBlock(scope: !218, file: !3, line: 228, column: 16)
!222 = !DILocation(line: 228, column: 16, scope: !218, inlinedAt: !207)
!223 = !DILocation(line: 230, column: 21, scope: !224, inlinedAt: !207)
!224 = distinct !DILexicalBlock(scope: !221, file: !3, line: 230, column: 16)
!225 = !DILocation(line: 230, column: 16, scope: !221, inlinedAt: !207)
!226 = !DILocation(line: 232, column: 21, scope: !227, inlinedAt: !207)
!227 = distinct !DILexicalBlock(scope: !224, file: !3, line: 232, column: 16)
!228 = !DILocation(line: 232, column: 16, scope: !224, inlinedAt: !207)
!229 = !DILocation(line: 234, column: 21, scope: !230, inlinedAt: !207)
!230 = distinct !DILexicalBlock(scope: !227, file: !3, line: 234, column: 16)
!231 = !DILocation(line: 234, column: 16, scope: !227, inlinedAt: !207)
!232 = !DILocation(line: 236, column: 21, scope: !233, inlinedAt: !207)
!233 = distinct !DILexicalBlock(scope: !230, file: !3, line: 236, column: 16)
!234 = !DILocation(line: 236, column: 16, scope: !230, inlinedAt: !207)
!235 = !DILocation(line: 238, column: 21, scope: !236, inlinedAt: !207)
!236 = distinct !DILexicalBlock(scope: !233, file: !3, line: 238, column: 16)
!237 = !DILocation(line: 238, column: 16, scope: !233, inlinedAt: !207)
!238 = !DILocation(line: 240, column: 21, scope: !239, inlinedAt: !207)
!239 = distinct !DILexicalBlock(scope: !236, file: !3, line: 240, column: 16)
!240 = !DILocation(line: 240, column: 16, scope: !236, inlinedAt: !207)
!241 = !DILocation(line: 242, column: 21, scope: !242, inlinedAt: !207)
!242 = distinct !DILexicalBlock(scope: !239, file: !3, line: 242, column: 16)
!243 = !DILocation(line: 242, column: 16, scope: !239, inlinedAt: !207)
!244 = !DILocation(line: 244, column: 21, scope: !245, inlinedAt: !207)
!245 = distinct !DILexicalBlock(scope: !242, file: !3, line: 244, column: 16)
!246 = !DILocation(line: 244, column: 16, scope: !242, inlinedAt: !207)
!247 = !DILocation(line: 246, column: 21, scope: !248, inlinedAt: !207)
!248 = distinct !DILexicalBlock(scope: !245, file: !3, line: 246, column: 16)
!249 = !DILocation(line: 247, column: 9, scope: !250, inlinedAt: !207)
!250 = distinct !DILexicalBlock(scope: !248, file: !3, line: 246, column: 29)
!251 = !DILocation(line: 0, scope: !252, inlinedAt: !207)
!252 = distinct !DILexicalBlock(scope: !248, file: !3, line: 250, column: 10)
!253 = !DILocation(line: 905, column: 19, scope: !199)
!254 = !DILocation(line: 905, column: 17, scope: !193)
!255 = !DILocation(line: 909, column: 22, scope: !193)
!256 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !257)
!257 = distinct !DILocation(line: 497, column: 12, scope: !136, inlinedAt: !258)
!258 = distinct !DILocation(line: 910, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !193, file: !3, line: 910, column: 17)
!260 = !DILocation(line: 488, column: 24, scope: !104, inlinedAt: !257)
!261 = !DILocation(line: 488, column: 12, scope: !104, inlinedAt: !257)
!262 = !DILocation(line: 910, column: 17, scope: !193)
!263 = !DILocation(line: 914, column: 35, scope: !264)
!264 = distinct !DILexicalBlock(scope: !193, file: !3, line: 914, column: 17)
!265 = !DILocation(line: 914, column: 24, scope: !264)
!266 = !DILocation(line: 914, column: 22, scope: !264)
!267 = !DILocation(line: 914, column: 49, scope: !264)
!268 = !DILocation(line: 915, column: 35, scope: !264)
!269 = !DILocation(line: 915, column: 24, scope: !264)
!270 = !DILocation(line: 915, column: 22, scope: !264)
!271 = !DILocation(line: 914, column: 17, scope: !193)
!272 = !DILocation(line: 919, column: 22, scope: !273)
!273 = distinct !DILexicalBlock(scope: !193, file: !3, line: 919, column: 17)
!274 = !DILocation(line: 919, column: 30, scope: !273)
!275 = !DILocation(line: 901, column: 63, scope: !188)
!276 = !{!87, !87, i64 0}
!277 = !DILocation(line: 919, column: 39, scope: !273)
!278 = !DILocation(line: 919, column: 44, scope: !273)
!279 = !DILocation(line: 919, column: 52, scope: !273)
!280 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !281)
!281 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !282)
!282 = distinct !DILocation(line: 920, column: 17, scope: !273)
!283 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !281)
!284 = !DILocation(line: 920, column: 38, scope: !273)
!285 = !DILocation(line: 919, column: 17, scope: !193)
!286 = !DILocation(line: 921, column: 43, scope: !287)
!287 = distinct !DILexicalBlock(scope: !288, file: !3, line: 921, column: 21)
!288 = distinct !DILexicalBlock(scope: !273, file: !3, line: 920, column: 56)
!289 = !DILocation(line: 921, column: 28, scope: !287)
!290 = !DILocation(line: 921, column: 21, scope: !288)
!291 = distinct !{!291, !189, !292}
!292 = !DILocation(line: 926, column: 9, scope: !82)
!293 = !DILocation(line: 0, scope: !193)
!294 = !DILocation(line: 898, column: 33, scope: !80)
!295 = !DILocation(line: 898, column: 26, scope: !80)
!296 = !DILocation(line: 898, column: 5, scope: !77)
!297 = distinct !{!297, !296, !298}
!298 = !DILocation(line: 927, column: 5, scope: !77)
!299 = !DILocation(line: 929, column: 19, scope: !300)
!300 = distinct !DILexicalBlock(scope: !65, file: !3, line: 929, column: 9)
!301 = !DILocation(line: 0, scope: !302)
!302 = distinct !DILexicalBlock(scope: !100, file: !3, line: 851, column: 78)
!303 = !DILocation(line: 937, column: 1, scope: !65)
!304 = distinct !DISubprogram(name: "mm_init", scope: !3, file: !3, line: 947, type: !305, isLocal: false, isDefinition: true, scopeLine: 947, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !307)
!305 = !DISubroutineType(types: !306)
!306 = !{!31}
!307 = !{!308, !309}
!308 = !DILocalVariable(name: "start", scope: !304, file: !3, line: 949, type: !30)
!309 = !DILocalVariable(name: "i", scope: !310, file: !3, line: 951, type: !39)
!310 = distinct !DILexicalBlock(scope: !304, file: !3, line: 951, column: 5)
!311 = !DILocation(line: 949, column: 32, scope: !304)
!312 = !DILocation(line: 951, column: 17, scope: !310)
!313 = !DILocation(line: 952, column: 23, scope: !314)
!314 = distinct !DILexicalBlock(scope: !315, file: !3, line: 951, column: 37)
!315 = distinct !DILexicalBlock(scope: !310, file: !3, line: 951, column: 5)
!316 = !DILocation(line: 955, column: 15, scope: !317)
!317 = distinct !DILexicalBlock(scope: !304, file: !3, line: 955, column: 9)
!318 = !DILocation(line: 955, column: 9, scope: !304)
!319 = !DILocation(line: 949, column: 13, scope: !304)
!320 = !DILocation(line: 960, column: 5, scope: !304)
!321 = !DILocation(line: 959, column: 14, scope: !304)
!322 = !DILocation(line: 963, column: 16, scope: !304)
!323 = !DILocation(line: 968, column: 9, scope: !324)
!324 = distinct !DILexicalBlock(scope: !304, file: !3, line: 968, column: 9)
!325 = !DILocation(line: 968, column: 32, scope: !324)
!326 = !DILocation(line: 969, column: 9, scope: !327)
!327 = distinct !DILexicalBlock(scope: !324, file: !3, line: 968, column: 41)
!328 = !DILocation(line: 0, scope: !304)
!329 = !DILocation(line: 973, column: 1, scope: !304)
!330 = distinct !DISubprogram(name: "extend_heap", scope: !3, file: !3, line: 738, type: !331, isLocal: true, isDefinition: true, scopeLine: 738, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !333)
!331 = !DISubroutineType(types: !332)
!332 = !{!7, !39}
!333 = !{!334, !335, !336, !337}
!334 = !DILocalVariable(name: "size", arg: 1, scope: !330, file: !3, line: 738, type: !39)
!335 = !DILocalVariable(name: "bp", scope: !330, file: !3, line: 739, type: !6)
!336 = !DILocalVariable(name: "block", scope: !330, file: !3, line: 755, type: !7)
!337 = !DILocalVariable(name: "block_next", scope: !330, file: !3, line: 760, type: !7)
!338 = !DILocation(line: 738, column: 36, scope: !330)
!339 = !DILocalVariable(name: "size", arg: 1, scope: !340, file: !3, line: 181, type: !39)
!340 = distinct !DISubprogram(name: "round_up", scope: !3, file: !3, line: 181, type: !341, isLocal: true, isDefinition: true, scopeLine: 181, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !343)
!341 = !DISubroutineType(types: !342)
!342 = !{!39, !39, !39}
!343 = !{!339, !344}
!344 = !DILocalVariable(name: "n", arg: 2, scope: !340, file: !3, line: 181, type: !39)
!345 = !DILocation(line: 181, column: 31, scope: !340, inlinedAt: !346)
!346 = distinct !DILocation(line: 741, column: 12, scope: !330)
!347 = !DILocation(line: 181, column: 44, scope: !340, inlinedAt: !346)
!348 = !DILocation(line: 182, column: 23, scope: !340, inlinedAt: !346)
!349 = !DILocation(line: 182, column: 14, scope: !340, inlinedAt: !346)
!350 = !DILocation(line: 742, column: 15, scope: !351)
!351 = distinct !DILexicalBlock(scope: !330, file: !3, line: 742, column: 9)
!352 = !DILocation(line: 739, column: 11, scope: !330)
!353 = !DILocation(line: 742, column: 41, scope: !351)
!354 = !DILocation(line: 742, column: 9, scope: !330)
!355 = !DILocalVariable(name: "bp", arg: 1, scope: !356, file: !3, line: 283, type: !6)
!356 = distinct !DISubprogram(name: "payload_to_header", scope: !3, file: !3, line: 283, type: !357, isLocal: true, isDefinition: true, scopeLine: 283, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !359)
!357 = !DISubroutineType(types: !358)
!358 = !{!7, !6}
!359 = !{!355}
!360 = !DILocation(line: 283, column: 41, scope: !356, inlinedAt: !361)
!361 = distinct !DILocation(line: 755, column: 22, scope: !330)
!362 = !DILocation(line: 284, column: 35, scope: !356, inlinedAt: !361)
!363 = !DILocation(line: 284, column: 12, scope: !356, inlinedAt: !361)
!364 = !DILocation(line: 755, column: 14, scope: !330)
!365 = !DILocalVariable(name: "word", arg: 1, scope: !366, file: !3, line: 508, type: !12)
!366 = distinct !DISubprogram(name: "extract_alloc_prev", scope: !3, file: !3, line: 508, type: !105, isLocal: true, isDefinition: true, scopeLine: 508, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !367)
!367 = !{!365}
!368 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !369)
!369 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !373)
!370 = distinct !DISubprogram(name: "get_alloc_prev", scope: !3, file: !3, line: 519, type: !137, isLocal: true, isDefinition: true, scopeLine: 519, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !371)
!371 = !{!372}
!372 = !DILocalVariable(name: "block", arg: 1, scope: !370, file: !3, line: 519, type: !7)
!373 = distinct !DILocation(line: 757, column: 37, scope: !330)
!374 = !DILocation(line: 510, column: 44, scope: !366, inlinedAt: !369)
!375 = !DILocalVariable(name: "block", arg: 1, scope: !376, file: !3, line: 607, type: !7)
!376 = distinct !DISubprogram(name: "write_block", scope: !3, file: !3, line: 607, type: !377, isLocal: true, isDefinition: true, scopeLine: 608, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !379)
!377 = !DISubroutineType(types: !378)
!378 = !{null, !7, !39, !31, !31}
!379 = !{!375, !380, !381, !382, !383, !386}
!380 = !DILocalVariable(name: "size", arg: 2, scope: !376, file: !3, line: 607, type: !39)
!381 = !DILocalVariable(name: "alloc", arg: 3, scope: !376, file: !3, line: 607, type: !31)
!382 = !DILocalVariable(name: "alloc_prev", arg: 4, scope: !376, file: !3, line: 608, type: !31)
!383 = !DILocalVariable(name: "footerp", scope: !384, file: !3, line: 614, type: !30)
!384 = distinct !DILexicalBlock(scope: !385, file: !3, line: 613, column: 42)
!385 = distinct !DILexicalBlock(scope: !376, file: !3, line: 613, column: 9)
!386 = !DILocalVariable(name: "next", scope: !376, file: !3, line: 617, type: !7)
!387 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !388)
!388 = distinct !DILocation(line: 757, column: 5, scope: !330)
!389 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !388)
!390 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !388)
!391 = !DILocalVariable(name: "word", arg: 1, scope: !392, file: !3, line: 531, type: !12)
!392 = distinct !DISubprogram(name: "extract_min_status", scope: !3, file: !3, line: 531, type: !105, isLocal: true, isDefinition: true, scopeLine: 531, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !393)
!393 = !{!391}
!394 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !395)
!395 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !399)
!396 = distinct !DISubprogram(name: "get_min_status", scope: !3, file: !3, line: 540, type: !137, isLocal: true, isDefinition: true, scopeLine: 540, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !397)
!397 = !{!398}
!398 = !DILocalVariable(name: "block", arg: 1, scope: !396, file: !3, line: 540, type: !7)
!399 = distinct !DILocation(line: 612, column: 51, scope: !376, inlinedAt: !388)
!400 = !DILocation(line: 533, column: 37, scope: !392, inlinedAt: !395)
!401 = !DILocalVariable(name: "size", arg: 1, scope: !402, file: !3, line: 199, type: !39)
!402 = distinct !DISubprogram(name: "pack", scope: !3, file: !3, line: 199, type: !403, isLocal: true, isDefinition: true, scopeLine: 199, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !405)
!403 = !DISubroutineType(types: !404)
!404 = !{!12, !39, !31, !31, !31}
!405 = !{!401, !406, !407, !408, !409}
!406 = !DILocalVariable(name: "alloc", arg: 2, scope: !402, file: !3, line: 199, type: !31)
!407 = !DILocalVariable(name: "prev_alloc", arg: 3, scope: !402, file: !3, line: 199, type: !31)
!408 = !DILocalVariable(name: "min_status", arg: 4, scope: !402, file: !3, line: 199, type: !31)
!409 = !DILocalVariable(name: "word", scope: !402, file: !3, line: 200, type: !12)
!410 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !411)
!411 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !388)
!412 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !411)
!413 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !411)
!414 = !DILocation(line: 204, column: 9, scope: !402, inlinedAt: !411)
!415 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !411)
!416 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !388)
!417 = !DILocation(line: 613, column: 24, scope: !385, inlinedAt: !388)
!418 = !DILocation(line: 613, column: 16, scope: !385, inlinedAt: !388)
!419 = !DILocalVariable(name: "block", arg: 1, scope: !420, file: !3, line: 306, type: !7)
!420 = distinct !DISubprogram(name: "header_to_footer", scope: !3, file: !3, line: 306, type: !91, isLocal: true, isDefinition: true, scopeLine: 306, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !421)
!421 = !{!419}
!422 = !DILocation(line: 306, column: 42, scope: !420, inlinedAt: !423)
!423 = distinct !DILocation(line: 614, column: 27, scope: !384, inlinedAt: !388)
!424 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !425)
!425 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !426)
!426 = distinct !DILocation(line: 309, column: 40, scope: !420, inlinedAt: !423)
!427 = !DILocation(line: 309, column: 38, scope: !420, inlinedAt: !423)
!428 = !DILocation(line: 309, column: 56, scope: !420, inlinedAt: !423)
!429 = !DILocation(line: 309, column: 12, scope: !420, inlinedAt: !423)
!430 = !DILocation(line: 614, column: 17, scope: !384, inlinedAt: !388)
!431 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !432)
!432 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !433)
!433 = distinct !DILocation(line: 615, column: 50, scope: !384, inlinedAt: !388)
!434 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !435)
!435 = distinct !DILocation(line: 615, column: 20, scope: !384, inlinedAt: !388)
!436 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !435)
!437 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !435)
!438 = !DILocation(line: 615, column: 18, scope: !384, inlinedAt: !388)
!439 = !DILocation(line: 616, column: 5, scope: !384, inlinedAt: !388)
!440 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !441)
!441 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !388)
!442 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !443)
!443 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !444)
!444 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !441)
!445 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !443)
!446 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !441)
!447 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !388)
!448 = !DILocation(line: 618, column: 14, scope: !449, inlinedAt: !388)
!449 = distinct !DILexicalBlock(scope: !376, file: !3, line: 618, column: 9)
!450 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !451)
!451 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !452)
!452 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !388)
!453 = distinct !DILexicalBlock(scope: !449, file: !3, line: 620, column: 12)
!454 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !455)
!455 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !388)
!456 = distinct !DILexicalBlock(scope: !449, file: !3, line: 618, column: 33)
!457 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !458)
!458 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !388)
!459 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !455)
!460 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !458)
!461 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !455)
!462 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !455)
!463 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !458)
!464 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !455)
!465 = !DILocation(line: 208, column: 14, scope: !466, inlinedAt: !455)
!466 = distinct !DILexicalBlock(scope: !467, file: !3, line: 207, column: 21)
!467 = distinct !DILexicalBlock(scope: !402, file: !3, line: 207, column: 9)
!468 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !388)
!469 = !DILocation(line: 0, scope: !456, inlinedAt: !388)
!470 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !471)
!471 = distinct !DILocation(line: 760, column: 27, scope: !330)
!472 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !473)
!473 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !474)
!474 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !471)
!475 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !473)
!476 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !471)
!477 = !DILocation(line: 760, column: 14, scope: !330)
!478 = !DILocalVariable(name: "block", arg: 1, scope: !479, file: !3, line: 551, type: !7)
!479 = distinct !DISubprogram(name: "write_epilogue", scope: !3, file: !3, line: 551, type: !480, isLocal: true, isDefinition: true, scopeLine: 551, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !482)
!480 = !DISubroutineType(types: !481)
!481 = !{null, !7, !31}
!482 = !{!478, !483}
!483 = !DILocalVariable(name: "prev_alloc", arg: 2, scope: !479, file: !3, line: 551, type: !31)
!484 = !DILocation(line: 551, column: 37, scope: !479, inlinedAt: !485)
!485 = distinct !DILocation(line: 762, column: 5, scope: !330)
!486 = !DILocation(line: 551, column: 49, scope: !479, inlinedAt: !485)
!487 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !488)
!488 = distinct !DILocation(line: 554, column: 21, scope: !479, inlinedAt: !485)
!489 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !488)
!490 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !488)
!491 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !488)
!492 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !488)
!493 = !DILocation(line: 554, column: 12, scope: !479, inlinedAt: !485)
!494 = !DILocation(line: 554, column: 19, scope: !479, inlinedAt: !485)
!495 = !DILocation(line: 765, column: 13, scope: !330)
!496 = !DILocalVariable(name: "block", arg: 1, scope: !497, file: !3, line: 356, type: !7)
!497 = distinct !DISubprogram(name: "block_insertion", scope: !3, file: !3, line: 356, type: !167, isLocal: true, isDefinition: true, scopeLine: 356, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !498)
!498 = !{!496, !499}
!499 = !DILocalVariable(name: "index", scope: !497, file: !3, line: 361, type: !39)
!500 = !DILocation(line: 356, column: 42, scope: !497, inlinedAt: !501)
!501 = distinct !DILocation(line: 768, column: 5, scope: !330)
!502 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !503)
!503 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !504)
!504 = distinct !DILocation(line: 358, column: 9, scope: !505, inlinedAt: !501)
!505 = distinct !DILexicalBlock(scope: !497, file: !3, line: 358, column: 9)
!506 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !503)
!507 = !DILocation(line: 358, column: 25, scope: !505, inlinedAt: !501)
!508 = !DILocation(line: 358, column: 9, scope: !497, inlinedAt: !501)
!509 = !DILocalVariable(name: "block", arg: 1, scope: !510, file: !3, line: 344, type: !7)
!510 = distinct !DISubprogram(name: "min_block_insertion", scope: !3, file: !3, line: 344, type: !167, isLocal: true, isDefinition: true, scopeLine: 344, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !511)
!511 = !{!509}
!512 = !DILocation(line: 344, column: 46, scope: !510, inlinedAt: !513)
!513 = distinct !DILocation(line: 359, column: 16, scope: !514, inlinedAt: !501)
!514 = distinct !DILexicalBlock(scope: !505, file: !3, line: 358, column: 44)
!515 = !DILocation(line: 345, column: 19, scope: !510, inlinedAt: !513)
!516 = !DILocation(line: 345, column: 12, scope: !510, inlinedAt: !513)
!517 = !DILocation(line: 345, column: 17, scope: !510, inlinedAt: !513)
!518 = !DILocation(line: 346, column: 19, scope: !510, inlinedAt: !513)
!519 = !DILocation(line: 359, column: 9, scope: !514, inlinedAt: !501)
!520 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !521)
!521 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !522)
!522 = distinct !DILocation(line: 361, column: 35, scope: !497, inlinedAt: !501)
!523 = !DILocation(line: 219, column: 37, scope: !202, inlinedAt: !524)
!524 = distinct !DILocation(line: 361, column: 20, scope: !497, inlinedAt: !501)
!525 = !DILocation(line: 222, column: 21, scope: !212, inlinedAt: !524)
!526 = !DILocation(line: 222, column: 16, scope: !209, inlinedAt: !524)
!527 = !DILocation(line: 224, column: 21, scope: !215, inlinedAt: !524)
!528 = !DILocation(line: 224, column: 16, scope: !212, inlinedAt: !524)
!529 = !DILocation(line: 226, column: 21, scope: !218, inlinedAt: !524)
!530 = !DILocation(line: 226, column: 16, scope: !215, inlinedAt: !524)
!531 = !DILocation(line: 228, column: 21, scope: !221, inlinedAt: !524)
!532 = !DILocation(line: 228, column: 16, scope: !218, inlinedAt: !524)
!533 = !DILocation(line: 230, column: 21, scope: !224, inlinedAt: !524)
!534 = !DILocation(line: 230, column: 16, scope: !221, inlinedAt: !524)
!535 = !DILocation(line: 232, column: 21, scope: !227, inlinedAt: !524)
!536 = !DILocation(line: 232, column: 16, scope: !224, inlinedAt: !524)
!537 = !DILocation(line: 234, column: 21, scope: !230, inlinedAt: !524)
!538 = !DILocation(line: 234, column: 16, scope: !227, inlinedAt: !524)
!539 = !DILocation(line: 236, column: 21, scope: !233, inlinedAt: !524)
!540 = !DILocation(line: 236, column: 16, scope: !230, inlinedAt: !524)
!541 = !DILocation(line: 238, column: 21, scope: !236, inlinedAt: !524)
!542 = !DILocation(line: 238, column: 16, scope: !233, inlinedAt: !524)
!543 = !DILocation(line: 240, column: 21, scope: !239, inlinedAt: !524)
!544 = !DILocation(line: 240, column: 16, scope: !236, inlinedAt: !524)
!545 = !DILocation(line: 242, column: 21, scope: !242, inlinedAt: !524)
!546 = !DILocation(line: 242, column: 16, scope: !239, inlinedAt: !524)
!547 = !DILocation(line: 244, column: 21, scope: !245, inlinedAt: !524)
!548 = !DILocation(line: 244, column: 16, scope: !242, inlinedAt: !524)
!549 = !DILocation(line: 246, column: 21, scope: !248, inlinedAt: !524)
!550 = !DILocation(line: 247, column: 9, scope: !250, inlinedAt: !524)
!551 = !DILocation(line: 0, scope: !252, inlinedAt: !524)
!552 = !DILocation(line: 361, column: 12, scope: !497, inlinedAt: !501)
!553 = !DILocation(line: 364, column: 19, scope: !497, inlinedAt: !501)
!554 = !DILocation(line: 364, column: 12, scope: !497, inlinedAt: !501)
!555 = !DILocation(line: 364, column: 17, scope: !497, inlinedAt: !501)
!556 = !DILocation(line: 365, column: 12, scope: !497, inlinedAt: !501)
!557 = !DILocation(line: 365, column: 17, scope: !497, inlinedAt: !501)
!558 = !DILocation(line: 366, column: 9, scope: !559, inlinedAt: !501)
!559 = distinct !DILexicalBlock(scope: !497, file: !3, line: 366, column: 9)
!560 = !DILocation(line: 366, column: 27, scope: !559, inlinedAt: !501)
!561 = !DILocation(line: 366, column: 9, scope: !497, inlinedAt: !501)
!562 = !DILocation(line: 367, column: 28, scope: !563, inlinedAt: !501)
!563 = distinct !DILexicalBlock(scope: !559, file: !3, line: 366, column: 36)
!564 = !DILocation(line: 367, column: 33, scope: !563, inlinedAt: !501)
!565 = !DILocation(line: 368, column: 5, scope: !563, inlinedAt: !501)
!566 = !DILocation(line: 369, column: 23, scope: !497, inlinedAt: !501)
!567 = !DILocation(line: 0, scope: !330)
!568 = !DILocation(line: 771, column: 1, scope: !330)
!569 = distinct !DISubprogram(name: "mm_malloc", scope: !3, file: !3, line: 983, type: !570, isLocal: false, isDefinition: true, scopeLine: 983, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !572)
!570 = !DISubroutineType(types: !571)
!571 = !{!6, !39}
!572 = !{!573, !574, !575, !576, !577, !578, !579}
!573 = !DILocalVariable(name: "size", arg: 1, scope: !569, file: !3, line: 983, type: !39)
!574 = !DILocalVariable(name: "asize", scope: !569, file: !3, line: 987, type: !39)
!575 = !DILocalVariable(name: "extendsize", scope: !569, file: !3, line: 988, type: !39)
!576 = !DILocalVariable(name: "block", scope: !569, file: !3, line: 989, type: !7)
!577 = !DILocalVariable(name: "bp", scope: !569, file: !3, line: 990, type: !6)
!578 = !DILocalVariable(name: "block_size", scope: !569, file: !3, line: 1028, type: !39)
!579 = !DILocalVariable(name: "ne", scope: !569, file: !3, line: 1036, type: !7)
!580 = !DILocation(line: 983, column: 21, scope: !569)
!581 = !DILocation(line: 990, column: 11, scope: !569)
!582 = !DILocation(line: 993, column: 9, scope: !583)
!583 = distinct !DILexicalBlock(scope: !569, file: !3, line: 993, column: 9)
!584 = !DILocation(line: 993, column: 20, scope: !583)
!585 = !DILocation(line: 993, column: 9, scope: !569)
!586 = !DILocation(line: 949, column: 32, scope: !304, inlinedAt: !587)
!587 = distinct !DILocation(line: 994, column: 9, scope: !588)
!588 = distinct !DILexicalBlock(scope: !583, file: !3, line: 993, column: 29)
!589 = !DILocation(line: 951, column: 17, scope: !310, inlinedAt: !587)
!590 = !DILocation(line: 952, column: 23, scope: !314, inlinedAt: !587)
!591 = !DILocation(line: 955, column: 15, scope: !317, inlinedAt: !587)
!592 = !DILocation(line: 955, column: 9, scope: !304, inlinedAt: !587)
!593 = !DILocation(line: 949, column: 13, scope: !304, inlinedAt: !587)
!594 = !DILocation(line: 960, column: 5, scope: !304, inlinedAt: !587)
!595 = !DILocation(line: 959, column: 14, scope: !304, inlinedAt: !587)
!596 = !DILocation(line: 963, column: 16, scope: !304, inlinedAt: !587)
!597 = !DILocation(line: 968, column: 9, scope: !324, inlinedAt: !587)
!598 = !DILocation(line: 969, column: 9, scope: !327, inlinedAt: !587)
!599 = !DILocation(line: 998, column: 14, scope: !600)
!600 = distinct !DILexicalBlock(scope: !569, file: !3, line: 998, column: 9)
!601 = !DILocation(line: 998, column: 9, scope: !569)
!602 = !DILocation(line: 181, column: 31, scope: !340, inlinedAt: !603)
!603 = distinct !DILocation(line: 1005, column: 17, scope: !569)
!604 = !DILocation(line: 181, column: 44, scope: !340, inlinedAt: !603)
!605 = !DILocation(line: 182, column: 23, scope: !340, inlinedAt: !603)
!606 = !DILocation(line: 182, column: 14, scope: !340, inlinedAt: !603)
!607 = !DILocalVariable(name: "x", arg: 1, scope: !608, file: !3, line: 171, type: !39)
!608 = distinct !DISubprogram(name: "max", scope: !3, file: !3, line: 171, type: !341, isLocal: true, isDefinition: true, scopeLine: 171, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !609)
!609 = !{!607, !610}
!610 = !DILocalVariable(name: "y", arg: 2, scope: !608, file: !3, line: 171, type: !39)
!611 = !DILocation(line: 171, column: 26, scope: !608, inlinedAt: !612)
!612 = distinct !DILocation(line: 1005, column: 13, scope: !569)
!613 = !DILocation(line: 171, column: 36, scope: !608, inlinedAt: !612)
!614 = !DILocation(line: 172, column: 15, scope: !608, inlinedAt: !612)
!615 = !DILocation(line: 172, column: 12, scope: !608, inlinedAt: !612)
!616 = !DILocation(line: 987, column: 12, scope: !569)
!617 = !DILocalVariable(name: "asize", arg: 1, scope: !618, file: !3, line: 809, type: !39)
!618 = distinct !DISubprogram(name: "find_fit", scope: !3, file: !3, line: 809, type: !331, isLocal: true, isDefinition: true, scopeLine: 809, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !619)
!619 = !{!617, !620, !621, !622, !623, !624, !625}
!620 = !DILocalVariable(name: "index", scope: !618, file: !3, line: 811, type: !39)
!621 = !DILocalVariable(name: "count", scope: !618, file: !3, line: 812, type: !39)
!622 = !DILocalVariable(name: "best", scope: !618, file: !3, line: 813, type: !7)
!623 = !DILocalVariable(name: "diff", scope: !618, file: !3, line: 814, type: !39)
!624 = !DILocalVariable(name: "d", scope: !618, file: !3, line: 815, type: !39)
!625 = !DILocalVariable(name: "curr", scope: !626, file: !3, line: 818, type: !7)
!626 = distinct !DILexicalBlock(scope: !627, file: !3, line: 818, column: 9)
!627 = distinct !DILexicalBlock(scope: !618, file: !3, line: 816, column: 24)
!628 = !DILocation(line: 809, column: 33, scope: !618, inlinedAt: !629)
!629 = distinct !DILocation(line: 1008, column: 13, scope: !569)
!630 = !DILocation(line: 219, column: 37, scope: !202, inlinedAt: !631)
!631 = distinct !DILocation(line: 811, column: 20, scope: !618, inlinedAt: !629)
!632 = !DILocation(line: 220, column: 14, scope: !209, inlinedAt: !631)
!633 = !DILocation(line: 220, column: 9, scope: !202, inlinedAt: !631)
!634 = !DILocation(line: 222, column: 21, scope: !212, inlinedAt: !631)
!635 = !DILocation(line: 222, column: 16, scope: !209, inlinedAt: !631)
!636 = !DILocation(line: 224, column: 21, scope: !215, inlinedAt: !631)
!637 = !DILocation(line: 224, column: 16, scope: !212, inlinedAt: !631)
!638 = !DILocation(line: 226, column: 21, scope: !218, inlinedAt: !631)
!639 = !DILocation(line: 226, column: 16, scope: !215, inlinedAt: !631)
!640 = !DILocation(line: 228, column: 21, scope: !221, inlinedAt: !631)
!641 = !DILocation(line: 228, column: 16, scope: !218, inlinedAt: !631)
!642 = !DILocation(line: 230, column: 21, scope: !224, inlinedAt: !631)
!643 = !DILocation(line: 230, column: 16, scope: !221, inlinedAt: !631)
!644 = !DILocation(line: 232, column: 21, scope: !227, inlinedAt: !631)
!645 = !DILocation(line: 232, column: 16, scope: !224, inlinedAt: !631)
!646 = !DILocation(line: 234, column: 21, scope: !230, inlinedAt: !631)
!647 = !DILocation(line: 234, column: 16, scope: !227, inlinedAt: !631)
!648 = !DILocation(line: 236, column: 21, scope: !233, inlinedAt: !631)
!649 = !DILocation(line: 236, column: 16, scope: !230, inlinedAt: !631)
!650 = !DILocation(line: 238, column: 21, scope: !236, inlinedAt: !631)
!651 = !DILocation(line: 238, column: 16, scope: !233, inlinedAt: !631)
!652 = !DILocation(line: 240, column: 21, scope: !239, inlinedAt: !631)
!653 = !DILocation(line: 240, column: 16, scope: !236, inlinedAt: !631)
!654 = !DILocation(line: 242, column: 21, scope: !242, inlinedAt: !631)
!655 = !DILocation(line: 242, column: 16, scope: !239, inlinedAt: !631)
!656 = !DILocation(line: 244, column: 21, scope: !245, inlinedAt: !631)
!657 = !DILocation(line: 244, column: 16, scope: !242, inlinedAt: !631)
!658 = !DILocation(line: 246, column: 21, scope: !248, inlinedAt: !631)
!659 = !DILocation(line: 247, column: 9, scope: !250, inlinedAt: !631)
!660 = !DILocation(line: 818, column: 30, scope: !626, inlinedAt: !629)
!661 = !DILocation(line: 832, column: 14, scope: !627, inlinedAt: !629)
!662 = !DILocation(line: 813, column: 14, scope: !618, inlinedAt: !629)
!663 = !DILocation(line: 812, column: 12, scope: !618, inlinedAt: !629)
!664 = !DILocation(line: 811, column: 12, scope: !618, inlinedAt: !629)
!665 = !DILocation(line: 816, column: 18, scope: !618, inlinedAt: !629)
!666 = !DILocation(line: 816, column: 5, scope: !618, inlinedAt: !629)
!667 = distinct !{!667, !668, !669}
!668 = !DILocation(line: 816, column: 5, scope: !618)
!669 = !DILocation(line: 833, column: 5, scope: !618)
!670 = !DILocation(line: 818, column: 23, scope: !626, inlinedAt: !629)
!671 = !DILocation(line: 0, scope: !672, inlinedAt: !629)
!672 = distinct !DILexicalBlock(scope: !626, file: !3, line: 818, column: 9)
!673 = !DILocation(line: 818, column: 54, scope: !672, inlinedAt: !629)
!674 = !DILocation(line: 818, column: 9, scope: !626, inlinedAt: !629)
!675 = !DILocation(line: 827, column: 18, scope: !676, inlinedAt: !629)
!676 = distinct !DILexicalBlock(scope: !627, file: !3, line: 827, column: 13)
!677 = !DILocation(line: 827, column: 13, scope: !627, inlinedAt: !629)
!678 = !DILocation(line: 820, column: 18, scope: !679, inlinedAt: !629)
!679 = distinct !DILexicalBlock(scope: !672, file: !3, line: 819, column: 33)
!680 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !681)
!681 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !682)
!682 = distinct !DILocation(line: 821, column: 17, scope: !679, inlinedAt: !629)
!683 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !681)
!684 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !685)
!685 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !686)
!686 = distinct !DILocation(line: 822, column: 26, scope: !687, inlinedAt: !629)
!687 = distinct !DILexicalBlock(scope: !679, file: !3, line: 822, column: 17)
!688 = !DILocation(line: 822, column: 23, scope: !687, inlinedAt: !629)
!689 = !DILocation(line: 822, column: 41, scope: !687, inlinedAt: !629)
!690 = !DILocation(line: 822, column: 50, scope: !687, inlinedAt: !629)
!691 = !DILocation(line: 822, column: 61, scope: !687, inlinedAt: !629)
!692 = !DILocation(line: 822, column: 58, scope: !687, inlinedAt: !629)
!693 = !DILocation(line: 0, scope: !618, inlinedAt: !629)
!694 = !DILocation(line: 819, column: 27, scope: !672, inlinedAt: !629)
!695 = !DILocation(line: 818, column: 71, scope: !672, inlinedAt: !629)
!696 = !DILocation(line: 818, column: 62, scope: !672, inlinedAt: !629)
!697 = distinct !{!697, !698, !699}
!698 = !DILocation(line: 818, column: 9, scope: !626)
!699 = !DILocation(line: 826, column: 9, scope: !626)
!700 = !DILocation(line: 171, column: 26, scope: !608, inlinedAt: !701)
!701 = distinct !DILocation(line: 1013, column: 22, scope: !702)
!702 = distinct !DILexicalBlock(scope: !703, file: !3, line: 1011, column: 24)
!703 = distinct !DILexicalBlock(scope: !569, file: !3, line: 1011, column: 9)
!704 = !DILocation(line: 171, column: 36, scope: !608, inlinedAt: !701)
!705 = !DILocation(line: 172, column: 15, scope: !608, inlinedAt: !701)
!706 = !DILocation(line: 172, column: 12, scope: !608, inlinedAt: !701)
!707 = !DILocation(line: 988, column: 12, scope: !569)
!708 = !DILocation(line: 1014, column: 17, scope: !702)
!709 = !DILocation(line: 989, column: 14, scope: !569)
!710 = !DILocation(line: 1016, column: 19, scope: !711)
!711 = distinct !DILexicalBlock(scope: !702, file: !3, line: 1016, column: 13)
!712 = !DILocation(line: 1016, column: 13, scope: !702)
!713 = !DILocation(line: 0, scope: !569)
!714 = !DILocation(line: 1025, column: 5, scope: !569)
!715 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !716)
!716 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !717)
!717 = distinct !DILocation(line: 1028, column: 25, scope: !569)
!718 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !716)
!719 = !DILocation(line: 1028, column: 12, scope: !569)
!720 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !721)
!721 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !722)
!722 = distinct !DILocation(line: 1029, column: 42, scope: !569)
!723 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !724)
!724 = distinct !DILocation(line: 1029, column: 5, scope: !569)
!725 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !724)
!726 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !724)
!727 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !728)
!728 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !729)
!729 = distinct !DILocation(line: 612, column: 51, scope: !376, inlinedAt: !724)
!730 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !731)
!731 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !724)
!732 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !731)
!733 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !731)
!734 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !731)
!735 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !724)
!736 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !737)
!737 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !724)
!738 = !DILocation(line: 589, column: 24, scope: !166, inlinedAt: !737)
!739 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !740)
!740 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !741)
!741 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !737)
!742 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !737)
!743 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !724)
!744 = !DILocation(line: 618, column: 14, scope: !449, inlinedAt: !724)
!745 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !746)
!746 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !747)
!747 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !724)
!748 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !749)
!749 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !724)
!750 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !751)
!751 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !724)
!752 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !749)
!753 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !751)
!754 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !749)
!755 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !749)
!756 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !751)
!757 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !749)
!758 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !724)
!759 = !DILocation(line: 0, scope: !456, inlinedAt: !724)
!760 = !DILocalVariable(name: "block", arg: 1, scope: !761, file: !3, line: 781, type: !7)
!761 = distinct !DISubprogram(name: "split_block", scope: !3, file: !3, line: 781, type: !762, isLocal: true, isDefinition: true, scopeLine: 781, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !764)
!762 = !DISubroutineType(types: !763)
!763 = !{null, !7, !39}
!764 = !{!760, !765, !766, !767}
!765 = !DILocalVariable(name: "asize", arg: 2, scope: !761, file: !3, line: 781, type: !39)
!766 = !DILocalVariable(name: "block_size", scope: !761, file: !3, line: 784, type: !39)
!767 = !DILocalVariable(name: "block_next", scope: !768, file: !3, line: 787, type: !7)
!768 = distinct !DILexicalBlock(scope: !769, file: !3, line: 786, column: 49)
!769 = distinct !DILexicalBlock(scope: !761, file: !3, line: 786, column: 9)
!770 = !DILocation(line: 781, column: 34, scope: !761, inlinedAt: !771)
!771 = distinct !DILocation(line: 1032, column: 5, scope: !569)
!772 = !DILocation(line: 781, column: 48, scope: !761, inlinedAt: !771)
!773 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !774)
!774 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !775)
!775 = distinct !DILocation(line: 784, column: 25, scope: !761, inlinedAt: !771)
!776 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !774)
!777 = !DILocation(line: 784, column: 12, scope: !761, inlinedAt: !771)
!778 = !DILocation(line: 786, column: 21, scope: !769, inlinedAt: !771)
!779 = !DILocation(line: 786, column: 30, scope: !769, inlinedAt: !771)
!780 = !DILocation(line: 786, column: 9, scope: !761, inlinedAt: !771)
!781 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !782)
!782 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !783)
!783 = distinct !DILocation(line: 788, column: 41, scope: !768, inlinedAt: !771)
!784 = !DILocation(line: 510, column: 44, scope: !366, inlinedAt: !782)
!785 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !786)
!786 = distinct !DILocation(line: 788, column: 9, scope: !768, inlinedAt: !771)
!787 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !786)
!788 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !786)
!789 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !790)
!790 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !791)
!791 = distinct !DILocation(line: 612, column: 51, scope: !376, inlinedAt: !786)
!792 = !DILocation(line: 533, column: 37, scope: !392, inlinedAt: !790)
!793 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !794)
!794 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !786)
!795 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !794)
!796 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !794)
!797 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !794)
!798 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !786)
!799 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !800)
!800 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !786)
!801 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !802)
!802 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !803)
!803 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !800)
!804 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !800)
!805 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !786)
!806 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !807)
!807 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !808)
!808 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !786)
!809 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !810)
!810 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !786)
!811 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !812)
!812 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !786)
!813 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !810)
!814 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !812)
!815 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !810)
!816 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !810)
!817 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !812)
!818 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !810)
!819 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !786)
!820 = !DILocation(line: 0, scope: !456, inlinedAt: !786)
!821 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !822)
!822 = distinct !DILocation(line: 790, column: 22, scope: !768, inlinedAt: !771)
!823 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !824)
!824 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !825)
!825 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !822)
!826 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !824)
!827 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !822)
!828 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !829)
!829 = distinct !DILocation(line: 791, column: 9, scope: !768, inlinedAt: !771)
!830 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !829)
!831 = !DILocation(line: 608, column: 30, scope: !376, inlinedAt: !829)
!832 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !833)
!833 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !834)
!834 = distinct !DILocation(line: 612, column: 51, scope: !376, inlinedAt: !829)
!835 = !DILocation(line: 533, column: 37, scope: !392, inlinedAt: !833)
!836 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !837)
!837 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !829)
!838 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !837)
!839 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !837)
!840 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !837)
!841 = !DILocation(line: 205, column: 14, scope: !842, inlinedAt: !837)
!842 = distinct !DILexicalBlock(scope: !843, file: !3, line: 204, column: 21)
!843 = distinct !DILexicalBlock(scope: !402, file: !3, line: 204, column: 9)
!844 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !837)
!845 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !829)
!846 = !DILocation(line: 613, column: 24, scope: !385, inlinedAt: !829)
!847 = !DILocation(line: 613, column: 16, scope: !385, inlinedAt: !829)
!848 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !829)
!849 = !DILocation(line: 787, column: 18, scope: !768, inlinedAt: !771)
!850 = !DILocation(line: 306, column: 42, scope: !420, inlinedAt: !851)
!851 = distinct !DILocation(line: 614, column: 27, scope: !384, inlinedAt: !829)
!852 = !DILocation(line: 309, column: 30, scope: !420, inlinedAt: !851)
!853 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !854)
!854 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !855)
!855 = distinct !DILocation(line: 309, column: 40, scope: !420, inlinedAt: !851)
!856 = !DILocation(line: 309, column: 38, scope: !420, inlinedAt: !851)
!857 = !DILocation(line: 309, column: 56, scope: !420, inlinedAt: !851)
!858 = !DILocation(line: 309, column: 12, scope: !420, inlinedAt: !851)
!859 = !DILocation(line: 614, column: 17, scope: !384, inlinedAt: !829)
!860 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !861)
!861 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !862)
!862 = distinct !DILocation(line: 615, column: 50, scope: !384, inlinedAt: !829)
!863 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !864)
!864 = distinct !DILocation(line: 615, column: 20, scope: !384, inlinedAt: !829)
!865 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !864)
!866 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !864)
!867 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !864)
!868 = !DILocation(line: 615, column: 18, scope: !384, inlinedAt: !829)
!869 = !DILocation(line: 616, column: 5, scope: !384, inlinedAt: !829)
!870 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !871)
!871 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !829)
!872 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !873)
!873 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !874)
!874 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !871)
!875 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !873)
!876 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !871)
!877 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !829)
!878 = !DILocation(line: 618, column: 14, scope: !449, inlinedAt: !829)
!879 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !880)
!880 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !881)
!881 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !829)
!882 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !883)
!883 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !829)
!884 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !885)
!885 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !829)
!886 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !883)
!887 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !885)
!888 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !883)
!889 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !883)
!890 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !885)
!891 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !883)
!892 = !DILocation(line: 208, column: 14, scope: !466, inlinedAt: !883)
!893 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !829)
!894 = !DILocation(line: 0, scope: !456, inlinedAt: !829)
!895 = !DILocation(line: 356, column: 42, scope: !497, inlinedAt: !896)
!896 = distinct !DILocation(line: 794, column: 9, scope: !768, inlinedAt: !771)
!897 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !898)
!898 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !899)
!899 = distinct !DILocation(line: 358, column: 9, scope: !505, inlinedAt: !896)
!900 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !898)
!901 = !DILocation(line: 358, column: 25, scope: !505, inlinedAt: !896)
!902 = !DILocation(line: 358, column: 9, scope: !497, inlinedAt: !896)
!903 = !DILocation(line: 344, column: 46, scope: !510, inlinedAt: !904)
!904 = distinct !DILocation(line: 359, column: 16, scope: !514, inlinedAt: !896)
!905 = !DILocation(line: 345, column: 19, scope: !510, inlinedAt: !904)
!906 = !DILocation(line: 345, column: 12, scope: !510, inlinedAt: !904)
!907 = !DILocation(line: 345, column: 17, scope: !510, inlinedAt: !904)
!908 = !DILocation(line: 346, column: 19, scope: !510, inlinedAt: !904)
!909 = !DILocation(line: 359, column: 9, scope: !514, inlinedAt: !896)
!910 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !911)
!911 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !912)
!912 = distinct !DILocation(line: 361, column: 35, scope: !497, inlinedAt: !896)
!913 = !DILocation(line: 219, column: 37, scope: !202, inlinedAt: !914)
!914 = distinct !DILocation(line: 361, column: 20, scope: !497, inlinedAt: !896)
!915 = !DILocation(line: 222, column: 21, scope: !212, inlinedAt: !914)
!916 = !DILocation(line: 222, column: 16, scope: !209, inlinedAt: !914)
!917 = !DILocation(line: 224, column: 21, scope: !215, inlinedAt: !914)
!918 = !DILocation(line: 224, column: 16, scope: !212, inlinedAt: !914)
!919 = !DILocation(line: 226, column: 21, scope: !218, inlinedAt: !914)
!920 = !DILocation(line: 226, column: 16, scope: !215, inlinedAt: !914)
!921 = !DILocation(line: 228, column: 21, scope: !221, inlinedAt: !914)
!922 = !DILocation(line: 228, column: 16, scope: !218, inlinedAt: !914)
!923 = !DILocation(line: 230, column: 21, scope: !224, inlinedAt: !914)
!924 = !DILocation(line: 230, column: 16, scope: !221, inlinedAt: !914)
!925 = !DILocation(line: 232, column: 21, scope: !227, inlinedAt: !914)
!926 = !DILocation(line: 232, column: 16, scope: !224, inlinedAt: !914)
!927 = !DILocation(line: 234, column: 21, scope: !230, inlinedAt: !914)
!928 = !DILocation(line: 234, column: 16, scope: !227, inlinedAt: !914)
!929 = !DILocation(line: 236, column: 21, scope: !233, inlinedAt: !914)
!930 = !DILocation(line: 236, column: 16, scope: !230, inlinedAt: !914)
!931 = !DILocation(line: 238, column: 21, scope: !236, inlinedAt: !914)
!932 = !DILocation(line: 238, column: 16, scope: !233, inlinedAt: !914)
!933 = !DILocation(line: 240, column: 21, scope: !239, inlinedAt: !914)
!934 = !DILocation(line: 240, column: 16, scope: !236, inlinedAt: !914)
!935 = !DILocation(line: 242, column: 21, scope: !242, inlinedAt: !914)
!936 = !DILocation(line: 242, column: 16, scope: !239, inlinedAt: !914)
!937 = !DILocation(line: 244, column: 21, scope: !245, inlinedAt: !914)
!938 = !DILocation(line: 244, column: 16, scope: !242, inlinedAt: !914)
!939 = !DILocation(line: 246, column: 21, scope: !248, inlinedAt: !914)
!940 = !DILocation(line: 247, column: 9, scope: !250, inlinedAt: !914)
!941 = !DILocation(line: 0, scope: !252, inlinedAt: !914)
!942 = !DILocation(line: 361, column: 12, scope: !497, inlinedAt: !896)
!943 = !DILocation(line: 364, column: 19, scope: !497, inlinedAt: !896)
!944 = !DILocation(line: 364, column: 12, scope: !497, inlinedAt: !896)
!945 = !DILocation(line: 364, column: 17, scope: !497, inlinedAt: !896)
!946 = !DILocation(line: 365, column: 12, scope: !497, inlinedAt: !896)
!947 = !DILocation(line: 365, column: 17, scope: !497, inlinedAt: !896)
!948 = !DILocation(line: 366, column: 9, scope: !559, inlinedAt: !896)
!949 = !DILocation(line: 366, column: 27, scope: !559, inlinedAt: !896)
!950 = !DILocation(line: 366, column: 9, scope: !497, inlinedAt: !896)
!951 = !DILocation(line: 367, column: 28, scope: !563, inlinedAt: !896)
!952 = !DILocation(line: 367, column: 33, scope: !563, inlinedAt: !896)
!953 = !DILocation(line: 368, column: 5, scope: !563, inlinedAt: !896)
!954 = !DILocation(line: 369, column: 23, scope: !497, inlinedAt: !896)
!955 = !DILocalVariable(name: "block", arg: 1, scope: !956, file: !3, line: 294, type: !7)
!956 = distinct !DISubprogram(name: "header_to_payload", scope: !3, file: !3, line: 294, type: !957, isLocal: true, isDefinition: true, scopeLine: 294, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !959)
!957 = !DISubroutineType(types: !958)
!958 = !{!6, !7}
!959 = !{!955}
!960 = !DILocation(line: 294, column: 41, scope: !956, inlinedAt: !961)
!961 = distinct !DILocation(line: 1034, column: 10, scope: !569)
!962 = !DILocation(line: 296, column: 28, scope: !956, inlinedAt: !961)
!963 = !DILocation(line: 296, column: 20, scope: !956, inlinedAt: !961)
!964 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !965)
!965 = distinct !DILocation(line: 1036, column: 19, scope: !569)
!966 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !967)
!967 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !968)
!968 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !965)
!969 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !967)
!970 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !965)
!971 = !DILocation(line: 1036, column: 14, scope: !569)
!972 = !DILocation(line: 1037, column: 23, scope: !973)
!973 = distinct !DILexicalBlock(scope: !569, file: !3, line: 1037, column: 9)
!974 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !975)
!975 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !976)
!976 = distinct !DILocation(line: 1037, column: 26, scope: !973)
!977 = !DILocation(line: 551, column: 37, scope: !479, inlinedAt: !978)
!978 = distinct !DILocation(line: 1038, column: 9, scope: !979)
!979 = distinct !DILexicalBlock(scope: !973, file: !3, line: 1037, column: 45)
!980 = !DILocation(line: 551, column: 49, scope: !479, inlinedAt: !978)
!981 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !982)
!982 = distinct !DILocation(line: 554, column: 21, scope: !479, inlinedAt: !978)
!983 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !982)
!984 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !982)
!985 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !982)
!986 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !982)
!987 = !DILocation(line: 554, column: 19, scope: !479, inlinedAt: !978)
!988 = !DILocation(line: 1039, column: 5, scope: !979)
!989 = !DILocation(line: 1044, column: 1, scope: !569)
!990 = distinct !DISubprogram(name: "block_removal", scope: !3, file: !3, line: 435, type: !167, isLocal: true, isDefinition: true, scopeLine: 435, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !991)
!991 = !{!992, !993}
!992 = !DILocalVariable(name: "block", arg: 1, scope: !990, file: !3, line: 435, type: !7)
!993 = !DILocalVariable(name: "index", scope: !990, file: !3, line: 441, type: !39)
!994 = !DILocation(line: 435, column: 40, scope: !990)
!995 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !996)
!996 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !997)
!997 = distinct !DILocation(line: 437, column: 9, scope: !998)
!998 = distinct !DILexicalBlock(scope: !990, file: !3, line: 437, column: 9)
!999 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !996)
!1000 = !DILocation(line: 437, column: 25, scope: !998)
!1001 = !DILocation(line: 437, column: 9, scope: !990)
!1002 = !DILocalVariable(name: "block", arg: 1, scope: !1003, file: !3, line: 397, type: !7)
!1003 = distinct !DISubprogram(name: "min_block_removal", scope: !3, file: !3, line: 397, type: !167, isLocal: true, isDefinition: true, scopeLine: 397, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1004)
!1004 = !{!1002, !1005, !1009}
!1005 = !DILocalVariable(name: "prev", scope: !1006, file: !3, line: 416, type: !7)
!1006 = distinct !DILexicalBlock(scope: !1007, file: !3, line: 413, column: 10)
!1007 = distinct !DILexicalBlock(scope: !1008, file: !3, line: 407, column: 14)
!1008 = distinct !DILexicalBlock(scope: !1003, file: !3, line: 401, column: 9)
!1009 = !DILocalVariable(name: "curr", scope: !1010, file: !3, line: 417, type: !7)
!1010 = distinct !DILexicalBlock(scope: !1006, file: !3, line: 417, column: 9)
!1011 = !DILocation(line: 397, column: 44, scope: !1003, inlinedAt: !1012)
!1012 = distinct !DILocation(line: 438, column: 16, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !998, file: !3, line: 437, column: 44)
!1014 = !DILocation(line: 401, column: 18, scope: !1008, inlinedAt: !1012)
!1015 = !DILocation(line: 401, column: 15, scope: !1008, inlinedAt: !1012)
!1016 = !DILocation(line: 401, column: 32, scope: !1008, inlinedAt: !1012)
!1017 = !DILocation(line: 417, column: 23, scope: !1010, inlinedAt: !1012)
!1018 = !DILocation(line: 416, column: 18, scope: !1006, inlinedAt: !1012)
!1019 = !DILocation(line: 417, column: 50, scope: !1020, inlinedAt: !1012)
!1020 = distinct !DILexicalBlock(scope: !1010, file: !3, line: 417, column: 9)
!1021 = !DILocation(line: 417, column: 9, scope: !1010, inlinedAt: !1012)
!1022 = !DILocation(line: 0, scope: !1020, inlinedAt: !1012)
!1023 = !DILocation(line: 418, column: 17, scope: !1024, inlinedAt: !1012)
!1024 = distinct !DILexicalBlock(scope: !1020, file: !3, line: 417, column: 78)
!1025 = !DILocation(line: 401, column: 50, scope: !1008, inlinedAt: !1012)
!1026 = !DILocation(line: 401, column: 55, scope: !1008, inlinedAt: !1012)
!1027 = !DILocation(line: 401, column: 9, scope: !1003, inlinedAt: !1012)
!1028 = !DILocation(line: 402, column: 21, scope: !1029, inlinedAt: !1012)
!1029 = distinct !DILexicalBlock(scope: !1008, file: !3, line: 401, column: 64)
!1030 = !DILocation(line: 403, column: 23, scope: !1029, inlinedAt: !1012)
!1031 = !DILocation(line: 404, column: 9, scope: !1029, inlinedAt: !1012)
!1032 = !DILocation(line: 408, column: 23, scope: !1033, inlinedAt: !1012)
!1033 = distinct !DILexicalBlock(scope: !1007, file: !3, line: 407, column: 38)
!1034 = !DILocation(line: 409, column: 21, scope: !1033, inlinedAt: !1012)
!1035 = !DILocation(line: 410, column: 9, scope: !1033, inlinedAt: !1012)
!1036 = !DILocation(line: 418, column: 22, scope: !1037, inlinedAt: !1012)
!1037 = distinct !DILexicalBlock(scope: !1024, file: !3, line: 418, column: 17)
!1038 = distinct !{!1038, !1039, !1040}
!1039 = !DILocation(line: 417, column: 9, scope: !1010)
!1040 = !DILocation(line: 424, column: 9, scope: !1010)
!1041 = !DILocation(line: 417, column: 72, scope: !1020, inlinedAt: !1012)
!1042 = !DILocation(line: 419, column: 36, scope: !1043, inlinedAt: !1012)
!1043 = distinct !DILexicalBlock(scope: !1037, file: !3, line: 418, column: 32)
!1044 = !DILocation(line: 419, column: 23, scope: !1043, inlinedAt: !1012)
!1045 = !DILocation(line: 419, column: 28, scope: !1043, inlinedAt: !1012)
!1046 = !DILocation(line: 420, column: 24, scope: !1043, inlinedAt: !1012)
!1047 = !DILocation(line: 420, column: 29, scope: !1043, inlinedAt: !1012)
!1048 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1049)
!1049 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1050)
!1050 = distinct !DILocation(line: 441, column: 35, scope: !990)
!1051 = !DILocation(line: 219, column: 37, scope: !202, inlinedAt: !1052)
!1052 = distinct !DILocation(line: 441, column: 20, scope: !990)
!1053 = !DILocation(line: 222, column: 21, scope: !212, inlinedAt: !1052)
!1054 = !DILocation(line: 222, column: 16, scope: !209, inlinedAt: !1052)
!1055 = !DILocation(line: 224, column: 21, scope: !215, inlinedAt: !1052)
!1056 = !DILocation(line: 224, column: 16, scope: !212, inlinedAt: !1052)
!1057 = !DILocation(line: 226, column: 21, scope: !218, inlinedAt: !1052)
!1058 = !DILocation(line: 226, column: 16, scope: !215, inlinedAt: !1052)
!1059 = !DILocation(line: 228, column: 21, scope: !221, inlinedAt: !1052)
!1060 = !DILocation(line: 228, column: 16, scope: !218, inlinedAt: !1052)
!1061 = !DILocation(line: 230, column: 21, scope: !224, inlinedAt: !1052)
!1062 = !DILocation(line: 230, column: 16, scope: !221, inlinedAt: !1052)
!1063 = !DILocation(line: 232, column: 21, scope: !227, inlinedAt: !1052)
!1064 = !DILocation(line: 232, column: 16, scope: !224, inlinedAt: !1052)
!1065 = !DILocation(line: 234, column: 21, scope: !230, inlinedAt: !1052)
!1066 = !DILocation(line: 234, column: 16, scope: !227, inlinedAt: !1052)
!1067 = !DILocation(line: 236, column: 21, scope: !233, inlinedAt: !1052)
!1068 = !DILocation(line: 236, column: 16, scope: !230, inlinedAt: !1052)
!1069 = !DILocation(line: 238, column: 21, scope: !236, inlinedAt: !1052)
!1070 = !DILocation(line: 238, column: 16, scope: !233, inlinedAt: !1052)
!1071 = !DILocation(line: 240, column: 21, scope: !239, inlinedAt: !1052)
!1072 = !DILocation(line: 240, column: 16, scope: !236, inlinedAt: !1052)
!1073 = !DILocation(line: 242, column: 21, scope: !242, inlinedAt: !1052)
!1074 = !DILocation(line: 242, column: 16, scope: !239, inlinedAt: !1052)
!1075 = !DILocation(line: 244, column: 21, scope: !245, inlinedAt: !1052)
!1076 = !DILocation(line: 244, column: 16, scope: !242, inlinedAt: !1052)
!1077 = !DILocation(line: 246, column: 21, scope: !248, inlinedAt: !1052)
!1078 = !DILocation(line: 247, column: 9, scope: !250, inlinedAt: !1052)
!1079 = !DILocation(line: 0, scope: !252, inlinedAt: !1052)
!1080 = !DILocation(line: 441, column: 12, scope: !990)
!1081 = !DILocation(line: 447, column: 18, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !990, file: !3, line: 447, column: 9)
!1083 = !DILocation(line: 447, column: 15, scope: !1082)
!1084 = !DILocation(line: 447, column: 36, scope: !1082)
!1085 = !DILocation(line: 447, column: 58, scope: !1082)
!1086 = !DILocation(line: 447, column: 63, scope: !1082)
!1087 = !DILocation(line: 0, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 454, column: 14)
!1089 = !DILocation(line: 447, column: 9, scope: !990)
!1090 = !DILocation(line: 450, column: 27, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 447, column: 72)
!1092 = !DILocation(line: 449, column: 21, scope: !1091)
!1093 = !DILocation(line: 452, column: 5, scope: !1091)
!1094 = !DILocation(line: 454, column: 51, scope: !1088)
!1095 = !DILocation(line: 454, column: 56, scope: !1088)
!1096 = !DILocation(line: 454, column: 64, scope: !1088)
!1097 = !DILocation(line: 456, column: 27, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1088, file: !3, line: 455, column: 35)
!1099 = !DILocation(line: 457, column: 28, scope: !1098)
!1100 = !DILocation(line: 457, column: 33, scope: !1098)
!1101 = !DILocation(line: 461, column: 5, scope: !1098)
!1102 = !DILocation(line: 459, column: 21, scope: !1098)
!1103 = !DILocation(line: 463, column: 21, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1088, file: !3, line: 463, column: 14)
!1105 = !DILocation(line: 463, column: 34, scope: !1104)
!1106 = !DILocation(line: 463, column: 44, scope: !1104)
!1107 = !DILocation(line: 463, column: 49, scope: !1104)
!1108 = !DILocation(line: 463, column: 14, scope: !1088)
!1109 = !DILocation(line: 471, column: 22, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1104, file: !3, line: 470, column: 10)
!1111 = !DILocation(line: 471, column: 27, scope: !1110)
!1112 = !DILocation(line: 472, column: 36, scope: !1110)
!1113 = !DILocation(line: 472, column: 16, scope: !1110)
!1114 = !DILocation(line: 472, column: 22, scope: !1110)
!1115 = !DILocation(line: 472, column: 27, scope: !1110)
!1116 = !DILocation(line: 473, column: 21, scope: !1110)
!1117 = !DILocation(line: 474, column: 21, scope: !1110)
!1118 = !DILocation(line: 465, column: 22, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1104, file: !3, line: 463, column: 58)
!1120 = !DILocation(line: 465, column: 27, scope: !1119)
!1121 = !DILocation(line: 466, column: 21, scope: !1119)
!1122 = !DILocation(line: 468, column: 5, scope: !1119)
!1123 = distinct !DISubprogram(name: "mm_free", scope: !3, file: !3, line: 1053, type: !1124, isLocal: false, isDefinition: true, scopeLine: 1053, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1126)
!1124 = !DISubroutineType(types: !1125)
!1125 = !{null, !6}
!1126 = !{!1127, !1128, !1129, !1130}
!1127 = !DILocalVariable(name: "bp", arg: 1, scope: !1123, file: !3, line: 1053, type: !6)
!1128 = !DILocalVariable(name: "block", scope: !1123, file: !3, line: 1059, type: !7)
!1129 = !DILocalVariable(name: "size", scope: !1123, file: !3, line: 1060, type: !39)
!1130 = !DILocalVariable(name: "result", scope: !1123, file: !3, line: 1070, type: !7)
!1131 = !DILocation(line: 1053, column: 17, scope: !1123)
!1132 = !DILocation(line: 1055, column: 12, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1123, file: !3, line: 1055, column: 9)
!1134 = !DILocation(line: 1055, column: 9, scope: !1123)
!1135 = !DILocation(line: 283, column: 41, scope: !356, inlinedAt: !1136)
!1136 = distinct !DILocation(line: 1059, column: 22, scope: !1123)
!1137 = !DILocation(line: 284, column: 35, scope: !356, inlinedAt: !1136)
!1138 = !DILocation(line: 284, column: 12, scope: !356, inlinedAt: !1136)
!1139 = !DILocation(line: 1059, column: 14, scope: !1123)
!1140 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1141)
!1141 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1142)
!1142 = distinct !DILocation(line: 1060, column: 19, scope: !1123)
!1143 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1141)
!1144 = !DILocation(line: 1060, column: 12, scope: !1123)
!1145 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !1146)
!1146 = distinct !DILocation(line: 1067, column: 5, scope: !1123)
!1147 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !1146)
!1148 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !1146)
!1149 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1150)
!1150 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !1146)
!1151 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1150)
!1152 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1150)
!1153 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !1150)
!1154 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !1146)
!1155 = !DILocation(line: 613, column: 24, scope: !385, inlinedAt: !1146)
!1156 = !DILocation(line: 613, column: 16, scope: !385, inlinedAt: !1146)
!1157 = !DILocation(line: 306, column: 42, scope: !420, inlinedAt: !1158)
!1158 = distinct !DILocation(line: 614, column: 27, scope: !384, inlinedAt: !1146)
!1159 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1160)
!1160 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1161)
!1161 = distinct !DILocation(line: 309, column: 40, scope: !420, inlinedAt: !1158)
!1162 = !DILocation(line: 309, column: 38, scope: !420, inlinedAt: !1158)
!1163 = !DILocation(line: 309, column: 56, scope: !420, inlinedAt: !1158)
!1164 = !DILocation(line: 309, column: 12, scope: !420, inlinedAt: !1158)
!1165 = !DILocation(line: 614, column: 17, scope: !384, inlinedAt: !1146)
!1166 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1167)
!1167 = distinct !DILocation(line: 615, column: 20, scope: !384, inlinedAt: !1146)
!1168 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1167)
!1169 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1167)
!1170 = !DILocation(line: 615, column: 18, scope: !384, inlinedAt: !1146)
!1171 = !DILocation(line: 616, column: 5, scope: !384, inlinedAt: !1146)
!1172 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !1173)
!1173 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !1146)
!1174 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1175)
!1175 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1176)
!1176 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !1173)
!1177 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1175)
!1178 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !1173)
!1179 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !1146)
!1180 = !DILocation(line: 618, column: 14, scope: !449, inlinedAt: !1146)
!1181 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1182)
!1182 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1183)
!1183 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !1146)
!1184 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1185)
!1185 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !1146)
!1186 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1187)
!1187 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !1146)
!1188 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1185)
!1189 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1187)
!1190 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !1185)
!1191 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1185)
!1192 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1187)
!1193 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !1185)
!1194 = !DILocation(line: 208, column: 14, scope: !466, inlinedAt: !1185)
!1195 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !1146)
!1196 = !DILocation(line: 0, scope: !456, inlinedAt: !1146)
!1197 = !DILocation(line: 1070, column: 23, scope: !1123)
!1198 = !DILocation(line: 1070, column: 14, scope: !1123)
!1199 = !DILocation(line: 356, column: 42, scope: !497, inlinedAt: !1200)
!1200 = distinct !DILocation(line: 1073, column: 5, scope: !1123)
!1201 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1202)
!1202 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1203)
!1203 = distinct !DILocation(line: 358, column: 9, scope: !505, inlinedAt: !1200)
!1204 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1202)
!1205 = !DILocation(line: 358, column: 25, scope: !505, inlinedAt: !1200)
!1206 = !DILocation(line: 358, column: 9, scope: !497, inlinedAt: !1200)
!1207 = !DILocation(line: 344, column: 46, scope: !510, inlinedAt: !1208)
!1208 = distinct !DILocation(line: 359, column: 16, scope: !514, inlinedAt: !1200)
!1209 = !DILocation(line: 345, column: 19, scope: !510, inlinedAt: !1208)
!1210 = !DILocation(line: 345, column: 12, scope: !510, inlinedAt: !1208)
!1211 = !DILocation(line: 345, column: 17, scope: !510, inlinedAt: !1208)
!1212 = !DILocation(line: 346, column: 19, scope: !510, inlinedAt: !1208)
!1213 = !DILocation(line: 359, column: 9, scope: !514, inlinedAt: !1200)
!1214 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1215)
!1215 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1216)
!1216 = distinct !DILocation(line: 361, column: 35, scope: !497, inlinedAt: !1200)
!1217 = !DILocation(line: 219, column: 37, scope: !202, inlinedAt: !1218)
!1218 = distinct !DILocation(line: 361, column: 20, scope: !497, inlinedAt: !1200)
!1219 = !DILocation(line: 222, column: 21, scope: !212, inlinedAt: !1218)
!1220 = !DILocation(line: 222, column: 16, scope: !209, inlinedAt: !1218)
!1221 = !DILocation(line: 224, column: 21, scope: !215, inlinedAt: !1218)
!1222 = !DILocation(line: 224, column: 16, scope: !212, inlinedAt: !1218)
!1223 = !DILocation(line: 226, column: 21, scope: !218, inlinedAt: !1218)
!1224 = !DILocation(line: 226, column: 16, scope: !215, inlinedAt: !1218)
!1225 = !DILocation(line: 228, column: 21, scope: !221, inlinedAt: !1218)
!1226 = !DILocation(line: 228, column: 16, scope: !218, inlinedAt: !1218)
!1227 = !DILocation(line: 230, column: 21, scope: !224, inlinedAt: !1218)
!1228 = !DILocation(line: 230, column: 16, scope: !221, inlinedAt: !1218)
!1229 = !DILocation(line: 232, column: 21, scope: !227, inlinedAt: !1218)
!1230 = !DILocation(line: 232, column: 16, scope: !224, inlinedAt: !1218)
!1231 = !DILocation(line: 234, column: 21, scope: !230, inlinedAt: !1218)
!1232 = !DILocation(line: 234, column: 16, scope: !227, inlinedAt: !1218)
!1233 = !DILocation(line: 236, column: 21, scope: !233, inlinedAt: !1218)
!1234 = !DILocation(line: 236, column: 16, scope: !230, inlinedAt: !1218)
!1235 = !DILocation(line: 238, column: 21, scope: !236, inlinedAt: !1218)
!1236 = !DILocation(line: 238, column: 16, scope: !233, inlinedAt: !1218)
!1237 = !DILocation(line: 240, column: 21, scope: !239, inlinedAt: !1218)
!1238 = !DILocation(line: 240, column: 16, scope: !236, inlinedAt: !1218)
!1239 = !DILocation(line: 242, column: 21, scope: !242, inlinedAt: !1218)
!1240 = !DILocation(line: 242, column: 16, scope: !239, inlinedAt: !1218)
!1241 = !DILocation(line: 244, column: 21, scope: !245, inlinedAt: !1218)
!1242 = !DILocation(line: 244, column: 16, scope: !242, inlinedAt: !1218)
!1243 = !DILocation(line: 246, column: 21, scope: !248, inlinedAt: !1218)
!1244 = !DILocation(line: 247, column: 9, scope: !250, inlinedAt: !1218)
!1245 = !DILocation(line: 0, scope: !252, inlinedAt: !1218)
!1246 = !DILocation(line: 361, column: 12, scope: !497, inlinedAt: !1200)
!1247 = !DILocation(line: 364, column: 19, scope: !497, inlinedAt: !1200)
!1248 = !DILocation(line: 364, column: 12, scope: !497, inlinedAt: !1200)
!1249 = !DILocation(line: 364, column: 17, scope: !497, inlinedAt: !1200)
!1250 = !DILocation(line: 365, column: 12, scope: !497, inlinedAt: !1200)
!1251 = !DILocation(line: 365, column: 17, scope: !497, inlinedAt: !1200)
!1252 = !DILocation(line: 366, column: 9, scope: !559, inlinedAt: !1200)
!1253 = !DILocation(line: 366, column: 27, scope: !559, inlinedAt: !1200)
!1254 = !DILocation(line: 366, column: 9, scope: !497, inlinedAt: !1200)
!1255 = !DILocation(line: 367, column: 28, scope: !563, inlinedAt: !1200)
!1256 = !DILocation(line: 367, column: 33, scope: !563, inlinedAt: !1200)
!1257 = !DILocation(line: 368, column: 5, scope: !563, inlinedAt: !1200)
!1258 = !DILocation(line: 369, column: 23, scope: !497, inlinedAt: !1200)
!1259 = !DILocation(line: 1076, column: 1, scope: !1123)
!1260 = distinct !DISubprogram(name: "coalesce_block", scope: !3, file: !3, line: 683, type: !167, isLocal: true, isDefinition: true, scopeLine: 683, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1261)
!1261 = !{!1262, !1263, !1264, !1265, !1270}
!1262 = !DILocalVariable(name: "block", arg: 1, scope: !1260, file: !3, line: 683, type: !7)
!1263 = !DILocalVariable(name: "next", scope: !1260, file: !3, line: 687, type: !7)
!1264 = !DILocalVariable(name: "size", scope: !1260, file: !3, line: 689, type: !39)
!1265 = !DILocalVariable(name: "previous", scope: !1266, file: !3, line: 708, type: !7)
!1266 = distinct !DILexicalBlock(scope: !1267, file: !3, line: 707, column: 57)
!1267 = distinct !DILexicalBlock(scope: !1268, file: !3, line: 707, column: 14)
!1268 = distinct !DILexicalBlock(scope: !1269, file: !3, line: 699, column: 14)
!1269 = distinct !DILexicalBlock(scope: !1260, file: !3, line: 692, column: 9)
!1270 = !DILocalVariable(name: "previous", scope: !1271, file: !3, line: 717, type: !7)
!1271 = distinct !DILexicalBlock(scope: !1267, file: !3, line: 716, column: 10)
!1272 = !DILocation(line: 683, column: 41, scope: !1260)
!1273 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !1274)
!1274 = distinct !DILocation(line: 687, column: 21, scope: !1260)
!1275 = !DILocation(line: 589, column: 24, scope: !166, inlinedAt: !1274)
!1276 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1277)
!1277 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1278)
!1278 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !1274)
!1279 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1277)
!1280 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !1274)
!1281 = !DILocation(line: 589, column: 12, scope: !166, inlinedAt: !1274)
!1282 = !DILocation(line: 687, column: 14, scope: !1260)
!1283 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1284)
!1284 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1285)
!1285 = distinct !DILocation(line: 689, column: 19, scope: !1260)
!1286 = !DILocation(line: 689, column: 12, scope: !1260)
!1287 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !1288)
!1288 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !1289)
!1289 = distinct !DILocation(line: 692, column: 9, scope: !1269)
!1290 = !DILocation(line: 510, column: 44, scope: !366, inlinedAt: !1288)
!1291 = !DILocation(line: 510, column: 12, scope: !366, inlinedAt: !1288)
!1292 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !1293)
!1293 = distinct !DILocation(line: 497, column: 12, scope: !136, inlinedAt: !1294)
!1294 = distinct !DILocation(line: 692, column: 34, scope: !1269)
!1295 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !1296)
!1296 = distinct !DILocation(line: 497, column: 12, scope: !136, inlinedAt: !1297)
!1297 = distinct !DILocation(line: 707, column: 40, scope: !1267)
!1298 = !DILocation(line: 488, column: 24, scope: !104, inlinedAt: !1293)
!1299 = !DILocation(line: 488, column: 12, scope: !104, inlinedAt: !1293)
!1300 = !DILocation(line: 692, column: 31, scope: !1269)
!1301 = !DILocation(line: 692, column: 9, scope: !1260)
!1302 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !1303)
!1303 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !1304)
!1304 = distinct !DILocation(line: 699, column: 14, scope: !1268)
!1305 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !1306)
!1306 = distinct !DILocation(line: 497, column: 12, scope: !136, inlinedAt: !1307)
!1307 = distinct !DILocation(line: 699, column: 40, scope: !1268)
!1308 = !DILocation(line: 700, column: 9, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1268, file: !3, line: 699, column: 57)
!1310 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1311)
!1311 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1312)
!1312 = distinct !DILocation(line: 701, column: 35, scope: !1309)
!1313 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1311)
!1314 = !DILocation(line: 701, column: 33, scope: !1309)
!1315 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !1316)
!1316 = distinct !DILocation(line: 701, column: 9, scope: !1309)
!1317 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !1316)
!1318 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !1316)
!1319 = !DILocation(line: 608, column: 30, scope: !376, inlinedAt: !1316)
!1320 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1321)
!1321 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1322)
!1322 = distinct !DILocation(line: 612, column: 51, scope: !376, inlinedAt: !1316)
!1323 = !DILocation(line: 533, column: 37, scope: !392, inlinedAt: !1321)
!1324 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1325)
!1325 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !1316)
!1326 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1325)
!1327 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1325)
!1328 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1325)
!1329 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !1325)
!1330 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !1316)
!1331 = !DILocation(line: 613, column: 24, scope: !385, inlinedAt: !1316)
!1332 = !DILocation(line: 613, column: 16, scope: !385, inlinedAt: !1316)
!1333 = !DILocation(line: 306, column: 42, scope: !420, inlinedAt: !1334)
!1334 = distinct !DILocation(line: 614, column: 27, scope: !384, inlinedAt: !1316)
!1335 = !DILocation(line: 309, column: 30, scope: !420, inlinedAt: !1334)
!1336 = !DILocation(line: 309, column: 23, scope: !420, inlinedAt: !1334)
!1337 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1338)
!1338 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1339)
!1339 = distinct !DILocation(line: 309, column: 40, scope: !420, inlinedAt: !1334)
!1340 = !DILocation(line: 309, column: 38, scope: !420, inlinedAt: !1334)
!1341 = !DILocation(line: 309, column: 56, scope: !420, inlinedAt: !1334)
!1342 = !DILocation(line: 309, column: 12, scope: !420, inlinedAt: !1334)
!1343 = !DILocation(line: 614, column: 17, scope: !384, inlinedAt: !1316)
!1344 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1345)
!1345 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1346)
!1346 = distinct !DILocation(line: 615, column: 50, scope: !384, inlinedAt: !1316)
!1347 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1348)
!1348 = distinct !DILocation(line: 615, column: 20, scope: !384, inlinedAt: !1316)
!1349 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1348)
!1350 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1348)
!1351 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1348)
!1352 = !DILocation(line: 615, column: 18, scope: !384, inlinedAt: !1316)
!1353 = !DILocation(line: 616, column: 5, scope: !384, inlinedAt: !1316)
!1354 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !1355)
!1355 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !1316)
!1356 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1357)
!1357 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1358)
!1358 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !1355)
!1359 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1357)
!1360 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !1355)
!1361 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !1316)
!1362 = !DILocation(line: 618, column: 14, scope: !449, inlinedAt: !1316)
!1363 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1364)
!1364 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1365)
!1365 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !1316)
!1366 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1367)
!1367 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !1316)
!1368 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1369)
!1369 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !1316)
!1370 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1367)
!1371 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1369)
!1372 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !1367)
!1373 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1367)
!1374 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1369)
!1375 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !1367)
!1376 = !DILocation(line: 208, column: 14, scope: !466, inlinedAt: !1367)
!1377 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !1316)
!1378 = !DILocation(line: 703, column: 9, scope: !1309)
!1379 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !1380)
!1380 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !1381)
!1381 = distinct !DILocation(line: 707, column: 15, scope: !1267)
!1382 = !DILocalVariable(name: "block", arg: 1, scope: !1383, file: !3, line: 650, type: !7)
!1383 = distinct !DISubprogram(name: "find_prev", scope: !3, file: !3, line: 650, type: !167, isLocal: true, isDefinition: true, scopeLine: 650, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1384)
!1384 = !{!1382, !1385}
!1385 = !DILocalVariable(name: "footerp", scope: !1383, file: !3, line: 652, type: !30)
!1386 = !DILocation(line: 650, column: 36, scope: !1383, inlinedAt: !1387)
!1387 = distinct !DILocation(line: 708, column: 29, scope: !1266)
!1388 = !DILocation(line: 650, column: 36, scope: !1383, inlinedAt: !1389)
!1389 = distinct !DILocation(line: 717, column: 29, scope: !1271)
!1390 = !DILocation(line: 630, column: 42, scope: !90, inlinedAt: !1391)
!1391 = distinct !DILocation(line: 652, column: 23, scope: !1383, inlinedAt: !1387)
!1392 = !DILocation(line: 630, column: 42, scope: !90, inlinedAt: !1393)
!1393 = distinct !DILocation(line: 652, column: 23, scope: !1383, inlinedAt: !1389)
!1394 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1395)
!1395 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1396)
!1396 = distinct !DILocation(line: 653, column: 9, scope: !1397, inlinedAt: !1387)
!1397 = distinct !DILexicalBlock(scope: !1383, file: !3, line: 653, column: 9)
!1398 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1399)
!1399 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1400)
!1400 = distinct !DILocation(line: 653, column: 9, scope: !1397, inlinedAt: !1389)
!1401 = !DILocation(line: 533, column: 37, scope: !392, inlinedAt: !1395)
!1402 = !DILocation(line: 533, column: 12, scope: !392, inlinedAt: !1395)
!1403 = !DILocation(line: 707, column: 14, scope: !1268)
!1404 = !DILocation(line: 653, column: 9, scope: !1383, inlinedAt: !1387)
!1405 = !DILocation(line: 322, column: 47, scope: !1406, inlinedAt: !1411)
!1406 = distinct !DISubprogram(name: "min_footer_to_header", scope: !3, file: !3, line: 321, type: !1407, isLocal: true, isDefinition: true, scopeLine: 321, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1409)
!1407 = !DISubroutineType(types: !1408)
!1408 = !{!7, !30}
!1409 = !{!1410}
!1410 = !DILocalVariable(name: "footer", arg: 1, scope: !1406, file: !3, line: 321, type: !30)
!1411 = distinct !DILocation(line: 654, column: 16, scope: !1412, inlinedAt: !1387)
!1412 = distinct !DILexicalBlock(scope: !1397, file: !3, line: 653, column: 32)
!1413 = !DILocation(line: 322, column: 12, scope: !1406, inlinedAt: !1411)
!1414 = !DILocation(line: 654, column: 9, scope: !1412, inlinedAt: !1387)
!1415 = !DILocation(line: 632, column: 29, scope: !90, inlinedAt: !1391)
!1416 = !DILocation(line: 652, column: 13, scope: !1383, inlinedAt: !1387)
!1417 = !DILocation(line: 657, column: 22, scope: !1418, inlinedAt: !1387)
!1418 = distinct !DILexicalBlock(scope: !1383, file: !3, line: 657, column: 9)
!1419 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1420)
!1420 = distinct !DILocation(line: 657, column: 9, scope: !1418, inlinedAt: !1387)
!1421 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1420)
!1422 = !DILocation(line: 657, column: 32, scope: !1418, inlinedAt: !1387)
!1423 = !DILocation(line: 657, column: 9, scope: !1383, inlinedAt: !1387)
!1424 = !DILocalVariable(name: "footer", arg: 1, scope: !1425, file: !3, line: 332, type: !30)
!1425 = distinct !DISubprogram(name: "footer_to_header", scope: !3, file: !3, line: 332, type: !1407, isLocal: true, isDefinition: true, scopeLine: 332, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1426)
!1426 = !{!1424, !1427}
!1427 = !DILocalVariable(name: "size", scope: !1425, file: !3, line: 333, type: !39)
!1428 = !DILocation(line: 332, column: 42, scope: !1425, inlinedAt: !1429)
!1429 = distinct !DILocation(line: 661, column: 12, scope: !1383, inlinedAt: !1387)
!1430 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1431)
!1431 = distinct !DILocation(line: 333, column: 19, scope: !1425, inlinedAt: !1429)
!1432 = !DILocation(line: 333, column: 12, scope: !1425, inlinedAt: !1429)
!1433 = !DILocation(line: 335, column: 47, scope: !1425, inlinedAt: !1429)
!1434 = !DILocation(line: 335, column: 12, scope: !1425, inlinedAt: !1429)
!1435 = !DILocation(line: 661, column: 5, scope: !1383, inlinedAt: !1387)
!1436 = !DILocation(line: 0, scope: !1383, inlinedAt: !1387)
!1437 = !DILocation(line: 708, column: 18, scope: !1266)
!1438 = !DILocation(line: 709, column: 9, scope: !1266)
!1439 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1440)
!1440 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1441)
!1441 = distinct !DILocation(line: 710, column: 38, scope: !1266)
!1442 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1440)
!1443 = !DILocation(line: 710, column: 36, scope: !1266)
!1444 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !1445)
!1445 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !1446)
!1446 = distinct !DILocation(line: 711, column: 21, scope: !1266)
!1447 = !DILocation(line: 510, column: 44, scope: !366, inlinedAt: !1445)
!1448 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !1449)
!1449 = distinct !DILocation(line: 710, column: 9, scope: !1266)
!1450 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !1449)
!1451 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !1449)
!1452 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1453)
!1453 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1454)
!1454 = distinct !DILocation(line: 612, column: 51, scope: !376, inlinedAt: !1449)
!1455 = !DILocation(line: 533, column: 37, scope: !392, inlinedAt: !1453)
!1456 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1457)
!1457 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !1449)
!1458 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1457)
!1459 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1457)
!1460 = !DILocation(line: 204, column: 9, scope: !402, inlinedAt: !1457)
!1461 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !1457)
!1462 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !1449)
!1463 = !DILocation(line: 613, column: 24, scope: !385, inlinedAt: !1449)
!1464 = !DILocation(line: 613, column: 16, scope: !385, inlinedAt: !1449)
!1465 = !DILocation(line: 306, column: 42, scope: !420, inlinedAt: !1466)
!1466 = distinct !DILocation(line: 614, column: 27, scope: !384, inlinedAt: !1449)
!1467 = !DILocation(line: 309, column: 30, scope: !420, inlinedAt: !1466)
!1468 = !DILocation(line: 309, column: 23, scope: !420, inlinedAt: !1466)
!1469 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1470)
!1470 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1471)
!1471 = distinct !DILocation(line: 309, column: 40, scope: !420, inlinedAt: !1466)
!1472 = !DILocation(line: 309, column: 38, scope: !420, inlinedAt: !1466)
!1473 = !DILocation(line: 309, column: 56, scope: !420, inlinedAt: !1466)
!1474 = !DILocation(line: 309, column: 12, scope: !420, inlinedAt: !1466)
!1475 = !DILocation(line: 614, column: 17, scope: !384, inlinedAt: !1449)
!1476 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1477)
!1477 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1478)
!1478 = distinct !DILocation(line: 615, column: 50, scope: !384, inlinedAt: !1449)
!1479 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1480)
!1480 = distinct !DILocation(line: 615, column: 20, scope: !384, inlinedAt: !1449)
!1481 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1480)
!1482 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1480)
!1483 = !DILocation(line: 615, column: 18, scope: !384, inlinedAt: !1449)
!1484 = !DILocation(line: 616, column: 5, scope: !384, inlinedAt: !1449)
!1485 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !1486)
!1486 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !1449)
!1487 = !DILocation(line: 589, column: 24, scope: !166, inlinedAt: !1486)
!1488 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1489)
!1489 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1490)
!1490 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !1486)
!1491 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1489)
!1492 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !1486)
!1493 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !1449)
!1494 = !DILocation(line: 618, column: 14, scope: !449, inlinedAt: !1449)
!1495 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1496)
!1496 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1497)
!1497 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !1449)
!1498 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1499)
!1499 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !1449)
!1500 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1501)
!1501 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !1449)
!1502 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1499)
!1503 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1501)
!1504 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !1499)
!1505 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1499)
!1506 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1501)
!1507 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !1499)
!1508 = !DILocation(line: 208, column: 14, scope: !466, inlinedAt: !1499)
!1509 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !1449)
!1510 = !DILocation(line: 653, column: 9, scope: !1383, inlinedAt: !1389)
!1511 = !DILocation(line: 322, column: 47, scope: !1406, inlinedAt: !1512)
!1512 = distinct !DILocation(line: 654, column: 16, scope: !1412, inlinedAt: !1389)
!1513 = !DILocation(line: 322, column: 12, scope: !1406, inlinedAt: !1512)
!1514 = !DILocation(line: 654, column: 9, scope: !1412, inlinedAt: !1389)
!1515 = !DILocation(line: 632, column: 29, scope: !90, inlinedAt: !1393)
!1516 = !DILocation(line: 652, column: 13, scope: !1383, inlinedAt: !1389)
!1517 = !DILocation(line: 657, column: 22, scope: !1418, inlinedAt: !1389)
!1518 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1519)
!1519 = distinct !DILocation(line: 657, column: 9, scope: !1418, inlinedAt: !1389)
!1520 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1519)
!1521 = !DILocation(line: 657, column: 32, scope: !1418, inlinedAt: !1389)
!1522 = !DILocation(line: 657, column: 9, scope: !1383, inlinedAt: !1389)
!1523 = !DILocation(line: 332, column: 42, scope: !1425, inlinedAt: !1524)
!1524 = distinct !DILocation(line: 661, column: 12, scope: !1383, inlinedAt: !1389)
!1525 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1526)
!1526 = distinct !DILocation(line: 333, column: 19, scope: !1425, inlinedAt: !1524)
!1527 = !DILocation(line: 333, column: 12, scope: !1425, inlinedAt: !1524)
!1528 = !DILocation(line: 335, column: 47, scope: !1425, inlinedAt: !1524)
!1529 = !DILocation(line: 335, column: 12, scope: !1425, inlinedAt: !1524)
!1530 = !DILocation(line: 661, column: 5, scope: !1383, inlinedAt: !1389)
!1531 = !DILocation(line: 0, scope: !1383, inlinedAt: !1389)
!1532 = !DILocation(line: 717, column: 18, scope: !1271)
!1533 = !DILocation(line: 718, column: 9, scope: !1271)
!1534 = !DILocation(line: 719, column: 9, scope: !1271)
!1535 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1536)
!1536 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1537)
!1537 = distinct !DILocation(line: 721, column: 31, scope: !1271)
!1538 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1536)
!1539 = !DILocation(line: 721, column: 50, scope: !1271)
!1540 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1541)
!1541 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1542)
!1542 = distinct !DILocation(line: 721, column: 59, scope: !1271)
!1543 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1541)
!1544 = !DILocation(line: 721, column: 57, scope: !1271)
!1545 = !DILocation(line: 508, column: 39, scope: !366, inlinedAt: !1546)
!1546 = distinct !DILocation(line: 520, column: 12, scope: !370, inlinedAt: !1547)
!1547 = distinct !DILocation(line: 722, column: 21, scope: !1271)
!1548 = !DILocation(line: 510, column: 44, scope: !366, inlinedAt: !1546)
!1549 = !DILocation(line: 607, column: 34, scope: !376, inlinedAt: !1550)
!1550 = distinct !DILocation(line: 721, column: 9, scope: !1271)
!1551 = !DILocation(line: 607, column: 48, scope: !376, inlinedAt: !1550)
!1552 = !DILocation(line: 607, column: 59, scope: !376, inlinedAt: !1550)
!1553 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1554)
!1554 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1555)
!1555 = distinct !DILocation(line: 612, column: 51, scope: !376, inlinedAt: !1550)
!1556 = !DILocation(line: 533, column: 37, scope: !392, inlinedAt: !1554)
!1557 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1558)
!1558 = distinct !DILocation(line: 612, column: 21, scope: !376, inlinedAt: !1550)
!1559 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1558)
!1560 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1558)
!1561 = !DILocation(line: 204, column: 9, scope: !402, inlinedAt: !1558)
!1562 = !DILocation(line: 207, column: 9, scope: !402, inlinedAt: !1558)
!1563 = !DILocation(line: 612, column: 19, scope: !376, inlinedAt: !1550)
!1564 = !DILocation(line: 613, column: 24, scope: !385, inlinedAt: !1550)
!1565 = !DILocation(line: 613, column: 16, scope: !385, inlinedAt: !1550)
!1566 = !DILocation(line: 306, column: 42, scope: !420, inlinedAt: !1567)
!1567 = distinct !DILocation(line: 614, column: 27, scope: !384, inlinedAt: !1550)
!1568 = !DILocation(line: 309, column: 30, scope: !420, inlinedAt: !1567)
!1569 = !DILocation(line: 309, column: 23, scope: !420, inlinedAt: !1567)
!1570 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1571)
!1571 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1572)
!1572 = distinct !DILocation(line: 309, column: 40, scope: !420, inlinedAt: !1567)
!1573 = !DILocation(line: 309, column: 38, scope: !420, inlinedAt: !1567)
!1574 = !DILocation(line: 309, column: 56, scope: !420, inlinedAt: !1567)
!1575 = !DILocation(line: 309, column: 12, scope: !420, inlinedAt: !1567)
!1576 = !DILocation(line: 614, column: 17, scope: !384, inlinedAt: !1550)
!1577 = !DILocation(line: 531, column: 39, scope: !392, inlinedAt: !1578)
!1578 = distinct !DILocation(line: 541, column: 12, scope: !396, inlinedAt: !1579)
!1579 = distinct !DILocation(line: 615, column: 50, scope: !384, inlinedAt: !1550)
!1580 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1581)
!1581 = distinct !DILocation(line: 615, column: 20, scope: !384, inlinedAt: !1550)
!1582 = !DILocation(line: 199, column: 38, scope: !402, inlinedAt: !1581)
!1583 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1581)
!1584 = !DILocation(line: 615, column: 18, scope: !384, inlinedAt: !1550)
!1585 = !DILocation(line: 616, column: 5, scope: !384, inlinedAt: !1550)
!1586 = !DILocation(line: 585, column: 36, scope: !166, inlinedAt: !1587)
!1587 = distinct !DILocation(line: 617, column: 21, scope: !376, inlinedAt: !1550)
!1588 = !DILocation(line: 589, column: 24, scope: !166, inlinedAt: !1587)
!1589 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1590)
!1590 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1591)
!1591 = distinct !DILocation(line: 589, column: 40, scope: !166, inlinedAt: !1587)
!1592 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1590)
!1593 = !DILocation(line: 589, column: 38, scope: !166, inlinedAt: !1587)
!1594 = !DILocation(line: 617, column: 14, scope: !376, inlinedAt: !1550)
!1595 = !DILocation(line: 618, column: 14, scope: !449, inlinedAt: !1550)
!1596 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1597)
!1597 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1598)
!1598 = distinct !DILocation(line: 0, scope: !453, inlinedAt: !1550)
!1599 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1600)
!1600 = distinct !DILocation(line: 619, column: 24, scope: !456, inlinedAt: !1550)
!1601 = !DILocation(line: 199, column: 27, scope: !402, inlinedAt: !1602)
!1602 = distinct !DILocation(line: 621, column: 24, scope: !453, inlinedAt: !1550)
!1603 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1600)
!1604 = !DILocation(line: 199, column: 50, scope: !402, inlinedAt: !1602)
!1605 = !DILocation(line: 201, column: 9, scope: !402, inlinedAt: !1600)
!1606 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1600)
!1607 = !DILocation(line: 200, column: 12, scope: !402, inlinedAt: !1602)
!1608 = !DILocation(line: 199, column: 67, scope: !402, inlinedAt: !1600)
!1609 = !DILocation(line: 208, column: 14, scope: !466, inlinedAt: !1600)
!1610 = !DILocation(line: 618, column: 9, scope: !376, inlinedAt: !1550)
!1611 = !DILocation(line: 0, scope: !456, inlinedAt: !1550)
!1612 = !DILocation(line: 727, column: 1, scope: !1260)
!1613 = !DILocation(line: 0, scope: !1309)
!1614 = distinct !DISubprogram(name: "mm_realloc", scope: !3, file: !3, line: 1087, type: !1615, isLocal: false, isDefinition: true, scopeLine: 1087, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1617)
!1615 = !DISubroutineType(types: !1616)
!1616 = !{!6, !6, !39}
!1617 = !{!1618, !1619, !1620, !1621, !1622}
!1618 = !DILocalVariable(name: "ptr", arg: 1, scope: !1614, file: !3, line: 1087, type: !6)
!1619 = !DILocalVariable(name: "size", arg: 2, scope: !1614, file: !3, line: 1087, type: !39)
!1620 = !DILocalVariable(name: "block", scope: !1614, file: !3, line: 1088, type: !7)
!1621 = !DILocalVariable(name: "copysize", scope: !1614, file: !3, line: 1089, type: !39)
!1622 = !DILocalVariable(name: "newptr", scope: !1614, file: !3, line: 1090, type: !6)
!1623 = !DILocation(line: 1087, column: 21, scope: !1614)
!1624 = !DILocation(line: 1087, column: 33, scope: !1614)
!1625 = !DILocation(line: 283, column: 41, scope: !356, inlinedAt: !1626)
!1626 = distinct !DILocation(line: 1088, column: 22, scope: !1614)
!1627 = !DILocation(line: 284, column: 35, scope: !356, inlinedAt: !1626)
!1628 = !DILocation(line: 1088, column: 14, scope: !1614)
!1629 = !DILocation(line: 1093, column: 14, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1614, file: !3, line: 1093, column: 9)
!1631 = !DILocation(line: 1093, column: 9, scope: !1614)
!1632 = !DILocation(line: 1094, column: 9, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1630, file: !3, line: 1093, column: 20)
!1634 = !DILocation(line: 1095, column: 9, scope: !1633)
!1635 = !DILocation(line: 1099, column: 13, scope: !1636)
!1636 = distinct !DILexicalBlock(scope: !1614, file: !3, line: 1099, column: 9)
!1637 = !DILocation(line: 0, scope: !1614)
!1638 = !DILocation(line: 1099, column: 9, scope: !1614)
!1639 = !DILocation(line: 1090, column: 11, scope: !1614)
!1640 = !DILocation(line: 1107, column: 16, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1614, file: !3, line: 1107, column: 9)
!1642 = !DILocation(line: 1107, column: 9, scope: !1614)
!1643 = !DILocation(line: 264, column: 35, scope: !112, inlinedAt: !1644)
!1644 = distinct !DILocation(line: 274, column: 12, scope: !124, inlinedAt: !1645)
!1645 = distinct !DILocation(line: 567, column: 20, scope: !1646, inlinedAt: !1650)
!1646 = distinct !DISubprogram(name: "get_payload_size", scope: !3, file: !3, line: 566, type: !125, isLocal: true, isDefinition: true, scopeLine: 566, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1647)
!1647 = !{!1648, !1649}
!1648 = !DILocalVariable(name: "block", arg: 1, scope: !1646, file: !3, line: 566, type: !7)
!1649 = !DILocalVariable(name: "asize", scope: !1646, file: !3, line: 567, type: !39)
!1650 = distinct !DILocation(line: 1112, column: 16, scope: !1614)
!1651 = !DILocation(line: 265, column: 18, scope: !112, inlinedAt: !1644)
!1652 = !DILocation(line: 567, column: 12, scope: !1646, inlinedAt: !1650)
!1653 = !DILocation(line: 487, column: 34, scope: !104, inlinedAt: !1654)
!1654 = distinct !DILocation(line: 497, column: 12, scope: !136, inlinedAt: !1655)
!1655 = distinct !DILocation(line: 568, column: 9, scope: !1656, inlinedAt: !1650)
!1656 = distinct !DILexicalBlock(scope: !1646, file: !3, line: 568, column: 9)
!1657 = !DILocation(line: 488, column: 24, scope: !104, inlinedAt: !1654)
!1658 = !DILocation(line: 488, column: 12, scope: !104, inlinedAt: !1654)
!1659 = !DILocation(line: 568, column: 9, scope: !1646, inlinedAt: !1650)
!1660 = !DILocation(line: 1089, column: 12, scope: !1614)
!1661 = !DILocation(line: 1113, column: 14, scope: !1662)
!1662 = distinct !DILexicalBlock(scope: !1614, file: !3, line: 1113, column: 9)
!1663 = !DILocation(line: 1113, column: 9, scope: !1614)
!1664 = !DILocation(line: 1116, column: 5, scope: !1614)
!1665 = !DILocation(line: 1119, column: 5, scope: !1614)
!1666 = !DILocation(line: 1115, column: 5, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1662, file: !3, line: 1113, column: 26)
!1668 = !DILocation(line: 1122, column: 1, scope: !1614)
!1669 = distinct !DISubprogram(name: "mm_calloc", scope: !3, file: !3, line: 1135, type: !1670, isLocal: false, isDefinition: true, scopeLine: 1135, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !1672)
!1670 = !DISubroutineType(types: !1671)
!1671 = !{!6, !39, !39}
!1672 = !{!1673, !1674, !1675, !1676}
!1673 = !DILocalVariable(name: "elements", arg: 1, scope: !1669, file: !3, line: 1135, type: !39)
!1674 = !DILocalVariable(name: "size", arg: 2, scope: !1669, file: !3, line: 1135, type: !39)
!1675 = !DILocalVariable(name: "bp", scope: !1669, file: !3, line: 1136, type: !6)
!1676 = !DILocalVariable(name: "asize", scope: !1669, file: !3, line: 1137, type: !39)
!1677 = !DILocation(line: 1135, column: 21, scope: !1669)
!1678 = !DILocation(line: 1135, column: 38, scope: !1669)
!1679 = !DILocation(line: 1137, column: 29, scope: !1669)
!1680 = !DILocation(line: 1137, column: 12, scope: !1669)
!1681 = !DILocation(line: 1139, column: 18, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1669, file: !3, line: 1139, column: 9)
!1683 = !DILocation(line: 1139, column: 9, scope: !1669)
!1684 = !DILocation(line: 1142, column: 15, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1669, file: !3, line: 1142, column: 9)
!1686 = !DILocation(line: 1142, column: 26, scope: !1685)
!1687 = !DILocation(line: 1142, column: 9, scope: !1669)
!1688 = !DILocation(line: 1147, column: 10, scope: !1669)
!1689 = !DILocation(line: 1136, column: 11, scope: !1669)
!1690 = !DILocation(line: 1148, column: 12, scope: !1691)
!1691 = distinct !DILexicalBlock(scope: !1669, file: !3, line: 1148, column: 9)
!1692 = !DILocation(line: 1148, column: 9, scope: !1669)
!1693 = !DILocation(line: 1153, column: 5, scope: !1669)
!1694 = !DILocation(line: 1155, column: 5, scope: !1669)
!1695 = !DILocation(line: 0, scope: !1669)
!1696 = !DILocation(line: 1156, column: 1, scope: !1669)
