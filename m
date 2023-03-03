Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E86A9965
	for <lists+nouveau@lfdr.de>; Fri,  3 Mar 2023 15:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28E410E5FD;
	Fri,  3 Mar 2023 14:28:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391D510E5FE
 for <nouveau@lists.freedesktop.org>; Fri,  3 Mar 2023 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677853717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3ApB4exZoXcG63nEHDI8L+9x3I4wPipSfbFGyH/f0E=;
 b=USdkhU4fziI2iZQfQKcUB+2SOCI+oQXK6d99boC0PyOzWvSQjFTv7ZY2T9Je/KzavRfQZc
 0Wn77vvqBcQGCF3cCu9lXrQg7kwprTNd+WinpvhiUg866D6W9Mvg3q5QxExjQ1axVfa69O
 XPvx3YxAK0RLreoUyNGluDQC4i+eVtQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-oKgbc7ZDOsSkMnlVpjPSaQ-1; Fri, 03 Mar 2023 09:28:35 -0500
X-MC-Unique: oKgbc7ZDOsSkMnlVpjPSaQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 n7-20020a056512310700b004cae66ea2bfso1102505lfb.0
 for <nouveau@lists.freedesktop.org>; Fri, 03 Mar 2023 06:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677853714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o3ApB4exZoXcG63nEHDI8L+9x3I4wPipSfbFGyH/f0E=;
 b=UyncaYMJbcCIfVPc9PGQAF8KPIPX6idKiswidrCk6FpZZG/0Z12HeFbkTwhp94dQwP
 BYMvsC6xhFia3+0Dg31Ji/qCc8sHSnc6Ip114slrOceQbUS0AEMLuAxYGb5ncD6wa6dx
 Fc6i/3i+AoYLWgoJHASAetPv+krMTUAIAMPtGeI2NJoIH+3Pu/xubO+dvMIFtfKR2KU5
 t69Qe2+28Fe039xJCLgDMARklDYaahDk3AeLdfpL79+fhJIwLVQ5q5vPDrm6dnf0vmbp
 qWiEah91j+55VPw1xFEtjjTzw0iMyCFobrA4auDBkEtDWaZskZSay+O2+tQsaUp4FcI9
 +n7w==
X-Gm-Message-State: AO0yUKVqByKjSgEq3Qcf8KY4eKQ3J8oZJBGTGBHypDVbVKRQnNjw4zXv
 BCJ9BtuBbFQOZjP6e8Ftg3rAzWRGMNmWst7ia9jHscutbg5sITv8icWuUgjokr4zsf1nXfRLYfb
 hKjkqAfgZAA8+Lj77p+waHVCNS7hd7l7yiqemYQDzzQ==
X-Received: by 2002:ac2:5927:0:b0:4d5:ca32:6aec with SMTP id
 v7-20020ac25927000000b004d5ca326aecmr645061lfi.12.1677853714511; 
 Fri, 03 Mar 2023 06:28:34 -0800 (PST)
X-Google-Smtp-Source: AK7set89z3ZaDV+0l8hN22o89ZbCZILIi4QRjANWBxaYKra+nJigSS7Ho1XPgvAOO/WyESHVRzmPsFP0RA2BCA7iIf8=
X-Received: by 2002:ac2:5927:0:b0:4d5:ca32:6aec with SMTP id
 v7-20020ac25927000000b004d5ca326aecmr645049lfi.12.1677853714194; Fri, 03 Mar
 2023 06:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20230303132731.1919329-1-trix@redhat.com>
In-Reply-To: <20230303132731.1919329-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 3 Mar 2023 15:28:21 +0100
Message-ID: <CACO55tuMxp5M+zgG_p3QpXUfrPhcssPMz91tfMBFt5OVobOSaw@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/fifo: set
 gf100_fifo_nonstall_block_dump storage-class-specifier to static
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

will push in a moment

On Fri, Mar 3, 2023 at 2:27 PM Tom Rix <trix@redhat.com> wrote:
>
> gcc with W=3D1 reports
> drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: error:
>   no previous prototype for =E2=80=98gf100_fifo_nonstall_block=E2=80=99 [=
-Werror=3Dmissing-prototypes]
>   451 | gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int=
 index)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> gf100_fifo_nonstall_block is only used in gf100.c, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/fifo/gf100.c
> index 5bb65258c36d..6c94451d0faa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c
> @@ -447,7 +447,7 @@ gf100_fifo_nonstall_allow(struct nvkm_event *event, i=
nt type, int index)
>         spin_unlock_irqrestore(&fifo->lock, flags);
>  }
>
> -void
> +static void
>  gf100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
>  {
>         struct nvkm_fifo *fifo =3D container_of(event, typeof(*fifo), non=
stall.event);
> --
> 2.27.0
>

