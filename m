Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EC1F2138
	for <lists+nouveau@lfdr.de>; Mon,  8 Jun 2020 23:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3DD6E9A2;
	Mon,  8 Jun 2020 21:06:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD106E9A1
 for <nouveau@lists.freedesktop.org>; Mon,  8 Jun 2020 21:06:15 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id x16so3374633qvr.3
 for <nouveau@lists.freedesktop.org>; Mon, 08 Jun 2020 14:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SAppPpa1LXhRlJGmkA2/z+Dr2Wp9y7xO4XPUfiSSbTI=;
 b=FMdXk7UIUD9h9hT2JCBx99SKW/dMCL5oH3fDczKvZ0nzxJQrfAN4X0iurpbXSHL0nS
 vtHXNxa8Be7Fxib+5od2v/PxcoayfScIZqjyQl/yjwxJ9PkA/0B4wQiRQpczNpaUiAYY
 pFEXQwulQWsI4A6igvEmvn+1UwZlTuaUu4ez8Y+Dm1BEc9QgugJNxa1gjtz2ZPkSMOh2
 SOsHwX4iMZOuJDf4x/YDHgyOKbQGBk15e72L6xiLe7qzsecxotKnXEsLA0zoxCl1ZeOo
 ytval+8WAOnSkZZD+ibMaX53Sjqq+ydt5GhwtbG9krZcZ8r7VC8nzxEC1XWKRdMKUxZz
 LMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SAppPpa1LXhRlJGmkA2/z+Dr2Wp9y7xO4XPUfiSSbTI=;
 b=GQbTmM30hH+J2zQKcxPhYR0b+sM/56aZML64oPPB79lRurH3Q3XQ8HUqoW7u+tltok
 fOTnqxj2poKRY+3ysnK2rPaSiNDU/W9MFuXfeYTams8UO29YiiJNfq1OmoPk5Z1iILwZ
 7OvSY0qzQE3DmOUrFBfmVjQnfXcu/YGywKe1Kux6roBCk+QU7nlmymBuV+I6egxQOPoG
 o1+2EZZkoNJDrB2s6ZjZjCRDlPTsYLEzwzBHhHBSqpOvblFkXQd5SmYXHXKgH8N92Koy
 jk22pAnMZ7+ipbh1aoMqiMw3agNDfawPTY3Ps8r1S6xygLes8wdQ11lSCqGm59EIGLpS
 3r8A==
X-Gm-Message-State: AOAM532gGIEFZ5vT3BDZvbS6XU8Js8bp+1ICA3gfcm47FQYnehZ1Rz/N
 G9yVQx5BeXneCCG4AojV0tprUA==
X-Google-Smtp-Source: ABdhPJwheOYqcswFZ16457m3Bo6nUhBN7dUfynfSbEg06VTr1WbBj6rbjgGaKPPvPZdbWDJYmkTPvg==
X-Received: by 2002:a05:6214:589:: with SMTP id
 bx9mr622046qvb.127.1591650374964; 
 Mon, 08 Jun 2020 14:06:14 -0700 (PDT)
Received: from localhost (mobile-166-173-249-24.mycingular.net.
 [166.173.249.24])
 by smtp.gmail.com with ESMTPSA id 126sm8226977qkj.89.2020.06.08.14.06.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jun 2020 14:06:14 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Date: Mon,  8 Jun 2020 17:04:58 -0400
Message-Id: <20200608210505.48519-9-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608210505.48519-1-sean@poorly.run>
References: <20200608210505.48519-1-sean@poorly.run>
Subject: [Nouveau] [PATCH v5 08/13] drm/nouveau: Change debug checks to
 specifically target syslog
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, ppaalanen@gmail.com,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v5:
-Added to the set
---
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_drv.h   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 696e70a6b98b..d60602db2cf0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -85,14 +85,14 @@ extern const u64 wndwc57e_modifiers[];
 
 #define evo_mthd(p, m, s) do {						\
 	const u32 _m = (m), _s = (s);					\
-	if (drm_debug_enabled(DRM_UT_KMS))				\
+	if (drm_debug_syslog_enabled(DRM_UT_KMS))				\
 		pr_err("%04x %d %s\n", _m, _s, __func__);		\
 	*((p)++) = ((_s << 18) | _m);					\
 } while(0)
 
 #define evo_data(p, d) do {						\
 	const u32 _d = (d);						\
-	if (drm_debug_enabled(DRM_UT_KMS))				\
+	if (drm_debug_syslog_enabled(DRM_UT_KMS))				\
 		pr_err("\t%08x\n", _d);					\
 	*((p)++) = _d;							\
 } while(0)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2a6519737800..b916d1f456cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -257,11 +257,11 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
-	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_DRIVER))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
-	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
+	if (drm_debug_syslog_enabled(DRM_UT_ATOMIC))                                  \
 		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
 } while(0)
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
