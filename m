Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AE4311746
	for <lists+nouveau@lfdr.de>; Sat,  6 Feb 2021 00:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69546F523;
	Fri,  5 Feb 2021 23:45:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8E96F4E1
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 23:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612568727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oKm0Ja8X4Ojgn+JREDsvj+rdNkNRQb5M2c2kSDsJ3+k=;
 b=DKES+Zk3gM6RqAeGDG8ryqKHh9lXcAXC0FQ/BxaSpAKRhrchNfhJbuTyb6inhrSeRTGMDz
 Xbo54GDe1CVshBt/0swnK2OfjE5GxoN2blSa9ajM8LIUSmnquCh9jtnCai2RpHudaL5zno
 jbJg4cItAA6iYuFeeyDqgJT40ZGG324=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-bQvA3uDcNlmQDUcWV15c6A-1; Fri, 05 Feb 2021 18:45:25 -0500
X-MC-Unique: bQvA3uDcNlmQDUcWV15c6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D468484E241;
 Fri,  5 Feb 2021 23:45:23 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-116-79.rdu2.redhat.com
 [10.10.116.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D724819727;
 Fri,  5 Feb 2021 23:45:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Fri,  5 Feb 2021 18:45:05 -0500
Message-Id: <20210205234515.1216538-2-lyude@redhat.com>
In-Reply-To: <20210205234515.1216538-1-lyude@redhat.com>
References: <20210205234515.1216538-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Nouveau] [RFC v3 01/10] drm/nouveau/kms/nv40-/backlight: Assign
 prop type once
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
Cc: Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, greg.depoire@gmail.com,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: greg.depoire@gmail.com
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 72f35a2babcb..42b498e7e2bf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -106,7 +106,6 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
 	if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
 		return -ENODEV;
 
-	props->type = BACKLIGHT_RAW;
 	props->max_brightness = 31;
 	*ops = &nv40_bl_ops;
 	return 0;
@@ -212,7 +211,6 @@ nv50_backlight_init(struct nouveau_encoder *nv_encoder,
 	else
 		*ops = &nva3_bl_ops;
 
-	props->type = BACKLIGHT_RAW;
 	props->max_brightness = 100;
 
 	return 0;
@@ -226,7 +224,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 	struct nouveau_encoder *nv_encoder = NULL;
 	struct nvif_device *device = &drm->client.device;
 	char backlight_name[BL_NAME_SIZE];
-	struct backlight_properties props = {0};
+	struct backlight_properties props = { .type = BACKLIGHT_RAW, 0 };
 	const struct backlight_ops *ops;
 	int ret;
 
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
