Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506AECDD836
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 09:38:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC8611AC0F;
	Thu, 25 Dec 2025 08:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t1VSkYPm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0477A44C68;
	Thu, 25 Dec 2025 08:30:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766651414;
 b=B/6MqMysqMIYgGk9/TphwcMihq0KwGfHE5O7d9K06TpUNJnCG+WHcszpNOJHExfO9uXbf
 hSahOm9uQQB2jxyog47fhpNsKRuWWdgIKjPIuNhg74gywI0Lq9xytxp7geNJT8z0JGAlvDJ
 BftvAVwdZf7l6WD6UoFnRMbYTPk526Q/DQThe+4JfQyWNQ+HQ6paNqAFv9dGK1CokwfGZoP
 fG4USV00rDxv3P994aVC3CqehB6OAywRtbKRKaKcJXLQC5IRUi4MM/HnSweSbBdrFrejVdY
 pBW1od//ts59sApt0rDwCXoosBjtxZV0HQ5bNWjn1k6Utzpnh6JlUM0RdEfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766651414; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SGswDM+hnEeAJZVYNUoyvgGCb79dIsS3198pEzNucLs=;
 b=N7LESf692UhBgfCIjqmK2Yx08oJcEe8iLsQDdml+SpwtilAdIN3arLyp13NIrhYOKcUVK
 yOVqfUObhxmGsAJ7U+P7HaDxqqhmg/bZf5WKyc/uEiNP3V+NaMHIfvs6w9kJDEEKTjUjf4O
 rtzPxZ5TzLZwGopYhHhEVUA7aQeSPKJ5n+7G986A7S2qL7DhYUPAj563jdV34FQbFbs7ZSw
 fBRmso0j8Nib91L60R2Qzjiq2UGwICtvbXgJEvgm0LLYc1B4EqcSki/diuVKGed/SgLEotg
 2yzDyN35F8cTV/7TuYenlw9XzprqdXGYTm30v7o2ucg5fqf3bOmcPLsHLPsQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EF2CF44C67
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 08:30:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB584112E16
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4407E43DC1;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CDDBC4CEF1;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766651875;
	bh=gtGFPnrT1tGUALhUzT4VmeMkygUixFFu28cqcGEINdg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t1VSkYPmAnxYAk7Z3lA/s1fNjrVbJjgtLfkTYZ5WA0s1CjWzPeFlLUiszFVNsv/nx
	 2TsaFcKirzK0x+4aEXwmxwtBs3wk2xCE8rbjbxiNnzB/HI0i54W1mXTcsy9niGdm3A
	 Edlw5KFhj4Tnaz3RMdDoXYcNHrSZvlRSWY/BkKq+KKgX3viHJqYSiYcZMwqzsCCL6C
	 lm3P8abdwZNP8HZgV3QAMaEHi6QNJgRChAUc2fJIY0hViE57mx067NES4V5ohNNQ/q
	 0/aOaRp/xOhn2x0n1YHFpjRIQut+Ntd+N/2FaStvxYWkfIh208qgiDsO2a8xh/eZjI
	 hZ++a4qmOD6mQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C54FE776C0;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Subject: [PATCH v4 0/4] rust: add `TryFrom` and `Into` derive macros
Date: Thu, 25 Dec 2025 08:37:46 +0000
Message-Id: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANr3TGkC/x3MQQqAIBBA0avIrBsoyYiuEi3ExppFGqNEId09a
 fkW/xdIJEwJJlVA6OLEMVT0jQK327AR8loNutWm09pglge9xAM55IiHdRKxGwazttY770ao5Sn
 k+f6v8/K+H1wD4FVlAAAA
X-Change-ID: 20251225-try-from-into-macro-1665d0afcfc8
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766651873; l=2575;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=gtGFPnrT1tGUALhUzT4VmeMkygUixFFu28cqcGEINdg=;
 b=oigpxcVK0qRw2hfEHNznCMSACcO+TLwNfRoj4zhgyPnUAXGPdYnQkaUM5e5vnt+cUVr6z3VEu
 VFUC8d3eOCQBpAxbPgueUtNdXE75ng8xK66QUGb1+caZvSXQNDDO6JB
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Message-ID-Hash: ZQ6T3NDJND66NFT6RJ6PD5FH32YJFKOB
X-Message-ID-Hash: ZQ6T3NDJND66NFT6RJ6PD5FH32YJFKOB
X-MailFrom: devnull+y.j3ms.n.gmail.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: y.j3ms.n@gmail.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZQ6T3NDJND66NFT6RJ6PD5FH32YJFKOB/>
Archived-At: 
 <https://lore.freedesktop.org/20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I am resending the full series (with minor typo fixes) as Gmail
consistently dropped several patches in v3.

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

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
Changes in v4:
- Fix typos.
- Link to (broken) v3: https://lore.kernel.org/rust-for-linux/cover.1766544407.git.y.j3ms.n@gmail.com/

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

 rust/macros/convert.rs | 1546 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  319 ++++++++++
 2 files changed, 1865 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251225-try-from-into-macro-1665d0afcfc8

Best regards,
-- 
Jesung Yang <y.j3ms.n@gmail.com>


