Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BBC8D1E56
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 16:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DF410E6F0;
	Tue, 28 May 2024 14:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Vv5A2ZOu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EDC10E3D9
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716905931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z/BZ1nt51YTWYadDCqba2r6Z+lAvTA6hSb41k488cU8=;
 b=Vv5A2ZOu3FF5hy1V8sWexAPqzQ4apxME5vuDvjNt7W7Rz/Kqw7DZSoBiDDp2NrqDeb3vF/
 7bX6ywjJ+vBimK1foQHYmlkx6Vb/lDSpjrKXq1QYNT6SYj34ikheNPoWSQ82uxGCRy9KIR
 oFQdKTFw0J0N4JUA4zMMaqUunXVPtcI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-NPnZv9qjOqmRUeqfct57cg-1; Tue, 28 May 2024 10:18:48 -0400
X-MC-Unique: NPnZv9qjOqmRUeqfct57cg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3550220c37bso502352f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 07:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716905927; x=1717510727;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/BZ1nt51YTWYadDCqba2r6Z+lAvTA6hSb41k488cU8=;
 b=w9QzPMfUSczH4mfcI3neeS3tnk6BG7PRj+LsMO6l1tHUnIYYDWUg3MYAzY52H7HxA3
 7q/691N9ApR2LRnBxRXfuPsVtrcxJGWGE4Ae81E/OUjC7NRC4+RbTuWwNbbm7lyr/qLe
 KqTUN1WfSJZDsEYeXa7Bmj370dsMqyKNTo3nF7/s8KyP7+DSA6olDta/m6aOdhhCkLcZ
 gapVLRkDaLcX0/5x1w8uF1kXajbcLIIAJgIBhR+I4h4VrsL7UKXor9tpSKGyIJWxY+fn
 KFB0QsCpP2iVXfR62iZedVwUA342yO9q5UwkvUm+3LNxTsaq5cUYKnOc9XZhrswM0r43
 1+ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5H1UCm742u9pPUV5Q3LqUUGXFq2jVl79Up2jj0YRYpLEO5W6M0o2gP18nkoLvYoX926u2tCbzuMs2EFO2huwQdSoFXLFg0+BiQQcxjg==
X-Gm-Message-State: AOJu0YyGw1q0NYA+2yyVJzS5XrPujHGetOucmE8G1yXuPlBNAVriqWTf
 d00Vo7+lVqIMiVN6wbRxzRsldmynDuGV7wot6mgpdP4RTrzC278vDR/InXWzBAHj6z8b0kluNhr
 LeraKYoQAEJkYucnpKqALjioX6mOLbye1plsyqBhd4A9GEAKK1nGuDmoCnNttD58=
X-Received: by 2002:adf:f14a:0:b0:354:e22c:ea86 with SMTP id
 ffacd0b85a97d-35506d48b8cmr9521435f8f.9.1716905927691; 
 Tue, 28 May 2024 07:18:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzv0UKkNsSlIQyIXiOI2f3K/kj+ZZJuaGQwe6Mug19LllcchtBIhDXNRyuC86tE0PcwWttfw==
X-Received: by 2002:adf:f14a:0:b0:354:e22c:ea86 with SMTP id
 ffacd0b85a97d-35506d48b8cmr9521398f8f.9.1716905927283; 
 Tue, 28 May 2024 07:18:47 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35607bcdf26sm11788342f8f.99.2024.05.28.07.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 07:18:46 -0700 (PDT)
Date: Tue, 28 May 2024 16:18:44 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "wedsonaf@gmail.com" <wedsonaf@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "a.hindborg@samsung.com" <a.hindborg@samsung.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "fujita.tomonori@gmail.com" <fujita.tomonori@gmail.com>,
 "lina@asahilina.net" <lina@asahilina.net>,
 "pstanner@redhat.com" <pstanner@redhat.com>,
 "ajanulgu@redhat.com" <ajanulgu@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlXnxGK24QaYLDmM@pollux>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240521083231.000074c2.zhiw@nvidia.com>
 <ZlTcnYNff2EDQJdj@pollux.localdomain>
 <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
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

