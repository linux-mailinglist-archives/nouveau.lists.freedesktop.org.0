Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E06617DD584
	for <lists+nouveau@lfdr.de>; Tue, 31 Oct 2023 18:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D75D10E59E;
	Tue, 31 Oct 2023 17:52:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE8E10E593
 for <nouveau@lists.freedesktop.org>; Tue, 31 Oct 2023 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698774774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MM0l2/ZF5doyc+5WQup6Ywo/07BlpO+C3i/f3pi7EBM=;
 b=blwWAZKyqQornByw4XRBecJB5MZPHoX7j9Vqz3/hNnimOSFKeTK5Jx3JMB+f+uGkTYtQ6S
 3BkFQSn6/s879QVIJctHKDQUbib6FouC/9PomdZOQgPUkKTTHErkUACffIqrTIED1I372J
 etJG7gJY1031sdwe1ocHAGs45uatUJI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-O2MaWFM9NYuFFteKVNubVg-1; Tue, 31 Oct 2023 13:52:53 -0400
X-MC-Unique: O2MaWFM9NYuFFteKVNubVg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-54373788269so799074a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 31 Oct 2023 10:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698774772; x=1699379572;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MM0l2/ZF5doyc+5WQup6Ywo/07BlpO+C3i/f3pi7EBM=;
 b=wzjanBzv0/Q7Uoo+tjluOMSSNXCIZxw3n/t5kZCOoV0H/cUMFjJVQ6pp/z/TSHTSqN
 ImRrAE9wGuAFtm6iBmAz0y5Jt2UNR1VRoQQkLn8tl45OchrE2ht9hHX8XPPWb+dq3/7T
 jXK+oK5xk+TdKG9JOY4MdBnXeHtQLaiFZp2GTKQr5P75qZ0yFs6FXVM6Dq6+Uow9d+YW
 N2azQilB03Z06dAkg7CKl5o0nOw2YVtPeoIxQhr9TY6/YQCK8tXYBRniJPxV8iWi/Y89
 XrEIdF1gBc5xywFTbdzuOFWOBnftZEEpM76loD+MpXWSwNKcy5U9E4aoQ61LgziAsdQr
 2ucw==
X-Gm-Message-State: AOJu0YxMV/l4JfaLUoGFq41Iw97FexMNk/PTcVeVKrZHKNED2L2QcvAR
 XN1cdzYTDoD2MhwG7aYaCe0pPS1jqAmthG8J0WcOGcDPy+pjSZIT/R1SbxfAXmms94hTu5CbbWD
 LMbe+hCOcK9X5f/LVdmQ9QMXDVQ==
X-Received: by 2002:a05:6402:5214:b0:540:caed:3619 with SMTP id
 s20-20020a056402521400b00540caed3619mr14093215edd.24.1698774769231; 
 Tue, 31 Oct 2023 10:52:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqrQl2BkPvKjejlZpdYejly+6BkpnQx23fRbw5JtUR23RuBxlpngOmivqZXHT036Dx+L2nJA==
X-Received: by 2002:a05:6402:5214:b0:540:caed:3619 with SMTP id
 s20-20020a056402521400b00540caed3619mr14093033edd.24.1698774767721; 
 Tue, 31 Oct 2023 10:52:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a50ccc8000000b0053e15aefb0fsm1512922edj.85.2023.10.31.10.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 10:52:47 -0700 (PDT)
Message-ID: <b09e37f3-33f6-4ea8-876b-f0bee9627ced@redhat.com>
Date: Tue, 31 Oct 2023 18:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
 <980754a3-7f5a-465e-88a9-62a40c82cae8@redhat.com>
 <ab8f30452540171447118d64931e66da96b6e85e.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ab8f30452540171447118d64931e66da96b6e85e.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an
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

On 10/31/23 17:45, Thomas Hellström wrote:
> On Tue, 2023-10-31 at 17:39 +0100, Danilo Krummrich wrote:
>> On 10/31/23 12:25, Thomas Hellström wrote:
>>> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>>>> Add an abstraction layer between the drm_gpuva mappings of a
>>>> particular
>>>> drm_gem_object and this GEM object itself. The abstraction
>>>> represents
>>>> a
>>>> combination of a drm_gem_object and drm_gpuvm. The drm_gem_object
>>>> holds
>>>> a list of drm_gpuvm_bo structures (the structure representing
>>>> this
>>>> abstraction), while each drm_gpuvm_bo contains list of mappings
>>>> of
>>>> this
>>>> GEM object.
>>>>
>>>> This has multiple advantages:
>>>>
>>>> 1) We can use the drm_gpuvm_bo structure to attach it to various
>>>> lists
>>>>      of the drm_gpuvm. This is useful for tracking external and
>>>> evicted
>>>>      objects per VM, which is introduced in subsequent patches.
>>>>
>>>> 2) Finding mappings of a certain drm_gem_object mapped in a
>>>> certain
>>>>      drm_gpuvm becomes much cheaper.
>>>>
>>>> 3) Drivers can derive and extend the structure to easily
>>>> represent
>>>>      driver specific states of a BO for a certain GPUVM.
>>>>
>>>> The idea of this abstraction was taken from amdgpu, hence the
>>>> credit
>>>> for
>>>> this idea goes to the developers of amdgpu.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gpuvm.c            | 335
>>>> +++++++++++++++++++++--
>>>> --
>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c |  64 +++--
>>>>    include/drm/drm_gem.h                  |  32 +--
>>>>    include/drm/drm_gpuvm.h                | 188 +++++++++++++-
>>>>    4 files changed, 533 insertions(+), 86 deletions(-)
>>>
>>> That checkpatch.pl error still remains as well.
>>
>> I guess you refer to:
>>
>> ERROR: do not use assignment in if condition
>> #633: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
>> +                       if (!(op->gem.obj = obj))
>>
>> This was an intentional decision, since in this specific case it
>> seems to
>> be more readable than the alternatives.
>>
>> However, if we consider this to be a hard rule, which we never ever
>> break,
>> I'm fine changing it too.
> 
> With the errors, sooner or later they are going to start generate
> patches to "fix" them. In this particular case also Xe CI is
> complaining and abort building when I submit the Xe adaptation, so it'd
> be good to be checkpatch.pl conformant IMHO.

Ok, I will change this one.

However, in general my opinion on coding style is that we should preserve us
the privilege to deviate from it when we agree it makes sense and improves
the code quality.

Having a CI forcing people to *blindly* follow certain rules and even abort
building isn't very beneficial in that respect.

Also, consider patches which partially change a line of code that already
contains a coding style "issue" - the CI would also block you on that one I
guess. Besides that it seems to block you on unrelated code, note that the
assignment in question is from Nouveau and not from GPUVM.

- Danilo

> 
> Thanks,
> Thomas
> 
> 
> 
> 
>>
>>>
>>> Thanks,
>>> Thomas
>>>
>>
> 

