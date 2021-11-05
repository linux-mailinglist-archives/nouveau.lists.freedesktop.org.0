Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0A64464E5
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195416E9AF;
	Fri,  5 Nov 2021 14:25:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519C66E115
 for <nouveau@lists.freedesktop.org>; Fri,  5 Nov 2021 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636106144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZ67s9sbnfsD5fqdtGG0nGBmSdAaIG5RWNWBFufx9E8=;
 b=TkztJmfb0Z4d5Q7UrtQL+DyWHuqpVNqfrdsLFZ+WiVfpGFPuMhNLrJ6F0nv5PsMlaarAZb
 Vygb0wLA0cRBG+/tiSf4jFiiLaL74ejFHMHrXXXujjjbzKMNx7ZJmLQBW7khPh6LFcMIPc
 JR7ikaxBoCVEu4dcI2OiMs+xAg75I6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-Cg11NkfsNfKoE6YrxNEFmw-1; Fri, 05 Nov 2021 05:55:43 -0400
X-MC-Unique: Cg11NkfsNfKoE6YrxNEFmw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r6-20020a1c4406000000b0033119c22fdbso3135154wma.4
 for <nouveau@lists.freedesktop.org>; Fri, 05 Nov 2021 02:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oZ67s9sbnfsD5fqdtGG0nGBmSdAaIG5RWNWBFufx9E8=;
 b=SQvvK1lb50Gd6kSct0v3j4Kx4g3h9Y2sakORtVLc4j6Uu7KTxeAtkWJXYOrHLXbQFv
 aVQ/oa0KtFlNfh7tqAx9Quj8BYgYlH4kl+Oh4qPWzXC90w2KzmNQOfbSWndnbotl7CSu
 iZiJOge0WTiQceMRZ/01zlKePGkefF1RtqNHmxCuf1qvCbZeHsixZabZqY61su8OZVgh
 Y/bUzeRbNJcPSVDYc1ISf6EUMKVnAhTnykdag2LapYbl8Psdn3Y9inQJ9gj7FQCOfM+/
 JB6tI14t4gcFi3qMEq+dedLqVP+XHGUsh+IPJ65Qa5aoMoaKcGPyg1kL8DOL+cWnLWCO
 otSQ==
X-Gm-Message-State: AOAM530HpBWTpwbeNnVwtJYULHwpo/+bvqmrqz98w8SMOfnx6bbiikq+
 hqIbvxwRKRv/9VOZo5J1t14krO7CKdkyEFa7Bi2L+N0xFewd1eST+g19COYM+V+21/fEylnbh4c
 7F5AlbPFg84AyYgQZs+c9G8uvOA==
X-Received: by 2002:a7b:c8d5:: with SMTP id f21mr27635763wml.146.1636106142130; 
 Fri, 05 Nov 2021 02:55:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT8viACi1U7JY5S3rkG/MaHma60ZlmQ0NQODpS8eTcPcWv9ZvZPYhizNzNYarjDaHcIaJjnA==
X-Received: by 2002:a7b:c8d5:: with SMTP id f21mr27635740wml.146.1636106141897; 
 Fri, 05 Nov 2021 02:55:41 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id s26sm5390804wmc.0.2021.11.05.02.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 02:55:41 -0700 (PDT)
Message-ID: <847c2315-b4a2-3bd1-e048-4263b5f496ed@redhat.com>
Date: Fri, 5 Nov 2021 10:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-3-javierm@redhat.com>
 <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Nov 2021 14:25:39 +0000
Subject: Re: [Nouveau] [PATCH v2 2/2] drm: Move nomodeset kernel parameter
 to the DRM subsystem
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
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
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/5/21 10:00, Thomas Zimmermann wrote:

[snip]

>> +
>> +static int __init disable_modeset(char *str)
>> +{
>> +	drm_nomodeset = true;
>> +
>> +	pr_warn("You have booted with nomodeset. This means your GPU drivers are DISABLED\n");
>> +	pr_warn("Any video related functionality will be severely degraded, and you may not even be able to suspend the system properly\n");
>> +	pr_warn("Unless you actually understand what nomodeset does, you should reboot without enabling it\n");
> 
> I'd update this text to be less sensational.
>

This is indeed quite sensational. But think we can do it as a follow-up patch.

Since we will have to stick with nomodeset for backward compatibility, I was
planning to add documentation to explain what this parameter is about and what
is the actual effect of setting it.

So I think we can change this as a part of that patch-set.
 
>> +
>> +	return 1;
>> +}
>> +
>> +/* Disable kernel modesetting */
>> +__setup("nomodeset", disable_modeset);
>> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
>> index 45cb3e540eff..c890c1ca20c4 100644
>> --- a/drivers/gpu/drm/i915/i915_module.c
>> +++ b/drivers/gpu/drm/i915/i915_module.c
>> @@ -4,8 +4,6 @@
>>    * Copyright © 2021 Intel Corporation
>>    */
>>   
>> -#include <linux/console.h>
>> -
>
> These changes should be in patch 1?
>

Yes, I forgot to move these when changed the order of the patches.

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

