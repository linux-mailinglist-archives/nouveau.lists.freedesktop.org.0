Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC091CBAF7F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72BF10ECA1;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnsCX0Si";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3419C10E1AB
 for <nouveau@lists.freedesktop.org>; Fri, 15 Aug 2025 05:32:53 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-76e2eb4a171so2337798b3a.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 22:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755235973; x=1755840773; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTd2SnS44QbWRezmUmEtQLo0ES7cL0NdhN8U5PrZ/34=;
 b=XnsCX0SiQQM8QhcVDjpkFJzJmzN4xCsjY3uXO6GSilPfimfWK50/6f6o+Ys20vRyPU
 72J/GFPmnbxoKqS8cGY9dnNt7ejXoP/O539RN/fCGr2FcBRzETMmKpnTi3KiRjbq+84Y
 nMSOo52f3P3NMWfONYWBMTLsX7WdFcw+IMHDUmI2YPkMylsRuDcmELcCT5BbuXTyfYLW
 cc7Z0BMKrzmbiW7SCLBsToyBUkzcnv9hsfxKW0xI70XSVZ6xkzWqy7faKTDD7t/DqJdN
 SInTQ+sR6dNCEA+gT248gioyjAc50u4ezGimCwc3jcEXqLrGSh0QyTPPeJNOGUkUbLsT
 snsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755235973; x=1755840773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTd2SnS44QbWRezmUmEtQLo0ES7cL0NdhN8U5PrZ/34=;
 b=PSZvfWjw2PNwlXSVU0fGXbzJD1WAgLqdXTvS9AGlnmsxmpMhwTT/Q7LSxW8rCDofhK
 y9DgUmuSUrtJx7MXBwi3Z9oU5W+tHwlVBdhFU3r1G0+Qbry8iJzOiQ96BwelKOjJfpYH
 9OsF5jksHdO4t8hAYn4gCK0kY25YOwOTqRlBCabBE81E3RHJ6iWemTyrbLMkrY+ke8Hm
 gJZ+MRlNXk99mUTT9i2ZtXcyhbJuhrhI9uTLGee3w3gFx+BLsILsaEeUz7z85PBOlISa
 txGkP/34PUwsQzHQ95EOyCBLvkarMj6WCSYxJrYoeWNGtXYDYn1NK/qz7L5gkYcFXkg3
 Wz/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD7Wlg4X3yVeFMdekddRq+EMg8hdNE7MRV+sh7l15UUg8pPN3tZlqeIewf87flAJkrQMrjIiD4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfBp25pcHF3NRRe7BFGLHBvAN+Dg08tiIfzcNYnaTDTXN4iKC6
 FAYI+2w8C3cxoJT0H/x2zLD6yd6Kiz2rHUoHWGwc0bsajBELse0B7cmq
X-Gm-Gg: ASbGncvZaC2WQrIxOVXvFMutIB+rPGvgi2AYyfx04MB7QReqnf79gBzMFmy5TwEz3Q+
 Viqgp+I4ssdO8dw6HiLajdyVfA244eK9oDk01yHn1HRfw7Wd/zWHWLzWkBAPd5jN0VGNIuo7rWt
 7KcsMfcxntUIXel/cAbcle/Si/Gdis7KxQQDIRt5zFHXuzEfU9Rv+GKhBHQOC11Vx5+XoZnZf7W
 BUvLV73dbO1XiJtJCsXeEnoLuZ49avvMkErStDywQGgptZ+SBdRIDVqfNo4gsH+xaUHl2lBWMU0
 PXpmgz4SGUq0KUU49zeHtP29WitL2KoIfEB0i7mkyg9i3pnAFaYoFhrFvLZulEi4kk6qfHvO2Di
 JoFcjeJ8fALs4gDMFXXD8v9aaKYg2JMzcQUc/A5ftVJw=
X-Google-Smtp-Source: AGHT+IHuZOMmR+ZHN6RawSbyEcHlvGHloyTnjAjRuRVJt3T79TKeciymvac/iLTdRF79wIc9l0ITyA==
X-Received: by 2002:a05:6a00:1acd:b0:748:e585:3c42 with SMTP id
 d2e1a72fcca58-76e447ab3b2mr978211b3a.15.1755235972528; 
 Thu, 14 Aug 2025 22:32:52 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4556692bsm335234b3a.61.2025.08.14.22.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 22:32:52 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 5/5] rust: macros: add derive macro for `Into`
Date: Fri, 15 Aug 2025 05:32:15 +0000
Message-Id: <042f8ba119337b090e8774355fc77478d86ea8ef.1755235180.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1755235180.git.y.j3ms.n@gmail.com>
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

Introduce a procedural macro `Into` to automatically implement the
`Into` trait for unit-only enums.

This reduces boilerplate in cases where enum variants need to be
interpreted as relevant numeric values. A concrete example can be
found in nova-core, where the `register!()` macro requires enum types
used within it to be convertible via `u32::from()` [1].

Note that the macro actually generates `From<E> for T` implementations,
where `E` is an enum identifier and `T` is an arbitrary integer type.
This automatically provides the corresponding `Into<T> for E`
implementations through the blanket implementation.

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Link: https://lore.kernel.org/rust-for-linux/20250624132337.2242-1-dakr@kernel.org/ [1]
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs |  36 ++++++++++---
 rust/macros/lib.rs     | 115 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+), 6 deletions(-)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 0084bc4308c1..a6ef67ba27c7 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -3,6 +3,12 @@
 use proc_macro::{token_stream, Delimiter, Ident, Span, TokenStream, TokenTree};
 use std::iter::Peekable;
 
