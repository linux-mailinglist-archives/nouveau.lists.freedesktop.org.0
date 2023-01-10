Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76700663E89
	for <lists+nouveau@lfdr.de>; Tue, 10 Jan 2023 11:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4176B10E593;
	Tue, 10 Jan 2023 10:48:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64FE10E590
 for <nouveau@lists.freedesktop.org>; Tue, 10 Jan 2023 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673347693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yYcTtQPoskS9gZPccIHbO8lXQE75TydsMzb/way5LQ=;
 b=bY7yOJj9bSp2Q7vqP3ilUxhIjuLoP8nDEeTCRgmcm8ItNFNGjJgINfmWR5VbcAg/dyeCVF
 n0kceLIY/21uYDq5mGeOrX1z3pOJj7QBDliV42CIepPeCOf7GflWZ93iGCarefB/y5lhuM
 TdEYgmQiPSHJRlL8tRCfqzniDmdhkY0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-548-B9L5n-syOD-0eK_xU88GYA-1; Tue, 10 Jan 2023 05:48:13 -0500
X-MC-Unique: B9L5n-syOD-0eK_xU88GYA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso2402881wml.9
 for <nouveau@lists.freedesktop.org>; Tue, 10 Jan 2023 02:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/yYcTtQPoskS9gZPccIHbO8lXQE75TydsMzb/way5LQ=;
 b=vdM6V8b8ZcvenugDp32QmVW48o1JrB7ur1g9C1yWRb0IVJriv9kgZbgau3oUugyYnQ
 XbrU3IXcBICGFvLPwF0/nrkjhpPPOV+MJKPaww6JwnGEN1jQ79UtdsusWFo6818b9/I+
 1+ik7IxRvRPx4sJ6wwdtEWH8yu4132Gbw+u0TLMCSebJvnrGTinanuSyhnpn1mN84b8B
 VpPGnhM9adMAHmskCIYRtsTABHeO5067BPQjAqLPHp314CQDgb6iio3dZyNf4qTmd67k
 bSxo93OsMa3Kk+MqUFy5ZwpYpsqGuivsygQZzLtDbxQF2CkPb1DuSD4L9FoOamBwUs4c
 Exng==
X-Gm-Message-State: AFqh2koPTZuW6VMG68wJqqxHi38I0tBXmYTCg7p0nIXY45UjUOQIxJIC
 gumra08pW0P5KdMrzMtO+KX2m9DDnfO6Eo2Fa7QwTWLp/hrCyThdEuJuyVlp2LFuaPlVPK2WgUW
 H7dCPriFdElXHd+SI30JCI8a9RQ==
X-Received: by 2002:a05:600c:3d90:b0:3d9:f798:dcba with SMTP id
 bi16-20020a05600c3d9000b003d9f798dcbamr1969651wmb.38.1673347691871; 
 Tue, 10 Jan 2023 02:48:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuX/ud7ajQR16rgBukjH6thYHmemQ8EN6E6QgIiDHPbwyrfNMT43bQzV8gjJ8nIvM4ld62nsw==
X-Received: by 2002:a05:600c:3d90:b0:3d9:f798:dcba with SMTP id
 bi16-20020a05600c3d9000b003d9f798dcbamr1969630wmb.38.1673347691640; 
 Tue, 10 Jan 2023 02:48:11 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 iv14-20020a05600c548e00b003b47b80cec3sm21792602wmb.42.2023.01.10.02.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 02:48:11 -0800 (PST)
Message-ID: <51e8233c-1b9f-239b-ff4a-6410b622b53c@redhat.com>
Date: Tue, 10 Jan 2023 11:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: Javier Martinez Canillas <javierm@redhat.com>
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
 <c1f358fc-5784-b3b2-2d9e-bc896b8036ff@redhat.com>
In-Reply-To: <c1f358fc-5784-b3b2-2d9e-bc896b8036ff@redhat.com>
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

On 12/19/22 09:49, Javier Martinez Canillas wrote:
> Hello Uwe,
> 
> On 12/19/22 09:36, Uwe Kleine-König wrote:
>> While working on a drm driver that doesn't need the i2c algobit stuff I
>> noticed that DRM selects this code even though only 8 drivers actually use
>> it. While also only some drivers use i2c, keep the select for I2C for the
>> next cleanup patch. Still prepare this already by also selecting I2C for
>> the individual drivers.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
> 
> Thanks for sending a v3 of this.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 

I've pushed this to drm-misc (dri-misc-next) now. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

