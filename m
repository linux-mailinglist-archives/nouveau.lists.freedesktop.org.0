Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8B79AA9F
	for <lists+nouveau@lfdr.de>; Mon, 11 Sep 2023 19:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686DF10E32B;
	Mon, 11 Sep 2023 17:49:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E53110E32B
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694454549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=St0OIFMZR2EddndtcFLYyMwK3Fvt2qDifveALpwjgwM=;
 b=Sh7gc3lqeFUAC4XSQ4dy7QHqZqIYliLGIe3IJTXaHDsGtPSVdET/uh6B5DKbhl+68VHuFU
 GvE4oEckKwfl+ntgBWfLdKA5IWU1kz8RQSRy3dOa+vORirwtMrI0eqPGItLespq/KdWAS7
 P7tyEKCl4o8YEhWISOqbqqPsEmHvSi4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-8q6A7Hc_M_y8G8iy16H_Jw-1; Mon, 11 Sep 2023 13:49:07 -0400
X-MC-Unique: 8q6A7Hc_M_y8G8iy16H_Jw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-98e40d91fdfso323773666b.3
 for <nouveau@lists.freedesktop.org>; Mon, 11 Sep 2023 10:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694454546; x=1695059346;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=St0OIFMZR2EddndtcFLYyMwK3Fvt2qDifveALpwjgwM=;
 b=HvfaYdQjEI5T0IZexdfhj4CxXUDuJUKwlNwZ70l1rCm/h4fStYY/x6dDUbkPA4IdQ5
 6t5KQFxf/o/0oJoROiAdk0VlXzhOFqM7p4huA+yuEQad/zoMaO0V5otFfHc/UK9XpI+l
 xiSH4cg7C2JJxcGvwzTjxl0Wgcz+amexTVxXoD9Qd2hK6bwqaotT/c4zZMgzWga6BWmI
 nIrhAj7x9UM4SXwXDQCcyjaGDObqLjQRwLw6nAzvgQ6SOPf4TL6bzxQ2IwRoHcC57pt2
 Ya7DpwTqeQX+D8tTjhoUX7TSxzthUKNTaTaauj03M9OlotnXEqdIA64Kfw+oj4STD1ti
 fXQg==
X-Gm-Message-State: AOJu0YwSS0StfDwmcb6QYcKt67V+rxbekCfZdR4VO5Z8C5H/xkjsrZt0
 VC+wvkw1/kSYOIFDWfafRVchMnASumBlwexyI02GPoZxfL0H5Dp9L4d7S8ohtoOErRRUoOa++kG
 Ur8I02ZbpZFISemLp25M/mPCSbA==
X-Received: by 2002:a17:906:9713:b0:9a1:be5b:f4aa with SMTP id
 k19-20020a170906971300b009a1be5bf4aamr7888325ejx.0.1694454546464; 
 Mon, 11 Sep 2023 10:49:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJT7jpbp9w+Jd4iB1jj177KBarF5tpW4Kb+y9RLOsrxNRVTCbPPhmW6pX+J4jSq1kcXfWr9Q==
X-Received: by 2002:a17:906:9713:b0:9a1:be5b:f4aa with SMTP id
 k19-20020a170906971300b009a1be5bf4aamr7888308ejx.0.1694454546201; 
 Mon, 11 Sep 2023 10:49:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a170906b11800b0099c971ba285sm5685580ejy.5.2023.09.11.10.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 10:49:05 -0700 (PDT)
Message-ID: <06bbb49d-974f-e3bb-f844-1509313066cc@redhat.com>
Date: Mon, 11 Sep 2023 19:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-6-dakr@redhat.com>
 <0a8799c3-1d4c-8d87-ebca-013f6541fbc4@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <0a8799c3-1d4c-8d87-ebca-013f6541fbc4@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v3 5/7] drm/gpuvm: add an
 abstraction for a VM / BO combination
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

On 9/11/23 19:19, Thomas Hellström wrote:
> Hi, Danilo
> 
> On 9/9/23 17:31, Danilo Krummrich wrote:
>> This patch adds an abstraction layer between the drm_gpuva mappings of
>> a particular drm_gem_object and this GEM object itself. The abstraction
>> represents a combination of a drm_gem_object and drm_gpuvm. The
>> drm_gem_object holds a list of drm_gpuvm_bo structures (the structure
>> representing this abstraction), while each drm_gpuvm_bo contains list of
>> mappings of this GEM object.
>>
>> This has multiple advantages:
>>
>> 1) We can use the drm_gpuvm_bo structure to attach it to various lists
>>     of the drm_gpuvm. This is useful for tracking external and evicted
>>     objects per VM, which is introduced in subsequent patches.
>>
>> 2) Finding mappings of a certain drm_gem_object mapped in a certain
>>     drm_gpuvm becomes much cheaper.
>>
>> 3) Drivers can derive and extend the structure to easily represent
>>     driver specific states of a BO for a certain GPUVM.
>>
>> The idea of this abstraction was taken from amdgpu, hence the credit for
>> this idea goes to the developers of amdgpu.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Did you consider having the drivers embed the struct drm_gpuvm_bo in their own bo definition? I figure that would mean using the gem bo's refcounting and providing a helper to call from the driver's bo release. Looks like that could potentially save a lot of code? Or is there something that won't work with that approach?

There are drm_gpuvm_ops::vm_bo_alloc and drm_gpuvm_ops::vm_bo_free callback for drivers to register for that purpose.

- Danilo

> 
> Thanks,
> 
> Thomas
> 
> 

