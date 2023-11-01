Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20F7DE54A
	for <lists+nouveau@lfdr.de>; Wed,  1 Nov 2023 18:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880A710E75A;
	Wed,  1 Nov 2023 17:23:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F7510E758
 for <nouveau@lists.freedesktop.org>; Wed,  1 Nov 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698859425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXewshFpfkGDn8j5Fh6rL3ELP7XseQ2PaUs6p1ijoKo=;
 b=MfKuTUquk6RS4J6W21ZXs+2W3DwXdbBK84vYQo9M38no/ReQq5PL90qZ0lkLPFh/gbeNWO
 +l8deJw0wRZEkqlnKAIDsrxDKPfABOkIkrpDuj62BPOobcImk1J9555N2RLnL5tayt9N1Z
 CJJIHfk9PgyOs7bItOrarln5wltYtGQ=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-JStVjW6RMLuOHPb2o_H43Q-1; Wed, 01 Nov 2023 13:23:38 -0400
X-MC-Unique: JStVjW6RMLuOHPb2o_H43Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-507d0e4eedaso7921252e87.0
 for <nouveau@lists.freedesktop.org>; Wed, 01 Nov 2023 10:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698859417; x=1699464217;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bXewshFpfkGDn8j5Fh6rL3ELP7XseQ2PaUs6p1ijoKo=;
 b=PX4v7mnvVO4HgSMsday6f34MZ0ZsJa4Yy45IC2LM0Dg1seCt9bMhoCId3+/q8/dnN1
 jolLvBsFYvpA1rUj+99SdJGMBv8zlyuS0k2nU5wxS+DlxZ64TDSsW2nwEuvJOoTpjbXG
 A8mx+/6/ld4xRXH0+U309eq8L/MrA6rI38DQBckpsPGQdsYo02a0/hGZUCRObmZRT25Z
 g5v58PpUOA4LMjBdmBOFi3QkxzKsTQqmW/F35WOo3Bc5m4uuYpsqhFBiPH3muZNxyHoH
 BHalA9LHTgBcisP93IuNCEfWtHv7pc8MfY3U1Wkvyp90lET1XfLBb2yUNCbiZ3lDDaGC
 jdBA==
X-Gm-Message-State: AOJu0Yx1t//xvcaz5iU02wKzgyscp9VqnJRWsfy8ss7g8D7qXrFthxQt
 OgsXAvDBPScZ3DKKaE70yWPWGHoHRhKEPVLo8LZeMUIBfDXX7kt0AjpZYcWbM0RffiUtl/N7pAQ
 pRPkEEgQxnsDA/VycQ9wIXDRkcg==
X-Received: by 2002:a19:f70c:0:b0:503:3278:3221 with SMTP id
 z12-20020a19f70c000000b0050332783221mr11374001lfe.69.1698859417372; 
 Wed, 01 Nov 2023 10:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6HHz3oW4ipafXuoWciK1QIqlCji+n9zHO/WdZA5/mihhlvFcyYrzNsJ02zM3nEz/DRpJg6Q==
X-Received: by 2002:a19:f70c:0:b0:503:3278:3221 with SMTP id
 z12-20020a19f70c000000b0050332783221mr11373983lfe.69.1698859416958; 
 Wed, 01 Nov 2023 10:23:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a1709063a0b00b0099bd7b26639sm170572eje.6.2023.11.01.10.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 10:23:36 -0700 (PDT)
Message-ID: <b0eab26f-23e8-49cb-b831-1188d5abda86@redhat.com>
Date: Wed, 1 Nov 2023 18:23:35 +0100
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
 <b09e37f3-33f6-4ea8-876b-f0bee9627ced@redhat.com>
 <1043bb3c1156d08015db5478183888892dfeda88.camel@linux.intel.com>
 <bfcaf8f777c2c6f018423bb1840a58ab7c80d97f.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <bfcaf8f777c2c6f018423bb1840a58ab7c80d97f.camel@linux.intel.com>
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