On Tue, May 28, 2024 at 08:40:20AM +0000, Zhi Wang wrote:
> On 27/05/2024 22.18, Danilo Krummrich wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Tue, May 21, 2024 at 08:32:31AM +0300, Zhi Wang wrote:
> >> On Mon, 20 May 2024 19:24:19 +0200
> >> Danilo Krummrich <dakr@redhat.com> wrote:
> >>
> >>> Add an abstraction around the kernels firmware API to request firmware
> >>> images. The abstraction provides functions to access the firmware
> >>> buffer and / or copy it to a new buffer allocated with a given
> >>> allocator backend.
> >>>
> >>
> >> Was playing with firmware extractions based on this patch.
> >> Unfortunately I ended up with a lot of pointer operations, unsafe
> >> statements.
> >>
> >> As we know many vendors have a C headers for the definitions of the
> >> firwmare content, the driver extract the data by applying a struct
> >> pointer on it.
> >>
> >> But in rust, I feel it would nice that we can also have a common
> >> firmware extractor for drivers, that can wrap the pointer operations,
> >> take a list of the firmware struct members that converted from C headers
> >> as the input, offer the driver some common ABI methods to query them.
> >> Maybe that would ease the pain a lot.
> > 
> > So, you mean some abstraction that takes a list of types, offsets in the
> > firmware and a reference to the firmware itself and provides references to the
> > corresponding objects?
> > 
> > I agree it might be helpful to have some common infrastructure for this, but the
> > operations on it would still be unsafe, since ultimately it involves
> > dereferencing pointers.
> > 
> 
> I think the goal is to 1) concentrate the "unsafe" operations in a 
> abstraction so the driver doesn't have to write explanation of unsafe 
> operations here and there, improve the readability of the driver that 
> interacts with vendor-firmware buffer. 2) ease the driver maintenance 
> burden.

With a generic abstraction, as in 1), at lest some of the abstraction's
functions would be unsafe themselves, since they have to rely on the layout
(or offset) passed by the driver being correct. What if I pass a wrong layout /
offset for a structure that contains a pointer? This might still result in an
invalid pointer dereference. Am I missing something?

> 
> Some solutions I saw in different projects written in rust for 
> de-referencing a per-defined struct:
> 
> 1) Take the vendor firmware buffer as a whole, invent methods like 
> read/write with offset for operating the buffer.
> 
> In this scheme, the driver is responsible for taking care of each data 
> member in a vendor firmware struct and also its valid offset. The 
> abstraction only covers the boundary of the whole firmware buffer.
> 
> The cons is the readability of the operation of the vendor firmware 
> buffer in the driver is not good comparing with C code.
> 
> Hate to think a lot of xxx = vendor_firmware_struct.read(offset); // 
> reading item A in the code.
> 
> 2) Define the firmware struct in rust (might need to find a better way 
> to handle "union" in the definition of the vendor firmware struct). Use 
> macros to generate methods of accessing each data member for the vendor 
> firmware struct.
> 
> Then the code in the driver will be like xxx = 
> vendor_firmware_struct.item_a(); in the driver.
> 
> In this scheme, the abstraction and the generated methods covers the 
> boundary check. The "unsafe" statement can stay in the generated 
> struct-access methods.
> 
> This might even be implemented as a more generic rust feature in the kernel.

This sounds more like a driver specific abstraction to me, which, as you write,
we can probably come up with some macros that help implementing it.

But again, what if the offsets are within the boundary, but still at a wrong
offset? What if the data obtained from a wrong offset leads to other safety
implications when further processing them? I think no generic abstraction can
ever cover the safety parts of this (entirely). I think there are always semanic
parts to this the driver has to cover.

Generally, I think we should aim for some generalization, but I think we should
not expect it to cover all the safety aspects.

> 
> The cons is still the driver might need to sync between the C-version 
> definition and rust-version definition.

What do you mean with the driver needs to sync between a C and a Rust version of
structure definitions?

> 
> 3) Also re-using C bindings generation in the kernel came to my mind 
> when thinking of this problem, since it allows the rust code to access 
> the C struct, but they don't have the boundary check. Still need another 
> layer/macros to wrap it.

I think we should have the structure definitions in Rust directly.

- Danilo

> 
> 
> >>
> >> Thanks,
> >> Zhi.
> >>

