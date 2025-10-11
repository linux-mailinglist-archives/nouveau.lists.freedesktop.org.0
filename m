Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F43CBAD04
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8586810EBBF;
	Sat, 13 Dec 2025 12:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGWNpJ9x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A39110E0C7
 for <nouveau@lists.freedesktop.org>; Sat, 11 Oct 2025 14:53:13 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-91e578e2a61so129193939f.2
 for <nouveau@lists.freedesktop.org>; Sat, 11 Oct 2025 07:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760194392; x=1760799192; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ax786NHBHHpTg8NhBwV3RBjSy/8C3s4oYnbb7WT6QLw=;
 b=UGWNpJ9x1yADBpBzRorQaOgYFLG0ax5NqL/GtftPkMAVQge6JDaBHFGZWpLe01x2DO
 Vos52965otnh7YZuWvafU6G09n3neWyotz4CxPZC6VFPX/uz3XNRPRwWXpakt87fkvn8
 61NBQ/SANJPiTM9r3NQdsIEof5ZAlSheowXLe7mBUvJTH3cyqHaDR7sFMU4GKxL3YyuS
 llOpGgZGVMLWLV7dqN4PdagKqRSaLHAQjihoeD3NkaBtNasINzSstWkyDSkGcJTnaATd
 WnLBi788p7nk71QYZCujur5G3GLYk++ML38kbIepDgIhkEMU6LvoJNy23F/GMdQAF+0E
 L0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760194392; x=1760799192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ax786NHBHHpTg8NhBwV3RBjSy/8C3s4oYnbb7WT6QLw=;
 b=bpS0bAalfpQymbZQ5R5MW5iwsC9hDktZSQY2T1yyDv9hCx7VT2bLomff5MbcZMUCqa
 UwvuWgi8dWwHUwGqzemIUuH08Bjlk3542TL5v4ROUOKinLhNFgHmIBt9B1Wa68HkJ1ex
 5qLJLejBeQS/xB9V0hcCQoA6nmzcFyg9kJ571MtxtXGt1voRDYRXIHfORoNIpUATpGio
 unBCekSwNKSLZZj56kSWhYu8pY7o1YTBevHSJXT2imN9asoWbw/AaXNjADoTQbnTolz3
 mSoqFofxRPoUqdJW0HIPWnZ5cxxGOS/qaNiNNZxcReofZBocZNRV5TPU4bjPOONWemUT
 50kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlstpzeCt996CeiMlWuVQDgECv6HKKY0moUSGPnS9kwpxS5uFisBrTC5YOzFIqUJ9ccjx07NKu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCt5aivgQvUsWuKKH7cImmIvgpyJHSxLpHlhvsE2iHX22a6oLe
 bbX0DQLCqO+NqIspvep6o/2V5w8AMhy1a5Wj/YvP1Le554/loAfG2j4lqgw3E2y/hyELwCf9aW2
 qEKupbJ09y0iASQY0dL2ITerx4+SKSP0=
X-Gm-Gg: ASbGncs4LLccvLuM0A/RuWntdvzJzhjinCyLODdw/yph6ZYNF/H40sMYawnpEmfr2ne
 FMR+lrUkBQjlqr4dp/a+1x1asjhr41PZXkiO6f4A2ybnbGT9cGYwknGOKNzmDmEzv18+lcvdbo9
 Z65LDVwJYQ8UZ6LILJppW+4it/EL2IZss4bcqyqa4uYxsBboWyKfAjkV2ywHL+ZqQL1K7AhVV9i
 5SuWTgVW2JjDORcrJvZmZvzKbW/c2ote9cRft0S32dn10f81w2i
