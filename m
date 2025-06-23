Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF26CBAD8B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B6C10EB42;
	Sat, 13 Dec 2025 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xfx71Rwq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9660C891D9
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 15:14:50 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-3141f9ce4d1so3908479a91.2
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750691690; x=1751296490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WxVvDAMvkM375HX/zxtZMIQJuoJ7i7/DvaZjzOiyFTo=;
 b=Xfx71Rwq31yVsZjxmwvVPah6Kp4vN1xvERuZKKCsdgWFBs9vTmNNoTtjPqf2fq94YP
 xlVmtZo5Gc+1cynDiPev36hD8c/gdBDxbil3cDulXuytMYCnkkdGDaulXKnkw5YQquik
 mGenZKlTW+sJNn0VrW8EvQAiXRxaKSAWXwPT4CJI9ztj+0JM5nQ2WVVRTLSioEvuHKy0
 60cisX87guKsKyjPLqJVulfpta4lFUNyXmQ6QpWZysarfQC/WVHzcOd8AkQW+x4hAitB
 KLZsplurYmfmKwQKAhlNvL8KImsl8hM28FPF8+2pmXpUclzQD3lxMjshZeqJwrFly5+R
 xHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750691690; x=1751296490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxVvDAMvkM375HX/zxtZMIQJuoJ7i7/DvaZjzOiyFTo=;
 b=uBTXxaB17PG4kY/eckgtgBhyT19ReBds9skoM/OC+P3Dz7asMVr4hmN+boM5LilYe5
 A6HUx8ynEmGLJrBc8z8dB67Jy5Noch1WcqitB+Lh5DCIJ4znpOLCc133m7/mNABQkP8g
 7G0hcL7uGGbF942blsS5ljfchDB4vItGw8P1oYMRu+60iGSfkfnmBlxiAzLCvKLLvHFW
 11GWU0sUrcMMICdBGYsRjewJafDPyO/O6qM+ujBvw4I0YujwsqQQ4Bf2NnWM0YfAJmPI
 DiVanAMyK/GT8fXpN46JUXtPZYM7QY3L3f/epEbkB0l0LxPLDG3kM6cTbiqBPGXt7p29
 p+Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJjPC0zQcDWvGQJWAzW6mp3gjxljycQ9e8CgUeLEInOypXtHOmxqGDnLwhIpUS020unKMFwoPi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7f0MB1EZr2KG52s7nB+Hr5bMuta5PcdW9X7gsuUwOJpnDLss3
 8ubSC0i+Nd1NBalIdJYFQ8yyKb5jdov0huK7CNNmj+14Q8f4og3GjmY0
X-Gm-Gg: ASbGncsStBYloHK/tH/7bA+zXT8iyrJAoraJ/qwocNfVeIs+5DdmJt3Xk+U88UCRHml
 zVUWCElFw4csmaW5oRt7AVwPBxsU+0MMeAy6xa56FgUGXpU7Gcvh75aZwHxNog0WBGCoNiemVVv
 R310ictLMrDwR2zfAX/cn9tclteMj2A/DMKIB/MxkPZzf21eyCXlffAnMLftqdtmhqdkxDWgLa4
 jCvPITILO9H8tDYe3KslGYxdiRKfYnWZNDrFUSHk2A8iLw1T/w9E/lcpw8XpxdikApgVJlGUOLR
 LjysZyne2+xnKQadq2TX1QMYnelYf3ae2+e/P6jntUHkEbzfOSIXoud9TC87Aott+hQlMa1cOhr
 aZb0a9aM=
X-Google-Smtp-Source: AGHT+IHZ6b3VUpDC1c2zoZYui2q3WO6oIWeoRkRFN9suemWLWo9jP+W3JOYotkgd1zwMLlo2zWW6Rg==
X-Received: by 2002:a17:90b:574d:b0:312:e731:5a66 with SMTP id
 98e67ed59e1d1-3159d624244mr19128362a91.3.1750691689838; 
 Mon, 23 Jun 2025 08:14:49 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 08:14:49 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 2/4] rust: macros: extend custom `quote!` macro
Date: Mon, 23 Jun 2025 15:14:28 +0000
Message-Id: <f75b20619c4269edad12ad826caf83ceeed89dbb.1750689857.git.y.j3ms.n@gmail.com>
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

Implement the `ToTokens` trait for `&T` where `T` implements `ToTokens`.
This allows users to use the `quote!` macro with references directly,
avoiding the need to clone values.

Implement the `ToTokens` trait for `proc_macro::Literal`. This enables
the direct use of literals in the `quote!` macro, which is useful when
emitting numeric constants.

Extend the `quote_spanned!` macro to support additional punctuation
tokens: `->`, `<`, `>`, and `==`. This symbols are commonly needed when
dealing with functions, generic bounds, and equality comparisons.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 92cacc4067c9..d05f60f55623 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -7,6 +7,12 @@ pub(crate) trait ToTokens {
     fn to_tokens(&self, tokens: &mut TokenStream);
 }
 
+impl<T: ToTokens> ToTokens for &T {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        (*self).to_tokens(tokens);
+    }
+}
+
 impl<T: ToTokens> ToTokens for Option<T> {
     fn to_tokens(&self, tokens: &mut TokenStream) {
         if let Some(v) = self {
@@ -27,6 +33,12 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
     }
 }
 
+impl ToTokens for proc_macro::Literal {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        tokens.extend([TokenTree::from(self.clone())]);
+    }
+}
+
 impl ToTokens for TokenTree {
     fn to_tokens(&self, tokens: &mut TokenStream) {
         tokens.extend([self.clone()]);
@@ -144,6 +156,36 @@ macro_rules! quote_spanned {
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

