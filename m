Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A6FCFDA28
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 13:24:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03510E5AE;
	Wed,  7 Jan 2026 12:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BlxGzu6R";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 105FE44CA7;
	Wed,  7 Jan 2026 12:15:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767788150;
 b=kf9Gc8VX4or034Oav//9J3sl46jixLLjTSiQ37JfcwKhvxdyPMMhb2gLEavQEB1IdWZ+r
 yoPUHBIX0fgu4v/o/EFu6weI4obZNy9+1eu+OXTD3VGc6Kbr05vbi/h1En9bGimLPcVqD8H
 QDCny0az148qjtiW8EXl4wmmzehYHl+ZplE0S2zqVberwLI2LoX6lLJeyDrnD+hTl2indlR
 CFvXsDs4MEHFF1gu9nWM4yh7jPY18DC9Cu3nxwYzNwQYrbfshQrDdw6QSH1dk5zUAS9yD/d
 Ej9YOqN+S4F4idsi/Xk22KLHB4yUVLLqRIrQ4e6rj83Sfo2Bi4LMYiH1nXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767788150; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7UcQNwJkF+MbVdWe7DyVVQMh+eIC4Yr7T83ZlhmMUc8=;
 b=NNbI0e2n+/CtRTXI2+rHbCBhTE9j6IdVz7TPJcWLB54NFgLig440la3iv0Q2MyRw9+oiq
 TSPLimUVN/kCyo2BB0VFEXnx5qh/ggtoozeAI8rKuUEzL6kLO14pyTaonYzrf958KwJnx0M
 mj+ngxQEkzdDQF8GJ6bhjav9c3r6ZJa7DgbPBSbdzLWwonphd7osIInKrriEC/xq5Gqeihw
 +gUdW214WY9kNVagiR0t9XakqtRSFj9buqRnkSuAMPqCHJXmBOU+UmWsKQd5VIsmrfEALIh
 ReZ8yfe9KVX1KLIqOaPlUx+i1rxNVOTIZlX6QTjuyZRGafxOee5Fc7PHTWSw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 94BE344C9C
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:15:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A31DB10E5A8
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:24:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8D8460145;
	Wed,  7 Jan 2026 12:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A924DC4CEF7;
	Wed,  7 Jan 2026 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788642;
	bh=Bvupu5pKUncAhUJLwMsrNMafTyDGF9I/qKF4dtQzIQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BlxGzu6RX/AW2lkS5MSu6xZbB2eEgdcN+jse48bS4whRSSv2gXFzrGqnwOdjnT+HF
	 lNJoKD1g8jKBEA2Ba5fUCq1PURT3ARECFeQH7UH+I2hSuHX+xuHbMJucbYvK8jAiD5
	 vvlA/RaA+em7AaVAdk11OllE9r8e6oAEQ9Ya/kFTUda5jKRkaHNufwgwbuBBcSRASL
	 QtfYFxiHK4610hJBt39SFuFQcEd4LrhtviMsDshaFDyKbN07U51gDpOk1X84POnO6k
	 UJvR8c1yqoaEWmS3SotJ9ymLG76mFHUtkEvALM9tt2q9jXsUpzg1rBn4cpkF1fdKJL
	 tiAr5va5WK6og==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
In-Reply-To: <20251203180955.20b41904.gary@garyguo.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251203180955.20b41904.gary@garyguo.net>
Date: Wed, 07 Jan 2026 13:10:07 +0100
Message-ID: <87344hipy8.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 4LKLUJH2EJIRTEXB5E6KRX4VY5EGZ3EW
X-Message-ID-Hash: 4LKLUJH2EJIRTEXB5E6KRX4VY5EGZ3EW
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
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
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4LKLUJH2EJIRTEXB5E6KRX4VY5EGZ3EW/>
Archived-At: 
 <https://lore.freedesktop.org/87344hipy8.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> On Tue, 02 Dec 2025 20:27:59 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
>> From: Gary Guo <gary@garyguo.net>
>> 
>> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
>> allow C helpers (which were created to allow Rust to call into
>> inline/macro C functions without having to re-implement the logic in
>> Rust) to be inlined into Rust crates without performing global LTO.
>> 
>> If the option is enabled, the following is performed:
>> * For helpers, instead of compiling them to an object file to be linked
>>   into vmlinux, they're compiled to LLVM IR.
>> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>>   is a performance optimisation to prevent LLVM from always have to
>>   reparse the same IR).
>> * When a Rust crate is compiled, instead of generating an object file, we
>>   ask LLVM bitcode to be generated.
>> * llvm-link is invoked with --internalize to combine the helper bitcode
>>   with the crate bitcode. This step is similar to LTO, but this is much
>>   faster since it only needs to inline the helpers.
>> * clang is invoked to turn the combined bitcode into a final object file.
>> 
>> The --internalize flag tells llvm-link to treat all symbols in
>> helpers.bc using `internal` linkage. This matches the behavior of
>> `clang` on `static inline` functions, and avoids exporting the symbol
>> from the object file.
>
> Huge shout-out to Matthew for discovering this option, this makes thing
> so much nicer and it feels way less hacky and more reliable now.
>
>> 
>> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
>> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
>> Disallow BTF generation with Rust + LTO") for details.
>
> Again this is a much nicer way to workaround the issue than changing
> the language name in the DWARF info using text replacement that I come
> up with :)
>
>> 
>> We have an intended triple mismatch of `aarch64-unknown-none` vs
>> `aarch64-unknown-linux-gnu`, so we suppress the warning.
>> 
>> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
>> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>> Co-developed-by: Matthew Maurer <mmaurer@google.com>
>> Signed-off-by: Matthew Maurer <mmaurer@google.com>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>>  Makefile               |  4 +++-
>>  lib/Kconfig.debug      | 15 +++++++++++++++
>>  rust/Makefile          | 26 ++++++++++++++++++++++----
>>  rust/exports.c         |  5 ++++-
>>  scripts/Makefile.build |  5 ++++-
>>  5 files changed, 48 insertions(+), 7 deletions(-)
>> 
>> diff --git a/Makefile b/Makefile
>> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>>  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>>  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>>  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
>> +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
>> +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>
> I think this is no longer needed as we only use LLVM BC now without
> having to round-trip between LLVM IR.
>

We should update the commit message to reflect this as well.


Best regards,
Andreas Hindborg



