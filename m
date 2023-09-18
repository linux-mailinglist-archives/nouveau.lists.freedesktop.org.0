Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85E07A53BC
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2F010E301;
	Mon, 18 Sep 2023 20:16:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7F10E308
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:16:08 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c39a4f14bcso46130455ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068168; x=1695672968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFwZh6bcFAlbZQB8aUIkWI2a7MEinbCZ+5tZu4aoFkY=;
 b=TXvd6mGrYzMBA+cPrG9+SV8Skghw6WWypR1M8f3K1fhlPw/mGrJAWCsrUMiN964qPJ
 TC94rxFHASemr3FOruYnK7mBI/p7gZvVtwTPBam5+2f/hBdZdcNGG0DmsqVrwTBtAfbh
 74TcuXR8Z8W0UR5A+iwOnVWgtAvHjA6ZY5gzbIPUqx6aI+f7u/PqzuT8ITVgCbpcNYgf
 sh1bLOPDI1KbTvIn7X0iF0SKHibCOrZhkIXp8NlPdhiP8t+WcPA73qnZbYBkygVjqu6H
 BZXGKfqeOW68jp9Nz7Oa5sCrMCaJ4tOOzzq9G7jrQh6tEzMFoFwsw4Uv3V9OCX5jNe8U
 04Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068168; x=1695672968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFwZh6bcFAlbZQB8aUIkWI2a7MEinbCZ+5tZu4aoFkY=;
 b=wYWKMoili4X9so3NVEX7Kf8XuEVtukWUTTyyc/yQ6Mc33NPtRmPbXsKv3r7atcwYJZ
 0gfYes3d7lW5wvUGoKyFjHuDA4nPr99blzzhheGnco1AdecrLUoSwilZYcOAGcxGqaqP
 xTlKLVbHoMZVrnvVN61U5DRAVdho451F33zVc+BYLSqFUqVRlFeqTM1kQpuR+ss9uiBS
 OxfesGm0IP7KgC1z69JG7eZBQIhjayynSxiCyssGS98bzcds+ETHRzNmfPurs208B5mg
 X8BwXBpSZuRIl6DZq5hmX1y6jYZWcmgh/5Bi14kzn2u7MZCbNQTWPVg+hK8QZo1xEvJ3
 fhXQ==
X-Gm-Message-State: AOJu0YxIVMRcwzOZULpfHM7O83FCphElGB0BotX1tai/PwF73X5BQh0/
 DfHIHyfE9bunj/WyYfOl4mlleAQA2Uo=
X-Google-Smtp-Source: AGHT+IGWq+F7N8NnNwU+n2GYus6+q94tFqPC24H8Kdq6wElC5a6fvdG8gqIeQFXun8EeLHYD5WUQeg==
X-Received: by 2002:a17:902:e84a:b0:1c2:584:51c8 with SMTP id
 t10-20020a170902e84a00b001c2058451c8mr12917069plg.12.1695068167950; 
 Mon, 18 Sep 2023 13:16:07 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:16:07 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:14:04 +1000
Message-ID: <20230918201404.3765-45-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 44/44] drm/nouveau/kms/nv50-: disable dcb
 parsing
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- nvkm should provide all this info now
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c    | 8 +++++---
 drivers/gpu/drm/nouveau/nouveau_display.c | 8 ++++----
 drivers/gpu/drm/nouveau/nvif/disp.c       | 2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 189903b65edc..9e878cdc8e38 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2093,9 +2093,11 @@ nouveau_bios_init(struct drm_device *dev)
 	if (!NVInitVBIOS(dev))
 		return -ENODEV;
 
-	ret = parse_dcb_table(dev, bios);
-	if (ret)
-		return ret;
+	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+		ret = parse_dcb_table(dev, bios);
+		if (ret)
+			return ret;
+	}
 
 	if (!bios->major_version)	/* we don't run version 0 bios */
 		return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 99977e5fe716..d8c92521226d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -724,10 +724,10 @@ nouveau_display_create(struct drm_device *dev)
 	drm_kms_helper_poll_init(dev);
 	drm_kms_helper_poll_disable(dev);
 
-	if (nouveau_modeset != 2 && drm->vbios.dcb.entries) {
-		ret = nvif_disp_ctor(&drm->client.device, "kmsDisp", 0,
-				     &disp->disp);
-		if (ret == 0) {
+	if (nouveau_modeset != 2) {
+		ret = nvif_disp_ctor(&drm->client.device, "kmsDisp", 0, &disp->disp);
+
+		if (!ret && (disp->disp.outp_mask || drm->vbios.dcb.entries)) {
 			nouveau_display_create_properties(dev);
 			if (disp->disp.object.oclass < NV50_DISP) {
 				dev->mode_config.fb_modifiers_not_supported = true;
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index 09915f2715af..097246e10cdb 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -60,7 +60,7 @@ nvif_disp_ctor(struct nvif_device *device, const char *name, s32 oclass, struct
 	cid = nvif_sclass(&device->object, disps, oclass);
 	disp->object.client = NULL;
 	if (cid < 0) {
-		NVIF_ERRON(cid, &device->object, "[NEW disp%04x] not supported", oclass);
+		NVIF_DEBUG(&device->object, "[NEW disp%04x] not supported", oclass);
 		return cid;
 	}
 
-- 
2.41.0

