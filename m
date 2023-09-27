Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 547637AF7A9
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 03:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F80A10E45B;
	Wed, 27 Sep 2023 01:23:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A4810E45A
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 01:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695777794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=hoIddslBpfI1TPj5mn6dpXA+XNTRF7QFam+9kYeCug1JFEuzpTVTQZpm4FxYin00j5C9eA
 Q6T28QRf4ooDhFjsaYwsn5aA7gFkzd+ihYzgo2Mr0EFj69AkpVk7ZMorWavLMu9y4UQ9ux
 Y3JrBtwN8h4Kqni8UOD/D5VA1yyEZKQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-ML1OLqVKOVKGq8NTkXbfOA-1; Tue, 26 Sep 2023 21:23:13 -0400
X-MC-Unique: ML1OLqVKOVKGq8NTkXbfOA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-406227680a9so31067315e9.3
 for <nouveau@lists.freedesktop.org>; Tue, 26 Sep 2023 18:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695777791; x=1696382591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Nbhk/39NZ1l6uBmAD3wSLQe9P3Plz1M/2g+jaVSYB0=;
 b=KaAAgLQ1VO5JUODBWWkBnwpvaiDFWmMpOgNh9aS8iXmXHg8uTileCftz79FW25m2Qs
 yjlUsXMXWmHf6t0yhbxmfv7bwPG4X/M1pmlMbMlHoFkptD5E4Vi7l0e7aoZ89FhwFdxH
 3mSWWGioCi1psJj1Zw1voxuop2TLVqxZq4/myc/5w682zac4W41jC3h/e8bJd5EOt/eD
 EmMV4FgzrgE56egmOWMPjkRPGtjV5JSvfs+HHsBWozgLRgX56SfzKfKLXDPvhgpvY1eS
 XkKeW6AhhhFdya6U47t5vjUWPFX8FIvnXtEIJk4nml10c/sT4jLg07qsdbs8SlDHfvMi
 2BMw==
X-Gm-Message-State: AOJu0YziENqzGMQ8xnsrYECVZTQe/W/DKEfpRK+bC1rshJigvPQQHYTt
 rAkL8qqVePdGHKE9VlHoMchyoKftVg+hLApgYskprZ8G0jR6KDI9LevNcRxdPHPveT23Jb3YMN9
 ZSs4iGFerZ7C64yEkDyjimrKxmrHm0mm8xl+CL+gosVqgMbOQ+dTS3XP2oG+T4MNso/cyICErmS
 dS5KFB
X-Received: by 2002:a7b:c4cb:0:b0:401:b2c7:349b with SMTP id
 g11-20020a7bc4cb000000b00401b2c7349bmr507507wmk.7.1695777791609; 
 Tue, 26 Sep 2023 18:23:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvmAbCdHBtbBPYY6OwA93/GuTSA2vpx2zUL7qz1gxZ/SxzZagjHJOuLVzBKH22yWaBd8jbvw==
X-Received: by 2002:a7b:c4cb:0:b0:401:b2c7:349b with SMTP id
 g11-20020a7bc4cb000000b00401b2c7349bmr507483wmk.7.1695777791184; 
 Tue, 26 Sep 2023 18:23:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o12-20020aa7d3cc000000b005259dd903e5sm7355596edr.67.2023.09.26.18.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 18:23:10 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith.ekstrand@collabora.com
Date: Wed, 27 Sep 2023 03:22:52 +0200
Message-ID: <20230927012303.23525-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927012303.23525-1-dakr@redhat.com>
References: <20230927012303.23525-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH 2/3] drm/nouveau: chan: use channel class
 definitions
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Use channel class definitions instead of magic numbers.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index dffbee59be6a..ac56f4689ee3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -442,9 +442,11 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise dma tracking parameters */
-	switch (chan->user.oclass & 0x00ff) {
-	case 0x006b:
-	case 0x006e:
+	switch (chan->user.oclass) {
+	case NV03_CHANNEL_DMA:
+	case NV10_CHANNEL_DMA:
+	case NV17_CHANNEL_DMA:
+	case NV40_CHANNEL_DMA:
 		chan->user_put = 0x40;
 		chan->user_get = 0x44;
 		chan->dma.max = (0x10000 / 4) - 2;
-- 
2.41.0

