Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA6CCBAF79
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDDA10EC9D;
	Sat, 13 Dec 2025 12:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLO80rid";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED0510E1AB
 for <nouveau@lists.freedesktop.org>; Fri, 15 Aug 2025 05:32:48 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-244581d9866so14675555ad.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 22:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755235967; x=1755840767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v++t53P4EgG48rVd8q9X8cTEHlETjx3oHYParZ2OE2U=;
 b=eLO80riddSP+g8misGE3M3pfay8Jg7A1ezEFO9nd3ySOD11W3e7rRspLtccGTyF16j
 49VzHx1TGK8UMIToIpohMoyWLrxs3KeIj7aVXdIRk/NcmZ5aQoORz7wxNyBokfvZIUTP
 m+BP2Sh1ENad6sG8xiTlPlAYmQfC8MVktLQ2JDv+K1JHENpr+SmpiIjNa0V9WM4kB1qm
 EG4Havt40nCydzbakIunqVK3OkhdItoN0tj3WQhrXMvPjE1opxtSXDsDvOC/T/gCY9ir
 vW3siG9sAY+zJ1hAkneqg+gF7IbyFlo0GzaQEj24jysBWW+EyRhtzCJlUz3f54YUZv1f
 tPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755235967; x=1755840767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v++t53P4EgG48rVd8q9X8cTEHlETjx3oHYParZ2OE2U=;
 b=JrhZtext6Jeb/rLPSKZLNlyUeglHni8az451e+QHGf+otwlTae5SzHEm+/3Jk+JG2S
 QT/jdPAOLH+FU/MrNaIq47vqw9inPuuipa0lV80LKciRXo6oFjjWlsvhCPBso45wmTZ0
 9wlKthkufymwjkg5oad3DHkJulScfYibFZZTjylJh1kpMXA29UWweANEGIj1VbaJCDyz
 X/MXDFb04B5i+GOkbT8pxup/7yt/NO89WJAGJDtbxZ8qVIF34hZmMgBf4dsUz7Eot/ld
 EYq45sSV31TmPnmGk2E0k3lbG3uTr/mcjWoiEl2ui0s8IMMB+untOJIlAmlDAZ5/e49Y
 aUVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuw5i5mBKfzxSCzFyLr3SkUIdpHcTGKPcdX6chU8X251onm63N3q6tlIhan69H6ndxdR5x/5RX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpAA5utA39ZR4PWEAnwQ/jS0u5TGVCFPwjttcN334GS1ShKCTW
 N6eT3vqEOOQHIJWkXuYFHNktKAN3jfj5lvOZ8DUwl3RC6z1IFm0WAxWD
X-Gm-Gg: ASbGncs7n2HLsZwuQi+9LAt35FW9Hc6zZ5tAFQWsZ9VaOxhuXd95dBqrhodN4orN8Et
 /Y14ZlFPxMA7Dxb8tsjZehxYJel2ZAHrt0HmUk7klBh5kOJo5ujUwuaIr/bEgrCKskpS5aMSc7T
 8n9f3Nf7MqMZwCainZgvPK/iQKaps5nftBFWcBmT+60vI9ekVYOXQlU8y5YZ4pkhYlNgtg+qDCW
 B13/4gb4drXTkqluSLBclUfVTXbDsH5zGrdqcvZHeBTsY6pb8oX8w91G32N22TXBA+Pzu0fDJmY
 1Cr78T2QgRHM1YN/Pe18KXTJq69IN7glasj+MyJTpFGxeI92lcnPib5WfoHxxH+AuSAvMsuH2Ok
 cPFsY3oAAo18OSmiGoTjBhsZXVXZyrwTjKo99CcuNxU5NSYUzeDgQQg==
X-Google-Smtp-Source: AGHT+IEuP38negAiTWY+byl6T/38/ZPMacDl/61+NORQDMLLFI1r5I/hC9/JTBTB8whMfGGc35G05g==
X-Received: by 2002:a17:903:228a:b0:240:1bca:54 with SMTP id
 d9443c01a7336-2446d861ff2mr14514005ad.35.1755235967324; 
 Thu, 14 Aug 2025 22:32:47 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4556692bsm335234b3a.61.2025.08.14.22.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 22:32:47 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 4/5] rust: macros: add derive macro for `TryFrom`
