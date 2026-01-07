Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EFFCFDB24
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 13:35:43 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4DB10E5AF;
	Wed,  7 Jan 2026 12:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="bPHmS0my";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D077C44CA9;
	Wed,  7 Jan 2026 12:27:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767788845;
 b=id4XY/zvRLw6ack38MWFLFDLkxRximrf9budJvBODW5CLs/jM+ypUIJEnOaHrwMqvmNqN
 dfxCo0w5k3/iGY8XDiPxOmdveyKOXr6twQFQHie8x3C/EGBCOqPKfjSfh+kB0RCAbytfa5m
 XbjDOmxzMHLhI281UpBiz+7iVj6oxE65X+niMNRvvTU8Y59ClRVrSbO2StKU+a5Rq+PjdUl
 JacRSM+m4ELr4qI8+xniHup9ryhKCQSxVEQ2EcCpu6t8neiERxkP7+EYfoUEzEghdSkQkt5
 tKXGGRRvpAGLSMt4uNvMUkXi7igzpqSEHXcQEyflMBNMaRJ2oVNA/m0q1TQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767788845; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BHE+uM9pFMpvKUfJm0PMn7/MMiQJxjBUC4G6rc0+7ag=;
 b=Cx5ZW31PbPCZoSL7D9YQfSDAmVE0BgM6mQA2OxMw1bWZVz1PV+1R7+gsJeQZzmCpI5Sbq
 L5sBOKxTHV7jJP8rlePZ3nBWF16UxoGlZ9b2dHr+1IB/WCxJiYgVHhX60RygmbnTvQNfG2c
 xb8Hdsf/UctqKeQzoOlOXXbluVJbcIk6CehrqTVgE6FlAyOPgV5YwDtzVQ7BidiJgbb1mYh
 61BIJlL3/JAoKk3mP0RPmwUCt8LmiKGzNUpE71xVwbvPBMHCB8eX5LFuIdmXLnI+xZttsVZ
 MkyEgb+VlBlOXhn9YN30VbnJINxYdK/g6lBmxs8iOIMWo4tqpXp+ASTRYbiw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=infradead.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=infradead.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 095C344BB6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:27:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7A910E5A9
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BHE+uM9pFMpvKUfJm0PMn7/MMiQJxjBUC4G6rc0+7ag=; b=bPHmS0my5zMc0KSgtrhRkA+vTW
	z8Eu7Wmq0eIbQNU2yC3YNgs0VuCTEbqJENgYB5FVcWwB5xwARLzeYZH94XMypln1xuFyKtHAZOdRz
	U4DAYDjYtqvbV6j0Sec+25E7rEGo/SUgkLRmhxcbMCyZb7AjHJlcusIr4Tk92i0yg492BC81/Tesj
	AiTOKmQi0EGinvOrsYZFIEQncVw27tFLtGb7tp0dfjEkGXjAU6UBVFcLbi0Zl0Y6qIsUU8erEvD9x
	f6nDRT3WQSJ3x2tfxW7/ueyOM5M6w23aN2hHLiS+8REmD7MykBJLvthi0BeLLp1Z7md5pKs0S/pSe
	IG6ePcKQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSl8-0000000BKHb-0vmp;
	Wed, 07 Jan 2026 12:35:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1B43E30057E; Wed, 07 Jan 2026 13:35:29 +0100 (CET)
Date: Wed, 7 Jan 2026 13:35:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
Message-ID: <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
Message-ID-Hash: T7DLENSW4FGIAIVK7YXNOEMHEJQI745R
X-Message-ID-Hash: T7DLENSW4FGIAIVK7YXNOEMHEJQI745R
X-MailFrom: peterz@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
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
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T7DLENSW4FGIAIVK7YXNOEMHEJQI745R/>
Archived-At: 
 <https://lore.freedesktop.org/20260107123528.GF2393663@noisy.programming.kicks-ass.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
> Hi Alice,
> 
> Alice Ryhl <aliceryhl@google.com> writes:
> 
> > Currently the only way for Rust code to call a static inline function is
> > to go through a helper in rust/helpers/. This introduces performance
> > costs due to additional function calls and also clutters backtraces and
> > flame graphs with helper symbols.
> >
> > To get rid of these helper symbols, provide functionality to inline
> > helpers into Rust using llvm-link. This option complements full LTO, by
> > being much cheaper and avoiding incompatibility with BTF.
> >
> > I ran a microbenchmark showing the benefit of this. All the benchmark
> > does is call refcount_inc() in a loop. This was chosen since refcounting
> > is quite hot in Binder. The results are that Rust spends 6.35 ns per
> > call vs 5.73 ns per call in C. When enabling this option, the two
> > languages become equally fast, and disassembly confirms the exact same
> > machine code is used (in particular there is no call to
> > rust_helper_refcount_inc). Benchmarking Binder also results in an
> > improvement from this change.
> >
> > This patch is complementary to:
> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> I get the following modpost errors when building with this applied on top
> of v6.19-rc4:
> 
> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!

Looks like it used the wrong static_call_mod() version, was MODULE
defined?
