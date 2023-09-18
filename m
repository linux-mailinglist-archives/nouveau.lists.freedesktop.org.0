Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74AE7A538B
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DEC10E2F0;
	Mon, 18 Sep 2023 20:14:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B5710E2F6
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:31 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c434c33ec0so24877935ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068070; x=1695672870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COMY/bt6+Djs+rPaQ+CfBtAkruutq5/yX4y2/jIHyPA=;
 b=VYxcnvCTSnuwoRXKrKTr6rxdQY7LOK2856zcPRMVn4/TsOC00qLCP9A5Du2bBEZPRg
 1oj5cFsJDSfgIuUfTQ5b1zvHWH5zPHFKhjo4LBjslnQu74rGKS9aomnAPeC26ytS3LU+
 ImR6uvAOh1Iq+ubHaVb3YhYC3CN1soW3HKiMTcbe61B9fqn/GNtREmuO/CM9IfMGssT6
 1ltKjnsxW1KDUs+nzUxoRdG3OEpx5FCzjOKGQZUsjocEAp5aVUElhqEn9ZqaepHL+PWq
 sYl3ttpcYKZnVgFjNG20dzYUMVHTU+8JDRSs3/6DLSB9yQkvPQPbah3gU7s0zuPQltoQ
 WQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068070; x=1695672870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COMY/bt6+Djs+rPaQ+CfBtAkruutq5/yX4y2/jIHyPA=;
 b=NWhOF4paheFnW0j259736MHcnirPcCYjMn5u2qfMOwuD5Bt5jB2WzLOjmvhrAYC7P9
 mRkO+7nmSbGL3ChHevIpiJYGexYhiS9qv9X4YBWm5YTOr19d36VBxxhNOTerr5DUcMme
 Oh6Tmx0P7U7zCMFiAHuQjCkA02UlPK0C5Wers9EYQBBHJrNuBWriqXGaM0RhJEVBay+q
 FUFm/A5Iv/AjAsb0bylpfch0XzOzUrYInmPbsJCz/NplKXJ1v76r8S+wXPY7cpNPsdyv
 22pWfJRFEd6EPafk72FIcYRp+gBCp72ISD6OJ7yiklARj5MF6Ixo5z1Yv7aQDDTOKlLk
 9U1g==
X-Gm-Message-State: AOJu0Yz6O3x9swOsvTGvtq8MTv/POrNK6H9WWqxcuTQufz89s01ornHA
 8vMpMwrZyRIzboAVd4ajmLUlXuMe0Co=
X-Google-Smtp-Source: AGHT+IEDbjxcudYrXAl/q263G5O35RKhGCPuunBi5J6Z7of+ky1xqUAGfTlKMIFXk4NGtQsII24lmA==
X-Received: by 2002:a17:902:e806:b0:1c3:3347:996e with SMTP id
 u6-20020a170902e80600b001c33347996emr10117692plg.23.1695068070364; 
 Mon, 18 Sep 2023 13:14:30 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:29 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:24 +1000
Message-ID: <20230918201404.3765-5-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 04/44] drm/nouveau/mmu/gp100-: always
 invalidate TLBs at CACHE_LEVEL_ALL
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

