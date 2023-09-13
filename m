Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BBD79E76A
	for <lists+nouveau@lfdr.de>; Wed, 13 Sep 2023 14:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A2C10E4A5;
	Wed, 13 Sep 2023 12:01:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1393A10E4A5
 for <nouveau@lists.freedesktop.org>; Wed, 13 Sep 2023 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694606476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hYG/a4t3UUL3Vg4BBIneH5+8bciI8LQrZr4sB9iAJfs=;
 b=L/pYtlHDt6umDPC8o+uiyupHWKgIaNgZjnuN25idKtz2/aqMH5PHu8u2uJEfR3s9+5fizY
 glckXyksI3919WxBEHtD5d+AX8Ip4T5szgWJ296qxhppqwbt42rdtWY8LaM2CUPkxSKEYX
 GXWpw/qP+nNABNCFsIlHVktwVSKPJo0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-CgvfVJOPNMS9zMpWsWpsMQ-1; Wed, 13 Sep 2023 08:01:14 -0400
X-MC-Unique: CgvfVJOPNMS9zMpWsWpsMQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f7a2b21fdso432323366b.2
 for <nouveau@lists.freedesktop.org>; Wed, 13 Sep 2023 05:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694606473; x=1695211273;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYG/a4t3UUL3Vg4BBIneH5+8bciI8LQrZr4sB9iAJfs=;
 b=r3mzYKinpxY9ddhD2PtexVDEmFlHWqFnLHw7y3NzSg6fZ6UBTY7y/z8cQLtMbkWM8G
 S9ow4/deKuJgXfoo0eX5xIKcr4GWBQxyb0ZzSCWx3t+ZeA8nUml2zXGoYZ/XXxJyXXW0
 pObi0el5WJ5fbvjEu0yJoVQ7GgQNWESB229Htiex/bbsFQ2FHo2ILmCUn0Kf5ZotvpWs
 pdh+ZFJCp9/0zQdhrkqf6YmTpCvajKujKNaIeL8c9T1dHOWPJtp/twH4CO295StAX1fK
 El4/qreiomjtHbcLiCQe1fCUEijjCLnDdhOAreAbENy/kIWLJ8OFdA6NA3RTe/wDGgRK
 l+Qg==
X-Gm-Message-State: AOJu0YyGDDxRxbL1m9cqB4mfMwelwQflRJiMXMdR6mT/aRYQYmVGegML
 +wdePu3f8oK7eZ2oSYeYTYt0oMXv/DMpBr/eXQCMlMpFAfx4EvIThrJYa5of/GZFlJOhwG0uExF
 Mfz5uPM5Q+S7GddLnI4zpc8tK8w==
X-Received: by 2002:a17:906:535d:b0:9a2:c5a:6c9d with SMTP id
 j29-20020a170906535d00b009a20c5a6c9dmr1531270ejo.62.1694606473403; 
 Wed, 13 Sep 2023 05:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCm9r4dlgEx3uEHmGTCUiRp6ZekgmBxqp7iJ7jGaAZgprbGqd+GHpjf+epvbkR6ptxux9ZBg==
X-Received: by 2002:a17:906:535d:b0:9a2:c5a:6c9d with SMTP id
 j29-20020a170906535d00b009a20c5a6c9dmr1531248ejo.62.1694606473037; 
 Wed, 13 Sep 2023 05:01:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170906038a00b0099b76c3041csm8357365eja.7.2023.09.13.05.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 05:01:12 -0700 (PDT)
Message-ID: <7fa7ba28-3568-968d-5cf6-933292082965@redhat.com>
Date: Wed, 13 Sep 2023 14:01:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
 <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
 <20230913091918.62c06a30@collabora.com>
 <df85257a-02ed-4869-2421-0039a9c97db5@linux.intel.com>
 <20230913133318.15edec7c@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230913133318.15edec7c@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, donald.robson@imgtec.com, daniel@ffwll.ch,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

After some more discussion with Boris on IRC, he seems to be willing to drop GPUVM
updates from the async path. If everyone agrees I'm fine to go ahead and drop this
use case for GPUVM.

@Thomas: I will reply to your last mail only considering GPUVM updates from within
the IOCTL.

- Danilo

