Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFA6CDF463
	for <lists+nouveau@lfdr.de>; Sat, 27 Dec 2025 05:57:19 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E12A11225D;
	Sat, 27 Dec 2025 04:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fCtoQpOt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B10544C6C;
	Sat, 27 Dec 2025 04:49:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766810967;
 b=s75ZA0gPYwn58zQOFc3o5Vd+FOWkiTjOltVaTvHvTsv3WL4IXpqoRpEW20jPoczCza2Kz
 carvB0ed/l1xOg5n0ocBKRNr/GPOrFgrmc5vIVoeOspJqGWpA7+5wKqHdacO8pC0/yPH6cG
 HakbEjwTbrx2XYEJGnjq816PBLD/Rq7Ow3gGgh6OBcOIi6Zk1w3hKJGikTnRw4T6JxFfUPO
 TsJZPGlSS/nwNgO7BZchDIROIt1OH5LdopwUeuVJMqof/Hl6o0p1nuMFo04YgIKzYvB5i/2
 l4U5NzsIe73AqMqRDMSgWP91tSaDJVtFYaSebR0wSOfYPMPQnjwxVJydgMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766810967; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EyCrkRhAI13MQR42bC3m7p9ObsSkHGvl1aViW58/qfY=;
 b=dx0DjNWu2B6LHXIlmPpFIJw66NhDlycc3oZmHkq8vDMr6sGnaae0Kj79M3reJfCtvYC25
 xIt3O6LaviOmBogNf3lbf6XSbhV8Qdd3/YJAC8UTINBGipXKQbOLD0SzO5EIsSG+iO3i/PY
 GL5eME2P4Q58d7DEKnD8XShr57sIZusZSIJjqtwvbejjycImIrhzqfC1iYdODbV3TAhlPFZ
 ZVsxrvyAx13HEQaY+8pmmCrnpPZBjYLAkJ7ZxA5j//5AFa2TRY/lP8W8z45PV/Y02JeiT9c
 +fS36a9BzmxGNS+rSp1WosPEUQ8rtpzMCUl+TjJL1V7d9aYdzUd1URHcAT9g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3EBB7407BC
	for <nouveau@lists.freedesktop.org>; Sat, 27 Dec 2025 04:49:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8A4310E4E1
	for <nouveau@lists.freedesktop.org>; Sat, 27 Dec 2025 04:57:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C47716000A;
	Sat, 27 Dec 2025 04:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82600C4CEF1;
	Sat, 27 Dec 2025 04:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766811432;
	bh=hyLs+cXKH65myVQhUgTa0FFNyWdvkMB9nJFLbtulGLs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fCtoQpOtSqG3bw01NqQqZ+/j+4agU7zXH5K/O1p2gUL1EjiBBLTR6XAmgK0Jn8AV+
	 Yg11PluWE0tOQT4CIMTY+PfFflkC+MsA/9/YBZtUoZNUowHCmC87mOJ12/6A1X/gup
	 Fi6u35qkaJa1tVPj+dr49OTKtJxaL/Xf/58JR+8CZREEiLJipqYDaguXBhJh2vL4Zs
	 EOKcofF1yqzlfnhc9HKjcamTsF68FXyAEIYOYdQGo8El+sfh+rZEHDsbW1JQam3LPH
	 e9OODiCeizE8hWiLFaYzS1MTbs4fpR2JvmASdHRLyf701+MIAMWtkIgkBk68tJSgp+
	 X3NLfqeeXNWVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Dec 2025 05:57:07 +0100
Message-Id: <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
From: "Benno Lossin" <lossin@kernel.org>
To: "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
In-Reply-To: 
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
Message-ID-Hash: MY5E4X25EMPKORJASZGMBYDYF6EDABAJ
X-Message-ID-Hash: MY5E4X25EMPKORJASZGMBYDYF6EDABAJ
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MY5E4X25EMPKORJASZGMBYDYF6EDABAJ/>
Archived-At: 
 <https://lore.freedesktop.org/DF8QDONK951M.10NYLJ40UNNY1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
