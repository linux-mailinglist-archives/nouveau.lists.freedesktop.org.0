Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCAE6B8641
	for <lists+nouveau@lfdr.de>; Tue, 14 Mar 2023 00:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4928A10E257;
	Mon, 13 Mar 2023 23:46:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A11810E66E
 for <nouveau@lists.freedesktop.org>; Mon, 13 Mar 2023 23:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678751173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNCp7SiAh1Wsc4R+8mGtGoVGTTLU+MRsz1eUSRNIc10=;
 b=T3ApKQLXSp1/i9B5xfYKLNmVVmVltTBo3rQbJ3l+w0z03qz4iwdhiTVj3Sabzm8wst7fjh
 jSxDcRkAOspW1FAioFdZAyrd8VC/IAUjjfrnkpitmXSOPo0JxwREOOEDK3hZitYfzmDdql
 j1bIjf3Hyv2TZVpuP+80vD6vRt0dHNc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-ohur78vNMtmsmtkfnQAhKw-1; Mon, 13 Mar 2023 19:46:10 -0400
X-MC-Unique: ohur78vNMtmsmtkfnQAhKw-1
Received: by mail-ed1-f71.google.com with SMTP id
 w6-20020a05640234c600b004fc0e5b4433so6519148edc.18
 for <nouveau@lists.freedesktop.org>; Mon, 13 Mar 2023 16:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678751169;
 h=content-transfer-encoding:in-reply-to:organization:from:cc
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MNCp7SiAh1Wsc4R+8mGtGoVGTTLU+MRsz1eUSRNIc10=;
 b=7g4WcFprN+v/ZAM0C8rT5IioTn6D9btwM30pBEqjFys8L+16FFHn564YRpFnTsi9x5
 3Hu5fM2gwnwnEEL+/M10LFtduQB9E2CkdOzZqV+sHBCzXajAgqRzlIaHIJXymZ3VeFVh
 0KnSoDurs6pMrcv6r4L5JcxDnPM38MOxkpZRXRzYYdyB0XFStfqj/0DBARutd835Jxva
 KqToOLyLYvbeQrfu9uhwQY2Ah5rol48y1P+/ugnPgNzbElDZuzrPLGGCXhLLZcF3nXJm
 YoGfq5vTi+176Bfg/LWLNwmIJ8qdOfBCv96hYo/NQNtUEYpumagj6q4D9RrH6yO4aYhf
 cAZA==
X-Gm-Message-State: AO0yUKWobcrBffyEeRlLMlHy+rIVjdL5hXKNfMPDT8YB5B52Vf/LctXe
 IOpMrpebs9TsfoOyUBiYTG/Fe/0BFqGDc+2LrEXdtTAvstFAhVKBsEHcTlf2narAbBG8YSZn/vQ
 a13WVAXWEfE3oDbgSXaLxmQNmrA==
X-Received: by 2002:a17:906:b2d3:b0:926:320c:cd98 with SMTP id
 cf19-20020a170906b2d300b00926320ccd98mr231593ejb.36.1678751168968; 
 Mon, 13 Mar 2023 16:46:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set86OzBF9v3HAIPKMYQO9MTiFHax8d5/HZDrTNT+jRR8jh6/khPEjzlJD4xgJhmOQbL1XGAzPw==
X-Received: by 2002:a17:906:b2d3:b0:926:320c:cd98 with SMTP id
 cf19-20020a170906b2d300b00926320ccd98mr231556ejb.36.1678751168506; 
 Mon, 13 Mar 2023 16:46:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170906824700b0092435626c0asm360384ejx.29.2023.03.13.16.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 16:46:08 -0700 (PDT)
Message-ID: <06d30f61-4e85-5897-dba1-3a4ef462866a@redhat.com>
Date: Tue, 14 Mar 2023 00:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <20230221182050.day6z5ge2e3dxerv@revolver>
 <ce3ee7f2-e8a3-80eb-9bca-cd465f7f332e@redhat.com>
 <20230223190941.bkkloowmvqjiu6d7@revolver>
 <0868bbeb-11b4-b832-a601-f289278e3e76@redhat.com>
 <20230302023829.kcxyukt7guacr7xg@revolver>
 <87be9261-1206-75db-6aeb-27abe6e05821@redhat.com>
 <20230307224312.a4kxlykzlzkrcmpf@revolver>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230307224312.a4kxlykzlzkrcmpf@revolver>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 mripard@kernel.org, linux-mm@kvack.org, boris.brezillon@collabora.com,
 bskeggs@redhat.com, alexdeucher@gmail.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 3/7/23 23:43, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230306 10:46]:
>> On 3/2/23 03:38, Liam R. Howlett wrote:
>>> * Danilo Krummrich <dakr@redhat.com> [230227 08:17]:
>>>
>>> ...
>>>>>> Would this variant be significantly more efficient?
>>>>>
>>>>> Well, what you are doing is walking the tree to see if there's anything
>>>>> there... then re-walking the tree to store it.  So, yes, it's much more
>>>>> efficient..  However, writing is heavier.  How much of the time is spent
>>>>> walking vs writing depends on the size of the tree, but it's rather easy
>>>>> to do this in a single walk of the tree so why wouldn't you?
>>>>
>>>> I will, I was just curious about how much of an impact it has.
>>>>
>>>>>
>>>>>>
>>>>>> Also, would this also work while already walking the tree?
>>>>>
>>>>> Yes, to an extent.  If you are at the correct location in the tree, you
>>>>> can write to that location.  If you are not in the correct location and
>>>>> try to write to the tree then things will go poorly..  In this scenario,
>>>>> we are very much walking the tree and writing to it in two steps.
>>>>>
>>>>>>
>>>>>> To remove an entry while walking the tree I have a separate function
>>>>>> drm_gpuva_iter_remove(). Would I need something similar for inserting
>>>>>> entries?
>>>>>
>>>>> I saw that.  Your remove function uses the erase operation which is
>>>>> implemented as a walk to that location and a store of a null over the
>>>>> range that is returned.  You do not need a function to insert an entry
>>>>> if the maple state is at the correct location, and that doesn't just
>>>>> mean setting mas.index/mas.last to the correct value.  There is a node &
>>>>> offset saved in the maple state that needs to be in the correct
>>>>> location.  If you store to that node then the node may be replaced, so
>>>>> other iterators that you have may become stale, but the one you used
>>>>> execute the store operation will now point to the new node with the new
>>>>> entry.
>>>>>
>>>>>>
>>>>>> I already provided this example in a separate mail thread, but it may makes
>>>>>> sense to move this to the mailing list:
>>>>>>
>>>>>> In __drm_gpuva_sm_map() we're iterating a given range of the tree, where the
>>>>>> given range is the size of the newly requested mapping. __drm_gpuva_sm_map()
>>>>>> invokes a callback for each sub-operation that needs to be taken in order to
>>>>>> fulfill this mapping request. In most cases such a callback just creates a
>>>>>> drm_gpuva_op object and stores it in a list.
>>>>>>
>>>>>> However, drivers can also implement the callback, such that they directly
>>>>>> execute this operation within the callback.
>>>>>>
>>>>>> Let's have a look at the following example:
>>>>>>
>>>>>>         0     a     2
>>>>>> old: |-----------|       (bo_offset=n)
>>>>>>
>>>>>>               1     b     3
>>>>>> req:       |-----------| (bo_offset=m)
>>>>>>
>>>>>>         0  a' 1     b     3
>>>>>> new: |-----|-----------| (a.bo_offset=n,b.bo_offset=m)
>>>>>>
>>>>>> This would result in the following operations.
>>>>>>
>>>>>> __drm_gpuva_sm_map() finds entry "a" and calls back into the driver
>>>>>> suggesting to re-map "a" with the new size. The driver removes entry "a"
>>>>>> from the tree and adds "a'"
>>>>>
>>>>> What you have here won't work.  The driver will cause your iterators
>>>>> maple state to point to memory that is freed.  You will either need to
>>>>> pass through your iterator so that the modifications can occur with that
>>>>> maple state so it remains valid, or you will need to invalidate the
>>>>> iterator on every modification by the driver.
>>>>>
>>>>> I'm sure the first idea you have will be to invalidate the iterator, but
>>>>> that is probably not the way to proceed.  Even ignoring the unclear
>>>>> locking of two maple states trying to modify the tree, this is rather
>>>>> inefficient - each invalidation means a re-walk of the tree.  You may as
>>>>> well not use an iterator in this case.
>>>>>
>>>>> Depending on how/when the lookups occur, you could still iterate over
>>>>> the tree and let the driver modify the ending of "a", but leave the tree
>>>>> alone and just store b over whatever - but the failure scenarios may
>>>>> cause you grief.
>>>>>
>>>>> If you pass the iterator through, then you can just use it to do your
>>>>> writes and keep iterating as if nothing changed.
>>>>
>>>> Passing through the iterater clearly seems to be the way to go.
>>>>
>>>> I assume that if the entry to insert isn't at the location of the iterator
>>>> (as in the following example) we can just keep walking to this location my
>>>> changing the index of the mas and calling mas_walk()?
>>>
>>> no.  You have to mas_set() to the value and walk from the top of the
>>> tree.  mas_walk() walks down, not from side to side - well, it does go
>>> forward within a node (increasing offset), but if you hit the node limit
>>> then you have gotten yourself in trouble.
>>>
>>>> This would also imply
>>>> that the "outer" tree walk continues after the entry we just inserted,
>>>> right?
>>>
>>> I don't understand the "outer" tree walk statement.
>>
>> I think I could have phrased this better. I just mean "my" iterator walking
>> each tree entry rather than an internal tree walk, as it happens in e.g.
>> mas_walk() or mas_find().
>>
>>>
>>>>
>>>>              1     a     3
>>>> old:       |-----------| (bo_offset=n)
>>>>
>>>>        0     b     2
>>>> req: |-----------|       (bo_offset=m)
>>>>
>>>>        0     b     2  a' 3
>>>> new: |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>>>>
>>>> Again, after finding "a", we want to remove it and insert "a'" instead.
>>>
>>> Ah, so you could walk to 0, see that it's NULL from 0 - 1, call
>>> mas_next() and get "a" from 1 - 3, write "a'" from 2 - 3:
>>>
>>>           0     1  a   2  a' 3
>>> broken: |-----|------|-----| (a is broken in this 1/2 step)
>>>
>>> mas_set_range(&mas, 0, 2); /* Resets the tree location to MAS_START */
>>> mas_store(&mas, b);
>>>           0     b     2  a' 3
>>> new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>>>
>>>
>>> You can *probably* also get away with this:
>>>
>>> walk to 0, see that it's NULL from 0 - 1, call mas_next() and get "a"
>>> from 1 - 3, write "a'" from 2 - 3:
>>>
>>>           0     1  a   2  a' 3
>>> broken: |-----|------|-----| (a is broken in this 1/2 step)
>>>
>>> mas_prev(&mas, 0); /* Looking at broken a from 1-2.
>>> mas_store(&mas, NULL); /* NULL is expanded on write to 0-2.
>>>               0    NULL   2  a' 3
>>> broken':    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>>>
>>> mas_store(&mas, b);
>>>           0     b     2  a' 3
>>> new:    |-----------|-----| (b.bo_offset=m,a.bo_offset=n+2)
>>>
>>> You may want to iterate backwards and do the writes as you go until you
>>> have enough room.. it really depends how you want to go about doing
>>> things.
>>
>> I see, again thanks for explaining.
>>
>> I think I would prefer to either (1) have generic insert() function with a
>> similar behavior as when iterating through a list or (2) have a function
>> dedicated to the "split" use case.
>>
>> 1) When iterating the tree inserting entries at arbitrary locations should
>> not influence the next iteration step. Unless the new entry really is the
>> next entry, but that'd be optional. I don't see a use case for that.
>>
>> 2) Similar to how you broke it down above I could imagine a function
>> dedicated to the split operation. This would be similar to what you mention
>> for mmap below. However, it wouldn't be a single operation.
>>
>> The GPUVA manager provides sub-operations to the driver for a single mapping
>> request. Those can be an arbitrary amount of unmaps (for mappings "in the
>> way", as you say below), one or two remaps (for splits at the beginning or
>> end or both) and exactly one map (which is the last sub-operation adding the
>> newly requested mapping).
>>
>> Remaps consist out of the mapping to unmap and one or two new mappings to
>> map. The only case where a remap sub-op has two new mappings to map is when
>> the newly requested mapping is enclosed by a single existing mapping. If we
>> overlap a mapping at the beginning and another one at the end this would be
>> two separate remap sub-ops. Of course, between the two remaps there could be
>> an arbitrary amount of unmap sub-ops.
>>
>> Unmap sub-ops are simple, I just need to remove a single entry in the tree.
>> drm_gpuva_iter_remove() should be fine for that.
>>
>> For remap sub-ops, I would need a function that removes an entry and then
>> adds one or two new entries within the range of the removed one. The next
>> loop iteration should then continue at the entry (is any) after the range of
>> the removed one.
>>
>> However, I'm unsure how to implement this. Would I need to just do a
>> mas_store() of the new entry/entries (since the nodes should already be
>> allocated) and then clean up the nodes that are left with mas_erase()?
>>
>> Let's say there is an entry A = [0 - 5] and I want to replace it with B = [0
>> - 1] and C = [4 - 5].
>>
>> Could I just store B and C and then somehow clean up the range [2 - 3]?
> 
> The most efficient way:
> mas_set(&mas, 0);
> // Walk down to 0
> mas_walk(&mas);
> // We are now pointing at A (index = 0, last = 5)
> mas.last = 1;
> // No walk here.
> mas_store(&mas, B);
> // Going to the next entry is very fast.
> mas_next(&mas)
> // We are now pointing at a fragment of A (index = 2, last = 5)
> mas.last = 3;
> // No walk here.
> mas_store(&mas, NULL);
> // Going to the next entry is very fast
> mas_next(&mas);
> // We are now pointing at a fragment of A (index = 4, last = 5)
> mas_store(&mas, C);
> 
> Less efficient, but still fine:
> // Walk down to 0 and store
> mas_set_range(&mas, 0, 1);
> mas_store(&mas, B);
> // Reset to the top of the tree
> mas_set_range(&mas, 4, 5);
> // Walk down to 4 and store
> mas_store(&mas, C);
> // Reset to the top of the tree
> mas_set_range(&mas, 2, 3);
> // Walk down to 2 and store
> mas_store(&mas, NULL);
> 
> 
>>
>> Maybe 1) would be the most flexible way, however, if 2) can be implemented
>> more efficiently that's perfectly fine too.
> 
> You can do anything you want, but the more you can use the same maple
> state and save walking from the top the more efficient it will be.
> Every level is another dereference down the tree..  We do have a
> branching factor of 16 here, so I don't know the size of your tree and
> how worth the effort it is for you.

I think it could be worth taking the first approach and providing 
functions that are tied specifically to the use cases of the GPUVA 
manager, rather than generalizing them too much and re-walk the tree 
more than necessary. I think the size of the tree can be up to a couple 
100k.

Since some operations may be executed from dma-fence signalling critical 
sections I have a use case for mas_preallocate(). I was wondering if I 
can ignore the "entry" argument of mas_preallocate() and just pass NULL, 
since it's actually never used. What's the purpose of this argument? Or 
is it bug?

> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> __drm_gpuva_sm_map(), ideally, continues the loop searching for nodes
>>>>>> starting from the end of "a" (which is 2) till the end of the requested
>>>>>> mapping "b" (which is 3). Since it doesn't find any other mapping within
>>>>>> this range it calls back into the driver suggesting to finally map "b".
>>>>>>
>>>>>> If there would have been another mapping between 2 and 3 it would have
>>>>>> called back into the driver asking to unmap this mapping beforehand.
>>>>>>
>>>>>> So, it boils down to re-mapping as described at the beginning (and
>>>>>> analogously at the end) of a new mapping range and removing of entries that
>>>>>> are enclosed by the new mapping range.
>>>>>
>>>>> I assume the unmapped area is no longer needed, and the 're-map' is
>>>>> really a removal of information?  Otherwise I'd suggest searching for a
>>>>> gap which fits your request.  What you have here is a lot like
>>>>> "MAP_FIXED" vs top-down/bottom-up search in the VMA code, this seems to
>>>>> be like your __drm_gpuva_sm_map() and the drm mm range allocator with
>>>>> DRM_MM_INSERT_LOW, and DRM_MM_INSERT_HIGH.
>>>>>
>>>>> Why can these split/unmappings fail?  Is it because they are still
>>>>> needed?
>>>>>
>>>>
>>>> You mean the check before the mas_*() operations in drm_gpuva_insert()?
>>>
>>> Yes, the callbacks.
>>>
>>>>
>>>> Removing entries should never fail, inserting entries should fail when the
>>>> caller tries to store to an area outside of the VA space (it doesn't
>>>> necessarily span the whole 64-bit space), a kernel reserved area of the VA
>>>> space, is not in any pre-allocated range of the VA space (if regions are
>>>> enabled) or an entry already exists at that location.
>>>
>>> In the mmap code, I have to deal with splitting the start/end VMA and
>>> removing any VMAs in the way.  I do this by making a 'detached' tree
>>> that is dealt with later, then just overwriting the area with one
>>> mas_store() operation.  Would something like that work for you?
>>
>> I think this is pretty much the same thing I want to do, hence this should
>> work. However, this would require more state keeping for the whole
>> iteration, I guess. Drivers shouldn't know how the GPUVA manager keeps track
>> of mappings internally (and hence they shouldn't know about the maple tree).
>> If I could get away with something similar to what I wrote above, I think
>> I'd probably not add this extra complexity, unless there are relevant
>> performance reasons to do so.
>>
> 
> Well maybe you can tell your drivers that there's something in the way
> and they can remove it from their end but not alter the tree.  Sort of
> like a "Untracked" callback.
> 
> If you have a "This range has changed to X-Y" then you can use this
> along with the "Untracked" to implement the above in a single
> write.  Iterate through the area , call back to the driver to alter the
> start range, then keep "Untracing" until you alter the end range.
> 
> ...
> 
> Cheers,
> Liam
> 

