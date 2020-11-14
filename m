Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806F2B2998
	for <lists+nouveau@lfdr.de>; Sat, 14 Nov 2020 01:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A640B6E88F;
	Sat, 14 Nov 2020 00:14:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB1036E88F
 for <nouveau@lists.freedesktop.org>; Sat, 14 Nov 2020 00:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSBu3QlNxSn4jjxe8kfN+hP1ZRLZG7sa8+Qo8tIncQE=;
 b=ApkjgfuBk7tsLYsX5tmtAfDv4Cr6D0LzjXk+zWbePaAXfyyO1AwZT2l3V7M6HTDSlz+4Bx
 QcT5FFnLR+qVVgUHZ0ddoBQcP/U6UfFKoW2LjlMcK5iwHpN4tzlg8Vw5GoqN2GNqqtdpUK
 eRhFZEAyiquOhxUjFUUbPUvdfoOsXtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-ICIptIQwOuOQTTg5mksUFw-1; Fri, 13 Nov 2020 19:14:49 -0500
X-MC-Unique: ICIptIQwOuOQTTg5mksUFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9CA1107AD91;
 Sat, 14 Nov 2020 00:14:47 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91B3B60C15;
 Sat, 14 Nov 2020 00:14:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 13 Nov 2020 19:14:13 -0500
Message-Id: <20201114001417.155093-5-lyude@redhat.com>
In-Reply-To: <20201114001417.155093-1-lyude@redhat.com>
References: <20201114001417.155093-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 4/8] drm/nouveau/kms/nv50-: s/armh/asyh/ in
 nv50_msto_atomic_enable()
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I have a strange dejavu feeling that I tried to submit a patch for this in
the past, but that it was rejected. I can't remember though, but I'm
further convinced this patch is the right thing to do anyway.

We label the to-be-committed head state in nv50_msto_atomic_enable() as
armh. Normally armh implies a state which is currently armed in hardware.
nv50_msto_atomic_enable() is called _after_ drm_atomic_swap_state()
however, but before the commit tail ends, which means that said state is
not actually armed on hardware.

As well - take note that this is the same convention followed in all of the
other atomic_enable() callbacks.

So, let's correct this to asyh.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a47be145827e..cbcf3ef517dc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1058,7 +1058,7 @@ static void
 nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nv50_head *head = nv50_head(encoder->crtc);
-	struct nv50_head_atom *armh = nv50_head_atom(head->base.base.state);
+	struct nv50_head_atom *asyh = nv50_head_atom(head->base.base.state);
 	struct nv50_msto *msto = nv50_msto(encoder);
 	struct nv50_mstc *mstc = NULL;
 	struct nv50_mstm *mstm = NULL;
@@ -1080,8 +1080,7 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	if (WARN_ON(!mstc))
 		return;
 
-	r = drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, armh->dp.pbn,
-				     armh->dp.tu);
+	r = drm_dp_mst_allocate_vcpi(&mstm->mgr, mstc->port, asyh->dp.pbn, asyh->dp.tu);
 	if (!r)
 		DRM_DEBUG_KMS("Failed to allocate VCPI\n");
 
@@ -1093,8 +1092,8 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	else
 		proto = NV917D_SOR_SET_CONTROL_PROTOCOL_DP_B;
 
-	mstm->outp->update(mstm->outp, head->base.index, armh, proto,
-			   nv50_dp_bpc_to_depth(armh->or.bpc));
+	mstm->outp->update(mstm->outp, head->base.index, asyh, proto,
+			   nv50_dp_bpc_to_depth(asyh->or.bpc));
 
 	msto->mstc = mstc;
 	mstm->modified = true;
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
