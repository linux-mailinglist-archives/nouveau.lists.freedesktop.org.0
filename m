Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9872A34740E
	for <lists+nouveau@lfdr.de>; Wed, 24 Mar 2021 09:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342516E96F;
	Wed, 24 Mar 2021 08:59:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5CD6E96F;
 Wed, 24 Mar 2021 08:59:03 +0000 (UTC)
IronPort-SDR: ql0BM0ZT/yhW0NmYav7O+kp7m3VqYXHugRigyAln4GNj4FOrOnMFwlr95UfW+UsVwHq0Tn0gbK
 L3MijCU06SGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190072750"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190072750"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 01:59:03 -0700
IronPort-SDR: BbwIajTlC4Ld169DxejBl4Ge47RRgnLQc/5NqTu5kmzyzz7pDbxITsURfIjXQeGdM7W2ipg34B
 K0gHwRRbGS5g==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="374575826"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.68.154])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 01:59:01 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1lOzMe-0007hQ-FT; Wed, 24 Mar 2021 10:59:44 +0200
Date: Wed, 24 Mar 2021 10:59:44 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <YFr/gNrLan2uxp84@platvala-desk.ger.corp.intel.com>
References: <20210318222124.970997-2-lyude@redhat.com>
 <20210323172513.1519481-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323172513.1519481-1-lyude@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v3] tests/kms_cursor_crc:
 Probe kernel for cursor size support
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 01:25:13PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Currently we just assume that every cursor size up to data->cursor_max_w/h will
> be supported by the driver, and check for support of nonsquare cursors by
> checking if we're running on u815 and if so, which variant of intel hardware

The right side of your keyboard dodged your fingers when writing "i915" here.

-- 
Petri Latvala



> we're running on. This isn't really ideal as we're about to enable 32x32 cursor
> size tests for nouveau, and Intel hardware doesn't support cursor sizes that
> small.
> 
> So, fix this by removing has_nonsquare_cursors() and replacing it with a more
> generic require_cursor_size() function which checks whether or not the driver
> we're using supports a given cursor size by attempting a test-only atomic
> commit.
> 
> v3:
> * Also probe for cursor support on systems without atomic support
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>  tests/kms_cursor_crc.c | 133 ++++++++++++++++++++++++-----------------
>  1 file changed, 78 insertions(+), 55 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 3541ea06..529e2171 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -523,26 +523,45 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
>  	igt_put_cairo_ctx(cr);
>  }
>  
> -static bool has_nonsquare_cursors(data_t *data)
> +static void require_cursor_size(data_t *data, int w, int h)
>  {
> -	uint32_t devid;
> +	igt_fb_t primary_fb;
> +	drmModeModeInfo *mode;
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *primary, *cursor;
> +	int ret;
>  
> -	if (!is_i915_device(data->drm_fd))
> -		return false;
> +	igt_output_set_pipe(output, data->pipe);
>  
> -	devid = intel_get_drm_devid(data->drm_fd);
> +	mode = igt_output_get_mode(output);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	cursor = igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
> +
> +	/* Create temporary primary fb for testing */
> +	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				 LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb));
> +
> +	igt_plane_set_fb(primary, &primary_fb);
> +	igt_plane_set_fb(cursor, &data->fb);
> +	igt_plane_set_size(cursor, w, h);
> +	igt_fb_set_size(&data->fb, cursor, w, h);
> +
> +	/* Test if the kernel supports the given cursor size or not */
> +	if (display->is_atomic)
> +		ret = igt_display_try_commit_atomic(display,
> +						    DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	else
> +		ret = igt_display_try_commit2(display, COMMIT_LEGACY);
>  
> -	/*
> -	 * Test non-square cursors a bit on the platforms
> -	 * that support such things.
> -	 */
> -	if (devid == PCI_CHIP_845_G || devid == PCI_CHIP_I865_G)
> -		return true;
> +	igt_plane_set_fb(primary, NULL);
> +	igt_plane_set_fb(cursor, NULL);
>  
> -	if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))
> -		return false;
> +	igt_remove_fb(data->drm_fd, &primary_fb);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  
> -	return intel_gen(devid) >= 7;
> +	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
>  }
>  
>  static void test_cursor_size(data_t *data)
> @@ -697,27 +716,33 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
>  			create_cursor_fb(data, w, h);
>  		}
>  
> -		/* Using created cursor FBs to test cursor support */
> -		igt_describe("Check if a given-size cursor is well-positioned inside the screen.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
> -			run_test(data, test_crc_onscreen, w, h);
> -
> -		igt_describe("Check if a given-size cursor is well-positioned outside the screen.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
> -			run_test(data, test_crc_offscreen, w, h);
> -
> -		igt_describe("Check the smooth and pixel-by-pixel given-size cursor movements on"
> -		             "horizontal, vertical and diagonal.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
> -			run_test(data, test_crc_sliding, w, h);
> -
> -		igt_describe("Check random placement of a cursor with given size.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
> -			run_test(data, test_crc_random, w, h);
> -
> -		igt_describe("Check the rapid update of given-size cursor movements.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name(pipe), w, h) {
> -			run_test(data, test_rapid_movement, w, h);
> +		igt_subtest_group {
> +			igt_fixture
> +				require_cursor_size(data, w, h);
> +
> +			/* Using created cursor FBs to test cursor support */
> +			igt_describe("Check if a given-size cursor is well-positioned inside the "
> +				     "screen.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_onscreen, w, h);
> +
> +			igt_describe("Check if a given-size cursor is well-positioned outside the "
> +				     "screen.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_offscreen, w, h);
> +
> +			igt_describe("Check the smooth and pixel-by-pixel given-size cursor "
> +				     "movements on horizontal, vertical and diagonal.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_sliding, w, h);
> +
> +			igt_describe("Check random placement of a cursor with given size.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_random, w, h);
> +
> +			igt_describe("Check the rapid update of given-size cursor movements.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_rapid_movement, w, h);
>  		}
>  
>  		igt_fixture
> @@ -730,27 +755,25 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
>  		 */
>  		h /= 3;
>  
> -		igt_fixture {
> -			if (has_nonsquare_cursors(data))
> -				create_cursor_fb(data, w, h);
> -		}
> +		igt_fixture
> +			create_cursor_fb(data, w, h);
>  
> -		/* Using created cursor FBs to test cursor support */
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_onscreen, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_offscreen, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_sliding, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_random, w, h);
> +		igt_subtest_group {
> +			igt_fixture
> +				require_cursor_size(data, w, h);
> +
> +			/* Using created cursor FBs to test cursor support */
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_onscreen, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_offscreen, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_sliding, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), w, h)
> +				run_test(data, test_crc_random, w, h);
>  		}
>  
>  		igt_fixture
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
