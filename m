Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30587B0CADE
	for <lists+nouveau@lfdr.de>; Mon, 21 Jul 2025 21:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F3C10E5AB;
	Mon, 21 Jul 2025 19:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="jCq12FB0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A36510E5B3
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jul 2025 19:12:36 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4ab3802455eso62005741cf.2
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jul 2025 12:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1753125155;
 x=1753729955; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7cmh9zZEdqiV3NmqqAUhDgNdsvYT/9RhKyW5oIISWXc=;
 b=jCq12FB00lRq24VS5CBeeq/nxzg/2WqwgVet99kd+ed+sSK8OuM8Xcj7qtESWvUR9R
 EKtVT+AA1Dk8MGokMHTP5ZqpZwml3iT3GQH+8cImyOMfqln3ks7P2LZcUT33fA0hvvRR
 t0OI4pSmgwE7R0h0I2dbSo2ER5XyG/pLWbP2wToH8902bdVK7lfWYAQjgKlfIg5HqF1a
 wS+2OEeN41BXGzNrgB1Cxnpgt4h6qUJ8TleBkuCFoVxxgGCIgCUxPsH0gS7zypHGFjyL
 HYg6rDF6nfA30r/RChigytmtodtWG/Pg8L15E2pMWXmwkn+nMbS5pks7mvDwqd/cSmE4
 f9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753125155; x=1753729955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7cmh9zZEdqiV3NmqqAUhDgNdsvYT/9RhKyW5oIISWXc=;
 b=Ytk5yiyD3ks/3c5fBzI9tW7sNDIWYDzL5abIsLtsF2c+nRdJcA2nyt9ah6QryjWW8c
 ZA8WKtFtNUmOta81+aXlLlzOR2QwrloK8RdVIalyiEAaI0PPxC/m98b61zO+vvXvmQIt
 gDtL23FJoQbLBBsPaqZI1oohxdin9Lm4Cf0CVgLlyMG4Szn3ZzNHYSCvfCJImvbLyZG5
 QCEP/MDan45pLvK8+Qhit32jFdH0qVRVDepjSVqVphD4KkUvt/j3wnv/5XBBhUl0holM
 KHtw2ZjHKcfBwL9FaOs3aEufp4fmAAI9lphGuVJmKmxB+lLo5SAoiI60mRLqcFfg6oxn
 5cyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP/ZPdwZq8tYInIH/OsPV6kK/D8CU16q3a0o+vjW8qk7tkDy7qeXSryLFADRd6X8mVDVFYl50u@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBLdWAbc5vxyGUWA0quSc2pnXod/83pyHNmt0SwlUDMhlIWz6P
 hxyTTbVbHcvTzN3+Sm7BO4mEUFTeWcJvDpez/24L8214/K89iFEOQfv68RCIe/2InOc=
X-Gm-Gg: ASbGncsWVh+nFfdzdxBskuRvz7imdtffn2VV+LfUL3TUfRb1LCp8WZKt4zGbWqT8GYH
 3g1+4Xqmol3A+r2pAEVU4s/FKWW251LKO9luj6ixlphdPNKkr1py0LXZHHHKlQYhwOd/Pe0ZWQO
 tIOg7j/NCJzRaqszn5D7PlVhGn57ASeOMde3rEDOkzYGxotC/f16QN26rtq3+IZjLZUU9Yh0kvL
 zU/pSgMIiGPacgHXaJy2lb6XBF56QUUUdzdxQGO22VeSDw4qOJqfBOdpTjcPZ/jG7cd61rGhCWZ
 IbbOTtrSpyKb1z8r9q7xv5Kzjyo38QXzDNUF3D+tenCVC6JgNuAlt6OHp1+uMTkmCxYEJfB/13K
 qwN1d28snMSCSLAiTdu0p0kMmPESTP/n5iWLIhCNWnQ==
X-Google-Smtp-Source: AGHT+IHuY0XrfYtM5VcLzCGvICnogZDiGC/0eP+fqCo0xMya0ZsWEn+IFG+DBAqyRJQwRDge+ZFqow==
X-Received: by 2002:ac8:5d53:0:b0:4ab:6e44:d236 with SMTP id
 d75a77b69052e-4aba3d96241mr279614691cf.29.1753125155195; 
 Mon, 21 Jul 2025 12:12:35 -0700 (PDT)
Received: from m-kiwi.verizon.net ([108.27.160.38])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b24930sm44626211cf.51.2025.07.21.12.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 12:12:34 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 3/3] drm/nouveau: Improve message for missing firmware
Date: Mon, 21 Jul 2025 15:09:16 -0400
Message-ID: <20250721191214.19800-4-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721191214.19800-1-mhenning@darkrefraction.com>
References: <20250721191214.19800-1-mhenning@darkrefraction.com>
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

This is inteded to address concerns that users might get cryptic error
messages or a failure to boot if they set nouveau.config=NvGspRm=0 on
the kernel command line and their gpu requires gsp (Ada or newer).
With this patch, that configuration results in error messages like this:

nouveau 0000:01:00.0: gsp: Failed to load required firmware for device.
nouveau 0000:01:00.0: gsp ctor failed: -22
nouveau 0000:01:00.0: probe with driver nouveau failed with error -22

When nouveau fails to load like this, we still fall back to the generic
framebuffer device, so users will still have limited graphical output.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index d23243a83a4c..7ccb41761066 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -138,8 +138,10 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 	nvkm_subdev_ctor(&nvkm_gsp, device, type, inst, &gsp->subdev);
 
 	fwif = nvkm_firmware_load(&gsp->subdev, fwif, "Gsp", gsp);
-	if (IS_ERR(fwif))
+	if (IS_ERR(fwif)) {
+		nvkm_error(&gsp->subdev, "Failed to load required firmware for device.");
 		return PTR_ERR(fwif);
+	}
 
 	gsp->func = fwif->func;
 
-- 
2.50.1

