Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0609E7C7527
	for <lists+nouveau@lfdr.de>; Thu, 12 Oct 2023 19:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7481610E52C;
	Thu, 12 Oct 2023 17:53:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14A910E52C
 for <nouveau@lists.freedesktop.org>; Thu, 12 Oct 2023 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697133183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFmlTU0whGflV8SQCVAE3kgzAoN0IEvaFssYzKGUMLY=;
 b=JztyWG/NMxPrcGEZABiVTDHST/LONEJm2DdopHjONT7kI6Q/vF0ot96ug3Kw/UPDFKvI7B
 9RcQJaCGHZzyCO0VWMeOmOKq+/4hWttkxt12aXvjJNP6gFhjj6C7SZfLodwaznrffx/nqr
 duk+zjQ6c7LK36ouB6qVOXZ33hPmz9w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-bWMX4B2ZPG2WbOtLhzE2Jg-1; Thu, 12 Oct 2023 13:53:02 -0400
X-MC-Unique: bWMX4B2ZPG2WbOtLhzE2Jg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53df4385dccso1017402a12.0
 for <nouveau@lists.freedesktop.org>; Thu, 12 Oct 2023 10:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697133181; x=1697737981;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFmlTU0whGflV8SQCVAE3kgzAoN0IEvaFssYzKGUMLY=;
 b=t1qynEClT/FN6Yy7YrgL9YPRrggLvtAOe/HsaiJJEvveKPnQ3emDibumRXqIjyQXXv
 Ia/o53F8JcYyXcKzBi+41g8kVl/b1IhNNxtQXUxoCCBPLyLBZ4+e9Hc59wImME2qP4wf
 3hHXNf4RfGdVoHc/F4BgclHrRyzmRV7dgcsnkF/qJz01Tl5LScvdNV2iXRzOvMe99U5y
 R8pYyv2fGzNDMM5sbyYTaMIPEzE53NzgZYpzbYFvrm/pSk0QF5LI1BIOu4vdkQMiPIwc
 JrSYJyykkwHV8V4FnIHe+LqeEnmSRvzL7tGSz/p1gOc4v+kW7IohWBLtvnj+OFHrswxW
 Rzww==
X-Gm-Message-State: AOJu0YzX9YiHfBqm0c9EMlE9TgQOM77+xKs/p8+bPm+bhLPSztmBC1aA
 MHN8r5ghMaIoWrhUeKXJbodQaZpQ0gL8YkoZX3udQDWNgbsULyZzomxad98O6ubjD/+6qUTf+sK
 jNyTWGyG5SFmsZbFfrgvX3rmqwA==
X-Received: by 2002:a17:907:7635:b0:9a5:c9a4:ba19 with SMTP id
 jy21-20020a170907763500b009a5c9a4ba19mr22956680ejc.47.1697133181423; 
 Thu, 12 Oct 2023 10:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDWRPItUQHPVnFrYhqkP09r7f/H7/7N+JuwoW5L/9difSByW8G/BZWddWWymKdYDVwwm2xZA==
X-Received: by 2002:a17:907:7635:b0:9a5:c9a4:ba19 with SMTP id
 jy21-20020a170907763500b009a5c9a4ba19mr22956665ejc.47.1697133181064; 
 Thu, 12 Oct 2023 10:53:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 by8-20020a170906a2c800b009b913aa7cdasm11336219ejb.92.2023.10.12.10.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 10:53:00 -0700 (PDT)
Message-ID: <147a615b-be30-4959-baba-e56d1978c36b@redhat.com>
Date: Thu, 12 Oct 2023 19:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20231008140231.17921-1-rdunlap@infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231008140231.17921-1-rdunlap@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: exec: fix ioctl kernel-doc
 warning
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
Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/8/23 16:02, Randy Dunlap wrote:
> kernel-doc emits a warning:
> 
> include/uapi/drm/nouveau_drm.h:49: warning: Cannot understand  * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
>   on line 49 - I thought it was a doc line
> 
> We don't have a way to document a macro value via kernel-doc, so
> change the "/**" kernel-doc marker to a C comment and format the comment
> more like a kernel-doc comment for consistency.
> 
> Fixes: d59e75eef52d ("drm/nouveau: exec: report max pushs through getparam")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for fixing this up, applied to drm-misc-fixes.

- Danilo

> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
> v2: update commit text; somehow I sent a version of the patch before
>      adding the full text.
> v1: https://lore.kernel.org/lkml/20231007005518.32015-1-rdunlap@infradead.org/
> 
>   include/uapi/drm/nouveau_drm.h |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -- a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -45,8 +45,8 @@ extern "C" {
>   #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
>   #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
>   
> -/**
> - * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
> +/*
> + * NOUVEAU_GETPARAM_EXEC_PUSH_MAX - query max pushes through getparam
>    *
>    * Query the maximum amount of IBs that can be pushed through a single
>    * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
> 

