Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D61619758E
	for <lists+nouveau@lfdr.de>; Mon, 30 Mar 2020 09:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC27B6E1E9;
	Mon, 30 Mar 2020 07:22:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 612 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2020 03:51:57 UTC
Received: from yyz.mikelr.com (yyz.mikelr.com [170.75.163.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB766E408
 for <nouveau@lists.freedesktop.org>; Thu,  5 Mar 2020 03:51:57 +0000 (UTC)
Received: from glidewell.ykf.mikelr.com (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id 84B523D087;
 Wed,  4 Mar 2020 22:41:44 -0500 (EST)
From: Mikel Rychliski <mikel@mikelr.com>
To: amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org
Date: Wed,  4 Mar 2020 22:41:25 -0500
Message-Id: <20200305034126.6989-2-mikel@mikelr.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20200305034126.6989-1-mikel@mikelr.com>
References: <20200305034126.6989-1-mikel@mikelr.com>
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:22:22 +0000
Subject: [Nouveau] [PATCH v2 1/2] drm/radeon: Stop directly referencing iomem
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Matthew Garrett <matthewgarrett@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

pci_platform_rom() returns an __iomem pointer which should not be
accessed directly. Change radeon_read_platform_bios() to use
memcpy_fromio() instead of calling kmemdup() on the __iomem pointer.

Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
---
 drivers/gpu/drm/radeon/radeon_bios.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index c42f73fad3e3..c3ae4c92a115 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -118,11 +118,14 @@ static bool radeon_read_platform_bios(struct radeon_device *rdev)
 		return false;
 	}
 
-	if (size == 0 || bios[0] != 0x55 || bios[1] != 0xaa) {
+	rdev->bios = kzalloc(size, GFP_KERNEL);
+	if (!rdev->bios)
 		return false;
-	}
-	rdev->bios = kmemdup(bios, size, GFP_KERNEL);
-	if (rdev->bios == NULL) {
+
+	memcpy_fromio(rdev->bios, bios, size);
+
+	if (size == 0 || rdev->bios[0] != 0x55 || rdev->bios[1] != 0xaa) {
+		kfree(rdev->bios);
 		return false;
 	}
 
-- 
2.13.7

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
