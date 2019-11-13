Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2ED12B312
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D3F6E112;
	Fri, 27 Dec 2019 08:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AFA89189;
 Wed, 13 Nov 2019 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=lsFpyN32fHQMMKTZG1mpVdfof
 /D08pyw9rWIJAM4UoAtf/Z4QYZRmBePtNAQa4qknik5nq7OBdxrcXXfGPTKkiPLNCC6HAJdWWu2IE
 u489Jnalyt8cdKZoY6mmcb49pVi7Y+BKuYmfLlZ4rEw4VcITqkFejAFytgki0bnvZE765yomtg2HF
 Tz85Vzn//ZbMa13ksDg8rStx/qLOVu4KySeGoc22qPGRLSPUQ8j9oR4FiaOQH1VrlJvYdnIDOsW2l
 r7unWCrAIFC4HGhenJ4+rkLhDuenbyk5TycBTMeemHmOwD7/ScW9YPrO0CEJQgx1hIrG8gWz/ZKAX
 w0z42hAVg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iUt4E-00072P-Ln; Wed, 13 Nov 2019 13:52:18 +0000
Date: Wed, 13 Nov 2019 05:52:18 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20191113135218.GA20531@infradead.org>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-2-jgg@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112202231.3856-2-jgg@ziepe.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: Re: [Nouveau] [PATCH v3 01/14] mm/mmu_notifier: define the header
 pre-processor parts even if disabled
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, xen-devel@lists.xenproject.org,
 Ralph Campbell <rcampbell@nvidia.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Felix.Kuehling@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
