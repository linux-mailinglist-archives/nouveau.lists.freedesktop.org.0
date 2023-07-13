Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F71C751CE1
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 11:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371BF10E64C;
	Thu, 13 Jul 2023 09:11:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0DF10E64C
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgFtZUgh5go8zila2S4ZY5xFxZuToGtLb3sGveBEJbY=;
 b=dTHaiTl1AABD4TzZVYdT6WF1Vya3G8ddDRpjtmQJUw+2YTy16kZOmopNJ01ZI1Z41a74FL
 B4JHjtDkrGm94OiOUjGRx1CmNqeTMW8SXaxkX0Dmyv1JmEpGBa1z1TRucqbCDMAI0LkjF8
 mKl4KPu6GT051uE6MgGNPqOA7zTwOJg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-XzaerMkWOI2KFf5xDgyDBA-1; Thu, 13 Jul 2023 05:11:40 -0400
X-MC-Unique: XzaerMkWOI2KFf5xDgyDBA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso1260151fa.0
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 02:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239499; x=1689844299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgFtZUgh5go8zila2S4ZY5xFxZuToGtLb3sGveBEJbY=;
 b=kax+TQAlhMXhbsrIZvuZpQePgtz5d2HoM9Umrz3KZDF/TMMnvClrVhCXD6PyHU9vaJ
 fdRp0MLTasDXQkfIRvcURfk8/BGj9bQKYuYxV/ZZ04QjtnFupcMMcEr2C839fdQsXIR9
 O/QtEtZ/PkVRGSBo/39i2EvjnOgHfs/8vr5qBhhDEbLxQrKqcHQX7PTZ0nfLk6J9LZHb
 hS+KYdk5n2q6WSHcBxj4Z6RO5zxP7baWypk5ieGJwrKnf4bvbd5jDY1vWjDs5/2TLHoV
 ju8OeCU8pWyuXmhWl2RU2wElnxUXGjphhBUJHOLAVLZvqfxAkjDFwmYYJr4mwTtaB47d
 LDFw==
X-Gm-Message-State: ABy/qLa7KKBChMIc3KJ1YxbhPTjFA3BcynpnHiZeqjCSfYWRFCiAQbjl
 kW96dKkM5zNZWQkkXZ9QTk64vNAAg1yhbEuf24LZynZZZYLbKoJrvJdQL5vxN5nJ5Yof8T6fmX9
 568yeXM30we2Kj6duW9hERxgukbERLYTT36p/yN4CeA==
X-Received: by 2002:a2e:a790:0:b0:2b6:99a7:2fb4 with SMTP id
 c16-20020a2ea790000000b002b699a72fb4mr1029819ljf.0.1689239499531; 
 Thu, 13 Jul 2023 02:11:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHNMXMfFllIlbsS7OgZ8tt30TUpflSFE8vHptSmh10AZhpcrU0369e6fqWHgckt6hGkADlesM/GIl6gUWcIL/8=
X-Received: by 2002:a2e:a790:0:b0:2b6:99a7:2fb4 with SMTP id
 c16-20020a2ea790000000b002b699a72fb4mr1029800ljf.0.1689239499293; Thu, 13 Jul
 2023 02:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230710062932.53655-1-xujianghui@cdjrlc.com>
 <7ab55aa7169d6a3bd0309b43c3de592e@208suo.com>
In-Reply-To: <7ab55aa7169d6a3bd0309b43c3de592e@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:11:28 +0200
Message-ID: <CACO55tu=5HKnywnnV499YkVUg-o_HY8gMEQHozkLDdbNE=YQwg@mail.gmail.com>
To: sunran001@208suo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/i2c: do not use assignment in if
 condition
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Assignments in if condition are less readable and error-prone.  Fixes
> also checkpatch warning:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> index d063d0dc13c5..098051d3755c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> @@ -209,7 +209,8 @@ nvkm_i2c_aux_new_(const struct nvkm_i2c_aux_func
> *func,
>             struct nvkm_i2c_pad *pad, int id,
>             struct nvkm_i2c_aux **paux)
>   {
> -    if (!(*paux =3D kzalloc(sizeof(**paux), GFP_KERNEL)))
> +    *paux =3D kzalloc(sizeof(**paux), GFP_KERNEL);
> +    if (!*paux)
>           return -ENOMEM;
>       return nvkm_i2c_aux_ctor(func, pad, id, *paux);
>   }
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

