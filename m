Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE4FCA326E
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 11:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9F410E8F2;
	Thu,  4 Dec 2025 10:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="HaSW3im3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE0910E8F2
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WpEAcvMvK6YSRYCp4amZlv9jQN7IlgsqcQBRJ8YOgr8=; b=HaSW3im3y77oMAz/9WiXSDPHBD
 sL1kHOVefSAV3h6BULyzzgRyOpqr6hQlY2QD0gwMkT4fBaaJgWyGZLHrV1HrJjmXo3AMrU1aMVsaB
 3pCJJq2gF2W/1HUJ47/p6uPa86ILWXSNmCj4tGuhcHpPeVL7g4ZsPmZDkIP1GEb7gwXSoJbqZCQM5
 e4Ctaw9iDlvsJpz4CU+JRk6D/k52ydDl/75OOjRbcneH09e9L8m7FWOVvmwD27aN/DIG0xQp8r7CS
 XSrjM42BjKvyoG6bdhwQNpzKxzN/SHQqMdeWKG7nbBTE1nqnSUg3jbQXh2UP3yTH6hEb3+pXRvzIL
 1vUul+Ng==;
Received: from
 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vR6FD-000000041rL-1oUc; Thu, 04 Dec 2025 10:07:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id DA8A03004B8; Thu, 04 Dec 2025 11:07:25 +0100 (CET)
Date: Thu, 4 Dec 2025 11:07:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
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
Message-ID: <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
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

On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> allow C helpers (which were created to allow Rust to call into
> inline/macro C functions without having to re-implement the logic in
> Rust) to be inlined into Rust crates without performing global LTO.
> 
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked with --internalize to combine the helper bitcode
>   with the crate bitcode. This step is similar to LTO, but this is much
>   faster since it only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
> 
> The --internalize flag tells llvm-link to treat all symbols in
> helpers.bc using `internal` linkage. This matches the behavior of
> `clang` on `static inline` functions, and avoids exporting the symbol
> from the object file.
> 
> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> Disallow BTF generation with Rust + LTO") for details.
> 
> We have an intended triple mismatch of `aarch64-unknown-none` vs
> `aarch64-unknown-linux-gnu`, so we suppress the warning.

So if I understand this correctly, it will consume the helpers twice,
once for bindgen to generate the rust ffi glue, and then a second time
to 'compile' to IR.

Then the IR is 'linked' into the rust translation units allowing the
actual inlining to take place once 'LTO' runs.

And while this works, this still has the downside of requiring those
rust helper files and using bindgen.

The other day [*] I proposed extending Rust such that it would be able
to consume a clang precompiled header directly, this would allow doing
away with most of all this. No more helpers and no more bindgen.

Would that not be a much saner approach to all this?


[*] https://lkml.kernel.org/r/20251124163315.GL4068168@noisy.programming.kicks-ass.net
