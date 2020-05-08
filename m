Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5A1CB237
	for <lists+nouveau@lfdr.de>; Fri,  8 May 2020 16:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115A46E25A;
	Fri,  8 May 2020 14:46:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Fri, 08 May 2020 14:46:27 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F156E25A
 for <nouveau@lists.freedesktop.org>; Fri,  8 May 2020 14:46:27 +0000 (UTC)
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mr9OA-1ikEYX0EAI-00oG15; Fri, 08 May 2020 16:40:51 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Ben Skeggs <bskeggs@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri,  8 May 2020 16:40:09 +0200
Message-Id: <20200508144017.3501418-2-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200508144017.3501418-1-arnd@arndb.de>
References: <20200508144017.3501418-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JWVQOgOnHysetYBnSk3CKrV5svFn5O5bRyqndsTcxkwhAVFX33K
 8QbP8gDLWPxaMFNAgd7F0Cl5FkzbK7UMEJIFy0zMaVqeRYEiRnApjKD442XntX1liV7tU8u
 +v58YzETQ9SV2Hp+cHqKt2yBzRbfWwCIKA6DW0+yHZ5CaJ628eVpggV+QV31QJGmJnChH1i
 vbw4Va8hrFgS/CW9ROAkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MblZA6y8Kbs=:U7UyWFTh9BdMzVFwSFvYJ2
 Ne1iMVIt7dyHGQtAFhha1J52HhX8lqba4RLpt7qvtUpX619nrRboviShYFwY+rsj3Dys2f6hH
 1Lhtx1NDvPWwdq1ZCA1IWVE6o1elGnAQy7UFtY14r9AoMtfut2Sc3Y4H9TzsKPflsCsPkfoo7
 3L6254kMwqrGnlcIgxlJxHa0w/lVFMssFt1yrSIvDlWyEmtOqujypYfmRQHcO6zy66A1nP0yG
 16REosoPrxWzioXOSB5bRylYIdGX5KYzCbGojIxKKZznvy2lv8UAOb+Jn6qrSGb8tqhVshJi0
 8Ly5jM0ATXtQsQXCykyrgrc09PgWb+CcToUddYca9mgIMjhUEnE1SK9sTsI7DoRSCmqwEdSto
 TNHfr+UmwFPnRRqoeympclRAJbYkykNG416bZ2LyIsxPOrc5w8RLIKqqXR+8fAf4JRZjPmX5s
 5UE3ZlfXr5EzJp6X7B3PGfkJ7oDitPiqqlxKhsAROlFYLBC60FctOEzTHjLMFkxpTEr/30khN
 l0jMHeb7jxO2vbepabRZSqRGnAenQNNh1jQZxPObw1IHDvn0KMbK5FFtjBDHiqCmmNS4mvj5F
 Sb2SbjmGVtnuhQdiYHYSpxYMxAHGGujZ2L2G33qZu1m3fG5tC82WYKxV5czBeTbrF5N4lsWyF
 T5JPBXDu0vDwBWQCAiGE/0mE40B7mDKgTAwmCUv3Icm1BMm04zfNR2xgPuc3QINBx+akFeXQi
 6Bxjy5vB07NnppraeZNPr6bQKfxBolqv4Xkywd2MOJKpl1j9e9kMvmwQIZFVyf9fyCsJvPZ/Q
 clbk+CPE700x8sALTZguxGZ/UbfpbzZqc9wW9PKfxSF5Y3XBH0=
Subject: [Nouveau] [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@mellanox.com>,
 Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

CONFIG_DEVICE_PRIVATE cannot be selected in configurations
without ZONE_DEVICE:

WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
  Depends on [n]: ZONE_DEVICE [=n]
  Selected by [y]:
  - DRM_NOUVEAU_SVM [=y] && HAS_IOMEM [=y] && DRM_NOUVEAU [=y] && MMU [=y] && STAGING [=y]
kernel/resource.c:1653:28: error: use of undeclared identifier 'PA_SECTION_SHIFT'
        size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
                                  ^
kernel/resource.c:1654:48: error: use of undeclared identifier 'MAX_PHYSMEM_BITS'

Add a dependency for Nouveau to avoid broken randconfig builds.

Fixes: d2c63df2242e ("mm/hmm: make CONFIG_DEVICE_PRIVATE into a select")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index af5793f3e7c2..996ec5475908 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -87,6 +87,7 @@ config DRM_NOUVEAU_BACKLIGHT
 config DRM_NOUVEAU_SVM
 	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
 	depends on DRM_NOUVEAU
+	depends on ZONE_DEVICE
 	depends on MMU
 	depends on STAGING
 	select DEVICE_PRIVATE
-- 
2.26.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
