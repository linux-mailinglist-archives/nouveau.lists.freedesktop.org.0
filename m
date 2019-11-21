Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBED12B2B2
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB7189EBB;
	Fri, 27 Dec 2019 08:13:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74A46F4C0;
 Thu, 21 Nov 2019 18:09:15 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id i11so4479940iol.13;
 Thu, 21 Nov 2019 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhDv8B/MH9k+2gQLkxu3wNqBY8ATU21NQy45rVB5e/0=;
 b=JZBgJAoHLsaELThn5k6UAy5s4Qo+A7dUCdsWtG0c42UhKK3t+dMn/5paQKhgqRE532
 uu5lgnDMfAtg5I1V+8oaBRUjskvJu4k+FHeV2d38VLXO22aaGK6tzwMLVcsJcrx5HJSS
 Imay1ryOzoA2d5/D7lv7a6qluP3VEAIvRK5t7Xb2R4f+9EUnzkpbcv9CEcoQ8aE6Zr+6
 RKfUJj8XpzVDUz5E1eANFZ4CnzI4DU9eAurhl5e84U/clJmkiDAOuLly9caEvcBcpozR
 4lgp2i+TSUJsD/fbwXufE++3B1lScdQr0tN/OGW/vSu5DAzRZeDYM/+pwm3TFfrYyw57
 nltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhDv8B/MH9k+2gQLkxu3wNqBY8ATU21NQy45rVB5e/0=;
 b=cNo7Fuu8pNLOUQ2caOnhbYh1itx5q4oxtlC6fznvigmJbZ5AZxlum9DpL3kJyEHkll
 hI8lNNem6GBUazz5wixO7CTEMlbE8snlUjMUTYJuUvapRgT5Pxueu5jJ86d6e+EkCrwk
 0zUITUOXSJkJo/CP89stg4OYPrAeMearrWAYvsXMzo+/CHT4dWqrljNlvLiYBhOtTvXB
 zei+jLmcF2aj7xqcJwp43Y4Eie79GyyjUaxAorOnBgW1T3kU0NCSr+Td6enlkR/UgAJh
 ts42Xc7d7hahF8nQXjhYqxlfiNsG6LJDLnzw4RD9gDFNm1g7pYW8eRySg7D66r/H8/4C
 FU3A==
X-Gm-Message-State: APjAAAUyDePSf+zPd8g59z6fQxXXYM7HZsNJ8UfEyA7vcpU1952XGx9p
 e4l6gFZIMOnOJgiQ1dlTn7FtZRYpIADsTqMQ9Ds=
X-Google-Smtp-Source: APXvYqxlo2bv+bM+ry7TgMS2bHzA+FeG4N2aN4fgU0MpxQpJgbxeccusuTVlwBNNkJxfQTfEZoio57HSh9Teo0+EC80=
X-Received: by 2002:a02:ce51:: with SMTP id y17mr7688720jar.1.1574359754949;
 Thu, 21 Nov 2019 10:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191021211449.9104-1-navid.emamdoost@gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Thu, 21 Nov 2019 12:09:04 -0600
Message-ID: <CAEkB2ERA6Rx9fZiwXH+m8_OV8to0TuLJRVRiUKfKtSoeoT0uJw@mail.gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix memory leak in
 nouveau_bo_alloc
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
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2019 at 4:14 PM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> In the implementation of nouveau_bo_alloc() if it fails to determine the
> target page size via pi, then the allocated memory for nvbo should be
> released.
>
> Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Would you please review this patch?


Thanks,
Navid.

> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index f8015e0318d7..18857cf44068 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
>                         break;
>         }
>
> -       if (WARN_ON(pi < 0))
> +       if (WARN_ON(pi < 0)) {
> +               kfree(nvbo);
>                 return ERR_PTR(-EINVAL);
> +       }
>
>         /* Disable compression if suitable settings couldn't be found. */
>         if (nvbo->comp && !vmm->page[pi].comp) {
> --
> 2.17.1
>


-- 
Navid.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
