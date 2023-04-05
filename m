Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1946D7AA1
	for <lists+nouveau@lfdr.de>; Wed,  5 Apr 2023 13:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3021D10E09D;
	Wed,  5 Apr 2023 11:05:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4D810E034
 for <nouveau@lists.freedesktop.org>; Wed,  5 Apr 2023 11:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680692703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D1iQ5cfXUobOUC8Rzy8Kki+uzPzlUU+kbKGwGQ+L2M4=;
 b=i8OSyOy1ygJ0+XUXMRILNwTlpeaYipoaV9OYj62V3wsjGs9yZS65yIB0CXGmoClwzAWOcH
 txtOqB1awv4rg93mnr7JcmfVcMHyuLs/5e8cXeIEfwBGAqwyRL0lCGEmQjPc01FF2OhIG1
 BvJeRSTLEgQpqpiJLVJPBBUIQvxjl/0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-2CtCRo4VNgmHDTn_W7taTw-1; Wed, 05 Apr 2023 07:05:02 -0400
X-MC-Unique: 2CtCRo4VNgmHDTn_W7taTw-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3e03178131bso1280191cf.1
 for <nouveau@lists.freedesktop.org>; Wed, 05 Apr 2023 04:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680692701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1iQ5cfXUobOUC8Rzy8Kki+uzPzlUU+kbKGwGQ+L2M4=;
 b=t+UPxaFAJ2ozjcoJnBu3UWUkAiMwsNR5W46PB4333oMhUKcnWd2AKCzoBQytI5qgtL
 GfJj20aE+3UMHbinU16/LAEVTe+iHb34q52FJuKW2JNhXbYxFG3fWkAaEtFna/7+ztsA
 7jbnUEUWKWTmvS1kLcmgm42FVSO6WVMhMolzesxDXctRgUumLpNNRKsV3/u/3i6e5UMo
 /fLtApaivdv9LObGJFPkVq8/kWRsRkbrmVJJX3NWFLKOGca2clEAqf/JxenuxzalW6jX
 SlqPKLHU2bI+cqfvb8L3EXipX+bP4G2DM/RyqtSUWRkTuHYux1EQud2dlCcXW6F6fQuO
 hCyA==
X-Gm-Message-State: AAQBX9fj5o4Pq8ts4hLW9KB5HqzToHdk+3OOJwOP5C6hUl8gJBJ9SScI
 lZDBBKx9Vev9/8zFji9FkzXb/pQ1iEuyTi65+MwZP3OKZXwN+GaAfcs8boj44fAv07yaa90mkDD
 DGqIIRFZjj0kVEFgxOxxuWv8YpPjZjoS15A==
X-Received: by 2002:a05:622a:188e:b0:3e4:d3cc:4211 with SMTP id
 v14-20020a05622a188e00b003e4d3cc4211mr2771873qtc.3.1680692701427; 
 Wed, 05 Apr 2023 04:05:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350aIXirj4rP1VlnrQftjsVcsEyJPTmnJjGaVkizUa1zfyv4BxeuGC8+LxXlqfSDIGNjW5Ljgig==
X-Received: by 2002:a05:622a:188e:b0:3e4:d3cc:4211 with SMTP id
 v14-20020a05622a188e00b003e4d3cc4211mr2771837qtc.3.1680692701001; 
 Wed, 05 Apr 2023 04:05:01 -0700 (PDT)
Received: from kherbst.pingu.com (ip1f113ce7.dynamic.kabel-deutschland.de.
 [31.17.60.231]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05620a146300b0074876c013f9sm4317207qkl.123.2023.04.05.04.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:04:58 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  5 Apr 2023 13:04:55 +0200
Message-Id: <20230405110455.1368428-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/fb: add missing sysmen flush callbacks
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/203
Fixes: 5728d064190e1 ("drm/nouveau/fb: handle sysmem flush page from common code")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
index 76678dd60f93f..c4c6f67af7ccc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf108.c
@@ -31,6 +31,7 @@ gf108_fb = {
 	.init = gf100_fb_init,
 	.init_page = gf100_fb_init_page,
 	.intr = gf100_fb_intr,
+	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
 	.ram_new = gf108_ram_new,
 	.default_bigpage = 17,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
index f73442ccb424b..433fa966ba231 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk104.c
@@ -77,6 +77,7 @@ gk104_fb = {
 	.init = gf100_fb_init,
 	.init_page = gf100_fb_init_page,
 	.intr = gf100_fb_intr,
+	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
 	.ram_new = gk104_ram_new,
 	.default_bigpage = 17,
 	.clkgate_pack = gk104_fb_clkgate_pack,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
index 45d6cdffafeed..4dc283dedf8b5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gk110.c
@@ -59,6 +59,7 @@ gk110_fb = {
 	.init = gf100_fb_init,
 	.init_page = gf100_fb_init_page,
 	.intr = gf100_fb_intr,
+	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
 	.ram_new = gk104_ram_new,
 	.default_bigpage = 17,
 	.clkgate_pack = gk110_fb_clkgate_pack,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
index de52462a92bf0..90bfff616d35b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gm107.c
@@ -31,6 +31,7 @@ gm107_fb = {
 	.init = gf100_fb_init,
 	.init_page = gf100_fb_init_page,
 	.intr = gf100_fb_intr,
+	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
 	.ram_new = gm107_ram_new,
 	.default_bigpage = 17,
 };
-- 
2.39.2

