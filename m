Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7269B984F6D
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2024 02:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E3510E91C;
	Wed, 25 Sep 2024 00:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EpppM531";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0346510E91C
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2024 00:18:58 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso401705566b.3
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2024 17:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727223536; x=1727828336; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yv16jQk7rEGBbw8xL1Oe3JyYoI/jGzct9FQFpNOnJ2g=;
 b=EpppM531RgKZulwT2tSdE3FYOGkNas/i5OZGkS7qEB378VoexqBZKomUtPGPhtVrRQ
 pl0JAPGnVxdJc1AqUa0PliAbrCKIVxrmWOpXjg7zkFPWv8dewEtPWVaS2+TWCrQnalAM
 JFaVyKHT6elBCk3opFan7foeAD2P96WwtOSaio/YyjsTwLr2Y7ZnILpOXYBBd77stTYl
 l7ACjKIINAhn6J0Xmib6FLT1x6RCBuecN8dqESEzm9DxvZz7OntvYTVS2rCwW4a+jjG+
 ooizMWq8Q1tSUTo8pbqpNzV3EYuv27qg/P7Lh2outitWQJdB7k9bgTjjhbdDg9bKdKjC
 dncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727223536; x=1727828336;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yv16jQk7rEGBbw8xL1Oe3JyYoI/jGzct9FQFpNOnJ2g=;
 b=gOM9fCxcE5/fCBXHbimAJDhA5PpdO/xaRWWN9wtJe4ZMX2dasbnT+VgFWiKuEZPDOd
 J8guSu+0mxmoevG7zI/luE+eL7ZELMo44d8ELSdVEdziKQDTfMaHpa4TBb2Z9c1L6gN+
 /NSHPNCngAGF+hBs6dSHpgAqUrznzXV7nMXDp+XlmYmjjADMrmx5erx5IAxSaEAl57VS
 Sv/RJbVRxCOKGw1t8OK0GYDO9pt9d3wKzx7MXamAehVXMx388kABm6HL+erohZwIwswF
 cpp3HNlMiAyiwl0c28VSt2VGs7gRS1r3g3/ZtHG5Th6HkINQ81VS7mp4BU7ToHEk3aUa
 sNUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt75JbjgOrkqUdJBDrhR0h1KV4dUnLO94P/J76C8H4oni2hSQ72VnA53wEMLRH6yIYmjKoR9Bf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCjoeQ/fLLToGLGtydbMqTbSSRyWVL/LyFpjskRAcaZ60T7Tge
 mnxpxNBcHyPH9DNO3gdqW8FQ/VuH2A5ZwjQIOZ2VU+1ZncCsYYFMpsJaqvBiVqkWPGF4dhZRwUp
 poHMyyBLgwvGXrQRZoqwmNEXRRkE=
X-Google-Smtp-Source: AGHT+IEt67eLPjMCYEnb/Hd0k2bBqedjSfc1C1Ro09JNvTH+9QxA6VQ96hJjaslvRI44SDV9U2WgAsDL1SM/NUINiL0=
X-Received: by 2002:a17:907:d2da:b0:a86:80b7:4743 with SMTP id
 a640c23a62f3a-a93a036904emr82742866b.24.1727223536062; Tue, 24 Sep 2024
 17:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux>
 <20240923150140.GB9417@nvidia.com> <ZvHwzzp2F71W8TAs@pollux.localdomain>
 <20240924164151.GJ9417@nvidia.com> <ZvMZisyZFO888N0E@cassiopeiae>
 <CAPM=9twKGFV8SA165QufaGUev0tnuHABAi0TMvDQSfa7PJfZaQ@mail.gmail.com>
 <20240924234737.GO9417@nvidia.com>
In-Reply-To: <20240924234737.GO9417@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 Sep 2024 10:18:44 +1000
Message-ID: <CAPM=9tx+uU=uceg=Zr4N9=Y28j8kHnBVD+J9sf9xkfJ1xtTXEA@mail.gmail.com>
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 kvm@vger.kernel.org, 
 nouveau@lists.freedesktop.org, alex.williamson@redhat.com, 
 kevin.tian@intel.com, daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com, 
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

>
> Well, no, I am calling a core driver to be the very minimal parts that
> are actually shared between vfio and drm. It should definitely not
> include key parts you want to work on in rust, like the command
> marshaling.

Unfortunately not, the fw ABI is the unsolved problem, rust is our
best solution.

>
> I expect there is more work to do in order to make this kind of split,
> but this is what I'm thinking/expecting.
>
> > > But the whole point of Nova is to replace the NVKM parts of Nouveau, since
> > > that's where the problems we want to solve reside in.
> >
> > Just to re-emphasise for Jason who might not be as across this stuff,
> >
> > NVKM replacement with rust is the main reason for the nova project,
> > 100% the driving force for nova is the unstable NVIDIA firmware API.
> > The ability to use rust proc-macros to hide the NVIDIA instability
> > instead of trying to do it in C by either generators or abusing C
> > macros (which I don't think are sufficient).
>
> I would not include any of this in the very core most driver. My
> thinking is informed by what we've done in RDMA, particularly mlx5
> which has a pretty thin PCI driver and each of the drivers stacked on
> top form their own command buffers directly. The PCI driver primarily
> just does some device bootup, command execution and interrupts because
> those are all shared by the subsystem drivers.
>
> We have a lot of experiance now building these kinds of
> multi-subsystem structures and this pattern works very well.
>
> So, broadly, build your rust proc macros on the DRM Nova driver and
> call a core function to submit a command buffer to the device and get
> back a response.
>
> VFIO will make it's command buffers with C and call the same core
> function.
>
> > I think the idea of a nova drm and nova core driver architecture is
> > acceptable to most of us, but long term trying to main a nouveau based
> > nvkm is definitely not acceptable due to the unstable firmware APIs.
>
> ? nova core, meaning nova rust, meaning vfio depends on rust, doesn't
> seem acceptable ? We need to keep rust isolated to DRM for the
> foreseeable future. Just need to find a separation that can do that.

That isn't going to happen, if we start with that as the default
positioning it won't get us very far.

The core has to be rust, because NVIDIA has an unstable firmware API.
The unstable firmware API isn't some command marshalling, it's deep
down into the depths of it, like memory sizing requirements, base
message queue layout and encoding, firmware init procedures. These are
all changeable at any time with no regard for upstream development, so
upstream development needs to be insulated from these as much as
possible. Using rust provides that insulation layer. The unstable ABI
isn't a solvable problem in the short term, using rust is the
maintainable answer.

Now there are maybe some on/off ramps we can use here that might
provide some solutions to bridge the gap. Using rust in the kernel has
various levels, which we currently tie into one place, but if we
consider different longer term progressions it might be possible to
start with some rust that is easier to backport than other rust might
be etc.

Strategies for moving nvkm core from C to rust in steps, or along a
sliding scale of fws supported could be open for discussion.

The end result though is to have nova core and nova drm in rust, that
is the decision upstream made 6-12 months ago, I don't see any of the
initial reasons for using rust have been invalidated or removed that
warrant revisiting that decision.

Dave.
