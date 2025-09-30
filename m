Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E291CBAB8F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D533D10EA96;
	Sat, 13 Dec 2025 12:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ+tDQ5n";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2485210E2D5
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 20:13:03 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-58075580105so1066663e87.3
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759263181; x=1759867981; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vy7D8szbhIRwtgr1N1d15ZOmlMfXdraquxLR+CvWcVg=;
 b=fZ+tDQ5nd5rS6hOKw7ITXmDlJA2Qxu5s5SCJmu1TY7Kh4HjokAHJpsRWF7FmAblHd8
 kjNXHZDwNud9l/OcATo5LpeifaEJkR+efnRgPsSpS2IhrnauEoSY2QatGxjRtR5UXTtf
 bMc5i39+03Z/3vVrGZjGAbrJrx9a2kZXDtF1QFeqCIdn1kpxZ3W75GZEmSClRjQMa9mP
 4A2625cKXBxLwdgH/XY0gIk/IC3Bvibbh0wC3oR35icGSM7UI0EGyIosOBdIoqbI7hBa
 tfO15LZnQfj9uuUkmXb5Dtspg9wek0u8kOMUl1etygbt6eNcZRh+eaDdl4IY2gH3ivNK
 cgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759263181; x=1759867981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vy7D8szbhIRwtgr1N1d15ZOmlMfXdraquxLR+CvWcVg=;
 b=PVWiKKue4gVetu29r7CFOqR8CZWSDWjlH1axqMH1Sc9fJy/XfyJQ/tF2LYCV3U67mN
 VfWVQT7rAYqy715PM5MBakwx5HpaXwz6ydeZ+xcg4dcUVCpUhcmIIYc++xO2eKmQT2Ip
 y2u0di62SSvy0mCuybZBz37n8tyZ5mgKS1m1JEkfbvsPxMDmLvBPZQ06tvv7qrgWjTjT
 UTgmFeOFyC1NSRIwaWqqkRaizC5r/YPExVKZahepcc6tP8/uIv+3M7zyTTIhH46u4UnJ
 W4xxfcq4h6EpgS9TW382TEIgij4crpexhMcWeIpHn7qN4LEn8HBpphglms8SAidESoYJ
 jMJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoMQB+yCZpNh7xL4EEScbWAHWy7QhQL77RTXF/p+axuPx61SCAgwLpruZ57vxQmTy4J+yE7qIN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1Q/v8bkChUMT5Nb6FNK/mCUYhmSP72mYpqHewtB0jAF7x1OMh
 k8Ae3IF16ylfs0Yro8bqfxf4KH0z71chmkuJVFSHKBmoALnHIGHriHt3AHRRcCTiPisXf/ELQpJ
 NFuJFlPT+pStA2/wA36AxlHzSRGVa3Tc=
X-Gm-Gg: ASbGnctSsMt8+xkYzMOcJCB3tBNXN5GKQESvaX6LI5C+l5CUUf4XCIMxL8HXQO4Q5B0
 iT4Nyuc+/ZEkLEjiVHWpSWGUIUu/jHueaBsvQ/yekmmp4DIOyjzhhXGVMP3Iz3+A28+4JiBq6uA
 zmW0pyUTgm1TRc/HEsLG51gGHcgrPEC9/DqODxQG5bR2fYMrhV8X7YPZT8RjBZ3Q7/SSeD9454u
 C5mCATHxqGD733cb/lbT6F3VmavASnh4xFTWnMXf6Bej2Hk1nK3op++gm00x/4pRHzPJSv0eRYt
 WCVEbkEv3yGvPjUCQPMOkfIOTtxLOhmyaszEhqpOjzlIt+PMt2QQ+52QVi8W
X-Google-Smtp-Source: AGHT+IFtvw/2t0q6x52tfdQq5Jy2e/VSbjt1lzNtaWguSG6A/2TPrH6YJ+0urbPzdntmF9O0R56v9RKpZ+3tGWsFzOA=
X-Received: by 2002:a05:6512:3b9a:b0:55f:5965:e4e5 with SMTP id
 2adb3069b0e04-58af9f3d196mr109397e87.6.1759263181040; Tue, 30 Sep 2025
 13:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
In-Reply-To: <cover.1755235180.git.y.j3ms.n@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Sep 2025 22:12:42 +0200
X-Gm-Features: AS18NWCr6YpjKIG8ty5QsX8lB_uHMxpdXprhMtC5CD6I1cvtweLAmRebm3I8mVk
Message-ID: <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
To: Jesung Yang <y.j3ms.n@gmail.com>
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
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Fri, Aug 15, 2025 at 7:32=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> This patch series introduces derive macros for `TryFrom` and `Into`
> traits.

I took a quick look -- it is a nice series!

Some notes:

  - My biggest concern is the overflow caveat, which is a fairly big
one if one, especially if one is dealing with runtime values.

    Can we do better? Accessing the discriminant via `as` is available
in const context, and you already have every variant easily available,
so can we check that every variant fits in the relevant target types?

    For instance, by creating some item-level const blocks
(`static_assert!`s) -- dummy example for an unsigned-to-unsigned case:

        const _: () =3D { assert! (E::A as u128 <=3D u8::MAX as u128); };
        const _: () =3D { assert! (E::B as u128 <=3D u8::MAX as u128); };
        ...

    and so on. There may be better ways to do it -- I just quickly
brute forced it that unsigned case with what you already had for
handling variants:

        variants.iter().map(|variant| {
            quote! {
                const _: () =3D { assert!(#enum_ident::#variant as u128
<=3D #ty::MAX as u128); };
            }
        });

    Maybe this was already discussed elsewhere and there is a reason
not to do something like this, but it seems to me that we should try
to avoid that risk.

  - On other news, I will post in the coming days the `syn` patches,
and my plan is to merge them for next cycle, so when those are out,
Benno thought you could give them a go (we can still merge this with
your current approach and then convert, but still, more `syn` users
and converting the existing macros would be nice :).

    (By the way, the linked patches about converting the existing
macros to `syn` are an RFC in the sense that they cannot be applied,
but having `syn` itself is something we already agreed on a long time
ago.)

  - Couple nits: typo arise -> arises, and I would do `repr-rust`
instead of `repr-rs` since that is the anchor in the reference that
you are linking.

Thanks a lot!

Cheers,
Miguel
