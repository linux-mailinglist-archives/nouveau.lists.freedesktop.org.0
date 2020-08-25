Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D4A2520F9
	for <lists+nouveau@lfdr.de>; Tue, 25 Aug 2020 21:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E56C89E69;
	Tue, 25 Aug 2020 19:50:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4584D897FD
 for <nouveau@lists.freedesktop.org>; Tue, 25 Aug 2020 19:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598385049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEe3c9xUUAHMGFTm0eT9WyrcYzxI8isW4VeO4QnKthQ=;
 b=DpvO5KKCro3LSXgC8QfXfwwlbKIre+9WWM6E6YWhEd74yeIE9uTILtjlJgVhaTC3WX6r53
 aclyBU4eNAXGMgKN5Gdthu/Al+zdmakCFxbl4AThYlR55hFFc9seZz5cxaLC/CuEAmom8S
 ItuQxQOGiTE1X1P0TLohXQabM0twpvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-BMSy7aV2O9qJAPjqBVN1tg-1; Tue, 25 Aug 2020 15:50:46 -0400
X-MC-Unique: BMSy7aV2O9qJAPjqBVN1tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0625210ABDB2;
 Tue, 25 Aug 2020 19:50:45 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-227.rdu2.redhat.com
 [10.10.120.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEA1C5D9D3;
 Tue, 25 Aug 2020 19:50:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Tue, 25 Aug 2020 15:50:08 -0400
Message-Id: <20200825195027.74681-2-lyude@redhat.com>
In-Reply-To: <20200825195027.74681-1-lyude@redhat.com>
References: <20200825195027.74681-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [RFC v4 01/20] drm/nouveau/kms: Fix some indenting in
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
