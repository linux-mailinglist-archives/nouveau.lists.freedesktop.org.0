Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4BE7373B1
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 20:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A972910E32C;
	Tue, 20 Jun 2023 18:20:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Fri, 12 May 2023 10:38:55 UTC
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2904710E67B;
 Fri, 12 May 2023 10:38:55 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 12 May
 2023 13:33:22 +0300
Received: from KANASHIN1.fintech.ru (10.0.253.125) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 12 May
 2023 13:33:22 +0300
From: Natalia Petrova <n.petrova@fintech.ru>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 12 May 2023 13:33:20 +0300
Message-ID: <20230512103320.82234-1-n.petrova@fintech.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.125]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-Mailman-Approved-At: Tue, 20 Jun 2023 18:20:13 +0000
Subject: [Nouveau] [PATCH] nouveau_connector: add nv_encoder pointer check
 for NULL
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Natalia Petrova <n.petrova@fintech.ru>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Pointer nv_encoder could be dereferenced at nouveau_connector.c
in case it's equal to NULL by jumping to goto label.
This patch adds a NULL-check to avoid it.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3195c5f9784a ("drm/nouveau: set encoder for lvds")
Signed-off-by: Natalia Petrova <n.petrova@fintech.ru>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 43a9d1e1cf71..90ba6d0a9c80 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -729,7 +729,8 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 #endif
 
 	nouveau_connector_set_edid(nv_connector, edid);
-	nouveau_connector_set_encoder(connector, nv_encoder);
+	if (nv_encoder)
+		nouveau_connector_set_encoder(connector, nv_encoder);
 	return status;
 }
 
-- 
2.34.1

