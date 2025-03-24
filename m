Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01DA6E2DF
	for <lists+nouveau@lfdr.de>; Mon, 24 Mar 2025 19:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A4810E4B7;
	Mon, 24 Mar 2025 18:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q1/vRZKZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D4310E4B7;
 Mon, 24 Mar 2025 18:59:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6A2D6157F;
 Mon, 24 Mar 2025 18:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BB2C4CEDD;
 Mon, 24 Mar 2025 18:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742842782;
 bh=NCVkBBLqtGEdnEQtLmXeFUs5qUUJkAaPVyk19HzOsBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q1/vRZKZ6irTIbINb2G8xvj5JvwxePGTa1IwANcWLuMQZSbp+VZk4sXBX2rpKtiHf
 jgueHIlr7xWMCCxp/L8Q4b2bR+ozy/Cx9atJwCnG2RknbUJ0UpRA/h5W64NWshr3gH
 B1stRIOEmM4x307ks17UFSNgJhkBwJluNve8dtevb2U28RMcT3/ljMsMYQeOI7iawV
 FGEpKtRUOAzBCQFT5LacXnrNmVn66zdnZtuo2rfau0sqoUgy4tfJXT0wywRYsS3sNq
 IMBMOYlNSPu0yYuGXR8m/a9uZ2CwTcwjeODNVpT2bFYm/HQ/DDSoQO5o9mTGQdXRpo
 oo4UcmTl7DLXw==
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
Subject: [RFC PATCH 4/5] drm/nouveau: Add new callback for scheduler teardown
Date: Mon, 24 Mar 2025 19:57:28 +0100
Message-ID: <20250324185728.45857-6-phasta@kernel.org>
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

There is a new callback for always tearing the scheduler down in a
leak-free, deadlock-free manner.

Port Nouveau as its first user by providing the scheduler with a
callback that ensures the fence context gets killed in drm_sched_fini().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 19 +++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_sched.h |  3 +++
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 2a0617e5fe2a..53b8a85a8adb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -415,8 +415,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 * The client lock is already acquired by nouveau_abi16_get().
 	 */
 	if (nouveau_cli_uvmm(cli)) {
-		ret = nouveau_sched_create(&chan->sched, drm, drm->sched_wq,
-					   chan->chan->dma.ib_max);
+		ret = nouveau_sched_create(&chan->sched, drm, chan->chan,
+					   drm->sched_wq, chan->chan->dma.ib_max);
 		if (ret)
 			goto done;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index e154d08857c5..95d677f6eae9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -313,7 +313,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	 * locks which indirectly or directly are held for allocations
 	 * elsewhere.
 	 */
-	ret = nouveau_sched_create(&cli->sched, drm, NULL, 1);
+	ret = nouveau_sched_create(&cli->sched, drm, NULL, NULL, 1);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index d326e55d2d24..3659ac78bb3e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -11,6 +11,7 @@
 #include "nouveau_exec.h"
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
+#include "nouveau_chan.h"
 
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
@@ -392,10 +393,22 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
 	nouveau_job_fini(job);
 }
 
+static void
+nouveau_sched_fence_context_kill(struct drm_gpu_scheduler *sched)
+{
+	struct nouveau_sched *nsched;
+
+	nsched = container_of(sched, struct nouveau_sched, base);
+
+	if (nsched->chan)
+		nouveau_channel_kill(nsched->chan);
+}
+
 static const struct drm_sched_backend_ops nouveau_sched_ops = {
 	.run_job = nouveau_sched_run_job,
 	.timedout_job = nouveau_sched_timedout_job,
 	.free_job = nouveau_sched_free_job,
+	.kill_fence_context = nouveau_sched_fence_context_kill,
 };
 
 static int
@@ -461,7 +474,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 
 int
 nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
-		     struct workqueue_struct *wq, u32 credit_limit)
+		     struct nouveau_channel *chan, struct workqueue_struct *wq,
+		     u32 credit_limit)
 {
 	struct nouveau_sched *sched;
 	int ret;
@@ -470,6 +484,8 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	if (!sched)
 		return -ENOMEM;
 
+	sched->chan = chan;
+
 	ret = nouveau_sched_init(sched, drm, wq, credit_limit);
 	if (ret) {
 		kfree(sched);
@@ -481,7 +497,6 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	return 0;
 }
 
-
 static void
 nouveau_sched_fini(struct nouveau_sched *sched)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 20cd1da8db73..e6e2016a3569 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -9,6 +9,7 @@
 #include <drm/gpu_scheduler.h>
 
 #include "nouveau_drv.h"
+#include "nouveau_chan.h"
 
 #define to_nouveau_job(sched_job)		\
 		container_of((sched_job), struct nouveau_job, base)
@@ -101,6 +102,7 @@ struct nouveau_sched {
 	struct drm_sched_entity entity;
 	struct workqueue_struct *wq;
 	struct mutex mutex;
+	struct nouveau_channel *chan;
 
 	struct {
 		struct {
@@ -112,6 +114,7 @@ struct nouveau_sched {
 };
 
 int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
+			 struct nouveau_channel *chan,
 			 struct workqueue_struct *wq, u32 credit_limit);
 void nouveau_sched_destroy(struct nouveau_sched **psched);
 
-- 
2.48.1

