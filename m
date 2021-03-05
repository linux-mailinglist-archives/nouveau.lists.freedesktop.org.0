Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBC532DF43
	for <lists+nouveau@lfdr.de>; Fri,  5 Mar 2021 02:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE94C6EAC1;
	Fri,  5 Mar 2021 01:53:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3896EAC1
 for <nouveau@lists.freedesktop.org>; Fri,  5 Mar 2021 01:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614909180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1PouAGyaEAojf3ovTLFX1yOmiU99mhHbemhpq78aaTo=;
 b=C0xgrCWzON1kAS2yto6GXsR7vCoa4hRY8wH3vm1x7KjvIsVQvfES4rypGPq3yRgsrET7o1
 RMGW1kSLhcmvA1kkvgGayN40Rj1wPMGltXFGYxC1VSwVFtbs91jEFIT66IAFcaIC6+WTWC
 OwwrE7eLjHUztO6xsqO4YZJAgka3mps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-aoH0ADXoPxG-HWKJhQM3Yw-1; Thu, 04 Mar 2021 20:52:56 -0500
X-MC-Unique: aoH0ADXoPxG-HWKJhQM3Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56E2F1842142;
 Fri,  5 Mar 2021 01:52:54 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-27.rdu2.redhat.com [10.10.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FCD52BFEB;
 Fri,  5 Mar 2021 01:52:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Thu,  4 Mar 2021 20:52:41 -0500
Message-Id: <20210305015242.740590-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Subject: [Nouveau] [PATCH] drm/nouveau/kms/nve4-nv108: Limit cursors to
 128x128
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
Cc: "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

While Kepler does technically support 256x256 cursors, it turns out that
Kepler actually has some additional requirements for scanout surfaces that
we're not enforcing correctly, which aren't present on Maxwell and later.
Cursor surfaces must always use small pages (4K), and overlay surfaces must
always use large pages (128K).

Fixing this correctly though will take a bit more work: as we'll need to
add some code in prepare_fb() to move cursor FBs in large pages to small
pages, and vice-versa for overlay FBs. So until we have the time to do
that, just limit cursor surfaces to 128x128 - a size small enough to always
default to small pages.

This means small ovlys are still broken on Kepler, but it is extremely
unlikely anyone cares about those anyway :).

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: d3b2f0f7921c ("drm/nouveau/kms/nv50-: Report max cursor size to userspace")
Cc: <stable@vger.kernel.org> # v5.11+
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 196612addfd6..1c9c0cdf85db 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2693,9 +2693,20 @@ nv50_display_create(struct drm_device *dev)
 	else
 		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
 
-	if (disp->disp->object.oclass >= GK104_DISP) {
+	/* FIXME: 256x256 cursors are supported on Kepler, however unlike Maxwell and later
+	 * generations Kepler requires that we use small pages (4K) for cursor scanout surfaces. The
+	 * proper fix for this is to teach nouveau to migrate fbs being used for the cursor plane to
+	 * small page allocations in prepare_fb(). When this is implemented, we should also force
+	 * large pages (128K) for ovly fbs in order to fix Kepler ovlys.
+	 * But until then, just limit cursors to 128x128 - which is small enough to avoid ever using
+	 * large pages.
+	 */
+	if (disp->disp->object.oclass >= GM107_DISP) {
 		dev->mode_config.cursor_width = 256;
 		dev->mode_config.cursor_height = 256;
+	} else if (disp->disp->object.oclass >= GK104_DISP) {
+		dev->mode_config.cursor_width = 128;
+		dev->mode_config.cursor_height = 128;
 	} else {
 		dev->mode_config.cursor_width = 64;
 		dev->mode_config.cursor_height = 64;
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
