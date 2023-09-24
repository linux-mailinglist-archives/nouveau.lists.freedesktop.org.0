Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937427ACCD2
	for <lists+nouveau@lfdr.de>; Mon, 25 Sep 2023 00:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A20610E15D;
	Sun, 24 Sep 2023 22:55:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657DA10E15D
 for <nouveau@lists.freedesktop.org>; Sun, 24 Sep 2023 22:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695596132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tii+DbstlduWpNrVxfiDMWTWENA8qiMAt5c+WiPaGkY=;
 b=Wy+XcZedwRa7c32YAGBFvQ7WHhik+Qbzv6EFBJEyAR6Yv8KslkPx+ei+GPmBAjfqOhpAIo
 1OW6f3Swat4UX532gp9CeKd7BzdNvgKgVBqPLlaTauIQVaT/CIRysDy2IW4RqANrQ+1Ump
 EaGGQci/A6wNTV9ILkmaDzHs292Z0vQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-Ovd8T68gMx6iQA0stCAplQ-1; Sun, 24 Sep 2023 18:55:31 -0400
X-MC-Unique: Ovd8T68gMx6iQA0stCAplQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9aa20a75780so407884966b.2
 for <nouveau@lists.freedesktop.org>; Sun, 24 Sep 2023 15:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695595825; x=1696200625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tii+DbstlduWpNrVxfiDMWTWENA8qiMAt5c+WiPaGkY=;
 b=ThZr8Sq81SN4xXyxjYXLncdDPmrCA2z681iSLNtHtuiEZfs8VtTSFO+SD9iFgKMrX9
 oyoCuOsa1KLgd9kO1FzQ8X8Q51uoQR3e9OnmH0T8oKRXVd/jLH9T8v1R/bFRluQitgBb
 XRYFEXYYRIVYW4GZrAZJ2p3VqK+pBowXqtVHdDsA73L8NSv2+qf8ZUG59691CDHVLGW1
 aJr/WdV3ieYQH2RqrK9YTPKb2B9UPTS2Wwrjg8BvmrnzticU/UYe/gYxEYxKS2CpGHID
 n26+rPjcAt+Y2TbMzgyXfheGEJAEd4vDEmcJIMBvTVWmuKgCv3/H/8N2oguYW/jKkQml
 glrw==
X-Gm-Message-State: AOJu0YyijY4MxgHHGI2iASbgUzC7fXDdHb1NkOKBDx0+UTJxeaPDPvpS
 xWnCj4qSBhaow5nPDEU6o9SA2yK3vuHy5L185WPwy6O2ILPEJ9RupsVBhX0lL5fxKqjjCMoGaFW
 R7owcPb2/nvJYL/FX7vnF8eXuRgZKIViTWQnduSeUs2ihFWXT/9Znmu9f/IjPE1I9gKKlhxZAbn
 kczzEZ
X-Received: by 2002:a17:907:2ccf:b0:9ae:5270:46d5 with SMTP id
 hg15-20020a1709072ccf00b009ae527046d5mr4397312ejc.73.1695595825407; 
 Sun, 24 Sep 2023 15:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3P4/aha7Vz1hpsfe4qBL5Vd8qq3ii1Jiy+XAIFaMeyRPKpEDwD0/8PtuK+CnXgY8+Y0uP0Q==
X-Received: by 2002:a17:907:2ccf:b0:9ae:5270:46d5 with SMTP id
 hg15-20020a1709072ccf00b009ae527046d5mr4397302ejc.73.1695595825096; 
 Sun, 24 Sep 2023 15:50:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a170906831a00b00997d7aa59fasm5570325ejx.14.2023.09.24.15.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 15:50:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 25 Sep 2023 00:49:09 +0200
Message-ID: <20230924225018.17701-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924225018.17701-1-dakr@redhat.com>
References: <20230924225018.17701-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 2/2] drm/nouveau: enable dynamic job
 flow control
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

Make use of the scheduler's submission limit and scheduler job's
submission unit count to account for the actual size of a job, such that
we fill up the ring efficiently.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
This patch is based on Matt's scheduler work [1] and [2].

[1] https://lore.kernel.org/dri-devel/20230919050155.2647172-1-matthew.brost@intel.com/
[2] https://lore.kernel.org/nouveau/20230924224555.15595-1-dakr@redhat.com/T/#u
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c  | 3 ++-
 drivers/gpu/drm/nouveau/nouveau_sched.c | 9 ++++-----
 drivers/gpu/drm/nouveau/nouveau_sched.h | 3 ++-
 5 files changed, 11 insertions(+), 9 deletions(-)

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
index dbe1f08ac540..2b695c521821 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -317,7 +317,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	 * locks which indirectly or directly are held for allocations
 	 * elsewhere.
 	 */
-	ret = nouveau_sched_init(&cli->sched, drm, NULL);
+	ret = nouveau_sched_init(&cli->sched, drm, NULL, 1);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index 5a70fcf571f7..5d1533b413d3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -253,10 +253,11 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
 		}
 	}
 
+	args.file_priv = __args->file_priv;
 	job->chan = __args->chan;
 
 	args.sched = __args->sched;
-	args.file_priv = __args->file_priv;
+	args.submission_units = job->push.count;
 
 	args.in_sync.count = __args->in_sync.count;
 	args.in_sync.s = __args->in_sync.s;
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 0dbd0ea6d02e..6b32fd4eefb0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -12,7 +12,6 @@
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
 
-#define NOUVEAU_SCHED_HW_SUBMISSIONS		1
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
 int
@@ -77,10 +76,10 @@ nouveau_job_init(struct nouveau_job *job,
 			ret = -ENOMEM;
 			goto err_free_objs;
 		}
-
 	}
 
-	ret = drm_sched_job_init(&job->base, &sched->entity, 1, NULL);
+	ret = drm_sched_job_init(&job->base, &sched->entity,
+				 args->submission_units, NULL);
 	if (ret)
 		goto err_free_chains;
 
@@ -387,7 +386,7 @@ static const struct drm_sched_backend_ops nouveau_sched_ops = {
 };
 
 int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-		       struct workqueue_struct *wq)
+		       struct workqueue_struct *wq, u32 submission_limit)
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
@@ -404,7 +403,7 @@ int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	}
 
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
-			     NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
+			     submission_limit, 0, job_hang_limit,
 			     NULL, NULL, "nouveau_sched",
 			     DRM_SCHED_POLICY_SINGLE_ENTITY, drm->dev->dev);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 026f33d9b70c..c1d603759914 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -27,6 +27,7 @@ enum nouveau_job_state {
 struct nouveau_job_args {
 	struct drm_file *file_priv;
 	struct nouveau_sched *sched;
+	u32 submission_units;
 
 	enum dma_resv_usage resv_usage;
 	bool sync;
@@ -112,7 +113,7 @@ struct nouveau_sched {
 };
 
 int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
-		       struct workqueue_struct *wq);
+		       struct workqueue_struct *wq, u32 submission_limit);
 void nouveau_sched_fini(struct nouveau_sched *sched);
 
 #endif
-- 
2.41.0

