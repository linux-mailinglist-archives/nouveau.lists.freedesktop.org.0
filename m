Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD64464E1
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB50D6E91A;
	Fri,  5 Nov 2021 14:25:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC59A72D95
 for <nouveau@lists.freedesktop.org>; Thu,  4 Nov 2021 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636050012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPH6EuJ+PxYsGUm+zlkPCdeGhbo5rViEzGtoDqi+xkE=;
 b=AyJES+82R9kisu7HkzQhxRyaegwLhqFlMlNoqbhpzbOZFArtKSrZRUncwyvbgXNAeEwkHy
 XuUzYbEB8R5oXt9ILyerwebfYyFgnq1b3bPn3X1zNrXgjYDxexwjjNgZC1wcpDQqiIfdeT
 4XgPxXpJl8eolwykYGGRrPOwyX3ypnw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-t7IGr6jMPYmllJjuFXi_6Q-1; Thu, 04 Nov 2021 14:20:10 -0400
X-MC-Unique: t7IGr6jMPYmllJjuFXi_6Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso1298319wrj.20
 for <nouveau@lists.freedesktop.org>; Thu, 04 Nov 2021 11:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DPH6EuJ+PxYsGUm+zlkPCdeGhbo5rViEzGtoDqi+xkE=;
 b=d+kdt8NGGjzOrwq6xC3xkbVJM1XqNmxJMXrNPOn4YsNNHqTc5pRUUbn19y88FSJGb8
 WW4T8HUV49qiTVl/ePXJe0gxRcCX/UNcbB/l+bAhupYGzJ2U57kTSJU1grin1o4m9QXR
 2oN/iSQSXCSaxmSKKN/d0ik2/WSGUOEXlj9ONFakRPMkk6AQHQizATM+bK82QZLQlvaG
 E7SX1OScuAcfLa1tEOlWmeTPnHjNXJT2sHcxPhZZDVe3nJScaDAnGu6+0PLLU0Wp4NHl
 Pr0OsxU994cKdNxuvK9ekL+HOFFqCAnm6YKbTRgi1BDpJ5KpzH5JDXJahmVpDBD4Lfi0
 lo1Q==
X-Gm-Message-State: AOAM532GBVbzmYWpIUXgUtRtFe9bpE8xzTEczEYNvvcEZblsCpt/QFQV
 /wzJuwmceKzNWdqsTQ2eWcLvMedwxe026rogJ6DSTPVfls9VRR63Tjs2UBguUJd24MbHECOUjGQ
 /CcfDY3xCLc+U8Woz2F3VXOfT+A==
X-Received: by 2002:adf:ca05:: with SMTP id o5mr67030436wrh.7.1636050009633;
 Thu, 04 Nov 2021 11:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/X5zAKF0naXD46twKzDH8yo1eUOZPcqgT/e12WiD5Np7h+imVTH2w807R9LdbPX1VAP79Mg==
X-Received: by 2002:adf:ca05:: with SMTP id o5mr67030370wrh.7.1636050009331;
 Thu, 04 Nov 2021 11:20:09 -0700 (PDT)
Received: from [192.168.1.128] ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id o1sm5849625wru.91.2021.11.04.11.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 11:20:08 -0700 (PDT)
Message-ID: <eddff405-18f5-31cf-9981-27343384e12c@redhat.com>
Date: Thu, 4 Nov 2021 19:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Jani Nikula <jani.nikula@linux.intel.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <YYQaYsCr+piMlRpS@ravnborg.org>
 <87r1bvajna.fsf@intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <87r1bvajna.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Sam,

