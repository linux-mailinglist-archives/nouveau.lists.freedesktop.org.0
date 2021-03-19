Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35F3420B2
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 16:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0537B6EA44;
	Fri, 19 Mar 2021 15:18:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E866EA35
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 14:45:57 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id l1so3062350plg.12
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TDOGGWm21psnrXGlHEe6HvlgMdBE2hycDbnwOwrR0qU=;
 b=UlA8BUn9E5sUqHuUQiDVI3TjSNEzIgglN6StA4KCyVdX76E7TgzijdMXlwYNtcOU0U
 oK0YUt9NaUKh9OYWeJPjOkj4C5gutCsoHgMAvOd4Co8G5QdGHna9dHm7ddeuPGYGq/UU
 Si3mf/vcqt4SyjTxw+ErupnhAHbv7gJlYCmf1cF8qg82nbjZAt3Z/IIoFUghJvvgtcHU
 +FleiDUKLNV1+6e/kdi2/1LZ5WlwKchV5dNwMhB4LJ5WQEEREoixVpYSoLkG/fUbcn/z
 iqEMWMaGTVyjVI457AtXUukS3iu0mLK0n5p3e4aIfbfoRaFuJj8XAwJkM4jRv0vRhq69
 yzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TDOGGWm21psnrXGlHEe6HvlgMdBE2hycDbnwOwrR0qU=;
 b=OGBoMHcqm7V5fEFmGUofS3rRj809aKFU+8Meyf3cNVyJaEyODfj8km/Y/ZIFDVH6FR
 PoH5DN8RLtx5wbzL2IAGxnsR5v/4RPzWfUA6qiXpCxFYRvFxjZcEdVtfGkQcfxIGgJ2r
 8YTGeatBXythaT70t6cy9tlIKf7uJBZSExtWUUkdn99CITTpkq4Xf3mZi/kcfdOOWpn4
 fcziT6jPljx6ZAi0Ur0sLu6eUlG/PSVn1E8ShKsLMkg5tArCZv1HZrKtd0Cwvf58Ylye
 0yFLlgXMdQP/2sCp2irlZul0pQDGaXCDSPwf1ELjoEITIjC2rsSex12Ys6yYfCy+9gzj
 jZZw==
X-Gm-Message-State: AOAM531MbDz+OtHdvkI8oFcCo+Hxo8TwWLO3U4mv8Eh/KE1ZjFQmfOK4
 pUPhuAXCY6+dYPRXjrHP0d1arkCDIHL+P3fuf9IcjQ==
X-Google-Smtp-Source: ABdhPJxweZfNiCPg9C7NrDu3mAB+yl61lfkYpCt6KNMgXUL5b8ziQQV9oK2kr7DsR12MgPe9uLa2ifDL7vrvhQ8WUh4=
X-Received: by 2002:a17:902:e752:b029:e6:822c:355c with SMTP id
 p18-20020a170902e752b02900e6822c355cmr14735796plf.69.1616165156604; Fri, 19
 Mar 2021 07:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-14-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-14-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:45:45 +0100
Message-ID: <CAG3jFyuJ=_Ab_LXNANs7VQAkgB16KC47zmibK1fXUKGvrGNUEw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Fri, 19 Mar 2021 15:18:19 +0000
Subject: Re: [Nouveau] [PATCH 13/30] drm/bridge/analogix/dp_core: Unregister
 DP AUX channel on error in analogix_dp_probe()
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Joe Perches <joe@perches.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Yan <andy.yan@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:58, Lyude Paul <lyude@redhat.com> wrote:
>
> Just another drive-by fix I noticed while going through the tree to cleanup
> DP aux adapter registration - make sure we unregister the DP AUX dev if
> analogix_dp_probe() fails.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index aa1bb86293fd..f115233b1cb9 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1782,6 +1782,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>
>  err_disable_pm_runtime:
>         pm_runtime_disable(dp->dev);
> +       drm_dp_aux_unregister(&dp->aux);
>
>         return ret;
>  }
> --
> 2.29.2
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
