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
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @msan.module_ctor, i8* null }]
@__msan_track_origins = weak_odr local_unnamed_addr constant i32 2
@__msan_retval_tls = external thread_local(initialexec) global [100 x i64]
@__msan_retval_origin_tls = external thread_local(initialexec) global i32
@__msan_param_tls = external thread_local(initialexec) global [100 x i64]
@__msan_param_origin_tls = external thread_local(initialexec) global [200 x i32]
@__msan_va_arg_tls = external thread_local(initialexec) global [100 x i64]
@__msan_va_arg_overflow_size_tls = external thread_local(initialexec) global i64
@__msan_origin_tls = external thread_local(initialexec) global i32

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local zeroext i1 @mm_checkheap(i32 %line) local_unnamed_addr #0 !dbg !65 {
entry:
  call void @llvm.dbg.value(metadata i32 %line, metadata !70, metadata !DIExpression()), !dbg !83
  %0 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !84, !tbaa !85
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080) to i64*), align 8, !dbg !89
  %1 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080), i64 17592186044416) to i32*), align 8, !dbg !89
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !89
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !89
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !89
  %call = call fastcc i64* @find_prev_footer(%struct.block* %0), !dbg !89
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !90
  call void @llvm.dbg.value(metadata i64* %call, metadata !71, metadata !DIExpression()), !dbg !90
  %_mscmp = icmp eq i64 %_msret, 0, !dbg !91
  br i1 %_mscmp, label %4, label %2, !dbg !91, !prof !93

; <label>:2:                                      ; preds = %entry
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !90
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !91
  call void @__msan_warning_noreturn() #5, !dbg !91
  call void asm sideeffect "", ""() #5, !dbg !91
  unreachable, !dbg !91

; <label>:4:                                      ; preds = %entry
  %5 = load i64, i64* %call, align 8, !dbg !91, !tbaa !94
  %6 = ptrtoint i64* %call to i64, !dbg !96
  %7 = xor i64 %6, 87960930222080, !dbg !96
  %8 = inttoptr i64 %7 to i64*, !dbg !96
  %9 = add i64 %7, 17592186044416, !dbg !96
  %10 = inttoptr i64 %9 to i32*, !dbg !96
  %_msld129 = load i64, i64* %8, align 8, !dbg !96
  %11 = load i32, i32* %10, align 8, !dbg !96
  store i64 %_msld129, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !96
  store i32 %11, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !96
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !96
  %call1 = call fastcc zeroext i1 @extract_alloc(i64 %5), !dbg !96
  %_msret130 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !97
  br i1 %_msret130, label %12, label %14, !dbg !97, !prof !98

; <label>:12:                                     ; preds = %4
  %13 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !97
  store i32 %13, i32* @__msan_origin_tls, align 4, !dbg !97
  call void @__msan_warning_noreturn() #5, !dbg !97
  call void asm sideeffect "", ""() #5, !dbg !97
  unreachable, !dbg !97

; <label>:14:                                     ; preds = %4
  br i1 %call1, label %land.lhs.true, label %return, !dbg !97

land.lhs.true:                                    ; preds = %14
  store i64 %_msld129, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !99
  store i32 %11, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !99
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !99
  %call2 = call fastcc i64 @extract_size(i64 %5), !dbg !99
  %_msret131 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !100
  %15 = xor i64 %_msret131, -1, !dbg !100
  %16 = and i64 %call2, %15, !dbg !100
  %17 = icmp eq i64 %16, 0, !dbg !100
  %18 = icmp ne i64 %_msret131, 0, !dbg !100
  %_msprop_icmp = and i1 %18, %17, !dbg !100
  br i1 %_msprop_icmp, label %19, label %21, !dbg !101, !prof !98

; <label>:19:                                     ; preds = %land.lhs.true
  %20 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !100
  store i32 %20, i32* @__msan_origin_tls, align 4, !dbg !101
  call void @__msan_warning_noreturn() #5, !dbg !101
  call void asm sideeffect "", ""() #5, !dbg !101
  unreachable, !dbg !101

; <label>:21:                                     ; preds = %land.lhs.true
  %cmp = icmp eq i64 %call2, 0, !dbg !100
  br i1 %cmp, label %for.cond.preheader, label %return, !dbg !101

for.cond.preheader:                               ; preds = %21
  call void @llvm.dbg.value(metadata %struct.block* %0, metadata !74, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i64 0, metadata !72, metadata !DIExpression()), !dbg !103
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !104
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !104
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !104
  %call3111 = call fastcc i64 @get_size(%struct.block* %0), !dbg !104
  %_msret132 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !107
  %22 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !107
  %23 = xor i64 %_msret132, -1, !dbg !107
  %24 = and i64 %call3111, %23, !dbg !107
  %25 = icmp eq i64 %24, 0, !dbg !107
  %26 = icmp ne i64 %_msret132, 0, !dbg !107
  %_msprop_icmp133 = and i1 %26, %25, !dbg !107
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !108
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !108
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !108
  %call5113 = call fastcc zeroext i1 @get_alloc(%struct.block* %0), !dbg !108
  %_msret134 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !110
  %27 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !110
  br i1 %_msprop_icmp133, label %28, label %29, !dbg !110, !prof !98

; <label>:28:                                     ; preds = %for.cond.preheader
  store i32 %22, i32* @__msan_origin_tls, align 4, !dbg !110
  call void @__msan_warning_noreturn() #5, !dbg !110
  call void asm sideeffect "", ""() #5, !dbg !110
  unreachable, !dbg !110

; <label>:29:                                     ; preds = %for.cond.preheader
  %cmp4112 = icmp eq i64 %call3111, 0, !dbg !107
  br i1 %cmp4112, label %for.end, label %if.end7.preheader, !dbg !110

if.end7.preheader:                                ; preds = %29
  br label %if.end7, !dbg !111

if.end7:                                          ; preds = %if.end7.preheader, %49
  %_msphi_s171 = phi i1 [ %_msret189, %49 ], [ %_msret134, %if.end7.preheader ]
  %_msphi_o172 = phi i32 [ %47, %49 ], [ %27, %if.end7.preheader ]
  %call5118 = phi i1 [ %call5, %49 ], [ %call5113, %if.end7.preheader ]
  %_msphi_s173 = phi i64 [ %_msret187, %49 ], [ %_msret132, %if.end7.preheader ]
  %_msphi_o174 = phi i32 [ %42, %49 ], [ %22, %if.end7.preheader ]
  %call3117 = phi i64 [ %call3, %49 ], [ %call3111, %if.end7.preheader ]
  %_msphi_s175 = phi i64 [ %_msret186, %49 ], [ %_msld, %if.end7.preheader ]
  %_msphi_o176 = phi i32 [ %41, %49 ], [ %1, %if.end7.preheader ]
  %block.0116 = phi %struct.block* [ %call19, %49 ], [ %0, %if.end7.preheader ]
  %lastfree.0115 = phi i1 [ %lastfree.1, %49 ], [ false, %if.end7.preheader ]
  %freeblocks.0114 = phi i64 [ %freeblocks.1, %49 ], [ 0, %if.end7.preheader ]
  call void @llvm.dbg.value(metadata %struct.block* %block.0116, metadata !74, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i64 %freeblocks.0114, metadata !72, metadata !DIExpression()), !dbg !103
  %30 = and i64 %_msphi_s173, 15, !dbg !111
  %rem = and i64 %call3117, 15, !dbg !111
  %31 = xor i64 %30, -1, !dbg !114
  %32 = and i64 %rem, %31, !dbg !114
  %33 = icmp eq i64 %32, 0, !dbg !114
  %34 = icmp ne i64 %30, 0, !dbg !114
  %_msprop_icmp181 = and i1 %34, %33, !dbg !114
  br i1 %_msprop_icmp181, label %35, label %36, !dbg !115, !prof !98

; <label>:35:                                     ; preds = %if.end7
  store i32 %_msphi_o174, i32* @__msan_origin_tls, align 4, !dbg !115
  call void @__msan_warning_noreturn() #5, !dbg !115
  call void asm sideeffect "", ""() #5, !dbg !115
  unreachable, !dbg !115

; <label>:36:                                     ; preds = %if.end7
  %cmp9 = icmp eq i64 %rem, 0, !dbg !114
  br i1 %cmp9, label %if.end11, label %return.loopexit213, !dbg !115

if.end11:                                         ; preds = %36
  br i1 %_msphi_s171, label %37, label %38, !dbg !116, !prof !98

; <label>:37:                                     ; preds = %if.end11
  store i32 %_msphi_o172, i32* @__msan_origin_tls, align 4, !dbg !116
  call void @__msan_warning_noreturn() #5, !dbg !116
  call void asm sideeffect "", ""() #5, !dbg !116
  unreachable, !dbg !116

; <label>:38:                                     ; preds = %if.end11
  br i1 %call5118, label %for.inc, label %if.then13, !dbg !116

if.then13:                                        ; preds = %38
  br i1 false, label %39, label %40, !dbg !117, !prof !98

; <label>:39:                                     ; preds = %if.then13
  unreachable, !dbg !117

; <label>:40:                                     ; preds = %if.then13
  br i1 %lastfree.0115, label %return.loopexit213, label %if.else15, !dbg !117

if.else15:                                        ; preds = %40
  %inc = add i64 %freeblocks.0114, 1, !dbg !120
  call void @llvm.dbg.value(metadata i64 %inc, metadata !72, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.value(metadata i8 1, metadata !73, metadata !DIExpression()), !dbg !121
  br label %for.inc, !dbg !122

for.inc:                                          ; preds = %38, %if.else15
  %freeblocks.1 = phi i64 [ %inc, %if.else15 ], [ %freeblocks.0114, %38 ], !dbg !123
  %lastfree.1 = phi i1 [ true, %if.else15 ], [ false, %38 ], !dbg !124
  store i64 %_msphi_s175, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !127
  store i32 %_msphi_o176, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !127
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !127
  %call19 = call fastcc %struct.block* @find_next(%struct.block* %block.0116), !dbg !127
  %_msret186 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !102
  %41 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !102
  call void @llvm.dbg.value(metadata %struct.block* %call19, metadata !74, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i64 %freeblocks.1, metadata !72, metadata !DIExpression()), !dbg !103
  store i64 %_msret186, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !104
  store i32 %41, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !104
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !104
  %call3 = call fastcc i64 @get_size(%struct.block* %call19), !dbg !104
  %_msret187 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !107
  %42 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !107
  %43 = xor i64 %_msret187, -1, !dbg !107
  %44 = and i64 %call3, %43, !dbg !107
  %45 = icmp eq i64 %44, 0, !dbg !107
  %46 = icmp ne i64 %_msret187, 0, !dbg !107
  %_msprop_icmp188 = and i1 %46, %45, !dbg !107
  store i64 %_msret186, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !108
  store i32 %41, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !108
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !108
  %call5 = call fastcc zeroext i1 @get_alloc(%struct.block* %call19), !dbg !108
  %_msret189 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !110
  %47 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !110
  br i1 %_msprop_icmp188, label %48, label %49, !dbg !110, !prof !98

; <label>:48:                                     ; preds = %for.inc
  store i32 %42, i32* @__msan_origin_tls, align 4, !dbg !110
  call void @__msan_warning_noreturn() #5, !dbg !110
  call void asm sideeffect "", ""() #5, !dbg !110
  unreachable, !dbg !110

; <label>:49:                                     ; preds = %for.inc
  %cmp4 = icmp eq i64 %call3, 0, !dbg !107
  br i1 %cmp4, label %for.end.loopexit, label %if.end7, !dbg !110, !llvm.loop !128

for.end.loopexit:                                 ; preds = %49
  call void @llvm.dbg.value(metadata i64 %freeblocks.1, metadata !72, metadata !DIExpression()), !dbg !103
  br label %for.end, !dbg !130

for.end:                                          ; preds = %for.end.loopexit, %29
  %freeblocks.0.lcssa = phi i64 [ 0, %29 ], [ %freeblocks.1, %for.end.loopexit ], !dbg !103
  %_msphi_s135 = phi i1 [ %_msret134, %29 ], [ %_msret189, %for.end.loopexit ], !dbg !108
  %_msphi_o136 = phi i32 [ %27, %29 ], [ %47, %for.end.loopexit ], !dbg !108
  %call5.lcssa = phi i1 [ %call5113, %29 ], [ %call5, %for.end.loopexit ], !dbg !108
  call void @llvm.dbg.value(metadata i64 %freeblocks.0.lcssa, metadata !72, metadata !DIExpression()), !dbg !103
  br i1 %_msphi_s135, label %50, label %51, !dbg !130, !prof !98

; <label>:50:                                     ; preds = %for.end
  store i32 %_msphi_o136, i32* @__msan_origin_tls, align 4, !dbg !130
  call void @__msan_warning_noreturn() #5, !dbg !130
  call void asm sideeffect "", ""() #5, !dbg !130
  unreachable, !dbg !130

; <label>:51:                                     ; preds = %for.end
  br i1 %call5.lcssa, label %for.body32.preheader, label %return, !dbg !130

for.body32.preheader:                             ; preds = %51
  br label %for.body32, !dbg !131

for.body32:                                       ; preds = %for.body32.preheader, %164
  %i.0110 = phi i64 [ %inc71, %164 ], [ 0, %for.body32.preheader ]
  %freelinks.0109 = phi i64 [ %freelinks.1.lcssa, %164 ], [ 0, %for.body32.preheader ]
  call void @llvm.dbg.value(metadata i64 %i.0110, metadata !76, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.value(metadata i64 %freelinks.0109, metadata !75, metadata !DIExpression()), !dbg !133
  %arrayidx = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %i.0110, !dbg !131
  br i1 false, label %52, label %53, !dbg !131, !prof !98

; <label>:52:                                     ; preds = %for.body32
  unreachable, !dbg !131

; <label>:53:                                     ; preds = %for.body32
  %54 = load %struct.block*, %struct.block** %arrayidx, align 8, !dbg !131, !tbaa !85
  %55 = ptrtoint %struct.block** %arrayidx to i64, !dbg !134
  %56 = xor i64 %55, 87960930222080, !dbg !134
  %57 = inttoptr i64 %56 to i64*, !dbg !134
  %58 = add i64 %56, 17592186044416, !dbg !134
  %59 = inttoptr i64 %58 to i32*, !dbg !134
  %_msld141 = load i64, i64* %57, align 8, !dbg !134
  %60 = load i32, i32* %59, align 8, !dbg !134
  call void @llvm.dbg.value(metadata %struct.block* %54, metadata !78, metadata !DIExpression()), !dbg !134
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !135
  store i64 0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !135
  store i32 0, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !135
  store i64 0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 8) to i64*), align 8, !dbg !135
  store i64 0, i64* @__msan_va_arg_overflow_size_tls, align 8, !dbg !135
  store i32 0, i32* bitcast ([100 x i64]* @__msan_retval_tls to i32*), align 8, !dbg !135
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 %i.0110), !dbg !135
  call void @llvm.dbg.value(metadata %struct.block* %54, metadata !81, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i64 %freelinks.0109, metadata !75, metadata !DIExpression()), !dbg !133
  %61 = ptrtoint %struct.block* %54 to i64, !dbg !137
  %62 = xor i64 %_msld141, -1, !dbg !137
  %63 = and i64 %62, %61, !dbg !137
  %64 = icmp eq i64 %63, 0, !dbg !137
  %65 = icmp ne i64 %_msld141, 0, !dbg !137
  %_msprop_icmp143 = and i1 %65, %64, !dbg !137
  br i1 %_msprop_icmp143, label %66, label %67, !dbg !139, !prof !98

; <label>:66:                                     ; preds = %53
  store i32 %60, i32* @__msan_origin_tls, align 4, !dbg !139
  call void @__msan_warning_noreturn() #5, !dbg !139
  call void asm sideeffect "", ""() #5, !dbg !139
  unreachable, !dbg !139

; <label>:67:                                     ; preds = %53
  %cmp35106 = icmp eq %struct.block* %54, null, !dbg !137
  br i1 %cmp35106, label %for.inc70, label %for.body36.preheader, !dbg !139

for.body36.preheader:                             ; preds = %67
  br label %for.body36, !dbg !140

for.body36:                                       ; preds = %for.body36.preheader, %162
  %_msphi_s149 = phi i64 [ %_msld164, %162 ], [ %_msld141, %for.body36.preheader ]
  %_msphi_o150 = phi i32 [ %155, %162 ], [ %60, %for.body36.preheader ]
  %curr.0108 = phi %struct.block* [ %149, %162 ], [ %54, %for.body36.preheader ]
  %freelinks.1107 = phi i64 [ %inc44, %162 ], [ %freelinks.0109, %for.body36.preheader ]
  call void @llvm.dbg.value(metadata %struct.block* %curr.0108, metadata !81, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i64 %freelinks.1107, metadata !75, metadata !DIExpression()), !dbg !133
  store i64 %_msphi_s149, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !140
  store i32 %_msphi_o150, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !140
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !140
  %call37 = call fastcc i64 @get_size(%struct.block* nonnull %curr.0108), !dbg !140
  %_msret153 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !142
  %68 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !142
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !142
  store i64 %_msret153, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !142
  store i32 %68, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !142
  store i64 %_msret153, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_va_arg_tls to i64), i64 8) to i64*), align 8, !dbg !142
  store i64 0, i64* @__msan_va_arg_overflow_size_tls, align 8, !dbg !142
  store i32 0, i32* bitcast ([100 x i64]* @__msan_retval_tls to i32*), align 8, !dbg !142
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i64 %call37), !dbg !142
  store i64 %_msphi_s149, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !143
  store i32 %_msphi_o150, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !143
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !143
  %call39 = call fastcc i64 @get_size(%struct.block* nonnull %curr.0108), !dbg !143
  %_msret155 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !145
  %69 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !145
  store i64 %_msret155, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !145
  store i32 %69, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !145
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !145
  %call40 = call fastcc i64 @find_size_list(i64 %call39), !dbg !145
  %_msret156 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !146
  %70 = xor i64 %call40, %i.0110, !dbg !146
  %71 = xor i64 %_msret156, -1, !dbg !146
  %72 = and i64 %70, %71, !dbg !146
  %73 = icmp eq i64 %72, 0, !dbg !146
  %74 = icmp ne i64 %_msret156, 0, !dbg !146
  %_msprop_icmp157 = and i1 %74, %73, !dbg !146
  br i1 %_msprop_icmp157, label %75, label %77, !dbg !147, !prof !98

; <label>:75:                                     ; preds = %for.body36
  %76 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !146
  store i32 %76, i32* @__msan_origin_tls, align 4, !dbg !147
  call void @__msan_warning_noreturn() #5, !dbg !147
  call void asm sideeffect "", ""() #5, !dbg !147
  unreachable, !dbg !147

; <label>:77:                                     ; preds = %for.body36
  %cmp41 = icmp eq i64 %i.0110, %call40, !dbg !146
  br i1 %cmp41, label %if.end43, label %return.loopexit, !dbg !147

if.end43:                                         ; preds = %77
  %inc44 = add i64 %freelinks.1107, 1, !dbg !148
  store i64 %_msphi_s149, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !149
  store i32 %_msphi_o150, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !149
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !149
  %call45 = call fastcc zeroext i1 @get_alloc(%struct.block* nonnull %curr.0108), !dbg !149
  %_msret158 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !151
  br i1 %_msret158, label %78, label %80, !dbg !151, !prof !98

; <label>:78:                                     ; preds = %if.end43
  %79 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !151
  store i32 %79, i32* @__msan_origin_tls, align 4, !dbg !151
  call void @__msan_warning_noreturn() #5, !dbg !151
  call void asm sideeffect "", ""() #5, !dbg !151
  unreachable, !dbg !151

; <label>:80:                                     ; preds = %if.end43
  br i1 %call45, label %return.loopexit, label %if.end47, !dbg !151

if.end47:                                         ; preds = %80
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !152
  %call48 = call i8* @mem_heap_lo() #5, !dbg !152
  %_msret159 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !154
  %_msprop160 = or i64 %_msret159, %_msphi_s149, !dbg !155
  %81 = icmp eq i64 %_msprop160, 0, !dbg !155
  br i1 %81, label %86, label %82, !dbg !156, !prof !93

; <label>:82:                                     ; preds = %if.end47
  %83 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !154
  %84 = icmp eq i64 %_msret159, 0, !dbg !155
  %85 = select i1 %84, i32 %_msphi_o150, i32 %83, !dbg !155
  store i32 %85, i32* @__msan_origin_tls, align 4, !dbg !156
  call void @__msan_warning_noreturn() #5, !dbg !156
  call void asm sideeffect "", ""() #5, !dbg !156
  unreachable, !dbg !156

; <label>:86:                                     ; preds = %if.end47
  %87 = bitcast i8* %call48 to %struct.block*, !dbg !154
  %cmp49 = icmp ult %struct.block* %curr.0108, %87, !dbg !155
  br i1 %cmp49, label %return.loopexit, label %lor.lhs.false, !dbg !156

lor.lhs.false:                                    ; preds = %86
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !157
  %call50 = call i8* @mem_heap_hi() #5, !dbg !157
  %_msret161 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !158
  %_msprop162 = or i64 %_msret161, %_msphi_s149, !dbg !159
  %88 = icmp eq i64 %_msprop162, 0, !dbg !159
  br i1 %88, label %93, label %89, !dbg !160, !prof !93

; <label>:89:                                     ; preds = %lor.lhs.false
  %90 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !158
  %91 = icmp eq i64 %_msret161, 0, !dbg !159
  %92 = select i1 %91, i32 %_msphi_o150, i32 %90, !dbg !159
  store i32 %92, i32* @__msan_origin_tls, align 4, !dbg !160
  call void @__msan_warning_noreturn() #5, !dbg !160
  call void asm sideeffect "", ""() #5, !dbg !160
  unreachable, !dbg !160

; <label>:93:                                     ; preds = %lor.lhs.false
  %94 = bitcast i8* %call50 to %struct.block*, !dbg !158
  %cmp51 = icmp ugt %struct.block* %curr.0108, %94, !dbg !159
  br i1 %cmp51, label %return.loopexit, label %if.end53, !dbg !160

if.end53:                                         ; preds = %93
  %95 = ptrtoint %struct.block* %curr.0108 to i64, !dbg !161
  %96 = xor i64 %95, %61, !dbg !161
  %97 = or i64 %_msphi_s149, %_msld141, !dbg !161
  %98 = xor i64 %97, -1, !dbg !161
  %99 = and i64 %96, %98, !dbg !161
  %100 = icmp eq i64 %99, 0, !dbg !161
  %101 = icmp ne i64 %97, 0, !dbg !161
  %_msprop_icmp163 = and i1 %101, %100, !dbg !161
  br i1 %_msprop_icmp163, label %102, label %104, !dbg !163, !prof !98

; <label>:102:                                    ; preds = %if.end53
  %103 = select i1 %65, i32 %60, i32 %_msphi_o150, !dbg !161
  store i32 %103, i32* @__msan_origin_tls, align 4, !dbg !163
  call void @__msan_warning_noreturn() #5, !dbg !163
  call void asm sideeffect "", ""() #5, !dbg !163
  unreachable, !dbg !163

; <label>:104:                                    ; preds = %if.end53
  %cmp54 = icmp eq %struct.block* %curr.0108, %54, !dbg !161
  br i1 %cmp54, label %.for.inc67_crit_edge, label %land.lhs.true55, !dbg !163

.for.inc67_crit_edge:                             ; preds = %104
  %.pre = getelementptr inbounds %struct.block, %struct.block* %curr.0108, i64 0, i32 1, i32 0, i32 0, !dbg !164
  br label %for.inc67, !dbg !163

land.lhs.true55:                                  ; preds = %104
  %next = getelementptr inbounds %struct.block, %struct.block* %curr.0108, i64 0, i32 1, i32 0, i32 0, !dbg !165
  %_mscmp204 = icmp eq i64 %_msphi_s149, 0, !dbg !165
  br i1 %_mscmp204, label %106, label %105, !dbg !165, !prof !93

; <label>:105:                                    ; preds = %land.lhs.true55
  store i32 %_msphi_o150, i32* @__msan_origin_tls, align 4, !dbg !165
  call void @__msan_warning_noreturn() #5, !dbg !165
  call void asm sideeffect "", ""() #5, !dbg !165
  unreachable, !dbg !165

; <label>:106:                                    ; preds = %land.lhs.true55
  %107 = load %struct.block*, %struct.block** %next, align 8, !dbg !165, !tbaa !166
  %108 = ptrtoint %struct.block** %next to i64, !dbg !167
  %109 = xor i64 %108, 87960930222080, !dbg !167
  %110 = inttoptr i64 %109 to i64*, !dbg !167
  %111 = add i64 %109, 17592186044416, !dbg !167
  %112 = inttoptr i64 %111 to i32*, !dbg !167
  %_msld166 = load i64, i64* %110, align 8, !dbg !167
  %113 = load i32, i32* %112, align 8, !dbg !167
  %114 = ptrtoint %struct.block* %107 to i64, !dbg !167
  %115 = xor i64 %_msld166, -1, !dbg !167
  %116 = and i64 %115, %114, !dbg !167
  %117 = icmp eq i64 %116, 0, !dbg !167
  %118 = icmp ne i64 %_msld166, 0, !dbg !167
  %_msprop_icmp167 = and i1 %118, %117, !dbg !167
  br i1 %_msprop_icmp167, label %119, label %120, !dbg !168, !prof !98

; <label>:119:                                    ; preds = %106
  store i32 %113, i32* @__msan_origin_tls, align 4, !dbg !168
  call void @__msan_warning_noreturn() #5, !dbg !168
  call void asm sideeffect "", ""() #5, !dbg !168
  unreachable, !dbg !168

; <label>:120:                                    ; preds = %106
  %cmp56 = icmp eq %struct.block* %107, null, !dbg !167
  br i1 %cmp56, label %for.inc67, label %land.lhs.true57, !dbg !168

land.lhs.true57:                                  ; preds = %120
  store i64 %_msld166, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !169
  store i32 %113, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !169
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !169
  %call59 = call fastcc i64 @get_size(%struct.block* nonnull %107), !dbg !169
  %_msret168 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !170
  %121 = xor i64 %_msret168, -1, !dbg !170
  %122 = and i64 %call59, %121, !dbg !170
  %123 = icmp ugt i64 %122, 16, !dbg !170
  %124 = or i64 %_msret168, %call59, !dbg !170
  %125 = icmp ugt i64 %124, 16, !dbg !170
  %126 = xor i1 %123, %125, !dbg !170
  br i1 %126, label %127, label %129, !dbg !171, !prof !98

; <label>:127:                                    ; preds = %land.lhs.true57
  %128 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !170
  store i32 %128, i32* @__msan_origin_tls, align 4, !dbg !171
  call void @__msan_warning_noreturn() #5, !dbg !171
  call void asm sideeffect "", ""() #5, !dbg !171
  unreachable, !dbg !171

; <label>:129:                                    ; preds = %land.lhs.true57
  %cmp60 = icmp ugt i64 %call59, 16, !dbg !170
  br i1 %cmp60, label %if.then61, label %for.inc67, !dbg !171

if.then61:                                        ; preds = %129
  %prev = getelementptr inbounds %struct.block, %struct.block* %107, i64 0, i32 1, i32 0, i32 1, !dbg !172
  br i1 %118, label %130, label %131, !dbg !172, !prof !98

; <label>:130:                                    ; preds = %if.then61
  store i32 %113, i32* @__msan_origin_tls, align 4, !dbg !172
  call void @__msan_warning_noreturn() #5, !dbg !172
  call void asm sideeffect "", ""() #5, !dbg !172
  unreachable, !dbg !172

; <label>:131:                                    ; preds = %if.then61
  %132 = load %struct.block*, %struct.block** %prev, align 8, !dbg !172, !tbaa !166
  %133 = ptrtoint %struct.block** %prev to i64, !dbg !175
  %134 = xor i64 %133, 87960930222080, !dbg !175
  %135 = inttoptr i64 %134 to i64*, !dbg !175
  %_msld169 = load i64, i64* %135, align 8, !dbg !175
  %136 = ptrtoint %struct.block* %132 to i64, !dbg !175
  %137 = xor i64 %136, %95, !dbg !175
  %138 = xor i64 %_msld169, -1, !dbg !175
  %139 = and i64 %137, %138, !dbg !175
  %140 = icmp eq i64 %139, 0, !dbg !175
  %141 = icmp ne i64 %_msld169, 0, !dbg !175
  %_msprop_icmp170 = and i1 %141, %140, !dbg !175
  br i1 %_msprop_icmp170, label %142, label %146, !dbg !176, !prof !98

; <label>:142:                                    ; preds = %131
  %143 = add i64 %134, 17592186044416, !dbg !175
  %144 = inttoptr i64 %143 to i32*, !dbg !175
  %145 = load i32, i32* %144, align 8, !dbg !175
  store i32 %145, i32* @__msan_origin_tls, align 4, !dbg !176
  call void @__msan_warning_noreturn() #5, !dbg !176
  call void asm sideeffect "", ""() #5, !dbg !176
  unreachable, !dbg !176

; <label>:146:                                    ; preds = %131
  %cmp63 = icmp eq %struct.block* %curr.0108, %132, !dbg !175
  br i1 %cmp63, label %for.inc67, label %return.loopexit, !dbg !176

for.inc67:                                        ; preds = %.for.inc67_crit_edge, %120, %129, %146
  %next68.pre-phi = phi %struct.block** [ %.pre, %.for.inc67_crit_edge ], [ %next, %120 ], [ %next, %129 ], [ %next, %146 ], !dbg !164
  %_mscmp202 = icmp eq i64 %_msphi_s149, 0, !dbg !164
  br i1 %_mscmp202, label %148, label %147, !dbg !164, !prof !93

; <label>:147:                                    ; preds = %for.inc67
  store i32 %_msphi_o150, i32* @__msan_origin_tls, align 4, !dbg !164
  call void @__msan_warning_noreturn() #5, !dbg !164
  call void asm sideeffect "", ""() #5, !dbg !164
  unreachable, !dbg !164

; <label>:148:                                    ; preds = %for.inc67
  %149 = load %struct.block*, %struct.block** %next68.pre-phi, align 8, !dbg !164, !tbaa !166
  %150 = ptrtoint %struct.block** %next68.pre-phi to i64, !dbg !136
  %151 = xor i64 %150, 87960930222080, !dbg !136
  %152 = inttoptr i64 %151 to i64*, !dbg !136
  %153 = add i64 %151, 17592186044416, !dbg !136
  %154 = inttoptr i64 %153 to i32*, !dbg !136
  %_msld164 = load i64, i64* %152, align 8, !dbg !136
  %155 = load i32, i32* %154, align 8, !dbg !136
  call void @llvm.dbg.value(metadata %struct.block* %149, metadata !81, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i64 %inc44, metadata !75, metadata !DIExpression()), !dbg !133
  %156 = ptrtoint %struct.block* %149 to i64, !dbg !137
  %157 = xor i64 %_msld164, -1, !dbg !137
  %158 = and i64 %157, %156, !dbg !137
  %159 = icmp eq i64 %158, 0, !dbg !137
  %160 = icmp ne i64 %_msld164, 0, !dbg !137
  %_msprop_icmp165 = and i1 %160, %159, !dbg !137
  br i1 %_msprop_icmp165, label %161, label %162, !dbg !139, !prof !98

; <label>:161:                                    ; preds = %148
  store i32 %155, i32* @__msan_origin_tls, align 4, !dbg !139
  call void @__msan_warning_noreturn() #5, !dbg !139
  call void asm sideeffect "", ""() #5, !dbg !139
  unreachable, !dbg !139

; <label>:162:                                    ; preds = %148
  %cmp35 = icmp eq %struct.block* %149, null, !dbg !137
  br i1 %cmp35, label %for.inc70.loopexit, label %for.body36, !dbg !139, !llvm.loop !177

for.inc70.loopexit:                               ; preds = %162
  br label %for.inc70, !dbg !179

