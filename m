Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45992BF8D
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 18:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016FA10E18A;
	Tue,  9 Jul 2024 16:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MUPxoF1g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E010E18A
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720541944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AWztCvx/TaQGzTuX2Zbi6is9IsdMGYnYTmZkTexZHVw=;
 b=MUPxoF1g0HtNkAR8wHR+WAmQbZV8x5XWcyuZ/gO9bgCne8W2rnIEYi3NDPh2LWpNjh0OVv
 wHyFmBlu7O1puIl9D4lF12RbI+vatBfzUPURj+iKEJrMiahszx0Z6LXwiJJTUeG5bLaoen
 TLy24t8e7f1R3v/n9SXk1snlxpAi53s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-9URzShrvPsWnWyQWRSeW1w-1; Tue, 09 Jul 2024 12:19:02 -0400
X-MC-Unique: 9URzShrvPsWnWyQWRSeW1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-426679bc120so18010115e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 09:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720541941; x=1721146741;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWztCvx/TaQGzTuX2Zbi6is9IsdMGYnYTmZkTexZHVw=;
 b=eR75ZnEbQvwc2G06Sk6oL54TvKDRl3JgwYUeSi8zQMIlTScZVdbpwovIU9qKPAoPCZ
 hW8p+PWVl99Do1/UJVxfCkx6laQUz8s0Va5A7HAGzA3o/qWOptTsVORiPKEhmW8KSiFJ
 tt0rgzlxpToUrGKS74SuKs2tH1gaODVrziD3zovW43nK11BNHedLeSpe/i4ulCCOOsov
 QM++oAZPv30zp42dx3jrTgi8DvU9pKFVQUnI9u9vN6GGsqtrvfmqGfiuFrS2HHJNvAPv
 fjSd5QC2vxPz0UQsXdGz4niOf6ekQLmbJ45032jO2K1boXeJP9lVygM+wo3Vlys9nxZO
 PPsQ==
X-Gm-Message-State: AOJu0YwfgebxI+43NLJkEQVflVtzCHoKlZ4uoe7oBwvX9NyGU+o9V22h
 e8yKDmfl/pXUB5J9Pg/aOP4EbeV+iz9lhS/AviLu2TOyg7/FvJbuSO1FWTFx3fhS5U2/lUzleRg
 wkLUcGZqHiNBwELf2JY+fkcyLv9x0iFmcksbxlLSghfG9iaYHfA7V+3PH05nSheA=
X-Received: by 2002:a7b:c394:0:b0:426:5f0a:c8b4 with SMTP id
 5b1f17b1804b1-426708f1040mr18282565e9.33.1720541940973; 
 Tue, 09 Jul 2024 09:19:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHiNEkKIWsWqQWeN866h1Dfa7eYsONB3em+al79QNKDAFDs7A+DtHbAhGg7iLvNVbreH6CqA==
X-Received: by 2002:a7b:c394:0:b0:426:5f0a:c8b4 with SMTP id
 5b1f17b1804b1-426708f1040mr18282445e9.33.1720541940517; 
 Tue, 09 Jul 2024 09:19:00 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f68e0edsm48428045e9.0.2024.07.09.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:19:00 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:18:58 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 23/37] drm/nouveau/nvif: remove device args
Message-ID: <Zo1i8tw00OaFlfg4@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-24-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-24-bskeggs@nvidia.com>
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

On Fri, Jul 05, 2024 at 04:37:07AM +1000, Ben Skeggs wrote:
> These were once used by used by userspace tools (with nvkm built as a
> library), to access multiple GPUs from a single nvif_client.
> 
> The DRM code just uses the driver's default device, so we can remove
> the arguments.

"so remove the argument."

