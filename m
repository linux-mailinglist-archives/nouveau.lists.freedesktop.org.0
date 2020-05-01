Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6B51C1CC9
	for <lists+nouveau@lfdr.de>; Fri,  1 May 2020 20:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1453F6ED26;
	Fri,  1 May 2020 18:20:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133206ED2E
 for <nouveau@lists.freedesktop.org>; Fri,  1 May 2020 18:20:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g26so4736652qtv.13
 for <nouveau@lists.freedesktop.org>; Fri, 01 May 2020 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOiT8FHsMfb+oRC0pzOL8LtbK6cf6y0BAjxvZNjz6Ac=;
 b=YnEKZmtBx1YbYzGPbPdBGbnMbt0OXJjFaApiGvDrsGv6ZgQeTiXlfNGWihSUgqnU2P
 acVdTRVOtrG1eElDWSELNea95hFLWSFZgKAJy+jW8AXS/KdOvgGlVkx0+AwK++ef+Jt/
 fJuDxRG/AWmp5aOHTYtXf2qoZtAj4VOzPGFCk/gR8Ca0wrDCyWOqhcuDCUU1RgedWtNE
 J5mY1cdflLcFJL12S9MfXScHeWZjg98YCscUinNY0SNzrN/luyl28N3Ur9WH9Hr4YznZ
 WBushfQW045XKA0g/Rp6CFxaPq5yD4jBBrUzXNkNpApR2ubGmsZKFBpZ4P+EJajaofml
 PLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOiT8FHsMfb+oRC0pzOL8LtbK6cf6y0BAjxvZNjz6Ac=;
 b=YV6+cpWkD6kmA71bSBRz0h+tZ/O6T1tZDvvfyZQSlYUMrKJLLQxUSg6MQVlxjSQxYZ
 CK5i0vGL3QCu0MUtEuWlVUYfZcfgRtn6sE0Fj+s1yjZH7vZUyqQX2WF8l3r4vvQyEp6r
 YijZLENez0blG13USAjHq0KCuEsbBfvEUKi7+w7QaVNj6kiUNNrk/A4hXRtlcdFsjSG3
 APL77QsG1mmlMDpYCUshj+A0/2xp/HAw4kRBLFCilb1TVD6gdQWU630W7lxLllLttOas
 AlnBg/NM/KDwfEll3lcZOCBAqX2tBP4gHK1QpZ22IqGvDjHoZXb4JHacWQjV3giIBL47
 BA7g==
X-Gm-Message-State: AGi0PuYM0XO8uQSbmT9w5/aE3Kvp0/ZeHnGKbTTOHN4GHj2aDVlVasTx
 q/QNbb47k0tZljYR6T1BxP84xg==
X-Google-Smtp-Source: APiQypJgulEZ/YatjwuslK7tHEqoq3+2iy5CM5yhNPH1hyfVPJpK8CW6XH0j4J2yKeXBw/W+QKk6yA==
X-Received: by 2002:ac8:6043:: with SMTP id k3mr4601056qtm.99.1588357251210;
 Fri, 01 May 2020 11:20:51 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 70sm3240374qkh.67.2020.05.01.11.20.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 11:20:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jUaHI-0006ol-NA; Fri, 01 May 2020 15:20:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org,
	Ralph Campbell <rcampbell@nvidia.com>
Date: Fri,  1 May 2020 15:20:47 -0300
Message-Id: <4-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
In-Reply-To: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
References: 
MIME-Version: 1.0
Subject: [Nouveau] [PATCH hmm v2 4/5] mm/hmm: remove HMM_PFN_SPECIAL
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
 amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

This is just an alias for HMM_PFN_ERROR, nothing cares that the error was
because of a special page vs any other error case.

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 1 -
 drivers/gpu/drm/nouveau/nouveau_svm.c   | 1 -
 include/linux/hmm.h                     | 8 --------
 mm/hmm.c                                | 2 +-
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 41ae7f96f48194..76b4a4fa39ed04 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -775,7 +775,6 @@ static const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] = {
 static const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] = {
 	0xfffffffffffffffeUL, /* HMM_PFN_ERROR */
 	0, /* HMM_PFN_NONE */
-	0xfffffffffffffffcUL /* HMM_PFN_SPECIAL */
 };
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index c68e9317cf0740..cf0d9bd61bebf9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -379,7 +379,6 @@ static const u64
 nouveau_svm_pfn_values[HMM_PFN_VALUE_MAX] = {
 	[HMM_PFN_ERROR  ] = ~NVIF_VMM_PFNMAP_V0_V,
 	[HMM_PFN_NONE   ] =  NVIF_VMM_PFNMAP_V0_NONE,
-	[HMM_PFN_SPECIAL] = ~NVIF_VMM_PFNMAP_V0_V,
 };
 
 /* Issue fault replay for GPU to retry accesses that faulted previously. */
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 0df27dd03d53d7..81c302c884c0e3 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -44,10 +44,6 @@ enum hmm_pfn_flag_e {
  * Flags:
  * HMM_PFN_ERROR: corresponding CPU page table entry points to poisoned memory
  * HMM_PFN_NONE: corresponding CPU page table entry is pte_none()
- * HMM_PFN_SPECIAL: corresponding CPU page table entry is special; i.e., the
- *      result of vmf_insert_pfn() or vm_insert_page(). Therefore, it should not
- *      be mirrored by a device, because the entry will never have HMM_PFN_VALID
- *      set and the pfn value is undefined.
  *
  * Driver provides values for none entry, error entry, and special entry.
  * Driver can alias (i.e., use same value) error and special, but
@@ -56,12 +52,10 @@ enum hmm_pfn_flag_e {
  * HMM pfn value returned by hmm_vma_get_pfns() or hmm_vma_fault() will be:
  * hmm_range.values[HMM_PFN_ERROR] if CPU page table entry is poisonous,
  * hmm_range.values[HMM_PFN_NONE] if there is no CPU page table entry,
- * hmm_range.values[HMM_PFN_SPECIAL] if CPU page table entry is a special one
  */
 enum hmm_pfn_value_e {
 	HMM_PFN_ERROR,
 	HMM_PFN_NONE,
-	HMM_PFN_SPECIAL,
 	HMM_PFN_VALUE_MAX
 };
 
@@ -110,8 +104,6 @@ static inline struct page *hmm_device_entry_to_page(const struct hmm_range *rang
 		return NULL;
 	if (entry == range->values[HMM_PFN_ERROR])
 		return NULL;
-	if (entry == range->values[HMM_PFN_SPECIAL])
-		return NULL;
 	if (!(entry & range->flags[HMM_PFN_VALID]))
 		return NULL;
 	return pfn_to_page(entry >> range->pfn_shift);
diff --git a/mm/hmm.c b/mm/hmm.c
index f06bcac948a79b..2e975eedb14f89 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -301,7 +301,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			pte_unmap(ptep);
 			return -EFAULT;
 		}
-		*pfn = range->values[HMM_PFN_SPECIAL];
+		*pfn = range->values[HMM_PFN_ERROR];
 		return 0;
 	}
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
