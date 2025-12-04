Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B4CA3106
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 10:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBCF10E8FD;
	Thu,  4 Dec 2025 09:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NsnGaEDV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A3410E8FD
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 09:46:05 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-64095177aedso972033a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 04 Dec 2025 01:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764841564; x=1765446364;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Y+LEByl2j3nWQKuuz9R99dq4dapViIO+66bH6orc1c=;
 b=NsnGaEDVpyGGzYzRADkdBK9Sx2CXbfPcjZoG24Zy3OtWcf1TbxIKP4U9GZ3ITUzzpg
 Zq9+S29GDCPe0fkwnkaBk33kkjzZ8D3HU/v6EyVwhmH7tn6jHO2GEpAMXH5/xSYCklwX
 hEfbClOV/AMwAW1mjTCMYtxEEvYjgoktRziRqFZMRZkZye1sd13QuRcpO4TrQz8nUjzJ
 e/UjfGcN9NcTYbNlXXgBNvxq6Q4T/uzL8rhnPQQaRez74sC0RjFuelSgLd5NGNs44eOX
 VBwTkI8fFPM0ICqdvT3W4SIJXUjVRi9LOw/yiNA658qTyw7m5fsRd63Tm3smsa7N1lnQ
 rBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764841564; x=1765446364;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Y+LEByl2j3nWQKuuz9R99dq4dapViIO+66bH6orc1c=;
 b=W2Xueqt/nhzNuExos3P6M8j0MCwhvVLAdsWU5yEDDJKdbz5dcN8yW1p7OtPl0CWPzy
 4rsC7lsqiwTSnLCHHkGNQ0+9Ymuw2BKrftFtVW0Ygj9YY68YQRK52neS+Ty+nolDovw2
 C9jjy0Vs1Zr3OUH42RahzcXs1fGBekcZMIAQQINlrplCSKnmCYDgc4caibiTxu/hXyxQ
 5kHxCps5ZkRY1lM6buvJE9MokBBnSwosSJOUaiuQeBp+XBBdPOZuReyPVUThDJsiTvbU
 xVWBG5g2VHwXRoywfN0jA7KpLweBCYbMDdI1SXPdT4VnBnCZi19yBnG/QSqNHqaA08ga
 t7eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+6FpYks3l/OO5eQ5B8GZDJnPRe8et3fNnUW/7jsMuhr5AsPu9tlpH14NosS6RVdEZF/NHBJlY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRpDCeFOyPVRDOLYBA8saL6GsATMpwBKCQzfus2IwUEBN+5nd9
 lxwfV3mtkIwrltLy70cIjR6lIeS8mw1P1Is1nEjp50VOc5l5MHZ9pt+vWrpW7u/nwX+GIPWTvpG
 rjhaX+EU8WFDkNotdCA==
X-Google-Smtp-Source: AGHT+IH+B9WzKRmSWzOuHrGLt1JUxDjhE9BQol+oE79eSw4Io68p4o5P8fUOkglayWG/HVrXi6i/Vno1TKnYch4=
X-Received: from edbig1.prod.google.com ([2002:a05:6402:4581:b0:62f:24aa:896a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1e94:b0:640:c640:98c5 with SMTP id
 4fb4d7f45d1cf-6479c4c441bmr5333397a12.34.1764841564163; 
 Thu, 04 Dec 2025 01:46:04 -0800 (PST)
Date: Thu, 4 Dec 2025 09:46:03 +0000
In-Reply-To: <20251203212558.GB3060476@ax162>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251203212558.GB3060476@ax162>
Message-ID: <aTFYWyUE-ln5KrsX@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
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

On Wed, Dec 03, 2025 at 02:25:58PM -0700, Nathan Chancellor wrote:
> Hi Alice,
> 
> On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
> ...
> > diff --git a/Makefile b/Makefile
> > index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
> >  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
> >  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
> >  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> > +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> > +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
> 
> Please keep the binutils alphabetized (i.e, put LLVM_LINK between AR and
> NM).
> 
> Other than that, this seems fine from a Kbuild perspective (but I did
> not look too hard).

Sure will reorder.

> >  else
> >  CC		= $(CROSS_COMPILE)gcc
> >  LD		= $(CROSS_COMPILE)ld
> > @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP := 1
> >  export CLIPPY_CONF_DIR := $(srctree)
> >  
> >  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> > -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
> > +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
> >  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
> >  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> >  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd12dfd99d59f5080 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
> >  
> >  	  If unsure, say N.
> >  
> > +config RUST_INLINE_HELPERS
> > +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> > +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> > +    depends on EXPERT
> > +    help
> > +        Links C helpers into Rust crates through LLVM IR.
> > +
> > +        If this option is enabled, instead of generating object files directly,
> > +        rustc is asked to produce LLVM IR, which is then linked together with
> > +        the LLVM IR of C helpers, before object file is generated.
> > +
> > +        This requires a matching LLVM version for Clang and rustc.
> > +
> > +        If unsure, say N.
> > +
> 
> I am just curious, why would someone want (or not) to do this? This help
> text does not really indicate the point of the option, just what it
> does. Is it just the standard tradeoffs with inlining (potential
> improvements in performance due to better optimization opportunities
> versus text size increase and icache pressure) or something else?

Basically you probably want this on if you can enable it, but
RUSTC_CLANG_LLVM_COMPATIBLE is actually a pretty harsh requirement. If
you just install rustc and clang, it's likely they wont be sufficiently
compatible for LTO to take place.

I'll expand on this in the help text.

Alice
