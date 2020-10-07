Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B0285831
	for <lists+nouveau@lfdr.de>; Wed,  7 Oct 2020 07:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADA96E09E;
	Wed,  7 Oct 2020 05:42:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB516E08C
 for <nouveau@lists.freedesktop.org>; Wed,  7 Oct 2020 05:42:51 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id j76so953211ybg.3
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 22:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZJoJj8ZMneX8G5EfX+tUiYnTlmnzz47l2isErGrDqk=;
 b=Lg7k6jQ3jo4IRkwnDK6FVOZ7Gt5TNHKqYgWyVF4gh8Qd2Cmaq+Em+xgDSBbg/PXZsx
 Tyu/oEPC8H2JMi597KXdUcXVYxqtwz9Cx7bQvacqpo7nyrA7dYCvs/WtX/uXIj418Cn2
 d0Xh3D8xVBvc9yqpi6N/Z/GKLeDIns5cHsOtE6A+tIdGL2QRrMUZQTSQC3SNbZpTBkuO
 E+Ax2bgT77ASExa488gDTYxEPYaipiMMw2BQWATfSnrWZ2Hh7wg5zmZFdv7SUHFYsnIR
 TOtW34U1HQwhlJfBGII2fUKUZ0XYK3VbWUpXGC0AYhuY0AqV8EfCPoPUK5Geer1/Uvty
 tttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZJoJj8ZMneX8G5EfX+tUiYnTlmnzz47l2isErGrDqk=;
 b=Mx9iyggSNVF6u4g0thpppabWk3yDu5Ps8lxqIwDfLlg9pRL/6FM5tgwql7zXS7wSGA
 uhd1crANKowueYQdIHqSaze3yN5vvCz2iHRtQfYVzm5udi8PBL+yrhtzfQG5VE0Knm2T
 lVw14HIrEMAAFRvKyaa6QDrANPDK9PZFUs15OiRlwSk6C9HWoNDt3Bmg7h3DeQy7SrrM
 PKYKo5wELxRz70aavKDXQaqNvC7OzPbQPHnk+FNXoCTYHYJF5pNsd7GA3mLHutAyGaLW
 i2cXniDYXZ1Hycix8Oi8ERiyphsJiNXPR2rLrkqKMVvMvVqNwTLNGa//3inBGd/438jt
 7Dqw==
X-Gm-Message-State: AOAM531p9NFgxGKqV9TdzjhaeB7yBGeTeHQQ05TeJgnEJ+5A15yUnz9n
 eaOLneCWl/HXF0veNO9OFJKKvO9km30n40i53sI=
X-Google-Smtp-Source: ABdhPJxuL9VuEsr+8/21V4CEYJjOlqwW8f5FpF2WErUWXygEpxYARV/OJ6CWPuvQBLjN1U5JspRGl9qmAwFU5givT7Y=
X-Received: by 2002:a25:cec8:: with SMTP id x191mr1864107ybe.147.1602049371140; 
 Tue, 06 Oct 2020 22:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201006220809.14240-1-kherbst@redhat.com>
In-Reply-To: <20201006220809.14240-1-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 7 Oct 2020 15:42:39 +1000
Message-ID: <CACAvsv56H4MeaE3x1PiSHVxsFJRL1N4geTqwtJvPAs3-4ig3Mw@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [RFC] gem: fix "refcount_t: underflow; use-after-free"
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 7 Oct 2020 at 08:08, Karol Herbst <kherbst@redhat.com> wrote:
>
> we can't use nouveau_bo_ref here as no ttm object was allocated and
> nouveau_bo_ref mainly deals with that. Simply deallocate the object.
I suspect this was fallout from when that whole process was split into
stages, seems reasonable to me, applied.

Ben.

>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drm/nouveau/nouveau_gem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
> index e11303fbc..45582a8dc 100644
> --- a/drm/nouveau/nouveau_gem.c
> +++ b/drm/nouveau/nouveau_gem.c
> @@ -198,7 +198,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>          * to the caller, instead of a normal nouveau_bo ttm reference. */
>         ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
>         if (ret) {
> -               nouveau_bo_ref(NULL, &nvbo);
> +               drm_gem_object_release(&nvbo->bo.base);
> +               kfree(nvbo);
>                 return ret;
>         }
>
> --
> 2.26.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
