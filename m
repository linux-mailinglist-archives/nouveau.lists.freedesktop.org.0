Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A31E452C
	for <lists+nouveau@lfdr.de>; Wed, 27 May 2020 16:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D1F8997C;
	Wed, 27 May 2020 14:05:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DE28991D;
 Wed, 27 May 2020 14:05:11 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b28so11791003vsa.5;
 Wed, 27 May 2020 07:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nj7qsg4lKpnXPmI42ZYb6Reb6qM87EHYaYTe65h4s+w=;
 b=EmpFJs73hnTrYpu5MW5RxXzxJZ7rvg95jN6UTTVvemYiMd2UQ4QxS9kkqTjaoAq44U
 XiezBwnIOnNw1mkXip8tsTlRxF3BzSQfiHkKnulPpXqSd6X0bOEyrgghS5dSEjKnXswZ
 PGnJRlyDP8G9rmtvo1ouek7QHfe2Ua2uaO/Ed30cIf1qpJTS1proLLVk/tBjgEs859pY
 bagXTqtDipf0fOxwGc7t/d+i/di46t/5KVBxgxmR2gvflcpHu4Lm78M/AAqfAUhEA87v
 XelVu7NZmv6qGDgrnvTY4m3fgEoFiiotzRAW7gZANY3YcQU1ZLyddghYtId+z7LqbeK8
 Rhxg==
X-Gm-Message-State: AOAM530KIUaKhBzZ9mjdSt8mLVgm+mRyllQXLqyUm7V/SvJku4HJkSUQ
 6QuqF1HcFjj/SUguPuLQUV92LjYkPUfQMDy1oMg=
X-Google-Smtp-Source: ABdhPJzjUNA5cBcjelNudJyr52VcrEFlfHkWiSwTL0xX6LhIgjVleYcL1OkZCrnF9Q5f0ausMduTpZf0X77n+8opYSQ=
X-Received: by 2002:a67:e9d3:: with SMTP id q19mr4667144vso.220.1590588310389; 
 Wed, 27 May 2020 07:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200527134254.854672-1-arnd@arndb.de>
In-Reply-To: <20200527134254.854672-1-arnd@arndb.de>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 27 May 2020 10:04:59 -0400
Message-ID: <CAKb7Uvhh2JKck524D9S14uNSLykFj+U48AgR+sd2uwchsH_wEQ@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Nouveau] [PATCH] nouveau: add fbdev dependency
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Isn't this already fixed by

https://cgit.freedesktop.org/drm/drm/commit/?id=7dbbdd37f2ae7dd4175ba3f86f4335c463b18403

On Wed, May 27, 2020 at 9:43 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Calling directly into the fbdev stack only works when the
> fbdev layer is built into the kernel as well, or both are
> loadable modules:
>
> drivers/gpu/drm/nouveau/nouveau_drm.o: in function `nouveau_drm_probe':
> nouveau_drm.c:(.text+0x1f90): undefined reference to `remove_conflicting_pci_framebuffers'
>
> The change seems to have been intentional, so add an explicit
> dependency here but allow it to still be compiled if FBDEV
> is completely disabled.
>
> Fixes: 2dd4d163cd9c ("drm/nouveau: remove open-coded version of remove_conflicting_pci_framebuffers()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/nouveau/Kconfig       | 1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 980ed09bd7f6..8c640f003358 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -18,6 +18,7 @@ config DRM_NOUVEAU
>         select THERMAL if ACPI && X86
>         select ACPI_VIDEO if ACPI && X86
>         select SND_HDA_COMPONENT if SND_HDA_CORE
> +       depends on FBDEV || !FBDEV
>         help
>           Choose this option for open-source NVIDIA support.
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index eb10c80ed853..e8560444ab57 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -697,7 +697,8 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>         nvkm_device_del(&device);
>
>         /* Remove conflicting drivers (vesafb, efifb etc). */
> -       ret = remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
> +       if (IS_ENABLED(CONFIG_FBDEV))
> +               ret = remove_conflicting_pci_framebuffers(pdev, "nouveaufb");
>         if (ret)
>                 return ret;
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
