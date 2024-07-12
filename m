Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46F592F581
	for <lists+nouveau@lfdr.de>; Fri, 12 Jul 2024 08:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAF710EBFC;
	Fri, 12 Jul 2024 06:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HO40hdj0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5810EBFA
 for <nouveau@lists.freedesktop.org>; Fri, 12 Jul 2024 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720765591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9a5IayKbXBKJrNi/QMZz5s0Prw5V2adYI5z3/V5xH40=;
 b=HO40hdj0O6HWp2q00Miqd7U+BfyQeedhm6RSt71HtgeM9br4V9SEBejpdzOApUDg3V0e80
 9Q5YwNO+g1t27aJAhUC8NAhgyUqGL5gncV6x19X6seehd+EfdGouq/a7P7kgrTximgm499
 z0U5LwJ0xg6+dItc46crKbrxqzxJDIE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77--sV2NA2kNrOnY75mp5OTDQ-1; Fri, 12 Jul 2024 02:26:28 -0400
X-MC-Unique: -sV2NA2kNrOnY75mp5OTDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4266fcb3166so730625e9.2
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2024 23:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720765587; x=1721370387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9a5IayKbXBKJrNi/QMZz5s0Prw5V2adYI5z3/V5xH40=;
 b=jH9qHy4tFPQ/qtHndCBFodQF4raAy9GUtfYMQhWL0pVOnqJWjYkcbbdXE83nkooL2h
 jVQNQHCNumOtAIqWTvbon5+DISvp/QVwPAk1z0rVX3o611we0spqCQYQ2Uz25H9mVg8V
 9lEiDHjD/TUw6lj+sbWJe3al55iAokBqX2JhiVh7doLOB41uR713JKPaFd4B9rYeUQqk
 51otU0kzB/ZWRLkMQc3p042/3+YOVpR7IG8ebivMtOxzyuxUEoCDPZTw5dOdBeAywbWe
 dSYKAcMUIh5dU0rIbhzHRX72SspvnFSuWFSM/vuYwaSGI/eu6kb+d9R8ji/eIFhxgLU4
 7V0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCig3VkX7yc/24QZ9sR0JJDkOE9dfI+zJktJglTn4oebgw8c5l7b1BYPz5kX7z78cBvJjj8TriKIEbkGN9ho5uY/v6Tl+p5YdmNTSwnA==
X-Gm-Message-State: AOJu0YwVzy0WHka/w7fEtcnXN4jgJs9sanAHUUwB2yRT/r0QjXH+Ihzj
 5pvrJHuKNdtyPh4oZpYn+ZM3oKrBM/NTCb6UktuzsYadDirPztdGA8xhr/sjX8k056k2LgRP9HA
 aSz02H9u7gzMRRTmSpNY6TeDsta7P4YKd7UqxN17ZPKyq9sydjH/hyUGVQrC1ZaM=
X-Received: by 2002:a5d:64cb:0:b0:362:1322:affc with SMTP id
 ffacd0b85a97d-367ceac1af6mr7196233f8f.5.1720765587435; 
 Thu, 11 Jul 2024 23:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKURcKatRXBWbit8UsmQ0Qm94LXmqPcy3DdNqKx6medY7O8ZyGlJX5YS/xZ14HpSQcyTLjgg==
X-Received: by 2002:a5d:64cb:0:b0:362:1322:affc with SMTP id
 ffacd0b85a97d-367ceac1af6mr7196220f8f.5.1720765587025; 
 Thu, 11 Jul 2024 23:26:27 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.fritz.box
 (200116b82df8b300fbf278adc06b342f.dip.versatel-1u1.de.
 [2001:16b8:2df8:b300:fbf2:78ad:c06b:342f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde891a3sm9322535f8f.61.2024.07.11.23.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 23:26:26 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH v2] drm/nouveau: Improve variable names in nouveau_sched_init()
Date: Fri, 12 Jul 2024 08:26:18 +0200
Message-ID: <20240712062618.8057-1-pstanner@redhat.com>
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

Rename "job_hang_limit" to "timeout".

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
Changes in v2:
- Remove variable "hang_limit". (Danilo)
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 32fa2e273965..ba4139288a6d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -404,7 +404,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
-	long job_hang_limit = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
 	int ret;
 
 	if (!wq) {
@@ -418,7 +418,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 
 	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
 			     NOUVEAU_SCHED_PRIORITY_COUNT,
-			     credit_limit, 0, job_hang_limit,
+			     credit_limit, 0, timeout,
 			     NULL, NULL, "nouveau_sched", drm->dev->dev);
 	if (ret)
 		goto fail_wq;
-- 
2.45.0

