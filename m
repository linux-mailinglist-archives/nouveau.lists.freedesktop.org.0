Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C75846DC
	for <lists+nouveau@lfdr.de>; Thu, 28 Jul 2022 22:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AA211A06A;
	Thu, 28 Jul 2022 20:17:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D8511A03D
 for <nouveau@lists.freedesktop.org>; Thu, 28 Jul 2022 20:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659039440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6u4ZQlbvoh48fBsQdaHBjhOh58DQBN7dDe6CmLd1i8=;
 b=bmrOESbsP5ZBfuJKBBZiDzoitVeVqWRqUq/8+jJt/JL/EChlADIEVpLOAvrwTN9KsVPaOm
 0XP6f3q/g254ZGOKcc1z3Dny9NfvqorUcBZ8Og0Uw4kWlah4igEv1uV+SCKLZDJ7wyZPi/
 9XvolIPM8wFkVH+U76BMq7GdZqiqqhw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-1_OG0pBkOTmCCQZciq_5Ew-1; Thu, 28 Jul 2022 16:17:18 -0400
X-MC-Unique: 1_OG0pBkOTmCCQZciq_5Ew-1
Received: by mail-qv1-f71.google.com with SMTP id
 lz4-20020a0562145c4400b004742fe333c9so2096023qvb.0
 for <nouveau@lists.freedesktop.org>; Thu, 28 Jul 2022 13:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=A6u4ZQlbvoh48fBsQdaHBjhOh58DQBN7dDe6CmLd1i8=;
 b=QrrhYhRinjhRw6opwDq1dh9wsHTlkTxOaL/Bek+8RtK+goPyHxCkBx0bCw2WBCw9qc
 lOfb4BVGnE8fAFwE98XgEHxLxPt0nSMCnX1E+MwKjtNvJcAYKuzAsOHWMvXFe6UlUUzt
 GzLJGe5e1oqdREBj9IR9ctk6d/9CQn6KWgZ5KFdiMszSwMU0HrnuqHpS/+tMPrWSJFJK
 7bamB8Nd6EhbQLk7+HENSc5F04FIiFfMj14Tnva995fHJ42NDadIKQE+aJwUBxpTRBGK
 LTtF5x/8qW6ObTYHDh4DOkGS9SdZKdc11e4hl8sIV+HYw2wj9F1ARYZSSR6wC15GzRcy
 4G/w==
X-Gm-Message-State: AJIora/4/89Cvz3gLRJjorkIcp8HLrQJLxu2qe9h8pzejJL729rwxUaK
 C7Q2+z7bLBaHDM+osyYEPq/UdnZxI029lnGiIgKmNil3LiwbwZBhOLANZX8rk32D95WyhnWa/sn
 yrlXMLul49u696wYfWfuqqvzSsA==
X-Received: by 2002:a05:620a:3707:b0:6b5:e205:81c7 with SMTP id
 de7-20020a05620a370700b006b5e20581c7mr454886qkb.754.1659039436931; 
 Thu, 28 Jul 2022 13:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vOtsnFMeB+47s+JEBfSL51sNWIhYCgzWGrde48yH7YXwWO1SbAs5TDZJ3n/JREYKaXerZ2MQ==
X-Received: by 2002:a05:620a:3707:b0:6b5:e205:81c7 with SMTP id
 de7-20020a05620a370700b006b5e20581c7mr454869qkb.754.1659039436693; 
 Thu, 28 Jul 2022 13:17:16 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 j18-20020a05620a289200b006a693e46d5csm1338993qkp.11.2022.07.28.13.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 13:17:16 -0700 (PDT)
Message-ID: <63f7fdefca924ac5d192a5f617ea41cf266ba756.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Alistair Popple <apopple@nvidia.com>, bskeggs@redhat.com, 
 rcampbell@nvidia.com
Date: Thu, 28 Jul 2022 16:17:14 -0400
In-Reply-To: <20220720062745.960701-1-apopple@nvidia.com>
References: <20220720062745.960701-1-apopple@nvidia.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] nouveau/svm: Fix to migrate all requested
 pages
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

hi, in the future if it's taking a while for a review to come back feel free
to just send a poke on the thread for the patch you submitted, I do my best to
keep up with all of the patches coming in. But there's a lot of email that I
get so every now and then one slips through the cracks.

Anyway, this patch looks good to me:

Reviewed-by: Lyude Paul <lyude@redhat.com>

I will push it to the appropriate branch in a little bit

On Wed, 2022-07-20 at 16:27 +1000, Alistair Popple wrote:
> Users may request that pages from an OpenCL SVM allocation be migrated
> to the GPU with clEnqueueSVMMigrateMem(). In Nouveau this will call into
> nouveau_dmem_migrate_vma() to do the migration. If the total range to be
> migrated exceeds SG_MAX_SINGLE_ALLOC the pages will be migrated in
> chunks of size SG_MAX_SINGLE_ALLOC. However a typo in updating the
> starting address means that only the first chunk will get migrated.
> 
> Fix the calculation so that the entire range will get migrated if
> possible.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Fixes: e3d8b0890469 ("drm/nouveau/svm: map pages after migration")
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 7ba66ad68a8a..16356611b5b9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -680,7 +680,11 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>                 goto out_free_dma;
>  
>         for (i = 0; i < npages; i += max) {
> -               args.end = start + (max << PAGE_SHIFT);
> +               if (args.start + (max << PAGE_SHIFT) > end)
> +                       args.end = end;
> +               else
> +                       args.end = args.start + (max << PAGE_SHIFT);
> +
>                 ret = migrate_vma_setup(&args);
>                 if (ret)
>                         goto out_free_pfns;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

