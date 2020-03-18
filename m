Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EBA189349
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 01:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3746E83F;
	Wed, 18 Mar 2020 00:47:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320916E83F
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 00:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=brU9au6eTnjVESP5Sl6TTxU5IyqNpHxPJ4m8sM6pYNw=;
 b=A4mr1pyIiOd0tALpXyMkdtNIxyi48Ds0tCSgQwHm2QE3F3N1QbgoMUyind1QO/gzPte8v8
 pi83hEnF3OXr8LM9TAaYe+roxIe5z/8W1KMyOfT5QSVCRTMhKwP5SayCuqlz/f++SWEErn
 3rwOTorqLhvVTuVDTsfWzbNN8815Zdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-vluPPFgSMSafUYGE-Gq2dA-1; Tue, 17 Mar 2020 20:47:03 -0400
X-MC-Unique: vluPPFgSMSafUYGE-Gq2dA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EAC918FF660;
 Wed, 18 Mar 2020 00:47:02 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3F365C1BB;
 Wed, 18 Mar 2020 00:47:01 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2020 20:46:59 -0400
Message-Id: <20200318004659.236341-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t] tests/kms_plane: Generate reference CRCs
 for partial coverage too
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

There's been a TODO sitting in the kms_plane test suite for a while now
as a placeholder for actually generating a reference CRC for
plane-position-hole tests. This means we have never actually been
verifying whether or not partially covering our hole with a hardware
plane works displays properly, and have just simply been checking that
the frame CRC doesn't change when we're not changing the display output.
On nouveau at least, this has been causing us to pass these tests
even when we don't correctly program our hardware plane's framebuffer.

So, get rid of that TODO and implement this by converting
convert_fb_for_mode__position() to a generic convert_fb_for_mode()
function that allows us to create a colored FB, either with or without a
series of 64x64 rectangles, and use that in test_grab_crc() to generate
reference CRCs for the plane-position-hole tests. Additionally, we move
around all of the test flags into a single enumerator, and make sure
none of them have overlapping bits so we can correctly tell from
test_grab_crc() whether or not our reference CRC should include
rectangles (otherwise, we'll accidentally add rectangles in our
reference frame for the plane panning tests).

Then, we finally flip the TEST_POSITION_FULLY_COVERED enum to
TEST_POSITION_PARTIALLY_COVERED, so tests which don't explicitly specify
partial positioning don't get it in their reference fbs.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 tests/kms_plane.c | 164 +++++++++++++++++++++++++---------------------
 1 file changed, 91 insertions(+), 73 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 805795cd..c95f3584 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -44,6 +44,11 @@ typedef struct {
 	float blue;
 } color_t;
 
+typedef struct {
+	int x, y;
+	color_t color;
+} rectangle_t;
+
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
@@ -71,9 +76,52 @@ static void test_fini(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 }
 
+enum {
+	TEST_POSITION_PARTIALLY_COVERED = 1 << 0,
+	TEST_DPMS                       = 1 << 1,
+	TEST_PANNING_TOP_LEFT           = 1 << 2,
+	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
+	TEST_SUSPEND_RESUME             = 1 << 4,
+};
+
+/*
+ * create a colored fb, possibly with a series of 64x64 colored rectangles (used
+ * for position tests)
+ */
+static void
+create_fb_for_mode(data_t *data, drmModeModeInfo *mode,
+		   color_t *fb_color,
+		   const rectangle_t *rects, int rect_cnt,
+		   struct igt_fb *fb /* out */)
+{
+	unsigned int fb_id;
+	cairo_t *cr;
+
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      fb);
+	igt_assert_fd(fb_id);
+
+	cr = igt_get_cairo_ctx(data->drm_fd, fb);
+	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
+			fb_color->red, fb_color->green, fb_color->blue);
+	for (int i = 0; i < rect_cnt; i++) {
+		const rectangle_t *rect = &rects[i];
+		igt_paint_color(cr,
+				rect->x, rect->y, 64, 64,
+				rect->color.red,
+				rect->color.green,
+				rect->color.blue);
+	}
+
+	igt_put_cairo_ctx(data->drm_fd, fb, cr);
+}
+
 static void
 test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
