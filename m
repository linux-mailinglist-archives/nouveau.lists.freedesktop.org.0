Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663388D0C60
	for <lists+nouveau@lfdr.de>; Mon, 27 May 2024 21:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D1510E339;
	Mon, 27 May 2024 19:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UBurDy4+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB7210E339
 for <nouveau@lists.freedesktop.org>; Mon, 27 May 2024 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716837539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=loF/Mw/iiB0HChmBYp73+/pJGWRpuF8gSDZHmx+bf5o=;
 b=UBurDy4+FK+C8xdNcXaFwwOU7T4EAKTa33YxJVHYi/XzLEpDN72lqnjmP8ki3iEd4PfzU8
 X2e5DmzPiqC8ePFdpHw3KJIOcP5qyYAEvCiLpREZHmXLjeQZwYd2F3x+jZa7zNRFMaLU3l
 f9kb0/lOjjDel4/LPS/GcC0C+xjbPxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-tvlxrCREOaK00NL3Hbms0Q-1; Mon, 27 May 2024 15:18:58 -0400
X-MC-Unique: tvlxrCREOaK00NL3Hbms0Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42110d8bf69so145855e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 27 May 2024 12:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716837537; x=1717442337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loF/Mw/iiB0HChmBYp73+/pJGWRpuF8gSDZHmx+bf5o=;
 b=b+E91Jgy1xiymCg22QFYJyrUIIES5B+jGCxhPBwdNReCJL2gAe/Z/iXpvBHefw/3QG
 T/a6KYs7td3jUDsRhDgJJNqgtNqo6hG5UVqz8JOUHQQ8tgpa57VTObkRpMlFAyjkXUod
 Ri0b8RbwN864twL8T+kTmWd28Nm21LEU2BGiONH5v6ezXUlfujpeHpCaZ6Qdbt89Rj8S
 hYdXhQtIrnxVqGpzgvicb0Ua11pKeC1eLoKcsAwGyZTw5j+p1qPuKTjmaivq6xSdudH8
 0VnBZXn6DSIIQ0rWoSXvlo5yZxi80fcFWq1hZi6e+2/49omMNrLjDLMzcmJ3TT04w6Z2
 RXFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGC9s7vZ3cYWJsbyMcBbnRY/iSvgyDS4Y4DNkrNb9ZhRCqSHZfv4gFjCckWkIvp7lA1Swc/PiRrKL1Zmbr0fnFRD56OScyFZVQQ8g54A==
X-Gm-Message-State: AOJu0YyOofjOpHd6X+k8HfsE02ED6m6BOh9tWaeUDU6mW41XdPsgsr+A
 P4pE55hBTVom/udKiU6lrEr8irChTLk8w05VG/sj2Rvr5fKAjVliLwa0rQXe/t93W1dzho0sKt8
 mTJzxrKOVnhiQpLGOpe6t5TQs7Wqwx6uvK5L1UCUipKnSad2d0rXjfxkZuupSdJc=
X-Received: by 2002:a05:600c:4689:b0:41c:258:9b70 with SMTP id
 5b1f17b1804b1-42108aa8976mr66428635e9.28.1716837537003; 
 Mon, 27 May 2024 12:18:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKHkf3fuR3OotFm1vYpWip60TZra03wLXGfTzr8DfdrTUs58Tc9BX3jnSjZDeprGP/Fk6eoQ==
X-Received: by 2002:a05:600c:4689:b0:41c:258:9b70 with SMTP id
 5b1f17b1804b1-42108aa8976mr66428285e9.28.1716837536522; 
 Mon, 27 May 2024 12:18:56 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089cc4e2sm118071795e9.39.2024.05.27.12.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 12:18:55 -0700 (PDT)
Date: Mon, 27 May 2024 21:18:53 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlTcnYNff2EDQJdj@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240521083231.000074c2.zhiw@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240521083231.000074c2.zhiw@nvidia.com>
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

On Tue, May 21, 2024 at 08:32:31AM +0300, Zhi Wang wrote:
> On Mon, 20 May 2024 19:24:19 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Add an abstraction around the kernels firmware API to request firmware
> > images. The abstraction provides functions to access the firmware
> > buffer and / or copy it to a new buffer allocated with a given
> > allocator backend.
> > 
> 
> Was playing with firmware extractions based on this patch.
> Unfortunately I ended up with a lot of pointer operations, unsafe
> statements.
> 
> As we know many vendors have a C headers for the definitions of the
> firwmare content, the driver extract the data by applying a struct
> pointer on it.
> 
> But in rust, I feel it would nice that we can also have a common
> firmware extractor for drivers, that can wrap the pointer operations,
> take a list of the firmware struct members that converted from C headers
> as the input, offer the driver some common ABI methods to query them.
> Maybe that would ease the pain a lot.

