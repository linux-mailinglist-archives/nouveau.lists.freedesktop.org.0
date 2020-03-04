Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E79F179581
	for <lists+nouveau@lfdr.de>; Wed,  4 Mar 2020 17:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C796EB3F;
	Wed,  4 Mar 2020 16:37:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2020 16:37:40 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96A6EB3F;
 Wed,  4 Mar 2020 16:37:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 19CA268C4E; Wed,  4 Mar 2020 17:27:53 +0100 (CET)
Date: Wed, 4 Mar 2020 17:27:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200304162752.GB11616@lst.de>
References: <20200303010023.2983-1-rcampbell@nvidia.com>
 <20200303124229.GH26318@mellanox.com>
 <1f27ac9e-7ddf-6e4f-25ea-063ef6c78761@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f27ac9e-7ddf-6e4f-25ea-063ef6c78761@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH v2] nouveau/hmm: map pages after migration
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 01:15:21PM -0800, Ralph Campbell wrote:
>>> +static inline struct nouveau_pfnmap_args *
>>> +nouveau_pfns_to_args(void *pfns)
>>
>> don't use static inline inside C files
>
> OK.
>
>>> +{
>>> +	struct nvif_vmm_pfnmap_v0 *p =
>>> +		container_of(pfns, struct nvif_vmm_pfnmap_v0, phys);
>>> +
>>> +	return container_of(p, struct nouveau_pfnmap_args, p);
>>
>> And this should just be
>>
>>     return container_of(pfns, struct nouveau_pfnmap_args, p.phys);
>
> Much simpler, thanks.

Btw, for the case where we just have an container_of wrapper I strongly
disagree with avoiding the inline - not inlining this would be stupid,
but unfortunately compilers often behave stupidly.  It also is a very
clear marker.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
