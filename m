Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C089B7DF8C0
	for <lists+nouveau@lfdr.de>; Thu,  2 Nov 2023 18:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE4F10E8DC;
	Thu,  2 Nov 2023 17:32:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4BB10E967
 for <nouveau@lists.freedesktop.org>; Thu,  2 Nov 2023 17:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698946368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5kCMluhNBrBta3fRXenDD6+1dVUGkt/m4UDxiURyOc=;
 b=aVbFpUMfiitGu95ag2hUdq1e9CSn1jBH6ByqWwbggNi75I27UH5VctkAmhQqFb907cC4vw
 07BTx/1zhXZy68J4rmeym+YLx5SL36zVBs7Ncii+ze+5nW43h1LWo+b0pA4yGU6uihvz3J
 ypkcPtN+CJSzKXG3kZDLzPrQUb1fXF0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-53BgM7snOCOCf_fGyJrgrA-1; Thu, 02 Nov 2023 13:32:46 -0400
X-MC-Unique: 53BgM7snOCOCf_fGyJrgrA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9d30a6a67abso87286566b.2
 for <nouveau@lists.freedesktop.org>; Thu, 02 Nov 2023 10:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698946366; x=1699551166;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5kCMluhNBrBta3fRXenDD6+1dVUGkt/m4UDxiURyOc=;
 b=Pq1W8p1qSoyP7WHhf5QubUvDINhlawqGDQE6B5t70h0SrwoWTKCwOsFj4umNJonmt3
 b31x1BKsxo21o2aslGsW2eusZVtqHJgmFeniXQ235UQbK6O5SZeyAPIEda1fR0mnW/mz
 stxq0WyeLeELjJupF8JMWw600OLghwlh36eLL3d8LK1cLI34/3Wgd4XFrTbYpMqG543U
 rB3vu1XEpNiWo60mB09RcQjtrqvh46NwFOcSaafMTK0kfkOauo2ymo8qDWSrZ10Uwr7x
 CZEqgoIkLsDoIT02oMavjtuFZ9Qy63vkchninnefJ/Q09AW7gRan1Cm2pObBFSc1iwQR
 4Jwg==
X-Gm-Message-State: AOJu0Yy8qHZ3xRhwb7jt063GjkQ4aSX9jLPZXk/ODX1lS9tk7hpZ7lLX
 /VirT6u+PdIrtN2Z5jUWWdKbY36mqxKTCQ0p4dTKXa9HcNHIN2D99EyWZR/cTjIBHrB5nLWLl1t
 8q95HnYu8Uo/Kg3j0y8XZ0uwVTw==
X-Received: by 2002:a17:906:fe45:b0:9ad:e298:a5d with SMTP id
 wz5-20020a170906fe4500b009ade2980a5dmr6397358ejb.19.1698946365842; 
 Thu, 02 Nov 2023 10:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzgk012/Yr6RhugotSSQNX2ZiY9KJ2MC3G5GO4yvntN3YgSXjg4knlAoGtTNjw5tfws5OPFg==
X-Received: by 2002:a17:906:fe45:b0:9ad:e298:a5d with SMTP id
 wz5-20020a170906fe4500b009ade2980a5dmr6397339ejb.19.1698946365516; 
 Thu, 02 Nov 2023 10:32:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 bg6-20020a170906a04600b0098951bb4dc3sm1370336ejb.184.2023.11.02.10.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 10:32:44 -0700 (PDT)
Message-ID: <7eba1e4d-b594-4b88-9f8a-694fc6663f85@redhat.com>
Date: Thu, 2 Nov 2023 18:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <f95dd975acc6c82e4e6cd0596c14072799eb5a20.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f95dd975acc6c82e4e6cd0596c14072799eb5a20.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference
 count drm_gpuvm structures
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

thanks for your timely response on that!

