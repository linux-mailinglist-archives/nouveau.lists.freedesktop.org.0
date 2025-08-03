Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90ECBADC7
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9771910EB24;
	Sat, 13 Dec 2025 12:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj/cAGbH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A4A10E00E
 for <nouveau@lists.freedesktop.org>; Sun,  3 Aug 2025 14:21:31 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-76bfd457607so244411b3a.0
 for <nouveau@lists.freedesktop.org>; Sun, 03 Aug 2025 07:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754230890; x=1754835690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=114e6dFe36rXGszuWHRDJN4O+b6P/WGKkf7Q+pRcpDg=;
 b=Wj/cAGbHClp8aT6azNo5/u3gnfjRv/QnbjUk2qnRbuycI3dJbufSEyAi7MX/eIlIJz
 wFSycYwz58c2/r7rTdw96yPJmM+yiX09MfZEnYOnPG9KQKjX9wtbDJNjudvK6AmWwwSH
 i9BWuD19Rw+7Js6HxLGIgINHBMo65fxcAv+sFSb2dDuXjx55DkuT35lSH7d9B94DmHdC
 x0EWAXycR5hIgMYSxxRP9oc7F9JlbNOrQsn4bZyoGV6t4Zfgu5VifufF49SJS+AmLw61
 FlgOY+8z8QfRvN38HF7XvYSsTp/WLbw08D9hk0MUTMamEAc8X/Yq+wsi6dJiIUCmOKj8
 1EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754230890; x=1754835690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=114e6dFe36rXGszuWHRDJN4O+b6P/WGKkf7Q+pRcpDg=;
 b=OsR/1dVnOfLdVeiUNbKExvFafeG40etFAawTdETOgRPACViPSIq7weqoj/gzNspsr9
 LecfyJl4zJ4m44jkpEqHv5AcIyIKeMLKn8k7fbF7w3NXjIJuhJorAFJBtnhZBFXAbwlo
 Y4eBOR0zk+y7/h2M3DfJWrSX/r61wyIK0R+rtnjHf7bGGSeyhCwcMfPjMd/1ColY/2Jo
 Icn9H3sLJUytDbhcULOWcTreDCOIogcbeeLlGT30/4eyztQ6Hg5YxKGS70a0PatU5gwV
 ey+Glqbtso/Z5vZawSqyEp3JkR+5tEb7EBRdA2S5tElSUC+quUKzktuFA+Z2fs2zuSIN
 3t1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEqlcJQUiJWlA5QVr9vEzAk2Gj1J8H8aXAaSbkmTxZb8Bq+byCyAquMU2Hswu0lYGuN3EyMdLy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfSN6Ra7krxLOu4RrgmZbTZiSvh0jhtu1OD8/exihFkFMS2N25
 z7C3/32VVxKEn5OOZO7Lp9Gnc2GzyO94uw3zBpr+dsGnUShoO8FTRBNp
X-Gm-Gg: ASbGncs7K2g3scZw3udBcFVRaOzE7mjuc+ETF6MFzKvna18LSi9FmTdX3d0BREna19T
 ZACriZ7FMlb7HwaRNlIUZghKoNdy6hily++Ru8PsbOFaT54AXG8q44+R+xlAFCwNN9vh5EOoDyY
 2Caubl9nzQEcavGZueV8RHbG4l2EPM575CUYKlu5lOuWBZXOa5h9KxeTlMzS3pK5Ld90sx1Jq1t
 hCEzhjJEiVtI48R7pm9p5sYyIbELj62Ls6Jdbi0zu0e5JSy5bZLvgRNrgXq1X4EsXBaHcaXzzAc
 Jell0mn3wFy8QPPAXGQPWQGdENJtNAwuaX7ji4mxycnUC+nXxRxRg6QAqlvEitJYMrbc4nVt/s1
 4ime8VHrQo8mh8WqVk8LBvpqcHdyiXew8/A==
X-Google-Smtp-Source: AGHT+IHKX7auywt4u3zIKgU2fIOKGxq02XNCOJ7Xi4MWV+Fhm3m6UNnqEL+P/ENvgfCJ4sKMDzFRxg==
X-Received: by 2002:a05:6a00:1884:b0:76b:49af:eceb with SMTP id
 d2e1a72fcca58-76bec4d1ef6mr6004641b3a.20.1754230890481; 
 Sun, 03 Aug 2025 07:21:30 -0700 (PDT)
Received: from localhost.localdomain ([104.28.217.213])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfd0279sm8431306b3a.98.2025.08.03.07.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 07:21:30 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 1/4] rust: macros: extend custom `quote!()` macro
Date: Sun,  3 Aug 2025 14:20:51 +0000
Message-Id: <c9637a605dd718ce25311c736d208ac9ecff18ad.1754228164.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1754228164.git.y.j3ms.n@gmail.com>
References: <cover.1754228164.git.y.j3ms.n@gmail.com>
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
This allows users to use the `quote!()` macro with references directly,
avoiding the need to clone values.

Extend the `quote_spanned!()` macro to support additional punctuation
tokens: `->`, `<`, `>`, and `==`. This symbols are commonly needed when
dealing with functions, generic bounds, and equality comparisons.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 92cacc4067c9..24764b04a07d 100644
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
@@ -144,6 +150,36 @@ macro_rules! quote_spanned {
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

