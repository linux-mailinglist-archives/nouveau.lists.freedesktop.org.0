Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40888D0CC5
	for <lists+nouveau@lfdr.de>; Mon, 27 May 2024 21:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5907510E2E4;
	Mon, 27 May 2024 19:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EDj6nLh3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC0C10E44B
 for <nouveau@lists.freedesktop.org>; Mon, 27 May 2024 19:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716837775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+bh6eeKyL8dV8w1mLvCxudFIQs1HlIb6gTyNzpVbwLw=;
 b=EDj6nLh3siS05U1fsW7DN+qktIdNz0JlbMOadZJOKBpiopntL57Rn6Fe+BuJfDe3nfXkv3
 qA/LCa4cV5rXRXv6J+IVj1afmO7Qx+yTIv4l0OE+PQ0PFTPuiMdFrpWRURojm0nuK4EsPj
 b/mhhjunuRiPR5dM2vtUg7CE/q7MLJw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-5lBQK9ooPpKSEs780elVOw-1; Mon, 27 May 2024 15:22:52 -0400
X-MC-Unique: 5lBQK9ooPpKSEs780elVOw-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5785f7b847cso73475a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 27 May 2024 12:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716837771; x=1717442571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bh6eeKyL8dV8w1mLvCxudFIQs1HlIb6gTyNzpVbwLw=;
 b=VDtJ+H9Jf+y9jDl0GhmGdtG7r78LQz72R3vhh9jx1V2dqpaDTyDBJEioZNa8r5J9Da
 O7PZHNYLX3qHfZytoDXakn6yQIaRJgya4xeeCqT0xTlcAce7M5keTeH6JiF6NaYGOeck
 cOqbJ8TyGC8ZAz80okALvddZmRl2F6q7OttW5jHq8Dd3GBOwHefHOwfBLTArCcVbTmkx
 OcNagoijgZuviRSt78GeiQMX2eEXeeWcMrzTpzORvH8h4zU+m92wNjEY4Z2rRfOIf9SO
 kqSLSV14mwc4HkG3L24vbFDzaoOf+Nix7SpsIKE3MAtg4RbGI5DoSF/HWu9OclSV0LlY
 BhmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc3wW/X5uOSxR/X7yPU60XtY4WdYYL9/F2ZN0dTm4JlHONeZuIlvePKBg9znEqhW+eoVEqnxTTKNCJfR6y/rD78yXeZ1jPIQ9ppd0KgA==
X-Gm-Message-State: AOJu0Yz5Ijoc7RmCralI5QxeMWtbLqBrIkb2/SmP+0NeMN30HyIqxkMe
 U0SeL8W9281g3+tmDX5lkkz9mJ00qAYg+zqbXlVhii//RkKbt9o+oz2UF1oVzlrPyC1uPZUPn8D
 Bq9Jq7dJRAPeuCrMw4MQjsQK2cYwI4Tou2xVvARwNI9HDci0Azm3eh6m1Ba4lwtw=
X-Received: by 2002:a50:9354:0:b0:579:c4e8:42bf with SMTP id
 4fb4d7f45d1cf-579c4e84380mr4666432a12.12.1716837770908; 
 Mon, 27 May 2024 12:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjAcWifdc1cmj4PyyLda94dlOEBvjOTiDHYgpo+M4fPeLYt+JqhR5bWaQW9VkpsHWQ9CeNbw==
X-Received: by 2002:a50:9354:0:b0:579:c4e8:42bf with SMTP id
 4fb4d7f45d1cf-579c4e84380mr4666397a12.12.1716837770413; 
 Mon, 27 May 2024 12:22:50 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579cec28c0dsm2325554a12.66.2024.05.27.12.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 12:22:50 -0700 (PDT)
Date: Mon, 27 May 2024 21:22:47 +0200
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
 nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlTdh/eQAIhxNn9e@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
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

On Wed, May 22, 2024 at 08:53:34AM +0900, FUJITA Tomonori wrote:
> Hi,
> Thanks for working on the firmware API!
> 
> On Mon, 20 May 2024 19:24:19 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Add an abstraction around the kernels firmware API to request firmware
> > images. The abstraction provides functions to access the firmware
> > buffer and / or copy it to a new buffer allocated with a given allocator
> > backend.
> > 
> > The firmware is released once the abstraction is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/kernel/firmware.rs         | 74 +++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |  1 +
> >  3 files changed, 76 insertions(+)
> >  create mode 100644 rust/kernel/firmware.rs
> > 
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > index b245db8d5a87..e4ffc47da5ec 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -14,6 +14,7 @@
> >  #include <kunit/test.h>
> >  #include <linux/errname.h>
> >  #include <linux/ethtool.h>
> > +#include <linux/firmware.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/mdio.h>
> >  #include <linux/pci.h>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > new file mode 100644
> > index 000000000000..700504fb3c9c
> > --- /dev/null
> > +++ b/rust/kernel/firmware.rs
> > @@ -0,0 +1,74 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Firmware abstraction
> > +//!
> > +//! C header: [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> > +
> > +use crate::{bindings, device::Device, error::Error, error::Result, str::CStr, types::Opaque};
> > +
> > +/// Abstraction around a C firmware struct.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new buffer using `Firmware::copy`. The
> > +/// firmware is released once [`Firmware`] is dropped.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> > +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> 
> Wrapping a raw pointer is not the intended use of Qpaque type?
> 

Indeed, will fix this in v2 and use NonNull instead. I'll also offload most of
the boilerplate in the 'request' functions to some common 'request_internal' one.

