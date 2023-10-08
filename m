Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F07BD101
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 00:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A309010E07F;
	Sun,  8 Oct 2023 22:49:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855AB10E07F
 for <nouveau@lists.freedesktop.org>; Sun,  8 Oct 2023 22:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696805344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RoCeCoMX24/5hVyJobJrqkSrDRXDwE+1UdG/KoqV90=;
 b=N8jbRgWa9JtgtwWZLcAvu4chtRLzWylRwXvqdzn1rIOC6lJdAo3JSDNd7a+VHnHYl0Atoc
 rDQ4TZRTxYe+9i4g/hCcCDT0REtLoXb1O1GlPdNoYSqaPCIldAlleC6qOtgy5AJBINaHhK
 pwUEBGD0LxKIpiGeAfsEvj2I0DPIzHs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-RZnCENQIP9KifpH7u46yww-1; Sun, 08 Oct 2023 18:49:03 -0400
X-MC-Unique: RZnCENQIP9KifpH7u46yww-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9ae70250ef5so540827466b.0
 for <nouveau@lists.freedesktop.org>; Sun, 08 Oct 2023 15:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696805342; x=1697410142;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RoCeCoMX24/5hVyJobJrqkSrDRXDwE+1UdG/KoqV90=;
 b=Jtu8DqsOXjDqbtvxhBfbm/LeWrWDGMHZR4LE7fPKZslsoh1t+Gh3PQLI9jnucVvBzP
 meyogMcYUXvaMaoMOw2wadqIhSTKGKAY5byjOmdwVr2Ra7QoZza4hBP8Y/9GF6l7ckGj
 zgSl3bf5kx5G5I2iIR8KkHT72DZ8iRwIDIv0yYLyAywa8LAnqMkktXbj/OfRiE7hBtEF
 rqKkPR7UkKCG8joHmw1y6VHZg+3K16JLRAQwkePv0atN2EZPHmqCUXHyeTX3eMDKJTZZ
 kO7ka1TpWb8b/xQ2OA7TGVEb/2ZB1eyxFFxuvY6ET7S4aqyxKhy47uqt3uDJVuYos9jL
 5tJg==
X-Gm-Message-State: AOJu0YzGQ3vG+gfoPeKlcS9aXuCmX5yTkt0t1+HqqMOE7e5kw3qO4hhh
 M0ZdbWv2CL/t+YkimYM28772aSBFlNjpebjKAVc8vKyj/eKKY56OoomOk18w9Npu8Q+SZQY+4z8
 yi7uFUJ/jmKfbDQzmI7sQetxNXg==
X-Received: by 2002:a17:907:9491:b0:9a5:962c:cb6c with SMTP id
 dm17-20020a170907949100b009a5962ccb6cmr9517875ejc.31.1696805341890; 
 Sun, 08 Oct 2023 15:49:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxCqadhL+eBtO1UnN5jQ0+5sVr4DxJPJn1QuUXhLYYWy1tVT37JkrCntS4Ig7ahTqbpbyayg==
X-Received: by 2002:a17:907:9491:b0:9a5:962c:cb6c with SMTP id
 dm17-20020a170907949100b009a5962ccb6cmr9517865ejc.31.1696805341476; 
 Sun, 08 Oct 2023 15:49:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a056402074700b0052f3471ccf6sm5426490edy.6.2023.10.08.15.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Oct 2023 15:49:00 -0700 (PDT)
Message-ID: <ec74271d-93b3-1c37-969b-aecc2d3deb7d@redhat.com>
Date: Mon, 9 Oct 2023 00:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20230928191624.13703-1-dakr@redhat.com>
 <95bfbf5c-286c-57a4-0170-19d775cf8d6b@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <95bfbf5c-286c-57a4-0170-19d775cf8d6b@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v5 0/6] [RFC] DRM GPUVM features
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

Hi Thomas,

