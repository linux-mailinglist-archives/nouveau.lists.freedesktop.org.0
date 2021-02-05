Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB3310EBC
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 18:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8F46F48D;
	Fri,  5 Feb 2021 17:34:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008EF6F48D
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 17:34:32 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id n18so3994194vsa.12
 for <nouveau@lists.freedesktop.org>; Fri, 05 Feb 2021 09:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4GSt5v04OjoqZmM0ABfrf1M1E/F5sKHykJg0oJZac8=;
 b=fFic9q1a2ar2Ona0Ix9tqst/tTDjhvyjYkYm6FBxHH/LziA3cyeesrMaxxpxs0Bh3/
 We88jwQiz8QYgYfm/YoHXyVAWeKCI8P6xQrfU71Eqv3cTyWOMoiWnSe0r6oni7PfwQNP
 ruxLQW3KSFRebu5oZEY1V6YHhl+B/ytLyzCcNfeAJnyN0HP8NJ7XwqIKvG9z2n2jGo51
 jZ7qt28PxJYRfoUjkj6iKzJFsC6/bmFShke400qwbd2TmKKB7o2EEQ9Bw2RByzfBE9W2
 QN/0IU/AalAiJ5Ce7fAEo2+XWVdvP7K9IYP/dqWgziOzj1YKYjBuiFY+AyBlIjCHOUIa
 HUXw==
X-Gm-Message-State: AOAM532qy+qShHgJBBo6qAHP6OebSrghFywRPwsj2ibVuFzK8kf/BFbJ
 SZZ632NdAyeB2niGSZcs+khwpCGcbjOyfY8QHQ8=
X-Google-Smtp-Source: ABdhPJy+9DJ4eO0q+KaOhz9E/72q06yJtJ8MznokxwTTsZXh5a1YXnyLvO1aw8sm/839TQzLKzzmd2C0NOsvoPUTBEE=
X-Received: by 2002:a67:7992:: with SMTP id u140mr4333817vsc.2.1612546472029; 
 Fri, 05 Feb 2021 09:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20210205164515.4622-1-contact@emersion.fr>
In-Reply-To: <20210205164515.4622-1-contact@emersion.fr>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 5 Feb 2021 12:34:20 -0500
Message-ID: <CAKb7UvgpiHY3Z3BtCW3yP2YbfTvmpYS2uvErz1SjkR07pV6DSw@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [Nouveau] [PATCH] nouveau/dispnv50: add cursor size/pitch checks
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 11:45 AM Simon Ser <contact@emersion.fr> wrote:
>
> The hardware needs a FB which is packed and not too large. Add
> checks to make sure this is the case.
>
> While at it, add a debug log for the existing check. This allows
> user-space to more easily figure out why a configuration is
> rejected.
>
> This commit depends on "drm/nouveau/kms/nv50-: Report max cursor
> size to userspace", otherwise mode_config.cursor_{width,height}
> is zero.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 22 ++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> index 54fbd6fe751d..9a401751c56d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> @@ -99,6 +99,7 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>                  struct nv50_head_atom *asyh)
>  {
>         struct nv50_head *head = nv50_head(asyw->state.crtc);
> +       struct drm_device *dev = head->base.base.dev;
>         int ret;
>
>         ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
> @@ -109,8 +110,27 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>         if (ret || !asyh->curs.visible)
>                 return ret;
>
> -       if (asyw->image.w != asyw->image.h)
> +       if (asyw->image.w != asyw->image.h) {
> +               drm_dbg_atomic(dev,
> +                              "Invalid cursor image size: width (%d) must match height (%d)",
> +                              asyw->image.w, asyw->image.h);
>                 return -EINVAL;
> +       }
> +       if (asyw->image.w > dev->mode_config.cursor_width ||
> +           asyw->image.h > dev->mode_config.cursor_height) {
> +               drm_dbg_atomic(dev,
> +                              "Invalid cursor image size: too large (%dx%d > %dx%d)",
> +                              asyw->image.w, asyw->image.h,
> +                              dev->mode_config.cursor_width,
> +                              dev->mode_config.cursor_height);
> +               return -EINVAL;
> +       }
> +       if (asyw->image.pitch[0] != asyw->image.w * 4) {

Rather than hard-coding to 4, make this look at the format (or cpp,
which should be available somewhere too I think). (Yeah, currently we
only expose RGBA8, but we should also be doing RGB5A1.)

> +               drm_dbg_atomic(dev,
> +                              "Invalid cursor image pitch: image must be packed (pitch = %d, width = %d)",
> +                              asyw->image.pitch[0], asyw->image.w);
> +               return -EINVAL;
> +       }
>
>         ret = head->func->curs_layout(head, asyw, asyh);

And this will fail due to the width/height not being supported, right?

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
