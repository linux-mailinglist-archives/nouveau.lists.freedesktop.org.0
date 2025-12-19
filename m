Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B277CD027E
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 14:54:36 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F0DA810EFE0;
	Fri, 19 Dec 2025 13:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U2ZApoIb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C185C454F5;
	Fri, 19 Dec 2025 13:46:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766152014;
 b=iWWiS5sc0DK66FeDlz1Lg/z4iIhQXpBBV2Ka02t39lAyqZb3d+pb2E9W5NirDbbhK3R10
 3qWHlTssI8TgV8u4PIz3irys9jx8es1ox1tRbjLcZrMO2dImiqHLx18Paq8wFjHck3iX9JH
 kI8RsTAP9YeuKMRp0D6YswfgqlRA5Pw1rcD0hNn/East36a42AONU3RMye08xlCu4ddy6Ks
 Tn7Sm5p+8FnB5mlQ2KCagMQ3N3SVjVsotAw3kOa0GAYNETrjLNWxQw7Bp5Xkp26DnbQJQBr
 ruvGPIfMPFRTKVmkVXOgRvsgPSaZNkIk776wPq1sm0MPJnRfPjJOWE8Q1M/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766152014; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6XteYEIbtoFCGOI6KyeEWPkivFlpasbQELYBfBjTTxs=;
 b=ZRAniPv/mjnH0vH5vzlVF3qOGojaIMxvoQoA3PiCYDVBemF2RTQaT4IvVI0fcUAXYmAxS
 l6ziH44U2BA5+Rjz09mnlUqaUY8d1nVrZ0s/FO7w0pYKepFYEILPHlYx+N3tDCUhaVXrL0H
 s/Py/+kXxl54dysLSgm0K40PuMPqqlKukmzTdL3bsY5vBY6w7NhYIXxjaFndrtVpsi1YVn+
 XqV2IDJNF7vcdR84mB5SR9kg1h/FXVEAeC89u4bZNpc70RZHZ1bEQ6/dYLXN0iCgzbpWlEE
 g01+26MaKNgGk7lsQcY/zp81E4CfKTw/kd6DtH6Q1EANk1Oo7RNMmWSQwStg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C102C44B96
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 13:46:49 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A10CF10EFD3;
	Fri, 19 Dec 2025 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6XteYEIbtoFCGOI6KyeEWPkivFlpasbQELYBfBjTTxs=; b=U2ZApoIbt1WqbzrxKE/7/aeMUV
	bj6mStzTRjMQvuXuJA0Iv+QqeGtqVWWnZlzygfcu6o7yr8Dx1jea+37kDdbYbiwJCjV4EXvhl+Pq4
	aVR1w0e2KfTEO0mHDMtszmZRSnwDCzK1Wz8TqpSZujnYAp+eOGHZ3QLa/5j6aKez3p4WHKVKpf8E4
	NYWk7PdPD1AgGuCTyjhQ8rhQBaBXCDHsePqGm5mEnSXlnmmDgTMBoPklIMmO8oI8kOb3R5LpKi7H0
	en5SDpMSsKq64utQwsd5wtbfhjuSo2I51PpCrBwR9iM3UAvESEA7hwkGeTwH66EAqdjJr4BEbkwdO
	BYgGGU0Q==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vWaw0-00Eejz-RD; Fri, 19 Dec 2025 14:54:20 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 22/28] drm/nouveau: Remove drm_sched_init_args->num_rqs
 usage
Date: Fri, 19 Dec 2025 13:53:44 +0000
Message-ID: <20251219135351.25880-23-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LBZQ67BRKMRJEFTJS27THUSD3ZNRPE3T
X-Message-ID-Hash: LBZQ67BRKMRJEFTJS27THUSD3ZNRPE3T
X-MailFrom: tvrtko.ursulin@igalia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LBZQ67BRKMRJEFTJS27THUSD3ZNRPE3T/>
Archived-At: 
 <https://lore.freedesktop.org/20251219135351.25880-23-tvrtko.ursulin@igalia.com/>
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

