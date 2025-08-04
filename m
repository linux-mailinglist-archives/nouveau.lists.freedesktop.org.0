Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF7CB1A517
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 16:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB94F10E580;
	Mon,  4 Aug 2025 14:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="kmiyfYLX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBE410E580
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 14:38:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754318287; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MChT8eugj/vXVr7hgb4vUki4BVaLr0BKJwiy/4RxMVkDyMn9H4HiVnCUZCTxg086wA2TUKajCI8RCk/GwAfUurHj2+KQdUkqJmFH0lMDt76Xfrwry6oVqoSnSq9HjcSZ+CwGb+Sg97D8uw32SadJDivlj55PRpUfaySX+Jad6cE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754318287;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0XApXGx2KEQYIXsjvjwQn4arPiKU6uUs8Fhf8riawBs=; 
 b=mGOiycIquMlRZRkFqr5B4a/L+T6Ng+UZUMXRVCioC7DvakJVANWlSfSzD/bwpi5CzZ9Dxzy/iHCCKds0tQlTbaQqjSm88W39NtMXZtua7OnF9Q/hKd0MAcFHPZoPV6Tvyw3Vn6euhmhsZZMvM2z8gs6mv3ATaKVGYRV56vBsrdM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754318287; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=0XApXGx2KEQYIXsjvjwQn4arPiKU6uUs8Fhf8riawBs=;
 b=kmiyfYLXCYzQMlBvkmtKGmqJwJQ1xvcxhjkSW1drHlKxCzQMSw0+fR7Yd/dXInph
 YqMewre6sfMAOI/g24DPChQn3oF7tIEU97zzk5bIeRUAOPRPBxD++r8XO1LxsSsYsHj
 g0lTY+q9pRcJttfJr7YoEL/Tv6n1Uu5CaZTWuNyU=
Received: by mx.zohomail.com with SMTPS id 1754318283378211.50192314921037;
 Mon, 4 Aug 2025 07:38:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 1/4] rust: add `CheckedAdd` trait
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250804-num-v2-1-a96b9ca6eb02@nvidia.com>
Date: Mon, 4 Aug 2025 11:37:47 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <395DD2D6-CCCE-47C6-B195-20091382195C@collabora.com>
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-1-a96b9ca6eb02@nvidia.com>
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
> Rust provides traits for standard arithmetic and logic operations, but
> in the context of the kernel we often need to consider overflows. The
> checked Rust arithmetic methods are unfortunately not behind a trait,
> which makes them unavailable to generic code.
>=20
> As a start, add the `CheckedAdd` trait providing the `checked_add`
> operation and implement it for all integer types. Its name and =
location
> are inspired by the user-space `num` crate.
>=20
> This trait is to be first used by the `Alignment` type.
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/lib.rs |  1 +
> rust/kernel/num.rs | 28 ++++++++++++++++++++++++++++
> 2 files changed, 29 insertions(+)
>=20
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index =
6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e4272ff178b8=
211a892c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -89,6 +89,7 @@
> pub mod mm;
> #[cfg(CONFIG_NET)]
> pub mod net;
> +pub mod num;
> pub mod of;
> #[cfg(CONFIG_PM_OPP)]
> pub mod opp;
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..c81bb046078b70c321dd52aa9c2b5518=
be49d249
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +use core::ops::Add;
> +
> +/// Trait for performing a checked addition that returns `None` if =
the operation would overflow.

nit: this can be [`None`] instead, which will let users click on it in =
the docs.

This is of course pretty frivolous.

> +///
> +/// This trait exists in order to represent scalar types already =
having a `checked_add` method in
> +/// generic code.

Maybe =E2=80=9Cscalar types that already have a `checked_add` method?

But overall I feel like the whole sentence is a bit hard to parse, JFYI.

> +pub trait CheckedAdd: Sized + Add<Self, Output =3D Self> {
> +    /// Computes `self + rhs`, returning `None` if an overflow would =
occur.
> +    fn checked_add(self, rhs: Self) -> Option<Self>;
> +}
> +
> +macro_rules! impl_checked_add {
> +    ($($t:ty),*) =3D> {
> +        $(
> +        impl CheckedAdd for $t {
> +            fn checked_add(self, rhs: Self) -> Option<Self> {
> +                self.checked_add(rhs)
> +            }
> +        }
> +        )*
> +    };
> +}
> +
> +impl_checked_add!(u8, u16, u32, u64, usize, i8, i16, i32, i64, =
isize);
>=20
> --=20
> 2.50.1
>=20
>=20


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