for.inc70:                                        ; preds = %for.inc70.loopexit, %67
  %freelinks.1.lcssa = phi i64 [ %freelinks.0109, %67 ], [ %inc44, %for.inc70.loopexit ], !dbg !180
  %inc71 = add nuw nsw i64 %i.0110, 1, !dbg !179
  call void @llvm.dbg.value(metadata i64 %inc71, metadata !76, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.value(metadata i64 %freelinks.1.lcssa, metadata !75, metadata !DIExpression()), !dbg !133
  br i1 false, label %163, label %164, !dbg !181, !prof !98

; <label>:163:                                    ; preds = %for.inc70
  unreachable, !dbg !181

; <label>:164:                                    ; preds = %for.inc70
  %165 = icmp ult i64 %inc71, 15, !dbg !182
  br i1 %165, label %for.body32, label %for.end72, !dbg !181, !llvm.loop !183

for.end72:                                        ; preds = %164
  call void @llvm.dbg.value(metadata i64 %freelinks.1.lcssa, metadata !75, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i64 %freelinks.1.lcssa, metadata !75, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i64 %freelinks.1.lcssa, metadata !75, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i64 %freelinks.1.lcssa, metadata !75, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i64 %freelinks.1.lcssa, metadata !75, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i64 %freelinks.1.lcssa, metadata !75, metadata !DIExpression()), !dbg !133
  %cmp73 = icmp eq i64 %freelinks.1.lcssa, %freeblocks.0.lcssa, !dbg !185
  br label %return, !dbg !187

return.loopexit:                                  ; preds = %77, %80, %93, %86, %146
  br label %return, !dbg !188

return.loopexit213:                               ; preds = %36, %40
  br label %return, !dbg !188

return:                                           ; preds = %return.loopexit213, %return.loopexit, %51, %for.end72, %14, %21
  %retval.0 = phi i1 [ false, %21 ], [ false, %14 ], [ %cmp73, %for.end72 ], [ false, %51 ], [ false, %return.loopexit ], [ false, %return.loopexit213 ], !dbg !189
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !188
  store i32 0, i32* @__msan_retval_origin_tls, align 4, !dbg !188
  ret i1 %retval.0, !dbg !188
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull i64* @find_prev_footer(%struct.block* readnone %block) unnamed_addr #0 !dbg !191 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !196
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !196
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !195, metadata !DIExpression()), !dbg !196
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !197
  %add.ptr = getelementptr inbounds i64, i64* %header, i64 -1, !dbg !198
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !199
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !199
  ret i64* %add.ptr, !dbg !199
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @extract_alloc(i64 %word) unnamed_addr #0 !dbg !200 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !205
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !205
  call void @llvm.dbg.value(metadata i64 %word, metadata !204, metadata !DIExpression()), !dbg !205
  %2 = and i64 %0, 1, !dbg !206
  %and = and i64 %word, 1, !dbg !206
  %3 = xor i64 %2, -1, !dbg !207
  %4 = and i64 %and, %3, !dbg !207
  %5 = icmp eq i64 %4, 0, !dbg !207
  %6 = icmp ne i64 %2, 0, !dbg !207
  %_msprop_icmp = and i1 %6, %5, !dbg !207
  %tobool = icmp ne i64 %and, 0, !dbg !207
  store i1 %_msprop_icmp, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !208
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !208
  ret i1 %tobool, !dbg !208
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @extract_size(i64 %word) unnamed_addr #0 !dbg !209 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !214
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !214
  call void @llvm.dbg.value(metadata i64 %word, metadata !213, metadata !DIExpression()), !dbg !214
  %2 = and i64 %0, -16, !dbg !215
  %and = and i64 %word, -16, !dbg !215
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !216
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !216
  ret i64 %and, !dbg !216
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @get_size(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !217 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !222
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !221, metadata !DIExpression()), !dbg !222
  %_mscmp = icmp eq i64 %0, 0, !dbg !223
  br i1 %_mscmp, label %3, label %1, !dbg !223, !prof !93

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !222
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !223
  call void @__msan_warning_noreturn() #5, !dbg !223
  call void asm sideeffect "", ""() #5, !dbg !223
  unreachable, !dbg !223

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !223
  %4 = load i64, i64* %header, align 8, !dbg !223, !tbaa !224
  %5 = ptrtoint %struct.block* %block to i64, !dbg !226
  %6 = xor i64 %5, 87960930222080, !dbg !226
  %7 = inttoptr i64 %6 to i64*, !dbg !226
  %8 = add i64 %6, 17592186044416, !dbg !226
  %9 = inttoptr i64 %8 to i32*, !dbg !226
  %_msld = load i64, i64* %7, align 8, !dbg !226
  %10 = load i32, i32* %9, align 8, !dbg !226
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !226
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !226
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !226
  %call = call fastcc i64 @extract_size(i64 %4), !dbg !226
  ret i64 %call, !dbg !227
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @get_alloc(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !228 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !233
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !232, metadata !DIExpression()), !dbg !233
  %_mscmp = icmp eq i64 %0, 0, !dbg !234
  br i1 %_mscmp, label %3, label %1, !dbg !234, !prof !93

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !233
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !234
  call void @__msan_warning_noreturn() #5, !dbg !234
  call void asm sideeffect "", ""() #5, !dbg !234
  unreachable, !dbg !234

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !234
  %4 = load i64, i64* %header, align 8, !dbg !234, !tbaa !224
  %5 = ptrtoint %struct.block* %block to i64, !dbg !235
  %6 = xor i64 %5, 87960930222080, !dbg !235
  %7 = inttoptr i64 %6 to i64*, !dbg !235
  %8 = add i64 %6, 17592186044416, !dbg !235
  %9 = inttoptr i64 %8 to i32*, !dbg !235
  %_msld = load i64, i64* %7, align 8, !dbg !235
  %10 = load i32, i32* %9, align 8, !dbg !235
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !235
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !235
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !235
  %call = call fastcc zeroext i1 @extract_alloc(i64 %4), !dbg !235
  ret i1 %call, !dbg !236
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @find_next(%struct.block* readonly %block) unnamed_addr #0 !dbg !237 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !242
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !242
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !241, metadata !DIExpression()), !dbg !242
  %2 = bitcast %struct.block* %block to i8*, !dbg !243
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !244
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !244
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !245
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !245
  %_msprop = or i64 %_msret, %0, !dbg !245
  %4 = icmp eq i64 %_msret, 0, !dbg !245
  %5 = select i1 %4, i32 %1, i32 %3, !dbg !245
  %add.ptr = getelementptr inbounds i8, i8* %2, i64 %call, !dbg !245
  %6 = bitcast i8* %add.ptr to %struct.block*, !dbg !246
  store i64 %_msprop, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !247
  store i32 %5, i32* @__msan_retval_origin_tls, align 4, !dbg !247
  ret %struct.block* %6, !dbg !247
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @find_size_list(i64 %size) unnamed_addr #0 !dbg !248 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !253
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !253
  call void @llvm.dbg.value(metadata i64 %size, metadata !252, metadata !DIExpression()), !dbg !253
  %2 = xor i64 %0, -1, !dbg !254
  %3 = and i64 %2, %size, !dbg !254
  %4 = icmp ult i64 %3, 17, !dbg !254
  %5 = or i64 %0, %size, !dbg !254
  %6 = icmp ult i64 %5, 17, !dbg !254
  %7 = xor i1 %4, %6, !dbg !254
  br i1 %7, label %8, label %9, !dbg !256, !prof !98

; <label>:8:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !256
  call void @__msan_warning_noreturn() #5, !dbg !256
  call void asm sideeffect "", ""() #5, !dbg !256
  unreachable, !dbg !256

; <label>:9:                                      ; preds = %entry
  %cmp = icmp ult i64 %size, 17, !dbg !254
  br i1 %cmp, label %return, label %if.else, !dbg !256

if.else:                                          ; preds = %9
  %10 = icmp ult i64 %3, 33, !dbg !257
  %11 = icmp ult i64 %5, 33, !dbg !257
  %12 = xor i1 %10, %11, !dbg !257
  br i1 %12, label %13, label %14, !dbg !259, !prof !98

; <label>:13:                                     ; preds = %if.else
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !259
  call void @__msan_warning_noreturn() #5, !dbg !259
  call void asm sideeffect "", ""() #5, !dbg !259
  unreachable, !dbg !259

; <label>:14:                                     ; preds = %if.else
  %cmp1 = icmp ult i64 %size, 33, !dbg !257
  br i1 %cmp1, label %return, label %if.else3, !dbg !259

if.else3:                                         ; preds = %14
  %15 = icmp ult i64 %3, 49, !dbg !260
  %16 = icmp ult i64 %5, 49, !dbg !260
  %17 = xor i1 %15, %16, !dbg !260
  br i1 %17, label %18, label %19, !dbg !262, !prof !98

; <label>:18:                                     ; preds = %if.else3
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !262
  call void @__msan_warning_noreturn() #5, !dbg !262
  call void asm sideeffect "", ""() #5, !dbg !262
  unreachable, !dbg !262

; <label>:19:                                     ; preds = %if.else3
  %cmp4 = icmp ult i64 %size, 49, !dbg !260
  br i1 %cmp4, label %return, label %if.else6, !dbg !262

if.else6:                                         ; preds = %19
  %20 = icmp ult i64 %3, 65, !dbg !263
  %21 = icmp ult i64 %5, 65, !dbg !263
  %22 = xor i1 %20, %21, !dbg !263
  br i1 %22, label %23, label %24, !dbg !265, !prof !98

; <label>:23:                                     ; preds = %if.else6
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !265
  call void @__msan_warning_noreturn() #5, !dbg !265
  call void asm sideeffect "", ""() #5, !dbg !265
  unreachable, !dbg !265

; <label>:24:                                     ; preds = %if.else6
  %cmp7 = icmp ult i64 %size, 65, !dbg !263
  br i1 %cmp7, label %return, label %if.else9, !dbg !265

if.else9:                                         ; preds = %24
  %25 = icmp ult i64 %3, 90, !dbg !266
  %26 = icmp ult i64 %5, 90, !dbg !266
  %27 = xor i1 %25, %26, !dbg !266
  br i1 %27, label %28, label %29, !dbg !268, !prof !98

; <label>:28:                                     ; preds = %if.else9
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !268
  call void @__msan_warning_noreturn() #5, !dbg !268
  call void asm sideeffect "", ""() #5, !dbg !268
  unreachable, !dbg !268

; <label>:29:                                     ; preds = %if.else9
  %cmp10 = icmp ult i64 %size, 90, !dbg !266
  br i1 %cmp10, label %return, label %if.else12, !dbg !268

if.else12:                                        ; preds = %29
  %30 = icmp ult i64 %3, 113, !dbg !269
  %31 = icmp ult i64 %5, 113, !dbg !269
  %32 = xor i1 %30, %31, !dbg !269
  br i1 %32, label %33, label %34, !dbg !271, !prof !98

; <label>:33:                                     ; preds = %if.else12
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !271
  call void @__msan_warning_noreturn() #5, !dbg !271
  call void asm sideeffect "", ""() #5, !dbg !271
  unreachable, !dbg !271

; <label>:34:                                     ; preds = %if.else12
  %cmp13 = icmp ult i64 %size, 113, !dbg !269
  br i1 %cmp13, label %return, label %if.else15, !dbg !271

if.else15:                                        ; preds = %34
  %35 = icmp ult i64 %3, 129, !dbg !272
  %36 = icmp ult i64 %5, 129, !dbg !272
  %37 = xor i1 %35, %36, !dbg !272
  br i1 %37, label %38, label %39, !dbg !274, !prof !98

; <label>:38:                                     ; preds = %if.else15
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !274
  call void @__msan_warning_noreturn() #5, !dbg !274
  call void asm sideeffect "", ""() #5, !dbg !274
  unreachable, !dbg !274

; <label>:39:                                     ; preds = %if.else15
  %cmp16 = icmp ult i64 %size, 129, !dbg !272
  br i1 %cmp16, label %return, label %if.else18, !dbg !274

if.else18:                                        ; preds = %39
  %40 = icmp ult i64 %3, 145, !dbg !275
  %41 = icmp ult i64 %5, 145, !dbg !275
  %42 = xor i1 %40, %41, !dbg !275
  br i1 %42, label %43, label %44, !dbg !277, !prof !98

; <label>:43:                                     ; preds = %if.else18
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !277
  call void @__msan_warning_noreturn() #5, !dbg !277
  call void asm sideeffect "", ""() #5, !dbg !277
  unreachable, !dbg !277

; <label>:44:                                     ; preds = %if.else18
  %cmp19 = icmp ult i64 %size, 145, !dbg !275
  br i1 %cmp19, label %return, label %if.else21, !dbg !277

if.else21:                                        ; preds = %44
  %45 = icmp ult i64 %3, 161, !dbg !278
  %46 = icmp ult i64 %5, 161, !dbg !278
  %47 = xor i1 %45, %46, !dbg !278
  br i1 %47, label %48, label %49, !dbg !280, !prof !98

; <label>:48:                                     ; preds = %if.else21
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !280
  call void @__msan_warning_noreturn() #5, !dbg !280
  call void asm sideeffect "", ""() #5, !dbg !280
  unreachable, !dbg !280

; <label>:49:                                     ; preds = %if.else21
  %cmp22 = icmp ult i64 %size, 161, !dbg !278
  br i1 %cmp22, label %return, label %if.else24, !dbg !280

if.else24:                                        ; preds = %49
  %50 = icmp ult i64 %3, 177, !dbg !281
  %51 = icmp ult i64 %5, 177, !dbg !281
  %52 = xor i1 %50, %51, !dbg !281
  br i1 %52, label %53, label %54, !dbg !283, !prof !98

; <label>:53:                                     ; preds = %if.else24
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !283
  call void @__msan_warning_noreturn() #5, !dbg !283
  call void asm sideeffect "", ""() #5, !dbg !283
  unreachable, !dbg !283

; <label>:54:                                     ; preds = %if.else24
  %cmp25 = icmp ult i64 %size, 177, !dbg !281
  br i1 %cmp25, label %return, label %if.else27, !dbg !283

if.else27:                                        ; preds = %54
  %55 = icmp ult i64 %3, 257, !dbg !284
  %56 = icmp ult i64 %5, 257, !dbg !284
  %57 = xor i1 %55, %56, !dbg !284
  br i1 %57, label %58, label %59, !dbg !286, !prof !98

; <label>:58:                                     ; preds = %if.else27
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !286
  call void @__msan_warning_noreturn() #5, !dbg !286
  call void asm sideeffect "", ""() #5, !dbg !286
  unreachable, !dbg !286

; <label>:59:                                     ; preds = %if.else27
  %cmp28 = icmp ult i64 %size, 257, !dbg !284
  br i1 %cmp28, label %return, label %if.else30, !dbg !286

if.else30:                                        ; preds = %59
  %60 = icmp ult i64 %3, 513, !dbg !287
  %61 = icmp ult i64 %5, 513, !dbg !287
  %62 = xor i1 %60, %61, !dbg !287
  br i1 %62, label %63, label %64, !dbg !289, !prof !98

; <label>:63:                                     ; preds = %if.else30
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !289
  call void @__msan_warning_noreturn() #5, !dbg !289
  call void asm sideeffect "", ""() #5, !dbg !289
  unreachable, !dbg !289

; <label>:64:                                     ; preds = %if.else30
  %cmp31 = icmp ult i64 %size, 513, !dbg !287
  br i1 %cmp31, label %return, label %if.else33, !dbg !289

if.else33:                                        ; preds = %64
  %65 = icmp ult i64 %3, 900, !dbg !290
  %66 = icmp ult i64 %5, 900, !dbg !290
  %67 = xor i1 %65, %66, !dbg !290
  br i1 %67, label %68, label %69, !dbg !292, !prof !98

; <label>:68:                                     ; preds = %if.else33
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !292
  call void @__msan_warning_noreturn() #5, !dbg !292
  call void asm sideeffect "", ""() #5, !dbg !292
  unreachable, !dbg !292

; <label>:69:                                     ; preds = %if.else33
  %cmp34 = icmp ult i64 %size, 900, !dbg !290
  br i1 %cmp34, label %return, label %if.else36, !dbg !292

if.else36:                                        ; preds = %69
  %70 = icmp ult i64 %3, 5000, !dbg !293
  %71 = icmp ult i64 %5, 5000, !dbg !293
  %72 = xor i1 %70, %71, !dbg !293
  %cmp37 = icmp ult i64 %size, 5000, !dbg !293
  %_msprop_select = select i1 %72, i64 3, i64 0, !dbg !295
  %73 = select i1 %72, i32 %1, i32 0, !dbg !295
  %. = select i1 %cmp37, i64 13, i64 14, !dbg !295
  br label %return, !dbg !295

return:                                           ; preds = %if.else36, %69, %64, %59, %54, %49, %44, %39, %34, %29, %24, %19, %14, %9
  %_msphi_s = phi i64 [ 0, %9 ], [ 0, %14 ], [ 0, %19 ], [ 0, %24 ], [ 0, %29 ], [ 0, %34 ], [ 0, %39 ], [ 0, %44 ], [ 0, %49 ], [ 0, %54 ], [ 0, %59 ], [ 0, %64 ], [ 0, %69 ], [ %_msprop_select, %if.else36 ], !dbg !297
  %_msphi_o = phi i32 [ 0, %9 ], [ 0, %14 ], [ 0, %19 ], [ 0, %24 ], [ 0, %29 ], [ 0, %34 ], [ 0, %39 ], [ 0, %44 ], [ 0, %49 ], [ 0, %54 ], [ 0, %59 ], [ 0, %64 ], [ 0, %69 ], [ %73, %if.else36 ], !dbg !297
  %retval.0 = phi i64 [ 0, %9 ], [ 1, %14 ], [ 2, %19 ], [ 3, %24 ], [ 4, %29 ], [ 5, %34 ], [ 6, %39 ], [ 7, %44 ], [ 8, %49 ], [ 9, %54 ], [ 10, %59 ], [ 11, %64 ], [ 12, %69 ], [ %., %if.else36 ], !dbg !297
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !299
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !299
  ret i64 %retval.0, !dbg !299
}

declare dso_local i8* @mem_heap_lo() local_unnamed_addr #2

declare dso_local i8* @mem_heap_hi() local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local zeroext i1 @mm_init() local_unnamed_addr #0 !dbg !300 {
for.end:
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !307
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !307
  %call = call i8* @mem_sbrk(i64 16) #5, !dbg !307
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !308
  %0 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !308
  call void @llvm.dbg.value(metadata i64* %7, metadata !304, metadata !DIExpression()), !dbg !308
  call void @llvm.dbg.value(metadata i64 0, metadata !305, metadata !DIExpression()), !dbg !309
  %1 = call i8* @__msan_memset(i8* bitcast ([15 x %struct.block*]* @list_heads to i8*), i32 0, i64 120) #5, !dbg !310
  %2 = ptrtoint i8* %call to i64, !dbg !313
  %.demorgan = or i64 %_msret, %2, !dbg !313
  %3 = icmp eq i64 %.demorgan, -1, !dbg !313
  %4 = icmp ne i64 %_msret, 0, !dbg !313
  %_msprop_icmp = and i1 %4, %3, !dbg !313
  br i1 %_msprop_icmp, label %5, label %6, !dbg !315, !prof !98

; <label>:5:                                      ; preds = %for.end
  store i32 %0, i32* @__msan_origin_tls, align 4, !dbg !315
  call void @__msan_warning_noreturn() #5, !dbg !315
  call void asm sideeffect "", ""() #5, !dbg !315
  unreachable, !dbg !315

; <label>:6:                                      ; preds = %for.end
  %cmp1 = icmp eq i8* %call, inttoptr (i64 -1 to i8*), !dbg !313
  br i1 %cmp1, label %return, label %if.end, !dbg !315

if.end:                                           ; preds = %6
  %7 = bitcast i8* %call to i64*, !dbg !316
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !317
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !317
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !317
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !317
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !317
  %call2 = call fastcc i64 @pack(i64 0, i1 zeroext true, i1 zeroext false, i1 zeroext false), !dbg !317
  %_msret17 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !318
  %8 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !318
  br i1 %4, label %9, label %10, !dbg !318, !prof !98

; <label>:9:                                      ; preds = %if.end
  store i32 %0, i32* @__msan_origin_tls, align 4, !dbg !318
  call void @__msan_warning_noreturn() #5, !dbg !318
  call void asm sideeffect "", ""() #5, !dbg !318
  unreachable, !dbg !318

; <label>:10:                                     ; preds = %if.end
  %11 = ptrtoint i8* %call to i64, !dbg !318
  %12 = xor i64 %11, 87960930222080, !dbg !318
  %13 = inttoptr i64 %12 to i64*, !dbg !318
  store i64 %_msret17, i64* %13, align 8, !dbg !318
  %_mscmp23 = icmp eq i64 %_msret17, 0, !dbg !318
  br i1 %_mscmp23, label %21, label %14, !dbg !318, !prof !93

; <label>:14:                                     ; preds = %10
  %15 = add i64 %12, 17592186044416, !dbg !318
  %16 = call i32 @__msan_chain_origin(i32 %8) #5, !dbg !318
  %17 = zext i32 %16 to i64, !dbg !318
  %18 = shl nuw i64 %17, 32, !dbg !318
  %19 = or i64 %18, %17, !dbg !318
  %20 = inttoptr i64 %15 to i64*, !dbg !318
  store i64 %19, i64* %20, align 8, !dbg !318
  br label %21, !dbg !318

; <label>:21:                                     ; preds = %10, %14
  store i64 %call2, i64* %7, align 8, !dbg !318, !tbaa !94
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !319
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !319
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !319
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !319
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !319
  %call4 = call fastcc i64 @pack(i64 0, i1 zeroext true, i1 zeroext true, i1 zeroext false), !dbg !319
  %_msret18 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !320
  %22 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !320
  %arrayidx5 = getelementptr inbounds i8, i8* %call, i64 8, !dbg !320
  %23 = bitcast i8* %arrayidx5 to i64*, !dbg !320
  br i1 false, label %24, label %25, !dbg !321, !prof !98

; <label>:24:                                     ; preds = %21
  unreachable, !dbg !321

; <label>:25:                                     ; preds = %21
  %26 = ptrtoint i8* %arrayidx5 to i64, !dbg !321
  %27 = xor i64 %26, 87960930222080, !dbg !321
  %28 = inttoptr i64 %27 to i64*, !dbg !321
  store i64 %_msret18, i64* %28, align 8, !dbg !321
  %_mscmp24 = icmp eq i64 %_msret18, 0, !dbg !321
  br i1 %_mscmp24, label %36, label %29, !dbg !321, !prof !93

; <label>:29:                                     ; preds = %25
  %30 = add i64 %27, 17592186044416, !dbg !321
  %31 = call i32 @__msan_chain_origin(i32 %22) #5, !dbg !321
  %32 = zext i32 %31 to i64, !dbg !321
  %33 = shl nuw i64 %32, 32, !dbg !321
  %34 = or i64 %33, %32, !dbg !321
  %35 = inttoptr i64 %30 to i64*, !dbg !321
  store i64 %34, i64* %35, align 8, !dbg !321
  br label %36, !dbg !321

; <label>:36:                                     ; preds = %25, %29
  store i64 %call4, i64* %23, align 8, !dbg !321, !tbaa !94
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080) to i64*), align 8, !dbg !322
  br i1 false, label %37, label %38, !dbg !322, !prof !98

; <label>:37:                                     ; preds = %36
  br label %38, !dbg !322

; <label>:38:                                     ; preds = %36, %37
  store i8* %arrayidx5, i8** bitcast (%struct.block** @heap_start to i8**), align 8, !dbg !322, !tbaa !85
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !323
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !323
  %call7 = call fastcc %struct.block* @extend_heap(i64 4096), !dbg !323
  %_msret19 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !325
  %39 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !325
  %40 = ptrtoint %struct.block* %call7 to i64, !dbg !325
  %41 = xor i64 %_msret19, -1, !dbg !325
  %42 = and i64 %41, %40, !dbg !325
  %43 = icmp eq i64 %42, 0, !dbg !325
  %44 = icmp ne i64 %_msret19, 0, !dbg !325
  %_msprop_icmp20 = and i1 %44, %43, !dbg !325
  %cmp8 = icmp ne %struct.block* %call7, null, !dbg !325
  br label %return, !dbg !326

return:                                           ; preds = %38, %6
  %_msphi_s = phi i1 [ false, %6 ], [ %_msprop_icmp20, %38 ], !dbg !328
  %_msphi_o = phi i32 [ 0, %6 ], [ %39, %38 ], !dbg !328
  %retval.0 = phi i1 [ false, %6 ], [ %cmp8, %38 ], !dbg !328
  store i1 %_msphi_s, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !329
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !329
  ret i1 %retval.0, !dbg !329
}

declare dso_local i8* @mem_sbrk(i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @pack(i64 %size, i1 zeroext %alloc, i1 zeroext %prev_alloc, i1 zeroext %min_status) unnamed_addr #0 !dbg !330 {
entry:
  %0 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !339
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !339
  %2 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !339
  %3 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !339
  %4 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !339
  %5 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !339
  %6 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !339
  %7 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !339
  call void @llvm.dbg.value(metadata i64 %size, metadata !334, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.value(metadata i1 %alloc, metadata !335, metadata !DIExpression()), !dbg !340
  call void @llvm.dbg.value(metadata i1 %prev_alloc, metadata !336, metadata !DIExpression()), !dbg !341
  call void @llvm.dbg.value(metadata i1 %min_status, metadata !337, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.value(metadata i64 %size, metadata !338, metadata !DIExpression()), !dbg !343
  %_msprop = zext i1 %6 to i64, !dbg !344
  %or = zext i1 %alloc to i64, !dbg !344
  %8 = xor i64 %or, -1, !dbg !344
  %9 = xor i64 %size, -1, !dbg !344
  %10 = and i64 %4, %_msprop, !dbg !344
  %11 = and i64 %4, %8, !dbg !344
  %12 = and i64 %_msprop, %9, !dbg !344
  %13 = or i64 %12, %11, !dbg !344
  %14 = or i64 %13, %10, !dbg !344
  %15 = icmp eq i64 %4, 0, !dbg !344
  %16 = select i1 %15, i32 %7, i32 %5, !dbg !344
  %spec.select = or i64 %or, %size, !dbg !344
  call void @llvm.dbg.value(metadata i64 %spec.select, metadata !338, metadata !DIExpression()), !dbg !343
  %17 = and i64 %14, -3, !dbg !345
  %or5 = or i64 %spec.select, 2, !dbg !345
  call void @llvm.dbg.value(metadata i64 %or5, metadata !338, metadata !DIExpression()), !dbg !343
  %18 = select i1 %prev_alloc, i64 %17, i64 %14, !dbg !348
  %19 = xor i64 %or5, %spec.select, !dbg !348
  %20 = or i64 %14, %19, !dbg !348
  %_msprop_select = select i1 %2, i64 %20, i64 %18, !dbg !348
  %21 = select i1 %2, i32 %3, i32 %16, !dbg !348
  %word.1 = select i1 %prev_alloc, i64 %or5, i64 %spec.select, !dbg !348
  call void @llvm.dbg.value(metadata i64 %word.1, metadata !338, metadata !DIExpression()), !dbg !343
  %22 = and i64 %_msprop_select, -5, !dbg !349
  %or9 = or i64 %word.1, 4, !dbg !349
  %23 = select i1 %min_status, i64 %22, i64 %_msprop_select, !dbg !352
  %24 = xor i64 %or9, %word.1, !dbg !352
  %25 = or i64 %_msprop_select, %24, !dbg !352
  %_msprop_select15 = select i1 %0, i64 %25, i64 %23, !dbg !352
  %26 = select i1 %0, i32 %1, i32 %21, !dbg !352
  %spec.select14 = select i1 %min_status, i64 %or9, i64 %word.1, !dbg !352
  call void @llvm.dbg.value(metadata i64 %spec.select14, metadata !338, metadata !DIExpression()), !dbg !343
  store i64 %_msprop_select15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !353
  store i32 %26, i32* @__msan_retval_origin_tls, align 4, !dbg !353
  ret i64 %spec.select14, !dbg !353
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @extend_heap(i64 %size) unnamed_addr #0 !dbg !354 {
entry:
  call void @llvm.dbg.value(metadata i64 %size, metadata !358, metadata !DIExpression()), !dbg !362
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !363
  %call = call fastcc i64 @round_up(i64 %size), !dbg !363
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !362
  %0 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !362
  call void @llvm.dbg.value(metadata i64 %call, metadata !358, metadata !DIExpression()), !dbg !362
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !364
  store i32 %0, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !364
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !364
  %call1 = call i8* @mem_sbrk(i64 %call) #5, !dbg !364
  %_msret14 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !366
  %1 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !366
  call void @llvm.dbg.value(metadata i8* %call1, metadata !359, metadata !DIExpression()), !dbg !366
  %2 = ptrtoint i8* %call1 to i64, !dbg !367
  %.demorgan = or i64 %_msret14, %2, !dbg !367
  %3 = icmp eq i64 %.demorgan, -1, !dbg !367
  %4 = icmp ne i64 %_msret14, 0, !dbg !367
  %_msprop_icmp = and i1 %4, %3, !dbg !367
  br i1 %_msprop_icmp, label %5, label %6, !dbg !368, !prof !98

; <label>:5:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !368
  call void @__msan_warning_noreturn() #5, !dbg !368
  call void asm sideeffect "", ""() #5, !dbg !368
  unreachable, !dbg !368

; <label>:6:                                      ; preds = %entry
  %cmp = icmp eq i8* %call1, inttoptr (i64 -1 to i8*), !dbg !367
  br i1 %cmp, label %return, label %if.end, !dbg !368

if.end:                                           ; preds = %6
  store i64 %_msret14, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !369
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !369
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !369
  %call2 = call fastcc %struct.block* @payload_to_header(i8* %call1), !dbg !369
  %_msret15 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !370
  %7 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* %call2, metadata !360, metadata !DIExpression()), !dbg !370
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !371
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !371
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !371
  %call3 = call fastcc zeroext i1 @get_alloc_prev(%struct.block* nonnull %call2), !dbg !371
  %_msret16 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !372
  %8 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !372
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !372
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !372
  store i64 %_msret, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !372
  store i32 %0, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !372
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !372
  store i1 %_msret16, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !372
  store i32 %8, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !372
  call fastcc void @write_block(%struct.block* nonnull %call2, i64 %call, i1 zeroext false, i1 zeroext %call3), !dbg !372
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !373
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !373
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !373
  %call4 = call fastcc %struct.block* @find_next(%struct.block* nonnull %call2), !dbg !373
  %_msret17 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !374
  %9 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !374
  call void @llvm.dbg.value(metadata %struct.block* %call4, metadata !361, metadata !DIExpression()), !dbg !374
  store i64 %_msret17, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !375
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !375
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !375
  call fastcc void @write_epilogue(%struct.block* %call4, i1 zeroext false), !dbg !375
  store i64 %_msret15, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !376
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !376
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !376
  %call5 = call fastcc %struct.block* @coalesce_block(%struct.block* nonnull %call2), !dbg !376
  %_msret18 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !370
  %10 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !370
  call void @llvm.dbg.value(metadata %struct.block* %call5, metadata !360, metadata !DIExpression()), !dbg !370
  store i64 %_msret18, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !377
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !377
  call fastcc void @block_insertion(%struct.block* %call5), !dbg !377
  br label %return, !dbg !378

return:                                           ; preds = %6, %if.end
  %_msphi_s = phi i64 [ %_msret18, %if.end ], [ 0, %6 ], !dbg !379
  %_msphi_o = phi i32 [ %10, %if.end ], [ 0, %6 ], !dbg !379
  %retval.0 = phi %struct.block* [ %call5, %if.end ], [ null, %6 ], !dbg !379
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !380
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !380
  ret %struct.block* %retval.0, !dbg !380
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local i8* @mm_malloc(i64 %size) local_unnamed_addr #0 !dbg !381 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !392
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !392
  call void @llvm.dbg.value(metadata i64 %size, metadata !385, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i8* null, metadata !389, metadata !DIExpression()), !dbg !393
  %2 = load %struct.block*, %struct.block** @heap_start, align 8, !dbg !394, !tbaa !85
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080) to i64*), align 8, !dbg !396
  %3 = ptrtoint %struct.block* %2 to i64, !dbg !396
  %4 = xor i64 %_msld, -1, !dbg !396
  %5 = and i64 %4, %3, !dbg !396
  %6 = icmp eq i64 %5, 0, !dbg !396
  %7 = icmp ne i64 %_msld, 0, !dbg !396
  %_msprop_icmp = and i1 %7, %6, !dbg !396
  br i1 %_msprop_icmp, label %8, label %10, !dbg !397, !prof !98

; <label>:8:                                      ; preds = %entry
  %9 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint (%struct.block** @heap_start to i64), i64 87960930222080), i64 17592186044416) to i32*), align 8, !dbg !396
  store i32 %9, i32* @__msan_origin_tls, align 4, !dbg !397
  call void @__msan_warning_noreturn() #5, !dbg !397
  call void asm sideeffect "", ""() #5, !dbg !397
  unreachable, !dbg !397

; <label>:10:                                     ; preds = %entry
  %cmp = icmp eq %struct.block* %2, null, !dbg !396
  br i1 %cmp, label %if.then, label %if.end, !dbg !397

if.then:                                          ; preds = %10
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !398
  %call = call zeroext i1 @mm_init(), !dbg !398
  br label %if.end, !dbg !400

if.end:                                           ; preds = %if.then, %10
  %11 = xor i64 %0, -1, !dbg !401
  %12 = and i64 %11, %size, !dbg !401
  %13 = icmp eq i64 %12, 0, !dbg !401
  %14 = icmp ne i64 %0, 0, !dbg !401
  %_msprop_icmp40 = and i1 %14, %13, !dbg !401
  br i1 %_msprop_icmp40, label %15, label %16, !dbg !403, !prof !98

; <label>:15:                                     ; preds = %if.end
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !403
  call void @__msan_warning_noreturn() #5, !dbg !403
  call void asm sideeffect "", ""() #5, !dbg !403
  unreachable, !dbg !403

