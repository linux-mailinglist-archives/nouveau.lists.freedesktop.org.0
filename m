Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A23423E4
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 19:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B1A6EA6B;
	Fri, 19 Mar 2021 18:00:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190566EA68;
 Fri, 19 Mar 2021 18:00:42 +0000 (UTC)
IronPort-SDR: 1PpAbHOMZlUh11kZwYKyyx/z9CbkNEriC9g+6s9RbSEhuBpl59mFjUQvNG1qXH/ltbu83z8dp0
 Ic75mx53P9AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="251292172"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="251292172"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 11:00:40 -0700
IronPort-SDR: rngppLfcbBVc2UGj25J9DqkLHw+DnLHz+zM+e1RrgQPNzvneJ2oyqeNKrpleoC3dsApKgMRuQa
 JlKeQM70EfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="380248691"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 19 Mar 2021 11:00:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 19 Mar 2021 20:00:37 +0200
Date: Fri, 19 Mar 2021 20:00:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <YFTmxXGL4qF9Z41X@intel.com>
References: <20210318222124.970997-1-lyude@redhat.com>
 <20210318222124.970997-2-lyude@redhat.com>
 <YFS8vuuArWJtH9Mb@intel.com>
 <19ee182cd7965f3a250062dac927eccc7ae31a91.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19ee182cd7965f3a250062dac927eccc7ae31a91.camel@redhat.com>
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

On Fri, Mar 19, 2021 at 01:40:52PM -0400, Lyude Paul wrote:
> On Fri, 2021-03-19 at 17:01 +0200, Ville Syrj=E4l=E4 wrote:
> > On Thu, Mar 18, 2021 at 06:21:23PM -0400, Lyude wrote:
> > > From: Lyude Paul <lyude@redhat.com>
> > > =

> > > Currently we just assume that every cursor size up to data->cursor_ma=
x_w/h
> > > will
> > > be supported by the driver, and check for support of nonsquare cursor=
s by
> > > checking if we're running on u815 and if so, which variant of intel h=
ardware
> > > we're running on. This isn't really ideal as we're about to enable 32=
x32
> > > cursor
> > > size tests for nouveau, and Intel hardware doesn't support cursor siz=
es that
> > > small.
> > > =

> > > So, fix this by removing has_nonsquare_cursors() and replacing it wit=
h a
> > > more
> > > generic require_cursor_size() function which checks whether or not the
> > > driver
> > > we're using supports a given cursor size by attempting a test-only at=
omic
> > > commit.
> > > =

> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Cc: Martin Peres <martin.peres@free.fr>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Jeremy Cline <jcline@redhat.com>
> > > ---
> > > =A0tests/kms_cursor_crc.c | 131 ++++++++++++++++++++++++-------------=
----
> > > =A01 file changed, 76 insertions(+), 55 deletions(-)
> > > =

> > > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > > index 3541ea06..b9c05472 100644
> > > --- a/tests/kms_cursor_crc.c
> > > +++ b/tests/kms_cursor_crc.c
> > > @@ -523,26 +523,43 @@ static void create_cursor_fb(data_t *data, int =
cur_w,
> > > int cur_h)
> > > =A0=A0=A0=A0=A0=A0=A0=A0igt_put_cairo_ctx(cr);
> > > =A0}
> > > =A0
> > > -static bool has_nonsquare_cursors(data_t *data)
> > > +static void require_cursor_size(data_t *data, int w, int h)
> > > =A0{
> > > -=A0=A0=A0=A0=A0=A0=A0uint32_t devid;
> > > +=A0=A0=A0=A0=A0=A0=A0igt_fb_t primary_fb;
> > > +=A0=A0=A0=A0=A0=A0=A0drmModeModeInfo *mode;
> > > +=A0=A0=A0=A0=A0=A0=A0igt_display_t *display =3D &data->display;
> > > +=A0=A0=A0=A0=A0=A0=A0igt_output_t *output =3D data->output;
> > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_t *primary, *cursor;
> > > +=A0=A0=A0=A0=A0=A0=A0int ret;
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0if (!is_i915_device(data->drm_fd))
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > +=A0=A0=A0=A0=A0=A0=A0igt_output_set_pipe(output, data->pipe);
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0devid =3D intel_get_drm_devid(data->drm_fd);
> > > +=A0=A0=A0=A0=A0=A0=A0mode =3D igt_output_get_mode(output);
> > > +=A0=A0=A0=A0=A0=A0=A0primary =3D igt_output_get_plane_type(output, D=
RM_PLANE_TYPE_PRIMARY);
> > > +=A0=A0=A0=A0=A0=A0=A0cursor =3D igt_output_get_plane_type(output, DR=
M_PLANE_TYPE_CURSOR);
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0/*
> > > -=A0=A0=A0=A0=A0=A0=A0 * Test non-square cursors a bit on the platfor=
ms
> > > -=A0=A0=A0=A0=A0=A0=A0 * that support such things.
> > > -=A0=A0=A0=A0=A0=A0=A0 */
> > > -=A0=A0=A0=A0=A0=A0=A0if (devid =3D=3D PCI_CHIP_845_G || devid =3D=3D=
 PCI_CHIP_I865_G)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return true;
> > > +=A0=A0=A0=A0=A0=A0=A0/* Create temporary primary fb for testing */
> > > +=A0=A0=A0=A0=A0=A0=A0igt_assert(igt_create_fb(data->drm_fd, mode->hd=
isplay, mode-
> > > >vdisplay, DRM_FORMAT_XRGB8888,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb));
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid=
))
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return false;
> > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(primary, &primary_fb);
> > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(cursor, &data->fb);
> > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_size(cursor, w, h);
> > > +=A0=A0=A0=A0=A0=A0=A0igt_fb_set_size(&data->fb, cursor, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0/* Test if the kernel supports the given cursor=
 size or not */
> > > +=A0=A0=A0=A0=A0=A0=A0ret =3D igt_display_try_commit_atomic(display,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_MODE_ATOMI=
C_TEST_ONLY |
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DRM_MODE_ATOMI=
C_ALLOW_MODESET,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL);
> > =

> > Would be better to not depend on atomic. We have platforms
> > that don't expose it yet.
> =

> Do you have any other ideas how we could probe for this then? it seems li=
ke the
> only alternative would be to add intel-specific checks to fix that, or ad=
d some
> ioctl for querying the minimum cursor size (which sounds preferable imo).=
 would
> the latter work for you, or do you have another idea?

Just do it for real instead of TEST_ONLY.

> > =

> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(primary, NULL);
> > > +=A0=A0=A0=A0=A0=A0=A0igt_plane_set_fb(cursor, NULL);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0igt_remove_fb(data->drm_fd, &primary_fb);
> > > +=A0=A0=A0=A0=A0=A0=A0igt_output_set_pipe(output, PIPE_NONE);
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0return intel_gen(devid) >=3D 7;
> > > +=A0=A0=A0=A0=A0=A0=A0igt_skip_on_f(ret, "Cursor size %dx%d not suppo=
rted by driver\n", w,
> > > h);
> > > =A0}
> > > =A0
> > > =A0static void test_cursor_size(data_t *data)
> > > @@ -697,27 +714,33 @@ static void run_tests_on_pipe(data_t *data, enu=
m pipe
> > > pipe)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0create_cursor_fb(data, w, h);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Using created cursor=
 FBs to test cursor support */
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_describe("Check if =
a given-size cursor is well-
> > > positioned inside the screen.");
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-onscreen",
> > > kmstest_pipe_name(pipe), w, h)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_onscreen, w, h);
> > > -
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_describe("Check if =
a given-size cursor is well-
> > > positioned outside the screen.");
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-offscreen",
> > > kmstest_pipe_name(pipe), w, h)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_offscreen, w, h);
> > > -
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_describe("Check the=
 smooth and pixel-by-pixel given-size
> > > cursor movements on"
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 "horizontal, vertical and diagonal.");
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-sliding",
> > > kmstest_pipe_name(pipe), w, h)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_sliding, w, h);
> > > -
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_describe("Check ran=
dom placement of a cursor with given
> > > size.");
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-random",
> > > kmstest_pipe_name(pipe), w, h)
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_random, w, h);
> > > -
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_describe("Check the=
 rapid update of given-size cursor
> > > movements.");
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-rapid-movement",
> > > kmstest_pipe_name(pipe), w, h) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_rapid_movement, w, h);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_group {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_fixture
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0require_cursor_size(data, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0/* Using created cursor FBs to test cursor support
> > > */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_describe("Check if a given-size cursor is well-
> > > positioned inside the "
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "screen.");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_onscreen, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_describe("Check if a given-size cursor is well-
> > > positioned outside the "
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "screen.");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_offscreen, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_describe("Check the smooth and pixel-by-pixel
> > > given-size cursor "
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "movements on horizontal, vertical =
and
> > > diagonal.");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-sliding",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_sliding, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_describe("Check random placement of a cursor
> > > with given size.");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-random",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_random, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_describe("Check the rapid update of given-size
> > > cursor movements.");
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_rapid_movement, w, h);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_fixture
> > > @@ -730,27 +753,25 @@ static void run_tests_on_pipe(data_t *data, enu=
m pipe
> > > pipe)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0h /=3D 3;
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_fixture {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0if (has_nonsquare_cursors(data))
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0create_cursor_fb(data, w, h);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_fixture
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0create_cursor_fb(data, w, h);
> > > =A0
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* Using created cursor=
 FBs to test cursor support */
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-onscreen",
> > > kmstest_pipe_name(pipe), w, h) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_require(has_nonsquare_cursors(data));
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_onscreen, w, h);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-offscreen",
> > > kmstest_pipe_name(pipe), w, h) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_require(has_nonsquare_cursors(data));
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_offscreen, w, h);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-sliding",
> > > kmstest_pipe_name(pipe), w, h) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_require(has_nonsquare_cursors(data));
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_sliding, w, h);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_f("pipe-%s-=
cursor-%dx%d-random",
> > > kmstest_pipe_name(pipe), w, h) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_require(has_nonsquare_cursors(data));
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0run_test(data, test_crc_random, w, h);
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_subtest_group {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_fixture
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0require_cursor_size(data, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0/* Using created cursor FBs to test cursor support
> > > */
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_onscreen, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_offscreen, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-sliding",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_sliding, w, h);
> > > +
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0igt_subtest_f("pipe-%s-cursor-%dx%d-random",
> > > kmstest_pipe_name(pipe), w, h)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0run_test(data, test_crc_random, w, h);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > =A0
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0igt_fixture
> > > -- =

> > > 2.29.2
> > > =

> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > =

> =

> -- =

> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>    =

> Note: I deal with a lot of emails and have a lot of bugs on my plate. If =
you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email t=
o check
> on my status. I don't bite!

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
