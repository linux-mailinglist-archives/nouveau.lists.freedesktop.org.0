Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE66870ABA
	for <lists+nouveau@lfdr.de>; Mon,  4 Mar 2024 20:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210341124F9;
	Mon,  4 Mar 2024 19:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AWQVQeuL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7AB1124FA
 for <nouveau@lists.freedesktop.org>; Mon,  4 Mar 2024 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709580667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6FNR4YzM7yfjXalU/HSdEgWjkUnK639A4pTfjigPeI=;
 b=AWQVQeuLAFVT0byoAN1OejdRjBO8yn3tn6S7TZQDMKeEvj1GdtWwbIUaEYXjN1AKcL6IFw
 3qgcpCSEc6aiYLdb7InZZsbRZBZ3wpvijd1PjBgbwBoFB3Gjnjoz7rj82vTiyDw95eUUDf
 j1x6rux/ymEoZgA6hJ9HS1enn1eXpmg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-7p-4sk9ANAOTgk9ODtfnbA-1; Mon, 04 Mar 2024 14:31:05 -0500
X-MC-Unique: 7p-4sk9ANAOTgk9ODtfnbA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-787dea68f58so578187585a.3
 for <nouveau@lists.freedesktop.org>; Mon, 04 Mar 2024 11:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709580665; x=1710185465;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=89WGEOoyMRT4MR7NoSbobr3LI1BSvbvCbPDFIgj4TQo=;
 b=fvbryeOBY9oxf+uVJM9LuwDlj842IetNe/KyClmcdm41k9nL0mYtzAGthCq7c7B1ZM
 1yauZLhU8CPFA44W3ol3ULWz+Xff5AsfV42+4UnrMa8QYuLI+QyTUg3tBYObIhxAkfM7
 koD2fZI6zwBTIkQ6CuFKyII6MR17/4+Ok556VpTXQM0KS6v3nGS8mtu37Ndo//sX3aEr
 4cEJXkLi4WCdVPDjrQ6mmeA9Bd0z76bKxgL0orXKw0zPEWdRFT1rBZvzsdFNN1WMcHpG
 ZIhoexucMz87c0rxCT7NTtCWblowiLBHAAKw4wjSx0VnDdVbCz3p3fRBOxZ4/YerSgsl
 TR8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf26VPfhYnRBw3KUCAlxiOMnjZR4QQrVm/axgJ4s0SuPW9zfBuJANiPnENlszggPSbq9WlYX5y4YnKTq6AJsrLuqaTHlOsmBbDpUZgqw==
X-Gm-Message-State: AOJu0YxW0926jzkl9rySpr7zEfZIKv9aIxV9FQEPInebCTEDq3ARXo07
 E6J/VXI9FhuhbqBoOJYEUmJC5/xb2YtMhF65UVPvXeQKrjq13ILrFZkfIDMutNg/TfcerhQOys3
 fQYf4dwacAJPestubiRoieWk2erJAUl/eSs5SycaqguGcsaQFZ6E2xjqGuGjQhKk=
X-Received: by 2002:a05:620a:60e4:b0:788:260f:79e with SMTP id
 dy36-20020a05620a60e400b00788260f079emr4307575qkb.46.1709580664990; 
 Mon, 04 Mar 2024 11:31:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF5Tl1gweMqc9KYYc21k+yK8+83zyrSM20gKwKNxphb4CWZHLr1Vey/1x03LZhKciw95R+8A==
X-Received: by 2002:a05:620a:60e4:b0:788:260f:79e with SMTP id
 dy36-20020a05620a60e400b00788260f079emr4307562qkb.46.1709580664688; 
 Mon, 04 Mar 2024 11:31:04 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 qs16-20020a05620a395000b007881f9c0397sm2198739qkn.60.2024.03.04.11.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:31:04 -0800 (PST)
Message-ID: <7aedbb9f48b50b0f823ef7d622161905e41e76ec.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: move more missing UAPI bits
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Mon, 04 Mar 2024 14:31:03 -0500
In-Reply-To: <20240304183157.1587152-2-kherbst@redhat.com>
References: <20240304183157.1587152-1-kherbst@redhat.com>
 <20240304183157.1587152-2-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2024-03-04 at 19:31 +0100, Karol Herbst wrote:
> Those are already de-facto UAPI, so let's just move it into the uapi
> header.
>=20
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 20 +++++++++++++++-----
>  drivers/gpu/drm/nouveau/nouveau_abi16.h | 12 ------------
>  include/uapi/drm/nouveau_drm.h          | 22 ++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/no=
uveau/nouveau_abi16.c
> index cd14f993bdd1b..92f9127b284ac 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -312,11 +312,21 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>  =09if (device->info.family >=3D NV_DEVICE_INFO_V0_KEPLER) {
>  =09=09if (init->fb_ctxdma_handle =3D=3D ~0) {
>  =09=09=09switch (init->tt_ctxdma_handle) {
> -=09=09=09case 0x01: engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_GR    ; br=
eak;
> -=09=09=09case 0x02: engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC; br=
eak;
> -=09=09=09case 0x04: engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP ; br=
eak;
> -=09=09=09case 0x08: engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD ; br=
eak;
> -=09=09=09case 0x30: engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_CE    ; br=
eak;
> +=09=09=09case NOUVEAU_FIFO_ENGINE_GR:
> +=09=09=09=09engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
> +=09=09=09=09break;
> +=09=09=09case NOUVEAU_FIFO_ENGINE_VP:
> +=09=09=09=09engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC;
> +=09=09=09=09break;
> +=09=09=09case NOUVEAU_FIFO_ENGINE_PPP:
> +=09=09=09=09engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP;
> +=09=09=09=09break;
> +=09=09=09case NOUVEAU_FIFO_ENGINE_BSP:
> +=09=09=09=09engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD;
> +=09=09=09=09break;
> +=09=09=09case NOUVEAU_FIFO_ENGINE_CE:
> +=09=09=09=09engine =3D NV_DEVICE_HOST_RUNLIST_ENGINES_CE;
> +=09=09=09=09break;
>  =09=09=09default:
>  =09=09=09=09return nouveau_abi16_put(abi16, -ENOSYS);
>  =09=09=09}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/no=
uveau/nouveau_abi16.h
> index 11c8c4a80079b..661b901d8ecc9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -50,18 +50,6 @@ struct drm_nouveau_grobj_alloc {
>  =09int      class;
>  };
> =20
> -struct drm_nouveau_notifierobj_alloc {
> -=09uint32_t channel;
> -=09uint32_t handle;
> -=09uint32_t size;
> -=09uint32_t offset;
> -};
> -
> -struct drm_nouveau_gpuobj_free {
> -=09int      channel;
> -=09uint32_t handle;
> -};
> -
>  struct drm_nouveau_setparam {
>  =09uint64_t param;
>  =09uint64_t value;
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_dr=
m.h
> index 77d7ff0d5b110..5404d4cfff4c2 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -73,6 +73,16 @@ struct drm_nouveau_getparam {
>  =09__u64 value;
>  };
> =20
> +/*
> + * Those are used to support selecting the main engine used on Kepler.
> + * This goes into drm_nouveau_channel_alloc::tt_ctxdma_handle
> + */
> +#define NOUVEAU_FIFO_ENGINE_GR  0x01
> +#define NOUVEAU_FIFO_ENGINE_VP  0x02
> +#define NOUVEAU_FIFO_ENGINE_PPP 0x04
> +#define NOUVEAU_FIFO_ENGINE_BSP 0x08
> +#define NOUVEAU_FIFO_ENGINE_CE  0x30
> +
>  struct drm_nouveau_channel_alloc {
>  =09__u32     fb_ctxdma_handle;
>  =09__u32     tt_ctxdma_handle;
> @@ -95,6 +105,18 @@ struct drm_nouveau_channel_free {
>  =09__s32 channel;
>  };
> =20
> +struct drm_nouveau_notifierobj_alloc {
> +=09__u32 channel;
> +=09__u32 handle;
> +=09__u32 size;
> +=09__u32 offset;
> +};
> +
> +struct drm_nouveau_gpuobj_free {
> +=09__s32 channel;
> +=09__u32 handle;
> +};
> +
>  #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
>  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

