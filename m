Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D08FAF98
	for <lists+nouveau@lfdr.de>; Tue,  4 Jun 2024 12:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BFC10E359;
	Tue,  4 Jun 2024 10:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XVcYSQip";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B9610E359
 for <nouveau@lists.freedesktop.org>; Tue,  4 Jun 2024 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717495909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zXc7Xuywbp0GOgab5UNFDGxnA/A6NFjL1N2D7zTX/w=;
 b=XVcYSQipxpPSFQhZ2djnsRI6m689KTFG/N0sBSVPWDdjspJLUqW74gUjXHxWH+hzUaqX6M
 kK64SEM67pxmq5H9VK/PZuwGQYo6gyLfYCTdVXNlzQISpTcIWaNJ4AY/j/ZVDIafPduEgb
 96Gc3w0/Rj1xJrcyVuJLCoPz60WSfk0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-byfNNtzwOi2VWY7fw1ihjA-1; Tue, 04 Jun 2024 06:11:48 -0400
X-MC-Unique: byfNNtzwOi2VWY7fw1ihjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42138d5d766so7527545e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 04 Jun 2024 03:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717495907; x=1718100707;
 h=content-transfer-encoding:in-reply-to:organization:from:cc
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6zXc7Xuywbp0GOgab5UNFDGxnA/A6NFjL1N2D7zTX/w=;
 b=urh657soOLJaNmqzglVrc9ONt6np+XKMs5k71okN1al/MI1m1vs/+aGVynrV6rAm56
 js/cAN8k43IrKwQWd+mH5yrQS8GVMC4GhLFjpT8oJcK8959w5m2txBZanaa1+NEVjq8W
 ahtuNxQGAgedJoWxJ51mnIPu/I7wSIfSwvwSYwZMFsIJRzVtcUmeKQGncFgQTh9FHwRQ
 ZUSdQDC74llXIdwtGvnpXyaRGAeEhMcq9JZyQHehH64ZXFxm5ue8n09/mj9NQ1pilciu
 x8siox+HGAps5OHIEGo5YCCuT5kNLiQFUXYbehHUrFZwvtqfn0iluI2c6zDT7CyUlAmF
 0MlQ==
X-Gm-Message-State: AOJu0YwfdeR0qReCgsFEHvSIGJUYL+qObwwpkiobDIC0JurTygLMvyD2
 zVvOwPK2dpPivqIGyknBTmWC8Cr5ZP9zxGKTjl1rs40WWx2gBeQ8qER238qFDjxBQ7YRAuRU+Ci
 J0XjNSAVuY3joYk3gsRiYlJfhZzwObFWI+P/ffpRItKnLoiCfakwEUKcDykURfX8=
X-Received: by 2002:adf:fc4e:0:b0:354:f82c:78b0 with SMTP id
 ffacd0b85a97d-35e0f35be56mr7021397f8f.70.1717495907516; 
 Tue, 04 Jun 2024 03:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrotA0MQwqoC0UVsRP5TbnHbeFgXQjwlK0IqOh3O57vFMsUCM5nwxkpYAKb+5iSnaabPnwxA==
X-Received: by 2002:adf:fc4e:0:b0:354:f82c:78b0 with SMTP id
 ffacd0b85a97d-35e0f35be56mr7021384f8f.70.1717495907080; 
 Tue, 04 Jun 2024 03:11:47 -0700 (PDT)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064afd8sm11014740f8f.95.2024.06.04.03.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 03:11:46 -0700 (PDT)
Message-ID: <1ca96b14-1a18-4e6d-bbd2-954538aaa48b@redhat.com>
Date: Tue, 4 Jun 2024 12:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/34] drm/nouveau: create pci device once
To: Ben Skeggs <bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
 <20240527141959.59193-2-bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240527141959.59193-2-bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/27/24 16:19, Ben Skeggs wrote:
> HW isn't touched anymore (aside from detection) until the first
> nvif_device has been allocated, so we no longer need a separate
> probe-only step before kicking efifb (etc) off the HW.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a58c31089613..c37798b507ea 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -803,23 +803,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>   	/* We need to check that the chipset is supported before booting
>   	 * fbdev off the hardware, as there's no way to put it back.
>   	 */
> -	ret = nvkm_device_pci_new(pdev, nouveau_config, "error",
> -				  true, false, 0, &device);
> +	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
> +				  true, true, ~0ULL, &device);

Looks like we don't need the 'detect' and 'mmio' arguments (anymore),
can we remove them?

>   	if (ret)
>   		return ret;
>   
> -	nvkm_device_del(&device);
> -
>   	/* Remove conflicting drivers (vesafb, efifb etc). */
>   	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
>   	if (ret)
>   		return ret;
>   
> -	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
> -				  true, true, ~0ULL, &device);
> -	if (ret)
> -		return ret;
> -
>   	pci_set_master(pdev);
>   
>   	if (nouveau_atomic)

