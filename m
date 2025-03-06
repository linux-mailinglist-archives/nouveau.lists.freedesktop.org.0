Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD284A54821
	for <lists+nouveau@lfdr.de>; Thu,  6 Mar 2025 11:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E2A10E16F;
	Thu,  6 Mar 2025 10:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PgBLs1DY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2649910E16F
 for <nouveau@lists.freedesktop.org>; Thu,  6 Mar 2025 10:42:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43bc0b8520cso2957185e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 06 Mar 2025 02:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741257761; x=1741862561; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWKW3oIaJ3+3t6x61qexA9c5kKVmeqkOjY9qTsiPgw0=;
 b=PgBLs1DY9mkHR6O8X3nMmAlwvqD2auHVv7jhj/VPTjsjX9nFgSuejKhJjOCAgyzitd
 ch4Bw82AwLp//KRJ0ebh5mImm4lFXohtXXe3HAjSHQajPO0bgp3CX9HxPLEHyuStiDqh
 DCeWI6Q0DKeQX20sDC2JJxqgvAOxvhwFnDMc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741257761; x=1741862561;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KWKW3oIaJ3+3t6x61qexA9c5kKVmeqkOjY9qTsiPgw0=;
 b=nlehJEopEiUwmmZlD/a22K1JFG33/H1AwHJQ7C7PABbyWcVDEgbuAw5mYsubYWFbK0
 YDyC4NdX2gYKbrop7MhRQDtMxA9KPb/ZtkTavTPlHlXoY+l8dJMy3Si2qPgwCWLnywBQ
 LF/iupDA0LbnrRkZU6gkorjq+EkFv++ULLeQ5pyzdAHgqBCtO5TSew5UJrpeLKk0VvdC
 /T9WwBfC6W6BXHzDmF1yjWCE2O/2rGwgievqmR8EJcCgbEPWcXte3BoCDlRhQMKdJkC2
 A28UDl+ttZyl+fD4VzN/8wvshuIzFYu7VAjWqRYMAZISkrTH30xHnprGv5SOFASYjivp
 wryg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtrJdroRP1fupI5JAu4xzLJVkJh1xGB1aoDODoe1eSmGNK/5TdCF6/PvKhOLeZ8kY0rEVE6J1Q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ9kXk580mVLB5a7G2SqiJfQKDoEKtxjThYHViOscbNmInbeA/
 kW6EVXYprWJjsjVDPpDEXWVAAydbuOQnpLqlqPT2aDNU5J3q1n3EA8LdZo8g0Mc=
X-Gm-Gg: ASbGncsROeJUA4X/tZPJ6iNrhLCCKRfZnDV+K7b3AloneKUdyu8v2rUbC2wa5L90EBK
 JGMeVkaqGBsmiNNtsdaRQyabycqH00C+xJKpPFLP7R7538jee9xcGcmBaa4w0ESy2RtyHTyv2V5
 51WYx1V6qokzv66u7rLgz25eSSGA3MgIK+PNuyy9m4/nhwXAWH+2ZLxnZVR7GYo6Q/F2WYkI+kh
 XywTE9QXJKwurk26DKKdDhQpz1aXa9p/ClMjLKJ0eojipVkCJmynbWndnaXnBYguIj2d/AdWaou
 lXJMrFekfwI5jwXPut2i3wDVdv/e9bnXGiYYd5IR2K1SAchKqnj6L1yp
X-Google-Smtp-Source: AGHT+IFWtDrzAmHmNppiYyx5/EBa7seM+yDY/129ZcXODnx/XUpZbw/Xkl5sipcWH6LwnCCp7EOkxQ==
X-Received: by 2002:a05:600c:3b14:b0:43a:b8eb:9e5f with SMTP id
 5b1f17b1804b1-43bd294dd4emr47339385e9.3.1741257761331; 
 Thu, 06 Mar 2025 02:42:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435c9c7sm45137295e9.38.2025.03.06.02.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 02:42:40 -0800 (PST)
Date: Thu, 6 Mar 2025 11:42:38 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
References: <Z7-IHgcVVS8XBurW@cassiopeiae> <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
 <D82UB3V6NZ55.3OEPPW2W8MFZV@nvidia.com>
 <Z8GViQzZJVFPxfNd@phenom.ffwll.local>
 <20250228184013.GF39591@nvidia.com>
 <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305151012.GW133783@nvidia.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Mar 05, 2025 at 11:10:12AM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 05, 2025 at 08:30:34AM +0100, Simona Vetter wrote:
> > - developers who want to quickly test new driver versions without full
> >   reboot. They're often preferring convenience over correctness, like with
> >   the removal of module refcounting that's strictly needed but means they
> >   first have to unbind drivers in sysfs before they can unload the driver.
> > 
> >   Another one is that this use-case prefers that the hw is cleanly shut
> >   down, so that you can actually load the new driver from a well-known
> >   state. And it's entirely ok if this all fails occasionally, it's just
> >   for development and testing.
> 
> I've never catered to this because if you do this one:
> 
> > - hotunplug as an actual use-case. Bugs are not ok. The hw can go away at
> >   any moment. And it might happen while you're holding console_lock. You
> >   generally do not remove the actual module here, which is why for the
> >   actual production use-case getting that part right isn't really
> >   required. But getting the lifetimes of all the various
> >   structs/objects/resources perfectly right is required.
> 
> Fully and properly then developers are happy too..
> 
> And we were always able to do this one..
> 
> > So the "stuck on console_lock" is the 2nd case, not the first. Module
> > unload doesn't even come into play on that one.
> 
> I don't see reliable hot unplug if the driver can get stuck on a
> lock :|
> 
> > > Assuming all your interrupt triggered sleeps have gained a shootdown
> > > mechanism.
> > 
> > Hence why I want revocable to only be rcu, not srcu.
> 
> Sorry, I was not clear. You also have to make the PCI interrupt(s)
> revocable. Just like the MMIO it cannot leak past the remove() as a
> matter of driver-model correctness.
> 
> So, you end up disabling the interrupt while the driver is still
> running and any sleeps in the driver that are waiting for an interrupt
> still need to be shot down.
> 
> Further, I just remembered, (Danilo please notice!) there is another
> related issue here that DMA mappings *may not* outlive remove()
> either. netdev had a bug related to this recently and it was all
> agreed that it is not allowed. The kernel can crash in a couple of
> different ways if you try to do this.
> 
> https://lore.kernel.org/lkml/8067f204-1380-4d37-8ffd-007fc6f26738@kernel.org/T/#m0c7dda0fb5981240879c5ca489176987d688844c

