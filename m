Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7013418F0
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6617C6E9D6;
	Fri, 19 Mar 2021 09:57:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34F56E9D8
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TgleNGeQ16aMvI/a7tBquUukHlqXq2WMoe5SiiWgH/M=;
 b=PO3jwXabE7lCi/+W53eCb0OjOm4PHZ1JXh9kgQkQOnx3lggfOx/8nYAdvGg8KPBXGOMTV0
 hgTd0ZHuPg79xIDmUhLg91zsUbyExy3pwHFtzqzwTPOJx6DevqfIwQyiI+7wEZR4EEoH8K
 DVfu1JE1ntfOurUcVadDy47wb+K55hA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-phnBwpWBPqqGTKFOK9pZLw-1; Fri, 19 Mar 2021 05:57:31 -0400
X-MC-Unique: phnBwpWBPqqGTKFOK9pZLw-1
Received: by mail-wm1-f72.google.com with SMTP id w10so8096805wmk.1
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TgleNGeQ16aMvI/a7tBquUukHlqXq2WMoe5SiiWgH/M=;
 b=NDEUmuZ4zmCMvgCP+OJASYitp3di/7zlSaUfKFe+LCX8WgytYVqE6EWU267+Q/Sp8R
 DuwDRAthwPpkw4Nx/VCLYIHKVh/N31A+IRycRWJIubAyOD0GeQ8YCzCJrfn5kMNkFlFf
 JeI0WjbJrSRhRDLGl+t76oz6YIZc/tzA24bHHQCuwOSf1Y0sYhBcTNG/sKKyQlLPVwRf
 xEYLIRMK6CCAEhxWFrev5zAJbJbLwS+3PeTY0GG91OqqdRWi3z7YeCiHsVKdF30aiGDT
 jsfyabgIhUs4t3Jarxc1ESPm380Bc8Y8OAiS0j9UwIzpLijmOPHiipCDDn8LBTmscoIA
 6c5Q==
X-Gm-Message-State: AOAM533ymfP4aAU5CsEFQNQdegKKM0XdkoBk5nJ46CbAy3tASdgniY0Y
 dwTjddRN0kmT4keWLkdxWqFD8A4m/f8b8r54krN6U03+aewKWazzpvTbshyPMvpAxZNy9ya1vsd
 HjMUm+J/ooSujwlRPUH4GwGtA8Jz1EUO+s4m+Z/UrnQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr3595026wrz.373.1616147850302; 
 Fri, 19 Mar 2021 02:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyodC37R41eda3GZ5ZIkrkElEd2nIrO+/K3P2l9TcTShBgK7E6mIX6v+y8SYjujCKVkuwpVpy49XjH2/oX0tZQ=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr3595013wrz.373.1616147850147; 
 Fri, 19 Mar 2021 02:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-18-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-18-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:57:19 +0100
Message-ID: <CACO55tvmj1-_ZcmLyN0tUdrH1QzN2c23-a+bDBXCKEOEsiak9g@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 17/19] drm/nouveau/nouveau_ioc32: File headers
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

On Fri, Mar 19, 2021 at 9:25 AM Lee Jones <lee.jones@linaro.org> wrote:
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
