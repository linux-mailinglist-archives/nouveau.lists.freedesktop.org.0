Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FFD1C0894
	for <lists+nouveau@lfdr.de>; Thu, 30 Apr 2020 22:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B276E9B8;
	Thu, 30 Apr 2020 20:51:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3136E959;
 Thu, 30 Apr 2020 20:51:14 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id h30so5069699vsr.5;
 Thu, 30 Apr 2020 13:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aQ4JoZLswE+5et1XI7Fj8iSNtStFbfnLQn6y/josmoc=;
 b=O1b5f+XnqT0uPhPs3NMlEWJ57pUrBIuHBw6imz4hQmJpmZCh/3OTvPVJSUeEqy1Ie9
 6EdEvLNBqNbWhUFsWGUkseXjStAiJ7y/p1SYZnR0DXrveSNfAoU5Riw4rtofeXv3AAmJ
 2oLGkkWhrVRIIamNvMQhVsZ/K48ROVFtyQItISCiL5UQ2qfMKr/NWJ9b9eLhf1ppGwGj
 tJVfgpOpB2svoqaIvTDPhXxlAnR0oVwyBjs26Y8La+oZzUuxVGLaqaIL5110JujlBMrw
 g5aqUa7L7m15lqEkYXTutnMBG+2jAF0zLW7xZngzBP8KpGQ5SPt/jNHaAL0ngxHOwoRp
 5kPA==
X-Gm-Message-State: AGi0Pub+6fwPGZa1qLpthu6bNHNGPHPYFFRHgPVGHCkfpiaMwbc6wy9W
 ZdTd6NKP+WkvQAUboz2+SjWdZc2jnI6EyVwRnyI=
X-Google-Smtp-Source: APiQypIDX6LX4uerYAVukR5eE7Gsb/ng0kkyyKsn3GvCxnXKrU2ft4JrgwN+XO4ndeiU6XYNTRG00DAdZAlZ3N89lcI=
X-Received: by 2002:a67:d714:: with SMTP id p20mr769410vsj.207.1588279874095; 
 Thu, 30 Apr 2020 13:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <1588278413-21682-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1588278413-21682-1-git-send-email-jrdr.linux@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 30 Apr 2020 16:51:02 -0400
Message-ID: <CAKb7UvhNzfJLS8--5LySAjyzH2bidfZbP7VgzEVfeV2Erva4YQ@mail.gmail.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dispnv04: Remove dead code
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
Cc: Daniel Vetter <daniel@ffwll.ch>, inux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Interesting. I do remember seeing some snow on NV5's overlay at high
resolutions. Wonder if it was because of this missing code...

On Thu, Apr 30, 2020 at 4:19 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> These are dead code since 3.10. If there is no plan to use
> it further, these can be removed forever.
>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index 1f08de4..ad0ef7d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -269,31 +269,11 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
>                 horizStart = horizTotal - 5;
>                 horizEnd = horizTotal - 2;
>                 horizBlankEnd = horizTotal + 4;
> -#if 0
> -               if (dev->overlayAdaptor && drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
> -                       /* This reportedly works around some video overlay bandwidth problems */
> -                       horizTotal += 2;
> -#endif
>         }
>
>         if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>                 vertTotal |= 1;
>
> -#if 0
> -       ErrorF("horizDisplay: 0x%X \n", horizDisplay);
> -       ErrorF("horizStart: 0x%X \n", horizStart);
> -       ErrorF("horizEnd: 0x%X \n", horizEnd);
> -       ErrorF("horizTotal: 0x%X \n", horizTotal);
> -       ErrorF("horizBlankStart: 0x%X \n", horizBlankStart);
> -       ErrorF("horizBlankEnd: 0x%X \n", horizBlankEnd);
> -       ErrorF("vertDisplay: 0x%X \n", vertDisplay);
> -       ErrorF("vertStart: 0x%X \n", vertStart);
> -       ErrorF("vertEnd: 0x%X \n", vertEnd);
> -       ErrorF("vertTotal: 0x%X \n", vertTotal);
> -       ErrorF("vertBlankStart: 0x%X \n", vertBlankStart);
> -       ErrorF("vertBlankEnd: 0x%X \n", vertBlankEnd);
> -#endif
> -
>         /*
>         * compute correct Hsync & Vsync polarity
>         */
> @@ -492,14 +472,6 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
>         /* Except for rare conditions I2C is enabled on the primary crtc */
>         if (nv_crtc->index == 0)
>                 regp->crtc_eng_ctrl |= NV_CRTC_FSEL_I2C;
> -#if 0
> -       /* Set overlay to desired crtc. */
> -       if (dev->overlayAdaptor) {
> -               NVPortPrivPtr pPriv = GET_OVERLAY_PRIVATE(dev);
> -               if (pPriv->overlayCRTC == nv_crtc->index)
> -                       regp->crtc_eng_ctrl |= NV_CRTC_FSEL_OVERLAY;
> -       }
> -#endif
>
>         /* ADDRESS_SPACE_PNVM is the same as setting HCUR_ASI */
>         regp->cursor_cfg = NV_PCRTC_CURSOR_CONFIG_CUR_LINES_64 |
> --
> 1.9.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
