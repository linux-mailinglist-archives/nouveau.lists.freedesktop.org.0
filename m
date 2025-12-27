Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA783CDF823
	for <lists+nouveau@lfdr.de>; Sat, 27 Dec 2025 11:45:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF6610E61A;
	Sat, 27 Dec 2025 10:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KmrakH2b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DD09144C6D;
	Sat, 27 Dec 2025 10:37:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766831863;
 b=Ywxesxml65SVqnz3JE1/krD52Mpu3Ux4PczYWDdGQuoch5JBXA9R50ZJKmDM5N96Uhb9q
 X7skaTirpIBMhXiK4z3v16dMqdlF0jG7BQ3TjeEZJe1AOXjaJ/MYXmXIC+YGLbKqeANTOjX
 EQoGEAINd9ByPrxa7jRKynGUkNLUI1DYfPHC6mBrpE0icsg1L0PT3wkOdJ9lBFysyRkr8bS
 huJv9eCbeqj/HIig8kick5m2ZBjSCn7pCzf/i2B6HlxtFSNY9SRPw20EeBnDda6PnEXEgiG
 Bc5h6P/LwmhXPRV6Am7oCazdzPCM/f263xyei2K0UTu359XkOB+dxhoJ3dlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766831863; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QXmM0vaUF8T6HaGp2Qwj82J1GyNYQ80rIhTIDGlmJl4=;
 b=k3IQtk1YNJ4kXpOtlSSb4mFlu+scA/m5qy0l+0cydXCLITm43KcBGjcCJBcgVoB99iu4c
 /tYZDLmOJGvGKcg3GYtRoTkEsuDG+0PKsFs9/cN88rYGDS++FSmvUkfdyAL/4qJw0TDjMf0
 F4t+mPo6/v4H5dkoJPfOMdcDI1X55x1FZzlpwLXGcmaXENz+JLpbKIyvlS9PUmWHklrq5sp
 UKbw9RNnxVihpbf7vV0OJkg05fbm6JjE+qm3g0PzzQ7eKzsv654j5j8CTJ8JKXe50KTEHPf
 Zi0LkjyYV7MPNm2UIlELJSfGRfl4QouGx8CLnuLd1laXaXhJlMJFZhfIokhw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BB543401CB
	for <nouveau@lists.freedesktop.org>; Sat, 27 Dec 2025 10:37:40 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA9610E60D
	for <nouveau@lists.freedesktop.org>; Sat, 27 Dec 2025 10:45:31 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7c6ce4f65f7so8057994a34.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 27 Dec 2025 02:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766832330; x=1767437130;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXmM0vaUF8T6HaGp2Qwj82J1GyNYQ80rIhTIDGlmJl4=;
        b=KmrakH2bs8DJZdWO9x4w25qrEbuFYDkfRv+N5TOPoM015xYh6MlLeorRtusIICVJyu
         0y4lnewJi1KvOXudCpoJYVoY0+vLrKsObk+gY233GebF0On9WBFLzOqKc5LaSIyk9itZ
         DAji+wv/5AQTIA6Ji28Gq/jC7xHvTLTXAUHfhPpSalx285ie1pxhznswD8Hm2wHoDO8n
         Xnyqv1OfVWlfBotBjDZTIDDNNOlvhBJcQBtNVK0bd3/cbIcVKMfNWT1B44L5HwXv6Nbg
         p7wqCNGn176GQFSXjyFsUzu2RmHBWzZagbs7CtH80QokK8zkle8Cjk2Py9gBGLOSMG1M
         Fw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766832330; x=1767437130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXmM0vaUF8T6HaGp2Qwj82J1GyNYQ80rIhTIDGlmJl4=;
        b=S9jcDeGOi9J+GtoS8Rtc1z4cShTB51YSIgpkF87EbgvG/Ium8TWVdvhbmzMTtbFVJD
         7qjRXEK30LJUnaWUuRyMz+Pr/78wsKnThN3V89cCrxIyArPAAnHoCmgFmXLxvdxnKgTv
         DTSVOi9hwPhwQL2rZ8iBp6zeZ/EWMhbsKycHbJ1OvxDpoK0nYRRwTkwajD348ss//8dJ
         +MBXjEX6TNpkZE6Ck78UpVoVGJTaXJzJGOCmqzUk5AWwbFGNNn/ndT/8f34uYMq3Ipfz
         2P99gXXmBtRZOOrTNbe8+PiYYCPtfttizCkxIGmMGsEwxkAq25b77fiX8AkeDhCY05hM
         wPWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB9BwkmHPKNKyXoYa8J0unZ06qCvLD17wvE3cRte6aA0ta3Hl+ddUW+8J22kkk6k88rD4onIBJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBWkoKb8M0GJUgwLZwjct0W3FNZPmovxy+Ot1hui2bhocnAABx
	XA5DyvyK2efrhWdwVfYoDC+WjwtXpFeN6e84mE3S2wrbxnlmF+pQAYRI/FE6skz4x/kET80p9VE
	PWsq/41w8dK+K/Bnk3AzlINfv6p7MgJU=
