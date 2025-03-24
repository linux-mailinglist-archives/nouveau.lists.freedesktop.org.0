Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB242A6E2E3
	for <lists+nouveau@lfdr.de>; Mon, 24 Mar 2025 19:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7818910E4C1;
	Mon, 24 Mar 2025 18:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hEI+S8ti";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C89810E4C1;
 Mon, 24 Mar 2025 18:59:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9C12B6158E;
 Mon, 24 Mar 2025 18:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E580EC4CEDD;
 Mon, 24 Mar 2025 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742842786;
 bh=P28JeNDdfIsHs0Yhi2or+iZJOlxhsSMOqlD2e6764qc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hEI+S8tiXB6lfLuJVkI0sE26Hhm+jk4CtP8cYz87BVegLJIt0bT9M+kilzBThiz/G
 0I2bW94NAHsXkC68F49mB7kWekK5GY7z4ejygaTPUUHReCk5hX33Z/uPhtENnLo4Pe
 UEZTPz1jqCC6X/bm06/8sTNQPbr4E6X/ac3uEYdfuS6mAbEaNRquBUCAsSio5ScyKb
 tQTCyqCBKWTrDanoXtuqvkYPL4wYUHJEGeRgJV7N8WNieaqmhCyfQl1RbDRWamVu+s
 bAozn0aavxXUo503y+LkELMhIjivJ07kptjOrxbJC/qDYBaYc1MSE4vsk4kMUVlf2/
 ZxDQbaoiqxj6w==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/5] drm/nouveau: Remove waitque for sched teardown
Date: Mon, 24 Mar 2025 19:57:29 +0100
Message-ID: <20250324185728.45857-7-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324185728.45857-2-phasta@kernel.org>
References: <20250324185728.45857-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

struct nouveau_sched contains a waitque needed to prevent
drm_sched_fini() from being called while there are still jobs pending.
Doing so so far would have caused memory leaks.

With the new memleak-free mode of operation switched on in
drm_sched_fini() by providing the callback
nouveau_sched_fence_context_kill() the waitque is not necessary anymore.

Remove the waitque.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 20 +++++++-------------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 +++------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 ++++----
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3659ac78bb3e..d9ac76198616 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -121,11 +121,9 @@ nouveau_job_done(struct nouveau_job *job)
 {
 	struct nouveau_sched *sched = job->sched;
 
-	spin_lock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
 	list_del(&job->entry);
-	spin_unlock(&sched->job.list.lock);
-
-	wake_up(&sched->job.wq);
+	spin_unlock(&sched->job_list.lock);
 }
 
 void
@@ -306,9 +304,9 @@ nouveau_job_submit(struct nouveau_job *job)
 	}
 
 	/* Submit was successful; add the job to the schedulers job list. */
-	spin_lock(&sched->job.list.lock);
-	list_add(&job->entry, &sched->job.list.head);
-	spin_unlock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
+	list_add(&job->entry, &sched->job_list.head);
+	spin_unlock(&sched->job_list.lock);
 
 	drm_sched_job_arm(&job->base);
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
@@ -458,9 +456,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		goto fail_sched;
 
 	mutex_init(&sched->mutex);
-	spin_lock_init(&sched->job.list.lock);
-	INIT_LIST_HEAD(&sched->job.list.head);
-	init_waitqueue_head(&sched->job.wq);
+	spin_lock_init(&sched->job_list.lock);
+	INIT_LIST_HEAD(&sched->job_list.head);
 
 	return 0;
 
@@ -503,9 +500,6 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
 
-	rmb(); /* for list_empty to work without lock */
-	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
-
 	drm_sched_entity_fini(entity);
 	drm_sched_fini(drm_sched);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index e6e2016a3569..339a14563fbb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -105,12 +105,9 @@ struct nouveau_sched {
 	struct nouveau_channel *chan;
 
 	struct {
-		struct {
-			struct list_head head;
-			spinlock_t lock;
-		} list;
-		struct wait_queue_head wq;
-	} job;
+		struct list_head head;
+		spinlock_t lock;
+	} job_list;
 };
 
 int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..ddfc46bc1b3e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 	u64 end = addr + range;
 
 again:
-	spin_lock(&sched->job.list.lock);
-	list_for_each_entry(__job, &sched->job.list.head, entry) {
+	spin_lock(&sched->job_list.lock);
+	list_for_each_entry(__job, &sched->job_list.head, entry) {
 		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
 
 		list_for_each_op(op, &bind_job->ops) {
@@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 
 				if (!(end <= op_addr || addr >= op_end)) {
 					nouveau_uvmm_bind_job_get(bind_job);
-					spin_unlock(&sched->job.list.lock);
+					spin_unlock(&sched->job_list.lock);
 					wait_for_completion(&bind_job->complete);
 					nouveau_uvmm_bind_job_put(bind_job);
 					goto again;
@@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 			}
 		}
 	}
-	spin_unlock(&sched->job.list.lock);
+	spin_unlock(&sched->job_list.lock);
 }
 
 static int
-- 
2.48.1