; <label>:16:                                     ; preds = %if.end
  %cmp1 = icmp eq i64 %size, 0, !dbg !401
  br i1 %cmp1, label %return, label %if.end3, !dbg !403

if.end3:                                          ; preds = %16
  %add = add i64 %size, 8, !dbg !404
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !405
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !405
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !405
  %call4 = call fastcc i64 @round_up(i64 %add), !dbg !405
  %_msret41 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !406
  %17 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !406
  store i64 %_msret41, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !406
  store i32 %17, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !406
  store i64 0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !406
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !406
  %call5 = call fastcc i64 @max(i64 %call4, i64 16), !dbg !406
  %_msret42 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !407
  %18 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !407
  call void @llvm.dbg.value(metadata i64 %call5, metadata !386, metadata !DIExpression()), !dbg !407
  store i64 %_msret42, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !408
  store i32 %18, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !408
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !408
  %call6 = call fastcc %struct.block* @find_fit(i64 %call5), !dbg !408
  %_msret43 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !409
  %19 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !409
  call void @llvm.dbg.value(metadata %struct.block* %call6, metadata !388, metadata !DIExpression()), !dbg !409
  %20 = ptrtoint %struct.block* %call6 to i64, !dbg !410
  %21 = xor i64 %_msret43, -1, !dbg !410
  %22 = and i64 %21, %20, !dbg !410
  %23 = icmp eq i64 %22, 0, !dbg !410
  %24 = icmp ne i64 %_msret43, 0, !dbg !410
  %_msprop_icmp44 = and i1 %24, %23, !dbg !410
  br i1 %_msprop_icmp44, label %25, label %26, !dbg !412, !prof !98

; <label>:25:                                     ; preds = %if.end3
  store i32 %19, i32* @__msan_origin_tls, align 4, !dbg !412
  call void @__msan_warning_noreturn() #5, !dbg !412
  call void asm sideeffect "", ""() #5, !dbg !412
  unreachable, !dbg !412

; <label>:26:                                     ; preds = %if.end3
  %cmp7 = icmp eq %struct.block* %call6, null, !dbg !410
  br i1 %cmp7, label %if.then8, label %if.end14, !dbg !412

if.then8:                                         ; preds = %26
  store i64 %_msret42, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !413
  store i32 %18, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !413
  store i64 0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !413
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !413
  %call9 = call fastcc i64 @max(i64 %call5, i64 4096), !dbg !413
  %_msret45 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !415
  %27 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !415
  call void @llvm.dbg.value(metadata i64 %call9, metadata !387, metadata !DIExpression()), !dbg !415
  store i64 %_msret45, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !416
  store i32 %27, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !416
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !416
  %call10 = call fastcc %struct.block* @extend_heap(i64 %call9), !dbg !416
  %_msret46 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !409
  %28 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !409
  call void @llvm.dbg.value(metadata %struct.block* %call10, metadata !388, metadata !DIExpression()), !dbg !409
  %29 = ptrtoint %struct.block* %call10 to i64, !dbg !417
  %30 = xor i64 %_msret46, -1, !dbg !417
  %31 = and i64 %30, %29, !dbg !417
  %32 = icmp eq i64 %31, 0, !dbg !417
  %33 = icmp ne i64 %_msret46, 0, !dbg !417
  %_msprop_icmp47 = and i1 %33, %32, !dbg !417
  br i1 %_msprop_icmp47, label %34, label %35, !dbg !419, !prof !98

; <label>:34:                                     ; preds = %if.then8
  store i32 %28, i32* @__msan_origin_tls, align 4, !dbg !419
  call void @__msan_warning_noreturn() #5, !dbg !419
  call void asm sideeffect "", ""() #5, !dbg !419
  unreachable, !dbg !419

; <label>:35:                                     ; preds = %if.then8
  %cmp11 = icmp eq %struct.block* %call10, null, !dbg !417
  br i1 %cmp11, label %return, label %if.end14, !dbg !419

if.end14:                                         ; preds = %35, %26
  %_msphi_s48 = phi i64 [ %_msret46, %35 ], [ %_msret43, %26 ], !dbg !420
  %_msphi_o49 = phi i32 [ %28, %35 ], [ %19, %26 ], !dbg !420
  %block.0 = phi %struct.block* [ %call10, %35 ], [ %call6, %26 ], !dbg !420
  call void @llvm.dbg.value(metadata %struct.block* %block.0, metadata !388, metadata !DIExpression()), !dbg !409
  store i64 %_msphi_s48, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !421
  store i32 %_msphi_o49, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !421
  call fastcc void @block_removal(%struct.block* nonnull %block.0), !dbg !421
  store i64 %_msphi_s48, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !422
  store i32 %_msphi_o49, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !422
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !422
  %call16 = call fastcc i64 @get_size(%struct.block* nonnull %block.0), !dbg !422
  %_msret50 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !423
  %36 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !423
  call void @llvm.dbg.value(metadata i64 %call16, metadata !390, metadata !DIExpression()), !dbg !423
  store i64 %_msphi_s48, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !424
  store i32 %_msphi_o49, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !424
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !424
  %call17 = call fastcc zeroext i1 @get_alloc_prev(%struct.block* nonnull %block.0), !dbg !424
  %_msret51 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !425
  %37 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !425
  store i64 %_msphi_s48, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !425
  store i32 %_msphi_o49, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !425
  store i64 %_msret50, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !425
  store i32 %36, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !425
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !425
  store i1 %_msret51, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !425
  store i32 %37, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !425
  call fastcc void @write_block(%struct.block* nonnull %block.0, i64 %call16, i1 zeroext true, i1 zeroext %call17), !dbg !425
  store i64 %_msphi_s48, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !426
  store i32 %_msphi_o49, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !426
  store i64 %_msret42, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !426
  store i32 %18, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !426
  call fastcc void @split_block(%struct.block* nonnull %block.0, i64 %call5), !dbg !426
  store i64 %_msphi_s48, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !427
  store i32 %_msphi_o49, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !427
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !427
  %call18 = call fastcc i8* @header_to_payload(%struct.block* nonnull %block.0), !dbg !427
  %_msret52 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !393
  %38 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !393
  call void @llvm.dbg.value(metadata i8* %call18, metadata !389, metadata !DIExpression()), !dbg !393
  store i64 %_msphi_s48, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !428
  store i32 %_msphi_o49, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !428
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !428
  %call19 = call fastcc %struct.block* @find_next(%struct.block* nonnull %block.0), !dbg !428
  %_msret53 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !429
  %39 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !429
  call void @llvm.dbg.value(metadata %struct.block* %call19, metadata !391, metadata !DIExpression()), !dbg !429
  store i64 %_msret53, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !430
  store i32 %39, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !430
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !430
  %call20 = call fastcc zeroext i1 @get_alloc(%struct.block* %call19), !dbg !430
  %_msret54 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !432
  br i1 %_msret54, label %40, label %42, !dbg !432, !prof !98

; <label>:40:                                     ; preds = %if.end14
  %41 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !432
  store i32 %41, i32* @__msan_origin_tls, align 4, !dbg !432
  call void @__msan_warning_noreturn() #5, !dbg !432
  call void asm sideeffect "", ""() #5, !dbg !432
  unreachable, !dbg !432

; <label>:42:                                     ; preds = %if.end14
  br i1 %call20, label %land.lhs.true, label %return, !dbg !432

land.lhs.true:                                    ; preds = %42
  store i64 %_msret53, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !433
  store i32 %39, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !433
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !433
  %call21 = call fastcc i64 @get_size(%struct.block* %call19), !dbg !433
  %_msret55 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !434
  %43 = xor i64 %_msret55, -1, !dbg !434
  %44 = and i64 %call21, %43, !dbg !434
  %45 = icmp eq i64 %44, 0, !dbg !434
  %46 = icmp ne i64 %_msret55, 0, !dbg !434
  %_msprop_icmp56 = and i1 %46, %45, !dbg !434
  br i1 %_msprop_icmp56, label %47, label %49, !dbg !435, !prof !98

; <label>:47:                                     ; preds = %land.lhs.true
  %48 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !434
  store i32 %48, i32* @__msan_origin_tls, align 4, !dbg !435
  call void @__msan_warning_noreturn() #5, !dbg !435
  call void asm sideeffect "", ""() #5, !dbg !435
  unreachable, !dbg !435

; <label>:49:                                     ; preds = %land.lhs.true
  %cmp22 = icmp eq i64 %call21, 0, !dbg !434
  br i1 %cmp22, label %if.then23, label %return, !dbg !435

if.then23:                                        ; preds = %49
  store i64 %_msret53, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !436
  store i32 %39, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !436
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !436
  call fastcc void @write_epilogue(%struct.block* %call19, i1 zeroext true), !dbg !436
  br label %return, !dbg !438

