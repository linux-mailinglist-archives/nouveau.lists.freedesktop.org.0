Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA9ECA1ACE
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 22:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6335C10E053;
	Wed,  3 Dec 2025 21:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zd86bIpv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6914510E053
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 21:26:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 79BB360125;
 Wed,  3 Dec 2025 21:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5D0C4CEF5;
 Wed,  3 Dec 2025 21:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764797166;
 bh=GFgAqj8UfGyBUyXfv+53BPOejR4vlRFgXnL4TObOzNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zd86bIpvg86iAEPANnDmH3QLfW8yzPG0kdsDWe9N2/EYvP4E4L9o550SSI8Yv4LVZ
 URMQb7wPkrwy3laoLMkOWv9kZRBo6Y6BMGYa1zv/UOiYIVd1BsnWue8Z1t9ELX7Jve
 6i57FY+s0dGa6aljNBsNu9O6zTwIzP+xAhmeuUtOYebVtJKIiCI5TmZbU3HciuuTbq
 3UT5mzV9hDBwXBm5TipT1YTZHmVTV25YbGoONGYQG43tNFbqqBdZ7TDqbUQlxvv7+L
 O2McGBanr21d+vpA/GHY1azbF8OM4IyeLD71qJhNjGEEKRMZVCNJVT0wfcoaUBZnmc
 sCIvRJ6Q37TLw==
Date: Wed, 3 Dec 2025 14:25:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <20251203212558.GB3060476@ax162>
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

Hi Alice,

On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
...
> diff --git a/Makefile b/Makefile
> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)

Please keep the binutils alphabetized (i.e, put LLVM_LINK between AR and
NM).

Other than that, this seems fine from a Kbuild perspective (but I did
not look too hard).

>  else
>  CC		= $(CROSS_COMPILE)gcc
>  LD		= $(CROSS_COMPILE)ld
> @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP := 1
>  export CLIPPY_CONF_DIR := $(srctree)
>  
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd12dfd99d59f5080 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
>  
>  	  If unsure, say N.
>  
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    depends on EXPERT
> +    help
> +        Links C helpers into Rust crates through LLVM IR.
> +
> +        If this option is enabled, instead of generating object files directly,
> +        rustc is asked to produce LLVM IR, which is then linked together with
> +        the LLVM IR of C helpers, before object file is generated.
> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +

I am just curious, why would someone want (or not) to do this? This help
text does not really indicate the point of the option, just what it
does. Is it just the standard tradeoffs with inlining (potential
improvements in performance due to better optimization opportunities
versus text size increase and icache pressure) or something else?

Cheers,
Nathan
