Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190CAFAE95
	for <lists+nouveau@lfdr.de>; Mon,  7 Jul 2025 10:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CA210E30E;
	Mon,  7 Jul 2025 08:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GBepD2+g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB32410E30D
 for <nouveau@lists.freedesktop.org>; Mon,  7 Jul 2025 08:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751876876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESvAe8oWj30vyWroBqMNmeYFFa5VQCJv7ROCq9/ASDI=;
 b=GBepD2+gR+1CFBiOO9w1/agniKZTDJG8aBRmZDnMnZcuIYs5wDoRyfKGzYJTw1jDT83J/M
 8+H6/TEx5vzdgXvmHMMsEHMehmMYQFjGsBC92ThzMre5n7CJSzT2p5syEEJ4sT7ZDwKIfy
 0Sba4Gi2IouvjsDPNWDbYd1Ciu2J93Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-W18KM8poOVCy7S2mNTJKGw-1; Mon, 07 Jul 2025 04:27:55 -0400
X-MC-Unique: W18KM8poOVCy7S2mNTJKGw-1
X-Mimecast-MFC-AGG-ID: W18KM8poOVCy7S2mNTJKGw_1751876874
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4eee2398bso1126592f8f.1
 for <nouveau@lists.freedesktop.org>; Mon, 07 Jul 2025 01:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751876874; x=1752481674;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X+lFXIgCoTl+t7yll0eR237aWbiTBBs7cQwvsThIGBE=;
 b=eITaaPaoShKwiQmkLIcPpVF8QL9vsSGpXVmu7jjsJKlRTCdVrvEBqfo0FNL2dJx22U
 xngQfqSh1ZEcASHKobb0jvW7IWqcUFfCLPPfTO2Y5k5qyKNxl6j/Ch3wzBGs50RZRzfr
 0gDoNo5X61G/ErI1Vapfa13fezLmtzrnOkt8qSpymt72yFiUEN0PGR1nWSu+n7B1/C1N
 V4NaYfRRoiPT1u39D9OuLxYlQyBZcJjc627k408ZG0iGhESKC3Y/7qoFr0tHZeha4FHV
 4JWerqUNDqFfXEqIcetOwc90aVP8XH11GBw2t5ApkGwPBfXmlY5Yho4l/HQnTYZkl/kD
 A+kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7pxpEr6QmHoPWw9GLM5vdLSrk+hQiPloodk3wbdGImXSsA6HpgUamNgf+6QA6pVsGl4TcZsor@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1RJvNdZ+2UMz53qC4ySQNmlfHMj1Z4SB0n52uy49aLETZWIoX
 3F+6ZFY+UlaW0KB2D/AfPhXE4th7YROBuyCKRnNbJsXJEVu4WNFDzG7tWlMQ6BuFKP+a8jqDBLP
 oSIWrNoxi6GFUcSmTbg5RzmfMEzAR5vDRlSMEz6ENiRmvKaXY4uQgWuPT0L2LrU6WNxg=
X-Gm-Gg: ASbGncs2brlJUDw3tmIvjrDbwKj5X4LNM1EY8gDi9kTeuNBbw0kBpTLS82HGwpl6fwY
 B5Mzax463g1mfI5LH0NmaZGxNpWKUH1/+jLT7sjS1txDQErVF88gCQtYOrdztcD9E6xwP3aif0V
 NncKkbxN1BrDXPbMxNjdgG6eNrQQlFezWxtkwzNxkQlDvHO+KhlibjKB9qjezoi5fAD643ZRIAk
 nphHrXhHxLgRrJpFK+w3oFRLygaNmmTzvQbDrRQdL9c/vqaO7eZ54unk+VxW+uBTSq+HIvUAFuy
 s9HDJbVRjozk1UhcXebu2LQB4Tgzr+bnjX65Mkh0EXjckNhm
X-Received: by 2002:a05:6000:1aca:b0:3a5:2575:6b45 with SMTP id
 ffacd0b85a97d-3b49aa839a4mr6015303f8f.48.1751876873787; 
 Mon, 07 Jul 2025 01:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiqx0m9J6rfuvNWr9TghZRB0e9895j+E2Fgl/ZDMZ4PX0g3byzRMDxMCl2IPfH1lW8ZE63Fw==
X-Received: by 2002:a05:6000:1aca:b0:3a5:2575:6b45 with SMTP id
 ffacd0b85a97d-3b49aa839a4mr6015277f8f.48.1751876873095; 
 Mon, 07 Jul 2025 01:27:53 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b49cb46c61sm5475021f8f.63.2025.07.07.01.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 01:27:52 -0700 (PDT)
Message-ID: <45f6e8886b8ddab4aeebf0eab9d07e5ddf7a6704.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/gsp: fix potential leak of memory used
 during acpi init
From: Philipp Stanner <pstanner@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Cc: Danilo Krummrich <dakr@kernel.org>
Date: Mon, 07 Jul 2025 10:27:51 +0200
In-Reply-To: <20250617040036.2932-1-bskeggs@nvidia.com>
References: <20250617040036.2932-1-bskeggs@nvidia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8m-HHGYE-5aFPtun1BI4W_YYY-NRa7ALnE26ejF4vtk_1751876874
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

If you've got a kmemleak trace, it would also be good to put it here in
the commit message so that we can distinguish this bug from potential
other leaks.


P.


>=20
> Reported-by: Danilo Krummrich <dakr@kernel.org>
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting
> GSP-RM")
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
> =C2=A0=09ACPI_FREE(obj);
> =C2=A0
> =C2=A0=09kfree(argv4.buffer.pointer);