return:                                           ; preds = %42, %49, %if.then23, %35, %16
  %_msphi_s = phi i64 [ 0, %16 ], [ 0, %35 ], [ %_msret52, %if.then23 ], [ %_msret52, %49 ], [ %_msret52, %42 ], !dbg !420
  %_msphi_o = phi i32 [ 0, %16 ], [ 0, %35 ], [ %38, %if.then23 ], [ %38, %49 ], [ %38, %42 ], !dbg !420
  %retval.0 = phi i8* [ null, %16 ], [ null, %35 ], [ %call18, %if.then23 ], [ %call18, %49 ], [ %call18, %42 ], !dbg !420
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !439
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !439
  ret i8* %retval.0, !dbg !439
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @max(i64 %x, i64 %y) unnamed_addr #0 !dbg !440 {
entry:
  %0 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !446
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !446
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !446
  %3 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !446
  call void @llvm.dbg.value(metadata i64 %x, metadata !444, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.value(metadata i64 %y, metadata !445, metadata !DIExpression()), !dbg !447
  %_msprop = or i64 %2, %0, !dbg !448
  %4 = icmp eq i64 %0, 0, !dbg !448
  %5 = select i1 %4, i32 %3, i32 %1, !dbg !448
  %6 = icmp ne i64 %_msprop, 0, !dbg !448
  %cmp = icmp ugt i64 %x, %y, !dbg !448
  %7 = select i1 %cmp, i64 %2, i64 %0, !dbg !449
  %8 = xor i64 %y, %x, !dbg !449
  %9 = or i64 %_msprop, %8, !dbg !449
  %_msprop_select = select i1 %6, i64 %9, i64 %7, !dbg !449
  %10 = select i1 %cmp, i32 %3, i32 %1, !dbg !449
  %11 = select i1 %6, i32 %5, i32 %10, !dbg !449
  %cond = select i1 %cmp, i64 %x, i64 %y, !dbg !449
  store i64 %_msprop_select, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !450
  store i32 %11, i32* @__msan_retval_origin_tls, align 4, !dbg !450
  ret i64 %cond, !dbg !450
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @round_up(i64 %size) unnamed_addr #0 !dbg !451 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !455
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !455
  call void @llvm.dbg.value(metadata i64 %size, metadata !453, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.value(metadata i64 16, metadata !454, metadata !DIExpression()), !dbg !456
  %add = add i64 %size, 15, !dbg !457
  %2 = and i64 %0, -16, !dbg !458
  %div = and i64 %add, -16, !dbg !458
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !459
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !459
  ret i64 %div, !dbg !459
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @find_fit(i64 %asize) unnamed_addr #0 !dbg !460 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !471
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !471
  call void @llvm.dbg.value(metadata i64 %asize, metadata !462, metadata !DIExpression()), !dbg !471
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !472
  %call = call fastcc i64 @find_size_list(i64 %asize), !dbg !472
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !473
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !473
  call void @llvm.dbg.value(metadata i64 %call, metadata !463, metadata !DIExpression()), !dbg !473
  call void @llvm.dbg.value(metadata i64 0, metadata !464, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata i64 100, metadata !466, metadata !DIExpression()), !dbg !476
  call void @llvm.dbg.value(metadata i64 0, metadata !467, metadata !DIExpression()), !dbg !477
  %3 = xor i64 %_msret, -1, !dbg !478
  %4 = and i64 %call, %3, !dbg !478
  %5 = icmp ult i64 %4, 15, !dbg !478
  %6 = or i64 %_msret, %call, !dbg !478
  %7 = icmp ult i64 %6, 15, !dbg !478
  %8 = xor i1 %5, %7, !dbg !478
  br i1 %8, label %9, label %10, !dbg !479, !prof !98

; <label>:9:                                      ; preds = %entry
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !479
  call void @__msan_warning_noreturn() #5, !dbg !479
  call void asm sideeffect "", ""() #5, !dbg !479
  unreachable, !dbg !479

; <label>:10:                                     ; preds = %entry
  %cmp28 = icmp ult i64 %call, 15, !dbg !478
  br i1 %cmp28, label %while.body.preheader, label %return, !dbg !479

while.body.preheader:                             ; preds = %10
  %11 = icmp eq i64 %_msret, 0
  br label %while.body, !dbg !480

while.cond:                                       ; preds = %32, %77
  %inc1034 = add nuw nsw i64 %index.029, 1, !dbg !481
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata i64 0, metadata !464, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.value(metadata i64 %index.029, metadata !463, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !473
  %12 = and i64 %inc1034, %3, !dbg !478
  %13 = icmp ult i64 %12, 15, !dbg !478
  %14 = icmp ult i64 %inc1034, 15, !dbg !478
  %15 = xor i1 %13, %14, !dbg !478
  br i1 %15, label %16, label %17, !dbg !479, !prof !98

; <label>:16:                                     ; preds = %while.cond
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !479
  call void @__msan_warning_noreturn() #5, !dbg !479
  call void asm sideeffect "", ""() #5, !dbg !479
  unreachable, !dbg !479

; <label>:17:                                     ; preds = %while.cond
  br i1 %14, label %while.body, label %return.loopexit, !dbg !479, !llvm.loop !482

while.body:                                       ; preds = %while.body.preheader, %17
  %index.029 = phi i64 [ %inc1034, %17 ], [ %call, %while.body.preheader ]
  call void @llvm.dbg.value(metadata i64 %index.029, metadata !463, metadata !DIExpression()), !dbg !473
  %arrayidx = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %index.029, !dbg !480
  call void @llvm.dbg.value(metadata %struct.block** %arrayidx, metadata !468, metadata !DIExpression(DW_OP_deref)), !dbg !484
  br i1 %11, label %19, label %18, !dbg !485, !prof !93

; <label>:18:                                     ; preds = %while.body
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !485
  call void @__msan_warning_noreturn() #5, !dbg !485
  call void asm sideeffect "", ""() #5, !dbg !485
  unreachable, !dbg !485

; <label>:19:                                     ; preds = %while.body
  %curr.023 = load %struct.block*, %struct.block** %arrayidx, align 8, !dbg !485, !tbaa !166
  %20 = ptrtoint %struct.block** %arrayidx to i64, !dbg !484
  %21 = xor i64 %20, 87960930222080, !dbg !484
  %22 = inttoptr i64 %21 to i64*, !dbg !484
  %23 = add i64 %21, 17592186044416, !dbg !484
  %24 = inttoptr i64 %23 to i32*, !dbg !484
  %_msld = load i64, i64* %22, align 8, !dbg !484
  %25 = load i32, i32* %24, align 8, !dbg !484
  call void @llvm.dbg.value(metadata %struct.block* %curr.023, metadata !468, metadata !DIExpression()), !dbg !484
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata i64 0, metadata !464, metadata !DIExpression()), !dbg !474
  %26 = ptrtoint %struct.block* %curr.023 to i64, !dbg !487
  %27 = xor i64 %_msld, -1, !dbg !487
  %28 = and i64 %27, %26, !dbg !487
  %29 = icmp eq i64 %28, 0, !dbg !487
  %30 = icmp ne i64 %_msld, 0, !dbg !487
  %_msprop_icmp = and i1 %30, %29, !dbg !487
  br i1 %_msprop_icmp, label %31, label %32, !dbg !488, !prof !98

; <label>:31:                                     ; preds = %19
  store i32 %25, i32* @__msan_origin_tls, align 4, !dbg !488
  call void @__msan_warning_noreturn() #5, !dbg !488
  call void asm sideeffect "", ""() #5, !dbg !488
  unreachable, !dbg !488

; <label>:32:                                     ; preds = %19
  %cmp124 = icmp eq %struct.block* %curr.023, null, !dbg !487
  br i1 %cmp124, label %while.cond, label %for.body.preheader, !dbg !488

for.body.preheader:                               ; preds = %32
  br label %for.body, !dbg !489

for.body:                                         ; preds = %for.body.preheader, %69
  %_msphi_s37 = phi i64 [ %_msld47, %69 ], [ %_msld, %for.body.preheader ]
  %_msphi_o38 = phi i32 [ %60, %69 ], [ %25, %for.body.preheader ]
  %curr.027 = phi %struct.block* [ %curr.0, %69 ], [ %curr.023, %for.body.preheader ]
  %_msphi_s39 = phi i64 [ %_msphi_s45, %69 ], [ 0, %for.body.preheader ]
  %_msphi_o40 = phi i32 [ %_msphi_o46, %69 ], [ 0, %for.body.preheader ]
  %best.126 = phi %struct.block* [ %best.2, %69 ], [ null, %for.body.preheader ]
  %count.125 = phi i64 [ %inc, %69 ], [ 0, %for.body.preheader ]
  call void @llvm.dbg.value(metadata %struct.block* %best.126, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata i64 %count.125, metadata !464, metadata !DIExpression()), !dbg !474
  %inc = add nuw nsw i64 %count.125, 1, !dbg !489
  store i64 %_msphi_s37, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !491
  store i32 %_msphi_o38, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !491
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !491
  %call3 = call fastcc i64 @get_size(%struct.block* nonnull %curr.027), !dbg !491
  %_msret43 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !492
  %_msprop44 = or i64 %_msret43, %0, !dbg !492
  %33 = icmp eq i64 %_msprop44, 0, !dbg !492
  br i1 %33, label %38, label %34, !dbg !494, !prof !93

; <label>:34:                                     ; preds = %for.body
  %35 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !492
  %36 = icmp eq i64 %0, 0, !dbg !492
  %37 = select i1 %36, i32 %35, i32 %1, !dbg !492
  store i32 %37, i32* @__msan_origin_tls, align 4, !dbg !494
  call void @__msan_warning_noreturn() #5, !dbg !494
  call void asm sideeffect "", ""() #5, !dbg !494
  unreachable, !dbg !494

; <label>:38:                                     ; preds = %for.body
  %cmp5 = icmp ult i64 %call3, %asize, !dbg !492
  br i1 %cmp5, label %for.inc, label %land.lhs.true, !dbg !494

land.lhs.true:                                    ; preds = %38
  %39 = ptrtoint %struct.block* %best.126 to i64, !dbg !495
  %40 = xor i64 %_msphi_s39, -1, !dbg !495
  %41 = and i64 %39, %40, !dbg !495
  %42 = icmp eq i64 %41, 0, !dbg !495
  %43 = icmp ne i64 %_msphi_s39, 0, !dbg !495
  %_msprop_icmp50 = and i1 %43, %42, !dbg !495
  %cmp6 = icmp eq %struct.block* %best.126, null, !dbg !495
  %tobool = icmp ne i64 %call3, %asize, !dbg !496
  %44 = xor i1 %tobool, true, !dbg !497
  %45 = and i1 %_msprop_icmp50, %44, !dbg !497
  %or.cond = or i1 %cmp6, %tobool, !dbg !497
  %46 = select i1 %or.cond, i64 %_msphi_s37, i64 %_msphi_s39, !dbg !497
  %47 = ptrtoint %struct.block* %curr.027 to i64, !dbg !497
  %48 = or i64 %_msphi_s39, %_msphi_s37, !dbg !497
  %49 = xor i64 %39, %47, !dbg !497
  %50 = or i64 %48, %49, !dbg !497
  %_msprop_select = select i1 %45, i64 %50, i64 %46, !dbg !497
  %51 = select i1 %or.cond, i32 %_msphi_o38, i32 %_msphi_o40, !dbg !497
  %52 = select i1 %45, i32 %_msphi_o40, i32 %51, !dbg !497
  %spec.select = select i1 %or.cond, %struct.block* %curr.027, %struct.block* %best.126, !dbg !497
  br label %for.inc, !dbg !497

for.inc:                                          ; preds = %land.lhs.true, %38
  %_msphi_s45 = phi i64 [ %_msphi_s39, %38 ], [ %_msprop_select, %land.lhs.true ], !dbg !498
  %_msphi_o46 = phi i32 [ %_msphi_o40, %38 ], [ %52, %land.lhs.true ], !dbg !498
  %best.2 = phi %struct.block* [ %best.126, %38 ], [ %spec.select, %land.lhs.true ], !dbg !498
  %next = getelementptr inbounds %struct.block, %struct.block* %curr.027, i64 0, i32 1, i32 0, i32 0, !dbg !499
  call void @llvm.dbg.value(metadata %struct.block** %next, metadata !468, metadata !DIExpression(DW_OP_deref)), !dbg !484
  %_mscmp56 = icmp eq i64 %_msphi_s37, 0, !dbg !485
  br i1 %_mscmp56, label %54, label %53, !dbg !485, !prof !93

; <label>:53:                                     ; preds = %for.inc
  store i32 %_msphi_o38, i32* @__msan_origin_tls, align 4, !dbg !485
  call void @__msan_warning_noreturn() #5, !dbg !485
  call void asm sideeffect "", ""() #5, !dbg !485
  unreachable, !dbg !485

; <label>:54:                                     ; preds = %for.inc
  %curr.0 = load %struct.block*, %struct.block** %next, align 8, !dbg !485, !tbaa !166
  %55 = ptrtoint %struct.block** %next to i64, !dbg !484
  %56 = xor i64 %55, 87960930222080, !dbg !484
  %57 = inttoptr i64 %56 to i64*, !dbg !484
  %58 = add i64 %56, 17592186044416, !dbg !484
  %59 = inttoptr i64 %58 to i32*, !dbg !484
  %_msld47 = load i64, i64* %57, align 8, !dbg !484
  %60 = load i32, i32* %59, align 8, !dbg !484
  call void @llvm.dbg.value(metadata %struct.block* %curr.0, metadata !468, metadata !DIExpression()), !dbg !484
  call void @llvm.dbg.value(metadata %struct.block* %best.2, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata i64 %inc, metadata !464, metadata !DIExpression()), !dbg !474
  %61 = ptrtoint %struct.block* %curr.0 to i64, !dbg !487
  %62 = xor i64 %_msld47, -1, !dbg !487
  %63 = and i64 %62, %61, !dbg !487
  %64 = icmp eq i64 %63, 0, !dbg !487
  %65 = icmp ne i64 %_msld47, 0, !dbg !487
  %_msprop_icmp48 = and i1 %65, %64, !dbg !487
  %66 = icmp ult i64 %inc, 35, !dbg !500
  %67 = and i1 %66, %_msprop_icmp48, !dbg !501
  br i1 %67, label %68, label %69, !dbg !488, !prof !98

; <label>:68:                                     ; preds = %54
  store i32 %60, i32* @__msan_origin_tls, align 4, !dbg !488
  call void @__msan_warning_noreturn() #5, !dbg !488
  call void asm sideeffect "", ""() #5, !dbg !488
  unreachable, !dbg !488

; <label>:69:                                     ; preds = %54
  %cmp1 = icmp ne %struct.block* %curr.0, null, !dbg !487
  %70 = and i1 %66, %cmp1, !dbg !501
  br i1 %70, label %for.body, label %for.end, !dbg !488, !llvm.loop !502

for.end:                                          ; preds = %69
  call void @llvm.dbg.value(metadata %struct.block* %best.2, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata %struct.block* %best.2, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata %struct.block* %best.2, metadata !465, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.value(metadata %struct.block* %best.2, metadata !465, metadata !DIExpression()), !dbg !475
  %71 = ptrtoint %struct.block* %best.2 to i64, !dbg !504
  %72 = xor i64 %_msphi_s45, -1, !dbg !504
  %73 = and i64 %71, %72, !dbg !504
  %74 = icmp eq i64 %73, 0, !dbg !504
  %75 = icmp ne i64 %_msphi_s45, 0, !dbg !504
  %_msprop_icmp49 = and i1 %75, %74, !dbg !504
  call void @llvm.dbg.value(metadata i64 0, metadata !464, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.value(metadata i64 %index.029, metadata !463, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !473
  br i1 %_msprop_icmp49, label %76, label %77, !dbg !506, !prof !98

; <label>:76:                                     ; preds = %for.end
  store i32 %_msphi_o46, i32* @__msan_origin_tls, align 4, !dbg !506
  call void @__msan_warning_noreturn() #5, !dbg !506
  call void asm sideeffect "", ""() #5, !dbg !506
  unreachable, !dbg !506

; <label>:77:                                     ; preds = %for.end
  %cmp7 = icmp eq %struct.block* %best.2, null, !dbg !504
  br i1 %cmp7, label %while.cond, label %return.loopexit, !dbg !506

return.loopexit:                                  ; preds = %17, %77
  %_msphi_s35.ph = phi i64 [ %_msphi_s45, %77 ], [ 0, %17 ]
  %_msphi_o36.ph = phi i32 [ %_msphi_o46, %77 ], [ 0, %17 ]
  %retval.0.ph = phi %struct.block* [ %best.2, %77 ], [ null, %17 ]
  br label %return, !dbg !507

return:                                           ; preds = %return.loopexit, %10
  %_msphi_s35 = phi i64 [ 0, %10 ], [ %_msphi_s35.ph, %return.loopexit ], !dbg !498
  %_msphi_o36 = phi i32 [ 0, %10 ], [ %_msphi_o36.ph, %return.loopexit ], !dbg !498
  %retval.0 = phi %struct.block* [ null, %10 ], [ %retval.0.ph, %return.loopexit ], !dbg !498
  store i64 %_msphi_s35, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !507
  store i32 %_msphi_o36, i32* @__msan_retval_origin_tls, align 4, !dbg !507
  ret %struct.block* %retval.0, !dbg !507
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @block_removal(%struct.block* %block) unnamed_addr #0 !dbg !508 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !512
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !512
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !510, metadata !DIExpression()), !dbg !512
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !513
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !513
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !515
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !515
  %3 = xor i64 %_msret, -1, !dbg !515
  %4 = and i64 %call, %3, !dbg !515
  %5 = icmp ult i64 %4, 17, !dbg !515
  %6 = or i64 %_msret, %call, !dbg !515
  %7 = icmp ult i64 %6, 17, !dbg !515
  %8 = xor i1 %5, %7, !dbg !515
  br i1 %8, label %9, label %10, !dbg !516, !prof !98

; <label>:9:                                      ; preds = %entry
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !516
  call void @__msan_warning_noreturn() #5, !dbg !516
  call void asm sideeffect "", ""() #5, !dbg !516
  unreachable, !dbg !516

; <label>:10:                                     ; preds = %entry
  %cmp = icmp ult i64 %call, 17, !dbg !515
  br i1 %cmp, label %if.then, label %if.end, !dbg !516

if.then:                                          ; preds = %10
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !517
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !517
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !517
  %call1 = call fastcc %struct.block* @min_block_removal(%struct.block* %block), !dbg !517
  br label %return, !dbg !519

if.end:                                           ; preds = %10
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !520
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !520
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !520
  %call3 = call fastcc i64 @find_size_list(i64 %call), !dbg !520
  %_msret2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !521
  call void @llvm.dbg.value(metadata i64 %call3, metadata !511, metadata !DIExpression()), !dbg !521
  %11 = icmp eq i64 %_msret2, 0, !dbg !522
  %arrayidx = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %call3, !dbg !522
  br i1 %11, label %14, label %12, !dbg !522, !prof !93

; <label>:12:                                     ; preds = %if.end
  %13 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !521
  store i32 %13, i32* @__msan_origin_tls, align 4, !dbg !522
  call void @__msan_warning_noreturn() #5, !dbg !522
  call void asm sideeffect "", ""() #5, !dbg !522
  unreachable, !dbg !522

; <label>:14:                                     ; preds = %if.end
  %15 = load %struct.block*, %struct.block** %arrayidx, align 8, !dbg !522, !tbaa !85
  %16 = ptrtoint %struct.block** %arrayidx to i64, !dbg !524
  %17 = xor i64 %16, 87960930222080, !dbg !524
  %18 = inttoptr i64 %17 to i64*, !dbg !524
  %19 = add i64 %17, 17592186044416, !dbg !524
  %20 = inttoptr i64 %19 to i32*, !dbg !524
  %_msld = load i64, i64* %18, align 8, !dbg !524
  %21 = load i32, i32* %20, align 8, !dbg !524
  %22 = ptrtoint %struct.block* %15 to i64, !dbg !524
  %23 = ptrtoint %struct.block* %block to i64, !dbg !524
  %24 = xor i64 %22, %23, !dbg !524
  %25 = or i64 %_msld, %0, !dbg !524
  %26 = xor i64 %25, -1, !dbg !524
  %27 = and i64 %24, %26, !dbg !524
  %28 = icmp eq i64 %27, 0, !dbg !524
  %29 = icmp ne i64 %25, 0, !dbg !524
  %_msprop_icmp = and i1 %29, %28, !dbg !524
  %30 = icmp ne i64 %0, 0, !dbg !524
  br i1 %_msprop_icmp, label %31, label %33, !dbg !525, !prof !98

; <label>:31:                                     ; preds = %14
  %32 = select i1 %30, i32 %1, i32 %21, !dbg !524
  store i32 %32, i32* @__msan_origin_tls, align 4, !dbg !525
  call void @__msan_warning_noreturn() #5, !dbg !525
  call void asm sideeffect "", ""() #5, !dbg !525
  unreachable, !dbg !525

; <label>:33:                                     ; preds = %14
  %cmp4 = icmp eq %struct.block* %15, %block, !dbg !524
  br i1 %cmp4, label %land.lhs.true, label %.if.else26_crit_edge43, !dbg !525

.if.else26_crit_edge43:                           ; preds = %33
  %.pre = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 1, !dbg !526
  br label %if.else26, !dbg !525

land.lhs.true:                                    ; preds = %33
  %next = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !529
  %_mscmp19 = icmp eq i64 %_msld, 0, !dbg !529
  br i1 %_mscmp19, label %35, label %34, !dbg !529, !prof !93

; <label>:34:                                     ; preds = %land.lhs.true
  store i32 %21, i32* @__msan_origin_tls, align 4, !dbg !529
  call void @__msan_warning_noreturn() #5, !dbg !529
  call void asm sideeffect "", ""() #5, !dbg !529
  unreachable, !dbg !529

; <label>:35:                                     ; preds = %land.lhs.true
  %36 = load %struct.block*, %struct.block** %next, align 8, !dbg !529, !tbaa !166
  %37 = ptrtoint %struct.block** %next to i64, !dbg !530
  %38 = xor i64 %37, 87960930222080, !dbg !530
  %39 = inttoptr i64 %38 to i64*, !dbg !530
  %40 = add i64 %38, 17592186044416, !dbg !530
  %41 = inttoptr i64 %40 to i32*, !dbg !530
  %_msld3 = load i64, i64* %39, align 8, !dbg !530
  %42 = load i32, i32* %41, align 8, !dbg !530
  %43 = ptrtoint %struct.block* %36 to i64, !dbg !530
  %44 = xor i64 %_msld3, -1, !dbg !530
  %45 = and i64 %44, %43, !dbg !530
  %46 = icmp eq i64 %45, 0, !dbg !530
  %47 = icmp ne i64 %_msld3, 0, !dbg !530
  %_msprop_icmp4 = and i1 %47, %46, !dbg !530
  br i1 %_msprop_icmp4, label %48, label %49, !dbg !531, !prof !98

; <label>:48:                                     ; preds = %35
  store i32 %42, i32* @__msan_origin_tls, align 4, !dbg !531
  call void @__msan_warning_noreturn() #5, !dbg !531
  call void asm sideeffect "", ""() #5, !dbg !531
  unreachable, !dbg !531

; <label>:49:                                     ; preds = %35
  %cmp6 = icmp eq %struct.block* %36, null, !dbg !530
  br i1 %cmp6, label %if.then7, label %land.lhs.true12, !dbg !531

if.then7:                                         ; preds = %49
  %50 = bitcast %struct.block** %next to i8*, !dbg !532
  %51 = call i8* @__msan_memset(i8* %50, i32 0, i64 16) #5, !dbg !534
  br i1 false, label %52, label %53, !dbg !532, !prof !98

; <label>:52:                                     ; preds = %if.then7
  unreachable, !dbg !532

; <label>:53:                                     ; preds = %if.then7
  store i64 0, i64* %18, align 8, !dbg !532
  store %struct.block* null, %struct.block** %arrayidx, align 8, !dbg !532, !tbaa !85
  br label %return, !dbg !535

land.lhs.true12:                                  ; preds = %49
  %prev = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 1, !dbg !536
  br i1 %30, label %54, label %55, !dbg !537, !prof !98

; <label>:54:                                     ; preds = %land.lhs.true12
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !537
  call void @__msan_warning_noreturn() #5, !dbg !537
  call void asm sideeffect "", ""() #5, !dbg !537
  unreachable, !dbg !537

; <label>:55:                                     ; preds = %land.lhs.true12
  %56 = load %struct.block*, %struct.block** %prev, align 8, !dbg !537, !tbaa !166
  %57 = ptrtoint %struct.block** %prev to i64, !dbg !538
  %58 = xor i64 %57, 87960930222080, !dbg !538
  %59 = inttoptr i64 %58 to i64*, !dbg !538
  %_msld5 = load i64, i64* %59, align 8, !dbg !538
  %60 = ptrtoint %struct.block* %56 to i64, !dbg !538
  %61 = xor i64 %_msld5, -1, !dbg !538
  %62 = and i64 %61, %60, !dbg !538
  %63 = icmp eq i64 %62, 0, !dbg !538
  %64 = icmp ne i64 %_msld5, 0, !dbg !538
  %_msprop_icmp6 = and i1 %64, %63, !dbg !538
  br i1 %_msprop_icmp6, label %65, label %69, !dbg !539, !prof !98

; <label>:65:                                     ; preds = %55
  %66 = add i64 %58, 17592186044416, !dbg !538
  %67 = inttoptr i64 %66 to i32*, !dbg !538
  %68 = load i32, i32* %67, align 8, !dbg !538
  store i32 %68, i32* @__msan_origin_tls, align 4, !dbg !539
  call void @__msan_warning_noreturn() #5, !dbg !539
  call void asm sideeffect "", ""() #5, !dbg !539
  unreachable, !dbg !539

; <label>:69:                                     ; preds = %55
  %cmp14 = icmp eq %struct.block* %56, null, !dbg !538
  br i1 %cmp14, label %land.lhs.true15, label %if.else26, !dbg !539

land.lhs.true15:                                  ; preds = %69
  br i1 false, label %70, label %71, !dbg !540, !prof !98

; <label>:70:                                     ; preds = %land.lhs.true15
  unreachable, !dbg !540

; <label>:71:                                     ; preds = %land.lhs.true15
  br i1 false, label %72, label %73, !dbg !541, !prof !98

; <label>:72:                                     ; preds = %71
  unreachable, !dbg !541

; <label>:73:                                     ; preds = %71
  br i1 false, label %.if.else26_crit_edge, label %if.then18, !dbg !541

.if.else26_crit_edge:                             ; preds = %73
  br label %if.else26, !dbg !541

if.then18:                                        ; preds = %73
  br i1 false, label %74, label %75, !dbg !542, !prof !98

; <label>:74:                                     ; preds = %if.then18
  unreachable, !dbg !542

; <label>:75:                                     ; preds = %if.then18
  br i1 false, label %76, label %77, !dbg !544, !prof !98

; <label>:76:                                     ; preds = %75
  unreachable, !dbg !544

; <label>:77:                                     ; preds = %75
  store i64 %_msld3, i64* %18, align 8, !dbg !544
  br i1 %47, label %78, label %84, !dbg !544, !prof !98

; <label>:78:                                     ; preds = %77
  %79 = call i32 @__msan_chain_origin(i32 %42) #5, !dbg !544
  %80 = zext i32 %79 to i64, !dbg !544
  %81 = shl nuw i64 %80, 32, !dbg !544
  %82 = or i64 %81, %80, !dbg !544
  %83 = inttoptr i64 %19 to i64*, !dbg !544
  store i64 %82, i64* %83, align 8, !dbg !544
  br label %84, !dbg !544

; <label>:84:                                     ; preds = %77, %78
  store %struct.block* %36, %struct.block** %arrayidx, align 8, !dbg !544, !tbaa !85
  %prev23 = getelementptr inbounds %struct.block, %struct.block* %36, i64 0, i32 1, i32 0, i32 1, !dbg !545
  br i1 %47, label %85, label %86, !dbg !546, !prof !98

; <label>:85:                                     ; preds = %84
  store i32 %42, i32* @__msan_origin_tls, align 4, !dbg !546
  call void @__msan_warning_noreturn() #5, !dbg !546
  call void asm sideeffect "", ""() #5, !dbg !546
  unreachable, !dbg !546

; <label>:86:                                     ; preds = %84
  %87 = ptrtoint %struct.block** %prev23 to i64, !dbg !546
  %88 = xor i64 %87, 87960930222080, !dbg !546
  %89 = inttoptr i64 %88 to i64*, !dbg !546
  store i64 0, i64* %89, align 8, !dbg !546
  store %struct.block* null, %struct.block** %prev23, align 8, !dbg !546, !tbaa !166
  %90 = bitcast %struct.block** %next to i8*, !dbg !547
  %91 = call i8* @__msan_memset(i8* %90, i32 0, i64 16) #5, !dbg !548
  br label %return, !dbg !547

if.else26:                                        ; preds = %.if.else26_crit_edge43, %.if.else26_crit_edge, %69
  %prev27.pre-phi = phi %struct.block** [ %.pre, %.if.else26_crit_edge43 ], [ %prev, %.if.else26_crit_edge ], [ %prev, %69 ], !dbg !526
  %92 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, !dbg !526
  br i1 %30, label %93, label %94, !dbg !526, !prof !98

; <label>:93:                                     ; preds = %if.else26
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !526
  call void @__msan_warning_noreturn() #5, !dbg !526
  call void asm sideeffect "", ""() #5, !dbg !526
  unreachable, !dbg !526

; <label>:94:                                     ; preds = %if.else26
  %95 = load %struct.block*, %struct.block** %prev27.pre-phi, align 8, !dbg !526, !tbaa !166
  %96 = ptrtoint %struct.block** %prev27.pre-phi to i64, !dbg !549
  %97 = xor i64 %96, 87960930222080, !dbg !549
  %98 = inttoptr i64 %97 to i64*, !dbg !549
  %99 = add i64 %97, 17592186044416, !dbg !549
  %100 = inttoptr i64 %99 to i32*, !dbg !549
  %_msld9 = load i64, i64* %98, align 8, !dbg !549
  %101 = load i32, i32* %100, align 8, !dbg !549
  %102 = ptrtoint %struct.block* %95 to i64, !dbg !549
  %103 = xor i64 %_msld9, -1, !dbg !549
  %104 = and i64 %103, %102, !dbg !549
  %105 = icmp eq i64 %104, 0, !dbg !549
  %106 = icmp ne i64 %_msld9, 0, !dbg !549
  %_msprop_icmp10 = and i1 %106, %105, !dbg !549
  br i1 %_msprop_icmp10, label %107, label %108, !dbg !550, !prof !98

; <label>:107:                                    ; preds = %94
  store i32 %101, i32* @__msan_origin_tls, align 4, !dbg !550
  call void @__msan_warning_noreturn() #5, !dbg !550
  call void asm sideeffect "", ""() #5, !dbg !550
  unreachable, !dbg !550

; <label>:108:                                    ; preds = %94
  %cmp28 = icmp eq %struct.block* %95, null, !dbg !549
  br i1 %cmp28, label %.if.else36_crit_edge, label %land.lhs.true29, !dbg !550

.if.else36_crit_edge:                             ; preds = %108
  %.pre44 = getelementptr inbounds %struct.anon, %struct.anon* %92, i64 0, i32 0, !dbg !551
  br label %if.else36, !dbg !550

land.lhs.true29:                                  ; preds = %108
  %next30 = getelementptr inbounds %struct.anon, %struct.anon* %92, i64 0, i32 0, !dbg !553
  br i1 false, label %109, label %110, !dbg !553, !prof !98

; <label>:109:                                    ; preds = %land.lhs.true29
  unreachable, !dbg !553

; <label>:110:                                    ; preds = %land.lhs.true29
  %111 = load %struct.block*, %struct.block** %next30, align 8, !dbg !553, !tbaa !166
  %112 = ptrtoint %struct.anon* %92 to i64, !dbg !554
  %113 = xor i64 %112, 87960930222080, !dbg !554
  %114 = inttoptr i64 %113 to i64*, !dbg !554
  %_msld14 = load i64, i64* %114, align 8, !dbg !554
  %115 = ptrtoint %struct.block* %111 to i64, !dbg !554
  %116 = xor i64 %_msld14, -1, !dbg !554
  %117 = and i64 %116, %115, !dbg !554
  %118 = icmp eq i64 %117, 0, !dbg !554
  %119 = icmp ne i64 %_msld14, 0, !dbg !554
  %_msprop_icmp15 = and i1 %119, %118, !dbg !554
  br i1 %_msprop_icmp15, label %120, label %124, !dbg !555, !prof !98

; <label>:120:                                    ; preds = %110
  %121 = add i64 %113, 17592186044416, !dbg !554
  %122 = inttoptr i64 %121 to i32*, !dbg !554
  %123 = load i32, i32* %122, align 8, !dbg !554
  store i32 %123, i32* @__msan_origin_tls, align 4, !dbg !555
  call void @__msan_warning_noreturn() #5, !dbg !555
  call void asm sideeffect "", ""() #5, !dbg !555
  unreachable, !dbg !555

; <label>:124:                                    ; preds = %110
  %cmp31 = icmp eq %struct.block* %111, null, !dbg !554
  br i1 %cmp31, label %if.then32, label %if.else36, !dbg !555

if.then32:                                        ; preds = %124
  %next34 = getelementptr inbounds %struct.block, %struct.block* %95, i64 0, i32 1, i32 0, i32 0, !dbg !556
  br i1 %106, label %125, label %126, !dbg !558, !prof !98

; <label>:125:                                    ; preds = %if.then32
  store i32 %101, i32* @__msan_origin_tls, align 4, !dbg !558
  call void @__msan_warning_noreturn() #5, !dbg !558
  call void asm sideeffect "", ""() #5, !dbg !558
  unreachable, !dbg !558

; <label>:126:                                    ; preds = %if.then32
  %127 = ptrtoint %struct.block** %next34 to i64, !dbg !558
  %128 = xor i64 %127, 87960930222080, !dbg !558
  %129 = inttoptr i64 %128 to i64*, !dbg !558
  store i64 0, i64* %129, align 8, !dbg !558
  store %struct.block* null, %struct.block** %next34, align 8, !dbg !558, !tbaa !166
  br i1 false, label %130, label %131, !dbg !559, !prof !98

; <label>:130:                                    ; preds = %126
  unreachable, !dbg !559

; <label>:131:                                    ; preds = %126
  store i64 0, i64* %98, align 8, !dbg !559
  store %struct.block* null, %struct.block** %prev27.pre-phi, align 8, !dbg !559, !tbaa !166
  br label %return, !dbg !560

if.else36:                                        ; preds = %.if.else36_crit_edge, %124
  %next37.pre-phi = phi %struct.block** [ %.pre44, %.if.else36_crit_edge ], [ %next30, %124 ], !dbg !551
  br i1 false, label %132, label %133, !dbg !551, !prof !98

; <label>:132:                                    ; preds = %if.else36
  unreachable, !dbg !551

; <label>:133:                                    ; preds = %if.else36
  %134 = bitcast %struct.anon* %92 to i64*, !dbg !551
  %135 = load i64, i64* %134, align 8, !dbg !551, !tbaa !166
  %136 = ptrtoint %struct.anon* %92 to i64, !dbg !561
  %137 = xor i64 %136, 87960930222080, !dbg !561
  %138 = inttoptr i64 %137 to i64*, !dbg !561
  %139 = add i64 %137, 17592186044416, !dbg !561
  %140 = inttoptr i64 %139 to i32*, !dbg !561
  %_msld11 = load i64, i64* %138, align 8, !dbg !561
  %141 = load i32, i32* %140, align 8, !dbg !561
  %142 = getelementptr inbounds %struct.block, %struct.block* %95, i64 0, i32 1, !dbg !561
  %143 = bitcast %union.anon* %142 to i64*, !dbg !562
  br i1 %106, label %144, label %145, !dbg !562, !prof !98

; <label>:144:                                    ; preds = %133
  store i32 %101, i32* @__msan_origin_tls, align 4, !dbg !562
  call void @__msan_warning_noreturn() #5, !dbg !562
  call void asm sideeffect "", ""() #5, !dbg !562
  unreachable, !dbg !562

; <label>:145:                                    ; preds = %133
  %146 = ptrtoint %union.anon* %142 to i64, !dbg !562
  %147 = xor i64 %146, 87960930222080, !dbg !562
  %148 = inttoptr i64 %147 to i64*, !dbg !562
  store i64 %_msld11, i64* %148, align 8, !dbg !562
  %_mscmp40 = icmp eq i64 %_msld11, 0, !dbg !562
  br i1 %_mscmp40, label %156, label %149, !dbg !562, !prof !93

; <label>:149:                                    ; preds = %145
  %150 = add i64 %147, 17592186044416, !dbg !562
  %151 = call i32 @__msan_chain_origin(i32 %141) #5, !dbg !562
  %152 = zext i32 %151 to i64, !dbg !562
  %153 = shl nuw i64 %152, 32, !dbg !562
  %154 = or i64 %153, %152, !dbg !562
  %155 = inttoptr i64 %150 to i64*, !dbg !562
  store i64 %154, i64* %155, align 8, !dbg !562
  br label %156, !dbg !562

; <label>:156:                                    ; preds = %145, %149
  store i64 %135, i64* %143, align 8, !dbg !562, !tbaa !166
  br i1 false, label %157, label %158, !dbg !563, !prof !98

; <label>:157:                                    ; preds = %156
  unreachable, !dbg !563

; <label>:158:                                    ; preds = %156
  %159 = bitcast %struct.block** %prev27.pre-phi to i64*, !dbg !563
  %160 = load i64, i64* %159, align 8, !dbg !563, !tbaa !166
  %161 = ptrtoint %struct.block** %prev27.pre-phi to i64, !dbg !564
  %162 = xor i64 %161, 87960930222080, !dbg !564
  %163 = inttoptr i64 %162 to i64*, !dbg !564
  %164 = add i64 %162, 17592186044416, !dbg !564
  %165 = inttoptr i64 %164 to i32*, !dbg !564
  %_msld12 = load i64, i64* %163, align 8, !dbg !564
  %166 = load i32, i32* %165, align 8, !dbg !564
  br i1 false, label %167, label %168, !dbg !564, !prof !98

; <label>:167:                                    ; preds = %158
  unreachable, !dbg !564

; <label>:168:                                    ; preds = %158
  %169 = load %struct.block*, %struct.block** %next37.pre-phi, align 8, !dbg !564, !tbaa !166
  %170 = ptrtoint %struct.block** %next37.pre-phi to i64, !dbg !565
  %171 = xor i64 %170, 87960930222080, !dbg !565
  %172 = inttoptr i64 %171 to i64*, !dbg !565
  %_msld13 = load i64, i64* %172, align 8, !dbg !565
  %prev42 = getelementptr inbounds %struct.block, %struct.block* %169, i64 0, i32 1, i32 0, i32 1, !dbg !565
  %173 = bitcast %struct.block** %prev42 to i64*, !dbg !566
  %_mscmp32 = icmp eq i64 %_msld13, 0, !dbg !566
  br i1 %_mscmp32, label %178, label %174, !dbg !566, !prof !93

; <label>:174:                                    ; preds = %168
  %175 = add i64 %171, 17592186044416, !dbg !565
  %176 = inttoptr i64 %175 to i32*, !dbg !565
  %177 = load i32, i32* %176, align 8, !dbg !565
  store i32 %177, i32* @__msan_origin_tls, align 4, !dbg !566
  call void @__msan_warning_noreturn() #5, !dbg !566
  call void asm sideeffect "", ""() #5, !dbg !566
  unreachable, !dbg !566

; <label>:178:                                    ; preds = %168
  %179 = ptrtoint %struct.block** %prev42 to i64, !dbg !566
  %180 = xor i64 %179, 87960930222080, !dbg !566
  %181 = inttoptr i64 %180 to i64*, !dbg !566
  store i64 %_msld12, i64* %181, align 8, !dbg !566
  %_mscmp41 = icmp eq i64 %_msld12, 0, !dbg !566
  br i1 %_mscmp41, label %189, label %182, !dbg !566, !prof !93

; <label>:182:                                    ; preds = %178
  %183 = add i64 %180, 17592186044416, !dbg !566
  %184 = call i32 @__msan_chain_origin(i32 %166) #5, !dbg !566
  %185 = zext i32 %184 to i64, !dbg !566
  %186 = shl nuw i64 %185, 32, !dbg !566
  %187 = or i64 %186, %185, !dbg !566
  %188 = inttoptr i64 %183 to i64*, !dbg !566
  store i64 %187, i64* %188, align 8, !dbg !566
  br label %189, !dbg !566

; <label>:189:                                    ; preds = %178, %182
  store i64 %160, i64* %173, align 8, !dbg !566, !tbaa !166
  %190 = bitcast %struct.anon* %92 to i8*
  %191 = call i8* @__msan_memset(i8* %190, i32 0, i64 16) #5, !dbg !567
  br label %return

return:                                           ; preds = %53, %131, %189, %86, %if.then
  ret void
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @write_block(%struct.block* %block, i64 %size, i1 zeroext %alloc, i1 zeroext %alloc_prev) unnamed_addr #0 !dbg !568 {
entry:
  %0 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !580
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !580
  %2 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !580
  %3 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !580
  %4 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !580
  %5 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !580
  %6 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !580
  %7 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !580
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !572, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.value(metadata i64 %size, metadata !573, metadata !DIExpression()), !dbg !581
  call void @llvm.dbg.value(metadata i1 %alloc, metadata !574, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.value(metadata i1 %alloc_prev, metadata !575, metadata !DIExpression()), !dbg !583
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !584
  %call = call fastcc zeroext i1 @get_min_status(%struct.block* %block), !dbg !584
  %_msret = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !585
  %8 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !585
  store i64 %4, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !585
  store i32 %5, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !585
  store i1 %2, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !585
  store i32 %3, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !585
  store i1 %0, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !585
  store i32 %1, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !585
  store i1 %_msret, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !585
  store i32 %8, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !585
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !585
  %call3 = call fastcc i64 @pack(i64 %size, i1 zeroext %alloc, i1 zeroext %alloc_prev, i1 zeroext %call), !dbg !585
  %_msret38 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !586
  %9 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !586
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !586
  %_mscmp = icmp eq i64 %6, 0, !dbg !587
  br i1 %_mscmp, label %11, label %10, !dbg !587, !prof !93

; <label>:10:                                     ; preds = %entry
  store i32 %7, i32* @__msan_origin_tls, align 4, !dbg !587
  call void @__msan_warning_noreturn() #5, !dbg !587
  call void asm sideeffect "", ""() #5, !dbg !587
  unreachable, !dbg !587

; <label>:11:                                     ; preds = %entry
  %12 = ptrtoint %struct.block* %block to i64, !dbg !587
  %13 = xor i64 %12, 87960930222080, !dbg !587
  %14 = inttoptr i64 %13 to i64*, !dbg !587
  store i64 %_msret38, i64* %14, align 8, !dbg !587
  %_mscmp49 = icmp eq i64 %_msret38, 0, !dbg !587
  br i1 %_mscmp49, label %22, label %15, !dbg !587, !prof !93

; <label>:15:                                     ; preds = %11
  %16 = add i64 %13, 17592186044416, !dbg !587
  %17 = call i32 @__msan_chain_origin(i32 %9) #5, !dbg !587
  %18 = zext i32 %17 to i64, !dbg !587
  %19 = shl nuw i64 %18, 32, !dbg !587
  %20 = or i64 %19, %18, !dbg !587
  %21 = inttoptr i64 %16 to i64*, !dbg !587
  store i64 %20, i64* %21, align 8, !dbg !587
  br label %22, !dbg !587

; <label>:22:                                     ; preds = %11, %15
  store i64 %call3, i64* %header, align 8, !dbg !587, !tbaa !224
  %tobool4.not = xor i1 %alloc, true, !dbg !588
  %23 = xor i64 %4, -1, !dbg !589
  %24 = and i64 %23, %size, !dbg !589
  %25 = icmp ugt i64 %24, 16, !dbg !589
  %26 = or i64 %4, %size, !dbg !589
  %27 = icmp ugt i64 %26, 16, !dbg !589
  %28 = xor i1 %25, %27, !dbg !589
  %cmp = icmp ugt i64 %size, 16, !dbg !589
  %29 = and i1 %2, %28, !dbg !588
  %30 = and i1 %cmp, %2, !dbg !588
  %31 = and i1 %28, %tobool4.not, !dbg !588
  %32 = or i1 %30, %31, !dbg !588
  %33 = or i1 %29, %32, !dbg !588
  br i1 %33, label %34, label %36, !dbg !588, !prof !98

; <label>:34:                                     ; preds = %22
  %35 = select i1 %2, i32 %3, i32 %5, !dbg !588
  store i32 %35, i32* @__msan_origin_tls, align 4, !dbg !588
  call void @__msan_warning_noreturn() #5, !dbg !588
  call void asm sideeffect "", ""() #5, !dbg !588
  unreachable, !dbg !588

; <label>:36:                                     ; preds = %22
  %or.cond = and i1 %cmp, %tobool4.not, !dbg !588
  br i1 %or.cond, label %if.then, label %if.end, !dbg !588

if.then:                                          ; preds = %36
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !590
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !590
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !590
  %call5 = call fastcc i64* @header_to_footer(%struct.block* nonnull %block), !dbg !590
  %_msret39 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !591
  %37 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !591
  call void @llvm.dbg.value(metadata i64* %call5, metadata !576, metadata !DIExpression()), !dbg !591
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !592
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !592
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !592
  %call8 = call fastcc zeroext i1 @get_min_status(%struct.block* nonnull %block), !dbg !592
  %_msret40 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !593
  %38 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !593
  store i64 %4, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !593
  store i32 %5, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !593
  store i1 %2, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !593
  store i32 %3, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !593
  store i1 %0, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !593
  store i32 %1, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !593
  store i1 %_msret40, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !593
  store i32 %38, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !593
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !593
  %call9 = call fastcc i64 @pack(i64 %size, i1 zeroext %alloc, i1 zeroext %alloc_prev, i1 zeroext %call8), !dbg !593
  %_msret41 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !594
  %39 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !594
  %_mscmp47 = icmp eq i64 %_msret39, 0, !dbg !594
  br i1 %_mscmp47, label %41, label %40, !dbg !594, !prof !93

; <label>:40:                                     ; preds = %if.then
  store i32 %37, i32* @__msan_origin_tls, align 4, !dbg !594
  call void @__msan_warning_noreturn() #5, !dbg !594
  call void asm sideeffect "", ""() #5, !dbg !594
  unreachable, !dbg !594

; <label>:41:                                     ; preds = %if.then
  %42 = ptrtoint i64* %call5 to i64, !dbg !594
  %43 = xor i64 %42, 87960930222080, !dbg !594
  %44 = inttoptr i64 %43 to i64*, !dbg !594
  store i64 %_msret41, i64* %44, align 8, !dbg !594
  %_mscmp50 = icmp eq i64 %_msret41, 0, !dbg !594
  br i1 %_mscmp50, label %52, label %45, !dbg !594, !prof !93

; <label>:45:                                     ; preds = %41
  %46 = add i64 %43, 17592186044416, !dbg !594
  %47 = call i32 @__msan_chain_origin(i32 %39) #5, !dbg !594
  %48 = zext i32 %47 to i64, !dbg !594
  %49 = shl nuw i64 %48, 32, !dbg !594
  %50 = or i64 %49, %48, !dbg !594
  %51 = inttoptr i64 %46 to i64*, !dbg !594
  store i64 %50, i64* %51, align 8, !dbg !594
  br label %52, !dbg !594

; <label>:52:                                     ; preds = %41, %45
  store i64 %call9, i64* %call5, align 8, !dbg !594, !tbaa !94
  br label %if.end, !dbg !595

if.end:                                           ; preds = %36, %52
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !596
  store i32 %7, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !596
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !596
  %call10 = call fastcc %struct.block* @find_next(%struct.block* nonnull %block), !dbg !596
  %_msret42 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !597
  %53 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !597
  call void @llvm.dbg.value(metadata %struct.block* %call10, metadata !579, metadata !DIExpression()), !dbg !597
  %54 = icmp ult i64 %24, 17, !dbg !598
  %55 = icmp ult i64 %26, 17, !dbg !598
  %56 = xor i1 %54, %55, !dbg !598
  %cmp11 = icmp ult i64 %size, 17, !dbg !598
  store i64 %_msret42, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !600
  store i32 %53, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !600
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !600
  %call13 = call fastcc i64 @get_size(%struct.block* %call10), !dbg !600
  %_msret43 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !600
  %57 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !600
  store i64 %_msret42, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !600
  store i32 %53, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !600
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !600
  %call14 = call fastcc zeroext i1 @get_alloc(%struct.block* %call10), !dbg !600
  %_msret44 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !602
  %58 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !602
  store i64 %_msret43, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !602
  store i32 %57, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !602
  store i1 %_msret44, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !602
  store i32 %58, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !602
  store i1 %2, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !602
  store i32 %3, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !602
  store i1 %56, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !602
  store i32 %5, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !602
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !602
  %call21 = call fastcc i64 @pack(i64 %call13, i1 zeroext %call14, i1 zeroext %alloc, i1 zeroext %cmp11), !dbg !602
  %_msret45 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !602
  %59 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !602
  %header22 = getelementptr inbounds %struct.block, %struct.block* %call10, i64 0, i32 0, !dbg !602
  %_mscmp48 = icmp eq i64 %_msret42, 0, !dbg !602
  br i1 %_mscmp48, label %61, label %60, !dbg !602, !prof !93

; <label>:60:                                     ; preds = %if.end
  store i32 %53, i32* @__msan_origin_tls, align 4, !dbg !602
  call void @__msan_warning_noreturn() #5, !dbg !602
  call void asm sideeffect "", ""() #5, !dbg !602
  unreachable, !dbg !602

; <label>:61:                                     ; preds = %if.end
  %62 = ptrtoint %struct.block* %call10 to i64, !dbg !602
  %63 = xor i64 %62, 87960930222080, !dbg !602
  %64 = inttoptr i64 %63 to i64*, !dbg !602
  store i64 %_msret45, i64* %64, align 8, !dbg !602
  %_mscmp51 = icmp eq i64 %_msret45, 0, !dbg !602
  br i1 %_mscmp51, label %72, label %65, !dbg !602, !prof !93

; <label>:65:                                     ; preds = %61
  %66 = add i64 %63, 17592186044416, !dbg !602
  %67 = call i32 @__msan_chain_origin(i32 %59) #5, !dbg !602
  %68 = zext i32 %67 to i64, !dbg !602
  %69 = shl nuw i64 %68, 32, !dbg !602
  %70 = or i64 %69, %68, !dbg !602
  %71 = inttoptr i64 %66 to i64*, !dbg !602
  store i64 %70, i64* %71, align 8, !dbg !602
  br label %72, !dbg !602

; <label>:72:                                     ; preds = %61, %65
  store i64 %call21, i64* %header22, align 8, !dbg !602, !tbaa !224
  ret void, !dbg !604
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @get_alloc_prev(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !605 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !608
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !607, metadata !DIExpression()), !dbg !608
  %_mscmp = icmp eq i64 %0, 0, !dbg !609
  br i1 %_mscmp, label %3, label %1, !dbg !609, !prof !93

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !608
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !609
  call void @__msan_warning_noreturn() #5, !dbg !609
  call void asm sideeffect "", ""() #5, !dbg !609
  unreachable, !dbg !609

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !609
  %4 = load i64, i64* %header, align 8, !dbg !609, !tbaa !224
  %5 = ptrtoint %struct.block* %block to i64, !dbg !610
  %6 = xor i64 %5, 87960930222080, !dbg !610
  %7 = inttoptr i64 %6 to i64*, !dbg !610
  %8 = add i64 %6, 17592186044416, !dbg !610
  %9 = inttoptr i64 %8 to i32*, !dbg !610
  %_msld = load i64, i64* %7, align 8, !dbg !610
  %10 = load i32, i32* %9, align 8, !dbg !610
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !610
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !610
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !610
  %call = call fastcc zeroext i1 @extract_alloc_prev(i64 %4), !dbg !610
  ret i1 %call, !dbg !611
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @split_block(%struct.block* %block, i64 %asize) unnamed_addr #0 !dbg !612 {
entry:
  %0 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !622
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !622
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !622
  %3 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !622
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !616, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.value(metadata i64 %asize, metadata !617, metadata !DIExpression()), !dbg !623
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !624
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !624
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !625
  %4 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !625
  call void @llvm.dbg.value(metadata i64 %call, metadata !618, metadata !DIExpression()), !dbg !625
  %_msprop = or i64 %_msret, %0, !dbg !626
  %5 = icmp eq i64 %0, 0, !dbg !626
  %6 = select i1 %5, i32 %4, i32 %1, !dbg !626
  %sub = sub i64 %call, %asize, !dbg !626
  %7 = xor i64 %_msprop, -16, !dbg !627
  %8 = and i64 %sub, %7, !dbg !627
  %9 = icmp ugt i64 %8, 15, !dbg !627
  %10 = or i64 %_msprop, %sub, !dbg !627
  %11 = icmp ugt i64 %10, 15, !dbg !627
  %12 = xor i1 %9, %11, !dbg !627
  br i1 %12, label %13, label %14, !dbg !628, !prof !98

; <label>:13:                                     ; preds = %entry
  store i32 %6, i32* @__msan_origin_tls, align 4, !dbg !628
  call void @__msan_warning_noreturn() #5, !dbg !628
  call void asm sideeffect "", ""() #5, !dbg !628
  unreachable, !dbg !628

; <label>:14:                                     ; preds = %entry
  %cmp = icmp ugt i64 %sub, 15, !dbg !627
  br i1 %cmp, label %if.then, label %if.end, !dbg !628

if.then:                                          ; preds = %14
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !629
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !629
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !629
  %call1 = call fastcc zeroext i1 @get_alloc_prev(%struct.block* %block), !dbg !629
  %_msret12 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !630
  %15 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !630
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !630
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !630
  store i64 %0, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !630
  store i32 %1, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !630
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !630
  store i1 %_msret12, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !630
  store i32 %15, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !630
  call fastcc void @write_block(%struct.block* %block, i64 %asize, i1 zeroext true, i1 zeroext %call1), !dbg !630
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !631
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !631
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !631
  %call2 = call fastcc %struct.block* @find_next(%struct.block* %block), !dbg !631
  %_msret13 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !632
  %16 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !632
  call void @llvm.dbg.value(metadata %struct.block* %call2, metadata !619, metadata !DIExpression()), !dbg !632
  store i64 %_msret13, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !633
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !633
  store i64 %_msprop, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !633
  store i32 %6, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !633
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !633
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !633
  call fastcc void @write_block(%struct.block* %call2, i64 %sub, i1 zeroext false, i1 zeroext true), !dbg !633
  store i64 %_msret13, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !634
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !634
  call fastcc void @block_insertion(%struct.block* %call2), !dbg !634
  br label %if.end, !dbg !635

if.end:                                           ; preds = %if.then, %14
  ret void, !dbg !636
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull i8* @header_to_payload(%struct.block* readnone %block) unnamed_addr #0 !dbg !637 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !642
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !642
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !641, metadata !DIExpression()), !dbg !642
  %2 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, !dbg !643
  %arraydecay = bitcast %union.anon* %2 to i8*, !dbg !644
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !645
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !645
  ret i8* %arraydecay, !dbg !645
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @write_epilogue(%struct.block* nocapture %block, i1 zeroext %prev_alloc) unnamed_addr #0 !dbg !646 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !652
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !652
  %2 = load i1, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !652
  %3 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !652
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !650, metadata !DIExpression()), !dbg !652
  call void @llvm.dbg.value(metadata i1 %prev_alloc, metadata !651, metadata !DIExpression()), !dbg !653
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !654
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i1*), align 8, !dbg !654
  store i1 %2, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !654
  store i32 %3, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !654
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !654
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !654
  %call = call fastcc i64 @pack(i64 0, i1 zeroext true, i1 zeroext %prev_alloc, i1 zeroext false), !dbg !654
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !655
  %4 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !655
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !655
  %_mscmp = icmp eq i64 %0, 0, !dbg !656
  br i1 %_mscmp, label %6, label %5, !dbg !656, !prof !93

; <label>:5:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !656
  call void @__msan_warning_noreturn() #5, !dbg !656
  call void asm sideeffect "", ""() #5, !dbg !656
  unreachable, !dbg !656

; <label>:6:                                      ; preds = %entry
  %7 = ptrtoint %struct.block* %block to i64, !dbg !656
  %8 = xor i64 %7, 87960930222080, !dbg !656
  %9 = inttoptr i64 %8 to i64*, !dbg !656
  store i64 %_msret, i64* %9, align 8, !dbg !656
  %_mscmp1 = icmp eq i64 %_msret, 0, !dbg !656
  br i1 %_mscmp1, label %17, label %10, !dbg !656, !prof !93

; <label>:10:                                     ; preds = %6
  %11 = add i64 %8, 17592186044416, !dbg !656
  %12 = call i32 @__msan_chain_origin(i32 %4) #5, !dbg !656
  %13 = zext i32 %12 to i64, !dbg !656
  %14 = shl nuw i64 %13, 32, !dbg !656
  %15 = or i64 %14, %13, !dbg !656
  %16 = inttoptr i64 %11 to i64*, !dbg !656
  store i64 %15, i64* %16, align 8, !dbg !656
  br label %17, !dbg !656

; <label>:17:                                     ; preds = %6, %10
  store i64 %call, i64* %header, align 8, !dbg !656, !tbaa !224
  ret void, !dbg !657
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local void @mm_free(i8* %bp) local_unnamed_addr #0 !dbg !658 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !666
  call void @llvm.dbg.value(metadata i8* %bp, metadata !662, metadata !DIExpression()), !dbg !666
  %1 = ptrtoint i8* %bp to i64, !dbg !667
  %2 = xor i64 %0, -1, !dbg !667
  %3 = and i64 %2, %1, !dbg !667
  %4 = icmp eq i64 %3, 0, !dbg !667
  %5 = icmp ne i64 %0, 0, !dbg !667
  %_msprop_icmp = and i1 %5, %4, !dbg !667
  br i1 %_msprop_icmp, label %6, label %8, !dbg !669, !prof !98

; <label>:6:                                      ; preds = %entry
  %7 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !666
  store i32 %7, i32* @__msan_origin_tls, align 4, !dbg !669
  call void @__msan_warning_noreturn() #5, !dbg !669
  call void asm sideeffect "", ""() #5, !dbg !669
  unreachable, !dbg !669

; <label>:8:                                      ; preds = %entry
  %cmp = icmp eq i8* %bp, null, !dbg !667
  br i1 %cmp, label %return, label %if.end, !dbg !669

if.end:                                           ; preds = %8
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !670
  %call = call fastcc %struct.block* @payload_to_header(i8* nonnull %bp), !dbg !670
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !671
  %9 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !671
  call void @llvm.dbg.value(metadata %struct.block* %call, metadata !663, metadata !DIExpression()), !dbg !671
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !672
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !672
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !672
  %call1 = call fastcc i64 @get_size(%struct.block* nonnull %call), !dbg !672
  %_msret9 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !673
  %10 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !673
  call void @llvm.dbg.value(metadata i64 %call1, metadata !664, metadata !DIExpression()), !dbg !673
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !674
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !674
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !674
  %call2 = call fastcc zeroext i1 @get_alloc_prev(%struct.block* nonnull %call), !dbg !674
  %_msret10 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !675
  %11 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !675
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !675
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !675
  store i64 %_msret9, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !675
  store i32 %10, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !675
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !675
  store i1 %_msret10, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !675
  store i32 %11, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !675
  call fastcc void @write_block(%struct.block* nonnull %call, i64 %call1, i1 zeroext false, i1 zeroext %call2), !dbg !675
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !676
  store i32 %9, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !676
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !676
  %call3 = call fastcc %struct.block* @coalesce_block(%struct.block* nonnull %call), !dbg !676
  %_msret11 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !677
  %12 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !677
  call void @llvm.dbg.value(metadata %struct.block* %call3, metadata !665, metadata !DIExpression()), !dbg !677
  store i64 %_msret11, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !678
  store i32 %12, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !678
  call fastcc void @block_insertion(%struct.block* %call3), !dbg !678
  br label %return, !dbg !679

return:                                           ; preds = %8, %if.end
  ret void, !dbg !679
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull %struct.block* @payload_to_header(i8* readnone %bp) unnamed_addr #0 !dbg !680 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !685
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !685
  call void @llvm.dbg.value(metadata i8* %bp, metadata !684, metadata !DIExpression()), !dbg !685
  %add.ptr = getelementptr inbounds i8, i8* %bp, i64 -8, !dbg !686
  %2 = bitcast i8* %add.ptr to %struct.block*, !dbg !687
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !688
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !688
  ret %struct.block* %2, !dbg !688
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @coalesce_block(%struct.block* %block) unnamed_addr #0 !dbg !689 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !701
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !701
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !691, metadata !DIExpression()), !dbg !701
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !702
  %call = call fastcc %struct.block* @find_next(%struct.block* %block), !dbg !702
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !703
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !703
  call void @llvm.dbg.value(metadata %struct.block* %call, metadata !692, metadata !DIExpression()), !dbg !703
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !704
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !704
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !704
  %call1 = call fastcc i64 @get_size(%struct.block* %block), !dbg !704
  %_msret55 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !705
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !705
  call void @llvm.dbg.value(metadata i64 %call1, metadata !693, metadata !DIExpression()), !dbg !705
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !706
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !706
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !706
  %call2 = call fastcc zeroext i1 @get_alloc_prev(%struct.block* %block), !dbg !706
  %_msret56 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !707
  %4 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !707
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !707
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !707
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !707
  %call3 = call fastcc zeroext i1 @get_alloc(%struct.block* %call), !dbg !707
  %_msret57 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !708
  %5 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !708
  br i1 %_msret56, label %6, label %7, !dbg !708, !prof !98

; <label>:6:                                      ; preds = %entry
  store i32 %4, i32* @__msan_origin_tls, align 4, !dbg !708
  call void @__msan_warning_noreturn() #5, !dbg !708
  call void asm sideeffect "", ""() #5, !dbg !708
  unreachable, !dbg !708

; <label>:7:                                      ; preds = %entry
  br i1 %call2, label %land.lhs.true, label %land.lhs.true12, !dbg !708

land.lhs.true:                                    ; preds = %7
  br i1 %_msret57, label %8, label %9, !dbg !709, !prof !98

; <label>:8:                                      ; preds = %land.lhs.true
  store i32 %5, i32* @__msan_origin_tls, align 4, !dbg !709
  call void @__msan_warning_noreturn() #5, !dbg !709
  call void asm sideeffect "", ""() #5, !dbg !709
  unreachable, !dbg !709

; <label>:9:                                      ; preds = %land.lhs.true
  br i1 %call3, label %return, label %land.lhs.true5, !dbg !709

land.lhs.true5:                                   ; preds = %9
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !710
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !710
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !710
  %call6 = call fastcc zeroext i1 @get_alloc(%struct.block* %call), !dbg !710
  %_msret58 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !711
  br i1 %_msret58, label %10, label %12, !dbg !711, !prof !98

; <label>:10:                                     ; preds = %land.lhs.true5
  %11 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !711
  store i32 %11, i32* @__msan_origin_tls, align 4, !dbg !711
  call void @__msan_warning_noreturn() #5, !dbg !711
  call void asm sideeffect "", ""() #5, !dbg !711
  unreachable, !dbg !711

; <label>:12:                                     ; preds = %land.lhs.true5
  br i1 %call6, label %if.else20, label %if.then7, !dbg !711

if.then7:                                         ; preds = %12
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !712
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !712
  call fastcc void @block_removal(%struct.block* %call), !dbg !712
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !714
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !714
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !714
  %call9 = call fastcc i64 @get_size(%struct.block* %call), !dbg !714
  %_msret64 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !715
  %13 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !715
  %_msprop65 = or i64 %_msret64, %_msret55, !dbg !715
  %14 = icmp eq i64 %_msret55, 0, !dbg !715
  %15 = select i1 %14, i32 %13, i32 %3, !dbg !715
  %add = add i64 %call9, %call1, !dbg !715
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !716
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !716
  store i64 %_msprop65, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !716
  store i32 %15, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !716
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !716
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !716
  call fastcc void @write_block(%struct.block* %block, i64 %add, i1 zeroext false, i1 zeroext true), !dbg !716
  br label %return, !dbg !717

land.lhs.true12:                                  ; preds = %7
  br i1 %_msret57, label %16, label %17, !dbg !718, !prof !98

; <label>:16:                                     ; preds = %land.lhs.true12
  store i32 %5, i32* @__msan_origin_tls, align 4, !dbg !718
  call void @__msan_warning_noreturn() #5, !dbg !718
  call void asm sideeffect "", ""() #5, !dbg !718
  unreachable, !dbg !718

; <label>:17:                                     ; preds = %land.lhs.true12
  br i1 %call3, label %if.then14, label %if.else20, !dbg !718

if.then14:                                        ; preds = %17
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !719
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !719
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !719
  %call15 = call fastcc %struct.block* @find_prev(%struct.block* %block), !dbg !719
  %_msret66 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !720
  %18 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !720
  call void @llvm.dbg.value(metadata %struct.block* %call15, metadata !694, metadata !DIExpression()), !dbg !720
  store i64 %_msret66, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !721
  store i32 %18, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !721
  call fastcc void @block_removal(%struct.block* %call15), !dbg !721
  store i64 %_msret66, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !722
  store i32 %18, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !722
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !722
  %call17 = call fastcc i64 @get_size(%struct.block* %call15), !dbg !722
  %_msret67 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !723
  %19 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !723
  %_msprop68 = or i64 %_msret67, %_msret55, !dbg !723
  %20 = icmp eq i64 %_msret55, 0, !dbg !723
  %21 = select i1 %20, i32 %19, i32 %3, !dbg !723
  %add18 = add i64 %call17, %call1, !dbg !723
  store i64 %_msret66, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !724
  store i32 %18, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !724
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !724
  %call19 = call fastcc zeroext i1 @get_alloc_prev(%struct.block* %call15), !dbg !724
  %_msret69 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !725
  %22 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !725
  store i64 %_msret66, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !725
  store i32 %18, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !725
  store i64 %_msprop68, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !725
  store i32 %21, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !725
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !725
  store i1 %_msret69, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !725
  store i32 %22, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !725
  call fastcc void @write_block(%struct.block* %call15, i64 %add18, i1 zeroext false, i1 zeroext %call19), !dbg !725
  br label %return, !dbg !726

if.else20:                                        ; preds = %12, %17
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !727
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !727
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !727
  %call22 = call fastcc %struct.block* @find_prev(%struct.block* %block), !dbg !727
  %_msret59 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !728
  %23 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !728
  call void @llvm.dbg.value(metadata %struct.block* %call22, metadata !699, metadata !DIExpression()), !dbg !728
  store i64 %_msret59, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !729
  store i32 %23, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !729
  call fastcc void @block_removal(%struct.block* %call22), !dbg !729
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !730
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !730
  call fastcc void @block_removal(%struct.block* %call), !dbg !730
  store i64 %_msret59, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !731
  store i32 %23, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !731
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !731
  %call25 = call fastcc i64 @get_size(%struct.block* %call22), !dbg !731
  %_msret60 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !732
  %24 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !732
  %_msprop = or i64 %_msret60, %_msret55, !dbg !732
  %25 = icmp eq i64 %_msret55, 0, !dbg !732
  %26 = select i1 %25, i32 %24, i32 %3, !dbg !732
  %add26 = add i64 %call25, %call1, !dbg !732
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !733
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !733
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !733
  %call27 = call fastcc i64 @get_size(%struct.block* %call), !dbg !733
  %_msret61 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !734
  %27 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !734
  %_msprop62 = or i64 %_msprop, %_msret61, !dbg !734
  %28 = icmp eq i64 %_msret61, 0, !dbg !734
  %29 = select i1 %28, i32 %26, i32 %27, !dbg !734
  %add28 = add i64 %add26, %call27, !dbg !734
  store i64 %_msret59, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !735
  store i32 %23, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !735
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !735
  %call29 = call fastcc zeroext i1 @get_alloc_prev(%struct.block* %call22), !dbg !735
  %_msret63 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !736
  %30 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !736
  store i64 %_msret59, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !736
  store i32 %23, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !736
  store i64 %_msprop62, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !736
  store i32 %29, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !736
  store i1 false, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i1*), align 8, !dbg !736
  store i1 %_msret63, i1* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 24) to i1*), align 8, !dbg !736
  store i32 %30, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 24) to i32*), align 4, !dbg !736
  call fastcc void @write_block(%struct.block* %call22, i64 %add28, i1 zeroext false, i1 zeroext %call29), !dbg !736
  br label %return, !dbg !737

