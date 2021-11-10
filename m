Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2002144C220
	for <lists+nouveau@lfdr.de>; Wed, 10 Nov 2021 14:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8896E15E;
	Wed, 10 Nov 2021 13:32:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D596E15E
 for <nouveau@lists.freedesktop.org>; Wed, 10 Nov 2021 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636551124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R5O82lGkB3NN23PTLRdAp79haIJ8wleiAOOJrRsNtqo=;
 b=ZPelMwc87ouFhIsIUavKDthu61ZIgt9M5eU5/lf5wLwOEWe9Hqb32KKeoPqiGjFvNwUp/A
 jVnmaYtTMYDtDrDa4Ibll7jQyv8zWE0firiQ8mKehcZa4W+Sw3woFtudW6z4dNrfKTQMaG
 WxplQBic2YYHgAbKAnmnTVoB1gJjttw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-MqEOH2vfP4iWWTQUT1PBtA-1; Wed, 10 Nov 2021 08:32:00 -0500
X-MC-Unique: MqEOH2vfP4iWWTQUT1PBtA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1202493wms.1
 for <nouveau@lists.freedesktop.org>; Wed, 10 Nov 2021 05:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5O82lGkB3NN23PTLRdAp79haIJ8wleiAOOJrRsNtqo=;
 b=kTPR6dwZwXR/fOCW2OD4J6FUZa494MN9O7R1uDdfF81+LwYw1HDGAuyQB4o5Hj0V/t
 /CMI0W0ZJh+kTV9HeFqm0TclllVEs8lxp6I9B2AlaQQCPhJFVAFACldysqvQcn/m4j1X
 AjEw+u4bVefdD0UxmAuM6M3Yb9ZuMVr4/Tz7fxRO7lso4TPBNuUwCn5QXANX/1kvuXGF
 HPsM6KXOaaRCkJXySooU2M+qV3juVdHAAVmh74yAFqofEuNgFvd/KOmpveHfPHot2UNG
 aAO4ZW5UrK09rnwZRy52dVhoRWkRGYmTZ8D6jBj35jve9WvucWTPP4PxYwK90dwor0Js
 cGeQ==
X-Gm-Message-State: AOAM533bXegP/zyv1PNKcCh+gbzyjTI94LT90OMKE++itDmY+dEGf471
 AzTRNY44SKEzOYBTWR6UoDaH5kjZKS2STyAZIzhWg4vZLiWBw5Ex+RJv41nifw1ydxSgshQA+nb
 pj0XgyKdAW5G8fo60xNhF8soYoQ==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr15869351wmb.28.1636551119448; 
 Wed, 10 Nov 2021 05:31:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGGGzVwTOL8QLg2ck4YLOC7KbDdKHAN5gKNStHaLSAVi4yTBuNpaQQHI7zqpuTdkyTPJCjnA==
X-Received: by 2002:a1c:1b08:: with SMTP id b8mr15869311wmb.28.1636551119225; 
 Wed, 10 Nov 2021 05:31:59 -0800 (PST)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id 9sm30391203wry.0.2021.11.10.05.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:31:58 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 10 Nov 2021 14:31:57 +0100
Message-Id: <20211110133157.553251-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Subject: [Nouveau] [PATCH] MAINTAINERS: update information for nouveau
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Some side notes on this. Atm we do want to use gitlab for bug tracking and
merge requests. But due to the nature of the current linux kernel
development, we can only do so for nouveau internal changes.

Everything else still needs to be sent as emails and this is also includes
changes to UAPI etc.

Anyway, if somebody wants to submit patches via gitlab, they are free to
do so and this should just make this more official and documented.

People listed as maintainers are such that have push access to drm-misc
(where changes are pushed to after landing in gitlab) and are known
nouveau developers.
We did this already for some trivial changes and critical bug fixes
already, we just weren't thinking about updating the MAINTAINERS file.

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 MAINTAINERS | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8805df335326..270dc9c0a427 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5961,10 +5961,17 @@ F:	drivers/gpu/drm/panel/panel-novatek-nt36672a.c
 
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Ben Skeggs <bskeggs@redhat.com>
+M:	Karol Herbst <kherbst@redhat.com>
+M:	Lyude Paul <lyude@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 L:	nouveau@lists.freedesktop.org
 S:	Supported
-T:	git git://github.com/skeggsb/linux
+W:	https://nouveau.freedesktop.org/
+Q:	https://patchwork.freedesktop.org/project/nouveau/
+Q:	https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests
+B:	https://gitlab.freedesktop.org/drm/nouveau/-/issues
+C:	irc://irc.oftc.net/nouveau
+T:	git https://gitlab.freedesktop.org/drm/nouveau.git
 F:	drivers/gpu/drm/nouveau/
 F:	include/uapi/drm/nouveau_drm.h
 
-- 
2.33.1

