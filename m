Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64D46800E8
	for <lists+nouveau@lfdr.de>; Sun, 29 Jan 2023 19:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3ED10E097;
	Sun, 29 Jan 2023 18:46:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C114D10E095
 for <nouveau@lists.freedesktop.org>; Sun, 29 Jan 2023 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675017976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FGqui2yJVl67vUqFftULx0MZZxFm49n7kuYQziRF0oA=;
 b=JqTCjaTzAl4E6RqkpSsdsPACdPSd/55bfTKUs9kwNKsWzDqghKkICTrVmk9kTJA/gEzoJd
 ycDAhyvOqa3zCqqwj8fuks/lAy9jGy2l46AOjvPrPc+nNAZyZVd17nYDVSrcVrOyvSeTcs
 Rv26IcOPBhID7ecXD+E4MPLWLa3JQu0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-hTkvg0EeNlScowJNmOqSiQ-1; Sun, 29 Jan 2023 13:46:13 -0500
X-MC-Unique: hTkvg0EeNlScowJNmOqSiQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 xh12-20020a170906da8c00b007413144e87fso5971573ejb.14
 for <nouveau@lists.freedesktop.org>; Sun, 29 Jan 2023 10:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGqui2yJVl67vUqFftULx0MZZxFm49n7kuYQziRF0oA=;
 b=Fcl8A1PZy2C5uFsv0+GKmAoJtQdyTPFRwK6I14HuOKgYTeqA8YezoXbAsepaHVAWeo
 EBmD01PYrJAUB/lbtkgu98rXdy16IuUel+3IIJFw8EgCQU5aU7ykL51mDcbzxTK2aqYY
 MRroLhmTqucbpwKokEZ8iUafQpFY9nAmXDdcFOxPV48Ea1SUH/qSTBsJjesrGFaKBXPH
 LE9OmFk2afmdL1p9Hbni3pqs7g5KaRuAS6eUsHpSlMod0HBd+z2AJVPJJ9YSd5EcDJZy
 VMgQrGWpL5G3Vjyno8Son3ZGM/gcu+OWqt9+I8Kam1ZUDMP4/7Gjzszmv5bp6P+paT0b
 cQUg==
X-Gm-Message-State: AO0yUKUibRV/sq+XyFQNRnU8IyesqIg1ux4f3h778GHQjppqM/mfwba+
 /JIT6JKA0TPfzzVXShANXqjJlxYFId/dV2YXCFAS3CGatT1LibVm+FMYdA7c4wryLBmUa3ioONy
 MXghV9yNTtxIambJh3sNgrhPv5A==
X-Received: by 2002:a17:906:5792:b0:888:bb84:7a73 with SMTP id
 k18-20020a170906579200b00888bb847a73mr945615ejq.56.1675017971822; 
 Sun, 29 Jan 2023 10:46:11 -0800 (PST)
X-Google-Smtp-Source: AK7set936ZIrljCHqMxPmanAmRijdyfd9i2ExBw6Yb1aIfJ/AJPLn2133gINWsu8wFjQzy2t/mUa8Q==
X-Received: by 2002:a17:906:5792:b0:888:bb84:7a73 with SMTP id
 k18-20020a170906579200b00888bb847a73mr945584ejq.56.1675017971411; 
 Sun, 29 Jan 2023 10:46:11 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 va17-20020a17090711d100b00876479361edsm5772600ejb.149.2023.01.29.10.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 10:46:10 -0800 (PST)
Message-ID: <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
Date: Sun, 29 Jan 2023 19:46:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Danilo Krummrich <dakr@redhat.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
Organization: RedHat
In-Reply-To: <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
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
Cc: daniel@ffwll.ch, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, mripard@kernel.org,
 bskeggs@redhat.com, jason@jlekstrand.net, nouveau@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On 1/27/23 22:09, Danilo Krummrich wrote:
