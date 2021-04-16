Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B076362274
	for <lists+nouveau@lfdr.de>; Fri, 16 Apr 2021 16:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183266EBED;
	Fri, 16 Apr 2021 14:37:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B8C6EBD0
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:36 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id u21so42484895ejo.13
 for <nouveau@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K5sJeJ74F8ymxQq/7xf9FhHZmcrAt5y0yMPNHooyiic=;
 b=GNUjqZlY8Kl2oKWTYfDjRC6Bi0UwDOz5BY+3/90ITbTGw1I5bVp5jcRfIVnye3m01c
 kKgj+r7sRHsEVxsKvDb1rkMcG6VBXc7OO77OIzsm5gp6Tm5o2Ybm95bSPsNPZHfVhXm9
 cMNMakfEsGZetcMqpCCdCzyDW91IA/O39zSCluuZUY5k498jh2pjpHV1w6P/+/E05xDJ
 vEFCCgkpnKlrVRJZn78PRl0WH8z/MbKrGlQ8td805dEL6CrmR7l82UEHNh/D+wF1JAp6
 B6MQRW5C+hwPkYHtufL76OL6mw+Y0HEzW36Zhww+tOhU6Gdrdkg7YAzWeTMT9Sa6fCvO
 McHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K5sJeJ74F8ymxQq/7xf9FhHZmcrAt5y0yMPNHooyiic=;
 b=iDoXYBY0ApU1OWjVkXSeJVu5K9XHm7BUZkMIaNg3ntm3SlRu2bTFTwULBx+ZhGx4TB
 IzXT8FxJ2mgJEhHYxuvOEunhpUlPyf6yfti+yoPc3l5cCT4Th8KxqwnnAIu62IlG6XWP
 eu9ghM4DybWP7PwhAIuoxsC7S6zp3kd5U+FVEWRMDLtCUJiuyKSIFiDesPpuqAh24x6X
 5YeCDBH9INbl0PyKSG88O2hQyfyiEBA7itqUtlkovIKkazkzWVhXa3tN1vlTJ2KLrHQO
 1V5TCHr3X+DDldhdOKLAecRssu6dHQuY4bIuxcvr1BPM0q0RTcwz29HmjTBj/VBsHPw7
 E/kw==
X-Gm-Message-State: AOAM532l6D2wBo+MpFBqQV4yy6vHbB6L84wqqLUI2yjqDDRyeQsD+vJ9
 Rh3/pGTJwbJWQEN57xUrlbjTIA==
X-Google-Smtp-Source: ABdhPJzeAdNjaV86qp+Bo4JoUnmQHDmeRr10sFXjgLzJyl2WD/wK74u47FQmEv5jItHf1QrjTc45SA==
X-Received: by 2002:a17:906:cb1:: with SMTP id
 k17mr8539035ejh.307.1618583855594; 
 Fri, 16 Apr 2021 07:37:35 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:35 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:50 +0100
Message-Id: <20210416143725.2769053-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 05/40] drm/nouveau/nvkm/subdev/volt/gk20a: Demote
 non-conformant kernel-doc headers
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

 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'temp' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 't_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_t_voltage'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
index 8c2faa9645111..ccac88da88648 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
@@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] = {
 	/* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
 };
 
-/**
+/*
  * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
  */
 static inline int
@@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, const struct cvb_coef *coef)
 	return mv;
 }
 
-/**
+/*
  * cvb_t_mv =
  * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
  * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
