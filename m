Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D90CBADE5
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464C10EB7D;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="aM5eeVz1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A76A10E0C5
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 14:17:38 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24050da1b9eso5220915ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 04 Aug 2025 07:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754317058; x=1754921858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cj5LMXFCZ1M7KQUj/Qw+ZYW8TP1RxMgPY8c23lvf4BM=;
 b=aM5eeVz10ePYzyO9H9v1L8O6dA/Z5W804v5G5Ktb9dlycPHFMgHl89XsI6pcuBup/N
 S7iAztp+GuKUUryYhv5J+5J7FVW38aW9o7zWVmTnOrDotKTB8KD/T64kJA3mGgtc+kZr
 Uow6YxLHtQJ/tRi1kgQ89Rul4tsg7Ux74uXwiDDvPo13NWfy6TiAe7gm55lPdUw8mESb
 6jY8IC+5y9Vsnz8HNLfx2qwWbxg2JNrhEAH3x4aXJ9zERti0JQhzEVl9KByxdN5Mtssb
 ZRp3aDevzNDSyEGs7gCXWEuTOQg8YA9sWYjOisQj88L20alRG4u5zlzrfDspbpFx+j/q
 8srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754317058; x=1754921858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cj5LMXFCZ1M7KQUj/Qw+ZYW8TP1RxMgPY8c23lvf4BM=;
 b=KgmiUlkCd0iETX1BfPUO3FGb+leMC7AijC/BDr8HYWcvJ5aBOvtzWPADvcaeOwlAku
 IJFgDPPuMhZLrq7ezkojZhUthvKrqe4/1/3HsPg71JtGx/dCNjLcjbEbcxg+lt+Gdk04
 rwsE5JosFKk4jqWEfRE82AeU2T0j7uzjGf/crWLSmUomDXF+ezrmGW/xY56i3OtiBQgn
 /Gt79kgZxjhX9Gp7nCrovu+QDTgLsaoMnjWX5h0eYU2Dp5vxySuSVszGQ2pYxo/7eQUl
 Pxazwg68QYX3+CJc24w2+v20uQRUG76g5zNaOF7h6gS2R06mTF7ZgQkZht+dzUoVYXKd
 JaNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgU29cGfvZwF+3EdRP5J4VlEhF+cys22IaHInqvN77bx7a2KD40BcpvfNw/yFBmNusiYCBfTjL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUeub+bGWqmLy/ggh/H9OpoWDTim7Z43FzCRrNrS7iNpGDS5ot
 ALbKvtiJ82eezBfZPS1UwuvqIidmPubMAOCmnNtH3FJmwYmrPSF13vrY4S7FX7qDLDcngytkWy0
 hXepiziqmc2oMzMSSKA/P2dHgWeu3/TI=
X-Gm-Gg: ASbGncvbhEpxZ7jrabKknAma+VA8eNL4eAjVYna7pw/BfPNLHCAohXu8nSq/6OXgX+T
 qhFOYFs7684BSCsCpOfARHAbpjAdV+0tAQhV5W8s93s+5qkj6rdbA7I6oV+65RTqQBJ+kHNKUl9
 UbJtyn+ONs1vyiB65w4lKnnweuavDSIBzrynmg1VKk5o2CHe5/Bnk5dl79C3vxEY1N20xqF/UAC
 GyAGpTn
X-Google-Smtp-Source: AGHT+IHoIKRTao7XkfgA4kePRWm3e59NNTaknJ0r8ZXP5Lhp3Ma7eKeiuMTWnPj5rGZqOm7Zr5ROoZlk5pWcnXNkUMQ=
X-Received: by 2002:a17:902:e743:b0:240:71db:fd0 with SMTP id
 d9443c01a7336-24246fcb42emr54973825ad.8.1754317057946; Mon, 04 Aug 2025
 07:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
In-Reply-To: <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 Aug 2025 16:17:26 +0200
X-Gm-Features: Ac12FXzf9euOeG2E0bVmnruyqbjbiK7AJnC-T013YUx-5fpBzzCknyhtAiw29Y8
Message-ID: <CANiq72miQSuEEzKZsOhHKDah1kP+8PYcmODGqwtcaRwAggF-+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:47 +0000
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

On Mon, Aug 4, 2025 at 1:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +/// align down/up operations. The alignment operations are done using th=
e [`align_up!`] and
> +/// [`align_down!`] macros.

These intra-doc links don't work (they are not macros in this version at le=
ast).

> +    /// Returns the alignment of `T`.
> +    #[inline(always)]
> +    pub const fn of<T>() -> Self {
> +        // INVARIANT: `align_of` always returns a power of 2.
> +        Self(unsafe { NonZero::new_unchecked(align_of::<T>()) })

Missing safety comment (`CLIPPY=3D1` spots it).

Also, cannot we use `new()` here? i.e. the value will be known at compile-t=
ime.

> +        if !self.0.is_power_of_two() {
> +            // SAFETY: per the invariants, `self.0` is always a power of=
 two so this block will
> +            // never be reached.
> +            unsafe { core::hint::unreachable_unchecked() }
> +        }

I guess this one is here to help optimize users after they inline the
cal? Is there a particular case you noticed? i.e. it may be worth
mentioning it.

> +    pub const fn mask(self) -> usize {
> +        // INVARIANT: `self.as_usize()` is guaranteed to be a power of t=
wo (i.e. non-zero), thus
> +        // `1` can safely be substracted from it.
> +        self.as_usize() - 1
> +    }

I am not sure why there is `// INVARIANT` here, since we are not
creating a new `Self`.

I guess by "safely" you are trying to say there is no overflow risk --
I would be explicit and avoid "safe", since it is safe to overflow.

Typo: subtracted

Cheers,
Miguel
