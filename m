Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B180812B306
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDF06E167;
	Fri, 27 Dec 2019 08:14:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57C06E267;
 Tue, 29 Oct 2019 12:19:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 05:19:25 -0700
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="203547917"
Received: from ddalessa-mobl.amr.corp.intel.com (HELO [10.254.206.224])
 ([10.254.206.224])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 29 Oct 2019 05:19:21 -0700
To: Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-7-jgg@ziepe.ca>
From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Message-ID: <a8644875-9133-9667-c04b-b40c296d68eb@intel.com>
Date: Tue, 29 Oct 2019 08:19:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028201032.6352-7-jgg@ziepe.ca>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v2 06/15] RDMA/hfi1: Use
 mmu_range_notifier_inset for user_exp_rcv
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/28/2019 4:10 PM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg@mellanox.com>
> 
> This converts one of the two users of mmu_notifiers to use the new API.
> The conversion is fairly straightforward, however the existing use of
> notifiers here seems to be racey.
> 
> Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>
> Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

I tested v1, and replied to it [1]. I can re-test with this version if 
you like as well.

[1] https://marc.info/?l=linux-rdma&m=157235130606412&w=2

-Denny
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