+#[derive(Debug)]
+enum DeriveTarget {
+    TryFrom,
+    Into,
+}
+
 #[derive(Debug)]
 struct TypeArgs {
     helper: Vec<Ident>,
@@ -13,13 +19,20 @@ struct TypeArgs {
     "u8", "u16", "u32", "u64", "u128", "usize", "i8", "i16", "i32", "i64", "i128", "isize",
 ];
 
+pub(crate) fn derive_into(input: TokenStream) -> TokenStream {
+    derive(input, DeriveTarget::Into)
+}
+
 pub(crate) fn derive_try_from(input: TokenStream) -> TokenStream {
-    derive(input)
+    derive(input, DeriveTarget::TryFrom)
 }
 
-fn derive(input: TokenStream) -> TokenStream {
-    let derive_target = "TryFrom";
-    let derive_helper = "try_from";
+fn derive(input: TokenStream, target: DeriveTarget) -> TokenStream {
+    type ImplFn = fn(&Ident, &Ident, &[Ident]) -> TokenStream;
+    let (derive_target, derive_helper, impl_trait) = match target {
+        DeriveTarget::TryFrom => ("TryFrom", "try_from", impl_try_from as ImplFn),
+        DeriveTarget::Into => ("Into", "into", impl_into as ImplFn),
+    };
 
     let mut tokens = input.into_iter().peekable();
 
@@ -85,12 +98,12 @@ fn derive(input: TokenStream) -> TokenStream {
         let ty = type_args
             .repr
             .unwrap_or_else(|| Ident::new("isize", Span::mixed_site()));
-        impl_try_from(&ty, &enum_ident, &variants)
+        impl_trait(&ty, &enum_ident, &variants)
     } else {
         let impls = type_args
             .helper
             .iter()
-            .map(|ty| impl_try_from(ty, &enum_ident, &variants));
+            .map(|ty| impl_trait(ty, &enum_ident, &variants));
         quote! { #(#impls)* }
     }
 }
@@ -335,3 +348,14 @@ fn try_from(#param: #ty) -> Result<Self, Self::Error> {
         }
     }
 }
+
+fn impl_into(ty: &Ident, enum_ident: &Ident, _: &[Ident]) -> TokenStream {
+    quote! {
+        #[automatically_derived]
+        impl ::core::convert::From<#enum_ident> for #ty {
+            fn from(value: #enum_ident) -> #ty {
+                value as #ty
+            }
+        }
+    }
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 569198f188f7..374c1bdb696a 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -427,6 +427,121 @@ pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     kunit::kunit_tests(attr, ts)
 }
 
+/// A derive macro for providing an impl of the [`Into`] trait.
+///
+/// This macro automatically derives [`Into`] trait for a given enum by generating
+/// the relevant [`From`] implementation. Currently, it only supports [unit-only enum]s
+/// without generic parameters.
+///
+/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.unit-only
+///
+/// # Notes
+///
+/// Unlike its name suggests, the macro actually generates [`From`] implementations
+/// which automatically provide corresponding [`Into`] implementations.
+///
+/// The macro uses the `into` custom attribute or `repr` attribute to generate [`From`]
+/// implementations. `into` always takes precedence over `repr`.
+///
+/// # Caveats
+///
+/// Ensure that every integer type specified in `#[into(...)]` is large enough to cover
+/// all enum discriminants. Otherwise, the internal `as` casts may overflow.
+///
+/// # Examples
+///
+/// ## Without Attributes
+///
+/// Since [the default `Rust` representation uses `isize` for the discriminant type][repr-rs],
+/// the macro implements `From<Foo>` for `isize`:
+///
+/// [repr-rs]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+///
+/// ```rust
+/// use kernel::macros::Into;
+/// use kernel::prelude::*;
+///
+/// #[derive(Debug, Default, Into)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x17,
+/// }
+///
+/// assert_eq!(0isize, Foo::A.into());
+/// assert_eq!(0x17isize, Foo::B.into());
+/// ```
+///
+/// ## With `#[repr(T)]`
+///
+/// The macro implements `From<Foo>` for `T`:
+///
+/// ```rust
+/// use kernel::macros::Into;
+/// use kernel::prelude::*;
+///
+/// #[derive(Debug, Default, Into)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x17,
+/// }
+///
+/// assert_eq!(0u8, Foo::A.into());
+/// assert_eq!(0x17u8, Foo::B.into());
+/// ```
+///
+/// ## With `#[into(...)]`
+///
+/// The macro implements `From<Foo>` for each `T` specified in `#[into(...)]`,
+/// which always overrides `#[repr(...)]`:
+///
+/// ```rust
+/// use kernel::macros::Into;
+/// use kernel::prelude::*;
+///
+/// #[derive(Debug, Default, Into)]
+/// #[into(u8, u16)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x17,
+/// }
+///
+/// assert_eq!(0u16, Foo::A.into());
+/// assert_eq!(0x17u16, Foo::B.into());
+/// ```
+///
+/// ## Unsupported Cases
+///
+/// The following examples do not compile:
+///
+/// ```compile_fail
+/// # use kernel::macros::Into;
+/// // Generic parameters are not allowed.
+/// #[derive(Into)]
+/// enum Foo<T> {
+///     A,
+/// }
+///
+/// // Tuple-like enums or struct-like enums are not allowed.
+/// #[derive(Into)]
+/// enum Bar {
+///     A(u8),
+///     B { inner: u8 },
+/// }
+///
+/// // Structs are not allowed.
+/// #[derive(Into)]
+/// struct Baz(u8);
+/// ```
+#[proc_macro_derive(Into, attributes(into))]
+pub fn derive_into(input: TokenStream) -> TokenStream {
+    convert::derive_into(input)
+}
+
 /// A derive macro for generating an impl of the [`TryFrom`] trait.
 ///
 /// This macro automatically derives [`TryFrom`] trait for a given enum. Currently,
-- 
2.39.5

