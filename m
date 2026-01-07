Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF28ACFDA2B
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 13:24:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA8D10E5B5;
	Wed,  7 Jan 2026 12:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YT7lKsIL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 56DD644CA8;
	Wed,  7 Jan 2026 12:15:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767788156;
 b=iXa3jMn8Nx6gESohJM7z4qU+M3SKXGVNl+NBkb6/oXTd5aDEbnXGd1l2os80vu4B8K+tA
 YuiMOme+L41pg5MtN5HQHxp7FAJeKCOskAmjaWKu2yg3KwsA3QF93C8VItH9jAEBglLPLD6
 homrKCDpghgGYbSI5DE6dAEHOXCaBRLaVNSvoLMqy80nRne7YO7O/41ZEkIWJGE6efC3U0N
 MZ27pU2aX+MnA3yQwcs9LdVdadQ3t18Oa931cDM7LMmk8J3VNkGAFyqHMi5WKkLJmeXm8ZM
 JjCVzy6O1ZltTLSBVLUCYKIE+KdH5NXcMkPlE3HVEk4O/ZTfH9d+ihfkdVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767788156; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rpMX6bcbnkjTfRRLH8ed45IhO+hjVV00iT/F+u9RrCA=;
 b=Rm1MdEEp+yN44hwWM1Wacjx/4WcIR4DmpvdGhuIvgB84abl9WgpZUG55wxyEdmoLo9xl1
 aXTzp8sQp3mxxatln8YoCJ7AZRoNiV8/8G19jVJ/dqD2Hs/xp/zdzKonELM2Dj8s4smIBXb
 Ss/4boVZVl13dK9oMa+4QMqmZRUhwwAPhRiMeXLy9ak/yQYB2HKMmcP+t/x60LIkel7mE8x
 +XBGBg7NrnyE3JRmh46F7r5HsJwkBDI6zAHKYJpt6FWM+rSHhmn2WmBHx1uoh1C0+vSwy/U
 LtauVxvdaHmRr/3IT6lrwOBMTN4ubnj2xrkK1yHzWyoxK3pjIyUrfEPJ7cOA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 139E944C9C
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:15:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 39DA510E5B1
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 12:24:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 202C74377E;
	Wed,  7 Jan 2026 12:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE2BC4CEF7;
	Wed,  7 Jan 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788648;
	bh=Lq+qb8p/JeZZ24gFARiIHk8jb++YEHQT5hO3qTQR3Dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YT7lKsIL4LmNfK9eUGj51kaYJfJfLQzVlgoMitV0b19j0lcJZ8troi/+V49jjtdUJ
	 qhVMSF80VQrUlyyAhJwQc2IzYUIlOLo2VDSrj1XEjU0g8O+ChiZCM3BDVuGsi1BF3Y
	 1PIoqO1gZIdKT5botN3Lx2oAI6RUWiqgz2JMfxfZXgDzXM6MZWVOLrMnva9Ht7gPCE
	 IucAai8tLwT+XJiV3oTKnnWrsVZfIwKkqNMLWTtjnE4rk3t236XwAOj1hIxddYxk9I
	 R1q9plGRjwg8Ov3p/4r52h8vTA3+lBwQ2EEtzawKcAkPycVlW/BGSpYf1dZO5C6NKF
	 OvK3Y9zEcICiw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 2/4] rust: helpers: #define __rust_helper
In-Reply-To: <20251202-inline-helpers-v1-2-879dae33a66a@google.com>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-2-879dae33a66a@google.com>
Date: Wed, 07 Jan 2026 12:49:32 +0100
Message-ID: <875x9diqwj.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 7YD3VGBSWVCBZ3YXHIBO2YAUNMMFDSZN
X-Message-ID-Hash: 7YD3VGBSWVCBZ3YXHIBO2YAUNMMFDSZN
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
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7YD3VGBSWVCBZ3YXHIBO2YAUNMMFDSZN/>
Archived-At: 
 <https://lore.freedesktop.org/875x9diqwj.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Alice Ryhl <aliceryhl@google.com> writes:

> From: Gary Guo <gary@garyguo.net>
>
> Because of LLVM inling checks, it's generally not possible to inline a C
> helper into Rust code, even with LTO:
>
> * LLVM doesn't want to inline functions compiled with
>   `-fno-delete-null-pointer-checks` with code compiled without. The C
>   CGUs all have this enabled and Rust CGUs don't. Inlining is okay since
>   this is one of the hardening features that does not change the ABI,
>   and we shouldn't have null pointer dereferences in these helpers.
>
> * LLVM doesn't want to inline functions with different list of builtins. C
>   side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so
>   they should be compatible, but LLVM does not perform inlining due to
>   attributes mismatch.
>
> * clang and Rust doesn't have the exact target string. Clang generates
>   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
>   complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64
>   always enable these features, so they are in fact the same target
>   string, but LLVM doesn't understand this and so inlining is inhibited.
>   This can be bypassed with `--ignore-tti-inline-compatible`, but this
>   is a hidden option.
>
> To fix this, we can add __always_inline on every helper, which skips
> these LLVM inlining checks. For this purpose, introduce a new
> __rust_helper macro that needs to be added to every helper.
>
> The actual additions of __rust_helper can happen in separate patches. A
> "flag day" change is not required since missing annotations do not lead
> to anything worse than missing inlining.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


