Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237022A90D3
	for <lists+nouveau@lfdr.de>; Fri,  6 Nov 2020 08:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2BC6E95B;
	Fri,  6 Nov 2020 07:57:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9196E972
 for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2020 07:57:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B130A68B05; Fri,  6 Nov 2020 08:57:05 +0100 (CET)
Date: Fri, 6 Nov 2020 08:57:05 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20201106075705.GC31341@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106005147.20113-3-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH v3 2/6] mm/migrate: move
 migrate_vma_collect_skip()
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Zi Yan <ziy@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
