Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0717A24DA
	for <lists+nouveau@lfdr.de>; Fri, 15 Sep 2023 19:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5236610E65B;
	Fri, 15 Sep 2023 17:33:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4507F10E65A
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 17:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694799217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPAyXhOaA41zZ3tS5JgFFk5Y6a/39udK996Avz6gN9M=;
 b=LXPpJfhREYtTkeTSxmfRX0/7dBo+n99JQnVRQlB8a1QJTFSY5IE5B321/IloWXBc6X86E7
 ZRWnz8uSb+vMQXeHzPkfRF9NBJX2K/3fpX5VR1DGmBJfdKd5t8eWwQBt3mtO2g+/FsHK7y
 oUhBs/qzFIzz6ndObJu7CYsEgcuV4LM=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-dckRNXNsPRCBc2zJ6ram7A-1; Fri, 15 Sep 2023 13:33:34 -0400
X-MC-Unique: dckRNXNsPRCBc2zJ6ram7A-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-44d62a76b01so1091294137.3
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 10:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694799213; x=1695404013;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlpIc4DwS1d7tWoYWtATBVAp1YG/9Jib85DcTdMBUWQ=;
 b=p41N8cYrFiHvzXXu3CVehD2C2Yy6tTSaNto1Kgq0ysvc+b9kUNT7GfHxSGttNYdDu2
 q6ZzMDJnRAag4eYUjEwn09SwJCOIHHXRThkaw6c1wj9ebtAE1zi+tSWNwdy/z9p8plm1
 xfbsuvQOuyK2epJA60z4H2/TjbuIoqn2i8HlZOkwLZmlabHuJ1EmGHugICy2Mogr/o2n
 wMkBqxYL6bWOQH5uhAw2T5Y27Tr1udlK5IV021qfQLgJmxYkyO5l2dUNMiHBZagzoFHv
 o4osJj+SNI0s2yUicN7sSQP82mPIANLqFNh+KBOzgUq6UgAXcL3ZzvhDQ461+f4xU16E
 svUg==
X-Gm-Message-State: AOJu0YxZWg3qUFKQG9U99anwOfAnIphZpqp21gxazpuhg/VTD5Ij3dj2
 khOdh8zxAq0baj3Ru4sriR4Wagmt8SScEJkMpXLC01GhimkM7vgMHi68hKCBi71F9oPo0t7n2CY
 t+7/Lqg0CnKLxlbPoVy0pGBowXA==
X-Received: by 2002:a05:6102:445:b0:44e:b11a:8b16 with SMTP id
 e5-20020a056102044500b0044eb11a8b16mr2136897vsq.13.1694799213549; 
 Fri, 15 Sep 2023 10:33:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxMg9innJnBPyO40JOwexxh/opPl5r7RbWdfIe2XJJW9pyDk9tqNYJKPoYihmT01Z0kPQWww==
X-Received: by 2002:a05:6102:445:b0:44e:b11a:8b16 with SMTP id
 e5-20020a056102044500b0044eb11a8b16mr2136872vsq.13.1694799213203; 
 Fri, 15 Sep 2023 10:33:33 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a0ccc13000000b0064f91d410b9sm1409818qvk.128.2023.09.15.10.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 10:33:32 -0700 (PDT)
Message-ID: <00fba033910961bac96dabe9d7e0435342fd021d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Justin Stitt <justinstitt@google.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Fri, 15 Sep 2023 13:33:32 -0400
In-Reply-To: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-v1-1-3aeae46c032f@google.com>
References: <20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-v1-1-3aeae46c032f@google.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/core: refactor deprecated strncpy
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

Eek, I didn't realize how many instances of this we had. Thanks for doing t=
his
:)

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2023-09-14 at 21:40 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1]=
.
>=20
> We should prefer more robust and less ambiguous string interfaces.
>=20
> A suitable replacement is `strscpy` [2] due to the fact that it guarantee=
s
> NUL-termination on the destination buffer without unnecessarily NUL-paddi=
ng.
>=20
> There is likely no bug in the current implementation due to the safeguard=
:
> > =09cname[sizeof(cname) - 1] =3D '\0';
> ... however we can provide simpler and easier to understand code using
> the newer (and recommended) `strscpy` api.
>=20
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strn=
cpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.h=
tml [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/d=
rm/nouveau/nvkm/core/firmware.c
> index 91fb494d4009..374212da9e95 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> @@ -79,8 +79,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, con=
st char *fwname, int ver,
>  =09int i;
> =20
>  =09/* Convert device name to lowercase */
> -=09strncpy(cname, device->chip->name, sizeof(cname));
> -=09cname[sizeof(cname) - 1] =3D '\0';
> +=09strscpy(cname, device->chip->name, sizeof(cname));
>  =09i =3D strlen(cname);
>  =09while (i) {
>  =09=09--i;
>=20
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-gpu-drm-nouveau-nvkm-core-firmware-c-=
791223838b72
>=20
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

