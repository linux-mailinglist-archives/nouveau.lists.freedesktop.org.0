Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9449CBAEA9
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5960E10EC36;
	Sat, 13 Dec 2025 12:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3uG78OA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68910E1B1
 for <nouveau@lists.freedesktop.org>; Mon,  3 Nov 2025 00:18:48 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-4330d2ea04eso12684235ab.3
 for <nouveau@lists.freedesktop.org>; Sun, 02 Nov 2025 16:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762129127; x=1762733927; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lbukBbCI6fFMOGWwEkWiHxAZwAf/KbN3KB3I9KpMMx8=;
 b=i3uG78OA8U2Pl0M/58E3turUsZhsgkSg99lPm3ZsLdeUudhvb5MDuKbnEJWKqn/wnY
 aWaXl9DcNtJpInh/aLDMl1CCfJFf2w/QEVs6PV0ZnOHCeZTcOTld9ayYO+O5/nAT5Xv8
 XYSn/9nrhOaFvwR0cT65wiWE8bPlxDT+jZ62rBFp5BjPm9cIZJp72qZUDCLL9qoyiFNx
 nc32f54uVCCfZASxfk6Gs+RFUc2Npo7PJk9IolmMWpef8OGx/wngFpcDdfSmN2vSDSey
 +vQLqk54BiLX8HrmmZo6gDv4d5ckmlF8nbxsabkRWQyNb0HAEswQb6yXEvQ6pLH7k+6S
 JUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762129127; x=1762733927;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lbukBbCI6fFMOGWwEkWiHxAZwAf/KbN3KB3I9KpMMx8=;
 b=emxJ9ZU/TAIT2JzkCCxpcupYbcjaGAEAd32+Zx78LBBj9D+Am7RU50eCO8FJOdWPoz
 XUs+l51NxSZ67AoZ60+/qOZVSBTBJbnJQ214pfX+NflfihHoTQcoj17Aw19YaqT6I4iv
 vnWqDNOGKD+B4c8BxYXyMsOcfRkAazsrS0RavLdU2eQXvfahNStHHVm6YP7HEx1amu7/
 C7j3maZ/HHr8MFc+oGhDiDEdYAFCOQKjuY8BTfbm6BbyMKa430+NzmR1Radcxk3uneRO
 qDY0j07cY64C5iGxAtF4V+hzSaolLOQ5P7uw/euZGHe4FsM/fM8jY1Xyw9dU1C1WGrdU
 1KNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCCb/OJtqVv4Co69sU/BJl86Dp4J1l2OLDprZCT8+SmqC3EZE2n8oLJ57w0dFVTRadMEaMV3cp@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziUpeT5PFvCHtjsS4EdFwWlsd3khj2oHfmzBNw3mJQ52CFSSFT
 NcVOiNi6iy0vyfR8Z2s3MUqQmrze0qF83XDJD5kMt7lsZYZr40pTOg+sLn9I8w93Nvrjg+jSv4S
 RjpLQNC42YVfWymCTLspHy0Zi6G3XGdM=
X-Gm-Gg: ASbGncu6W+1uaSQIIfeBwh+9nNDiwFVzoeilFcgQbuicLmpHrmfj7Gt8c71gGzoZ18K
 Ffy6mn0MZULj4xQSHFFh2yXFp8EE356VIkFg56D+GhesRDklqWb763R0mJN8t0wuyeoQb5t7eGY
 Mv+imn6wG6Q2miQ/7tKReEU/N7JhTKGjsnS9KmcKlgEFPCKtn4iDCzqcEIqKBdXgmWSVFC1I3OS
 i00Pqjux7I2m2MEB42nEoRBck/K/jaymogiErVbIw3C/yuAPT0f566mjO1mQ9JgxPpOnsR56mVa
 /O8=
X-Google-Smtp-Source: AGHT+IEinxxKyGpY13CBZYEiEZRj5ZtrHLcrvHXjjmmISTFYSNVaHSlve6zbB1g6ISy0GNLADF79gcMJCySg/fAhlK4=
X-Received: by 2002:a05:6e02:221e:b0:433:2d0f:e95d with SMTP id
 e9e14a558f8ab-4332d0ff57fmr29075505ab.27.1762129127059; Sun, 02 Nov 2025
 16:18:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
 <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
 <CANiq72kE89ukxpf3L0_jFOdv51TDtjjj3r=1mjJzdGWJwmAbaQ@mail.gmail.com>
 <CA+tqQ4J7_z7_NmUNojJttF1e8GRR8Ua9w0Rap1t-U4gYPhQ1Yg@mail.gmail.com>
 <DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com>
