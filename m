Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F82CE74D5
	for <lists+nouveau@lfdr.de>; Mon, 29 Dec 2025 17:11:22 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0710E54B;
	Mon, 29 Dec 2025 16:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tPZQajFT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DDA7A44BA7;
	Mon, 29 Dec 2025 16:03:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767024205;
 b=KluItY2Mr+8CiM+lHzWBBywkl3a7rAsppe2YAjrgIRpjBHcYwwAtmE5wRqQU0jb8YM4Zf
 ot4hJk47NfOVo1HL9TqDAy8ubVNQdp0TuuIS9ZH0x1zt2urB82n7cTDxfA09G3RIJG6jD9w
 XJQUC8eB1KTmjCuPb+fB2TZRVLqoHmLzcjKOR4HmEExHgEzMgaOjJcq9aCM/wio2/gxPc1w
 w1oCbSyFF7K+XQ3q9F1DTLCk/+eZSbq9nVf3w7PYEYYgM9E6uMJKGMfpCbJn/HTrMg9NvmO
 nHr/c4h4qQg9kZhDz+vD978mSBoiWy5uoI2n4QB/Oi20SzzfwzWkKj8rFU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767024205; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=htTWoAK1AtmLCREyBq+z79E0B3HDMcb0KIwia+YysVA=;
 b=OQ8JY8pMEml9GxUJ+Dlom0C1D/yiJNQWcWxHQIrpe3HVCPPbl2VeMOc+vzFE9G7DgGFHR
 Sec2pIbs3GhSSXdgXAS6AupRZWmTa87TPlh6hX3No3oAzBGbKVFwZr6B9jEl0EdL9JjYUkS
 onnPsZPZhry6ji53z4ta4RlxX5/9KCivyKhEBlluNCN8fhhlzIMT8W8d38+LosWLazoaWHk
 KiW5hTngbaqPjCLYwa6srWUJvpZqjbvRSjcQkTptNgGl36yYWlCEbG++yUGtK5EWCDslUAC
 CmilOk+RrHoJmxOplQxAe411oW/PtnEmT0qc/BQu4ebQKGBiJJcYautRb6mA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8D46844024
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 16:03:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA0AA10E53C;
	Mon, 29 Dec 2025 16:11:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D27A46000A;
	Mon, 29 Dec 2025 16:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7815C4CEF7;
	Mon, 29 Dec 2025 16:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767024675;
	bh=A+JFdVrj/EG2jTB+c7iSrXC0M51hsvw0JZZiGo2sQlk=;
	h=Date:From:Subject:Cc:To:From;
	b=tPZQajFTVvAA5n7DLwnLGfooFV+V4hMDPeMnRtDvsE9n0w/BZ6C1XyzhKuYLtNwb/
	 SCS0+b+8hUb3JwSsCBffXWjzm38mE6fKuFSpD+p7j74IaBovtBAAOXo3oqhUzAV/Xi
	 O8NI/hnvMsvB5zipX6TUhleqvJw25wcyBA2yZFzuFdTKbV62SAFB0in8MnlaxkL8e2
	 K+Qict/FHvR3B4f7MIhNqwG1xU/2wCITplgdI+Gs0mTROTxnioqRECvkTbQbLfcjR3
	 M9ji5sj1ojqYyCXyRgZbZeJQhHxdJ9hPBly/IrzOUZzDw6BEGQHUtuf+ZxzYroTYAt
	 s88Qrj1H/dg7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 17:11:11 +0100
Message-Id: <DFATYVSQRQ4W.1R030NZ34XUZK@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] DRM Rust fixes for v6.19-rc4
To: "Dave Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>
X-Mailer: aerc 0.21.0
Message-ID-Hash: PRF73BYU5QVLZX235QQLGW325JTENDJE
X-Message-ID-Hash: PRF73BYU5QVLZX235QQLGW325JTENDJE
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PRF73BYU5QVLZX235QQLGW325JTENDJE/>
Archived-At: 
 <https://lore.freedesktop.org/DFATYVSQRQ4W.1R030NZ34XUZK@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Dave and Sima,

Please pull these DRM Rust fixes.

Due to the linux-next break until January 4, not all of them have been in
linux-next; no conflicts expected.

- Danilo

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-fixes-20=
25-12-29

for you to fetch changes up to 97872fa28b33a1ca6acc0a7b260750c9a123b193:

  MAINTAINERS: exclude the tyr driver from DRM MISC (2025-12-26 12:14:40 +0=
000)

----------------------------------------------------------------
DRM Rust fixes for v6.19-rc4

MAINTAINERS:
  - Fix Nova GPU driver git links.
  - Fix typo in TYR driver entry preventing correct behavior of
    scripts/get_maintainer.pl.
  - Exclude TYR driver from DRM MISC.

Nova Core:
  - Correctly select RUST_FW_LOADER_ABSTRACTIONS to prevent build
    errors.
  - Regenerate nova-core bindgen bindings with '--explicit-padding' to
    avoid uninitialized bytes.
  - Fix length of received GSP messages, due to miscalculated message
    payload size.
  - Regenerate bindings to derive MaybeZeroable.
  - Use a bindings alias to derive the firmware version.

----------------------------------------------------------------
Alexandre Courbot (5):
      gpu: nova-core: select RUST_FW_LOADER_ABSTRACTIONS
      gpu: nova-core: bindings: add missing explicit padding
      gpu: nova-core: gsp: fix length of received messages
      gpu: nova-core: bindings: derive `MaybeZeroable`
      gpu: nova-core: gsp: replace firmware version with "bindings" alias

Danilo Krummrich (2):
      MAINTAINERS: fix typo in TYR DRM driver entry
      MAINTAINERS: exclude the tyr driver from DRM MISC

Philipp Stanner (1):
      MAINTAINERS: Update Nova GPU driver git link

 MAINTAINERS                                       |   7 +-
 drivers/gpu/nova-core/Kconfig                     |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                 |  14 +--
 drivers/gpu/nova-core/gsp/fw.rs                   |  78 ++++++++--------
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |  11 ++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 105 ++++++++++++------=
----
 6 files changed, 117 insertions(+), 100 deletions(-)
