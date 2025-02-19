Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189AA3BF1F
	for <lists+nouveau@lfdr.de>; Wed, 19 Feb 2025 13:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B4B10E7E7;
	Wed, 19 Feb 2025 12:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="InYRb5YN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8907C10E7F5
 for <nouveau@lists.freedesktop.org>; Wed, 19 Feb 2025 12:58:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43996e95114so11919105e9.3
 for <nouveau@lists.freedesktop.org>; Wed, 19 Feb 2025 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739969921; x=1740574721; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34sVOinnrdUpopDeZt0X3vBKN/d5vCnq4SYbVGcMLpU=;
 b=InYRb5YNatfFgBmOCwRv2PrKJ5MBxoIoG4LlZ0/geojEINLwSFOJY/R/JA5V238tSz
 FKz65ckK7bPRiVyuf6hQyLU0Hd98+D5Jeb6hY2v8QMvfGJbNRUsPPL4BQUvHcxaBPWF9
 GGEz3KLJMx732GP4zTVIuKoCbCTlFO5VrZp+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969921; x=1740574721;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=34sVOinnrdUpopDeZt0X3vBKN/d5vCnq4SYbVGcMLpU=;
 b=pahieDTxNRCf+iijr+Cw+wloXTeV1dt0HaENlZt1GqK/LPNIQuNICR+zPKex9TceJe
 mHtnolqcDSHsspvY/wpkd4PTOmpq/jpJL37aqNICgN2xhxTWolGjoOrBIE+iOXg3fnsg
 ww+9kBcMU9vw0lglixmQHdJj5kL2yVVnzlQWJ1d/KetVN7BwgJiObtyuWirrikFl2b9m
 fS2rLpHzxL07aYbvOd9398KIAZD1UiJvFBq3XbswFHl5sbAVwrYcmzdprKi7ZftLn9fm
 MO+owgDb7yAfUovyUdA+xFKhgSHAzhjTeijmBhNX2fe58N7lutU6+wC+8rxg9AfMcGBG
 xEbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVfhEctQ5HjeNUXsp/zvShqprsUjMaCvyQyzOeiij12lsGdUmExFaQMtP1IyXPf/pk4VBMfLd+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2sW4wsIt6b4NwKnF5/+A0UcU2/2TpLzZfbRXX8ns6fbRv4NjU
 yujUl6dJ0BIkKF5XPXVmjEpQeNopU7TRLUJ49fiAVSuqVdS7ZonQx2Dz/2PXdbU=
X-Gm-Gg: ASbGncuAZVMRKWedAq3MCisyMuZy6mASabCVeCZ1TelmsfdH8IlcAwXLvBYSDj8SRcG
 MvnFSozlefecqx8dHQmnWe+laDwDa2pMXbCUJiC1OzcOwyCketNaDlFt0SKa5F56ykW3n3yc7A6
 d7M8GJZk8F4UtlUiKim8r0MHXYq5tg5KAnSPo/+zPfeIZbwCANRTtD0Tr8IIhufSPE5JVAjRMga
 5X9yxo91ZAxX2N3uv0d2uceyjG+g8LkxLq3A1iwFl3DWJnt3+qAuHegIxiwXS3sDQUwCXEaCZWg
 fifx5/JVMgrSiiSHCrCzOxEiZLw=
X-Google-Smtp-Source: AGHT+IGzbUBUg/56lBAekqPCOphT5RTECYUG5Q84fY/+IOL0ZwxmdTe8Ny3WUiTLHfIX8hhDw7t+4Q==
X-Received: by 2002:a05:600c:1c98:b0:439:88bb:d026 with SMTP id
 5b1f17b1804b1-43988bbd48cmr104447115e9.5.1739969920700; 
 Wed, 19 Feb 2025 04:58:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7c7sm214383535e9.27.2025.02.19.04.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:58:40 -0800 (PST)
Date: Wed, 19 Feb 2025 13:58:38 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <Z7XVfnnrRKrtQbB6@phenom.ffwll.local>
Mail-Followup-To: Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
 <CAPM=9tyu84z4Xk5X0fykO3Dazby2UqRgwtN4woNKe4Z2yMyDZg@mail.gmail.com>
 <Z7RgOd_57wcSUyB0@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7RgOd_57wcSUyB0@pollux>
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

On Tue, Feb 18, 2025 at 11:26:01AM +0100, Danilo Krummrich wrote:
> On Tue, Feb 18, 2025 at 11:46:26AM +1000, Dave Airlie wrote:
> > > 1. How to avoid unnecessary calls to try_access().
> > >
> > > This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argument. I
> > > think we can just call try_access() once and then propage the guard through the
> > > callchain, where necessary.
> > 
> > Nope, you can't do that, RevocableGuard holds a lock and things
> > explode badly in lockdep if you do.
> 
> Yes, try_access() marks the begin of an RCU read side critical section. Hence,
> sections holding the guard should be kept as short as possible.
> 
> What I meant is that for a series of I/O operations we can still pass the guard
> to subsequent functions doing the actual I/O ops.
> 
> More generally, I also thought about whether we should also provide an SRCU
> variant of Revocable and hence Devres. Maybe we even want to replace it with
> SRCU entirely to ensure that drivers can't stall the RCU grace period for too
> long by accident.

The issue with srcu is that the revocation on driver unload or hotunplug
becomes unbound. Which is very, very uncool, and the fundamental issue
that also drm_dev_enter/exit() struggles with. So unless the kernel has a
concept of "bound-time mutex only, but not unbounded sleeps of any sort" I
think we should try really, really hard to introduce srcu revocables on
the rust side. And at least for mmio I don't think any driver needs more
than maybe some retry loops while holding a spinlock, which is fine under
standard rcu. It does mean that drivers need to have fairly fine-grained
fallible paths for dealing with revocable resources, but I think that's
also a good thing - mmio to an unplugged device times out and is really
slow, so doing too many of those isn't a great idea either.

Ofc on the C side of things the balance shits a lot, and we just want to
at least make "no uaf on driver hotunplug" something achievable and hence
are much more ok with the risk that it's just stuck forever or driver
calls take an undue amount of time until they've finished timing out
everything.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
