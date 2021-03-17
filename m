Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692333FB6C
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BCF6E05C;
	Wed, 17 Mar 2021 22:44:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D411C6E05C
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fLpb6tM/VEaHfpumj7xpalf4ZsKWd+87GFmMa6VhHtc=;
 b=KpLmhDV0vsdGkMx065Oypo8kng/nVcneUN8dD76zbI0ejmZ33oHFAmvGYjjyuME0ktL0uL
 E/3kj5XLYqjtmB86wSs0mW+MydTa7y1ZqDkH14xMWznmq5Mfvy9gr+H/dWD+OFsDDB//HZ
 Xc6ZSnZkPpAoFi2m6ARfxM0ZakGbYE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-IKgt-M7fPq2SX0yT68wC6w-1; Wed, 17 Mar 2021 18:44:17 -0400
X-MC-Unique: IKgt-M7fPq2SX0yT68wC6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B5FD190B2A0;
 Wed, 17 Mar 2021 22:44:16 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D734B503EC;
 Wed, 17 Mar 2021 22:44:15 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:44:07 -0400
Message-Id: <20210317224407.447572-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t] tests/kms_plane: Don't unset primary_fb
 when testing other planes
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Currently, nouveau doesn't support having a CRTC without a primary FB set. We
won't reject such configurations, but the behavior is undefined which will cause
CRCs to become undefined. So, avoid clearing the primary FB while we're testing
non-primary planes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_plane.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 298a9375..c87983a4 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -817,9 +817,10 @@ enum crc_set { PACKED_CRC_SET,
 	       MAX_CRC_SET };
 
 static bool test_format_plane(data_t *data, enum pipe pipe,
-			      igt_output_t *output, igt_plane_t *plane)
+			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
 {
 	struct igt_fb fb = {};
+	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
 	drmModeModeInfo *mode;
 	uint32_t format, ref_format;
 	uint64_t modifier, ref_modifier;
@@ -879,7 +880,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			height = test_fb.height;
 		}
 
-		igt_plane_set_fb(plane, NULL);
+		igt_plane_set_fb(plane, clear_fb);
 
 		igt_remove_fb(data->drm_fd, &test_fb);
 	}
@@ -937,7 +938,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_stop(data->pipe_crc);
 
-	igt_plane_set_fb(plane, NULL);
+	igt_plane_set_fb(plane, clear_fb);
 	igt_remove_fb(data->drm_fd, &fb);
 
 	return result;
@@ -1010,7 +1011,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		result &= test_format_plane(data, pipe, output, plane);
+		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
 
 	test_fini(data);
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
