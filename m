Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F32515BE8
	for <lists+nouveau@lfdr.de>; Sat, 30 Apr 2022 11:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86A10E069;
	Sat, 30 Apr 2022 09:23:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31B310E069
 for <nouveau@lists.freedesktop.org>; Sat, 30 Apr 2022 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651310622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vtuxsDJkfuXL6miXD7Jn/4A4oW+gIOESPprjyWMnzo4=;
 b=cSZVUBLNeDi+HGB9VaQDAec4GCQAm4lefFLnJmEQo3qnADS810p9FrPJspSgWyayhsTIwv
 FfqQjN782TGRySqMPq4MvsBtj3me/98NAocPaEjQHfO2mOiIuLc6rpWj1sv++8j/5LgVrm
 vbdO3pTR1p8dk/YcGG7k54FcIozBfVI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-n_TuIre6MJuPo81tQgRrsA-1; Sat, 30 Apr 2022 05:23:39 -0400
X-MC-Unique: n_TuIre6MJuPo81tQgRrsA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s8-20020adf9788000000b0020adb01dc25so3935821wrb.20
 for <nouveau@lists.freedesktop.org>; Sat, 30 Apr 2022 02:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtuxsDJkfuXL6miXD7Jn/4A4oW+gIOESPprjyWMnzo4=;
 b=ItI4+QgA03iIwYxbE4lEkbL5bJimSsSSAljJUZVGiQYoVDp8LBg753V/KowUmZG1id
 udNtzwCdF2OX20Ngwrx+w04JkacxvYhbdXZCNHsqtx7VebqTwIGiY/c/FeocThMC7zqA
 79t3SeB55o3FbIFqKNDfDqoJQt6/ULxcrnXZ/0D3mS6rAwFgmC+kr5bOqh5vri7Jn6/W
 1GtoizJXbPI1bUawQT+HtYTRUlxLjxBibNsYxZGPu4aVOOSxqOJI8C+bo+d3rMG19ojc
 vUDcJ+CK9Hmw0j6RZzwTlAyzWNW2QkaGLuy4jbg3lBFt/gHX8TYS7eGxIMoRj60dzSWF
 SoSA==
X-Gm-Message-State: AOAM532LErrwS+Q/wvrclu0HQQNA2+NZTFC2v0774snqVC5NES++Cwxb
 TklWQxskfmZjg5zLuBb/eGEhh05Pe7ADezaApWi+lMZ2DgkP/6T2phdFsPkC5Q0k7al5eNMWCqP
 04hp4bJ0DRYngdnITwcGXa/zE0jstIXm8oRvOngh1Pw==
X-Received: by 2002:a5d:63ce:0:b0:20a:da1f:aac5 with SMTP id
 c14-20020a5d63ce000000b0020ada1faac5mr2414839wrw.589.1651310617316; 
 Sat, 30 Apr 2022 02:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhbPMzvtiZB7DFBDu/2Xo3/oLs+WbuEtAxdifccx6w8NMhRTQ2NwYInGVxhJwprDQmVu6Y/wqTwaouLsZZLVI=
X-Received: by 2002:a5d:63ce:0:b0:20a:da1f:aac5 with SMTP id
 c14-20020a5d63ce000000b0020ada1faac5mr2414820wrw.589.1651310616990; Sat, 30
 Apr 2022 02:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220429195350.85620-1-lyude@redhat.com>
 <CACO55tuY6ACoW5jgRk8jCVZ_ZZDEBXczkaiTSpFDvw2h81r=xA@mail.gmail.com>
 <a16299814fbbb4cad99f7c7bc9b83c7c31b63a69.camel@redhat.com>
In-Reply-To: <a16299814fbbb4cad99f7c7bc9b83c7c31b63a69.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 30 Apr 2022 11:23:26 +0200
Message-ID: <CACO55ttVm0fkUd91E_FHUdvP5HDDk3+qKyJoRYVPGmp-TukNAA@mail.gmail.com>
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

