Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A026CBA988
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6003F10E9EB;
	Sat, 13 Dec 2025 12:40:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1187 seconds by postgrey-1.36 at gabe;
 Wed, 11 Sep 2024 01:18:19 UTC
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D2110E9CB
 for <nouveau@lists.freedesktop.org>; Wed, 11 Sep 2024 01:18:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4X3Mcz0jvNz4f3jR7
 for <nouveau@lists.freedesktop.org>; Wed, 11 Sep 2024 08:58:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 7C8291A06D7
 for <nouveau@lists.freedesktop.org>; Wed, 11 Sep 2024 08:58:26 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
 by APP4 (Coremail) with SMTP id gCh0CgDXDMkt6+BmskTrAw--.65200S2;
 Wed, 11 Sep 2024 08:58:26 +0800 (CST)
From: Zheng Yejian <zhengyejian@huaweicloud.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 karolherbst@gmail.com, ppaalanen@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, zhengyejian1@huawei.com
Subject: [PATCH -next] tracing: Remove TRACE_EVENT_FL_FILTERED logic
Date: Wed, 11 Sep 2024 09:00:26 +0800
Message-Id: <20240911010026.2302849-1-zhengyejian@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDXDMkt6+BmskTrAw--.65200S2
X-Coremail-Antispam: 1UD129KBjvAXoW3uw1ktFWfZr43Cry5Kw4UJwb_yoW8Ar1fJo
 W3X39Yvwn7try8A3y3KayvqFs8Zrn0gr90yr4xtr4DuF1jkw1UZrWxAws0yFn8Xwn0kan8
 Z3WDJa1DJrs5Ja95n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUU5E7kC6x804xWl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK
 8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
 0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
 6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI
 7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUF1v3UUUUU
X-CM-SenderInfo: x2kh0w51hmxt3q6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

