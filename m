Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789F2518D1F
	for <lists+nouveau@lfdr.de>; Tue,  3 May 2022 21:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7D710E7DB;
	Tue,  3 May 2022 19:23:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7625410E77B
 for <nouveau@lists.freedesktop.org>; Tue,  3 May 2022 19:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651605829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1/RCEqp6rD6C5bP4Oel+DuHsx3t6d/OQda58eNU9e8M=;
 b=hbhhWczfleGzoo7nLD/Aixy3VjO0ibjv3X89CfUq8sOyU+TpVv8SIkggRqIM+B4tDdy70m
 Qs9ayGwXFa5WNuxp8SvG+2fJdlljO6GXR/vRSYikc2qWSsk1Tvkz2IUMh/dXIy41pwPx+Y
 VO5TkKdZWzurn7cRuD70gyjHVYpQIOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-jUUPsPHQPnKLKyR1KbZsMg-1; Tue, 03 May 2022 15:23:44 -0400
X-MC-Unique: jUUPsPHQPnKLKyR1KbZsMg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so1777952wme.5
 for <nouveau@lists.freedesktop.org>; Tue, 03 May 2022 12:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/RCEqp6rD6C5bP4Oel+DuHsx3t6d/OQda58eNU9e8M=;
 b=0ApsNTvR642DMPT74BUpPdesbdoIqVUoA6yDcXqasV0PbdJ3C4GTiCbuNih4AnzGpH
 uho1GjDtgLoxCiJJ/2F+6lCXL9FoUwYC4lVhCcCcDuT51hVZ166EfxmFhkfLGDhmuf2j
 CuQAFMm7WkfZxl1lILshzvxkPSlsxAgQT2150tzRkiIvlZyi++Gw1uAUuGVVvuuaxoRr
 zed/m2OA2ebLqlXMOn/tRRKcTOqk+HM6Qf0JAk7J89UhhFzshhluCvu1BKvpobMTrDn2
 sz8rJN4lObgb4PJu05YIxHnlIQA0XBih9Y+6uSWQ/w1KOMaM2xb9QmVlinUmMT+o77Um
 Gq4A==
X-Gm-Message-State: AOAM530x5WFr4zEGA+uIX0Ko9xgL8H+4GSPCQBLcD15vF06wd45P90ip
 eYLcn9pus0cam+kGMZHwojOo0TGu5eYeZlPE+Ek96EGwFkfva1C+AYQ43VZAcm22I0xkMuXWP3F
 PJKOz06li+8KP0vZDLVZbGQn7VTCoO+KEJ+hXr+XAog==
X-Received: by 2002:a5d:64ea:0:b0:20c:5ca3:a0de with SMTP id
 g10-20020a5d64ea000000b0020c5ca3a0demr10508050wri.308.1651605821839; 
 Tue, 03 May 2022 12:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzreDUrtXoyuE22Us65ZpjSyx6nFjemAk+h1WnCiSgoWNkBnpxUDaPb4LDmFrrMxNqjsNDyA6NW8ENNFbF1AEU=
X-Received: by 2002:a5d:64ea:0:b0:20c:5ca3:a0de with SMTP id
 g10-20020a5d64ea000000b0020c5ca3a0demr10508040wri.308.1651605821655; Tue, 03
 May 2022 12:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220429195350.85620-1-lyude@redhat.com>
In-Reply-To: <20220429195350.85620-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 3 May 2022 21:23:30 +0200
Message-ID: <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/subdev/bus: Ratelimit logging for
 fault errors
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
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

not able to hit any error on my machine, but regardless:

Reviewed-by: Karol Herbst <kherbst@redhat.com>

I suspect there are more places where we could put it, but we can add
those later.

Anyway, I think it's valuable to push it through fixes, not sure how
far back we want to CC stable though.

On Fri, Apr 29, 2022 at 9:54 PM Lyude Paul <lyude@redhat.com> wrote:
>
> There's plenty of ways to fudge the GPU when developing on nouveau by
> mistake, some of which can result in nouveau seriously spamming dmesg with
> fault errors. This can be somewhat annoying, as it can quickly overrun the
> message buffer (or your terminal emulator's buffer) and get rid of actually
> useful feedback from the driver. While working on my new atomic only MST
> branch, I ran into this issue a couple of times.
>
> So, let's fix this by adding nvkm_error_ratelimited(), and using it to
> ratelimit errors from faults. This should be fine for developers, since
> it's nearly always only the first few faults that we care about seeing.
> Plus, you can turn off rate limiting in the kernel if you really need to.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
>  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
>  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
>  4 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> index 1665738948fb..96113c8bee8c 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> @@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
>  #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
>  #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
>  #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
> +
> +#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR, err_ratelimited, f, ##a)
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> index 53a6651ac225..80b5aaceeaad 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> @@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
>                 u32 addr = nvkm_rd32(device, 0x009084);
>                 u32 data = nvkm_rd32(device, 0x009088);
>
> -               nvkm_error(subdev,
> -                          "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> -                          (addr & 0x00000002) ? "write" : "read", data,
> -                          (addr & 0x00fffffc),
> -                          (stat & 0x00000002) ? "!ENGINE " : "",
> -                          (stat & 0x00000004) ? "PRIVRING " : "",
> -                          (stat & 0x00000008) ? "TIMEOUT " : "");
> +               nvkm_error_ratelimited(subdev,
> +                                      "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> +                                      (addr & 0x00000002) ? "write" : "read", data,
> +                                      (addr & 0x00fffffc),
> +                                      (stat & 0x00000002) ? "!ENGINE " : "",
> +                                      (stat & 0x00000004) ? "PRIVRING " : "",
> +                                      (stat & 0x00000008) ? "TIMEOUT " : "");
>
>                 nvkm_wr32(device, 0x009084, 0x00000000);
>                 nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> index ad8da523bb22..c75e463f3501 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> @@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
>                 u32 addr = nvkm_rd32(device, 0x009084);
>                 u32 data = nvkm_rd32(device, 0x009088);
>
> -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> -                          (addr & 0x00000002) ? "write" : "read", data,
> -                          (addr & 0x00fffffc));
> +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
> +                                      (addr & 0x00000002) ? "write" : "read", data,
> +                                      (addr & 0x00fffffc));
>
>                 stat &= ~0x00000008;
>                 nvkm_wr32(device, 0x001100, 0x00000008);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> index 3a1e45adeedc..2055d0b100d3 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> @@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
>                 u32 addr = nvkm_rd32(device, 0x009084);
>                 u32 data = nvkm_rd32(device, 0x009088);
>
> -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> -                          (addr & 0x00000002) ? "write" : "read", data,
> -                          (addr & 0x00fffffc));
> +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at %06x\n",
> +                                      (addr & 0x00000002) ? "write" : "read", data,
> +                                      (addr & 0x00fffffc));
>
>                 stat &= ~0x00000008;
>                 nvkm_wr32(device, 0x001100, 0x00000008);
> --
> 2.35.1
>

