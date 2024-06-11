Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B5903850
	for <lists+nouveau@lfdr.de>; Tue, 11 Jun 2024 12:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D2A10E305;
	Tue, 11 Jun 2024 10:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EkAi0XCZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DB110E22A
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jun 2024 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718100133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ybrwft53atk6SF7ZUqNAnkZ2feuXIglpHBR+lKADkBw=;
 b=EkAi0XCZz8HkCGQYuiCRnd8kOo+6nJXtlyD/7ql5k7GqTWkHuB7gP8wab6xVJkv8DC2A19
 vah18IM5n/mUCFdVhpod6S0UKRTws7p5aLYywkekm9PldBmq0vA9Rl+X+G1LTxgFcjD4ZE
 qUamNLHOEttxfUgHRhW7Bo3H1GONZOw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-b-W7su16OvGzT4H8XAFdFw-1; Tue, 11 Jun 2024 06:02:11 -0400
X-MC-Unique: b-W7su16OvGzT4H8XAFdFw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-35f09eab759so3017223f8f.1
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jun 2024 03:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718100130; x=1718704930;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybrwft53atk6SF7ZUqNAnkZ2feuXIglpHBR+lKADkBw=;
 b=TURfrS6sUEDac5gkRfPRmhD1shhU8aSnTR1yhByTX7JW1dwkjusLbK7pK2cPV9B3fY
 xtvzmovGAt+0Red2/BZdqm36YAyIZJguiVhPNzfsITfq50VWSATHVoyJr2ys7ohzWgFT
 Y6RS4Hn0pQGN384mb+K8hxw0QwZ6KS1WxCzdb7ck7HOjD/AsuecqL66tin/mznGXaaO6
 6V1IduSA7p/B4lb2imK/OrRXy6BZ1GQ+OPG9RMqOAaB2XgDblcyLIvOBLl6STy5tFGJL
 8nbDVcw/bXH8BE29bQofEQuyiRsDNzRqFfsxSAcdcxlg8mePhL1MRgwt3IHYUrP04h85
 VulA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOmGHylaPyFRi2asfMZ0GydrhMbl+AZuiHtQgbZIqsDSxwA7tqVJNDfEbYah5gQ9y/bVTywL4Yahh8hY42mGKLJcgJP1OSr+ySCn4iSw==
X-Gm-Message-State: AOJu0YwTvJAbCzhD0TxFBdv6DQ/QuPWucDzBhA2Q2iH4dX2mlKgAUojm
 EJbXRKGt659xQmNiKCKeLkJq7CtGLIEh97nMeNMPAxWbF/T9yROEWExqTK7eBxQYTAPQaPP2lZ2
 QqAI5VwwMjWOdB4ZP+UO7dXKonjC6KEjETjwA3PPvpjhPJKvvN5x05un9qaBr0Og=
X-Received: by 2002:adf:e3c5:0:b0:35f:1f06:3d9d with SMTP id
 ffacd0b85a97d-35f1f063df7mr5752579f8f.70.1718100130587; 
 Tue, 11 Jun 2024 03:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKZL98uEunjHgV1dVr0GvsBw6dhzSAWM/mji33SSRAXlWoRbiGLGcShOXcwnVxfeWG9h8t4g==
X-Received: by 2002:adf:e3c5:0:b0:35f:1f06:3d9d with SMTP id
 ffacd0b85a97d-35f1f063df7mr5752550f8f.70.1718100130173; 
 Tue, 11 Jun 2024 03:02:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e991c9sm13431003f8f.70.2024.06.11.03.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 03:02:09 -0700 (PDT)
Message-ID: <de79f41d-3a9b-4f15-b270-246af8b4c5b0@redhat.com>
Date: Tue, 11 Jun 2024 12:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/nouveau: remove unused struct 'init_exec'
To: linux@treblig.org
Cc: daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kherbst@redhat.com, lyude@redhat.com
References: <20240517232617.230767-1-linux@treblig.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240517232617.230767-1-linux@treblig.org>
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

On 5/18/24 01:26, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'init_exec' is unused since
> commit cb75d97e9c77 ("drm/nouveau: implement devinit subdev, and new
> init table parser")
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Danilo Krummrich <dakr@redhat.com>

To which series does this patch belong? Need me to apply it?

- Danilo

> ---
>   drivers/gpu/drm/nouveau/nouveau_bios.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 79cfab53f80e..8c3c1f1e01c5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -43,11 +43,6 @@
>   #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
>   #define LOG_OLD_VALUE(x)
>   
> -struct init_exec {
> -	bool execute;
> -	bool repeat;
> -};
> -
>   static bool nv_cksum(const uint8_t *data, unsigned int length)
>   {
>   	/*

