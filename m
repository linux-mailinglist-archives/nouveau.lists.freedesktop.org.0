Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D738CA3341
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 11:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9EB10E1CD;
	Thu,  4 Dec 2025 10:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AHuS/HT4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C1710E1CD
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 10:23:20 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-42b352355a1so884872f8f.1
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764843798; x=1765448598;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=EF1MlHpf4n5Q1St5clq56+r8fU1ZS9gsCdCeRZ6mpDg=;
 b=AHuS/HT4ecBECPrXVizC+A/E/CPIzCgt9k9XXlUn9xmXHC5/OLZjw8d8gLryuAgZSy
 IXhhJ0v7ki+i1h2L+ZhGePjRotbuxKdPv5lVWdx6RAfNl+wzbSrzs4NiYL9m9yKreZF1
 EqaZWUs+LCTcTn2K+/ZUrmlHw2GDAyXsB1k7COgfpJjEJi1QaISrZHfyXSfUhQhy8ivf
 QZe4A+tG4Gq124avBlidqC/vkRIMky9D6QayRnua/03hEhtqXV72t57QL7KTWlhIMbO4
 Mr3qCmmVIHseWr5umaZc2n7H35F3RHYIQ1pLKM3uoPfG16vCuBDc9ikKr1JLKSATPKgh
 1r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764843798; x=1765448598;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EF1MlHpf4n5Q1St5clq56+r8fU1ZS9gsCdCeRZ6mpDg=;
 b=La+WomA2LoGKMpraEeLiSPlYqzRT9BlYsmMF4udWb2UsXBEJ08GJ3SUjk5eMECDNdL
 nuvEAEWBQjKILc6Hx2HsYUB2p88toeBQP9VkWoMMGjEkWAipEUzaZ0AfGo6E2SwjBXOg
 m4Ewp4QMpfykgGQ2IbadQC2FdQh88/ab6P/UQC7K8oLtyNCR59/H0NhXN45llWySxsC9
 OQSGqXUjpwGRKbgT/nQLTv6eog4eH9cqPmppLp6UsUtMUZ5WngHNiw1SOZDhro+5dq3b
 WnU+MBaUqdF2/X+HzDsWIT3jhKQS2SP8v54mYM/5LOFaDNY/NdJzsBDpxTj8YnPMosez
 jbeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1WFqd8mIhP4Wc+9oEsgla3T4KXXoaHS7w2o81CbaeCoR7VqinCgWJRLZx935lQ3ePCqGkCKyK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbHtt1GYKZdpHZOTnKfWWd78RvDLA/vYZ+TwCfIZ1X1/eAMu9/
 tf0Euyd535QK+rsZGwxsYfPF+tehZJk+3Xjt84anW8KrKasI2jy4Zt0sUyjAst56crtoQzmD+p+
 SaEcSHFj2I4TweEWi6A==
X-Google-Smtp-Source: AGHT+IGiPJgDCk6zUebYl8jptLh9N24hkpO6kzd49VGJaKt6mNBrX4BGA0A2hAQXhvOeEcEPmbx50VOSkvAylEw=
X-Received: from wrmg8.prod.google.com ([2002:adf:e408:0:b0:42c:c2d6:28e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2f97:b0:477:9a61:fd06 with SMTP id
 5b1f17b1804b1-4792eb1a02emr19061445e9.8.1764843798611; 
 Thu, 04 Dec 2025 02:23:18 -0800 (PST)
Date: Thu, 4 Dec 2025 10:23:17 +0000
In-Reply-To: <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
Message-ID: <aTFhFXCqvy7nmDOp@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>,
 Josh Triplett <josh@joshtriplett.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
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

On Thu, Dec 04, 2025 at 11:07:25AM +0100, Peter Zijlstra wrote:
> On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
> > From: Gary Guo <gary@garyguo.net>
> > 
> > A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> > allow C helpers (which were created to allow Rust to call into
> > inline/macro C functions without having to re-implement the logic in
> > Rust) to be inlined into Rust crates without performing global LTO.
> > 
> > If the option is enabled, the following is performed:
> > * For helpers, instead of compiling them to an object file to be linked
> >   into vmlinux, they're compiled to LLVM IR.
> > * The LLVM IR is compiled to bitcode (This is step is not necessary, but
> >   is a performance optimisation to prevent LLVM from always have to
> >   reparse the same IR).
> > * When a Rust crate is compiled, instead of generating an object file, we
> >   ask LLVM bitcode to be generated.
> > * llvm-link is invoked with --internalize to combine the helper bitcode
> >   with the crate bitcode. This step is similar to LTO, but this is much
> >   faster since it only needs to inline the helpers.
> > * clang is invoked to turn the combined bitcode into a final object file.
> > 
> > The --internalize flag tells llvm-link to treat all symbols in
> > helpers.bc using `internal` linkage. This matches the behavior of
> > `clang` on `static inline` functions, and avoids exporting the symbol
> > from the object file.
> > 
> > To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> > the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> > Disallow BTF generation with Rust + LTO") for details.
> > 
> > We have an intended triple mismatch of `aarch64-unknown-none` vs
> > `aarch64-unknown-linux-gnu`, so we suppress the warning.
> 
> So if I understand this correctly, it will consume the helpers twice,
> once for bindgen to generate the rust ffi glue, and then a second time
> to 'compile' to IR.
> 
> Then the IR is 'linked' into the rust translation units allowing the
> actual inlining to take place once 'LTO' runs.
> 
> And while this works, this still has the downside of requiring those
> rust helper files and using bindgen.

That's right.

> The other day [*] I proposed extending Rust such that it would be able
> to consume a clang precompiled header directly, this would allow doing
> away with most of all this. No more helpers and no more bindgen.
> 
> Would that not be a much saner approach to all this?
> 
> [*] https://lkml.kernel.org/r/20251124163315.GL4068168@noisy.programming.kicks-ass.net

I have actually discussed similar ideas in the past with Josh Triplett,
so you are not the only one who thinks it is a good idea. Unfortunately,
the road to get there is long.

Another option to get rid of the helpers is that bindgen is working on a
--wrap-static-fns flag, which would generate the helpers for us.
However, that route would still require this patch for them to be
inlined.

One detail that makes the precompiled clang header really tricky is
that IMO we should not require RUSTC_CLANG_LLVM_COMPATIBLE for the
build. With bindgen, you just need bindgen and clang to match LLVMs.
That's easy since bindgen loads a dylib from your clang install. But if
you build this logic into rustc, then you need to be really careful to
get rustc and clang from the same source, and that same source must use
the same LLVM to build both.

Alice