return:                                           ; preds = %9, %if.else20, %if.then14, %if.then7
  %_msphi_s = phi i64 [ %_msret59, %if.else20 ], [ %_msret66, %if.then14 ], [ %0, %if.then7 ], [ %0, %9 ], !dbg !738
  %_msphi_o = phi i32 [ %23, %if.else20 ], [ %18, %if.then14 ], [ %1, %if.then7 ], [ %1, %9 ], !dbg !738
  %retval.0 = phi %struct.block* [ %call22, %if.else20 ], [ %call15, %if.then14 ], [ %block, %if.then7 ], [ %block, %9 ], !dbg !738
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !739
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !739
  ret %struct.block* %retval.0, !dbg !739
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc void @block_insertion(%struct.block* %block) unnamed_addr #0 !dbg !740 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !744
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !744
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !742, metadata !DIExpression()), !dbg !744
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !745
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !745
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !747
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !747
  %3 = xor i64 %_msret, -1, !dbg !747
  %4 = and i64 %call, %3, !dbg !747
  %5 = icmp ult i64 %4, 17, !dbg !747
  %6 = or i64 %_msret, %call, !dbg !747
  %7 = icmp ult i64 %6, 17, !dbg !747
  %8 = xor i1 %5, %7, !dbg !747
  br i1 %8, label %9, label %10, !dbg !748, !prof !98

; <label>:9:                                      ; preds = %entry
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !748
  call void @__msan_warning_noreturn() #5, !dbg !748
  call void asm sideeffect "", ""() #5, !dbg !748
  unreachable, !dbg !748

; <label>:10:                                     ; preds = %entry
  %cmp = icmp ult i64 %call, 17, !dbg !747
  br i1 %cmp, label %if.then, label %if.end, !dbg !748

if.then:                                          ; preds = %10
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !749
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !749
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !749
  %call1 = call fastcc %struct.block* @min_block_insertion(%struct.block* %block), !dbg !749
  br label %return, !dbg !751

if.end:                                           ; preds = %10
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !752
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !752
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !752
  %call3 = call fastcc i64 @find_size_list(i64 %call), !dbg !752
  %_msret2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !753
  call void @llvm.dbg.value(metadata i64 %call3, metadata !743, metadata !DIExpression()), !dbg !753
  %11 = icmp eq i64 %_msret2, 0, !dbg !754
  %arrayidx = getelementptr inbounds [15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 %call3, !dbg !754
  br i1 %11, label %14, label %12, !dbg !754, !prof !93

; <label>:12:                                     ; preds = %if.end
  %13 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !753
  store i32 %13, i32* @__msan_origin_tls, align 4, !dbg !754
  call void @__msan_warning_noreturn() #5, !dbg !754
  call void asm sideeffect "", ""() #5, !dbg !754
  unreachable, !dbg !754

; <label>:14:                                     ; preds = %if.end
  %15 = bitcast %struct.block** %arrayidx to i64*, !dbg !754
  %16 = load i64, i64* %15, align 8, !dbg !754, !tbaa !85
  %17 = ptrtoint %struct.block** %arrayidx to i64, !dbg !755
  %18 = xor i64 %17, 87960930222080, !dbg !755
  %19 = inttoptr i64 %18 to i64*, !dbg !755
  %20 = add i64 %18, 17592186044416, !dbg !755
  %21 = inttoptr i64 %20 to i32*, !dbg !755
  %_msld = load i64, i64* %19, align 8, !dbg !755
  %22 = load i32, i32* %21, align 8, !dbg !755
  %23 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, !dbg !755
  %24 = bitcast %union.anon* %23 to i64*, !dbg !756
  %_mscmp5 = icmp eq i64 %0, 0, !dbg !756
  br i1 %_mscmp5, label %26, label %25, !dbg !756, !prof !93

; <label>:25:                                     ; preds = %14
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !756
  call void @__msan_warning_noreturn() #5, !dbg !756
  call void asm sideeffect "", ""() #5, !dbg !756
  unreachable, !dbg !756

; <label>:26:                                     ; preds = %14
  %27 = ptrtoint %union.anon* %23 to i64, !dbg !756
  %28 = xor i64 %27, 87960930222080, !dbg !756
  %29 = inttoptr i64 %28 to i64*, !dbg !756
  store i64 %_msld, i64* %29, align 8, !dbg !756
  %_mscmp11 = icmp eq i64 %_msld, 0, !dbg !756
  br i1 %_mscmp11, label %37, label %30, !dbg !756, !prof !93

; <label>:30:                                     ; preds = %26
  %31 = add i64 %28, 17592186044416, !dbg !756
  %32 = call i32 @__msan_chain_origin(i32 %22) #5, !dbg !756
  %33 = zext i32 %32 to i64, !dbg !756
  %34 = shl nuw i64 %33, 32, !dbg !756
  %35 = or i64 %34, %33, !dbg !756
  %36 = inttoptr i64 %31 to i64*, !dbg !756
  store i64 %35, i64* %36, align 8, !dbg !756
  br label %37, !dbg !756

; <label>:37:                                     ; preds = %26, %30
  store i64 %16, i64* %24, align 8, !dbg !756, !tbaa !166
  %prev = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 1, !dbg !757
  br i1 false, label %38, label %39, !dbg !758, !prof !98

; <label>:38:                                     ; preds = %37
  unreachable, !dbg !758

; <label>:39:                                     ; preds = %37
  %40 = ptrtoint %struct.block** %prev to i64, !dbg !758
  %41 = xor i64 %40, 87960930222080, !dbg !758
  %42 = inttoptr i64 %41 to i64*, !dbg !758
  store i64 0, i64* %42, align 8, !dbg !758
  store %struct.block* null, %struct.block** %prev, align 8, !dbg !758, !tbaa !166
  br i1 false, label %43, label %44, !dbg !759, !prof !98

; <label>:43:                                     ; preds = %39
  unreachable, !dbg !759

; <label>:44:                                     ; preds = %39
  %45 = load %struct.block*, %struct.block** %arrayidx, align 8, !dbg !759, !tbaa !85
  %46 = ptrtoint %struct.block** %arrayidx to i64, !dbg !761
  %47 = xor i64 %46, 87960930222080, !dbg !761
  %48 = inttoptr i64 %47 to i64*, !dbg !761
  %49 = add i64 %47, 17592186044416, !dbg !761
  %50 = inttoptr i64 %49 to i32*, !dbg !761
  %_msld3 = load i64, i64* %48, align 8, !dbg !761
  %51 = load i32, i32* %50, align 8, !dbg !761
  %52 = ptrtoint %struct.block* %45 to i64, !dbg !761
  %53 = xor i64 %_msld3, -1, !dbg !761
  %54 = and i64 %53, %52, !dbg !761
  %55 = icmp eq i64 %54, 0, !dbg !761
  %56 = icmp ne i64 %_msld3, 0, !dbg !761
  %_msprop_icmp = and i1 %56, %55, !dbg !761
  br i1 %_msprop_icmp, label %57, label %58, !dbg !762, !prof !98

; <label>:57:                                     ; preds = %44
  store i32 %51, i32* @__msan_origin_tls, align 4, !dbg !762
  call void @__msan_warning_noreturn() #5, !dbg !762
  call void asm sideeffect "", ""() #5, !dbg !762
  unreachable, !dbg !762

; <label>:58:                                     ; preds = %44
  %cmp5 = icmp eq %struct.block* %45, null, !dbg !761
  br i1 %cmp5, label %if.end9, label %if.then6, !dbg !762

if.then6:                                         ; preds = %58
  %prev8 = getelementptr inbounds %struct.block, %struct.block* %45, i64 0, i32 1, i32 0, i32 1, !dbg !763
  br i1 %56, label %59, label %60, !dbg !765, !prof !98

; <label>:59:                                     ; preds = %if.then6
  store i32 %51, i32* @__msan_origin_tls, align 4, !dbg !765
  call void @__msan_warning_noreturn() #5, !dbg !765
  call void asm sideeffect "", ""() #5, !dbg !765
  unreachable, !dbg !765

; <label>:60:                                     ; preds = %if.then6
  %61 = ptrtoint %struct.block** %prev8 to i64, !dbg !765
  %62 = xor i64 %61, 87960930222080, !dbg !765
  %63 = inttoptr i64 %62 to i64*, !dbg !765
  store i64 0, i64* %63, align 8, !dbg !765
  br i1 false, label %64, label %65, !dbg !765, !prof !98

; <label>:64:                                     ; preds = %60
  br label %65, !dbg !765

; <label>:65:                                     ; preds = %60, %64
  store %struct.block* %block, %struct.block** %prev8, align 8, !dbg !765, !tbaa !166
  br label %if.end9, !dbg !766

if.end9:                                          ; preds = %58, %65
  br i1 false, label %66, label %67, !dbg !767, !prof !98

; <label>:66:                                     ; preds = %if.end9
  unreachable, !dbg !767

; <label>:67:                                     ; preds = %if.end9
  store i64 0, i64* %48, align 8, !dbg !767
  br i1 false, label %68, label %69, !dbg !767, !prof !98

; <label>:68:                                     ; preds = %67
  br label %69, !dbg !767

; <label>:69:                                     ; preds = %67, %68
  store %struct.block* %block, %struct.block** %arrayidx, align 8, !dbg !767, !tbaa !85
  br label %return, !dbg !768

return:                                           ; preds = %69, %if.then
  ret void
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local i8* @mm_realloc(i8* %ptr, i64 %size) local_unnamed_addr #0 !dbg !769 {
entry:
  %0 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !778
  %1 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !778
  %2 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !778
  %3 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !778
  call void @llvm.dbg.value(metadata i8* %ptr, metadata !773, metadata !DIExpression()), !dbg !778
  call void @llvm.dbg.value(metadata i64 %size, metadata !774, metadata !DIExpression()), !dbg !779
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !780
  %call = call fastcc %struct.block* @payload_to_header(i8* %ptr), !dbg !780
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !781
  %4 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !781
  call void @llvm.dbg.value(metadata %struct.block* %call, metadata !775, metadata !DIExpression()), !dbg !781
  %5 = xor i64 %0, -1, !dbg !782
  %6 = and i64 %5, %size, !dbg !782
  %7 = icmp eq i64 %6, 0, !dbg !782
  %8 = icmp ne i64 %0, 0, !dbg !782
  %_msprop_icmp = and i1 %8, %7, !dbg !782
  br i1 %_msprop_icmp, label %9, label %10, !dbg !784, !prof !98

; <label>:9:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !784
  call void @__msan_warning_noreturn() #5, !dbg !784
  call void asm sideeffect "", ""() #5, !dbg !784
  unreachable, !dbg !784

; <label>:10:                                     ; preds = %entry
  %cmp = icmp eq i64 %size, 0, !dbg !782
  br i1 %cmp, label %if.then, label %if.end, !dbg !784

if.then:                                          ; preds = %10
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !785
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !785
  call void @mm_free(i8* %ptr), !dbg !785
  br label %return, !dbg !787

if.end:                                           ; preds = %10
  %11 = ptrtoint i8* %ptr to i64, !dbg !788
  %12 = xor i64 %2, -1, !dbg !788
  %13 = and i64 %12, %11, !dbg !788
  %14 = icmp eq i64 %13, 0, !dbg !788
  %15 = icmp ne i64 %2, 0, !dbg !788
  %_msprop_icmp23 = and i1 %15, %14, !dbg !788
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !790
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !790
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !790
  %call3 = call i8* @mm_malloc(i64 %size), !dbg !790
  %_msret24 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !791
  %16 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !791
  br i1 %_msprop_icmp23, label %17, label %18, !dbg !791, !prof !98

; <label>:17:                                     ; preds = %if.end
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !791
  call void @__msan_warning_noreturn() #5, !dbg !791
  call void asm sideeffect "", ""() #5, !dbg !791
  unreachable, !dbg !791

; <label>:18:                                     ; preds = %if.end
  %cmp1 = icmp eq i8* %ptr, null, !dbg !788
  br i1 %cmp1, label %return, label %if.end4, !dbg !791

if.end4:                                          ; preds = %18
  call void @llvm.dbg.value(metadata i8* %call3, metadata !777, metadata !DIExpression()), !dbg !792
  %19 = ptrtoint i8* %call3 to i64, !dbg !793
  %20 = xor i64 %_msret24, -1, !dbg !793
  %21 = and i64 %20, %19, !dbg !793
  %22 = icmp eq i64 %21, 0, !dbg !793
  %23 = icmp ne i64 %_msret24, 0, !dbg !793
  %_msprop_icmp25 = and i1 %23, %22, !dbg !793
  br i1 %_msprop_icmp25, label %24, label %25, !dbg !795, !prof !98

; <label>:24:                                     ; preds = %if.end4
  store i32 %16, i32* @__msan_origin_tls, align 4, !dbg !795
  call void @__msan_warning_noreturn() #5, !dbg !795
  call void asm sideeffect "", ""() #5, !dbg !795
  unreachable, !dbg !795

; <label>:25:                                     ; preds = %if.end4
  %cmp6 = icmp eq i8* %call3, null, !dbg !793
  br i1 %cmp6, label %return, label %if.end8, !dbg !795

if.end8:                                          ; preds = %25
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !796
  store i32 %4, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !796
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !796
  %call9 = call fastcc i64 @get_payload_size(%struct.block* nonnull %call), !dbg !796
  %_msret26 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !797
  %26 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !797
  call void @llvm.dbg.value(metadata i64 %call9, metadata !776, metadata !DIExpression()), !dbg !797
  %_msprop = or i64 %_msret26, %0, !dbg !798
  %27 = select i1 %8, i32 %1, i32 %26, !dbg !798
  %28 = icmp ne i64 %_msprop, 0, !dbg !798
  %cmp10 = icmp ugt i64 %call9, %size, !dbg !798
  %29 = select i1 %cmp10, i64 %0, i64 %_msret26, !dbg !800
  %30 = xor i64 %call9, %size, !dbg !800
  %31 = or i64 %_msprop, %30, !dbg !800
  %_msprop_select = select i1 %28, i64 %31, i64 %29, !dbg !800
  %32 = select i1 %cmp10, i32 %1, i32 %26, !dbg !800
  %33 = select i1 %28, i32 %27, i32 %32, !dbg !800
  %spec.select = select i1 %cmp10, i64 %size, i64 %call9, !dbg !800
  call void @llvm.dbg.value(metadata i64 %spec.select, metadata !776, metadata !DIExpression()), !dbg !797
  store i64 %_msret24, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !801
  store i32 %16, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !801
  store i64 %2, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !801
  store i32 %3, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !801
  store i64 %_msprop_select, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i64*), align 8, !dbg !801
  store i32 %33, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !801
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !801
  %call13 = call i8* @mem_memcpy(i8* nonnull %call3, i8* nonnull %ptr, i64 %spec.select) #5, !dbg !801
  store i64 %2, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !802
  store i32 %3, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !802
  call void @mm_free(i8* nonnull %ptr), !dbg !802
  br label %return, !dbg !803

return:                                           ; preds = %25, %18, %if.end8, %if.then
  %_msphi_s = phi i64 [ 0, %if.then ], [ %_msret24, %if.end8 ], [ %_msret24, %18 ], [ 0, %25 ], !dbg !790
  %_msphi_o = phi i32 [ 0, %if.then ], [ %16, %if.end8 ], [ %16, %18 ], [ 0, %25 ], !dbg !790
  %retval.0 = phi i8* [ null, %if.then ], [ %call3, %if.end8 ], [ %call3, %18 ], [ null, %25 ], !dbg !790
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !804
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !804
  ret i8* %retval.0, !dbg !804
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc i64 @get_payload_size(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !805 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !809
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !809
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !807, metadata !DIExpression()), !dbg !809
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !810
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !810
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !811
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !811
  call void @llvm.dbg.value(metadata i64 %call, metadata !808, metadata !DIExpression()), !dbg !811
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !812
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !812
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !812
  %call1 = call fastcc zeroext i1 @get_alloc(%struct.block* %block), !dbg !812
  %_msret4 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !814
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !814
  %_msprop_select = select i1 %_msret4, i64 8, i64 0, !dbg !814
  %4 = select i1 %_msret4, i32 %3, i32 0, !dbg !814
  %retval.0.v = select i1 %call1, i64 -8, i64 -16, !dbg !814
  %_msprop = or i64 %_msprop_select, %_msret, !dbg !814
  %5 = icmp eq i64 %_msret, 0, !dbg !814
  %6 = select i1 %5, i32 %4, i32 %2, !dbg !814
  %retval.0 = add i64 %retval.0.v, %call, !dbg !814
  store i64 %_msprop, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !815
  store i32 %6, i32* @__msan_retval_origin_tls, align 4, !dbg !815
  ret i64 %retval.0, !dbg !815
}

declare dso_local i8* @mem_memcpy(i8*, i8*, i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define dso_local i8* @mm_calloc(i64 %elements, i64 %size) local_unnamed_addr #0 !dbg !816 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !824
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !824
  %2 = load i64, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i64*), align 8, !dbg !824
  %3 = load i32, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 8) to i32*), align 4, !dbg !824
  call void @llvm.dbg.value(metadata i64 %elements, metadata !820, metadata !DIExpression()), !dbg !824
  call void @llvm.dbg.value(metadata i64 %size, metadata !821, metadata !DIExpression()), !dbg !825
  %_msprop = or i64 %2, %0, !dbg !826
  %4 = icmp ne i64 %0, 0, !dbg !826
  %5 = select i1 %4, i32 %1, i32 %3, !dbg !826
  %mul = mul i64 %size, %elements, !dbg !826
  call void @llvm.dbg.value(metadata i64 %mul, metadata !823, metadata !DIExpression()), !dbg !827
  %6 = xor i64 %0, -1, !dbg !828
  %7 = and i64 %6, %elements, !dbg !828
  %8 = icmp eq i64 %7, 0, !dbg !828
  %_msprop_icmp = and i1 %4, %8, !dbg !828
  br i1 %_msprop_icmp, label %9, label %10, !dbg !830, !prof !98

; <label>:9:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !830
  call void @__msan_warning_noreturn() #5, !dbg !830
  call void asm sideeffect "", ""() #5, !dbg !830
  unreachable, !dbg !830

; <label>:10:                                     ; preds = %entry
  %cmp = icmp eq i64 %elements, 0, !dbg !828
  br i1 %cmp, label %return, label %if.end, !dbg !830

if.end:                                           ; preds = %10
  br i1 %4, label %11, label %12, !dbg !831, !prof !98

; <label>:11:                                     ; preds = %if.end
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !831
  call void @__msan_warning_noreturn() #5, !dbg !831
  call void asm sideeffect "", ""() #5, !dbg !831
  unreachable, !dbg !831

; <label>:12:                                     ; preds = %if.end
  %div = udiv i64 %mul, %elements, !dbg !831
  %13 = xor i64 %div, %size, !dbg !833
  %14 = xor i64 %_msprop, -1, !dbg !833
  %15 = and i64 %13, %14, !dbg !833
  %16 = icmp eq i64 %15, 0, !dbg !833
  %17 = icmp ne i64 %_msprop, 0, !dbg !833
  %_msprop_icmp15 = and i1 %17, %16, !dbg !833
  br i1 %_msprop_icmp15, label %18, label %21, !dbg !834, !prof !98

; <label>:18:                                     ; preds = %12
  %19 = icmp eq i64 %2, 0, !dbg !833
  %20 = select i1 %19, i32 %5, i32 %3, !dbg !833
  store i32 %20, i32* @__msan_origin_tls, align 4, !dbg !834
  call void @__msan_warning_noreturn() #5, !dbg !834
  call void asm sideeffect "", ""() #5, !dbg !834
  unreachable, !dbg !834

; <label>:21:                                     ; preds = %12
  %cmp1 = icmp eq i64 %div, %size, !dbg !833
  br i1 %cmp1, label %if.end3, label %return, !dbg !834

if.end3:                                          ; preds = %21
  store i64 %_msprop, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !835
  store i32 %5, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !835
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !835
  %call = call i8* @mm_malloc(i64 %mul), !dbg !835
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !836
  %22 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !836
  call void @llvm.dbg.value(metadata i8* %call, metadata !822, metadata !DIExpression()), !dbg !836
  %23 = ptrtoint i8* %call to i64, !dbg !837
  %24 = xor i64 %_msret, -1, !dbg !837
  %25 = and i64 %24, %23, !dbg !837
  %26 = icmp eq i64 %25, 0, !dbg !837
  %27 = icmp ne i64 %_msret, 0, !dbg !837
  %_msprop_icmp16 = and i1 %27, %26, !dbg !837
  br i1 %_msprop_icmp16, label %28, label %29, !dbg !839, !prof !98

; <label>:28:                                     ; preds = %if.end3
  store i32 %22, i32* @__msan_origin_tls, align 4, !dbg !839
  call void @__msan_warning_noreturn() #5, !dbg !839
  call void asm sideeffect "", ""() #5, !dbg !839
  unreachable, !dbg !839

; <label>:29:                                     ; preds = %if.end3
  %cmp4 = icmp eq i8* %call, null, !dbg !837
  br i1 %cmp4, label %return, label %if.end6, !dbg !839

if.end6:                                          ; preds = %29
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !840
  store i32 %22, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !840
  store i32 0, i32* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 8) to i32*), align 8, !dbg !840
  store i64 %_msprop, i64* inttoptr (i64 add (i64 ptrtoint ([100 x i64]* @__msan_param_tls to i64), i64 16) to i64*), align 8, !dbg !840
  store i32 %5, i32* inttoptr (i64 add (i64 ptrtoint ([200 x i32]* @__msan_param_origin_tls to i64), i64 16) to i32*), align 4, !dbg !840
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !840
  %call7 = call i8* @mem_memset(i8* nonnull %call, i32 0, i64 %mul) #5, !dbg !840
  br label %return, !dbg !841

