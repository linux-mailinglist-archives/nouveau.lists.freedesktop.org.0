Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD22F88D2
	for <lists+nouveau@lfdr.de>; Fri, 15 Jan 2021 23:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595956E4C4;
	Fri, 15 Jan 2021 22:51:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9716E4F1
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m4so10191997wrx.9
 for <nouveau@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uVp68mdiDdBXS5aeK/400FDUtXHrGa18qKz0SHB/q8Y=;
 b=FZ8N+MseSySo4v1ZYJtrG+RSruEOZbWyzJ1DhpH1v0o9O26kSKf9zYaVCXBCYmJ+EC
 VoxYOA5ngWznxOD7xhM2a0Pkaizwwul9w7Rfjcea5PZaJm1aoa0R4crh+20jESbp1kdK
 umz/oOgofPJ5OhfLo6ROYuKEi8ubJWt7mD7CclpQig1hod1srd6KCwkwIc7FESEoj9il
 zDkA2g6rDRYYmoOHUF5t8Lvf5nek8ri3xn0b2lRsszC/PWDWrDpS9axdl2fnukKBGjXd
 5BhHxJV9fsMGGK2Pu3BvSUx0NH1avx4aYo88U1gblimRQ9gQnqZLnM3IMbWIRhg4VHl7
 KkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uVp68mdiDdBXS5aeK/400FDUtXHrGa18qKz0SHB/q8Y=;
 b=s2MOnb9ewCKCfiVHRTR+x899nHyJNgN/nZO0gIzR/5u6/5vyv1Tn3SiAXM5HXca2US
 9XuYw/fW9FuqFkvGmTwh0t4V/vnJXBIPkr1GE+fiCUs33GWpJLt+UMWKEnGmEXeWMAo2
 XG9KCHENzLbwe4IZS1STzbZxyWUUA99MOeiwU/XjOXEiUazUyhd474G3yWyeprl3kjgn
 Tz88WLwnwqXBdcg3AYlmku+Oq4ps3sW41VuiRcZWESF+FAQhMYJQxEGAxtBw0O2hMAHm
 yJRnJaouv0nw3GaLrnHiot+p6UEGNa/4X/KnQBBRg5rWaNFkSmbJpu+35EdfIkVYc0OB
 XGaw==
X-Gm-Message-State: AOAM533JAtP+Y9ArIn1xWiuou5/0+gLLrM9xZddKqBUvR7S3A4P0mtb9
 jGOtoXfJDhYzW/t8S7iicRCc9Q==
X-Google-Smtp-Source: ABdhPJwrZlGGrGjAf3GMC7apd31gRe5Dhy4mYcG3vGI74Rt7B8oSthJtP0F4vFDP74WcZg3XO1aKvg==
X-Received: by 2002:a5d:4fcf:: with SMTP id h15mr14103236wrw.323.1610734604791; 
 Fri, 15 Jan 2021 10:16:44 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 15 Jan 2021 18:16:00 +0000
Message-Id: <20210115181601.3432599-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 Jan 2021 22:51:40 +0000
Subject: [Nouveau] [PATCH 28/29] drm/nouveau/nouveau_ioc32: Demote
 kernel-doc abuse to standard comment block
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

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'

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
index 8ddf9b2325a42..2af3615c5205c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
