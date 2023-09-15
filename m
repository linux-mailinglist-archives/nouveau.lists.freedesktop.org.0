Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C267A24E1
	for <lists+nouveau@lfdr.de>; Fri, 15 Sep 2023 19:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE7A10E65E;
	Fri, 15 Sep 2023 17:34:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E9E10E65E
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 17:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694799297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XXweTSxb9lF3B3Kz508TxEQymlimekhkNK/jKVtIHZ8=;
 b=NJeKf4L0Wzz2g2RCcYrL2InEwfkk8ulHXFpDmE2O5iwijGNpuvFBe4H33ijaKZqQdOHpO4
 EJJqFmohfr8QG3GZ+R7Sw7N5iIwQhqx/eK+PU9ZP82lc0NGp8muarn+LVfy51PWknuC+0g
 8qacKEYOC46HOvXZnorIuk0hbDznAGY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-APfFU56bMgacRl-xJ6bZTw-1; Fri, 15 Sep 2023 13:34:56 -0400
X-MC-Unique: APfFU56bMgacRl-xJ6bZTw-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76dd2550295so307975685a.1
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 10:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694799295; x=1695404095;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wg4EmNZIrmGv1tACZxeJZ0Y5VT57wRFa8YOjLPmyTEA=;
 b=lQN389fzlIlCcRM08t9Pfii4IT1/Bxt81lQvj/XcOloVFnuPolmjvf5eJHQiHSKk7H
 ydBiW1HNNRxnRHygAHXEDW/42pixtY4UwHjpWTmIg0y7fqYQn1X67HGKObTgoOBnzTay
 umyqYGVHLq08bw42PGHcvgY+tO0d8nuBfayxJTkANkrbISqD4hLkmVa59JV29qymOgJj
 w27/wWk5sXR5iQouXeuL0OEdYXINbFWwzBjKNRhzjCy5aKnyPgLDyfCzW9GxLqxLE+rA
 JkzxtcMpk0tmw0JUJ1NwrY8wSmwNQ4ZYEdGW+xHhNYrfFyoGSrpIEN39P4vRC5KvSRIS
 DKYQ==
X-Gm-Message-State: AOJu0YySZpMbjViBB8RKHhgYaNqXFUtdUo4/9tQsCPtSxRbrq2qnVElo
 UYaeG/YjDxmWlGu0G/2yVj990KyO9JiAglXakZpCRsUZNqzuvIZDs5ig8zB7qq3lz8LIM/bHp9p
 gyR1m3eoHOjYjisXTfSyt3NNScg==
X-Received: by 2002:a05:620a:31a8:b0:76e:f38b:e87a with SMTP id
 bi40-20020a05620a31a800b0076ef38be87amr2532008qkb.48.1694799295661; 
 Fri, 15 Sep 2023 10:34:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP11ZRbh22ddAzRnfdJhpVYsJBozLWaDGrgjYYQNVtI0psKjUDWcq5Q/AqsDQgs/wMdX3AMQ==
X-Received: by 2002:a05:620a:31a8:b0:76e:f38b:e87a with SMTP id
 bi40-20020a05620a31a800b0076ef38be87amr2531996qkb.48.1694799295431; 
 Fri, 15 Sep 2023 10:34:55 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05620a118100b0076ca401d8c7sm1358150qkk.111.2023.09.15.10.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:34:55 -0700 (PDT)
Message-ID: <0a563e8d6e380e8f89956abc8b17090432a142b5.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Justin Stitt <justinstitt@google.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Fri, 15 Sep 2023 13:34:53 -0400
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-v1-1-dc3b3719fcb4@google.com>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-v1-1-dc3b3719fcb4@google.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/nvif: refactor deprecated strncpy
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push this and your other patches in just a moment

On Thu, 2023-09-14 at 21:30 +0000, Justin Stitt wrote:
> `strncpy` is deprecated and as such we should prefer more robust and
> less ambiguous string interfaces.
>=20
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees NUL-termination on the destination buffer whilst also
> maintaining the NUL-padding behavior that `strncpy` provides. I am not
> sure whether NUL-padding is strictly needed but I see in
> `nvif_object_ctor()` args is memcpy'd elsewhere so I figured we'd keep
> the same functionality.
>=20
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strn=
cpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
> ---
>  drivers/gpu/drm/nouveau/nvif/client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouv=
eau/nvif/client.c
> index a3264a0e933a..3a27245f467f 100644
> --- a/drivers/gpu/drm/nouveau/nvif/client.c
> +++ b/drivers/gpu/drm/nouveau/nvif/client.c
> @@ -69,7 +69,7 @@ nvif_client_ctor(struct nvif_client *parent, const char=
 *name, u64 device,
>  =09} nop =3D {};
>  =09int ret;
> =20
> -=09strncpy(args.name, name, sizeof(args.name));
> +=09strscpy_pad(args.name, name, sizeof(args.name));
>  =09ret =3D nvif_object_ctor(parent !=3D client ? &parent->object : NULL,
>  =09=09=09       name ? name : "nvifClient", 0,
>  =09=09=09       NVIF_CLASS_CLIENT, &args, sizeof(args),
>=20
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvif-client-c-82b023c=
36953
>=20
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

