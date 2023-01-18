Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072436721A3
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 16:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897D210E776;
	Wed, 18 Jan 2023 15:44:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0DD10E776
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674056679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVV+wAk4mdr6o2UuVp7YCXC2heOPq/3TZ2azX0vdOh4=;
 b=O9g11QMHVOXgrVjZ/dLnRdwUWQK+BEpLapLFOgSk0az0biAnUeOK73YIrJfSgpkQWGbMwh
 XjdVPYuRVMU7pU2+kzfAuWonol6jrfPJxizx5i4OrPkCPvxBJMXjKVDKIoOt+xwD/xR/jp
 2gNCgMOrWJc+MSKuuAv0gibqEmLnoI0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-PaThnPQSOVeGL1Zsb9Dsjw-1; Wed, 18 Jan 2023 10:44:37 -0500
X-MC-Unique: PaThnPQSOVeGL1Zsb9Dsjw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y2-20020a056402440200b0049e4d71f5dcso1599115eda.5
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 07:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iVV+wAk4mdr6o2UuVp7YCXC2heOPq/3TZ2azX0vdOh4=;
 b=SKTaDiNfDxLvYq2NTUsUALyIo+Bk0tgNXAiO/I+e5WpSJ8W81Oq6eTp6kPhV4U5Z6Z
 +jbCw3Q6FxmdVjseGKrUE86nMdOQEcjEXbq37gBqxreHQAV4aqUXS5CNqgp3VCop+BIP
 sAYMkDR8QxmxZKV6TKY7MBhbeRX6R85oszQGth00VUIWRduFPKQh71RWGRx2FISzfC2a
 q77AT+tym681gYLv3NZEnKjwfVyig45AbL3qHcpmYrS/dOI/4RujfGaYJQruK2Na3Y8/
 x5G5uYod36n6Sh86PI7fLXK5ZrfH2vdaA0F+STW8FkeCSO77mU4cNVhysTjmN7Iyua6W
 cG8Q==
X-Gm-Message-State: AFqh2kqLjxyDbi2Q4TujYZvYAFn26wyfxyBcpYL0L4QnFS5UTZXy37Jv
 Pig3VIW9wHSN+6lGWscoTdBXiWAUT7b2COMxmA2au6dwsTeEDJNuzyix8YnHYxfxblSoc8c8Bs/
 ZJFBsRLm/H28eTOkckv/iZDfCPBzSeCrVly3YCSTfUdDtPTHG3ZAukDpjzk6a+gvc97OUe6WL
X-Received: by 2002:a05:6402:219:b0:499:70a8:f915 with SMTP id
 t25-20020a056402021900b0049970a8f915mr7196689edv.21.1674056676233; 
 Wed, 18 Jan 2023 07:44:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs/4KwzPk8geh28jlqDMXep9dvQyQTWU9Ep1lKI7VF/mLob0Hio3OgOnJbsswjZHZfZ657iMQ==
X-Received: by 2002:a05:6402:219:b0:499:70a8:f915 with SMTP id
 t25-20020a056402021900b0049970a8f915mr7196674edv.21.1674056675918; 
 Wed, 18 Jan 2023 07:44:35 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a056402100600b0046b471596e6sm14293393edu.57.2023.01.18.07.44.34
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 07:44:34 -0800 (PST)
Message-ID: <382c8a82-a68c-467d-4bc9-27bc354a7aad@redhat.com>
Date: Wed, 18 Jan 2023 16:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: nouveau@lists.freedesktop.org
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-5-christian.koenig@amd.com>
 <1b69d455-ce93-4a9d-0bb3-f145c03837c7@gmail.com>
 <ca4ae666-b971-5edb-733c-dbed7826b40c@gmail.com>
 <CACO55tsVW9EVdK9TWVMx-v=0YNyMmRAVdBLYGoBOmBKATPO4Gw@mail.gmail.com>
 <144efbc1-7604-c2ab-0612-dfcb223f7c00@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <144efbc1-7604-c2ab-0612-dfcb223f7c00@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 5/9] drm/nouveau: stop using ttm_bo_wait
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/18/23 15:15, Christian König wrote:
> Am 18.01.23 um 14:01 schrieb Karol Herbst:
>> On Wed, Jan 18, 2023 at 10:04 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Hi guys,
>>>
>>> another ping for this. It's just a minor cleanup.
>>>
>> Acked-by: Karol Herbst <kherbst@redhat.com>
> 
> Thanks!

