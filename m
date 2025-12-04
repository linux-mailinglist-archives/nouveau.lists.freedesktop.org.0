Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB0CA3A1E
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 13:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3E10E938;
	Thu,  4 Dec 2025 12:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="GplumZ8R";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4429510E938
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=89lu85i9iy0uktaUJpKiLn2xYKgVihXHfm6nPHuJVes=; b=GplumZ8RG+7r6/RPRCpIzWalST
 NTK1VlmdgSv0o+Os8U5TzCte9QhrImE8ky577kp1+pdEzf2iGrChGjDqxoyy/0vpTHDXW6R358Y9v
 4s9he+SA95cAcvXPvfP0YBsWkdxh0OLAIa4ikICD1C0FM1/6YmeS3FnRMnDkvQ903kDIFoZLEjGcp
 critL25nfa75jdtZxsYk6dpxMjznn1ANNnAC9Ogdkx8FUpBItwRRjQD0bFgXGIIjXqqlNXTcUgBjk
 Ky9P+0Q88jUy3RAcc358iN4ZHT3zQHEAuAbNqWod1N2S9oE+SwhJGOJtsxAOvpKdBk3IC30t+MUo2
 ndsqrLVA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vR8bz-00000004BHZ-3Shg; Thu, 04 Dec 2025 12:39:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id C5A3D3004F8; Thu, 04 Dec 2025 13:39:06 +0100 (CET)
Date: Thu, 4 Dec 2025 13:39:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Antoni Boucher <bouanto@zoho.com>,
 Emilio Cobos =?iso-8859-1?Q?=C1lvarez?= <emilio@crisal.io>,
 Arthur Cohen <arthur.cohen@embecosm.com>,
 Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
Message-ID: <20251204123906.GL2528459@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
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

On Thu, Dec 04, 2025 at 12:57:31PM +0100, Miguel Ojeda wrote:
> On Thu, Dec 4, 2025 at 12:11 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Right. Earlier I also proposed using libclang to parse the C header and
> > inject that. This might be a little simpler, in that..
> 
> Yeah, that would be closer to the `bindgen` route in that `libclang`
> gets already involved.
> 
> > ... if you build rustc against libclang they are necessarily from the
> > same LLVM build.
> 
> So currently there are 3 "LLVMs" that get involved:
> 
>   - The one Clang uses (in LLVM=1 builds).

Well, being on Debian, I'm more likely to be using LLVM=-22 (or whatever
actual version is required, 22 just being the latest shipped by Debian
at this point in time).

>   - The one `rustc` uses (the LLVM backend).
>   - The one `bindgen` uses (via libclang).

These are not necessarily the same? That is, is not bindgen part of the
rustc project and so would be built against the same LLVM?

> If that is all done within `rustc` (so no `bindgen`), then there may
> still be `rustc` vs. Clang mismatches, which are harder to resolve in
> the Rust side at least (it is easier to pick another Clang version to
> match).
> 
> For those using builds from distros, that shouldn't be a problem.
> Others using external `rustc` builds, e.g. from `rustup` (e.g. for
> testing different Rust versions) it would be harder.

Make rust part of LLVM and get them all built and distributed
together... such that LLVM=-23 will get me a coherent set of tools.

/me runs like crazeh ;-)

> There is also the question about GCC. A deeper integration into
> `rustc` would ideally need to have a way (perhaps depending on the
> backend picked?) to support GCC builds properly (to read the header
> and flags as expected, as you mention).

Right, so the backend that spits out C could obviously just pass through
any C headers. But otherwise, inlining C headers (and inline functions)
would be something that is independent of the C files. At the end of the
day all that really matters is the architecture C ABI.

That is, if rustc inlines a C function from a header, it doesn't matter
it used libclang to do so, even if the C files are then compiled with
GCC.

> And finally there is the question of what GCC Rust would do in such a
> case. Things have substantially changed on the GCC Rust in the last
> years, and they are now closer to build the kernel, thus I think their
> side of things is getting important to consider too.
> 
> Cc'ing Emilio (`bindgen`), Antoni (GCC backend) and Arthur (GCC Rust)
> so that they are in the loop -- context at:

Right, so clearly GCC has the capability to parse C headers :-) So I
would imagine their Rust front-end would be able to hand off C headers
and get back IR much like LLVM based projects can using libclang.


