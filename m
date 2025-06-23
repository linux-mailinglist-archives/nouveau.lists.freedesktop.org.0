Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8CAE554E
	for <lists+nouveau@lfdr.de>; Tue, 24 Jun 2025 00:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5510E46D;
	Mon, 23 Jun 2025 22:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="iS9JG7yK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CE910E46F
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 22:09:52 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6fad79433bbso45452326d6.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1750716591;
 x=1751321391; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrkeGXcopvS5zvz/vg3v4v635JNtDuSfnXEaK+Z4RIU=;
 b=iS9JG7yKZZwevUjZdh//2i4csnqbYxaV8YkzQ/69Ab77z3AGT/NyQcnELojnkkXq3F
 Bc9K+vRBa+6fE2A3mqAedEO9T75Bgy8BboxdNR4fBxTs03SPG24+nkWTx1QMHYnM5kW3
 tj82TyvQTGFwHeOeF0wj5JRNK5NFl7Aams4iq+aN/VMUAJ6UhB64EQEpOj7lFqCHsD09
 R6J3zTKZv5gLpSZHuzEj3YXKY3JSaHdbc5US/k6wzuPieWi/45MtsEgAVtO3et0vM7N7
 ZMuTDox1ORROQmFUj3SyWcs27AzLLOALJsyx5962LyeED0N3srDdFSbuo0ENH6ljmYsX
 bR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750716591; x=1751321391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrkeGXcopvS5zvz/vg3v4v635JNtDuSfnXEaK+Z4RIU=;
 b=hlLPqpQ1Ps++9H/aXWSgQnLrpqfhyJZHUZqc+PdZshVfoHqcUMANq5wjCj78PgFBbS
 Bbges4LRmlRj1kcmMgNav29PDyJ3rMJrHOW1p067ga8HPCokO4CyTJli2SlUTcfe71+9
 83K+lHEB/lfvDlhTbdx9ZwUiZZ0LeQ+q2hEgG8bcKi3mobFHZ62CArspUtNEoKVvOTi9
 FY062nFW34Lvir7DvxRDl8VFKcc9zAKgNXtRl/IUy5YeMwAxK8yfCkNoT0Cj7Z2eqtwR
 /u4AWDM/6A/UkKmCAdZZBee4Z/8lDNnl3mNWQE7+B31V9RBXf2+wc8P7/z0plEinxNAO
 9s/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWab0pivsFhMtak2Ba2LccSfirw5IQDfby7IUJQHiR1+9yIncNa4XA+GmBDrSwIVLt3sVMh6bLA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCqyPsBkFP2WaS9XyFGi7XukdciA53War5Z8KWTVDOXQcr2gS8
 +n6z0JoO7vvHDbpg3L4YrmcjO+AJTJlgt0YpS1Xk2tCSMjUqkcy6v/S1EhSurG62Jxc=
X-Gm-Gg: ASbGncsy6OMYaZ0otgQYDdncwHbT1SdHoZ7833HfrF/lNkd5aW0nKGr8o6hvhJW48A3
 Hy22kocgnui9FCvyOSlfeYL4/2wlj/L3/54kYhE5SthO6q6zMo8+mnPmkiW9lcZvnkrXcBim4RH
 h1KH0gtfOHfk0DTGOsl/uk7X2NbAZF4FeKB4c6XLdPVWNWNb1VVel+2+VSQO42047+jwhyIQCPm
 hVCTsyrrvHJVWzGMIGpexZ6yxfOu1cDcqI4WDzeTYKPOeTPPTif26zfaYCehlib+hFR7gRaqxA+
 jF0fijoUPd0ymi8X8vZeNgQ5QlN8YYcqBCF5YFnB72Mr5UhxZDon8g4MHZ+hPy+jI1mHQdlgvrO
 abz6YPkxu2s/A8SqXgLZTjt1BZ4W/L0jar2MX6Pf/LTIz2ANBDPU=
X-Google-Smtp-Source: AGHT+IG1ICCdIoZvmRMhW0AWQJ0U2kQiMNTTwq/2mRvUAzlizBv01XX7ya32XhBYGhdiqm4deIUuwQ==
X-Received: by 2002:a05:6214:20c4:b0:6fa:cdc9:8afa with SMTP id
 6a1803df08f44-6fd0a50af00mr238352106d6.17.1750716591003; 
 Mon, 23 Jun 2025 15:09:51 -0700 (PDT)
Received: from m-kiwi.verizon.net (pool-71-167-25-61.nycmny.fios.verizon.net.
 [71.167.25.61]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd09425af6sm50019856d6.27.2025.06.23.15.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 15:09:50 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 1/2] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 23 Jun 2025 18:04:01 -0400
Message-ID: <20250623220909.7591-2-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623220909.7591-1-mhenning@darkrefraction.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This option was originally intoduced because the GSP code path was
not well tested and we wanted to leave it up to distros which code path
they shipped by default. By now though, the GSP path is probably better
tested than the old firmware eg. Fedora ships GSP by default and we
generally run CTS on GSP. We've always been GSP-only on Ada and later.

So, this path removes the option and effectively sets the option to
always on. We still fall back to the old firmware if GSP is not found.
This change only affects Turing and Ampere.

Users can still set nouveau.config=NvGspRm=0 on the kernel command line
to force using the old firmware on Turing/Ampere.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index d1587639ebb0..c88776d1e784 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -102,14 +102,6 @@ config DRM_NOUVEAU_SVM
 	  Say Y here if you want to enable experimental support for
 	  Shared Virtual Memory (SVM).
 
-config DRM_NOUVEAU_GSP_DEFAULT
-	bool "Use GSP firmware for Turing/Ampere (needs firmware installed)"
-	depends on DRM_NOUVEAU
-	default n
-	help
-	  Say Y here if you want to use the GSP codepaths by default on
-	  Turing and Ampere GPUs.
-
 config DRM_NOUVEAU_CH7006
 	tristate "Chrontel ch7006 TV encoder"
 	depends on DRM_NOUVEAU
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 58e233bc53b1..81e56da0474a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -383,13 +383,9 @@ int
 tu102_gsp_load_rm(struct nvkm_gsp *gsp, const struct nvkm_gsp_fwif *fwif)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
-	bool enable_gsp = fwif->enable;
 	int ret;
 
-#if IS_ENABLED(CONFIG_DRM_NOUVEAU_GSP_DEFAULT)
-	enable_gsp = true;
-#endif
-	if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", enable_gsp))
+	if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", true))
 		return -EINVAL;
 
 	ret = nvkm_gsp_load_fw(gsp, "gsp", fwif->ver, &gsp->fws.rm);
-- 
2.50.0

