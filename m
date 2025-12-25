Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4FCDE005
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 18:41:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC50113E3E;
	Thu, 25 Dec 2025 17:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q14QOIqq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B5E1044C6B;
	Thu, 25 Dec 2025 17:33:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766683996;
 b=uLyCZoQe7vG3ZqWISsiO4gdiUOj3afVoJm4iWTBN8aYgoTQhi17nNUbsZuOUDcQuPMUlY
 HWHAlecnXrGJj14qToAgjGDqkkNuyAUmMqP2JreS1PLXjhprv1Id5vPjkYMwHZ/jMOSq/7K
 Y4BDW5U8F5N8pc9QTzvjdWs1VJnK3UMTDjtMnBhf6gr950ee24Ey5S7vKTkRtPH05kEmSbv
 3ZpFoZcz4nLBbpnpQWryrwb8C2xfPemHyhtx5u8tXKY5bcgO9IXIoT/QSDH+dgXP0ZaVs0w
 IInyS3PYMks4NR1i18qcIA5PhfT7Xp91T0f1BnWBWHb3W69z+Vt2mjiKynHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766683996; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oSwN9qFvrvPMkPzmizQq5EktUTHyKTMtWQ/XQhggTXE=;
 b=wvsE4ST2YKvDWg9rU7WsxKEpOA8j8Zy9rKVex1SjYRyJakqqkZnFByVSg6Y2KBAFx84md
 6p8KPWmQIHRum5obVgGqcevQ+5BBIuRlqr125JTsY0yJ9d/LyngV2dWuu04XEsYZUOnAw65
 tXO9RNNFQhYWlAh99NeSKnFhEbeTa2UPWL6+VS8KXPWEFcczk+rafqRZnkP1FcAc8imOQdB
 ue8C9PFpc3pgawFsgxHalmIy9Enlky4GvCFLLL/pfQVgLFmsbbOCsqei6WCT4zT/w0odzT+
 YTjOe5+mPqsx2cL5hqII+jj6JnxOCCm7b9Wq6B++astvrvyMDZXrjs6g4cIw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 521FA44C5E
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 17:33:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C7B3510E27A
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 17:40:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A5EB41797;
	Thu, 25 Dec 2025 17:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E81AC4CEF1;
	Thu, 25 Dec 2025 17:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766684459;
	bh=tAqR6pW4SSkFRHeclPpveu/m1Ghpvy057DFROQ1Z+5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q14QOIqqSq+V1xPKgE5Ku8S421beGzJ0vw93ij9ROhTf8IwfFxt2y+QEyjNk+tUjt
	 pzro/+Ux6cIwiDS0o/tsvnVLYl84S88LAR16sN0RCwKwBT0D6IWTGNdv9liQd9p4E2
	 NNdmMWCvCAJoGemXUROqVL0k29NVbga+z5oMg97/ziA4oBJt9MbrGf0iuvkuAIDm0k
	 cOOkLp0FM4uFsizTQbw4jRO/wbf0mFfGHQN4m3KjwqGyvhzEGHxfSOi5Su2J9HSIzG
	 N/vY0+b9+UeoB7Zs4nzocsk+eMP53Q3bC4I/7YOyQIQPZ94YNnf09dPfkoFlJJ1XCf
	 hnRBOVqJ6NNUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Dec 2025 18:40:54 +0100
Message-Id: <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
In-Reply-To: <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
Message-ID-Hash: VPK2Z5TC44PZYPXHCJEZLZLCMBBBUONZ
X-Message-ID-Hash: VPK2Z5TC44PZYPXHCJEZLZLCMBBBUONZ
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VPK2Z5TC44PZYPXHCJEZLZLCMBBBUONZ/>
Archived-At: 
 <https://lore.freedesktop.org/DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
