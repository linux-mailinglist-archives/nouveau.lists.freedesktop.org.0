Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386CC51AD4F
	for <lists+nouveau@lfdr.de>; Wed,  4 May 2022 20:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BED10E44A;
	Wed,  4 May 2022 18:49:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C8010E548
 for <nouveau@lists.freedesktop.org>; Wed,  4 May 2022 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651690197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m4be0lUN3rLKvbTqi1ev9U0hEQDKuQCw8SDgLXDDtQ8=;
 b=ADS5cvZHJn9im/SO2nU2KnTP0yb8KzkQGbPba1IAk3b8Lka5abygMqMPrG5zFmtHi+PSKc
 +L8ba1HIk4h13dLNHJcGEXkBXxw2iS/GgEnHhQQIlcoewd0o0gWZ9X1OH4cqRgkqU5nmi4
 Mg/FyJ+xB3qJT1j6dgz+mgtpcmZ2b3s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-CniPc0LnOqmLBpfsWJzZxA-1; Wed, 04 May 2022 14:49:56 -0400
X-MC-Unique: CniPc0LnOqmLBpfsWJzZxA-1
Received: by mail-qv1-f71.google.com with SMTP id
 kj4-20020a056214528400b0044399a9bb4cso1513076qvb.15
 for <nouveau@lists.freedesktop.org>; Wed, 04 May 2022 11:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=m4be0lUN3rLKvbTqi1ev9U0hEQDKuQCw8SDgLXDDtQ8=;
 b=nxLxWavENsjyXS17Giuk3YjOz5yUZT11JCuLuYKdWv40CGdAfSE1ojVy9jM5BsGSJp
 juShP/qYQbAmS9+EBLWX6CR5AYwkG9bRXXL5MXErEsRRaH57ZualQBo2/y7nNy+h7V7J
 a2IxpCalMVmNCLqI/Y++mzN+qpttypy4hFjzBHe/WLuvqMLt4opm2XOp4Xl1Y9YuP9p2
 JzBATSYvuwGnGxoNGamgnd18sNb0ycueM+n1Acaq1CgJk5esn+TRGyGDCLK5iNSbF4vh
 6HoQV27683FBB29hHu+BFfBXhYb7sGkN3niqh4LzKjoPTd3iLYut6GYSnfDvLYcAs3lX
 V0AA==
X-Gm-Message-State: AOAM531nQ33ckrHJmUpmuV4Kbc/BQsbFzoQMAlhgxyScbGkPeLPd54OY
 twbDGQHASZK9ifh3FemuXNA5L37w66eOjcq/7zFg8RSAmGO/1xHoXU1AbOlPo5J5Av0feSrGh9i
 6ObY/+SocH33/sAlk70dBD2fwHA==
X-Received: by 2002:ac8:4e8f:0:b0:2f3:83ef:f06b with SMTP id
 15-20020ac84e8f000000b002f383eff06bmr20138274qtp.344.1651690194881; 
 Wed, 04 May 2022 11:49:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG+YEE9640XC9Q0TxKXIOu4OYQRb9HIa17dkwYt7i3SPR51ROIyeLOHCH0GKjio7e5whfd8A==
X-Received: by 2002:ac8:4e8f:0:b0:2f3:83ef:f06b with SMTP id
 15-20020ac84e8f000000b002f383eff06bmr20138250qtp.344.1651690194570; 
 Wed, 04 May 2022 11:49:54 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 o26-20020ac872da000000b002f39b99f6afsm7565524qtp.73.2022.05.04.11.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 11:49:53 -0700 (PDT)
Message-ID: <8c3592767ac4c3d4c3bcb0294d97aff5a7375319.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Date: Wed, 04 May 2022 14:49:52 -0400
In-Reply-To: <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
References: <20220429195350.85620-1-lyude@redhat.com>
 <CACO55ttsBxe6V88CTtGZgUj8k+gT+ne+FD_9FD_OxowF1XG5Bg@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 2022-05-03 at 21:23 +0200, Karol Herbst wrote:
> not able to hit any error on my machine, but regardless:
> 
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
> 
> I suspect there are more places where we could put it, but we can add
> those later.
> 
> Anyway, I think it's valuable to push it through fixes, not sure how
> far back we want to CC stable though.

