Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 584DC7A958A
	for <lists+nouveau@lfdr.de>; Thu, 21 Sep 2023 17:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFDD10E5E6;
	Thu, 21 Sep 2023 15:31:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70DD10E122
 for <nouveau@lists.freedesktop.org>; Thu, 21 Sep 2023 15:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695310258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXnMf1W75YQNgEBB3g7F1jD12M4QhXb2+vUMggzeZAQ=;
 b=SMXebTTMc7RbEVni0LI8QGrpIYUWj5wi/G9blAVK59tsAvdXXCoatvXUcYnzYLcevMjzGQ
 BasnKXGfSWpCNtOPBseZMeia2ExohfnGngCyEZH5YKc9HsaQYHkwymR4Sr4onZPRztEQnd
 qazi/RRb/InkzsHjPOPQkbNa5AtDYk8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-MzKsGzjQMcmSrmiCErulkA-1; Thu, 21 Sep 2023 11:30:54 -0400
X-MC-Unique: MzKsGzjQMcmSrmiCErulkA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-403ca0e2112so8616415e9.0
 for <nouveau@lists.freedesktop.org>; Thu, 21 Sep 2023 08:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695310253; x=1695915053;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sXnMf1W75YQNgEBB3g7F1jD12M4QhXb2+vUMggzeZAQ=;
 b=S0fOkd2h54swbMjiFapC7rZ8nGw/C/9zs3iy4ADhAi828znwPVVYze5cO0Qjh08nHs
 cd3RfC4sxX7+5jjp7zXmadyFVfNZWis16Jg9m8ir+OxaTqqArcHw62oMS0vKhl6m98/u
 Q4e6oYWxDZPbOy3blTPBou269zbrxH2HzSuzcKASkiPEoDCQLDwWYwWb8XTPT9mJl9RC
 5jLYMHzby/0I759rMVMlCqhFaUWkVsPriLJgXIdItzrfZcz7MOPNEUaPoA8Wfwp2iTcO
 hl3VbEu9gAQZJqSKwPttt0C5oVBwKE6s3xHQd2qJA9IH/hK863OKqdyyhojOjaMB+SRK
 gxIg==
X-Gm-Message-State: AOJu0Yx/No5/xB6hbDcfz9JaqjzPBne/sBGliaP1Qw8O2LDr6i3PrCxE
 WeZgY67CGXbFQvmXJNHPYjHLZuHyuL+TD4zXJRGZbNTWNXaXsH6gUdbabZC123XoizZIEPD+Q9Q
 VF3k3Njft/QvU6Cx9D7qtBNccnQ==
X-Received: by 2002:a05:600c:3152:b0:405:34e4:14e3 with SMTP id
 h18-20020a05600c315200b0040534e414e3mr1543989wmo.3.1695310253457; 
 Thu, 21 Sep 2023 08:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtxQnMWHUY0qp9Q/0QzRCwEuK/ltsO8A/Hn6c8CvGt58bCdo3sRqK2fNxy7s9Yy6dTf3IqDA==
X-Received: by 2002:a05:600c:3152:b0:405:34e4:14e3 with SMTP id
 h18-20020a05600c315200b0040534e414e3mr1543959wmo.3.1695310252952; 
 Thu, 21 Sep 2023 08:30:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a05600c20c400b003fc0505be19sm2234610wmm.37.2023.09.21.08.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 08:30:52 -0700 (PDT)
