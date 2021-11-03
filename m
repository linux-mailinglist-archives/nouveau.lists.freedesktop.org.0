Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23B4464D6
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:25:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DD46E8E4;
	Fri,  5 Nov 2021 14:25:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EC76EA37
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635944778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbLN+rLSmR4Lu23oOqZ5Rw/0XzuuN+zYLV6sy53LaJM=;
 b=Z1ECO6FMsh7mueLc0e0JCmXm68IqmsRtlyym4Y0m8sYqMgaJvfpE98OP2azZY7Q/nSVUCW
 IVKTHQ9sm9ZhESS9LZ3suNpkDQp777pAbE5SLFnCU8EMtWkMrwYCKVfAW3LPm+GXUxnibw
 OZMHrGS2RC1ki/KtHgIBCH0A73NYXi0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-GL8Ny7YgPG-WdZ9yDUjRsA-1; Wed, 03 Nov 2021 09:06:16 -0400
X-MC-Unique: GL8Ny7YgPG-WdZ9yDUjRsA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so1028384wmj.8
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 06:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QbLN+rLSmR4Lu23oOqZ5Rw/0XzuuN+zYLV6sy53LaJM=;
 b=r6ED270SslNyPtirdwLwGufkOTWfcUOV2zuaOs2lQgitTeuwGWMeS3OBFFYJXCqq/p
 oWcTtYOTth9jHE7ADu/lfT8B2e7jFiMc0ziLW4O/lnJYmAdXu9ZUEUz1AuJFfOpAcNsN
 ctuEBsjIsxr2pRPwAorVTAaQw2kKv6JCS/SOlBzhskcZFko6YT9qfR5Y5qswHn8pVPuo
 gvXBb2wOQiSCEY6GZfmzawcZizKcMUNbWmEpqKqfXfoZO4yGwotgu4sXmASEVGW5fW5B
 t6NpMUv6zkqgLrf0fMYNJ/Xnj3jQb884z+Lg2yOg69XMBSwCr+toFijzXB92zwiY/3gm
 UYaw==
X-Gm-Message-State: AOAM5309cS8C7T94KLQtnHzyi71CL0L+vRrVcR1t/ANFrnsksVJ+cAKl
 wzcIe9jXJgPw2I/+zhb0qbMIQJVWsJDGa3U51y/R3/YHSlmfMn0F6/HSlClDEWq9Pxx+80rEN3w
 n8q7tJdYdMadDv6vCedWerWc0cA==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr15125802wmk.32.1635944774995; 
 Wed, 03 Nov 2021 06:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM0hXFNtYadm5yFc+JONq4iTPFyfiO2VjSzzIrHnbt608JviNYEXO0rXhutOI0PtrTAGlysw==
X-Received: by 2002:a7b:c5d4:: with SMTP id n20mr15125743wmk.32.1635944774765; 
 Wed, 03 Nov 2021 06:06:14 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id g2sm1846869wrq.62.2021.11.03.06.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 06:06:14 -0700 (PDT)
Message-ID: <fc835469-b908-608b-7a1c-d3b7340d7c20@redhat.com>
Date: Wed, 3 Nov 2021 14:06:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-3-javierm@redhat.com>
 <a95acef3-8647-9fb0-efa7-9c3a35524052@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <a95acef3-8647-9fb0-efa7-9c3a35524052@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 05 Nov 2021 14:25:38 +0000
Subject: Re: [Nouveau] [RESEND PATCH 2/5] drm: Move nomodeset kernel
 parameter handler to the DRM subsystem
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
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, nouveau@lists.freedesktop.org,
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

Hello Thomas,

On 11/3/21 13:41, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.11.21 um 13:28 schrieb Javier Martinez Canillas:
>> The "nomodeset" kernel cmdline parameter is handled by the vgacon driver
>> but the exported vgacon_text_force() symbol is only used by DRM drivers.
>>
>> It makes much more sense for the parameter logic to be in the subsystem
>> of the drivers that are making use of it. Let's move that to DRM.
>>
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>   drivers/gpu/drm/Makefile                |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  3 +--
>>   drivers/gpu/drm/ast/ast_drv.c           |  1 -
>>   drivers/gpu/drm/drm_nomodeset.c         | 26 +++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_module.c      |  2 --
>>   drivers/gpu/drm/mgag200/mgag200_drv.c   |  1 -
>>   drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
>>   drivers/gpu/drm/qxl/qxl_drv.c           |  1 -
>>   drivers/gpu/drm/radeon/radeon_drv.c     |  1 -
>>   drivers/gpu/drm/tiny/bochs.c            |  1 -
>>   drivers/gpu/drm/tiny/cirrus.c           |  1 -
>>   drivers/gpu/drm/vboxvideo/vbox_drv.c    |  1 -
>>   drivers/gpu/drm/virtio/virtgpu_drv.c    |  1 -
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  1 -
>>   drivers/video/console/vgacon.c          | 21 --------------------
>>   include/drm/drm_mode_config.h           |  6 ++++++
>>   include/linux/console.h                 |  6 ------
>>   17 files changed, 35 insertions(+), 41 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_nomodeset.c
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 1c41156deb5f..0e2d60ea93ca 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -33,6 +33,8 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
>>   
>>   obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>>   
>> +obj-y += drm_nomodeset.o
> 
> Repeating my other comment, should this rather be protected by a 
> separate config symbol that is selected by CONFIG_DRM?
>

I actually thought about that and my opinion is that obj-y reflects
what we really want here or do you envision this getting disabled
in some cases ?

Probably the problem is Kbuild descending into the drivers/gpu dir
even when CONFIG_DRM is not set. Maybe what we want is something
like the following instead?

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 835c88318cec..ef12ee05ba6e 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -3,6 +3,7 @@
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
 obj-$(CONFIG_TEGRA_HOST1X)     += host1x/
-obj-y                  += drm/ vga/
+obj-$(CONFIG_DRM)              += drm/
+obj-y                          += vga/
 obj-$(CONFIG_IMX_IPUV3_CORE)   += ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)            += trace/

Best regards, -- 
Javier Martinez Canillas
Linux Engineering
Red Hat

