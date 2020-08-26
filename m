Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA8E2536BD
	for <lists+nouveau@lfdr.de>; Wed, 26 Aug 2020 20:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D6E6E85D;
	Wed, 26 Aug 2020 18:25:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76F36E859
 for <nouveau@lists.freedesktop.org>; Wed, 26 Aug 2020 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598466317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEe3c9xUUAHMGFTm0eT9WyrcYzxI8isW4VeO4QnKthQ=;
 b=dgiuwKLuxmmNz1j0kvNLRvrtJwG+TX123iJ2to8DEc1quvhftaYSf0QiZabhoVKOBf49F2
 oOJJ4qZypDZarkHdOEAVHktV4AvwPjGgpXWVYwtlLXs8UfizsJLLSWX3ELzg5TNfPk1zuX
 Mh7VdG1TlVvPkJ9NsGsD31t1Oq3iJOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-ZNBSmqaDPa6NzEYx5aGhuw-1; Wed, 26 Aug 2020 14:25:14 -0400
X-MC-Unique: ZNBSmqaDPa6NzEYx5aGhuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B6281800D41;
 Wed, 26 Aug 2020 18:25:13 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-77.rdu2.redhat.com
 [10.10.119.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF2FC1002382;
 Wed, 26 Aug 2020 18:25:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 26 Aug 2020 14:24:37 -0400
Message-Id: <20200826182456.322681-2-lyude@redhat.com>
In-Reply-To: <20200826182456.322681-1-lyude@redhat.com>
References: <20200826182456.322681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: [Nouveau] [PATCH v5 01/20] drm/nouveau/kms: Fix some indenting in
 nouveau_dp_detect()
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 8a0f7994e1aeb..ee778ddc95fae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -76,10 +76,10 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 	nv_encoder->dp.link_nr = dpcd[2] & DP_MAX_LANE_COUNT_MASK;
 
 	NV_DEBUG(drm, "display: %dx%d dpcd 0x%02x\n",
-		     nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
+		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw, dpcd[0]);
 	NV_DEBUG(drm, "encoder: %dx%d\n",
-		     nv_encoder->dcb->dpconf.link_nr,
-		     nv_encoder->dcb->dpconf.link_bw);
+		 nv_encoder->dcb->dpconf.link_nr,
+		 nv_encoder->dcb->dpconf.link_bw);
 
 	if (nv_encoder->dcb->dpconf.link_nr < nv_encoder->dp.link_nr)
 		nv_encoder->dp.link_nr = nv_encoder->dcb->dpconf.link_nr;
@@ -87,7 +87,7 @@ nouveau_dp_detect(struct nouveau_encoder *nv_encoder)
 		nv_encoder->dp.link_bw = nv_encoder->dcb->dpconf.link_bw;
 
 	NV_DEBUG(drm, "maximum: %dx%d\n",
-		     nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
+		 nv_encoder->dp.link_nr, nv_encoder->dp.link_bw);
 
 	nouveau_dp_probe_oui(dev, aux, dpcd);
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
