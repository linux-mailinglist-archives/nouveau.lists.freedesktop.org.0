Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF7F341FB5
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 15:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F1D6EA44;
	Fri, 19 Mar 2021 14:36:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D576E9A9
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:45 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id va9so8266693ejb.12
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=yDpwOUtr8Y8qaTzYWOy1tt72khTzKSstlpxPsggpndpTO0YpW29THZpXQ9yaQtYC79
 68SiANuDXV2bSx2a9n5Y3wAC/eP0plAl1TGb6e+VnH1n4+0m5M9iXQI0YAoCJfyjI92r
 bJO4s7N++8FfpUyaw9clV/1j0pVHhkhv+aBOSJlq/c34rzYh33L12XhsLGnY+GSnpOSP
 clPV01gl/MoIDV/HszIHC/Uqp5oKYVVQgSfQ1CUHacjvw22R5vfaWmvOYp9Jg7ANcaMD
 SkYlMwCKcvaSKswcxaHWWBfBb47Q4a3HBm2iAsPljuDZ33X3VcDmgTCdML23L3pKNPM2
 Ed7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l3BFodeOPTMMoMJFhYQYaXV3COFge4hJ56ydgoQMcn0=;
 b=KQ/hp3z9GYY0asDfEM46gSVtWOvmq3GERcYFy/IXyWVMBqrDA9bbwkJAfe/Tvby6ku
 Jly/LghL4unxVq5f/KrvKqK5qkAP3LO5+ZtS5us6/xKo1ur93DzvzjPv7pHxAyUwimW4
 MinrzoKihZC3oNhRaIVw+WtLmGQo55m3+Yz3rfBW1NVp5YIuSWKrS6mODwOtwbUV1Rvo
 a+f8bAT3cfWw+hceV79Ocm1eZ5TA/4FlVKZFz2BbKIHtPVvo6jZtN3ibJA38+UaTL2oY
 nNXYozqjZP/XM/wEPmUJjbBDWMzM8JNlOlAMjhPdr7sqREBZTfjJAkJQ5vF/tgFTnLCv
 PF2Q==
X-Gm-Message-State: AOAM530l5BKNn4VLCpBeSJlMSOnRHoUsKvONPj4K54Md4DB0nIvxaUWJ
 4d6x/SkbKfjHgMuvNidz36vLyQ==
X-Google-Smtp-Source: ABdhPJxoo5i8vW6NNowcMoz9sB++W3ReJn5ajzefnBphKE7+Df6szDDubQQH7q/pELeFudxCf4ap9g==
X-Received: by 2002:a17:906:b4c:: with SMTP id
 v12mr3007707ejg.330.1616142284127; 
 Fri, 19 Mar 2021 01:24:44 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:21 +0000
Message-Id: <20210319082428.3294591-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Mar 2021 14:36:46 +0000
Subject: [Nouveau] [PATCH 12/19] drm/nouveau/dispnv04/crtc: Demote
 non-conforming kernel-doc headers
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

 drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set_regs'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set_regs'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'adjusted_mode' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'x' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'y' not described in 'nv_crtc_mode_set'
 drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'old_fb' not described in 'nv_crtc_mode_set'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index f9e962fd94d0d..f9a276ea5a9e0 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 	regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
 }
 
-/**
+/*
  * Sets up registers for the given mode/adjusted_mode pair.
  *
  * The clocks, CRTCs and outputs attached to this CRTC must be off.
@@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
 	return ret;
 }
 
-/**
+/*
  * Sets up registers for the given mode/adjusted_mode pair.
  *
  * The clocks, CRTCs and outputs attached to this CRTC must be off.
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
