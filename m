Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE7D0BA68
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 18:30:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C786210E926;
	Fri,  9 Jan 2026 17:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="ZBsKCTBd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7471344C96;
	Fri,  9 Jan 2026 17:22:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767979331;
 b=NeXp0sVXpWperJsnmha4kXUbnr83JGwr+KxAHMKQuetJBwtdSS8EE10TGdVIZN7ZCR3qc
 7PzIcGBwdF3NsMnj3ThHFB0uf43h60bJl1qvAN8NgdQBbrsu/Sg0mJnVMZWssYMwFb3e/a3
 D4Ic8pTe+rsb0QDRUiJudQ2h7wDmrahTCbgZYyyZHM34v4+K6wWZOxlrTkwfMnDFpNZtLzI
 Xd0/Xs6ObQ06QGgSCvRPj1lb3ZnEK6clMDvT9OtqVOpiT/JyB15dOpHPAIoqJgtKHfy4Rni
 9bKm/UKF5K4gzcHs7bM8s/bpc+TwEM58RYswG+Psg0uiAHTfAx5P6nCO4PDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767979331; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=soBNR1e6XweQILJtXjtm9TEGUThkXw+V/3f+H5hzVkI=;
 b=AIoXMnJ/scrLRQTUBGXxBWP/jwNSHI/zQB3vNx8TwkjB/WPTAJ6yu74p4U7mBo6FWAYAO
 yS5xqYZXyFBTRf6Uk1RBU9DWv0hyAp6Ez/+ynWhiGkcBKLbF6yh/Uq7ARIlpxVy4wCCUFmF
 vKQ2Klqtw9LWCmk4tMxCLLgbJzGcmtkSGiDc3/pZjJB6B7M3lnYkFcKCCpHsyUzIFxC4+2s
 Rkd+FY/3JhhGQmlzkW7wA7g3j4LojMSAcIPd+bg1s5kK/cP8ANuQMIAna47SxrgsX7q2eHI
 JeEhWiDwhkup7oJnruJ/AMSrjDtdpfuWBRqJK9/olx347yrzFsy+mKLGMznA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mary.zone;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mary.zone;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2B4E844C3C
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:22:08 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 421CA10E917
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:28 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b73161849e1so878108466b.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Jan 2026 09:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mary.zone; s=google; t=1767979827; x=1768584627;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soBNR1e6XweQILJtXjtm9TEGUThkXw+V/3f+H5hzVkI=;
        b=ZBsKCTBdThilIS9f2qYpq/c4f2B0WL34ayZXdD5jMvjDWCozGADBSl8NhUa6djFMNP
         HllP2hQUQ+5vOWA1ReQ6aNoG2x5N+DkgyhdoU6B3HDLcgdzqTdVS1ogBc5tYzaiwb/c8
         yfr5Jq9n1UysuCr9pn/UdTDldJ7QPG4wlg2lsQwuIFMButyfjI0IOTAcaI9SyZhxdbKp
         xRqQpYUplz97APesEDzz2iCE4v6DdtVE+vg9mnHnuc0cWclHlQ3GJcA+gW3fNShrEsw2
         ZSBjIexEJm3bIqHdTOpo/I9/vK197X4bydo+X1VxMEdda8CmfJDW5Bumi0reHaFQ7hQk
         ddzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979827; x=1768584627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=soBNR1e6XweQILJtXjtm9TEGUThkXw+V/3f+H5hzVkI=;
        b=HxZiVnMcN9xeZyFeQWvmEpTJd4+a18PRXSnaiAPuJznxCf/aadT7Ct1/tKh9Lf5apf
         gwOF82/GncfrK6/UsYVPtZRhMRf7eFPrUeBKcolqtGnaHhnvfsWIteOTFVgycUQfX824
         licntRA7qfRhguuDIMirLCKCZZ/RqXTpLom/GGMHzz9VK9NwUIQeJbjt0zR0Zs2zgPsq
         50Px5I3jg4M3nN1gVBFka1MQMTHf8Ux3LoSEBgBzrmiHi0wH6Rgouc/lILofISHL5+L+
         72YWoUymikYTRzkQYr745guMOmc4qNLhUYaL45JvZhAjn09tHlDSuhCpNdXpa98PuV+g
         Lj2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqd1JBzPqfzmL5ak6eMk7/1lTMctZeXz2vnMkaxcg/F33fqYEIEf2TMr0d6SDXauaCtYXuWCQt@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw7Xd5bzjfuwxzER1PBUhAwSaBZJVZWCHeRGNA6f/nOBODJsuJ
	OosptJJ64AoFuqKoNFJQJxeObIoABJOgbnwcIUj9K4XX1ClmgCwkMKiV4l/nK2G0aKo=