Message-ID: <817b1d65-3a3a-4d00-7995-ef5a552bfe5d@redhat.com>
Date: Thu, 21 Sep 2023 17:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-5-dakr@redhat.com>
 <7951dc11-6047-6beb-8ef8-98c862e26ec3@amd.com>
 <964a1bdd-549d-7850-9a8c-8278c4cd32ec@redhat.com>
 <20230921162510.10903d90@collabora.com>
 <72ea51ca-f7b0-2e2a-b276-6c6c7413374b@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <72ea51ca-f7b0-2e2a-b276-6c6c7413374b@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v4 4/8] drm/gpuvm: add common
 dma-resv per struct drm_gpuvm
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, daniel@ffwll.ch, faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/21/23 16:34, Christian König wrote:
> 
> 
> Am 21.09.23 um 16:25 schrieb Boris Brezillon:
>> On Thu, 21 Sep 2023 15:34:44 +0200
>> Danilo Krummrich <dakr@redhat.com> wrote:
>>
>>> On 9/21/23 09:39, Christian König wrote:
>>>> Am 20.09.23 um 16:42 schrieb Danilo Krummrich:
>>>>> Provide a common dma-resv for GEM objects not being used outside of this
>>>>> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
>>>>> external and evicted object handling and GEM validation.
>>>>>
>>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>>> ---
>>>>>    drivers/gpu/drm/drm_gpuvm.c            |  9 +++++++--
>>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>>>>>    include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
>>>>>    3 files changed, 24 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>>>> index bfea4a8a19ec..cbf4b738a16c 100644
>>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>>> @@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>>>    /**
>>>>>     * drm_gpuvm_init() - initialize a &drm_gpuvm
>>>>>     * @gpuvm: pointer to the &drm_gpuvm to initialize
>>>>> + * @drm: the drivers &drm_device
>>>>>     * @name: the name of the GPU VA space
>>>>>     * @start_offset: the start offset of the GPU VA space
>>>>>     * @range: the size of the GPU VA space
>>>>> @@ -668,7 +669,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
>>>>>     * &name is expected to be managed by the surrounding driver structures.
>>>>>     */
>>>>>    void
>>>>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
>>>>>               const char *name,
>>>>>               u64 start_offset, u64 range,
>>>>>               u64 reserve_offset, u64 reserve_range,
>>>>> @@ -694,6 +695,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
>>>>>                                 reserve_range)))
>>>>>                __drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
>>>>>        }
>>>>> +
>>>>> +    drm_gem_private_object_init(drm, &gpuvm->d_obj, 0);
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>>>> @@ -713,7 +716,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>>            __drm_gpuva_remove(&gpuvm->kernel_alloc_node);
>>>>>        WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.rb_root),
>>>>> -         "GPUVA tree is not empty, potentially leaking memory.");
>>>>> +         "GPUVA tree is not empty, potentially leaking memory.\n");
>>>>> +
>>>>> +    drm_gem_private_object_fini(&gpuvm->d_obj);
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>> index 6c86b64273c3..a80ac8767843 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>> @@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
>>>>>        uvmm->kernel_managed_addr = kernel_managed_addr;
>>>>>        uvmm->kernel_managed_size = kernel_managed_size;
>>>>> -    drm_gpuvm_init(&uvmm->base, cli->name,
>>>>> +    drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->name,
>>>>>                   NOUVEAU_VA_SPACE_START,
>>>>>                   NOUVEAU_VA_SPACE_END,
>>>>>                   kernel_managed_addr, kernel_managed_size,
>>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>>> index 0e802676e0a9..6666c07d7c3e 100644
>>>>> --- a/include/drm/drm_gpuvm.h
>>>>> +++ b/include/drm/drm_gpuvm.h
>>>>> @@ -240,14 +240,29 @@ struct drm_gpuvm {
>>>>>         * @ops: &drm_gpuvm_ops providing the split/merge steps to drivers
>>>>>         */
>>>>>        const struct drm_gpuvm_ops *ops;
>>>>> +
>>>>> +    /**
>>>>> +     * @d_obj: Dummy GEM object; used internally to pass the GPU VMs
>>>>> +     * dma-resv to &drm_exec. Provides the GPUVM's &dma-resv.
>>>>> +     */
>>>>> +    struct drm_gem_object d_obj;
>>>> Yeah, as pointed out in the other mail that won't work like this.
>>> Which one? Seems that I missed it.
>>>
>>>> The GPUVM contains GEM objects and therefore should probably have a reference to those objects.
>>>>
>>>> When those GEM objects now use the dma-resv object embedded inside the GPUVM then they also need a reference to the GPUVM to make sure the dma-resv object won't be freed before they are freed.
>>> My assumption here is that GEM objects being local to a certain VM never out-live the VM. We never share it with anyone, otherwise it would be external and hence wouldn't carray the VM's dma-resv. The only references I see are from the VM itself (which is fine) and from userspace. The latter isn't a problem as long as all GEM handles are closed before the VM is destroyed on FD close.
>> But we don't want to rely on userspace doing the right thing (calling
>> GEM_CLOSE before releasing the VM), do we?
>>
>> BTW, even though my private BOs have a ref to their exclusive VM, I just
>> ran into a bug because drm_gem_shmem_free() acquires the resv lock
>> (which is questionable, but that's not the topic :-)) and
>> I was calling vm_put(bo->exclusive_vm) before drm_gem_shmem_free(),
>> leading to a use-after-free when the gem->resv is acquired. This has
>> nothing to do with drm_gpuvm, but it proves that this sort of bug is
>> likely to happen if we don't pay attention.
>>
>>> Do I miss something? Do we have use cases where this isn't true?
>> The other case I can think of is GEM being v[un]map-ed (kernel
>> mapping) after the VM was released.
> 
> I think the file reference and the VM stays around in those cases as well, but yes I also think we have use cases which won't work.
> 
>>
>>>> This is a circle reference dependency.
>> FWIW, I solved that by having a vm_destroy() function that kills all the
>> mappings in a VM, which in turn releases all the refs the VM had on
>> private BOs. Then, it's just a matter of waiting for all private GEMs
>> to be destroyed to get the final steps of the VM destruction, which is
>> really just about releasing resources (it's called panthor_vm_release()
>> in my case) executed when the VM refcount drops to zero.
>>
>>>> The simplest solution I can see is to let the driver provide the GEM object to use. Amdgpu uses the root page directory object for this.
>>> Sure, we can do that, if we see cases where VM local GEM objects can out-live the VM.
>>>> Apart from that I strongly think that we shouldn't let the GPUVM code create a driver GEM object. We did that in TTM for the ghost objects and it turned out to be a bad idea.
>> Would that really solve the circular ref issue? I mean, if you're
>> taking the root page dir object as your VM resv, you still have to make
>> sure it outlives the private GEMs, which means, you either need
>> to take a ref on the object, leading to the same circular ref mess, or
>> you need to reset private GEMs resvs before destroying this root page
>> dir GEM (whose lifecyle is likely the same as your VM object which
>> embeds the drm_gpuvm instance).
> 
> Yes it does help, see how amdgpu does it:
> 
> The VM references all BOs, e.g. page tables as well as user BOs.
> 
> The BOs which use the dma-resv of the root page directory also reference the root page directorys BO.
> 
> So when the VM drops all references the page tables and user BO are released first and the root page directory which everybody references last.

I think that works, unfortunately it's all driver specific. I it seems like that's just how it is.

> 
>> Making it driver-specific just moves the responsibility back to drivers
>> (and also allows re-using an real GEM object instead of a dummy one,
>> but I'm not sure we care about saving a few hundreds bytes at that
>> point), which is a good way to not take the blame if the driver does
>> something wrong, but also doesn't really help people do the right thing.
> 
> The additional memory usage is irrelevant, but we have very very bad experience with TTM using dummy objects similar to this here.
> 
> They tend to end up in driver specific functions and then the driver will try to upcast those dummy to driver specific BOs. In the end you get really hard to figure out memory corruptions.

I fully agree, however for some drivers it might just be necessary to pass a dummy GEM in case they don't have a real one to pass.

> 
> Regards,
> Christian.
> 

