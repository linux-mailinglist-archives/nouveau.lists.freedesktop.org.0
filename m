Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A63113E5
	for <lists+nouveau@lfdr.de>; Fri,  5 Feb 2021 22:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAF56F4EF;
	Fri,  5 Feb 2021 21:50:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2F6F4EF
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 21:50:51 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id e10so1815453vkm.2
 for <nouveau@lists.freedesktop.org>; Fri, 05 Feb 2021 13:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2dQzEyIWF5uF4wdEo6Py9jU/zJKyqGwpGBfFY0TT50=;
 b=nQQRwLIsr/ZTsGKBaOU2ogaU53PoEtDkYskQOMjearzjTPO7Qm7DvkXF9T2o05siiE
 belBqkyC+kKXGlpe3+WpzuqP1NOZX40kiFpffq8qRUCotR/UfA5pN3pU7zFYfVmnGMse
 +PFb1CXhDtPPk2Io0ecfMQQBtoOTg3kCN/Z7mruFVnhNX+puAm4ETaMKQ3urq2yb1pS/
 nou04RTHWxjdKriVdv2vOSNOzWu5+uK6V73XoXT5ZPrKeP2ssihb0rFDJSKiqfhxYTeQ
 i95pmDnp3/qhEuDaQGMghjdjBwzLF+vSBDHnR6eWMXyIU4LGouKfPTmTHZJ4mNGlXfxg
 VwxA==
X-Gm-Message-State: AOAM533Ll41JJ/AjV1iABUKgNCXlvX/Rzf2/2KnROdkDabei4kJy8VAL
 1smRtFh0L3lTXiNR2xvm36cc3NSeoRZmw0kziBY=
X-Google-Smtp-Source: ABdhPJzHvbPVhoiPhjvd3DaMbF5FXZjLMVDAvhEar6IaL06tJjJx6RQiVoLV/sHP2mJo9oBAqsU+3/bGelZA1JEa6zE=
X-Received: by 2002:a1f:9187:: with SMTP id t129mr5089841vkd.12.1612561850554; 
 Fri, 05 Feb 2021 13:50:50 -0800 (PST)
MIME-Version: 1.0
References: <20210205210044.2665-1-contact@emersion.fr>
In-Reply-To: <20210205210044.2665-1-contact@emersion.fr>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 5 Feb 2021 16:50:39 -0500
Message-ID: <CAKb7Uvj3HLGMiO4uxvjmR7JCdEN_4b3K46tQeqxtCOYw2AZ1uw@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [Nouveau] [PATCH v2] nouveau/dispnv50: add cursor pitch check
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

On Fri, Feb 5, 2021 at 4:00 PM Simon Ser <contact@emersion.fr> wrote:
>
> The hardware needs a FB which is packed. Add checks to make sure
> this is the case.
>
> While at it, add debug logs for the existing checks. This allows
> user-space to more easily figure out why a configuration is
> rejected.
>
> v2:
> - Use drm_format_info instead of hardcoding bytes-per-pixel (Ilia)
> - Remove unnecessary size check (Ilia)
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/curs507a.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> index 54fbd6fe751d..00f09c9a8d15 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
> @@ -30,6 +30,7 @@
>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_fourcc.h>
>
>  bool
>  curs507a_space(struct nv50_wndw *wndw)
> @@ -99,6 +100,8 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>                  struct nv50_head_atom *asyh)
>  {
>         struct nv50_head *head = nv50_head(asyw->state.crtc);
> +       struct drm_device *dev = head->base.base.dev;
> +       struct drm_framebuffer *fb = asyw->state.fb;
>         int ret;
>
>         ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
> @@ -109,12 +112,26 @@ curs507a_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
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
> +       if (asyw->image.pitch[0] != asyw->image.w * fb->format->cpp[0]) {
> +               drm_dbg_atomic(dev,
> +                              "Invalid cursor image pitch: image must be packed (pitch = %d, width = %d)",
> +                              asyw->image.pitch[0], asyw->image.w);
> +               return -EINVAL;
> +       }
>
>         ret = head->func->curs_layout(head, asyw, asyh);
> -       if (ret)
> +       if (ret) {
> +               drm_dbg_atomic(dev,
> +                              "Invalid cursor image size: unsupported size %dx%d",
> +                              asyw->image.w, asyw->image.h);
>                 return ret;
> +       }
>
>         return head->func->curs_format(head, asyw, asyh);

While you're at it, maybe give this one some love too?

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
