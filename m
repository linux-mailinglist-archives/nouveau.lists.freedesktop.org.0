Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D011A7A2B0E
	for <lists+nouveau@lfdr.de>; Sat, 16 Sep 2023 01:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1B310E6B2;
	Fri, 15 Sep 2023 23:42:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9B110E6B2
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 23:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694821328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edIC9kHaNwOD1pTTtXCPXcwng2iTsOm0qnQsvYt9crA=;
 b=EaFs68NyRSTuik7xtdaKpFr6X4P6hi+jnckllwP5xIMMCiHNNzpsmJu1eG90HoD5RfDUHs
 napNll29m0pec+FPW2RaOb389iMGgzpSr1YPcIoZg/JPZR/zheEotBW7M05KdWC0fJ4nG/
 C/E5TII1T2pH79arvQ24qN0xNiGzQwM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-I6_puhWjOVSBcOMODhYpgA-1; Fri, 15 Sep 2023 19:41:47 -0400
X-MC-Unique: I6_puhWjOVSBcOMODhYpgA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ba1949656bso33662151fa.0
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 16:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694821305; x=1695426105;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=edIC9kHaNwOD1pTTtXCPXcwng2iTsOm0qnQsvYt9crA=;
 b=luJnnBZ3bhtoV2Sq6fr1NNwxyANJRh8D/CBtw7kFzhjmOCkB9fY0icGIFtWlPlud16
 zmtYArKwEPOwE32+nLGzY/dCr/NHT3AzlqL78tndGQTJmQDSAghjkhcAOHCLJOO2Chv8
 U/cEmvQ6BfkaFJJPlTd2nC42wNLugkznrTKnOJ3HrDQDFYsE6OWyhwzn1cBX6btd4Gnw
 fijVrxvuvoZHCcrAJa3PsuGmAulO2COXEuLCFVWsiNumiWe3625Ru+JggEeUaxyXKeBx
 iSahMI81UkDQg7xqHppmbFWp1QVNLvdwaESES/Yz0PHb1JxM5ok5vMSmc7Aq2vI5sSg1
 W7WA==
X-Gm-Message-State: AOJu0YyLcINz/0mvC/FgLhtZRHOysUyJ0zEYBTPm7dd9utGG3u8Tdq7q
 Du7iyHYV+KrPshg1lUrtxkWquqgj14sgEmpR86qJMJ8+wZyQmOe9isJvEdguT5ppuzSiz3mR5TF
 /Jwye8z/MSEUG/4eVQ98WEMAgvg==
X-Received: by 2002:a2e:9253:0:b0:2bc:cdcf:d888 with SMTP id
 v19-20020a2e9253000000b002bccdcfd888mr2658336ljg.46.1694821305683; 
 Fri, 15 Sep 2023 16:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9+l585nVbXHSkBW0mkzB95UWueF5p/qZnXWYxc2gJoge0k2BB4n4o2GvzYDyCESm4Esitfg==
X-Received: by 2002:a2e:9253:0:b0:2bc:cdcf:d888 with SMTP id
 v19-20020a2e9253000000b002bccdcfd888mr2658325ljg.46.1694821305374; 
 Fri, 15 Sep 2023 16:41:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a1709064f0200b0099bcf1c07c6sm2989814eju.138.2023.09.15.16.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 16:41:44 -0700 (PDT)
Message-ID: <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
Date: Sat, 16 Sep 2023 01:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Danilo Krummrich <dakr@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Airlie <airlied@redhat.com>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
Organization: RedHat
In-Reply-To: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer
 bug
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
Cc: Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Dan,

On 9/15/23 14:59, Dan Carpenter wrote:
> The u_memcpya() function is supposed to return error pointers on
> error.  Returning NULL will lead to an Oops.
> 
> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 3666a7403e47..52a708a98915 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>   	size_t bytes;
>   
>   	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);

I plan to replace this function with an upcoming vmemdup_array_user() helper,
which returns -EOVERFLOW instead, hence mind using that?

Unless you disagree, no need to resubmit the patch, I can change it before applying
the patch.

- Danilo

>   	return vmemdup_user(userptr, bytes);
>   }
>   

