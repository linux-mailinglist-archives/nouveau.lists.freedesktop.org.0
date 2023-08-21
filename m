Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB4B7830E2
	for <lists+nouveau@lfdr.de>; Mon, 21 Aug 2023 21:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A7B10E0AE;
	Mon, 21 Aug 2023 19:14:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B8C10E09C
 for <nouveau@lists.freedesktop.org>; Mon, 21 Aug 2023 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692645278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhOSpxI2PDYs2OJIu7QJVbJYNk9LCU0AkkLRkJu15pg=;
 b=GuPrLB6/ArmvEhwmv5dBIWcrvdKLF7CaEAjeQK48BOI9vn+3f3aqFMas2yWPcXw2yrF3iJ
 vvRax4zGHe7nrR+g43lg85biFZGMkTsqcofZYv4FG9M4K9ntBi++MOgEMvvnl6Ik15z/Am
 qTIaLJdgkZnNVTUdJda/m+bTR0X4GLU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-b_3JCWN-NuORTPSLwXb1HA-1; Mon, 21 Aug 2023 15:14:36 -0400
X-MC-Unique: b_3JCWN-NuORTPSLwXb1HA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4fe27502459so3364029e87.3
 for <nouveau@lists.freedesktop.org>; Mon, 21 Aug 2023 12:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692645275; x=1693250075;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QhOSpxI2PDYs2OJIu7QJVbJYNk9LCU0AkkLRkJu15pg=;
 b=jqC9kuYs7kfu3Y+ARHpgOqS6og1dIn6gKM1TENgozemRQ3l/OyGddxf7DI3Jf4eZSj
 oN2Agsd0ShRqpDoAiTRjWX/XUeQllUCk9CGuT0hJj3ULgEVc3dN8osxBsd50Zbh028BE
 om74aDPkCZQNK+k7eH3rGE1PFIy0qCd2+gd794ZTfho0f22bVZPAFkdAYJhKpezEwMwx
 zlFVAfWsn3d8Yvv7XInYOzp/qbI79DqxDUqo7nzEClyMBXIakFoyp1bfzpA+ZyS/fM5E
 D0Gy7c2LUwlfc9l31zkrF2fRIGDaaQU0NlnCUUSHyOMBwnKF3dEWJgVRTfB2HUc1vyyX
 nQ7g==
X-Gm-Message-State: AOJu0YzUlcoWMsckGwNAF+/08fyFBV85y1C15JtmyQ2yTG41FLZBsvZC
 UD246KctwHBYZUIO5qWRDF78xBrEg04ewXxCHbpywHoaq9ME+w9jvmyU3ArlnrAdFx0mYGO5Omq
 /TbQqPO0Vp2yMkV4ZJgLGQmf1gg==
X-Received: by 2002:a05:6512:1192:b0:4fd:f85d:f67a with SMTP id
 g18-20020a056512119200b004fdf85df67amr6657053lfr.61.1692645275108; 
 Mon, 21 Aug 2023 12:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkPlo4TwcFOenNEUGpTvSs1j7u5WzB1RXf9hPFdX9z12+DHZYiX3tXqtVjXcSZ23fl8469ww==
X-Received: by 2002:a05:6512:1192:b0:4fd:f85d:f67a with SMTP id
 g18-20020a056512119200b004fdf85df67amr6657036lfr.61.1692645274807; 
 Mon, 21 Aug 2023 12:14:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 mb12-20020a170906eb0c00b0099bd5b72d93sm6980949ejb.43.2023.08.21.12.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 12:14:34 -0700 (PDT)
Message-ID: <3b841ef8-e361-5775-168b-fc6a4417415a@redhat.com>
Date: Mon, 21 Aug 2023 21:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com, Liam.Howlett@oracle.com
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-2-dakr@redhat.com>
 <3462dfaa-96a4-61fd-b31b-fb8d8eb6104c@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <3462dfaa-96a4-61fd-b31b-fb8d8eb6104c@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next 1/3] drm: drm_exec: build always
 builtin
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 8/21/23 11:49, Christian König wrote:
> Am 20.08.23 um 23:53 schrieb Danilo Krummrich:
>> drm_exec must always be builtin for the DRM GPUVA manager to depend on
>> it.
> 
> You should probably go the other way around and not always build in the 
> GPUVA manager.

Yes, I think that's reasonable. Currently, I don't see any core 
dependencies preventing that.

> 
> We have intentionally and with quite a bit of work moved the DRM_EXEC 
> and DRM_BUDDY into separate modules.
> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/Kconfig         | 6 ------
>>   drivers/gpu/drm/Makefile        | 3 +--
>>   drivers/gpu/drm/nouveau/Kconfig | 1 -
>>   3 files changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index ab9ef1c20349..85122d4bb1e7 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -210,12 +210,6 @@ config DRM_TTM_KUNIT_TEST
>>             If in doubt, say "N".
>> -config DRM_EXEC
>> -    tristate
>> -    depends on DRM
>> -    help
>> -      Execution context for command submissions
>> -
>>   config DRM_BUDDY
>>       tristate
>>       depends on DRM
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 215e78e79125..388e0964a875 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -23,6 +23,7 @@ drm-y := \
>>       drm_dumb_buffers.o \
>>       drm_edid.o \
>>       drm_encoder.o \
>> +    drm_exec.o \
>>       drm_file.o \
>>       drm_fourcc.o \
>>       drm_framebuffer.o \
>> @@ -80,8 +81,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += 
>> drm_panel_orientation_quirks.o
>>   # Memory-management helpers
>>   #
>>   #
>> -obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>> -
>>   obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>>   drm_dma_helper-y := drm_gem_dma_helper.o
>> diff --git a/drivers/gpu/drm/nouveau/Kconfig 
>> b/drivers/gpu/drm/nouveau/Kconfig
>> index c52e8096cca4..2dddedac125b 100644
>> --- a/drivers/gpu/drm/nouveau/Kconfig
>> +++ b/drivers/gpu/drm/nouveau/Kconfig
>> @@ -10,7 +10,6 @@ config DRM_NOUVEAU
>>       select DRM_KMS_HELPER
>>       select DRM_TTM
>>       select DRM_TTM_HELPER
>> -    select DRM_EXEC
>>       select DRM_SCHED
>>       select I2C
>>       select I2C_ALGOBIT
> 

