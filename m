Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C3A8276E1
	for <lists+nouveau@lfdr.de>; Mon,  8 Jan 2024 19:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 857CB10E2A5;
	Mon,  8 Jan 2024 18:04:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB5E10E2A5
 for <nouveau@lists.freedesktop.org>; Mon,  8 Jan 2024 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704737076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAnYP1H5LzGuNWIcYJpBhogfe2D1SDeWJ9NEft7q0Oo=;
 b=XaqC/QlzZ9SUoFFnfRi/ZGFdrxsKo3dqwD7IDlvpY/J6LJKBKN6HDqybvCKKwc/IEzWs5i
 wfp58vlOo4FP18aH4tMyh7y5CM2+llT8ZGra30OXAq4cGckuWbUXh4pNRI+rOgDnfutzCD
 hHLwu8UnB39E2x74wQyPUaCJTPbYLWA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-Jbuara1rPTmMRpyTR6r0Mw-1; Mon, 08 Jan 2024 13:04:35 -0500
X-MC-Unique: Jbuara1rPTmMRpyTR6r0Mw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7832023ed21so96348885a.0
 for <nouveau@lists.freedesktop.org>; Mon, 08 Jan 2024 10:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704737074; x=1705341874;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IAnYP1H5LzGuNWIcYJpBhogfe2D1SDeWJ9NEft7q0Oo=;
 b=ruqkj5um4reV7IgVyrKE14e46sqKP1Qj4SrLeDLjlEtidfLal+jxY8yrcMjxBmaKlS
 +0LzltFhboZv8x5z7dHhJ0TYVIsB8z//GWuGPSM1KHsirHRQfWrNvkFStrSDUD18F3xW
 07oS4xcD/zIatSpo12qhl9/1QaNlg1io64kzJzgSsWkFMJruh6YufLEL1AuH6AbQUsFW
 2JhR+wZ5l62eyXwZ9OF+U8JqFjwWI+Nff8KXZRWXQ5iP7fexvfPjCedeJukbjhe2Hjcx
 z9TzfoI4zM4rRSS1rUpQvegTaoHNbeR6UbUrX/mm1XfyfSZMJ9suO3ptoMnUJPfn+B+F
 8kcQ==
X-Gm-Message-State: AOJu0YzGszcNU1wJrPUk17ZloH3a3qGHhKu8T4f9wI+n36dGmlxdZveX
 pibuRjpDmO5P0mHV6IwcJUWNM8vbrg03o9vQ5figQpSo78O1OEZad9uM2sxRnf1ClvtY1c9GlcF
 U9cVl/ejq2En3vcal7qA4RgSVH9s0Iu3HTQ==
X-Received: by 2002:a05:620a:3788:b0:781:eb20:d230 with SMTP id
 pi8-20020a05620a378800b00781eb20d230mr2596825qkn.45.1704737074746; 
 Mon, 08 Jan 2024 10:04:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe5P5jzlUukysDtp2eDu5oCiQ76sfdGCeZVFi+NgyWwJPXZChIHHNghe8BZwRPbo3NDsflGQ==
X-Received: by 2002:a05:620a:3788:b0:781:eb20:d230 with SMTP id
 pi8-20020a05620a378800b00781eb20d230mr2596810qkn.45.1704737074488; 
 Mon, 08 Jan 2024 10:04:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05620a066a00b007815c55cdf9sm75313qkh.105.2024.01.08.10.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 10:04:34 -0800 (PST)
Message-ID: <95f6815c-1ff5-4c89-b8c6-0445834a0083@redhat.com>
Date: Mon, 8 Jan 2024 19:04:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: include drm/drm_edid.h only where needed
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240104201632.1100753-1-jani.nikula@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240104201632.1100753-1-jani.nikula@intel.com>
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/4/24 21:16, Jani Nikula wrote:
> Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
> files when drm_edid.h is modified, while there are only a few files that
> actually need to include drm_edid.h.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/dispnv50/head.c     | 1 +
>   drivers/gpu/drm/nouveau/nouveau_connector.h | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 5f490fbf1877..83355dbc15ee 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -32,6 +32,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
>   #include <drm/drm_vblank.h>
>   #include "nouveau_connector.h"
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
> index a2df4918340c..0608cabed058 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
> @@ -35,7 +35,6 @@
>   
>   #include <drm/display/drm_dp_helper.h>
>   #include <drm/drm_crtc.h>
> -#include <drm/drm_edid.h>
>   #include <drm/drm_encoder.h>
>   #include <drm/drm_util.h>
>   
> @@ -44,6 +43,7 @@
>   
>   struct nvkm_i2c_port;
>   struct dcb_output;
> +struct edid;
>   
>   #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>   struct nouveau_backlight {

