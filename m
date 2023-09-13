Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B5E79EB16
	for <lists+nouveau@lfdr.de>; Wed, 13 Sep 2023 16:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B9610E4C9;
	Wed, 13 Sep 2023 14:29:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168D110E24C;
 Wed, 13 Sep 2023 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694615378; x=1726151378;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WQmI6LSBnG/TLh+Oe7SdHDdFHiU2dtNwb20XjRUw9ms=;
 b=QeDJUtWKdydyBJWnBS5ce1nfhiqn1K5cWnuOt8+JZO5Yvkkf59uXUDY2
 yXw7xoS6GYk4n2VRehxM6ZKt6xOpD2xSTUdo5DhePDshLZ+/8UmtCXeI5
 VWvI6v7vOE/HAulETEegNRKG7qxj1rVJ3LPDfG4K4AZ9E6ptQn0lvR/cj
 e+lOyq7iKPp7MCZwKS0TBMaHSWhi+8IC2k5CXLFDqMpLNQ22npj9xw+ko
 t+9L0sz2qKLG+EaSVYOkzQIMM8WJVQ5DVgH0okYZdbjJsFmnzvdjcECBZ
 +xHOQOGdw/aCtTIefnIxvZ7hif/ObWNHpYUZ2I2Zb8lGwUJXQOyOYyy0s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="358943849"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="358943849"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 07:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="867817143"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="867817143"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.211])
 ([10.249.254.211])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 07:29:33 -0700
Message-ID: <6c658492-9a78-cb70-7d6e-e6d786212ccc@linux.intel.com>
Date: Wed, 13 Sep 2023 16:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <20230913090311.5eeb026a@collabora.com>
 <CAPM=9tyf4m6gtUQ0BCraf0gB06_pxXV8gpQQsvWjeJnczmJkQQ@mail.gmail.com>
 <20230913091918.62c06a30@collabora.com>
 <df85257a-02ed-4869-2421-0039a9c97db5@linux.intel.com>
 <20230913133318.15edec7c@collabora.com>
 <6f4c047d-0e6d-c45b-3092-cd0bc84849dc@linux.intel.com>
 <20230913160148.4d941975@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230913160148.4d941975@collabora.com>
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


