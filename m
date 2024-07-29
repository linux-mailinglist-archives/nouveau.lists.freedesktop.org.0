Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B992A93F63F
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2024 15:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93F510E3CB;
	Mon, 29 Jul 2024 13:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MIyZ3phj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7612610E3CA
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722258519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VmYHVyxqtgOdGESGhPMUnVohEWLqGLapB3L59puzfyI=;
 b=MIyZ3phjt8UxjgLCa9Q6ELeo5+8pIFEBNNSr57YgbkIlFJiiTI4wDCeSi3mu1QuaXbxvZw
 kxACCWofF3EXv2RsOfM16xz2chxBOJYmtK0N7KsD5HuJEJtkFtOfPP38PFMQz7F0phXbpc
 kWN8u2fEtpaabOAPgOl2tzofI+VSsCE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-un5GgjNBMIyJ30RTYux_xw-1; Mon, 29 Jul 2024 09:08:38 -0400
X-MC-Unique: un5GgjNBMIyJ30RTYux_xw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-36871eb0a8eso1459904f8f.3
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 06:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722258516; x=1722863316;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VmYHVyxqtgOdGESGhPMUnVohEWLqGLapB3L59puzfyI=;
 b=rioJ7T/50WBcp9rS2ytVwdq9QW2cEmeRoT0JY35yUX+rIraO47RdhRCKVMrU7Urvqu
 7lHzyC7xwA6++mXtKAeRJ0ZNOIuYhsjs44ecfkR52Y6nTUKon9blUjOLiqT4U1hg8SHS
 +e2Lrz/XvdCJazgK85vXon9VIIVuyNGJKLjJJu2DPNvKWeT2pJWCHnWo/UJou5Dp2a8a
 cygLKYiP1qJqZtY4uUhcmyGQFPtHqCS5lCbPXyezVcxsDcbKbsQTxWaRFNZ8I8QtKD+X
 sS9a9x8Uq/Pc2ja/cM8Z1V6DxdhJ8jiXygCnjj10GJcz1wTGtsnEpUYB4ZN4m4mFiy0a
 VKsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuLxgsRsnXLz0/LlkDhkyAhQuRX89RVKDcifVf5GvHriytmGIWHDSiZk0DTZ9C6nR9g+MWFG9DCkXZ2MbTb/4bwpWwRDB16NzBm+ysJw==
X-Gm-Message-State: AOJu0YzMtLC/qUHVm16qAqIpnHg8qGr8dZMAuVyVfeFEBO9OhimOempy
 J9nCHFI3jtRRKbXdADAoDYir71KTWeJojjLl6EghIqaVd6T095hgbDY/rSHsfi9zIDB6fRu/VkY
 niu8JAWRx5P/OFnHd4sk+G4LG+KfqTvcpZw8y2kvk9z0gOP2gSMu4q0XFamZUNfo=
X-Received: by 2002:a05:6000:1f8f:b0:367:f054:7a94 with SMTP id
 ffacd0b85a97d-36b5d0b0a01mr6478736f8f.5.1722258516222; 
 Mon, 29 Jul 2024 06:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExynfP4xB7u3Ac+dxPudSP8v5SSxemv8gaxnyetlJ167at1Trpy6ZAtolKOYQPLT2lVLmwPA==
X-Received: by 2002:a05:6000:1f8f:b0:367:f054:7a94 with SMTP id
 ffacd0b85a97d-36b5d0b0a01mr6478716f8f.5.1722258515880; 
 Mon, 29 Jul 2024 06:08:35 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281a26e1bcsm53496355e9.34.2024.07.29.06.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 06:08:35 -0700 (PDT)
Date: Mon, 29 Jul 2024 15:08:33 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: remove unused variable ret
Message-ID: <ZqeUUea0pL7vKKPr@pollux>
References: <20240729123624.868907-1-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20240729123624.868907-1-jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi Jani,

On Mon, Jul 29, 2024 at 03:36:24PM +0300, Jani Nikula wrote:
> Fix build with CONFIG_NOUVEAU_PLATFORM_DRIVER enabled:
> 
> ../drivers/gpu/drm/nouveau/nouveau_platform.c: In function ‘nouveau_platform_probe’:
> ../drivers/gpu/drm/nouveau/nouveau_platform.c:29:13: error: unused variable ‘ret’ [-Werror=unused-variable]
>    29 |         int ret;
>       |             ^~~
> 
> Fixes: 961ae5f9807b ("drm/nouveau: handle pci/tegra drm_dev_{alloc, register} from common code")
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thanks for fixing this, applied to drm-misc-next.

> 
> ---
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_platform.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
> index 3194b110eff8..829fdc6e4031 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
> @@ -26,7 +26,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
>  	const struct nvkm_device_tegra_func *func;
>  	struct nvkm_device *device = NULL;
>  	struct drm_device *drm;
> -	int ret;
>  
>  	func = of_device_get_match_data(&pdev->dev);
>  
> -- 
> 2.39.2
> 