X-Gm-Gg: AY/fxX4DsX48+JLDXw/CvfNzfbXBzm+5ewmthyezBsjfI/xMUfreu0o1GStEmZgk/7r
	CKvB1jQ7i1cXk+sAztFnsSj9mDeON94qkJoWKdkLtaLHO0SU1X0E4E8Y85Pnxx106jc545DMiyu
	lzsqG6NMRPBFK/slS9LQwAitIyqt5RBsFAJ0lQ6T/RCpc5LwO2Hk/6Oif37myugeZ4gvx+oO8/q
	FcpLHqTFcIiZDpp56SsDBUlw0JxffSjGDAzKlx//uezoIBek/ET+EhVCOTpkcqB/5jlnt0rRjh9
	EbxLYwa6BPYlEfMpy7mcYD4zG50V+A7F6z/5REqlx3A05iWtOZV4dpGNX0rRB9t72f24ooUZqiR
	hn5kgQWXaseSLljmOQE6kHlvDah13MY7HthoUDLIlh3Mo0eIREf+KcMnRYOqkdT+YZ+V3AwpvQS
	Hj9jTmUDhJ4Q5YN+MIGFH3RX110mELw8RUEY+7iGKmRKY1h+8mzD6N5O2B0+ZQ3CeotDacjlw=
X-Google-Smtp-Source: 
 AGHT+IHFU94UKK7N8MjH0NapjtAUM1yZypK3zcxYo0z9XKFp722c/LN1D62iYRnj+aYYDrmJMwDA6A==
X-Received: by 2002:a17:907:7283:b0:b73:79e9:7d3b with SMTP id
 a640c23a62f3a-b84451ec8bamr1068044566b.25.1767979821976;
        Fri, 09 Jan 2026 09:30:21 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:30:21 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Fri, 09 Jan 2026 18:30:12 +0100
Subject: [PATCH 3/3] drm/nouveau: Increase GPFIFO ring buffer size on
 Maxwell+
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-nouveau-gpfifo-increase-v1-3-ed0be9822878@mary.zone>
References: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
In-Reply-To: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
Message-ID-Hash: VTC3IUO6HKDR47SGAXLL6KSSFLLH2AEY
X-Message-ID-Hash: VTC3IUO6HKDR47SGAXLL6KSSFLLH2AEY
X-MailFrom: mary@mary.zone
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VTC3IUO6HKDR47SGAXLL6KSSFLLH2AEY/>
Archived-At: 
 <https://lore.freedesktop.org/20260109-nouveau-gpfifo-increase-v1-3-ed0be9822878@mary.zone/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Since Tesla days, the limit has been increased considerably.

>From the various testing I did, since at least Maxwell, it is safe
to use up to at least 32768 entries and this should be matching
NVIDIA proprietary driver behavior.

This patch increase the ring buffer to 32768 entries on Maxwell and
later allowing up to 16382 entries to be used by the userspace.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_chan.h  |  6 +++++-
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a5445e97179f..d4a25a442568 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -233,10 +233,24 @@ static inline int
 getparam_dma_ib_max(struct nvif_device *device)
 {
 	const struct nvif_mclass hosts[] = {
-		{ NV03_CHANNEL_DMA, 0 },
-		{ NV10_CHANNEL_DMA, 0 },
-		{ NV17_CHANNEL_DMA, 0 },
-		{ NV40_CHANNEL_DMA, 0 },
+		{ BLACKWELL_CHANNEL_GPFIFO_B, 0 },
+		{ BLACKWELL_CHANNEL_GPFIFO_A, 0 },
+		{    HOPPER_CHANNEL_GPFIFO_A, 0 },
+		{    AMPERE_CHANNEL_GPFIFO_B, 0 },
+		{    AMPERE_CHANNEL_GPFIFO_A, 0 },
+		{    TURING_CHANNEL_GPFIFO_A, 0 },
+		{     VOLTA_CHANNEL_GPFIFO_A, 0 },
+		{    PASCAL_CHANNEL_GPFIFO_A, 0 },
+		{   MAXWELL_CHANNEL_GPFIFO_A, 0 },
+		{    KEPLER_CHANNEL_GPFIFO_B, 0 },
+		{    KEPLER_CHANNEL_GPFIFO_A, 0 },
+		{     FERMI_CHANNEL_GPFIFO  , 0 },
+		{       G82_CHANNEL_GPFIFO  , 0 },
+		{      NV50_CHANNEL_GPFIFO  , 0 },
+		{      NV40_CHANNEL_DMA     , 0 },
+		{      NV17_CHANNEL_DMA     , 0 },
+		{      NV10_CHANNEL_DMA     , 0 },
+		{      NV03_CHANNEL_DMA     , 0 },
 		{}
 	};
 	int cid;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 294d061497c0..708ded06a859 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -67,13 +67,17 @@ int  nouveau_channel_idle(struct nouveau_channel *);
 void nouveau_channel_kill(struct nouveau_channel *);
 
 /* Maximum GPFIFO entries per channel. */
-#define NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT (0x02000 / 8)
+#define NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT		(0x02000 / 8)
+#define MAXWELL_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT	(0x40000 / 8)
 
 static inline u32 nouveau_channel_get_gpfifo_entries_count(u32 oclass)
 {
 	if (oclass < NV50_CHANNEL_GPFIFO)
 		return 0;
 
+	if (oclass >= MAXWELL_CHANNEL_GPFIFO_A)
+		return MAXWELL_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
+
 	return NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
 }
 

-- 
2.52.0