On 11/1/23 10:56, Thomas Hellström wrote:
> On Wed, 2023-11-01 at 10:41 +0100, Thomas Hellström wrote:
>> Hi, Danilo,
>>
>> On Tue, 2023-10-31 at 18:52 +0100, Danilo Krummrich wrote:
>>> On 10/31/23 17:45, Thomas Hellström wrote:
>>>> On Tue, 2023-10-31 at 17:39 +0100, Danilo Krummrich wrote:
>>>>> On 10/31/23 12:25, Thomas Hellström wrote:
>>>>>> On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
>>>>>>> Add an abstraction layer between the drm_gpuva mappings of
>>>>>>> a
>>>>>>> particular
>>>>>>> drm_gem_object and this GEM object itself. The abstraction
>>>>>>> represents
>>>>>>> a
>>>>>>> combination of a drm_gem_object and drm_gpuvm. The
>>>>>>> drm_gem_object
>>>>>>> holds
>>>>>>> a list of drm_gpuvm_bo structures (the structure
>>>>>>> representing
>>>>>>> this
>>>>>>> abstraction), while each drm_gpuvm_bo contains list of
>>>>>>> mappings
>>>>>>> of
>>>>>>> this
>>>>>>> GEM object.
>>>>>>>
>>>>>>> This has multiple advantages:
>>>>>>>
>>>>>>> 1) We can use the drm_gpuvm_bo structure to attach it to
>>>>>>> various
>>>>>>> lists
>>>>>>>       of the drm_gpuvm. This is useful for tracking external
>>>>>>> and
>>>>>>> evicted
>>>>>>>       objects per VM, which is introduced in subsequent
>>>>>>> patches.
>>>>>>>
>>>>>>> 2) Finding mappings of a certain drm_gem_object mapped in a
>>>>>>> certain
>>>>>>>       drm_gpuvm becomes much cheaper.
>>>>>>>
>>>>>>> 3) Drivers can derive and extend the structure to easily
>>>>>>> represent
>>>>>>>       driver specific states of a BO for a certain GPUVM.
>>>>>>>
>>>>>>> The idea of this abstraction was taken from amdgpu, hence
>>>>>>> the
>>>>>>> credit
>>>>>>> for
>>>>>>> this idea goes to the developers of amdgpu.
>>>>>>>
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/drm_gpuvm.c            | 335
>>>>>>> +++++++++++++++++++++--
>>>>>>> --
>>>>>>>     drivers/gpu/drm/nouveau/nouveau_uvmm.c |  64 +++--
>>>>>>>     include/drm/drm_gem.h                  |  32 +--
>>>>>>>     include/drm/drm_gpuvm.h                | 188
>>>>>>> +++++++++++++-
>>>>>>>     4 files changed, 533 insertions(+), 86 deletions(-)
>>>>>>
>>>>>> That checkpatch.pl error still remains as well.
>>>>>
>>>>> I guess you refer to:
>>>>>
>>>>> ERROR: do not use assignment in if condition
>>>>> #633: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
>>>>> +                       if (!(op->gem.obj = obj))
>>>>>
>>>>> This was an intentional decision, since in this specific case
>>>>> it
>>>>> seems to
>>>>> be more readable than the alternatives.
>>>>>
>>>>> However, if we consider this to be a hard rule, which we never
>>>>> ever
>>>>> break,
>>>>> I'm fine changing it too.
>>>>
>>>> With the errors, sooner or later they are going to start generate
>>>> patches to "fix" them. In this particular case also Xe CI is
>>>> complaining and abort building when I submit the Xe adaptation,
>>>> so
>>>> it'd
>>>> be good to be checkpatch.pl conformant IMHO.
>>>
>>> Ok, I will change this one.
>>>
>>> However, in general my opinion on coding style is that we should
>>> preserve us
>>> the privilege to deviate from it when we agree it makes sense and
>>> improves
>>> the code quality.
>>>
>>> Having a CI forcing people to *blindly* follow certain rules and
>>> even
>>> abort
>>> building isn't very beneficial in that respect.
>>>
>>> Also, consider patches which partially change a line of code that
>>> already
>>> contains a coding style "issue" - the CI would also block you on
>>> that
>>> one I
>>> guess. Besides that it seems to block you on unrelated code, note
>>> that the
>>> assignment in question is from Nouveau and not from GPUVM.
>>
>> Yes, I completely agree that having CI enforce error free coding
>> style
>> checks is bad, and I'll see if I can get that changed on Xe CI. To my
>> Knowledge It hasn't always been like that.
>>
>> But OTOH my take on this is that if there are coding style rules and
>> recommendations we should try to follow them unless there are
>> *strong*
>> reasons not to. Sometimes that may result in code that may be a
>> little
>> harder to read, but OTOH a reviewer won't have to read up on the
>> component's style flavor before reviewing and it will avoid future
>> style fix patches.
> 
> Basically meaning I'll continue to point those out when reviewing in
> case the author made an oversight, but won't require fixing for an R-B
> if the component owner thinks otherwise.

Yeah, I fully agree on that. That's why I changed it. I still think it was
better as it was, but clearly way too minor to break the rules.

- Danilo

> 
> Thanks,
> Thomas
> 
>>
>> Thanks,
>> Thomas
>>
>>
>>>
>>> - Danilo
>>>
>>>>
>>>> Thanks,
>>>> Thomas
>>>>
>>>>
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Thomas
>>>>>>
>>>>>
>>>>
>>>
>>
> 

