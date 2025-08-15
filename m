Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3492CBAAAA
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEB210EA69;
	Sat, 13 Dec 2025 12:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRBHMhdX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C0910E1AB
 for <nouveau@lists.freedesktop.org>; Fri, 15 Aug 2025 05:32:42 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-76e2ead794eso1436547b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 22:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755235962; x=1755840762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ItkcH2oOrHmGXKS1kIzQCIhIchwgBZlnH8595tjW2Y=;
 b=bRBHMhdX2gk2QPBv5ZxlboBlTsi9cg810W+n0+8dEa02ccdg7jUF+/j4hY5YXhdG23
 2N7R0vINonu/ep7vgUWYgLtmPqyZs6AVLvqRcP0lm0zQT/DIc0V0/751Whs0MSO+DAgS
 Q5K6jytZS06DLA1QIXRMMTlgxcC+xdOhYOsgCXftIHa5UP+abEdPWwD5a9+t5MGuJYf8
 DcaRz5f8ioEVaMk5krwEpTjRw0xnvYNTCmF6zYRRVkECCnZslD2W4uCZdlkWV0h9jw5z
 Ml6+E0cgAoRPgOtHqEK8g+My6+HdlMPuzB1XjUhIqkl4N5ogaX5pgzgkBs1SshBdE2Do
 RdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755235962; x=1755840762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ItkcH2oOrHmGXKS1kIzQCIhIchwgBZlnH8595tjW2Y=;
 b=g8eIBb6Rvu7sXHvhcyEULSVBoqvPKCfRz2SoBCL2yQa8se+ro8piE76qQx8/ZIxSgh
 9k2YSHg1kXLkPcBARmgA6eYH9t+RKf83JsxuRxiww2k3EgfcEma1AV50ChiKdpOCzyPy
 dBm1OqaQzjqCB65jVINfZGIunGyj3YX/lupQyPbmzeLsCL23bJYodChjLX4vdBHx8z1V
 vDTgjvPf4Y6V59BISN+8nBdU3oCiUF9X+xD6jaWHjc74JwGNT7e0vCuSIPeEHwCcI1Iu
 /dUixYYct5IhMJIpaxpV4riOFwYe6jCcdoJG48Ip8waYswQH8DXUbyJHJeecl6FkdCOx
 Bd4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjLpZHTDRtmGjd7ZNuNpAoesr7VtQraK6nfnScqeaX48iXVIr1RBtxwrfy1rCEK5VmtOREipth@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb2XYcVNagdkn95sg2PZtaRnkgXGa722jHjejPaVAp2YcDwzQw
 +GFRG1nwD38ok99q6eAgazXDpIoA6d83trkOevf7CNkDww5N3Q2/DNfRTfL/YQ==
X-Gm-Gg: ASbGnct++YR+YkswwWmDipS3jfWa7M8DY0zEa8FOetZvZlGM6QZmGAa/mku9ZSuy9oY
 D8SGZNYA316yvO08qdT69906mLcK5RGcm67KrBB2UkjFW5cQavVb+KPVP5nFx8x0z0vc8953O0b
 IYgFNIs5imQmjseKnkkKZrrhgfiYJAUj/k3pcwQjwLFzXZAOl52Z3GhobaGZ6TB9ilVtAs2qoJ5
 rdOkb8c/e3w3MJmiWmRO/gR2AaEIDR6xekeFUOd+Zv3y6SdaYeEDqeF3OV/3RZb7eze7HJoTgVs
 cHpJF+kSB2dq/piNdRotTernEpSDxjXhS6w6YDHZHSCHcMjExP5fU9QqhzBbFaSC0QcZE0y/cK3
 WPhEO1OwzrpvCf5muBz0U6IqdOfNt9oPMSqAWPxQw/bz7ROMz2K876g==
X-Google-Smtp-Source: AGHT+IG6RpS5kBDo1uNCaTTuFsahy7gN7SvHmXtqbjLO2J8QO2AfC+R3FC64Kl85jAXYtBoEFXRCqg==
X-Received: by 2002:a05:6a00:92a4:b0:76b:fcac:f2ad with SMTP id
 d2e1a72fcca58-76e44847105mr1187592b3a.20.1755235961994; 
 Thu, 14 Aug 2025 22:32:41 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4556692bsm335234b3a.61.2025.08.14.22.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 22:32:41 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 3/5] rust: macros: prefix variable `span` with underscore
Date: Fri, 15 Aug 2025 05:32:13 +0000
Message-Id: <1455d8540acc62ad3acc1dd8ead71b1ad38935da.1755235180.git.y.j3ms.n@gmail.com>
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

Prefix the variable `span` in `quote_spanned!()` macro with an
underscore to silence unused variable warnings.

The warning occurs when the macro is used without any uninterpolated
identifiers. For example:

    // Triggers a warning: "unused variable: `span`"
    quote! { #foo }

    // This is fine
    quote! { Some(#foo) }

There is no good reason to disallow such quoting patterns, so fix the
warning instead.

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 24764b04a07d..75367a93e0d3 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -57,8 +57,8 @@ macro_rules! quote_spanned {
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

