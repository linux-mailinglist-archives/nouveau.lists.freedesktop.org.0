Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18379FEF1
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F4210E53B;
	Thu, 14 Sep 2023 08:48:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A9A10E555
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:35 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68fbbea0dfeso549230b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681315; x=1695286115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1V5wbdA7WGHbaX5xoREZPjHls09ZyZEXST/ddV/NOYM=;
 b=qg/GC6DL/M9GfDEXx3n9dYrp1TjlkTumyl25MR3MPzOtzY96wMDoAuZJQf8RSMdV8g
 A7PyTYR+HruPKGJ6e5Edt8mORyP93e+b1GNF8TfKLp9TYEnnhZCdhBz/kdw9o0Sw8w2V
 wdhXRlfxP4fBAzY6WhrjfksFibnsalS33sxdj4/vF770R36Bgy6XmolXvIlnExUHJAsI
 5Ocu65aTLtjafUOiq9+FMO/hRk9YIeILndqJOFQKKxjfx5AAgjsmvIJ0dNu5RdX6O7LM
 MMfqcGCYNIvrzWVIuLRn4Cvykn4SGj9xbFLSlQD9tJO4v2b29TCjm8zyEDLvbt9O2oVu
 U2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681315; x=1695286115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1V5wbdA7WGHbaX5xoREZPjHls09ZyZEXST/ddV/NOYM=;
 b=U4e99yQ8OpcLZxNaAYbBVL9OasPY1CwUw4n8ZG3WfAsY9bI7eDR6OxngPHpRnOa5Rw
 Joijxxnx+WU/CRTZTlm8Oox3xEOMgXd7SmLpj+vsZ7LLnZYeeO6x5O43glgUZrANHdIu
 CqIfadeka8vKKaba9km2FRPAalcdDIR/njs9P4OAxnLYFJ9XRnXsgRs3uQo9mbBmmkCT
 UoE6IB7rNDw5HFfcjaMWtVyAC+BVSBCT/MRAbp6WkVPHyxIyzLfo5/pF2M5p53CdcRog
 PafrP6Vk4qlNGkV92MqSh7I9mJnRRC1tKOCx99HAPjLmdLom/yoN+HpnH8A1/+Z/1go9
 sGcw==
X-Gm-Message-State: AOJu0YwMG2Ml/1Y0jQ3zcY9VJdZSgg0Zb22D+BqXzNRd+PQFHpF86ne/
 VReMlMSY6TO4Wbn0Bh6LCufqG8f9GGM=
X-Google-Smtp-Source: AGHT+IGbr7XBOJ7W83nFDLeTqsvhfJmvweTZG1iCxkNqaikyAlMeGuETaIbWKA5pvES6sHpqPw+tEg==
X-Received: by 2002:a05:6a00:a1f:b0:68f:cba5:412d with SMTP id
 p31-20020a056a000a1f00b0068fcba5412dmr5437812pfh.32.1694681314661; 
 Thu, 14 Sep 2023 01:48:34 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:34 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:25 +1000
Message-ID: <20230914084624.2299765-46-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 44/44] drm/nouveau/kms/nv50-: disable dcb parsing
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

