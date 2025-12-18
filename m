Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF4CCC927
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 16:52:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3350410EA1E;
	Thu, 18 Dec 2025 15:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bt6sEqd1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1AE0C44B92;
	Thu, 18 Dec 2025 15:45:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766072722;
 b=stP+qK9Dh2RSLc21fmEkmTCsXJ5cgBKw9ZBQtNGbK1yHyEWRo6Lmf2VT8ATsGSpwA1LaK
 GKNDxBxqYqblEZSiDoMaTIht/BFpl/kHJtgzA8dGL/fGNkySeD6mNoqsnqUBRCNGwX8i8U3
 Y5TRa6hR6vLYb5ZeGdD67tiOgpoQtKur0XtBHqEaqx6HOT/McMuV9roYg3eKPvFnsfzk1bs
 n3duJO1tvPgMZlR4U9qVZZYmVsKsfVFtYwkjCjcAwE5kCQJfsCU8uTj+lDxL3OpHy3hQeLK
 1+hZvU5GvPMDu3R09KeVHE7/O8kk5jtg6P7tul6WeV14zlT3kpbkMhbHkGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766072722; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wgwUa3PF56KJQy2TgI6SFha3E4xWOpLUCcVtC8guEU8=;
 b=nXqKXwxAVntDWCCCLdugJ2+XPlb5s0gfrVWwWbwjceUm2m71z1ujAQAvwN7jds6bGxG+M
 AfDlzanXzQ/6nEYy48+WhWh4SDYeF17wcyyRwJN46LHt9l3Gt0IIPs6dWWH9KLhMX6QsjHi
 3e86sjzJWyfvzDpmNqBijxTqIW8/7V9CXvrHV5pyBS6pVlzw91YJocCeXpHbJvXW/n0QbrI
 nBBEiL3vPyeymhQmGhnY0LW4S7dgSgvh4Y1xvfckQbFR8PTfx9zWLHDU7PEh0nqtuQiPP9O
 a4q61AgQyLBLWAA+Rb/IIV6wDLZ6lQ1fZCqGtFqSQhmbjTnLMXuQ2DKq84uA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2530D44B89
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 15:45:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F303110E404;
	Thu, 18 Dec 2025 15:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABF3B4043C;
	Thu, 18 Dec 2025 15:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB74C4CEFB;
	Thu, 18 Dec 2025 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766073170;
	bh=sq+km+wvT4DGrv7PkS4uONGlYNLQhbs1OTtEFeLOWqw=;
	h=From:To:Cc:Subject:Date:From;
	b=Bt6sEqd1SrETZEoMhV+xw1Xf5/RORJDOUqXrGJrEaroGiWDeqK7Uo0S4NTJF9XC2j
	 nA5ogDNI6Ja7u6HckBN6eAKGLZ3MT3aQHvOeXUoLaMYqi4oCdSUDSLkzgolei3ix36
	 YY19napuyMc7QbJpHbA3YB8UFDDPEoxg7+BQLCwkqzNqulWwCDArZPUOAyAmZa2jen
	 pTub+YYddgTTrKzntbRiDyrh/suPBilg0NaGMVp7HHAmAIxVhSeDGMJmXNfQfe+GVe
	 +XCJ5TNhb40nVPRf6ZM3m90Iql/SNNiC10/qTiVI+CZZsRcKEubku+xEpJyNsOCmD6
	 jXmp+SHsa+gCA==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	joelagnelf@nvidia.com,
	aliceryhl@google.com,
	lossin@kernel.org
Subject: [PATCH 0/4] nova-core Improve pin initializer code
Date: Thu, 18 Dec 2025 16:50:47 +0100
Message-ID: <20251218155239.25243-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZKTN5F3B3BMTRDAV5VNDUBKAC2UNDGVP
X-Message-ID-Hash: ZKTN5F3B3BMTRDAV5VNDUBKAC2UNDGVP
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZKTN5F3B3BMTRDAV5VNDUBKAC2UNDGVP/>
Archived-At: 
 <https://lore.freedesktop.org/20251218155239.25243-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a minor series to improve some of the pin initializer code to:

1. Reduce redundancy caused by Result<impl PinInit<T, Error>> return
values with pin_init_scope().

2. Relocate code that technically fits in the pin initializer into the
initializer itself.

While, thanks to pin_init_scope(), it is also possible to keep it as is,
moving appropriate code into the initializer has the advantage that it
structures the dependencies of fields naturally.

For instance, intermediate data that is only needed for a single field goes
into the initializer block of this field, making it obvious that it is not
needed by anything else.

On the other hand, intermediate data that is needed for multiple fields to
initialize remains above the initializer, naturally indicating that it is
needed my multiple fields.

Danilo Krummrich (4):
  gpu: nova-core: fw: get rid of redundant Result in GspFirmware::new()
  gpu: nova-core: fw: move appropriate code into pin initializer
  gpu: nova-core: gsp: get rid of redundant Result in Gsp::new()
  gpu: nova-core: gsp: move appropriate code into pin initializer

 drivers/gpu/nova-core/firmware/gsp.rs | 134 +++++++++++++-------------
 drivers/gpu/nova-core/gpu.rs          |   2 +-
 drivers/gpu/nova-core/gsp.rs          |  73 +++++++-------
 drivers/gpu/nova-core/gsp/boot.rs     |   5 +-
 4 files changed, 106 insertions(+), 108 deletions(-)


base-commit: 97cf6bc0abd381fd84e5d8e978322a62a58fb00e
-- 
2.52.0

