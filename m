Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0F832007E
	for <lists+nouveau@lfdr.de>; Fri, 19 Feb 2021 22:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50356EC2A;
	Fri, 19 Feb 2021 21:54:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7F66EC27
 for <nouveau@lists.freedesktop.org>; Fri, 19 Feb 2021 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613771651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wm4oY60HDEi6MJ6NUR2B395ZKlrMFtTCO2to+5mcRtw=;
 b=Xasa0WnLXjsKwrY83DHZnhvyQVs8vugZmVVCWFf8tZvz4O69HW9c9aIXcgVP2ibU6AI90I
 EN64MIyrNfr3BIhwdu+VHR0if0rGW+qmco1cczbwjlRrTZXhxB+UBZgpC7mjICBMHUVlGp
 7Rjm5YrQiUYLH9p0faU68Lsc66yXTso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-c3LkErexM3We81p-4siIng-1; Fri, 19 Feb 2021 16:54:10 -0500
X-MC-Unique: c3LkErexM3We81p-4siIng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 110AE1B2C98A;
 Fri, 19 Feb 2021 21:54:07 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-118-5.rdu2.redhat.com [10.10.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDAE16A03C;
 Fri, 19 Feb 2021 21:54:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 19 Feb 2021 16:53:03 -0500
Message-Id: <20210219215326.2227596-8-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-1-lyude@redhat.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH 07/30] drm/bridge/analogix/anx78xx: Add missing
 drm_dp_aux_unregister() call
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Surprisingly, this bridge actually registers it's AUX adapter at the
correct time already. Nice job! However, it does forget to actually
unregister the AUX adapter, so let's add a bridge function to handle that.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 81debd02c169..ec4607dc01eb 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -942,6 +942,11 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void anx78xx_bridge_detach(struct drm_bridge *bridge)
+{
+	drm_dp_aux_unregister(&bridge_to_anx78xx(bridge)->aux);
+}
+
 static enum drm_mode_status
 anx78xx_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_info *info,
@@ -1013,6 +1018,7 @@ static void anx78xx_bridge_enable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs anx78xx_bridge_funcs = {
 	.attach = anx78xx_bridge_attach,
+	.detach = anx78xx_bridge_detach,
 	.mode_valid = anx78xx_bridge_mode_valid,
 	.disable = anx78xx_bridge_disable,
 	.mode_set = anx78xx_bridge_mode_set,
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
