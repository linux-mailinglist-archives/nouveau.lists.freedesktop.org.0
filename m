Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0F3CA4018
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 15:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A3510E1E1;
	Thu,  4 Dec 2025 14:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="YwrF7ndD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D26D10E1E1
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 14:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=fFnv22fcQB5aFcCjIbe5QaQi5Ay10FFsnk0wQwnxL/U=; b=YwrF7ndD6dZYtSnBju5djLf3B3
 9BwkHu8OrlzXfyMe9mncsj4GToO/8tqG0JtcRmUtUn95c3+ke4l7EthXBRpW1hDCA4txDm0KfBxlr
 uac/gVsFQHXWTT+0ldDi39DQYGDL7a09ckPOmCBRint6yxH5rrJeIDc88cwxVabg2dXtL8kn2nMt+
 vgvICwVvQw2tHBO07bBT954nsePfsujxuOldWJA2g2bIZA7a2me0JT2k5VO8kTeZWtLVle+Ebt+MS
 Q7bCGN4x5drE0np+zjvUTukF6CuC4mr5TlM7VO2qJC14ZL3jBLYAn5c9sIqH8WtCmYeUUz4Lh9uCL
 XJbsVcSw==;
Received: from
 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vRAJ6-00000004IZt-18oA; Thu, 04 Dec 2025 14:27:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id EF8FC3030B1; Thu, 04 Dec 2025 15:27:42 +0100 (CET)
Date: Thu, 4 Dec 2025 15:27:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Emilio Cobos =?iso-8859-1?Q?=C1lvarez?= <emilio@crisal.io>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Antoni Boucher <bouanto@zoho.com>,
 Arthur Cohen <arthur.cohen@embecosm.com>,
 Gary Guo <gary@garyguo.net>, Josh Triplett <josh@joshtriplett.org>,
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
Message-ID: <20251204142742.GM2528459@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
 <dd5856a8-e120-4884-8828-9d0c9edc60f0@crisal.io>
 <aTGJdlwMRxGg2iZ1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTGJdlwMRxGg2iZ1@google.com>
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

On Thu, Dec 04, 2025 at 01:15:34PM +0000, Alice Ryhl wrote:
> On Thu, Dec 04, 2025 at 01:49:28PM +0100, Emilio Cobos Álvarez wrote:
> > On 12/4/25 12:57 PM, Miguel Ojeda wrote:
> > > On Thu, Dec 4, 2025 at 12:11 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > > > 
> > > > Right. Earlier I also proposed using libclang to parse the C header and
> > > > inject that. This might be a little simpler, in that..
> > > 
> > > Yeah, that would be closer to the `bindgen` route in that `libclang`
> > > gets already involved.
> > 
> > Yeah, so... there are existing tools (c2rust [0] being the actively
> > maintained one IIUC) that in theory could do something like that (translate
> > the bodies of the functions from C to Rust so that rustc could consume them
> > directly rather than via LLVM LTO).
> > 
> > I think the intended use case is more "translate a whole C project into
> > rust", but it could be interesting to test how well / poorly it performs
> > with the kernel helpers / with a single header translated to Rust.
> > 
> > I personally haven't tried it because for work I need to deal with C++,
> > which means that automatic translation to Rust is a lot harder / probably
> > impossible in general. So for Firefox we end up relying on bindgen +
> > cross-language LTO for this kind of thing, and it works well for us.
> > 
> > If I'm understanding correctly, it seems the kernel needs this extra bit of
> > help (__always_inline) to push LLVM to inline C functions into rust, which
> > is a bit unfortunate... But this approach seems sensible to me, for now at
> > least.
> > 
> > FWIW Bindgen recently gained an option to generate inline functions [1],
> > which could help avoid at least the bindgen ifdef in the patch series?
> > 
> > Anyways, it might be interesting to give c2rust a go on the kernel helpers
> > if nobody has done so, and see how well / poorly it works in practice? Of
> > course probably introducing a new dependency would be kind of a pain, but
> > could be a good data point for pushing into adding something like it built
> > into rustc...
> 
> I already tried c2rust as an alternative to this patch. It works okay
> for many functions, but it's missing support for some features such as
> asm goto, though this is fixable. But a larger issue is that some things
> simply do not translate to Rust right now. For example:
> 
> * Atomics use the Ir operand.
> * static_branch uses the i operand.
> 
> neither of which translate directly to Rust.

Right this. AFAIK Rust simply does not have feature parity with inline
asm. Them having picked a wildly different syntax for inline asm didn't
help either of course. But Rust is Rust, must have terrible syntax :-)