On 11/4/21 18:57, Jani Nikula wrote:
> On Thu, 04 Nov 2021, Sam Ravnborg <sam@ravnborg.org> wrote:
>> Hi Javier,
>>
>> On Thu, Nov 04, 2021 at 05:07:06PM +0100, Javier Martinez Canillas wrote:
>>> Some DRM drivers check the vgacon_text_force() function return value as an
>>> indication on whether they should be allowed to be enabled or not.
>>>
>>> This function returns true if the nomodeset kernel command line parameter
>>> was set. But there may be other conditions besides this to determine if a
>>> driver should be enabled.
>>>
>>> Let's add a drm_drv_enabled() helper function to encapsulate that logic so
>>> can be later extended if needed, without having to modify all the drivers.
>>>
>>> Also, while being there do some cleanup. The vgacon_text_force() function
>>> is guarded by CONFIG_VGA_CONSOLE and there's no need for callers to do it.
>>>
>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 8214a0b1ab7f..3fb567d62881 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -975,6 +975,26 @@ int drm_dev_set_unique(struct drm_device *dev, const char *name)
>>>  }
>>>  EXPORT_SYMBOL(drm_dev_set_unique);
>>>  
>>> +/**
>>> + * drm_drv_enabled - Checks if a DRM driver can be enabled
>>> + * @driver: DRM driver to check
>>> + *
>>> + * Checks whether a DRM driver can be enabled or not. This may be the case
>>> + * if the "nomodeset" kernel command line parameter is used.
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int drm_drv_enabled(const struct drm_driver *driver)
>>> +{
>>> +	if (vgacon_text_force()) {
>>> +		DRM_INFO("%s driver is disabled\n", driver->name);
>>
>> DRM_INFO is deprecated, please do not use it in new code.
>> Also other users had an error message and not just info - is info
>> enough?
>>

Thanks, I didn't know that. Right, they had an error but I do wonder
if that was correct though. After all isn't an error but an explicit
disable due "nomodeset" being set in the kernel command line.

[snip]

>>>  
>>> -	if (vgacon_text_force() && i915_modparams.modeset == -1)
>>> +	ret = drm_drv_enabled(&driver);
>>
>> You pass the local driver variable here - which looks wrong as this is
>> not the same as the driver variable declared in another file.
>

Yes, Jani mentioned it already. I got confused and thought that the driver
variable was also defined in the same compilation unit...

Maybe I could squash the following change?

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index b18a250e5d2e..b8f399b76363 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -89,7 +89,7 @@
 #include "intel_region_ttm.h"
 #include "vlv_suspend.h"
 
-static const struct drm_driver driver;
+const struct drm_driver driver;
 
 static int i915_get_bridge_dev(struct drm_i915_private *dev_priv)
 {
@@ -1777,7 +1777,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
        DRM_IOCTL_DEF_DRV(I915_GEM_VM_DESTROY, i915_gem_vm_destroy_ioctl, DRM_RENDER_ALLOW),
 };
 
-static const struct drm_driver driver = {
+const struct drm_driver driver = {
        /* Don't use MTRRs here; the Xserver or userspace app should
         * deal with them for Intel hardware.
         */
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index c890c1ca20c4..88f770920324 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -16,7 +16,7 @@
 #include "i915_selftest.h"
 #include "i915_vma.h"
 
-static const struct drm_driver driver;
+extern const struct drm_driver driver;
 
 static int i915_check_nomodeset(void)
 {

That should work and I actually got a laptop with an i915 and tested the change
both when CONFIG_DRM_I915=m and CONFIG_DRM_I915=y is set.

Another option is to declare it in i915_drv.h and not make the definition static.
 
> Indeed.
> 
>> Maybe move the check to new function you can add to init_funcs,
>> and locate the new function in i915_drv - so it has access to driver?
> 
> We don't really want that, though. This check is pretty much as early as
> it can be, and there's a ton of useless initialization that would happen
> if we waited until drm_driver is available.
>

Agreed.
 
> From my POV, drm_drv_enabled() is a solution that creates a worse
> problem for us than it solves.
>

I don't have a strong opinion on this. I could just do patch #2 without adding
a level of indirection through drm_drv_enabled(). But Thomas and Daniel Vetter
suggested that we should do this change before.

That is, the drivers could just check if should be enabled by calling to the
drm_check_modeset() function directly if people agree that encapsulating that
logic in a drm_drv_enabled() is not needed.

> 
> BR,
> Jani.
> 

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

