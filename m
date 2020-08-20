Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98A24C58A
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 20:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211E66EA01;
	Thu, 20 Aug 2020 18:31:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4586EA03
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597948300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcFp48n/aLMtpSE/1lSAUTj8bSRshm4WBYhHn9wvw8Q=;
 b=fKeUt4QdXII9JwMM0eo9lUXTrO8SfmAoPnYIX97I8lM1F5nlG0D74fYjlfayeIN07TEaL7
 w4lO/PdexjbfdKcTvXZIFvv069gfAzZhe39ekp85ZqOrGd+qdaQJ8H+lP7swYFTJYtw+UP
 lu+a2p3txqI1KLBakLy9AHWynuG+Grg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-pp1d7sf5NR6FEbRycNTjng-1; Thu, 20 Aug 2020 14:30:35 -0400
X-MC-Unique: pp1d7sf5NR6FEbRycNTjng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8000801AE7;
 Thu, 20 Aug 2020 18:30:33 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-42.rdu2.redhat.com
 [10.10.120.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85A465DA74;
 Thu, 20 Aug 2020 18:30:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Thu, 20 Aug 2020 14:29:57 -0400
Message-Id: <20200820183012.288794-6-lyude@redhat.com>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [RFC v2 05/20] drm/nouveau/kms: Don't clear DP_MST_CTRL
 DPCD in nv50_mstm_new()
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
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since fa3cdf8d0b09 ("drm/nouveau: Reset MST branching unit before
enabling") we've been clearing DP_MST_CTRL before we start enabling MST.
Since then clearing DP_MST_CTRL in nv50_mstm_new() has been unnecessary
and redundant, so let's remove it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index e7874877da858..c4d138f0ca054 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1535,17 +1535,6 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
 	struct drm_device *dev = outp->base.base.dev;
 	struct nv50_mstm *mstm;
 	int ret;
-	u8 dpcd;
-
-	/* This is a workaround for some monitors not functioning
-	 * correctly in MST mode on initial module load.  I think
-	 * some bad interaction with the VBIOS may be responsible.
-	 *
-	 * A good ol' off and on again seems to work here ;)
-	 */
-	ret = drm_dp_dpcd_readb(aux, DP_DPCD_REV, &dpcd);
-	if (ret >= 0 && dpcd >= 0x12)
-		drm_dp_dpcd_writeb(aux, DP_MSTM_CTRL, 0);
 
 	if (!(mstm = *pmstm = kzalloc(sizeof(*mstm), GFP_KERNEL)))
 		return -ENOMEM;
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
