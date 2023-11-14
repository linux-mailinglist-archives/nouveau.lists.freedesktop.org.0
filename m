Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AE7EB8B3
	for <lists+nouveau@lfdr.de>; Tue, 14 Nov 2023 22:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0AE10E213;
	Tue, 14 Nov 2023 21:38:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE7210E213
 for <nouveau@lists.freedesktop.org>; Tue, 14 Nov 2023 21:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699997935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxB7ExxiHdS0NZmPKiG+1iSonlk/ZPL9t612T7W2Wvs=;
 b=U1vwk2vik+J7Y9uZzndKTHji2ZcnBM3BFJKdzkhRXfJLGGWJMkOSr43OTH7AgRsCF68Gr0
 dUD/Zko0HqXvJj86u/z/4xs5WKyr9GcmHPSZ6Ibe5Zswib2XZOEn0II1GCZHVeCMmwE2cv
 v5R66/y5jz+rwvZrPnNzG9ZHZJERrJ4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-47Ap7bxOMW2SR9yeRz_lJQ-1; Tue, 14 Nov 2023 16:38:54 -0500
X-MC-Unique: 47Ap7bxOMW2SR9yeRz_lJQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9e1020e2996so414896466b.0
 for <nouveau@lists.freedesktop.org>; Tue, 14 Nov 2023 13:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699997933; x=1700602733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fxB7ExxiHdS0NZmPKiG+1iSonlk/ZPL9t612T7W2Wvs=;
 b=Q20olgCFNxN0dZ4jNkZSRp4I8PydKb8Vcl+dSBE/9KWhHxFJKjmX7dpMs1k/ILbc8x
 LLmLs7L3qB/Ng47AC6mh6FQn4Px9boMtB9nouKjZKCKDeqHUJ+bEN/9YjBZr4AqGOAew
 9V9huoED772AtL1OH8shSCwg9ZdCkO2ggeTrhCq41PFJh2yxBab4ck7B5yOR2RK5NnwC
 yCAwDAUgKFWh7hyFExWrPAw9iRtLahW0qkFg0VoPMDtyHj18jlGgFcf80WnpyxTnlJKS
 RjD99brXeTB4s5BEAcUp/z6nh9JJSL+QlJEQJPkxY3q9j64ZGofm+llq6N9eG8Rh8els
 bynw==
X-Gm-Message-State: AOJu0Yxt3ahZh4croNoX8QBDFZSxLGV9rmimLV9DaBgCFX06l2a2LWUZ
 kIgBkr8/HAyKl4zySynfaHBP9ybk/VHb6U+9XtpTSAP2LnGBnSLBuBY1O/knhpfDlXqObJqFNCU
 1kN2IdY1yM2d44a7z7Hl8Zue83F76yxIZAg==
X-Received: by 2002:a17:906:1cd7:b0:9bf:60f9:9b7c with SMTP id
 i23-20020a1709061cd700b009bf60f99b7cmr7074757ejh.62.1699997932936; 
 Tue, 14 Nov 2023 13:38:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/9iRKgXF6DJ3fn43Xtb+gxWEoFWTgaYWdvlj3Io7rcxIF4OMTWAGkrBbxvkMRlsAxzGi7Qw==
X-Received: by 2002:a17:906:1cd7:b0:9bf:60f9:9b7c with SMTP id
 i23-20020a1709061cd700b009bf60f99b7cmr7074754ejh.62.1699997932665; 
 Tue, 14 Nov 2023 13:38:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a170906085100b009b654751c14sm5992443ejd.47.2023.11.14.13.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 13:38:52 -0800 (PST)
Message-ID: <a5b76425-1fe7-4031-8b88-d163e6e78dc2@redhat.com>
Date: Tue, 14 Nov 2023 22:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <me@dakr.org>
References: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f71996d9-d1cb-45ea-a4b2-2dfc21312d8c@kili.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH] nouveau/gsp/r535: Fix a NULL vs error pointer
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/8/23 08:40, Dan Carpenter wrote:
> The r535_gsp_cmdq_get() function returns error pointers but this code
> checks for NULL.  Also we need to propagate the error pointer back to
> the callers in r535_gsp_rpc_get().  Returning NULL will lead to a NULL
> pointer dereference.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index e31f9641114b..f8409e2f9fef 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -689,8 +689,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
>   	struct nvfw_gsp_rpc *rpc;
>   
>   	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
> -	if (!rpc)
> -		return NULL;
> +	if (IS_ERR(rpc))
> +		return ERR_CAST(rpc);
>   
>   	rpc->header_version = 0x03000000;
>   	rpc->signature = ('C' << 24) | ('P' << 16) | ('R' << 8) | 'V';