> +fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<Token=
Stream> {
> +    let mut errors: Option<syn::Error> =3D None;
> +    let mut combine_error =3D |err| match errors.as_mut() {
> +        Some(errors) =3D> errors.combine(err),
> +        None =3D> errors =3D Some(err),
> +    };
> +
> +    let (helper_tys, repr_ty) =3D parse_attrs(target, &input.attrs)?;
> +    for ty in &helper_tys {
> +        if let Err(err) =3D ty.validate() {
> +            combine_error(err);
> +        }
> +    }
> +
> +    let data_enum =3D match input.data {
> +        Data::Enum(data) =3D> data,
> +        Data::Struct(data) =3D> {
> +            let msg =3D format!(
> +                "expected `enum`, found `struct`; \
> +                 `#[derive({})]` can only be applied to a unit-only enum=
",
> +                target.get_trait_name()
> +            );
> +            return Err(syn::Error::new(data.struct_token.span(), msg));
> +        }
> +        Data::Union(data) =3D> {
> +            let msg =3D format!(
> +                "expected `enum`, found `union`; \
> +                 `#[derive({})]` can only be applied to a unit-only enum=
",
> +                target.get_trait_name()
> +            );
> +            return Err(syn::Error::new(data.union_token.span(), msg));
> +        }
> +    };
> +
> +    for variant in &data_enum.variants {
> +        match &variant.fields {
> +            Fields::Named(fields) =3D> {
> +                let msg =3D format!(
> +                    "expected unit-like variant, found struct-like varia=
nt; \
> +                    `#[derive({})]` can only be applied to a unit-only e=
num",
> +                    target.get_trait_name()
> +                );
> +                combine_error(syn::Error::new_spanned(fields, msg));
> +            }
> +            Fields::Unnamed(fields) =3D> {
> +                let msg =3D format!(
> +                    "expected unit-like variant, found tuple-like varian=
t; \
> +                    `#[derive({})]` can only be applied to a unit-only e=
num",
> +                    target.get_trait_name()
> +                );
> +                combine_error(syn::Error::new_spanned(fields, msg));
> +            }
> +            _ =3D> (),

We should be exhaustive here to exclude any future additions (ie break
the build if a new `Fields::...` variant is added).

> +        }
> +    }
> +
> +    if let Some(errors) =3D errors {
> +        return Err(errors);
> +    }
> +
> +    let variants: Vec<_> =3D data_enum
> +        .variants
> +        .into_iter()
> +        .map(|variant| variant.ident)
> +        .collect();
> +
> +    Ok(derive_for_enum(
> +        target,
> +        &input.ident,
> +        &variants,
> +        &helper_tys,
> +        &repr_ty,
> +    ))
> +}
> +
> +#[derive(Clone, Copy, Debug)]
> +enum DeriveTarget {
> +    Into,
> +}
> +
> +impl DeriveTarget {
> +    fn get_trait_name(&self) -> &'static str {
> +        match self {
> +            Self::Into =3D> "Into",
> +        }
> +    }
> +
> +    fn get_helper_name(&self) -> &'static str {
> +        match self {
> +            Self::Into =3D> "into",
> +        }
> +    }
> +}
> +
> +fn parse_attrs(target: DeriveTarget, attrs: &[Attribute]) -> syn::Result=
<(Vec<ValidTy>, Ident)> {
> +    let helper =3D target.get_helper_name();
> +
> +    let mut repr_ty =3D None;
> +    let mut helper_tys =3D Vec::new();
> +    for attr in attrs {
> +        if attr.path().is_ident("repr") {
> +            attr.parse_nested_meta(|meta| {
> +                let ident =3D meta.path.get_ident();
> +                if ident.is_some_and(is_valid_primitive) {
> +                    repr_ty =3D ident.cloned();
> +                }

While this works for now, writing `repr(C, {integer})` might become
meaningful in the future, see [1]. We should just accept it now as well.

[1]: https://github.com/rust-lang/rust/issues/68585

> +                // Delegate `repr` attribute validation to rustc.
> +                Ok(())
> +            })?;
> +        } else if attr.path().is_ident(helper) && helper_tys.is_empty() =
{
> +            let args =3D attr.parse_args_with(Punctuated::<ValidTy, Toke=
n![,]>::parse_terminated)?;
> +            helper_tys.extend(args);
> +        }
> +    }
> +
> +    // Note on field-less `repr(C)` enums (quote from [1]):
> +    //
> +    //   In C, enums with discriminants that do not all fit into an `int=
` or all fit into an
> +    //   `unsigned int` are a portability hazard: such enums are only pe=
rmitted since C23, and not
> +    //   supported e.g. by MSVC.
> +    //
> +    //   Furthermore, Rust interprets the discriminant values of `repr(C=
)` enums as expressions of
> +    //   type `isize`. This makes it impossible to implement the C23 beh=
avior of enums where the
> +    //   enum discriminants have no predefined type and instead the enum=
 uses a type large enough
> +    //   to hold all discriminants.
> +    //
> +    //   Therefore, `repr(C)` enums in Rust require that either all disc=
riminants to fit into a C
> +    //   `int` or they all fit into an `unsigned int`.
> +    //
> +    // As such, `isize` is a reasonable representation for `repr(C)` enu=
ms, as it covers the range
> +    //  of both `int` and `unsigned int`.
> +    //
> +    // For more information, see:
> +    // - https://github.com/rust-lang/rust/issues/124403
> +    // - https://github.com/rust-lang/rust/pull/147017
> +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f7055a59b=
817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [1]
> +
> +    // Extract the representation passed by `#[repr(...)]` if present. I=
f nothing is
> +    // specified, the default is `Rust` representation, which uses `isiz=
e` for its
> +    // discriminant type.
> +    // See: https://doc.rust-lang.org/reference/items/enumerations.html#=
r-items.enum.discriminant.repr-rust

I think we should error when no `#[repr({integer})]` attribute is
specified.

> +    let repr_ty =3D repr_ty.unwrap_or_else(|| Ident::new("isize", Span::=
call_site()));
> +    Ok((helper_tys, repr_ty))
> +}
> +
> +fn derive_for_enum(
> +    target: DeriveTarget,
> +    enum_ident: &Ident,
> +    variants: &[Ident],
> +    helper_tys: &[ValidTy],
> +    repr_ty: &Ident,
> +) -> TokenStream {
> +    let impl_fn =3D match target {
> +        DeriveTarget::Into =3D> impl_into,
> +    };
> +
> +    let qualified_repr_ty: syn::Path =3D parse_quote! { ::core::primitiv=
e::#repr_ty };
> +
> +    return if helper_tys.is_empty() {
> +        let ty =3D ValidTy::Primitive(repr_ty.clone());
> +        let impls =3D
> +            std::iter::once(ty).map(|ty| impl_fn(enum_ident, variants, &=
qualified_repr_ty, &ty));
> +        ::quote::quote! { #(#impls)* }
> +    } else {
> +        let impls =3D helper_tys
> +            .iter()
> +            .map(|ty| impl_fn(enum_ident, variants, &qualified_repr_ty, =
ty));
> +        ::quote::quote! { #(#impls)* }
> +    };

Let's just do this when we still have the `helper_tys` vector:

    helper_tys.push(ValidTy::Primitive(repr_ty));

> +
> +    fn impl_into(
> +        enum_ident: &Ident,
> +        variants: &[Ident],
> +        repr_ty: &syn::Path,
> +        input_ty: &ValidTy,
> +    ) -> TokenStream {
> +        let param =3D Ident::new("value", Span::call_site());
> +
> +        let overflow_assertion =3D emit_overflow_assert(enum_ident, vari=
ants, repr_ty, input_ty);
> +        let cast =3D match input_ty {
> +            ValidTy::Bounded(inner) =3D> {
> +                let base_ty =3D inner.emit_qualified_base_ty();
> +                let expr =3D parse_quote! { #param as #base_ty };
> +                // Since the discriminant of `#param`, an enum variant, =
is determined
> +                // at compile-time, we can rely on `Bounded::from_expr()=
`. It requires
> +                // the provided expression to be verifiable at compile-t=
ime to avoid
> +                // triggering a build error.
> +                inner.emit_from_expr(&expr)
> +            }
> +            ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
> +                ::quote::quote! { (#param as #repr_ty) =3D=3D 1 }
> +            }
> +            qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! { #pa=
ram as #qualified },
> +        };
> +
> +        ::quote::quote! {
> +            #[automatically_derived]
> +            impl ::core::convert::From<#enum_ident> for #input_ty {
> +                fn from(#param: #enum_ident) -> #input_ty {
> +                    #overflow_assertion
> +
> +                    #cast
> +                }
> +            }
> +        }
> +    }
> +
> +    fn emit_overflow_assert(
> +        enum_ident: &Ident,
> +        variants: &[Ident],
> +        repr_ty: &syn::Path,
> +        input_ty: &ValidTy,
> +    ) -> TokenStream {

I feel like we should track this via traits rather than using a const
assert. That approach will require & generate much less code.

> +        let qualified_i128: syn::Path =3D parse_quote! { ::core::primiti=
ve::i128 };
> +        let qualified_u128: syn::Path =3D parse_quote! { ::core::primiti=
ve::u128 };
> +
> +        let input_min =3D input_ty.emit_min();
> +        let input_max =3D input_ty.emit_max();
> +
> +        let variant_fits =3D variants.iter().map(|variant| {
> +            let msg =3D format!(
> +                "enum discriminant overflow: \
> +                `{enum_ident}::{variant}` does not fit in `{input_ty}`",
> +            );
> +            ::quote::quote! {
> +                ::core::assert!(fits(#enum_ident::#variant as #repr_ty),=
 #msg);
> +            }
> +        });
> +
> +        ::quote::quote! {
> +            const _: () =3D {
> +                const fn fits(d: #repr_ty) -> ::core::primitive::bool {
> +                    // For every integer type, its minimum value always =
fits in `i128`.
> +                    let dst_min =3D #input_min;
> +                    // For every integer type, its maximum value always =
fits in `u128`.
> +                    let dst_max =3D #input_max;
> +
> +                    #[allow(unused_comparisons)]
> +                    let is_src_signed =3D #repr_ty::MIN < 0;
> +                    #[allow(unused_comparisons)]
> +                    let is_dst_signed =3D dst_min < 0;
> +
> +                    if is_src_signed && is_dst_signed {
> +                        // Casting from a signed value to `i128` does no=
t overflow since
> +                        // `i128` is the largest signed primitive intege=
r type.
> +                        (d as #qualified_i128) >=3D (dst_min as #qualifi=
ed_i128)
> +                            && (d as #qualified_i128) <=3D (dst_max as #=
qualified_i128)
> +                    } else if is_src_signed && !is_dst_signed {
> +                        // Casting from a signed value greater than 0 to=
 `u128` does not
> +                        // overflow since `u128::MAX` is greater than `i=
128::MAX`.
> +                        d >=3D 0 && (d as #qualified_u128) <=3D (dst_max=
 as #qualified_u128)
> +                    } else {
> +                        // Casting from an unsigned value to `u128` does=
 not overflow since
> +                        // `u128` is the largest unsigned primitive inte=
ger type.
> +                        (d as #qualified_u128) <=3D (dst_max as #qualifi=
ed_u128)
> +                    }
> +                }
> +
> +                #(#variant_fits)*
> +            };
> +        }
> +    }
> +}

> +
> +impl fmt::Display for ValidTy {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        match self {
> +            Self::Bounded(inner) =3D> inner.fmt(f),
> +            Self::Primitive(ident) =3D> ident.fmt(f),
> +        }
> +    }
> +}
> +
> +struct Bounded {
> +    name: Ident,
> +    open_angle: Token![<],
> +    base_ty: Ident,

We should allow a type here from syntax and then emit an error when it
isn't a primitive.

> +    comma: Token![,],
> +    bits: LitInt,
> +    close_angle: Token![>],
> +}

> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index b38002151871a33f6b4efea70be2deb6ddad38e2..02528d7212b75d28788f0c334=
79edb272fa12e27 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -14,6 +14,7 @@
>  #[macro_use]
>  mod quote;
>  mod concat_idents;
> +mod convert;
>  mod export;
>  mod fmt;
>  mod helpers;
> @@ -23,6 +24,10 @@
>  mod vtable;
> =20
>  use proc_macro::TokenStream;
> +use syn::{
> +    parse_macro_input,
> +    DeriveInput, //
> +};
> =20
>  /// Declares a kernel module.
>  ///
> @@ -475,3 +480,155 @@ pub fn paste(input: TokenStream) -> TokenStream {
>  pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
>      kunit::kunit_tests(attr, ts)
>  }
> +
> +/// A derive macro for providing an implementation of the [`Into`] trait=
.
> +///
> +/// This macro automatically derives the [`Into`] trait for a given enum=
 by generating
> +/// the relevant [`From`] implementation. Currently, it only supports [u=
nit-only enum]s.
> +///
> +/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumerat=
ions.html#r-items.enum.unit-only
> +///
> +/// # Notes
> +///
> +/// - Unlike its name suggests, the macro actually generates [`From`] im=
plementations
> +///   which automatically provide corresponding [`Into`] implementations=
.
> +///
> +/// - The macro uses the `into` custom attribute or `repr` attribute to =
generate [`From`]
> +///   implementations. `into` always takes precedence over `repr`.

What do you mean by "precedence" here? You always generate it for all
helper_tys and the repr?

Cheers,
Benno

> +///
> +/// - The macro generates a compile-time assertion for every variant to =
ensure its
> +///   discriminant value fits within the type being converted into.
> +///
> +/// # Supported types in `#[into(...)]`
> +///
> +/// - [`bool`]
> +/// - Primitive integer types (e.g., [`i8`], [`u8`])
> +/// - [`Bounded`]
> +///
> +/// [`Bounded`]: ../kernel/num/bounded/struct.Bounded.html
