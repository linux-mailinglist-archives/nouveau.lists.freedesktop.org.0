Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F44464DB
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FBE6E8E6;
	Fri,  5 Nov 2021 14:25:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207C57386B
 for <nouveau@lists.freedesktop.org>; Thu,  4 Nov 2021 20:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636056559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRdrRlX7d6jR9XJ1WlJwuA/7L4WdNGNHCwwgPSMtrew=;
 b=dDewa/LtGBJX7ac4fwngfqrK3V0fYBgwe+JLjd8GGTEQ1eZqtvHimZmHkNb2MWId6OpMe4
 HTZd/hQxjMhhf1/oCMVhZIyNr1OO3vGG7gUcU+MqTAZyqMZM+UmA92DYXS5vxkJy3HaJHG
 WZC+ZVdbavgqa5ilcXPTOemEuhnqZWQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-7N4Q-XKwOrWnPko4RQBeGw-1; Thu, 04 Nov 2021 16:09:18 -0400
X-MC-Unique: 7N4Q-XKwOrWnPko4RQBeGw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so762559wrb.11
 for <nouveau@lists.freedesktop.org>; Thu, 04 Nov 2021 13:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WRdrRlX7d6jR9XJ1WlJwuA/7L4WdNGNHCwwgPSMtrew=;
 b=GTh0fjwjTpz5Fu90yaxdOjsOe1qN80IWO+WluvI81/3ROaiZVtAXmdfSXPpCecaVu8
 nITRkk4cXl5smpfNX2UZ5FEvq2QjsWgGTryXAiQ8uFRzjQDiHuNbrG/jd9EbZqD6FPSo
 L7wgAtDwaP1vRvZZbNkh8hne2uOv/Fz0uPQ4fisvgyzRObOstXdy5rRLWgyecu6iTCej
 /BrSSsx3yAgiM5jaYWMiZlTI6uYBM8EIKyqavaDamOSIEDZDvdA7J2zBmT0raaUMEipT
 CcJ17AEumUmpeiD96Ny2Rq9bTbSPP5hpvCgfGXPwvaML5aI+Br6YPQFu7SvDzeKCWivm
 URFQ==
X-Gm-Message-State: AOAM532agquYKX7iQlFFH88iEsM0CYY5fQrsVxYf72BcbtiY3n1cAT5f
 PzbLRoNMSWE6oPG1/R7KYndml8JKmyKJxm+wEQMCpBeFoxdTglvl/ZxbdHoVcXowwoFDl9v58Gr
 LUdubWdVRMvewEA1zZr7nJv+RUw==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr26040196wmh.86.1636056557069; 
 Thu, 04 Nov 2021 13:09:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy76MY/85Rr56RxIxfOCWbJkdVKLFu3k+Td/GsoIreVUO3gSrCM0LaAND1RBuRZ0S+UgTUN+Q==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr26040146wmh.86.1636056556830; 
 Thu, 04 Nov 2021 13:09:16 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id z15sm6028960wrr.65.2021.11.04.13.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 13:09:16 -0700 (PDT)
Message-ID: <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
Date: Thu, 4 Nov 2021 21:09:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87ilx7ae3v.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87ilx7ae3v.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 05 Nov 2021 14:25:39 +0000
Subject: Re: [Nouveau] [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check
 if drivers should be enabled
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
Cc: David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Jani,

On 11/4/21 20:57, Jani Nikula wrote:
> On Thu, 04 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
>> +/**
>> + * drm_drv_enabled - Checks if a DRM driver can be enabled
>> + * @driver: DRM driver to check
>> + *
>> + * Checks whether a DRM driver can be enabled or not. This may be the case
>> + * if the "nomodeset" kernel command line parameter is used.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int drm_drv_enabled(const struct drm_driver *driver)
>> +{
>> +	if (vgacon_text_force()) {
>> +		DRM_INFO("%s driver is disabled\n", driver->name);
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_drv_enabled);
> 
> The name implies a bool return, but it's not.
> 
> 	if (drm_drv_enabled(...)) {
> 		/* surprise, it's disabled! */
> 	}
> 

It used to return a bool in v2 but Thomas suggested an int instead to
have consistency on the errno code that was returned by the callers.

I should probably name that function differently to avoid confusion.

But I think you are correct and this change is caused too much churn
for not that much benefit, specially since is unclear that there might
be another condition to prevent a DRM driver to load besides nomodeset.

I'll just drop this patch and post only #2 but making drivers to test
using the drm_check_modeset() function (which doesn't have a name that
implies a bool return).

> 
> BR,
> Jani.
> 
> 
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