After commit dcb0b5575d24 ("tracing: Remove TRACE_EVENT_FL_USE_CALL_FILTER
 logic"), no one's going to set the TRACE_EVENT_FL_FILTERED or change the
call->filter, so remove related logic.

Signed-off-by: Zheng Yejian <zhengyejian@huaweicloud.com>
---
 include/linux/trace_events.h         |  4 ---
 kernel/trace/trace.c                 | 44 ++++++----------------------
 kernel/trace/trace.h                 |  4 ---
 kernel/trace/trace_branch.c          |  4 +--
 kernel/trace/trace_events.c          |  2 --
 kernel/trace/trace_functions_graph.c |  8 ++---
 kernel/trace/trace_hwlat.c           |  4 +--
 kernel/trace/trace_mmiotrace.c       |  8 ++---
 kernel/trace/trace_osnoise.c         | 12 ++------
 kernel/trace/trace_sched_wakeup.c    |  8 ++---
 10 files changed, 20 insertions(+), 78 deletions(-)

diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index 42bedcddd511..f8f2e52653df 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -326,7 +326,6 @@ void *trace_event_buffer_reserve(struct trace_event_buffer *fbuffer,
 void trace_event_buffer_commit(struct trace_event_buffer *fbuffer);
 
 enum {
-	TRACE_EVENT_FL_FILTERED_BIT,
 	TRACE_EVENT_FL_CAP_ANY_BIT,
 	TRACE_EVENT_FL_NO_SET_FILTER_BIT,
 	TRACE_EVENT_FL_IGNORE_ENABLE_BIT,
@@ -341,7 +340,6 @@ enum {
 
 /*
  * Event flags:
- *  FILTERED	  - The event has a filter attached
  *  CAP_ANY	  - Any user can enable for perf
  *  NO_SET_FILTER - Set when filter has error and is to be ignored
  *  IGNORE_ENABLE - For trace internal events, do not enable with debugfs file
@@ -356,7 +354,6 @@ enum {
  *                   to a tracepoint yet, then it is cleared when it is.
  */
 enum {
-	TRACE_EVENT_FL_FILTERED		= (1 << TRACE_EVENT_FL_FILTERED_BIT),
 	TRACE_EVENT_FL_CAP_ANY		= (1 << TRACE_EVENT_FL_CAP_ANY_BIT),
 	TRACE_EVENT_FL_NO_SET_FILTER	= (1 << TRACE_EVENT_FL_NO_SET_FILTER_BIT),
 	TRACE_EVENT_FL_IGNORE_ENABLE	= (1 << TRACE_EVENT_FL_IGNORE_ENABLE_BIT),
@@ -381,7 +378,6 @@ struct trace_event_call {
 	};
 	struct trace_event	event;
 	char			*print_fmt;
-	struct event_filter	*filter;
 	/*
 	 * Static events can disappear with modules,
 	 * where as dynamic ones need their own ref count.
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index c390de3a4515..b06f381f1989 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -570,19 +570,6 @@ int tracing_check_open_get_tr(struct trace_array *tr)
 	return 0;
 }
 
-int call_filter_check_discard(struct trace_event_call *call, void *rec,
-			      struct trace_buffer *buffer,
-			      struct ring_buffer_event *event)
-{
-	if (unlikely(call->flags & TRACE_EVENT_FL_FILTERED) &&
-	    !filter_match_preds(call->filter, rec)) {
-		__trace_event_discard_commit(buffer, event);
-		return 1;
-	}
-
-	return 0;
-}
-
 /**
  * trace_find_filtered_pid - check if a pid exists in a filtered_pid list
  * @filtered_pids: The list of pids to check
@@ -2866,7 +2853,6 @@ void
 trace_function(struct trace_array *tr, unsigned long ip, unsigned long
 	       parent_ip, unsigned int trace_ctx)
 {
-	struct trace_event_call *call = &event_function;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
 	struct ring_buffer_event *event;
 	struct ftrace_entry *entry;
@@ -2879,11 +2865,9 @@ trace_function(struct trace_array *tr, unsigned long ip, unsigned long
 	entry->ip			= ip;
 	entry->parent_ip		= parent_ip;
 
-	if (!call_filter_check_discard(call, entry, buffer, event)) {
-		if (static_branch_unlikely(&trace_function_exports_enabled))
-			ftrace_exports(event, TRACE_EXPORT_FUNCTION);
-		__buffer_unlock_commit(buffer, event);
-	}
+	if (static_branch_unlikely(&trace_function_exports_enabled))
+		ftrace_exports(event, TRACE_EXPORT_FUNCTION);
+	__buffer_unlock_commit(buffer, event);
 }
 
 #ifdef CONFIG_STACKTRACE
@@ -2909,7 +2893,6 @@ static void __ftrace_trace_stack(struct trace_buffer *buffer,
 				 unsigned int trace_ctx,
 				 int skip, struct pt_regs *regs)
 {
-	struct trace_event_call *call = &event_kernel_stack;
 	struct ring_buffer_event *event;
 	unsigned int size, nr_entries;
 	struct ftrace_stack *fstack;
@@ -2963,8 +2946,7 @@ static void __ftrace_trace_stack(struct trace_buffer *buffer,
 	memcpy(&entry->caller, fstack->calls,
 	       flex_array_size(entry, caller, nr_entries));
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		__buffer_unlock_commit(buffer, event);
+	__buffer_unlock_commit(buffer, event);
 
  out:
 	/* Again, don't let gcc optimize things here */
@@ -3037,7 +3019,6 @@ static void
 ftrace_trace_userstack(struct trace_array *tr,
 		       struct trace_buffer *buffer, unsigned int trace_ctx)
 {
-	struct trace_event_call *call = &event_user_stack;
 	struct ring_buffer_event *event;
 	struct userstack_entry *entry;
 
@@ -3071,8 +3052,7 @@ ftrace_trace_userstack(struct trace_array *tr,
 	memset(&entry->caller, 0, sizeof(entry->caller));
 
 	stack_trace_save_user(entry->caller, FTRACE_STACK_ENTRIES);
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		__buffer_unlock_commit(buffer, event);
+	__buffer_unlock_commit(buffer, event);
 
  out_drop_count:
 	__this_cpu_dec(user_stack_count);
@@ -3241,7 +3221,6 @@ static void trace_printk_start_stop_comm(int enabled)
  */
 int trace_vbprintk(unsigned long ip, const char *fmt, va_list args)
 {
-	struct trace_event_call *call = &event_bprint;
 	struct ring_buffer_event *event;
 	struct trace_buffer *buffer;
 	struct trace_array *tr = &global_trace;
@@ -3282,10 +3261,8 @@ int trace_vbprintk(unsigned long ip, const char *fmt, va_list args)
 	entry->fmt			= fmt;
 
 	memcpy(entry->buf, tbuffer, sizeof(u32) * len);
-	if (!call_filter_check_discard(call, entry, buffer, event)) {
-		__buffer_unlock_commit(buffer, event);
-		ftrace_trace_stack(tr, buffer, trace_ctx, 6, NULL);
-	}
+	__buffer_unlock_commit(buffer, event);
+	ftrace_trace_stack(tr, buffer, trace_ctx, 6, NULL);
 
 out:
 	ring_buffer_nest_end(buffer);
@@ -3305,7 +3282,6 @@ static int
 __trace_array_vprintk(struct trace_buffer *buffer,
 		      unsigned long ip, const char *fmt, va_list args)
 {
-	struct trace_event_call *call = &event_print;
 	struct ring_buffer_event *event;
 	int len = 0, size;
 	struct print_entry *entry;
@@ -3340,10 +3316,8 @@ __trace_array_vprintk(struct trace_buffer *buffer,
 	entry->ip = ip;
 
 	memcpy(&entry->buf, tbuffer, len + 1);
-	if (!call_filter_check_discard(call, entry, buffer, event)) {
-		__buffer_unlock_commit(buffer, event);
-		ftrace_trace_stack(&global_trace, buffer, trace_ctx, 6, NULL);
-	}
+	__buffer_unlock_commit(buffer, event);
+	ftrace_trace_stack(&global_trace, buffer, trace_ctx, 6, NULL);
 
 out:
 	ring_buffer_nest_end(buffer);
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 4f448ab2d1e7..f5883bb85864 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1427,10 +1427,6 @@ struct trace_subsystem_dir {
 	int				nr_events;
 };
 
-extern int call_filter_check_discard(struct trace_event_call *call, void *rec,
-				     struct trace_buffer *buffer,
-				     struct ring_buffer_event *event);
-
 void trace_buffer_unlock_commit_regs(struct trace_array *tr,
 				     struct trace_buffer *buffer,
 				     struct ring_buffer_event *event,
diff --git a/kernel/trace/trace_branch.c b/kernel/trace/trace_branch.c
index e47fdb4c92fb..0f24eca449bf 100644
--- a/kernel/trace/trace_branch.c
+++ b/kernel/trace/trace_branch.c
@@ -30,7 +30,6 @@ static struct trace_array *branch_tracer;
 static void
 probe_likely_condition(struct ftrace_likely_data *f, int val, int expect)
 {
-	struct trace_event_call *call = &event_branch;
 	struct trace_array *tr = branch_tracer;
 	struct trace_buffer *buffer;
 	struct trace_array_cpu *data;
@@ -82,8 +81,7 @@ probe_likely_condition(struct ftrace_likely_data *f, int val, int expect)
 	entry->line = f->data.line;
 	entry->correct = val == expect;
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit_nostack(buffer, event);
+	trace_buffer_unlock_commit_nostack(buffer, event);
 
  out:
 	current->trace_recursion &= ~TRACE_BRANCH_BIT;
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 7266ec2a4eea..77e68efbd43e 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -3149,8 +3149,6 @@ static void __trace_remove_event_call(struct trace_event_call *call)
 {
 	event_remove(call);
 	trace_destroy_fields(call);
-	free_event_filter(call->filter);
-	call->filter = NULL;
 }
 
 static int probe_remove_event_call(struct trace_event_call *call)
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index a569daaac4c4..ab57ec78ca04 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -102,7 +102,6 @@ int __trace_graph_entry(struct trace_array *tr,
 				struct ftrace_graph_ent *trace,
 				unsigned int trace_ctx)
 {
-	struct trace_event_call *call = &event_funcgraph_entry;
 	struct ring_buffer_event *event;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
 	struct ftrace_graph_ent_entry *entry;
@@ -113,8 +112,7 @@ int __trace_graph_entry(struct trace_array *tr,
 		return 0;
 	entry	= ring_buffer_event_data(event);
 	entry->graph_ent			= *trace;
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit_nostack(buffer, event);
+	trace_buffer_unlock_commit_nostack(buffer, event);
 
 	return 1;
 }
@@ -223,7 +221,6 @@ void __trace_graph_return(struct trace_array *tr,
 				struct ftrace_graph_ret *trace,
 				unsigned int trace_ctx)
 {
-	struct trace_event_call *call = &event_funcgraph_exit;
 	struct ring_buffer_event *event;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
 	struct ftrace_graph_ret_entry *entry;
@@ -234,8 +231,7 @@ void __trace_graph_return(struct trace_array *tr,
 		return;
 	entry	= ring_buffer_event_data(event);
 	entry->ret				= *trace;
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit_nostack(buffer, event);
+	trace_buffer_unlock_commit_nostack(buffer, event);
 }
 
 void trace_graph_return(struct ftrace_graph_ret *trace,
diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index b791524a6536..fcd5e8c91669 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -130,7 +130,6 @@ static bool hwlat_busy;
 static void trace_hwlat_sample(struct hwlat_sample *sample)
 {
 	struct trace_array *tr = hwlat_trace;
-	struct trace_event_call *call = &event_hwlat;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
 	struct ring_buffer_event *event;
 	struct hwlat_entry *entry;
@@ -148,8 +147,7 @@ static void trace_hwlat_sample(struct hwlat_sample *sample)
 	entry->nmi_count		= sample->nmi_count;
 	entry->count			= sample->count;
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit_nostack(buffer, event);
+	trace_buffer_unlock_commit_nostack(buffer, event);
 }
 
 /* Macros to encapsulate the time capturing infrastructure */
diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index 64e77b513697..ba5858866b2f 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -294,7 +294,6 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 				struct trace_array_cpu *data,
 				struct mmiotrace_rw *rw)
 {
-	struct trace_event_call *call = &event_mmiotrace_rw;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_rw *entry;
@@ -310,8 +309,7 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 	entry	= ring_buffer_event_data(event);
 	entry->rw			= *rw;
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
+	trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
 }
 
 void mmio_trace_rw(struct mmiotrace_rw *rw)
@@ -325,7 +323,6 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 				struct trace_array_cpu *data,
 				struct mmiotrace_map *map)
 {
-	struct trace_event_call *call = &event_mmiotrace_map;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_map *entry;
@@ -341,8 +338,7 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 	entry	= ring_buffer_event_data(event);
 	entry->map			= *map;
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
+	trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
 }
 
 void mmio_trace_mapping(struct mmiotrace_map *map)
diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index 1c11cb7d01ae..029019d2613c 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -499,7 +499,6 @@ static void print_osnoise_headers(struct seq_file *s)
 static void
 __trace_osnoise_sample(struct osnoise_sample *sample, struct trace_buffer *buffer)
 {
-	struct trace_event_call *call = &event_osnoise;
 	struct ring_buffer_event *event;
 	struct osnoise_entry *entry;
 
@@ -517,8 +516,7 @@ __trace_osnoise_sample(struct osnoise_sample *sample, struct trace_buffer *buffe
 	entry->softirq_count	= sample->softirq_count;
 	entry->thread_count	= sample->thread_count;
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit_nostack(buffer, event);
+	trace_buffer_unlock_commit_nostack(buffer, event);
 }
 
 /*
@@ -578,7 +576,6 @@ static void print_timerlat_headers(struct seq_file *s)
 static void
 __trace_timerlat_sample(struct timerlat_sample *sample, struct trace_buffer *buffer)
 {
-	struct trace_event_call *call = &event_osnoise;
 	struct ring_buffer_event *event;
 	struct timerlat_entry *entry;
 
@@ -591,8 +588,7 @@ __trace_timerlat_sample(struct timerlat_sample *sample, struct trace_buffer *buf
 	entry->context			= sample->context;
 	entry->timer_latency		= sample->timer_latency;
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit_nostack(buffer, event);
+	trace_buffer_unlock_commit_nostack(buffer, event);
 }
 
 /*
@@ -654,7 +650,6 @@ static void timerlat_save_stack(int skip)
 static void
 __timerlat_dump_stack(struct trace_buffer *buffer, struct trace_stack *fstack, unsigned int size)
 {
-	struct trace_event_call *call = &event_osnoise;
 	struct ring_buffer_event *event;
 	struct stack_entry *entry;
 
@@ -668,8 +663,7 @@ __timerlat_dump_stack(struct trace_buffer *buffer, struct trace_stack *fstack, u
 	memcpy(&entry->caller, fstack->calls, size);
 	entry->size = fstack->nr_entries;
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit_nostack(buffer, event);
+	trace_buffer_unlock_commit_nostack(buffer, event);
 }
 
 /*
diff --git a/kernel/trace/trace_sched_wakeup.c b/kernel/trace/trace_sched_wakeup.c
index ae2ace5e515a..d6c7f18daa15 100644
--- a/kernel/trace/trace_sched_wakeup.c
+++ b/kernel/trace/trace_sched_wakeup.c
@@ -378,7 +378,6 @@ tracing_sched_switch_trace(struct trace_array *tr,
 			   struct task_struct *next,
 			   unsigned int trace_ctx)
 {
-	struct trace_event_call *call = &event_context_switch;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
 	struct ring_buffer_event *event;
 	struct ctx_switch_entry *entry;
@@ -396,8 +395,7 @@ tracing_sched_switch_trace(struct trace_array *tr,
 	entry->next_state		= task_state_index(next);
 	entry->next_cpu	= task_cpu(next);
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
+	trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
 }
 
 static void
@@ -406,7 +404,6 @@ tracing_sched_wakeup_trace(struct trace_array *tr,
 			   struct task_struct *curr,
 			   unsigned int trace_ctx)
 {
-	struct trace_event_call *call = &event_wakeup;
 	struct ring_buffer_event *event;
 	struct ctx_switch_entry *entry;
 	struct trace_buffer *buffer = tr->array_buffer.buffer;
@@ -424,8 +421,7 @@ tracing_sched_wakeup_trace(struct trace_array *tr,
 	entry->next_state		= task_state_index(wakee);
 	entry->next_cpu			= task_cpu(wakee);
 
-	if (!call_filter_check_discard(call, entry, buffer, event))
-		trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
+	trace_buffer_unlock_commit(tr, buffer, event, trace_ctx);
 }
 
 static void notrace
-- 
2.25.1

