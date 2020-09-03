Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C3225BA0A
	for <lists+nouveau@lfdr.de>; Thu,  3 Sep 2020 07:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE756E15F;
	Thu,  3 Sep 2020 05:18:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAF36E15F
 for <nouveau@lists.freedesktop.org>; Thu,  3 Sep 2020 05:18:53 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id u6so1320291ybf.1
 for <nouveau@lists.freedesktop.org>; Wed, 02 Sep 2020 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aMG/YvwAu6GpU0qnZrimosi1RruS9P3GeGTh89bHuS4=;
 b=MD5y4AVGM/7BLLih2AJc7iRJNh+2+RVnOs49zHeruvZa/TB8KHE1Jiim9E2y4j+XvP
 VyWp+V4hsV9dq48Ns3A2hxsgbzeFxIKLQzEAba2GzLB9/INNhzPYnAmNQWCdkjtCxQ6e
 L0o9703xBFvS8rrPzttkIX+sBHe5BURG9Z14YRRPfWIStqVapvH3bnPGupYpLMSdlwYT
 pomekm9JzNWlE2S3mCRXfrZPkzhO0BehTTlyYqHf+KLKUHgL0cbX2xDDK0XEFI3SXWfy
 KeMi7rzz6gaHhwV8rA/UCks1xpYvoGM6LSGFgMJ0TsYELaPK4tqsIofSwukpeVTXNqQL
 qtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aMG/YvwAu6GpU0qnZrimosi1RruS9P3GeGTh89bHuS4=;
 b=LUZjlj5tT0Yv2nPq4YWYmAEYNW/l6pZCC+3zxwMMp0Oe7zHX77ozzqSu/S5Q6fK0V4
 Tn+KmH/tN7QHHlOM86r1oY9u5Mvs9MA61E+9R/HCIO13rUzsujwxao2hp4CThsyfxLV9
 htDU+vjXM40Dmf9+NBLZSocCwcIj90Q2wGuKa7BfGPQm2yL7UN/4p4qksIBWIgFFGeYP
 mIveRB36Iopvn6oWXr+BbDW16cKOz4dLx8b7nHRaaalZ7iHeqHJt0TIl4CvOKLECf3VZ
 mHatMKjzq5d7Ub0U82+YKcLIuAs7fHEIL+YYZU31I+RhQ8quRWizTchBUsNHzMwa8KkI
 HAcg==
X-Gm-Message-State: AOAM533S7sqlUry6GDEedNym2OVvuVYl/g1oBVPmBuI7EsVa+0gzeZJs
 EGvQuDMdHY1ZxWnM4p1K+orzLZV405XHU03VTyo=
X-Google-Smtp-Source: ABdhPJwzxhx6AheCQUktX6BlMnijmZT8oElnOkvBR4U+ZQbkb0EnD93LCQoV8OO4qZSs5v4iExtA/XcXPHWaxm+ZA+o=
X-Received: by 2002:a25:bc82:: with SMTP id e2mr312073ybk.435.1599110332474;
 Wed, 02 Sep 2020 22:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200831203111.4940-1-rcampbell@nvidia.com>
In-Reply-To: <20200831203111.4940-1-rcampbell@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 3 Sep 2020 15:18:41 +1000
Message-ID: <CACAvsv4yP2xR4aayzFDT8nGfM69j5ogZUxjoV4f0P58pEJq3RQ@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH v2] nouveau: fix the start/end range for
 migration
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 LKML <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 1 Sep 2020 at 06:31, Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> The user level OpenCL code shouldn't have to align start and end
> addresses to a page boundary. That is better handled in the nouveau
> driver. The npages field is also redundant since it can be computed
> from the start and end addresses.
>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Thanks Ralph,

Queued in my tree.

Ben.

> ---
>
> This is for Ben Skegg's nouveau tree.
>
> I have been working with Karol Herbst on the OpenCL mesa changes for
> nouveau which will be merged upstream soon.
> With or without those changes, the user visible effect of this patch
> only extends the range by one page (round up vs. round down to page
> boundary).
>
> Changes in v2:
> I changed the start/end check to require a size so start has to be less
> than end.
>
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 2df1c0460559..4f69e4c3dafd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -105,11 +105,11 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>         struct nouveau_cli *cli = nouveau_cli(file_priv);
>         struct drm_nouveau_svm_bind *args = data;
>         unsigned target, cmd, priority;
> -       unsigned long addr, end, size;
> +       unsigned long addr, end;
>         struct mm_struct *mm;
>
>         args->va_start &= PAGE_MASK;
> -       args->va_end &= PAGE_MASK;
> +       args->va_end = ALIGN(args->va_end, PAGE_SIZE);
>
>         /* Sanity check arguments */
>         if (args->reserved0 || args->reserved1)
> @@ -118,8 +118,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>                 return -EINVAL;
>         if (args->va_start >= args->va_end)
>                 return -EINVAL;
> -       if (!args->npages)
> -               return -EINVAL;
>
>         cmd = args->header >> NOUVEAU_SVM_BIND_COMMAND_SHIFT;
>         cmd &= NOUVEAU_SVM_BIND_COMMAND_MASK;
> @@ -151,12 +149,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>         if (args->stride)
>                 return -EINVAL;
>
> -       size = ((unsigned long)args->npages) << PAGE_SHIFT;
> -       if ((args->va_start + size) <= args->va_start)
> -               return -EINVAL;
> -       if ((args->va_start + size) > args->va_end)
> -               return -EINVAL;
> -
>         /*
>          * Ok we are ask to do something sane, for now we only support migrate
>          * commands but we will add things like memory policy (what to do on
> @@ -171,7 +163,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>                 return -EINVAL;
>         }
>
> -       for (addr = args->va_start, end = args->va_start + size; addr < end;) {
> +       for (addr = args->va_start, end = args->va_end; addr < end;) {
>                 struct vm_area_struct *vma;
>                 unsigned long next;
>
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
