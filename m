Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6B5E8F23
	for <lists+nouveau@lfdr.de>; Sat, 24 Sep 2022 20:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D8410E02C;
	Sat, 24 Sep 2022 18:06:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D3A10E00C;
 Sat, 24 Sep 2022 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vNroYZdtuj4X++Jh34X70elhBvsm1SbgjCXbuhLOGrw=; b=ZWXLJr/UJyDQwUuH+c5AAOuTP0
 gcEiMXDTrOTfijyHS0GxsolHRPDzzWriSLnG022xFr3E1FjEOS3jLDv5/Y+SqwQPnJtHqYhKRMfTt
 Dp0O+lmPPSaJeY8Q8WQCjIBOhj8xCR9hcZZghMIdP7UoFyrbQhBBdQhjlxsfWopCjDlsqw9njjy0S
 gLBWNkW/XtKxcUOvm2XmwMFL3xH5FTDPpMzevOsIloIvUPITbAWD1bOx0LRQc06C33H6Z5dzgT8Sp
 mHykOd9WWZDK+16/tWz+/c99riYjMyPjbsmYziJUCqBTED4/RIzEj14koghvXgEqfGaLFtEmw/Vl1
 lFKP2PHA==;
Received: from [2a01:799:961:d200:8cf6:761:40ec:1ff7] (port=61631)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oc9Xg-0003T3-A5; Sat, 24 Sep 2022 20:06:20 +0200
Message-ID: <c7bd9bcb-77a1-9f2d-fe93-afefac5e6def@tronnes.org>
Date: Sat, 24 Sep 2022 20:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-2-f733a0ed9f90@cerno.tech>
 <3f7000ab-b845-a7e8-f215-02121da779b7@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <3f7000ab-b845-a7e8-f215-02121da779b7@tronnes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH v2 02/33] drm/tests: Add Kunit Helpers
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
Cc: Dom Cobley <dom@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



Den 24.09.2022 19.56, skrev Noralf Trønnes:
> 
> 
> Den 22.09.2022 16.25, skrev Maxime Ripard:
>> As the number of kunit tests in KMS grows further, we start to have
>> multiple test suites that, for example, need to register a mock DRM
>> driver to interact with the KMS function they are supposed to test.
>>
>> Let's add a file meant to provide those kind of helpers to avoid
>> duplication.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
>> index 2d9f49b62ecb..b29ef1085cad 100644
>> --- a/drivers/gpu/drm/tests/Makefile
>> +++ b/drivers/gpu/drm/tests/Makefile
>> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>>  	drm_format_helper_test.o \
>>  	drm_format_test.o \
>>  	drm_framebuffer_test.o \
>> +	drm_kunit_helpers.o \
>>  	drm_mm_test.o \
>>  	drm_plane_helper_test.o \
>>  	drm_rect_test.o
>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> new file mode 100644
>> index 000000000000..7ebd620481c1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> @@ -0,0 +1,54 @@
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +
>> +#include <linux/device.h>
>> +
>> +static const struct drm_mode_config_funcs drm_mode_config_funcs = {
>> +};
>> +
>> +static const struct drm_driver drm_mode_driver = {
>> +};
>> +
>> +static void drm_kunit_free_device(struct drm_device *drm, void *ptr)
>> +{
>> +	struct device *dev = ptr;
>> +
>> +	root_device_unregister(dev);
>> +}
>> +
>> +struct drm_device *drm_kunit_device_init(const char *name)
>> +{
>> +	struct drm_device *drm;
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev = root_device_register(name);
>> +	if (IS_ERR(dev))
>> +		return ERR_CAST(dev);
>> +
>> +	drm = drm_dev_alloc(&drm_mode_driver, dev);
> 
> I can't find drm being freed anywhere?
> Maybe you could assign it to drm->managed.final_kfree.
> 

Perhaps a better solution would be to use devm_drm_dev_alloc() and
unregister the root device on exit. That avoids reaching into the drm
managed internals and it looks more like a regular driver.

> Noralf.
> 
>> +	if (IS_ERR(drm)) {
>> +		root_device_unregister(dev);
>> +		return ERR_CAST(drm);
>> +	}
>> +	drm->mode_config.funcs = &drm_mode_config_funcs;
>> +
>> +	ret = drmm_add_action_or_reset(drm, drm_kunit_free_device, dev);
>> +	if (ret)
>> +		goto err_put_device;
>> +
>> +	ret = drmm_mode_config_init(drm);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return drm;
>> +
>> +err_put_device:
>> +	drm_dev_put(drm);
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +void drm_kunit_device_exit(struct drm_device *drm)
>> +{
>> +	drm_dev_put(drm);
>> +}
>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.h b/drivers/gpu/drm/tests/drm_kunit_helpers.h
>> new file mode 100644
>> index 000000000000..5015a327a8c1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.h
>> @@ -0,0 +1,9 @@
>> +#ifndef DRM_KUNIT_HELPERS_H_
>> +#define DRM_KUNIT_HELPERS_H_
>> +
>> +struct drm_device;
>> +
>> +struct drm_device *drm_kunit_device_init(const char *name);
>> +void drm_kunit_device_exit(struct drm_device *drm);
>> +
>> +#endif // DRM_KUNIT_HELPERS_H_
>>
