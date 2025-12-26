Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7241CDE8A6
	for <lists+nouveau@lfdr.de>; Fri, 26 Dec 2025 10:36:54 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01058112B9B;
	Fri, 26 Dec 2025 09:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RUXHBdhu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 92F6C44C6D;
	Fri, 26 Dec 2025 09:29:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766741343;
 b=daPnvRbvQ1EOQ4ljiTRUeClVBq06bEeI0ZbOWizArRdHdCBJUefzsGGuqJWv78dUAqBWK
 X3DYGRLExWNc9Vlfib9bvNFoO7Rc6cvjoUIpbb78W7HR+46Yw3MY2E4TLZGzPz6WX+00KN3
 NGbIjgaxRaLO/z7YVXh3Dhr7D23UcfrdKKGkHXWos1j0613Ca0br6T41WwYh02auw8pnm5/
 lAvSZ5ExNzs+FnWli7a51Kg8DX3jz5yoURWPi6knS2QVZo3v9I/vkLiwMBx6YN6LtdtmQWM
 deiLgFmnIJEFsYVEjPNxry/HbdXRojo6A/SVyxMpoX+pJI5J/7iD+CE5/y9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766741343; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+Pk1eJzCdkbbDZj0ONSX88wHKyDc4JzANiZiM2GXgkk=;
 b=OBupIFdNrL4SYU+TEBQrJ8Mm1oRuJ1Id0Y3cavsfyLdfVIRJ12EovDTiaf17qvbqX/3u1
 bB3wZ7vhccRnBkeDosbWsvlJ/EDYiK1qhwPVgU0sS02vxFuPxwzqlfZJNAgpmD1xceSEEBa
 5eCXKdDN0N9DWLShFCMGX1C2RwUYgQ1ncgzG2PxfT8oK6h9Fa64z0xl0OknKKJKlFJo7s12
 5qDS7Wo+0Ubjr+XC/G95RCFxhvuLx8my+PziLGNpHWdGXX6CexzPeFtGUMtCsMKjs5x2q/g
 3FDEcpIdGJCO1woxZ4hrC4DYapIXsOFyZD5mgornT6YbX+TMFZjtAMD+jq8Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 87D46439BD
	for <nouveau@lists.freedesktop.org>; Fri, 26 Dec 2025 09:29:00 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8A310E266
	for <nouveau@lists.freedesktop.org>; Fri, 26 Dec 2025 09:36:48 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-7c7aee74dceso2689681a34.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 26 Dec 2025 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766741807; x=1767346607;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Pk1eJzCdkbbDZj0ONSX88wHKyDc4JzANiZiM2GXgkk=;
        b=RUXHBdhuozJ6IGIqH56DmTTvm8vsDdXr6k2YLzxAsty2/EOu7nU3TuOMqnaaRHP4gH
         zzfdEn/ZBTVU9nDaWX56hhTHjfTjaEz6bip1PmNMeLMd0dQMutTU+waOSNXw176Kttth
         7p2xw/QkGStDOB8FbDQ7fFqpE79ikrI0FUsOfN9B+1YM3fSBYklOtPWgJQ7E6tjhvdLS
         3posXF4FLQqvms5mg9HJlmfNuwIVjKNSlmEsNR4f3XOAFElTA8WDREnm1MdOvS5Y3w+m
         5fJDfxckSN/6bHnfzo1MRh7Gvn597oHDwcCVvtxNilvYLRyxrQjxbabSlUfcufiMUtcp
         z0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766741807; x=1767346607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Pk1eJzCdkbbDZj0ONSX88wHKyDc4JzANiZiM2GXgkk=;
        b=d1ezchHFFaVNDbcd8PvF8RTmQT4/BILxEYf/E8NaU3wP4qxKrTWS+9sM3yeF3ndklQ
         Vto36bnFscIEt0mXAAxOz08T9FjFxCQ6FW8sZvDdlXECpq7BbloUlOIWiygx4gg3rMEY
         jybSA0ZKMCPVrcqPm0j4KbcoxILvRZBRDJSDMfRHSiJ+HcOh9Cv9GHVPHvZsDkP/LeXU
         +LFLfQ/1/2Hyol6eD2ggx9o3Scxd+hUKsT3Q9EyHTNI63mFuxCcegtIsSaQIQwMNRivE
         Xl9ikgGtoUYnQznSPzTSVb+HqTWWdWjyLprlw4YttR3eMtAXvpOqhMGDq2e2BdtFG9QV
         Kz+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkuHH/M7BrcbwUF32pwtIyVliAvmLpbpowdhCceGk2JGsj2+rOBflymIIFpZZyFj5lTM7KsyUE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuwO/i5xFyiYTq3D39AcMqzR4tS0aWIIPXA/QtXiRKx7xBgFk1
	zFJ9T40ed3GNyF6vKadn9Pdp4Un8uW1JYqFzjrQNqSDnBHIbm4/Gory99FYm8XkVF3C9sh8GoRf
	XQ4Ip8oAxD6ibGe2UICYJxKx8mFjMmA0=