On Sat, Apr 30, 2022 at 1:04 AM Lyude Paul <lyude@redhat.com> wrote:
>
> On Sat, 2022-04-30 at 00:56 +0200, Karol Herbst wrote:
> > On Fri, Apr 29, 2022 at 9:54 PM Lyude Paul <lyude@redhat.com> wrote:
> > >
> > > There's plenty of ways to fudge the GPU when developing on nouveau by
> > > mistake, some of which can result in nouveau seriously spamming dmesg with
> > > fault errors. This can be somewhat annoying, as it can quickly overrun the
> > > message buffer (or your terminal emulator's buffer) and get rid of
> > > actually
> > > useful feedback from the driver. While working on my new atomic only MST
> > > branch, I ran into this issue a couple of times.
> > >
> > > So, let's fix this by adding nvkm_error_ratelimited(), and using it to
> > > ratelimit errors from faults. This should be fine for developers, since
> > > it's nearly always only the first few faults that we care about seeing.
> > > Plus, you can turn off rate limiting in the kernel if you really need to.
> > >
> >
> > good idea :)
> >
> > Although I think we ultimately need a detection of "GPU state is
> > trashed" where we cease to do anything and disable interrupts as some
> > of those issues actually cause the kernel to get DOSed by nouveau
> > spamming/handling interrupts. Not sure if we should go with this patch
> > in the meantime, or if we should just go straight ahead and disable
> > interrupts, which would also stop the spam.
> >
> > Do you know if this patch here is enough to get the system to reboot
> > normally or is it only spamming less?
>
> I'd have to try to come up with a setup that can hit this again, although it
> might not be that hard - last time I hit this it was because I was programming
> the wrong PBN values for MST payloads into nvidia's hardware.
>
> So I can't remember for sure if I could reboot, but I do know I could actually
> log into the system easily and do stuff with ratelimiting applied so it's
> definitely better then the current situation.
>

I can play around with your patch a little, as with broken
multithreading and OpenCL I can trash my entire machine within split
seconds quite reliably :)

> >
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
> > >  4 files changed, 15 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > index 1665738948fb..96113c8bee8c 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > > @@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
> > >  #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
> > >  #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
> > >  #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
> > > +
> > > +#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR,
> > > err_ratelimited, f, ##a)
> > >  #endif
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > index 53a6651ac225..80b5aaceeaad 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > > @@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
> > >                 u32 addr = nvkm_rd32(device, 0x009084);
> > >                 u32 data = nvkm_rd32(device, 0x009088);
> > >
> > > -               nvkm_error(subdev,
> > > -                          "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> > > -                          (addr & 0x00000002) ? "write" : "read", data,
> > > -                          (addr & 0x00fffffc),
> > > -                          (stat & 0x00000002) ? "!ENGINE " : "",
> > > -                          (stat & 0x00000004) ? "PRIVRING " : "",
> > > -                          (stat & 0x00000008) ? "TIMEOUT " : "");
> > > +               nvkm_error_ratelimited(subdev,
> > > +                                      "MMIO %s of %08x FAULT at %06x [
> > > %s%s%s]\n",
> > > +                                      (addr & 0x00000002) ? "write" :
> > > "read", data,
> > > +                                      (addr & 0x00fffffc),
> > > +                                      (stat & 0x00000002) ? "!ENGINE " :
> > > "",
> > > +                                      (stat & 0x00000004) ? "PRIVRING " :
> > > "",
> > > +                                      (stat & 0x00000008) ? "TIMEOUT " :
> > > "");
> > >
> > >                 nvkm_wr32(device, 0x009084, 0x00000000);
> > >                 nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > index ad8da523bb22..c75e463f3501 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > > @@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
> > >                 u32 addr = nvkm_rd32(device, 0x009084);
> > >                 u32 data = nvkm_rd32(device, 0x009088);
> > >
> > > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > > -                          (addr & 0x00000002) ? "write" : "read", data,
> > > -                          (addr & 0x00fffffc));
> > > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > > %06x\n",
> > > +                                      (addr & 0x00000002) ? "write" :
> > > "read", data,
> > > +                                      (addr & 0x00fffffc));
> > >
> > >                 stat &= ~0x00000008;
> > >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > index 3a1e45adeedc..2055d0b100d3 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > > @@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
> > >                 u32 addr = nvkm_rd32(device, 0x009084);
> > >                 u32 data = nvkm_rd32(device, 0x009088);
> > >
> > > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > > -                          (addr & 0x00000002) ? "write" : "read", data,
> > > -                          (addr & 0x00fffffc));
> > > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > > %06x\n",
> > > +                                      (addr & 0x00000002) ? "write" :
> > > "read", data,
> > > +                                      (addr & 0x00fffffc));
> > >
> > >                 stat &= ~0x00000008;
> > >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > > --
> > > 2.35.1
> > >
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

