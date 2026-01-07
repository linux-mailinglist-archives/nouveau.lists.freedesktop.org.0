Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED9CFE012
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 14:40:22 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDDC110E5DC;
	Wed,  7 Jan 2026 13:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="diRQGJsv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7471344CAB;
	Wed,  7 Jan 2026 13:32:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767792725;
 b=iMCSSyq+QBAg+N7WKMKs7QNswLawW8HGLg0HGQHDgVVyUrWKRMBKljoR0XgiJ0MWyLrpv
 1VdlxwOQ28hPnbguFQl1se8bVvV/I/nLitB+PloHDsF2bhPYeyS+ARYo7KrS/5mx+4gxNyF
 kO4QaAAu1lexNw4OOPqGR2QTGIgaWCfjQwIqqeF6b6bUS/YBpsIKoSUnJUZNeH07Wo2gqal
 Ge2kMSphkVSdcOUUrbN7n9n7NGKBYSNBc3CO3I5pyHJzRVFtsHKWHR9QEOQ8AbkU0U2u/TA
 oeq8gPDCAeG38oXNUwHMoeCLVh41dHCDhGFAIZATxud2XM+ak+NBCKLN9fcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767792725; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=29sqabfcqsi5EoST1wifog62Bx31GKw74B5QewPDne8=;
 b=de6jbVTNWj9FaQalSwNQPU5O8Lnoe4nWP5vS1MoKhdSUjHGYXQX3fyM52RO9Fme4kSEFn
 cZDuMKzYsThRN6yqL/Ga7A9uysnxaEpbeUBqHA8Z6o8/6zIEkMln2rTm2WmJ9Awh5gqSjoJ
 Or3V6WvU/aneKfEHuedRPSmv/6rQ6k7NgQEFTCMoR6oOSbURB3Eb9GoWb9vGwB68wdeNfaK
 e/5Z9U+4GhzwPs/1hSmhI60XvxZgxqTGNOJuxuAjCIz/rFj/6daEqhOuqvwhbQ+rR36Dc0u
 zPqDpTmzcMfhblk7cEyLNO62uSwfVxtyXGY+1VxV5hvbYhXiwQJSZ/+NkzVw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D7C6C44CA3
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 13:32:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0522810E5D9
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 13:40:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4338360007;
	Wed,  7 Jan 2026 13:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16811C19422;
	Wed,  7 Jan 2026 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793216;
	bh=bkmcM2Tj+34ZMJvuxts6z25Z9OzVU2xOhSRLpeYYIkQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=diRQGJsvp5HsGoG+0YkZ3zhXz9oXYZYA7RFEYuNAaEdA/crlPfbp6TrLhzw8YKTJ2
	 uADNq5sebRFRHGYRsahgEcf8hT9x5a+SXEcivckPucM6V6qqbSe2dhj8WWaztyl4p0
	 5Qxcfq8kISRzJDpCftu37FcGy17tYlvNTVPcDXio6IiAgs/4jD9KgjJyI5n0GnIVch
	 ujhL55zrpwLqhWi7ElfVQcdp3YJ/AzPFIgAN4rbtaYZAga/U0jvvjQEfcJYV9e19l7
	 m5C449W7qboRqkSOZKetJDjzNQg5c3cvcNCVlivDUw/uEURByXNrgsblI4cw/vRAw4
	 0tnDNdL2tAQlw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
In-Reply-To: <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
 <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
 <un386uEr3TEFzLpGCdZg_Tzm63zO7Ze6IZN16Cz79EfWmEI_hZXbBvhG2enZmUXJ6DUnCMNm7QIz-agEYIDr9A==@protonmail.internalid>
 <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
Date: Wed, 07 Jan 2026 14:40:04 +0100
Message-ID: <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: LLPT2DNVYXXC4YAWGIYJ35LCCO7CNX2N
X-Message-ID-Hash: LLPT2DNVYXXC4YAWGIYJ35LCCO7CNX2N
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LLPT2DNVYXXC4YAWGIYJ35LCCO7CNX2N/>
Archived-At: 
 <https://lore.freedesktop.org/87pl7lh77v.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Peter Zijlstra" <peterz@infradead.org> writes:

> On Wed, Jan 07, 2026 at 02:12:10PM +0100, Andreas Hindborg wrote:
>> "Peter Zijlstra" <peterz@infradead.org> writes:
>>
>> > On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
>> >> Hi Alice,
>> >>
>> >> Alice Ryhl <aliceryhl@google.com> writes:
>> >>
>> >> > Currently the only way for Rust code to call a static inline function is
>> >> > to go through a helper in rust/helpers/. This introduces performance
>> >> > costs due to additional function calls and also clutters backtraces and
>> >> > flame graphs with helper symbols.
>> >> >
>> >> > To get rid of these helper symbols, provide functionality to inline
>> >> > helpers into Rust using llvm-link. This option complements full LTO, by
>> >> > being much cheaper and avoiding incompatibility with BTF.
>> >> >
>> >> > I ran a microbenchmark showing the benefit of this. All the benchmark
>> >> > does is call refcount_inc() in a loop. This was chosen since refcounting
>> >> > is quite hot in Binder. The results are that Rust spends 6.35 ns per
>> >> > call vs 5.73 ns per call in C. When enabling this option, the two
>> >> > languages become equally fast, and disassembly confirms the exact same
>> >> > machine code is used (in particular there is no call to
>> >> > rust_helper_refcount_inc). Benchmarking Binder also results in an
>> >> > improvement from this change.
>> >> >
>> >> > This patch is complementary to:
>> >> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
>> >> >
>> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> >>
>> >> I get the following modpost errors when building with this applied on top
>> >> of v6.19-rc4:
>> >>
>> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!
>> >
>> > Looks like it used the wrong static_call_mod() version, was MODULE
>> > defined?
>>
>> CONFIG_MODULES=y, yes
>>
>> I built without the patch first, then applied the series, enabled the
>> option via menuconfig and ran the build. I thought maybe some dependency
>> check is messed up so I retried the build from a clean state. Same
>> result.
>
> No, I mean -DMODULE. Note how the quiet_cmd_bindgen target has -DMODULE,
> but the new quiet_cmd_rust_helper target does not.

Ah, that did the trick, thanks!

  diff --git a/rust/Makefile b/rust/Makefile
  index 5365d53b6cf96..08d3dc1038cf5 100644
  --- a/rust/Makefile
  +++ b/rust/Makefile
  @@ -483,7 +483,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE

  quiet_cmd_rust_helper = HELPER  $@
        cmd_rust_helper = \
  -	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) -c -g0 $< -emit-llvm -o $@
  +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) -DMODULE -c -g0 $< -emit-llvm -o $@

  $(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
    +$(call if_changed_dep,rust_helper)

Is -DMOUDLE always appropriate to pass to the helpers? The helpers are
also inlined into non module code.

Best regards,
Andreas Hindborg


