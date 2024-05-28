Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D538D1AF2
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 14:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B5010E22C;
	Tue, 28 May 2024 12:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FFKwbQV3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925F8112227
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716898770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W8XZc0KQa/7mBqFNDuE3e/08IvQR5wAGqbLL04XHCHU=;
 b=FFKwbQV3+KeYNsUwQTWWcdUYxQKM9yaDWTf8Y8x2xx27XTjt+uGQMN8uQkZ8XyLtaoN2vj
 cKVxZxLsUGNZE3tZA2YNDoPubsk56V7Mhp/myMvfICFnmg+2sWA/D1W9xMzCwFKVpBT3LZ
 4rV1tfGkgyyQXWQv+o7M7iGWGg9ofPI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-fx0OC2iMMl6S6wGv9UwVMg-1; Tue, 28 May 2024 08:19:29 -0400
X-MC-Unique: fx0OC2iMMl6S6wGv9UwVMg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3586e80661fso434602f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 05:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716898768; x=1717503568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8XZc0KQa/7mBqFNDuE3e/08IvQR5wAGqbLL04XHCHU=;
 b=C3NyLJUvv/aMipjjXkwo3B5c1IR70L1ddfXS8Pw13akjhXRyU0LqDTYdqxmBOTVVpM
 8y0TB/Qir+7mVJQewbwb6aaWRa+ZcVf1LZaegoq8OcPcCWDLalYD2qBW5P8irG9Pq4DD
 lfC+7S5KntGC+Zrdj5MGXeJFvS1bG+FVixi74v4GZyKboAV6jnY4jtJvQZoiVU+9PCIc
 z2jgkAoS6xXsDFPKNlwp+TJeySWUd4VoMJzBNiyVSMOF1tLifHDS+XcyhNVnj3vdJMPV
 LekipGFntyrV5WDu4VKv24v7gENBbO+gy1l/Bq0h6ERRv/Fn8Db1w+pFZGf/NDekWKnJ
 EeBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbjv9P23am/Y2w5PV6i7VniZl/lrMq/Pjn3Ljavi2r8IAg7GceLaXRURICUv+n/kZhX9WNE4bVXWri2rAdmAFtz6FsbGrbYBniZuN3pA==
X-Gm-Message-State: AOJu0YzybKxBBWztaLOKSQRKmKpQJtnSIwqMmXCQcn7skTL6uYhmXd1Y
 QQemz7gLknM0SRegMH9vxDuCdVFjUVlYfDe8YydT+lzJA6aZjsVf8JMtg+zCBClLFTd4XLOEDBw
 MJbnbBwaBx92b9mz1BJ+zsFFY5h1pQiRdwU/Y/4QnffpdEvg82rCHxbyrX/88SaE=
X-Received: by 2002:a5d:424a:0:b0:354:fa35:368a with SMTP id
 ffacd0b85a97d-3552f4fd78bmr8185127f8f.65.1716898767989; 
 Tue, 28 May 2024 05:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxDYY3oHYAp9UWhyVGdke925o2d37XRD3jeQMgZG4iIZJ4+zl4uAQvL8nW2ISmd53ela8P8Q==
X-Received: by 2002:a5d:424a:0:b0:354:fa35:368a with SMTP id
 ffacd0b85a97d-3552f4fd78bmr8185109f8f.65.1716898767572; 
 Tue, 28 May 2024 05:19:27 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-358093ede7fsm7266534f8f.37.2024.05.28.05.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 05:19:27 -0700 (PDT)
Date: Tue, 28 May 2024 14:19:24 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
 ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, mcgrof@kernel.org, russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXLzCYiwdMxic3X@pollux>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Tue, May 28, 2024 at 08:01:26PM +0900, FUJITA Tomonori wrote:
> On Mon, 27 May 2024 21:22:47 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> >> > +/// Abstraction around a C firmware struct.
> >> > +///
> >> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> >> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> >> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> >> > +/// firmware is released once [`Firmware`] is dropped.
> >> > +///
> >> > +/// # Examples
> >> > +///
> >> > +/// ```
> >> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> >> > +/// driver_load_firmware(fw.data());
> >> > +/// ```
> >> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> >> 
> >> Wrapping a raw pointer is not the intended use of Qpaque type?
> >> 
> > 
> > Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
> > the boilerplate in the 'request' functions to some common 'request_internal' one.
> 
> You might need to add 'Invariants' comment on Firmware struct.

Which ones do you think should be documented?

> 
> BTW, what merge window are you aiming for? As I wrote before, I have a
> driver that needs the firmware abstractions (the minimum device
> abstractions is enough; Device::as_raw() and as_ref()). So the sooner,
> the better for me.

I'm not aiming this on a specific merge window.

However, if you have a driver that needs the firmware abstractions, I would be
surprised if there were any hesitations to already merge the minimum device
abstractions [1] and this one (once reviewed) without the rest. At least there
aren't any from my side.

[1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

> 

