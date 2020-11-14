Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF10B2B299F
	for <lists+nouveau@lfdr.de>; Sat, 14 Nov 2020 01:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BA76E89B;
	Sat, 14 Nov 2020 00:15:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3656E897
 for <nouveau@lists.freedesktop.org>; Sat, 14 Nov 2020 00:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YEUE8BEt/HHRBsioHGD0oe9yvnlWjkF4Cv9LZW4QV9w=;
 b=YWV2+JjW6l00GgmWzTPgUfSlTwBM4Ss6rUaPsAiniOV9i62RTzv6mduf73U28HrAOujRtB
 gSBuOwnDH6q/01uzHQg4RC8TIS7rY6XqCPb3FPKrQ2Mb2IH/QEeDSNS1qTPw2G2BfN7nZg
 vWK8EFwQvDII+eW+aldEBIXmFpMrRZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-vosWtSBlOlO7ntrw3MStZw-1; Fri, 13 Nov 2020 19:14:59 -0500
X-MC-Unique: vosWtSBlOlO7ntrw3MStZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2FBF85C70F;
 Sat, 14 Nov 2020 00:14:57 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8D6760C15;
 Sat, 14 Nov 2020 00:14:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 13 Nov 2020 19:14:16 -0500
Message-Id: <20201114001417.155093-8-lyude@redhat.com>
In-Reply-To: <20201114001417.155093-1-lyude@redhat.com>
References: <20201114001417.155093-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 7/8] drm/nouveau/kms/nv50-: Use
 nouveau_encoder->crtc in get_eld callback
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

drm_encoder->crtc is deprecated for atomic drivers, but
nouveau_encoder->crtc is safe.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 63fff3988f19..b19d0d7a6de9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -630,7 +630,7 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 		if (!nv_connector)
 			continue;
 
-		nv_crtc = nouveau_crtc(encoder->crtc);
+		nv_crtc = nouveau_crtc(nv_encoder->crtc);
 		if (!nv_crtc || nv_encoder->or != port ||
 		    nv_crtc->index != dev_id)
 			continue;
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