X-Google-Smtp-Source: AGHT+IGelNAChiwvd1QIIsVjXT8otgdB/o8fUu1FJvzWGsfqv3ACbWv9Myx5ycGYbMHeIh8AcUX+c3ga6qd1PGeON+w=
X-Received: by 2002:a05:6e02:148d:b0:42f:9708:168f with SMTP id
 e9e14a558f8ab-42f9708183emr109556905ab.16.1760194392237; Sat, 11 Oct 2025
 07:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
 <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
 <CANiq72kE89ukxpf3L0_jFOdv51TDtjjj3r=1mjJzdGWJwmAbaQ@mail.gmail.com>
In-Reply-To: <CANiq72kE89ukxpf3L0_jFOdv51TDtjjj3r=1mjJzdGWJwmAbaQ@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 11 Oct 2025 23:53:00 +0900
X-Gm-Features: AS18NWBxitqWPgx67xtxY0Tu7rDxhSjoDZ4dv9U5mH8wQ6n3kHU_eUVN0pCdWYk
Message-ID: <CA+tqQ4J7_z7_NmUNojJttF1e8GRR8Ua9w0Rap1t-U4gYPhQ1Yg@mail.gmail.com>
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

On Fri, Oct 10, 2025 at 10:04=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
[...]
> But what case do you think we cannot assert? We can always take the
> discriminant and reject whatever inputs (e.g. ranges) we decide, no?
> And we know what type we are going into, so we can always decide what
> the values to check will be, i.e. we could in principle even support
> infallible conversions of the discriminant to other types like, say,
> the bounded integers or powers of two.
>
> Maybe the issue is in what you say at "the discriminant value
> interpreted as the target type" -- I am not sure what you mean by
> "interpreted", i.e. I would think of this as accepting only some bit
> patterns, i.e. working with in the discriminant space, not the target
> type one.
>
> I may be missing something, but in any case, at the end of the day,
> within a proc macro "everything" should be possible one way or another
> -- even if we had to inspect manually the literals :) And it seems
> worth to remove the pitfall.
>
> If really needed, we can always drop support for certain combinations.
> We already do, in the sense that we don't cover every single other
> type out there, like the ones I mention above, e.g. `Alignment`. But,
> just in case, I assume with that approach you mean skipping some
> combinations early (the ones that cannot be checked) and then still
> asserting the discriminants, right? Otherwise the caveat is still
> there.

Sorry about the confusion -- the rough sketch I shared earlier had
several mistakes.

My actual intention was to emit a compile-time error using
`compile_error!()` whenever a conversion could overflow. With this
approach, the caveat wouldn't exist, since proc macro users wouldn't be
able to generate `TryFrom` or `Into` (`From`) implementations that
could potentially cause overflow issues. For example:

    // This emits a compile-time error because not all `i128` values
    // can be converted to `u128`, even though 0 and 1 are valid `u128`
    // values.
    #[derive(TryFrom, Into)]
    #[try_from(u128)]
    #[into(u128)]
    #[repr(i128)]
    enum MyEnum {
        A =3D 0,
        B =3D 1,
    }

To make this idea work as intended, I should have revised the earlier
sketch as follows:

- const U128_ALLOWED: [&str; 9] =3D
-     ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "u128"];
- const I128_ALLOWED: [&str; 9] =3D
-     ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "i128"];
+ // Allowed helper inputs when `repr(u128)` is used.
+ const U128_ALLOWED: [&str; 1] =3D ["u128"];
+ // Allowed helper inputs when `repr(i128)` is used.
+ const I128_ALLOWED: [&str; 1] =3D ["i128"];

The downside of this approach is that, as you can see, it is overly
restrictive for large target types such as `u128` and `i128`, because
the remaining numeric types cannot accommodate their full range. As a
result, the macros could reject some valid use cases, for example when
the actual discriminants can be converted without overflow, since the
check operates at the type level rather than on specific discriminants.

Considering this, and as you suggested, I think the right direction is
to introduce a compile-time check for each discriminant. I initially
thought it would be difficult, but after some exploration, it seems
doable.

Thanks a lot for your feedback, I really appreciate it!

Best Regards,
Jesung

> Thanks!
>
> Cheers,
> Miguel
