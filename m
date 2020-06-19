Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BA8201D70
	for <lists+nouveau@lfdr.de>; Fri, 19 Jun 2020 23:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C3B6ECC3;
	Fri, 19 Jun 2020 21:57:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE09D6EC37
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jun 2020 21:57:07 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eed34800002>; Fri, 19 Jun 2020 14:56:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 19 Jun 2020 14:57:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 19 Jun 2020 14:57:07 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 21:56:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 19 Jun 2020 21:56:59 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eed34ab0000>; Fri, 19 Jun 2020 14:56:59 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Jun 2020 14:56:34 -0700
Message-ID: <20200619215649.32297-2-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619215649.32297-1-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592603776; bh=EbpELtDXWlOEn9/sFlHWHjNEWWHM8Fygh7aHygxJvkw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=D/2Q+9VH10ijip8uh5ig1/Pde+tcbxEtyrD9/PvgmuKGrUMIfCvSeajbMAK63TJpf
 pC/uc5FZ7WcJZ2Plsfa48iIKb30crq0KTrAO8Ei1gV79oo1Xp2DDlku4zIXqFslsaO
 Il6IZPPwEwDAWZ2np9JTdF91zoJ+bnIRfwWyRU3PJgFXXzcM4eKJkBvli0wGaj6AyM
 VXFStKX741Xc66ppZBzdLG0vp12KiZS0m3PajP7lycAQUCWk7bmn1LU3tC2rwFmmgA
 SdlzdTQuduSSB6g1XdaGlN4AVaNGAbgXQJyZsMuunUYid7pC+Qec6LJ8nku1iC9uXT
 xy9sWxKi89Zpw==
Subject: [Nouveau] [PATCH 01/16] mm: fix migrate_vma_setup() src_owner and
 normal pages
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The caller of migrate_vma_setup() does not know what type of page is
stored in the CPU's page tables. Pages within the specified range are
free to be swapped out, migrated, or freed until after migrate_vma_setup()
returns. The caller needs to set struct migrate_vma.src_owner in case a
page is a ZONE device private page that the device owns and might want to
migrate. However, the current code skips normal anonymous pages if
src_owner is set, thus preventing those pages from being migrated.
Remove the src_owner check for normal pages since src_owner only applies
to device private pages and allow a range of normal and device private
pages to be migrated.

Fixes: 800bb1c8dc80 ("mm: handle multiple owners of device private pages in migrate_vma")
Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 mm/migrate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index f37729673558..24535281cea3 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2295,8 +2295,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (migrate->src_owner)
-				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
 				mpfn = MIGRATE_PFN_MIGRATE;
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
