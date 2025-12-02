Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C8C9CE97
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 21:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E720D10E6CE;
	Tue,  2 Dec 2025 20:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="iqEOSoNN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434D410E6CD
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 20:28:15 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-42b2b9c7ab6so3402640f8f.2
 for <nouveau@lists.freedesktop.org>; Tue, 02 Dec 2025 12:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764707294; x=1765312094;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=gzxkQHE3Gn13GhwfvC/ki50S4oawaHmvikFNCkwElMo=;
 b=iqEOSoNNId/yYildmAAXHL73fvUQvl/9M0+dyud+yv9uJ7QE+KtXwskwLr+IWbj/h8
 brehfGcAvbD6pAQHR4plG+k4+4SfygI4KzzUugDkReV6GOCl04JljOtuEm4zbvU64FzU
 ZDhV7DXACvZLgD2xaZpI3em8C58VS+xLQEfoBZUSCFfc5Ke+VvFVhbADZa4bwztzW3xq
 5y7x8XudPT7oAq/ToqAyB5DWsPO5uY4AEjgTtlnpA3eGPQIrqxir+mAuT6RoCzFQBbrM
 rvuZBFVdRUIDavAFETLIDLNqgBR6VxYeIOQl3UYuP0ITNYyEgIt76wOQpg7uZiBTx2dR
 A9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764707294; x=1765312094;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gzxkQHE3Gn13GhwfvC/ki50S4oawaHmvikFNCkwElMo=;
 b=RoPtqLFeMypMebhX8HIzKsQHgM6oHwT/ccoIgqvYDadunBDAcZXZWjk/X688i2+iMU
 5Vx4gwcw5HT1fGQc+X6l5/bgEldBvzS1ZYpsdUoPZ79HEMX4laIce+H6hib+kMZI15kK
 TWQDBeuxbD485yf6yg9Mhim2/yu2ktEwegpgoOGDoCtqRg9XYL/oWfyFlbt2a4bj1+vZ
 AnJ0458OSEH24hSeASvpLrV+KU+VJItBGncbMAmqb+L8G4wdsU/Gb6QmsX7Lc21mLue4
 eWbC7zUlqIUcPicD7bstHbSio9NEw6EePHj0QdZZKQAFvi/YGHGq6/gKZf2oA6LuG797
 LrkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRQzGk/V73MgV8ZwsEBzwrTarfocnKxPspaO7RmjamSXwzLXi9IF3l51a0Te0nPGUGEIfoo4ad@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpsdJUia589wrWeZ9ROaR7ic9bhAg6ey4/jPsMBHe14bjYpkTA
 f2ZghipT74wi9Kqt1qBrtwwN/hW23dtpanehy0vKc3+xTQL1SVh/In/mpZsUWHQ0411+3JHFcfl
 FX9I0znlrnkuiiXoasg==
X-Google-Smtp-Source: AGHT+IGSHYTHK44+Q/MF6SQhcldsTZ4F1l/P7eqEkOlosij1EkIh4u00KVkeS7lVD1xE0j+H0LySU44dB3+wV1E=
X-Received: from wrbl4.prod.google.com ([2002:adf:a384:0:b0:42c:c2d6:2ac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2502:b0:429:d3c9:b889 with SMTP id
 ffacd0b85a97d-42f721fc486mr463737f8f.1.1764707293233; 
 Tue, 02 Dec 2025 12:28:13 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:58 +0000
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=aliceryhl@google.com; 
 h=from:subject:message-id;
 bh=XPDdA9qRPdYsgm5Nsj04MFhk3BGo//T0H/GXZaSfcnk=; 
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vXEU3vfH0ez+fWa3XM7NL47DJ51BTPUHznb
 cVT8tuwz0eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L1wAKCRAEWL7uWMY5
 Rr5AEACDSrcLuNKFX5r42YLqnad/vd877J0UJtGVWFmfriVe5P6Y6yqMkDEJ4ZMuWqwR0CnkulQ
 iiVfYamb7odLVlOubnoHlMlj7AWP0dyPUvMSZSqNcAWaYbGW483ZRaOxEZ4MVgvv0mP7aVNfzTR
 AXKUkJtJQsTI3jC+m/+ONvFAwhiG/+ExbJiOQBnFIeA/dL5OLSlAzjBaKqkw0Hsjntsfgglh0AU
 gB0JD/vBPuKmQIVm80pytBPt6BxtuYQkBmnCsIF5IvJhOPmqYIUPGzEKdP/jNzFe+mQ1tYdDU9M
 7OjSUVfVipG9L/SkRnOOZrtyBAw3ajN898MH9PL9BL76iul3Xq5SYqIYisYp1EkVSeAV1nI1nQ0
 PVAfjmGqhZJAhvdAiFK4JJe89ZSYbg8lS2SM2eCdcS/YvCndmO7zlcsm4tN/dEbSsIrdJe9t/Jq
 3T2AaP31hxuZkqIDVjDWYWot0m/f4ZO1DDvtY2NCpcCuooX/eqS89rOiC+QPd3ohGU3j6DpUhyb
 mfcdw6Kb2qywcFJVSyoT3wGIFQxVosTnahQ4kEHggZST0Fg4rfiMos2UpeMS03pTZ2tJtDFKVcy
 ZpVWYPeUkijjVyO5ttcLvgrMtnNiUzhdEYUK8ju5sJYNmGueW9AmruIzbdTRORaqrYkAvlfEdrO
 8DhJzFKcq8IlMyA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-3-879dae33a66a@google.com>
Subject: [PATCH 3/4] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
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

From: Gary Guo <gary@garyguo.net>

This config detects if Rust and Clang have matching LLVM major version.
All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
matching, otherwise it may generate errors, or worse, miscompile silently
due to change of IR semantics.

It's usually suggested to use the exact same LLVM version, but this can
be difficult to guarantee. Rust's suggestion [1] is also major-version only,
so I think this check is sufficient for the kernel.

Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49e7ac930207c9cde8d431d55dc7af..d35d0ddee573d09997087a0f99dee7c7c9a66ae3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config RUSTC_LLVM_MAJOR_VERSION
+	int
+	default $(shell,expr $(rustc-llvm-version) / 10000)
+
+config RUSTC_CLANG_LLVM_COMPATIBLE
+	bool
+	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION = $(shell,expr $(cc-version) / 10000)
+	help
+	  This indicates whether Rust and Clang use LLVM of the same major
+	  version.
+
+	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
+	  LTO) requires the same LLVM major version to work properly. For best
+	  compatibility it is recommended that the exact same LLVM is used.
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT

-- 
2.52.0.158.g65b55ccf14-goog

