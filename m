Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2921973A4E8
	for <lists+nouveau@lfdr.de>; Thu, 22 Jun 2023 17:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9505110E589;
	Thu, 22 Jun 2023 15:28:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A8710E589
 for <nouveau@lists.freedesktop.org>; Thu, 22 Jun 2023 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687447679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFIsSMz1YrVeTt7yDPVdtnp2v+t72OcBanmN5WVCEzY=;
 b=SivknS5WsEZQZ1FSrhU+F5ViBKQUvDTtjrnX67U425BnauzMS5gUhaSGRgUmmAvc/9b1+a
 nQT1/xg9Zd8AEYQiLXUc1Svf0du9fjv+jRXZxn4GZ3HqxX4CkRRxpVZ56kKaMyDd8XBuuN
 8Rm8Li/bQbCPhFtjOSnybmvK4ha9N/k=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-NiPN4F4jP4GA9U6SAL0rAQ-1; Thu, 22 Jun 2023 11:27:57 -0400
X-MC-Unique: NiPN4F4jP4GA9U6SAL0rAQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1b52fd9bf64so5795135ad.1
 for <nouveau@lists.freedesktop.org>; Thu, 22 Jun 2023 08:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687447677; x=1690039677;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFIsSMz1YrVeTt7yDPVdtnp2v+t72OcBanmN5WVCEzY=;
 b=YlfLc+ZrR5dXjA1rWuHHlvNS/KGJBkI4FXaOkWz1vRcZbxRRf8rhDzxQeL+nYer+er
 HVCSAQhWvW0LprT38ojeSJQx8V8zbAel4BjPNaJOvnUzRzJvmkdT57Gz8fy2dVMXYFqi
 kd2TqKsBTVBS7FWfK/eVcIWi1OlDzQ3P3iShSeaKctz//faLewre6CbzAq0hsG4O14A+
 P9F56y8vJQ9H5EAWXw05sDCLIt3Ct6TGW5rrxT3k8IMtNIMU4qr83a+cKJQqkjBihS/a
 yx0Xo/Pk49aQRrJMN3cDhDhYcrRCWkKLBz/V5Vq+iXL3zT1lfsRyNLmxsG8RsKvLR8FA
 GICQ==
X-Gm-Message-State: AC+VfDwjhOUnMHDfRq++Oa4hW/bMxJr494UpC27XR4SkUQ6tEeqZM8ox
 /skNZptPK5t4gorAuLjSlraNwgrCYVMpFN3PWE0Sr4+L7Bomq0R6c7LOTUZ5YNqkaroodddGKrT
 9h5IKzc514uMVSjQs+ZPFljSDsA==
X-Received: by 2002:a17:902:db04:b0:1b6:4bc2:74bc with SMTP id
 m4-20020a170902db0400b001b64bc274bcmr17127844plx.2.1687447676707; 
 Thu, 22 Jun 2023 08:27:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PkQD22nPF+PfRaRoeULgNWsV6z57goWT8b9vZTIr4iVPlbcuRSq0potrkLL5dqoW80YN4ig==
X-Received: by 2002:a17:902:db04:b0:1b6:4bc2:74bc with SMTP id
 m4-20020a170902db0400b001b64bc274bcmr17127817plx.2.1687447676288; 
 Thu, 22 Jun 2023 08:27:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a170902eb0a00b001b6a241b671sm2713367plb.271.2023.06.22.08.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 08:27:55 -0700 (PDT)
Message-ID: <fb1e5234-b9a5-ba45-1706-81f4cee45274@redhat.com>
Date: Thu, 22 Jun 2023 17:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620112540.19142ef3@collabora.com>
 <94adfd82-e77d-f99c-1d94-8b6397d39310@redhat.com>
 <20230622150101.229391e5@collabora.com>
 <b04b3dbb-0509-fec1-4e8e-90f724443836@redhat.com>
 <20230622171931.1c46f745@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230622171931.1c46f745@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-next v5 00/14] [RFC] DRM GPUVA Manager &
 Nouveau VM_BIND UAPI
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
 bskeggs@redhat.com, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 6/22/23 17:19, Boris Brezillon wrote:
