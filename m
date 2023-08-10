Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C677824B
	for <lists+nouveau@lfdr.de>; Thu, 10 Aug 2023 22:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E6610E5FB;
	Thu, 10 Aug 2023 20:46:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F7A10E5FB
 for <nouveau@lists.freedesktop.org>; Thu, 10 Aug 2023 20:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691700398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peMTe0/5+mkSedrYiGrzKaaCxKfi8eF8di3SVpG6oGg=;
 b=MYgQX5bMpVhJpseNyTzfWxCCRg9clM+bayYT4r44vrUHDYDmNklz7GKdtqWEzDNv5Y26jl
 Oscm04doh9Q9FKxtx+cGnlGlk4Pp8+HWf5SFy20N61Lth67OGYXhuw5MJH+X1UWwBOq6Fi
 yGrpMv7f7dkZpMDEmpYifadifXsWNkE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-UBuIhrOpMaChFNdHxmNXrQ-1; Thu, 10 Aug 2023 16:46:36 -0400
X-MC-Unique: UBuIhrOpMaChFNdHxmNXrQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99bc8f1290eso94495666b.3
 for <nouveau@lists.freedesktop.org>; Thu, 10 Aug 2023 13:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691700395; x=1692305195;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=peMTe0/5+mkSedrYiGrzKaaCxKfi8eF8di3SVpG6oGg=;
 b=Xspn17+NG/zM9EDU/joZvbN4VjChb5d+KsWgsKgOVWm1yX261Smu3tCbUN7aJZneUv
 Wwkfgh26tGSUOmVQ26LndgoXfEHUMwMUyEWn8gaOnXSPM0014gggq4YKkHDE0DMrfOS/
 vDr5RhPc2DqlBOn2RcwhD/Q6u9PUH+8O1clVkCUs5VRxBKB+vVWeLubshOe1mr7xvnBS
 /GsrVF1ayBroDIdyOvGdWZn99bLYCeV6PwdB3gntDa6Fxu18eOmw0uNZdXYKGjWKLiW+
 IgRJda4CZY3dFWKVSWvfL1O5TMTVGWa8UhF0p8eqV5MFMthkCI7Q0SCfzQf7Qn9ETlfO
 1ftA==
X-Gm-Message-State: AOJu0YwU3R2npEOGPl4XtXzmbT9jEVfcqSQR2oGjj0SEYPd3Zhs4tB+O
 ZebbmMqs0Ml2vOPz+Sljg6JcQ2zDaG1VVDwkos5q414FVe7YqAwN/Abeyl2+e3hZVva+1PNxtzL
 ekRbnmXzoKYlei+hlkCs3YZ/JnA==
X-Received: by 2002:a17:906:21c:b0:99d:101a:adad with SMTP id
 28-20020a170906021c00b0099d101aadadmr2926388ejd.71.1691700395848; 
 Thu, 10 Aug 2023 13:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW26xxTNJPFQ3smOHWGxyKlX0mnvuZtjaAEGkjD93ZtdsWhyKIS2aZ+xETefj0ZEOQl3flLg==
X-Received: by 2002:a17:906:21c:b0:99d:101a:adad with SMTP id
 28-20020a170906021c00b0099d101aadadmr2926376ejd.71.1691700395512; 
 Thu, 10 Aug 2023 13:46:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1709064c8100b00991faf3810esm1406863eju.146.2023.08.10.13.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 13:46:34 -0700 (PDT)
Message-ID: <0cad9f8b-7ff7-dfed-cf53-6953c5ff644d@redhat.com>
Date: Thu, 10 Aug 2023 22:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dave Airlie <airlied@gmail.com>
References: <20230810185020.231135-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230810185020.231135-1-airlied@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: use vmemdup_user
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 8/10/23 20:50, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> I think there are limit checks in places for most things but the
> new api wants to not have them.
> 
> Add a limit check and use the vmemdup_user helper instead.

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drv.h | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 54063b094a69..8a7357688aff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -189,21 +189,12 @@ u_free(void *addr)
>   static inline void *
>   u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
>   {
> -	void *mem;
> -	void __user *userptr = (void __force __user *)(uintptr_t)user;
> +	void __user *userptr = u64_to_user_ptr(user);
> +	size_t bytes;
>   
> -	size *= nmemb;
> -
> -	mem = kvmalloc(size, GFP_KERNEL);
> -	if (!mem)
> -		return ERR_PTR(-ENOMEM);
> -
> -	if (copy_from_user(mem, userptr, size)) {
> -		u_free(mem);
> -		return ERR_PTR(-EFAULT);
> -	}
> -
> -	return mem;
> +	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> +		return NULL;
> +	return vmemdup_user(userptr, bytes);
>   }
>   
>   #include <nvif/object.h>