On 9/13/23 16:01, Boris Brezillon wrote:
> On Wed, 13 Sep 2023 15:22:56 +0200
> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>
>> On 9/13/23 13:33, Boris Brezillon wrote:
>>> On Wed, 13 Sep 2023 12:39:01 +0200
>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>   
>>>> Hi,
>>>>
>>>> On 9/13/23 09:19, Boris Brezillon wrote:
>>>>> On Wed, 13 Sep 2023 17:05:42 +1000
>>>>> Dave Airlie <airlied@gmail.com> wrote:
>>>>>      
>>>>>> On Wed, 13 Sept 2023 at 17:03, Boris Brezillon
>>>>>> <boris.brezillon@collabora.com> wrote:
>>>>>>> On Tue, 12 Sep 2023 18:20:32 +0200
>>>>>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>>>>>         
>>>>>>>>> +/**
>>>>>>>>> + * get_next_vm_bo_from_list() - get the next vm_bo element
>>>>>>>>> + * @__gpuvm: The GPU VM
>>>>>>>>> + * @__list_name: The name of the list we're iterating on
>>>>>>>>> + * @__local_list: A pointer to the local list used to store already iterated items
>>>>>>>>> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
>>>>>>>>> + *
>>>>>>>>> + * This helper is here to provide lockless list iteration. Lockless as in, the
>>>>>>>>> + * iterator releases the lock immediately after picking the first element from
>>>>>>>>> + * the list, so list insertion deletion can happen concurrently.
>>>>>>>> Are the list spinlocks needed for that async state update from within
>>>>>>>> the dma-fence critical section we've discussed previously?
>>>>>>> Any driver calling _[un]link() from its drm_gpu_scheduler::run_job()
>>>>>>> hook will be in this situation (Panthor at the moment, PowerVR soon). I
>>>>>>> get that Xe and Nouveau don't need that because they update the VM
>>>>>>> state early (in the ioctl path), but I keep thinking this will hurt us
>>>>>>> if we don't think it through from the beginning, because once you've
>>>>>>> set this logic to depend only on resv locks, it will be pretty hard to
>>>>>>> get back to a solution which lets synchronous VM_BINDs take precedence
>>>>>>> on asynchronous request, and, with vkQueueBindSparse() passing external
>>>>>>> deps (plus the fact the VM_BIND queue might be pretty deep), it can
>>>>>>> take a long time to get your synchronous VM_BIND executed...
>>>> So this would boil down to either (possibly opt-in) keeping the spinlock
>>>> approach or pushing the unlink out to a wq then?
>>> Deferred _unlink() would not be an issue, since I already defer the
>>> drm_gpuva destruction to a wq, it would just a be a matter of moving the
>>> _unlink() call there as well. But _link() also takes the GEM gpuva list
>>> lock, and that one is bit tricky, in that sm_map() can trigger 2 more
>>> _link() calls for the prev/next mappings, which we can't guess until we
>>> get to execute the VM update. If we mandate the use of the GEM resv
>>> lock, that simply means async VM updates (AKA calling
>>> drm_gpuvm_sm_[un]map()) are not an option. And if this is what everyone
>>> agrees on, then I'd like the APIs that make this sort of async VM
>>> update possible (drm_gpuvm_sm_[un]map(), the drm_gpuvm_ops::sm_step*
>>> methods, and probably other things) to be dropped, so we don't make it
>>> look like it's something we support.
>>>   
>>>> BTW, as also asked in a reply to Danilo, how do you call unlink from
>>>> run_job() when it was requiring the obj->dma_resv lock, or was that a WIP?
>>> _unlink() makes sure the GEM gpuva list lock is taken, but this can be
>>> a custom lock (see drm_gem_gpuva_set_lock()). In panthor we have
>>> panthor_gem_object::gpuva_list_lock that's dedicated the gpuva list
>>> protection. We make sure we never take this lock while allocating
>>> memory to guarantee the dma-signalling path can't deadlock.
>>>   
>>>>>>>         
>>>>>> btw what is the use case for this? do we have actual vulkan
>>>>>> applications we know will have problems here?
>>>>> I don't, but I think that's a concern Faith raised at some point (dates
>>>>> back from when I was reading threads describing how VM_BIND on i915
>>>>> should work, and I was clearly discovering this whole VM_BIND thing at
>>>>> that time, so maybe I misunderstood).
>>>>>      
>>>>>> it feels like a bit of premature optimisation, but maybe we have use cases.
>>>>> Might be, but that's the sort of thing that would put us in a corner if
>>>>> we don't have a plan for when the needs arise. Besides, if we don't
>>>>> want to support that case because it's too complicated, I'd recommend
>>>>> dropping all the drm_gpuvm APIs that let people think this mode is
>>>>> valid/supported (map/remap/unmap hooks in drm_gpuvm_ops,
>>>>> drm_gpuvm_sm_[un]map helpers, etc). Keeping them around just adds to the
>>>>> confusion.
>>>> Xe allows bypassing the bind-queue with another bind-queue, but to
>>>> completely avoid dependencies between queues the Operations may not
>>>> overlap.
>>> So, you check the VM state with some VM lock held (would be the VM resv
>>> in my case), and if the mapping is new (no overlaps with pre-existing
>>> mappings), you queue it to the fast-track/sync-VM_BIND queue. What would
>>> be missing I guess is a way to know if the mapping is active (MMU has
>>> been updated) or pending (MMU update queued to the bind-queue), so I can
>>> fast-track mapping/unmapping of active mappings. This would leave
>>> overlapping sync/async VM updates, which can't happen in practice
>>> unless userspace is doing something wrong (sparse bindings always go
>>> through vkQueueBindSparse).
>> User-space is allowed to create new bind queues at will, and they
>> execute independently save for range overlaps.
> I've limited panthor to just one bind-queue that's automatically
> created when the VM is created. I guess letting userspace create more
> than one queue is doable, but we'd still be serializing VM
> operations anyway and that complicates the whole thing when concurrent
> operations to the same VM region happen from different bind queues, so I
> figured it'd be simpler to expose just one queue.
>
>> And the overlapping granularity depends very much on the detail of the
>> range tracking.
>> We drafted this fenced range utility
>>
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/353
>>
>> That tracks active ranges that remove themselves when the attached fence
>> signals. Not sure if we ended up using it, though. A new binding would
>> scan this utility for dma-fences it needs to depend upon.
> Sounds like implicit deps on VM ranges :D. I'll have a look, thanks
> for the pointer!
>
>> Ranges in Xe
>> are actually page-table modification ranges, so can exceed the actual VA
>> range in some situations, but if you can build page-table structures
>> async the granularity indeed becomes better.
> The granularity in Mali is 4k, and we don't build the page table struct
> asynchronously, we just update the page table tree from the CPU,
> holding a VM lock to serialize such operations (that's done
> synchronously in the ::run_job() path, or from the ioctl in case of a
> sync-VM_BIND).

OK, yeah we have something similar although we build the page-table tree 
in the IOCTL and update entries using the GPU unless there are no 
dependencies, in which case we do it sync in the ioctl as well.

The drawback here is that if one op adds a pagetable tree node near the 
root (spanning say 1G) and the next op adds an entry to that node, the 
granularity can become pretty large...

/Thomas


>
>> /Thomas
>>
>>
>>
>>> I'll give it a try.
>>>   
>>>> (And the definition of overlap is currently page-table
>>>> structure updates may not overlap) but no guarantees are made about
>>>> priority.
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>   
