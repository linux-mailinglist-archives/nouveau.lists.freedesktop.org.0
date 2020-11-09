Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F02AC753
	for <lists+nouveau@lfdr.de>; Mon,  9 Nov 2020 22:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5689274;
	Mon,  9 Nov 2020 21:34:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80F589274
 for <nouveau@lists.freedesktop.org>; Mon,  9 Nov 2020 21:34:24 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa9b5e50001>; Mon, 09 Nov 2020 13:34:29 -0800
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 21:34:17 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
 <20201109091415.GC28918@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <0ed2fbec-e855-9be5-4897-523b00391a5a@nvidia.com>
Date: Mon, 9 Nov 2020 13:34:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201109091415.GC28918@lst.de>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604957669; bh=mGWceFZcFVepIg70odr/PpzpGbOYemVQsgtUyEDQ5DY=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=Pl5Tvt71udJU3v/0WCu3Asq2HX/8GyNfgumDPJG9uNsgU+MIpHqO+wOIFuKESw2q/
 T1IEais/hXVH0hE8rKE2lCAGdDwBRi9dVnYmfyzEMdvWiU8ljU/IIx8nJzLhJrm8Im
 Jv4q8vv55QxoNkYyA59hGqNL1W7lRcfc1Bdn9fqco9eBhY/ppa0CMphwINQ0UtvxhQ
 fInFfJZirRP0B/gQzxgf5Pduu2ywcaiKuHbCzULx8PA9audLlpSfNnuhRwqtZUBuTt
 lKiNnMmbqI4la7ABjlO2OTxf6CZlpSP2Ead9izuGJp43VzgyLtZxafBHsW/aJGGLqs
 sO14lMybUWHDw==
Subject: Re: [Nouveau] [PATCH v3 3/6] mm: support THP migration to device
 private memory
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
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 11/9/20 1:14 AM, Christoph Hellwig wrote:
> On Fri, Nov 06, 2020 at 01:26:50PM -0800, Ralph Campbell wrote:
>>
>> On 11/6/20 12:03 AM, Christoph Hellwig wrote:
>>> I hate the extra pin count magic here.  IMHO we really need to finish
>>> off the series to get rid of the extra references on the ZONE_DEVICE
>>> pages first.
>>
>> First, thanks for the review comments.
>>
>> I don't like the extra refcount either, that is why I tried to fix that up
>> before resending this series. However, you didn't like me just fixing the
>> refcount only for device private pages and I don't know the dax/pmem code
>> and peer-to-peer PCIe uses of ZONE_DEVICE pages well enough to say how
>> long it will take me to fix all the use cases.
>> So I wanted to make progress on the THP migration code in the mean time.
> 
> I think P2P is pretty trivial, given that ZONE_DEVICE pages are used like
> a normal memory allocator.  DAX is the interesting case, any specific
> help that you need with that?

Thanks for the offer. I'm putting a list together... :-)
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
