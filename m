Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522087BEC0A
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 22:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76A710E1A7;
	Mon,  9 Oct 2023 20:54:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878910E1A7
 for <nouveau@lists.freedesktop.org>; Mon,  9 Oct 2023 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696884883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ScAWjU88sMS9E2yzVW+fyD7PP+yCYFGGCn0V+I2G5+o=;
 b=h/xJLXVYfB2cvLoy5CCNjVylD+nMCYpsaZSo0hsDB6fA/g+YQgethx/DYJ5gNlIeMWKr0c
 X+x1npLwubDeywhM+rcGDbwdwCKMKdzHt9gn4ddT0NjBgZtM60jkm7Di01TH6cChzIZxau
 w3w1yXLN9IX0wKrdo1x0nRzQJhIKu3s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-U9bD-PQzN4261KzPwnYcTQ-1; Mon, 09 Oct 2023 16:54:41 -0400
X-MC-Unique: U9bD-PQzN4261KzPwnYcTQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9ae0601d689so356300266b.0
 for <nouveau@lists.freedesktop.org>; Mon, 09 Oct 2023 13:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696884880; x=1697489680;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ScAWjU88sMS9E2yzVW+fyD7PP+yCYFGGCn0V+I2G5+o=;
 b=VjbzwBoeO2+PUYkCXll0CdVxCabS9RwEKftyH78fjHOmCFvVxaLUACtzS9txF+YtcX
 0j4kGcjTD78CNOQrrHU5NdNbktqcP1aWEz+7zndC1K2ySM0yo0j5TwpsY6SEN1/aAykP
 2iutUmL8Ht3//qYcF5BeZHbm2aXauqmW8sWkjlPo/YANbXulvM91ldEdAfir8nBMYhYm
 7wYOMo/VDQ84XaRRTi1BMOJDZGeVollodLfLjlR1gui4mnL5faNYNQ6M9MgS2RWdhCqx
 nfY0Xa8GjPrudCcLa72KFTJ8zdgoZ2KsFTpE7z7CuRxF7Ney2HF+yW4ApJOd/nGrRr8E
 HG3A==
X-Gm-Message-State: AOJu0YzT3512n+eBfnAsgVR7VW2ZU9+P1KkEAc7YSzWtQryd/YoiJa+C
 DcftQO0MQWRQFg5pUuk9JqyvUYqwufQlImDDKV6TKEw0M6JFC+wLhp4mDOgoYcINU1ZirxNWv42
 ba7gR3b1eP0+c0hggT4PXpQVJTw==
X-Received: by 2002:a17:907:2ced:b0:9ba:307d:6745 with SMTP id
 hz13-20020a1709072ced00b009ba307d6745mr1571324ejc.16.1696884880253; 
 Mon, 09 Oct 2023 13:54:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPzee4FbN14jk9oIDIfZOcOV19gMDnKhpX7HhqDPtNIQu1xPDC0Vi5LqK8xV+pnwbsxB1p6w==
X-Received: by 2002:a17:907:2ced:b0:9ba:307d:6745 with SMTP id
 hz13-20020a1709072ced00b009ba307d6745mr1571310ejc.16.1696884879742; 
 Mon, 09 Oct 2023 13:54:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a170906051800b00993470682e5sm7149852eja.32.2023.10.09.13.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 13:54:39 -0700 (PDT)
Message-ID: <e079d129-9aa3-5050-ee92-15e29dd7dc25@redhat.com>
Date: Mon, 9 Oct 2023 22:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Danilo Krummrich <dakr@redhat.com>
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-5-dakr@redhat.com>
 <9d2c3eb5-f0e6-23a6-0946-7d63670b4778@linux.intel.com>
 <4e0d545f-b0bb-17fa-73dc-62c652a0cce3@redhat.com>
Organization: RedHat
In-Reply-To: <4e0d545f-b0bb-17fa-73dc-62c652a0cce3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v6 4/6] drm/gpuvm:
 track/lock/validate external/evicted objects
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

