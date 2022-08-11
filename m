Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6166590260
	for <lists+nouveau@lfdr.de>; Thu, 11 Aug 2022 18:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AFD14ACB1;
	Thu, 11 Aug 2022 16:09:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C564F113E5F;
 Thu, 11 Aug 2022 16:09:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5085361426;
 Thu, 11 Aug 2022 16:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAB6C433C1;
 Thu, 11 Aug 2022 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660234143;
 bh=BlKBMOH6o2j7WE88oomjY+BnlOaiVoPJIpUyChZ8a3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vwj5zc422+HgIR24zlz4AZyx1A0EbgOnosyvilDO8C+YeU12B3DlutDDj8nTLAt8C
 9W1E0cMyrXJR2i73DpjPI1fR4hh8G/9RbXrhbmH2x4WXxPuNbRc/oLbf+dhXSjIele
 IFlbJe3EgAM3pD8/Ml1boqTRxTCVc7jFqIJoUDvZuR+YbYHKam6VgQC6WjvNJpZ+gZ
 Lh+kpMpvEXIb2jxAKBMvgJmyYPmmwhC2BehKuB7n1/8WV9+63Q3L9TWt5uF8GcmUDi
 QwnF0vnQWtKLDrH1yGY0g92yooy2oWNzkNXiHPNclaUy2Vy2Pxegddb9ZZP2eUf17n
 LXr7M3G+BPM5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 11 Aug 2022 12:08:11 -0400
Message-Id: <20220811160826.1541971-16-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160826.1541971-1-sashal@kernel.org>
References: <20220811160826.1541971-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH AUTOSEL 5.4 16/25] drm/nouveau/nvkm: use
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

