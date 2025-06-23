Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CBCBAC4F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D38910EAB9;
	Sat, 13 Dec 2025 12:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLtGbtHy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D189891D9
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 15:14:41 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3137c20213cso4340774a91.3
 for <nouveau@lists.freedesktop.org>; Mon, 23 Jun 2025 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750691681; x=1751296481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJl0bofvsCNb/IhdYpO8yEuEs+fLAbcokn6DAhbWI2Y=;
 b=VLtGbtHy/RBOv61a2DyJ6EfmrXrNsHwRKH7JYgYDXc8iRKpJOGy+nCFeOrGH3TgA7X
 jQKvjyTpOdZCc/xey37GAIdYrI17L/USf8K7TRwKURYhYIyKE3cYdEFr3JoWP+HJCs/j
 cuBHX3knpP7miSRqXEp+SOIj4pMO1dEMHDvDg6IOwSMRsjKDPn8K0gKTH4LdClYaQYZv
 C0FeU5PKje3yYIUfYK3RVR7HWkuNzXnh5oFz85G4/3gaDf6ghm0asvYTcMBt0CpFipkQ
 UwcM/PoBzMO2/2DzJiSki5qF570ssgckBxzMe6Wos7K0Eud9mOuf2c0iS58HzYB02CMs
 AL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750691681; x=1751296481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJl0bofvsCNb/IhdYpO8yEuEs+fLAbcokn6DAhbWI2Y=;
 b=rpj4/9ODI60geMb2plnSo76EPCs06buotTTa0YSobKIZb2dJF0DTuCPIvoU5n1YUvg
 bRE+BrXMpRRtCUOqtqqUF0MMvMUj7XwBPFq4RKRrnt4kU2iWKiphYz9s9S39JgqrJU/a
 aCY6q0+mpXHP2S99ffXSKDA9/jEFbqvTRzDPj2Zn/rIRTjNEKVZQIQQXn+bFNEg6fU31
 DLnRvtFGchQl2P6akNELOw6/Se/jzLpkw2vk5f3mfU61VSQAMV7NBAFeZepaa1o49KEi
 tg6yksFd6G2UbsfymgEVIJy8AlIyPVRwzZ6XGwQAFSHGcqa9R+FTVwQmCrX5lqp6j7Aa
 gM9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgch1SBjMK3/BUC9Hr+o6i5IgEr8ll9pPIpD03XMz+P4K8DfNF203esAh9FmO6mbpvIUfRIq15@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRkicrc4k7qzz+GoXjT8Zp/EG0YL24up5AaBGF4Pu/23cC5JdU
 4zWF+DKigLleXsGmJrK7uqwLnCs3qW0N+ZAnRQy3aHqS/RWH2R7fLD9i6StXaRq52mQ=
X-Gm-Gg: ASbGncuXfaPcEqyW6rt+Y/z7tfHlPYXtoql+f43JYC14TVUTb1vcvmhW4W7bL6gzctq
 pwvna2dI3E1EWtviNkJx1PUb5zLLIn2foFggu0yGxp8JIdmru41RRryXZ45hbwMUSDGa5A9s0Co
 javhpHXeQdAvQH16FbplEgeLa23uQVOVoCkhUQxLflb5hMxA2tFKi1cOZ3jYUqE5jCaTXtTYrGv
 vAgyxlF1uIHvkPC9LTVHBKQCsMC5hTYLhaOed+zEF3YxWJpqP5r+Jf8EJaklxY4Q6fYc+iRzZCd
 /MC5Eqp/qsWxSykd9eoBVgULbFJTvuzoQ3QE4SbO4nzQ/t9h0xmqCYqfhSDiQ0co7WVR7r3kT7w
 v3YiJmds=
X-Google-Smtp-Source: AGHT+IGKsva6kVgzg4Cok11z5b+GUl9qeuWFMNPVQGJXb1rtZHDejue9tGLjW0VLzgTh0jN+h79VWQ==
X-Received: by 2002:a17:90b:3d50:b0:311:a314:c2cf with SMTP id
 98e67ed59e1d1-3159d8f7de2mr17582857a91.30.1750691681066; 
 Mon, 23 Jun 2025 08:14:41 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 08:14:40 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 0/4] rust: add `FromPrimitive` support
Date: Mon, 23 Jun 2025 15:14:26 +0000
Message-Id: <cover.1750689857.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This patch series introduces a new `FromPrimitive` trait along with its
corresponding derive macro.

A few enhancements were made to the custom `quote!` macro to write the
derive macro. These include support for additional punctuation tokens
and a fix for an unused variable warning when quoting simple forms.
Detailed information about these enhancements is provided in the
relevant patches.

While cleaning up the implementations, I came across an alternative
form of the `FromPrimitive` trait that might better suit the current
use case. Since types that implement this trait may often rely on just
one `from_*` method, the following design could be a simpler fit:

    trait FromPrimitive: Sized {
        type Primitive;

        fn from_bool(b: bool) -> Option<Self>
        where
            <Self as FromPrimitive>::Primitive: From<bool>,
        {
            Self::from_primitive(b.into())
        }

        fn from_primitive(n: Self::Primitive) -> Option<Self>;
    }

This is just a thought and not something I feel strongly about, but I
wanted to share it in case others find the idea useful. Feedback or
suggestions are very welcome.

The original discussion of FromPrimitive can be found on Zulip [1].

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/524427350

Jesung Yang (4):
  rust: introduce `FromPrimitive` trait
  rust: macros: extend custom `quote!` macro
  rust: macros: prefix variable `span` with underscore
  rust: macros: add derive macro for `FromPrimitive`

 rust/kernel/convert.rs | 154 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 rust/macros/convert.rs | 217 +++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  71 ++++++++++++++
 rust/macros/quote.rs   |  46 ++++++++-
 5 files changed, 487 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/convert.rs
 create mode 100644 rust/macros/convert.rs


base-commit: dc35ddcf97e99b18559d0855071030e664aae44d
-- 
2.39.5

