Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A90CDD833
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 09:38:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 737F311AC03;
	Thu, 25 Dec 2025 08:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u7K7YT1f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7E01244C6D;
	Thu, 25 Dec 2025 08:30:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766651414;
 b=THUP0Sd1tP7K1x0aqJGARot3955j6yJYzBGbCXYu95uC0ZjND3kHBW4WW5MxuSD9mnaAH
 KjXqgewh0RK7xcV3vUKXJdIXy3JV/6I1oEYYznC3HDBtxW6gRn4oeO/qnl6nW9hLp23yWUB
 SUdN/ARLjKR+PaK1gzcQAQd3ooa+JRJ7H0OdEb7qqMloJoVNP87hlIYZpfnnn1vJX3eOaIS
 AdIF+ydsIx7bKf/uRg8oEqwpHrmw6dcHDlHqBs9YiqK4RummhgtNNf0tI9GIS0LY4N7SPVy
 bQrgHZpBg1Xv7f4mJSwSO1yvF59jt3zp/G2SSsXEjB4hSQb92u7b385pl7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766651414; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GjygCXK1GPYj9W6CoxCzPTnWPE8Kc6d7UcGa+3SLwrg=;
 b=JFEMYXYBTalZ9epPUb73bFmGePuiBfEB2kNLtaZ3T2uPzOmAOqLy/m6+EEBP8RrwX8cRM
 e9vw6H7sGBe82LuGXrTsEXyPyLE+Jfz2eagrXjDEPLFCfJUSbUTP5TpLrrBrTnFFCeL7fOR
 x0qd5GLEACg2YJGCKkHNS6Sd4EuOuH3WrJN2XkJbRbC8q+0MDByoQ5VSjrFfoQRdhiP9Ncm
 doUkviuzDlUT2KAzpUL8jJHh616c5RwoJ8khcYSI22FT9gJ0fwVLyKcXjcyknSDhCFlT0fc
 32Vq2+R4R8BZBhonBlmVLIbIADr+r/oZ9a/6EHuXXLCoaEujdq3FkzSUwhug==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id ED8F144C5C
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 08:30:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB825112EB4
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6645C44452;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3859AC16AAE;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766651875;
	bh=/uKl1PFp+5/UbX3th8IeCZMAt9/LNq8Ebt1s0AOGn6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u7K7YT1fLjoQJ66NL1+awwatHkrbRwEiyN3ve7dozucfeBZAkCXR289dwu91hugkx
	 xWtXMplFYqPiDKRV8D4Pn5hvhDutyUPlG9yAzpxXT3SRk/yiXX+m/DefbRcIwHExsk
	 HbVG4ZvmuWWPIBSdIYhxKvcccSHG6prkyKlY+4FqTvp+7rsfhhQ9cbBvZXLPxPZO7b
	 VIbLS86pqRnrjvopBf6C8zDk9GaETsQHfoDYhZjpq5H27Ilwr98M3hp2inBuO/8RB6
	 ohPA7taWT9VQ0Si978UhdTjp2crolhkJOVRY2uKES3pbD8KlIOERVcAj/dG23xjnG8
	 O7St0f7gqBLiw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D464E784A6;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Thu, 25 Dec 2025 08:37:48 +0000
Subject: [PATCH v4 2/4] rust: macros: add derive macro for `TryFrom`
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-try-from-into-macro-v4-2-4a563d597836@gmail.com>
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
In-Reply-To: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766651873; l=10323;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=r7sp35OD69C2rrD2B8/6PQ+AdErp08gK/fQ9WuVo77U=;
 b=OATMTspRpfvOCzDCQGHDIpegplqChFKkXHkFhcvjfPp9VsBz+K727vqzgsBgkqvenTcUvdCZK
 Gi1+XU4A7E1DNyIEGYufy+cQPVwsbxxqA+zoXh2RXT9YIszmOqz9ZtF
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Message-ID-Hash: ACCZBPVBV5ROUME55TZUA5BWUK65XSZV
X-Message-ID-Hash: ACCZBPVBV5ROUME55TZUA5BWUK65XSZV
X-MailFrom: devnull+y.j3ms.n.gmail.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: y.j3ms.n@gmail.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ACCZBPVBV5ROUME55TZUA5BWUK65XSZV/>
Archived-At: 
 <https://lore.freedesktop.org/20251225-try-from-into-macro-v4-2-4a563d597836@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Jesung Yang <y.j3ms.n@gmail.com>

Introduce a procedural macro `TryFrom` to automatically implement the
`TryFrom` trait for unit-only enums.

