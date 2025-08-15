Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E12ACBAE0F
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4C210EBBD;
	Sat, 13 Dec 2025 12:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLk27NuC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27C710E1AB
 for <nouveau@lists.freedesktop.org>; Fri, 15 Aug 2025 05:32:26 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76e34c4ce54so1209298b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 22:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755235946; x=1755840746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tj8alhnC42zOgdWmbReIStJyeIvcsx7DOGYTDPXIH3o=;
 b=hLk27NuC4mznhMaNo1gDrZ+TI7CQktGlP7hP7eR40lXs1GgqpF8X06Un5kSVwrwetP
 j2Ulz0A2CQHHvajo8EWb6oUW8Xm+Q1e/89fOjOK2HQiRSuThhxlUTVl+aD9etzqxmH4j
 jjBVLyHfiDH6oaPgUNHc1MGkDFpcqHjx3EGY1dCdNYClV5JNeO8Q1jPdjQraMjQC8Vv/
 OC/1Cp7FoVCBri/JXk5mnJliT0iRl5WzG3CQ2x20wr8zMr/VOU63RgKEyEvNTLmXcwtb
 IsO3E0Prxw+X9Rrx140f5qWwiu0qTsr3Esrl3XPDJZ1u4iKVse/93gyh9PqUV+Lr0qpf
 BLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755235946; x=1755840746;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tj8alhnC42zOgdWmbReIStJyeIvcsx7DOGYTDPXIH3o=;
 b=abFNvlMBRSw91o1xcii7N8A6fAdhBIUfbsGLr7ECCzEECCvZyGP3+AKnLai/rJGLY4
 ROMk7p/VNwqOQUGq6RiAa9td4Mw5VuIOrLp6qnSGG8H/WzlCzI1vDws6lxXJq7cyMPy8
 Y/ig46TIlhguPKQo4sCJfg3B9Mxo4xFBL+MXyx6+0a8WiOzUvDacIHyj/1RkJTRKzLdH
 PBaWN2YCKA+2Ca1T1ZG20NlMVRtY0RIMdELIzz54+Fd+USwP5WElK1dFNDaEcfnk+YyK
 mP/Ch8ehrshAvHJiG40g6JsAUoqnIsw7EgO3ckm/m/ifaXtSYtEvCGTysUDfcb8R0mi4
 7f6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGTY+1PZJd0kU1AV9rK1cQFZd5RctPvFWEI69ziXO+MYS5l3uj2d62lUlzK6budfVBosZ+xiek@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUwHYJ2qJ9gOo2EPVBOkstjiBGU0QHy6+orXjZsFcPqdrFubsD
 ntcjzKS69dvp/Zl6szWIowarrm7WhE7Y2QUogOakdJzIIRNOiKtlZVKzTzmCl82P
X-Gm-Gg: ASbGncu4iGHMhxorArXg9JoqtN1H3XaqVioUNGuJYjQKa3xIn5M/Zfy6o+PcPwBsRJW
 1EW5jVAZbrtqNpyPFkCPUtCRBwWA/nHp/f3eCNFHbkuIKfwwJBnWdOWtaTL3IoZZW0VyVGkQR5b
 ie7nvPkVZpNqTReib/Z1ummXRpZzl0hPb4tH0rDGsWshNpVpNpY59ErKdqQ7Xayig6YN2gqoAl5
 RUJcGpjeXhXaGHwkVclQnsY/E9TGGEQap3hJwNOvLMxvqMCsEf34quVNhRqvJlTMpwLU8SgcQvc
 +ZMvRchejoOmJa4W0gRfY9Bxzyz57WIOogNAPPEe2uEtQziHtLt4Qs460+B16bjCSsR0kDEM3Iq
 1kemykjeKzYQIYYveFmd1mVnxWWT1D52xeVYssPoOnUA=
X-Google-Smtp-Source: AGHT+IFCsRaNxSKfgdKIzJGdC3kmDJE1saL5U/096QghmpyQmx94QRHF2hQOXKrFPWiqlWYXXcOugw==
X-Received: by 2002:a05:6a00:6f1a:b0:76c:44b5:4f62 with SMTP id
 d2e1a72fcca58-76e320e4f97mr7429186b3a.0.1755235946165; 
 Thu, 14 Aug 2025 22:32:26 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4556692bsm335234b3a.61.2025.08.14.22.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 22:32:25 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
Date: Fri, 15 Aug 2025 05:32:10 +0000
Message-Id: <cover.1755235180.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
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

This patch series introduces derive macros for `TryFrom` and `Into`
traits.

A few enhancements were made to the custom `quote!()` macro to write
the derive macro. These include support for additional punctuation
tokens and a fix for an unused variable warning when quoting simple
forms. Detailed information about these enhancements is provided in the
relevant patches.

This series builds on the previous work [1], where the `FromPrimitive`
trait was considered too heavy for the current use cases. In response
to the emerging need for functionality similar to `ToPrimitive`, this
series also implements the `Into` derive macro.

The original discussion can be found on Zulip [2].

[1] https://lore.kernel.org/rust-for-linux/cover.1750689857.git.y.j3ms.n@gmail.com/
[2] https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/524335626

Changes in v2 (no functional changes):
  - Split the patch "rust: macros: extend custom `quote!()` macro"
    into two separate patches.
  - Remove unnecessary spaces between tags.
  - Use a consistent commit subject prefix: "rust: macros:".
  - Add Tested-by tags.


Jesung Yang (5):
  rust: macros: allow conversion from `&T` to `TokenStream`
  rust: macros: extend custom `quote!()` macro
  rust: macros: prefix variable `span` with underscore
  rust: macros: add derive macro for `TryFrom`
  rust: macros: add derive macro for `Into`

 rust/macros/convert.rs | 361 +++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     | 239 +++++++++++++++++++++++++++
 rust/macros/quote.rs   |  40 ++++-
 3 files changed, 638 insertions(+), 2 deletions(-)
 create mode 100644 rust/macros/convert.rs


base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
-- 
2.39.5

