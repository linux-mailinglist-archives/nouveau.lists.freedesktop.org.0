Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3EC4B06F3
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AFD10E72C;
	Thu, 10 Feb 2022 07:28:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70CA10E731;
 Thu, 10 Feb 2022 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=biUf35pL02wIFMpMNWoBBONHWDySppy4KeY+mmnFunE=; b=z0PPCQlEy7lZgPcobsomDHfrD2
 RfCT6XQEVnCdXpUKaH7lF2CfDOqvdrFvk/NRPjx4QMJse63pAgHxXes+8qnPvqXD6aWDtGL76LZpx
 FNG8IhXHir0qeZeptI2V2APw9kdTX3mSqBOwlkyeLemuPxU54GKco1WhxGAlkpxo7XFIMatZOfEAt
 p3ImLSt8j1xkULdRUb1hVXqme3Bhrxvp4qKoBJa/zO9aDPMVcygwcZXnQHE+NnuaMBowY9HByj45j
 SOaU+8T1vGw4nb1PnKFoB0mXf1G61P2/YvFVsLwzDKNtnDwpLaq0mDNwb5PWlFqSJLbEbtB6KgQDq
 UdATH8qQ==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3sd-002rlb-Lk; Thu, 10 Feb 2022 07:28:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:04 +0100
Message-Id: <20220210072828.2930359-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 03/27] mm: remove pointless includes from
 <linux/hmm.h>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

hmm.h pulls in the world for no good reason at all.  Remove the
includes and push a few ones into the users instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
 drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
 include/linux/hmm.h                      | 9 ++-------
 lib/test_hmm.c                           | 2 ++
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index ed5385137f4831..cb835f95a76e66 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -24,6 +24,7 @@
 #include <linux/hmm.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/migrate.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 3828aafd3ac46f..e886a3b9e08c7d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -39,6 +39,7 @@
 
 #include <linux/sched/mm.h>
 #include <linux/hmm.h>
+#include <linux/migrate.h>
 
 /*
  * FIXME: this is ugly right now we are using TTM to allocate vram and we pin
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 2fd2e91d5107c0..d5a6f101f843e6 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -9,14 +9,9 @@
 #ifndef LINUX_HMM_H
 #define LINUX_HMM_H
 
-#include <linux/kconfig.h>
-#include <linux/pgtable.h>
+#include <linux/mm.h>
 
-#include <linux/device.h>
-#include <linux/migrate.h>
-#include <linux/memremap.h>
-#include <linux/completion.h>
-#include <linux/mmu_notifier.h>
+struct mmu_interval_notifier;
 
 /*
  * On output:
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 767538089a62e4..396beee6b061d4 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -26,6 +26,8 @@
 #include <linux/sched/mm.h>
 #include <linux/platform_device.h>
 #include <linux/rmap.h>
+#include <linux/mmu_notifier.h>
+#include <linux/migrate.h>
 
 #include "test_hmm_uapi.h"
 
-- 
2.30.2

