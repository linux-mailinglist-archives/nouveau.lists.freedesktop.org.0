Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF60CBAFD9
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDB310ECD1;
	Sat, 13 Dec 2025 12:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq9qTrU3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDADF10E0A1
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 10:08:11 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-42486ed0706so10674385ab.0
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760090891; x=1760695691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9JuJuRZhLwsG+1iMul2+WUv/TYmYlRZZULI5AyK9zhk=;
 b=Vq9qTrU3AUS2vHEe4nAR8/xOrJhhysr7P4/HYuXyGU+mkoNNr5Ml9DYKIz0qzXPrnn
 Vp0n/FpRO7IxtubVPMG6tSNPMA5K28oBPte/bTzy6xQIbKp4+vyvunOSrdx7F16l3taC
 lc1mNV3y74vKzlYR+AoSHffAYIUoEn5eAT0qMLroiXd0ORfnC+f+e9l8pTcPI0f8DRKK
 4iuLGDafTG6IGDdGc/+qqBONjpYdaG+6K1xatTI8cQb+oBatBtTQRaOTUXPaSiFHstqx
 mLfb4adtNv1htRnLQ0Ji6yIKYW6Rr+TgiNukLHQdpzPurx34OWh8R9ZJUIcztpodFEpV
 u+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760090891; x=1760695691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9JuJuRZhLwsG+1iMul2+WUv/TYmYlRZZULI5AyK9zhk=;
 b=mVqNpNBToxHq96q4oAVSMqcmOLe54YqIVGOebun1bT58urYJXgW7dUQkj65G+EHaIU
 53amlwkQrJxPR5mMkWoTHRGMMkJ6YpolWLhnYQG8LRP4SBFI7X2TCVfLOgIheeafX7Zt
 Ue9Kn092VhF+11lu2GqmXvg3SC9NIQnafD+vX5cr+FxWto5i0wrsDvJBKg9jlWCiHAka
 /xBv58gfIrNGmFcWL16F6BUQxLUkIlu9rEel/zOEEWKr9VuWkj4c4R5D3CaDG9lxDaOY
 t6l2QUDD0UFC1+RDtNzV5w0GSxpNajPkBWZVxscHcvY6kRW0+gRu6UlEa2IJrNaU2D8P
 ToDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuOraYGI8fSEy+k2yCy3jcArWhdJkkSjjUJ91Sn7V4m/70wUVrAJW2ngt461djjCj8u3H2LD4M@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMsc6F/9hUprrELX4n1ilhiOMVpWKdti9oRJYCB6imk8mBhdAI
 mLhLYWfZ8ErFw72M1+sk+bQE2p9UNEIKuNF9DGN0MXI0am/Pve9wucMKWBVDYD3u2CYtQdnh0Ca
 450VndrX9i7+lmoWP+V7eiu4tdN7pGz0=
X-Gm-Gg: ASbGncunsC+Yal1VU6dSw8GTEGyTvIeMie/g5lM0PIX4v5Yarj7tHmIdsIj9ORzH7El
 /kjDGeUT87HS3L2rb5NdIGPUKqSszH4HMkdNEXO5UinwtW6Mu8bj8oQI/lj7r8Z7659+eCpLExN
 wgtIjEIrRtZYYOM1vfv2qHfrbJU6KcEWZdnB4Mui/MEkkC6SwZrQPQD8KP2XibHkEvnhLurUnlB
 Ruiqe2MUOzjQYkHVgMrRuEaPnD8TJ36/AM6bDWVgQ==
X-Google-Smtp-Source: AGHT+IGuRdBMYAkwKzsAFlzdYolufmnZhc4gT3Qkanm3b+H0ZT0F+1Fkx1oHfqeGTKvMgS5xq+3CPhlmxRxpaK9+R9M=
X-Received: by 2002:a05:6e02:18c5:b0:3f2:a771:9fb3 with SMTP id
 e9e14a558f8ab-42f873f432amr105318985ab.27.1760090890836; Fri, 10 Oct 2025
 03:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