Date: Fri, 15 Aug 2025 05:32:14 +0000
Message-Id: <fe6b77690dabff7833582bb728b822cca4f1cf62.1755235180.git.y.j3ms.n@gmail.com>
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

Introduce a procedural macro `TryFrom` to automatically implement the
`TryFrom` trait for unit-only enums.

This reduces boilerplate in cases where numeric values need to be
interpreted as relevant enum variants. This situation often arise when
working with low-level data sources. A typical example is the `Chipset`
enum in nova-core, where the value read from a GPU register should be
mapped to a corresponding variant.

Since a pending RFC [1] proposes adding the `syn` crate [2] as a
dependency, keep the parsing logic minimal.

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Link: https://lore.kernel.org/rust-for-linux/20250304225536.2033853-1-benno.lossin@proton.me [1]
Link: https://docs.rs/syn/latest/syn [2]
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs | 337 +++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     | 124 +++++++++++++++
 2 files changed, 461 insertions(+)
 create mode 100644 rust/macros/convert.rs

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
new file mode 100644
index 000000000000..0084bc4308c1
--- /dev/null
+++ b/rust/macros/convert.rs
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro::{token_stream, Delimiter, Ident, Span, TokenStream, TokenTree};
+use std::iter::Peekable;
+
+#[derive(Debug)]
+struct TypeArgs {
+    helper: Vec<Ident>,
+    repr: Option<Ident>,
+}
+
+const VALID_TYPES: [&str; 12] = [
+    "u8", "u16", "u32", "u64", "u128", "usize", "i8", "i16", "i32", "i64", "i128", "isize",
+];
+
+pub(crate) fn derive_try_from(input: TokenStream) -> TokenStream {
+    derive(input)
+}
+
+fn derive(input: TokenStream) -> TokenStream {
+    let derive_target = "TryFrom";
+    let derive_helper = "try_from";
+
+    let mut tokens = input.into_iter().peekable();
+
+    let type_args = match parse_types(&mut tokens, derive_helper) {
+        Ok(type_args) => type_args,
+        Err(errs) => return errs,
+    };
+
+    // Skip until the `enum` keyword, including the `enum` itself.
+    for tt in tokens.by_ref() {
+        if matches!(tt, TokenTree::Ident(ident) if ident.to_string() == "enum") {
+            break;
+        }
+    }
+
+    let Some(TokenTree::Ident(enum_ident)) = tokens.next() else {
+        return format!(
+            "::core::compile_error!(\"`#[derive({derive_target})]` can only \
+            be applied to an enum\");"
+        )
+        .parse::<TokenStream>()
+        .unwrap();
+    };
+
+    let mut errs = TokenStream::new();
+
+    if matches!(tokens.peek(), Some(TokenTree::Punct(p)) if p.as_char() == '<') {
+        errs.extend(
+            format!(
+                "::core::compile_error!(\"`#[derive({derive_target})]` \
+                does not support enums with generic parameters\");"
+            )
+            .parse::<TokenStream>()
+            .unwrap(),
+        );
+    }
+
+    let Some(variants_group) = tokens.find_map(|tt| match tt {
+        TokenTree::Group(g) if g.delimiter() == Delimiter::Brace => Some(g),
+        _ => None,
+    }) else {
+        unreachable!("Enums have its corresponding body")
+    };
+
+    let enum_body_tokens = variants_group.stream().into_iter().peekable();
+    let variants = match parse_enum_variants(enum_body_tokens, &enum_ident, derive_target) {
+        Ok(variants) => variants,
+        Err(new_errs) => {
+            errs.extend(new_errs);
+            return errs;
+        }
+    };
+
+    if !errs.is_empty() {
+        return errs;
+    }
+
+    if type_args.helper.is_empty() {
+        // Extract the representation passed by `#[repr(...)]` if present.
+        // If nothing is specified, the default is `Rust` representation,
+        // which uses `isize` for the discriminant type.
+        // See: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+        let ty = type_args
+            .repr
+            .unwrap_or_else(|| Ident::new("isize", Span::mixed_site()));
+        impl_try_from(&ty, &enum_ident, &variants)
+    } else {
+        let impls = type_args
+            .helper
+            .iter()
+            .map(|ty| impl_try_from(ty, &enum_ident, &variants));
+        quote! { #(#impls)* }
+    }
+}
+
+fn parse_types(
+    attrs: &mut Peekable<token_stream::IntoIter>,
+    helper: &str,
+) -> Result<TypeArgs, TokenStream> {
+    let mut helper_args = vec![];
+    let mut repr_arg = None;
+
+    // Scan only the attributes. As soon as we see a token that is
+    // not `#`, we know we have consumed all attributes.
+    while let Some(TokenTree::Punct(p)) = attrs.peek() {
+        if p.as_char() != '#' {
+            unreachable!("Outer attributes start with `#`");
+        }
+        attrs.next();
+
+        // The next token should be a `Group` delimited by brackets.
+        // (e.g., #[try_from(u8, u16)])
+        //         ^^^^^^^^^^^^^^^^^^^
+        let Some(TokenTree::Group(attr_group)) = attrs.next() else {
+            unreachable!("Outer attributes are surrounded by `[` and `]`");
+        };
+
+        let mut inner = attr_group.stream().into_iter();
+
+        // Extract the attribute identifier.
+        // (e.g., #[try_from(u8, u16)])
+        //          ^^^^^^^^
+        let attr_name = match inner.next() {
+            Some(TokenTree::Ident(ident)) => ident.to_string(),
+            _ => unreachable!("Attributes have identifiers"),
+        };
+
+        if attr_name == helper {
+            match parse_helper_args(inner, helper) {
+                Ok(v) => helper_args.extend_from_slice(&v),
+                Err(errs) => return Err(errs),
+            }
+        } else if attr_name == "repr" {
+            repr_arg = parse_repr_args(inner);
+        }
+    }
+
+    Ok(TypeArgs {
+        helper: helper_args,
+        repr: repr_arg,
+    })
+}
+
+fn parse_repr_args(mut tt_group: impl Iterator<Item = TokenTree>) -> Option<Ident> {
+    // The next token should be a `Group` delimited by parentheses.
+    // (e.g., #[repr(C, u8)])
+    //              ^^^^^^^
+    let Some(TokenTree::Group(args_group)) = tt_group.next() else {
+        unreachable!("`repr` attribute has at least one argument")
+    };
+
+    for arg in args_group.stream() {
+        if let TokenTree::Ident(type_ident) = arg {
+            if VALID_TYPES.contains(&type_ident.to_string().as_str()) {
+                return Some(type_ident);
+            }
+        }
+    }
+
+    None
+}
+
+fn parse_helper_args(
+    mut tt_group: impl Iterator<Item = TokenTree>,
+    helper: &str,
+) -> Result<Vec<Ident>, TokenStream> {
+    let mut errs = TokenStream::new();
+    let mut args = vec![];
+
+    // The next token should be a `Group`.
+    // (e.g., #[try_from(u8, u16)])
+    //                  ^^^^^^^^^
+    let Some(TokenTree::Group(args_group)) = tt_group.next() else {
+        return Err(format!(
+            "::core::compile_error!(\"`{helper}` attribute expects at \
+            least one integer type argument (e.g., `#[{helper}(u8)]`)\");"
+        )
+        .parse::<TokenStream>()
+        .unwrap());
+    };
+
+    let raw_args = args_group.stream();
+    if raw_args.is_empty() {
+        return Err(format!(
+            "::core::compile_error!(\"`{helper}` attribute expects at \
+            least one integer type argument (e.g., `#[{helper}(u8)]`)\");"
+        )
+        .parse::<TokenStream>()
+        .unwrap());
+    }
+
+    // Iterate over the attribute argument tokens to collect valid integer
+    // type identifiers.
+    let mut raw_args = raw_args.into_iter();
+    while let Some(tt) = raw_args.next() {
+        let TokenTree::Ident(type_ident) = tt else {
+            errs.extend(
+                format!(
+                    "::core::compile_error!(\"`{helper}` attribute expects \
+                    comma-separated integer type arguments \
+                    (e.g., `#[{helper}(u8, u16)]`)\");"
+                )
+                .parse::<TokenStream>()
+                .unwrap(),
+            );
+            return Err(errs);
+        };
+
+        if VALID_TYPES.contains(&type_ident.to_string().as_str()) {
+            args.push(type_ident);
+        } else {
+            errs.extend(
+                format!(
+                    "::core::compile_error!(\"`{type_ident}` in `{helper}` \
+                    attribute is not an integer type\");"
+                )
+                .parse::<TokenStream>()
+                .unwrap(),
+            );
+        }
+
+        match raw_args.next() {
+            Some(TokenTree::Punct(p)) if p.as_char() == ',' => continue,
+            None => break,
+            Some(_) => {
+                errs.extend(
+                    format!(
+                        "::core::compile_error!(\"`{helper}` attribute expects \
+                        comma-separated integer type arguments \
+                        (e.g., `#[{helper}(u8, u16)]`)\");"
+                    )
+                    .parse::<TokenStream>()
+                    .unwrap(),
+                );
+                return Err(errs);
+            }
+        }
+    }
+
+    if !errs.is_empty() {
+        return Err(errs);
+    }
+
+    Ok(args)
+}
+
+fn parse_enum_variants(
+    mut tokens: Peekable<token_stream::IntoIter>,
+    enum_ident: &Ident,
+    derive_target: &str,
+) -> Result<Vec<Ident>, TokenStream> {
+    let mut errs = TokenStream::new();
+
+    let mut variants = vec![];
+
+    if tokens.peek().is_none() {
+        errs.extend(
+            format!(
+                "::core::compile_error!(\"`#[derive({derive_target})]` \
+                does not support zero-variant enums\");"
+            )
+            .parse::<TokenStream>()
+            .unwrap(),
+        );
+    }
+
+    while let Some(tt) = tokens.next() {
+        // Skip attributes like `#[...]` if present.
+        if matches!(&tt, TokenTree::Punct(p) if p.as_char() == '#') {
+            tokens.next();
+            continue;
+        }
+
+        let TokenTree::Ident(ident) = tt else {
+            unreachable!("Enum variants have its corresponding identifier");
+        };
+
+        // Reject tuple-like or struct-like variants.
+        if let Some(TokenTree::Group(g)) = tokens.peek() {
+            let variant_kind = match g.delimiter() {
+                Delimiter::Brace => "struct-like",
+                Delimiter::Parenthesis => "tuple-like",
+                _ => unreachable!("Invalid enum variant syntax"),
+            };
+            errs.extend(
+                format!(
+                    "::core::compile_error!(\"`#[derive({derive_target})]` does not \
+                    support {variant_kind} variant `{enum_ident}::{ident}`; \
+                    only unit variants are allowed\");"
+                )
+                .parse::<TokenStream>()
+                .unwrap(),
+            );
+        }
+
+        // Skip through the comma.
+        for tt in tokens.by_ref() {
+            if matches!(tt, TokenTree::Punct(p) if p.as_char() == ',') {
+                break;
+            }
+        }
+
+        variants.push(ident);
+    }
+
+    if !errs.is_empty() {
+        return Err(errs);
+    }
+
+    Ok(variants)
+}
+
+fn impl_try_from(ty: &Ident, enum_ident: &Ident, variants: &[Ident]) -> TokenStream {
+    let param = Ident::new("value", Span::mixed_site());
+
+    let clauses = variants.iter().map(|variant| {
+        quote! {
+            if #param == Self::#variant as #ty {
+                ::core::result::Result::Ok(Self::#variant)
+            } else
+        }
+    });
+
+    quote! {
+        #[automatically_derived]
+        impl ::core::convert::TryFrom<#ty> for #enum_ident {
+            type Error = ::kernel::prelude::Error;
+            fn try_from(#param: #ty) -> Result<Self, Self::Error> {
+                #(#clauses)* {
+                    ::core::result::Result::Err(::kernel::prelude::EINVAL)
+                }
+            }
+        }
+    }
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index fa847cf3a9b5..569198f188f7 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -14,6 +14,7 @@
 #[macro_use]
 mod quote;
 mod concat_idents;
