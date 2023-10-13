Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CF07C8542
	for <lists+nouveau@lfdr.de>; Fri, 13 Oct 2023 14:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBB210E054;
	Fri, 13 Oct 2023 12:05:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1638310E054
 for <nouveau@lists.freedesktop.org>; Fri, 13 Oct 2023 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697198715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+dcXEP+GxfBYG20ABDjpqfoHUMaa+MeG9Y3QKfP39fY=;
 b=gB4QGzwL7Ks3Q32L7IefYfiX/FcxLqa3zZKKRKVixMwoalCHR8WW/1VA9/QNtcloiRYgh8
 2ule8vtdVxUdh6z+b9rjF6Q8LjDlasn4YUwyhy30+RboLZ/a2pHLFLsxvIzjZUShnV932D
 cIc6/i2GmPKQESmttO/53Nza3ujbGXo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-u76n9ErwNLi5xqRXaDrcMA-1; Fri, 13 Oct 2023 08:05:13 -0400
X-MC-Unique: u76n9ErwNLi5xqRXaDrcMA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ba0616b761so152249066b.2
 for <nouveau@lists.freedesktop.org>; Fri, 13 Oct 2023 05:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697198712; x=1697803512;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dcXEP+GxfBYG20ABDjpqfoHUMaa+MeG9Y3QKfP39fY=;
 b=akUGZNaeCXJHaGHnXa0yZBn+zavxe8q/3wC9ZvbQMo+GFS6YAAmCrfwGJgpaz2CINI
 dgYFb8dxV0STELFyP32JVTh6aqzt4z6P2NziVA0eddop/puKi+KC5MGO/8NKD5Fm4mCi
 IrQQOfljY0lzSCh1Ir/2EPf4l2fVbNWAAWV4srw9CUsoNh8VD7AmoPIkCz7qxnH42vdb
 ZTQweCHJShnVgCuPl9nK/tBYL8edCJixTDFtv9F7l0L1My4K3+3Tzag6ULppbjGuyLDy
 pjXMsYOfIwh7oSYnLEZA1yiW5IidvQGBKpFO6XV962CiRwrUxcviZcGFjrBHoWdi9DUq
 awng==
X-Gm-Message-State: AOJu0Yx8uw6wZbE5EGZrGeqoiq4k097+/SE2Q+TQZ/CUCGWGQxC3Kik3
 CzWhch1KbzXCziwsHFCRgj+sSHfKPuL3owp2l1Y98eAFG4J4gacZGYeaaQuGh5LhIGMqT1Q/pW5
 E4S0d7pfOOT+co0ZBPz81Y5qG0Q==
X-Received: by 2002:a17:907:2723:b0:9a5:d657:47ee with SMTP id
 d3-20020a170907272300b009a5d65747eemr22847155ejl.58.1697198712724; 
 Fri, 13 Oct 2023 05:05:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVP4CGBK7VTrUzYEqzjKP5V5a2WbPdWtJr2jlo1Cabz8+0BX6tXBDev67FhhRKBk7WuWHZ/A==
X-Received: by 2002:a17:907:2723:b0:9a5:d657:47ee with SMTP id
 d3-20020a170907272300b009a5d65747eemr22847132ejl.58.1697198712443; 
 Fri, 13 Oct 2023 05:05:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a170906078c00b009b94fe3fc47sm12267409ejc.159.2023.10.13.05.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 05:05:12 -0700 (PDT)
Message-ID: <d586d845-fcb1-4ebc-b75d-3f147837c917@redhat.com>
Date: Fri, 13 Oct 2023 14:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231008233212.13815-1-dakr@redhat.com>
 <20231008233212.13815-5-dakr@redhat.com>
 <c6ce663d-dd69-46a2-7b55-359169b6c03c@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <c6ce663d-dd69-46a2-7b55-359169b6c03c@linux.intel.com>
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

On 10/10/23 08:40, Thomas Hellström wrote:
> 
> On 10/9/23 01:32, Danilo Krummrich wrote:
>> Currently the DRM GPUVM offers common infrastructure to track GPU VA
>> allocations and mappings, generically connect GPU VA mappings to their
>> backing buffers and perform more complex mapping operations on the GPU VA
>> space.
>>
>> However, there are more design patterns commonly used by drivers, which
>> can potentially be generalized in order to make the DRM GPUVM represent
>> a basis for GPU-VM implementations. In this context, this patch aims
>> at generalizing the following elements.
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
>> Big thanks to Boris Brezillon for his help to figure out locking for
>> drivers updating the GPU VA space within the fence signalling path.
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>
>> +/**
>> + * drm_gpuvm_resv_add_fence - add fence to private and all extobj
>> + * dma-resv
>> + * @gpuvm: the &drm_gpuvm to add a fence to
>> + * @exec: the &drm_exec locking context
>> + * @fence: fence to add
>> + * @private_usage: private dma-resv usage
>> + * @extobj_usage: extobj dma-resv usage
>> + */
>> +void
>> +drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
>> +             struct drm_exec *exec,
>> +             struct dma_fence *fence,
>> +             enum dma_resv_usage private_usage,
>> +             enum dma_resv_usage extobj_usage)
>> +{
>> +    struct drm_gem_object *obj;
>> +    unsigned long index;
>> +
>> +    drm_exec_for_each_locked_object(exec, index, obj) {
>> +        dma_resv_assert_held(obj->resv);
>> +        dma_resv_add_fence(obj->resv, fence,
>> +                   drm_gpuvm_is_extobj(gpuvm, obj) ?
>> +                   private_usage : extobj_usage);
> 
> It looks like private_usage and extobj_usage are mixed up above?

Good catch, will fix.

> 
> 
>> +    }
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gpuvm_resv_add_fence);
>> +
> 
> Thanks,
> 
> Thomas
> 
> 

