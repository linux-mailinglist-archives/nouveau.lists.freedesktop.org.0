Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D153876ECA4
	for <lists+nouveau@lfdr.de>; Thu,  3 Aug 2023 16:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81610E60A;
	Thu,  3 Aug 2023 14:34:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA8A10E60A;
 Thu,  3 Aug 2023 14:34:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C47C61DC3;
 Thu,  3 Aug 2023 14:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B67C433C8;
 Thu,  3 Aug 2023 14:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691073277;
 bh=0DpbPzG9n23TZQeqpKKQPbDUpRX8JjTwBICXpo5IiuE=;
 h=From:To:Cc:Subject:Date:From;
 b=rh87W65xGsDgaEj+p3vHUxCrL38a2Z8HUDTO7uEoRnRDJA1oBiKC5WEQ1n0cNmlIy
 M9CBQi7dfHpjtWngHcTYTmR1hCsbbytl4YpaudAAytGg/GwbmBfLT68qa82xBSdOpo
 lhATEu/FizKT3Py0aCK8wy+/ZmZ1LMh2sqPKM3eszeLGtjDeKQt5l6jybIFTVHU0Si
 SuAikNmL3ou9Bqrj21w/+/DAHFvC0Hksk5Aah6kSVVe5ajgnwuHFNDPRPy9HNFCyoN
 pF6KaViF/Aj2WhmhgsdfuIR37iD62/2x68Oo3IGhAggWg9RjsOotKjyEA45F6gZ/Dj
 QlsDvYfMJa1BQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Thu,  3 Aug 2023 16:33:48 +0200
Message-Id: <20230803143358.13563-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH] [RESEND] drm/nouveau: remove unused
 tu102_gr_load() function
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 Gourav Samaiya <gsamaiya@nvidia.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

tu102_gr_load() is completely unused and can be removed to address
this warning:

drivers/gpu/drm/nouveau/dispnv50/disp.c:2517:1: error: no previous prototype for 'nv50_display_create'

Another patch was sent in the meantime to mark the function static but
that would just cause a different warning about an unused function.

Fixes: 1cd97b5490c8 ("drm/nouveau/gr/tu102-: use sw_veid_bundle_init from firmware")
Link: https://lore.kernel.org/all/CACO55tuaNOYphHyB9+ygi9AnXVuF49etsW7x2X5K5iEtFNAAyw@mail.gmail.com/
Link: https://lore.kernel.org/all/20230417210310.2443152-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I send this one back in April, and Lee Jones sent a similar patch in May.
Please apply so we can enable the warning by default.
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index 3b6c8100a242..a7775aa18541 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, struct gf100_gr_pack **ppack)
 	return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
 }
 
-int
-tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
-{
-	int ret;
-
-	ret = gm200_gr_load(gr, ver, fwif);
-	if (ret)
-		return ret;
-
-	return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, tu102_gr_av_to_init_veid,
-				 &gr->bundle_veid);
-}
-
 static const struct gf100_gr_fwif
 tu102_gr_fwif[] = {
 	{  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpccs_acr },
-- 
2.39.2

