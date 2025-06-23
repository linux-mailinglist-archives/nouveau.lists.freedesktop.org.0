Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8DFCBADEB
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED3D10EB8E;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7RCtM0q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4950891D9
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 15:14:54 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so4550843a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750691694; x=1751296494; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uqJIIUX1RcMuJD/oxLXivkAND/EflsQl1f/q6RQcXXU=;
 b=I7RCtM0qvcFNZ7sHl8zHgmhCyZrrA+kSeST6b6MeBFfZWkd8JeK2yleyQUWo7bqyEV
 T70BmIzHLq8gh18Cvxhlu0dxLUbSdtR2kIgLBwloSZlzeNZEVLjJJhhDdwfltfFNOGQ5
 o8ngiSfx2a6S9sqFLsBvh1eUKK+vhI40UnR3nvfi/rqgGhfUVCGUIot9LgtEsUgUJ+hZ
 ij98O7aZr379AAPmSI5Npx4xaV0c8PvI1EYszswEHgLKTQTRFxZIVqcOtqmiUuy/gpBX
 /gk7cqnyApxwzCwG0q6MKAbRwioug9w29v+62RDkpqMyXOEzVfPCTHXh0RR8J9HF8KXd
 HmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750691694; x=1751296494;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uqJIIUX1RcMuJD/oxLXivkAND/EflsQl1f/q6RQcXXU=;
 b=B4neR7AhZHCSHNbxAnAhnt/svAEiJxbMsJFX88XAtOkDVUXeLiuoqm1AAksRCXQS1q
 qsmXbXBa80/rnplvmldJYIASQTL13x9dhtOCb4rJSIcQlNKWU9xEM4mr2kktxIVTKY/x
 v4S8RhXye7xkQBRU4OZLFWJH3T31kTc9ixJED60wx0vdf5EzUzJtbBaZWNwF6ruRLndy
 CKbhyXjhC/sk7Dm/+0/xj4uAHMlaEqPHJSKYlRrUBYUc1TEDxuZ6RUOD8hAKvJzD4d9t
 3ls1CaKR4mRErd9101GIf5glzCH9a19U+uDLkL8N3/Gt9Gp7mEqPcZtrLf0v3iwTkbQc
 1IzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrufcBLLKNTvc4yVM7J+gHND0GbA4Q9HPJ+SS3NCzNfnSYBiFW1xfQzL+OiORAwXe3/q2Pq+Qb@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/gObaCHFAvbpzADn8QnB9aUxUnQ4S8teUCKAcjvCM/81hIqDU
 3Xjzi11l7ruzuhxNwuXOTsKmy057IKstnjr9oPzEUaFPwnQPgvxmcItJ
X-Gm-Gg: ASbGncs+2Ps83ng1mlqJB82IipqVOQdYQ6qut2J3jqVF29FdTxh6MOQzdiQ2ZdYmMHj
 d/FQI+b7BvWM7eED3u62rVszNJWN/z+0usjfcs7FNSIGVgIGEFf0IH9flcGcwXswSvWG2XC25OS
 F3a+4AMQkyu4gNGOSkxNow4n4hpRFx5GvlmwWYjz52JGRfRJPlRi/4F+ofzG/0VEECS6WyfRK+H
 eF4EXdYmMmITdJ9gCtOhcv2VV0KI+g4X8z+cYcUs8CuHpivEmZDjeujNovPq7WmBPO9xCwvg7OB
 BwayIszQdqWbPpFjHOGs4wy9FQtmle5hZWlkoXeBGfJf3HlsJbJF9fJ5uWto0bnXG1T7q7jLfXo
 serylrzM=
X-Google-Smtp-Source: AGHT+IGyPrHLryPORGsprOtDMijB7hbNnK12I6gc10XEvKh4YRH0MVHZxU7ZJO4C5upE0HZ9B5wtGg==
X-Received: by 2002:a17:90b:1fcc:b0:311:b0ec:135b with SMTP id
 98e67ed59e1d1-3159d8d6282mr22412103a91.24.1750691694156; 
 Mon, 23 Jun 2025 08:14:54 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 08:14:53 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 3/4] rust: macros: prefix variable `span` with underscore
Date: Mon, 23 Jun 2025 15:14:29 +0000
Message-Id: <eca1e3239800028ee7be4971fe10c145bd583913.1750689857.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1750689857.git.y.j3ms.n@gmail.com>
References: <cover.1750689857.git.y.j3ms.n@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:44 +0000
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

Prefix the variable `span` in `quote_spanned!` macro with an underscore
to silence unused variable warnings.

The warning occurs when the macro is used without any uninterpolated
identifiers. For example:

    // Triggers a warning: "unused variable: `span`"
    quote! { #foo }

    // This is fine
    quote! { Some(#foo) }

There is no good reason to disallow such quoting patterns, so fix the
warning instead.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index d05f60f55623..e6c36bd7f925 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -63,8 +63,8 @@ macro_rules! quote_spanned {
         #[allow(clippy::vec_init_then_push)]
         {
             tokens = ::std::vec::Vec::new();
-            let span = $span;
-            quote_spanned!(@proc tokens span $($tt)*);
+            let _span = $span;
+            quote_spanned!(@proc tokens _span $($tt)*);
         }
         ::proc_macro::TokenStream::from_iter(tokens)
     }};
-- 
2.39.5