On 9/13/23 13:33, Boris Brezillon wrote:
> On Wed, 13 Sep 2023 12:39:01 +0200
> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
> 
>> Hi,
>>
>> On 9/13/23 09:19, Boris Brezillon wrote:
>>> On Wed, 13 Sep 2023 17:05:42 +1000
>>> Dave Airlie <airlied@gmail.com> wrote:
>>>   
>>>> On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
>>>> <boris.brezillon@collabora.com> wrote:
>>>>> On Tue, 12 Sep 2023 18:20:32 +0200
>>>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>>>      
>>>>>>> +/**
>>>>>>> + * get_next_vm_bo_from_list() - get the next vm_bo element
>>>>>>> + * @__gpuvm: The GPU VM
>>>>>>> + * @__list_name: The name of the list we're iterating on
>>>>>>> + * @__local_list: A pointer to the local list used to store already iterated items
>>>>>>> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
>>>>>>> + *
>>>>>>> + * This helper is here to provide lockless list iteration. Lockless as in, the
>>>>>>> + * iterator releases the lock immediately after picking the first element from
>>>>>>> + * the list, so list insertion deletion can happen concurrently.
>>>>>> Are the list spinlocks needed for that async state update from within
>>>>>> the dma-fence critical section we've discussed previously?
>>>>> Any driver calling _[un]link() from its drm_gpu_scheduler::run_job()
>>>>> hook will be in this situation (Panthor at the moment, PowerVR soon). I
>>>>> get that Xe and Nouveau don't need that because they update the VM
>>>>> state early (in the ioctl path), but I keep thinking this will hurt us
>>>>> if we don't think it through from the beginning, because once you've
>>>>> set this logic to depend only on resv locks, it will be pretty hard to
>>>>> get back to a solution which lets synchronous VM_BINDs take precedence
>>>>> on asynchronous request, and, with vkQueueBindSparse() passing external
>>>>> deps (plus the fact the VM_BIND queue might be pretty deep), it can
>>>>> take a long time to get your synchronous VM_BIND executed...
>>
>> So this would boil down to either (possibly opt-in) keeping the spinlock
>> approach or pushing the unlink out to a wq then?
> 
> Deferred _unlink() would not be an issue, since I already defer the
> drm_gpuva destruction to a wq, it would just a be a matter of moving the
> _unlink() call there as well. But _link() also takes the GEM gpuva list
> lock, and that one is bit tricky, in that sm_map() can trigger 2 more
> _link() calls for the prev/next mappings, which we can't guess until we
> get to execute the VM update. If we mandate the use of the GEM resv
> lock, that simply means async VM updates (AKA calling
> drm_gpuvm_sm_[un]map()) are not an option. And if this is what everyone
> agrees on, then I'd like the APIs that make this sort of async VM
> update possible (drm_gpuvm_sm_[un]map(), the drm_gpuvm_ops::sm_step*
> methods, and probably other things) to be dropped, so we don't make it
> look like it's something we support.
> 
>> BTW, as also asked in a reply to Danilo, how do you call unlink from
>> run_job() when it was requiring the obj->dma_resv lock, or was that a WIP?
> 
> _unlink() makes sure the GEM gpuva list lock is taken, but this can be
> a custom lock (see drm_gem_gpuva_set_lock()). In panthor we have
> panthor_gem_object::gpuva_list_lock that's dedicated the gpuva list
> protection. We make sure we never take this lock while allocating
> memory to guarantee the dma-signalling path can't deadlock.
> 
>>
>>>>>      
>>>> btw what is the use case for this? do we have actual vulkan
>>>> applications we know will have problems here?
>>> I don't, but I think that's a concern Faith raised at some point (dates
>>> back from when I was reading threads describing how VM_BIND on i915
>>> should work, and I was clearly discovering this whole VM_BIND thing at
>>> that time, so maybe I misunderstood).
>>>   
>>>> it feels like a bit of premature optimisation, but maybe we have use cases.
>>> Might be, but that's the sort of thing that would put us in a corner if
>>> we don't have a plan for when the needs arise. Besides, if we don't
>>> want to support that case because it's too complicated, I'd recommend
>>> dropping all the drm_gpuvm APIs that let people think this mode is
>>> valid/supported (map/remap/unmap hooks in drm_gpuvm_ops,
>>> drm_gpuvm_sm_[un]map helpers, etc). Keeping them around just adds to the
>>> confusion.
>>
>> Xe allows bypassing the bind-queue with another bind-queue, but to
>> completely avoid dependencies between queues the Operations may not
>> overlap.
> 
> So, you check the VM state with some VM lock held (would be the VM resv
> in my case), and if the mapping is new (no overlaps with pre-existing
> mappings), you queue it to the fast-track/sync-VM_BIND queue. What would
> be missing I guess is a way to know if the mapping is active (MMU has
> been updated) or pending (MMU update queued to the bind-queue), so I can
> fast-track mapping/unmapping of active mappings. This would leave
> overlapping sync/async VM updates, which can't happen in practice
> unless userspace is doing something wrong (sparse bindings always go
> through vkQueueBindSparse).
> 
> I'll give it a try.
> 
>> (And the definition of overlap is currently page-table
>> structure updates may not overlap) but no guarantees are made about
>> priority.
>>
>> /Thomas
>>
>>
>>
> 

