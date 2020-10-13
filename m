Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88928CF9E
	for <lists+nouveau@lfdr.de>; Tue, 13 Oct 2020 15:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A81316E8F6;
	Tue, 13 Oct 2020 13:56:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C0B6E8F7
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602597374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MXhZXZnRgq+5G/YqSJjLse8+J3mllNF/9kf04GLJT0s=;
 b=Wfu++21jKD4woIoTz/Janx10UkiN9DoiaUamhPLyXNQ5ukzs9XhEwjWjbos3VkE8SW8Muf
 wGbOVcThTuxZNHMBwj0OLjxCxW9W47f5fDaIg30HoShs/cGusz5uVG6vHFSYTJE67xvpY5
 5wxEqQBfj+E3bMbzDG/4kvpOE/7Rx4c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-FEJ3_B5LMAiCMG12mgnwhQ-1; Tue, 13 Oct 2020 09:56:12 -0400
X-MC-Unique: FEJ3_B5LMAiCMG12mgnwhQ-1
Received: by mail-qv1-f72.google.com with SMTP id o14so30651qve.7
 for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2020 06:56:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXhZXZnRgq+5G/YqSJjLse8+J3mllNF/9kf04GLJT0s=;
 b=UlGOMOHAL7fXiLjNlfey8IUOvU69thTm13zCZdND66bVzNd1Rque9A/gVQYZWzYhRB
 Lt5RLxI0YOXRMQj2YVS/xOCll+fBAMxamyRsU9IIMfPbgVnZ5qWDa/rr6o26H77GnGzT
 IWS1aKdzjbNBaYj4C0ansjC6aOkg06qn0VbFXHJk1DJ1ihJh3rx/gxxHKzaJXpjjYCqY
 o6RaeLYrwElZzok6ClxP0krBaZI0eyW+iJGNG98McjK5hqsnnszdvyECd+65/Tw1+/Jj
 MIof9K+8kYLWPGV1WLKZ/3pKvcgACJehXlf7KjboM0l3m/ly6tv/DmnpV0/kUjws1GKS
 SVTA==
X-Gm-Message-State: AOAM531nFyw+sOWomSlFjZUJJkhBXt3CpUgUWgOa4Jcg7AJqip+8PAgt
 xow+TAXXbvA+TvYld18k8DfYWXBnE1Rc8x6obstxI8TPgJEJX1an9ASV12KGGrYpSzsNQzuLraJ
 4sCcS2SVgBXhz9muuf09atJ69CaxRVjKEEA2krDIEfQ==
X-Received: by 2002:a0c:fa4f:: with SMTP id k15mr12070150qvo.60.1602597371994; 
 Tue, 13 Oct 2020 06:56:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyy/Tty0YzHELGZQ7nAWwOj4/s7JCQHdIz5kQ+Vs48l4Je9lUZaTm+fGNv1OYV74FNk1ydKJAxEIHCizhbMVI=
X-Received: by 2002:a0c:fa4f:: with SMTP id k15mr12070127qvo.60.1602597371683; 
 Tue, 13 Oct 2020 06:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201013120126.59411-1-kherbst@redhat.com>
 <CAKb7UviY1aYvvCk_yK6eHfvR322XG3b_Aq60XcGb0NUNBAw7Gw@mail.gmail.com>
In-Reply-To: <CAKb7UviY1aYvvCk_yK6eHfvR322XG3b_Aq60XcGb0NUNBAw7Gw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Oct 2020 15:56:00 +0200
Message-ID: <CACO55tsW4-Anc3nCaFMHcJsLrbe=NMxDLw+ifXHrSuY9=S9cZw@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/device: fix changing endianess
 code to work on older GPUs
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
Cc: 202010101049.37663.linux@zary.sk, Ondrej Zary <linux@zary.sk>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 3:55 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Tue, Oct 13, 2020 at 8:01 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > With this we try to detect if the endianess switch works and assume LE if
> > not. Suggested by Ben.
> >
> > Fixes: 51c05340e407 ("drm/nouveau/device: detect if changing endianness failed")
> > ---
> >  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 39 ++++++++++++-------
> >  1 file changed, 26 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > index dcb70677d0acc..7851bec5f0e5f 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > @@ -2924,17 +2924,34 @@ nvkm_device_del(struct nvkm_device **pdevice)
> >         }
> >  }
> >
> > +/* returns true if the GPU is in the CPU native byte order */
> >  static inline bool
> >  nvkm_device_endianness(struct nvkm_device *device)
> >  {
> > -       u32 boot1 = nvkm_rd32(device, 0x000004) & 0x01000001;
> >  #ifdef __BIG_ENDIAN
> > -       if (!boot1)
> > -               return false;
> > +       const bool big_endian = true;
> >  #else
> > -       if (boot1)
> > -               return false;
> > +       const bool big_endian = false;
> >  #endif
> > +
> > +       /* Read NV_PMC_BOOT_1, and assume non-functional endian switch if it
> > +        * doesn't contain the expected values.
> > +        */
> > +       u32 pmc_boot_1 = nvkm_rd32(device, 0x000004);
> > +       if (pmc_boot_1 && pmc_boot_1 != 0x01000001)
>
> Are you sure there are no other bits in there, esp on newer GPUs?
>

Fairly. Checked on GP107 today, which is nearly the last gen to even
support it. I think it's gone with volta or turing.

> > +               return !big_endian; /* Assume GPU is LE in this case. */
> > +
> > +       /* 0 means LE and 0x01000001 means BE GPU. Condition is true when
> > +        * GPU/CPU endianness don't match.
> > +        */
> > +       if (big_endian == !pmc_boot_1) {
> > +               nvkm_wr32(device, 0x000004, 0x01000001);
> > +               nvkm_rd32(device, 0x000000);
> > +               if (nvkm_rd32(device, 0x000004) != (big_endian ? 0x01000001 : 0x00000000))
> > +                       return !big_endian; /* Assume GPU is LE on any unexpected read-back. */
> > +       }
> > +
> > +       /* CPU/GPU endianness should (hopefully) match. */
> >         return true;
> >  }
> >
> > @@ -2987,14 +3004,10 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
> >         if (detect) {
> >                 /* switch mmio to cpu's native endianness */
> >                 if (!nvkm_device_endianness(device)) {
> > -                       nvkm_wr32(device, 0x000004, 0x01000001);
> > -                       nvkm_rd32(device, 0x000000);
> > -                       if (!nvkm_device_endianness(device)) {
> > -                               nvdev_error(device,
> > -                                           "GPU not supported on big-endian\n");
> > -                               ret = -ENOSYS;
> > -                               goto done;
> > -                       }
> > +                       nvdev_error(device,
> > +                                   "Couldn't switch GPU to CPUs endianess\n");
> > +                       ret = -ENOSYS;
> > +                       goto done;
> >                 }
> >
> >                 boot0 = nvkm_rd32(device, 0x000000);
> > --
> > 2.26.2
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