Sorry for repeating that, I somehow missed the point to say "here and for
subsequent commits".

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  7 ----
>  drivers/gpu/drm/nouveau/include/nvif/device.h |  3 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  7 +---
>  drivers/gpu/drm/nouveau/nvif/device.c         |  9 +++--
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c | 36 ++-----------------
>  5 files changed, 9 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
> index fa161b74d967..ea937fa7bc55 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
> @@ -2,13 +2,6 @@
>  #ifndef __NVIF_CL0080_H__
>  #define __NVIF_CL0080_H__
>  
> -struct nv_device_v0 {
> -	__u8  version;
> -	__u8  priv;
> -	__u8  pad02[6];
> -	__u64 device;	/* device identifier, ~0 for client default */
> -};
> -
>  #define NV_DEVICE_V0_INFO                                                  0x00
>  #define NV_DEVICE_V0_TIME                                                  0x01
>  
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
> index b0e59800a320..f7c1b3a43c84 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/device.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
> @@ -18,8 +18,7 @@ struct nvif_device {
>  	struct nvif_user user;
>  };
>  
> -int  nvif_device_ctor(struct nvif_object *, const char *name, u32 handle,
> -		      s32 oclass, void *, u32, struct nvif_device *);
> +int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device *);
>  void nvif_device_dtor(struct nvif_device *);
>  u64  nvif_device_time(struct nvif_device *);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 8951a0805239..0beeff8552a2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -261,12 +261,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  		goto done;
>  	}
>  
> -	ret = nvif_device_ctor(&cli->base.object, "drmDevice", 0, NV_DEVICE,
> -			       &(struct nv_device_v0) {
> -					.device = ~0,
> -					.priv = true,
> -			       }, sizeof(struct nv_device_v0),
> -			       &cli->device);
> +	ret = nvif_device_ctor(&cli->base, "drmDevice", &cli->device);
>  	if (ret) {
>  		NV_PRINTK(err, cli, "Device allocation failed: %d\n", ret);
>  		goto done;
> diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
> index 8c3d883f3313..b14bccb9a93f 100644
> --- a/drivers/gpu/drm/nouveau/nvif/device.c
> +++ b/drivers/gpu/drm/nouveau/nvif/device.c
> @@ -21,8 +21,8 @@
>   *
>   * Authors: Ben Skeggs <bskeggs@redhat.com>
>   */
> -
>  #include <nvif/device.h>
> +#include <nvif/client.h>
>  
>  u64
>  nvif_device_time(struct nvif_device *device)
> @@ -48,11 +48,10 @@ nvif_device_dtor(struct nvif_device *device)
>  }
>  
>  int
> -nvif_device_ctor(struct nvif_object *parent, const char *name, u32 handle,
> -		 s32 oclass, void *data, u32 size, struct nvif_device *device)
> +nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_device *device)
>  {
> -	int ret = nvif_object_ctor(parent, name ? name : "nvifDevice", handle,
> -				   oclass, data, size, &device->object);
> +	int ret = nvif_object_ctor(&client->object, name ? name : "nvifDevice", 0,
> +				   0x0080, NULL, 0, &device->object);
>  	device->runlist = NULL;
>  	device->user.func = NULL;
>  	if (ret == 0) {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> index d937c54e8dfa..65bd6712bce2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
> @@ -357,7 +357,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
>  }
>  
>  static const struct nvkm_object_func
> -nvkm_udevice_super = {
> +nvkm_udevice = {
>  	.init = nvkm_udevice_init,
>  	.fini = nvkm_udevice_fini,
>  	.mthd = nvkm_udevice_mthd,
> @@ -371,50 +371,20 @@ nvkm_udevice_super = {
>  	.sclass = nvkm_udevice_child_get,
>  };
>  
> -static const struct nvkm_object_func
> -nvkm_udevice = {
> -	.init = nvkm_udevice_init,
> -	.fini = nvkm_udevice_fini,
> -	.mthd = nvkm_udevice_mthd,
> -	.sclass = nvkm_udevice_child_get,
> -};
> -
>  static int
>  nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
>  		 struct nvkm_object **pobject)
>  {
> -	union {
> -		struct nv_device_v0 v0;
> -	} *args = data;
>  	struct nvkm_client *client = oclass->client;
> -	struct nvkm_object *parent = &client->object;
> -	const struct nvkm_object_func *func;
>  	struct nvkm_udevice *udev;
> -	int ret = -ENOSYS;
> -
> -	nvif_ioctl(parent, "create device size %d\n", size);
> -	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
> -		nvif_ioctl(parent, "create device v%d device %016llx\n",
> -			   args->v0.version, args->v0.device);
> -	} else
> -		return ret;
> -
> -	/* give priviledged clients register access */
> -	if (args->v0.priv)
> -		func = &nvkm_udevice_super;
> -	else
> -		func = &nvkm_udevice;
>  
>  	if (!(udev = kzalloc(sizeof(*udev), GFP_KERNEL)))
>  		return -ENOMEM;
> -	nvkm_object_ctor(func, oclass, &udev->object);
> +	nvkm_object_ctor(&nvkm_udevice, oclass, &udev->object);
>  	*pobject = &udev->object;
>  
>  	/* find the device that matches what the client requested */
> -	if (args->v0.device != ~0)
> -		udev->device = nvkm_device_find(args->v0.device);
> -	else
> -		udev->device = nvkm_device_find(client->device);
> +	udev->device = nvkm_device_find(client->device);
>  	if (!udev->device)
>  		return -ENODEV;
>  
> -- 
> 2.45.1
> 

