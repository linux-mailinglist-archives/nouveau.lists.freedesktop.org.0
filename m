Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B6590236
	for <lists+nouveau@lfdr.de>; Thu, 11 Aug 2022 18:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFE711202A;
	Thu, 11 Aug 2022 16:07:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0551A11AEF4;
 Thu, 11 Aug 2022 16:07:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7697461314;
 Thu, 11 Aug 2022 16:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D75C433D7;
 Thu, 11 Aug 2022 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660234024;
 bh=BlKBMOH6o2j7WE88oomjY+BnlOaiVoPJIpUyChZ8a3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rP5SJ/cg25cC8rbjsKAFenYxWGJOMEAVFtbiJfcE7BmSD6KqRlqpKkEjmOE0d3Zdx
 3+JfFnDL9zOz7VMjuWnDAUqRsJHjT0YeQ0SOz/Mg1X5nO0cBGD2DkTKAmG9u33IelJ
 QNV9UxG17Nlmh2VlsnAfuGjb5RPPpPb9J6ui1LIoCB7GVjU+lz1ue62wxuPWsZhj/W
 DGu9PItfMUXcesFHEzm83KFXwFbon1wZp5Wpof2VkxNz35SuOMzfX07xU7BuDPFnbQ
 6NvZYw5PgCLGZVG5xY/P5uCUU/834WOGtLJ6UsMRK3Ei5zaZaNuiFmkVI2mTxWS/0b
 A6SZcobPOIKKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 11 Aug 2022 12:03:55 -0400
Message-Id: <20220811160421.1539956-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160421.1539956-1-sashal@kernel.org>
References: <20220811160421.1539956-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH AUTOSEL 5.10 31/46] drm/nouveau/nvkm: use
 list_add_tail() when building object tree
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, daniel@ffwll.ch,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 61c1f340bc809a1ca1e3c8794207a91cde1a7c78 ]

Fixes resume from hibernate failing on (at least) TU102, where cursor
channel init failed due to being performed before the core channel.

Not solid idea why suspend-to-ram worked, but, presumably HW being in
an entirely clean state has something to do with it.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index d777df5a64e6..2aa0d6fed580 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -128,7 +128,7 @@ nvkm_ioctl_new(struct nvkm_client *client,
 	if (ret == 0) {
 		ret = nvkm_object_init(object);
 		if (ret == 0) {
-			list_add(&object->head, &parent->tree);
+			list_add_tail(&object->head, &parent->tree);
 			if (nvkm_object_insert(object)) {
 				client->data = object;
 				return 0;
-- 
2.35.1

