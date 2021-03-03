Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F232B880
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6C96E9A7;
	Wed,  3 Mar 2021 14:09:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4396E8F9
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i9so5241036wml.0
 for <nouveau@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=NUDheECZVxO5psCuCN1jM1xoZZajGPU7kVwWlnJ5mOiEUeZbufPZ3v7TtA6Mx91EwB
 1/eF9EQNvIVocgKdeUQr0i2ecHyxb2WvhGSpDs7vAlW79wJXc8BwVpIvUK9osgeDoQK9
 WQFjHYVajsn3pUsX0ce82bUYFY4YdoT9oAONAQt5o8wD29NlaynJv1vdmr+WN3q/P8ig
 cw4qY6aUnXiA+GZMlw1UE6KTSoQw6EYAjVktZ74xQsBtNL7ncpmrBeeEkrJG0GmoPSAE
 Im1UMfhp+V3Mgq1bA3ZghrYEcOE/U0l0pugJp5ElXdJaz/8FqB6GR2egDZ/lE4fpw9st
 YE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QN4aBNwxKOCABxwfpyuG0Xk/7oUm3WT2PgkGnXFzadY=;
 b=QIEvK5cBwxfDjfAwZx1lfaQk81FJmcW17K0n4gmdPZhc4yJ1FcfA8hTdtb8mVnc9LP
 lft0NRsOYQUkOt0ZBhIRTgFchsGH85pSfTEEJW3kTHzROfZd3FWQctfjUZAl2b+m3tsN
 eFEDpuN95Zgkea9XqxB144KziNKHpWP8iE5o50DUKhIBQ1TOzrKsVhvHR7sP1oR2ehT/
 u5SzSDYSYkJTFug8WwFBOzcxfcGFOM5SdjE4UvVmiI40bdXqJvq4zwUsTC4u97mrG3QK
 mOpHK0X7z0rJ7O4DKg0bykIuVUS6SwqHQBDqG9d3sfg0ZzcKe5Zh2xE2/Tp58nRgwNKf
 FwlQ==
X-Gm-Message-State: AOAM533oes/d5kF61ZYta7jpiFqymILqYdCz+7zaxfL8BQ4Dr85MB3mT
 5FBkLIrX/AHsZeRDlDRAlwugMQ==
X-Google-Smtp-Source: ABdhPJwcbMgfY9dGf7vvbejG7AuPgCa0xeZZHmufjdUVKRtz1yvR/8lwcGHSFgXlR3Fr+RfMadR6zg==
X-Received: by 2002:a1c:2c05:: with SMTP id s5mr9141833wms.70.1614779031936;
 Wed, 03 Mar 2021 05:43:51 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:46 +0000
Message-Id: <20210303134319.3160762-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Mar 2021 14:09:43 +0000
Subject: [Nouveau] [PATCH 20/53] drm/nouveau/nouveau_ioc32: File headers are
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
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