This reduces boilerplate in cases where numeric values need to be
interpreted as relevant enum variants. This situation often arises when
working with low-level data sources. A typical example is the `Chipset`
enum in nova-core, where the value read from a GPU register should be
mapped to a corresponding variant.

The macro not only supports primitive types such as `bool` or `i8`, but
also `Bounded`, a wrapper around integer types limiting the number of
bits usable for value representation. This accommodates the shift toward
more restrictive register field representations in nova-core where
values are constrained to specific bit ranges.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs |  64 +++++++++++++++++++
 rust/macros/lib.rs     | 162 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 3e623cc894bff279482dd9daeaa7054937357ec6..d49a58e85de16d13ce9a51cafa31940e42c5840f 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -30,6 +30,10 @@ pub(crate) fn derive_into(input: DeriveInput) -> syn::Result<TokenStream> {
     derive(DeriveTarget::Into, input)
 }
 
+pub(crate) fn derive_try_from(input: DeriveInput) -> syn::Result<TokenStream> {
+    derive(DeriveTarget::TryFrom, input)
+}
+
 fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream> {
     let mut errors: Option<syn::Error> = None;
     let mut combine_error = |err| match errors.as_mut() {
@@ -108,18 +112,21 @@ fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream>
 #[derive(Clone, Copy, Debug)]
 enum DeriveTarget {
     Into,
+    TryFrom,
 }
 
 impl DeriveTarget {
     fn get_trait_name(&self) -> &'static str {
         match self {
             Self::Into => "Into",
+            Self::TryFrom => "TryFrom",
         }
     }
 
     fn get_helper_name(&self) -> &'static str {
         match self {
             Self::Into => "into",
+            Self::TryFrom => "try_from",
         }
     }
 }
