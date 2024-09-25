Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA192985040
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2024 03:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A649010E90F;
	Wed, 25 Sep 2024 01:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HaQrjDeY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C1510E908
 for <nouveau@lists.freedesktop.org>; Wed, 25 Sep 2024 01:08:53 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a8d43657255so948823566b.0
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2024 18:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727226532; x=1727831332; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wFAUhxj4Kr7iOTjExUj5M2PBKlhGdBn7aCFOohPbPc8=;
 b=HaQrjDeYGjj4exac6yzF4KsNK06OXhQeKdPM0pZATPRx9lwqc/vIUDJS16GwDxBVbU
 5gzRme7HMR7w8x6pBlWJxqVUYpfYFIY0tK6PziuAazQGsXHmJondMEaS/6P+0HqiwZJ1
 W+RNJoNqaKR6uaCqmDlz4aHc4otH8UF7Zn/29MVXg2tCHjdLmSI5kIIAdsZo65Hn5We0
 5sqWHlQ53xHHOdNL3d+KXvziMw8ISSbgFWBWRJGmmFnZ62yL4Pdh4mJpY9fN1fB4K+Et
 rIwl6eba4RCcyidgctZKQfW9iohMF69VL+gNSLPbS8stWosNcbkz3sWvAMtFpIVnnqNy
 RxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727226532; x=1727831332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wFAUhxj4Kr7iOTjExUj5M2PBKlhGdBn7aCFOohPbPc8=;
 b=QgV/K8ExYyKVvMfhe/Jk6rwuDcULzqBIQqNiXhL3ctTg1t2BDovxWhb4rnZVfOG0I6
 NwiVKJOQ9u4LGJCZPsEsZw1XsTGH2/kFhhXipJG3SibiPeB+Vi0F4cDUBSDs9ETM/eq8
 Ra6PhHDbfre86GxUkHjau+NTQMHv6ACgrXmdLJF4uNtHBoB4unw5iFRcGuK1y/ny/mUO
 AYg1dZFGoelKQGXB0xptCQ6sDRrt3AA+Y3j87l8jwaG6lFPyrrbxnKfRrU0cEMmA2Eb1
 ssOUUgcZQyHVr2Nd+m8Offq2zRkgV/sF+FgZSJcwV/96xvgvjqe9IcDIVvt2rSAPWUUU
 D3Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMnJsq171Nhc0OtS7EB6C/i2WLABjoNhS+bI37HlaKfSTONg6zFJca3mlgJJP3DaxGGgH8B+8g@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxhfd/UdeVwZE9WRh5VgZEv0k4M6h3LXimQgA2C8uroIbD5sHS6
 j2hqRgmpvz0WAyyPYxT/C0UG1jZbsKOH2Qlcq2Pi+gt1XDPBAbQXODp5UPwMD8ZkdHxtJPCSc6y
 xSAdqV8lv5yCXt4cd8CzUdDaEPw8=
X-Google-Smtp-Source: AGHT+IEIjo509tzx3eRQJC8AkaBkgUW0IgYo/PQA10yu/71sYo7VaaTNdbJJ8jeexI8JmtiSLjp03DQBUL6S4sxDKaY=
X-Received: by 2002:a17:907:709:b0:a8d:f04:b19b with SMTP id
 a640c23a62f3a-a93a0341d2cmr77597466b.2.1727226531995; Tue, 24 Sep 2024
 18:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux>
 <20240923150140.GB9417@nvidia.com> <ZvHwzzp2F71W8TAs@pollux.localdomain>
 <20240924164151.GJ9417@nvidia.com> <ZvMZisyZFO888N0E@cassiopeiae>
 <20240925005319.GP9417@nvidia.com>
In-Reply-To: <20240925005319.GP9417@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 Sep 2024 11:08:40 +1000
Message-ID: <CAPM=9txix6tO7B+kRtsNXSVPfLGU4vbfga=pt9yqmszecuEbyw@mail.gmail.com>
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

On Wed, 25 Sept 2024 at 10:53, Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Tue, Sep 24, 2024 at 09:56:58PM +0200, Danilo Krummrich wrote:
>
> > Currently - and please correct me if I'm wrong - you make it sound to me as if
> > you're not willing to respect the decisions that have been taken by Nouveau and
> > DRM maintainers.
>
> I've never said anything about your work, go do Nova, have fun.
>
> I'm just not agreeing to being forced into taking Rust dependencies in
> VFIO because Nova is participating in the Rust Experiment.
>
> I think the reasonable answer is to accept some code duplication, or
> try to consolidate around a small C core. I understad this is
> different than you may have planned so far for Nova, but all projects
> are subject to community feedback, especially when faced with new
> requirements.
>
> I think this discussion is getting a little overheated, there is lots
> of space here for everyone to do their things. Let's not get too
> excited.

How do you intend to solve the stable ABI problem caused by the GSP firmware?

If you haven't got an answer to that, that is reasonable, you can talk
about VFIO and DRM and who is in charge all you like, but it doesn't
matter.

Fundamentally the problem is the unstable API exposure isn't something
you can build a castle on top of, the nova idea is to use rust to
solve a fundamental problem with the NVIDIA driver design process
forces on us (vfio included), I'm not seeing anything constructive as
to why doing that in C would be worth the investment. Nothing has
changed from when we designed nova, this idea was on the table then,
it has all sorts of problems leaking the unstable ABI that have to be
solved, and when I see a solution for that in C that is maintainable
and doesn't leak like a sieve I might be interested, but you know keep
thinking we are using rust so we can have fun, not because we are
using it to solve maintainability problems caused by an internal
NVIDIA design decision over which we have zero influence.

Dave.