> On 1/27/23 16:17, Christian König wrote:
>> Am 27.01.23 um 15:44 schrieb Danilo Krummrich:
>>> [SNIP]
>>>>>>
>>>>>> What you want is one component for tracking the VA allocations 
>>>>>> (drm_mm based) and a different component/interface for tracking 
>>>>>> the VA mappings (probably rb tree based).
>>>>>
>>>>> That's what the GPUVA manager is doing. There are gpuva_regions 
>>>>> which correspond to VA allocations and gpuvas which represent the 
>>>>> mappings. Both are tracked separately (currently both with a 
>>>>> separate drm_mm, though). However, the GPUVA manager needs to take 
>>>>> regions into account when dealing with mappings to make sure the 
>>>>> GPUVA manager doesn't propose drivers to merge over region 
>>>>> boundaries. Speaking from userspace PoV, the kernel wouldn't merge 
>>>>> mappings from different VKBuffer objects even if they're virtually 
>>>>> and physically contiguous.
>>>>
>>>> That are two completely different things and shouldn't be handled in 
>>>> a single component.
>>>
>>> They are different things, but they're related in a way that for 
>>> handling the mappings (in particular merging and sparse) the GPUVA 
>>> manager needs to know the VA allocation (or region) boundaries.
>>>
>>> I have the feeling there might be a misunderstanding. Userspace is in 
>>> charge to actually allocate a portion of VA space and manage it. The 
>>> GPUVA manager just needs to know about those VA space allocations and 
>>> hence keeps track of them.
>>>
>>> The GPUVA manager is not meant to be an allocator in the sense of 
>>> finding and providing a hole for a given request.
>>>
>>> Maybe the non-ideal choice of using drm_mm was implying something else.
>>
>> Uff, well long story short that doesn't even remotely match the 
>> requirements. This way the GPUVA manager won't be usable for a whole 
>> bunch of use cases.
>>
>> What we have are mappings which say X needs to point to Y with this 
>> and hw dependent flags.
>>
>> The whole idea of having ranges is not going to fly. Neither with AMD 
>> GPUs and I strongly think not with Intels XA either.
> 
> A range in the sense of the GPUVA manager simply represents a VA space 
> allocation (which in case of Nouveau is taken in userspace). Userspace 
> allocates the portion of VA space and lets the kernel know about it. The 
> current implementation needs that for the named reasons. So, I think 
> there is no reason why this would work with one GPU, but not with 
> another. It's just part of the design choice of the manager.
> 
> And I'm absolutely happy to discuss the details of the manager 
> implementation though.
> 
>>
>>>> We should probably talk about the design of the GPUVA manager once 
>>>> more when this should be applicable to all GPU drivers.
>>>
>>> That's what I try to figure out with this RFC, how to make it 
>>> appicable for all GPU drivers, so I'm happy to discuss this. :-)
>>
>> Yeah, that was really good idea :) That proposal here is really far 
>> away from the actual requirements.
>>
> 
> And those are the ones I'm looking for. Do you mind sharing the 
> requirements for amdgpu in particular?
> 
>>>>> For sparse residency the kernel also needs to know the region 
>>>>> boundaries to make sure that it keeps sparse mappings around.
>>>>
>>>> What?
>>>
>>> When userspace creates a new VKBuffer with the 
>>> VK_BUFFER_CREATE_SPARSE_BINDING_BIT the kernel may need to create 
>>> sparse mappings in order to ensure that using this buffer without any 
>>> memory backed mappings doesn't fault the GPU.
>>>
>>> Currently, the implementation does this the following way:
>>>
>>> 1. Userspace creates a new VKBuffer and hence allocates a portion of 
>>> the VA space for it. It calls into the kernel indicating the new VA 
>>> space region and the fact that the region is sparse.
>>>
>>> 2. The kernel picks up the region and stores it in the GPUVA manager, 
>>> the driver creates the corresponding sparse mappings / page table 
>>> entries.
>>>
>>> 3. Userspace might ask the driver to create a couple of memory backed 
>>> mappings for this particular VA region. The GPUVA manager stores the 
>>> mapping parameters, the driver creates the corresponding page table 
>>> entries.
>>>
>>> 4. Userspace might ask to unmap all the memory backed mappings from 
>>> this particular VA region. The GPUVA manager removes the mapping 
>>> parameters, the driver cleans up the corresponding page table 
>>> entries. However, the driver also needs to re-create the sparse 
>>> mappings, since it's a sparse buffer, hence it needs to know the 
>>> boundaries of the region it needs to create the sparse mappings in.
>>
>> Again, this is not how things are working. First of all the kernel 
>> absolutely should *NOT* know about those regions.
>>
>> What we have inside the kernel is the information what happens if an 
>> address X is accessed. On AMD HW this can be:
>>
>> 1. Route to the PCIe bus because the mapped BO is stored in system 
>> memory.
>> 2. Route to the internal MC because the mapped BO is stored in local 
>> memory.
>> 3. Route to other GPUs in the same hive.
>> 4. Route to some doorbell to kick of other work.
>> ...
>> x. Ignore write, return 0 on reads (this is what is used for sparse 
>> mappings).
>> x+1. Trigger a recoverable page fault. This is used for things like SVA.
>> x+2. Trigger a non-recoverable page fault. This is used for things 
>> like unmapped regions where access is illegal.
>>
>> All this is plus some hw specific caching flags.
>>
>> When Vulkan allocates a sparse VKBuffer what should happen is the 
>> following:
>>
>> 1. The Vulkan driver somehow figures out a VA region A..B for the 
>> buffer. This can be in userspace (libdrm_amdgpu) or kernel (drm_mm), 
>> but essentially is currently driver specific.
> 
> Right, for Nouveau we have this in userspace as well.
> 
>>
>> 2. The kernel gets a request to map the VA range A..B as sparse, 
>> meaning that it updates the page tables from A..B with the sparse 
>> setting.
>>
>> 3. User space asks kernel to map a couple of memory backings at 
>> location A+1, A+10, A+15 etc....
>>
>> 4. The VKBuffer is de-allocated, userspace asks kernel to update 
>> region A..B to not map anything (usually triggers a non-recoverable 
>> fault).
> 
> Until here this seems to be identical to what I'm doing.
> 
> It'd be interesting to know how amdgpu handles everything that 
> potentially happens between your 3) and 4). More specifically, how are 
> the page tables changed when memory backed mappings are mapped on a 
> sparse range? What happens when the memory backed mappings are unmapped, 
> but the VKBuffer isn't de-allocated, and hence sparse mappings need to 
> be re-deployed?
> 
> Let's assume the sparse VKBuffer (and hence the VA space allocation) is 
> pretty large. In Nouveau the corresponding PTEs would have a rather huge 
> page size to cover this. Now, if small memory backed mappings are mapped 
> to this huge sparse buffer, in Nouveau we'd allocate a new PT with a 
> corresponding smaller page size overlaying the sparse mappings PTEs.
> 
> How would this look like in amdgpu?
> 
>>
>> When you want to unify this between hw drivers I strongly suggest to 
>> completely start from scratch once more.
>>

