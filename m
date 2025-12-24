Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E46CDB4A1
	for <lists+nouveau@lfdr.de>; Wed, 24 Dec 2025 05:00:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA8810E328;
	Wed, 24 Dec 2025 04:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MvLq1HsL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 41DB944C5D;
	Wed, 24 Dec 2025 03:52:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766548353;
 b=aihlcAgRQ7XZ3QCyLKIARJ1acxqoYz2u5GBCWdfVcSR3gisLfmYL7oqTYGSKlBwufYAVY
 DV4owSwEkHCeutBlXIEXSFbx7SIbAvzbtPBghRGALEnFOOV+AoChClRSQjdfCD7kcte5POq
 XLsh8GVNz0u4SspMxdV4CV2Oi2/33GQ0LE7doqK21ZTMcSXj3Gt9x9LwvwOiN9ZgoRaVJNs
 1JNjIxcnyB59hEvFH2GahFG0HsBwoQBU4K1Efu6SsyilUVG8Tu0p9FpzfOdKIZv3enYsd4Q
 AzPHzTfnMQeYz/Y7aKBkCrNC66sG1+A6+JNGz3SgJ8Z9INque58BMSB8J1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766548353; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=15J8JYA2RlXsm9mHy/0N0w8q9AM25fubVC52MXcxDBo=;
 b=WkQCsEYArQOCltTnBVe5Ozu7mmMiC9RL++ltRCCImT/9Xelp/t/5U0WB5Y7Fah7xgfuOI
 +INlc7nnP55HMQJirXNqECfev9Rbj5ys/amYrj95HRayd9a13I4JbOLwd6SBBcr+sBgw7EY
 mgFPyFIRZI5QhEuPx9im29F2HoGsxHOu6V2zKijwWRw52hWfkV3dL1irE2L/4WBWFSLZdkE
 oCofkzf5T9fLPmxURaXdqVO86FEXud8TkFDQWNPt/p+RXt4mrm18A6KWSG7xH5bT3rjj3vP
 OfCic/i4dKt7U7BV9k3EyvyKcUDt1eYVwZoR4eLZqiFUAfWLJP7Qqt6nClaw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 80DDD44141
	for <nouveau@lists.freedesktop.org>; Wed, 24 Dec 2025 03:52:31 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A376910E056
	for <nouveau@lists.freedesktop.org>; Wed, 24 Dec 2025 04:00:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7f0db5700b2so5025359b3a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 23 Dec 2025 20:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766548814; x=1767153614;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15J8JYA2RlXsm9mHy/0N0w8q9AM25fubVC52MXcxDBo=;
        b=MvLq1HsLvAlSyVV2qMWkD8F5+eFD++Mrjpl6VCjyHZp5gCXWd9agu72hP1BV18AA8k
         eK69qTDSinl972YgVkV9HN24xTPRET6ic35C+JbOs8Rm5kGUECZe2xJKxOZnsADcWs0A
         wslJ2G7QB2iQOoumCoFot/n1teDHpBKXDJ9K/cmN1FjauD0I4WfLOk0687Sj/74qYDXS
         4rf62Y8JViK52PVK6k6C+nF2iBS1ZWyBCAdc2VZi4HWbUoRr30nKEUFeziR2RXDu8WOS
         QeFIr+p59TLcPCbKOQhlN/9mVJJb/jxNzREEFLg1BhQLkTl7xZ55di8MM/FlR3LceDwU
         JZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766548814; x=1767153614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15J8JYA2RlXsm9mHy/0N0w8q9AM25fubVC52MXcxDBo=;
        b=wQ2Vc1ZEWRIONLU3SwQ+2YIbGHxHTTP39MY2OK7Ov600BBrQeU13o7TpVdr8ekGekD
         1yeU//YEkXMcZZJOMCG8+un5P+K/fU29lXUQNEil+2uMI/H5Dh4RnEbKamdjNnzdNMcV
         Mhb0HInJ3kR77OT6XIooej9l4fgXfzQXWLZ7DGCHBuPSfeHxqaDzfLjm04vrjyDzNmRH
         v3YaIvGaComiBZsDRSIBqMDuv49jfNaVJAEGIL44Www1Tv/zsSyKVKlyryWa18rNqf5x
         ZXT03KDHLmETpOWd52l00+XxJAQHm79f9ooeSz+eVI6sOrhX06wHMJu66c5XLFCQgrt/
         iy1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW77J7I/ra+AMYLMM32ZS5BZMx5jNtV2P0V6RsQYStBr+cyt41+v0PZ4yQ7CYCkdfUDz8KX0mL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzl3MEmzQ2dDPKtMCf+LVmpIRLm2J5ilnCDAZ8EOZKlsA+M8pO1
	lZ7lH1vK3F7pHRSlwW9H9ZLA5i4iU1BSszbtNgsKMCnuS2AEU8MrKpLQ