On 11/2/23 18:09, Thomas Hellström wrote:
> On Thu, 2023-11-02 at 00:31 +0100, Danilo Krummrich wrote:
>> Implement reference counting for struct drm_gpuvm.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-----
>> --
>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
>>   include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
>>   3 files changed, 78 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>> b/drivers/gpu/drm/drm_gpuvm.c
>> index 53e2c406fb04..6a88eafc5229 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
>> char *name,
>>          gpuvm->rb.tree = RB_ROOT_CACHED;
>>          INIT_LIST_HEAD(&gpuvm->rb.list);
>>   
>> +       kref_init(&gpuvm->kref);
>> +
>>          gpuvm->name = name ? name : "unknown";
>>          gpuvm->flags = flags;
>>          gpuvm->ops = ops;
>> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
>> char *name,
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>   
>> -/**
>> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
>> - * @gpuvm: pointer to the &drm_gpuvm to clean up
>> - *
>> - * Note that it is a bug to call this function on a manager that
>> still
>> - * holds GPU VA mappings.
>> - */
>> -void
>> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>> +static void
>> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>>   {
>>          gpuvm->name = NULL;
>>   
>> @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>   
>>          drm_gem_object_put(gpuvm->r_obj);
>>   }
>> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>> +
>> +static void
>> +drm_gpuvm_free(struct kref *kref)
>> +{
>> +       struct drm_gpuvm *gpuvm = container_of(kref, struct
>> drm_gpuvm, kref);
>> +
>> +       if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
>> +               return;
>> +
>> +       drm_gpuvm_fini(gpuvm);
>> +
>> +       gpuvm->ops->vm_free(gpuvm);
>> +}
>> +
>> +/**
>> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
> copy-paste error in function name.
> 
> Also it appears like xe might put a vm from irq context so we should
> document the context where this function call is allowable, and if
> applicable add a might_sleep().

 From GPUVM PoV I don't see why we can't call this from an IRQ context.
It depends on the driver callbacks of GPUVM (->vm_free) and the resv GEM's
free callback. Both are controlled by the driver. Hence, I don't see the
need for a restriction here.

> 
> If this function needs to sleep we can work around that in Xe by
> keeping an xe-private refcount for the xe vm container, but I'd like to
> avoid that if possible and piggy-back on the refcount introduced here.
> 
>> + * @gpuvm: the &drm_gpuvm to release the reference of
>> + *
>> + * This releases a reference to @gpuvm.
>> + */
>> +void
>> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>> +{
>> +       if (gpuvm)
>> +               kref_put(&gpuvm->kref, drm_gpuvm_free);
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>>   
>>   static int
>>   __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>> @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>          if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>>                  return -EINVAL;
>>   
>> -       return __drm_gpuva_insert(gpuvm, va);
>> +       return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
> 
> Here we leak a reference if __drm_gpuva_insert() fails, and IMO the
> reference should be taken where the pointer holding the reference is
> assigned (in this case in __drm_gpuva_insert()), or document the
> reference transfer from the argument close to the assignment.

Ah, good catch. I had it in __drm_gpuva_insert() originally, but that
doesn't work, because __drm_gpuva_insert() is used to insert the
kernel_alloc_node. And we need to __drm_gpuva_remove() the kernel_alloc_node
from drm_gpuvm_fini(), which is called when the reference count is at zero
already. In fact, the __* variants are only there to handle the
kernel_alloc_node and this one clearly doesn't need reference counting.

> 
> But since a va itself is not refcounted it clearly can't outlive the
> vm, so is a reference really needed here?

Well, technically, it can. It just doesn't make any sense and would be
considered to be a bug. The reference count comes in handy to prevent
that in the first place.

I'd like to keep the reference count and just fix up the code.

> 
> I'd suggest using an accessor that instead of using va->vm uses va-
>> vm_bo->vm, to avoid needing to worry about the vm->vm refcount
> altoghether.

No, I want to keep that optional. Drivers should be able to use GPUVM to
track mappings without being required to implement everything else.

I think PowerVR, for instance, currently uses GPUVM only to track mappings
without everything else.

- Danilo

> 
> Thanks,
> Thomas
> 

