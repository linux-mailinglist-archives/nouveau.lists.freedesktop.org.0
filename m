Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230881CB939
	for <lists+nouveau@lfdr.de>; Fri,  8 May 2020 22:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D31D6EB74;
	Fri,  8 May 2020 20:48:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2736EB73
 for <nouveau@lists.freedesktop.org>; Fri,  8 May 2020 20:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588970927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FllY9C8WQ63gseKoLDYxeIQ9ojaIJYshJpy1blS9cfQ=;
 b=OHb6KKsJD6MuPbb2FodCoayIjqU97ODl4DBc2r53XKxFbnOa19yAQMFs2MbP+PHjdRslaw
 7BSYq9I0PmT2aun6OoWQawXgUDZXvbbDWw0LTROejJgbeDl+2dYF7P0EZdUF5i8MeOKQ8M
 0GU8QtHag8Cqqwa3T3INd+2mSPJZjLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-X-Uq0iT-N3CXgR2b81LX4A-1; Fri, 08 May 2020 16:48:46 -0400
X-MC-Unique: X-Uq0iT-N3CXgR2b81LX4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC791005510;
 Fri,  8 May 2020 20:48:44 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-29.rdu2.redhat.com [10.10.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 904F65D9CA;
 Fri,  8 May 2020 20:48:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri,  8 May 2020 16:46:57 -0400
Message-Id: <20200508204751.155488-8-lyude@redhat.com>
In-Reply-To: <20200508204751.155488-1-lyude@redhat.com>
References: <20200508204751.155488-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [RFC v4 07/12] drm/nouveau/kms/nv50-: Fix disabling
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
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>
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
index e29ea40e7c33..72bc3bce396a 100644
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
2.25.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
