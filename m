Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B9320C71
	for <lists+nouveau@lfdr.de>; Sun, 21 Feb 2021 19:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1176E420;
	Sun, 21 Feb 2021 18:12:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F686E1A5;
 Sun, 21 Feb 2021 18:12:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30AE7EF;
 Sun, 21 Feb 2021 19:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1613931138;
 bh=xdfpZVs5pD00qCgiYjQiBk3+yzMOzjLRl/tciOa0xRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTBeVr1+HpMUqB10851acTLvDXgWnvg35PoUyXXimlsR+ONaWYnKSLLayt0vIArsm
 OMbmMeU70R2HpI1VzO23H0aXXbXOi8/nhoFQVfHnVtISrITADRv5Qq7LiHqpQhNVp0
 KzbpxsFJiiX05pQYTfrYgWyO186dgpxVREIUYacc=
Date: Sun, 21 Feb 2021 20:11:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <YDKiZ0LYPWq0dsFt@pendragon.ideasonboard.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-7-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219215326.2227596-7-lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH 06/30] drm/bridge/ti-sn65dsi86: (Un)register
 aux device on bridge attach/detach
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Andrzej Hajda <a.hajda@samsung.com>,
 amd-gfx@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Lyude,

Thank you for the patch.

On Fri, Feb 19, 2021 at 04:53:02PM -0500, Lyude Paul wrote:
> Since we're about to add a back-pointer to drm_dev in drm_dp_aux, let's
> move the AUX adapter registration to the first point where we know which
> DRM device we'll be working with - when the drm_bridge is attached.
> Likewise, we unregister the AUX adapter on bridge detachment by adding a
> ti_sn_bridge_detach() callback.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f27306c51e4d..88df4dd0f39d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -362,12 +362,18 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> +	ret = drm_dp_aux_register(&pdata->aux);
> +	if (ret < 0) {
> +		drm_err(bridge->dev, "Failed to register DP AUX channel: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = drm_connector_init(bridge->dev, &pdata->connector,
>  				 &ti_sn_bridge_connector_funcs,
>  				 DRM_MODE_CONNECTOR_eDP);
>  	if (ret) {
>  		DRM_ERROR("Failed to initialize connector with drm\n");
> -		return ret;
> +		goto err_conn_init;
>  	}
>  
>  	drm_connector_helper_add(&pdata->connector,
> @@ -424,9 +430,16 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
>  	drm_connector_cleanup(&pdata->connector);
> +err_conn_init:
> +	drm_dp_aux_unregister(&pdata->aux);
>  	return ret;
>  }
>  
> +static void ti_sn_bridge_detach(struct drm_bridge *bridge)
> +{
> +	drm_dp_aux_unregister(&bridge_to_ti_sn_bridge(bridge)->aux);
> +}
> +
>  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> @@ -863,6 +876,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
> +	.detach = ti_sn_bridge_detach,
>  	.pre_enable = ti_sn_bridge_pre_enable,
>  	.enable = ti_sn_bridge_enable,
>  	.disable = ti_sn_bridge_disable,
> @@ -1287,7 +1301,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  	pdata->aux.name = "ti-sn65dsi86-aux";
>  	pdata->aux.dev = pdata->dev;
>  	pdata->aux.transfer = ti_sn_aux_transfer;
> -	drm_dp_aux_register(&pdata->aux);
> +	drm_dp_aux_init(&pdata->aux);
>  
>  	pdata->bridge.funcs = &ti_sn_bridge_funcs;
>  	pdata->bridge.of_node = client->dev.of_node;

-- 
Regards,

Laurent Pinchart
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
