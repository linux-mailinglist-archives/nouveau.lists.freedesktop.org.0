Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E5B3420B8
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 16:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA576EA4B;
	Fri, 19 Mar 2021 15:18:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D650D6EA2A
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 14:39:16 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id h25so3811301pgm.3
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xqUIitizMTnYW6S9ohgcqJQ/J1W0YdhVn6Dv9vqrskk=;
 b=SZEnYT7h6DCwyjpq+7bIJP9gm9gyX8+UPSBYtn1U4Ml2edHlstmfKmS7tzo1gVFGGy
 tVIK6T1X69l6L0KBTvH6T3V5b5QYtMRA6hH6ki9WecNYdezFAA/+l/jNwMgt2t8BAm1A
 pZKpWz++WWGHtOWWkc8XVl3IBMjaPYJWv0Yhsv7reWTonWSlm2/UdZDUfrckcQa/as6m
 qHE51eDJJ8+t2beaAm/D3r6+sexCG2oHXenD7PZaSgcpSC8f2FMAnOlMq1hSpJuRGyXy
 j90nuX8PJ8m/ToLUQ/FBWBrpuEQ2rQ+ACJDGKNtaP/hRO3U9rokQks1V74Uy0a8qSQzF
 YPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqUIitizMTnYW6S9ohgcqJQ/J1W0YdhVn6Dv9vqrskk=;
 b=hqmWsIM1G5F9IIVXUZtMUN8OR2O31o/HL9MGGLHboklrNYpt6HxqVt2hvjL/jCOg5z
 ncS2nQJ1NEHtKzW8iSmUcaqQUBYL5i2YpIo2tRLRHVNUIersqv8axYZHew2/ruwYU98d
 30TtTRe7kVdaEAlQXP8F+SWIKjAtMCizNFxZMqnIs8VQgjJFOsnVl+cBn4FGQQU+hvi0
 YQve0G8p43JPS9iIcHcp0Jvm2GLIoiet3bzuFCmAkyozd2iqk0Usp7r0wdhnIYYghkb2
 wFAjTHvvOqvCPFkayMtXpAzlKJqo5rlwiOVyzc3Us03vz1h8Pp4lgTE9r3Mlo1Ygwx9L
 LuGA==
X-Gm-Message-State: AOAM533IBVNMAi9dae8wCCF5LCIJvPgk70AlVX9eUIkWWMFYiaUWxRYm
 V+GSMbSzBPB5m4+WeNu3gn9k3vNm2gJBgn9GK3W5Ww==
X-Google-Smtp-Source: ABdhPJxyzaVRIHKqWtfgcw3n5NOIEIk5UCwoTeZ+Esn+3nxwGg5PiW1JJdRjbupSYVJzlFjyNK41/72RfVqZUtibaz8=
X-Received: by 2002:a62:80cf:0:b029:1f3:1959:2e42 with SMTP id
 j198-20020a6280cf0000b02901f319592e42mr9452067pfd.39.1616164756499; Fri, 19
 Mar 2021 07:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-11-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-11-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:39:05 +0100
Message-ID: <CAG3jFyvL99-b_F2e=A2SsfkiOV5Un3GZUeOfV_Uxb4YxiSf6UA@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Fri, 19 Mar 2021 15:18:19 +0000
Subject: Re: [Nouveau] [PATCH 10/30] drm/bridge/analogix/anx6345: Add
 missing drm_dp_aux_unregister() call
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Icenowy Zheng <icenowy@aosc.io>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 open list <linux-kernel@vger.kernel.org>, Torsten Duwe <duwe@lst.de>,
 Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:58, Lyude Paul <lyude@redhat.com> wrote:
>
> Another driver I found that seems to forget to unregister it's DP AUX
> device. Let's fix this by adding anx6345_bridge_detach().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index d9164fab044d..8e016ba7c54a 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -574,6 +574,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
>         return 0;
>  }
>
> +static void anx6345_bridge_detach(struct drm_bridge *bridge)
> +{
> +       drm_dp_aux_unregister(&bridge_to_anx6345(bridge)->aux);
> +}
> +
>  static enum drm_mode_status
>  anx6345_bridge_mode_valid(struct drm_bridge *bridge,
>                           const struct drm_display_info *info,
> @@ -624,6 +629,7 @@ static void anx6345_bridge_enable(struct drm_bridge *bridge)
>
>  static const struct drm_bridge_funcs anx6345_bridge_funcs = {
>         .attach = anx6345_bridge_attach,
> +       .detach = anx6345_bridge_detach,
>         .mode_valid = anx6345_bridge_mode_valid,
>         .disable = anx6345_bridge_disable,
>         .enable = anx6345_bridge_enable,
> --
> 2.29.2
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
