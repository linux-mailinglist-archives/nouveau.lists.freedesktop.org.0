Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF2282EE56
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A442D10E4E3;
	Tue, 16 Jan 2024 11:47:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE68810E249
 for <nouveau@lists.freedesktop.org>; Thu, 16 Nov 2023 06:52:13 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 6CC601C0DFA
 for <nouveau@lists.freedesktop.org>; Thu, 16 Nov 2023 09:52:11 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:to:from:from; s=dkim; t=1700117531; x=
 1700981532; bh=K3YRmKofc6N6uINNSmeFkKZnxYRW32B+l0K9TQS6g74=; b=U
 Dm5YGD4RJRs8GMnd8OzlQQbsYbsA5huKtEjGNwskRhlRVrlMyvhmHfYQnGlFkhEt
 v/aQfY6Rj1aPHzaRe3ruo5F431EfIrhEYC8RTrKphkwdIpZB/weL+cQZ8CR/+FKJ
 Iz0HPAPClYYvycH58zj53eR2R/X4xzn5nn3QemY0rQ=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id P4IoRbYRtm-0 for <nouveau@lists.freedesktop.org>;
 Thu, 16 Nov 2023 09:52:11 +0300 (MSK)
Received: from localhost.localdomain (mail.dev-ai-melanoma.ru
 [185.130.227.204])
 by mail.nppct.ru (Postfix) with ESMTPSA id D04BC1C061A;
 Thu, 16 Nov 2023 09:52:07 +0300 (MSK)
From: Andrey Shumilin <shum.sdl@nppct.ru>
To: Karol Herbst <kherbst@redhat.com>
Subject: [PATCH] tvnv17.c: Adding a NULL pointer check.
Date: Thu, 16 Nov 2023 09:51:59 +0300
Message-Id: <20231116065159.37876-1-shum.sdl@nppct.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:29 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 Andrey Shumilin <shum.sdl@nppct.ru>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, vefanov@ispras.ru, ykarpov@ispras.ru,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 vmerzlyakov@ispras.ru, khoroshilov@ispras.ru
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

It is possible to dereference a null pointer if drm_mode_duplicate() returns NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 670c9739e5e1..1f0c5f4a5fd2 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -209,7 +209,8 @@ static int nv17_tv_get_ld_modes(struct drm_encoder *encoder,
 		struct drm_display_mode *mode;
 
 		mode = drm_mode_duplicate(encoder->dev, tv_mode);
-
+		if (mode == NULL)
+			continue;
 		mode->clock = tv_norm->tv_enc_mode.vrefresh *
 			mode->htotal / 1000 *
 			mode->vtotal / 1000;
@@ -258,6 +259,8 @@ static int nv17_tv_get_hd_modes(struct drm_encoder *encoder,
 		if (modes[i].hdisplay == output_mode->hdisplay &&
 		    modes[i].vdisplay == output_mode->vdisplay) {
 			mode = drm_mode_duplicate(encoder->dev, output_mode);
+			if (mode == NULL)
+				continue;
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		} else {
-- 
2.30.2

