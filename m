Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6065BD302DF
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 12:14:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3322310E88C;
	Fri, 16 Jan 2026 11:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzkhG8Cl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E243E44CAA;
	Fri, 16 Jan 2026 11:05:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768561535;
 b=z4uRh0SfjuMI4va4MG/Y40wnrsjx3VF278qI4OFneJ1qGbjMm3yL3yxT+n/tmNp1+fcm/
 rfcP8+2+JUZzAlC+S4nqQPb0TW78XcvpkCUMUQrsADumTp4UKvMwY5MmE/zrZFvERZv4eXV
 TPcaLlnEpmOO+ODaO5l8oiLL/JQgCrb54pRElJEVPx0aBcswsNNwuI1xoQ5kHBy4scUWv7w
 nWwlrqDzKa1ybUnVl4TwoJhBgKr3mv3Nc8JTmMCsXhQ2FLLZE/ULW3XVGkR9Pr2QuY/yUTG
 kBiT28PBD5lJXgVl+JTALH3ce4BKXFrnklnEuLX9c8q9zNheRPCSZKzSfU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768561535; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=p6W/APdM9Oyy0cV5UpBAmEvhWdE7mtiBYO3W/yS4SnI=;
 b=iPcxhBD7P3xZX2+Q8+znIKtkCmPr9ei44iEK9+GWSDPZBARs7cCkTZQ9cS5PBUN++HMuO
 lWnWihwApbGkkX58ePTj6nDovNWktM+3XI+cceSGTHAMyXUpf/+0+jTHMHGyxGeaSLw6FyO
 q+vxI6Kx/LYSVg8h3EyYp8sUoAGIiXlCUzCif/fKJr1KNtjVpNFKTAeoTUlLI4nb6KbGVV2
 C3oTgQQQjp6OZUMBfNYnDVR9xSS95Hj290DOj3REp1N19QfWFkblOHMcWynZg4DY4W0ShIE
 xfwfK/9NuZZX4KNeIdGzWssp3aR55ZcGTdPgX7T3hITnqFlPCjySEMmxq5vA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D12A940635
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 11:05:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D1F3F10E885;
	Fri, 16 Jan 2026 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768562048; x=1800098048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0SRLvn1v5u7eTbuUJ05A/prO4E/QbcRKaOudyYKH0FM=;
  b=RzkhG8ClSEujVTbhVE35xTJYiSkVcBtue6eYCqdEPI+O2yxvr2/eAvRC
   OoVDqS2Pp2AVPzkwkuCpAOupdeT4fWNeF/ED/x2MDCF0o8CC5Q2yOOmfB
   wRVnJRqmuU1UAmrrosh+lCPBzW2iu99oRxxLp8AkfUCE8MGiBfQjfOJIm
   54p7z/9rVnoIQ/A47o14A2qjCLK8xCwJp0TtkAvRGIkMor2E3kkZG9do7
   r80QaRRapuCRuYG95vW2tH5jYfLvsNVahUOVeqMs65QjNWrvzRk8G2801
   38oqdBTN+VUgbugM2GYHMKwTMHaT3knZRSIFT1DlFKKAU7DFdB7R5oc7Y
   g==;
X-CSE-ConnectionGUID: VVSXEQ2oQl2bLvjt00NgSQ==
X-CSE-MsgGUID: Ct3OyjqFQAKz+mePAMjqsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69930645"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800";
   d="scan'208";a="69930645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:14:08 -0800
X-CSE-ConnectionGUID: EolNQg6USFuQBa0DkCMuow==
X-CSE-MsgGUID: If0ItoI+QHC6rHFKmUK5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800";
   d="scan'208";a="209713435"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.245.100])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 03:13:59 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device private
 folios
Date: Fri, 16 Jan 2026 12:10:16 +0100
Message-ID: <20260116111325.1736137-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260116111325.1736137-1-francois.dugast@intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DPT5JXFXYNEWV5PBENXG3KVBZ6GKCJ5J
X-Message-ID-Hash: DPT5JXFXYNEWV5PBENXG3KVBZ6GKCJ5J
X-MailFrom: francois.dugast@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org,
 Francois Dugast <francois.dugast@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DPT5JXFXYNEWV5PBENXG3KVBZ6GKCJ5J/>
Archived-At: 
 <https://lore.freedesktop.org/20260116111325.1736137-2-francois.dugast@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Reinitialize metadata for large zone device private folios in
zone_device_page_init prior to creating a higher-order zone device
private folio. This step is necessary when the folio’s order changes
dynamically between zone_device_page_init calls to avoid building a
corrupt folio. As part of the metadata reinitialization, the dev_pagemap
must be passed in from the caller because the pgmap stored in the folio
page may have been overwritten with a compound head.

