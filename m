Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C17B4B070A
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 08:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C6910E745;
	Thu, 10 Feb 2022 07:29:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01DF10E742;
 Thu, 10 Feb 2022 07:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7G8J3RPmwqONc2HXCUGJwHrFv6lx9mr3fODzxz3GZ8Y=; b=uUYieNnJaHfU8LFV1HvS+chCMy
 jcAqrinM6uesfhHoQXNQ/yIbALOtnqg/X7rgXJFF6HmxAU0+4dzexPBN2EnDi2dapZPLQOWgiAeOf
 tzVORYmrL7VdJLyW6S053AW0DDzF7ZmU1dwjhi7rK+HqXEtwduphWLaaWJ2i9FXW1FL/pTVPhl6u3
 LE+m2AisM2E2hg6ORWM9biX6jJgiGfqln2ncrqHbXOopuoXLSc1S3T1+fNmZtbayRnW6HXsAIFF0m
 nvn1VGJiJ6QqjxIbHtJmIW7tSVeSa7IIbBXeRBYA674ZY5WukXl78wQ6Z+MIK6VEYF2kn6OeA5Q60
 +XxfFLEg==;
Received: from [2001:4bb8:188:3efc:8014:b2f2:fdfd:57ea] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3t3-002s0C-1N; Thu, 10 Feb 2022 07:29:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Thu, 10 Feb 2022 08:28:13 +0100
Message-Id: <20220210072828.2930359-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210072828.2930359-1-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 12/27] mm: refactor the ZONE_DEVICE handling in
 migrate_vma_pages
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

Make the flow a little more clear and prepare for adding a new
ZONE_DEVICE memory type.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/migrate.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 30ecd7223656c1..746e1230886ddb 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2788,24 +2788,21 @@ void migrate_vma_pages(struct migrate_vma *migrate)
 
 		mapping = page_mapping(page);
 
-		if (is_zone_device_page(newpage)) {
-			if (is_device_private_page(newpage)) {
-				/*
-				 * For now only support private anonymous when
-				 * migrating to un-addressable device memory.
-				 */
-				if (mapping) {
-					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
-				}
-			} else {
-				/*
-				 * Other types of ZONE_DEVICE page are not
-				 * supported.
-				 */
+		if (is_device_private_page(newpage)) {
+			/*
+			 * For now only support private anonymous when migrating
+			 * to un-addressable device memory.
+			 */
+			if (mapping) {
 				migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
 				continue;
 			}
+		} else if (is_zone_device_page(newpage)) {
+			/*
+			 * Other types of ZONE_DEVICE page are not supported.
+			 */
+			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
+			continue;
 		}
 
 		r = migrate_page(mapping, newpage, page, MIGRATE_SYNC_NO_COPY);
-- 
2.30.2

