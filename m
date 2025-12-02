Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19776C9CE8B
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 21:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD710E6BF;
	Tue,  2 Dec 2025 20:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Gm2iiVjM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BD310E2B7
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 20:28:10 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-477a11d9e67so34845405e9.2
 for <nouveau@lists.freedesktop.org>; Tue, 02 Dec 2025 12:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764707289; x=1765312089;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=K+pnIulJNJt95g4PRiZ1OZGjLuh0/T2E5jVeAQXxxJo=;
 b=Gm2iiVjM9uQQE9uW2K2jMw4kIwS14I2tewFhGssTAeZ9/c7WQd14XYJXn7vavhQeG9
 JcY3e8/waWXIcgqSoFIQJRFNb9lF/+ypzc42y1f2eJHopiEs2Ufo+d3+16BmGnNRCBnj
 65cqGs4xL8e879TE/f2nRsGru/k6dLnaWKAj8YUAawwMB0/HyWYfIT5y8R9O5XF1E26D
 Mim0+TioHp8mfGu7RUlv71dajfIF5AiHzky95y05ASEcYx8aa1TLrYd63NZ4HzCWy6nY
 YPnhtGTiT5ElSsv5If23Sa1DJmNl+lqwo6eZxe3vMBLaGytwSbPeTsuiTojMmmS/BcQG
 tWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764707289; x=1765312089;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+pnIulJNJt95g4PRiZ1OZGjLuh0/T2E5jVeAQXxxJo=;
 b=lqh3+Yw5fdrkmSKj3xkpr9lKTekl6bNcHyotRyE6A4ScRPQo2e6GyZYErSkNKIScyV
 umrakedwn4yPpLagoZHrkv1w+ncpGpB8w6RuLPM2BBMBCdfmfoPKoOW8owwNCI0pPIqX
 cBVVjwor6kQjTCq1/S7RVeK6S4ygUfZbSbtyi9LayocIzwKOuYTTvF3O7CwOu8rRCU4V
 VdVMe2J9o932cxN1avhjT3k9acsWALJeBdda5byhXSo3hzpmT9+L8J1TJKsduVQeyVub
 lgHA96qugV3pwDRUX52ixngHND2BPjNGefgnLr7JpJa0+JrfkxMWe7OuLP0geHKPLoY6
 Ex+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJZ29ThyZJkylBnpiHvJvw4vLTkKotqyaRYgTM588tZW+efOcC331m9k9R2CIoQRRYuq4kH7RZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTIoafCC2X52+FWNM+Rv7R1XYMV7lCFAFj6ytfOju+UnQtMtr0
 MnIJ1wPfJpurJ7jv8rf7iwMvL0qqmpzo2/E29N0rgPBaL412RNRcYVtSXHxgmuS3tfalXUAkrUV
 /kEnZXg16pSnjv+je6g==
