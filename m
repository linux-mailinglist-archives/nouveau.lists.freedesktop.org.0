Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD862531553
	for <lists+nouveau@lfdr.de>; Mon, 23 May 2022 19:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA86112100;
	Mon, 23 May 2022 17:37:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE7F112100
 for <nouveau@lists.freedesktop.org>; Mon, 23 May 2022 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653327439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYIDCnf/Zf8QzS2kJ2TsL1URkSHu4rYCBHFAM1s78Bs=;
 b=Z+FJwTlzyZdVBRHNpxKPiWBO7HoNVvxKE/+1TXvL5MieRRgXxPa65TwR7muQYIR7MPRyFv
 uIRQJVxqgOdLgp7xV5j7ebBK8bmLNbIvlA46nfmu2tbWffAnrabgkD4NwaBX4IU4kGVAPH
 6NYQuXmTR6lgLv+bGvZSRyfCiGGTHoQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-nz3_Dwg1MZybRGQzR2fx6Q-1; Mon, 23 May 2022 13:37:10 -0400
X-MC-Unique: nz3_Dwg1MZybRGQzR2fx6Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 d4-20020a05622a15c400b002f3bd4b80f7so12062797qty.3
 for <nouveau@lists.freedesktop.org>; Mon, 23 May 2022 10:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=BYIDCnf/Zf8QzS2kJ2TsL1URkSHu4rYCBHFAM1s78Bs=;
 b=xAVbMNSBXWzIDrspKiyW2zISp/ewIn2Mh0j0lQePiYRRBTCg8Pr75UxJMHZHKqI0HP
 zYbYNpKioNXfQSpAEhESFm8RZbgrPx4ExrRYhWaijNGKtwCFIC1N9AGXWGgjF9x3YnZO
 iJsz2UbHugL0YGh6zz/cjf2kYpb3qByl2c3DGACd+YPwZ+9xpdvjHIZeNiUGe40lSdAz
 1XM2RNHgm91XI1mwFXQfk3zSLL60zOSoZopjBI4WMnNUCsCt5t7QqhD7umc+tib1vSvT
 MzOEzoGi/udAPUpJRB13jv0YyzkMU/mDqkOJLnqyUw5/zEgRwAap60IZL8/N385vOJOb
 cIig==
X-Gm-Message-State: AOAM5302Ig01iiCFX3LILSI+XeWktk0PO2VHZlrF5+2ufRcZfyLoW+kb
 OzCjVSZKigrVGUqmi5wORGn/g5k+oB2SWryZ2riUpxUKnVu+WQJZ0/XN8odOBM1kEctjmOkN5nz
 qFzMzuoGa880XKot+53IlrLqOng==
X-Received: by 2002:ad4:5bc1:0:b0:42c:531c:ef12 with SMTP id
 t1-20020ad45bc1000000b0042c531cef12mr18148403qvt.15.1653327430210; 
 Mon, 23 May 2022 10:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFSlrvT0UAwxLdqZ1fz1PXc+yVuTdzO7/sMFpZ8cj76cv99LCVVGr1j1/NEpUjri+Na5pRww==
X-Received: by 2002:ad4:5bc1:0:b0:42c:531c:ef12 with SMTP id
 t1-20020ad45bc1000000b0042c531cef12mr18148377qvt.15.1653327429953; 
 Mon, 23 May 2022 10:37:09 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 w15-20020ac84d0f000000b002f90517bc25sm4619030qtv.41.2022.05.23.10.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 10:37:09 -0700 (PDT)
Message-ID: <36bd82b1a95cb4cbbecac188a4c4e27cf890cdd4.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mark Menzynski <mmenzyns@redhat.com>, linux-kernel@vger.kernel.org
Date: Mon, 23 May 2022 13:37:07 -0400
In-Reply-To: <20220523113541.10562-1-mmenzyns@redhat.com>
References: <20220523113541.10562-1-mmenzyns@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH v3] drm/nouveau: clear output poll workers
 before nouveau_fbcon_destroy()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a bit, thanks!

On Mon, 2022-05-23 at 13:35 +0200, Mark Menzynski wrote:
> Resources needed for output poll workers are destroyed in
> nouveau_fbcon_fini() before output poll workers are cleared in
> nouveau_display_fini(). This means there is a time between fbcon_fini()
> and display_fini(), where if output poll happens, it crashes.
> 
> This patch introduces another output poll clearing before fbcon
> resources are destroyed.
> 
> BUG: KASAN: use-after-free in
> __drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
> [drm_kms_helper]
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> index 4f9b3aa5deda..5226323e55d3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -39,6 +39,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_atomic.h>
> @@ -605,6 +606,7 @@ nouveau_fbcon_fini(struct drm_device *dev)
>         if (!drm->fbcon)
>                 return;
>  
> +       drm_kms_helper_poll_fini(dev);
>         nouveau_fbcon_accel_fini(dev);
>         nouveau_fbcon_destroy(dev, drm->fbcon);
>         kfree(drm->fbcon);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

