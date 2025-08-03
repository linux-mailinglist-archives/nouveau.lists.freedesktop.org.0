Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD7CBAD88
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6962E10EB2E;
	Sat, 13 Dec 2025 12:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf7KrZio";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052D110E00E
 for <nouveau@lists.freedesktop.org>; Sun,  3 Aug 2025 14:21:37 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-76bc5e68d96so2753743b3a.3
 for <nouveau@lists.freedesktop.org>; Sun, 03 Aug 2025 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754230896; x=1754835696; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqYDYr0tBuZpHy7d+0t7MzRWJjDlIyRDeWJHNv8j1g0=;
 b=Lf7KrZiofk3VVv5T8xrBw+znu2ibBkZBzk6eMBXYqyzrrU3poUqnD8A6tnCY7wgPGT
 SrUU3rjExnvWUEMgE5uZNP4039HdYUMnEluSjByjXROG10JuP4ycWTZlhb4aDloNEoh/
 R2iLqb9zq0pSi3ntjRJ9qQocpxNFiWkIe7ZEE+7oL+JloEoI7rjih+q0NtAfYPMNGjZ9
 g115HpnPrt6X8y8NUgkZuPEaO3PTbNHb3x97hCu95dp0c6Wl1bO6TkS3hlUA+udcIcMv
 uCjINr/CikcSLFjTEf//wTBPU3eBRQNCw24eW4H3oG51p8H7LdgohsrZk2PLnET2E63Y
 oo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754230896; x=1754835696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqYDYr0tBuZpHy7d+0t7MzRWJjDlIyRDeWJHNv8j1g0=;
 b=QNTyVIb58WCdREdNTPngZ01zHTNjbpxBwquSedRCJE7/yKhVJODB7GS40dlNy/XOUy
 ajrtwNZgwT3pso210G9t88jquhksd0iwZvq8v86a4cXLfIeIZVOXbLBIxVRvIJxl11Qn
 jIYT2oaf0UdoUJzsz1tTqzxE2MrxQ//f0NvTIHil+ltwUExteJ4UJ4FGkqQwgWce0aOQ
 6flnZpbQk4KfB4bc9UEtHJBXtwk2N0RrsP0H29hWr+D24MXE2w6dtVoTk1XlfAu52T6Y
 QKbiZ/eQv7DVEgGGDkRsY8K95MVpRiQrp9UzOPTR1Sep4L2f8UkNe2+VmtuN0sQ1guHp
 biyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuXXc+J4xXmQHyav87cOW4UHj6OBHPVJ1yIm1coqbG5g5cOKrkqGRHF5qS8x+vFhvseIYz972X@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYuBWrtgidcSLiTIt9YmlM6wpKwjojYlP9gW7mdCQhTxPAIVPs
 O3fqKd1eSXtXlC/62JrnRvSDoaaGChY2G/+N2cVuxL+8bBfthuY7/T0lF+EjTLof3fI=
X-Gm-Gg: ASbGncvW+82xy2tXft3+0eWGJtYXU0CfV3DqyyAfwn8yHJ0Ptu8hBpLpZqcYAmRyhzk
 ukhTgfADDSghIcwfWEwOie6zaT2hBi/KbER6bMvH7SwhPjWBY00UVs0ECeH/hOlzq2GfcCt7sOH
 fLeLv8LLGYCi/WIjPpXdP3Hj/8w9yZAMXvS/DpFnOMu2vQxXYfAvTH5XxEHsIz4UO4WogLp+boe
 DBFcPd9fwFEWBV5gTHu5zkJRJR0wl9lulZsWQWYJrwnABn4vOh+Wjq7EDm2Ch3+aycICU0fjFaI
 C6HlxWkOdT1uJGTTmv6u+S4QFnHojGhWfuV28X1oWl7qBWja/QaqKAy6qFU4FTb5t7bojo0n9ho
 lz9frKpO4FOLzdb8HGI8efdhjC8+QJr6PlQ==
X-Google-Smtp-Source: AGHT+IEhGtCjS9xv0mGVzidB/Y10oRyRYka+R3Bd+zYx80YYBNp2XSW4Qe16PVuCeuUmU165+yjKfQ==
X-Received: by 2002:a05:6a00:3993:b0:74c:e253:6c83 with SMTP id
 d2e1a72fcca58-76bec314a45mr7544823b3a.6.1754230896381; 
 Sun, 03 Aug 2025 07:21:36 -0700 (PDT)
Received: from localhost.localdomain ([104.28.217.213])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfd0279sm8431306b3a.98.2025.08.03.07.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 07:21:36 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 2/4] rust: macros: prefix variable `span` with underscore
Date: Sun,  3 Aug 2025 14:20:52 +0000
Message-Id: <797d4e9577c8cdd219cee879a5cb2f6c25006b32.1754228164.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1754228164.git.y.j3ms.n@gmail.com>
References: <cover.1754228164.git.y.j3ms.n@gmail.com>
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

