Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A418649D199
	for <lists+nouveau@lfdr.de>; Wed, 26 Jan 2022 19:21:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0010E4C2;
	Wed, 26 Jan 2022 18:21:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55810E4D4;
 Wed, 26 Jan 2022 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189971; x=1674725971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSjb9jgi2kMH0L+z03QNcdQ/wneGQJQTtAxcISB5aeM=;
 b=nqbhHq9mtzo92WF/+p7buhDEm6DvFuwvx7I/qHijWo1Etxgb6hLfMWX7
 Yl3ED80ZtAFdQrPJqI9ZtPtSu9WNkYDeK44XJs4DX42BzhSN5avz2hQsB
 UbYUsf587iWX2IGKYE2cJMFefIWFf65zOXJhdoZ1mTWijhmdkoBMQcfCL
 gUj/Apt4RMDVwkiz5UKWkjoKJ6HMkBbXsqZmGjBzb2m1Nxhqz6IkHlIRL
 N9zj2yFJyoeTvLHpHOLPaavbyk1ga1fyGJO+2vu3SaV4hNkY7FNTaRlzV
 /LJz4u2WbfP3wtAu+2zuUl6hAqaIxYgPztk3oVRrIXJ+gubrD5VRVaiol g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227188794"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="227188794"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433103"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Date: Wed, 26 Jan 2022 01:39:48 -0800
Message-Id: <20220126093951.1470898-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Jan 2022 18:21:14 +0000
Subject: [Nouveau] [PATCH v2 08/11] drm/gem: Sort includes alphabetically
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Sort includes alphabetically so it's easier to add/remove includes and
know when that is needed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_gem.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4dcdec6487bb..21631c22b374 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -25,20 +25,20 @@
  *
  */
 
-#include <linux/types.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/uaccess.h>
-#include <linux/fs.h>
+#include <linux/dma-buf-map.h>
+#include <linux/dma-buf.h>
 #include <linux/file.h>
-#include <linux/module.h>
+#include <linux/fs.h>
+#include <linux/mem_encrypt.h>
+#include <linux/mm.h>
 #include <linux/mman.h>
+#include <linux/module.h>
 #include <linux/pagemap.h>
-#include <linux/shmem_fs.h>
-#include <linux/dma-buf.h>
-#include <linux/dma-buf-map.h>
-#include <linux/mem_encrypt.h>
 #include <linux/pagevec.h>
+#include <linux/shmem_fs.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>
 
 #include <drm/drm.h>
 #include <drm/drm_device.h>
-- 
2.34.1

