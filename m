Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE979FEC1
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2CA10E524;
	Thu, 14 Sep 2023 08:47:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EA010E523
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:08 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68c576d35feso605602b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681227; x=1695286027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=unpHSZJYtZTxpGRHUj4GqubrLmd3KPPLBWq5vdXTo6E=;
 b=PZQf8lMD6I3SDsmvLiz1MTCowLBihdcjQ1rUdlRsFC0C6RmwlBqj9zsdBgQ3dOxzOk
 FA5WPj+LzGUv7L3Wk2uWGWT+nv7wYREiPHCnrvb7afR/mBcnsxW04CbzzooBEFvzM/6k
 UZ/hHj7VdAuGpAqTdLXbqNt9z/CU0LvHGFlotZmXAXgC3I0hrpTnndsW9l0V1m6J54sg
 EzRznmaTPZ5JojDvoSJiGL1vYs2oqMSL1TVIopqmbjI2TcJERYv3+IlaX/i7LYo9pn/3
 kOGdHq8wGTGUWbzZQBDk1vqbzy74yOPEoVVhEurne2hf5SttfzZOXdRZ/0iv4CFaus9O
 JFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681227; x=1695286027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=unpHSZJYtZTxpGRHUj4GqubrLmd3KPPLBWq5vdXTo6E=;
 b=cEoH0LeIPhS3GjtYwEDcW3whVxVIbUmJ2FBWrn/yC8el0BQbMVIromV9+8fazrD0vA
 pa/TaCOeMMiw1ZfnvGSUx8RNbBP7NhRRNvH7QncyO5lpN9MZ4SbZ74J4cBit5PAEm354
 r9GP+WeZ9Q0eqEfw7dSiu975C7lBueyMOcrA7nOOd/EiNaNQBnaJRmkFcPq94Mncbch7
 YkekTFtT/59P7wWwdbxFoFqiUfEglqKklSUevTOQmmOFsVEBzFxP849AGL+Ps0KihwW8
 uFLBMNkTTraHnj6XyxWSkfCPx/3n8qHfJXNNYUG5UTVtxG/Pc7yfgkLn1tvsc4KToca6
 uDuQ==
X-Gm-Message-State: AOJu0YzHMta/qC3DdzfgSWMUhUZT3LUDaUQdKwve8WtoxzL7RrbrYm3s
 cPPDAxuKTrQidnBgXq7n3SGqky0SqK4=
X-Google-Smtp-Source: AGHT+IGAvQ34x1970k+goZ23yGpTRO1KQ4JjSX5/7SWn6PU+Biz5R+CjMOZd/nSdsgqGICil1GeAzg==
X-Received: by 2002:a05:6a20:8f2a:b0:14c:a2e1:65ec with SMTP id
 b42-20020a056a208f2a00b0014ca2e165ecmr5999464pzk.38.1694681227206; 
 Thu, 14 Sep 2023 01:47:07 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:06 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:45 +1000
Message-ID: <20230914084624.2299765-6-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 04/44] drm/nouveau/mmu/gp100-: always invalidate
 TLBs at CACHE_LEVEL_ALL
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

Fixes some issues when running on top of RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index f3630d0e0d55..bddac77f48f0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -558,7 +558,7 @@ gp100_vmm_invalidate_pdb(struct nvkm_vmm *vmm, u64 addr)
 void
 gp100_vmm_flush(struct nvkm_vmm *vmm, int depth)
 {
-	u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
+	u32 type = 0;
 	if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
 		type |= 0x00000004; /* HUB_ONLY */
 	type |= 0x00000001; /* PAGE_ALL */
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
index 6cb5eefa45e9..0095d58d4d9a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
@@ -27,7 +27,7 @@ static void
 tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
 {
 	struct nvkm_device *device = vmm->mmu->subdev.device;
-	u32 type = (5 /* CACHE_LEVEL_UP_TO_PDE3 */ - depth) << 24;
+	u32 type = 0;
 
 	type |= 0x00000001; /* PAGE_ALL */
 	if (atomic_read(&vmm->engref[NVKM_SUBDEV_BAR]))
-- 
2.41.0