Hm for the physical dma I thought disabling pci bust master should put a
stop to all this stuff?

For the sw lifecycle stuff I honestly didn't know that was an issue, I
guess that needs to be adressed in the dma-api wrappers or rust can blow
up in funny ways. C drivers just walk all mappings and shoot them.

>  > a device with no driver bound should not be passed to the DMA API,
>  > much less a dead device that's already been removed from its parent
>  > bus.
> 
> So now we have a driver design that must have:
>  1) Revocable MMIO
>  2) Revocable Interrupts
>  3) Revocable DMA mappings
>  4) Revocable HW DMA - the HW MUST stop doing DMA before the DMA API
>     is shut down. Failure is a correctness/UAF/security issue
> 
> Somehow the driver has to implement this, not get confused or lock up,
> all while Rust doesn't help you guarentee much of any of the important
> properties related to #2/#3/#4. And worse all this manual recvocable
> stuff is special and unique to hot-unplug. So it will all be untested
> and broken.

The trouble is that for real hotunplug, you need all this anyway. Because
when you physically hotunplug the interrupts will be dead, the mmio will
be gone any momem (not just at the beginnning of an rcu revocable
section), so real hotunplug is worse than what we're trying to do here.

Which means I think this actually helps you with testing, since it's much
easier to test stuff with pure software than physically yanking hardware.
You could perhaps fake that with mmiotrace-like infrastructure, but that's
not easy either.

So randomly interrupts not happening is something you need to cope with no
matter what.

> Looks really hard to me. *Especially* the wild DMA thing.
> 
> This has clearly been missed here as with the current suggestion to
> just revoke MMIO means the driver can't actually go out and shutdown
> it's HW DMA after-the-fact since the MMIO is gone. Thus you are pretty
> much guaranteed to fail #4, by design, which is a serious issue.
> 
> I'm sorry it has taken so many emails to reach this, I did know it,
> but didn't put the pieces coherently together till just now :\
> 
> Compare that to how RDMA works, where we do a DMA shutdown by
> destroying all the objects just the same as if the user closed a
> FD. The normal destruction paths fence the HW DMA and we end up in
> remove with cleanly shutdown HW and no DMA API open. The core code
> manages all of this. Simple, correct, no buggy hotplug only paths.

This is where it gets really annoying, because with a physical hotunplug
you don't need to worry about dma happening after ->remove, it already
stopped before ->remove even started.

But for a driver unbind you _do_ have to worry about cleanly shutting down
the hardware. For the above reasons and also in general putting hardware
into a well-known (all off usually) state is better for then reloading a
new driver version and binding that. Except that there's no way to tell
whether your ->remove got called for unbinding or hotunplug. And you could
get called for unbinding and then get hotunplugged in the middle to make
this even more messy. At least last time around I chatted with Greg about
this he really didn't like the idea of allowing drivers to know whether a
pci device was physically unplugged or not, and so for developer
convenience most pci drivers go with the "cleanly shut down everything"
approach, which is the wrong thing to do for actual hotunplug.

> > Yeah agreed. I might really badly regret this all. But I'm not sold that
> > switching to message passing design is really going to be better, while
> > it's definitely going to be a huge amount of work.
> 
> Yeah, I'd think from where DRM is now continuing trying to address the
> sleeps is more tractable and achievable than a message passing
> redesign..
> 
> > > If the C API handles module refcounting internally then rust is fine
> > > so long as it enforces THIS_MODULE.
> > 
> > You could do contrived stuff and pass function pointers around, so that
> > THIS_MODULE doesn't actually match up with the function pointer.
> 
> Ah.. I guess rust would have to validate the function pointers and the
> THIS_MODULE are consistent at runtime time before handing them off to
> C to prevent this. Seems like a reasonable thing to put under some
> CONFIG_DEBUG, also seems a bit hard to implement perhaps..

We should know the .text section of a module, so checking whether a
pointer is within that shouldn't be too hard.

> > > If the C API requires cancel then rust is fine so long as the binding
> > > guarantees cancel before module unload.
> > 
> > Yeah this is again where I think rust needs a bit more, because the
> > compiler can't always nicely proof this for you in all the "obvious"
> > cases.
> 
> But in the discussion about the hrtimer it was asserted that Rust can :)
> 
> I believe it could be, so long as rust bindings are pretty restricted
> and everything rolls up and cancels when things are destroyed. Nothing
> should be able to leak out as a principle of the all the binding
> designs.
> 
> Seems like a hard design to enforce across all bindings, eg workqeue
> is already outside of it. Seems like something that should be written
> down in a binding design document..

Yeah ...

I think a big issue is that very often all these things aren't even
documented on the C side, like the dma-api unmapping lifetime I wasn't
aware of at all.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
