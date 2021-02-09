Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FBD314569
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 02:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DFB6EA6A;
	Tue,  9 Feb 2021 01:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418EF6EA67;
 Tue,  9 Feb 2021 01:14:34 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6021e0ce0000>; Mon, 08 Feb 2021 17:09:34 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Feb
 2021 01:09:34 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 01:09:33 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <bskeggs@redhat.com>, <akpm@linux-foundation.org>
Date: Tue, 9 Feb 2021 12:07:17 +1100
Message-ID: <20210209010722.13839-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209010722.13839-1-apopple@nvidia.com>
References: <20210209010722.13839-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612832974; bh=pyZp6/9XNMC0mK0WRRvgfyWXvzV3+8u2/OO5kZH2+Vg=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=jeZjl3nfuSeq3FgFlgTJUt58XPL3emJVARijzZ4vq7ltCLgRVsr0bJW0RX7cLsy4+
 6i2ssucV5jShnIDv0z47fip74hEH6p2G7xEJGuH3szVMZf9TbumLk+9q9cM2uqpJqF
 zp0STD/loZHiqwCk48WN2CUfYhM/po5OgnEr3p85w9nntk+tBlaEU/GEolQNOEp1iF
 zEl1WiliIccRiu3A/3Ps6CBlVCYypWGxVgimQYvt7/3b0HLJ79gnhK9hGtXogpZXon
 2dFsEzwULBU/1bCkZF5FIg7ycfCM4V4o6iEhQSzOB1i8QXdnME+lFPKBFz1v+szxGz
 jVlzmZBk+PGQA==
Subject: [Nouveau] [PATCH 4/9] Documentation: Add unmap and pin to HMM
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Update the HMM documentation to include information on the unmap and pin
operation.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 Documentation/vm/hmm.rst | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/vm/hmm.rst b/Documentation/vm/hmm.rst
index 09e28507f5b2..83234984f656 100644
--- a/Documentation/vm/hmm.rst
+++ b/Documentation/vm/hmm.rst
@@ -346,7 +346,15 @@ between device driver specific code and shared common code:
    from the LRU (if system memory since device private pages are not on
    the LRU), unmapped from the process, and a special migration PTE is
    inserted in place of the original PTE.
-   migrate_vma_setup() also clears the ``args->dst`` array.
+
+   A device driver may also initialise ``src`` entries with the
+   ``MIGRATE_PFN_PIN`` flag. This allows the device driver to unmap and pin
+   the existing system page in place whilst migrating page metadata to a
+   device private page. This leaves the page isolated from the LRU and gives
+   the device exclusive access to the page data without the need to migrate
+   data as any CPU access will trigger a fault. The device driver needs to
+   keep track of the ``src`` page as it effectively becomes the owner of
+   the page and needs to pass it in when remapping and unpinning the page.
 
 3. The device driver allocates destination pages and copies source pages to
    destination pages.
@@ -357,8 +365,8 @@ between device driver specific code and shared common code:
    array for that page.
 
    The driver then allocates either a device private struct page or a
-   system memory page, locks the page with ``lock_page()``, and fills in the
-   ``dst`` array entry with::
+   system memory page, locks the page with ``lock_page()``, and fills in
+   the ``dst`` array entry with::
 
      dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 
@@ -373,6 +381,14 @@ between device driver specific code and shared common code:
    destination or clear the destination device private memory if the pointer
    is ``NULL`` meaning the source page was not populated in system memory.
 
+   Alternatively a driver that is remapping and unpinning a source page
+   obtained from a ``MIGRATE_PFN_PIN`` operation should lock the original
+   source page and pass it in along with the ``MIGRATE_PFN_UNPIN`` flag
+   without any need to copy data::
+
+     dst[i] = migrate_pfn(page_to_pfn(spage)) | MIGRATE_PFN_LOCKED
+              | MIGRATE_PFN_UNPIN;
+
 4. ``migrate_vma_pages()``
 
    This step is where the migration is actually "committed".
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