X-Google-Smtp-Source: AGHT+IH3ZnwQuecxPwgzPlJuv0hxZRJepRnTk5tmXYQ4WU4tTZ8xIPGCG9Cfm/NQ+p0+9yexgPUvCiE9XPhmDG0=
X-Received: from wrps1.prod.google.com ([2002:adf:f801:0:b0:429:c967:33b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4743:b0:477:9cdb:e336 with SMTP id
 5b1f17b1804b1-4792a6112d8mr8320595e9.21.1764707289252; 
 Tue, 02 Dec 2025 12:28:09 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:55 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMtLL2kC/x2MQQqAIBQFrxJ/nZCRkl0lWlQ+80OYKEQg3T1pM
 zCLmUIZiZFpagol3Jz5ClVk29Du13BAsK1OfdcrWSE4nBwgPM6IlIUx2g120wpypBrFBMfPP5y
 X9/0AgS4xtWAAAAA=
X-Change-Id: 20251202-inline-helpers-996f4db65e18
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=DMU3lV0kK4kJNtnPc3Nty9uyb1cSSeng7zHph2BnL3I=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vTWsH3yDN/Q/6rER62qMlw7HA494CvIvA6k
 Xo+t+QaZICJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L0wAKCRAEWL7uWMY5
 RnOsEACnF8HBaipvKfp6mXpVRzCwiqlyfZ6QeeAmd7YfE8IRUASURdP9ijwkPSEZlU3oDOyN/3M
 lrK8WFFRMJKXhCD7lZZ+UYOaLAsmHQ9rcAEOG6j2bxASbgwRjLLekdscs9hAfZov7h/QfGfHpMb
 TF0B0c4D/9HpOeBUWNR0j/l8SNHRe8d7wURImtKNSeRtpQjJeVDLp8Iy9z4DLyLnaQ81I5RtKlr
 czGEYrJSkwqdI3mOLUTXpamSSPaCsz9MZq3CG5Ioy66L1wLwPUNFEg+kc93ovxc+VT3c08omqbY
 BSnTlURzwn5/siI2pqSiV4nURivCk672LWfNDdI61Cxi2IFwr4Qm5KvePO7Q85jaAlx1kwrshoD
 bhrA23CWhDy3lvUr1MyfjuOci46kj2FW3G26Qfg5s2aTKjfEUGSxszPb3YJaCqmjaKmopOT/tI9
 9xjVZadcgpE+jAG8EfsKe+wMsFd4kWQ8hnwQlmmmlxpjvHVx8AMi4VzOXFf7bqgKisYDmm4S+R2
 7xY6EZkX0JvLIVtKlTVJ/UJztESkroU7fuH+DHKGq5mIucS6zkMvZXiuq7Gl7lxfO45J+PRfKKS
 RYZBcTnOtuQVMwtxvDHnU09VlF8X515rNezV9L2RmoVVdHtiiYiX/6p0YOJ+Ier80bXNRRZ+Va6
 pKekhjpZDMT87kw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Subject: [PATCH 0/4] Inline helpers into Rust without full LTO
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>, 
 Matthew Maurer <mmaurer@google.com>
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

Currently the only way for Rust code to call a static inline function is
to go through a helper in rust/helpers/. This introduces performance
costs due to additional function calls and also clutters backtraces and
flame graphs with helper symbols.

To get rid of these helper symbols, provide functionality to inline
helpers into Rust using llvm-link. This option complements full LTO, by
being much cheaper and avoiding incompatibility with BTF.

I ran a microbenchmark showing the benefit of this. All the benchmark
does is call refcount_inc() in a loop. This was chosen since refcounting
is quite hot in Binder. The results are that Rust spends 6.35 ns per
call vs 5.73 ns per call in C. When enabling this option, the two
languages become equally fast, and disassembly confirms the exact same
machine code is used (in particular there is no call to
rust_helper_refcount_inc). Benchmarking Binder also results in an
improvement from this change.

This patch is complementary to:
https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (1):
      vmalloc: export vrealloc_node_align_noprof

Gary Guo (3):
      rust: helpers: #define __rust_helper
      kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
      build: rust: provide an option to inline C helpers into Rust

 Makefile                                  |  4 +++-
 init/Kconfig                              | 15 +++++++++++++++
 lib/Kconfig.debug                         | 15 +++++++++++++++
 mm/vmalloc.c                              |  1 +
 rust/Makefile                             | 26 ++++++++++++++++++++++----
 rust/exports.c                            |  5 ++++-
 rust/helpers/atomic.c                     |  5 -----
 rust/helpers/helpers.c                    | 31 +++++++++++++++++++++++++++++++
 scripts/Makefile.build                    |  5 ++++-
 scripts/atomic/gen-rust-atomic-helpers.sh |  5 -----
 10 files changed, 95 insertions(+), 17 deletions(-)
---
base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
change-id: 20251202-inline-helpers-996f4db65e18

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

