Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96A3B1A666
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 17:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821C810E388;
	Mon,  4 Aug 2025 15:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="XgijLtNN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2FC10E388
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 15:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754322468; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R9bQUDhJuw93pt2lYWV7zKW73ZaECvForTb7nHCT/m+ui8reGDK3124eYUwnO+RMilRpyz1KLja8exZcA6Nkob4DV2NZ7b50uSbIcYyKuYUGc3IqI4hgmM5br2CVzR89vw1SbPh9YcI72/Keb5HkZyZRk52Z3QzH7ZB7IbZG9GU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754322468;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0T/RWsewXHZeN+3s5jOGwdrn4Ucl16ES56csWxcyca0=; 
 b=PHmEfV98ITLTwaj2bGYFM2stFz09+amaLLFKE4kFsZu7g8OwKszNy3KzYcYfIgm39jomDD3Y93shqnNmAs+hYmr8gKC54CMelQCbi+J14y1CRDtVf7lQl6PlnuxK2otqWxEHY2Sz6dKkmkoaaFSMHq3yKGAjtY0FMqhpNqGU248=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754322468; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=0T/RWsewXHZeN+3s5jOGwdrn4Ucl16ES56csWxcyca0=;
 b=XgijLtNNP2Nt9IVKCCn92JukTCCm66TrUmjwBxHDWqvN4GPjWhrOIkcwFVcwiav1
 qFponwBv8RndLLOveFHwxWkmGBb5HnPbZZz4zlXoxAtfsOb5jv1Rb0SxZtEKU3XATUc
 QABD4hrXkez2yT+gMJvIy/dAEuI9iCxLupEjKMsM=
Received: by mx.zohomail.com with SMTPS id 1754322463977676.6869364729142;
 Mon, 4 Aug 2025 08:47:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 2/4] rust: add `Alignment` type
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
Date: Mon, 4 Aug 2025 12:47:27 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A13D612-F5A6-4D7C-A2FC-2FF54646D4E4@collabora.com>
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External
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

Hi Alex,

> On 4 Aug 2025, at 08:45, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Alignment operations are very common in the kernel. Since they are
> always performed using a power of two value, enforcing this invariant
> through a dedicated type leads to less bugs and can lead to improved
> generated code.
>=20
> Introduce the `Alignment` type, inspired by the nightly Rust feature =
of
> the same name. It provides the same interface as its upstream =
namesake,
> while extending it with `align_up` and `align_down` operations that =
are
> usable on any integer type.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/lib.rs |   1 +
> rust/kernel/ptr.rs | 213 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 214 insertions(+)
>=20
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index =
2955f65da1278dd4cba1e4272ff178b8211a892c..0e66b55cde66ee1b274862cd78ad465a=
572dc5d9 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -100,6 +100,7 @@
> pub mod platform;
> pub mod prelude;
> pub mod print;
> +pub mod ptr;
> pub mod rbtree;
> pub mod revocable;
> pub mod security;
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..6d941db58944619ea5b05676af06981a=
3ceaaca8
> --- /dev/null
> +++ b/rust/kernel/ptr.rs
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Types and functions to work with pointers and addresses.
> +
> +use core::fmt::Debug;
> +use core::num::NonZero;
> +use core::ops::{BitAnd, Not};
> +
> +use crate::build_assert;
> +use crate::num::CheckedAdd;
> +
> +/// Type representing an alignment, which is always a power of two.
> +///
> +/// It be used to validate that a given value is a valid alignment, =
and to perform masking and
> +/// align down/up operations. The alignment operations are done using =
the [`align_up!`] and

Nit: I=E2=80=99d go with =E2=80=9Calign up or align down operations=E2=80=9D=
 instead of using a slash.

> +/// [`align_down!`] macros.
> +///
> +/// Heavily inspired by the [`Alignment`] nightly feature from the =
Rust standard library, and
> +/// hopefully to be eventually replaced by it.

It=E2=80=99s a bit hard to parse this.

Also, I wonder if we should standardize some syntax for TODOs so we can =
parse
them using a script? This way we can actually keep track and perhaps =
pipe them
to our GitHub page as =E2=80=9Cgood first issues=E2=80=9D or just =
regular issues.

I guess a simple "// TODO: =E2=80=9C here will do, for example.

