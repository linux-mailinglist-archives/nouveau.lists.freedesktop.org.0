Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608FACFDA25
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 13:24:01 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 325C310E5A9;
	Wed,  7 Jan 2026 12:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jsilMsD9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD0E244CA6;
	Wed,  7 Jan 2026 12:15:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767788144;
 b=Lg/RwB3hDW3P7uuJIqyvyhPju1kuF8GwxHigVCPIfRXx39zS+Zq6H6z/NV3nHf7Jmw7Im
 vUBHpQoipdZjscdyXESVI7WyYVv+WEVkaVW9DhRISNaI/s3kKDOxR/bEzqLBJBG29Lp7p2y
 qVyR1TPU0s1pjYySGOCsDnf6F1xAVBIB0wTbC3RavOgd0EWIKxFW+fjdMbmM7UjAOAhgVVp
 j/rky2S8xY7FtVOYY0VillQ0UXBic9DjHva6eXWzbePrEEsl0x64SW2G9YzTgWPVl8/k5uk
 6oiLhUCXbaCL1TKK+sQ47++yfLFDS3PWSjke35s/fvMyF2H2l+o0Z8+2wILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767788144; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mZtM1KRXrNZPIjs0BP4nXfJn9/N+qtrTbb5tiAYIPzg=;
 b=k1JeMwQ9jwlYkvohqIB0CQYimazOyAQCt0IBfOjyol9nFMbdIZPoA/TpXOpOM/PD5Wkzj
 D/EG2/VAsYrLVZHv6uAgY5Bs5MeVODI/Xn9813eQ4b0bwaMiSP+BWhzLDwvqQ5gdLJH2j4M
 bliz1LooBFLcG1+d//t7drHmmGAZE5EAVztXYffNq1dsRxWLf46Mp6VB+Mah1D2AY125GYa
 5GJ0rSZesE0TXk4/hKouVyKFNoJX/qGKRsFxS/XLyixub3NwIZJvE+RRB/w2WLGVKfNSsiL
 v8IYWGM120hTIpeusC62Y3I/OPBtXAtoQJCFjwpzNb4OwFeAyf0tvuUV1kpg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3A18444C9C
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:15:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5972D10E5A6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:23:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33A9B43403;
	Wed,  7 Jan 2026 12:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0535EC16AAE;
	Wed,  7 Jan 2026 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788637;
	bh=mZtM1KRXrNZPIjs0BP4nXfJn9/N+qtrTbb5tiAYIPzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jsilMsD9MU5vYOo+CLDlCD4K1PG/wWHtloGE+yTehzPOpuQxbC4VkaA5SDbLGwG+8
	 NoGTAZRmkN3B/N39tcHxDRacYTzE26znGZWG6DK9P1a24yxnyGqNw0NGTEOhL1cCDn
	 dVkYCJTcJdvV3AnC31ROUCNjK4WzEK0Rk0A3pfxYacTnTIJob6V5LNMiBdaFubd085
	 h58fmGlG/jR4aWt0H5ONm3dEZ3oYNYGVyM2DPPqpSr3sUsMbKs8GEZ9tdE6s4vMFND
	 iGZ/LYsMAQDMLzqD2kCZmCnwKYXfvcW8VkBSm798XIEDL42GwbPYWgMt8mfXEV8FTI
	 M5SK7HdQJxaaw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Date: Wed, 07 Jan 2026 13:23:38 +0100
Message-ID: <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: GTQRM3H2N3WEQRMOEGWSZNHUTIYIKBXY
X-Message-ID-Hash: GTQRM3H2N3WEQRMOEGWSZNHUTIYIKBXY
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>,
 Matthew Maurer <mmaurer@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GTQRM3H2N3WEQRMOEGWSZNHUTIYIKBXY/>
Archived-At: 
 <https://lore.freedesktop.org/87y0m9har9.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Alice,

Alice Ryhl <aliceryhl@google.com> writes:

> Currently the only way for Rust code to call a static inline function is
> to go through a helper in rust/helpers/. This introduces performance
> costs due to additional function calls and also clutters backtraces and
> flame graphs with helper symbols.
>
> To get rid of these helper symbols, provide functionality to inline
> helpers into Rust using llvm-link. This option complements full LTO, by
> being much cheaper and avoiding incompatibility with BTF.
>
> I ran a microbenchmark showing the benefit of this. All the benchmark
> does is call refcount_inc() in a loop. This was chosen since refcounting
> is quite hot in Binder. The results are that Rust spends 6.35 ns per
> call vs 5.73 ns per call in C. When enabling this option, the two
> languages become equally fast, and disassembly confirms the exact same
> machine code is used (in particular there is no call to
> rust_helper_refcount_inc). Benchmarking Binder also results in an
> improvement from this change.
>
> This patch is complementary to:
> https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I get the following modpost errors when building with this applied on top
of v6.19-rc4:

ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!

I also applied the series adding the inline macro [1].


Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/rust-for-linux/20260105-define-rust-helper-v2-0-51da5f454a67@google.com/

