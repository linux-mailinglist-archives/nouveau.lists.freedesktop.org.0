Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF98EA2B854
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 02:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508C210E9FB;
	Fri,  7 Feb 2025 01:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="I3w/9KbK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8044F10E3DA
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 16:59:30 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4361c705434so17197035e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 08:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738342769; x=1738947569; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VV6lM3YFA6dZ2gmoOiF/2v5mb84a3EuFvSRPBCXsykU=;
 b=I3w/9KbKfX0TIVjPWnRQhiBUtM5LOz0r7ywA3AaKwAxy8O2SDg0lAOWPPPtZ+rnDYP
 jyYv8kcEUdSU0hNCiRXsULsPI1+wlx+dndvkcEpXJSZB8c/42eBWUlUMdJCzPu3/VR0Y
 HaFPXcHYKzj1sGDh5EZkvh5JIwzoUUhWR4O7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738342769; x=1738947569;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VV6lM3YFA6dZ2gmoOiF/2v5mb84a3EuFvSRPBCXsykU=;
 b=iUDH3+/+p9mMXlq758voUnSRinnJAjXhNK/pfFHfXZKkz7MBRh5MCvRjs+IccTQ8tL
 sC6VktUBVvoo9phvYCL4NQHgOh7FPqr6pCUaySko5prVpK9RZ2+6nADAJIZLMfMwwGQj
 GhQmZTUwHRZwewMLooDKSoavPZcSbXhshr5bwB6cOwoELVC10jUOAr28Y7YYLYWwl5i+
 bw009sI+6lTCO/WGjfjUOoV+7iDFtuw70Q755aC59GsEEzAC5kM/qnVfZBlitf8M5KJg
 WFDo9b66XKwooLxa6K+yQ3lR9mguN19iD8y5YTiReLeDA9rkrKDUNKr5Zf1zM3PjDPhp
 qLrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5TKFzLQdkcEOmz/9wrNes1rNghDhvU7WrxGkV7Di26yHKtKGpMRUE4a0yASWovp+XUAw8+Fcj@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+8YIomyGt3phf1nvMMKhz/GSLmA1UtWIKVFXJmffDINLF50nE
 L1rF3NVbzJU8d3/fL0DP4WQmVoey4IeUq0qs6gCRnUsit5jsxJoRequNvcDIN9c=
X-Gm-Gg: ASbGncvgZH0WFczfFogklGPiH6wO+4KtH0nT4yUlaGbOA6du7q5N7bvb3yBvt1BKVXh
 qodFr0JFhVcr219GykyO5fynF3cMAXmPmYb91KFmr1ewOOBDcgzR5DN9nV/xlsGxljTOq2r37DM
 iC1Xd+C5LcmP6HCY54l8tvwHg4vMYNrCW/xYiBfz9JPPwK4kB3tWl+0YILLPculBontNsBo7YCa
 VFnucg9P3hs+jwInH1EF4/XWFs5161u9hYgKt6WNC9K3KMBQhAVRCBu1YSklDp+D0RvxC4Qf/WB
 jARJjzQIxLiOn80ZquKOd5CD0bs=
X-Google-Smtp-Source: AGHT+IGol4Q1biN5R/T0S8PgIDvIBvNwryDWNshGEwCGFyy4OqFaWpi7Ea88cFCjbaHh4AUGnh4Gfg==
X-Received: by 2002:a05:600c:5119:b0:434:f917:2b11 with SMTP id
 5b1f17b1804b1-438dc40bd8dmr99961815e9.21.1738342768800; 
 Fri, 31 Jan 2025 08:59:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23de2d6sm59965215e9.11.2025.01.31.08.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:59:28 -0800 (PST)
Date: Fri, 31 Jan 2025 17:59:26 +0100
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
Message-ID: <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
References: <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130174217.GA2296753@ziepe.ca>
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

On Thu, Jan 30, 2025 at 01:42:17PM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 30, 2025 at 05:09:44PM +0100, Simona Vetter wrote:
> > > > An optional callback is a lot less scary to me here (or redoing
> > > > hmm_range_fault or whacking the migration helpers a few times) looks a lot
> > > > less scary than making pgmap->owner mutable in some fashion.
> > > 
> > > It extra for every single 4k page on every user :\
> > > 
> > > And what are you going to do better inside this callback?
> > 
> > Having more comfy illusions :-P
> 
> Exactly!
> 
> > Slightly more seriously, I can grab some locks and make life easier,
> 
> Yes, but then see my concern about performance again. Now you are
> locking/unlocking every 4k? And then it still races since it can
> change after hmm_range_fault returns. That's not small, and not really
> better.

Hm yeah, I think that's the death argument for the callback. Consider me
convinced on that being a bad idea.

> > whereas sprinkling locking or even barriers over pgmap->owner in core mm
> > is not going to fly. Plus more flexibility, e.g. when the interconnect
> > doesn't work for atomics or some other funny reason it only works for some
> > of the traffic, where you need to more dynamically decide where memory is
> > ok to sit.
> 
> Sure, an asymmetric mess could be problematic, and we might need more
> later, but lets get to that first..
> 
> > Or checking p2pdma connectivity and all that stuff.
> 
> Should be done in the core code, don't want drivers open coding this
> stuff.

Yeah so after amdkfd and noveau I agree that letting drivers mess this up
isn't great. But see below, I'm not sure whether going all the way to core
code is the right approach, at least for gpu internal needs.

> > Also note that fundamentally you can't protect against the hotunplug or
> > driver unload case for hardware access. So some access will go to nowhere
> > when that happens, until we've torn down all the mappings and migrated
> > memory out.
> 
> I think a literal (safe!) hot unplug must always use the page map
> revoke, and that should be safely locked between hmm_range_fault and
> the notifier.
> 
> If the underlying fabric is loosing operations during an unplanned hot
> unplug I expect things will need resets to recover..

So one aspect where I don't like the pgmap->owner approach much is that
it's a big thing to get right, and it feels a bit to me that we don't yet
know the right questions.

A bit related is that we'll have to do some driver-specific migration
after hmm_range_fault anyway for allocation policies. With coherent
interconnect that'd be up to numactl, but for driver private it's all up
to the driver. And once we have that, we can also migrate memory around
that's misplaced for functional and not just performance reasons.

The plan I discussed with Thomas a while back at least for gpus was to
have that as a drm_devpagemap library, which would have a common owner (or
maybe per driver or so as Thomas suggested). Then it would still not be in
drivers, but also a bit easier to mess around with for experiments. And
once we have some clear things that hmm_range_fault should do instead for
everyone, we can lift them up.

Doing this at a pagemap level should also be much more efficient, since I
think we can make the assumption that access limitations are uniform for a
given dev_pagemap (and if they're not if e.g. not the entire vram is bus
visible, drivers can handle that by splitting things up).

But upfront speccing all this out doesn't seem like a good idea to,
because I honestly don't know what we all need.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