> Hi Danilo,
> 
> On Thu, 22 Jun 2023 15:58:23 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> Hi Boris,
>>
>> On 6/22/23 15:01, Boris Brezillon wrote:
>>> Hi Danilo,
>>>
>>> On Tue, 20 Jun 2023 14:46:07 +0200
>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>    
>>>>> The only thing I'm worried about is the 'sync mapping requests have to
>>>>> go through the async path and wait for all previous async requests to
>>>>> be processed' problem I mentioned in one of your previous submission,
>>>>> but I'm happy leave that for later.
>>>>
>>>> Yes, I'm aware of this limitation.
>>>>
>>>> Let me quickly try to explain where this limitation comes from and how I
>>>> intend to address it.
>>>>
>>>> In order to be able to allocate the required page tables for a mapping
>>>> request and in order to free corresponding page tables once the (async)
>>>> job finished I need to know the corresponding sequence of operations
>>>> (drm_gpuva_ops) to fulfill the mapping request.
>>>>
>>>> This requires me to update the GPUVA space in the ioctl() rather than in
>>>> the async stage, because otherwise I would need to wait for previous
>>>> jobs to finish before being able to submit subsequent jobs to the job
>>>> queue, since I need an up to date view of the GPUVA space in order to
>>>> calculate the sequence of operations to fulfill a mapping request.
>>>>
>>>> As a consequence all jobs need to be processed in the order they were
>>>> submitted, including synchronous jobs.
>>>>
>>>> @Matt: I think you will have the same limitation with synchronous jobs
>>>> as your implementation in XE should be similar?
>>>>
>>>> In order to address it I want to switch to using callbacks rather than
>>>> 'pre-allocated' drm_gpuva_ops and update the GPUVA space within the
>>>> asynchronous stage.
>>>> This would allow me to 'fit' synchronous jobs
>>>> between jobs waiting in the async job queue. However, to do this I have
>>>> to re-work how the page table handling in Nouveau is implemented, since
>>>> this would require me to be able to manage the page tables without
>>>> knowing the exact sequence of operations to fulfill a mapping request.
>>>
>>> Ok, so I think that's more or less what we're trying to do right
>>> now in PowerVR.
>>>
>>> - First, we make sure we reserve enough MMU page tables for a given map
>>>     operation to succeed no matter the VM state in the VM_BIND job
>>>     submission path (our VM_BIND ioctl). That means we're always
>>>     over-provisioning and returning unused memory back when the operation
>>>     is done if we end up using less memory.
>>> - We pre-allocate for the mapple-tree insertions.
>>> - Then we map using drm_gpuva_sm_map() and the callbacks we provided in
>>>     the drm_sched::run_job() path. We guarantee that no memory is
>>>     allocated in that path thanks to the pre-allocation/reservation we've
>>>     done at VM_BIND job submission time.
>>>
>>> The problem I see with this v5 is that:
>>>
>>> 1/ We now have a dma_resv_lock_held() in drm_gpuva_{link,unlink}(),
>>>      which, in our case, is called in the async drm_sched::run_job() path,
>>>      and we don't hold the lock in that path (it's been released just
>>>      after the job submission).
>>
>> My solution to this, as by now, is to - in the same way we pre-allocate
>> - to just pre-link and pre-unlink. And then fix things up in the cleanup
>> path.
>>
>> However, depending on the driver, this might require you to set a flag
>> in the driver specific structure (embedding struct drm_gpuva) whether
>> the gpuva is actually mapped (as in has active page table entries).
>> Maybe we could also just add such a flag to struct drm_gpuva. But yeah,
>> doesn't sound too nice to be honest...
>>
>>> 2/ I'm worried that Liam's plan to only reserve what's actually needed
>>>      based on the mapple tree state is going to play against us, because
>>>      the mapple-tree is only modified at job exec time, and we might have
>>>      several unmaps happening between the moment we created and queued the
>>>      jobs, and the moment they actually get executed, meaning the
>>>      mapple-tree reservation might no longer fit the bill.
>>
>> Yes, I'm aware and I explained to Liam in detail why we need the
>> mas_preallocate_worst_case() way of doing it.
>>
>> See this mail:
>> https://lore.kernel.org/nouveau/68cd25de-e767-725e-2e7b-703217230bb0@redhat.com/T/#ma326e200b1de1e3c9df4e9fcb3bf243061fee8b5
>>
>> He hasn't answered yet, but I hope we can just get (or actually keep)
>> such a function (hopefully with better naming), since it shouldn't
>> interfere with anything else.
> 
> My bad, I started reading your reply and got interrupted. Never got
> back to it, which I should definitely have done before posting my
> questions. Anyway, glad to hear we're on the same page regarding the
> mas_preallocate_worst_case() thing.

