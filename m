Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2912692BFA9
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 18:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D404F10E5EE;
	Tue,  9 Jul 2024 16:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J6WD+Rc2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D25C10E5EE
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720542172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zPMOH0+NKvhCayFobQjbFBZhm6BMp57A684zyAeRymU=;
 b=J6WD+Rc21UhPEzk1WZPDtpPe04wOJPJL188uz16qNh9SQiCH3QXikg9+iR1QUXiemuW44G
 yjSOh9WQdd7eA4ZpNp/G+AigtEOHFlcfhv5+sjdr3qim110C6epczD08BZcrTrntrP0t8H
 D/7wzaCA7d28eXyELNcyZXcIkP4Tu4k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-Gqs1hbekM8WmPCfuiK16YA-1; Tue, 09 Jul 2024 12:22:51 -0400
X-MC-Unique: Gqs1hbekM8WmPCfuiK16YA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-426703ac88dso8266205e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 09:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720542169; x=1721146969;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPMOH0+NKvhCayFobQjbFBZhm6BMp57A684zyAeRymU=;
 b=xOh0DbmEzkecYyM/YbtZMt1od+Sfrbqwf0ZCZ4Tb66ltCyZhfwEVInKMiMDcKLb0nZ
 UjyVDqGlQJpasKKZnn+W3CEPJ8e2RVUycvxlME2QbVG0lkggrCbdnlKJvXx9yIifbU1O
 vC8YCFPntkSYlALnXkUby0ZIHuqrxOg0O+CK5//86h/Tu6cnA3GEATcO2A1caeB8xHc0
 6FpqD+42b1SFz0ofKE0g6Qz7vtw3Vdqv7ma959O9X0z47LoZJjCROHmprb2DvzMH+3Ux
 s85p+Itq+p8UGD6423L8+4bIXgft3VJlyZ3Z0LXSHl/lIyyjftN3CVYNSvneV0dxE5rv
 KOMg==
X-Gm-Message-State: AOJu0YyriYnw6rfAGFanxQqthug7dEeeZMqRzK+TyzW21taG9d7CFxt+
 f6cKGMnNJPmPQMPiePPS3iHH5TfWPkuR+73MYR9w1i72IA7PwlrthU3k3BBlw8oByvOhTil+nP2
 cWaTqRoMQJ5btudLBcCjsa1aNX75zBb+zFPiahUC3RLbROQhcasjrG1qkH1NrZYEjK3kR+Cc=
X-Received: by 2002:a05:600c:2d43:b0:426:5fcc:deb0 with SMTP id
 5b1f17b1804b1-426707e38bemr21691485e9.24.1720542168792; 
 Tue, 09 Jul 2024 09:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwiUanNkXwXQXlocw1JpUwXLwSZezgrhzU3h7Rd1qo/Qtk5Ca/wd++cBj7WxFz1wpaw+ttCQ==
X-Received: by 2002:a05:600c:2d43:b0:426:5fcc:deb0 with SMTP id
 5b1f17b1804b1-426707e38bemr21691335e9.24.1720542168353; 
 Tue, 09 Jul 2024 09:22:48 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fc9b3sm214481655e9.46.2024.07.09.09.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:22:48 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:22:46 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 25/37] drm/nouveau/nvif: remove device rd/wr
Message-ID: <Zo1j1pgulLoXrCWq@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-26-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-26-bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Jul 05, 2024 at 04:37:09AM +1000, Ben Skeggs wrote:
> The device is always mapped now, so these are unneeded.

