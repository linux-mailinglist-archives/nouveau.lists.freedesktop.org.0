Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF0283C7A
	for <lists+nouveau@lfdr.de>; Mon,  5 Oct 2020 18:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F5B89FF9;
	Mon,  5 Oct 2020 16:29:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E7D89FF9
 for <nouveau@lists.freedesktop.org>; Mon,  5 Oct 2020 16:29:07 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7b499b0001>; Mon, 05 Oct 2020 09:28:11 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 5 Oct 2020 16:29:05 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
 <20201001181715.17416-2-rcampbell@nvidia.com> <20201002055627.GA8891@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <2789432c-e3b2-e3f4-1904-c96f03ea9c2a@nvidia.com>
Date: Mon, 5 Oct 2020 09:29:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201002055627.GA8891@lst.de>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601915291; bh=r9u8GXqftmRJy6EtN3cah6v+xD2lZJO4Ups13dnHtFk=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=W6dT2vN9G+XROLp0BSTe855+S4z08HJa3Gfh0W6r0EKEq7vB8Jay6CRRfwcHtuXIV
 2o1YotZGXN+vg+kCc/KhuaYs27wWp6YGSyLuE/N7aVfn0JPCTweWnDR/yXR2s0hvna
 nfTBMUxKO63a04ZJvvJofytj4zqZ6oSBkQ23/cqTQazVfJBr8M3LPP22wkc4NihHJW
 kk8qK2PQnJjcZUrZ+0aFnklh9zRZEPG5qnNhwFjAm9hk7GNvjNM7NfRsLfaJvIEP9p
 8vssxx+uVESJYNYHFhYea8xGw9/17BMUVyDYNLXgElPUOKCAxR75lxpOUQlst6oZf6
 V61ahFjm77LGQ==
Subject: Re: [Nouveau] [RFC PATCH v3 1/2] ext4/xfs: add page refcount helper
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 10/1/20 10:56 PM, Christoph Hellwig wrote:
> On Thu, Oct 01, 2020 at 11:17:14AM -0700, Ralph Campbell wrote:
>> There are several places where ZONE_DEVICE struct pages assume a reference
>> count == 1 means the page is idle and free. Instead of open coding this,
>> add a helper function to hide this detail.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Thanks for the review.
I'll resend this as an independent patch.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
