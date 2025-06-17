Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D90BADC959
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 13:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E19A10E4B0;
	Tue, 17 Jun 2025 11:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dF6Mh6bj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4301C10E4B0
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750159765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8rE4331/KepqlmtqwM+jbVwljYrhL2Gq/BKlAyEuOPs=;
 b=dF6Mh6bjcZOmAEICVBzUSFK1pUQQMSXl9HLnq1ND8txFHnbJ3K+G6JEq+RZ8BgPwlWiw/z
 7n7gOUyNP1NDZQHBM1gKVgL8gDY2DiftW6jP2srnIGAQbmxBcQavwdwyQdAmjhqZimWPrl
 ERMsXyiZd/nksVlEbK4eEBziIOB1Nyc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-vS_XNgX7NLGLbSpS8zb__w-1; Tue, 17 Jun 2025 07:29:23 -0400
X-MC-Unique: vS_XNgX7NLGLbSpS8zb__w-1
X-Mimecast-MFC-AGG-ID: vS_XNgX7NLGLbSpS8zb__w_1750159763
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450cb8f8b1bso11509435e9.3
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 04:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750159762; x=1750764562;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ogOOffzfQsQJBvxf0RtX7PXy7wow+G0MKv8raj1mnuk=;
 b=Xddl0CejTSNZsBXUKzVpgvaLZB0FC9csALlv6U2Swew+23Dbu3vs0ap4shz+jWV/b3
 hSF0FCB7KxH8vDX7I2MCq+mqOv2loP9pv671LbbqZJZR7K0Nnf7Qs9ACPzj4pzWV7ruW
 m47v8d6EmO7bGBEo2Rjjn41CjlNg+vz4xoGGuKjXEqNF5yx8U5/Gy15qS6l5fODe5jBg
 NOwEwNJB7EQ4TDmtyJ/Jg9FnjtJeI9K46zL27nTU0AlG07Tv+ES4PhJLrPLjOdHI3XRZ
 +XOegXKWFgM8Cil5+XUL7KCPR1Sd0rjUHXrMOh/26kl2P1GHEHiEzEj2B5bY0TtQNbtH
 9jTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Wag9k2zE4GUe1gYCVFEXvUQJO2/x+W1EB8eLULqwEWgPoqqlsXa7VH2n76JEnUJseNzBH1z8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKqWxjTYD+R6tN6bNEWwS0gXGEDrs+6BOevMSITFa+pHYvE3pa
 1SgkJjrgq+dQAtyBEHTeuPLH/ScyGDaISrsDKZyzhyGZ/1Y1eUkPFKUEefUhNJJK7y7lVqSNaXy
 gVkGboFwXltPBzsUR8o/ZSaDRxmrNiYo44+3cRweCdzkF+OiHwnk7KOFEXC5r1nL0O7Y=
