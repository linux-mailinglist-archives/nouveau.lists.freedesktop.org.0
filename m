Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5526CA3B45
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 14:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B2C10E954;
	Thu,  4 Dec 2025 13:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WSCYtdvk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7C710E954
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 13:03:37 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4775e00b16fso6158495e9.2
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 05:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764853416; x=1765458216;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=XHv3hl5kxLsYbFyLkQO+405gPeY3rXV12cSRgU/67FU=;
 b=WSCYtdvkaGoISc8l8tibX31/9Fi3yAYHAClHP2qb766KnZvby/2JUm8voLP2gXw9YS
 E1wGZlpC9NQG536ib2nrnv6m5rM/Bmw1Cx02p7iTH9ajZ5a9pj5zJOP4bkCqYNaZ7KYD
 s5tQGhKSP2bvAjfjLSzWd++4aMK/fH+4NwfAxrLolCoPL6NB3foHLaa40aq8EY79C3Wx
 LIkaXNOjCKOLSExxjOJwexfzT25ceNlB5FB1+5UkpvQDTkm6sZucBueTARdxEDq4fQ4j
 raBKQt/eVzR8A9VWRCl0P2TY9jiyU0o06MLXGDaN+GtKgOFNLrMbElCEZbuawxI+HyDa
 4MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764853416; x=1765458216;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XHv3hl5kxLsYbFyLkQO+405gPeY3rXV12cSRgU/67FU=;
 b=CLPuPbEmKOorA1Ml0ub92aKGe4gR3NVJAofx4B3D+9AVvo0IEt0uRXWeprv0JVWYYh
 GCC3ayHhfZUXZ1gdhGOZ8GdOY3ZTNJEjwCuuIq5ZGvE7crdT+D9OdG7+9+AJFEFDTwRT
 P7Bh2KGTwPd3+SR5Kyhf7RSOrtvzPfQLGUyUuD1QF1ITz/lV5wblJDL9q02ikuo1B+iw
 zdJOYMVHDWfwTClDXGml7kfXU034miYM4+68L1CRJFCiULreDGIOCEqBrQRMomigetgA
 he0y4STDlBQCy/UWJO05cchFOWlZn7VNsl8CbCzPM9bTHtI3pWRzh0hAUQnVGOO63wSR
 s4pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyWoIPFqBYya8ZMNz0o5wDhQQzWKMiMyZ3cIksZICvra54ZwG3LUhDQ+6O1tCuYIzY2kdlKDfC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx62mgHMTzckbv36ZMpdVxJppgZ5gxmGWtOgmMuL2rmdKGlGxRA
 pSEuH9vuEV0rXzkUZsQg3mvoO6d+Nl4f3WUptRAlER75TNlCL8jSYWPBiy6aLOAkKwhnPSXOC3f
 Bc4rr9a76pktanALHwQ==
X-Google-Smtp-Source: AGHT+IHesTuadwDk2buktyr5KdT759hnUgQEo1wC+McdN7/pwalBTRVnkgrSBeIn+Q+0wMXJFuvSYefcIW+twrM=
X-Received: from wmlu6.prod.google.com ([2002:a05:600c:2106:b0:477:5c35:1b95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5246:b0:477:641a:1402 with SMTP id
 5b1f17b1804b1-4792f244c5fmr28025045e9.4.1764853415686; 
 Thu, 04 Dec 2025 05:03:35 -0800 (PST)
Date: Thu, 4 Dec 2025 13:03:34 +0000
In-Reply-To: <20251204123906.GL2528459@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
 <20251204123906.GL2528459@noisy.programming.kicks-ass.net>
Message-ID: <aTGGpsbIYm1tXMDY@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Antoni Boucher <bouanto@zoho.com>, 
 "Emilio Cobos =?utf-8?Q?=C3=81lvarez?=" <emilio@crisal.io>,
 Arthur Cohen <arthur.cohen@embecosm.com>, 
 Gary Guo <gary@garyguo.net>, Josh Triplett <josh@joshtriplett.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Dec 04, 2025 at 01:39:06PM +0100, Peter Zijlstra wrote:
> On Thu, Dec 04, 2025 at 12:57:31PM +0100, Miguel Ojeda wrote:
> > On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > Right. Earlier I also proposed using libclang to parse the C header a=
nd
> > > inject that. This might be a little simpler, in that..
> >=20
> > Yeah, that would be closer to the `bindgen` route in that `libclang`
> > gets already involved.
> >=20
> > > ... if you build rustc against libclang they are necessarily from the
> > > same LLVM build.
> >=20
> > So currently there are 3 "LLVMs" that get involved:
> >=20
> >   - The one Clang uses (in LLVM=3D1 builds).
>=20
> Well, being on Debian, I'm more likely to be using LLVM=3D-22 (or whateve=
r
> actual version is required, 22 just being the latest shipped by Debian
> at this point in time).
>=20
> >   - The one `rustc` uses (the LLVM backend).
> >   - The one `bindgen` uses (via libclang).
>=20
> These are not necessarily the same? That is, is not bindgen part of the
> rustc project and so would be built against the same LLVM?

Rustc and bindgen are both part of the Rust project, but they're two
different repos:
https://github.com/rust-lang/rust
https://github.com/rust-lang/rust-bindgen

Generally you need to ensure that bindgen matches clang. This ensures
that bindgen and clang agree on the interpretation of C headers.

> > If that is all done within `rustc` (so no `bindgen`), then there may
> > still be `rustc` vs. Clang mismatches, which are harder to resolve in
> > the Rust side at least (it is easier to pick another Clang version to
> > match).
> >=20
> > For those using builds from distros, that shouldn't be a problem.
> > Others using external `rustc` builds, e.g. from `rustup` (e.g. for
> > testing different Rust versions) it would be harder.
>=20
> Make rust part of LLVM and get them all built and distributed
> together... such that LLVM=3D-23 will get me a coherent set of tools.
>=20
> /me runs like crazeh ;-)

Maybe clang itself should have an option to emit Rust headers, taking
over the role of bindgen?

/me runs like crazeh ;-)

Alice