On 10/9/23 16:45, Danilo Krummrich wrote:
> On 10/9/23 15:36, Thomas Hellström wrote:
>>
>> On 10/9/23 01:32, Danilo Krummrich wrote:
>>> Currently the DRM GPUVM offers common infrastructure to track GPU VA
>>> allocations and mappings, generically connect GPU VA mappings to their
>>> backing buffers and perform more complex mapping operations on the GPU VA
>>> space.
>>>
>>> However, there are more design patterns commonly used by drivers, which
>>> can potentially be generalized in order to make the DRM GPUVM represent
>>> a basis for GPU-VM implementations. In this context, this patch aims
>>> at generalizing the following elements.
>>>
>>> 1) Provide a common dma-resv for GEM objects not being used outside of
>>>     this GPU-VM.
>>>
>>> 2) Provide tracking of external GEM objects (GEM objects which are
>>>     shared with other GPU-VMs).
>>>
>>> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>>>     GPU-VM contains mappings of.
>>>
>>> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>>>     of, such that validation of evicted GEM objects is accelerated.
>>>
>>> 5) Provide some convinience functions for common patterns.
>>>
>>> Big thanks to Boris Brezillon for his help to figure out locking for
>>> drivers updating the GPU VA space within the fence signalling path.
>>>
>>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_gpuvm.c | 646 ++++++++++++++++++++++++++++++++++++
>>>   include/drm/drm_gpuvm.h     | 246 ++++++++++++++
>>>   2 files changed, 892 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>> index 28282283ddaf..6977bd30eca5 100644
>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>> @@ -82,6 +82,21 @@
>>>    * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
>>>    * particular combination. If not existent a new instance is created and linked
>>>    * to the &drm_gem_object.
>>> + *
>>> + * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm, are also used
>>> + * as entry for the &drm_gpuvm's lists of external and evicted objects. Those
>>> + * list are maintained in order to accelerate locking of dma-resv locks and
>>> + * validation of evicted objects bound in a &drm_gpuvm. For instance, all
>>> + * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be locked by calling
>>> + * drm_gpuvm_exec_lock(). Once locked drivers can call drm_gpuvm_validate() in
>>> + * order to validate all evicted &drm_gem_objects. It is also possible to lock
>>> + * additional &drm_gem_objects by providing the corresponding parameters to
>>> + * drm_gpuvm_exec_lock() as well as open code the &drm_exec loop while making
>>> + * use of helper functions such as drm_gpuvm_prepare_range() or
>>> + * drm_gpuvm_prepare_objects().
>>> + *
>>> + * Every bound &drm_gem_object is treated as external object when its &dma_resv
>>> + * structure is different than the &drm_gpuvm's common &dma_resv structure.
>>>    */
>>>   /**
>>> @@ -429,6 +444,20 @@
>>>    * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
>>>    * &drm_gem_object must be able to observe previous creations and destructions
>>>    * of &drm_gpuvm_bos in order to keep instances unique.
>>> + *
>>> + * The &drm_gpuvm's lists for keeping track of external and evicted objects are
>>> + * protected against concurrent insertion / removal and iteration internally.
>>> + *
>>> + * However, drivers still need ensure to protect concurrent calls to functions
>>> + * iterating those lists, namely drm_gpuvm_prepare_objects() and
>>> + * drm_gpuvm_validate().
>>> + *
>>> + * Alternatively, drivers can set the &DRM_GPUVM_RESV_PROTECTED flag to indicate
>>> + * that the corresponding &dma_resv locks are held in order to protect the
>>> + * lists. If &DRM_GPUVM_RESV_PROTECTED is set, internal locking is disabled and
>>> + * the corresponding lockdep checks are enabled. This is an optimization for
>>> + * drivers which are capable of taking the corresponding &dma_resv locks and
>>> + * hence do not require internal locking.
>>>    */
>>>   /**
>>> @@ -641,6 +670,195 @@
>>>    *    }
>>>    */
>>> +/**
>>> + * get_next_vm_bo_from_list() - get the next vm_bo element
>>> + * @__gpuvm: The GPU VM
>>> + * @__list_name: The name of the list we're iterating on
>>> + * @__local_list: A pointer to the local list used to store already iterated items
>>> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
>>> + *
>>> + * This helper is here to provide lockless list iteration. Lockless as in, the
>>> + * iterator releases the lock immediately after picking the first element from
>>> + * the list, so list insertion deletion can happen concurrently.
>>> + *
>>> + * Elements popped from the original list are kept in a local list, so removal
>>> + * and is_empty checks can still happen while we're iterating the list.
>>> + */
>>> +#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)    \
>>> +    ({                                        \
>>> +        struct drm_gpuvm_bo *__vm_bo = NULL;                    \
>>> +                                            \
>>> +        drm_gpuvm_bo_put(__prev_vm_bo);                        \
>>> +                                            \
>>> +        spin_lock(&(__gpuvm)->__list_name.lock);                \
>>> +        if (!(__gpuvm)->__list_name.local_list)                    \
>>> +            (__gpuvm)->__list_name.local_list = __local_list;        \
>>> +        else                                    \
>>> +            WARN_ON((__gpuvm)->__list_name.local_list != __local_list);    \
>>> +                                            \
>>> +        while (!list_empty(&(__gpuvm)->__list_name.list)) {            \
>>> +            __vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,    \
>>> +                           struct drm_gpuvm_bo,            \
>>> +                           list.entry.__list_name);        \
>>> +            if (kref_get_unless_zero(&__vm_bo->kref)) {            \
>>> +                list_move_tail(&(__vm_bo)->list.entry.__list_name,    \
>>> +                           __local_list);                \
>>> +                break;                            \
>>> +            } else {                            \
>>> +                list_del_init(&(__vm_bo)->list.entry.__list_name);    \
>>> +                __vm_bo = NULL;                        \
>>> +            }                                \
>>> +        }                                    \
>>> +        spin_unlock(&(__gpuvm)->__list_name.lock);                \
>>> +                                            \
>>> +        __vm_bo;                                \
>>> +    })
>>> +
>>> +/**
>>> + * for_each_vm_bo_in_list() - internal vm_bo list iterator
>>> + *
>>> + * This helper is here to provide lockless list iteration. Lockless as in, the
>>> + * iterator releases the lock immediately after picking the first element from the
>>> + * list, hence list insertion and deletion can happen concurrently.
>>> + *
>>> + * It is not allowed to re-assign the vm_bo pointer from inside this loop.
>>> + *
>>> + * Typical use:
>>> + *
>>> + *    struct drm_gpuvm_bo *vm_bo;
>>> + *    LIST_HEAD(my_local_list);
>>> + *
>>> + *    ret = 0;
>>> + *    for_each_vm_bo_in_list(gpuvm, <list_name>, &my_local_list, vm_bo) {
>>> + *        ret = do_something_with_vm_bo(..., vm_bo);
>>> + *        if (ret)
>>> + *            break;
>>> + *    }
>>> + *    drm_gpuvm_bo_put(vm_bo);
>>> + *    restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);
>>> + *
>>> + *
>>> + * Only used for internal list iterations, not meant to be exposed to the outside
>>> + * world.
>>> + */
>>> +#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)    \
>>> +    for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,        \
>>> +                        __local_list, NULL);        \
>>> +         __vm_bo;                                \
>>> +         __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,        \
>>> +                        __local_list, __vm_bo))
>>> +
>>> +static void
>>> +__restore_vm_bo_list(struct drm_gpuvm *gpuvm, spinlock_t *lock,
>>> +             struct list_head *list, struct list_head **local_list)
>>> +{
>>> +    /* Merge back the two lists, moving local list elements to the
>>> +     * head to preserve previous ordering, in case it matters.
>>> +     */
>>> +    spin_lock(lock);
>>> +    if (*local_list) {
>>> +        list_splice(*local_list, list);
>>> +        *local_list = NULL;
>>> +    }
>>> +    spin_unlock(lock);
>>> +}
>>> +
>>> +/**
>>> + * restore_vm_bo_list() - move vm_bo elements back to their original list
>>> + * @__gpuvm: The GPU VM
>>> + * @__list_name: The name of the list we're iterating on
>>> + *
>>> + * When we're done iterating a vm_bo list, we should call restore_vm_bo_list()
>>> + * to restore the original state and let new iterations take place.
>>> + */
>>> +#define restore_vm_bo_list(__gpuvm, __list_name)            \
>>> +    __restore_vm_bo_list((__gpuvm), &(__gpuvm)->__list_name.lock,    \
>>> +                 &(__gpuvm)->__list_name.list,        \
>>> +                 &(__gpuvm)->__list_name.local_list)
>>> +
>>> +static void
>>> +cond_spin_lock(spinlock_t *lock, bool cond)
>>> +{
>>> +    if (cond)
>>> +        spin_lock(lock);
>>> +}
>>> +
>>> +static void
>>> +cond_spin_unlock(spinlock_t *lock, bool cond)
>>> +{
>>> +    if (cond)
>>> +        spin_unlock(lock);
>>> +}
>>> +
>>> +static void
>>> +__drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t *lock,
>>> +            struct list_head *entry, struct list_head *list)
>>> +{
>>> +    cond_spin_lock(lock, !!lock);
>>> +    if (list_empty(entry))
>>> +        list_add_tail(entry, list);
>>> +    cond_spin_unlock(lock, !!lock);
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
>>> + * @__vm_bo: the &drm_gpuvm_bo
>>> + * @__list_name: the name of the list to insert into
>>> + * @__lock: whether to lock with the internal spinlock
>>> + *
>>> + * Inserts the given @__vm_bo into the list specified by @__list_name.
>>> + */
>>> +#define drm_gpuvm_bo_list_add(__vm_bo, __list_name, __lock)            \
>>> +    __drm_gpuvm_bo_list_add((__vm_bo)->vm,                    \
>>> +                __lock ? &(__vm_bo)->vm->__list_name.lock :    \
>>> +                     NULL,                    \
>>> +                &(__vm_bo)->list.entry.__list_name,        \
>>> +                &(__vm_bo)->vm->__list_name.list)
>>> +
>>> +static void
>>> +__drm_gpuvm_bo_list_del(struct drm_gpuvm *gpuvm, spinlock_t *lock,
>>> +            struct list_head *entry, bool init)
>>> +{
>>> +    cond_spin_lock(lock, !!lock);
>>> +    if (init) {
>>> +        if (!list_empty(entry))
>>> +            list_del_init(entry);
>>> +    } else {
>>> +        list_del(entry);
>>> +    }
>>> +    cond_spin_unlock(lock, !!lock);
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_list_del_init() - remove a vm_bo from the given list
>>> + * @__vm_bo: the &drm_gpuvm_bo
>>> + * @__list_name: the name of the list to insert into
>>> + * @__lock: whether to lock with the internal spinlock
>>> + *
>>> + * Removes the given @__vm_bo from the list specified by @__list_name.
>>> + */
>>> +#define drm_gpuvm_bo_list_del_init(__vm_bo, __list_name, __lock)        \
>>> +    __drm_gpuvm_bo_list_del((__vm_bo)->vm,                    \
>>> +                __lock ? &(__vm_bo)->vm->__list_name.lock :    \
>>> +                     NULL,                    \
>>> +                &(__vm_bo)->list.entry.__list_name,        \
>>> +                true)
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_list_del() - remove a vm_bo from the given list
>>> + * @__vm_bo: the &drm_gpuvm_bo
>>> + * @__list_name: the name of the list to insert into
>>> + * @__lock: whether to lock with the internal spinlock
>>> + *
>>> + * Removes the given @__vm_bo from the list specified by @__list_name.
>>> + */
>>> +#define drm_gpuvm_bo_list_del(__vm_bo, __list_name, __lock)            \
>>> +    __drm_gpuvm_bo_list_del((__vm_bo)->vm,                    \
>>> +                __lock ? &(__vm_bo)->vm->__list_name.lock :    \
>>> +                     NULL,                    \
>>> +                &(__vm_bo)->list.entry.__list_name,        \
>>> +                false)
>>> +
>>>   #define to_drm_gpuva(__node)    container_of((__node), struct drm_gpuva, rb.node)
>>>   #define GPUVA_START(node) ((node)->va.addr)
>>> @@ -760,6 +978,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object *r_obj,
>>>       gpuvm->rb.tree = RB_ROOT_CACHED;
>>>       INIT_LIST_HEAD(&gpuvm->rb.list);
>>> +    INIT_LIST_HEAD(&gpuvm->extobj.list);
>>> +    spin_lock_init(&gpuvm->extobj.lock);
>>> +
>>> +    INIT_LIST_HEAD(&gpuvm->evict.list);
>>> +    spin_lock_init(&gpuvm->evict.lock);
>>> +
>>>       drm_gpuvm_check_overflow(start_offset, range);
>>>       gpuvm->mm_start = start_offset;
>>>       gpuvm->mm_range = range;
>>> @@ -802,10 +1026,372 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>       WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>>            "GPUVA tree is not empty, potentially leaking memory.\n");
>>> +    WARN(!list_empty(&gpuvm->extobj.list), "Extobj list should be empty.\n");
>>> +    WARN(!list_empty(&gpuvm->evict.list), "Evict list should be empty.\n");
>>> +
>>>       drm_gem_object_put(gpuvm->r_obj);
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>> +static int
>>> +__drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>> +                struct drm_exec *exec,
>>> +                unsigned int num_fences)
>>> +{
>>> +    struct drm_gpuvm_bo *vm_bo;
>>> +    LIST_HEAD(extobjs);
>>> +    int ret = 0;
>>> +
>>> +    for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
>>> +        ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +    /* Drop ref in case we break out of the loop. */
>>> +    drm_gpuvm_bo_put(vm_bo);
>>> +    restore_vm_bo_list(gpuvm, extobj);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int
>>> +drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
>>> +                 struct drm_exec *exec,
>>> +                 unsigned int num_fences)
>>> +{
>>> +    struct drm_gpuvm_bo *vm_bo;
>>> +    int ret = 0;
>>> +
>>> +    drm_gpuvm_resv_assert_held(gpuvm);
>>> +    list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
>>> +        ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
>>> +        if (ret)
>>> +            break;
>>> +
>>> +        if (vm_bo->evicted)
>>> +            drm_gpuvm_bo_list_add(vm_bo, evict, false);
>>
>> Clear vm_bo->evicted here?
> 
> Why? It's still evicted, hence why not indicate it? It could be useful for a
> validate_range() use case.
> 
>>
>>
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_prepare_objects() - prepare all assoiciated BOs
>>> + * @gpuvm: the &drm_gpuvm
>>> + * @exec: the &drm_exec locking context
>>> + * @num_fences: the amount of &dma_fences to reserve
>>> + *
>>> + * Calls drm_exec_prepare_obj() for all &drm_gem_objects the given
>>> + * &drm_gpuvm contains mappings of.
>>> + *
>>> + * Using this function directly, it is the drivers responsibility to call
>>> + * drm_exec_init() and drm_exec_fini() accordingly.
>>> + *
>>> + * Note: This function is safe against concurrent insertion and removal of
>>> + * external objects, however it is not safe against concurrent usage itself.
>>> + *
>>> + * Drivers need to make sure to protect this case with either an outer VM lock
>>> + * or by calling drm_gpuvm_prepare_vm() before this function within the
>>> + * drm_exec_until_all_locked() loop, such that the GPUVM's dma-resv lock ensures
>>> + * mutual exclusion.
>>> + *
>>> + * Returns: 0 on success, negative error code on failure.
>>> + */
>>> +int
>>> +drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>>> +              struct drm_exec *exec,
>>> +              unsigned int num_fences)
>>> +{
>>> +    if (drm_gpuvm_resv_protected(gpuvm))
>>> +        return drm_gpuvm_prepare_objects_locked(gpuvm, exec,
>>> +                            num_fences);
>>> +    else
>>> +        return __drm_gpuvm_prepare_objects(gpuvm, exec, num_fences);
>>> +
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_objects);
>>> +
>>> +/**
>>> + * drm_gpuvm_prepare_range() - prepare all BOs mapped within a given range
>>> + * @gpuvm: the &drm_gpuvm
>>> + * @exec: the &drm_exec locking context
>>> + * @addr: the start address within the VA space
>>> + * @range: the range to iterate within the VA space
>>> + * @num_fences: the amount of &dma_fences to reserve
>>> + *
>>> + * Calls drm_exec_prepare_obj() for all &drm_gem_objects mapped between @addr
>>> + * and @addr + @range.
>>> + *
>>> + * Returns: 0 on success, negative error code on failure.
>>> + */
>>> +int
>>> +drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>>> +            u64 addr, u64 range, unsigned int num_fences)
>>> +{
>>> +    struct drm_gpuva *va;
>>> +    u64 end = addr + range;
>>> +    int ret;
>>> +
>>> +    drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
>>> +        struct drm_gem_object *obj = va->gem.obj;
>>> +
>>> +        ret = drm_exec_prepare_obj(exec, obj, num_fences);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_range);
>>> +
>>> +/**
>>> + * drm_gpuvm_exec_lock() - lock all dma-resv of all assoiciated BOs
>>> + * @vm_exec: the &drm_gpuvm_exec wrapper
>>> + * @num_fences: the amount of &dma_fences to reserve
>>> + * @interruptible: sleep interruptible if waiting
>>> + *
>>> + * Acquires all dma-resv locks of all &drm_gem_objects the given
>>> + * &drm_gpuvm contains mappings of.
>>> + *
>>> + * Addionally, when calling this function with struct drm_gpuvm_exec::extra
>>> + * being set the driver receives the given @fn callback to lock additional
>>> + * dma-resv in the context of the &drm_gpuvm_exec instance. Typically, drivers
>>> + * would call drm_exec_prepare_obj() from within this callback.
>>> + *
>>> + * Returns: 0 on success, negative error code on failure.
>>> + */
>>> +int
>>> +drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec,
>>> +            unsigned int num_fences,
>>> +            bool interruptible)
>>> +{
>>> +    struct drm_gpuvm *gpuvm = vm_exec->vm;
>>> +    struct drm_exec *exec = &vm_exec->exec;
>>> +    uint32_t flags;
>>> +    int ret;
>>> +
>>> +    flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
>>> +        DRM_EXEC_IGNORE_DUPLICATES;
>>> +
>>> +    drm_exec_init(exec, flags);
>>> +
>>> +    drm_exec_until_all_locked(exec) {
>>> +        ret = drm_gpuvm_prepare_vm(gpuvm, exec, num_fences);
>>> +        drm_exec_retry_on_contention(exec);
>>> +        if (ret)
>>> +            goto err;
>>> +
>>> +        ret = drm_gpuvm_prepare_objects(gpuvm, exec, num_fences);
>>> +        drm_exec_retry_on_contention(exec);
>>> +        if (ret)
>>> +            goto err;
>>> +
>>> +        if (vm_exec->extra.fn) {
>>> +            ret = vm_exec->extra.fn(vm_exec, num_fences);
>>> +            drm_exec_retry_on_contention(exec);
>>> +            if (ret)
>>> +                goto err;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +err:
>>> +    drm_exec_fini(exec);
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock);
>>> +
>>> +static int
>>> +fn_lock_array(struct drm_gpuvm_exec *vm_exec, unsigned int num_fences)
>>> +{
>>> +    struct {
>>> +        struct drm_gem_object **objs;
>>> +        unsigned int num_objs;
>>> +    } *args = vm_exec->extra.priv;
>>> +
>>> +    return drm_exec_prepare_array(&vm_exec->exec, args->objs,
>>> +                      args->num_objs, num_fences);
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_exec_lock_array() - lock all dma-resv of all assoiciated BOs
>>> + * @vm_exec: the &drm_gpuvm_exec wrapper
>>> + * @objs: additional &drm_gem_objects to lock
>>> + * @num_objs: the number of additional &drm_gem_objects to lock
>>> + * @num_fences: the amount of &dma_fences to reserve
>>> + * @interruptible: sleep interruptible if waiting
>>> + *
>>> + * Acquires all dma-resv locks of all &drm_gem_objects the given &drm_gpuvm
>>> + * contains mappings of, plus the ones given through @objs.
>>> + *
>>> + * Returns: 0 on success, negative error code on failure.
>>> + */
>>> +int
>>> +drm_gpuvm_exec_lock_array(struct drm_gpuvm_exec *vm_exec,
>>> +              struct drm_gem_object **objs,
>>> +              unsigned int num_objs,
>>> +              unsigned int num_fences,
>>> +              bool interruptible)
>>> +{
>>> +    struct {
>>> +        struct drm_gem_object **objs;
>>> +        unsigned int num_objs;
>>> +    } args;
>>> +
>>> +    args.objs = objs;
>>> +    args.num_objs = num_objs;
>>> +
>>> +    vm_exec->extra.fn = fn_lock_array;
>>> +    vm_exec->extra.priv = &args;
>>> +
>>> +    return drm_gpuvm_exec_lock(vm_exec, num_fences, interruptible);
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_array);
>>> +
>>> +/**
>>> + * drm_gpuvm_exec_lock_range() - prepare all BOs mapped within a given range
>>> + * @vm_exec: the &drm_gpuvm_exec wrapper
>>> + * @addr: the start address within the VA space
>>> + * @range: the range to iterate within the VA space
>>> + * @num_fences: the amount of &dma_fences to reserve
>>> + * @interruptible: sleep interruptible if waiting
>>> + *
>>> + * Acquires all dma-resv locks of all &drm_gem_objects mapped between @addr and
>>> + * @addr + @range.
>>> + *
>>> + * Returns: 0 on success, negative error code on failure.
>>> + */
>>> +int
>>> +drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
>>> +              u64 addr, u64 range,
>>> +              unsigned int num_fences,
>>> +              bool interruptible)
>>> +{
>>> +    struct drm_gpuvm *gpuvm = vm_exec->vm;
>>> +    struct drm_exec *exec = &vm_exec->exec;
>>> +    uint32_t flags;
>>> +    int ret;
>>> +
>>> +    flags = interruptible ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0 |
>>> +        DRM_EXEC_IGNORE_DUPLICATES;
>>> +
>>> +    drm_exec_init(exec, flags);
>>> +
>>> +    drm_exec_until_all_locked(exec) {
>>> +        ret = drm_gpuvm_prepare_range(gpuvm, exec, addr, range,
>>> +                          num_fences);
>>> +        drm_exec_retry_on_contention(exec);
>>> +        if (ret)
>>> +            goto err;
>>> +    }
>>> +
>>> +    return ret;
>>> +
>>> +err:
>>> +    drm_exec_fini(exec);
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_exec_lock_range);
>>> +
>>> +static int
>>> +__drm_gpuvm_validate(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
>>> +{
>>> +    const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>> +    struct drm_gpuvm_bo *vm_bo;
>>> +    LIST_HEAD(evict);
>>> +    int ret = 0;
>>> +
>>> +    for_each_vm_bo_in_list(gpuvm, evict, &evict, vm_bo) {
>>> +        ret = ops->vm_bo_validate(vm_bo, exec);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +    /* Drop ref in case we break out of the loop. */
>>> +    drm_gpuvm_bo_put(vm_bo);
>>> +    restore_vm_bo_list(gpuvm, evict);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int
>>> +drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
>>> +{
>>> +    const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>> +    struct drm_gpuvm_bo *vm_bo, *next;
>>> +    int ret = 0;
>>> +
>>> +    drm_gpuvm_resv_assert_held(gpuvm);
>>> +
>>> +    /* Iterate list safely, drivers typically remove the current entry from
>>> +     * their drm_gpuvm_ops::vm_bo_validate callback. Drivers might also
>>> +     * re-add the entry on failure; this is safe since on failure we break
>>> +     * out of the loop.
>>> +     */
>>> +    list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
>>> +                 list.entry.evict) {
>>> +        ret = ops->vm_bo_validate(vm_bo, exec);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/**
>>> + * drm_gpuvm_validate() - validate all BOs marked as evicted
>>> + * @gpuvm: the &drm_gpuvm to validate evicted BOs
>>> + * @exec: the &drm_exec instance used for locking the GPUVM
>>> + *
>>> + * Calls the &drm_gpuvm_ops::vm_bo_validate callback for all evicted buffer
>>> + * objects being mapped in the given &drm_gpuvm.
>>> + *
>>> + * Returns: 0 on success, negative error code on failure.
>>> + */
>>> +int
>>> +drm_gpuvm_validate(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
>>> +{
>>> +    const struct drm_gpuvm_ops *ops = gpuvm->ops;
>>> +
>>> +    if (unlikely(!ops || !ops->vm_bo_validate))
>>> +        return -ENOTSUPP;
>>> +
>>> +    if (drm_gpuvm_resv_protected(gpuvm))
>>> +        return drm_gpuvm_validate_locked(gpuvm, exec);
>>> +    else
>>> +        return __drm_gpuvm_validate(gpuvm, exec);
>>> +
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_validate);
>>> +
>>> +/**
>>> + * drm_gpuvm_resv_add_fence - add fence to private and all extobj
>>> + * dma-resv
>>> + * @gpuvm: the &drm_gpuvm to add a fence to
>>> + * @exec: the &drm_exec locking context
>>> + * @fence: fence to add
>>> + * @private_usage: private dma-resv usage
>>> + * @extobj_usage: extobj dma-resv usage
>>> + */
>>> +void
>>> +drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>>> +             struct drm_exec *exec,
>>> +             struct dma_fence *fence,
>>> +             enum dma_resv_usage private_usage,
>>> +             enum dma_resv_usage extobj_usage)
>>> +{
>>> +    struct drm_gem_object *obj;
>>> +    unsigned long index;
>>> +
>>> +    drm_exec_for_each_locked_object(exec, index, obj) {
>>> +        dma_resv_assert_held(obj->resv);
>>> +        dma_resv_add_fence(obj->resv, fence,
>>> +                   drm_gpuvm_is_extobj(gpuvm, obj) ?
>>> +                   private_usage : extobj_usage);
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
>>> +
>>>   /**
>>>    * drm_gpuvm_bo_create() - create a new instance of struct drm_gpuvm_bo
>>>    * @gpuvm: The &drm_gpuvm the @obj is mapped in.
>>> @@ -838,6 +1424,9 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
>>>       INIT_LIST_HEAD(&vm_bo->list.gpuva);
>>>       INIT_LIST_HEAD(&vm_bo->list.entry.gem);
>>> +    INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
>>> +    INIT_LIST_HEAD(&vm_bo->list.entry.evict);
>>> +
>>>       drm_gem_object_get(obj);
>>>       return vm_bo;
>>> @@ -858,6 +1447,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>>>       if (!lock)
>>>           drm_gpuvm_resv_assert_held(gpuvm);
>>> +    drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
>>> +    drm_gpuvm_bo_list_del(vm_bo, evict, lock);
>>> +
>>>       list_del(&vm_bo->list.entry.gem);
>>>       drm_gem_object_put(obj);
>>> @@ -994,6 +1586,60 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
>>> +/**
>>> + * drm_gpuvm_bo_extobj_add() - adds the &drm_gpuvm_bo to its &drm_gpuvm's
>>> + * extobj list
>>> + * @vm_bo: The &drm_gpuvm_bo to add to its &drm_gpuvm's the extobj list.
>>> + *
>>> + * Adds the given @vm_bo to its &drm_gpuvm's extobj list if not on the list
>>> + * already and if the corresponding &drm_gem_object is an external object,
>>> + * actually.
>>> + */
>>> +void
>>> +drm_gpuvm_bo_extobj_add(struct drm_gpuvm_bo *vm_bo)
>>> +{
>>> +    struct drm_gpuvm *gpuvm = vm_bo->vm;
>>> +    bool lock = !drm_gpuvm_resv_protected(gpuvm);
>>> +
>>> +    if (!lock)
>>> +        drm_gpuvm_resv_assert_held(gpuvm);
>>> +
>>> +    if (drm_gpuvm_is_extobj(gpuvm, vm_bo->obj))
>>> +        drm_gpuvm_bo_list_add(vm_bo, extobj, lock);
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_extobj_add);
>>> +
>>> +/**
>>> + * drm_gpuvm_bo_evict() - add / remove a &drm_gpuvm_bo to / from the &drm_gpuvms
>>> + * evicted list
>>> + * @vm_bo: the &drm_gpuvm_bo to add or remove
>>> + * @evict: indicates whether the object is evicted
>>> + *
>>> + * Adds a &drm_gpuvm_bo to or removes it from the &drm_gpuvms evicted list.
>>> + */
>>> +void
>>> +drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
>>> +{
>>> +    struct drm_gpuvm *gpuvm = vm_bo->vm;
>>> +    struct drm_gem_object *obj = vm_bo->obj;
>>> +    bool lock = !drm_gpuvm_resv_protected(gpuvm);
>>> +
>>> +    dma_resv_assert_held(obj->resv);
>>> +
>>> +    if (drm_gpuvm_is_extobj(gpuvm, obj)) {
>>> +        vm_bo->evicted = evict;
>> Does the lock case also need this?
> 
> It doesn't need it by itself, but since we have drm_gpuvm_bo::evicted now, I want it to
> consistently indicate whether the BO is evicted or not.
> 
>>> +
>>> +        if (!lock)
>>> +            return;
>>
>> Here the !lock case can not remove the gpuvm_bo from the list?
> 
> You mean because we'd expect that drm_gpuvm_bo_evict(vm_bo, false) can only be called from
> within gpuvm_validate(), which requires the VM's resv lock? What if there is a ttm_validate()
> call for only this GEM obj?
> 
> My idea was to remove VM_BOs from the evicted list in gpuvm_validate() directly, but I'm afraid
> I forgot that.

Fixed in [1].

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/gpuvm-next-fixes

> 
>>
>> Small patch here that I've been using for xe:
>>
>> https://patchwork.freedesktop.org/patch/561545/?series=124817&rev=1
>>
>> Thanks,
>>
>> Thomas
>>
>>

