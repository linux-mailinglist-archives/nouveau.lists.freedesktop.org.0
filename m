Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D3257F81
	for <lists+nouveau@lfdr.de>; Mon, 31 Aug 2020 19:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A64389A4E;
	Mon, 31 Aug 2020 17:21:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA0889A4E
 for <nouveau@lists.freedesktop.org>; Mon, 31 Aug 2020 17:21:42 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4d31970000>; Mon, 31 Aug 2020 10:21:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 31 Aug 2020 10:21:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 10:21:41 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 31 Aug 2020 17:21:41 +0000
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200827213744.14074-1-rcampbell@nvidia.com>
 <20200831115117.GU1152540@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <017b1e81-7e6d-b2cb-785c-aef88e466701@nvidia.com>
Date: Mon, 31 Aug 2020 10:21:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200831115117.GU1152540@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598894487; bh=FpULVCbxeGoGQLbVF7IWOWzHvF7votLMHy2+2uDVYzs=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=sQBvMhSffB6+Q1u0qYTh5KobZx3N0H8LHjQQvT6salGl/0k20dyK9czAn3xtj0Vgu
 iBvg5oSjj9FapzWbjwYG3dIwRY2PlVAhVLmYIeRc2UY1Pqx8fUsISOZm2E+W5TU7Yy
 i5Ml1VVT2kdoe83Axb/zpc9tNFqm3IeIs3gcv1FYapkMduIRV/LuQ7KjmZtqrr2HCq
 HwCnjlKvT+x+CvH84QwjWdfA0eb4YYdYonATpY22d0+ze2iIW/o3BeFGz8wjkreU0t
 vo6aKrlv+hCBXAvU6JZEvxVZuS4oEK5JLPA8TsQUIFacKA1jsNWPmhx3Zd3K9bDxWb
 6JqgjBDFKCr3Q==
Subject: Re: [Nouveau] [PATCH] nouveau: fix the start/end range for migration
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 8/31/20 4:51 AM, Jason Gunthorpe wrote:
> On Thu, Aug 27, 2020 at 02:37:44PM -0700, Ralph Campbell wrote:
>> The user level OpenCL code shouldn't have to align start and end
>> addresses to a page boundary. That is better handled in the nouveau
>> driver. The npages field is also redundant since it can be computed
>> from the start and end addresses.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>
>> This is for Ben Skegg's nouveau tree.
>>
>> I have been working with Karol Herbst on the OpenCL mesa changes for
>> nouveau which will be merged upstream soon.
>> With or without those changes, the user visible effect of this patch
>> only extends the range by one page (round up vs. round down to page
>> boundary).
>>
>>   drivers/gpu/drm/nouveau/nouveau_svm.c | 17 ++++++-----------
>>   1 file changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
>> index 2df1c0460559..888aa0908c5a 100644
>> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
>> @@ -105,11 +105,14 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>>   	struct nouveau_cli *cli = nouveau_cli(file_priv);
>>   	struct drm_nouveau_svm_bind *args = data;
>>   	unsigned target, cmd, priority;
>> -	unsigned long addr, end, size;
>> +	unsigned long addr, end;
>>   	struct mm_struct *mm;
>>   
>>   	args->va_start &= PAGE_MASK;
>> -	args->va_end &= PAGE_MASK;
>> +	args->va_end = ALIGN(args->va_end, PAGE_SIZE);
>> +	/* If no end address is given, assume a single page. */
>> +	if (args->va_end == 0)
>> +		args->va_end = args->va_start + PAGE_SIZE;
> 
> That is really weird, how is it useful for the kernel to map a region
> of unknown size and alignment to the GPU?
> 
> Jason

I agree it is somewhat weird. The OpenCL 2.2 specification says that
clEnqueueSVMMigrateMem() takes an array of pointers and sizes (in bytes)
but the size is optional. There is no alignment required.
This "works" because the pointers have to be allocated with clSVMAlloc()
and presumably, the implementation for clSVMAlloc()
keeps track of the length allocated and can fill that in if size is zero.
However, requiring all allocations to be made with clSVMAlloc() defeats the
goal of being able to use regular malloc() and mmap() allocations for OpenCL
implementations that support fine-grained system allocations.
(See https://github.com/KhronosGroup/OpenCL-Docs/issues/392)

So if the size isn't specified, the most logical choices are do nothing and
return OK, return an error, or assume that at least one byte is being migrated
and try migrate it.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
