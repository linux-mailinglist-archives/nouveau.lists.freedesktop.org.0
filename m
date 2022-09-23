Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F05E76E6
	for <lists+nouveau@lfdr.de>; Fri, 23 Sep 2022 11:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF5F10E7E3;
	Fri, 23 Sep 2022 09:26:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC7E10E7E5
 for <nouveau@lists.freedesktop.org>; Fri, 23 Sep 2022 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663925200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBmBrugF1Uc8odU/lwXKGYWTxCtAMKSLu086DYvJSJ0=;
 b=FB4gijC0WWZJ1wuJ7D1e5bz9MYNV4RlIggLuxlMYnm3A444VuCMM8eDipzZ3GmGW9XMG2j
 yAZwSbYDgDrNZ8RsMpqIQjc8vPxqIKDA7Jhg/MZf8+q3+3mnsI6eZBl0WLp0l7m5Tlstcj
 tvfyuatS7mq9kPTvJYgd8iFwtdQIer4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-fCfF9Z5aNS-YMVcT4zOTiA-1; Fri, 23 Sep 2022 05:26:37 -0400
X-MC-Unique: fCfF9Z5aNS-YMVcT4zOTiA-1
Received: by mail-wr1-f70.google.com with SMTP id
 e18-20020adfa452000000b00228a420c389so3788363wra.16
 for <nouveau@lists.freedesktop.org>; Fri, 23 Sep 2022 02:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lBmBrugF1Uc8odU/lwXKGYWTxCtAMKSLu086DYvJSJ0=;
 b=H2Q90jWzhBfUJl2sWa5g/tpTZ3s9xUBYIWYlh8Mn+BNjlI8d+nq+AJRAUWPSDNWVOh
 iHXjTn0YPAQVco5e4oxRxPC6Lun8eK7AMfp+sPT5GgCW2TlQGILN0RV7VIYe/1orV9pk
 GN7O/w9dgzVzI67N8jrT+IwmCczkjveIjvy1/RbJ07du6w8rmxght/Byp6tcl05d5WmH
 1mhyvggc1Tv24xecEupaYjt3UfTGIzRPhaStw0EKKB+KR8inDjpN9e1pnVsedbjJbCh4
 OPq04iFPOGH7YpEfUp846bg6Z45xlCR6ACzGqdTHS8BUrrXo6ay9U9tMNC5lWOB1nmhU
 lOvg==
X-Gm-Message-State: ACrzQf06hfBX+dDGRfmfdmga/2hLqr1wX0IlpgngwYRFEK9RplxfQ8So
 VRWzogn3URtqhWQss4UOWbJGeX3Mrl89XMXUDs2nLMiurW8L8WE1xyjjC7P/tZ/5DgqcwyU9DpE
 qeTFKx6xAUwTlM0IfGpL+inIIAg==
X-Received: by 2002:a5d:6485:0:b0:226:ecf9:359c with SMTP id
 o5-20020a5d6485000000b00226ecf9359cmr4764173wri.17.1663925196544; 
 Fri, 23 Sep 2022 02:26:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61+EyXP0DrQbd5lBD5JiT0UCPQrcmRDCgUpYVonrMG8qw0pJ6zzDkEJadTs5GlFRxQTExixQ==
X-Received: by 2002:a5d:6485:0:b0:226:ecf9:359c with SMTP id
 o5-20020a5d6485000000b00226ecf9359cmr4764139wri.17.1663925196203; 
 Fri, 23 Sep 2022 02:26:36 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bj1-20020a0560001e0100b0022b0214cfa6sm8514250wrb.45.2022.09.23.02.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 02:26:35 -0700 (PDT)
Message-ID: <b3c4ee65-fc56-f54c-3946-b6524fb36f72@redhat.com>
Date: Fri, 23 Sep 2022 11:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <maxime@cerno.tech>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>
References: <20220728-rpi-analog-tv-properties-v2-0-f733a0ed9f90@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-13-f733a0ed9f90@cerno.tech>
 <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <49ea7c7c-7d4c-8348-ea75-e0f376111e4c@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 13/33] drm/client: Add some tests for
 drm_connector_pick_cmdline_mode()
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
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/23/22 11:15, Thomas Zimmermann wrote:
> Hi
> 
> Am 22.09.22 um 16:25 schrieb Maxime Ripard:
>> drm_connector_pick_cmdline_mode() is in charge of finding a proper
>> drm_display_mode from the definition we got in the video= command line
>> argument.
>>
>> Let's add some unit tests to make sure we're not getting any regressions
>> there.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index bbc535cc50dd..d553e793e673 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -1237,3 +1237,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_client_modeset_dpms);
>> +
>> +#ifdef CONFIG_DRM_KUNIT_TEST
>> +#include "tests/drm_client_modeset_test.c"
>> +#endif
> 
> I strongly dislike this style of including source files in each other. 
> It's a recipe for all kind of build errors. Can you do something else?
>

This seems to be the convention used to test static functions and what's
documented in the Kunit docs: https://kunit.dev/third_party/kernel/docs/tips.html#testing-static-functions

I agree with you that's not ideal but I think that consistency with how
it is done by other subsystems is also important.
 
> As the tested function is an internal interface, maybe export a wrapper 
> if tests are enabled, like this:
> 
> #ifdef CONFIG_DRM_KUNIT_TEST
> struct drm_display_mode *
> drm_connector_pick_cmdline_mode_kunit(drm_conenctor)
> {
>    return drm_connector_pick_cmdline_mode(connector)
> }
> EXPORT_SYMBOL(drm_connector_pick_cmdline_mode_kunit)
> #endif
> 
> The wrapper's declaration can be located in the kunit test file.
> 

But that's also not nice since we are artificially exposing these only
to allow the static functions to be called from unit tests. And would
be a different approach than the one used by all other subsystems...

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

