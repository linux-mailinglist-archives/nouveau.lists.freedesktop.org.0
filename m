Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF03640DC
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964476E29D;
	Mon, 19 Apr 2021 11:49:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6774D6E296
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Nvnr/mWvz+T6laJ/pjEcnY0Y4Tpa0q+5QaX0V8C0qs=;
 b=jLE818sfJNucl2yE7RyVGHyxXTaSNvZTr/Uhi+HUpXsrfHyh0QmMU/tVB46Kdha5yhSWnW
 n7XNBnX+DNqCqb7YCB4UU8nZAZg8YRPoL1xCACsud4jZ7pVbDmbee7ggYKsMJqUMSs06Yp
 SjfKtwSeCNgrN6FllngFlb8/xvvyBes=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-03vOlY60P1CQWBy9XRjRSA-1; Mon, 19 Apr 2021 07:49:31 -0400
X-MC-Unique: 03vOlY60P1CQWBy9XRjRSA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso8914408wrs.2
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Nvnr/mWvz+T6laJ/pjEcnY0Y4Tpa0q+5QaX0V8C0qs=;
 b=OhLU8kkcEGLd52y79iFNvjAolMtQLCsXi+Lq/ArCTSmW5i4W5wTKeAkYGWlv7vyuvD
 lIo4NEb+m+6dsFNWQZnizpMHGFfc3pXHZsANfnAcrICJN4AZd+rODyp9uZFebDWsMTuA
 a3UjLZQoORX09JE8lODJZAr9S1zRPorrB6+4cSfGxSPGew5C1g3NjmuGw8eTaqp1JTTf
 QCuMXbkpLssdZLQSImKSzgcZQtlphN/1roHhtV1ZqGYeT7toeOvpLBDYwbRv3Ho7kSe1
 YAG6DhzNOvHYQqkku0dhKXFTi36IKAKKUvtKMh0dEuLDbcb87ut4kF8SdXERx6EZVWko
 gdug==
X-Gm-Message-State: AOAM532XRusrCJbZnoAxFPVZLNnWr6sIWtJBEaBbzBQ8BTmCG0ilsrTl
 asmoa0CM/duWg6qHOHE1xX5A4K7vo+Ks2KeLXia//V7PxKBuKRKqMrbqi+zfxM8qsTe0Yk5NTOo
 5rw97A5N6b1YNJrAXRX7oHfUF5X3IMzh3FFEOdb6Xfw==
X-Received: by 2002:a1c:1f52:: with SMTP id f79mr21592713wmf.171.1618832970137; 
 Mon, 19 Apr 2021 04:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbWHC/ooj/VbZZN3N0wPL5QrNvrPzxuDU9v2cQf3Sv9GVLeLTyCV/rsvFtv2/ZSANB/M4j+9FNq3XLJqeWUPY=
X-Received: by 2002:a1c:1f52:: with SMTP id f79mr21592702wmf.171.1618832970007; 
 Mon, 19 Apr 2021 04:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-15-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-15-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:49:19 +0200
Message-ID: <CACO55tsz_2G0aozzLXK_X7Hyw+Y0dtR=YdGi=sP73zdNnor1_A@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 14/40] drm/nouveau/nouveau_ioc32: File headers
 are not good candidates for kernel-doc
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
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:2: warning: Cannot understand  * file mga_ioc32.c
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> index adf01ca9e035d..8ddf9b2325a42 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * \file mga_ioc32.c
>   *
>   * 32-bit ioctl compatibility routines for the MGA DRM.
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
