Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A96A34060C
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 13:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C216E8F2;
	Thu, 18 Mar 2021 12:49:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE446E8EF;
 Thu, 18 Mar 2021 12:49:36 +0000 (UTC)
IronPort-SDR: 0Lhp0lyDhZzxN5dtfoeSaqoKIWAQ6EYo5phYbKe/1sbWz9WIkIuXY0ZrA5kUYA1BdcKM1N0DEM
 ylVMY8ZJBQHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="251024704"
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="251024704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 05:49:35 -0700
IronPort-SDR: gAbkG7WDcEWtwTTcHn6tSggRajUMo5FTvSoiNgP8omTYImJfU/kdPimuG+HeJI97xQDQ8Rukze
 xFmA6Q1smZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,258,1610438400"; d="scan'208";a="512106143"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 18 Mar 2021 05:49:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 18 Mar 2021 14:49:29 +0200
Date: Thu, 18 Mar 2021 14:49:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude <lyude@redhat.com>
Message-ID: <YFNMWZwBNHDn3YeH@intel.com>
References: <20210317224949.448284-1-lyude@redhat.com>
 <20210317224949.448284-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317224949.448284-5-lyude@redhat.com>
X-Patchwork-Hint: comment
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t 4/7] lib/igt_fb: Remove domain
 from igt_fb
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
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 06:49:46PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> =

> It doesn't look like that this is used by i915 for anything these days, so
> let's just remove this while we're at it.

I wa scurious why this is here so dug around a bit.

It was added in
commit 18d0b1efb875 ("lib/igt_fb: Fix domain tracking for GTT cairo surface=
s")

then got broken again by
commit 89b3ffe02c2a ("lib: Map dumb buffers")

and later fixed again with
commit 3bd68529c464 ("lib/igt_fb: Add missing set_domain calls")

So yeah, not needed anymore.
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>  lib/igt_fb.c | 3 ---
>  lib/igt_fb.h | 2 --
>  2 files changed, 5 deletions(-)
> =

> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index f0fcd1a7..2b478887 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2491,7 +2491,6 @@ static void create_cairo_surface__gpu(int fd, struc=
t igt_fb *fb)
>  						    cairo_format,
>  						    fb->width, fb->height,
>  						    blit->linear.fb.strides[0]);
> -	fb->domain =3D I915_GEM_DOMAIN_GTT;
>  =

>  	cairo_surface_set_user_data(fb->cairo_surface,
>  				    (cairo_user_data_key_t *)create_cairo_surface__gpu,
> @@ -2571,8 +2570,6 @@ static void create_cairo_surface__gtt(int fd, struc=
t igt_fb *fb)
>  		      "Unable to create a cairo surface: %s\n",
>  		      cairo_status_to_string(cairo_surface_status(fb->cairo_surface)));
>  =

> -	fb->domain =3D I915_GEM_DOMAIN_GTT;
> -
>  	cairo_surface_set_user_data(fb->cairo_surface,
>  				    (cairo_user_data_key_t *)create_cairo_surface__gtt,
>  				    fb, destroy_cairo_surface__gtt);
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 0d64898a..e4f8b2b1 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -64,7 +64,6 @@ struct buf_ops;
>   * @modifier: tiling mode as a DRM framebuffer modifier
>   * @size: size in bytes of the underlying backing storage
>   * @cairo_surface: optionally attached cairo drawing surface
> - * @domain: current domain for cache flushing tracking on i915.ko
>   * @num_planes: Amount of planes on this fb. >1 for planar formats.
>   * @strides: line stride for each plane in bytes
>   * @offsets: Offset for each plane in bytes.
> @@ -87,7 +86,6 @@ typedef struct igt_fb {
>  	uint64_t modifier;
>  	uint64_t size;
>  	cairo_surface_t *cairo_surface;
> -	unsigned int domain;
>  	unsigned int num_planes;
>  	uint32_t strides[4];
>  	uint32_t offsets[4];
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