return:                                           ; preds = %29, %21, %10, %if.end6
  %_msphi_s = phi i64 [ %_msret, %if.end6 ], [ 0, %10 ], [ 0, %21 ], [ 0, %29 ], !dbg !842
  %_msphi_o = phi i32 [ %22, %if.end6 ], [ 0, %10 ], [ 0, %21 ], [ 0, %29 ], !dbg !842
  %retval.0 = phi i8* [ %call, %if.end6 ], [ null, %10 ], [ null, %21 ], [ null, %29 ], !dbg !842
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !843
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !843
  ret i8* %retval.0, !dbg !843
}

declare dso_local i8* @mem_memset(i8*, i32, i64) local_unnamed_addr #2

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @min_block_removal(%struct.block* %block) unnamed_addr #0 !dbg !844 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !853
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !853
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !846, metadata !DIExpression()), !dbg !853
  %2 = load %struct.block*, %struct.block** getelementptr inbounds ([15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 0), align 16, !dbg !854, !tbaa !85
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080) to i64*), align 16, !dbg !855
  %3 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080), i64 17592186044416) to i32*), align 16, !dbg !855
  %4 = ptrtoint %struct.block* %2 to i64, !dbg !855
  %5 = ptrtoint %struct.block* %block to i64, !dbg !855
  %6 = xor i64 %4, %5, !dbg !855
  %7 = or i64 %_msld, %0, !dbg !855
  %8 = xor i64 %7, -1, !dbg !855
  %9 = and i64 %6, %8, !dbg !855
  %10 = icmp eq i64 %9, 0, !dbg !855
  %11 = icmp ne i64 %7, 0, !dbg !855
  %_msprop_icmp = and i1 %11, %10, !dbg !855
  %12 = icmp ne i64 %0, 0, !dbg !855
  br i1 %_msprop_icmp, label %13, label %15, !dbg !856, !prof !98

; <label>:13:                                     ; preds = %entry
  %14 = select i1 %12, i32 %1, i32 %3, !dbg !855
  store i32 %14, i32* @__msan_origin_tls, align 4, !dbg !856
  call void @__msan_warning_noreturn() #5, !dbg !856
  call void asm sideeffect "", ""() #5, !dbg !856
  unreachable, !dbg !856

; <label>:15:                                     ; preds = %entry
  %cmp = icmp eq %struct.block* %2, %block, !dbg !855
  br i1 %cmp, label %land.lhs.true, label %for.cond.preheader, !dbg !856

for.cond.preheader:                               ; preds = %15
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !851, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !847, metadata !DIExpression()), !dbg !858
  %16 = xor i64 %_msld, -1, !dbg !859
  %17 = and i64 %16, %4, !dbg !859
  %18 = icmp eq i64 %17, 0, !dbg !859
  %19 = icmp ne i64 %_msld, 0, !dbg !859
  %_msprop_icmp46 = and i1 %19, %18, !dbg !859
  br i1 %_msprop_icmp46, label %20, label %21, !dbg !861, !prof !98

; <label>:20:                                     ; preds = %for.cond.preheader
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !861
  call void @__msan_warning_noreturn() #5, !dbg !861
  call void asm sideeffect "", ""() #5, !dbg !861
  unreachable, !dbg !861

; <label>:21:                                     ; preds = %for.cond.preheader
  %cmp828 = icmp eq %struct.block* %2, null, !dbg !859
  br i1 %cmp828, label %return, label %for.body.preheader, !dbg !861

for.body.preheader:                               ; preds = %21
  call void @llvm.dbg.value(metadata %struct.block* %2, metadata !851, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.value(metadata %struct.block* null, metadata !847, metadata !DIExpression()), !dbg !858
  %next1138 = getelementptr inbounds %struct.block, %struct.block* %2, i64 0, i32 1, i32 0, i32 0, !dbg !862
  br label %if.end, !dbg !863

land.lhs.true:                                    ; preds = %15
  %next = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !865
  %_mscmp55 = icmp eq i64 %_msld, 0, !dbg !865
  br i1 %_mscmp55, label %23, label %22, !dbg !865, !prof !93

; <label>:22:                                     ; preds = %land.lhs.true
  store i32 %3, i32* @__msan_origin_tls, align 4, !dbg !865
  call void @__msan_warning_noreturn() #5, !dbg !865
  call void asm sideeffect "", ""() #5, !dbg !865
  unreachable, !dbg !865

; <label>:23:                                     ; preds = %land.lhs.true
  %24 = load %struct.block*, %struct.block** %next, align 8, !dbg !865, !tbaa !166
  %25 = ptrtoint %struct.block** %next to i64, !dbg !866
  %26 = xor i64 %25, 87960930222080, !dbg !866
  %27 = inttoptr i64 %26 to i64*, !dbg !866
  %_msld43 = load i64, i64* %27, align 8, !dbg !866
  %28 = ptrtoint %struct.block* %24 to i64, !dbg !866
  %29 = xor i64 %_msld43, -1, !dbg !866
  %30 = and i64 %29, %28, !dbg !866
  %31 = icmp eq i64 %30, 0, !dbg !866
  %32 = icmp ne i64 %_msld43, 0, !dbg !866
  %_msprop_icmp44 = and i1 %32, %31, !dbg !866
  br i1 %_msprop_icmp44, label %33, label %37, !dbg !867, !prof !98

; <label>:33:                                     ; preds = %23
  %34 = add i64 %26, 17592186044416, !dbg !866
  %35 = inttoptr i64 %34 to i32*, !dbg !866
  %36 = load i32, i32* %35, align 8, !dbg !866
  store i32 %36, i32* @__msan_origin_tls, align 4, !dbg !867
  call void @__msan_warning_noreturn() #5, !dbg !867
  call void asm sideeffect "", ""() #5, !dbg !867
  unreachable, !dbg !867

; <label>:37:                                     ; preds = %23
  %cmp1 = icmp eq %struct.block* %24, null, !dbg !866
  br i1 %cmp1, label %if.then, label %if.then4, !dbg !867

if.then:                                          ; preds = %37
  br i1 %12, label %38, label %39, !dbg !868, !prof !98

; <label>:38:                                     ; preds = %if.then
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !868
  call void @__msan_warning_noreturn() #5, !dbg !868
  call void asm sideeffect "", ""() #5, !dbg !868
  unreachable, !dbg !868

; <label>:39:                                     ; preds = %if.then
  store i64 0, i64* %27, align 8, !dbg !868
  store %struct.block* null, %struct.block** %next, align 8, !dbg !868, !tbaa !166
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080) to i64*), align 16, !dbg !870
  store %struct.block* null, %struct.block** getelementptr inbounds ([15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 0), align 16, !dbg !870, !tbaa !85
  br label %return, !dbg !871

if.then4:                                         ; preds = %37
  br i1 %12, label %40, label %41, !dbg !872, !prof !98

; <label>:40:                                     ; preds = %if.then4
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !872
  call void @__msan_warning_noreturn() #5, !dbg !872
  call void asm sideeffect "", ""() #5, !dbg !872
  unreachable, !dbg !872

; <label>:41:                                     ; preds = %if.then4
  %42 = ptrtoint %struct.block** %next to i64, !dbg !874
  %43 = xor i64 %42, 87960930222080, !dbg !874
  %44 = inttoptr i64 %43 to i64*, !dbg !874
  %45 = add i64 %43, 17592186044416, !dbg !874
  %46 = inttoptr i64 %45 to i32*, !dbg !874
  %_msld45 = load i64, i64* %44, align 8, !dbg !874
  %47 = load i32, i32* %46, align 8, !dbg !874
  store i64 %_msld45, i64* inttoptr (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080) to i64*), align 16, !dbg !874
  %_mscmp67 = icmp eq i64 %_msld45, 0, !dbg !874
  br i1 %_mscmp67, label %53, label %48, !dbg !874, !prof !93

; <label>:48:                                     ; preds = %41
  %49 = call i32 @__msan_chain_origin(i32 %47) #5, !dbg !874
  %50 = zext i32 %49 to i64, !dbg !874
  %51 = shl nuw i64 %50, 32, !dbg !874
  %52 = or i64 %51, %50, !dbg !874
  store i64 %52, i64* inttoptr (i64 add (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080), i64 17592186044416) to i64*), align 16, !dbg !874
  br label %53, !dbg !874

; <label>:53:                                     ; preds = %41, %48
  store i64 %28, i64* bitcast ([15 x %struct.block*]* @list_heads to i64*), align 16, !dbg !874, !tbaa !85
  br i1 false, label %54, label %55, !dbg !875, !prof !98

; <label>:54:                                     ; preds = %53
  unreachable, !dbg !875

; <label>:55:                                     ; preds = %53
  store i64 0, i64* %27, align 8, !dbg !875
  store %struct.block* null, %struct.block** %next, align 8, !dbg !875, !tbaa !166
  br label %return, !dbg !876

for.body:                                         ; preds = %110
  call void @llvm.dbg.value(metadata %struct.block* %97, metadata !851, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.value(metadata %struct.block* %curr.03039, metadata !847, metadata !DIExpression()), !dbg !858
  %56 = xor i64 %104, %5, !dbg !877
  %57 = or i64 %_msld51, %0, !dbg !877
  %58 = xor i64 %57, -1, !dbg !877
  %59 = and i64 %56, %58, !dbg !877
  %60 = icmp eq i64 %59, 0, !dbg !877
  %61 = icmp ne i64 %57, 0, !dbg !877
  %_msprop_icmp53 = and i1 %61, %60, !dbg !877
  %next11 = getelementptr inbounds %struct.block, %struct.block* %97, i64 0, i32 1, i32 0, i32 0, !dbg !862
  br i1 %_msprop_icmp53, label %62, label %64, !dbg !863, !prof !98

; <label>:62:                                     ; preds = %for.body
  %63 = select i1 %12, i32 %1, i32 %103, !dbg !877
  store i32 %63, i32* @__msan_origin_tls, align 4, !dbg !863
  call void @__msan_warning_noreturn() #5, !dbg !863
  call void asm sideeffect "", ""() #5, !dbg !863
  unreachable, !dbg !863

; <label>:64:                                     ; preds = %for.body
  %cmp9 = icmp eq %struct.block* %97, %block, !dbg !877
  br i1 %cmp9, label %if.then10, label %if.end, !dbg !863, !llvm.loop !879

if.then10:                                        ; preds = %64
  call void @llvm.dbg.value(metadata %struct.block* %curr.03039, metadata !851, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.value(metadata %struct.block* %curr.03039, metadata !851, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.value(metadata %struct.block* %curr.03039, metadata !847, metadata !DIExpression()), !dbg !858
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !847, metadata !DIExpression()), !dbg !858
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !847, metadata !DIExpression()), !dbg !858
  call void @llvm.dbg.value(metadata %struct.block* undef, metadata !847, metadata !DIExpression()), !dbg !858
  br i1 %108, label %65, label %66, !dbg !881, !prof !98

; <label>:65:                                     ; preds = %if.then10
  store i32 %103, i32* @__msan_origin_tls, align 4, !dbg !881
  call void @__msan_warning_noreturn() #5, !dbg !881
  call void asm sideeffect "", ""() #5, !dbg !881
  unreachable, !dbg !881

; <label>:66:                                     ; preds = %if.then10
  %67 = bitcast %struct.block** %next11 to i64*, !dbg !881
  %68 = load i64, i64* %67, align 8, !dbg !881, !tbaa !166
  %69 = ptrtoint %struct.block** %next11 to i64, !dbg !883
  %70 = xor i64 %69, 87960930222080, !dbg !883
  %71 = inttoptr i64 %70 to i64*, !dbg !883
  %72 = add i64 %70, 17592186044416, !dbg !883
  %73 = inttoptr i64 %72 to i32*, !dbg !883
  %_msld54 = load i64, i64* %71, align 8, !dbg !883
  %74 = load i32, i32* %73, align 8, !dbg !883
  %75 = getelementptr inbounds %struct.block, %struct.block* %curr.03039, i64 0, i32 1, !dbg !883
  %76 = bitcast %union.anon* %75 to i64*, !dbg !884
  %_mscmp65 = icmp eq i64 %_msphi_s49, 0, !dbg !884
  br i1 %_mscmp65, label %78, label %77, !dbg !884, !prof !93

; <label>:77:                                     ; preds = %66
  store i32 %_msphi_o50, i32* @__msan_origin_tls, align 4, !dbg !884
  call void @__msan_warning_noreturn() #5, !dbg !884
  call void asm sideeffect "", ""() #5, !dbg !884
  unreachable, !dbg !884

; <label>:78:                                     ; preds = %66
  %79 = ptrtoint %union.anon* %75 to i64, !dbg !884
  %80 = xor i64 %79, 87960930222080, !dbg !884
  %81 = inttoptr i64 %80 to i64*, !dbg !884
  store i64 %_msld54, i64* %81, align 8, !dbg !884
  %_mscmp68 = icmp eq i64 %_msld54, 0, !dbg !884
  br i1 %_mscmp68, label %89, label %82, !dbg !884, !prof !93

; <label>:82:                                     ; preds = %78
  %83 = add i64 %80, 17592186044416, !dbg !884
  %84 = call i32 @__msan_chain_origin(i32 %74) #5, !dbg !884
  %85 = zext i32 %84 to i64, !dbg !884
  %86 = shl nuw i64 %85, 32, !dbg !884
  %87 = or i64 %86, %85, !dbg !884
  %88 = inttoptr i64 %83 to i64*, !dbg !884
  store i64 %87, i64* %88, align 8, !dbg !884
  br label %89, !dbg !884

; <label>:89:                                     ; preds = %78, %82
  store i64 %68, i64* %76, align 8, !dbg !884, !tbaa !166
  %next13 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, i32 0, i32 0, !dbg !885
  br i1 %12, label %90, label %91, !dbg !886, !prof !98

; <label>:90:                                     ; preds = %89
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !886
  call void @__msan_warning_noreturn() #5, !dbg !886
  call void asm sideeffect "", ""() #5, !dbg !886
  unreachable, !dbg !886

; <label>:91:                                     ; preds = %89
  %92 = ptrtoint %struct.block** %next13 to i64, !dbg !886
  %93 = xor i64 %92, 87960930222080, !dbg !886
  %94 = inttoptr i64 %93 to i64*, !dbg !886
  store i64 0, i64* %94, align 8, !dbg !886
  store %struct.block* null, %struct.block** %next13, align 8, !dbg !886, !tbaa !166
  br label %return, !dbg !887

if.end:                                           ; preds = %for.body.preheader, %64
  %_msphi_s47 = phi i64 [ %_msld51, %64 ], [ %_msld, %for.body.preheader ]
  %_msphi_o48 = phi i32 [ %103, %64 ], [ %3, %for.body.preheader ]
  %next1140 = phi %struct.block** [ %next11, %64 ], [ %next1138, %for.body.preheader ]
  %_msphi_s49 = phi i64 [ %_msld51, %64 ], [ %_msld, %for.body.preheader ]
  %_msphi_o50 = phi i32 [ %103, %64 ], [ %3, %for.body.preheader ]
  %curr.03039 = phi %struct.block* [ %97, %64 ], [ %2, %for.body.preheader ]
  call void @llvm.dbg.value(metadata %struct.block* %curr.03039, metadata !851, metadata !DIExpression()), !dbg !857
  %_mscmp61 = icmp eq i64 %_msphi_s47, 0, !dbg !888
  br i1 %_mscmp61, label %96, label %95, !dbg !888, !prof !93

; <label>:95:                                     ; preds = %if.end
  store i32 %_msphi_o48, i32* @__msan_origin_tls, align 4, !dbg !888
  call void @__msan_warning_noreturn() #5, !dbg !888
  call void asm sideeffect "", ""() #5, !dbg !888
  unreachable, !dbg !888

; <label>:96:                                     ; preds = %if.end
  %97 = load %struct.block*, %struct.block** %next1140, align 8, !dbg !888, !tbaa !166
  %98 = ptrtoint %struct.block** %next1140 to i64, !dbg !857
  %99 = xor i64 %98, 87960930222080, !dbg !857
  %100 = inttoptr i64 %99 to i64*, !dbg !857
  %101 = add i64 %99, 17592186044416, !dbg !857
  %102 = inttoptr i64 %101 to i32*, !dbg !857
  %_msld51 = load i64, i64* %100, align 8, !dbg !857
  %103 = load i32, i32* %102, align 8, !dbg !857
  call void @llvm.dbg.value(metadata %struct.block* %97, metadata !851, metadata !DIExpression()), !dbg !857
  call void @llvm.dbg.value(metadata %struct.block* %curr.03039, metadata !847, metadata !DIExpression()), !dbg !858
  %104 = ptrtoint %struct.block* %97 to i64, !dbg !859
  %105 = xor i64 %_msld51, -1, !dbg !859
  %106 = and i64 %105, %104, !dbg !859
  %107 = icmp eq i64 %106, 0, !dbg !859
  %108 = icmp ne i64 %_msld51, 0, !dbg !859
  %_msprop_icmp52 = and i1 %108, %107, !dbg !859
  br i1 %_msprop_icmp52, label %109, label %110, !dbg !861, !prof !98

; <label>:109:                                    ; preds = %96
  store i32 %103, i32* @__msan_origin_tls, align 4, !dbg !861
  call void @__msan_warning_noreturn() #5, !dbg !861
  call void asm sideeffect "", ""() #5, !dbg !861
  unreachable, !dbg !861

; <label>:110:                                    ; preds = %96
  %cmp8 = icmp eq %struct.block* %97, null, !dbg !859
  br i1 %cmp8, label %return.loopexit, label %for.body, !dbg !861, !llvm.loop !879

return.loopexit:                                  ; preds = %110
  br label %return, !dbg !889

return:                                           ; preds = %return.loopexit, %21, %91, %55, %39
  %_msphi_o = phi i32 [ %1, %39 ], [ %1, %55 ], [ %1, %91 ], [ 0, %21 ], [ 0, %return.loopexit ], !dbg !890
  %retval.0 = phi %struct.block* [ %block, %39 ], [ %block, %55 ], [ %block, %91 ], [ null, %21 ], [ null, %return.loopexit ], !dbg !890
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !889
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !889
  ret %struct.block* %retval.0, !dbg !889
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @get_min_status(%struct.block* nocapture readonly %block) unnamed_addr #0 !dbg !891 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !894
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !893, metadata !DIExpression()), !dbg !894
  %_mscmp = icmp eq i64 %0, 0, !dbg !895
  br i1 %_mscmp, label %3, label %1, !dbg !895, !prof !93

; <label>:1:                                      ; preds = %entry
  %2 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !894
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !895
  call void @__msan_warning_noreturn() #5, !dbg !895
  call void asm sideeffect "", ""() #5, !dbg !895
  unreachable, !dbg !895

; <label>:3:                                      ; preds = %entry
  %header = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 0, !dbg !895
  %4 = load i64, i64* %header, align 8, !dbg !895, !tbaa !224
  %5 = ptrtoint %struct.block* %block to i64, !dbg !896
  %6 = xor i64 %5, 87960930222080, !dbg !896
  %7 = inttoptr i64 %6 to i64*, !dbg !896
  %8 = add i64 %6, 17592186044416, !dbg !896
  %9 = inttoptr i64 %8 to i32*, !dbg !896
  %_msld = load i64, i64* %7, align 8, !dbg !896
  %10 = load i32, i32* %9, align 8, !dbg !896
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !896
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !896
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !896
  %call = call fastcc zeroext i1 @extract_min_status(i64 %4), !dbg !896
  ret i1 %call, !dbg !897
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull i64* @header_to_footer(%struct.block* readonly %block) unnamed_addr #0 !dbg !898 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !901
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !901
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !900, metadata !DIExpression()), !dbg !901
  %2 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, !dbg !902
  %arraydecay = bitcast %union.anon* %2 to i8*, !dbg !903
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !904
  %call = call fastcc i64 @get_size(%struct.block* %block), !dbg !904
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !905
  %3 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !905
  %_msprop = or i64 %_msret, %0, !dbg !905
  %4 = icmp eq i64 %_msret, 0, !dbg !905
  %5 = select i1 %4, i32 %1, i32 %3, !dbg !905
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i64 %call, !dbg !905
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 -16, !dbg !906
  %6 = bitcast i8* %add.ptr1 to i64*, !dbg !907
  store i64 %_msprop, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !908
  store i32 %5, i32* @__msan_retval_origin_tls, align 4, !dbg !908
  ret i64* %6, !dbg !908
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @extract_min_status(i64 %word) unnamed_addr #0 !dbg !909 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !912
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !912
  call void @llvm.dbg.value(metadata i64 %word, metadata !911, metadata !DIExpression()), !dbg !912
  %2 = and i64 %0, 4, !dbg !913
  %shr = and i64 %word, 4, !dbg !913
  %3 = xor i64 %2, -1, !dbg !914
  %4 = and i64 %shr, %3, !dbg !914
  %5 = icmp eq i64 %4, 0, !dbg !914
  %6 = icmp ne i64 %2, 0, !dbg !914
  %_msprop_icmp = and i1 %6, %5, !dbg !914
  %tobool = icmp ne i64 %shr, 0, !dbg !914
  store i1 %_msprop_icmp, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !915
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !915
  ret i1 %tobool, !dbg !915
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc zeroext i1 @extract_alloc_prev(i64 %word) unnamed_addr #0 !dbg !916 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !919
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !919
  call void @llvm.dbg.value(metadata i64 %word, metadata !918, metadata !DIExpression()), !dbg !919
  %2 = and i64 %0, 2, !dbg !920
  %shr = and i64 %word, 2, !dbg !920
  %3 = xor i64 %2, -1, !dbg !921
  %4 = and i64 %shr, %3, !dbg !921
  %5 = icmp eq i64 %4, 0, !dbg !921
  %6 = icmp ne i64 %2, 0, !dbg !921
  %_msprop_icmp = and i1 %6, %5, !dbg !921
  %tobool = icmp ne i64 %shr, 0, !dbg !921
  store i1 %_msprop_icmp, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !922
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !922
  ret i1 %tobool, !dbg !922
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @find_prev(%struct.block* readonly %block) unnamed_addr #0 !dbg !923 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !927
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !927
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !925, metadata !DIExpression()), !dbg !927
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !928
  %call = call fastcc i64* @find_prev_footer(%struct.block* %block), !dbg !928
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !929
  %2 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !929
  call void @llvm.dbg.value(metadata i64* %call, metadata !926, metadata !DIExpression()), !dbg !929
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !930
  store i32 %1, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !930
  store i1 false, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !930
  %call1 = call fastcc zeroext i1 @get_min_status(%struct.block* %block), !dbg !930
  %_msret9 = load i1, i1* bitcast ([100 x i64]* @__msan_retval_tls to i1*), align 8, !dbg !932
  br i1 %_msret9, label %3, label %5, !dbg !932, !prof !98

; <label>:3:                                      ; preds = %entry
  %4 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !932
  store i32 %4, i32* @__msan_origin_tls, align 4, !dbg !932
  call void @__msan_warning_noreturn() #5, !dbg !932
  call void asm sideeffect "", ""() #5, !dbg !932
  unreachable, !dbg !932

; <label>:5:                                      ; preds = %entry
  br i1 %call1, label %if.then, label %if.end, !dbg !932

if.then:                                          ; preds = %5
  store i64 %_msret, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !933
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !933
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !933
  %call2 = call fastcc %struct.block* @min_footer_to_header(i64* nonnull %call), !dbg !933
  %_msret10 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !935
  %6 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !935
  br label %return, !dbg !935

if.end:                                           ; preds = %5
  %_mscmp13 = icmp eq i64 %_msret, 0, !dbg !936
  br i1 %_mscmp13, label %8, label %7, !dbg !936, !prof !93

; <label>:7:                                      ; preds = %if.end
  store i32 %2, i32* @__msan_origin_tls, align 4, !dbg !936
  call void @__msan_warning_noreturn() #5, !dbg !936
  call void asm sideeffect "", ""() #5, !dbg !936
  unreachable, !dbg !936

; <label>:8:                                      ; preds = %if.end
  %9 = load i64, i64* %call, align 8, !dbg !936, !tbaa !94
  %10 = ptrtoint i64* %call to i64, !dbg !938
  %11 = xor i64 %10, 87960930222080, !dbg !938
  %12 = inttoptr i64 %11 to i64*, !dbg !938
  %13 = add i64 %11, 17592186044416, !dbg !938
  %14 = inttoptr i64 %13 to i32*, !dbg !938
  %_msld = load i64, i64* %12, align 8, !dbg !938
  %15 = load i32, i32* %14, align 8, !dbg !938
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !938
  store i32 %15, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !938
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !938
  %call3 = call fastcc i64 @extract_size(i64 %9), !dbg !938
  %_msret11 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !939
  %16 = xor i64 %_msret11, -1, !dbg !939
  %17 = and i64 %call3, %16, !dbg !939
  %18 = icmp eq i64 %17, 0, !dbg !939
  %19 = icmp ne i64 %_msret11, 0, !dbg !939
  %_msprop_icmp = and i1 %19, %18, !dbg !939
  br i1 %_msprop_icmp, label %20, label %22, !dbg !940, !prof !98

; <label>:20:                                     ; preds = %8
  %21 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !939
  store i32 %21, i32* @__msan_origin_tls, align 4, !dbg !940
  call void @__msan_warning_noreturn() #5, !dbg !940
  call void asm sideeffect "", ""() #5, !dbg !940
  unreachable, !dbg !940

; <label>:22:                                     ; preds = %8
  %cmp = icmp eq i64 %call3, 0, !dbg !939
  br i1 %cmp, label %return, label %if.end5, !dbg !940

if.end5:                                          ; preds = %22
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !941
  store i32 %2, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !941
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !941
  %call6 = call fastcc %struct.block* @footer_to_header(i64* nonnull %call), !dbg !941
  %_msret12 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !942
  %23 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !942
  br label %return, !dbg !942

return:                                           ; preds = %22, %if.end5, %if.then
  %_msphi_s = phi i64 [ %_msret10, %if.then ], [ %_msret12, %if.end5 ], [ 0, %22 ], !dbg !943
  %_msphi_o = phi i32 [ %6, %if.then ], [ %23, %if.end5 ], [ 0, %22 ], !dbg !943
  %retval.0 = phi %struct.block* [ %call2, %if.then ], [ %call6, %if.end5 ], [ null, %22 ], !dbg !943
  store i64 %_msphi_s, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !944
  store i32 %_msphi_o, i32* @__msan_retval_origin_tls, align 4, !dbg !944
  ret %struct.block* %retval.0, !dbg !944
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull %struct.block* @min_footer_to_header(i64* readnone %footer) unnamed_addr #0 !dbg !945 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !950
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !950
  call void @llvm.dbg.value(metadata i64* %footer, metadata !949, metadata !DIExpression()), !dbg !950
  %add.ptr13 = getelementptr inbounds i64, i64* %footer, i64 -1, !dbg !951
  %2 = bitcast i64* %add.ptr13 to %struct.block*, !dbg !952
  store i64 %0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !953
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !953
  ret %struct.block* %2, !dbg !953
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc nonnull %struct.block* @footer_to_header(i64* readonly %footer) unnamed_addr #0 !dbg !954 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !958
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !958
  call void @llvm.dbg.value(metadata i64* %footer, metadata !956, metadata !DIExpression()), !dbg !958
  %_mscmp = icmp eq i64 %0, 0, !dbg !959
  br i1 %_mscmp, label %3, label %2, !dbg !959, !prof !93

; <label>:2:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !959
  call void @__msan_warning_noreturn() #5, !dbg !959
  call void asm sideeffect "", ""() #5, !dbg !959
  unreachable, !dbg !959

; <label>:3:                                      ; preds = %entry
  %4 = load i64, i64* %footer, align 8, !dbg !959, !tbaa !94
  %5 = ptrtoint i64* %footer to i64, !dbg !960
  %6 = xor i64 %5, 87960930222080, !dbg !960
  %7 = inttoptr i64 %6 to i64*, !dbg !960
  %8 = add i64 %6, 17592186044416, !dbg !960
  %9 = inttoptr i64 %8 to i32*, !dbg !960
  %_msld = load i64, i64* %7, align 8, !dbg !960
  %10 = load i32, i32* %9, align 8, !dbg !960
  store i64 %_msld, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !960
  store i32 %10, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !960
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !960
  %call = call fastcc i64 @extract_size(i64 %4), !dbg !960
  %_msret = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !961
  %11 = load i32, i32* @__msan_retval_origin_tls, align 4, !dbg !961
  call void @llvm.dbg.value(metadata i64 %call, metadata !957, metadata !DIExpression()), !dbg !961
  %add.ptr3 = getelementptr inbounds i64, i64* %footer, i64 1, !dbg !962
  %add.ptr = bitcast i64* %add.ptr3 to i8*, !dbg !962
  %12 = icmp eq i64 %_msret, 0, !dbg !963
  %idx.neg = sub i64 0, %call, !dbg !963
  %13 = select i1 %12, i32 %1, i32 %11, !dbg !963
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i64 %idx.neg, !dbg !963
  %14 = bitcast i8* %add.ptr1 to %struct.block*, !dbg !964
  store i32 %13, i32* @__msan_retval_origin_tls, align 4, !dbg !965
  ret %struct.block* %14, !dbg !965
}

; Function Attrs: noinline nounwind sanitize_memory uwtable
define internal fastcc %struct.block* @min_block_insertion(%struct.block* returned %block) unnamed_addr #0 !dbg !966 {
entry:
  %0 = load i64, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_param_tls, i64 0, i64 0), align 8, !dbg !969
  %1 = load i32, i32* getelementptr inbounds ([200 x i32], [200 x i32]* @__msan_param_origin_tls, i64 0, i64 0), align 4, !dbg !969
  call void @llvm.dbg.value(metadata %struct.block* %block, metadata !968, metadata !DIExpression()), !dbg !969
  %2 = load i64, i64* bitcast ([15 x %struct.block*]* @list_heads to i64*), align 16, !dbg !970, !tbaa !85
  %_msld = load i64, i64* inttoptr (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080) to i64*), align 16, !dbg !971
  %3 = load i32, i32* inttoptr (i64 add (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080), i64 17592186044416) to i32*), align 16, !dbg !971
  %4 = getelementptr inbounds %struct.block, %struct.block* %block, i64 0, i32 1, !dbg !971
  %5 = bitcast %union.anon* %4 to i64*, !dbg !972
  %_mscmp = icmp eq i64 %0, 0, !dbg !972
  br i1 %_mscmp, label %7, label %6, !dbg !972, !prof !93

; <label>:6:                                      ; preds = %entry
  store i32 %1, i32* @__msan_origin_tls, align 4, !dbg !972
  call void @__msan_warning_noreturn() #5, !dbg !972
  call void asm sideeffect "", ""() #5, !dbg !972
  unreachable, !dbg !972

; <label>:7:                                      ; preds = %entry
  %8 = ptrtoint %union.anon* %4 to i64, !dbg !972
  %9 = xor i64 %8, 87960930222080, !dbg !972
  %10 = inttoptr i64 %9 to i64*, !dbg !972
  store i64 %_msld, i64* %10, align 8, !dbg !972
  %_mscmp3 = icmp eq i64 %_msld, 0, !dbg !972
  br i1 %_mscmp3, label %18, label %11, !dbg !972, !prof !93

; <label>:11:                                     ; preds = %7
  %12 = add i64 %9, 17592186044416, !dbg !972
  %13 = call i32 @__msan_chain_origin(i32 %3) #5, !dbg !972
  %14 = zext i32 %13 to i64, !dbg !972
  %15 = shl nuw i64 %14, 32, !dbg !972
  %16 = or i64 %15, %14, !dbg !972
  %17 = inttoptr i64 %12 to i64*, !dbg !972
  store i64 %16, i64* %17, align 8, !dbg !972
  br label %18, !dbg !972

; <label>:18:                                     ; preds = %7, %11
  store i64 %2, i64* %5, align 8, !dbg !972, !tbaa !166
  store i64 0, i64* inttoptr (i64 xor (i64 ptrtoint ([15 x %struct.block*]* @list_heads to i64), i64 87960930222080) to i64*), align 16, !dbg !973
  br i1 false, label %19, label %20, !dbg !973, !prof !98

; <label>:19:                                     ; preds = %18
  br label %20, !dbg !973

; <label>:20:                                     ; preds = %18, %19
  store %struct.block* %block, %struct.block** getelementptr inbounds ([15 x %struct.block*], [15 x %struct.block*]* @list_heads, i64 0, i64 0), align 16, !dbg !973, !tbaa !85
  store i64 0, i64* getelementptr inbounds ([100 x i64], [100 x i64]* @__msan_retval_tls, i64 0, i64 0), align 8, !dbg !974
  store i32 %1, i32* @__msan_retval_origin_tls, align 4, !dbg !974
  ret %struct.block* %block, !dbg !974
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

declare void @__msan_init() local_unnamed_addr

