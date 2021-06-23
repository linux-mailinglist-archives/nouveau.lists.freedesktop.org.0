Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7689F3B1D90
	for <lists+nouveau@lfdr.de>; Wed, 23 Jun 2021 17:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA46E935;
	Wed, 23 Jun 2021 15:23:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3166E935
 for <nouveau@lists.freedesktop.org>; Wed, 23 Jun 2021 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624461819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqNfBw+DZy7VZXBvahJMXyxmm59IKQhUiq2dn1235vw=;
 b=al5+qDE98xCfMMjJOInGnGtQG/Jre0q0BjMjH+tHe1KQOOnoinpuHXdsDj7FR/N7MOkyNg
 +GBDV1Ve5dxbXhv4wvoZZ5tbPnItUFmvNiFxzEDHFlezcjFCRmZ/ydxSUjDTrs1Rup70gB
 FrAw49aPIt/ocgz9LR8xDJ6xnjRxCjA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-YgxPpMqBMtm5m2cYT6aXvg-1; Wed, 23 Jun 2021 11:23:37 -0400
X-MC-Unique: YgxPpMqBMtm5m2cYT6aXvg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so1191723wrs.3
 for <nouveau@lists.freedesktop.org>; Wed, 23 Jun 2021 08:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KqNfBw+DZy7VZXBvahJMXyxmm59IKQhUiq2dn1235vw=;
 b=eyD5VCGSBwZaFGFEEdG78Xns+Vy/qXsanSQyvGCJoXsCRrhNMpzi/cGudSJUOz5eGP
 MKeys8lVBA9LDZlt/gJlvHWul/etaez9W1+/gaZthh3n92LswoMv+/l1zDvexTh1921s
 R5Tx7nk9nA2/FqzdyCiBT2BOGr1ejHxjMBSyPaAugR3shVaPj9QcxL8A9FCFEHnlPuqb
 8QfVo/a9jqZklBQ1cMwozea8tF1fb2N0ctavLyy5ca0YklpY5Od08YGLgQqyVd4Gc7gA
 TseSU2IxCLaxoe5s8F4jASlZ4ZEPCz4F7mCuXBkK+VB0hkRDSlt342+IvpJNvlVKmtNI
 /CMA==
X-Gm-Message-State: AOAM531d5dts+ZOLbUFiP8kd0SLu6B/z9bFFd2PzOq0TeMf1Bv8SfDam
 CtLqYrjPntgaAqcEQhPcfCS7E8LQSsD8Hxh9CEZYCh6v844HuE/QQDtdMeJH1jgFC8zY+ZkofPX
 wAWzwiI12eSIipI9T17XHZAyFjBmg1fReDEIyi0zRRg==
X-Received: by 2002:a05:600c:2907:: with SMTP id
 i7mr4087052wmd.139.1624461816776; 
 Wed, 23 Jun 2021 08:23:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkwprwBs+4+m2cINYxKCit9IeKr9Iv1V9yb/mYUuehMDtRmPDtVVvRYTjDw7TLfVWQ+DO40JMT0djrFoge9kc=
X-Received: by 2002:a05:600c:2907:: with SMTP id
 i7mr4087017wmd.139.1624461816527; 
 Wed, 23 Jun 2021 08:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210622125803.640-1-caihuoqing@baidu.com>
In-Reply-To: <20210622125803.640-1-caihuoqing@baidu.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 23 Jun 2021 17:23:25 +0200
Message-ID: <CACO55ttH-BbGzT+2ZXPiONdmtv5s-4qCCLWAx+sxQ9kyJoKtfQ@mail.gmail.com>
To: Cai Huoqing <caihuoqing@baidu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] remove unused varialble "struct device *dev"
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 5:14 PM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> fix the warning- variable 'dev' set but not used
>

the patch title needs a prefix to indicate which subsystem it belongs
to. Check git log for examples.

With that fixed: Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 984721b..cb3ff4a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1242,7 +1242,6 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>  {
>         struct ttm_tt *ttm_dma = (void *)ttm;
>         struct nouveau_drm *drm;
> -       struct device *dev;
>         bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (ttm_tt_is_populated(ttm))
> @@ -1255,7 +1254,6 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>         }
>
>         drm = nouveau_bdev(bdev);
> -       dev = drm->dev->dev;
>
>         return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
>  }
> @@ -1265,14 +1263,12 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>                           struct ttm_tt *ttm)
>  {
>         struct nouveau_drm *drm;
> -       struct device *dev;
>         bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>
>         if (slave)
>                 return;
>
>         drm = nouveau_bdev(bdev);
> -       dev = drm->dev->dev;
>
>         return ttm_pool_free(&drm->ttm.bdev.pool, ttm);
>  }
> --
> 1.8.3.1
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