+mod convert;
 mod export;
 mod helpers;
 mod kunit;
@@ -425,3 +426,126 @@ pub fn paste(input: TokenStream) -> TokenStream {
 pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     kunit::kunit_tests(attr, ts)
 }
+
+/// A derive macro for generating an impl of the [`TryFrom`] trait.
+///
+/// This macro automatically derives [`TryFrom`] trait for a given enum. Currently,
+/// it only supports [unit-only enum]s without generic parameters.
+///
+/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.unit-only
+///
+/// # Notes
+///
+/// The macro generates [`TryFrom`] implementations that:
+/// - Convert numeric values to enum variants by matching discriminant values.
+/// - Return `Ok(VARIANT)` for valid matches.
+/// - Return `Err(EINVAL)` for invalid matches (where `EINVAL` is from
+///   [`kernel::error::code`]).
+///
+/// The macro uses the `try_from` custom attribute or `repr` attribute to generate
+/// corresponding [`TryFrom`] implementations. `try_from` always takes precedence
+/// over `repr`.
+///
+/// [`kernel::error::code`]: ../kernel/error/code/index.html
+///
+/// # Caveats
+///
+/// Ensure that every integer type specified in `#[try_from(...)]` is large enough
+/// to cover all enum discriminants. Otherwise, the internal `as` casts may overflow.
+///
+/// # Examples
+///
+/// ## Without Attributes
+///
+/// Since [the default `Rust` representation uses `isize` for the discriminant type][repr-rs],
+/// the macro implements `TryFrom<isize>`:
+///
+/// [repr-rs]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+///
+/// ```rust
+/// use kernel::macros::TryFrom;
+/// use kernel::prelude::*;
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x17,
+/// }
+///
+/// assert_eq!(Foo::try_from(0isize), Ok(Foo::A));
+/// assert_eq!(Foo::try_from(0x17isize), Ok(Foo::B));
+/// assert_eq!(Foo::try_from(0x19isize), Err(EINVAL));
+/// ```
+///
+/// ## With `#[repr(T)]`
+///
+/// The macro implements `TryFrom<T>`:
+///
+/// ```rust
+/// use kernel::macros::TryFrom;
+/// use kernel::prelude::*;
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x17,
+/// }
+///
+/// assert_eq!(Foo::try_from(0u8), Ok(Foo::A));
+/// assert_eq!(Foo::try_from(0x17u8), Ok(Foo::B));
+/// assert_eq!(Foo::try_from(0x19u8), Err(EINVAL));
+/// ```
+///
+/// ## With `#[try_from(...)]`
+///
+/// The macro implements `TryFrom<T>` for each `T` specified in `#[try_from(...)]`,
+/// which always overrides `#[repr(...)]`:
+///
+/// ```rust
+/// use kernel::macros::TryFrom;
+/// use kernel::prelude::*;
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// #[try_from(u8, u16)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x17,
+/// }
+///
+/// assert_eq!(Foo::try_from(0u16), Ok(Foo::A));
+/// assert_eq!(Foo::try_from(0x17u16), Ok(Foo::B));
+/// assert_eq!(Foo::try_from(0x19u16), Err(EINVAL));
+/// ```
+///
+/// ## Unsupported Cases
+///
+/// The following examples do not compile:
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// // Generic parameters are not allowed.
+/// #[derive(TryFrom)]
+/// enum Foo<T> {
+///     A,
+/// }
+///
+/// // Tuple-like enums or struct-like enums are not allowed.
+/// #[derive(TryFrom)]
+/// enum Bar {
+///     A(u8),
+///     B { inner: u8 },
+/// }
+///
+/// // Structs are not allowed.
+/// #[derive(TryFrom)]
+/// struct Baz(u8);
+/// ```
+#[proc_macro_derive(TryFrom, attributes(try_from))]
+pub fn derive_try_from(input: TokenStream) -> TokenStream {
+    convert::derive_try_from(input)
+}
-- 
2.39.5

