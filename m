Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656B2C9F89
	for <lists+nouveau@lfdr.de>; Tue,  1 Dec 2020 11:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380BF6E5A9;
	Tue,  1 Dec 2020 10:35:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DB06E58E;
 Tue,  1 Dec 2020 10:35:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89D7AAD18;
 Tue,  1 Dec 2020 10:35:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Date: Tue,  1 Dec 2020 11:35:27 +0100
Message-Id: <20201201103542.2182-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 05/20] drm/cirrus: Remove references to struct
 drm_device.pdev
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Convert cirrus to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/cirrus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 561c49d8657a..a043e602199e 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -602,7 +602,6 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
 
 	drm_mode_config_reset(dev);
 
-	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 	ret = drm_dev_register(dev, 0);
 	if (ret)
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
