Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFA45659D
	for <lists+nouveau@lfdr.de>; Thu, 18 Nov 2021 23:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0421E6E4EC;
	Thu, 18 Nov 2021 22:26:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3E86E4EC
 for <nouveau@lists.freedesktop.org>; Thu, 18 Nov 2021 22:26:33 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id d10so22582028ybe.3
 for <nouveau@lists.freedesktop.org>; Thu, 18 Nov 2021 14:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kk30iqGKovicOAumPd3n2uUe0KtoemK64nSpi1eywUk=;
 b=nctq6mtpzs41jNrVcKT0G4MtD81evL5kLAra+Plg2Kq+gLlCNz1we8c3yRlhmN29H4
 QCz7Oz3pM8/EvVvnH8elBy/YCXDIlTOExB+C2OMijHy/qyXereMwJxMZv+gJ8cyZpNK4
 7NA1zK1/YxN+bg26rrSrYL7i3eYnFuD48900kHXyQ0cicOWuaHr7kKq8tlF/tLYDZHS7
 v/lE5EdHhMKRZOMx/lbpR0Qq45ZnVDvoia3fkdJPPQXWmoXj9Mk6u43iEOmGK2VX+wgN
 k/i+d2cyqPWq/bzbNCULtIfxhBR3ZAH27fJhZNbBglVZPggVqZ1dCLsjhv1cUsCLXyRs
 vCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kk30iqGKovicOAumPd3n2uUe0KtoemK64nSpi1eywUk=;
 b=D7fpJ9tO6aZFCdO4y/aGhyFO3lbLEWTvPgQpdbFtLP8sflJpXBwDiKnroat0mYGoLP
 /YXBHYwBZ79sIbmUOJ3oJqwqE6ByyhupYKswUq6k4iiKjsp1ggQ9tR2ClgijU1p50BJz
 RjpVXAr8FZclr0IU+fdFjATlZ0ZAtmm2R+c6up0JPGNKUFWuym4E2rPAEea77Xv+lSp7
 eFhtHfCWZfA0s43KDA3D63In958cA2On0KU4VW/F5gNMJ3gjXfBS9JY/gwIwBOiqdPg6
 9FW59zqJVihug+9AxXn+TfZP1MHNzbS8NxVy7WrNX9KoNbDNyFLd56htrSXg4d85Bpjg
 KZ+Q==
X-Gm-Message-State: AOAM533eExh0UavFNF16eQg2+lOUw9++vZUvVginYrcHBVQodaukOmB9
 Bb5CgnOhT3ezIBybsJ4bKGwMPUJQi7/DsLAdcgk=
X-Google-Smtp-Source: ABdhPJwuw3rhOGkNUqGPQIWXsZUmYb7uuifFv9G7MqaAY4t0sxBjm26IjW0Q6Fw7POcdWQZ4uCafsRf58zQqFF7aTkg=
X-Received: by 2002:a25:378c:: with SMTP id
 e134mr30005401yba.474.1637274392736; 
 Thu, 18 Nov 2021 14:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20211118030413.2610-1-skeggsb@gmail.com>
 <CACO55tuyS+wA5zK7k2rT5PyTHFuGD-3MfmpcX2h5B+v+nH-FKg@mail.gmail.com>
In-Reply-To: <CACO55tuyS+wA5zK7k2rT5PyTHFuGD-3MfmpcX2h5B+v+nH-FKg@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 19 Nov 2021 08:26:21 +1000
Message-ID: <CACAvsv4EfmtYJrDzkfcWXL-OLy=D7mNVAKEoSfOuOTTDtKdU9A@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
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

On Fri, 19 Nov 2021 at 00:14, Karol Herbst <kherbst@redhat.com> wrote:
>
> Cc: stable?
Yeah, that probably makes sense actually.

>
> On Thu, Nov 18, 2021 at 4:04 AM Ben Skeggs <skeggsb@gmail.com> wrote:
> >
> > From: Ben Skeggs <bskeggs@redhat.com>
> >
> > I've got HW now, appears to work as expected so far.
> >
> > Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > index b51d690f375f..88d262ba648c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > @@ -2626,6 +2626,27 @@ nv174_chipset = {
> >         .fifo     = { 0x00000001, ga102_fifo_new },
> >  };
> >
> > +static const struct nvkm_device_chip
> > +nv176_chipset = {
> > +       .name = "GA106",
> > +       .bar      = { 0x00000001, tu102_bar_new },
> > +       .bios     = { 0x00000001, nvkm_bios_new },
> > +       .devinit  = { 0x00000001, ga100_devinit_new },
> > +       .fb       = { 0x00000001, ga102_fb_new },
> > +       .gpio     = { 0x00000001, ga102_gpio_new },
> > +       .i2c      = { 0x00000001, gm200_i2c_new },
> > +       .imem     = { 0x00000001, nv50_instmem_new },
> > +       .mc       = { 0x00000001, ga100_mc_new },
> > +       .mmu      = { 0x00000001, tu102_mmu_new },
> > +       .pci      = { 0x00000001, gp100_pci_new },
> > +       .privring = { 0x00000001, gm200_privring_new },
> > +       .timer    = { 0x00000001, gk20a_timer_new },
> > +       .top      = { 0x00000001, ga100_top_new },
> > +       .disp     = { 0x00000001, ga102_disp_new },
> > +       .dma      = { 0x00000001, gv100_dma_new },
> > +       .fifo     = { 0x00000001, ga102_fifo_new },
> > +};
> > +
> >  static const struct nvkm_device_chip
> >  nv177_chipset = {
> >         .name = "GA107",
> > @@ -3072,6 +3093,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
> >                 case 0x168: device->chip = &nv168_chipset; break;
> >                 case 0x172: device->chip = &nv172_chipset; break;
> >                 case 0x174: device->chip = &nv174_chipset; break;
> > +               case 0x176: device->chip = &nv176_chipset; break;
> >                 case 0x177: device->chip = &nv177_chipset; break;
> >                 default:
> >                         if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
> > --
> > 2.31.1
> >
>
