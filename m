Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC7D4B06F5
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5D810E734;
	Thu, 10 Feb 2022 07:28:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6499910E72C;
 Thu, 10 Feb 2022 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kwsvzUopQYmLEvfJMWiUtpLaBV1PgK/k5zUYKi0uPVU=; b=4pvndCL1lsKtjRKUxsi/J7Dxvo
 nVmiNGk6UXupKHW1OLXR+4B82dW07jzHZuBVo0KXBKlc1qNmC8wL4iAMhe88kOdH+ywDPbwwF9isJ
 zbF7vyHcH7ZB+oAO5RJzYzy8W71AUbpN1yu6LoRPEFGk3WGoUPuwiizHeTv5+Dxm5s9U8hzEyCOt8
 I8EI2xE1INgu5bUL41ku3jeeQ+CB/t+j7R8IMGT6MS1jG+SWAmjnYIKA+e1oWVu8ukLRztAFH6T7V
 8EjsqXGdggi7lWnCIIbd6CMvnXjnA8fpTkgrBHYPiQATMsskbuYK1ZK5kbfbgLh9UO0N1uGxviSbZ
 SSBDKEhw==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3sa-002rlD-Of; Thu, 10 Feb 2022 07:28:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:03 +0100
Message-Id: <20220210072828.2930359-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 02/27] mm: remove the __KERNEL__ guard from
 <linux/mm.h>
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
 Jason Gunthorpe <jgg@nvidia.com>, Muchun Song <songmuchun@bytedance.com>,
 Alex Deucher <alexander.deucher@amd.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

__KERNEL__ ifdefs don't make sense outside of include/uapi/.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/mm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 213cc569b19223..7b46174989b086 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3,9 +3,6 @@
 #define _LINUX_MM_H
 
 #include <linux/errno.h>
-
-#ifdef __KERNEL__
-
 #include <linux/mmdebug.h>
 #include <linux/gfp.h>
 #include <linux/bug.h>
@@ -3381,5 +3378,4 @@ madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 }
 #endif
 
-#endif /* __KERNEL__ */
 #endif /* _LINUX_MM_H */
-- 
2.30.2

