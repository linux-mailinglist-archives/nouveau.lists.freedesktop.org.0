Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59575BA57
	for <lists+nouveau@lfdr.de>; Fri, 21 Jul 2023 00:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CCD10E085;
	Thu, 20 Jul 2023 22:15:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AE710E1B9
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jul 2023 22:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689891333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiBM0NhNH9zoQghOdBXzLiG9pF7WWbT0KDXTbOiJRh4=;
 b=ZuJ6idJAHmnSH/t8ovccA/HjfibEojpRVqz2+1WbAHdw/1XAy/+I8bQM76n55cd21fg+hC
 cjQRJxDN3sQGOX7jVtBCD++gHeFVWgykDkKkwGCtodx1K2uzNS60+K6a2ZjRb4pdqdH2FT
 iN0N7khz9bce5DaQr9RiXdwKB5G7k1g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-PFSWCGAoMtaOXY9KriCYwQ-1; Thu, 20 Jul 2023 18:15:31 -0400
X-MC-Unique: PFSWCGAoMtaOXY9KriCYwQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-97542592eb9so79758166b.2
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jul 2023 15:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689891330; x=1690496130;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jiBM0NhNH9zoQghOdBXzLiG9pF7WWbT0KDXTbOiJRh4=;
 b=P+ByenEcuzOyXoLGhsYaBC4ec7r2VBj5vp0TnrNLpTRdofTQHIqVvkw9UCRU9iO/Td
 FhrRclRE+mPnXGwQ2CjcHMSd/JIm15gJjdTbBeueTCFJJpMNOzKg/BYeUmMCm5y473zU
 qPg6jwl4DGlafI1cwXjmJAODV9pN7lLilU7MGOfgB7mKoEm8e8Ga03cvyu4a9OImZt2D
 AONizS52Cuzm/5tic1VHtGlp1oGsQLPZAAQVEXjjJaY1ebLTwHjxaY7CM5I33RZ9JjmY
 7N/gyJPFSqs1mfzDNwAglA6TnrkCFPwGWThLUznt/O0jlKdmkR6lv8lX0Nkp67M3GPed
 NjkQ==
X-Gm-Message-State: ABy/qLaUdepuSzINZNh3HLJQE59xHIqqgUbUTENCNZsrnaXhNcmYl7N4
 O1ogmcNVnbTedjjU7nnbosV+yrKioqcafbhhUXt8rSkBwHxR4rFDqV3dJwDOrl4nQ/gbt95TQnf
 IJ2RB2SmCMgIpDhMuqipHUKdECw==
X-Received: by 2002:a17:906:5354:b0:991:e458:d16 with SMTP id
 j20-20020a170906535400b00991e4580d16mr62253ejo.72.1689891330350; 
 Thu, 20 Jul 2023 15:15:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlECUhn9EK2zpYiJA37fNk3260rSjUtuX6ugQu1C3qduT+/RDuNw7+Jcosu0bPOTztBCM08zWQ==
X-Received: by 2002:a17:906:5354:b0:991:e458:d16 with SMTP id
 j20-20020a170906535400b00991e4580d16mr62233ejo.72.1689891330015; 
 Thu, 20 Jul 2023 15:15:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 lf26-20020a170906ae5a00b0098e42bef736sm1267207ejb.176.2023.07.20.15.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 15:15:29 -0700 (PDT)
Message-ID: <bcc3325c-ff04-431e-1c72-f4dab957b5a3@redhat.com>
Date: Thu, 20 Jul 2023 23:48:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Steven Price <steven.price@arm.com>
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-2-dakr@redhat.com>
 <2bf64010-c40a-8b84-144c-5387412b579e@arm.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <2bf64010-c40a-8b84-144c-5387412b579e@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v8 01/12] drm: manager to keep
 track of GPUs VA mappings
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
Cc: jason@jlekstrand.net, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bagasdotme@gmail.com, matthew.brost@intel.com, corbet@lwn.net,
 willy@infradead.org, bskeggs@redhat.com, Dave Airlie <airlied@redhat.com>,
 donald.robson@imgtec.com,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 mripard@kernel.org, Liam.Howlett@oracle.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com, daniel@ffwll.ch,
 alexdeucher@gmail.com, christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 7/20/23 12:44, Steven Price wrote:
> On 20/07/2023 01:14, Danilo Krummrich wrote:
>> Add infrastructure to keep track of GPU virtual address (VA) mappings
>> with a decicated VA space manager implementation.
>>
>> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
>> start implementing, allow userspace applications to request multiple and
>> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
>> intended to serve the following purposes in this context.
>>
>> 1) Provide infrastructure to track GPU VA allocations and mappings,
>>     making using an interval tree (RB-tree).
>>
>> 2) Generically connect GPU VA mappings to their backing buffers, in
>>     particular DRM GEM objects.
>>
>> 3) Provide a common implementation to perform more complex mapping
>>     operations on the GPU VA space. In particular splitting and merging
>>     of GPU VA mappings, e.g. for intersecting mapping requests or partial
>>     unmap requests.
>>
>> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Acked-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Tested-by: Matthew Brost <matthew.brost@intel.com>
>> Tested-by: Donald Robson <donald.robson@imgtec.com>
>> Suggested-by: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
>> new file mode 100644
>> index 000000000000..dee2235530d6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> 
> [...]
> 
>> +static bool
>> +drm_gpuva_check_overflow(u64 addr, u64 range)
>> +{
>> +	u64 end;
>> +
>> +	return WARN(check_add_overflow(addr, range, &end),
>> +		    "GPUVA address limited to %lu bytes.\n", sizeof(end));
>> +}
> 
> This produces a warning on 32 bit systems as sizeof() isn't necessarily
> an unsigned long. The fix below silences the warning.

Thank you for fixing this up! Applied both of your patches to drm-misc-next.

- Danilo

> 
> Thanks,
> 
> Steve
> 
> ---8<-----
>  From 9c7356580362b6ac4673724f18ea6e8453b52913 Mon Sep 17 00:00:00 2001
> From: Steven Price <steven.price@arm.com>
> Date: Thu, 20 Jul 2023 10:58:09 +0100
> Subject: [PATCH] drm: manager: Fix printk format for size_t
> 
> sizeof() returns a size_t which may be different to an unsigned long.
> Use the correct format specifier of '%zu' to prevent compiler warnings.
> 
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   drivers/gpu/drm/drm_gpuva_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index 0b80177592a6..f86bfad74ff8 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -619,7 +619,7 @@ drm_gpuva_check_overflow(u64 addr, u64 range)
>   	u64 end;
>   
>   	return WARN(check_add_overflow(addr, range, &end),
> -		    "GPUVA address limited to %lu bytes.\n", sizeof(end));
> +		    "GPUVA address limited to %zu bytes.\n", sizeof(end));
>   }
>   
>   static bool

