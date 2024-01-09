Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FABB828AA0
	for <lists+nouveau@lfdr.de>; Tue,  9 Jan 2024 18:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E2110E49A;
	Tue,  9 Jan 2024 17:01:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7210E496
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jan 2024 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704819679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPJD5Y/JUAijIAEh4AaeHvftl8qt3fo8LRS92q+SjAo=;
 b=TbNSw0wW88w6SXfflWvjissYCBf+OYONnygycHAlTASGgemNgk3ieogqr1gA1IdA+1Er3o
 6Pi/5N5nVta+1nq8jmDcNq617RF1Z1QnDnm3A9xdogb8M/ZPxfwIrb2ttJIpGe72KZB+wR
 LGdQ/1pA55aGaDkrg6ck0bnREHg3o9w=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-MfN78LGnOhC3exJ6-bEI3Q-1; Tue, 09 Jan 2024 12:01:16 -0500
X-MC-Unique: MfN78LGnOhC3exJ6-bEI3Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6800714a149so66201056d6.0
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jan 2024 09:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704819676; x=1705424476;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iPJD5Y/JUAijIAEh4AaeHvftl8qt3fo8LRS92q+SjAo=;
 b=GutD1mMfyN+3knLS0ki6n40Bj+ACR0cGsg0YNT4jcI5gQV9W4bklcpbpLOFYMJkJ+m
 j2MEQYuKiKQ63h9aPw2FHWW+9Sp89q25sbbmqWsO7jOIofBaiQaNc3nunjvIcgLPMSZv
 8DEOliKzI3m94Q/IZXEOjh7ZFofiA36rwl3OE6ZXAtLtJaAVkY9I2JZKPSljV+sCUhrN
 u/GzI3XQbiNcJv4zU+Nnm6DpJ6JrmLraRZxzvVxzoZw309RphIXjho0HQQIP64QbINf5
 kmM1tzw846jFv4vk5qSDMxTr1jltaw+FmrCN1gtZ+4Rn17ypwN95AZgcHMOE24cmdbXo
 SOEg==
X-Gm-Message-State: AOJu0YwWghw8ZKFbkAi+9oc3D6cIef3SEdNSzusCTJW2MXYRrHXX7DkV
 LZdvPkkHVnyAmNC9Nkre2V5tngblFE8XT0pIoMsNcWMSkh5yQ+6Mi27DgUQ3Qe9OTi0XiZdezTV
 YnsDNbMOXhX1jRtsnV+7+ETFBQ4WySrvJeQ==
X-Received: by 2002:ad4:5d61:0:b0:67f:7109:786e with SMTP id
 fn1-20020ad45d61000000b0067f7109786emr8107862qvb.123.1704819676340; 
 Tue, 09 Jan 2024 09:01:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnUqM22+GhVZwe7FhzzDIvyc0qfTBRQqUSGBfzFwlIRvdJVaCiNeoegRcDWdEXvKLK5p4oRA==
X-Received: by 2002:ad4:5d61:0:b0:67f:7109:786e with SMTP id
 fn1-20020ad45d61000000b0067f7109786emr8107837qvb.123.1704819675939; 
 Tue, 09 Jan 2024 09:01:15 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 bo4-20020a05621414a400b00680ce23bc29sm1032598qvb.71.2024.01.09.09.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 09:01:15 -0800 (PST)
Message-ID: <6f343c87-fbb4-4779-aced-2e0df7b18e63@redhat.com>
Date: Tue, 9 Jan 2024 18:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: include drm/drm_edid.h only where needed
To: Jani Nikula <jani.nikula@intel.com>
References: <20240104201632.1100753-1-jani.nikula@intel.com>
 <95f6815c-1ff5-4c89-b8c6-0445834a0083@redhat.com> <87ttnmx1wn.fsf@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <87ttnmx1wn.fsf@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/9/24 10:59, Jani Nikula wrote:
> On Mon, 08 Jan 2024, Danilo Krummrich <dakr@redhat.com> wrote:
>> On 1/4/24 21:16, Jani Nikula wrote:
>>> Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
>>> files when drm_edid.h is modified, while there are only a few files that
>>> actually need to include drm_edid.h.
>>>
>>> Cc: Karol Herbst <kherbst@redhat.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: nouveau@lists.freedesktop.org
>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>
>> Reviewed-by: Danilo Krummrich <dakr@redhat.com>
> 
> Are you going to pick this up via the nouveau tree, or shall I apply it
> to drm-misc-next?

We don't maintain a separate tree, hence feel free to apply it to drm-misc-next.

- Danilo

> 
> BR,
> Jani.
> 
>>
>>> ---
>>>    drivers/gpu/drm/nouveau/dispnv50/head.c     | 1 +
>>>    drivers/gpu/drm/nouveau/nouveau_connector.h | 2 +-
>>>    2 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
>>> index 5f490fbf1877..83355dbc15ee 100644
>>> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
>>> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
>>> @@ -32,6 +32,7 @@
>>>    
>>>    #include <drm/drm_atomic.h>
>>>    #include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_edid.h>
>>>    #include <drm/drm_vblank.h>
>>>    #include "nouveau_connector.h"
>>>    
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
>>> index a2df4918340c..0608cabed058 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_connector.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
>>> @@ -35,7 +35,6 @@
>>>    
>>>    #include <drm/display/drm_dp_helper.h>
>>>    #include <drm/drm_crtc.h>
>>> -#include <drm/drm_edid.h>
>>>    #include <drm/drm_encoder.h>
>>>    #include <drm/drm_util.h>
>>>    
>>> @@ -44,6 +43,7 @@
>>>    
>>>    struct nvkm_i2c_port;
>>>    struct dcb_output;
>>> +struct edid;
>>>    
>>>    #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>>>    struct nouveau_backlight {
>>
> 

