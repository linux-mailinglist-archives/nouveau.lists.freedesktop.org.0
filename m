Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF12F20410F
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 22:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA44B6E8F6;
	Mon, 22 Jun 2020 20:08:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9606E8FA
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592856493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dmkn5ElK0S49yC+YYieD973IcE+n74T+jY14yBT/f54=;
 b=Ub/i27sxmqPxLciTzKHEyuTX7ES/pHxheeg1hqY5UtOSGZfKdbup3MnPIuZKzx2Cj1Fun2
 itbqeXGMGU9ocXRqe1ktawWU2B6Q3g0zuP732MGQartHFzEXWqww8rKgAgN6oBBS0lnMHM
 8asuq6Un4yBY8y7XOtxFsia9T34mgZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-6phvVNLoPj2iszwMxObftw-1; Mon, 22 Jun 2020 16:08:09 -0400
X-MC-Unique: 6phvVNLoPj2iszwMxObftw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A655D107B7C8;
 Mon, 22 Jun 2020 20:08:07 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-166.rdu2.redhat.com
 [10.10.117.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 666E65C240;
 Mon, 22 Jun 2020 20:08:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Mon, 22 Jun 2020 16:07:25 -0400
Message-Id: <20200622200730.120716-6-lyude@redhat.com>
In-Reply-To: <20200622200730.120716-1-lyude@redhat.com>
References: <20200622200730.120716-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Subject: [Nouveau] [RFC v5 05/10] drm/nouveau/kms/nv50-: Fix disabling
 dithering
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

While we expose the ability to turn off hardware dithering for nouveau,
we actually make the mistake of turning it on anyway, due to
dithering_depth containing a non-zero value if our dithering depth isn't
also set to 6 bpc.

So, fix it by never enabling dithering when it's disabled.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index e29ea40e7c334..72bc3bce396a7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -84,18 +84,20 @@ nv50_head_atomic_check_dither(struct nv50_head_atom *armh,
 {
 	u32 mode = 0x00;
 
-	if (asyc->dither.mode == DITHERING_MODE_AUTO) {
-		if (asyh->base.depth > asyh->or.bpc * 3)
-			mode = DITHERING_MODE_DYNAMIC2X2;
-	} else {
-		mode = asyc->dither.mode;
-	}
+	if (asyc->dither.mode) {
+		if (asyc->dither.mode == DITHERING_MODE_AUTO) {
+			if (asyh->base.depth > asyh->or.bpc * 3)
+				mode = DITHERING_MODE_DYNAMIC2X2;
+		} else {
+			mode = asyc->dither.mode;
+		}
 
-	if (asyc->dither.depth == DITHERING_DEPTH_AUTO) {
-		if (asyh->or.bpc >= 8)
-			mode |= DITHERING_DEPTH_8BPC;
-	} else {
-		mode |= asyc->dither.depth;
+		if (asyc->dither.depth == DITHERING_DEPTH_AUTO) {
+			if (asyh->or.bpc >= 8)
+				mode |= DITHERING_DEPTH_8BPC;
+		} else {
+			mode |= asyc->dither.depth;
+		}
 	}
 
 	asyh->dither.enable = mode;
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
