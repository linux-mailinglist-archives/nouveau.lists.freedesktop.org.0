Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97ECBAB95
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D518D10EA06;
	Sat, 13 Dec 2025 12:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="hL+A79kw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A5510E1D6
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 11:57:43 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7b827ff341cso69796b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 03:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764849463; x=1765454263; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
 b=hL+A79kwFV4GluGHbmXPJ15k+ntywb+UavsrRwplVYL5XsVe4h1ngydzkHlhLq6qvf
 j22H4Oe80H5QrySILyh5KSBu1JaY4gz6WxkaPt0KPj5Qacn/p6qFtqZkFKIzV6mUXTpN
 AD8rkT86gM9dufQvF8q9WiPE8soA3oyBmk63TQ9/aEtXFayFVZlwUFCPHLZvbE77LdIZ
 yXkXu9APd50lYaE2/eg4g1HBb6plGVJxJ04UEsBpsHY+l9ngd3I3IInhM0VhyST5rXSJ
 xCBNeLx4LQJfSlkhW4nfDNnmPu+PxcdsKZcdnR0HoQS2TzyX59or06QLUCR5Qcz+dQKJ
 T1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764849463; x=1765454263;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jy74VhsBG2iXSHso83Jci8BnfjXIZJpeGjIa5hx2ujU=;
 b=K6s4NvIMu6DWxTipVZbHX7258+d1p7bbjzmBv8Jcl68qwoBj/Sch/oOqOK0ImbCnVk
 sRPAXxiXFwQSNA2WMJQcCOWXCMDMh/uT3lHWaM0UJWxJxEa3vpsibFd4AnV8JCTqb7x7
 lk43jPhSPu9BtOjtX54wGXj1cEtjnonCpuc2cnxOQ4N5FZhcg4W2wq57IbiMCkKbZT0B
 zz9TBvsctuv14bYLTU/X3pBV13tO2Qk8b7KkAEmUc+slS55HaVFyhRQcRcNC32/AzNsh
 M+ewSSwojHRsqv4M9V7Ye76uwPVN9qmrqTCz0I+ox/6frOlu8VT9k2VftSoSfTlEgjjZ
 4NKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXGq37R1K0zWNHXbZDNuNRSoV/XBe3bRshczEUq+oYbXnVB3yHCW4TkbtsdUk5Akr5cur31+xi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxoku0ypB4VqlVSuqOVt+wYoJDafZRtQHJAAaUcIUmGEc79vsoA
 ODlL1CLCLYpG4NJKxWDjnSGHDflg540+VOAAvlZhLKBXfpK/ij20uHidNfzQjfku8xj5ZZZuQKa
 Xpn11Y0jMwi51K0oUA+6j4cOBUfZJjqM=
X-Gm-Gg: ASbGncuPAqAa372G01j4dI8v3dUWRJ2Tf1T7GJF+rOC6p9EJUmYORnzQYF/gJ/b+nvE
 0iYP9RWRsEnX4qb9Zr18wWDjz0cLtYBQfhdn7W3VqNGsBgKznUkgJViL+Dx3aFu75KcMNR4BaNp
 alKo5bd0UqUzjCrWSEArxHdocqrtNA3qWDeU+2Nw50mQ8Ykv8OASOCnnzYLvevdVr6IXxlF/B/m
 hGKSLIQ/JsWvRKAqm6OouYeWEKRPeVnkXrW+9v/rQWY75/+5sV1myc4kNpsJafQ9v2EGZk71NsI
 +ash3+Stjh1ZLyBYr/EQkEESXZW598b4Rjn+Nx7r0kX5+HEwGVByQXyZkYHh0IuQXkK4rvGiW1T
 QJOk/FOi5qECqFw==
X-Google-Smtp-Source: AGHT+IGeyoDrjBm9pUlwr3L1lIhuYxiVR/nMKBo3Q8beIteuq1z76e1BQfFIgP3nnV9ieQFXYxZbKA8xY2mkFTTQZGc=
X-Received: by 2002:a05:7022:49a:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-11df25f6eb3mr3361650c88.4.1764849463230; Thu, 04 Dec 2025
 03:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
In-Reply-To: <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 12:57:31 +0100
X-Gm-Features: AWmQ_bndz8ZZuXxUaBe-jxDMfOtEPNEq7y8MIf5_IqbpeKBzcbrA6kGhc4U4gvc
Message-ID: <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Peter Zijlstra <peterz@infradead.org>, Antoni Boucher <bouanto@zoho.com>, 
 =?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>, 
 Arthur Cohen <arthur.cohen@embecosm.com>, Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Josh Triplett <josh@joshtriplett.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
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

On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Right. Earlier I also proposed using libclang to parse the C header and
> inject that. This might be a little simpler, in that..

Yeah, that would be closer to the `bindgen` route in that `libclang`
gets already involved.

> ... if you build rustc against libclang they are necessarily from the
> same LLVM build.

So currently there are 3 "LLVMs" that get involved:

  - The one Clang uses (in LLVM=3D1 builds).
  - The one `rustc` uses (the LLVM backend).
  - The one `bindgen` uses (via libclang).

If that is all done within `rustc` (so no `bindgen`), then there may
still be `rustc` vs. Clang mismatches, which are harder to resolve in
the Rust side at least (it is easier to pick another Clang version to
match).

For those using builds from distros, that shouldn't be a problem.
Others using external `rustc` builds, e.g. from `rustup` (e.g. for
testing different Rust versions) it would be harder.

But I mean, anything approach that gets us into a better position is
welcome and I think requiring people to match LLVM everywhere should
be easier now that distributions are starting to enable Rust (even
Debian).

We have been talking about this since the very beginning of the
project -- e.g. I remember Wedson and I talking to Josh et al. about
improving the situation here (in particular, talking about integrating
a solution into `rustc` directly) long before Rust was merged into the
kernel. Even on things like a `rustc cc` or `cImport` like Zig (but
Zig moved on the other direction since then), which I recall Gary
having opinions about too.

There is also the question about GCC. A deeper integration into
`rustc` would ideally need to have a way (perhaps depending on the
backend picked?) to support GCC builds properly (to read the header
and flags as expected, as you mention).

And finally there is the question of what GCC Rust would do in such a
case. Things have substantially changed on the GCC Rust in the last
years, and they are now closer to build the kernel, thus I think their
side of things is getting important to consider too.

Cc'ing Emilio (`bindgen`), Antoni (GCC backend) and Arthur (GCC Rust)
so that they are in the loop -- context at:

    https://lore.kernel.org/rust-for-linux/20251204111124.GJ2528459@noisy.p=
rogramming.kicks-ass.net/

Cheers,
Miguel
