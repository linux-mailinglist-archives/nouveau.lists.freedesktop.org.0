Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F78CBC26
	for <lists+nouveau@lfdr.de>; Wed, 22 May 2024 09:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F44610F427;
	Wed, 22 May 2024 07:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iFUh+Bo4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8868510F428
 for <nouveau@lists.freedesktop.org>; Wed, 22 May 2024 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716363456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8aHWlEgygkwA3tRbeqByxQNqA067pG4KDVYSLn8mH9Y=;
 b=iFUh+Bo42r8y+NmVT0LDUVOsrPw1+GuzkaoXKVMDj3VMm3ltK4Ou0adm64XW4Wuehj7Fhn
 9iDsri5Xr/7XPuv8K0wyjj1smes3rrudEEo893W4932fkVJ8XTKM8NBLUbEh/BioJh0Y0I
 qTcrC8h80/3snI+sK4JghL9mC0UNxIg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-JlQ3n9y7PxKHDoWq6coBxA-1; Wed, 22 May 2024 03:37:35 -0400
X-MC-Unique: JlQ3n9y7PxKHDoWq6coBxA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-792e63282c0so125968485a.3
 for <nouveau@lists.freedesktop.org>; Wed, 22 May 2024 00:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716363455; x=1716968255;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8aHWlEgygkwA3tRbeqByxQNqA067pG4KDVYSLn8mH9Y=;
 b=YaD9QAADipyqTrqTTZ7ecMDUt2GeQAKjrjYV7/SerUFyyAY+jRevSzC9BDiRaESyAc
 hloAgrpmkc9uHDZ1JwCs8Dg/aFXwHl1FDdLFsK3RNw3oqOzhou0YDPqfpSMFKtdLSlSD
 LN1bVJ16yU6Zy7Am5p1JTCT0lyiQK5F0ouP4bPE2ghZrQ4wI6dF5IObEQzMRBNb7wLbz
 EcTSRda+f+Zk4mIJr5xnP/RQA08KHZTnuqZ7/7053LgPROsxzyQ7pW2ZlyJchjOGQTU4
 fJ/D7vNBrVd18Ru1KOgKjl5atN3dTKjj1WQVdMb6fiG5BEVUf6oQ0Uk3foAd2pFTGfw9
 Gq3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWMbqumZc9FDnjl9hwcWXpySeVcWpIND7v8yU6jHG6zcCwlma9ymf5N1pXM/zUGezs9vYBLjyKK7PSMAxbWQ/UMnTXZri+UpouvXRWJA==
X-Gm-Message-State: AOJu0YyQgM8Smn66Hp6C0lCe/ahQ+2USKS9IEmEIons6uSadivSnZauT
 ADMQRt54fqA9q2rk2ox94a1iR+HCQjPlomsla49/YPj9BHAcK4+NLXdpqkxL//PcDyByCXOBX7s
 W11Cp9iVix19AkoDjKGWFjvWF4Wvsqgi8LmAyE+ZMmwYCP9nlrnLxEBKdmnkvdbM=
X-Received: by 2002:a05:620a:4491:b0:790:fbf5:e31a with SMTP id
 af79cd13be357-794994a9433mr122624685a.3.1716363454846; 
 Wed, 22 May 2024 00:37:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtHk4to1dfo+BAJjETLLTN0cBCNnEmnRqv15MBpg+2BkTIqUUVEK1If53rgActa2EPcK5xJw==
X-Received: by 2002:a05:620a:4491:b0:790:fbf5:e31a with SMTP id
 af79cd13be357-794994a9433mr122621485a.3.1716363454268; 
 Wed, 22 May 2024 00:37:34 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79481013155sm320794285a.115.2024.05.22.00.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:37:34 -0700 (PDT)
Message-ID: <35fef820ed6e67f2203e78735fc9e15248436221.camel@redhat.com>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: Philipp Stanner <pstanner@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, dakr@redhat.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de,  airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com,  wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net,  bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com,  aliceryhl@google.com, lina@asahilina.net,
 ajanulgu@redhat.com, lyude@redhat.com,  gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 22 May 2024 09:37:30 +0200
In-Reply-To: <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 2024-05-22 at 08:53 +0900, FUJITA Tomonori wrote:
> Hi,
> Thanks for working on the firmware API!
>=20
> On Mon, 20 May 2024 19:24:19 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
>=20
> > Add an abstraction around the kernels firmware API to request
> > firmware
> > images. The abstraction provides functions to access the firmware
> > buffer and / or copy it to a new buffer allocated with a given
> > allocator
> > backend.
> >=20
> > The firmware is released once the abstraction is dropped.
> >=20
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> > =C2=A0 rust/bindings/bindings_helper.h |=C2=A0 1 +
> > =C2=A0 rust/kernel/firmware.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 74
> > +++++++++++++++++++++++++++++++++
> > =C2=A0 rust/kernel/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 3 files changed, 76 insertions(+)
> > =C2=A0 create mode 100644 rust/kernel/firmware.rs
> >=20
> > diff --git a/rust/bindings/bindings_helper.h
> > b/rust/bindings/bindings_helper.h
> > index b245db8d5a87..e4ffc47da5ec 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -14,6 +14,7 @@
> > =C2=A0 #include <kunit/test.h>
> > =C2=A0 #include <linux/errname.h>
> > =C2=A0 #include <linux/ethtool.h>
> > +#include <linux/firmware.h>
> > =C2=A0 #include <linux/jiffies.h>
> > =C2=A0 #include <linux/mdio.h>
> > =C2=A0 #include <linux/pci.h>
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
> > [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> > +
> > +use crate::{bindings, device::Device, error::Error, error::Result,
> > str::CStr, types::Opaque};
> > +
> > +/// Abstraction around a C firmware struct.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just
> > like with the C API, firmware can
> > +/// be requested. Once requested the abstraction provides direct
> > access to the firmware buffer as
> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new
> > buffer using `Firmware::copy`. The
> > +/// firmware is released once [`Firmware`] is dropped.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// let fw =3D Firmware::request("path/to/firmware.bin",
> > dev.as_ref())?;
> > +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(Opaque<*const bindings::firmware>);
>=20
> Wrapping a raw pointer is not the intended use of Qpaque type?
>=20

What is the intended use?
As I see it, all uses wrapp some binding::* =E2=80=93 but a rawpointer to a
binding shouldn't be wrapped by it?

Maybe we can add something to the docu in kernel/types.rs:


/// Stores an opaque value.
///
/// This is meant to be used with FFI objects that are never interpreted by=
 Rust code.
#[repr(transparent)]
pub struct Opaque<T> {



P.

