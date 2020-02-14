Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763815DF55
	for <lists+nouveau@lfdr.de>; Fri, 14 Feb 2020 17:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB846FA64;
	Fri, 14 Feb 2020 16:08:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05016E830;
 Fri, 14 Feb 2020 16:08:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB0E42467E;
 Fri, 14 Feb 2020 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696506;
 bh=XF+uKzWVjCkasEVsHuILsvLeJGCAQ0To9bSluYuOIk4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fa7bd4S9ojjCHiJbeyiqa3ATkUdDV2L23bIvlA6L6EojAsQEI3dIso8DxyaeDuUmL
 0Km0uB0LlcawKLkDxk2BnwgOCfWn3APqlfvzINu2JFmpvdqMrGY0v6LYqVPdbMQgFB
 ZkGJINTWahXAs1wPibMToXCll7k8GXxQjkGAJwnI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:59:19 -0500
Message-Id: <20200214160149.11681-309-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.4 309/459] drm/nouveau/secboot/gm20b:
 initialize pointer in gm20b_secboot_new()
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
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 3613a9bea95a1470dd42e4ed1cc7d86ebe0a2dc0 ]

We accidentally set "psb" which is a no-op instead of "*psb" so it
generates a static checker warning.  We should probably set it before
the first error return so that it's always initialized.

Fixes: 923f1bd27bf1 ("drm/nouveau/secboot/gm20b: add secure boot support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
index df8b919dcf09b..ace6fefba4280 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
@@ -108,6 +108,7 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
 	struct gm200_secboot *gsb;
 	struct nvkm_acr *acr;
 
+	*psb = NULL;
 	acr = acr_r352_new(BIT(NVKM_SECBOOT_FALCON_FECS) |
 			   BIT(NVKM_SECBOOT_FALCON_PMU));
 	if (IS_ERR(acr))
@@ -116,10 +117,8 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
 	acr->optional_falcons = BIT(NVKM_SECBOOT_FALCON_PMU);
 
 	gsb = kzalloc(sizeof(*gsb), GFP_KERNEL);
-	if (!gsb) {
-		psb = NULL;
+	if (!gsb)
 		return -ENOMEM;
-	}
 	*psb = &gsb->base;
 
 	ret = nvkm_secboot_ctor(&gm20b_secboot, acr, device, index, &gsb->base);
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
