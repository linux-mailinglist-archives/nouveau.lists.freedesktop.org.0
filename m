Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92739CFDE28
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 14:18:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3B4110E5C8;
	Wed,  7 Jan 2026 13:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="b7ZiARls";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 83DEA44CAB;
	Wed,  7 Jan 2026 13:10:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767791418;
 b=KqedF34w1Mus1Us3jpLu1k4ASDryM/Fk1Jwlf637eep+m1LJHHnOtkmeuH+7gzivbmO5Y
 uZnpKCkCav7Ff4GGuGLfyUzL38GwqhFkvoavNO6LT6gjSvVqaStZDX6ATKosb5KzGa9xVdm
 c+l3n4MceqwDK63dyhVJb1NC98iF+V4R/eZbrX0fWMCmukhXlY40zpTUx1QnxZRCmFSw7FU
 z7CG3/syXsioqw3b+l6OU5isDuQObe+93RlgOambnedRmN/DH/o6Rl5dot5Ea2KNVWlnL+/
 0a4/VgD3gufDzOAWAb+WdFsiHoLz13evTlm0wcXA4t0gQT4AJ0VxIiUIpTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767791418; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ejt4fl24yJGg/IPMEl6Jv4QbwGGu9SxvkwuaJgTIHGU=;
 b=p2YCJI9sBJkdMwu+so0eSPnoYiE8f6BbWKCciiZ7+kbdilJKNkfJl3nEh7mXZlnpgtvh3
 O//b8S+ABylYVCQwrHUaIQKEIC34y+PPR/k/6Opejc5CKdBBsVxHNwErQ7bVkZDYWTZndAz
 oOME/Ne7OiEelqVPd8uUJ4hwSJSVbo5zEghL0krqbBJVyr/Yf4idShtxe8+OwK3DTX5JvNJ
 +8xdKYxNJxGRKyNOuqtAbNMAdfloOl+ZxkcQ7nVJQ3KgA04SS4s5TVpQdC8onlad5KIhbc4
 JYqOPf0c11n4BynaiEN7nwuemM06X3dyWD2KXBJ9alWUy2uSPJfHE2TXsO/g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 40BC344C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 13:10:15 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4634410E0FA
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ejt4fl24yJGg/IPMEl6Jv4QbwGGu9SxvkwuaJgTIHGU=; b=b7ZiARlsXX25ihUCbHGLFmeHdR
	trT2w4kGJe2ey5Dqhi0wkt8c5JQ2I1n6/+6raFF0v/sfQAOTyxcPASnmVgkIm0rPmi3ha6gZU1KyO
	imUU9sU1zgY6jfWzzVZxpU7k5Spiz4HrGK9jCVUYKOKOssBPBX2i35AFt2tq27VaaCJIL9n9q9a3Y
	V7V9La4+LPVZxQxZaTolRTOJlNJ6TfahCZNm4Cw9iT3251v64mUsk8/+kVEQ8+0XGbAf42WwORi3j
	sWGFexDVmSfPMrWJl781rZ4AvY2okDsgDJwwzn+q0MVqnFCYKYZbh4oqpBuDmKVeoucNv1YqYNkkt
	eVzl8k/w==;
Received: from
 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTQd-0000000DPqp-1SFY;
	Wed, 07 Jan 2026 13:18:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0DCA830057E; Wed, 07 Jan 2026 14:18:22 +0100 (CET)
Date: Wed, 7 Jan 2026 14:18:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
Message-ID: <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
 <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
Message-ID-Hash: 7YI534B5RYSIWGZN7SOWVL7ZL43IAER6
X-Message-ID-Hash: 7YI534B5RYSIWGZN7SOWVL7ZL43IAER6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7YI534B5RYSIWGZN7SOWVL7ZL43IAER6/>
Archived-At: 
 <https://lore.freedesktop.org/20260107131822.GD3707837@noisy.programming.kicks-ass.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 07, 2026 at 02:12:10PM +0100, Andreas Hindborg wrote:
> "Peter Zijlstra" <peterz@infradead.org> writes:
> 
> > On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
> >> Hi Alice,
> >>
> >> Alice Ryhl <aliceryhl@google.com> writes:
> >>
> >> > Currently the only way for Rust code to call a static inline function is
> >> > to go through a helper in rust/helpers/. This introduces performance
> >> > costs due to additional function calls and also clutters backtraces and
> >> > flame graphs with helper symbols.
> >> >
> >> > To get rid of these helper symbols, provide functionality to inline
> >> > helpers into Rust using llvm-link. This option complements full LTO, by
> >> > being much cheaper and avoiding incompatibility with BTF.
> >> >
> >> > I ran a microbenchmark showing the benefit of this. All the benchmark
> >> > does is call refcount_inc() in a loop. This was chosen since refcounting
> >> > is quite hot in Binder. The results are that Rust spends 6.35 ns per
> >> > call vs 5.73 ns per call in C. When enabling this option, the two
> >> > languages become equally fast, and disassembly confirms the exact same
> >> > machine code is used (in particular there is no call to
> >> > rust_helper_refcount_inc). Benchmarking Binder also results in an
> >> > improvement from this change.
> >> >
> >> > This patch is complementary to:
> >> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
> >> >
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >>
> >> I get the following modpost errors when building with this applied on top
> >> of v6.19-rc4:
> >>
> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!
> >
> > Looks like it used the wrong static_call_mod() version, was MODULE
> > defined?
> 
> CONFIG_MODULES=y, yes
> 
> I built without the patch first, then applied the series, enabled the
> option via menuconfig and ran the build. I thought maybe some dependency
> check is messed up so I retried the build from a clean state. Same
> result.

No, I mean -DMODULE. Note how the quiet_cmd_bindgen target has -DMODULE,
but the new quiet_cmd_rust_helper target does not.

