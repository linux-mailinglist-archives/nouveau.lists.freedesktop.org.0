Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E512EF9F4
	for <lists+nouveau@lfdr.de>; Fri,  8 Jan 2021 22:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FBA6E8D2;
	Fri,  8 Jan 2021 21:10:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF886E8C2
 for <nouveau@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id k10so8749922wmi.3
 for <nouveau@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0meb7DEluI5lCKKHhFh+KkZgGQmTED8UYQgsHtPH9AI=;
 b=b+8BELUy6TYHrFE+ojlTD5o+vZ/tEQjDu8czZAvyrxub0pcI6chJUoZ2lCPjCPjABv
 9+quXXFHdgT6Fpuo23j3qGFJi++XkryIYAjEaiCDSGXtAvRT9g1+Br7tew2FKxP4QU07
 gLqxjq5/JKGeu+mhZHe5oN34VfOToSNyGQZvfc3QyL3AhJpOP2PyMwkzdeDcf3JXETdM
 +H/AiCaoEElkLOGti7xyPj7B/4lLWROEMkhiKh6Nzrryo1rOp18oWdsPR1pU6AukN/Qa
 Xukv2856sxNpzczu/PirBr3Ic93WgRUohpIWkUXjlu+/FzLwF2/0auSZoWOC7qcY0LVT
 IPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0meb7DEluI5lCKKHhFh+KkZgGQmTED8UYQgsHtPH9AI=;
 b=cVXcT8ac9iGamjPCgW2t4feITawuzo001CmgwK++ghL9ot0U70D7U+O0B6DL+xGkAl
 TUGcW4lRtoicJ2zowhql+ajmJ5LkdFjNFHP/545VxZe3vH7ZTLz16KEPlaaJdSAoXcb0
 Lbk8aO8BrBAnRmSn+vQDFAmGnPeKynvEP1+9ceHVlQRn9jsNWTHwxiW+emviQDG9/R+/
 y7sH6MmyDMGQvZn2Y5YrqQpXxdS77YV8zLS9j/Tjzyk91FzjFMCbr+pjWBRZOcSiVhZo
 nlsc0kDFakG7jccTHuDHAnL9XjXoIE84V0OQzHr4HAsIYMC2Cw0DM4QVJv93j4c6yjxt
 HS1A==
X-Gm-Message-State: AOAM531ofz+r9+QoP4mdIZtcw8n/RY5uj4Qltba2hlaV9apTsjmR8F7q
 leLedI++cWKLcNuoG2Qla7BxlQ==
X-Google-Smtp-Source: ABdhPJypNc1DfLCl8VxEr0OvMckgJB9nFs1wGhAwDJWr8F5fydgjX/rVMxJA/ROmsyBPaHHuB4ie4w==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr4612278wmf.134.1610136952039; 
 Fri, 08 Jan 2021 12:15:52 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri,  8 Jan 2021 20:14:50 +0000
Message-Id: <20210108201457.3078600-34-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Jan 2021 21:10:28 +0000
Subject: [Nouveau] [PATCH 33/40] drm/nouveau/nvkm/subdev/volt/gk20a: Demote
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
index ce5d83cdc7cf7..207e5278b37ed 100644
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
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
