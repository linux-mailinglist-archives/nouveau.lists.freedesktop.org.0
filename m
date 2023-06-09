Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF397292AE
	for <lists+nouveau@lfdr.de>; Fri,  9 Jun 2023 10:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852C910E668;
	Fri,  9 Jun 2023 08:18:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9BD10E663;
 Fri,  9 Jun 2023 08:18:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 204AD654A3;
 Fri,  9 Jun 2023 08:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0239BC4339B;
 Fri,  9 Jun 2023 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686298688;
 bh=g43Hws3iLiAkztDwyEphPUBG078I8EpCKqK2eu0HlW8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a+hNeRSrwoWkqmhdQ386sDy8odIcPCZrMUtTx6bJqEuaVBPsuFQbFx9kS9Vc6Lm1W
 hyZ7YnK6PprSrKBzFuQBlUA91ZLvG5Efe5qdQRJUoD2uSb8qYaYIDZUJsQ1JNQR6xC
 JIIbT7ErNyA1OOZI++x1QVC+AJklX04k/QhaaY4X8smxYKbsBenhjFq3+r3G0MkTuJ
 G3WagfmWhk6ZkTaKVZi86r38hQEKmqIRyD3x6BSIhpA2jOuxYZa+yf09hvRbdkoGiU
 sJSvebP8sA80RvV4vmnUTagwKWr9ABWUyJ+/znOkR65xUx6/dRC8p6U2I4wZrsoWKg
 z/lRttF93ir8Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Date: Fri,  9 Jun 2023 09:17:13 +0100
Message-ID: <20230609081732.3842341-11-lee@kernel.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230609081732.3842341-1-lee@kernel.org>
References: <20230609081732.3842341-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [RESEND 10/15] drm/nouveau/nvkm/engine/gr/tu102:
 Staticify local function gf100_fifo_nonstall_block()
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for ‘tu102_gr_load’ [-Wmissing-prototypes]

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
index 3b6c8100a2428..10a7e59482a6f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
@@ -206,7 +206,7 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, struct gf100_gr_pack **ppack)
 	return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
 }
 
-int
+static int
 tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *fwif)
 {
 	int ret;
-- 
2.41.0.162.gfafddb0af9-goog

