Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8187EA77F
	for <lists+nouveau@lfdr.de>; Tue, 14 Nov 2023 01:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E85D10E41B;
	Tue, 14 Nov 2023 00:27:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02510E433
 for <nouveau@lists.freedesktop.org>; Tue, 14 Nov 2023 00:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699921664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5J4fqodbbCYSL/h4xMoPpkN5Vptab7PnzhqWcgRnbA=;
 b=ITSdgsq4t7Yuma6CFYc3ClKVgPgKLqcdoxZfOtSdDoXSBrKVCmCmQLknAsSbiywUC+19A4
 6dC73ykhdcFpzCQlC8tSlylnmM8rSMJXrPSPhwfxkhYDnROLBWSIp1h2iJIoAiEV4pd8OQ
 hqQgZ6mT0jwBj+SW/oQo05wGaYQLBuc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-2qjCA4ErMhmyDbLmq9VvLQ-1; Mon, 13 Nov 2023 19:27:38 -0500
X-MC-Unique: 2qjCA4ErMhmyDbLmq9VvLQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9e649334131so206338766b.2
 for <nouveau@lists.freedesktop.org>; Mon, 13 Nov 2023 16:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699921656; x=1700526456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5J4fqodbbCYSL/h4xMoPpkN5Vptab7PnzhqWcgRnbA=;
 b=wPxhCnWS3aWWOOKeoP1ugFByl+tcvEDjDCnv/4A1kukupuTtd4bX47Uthzz5FeCMEW
 uOekICUex/J93tcGfi+37RH3T5OszXtWmvKHh94nBIS7RHM3PlpD9s8LrUHS6OCEarJ7
 lyudJUDHgEH63ifE5sWiW2lEMkY9p/aOSapG5Inv601SI76rJu9QVm43LbojlDI1LeRf
 v3PARA8wZ6MUMkREv2gJzOcVDmnAlAK6zcfrM+9Kq4oX6s9PYIpVgfz32FfQWUJHUrcF
 RmnpiC1ofysgC7G0FUOfVy9I1n5jy3QeX9bMdoUYxzbLsvsnZrC7YLwdh2K53Qe9sZnc
 c9Tw==
X-Gm-Message-State: AOJu0YxTcNPxODpcnpg/kzIeWmxvlIi1PtpeT/yaThDiexGxbV39/Hq5
 OYsxLbMP/hS/u7QgaVCFFkMWejMqGGVD2bfWWIwN5SyJKwakQXJlra9ZRa+JrkTN+3Fj5ROf8YL
 rldk2PkuFBKq63pFyvq7t8DDagc+AV+0JejeRFX9G4WHIqjm+WcaOG89Ugsf4OcmTYWFhBlJIvq
 /TLUXe
X-Received: by 2002:a17:906:d297:b0:9e6:b18c:15dd with SMTP id
 ay23-20020a170906d29700b009e6b18c15ddmr5781305ejb.13.1699921656047; 
 Mon, 13 Nov 2023 16:27:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2vz3plUYhsrnU15w+dZzmrvHd/ehz5xDUmZBiywTDbKJ3n2MY8zG9ow9+gfZaeFU8vEqVAQ==
X-Received: by 2002:a17:906:d297:b0:9e6:b18c:15dd with SMTP id
 ay23-20020a170906d29700b009e6b18c15ddmr5781290ejb.13.1699921655695; 
 Mon, 13 Nov 2023 16:27:35 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ov22-20020a170906fc1600b0098951bb4dc3sm4696732ejb.184.2023.11.13.16.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 16:27:35 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 14 Nov 2023 01:27:25 +0100
Message-ID: <20231114002728.3491-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114002728.3491-1-dakr@redhat.com>
References: <20231114002728.3491-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 2/2] drm/nouveau: enable dynamic
 job-flow control
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Make use of the scheduler's credit limit and scheduler job's credit
count to account for the actual size of a job, such that we fill up the
ring efficiently.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 4 +++-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 9 ++++-----
 drivers/gpu/drm/nouveau/nouveau_sched.h | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  | 4 +++-
 6 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index f8e59cfb1d34..207945700c94 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -316,7 +316,8 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
-	ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq);
+	ret = nouveau_sched_init(&chan->sched, drm, drm->sched_wq,
+				 chan->chan->dma.ib_max);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7e5f19153829..6f6c31a9937b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -320,7 +320,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	 * locks which indirectly or directly are held for allocations
 	 * elsewhere.
 	 */
-	ret = nouveau_sched_init(&cli->sched, drm, NULL);
+	ret = nouveau_sched_init(&cli->sched, drm, NULL, 1);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 388831c53551..63c344f4f78e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -258,10 +258,12 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
 		}
 	}
 
+	args.file_priv = __args->file_priv;
 	job->chan = __args->chan;
 
 	args.sched = __args->sched;
-	args.file_priv = __args->file_priv;
+	/* Plus one to account for the HW fence. */
+	args.credits = job->push.count + 1;
 
 	args.in_sync.count = __args->in_sync.count;
 	args.in_sync.s = __args->in_sync.s;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index faabd662b165..6406d6659361 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -12,7 +12,6 @@
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
 
-#define NOUVEAU_SCHED_HW_SUBMISSIONS		1
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
 /* Starts at 0, since the DRM scheduler interprets those parameters as (initial)
@@ -85,10 +84,10 @@ nouveau_job_init(struct nouveau_job *job,
 			ret = -ENOMEM;
 			goto err_free_objs;
 		}
-
 	}
 
-	ret = drm_sched_job_init(&job->base, &sched->entity, 1, NULL);
+	ret = drm_sched_job_init(&job->base, &sched->entity,
+				 args->credits, NULL);
 	if (ret)
 		goto err_free_chains;
 
@@ -396,7 +395,7 @@ static const struct drm_sched_backend_ops nouveau_sched_ops = {
 
 int
 nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-		   struct workqueue_struct *wq)
+		   struct workqueue_struct *wq, u32 credit_limit)
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
@@ -414,7 +413,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
 			     NOUVEAU_SCHED_PRIORITY_COUNT,
-			     NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
+			     credit_limit, 0, job_hang_limit,
 			     NULL, NULL, "nouveau_sched", drm->dev->dev);
 	if (ret)
 		goto fail_wq;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 026f33d9b70c..7ba8ffec135a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -27,6 +27,7 @@ enum nouveau_job_state {
 struct nouveau_job_args {
 	struct drm_file *file_priv;
 	struct nouveau_sched *sched;
+	u32 credits;
 
 	enum dma_resv_usage resv_usage;
 	bool sync;
@@ -112,7 +113,7 @@ struct nouveau_sched {
 };
 
 int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-		       struct workqueue_struct *wq);
+		       struct workqueue_struct *wq, u32 credit_limit);
 void nouveau_sched_fini(struct nouveau_sched *sched);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index c95186b34ea0..708cd5f43cb9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1606,9 +1606,11 @@ nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
 
 	init_completion(&job->complete);
 
-	args.sched = __args->sched;
 	args.file_priv = __args->file_priv;
 
+	args.sched = __args->sched;
+	args.credits = 1;
+
 	args.in_sync.count = __args->in_sync.count;
 	args.in_sync.s = __args->in_sync.s;
 
-- 
2.41.0