No worries, I should probably also reply to Liams patch introducing the 
change. I will do that in a minute.

> 
>>
>>>
>>> For issue #1, it shouldn't be to problematic if we use a regular lock to
>>> insert to/remove from the GEM gpuva list.
>>
>> Yes, that's why I had a separate GEM gpuva list lock in the first place.
>> However, this doesn't really work when generating ops rather than using
>> the callback interface.
>>
>> Have a look at drm_gpuva_gem_unmap_ops_create() requested by Matt for
>> XE. This function generates drm_gpuva_ops to unmap all mappings of a
>> given GEM. In order to do that the function must iterate the GEM's gpuva
>> list and allocate operations for each mapping. As a consequence the
>> gpuva list lock wouldn't be allowed to be taken in the fence signalling
>> path (run_job()) any longer. Hence, we can just protect the list with
>> the GEM's dma-resv lock.
> 
> Yeah, I see why using dma_resv when pre-inserting the mapping is
> useful, it just didn't really work with late mapping insertion.
> 
>>
>> However, I can understand that it might be inconvenient for the callback
>> interface and admittedly my solution to that isn't that nice as well.
>> Hence the following idea:
>>
>> For drivers to be able to use their own lock for that it would be enough
>> to get rid of the lockdep checks. We could just add a flag to the GPUVA
>> manager to let the driver indicate it wants to do it's own locking for
>> the GPUVA list and skip the lockdep checks for the dma-resv lock in that
>> case.
> 
> Sounds good to me.

I think it's way better than the pre-link / pre-unlink mess. I will add 
this to v6.

> 
>>
>>>
>>> For issue #2, I can see a way out if, instead of freeing gpuva nodes,
>>> we flag those as unused when we see that something happening later in
>>> the queue is going to map a section being unmapped. All of this implies
>>> keeping access to already queued VM_BIND jobs (using the spsc queue at
>>> the entity level is not practical), and iterating over them every time
>>> a new sync or async job is queued to flag what needs to be retained. It
>>> would obviously be easier if we could tell the mapple-tree API
>>> 'provision as if the tree was empty', so all we have to do is just
>>> over-provision for both the page tables and mapple-tree insertion, and
>>> free the unused mem when the operation is done.
>>>
>>> Don't know if you already thought about that and/or have solutions to
>>> solve these issues.
>>
>> As already mentioned above, I'd just expect we can keep it the
>> over-provision way, as you say. I think it's a legit use case to not
>> know the state of the maple tree at the time the pre-allocated nodes
>> will be used and keeping that should not interfere with Liams plan to
>> (hopefully separately) optimize for the pre-allocation use case they
>> have within -mm.
>>
>> But let's wait for his take on that.
> 
> Sure. As I said, I'm fine getting this version merged, we can sort out
> the changes needed for PowerVR later. Just thought I'd mention those
> issues early, so you're not surprised when we come back with crazy
> requests (which apparently are not that crazy ;-)).

They're not crazy at all, in fact they entirely represent what the 
callback interface was designed for. :-)

- Danilo

> 
> Regards,
> 
> Boris
> 