X-Gm-Gg: AY/fxX5pPvAdnrIbjeYwjEPnTfTODYkY0otP3rrc3srrIyjHK6ALs5kO/7lpXU8wIq7
	E7oQoCW/67dkzJ8xgAF5ZlXPXp5aVXdoqwvxq8t/dcMiS65HMuIokvAgQ0qcuAdAtDbYDD0k5dh
	qKsJNcX66qJOLeII/XMnbah1I4gd2J9S+GyCAsVcoEjByGyPmJPRkQTgTIKVmT7b0e4sHjirDy/
	Bq8kxrflcwPENPku/60msklRLpvalMFN4Y0pAHbEu3Pbmf3BJr9AI5SEqcm5muxpe0DwLY=
X-Google-Smtp-Source: 
 AGHT+IHChSL48doaNjZ0IZjwusM1nBU7UXoN7stEd64wAQCK3Vrc6Lw3VlzZDY3oTWSbl7cdWJww6R14sPpKlxri3V0=
X-Received: by 2002:a4a:e394:0:b0:659:9a49:8e98 with SMTP id
 006d021491bc7-65d0ea65dfdmr8520254eaf.28.1766832329837; Sat, 27 Dec 2025
 02:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-1-4a563d597836@gmail.com>
 <DF7HDE1T2BOS.33WUHP49WWO1M@kernel.org>
 <CA+tqQ4JPMg7CGq7YiN2EwzzQBC2grRE5OFgRQTws+xh8UbzqEw@mail.gmail.com>
 <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
In-Reply-To: <DF8QDONK951M.10NYLJ40UNNY1@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 27 Dec 2025 19:45:18 +0900
X-Gm-Features: AQt7F2qaaiupY9oCYaomnJflhKP2JFwAzZ_5Jn4mEAVTvrUa-MhmkN79dmSRVqo
Message-ID: 
 <CA+tqQ4Kyy1re209kjBvtJU037MEcv+jQzEt=E9CMS4d2iuFR5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: macros: add derive macro for `Into`
To: Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XVG5MSJVGEGRPQWFXY3LRMK2PNTFOHE6
X-Message-ID-Hash: XVG5MSJVGEGRPQWFXY3LRMK2PNTFOHE6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XVG5MSJVGEGRPQWFXY3LRMK2PNTFOHE6/>
Archived-At: 
 <https://lore.freedesktop.org/CA+tqQ4Kyy1re209kjBvtJU037MEcv+jQzEt=E9CMS4d2iuFR5g@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, Dec 27, 2025 at 1:57=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
