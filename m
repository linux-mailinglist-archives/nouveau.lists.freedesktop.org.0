Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F64B1B0C8
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 11:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCC910E632;
	Tue,  5 Aug 2025 09:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a4GygZ++";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D9310E635
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754385376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOXJ0l1oyVJ7d2CaE8Nzq9ax/9ZzYtU7ziWstjFONDo=;
 b=a4GygZ++OZf4rURFd0UePXISnKhmLT2fXD/AKCnyRk5dJM1LfykFDxkNlo7EgZ/T+UoK6d
 U/G57mVeaAcS4lGC8qiF9igtn3Pk1HvHQuou/mw/n9xzU4m4D3GmogGuX8VLbBbjTmffph
 eRoUlMQtQ2aKcid8sEd7WL2Bv8dqZaQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-YlTP_daCOPCNstmgT3K7Ow-1; Tue, 05 Aug 2025 05:16:12 -0400
X-MC-Unique: YlTP_daCOPCNstmgT3K7Ow-1
X-Mimecast-MFC-AGG-ID: YlTP_daCOPCNstmgT3K7Ow_1754385371
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-459e0f54c88so4099775e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 05 Aug 2025 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754385371; x=1754990171;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1mMNUopLHd4FF/6Wq/sWgjQ/0t6kpGK8wiGV6xzDPU=;
 b=St6b3rQrKaLz3ZgWyosX//EpPur9pxhHCANP8WhiKIpVH8flGJ5593gZnLlqXon6fB
 OpSrQx4Y62DC4JZqxCA5AMZfvNEbW5vKTzr0hH/Zc0xNYDdD/4zawRp00gZd3EFdovTk
 bmpiZ0daQ7e5ygvyGwdoQc7OXw69Z4STEoPnXmXvbiTfsj/LjoCl5zadyYt6TUvd6G19
 FyO+umU4W0T+4IyLAJkdSMHa0izOJCiUoQxvZ6Pths6RZOMwMvTc8ez4ixuWmn7TyPPi
 IMrbU3hoORW+He3AWkK+JnUP+Djues8x0dZboD+CwB5y3kWA+uglrxU4BxZG3IO0X9Mv
 0neA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3hBqzbc3ZmSBtgieGl3J3a18xZQrbAGrDbvH5tMK5AV9L/lJhis/TTZfSqZk7wz9F8hNgjRVw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCO7/7c1VUnzK8cf5OP0GogEtVlKgdNHocsHnX6GJyI9oV9HCL
 hie82Ds3CigH/z79QDEfhNY45YsEtFl1Pniaoxhj2Yp+7j2TgFb5gBBbJtlSHYLpsMBvCjcAMq7
 lgvfugpNyWvde5BJklRNf5XXOHCguQkhUfuFBKhnroBKgP5xs7auTItaPbFeNfg85Kyy7YNGC9f
 s=
X-Gm-Gg: ASbGncsKJknbCIsukO8VvXrVWAAnIDbFdKg0GKlG6dZABe8F8IrwGsj2gFqmmjedy6M
 MK0XG0WhoNnFcBGbVXq5aUGXjlq4Hi6yIktqH1umeEFthCBGfTxnoSVTsCvW4btn5FGY8Vn5PD+
 pTvLKHqc+0SHZIsGhyQjc4Hlzdn9XGtwgjQ02ecuD0dk1RgMeOt80IJE2ntd/gnF3YWR2WRIVm9
 QWxx0+KYJ6F0l6sTdrlkenzP5xDwEd3y0Es0/KAjZLbFMBkTZYf9yCwkagYfrW40J/OUo4MTvlm
 J3/pZZHJwQyIHzbQZl0p1E594mlnrAusaDh6e5zqZNSLxbFZrYtoBl5LXupeYWWWLRn03dfmk/W
 EwyaMma3UFRs=
