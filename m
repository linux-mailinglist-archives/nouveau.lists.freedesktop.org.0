Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E8CBACC7
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B29010EB79;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARZ1xTM3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C19F10E1AB
 for <nouveau@lists.freedesktop.org>; Fri, 15 Aug 2025 05:32:32 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-76e2e89bebaso1300348b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 22:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755235951; x=1755840751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lSopcLI3dVeo/3c4/pQ0iCsVLhFvEVu0yP3LOOzHlY=;
 b=ARZ1xTM3vU6ztC9h2v1MY2LBVzVFAk/aFx5ZRnnKjd/s4IriCDP9DJdOGrD3UuQ0PE
 Fa7UnK+zFeSJwyOF3Gp/M3t8bTFo0Thm6T7EtUbuujyOXprNJy6p+A45VJsxltDbEQQA
 4UPyzP0LZBS71smhqiNWRvM4XOaNsBoyxwHAuY4WSfzWJoSUnKKvghr/cqgSD6Pg9KCP
 gpauAUzrDmGrEEgM3eF408jRzpD5r9B2AVJGFKK7n4jVzewg3LTR5ZVh0ADQX1jCidIs
 rapZ0FgEUPuIpYaZvKGfvzjtwraB2Z5AZF2DBGnibzXwMX7cFpMvsABtYsqiTdzI4cBB
 wTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755235951; x=1755840751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4lSopcLI3dVeo/3c4/pQ0iCsVLhFvEVu0yP3LOOzHlY=;
 b=NS4JcHBwiscbO0YZyenpd5xkEN7Z3U82NBw46Ullut9WkKjcPENGz9AUDwfBdgXg6O
 kM1QlMNxvWKKuXBGh0TA4EvVwOM/U4m60WAtl9QCTVjzFtLj2ECLgM0X1DLkrVV6HaBB
 z6N7YJN6nUAtaC8ng3J2/95ac1AyNvSwY+yoNPVZcFRPkc4/J/eev4xlY76Pq/k1NzWG
 NPOfnIHHjXLDn1j+A5znj73LTCo1+UTTuJVDUxxad8YP0/MbR9S5P53x/kJsxCW9/8Fj
 LrJraXcEpyqCZ06myTLNuPvkJjSrzDbPXASgBvUiYwwv7HY4Dkrvc9bwPL404emVeMq6
 7J2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1RFa2mjeov0WpCZesEZTMpwtk0X/h+N8wphyVrjNPwfooL9ZM0HOdBA7mcNnNX5RCsqbSUOIL@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxobyKj0I2DMHJ1E0V/vnJVfvTHcBEF3JEihLFyzwS7TFTZmOTW
 xnbZmwRwA2Utxgg/6JlCcCW9vYdC46nijBqZptqdH+L1tWqLSod3H2JL
X-Gm-Gg: ASbGncslEAqklRDrx2mKltBYe9+pllappTl+/eBv/WaCYL8RJIY9rkKodi7/sMPBatU
 fX3YCENO9Q1TVxrbRUBXCWzqloFDNpf4a2LacbUKT0Lwf56TB1h0ThHXFkn3EYeD4Px0mAmPJ4H
 O/yyJLBG1bxHoZv1gHRfrYuebWaN5b4h62CUVTq4El50DFRl7kuElLOnlk4b5D7zZPVSHp+/fiu
 ZtsgQRH/hGH1TNF+NXODBv/MIcNZ4dG90AmYA0sT9grP3RF3YDIOpy2UN7Zhu6Z1YP0OGexvB5a
 xUmZ6bBouIdP/xKQ/bzBcG33gm9+MyIEXLuMKToDPR6oW8i1JILxwtCgIWg7AbyySLYdkqJyv4j
 nxEjWEURxN1uQ7Xy11o0JIqz/qbBSZ3Ky7ELXEao6DIA=
X-Google-Smtp-Source: AGHT+IEnEgL31QptJeXRJQyeWlFiXftFFWkzI6byVkMOjxMkpQiiFpcuDy0n02liiVDRtTpWNELp8w==
X-Received: by 2002:a05:6a00:180e:b0:748:e38d:fecc with SMTP id
 d2e1a72fcca58-76e44838c78mr1004327b3a.22.1755235951434; 
 Thu, 14 Aug 2025 22:32:31 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4556692bsm335234b3a.61.2025.08.14.22.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 22:32:31 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 1/5] rust: macros: allow conversion from `&T` to
 `TokenStream`
Date: Fri, 15 Aug 2025 05:32:11 +0000
Message-Id: <e349e0146bb4085b04245253e5e17c6275e14e31.1755235180.git.y.j3ms.n@gmail.com>
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

Implement the `ToTokens` trait for `&T` where `T` implements `ToTokens`.
This allows users to use the `quote!()` macro with references directly,
avoiding the need to clone values.

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/quote.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index 92cacc4067c9..8a89f0b1e785 100644
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
-- 
2.39.5