On 10/5/23 11:35, Thomas Hellström wrote:
> Hi, Danilo
> 
> On 9/28/23 21:16, Danilo Krummrich wrote:
>> Currently GPUVM offers common infrastructure to track GPU VA allocations
>> and mappings, generically connect GPU VA mappings to their backing
>> buffers and perform more complex mapping operations on the GPU VA space.
>>
>> However, there are more design patterns commonly used by drivers, which
>> can potentially be generalized in order to make GPUVM represent the
>> basis of a VM implementation. In this context, this patch series aims at
>> generalizing the following elements.
>>
>> 1) Provide a common dma-resv for GEM objects not being used outside of
>>     this GPU-VM.
>>
>> 2) Provide tracking of external GEM objects (GEM objects which are
>>     shared with other GPU-VMs).
>>
>> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>>     GPU-VM contains mappings of.
>>
>> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>>     of, such that validation of evicted GEM objects is accelerated.
>>
>> 5) Provide some convinience functions for common patterns.
>>
>> The implementation introduces struct drm_gpuvm_bo, which serves as abstraction
>> combining a struct drm_gpuvm and struct drm_gem_object, similar to what
>> amdgpu does with struct amdgpu_bo_vm. While this adds a bit of complexity it
>> improves the efficiency of tracking external and evicted GEM objects.
>>
>> This patch series is also available at [3].
>>
>> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/gpuvm-next
>>
>> Changes in V2:
>> ==============
>>    - rename 'drm_gpuva_manager' -> 'drm_gpuvm' which generally leads to more
>>      consistent naming
>>    - properly separate commits (introduce common dma-resv, drm_gpuvm_bo
>>      abstraction, etc.)
>>    - remove maple tree for tracking external objects, use a list drm_gpuvm_bos
>>      per drm_gpuvm instead
>>    - rework dma-resv locking helpers (Thomas)
>>    - add a locking helper for a given range of the VA space (Christian)
>>    - make the GPUVA manager buildable as module, rather than drm_exec
>>      builtin (Christian)
>>
>> Changes in V3:
>> ==============
>>    - rename missing function and files (Boris)
>>    - warn if vm_obj->obj != obj in drm_gpuva_link() (Boris)
>>    - don't expose drm_gpuvm_bo_destroy() (Boris)
>>    - unlink VM_BO from GEM in drm_gpuvm_bo_destroy() rather than
>>      drm_gpuva_unlink() and link within drm_gpuvm_bo_obtain() to keep
>>      drm_gpuvm_bo instances unique
>>    - add internal locking to external and evicted object lists to support drivers
>>      updating the VA space from within the fence signalling critical path (Boris)
>>    - unlink external objects and evicted objects from the GPUVM's list in
>>      drm_gpuvm_bo_destroy()
>>    - add more documentation and fix some kernel doc issues
>>
>> Changes in V4:
>> ==============
>>    - add a drm_gpuvm_resv() helper (Boris)
>>    - add a drm_gpuvm::<list_name>::local_list field (Boris)
>>    - remove drm_gpuvm_bo_get_unless_zero() helper (Boris)
>>    - fix missing NULL assignment in get_next_vm_bo_from_list() (Boris)
>>    - keep a drm_gem_object reference on potential vm_bo destroy (alternatively we
>>      could free the vm_bo and drop the vm_bo's drm_gem_object reference through
>>      async work)
>>    - introduce DRM_GPUVM_RESV_PROTECTED flag to indicate external locking through
>>      the corresponding dma-resv locks to optimize for drivers already holding
>>      them when needed; add the corresponding lock_assert_held() calls (Thomas)
>>    - make drm_gpuvm_bo_evict() per vm_bo and add a drm_gpuvm_bo_gem_evict()
>>      helper (Thomas)
>>    - pass a drm_gpuvm_bo in drm_gpuvm_ops::vm_bo_validate() (Thomas)
>>    - documentation fixes
>>
>> Changes in V5:
>> ==============
>>    - use a root drm_gem_object provided by the driver as a base for the VM's
>>      common dma-resv (Christian)
>>    - provide a helper to allocate a "dummy" root GEM object in case a driver
>>      specific root GEM object isn't available
>>    - add a dedicated patch for nouveau to make use of the GPUVM's shared dma-resv
>>    - improve documentation (Boris)
>>    - the following patches are removed from the series, since they already landed
>>      in drm-misc-next
>>      - f72c2db47080 ("drm/gpuvm: rename struct drm_gpuva_manager to struct drm_gpuvm")
>>      - fe7acaa727e1 ("drm/gpuvm: allow building as module")
>>      - 78f54469b871 ("drm/nouveau: uvmm: rename 'umgr' to 'base'")
>>
>> Danilo Krummrich (6):
>>    drm/gpuvm: add common dma-resv per struct drm_gpuvm
>>    drm/gpuvm: add drm_gpuvm_flags to drm_gpuvm
>>    drm/gpuvm: add an abstraction for a VM / BO combination
>>    drm/gpuvm: track/lock/validate external/evicted objects
>>    drm/nouveau: make use of the GPUVM's shared dma-resv
>>    drm/nouveau: use GPUVM common infrastructure
>>
>>   drivers/gpu/drm/drm_gpuvm.c             | 1036 +++++++++++++++++++++--
>>   drivers/gpu/drm/nouveau/nouveau_bo.c    |   15 +-
>>   drivers/gpu/drm/nouveau/nouveau_bo.h    |    5 +
>>   drivers/gpu/drm/nouveau/nouveau_exec.c  |   52 +-
>>   drivers/gpu/drm/nouveau/nouveau_exec.h  |    4 -
>>   drivers/gpu/drm/nouveau/nouveau_gem.c   |   10 +-
>>   drivers/gpu/drm/nouveau/nouveau_sched.h |    4 +-
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  183 ++--
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.h  |    1 -
>>   include/drm/drm_gem.h                   |   32 +-
>>   include/drm/drm_gpuvm.h                 |  465 +++++++++-
>>   11 files changed, 1625 insertions(+), 182 deletions(-)
>>
>>
>> base-commit: a4ead6e37e3290cff399e2598d75e98777b69b37
> 
> One comment I had before on the GPUVM code in general was the licensing, but I'm not sure there was a reply. Is it possible to have this code dual MIT / GPLV2?

Personally, I don't have any objections. Please feel free to send a patch to change it, I'm happy to ACK it.

- Danilo

> 
> Thanks,
> 
> Thomas
> 
> 
> 

