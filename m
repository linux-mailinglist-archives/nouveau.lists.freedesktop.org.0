Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABFE34104B
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 23:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D9E6E091;
	Thu, 18 Mar 2021 22:21:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95F16E091
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 22:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616106097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vrAsdD25vtBFPNW4hIS6diNI9Kykl9wB3aq2PA/sPs=;
 b=EIXKq3tTURbCyRRO04ywACDNEtGil0Y8eO2BodDsutN/xHp5rZ8S1No5sDccJaNJJ01YRQ
 GcdtZPNj4hGESU5oXlk/FwYYA8SKgYVciGKCTZe5F8ZS316xEPUyecu7vEqnJuUJQ7rMWq
 EZKDfFeGni/ZSxYvVVFFzAoh6rvKktY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-qo4SWJ4vPeS5zRGM46tDTQ-1; Thu, 18 Mar 2021 18:21:35 -0400
X-MC-Unique: qo4SWJ4vPeS5zRGM46tDTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC861180FCA1;
 Thu, 18 Mar 2021 22:21:34 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-18.rdu2.redhat.com [10.10.113.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7D4360CD7;
 Thu, 18 Mar 2021 22:21:33 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Thu, 18 Mar 2021 18:21:23 -0400
Message-Id: <20210318222124.970997-2-lyude@redhat.com>
In-Reply-To: <20210318222124.970997-1-lyude@redhat.com>
References: <20210318222124.970997-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v2 1/2] tests/kms_cursor_crc: Probe kernel
 for cursor size support
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

Currently we just assume that every cursor size up to data->cursor_max_w/h will
be supported by the driver, and check for support of nonsquare cursors by
checking if we're running on u815 and if so, which variant of intel hardware
we're running on. This isn't really ideal as we're about to enable 32x32 cursor
size tests for nouveau, and Intel hardware doesn't support cursor sizes that
small.

So, fix this by removing has_nonsquare_cursors() and replacing it with a more
generic require_cursor_size() function which checks whether or not the driver
we're using supports a given cursor size by attempting a test-only atomic
commit.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_cursor_crc.c | 131 ++++++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 55 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 3541ea06..b9c05472 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -523,26 +523,43 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 	igt_put_cairo_ctx(cr);
 }
 
-static bool has_nonsquare_cursors(data_t *data)
+static void require_cursor_size(data_t *data, int w, int h)
 {
-	uint32_t devid;
+	igt_fb_t primary_fb;
+	drmModeModeInfo *mode;
+	igt_display_t *display = &data->display;
+	igt_output_t *output = data->output;
+	igt_plane_t *primary, *cursor;
+	int ret;
 
-	if (!is_i915_device(data->drm_fd))
-		return false;
+	igt_output_set_pipe(output, data->pipe);
 
-	devid = intel_get_drm_devid(data->drm_fd);
+	mode = igt_output_get_mode(output);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	cursor = igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
 
-	/*
-	 * Test non-square cursors a bit on the platforms
-	 * that support such things.
-	 */
-	if (devid == PCI_CHIP_845_G || devid == PCI_CHIP_I865_G)
-		return true;
+	/* Create temporary primary fb for testing */
+	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+				 LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb));
 
-	if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))
-		return false;
+	igt_plane_set_fb(primary, &primary_fb);
+	igt_plane_set_fb(cursor, &data->fb);
+	igt_plane_set_size(cursor, w, h);
+	igt_fb_set_size(&data->fb, cursor, w, h);
+
+	/* Test if the kernel supports the given cursor size or not */
+	ret = igt_display_try_commit_atomic(display,
+					    DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET,
+					    NULL);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(cursor, NULL);
+
+	igt_remove_fb(data->drm_fd, &primary_fb);
+	igt_output_set_pipe(output, PIPE_NONE);
 
-	return intel_gen(devid) >= 7;
+	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
 }
 
 static void test_cursor_size(data_t *data)
@@ -697,27 +714,33 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 			create_cursor_fb(data, w, h);
 		}
 
-		/* Using created cursor FBs to test cursor support */
-		igt_describe("Check if a given-size cursor is well-positioned inside the screen.");
-		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
-			run_test(data, test_crc_onscreen, w, h);
-
-		igt_describe("Check if a given-size cursor is well-positioned outside the screen.");
-		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
-			run_test(data, test_crc_offscreen, w, h);
-
-		igt_describe("Check the smooth and pixel-by-pixel given-size cursor movements on"
-		             "horizontal, vertical and diagonal.");
-		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
-			run_test(data, test_crc_sliding, w, h);
-
-		igt_describe("Check random placement of a cursor with given size.");
-		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
-			run_test(data, test_crc_random, w, h);
-
-		igt_describe("Check the rapid update of given-size cursor movements.");
-		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name(pipe), w, h) {
-			run_test(data, test_rapid_movement, w, h);
+		igt_subtest_group {
+			igt_fixture
+				require_cursor_size(data, w, h);
+
+			/* Using created cursor FBs to test cursor support */
+			igt_describe("Check if a given-size cursor is well-positioned inside the "
+				     "screen.");
+			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_onscreen, w, h);
+
+			igt_describe("Check if a given-size cursor is well-positioned outside the "
+				     "screen.");
+			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_offscreen, w, h);
+
+			igt_describe("Check the smooth and pixel-by-pixel given-size cursor "
+				     "movements on horizontal, vertical and diagonal.");
+			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_sliding, w, h);
+
+			igt_describe("Check random placement of a cursor with given size.");
+			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_random, w, h);
+
+			igt_describe("Check the rapid update of given-size cursor movements.");
+			igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_rapid_movement, w, h);
 		}
 
 		igt_fixture
@@ -730,27 +753,25 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 		 */
 		h /= 3;
 
-		igt_fixture {
-			if (has_nonsquare_cursors(data))
-				create_cursor_fb(data, w, h);
-		}
+		igt_fixture
+			create_cursor_fb(data, w, h);
 
-		/* Using created cursor FBs to test cursor support */
-		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h) {
-			igt_require(has_nonsquare_cursors(data));
-			run_test(data, test_crc_onscreen, w, h);
-		}
-		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h) {
-			igt_require(has_nonsquare_cursors(data));
-			run_test(data, test_crc_offscreen, w, h);
-		}
-		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h) {
-			igt_require(has_nonsquare_cursors(data));
-			run_test(data, test_crc_sliding, w, h);
-		}
-		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h) {
-			igt_require(has_nonsquare_cursors(data));
-			run_test(data, test_crc_random, w, h);
+		igt_subtest_group {
+			igt_fixture
+				require_cursor_size(data, w, h);
+
+			/* Using created cursor FBs to test cursor support */
+			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_onscreen, w, h);
+
+			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_offscreen, w, h);
+
+			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_sliding, w, h);
+
+			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
+				run_test(data, test_crc_random, w, h);
 		}
 
 		igt_fixture
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
