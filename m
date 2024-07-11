Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBC92EDE8
	for <lists+nouveau@lfdr.de>; Thu, 11 Jul 2024 19:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A419010E27E;
	Thu, 11 Jul 2024 17:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PL7t3nGK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB610E27E
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2024 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720719369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PqZ5Lq7rcqKvViuzmKy6ImpdE7S1OOOZU2S6RM0SUzQ=;
 b=PL7t3nGK1EvxvvDhtA5A8FMvk7EydAxcHcwODd84Gp85EaKO5BzZistb1+zYU6xysZ4Jlv
 DkRM/xh+5R1KMqSLh/DSexd502T+9pez83Il7hQ7qCepyVtZM/7LyYTYWiBEqD9kabQJB7
 PRQXCCmexdRMmVC1OBVhrw25tINN2bU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-blHuzYKaPXucskzH_hsSww-1; Thu, 11 Jul 2024 13:36:07 -0400
X-MC-Unique: blHuzYKaPXucskzH_hsSww-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4267378f538so2201795e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2024 10:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720719366; x=1721324166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqZ5Lq7rcqKvViuzmKy6ImpdE7S1OOOZU2S6RM0SUzQ=;
 b=Inl4E15Gjw6IJk/uvXUDmsXayxBP9UGqn2FTEmcol5WQwrZzzooQSpcpuJpsZy3yaT
 vZ2CzKP9q4igD1Heev4hw8GmEEepf84vNzTQEHbfeOlJnaMJXL/d5R4kN7Ru4tymM4Ui
 oSuczXrEuqY0704X9kuWooYbLtUjNROIp5Tan5/kREvhZjt8SbOL92d4Ciz5B4V3PJig
 hd5B21bjw4XoFLJm/20MuV/PaTGkpPQ2iE4pNMdAzmrO/a5ZOJjuJyOmlLIaa1zyFS1A
 T0W27FLHcvTlrkShs1Edd9SVuALawVNj4mnZ4SpAMFMgu+BfN9Juz3dqo23d/OCPPMbb
 eZRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8pRVRDuFamfeJsmg1OyohnZEoxT5R8ELTQMedGdDtrl7LUjb2C+ivmDTawxsNfy3rBf8zHACT7A8ByASzGwAPFISgl+bn1x0wlzV3ug==
X-Gm-Message-State: AOJu0YxKwulwLbxe1lNgX2n3p16tvfSal+g4meZyN0ndAgeJUXI5qaAe
 1Ck1xo7woIwxlz+xq9FmOugoXv64CMGnmEapAu7jz9J5vC3uostDNcwBc/ASe1bsuLRUTmDnXys
 6PMRICDd6WNLiSr/wXa8kmzMv7vDAmSNyaq9PtJ13hguLTlY4j/YRJbD8lCE76cY=
X-Received: by 2002:a5d:6489:0:b0:367:9614:fdf7 with SMTP id
 ffacd0b85a97d-367f0545ecdmr2325019f8f.0.1720719366381; 
 Thu, 11 Jul 2024 10:36:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMfYTkbrTlZRWFy2Gd9pQVj1zME06oiFKdU2+UjDpE1fDMi5oLmElwlTGgF4rW+HmuC4lNjw==
X-Received: by 2002:a5d:6489:0:b0:367:9614:fdf7 with SMTP id
 ffacd0b85a97d-367f0545ecdmr2325000f8f.0.1720719366016; 
 Thu, 11 Jul 2024 10:36:06 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7e19dsm8242836f8f.15.2024.07.11.10.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 10:36:05 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] drm/nouveau: Improve variable names in nouveau_sched_init()
Date: Thu, 11 Jul 2024 19:35:51 +0200
Message-ID: <20240711173551.76148-1-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

nouveau_sched_init() uses the function drm_sched_init(). The latter
function has parameters called "hang_limit" and "timeout" in its API
documentation.

nouveau_sched_init(), however, defines a variable called
"job_hang_limit" which is passed to drm_sched_init()'s "timeout"
parameter. The actual "hang_limit" parameter is directly set to 0.

Define a new variable and rename the existing one to make naming
congruent with the function API.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..ee1f49056737 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -404,7 +404,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
-	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	const unsigned int hang_limit = 0;
 	int ret;
 
 	if (!wq) {
@@ -418,7 +419,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
 			     NOUVEAU_SCHED_PRIORITY_COUNT,
-			     credit_limit, 0, job_hang_limit,
+			     credit_limit, hang_limit, timeout,
 			     NULL, NULL, "nouveau_sched", drm->dev->dev);
 	if (ret)
 		goto fail_wq;
-- 
2.45.0

