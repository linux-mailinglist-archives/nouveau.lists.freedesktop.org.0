Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DBCA3651
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 12:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670D610E96B;
	Thu,  4 Dec 2025 11:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="pSckmItV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18CC10E964
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Vs7IhsUdSawXMOrWf5f71JxGpFUjZulrktZ1Qm8Q2v8=; b=pSckmItVUmdbVyusV0O0TfiwUY
 WLEioelO4DKGDd2BeLrPn03kKXhorOAL18yBqgatV/WrvupIb+SeLl/jVYIf7YyVn9tdpumdAf3XO
 v1L3ZKwMUYsApXPAEl7saGJq0Uc6SoSCq8tXizZ/VE3MZ9qLaeWPqwe0q8bSeaXVgeDzjgqUBnIDF
 L+w02J8EK0BsOFt+Ja1MizLg+TbFRyqe+mliXx4e2jbDE/aAi5xpFI0lsf81zE0cBkQg7y4zrKh89
 MQCsixAsQO4lW6rgp10bnayICypIt2TtsY6rNnrhfvd0ppat9BBV1D7K62OI3cP6vRmwXWjnpf74h
 RtUugM5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vR7F7-000000045pY-0kUI; Thu, 04 Dec 2025 11:11:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5415B3004B8; Thu, 04 Dec 2025 12:11:24 +0100 (CET)
Date: Thu, 4 Dec 2025 12:11:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
Message-ID: <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTFhFXCqvy7nmDOp@google.com>
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

On Thu, Dec 04, 2025 at 10:23:17AM +0000, Alice Ryhl wrote:

> > The other day [*] I proposed extending Rust such that it would be able
> > to consume a clang precompiled header directly, this would allow doing
> > away with most of all this. No more helpers and no more bindgen.
> > 
> > Would that not be a much saner approach to all this?
> > 
> > [*] https://lkml.kernel.org/r/20251124163315.GL4068168@noisy.programming.kicks-ass.net
> 
> I have actually discussed similar ideas in the past with Josh Triplett,
> so you are not the only one who thinks it is a good idea. Unfortunately,
> the road to get there is long.

Right. Earlier I also proposed using libclang to parse the C header and
inject that. This might be a little simpler, in that..

> Another option to get rid of the helpers is that bindgen is working on a
> --wrap-static-fns flag, which would generate the helpers for us.
> However, that route would still require this patch for them to be
> inlined.
> 
> One detail that makes the precompiled clang header really tricky is
> that IMO we should not require RUSTC_CLANG_LLVM_COMPATIBLE for the
> build. With bindgen, you just need bindgen and clang to match LLVMs.
> That's easy since bindgen loads a dylib from your clang install. But if
> you build this logic into rustc, then you need to be really careful to
> get rustc and clang from the same source, and that same source must use
> the same LLVM to build both.

... if you build rustc against libclang they are necessarily from the
same LLVM build.

But that might be more tricky in that you might need ways to specify C
specific build flags.

Anyway, good to know people are in fact pondering this, because IMO the
whole interoperability thing with C is quite terrible.
