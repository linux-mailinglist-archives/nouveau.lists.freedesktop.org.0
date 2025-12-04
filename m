Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73CCA3BFB
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 14:16:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F0510E958;
	Thu,  4 Dec 2025 13:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DG/ZpVQA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B9310E963
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 13:15:36 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-477bf8c1413so5772055e9.1
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 05:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764854135; x=1765458935;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=Wny4M191Yr6Td48Z53labtwrelyi+1dAudOVsu2AK4M=;
 b=DG/ZpVQAnt1FTbDP4OmCkrv6k4WiViMeJEMdponoiVY0t5v8hfm58xhOqmTwYVGi5t
 lyn8TRuK/bH0sf8OMWSUpSUB/Hzw29XyZ8ubS6SOm0QcfX4OfArZtBVwzYsQH2aAa9SI
 urwX4OvRbMP7FSVOPMkUduxD1WYqy56nBIqfS5krrwNJCpeakXqByNZpQbP3utSQFB2J
 CBglgGNwJN06B7rtlgBjCDbPTocAiC6Lt1fRLLJRXfC/NDm0EERlALm+gSSm2Mikmega
 IC8yaiv+pX50cquxf8LmeM5v8J2fV6aEladco5YQcEkL+eWSxiyg4lr5OqNslSbkUFzR
 W6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764854135; x=1765458935;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Wny4M191Yr6Td48Z53labtwrelyi+1dAudOVsu2AK4M=;
 b=GvBqoVKug4P0GhadgPVYMKk9IN8sZbi8WDCTnvwKjhUzxxgf5KOG0dFty9ftNBez1O
 4PJ5/izRIZcnrj8QPm2gQWMFkVTbGjRJxiHaCQSDgLW7cpb73oe37F7xZvTn0m1bQWHz
 nJWKry+0Ydn6KZqyZx2tZ41gCex9sdpPk5wBwoPrpH3hBuWUsBCb+KS2GO8nnOT1Adku
 ASUnpKFeGRnTSufcqLkW+663fFSMuhyEMBMtePCvI2lud+4Xo43WVBTaKfDLUjaqozcD
 zXaMsDtDTrrVB+rgq06LJ4FZq0FdotFF2Ijo2mjsO2jbfOwS4vy+XFeF0exr56xy6+VV
 j/VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMQQmmrzjBQdoGlsv+CroKwnaz3/R+vSTw6iCHftPwtTwBcT5P2wfqO/AppXQ+QQKFm/Xsqjp2@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5Dm6lEixikS1OLUzFa2+LecA4e2wXm/nNuCxRMdDLw1yR8QLH
 ofESV5gmBOoTKJQ9rNHiuNKhJ1KRBN+uHviWD47Sh4v5L3BRiDowsFBo1m0WQy/VFI8pNQRblWg
 Wb3vJM9GxjuuhRWjzow==
X-Google-Smtp-Source: AGHT+IHhq1jpZSgsrG7+u70UeMI118GpL4lyrcZgSJfzAV0BpquOo2d1tIrYUXW40rz39aPBfrTMkT06vKIZZ8M=
X-Received: from wmbjj12.prod.google.com
 ([2002:a05:600c:6a0c:b0:470:fd92:351d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e89:b0:477:55c9:c3ea with SMTP id
 5b1f17b1804b1-4792af485a4mr64437335e9.35.1764854135213; 
 Thu, 04 Dec 2025 05:15:35 -0800 (PST)
Date: Thu, 4 Dec 2025 13:15:34 +0000
In-Reply-To: <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
 <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io>
Message-ID: <aTGJdlwMRxGg2iZ1@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: "Emilio Cobos =?utf-8?Q?=C3=81lvarez?=" <emilio@crisal.io>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, 
 Antoni Boucher <bouanto@zoho.com>, Arthur Cohen <arthur.cohen@embecosm.com>, 
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

On Thu, Dec 04, 2025 at 01:49:28PM +0100, Emilio Cobos =C3=81lvarez wrote:
> On 12/4/25 12:57 PM, Miguel Ojeda wrote:
> > On Thu, Dec 4, 2025 at 12:11=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >=20
> > > Right. Earlier I also proposed using libclang to parse the C header a=
nd
> > > inject that. This might be a little simpler, in that..
> >=20
> > Yeah, that would be closer to the `bindgen` route in that `libclang`
> > gets already involved.
>=20
> Yeah, so... there are existing tools (c2rust [0] being the actively
> maintained one IIUC) that in theory could do something like that (transla=
te
> the bodies of the functions from C to Rust so that rustc could consume th=
em
> directly rather than via LLVM LTO).
>=20
> I think the intended use case is more "translate a whole C project into
> rust", but it could be interesting to test how well / poorly it performs
> with the kernel helpers / with a single header translated to Rust.
>=20
> I personally haven't tried it because for work I need to deal with C++,
> which means that automatic translation to Rust is a lot harder / probably
> impossible in general. So for Firefox we end up relying on bindgen +
> cross-language LTO for this kind of thing, and it works well for us.
>=20
> If I'm understanding correctly, it seems the kernel needs this extra bit =
of
> help (__always_inline) to push LLVM to inline C functions into rust, whic=
h
> is a bit unfortunate... But this approach seems sensible to me, for now a=
t
> least.
>=20
> FWIW Bindgen recently gained an option to generate inline functions [1],
> which could help avoid at least the bindgen ifdef in the patch series?
>=20
> Anyways, it might be interesting to give c2rust a go on the kernel helper=
s
> if nobody has done so, and see how well / poorly it works in practice? Of
> course probably introducing a new dependency would be kind of a pain, but
> could be a good data point for pushing into adding something like it buil=
t
> into rustc...

I already tried c2rust as an alternative to this patch. It works okay
for many functions, but it's missing support for some features such as
asm goto, though this is fixable. But a larger issue is that some things
simply do not translate to Rust right now. For example:

* Atomics use the Ir operand.
* static_branch uses the i operand.

neither of which translate directly to Rust.

Alice
