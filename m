Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B73827673
	for <lists+nouveau@lfdr.de>; Mon,  8 Jan 2024 18:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DCE10E292;
	Mon,  8 Jan 2024 17:41:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B18C10E292
 for <nouveau@lists.freedesktop.org>; Mon,  8 Jan 2024 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704735714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Cc6o/r7V7THIXz7aSYkP1CbgO44iRjJZbOTNyl9Eck=;
 b=UzViSAAajJc9+eYpj4vJsJkuFEbNcsrvWJK4R8cvRoph3XqeofQS5+ZOZOnQ51ukFrjbOc
 1OMt9+9kk64tIATkH26y3hEXu9sGwX5G5gsp42URS9v6/TSwY8KDY7lE64gX1F/4D26a78
 hdoIxPWjc3Vcrqk7aMd1IlXm61osjhE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-2plm1iJpNGeqRDjA_U2nLg-1; Mon, 08 Jan 2024 12:41:51 -0500
X-MC-Unique: 2plm1iJpNGeqRDjA_U2nLg-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-78323d441c6so177807185a.0
 for <nouveau@lists.freedesktop.org>; Mon, 08 Jan 2024 09:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704735711; x=1705340511;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Cc6o/r7V7THIXz7aSYkP1CbgO44iRjJZbOTNyl9Eck=;
 b=Ha9Anmisu6rZxRVyIqk09vRN+rjiutsHJG2361jd/C9vX8JQXLIe6sGbG1kwmEx50B
 VDdbJCY2hT7nQlMpin6qN0Ws976dSt+T/i5WoKZjI7Oe0WkDbNYpelI96UzZvjKp10nW
 zcjp0AZWhs+8rMtNOUgK3GC8+dV/c1kxqSzKDQ7mZb4lxftD74hJ/i1ZQ7LDL1yQTebz
 WEIRRfYpoKDuDLt6OSJfxL6DSMti4QgdKDrF5QdknCHaUrxduZ9sKrTOS8to4qTY2rYH
 SXWP9UTEGcREuXTtsRT0w6Xca8wAO0itA+bR+zfnnySfNYWSeg4FY54R2F7s9uBfghAb
 eUtg==
X-Gm-Message-State: AOJu0YzedUcS/UgbfNQw1eorpAAeItiQ0p3ElFx8hEzovpEa9mNTUapH
 ivlg06eVCnGABO4xL90sNnqLSQ6JNXiRK5m+RjnLdnyNwKyjJqou76PeGY96OBxiMaj7jJlgZ3G
 s9EHLWQEtE7jwD7AxZKJ5P1iC9n1T+biNag==
X-Received: by 2002:a05:620a:2495:b0:783:2408:b546 with SMTP id
 i21-20020a05620a249500b007832408b546mr208504qkn.37.1704735710974; 
 Mon, 08 Jan 2024 09:41:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi1cNkajQ03cO87hYrOZRH5WctfJOBHkDNumVftm6BT+1/26AYiKg1TD144u21NlOQqM6zMA==
X-Received: by 2002:a05:620a:2495:b0:783:2408:b546 with SMTP id
 i21-20020a05620a249500b007832408b546mr208489qkn.37.1704735710712; 
 Mon, 08 Jan 2024 09:41:50 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a0ceda5000000b00680b34d52f8sm148827qvr.13.2024.01.08.09.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:41:50 -0800 (PST)
Message-ID: <7d70d892-6b72-4460-b036-ed9d3f555b1b@redhat.com>
Date: Mon, 8 Jan 2024 18:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/nouveau/disp: don't misuse kernel-doc comments
To: Randy Dunlap <rdunlap@infradead.org>
References: <20231231233633.6596-1-rdunlap@infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231231233633.6596-1-rdunlap@infradead.org>
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
Cc: nouveau@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/1/24 00:36, Randy Dunlap wrote:
> Change kernel-doc "/**" comments to common "/*" comments to prevent
> kernel-doc warnings:
> 
> crtc.c:453: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   * Sets up registers for the given mode/adjusted_mode pair.
> crtc.c:453: warning: missing initial short description on line:
>   * Sets up registers for the given mode/adjusted_mode pair.
> crtc.c:629: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   * Sets up registers for the given mode/adjusted_mode pair.
> crtc.c:629: warning: missing initial short description on line:
>   * Sets up registers for the given mode/adjusted_mode pair.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>

Series applied to drm-misc-next, thanks!

> ---
>   drivers/gpu/drm/nouveau/dispnv04/crtc.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *cr
>   	regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
>   }
>   
> -/**
> +/*
>    * Sets up registers for the given mode/adjusted_mode pair.
>    *
>    * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc,
>   	return ret;
>   }
>   
> -/**
> +/*
>    * Sets up registers for the given mode/adjusted_mode pair.
>    *
>    * The clocks, CRTCs and outputs attached to this CRTC must be off.
> 

