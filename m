Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C4927B762
	for <lists+nouveau@lfdr.de>; Tue, 29 Sep 2020 00:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CAA6E156;
	Mon, 28 Sep 2020 22:20:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D124F6E156
 for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2020 22:20:54 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7261930000>; Mon, 28 Sep 2020 15:20:03 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 28 Sep
 2020 22:20:48 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
 <20200925204442.31348-2-rcampbell@nvidia.com> <20200926063539.GA3540@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <e56a1de5-6bd7-9f18-60ce-0493bcdc6413@nvidia.com>
Date: Mon, 28 Sep 2020 15:20:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200926063539.GA3540@lst.de>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601331603; bh=kXgGmngSFGVJLCne8DZRhWZR5kT4/vprhys6/EFUF2M=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=aUo++/WBuUmLpUNBybZqcSQddWcOAIgf4CiMoG8F4r7DyK/3GkcxcNtxtJXcGJ8PN
 JvprWJRK7sbeM2NyReaAn7I987qhfn6ckD/XANP2zADXzuiDLD7eThOUjsYwuwDpiz
 hu+TdV/9fyzLHRNHLAwtjvkg9n/0Jjl45ksOv1QRU8V/kTmdTC+mkEPHuWxe+ZOXOP
 oR+WkNXbdUlIq5pJYjS8ZZWazDqy3KwPhj/PeS/z9SwtdEHg89HObrdt49PKUMNTYG
 hhw6ehtOqBCJhT/J/reqmp+th5ms5Og27Zpku+FrIqrVNTP/Ay/M9FYJfcwGpEl6Qw
 HTya2AGEgwLcQ==
Subject: Re: [Nouveau] [PATCH 1/2] ext4/xfs: add page refcount helper
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


On 9/25/20 11:35 PM, Christoph Hellwig wrote:
> On Fri, Sep 25, 2020 at 01:44:41PM -0700, Ralph Campbell wrote:
>>   		error = ___wait_var_event(&page->_refcount,
>> -				atomic_read(&page->_refcount) == 1,
>> +				dax_layout_is_idle_page(page),
>>   				TASK_INTERRUPTIBLE, 0, 0,
>>   				ext4_wait_dax_page(ei));
> 
>> +++ b/fs/xfs/xfs_file.c
>> @@ -750,7 +750,7 @@ xfs_break_dax_layouts(
>>   
>>   	*retry = true;
>>   	return ___wait_var_event(&page->_refcount,
>> -			atomic_read(&page->_refcount) == 1, TASK_INTERRUPTIBLE,
>> +			dax_layout_is_idle_page(page), TASK_INTERRUPTIBLE,
>>   			0, 0, xfs_wait_dax_page(inode));
>>   }
> 
> I still think a litte helper macro would be nice here:
> 
> #define dax_wait_page(_inode, _page, _wait_cb)				\
>    	___wait_var_event(&(_page)->_refcount,				\
> 		atomic_read(&(_page)->_refcount) == 1,			\
> 		TASK_INTERRUPTIBLE, dax_layout_is_idle_page(_page),	\
> 		TASK_INTERRUPTIBLE, 0, 0, _wait_cb(_inode));

OK, I'll add it in v3.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
