Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A00179BC9
	for <lists+nouveau@lfdr.de>; Wed,  4 Mar 2020 23:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5727F6EB74;
	Wed,  4 Mar 2020 22:36:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3AC6EB74
 for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2020 22:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583361390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkHNoF1LiLaOFBDXS0D+ocY6/bt/y7PoObvSuoIt6kI=;
 b=eAV/cYpkWHGqllD5LMpJrPbFSRcA3XjqCrhyyjA5jQ1lcws5IfvM+2BiLFc2zrNnkMfvrs
 Pra4Lv2q1GfS7zQ6BErcJj8LDRsb9m0HtGMK7Sfz8hFgvKGDGect0dbFixmYQF/hhwjXZ4
 saD+Tq2PUsumfF5s7rTNsSvUe7areRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-xMuv8gZLMNqn0oLC9IXmPw-1; Wed, 04 Mar 2020 17:36:27 -0500
X-MC-Unique: xMuv8gZLMNqn0oLC9IXmPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F42D800053;
 Wed,  4 Mar 2020 22:36:25 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B724B60BE0;
 Wed,  4 Mar 2020 22:36:23 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed,  4 Mar 2020 17:36:11 -0500
Message-Id: <20200304223614.312023-2-lyude@redhat.com>
In-Reply-To: <20200304223614.312023-1-lyude@redhat.com>
References: <20200304223614.312023-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 1/3] drm/dp_mst: Rename
 drm_dp_mst_is_dp_mst_end_device() to be less redundant
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

It's already prefixed by dp_mst, so we don't really need to repeat
ourselves here. One of the changes I should have picked up originally
when reviewing MST DSC support.

There should be no functional changes here

Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 61e7beada832..207eef08d12c 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1937,7 +1937,7 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_port *port,
 	return parent_lct + 1;
 }
 
-static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs)
+static bool drm_dp_mst_is_end_device(u8 pdt, bool mcs)
 {
 	switch (pdt) {
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
@@ -1967,13 +1967,13 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 
 	/* Teardown the old pdt, if there is one */
 	if (port->pdt != DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/*
 			 * If the new PDT would also have an i2c bus,
 			 * don't bother with reregistering it
 			 */
 			if (new_pdt != DP_PEER_DEVICE_NONE &&
-			    drm_dp_mst_is_dp_mst_end_device(new_pdt, new_mcs)) {
+			    drm_dp_mst_is_end_device(new_pdt, new_mcs)) {
 				port->pdt = new_pdt;
 				port->mcs = new_mcs;
 				return 0;
@@ -1993,7 +1993,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 	port->mcs = new_mcs;
 
 	if (port->pdt != DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/* add i2c over sideband */
 			ret = drm_dp_mst_register_i2c_bus(&port->aux);
 		} else {
@@ -2169,7 +2169,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 	}
 
 	if (port->pdt != DP_PEER_DEVICE_NONE &&
-	    drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+	    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 		port->cached_edid = drm_get_edid(port->connector,
 						 &port->aux.ddc);
 		drm_connector_set_tile_property(port->connector);
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
