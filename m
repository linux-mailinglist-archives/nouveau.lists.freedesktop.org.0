Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE95A858519
	for <lists+nouveau@lfdr.de>; Fri, 16 Feb 2024 19:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BD810EB07;
	Fri, 16 Feb 2024 18:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GjfbCtA9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E4F10EC56
 for <nouveau@lists.freedesktop.org>; Fri, 16 Feb 2024 18:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708108055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pAxnKiY0v6Unt1MeteP4zhCiQHYAe7S4qrGIbBvNAI=;
 b=GjfbCtA9flktVchGPdcx621/wFUrJgrVIpkMD1GAuGJ46Y8H4IbJV2uUja6OxBifaEJZgT
 aXiGvkObZFD+OH2T0ZsvQ8se0HxT7ZgW14zsBEy0hGnigjuSKbcumFP2NNL/8RBt+qcA7D
 Pz7aSdfffXqUykA57zmYJP7j9zCACRc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-4U8ddAWYOumleb5G8eDufA-1; Fri, 16 Feb 2024 13:27:33 -0500
X-MC-Unique: 4U8ddAWYOumleb5G8eDufA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-563d66e8b79so747516a12.3
 for <nouveau@lists.freedesktop.org>; Fri, 16 Feb 2024 10:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708108052; x=1708712852;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3pAxnKiY0v6Unt1MeteP4zhCiQHYAe7S4qrGIbBvNAI=;
 b=E5GmDxNsNQEQXrK7fH6UofgZfZ1Wd63fb9G/GvODgrfkNGhYwlr6r6MUsjSvEkUPau
 t2PKnwafQpe5RldqBVF6GfpRwU6qPDNyWQ2cBpZFxFDlvukhuHVYKAv4z5nipxdqWSsG
 3GaO2mkYQHy9dU6HbMptukXGrnD2xITng3vfcyJGcOzwCtWuyvri+3cqC/TY05j5lkFY
 K2iyc4op0igkQJvcv6bssWFXMwxXd8N4smL6IwwSbJqoDOertsc6b6P783moK2wepVC3
 XAkNU7E7wKjTvm1vTBDWncKjQT/K0eKgk4Fc+a7bxZKWSwWl97d3Ls72iUVxaY0Iy1zr
 Rzzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkmHa8HLllDo+WM160fa8oT/XJAASfy8zRVVw8+9GNeEuNAl/YSZo0EfLHyQ1xHvekaM/WcXqR8ERvtkxpKqNduWjXy9nndLXxXSo/yw==
X-Gm-Message-State: AOJu0Yw4set1+F/lVlWo8exB5pOAQod4ilQz6WDsq/56VMb9ZSd0i2R4
 W11+RaV/3/WpLnj3SSuAwnRs+X7gXykJoV1JNauFQwp/EBXpZY1MjP78AHY0JnWPuCXY/XriHLz
 Edm6ZPno5l9sWxoaomRDNzCKpQrBTIV/JLAX8OR+/G014nFmrtsvABoUFg7P8Rq0=
X-Received: by 2002:aa7:de0e:0:b0:564:7b9:8c18 with SMTP id
 h14-20020aa7de0e000000b0056407b98c18mr1164596edv.22.1708108052537; 
 Fri, 16 Feb 2024 10:27:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc7HnCrb8Q59cHQe9Z/g3oIfkHjAxB+9md3uAcAJ23mrUVRozwXdVXewL5xF6l4JirE/riHw==
X-Received: by 2002:aa7:de0e:0:b0:564:7b9:8c18 with SMTP id
 h14-20020aa7de0e000000b0056407b98c18mr1164581edv.22.1708108052264; 
 Fri, 16 Feb 2024 10:27:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056402501b00b00562d908daf4sm224163eda.84.2024.02.16.10.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 10:27:31 -0800 (PST)
Message-ID: <9d9fcdeb-4d0c-4371-b871-ad1fb8055033@redhat.com>
Date: Fri, 16 Feb 2024 19:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: fix function cast warnings
To: Arnd Bergmann <arnd@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20240213095753.455062-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240213095753.455062-1-arnd@kernel.org>
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

On 2/13/24 10:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-16 warns about casting between incompatible function types:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c:161:10: error: cast from 'void (*)(const struct firmware *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    161 |         .fini = (void(*)(void *))release_firmware,
> 
> This one was done to use the generic shadow_fw_release() function as a
> callback for struct nvbios_source. Change it to use the same prototype
> as the other five instances, with a trivial helper function that actually
> calls release_firmware.
> 
> Fixes: 70c0f263cc2e ("drm/nouveau/bios: pull in basic vbios subdev, more to come later")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> index 19188683c8fc..8c2bf1c16f2a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> @@ -154,11 +154,17 @@ shadow_fw_init(struct nvkm_bios *bios, const char *name)
>   	return (void *)fw;
>   }
>   
> +static void
> +shadow_fw_release(void *fw)
> +{
> +	release_firmware(fw);
> +}
> +
>   static const struct nvbios_source
>   shadow_fw = {
>   	.name = "firmware",
>   	.init = shadow_fw_init,
> -	.fini = (void(*)(void *))release_firmware,
> +	.fini = shadow_fw_release,
>   	.read = shadow_fw_read,
>   	.rw = false,
>   };

