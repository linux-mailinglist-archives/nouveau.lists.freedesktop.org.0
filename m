Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F62A23344
	for <lists+nouveau@lfdr.de>; Thu, 30 Jan 2025 18:42:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893E610E9B3;
	Thu, 30 Jan 2025 17:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="j5yj8YPW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921C710E9B3
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 17:42:19 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-467918c360aso11074441cf.0
 for <nouveau@lists.freedesktop.org>; Thu, 30 Jan 2025 09:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1738258938; x=1738863738; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CVNKXypQwOopSf1xgwOwZSkCQwewZeK8ItDq6p8m+EY=;
 b=j5yj8YPWipkAeAi7KP0c9c+0iMMWahfpuHf6oAi0qV0JdJy69wKXXqJXTb2JWqex65
 iS13i+u8sFw0g9mi0Qcu48McpBLC1bR0XM4q+8HiLSP1ti//HZy1tJOxRKZJTqSELKOy
 cmFg944R5TVbzv6F9NklcocWGdsoXMQkJJes2gXtDlqBq528wWTxs0AnaQRQoMNRaH9O
 1lLYfCDbwS5JIB078isW532Uxn8QVVp8hWa2VI2sSzBmXhrZlcjKX/YyH7xiketo9677
 TbSqOF9hMBK2UFisfTL4MTi+JV3VWdtMwSlcjAILeXuXL/c46f90MLKpHJm78v8SVHXv
 /f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738258938; x=1738863738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVNKXypQwOopSf1xgwOwZSkCQwewZeK8ItDq6p8m+EY=;
 b=a5LGtnq300kPKqCtyl0+FSthCPmOJ47cAfBjJh2WiDlbHt7jqITRVtDZ4TzarkUH9o
 GtBtzM4b0MGJgKFwjS/3g2NIkJEKZNh6igkFL2JvNpIHYg2dUmPVl80Ni/v4XITcb0iB
 Q3n7BLD604WJYjNQuWzLZmaOW67CZGguw7kuQcx+hfa9kM2Wx7w+JJSVmmV1+Uu3d172
 eARlgkc3S7LsnTjKJ9XusrnoCnkQ9WpY22fyp4ZEInlqSSoxj9Gb+3T+7z4SUTmzhLNv
 ROVZCQ+G4dNLyfkWcBwnFY5fym06Wv+4oyI93kkrzHdnQmXQfNNlEqdD8xQffFptPtog
 zbqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaVxyg+ctyFoibZ2Uh7Up4GilNW4pTqfMRJBzEY0/6wudixXsoHDkbjtV2JipQJ2JqYzTBSWGa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9Xa5rlWcJuABiIJGn5gyQHhseerwXYYZJ7i8i4jc+8mto3GCR
 Poc5zPfgGfmo0lvNKlCkzVTx2qEGYJZlH6GL6X+XuhN+dplkNFuZSxz0IcKlO1o=
X-Gm-Gg: ASbGnct3UNkrDjdIjlut3kGWsGCKaUDNe9z3hsqUe6VaJe2qMppjR19YS+cAeWLViag
 e5MbYl/JAwcLD+/3LyUTCEHhwbN6U8jPgJ46PS0ha0hg8TmXauHAEQcslibQXGnxI4XZKumNtR6
 6kcJ/smUmGtLA1nvS1NPjaAfRLZSgUZtcDUFroqq9jp2TdKFI7JSsiSVigT/8yiHIc+8JVVniZv
 O/0X04+NUTMRioWKG2o5h+Pn98aGHjFyr5jwgMDM/dOP3dAZo9Wf5ruYnAS8v6C30g5zCHNS+Gf
 9w5Z7L2bJtTMHuFdAIZHq3FHwMbxdK5tPx3B5yOlM3WYUT8i42tSNCoyvAWvGThd
X-Google-Smtp-Source: AGHT+IFnQ+3H7xNChFVcqgc9dwjk4L8UEnbD/nNL/ykdDG0Q22FK3UpLRKkWb0FWjYtvwvzMuLT+BQ==
X-Received: by 2002:a05:622a:4296:b0:467:451b:eba3 with SMTP id
 d75a77b69052e-46fd0a7fe1dmr108793531cf.8.1738258938311; 
 Thu, 30 Jan 2025 09:42:18 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46fdf0ceacesm8793061cf.31.2025.01.30.09.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2025 09:42:17 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1tdYYT-00000009ew4-0Jjs;
 Thu, 30 Jan 2025 13:42:17 -0400
Date: Thu, 30 Jan 2025 13:42:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, GalShalom@nvidia.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250130174217.GA2296753@ziepe.ca>
References: <20250128132034.GA1524382@ziepe.ca>
 <de293a7e9b4c44eab8792b31a4605cc9e93b2bf5.camel@linux.intel.com>
 <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
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

On Thu, Jan 30, 2025 at 05:09:44PM +0100, Simona Vetter wrote:

> > You could also use an integer instead of a pointer to indicate the
> > cluster of interconnect, I think there are many options..
> 
> Hm yeah I guess an integer allocater of the atomic_inc kind plus "surely
> 32bit is enough" could work. But I don't think it's needed, if we can
> reliable just unregister the entire dev_pagemap and then just set up a new
> one. Plus that avoids thinking about which barriers we might need where
> exactly all over mm code that looks at the owner field.

IMHO that is the best answer if it works for the driver.
> > ? It is supposed to work, it blocks until all the pages are freed, but
> > AFAIK ther is no fundamental life time issue. The driver is
> > responsible to free all its usage.
> 
> Hm I looked at it again, and I guess with the fixes to make migration to
> system memory work reliable in Matt Brost's latest series it should indeed
> work reliable. The devm_ version still freaks me out because of how easily
> people misuse these for things that are memory allocations.

I also don't like the devm stuff, especially in costly places like
this. Oh well.

> > > An optional callback is a lot less scary to me here (or redoing
> > > hmm_range_fault or whacking the migration helpers a few times) looks a lot
> > > less scary than making pgmap->owner mutable in some fashion.
> > 
> > It extra for every single 4k page on every user :\
> > 
> > And what are you going to do better inside this callback?
> 
> Having more comfy illusions :-P

Exactly!

> Slightly more seriously, I can grab some locks and make life easier,

Yes, but then see my concern about performance again. Now you are
locking/unlocking every 4k? And then it still races since it can
change after hmm_range_fault returns. That's not small, and not really
better.

> whereas sprinkling locking or even barriers over pgmap->owner in core mm
> is not going to fly. Plus more flexibility, e.g. when the interconnect
> doesn't work for atomics or some other funny reason it only works for some
> of the traffic, where you need to more dynamically decide where memory is
> ok to sit.

Sure, an asymmetric mess could be problematic, and we might need more
later, but lets get to that first..

> Or checking p2pdma connectivity and all that stuff.

Should be done in the core code, don't want drivers open coding this
stuff.

> Also note that fundamentally you can't protect against the hotunplug or
> driver unload case for hardware access. So some access will go to nowhere
> when that happens, until we've torn down all the mappings and migrated
> memory out.

I think a literal (safe!) hot unplug must always use the page map
revoke, and that should be safely locked between hmm_range_fault and
the notifier.

If the underlying fabric is loosing operations during an unplanned hot
unplug I expect things will need resets to recover..

Jason
