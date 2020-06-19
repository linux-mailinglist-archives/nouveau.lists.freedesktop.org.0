Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D8201D71
	for <lists+nouveau@lfdr.de>; Fri, 19 Jun 2020 23:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1879E6ECC8;
	Fri, 19 Jun 2020 21:57:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5BE6EC54
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jun 2020 21:57:08 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eed344e0006>; Fri, 19 Jun 2020 14:55:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 19 Jun 2020 14:57:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 19 Jun 2020 14:57:07 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 21:56:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 19 Jun 2020 21:56:59 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eed34ab0003>; Fri, 19 Jun 2020 14:56:59 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Jun 2020 14:56:37 -0700
Message-ID: <20200619215649.32297-5-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619215649.32297-1-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592603726; bh=1iV7tDJzN8xRBBQCMnpfgf4l9D1mB5vyMUfJnsfocqI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=WtmD7LpXsXMK0xiKf0faXRWDUDoQoUOaLwwNuHEs1KgDY3r/L8eiNKQgzUJzmR7T8
 dbrLbAjzN3x+Rxay/BhVPQJpqKrdrpB1EjpuxPn4PODyymb4afTScZVbBapD6jShUm
 xc6VXhjE4//JigVCgPdEWIDcieCfZJn6r5EKTnta9pSifDgn4XTxmugTEYDsNqFNGO
 yLmMt8Bczop/u4JoOilxJHvXvLFSYu3u8XIB0oBsaGsfKbB5sTSWdX2XmZRAO29evB
 Ni0WqWb4XXyF01AEZJpRxhD29j2Am9Ub84sJ4gdOiK+0HOsIwixTfARl6C6Md5JWoi
 LW5pP0EzygT4w==
Subject: [Nouveau] [PATCH 04/16] mm/hmm: fix test timeout on slower machines
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

The HMM self test "migrate_multiple" can timeout on slower machines.
Lower the number of loop iterations to fix this.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 79db22604019..bdfa95ac9a7d 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -45,7 +45,7 @@ struct hmm_buffer {
 #define TWOMEG		(1 << 21)
 #define HMM_BUFFER_SIZE (1024 << 12)
 #define HMM_PATH_MAX    64
-#define NTIMES		256
+#define NTIMES		50
 
 #define ALIGN(x, a) (((x) + (a - 1)) & (~((a) - 1)))
 
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
