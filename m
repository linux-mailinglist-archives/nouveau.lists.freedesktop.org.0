Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A355F127CB3
	for <lists+nouveau@lfdr.de>; Fri, 20 Dec 2019 15:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE01D6EC47;
	Fri, 20 Dec 2019 14:30:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5986EC45;
 Fri, 20 Dec 2019 14:30:46 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 994D224685;
 Fri, 20 Dec 2019 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852246;
 bh=tjRKg4UXjRDa3umwleOY3eLlM2dgbRCxqbyRm2e4EDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bVjPdCpoCSbPExcC23RqDWl1CcQ3QxjKCz7M1Z95Khen6QAYMnB5wvqpuAaCAbdmQ
 LvbMwLfQpsvNu5IgkE6pfFCEYh4Mf97U1HMr1XifISsCbEqPGB1UGnEk2m8PwmPQa8
 vVvZ5v3eyobP6H7LTcG49gn29IHHXYt1LVS//NxI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 20 Dec 2019 09:29:40 -0500
Message-Id: <20191220142954.9500-38-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220142954.9500-1-sashal@kernel.org>
References: <20191220142954.9500-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.4 38/52] drm/nouveau/kms/nv50-: fix
 panel scaling
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
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

[ Upstream commit 3d1890ef8023e61934e070021b06cc9f417260c0 ]

Under certain circumstances, encoder atomic_check() can be entered
without adjusted_mode having been reset to the same as mode, which
confuses the scaling logic and can lead to a misprogrammed display.

Fix this by checking against the user-provided mode directly.

Link: https://bugs.freedesktop.org/show_bug.cgi?id=108615
Link: https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/issues/464
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b46be8a091e99..8f4675c28c6f9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -326,9 +326,9 @@ nv50_outp_atomic_check_view(struct drm_encoder *encoder,
 			 * same size as the native one (e.g. different
 			 * refresh rate)
 			 */
-			if (adjusted_mode->hdisplay == native_mode->hdisplay &&
-			    adjusted_mode->vdisplay == native_mode->vdisplay &&
-			    adjusted_mode->type & DRM_MODE_TYPE_DRIVER)
+			if (mode->hdisplay == native_mode->hdisplay &&
+			    mode->vdisplay == native_mode->vdisplay &&
+			    mode->type & DRM_MODE_TYPE_DRIVER)
 				break;
 			mode = native_mode;
 			asyc->scaler.full = true;
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
