Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD3CFE20D
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 15:01:28 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 24D3E10E5E7;
	Wed,  7 Jan 2026 14:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="LC6hXQnM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 957AF44CAB;
	Wed,  7 Jan 2026 13:53:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767793991;
 b=n7mY5tSEajFCezWuvwhvqrkvkLFDL4DGHnAiskQsSfaK4QOAIlz7CZKYVe+zoZpJtoUnh
 dstgTKtJ73uAIcfToa+V1InTrZ6ydmmS9C3aHxKvhma9s0gfcrsDNKVAvJpo2YWpFeYSN4E
 WtWUW+7WaLLcVm7IdpRvWKp8sQqDdYTBw5SavJ/ZEirxGn4vSgKQU/7rjvHmODfyVkv81Yh
 3yuCy+7rs6hqRHPqJbly7lrOCIy3ZTQ6vjK6SsA3aTNyvJDDyDT0yQMrZqUyuPRzm4vkjE/
 YpNEnDO3cpjAXOnNg15YJiFuAdeDT9Z9MGLEoUVn6xOoZ6lLVm93DNpQK8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767793991; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jBG4aNk5ZWi1L4CNOgmaFLu3BODBNt1dP7Ozcg8ij/Y=;
 b=SUJ3qAV8SjMqRFBQsb81/9e0fcvm4y3Dv1yhr1inCSA2HbY8F/YL/rHKDnqABZll/637+
 OpviqNJLJv1BgTkP0BQlfbRAPzbpDLljljme6bv+0gTgRr2pYV10fVJNFuSdrclXBx4qmtC
 xPGKl70qzi99zkMTV58N++bg26bPte0PVwom18Nbq/8xNxwoYNwQQ42bvdgu8D+kdSCbnBD
 0Ot1+4RFO1sepbf0FpaZYYdFciTlJWMW5MxvQvWELDolP2oirE2qTLqSiDcJvhvtY5fELlG
 TlcpaM1MJ8W4WoLWeemCXgBY+M1UqbgixPsmZb41cNSdf0hKVXa6Bs59viCA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AE9F744C9E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 13:53:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F260A10E5E3
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jBG4aNk5ZWi1L4CNOgmaFLu3BODBNt1dP7Ozcg8ij/Y=; b=LC6hXQnMU/NjNO36FOTRtHoc0b
	/R9ICMbhCZtTHkS35bxXgX721Q6i3pKjMA60pANzb9P4UBUCYzR4bjTJrOFBImGAhb8rVbKgyDlI0
	fyQPiaIyjfN8SJ2QwfTKIRlPROAPEg3zkFuMjX0Ycm0wkAjRZejgQI72gS6yb8OMfoenRm6B8eNUX
	4csrD5Y2QACSnClhFglmySG3XsFDrvWSdXc5HsaLQXQs0FPAGnftGE5h0N9BFd9tugFDLAqVmol/l
	CrsnNeldt1O06d10lUU3N0XPkxb6sYRiAKq/7dtmFgKjLPhzaJPct/a4ZCNqTSThZy/KIG3b3NtYW
	87+tua7Q==;
Received: from
 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl
 ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc]
 helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdU68-0000000DSbv-27M6;
	Wed, 07 Jan 2026 14:01:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 70AB730057E; Wed, 07 Jan 2026 15:01:15 +0100 (CET)
Date: Wed, 7 Jan 2026 15:01:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
Message-ID: <20260107140115.GE3707837@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
 <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
 <un386uEr3TEFzLpGCdZg_Tzm63zO7Ze6IZN16Cz79EfWmEI_hZXbBvhG2enZmUXJ6DUnCMNm7QIz-agEYIDr9A==@protonmail.internalid>
 <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
 <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
 <CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com>
Message-ID-Hash: ZFYBBBYVV2W3TU2IB7IBR35KGIIHEZ3F
X-Message-ID-Hash: ZFYBBBYVV2W3TU2IB7IBR35KGIIHEZ3F
X-MailFrom: peterz@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZFYBBBYVV2W3TU2IB7IBR35KGIIHEZ3F/>
Archived-At: 
 <https://lore.freedesktop.org/20260107140115.GE3707837@noisy.programming.kicks-ass.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 07, 2026 at 02:42:25PM +0100, Alice Ryhl wrote:

> With this option, helpers.bc gets linked into every Rust object file
> separately (and symbols are internalized). We might want a separate
> .bc file depending on whether the Rust object files is part of the
> core kernel or a .ko file.

Right, building it twice, once with and once with -DMODULE owuldn't be
the end of the world I suppose :-)

Also, I ran across Eurydice during the x-mas break, would it not be
possible to compile all the .rs muck to C using that and then building
the whole lot like 'normal'?
