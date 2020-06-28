Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554420CAFA
	for <lists+nouveau@lfdr.de>; Mon, 29 Jun 2020 00:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074A789F06;
	Sun, 28 Jun 2020 22:40:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6824F89F06
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jun 2020 22:40:35 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id j202so7523485ybg.6
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jun 2020 15:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=coaSMhmb1rnGuqJBzIF97ldJoVfPljIOjdLaUOmjyJU=;
 b=irANrFIsBhZkj09kMLPwMz4+kSpIlnGrWyjCx0QAgZwuR1Lt2hBaViB4sqhQWEkjmc
 to9bNMUOJaHScT32FQF2VQCKXShlls5UIKSD0/r08xQHQ5kIucQnMwBLd1T7/1u61Zl+
 oGDKVtQy4lXc3/UxXGQYAT1A4/+lTP7nu7g6587ApeIQsGNfrNVbAD7KISx8OHyXiU6o
 unC/9xddYs0w4QTonNhyZ8qO0+rz2aPoTS82DRk/FQJ3T5mqV61YrPlSvzojOKygrK+g
 0rGEe4OuAffa6wwcfv+Szhno3tlM7U0SKu+cSQaFL7t4FBGZfyMLgHZP7q9QuaUJZnge
 9PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=coaSMhmb1rnGuqJBzIF97ldJoVfPljIOjdLaUOmjyJU=;
 b=Gbaemfv0P+dciVzkhlPoYmx+KvB6Refi4L/kjTisMwoqBdhM+HbKA5QTrEVc0X7Qo+
 D3qXAFqGA3gJLxOBGa4C5ZlzslFR/9wxWwg51ZGQtK8W8K5cfnY3n+K7IPe/GCovZ7+O
 IIGKr3pLt5mh7UArFCwOlksKD3/rKnvoiTsDBCTkun3YITkfs9HwJ1utIOxpjdkVOiwn
 wcWG/v6HUF+DG6W1Qi2mlXHMNM1LuIvbkMpBi64HgVVCkVm05z91cOTRzIDXasrlu7EL
 GTGEumZ1l09rQaOS4BCHXfZpskaHatuAQZcBHA5j/I+WP//YNmE9ARJAHbf9//QoWXoV
 iiPA==
X-Gm-Message-State: AOAM533Ihbs4hg4G990QflL9XIRsX9UZuj3aHmLxToUezp/pQ7oEXHzo
 xaeR+eIllpXyCEz7yH8X0WmdsujgQZWbysSmAG4=
X-Google-Smtp-Source: ABdhPJxSEYgMgAKzF/ouhNsjt/4IssbdrLDq/6F8NVGeqgsOR9G06asdGgffL8B0zUIg0uAFhbXmTg+dZ0D6lZ/pJs0=
X-Received: by 2002:a25:b992:: with SMTP id r18mr21123478ybg.283.1593384034471; 
 Sun, 28 Jun 2020 15:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210337.20089-1-rcampbell@nvidia.com>
In-Reply-To: <20200626210337.20089-1-rcampbell@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 29 Jun 2020 08:40:22 +1000
Message-ID: <CACAvsv4Oho1pKzPU7er2Sed5qyy0d2JZKsNoHvrZhvhtBygPjg@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH v2] nouveau: fix page fault on device private
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, 27 Jun 2020 at 07:04, Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> If system memory is migrated to device private memory and no GPU MMU
> page table entry exists, the GPU will fault and call hmm_range_fault()
> to get the PFN for the page. Since the .dev_private_owner pointer in
> struct hmm_range is not set, hmm_range_fault returns an error which
> results in the GPU program stopping with a fatal fault.
> Fix this by setting .dev_private_owner appropriately.
>
> Fixes: 08ddddda667b ("mm/hmm: check the device private page owner in hmm_range_fault()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> ---
>
> This is based on Linux-5.8.0-rc2 and is for Ben Skeggs nouveau tree.
> It doesn't depend on any of the other nouveau/HMM changes I have
> recently posted.
>
> Resending to include stable@vger.org and adding Jason's reviewed-by.
Thanks Ralph,

I've got the patch locally, and will push it out later on today.

Ben.

>
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index ba9f9359c30e..6586d9d39874 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -562,6 +562,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>                 .end = notifier->notifier.interval_tree.last + 1,
>                 .pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
>                 .hmm_pfns = hmm_pfns,
> +               .dev_private_owner = drm->dev,
>         };
>         struct mm_struct *mm = notifier->notifier.mm;
>         int ret;
> --
> 2.20.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
