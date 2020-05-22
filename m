Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD371DDC4A
	for <lists+nouveau@lfdr.de>; Fri, 22 May 2020 02:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF276E28A;
	Fri, 22 May 2020 00:47:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E30BB6E28A
 for <nouveau@lists.freedesktop.org>; Fri, 22 May 2020 00:47:44 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id c2so3767562ybi.7
 for <nouveau@lists.freedesktop.org>; Thu, 21 May 2020 17:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o1achSWEeCebePnmfJCefzRB6hhApcsEC43Uj0PfEdo=;
 b=WsGRWs81ne4GiEIj2AuIqikvp+lAWF+9c6fBO/yPPFiOxIHXJ/DrPBIMsGpTFaITpu
 9i9UhHdmI5Avjonw3yqrBGbpCzvnrNWyoWx8wJl5tCPlriDkngednvKIudKH2d+WfEQw
 h55ECOkkfEaKHhzsJVUDKS8uWQ4x4Js4Qwy1kvRuhBvMr2bYe9N168YuA0OuiyR28BGT
 mG4pSBmtdc24n52sGqwScHBmyYhwYqVrp16anD7tQUJb178QRxctfifFkBt/dgG8F+5f
 837fbBybst4L3Xxia67k5YB+sNG2kr+a7vmpGCs+Xw/FAV0rtV7r4hiPw3ZsgNa8UeKP
 VvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o1achSWEeCebePnmfJCefzRB6hhApcsEC43Uj0PfEdo=;
 b=RJIWor+hH0j0Sg7yrsOP1ViIPHY59JilZuTranV+dwv7AaSiPrjuKgUz/TDALypIrm
 /bkzOsNRjumQmLGJrWrMX9vl1C9G222Qp7yUL7eBur6Ng7bc+3WdqtKrWNZCTyV+9CId
 s+LA/O1niJss29Qi2qPf5yoKqdDCZIP0FZcIva+stHO7ys9Rf2jYSUYC4GMuv23QcTYO
 xoQPcY6MewJR70hpMo/KO7ux1ZfqIMm0o1v//EWr/cCB+g7TiA8h2kbq8ng9OVqG+fkJ
 AWW75vWKSrhX0S+m3CpIfNGTZNWCIezwjNfo9iOEX5UNyZcnfn6ZzVYjpS1i7Nv7qDyX
 KNeg==
X-Gm-Message-State: AOAM532rG3O/hPOVpCjcqux6T5n/Vd8YNc2qYU6YNmb5+mT92zQFz39T
 TEZQHU/g+FsjPqk50xssOesjf9JaNid+p30yWlk=
X-Google-Smtp-Source: ABdhPJzz46XpCwc5jovLm8lmHQ+AD9jyCkktAnl9vTJWUtMKYfZSqeYdgJlRvpqDlK57+i71ZO4Zm6KzcwysMIEomd0=
X-Received: by 2002:a25:9d82:: with SMTP id v2mr19502909ybp.268.1590108463933; 
 Thu, 21 May 2020 17:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200520183652.21633-1-rcampbell@nvidia.com>
 <20200520192045.GH24561@mellanox.com>
 <0ef69e08-7f5d-7a3d-c657-55b3a8df1dfe@nvidia.com>
In-Reply-To: <0ef69e08-7f5d-7a3d-c657-55b3a8df1dfe@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 22 May 2020 10:47:32 +1000
Message-ID: <CACAvsv6TYCaChfsp4LNcVUZ6b0f6F5vDiKqfpzRTVRnRM7373g@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH] nouveau/hmm: fix migrate zero page to GPU
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
Cc: linux-rdma@vger.kernel.org, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 21 May 2020 at 07:05, Ralph Campbell <rcampbell@nvidia.com> wrote:
>
>
> On 5/20/20 12:20 PM, Jason Gunthorpe wrote:
> > On Wed, May 20, 2020 at 11:36:52AM -0700, Ralph Campbell wrote:
> >> When calling OpenCL clEnqueueSVMMigrateMem() on a region of memory that
> >> is backed by pte_none() or zero pages, migrate_vma_setup() will fill the
> >> source PFN array with an entry indicating the source page is zero.
> >> Use this to optimize migration to device private memory by allocating
> >> GPU memory and zero filling it instead of failing to migrate the page.
> >>
> >> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> >>
> >> This patch applies cleanly to Jason's Gunthorpe's hmm tree plus two
> >> patches I posted earlier. The first is queued in Ben Skegg's nouveau
> >> tree and the second is still pending review/not queued.
> >> [1] ("nouveau/hmm: map pages after migration")
> >> https://lore.kernel.org/linux-mm/20200304001339.8248-5-rcampbell@nvidia.com/
> >> [2] ("nouveau/hmm: fix nouveau_dmem_chunk allocations")
> >> https://lore.kernel.org/lkml/20200421231107.30958-1-rcampbell@nvidia.com/
> >
> > It would be best if it goes through Ben's tree if it doesn't have
> > conflicts with the hunks I have in the hmm tree.. Is it the case?
> >
> > Jason
>
> I think there might be some merge conflicts even though it is semantically
> independent of the other changes. I guess since we are at 5.7-rc6 and not
> far from the merge window, I can rebase after 5.8-rc1 and resend.
> I posted this mostly to get some review and as a "heads up" of the issue.
Both look alright to me, and apply cleanly on top of my tree already,
so I've got them locally.

Ben.

> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