Instead of saying "now", please mention the change that makes this possible.

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  .../drm/nouveau/include/nvkm/core/object.h    |  8 ---
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 10 ----
>  drivers/gpu/drm/nouveau/nvkm/core/object.c    | 32 -----------
>  drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 28 ----------
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c | 54 -------------------
>  5 files changed, 132 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
> index d4f1c964ba31..c91abac44bd6 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
> @@ -33,11 +33,7 @@ struct nvkm_object_func {
>  	int (*map)(struct nvkm_object *, void *argv, u32 argc,
>  		   enum nvkm_object_map *, u64 *addr, u64 *size);
>  	int (*unmap)(struct nvkm_object *);
> -	int (*rd08)(struct nvkm_object *, u64 addr, u8 *data);
> -	int (*rd16)(struct nvkm_object *, u64 addr, u16 *data);
>  	int (*rd32)(struct nvkm_object *, u64 addr, u32 *data);
> -	int (*wr08)(struct nvkm_object *, u64 addr, u8 data);
> -	int (*wr16)(struct nvkm_object *, u64 addr, u16 data);
>  	int (*wr32)(struct nvkm_object *, u64 addr, u32 data);
>  	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
>  		    struct nvkm_gpuobj **);
> @@ -61,11 +57,7 @@ int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **);
>  int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
>  		    enum nvkm_object_map *, u64 *addr, u64 *size);
>  int nvkm_object_unmap(struct nvkm_object *);
> -int nvkm_object_rd08(struct nvkm_object *, u64 addr, u8  *data);
> -int nvkm_object_rd16(struct nvkm_object *, u64 addr, u16 *data);
>  int nvkm_object_rd32(struct nvkm_object *, u64 addr, u32 *data);
> -int nvkm_object_wr08(struct nvkm_object *, u64 addr, u8   data);
> -int nvkm_object_wr16(struct nvkm_object *, u64 addr, u16  data);
>  int nvkm_object_wr32(struct nvkm_object *, u64 addr, u32  data);
>  int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
>  		     struct nvkm_gpuobj **);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> index 584fc43c0d75..95e9537e1d7c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> @@ -206,14 +206,6 @@ nvkm_ioctl_rd(struct nvkm_client *client,
>  		nvif_ioctl(object, "rd vers %d size %d addr %016llx\n",
>  			   args->v0.version, args->v0.size, args->v0.addr);
>  		switch (args->v0.size) {
> -		case 1:
> -			ret = nvkm_object_rd08(object, args->v0.addr, &v.b08);
> -			args->v0.data = v.b08;
> -			break;
> -		case 2:
> -			ret = nvkm_object_rd16(object, args->v0.addr, &v.b16);
> -			args->v0.data = v.b16;
> -			break;
>  		case 4:
>  			ret = nvkm_object_rd32(object, args->v0.addr, &v.b32);
>  			args->v0.data = v.b32;
> @@ -246,8 +238,6 @@ nvkm_ioctl_wr(struct nvkm_client *client,
>  		return ret;
>  
>  	switch (args->v0.size) {
> -	case 1: return nvkm_object_wr08(object, args->v0.addr, args->v0.data);
> -	case 2: return nvkm_object_wr16(object, args->v0.addr, args->v0.data);
>  	case 4: return nvkm_object_wr32(object, args->v0.addr, args->v0.data);
>  	default:
>  		break;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
> index 580b8c7f25af..913c3bae51f7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
> @@ -132,22 +132,6 @@ nvkm_object_unmap(struct nvkm_object *object)
>  	return -ENODEV;
>  }
>  
> -int
> -nvkm_object_rd08(struct nvkm_object *object, u64 addr, u8 *data)
> -{
> -	if (likely(object->func->rd08))
> -		return object->func->rd08(object, addr, data);
> -	return -ENODEV;
> -}
> -
> -int
> -nvkm_object_rd16(struct nvkm_object *object, u64 addr, u16 *data)
> -{
> -	if (likely(object->func->rd16))
> -		return object->func->rd16(object, addr, data);
> -	return -ENODEV;
> -}
> -
>  int
>  nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
>  {
> @@ -156,22 +140,6 @@ nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
>  	return -ENODEV;
>  }
>  
> -int
> -nvkm_object_wr08(struct nvkm_object *object, u64 addr, u8 data)
> -{
> -	if (likely(object->func->wr08))
> -		return object->func->wr08(object, addr, data);
> -	return -ENODEV;
> -}
> -
> -int
> -nvkm_object_wr16(struct nvkm_object *object, u64 addr, u16 data)
> -{
> -	if (likely(object->func->wr16))
> -		return object->func->wr16(object, addr, data);
> -	return -ENODEV;
> -}
> -
>  int
>  nvkm_object_wr32(struct nvkm_object *object, u64 addr, u32 data)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
> index 3385528da650..afc10ec256a7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
> @@ -55,36 +55,12 @@ nvkm_oproxy_unmap(struct nvkm_object *object)
>  	return nvkm_object_unmap(oproxy->object);
>  }
>  
> -static int
> -nvkm_oproxy_rd08(struct nvkm_object *object, u64 addr, u8 *data)
> -{
> -	return nvkm_object_rd08(nvkm_oproxy(object)->object, addr, data);
> -}
> -
> -static int
> -nvkm_oproxy_rd16(struct nvkm_object *object, u64 addr, u16 *data)
> -{
> -	return nvkm_object_rd16(nvkm_oproxy(object)->object, addr, data);
> -}
> -
>  static int
>  nvkm_oproxy_rd32(struct nvkm_object *object, u64 addr, u32 *data)
>  {
>  	return nvkm_object_rd32(nvkm_oproxy(object)->object, addr, data);
>  }
>  
> -static int
> -nvkm_oproxy_wr08(struct nvkm_object *object, u64 addr, u8 data)
> -{
> -	return nvkm_object_wr08(nvkm_oproxy(object)->object, addr, data);
> -}
> -
> -static int
> -nvkm_oproxy_wr16(struct nvkm_object *object, u64 addr, u16 data)
> -{
> -	return nvkm_object_wr16(nvkm_oproxy(object)->object, addr, data);
> -}
> -
>  static int
>  nvkm_oproxy_wr32(struct nvkm_object *object, u64 addr, u32 data)
>  {
> @@ -197,11 +173,7 @@ nvkm_oproxy_func = {
>  	.ntfy = nvkm_oproxy_ntfy,
>  	.map = nvkm_oproxy_map,
>  	.unmap = nvkm_oproxy_unmap,
> -	.rd08 = nvkm_oproxy_rd08,
> -	.rd16 = nvkm_oproxy_rd16,
>  	.rd32 = nvkm_oproxy_rd32,
> -	.wr08 = nvkm_oproxy_wr08,
> -	.wr16 = nvkm_oproxy_wr16,
>  	.wr32 = nvkm_oproxy_wr32,
>  	.bind = nvkm_oproxy_bind,
>  	.sclass = nvkm_oproxy_sclass,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> index 65bd6712bce2..d7f75b3a43c8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> @@ -202,54 +202,6 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
>  	return -EINVAL;
>  }
>  
> -static int
> -nvkm_udevice_rd08(struct nvkm_object *object, u64 addr, u8 *data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	*data = nvkm_rd08(udev->device, addr);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_rd16(struct nvkm_object *object, u64 addr, u16 *data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	*data = nvkm_rd16(udev->device, addr);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_rd32(struct nvkm_object *object, u64 addr, u32 *data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	*data = nvkm_rd32(udev->device, addr);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_wr08(struct nvkm_object *object, u64 addr, u8 data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	nvkm_wr08(udev->device, addr, data);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_wr16(struct nvkm_object *object, u64 addr, u16 data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	nvkm_wr16(udev->device, addr, data);
> -	return 0;
> -}
> -
> -static int
> -nvkm_udevice_wr32(struct nvkm_object *object, u64 addr, u32 data)
> -{
> -	struct nvkm_udevice *udev = nvkm_udevice(object);
> -	nvkm_wr32(udev->device, addr, data);
> -	return 0;
> -}
> -
>  static int
>  nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
>  		 enum nvkm_object_map *type, u64 *addr, u64 *size)
> @@ -362,12 +314,6 @@ nvkm_udevice = {
>  	.fini = nvkm_udevice_fini,
>  	.mthd = nvkm_udevice_mthd,
>  	.map = nvkm_udevice_map,
> -	.rd08 = nvkm_udevice_rd08,
> -	.rd16 = nvkm_udevice_rd16,
> -	.rd32 = nvkm_udevice_rd32,
> -	.wr08 = nvkm_udevice_wr08,
> -	.wr16 = nvkm_udevice_wr16,
> -	.wr32 = nvkm_udevice_wr32,
>  	.sclass = nvkm_udevice_child_get,
>  };
>  
> -- 
> 2.45.1
> 

