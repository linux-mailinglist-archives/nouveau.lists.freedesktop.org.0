Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7D342068
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 16:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E416EA2C;
	Fri, 19 Mar 2021 15:01:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12F06EA2C;
 Fri, 19 Mar 2021 15:01:22 +0000 (UTC)
IronPort-SDR: Q7SDK/dcg0F+aFVCgUP+42shmMxvYt7U+kC4rxKi8vnNpJKqq07kPaZrwdWU92FIzUZ1XscF2r
 WsM/2l7xhNyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="187560039"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="187560039"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 08:01:22 -0700
IronPort-SDR: vLvt+gXSOG/fmDZcIz3ipg2KZ6W7fhe/33cnBFQfWt0kbVFRwhLPg3mJQz2ATl6fD+8BUZOBXK
 P1NjyCUAeonQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="374973772"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 19 Mar 2021 08:01:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Mar 2021 17:01:18 +0200
Date: Fri, 19 Mar 2021 17:01:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <YFS8vuuArWJtH9Mb@intel.com>
References: <20210318222124.970997-1-lyude@redhat.com>
 <20210318222124.970997-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318222124.970997-2-lyude@redhat.com>
X-Patchwork-Hint: comment
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 06:21:23PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> =

> Currently we just assume that every cursor size up to data->cursor_max_w/=
h will
> be supported by the driver, and check for support of nonsquare cursors by
> checking if we're running on u815 and if so, which variant of intel hardw=
are
> we're running on. This isn't really ideal as we're about to enable 32x32 =
cursor
> size tests for nouveau, and Intel hardware doesn't support cursor sizes t=
hat
> small.
> =

> So, fix this by removing has_nonsquare_cursors() and replacing it with a =
more
> generic require_cursor_size() function which checks whether or not the dr=
iver
> we're using supports a given cursor size by attempting a test-only atomic
> commit.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>  tests/kms_cursor_crc.c | 131 ++++++++++++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 55 deletions(-)
> =

> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 3541ea06..b9c05472 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -523,26 +523,43 @@ static void create_cursor_fb(data_t *data, int cur_=
w, int cur_h)
>  	igt_put_cairo_ctx(cr);
>  }
>  =

> -static bool has_nonsquare_cursors(data_t *data)
> +static void require_cursor_size(data_t *data, int w, int h)
>  {
> -	uint32_t devid;
> +	igt_fb_t primary_fb;
> +	drmModeModeInfo *mode;
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output =3D data->output;
> +	igt_plane_t *primary, *cursor;
> +	int ret;
>  =

> -	if (!is_i915_device(data->drm_fd))
> -		return false;
> +	igt_output_set_pipe(output, data->pipe);
>  =

> -	devid =3D intel_get_drm_devid(data->drm_fd);
> +	mode =3D igt_output_get_mode(output);
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	cursor =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
>  =

> -	/*
> -	 * Test non-square cursors a bit on the platforms
> -	 * that support such things.
> -	 */
> -	if (devid =3D=3D PCI_CHIP_845_G || devid =3D=3D PCI_CHIP_I865_G)
> -		return true;
> +	/* Create temporary primary fb for testing */
> +	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, =
DRM_FORMAT_XRGB8888,
> +				 LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb));
>  =

> -	if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))
> -		return false;
> +	igt_plane_set_fb(primary, &primary_fb);
> +	igt_plane_set_fb(cursor, &data->fb);
> +	igt_plane_set_size(cursor, w, h);
> +	igt_fb_set_size(&data->fb, cursor, w, h);
> +
> +	/* Test if the kernel supports the given cursor size or not */
> +	ret =3D igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);

Would be better to not depend on atomic. We have platforms
that don't expose it yet.

> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &primary_fb);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  =

> -	return intel_gen(devid) >=3D 7;
> +	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
>  }
>  =

>  static void test_cursor_size(data_t *data)
> @@ -697,27 +714,33 @@ static void run_tests_on_pipe(data_t *data, enum pi=
pe pipe)
>  			create_cursor_fb(data, w, h);
>  		}
>  =

> -		/* Using created cursor FBs to test cursor support */
> -		igt_describe("Check if a given-size cursor is well-positioned inside t=
he screen.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe)=
, w, h)
> -			run_test(data, test_crc_onscreen, w, h);
> -
> -		igt_describe("Check if a given-size cursor is well-positioned outside =
the screen.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe=
), w, h)
> -			run_test(data, test_crc_offscreen, w, h);
> -
> -		igt_describe("Check the smooth and pixel-by-pixel given-size cursor mo=
vements on"
> -		             "horizontal, vertical and diagonal.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe),=
 w, h)
> -			run_test(data, test_crc_sliding, w, h);
> -
> -		igt_describe("Check random placement of a cursor with given size.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), =
w, h)
> -			run_test(data, test_crc_random, w, h);
> -
> -		igt_describe("Check the rapid update of given-size cursor movements.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name=
(pipe), w, h) {
> -			run_test(data, test_rapid_movement, w, h);
> +		igt_subtest_group {
> +			igt_fixture
> +				require_cursor_size(data, w, h);
> +
> +			/* Using created cursor FBs to test cursor support */
> +			igt_describe("Check if a given-size cursor is well-positioned inside =
the "
> +				     "screen.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe=
), w, h)
> +				run_test(data, test_crc_onscreen, w, h);
> +
> +			igt_describe("Check if a given-size cursor is well-positioned outside=
 the "
> +				     "screen.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pip=
e), w, h)
> +				run_test(data, test_crc_offscreen, w, h);
> +
> +			igt_describe("Check the smooth and pixel-by-pixel given-size cursor "
> +				     "movements on horizontal, vertical and diagonal.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe)=
, w, h)
> +				run_test(data, test_crc_sliding, w, h);
> +
> +			igt_describe("Check random placement of a cursor with given size.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe),=
 w, h)
> +				run_test(data, test_crc_random, w, h);
> +
> +			igt_describe("Check the rapid update of given-size cursor movements."=
);
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_nam=
e(pipe), w, h)
> +				run_test(data, test_rapid_movement, w, h);
>  		}
>  =

>  		igt_fixture
> @@ -730,27 +753,25 @@ static void run_tests_on_pipe(data_t *data, enum pi=
pe pipe)
>  		 */
>  		h /=3D 3;
>  =

> -		igt_fixture {
> -			if (has_nonsquare_cursors(data))
> -				create_cursor_fb(data, w, h);
> -		}
> +		igt_fixture
> +			create_cursor_fb(data, w, h);
>  =

> -		/* Using created cursor FBs to test cursor support */
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe)=
, w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_onscreen, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe=
), w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_offscreen, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe),=
 w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_sliding, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), =
w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_random, w, h);
> +		igt_subtest_group {
> +			igt_fixture
> +				require_cursor_size(data, w, h);
> +
> +			/* Using created cursor FBs to test cursor support */
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe=
), w, h)
> +				run_test(data, test_crc_onscreen, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pip=
e), w, h)
> +				run_test(data, test_crc_offscreen, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe)=
, w, h)
> +				run_test(data, test_crc_sliding, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe),=
 w, h)
> +				run_test(data, test_crc_random, w, h);
>  		}
>  =

>  		igt_fixture
> -- =

> 2.29.2
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