X-Gm-Gg: AY/fxX7gW9/OAcjLAZ2Zgr8Nhv/i0IPSmzbcj10sZdtrRrAQrw+Zot4lcj5KdJ8ZAxs
	6PI6lvugzUGQ6FwzCnswge5Cp+iRHsRNiEHLg/qrdIQ0Eq4NHxUFVl0mr76ZAYj8mmhEZpRa2nt
	G22bo8qHDK5kC3EAJseX4u6T8AIkRCoEnM170QRfyAZ5HvNMKkzcLrcNV+B7D5RCe4FiaMJdF+/
	2VQZfIZe7LawffeLS2z8JMozFpnRC5ZW3LnWJ4gO/2+ui+p+rt/SjFEhuEhZgoiPw7BFMgrxibH
	42Df19Y6MTqtdp4rFtDOARj9NpRz/GGOo8NlGQgOyElLMWn41S9T9eFL9/KhN4nZCGPpvpSNCth
	nTC7HI/molU3W+FrRXs2n+KO3xZMMnz11pavTXvD47hzAOwrLpYy27t7VwbvsgPsq/ygi3o1kRr
	E9SfEWUmw2Jt1zPu1w/Xv3xg==
X-Google-Smtp-Source: 
 AGHT+IFC5XGfwJjNkSwGpC2zGfaXAO1oe8q/u5Cyg28/T7qLlNT6jf0HIuXTN3KWVdXR0G5t+GJGFQ==
X-Received: by 2002:a05:6a20:a11d:b0:34f:b660:770d with SMTP id
 adf61e73a8af0-376aa8e66e0mr15888978637.55.1766548814049;
        Tue, 23 Dec 2025 20:00:14 -0800 (PST)
Received: from localhost.localdomain ([104.28.249.217])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c1e7c5307c7sm13255131a12.28.2025.12.23.20.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 20:00:13 -0800 (PST)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/4] rust: add `TryFrom` and `Into` derive macros
Date: Wed, 24 Dec 2025 03:59:53 +0000
Message-ID: <cover.1766544407.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HPM2X6OMSWZ6YBSXLULMI26YI4IWIWLS
X-Message-ID-Hash: HPM2X6OMSWZ6YBSXLULMI26YI4IWIWLS
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HPM2X6OMSWZ6YBSXLULMI26YI4IWIWLS/>
Archived-At: 
 <https://lore.freedesktop.org/cover.1766544407.git.y.j3ms.n@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch series introduces derive macros for the `TryFrom` and `Into`
traits.

Primary updates in v3:
- Adopt `syn` for improved macro parsing.
- Allow `kernel::num::Bounded` to be specified in helper attributes,
  enabling the generation of `TryFrom` and `Into` implementations for
  types with restricted bit ranges as required by the nova-core [1].
- Add compile-time overflow assertion to ensure that enum discriminants
  fit within the types being converted to or from, preventing silent
  overflows.

Note: 1015+ insertions are purely from doctests. Most of them are kept
private to keep the public API documentation clean and simple for
users. This might not be the usual way of doing things, but for now I
don't think I have a better option. Feedback and suggestions are always
appreciated.

[1] https://lore.kernel.org/rust-for-linux/DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com/

Best regards,
Jesung

---
Changes in v3:
- Use the vendored `syn` and `quote` crates.
- Support `kernel::num::Bounded`.
- Add compile-time overflow assertion.
- Add a comment about `#[repr(C)]` enums.
- Drop Tested-by and Reviewed-by tags, as the code structure has
  changed substantially. (Thanks for the previous reviews and testing!)
- Link to v2: https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/

Changes in v2 (no functional changes):
- Split the patch "rust: macros: extend custom `quote!()` macro"
  into two separate patches.
- Remove unnecessary spaces between tags.
- Use a consistent commit subject prefix: "rust: macros:".
- Add Tested-by tags.
- Link to v1: https://lore.kernel.org/rust-for-linux/cover.1754228164.git.y.j3ms.n@gmail.com/
---

Jesung Yang (4):
  rust: macros: add derive macro for `Into`
  rust: macros: add derive macro for `TryFrom`
  rust: macros: add private doctests for `Into` derive macro
  rust: macros: add private doctests for `TryFrom` derive macro

 rust/macros/convert.rs | 1546 ++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  319 +++++++++
 2 files changed, 1865 insertions(+)
 create mode 100644 rust/macros/convert.rs


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
--
2.47.3

