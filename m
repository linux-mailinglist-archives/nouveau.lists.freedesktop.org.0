Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE2CBAE88
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9969F10EC29;
	Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6pEWPNv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E20210E00E
 for <nouveau@lists.freedesktop.org>; Sun,  3 Aug 2025 14:21:25 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-76bee58e01cso1254793b3a.1
 for <nouveau@lists.freedesktop.org>; Sun, 03 Aug 2025 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754230885; x=1754835685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G673etPTXeIcmcx61zJWy5V5b2tMbETyox5/A/4S4cs=;
 b=E6pEWPNvXHh8xtWD0C5wdLmZlOqB5wG9FAbswWzITPi3ZjBZfcWfIoAO3e81LSAmVo
 FVMtpmImWBerAhvUHU7C2EH7eeGNT9gS9CVJFOOUr7czfyzr6wQTAwFVz3BJtL7lkKm0
 KZCbrMfaqBHOGYJ0wob3lAm2QaQsOio3H2XxEYRhW7jy4Jz/qiyhFqjhTJhGeRDoziCg
 6vaYImkuBg1HA44gVoPrWz+vnOLY0LqeoKFRHzUUkVk1We/EKRwzMT2IB3+SaJ9tWXkK
 lfkYX8ucRuMBEXgHjUzb73aLHbgQvsqW7pjGTes8ehu0oaZu4P7cMisRZUEsbus8yrVs
 AqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754230885; x=1754835685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G673etPTXeIcmcx61zJWy5V5b2tMbETyox5/A/4S4cs=;
 b=kJ4hJhNRwrl/teO4a4HPJ90Amo9uv+Sw4rgJx3RnRfqNTrOTc5eqGP3AVPg68PHAgC
 uTKM7QkJRFv2Rm7lojc3OmJPo7g+Bin27kJueUhEtNvL5cNeMjh32opD/lZLrfVan5VT
 A9G1lYaQ0acLC49o9mYuarSxktta/nwT9bhNXgTR7uKUtbKD34ZdGqoxaO/gVq4euTZf
 MHpNYtg/sk5/hJezcbrCaFd4Y/ttmGssVCe4K6DZquTR1uJFtGSNO08teHL4DvYU7KqS
 pTnmRGDBhyaYj6zR0Ckn+t90MbclKvwIGNDDJS+sU06f04t8zP76JzzCAuSYkc2lRtbs
 SKeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMwcz5OZpOj2sBkfQyWLU1mLnUuDdbsEas+t0SmUMrnHYJUE2O+ijX3/iz8LCxM9bjUvmxrjam@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTNpChbrs24ADOkbe2nHMX7upGuf1cZKNuAkZ0VG2rdVupjcDN
 ZXyIkmf7Csa4UFVnjnLsWkkZWXrkg3AITdfleUFVdIdr2MNrg5ZHe2qq
X-Gm-Gg: ASbGncuybfRSDOjVGB1Un+LJ4csaDcvrD7PqzBji8w5hEjEjxfnZwdtGmk28uU00gYD
 Ioh1aiZxEwwVAP3ljxuK4ryRYnpikiSBM1mf0XTC59L4Q4aE/x0S+gZ2eKKuzZ4suthnEHB8gfT
 Uc44AykM8Fo7mPiCS5tUtfM3zK1gHyGk/Lpss4Cek3gjGTxGKQbxLb2OOuABwz084FRlW+nJ+K1
 Ic493gzeU4/FXLXdZ2phMlcqwiMRZ25JV174CNN3vIuzozDDZq0MNbba1+tiAP1l5NRARdy+9Mv
 btjZU3tWmd/y1H1xiFo3lEfXuWG0zRXEDHBhmwd8NaDpNWZSo8uFMWXuRIEztmEw6r/vpodWkDy
 NS9uMIUHHvs+dBSeQO5l/b1P7JRZCorVyWA==
X-Google-Smtp-Source: AGHT+IGe/BhUamFbhOMfZiORHg14lmOox+kl2v8y2ocGIRHR1Q9PfmfJpWEEIbsCp12zkytZhwQ9uw==
X-Received: by 2002:a05:6a00:21d4:b0:74e:ab93:422b with SMTP id
 d2e1a72fcca58-76bec2f304fmr8216752b3a.4.1754230884756; 
 Sun, 03 Aug 2025 07:21:24 -0700 (PDT)
Received: from localhost.localdomain ([104.28.217.213])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfd0279sm8431306b3a.98.2025.08.03.07.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 07:21:24 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 0/4] rust: add `TryFrom` and `Into` derive macros
Date: Sun,  3 Aug 2025 14:20:50 +0000
Message-Id: <cover.1754228164.git.y.j3ms.n@gmail.com>
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

Jesung Yang (4):
  rust: macros: extend custom `quote!()` macro
  rust: macros: prefix variable `span` with underscore
  rust: macro: add derive macro for `TryFrom`
  rust: macro: add derive macro for `Into`

 rust/macros/convert.rs | 361 +++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     | 239 +++++++++++++++++++++++++++
 rust/macros/quote.rs   |  40 ++++-
 3 files changed, 638 insertions(+), 2 deletions(-)
 create mode 100644 rust/macros/convert.rs


base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
-- 
2.39.5

