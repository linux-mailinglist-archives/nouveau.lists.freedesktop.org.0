Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DFE7A53DD
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2794610E30A;
	Mon, 18 Sep 2023 20:22:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509FD10E30A
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:07 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-690bfd4f3ebso202117b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068526; x=1695673326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YM9idqnspMCibXJF7tesDN1x4uPFP8D70K7un/A+ilM=;
 b=Wf8pMnAJYyIBjZH0wcCcfo1NOr4IIEoT8zEJNnZTCvxoSFYPN8pNScIvDhrync3TBc
 +QrS9fKT2aOQVHrziYbHWpaHGZUVVQSknwecLvqhrNASglxN4vNbI6H8NCJkcKSpopWf
 DosBJx4sm+aTnIasW7HnHNWK07Mv7o0nBAy9O3Y1FWOV3Ucxsth+Al4sR8gSWVSRjIZo
 lAhe0n5qOj2FEeySrkJWi7NYNUJIUBlz1mHnJhl15H9+j/VEPYfjaSxNPLbUyDaShEUi
 8M63jdbPg7y2VLR0aCounP/rltURdsR0LoAxPl64nxdc2tE/fmYzTm72zB5jt5BUScwv
 Cmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068526; x=1695673326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YM9idqnspMCibXJF7tesDN1x4uPFP8D70K7un/A+ilM=;
 b=iCzlZ2BK7K60X88e6UbSff9yInvc2cfqV/gfL2LHxMjpO+e0eRQ1Ccx4EzJ6DOCm8M
 BSESEEYDj/fVuxE736aI6PbJNVTC6TyKP7KpX8NAO8ubz3dBIBQDbajWxTOedzudlMYg
 p2LrFAnU/ZAWl/QgLhUzFQGnF+C1F6Dy9Bm4cTppbS7xyoSht+v10iTZLTwCc52sYsAr
 lVisAm7vCBTRkwOJ+iB3CKuJKRIsZj2YZJA6cBaT0Vf3ThF0an1hAR79XCii0pNS/gmM
 BKFuwZjTb7BqQK5fccEi8nwaUzrZIqo/XL4mEFFkJ3pxtQeimKRRYSa2ehP1BfTBJxdM
 RxzQ==
X-Gm-Message-State: AOJu0YxRKHfKY3yNvhYOtQsTLmO1JMowBsAsIXEcrBsu7b4RTxsUhQk+
 B2jLwuWrQp0fIDRO6awcMNdoMkK1+So=
X-Google-Smtp-Source: AGHT+IHC6k6EJul6RKBbNyQKpMcGmSuVVFeaEaveJ5sl7lf7taGN+OXuH5NxhoXMe3Et0UPchnE72A==
X-Received: by 2002:a05:6a20:9151:b0:153:a00b:dca0 with SMTP id
 x17-20020a056a20915100b00153a00bdca0mr9947516pzc.11.1695068526299; 
 Mon, 18 Sep 2023 13:22:06 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:05 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:06 +1000
Message-ID: <20230918202149.4343-2-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 01/44] drm/nouveau/mmu/tu102-: remove write to
 0x100e68 during tlb invalidate
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

This was cargo-culted from traces of RM when the code was written, but
we probably shouldn't be touching NV_PFB regs while GSP-RM is running.

From traces, it looks like NVIDIA dropped this sometime between 510.54
and 515.48.07, so I guess we can too.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
index 0095d58d4d9a..29c12e69540f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
@@ -37,7 +37,6 @@ tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
 
 	nvkm_wr32(device, 0xb830a0, vmm->pd->pt[0]->addr >> 8);
 	nvkm_wr32(device, 0xb830a4, 0x00000000);
-	nvkm_wr32(device, 0x100e68, 0x00000000);
 	nvkm_wr32(device, 0xb830b0, 0x80000000 | type);
 
 	nvkm_msec(device, 2000,
-- 
2.41.0

