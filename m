Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3139B341652
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 08:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092EF6E992;
	Fri, 19 Mar 2021 07:20:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACE96E992;
 Fri, 19 Mar 2021 07:20:35 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.peres@mupuf.org>)
 id 1lN9Qu-0008R8-8M; Fri, 19 Mar 2021 08:20:32 +0100
Received: by submission02.runbox with esmtpsa [Authenticated alias (981869)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lN9Qs-0000Yt-JJ; Fri, 19 Mar 2021 08:20:30 +0100
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20210318222124.970997-1-lyude@redhat.com>
 <20210318222124.970997-2-lyude@redhat.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <72c0f4e1-c785-d52f-a3c2-fe9bbc20b217@mupuf.org>
Date: Fri, 19 Mar 2021 09:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210318222124.970997-2-lyude@redhat.com>
Content-Language: en-US
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_cursor_crc:
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 19/03/2021 00:21, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Currently we just assume that every cursor size up to data->cursor_max_w/h will
> be supported by the driver, and check for support of nonsquare cursors by
> checking if we're running on u815 and if so, which variant of intel hardware
> we're running on. This isn't really ideal as we're about to enable 32x32 cursor
> size tests for nouveau, and Intel hardware doesn't support cursor sizes that
> small.
> 
> So, fix this by removing has_nonsquare_cursors() and replacing it with a more
> generic require_cursor_size() function which checks whether or not the driver
> we're using supports a given cursor size by attempting a test-only atomic
> commit.

Looks clean to me, and results in no new failures in Intel's results 
(https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shards-all.html?testfilter=kms_cursor_crc), 
and no changes in the results for any other test.

Not sure I can comment on the implementation details of 
require_cursor_size(), but everything else, and the series is:

Reviewed-by: Martin Peres <martin.peres@mupuf.org>

> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>   tests/kms_cursor_crc.c | 131 ++++++++++++++++++++++++-----------------
>   1 file changed, 76 insertions(+), 55 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 3541ea06..b9c05472 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -523,26 +523,43 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
>   	igt_put_cairo_ctx(cr);
>   }
>   
> -static bool has_nonsquare_cursors(data_t *data)
> +static void require_cursor_size(data_t *data, int w, int h)
>   {
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
>   
> -	/*
> -	 * Test non-square cursors a bit on the platforms
> -	 * that support such things.
> -	 */
> -	if (devid == PCI_CHIP_845_G || devid == PCI_CHIP_I865_G)
> -		return true;
> +	/* Create temporary primary fb for testing */
> +	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				 LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb));
>   
> -	if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))
> -		return false;
> +	igt_plane_set_fb(primary, &primary_fb);
> +	igt_plane_set_fb(cursor, &data->fb);
> +	igt_plane_set_size(cursor, w, h);
> +	igt_fb_set_size(&data->fb, cursor, w, h);
> +
> +	/* Test if the kernel supports the given cursor size or not */
> +	ret = igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &primary_fb);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   
> -	return intel_gen(devid) >= 7;
> +	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
>   }
>   
>   static void test_cursor_size(data_t *data)
> @@ -697,27 +714,33 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
>   			create_cursor_fb(data, w, h);
>   		}
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
>   		}
>   
>   		igt_fixture
> @@ -730,27 +753,25 @@ static void run_tests_on_pipe(data_t *data, enum pipe pipe)
>   		 */
>   		h /= 3;
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
>   		}
>   
>   		igt_fixture
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
