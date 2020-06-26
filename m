Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A220B7CE
	for <lists+nouveau@lfdr.de>; Fri, 26 Jun 2020 20:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A8A6ECF6;
	Fri, 26 Jun 2020 18:05:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E5F6ECF6
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jun 2020 18:05:22 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef638820000>; Fri, 26 Jun 2020 11:03:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 11:05:21 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 11:05:21 -0700
Received: from [10.2.63.78] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jun
 2020 18:05:15 +0000
To: Ralph Campbell <rcampbell@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20200626172626.19207-1-rcampbell@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <1c004a46-c818-7d4c-254a-60b5c932d67b@nvidia.com>
Date: Fri, 26 Jun 2020 11:05:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626172626.19207-1-rcampbell@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593194626; bh=lF0NHlRJ9U5vcuOjDQlU6SK5ZMyTZW7c0DGF0OGH/Zk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=O4G6ngbUXmHGYZJL6ExQnArGPrlPdsrAjxo5lkbj+eLe08fYepTn8r9vQoNZFLSQd
 tv7Xiga8xgokzgyUttBf7ANP38MJDOqIIquNceGCrqlJppE5O7QnyKU/h+PI+sHZfb
 wQCUGSQD5jXGIelJeYWbtHBcN40BXMlhqdWCEcTRZ+u4mZWtRSrvrHusGqdm+AzsaD
 0diHZdIFG1biwKMPJUgt9e1tZRExfHvuM2E5oxfq+wUQAGqCxnmUcwysBpP+2i02cS
 CjkxFAH0CHBFN04jAhAUKeoUqN6PCj8HAKk0j7m7vjvVLUgNxM+PNCZHFfIT+1zS2O
 O1ZMCjb6/0arA==
Subject: Re: [Nouveau] [PATCH] nouveau: fix page fault on device private
 memory
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
Cc: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2020-06-26 10:26, Ralph Campbell wrote:
> If system memory is migrated to device private memory and no GPU MMU
> page table entry exists, the GPU will fault and call hmm_range_fault()
> to get the PFN for the page. Since the .dev_private_owner pointer in
> struct hmm_range is not set, hmm_range_fault returns an error which
> results in the GPU program stopping with a fatal fault.
> Fix this by setting .dev_private_owner appropriately.
> 
> Fixes: 08ddddda667b ("mm/hmm: check the device private page owner in hmm_range_fault()")
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
> 
> This is based on Linux-5.8.0-rc2 and is for Ben Skeggs nouveau tree.
> It doesn't depend on any of the other nouveau/HMM changes I have
> recently posted.

Maybe cc stable, seeing as how the problem affect Linux 5.7?

thanks,
-- 
John Hubbard
NVIDIA

> 
>   drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index ba9f9359c30e..6586d9d39874 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -562,6 +562,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>   		.end = notifier->notifier.interval_tree.last + 1,
>   		.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
>   		.hmm_pfns = hmm_pfns,
> +		.dev_private_owner = drm->dev,
>   	};
>   	struct mm_struct *mm = notifier->notifier.mm;
>   	int ret;
> 

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
