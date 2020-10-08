Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085E28A120
	for <lists+nouveau@lfdr.de>; Sat, 10 Oct 2020 20:05:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB656F39B;
	Sat, 10 Oct 2020 18:05:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D39B6E077
 for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2020 18:06:30 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7f423a0000>; Thu, 08 Oct 2020 09:45:46 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 8 Oct 2020 16:45:55 +0000
To: Ram Pai <linuxram@us.ibm.com>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
 <20201001181715.17416-3-rcampbell@nvidia.com>
 <20201008051702.GA4773@ram-ibm-com.ibm.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <751582db-9f03-dfbf-1466-131e051def37@nvidia.com>
Date: Thu, 8 Oct 2020 09:45:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201008051702.GA4773@ram-ibm-com.ibm.com>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602175546; bh=2oXrv2k21feKjRaE4SwKhy+0xGr1Nj+jNNr7ur3YOOc=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=bMog1qj4M5hD0xFVcVM4rpg11B7PncavhBkkQIOYBCB3ztXT2ow9SY3iD07FnWJpe
 513GKpf5wzrxu98OoBXIXOhoZqRB8N4aEVZo/02MvMGmpYnbk3rR0zQE++KDUQGHzs
 Ixz0p1G0sYd6Bzdqse0qEGMErkggJAR4TFz9PahrH9LKbDOc195QZ0P26lQPScWWtz
 jWX5kNLuLiORARu4PAFLI6g5QEWPS2T/6ZiWln+nOqN+TIrcPZtxgF3N8TGwvEnA2d
 2+Sw4VFKZ02QPeQh121J9t/i+SfxF6MxvLiskNTn53oaLBZUbqcaq0zy4WZLVB+AOf
 sbi4yYrp6tg0A==
X-Mailman-Approved-At: Sat, 10 Oct 2020 18:05:19 +0000
Subject: Re: [Nouveau] [RFC PATCH v3 2/2] mm: remove extra ZONE_DEVICE
 struct page refcount
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
 Andrew
 Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>, Christoph
 Hellwig <hch@lst.de>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 10/7/20 10:17 PM, Ram Pai wrote:
> On Thu, Oct 01, 2020 at 11:17:15AM -0700, Ralph Campbell wrote:
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
> 
> 
> I was hoping this patch would resolve a page-reference issue that we run
> into at random times while migrating a page to a device page backed by
> secure-memory.
> 
> Unfortunately I continue to see the problem. There is a reference
> held on that page, which fails the migration.
> 
> FYI
> RP

I'm willing to look into it but I would need more information.
Can you give any more details about the conditions when it happens?
It would be great if you have a program that reproduces the problem.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