X-Gm-Gg: AY/fxX7IjFbBtdEzxDuFeiNo9WLYU5akUlx+oMS3qgPo+lGfBT4T0b07Jr7h/DpSU7b
	LtzEF9c5j1PV4uad6KLLcVdzOci17S/sfqqM7+r6c6oqQbziFK7wuhzmS88GUdnnaR6MHW+vObi
	7PR4Rn5lJsHWfSA11t1iBjnxnFqsKPSsobuWEWnG1C8PQiQZlafu/XyhlikRpKusrLDquRvhwNu
	oKfXVExfGim9lyPLWXpATU0laM8iUdUJSCV0ZyY2EY6lx9hudqouzW+j7lVy5cSzbNH+Mg=
X-Google-Smtp-Source: 
 AGHT+IH2gNskOXb5dVay/QpRauPuWoXSRqotVIU+5Kyey+IJNAU1cEpq972QDqSmxzLs9b4c5vw2v21AXhGd4122OLE=
X-Received: by 2002:a05:6820:6fd7:b0:659:9a49:8e66 with SMTP id
 006d021491bc7-65d0eaceb57mr8946603eaf.54.1766741807352; Fri, 26 Dec 2025
 01:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
In-Reply-To: <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 26 Dec 2025 18:36:36 +0900
X-Gm-Features: AQt7F2p9F76HqKssyFwBtXAjVkVZFTETiE1m4YBuVjTOM6By817Qmz10z11dT9I
Message-ID: 
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
To: Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2UPKYE2LHGMPYUAIOU4LL4RE45LH3B3L
X-Message-ID-Hash: 2UPKYE2LHGMPYUAIOU4LL4RE45LH3B3L
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2UPKYE2LHGMPYUAIOU4LL4RE45LH3B3L/>
Archived-At: 
 <https://lore.freedesktop.org/CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
