Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F056924C568
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 20:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1646E9EA;
	Thu, 20 Aug 2020 18:30:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F251D6E9E5
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597948253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRjvqDDaphx4X4eWRUclQ6/debsZpIwfJIK259KyQTs=;
 b=KH76VL4nQnq4k3ImCcXQRpz60uK19Y+g3D0KyTQsSm6HAqpwHyVez19Ser50jjT4zdF97a
 55jOmqHDN6Aa2ShYdXNroxlgdl8ak6Iq9aDIA4eW7u9/yrHSDW7dla4eaoTxCuYTxDqgap
 Vgkhxu3WjyJQtReW0vDiC9PSJtNvH00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-JMu0nbKwP6-H8zgHX5fGFg-1; Thu, 20 Aug 2020 14:30:48 -0400
X-MC-Unique: JMu0nbKwP6-H8zgHX5fGFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 973521005E73;
 Thu, 20 Aug 2020 18:30:46 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-42.rdu2.redhat.com
 [10.10.120.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 872905DA78;
 Thu, 20 Aug 2020 18:30:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Thu, 20 Aug 2020 14:29:59 -0400
Message-Id: <20200820183012.288794-8-lyude@redhat.com>
In-Reply-To: <20200820183012.288794-1-lyude@redhat.com>
References: <20200820183012.288794-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [RFC v2 07/20] drm/nouveau/kms/nv50-: Use
 drm_dp_dpcd_(readb|writeb)() in nv50_sor_disable()
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

Just use drm_dp_dpcd_(readb|writeb)() so we get automatic DPCD logging

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 57102e1a173bc..75005268941b9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1629,19 +1629,22 @@ nv50_sor_disable(struct drm_encoder *encoder,
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
+	struct nouveau_connector *nv_connector =
+		nv50_outp_get_old_connector(nv_encoder, state);
 
 	nv_encoder->crtc = NULL;
 
 	if (nv_crtc) {
-		struct nvkm_i2c_aux *aux = nv_encoder->aux;
+		struct drm_dp_aux *aux = &nv_connector->aux;
 		u8 pwr;
 
-		if (aux) {
-			int ret = nvkm_rdaux(aux, DP_SET_POWER, &pwr, 1);
+		if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
+			int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
+
 			if (ret == 0) {
 				pwr &= ~DP_SET_POWER_MASK;
 				pwr |=  DP_SET_POWER_D3;
-				nvkm_wraux(aux, DP_SET_POWER, &pwr, 1);
+				drm_dp_dpcd_writeb(aux, DP_SET_POWER, pwr);
 			}
 		}
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
