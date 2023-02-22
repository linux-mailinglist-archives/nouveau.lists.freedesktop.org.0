Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552C69F92B
	for <lists+nouveau@lfdr.de>; Wed, 22 Feb 2023 17:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036D910E110;
	Wed, 22 Feb 2023 16:40:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0709110E110
 for <nouveau@lists.freedesktop.org>; Wed, 22 Feb 2023 16:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677084021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sKvLH39Md6VFASwNimh3Ijve7a+l/n+mf16qXiFcEQs=;
 b=dNQo9NV6a26VtC4fu6Vx5sSoqATrNkwQZSxZR+HK9uHKkH6dWZ2u2qNUj1e6Q6CBxK/DeZ
 Bw+BhemKhJcfA2bsxcrddgQZP3TV+c/sRgUhqxhwTGNINnhc6UftsoVTZXr+9SGDCgbuqx
 VcMwWQPt5Bu2PM5cv6q/NmYzC6MsKcI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-CIIg_H_PNXSWI1hroh_kYA-1; Wed, 22 Feb 2023 11:40:17 -0500
X-MC-Unique: CIIg_H_PNXSWI1hroh_kYA-1
Received: by mail-ed1-f71.google.com with SMTP id
 eg35-20020a05640228a300b004ad6e399b73so10694796edb.10
 for <nouveau@lists.freedesktop.org>; Wed, 22 Feb 2023 08:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKvLH39Md6VFASwNimh3Ijve7a+l/n+mf16qXiFcEQs=;
 b=sv3sEBP86H28mxrzOaiu9aBwQCnKl29iypSllps69aTc4bAYbiQudoBK+bsYNq8oGu
 wsycPex+6Q9WDeeXErLJvOKD1q4ZGx3TDFEZLg8jTTGsS0nRDwmH83qmGid0lwawS65+
 sWOwuZWfo2cEiZxqe6HFWWlQ+rD4tuAvFnbIdSkSzMoO8oNsncJR8+Mw9dKGDYmeMAIA
 qWRSS+5pe7izJl3z3RQ1zh1bPRWJwNpNEYQf6U6uFe/25nmKSKhHohdT6I2uyhwNbb2b
 TikiJDVYuOzidDDg0ilXZxSARuo+P1PePzWT7P0RUXHhZ+jul1B4qD3QZv1doCzki0dK
 1fKw==
X-Gm-Message-State: AO0yUKWV4rXjv/P8HfGADzCuLNfSCWJnKFXDEc49V4UeCUVW7XSwMv7e
 IU0/ehCxJyHKJ4VO4EvDwsjrJW+KcoTYkYWi2MASRuCA9SF0WWF0CNaIb70pG3wv/OPbEymMq8M
 EaWneZZYgqCTYPTVdRSWmhVuMmQ==
X-Received: by 2002:a17:906:58c6:b0:8ea:825:a5db with SMTP id
 e6-20020a17090658c600b008ea0825a5dbmr1975988ejs.76.1677084016601; 
 Wed, 22 Feb 2023 08:40:16 -0800 (PST)
X-Google-Smtp-Source: AK7set8y1aIvy6/M9izm4ZRhyULPWeIfqPOxVNzTRzQDPPo3HY43nOvrd3fmMTJNtsFtgPLgH4e/yw==
X-Received: by 2002:a17:906:58c6:b0:8ea:825:a5db with SMTP id
 e6-20020a17090658c600b008ea0825a5dbmr1975964ejs.76.1677084016324; 
 Wed, 22 Feb 2023 08:40:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a509552000000b004a23558f01fsm3756214eda.43.2023.02.22.08.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:40:15 -0800 (PST)
Message-ID: <83755119-083d-7d66-fca0-ca306c841d9c@redhat.com>
Date: Wed, 22 Feb 2023 17:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
 <cc8eeaf4-31e7-98e4-a712-012fc604e985@redhat.com>
 <29ea3705-5634-c204-c1da-d356b6dfbafc@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <29ea3705-5634-c204-c1da-d356b6dfbafc@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-next v2 05/16] drm: manager to keep track
 of GPUs VA mappings
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
Cc: matthew.brost@intel.com, willy@infradead.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-mm@kvack.org, alexdeucher@gmail.com,
 boris.brezillon@collabora.com, bskeggs@redhat.com, Liam.Howlett@oracle.com,
 Dave Airlie <airlied@redhat.com>, bagasdotme@gmail.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2/22/23 16:14, Christian König wrote:
> Am 22.02.23 um 16:07 schrieb Danilo Krummrich:
>> On 2/22/23 11:25, Christian König wrote:
>>> Am 17.02.23 um 14:44 schrieb Danilo Krummrich:
>>
>> <snip>
>>
>>>> +/**
>>>> + * DOC: Overview
>>>> + *
>>>> + * The DRM GPU VA Manager, represented by struct drm_gpuva_manager 
>>>> keeps track
>>>> + * of a GPU's virtual address (VA) space and manages the 
>>>> corresponding virtual
>>>> + * mappings represented by &drm_gpuva objects. It also keeps track 
>>>> of the
>>>> + * mapping's backing &drm_gem_object buffers.
>>>> + *
>>>> + * &drm_gem_object buffers maintain a list (and a corresponding 
>>>> list lock) of
>>>> + * &drm_gpuva objects representing all existent GPU VA mappings 
>>>> using this
>>>> + * &drm_gem_object as backing buffer.
>>>> + *
>>>> + * If the &DRM_GPUVA_MANAGER_REGIONS feature is enabled, a GPU VA 
>>>> mapping can
>>>> + * only be created within a previously allocated &drm_gpuva_region, 
>>>> which
>>>> + * represents a reserved portion of the GPU VA space. GPU VA 
>>>> mappings are not
>>>> + * allowed to span over a &drm_gpuva_region's boundary.
>>>> + *
>>>> + * GPU VA regions can also be flagged as sparse, which allows 
>>>> drivers to create
>>>> + * sparse mappings for a whole GPU VA region in order to support 
>>>> Vulkan
>>>> + * 'Sparse Resources'.
>>>
>>> Well since we have now found that there is absolutely no technical 
>>> reason for having those regions could we please drop them?
>>
>> I disagree this was the outcome of our previous discussion.
>>
>> In nouveau I still need them to track the separate sparse page tables 
>> and, as you confirmed previously, Nvidia cards are not the only cards 
>> supporting this feature.
>>
>> The second reason is that with regions we can avoid merging between 
>> buffers, which saves some effort. However, I agree that this argument 
>> by itself probably doesn't hold too much, since you've pointed out in 
>> a previous mail that:
>>
>> <cite>
>> 1) If we merge and decide to only do that inside certain boundaries 
>> then those boundaries needs to be provided and checked against. This 
>> burns quite some CPU cycles
>>
>> 2) If we just merge what we can we might have extra page table updates 
>> which cost time and could result in undesired side effects.
>>
>> 3) If we don't merge at all we have additional housekeeping for the 
>> mappings and maybe hw restrictions.
>> </cite>
>>
>> However, if a driver uses regions to track its separate sparse page 
>> tables anyway it gets 1) for free, which is a nice synergy.
>>
>> I totally agree that regions aren't for everyone though. Hence, I made 
>> them an optional feature and by default regions are disabled. In order 
>> to use them drm_gpuva_manager_init() must be called with the 
>> DRM_GPUVA_MANAGER_REGIONS feature flag.
>>
>> I really would not want to open code regions or have two GPUVA manager 
>> instances in nouveau to track sparse page tables. That would be really 
>> messy, hence I hope we can agree on this to be an optional feature.
> 
> I absolutely don't think that this is a good idea then. This separate 
> handling of sparse page tables is completely Nouveau specific.

Actually, I rely on what you said in a previous mail when I say it's, 
potentially, not specific to nouveau.

<cite>
This sounds similar to what AMD hw used to have up until gfx8 (I think), 
basically sparse resources where defined through a separate mechanism to 
the address resolution of the page tables. I won't rule out that other 
hardware has similar approaches.
</cite>

> 
> Even when it's optional feature mixing this into the common handling is 
> exactly what I pointed out as not properly separating between hardware 
> specific and hardware agnostic functionality.

Optionally having regions is *not* a hardware specific concept, drivers 
might use it for a hardware specific purpose though. Which potentially 
is is the case for almost every DRM helper.

Drivers can use regions only for the sake of not merging between buffer 
boundaries as well. Some drivers might prefer this over "never merge" or 
"always merge", depending on the cost of re-organizing page tables for 
unnecessary splits/merges, without having the need of tracking separate 
sparse page tables.

Its just that I think *if* a driver needs to track separate sparse page 
tables anyways its a nice synergy since then there is no extra cost for 
getting this optimization.

> 
> This is exactly the problem we ran into with TTM as well and I've spend 
> a massive amount of time to clean that up again. >

Admittedly, I don't know what problems you are referring to. However, I 
don't see which kind of trouble it could cause by allowing drivers to 
track regions optionally.

> Regards,
> Christian.
> 
>>
>>>
>>> I don't really see a need for them any more.
>>>
>>> Regards,
>>> Christian.
>>>
>>
> 