In-Reply-To: <DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 3 Nov 2025 09:18:35 +0900
X-Gm-Features: AWmQ_bmjwfOG0Fsadhki6hbGrYasLvIYy1-mvKZIH8xEYEub_dTdviKWOD4hlxE
Message-ID: <CA+tqQ4+NY2zFJrr2omGqQcVG1N4cJBgYNO8qH=TFi5UG_vLfTA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Oct 14, 2025 at 3:35 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
[...]
> This might not be too difficult to shoehorn as there is an
> `is_in_bounds!` macro (which we can turn into a const method if that's
> more suitable) that your proc macro could leverage, but I can't help but
> thing that maybe there is a better, more general solution than
> special-casing this?
>
> [1] https://lore.kernel.org/rust-for-linux/20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com/

I've tried your `BitInt` series, and I think I can generalize (at
least the overflow check) even without the help of `fits_within!`.
Since I can retrieve the number of valid bits and the signedness of a
given integer type (including `BitInt`) while parsing the helper
attributes, I can use that information to check whether casting from
a value of type T to type U would overflow. Here's a sketch using
declarative macro syntax to demonstrate the idea:

```
// I'll write a function that returns equivalent `TokenStream`, which
// is suitable for procedural macros.
macro_rules! check_overflow {
    ($val:expr, $src_ty:ty, $dst_ty:ty, $dst_nbits:expr) => {{
        let val: $src_ty = $val;

        // For every integer type (including `BitInt`), its minimum
        // value always fits in `i128`.
        let dst_min =
            (<$dst_ty>::MIN >> (<$dst_ty>::BITS - ($dst_nbits))) as i128;
        // For every integer type (including `BitInt`), its maximum
        // value always fits in `u128`.
        let dst_max =
            (<$dst_ty>::MAX >> (<$dst_ty>::BITS - ($dst_nbits))) as u128;

        #[allow(unused_comparisons)]
        let is_src_signed = <$src_ty>::MIN < 0;
        #[allow(unused_comparisons)]
        let is_dst_signed = dst_min < 0;

        let fits = if is_src_signed && is_dst_signed {
            // Casting from a signed value to `i128` does not
            // overflow since `i128` is the largest signed
            // primitive integer type.
            (val as i128) >= dst_min && val <= dst_max
        } else if !is_src_signed && !is_dst_signed {
            // Casting from an unsigned value to `u128` does not
            // overflow since `u128` is the largest unsigned
            // primitive integer type.
            (val as u128) <= dst_max
        } else if is_src_signed && !is_dst_signed {
            // Casting from a signed value greater than 0 to `u128`
            // does not overflow since since `u128::MAX` is
            // greater than `i128::MAX`.
            val >= 0 && (val as u128) <= dst_max
        } else {
            // Casting from an unsigned value to `u128` does not
            // overflow since `u128` is the largest unsigned
            // primitive integer type.
            (val as u128) <= dst_max
        };

        !fits
    }};
    // Yes, we can also support `bool`!
    ($val:expr, $src_ty:ty, bool) => {{
        let val: $src_ty = $val;

        let fits = val == 0 || val == 1;

        !fits
    }};
}

// For a `#[repr(i32)]` enum with `#[try_from(BitInt<u8, 4>)]` and
// `#[into(BitInt<u8, 4>)]`:
check_overflow!(Enum::A as i32, i32, u8, 4);

// For a `#[repr(i32)]` enum with `#[try_from(u8)]` and `#[into(u8)]`:
check_overflow!(Enum::A as i32, i32, u8, u8::BITS);

// For a `#[repr(i32)]` enum with `#[try_from(bool)]` and
// `#[into(bool)]`:
check_overflow!(Enum::A as i32, i32, bool);
```

It is somewhat similar to `fits_within!`, but it also cares signedness
differences between source and destination types.

It might help if `BitInt` exposed `MIN` and `MAX` associated constants
in terms of its backing type:

```
macro_rules! impl_max_min {
    ($($type:ty),+) => {
        $(
        impl<const NUM_BITS: u32> BitInt<$type, NUM_BITS> {
            pub const MIN: $type =
                <$type>::MIN >> (<$type>::BITS - NUM_BITS);
            pub const MAX: $type =
                <$type>::MAX >> (<$type>::BITS - NUM_BITS);
        }
        )+
    };
}
impl_max_min!(u8, u16, u32, u64, i8, i16, i32, i64);
```

... but for consistency with existing primitive integer types, these
constants would ideally be of type `BitInt` instead of the backing
type, which unfortunately limits their usefulness in implementing
`check_overflow!`.

As a final side note: as you're already aware, breaking changes to
`BitInt` will also affect the `TryFrom` and `Into` derive macros, since
these macros depend on certain public APIs provided by `BitInt`. The
same applies to any future custom types that require support from these
macros. That said, I'll do my best to minimize the dependency wherever
possible.

Best Regards,
Jesung
