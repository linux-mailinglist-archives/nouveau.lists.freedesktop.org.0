Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42662F88D1
	for <lists+nouveau@lfdr.de>; Fri, 15 Jan 2021 23:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279B56E4BA;
	Fri, 15 Jan 2021 22:51:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D02D6E4E8
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:42 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m187so1966031wme.2
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2fukyLsotnyIO21hCJ1A0IUQV1SfrYh5wzz8JhsiiM=;
 b=gkPe4zQRnTIJ91SOxape8cRj/kO69GrgNLCMZTar3f1vt1Iv3INiFfoVT/oT69muaj
 rHbC4MoocQB7oWOMyPqd0PhTRoQrUybhIJLleeThAjJh18c5LtKtkskEoMwL6Wuee68F
 689gPeMLG2RIQCe4fo9R31pkp70ba6oPxfJqOwx6qAR47rC48hB4caKDT8H94DTWCTFM
 uxAQaIEviR4XWvzlJzuwiKcqwWIPfU3snEV7oGmY4Rjl/jAiKFLgX3o1KUw1MBF8HqeI
 HhcEfG6nCehTgn+SEwB9xYOy+m3bHhHzLpxfoK07S+mnsD04ZA9qMElbH3zWxlJrVoLZ
 eLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2fukyLsotnyIO21hCJ1A0IUQV1SfrYh5wzz8JhsiiM=;
 b=a6IdBR0DJwT1TrQ3WNsF2caGyKxO4j2woEU7xrkx7t/6POr8PyYfhkJyFJnGxc3Q39
 hpvnptARX6rBJ4E+JKWT649NU8U06C45T6UEFW3Izg3VyAXTIlJYp83eZ+rRc08uuVmV
 +TeZLVWj/gcPl2PumqaIpSPZyeJnOqpMWOdAaQLztYq7DNmTWcx9AaRDGo1mPlaWTSkw
 HmomlssphpsmZk4sYnMKa5coZB4snlAOqqSVP5/IdLy8IxOO1uX8kP+ZpzZnuLuzDa/y
 I4HHpIK8qYzroQLT/UN9vq96D30+3kEqLw4wNmLndziyuZqkaS256FCCfU8enWzC1TG+
 OPjw==
X-Gm-Message-State: AOAM530EqUwF0CVW9CEJWaa26cZCn+h2nR+tfJvsLwdyv45pO3mXW8DP
 wVlglI9dIEdlk3K+SIZWchxvXQ==
X-Google-Smtp-Source: ABdhPJwzAFS7Be8VkrVoNQgvyVh8GdN8DIxgBCBCbQEv+K0i2fq9aZe2mXAbWJUOB6yMre/SnSy8Gg==
X-Received: by 2002:a05:600c:2742:: with SMTP id
 2mr9826336wmw.94.1610734600647; 
 Fri, 15 Jan 2021 10:16:40 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:40 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 15 Jan 2021 18:15:57 +0000
Message-Id: <20210115181601.3432599-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Jan 2021 22:51:40 +0000
Subject: [Nouveau] [PATCH 25/29] drm/nouveau/nouveau_ioc32: File headers are
 not good candidates for kernel-doc
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:2: warning: Cannot understand  * file mga_ioc32.c

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index adf01ca9e035d..8ddf9b2325a42 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -1,4 +1,4 @@
-/**
+/*
  * \file mga_ioc32.c
  *
  * 32-bit ioctl compatibility routines for the MGA DRM.
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
