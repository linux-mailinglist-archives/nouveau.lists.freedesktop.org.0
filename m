Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3243E5FF
	for <lists+nouveau@lfdr.de>; Thu, 28 Oct 2021 18:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89076E083;
	Thu, 28 Oct 2021 16:21:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77C46E0A8
 for <nouveau@lists.freedesktop.org>; Thu, 28 Oct 2021 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635438088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srx/wR4Z0jpwx5qACmRHg2e/sdqCTiZM1D5VqWblfyo=;
 b=dj2qn2E2unqrXygiITKL4j0SUB2sExa+jmcUSklF5Jm08NqW1QLmOIzJxtDI5GLnqS1O3V
 I/iS1NuHs7zne4qnWRc6/LPPctMXa6BSuV+MBgHjhh5XVedsLq9yOFhz9bEH/gFZA4W7p3
 Cf35STqxX5/ufojJhj+07A6P4cETfJ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Gh1ckHIVPy2hVWsg3fa5WA-1; Thu, 28 Oct 2021 12:21:27 -0400
X-MC-Unique: Gh1ckHIVPy2hVWsg3fa5WA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l21-20020a05600c4f1500b0032cd163619cso2121883wmq.7
 for <nouveau@lists.freedesktop.org>; Thu, 28 Oct 2021 09:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=srx/wR4Z0jpwx5qACmRHg2e/sdqCTiZM1D5VqWblfyo=;
 b=gwEEQhZKaCUyT/5alVJNizz65V2Hqj1Ep87/EigOgML2O2k2YEMuWbgtJZi2DAbcny
 pxiGUDHtrDe4s+tDPfSp6dGjZeQchfjwi2xYX3x+/hn9scWWCq6hId3BFlfcuF2bHXnX
 R1/CkVJp0PRaL4JeUOrsABKskQixolEjWeDf+sxFixJzbaOatTwFBcHwIJ+SZYaeJKAp
 NEGLzxI6qQ+tzI/VtBQX+usJZdM/2VpQPNAfGbroQ77bbFY6i7mc/DOT3rplGfFnPXn4
 LIUN4PGTDNNl7dFuqVkijqT3QRdUQRdc++J/4UdRK/MMfxfeayz95n4G16sNzkWlQXQZ
 o5Og==
X-Gm-Message-State: AOAM532y9XKiyxBTjnqAWcciW6zgU/s1jfcGME3AoHGFa9z3iGHnknAv
 tUrGCDUrTVmyKmJfLQ/ErmKj19EhVOfKsyvVXmPvuMImRfXBAtAxTNMjY0MWU8WSIbkdjDZGNbL
 biI+uHvhi4cWWsB/MEkpfUxi+9/wIDNcwYFLZeK+qWg==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr7115181wrp.49.1635438085924;
 Thu, 28 Oct 2021 09:21:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyMKgzDB1igDUPyy00UI9mGxcyOY5krHyjEPwcdvs8cObzielWIajyvYSKRXyiHQOxa8HwjbrosORuHuSRvaM=
X-Received: by 2002:a5d:4004:: with SMTP id n4mr7115161wrp.49.1635438085772;
 Thu, 28 Oct 2021 09:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211026220848.439530-1-lyude@redhat.com>
 <20211026220848.439530-3-lyude@redhat.com>
In-Reply-To: <20211026220848.439530-3-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 28 Oct 2021 18:21:15 +0200
Message-ID: <CACO55tt8c6V-AT5J0bX+Dvw-+rNVXoN93a3t9SfPRV7d-qjvSg@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Satadru Pramanik <satadru@gmail.com>, 
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH v4 2/5] drm/nouveau/kms/nv50-: Explicitly
 check DPCD backlights for aux enable/brightness
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 12:09 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Since we don't support hybrid AUX/PWM backlights in nouveau right now,
> let's add some explicit checks so that we don't break nouveau once we
> enable support for these backlights in other drivers.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 1cbd71abc80a..ae2f2abc8f5a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -308,7 +308,10 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>                 if (ret < 0)
>                         return ret;
>
> -               if (drm_edp_backlight_supported(edp_dpcd)) {
> +               /* TODO: Add support for hybrid PWM/DPCD panels */
> +               if (drm_edp_backlight_supported(edp_dpcd) &&
> +                   (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> +                   (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)) {
>                         NV_DEBUG(drm, "DPCD backlight controls supported on %s\n",
>                                  nv_conn->base.name);
>
> --
> 2.31.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

