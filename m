Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A743089A2A7
	for <lists+nouveau@lfdr.de>; Fri,  5 Apr 2024 18:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560D910ED30;
	Fri,  5 Apr 2024 16:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZwPihPv9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D916910E2BF
 for <nouveau@lists.freedesktop.org>; Fri,  5 Apr 2024 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712335084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkF4QSWzhf6Nw/44NW74bQyP4bUB/6PnvqawpC9bEv4=;
 b=ZwPihPv9b9sG+lUpWT4jwVX/vJxtUy54geqivvwef/0TqcWJQVMokSeuykQf6/+KL/4yzq
 vbkfR1srU+NHnLL9SnguHw7KVh7LowDuP9WHxjo5Ufi7ej8/7pGOUoSVrFl4/aopBEXB+C
 Rww50hg8IWLoVYfvsIIWIpprbiflwBc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-LXM42mTZO6mSdJ6MDSHqeA-1; Fri, 05 Apr 2024 12:38:00 -0400
X-MC-Unique: LXM42mTZO6mSdJ6MDSHqeA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-343d1d16d9fso778065f8f.1
 for <nouveau@lists.freedesktop.org>; Fri, 05 Apr 2024 09:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712335079; x=1712939879;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkF4QSWzhf6Nw/44NW74bQyP4bUB/6PnvqawpC9bEv4=;
 b=PmktHtFRiUaSKZ5X8un40b835yWgiPaf2YVEHFD4uJWxnDlRlgewYOWk55nYXYN4mC
 0u+JTT0zNZFEvE6CX9bFMZo0zSTIKP1YjEuUIhJp+q1PUocmqQnLR9LbGdZ56nTU3n6u
 xva2pN8o1is/as6Sm1dyz7FALNueM4d5pPED0nRoIzIurYHMGsag9nSu8ePlBIVLmt1b
 Enr3neyvm5/kqVhThNRVB47EyStbsIeEPb4rpUp/AJHbt9CHeoHeDVoAx+bP0tJeJZoR
 wRYWbjYZZMf1qByilEqhT9wH4KtdY2bzbJHJI++7iKd7ChGlyr1LKUk1mOy08+nP6pZL
 EmHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV79DsTPYI9HEnyFdE25phmuJu92C34b0QpnT4C/Qg1i2WLvgXk4djt++kK35Eo2G24gZwFUzA5RqL9/9Q84rA3Xo/iWMy/5RFeqOHcJQ==
X-Gm-Message-State: AOJu0Yz1GbOk/nHldxHdtlf7BVw+mnmokH3MwUAHuslwQ/Jx5FJgefwK
 3knb4Y1rj10c/QjFUPOMXaabSo4zN93KB3lFUwAynmIUzNHjAo0GGbXQLAsjtzr5V93VFnePXWk
 mvD3DuuYIhbOoo4zkRE96f6DIvqiljR6uqkQ80gaU7Fh+srvb7uiVBCynsj6whhw=
X-Received: by 2002:adf:e849:0:b0:343:e031:69b8 with SMTP id
 d9-20020adfe849000000b00343e03169b8mr1687192wrn.41.1712335079582; 
 Fri, 05 Apr 2024 09:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ46bQriV6ycJFTO0VuNynMncgm9/Re4exnqTKKZrOf8MmqZKAujsFuh4iSK3zn2MXU1fy4Q==
X-Received: by 2002:adf:e849:0:b0:343:e031:69b8 with SMTP id
 d9-20020adfe849000000b00343e03169b8mr1687176wrn.41.1712335079306; 
 Fri, 05 Apr 2024 09:37:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 q8-20020adfea08000000b00341c6440c36sm2409149wrm.74.2024.04.05.09.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 09:37:58 -0700 (PDT)
Message-ID: <cefb67c2-f5f5-4b54-8ed6-a9cab3718ff5@redhat.com>
Date: Fri, 5 Apr 2024 18:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] nouveau: fix function cast warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20240404160234.2923554-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240404160234.2923554-1-arnd@kernel.org>
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

On 4/4/24 18:02, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Calling a function through an incompatible pointer type causes breaks
> kcfi, so clang warns about the assignment:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c:73:10: error: cast from 'void (*)(const void *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>     73 |         .fini = (void(*)(void *))kfree,
> 
> Avoid this with a trivial wrapper.
> 
> Fixes: c39f472e9f14 ("drm/nouveau: remove symlinks, move core/ to nvkm/ (no code changes)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

> ---
> v2: avoid 'return kfree()' expression returning a void
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
> index 4bf486b57101..cb05f7f48a98 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c
> @@ -66,11 +66,16 @@ of_init(struct nvkm_bios *bios, const char *name)
>   	return ERR_PTR(-EINVAL);
>   }
>   
> +static void of_fini(void *p)
> +{
> +	kfree(p);
> +}
> +
>   const struct nvbios_source
>   nvbios_of = {
>   	.name = "OpenFirmware",
>   	.init = of_init,
> -	.fini = (void(*)(void *))kfree,
> +	.fini = of_fini,
>   	.read = of_read,
>   	.size = of_size,
>   	.rw = false,