> +///
> +/// [`Alignment`]: https://github.com/rust-lang/rust/issues/102070
> +///
> +/// # Invariants
> +///
> +/// An alignment is always a power of two.
> +#[repr(transparent)]
> +#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
> +pub struct Alignment(NonZero<usize>);
> +
> +impl Alignment {
> +    /// Validates that `align` is a power of two at build-time, and =
returns an [`Alignment`] of the
> +    /// same value.
> +    ///
> +    /// A build error is triggered if `align` cannot be asserted to =
be a power of two.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// let v =3D Alignment::new(16);
> +    /// assert_eq!(v.as_usize(), 16);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn new(align: usize) -> Self {
> +        build_assert!(align.is_power_of_two());
> +
> +        // INVARIANT: `align` is a power of two.
> +        // SAFETY: `align` is a power of two, and thus non-zero.
> +        Self(unsafe { NonZero::new_unchecked(align) })
> +    }
> +
> +    /// Validates that `align` is a power of two at runtime, and =
returns an
> +    /// [`Alignment`] of the same value.
> +    ///
> +    /// [`None`] is returned if `align` was not a power of two.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// assert_eq!(Alignment::new_checked(16), =
Some(Alignment::new(16)));
> +    /// assert_eq!(Alignment::new_checked(15), None);
> +    /// assert_eq!(Alignment::new_checked(1), =
Some(Alignment::new(1)));
> +    /// assert_eq!(Alignment::new_checked(0), None);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn new_checked(align: usize) -> Option<Self> {
> +        if align.is_power_of_two() {
> +            // INVARIANT: `align` is a power of two.
> +            // SAFETY: `align` is a power of two, and thus non-zero.
> +            Some(Self(unsafe { NonZero::new_unchecked(align) }))
> +        } else {
> +            None
> +        }
> +    }
> +
> +    /// Returns the alignment of `T`.
> +    #[inline(always)]
> +    pub const fn of<T>() -> Self {
> +        // INVARIANT: `align_of` always returns a power of 2.
> +        Self(unsafe { NonZero::new_unchecked(align_of::<T>()) })
> +    }

> +
> +    /// Returns the base-2 logarithm of the alignment.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// assert_eq!(Alignment::of::<u8>().log2(), 0);
> +    /// assert_eq!(Alignment::new(16).log2(), 4);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn log2(self) -> u32 {
> +        self.0.ilog2()
> +    }
> +
> +    /// Returns this alignment as a [`NonZero`].
> +    ///
> +    /// It is guaranteed to be a power of two.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// assert_eq!(Alignment::new(16).as_nonzero().get(), 16);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn as_nonzero(self) -> NonZero<usize> {
> +        if !self.0.is_power_of_two() {
> +            // SAFETY: per the invariants, `self.0` is always a power =
of two so this block will
> +            // never be reached.
> +            unsafe { core::hint::unreachable_unchecked() }
> +        }
> +        self.0
> +    }
> +
> +    /// Returns this alignment as a `usize`.
> +    ///
> +    /// It is guaranteed to be a power of two.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// assert_eq!(Alignment::new(16).as_usize(), 16);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn as_usize(self) -> usize {
> +        self.as_nonzero().get()
> +    }
> +
> +    /// Returns the mask corresponding to `self.as_usize() - 1`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// assert_eq!(Alignment::new(0x10).mask(), 0xf);
> +    /// ```
> +    #[inline(always)]
> +    pub const fn mask(self) -> usize {
> +        // INVARIANT: `self.as_usize()` is guaranteed to be a power =
of two (i.e. non-zero), thus
> +        // `1` can safely be substracted from it.
> +        self.as_usize() - 1
> +    }
> +
> +    /// Aligns `value` down to this alignment.
> +    ///
> +    /// If the alignment contained in `self` is too large for `T`, =
then `0` is returned, which
> +    /// is correct as it is also the result that would have been =
returned if it did.

I half get this, but still: If it did what?

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// assert_eq!(Alignment::new(0x10).align_down(0x2f), 0x20);
> +    /// assert_eq!(Alignment::new(0x10).align_down(0x30), 0x30);
> +    /// assert_eq!(Alignment::new(0x1000).align_down(0xf0u8), 0x0);
> +    /// ```
> +    #[inline(always)]
> +    pub fn align_down<T>(self, value: T) -> T
> +    where
> +        T: TryFrom<usize> + BitAnd<Output =3D T> + Not<Output =3D T> =
+ Default,
> +    {
> +        T::try_from(self.mask())
> +            .map(|mask| value & !mask)
> +            .unwrap_or(T::default())
> +    }
> +
> +    /// Aligns `value` up to this alignment, returning `None` if =
aligning pushes the result above
> +    /// the limits of `value`'s type.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::ptr::Alignment;
> +    ///
> +    /// assert_eq!(Alignment::new(0x10).align_up(0x4f), Some(0x50));
> +    /// assert_eq!(Alignment::new(0x10).align_up(0x40), Some(0x40));
> +    /// assert_eq!(Alignment::new(0x10).align_up(0x0), Some(0x0));
> +    /// assert_eq!(Alignment::new(0x10).align_up(u8::MAX), None);
> +    /// assert_eq!(Alignment::new(0x100).align_up(0x10u8), None);
> +    /// assert_eq!(Alignment::new(0x100).align_up(0x0u8), Some(0x0));
> +    /// ```
> +    #[inline(always)]
> +    pub fn align_up<T>(self, value: T) -> Option<T>
> +    where
> +        T: TryFrom<usize>
> +            + BitAnd<Output =3D T>
> +            + Not<Output =3D T>
> +            + Default
> +            + PartialEq
> +            + Copy
> +            + CheckedAdd,
> +    {
> +        let aligned_down =3D self.align_down(value);
> +        if value =3D=3D aligned_down {
> +            Some(aligned_down)
> +        } else {
> +            T::try_from(self.as_usize())
> +                .ok()
> +                .and_then(|align| aligned_down.checked_add(align))
> +        }
> +    }
> +}
>=20
> --=20
> 2.50.1
>=20
>=20

Everything else looks fine, IMHO.

=E2=80=94 Daniel

