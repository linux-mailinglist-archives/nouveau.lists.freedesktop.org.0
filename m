Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA17B8951
	for <lists+nouveau@lfdr.de>; Wed,  4 Oct 2023 20:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E951F10E3B2;
	Wed,  4 Oct 2023 18:24:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF1A10E3B2
 for <nouveau@lists.freedesktop.org>; Wed,  4 Oct 2023 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696443880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SOmUjy4ewgil/vdpgmMKA0zu4u1oLN4xpKp5BP8Qhk=;
 b=dXw4vtzRoEQcsTdgc6ybkrfMllF0uWZpMEwdiW0+6KED1KvND00UkWfd5Fyr9cbgGIxesW
 wHBuEw6bPTCEt9+A7TZqj2Olp9eXk4ORUEgfKmjsugLy5F+f2IXflaAEUejpPE6LzZSIz0
 0IDRmAXWUXlMnlzguayljKndbMFHk1g=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-gP7rqt-9NeOsqtaRcSft7w-1; Wed, 04 Oct 2023 14:24:23 -0400
X-MC-Unique: gP7rqt-9NeOsqtaRcSft7w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9b2cf504e3aso9381966b.2
 for <nouveau@lists.freedesktop.org>; Wed, 04 Oct 2023 11:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696443862; x=1697048662;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9SOmUjy4ewgil/vdpgmMKA0zu4u1oLN4xpKp5BP8Qhk=;
 b=vVn+qfRZXqUIECJqKOHC/qF7U3Bs6XEt9My0ZRBCXqs0wQljoSXj314pBO2ioY3tGE
 H5MKFqXjPEwPly4IvVnItiJKgXqpftUMLU+d4NmGwLJD2N9iNkY8KLUMo232Xv7dR3/n
 BC1VOpdZXe7iXXq/cymKKNYn/71+g/Zh+Fmf2HlJDcJ5QI8zWfzampDMBad/TJXknkcy
 3B+K2tePm9adJlElxyWgffG2oNh72FHyvKArC3HffVWUI/m0cGBR4TIopu/Nvq4yEvDe
 EovjT2Z3HoEPgEL8lCCOr9dDsr/M409mOAio6M0BGWmDXotY6/FhnjOGiqGe0ZkEMlU9
 xmTg==
X-Gm-Message-State: AOJu0YyXqkn96q/tnuPx4g6Wru31U2WYC3lCbql/KHU15D38lXxH6P1w
 6A4e00LQbRT//cHYQMfdUc2HJnovSZUy+2+2dqVaKABm41SNcN4yjwYZ8/adlIQmTrJWGxy+uuB
 gihmm3bmUxwbKIPKBRxRN+Oejjw==
X-Received: by 2002:a17:907:75f4:b0:9ae:699d:8a2f with SMTP id
 jz20-20020a17090775f400b009ae699d8a2fmr2872330ejc.2.1696443862643; 
 Wed, 04 Oct 2023 11:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaTGauzrgPDJoqH5o5zYkXK0yLuoPnRy4442MLPXXORZIQSn/BCnR2Wnhe+SJ2XqN1OnbK0g==
X-Received: by 2002:a17:907:75f4:b0:9ae:699d:8a2f with SMTP id
 jz20-20020a17090775f400b009ae699d8a2fmr2872308ejc.2.1696443862329; 
 Wed, 04 Oct 2023 11:24:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jw21-20020a17090776b500b009786c8249d6sm3256405ejc.175.2023.10.04.11.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 11:24:21 -0700 (PDT)
Message-ID: <cdb528b1-b53f-bff6-fdf9-260ee4bd897a@redhat.com>
Date: Wed, 4 Oct 2023 20:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
 <e4e68970-c7c9-55e2-9483-01252f38c956@linux.intel.com>
 <6b16ab6f-b1a2-efdb-04bf-5af4c3de381b@linux.intel.com>
 <6489f31f-8929-3e59-fbef-a22049cccbe3@redhat.com>
 <36233651a7675ab894134e41fc711fdcc71eefec.camel@linux.intel.com>
 <74d79ced-e811-bed9-6fb0-db694428c10f@redhat.com>
 <bbb235037b02336a8c69271d5ff97c69b2e8b597.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <bbb235037b02336a8c69271d5ff97c69b2e8b597.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v5 4/6] drm/gpuvm:
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