In-Reply-To: <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 10 Oct 2025 19:07:58 +0900
X-Gm-Features: AS18NWBVMcBD24mf1KqbL440nVAyfGu-ZCbyG3tLNt_guISUTjnPv0xN-eS_TOI
Message-ID: <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Wed, Oct 1, 2025 at 5:13=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
[...]
>   - My biggest concern is the overflow caveat, which is a fairly big
> one if one, especially if one is dealing with runtime values.
>
>     Can we do better? Accessing the discriminant via `as` is available
> in const context, and you already have every variant easily available,
> so can we check that every variant fits in the relevant target types?
>
>     For instance, by creating some item-level const blocks
> (`static_assert!`s) -- dummy example for an unsigned-to-unsigned case:
>
>         const _: () =3D { assert! (E::A as u128 <=3D u8::MAX as u128); };
>         const _: () =3D { assert! (E::B as u128 <=3D u8::MAX as u128); };
>         ...
>
>     and so on. There may be better ways to do it -- I just quickly
> brute forced it that unsigned case with what you already had for
> handling variants:
>
>         variants.iter().map(|variant| {
>             quote! {
>                 const _: () =3D { assert!(#enum_ident::#variant as u128
> <=3D #ty::MAX as u128); };
>             }
>         });
>
>     Maybe this was already discussed elsewhere and there is a reason
> not to do something like this, but it seems to me that we should try
> to avoid that risk.

Thanks, I see your point, and I agree that compile-time checking for
potential overflows is a better and safer approach.

That said, it becomes a bit trickier when dealing with conversions
between signed and unsigned types, particularly when `u128` and `i128`
are involved. For example:

    #[derive(TryFrom, Into)]
    #[try_from(u128)]
    #[into(u128)]
    #[repr(i128)]
    enum MyEnum {
        A =3D 0xffffffffffffffff0, // larger than u64::MAX
        B =3D -1
    }

In this case, since there's no numeric type that can encompass both
`u128` and `i128`, I don't think we can express a compile-time
assertion like the one you suggested. While such edge cases involving
128-bit numeric types are unlikely in practice, the broader challenge
is that, in signed-to-unsigned conversions, I think it's difficult to
detect overflows using only the `repr` type, the target type, and the
discriminant value interpreted as the target type (please correct me if
I've misunderstood something here).

I'm considering an alternative approach: performing these checks while
parsing the macro inputs, to handle all combinations of `repr` and
target types (such as `u128` in the above example) in a unified way. I
believe this makes the behavior easier to reason about and better
covers edge cases like conversions between `i128` and `u128`. For
example:

    const U128_ALLOWED: [&str; 9] =3D
        ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "u128"];
    const I128_ALLOWED: [&str; 9] =3D
        ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "i128"];
    ...

    // Use this function after parsing `#[repr(...)]`, `#[into(u128)]`
    // and `#[try_from(...)]`.
    fn check_overflow(
        discriminant_repr: &str,
        helper_inputs: Vec<&str>
    ) -> Vec<&str> {
        let mut violations =3D Vec::new();
        if discriminant_repr =3D=3D "u128" {
            for ty in helper_inputs.iter() {
                if !U128_ALLOWED.contains(&ty) {
                    violations.push(ty);
                }
            }
        } else if discriminant_repr =3D=3D "i128" {
            for ty in helper_inputs.iter() {
                if !I128_ALLOWED.contains(&ty) {
                    violations.push(ty);
                }
            }
        }
        ...
        violations
    }

This is a rough sketch, but it gives a consistent way to reject
obviously invalid combinations early during parsing. I'd appreciate
your thoughts -- does this approach seem reasonable to you as well?

>   - On other news, I will post in the coming days the `syn` patches,
> and my plan is to merge them for next cycle, so when those are out,
> Benno thought you could give them a go (we can still merge this with
> your current approach and then convert, but still, more `syn` users
> and converting the existing macros would be nice :).
>
>     (By the way, the linked patches about converting the existing
> macros to `syn` are an RFC in the sense that they cannot be applied,
> but having `syn` itself is something we already agreed on a long time
> ago.)

Sounds good -- I'd be happy to give `syn` a try. It should simplify
the parsing logic quite a bit, and I believe it'll also make things
easier for reviewers.

>   - Couple nits: typo arise -> arises, and I would do `repr-rust`
> instead of `repr-rs` since that is the anchor in the reference that
> you are linking.

Thanks, I'll fix them in v3.

Best Regards,
Jesung

>
> Thanks a lot!
>
> Cheers,
> Miguel
