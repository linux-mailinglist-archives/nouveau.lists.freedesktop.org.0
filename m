Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4A6A0C68
	for <lists+nouveau@lfdr.de>; Thu, 23 Feb 2023 16:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36FC10E02E;
	Thu, 23 Feb 2023 15:01:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A19A10E02E
 for <nouveau@lists.freedesktop.org>; Thu, 23 Feb 2023 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677164506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9OY3DOmsttxoPAiFSmCq7gtwaYekEfHfeSsFmsCyrY=;
 b=BiPImrSZC7ZWJy+Q0kpj+4UOl3hYYavOk/yUQ8+IOL21EgN0EC6ukutpbueKwDTpKV820c
 7KMwOd4zKk7VvW8cQ37D/OuAJbXD+ElNcVs08MMkwX+yzmf+NHFNbxU8TadwCmu+P+wSQM
 jIwdPKLif4OFvBypBh52vBWK6S4icbo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-8Q6TlO34Oa6U0BH_tw28qw-1; Thu, 23 Feb 2023 10:01:45 -0500
X-MC-Unique: 8Q6TlO34Oa6U0BH_tw28qw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r6-20020aa7c146000000b004acd97105ffso15486523edp.19
 for <nouveau@lists.freedesktop.org>; Thu, 23 Feb 2023 07:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k9OY3DOmsttxoPAiFSmCq7gtwaYekEfHfeSsFmsCyrY=;
 b=a1p9i58WwPG7f5Tej8goUhyTdVDuLWJdSKzY3br//UalkWwNHjp8k+7BoT6GPgumdm
 fCSdZfcBzIMALSxZi/qUchqcVfC87kR46DjeiCKpUleEPGOIBO5YmQNwX6lT5qslzDvA
 2E7kJYlabCPRV2HNWz5oAAugGcOne+fmp7ta8uPQWzhbW/n2UfaZP+59rP8jqi9H5PkM
 UUb/jr9Uova5eSKpkyVHjN98u34DNB3lWGQgct2sVJPV51MMSVn5ycl3RdC/2rBDk/ZG
 jLAMSZMvLwOkui/yn/ZJA+ZqJEAsF1GHm8W71sD/LyWBoDK/EYsrCSvjYEP5LOPvU8qw
 IegQ==
X-Gm-Message-State: AO0yUKXt+CfWVHoZP7fzOtu8ewvKXNdffiFFQl9KFImdv0Z3MhJcfi9z
 UL+xOrTgC3ZW3VZ8repr1iqtch25UIqx/qlu0ZT35gk7NsYdJFYdmm7veONhK39H1MqqZTQxPix
 S/u8eOxs0xEQ4G0MOK4VP1WJe0Q==
X-Received: by 2002:a17:907:3e22:b0:8e3:8543:8e71 with SMTP id
 hp34-20020a1709073e2200b008e385438e71mr11141667ejc.40.1677164503839; 
 Thu, 23 Feb 2023 07:01:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9x3TEkF4rjKsOMblKg8nB91RIygBy/qyspdCpvJfYp5Ifo24giDUJ/K+JxqZGl9KaboO5b6g==
X-Received: by 2002:a17:907:3e22:b0:8e3:8543:8e71 with SMTP id
 hp34-20020a1709073e2200b008e385438e71mr11141608ejc.40.1677164503488; 
 Thu, 23 Feb 2023 07:01:43 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906260700b008b8ae79a72bsm7650214ejc.135.2023.02.23.07.01.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:01:42 -0800 (PST)
Message-ID: <734e3c77-a536-95ca-bcae-1e1e86940a48@redhat.com>
Date: Thu, 23 Feb 2023 15:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
 <cc8eeaf4-31e7-98e4-a712-012fc604e985@redhat.com>
 <29ea3705-5634-c204-c1da-d356b6dfbafc@amd.com>
 <83755119-083d-7d66-fca0-ca306c841d9c@redhat.com>
 <7780a9b9-d6bd-6f3f-9c31-aafacb09db1f@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <7780a9b9-d6bd-6f3f-9c31-aafacb09db1f@amd.com>
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