I just took some time digging into amdgpu and, surprisingly, aside from 
the gpuva_regions it seems like amdgpu basically does exactly the same 
as I do in the GPU VA manager. As explained, those region boundaries are 
needed for merging only and, depending on the driver, might be useful 
for sparse mappings.

For drivers that don't intend to merge at all and (somehow) are capable 
of dealing with sparse regions without knowing the sparse region's 
boundaries, it'd be easy to make those gpuva_regions optional.

>> First of all don't think about those mappings as VMAs, that won't work 
>> because VMAs are usually something large. Think of this as individual 
>> PTEs controlled by the application. similar how COW mappings and 
>> struct pages are handled inside the kernel.
> 
> Why do you consider tracking single PTEs superior to tracking VMAs? All 
> the properties for a page you mentioned above should be equal for the 
> entirety of pages of a whole (memory backed) mapping, aren't they?
> 
>>
>> Then I would start with the VA allocation manager. You could probably 
>> base that on drm_mm. We handle it differently in amdgpu currently, but 
>> I think this is something we could change.
> 
> It was not my intention to come up with an actual allocator for the VA 
> space in the sense of actually finding a free and fitting hole in the VA 
> space.
> 
> For Nouveau (and XE, I think) we have this in userspace and from what 
> you've written previously I thought the same applies for amdgpu?
> 
>>
>> Then come up with something close to the amdgpu VM system. I'm pretty 
>> sure that should work for Nouveau and Intel XA as well. In other words 
>> you just have a bunch of very very small structures which represents 
>> mappings and a larger structure which combine all mappings of a 
>> specific type, e.g. all mappings of a BO or all sparse mappings etc...
> 
> Considering what you wrote above I assume that small structures / 
> mappings in this paragraph refer to PTEs.
> 
> Immediately, I don't really see how this fine grained resolution of 
> single PTEs would help implementing this in Nouveau. Actually, I think 
> it would even complicate the handling of PTs, but I would need to think 
> about this a bit more.
> 
>>
>> Merging of regions is actually not mandatory. We don't do it in amdgpu 
>> and can live with the additional mappings pretty well. But I think 
>> this can differ between drivers.
>>
>> Regards,
>> Christian.
>>

