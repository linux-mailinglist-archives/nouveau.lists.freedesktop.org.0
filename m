Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427526F6B34
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D802210E392;
	Thu,  4 May 2023 12:31:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1660E10E275;
 Fri, 21 Oct 2022 01:07:10 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E046B321FBE;
 Fri, 21 Oct 2022 02:07:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666314428; bh=mEZCh6DKMZxYs93u5HYN5AP3T4mH4+XzTxRdxvODvmw=;
 h=From:To:Cc:Subject:Date:From;
 b=f+8WwnTl+3Upzwg+ngXQt0iN2WuzWtkNoNapASjI96Li+fZnYuE06m/AkjvfVx9fz
 wKwI5nSLVtziDl/hAwOn+u3PEbKlwLhlH+AXn789MxamNoe874UrdW1EVoVkUswoLn
 K+2Uibop1+YSgaf3JJte7NgpUyAQJXKGXsrarKPPzEfSyp0MYQzgRW4f8GpVrfnBZQ
 EEkD1hAUd/jKBUWLFPcrlbuGudZIv20cDhY4A9SvRHBjs7oh08v5RU7zdjKnscuNdD
 F+BCCZU3M40Wy8/Q6SQdnwDS0B0ggIn2VtfGYDo5esOlb63uU6RkRHJ5h9InNxgDWY
 H8sMvUFCaozRg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Date: Thu, 20 Oct 2022 21:07:03 -0400
Message-Id: <20221021010703.536318-1-zack@kde.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:35 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: Remove unused variable
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimemrmann@suse.de>, nouveau@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Trivial removal of an unused variable. Not sure how it snuck by me and
build bots in the 7c99616e3fe7.

Fixes: 7c99616e3fe7 ("drm: Remove drm_mode_config::fb_base")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Zimmermann <tzimemrmann@suse.de>
Cc: Christian König <christian.koenig@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 928fdfa8e8e5..2e97186090c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -659,7 +659,6 @@ int
 nouveau_display_create(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
 	struct nouveau_display *disp;
 	int ret;
 
-- 
2.34.1

