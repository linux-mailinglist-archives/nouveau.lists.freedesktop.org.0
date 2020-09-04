Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0E025E2BD
	for <lists+nouveau@lfdr.de>; Fri,  4 Sep 2020 22:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D21B6ECC6;
	Fri,  4 Sep 2020 20:28:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEE26ECC5
 for <nouveau@lists.freedesktop.org>; Fri,  4 Sep 2020 20:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599251320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWp0AAI+VZUu8qz/13ssyrVxYR5SrJ8VDuwzkJreei0=;
 b=D6pX3bOYWhbkisbpj9i7EySEbgezcqwg8vlOD/VTQcJQBTVDtoJj/ygKld2aSV/13XLuGZ
 Ye0g3RQYGdnZ6UPE+4kWfq/mNuKdb+uTTExrfe3TFpcy8B4n9mTxD8SF5E+nHwG3nQff7v
 OYAtC7KqihXD7ENhZGMzggWi0KJd8Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-4WJb22XZMNCaxKXeeacgtQ-1; Fri, 04 Sep 2020 16:28:38 -0400
X-MC-Unique: 4WJb22XZMNCaxKXeeacgtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F82610BBECF;
 Fri,  4 Sep 2020 20:28:28 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-1.rdu2.redhat.com [10.10.118.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95FE360C05;
 Fri,  4 Sep 2020 20:28:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri,  4 Sep 2020 16:27:59 -0400
Message-Id: <20200904202813.1260202-2-lyude@redhat.com>
In-Reply-To: <20200904202813.1260202-1-lyude@redhat.com>
References: <20200904202813.1260202-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH v5 2/2] drm/nouveau/kms/nv50-: Log SOR/PIOR caps
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Takashi Iwai <tiwai@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Since I'm almost certain I didn't get capability checking right for
pre-volta chipsets, let's start logging any caps we find to make things
like this obvious in the future.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 7799530e07c1f..376add0faacc3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -303,6 +303,14 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 /******************************************************************************
  * Output path helpers
  *****************************************************************************/
+static void
+nv50_outp_dump_caps(struct nouveau_drm *drm,
+		    struct nouveau_encoder *outp)
+{
+	NV_DEBUG(drm, "%s caps: dp_interlace=%d\n",
+		 outp->base.base.name, outp->caps.dp_interlace);
+}
+
 static void
 nv50_outp_release(struct nouveau_encoder *nv_encoder)
 {
@@ -1819,6 +1827,7 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	drm_connector_attach_encoder(connector, encoder);
 
 	disp->core->func->sor->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+	nv50_outp_dump_caps(drm, nv_encoder);
 
 	if (dcbe->type == DCB_OUTPUT_DP) {
 		struct nvkm_i2c_aux *aux =
@@ -1989,6 +1998,7 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	drm_connector_attach_encoder(connector, encoder);
 
 	disp->core->func->pior->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
+	nv50_outp_dump_caps(drm, nv_encoder);
 
 	return 0;
 }
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
