Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AABCCBAD85
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5150410EB19;
	Sat, 13 Dec 2025 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9TRTGJM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3410E1AB
 for <nouveau@lists.freedesktop.org>; Fri, 15 Aug 2025 05:32:37 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76e39ec6f52so1205485b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 22:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755235957; x=1755840757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QXSg086tVDmosf88eO3jx6G+rWDU/dGxOYa3gmyNHdQ=;
 b=Q9TRTGJMmG7nxPiilG5yuJaTLfKzSlzyYGK7leGEQSNFjMdE+2FxxiqYFU8LYPFZ+5
 ATQr17tyc1fMigvN5zFG4VVDU0eU/2iyac79Kg1Oq69A231Alwfifj6i4vLr56d2Px98
 72KtveReP/6RCzmUx+bMRilmIorxVea4G1F14MSzlLJxZl+Kx6AjO1FRoYVnQIqzhL+/
 Wpec/OBx8mD15QuD7MHpHQKJ6VJHfakZiKt/iWaiRKxi26YGkVsQP4WkIgZF7V5fShNw
 RHC3Z+Y3JaAiWONu4TO6GEBcJA4D0zhTHSuVJcvGk3z+VJjF7TMln+L/BNJQBYGL4Ns9
 q4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755235957; x=1755840757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QXSg086tVDmosf88eO3jx6G+rWDU/dGxOYa3gmyNHdQ=;
 b=d1FbY2V71jibbYbQW0rWom2MJ9GAm8JVsmLpS70yg6Vt430fWfeA2iQgyPxi9sbDKO
 9weX3xk7Kvt3XhxQ4y6p0dOWyaVrJRi1plMFVBBImUz+UCvIeBrNnnt5EdlfqHG8nOTa
 Qb4Q2Vwnq3Fk83IynCo0bF3Kw+f9K/3PoEP+VswJ4T86fskaQ6gKppmcHq52lveLG/1+
 bF5wN7zVuCeLDlSFKIFruO+gZRMJJqoTZW6UnVZkDZ0XG3cyY7z/Wv9Yx94u/KAdZXIb
 SGw5Z2pHwHtr3L4bLmJuxfASuz0qgzpv6Dwt2pjSVl1KQ0wifwoamryouP5nXT/zys9i
 9gUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAmFLEhfY7T3q7gDNkITaEkAm7SOE9t5o8/YueyJPnfocdv3JhGgbk7y03Z+PcZsVVHTeAAdre@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeAcnGlwCFiUbFGTXnvlEObilCOza6CE+bURjTc8stC9h7Cuko
 rMdCz4cNBSBBZYrhqR9NYT9I5SMADoqzuMgReQfTXZhYwFvUh600L0i/
X-Gm-Gg: ASbGncshY1AclNEMqjwgcybP8oqaORP8QjonpP9Nqsv9UueCXm4mxAGIRYBxa5Ck2lH
 KYgwx9y2yLb5oaIHTuf9FATrUULAqSprleyAN32cI4WVfUfY8HLqJsQD/E83MRkx8Y89Xg8hv4l
 KRCSXIbT8ZWfZLps+M1n5hpPHNMgcLtsknxuP3PwU8HRJooNxAtsnxfViVhDq55yvk6ZjIrFklA
 XEAv/6gfHdL4UOGzSMqASvTLJ2LtLz0p7JtBMYYPovlckXt3eCilqWWdMP0R5JBkGzyQ+htkw9J
 GlUs1AGhYq+hyHeEODRoxQvzwYWQhOXzBEYNLhVg0QIdNjQgXqkux3jqVTC45kb6nzziAehOYd+
 5YGhF12Hr55feXQmcRkeOYEd6rge1yhCojB2c4OkhUB0=
X-Google-Smtp-Source: AGHT+IG4HU8MP0xJ+330waF1yTeFRAjq/5O+h8g/Lloz/jm6OtLbcslz6UUMOu+0mWZdRzPENl618A==
X-Received: by 2002:a05:6a00:14c8:b0:76b:42e5:fa84 with SMTP id
 d2e1a72fcca58-76e446ee0afmr1193988b3a.7.1755235956849; 
 Thu, 14 Aug 2025 22:32:36 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4556692bsm335234b3a.61.2025.08.14.22.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 22:32:36 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 2/5] rust: macros: extend custom `quote!()` macro
Date: Fri, 15 Aug 2025 05:32:12 +0000
Message-Id: <948a28f26a0e9924d82eb1d8d377e3ddc7335b24.1755235180.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1755235180.git.y.j3ms.n@gmail.com>
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:45 +0000
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

Extend the `quote_spanned!()` macro to support additional punctuation
tokens: `->`, `<`, `>`, and `==`. This symbols are commonly needed when
dealing with functions, generic bounds, and equality comparisons.

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 8a89f0b1e785..24764b04a07d 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -150,6 +150,36 @@ macro_rules! quote_spanned {
         ));
         quote_spanned!(@proc $v $span $($tt)*);
     };
+    (@proc $v:ident $span:ident -> $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('-', ::proc_macro::Spacing::Joint)
+        ));
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident < $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('<', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident > $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('>', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
+    (@proc $v:ident $span:ident == $($tt:tt)*) => {
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Joint)
+        ));
+        $v.push(::proc_macro::TokenTree::Punct(
+                ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone)
+        ));
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
     (@proc $v:ident $span:ident = $($tt:tt)*) => {
         $v.push(::proc_macro::TokenTree::Punct(
                 ::proc_macro::Punct::new('=', ::proc_macro::Spacing::Alone)
-- 
2.39.5