X-Gm-Gg: ASbGncu0XRmyfkyPWM+sldJ4oTYA/+UAnVvk6ZuOO1PkqsOJNK3saXRf5NtmOjkS3IJ
 vdsjYd69xZDwZshCDrTO0aIggBf0KEYAyVmqSgLyO4a0ZcFfjLviuHBWG8queDsVRpd1U9BpAxf
 zirMIPZ4LatUKl9fsrV7YMG5zBh3adUDZ/ocb/IIvQ4x2GbiZly9Y+MN0FdNPK9vbpiZmf4Kcwq
 jvsLpIIGzOv4FDG0SZYwmTz5lvUvn/FdkEFQcVH0UnmYnQI+3GrhWBbzDMvitxedG73SzPCYpYt
 yLhTcQVv8WuPFnwLzCx3NwSXNo95V43PGnyj80+Nu5yLp1TGwOC+vQi8IVuZowiokzI3Wdvhbbf
 bVKpRSvCKgN4CiNz2G5KxJ/Xv9WJV3jIwoRqvC5DcrF2fKCRVRP/hYDiX
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id
 5b1f17b1804b1-4533cb53b27mr115095705e9.29.1750159762590; 
 Tue, 17 Jun 2025 04:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfgShK5ShL1qqbZgNp5XI4uUxDYtF1DWrIFdg9YVwLKMye/YOd0uIAqXzLUbfznmnNBgQqSg==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id
 5b1f17b1804b1-4533cb53b27mr115095375e9.29.1750159762215; 
 Tue, 17 Jun 2025 04:29:22 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2dec:5600:9b3c:c190:70eb:f68e?
 (200116b82dec56009b3cc19070ebf68e.dip.versatel-1u1.de.
 [2001:16b8:2dec:5600:9b3c:c190:70eb:f68e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b087b4sm14017064f8f.51.2025.06.17.04.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jun 2025 04:29:21 -0700 (PDT)
Message-ID: <f09b10e30f38cc094c4070e318d41262c0118f31.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used
 during acpi init
From: Philipp Stanner <pstanner@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>
Date: Tue, 17 Jun 2025 13:29:20 +0200
In-Reply-To: <20250617040036.2932-1-bskeggs@nvidia.com>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: glkDGnbiwCvXdmN9Pfl2hjk4LsPKfyUfOw6fqO-1TZU_1750159763
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, 2025-06-17 at 14:00 +1000, Ben Skeggs wrote:
> If any of the ACPI calls fail, memory allocated for the input buffer
> would be leaked.=C2=A0 Fix failure paths to free allocated memory.
>=20
> Also add checks to ensure the allocations succeeded in the first
> place.
>=20
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting
> GSP-RM")

Needs to +Cc the stable kernel

But, see below


> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 20 +++++++++++++---=
-
> --
> =C2=A01 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index baf42339f93e..b098a7555fde 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c

This seems to be based on a code move that is not yet in mainline.

Therefore, backporting the bugfix to stable seems difficult. Since that
code move is already in drm-misc-next, it would seem that it can only
be solved with two distinct patches for stable and for -next.

But this needs to be judged by a maintainer.

> @@ -719,7 +719,6 @@ r535_gsp_acpi_caps(acpi_handle handle,
> CAPS_METHOD_DATA *caps)
> =C2=A0=09union acpi_object argv4 =3D {
> =C2=A0=09=09.buffer.type=C2=A0=C2=A0=C2=A0 =3D ACPI_TYPE_BUFFER,
> =C2=A0=09=09.buffer.length=C2=A0 =3D 4,
> -=09=09.buffer.pointer =3D kmalloc(argv4.buffer.length,
> GFP_KERNEL),
> =C2=A0=09}, *obj;
> =C2=A0
> =C2=A0=09caps->status =3D 0xffff;
> @@ -727,17 +726,22 @@ r535_gsp_acpi_caps(acpi_handle handle,
> CAPS_METHOD_DATA *caps)
> =C2=A0=09if (!acpi_check_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV,
> BIT_ULL(0x1a)))
> =C2=A0=09=09return;
> =C2=A0
> +=09argv4.buffer.pointer =3D kmalloc(argv4.buffer.length,
> GFP_KERNEL);
> +=09if (!argv4.buffer.pointer)
> +=09=09return;
> +

This could be done immediately after the creation of argv4. That way
it's more difficult to have the leak again if something is inserted
later on.

> =C2=A0=09obj =3D acpi_evaluate_dsm(handle, &NVOP_DSM_GUID,
> NVOP_DSM_REV, 0x1a, &argv4);
> =C2=A0=09if (!obj)
> -=09=09return;
> +=09=09goto done;
> =C2=A0
> =C2=A0=09if (WARN_ON(obj->type !=3D ACPI_TYPE_BUFFER) ||
> =C2=A0=09=C2=A0=C2=A0=C2=A0 WARN_ON(obj->buffer.length !=3D 4))
> -=09=09return;
> +=09=09goto done;
> =C2=A0
> =C2=A0=09caps->status =3D 0;
> =C2=A0=09caps->optimusCaps =3D *(u32 *)obj->buffer.pointer;
> =C2=A0
> +done:
> =C2=A0=09ACPI_FREE(obj);
> =C2=A0
> =C2=A0=09kfree(argv4.buffer.pointer);
> @@ -754,24 +758,28 @@ r535_gsp_acpi_jt(acpi_handle handle,
> JT_METHOD_DATA *jt)
> =C2=A0=09union acpi_object argv4 =3D {
> =C2=A0=09=09.buffer.type=C2=A0=C2=A0=C2=A0 =3D ACPI_TYPE_BUFFER,
> =C2=A0=09=09.buffer.length=C2=A0 =3D sizeof(caps),
> -=09=09.buffer.pointer =3D kmalloc(argv4.buffer.length,
> GFP_KERNEL),
> =C2=A0=09}, *obj;
> =C2=A0
> =C2=A0=09jt->status =3D 0xffff;
> =C2=A0
> +=09argv4.buffer.pointer =3D kmalloc(argv4.buffer.length,
> GFP_KERNEL);
> +=09if (!argv4.buffer.pointer)
> +=09=09return;
> +
> =C2=A0=09obj =3D acpi_evaluate_dsm(handle, &JT_DSM_GUID, JT_DSM_REV,
> 0x1, &argv4);
> =C2=A0=09if (!obj)
> -=09=09return;
> +=09=09goto done;
> =C2=A0
> =C2=A0=09if (WARN_ON(obj->type !=3D ACPI_TYPE_BUFFER) ||
> =C2=A0=09=C2=A0=C2=A0=C2=A0 WARN_ON(obj->buffer.length !=3D 4))
> -=09=09return;
> +=09=09goto done;
> =C2=A0
> =C2=A0=09jt->status =3D 0;
> =C2=A0=09jt->jtCaps =3D *(u32 *)obj->buffer.pointer;
> =C2=A0=09jt->jtRevId =3D (jt->jtCaps & 0xfff00000) >> 20;
> =C2=A0=09jt->bSBIOSCaps =3D 0;
> =C2=A0
> +done:

'done' seems like a bad name considering that the operations are
aborted with a WARN_ON above. Better 'abort' or sth like that.


P.

> =C2=A0=09ACPI_FREE(obj);
> =C2=A0
> =C2=A0=09kfree(argv4.buffer.pointer);

