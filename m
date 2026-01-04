Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E90CF1451
	for <lists+nouveau@lfdr.de>; Sun, 04 Jan 2026 21:07:59 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4627310E29E;
	Sun,  4 Jan 2026 20:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="x14QqdR9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Az0cM8+H";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D234344C62;
	Sun,  4 Jan 2026 19:59:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767556787;
 b=DRRtnF0VbGEzpb/eNB9Y343zCPMmHeTcrIe9YrTnerAVJLtNVClbOmrke/xwqaerkOg5a
 teNymdPguwl1m0AboTpUE6f8QaaRuXLLt8iqplSmQipDCUu70FE75CfsFf3oO+B0emHceJm
 HNqX1nUXDldxOXHAUHQZM3c+PkO/GFILKnEARQDzxcXrZPE6Udn+tgCflED7galX6MU7KeB
 8KuSe41WMnkLUjIv5XQI5021oVUxlZ5aZDI00ElsQ5IX4zuQBZjnkGXG8slkeqJ4EggEoJB
 lxg7IYbKTNNBs8C/sBlb9pE6bcHDEP9OGpRBeaKlarNuo51Edf/+UvjxTs5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767556787; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DNwow4zGS5q5nEsWZgBUSojMm2OQeFgBtCWL1XzC0vw=;
 b=QXHn42BcO6Sfuc7//gm56qKo4hpk1POjn4r0yX4TUwe6l27+6sfd1r7jEgHA8i5OYULXH
 z7CMH9clKsbL835/aFHIsGHWMqxJ+I1UQnJ8X1mNDANuepIN9d1bFZLXaXmttwgCL8vx7OV
 X2yRMHGK6Sz9DLrXeKMpZ2mNzH8vsXqFLthesNgzi84hsDEr6VQauaBg+HxIeVefvcObady
 eDay0R/QuLlDmCR0QTB+eHWxLb7jPxSxJUM0Qxdd3SZAOGOH2LW7Xopz0R5NJwPAvYEHPCp
 6iZgR9mVS2Jjgj1MK1Qeg4i/Q4oJ8Y3bE3QYeEnIMWoPjtAvhnY5gOIaxLiw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 70BD2446B8
	for <nouveau@lists.freedesktop.org>; Sun,  4 Jan 2026 19:59:44 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 304BF10E144;
	Sun,  4 Jan 2026 20:07:53 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dkpPz5Mm4z9sRx;
	Sun,  4 Jan 2026 21:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767557271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNwow4zGS5q5nEsWZgBUSojMm2OQeFgBtCWL1XzC0vw=;
	b=x14QqdR9pfKE2hTG30e+TnnJ9uau1B1BjmSXUpGsgqj9wGo5EvXh3MXoHZbhgViqIv5ORk
	Gl7n4OBE5a+D5FxlVKa2BMwr/CAFe5sdGr1utts596XPapmhvUwsED3s3OTcDJRi7g05NK
	1A3pWGKrkVLlPuCzSvo3EXzCfv51mKoSAc8SXT7bdw+ZP3UG4wt4gmvh9wWfqHIjk/nay+
	vN3keYlxWxKEgP2X94zw/K/WOPnLs17463NCl3aZyK7sGnhOwTlwpp93EoTkbM5mnaBwRv
	1FbRRnM8seDhn9a5VAHXCj1MBr/xWtQ5STwKusmiw94GJYjBnnmVkBG+Y4j9Cg==
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1767557269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNwow4zGS5q5nEsWZgBUSojMm2OQeFgBtCWL1XzC0vw=;
	b=Az0cM8+H5pkJByTJQ2wCN9Y1s5Y5YB8cUoHZhfkWg4fvdwHf713i5OQWsUxwfkBnK96v16
	K7vruRWr3JIeigd+YKD5BZwuwENfbEcGw/E6lK+uRfqs+Xsjpv3w2Z0usjBvNzKFu/1hEw
	B9TRXeN+kS2S/IXGNvLsgNuuoArgyeurdV0bJtIfH399A9HIWaTzldvlTffuC0fIpGLfi1
	efKDae/7X8FLov28M213cI4UxfH6F0kevZNHmk9AFaHDny6Vzl1jPlVVFmgOVpp6yJ6Y+X
	0VsJkTj0aGAQ5Z8VXgpImkzwvpw2vSQaGdM9bqGhUFPW3bZjjx6bUgbrPHf3lQ==
To: dakr@kernel.org
Subject: [PATCH v2 0/2] rust: macros: Add derive Display for enums
Date: Sun,  4 Jan 2026 21:07:30 +0100
Message-ID: <20260104200733.190494-1-mhi@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xgh8nq3xjtogenp3g76r4aephjsgq4t5
X-MBO-RS-ID: 4904cf6874f2f5a9645
X-Rspamd-Queue-Id: 4dkpPz5Mm4z9sRx
Message-ID-Hash: 4AZ6MO5YULDLEMRV3BJN3HEDMNJ7T56U
X-Message-ID-Hash: 4AZ6MO5YULDLEMRV3BJN3HEDMNJ7T56U
X-MailFrom: mhi@mailbox.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: aliceryhl@google.com, acourbot@nvidia.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, mhi@mailbox.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4AZ6MO5YULDLEMRV3BJN3HEDMNJ7T56U/>
Archived-At: 
 <https://lore.freedesktop.org/20260104200733.190494-1-mhi@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch series adds a derive macro for implementing kernel::fmt::Display
on enums using the syn crate, and then applies it to the Chipset enum in
the nova-core driver.

Maurice Hieronymus (2):
  rust: macros: Add derive Display for enums
  gpu: nova-core: Use derive Display for Chipset enum

 drivers/gpu/nova-core/gpu.rs | 17 ++----------
 rust/macros/display.rs       | 52 ++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs           | 42 +++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 15 deletions(-)
 create mode 100644 rust/macros/display.rs

---
v1: https://lore.kernel.org/all/20260101184137.80445-1-mhi@mailbox.org/

Changes since v1:
- Instead of using the name() method with lowercase strings, implement
  a proper derive macro using syn as suggested by the reviewer
- The derive macro outputs the exact variant name as written
  (case-preserved)
- Supports all enum variant types: unit, tuple, and struct variants

base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
-- 
2.51.2