Also Acked-by: Danilo Krummrich <dakr@redhat.com>
> 
>>
>> Though I'd say that having a wrapper function like that isn't
>> pointless on its own and I kind of fail to see the reason it gets
>> removed in the first place.
>>
>> Also.. I wouldn't call this a "cleanup" because it actually removes
>> something useful. Yes, it's only calling one function, but it's more
>> of a pain to use the wrapped one than the outer one.
> 
> The problem is that it's hiding the timeout.

Though I'd agree that having the wrapper, maybe also exposing the 
timeout, looks slighly cleaner.

>  > Just read up what discussion this triggered within the Intel driver.
> 
> Christian.
> 
>>
>>> Dave/Daniel can you help me out here?
>>>
>>> Thanks,
>>> Christian.
>>>
>>> Am 11.01.23 um 10:52 schrieb Christian König:
>>>> Hi guys,
>>>>
>>>> can I get a quick ack for this?
>>>>
>>>> The patch has no functional change and is just a cleanup.
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>> Am 25.11.22 um 11:21 schrieb Christian König:
>>>>> TTM is just wrapping core DMA functionality here, remove the 
>>>>> mid-layer.
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++++-
>>>>>    drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++---
>>>>>    2 files changed, 13 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>>> index 335fa91ca4ad..288eebc70a67 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>>> @@ -922,6 +922,7 @@ static void nouveau_bo_move_ntfy(struct
>>>>> ttm_buffer_object *bo,
>>>>>        struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : 
>>>>> NULL;
>>>>>        struct nouveau_bo *nvbo = nouveau_bo(bo);
>>>>>        struct nouveau_vma *vma;
>>>>> +    long ret;
>>>>>          /* ttm can now (stupidly) pass the driver bos it didn't
>>>>> create... */
>>>>>        if (bo->destroy != nouveau_bo_del_ttm)
>>>>> @@ -936,7 +937,10 @@ static void nouveau_bo_move_ntfy(struct
>>>>> ttm_buffer_object *bo,
>>>>>            }
>>>>>        } else {
>>>>>            list_for_each_entry(vma, &nvbo->vma_list, head) {
>>>>> -            WARN_ON(ttm_bo_wait(bo, false, false));
>>>>> +            ret = dma_resv_wait_timeout(bo->base.resv,
>>>>> +                            DMA_RESV_USAGE_BOOKKEEP,
>>>>> +                            false, 15 * HZ);
>>>>> +            WARN_ON(ret <= 0);
>>>>>                nouveau_vma_unmap(vma);
>>>>>            }
>>>>>        }
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> index ac5793c96957..f77e44958037 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>>> @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct
>>>>> nouveau_cli *cli,
>>>>>                    struct drm_nouveau_gem_pushbuf_reloc *reloc,
>>>>>                    struct drm_nouveau_gem_pushbuf_bo *bo)
>>>>>    {
>>>>> -    int ret = 0;
>>>>> +    long ret = 0;
>>>>>        unsigned i;
>>>>>          for (i = 0; i < req->nr_relocs; i++) {
>>>>> @@ -703,9 +703,14 @@ nouveau_gem_pushbuf_reloc_apply(struct
>>>>> nouveau_cli *cli,
>>>>>                    data |= r->vor;
>>>>>            }
>>>>>    -        ret = ttm_bo_wait(&nvbo->bo, false, false);
>>>>> +        ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
>>>>> +                        DMA_RESV_USAGE_BOOKKEEP,
>>>>> +                        false, 15 * HZ);
>>>>> +        if (ret == 0)
>>>>> +            ret = -EBUSY;
>>>>>            if (ret) {
>>>>> -            NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n", ret);
>>>>> +            NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
>>>>> +                  ret);
>>>>>                break;
>>>>>            }
> 

