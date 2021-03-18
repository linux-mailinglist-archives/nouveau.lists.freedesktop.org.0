Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D31A340008
	for <lists+nouveau@lfdr.de>; Thu, 18 Mar 2021 08:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BDA6E892;
	Thu, 18 Mar 2021 07:08:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2617A6E558
 for <nouveau@lists.freedesktop.org>; Thu, 18 Mar 2021 06:49:28 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <martin.peres@mupuf.org>)
 id 1lMmLs-0001HO-A2; Thu, 18 Mar 2021 07:41:48 +0100
Received: by submission02.runbox with esmtpsa [Authenticated alias (981869)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lMmLk-0007Hl-VU; Thu, 18 Mar 2021 07:41:41 +0100
To: Lyude <lyude@redhat.com>, igt-dev@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20210317224407.447572-1-lyude@redhat.com>
From: Martin Peres <martin.peres@mupuf.org>
Message-ID: <f5554f76-fc26-e307-0fe0-e59d3bca15ba@mupuf.org>
Date: Thu, 18 Mar 2021 08:41:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317224407.447572-1-lyude@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Mar 2021 07:08:45 +0000
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] tests/kms_plane: Don't unset
 primary_fb when testing other planes
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

On 18/03/2021 00:44, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Currently, nouveau doesn't support having a CRTC without a primary FB set. We
> won't reject such configurations, but the behavior is undefined which will cause
> CRCs to become undefined. So, avoid clearing the primary FB while we're testing
> non-primary planes.

Looks good to me:

Reviewed-by: Martin Peres <martin.peres@mupuf.org>

> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>   tests/kms_plane.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 298a9375..c87983a4 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -817,9 +817,10 @@ enum crc_set { PACKED_CRC_SET,
>   	       MAX_CRC_SET };
>   
>   static bool test_format_plane(data_t *data, enum pipe pipe,
> -			      igt_output_t *output, igt_plane_t *plane)
> +			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
>   {
>   	struct igt_fb fb = {};
> +	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
>   	drmModeModeInfo *mode;
>   	uint32_t format, ref_format;
>   	uint64_t modifier, ref_modifier;
> @@ -879,7 +880,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   			height = test_fb.height;
>   		}
>   
> -		igt_plane_set_fb(plane, NULL);
> +		igt_plane_set_fb(plane, clear_fb);
>   
>   		igt_remove_fb(data->drm_fd, &test_fb);
>   	}
> @@ -937,7 +938,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   
>   	igt_pipe_crc_stop(data->pipe_crc);
>   
> -	igt_plane_set_fb(plane, NULL);
> +	igt_plane_set_fb(plane, clear_fb);
>   	igt_remove_fb(data->drm_fd, &fb);
>   
>   	return result;
> @@ -1010,7 +1011,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
>   	for_each_plane_on_pipe(&data->display, pipe, plane) {
>   		if (skip_plane(data, plane))
>   			continue;
> -		result &= test_format_plane(data, pipe, output, plane);
> +		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
>   	}
>   
>   	test_fini(data);
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
