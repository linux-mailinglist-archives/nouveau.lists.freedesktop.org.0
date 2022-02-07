Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C24AB4B1
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 07:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A117B10E99F;
	Mon,  7 Feb 2022 06:33:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9B610EAC3;
 Mon,  7 Feb 2022 06:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WofxUCZiATU1kpjAffXWYlHs1O9R63dP0KIEP8T6lOA=; b=XJHVb3iW+vRrzF9+OySIruHUHn
 Sa6JPCczwpkeGE/buqDc+PYoIxMi8hFrFYyLseWB5aeyxAWFEuDdds4wgKz8ZRPCvCdr33rP9O0HF
 v/pVQbdEr6bY5vfFVJrYIljpa4P0n6HzT5Jui1ak7lXKG5STjVikrsaXojUen8cqn8eYWCWs17mpr
 iW8tBBjck+jMijGUGKCf/NKpYzo0UDqScPKpzOg/jRnU8FoVS5rJH0cx8lmOJ+IaEsF5tNnX6TI55
 Pm5wt1la8xBFuylMyrlyQRL5aDyAZSR1a7njqGPtVv9wYqYTiF2n9Vei2jCPBt1Np6YFvt/aQ66Y+
 bA8/QOuA==;
Received: from [2001:4bb8:188:3efc:2cbe:55d7:bb63:46d2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxa1-0099Gj-VV; Mon, 07 Feb 2022 06:32:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Mon,  7 Feb 2022 07:32:42 +0100
Message-Id: <20220207063249.1833066-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220207063249.1833066-1-hch@lst.de>
References: <20220207063249.1833066-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 1/8] mm: remove a pointless CONFIG_ZONE_DEVICE
 check in memremap_pages
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
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

memremap.c is only built when CONFIG_ZONE_DEVICE is set, so remove
the superflous extra check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/memremap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/memremap.c b/mm/memremap.c
index 6aa5f0c2d11fda..5f04a0709e436e 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -328,8 +328,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 		break;
 	case MEMORY_DEVICE_FS_DAX:
-		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
-		    IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
+		if (IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
 			WARN(1, "File system DAX not supported\n");
 			return ERR_PTR(-EINVAL);
 		}
-- 
2.30.2