> On Fri Dec 26, 2025 at 10:36 AM CET, Jesung Yang wrote:
> > On Fri, Dec 26, 2025 at 2:40=E2=80=AFAM Benno Lossin <lossin@kernel.org=
> wrote:
> >> On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
> >> > +fn parse_attrs(target: DeriveTarget, attrs: &[Attribute]) -> syn::R=
esult<(Vec<ValidTy>, Ident)> {
> >> > +    let helper =3D target.get_helper_name();
> >> > +
> >> > +    let mut repr_ty =3D None;
> >> > +    let mut helper_tys =3D Vec::new();
> >> > +    for attr in attrs {
> >> > +        if attr.path().is_ident("repr") {
> >> > +            attr.parse_nested_meta(|meta| {
> >> > +                let ident =3D meta.path.get_ident();
> >> > +                if ident.is_some_and(is_valid_primitive) {
> >> > +                    repr_ty =3D ident.cloned();
> >> > +                }
> >>
> >> While this works for now, writing `repr(C, {integer})` might become
> >> meaningful in the future, see [1]. We should just accept it now as wel=
l.
> >>
> >> [1]: https://github.com/rust-lang/rust/issues/68585
> >
> > I think it's worth noting. I'll add a small comment for this.
>
> My suggestion was to just accept `repr(C, {integer})` and make it result
> in the same as `repr({integer})`.

Ah I misread that. Thanks for the clarification.

> >> > +                // Delegate `repr` attribute validation to rustc.
> >> > +                Ok(())
> >> > +            })?;
> >> > +        } else if attr.path().is_ident(helper) && helper_tys.is_emp=
ty() {
> >> > +            let args =3D attr.parse_args_with(Punctuated::<ValidTy,=
 Token![,]>::parse_terminated)?;
> >> > +            helper_tys.extend(args);
> >> > +        }
> >> > +    }
> >> > +
> >> > +    // Note on field-less `repr(C)` enums (quote from [1]):
> >> > +    //
> >> > +    //   In C, enums with discriminants that do not all fit into an=
 `int` or all fit into an
> >> > +    //   `unsigned int` are a portability hazard: such enums are on=
ly permitted since C23, and not
> >> > +    //   supported e.g. by MSVC.
> >> > +    //
> >> > +    //   Furthermore, Rust interprets the discriminant values of `r=
epr(C)` enums as expressions of
> >> > +    //   type `isize`. This makes it impossible to implement the C2=
3 behavior of enums where the
> >> > +    //   enum discriminants have no predefined type and instead the=
 enum uses a type large enough
> >> > +    //   to hold all discriminants.
> >> > +    //
> >> > +    //   Therefore, `repr(C)` enums in Rust require that either all=
 discriminants to fit into a C
> >> > +    //   `int` or they all fit into an `unsigned int`.
> >> > +    //
> >> > +    // As such, `isize` is a reasonable representation for `repr(C)=
` enums, as it covers the range
> >> > +    //  of both `int` and `unsigned int`.
> >> > +    //
> >> > +    // For more information, see:
> >> > +    // - https://github.com/rust-lang/rust/issues/124403
> >> > +    // - https://github.com/rust-lang/rust/pull/147017
> >> > +    // - https://github.com/rust-lang/rust/blob/2ca7bcd03b87b52f705=
5a59b817443b0ac4a530d/compiler/rustc_lint_defs/src/builtin.rs#L5251-L5263 [=
1]
> >> > +
> >> > +    // Extract the representation passed by `#[repr(...)]` if prese=
nt. If nothing is
> >> > +    // specified, the default is `Rust` representation, which uses =
`isize` for its
> >> > +    // discriminant type.
> >> > +    // See: https://doc.rust-lang.org/reference/items/enumerations.=
html#r-items.enum.discriminant.repr-rust
> >>
> >> I think we should error when no `#[repr({integer})]` attribute is
> >> specified.
> >
> > Not a blocker but just out of curiosity: are you concerned that the
> > default size might change in the future, leading to silent side
> > effects?
>
> `isize` already changes size when you switch between 64 and 32 bit
> architectures. I think the author of an enum they want to convert into
> integers should think about which size the enum should be.
>
> They already can choose `repr(isize)` if that is correct in that case.
> As a default, I would have choosen `i32` (but that conflicts with Rust's
> default, so we can't do it).

Makes sense, that seems better.

> >> > +    fn impl_into(
> >> > +        enum_ident: &Ident,
> >> > +        variants: &[Ident],
> >> > +        repr_ty: &syn::Path,
> >> > +        input_ty: &ValidTy,
> >> > +    ) -> TokenStream {
> >> > +        let param =3D Ident::new("value", Span::call_site());
> >> > +
> >> > +        let overflow_assertion =3D emit_overflow_assert(enum_ident,=
 variants, repr_ty, input_ty);
> >> > +        let cast =3D match input_ty {
> >> > +            ValidTy::Bounded(inner) =3D> {
> >> > +                let base_ty =3D inner.emit_qualified_base_ty();
> >> > +                let expr =3D parse_quote! { #param as #base_ty };
> >> > +                // Since the discriminant of `#param`, an enum vari=
ant, is determined
> >> > +                // at compile-time, we can rely on `Bounded::from_e=
xpr()`. It requires
> >> > +                // the provided expression to be verifiable at comp=
ile-time to avoid
> >> > +                // triggering a build error.
> >> > +                inner.emit_from_expr(&expr)
> >> > +            }
> >> > +            ValidTy::Primitive(ident) if ident =3D=3D "bool" =3D> {
> >> > +                ::quote::quote! { (#param as #repr_ty) =3D=3D 1 }
> >> > +            }
> >> > +            qualified @ ValidTy::Primitive(_) =3D> ::quote::quote! =
{ #param as #qualified },
> >> > +        };
> >> > +
> >> > +        ::quote::quote! {
> >> > +            #[automatically_derived]
> >> > +            impl ::core::convert::From<#enum_ident> for #input_ty {
> >> > +                fn from(#param: #enum_ident) -> #input_ty {
> >> > +                    #overflow_assertion
> >> > +
> >> > +                    #cast
> >> > +                }
> >> > +            }
> >> > +        }
> >> > +    }
> >> > +
> >> > +    fn emit_overflow_assert(
> >> > +        enum_ident: &Ident,
> >> > +        variants: &[Ident],
> >> > +        repr_ty: &syn::Path,
> >> > +        input_ty: &ValidTy,
> >> > +    ) -> TokenStream {
> >>
> >> I feel like we should track this via traits rather than using a const
> >> assert. That approach will require & generate much less code.
> >
> > Sorry, but could you elaborate? A small example of what you have in
> > mind would help a lot.
>
> Oh yeah sorry, I had something different in mind compared to what I'll
> describe now, but it achieves the same thing without introducing new
> traits:
>
> We have two options:
> 1) We use `<input_ty as TryFrom<repr_ty>>::try_from` instead of writing
>    the `fits` function ourself.
> 2) We require `input_ty: From<repr_ty>`.
>
> The first option would still check every variant and should behave the
> same as your current code.
>
> Option 2 allows us to avoid the const altogether, but requires us to
> choose the smallest integer as the representation (and if we want to be
> able to use both `i8` and `u8`, we can't). I missed this before, so
> using option 1 might be the only way to allow conversions of this kind.

AFAIK, `<input_ty as TryFrom<repr_ty>>::try_from` cannot be called in
const contexts without `#![feature(const_trait_impl, const_convert)]`.
I assume we want to keep this validation at compile-time? If so, we
might need to stick with the custom `fits` check for now. Please let me
know if I misunderstood you.

Best regards,
Jesung
