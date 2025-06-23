Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F61AE3E26
	for <lists+nouveau@lfdr.de>; Mon, 23 Jun 2025 13:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AAF10E037;
	Mon, 23 Jun 2025 11:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="brTGUUYv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1AC10E35C
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 11:42:07 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-450eaae2934so35108495e9.2
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 04:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750678926; x=1751283726;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=gOakrre7l7gSs8tnftFg1umC3O4hex3jEXhe5bAXm4c=;
 b=brTGUUYvgh1HB2R5+PhqvsTFj6FMIb7Y3PGofDI1kat9g9a/OpdAYG1MPJjEPgZCCy
 j11r4rbFXXccnggu0mXjZyGU3gxPi5fWdzUcvP8HBMoYueuJ4Au5prLhWkSxbOPcULNB
 9IVpNYmY1OMTmrereKznLBvnvi9hkKqiMSxg05vKc95nszpPnjsK4k1bgKdE2TDpAAl+
 l0gd8fXsPWQRRn7xMlG4mjjWfidNKKzIRsH5G00RS18o8akwDLmfqR5+mexMdmKvhSrh
 G5Dv4uSU5hg4z8aPf5IwhfQ7hc49l9h/etzqlLNeEs0d8sg8PVNrTJSwjrIUqtl4Apzc
 5SHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750678926; x=1751283726;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gOakrre7l7gSs8tnftFg1umC3O4hex3jEXhe5bAXm4c=;
 b=huu/Zf3ajj9/fyHwNe0HZzGN+sKvhTf3kI/+ENZ1sX2k/OwuQ9wzrXx4uNeGn0KoHu
 WGzKAuqOnYiN+EcS6D/uf0R32HqBSnGe+PCga72bPGgynQ/8XHwhobgFR2fmnRjNHEe+
 lvN3cAu475UM52yCFESNJXuaK9S8CZ8w88Ns4/66zdASDu9x/Td1mxRxkJSjOZmMDRBd
 eKsCLH1sjuqV+aFoqoOagsFrSVFb27SP+7zcQIFTZb3ztK/VSd6GIvJSBdNKE+aWQX7G
 jaTsaQo5JdCNPFYHThcYbcZOnMjVT/c7ltrYvnmxv6VhdC2rMeyw3n05beCgyph6W5fd
 e/fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdhPo5qtpl7IG8ns0KTbT4HRkzYrJW4ntEOhqC8c2K1pHcKHK1rx8huMY9m3mQQAqz3wBA6zq+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHm+FMkXlfIqf1k8pCSBeiZhx3Yg+yLczvRoi2xv1IEBaDllQO
 TZLqmZK2WBi5rKG0xMGt9UHDCcX8ThC+fHD4HwFOBxowj6oC/OpsjNwDtnXRfNSD9Oc9vUPMsfQ
 9HxdyFtLYvpZofi8C6A==
X-Google-Smtp-Source: AGHT+IFLgU2zCTWelcLduERfWArl79+0ODmzTBoOgn9WbMCJ/VeopIZFCpbEQxpUShrPw9S7d8IZRIEelvQI5Xg=
X-Received: from wmbfs6.prod.google.com ([2002:a05:600c:3f86:b0:453:ccf:1528])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b14:b0:453:a88:d509 with SMTP id
 5b1f17b1804b1-453659ca92cmr134236355e9.10.1750678925797; 
 Mon, 23 Jun 2025 04:42:05 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:42:03 +0000
In-Reply-To: <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
Mime-Version: 1.0
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
Message-ID: <aFk9i71j2rKcC6KL@google.com>
Subject: Re: [PATCH 2/3] rust: num: add the `last_set_bit` operation
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
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

On Fri, Jun 20, 2025 at 10:14:52PM +0900, Alexandre Courbot wrote:
> Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
> unsigned types.
> 
> It is to be first used by the nova-core driver.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/num.rs | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> index 6ecff037893dd25420a6369ea0cd6adbe3460b29..95766201a7cf208989f37ecbc6d54d264385a754 100644
> --- a/rust/kernel/num.rs
> +++ b/rust/kernel/num.rs
> @@ -161,3 +161,41 @@ pub const fn align_up(self, value: $t) -> $t {
>  }
>  
>  power_of_two_impl!(usize, u8, u16, u32, u64, u128);
> +
> +macro_rules! impl_last_set_bit {
> +    ($($t:ty),+) => {
> +        $(
> +            ::kernel::macros::paste! {

I think this would read slightly nicer with the paste! invocation on the
outer scope.

$(::kernel::macros::paste! {
    ...
})+

> +            /// Last Set Bit: return the 1-based index of the last (i.e. most significant) set bit
> +            /// in `v`.
> +            ///
> +            /// Equivalent to the C `fls` function.
> +            ///
> +            /// # Examples
> +            ///
> +            /// ```
> +            #[doc = concat!("use kernel::num::last_set_bit_", stringify!($t), ";")]
> +            ///
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x0), 0);")]
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x1), 1);")]
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x10), 5);")]
> +            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x1f), 5);")]
> +            #[doc = concat!(
> +                "assert_eq!(last_set_bit_",
> +                stringify!($t),
> +                "(",
> +                stringify!($t),
> +                "::MAX), ",
> +                stringify!($t), "::BITS);"
> +            )]
> +            /// ```
> +            #[inline(always)]
> +            pub const fn [<last_set_bit_ $t>](v: $t) -> u32 {
> +                $t::BITS - v.leading_zeros()
> +            }
> +            }
> +        )+
> +    };
> +}
> +
> +impl_last_set_bit!(usize, u8, u16, u32, u64, u128);
> 
> -- 
> 2.49.0
> 
