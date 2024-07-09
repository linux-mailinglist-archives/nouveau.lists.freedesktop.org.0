Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EE92BF7C
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 18:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D040E10E5EC;
	Tue,  9 Jul 2024 16:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZymBEVyi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3710E5EB
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720541785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0EigjiW95SIm/QXHkuw24IKYLooBBWzwLu51wed9Uo=;
 b=ZymBEVyi0BcQdOugOMEpmlsf9GqDZVG7BF6HEyORIbWgziK7mdlVqJm+GWcC9Ns0I6kgGI
 zVumSKHjktQw2n9aVGCvqvPt6Oa91G6TCop1m1UTcXGoBMP9Ivb42IvkUfb5LHlY+KSJS4
 1SKliT8uTlAOtIqLkzgzoUwiZh4N/D4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-ROYUqyPqNMOWk1cDEk6tYA-1; Tue, 09 Jul 2024 12:16:23 -0400
X-MC-Unique: ROYUqyPqNMOWk1cDEk6tYA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4265b751469so18711405e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 09:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720541782; x=1721146582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0EigjiW95SIm/QXHkuw24IKYLooBBWzwLu51wed9Uo=;
 b=sS7R582DsE56pvwdajOqxE2XmlRC4vObj7nfyyID5Vyc8XQUqW015iZE0DwAJ5XBMZ
 7pK0MCqbUwasscGyIpxIlrkJxElKSzj2e2uglFb8OM1TZrxLVyQ5oRWjJdtGFQSvpD4R
 2U3tde5oW+GBBt+3s6bga8J4jjGwm7llxnTo3ebRukVaA7yk/O/5NcFDdC4QUbjZcjUT
 4AKfjl9b+8cVLyMeU6OS/aYyhfiXl4KZ5Suc/7piESXFlyZSAprKweuQ3wyroKKuAnj1
 oRA/xPU8rlIC0Z01YM+R9ta2mr2KrV1aMTT0lRHyYL0naFvRfq1Ke2/gLf8BgXdZmCwP
 FO8w==
X-Gm-Message-State: AOJu0YznEODAYLotkWltSkEMYU/7KjkJ+vrH1u710Vsr01Fb6jjSa2FC
 /OAZevlavlXQLiH9hoxK0PN4Lj1uT8cl5oav9nI/PIgdxc7UykWrCBFi9Pfio+jMRsMyWWGVKG6
 AbzdqbTM6SsfXHjE7oZuidUI/ak4X15TEgbKFbyrCV9FSzlXppBQjoc8C6nmAoVRQN5Z/19A=
X-Received: by 2002:a05:600c:424a:b0:426:6f0e:8ba4 with SMTP id
 5b1f17b1804b1-426722ccc5cmr24695565e9.8.1720541781752; 
 Tue, 09 Jul 2024 09:16:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa4+skZ94XUL92G/hlfA1WHi1qBEbTzUBxu1xeBUgsrUS1/T4idRBaZNlxxbuOy4rlAdPwMg==
X-Received: by 2002:a05:600c:424a:b0:426:6f0e:8ba4 with SMTP id
 5b1f17b1804b1-426722ccc5cmr24695425e9.8.1720541781360; 
 Tue, 09 Jul 2024 09:16:21 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266ac156easm83921305e9.38.2024.07.09.09.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:16:21 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:16:19 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 19/37] drm/nouveau/nvif: remove client device arg
Message-ID: <Zo1iUyGtc75J54fr@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-20-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-20-bskeggs@nvidia.com>
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

On Fri, Jul 05, 2024 at 04:37:03AM +1000, Ben Skeggs wrote:
> This was once used by userspace tools (with nvkm built as a library), as
> a way to select a "default device".
> 
> The DRM code doesn't need this at all as clients only have access to a
> single device already, so the value can be inherited from its parent.

"so inherit the value from its parent."

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/client.h | 3 +--
>  drivers/gpu/drm/nouveau/include/nvif/if0000.h | 1 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 4 +---
>  drivers/gpu/drm/nouveau/nvif/client.c         | 5 ++---
>  drivers/gpu/drm/nouveau/nvif/driver.c         | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/core/client.c    | 2 +-
>  6 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
> index 5210007d7669..2c8e9bec3f79 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/client.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
> @@ -10,8 +10,7 @@ struct nvif_client {
>  	u64 version;
>  };
>  
> -int  nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
> -		      struct nvif_client *);
> +int  nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *);
>  void nvif_client_dtor(struct nvif_client *);
>  int  nvif_client_ioctl(struct nvif_client *, void *, u32);
>  int  nvif_client_suspend(struct nvif_client *);
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0000.h b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
> index f7b8f8f48760..a93f91d56a09 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/if0000.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
> @@ -5,7 +5,6 @@
>  struct nvif_client_v0 {
>  	__u8  version;
>  	__u8  pad01[7];
> -	__u64 device;
>  	char  name[32];
>  };
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index e0e1fcfcab1e..8951a0805239 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -241,7 +241,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  		{ NVIF_CLASS_VMM_NV04 , -1 },
>  		{}
>  	};
> -	u64 device = nouveau_name(drm->dev->dev);
>  	int ret;
>  
>  	snprintf(cli->name, sizeof(cli->name), "%s", sname);
> @@ -254,8 +253,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  
>  	if (cli != &drm->master) {
>  		mutex_lock(&drm->master.lock);
> -		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
> -				       &cli->base);
> +		ret = nvif_client_ctor(&drm->master.base, cli->name, &cli->base);
>  		mutex_unlock(&drm->master.lock);
>  	}
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
> index 85ad5091e8e2..bbfc80fcff43 100644
> --- a/drivers/gpu/drm/nouveau/nvif/client.c
> +++ b/drivers/gpu/drm/nouveau/nvif/client.c
> @@ -55,10 +55,9 @@ nvif_client_dtor(struct nvif_client *client)
>  }
>  
>  int
> -nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
> -		 struct nvif_client *client)
> +nvif_client_ctor(struct nvif_client *parent, const char *name, struct nvif_client *client)
>  {
> -	struct nvif_client_v0 args = { .device = device };
> +	struct nvif_client_v0 args = {};
>  	struct {
>  		struct nvif_ioctl_v0 ioctl;
>  		struct nvif_ioctl_nop_v0 nop;
> diff --git a/drivers/gpu/drm/nouveau/nvif/driver.c b/drivers/gpu/drm/nouveau/nvif/driver.c
> index acb708df2559..78706e97a6a2 100644
> --- a/drivers/gpu/drm/nouveau/nvif/driver.c
> +++ b/drivers/gpu/drm/nouveau/nvif/driver.c
> @@ -36,5 +36,5 @@ nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
>  	if (ret)
>  		return ret;
>  
> -	return nvif_client_ctor(client, name, device, client);
> +	return nvif_client_ctor(client, name, client);
>  }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
> index 95cbb5b682f2..6baa3a4fa0a4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
> @@ -42,7 +42,7 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
>  
>  	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))){
>  		args->v0.name[sizeof(args->v0.name) - 1] = 0;
> -		ret = nvkm_client_new(args->v0.name, args->v0.device, NULL,
> +		ret = nvkm_client_new(args->v0.name, oclass->client->device, NULL,
>  				      NULL, oclass->client->event, &client);
>  		if (ret)
>  			return ret;
> -- 
> 2.45.1
> 

