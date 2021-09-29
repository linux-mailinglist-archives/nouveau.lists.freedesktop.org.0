Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E2841BD6D
	for <lists+nouveau@lfdr.de>; Wed, 29 Sep 2021 05:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C216E160;
	Wed, 29 Sep 2021 03:29:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4AD6E15E
 for <nouveau@lists.freedesktop.org>; Wed, 29 Sep 2021 03:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632886142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ypu7lSHLqUrP/H0+g4r3QAtlIt7DSpEMHZQnw4kUfiM=;
 b=Q5US/XUjUjKuRyODjblovUWUaV/iWUM5R7CU1CK0HLrzRmDJzP7gKfLonifdPXdsI1RD7F
 qIJ4V35ikNaGMvesnHl6+Ae06wXsFGpSYPG/EIT9u0KHvTDYW9eO109m/g6bAdycpl8k9y
 Xg1mRFvKr/AVwc9W6YWPoxdHGh0gc3g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-ijlPG7-XO9OgE8r1KGdQMA-1; Tue, 28 Sep 2021 23:28:59 -0400
X-MC-Unique: ijlPG7-XO9OgE8r1KGdQMA-1
Received: by mail-wm1-f71.google.com with SMTP id
 70-20020a1c0149000000b0030b7dd84d81so527203wmb.3
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 20:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ypu7lSHLqUrP/H0+g4r3QAtlIt7DSpEMHZQnw4kUfiM=;
 b=XUrf0ddI3n8SvXyyTjFjCTaD3D2v7VbHhKkbIhj3PMsXR45pH7Jhtmf7YbYrHlwtHt
 pli1gcRhwYcustWhEOGPJKfcubLt6WZetwi8lns9oSbQYcydcM0brZ3NUWjnpKFQJbAs
 Eqj8vZBjezko9pzalBMgCtw9gJhV/uUG9Y1H7YYCfVLHzWq48JcO7XbNCSXjOa7GKNdx
 0bk/iDDluBmfAKdehrna/7/BpbK1R/ZyMoYJlkGbPFW2VarjOt6+ZEu2sGrdFpcTsBq/
 F7SsBJovjNK3nXCOgoRXnXfK9MY4vHbOr5Xu+AWUmzHI0+yCyUTmWdM8ero4IDUGiuqi
 Rnew==
X-Gm-Message-State: AOAM531s+wfyqnHHXeP39xxsPDmhVKCV1+U3EhfTyYkwgFsPW4ygbKYN
 F12XNvkcOZpDIlL5IcgK3j3FTQ5DAx+FK2oCIPrbTq8KccoOZUoMARsRYD839u7Km+dslYXCsue
 6GIMcc/xn4Xr8hKHrr+UbkzIMt+uwJdcnCJQbJrm8Hg==
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr8150570wmp.74.1632886138161; 
 Tue, 28 Sep 2021 20:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6FKlEbCVhn+zhHA/mzkU4owvOyJWUbP+zvqJr/PTgo0iMkgM659VzGx/wX8Umvr4GJinRuUX0AjYIjW/UQVU=
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr8150552wmp.74.1632886137916; 
 Tue, 28 Sep 2021 20:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210928222513.GA294575@embeddedor>
In-Reply-To: <20210928222513.GA294575@embeddedor>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 29 Sep 2021 05:28:47 +0200
Message-ID: <CACO55tsD98dNzw8fP=CiKLsdbnn2Vg78+wTRM90kutHtv1RZ5A@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
 linux-hardening@vger.kernel.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH][next] nouveau/svm: Use kvcalloc() instead of
 kvzalloc()
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

Lack of documentation inside Linux here is a bit annoying, but do I
understand it correctly, that the main (and probably only) difference
is that kvcalloc checks whether the multiplication overflows and
returns NULL in this case?

On Wed, Sep 29, 2021 at 12:21 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Use 2-factor argument form kvcalloc() instead of kvzalloc().
>
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index b0c3422cb01f..1a896a24288a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -992,7 +992,7 @@ nouveau_svm_fault_buffer_ctor(struct nouveau_svm *svm, s32 oclass, int id)
>         if (ret)
>                 return ret;
>
> -       buffer->fault = kvzalloc(sizeof(*buffer->fault) * buffer->entries, GFP_KERNEL);
> +       buffer->fault = kvcalloc(sizeof(*buffer->fault), buffer->entries, GFP_KERNEL);
>         if (!buffer->fault)
>                 return -ENOMEM;
>
> --
> 2.27.0
>

