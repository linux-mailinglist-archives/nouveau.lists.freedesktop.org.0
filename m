Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14A7082FC
	for <lists+nouveau@lfdr.de>; Thu, 18 May 2023 15:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512FD10E0BD;
	Thu, 18 May 2023 13:43:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A55288A3E
 for <nouveau@lists.freedesktop.org>; Thu, 18 May 2023 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NrwaDXndPVrlGW4jqCyf20MCAXo0YJy7aoO3FDItFxI=; b=lh9YNaJgqjsQ4ABDzfBXPDYhnF
 0rgvGegVpdV31RoZMvM9hbEbN94AXBXG4zrc9vSce86yoaAY93okWrN31ceblBj4ur0q1+YmfM6Hg
 v2JiJP+oecPzr+HP7G86rf0eM/dmlMOfuhqIhS4tMRcj+JGXLecrE0QZepRPPoZJwkQxnA+j3FdZt
 RlxkFpSPRj7ljl509O3DDGybPMxj20tGTo404+biDFXzMLHmhd46mUIWs42T8tBhOx2EJsaRBCXG2
 KFhN7YElPvMIUpYDvbAlPmwYYGOnFHuhw97nSyrLo0FGUtm5W07Q29cDo0EwumNuBftywhBKx3uyT
 dshNqNvg==;
Received: from [2001:4bb8:188:3dd5:1149:8081:5f51:3e54] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzduN-00D6T3-0S; Thu, 18 May 2023 13:43:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Date: Thu, 18 May 2023 15:42:53 +0200
Message-Id: <20230518134253.909623-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518134253.909623-1-hch@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 4/4] swiotlb: unexport is_swiotlb_active
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Drivers have no business looking at dma-mapping or swiotlb internals.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index af2e304c672c43..9f1fd28264a067 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -921,7 +921,6 @@ bool is_swiotlb_active(struct device *dev)
 
 	return mem && mem->nslabs;
 }
-EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.39.2

