Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9D2977AC8
	for <lists+nouveau@lfdr.de>; Fri, 13 Sep 2024 10:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21F010ECB2;
	Fri, 13 Sep 2024 08:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KkVEwY/t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2C810ECB2
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2024 08:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726215293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pfcxu+UmXmfDI/rTDdM4uILVL0wQha2acqL1NiwE3nw=;
 b=KkVEwY/t4963eEtoqsbT6eYi04Jn0tID82aGugjVKzSfHIKuEzzCVcgA2B4KvEGuKSjiVu
 8zwdQ3TDOEookETRGM8BnhrfE1lFiKrJEylp0sLx/FjhGxAqZz9WTy1ovCL3JV6f5tFYzT
 nbznhabmh7yuSvgepvqhJnEfh9A01zw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-YYloVks0MAinO9V6SJpf3A-1; Fri, 13 Sep 2024 04:14:52 -0400
X-MC-Unique: YYloVks0MAinO9V6SJpf3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb0ed9072so6159265e9.1
 for <nouveau@lists.freedesktop.org>; Fri, 13 Sep 2024 01:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726215291; x=1726820091;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pfcxu+UmXmfDI/rTDdM4uILVL0wQha2acqL1NiwE3nw=;
 b=BAtfBdtboGjVrhQy5cG6ixAqef/e7Xctx5WQrTFQ+/6X2Kj6pmSWTc2BJQsxWOH/5M
 qPZG7a5y+zL7KCbxcmib/WZXc8p3ePxuDyk+7ctkkax2n4pMPIipF9VT/A6mCHo2Yo4P
 zz3w3iYC4kEbKjMjq0eiKXwmtopZLx12d8CBWCew21seEd9uqbUEL8ycaty5JWjlFYwJ
 p3UcDgK1vVwZw/5MH7KQcmk0DeYCpVT0tYbMvE9nK4XcLecmq0F4QLg6pLfVcEyUohvF
 ujVyvUYaRzMbHjluNLGbEQ3nFWm76YH0FRjwXM2HwBskruGZBjUJE8ealNW7e5ylcblK
 E6GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxUJSdExD5jlimBP0uSmjB9HUlUKn1DTSakA9c4dZWP892Z4aMMqxR7zgJySAm04Nu3FG6Bhcv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRsZqQel/Fgarp8OFLVNbXqjp6PJVdebYJTRzYJmNsCalHPa1a
 dBnYi9PQ2NZJ/0klI2csTm689zZJu2Y4LDL+IRKURQfBGb4pRQ40bWMyi0AdHsePxBxTff7WakR
 Y69janYmZcr8zEX3/CuaBAbx5+UzAwIxYPlecLv8TPuao9HnGi+tArrHscyChTnM=
X-Received: by 2002:a05:600c:1d1b:b0:42c:b555:43dd with SMTP id
 5b1f17b1804b1-42d9070a3f2mr19812525e9.3.1726215290943; 
 Fri, 13 Sep 2024 01:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQkYNqZa5jF6ReF1NSD90GNAfAwze/3O4yqzySA4Awnui5bCo04WKFNl0IwH6e2Z5WUB/2NA==
X-Received: by 2002:a05:600c:1d1b:b0:42c:b555:43dd with SMTP id
 5b1f17b1804b1-42d9070a3f2mr19812175e9.3.1726215290403; 
 Fri, 13 Sep 2024 01:14:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956653b0sm16298795f8f.44.2024.09.13.01.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 01:14:49 -0700 (PDT)
Message-ID: <a58be9b0-d766-401f-8666-8e693b1b38da@redhat.com>
Date: Fri, 13 Sep 2024 10:14:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/panic: Add ABGR2101010 support
To: Javier Martinez Canillas <javierm@redhat.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, James Jones <jajones@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240913071036.574782-1-jfalempe@redhat.com>
 <20240913071036.574782-2-jfalempe@redhat.com>
 <87h6akyq49.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <87h6akyq49.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 13/09/2024 09:22, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
> Hello Jocelyn,
> 
>> Add support for ABGR2101010, used by the nouveau driver.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 74412b7bf936..0a9ecc1380d2 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -209,6 +209,14 @@ static u32 convert_xrgb8888_to_argb2101010(u32 pix)
>>   	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
>>   }
>>   
>> +static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
>> +{
>> +	pix = ((pix & 0x00FF0000) >> 14) |
>> +	      ((pix & 0x0000FF00) << 4) |
>> +	      ((pix & 0x000000FF) << 22);
>> +	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
>> +}
> 
> Maybe we can move this format conversion helper and the others in the
> driver to drivers/gpu/drm/drm_format_helper.c ?

I think there are still a few issues with that. First is that 
drm_format_helper.c is in a separate module, so you can't call its 
functions from the main drm module, where drm_panic is.

In my drm_log series, https://patchwork.freedesktop.org/series/136789/ I 
moved this to drm_draw.c, and maybe drm_format_helper could re-use that ?

> 
>> +
>>   /*
>>    * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
>>    * @color: input color, in xrgb8888 format
>> @@ -242,6 +250,8 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
>>   		return convert_xrgb8888_to_xrgb2101010(color);
>>   	case DRM_FORMAT_ARGB2101010:
>>   		return convert_xrgb8888_to_argb2101010(color);
>> +	case DRM_FORMAT_ABGR2101010:
>> +		return convert_xrgb8888_to_abgr2101010(color);
>>   	default:
>>   		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>>   		return 0;
>> -- 
>> 2.46.0
>>
> 
> 
> The patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

