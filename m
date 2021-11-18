Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015E2455DB4
	for <lists+nouveau@lfdr.de>; Thu, 18 Nov 2021 15:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DC16E90D;
	Thu, 18 Nov 2021 14:14:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8AD6E90D
 for <nouveau@lists.freedesktop.org>; Thu, 18 Nov 2021 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637244839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yu9sVeERSIHfY6aSOM6DBuF1CVX3w/vIMswOLMWFU7o=;
 b=BQQ2tdnhH8OJUIpd3XJi//9Karo7QglkqRVv131FsRoiUPRR3SPkIu+Id533Rr8+Hiyf3D
 EnNzU/2RYBeb24oyjzNgx5VtnCXXAgCssc5hsHnPNvJq/rjdC7ijoBDw0JeS7airuDR8XY
 3lgEF7CRrSyqwotpk2QZf0ADuK1IUtw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-585-_Ds4LX20M9SS4llHRPs44w-1; Thu, 18 Nov 2021 09:13:58 -0500
X-MC-Unique: _Ds4LX20M9SS4llHRPs44w-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so1114920wrj.0
 for <nouveau@lists.freedesktop.org>; Thu, 18 Nov 2021 06:13:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yu9sVeERSIHfY6aSOM6DBuF1CVX3w/vIMswOLMWFU7o=;
 b=BpUB+PVfmz6Z62bD+OnK99FZmSo9MlZB4JSb5AfUjE4TI8Qyp5475piRn9dzoZCoQ6
 o9AIJl3/xU4Vdf7fBhJ0VoB3PvNajcOctHRO5fy9NeOoIX/u9K62zuYp48Q+VlD8TDtj
 3knHNgIdyLmUdh7iGKGCWCDWYOVatgL8jpJHbfsEo8U4fKtderZ8nM2qJa5x1jTHfJD8
 X1mDBbLJLRSlV/sEBFwGG4VqeXnQHN+EeaUDXGyVb6CagrS8BsqYmjPX0VH3n20Ai9aK
 8Pih3qltFWpHLlqHyiYTiGVZdQw3p6I+zBPYCeZ61KlsIXv4FsibwVBpJOBjcQiBUhG7
 554A==
X-Gm-Message-State: AOAM533/zNtymawisAfwz8LrFWpYJniPxpijAznc24QX7BqLmgzqHTwS
 nxjZjz+SDFCoGD5NmSaPRyPTISnnLDfS9c03UJ6+OemHgOZOdodyy88vzm5kvi7jt1dWWb+JgWu
 sgEvIRKMw5PAn8+n0bX4pmtNrVYYyoyREPN12L9nAPQ==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr31088168wrw.116.1637244837135; 
 Thu, 18 Nov 2021 06:13:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRmRZMb/6y0o8yFVybLlqekYVbUvQMXOPzEQUQFU3FUjZl7gDWBsRjL/WMT6zT2djvOBLfxP9vJguwPr0+AGk=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr31088142wrw.116.1637244836983; 
 Thu, 18 Nov 2021 06:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20211118030413.2610-1-skeggsb@gmail.com>
In-Reply-To: <20211118030413.2610-1-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 18 Nov 2021 15:13:46 +0100
Message-ID: <CACO55tuyS+wA5zK7k2rT5PyTHFuGD-3MfmpcX2h5B+v+nH-FKg@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau: recognise GA106
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Cc: stable?

On Thu, Nov 18, 2021 at 4:04 AM Ben Skeggs <skeggsb@gmail.com> wrote:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> I've got HW now, appears to work as expected so far.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index b51d690f375f..88d262ba648c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2626,6 +2626,27 @@ nv174_chipset = {
>         .fifo     = { 0x00000001, ga102_fifo_new },
>  };
>
> +static const struct nvkm_device_chip
> +nv176_chipset = {
> +       .name = "GA106",
> +       .bar      = { 0x00000001, tu102_bar_new },
> +       .bios     = { 0x00000001, nvkm_bios_new },
> +       .devinit  = { 0x00000001, ga100_devinit_new },
> +       .fb       = { 0x00000001, ga102_fb_new },
> +       .gpio     = { 0x00000001, ga102_gpio_new },
> +       .i2c      = { 0x00000001, gm200_i2c_new },
> +       .imem     = { 0x00000001, nv50_instmem_new },
> +       .mc       = { 0x00000001, ga100_mc_new },
> +       .mmu      = { 0x00000001, tu102_mmu_new },
> +       .pci      = { 0x00000001, gp100_pci_new },
> +       .privring = { 0x00000001, gm200_privring_new },
> +       .timer    = { 0x00000001, gk20a_timer_new },
> +       .top      = { 0x00000001, ga100_top_new },
> +       .disp     = { 0x00000001, ga102_disp_new },
> +       .dma      = { 0x00000001, gv100_dma_new },
> +       .fifo     = { 0x00000001, ga102_fifo_new },
> +};
> +
>  static const struct nvkm_device_chip
>  nv177_chipset = {
>         .name = "GA107",
> @@ -3072,6 +3093,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>                 case 0x168: device->chip = &nv168_chipset; break;
>                 case 0x172: device->chip = &nv172_chipset; break;
>                 case 0x174: device->chip = &nv174_chipset; break;
> +               case 0x176: device->chip = &nv176_chipset; break;
>                 case 0x177: device->chip = &nv177_chipset; break;
>                 default:
>                         if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
> --
> 2.31.1
>

