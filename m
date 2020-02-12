Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB915B440
	for <lists+nouveau@lfdr.de>; Thu, 13 Feb 2020 00:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401936EAFA;
	Wed, 12 Feb 2020 23:01:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE436EB05
 for <nouveau@lists.freedesktop.org>; Wed, 12 Feb 2020 23:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581548467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WLsIYS6APukqpz4dC2as0jWPB7g29dh0U9M8tvQiMs=;
 b=CFmehEHupIMOAUI9O2vlWMlkbLzMUQTj/ogLqtWt64PkfLQkyynaA9/HnNGs2uIIzjcJMX
 oNVaD9l2O/d+wPmVpn72ZTtmnnwKEObFXtNmck+RZsm3ZxsmOg71HErHABQNRqbJgCWuAD
 kRUAPsvuFzpiFFKdr0pBuLiYsGPwLRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-As5XGrl2OLWpVQwo5cF7Zw-1; Wed, 12 Feb 2020 18:00:58 -0500
X-MC-Unique: As5XGrl2OLWpVQwo5cF7Zw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CC8D1084430;
 Wed, 12 Feb 2020 23:00:56 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DE1C5C137;
 Wed, 12 Feb 2020 23:00:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 12 Feb 2020 18:00:37 -0500
Message-Id: <20200212230043.170477-4-lyude@redhat.com>
In-Reply-To: <20200212230043.170477-1-lyude@redhat.com>
References: <20200212230043.170477-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Subject: [Nouveau] [PATCH 3/4] drm/nouveau/kms/nv50-: Move 8BPC limit for
 MST into nv50_mstc_get_modes()
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Manasi Navare <manasi.d.navare@intel.com>, Takashi Iwai <tiwai@suse.de>,
 Sean Paul <seanpaul@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This just limits the BPC for MST connectors to a maximum of 8 from
nv50_mstc_get_modes(), instead of doing so during
nv50_msto_atomic_check(). This doesn't introduce any functional changes
yet (other then userspace now lying about the max bpc, but we can't
support that yet anyway so meh). But, we'll need this in a moment so
that we can share mode validation between SST and MST which will fix
some real world issues.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 32a1c4221f1e..766b8e80a8f5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -903,15 +903,9 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 	if (!state->duplicated) {
 		const int clock = crtc_state->adjusted_mode.clock;
 
-		/*
-		 * XXX: Since we don't use HDR in userspace quite yet, limit
-		 * the bpc to 8 to save bandwidth on the topology. In the
-		 * future, we'll want to properly fix this by dynamically
-		 * selecting the highest possible bpc that would fit in the
-		 * topology
-		 */
-		asyh->or.bpc = min(connector->display_info.bpc, 8U);
-		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3, false);
+		asyh->or.bpc = connector->display_info.bpc;
+		asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3,
+						    false);
 	}
 
 	slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr, mstc->port,
@@ -1071,8 +1065,17 @@ nv50_mstc_get_modes(struct drm_connector *connector)
 	if (mstc->edid)
 		ret = drm_add_edid_modes(&mstc->connector, mstc->edid);
 
-	if (!mstc->connector.display_info.bpc)
-		mstc->connector.display_info.bpc = 8;
+	/*
+	 * XXX: Since we don't use HDR in userspace quite yet, limit the bpc
+	 * to 8 to save bandwidth on the topology. In the future, we'll want
+	 * to properly fix this by dynamically selecting the highest possible
+	 * bpc that would fit in the topology
+	 */
+	if (connector->display_info.bpc)
+		connector->display_info.bpc =
+			clamp(connector->display_info.bpc, 6U, 8U);
+	else
+		connector->display_info.bpc = 8;
 
 	if (mstc->native)
 		drm_mode_destroy(mstc->connector.dev, mstc->native);
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
