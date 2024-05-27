Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598358D0D2C
	for <lists+nouveau@lfdr.de>; Mon, 27 May 2024 21:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2475710E5E3;
	Mon, 27 May 2024 19:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZuYOtORv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824D910E516
 for <nouveau@lists.freedesktop.org>; Mon, 27 May 2024 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716838013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=04BP6JgJRJaoyE7XZo+qyeTn0Ydmjf+GQEv5dhrT/JU=;
 b=ZuYOtORvg2mpZP9geldKLomThbu+qZhF+Igmd2gMBZjwaB/qvEkjX3h/dPQV7kIfFKl/R4
 Z5uH26bWwlEwp7RbZwPLMjq/XylR0+MKYU0CZLbR/oM3jLPqgxcFPgSmPQIaUkkab+xfhC
 UkTI0AJdN8rwRFu6Oxqhr2i0Fr9bBm0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-v0t6yS-RMbKEkfgiLuYatQ-1; Mon, 27 May 2024 15:26:52 -0400
X-MC-Unique: v0t6yS-RMbKEkfgiLuYatQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-354fc1122baso54774f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 27 May 2024 12:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716838011; x=1717442811;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=04BP6JgJRJaoyE7XZo+qyeTn0Ydmjf+GQEv5dhrT/JU=;
 b=s0DmGdbKDLsiT5FHD8IdRVFINdYrfUn9UVr6AtYn9isQpDxC4qyHdQANO8BY9KCKNE
 526qqk6Ts6PUM17ncgWyyDqzgh3oRQRw7eXAnf+DtEY+7iFk/7Y/i0w6TbGAKGpDY2xU
 /VLUlagFfenezSlE9EKgCOsc7YbplszhGkszo7eDjaBqJ5yxSWi3CDZJN+XVboh84lUm
 t0Xadk8M8ZII/F78k4O4U/Mkx79ayMV8XjtZzd2N83Cpv5+xzIVlTTNiUTocnK69+mmt
 0e7DQS+0ZI0YGqdirMusINV7McJ+mwVs5L+hs2Y1/KwEACyGh1ugjEHpMI8QGvSZ9kS7
 CU+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBaZEJh4RlKkzh9vMAPtWMqhsq1WlgEBGEUwF+jELQwEnLVDnYwGfIDZfE/zFwrgx3dJCEKFjo/o7yzr34ID31957RxZD/ChnR0FrfGg==
X-Gm-Message-State: AOJu0Yw/sJsK7AEDrQF3tMzZSu1E90ypXPeIpKX1nTh+6BVhgs6QD7br
 AGbsnbE4D1xJuRrsi45Qq+IBP8nV2YzcDs4GAy+DHCxJDk2KpV5lO450/1gV6izZU9g3mmjbCTW
 ViNUxsYoX6TNWGsXrCGl9GF2sHSe6dAcejL9IUH2dLThbJcION5DziLZ1er7qXfk=
X-Received: by 2002:a05:6000:1001:b0:354:db70:3815 with SMTP id
 ffacd0b85a97d-355270567abmr9871320f8f.7.1716838010935; 
 Mon, 27 May 2024 12:26:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpX5a3JazHsekJBC6hkppw/PzK2VdF3Dw2Az33nM3NarNt2rZRaGhpKwlikcM94rwQ/PNJkA==
X-Received: by 2002:a05:6000:1001:b0:354:db70:3815 with SMTP id
 ffacd0b85a97d-355270567abmr9871283f8f.7.1716838010499; 
 Mon, 27 May 2024 12:26:50 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35aa40ee42bsm846020f8f.47.2024.05.27.12.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 12:26:50 -0700 (PDT)
Date: Mon, 27 May 2024 21:26:47 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Rob Herring <robh@kernel.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Message-ID: <ZlTed15hXf7UROP9@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
 <20240521212333.GA731457-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240521212333.GA731457-robh@kernel.org>
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

On Tue, May 21, 2024 at 04:23:33PM -0500, Rob Herring wrote:
> On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> > From: Asahi Lina <lina@asahilina.net>
> > 
> > Add abstractions for DRM drivers and devices. These go together in one
> > commit since both are fairly tightly coupled types.
> > 
> > A few things have been stubbed out, to be implemented as further bits of
> > the DRM subsystem are introduced.
> > 
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |   2 +
> >  rust/kernel/drm/device.rs       |  87 +++++++++
> >  rust/kernel/drm/drv.rs          | 318 ++++++++++++++++++++++++++++++++
> >  rust/kernel/drm/mod.rs          |   2 +
> >  4 files changed, 409 insertions(+)
> >  create mode 100644 rust/kernel/drm/device.rs
> >  create mode 100644 rust/kernel/drm/drv.rs
> 
> [...]
> 
> > diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> > new file mode 100644
> > index 000000000000..5dd8f3f8df7c
> > --- /dev/null
> > +++ b/rust/kernel/drm/drv.rs
> > @@ -0,0 +1,318 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +
> > +//! DRM driver core.
> > +//!
> > +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
> > +
> > +use crate::{
> > +    alloc::flags::*,
> > +    bindings, device, drm,
> > +    error::code::*,
> > +    error::{Error, Result},
> > +    prelude::*,
> > +    private::Sealed,
> > +    str::CStr,
> > +    types::{ARef, ForeignOwnable},
> > +    ThisModule,
> > +};
> > +use core::{
> > +    marker::{PhantomData, PhantomPinned},
> > +    pin::Pin,
> > +};
> > +use macros::vtable;
> > +
> > +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> > +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> > +/// Driver supports mode setting interfaces (KMS).
> > +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> > +/// Driver supports dedicated render nodes.
> > +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> > +/// Driver supports the full atomic modesetting userspace API.
> > +///
> > +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> > +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> > +/// should not set this flag.
> > +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> > +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> > +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> > +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> > +/// submission.
> > +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> 
> This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
> I suppose some are legacy which won't be needed any time soon if ever. 
> Not sure if you intend for this to be complete, or you are just adding 
> what you are using? Only FEAT_GEM is used by nova ATM.

Good catch, I think we should add all of them, except the legacy ones. If no one
disagrees, I will fix this in v2.

> 
> Rob
> 

