Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E00C9CE91
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 21:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6810E6C1;
	Tue,  2 Dec 2025 20:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YTQ3J4jx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1C10E6BA
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 20:28:12 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b735400de44so499036066b.0
 for <nouveau@lists.freedesktop.org>; Tue, 02 Dec 2025 12:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764707291; x=1765312091;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0yaLbdbXJAqPOG8MVf6C4XR3DKZYvDAAnU5HF8zvPbo=;
 b=YTQ3J4jxJh/4dB7w7ZhKRRSLkI+iUOGbpO8wUx0MhwJYZrB0DrxPcB+x1a1hKT2v6A
 OZ9+jPPUFNiL8JmKo/IIDl63irgaeepVNkcJsAfV7QE2CsjSf2o2PBpjeWgTfhWt7QZQ
 NqaKk8rRfLRP/vm8/oZdrEJfcEx5JGIFclShmZL9CbsK8q4UaYJqcuSf0Yme4Wefxa8l
 AuFvhsoFVLBY3ApWMCE/SS/2FP98atLLEjy96i62f0a4k4KT5ZGwOahQVFhEuedyI+Em
 bTQlXnK/M+79RETCjGfi4qrmuRycU0MkQ8SXAak1D0o5QsocHxn4SLJDbBu9rq35YlMj
 bkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764707291; x=1765312091;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0yaLbdbXJAqPOG8MVf6C4XR3DKZYvDAAnU5HF8zvPbo=;
 b=YsMUxsZqUomEbES8ZJOktQC/KRbpfPktBMmOq82vmhMiBH+R+vvo13KmayQ62s9vkC
 8YSDeGgXwIw6SaTzels7/VmLk8pDdS7GhIJKXqndByz+hRw+TnsJk27jWKEzMlZDqrlT
 5jbtyB1Em+Zu9mCfjRRfEARP4tD9XwfcUJhnTWFAOKbLAnsATOxXAx6qC2mI6WhEuYtD
 YGXVWNEnj2UKUovsuRkyG+o2jZNmK4Vd5LI5NNItroH7y0b2H+PXv1iPT4Mhk0cMcKYu
 YLJOkIORUWdXzyEbtZQpCzGr8stbrdNJ5ycFHWwnKYyDdkd6BGraVEAUSXOQjCPO7LbM
 pfyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ0n2Mb5P5jcYKD5if3AjQ+Hv7KJFXg72/lH/5Y+QL33Ly682VkJVISYUH+R45QdDemTTQnCDT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBGcLhswHHKBNcGBWiG0lqqsP5zpQuNESBgnyvJWp3RlHO6ZGh
 rt9buz5fiDrTGk+8D9E0UC/ZSADZnT1qJv5HfaLUwTH1tGiAyuyMOAlQAUkKSwMDzgvFl3620QT
 ivfHxm3gPmTaS4QNX4A==
X-Google-Smtp-Source: AGHT+IFxbJTUi3LG/UxAzVg0DHJfs/QK8ZkbgJFUFzeew/1o2JPNxmwoD7ry+SYsd199ZxrJFbneEJ7rLxcSHeI=
X-Received: from ejckp26.prod.google.com ([2002:a17:907:999a:b0:b72:6a6d:5018])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9289:b0:b73:76c5:8f7c with SMTP id
 a640c23a62f3a-b767184bc4cmr5031432266b.43.1764707290453; 
 Tue, 02 Dec 2025 12:28:10 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:56 +0000
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=o237WR5t4MMOHA/6xwLqKKnBZN3/rDT9uVvqOcTiQhs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vXS2KTuDwIHjFPV9SPMyVgAzUi/MU12KYc+
 WMaROi5+LCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L1wAKCRAEWL7uWMY5
 RjdSD/41DCALGMN7nyQxyeW2hZ9gETkyG8/iqH2wlmXrShi1r1+WB5woa9Xyur1kDN4fny2B3pO
 Y/5ZTPeLOcZ/aZiVYBNJA/D9HwDtronU7j5mUuxB0yWDU86evl6AxsKiEvJuzy96b8AtZ0ARx94
 IgGN41NqoWqbtVWQg6QlCkP56YIrgkpzGAS8atcgpDUrXNb+PE5wxdosva9Kh9do0WUVeLVeSKd
 BdEA9iG36VbrEo4YdJv4GRojxiLeD9CDzvYaGx6ijS8AsM1Osv5V66FEhywlu5eg8vNaBbPlcj2
 xI8IBYCVYdeDDvb1eKyZRLyLRwSvHfbhkMIgkLYycP51rfgkb9kJ8xzMWQGx4zynmLXzAXH0J0m
 5EB4i8kqfcM55bSpXOcCJzmldnW5zNj6/a6PmCC3hINHPjiHjIKkZmyQFZ+xyfRWH5U5ZZnvqIq
 RTDSAE/Vjex1zfELbKMrNyp4+efGryIeLo2hKskD8xXiqzcEDhKiNZY7C3d1jHSgp0uyZLRoe7e
 N/0L4pucmpbvlsisOuuXdvhokGnGK0s/K4V9WjZ94AoP9QZDTbOpFHNW6iUVflzEdZFfDfqHEs/
 ToADXA5Wr2TwTuT9flTY9YEdDg46zEMD7PVRz2llCMVxG6AYZdE+1gKeJLV9PHtLVfRe6h8qxrt
 EQLssKb+G2MtrPw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-1-879dae33a66a@google.com>
Subject: [PATCH 1/4] vmalloc: export vrealloc_node_align_noprof
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
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
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

This symbol is used from the Nova driver, so it needs to be exported to
avoid a build failure when building Nova as a module.

ERROR: modpost: "vrealloc_node_align_noprof" [drivers/gpu/nova-core/nova_core.ko] undefined!
ERROR: modpost: "vrealloc_node_align_noprof" [samples/rust/rust_dma.ko] undefined!

This error is only triggered if inlining of helpers into Rust is
enabled.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 mm/vmalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 798b2ed21e46059f341ed0d46c7fe56bbe357b22..e086d00f04d61ebd481cb84e3dfea51d8a2ffc57 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4200,6 +4200,7 @@ void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align
 
 	return n;
 }
+EXPORT_SYMBOL(vrealloc_node_align_noprof);
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_ZONE_DMA32)
 #define GFP_VMALLOC32 (GFP_DMA32 | GFP_KERNEL)

-- 
2.52.0.158.g65b55ccf14-goog

