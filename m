Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 518525961DA
	for <lists+nouveau@lfdr.de>; Tue, 16 Aug 2022 20:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8910E4A6;
	Tue, 16 Aug 2022 18:05:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC410E760
 for <nouveau@lists.freedesktop.org>; Tue, 16 Aug 2022 18:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660673091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vj3cIZcCBDULA4NmxKYoWknQPWn37X5VQr3izicvJT0=;
 b=VYJHEGZCAjjCizk30Y2tBKMzMsAWx0O/1eLri7h5uHH6b0XpYe1wRnmgp/dQAKq4xzkOex
 IisiDvp5mOYOFLeftkLqL7xbjrsSNzI0Pv6mS9RCELmBlq7e/ubm+is1X7dYihqu/fHbA5
 svDZ0jIOI6ZVofscv3z4x1linC50Ctw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-u0BbiRwkPXOE-jIn54ZHFw-1; Tue, 16 Aug 2022 14:04:48 -0400
X-MC-Unique: u0BbiRwkPXOE-jIn54ZHFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29ED31019C96;
 Tue, 16 Aug 2022 18:04:48 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A5D41121314;
 Tue, 16 Aug 2022 18:04:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 16 Aug 2022 14:04:36 -0400
Message-Id: <20220816180436.156310-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Nouveau] [PATCH] drm/nouveau/kms/nv140-: Disable interlacing
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

As it turns out: while Nvidia does actually have interlacing knobs on their
GPU still pretty much no current GPUs since Volta actually support it.
Trying interlacing on these GPUs will result in NVDisplay being quite
unhappy like so:

nouveau 0000:1f:00.0: disp: chid 0 stat 00004802 reason 4 [INVALID_ARG] mthd 2008 data 00000001 code 00080000
nouveau 0000:1f:00.0: disp: chid 0 stat 10005080 reason 5 [INVALID_STATE] mthd 0200 data 00000001 code 00000001

So let's fix this by following the same behavior Nvidia's driver does and
disable interlacing entirely.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 43a9d1e1cf71..8100c75ee731 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -504,7 +504,8 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 			connector->interlace_allowed =
 				nv_encoder->caps.dp_interlace;
 		else
-			connector->interlace_allowed = true;
+			connector->interlace_allowed =
+				drm->client.device.info.family < NV_DEVICE_INFO_V0_VOLTA;
 		connector->doublescan_allowed = true;
 	} else
 	if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS ||
-- 
2.37.1

