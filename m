Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCBBA5F856
	for <lists+nouveau@lfdr.de>; Thu, 13 Mar 2025 15:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27210E8BB;
	Thu, 13 Mar 2025 14:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OIap5nSs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0789510E8BB
 for <nouveau@lists.freedesktop.org>; Thu, 13 Mar 2025 14:32:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3965c995151so313322f8f.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Mar 2025 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741876337; x=1742481137; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmJEZa8bhP51f5WeMX8gVU0QSf/9tpQBkqyv3+FpHNc=;
 b=OIap5nSs0FZNdWygUw07s31eeT2pWk3mLRL758ckq/efEc6wKRYbWZXoxXgY2XfEK9
 fPQgvBKcwJjS0e4UePstpe+iSdokzdC85qUCyu9mm/DEi5YKSZGtDPQ3m8HMTr3ETgix
 nWUpIOc0NpsCtPg72gqeJaOL4P6LSJyD9QDj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741876337; x=1742481137;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qmJEZa8bhP51f5WeMX8gVU0QSf/9tpQBkqyv3+FpHNc=;
 b=F4+9hmzBKjCvziq9neUNdRXkGgXII8mIVmg0UIhfaRhgnmiR+cUN36JnU2slXSuuxs
 zbfKy3VZXQV6i3+gVW0TvmRYgqb/3U73srQ0z9aEoWr/LaG8scO4UElAWYX8pFhw4+iK
 fVntKmn4CFwDkyqddlP4LJYffKsbDauB/WXKnKQzXcQUOaxcku52P7Rk/Soe2PeAkzD0
 F4trfaXYwBN8TSwumEOpZihRxMIs/pbncSW5piV9A3t6vhSjPiZpxZ8jfZ7MEHj6GF8I
 69TUNzQjhNcAoNWMur/RS3JOOnlLAnYpZCbDOZ6fhmrEKH59FDXoRa/RgLkoKTFVOhnQ
 9cXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaGRQo2uN00MBRj7glm+v+CX6Q1/IcoyYd7NC0ArAztYbl2595IBJoL1kQDR59F647NiLof+7t@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5dEsgnqqvsDuUwm6njJzr686MNClYcQROJZCbBwoan6IpzEFQ
 lZz5qlxEgRpg/uVtv6TJlv/JfDjVTnxtdip4jWisU8CQXk1VMQaJtfjp3Q8F0pU=
X-Gm-Gg: ASbGncvgLDQJYjehKExm8T0EJa2nwVcO/S2U63r7HUZTONJLgftPalzyZkFRtzpAX5I
 5QxWLQVJEYkJQfxGBM/FyktDHpAIA0Yz6sInK7jJ14NnmRy85cTAlXTbn/P0DJ+wD6HK+a3RhOi
 oBNpLAmXj6FZJ3cRDfZDbGUo+l9aysIsOPvbQnZUgMwe5x/wLqMrEQB+rVBMAn0ENwO8hko/EJv
 xxkqLhdaIcJPF6x0lENNkeB6O7APT2iPBqtPkkw/Q6lhPFSZyGNWmKp6UkEsh6IV64pDIpQqTFR
 XxmaMZVxShwWf45kodDI3YJEVnqlGn23ZjiqpQxboV65z7GkMPeyU0wf
X-Google-Smtp-Source: AGHT+IHONUiodfS/fWexcjBKJ56cHcP98PgHHjaNe3WzTXhC4/in7mzoTQfPI07gJnTJ+29TnXggtg==
X-Received: by 2002:a05:6000:2109:b0:391:2a9a:478c with SMTP id
 ffacd0b85a97d-39264693887mr8443406f8f.23.1741876337388; 
 Thu, 13 Mar 2025 07:32:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b70sm2338337f8f.30.2025.03.13.07.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 07:32:16 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:32:14 +0100
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
Message-ID: <Z9LsbhzjI-P3-edQ@phenom.ffwll.local>
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
References: <Z8cmBWB8rl97-zSG@phenom.ffwll.local>
 <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <Z8rv-DQuGdxye28N@phenom.ffwll.local>
 <20250307145557.GO354511@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307145557.GO354511@nvidia.com>
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

On Fri, Mar 07, 2025 at 10:55:57AM -0400, Jason Gunthorpe wrote:
> On Fri, Mar 07, 2025 at 02:09:12PM +0100, Simona Vetter wrote:
> 
> > > A driver can do a health check immediately in remove() and make a
> > > decision if the device is alive or not to speed up removal in the
> > > hostile hot unplug case.
> > 
> > Hm ... I guess when you get an all -1 read you check with a specific
> > register to make sure it's not a false positive? Since for some registers
> > that's a valid value.
> 
> Yes. mlx5 has HW designed to support this, but I imagine on most
> devices you could find an ID register or something that won't be -1.
> 
> > - The "at least we don't blow up with memory safety issues" bare minimum
> >   that the rust abstractions should guarantee. So revocable and friends.
> 
> I still really dislike recovable because it imposes a cost that is
> unnecessary.
> 
> > And I think the latter safety fallback does not prevent you from doing the
> > full fancy design, e.g. for revocable resources that only happens after
> > your explicitly-coded ->remove() callback has finished. Which means you
> > still have full access to the hw like anywhere else.
> 
> Yes, if you use rust bindings with something like RDMA then I would
> expect that by the time remove is done everything is cleaned up and
> all the revokable stuff was useless and never used.
> 
> This is why I dislike revoke so much. It is adding a bunch of garbage
> all over the place that is *never used* if the driver is working
> correctly.
> 
> I believe it is much better to runtime check that the driver is
> correct and not burden the API design with this.

You can do that with for example runtime proofs. R4l has that with
Mutex from one structure protecting other structures (like in a tree). But
since the compiler can't prove those you trade in the possibility that you
will hit a runtime BUG if things don't line up.

So subsystems that ensure that driver callbacks never run concurrently
with a revocation could guarantee that revocable resources are always
present.

> Giving people these features will only encourage them to write wrong
> drivers.

So I think you can still achieve that building on top of revocable and a
few more abstractions that are internally unsafe. Or are you thinking of
different runtime checks?

> This is not even a new idea, devm introduces automatic lifetime into
> the kernel and I've sat in presentations about how devm has all sorts
> of bug classes because of misuse. :\

Yeah automatic lifetime is great, until people mix up things with
different lifetimes, then it all goes wrong.

> > Does this sounds like a possible conclusion of this thread, or do we need
> > to keep digging?
> 
> IDK, I think this should be socialized more. It is important as it
> effects all drivers here out, and it is radically different to how the
> kernel works today.
> 
> > Also now that I look at this problem as a two-level issue, I think drm is
> > actually a lot better than what I explained. If you clean up driver state
> > properly in ->remove (or as stack automatic cleanup functions that run
> > before all the mmio/irq/whatever stuff disappears), then we are largely
> > there already with being able to fully quiescent driver state enough to
> > make sure no new requests can sneak in. 
> 
> That is the typical subsystem design!

Yeah maybe we're not that far really. But I'm still not clear how to do
an entirely revoke-less world.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
