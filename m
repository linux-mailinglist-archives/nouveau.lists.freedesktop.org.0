Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A692BE87
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 17:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C2210E5DD;
	Tue,  9 Jul 2024 15:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ItXn4n5q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDD410E5DD
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720539372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOzKOqZqhRLSlTz57aVs6YwBrFQwkQOB0uqxRMl+U9E=;
 b=ItXn4n5qKj4TqA6RKtf+kYDPoeKCCwUEotnFTvAQEE2nkEaxUBCvLVaQbpLJ/AN16HxmcW
 T6Vrw5Me8wdGFL2lsEw8E6SNBxPPyHs/715Z4pJ+xat99rC8kGgP+C8hODajz53arQmMiL
 xjWdg80vjUN+q5vnx59dZxC46321tSE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634--6CaLJ1fNIa7nc5uGEUOuQ-1; Tue, 09 Jul 2024 11:36:11 -0400
X-MC-Unique: -6CaLJ1fNIa7nc5uGEUOuQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3678f403afaso3094455f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 08:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720539370; x=1721144170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOzKOqZqhRLSlTz57aVs6YwBrFQwkQOB0uqxRMl+U9E=;
 b=VHIB+tu/JZ+Tg4iGvsGTlkCs2etOMGOyl//+2x0X1YOIQhb/z2Fnqid79bNdWEXY9c
 40Eze2a97SAsgeQX6JDkZT7f7qBnB3TNT08UqZzA+baXMJFX5oK28kWocnpBl7fHexI1
 nokbcJgob/0kVoroviLavtOAYyy9ZQCewiTwNwxiIh2759/aGgrkTJGJOHVFwipXe19m
 gsim8ehqnPh9EsLPMjzWbv2AL7u/tuNGf0n06DaXmMrTxAlwHefYhxEcJTt594mlUDUN
 67GqIeBVago3hAJQCvJQbL4vVnvKNbdHKnIt9LTBn9IrjbDZBicIe1+jTvG/la0pEJ26
 ncig==
X-Gm-Message-State: AOJu0YxwRb4q/Stj3mnnFQMDdByBFiq/vfuJySPrlwcmff6kvQSuvDhh
 MMeyFK4+BEizhoDRZBqLGHcaxgM7jad5kfxKY7i4Zie5Xangb+1JaUGBU9vhGpPShGkZWolnW4v
 G/xYtsyZXArePkkhI7b8itplV2r+YI/QAOxuIpYsGz6aGQ49UJVGQkmyAhxlFZqc=
X-Received: by 2002:a5d:6a51:0:b0:367:88c1:6bad with SMTP id
 ffacd0b85a97d-367cead8f70mr1911534f8f.58.1720539370358; 
 Tue, 09 Jul 2024 08:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnEvDTdqoCG2gIMh95ESs3EYuMGox38fSwtT6Z/izsAg3tOcZGL3fhZ3dFXvA3OPeVhGnqw==
X-Received: by 2002:a5d:6a51:0:b0:367:88c1:6bad with SMTP id
 ffacd0b85a97d-367cead8f70mr1911520f8f.58.1720539369963; 
 Tue, 09 Jul 2024 08:36:09 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89133sm2906675f8f.54.2024.07.09.08.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:36:09 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:36:07 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 07/37] drm/nouveau: add nouveau_cli to nouveau_abi16
Message-ID: <Zo1Y52zhttYzPRXj@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-8-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-8-bskeggs@nvidia.com>
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

On Fri, Jul 05, 2024 at 04:36:51AM +1000, Ben Skeggs wrote:
> Removes some dubious void casts.

Please use the imperative form:

"Store a pointer to struct nouveau_cli in struct nouveau_abi16 to avoid some
dubious void casts."

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 9 +++++----
>  drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index d56909071de6..ac50c300d2eb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -50,6 +50,7 @@ nouveau_abi16(struct drm_file *file_priv)
>  				.device = ~0ULL,
>  			};
>  
> +			abi16->cli = cli;
>  			INIT_LIST_HEAD(&abi16->channels);
>  
>  			/* allocate device object targeting client's default
> @@ -82,7 +83,7 @@ nouveau_abi16_get(struct drm_file *file_priv)
>  int
>  nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
>  {
> -	struct nouveau_cli *cli = (void *)abi16->device.object.client;
> +	struct nouveau_cli *cli = abi16->cli;
>  	mutex_unlock(&cli->mutex);
>  	return ret;
>  }
> @@ -164,7 +165,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
>  void
>  nouveau_abi16_fini(struct nouveau_abi16 *abi16)
>  {
> -	struct nouveau_cli *cli = (void *)abi16->device.object.client;
> +	struct nouveau_cli *cli = abi16->cli;
>  	struct nouveau_abi16_chan *chan, *temp;
>  
>  	/* cleanup channels */
> @@ -529,7 +530,7 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
>  
>  	if (init->handle == ~0)
>  		return nouveau_abi16_put(abi16, -EINVAL);
> -	client = abi16->device.object.client;
> +	client = &abi16->cli->base;
>  
>  	chan = nouveau_abi16_chan(abi16, init->channel);
>  	if (!chan)
> @@ -623,7 +624,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
>  	/* completely unnecessary for these chipsets... */
>  	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
>  		return nouveau_abi16_put(abi16, -EINVAL);
> -	client = abi16->device.object.client;
> +	client = &abi16->cli->base;
>  
>  	chan = nouveau_abi16_chan(abi16, info->channel);
>  	if (!chan)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> index 661b901d8ecc..0a9121e63143 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -30,6 +30,7 @@ struct nouveau_abi16_chan {
>  };
>  
>  struct nouveau_abi16 {
> +	struct nouveau_cli *cli;
>  	struct nvif_device device;
>  	struct list_head channels;
>  	u64 handles;
> -- 
> 2.45.1
> 

