Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73237FAA8
	for <lists+nouveau@lfdr.de>; Thu, 13 May 2021 17:25:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE906ED18;
	Thu, 13 May 2021 15:25:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8366ED18
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620919551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TK0feZBkcSNx25OgRN7PT9UonSQiFt9PRIoYYTLoGRM=;
 b=Wdz3OcUxp+YUAuSErLIjZZ+LjbymdOPEtsx5m8UiUOrs2l4FYRaLdDry9U2tQKqn+Fige1
 xX9/siRGiKXBNBvabfzV7eL+mk7FmLN5XQOe8kNi26B8Gskcoa/o6bD264W67d37ipdFq6
 7TQ+RSjgCX+GSb/HIl8v1ZyKsG8FQzo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-GJPxnEJ3NJeITBgxcIE9TA-1; Thu, 13 May 2021 11:25:48 -0400
X-MC-Unique: GJPxnEJ3NJeITBgxcIE9TA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d13-20020a05622a05cdb02901c2cffd946bso18168586qtb.23
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 08:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TK0feZBkcSNx25OgRN7PT9UonSQiFt9PRIoYYTLoGRM=;
 b=CFyLGq2COTHt96cABcs7YoPOyD9nmy5cobxY8JiJnCJ907lg0l1KgYbqJ+SIM6SgCF
 7yh5S2gUDrtzck6HnuzvwhEUXNTMtdyL5oFjyCB9OkGDw/xvAcOCcUfgy7E3LNhdi6VK
 NYfVLciAObfQ5mRovPYhc2TXithWinGbxRI/xjECuBbE7SiWdq8AtKfne04mSG2UyZYY
 DOqf0oZOTKF8EygS+Gy+ncr4qGG6IuJf3GizpI7CCxxi1JZTBPHFKeLIAqWIshX0eizA
 Jakkj/OVJDAQKvm0/mGYMTa+CWPJGq165nObIfk2mhyRWbvvcPFhKH4e2gW0gXEmQCEY
 lZ2w==
X-Gm-Message-State: AOAM533MTaqgQqjdptwvSn8JJh6APT7hOG2BXHMNUS3rviBzk1Rv+61X
 aVFCkYYbZz3aYqSVjme2EyradvQeg7S98LqecQXi4dxwqbwOvW70HiKjhU8cX8aqGqdrCWo74Ix
 AXOzfqgWWup0MjivTyk2BYb/GlA==
X-Received: by 2002:a37:a24b:: with SMTP id l72mr38596653qke.189.1620919548231; 
 Thu, 13 May 2021 08:25:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySHUjItQ6yLrTSc3O/tiSqTgwjx6Z/aaUnRQCgiPwR2l5L8hQRlp7QF/3ioVx8h5AExllBHQ==
X-Received: by 2002:a37:a24b:: with SMTP id l72mr38596638qke.189.1620919548026; 
 Thu, 13 May 2021 08:25:48 -0700 (PDT)
Received: from dev ([2605:a601:a63d:7f01:3e3e:f81:8e8d:ad8a])
 by smtp.gmail.com with ESMTPSA id f16sm2518307qtv.82.2021.05.13.08.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 08:25:47 -0700 (PDT)
Date: Thu, 13 May 2021 11:25:46 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <YJ1E+opCkn9STuAr@dev>
References: <20210511163553.2344244-1-kherbst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511163553.2344244-1-kherbst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH] nouveau/gem: fix user-after-free in
 nouveau_gem_new
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
Cc: nouveau@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 06:35:53PM +0200, Karol Herbst wrote:
> If ttm_bo_init fails it will already call ttm_bo_put, so we don't have to
> do it through nouveau_bo_ref.
> 
> ==================================================================
> BUG: KFENCE: use-after-free write in ttm_bo_put+0x11/0x40 [ttm]
> 
> Use-after-free write at 0x000000004dc4663c (in kfence-#44):
>  ttm_bo_put+0x11/0x40 [ttm]
>  nouveau_gem_new+0xc1/0xf0 [nouveau]
>  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
>  drm_ioctl_kernel+0xb2/0x100 [drm]
>  drm_ioctl+0x215/0x390 [drm]
>  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
>  __x64_sys_ioctl+0x83/0xb0
>  do_syscall_64+0x33/0x40
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> kfence-#44 [0x00000000c0593b31-0x000000002e74122b, size=792, cache=kmalloc-1k] allocated by task 2657:
>  nouveau_bo_alloc+0x63/0x4c0 [nouveau]
>  nouveau_gem_new+0x38/0xf0 [nouveau]
>  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
>  drm_ioctl_kernel+0xb2/0x100 [drm]
>  drm_ioctl+0x215/0x390 [drm]
>  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
>  __x64_sys_ioctl+0x83/0xb0
>  do_syscall_64+0x33/0x40
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> freed by task 2657:
>  ttm_bo_release+0x1cc/0x300 [ttm]
>  ttm_bo_init_reserved+0x2ec/0x300 [ttm]
>  ttm_bo_init+0x5e/0xd0 [ttm]
>  nouveau_bo_init+0xaf/0xc0 [nouveau]
>  nouveau_gem_new+0x7f/0xf0 [nouveau]
>  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
>  drm_ioctl_kernel+0xb2/0x100 [drm]
>  drm_ioctl+0x215/0x390 [drm]
>  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
>  __x64_sys_ioctl+0x83/0xb0
>  do_syscall_64+0x33/0x40
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Fixes: 019cbd4a4feb3 "drm/nouveau: Initialize GEM object before TTM object"
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index c88cbb85f101..1165ff990fb5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -212,7 +212,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>  
>  	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
>  	if (ret) {
> -		nouveau_bo_ref(NULL, &nvbo);
>  		return ret;
>  	}
>  

I submitted a patch for this in the beginning of December, it got
reviewed and it's languished ever since[0]. It's frustrating that these
issues have to get fixed multiple times by multiple developers because
bug fixes (with reviews!) aren't being accepted.

[0] https://lists.freedesktop.org/archives/nouveau/2020-December/037571.html

Anyway, for whatever it's worth:

Reviewed-by: Jeremy Cline <jcline@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
