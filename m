Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB58709A2
	for <lists+nouveau@lfdr.de>; Mon,  4 Mar 2024 19:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B001911247C;
	Mon,  4 Mar 2024 18:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Nr8N0bAY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CF8112474
 for <nouveau@lists.freedesktop.org>; Mon,  4 Mar 2024 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709577150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F9gPWxAqIxccC8AlqeFUtelqmyaQBlXMXZSupr7dlUM=;
 b=Nr8N0bAYuI4RMQD3EUeDBm/+XNDmsV+uHEixbAkJ/Ocb0sdQet57jk+oAIaK76rWKThZ8d
 zC7fldzWcU/prHY9ZID63w9/JXslfrefwy2iYR3FUlClftRe9OqsGSRkYWO6S22NOw194M
 ErCqYAtaHE74o1/aNXiBPeUlvonBE9w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-zzKoHkyBMcSkVyQCbeZxQg-1; Mon, 04 Mar 2024 13:32:27 -0500
X-MC-Unique: zzKoHkyBMcSkVyQCbeZxQg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a3160e7dfcbso70391266b.1
 for <nouveau@lists.freedesktop.org>; Mon, 04 Mar 2024 10:32:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709577146; x=1710181946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F9gPWxAqIxccC8AlqeFUtelqmyaQBlXMXZSupr7dlUM=;
 b=tLX909uTgvJgLCgb03SKuGjrT6WKjQIKqfPiUGp3wQeGFMPrBZdg4cj4ksPZgRZ0G5
 qluzcHSNCVh/f5Zyvajkw7oRQHzhZmcVeWcqtZvEN5nRBxH5J/UpUwUUiUJrbrRbE4+w
 2pWDlJE9zAGAw4rznPS4tk+a8QchVeNnG2ZMdbHxXc5zZ8Dt7HcgOfCgfoDnfO0H0xnI
 iIyWDxveeOf0ULCSPc1TXrfOB5CoA3UMDaDRj7iC0cRM/sTD4YbK2WZ+ii0W2Q2m8sL8
 3e1BhStUWYGOMBy6wEgDde0x6djvzzRG0wjeNau5strlkxisBEQkilR4OqJS6BRaaJZT
 GZNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJlQLFHS9C/rlFlLeO0xegHq5bWAGGon3v09SRIq+1LuGutjR1rOy1r3bNCo2s/Lh/83MGeo1eW9WgjVRmqBDHDoZjs9TRYEDTCsObZQ==
X-Gm-Message-State: AOJu0Yw3eGBC01WRFGqKWgLwFdYiOy1x3kZn5MS/a8OrN1H8d3jqzhDZ
 3t75EG8VjNk/Urd5IXIPz7/dB8Qt41bKNPKM0Jk9H+L36u0loT7mOX5LO3X05v21xs0VPLXdGj4
 JSN/ULbudXWbKulTb2GlSUZz5YJ6k3CfpiWsUa4cbNpDEcM86joMHuYB6mknRnvY=
X-Received: by 2002:a17:907:c787:b0:a3e:ac92:b952 with SMTP id
 tz7-20020a170907c78700b00a3eac92b952mr9568232ejc.5.1709577146184; 
 Mon, 04 Mar 2024 10:32:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsGCx4zG6do4zNtrBRrVyEOICLWH37Q9tXC93/H5tH8Kv6remnyfRjukUyyIlLyM94N97akA==
X-Received: by 2002:a17:907:c787:b0:a3e:ac92:b952 with SMTP id
 tz7-20020a170907c78700b00a3eac92b952mr9568214ejc.5.1709577145825; 
 Mon, 04 Mar 2024 10:32:25 -0800 (PST)
Received: from kherbst.pingu ([77.20.15.65]) by smtp.gmail.com with ESMTPSA id
 me25-20020a170906aed900b00a44efa48c24sm2705672ejb.117.2024.03.04.10.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 10:32:25 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Subject: [PATCH 1/2] drm/nouveau: fix stale locked mutex in
 nouveau_gem_ioctl_pushbuf
Date: Mon,  4 Mar 2024 19:31:56 +0100
Message-ID: <20240304183157.1587152-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

If VM_BIND is enabled on the client the legacy submission ioctl can't be
used, however if a client tries to do so regardless it will return an
error. In this case the clients mutex remained unlocked leading to a
deadlock inside nouveau_drm_postclose or any other nouveau ioctl call.

Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 49c2bcbef1299..5a887d67dc0e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -764,7 +764,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		return -ENOMEM;
 
 	if (unlikely(nouveau_cli_uvmm(cli)))
-		return -ENOSYS;
+		return nouveau_abi16_put(abi16, -ENOSYS);
 
 	list_for_each_entry(temp, &abi16->channels, head) {
 		if (temp->chan->chid == req->channel) {
-- 
2.43.2