X-Received: by 2002:a05:600c:1e27:b0:459:e002:8b1e with SMTP id
 5b1f17b1804b1-459e0d0a8dfmr22378425e9.13.1754385371216; 
 Tue, 05 Aug 2025 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeq9UeXT2TQ7XkpDietfHt1zBwSAMYvLzbbOHC7UsuY66UegALSutX9e1rsCUKC+wOvcLz2A==
X-Received: by 2002:a05:600c:1e27:b0:459:e002:8b1e with SMTP id
 5b1f17b1804b1-459e0d0a8dfmr22378175e9.13.1754385370778; 
 Tue, 05 Aug 2025 02:16:10 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d90:a700:522d:5615:dfb:4451?
 ([2001:16b8:3d90:a700:522d:5615:dfb:4451])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee5790dsm196310565e9.27.2025.08.05.02.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:16:09 -0700 (PDT)
Message-ID: <ac616b700cac2a93b5011ea5928994ab1ddc53a3.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used
 during acpi init
From: Philipp Stanner <pstanner@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>
Date: Tue, 05 Aug 2025 11:16:08 +0200
In-Reply-To: <20250617040036.2932-1-bskeggs@nvidia.com>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PpmOhTxAFSc-YZGjT5GBgypG0digFhAOjctKyqDAhto_1754385371
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
> Also add checks to ensure the allocations succeeded in the first place.
>=20
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-R=
M")
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>

Tested-by: Philipp Stanner <phasta@kernel.org>


This

Closes: https://www.spinics.net/lists/nouveau/msg16319.html



P.

> ---
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 20 +++++++++++++---=
---
> =C2=A01 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driv=
ers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index baf42339f93e..b098a7555fde 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> @@ -719,7 +719,6 @@ r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_DA=
TA *caps)
> =C2=A0=09union acpi_object argv4 =3D {
> =C2=A0=09=09.buffer.type=C2=A0=C2=A0=C2=A0 =3D ACPI_TYPE_BUFFER,
> =C2=A0=09=09.buffer.length=C2=A0 =3D 4,
> -=09=09.buffer.pointer =3D kmalloc(argv4.buffer.length, GFP_KERNEL),
> =C2=A0=09}, *obj;
> =C2=A0
> =C2=A0=09caps->status =3D 0xffff;
> @@ -727,17 +726,22 @@ r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_=
DATA *caps)
> =C2=A0=09if (!acpi_check_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV, BIT_UL=
L(0x1a)))
> =C2=A0=09=09return;
> =C2=A0
> +=09argv4.buffer.pointer =3D kmalloc(argv4.buffer.length, GFP_KERNEL);
> +=09if (!argv4.buffer.pointer)
> +=09=09return;
> +
> =C2=A0=09obj =3D acpi_evaluate_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV, =
0x1a, &argv4);
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
> @@ -754,24 +758,28 @@ r535_gsp_acpi_jt(acpi_handle handle, JT_METHOD_DATA=
 *jt)
> =C2=A0=09union acpi_object argv4 =3D {
> =C2=A0=09=09.buffer.type=C2=A0=C2=A0=C2=A0 =3D ACPI_TYPE_BUFFER,
> =C2=A0=09=09.buffer.length=C2=A0 =3D sizeof(caps),
> -=09=09.buffer.pointer =3D kmalloc(argv4.buffer.length, GFP_KERNEL),
> =C2=A0=09}, *obj;
> =C2=A0
> =C2=A0=09jt->status =3D 0xffff;
> =C2=A0
> +=09argv4.buffer.pointer =3D kmalloc(argv4.buffer.length, GFP_KERNEL);
> +=09if (!argv4.buffer.pointer)
> +=09=09return;
> +
> =C2=A0=09obj =3D acpi_evaluate_dsm(handle, &JT_DSM_GUID, JT_DSM_REV, 0x1,=
 &argv4);
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
> =C2=A0=09ACPI_FREE(obj);
> =C2=A0
> =C2=A0=09kfree(argv4.buffer.pointer);