> On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.org> =
wrote:
>> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
>> > +fn parse_attrs(target: DeriveTarget, attrs: &[Attribute]) -> syn::Res=
ult<(Vec<ValidTy>, Ident)> {
>> > +    let helper =3D target.get_helper_name();
>> > +
>> > +    let mut repr_ty =3D None;
>> > +    let mut helper_tys =3D Vec::new();
>> > +    for attr in attrs {
>> > +        if attr.path().is_ident("repr") {
>> > +            attr.parse_nested_meta(|meta| {
>> > +                let ident =3D meta.path.get_ident();
>> > +                if ident.is_some_and(is_valid_primitive) {
>> > +                    repr_ty =3D ident.cloned();
>> > +                }
>>
>> While this works for now, writing `repr(C, {integer})` might become
>> meaningful in the future, see [1]. We should just accept it now as well.
>>
>> [1]: https://github.com/rust-lang/rust/issues/68585
>
> I think it's worth noting. I'll add a small comment for this.

My suggestion was to just accept `repr(C, {integer})` and make it result
in the same as `repr({integer})`.

>> > +                // Delegate `repr` attribute validation to rustc.
>> > +                Ok(())
>> > +            })?;
>> > +        } else if attr.path().is_ident(helper) && helper_tys.is_empty=
() {
>> > +            let args =3D attr.parse_args_with(Punctuated::<ValidTy, T=
oken![,]>::parse_terminated)?;
>> > +            helper_tys.extend(args);
>> > +        }
>> > +    }
>> > +
>> > +    // Note on field-less `repr(C)` enums (quote from [1]):
>> > +    //
>> > +    //   In C, enums with discriminants that do not all fit into an `=
int` or all fit into an
>> > +    //   `unsigned int` are a portability hazard: such enums are only=
 permitted since C23, and not
>> > +    //   supported e.g. by MSVC.
>> > +    //
>> > +    //   Furthermore, Rust interprets the discriminant values of `rep=
r(C)` enums as expressions of
>> > +    //   type `isize`. This makes it impossible to implement the C23 =
behavior of enums where the
>> > +    //   enum discriminants have no predefined type and instead the e=
num uses a type large enough
>> > +    //   to hold all discriminants.
>> > +    //
>> > +    //   Therefore, `repr(C)` enums in Rust require that either all d=
iscriminants to fit into a C
>> > +    //   `int` or they all fit into an `unsigned int`.
>> > +    //
>> > +    // As such, `isize` is a reasonable representation for `repr(C)` =
enums, as it covers the range
>> > +    //  of both `int` and `unsigned int`.
>> > +    //
>> > +    // For more information, see:
>> > +    // - https://github.com/rust-lang/rust/issues/124403
>> > +    // - https://github.com/rust-lang/rust/pull/147017
>> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f7055a=
59b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [1]
>> > +
>> > +    // Extract the representation passed by `#[repr(...)]` if present=
. If nothing is
>> > +    // specified, the default is `Rust` representation, which uses `i=
size` for its
>> > +    // discriminant type.
>> > +    // See: https://doc.rust-lang.org/reference/items/enumerations.ht=
ml#r-items.enum.discriminant.repr-rust
>>
>> I think we should error when no `#[repr({integer})]` attribute is
>> specified.
>
> Not a blocker but just out of curiosity: are you concerned that the
> default size might change in the future, leading to silent side
> effects?

`isize` already changes size when you switch between 64 and 32 bit
architectures. I think the author of an enum they want to convert into
integers should think about which size the enum should be.

They already can choose `repr(isize)` if that is correct in that case.
As a default, I would have choosen `i32` (but that conflicts with Rust's
default, so we can't do it).

>> > +    let repr_ty =3D repr_ty.unwrap_or_else(|| Ident::new("isize", Spa=
n::call_site()));
>> > +    Ok((helper_tys, repr_ty))
>> > +}
>> > +
>> > +fn derive_for_enum(
>> > +    target: DeriveTarget,
>> > +    enum_ident: &Ident,
>> > +    variants: &[Ident],
>> > +    helper_tys: &[ValidTy],
>> > +    repr_ty: &Ident,
>> > +) -> TokenStream {
>> > +    let impl_fn =3D match target {
>> > +        DeriveTarget::Into =3D> impl_into,
>> > +    };
>> > +
>> > +    let qualified_repr_ty: syn::Path =3D parse_quote! { ::core::primi=
tive::#repr_ty };
>> > +
>> > +    return if helper_tys.is_empty() {
>> > +        let ty =3D ValidTy::Primitive(repr_ty.clone());
>> > +        let impls =3D
>> > +            std::iter::once(ty).map(|ty| impl_fn(enum_ident, variants=
, &qualified_repr_ty, &ty));
>> > +        ::quote::quote! { #(#impls)* }
>> > +    } else {
>> > +        let impls =3D helper_tys
>> > +            .iter()
>> > +            .map(|ty| impl_fn(enum_ident, variants, &qualified_repr_t=
y, ty));
>> > +        ::quote::quote! { #(#impls)* }
>> > +    };
>>
>> Let's just do this when we still have the `helper_tys` vector:
>>
>>     helper_tys.push(ValidTy::Primitive(repr_ty));
>
> The current implementation completely ignores what's in `#[repr(...)]`
> when the `#[into(...)]` or `#[try_from(...)]` helper attributes are
> specified. But users might expect, as you did, the macros to generate
> impls not only for types specified in the helper attributes but also
> for the one in `repr`. I think I should deduplicate `helper_tys` after
> the push, but anyway, I'll change this in v5.

Oh yeah I missed this, please do make this change :)

>> > +
>> > +    fn impl_into(
>> > +        enum_ident: &Ident,
>> > +        variants: &[Ident],
>> > +        repr_ty: &syn::Path,
>> > +        input_ty: &ValidTy,
>> > +    ) -> TokenStream {
>> > +        let param =3D Ident::new("value", Span::call_site());
>> > +
>> > +        let overflow_assertion =3D emit_overflow_assert(enum_ident, v=
ariants, repr_ty, input_ty);
>> > +        let cast =3D match input_ty {
>> > +            ValidTy::Bounded(inner) =3D> {
>> > +                let base_ty =3D inner.emit_qualified_base_ty();
>> > +                let expr =3D parse_quote! { #param as #base_ty };
>> > +                // Since the discriminant of `#param`, an enum varian=
t, is determined
>> > +                // at compile-time, we can rely on `Bounded::from_exp=
r()`. It requires
>> > +                // the provided expression to be verifiable at compil=
e-time to avoid
>> > +                // triggering a build error.
>> > +                inner.emit_from_expr(&expr)
>> > +            }
>> > +            ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
>> > +                ::quote::quote! { (#param as #repr_ty) =3D=3D 1 }
>> > +            }
>> > +            qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! { =
#param as #qualified },
>> > +        };
>> > +
>> > +        ::quote::quote! {
>> > +            #[automatically_derived]
>> > +            impl ::core::convert::From<#enum_ident> for #input_ty {
>> > +                fn from(#param: #enum_ident) -> #input_ty {
>> > +                    #overflow_assertion
>> > +
>> > +                    #cast
>> > +                }
>> > +            }
>> > +        }
>> > +    }
>> > +
>> > +    fn emit_overflow_assert(
>> > +        enum_ident: &Ident,
>> > +        variants: &[Ident],
>> > +        repr_ty: &syn::Path,
>> > +        input_ty: &ValidTy,
>> > +    ) -> TokenStream {
>>
>> I feel like we should track this via traits rather than using a const
>> assert. That approach will require & generate much less code.
>
> Sorry, but could you elaborate? A small example of what you have in
> mind would help a lot.

Oh yeah sorry, I had something different in mind compared to what I'll
describe now, but it achieves the same thing without introducing new
traits:

We have two options:
1) We use `<input_ty as TryFrom<repr_ty>>::try_from` instead of writing
   the `fits` function ourself.
2) We require `input_ty: From<repr_ty>`.

The first option would still check every variant and should behave the
same as your current code.

Option 2 allows us to avoid the const altogether, but requires us to
choose the smallest integer as the representation (and if we want to be
able to use both `i8` and `u8`, we can't). I missed this before, so
using option 1 might be the only way to allow conversions of this kind.

>> > +        let qualified_i128: syn::Path =3D parse_quote! { ::core::prim=
itive::i128 };
>> > +        let qualified_u128: syn::Path =3D parse_quote! { ::core::prim=
itive::u128 };
>> > +
>> > +        let input_min =3D input_ty.emit_min();
>> > +        let input_max =3D input_ty.emit_max();
>> > +
>> > +        let variant_fits =3D variants.iter().map(|variant| {
>> > +            let msg =3D format!(
>> > +                "enum discriminant overflow: \
>> > +                `{enum_ident}::{variant}` does not fit in `{input_ty}=
`",
>> > +            );
>> > +            ::quote::quote! {
>> > +                ::core::assert!(fits(#enum_ident::#variant as #repr_t=
y), #msg);
>> > +            }
>> > +        });
>> > +
>> > +        ::quote::quote! {
>> > +            const _: () =3D {
>> > +                const fn fits(d: #repr_ty) -> ::core::primitive::bool=
 {
>> > +                    // For every integer type, its minimum value alwa=
ys fits in `i128`.
>> > +                    let dst_min =3D #input_min;
>> > +                    // For every integer type, its maximum value alwa=
ys fits in `u128`.
>> > +                    let dst_max =3D #input_max;
>> > +
>> > +                    #[allow(unused_comparisons)]
>> > +                    let is_src_signed =3D #repr_ty::MIN < 0;
>> > +                    #[allow(unused_comparisons)]
>> > +                    let is_dst_signed =3D dst_min < 0;
>> > +
>> > +                    if is_src_signed && is_dst_signed {
>> > +                        // Casting from a signed value to `i128` does=
 not overflow since
>> > +                        // `i128` is the largest signed primitive int=
eger type.
>> > +                        (d as #qualified_i128) >=3D (dst_min as #qual=
ified_i128)
>> > +                            && (d as #qualified_i128) <=3D (dst_max a=
s #qualified_i128)
>> > +                    } else if is_src_signed && !is_dst_signed {
>> > +                        // Casting from a signed value greater than 0=
 to `u128` does not
>> > +                        // overflow since `u128::MAX` is greater than=
 `i128::MAX`.
>> > +                        d >=3D 0 && (d as #qualified_u128) <=3D (dst_=
max as #qualified_u128)
>> > +                    } else {
>> > +                        // Casting from an unsigned value to `u128` d=
oes not overflow since
>> > +                        // `u128` is the largest unsigned primitive i=
nteger type.
>> > +                        (d as #qualified_u128) <=3D (dst_max as #qual=
ified_u128)
>> > +                    }
>> > +                }
>> > +
>> > +                #(#variant_fits)*
>> > +            };
>> > +        }
>> > +    }
>> > +}
>>
>> > +
>> > +impl fmt::Display for ValidTy {
>> > +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> > +        match self {
>> > +            Self::Bounded(inner) =3D> inner.fmt(f),
>> > +            Self::Primitive(ident) =3D> ident.fmt(f),
>> > +        }
>> > +    }
>> > +}
>> > +
>> > +struct Bounded {
>> > +    name: Ident,
>> > +    open_angle: Token![<],
>> > +    base_ty: Ident,
>>
>> We should allow a type here from syntax and then emit an error when it
>> isn't a primitive.
>
> Assuming you're talking about `syn::Type`, that seems better. I think I
> should do the same thing for `ValidTy::Primitive`.

Sounds good!

>> > +    comma: Token![,],
>> > +    bits: LitInt,
>> > +    close_angle: Token![>],
>> > +}
>>
>> > diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
>> > index b38002151871a33f6b4efea70be2deb6ddad38e2..02528d7212b75d28788f0c=
33479edb272fa12e27 100644
>> > --- a/rust/macros/lib.rs
>> > +++ b/rust/macros/lib.rs
>> > @@ -14,6 +14,7 @@
>> >  #[macro_use]
>> >  mod quote;
>> >  mod concat_idents;
>> > +mod convert;
>> >  mod export;
>> >  mod fmt;
>> >  mod helpers;
>> > @@ -23,6 +24,10 @@
>> >  mod vtable;
>> >
>> >  use proc_macro::TokenStream;
>> > +use syn::{
>> > +    parse_macro_input,
>> > +    DeriveInput, //
>> > +};
>> >
>> >  /// Declares a kernel module.
>> >  ///
>> > @@ -475,3 +480,155 @@ pub fn paste(input: TokenStream) -> TokenStream =
{
>> >  pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream=
 {
>> >      kunit::kunit_tests(attr, ts)
>> >  }
>> > +
>> > +/// A derive macro for providing an implementation of the [`Into`] tr=
ait.
>> > +///
>> > +/// This macro automatically derives the [`Into`] trait for a given e=
num by generating
>> > +/// the relevant [`From`] implementation. Currently, it only supports=
 [unit-only enum]s.
>> > +///
>> > +/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enume=
rations.html#r-items.enum.unit-only
>> > +///
>> > +/// # Notes
>> > +///
>> > +/// - Unlike its name suggests, the macro actually generates [`From`]=
 implementations
>> > +///   which automatically provide corresponding [`Into`] implementati=
ons.
>> > +///
>> > +/// - The macro uses the `into` custom attribute or `repr` attribute =
to generate [`From`]
>> > +///   implementations. `into` always takes precedence over `repr`.
>>
>> What do you mean by "precedence" here? You always generate it for all
>> helper_tys and the repr?
>
> To quote my reply above:
>
>     The current implementation completely ignores what's in
>     `#[repr(...)]` when the `#[into(...)]` or `#[try_from(...)]` helper
>     attributes are specified.
>
> That's why I used the term "precedence." But as I said, I'll change the
> logic to generate impls for both.

Oh yeah now it makes sense :)

> Thanks a lot for the time and effort you put into reviewing it!

My pleasure :)

Cheers,
Benno