Without this fix, individual pages could have invalid pgmap fields and
flags (with PG_locked being notably problematic) due to prior different
order allocations, which can, and will, result in kernel crashes.

Cc: Zi Yan <ziy@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: adhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-mm@kvack.org
Cc: linux-cxl@vger.kernel.org
Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>

---

The latest revision updates the commit message to explain what is broken
prior to this patch and also restructures the patch so it applies, and
works, on both the 6.19 branches and drm-tip, the latter in which includes
patches for the next kernel release PR. Intel CI passes on both the 6.19
branches and drm-tip at point of the first patch in this series and the
last (drm-tip only given subsequent patches in the series require in
patches drm-tip but not present 6.19).
---
 arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 drivers/gpu/drm/drm_pagemap.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
 include/linux/memremap.h                 |  9 ++++--
 lib/test_hmm.c                           |  4 ++-
 mm/memremap.c                            | 35 +++++++++++++++++++++++-
 7 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e5000bef90f2..7cf9310de0ec 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 
 	dpage = pfn_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
-	zone_device_page_init(dpage, 0);
+	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
 	return dpage;
 out_clear:
 	spin_lock(&kvmppc_uvmem_bitmap_lock);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index af53e796ea1b..6ada7b4af7c6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
 	page = pfn_to_page(pfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
-	zone_device_page_init(page, 0);
+	zone_device_page_init(page, page_pgmap(page), 0);
 }
 
 static void
diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 03ee39a761a4..38eca94f01a1 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
 					struct drm_pagemap_zdd *zdd)
 {
 	page->zone_device_data = drm_pagemap_zdd_get(zdd);
-	zone_device_page_init(page, 0);
+	zone_device_page_init(page, page_pgmap(page), 0);
 }
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 58071652679d..3d8031296eed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 			order = ilog2(DMEM_CHUNK_NPAGES);
 	}
 
-	zone_device_folio_init(folio, order);
+	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
 	return page;
 }
 
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 713ec0435b48..e3c2ccf872a8 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
 }
 
 #ifdef CONFIG_ZONE_DEVICE
-void zone_device_page_init(struct page *page, unsigned int order);
+void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
+			   unsigned int order);
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
@@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long memremap_compat_align(void);
 
-static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
+static inline void zone_device_folio_init(struct folio *folio,
+					  struct dev_pagemap *pgmap,
+					  unsigned int order)
 {
-	zone_device_page_init(&folio->page, order);
+	zone_device_page_init(&folio->page, pgmap, order);
 	if (order)
 		folio_set_large_rmappable(folio);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 8af169d3873a..455a6862ae50 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
 			goto error;
 	}
 
-	zone_device_folio_init(page_folio(dpage), order);
+	zone_device_folio_init(page_folio(dpage),
+			       page_pgmap(folio_page(page_folio(dpage), 0)),
+			       order);
 	dpage->zone_device_data = rpage;
 	return dpage;
 
diff --git a/mm/memremap.c b/mm/memremap.c
index 63c6ab4fdf08..ac7be07e3361 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -477,10 +477,43 @@ void free_zone_device_folio(struct folio *folio)
 	}
 }
 
-void zone_device_page_init(struct page *page, unsigned int order)
+void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
+			   unsigned int order)
 {
+	struct page *new_page = page;
+	unsigned int i;
+
 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
 
+	for (i = 0; i < (1UL << order); ++i, ++new_page) {
+		struct folio *new_folio = (struct folio *)new_page;
+
+		/*
+		 * new_page could have been part of previous higher order folio
+		 * which encodes the order, in page + 1, in the flags bits. We
+		 * blindly clear bits which could have set my order field here,
+		 * including page head.
+		 */
+		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
+
+#ifdef NR_PAGES_IN_LARGE_FOLIO
+		/*
+		 * This pointer math looks odd, but new_page could have been
+		 * part of a previous higher order folio, which sets _nr_pages
+		 * in page + 1 (new_page). Therefore, we use pointer casting to
+		 * correctly locate the _nr_pages bits within new_page which
+		 * could have modified by previous higher order folio.
+		 */
+		((struct folio *)(new_page - 1))->_nr_pages = 0;
+#endif
+
+		new_folio->mapping = NULL;
+		new_folio->pgmap = pgmap;	/* Also clear compound head */
+		new_folio->share = 0;   /* fsdax only, unused for device private */
+		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
+		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
+	}
+
 	/*
 	 * Drivers shouldn't be allocating pages after calling
 	 * memunmap_pages().
-- 
2.43.0