On 2/23/23 08:06, Christian König wrote:
> Am 22.02.23 um 17:40 schrieb Danilo Krummrich:
>> On 2/22/23 16:14, Christian König wrote:
>>> Am 22.02.23 um 16:07 schrieb Danilo Krummrich:
>>>> On 2/22/23 11:25, Christian König wrote:
>>>>> Am 17.02.23 um 14:44 schrieb Danilo Krummrich:
>>>>
>>>> <snip>
>>>>
>>>>>> +/**
>>>>>> + * DOC: Overview
>>>>>> + *
>>>>>> + * The DRM GPU VA Manager, represented by struct 
>>>>>> drm_gpuva_manager keeps track
>>>>>> + * of a GPU's virtual address (VA) space and manages the 
>>>>>> corresponding virtual
>>>>>> + * mappings represented by &drm_gpuva objects. It also keeps 
>>>>>> track of the
>>>>>> + * mapping's backing &drm_gem_object buffers.
>>>>>> + *
>>>>>> + * &drm_gem_object buffers maintain a list (and a corresponding 
>>>>>> list lock) of
>>>>>> + * &drm_gpuva objects representing all existent GPU VA mappings 
>>>>>> using this
>>>>>> + * &drm_gem_object as backing buffer.
>>>>>> + *
>>>>>> + * If the &DRM_GPUVA_MANAGER_REGIONS feature is enabled, a GPU VA 
>>>>>> mapping can
>>>>>> + * only be created within a previously allocated 
>>>>>> &drm_gpuva_region, which
>>>>>> + * represents a reserved portion of the GPU VA space. GPU VA 
>>>>>> mappings are not
>>>>>> + * allowed to span over a &drm_gpuva_region's boundary.
>>>>>> + *
>>>>>> + * GPU VA regions can also be flagged as sparse, which allows 
>>>>>> drivers to create
>>>>>> + * sparse mappings for a whole GPU VA region in order to support 
>>>>>> Vulkan
>>>>>> + * 'Sparse Resources'.
>>>>>
>>>>> Well since we have now found that there is absolutely no technical 
>>>>> reason for having those regions could we please drop them?
>>>>
>>>> I disagree this was the outcome of our previous discussion.
>>>>
>>>> In nouveau I still need them to track the separate sparse page 
>>>> tables and, as you confirmed previously, Nvidia cards are not the 
>>>> only cards supporting this feature.
>>>>
>>>> The second reason is that with regions we can avoid merging between 
>>>> buffers, which saves some effort. However, I agree that this 
>>>> argument by itself probably doesn't hold too much, since you've 
>>>> pointed out in a previous mail that:
>>>>
>>>> <cite>
>>>> 1) If we merge and decide to only do that inside certain boundaries 
>>>> then those boundaries needs to be provided and checked against. This 
>>>> burns quite some CPU cycles
>>>>
>>>> 2) If we just merge what we can we might have extra page table 
>>>> updates which cost time and could result in undesired side effects.
>>>>
>>>> 3) If we don't merge at all we have additional housekeeping for the 
>>>> mappings and maybe hw restrictions.
>>>> </cite>
>>>>
>>>> However, if a driver uses regions to track its separate sparse page 
>>>> tables anyway it gets 1) for free, which is a nice synergy.
>>>>
>>>> I totally agree that regions aren't for everyone though. Hence, I 
>>>> made them an optional feature and by default regions are disabled. 
>>>> In order to use them drm_gpuva_manager_init() must be called with 
>>>> the DRM_GPUVA_MANAGER_REGIONS feature flag.
>>>>
>>>> I really would not want to open code regions or have two GPUVA 
>>>> manager instances in nouveau to track sparse page tables. That would 
>>>> be really messy, hence I hope we can agree on this to be an optional 
>>>> feature.
>>>
>>> I absolutely don't think that this is a good idea then. This separate 
>>> handling of sparse page tables is completely Nouveau specific.
>>
>> Actually, I rely on what you said in a previous mail when I say it's, 
>> potentially, not specific to nouveau.
>>
>> <cite>
>> This sounds similar to what AMD hw used to have up until gfx8 (I 
>> think), basically sparse resources where defined through a separate 
>> mechanism to the address resolution of the page tables. I won't rule 
>> out that other hardware has similar approaches.
>> </cite>
> 
> Ok, sounds like I didn't made my point here clear: AMD does have that 
> same mechanism for older hw you try to implement here for Nouveau, but 
> we have *abandoned* it because it is to much trouble and especially 
> overhead to support! In other words we have said "Ok we would need two 
> separate components to cleanly handle that, one for newer hw and one for 
> older hw.".

My point was more about the potential existence of other hardware having 
similar concepts.

I, personally, can't judge whether actually making use of having 
separate sparse page tables (or similar concepts) makes sense for other 
drivers or not. I think it depends on how the hardware works, which 
limitations it has in handling page tables, etc.

I definitely recognize your experience and that for AMD you decided its 
not worth using a similar mechanism. I would definitely be interested in 
the details. Do you mind sharing them?

However, I think we need to differentiate between whether for AMD 
hardware you just found an approach that worked out better for your 
specific hardware or whether something is fundamentally broken with 
separate sparse page tables (or similar concepts) in general.

Do you think there is something fundamentally broken with such an 
approach? And if so, why?

> 
> What you now try to do is to write one component which works for both. 
> We have already exercised this idea and came to the conclusion that it's 
> not a good path to go down. So you're basically just repeating our mistake.
> 
> I mean if it's just for Nouveau then I would say feel free to do 
> whatever you want, but since this component is supposed to be used by 
> more drivers then I strongly think we need to tackle this from a 
> different side.
> 
>>> Even when it's optional feature mixing this into the common handling 
>>> is exactly what I pointed out as not properly separating between 
>>> hardware specific and hardware agnostic functionality.
>>
>> Optionally having regions is *not* a hardware specific concept, 
>> drivers might use it for a hardware specific purpose though. Which 
>> potentially is is the case for almost every DRM helper.
>>
>> Drivers can use regions only for the sake of not merging between 
>> buffer boundaries as well. Some drivers might prefer this over "never 
>> merge" or "always merge", depending on the cost of re-organizing page 
>> tables for unnecessary splits/merges, without having the need of 
>> tracking separate sparse page tables.
>>
>> Its just that I think *if* a driver needs to track separate sparse 
>> page tables anyways its a nice synergy since then there is no extra 
>> cost for getting this optimization.
> 
> Well exactly that's the point: I really don't believe that this comes 
> without extra costs.

If you already have to store some information for purpose A and an 
optional purpose B requires the exact same information you would get B 
for free.

Which other costs would you see here?

> 
> What we could maybe do is to have an two separate functions, one for 
> updating the data structures and one for merging. When you now call the 
> merging function with a limit you don't get mappings merged over that 
> limit and if you don't call the merging function at all you don't get 
> merges.

Having a separate merging function would work. However, I am against an 
interface that takes limit parameters. Having such an interface signals 
general compliance with tracking regions to drivers, but without the 
offer to do this job in a generic way.

This sounds like a bad compromise to me. I think we should either accept 
that some drivers might have a purpose of tracking regions and hence 
*optionally* support them or have clear evidence that tracking regions 
never ever make sense at all regardless of how a specific hardware 
handles it's page tables.

Allowing drivers to set the merge strategy, however, is a good idea. I 
could also just add corresponding feature flags to let the driver pick.

> 
> But we should have definitely not have the tracking of the ranges inside 
> the common component. This is something separated.
> 
>>> This is exactly the problem we ran into with TTM as well and I've 
>>> spend a massive amount of time to clean that up again. >
>>
>> Admittedly, I don't know what problems you are referring to. However, 
>> I don't see which kind of trouble it could cause by allowing drivers 
>> to track regions optionally.
> 
> Take a look at my 2020 presentation about TTM on FOSDEM.
> 
> Regards,
> Christian.
> 
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>>
>>>>> I don't really see a need for them any more.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>
>>>
>>
> 

