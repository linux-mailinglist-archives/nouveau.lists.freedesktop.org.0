Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8CBA2B826
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E5B10E9DA;
	Fri,  7 Feb 2025 01:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="dpSKOgC6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8884A10E9AB
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 16:09:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so7254155e9.2
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 08:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738253388; x=1738858188; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHjECDXWr9DtzEWz0JXb8DxrPMtRT+1WnFwQ9T4qTYY=;
 b=dpSKOgC6QI62i9gw4CbPr9/y+tMNWBEX/lKXC/rApPeCgZ4Q6Ihx6ummAr5Sp5i6KZ
 lKYHLYnHQzw7CT7lctoqypYW0YNzl4Yh8jQzhtgTP9NPtSfF+7n43skylIn81Kn7vUdg
 mEqiOgjW6gALIiQEoa2wHzpfB8zFH7q/z35J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738253388; x=1738858188;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHjECDXWr9DtzEWz0JXb8DxrPMtRT+1WnFwQ9T4qTYY=;
 b=EKyf9NdyC8Kehh56UdqgbJPMlBc646wPRvEIKTO6X60GA8it0oZTSLlJJYhit5mgs0
 iz89euejR0wJ5D/IES4C4vyDPfM/hzM64121/MnlSMkNp1l8tc1ud6jRafUHWK7ZoiCO
 Ukb6xgW+XZ1CJA8HiMYTqeSGrFhVD6WlLopboTff/SYYknRqoixR6CKPbAaTfTUdyvKb
 VNAW5mddeprJh6duP9s+aK6Nujd+K5xVNvpqhGmK39soIRqZBLM8h9zfjttsNRCs24Gt
 WuUqw+OA045eNu8tfnhBS+AJBWVFowU2/2vpavH4G9fCVKWvpaCLPUWZoxGfWBqEyLGe
 YCFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo164requZ/jYvMXysO2X0SxZMlQpItko6E6NWKzxRqkNQogUI9ZF2d3wjdvbYZYW345PUa4Sw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/TYYA2XTbR5OEJYHy6uKeRtHhWnU6gn2Xfxz44IPjomme/qL4
 MExysofjzna3LOKUb71yFGrPE+PU0RcQghODLgoqWaOTM9WGk6XoXsU6PAjDZHM=
X-Gm-Gg: ASbGncu9TU4wSaKb1Bt627rst/+zB0QItkVabkJB2+C5ZW6haySWbo7L7teYlfK/1OD
 YJf7JHfhSf+Fnxt5JPrbfn3mwFCltym3790bLb7203SaSP/U60t/CpMyP1nK7hf52H1N+XFpbKT
 GLSfu4vwTMocR+yZHJaukAxd/VHW7WfhlmITq/Q+CqmvMPKDt9l3NV4WJd6tjL1FN+mehsvT7PU
 nkQ3KZoCZFvEpwZ8FHm0QuCQluRgsACL3tNfF0TT7K4+5Ne4SgAufOA/ar4C5CWklD70I6jzTuR
 D0t5vOn95WdikM61xQnx9yZ+dwg=
X-Google-Smtp-Source: AGHT+IHzkAlG33CPN/kMrEln846pAhOyRPiLkWV/nev8K+POyx7veXX/IQAiWwM1YsBE7oYiCeZW/A==
X-Received: by 2002:a05:600c:1e0d:b0:436:f960:3427 with SMTP id
 5b1f17b1804b1-438dc40ffbbmr65699075e9.22.1738253387756; 
 Thu, 30 Jan 2025 08:09:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2ef08sm64120395e9.22.2025.01.30.08.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 08:09:46 -0800 (PST)
Date: Thu, 30 Jan 2025 17:09:44 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <7282ac68c47886caa2bc2a2813d41a04adf938e1.camel@linux.intel.com>
 <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130132317.GG2120662@ziepe.ca>
X-Operating-System: Linux phenom 6.12.11-amd64 
X-Mailman-Approved-At: Fri, 07 Feb 2025 01:42:11 +0000
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

On Thu, Jan 30, 2025 at 09:23:17AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 30, 2025 at 11:50:27AM +0100, Simona Vetter wrote:
> > On Wed, Jan 29, 2025 at 09:47:57AM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 29, 2025 at 02:38:58PM +0100, Simona Vetter wrote:
> > > 
> > > > > The pgmap->owner doesn't *have* to fixed, certainly during early boot before
> > > > > you hand out any page references it can be changed. I wouldn't be
> > > > > surprised if this is useful to some requirements to build up the
> > > > > private interconnect topology?
> > > > 
> > > > The trouble I'm seeing is device probe and the fundemantal issue that you
> > > > never know when you're done. And so if we entirely rely on pgmap->owner to
> > > > figure out the driver private interconnect topology, that's going to be
> > > > messy. That's why I'm also leaning towards both comparing owners and
> > > > having an additional check whether the interconnect is actually there or
> > > > not yet.
> > > 
> > > Hoenstely, I'd rather invest more effort into being able to update
> > > owner for those special corner cases than to slow down the fast path
> > > in hmm_range_fault..
> > 
> > I'm not sure how you want to make the owner mutable.
> 
> You'd probably have to use a system where you never free them until
> all the page maps are destroyed.
> 
> You could also use an integer instead of a pointer to indicate the
> cluster of interconnect, I think there are many options..

Hm yeah I guess an integer allocater of the atomic_inc kind plus "surely
32bit is enough" could work. But I don't think it's needed, if we can
reliable just unregister the entire dev_pagemap and then just set up a new
one. Plus that avoids thinking about which barriers we might need where
exactly all over mm code that looks at the owner field.

> > And I've looked at the lifetime fun of unregistering a dev_pagemap for
> > device hotunplug and pretty firmly concluded it's unfixable and that I
> > should run away to do something else :-P
> 
> ? It is supposed to work, it blocks until all the pages are freed, but
> AFAIK ther is no fundamental life time issue. The driver is
> responsible to free all its usage.

Hm I looked at it again, and I guess with the fixes to make migration to
system memory work reliable in Matt Brost's latest series it should indeed
work reliable. The devm_ version still freaks me out because of how easily
people misuse these for things that are memory allocations.

> > An optional callback is a lot less scary to me here (or redoing
> > hmm_range_fault or whacking the migration helpers a few times) looks a lot
> > less scary than making pgmap->owner mutable in some fashion.
> 
> It extra for every single 4k page on every user :\
> 
> And what are you going to do better inside this callback?

Having more comfy illusions :-P

Slightly more seriously, I can grab some locks and make life easier,
whereas sprinkling locking or even barriers over pgmap->owner in core mm
is not going to fly. Plus more flexibility, e.g. when the interconnect
doesn't work for atomics or some other funny reason it only works for some
of the traffic, where you need to more dynamically decide where memory is
ok to sit. Or checking p2pdma connectivity and all that stuff.

But we can also do all that stuff by checking afterwards or migrating
memory around as needed. At least for drivers who cooperate and all set
the same owner, which I think is Thomas' current plan.

Also note that fundamentally you can't protect against the hotunplug or
driver unload case for hardware access. So some access will go to nowhere
when that happens, until we've torn down all the mappings and migrated
memory out.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
