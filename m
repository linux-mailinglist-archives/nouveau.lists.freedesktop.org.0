Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E5E425F80
	for <lists+nouveau@lfdr.de>; Thu,  7 Oct 2021 23:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086056F4E6;
	Thu,  7 Oct 2021 21:46:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FA26E039
 for <nouveau@lists.freedesktop.org>; Thu,  7 Oct 2021 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633643210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UPSqvOGCu+GJcDa90zr7X1MG9KfGKC/5VQJKgH+ViDk=;
 b=L4kcUMli5JLT9iMTbjlUK4Nz06LjudAxOAlSQHcsaB8VwhDEDso/+8SXprhYj1AVed0wYF
 M3kMO1Gg06ThTv0XTnZSI1cV0BybY4VBHhob7Q5MW4Fk8nOThNFzgatU7QQyVaBgyO62dt
 NI4Zbw8VY+TkhsGdIFjoe4Adt+1fSDE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-GbFNDBcUMuClrVWAh4dwjw-1; Thu, 07 Oct 2021 17:46:48 -0400
X-MC-Unique: GbFNDBcUMuClrVWAh4dwjw-1
Received: by mail-wr1-f70.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so5715334wrg.10
 for <nouveau@lists.freedesktop.org>; Thu, 07 Oct 2021 14:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UPSqvOGCu+GJcDa90zr7X1MG9KfGKC/5VQJKgH+ViDk=;
 b=txIqQWoRzF8uzzMbyN1eGzeYbquzSXiTEMPKQ23wh3jg87OJuR5ersBXtnJFWKpRy/
 iLT8zEyXkScWeTYwL7DxXXQvGH/4g2djDgCcv6qZpQ00xlCAclj8l4D4vnSvjY8XDP9F
 H4znbuK7WmvTi7tGgbH1LX6KOaxnV+X1q0IXEWdpQ1/30D+ruIWB5N3388Yuv4Tl680W
 10u99O5N0tvja9jX6KsMdAf+96Pj9AfkReUVsiCZtaxD5246jlEyAcU8ujS2/OQCmCwb
 MCouaANJroVwX0ebAQeur9TQrFAtj78v5yyJfMshg6kOoT2xFwzz4JbBxFwBGLWjkZ2z
 oHlg==
X-Gm-Message-State: AOAM53055Puwi8ZGzzzXbn0rtbOe2BkOtbG7INWmirv8kawlxoHt43S0
 UtPzm1dwNishxPbsyOs83v4ZFl0BwXye8l0szxs7RaTU9DR4jJaWTU2lG3xRLo8ysEeblwUm2Wl
 upw0GtbSJcnpCG5XVToDurVHx2wLpLvDo4R1PyG1lQQ==
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr8423703wra.49.1633643207521; 
 Thu, 07 Oct 2021 14:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqAKo0aK9SLNTCPUFBer0OSZTRHIE2Hyrqtsw01LVQXzy+cOws4WYmJCdoRH/WN4MFlYIehJPJYTXoJ/WR+4Y=
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr8423659wra.49.1633643207147; 
 Thu, 07 Oct 2021 14:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211007214117.231472-1-marex@denx.de>
In-Reply-To: <20211007214117.231472-1-marex@denx.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 7 Oct 2021 23:46:36 +0200
Message-ID: <CACO55tsgmtR1CqdJOBMu9oQEEojfpnUwWNvab9gA7ZuZmyiSmA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, stable@vger.kernel.org, 
 Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo: Reinstate the correct
 engine bit programming
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

I haven't checked if other places need fixing up yet, and I still want
to test this patch, but I won't get to it until Monday. But if
everything is in place we can get this pushed next week so we can
finally fix this annoying issue :) I was also seeing some minor
graphical corruptions which would be cool if this patch fixes it as
well.

Thanks for the patch and poking us about the bug again.

On Thu, Oct 7, 2021 at 11:41 PM Marek Vasut <marex@denx.de> wrote:
>
> Commit 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook") replaced
> fifo/chang84.c g84_fifo_chan_engine() call with an indirect call of
> fifo/g84.c g84_fifo_engine_id(). The G84_FIFO_ENGN_* values returned
> from the later g84_fifo_engine_id() are incremented by 1 compared to
> the previous g84_fifo_chan_engine() return values.
>
> This is fine either way for most of the code, except this one line
> where an engine bit programmed into the hardware is derived from the
> return value. Decrement the return value accordingly, otherwise the
> wrong engine bit is programmed into the hardware and that leads to
> the following failure:
> nouveau 0000:01:00.0: gr: 00000030 [ILLEGAL_MTHD ILLEGAL_CLASS] ch 1 [003fbce000 DRM] subc 3 class 0000 mthd 085c data 00000420
>
> On the following hardware:
> lspci -s 01:00.0
> 01:00.0 VGA compatible controller: NVIDIA Corporation GT216GLM [Quadro FX 880M] (rev a2)
> lspci -ns 01:00.0
> 01:00.0 0300: 10de:0a3c (rev a2)
>
> Fixes: 64f7c698bea9 ("drm/nouveau/fifo: add engine_id hook")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: <stable@vger.kernel.org> # 5.12+
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> index 353b77d9b3dc..3492c561f2cf 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c
> @@ -82,7 +82,7 @@ g84_fifo_chan_engine_fini(struct nvkm_fifo_chan *base,
>         if (offset < 0)
>                 return 0;
>
> -       engn = fifo->base.func->engine_id(&fifo->base, engine);
> +       engn = fifo->base.func->engine_id(&fifo->base, engine) - 1;
>         save = nvkm_mask(device, 0x002520, 0x0000003f, 1 << engn);
>         nvkm_wr32(device, 0x0032fc, chan->base.inst->addr >> 12);
>         done = nvkm_msec(device, 2000,
> --
> 2.33.0
>