> > +fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<Tok=
enStream> {
> > +    let mut errors: Option<syn::Error> =3D None;
> > +    let mut combine_error =3D |err| match errors.as_mut() {
> > +        Some(errors) =3D> errors.combine(err),
> > +        None =3D> errors =3D Some(err),
> > +    };
> > +
> > +    let (helper_tys, repr_ty) =3D parse_attrs(target, &input.attrs)?;
> > +    for ty in &helper_tys {
> > +        if let Err(err) =3D ty.validate() {
> > +            combine_error(err);
> > +        }
> > +    }
> > +
> > +    let data_enum =3D match input.data {
> > +        Data::Enum(data) =3D> data,
> > +        Data::Struct(data) =3D> {
> > +            let msg =3D format!(
> > +                "expected `enum`, found `struct`; \
> > +                 `#[derive({})]` can only be applied to a unit-only en=
um",
> > +                target.get_trait_name()
> > +            );
> > +            return Err(syn::Error::new(data.struct_token.span(), msg))=
;
> > +        }
> > +        Data::Union(data) =3D> {
> > +            let msg =3D format!(
> > +                "expected `enum`, found `union`; \
> > +                 `#[derive({})]` can only be applied to a unit-only en=
um",
> > +                target.get_trait_name()
> > +            );
> > +            return Err(syn::Error::new(data.union_token.span(), msg));
> > +        }
> > +    };
> > +
> > +    for variant in &data_enum.variants {
> > +        match &variant.fields {
> > +            Fields::Named(fields) =3D> {
> > +                let msg =3D format!(
> > +                    "expected unit-like variant, found struct-like var=
iant; \
> > +                    `#[derive({})]` can only be applied to a unit-only=
 enum",
> > +                    target.get_trait_name()
> > +                );
> > +                combine_error(syn::Error::new_spanned(fields, msg));
> > +            }
> > +            Fields::Unnamed(fields) =3D> {
> > +                let msg =3D format!(
> > +                    "expected unit-like variant, found tuple-like vari=
ant; \
> > +                    `#[derive({})]` can only be applied to a unit-only=
 enum",
> > +                    target.get_trait_name()
> > +                );
> > +                combine_error(syn::Error::new_spanned(fields, msg));
> > +            }
> > +            _ =3D> (),
>
> We should be exhaustive here to exclude any future additions (ie break
> the build if a new `Fields::...` variant is added).

You're right, I missed that.

> > +        }
> > +    }
> > +
> > +    if let Some(errors) =3D errors {
> > +        return Err(errors);
> > +    }
> > +
> > +    let variants: Vec<_> =3D data_enum
> > +        .variants
> > +        .into_iter()
> > +        .map(|variant| variant.ident)
> > +        .collect();
> > +
> > +    Ok(derive_for_enum(
> > +        target,
> > +        &input.ident,
> > +        &variants,
> > +        &helper_tys,
> > +        &repr_ty,
> > +    ))
> > +}
> > +
> > +#[derive(Clone, Copy, Debug)]
> > +enum DeriveTarget {
> > +    Into,
> > +}
> > +
> > +impl DeriveTarget {
> > +    fn get_trait_name(&self) -> &'static str {
> > +        match self {
> > +            Self::Into =3D> "Into",
> > +        }
> > +    }
> > +
> > +    fn get_helper_name(&self) -> &'static str {
> > +        match self {
> > +            Self::Into =3D> "into",
> > +        }
> > +    }
> > +}
> > +
> > +fn parse_attrs(target: DeriveTarget, attrs: &[Attribute]) -> syn::Resu=
lt<(Vec<ValidTy>, Ident)> {
> > +    let helper =3D target.get_helper_name();
> > +
> > +    let mut repr_ty =3D None;
> > +    let mut helper_tys =3D Vec::new();
> > +    for attr in attrs {
> > +        if attr.path().is_ident("repr") {
> > +            attr.parse_nested_meta(|meta| {
> > +                let ident =3D meta.path.get_ident();
> > +                if ident.is_some_and(is_valid_primitive) {
> > +                    repr_ty =3D ident.cloned();
> > +                }
>
> While this works for now, writing `repr(C, {integer})` might become
> meaningful in the future, see [1]. We should just accept it now as well.
>
> [1]: https://github.com/rust-lang/rust/issues/68585

I think it's worth noting. I'll add a small comment for this.

> > +                // Delegate `repr` attribute validation to rustc.
> > +                Ok(())
> > +            })?;
> > +        } else if attr.path().is_ident(helper) && helper_tys.is_empty(=
) {
> > +            let args =3D attr.parse_args_with(Punctuated::<ValidTy, To=
ken![,]>::parse_terminated)?;
> > +            helper_tys.extend(args);
> > +        }
> > +    }
> > +
> > +    // Note on field-less `repr(C)` enums (quote from [1]):
> > +    //
> > +    //   In C, enums with discriminants that do not all fit into an `i=
nt` or all fit into an
> > +    //   `unsigned int` are a portability hazard: such enums are only =
permitted since C23, and not
> > +    //   supported e.g. by MSVC.
> > +    //
> > +    //   Furthermore, Rust interprets the discriminant values of `repr=
(C)` enums as expressions of
> > +    //   type `isize`. This makes it impossible to implement the C23 b=
ehavior of enums where the
> > +    //   enum discriminants have no predefined type and instead the en=
um uses a type large enough
> > +    //   to hold all discriminants.
> > +    //
> > +    //   Therefore, `repr(C)` enums in Rust require that either all di=
scriminants to fit into a C
> > +    //   `int` or they all fit into an `unsigned int`.
> > +    //
> > +    // As such, `isize` is a reasonable representation for `repr(C)` e=
nums, as it covers the range
> > +    //  of both `int` and `unsigned int`.
> > +    //
> > +    // For more information, see:
> > +    // - https://github.com/rust-lang/rust/issues/124403
> > +    // - https://github.com/rust-lang/rust/pull/147017
> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f7055a5=
9b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [1]
> > +
> > +    // Extract the representation passed by `#[repr(...)]` if present.=
 If nothing is
> > +    // specified, the default is `Rust` representation, which uses `is=
ize` for its
> > +    // discriminant type.
> > +    // See: https://doc.rust-lang.org/reference/items/enumerations.htm=
l#r-items.enum.discriminant.repr-rust
>
> I think we should error when no `#[repr({integer})]` attribute is
> specified.

Not a blocker but just out of curiosity: are you concerned that the
default size might change in the future, leading to silent side
effects?

> > +    let repr_ty =3D repr_ty.unwrap_or_else(|| Ident::new("isize", Span=
::call_site()));
> > +    Ok((helper_tys, repr_ty))
> > +}
> > +
> > +fn derive_for_enum(
> > +    target: DeriveTarget,
> > +    enum_ident: &Ident,
> > +    variants: &[Ident],
> > +    helper_tys: &[ValidTy],
> > +    repr_ty: &Ident,
> > +) -> TokenStream {
> > +    let impl_fn =3D match target {
> > +        DeriveTarget::Into =3D> impl_into,
> > +    };
> > +
> > +    let qualified_repr_ty: syn::Path =3D parse_quote! { ::core::primit=
ive::#repr_ty };
> > +
> > +    return if helper_tys.is_empty() {
> > +        let ty =3D ValidTy::Primitive(repr_ty.clone());
> > +        let impls =3D
> > +            std::iter::once(ty).map(|ty| impl_fn(enum_ident, variants,=
 &qualified_repr_ty, &ty));
> > +        ::quote::quote! { #(#impls)* }
> > +    } else {
> > +        let impls =3D helper_tys
> > +            .iter()
> > +            .map(|ty| impl_fn(enum_ident, variants, &qualified_repr_ty=
, ty));
> > +        ::quote::quote! { #(#impls)* }
> > +    };
>
> Let's just do this when we still have the `helper_tys` vector:
>
>     helper_tys.push(ValidTy::Primitive(repr_ty));

The current implementation completely ignores what's in `#[repr(...)]`
when the `#[into(...)]` or `#[try_from(...)]` helper attributes are
specified. But users might expect, as you did, the macros to generate
impls not only for types specified in the helper attributes but also
for the one in `repr`. I think I should deduplicate `helper_tys` after
the push, but anyway, I'll change this in v5.

> > +
> > +    fn impl_into(
> > +        enum_ident: &Ident,
> > +        variants: &[Ident],
> > +        repr_ty: &syn::Path,
> > +        input_ty: &ValidTy,
> > +    ) -> TokenStream {
> > +        let param =3D Ident::new("value", Span::call_site());
> > +
> > +        let overflow_assertion =3D emit_overflow_assert(enum_ident, va=
riants, repr_ty, input_ty);
> > +        let cast =3D match input_ty {
> > +            ValidTy::Bounded(inner) =3D> {
> > +                let base_ty =3D inner.emit_qualified_base_ty();
> > +                let expr =3D parse_quote! { #param as #base_ty };
> > +                // Since the discriminant of `#param`, an enum variant=
, is determined
> > +                // at compile-time, we can rely on `Bounded::from_expr=
()`. It requires
> > +                // the provided expression to be verifiable at compile=
-time to avoid
> > +                // triggering a build error.
> > +                inner.emit_from_expr(&expr)
> > +            }
> > +            ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
> > +                ::quote::quote! { (#param as #repr_ty) =3D=3D 1 }
> > +            }
> > +            qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! { #=
param as #qualified },
> > +        };
> > +
> > +        ::quote::quote! {
> > +            #[automatically_derived]
> > +            impl ::core::convert::From<#enum_ident> for #input_ty {
> > +                fn from(#param: #enum_ident) -> #input_ty {
> > +                    #overflow_assertion
> > +
> > +                    #cast
> > +                }
> > +            }
> > +        }
> > +    }
> > +
> > +    fn emit_overflow_assert(
> > +        enum_ident: &Ident,
> > +        variants: &[Ident],
> > +        repr_ty: &syn::Path,
> > +        input_ty: &ValidTy,
> > +    ) -> TokenStream {
>
> I feel like we should track this via traits rather than using a const
> assert. That approach will require & generate much less code.

Sorry, but could you elaborate? A small example of what you have in
mind would help a lot.

> > +        let qualified_i128: syn::Path =3D parse_quote! { ::core::primi=
tive::i128 };
> > +        let qualified_u128: syn::Path =3D parse_quote! { ::core::primi=
tive::u128 };
> > +
> > +        let input_min =3D input_ty.emit_min();
> > +        let input_max =3D input_ty.emit_max();
> > +
> > +        let variant_fits =3D variants.iter().map(|variant| {
> > +            let msg =3D format!(
> > +                "enum discriminant overflow: \
> > +                `{enum_ident}::{variant}` does not fit in `{input_ty}`=
",
> > +            );
> > +            ::quote::quote! {
> > +                ::core::assert!(fits(#enum_ident::#variant as #repr_ty=
), #msg);
> > +            }
> > +        });
> > +
> > +        ::quote::quote! {
> > +            const _: () =3D {
> > +                const fn fits(d: #repr_ty) -> ::core::primitive::bool =
{
> > +                    // For every integer type, its minimum value alway=
s fits in `i128`.
> > +                    let dst_min =3D #input_min;
> > +                    // For every integer type, its maximum value alway=
s fits in `u128`.
> > +                    let dst_max =3D #input_max;
> > +
> > +                    #[allow(unused_comparisons)]
> > +                    let is_src_signed =3D #repr_ty::MIN < 0;
> > +                    #[allow(unused_comparisons)]
> > +                    let is_dst_signed =3D dst_min < 0;
> > +
> > +                    if is_src_signed && is_dst_signed {
> > +                        // Casting from a signed value to `i128` does =
not overflow since
> > +                        // `i128` is the largest signed primitive inte=
ger type.
> > +                        (d as #qualified_i128) >=3D (dst_min as #quali=
fied_i128)
> > +                            && (d as #qualified_i128) <=3D (dst_max as=
 #qualified_i128)
> > +                    } else if is_src_signed && !is_dst_signed {
> > +                        // Casting from a signed value greater than 0 =
to `u128` does not
> > +                        // overflow since `u128::MAX` is greater than =
`i128::MAX`.
> > +                        d >=3D 0 && (d as #qualified_u128) <=3D (dst_m=
ax as #qualified_u128)
> > +                    } else {
> > +                        // Casting from an unsigned value to `u128` do=
es not overflow since
> > +                        // `u128` is the largest unsigned primitive in=
teger type.
> > +                        (d as #qualified_u128) <=3D (dst_max as #quali=
fied_u128)
> > +                    }
> > +                }
> > +
> > +                #(#variant_fits)*
> > +            };
> > +        }
> > +    }
> > +}
>
> > +
> > +impl fmt::Display for ValidTy {
> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> > +        match self {
> > +            Self::Bounded(inner) =3D> inner.fmt(f),
> > +            Self::Primitive(ident) =3D> ident.fmt(f),
> > +        }
> > +    }
> > +}
> > +
> > +struct Bounded {
> > +    name: Ident,
> > +    open_angle: Token![<],
> > +    base_ty: Ident,
>
> We should allow a type here from syntax and then emit an error when it
> isn't a primitive.

Assuming you're talking about `syn::Type`, that seems better. I think I
should do the same thing for `ValidTy::Primitive`.

> > +    comma: Token![,],
> > +    bits: LitInt,
> > +    close_angle: Token![>],
> > +}
>
> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> > index b38002151871a33f6b4efea70be2deb6ddad38e2..02528d7212b75d28788f0c3=
3479edb272fa12e27 100644
> > --- a/rust/macros/lib.rs
> > +++ b/rust/macros/lib.rs
> > @@ -14,6 +14,7 @@
> >  #[macro_use]
> >  mod quote;
> >  mod concat_idents;
> > +mod convert;
> >  mod export;
> >  mod fmt;
> >  mod helpers;
> > @@ -23,6 +24,10 @@
> >  mod vtable;
> >
> >  use proc_macro::TokenStream;
> > +use syn::{
> > +    parse_macro_input,
> > +    DeriveInput, //
> > +};
> >
> >  /// Declares a kernel module.
> >  ///
> > @@ -475,3 +480,155 @@ pub fn paste(input: TokenStream) -> TokenStream {
> >  pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream =
{
> >      kunit::kunit_tests(attr, ts)
> >  }
> > +
> > +/// A derive macro for providing an implementation of the [`Into`] tra=
it.
> > +///
> > +/// This macro automatically derives the [`Into`] trait for a given en=
um by generating
> > +/// the relevant [`From`] implementation. Currently, it only supports =
[unit-only enum]s.
> > +///
> > +/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumer=
ations.html#r-items.enum.unit-only
> > +///
> > +/// # Notes
> > +///
> > +/// - Unlike its name suggests, the macro actually generates [`From`] =
implementations
> > +///   which automatically provide corresponding [`Into`] implementatio=
ns.
> > +///
> > +/// - The macro uses the `into` custom attribute or `repr` attribute t=
o generate [`From`]
> > +///   implementations. `into` always takes precedence over `repr`.
>
> What do you mean by "precedence" here? You always generate it for all
> helper_tys and the repr?

To quote my reply above:

    The current implementation completely ignores what's in
    `#[repr(...)]` when the `#[into(...)]` or `#[try_from(...)]` helper
    attributes are specified.

That's why I used the term "precedence." But as I said, I'll change the
logic to generate impls for both.

Thanks a lot for the time and effort you put into reviewing it!

Best regards,
Jesung
