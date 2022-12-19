Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7006508D6
	for <lists+nouveau@lfdr.de>; Mon, 19 Dec 2022 09:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF8510E20C;
	Mon, 19 Dec 2022 08:49:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8914410E20C
 for <nouveau@lists.freedesktop.org>; Mon, 19 Dec 2022 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671439766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IktmGi/GH9m87qz738gkFkEcXhvUHauf4KIOhOQpfo=;
 b=fIbrYh59zgsbCBtm8OeWulT+FZOT4giMOdyKg6hktkHbd1KyKekULc5v/EPdvJniurbERi
 uOzqoGWZSDYBxdmBvAiHbg84cACMKWD/Jvfse8jU+lN/I03mdv84y9MfWZLsKrqkZpX6dq
 Z8Fe7pXKt5g7pcH26XTuRrhIn1A5ODY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-9A2MO9PzOpSejP5JtSDMjQ-1; Mon, 19 Dec 2022 03:49:24 -0500
X-MC-Unique: 9A2MO9PzOpSejP5JtSDMjQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 9-20020a1c0209000000b003d1c0a147f6so6328857wmc.4
 for <nouveau@lists.freedesktop.org>; Mon, 19 Dec 2022 00:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3IktmGi/GH9m87qz738gkFkEcXhvUHauf4KIOhOQpfo=;
 b=wUPgEfTJ3/DjKqAhdfo+BBvGFF0iogksHO75VcJCJyYimSCzEsGT9WuK6MmllBhqBd
 Cyfy8MVx8UsEjxoI7QZY0sIE2R62PKOhlMev2ftAPBWkgNETY0Z2k1/gE0MSunGLJp1A
 Y2RpD27XWYcX8BS/0qTO0jxV6HAQQ7fPfXa0eB86a3fAUVAO0qeS4DawJsebyJ96UxSH
 unajrunSmk+p0dTFVQMruKu8qt3ZvXt+MQYPh78f8w8voONX12fkY3wHFA6/6lKubrwj
 6XFHAEQsCVyTda5VPsE5v42Pz/uXDxylCEHstvbHitHqw3NNocfceAjaB7gMUL/+bydZ
 nBiQ==
X-Gm-Message-State: ANoB5pkyl6heD/mhI2gm4HvVrxZHFHrrWK1ce3zT5MwnTbieyLvMGuXh
 fJKG3zkPMFpKJJiMq923lv4+DPpDK8oiKnIICHqdDF0PbZ0wgtGrQOGjRYuZp6eVSuj/+AQ6dj2
 qURUxUvzhIxPUv/ElGpfq1+jxJw==
X-Received: by 2002:a1c:6a01:0:b0:3cf:d365:1e86 with SMTP id
 f1-20020a1c6a01000000b003cfd3651e86mr42747687wmc.31.1671439763822; 
 Mon, 19 Dec 2022 00:49:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5mBzP19fZOdLBEJmJRVSsZifpUbMwbq1/5C+qMXTEcf81BL0BpsCtpT5x/OuE2fmd/lVCHFg==
X-Received: by 2002:a1c:6a01:0:b0:3cf:d365:1e86 with SMTP id
 f1-20020a1c6a01000000b003cfd3651e86mr42747667wmc.31.1671439763587; 
 Mon, 19 Dec 2022 00:49:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n15-20020a1c720f000000b003cf4ec90938sm11399798wmc.21.2022.12.19.00.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:49:23 -0800 (PST)
Message-ID: <c1f358fc-5784-b3b2-2d9e-bc896b8036ff@redhat.com>
Date: Mon, 19 Dec 2022 09:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Dave Airlie <airlied@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 John Stultz <jstultz@google.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20221219083627.1401627-1-u.kleine-koenig@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221219083627.1401627-1-u.kleine-koenig@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH v3] drm: Only select I2C_ALGOBIT for drivers
 that actually need it
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
Cc: kernel@pengutronix.de, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Uwe,

On 12/19/22 09:36, Uwe Kleine-König wrote:
> While working on a drm driver that doesn't need the i2c algobit stuff I
> noticed that DRM selects this code even though only 8 drivers actually use
> it. While also only some drivers use i2c, keep the select for I2C for the
> next cleanup patch. Still prepare this already by also selecting I2C for
> the individual drivers.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Thanks for sending a v3 of this.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