JFYI - dim fixes can figure this out if you just give it the commit that
introduced the issue.

Anyway, will push this upstream in a moment

> 
> On Fri, Apr 29, 2022 at 9:54 PM Lyude Paul <lyude@redhat.com> wrote:
> > 
> > There's plenty of ways to fudge the GPU when developing on nouveau by
> > mistake, some of which can result in nouveau seriously spamming dmesg with
> > fault errors. This can be somewhat annoying, as it can quickly overrun the
> > message buffer (or your terminal emulator's buffer) and get rid of
> > actually
> > useful feedback from the driver. While working on my new atomic only MST
> > branch, I ran into this issue a couple of times.
> > 
> > So, let's fix this by adding nvkm_error_ratelimited(), and using it to
> > ratelimit errors from faults. This should be fine for developers, since
> > it's nearly always only the first few faults that we care about seeing.
> > Plus, you can turn off rate limiting in the kernel if you really need to.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |  2 ++
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c    | 14 +++++++-------
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c     |  6 +++---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c     |  6 +++---
> >  4 files changed, 15 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > index 1665738948fb..96113c8bee8c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h
> > @@ -62,4 +62,6 @@ void nvkm_subdev_intr(struct nvkm_subdev *);
> >  #define nvkm_debug(s,f,a...) nvkm_printk((s), DEBUG,   info, f, ##a)
> >  #define nvkm_trace(s,f,a...) nvkm_printk((s), TRACE,   info, f, ##a)
> >  #define nvkm_spam(s,f,a...)  nvkm_printk((s),  SPAM,    dbg, f, ##a)
> > +
> > +#define nvkm_error_ratelimited(s,f,a...) nvkm_printk((s), ERROR,
> > err_ratelimited, f, ##a)
> >  #endif
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > index 53a6651ac225..80b5aaceeaad 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/gf100.c
> > @@ -35,13 +35,13 @@ gf100_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> > 
> > -               nvkm_error(subdev,
> > -                          "MMIO %s of %08x FAULT at %06x [ %s%s%s]\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc),
> > -                          (stat & 0x00000002) ? "!ENGINE " : "",
> > -                          (stat & 0x00000004) ? "PRIVRING " : "",
> > -                          (stat & 0x00000008) ? "TIMEOUT " : "");
> > +               nvkm_error_ratelimited(subdev,
> > +                                      "MMIO %s of %08x FAULT at %06x [
> > %s%s%s]\n",
> > +                                      (addr & 0x00000002) ? "write" :
> > "read", data,
> > +                                      (addr & 0x00fffffc),
> > +                                      (stat & 0x00000002) ? "!ENGINE " :
> > "",
> > +                                      (stat & 0x00000004) ? "PRIVRING " :
> > "",
> > +                                      (stat & 0x00000008) ? "TIMEOUT " :
> > "");
> > 
> >                 nvkm_wr32(device, 0x009084, 0x00000000);
> >                 nvkm_wr32(device, 0x001100, (stat & 0x0000000e));
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > index ad8da523bb22..c75e463f3501 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv31.c
> > @@ -45,9 +45,9 @@ nv31_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> > 
> > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc));
> > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > %06x\n",
> > +                                      (addr & 0x00000002) ? "write" :
> > "read", data,
> > +                                      (addr & 0x00fffffc));
> > 
> >                 stat &= ~0x00000008;
> >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > index 3a1e45adeedc..2055d0b100d3 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bus/nv50.c
> > @@ -60,9 +60,9 @@ nv50_bus_intr(struct nvkm_bus *bus)
> >                 u32 addr = nvkm_rd32(device, 0x009084);
> >                 u32 data = nvkm_rd32(device, 0x009088);
> > 
> > -               nvkm_error(subdev, "MMIO %s of %08x FAULT at %06x\n",
> > -                          (addr & 0x00000002) ? "write" : "read", data,
> > -                          (addr & 0x00fffffc));
> > +               nvkm_error_ratelimited(subdev, "MMIO %s of %08x FAULT at
> > %06x\n",
> > +                                      (addr & 0x00000002) ? "write" :
> > "read", data,
> > +                                      (addr & 0x00fffffc));
> > 
> >                 stat &= ~0x00000008;
> >                 nvkm_wr32(device, 0x001100, 0x00000008);
> > --
> > 2.35.1
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