-	      color_t *fb_color, igt_crc_t *crc /* out */)
+	      color_t *fb_color, unsigned int flags, igt_crc_t *crc /* out */)
 {
 	struct igt_fb fb;
 	drmModeModeInfo *mode;
@@ -86,13 +134,19 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	primary = igt_output_get_plane(output, 0);
 
 	mode = igt_output_get_mode(output);
-	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
-			    fb_color->red, fb_color->green, fb_color->blue,
-			    &fb);
-	igt_plane_set_fb(primary, &fb);
+	if (flags & TEST_POSITION_PARTIALLY_COVERED) {
+		static const rectangle_t rects[] = {
+			{ .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }},
+			{ .x = 132, .y = 132, .color = { 0.0, 1.0, 0.0 }},
+		};
+
+		create_fb_for_mode(data, mode, fb_color,
+				   rects, ARRAY_SIZE(rects), &fb);
+	} else {
+		create_fb_for_mode(data, mode, fb_color, NULL, 0, &fb);
+	}
 
+	igt_plane_set_fb(primary, &fb);
 	ret = igt_display_try_commit2(&data->display, COMMIT_LEGACY);
 	igt_skip_on(ret != 0);
 
@@ -104,19 +158,24 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, &fb);
 
 	crc_str = igt_crc_to_string(crc);
-	igt_debug("CRC for a (%.02f,%.02f,%.02f) fb: %s\n", fb_color->red,
-		  fb_color->green, fb_color->blue, crc_str);
+	igt_debug("CRC for a %s covered (%.02f,%.02f,%.02f) fb: %s\n",
+		  flags & TEST_POSITION_PARTIALLY_COVERED ? "partially" : "fully",
+		  fb_color->red, fb_color->green, fb_color->blue,
+		  crc_str);
 	free(crc_str);
 }
 
 /*
  * Plane position test.
- *   - We start by grabbing a reference CRC of a full green fb being scanned
- *     out on the primary plane
+ *   - For testing positions that fully cover our hole, we start by grabbing a
+ *     reference CRC of a full green fb being scanned out on the primary plane.
+ *     For testing positions that only partially cover our hole, we instead use
+ *     a full green fb with a partially covered black rectangle.
  *   - Then we scannout 2 planes:
  *      - the primary plane uses a green fb with a black rectangle
  *      - a plane, on top of the primary plane, with a green fb that is set-up
- *        to cover the black rectangle of the primary plane fb
+ *        to fully or partially cover the black rectangle of the primary plane
+ *        fb
  *     The resulting CRC should be identical to the reference CRC
  */
 
@@ -125,38 +184,6 @@ typedef struct {
 	igt_crc_t reference_crc;
 } test_position_t;
 
