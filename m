Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1F51E128
	for <lists+nouveau@lfdr.de>; Fri,  6 May 2022 23:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B641210EB56;
	Fri,  6 May 2022 21:32:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59AB10EB56
 for <nouveau@lists.freedesktop.org>; Fri,  6 May 2022 21:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651872765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJbJbWsoyM+Ik6q37wpw5Oa4Nh86YRow8ddVHHmJk08=;
 b=JK5FwrLry48xN+2TqybW4GjhX2pOCgz2U1HcaIrFukFni3wSBzGaLxnvSdCioSo+K9Pmex
 wrxB7D5YpfxGbQsGxnXcd3UsKw8bQ+VxrFquU7FiJoiVQIUcb+ACUxOIsEIw+wR9c5ESSh
 Q/3fcZAnCKYfsEyLziiKXVLb5xkH4G0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-BzZXGHJpOOWPAKfotmVEUw-1; Fri, 06 May 2022 17:32:44 -0400
X-MC-Unique: BzZXGHJpOOWPAKfotmVEUw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d4-20020a05622a15c400b002f3bd4b80f7so4699304qty.3
 for <nouveau@lists.freedesktop.org>; Fri, 06 May 2022 14:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=dJbJbWsoyM+Ik6q37wpw5Oa4Nh86YRow8ddVHHmJk08=;
 b=Z4/vCozWF7m3y4qeHiV6BxPsMYn3rpdU22AEAZoUl8UqARbqRh21Egh8zJnpELzUtx
 vSlGtnkjox2376aetN2LGsJlfvuIaysxU0YeJoalDdzCF8vGww58wxSsUMVT2ADjfC29
 ClKAfG6fbMMJpRXzbCO4l/lu6nIjEP9Hw6EVCjTC+Zww91UcL+FdlMOD9bGHueRwMWcN
 Hn5gJ4sXPWp56MEKeHZidGGz7Qx/rqru6Qy/ELY5Nk9ZqFt5l8kWJ2dMwdtaM7KFo2IX
 VICyt/LVE+ckgvhgRjBsymVU8T8yTMZZPIookOFVAlzcLsoMSMop1Uarm8rrNd+T5GXD
 DeYg==
X-Gm-Message-State: AOAM533IiEgLql/PdJdJdVRUtd8XQR/Wdi+hq5Dsl7Wg3FyGjR9iAKeh
 JUYafuBkSl0kHgXux1k6oGahqpE5LLd1BD6d5sHLbMAwzWU4SQUp6HjZohOMuD+r+2XmJPuoktB
 lSN+3NHpfA2qMDOEwMPedsnXiRQ==
X-Received: by 2002:a0c:ab09:0:b0:443:95d9:140c with SMTP id
 h9-20020a0cab09000000b0044395d9140cmr4170803qvb.84.1651872764249; 
 Fri, 06 May 2022 14:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK5FWqqA+iA50nH6ppws5HNXmaCdaMsh8I0itmM43LaQ06P84wOxCI5Gl5CmLPygLNpGGy8Q==
X-Received: by 2002:a0c:ab09:0:b0:443:95d9:140c with SMTP id
 h9-20020a0cab09000000b0044395d9140cmr4170789qvb.84.1651872763988; 
 Fri, 06 May 2022 14:32:43 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 b3-20020ac85403000000b002f39b99f6adsm3164237qtq.71.2022.05.06.14.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 14:32:43 -0700 (PDT)
Message-ID: <9b7eab5df5e63e3fe899bca9ea35f4be8bbff98c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Pierre Moreau
 <pierre.morrow@free.fr>
Date: Fri, 06 May 2022 17:32:42 -0400
In-Reply-To: <9ba85bca59df6813dc029e743a836451d5173221.1644386541.git.christophe.jaillet@wanadoo.fr>
References: <9ba85bca59df6813dc029e743a836451d5173221.1644386541.git.christophe.jaillet@wanadoo.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix a potential theorical leak
 in nouveau_get_backlight_name()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Sorry I totally missed this patch up until now, noticed it while going through
unread emails today. This is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

FWIW, if there's something you need reviews on that hasn't gotten looked at
after a few weeks feel free to poke the nouveau list/me.

Anyway, I will go ahead and push this to drm-misc-fixes in a moment. Thanks!

On Wed, 2022-02-09 at 07:03 +0100, Christophe JAILLET wrote:
> If successful ida_simple_get() calls are not undone when needed, some
> additional memory may be allocated and wasted.
> 
> Here, an ID between 0 and MAX_INT is required. If this ID is >=100, it is
> not taken into account and is wasted. It should be released.
> 
> Instead of calling ida_simple_remove(), take advantage of the 'max'
> parameter to require the ID not to be too big. Should it be too big, it
> is not allocated and don't need to be freed.
> 
> While at it, use ida_alloc_xxx()/ida_free() instead to
> ida_simple_get()/ida_simple_remove().
> The latter is deprecated and more verbose.
> 
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is more a clean-up than a fix.
> It is unlikely than >= 100 backlight devices will be registered, and the
> over allocation would occur even much later when the underlying xarray is
> full.
> 
> I also think that the 'if (bl->id >= 0)' before the ida_simple_remove()
> calls are useless. We don't store the id if a negative (i.e. error) is
> returned by ida_simple_get().
> 
> Finally, having a '#define BL_MAX_MINORS 99' could be better than a
> magic number in the code.
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index ae2f2abc8f5a..ccd080ba30bf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -46,8 +46,8 @@ static bool
>  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
>                            struct nouveau_backlight *bl)
>  {
> -       const int nb = ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
> -       if (nb < 0 || nb >= 100)
> +       const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
> +       if (nb < 0)
>                 return false;
>         if (nb > 0)
>                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d",
> nb);
> @@ -414,7 +414,7 @@ nouveau_backlight_init(struct drm_connector *connector)
>                                             nv_encoder, ops, &props);
>         if (IS_ERR(bl->dev)) {
>                 if (bl->id >= 0)
> -                       ida_simple_remove(&bl_ida, bl->id);
> +                       ida_free(&bl_ida, bl->id);
>                 ret = PTR_ERR(bl->dev);
>                 goto fail_alloc;
>         }
> @@ -442,7 +442,7 @@ nouveau_backlight_fini(struct drm_connector *connector)
>                 return;
>  
>         if (bl->id >= 0)
> -               ida_simple_remove(&bl_ida, bl->id);
> +               ida_free(&bl_ida, bl->id);
>  
>         backlight_device_unregister(bl->dev);
>         nv_conn->backlight = NULL;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