@@ -184,6 +191,7 @@ fn derive_for_enum(
 ) -> TokenStream {
     let impl_fn = match target {
         DeriveTarget::Into => impl_into,
+        DeriveTarget::TryFrom => impl_try_from,
     };
 
     let qualified_repr_ty: syn::Path = parse_quote! { ::core::primitive::#repr_ty };
@@ -237,6 +245,54 @@ fn from(#param: #enum_ident) -> #input_ty {
         }
     }
 
+    fn impl_try_from(
+        enum_ident: &Ident,
+        variants: &[Ident],
+        repr_ty: &syn::Path,
+        input_ty: &ValidTy,
+    ) -> TokenStream {
+        let param = Ident::new("value", Span::call_site());
+
+        let overflow_assertion = emit_overflow_assert(enum_ident, variants, repr_ty, input_ty);
+        let emit_cast = |variant| {
+            let variant = ::quote::quote! { #enum_ident::#variant };
+            match input_ty {
+                ValidTy::Bounded(inner) => {
+                    let base_ty = inner.emit_qualified_base_ty();
+                    let expr = parse_quote! { #variant as #base_ty };
+                    inner.emit_new(&expr)
+                }
+                ValidTy::Primitive(ident) if ident == "bool" => {
+                    ::quote::quote! { ((#variant as #repr_ty) == 1) }
+                }
+                qualified @ ValidTy::Primitive(_) => ::quote::quote! { #variant as #qualified },
+            }
+        };
+
+        let clauses = variants.iter().map(|variant| {
+            let cast = emit_cast(variant);
+            ::quote::quote! {
+                if #param == #cast {
+                    ::core::result::Result::Ok(#enum_ident::#variant)
+                } else
+            }
+        });
+
+        ::quote::quote! {
+            #[automatically_derived]
+            impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
+                type Error = ::kernel::prelude::Error;
+                fn try_from(#param: #input_ty) -> Result<#enum_ident, Self::Error> {
+                    #overflow_assertion
+
+                    #(#clauses)* {
+                        ::core::result::Result::Err(::kernel::prelude::EINVAL)
+                    }
+                }
+            }
+        }
+    }
+
     fn emit_overflow_assert(
         enum_ident: &Ident,
         variants: &[Ident],
@@ -389,6 +445,14 @@ fn emit_from_expr(&self, expr: &Expr) -> TokenStream {
         }
     }
 
+    fn emit_new(&self, expr: &Expr) -> TokenStream {
+        let Self { base_ty, bits, .. } = self;
+        let qualified_name: syn::Path = parse_str(Self::QUALIFIED_NAME).expect("valid path");
+        ::quote::quote! {
+            #qualified_name::<#base_ty, #bits>::new::<{ #expr }>()
+        }
+    }
+
     fn emit_qualified_base_ty(&self) -> TokenStream {
         let base_ty = &self.base_ty;
         ::quote::quote! { ::core::primitive::#base_ty }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 02528d7212b75d28788f0c33479edb272fa12e27..4dc7de0167a53b778562e24cd145cece50555d91 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -632,3 +632,165 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
         .unwrap_or_else(syn::Error::into_compile_error)
         .into()
 }
+
+/// A derive macro for generating an implementation of the [`TryFrom`] trait.
+///
+/// This macro automatically derives the [`TryFrom`] trait for a given enum. Currently,
+/// it only supports [unit-only enum]s.
+///
+/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.unit-only
+///
+/// # Notes
+///
+/// - The macro generates [`TryFrom`] implementations that:
+///   - Return `Ok(VARIANT)` when the input corresponds to a variant.
+///   - Return `Err(EINVAL)` when the input does not correspond to any variant.
+///     (where `EINVAL` is from [`kernel::error::code`]).
+///
+/// - The macro uses the `try_from` custom attribute or `repr` attribute to generate
+///   [`TryFrom`] implementations. `try_from` always takes precedence over `repr`.
+///
+/// - The macro generates a compile-time assertion for every variant to ensure its
+///   discriminant value fits within the type being converted from.
+///
+/// [`kernel::error::code`]: ../kernel/error/code/index.html
+///
+/// # Supported types in `#[try_from(...)]`
+///
+/// - [`bool`]
+/// - Primitive integer types (e.g., [`i8`], [`u8`])
+/// - [`Bounded`]
+///
+/// [`Bounded`]: ../kernel/num/bounded/struct.Bounded.html
+///
+/// # Examples
+///
+/// ## Without Attributes
+///
+/// Since [the default `Rust` representation uses `isize` for the discriminant type][repr-rust],
+/// the macro implements `TryFrom<isize>`:
+///
+/// [repr-rust]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::macros::TryFrom;
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x7,
+/// }
+///
+/// assert_eq!(Err(EINVAL), Foo::try_from(-1_isize));
+/// assert_eq!(Ok(Foo::A), Foo::try_from(0_isize));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(0x7_isize));
+/// assert_eq!(Err(EINVAL), Foo::try_from(0x8_isize));
+/// ```
+///
+/// ## With `#[repr(T)]`
+///
+/// The macro implements `TryFrom<T>`:
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::macros::TryFrom;
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x7,
+/// }
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(0_u8));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(0x7_u8));
+/// assert_eq!(Err(EINVAL), Foo::try_from(0x8_u8));
+/// ```
+///
+/// ## With `#[try_from(...)]`
+///
+/// The macro implements `TryFrom<T>` for each `T` specified in `#[try_from(...)]`,
+/// which always overrides `#[repr(...)]`:
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::{
+///     macros::TryFrom,
+///     num::Bounded, //
+/// };
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// #[try_from(bool, i16, Bounded<u8, 4>)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B,
+/// }
+///
+/// assert_eq!(Err(EINVAL), Foo::try_from(-1_i16));
+/// assert_eq!(Ok(Foo::A), Foo::try_from(0_i16));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(1_i16));
+/// assert_eq!(Err(EINVAL), Foo::try_from(2_i16));
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 4>::new::<0>()));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 4>::new::<1>()));
+/// ```
+///
+/// ## Compile-time Overflow Assertion
+///
+/// The following examples do not compile:
+///
+/// ```compile_fail
+/// # use kernel::macros::Into;
+/// #[derive(Into)]
+/// #[into(u8)]
+/// enum Foo {
+///     // `256` is larger than `u8::MAX`.
+///     A = 256,
+/// }
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::Into;
+/// #[derive(Into)]
+/// #[into(u8)]
+/// enum Foo {
+///     // `-1` cannot be represented with `u8`.
+///     A = -1,
+/// }
+/// ```
+///
+/// ## Unsupported Cases
+///
+/// The following examples do not compile:
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// // Tuple-like enums or struct-like enums are not allowed.
+/// #[derive(TryFrom)]
+/// enum Foo {
+///     A(u8),
+///     B { inner: u8 },
+/// }
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// // Structs are not allowed.
+/// #[derive(TryFrom)]
+/// struct Foo(u8);
+/// ```
+#[proc_macro_derive(TryFrom, attributes(try_from))]
+pub fn derive_try_from(input: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(input as DeriveInput);
+    convert::derive_try_from(input)
+        .unwrap_or_else(syn::Error::into_compile_error)
+        .into()
+}

-- 
2.47.3


