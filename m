Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723415B8DA8
	for <lists+nouveau@lfdr.de>; Wed, 14 Sep 2022 18:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1966210E996;
	Wed, 14 Sep 2022 16:59:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8616610E996
 for <nouveau@lists.freedesktop.org>; Wed, 14 Sep 2022 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663174743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eAE9HpKpIVvmOEFXUeeAc8cv8ndkWqJta1h5pXlw4I=;
 b=JRX6sNjmMfJzkxfv3BjTG4v7rsCEzoac8YmwIjYVahEWu5LGrqQf2/FVacGIj2XG7Zy5Ht
 ZOB2mNBz7l7CCE013tTg80x4NNm65wmjWIykX7MlP7R8UE2RmDhvIp7u/ddf6IHSFVGILJ
 QCqY0+OG+mkK0gOJIBH9m9MsYsyIIB8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-ckk_Ay7lPH2WtdVDEV8Pug-1; Wed, 14 Sep 2022 12:59:02 -0400
X-MC-Unique: ckk_Ay7lPH2WtdVDEV8Pug-1
Received: by mail-wm1-f69.google.com with SMTP id
 i129-20020a1c3b87000000b003b33e6160bdso9597273wma.7
 for <nouveau@lists.freedesktop.org>; Wed, 14 Sep 2022 09:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8eAE9HpKpIVvmOEFXUeeAc8cv8ndkWqJta1h5pXlw4I=;
 b=fA9193qtjJcWjqLyohyjWJdrzpCzjLMIAXpN+YdawVmWtFhAim8QkrfQ/0anYSt5eO
 hlPavcq9ZHLiS5ZN3QSHwTYzz1NNuMixiQfVqVDGXR4cpcRy5AUcfEHcqV3VOOaGslCA
 jQlf83bDJuT4L+Jm6wfXqjQtoZFwkJrpphtQ4tYVBWp27tc8A7XapXv3WbyQr1q5T3Rn
 U9WDJugOQbZKA+H4HSD2BibEYXomDglusr0v/ajFCQg/TfiKFiJcr/84+A9OYRSXCfl6
 kUwON3Axjd02LkmX8Q0VYIyeSyoc8A+HAyV83fVYjLDfOgvUvAeySWF/FHp80j6UfdUB
 CKaQ==
X-Gm-Message-State: ACgBeo0Wjlj3D0eEWNZd2W+Tpylh1zqCF5kd3ONfKdnmLGHShrJYmhzE
 e5vfSipK6Wu4Pvwpt1IN6GO6By8rDu6d3C52JZzZmVbxILodP5cpeOWyZRp+Qj/Obq6FI/2P690
 qF7ffoQ0fz5DhWdR0tvGxKdRsKQ==
X-Received: by 2002:adf:f211:0:b0:228:d6a4:3510 with SMTP id
 p17-20020adff211000000b00228d6a43510mr21648613wro.448.1663174741065; 
 Wed, 14 Sep 2022 09:59:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4/hMrbSSVrICYCjqMv7OHktLT/ShhknRc4TABv3IGMoKgXGV5RhWzuT4s56YrRzLlwdjxauA==
X-Received: by 2002:adf:f211:0:b0:228:d6a4:3510 with SMTP id
 p17-20020adff211000000b00228d6a43510mr21648581wro.448.1663174740767; 
 Wed, 14 Sep 2022 09:59:00 -0700 (PDT)
Received: from [172.16.38.152] ([185.122.133.20])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003b477532e66sm6954615wms.2.2022.09.14.09.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Sep 2022 09:58:59 -0700 (PDT)
Message-ID: <2b7693c4-b04e-425a-2f87-c4b12fa2f63b@redhat.com>
Date: Wed, 14 Sep 2022 17:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Maxime Ripard <maxime@cerno.tech>
References: <261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com>
 <20220914112933.64ovljgsrv2l25rs@penduick>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220914112933.64ovljgsrv2l25rs@penduick>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [GIT PULL] Immutable backlight-detect-refactor branch
 between acpi, drm-* and pdx86
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>, Daniel Dadap <ddadap@nvidia.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 9/14/22 12:29, Maxime Ripard wrote:
> Hi Hans,
> 
> On Mon, Sep 05, 2022 at 10:35:47AM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Now that all patches have been reviewed/acked here is an immutable backlight-detect-refactor
>> branch with 6.0-rc1 + the v5 patch-set, for merging into the relevant (acpi, drm-* and pdx86)
>> subsystems.
>>
>> Please pull this branch into the relevant subsystems.
>>
>> I will merge this into the review-hans branch of the pdx86 git tree today and
>> from there it will move to for-next once the builders have successfully build-tested
>> the merge.
> 
> I merged it into drm-misc-next, thanks!

Great, thank you!

Regards,

Hans

