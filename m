Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9941ADAB
	for <lists+nouveau@lfdr.de>; Tue, 28 Sep 2021 13:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8E86E10D;
	Tue, 28 Sep 2021 11:14:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867656E10D
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 11:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632827685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZU+KVR0y2VTh3ZrdA51D/L+4k30fXIYJ6SUmvuXTBtU=;
 b=SAKOM0YqFwuNKPwYKLal4VIfwogfEf2saQ2GH0A68F4bAAdDXVXHuhGWaVJQb1WZf9oyKc
 RjGMO/dyJlmy9yXkH/YNpWf9bs8BoilrI4/AYWwfytmV+n5x9BJ8QhlVhjgTsXRTS6VRU0
 +HhvCiDMJNYbN7VtgT7wdXOPGKbpazI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-BGi7oK0gMeWi5LarZrVNtQ-1; Tue, 28 Sep 2021 07:14:42 -0400
X-MC-Unique: BGi7oK0gMeWi5LarZrVNtQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso15036522wrn.4
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 04:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZU+KVR0y2VTh3ZrdA51D/L+4k30fXIYJ6SUmvuXTBtU=;
 b=aijZJpWL2XUYS5z2zEsjnAPiJWvrUjHubQjRYH3owtpLp38qg7BntupL9rCvLSVw8u
 g9O/RwlRBhsbL6UWrOtOlymXj/k4DZ7RMobAS3OIlngqfBfGd7Yl5TjPHmCbVKO+W5mz
 cALkEqOGnJJ0QGoBr6OgLkndlVxiKGeutic2FL1G9p/xkp6Rr2RsGiQ17/Q/pjzdXmVq
 q0gOh8dhqF+NH4oAedElKimzPzd6klfNmR117fTpu+t3nGuNg8DnBOZsDuPmisKfIppo
 BZUhPqrr6a0ETnehotf2XFtT32jlEI+03dI330LJTUgChWACK2hef9oA7z7DV9TlWbLL
 izwA==
X-Gm-Message-State: AOAM5314BBAsMlvFwKJ++QHdkBi/n3bTWsQuOMtFS43Ekud4VLUf5CpR
 fAe8S5edHdC0jTInF/8qE8PfbEjHy/taPdEEscUURBhP7VoVZEcfacPmp4kEFDI9gxbJNwlMdQL
 nj2k2uDfvaox0PAFqtU3WwU6IPR6Ja5sbuXxhVBN3bg==
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr4054951wmj.146.1632827681479; 
 Tue, 28 Sep 2021 04:14:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmyS/k9wYJiX+xvA60Ee54wMfLNQLygQJU7Coe9SlPvQKuE0bZ2nADyYTfZL/XxVTwdXQwLWEQNDjqQrl73Dg=
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr4054944wmj.146.1632827681334; 
 Tue, 28 Sep 2021 04:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210821021106.27010-1-luo.penghao@zte.com.cn>
In-Reply-To: <20210821021106.27010-1-luo.penghao@zte.com.cn>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:14:30 +0200
Message-ID: <CACO55tv5PoPL122+XSwS8Fyq9bbRNzqBghy7CPX1uTCKea9eUA@mail.gmail.com>
To: CGEL <cgel.zte@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
 Luo penghao <luo.penghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH linux-next] drm/nouveau/mmu: drop unneeded
 assignment in the nvkm_uvmm_mthd_page()
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Sat, Aug 21, 2021 at 10:46 AM CGEL <cgel.zte@gmail.com> wrote:
>
> From: Luo penghao <luo.penghao@zte.com.cn>
>
> In order to keep the code style consistency of the whole file,
> the 'ret' assignments should be deleted.
>
> The clang_analyzer complains as follows:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c:317:8:warning:
> Although the value storedto 'ret' is used in the enclosing expression,
> the value is never actually read from 'ret'.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Luo penghao <luo.penghao@zte.com.cn>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> index c43b824..d9f8e11 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
> @@ -314,7 +314,7 @@ nvkm_uvmm_mthd_page(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
>         page = uvmm->vmm->func->page;
>         for (nr = 0; page[nr].shift; nr++);
>
> -       if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
> +       if (!(nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
>                 if ((index = args->v0.index) >= nr)
>                         return -EINVAL;
>                 type = page[index].type;
> --
> 2.15.2
>
>

