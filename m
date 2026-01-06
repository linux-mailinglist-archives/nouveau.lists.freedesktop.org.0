Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3444CFAD7D
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 20:59:54 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE8710E54E;
	Tue,  6 Jan 2026 19:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qlUBYoDX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3646F44C9B;
	Tue,  6 Jan 2026 19:51:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767729098;
 b=u8an1U0MdcGgqik6ReOn5yE7XjcgHNwhpv7ytH/YhHx5EDzkohrycOz8WqRUApSMmLZJ8
 0w0tVikGRNfueDVkb6H/a0MfblnDTgEM+REjG21S7NPDYIcA7vnTuLmAKBKA9H75PTiqq7j
 +XXd7xLvt8KRHNEe0sb31rYwgP0jMGa6Wb9TIOX/tJg0kLV8nMRWAzfr8vLeOESRvSBc197
 g73OOit1iL/9P1cZ4UpZTjAqc410O9mnQ6kodmpPnsFeQDHdHinV5IMf+t1CpaBayuDoxVA
 QoVpEr80knZl+WzoKEaKkPZWVrfEEREKe8zdkfTiKGp4qroZ6dCGWmHg3e4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767729098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OYZUoBilJ+zVwGPiScFNKkatw8FFdVcCN0lW7sI6kA8=;
 b=uYCvQxrgwjKk/xDS4yoy5MRpwJluD17eDuKTZIvWtLPrRI2VjBePc2v94ebLNPw27JVtt
 aTd4mbYwtqUrxDeh2k1q4jUnLSnHz0OkYFR2YiBnZzlr7Jl9Zsvd8e+KYYfxHinTGMf2Ooo
 74hPy786VsJ3o1xNm8kBSn5cYsNdPDdntmdBi4fjHD0gpPfmKEinP+KjmKcq5VPQMwPgT8P
 9VOYc5taIjCb3kbPWBhW91cGH76XT8ibL/ZUgEfda8815tmhMaaLPovRW18exZomWaw3tk5
 Xh+2qG0IzappCcBrn7DXVQTNFQNu8ubF+O5X2V4/TEjpoyUO52emnguR8olg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1ACD944C5A
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 19:51:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A333510E549;
	Tue,  6 Jan 2026 19:59:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B4E0B60007;
	Tue,  6 Jan 2026 19:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6232DC116C6;
	Tue,  6 Jan 2026 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767729586;
	bh=+uMYO8Zcxy/LKS7iUfEqcKI8uYdKCiFIFxLZuU6quyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qlUBYoDX2H5vGWPhhRP5iKMQNMSQFaSgK2LSocZgkXFoNlCCS1a4bXhawNCqOVQR5
	 yNZ9TBZJTZL4PR7RI7Lav2FYx2JrIuv2LqtMgRFIKYbshtc9kxjFpBxTr9ViLP+L1B
	 RJeSQuicpHAl2E5ENTalteggB0l2BuUGJJAuQ71g9uTBWR310CLQCfP1Ap869NQcTV
	 pARBkjDOmpgFQMmF1dOUCRN0CPylEZTIhjwuOgIsut/3FClTe4GqOS6wgDToF0qdqT
	 hCpBJvbmDx7fG+rHQ4SSNRPjfQqH8Vw9S3+uad0AE6x8E3YawazWhfXAvwCEeO8mkW
	 bRny5qLWG86Uw==
From: Kees Cook <kees@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
Date: Tue,  6 Jan 2026 11:59:43 -0800
Message-Id: <176772957954.1530485.4582284327428826161.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aJ17oxJYcqqr3946@kspp>
References: <aJ17oxJYcqqr3946@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZPRB3BHC2GWNL4U72FJIABMI7SBDYZ4Q
X-Message-ID-Hash: ZPRB3BHC2GWNL4U72FJIABMI7SBDYZ4Q
X-MailFrom: kees@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Kees Cook <kees@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZPRB3BHC2GWNL4U72FJIABMI7SBDYZ4Q/>
Archived-At: 
 <https://lore.freedesktop.org/176772957954.1530485.4582284327428826161.b4-ty@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 14 Aug 2025 15:01:07 +0900, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the new TRAILING_OVERLAP() helper to fix the following warning:
> 
> drivers/gpu/drm/nouveau/nvif/fifo.c:29:42: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drm/nouveau: fifo: Avoid -Wflex-array-member-not-at-end warning
      https://git.kernel.org/kees/c/2d4909bae919

Take care,

-- 
Kees Cook