So, you mean some abstraction that takes a list of types, offsets in the
firmware and a reference to the firmware itself and provides references to the
corresponding objects?

I agree it might be helpful to have some common infrastructure for this, but the
operations on it would still be unsafe, since ultimately it involves
dereferencing pointers.

> 
> Thanks,
> Zhi.
> 
> > The firmware is released once the abstraction is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/kernel/firmware.rs         | 74
> > +++++++++++++++++++++++++++++++++ rust/kernel/lib.rs              |
> > 1 + 3 files changed, 76 insertions(+)
> >  create mode 100644 rust/kernel/firmware.rs
> > 
> > diff --git a/rust/bindings/bindings_helper.h
> > b/rust/bindings/bindings_helper.h index b245db8d5a87..e4ffc47da5ec
> > 100644 --- a/rust/bindings/bindings_helper.h
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
> > +//! C header:
> > [`include/linux/firmware.h`](../../../../include/linux/firmware.h") +
> > +use crate::{bindings, device::Device, error::Error, error::Result,
> > str::CStr, types::Opaque}; +
> > +/// Abstraction around a C firmware struct.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just
> > like with the C API, firmware can +/// be requested. Once requested
> > the abstraction provides direct access to the firmware buffer as +///
> > `&[u8]`. Alternatively, the firmware can be copied to a new buffer
> > using `Firmware::copy`. The +/// firmware is released once
> > [`Firmware`] is dropped. +/// +/// # Examples
> > +///
> > +/// ```
> > +/// let fw = Firmware::request("path/to/firmware.bin",
> > dev.as_ref())?; +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> > +
> > +impl Firmware {
> > +    /// Send a firmware request and wait for it. See also
> > `bindings::request_firmware`.
> > +    pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
> > +        let fw = Opaque::uninit();
> > +
> > +        let ret = unsafe { bindings::request_firmware(fw.get(),
> > name.as_char_ptr(), dev.as_raw()) };
> > +        if ret != 0 {
> > +            return Err(Error::from_errno(ret));
> > +        }
> > +
> > +        Ok(Firmware(fw))
> > +    }
> > +
> > +    /// Send a request for an optional fw module. See also
> > `bindings::request_firmware_nowarn`.
> > +    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self>
> > {
> > +        let fw = Opaque::uninit();
> > +
> > +        let ret = unsafe {
> > +            bindings::firmware_request_nowarn(fw.get(),
> > name.as_char_ptr(), dev.as_raw())
> > +        };
> > +        if ret != 0 {
> > +            return Err(Error::from_errno(ret));
> > +        }
> > +
> > +        Ok(Firmware(fw))
> > +    }
> > +
> > +    /// Returns the size of the requested firmware in bytes.
> > +    pub fn size(&self) -> usize {
> > +        unsafe { (*(*self.0.get())).size }
> > +    }
> > +
> > +    /// Returns the requested firmware as `&[u8]`.
> > +    pub fn data(&self) -> &[u8] {
> > +        unsafe {
> > core::slice::from_raw_parts((*(*self.0.get())).data, self.size()) }
> > +    }
> > +}
> > +
> > +impl Drop for Firmware {
> > +    fn drop(&mut self) {
> > +        unsafe { bindings::release_firmware(*self.0.get()) };
> > +    }
> > +}
> > +
> > +// SAFETY: `Firmware` only holds a pointer to a C firmware struct,
> > which is safe to be used from any +// thread.
> > +unsafe impl Send for Firmware {}
> > +
> > +// SAFETY: `Firmware` only holds a pointer to a C firmware struct,
> > references to which are safe to +// be used from any thread.
> > +unsafe impl Sync for Firmware {}
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 6415968ee3b8..ed97d131661a 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -35,6 +35,7 @@
> >  #[cfg(CONFIG_DRM = "y")]
> >  pub mod drm;
> >  pub mod error;
> > +pub mod firmware;
> >  pub mod init;
> >  pub mod ioctl;
> >  #[cfg(CONFIG_KUNIT)]
> 

