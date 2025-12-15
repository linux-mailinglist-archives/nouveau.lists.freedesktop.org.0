Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA2CBE87F
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 16:09:00 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0085510E5D1;
	Mon, 15 Dec 2025 15:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QLz5AU9/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9A4A74551F;
	Mon, 15 Dec 2025 15:01:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765810883;
 b=DQNFyd8mS9DzgkjDOx91YyuxVCNuY1eM8X0PgYlzTqIKiEaHQLN4RLYKuhWxDVxUPhQw6
 2hSmm9CrSUNtDmCy1S6MX7hFbXJXVtNwPoXJ17xPpHWcSKW4FJHVs/9tyCsTFRYCDjmX1Vh
 BOvFD4qykTw891okra9FMiwQiyFwwPNjgk/UUTSEoWMfCNV24eh2W72G6mT4KwuHsTMD5cz
 i9oQRvgrAF5wBA3eCcCIxGySDYEmabcHyRJNy5+sL3iyvTMwyWSPWlDcxsZzN5yKDDWw9ar
 3nZaJjy04vUrUt+IboTHuZlDAEm/KMfTCVFTZ9txsn6tBY+rWgikgvnoSXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765810883; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6XteYEIbtoFCGOI6KyeEWPkivFlpasbQELYBfBjTTxs=;
 b=PCjJjDkAnzD05fw3mtzHPv+Nf288WPbCPxjmHMG+03Tw+jcTjmJpcGg8fD7L4edcP/QWd
 DVmg6nqTKRym8/1AxWQVf43wFPsFjeA1PIX9Jqj8rGN0hXPK2jLw4YvbB06pt7uug+GEc9q
 gCeajigJakCd9X5mvj6MVFpSj7NwkMVGyFQbnhUKjChaDaqI+T5LvM5fnu/M7GkAs0uQ/bI
 8wxYGhdHSej1igggqwnXoLZM4vGOc3BLZ5weKtGTuPKgp2REbOrEDxm21Gj6Nz1haxq6lcU
 Xtn7wwWH9A/H8MXcCebrcg8Y+eIdNvLdL/RW4pVYtmQ3RgJPEwg0UXirGrFQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 34EC945517
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 15:01:19 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D62D10E5B9;
	Mon, 15 Dec 2025 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6XteYEIbtoFCGOI6KyeEWPkivFlpasbQELYBfBjTTxs=; b=QLz5AU9/2hmUj0tk5yBY/VCsmp
	xqqMsNhHeUrDhP8Ziny38VyPsjDkPhavUFe5+7GKNSlO6adMFImP7pb0+WT4mLLRLLxlkFJVqCguP
	nN2gOItbXFNh3TTITpr0ev7GYP+zHoCg/1ExMCeiY5lmf/k7rIZ0R98CgkXEG6K2jJI6+ICXcG1mT
	0binqY8maQ71Y9HHCZdiL0xoJahTfw64wxAyv+99leNmSvKtqBp3tznfda3FG4nTHW2c6u4qEg2GR
	uWrcxzZjoOJbzBjkEZSetVxvSnR98WH5KLPVOMM6mtAreoXFHLUL6/1OunrFlSVHM5iLxwZ8HzaGB
	G2U8/Cpw==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vVABk-00CzCP-PM; Mon, 15 Dec 2025 16:08:40 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 22/28] drm/nouveau: Remove drm_sched_init_args->num_rqs
 usage
Date: Mon, 15 Dec 2025 15:08:01 +0000
Message-ID: <20251215150807.58819-23-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
References: <20251215150807.58819-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FH76S4KX2H3WQ37KOTU5LJRSWI53MTJC
X-Message-ID-Hash: FH76S4KX2H3WQ37KOTU5LJRSWI53MTJC
X-MailFrom: tvrtko.ursulin@igalia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: amd-gfx@lists.freedesktop.or, intel-xe@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FH76S4KX2H3WQ37KOTU5LJRSWI53MTJC/>
Archived-At: 
 <https://lore.freedesktop.org/20251215150807.58819-23-tvrtko.ursulin@igalia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index a7bf539e5d86..dce8c5c9bec6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -407,7 +407,6 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	struct drm_sched_entity *entity = &sched->entity;
 	struct drm_sched_init_args args = {
 		.ops = &nouveau_sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = credit_limit,
 		.timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
 		.name = "nouveau_sched",
-- 
2.51.1