define internal void @msan.module_ctor() {
  tail call void @__msan_init()
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #4

declare i32 @__msan_chain_origin(i32)

declare i8* @__msan_memmove(i8*, i8*, i64)

declare i8* @__msan_memcpy(i8*, i8*, i64)

declare i8* @__msan_memset(i8*, i32, i64)

declare void @__msan_warning_noreturn()

declare void @__msan_maybe_warning_1(i8, i32)

declare void @__msan_maybe_store_origin_1(i8, i8*, i32)

declare void @__msan_maybe_warning_2(i16, i32)

declare void @__msan_maybe_store_origin_2(i16, i8*, i32)

declare void @__msan_maybe_warning_4(i32, i32)

declare void @__msan_maybe_store_origin_4(i32, i8*, i32)

declare void @__msan_maybe_warning_8(i64, i32)

declare void @__msan_maybe_store_origin_8(i64, i8*, i32)

declare void @__msan_set_alloca_origin4(i8*, i64, i8*, i64)

declare void @__msan_poison_stack(i8*, i64)

attributes #0 = { noinline nounwind sanitize_memory uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="true" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!89 = !DILocation(line: 850, column: 28, scope: !65)
!90 = !DILocation(line: 850, column: 13, scope: !65)
!91 = !DILocation(line: 851, column: 25, scope: !92)
!92 = distinct !DILexicalBlock(scope: !65, file: !3, line: 851, column: 9)
!93 = !{!"branch_weights", i32 1000, i32 1}
!94 = !{!95, !95, i64 0}
!95 = !{!"long", !87, i64 0}
!96 = !DILocation(line: 851, column: 11, scope: !92)
!97 = !DILocation(line: 851, column: 40, scope: !92)
!98 = !{!"branch_weights", i32 1, i32 1000}
!99 = !DILocation(line: 851, column: 43, scope: !92)
!100 = !DILocation(line: 851, column: 71, scope: !92)
!101 = !DILocation(line: 851, column: 9, scope: !65)
!102 = !DILocation(line: 856, column: 14, scope: !65)
!103 = !DILocation(line: 854, column: 12, scope: !65)
!104 = !DILocation(line: 857, column: 30, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !3, line: 857, column: 5)
!106 = distinct !DILexicalBlock(scope: !65, file: !3, line: 857, column: 5)
!107 = !DILocation(line: 857, column: 46, scope: !105)
!108 = !DILocation(line: 0, scope: !109)
!109 = distinct !DILexicalBlock(scope: !65, file: !3, line: 886, column: 9)
!110 = !DILocation(line: 857, column: 5, scope: !106)
!111 = !DILocation(line: 867, column: 29, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !3, line: 867, column: 13)
!113 = distinct !DILexicalBlock(scope: !105, file: !3, line: 857, column: 77)
!114 = !DILocation(line: 867, column: 34, scope: !112)
!115 = !DILocation(line: 867, column: 13, scope: !113)
!116 = !DILocation(line: 872, column: 13, scope: !113)
!117 = !DILocation(line: 874, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !3, line: 872, column: 32)
!119 = distinct !DILexicalBlock(scope: !113, file: !3, line: 872, column: 13)
!120 = !DILocation(line: 873, column: 23, scope: !118)
!121 = !DILocation(line: 855, column: 10, scope: !65)
!122 = !DILocation(line: 880, column: 9, scope: !118)
!123 = !DILocation(line: 0, scope: !118)
!124 = !DILocation(line: 0, scope: !125)
!125 = distinct !DILexicalBlock(scope: !126, file: !3, line: 877, column: 20)
!126 = distinct !DILexicalBlock(scope: !118, file: !3, line: 874, column: 17)
!127 = !DILocation(line: 857, column: 59, scope: !105)
!128 = distinct !{!128, !110, !129}
!129 = !DILocation(line: 884, column: 5, scope: !106)
!130 = !DILocation(line: 886, column: 28, scope: !109)
!131 = !DILocation(line: 899, column: 25, scope: !79)
!132 = !DILocation(line: 898, column: 17, scope: !77)
!133 = !DILocation(line: 897, column: 12, scope: !65)
!134 = !DILocation(line: 899, column: 18, scope: !79)
!135 = !DILocation(line: 900, column: 9, scope: !79)
!136 = !DILocation(line: 901, column: 23, scope: !82)
!137 = !DILocation(line: 901, column: 41, scope: !138)
!138 = distinct !DILexicalBlock(scope: !82, file: !3, line: 901, column: 9)
!139 = !DILocation(line: 901, column: 9, scope: !82)
!140 = !DILocation(line: 903, column: 39, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !3, line: 901, column: 69)
!142 = !DILocation(line: 903, column: 13, scope: !141)
!143 = !DILocation(line: 905, column: 37, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !3, line: 905, column: 17)
!145 = !DILocation(line: 905, column: 22, scope: !144)
!146 = !DILocation(line: 905, column: 19, scope: !144)
!147 = !DILocation(line: 905, column: 17, scope: !141)
!148 = !DILocation(line: 909, column: 22, scope: !141)
!149 = !DILocation(line: 910, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !141, file: !3, line: 910, column: 17)
!151 = !DILocation(line: 910, column: 17, scope: !141)
!152 = !DILocation(line: 914, column: 35, scope: !153)
!153 = distinct !DILexicalBlock(scope: !141, file: !3, line: 914, column: 17)
!154 = !DILocation(line: 914, column: 24, scope: !153)
!155 = !DILocation(line: 914, column: 22, scope: !153)
!156 = !DILocation(line: 914, column: 49, scope: !153)
!157 = !DILocation(line: 915, column: 35, scope: !153)
!158 = !DILocation(line: 915, column: 24, scope: !153)
!159 = !DILocation(line: 915, column: 22, scope: !153)
!160 = !DILocation(line: 914, column: 17, scope: !141)
!161 = !DILocation(line: 919, column: 22, scope: !162)
!162 = distinct !DILexicalBlock(scope: !141, file: !3, line: 919, column: 17)
!163 = !DILocation(line: 919, column: 30, scope: !162)
!164 = !DILocation(line: 901, column: 63, scope: !138)
!165 = !DILocation(line: 919, column: 39, scope: !162)
!166 = !{!87, !87, i64 0}
!167 = !DILocation(line: 919, column: 44, scope: !162)
!168 = !DILocation(line: 919, column: 52, scope: !162)
!169 = !DILocation(line: 920, column: 17, scope: !162)
!170 = !DILocation(line: 920, column: 38, scope: !162)
!171 = !DILocation(line: 919, column: 17, scope: !141)
!172 = !DILocation(line: 921, column: 43, scope: !173)
!173 = distinct !DILexicalBlock(scope: !174, file: !3, line: 921, column: 21)
!174 = distinct !DILexicalBlock(scope: !162, file: !3, line: 920, column: 56)
!175 = !DILocation(line: 921, column: 28, scope: !173)
!176 = !DILocation(line: 921, column: 21, scope: !174)
!177 = distinct !{!177, !139, !178}
!178 = !DILocation(line: 926, column: 9, scope: !82)
!179 = !DILocation(line: 898, column: 33, scope: !80)
!180 = !DILocation(line: 0, scope: !141)
!181 = !DILocation(line: 898, column: 5, scope: !77)
!182 = !DILocation(line: 898, column: 26, scope: !80)
!183 = distinct !{!183, !181, !184}
!184 = !DILocation(line: 927, column: 5, scope: !77)
!185 = !DILocation(line: 929, column: 19, scope: !186)
!186 = distinct !DILexicalBlock(scope: !65, file: !3, line: 929, column: 9)
!187 = !DILocation(line: 936, column: 5, scope: !65)
!188 = !DILocation(line: 937, column: 1, scope: !65)
!189 = !DILocation(line: 0, scope: !190)
!190 = distinct !DILexicalBlock(scope: !92, file: !3, line: 851, column: 78)
!191 = distinct !DISubprogram(name: "find_prev_footer", scope: !3, file: !3, line: 630, type: !192, isLocal: true, isDefinition: true, scopeLine: 630, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !194)
!192 = !DISubroutineType(types: !193)
!193 = !{!30, !7}
!194 = !{!195}
!195 = !DILocalVariable(name: "block", arg: 1, scope: !191, file: !3, line: 630, type: !7)
!196 = !DILocation(line: 630, column: 42, scope: !191)
!197 = !DILocation(line: 632, column: 21, scope: !191)
!198 = !DILocation(line: 632, column: 29, scope: !191)
!199 = !DILocation(line: 632, column: 5, scope: !191)
!200 = distinct !DISubprogram(name: "extract_alloc", scope: !3, file: !3, line: 487, type: !201, isLocal: true, isDefinition: true, scopeLine: 487, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !203)
!201 = !DISubroutineType(types: !202)
!202 = !{!31, !12}
!203 = !{!204}
!204 = !DILocalVariable(name: "word", arg: 1, scope: !200, file: !3, line: 487, type: !12)
!205 = !DILocation(line: 487, column: 34, scope: !200)
!206 = !DILocation(line: 488, column: 24, scope: !200)
!207 = !DILocation(line: 488, column: 12, scope: !200)
!208 = !DILocation(line: 488, column: 5, scope: !200)
!209 = distinct !DISubprogram(name: "extract_size", scope: !3, file: !3, line: 264, type: !210, isLocal: true, isDefinition: true, scopeLine: 264, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !212)
!210 = !DISubroutineType(types: !211)
!211 = !{!39, !12}
!212 = !{!213}
!213 = !DILocalVariable(name: "word", arg: 1, scope: !209, file: !3, line: 264, type: !12)
!214 = !DILocation(line: 264, column: 35, scope: !209)
!215 = !DILocation(line: 265, column: 18, scope: !209)
!216 = !DILocation(line: 265, column: 5, scope: !209)
!217 = distinct !DISubprogram(name: "get_size", scope: !3, file: !3, line: 273, type: !218, isLocal: true, isDefinition: true, scopeLine: 273, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !220)
!218 = !DISubroutineType(types: !219)
!219 = !{!39, !7}
!220 = !{!221}
!221 = !DILocalVariable(name: "block", arg: 1, scope: !217, file: !3, line: 273, type: !7)
!222 = !DILocation(line: 273, column: 33, scope: !217)
!223 = !DILocation(line: 274, column: 32, scope: !217)
!224 = !{!225, !95, i64 0}
!225 = !{!"block", !95, i64 0, !87, i64 8}
!226 = !DILocation(line: 274, column: 12, scope: !217)
!227 = !DILocation(line: 274, column: 5, scope: !217)
!228 = distinct !DISubprogram(name: "get_alloc", scope: !3, file: !3, line: 496, type: !229, isLocal: true, isDefinition: true, scopeLine: 496, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !231)
!229 = !DISubroutineType(types: !230)
!230 = !{!31, !7}
!231 = !{!232}
!232 = !DILocalVariable(name: "block", arg: 1, scope: !228, file: !3, line: 496, type: !7)
!233 = !DILocation(line: 496, column: 32, scope: !228)
!234 = !DILocation(line: 497, column: 33, scope: !228)
!235 = !DILocation(line: 497, column: 12, scope: !228)
!236 = !DILocation(line: 497, column: 5, scope: !228)
!237 = distinct !DISubprogram(name: "find_next", scope: !3, file: !3, line: 585, type: !238, isLocal: true, isDefinition: true, scopeLine: 585, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !240)
!238 = !DISubroutineType(types: !239)
!239 = !{!7, !7}
!240 = !{!241}
!241 = !DILocalVariable(name: "block", arg: 1, scope: !237, file: !3, line: 585, type: !7)
!242 = !DILocation(line: 585, column: 36, scope: !237)
!243 = !DILocation(line: 589, column: 24, scope: !237)
!244 = !DILocation(line: 589, column: 40, scope: !237)
!245 = !DILocation(line: 589, column: 38, scope: !237)
!246 = !DILocation(line: 589, column: 12, scope: !237)
!247 = !DILocation(line: 589, column: 5, scope: !237)
!248 = distinct !DISubprogram(name: "find_size_list", scope: !3, file: !3, line: 219, type: !249, isLocal: true, isDefinition: true, scopeLine: 219, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !251)
!249 = !DISubroutineType(types: !250)
!250 = !{!39, !39}
!251 = !{!252}
!252 = !DILocalVariable(name: "size", arg: 1, scope: !248, file: !3, line: 219, type: !39)
!253 = !DILocation(line: 219, column: 37, scope: !248)
!254 = !DILocation(line: 220, column: 14, scope: !255)
!255 = distinct !DILexicalBlock(scope: !248, file: !3, line: 220, column: 9)
!256 = !DILocation(line: 220, column: 9, scope: !248)
!257 = !DILocation(line: 222, column: 21, scope: !258)
!258 = distinct !DILexicalBlock(scope: !255, file: !3, line: 222, column: 16)
!259 = !DILocation(line: 222, column: 16, scope: !255)
!260 = !DILocation(line: 224, column: 21, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !3, line: 224, column: 16)
!262 = !DILocation(line: 224, column: 16, scope: !258)
!263 = !DILocation(line: 226, column: 21, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !3, line: 226, column: 16)
!265 = !DILocation(line: 226, column: 16, scope: !261)
!266 = !DILocation(line: 228, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !3, line: 228, column: 16)
!268 = !DILocation(line: 228, column: 16, scope: !264)
!269 = !DILocation(line: 230, column: 21, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !3, line: 230, column: 16)
!271 = !DILocation(line: 230, column: 16, scope: !267)
!272 = !DILocation(line: 232, column: 21, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !3, line: 232, column: 16)
!274 = !DILocation(line: 232, column: 16, scope: !270)
!275 = !DILocation(line: 234, column: 21, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !3, line: 234, column: 16)
!277 = !DILocation(line: 234, column: 16, scope: !273)
!278 = !DILocation(line: 236, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !3, line: 236, column: 16)
!280 = !DILocation(line: 236, column: 16, scope: !276)
!281 = !DILocation(line: 238, column: 21, scope: !282)
!282 = distinct !DILexicalBlock(scope: !279, file: !3, line: 238, column: 16)
!283 = !DILocation(line: 238, column: 16, scope: !279)
!284 = !DILocation(line: 240, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !282, file: !3, line: 240, column: 16)
!286 = !DILocation(line: 240, column: 16, scope: !282)
!287 = !DILocation(line: 242, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !3, line: 242, column: 16)
!289 = !DILocation(line: 242, column: 16, scope: !285)
!290 = !DILocation(line: 244, column: 21, scope: !291)
!291 = distinct !DILexicalBlock(scope: !288, file: !3, line: 244, column: 16)
!292 = !DILocation(line: 244, column: 16, scope: !288)
!293 = !DILocation(line: 246, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !291, file: !3, line: 246, column: 16)
!295 = !DILocation(line: 247, column: 9, scope: !296)
!296 = distinct !DILexicalBlock(scope: !294, file: !3, line: 246, column: 29)
!297 = !DILocation(line: 0, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !3, line: 250, column: 10)
!299 = !DILocation(line: 253, column: 1, scope: !248)
!300 = distinct !DISubprogram(name: "mm_init", scope: !3, file: !3, line: 947, type: !301, isLocal: false, isDefinition: true, scopeLine: 947, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !303)
!301 = !DISubroutineType(types: !302)
!302 = !{!31}
!303 = !{!304, !305}
!304 = !DILocalVariable(name: "start", scope: !300, file: !3, line: 949, type: !30)
!305 = !DILocalVariable(name: "i", scope: !306, file: !3, line: 951, type: !39)
!306 = distinct !DILexicalBlock(scope: !300, file: !3, line: 951, column: 5)
!307 = !DILocation(line: 949, column: 32, scope: !300)
!308 = !DILocation(line: 949, column: 13, scope: !300)
!309 = !DILocation(line: 951, column: 17, scope: !306)
!310 = !DILocation(line: 952, column: 23, scope: !311)
!311 = distinct !DILexicalBlock(scope: !312, file: !3, line: 951, column: 37)
!312 = distinct !DILexicalBlock(scope: !306, file: !3, line: 951, column: 5)
!313 = !DILocation(line: 955, column: 15, scope: !314)
!314 = distinct !DILexicalBlock(scope: !300, file: !3, line: 955, column: 9)
!315 = !DILocation(line: 955, column: 9, scope: !300)
!316 = !DILocation(line: 949, column: 21, scope: !300)
!317 = !DILocation(line: 959, column: 16, scope: !300)
!318 = !DILocation(line: 959, column: 14, scope: !300)
!319 = !DILocation(line: 960, column: 16, scope: !300)
!320 = !DILocation(line: 960, column: 5, scope: !300)
!321 = !DILocation(line: 960, column: 14, scope: !300)
!322 = !DILocation(line: 963, column: 16, scope: !300)
!323 = !DILocation(line: 968, column: 9, scope: !324)
!324 = distinct !DILexicalBlock(scope: !300, file: !3, line: 968, column: 9)
!325 = !DILocation(line: 968, column: 32, scope: !324)
!326 = !DILocation(line: 969, column: 9, scope: !327)
!327 = distinct !DILexicalBlock(scope: !324, file: !3, line: 968, column: 41)
!328 = !DILocation(line: 0, scope: !300)
!329 = !DILocation(line: 973, column: 1, scope: !300)
!330 = distinct !DISubprogram(name: "pack", scope: !3, file: !3, line: 199, type: !331, isLocal: true, isDefinition: true, scopeLine: 199, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !333)
!331 = !DISubroutineType(types: !332)
!332 = !{!12, !39, !31, !31, !31}
!333 = !{!334, !335, !336, !337, !338}
!334 = !DILocalVariable(name: "size", arg: 1, scope: !330, file: !3, line: 199, type: !39)
!335 = !DILocalVariable(name: "alloc", arg: 2, scope: !330, file: !3, line: 199, type: !31)
!336 = !DILocalVariable(name: "prev_alloc", arg: 3, scope: !330, file: !3, line: 199, type: !31)
!337 = !DILocalVariable(name: "min_status", arg: 4, scope: !330, file: !3, line: 199, type: !31)
!338 = !DILocalVariable(name: "word", scope: !330, file: !3, line: 200, type: !12)
!339 = !DILocation(line: 199, column: 27, scope: !330)
!340 = !DILocation(line: 199, column: 38, scope: !330)
!341 = !DILocation(line: 199, column: 50, scope: !330)
!342 = !DILocation(line: 199, column: 67, scope: !330)
!343 = !DILocation(line: 200, column: 12, scope: !330)
!344 = !DILocation(line: 201, column: 9, scope: !330)
!345 = !DILocation(line: 205, column: 14, scope: !346)
!346 = distinct !DILexicalBlock(scope: !347, file: !3, line: 204, column: 21)
!347 = distinct !DILexicalBlock(scope: !330, file: !3, line: 204, column: 9)
!348 = !DILocation(line: 204, column: 9, scope: !330)
!349 = !DILocation(line: 208, column: 14, scope: !350)
!350 = distinct !DILexicalBlock(scope: !351, file: !3, line: 207, column: 21)
!351 = distinct !DILexicalBlock(scope: !330, file: !3, line: 207, column: 9)
!352 = !DILocation(line: 207, column: 9, scope: !330)
!353 = !DILocation(line: 210, column: 5, scope: !330)
!354 = distinct !DISubprogram(name: "extend_heap", scope: !3, file: !3, line: 738, type: !355, isLocal: true, isDefinition: true, scopeLine: 738, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !357)
!355 = !DISubroutineType(types: !356)
!356 = !{!7, !39}
!357 = !{!358, !359, !360, !361}
!358 = !DILocalVariable(name: "size", arg: 1, scope: !354, file: !3, line: 738, type: !39)
!359 = !DILocalVariable(name: "bp", scope: !354, file: !3, line: 739, type: !6)
!360 = !DILocalVariable(name: "block", scope: !354, file: !3, line: 755, type: !7)
!361 = !DILocalVariable(name: "block_next", scope: !354, file: !3, line: 760, type: !7)
!362 = !DILocation(line: 738, column: 36, scope: !354)
!363 = !DILocation(line: 741, column: 12, scope: !354)
!364 = !DILocation(line: 742, column: 15, scope: !365)
!365 = distinct !DILexicalBlock(scope: !354, file: !3, line: 742, column: 9)
!366 = !DILocation(line: 739, column: 11, scope: !354)
!367 = !DILocation(line: 742, column: 41, scope: !365)
!368 = !DILocation(line: 742, column: 9, scope: !354)
!369 = !DILocation(line: 755, column: 22, scope: !354)
!370 = !DILocation(line: 755, column: 14, scope: !354)
!371 = !DILocation(line: 757, column: 37, scope: !354)
!372 = !DILocation(line: 757, column: 5, scope: !354)
!373 = !DILocation(line: 760, column: 27, scope: !354)
!374 = !DILocation(line: 760, column: 14, scope: !354)
!375 = !DILocation(line: 762, column: 5, scope: !354)
!376 = !DILocation(line: 765, column: 13, scope: !354)
!377 = !DILocation(line: 768, column: 5, scope: !354)
!378 = !DILocation(line: 770, column: 5, scope: !354)
!379 = !DILocation(line: 0, scope: !354)
!380 = !DILocation(line: 771, column: 1, scope: !354)
!381 = distinct !DISubprogram(name: "mm_malloc", scope: !3, file: !3, line: 983, type: !382, isLocal: false, isDefinition: true, scopeLine: 983, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !384)
!382 = !DISubroutineType(types: !383)
!383 = !{!6, !39}
!384 = !{!385, !386, !387, !388, !389, !390, !391}
!385 = !DILocalVariable(name: "size", arg: 1, scope: !381, file: !3, line: 983, type: !39)
!386 = !DILocalVariable(name: "asize", scope: !381, file: !3, line: 987, type: !39)
!387 = !DILocalVariable(name: "extendsize", scope: !381, file: !3, line: 988, type: !39)
!388 = !DILocalVariable(name: "block", scope: !381, file: !3, line: 989, type: !7)
!389 = !DILocalVariable(name: "bp", scope: !381, file: !3, line: 990, type: !6)
!390 = !DILocalVariable(name: "block_size", scope: !381, file: !3, line: 1028, type: !39)
!391 = !DILocalVariable(name: "ne", scope: !381, file: !3, line: 1036, type: !7)
!392 = !DILocation(line: 983, column: 21, scope: !381)
!393 = !DILocation(line: 990, column: 11, scope: !381)
!394 = !DILocation(line: 993, column: 9, scope: !395)
!395 = distinct !DILexicalBlock(scope: !381, file: !3, line: 993, column: 9)
!396 = !DILocation(line: 993, column: 20, scope: !395)
!397 = !DILocation(line: 993, column: 9, scope: !381)
!398 = !DILocation(line: 994, column: 9, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !3, line: 993, column: 29)
!400 = !DILocation(line: 995, column: 5, scope: !399)
!401 = !DILocation(line: 998, column: 14, scope: !402)
!402 = distinct !DILexicalBlock(scope: !381, file: !3, line: 998, column: 9)
!403 = !DILocation(line: 998, column: 9, scope: !381)
!404 = !DILocation(line: 1005, column: 31, scope: !381)
!405 = !DILocation(line: 1005, column: 17, scope: !381)
!406 = !DILocation(line: 1005, column: 13, scope: !381)
!407 = !DILocation(line: 987, column: 12, scope: !381)
!408 = !DILocation(line: 1008, column: 13, scope: !381)
!409 = !DILocation(line: 989, column: 14, scope: !381)
!410 = !DILocation(line: 1011, column: 15, scope: !411)
!411 = distinct !DILexicalBlock(scope: !381, file: !3, line: 1011, column: 9)
!412 = !DILocation(line: 1011, column: 9, scope: !381)
!413 = !DILocation(line: 1013, column: 22, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !3, line: 1011, column: 24)
!415 = !DILocation(line: 988, column: 12, scope: !381)
!416 = !DILocation(line: 1014, column: 17, scope: !414)
!417 = !DILocation(line: 1016, column: 19, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !3, line: 1016, column: 13)
!419 = !DILocation(line: 1016, column: 13, scope: !414)
!420 = !DILocation(line: 0, scope: !381)
!421 = !DILocation(line: 1025, column: 5, scope: !381)
!422 = !DILocation(line: 1028, column: 25, scope: !381)
!423 = !DILocation(line: 1028, column: 12, scope: !381)
!424 = !DILocation(line: 1029, column: 42, scope: !381)
!425 = !DILocation(line: 1029, column: 5, scope: !381)
!426 = !DILocation(line: 1032, column: 5, scope: !381)
!427 = !DILocation(line: 1034, column: 10, scope: !381)
!428 = !DILocation(line: 1036, column: 19, scope: !381)
!429 = !DILocation(line: 1036, column: 14, scope: !381)
!430 = !DILocation(line: 1037, column: 9, scope: !431)
!431 = distinct !DILexicalBlock(scope: !381, file: !3, line: 1037, column: 9)
!432 = !DILocation(line: 1037, column: 23, scope: !431)
!433 = !DILocation(line: 1037, column: 26, scope: !431)
!434 = !DILocation(line: 1037, column: 39, scope: !431)
!435 = !DILocation(line: 1037, column: 9, scope: !381)
!436 = !DILocation(line: 1038, column: 9, scope: !437)
!437 = distinct !DILexicalBlock(scope: !431, file: !3, line: 1037, column: 45)
!438 = !DILocation(line: 1039, column: 5, scope: !437)
!439 = !DILocation(line: 1044, column: 1, scope: !381)
!440 = distinct !DISubprogram(name: "max", scope: !3, file: !3, line: 171, type: !441, isLocal: true, isDefinition: true, scopeLine: 171, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !443)
!441 = !DISubroutineType(types: !442)
!442 = !{!39, !39, !39}
!443 = !{!444, !445}
!444 = !DILocalVariable(name: "x", arg: 1, scope: !440, file: !3, line: 171, type: !39)
!445 = !DILocalVariable(name: "y", arg: 2, scope: !440, file: !3, line: 171, type: !39)
!446 = !DILocation(line: 171, column: 26, scope: !440)
!447 = !DILocation(line: 171, column: 36, scope: !440)
!448 = !DILocation(line: 172, column: 15, scope: !440)
!449 = !DILocation(line: 172, column: 12, scope: !440)
!450 = !DILocation(line: 172, column: 5, scope: !440)
!451 = distinct !DISubprogram(name: "round_up", scope: !3, file: !3, line: 181, type: !441, isLocal: true, isDefinition: true, scopeLine: 181, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !452)
!452 = !{!453, !454}
!453 = !DILocalVariable(name: "size", arg: 1, scope: !451, file: !3, line: 181, type: !39)
!454 = !DILocalVariable(name: "n", arg: 2, scope: !451, file: !3, line: 181, type: !39)
!455 = !DILocation(line: 181, column: 31, scope: !451)
!456 = !DILocation(line: 181, column: 44, scope: !451)
!457 = !DILocation(line: 182, column: 23, scope: !451)
!458 = !DILocation(line: 182, column: 14, scope: !451)
!459 = !DILocation(line: 182, column: 5, scope: !451)
!460 = distinct !DISubprogram(name: "find_fit", scope: !3, file: !3, line: 809, type: !355, isLocal: true, isDefinition: true, scopeLine: 809, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !461)
!461 = !{!462, !463, !464, !465, !466, !467, !468}
!462 = !DILocalVariable(name: "asize", arg: 1, scope: !460, file: !3, line: 809, type: !39)
!463 = !DILocalVariable(name: "index", scope: !460, file: !3, line: 811, type: !39)
!464 = !DILocalVariable(name: "count", scope: !460, file: !3, line: 812, type: !39)
!465 = !DILocalVariable(name: "best", scope: !460, file: !3, line: 813, type: !7)
!466 = !DILocalVariable(name: "diff", scope: !460, file: !3, line: 814, type: !39)
!467 = !DILocalVariable(name: "d", scope: !460, file: !3, line: 815, type: !39)
!468 = !DILocalVariable(name: "curr", scope: !469, file: !3, line: 818, type: !7)
!469 = distinct !DILexicalBlock(scope: !470, file: !3, line: 818, column: 9)
!470 = distinct !DILexicalBlock(scope: !460, file: !3, line: 816, column: 24)
!471 = !DILocation(line: 809, column: 33, scope: !460)
!472 = !DILocation(line: 811, column: 20, scope: !460)
!473 = !DILocation(line: 811, column: 12, scope: !460)
!474 = !DILocation(line: 812, column: 12, scope: !460)
!475 = !DILocation(line: 813, column: 14, scope: !460)
!476 = !DILocation(line: 814, column: 12, scope: !460)
!477 = !DILocation(line: 815, column: 12, scope: !460)
!478 = !DILocation(line: 816, column: 18, scope: !460)
!479 = !DILocation(line: 816, column: 5, scope: !460)
!480 = !DILocation(line: 818, column: 30, scope: !469)
!481 = !DILocation(line: 832, column: 14, scope: !470)
!482 = distinct !{!482, !479, !483}
!483 = !DILocation(line: 833, column: 5, scope: !460)
!484 = !DILocation(line: 818, column: 23, scope: !469)
!485 = !DILocation(line: 0, scope: !486)
!486 = distinct !DILexicalBlock(scope: !469, file: !3, line: 818, column: 9)
!487 = !DILocation(line: 818, column: 54, scope: !486)
!488 = !DILocation(line: 818, column: 9, scope: !469)
!489 = !DILocation(line: 820, column: 18, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !3, line: 819, column: 33)
!491 = !DILocation(line: 821, column: 17, scope: !490)
!492 = !DILocation(line: 822, column: 23, scope: !493)
!493 = distinct !DILexicalBlock(scope: !490, file: !3, line: 822, column: 17)
!494 = !DILocation(line: 822, column: 41, scope: !493)
!495 = !DILocation(line: 822, column: 50, scope: !493)
!496 = !DILocation(line: 822, column: 61, scope: !493)
!497 = !DILocation(line: 822, column: 58, scope: !493)
!498 = !DILocation(line: 0, scope: !460)
!499 = !DILocation(line: 819, column: 27, scope: !486)
!500 = !DILocation(line: 818, column: 71, scope: !486)
!501 = !DILocation(line: 818, column: 62, scope: !486)
!502 = distinct !{!502, !488, !503}
!503 = !DILocation(line: 826, column: 9, scope: !469)
!504 = !DILocation(line: 827, column: 18, scope: !505)
!505 = distinct !DILexicalBlock(scope: !470, file: !3, line: 827, column: 13)
!506 = !DILocation(line: 827, column: 13, scope: !470)
!507 = !DILocation(line: 835, column: 1, scope: !460)
!508 = distinct !DISubprogram(name: "block_removal", scope: !3, file: !3, line: 435, type: !238, isLocal: true, isDefinition: true, scopeLine: 435, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !509)
!509 = !{!510, !511}
!510 = !DILocalVariable(name: "block", arg: 1, scope: !508, file: !3, line: 435, type: !7)
!511 = !DILocalVariable(name: "index", scope: !508, file: !3, line: 441, type: !39)
!512 = !DILocation(line: 435, column: 40, scope: !508)
!513 = !DILocation(line: 437, column: 9, scope: !514)
!514 = distinct !DILexicalBlock(scope: !508, file: !3, line: 437, column: 9)
!515 = !DILocation(line: 437, column: 25, scope: !514)
!516 = !DILocation(line: 437, column: 9, scope: !508)
!517 = !DILocation(line: 438, column: 16, scope: !518)
!518 = distinct !DILexicalBlock(scope: !514, file: !3, line: 437, column: 44)
!519 = !DILocation(line: 438, column: 9, scope: !518)
!520 = !DILocation(line: 441, column: 20, scope: !508)
!521 = !DILocation(line: 441, column: 12, scope: !508)
!522 = !DILocation(line: 447, column: 18, scope: !523)
!523 = distinct !DILexicalBlock(scope: !508, file: !3, line: 447, column: 9)
!524 = !DILocation(line: 447, column: 15, scope: !523)
!525 = !DILocation(line: 447, column: 36, scope: !523)
!526 = !DILocation(line: 463, column: 21, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !3, line: 463, column: 14)
!528 = distinct !DILexicalBlock(scope: !523, file: !3, line: 454, column: 14)
!529 = !DILocation(line: 447, column: 58, scope: !523)
!530 = !DILocation(line: 447, column: 63, scope: !523)
!531 = !DILocation(line: 447, column: 9, scope: !508)
!532 = !DILocation(line: 450, column: 27, scope: !533)
!533 = distinct !DILexicalBlock(scope: !523, file: !3, line: 447, column: 72)
!534 = !DILocation(line: 449, column: 21, scope: !533)
!535 = !DILocation(line: 452, column: 5, scope: !533)
!536 = !DILocation(line: 0, scope: !528)
!537 = !DILocation(line: 454, column: 51, scope: !528)
!538 = !DILocation(line: 454, column: 56, scope: !528)
!539 = !DILocation(line: 454, column: 64, scope: !528)
!540 = !DILocation(line: 455, column: 21, scope: !528)
!541 = !DILocation(line: 454, column: 14, scope: !523)
!542 = !DILocation(line: 456, column: 48, scope: !543)
!543 = distinct !DILexicalBlock(scope: !528, file: !3, line: 455, column: 35)
!544 = !DILocation(line: 456, column: 27, scope: !543)
!545 = !DILocation(line: 457, column: 28, scope: !543)
!546 = !DILocation(line: 457, column: 33, scope: !543)
!547 = !DILocation(line: 461, column: 5, scope: !543)
!548 = !DILocation(line: 459, column: 21, scope: !543)
!549 = !DILocation(line: 463, column: 26, scope: !527)
!550 = !DILocation(line: 463, column: 34, scope: !527)
!551 = !DILocation(line: 471, column: 36, scope: !552)
!552 = distinct !DILexicalBlock(scope: !527, file: !3, line: 470, column: 10)
!553 = !DILocation(line: 463, column: 44, scope: !527)
!554 = !DILocation(line: 463, column: 49, scope: !527)
!555 = !DILocation(line: 463, column: 14, scope: !528)
!556 = !DILocation(line: 465, column: 22, scope: !557)
!557 = distinct !DILexicalBlock(scope: !527, file: !3, line: 463, column: 58)
!558 = !DILocation(line: 465, column: 27, scope: !557)
!559 = !DILocation(line: 466, column: 21, scope: !557)
!560 = !DILocation(line: 468, column: 5, scope: !557)
!561 = !DILocation(line: 471, column: 22, scope: !552)
!562 = !DILocation(line: 471, column: 27, scope: !552)
!563 = !DILocation(line: 472, column: 36, scope: !552)
!564 = !DILocation(line: 472, column: 16, scope: !552)
!565 = !DILocation(line: 472, column: 22, scope: !552)
!566 = !DILocation(line: 472, column: 27, scope: !552)
!567 = !DILocation(line: 474, column: 21, scope: !552)
!568 = distinct !DISubprogram(name: "write_block", scope: !3, file: !3, line: 607, type: !569, isLocal: true, isDefinition: true, scopeLine: 608, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !571)
!569 = !DISubroutineType(types: !570)
!570 = !{null, !7, !39, !31, !31}
!571 = !{!572, !573, !574, !575, !576, !579}
!572 = !DILocalVariable(name: "block", arg: 1, scope: !568, file: !3, line: 607, type: !7)
!573 = !DILocalVariable(name: "size", arg: 2, scope: !568, file: !3, line: 607, type: !39)
!574 = !DILocalVariable(name: "alloc", arg: 3, scope: !568, file: !3, line: 607, type: !31)
!575 = !DILocalVariable(name: "alloc_prev", arg: 4, scope: !568, file: !3, line: 608, type: !31)
!576 = !DILocalVariable(name: "footerp", scope: !577, file: !3, line: 614, type: !30)
!577 = distinct !DILexicalBlock(scope: !578, file: !3, line: 613, column: 42)
!578 = distinct !DILexicalBlock(scope: !568, file: !3, line: 613, column: 9)
!579 = !DILocalVariable(name: "next", scope: !568, file: !3, line: 617, type: !7)
!580 = !DILocation(line: 607, column: 34, scope: !568)
!581 = !DILocation(line: 607, column: 48, scope: !568)
!582 = !DILocation(line: 607, column: 59, scope: !568)
!583 = !DILocation(line: 608, column: 30, scope: !568)
!584 = !DILocation(line: 612, column: 51, scope: !568)
!585 = !DILocation(line: 612, column: 21, scope: !568)
!586 = !DILocation(line: 612, column: 12, scope: !568)
!587 = !DILocation(line: 612, column: 19, scope: !568)
!588 = !DILocation(line: 613, column: 16, scope: !578)
!589 = !DILocation(line: 613, column: 24, scope: !578)
!590 = !DILocation(line: 614, column: 27, scope: !577)
!591 = !DILocation(line: 614, column: 17, scope: !577)
!592 = !DILocation(line: 615, column: 50, scope: !577)
!593 = !DILocation(line: 615, column: 20, scope: !577)
!594 = !DILocation(line: 615, column: 18, scope: !577)
!595 = !DILocation(line: 616, column: 5, scope: !577)
!596 = !DILocation(line: 617, column: 21, scope: !568)
!597 = !DILocation(line: 617, column: 14, scope: !568)
!598 = !DILocation(line: 618, column: 14, scope: !599)
!599 = distinct !DILexicalBlock(scope: !568, file: !3, line: 618, column: 9)
!600 = !DILocation(line: 0, scope: !601)
!601 = distinct !DILexicalBlock(scope: !599, file: !3, line: 620, column: 12)
!602 = !DILocation(line: 0, scope: !603)
!603 = distinct !DILexicalBlock(scope: !599, file: !3, line: 618, column: 33)
!604 = !DILocation(line: 623, column: 1, scope: !568)
!605 = distinct !DISubprogram(name: "get_alloc_prev", scope: !3, file: !3, line: 519, type: !229, isLocal: true, isDefinition: true, scopeLine: 519, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !606)
!606 = !{!607}
!607 = !DILocalVariable(name: "block", arg: 1, scope: !605, file: !3, line: 519, type: !7)
!608 = !DILocation(line: 519, column: 37, scope: !605)
!609 = !DILocation(line: 520, column: 38, scope: !605)
!610 = !DILocation(line: 520, column: 12, scope: !605)
!611 = !DILocation(line: 520, column: 5, scope: !605)
!612 = distinct !DISubprogram(name: "split_block", scope: !3, file: !3, line: 781, type: !613, isLocal: true, isDefinition: true, scopeLine: 781, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !615)
!613 = !DISubroutineType(types: !614)
!614 = !{null, !7, !39}
!615 = !{!616, !617, !618, !619}
!616 = !DILocalVariable(name: "block", arg: 1, scope: !612, file: !3, line: 781, type: !7)
!617 = !DILocalVariable(name: "asize", arg: 2, scope: !612, file: !3, line: 781, type: !39)
!618 = !DILocalVariable(name: "block_size", scope: !612, file: !3, line: 784, type: !39)
!619 = !DILocalVariable(name: "block_next", scope: !620, file: !3, line: 787, type: !7)
!620 = distinct !DILexicalBlock(scope: !621, file: !3, line: 786, column: 49)
!621 = distinct !DILexicalBlock(scope: !612, file: !3, line: 786, column: 9)
!622 = !DILocation(line: 781, column: 34, scope: !612)
!623 = !DILocation(line: 781, column: 48, scope: !612)
!624 = !DILocation(line: 784, column: 25, scope: !612)
!625 = !DILocation(line: 784, column: 12, scope: !612)
!626 = !DILocation(line: 786, column: 21, scope: !621)
!627 = !DILocation(line: 786, column: 30, scope: !621)
!628 = !DILocation(line: 786, column: 9, scope: !612)
!629 = !DILocation(line: 788, column: 41, scope: !620)
!630 = !DILocation(line: 788, column: 9, scope: !620)
!631 = !DILocation(line: 790, column: 22, scope: !620)
!632 = !DILocation(line: 787, column: 18, scope: !620)
!633 = !DILocation(line: 791, column: 9, scope: !620)
!634 = !DILocation(line: 794, column: 9, scope: !620)
!635 = !DILocation(line: 795, column: 5, scope: !620)
!636 = !DILocation(line: 798, column: 1, scope: !612)
!637 = distinct !DISubprogram(name: "header_to_payload", scope: !3, file: !3, line: 294, type: !638, isLocal: true, isDefinition: true, scopeLine: 294, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !640)
!638 = !DISubroutineType(types: !639)
!639 = !{!6, !7}
!640 = !{!641}
!641 = !DILocalVariable(name: "block", arg: 1, scope: !637, file: !3, line: 294, type: !7)
!642 = !DILocation(line: 294, column: 41, scope: !637)
!643 = !DILocation(line: 296, column: 28, scope: !637)
!644 = !DILocation(line: 296, column: 20, scope: !637)
!645 = !DILocation(line: 296, column: 5, scope: !637)
!646 = distinct !DISubprogram(name: "write_epilogue", scope: !3, file: !3, line: 551, type: !647, isLocal: true, isDefinition: true, scopeLine: 551, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !649)
!647 = !DISubroutineType(types: !648)
!648 = !{null, !7, !31}
!649 = !{!650, !651}
!650 = !DILocalVariable(name: "block", arg: 1, scope: !646, file: !3, line: 551, type: !7)
!651 = !DILocalVariable(name: "prev_alloc", arg: 2, scope: !646, file: !3, line: 551, type: !31)
!652 = !DILocation(line: 551, column: 37, scope: !646)
!653 = !DILocation(line: 551, column: 49, scope: !646)
!654 = !DILocation(line: 554, column: 21, scope: !646)
!655 = !DILocation(line: 554, column: 12, scope: !646)
!656 = !DILocation(line: 554, column: 19, scope: !646)
!657 = !DILocation(line: 555, column: 1, scope: !646)
!658 = distinct !DISubprogram(name: "mm_free", scope: !3, file: !3, line: 1053, type: !659, isLocal: false, isDefinition: true, scopeLine: 1053, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !661)
!659 = !DISubroutineType(types: !660)
!660 = !{null, !6}
!661 = !{!662, !663, !664, !665}
!662 = !DILocalVariable(name: "bp", arg: 1, scope: !658, file: !3, line: 1053, type: !6)
!663 = !DILocalVariable(name: "block", scope: !658, file: !3, line: 1059, type: !7)
!664 = !DILocalVariable(name: "size", scope: !658, file: !3, line: 1060, type: !39)
!665 = !DILocalVariable(name: "result", scope: !658, file: !3, line: 1070, type: !7)
!666 = !DILocation(line: 1053, column: 17, scope: !658)
!667 = !DILocation(line: 1055, column: 12, scope: !668)
!668 = distinct !DILexicalBlock(scope: !658, file: !3, line: 1055, column: 9)
!669 = !DILocation(line: 1055, column: 9, scope: !658)
!670 = !DILocation(line: 1059, column: 22, scope: !658)
!671 = !DILocation(line: 1059, column: 14, scope: !658)
!672 = !DILocation(line: 1060, column: 19, scope: !658)
!673 = !DILocation(line: 1060, column: 12, scope: !658)
!674 = !DILocation(line: 1067, column: 37, scope: !658)
!675 = !DILocation(line: 1067, column: 5, scope: !658)
!676 = !DILocation(line: 1070, column: 23, scope: !658)
!677 = !DILocation(line: 1070, column: 14, scope: !658)
!678 = !DILocation(line: 1073, column: 5, scope: !658)
!679 = !DILocation(line: 1076, column: 1, scope: !658)
!680 = distinct !DISubprogram(name: "payload_to_header", scope: !3, file: !3, line: 283, type: !681, isLocal: true, isDefinition: true, scopeLine: 283, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !683)
!681 = !DISubroutineType(types: !682)
!682 = !{!7, !6}
!683 = !{!684}
!684 = !DILocalVariable(name: "bp", arg: 1, scope: !680, file: !3, line: 283, type: !6)
!685 = !DILocation(line: 283, column: 41, scope: !680)
!686 = !DILocation(line: 284, column: 35, scope: !680)
!687 = !DILocation(line: 284, column: 12, scope: !680)
!688 = !DILocation(line: 284, column: 5, scope: !680)
!689 = distinct !DISubprogram(name: "coalesce_block", scope: !3, file: !3, line: 683, type: !238, isLocal: true, isDefinition: true, scopeLine: 683, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !690)
!690 = !{!691, !692, !693, !694, !699}
!691 = !DILocalVariable(name: "block", arg: 1, scope: !689, file: !3, line: 683, type: !7)
!692 = !DILocalVariable(name: "next", scope: !689, file: !3, line: 687, type: !7)
!693 = !DILocalVariable(name: "size", scope: !689, file: !3, line: 689, type: !39)
!694 = !DILocalVariable(name: "previous", scope: !695, file: !3, line: 708, type: !7)
!695 = distinct !DILexicalBlock(scope: !696, file: !3, line: 707, column: 57)
!696 = distinct !DILexicalBlock(scope: !697, file: !3, line: 707, column: 14)
!697 = distinct !DILexicalBlock(scope: !698, file: !3, line: 699, column: 14)
!698 = distinct !DILexicalBlock(scope: !689, file: !3, line: 692, column: 9)
!699 = !DILocalVariable(name: "previous", scope: !700, file: !3, line: 717, type: !7)
!700 = distinct !DILexicalBlock(scope: !696, file: !3, line: 716, column: 10)
!701 = !DILocation(line: 683, column: 41, scope: !689)
!702 = !DILocation(line: 687, column: 21, scope: !689)
!703 = !DILocation(line: 687, column: 14, scope: !689)
!704 = !DILocation(line: 689, column: 19, scope: !689)
!705 = !DILocation(line: 689, column: 12, scope: !689)
!706 = !DILocation(line: 692, column: 9, scope: !698)
!707 = !DILocation(line: 0, scope: !696)
!708 = !DILocation(line: 692, column: 31, scope: !698)
!709 = !DILocation(line: 692, column: 9, scope: !689)
!710 = !DILocation(line: 699, column: 40, scope: !697)
!711 = !DILocation(line: 699, column: 14, scope: !698)
!712 = !DILocation(line: 700, column: 9, scope: !713)
!713 = distinct !DILexicalBlock(scope: !697, file: !3, line: 699, column: 57)
!714 = !DILocation(line: 701, column: 35, scope: !713)
!715 = !DILocation(line: 701, column: 33, scope: !713)
!716 = !DILocation(line: 701, column: 9, scope: !713)
!717 = !DILocation(line: 703, column: 9, scope: !713)
!718 = !DILocation(line: 707, column: 14, scope: !697)
!719 = !DILocation(line: 708, column: 29, scope: !695)
!720 = !DILocation(line: 708, column: 18, scope: !695)
!721 = !DILocation(line: 709, column: 9, scope: !695)
!722 = !DILocation(line: 710, column: 38, scope: !695)
!723 = !DILocation(line: 710, column: 36, scope: !695)
!724 = !DILocation(line: 711, column: 21, scope: !695)
!725 = !DILocation(line: 710, column: 9, scope: !695)
!726 = !DILocation(line: 713, column: 9, scope: !695)
!727 = !DILocation(line: 717, column: 29, scope: !700)
!728 = !DILocation(line: 717, column: 18, scope: !700)
!729 = !DILocation(line: 718, column: 9, scope: !700)
!730 = !DILocation(line: 719, column: 9, scope: !700)
!731 = !DILocation(line: 721, column: 31, scope: !700)
!732 = !DILocation(line: 721, column: 50, scope: !700)
!733 = !DILocation(line: 721, column: 59, scope: !700)
!734 = !DILocation(line: 721, column: 57, scope: !700)
!735 = !DILocation(line: 722, column: 21, scope: !700)
!736 = !DILocation(line: 721, column: 9, scope: !700)
!737 = !DILocation(line: 724, column: 9, scope: !700)
!738 = !DILocation(line: 0, scope: !713)
!739 = !DILocation(line: 727, column: 1, scope: !689)
!740 = distinct !DISubprogram(name: "block_insertion", scope: !3, file: !3, line: 356, type: !238, isLocal: true, isDefinition: true, scopeLine: 356, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !741)
!741 = !{!742, !743}
!742 = !DILocalVariable(name: "block", arg: 1, scope: !740, file: !3, line: 356, type: !7)
!743 = !DILocalVariable(name: "index", scope: !740, file: !3, line: 361, type: !39)
!744 = !DILocation(line: 356, column: 42, scope: !740)
!745 = !DILocation(line: 358, column: 9, scope: !746)
!746 = distinct !DILexicalBlock(scope: !740, file: !3, line: 358, column: 9)
!747 = !DILocation(line: 358, column: 25, scope: !746)
!748 = !DILocation(line: 358, column: 9, scope: !740)
!749 = !DILocation(line: 359, column: 16, scope: !750)
!750 = distinct !DILexicalBlock(scope: !746, file: !3, line: 358, column: 44)
!751 = !DILocation(line: 359, column: 9, scope: !750)
!752 = !DILocation(line: 361, column: 20, scope: !740)
!753 = !DILocation(line: 361, column: 12, scope: !740)
!754 = !DILocation(line: 364, column: 19, scope: !740)
!755 = !DILocation(line: 364, column: 12, scope: !740)
!756 = !DILocation(line: 364, column: 17, scope: !740)
!757 = !DILocation(line: 365, column: 12, scope: !740)
!758 = !DILocation(line: 365, column: 17, scope: !740)
!759 = !DILocation(line: 366, column: 9, scope: !760)
!760 = distinct !DILexicalBlock(scope: !740, file: !3, line: 366, column: 9)
!761 = !DILocation(line: 366, column: 27, scope: !760)
!762 = !DILocation(line: 366, column: 9, scope: !740)
!763 = !DILocation(line: 367, column: 28, scope: !764)
!764 = distinct !DILexicalBlock(scope: !760, file: !3, line: 366, column: 36)
!765 = !DILocation(line: 367, column: 33, scope: !764)
!766 = !DILocation(line: 368, column: 5, scope: !764)
!767 = !DILocation(line: 369, column: 23, scope: !740)
!768 = !DILocation(line: 371, column: 5, scope: !740)
!769 = distinct !DISubprogram(name: "mm_realloc", scope: !3, file: !3, line: 1087, type: !770, isLocal: false, isDefinition: true, scopeLine: 1087, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !772)
!770 = !DISubroutineType(types: !771)
!771 = !{!6, !6, !39}
!772 = !{!773, !774, !775, !776, !777}
!773 = !DILocalVariable(name: "ptr", arg: 1, scope: !769, file: !3, line: 1087, type: !6)
!774 = !DILocalVariable(name: "size", arg: 2, scope: !769, file: !3, line: 1087, type: !39)
!775 = !DILocalVariable(name: "block", scope: !769, file: !3, line: 1088, type: !7)
!776 = !DILocalVariable(name: "copysize", scope: !769, file: !3, line: 1089, type: !39)
!777 = !DILocalVariable(name: "newptr", scope: !769, file: !3, line: 1090, type: !6)
!778 = !DILocation(line: 1087, column: 21, scope: !769)
!779 = !DILocation(line: 1087, column: 33, scope: !769)
!780 = !DILocation(line: 1088, column: 22, scope: !769)
!781 = !DILocation(line: 1088, column: 14, scope: !769)
!782 = !DILocation(line: 1093, column: 14, scope: !783)
!783 = distinct !DILexicalBlock(scope: !769, file: !3, line: 1093, column: 9)
!784 = !DILocation(line: 1093, column: 9, scope: !769)
!785 = !DILocation(line: 1094, column: 9, scope: !786)
!786 = distinct !DILexicalBlock(scope: !783, file: !3, line: 1093, column: 20)
!787 = !DILocation(line: 1095, column: 9, scope: !786)
!788 = !DILocation(line: 1099, column: 13, scope: !789)
!789 = distinct !DILexicalBlock(scope: !769, file: !3, line: 1099, column: 9)
!790 = !DILocation(line: 0, scope: !769)
!791 = !DILocation(line: 1099, column: 9, scope: !769)
!792 = !DILocation(line: 1090, column: 11, scope: !769)
!793 = !DILocation(line: 1107, column: 16, scope: !794)
!794 = distinct !DILexicalBlock(scope: !769, file: !3, line: 1107, column: 9)
!795 = !DILocation(line: 1107, column: 9, scope: !769)
!796 = !DILocation(line: 1112, column: 16, scope: !769)
!797 = !DILocation(line: 1089, column: 12, scope: !769)
!798 = !DILocation(line: 1113, column: 14, scope: !799)
!799 = distinct !DILexicalBlock(scope: !769, file: !3, line: 1113, column: 9)
!800 = !DILocation(line: 1113, column: 9, scope: !769)
!801 = !DILocation(line: 1116, column: 5, scope: !769)
!802 = !DILocation(line: 1119, column: 5, scope: !769)
!803 = !DILocation(line: 1121, column: 5, scope: !769)
!804 = !DILocation(line: 1122, column: 1, scope: !769)
!805 = distinct !DISubprogram(name: "get_payload_size", scope: !3, file: !3, line: 566, type: !218, isLocal: true, isDefinition: true, scopeLine: 566, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !806)
!806 = !{!807, !808}
!807 = !DILocalVariable(name: "block", arg: 1, scope: !805, file: !3, line: 566, type: !7)
!808 = !DILocalVariable(name: "asize", scope: !805, file: !3, line: 567, type: !39)
!809 = !DILocation(line: 566, column: 41, scope: !805)
!810 = !DILocation(line: 567, column: 20, scope: !805)
!811 = !DILocation(line: 567, column: 12, scope: !805)
!812 = !DILocation(line: 568, column: 9, scope: !813)
!813 = distinct !DILexicalBlock(scope: !805, file: !3, line: 568, column: 9)
!814 = !DILocation(line: 568, column: 9, scope: !805)
!815 = !DILocation(line: 573, column: 1, scope: !805)
!816 = distinct !DISubprogram(name: "mm_calloc", scope: !3, file: !3, line: 1135, type: !817, isLocal: false, isDefinition: true, scopeLine: 1135, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !819)
!817 = !DISubroutineType(types: !818)
!818 = !{!6, !39, !39}
!819 = !{!820, !821, !822, !823}
!820 = !DILocalVariable(name: "elements", arg: 1, scope: !816, file: !3, line: 1135, type: !39)
!821 = !DILocalVariable(name: "size", arg: 2, scope: !816, file: !3, line: 1135, type: !39)
!822 = !DILocalVariable(name: "bp", scope: !816, file: !3, line: 1136, type: !6)
!823 = !DILocalVariable(name: "asize", scope: !816, file: !3, line: 1137, type: !39)
!824 = !DILocation(line: 1135, column: 21, scope: !816)
!825 = !DILocation(line: 1135, column: 38, scope: !816)
!826 = !DILocation(line: 1137, column: 29, scope: !816)
!827 = !DILocation(line: 1137, column: 12, scope: !816)
!828 = !DILocation(line: 1139, column: 18, scope: !829)
!829 = distinct !DILexicalBlock(scope: !816, file: !3, line: 1139, column: 9)
!830 = !DILocation(line: 1139, column: 9, scope: !816)
!831 = !DILocation(line: 1142, column: 15, scope: !832)
!832 = distinct !DILexicalBlock(scope: !816, file: !3, line: 1142, column: 9)
!833 = !DILocation(line: 1142, column: 26, scope: !832)
!834 = !DILocation(line: 1142, column: 9, scope: !816)
!835 = !DILocation(line: 1147, column: 10, scope: !816)
!836 = !DILocation(line: 1136, column: 11, scope: !816)
!837 = !DILocation(line: 1148, column: 12, scope: !838)
!838 = distinct !DILexicalBlock(scope: !816, file: !3, line: 1148, column: 9)
!839 = !DILocation(line: 1148, column: 9, scope: !816)
!840 = !DILocation(line: 1153, column: 5, scope: !816)
!841 = !DILocation(line: 1155, column: 5, scope: !816)
!842 = !DILocation(line: 0, scope: !816)
!843 = !DILocation(line: 1156, column: 1, scope: !816)
!844 = distinct !DISubprogram(name: "min_block_removal", scope: !3, file: !3, line: 397, type: !238, isLocal: true, isDefinition: true, scopeLine: 397, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !845)
!845 = !{!846, !847, !851}
!846 = !DILocalVariable(name: "block", arg: 1, scope: !844, file: !3, line: 397, type: !7)
!847 = !DILocalVariable(name: "prev", scope: !848, file: !3, line: 416, type: !7)
!848 = distinct !DILexicalBlock(scope: !849, file: !3, line: 413, column: 10)
!849 = distinct !DILexicalBlock(scope: !850, file: !3, line: 407, column: 14)
!850 = distinct !DILexicalBlock(scope: !844, file: !3, line: 401, column: 9)
!851 = !DILocalVariable(name: "curr", scope: !852, file: !3, line: 417, type: !7)
!852 = distinct !DILexicalBlock(scope: !848, file: !3, line: 417, column: 9)
!853 = !DILocation(line: 397, column: 44, scope: !844)
!854 = !DILocation(line: 401, column: 18, scope: !850)
!855 = !DILocation(line: 401, column: 15, scope: !850)
!856 = !DILocation(line: 401, column: 32, scope: !850)
!857 = !DILocation(line: 417, column: 23, scope: !852)
!858 = !DILocation(line: 416, column: 18, scope: !848)
!859 = !DILocation(line: 417, column: 50, scope: !860)
!860 = distinct !DILexicalBlock(scope: !852, file: !3, line: 417, column: 9)
!861 = !DILocation(line: 417, column: 9, scope: !852)
!862 = !DILocation(line: 0, scope: !860)
!863 = !DILocation(line: 418, column: 17, scope: !864)
!864 = distinct !DILexicalBlock(scope: !860, file: !3, line: 417, column: 78)
!865 = !DILocation(line: 401, column: 50, scope: !850)
!866 = !DILocation(line: 401, column: 55, scope: !850)
!867 = !DILocation(line: 401, column: 9, scope: !844)
!868 = !DILocation(line: 402, column: 21, scope: !869)
!869 = distinct !DILexicalBlock(scope: !850, file: !3, line: 401, column: 64)
!870 = !DILocation(line: 403, column: 23, scope: !869)
!871 = !DILocation(line: 404, column: 9, scope: !869)
!872 = !DILocation(line: 408, column: 32, scope: !873)
!873 = distinct !DILexicalBlock(scope: !849, file: !3, line: 407, column: 38)
!874 = !DILocation(line: 408, column: 23, scope: !873)
!875 = !DILocation(line: 409, column: 21, scope: !873)
!876 = !DILocation(line: 410, column: 9, scope: !873)
!877 = !DILocation(line: 418, column: 22, scope: !878)
!878 = distinct !DILexicalBlock(scope: !864, file: !3, line: 418, column: 17)
!879 = distinct !{!879, !861, !880}
!880 = !DILocation(line: 424, column: 9, scope: !852)
!881 = !DILocation(line: 419, column: 36, scope: !882)
!882 = distinct !DILexicalBlock(scope: !878, file: !3, line: 418, column: 32)
!883 = !DILocation(line: 419, column: 23, scope: !882)
!884 = !DILocation(line: 419, column: 28, scope: !882)
!885 = !DILocation(line: 420, column: 24, scope: !882)
!886 = !DILocation(line: 420, column: 29, scope: !882)
!887 = !DILocation(line: 421, column: 17, scope: !882)
!888 = !DILocation(line: 417, column: 72, scope: !860)
!889 = !DILocation(line: 427, column: 1, scope: !844)
!890 = !DILocation(line: 0, scope: !848)
!891 = distinct !DISubprogram(name: "get_min_status", scope: !3, file: !3, line: 540, type: !229, isLocal: true, isDefinition: true, scopeLine: 540, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !892)
!892 = !{!893}
!893 = !DILocalVariable(name: "block", arg: 1, scope: !891, file: !3, line: 540, type: !7)
!894 = !DILocation(line: 540, column: 37, scope: !891)
!895 = !DILocation(line: 541, column: 38, scope: !891)
!896 = !DILocation(line: 541, column: 12, scope: !891)
!897 = !DILocation(line: 541, column: 5, scope: !891)
!898 = distinct !DISubprogram(name: "header_to_footer", scope: !3, file: !3, line: 306, type: !192, isLocal: true, isDefinition: true, scopeLine: 306, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !899)
!899 = !{!900}
!900 = !DILocalVariable(name: "block", arg: 1, scope: !898, file: !3, line: 306, type: !7)
!901 = !DILocation(line: 306, column: 42, scope: !898)
!902 = !DILocation(line: 309, column: 30, scope: !898)
!903 = !DILocation(line: 309, column: 23, scope: !898)
!904 = !DILocation(line: 309, column: 40, scope: !898)
!905 = !DILocation(line: 309, column: 38, scope: !898)
!906 = !DILocation(line: 309, column: 56, scope: !898)
!907 = !DILocation(line: 309, column: 12, scope: !898)
!908 = !DILocation(line: 309, column: 5, scope: !898)
!909 = distinct !DISubprogram(name: "extract_min_status", scope: !3, file: !3, line: 531, type: !201, isLocal: true, isDefinition: true, scopeLine: 531, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !910)
!910 = !{!911}
!911 = !DILocalVariable(name: "word", arg: 1, scope: !909, file: !3, line: 531, type: !12)
!912 = !DILocation(line: 531, column: 39, scope: !909)
!913 = !DILocation(line: 533, column: 37, scope: !909)
!914 = !DILocation(line: 533, column: 12, scope: !909)
!915 = !DILocation(line: 533, column: 5, scope: !909)
!916 = distinct !DISubprogram(name: "extract_alloc_prev", scope: !3, file: !3, line: 508, type: !201, isLocal: true, isDefinition: true, scopeLine: 508, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !917)
!917 = !{!918}
!918 = !DILocalVariable(name: "word", arg: 1, scope: !916, file: !3, line: 508, type: !12)
!919 = !DILocation(line: 508, column: 39, scope: !916)
!920 = !DILocation(line: 510, column: 44, scope: !916)
!921 = !DILocation(line: 510, column: 12, scope: !916)
!922 = !DILocation(line: 510, column: 5, scope: !916)
!923 = distinct !DISubprogram(name: "find_prev", scope: !3, file: !3, line: 650, type: !238, isLocal: true, isDefinition: true, scopeLine: 650, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !924)
!924 = !{!925, !926}
!925 = !DILocalVariable(name: "block", arg: 1, scope: !923, file: !3, line: 650, type: !7)
!926 = !DILocalVariable(name: "footerp", scope: !923, file: !3, line: 652, type: !30)
!927 = !DILocation(line: 650, column: 36, scope: !923)
!928 = !DILocation(line: 652, column: 23, scope: !923)
!929 = !DILocation(line: 652, column: 13, scope: !923)
!930 = !DILocation(line: 653, column: 9, scope: !931)
!931 = distinct !DILexicalBlock(scope: !923, file: !3, line: 653, column: 9)
!932 = !DILocation(line: 653, column: 9, scope: !923)
!933 = !DILocation(line: 654, column: 16, scope: !934)
!934 = distinct !DILexicalBlock(scope: !931, file: !3, line: 653, column: 32)
!935 = !DILocation(line: 654, column: 9, scope: !934)
!936 = !DILocation(line: 657, column: 22, scope: !937)
!937 = distinct !DILexicalBlock(scope: !923, file: !3, line: 657, column: 9)
!938 = !DILocation(line: 657, column: 9, scope: !937)
!939 = !DILocation(line: 657, column: 32, scope: !937)
!940 = !DILocation(line: 657, column: 9, scope: !923)
!941 = !DILocation(line: 661, column: 12, scope: !923)
!942 = !DILocation(line: 661, column: 5, scope: !923)
!943 = !DILocation(line: 0, scope: !923)
!944 = !DILocation(line: 662, column: 1, scope: !923)
!945 = distinct !DISubprogram(name: "min_footer_to_header", scope: !3, file: !3, line: 321, type: !946, isLocal: true, isDefinition: true, scopeLine: 321, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !948)
!946 = !DISubroutineType(types: !947)
!947 = !{!7, !30}
!948 = !{!949}
!949 = !DILocalVariable(name: "footer", arg: 1, scope: !945, file: !3, line: 321, type: !30)
!950 = !DILocation(line: 321, column: 46, scope: !945)
!951 = !DILocation(line: 322, column: 47, scope: !945)
!952 = !DILocation(line: 322, column: 12, scope: !945)
!953 = !DILocation(line: 322, column: 5, scope: !945)
!954 = distinct !DISubprogram(name: "footer_to_header", scope: !3, file: !3, line: 332, type: !946, isLocal: true, isDefinition: true, scopeLine: 332, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !955)
!955 = !{!956, !957}
!956 = !DILocalVariable(name: "footer", arg: 1, scope: !954, file: !3, line: 332, type: !30)
!957 = !DILocalVariable(name: "size", scope: !954, file: !3, line: 333, type: !39)
!958 = !DILocation(line: 332, column: 42, scope: !954)
!959 = !DILocation(line: 333, column: 32, scope: !954)
!960 = !DILocation(line: 333, column: 19, scope: !954)
!961 = !DILocation(line: 333, column: 12, scope: !954)
!962 = !DILocation(line: 335, column: 39, scope: !954)
!963 = !DILocation(line: 335, column: 47, scope: !954)
!964 = !DILocation(line: 335, column: 12, scope: !954)
!965 = !DILocation(line: 335, column: 5, scope: !954)
!966 = distinct !DISubprogram(name: "min_block_insertion", scope: !3, file: !3, line: 344, type: !238, isLocal: true, isDefinition: true, scopeLine: 344, flags: DIFlagPrototyped, isOptimized: true, unit: !2, retainedNodes: !967)
!967 = !{!968}
!968 = !DILocalVariable(name: "block", arg: 1, scope: !966, file: !3, line: 344, type: !7)
!969 = !DILocation(line: 344, column: 46, scope: !966)
!970 = !DILocation(line: 345, column: 19, scope: !966)
!971 = !DILocation(line: 345, column: 12, scope: !966)
!972 = !DILocation(line: 345, column: 17, scope: !966)
!973 = !DILocation(line: 346, column: 19, scope: !966)
!974 = !DILocation(line: 347, column: 5, scope: !966)
