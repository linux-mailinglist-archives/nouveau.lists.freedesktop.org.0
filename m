Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771FE7A55B9
	for <lists+nouveau@lfdr.de>; Tue, 19 Sep 2023 00:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C3110E123;
	Mon, 18 Sep 2023 22:25:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AA389F4F
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695075900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPyNutSLkkHTZxI3B0PY2u8QnFtvmNqTwCfplTU4uRc=;
 b=CNwpgxBgPkGeSaQEypP8MI+tNevSGGkzzGQCRBrEZvv3nNdEcc+lhvrGXDeJsnJfzCUjsc
 hL/6B1NgP8QXZ8S2Pi4qe/mZtH367Nhfjas/ZHJEb1/nPOAifsiuDmIpriWXfk+MLHDPeE
 7VcRFSpGlGxjnKN1BPn9A8TqTvirMoM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-_h99nmPEPDK3dKO-IQBoGQ-1; Mon, 18 Sep 2023 18:24:58 -0400
X-MC-Unique: _h99nmPEPDK3dKO-IQBoGQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6581f856b2eso14386516d6.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695075898; x=1695680698;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WG8Pu+Mw6aXgo3oVLCA7cZJ3LSi2mKUayS+JlD6Q7jo=;
 b=cwP9BRfhKhRKHS5SR9ztkWR89cL+77QCVQUtHJmculbaC736uyR/P/QKo9UpYuddHN
 4ukrUxTBt/1Y6uWcY2JJdsJ9ILUJPNP9qG8/6J1PYX+a2UL6G2dipoUptLCQ75NOuc0r
 Y+Rcd3nFaBTUHy+ydfYQ9Qg40bB8zC9lqzxS+XzGILVeO2BKo2fXFSq6TIYcxyy5zkMG
 5qcFYnipjyh7U3AMBqn4eAHb7aNRajMrCvpZgnC6dZAcCUFHbIsNmZDL2e2uTC9fHmgv
 xqjw6ZC2/Ng7bzLZo9f+Z7B5ZF5HPDrLx+lvjp4nf3hn1RIB387Z8jlykdsozcG8Ojs/
 4GcQ==
X-Gm-Message-State: AOJu0YzYp/m0KuEaR7oXzRGKqciDkBW80rvaz+vGB+ECPPadoAnKwn9L
 jckKSluP/2pZwUbBhNNkHRQdsB908FKU2JlbZRwfEKGr5RGI9ypisSOv3msrvxngvbFqf2sIflO
 rrxQTHrVQPenlVmh810ckzvfDoQ==
X-Received: by 2002:a0c:cdcd:0:b0:655:88e9:1b0c with SMTP id
 a13-20020a0ccdcd000000b0065588e91b0cmr10311582qvn.38.1695075898341; 
 Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj7nahJ/IxATPNQUGSshqEPQ29nHykvjD/+zTI+gGvnxe5EWaVWGI/vQ9GRABMAcnfQ+LBUg==
X-Received: by 2002:a0c:cdcd:0:b0:655:88e9:1b0c with SMTP id
 a13-20020a0ccdcd000000b0065588e91b0cmr10311573qvn.38.1695075898129; 
 Mon, 18 Sep 2023 15:24:58 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a0cf4ca000000b00656329bb3b1sm3217669qvm.10.2023.09.18.15.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 15:24:57 -0700 (PDT)
Message-ID: <10db3f25dc671ca0b8f50be548d409fcd3fc896c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Airlie <airlied@redhat.com>
Date: Mon, 18 Sep 2023 18:24:56 -0400
In-Reply-To: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer
 bug
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

I assume you need me to push this to drm-misc?

On Fri, 2023-09-15 at 15:59 +0300, Dan Carpenter wrote:
> The u_memcpya() function is supposed to return error pointers on
> error.  Returning NULL will lead to an Oops.
>=20
> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 3666a7403e47..52a708a98915 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned=
 int size)
>  =09size_t bytes;
> =20
>  =09if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> -=09=09return NULL;
> +=09=09return ERR_PTR(-ENOMEM);
>  =09return vmemdup_user(userptr, bytes);
>  }
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

