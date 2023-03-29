Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D96CD7C3
	for <lists+nouveau@lfdr.de>; Wed, 29 Mar 2023 12:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B4D10EA6E;
	Wed, 29 Mar 2023 10:34:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F6A10EA6E
 for <nouveau@lists.freedesktop.org>; Wed, 29 Mar 2023 10:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680086047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WV+o+6BPdaDM+LpqzyXbB5Lv5klnj7u4YwO4RzzAR4=;
 b=Mp7hpPX83tgRDF3FNYBrtpQB7k7LvxQqaL2LYSJXa9+tAUBoT0fWNkJwu3JOu9GqYRrk2Q
 fj7A2AOF4o/cNxx2rDGiwh/K4ghNe32bBADaN6FsZ290RkTVcUsFgRJx0LRRthDMr0Rgo4
 T5OK8ldjlqj1NLa2w6w3b0SwSJ8umfA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-6DHbhPnsOv6egMCz1WMrZw-1; Wed, 29 Mar 2023 06:34:05 -0400
X-MC-Unique: 6DHbhPnsOv6egMCz1WMrZw-1
Received: by mail-ed1-f69.google.com with SMTP id
 j21-20020a508a95000000b004fd82403c91so21569358edj.3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Mar 2023 03:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680086045;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WV+o+6BPdaDM+LpqzyXbB5Lv5klnj7u4YwO4RzzAR4=;
 b=YMaaf5Sy2jlu9bSKkc7oWXopgnnPuJKv158krcso7tBRRT2/PyohYqIvE/Bl8EE+zO
 06nNADz35diw5NM1ptjH1wDPLQBoT9BsK1rblDIVeyLg6CuPUnJcxLvh5CqyQQJTe0jO
 AXPQN0J5/ZelqDrIQmtT8Oxox9hOBV24Ve+Xh0hsK3R7mMF3nu1EplYIMgfjOuFcjw5X
 6B+IwTiFGJ+Nm9LyZhrmiAU0vPEjsh8URZOXHNdI27FLVLydOTVyn6Dl0m6vzW4e11ck
 uv5EmysuTGtNsRO/lNOPBmF9gGQKVfZcZbnJGlBuK7ZwLgFx93zwBXMhyh0BQuS++0cU
 5Rjw==
X-Gm-Message-State: AAQBX9dyhH25Yj/8G3lQKD2NY4Y/Wxfz6kRRoIcxCXioZmJ9g8XSj5XG
 vVUsqb7GDjRq72olNlZuMI3zll1BkqBmkplCjgVaS1KPfV+tgTFH7dpmBUoWGYa4i1Kuyvn+L+8
 KwOPmL+WL9ds7McgdBb9xLgh8yQ==
X-Received: by 2002:a17:906:4492:b0:931:d277:78a4 with SMTP id
 y18-20020a170906449200b00931d27778a4mr19509518ejo.30.1680086044857; 
 Wed, 29 Mar 2023 03:34:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z57CBpiseFMIgnGNryXrCZSYDx0tr+2VtzalweO0jAD5KLEw2kHf2+a73sKHZ56RkovxiFYw==
X-Received: by 2002:a17:906:4492:b0:931:d277:78a4 with SMTP id
 y18-20020a170906449200b00931d27778a4mr19509506ejo.30.1680086044568; 
 Wed, 29 Mar 2023 03:34:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 rk28-20020a170907215c00b00933b38505f9sm13763006ejb.152.2023.03.29.03.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 03:34:03 -0700 (PDT)
Message-ID: <5a6150d9-3410-b453-b4f2-c25b85d9a4d2@redhat.com>
Date: Wed, 29 Mar 2023 12:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>
References: <20230326205433.36485-1-hdegoede@redhat.com>
 <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3b14406294755cde2b2be6ba54dc09105c071775.camel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 6.2 regression fix] drm/nouveau/kms: Fix
 backlight registration
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
Cc: nouveau@lists.freedesktop.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Mark Pearson <mpearson@lenovo.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 3/29/23 00:23, Lyude Paul wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> (Also note to Mark: this is my way of letting you know someone fixed the
> regression with backlight controls upstream, looking into the weird bright
> screen after resume issue)

Thanks.

I have pushed this to drm-misc-fixes now.

I'll also submit a downstream Fedora kernel pull-req with this
to get this resolved in the Fedora kernels .

Regards,

Hans



> 
> On Sun, 2023-03-26 at 22:54 +0200, Hans de Goede wrote:
>> The nouveau code used to call drm_fb_helper_initial_config() from
>> nouveau_fbcon_init() before calling drm_dev_register(). This would
>> probe all connectors so that drm_connector->status could be used during
>> backlight registration which runs from nouveau_connector_late_register().
>>
>> After commit 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
>> the fbdev emulation code, which now is a drm-client, can only run after
>> drm_dev_register(). So during backlight registration the connectors are
>> not probed yet and the drm_connector->status == connected check in
>> nv50_backlight_init() would now always fail.
>>
>> Replace the drm_connector->status == connected check with
>> a drm_helper_probe_detect() == connected check to fix nv_backlight
>> no longer getting registered because of this.
>>
>> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
>> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/202
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> index 40409a29f5b6..91b5ecc57538 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
>> @@ -33,6 +33,7 @@
>>  #include <linux/apple-gmux.h>
>>  #include <linux/backlight.h>
>>  #include <linux/idr.h>
>> +#include <drm/drm_probe_helper.h>
>>  
>>  #include "nouveau_drv.h"
>>  #include "nouveau_reg.h"
>> @@ -299,8 +300,12 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>>  	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>>  	struct nvif_object *device = &drm->client.device.object;
>>  
>> +	/*
>> +	 * Note when this runs the connectors have not been probed yet,
>> +	 * so nv_conn->base.status is not set yet.
>> +	 */
>>  	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)) ||
>> -	    nv_conn->base.status != connector_status_connected)
>> +	    drm_helper_probe_detect(&nv_conn->base, NULL, false) != connector_status_connected)
>>  		return -ENODEV;
>>  
>>  	if (nv_conn->type == DCB_CONNECTOR_eDP) {
> 