On 10/4/23 19:57, Thomas Hellström wrote:
> On Wed, 2023-10-04 at 19:17 +0200, Danilo Krummrich wrote:
>> On 10/4/23 17:29, Thomas Hellström wrote:
>>>
>>> On Wed, 2023-10-04 at 14:57 +0200, Danilo Krummrich wrote:
>>>> On 10/3/23 11:11, Thomas Hellström wrote:
>>>>
>>>> <snip>
>>>>
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_gpuvm_bo_evict() - add / remove a &drm_gpuvm_bo to
>>>>>>> /
>>>>>>> from the &drm_gpuvms
>>>>>>> + * evicted list
>>>>>>> + * @vm_bo: the &drm_gpuvm_bo to add or remove
>>>>>>> + * @evict: indicates whether the object is evicted
>>>>>>> + *
>>>>>>> + * Adds a &drm_gpuvm_bo to or removes it from the
>>>>>>> &drm_gpuvms
>>>>>>> evicted list.
>>>>>>> + */
>>>>>>> +void
>>>>>>> +drm_gpuvm_bo_evict(struct drm_gpuvm_bo *vm_bo, bool evict)
>>>>>>> +{
>>>>>>> +    struct drm_gem_object *obj = vm_bo->obj;
>>>>>>> +
>>>>>>> +    dma_resv_assert_held(obj->resv);
>>>>>>> +
>>>>>>> +    /* Always lock list transactions, even if
>>>>>>> DRM_GPUVM_RESV_PROTECTED is
>>>>>>> +     * set. This is required to protect multiple
>>>>>>> concurrent
>>>>>>> calls to
>>>>>>> +     * drm_gpuvm_bo_evict() with BOs with different
>>>>>>> dma_resv.
>>>>>>> +     */
>>>>>>
>>>>>> This doesn't work. The RESV_PROTECTED case requires the
>>>>>> evicted
>>>>>> flag we discussed before. The list is either protected by the
>>>>>> spinlock or the resv. Otherwise a list add could race with a
>>>>>> list
>>>>>> removal elsewhere.
>>>>
>>>> I think it does unless I miss something, but it might be a bit
>>>> subtle
>>>> though.
>>>>
>>>> Concurrent drm_gpuvm_bo_evict() are protected by the spinlock.
>>>> Additionally, when
>>>> drm_gpuvm_bo_evict() is called we hold the dma-resv of the
>>>> corresponding GEM object.
>>>>
>>>> In drm_gpuvm_validate() I assert that we hold *all* dma-resv,
>>>> which
>>>> implies that no
>>>> one can call drm_gpuvm_bo_evict() on any of the VM's objects and
>>>> no
>>>> one can add a new
>>>> one and directly call drm_gpuvm_bo_evict() on it either.
>>>
>>> But translated into how the data (the list in this case) is
>>> protected
>>> it becomes
>>>
>>> "Either the spinlock and the bo resv of a single list item OR the
>>> bo
>>> resvs of all bos that can potentially be on the list",
>>>
>>> while this is certainly possible to assert, any new / future code
>>> that
>>> manipulates the evict list will probably get this wrong and as a
>>> result
>>> the code becomes pretty fragile. I think drm_gpuvm_bo_destroy()
>>> already
>>> gets it wrong in that it, while holding a single resv, doesn't take
>>> the
>>> spinlock.
>>
>> That's true and I don't like it either. Unfortunately, with the dma-
>> resv
>> locking scheme we can't really protect the evict list without the
>> drm_gpuvm_bo::evicted trick properly.
>>
>> But as pointed out in my other reply, I'm a bit worried about the
>> drm_gpuvm_bo::evicted trick being too restrictive, but maybe it's
>> fine
>> doing it in the RESV_PROTECTED case.
> 
> Ah, indeed. I misread that as discussing the current code rather than
> the drm_gpuvm_bo::evicted trick. If validating only a subset, or a
> range, then with the drm_gpuvm_bo::evicted trick would be valid only
> for that subset.
> 
> But the current code would break because the condition of locking "the
> resvs of all bos that can potentially be on the list" doesn't hold
> anymore, and you'd get list corruption.
> 
> What *would* work, though, is the solution currently in xe, The
> original evict list, and a staging evict list whose items are copied
> over on validation. The staging evict list being protected by the
> spinlock, the original evict list by the resv, and they'd use separate
> list heads in the drm_gpuvm_bo, but that is yet another complication.
> 
> But I think if this becomes an issue, those VMs (perhaps OpenGL UMD
> VMs) only wanting to validate a subset, would simply initially rely on
> the current non-RESV solution. It looks like it's only a matter of
> flipping the flag on a per-vm basis.

If such a driver locks a range it can also just validate all locked
objects I guess.

And for everything else, we still have the spinlock protected variant,
where drivers can freely move things around by just taking the spinlock.

I think I will go ahead and add drm_gpuvm_bo::evicted, plus the helpers
I mentioned.

> 
> /Thomas
> 
> 
>>
>>>
>>> So I think that needs fixing, and if keeping that protection I
>>> think it
>>> needs to be documented with the list member and ideally an assert.
>>> But
>>> also note that lockdep_assert_held will typically give false true
>>> for
>>> dma_resv locks; as long as the first dma_resv lock locked in a
>>> drm_exec
>>> sequence  remains locked, lockdep thinks *all* dma_resv locks are
>>> held.
>>> (or something along those lines), so the resv lockdep asserts are
>>> currently pretty useless.
>>>
>>> /Thomas
>>>
>>>
>>>
>>>>
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Thomas
>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

