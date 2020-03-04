Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D48179BCC
	for <lists+nouveau@lfdr.de>; Wed,  4 Mar 2020 23:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1C76EB76;
	Wed,  4 Mar 2020 22:36:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25DD6EB76
 for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2020 22:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583361393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8DblgkFPwgVS5YcckxNN+AnxhZVfLTqdm5lJfepqis=;
 b=dnOjUslK2KeLvARFnzgGx5BwVHMrZW1rq0mn6qLxdxt5kQKaoLFRbK8seCfcJtFmxnVN50
 WRyP/hNUCsQm86uqFLEOgh2PK6pGr1oz13zwd9BC8cydY8T7prTD9+DkF3ZlOXU4iE92w+
 C/Te6D5FpIn/88RCXPNTvA7HL0Nuh2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-zsiOIcNjO42kDeKW6oqcBg-1; Wed, 04 Mar 2020 17:36:28 -0500
X-MC-Unique: zsiOIcNjO42kDeKW6oqcBg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FFE5800D54;
 Wed,  4 Mar 2020 22:36:26 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 657C060BE0;
 Wed,  4 Mar 2020 22:36:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed,  4 Mar 2020 17:36:12 -0500
Message-Id: <20200304223614.312023-3-lyude@redhat.com>
In-Reply-To: <20200304223614.312023-1-lyude@redhat.com>
References: <20200304223614.312023-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Nouveau] [PATCH 2/3] drm/dp_mst: Don't show connectors as
 connected before probing available PBN
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

It's next to impossible for us to do connector probing on topologies
without occasionally racing with userspace, since creating a connector
itself causes a hotplug event which we have to send before probing the
available PBN of a connector. Even if we didn't have this hotplug event
sent, there's still always a chance that userspace started probing
connectors before we finished probing the topology.

This can be a problem when validating a new MST state since the
connector will be shown as connected briefly, but without any available
PBN - causing any atomic state which would enable said connector to fail
with -ENOSPC. So, let's simply workaround this by telling userspace new
MST connectors are disconnected until we've finished probing their PBN.
Since we always send a hotplug event at the end of the link address
probing process, userspace will still know to reprobe the connector when
we're ready.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: cd82d82cbc04 ("drm/dp_mst: Add branch bandwidth validation to MST atomic check")
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 207eef08d12c..7b0ff0cff954 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4033,6 +4033,19 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 			ret = connector_status_connected;
 		break;
 	}
+
+	/* We don't want to tell userspace the port is actually plugged into
+	 * anything until we've finished probing it's available_pbn, otherwise
+	 * userspace will see racy atomic check failures
+	 *
+	 * Since we always send a hotplug at the end of probing topology
+	 * state, we can just let userspace reprobe this connector later.
+	 */
+	if (ret == connector_status_connected && !port->available_pbn) {
+		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] not ready yet (PBN not probed)\n",
+			      connector->base.id, connector->name);
+		ret = connector_status_disconnected;
+	}
 out:
 	drm_dp_mst_topology_put_port(port);
 	return ret;
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
