Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E791B24A2D0
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 17:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6A26E466;
	Wed, 19 Aug 2020 15:25:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901BF6E466
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 15:25:12 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id n129so21924545qkd.6
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+A2+59kSj+DX9Rd94ppIvrv6gKF33YuW5sgvbibtK8o=;
 b=DAz3p7rvAKv+rEtw7ziZcs1CbUb15JgAvkng7iuNUguAUs+2SlaMd1Eb9JS8/ypdDD
 jDq2qHwEv21m/4lKf6lpxwg8OUDx0d6vPuNejy3Hg/NxuVdPNZQ6h1dJ/F4punH3baHX
 4265Q3qIPsoGRMb+GmG9MsDVnLVSefoRlVK4Apb7d9w2YuWmNrVfaoZ+0MgBwCxPlkvx
 vLG3CsDvm+r5hLjzbxqgKVhlnvUZ4oyUdEkLW/vPLS4DxeKe0b/gNdQapuu0beaVfee4
 pfsJFk2ssLc7x5Akesh4zeZ2J75YtdylBt8SDN/P7IVAUJw6NCtqYmBPnl9TcPKpRAEk
 cwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+A2+59kSj+DX9Rd94ppIvrv6gKF33YuW5sgvbibtK8o=;
 b=q9tZaUSZlXnwYDnNm770AM4Oh4yD+n+28AqHdWckoLjUfS6qKhEoUl6YWUdBcxRsJY
 XIEbVSbEcR4x8x4ikJemvsku5Bdsg6m8Ry+hwh0+GYD8n4TnqxrWO5kIbMZ/nvoUMVIe
 7DYvzkcbTdHM6SGj4XfcUIVMpExmvd8/rT0qTo4bkEvCd2ohZZi1QYToJLKiKSDrddiR
 Ix5M3sfESWyGJMDzltSEIKKt6Vku9POa/EZq/J+TFMVR+GYjHeql5zaqa8V/GgexZzSE
 4WJf9koNesjjt08JYflFSFLRh6sgxAXO1y7MoSnRry4X2xdyKUWPSZAHUQd0JfVuTL02
 cjKw==
X-Gm-Message-State: AOAM531iS1BG5mw8PDPYqMuD97z07iOFu8cX7vA1cK3XRHs3gx99x2w2
 xIrgLjv3u8CjTHL2qYeIOHtsSA==
X-Google-Smtp-Source: ABdhPJwaOxJ5IQr4GSKj/8qzLxI7nwuxjhN1J7QQtHVAV0pVgF8h9m9O+HTZ4RHcMiTLdumoYIDa0Q==
X-Received: by 2002:a37:44b:: with SMTP id 72mr22031222qke.494.1597850711106; 
 Wed, 19 Aug 2020 08:25:11 -0700 (PDT)
Received: from localhost (mobile-166-177-185-175.mycingular.net.
 [166.177.185.175])
 by smtp.gmail.com with ESMTPSA id k134sm24399096qke.60.2020.08.19.08.25.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Aug 2020 08:25:10 -0700 (PDT)
Date: Wed, 19 Aug 2020 11:25:09 -0400
From: Sean Paul <sean@poorly.run>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20200819152509.GD46474@art_vandelay>
References: <20200811200457.134743-1-lyude@redhat.com>
 <20200811200457.134743-17-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811200457.134743-17-lyude@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [RFC 16/20] drm/i915/dp: Extract
 drm_dp_get_sink_count()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 04:04:53PM -0400, Lyude Paul wrote:
> And of course, we'll also need to read the sink count from other drivers
> as well if we're checking whether or not it's supported. So, let's
> extract the code for this into another helper.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_dp_helper.c         | 20 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c | 17 +++++------------
>  include/drm/drm_dp_helper.h             |  1 +
>  3 files changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 05bb47e589731..0ff2959c8f8e8 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -722,6 +722,26 @@ bool drm_dp_has_sink_count(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_dp_has_sink_count);
>  
> +/**
> + * drm_dp_get_sink_count() - Retrieve the sink count for a given sink
> + * @aux: The DP AUX channel to use
> + *
> + * Returns: The current sink count reported by @aux, or a negative error code
> + * otherwise.
> + */
> +int drm_dp_get_sink_count(struct drm_dp_aux *aux)
> +{
> +	u8 count;
> +	int ret;
> +
> +	ret = drm_dp_dpcd_readb(aux, DP_SINK_COUNT, &count);
> +	if (ret < 1)
> +		return -EIO;

This should probably be:
        if (ret < 0)
                return ret;
        else if (ret != 1)
                return -EIO;


> +
> +	return DP_GET_SINK_COUNT(count);
> +}
> +EXPORT_SYMBOL(drm_dp_get_sink_count);
> +
>  /*
>   * I2C-over-AUX implementation
>   */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 35a4779a442e2..e343965a483df 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4648,6 +4648,8 @@ intel_dp_has_sink_count(struct intel_dp *intel_dp)
>  static bool
>  intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  {
> +	int ret;
> +
>  	if (!intel_dp_read_dpcd(intel_dp))
>  		return false;
>  
> @@ -4664,20 +4666,10 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  	}
>  
>  	if (intel_dp_has_sink_count(intel_dp)) {
> -		u8 count;
> -		ssize_t r;
> -
> -		r = drm_dp_dpcd_readb(&intel_dp->aux, DP_SINK_COUNT, &count);
> -		if (r < 1)
> +		ret = drm_dp_get_sink_count(&intel_dp->aux);
> +		if (ret < 0)
>  			return false;
>  
> -		/*
> -		 * Sink count can change between short pulse hpd hence
> -		 * a member variable in intel_dp will track any changes
> -		 * between short pulse interrupts.
> -		 */

I think you could probably keep this comment and relocate the intel_dp->sink_count
assignment back.

With these nits (or something like them),

Reviewed-by: Sean Paul <sean@poorly.run>

> -		intel_dp->sink_count = DP_GET_SINK_COUNT(count);
> -
>  		/*
>  		 * SINK_COUNT == 0 and DOWNSTREAM_PORT_PRESENT == 1 implies that
>  		 * a dongle is present but no display. Unless we require to know
> @@ -4685,6 +4677,7 @@ intel_dp_get_dpcd(struct intel_dp *intel_dp)
>  		 * downstream port information. So, an early return here saves
>  		 * time from performing other operations which are not required.
>  		 */
> +		intel_dp->sink_count = ret;
>  		if (!intel_dp->sink_count)
>  			return false;
>  	}
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index a1413a531eaf4..0c141fc81aaa8 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1635,6 +1635,7 @@ struct drm_dp_desc;
>  bool drm_dp_has_sink_count(struct drm_connector *connector,
>  			   const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			   const struct drm_dp_desc *desc);
> +int drm_dp_get_sink_count(struct drm_dp_aux *aux);
>  
>  void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
>  void drm_dp_aux_init(struct drm_dp_aux *aux);
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
