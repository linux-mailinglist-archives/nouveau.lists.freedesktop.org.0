Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F47B3B38
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 22:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1731310E13A;
	Fri, 29 Sep 2023 20:24:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C50110E133
 for <nouveau@lists.freedesktop.org>; Fri, 29 Sep 2023 20:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696019064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ewZiFHUKmV9xtcbcuN23GQRTu/CBTIx2ARUrFl0HY20=;
 b=PNqVMtfiRNeCkEvXJSrQ9m4ozYETE6hR2zn9hvIHCeDa0nUqhz1I0+r5uRaTqCsPL2IDGm
 yE9SKYjJe1qLDXm7Nsr/89tl8uCtaPOddsiO4SjyTu0vT7Qw/o+Y1ywuWL2yH4/Hx0SeQc
 aABc0cy/1eYDKlfQyat1vUYjU1fJqpE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-VKA2Fc_OP5eQAe3kuNO5VQ-1; Fri, 29 Sep 2023 16:24:21 -0400
X-MC-Unique: VKA2Fc_OP5eQAe3kuNO5VQ-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1b728bfb372so30791963fac.2
 for <nouveau@lists.freedesktop.org>; Fri, 29 Sep 2023 13:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696019061; x=1696623861;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6AMpb+2gDgq7RlPrOwXqsC5rvICGHGcOSn62cpzrOUk=;
 b=jwJm4dyLy/lJhLOIeYThNcGwyBxWpqMwhslvTVeJBo2w3tHt5bmmnyLY6Jc0jGujnX
 L+8DKHY0oAP2x7j/7DZ7wSjGlVq0kyr6ZnwWmYHNnYcwWf1MdbJ8iuyffuWDy/w9Fweb
 zo/ivvBhp1LxwPqT9SC/nsy2Spw1KwJulkMjnnr5DFwRmOLE5WdYh69tt4CfUvQmf8Yb
 86uau+Lw+pVJdUwOd8Zj75GESbaJxoQjqYmZJj1N++egfE9L3m2OBm8o3CtrsPLkvLfa
 28Zn5sZOI4pzJP8iDOVfIxfXNpllCPdYgS/D2qKbXL6TIsrp5MozInrLld9MNbJaj4F/
 lOig==
X-Gm-Message-State: AOJu0Yw6CN8JfZ9nLKSFmQDF9IiN4+HJxpJIh1sgShcEPAhdKaZc6Ob2
 YdORS7fwxz+wxejDNxXiAhrNWGSaI7At5TYGzEhQSAL7RY2uojVP4iRCnjAPx1Y461p0yrC2EZU
 bsL+DZU+N36qfz4zdlHys0T/FnA==
X-Received: by 2002:a05:6870:b507:b0:1c0:d0e8:8fda with SMTP id
 v7-20020a056870b50700b001c0d0e88fdamr6227162oap.16.1696019060831; 
 Fri, 29 Sep 2023 13:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvm09Ewxw9lUjDhCKZhnPdCxi8jwKEnZc5hS6eklkvEm8RJG8FijD4Ce7C0XS6xgeA7v/m9A==
X-Received: by 2002:a05:6870:b507:b0:1c0:d0e8:8fda with SMTP id
 v7-20020a056870b50700b001c0d0e88fdamr6227152oap.16.1696019060595; 
 Fri, 29 Sep 2023 13:24:20 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 vu4-20020a05620a560400b00774309d3e89sm4398580qkn.7.2023.09.29.13.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 13:24:20 -0700 (PDT)
Message-ID: <9e699068d5cb644201a8b9be113a94a90299ac39.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>, nouveau@lists.freedesktop.org
Date: Fri, 29 Sep 2023 16:24:19 -0400
In-Reply-To: <20230916011501.15813-1-dakr@redhat.com>
References: <20230916011501.15813-1-dakr@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fence: fix type cast warning in
 nouveau_fence_emit()
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
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2023-09-16 at 03:14 +0200, Danilo Krummrich wrote:
> Fix the following warning.
>=20
>   drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse: sparse:
>   incorrect type in initializer (different address spaces)
>   @@     expected struct nouveau_channel *chan
>   @@     got struct nouveau_channel [noderef] __rcu *channel
>=20
> We're just about to emit the fence, there is nothing to protect against
> yet, hence it is safe to just cast __rcu away.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309140340.BwKXzaDx-lkp@i=
ntel.com/
> Fixes: 978474dc8278 ("drm/nouveau: fence: fix undefined fence state after=
 emit")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/no=
uveau/nouveau_fence.c
> index 61d9e70da9fd..ca762ea55413 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -207,7 +207,7 @@ nouveau_fence_context_new(struct nouveau_channel *cha=
n, struct nouveau_fence_cha
>  int
>  nouveau_fence_emit(struct nouveau_fence *fence)
>  {
> -=09struct nouveau_channel *chan =3D fence->channel;
> +=09struct nouveau_channel *chan =3D unrcu_pointer(fence->channel);
>  =09struct nouveau_fence_chan *fctx =3D chan->fence;
>  =09struct nouveau_fence_priv *priv =3D (void*)chan->drm->fence;
>  =09int ret;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

