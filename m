Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584D6F99E4
	for <lists+nouveau@lfdr.de>; Sun,  7 May 2023 18:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE1510E294;
	Sun,  7 May 2023 16:27:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC4910E236
 for <nouveau@lists.freedesktop.org>; Sun,  7 May 2023 16:26:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-000283-8N; Sun, 07 May 2023 18:26:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDZ-001nDq-4k; Sun, 07 May 2023 18:26:37 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDY-002Aho-7w; Sun, 07 May 2023 18:26:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  7 May 2023 18:25:56 +0200
Message-Id: <20230507162616.1368908-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Aas34mM8r2UNncCy6pRgZ1pPDP6Z2C/pivtVsXVacDI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EKYb5Y7UphJvliTa1p2Qa+Peo7Zfj3zhHQV
 xoLgcI3xSGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRCgAKCRCPgPtYfRL+
 TsOxB/9IbEHeot3Lcg1cjhsCFT3YoEpPBHJ3ftcqMl+xceLj65HX0/cvmFsefq244GcIROmaY5k
 O52hc2NfHqQfh6ywfG3O5lhF/+3N02k4VzXtbgxYCAWHTIxt3h6700EofIJJr+zk5W+MDlhmaZn
 QjwMRsGdNv3v0CV6oxRwedn3tujMRB4v/A7zW42jroRTphl5OEfvPDplZ7I9Pxmt5x1ErvU7GTD
 ObiGjPmRDjVmdb28/wIn55eq/mZ2++5ZO6HKmPjzxb5glLr7i9pEKr7erR+yqZypu1XtBeS6oLl
 NdE8TRY98MBl49hnNgu+bLm7Rm83A87mFiPdgCUlHH9HyUDm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: nouveau@lists.freedesktop.org
Subject: [Nouveau] [PATCH 33/53] drm/nouveau: Convert to platform remove
 callback returning void
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
Cc: nouveau@lists.freedesktop.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/nouveau/nouveau_platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 23cd43a7fd19..bf2dc7567ea4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -43,11 +43,10 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int nouveau_platform_remove(struct platform_device *pdev)
+static void nouveau_platform_remove(struct platform_device *pdev)
 {
 	struct drm_device *dev = platform_get_drvdata(pdev);
 	nouveau_drm_device_remove(dev);
-	return 0;
 }
 
 #if IS_ENABLED(CONFIG_OF)
@@ -93,5 +92,5 @@ struct platform_driver nouveau_platform_driver = {
 		.of_match_table = of_match_ptr(nouveau_platform_match),
 	},
 	.probe = nouveau_platform_probe,
-	.remove = nouveau_platform_remove,
+	.remove_new = nouveau_platform_remove,
 };
-- 
2.39.2

