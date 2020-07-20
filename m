Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6412226FF3
	for <lists+nouveau@lfdr.de>; Mon, 20 Jul 2020 22:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF1289EB4;
	Mon, 20 Jul 2020 20:49:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947789E36
 for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2020 20:49:10 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f16033a0000>; Mon, 20 Jul 2020 13:48:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 20 Jul 2020 13:49:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 20 Jul 2020 13:49:10 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 20:49:10 +0000
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
 <20200713172149.2310-3-rcampbell@nvidia.com>
 <20200720183643.GA3028737@nvidia.com>
 <2e775a5d-9d62-de52-6799-3bbb09c88c5a@nvidia.com>
 <20200720195943.GH2021234@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <fdfde6a0-f2bf-c0b2-0283-c882aa755292@nvidia.com>
Date: Mon, 20 Jul 2020 13:49:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200720195943.GH2021234@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595278138; bh=Ccj/+mKAxu8hTLWfU4Ue43iWGdFGZ2AWQABgAkqwS5c=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=VcLaCG1jeJ3grIAQ6dNREngT9LTn9RlNSSs2PV9xB2FKhVBQ9sSCMPElcq6X8bk+g
 BffYfWyypukyPqCEivuSYDvDbuieMzbmOD4tLYnkHSGC+/8Eo7xnq/qABwzVunk2E6
 uuRVRSaBj5I2QN265J3jgZcvbPEcUO9iGyrjO1Dmiosny1t4HQJP2yT8VtJhLO0nNd
 d2SZ6bBN3ywT4vnkEiIQBekg3S0vniVavcHfZrE0YcmAZXB+VncPBE1u5hMqQT3tC2
 V47tjJs5XwPa9/MN0I8bxqzoDxEte6LZmbM+QXwVdqRgI+PVl2LkjNrZZ7TGxvNp+b
 GRhbS0bjKKnhw==
Subject: Re: [Nouveau] [PATCH v2 2/5] mm/migrate: add a direction parameter
 to migrate_vma
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
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 7/20/20 12:59 PM, Jason Gunthorpe wrote:
> On Mon, Jul 20, 2020 at 12:54:53PM -0700, Ralph Campbell wrote:
>>>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>>>> index 3e546cbf03dd..620f2235d7d4 100644
>>>> +++ b/include/linux/migrate.h
>>>> @@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>>>>    	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
>>>>    }
>>>> +enum migrate_vma_direction {
>>>> +	MIGRATE_VMA_FROM_SYSTEM,
>>>> +	MIGRATE_VMA_FROM_DEVICE_PRIVATE,
>>>> +};
>>>
>>> I would have guessed this is more natural as _FROM_DEVICE_ and
>>> TO_DEVICE_ ?
>>
>> The caller controls where the destination memory is allocated so it isn't
>> necessarily device private memory, it could be from system to system.
>> The use case for system to system memory migration is for hardware
>> like ARM SMMU or PCIe ATS where a single set of page tables is shared by
>> the device and a CPU process over a coherent system memory bus.
>> Also many integrated GPUs in SOCs fall into this category too.
> 
> Maybe just TO/FROM_DEIVCE then? Even though the memory is not
> DEVICE_PRIVATE it is still device owned pages right?
> 
>> So to me, it makes more sense to specify the direction based on the
>> source location.
> 
> It feels strange because the driver doesn't always know or control the
> source?
> 
> Jason
> 

The driver can't really know where the source is currently located because the
API is designed to not initially hold the page locks, migrate_vma_setup() only knows
the source once it holds the page table locks and isolates/locks the pages being
migrated. The direction and pgmap_owner are supposed to filter which pages
the caller is interested in migrating.
Perhaps the direction should instead be a flags field with separate bits for
system memory and device private memory selecting source candidates for
migration. I can imagine use cases for all 4 combinations of
d->d, d->s, s->d, and s->s being valid.

I didn't really think a direction was needed, this was something that
Christoph Hellwig seemed to think made the API safer.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
