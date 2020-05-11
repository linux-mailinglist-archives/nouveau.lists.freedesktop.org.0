Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B04CA1CE857
	for <lists+nouveau@lfdr.de>; Tue, 12 May 2020 00:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A66B6E5CD;
	Mon, 11 May 2020 22:42:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC6B6E5CD
 for <nouveau@lists.freedesktop.org>; Mon, 11 May 2020 22:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589236966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CFJqLqwxwm/YiCehI/vMQMvMy9CLDJuBp2YttHeyzg=;
 b=MUaEfBz+DFRGeKH36J1OpK0N3te3aDWmtt7XFut/vLeoUtZdhc0HjShf2B1SmWJnPUmmDa
 KqKIh1PPtf6AlyMKJw14wHPBC2uExtg7l+d/B/aDrjVCvLVsMj08uVfQRAXBHfbUjAEx4/
 HIvLSfd5NzKHgPsyekPVwZP/hsvxvOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-6w2qJPSPORGvVI8ZmcNusw-1; Mon, 11 May 2020 18:42:41 -0400
X-MC-Unique: 6w2qJPSPORGvVI8ZmcNusw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AF4E8005AD;
 Mon, 11 May 2020 22:42:40 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-117-238.rdu2.redhat.com
 [10.10.117.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F273977F2E;
 Mon, 11 May 2020 22:42:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 11 May 2020 18:41:26 -0400
Message-Id: <20200511224148.598468-5-lyude@redhat.com>
In-Reply-To: <20200511224148.598468-1-lyude@redhat.com>
References: <20200511224148.598468-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Subject: [Nouveau] [PATCH v3 4/5] drm/nouveau/kms/nv50-: Move 8BPC limit for
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, Sean Paul <seanpaul@chromium.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
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
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index f67dffe8c005..c49a6c47c66f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -904,15 +904,9 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
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
@@ -1072,8 +1066,17 @@ nv50_mstc_get_modes(struct drm_connector *connector)
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
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
