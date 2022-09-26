Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 778E85EA5C2
	for <lists+nouveau@lfdr.de>; Mon, 26 Sep 2022 14:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A636D10E68E;
	Mon, 26 Sep 2022 12:16:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03FB10E68B;
 Mon, 26 Sep 2022 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VqqSqbLQ5CcNULSIxBrajieA3dWYiSKrZmW1RRtf2jA=; b=FMxfkov+yeLnAgQjafE8g9To1P
 clmuv1NwmM/GT/7KQvLpa2fgLvgElGaDMSjVapH/NX57xOh5Cfd1Tsa2tvazzp1xbT34/sWFZSsxf
 G+33Mez91WAezNG7jxhrzQJi1HJ4RMSbrEt/NhffiULFzLJkf0DT+Dy3y/PhaE6Mj51uSvpE8Q02X
 +Wg8OyhF/H9EumsY/eHK7iQo7QkDFQZMEHfp3Lnk5V1ZMMtekj/ajQLAvH6ws+wESFiM4pzDtspPW
 +H7msO0IVHArxJVz7tWFGwWvpRY3610HctqslpxOAPUco0dGkVPpdoTrG4RbBtVSg5vlQAtpJbMBK
 a6MHbVJw==;
Received: from [2a01:799:961:d200:3946:6b45:3eef:d112] (port=65380)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ocn1g-0001Me-Bi; Mon, 26 Sep 2022 14:15:56 +0200
Message-ID: <8eab2fc7-92de-fcc9-150b-ac3e7f293267@tronnes.org>
Date: Mon, 26 Sep 2022 14:15:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-2-f733a0ed9f90@cerno.tech>
 <3f7000ab-b845-a7e8-f215-02121da779b7@tronnes.org>
 <c7bd9bcb-77a1-9f2d-fe93-afefac5e6def@tronnes.org>
 <20220926093612.wvbou2srbo3uinar@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220926093612.wvbou2srbo3uinar@houat>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



Den 26.09.2022 11.36, skrev Maxime Ripard:
> Hi Noralf,
> 
> On Sat, Sep 24, 2022 at 08:06:17PM +0200, Noralf Trønnes wrote:
>> Den 24.09.2022 19.56, skrev Noralf Trønnes:
>>>
>>>
>>> Den 22.09.2022 16.25, skrev Maxime Ripard:
>>>> As the number of kunit tests in KMS grows further, we start to have
>>>> multiple test suites that, for example, need to register a mock DRM
>>>> driver to interact with the KMS function they are supposed to test.
>>>>
>>>> Let's add a file meant to provide those kind of helpers to avoid
>>>> duplication.
>>>>
>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
>>>> index 2d9f49b62ecb..b29ef1085cad 100644
>>>> --- a/drivers/gpu/drm/tests/Makefile
>>>> +++ b/drivers/gpu/drm/tests/Makefile
>>>> @@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>>>>  	drm_format_helper_test.o \
>>>>  	drm_format_test.o \
>>>>  	drm_framebuffer_test.o \
>>>> +	drm_kunit_helpers.o \
>>>>  	drm_mm_test.o \
>>>>  	drm_plane_helper_test.o \
>>>>  	drm_rect_test.o
>>>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>>>> new file mode 100644
>>>> index 000000000000..7ebd620481c1
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>>>> @@ -0,0 +1,54 @@
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_managed.h>
>>>> +
>>>> +#include <linux/device.h>
>>>> +
>>>> +static const struct drm_mode_config_funcs drm_mode_config_funcs = {
>>>> +};
>>>> +
>>>> +static const struct drm_driver drm_mode_driver = {
>>>> +};
>>>> +
>>>> +static void drm_kunit_free_device(struct drm_device *drm, void *ptr)
>>>> +{
>>>> +	struct device *dev = ptr;
>>>> +
>>>> +	root_device_unregister(dev);
>>>> +}
>>>> +
>>>> +struct drm_device *drm_kunit_device_init(const char *name)
>>>> +{
>>>> +	struct drm_device *drm;
>>>> +	struct device *dev;
>>>> +	int ret;
>>>> +
>>>> +	dev = root_device_register(name);
>>>> +	if (IS_ERR(dev))
>>>> +		return ERR_CAST(dev);
>>>> +
>>>> +	drm = drm_dev_alloc(&drm_mode_driver, dev);
>>>
>>> I can't find drm being freed anywhere?
>>> Maybe you could assign it to drm->managed.final_kfree.
> 
> There's a drm_dev_put in the test_exit hook which should free it.
> 

I see now, there's a drmm_add_final_kfree() in drm_dev_alloc().

Noralf.

>> Perhaps a better solution would be to use devm_drm_dev_alloc() and
>> unregister the root device on exit. That avoids reaching into the drm
>> managed internals and it looks more like a regular driver.
> 
> But yeah, this is a good idea, I'll do it.
> 
> Maxime