-/*
- * create a green fb with a black rectangle at (rect_x,rect_y) and of size
- * (rect_w,rect_h)
- */
-static void
-create_fb_for_mode__position(data_t *data, drmModeModeInfo *mode,
-			     double rect_x, double rect_y,
-			     double rect_w, double rect_h,
-			     struct igt_fb *fb /* out */)
-{
-	unsigned int fb_id;
-	cairo_t *cr;
-
-	fb_id = igt_create_fb(data->drm_fd,
-				  mode->hdisplay, mode->vdisplay,
-				  DRM_FORMAT_XRGB8888,
-				  LOCAL_DRM_FORMAT_MOD_NONE,
-				  fb);
-	igt_assert(fb_id);
-
-	cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	igt_paint_color(cr, 0, 0, mode->hdisplay, mode->vdisplay,
-			    0.0, 1.0, 0.0);
-	igt_paint_color(cr, rect_x, rect_y, rect_w, rect_h, 0.0, 0.0, 0.0);
-	igt_put_cairo_ctx(data->drm_fd, fb, cr);
-}
-
-enum {
-	TEST_POSITION_FULLY_COVERED = 1 << 0,
-	TEST_DPMS = 1 << 1,
-};
-
 static void
 test_plane_position_with_output(data_t *data,
 				enum pipe pipe,
@@ -165,6 +192,7 @@ test_plane_position_with_output(data_t *data,
 				igt_crc_t *reference_crc,
 				unsigned int flags)
 {
+	rectangle_t rect = { .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }};
 	igt_plane_t *primary, *sprite;
 	struct igt_fb primary_fb, sprite_fb;
 	drmModeModeInfo *mode;
@@ -179,26 +207,26 @@ test_plane_position_with_output(data_t *data,
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	sprite = igt_output_get_plane(output, plane);
 
-	create_fb_for_mode__position(data, mode, 100, 100, 64, 64,
-				     &primary_fb);
+	create_fb_for_mode(data, mode, &green, &rect, 1, &primary_fb);
 	igt_plane_set_fb(primary, &primary_fb);
 
 	igt_create_color_fb(data->drm_fd,
-				64, 64, /* width, height */
-				DRM_FORMAT_XRGB8888,
-				LOCAL_DRM_FORMAT_MOD_NONE,
-				0.0, 1.0, 0.0,
-				&sprite_fb);
+			    64, 64, /* width, height */
+			    DRM_FORMAT_XRGB8888,
+			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    0.0, 1.0, 0.0,
+			    &sprite_fb);
 	igt_plane_set_fb(sprite, &sprite_fb);
 
-	if (flags & TEST_POSITION_FULLY_COVERED)
-		igt_plane_set_position(sprite, 100, 100);
-	else
+	if (flags & TEST_POSITION_PARTIALLY_COVERED)
 		igt_plane_set_position(sprite, 132, 132);
+	else
+		igt_plane_set_position(sprite, 100, 100);
 
 	igt_display_commit(&data->display);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+	igt_assert_crc_equal(reference_crc, &crc);
 
 	if (flags & TEST_DPMS) {
 		kmstest_set_connector_dpms(data->drm_fd,
@@ -211,12 +239,6 @@ test_plane_position_with_output(data_t *data,
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &crc2);
 
-	if (flags & TEST_POSITION_FULLY_COVERED)
-		igt_assert_crc_equal(reference_crc, &crc);
-	else {
-		;/* FIXME: missing reference CRCs */
-	}
-
 	igt_assert_crc_equal(&crc, &crc2);
 
 	igt_plane_set_fb(primary, NULL);
@@ -237,8 +259,7 @@ test_plane_position(data_t *data, enum pipe pipe, unsigned int flags)
 	igt_require(output);
 
 	test_init(data, pipe);
-
-	test_grab_crc(data, output, pipe, &green, &reference_crc);
+	test_grab_crc(data, output, pipe, &green, flags, &reference_crc);
 
 	for (int plane = 1; plane < n_planes; plane++)
 		test_plane_position_with_output(data, pipe, plane,
@@ -287,12 +308,6 @@ create_fb_for_mode__panning(data_t *data, drmModeModeInfo *mode,
 	igt_put_cairo_ctx(data->drm_fd, fb, cr);
 }
 
-enum {
-	TEST_PANNING_TOP_LEFT	  = 1 << 0,
-	TEST_PANNING_BOTTOM_RIGHT = 1 << 1,
-	TEST_SUSPEND_RESUME	  = 1 << 2,
-};
-
 static void
 test_plane_panning_with_output(data_t *data,
 			       enum pipe pipe,
@@ -355,8 +370,8 @@ test_plane_panning(data_t *data, enum pipe pipe, unsigned int flags)
 
 	test_init(data, pipe);
 
-	test_grab_crc(data, output, pipe, &red, &red_crc);
-	test_grab_crc(data, output, pipe, &blue, &blue_crc);
+	test_grab_crc(data, output, pipe, &red, flags, &red_crc);
+	test_grab_crc(data, output, pipe, &blue, flags, &blue_crc);
 
 	for (int plane = 1; plane < n_planes; plane++)
 		test_plane_panning_with_output(data, pipe, plane, output,
@@ -956,15 +971,18 @@ run_tests_for_pipe_plane(data_t *data, enum pipe pipe)
 	data->crop = 0;
 	igt_subtest_f("plane-position-covered-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, TEST_POSITION_FULLY_COVERED);
+		test_plane_position(data, pipe, 0);
 
 	igt_subtest_f("plane-position-hole-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, 0);
+		test_plane_position(data, pipe,
+				    TEST_POSITION_PARTIALLY_COVERED);
 
 	igt_subtest_f("plane-position-hole-dpms-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, TEST_DPMS);
+		test_plane_position(data, pipe,
+				    TEST_POSITION_PARTIALLY_COVERED |
+				    TEST_DPMS);
 
 	igt_subtest_f("plane-panning-top-left-pipe-%s-planes",
 		      kmstest_pipe_name(pipe))
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
