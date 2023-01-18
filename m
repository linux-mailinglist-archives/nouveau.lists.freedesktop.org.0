Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688B671F2A
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 15:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AADC10E101;
	Wed, 18 Jan 2023 14:15:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B30B10E752
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 14:15:43 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ud5so83604723ejc.4
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oCGNHON3hfeheKriRMpVwiLlkDvk70CzUPGkb7lEcBQ=;
 b=an+IEE6nXLW/ytxal/GYkPXj+PIp3cplnTRrgMCmMI8AhvLroZiy+Q/11RwllAYXhP
 U1607KBFNyhfEV62fis1/AG7wanY8g65z8e0XRbaugyczWsWm0f3a+cQEYxwytWJ2JpS
 gP4yi9T8VqH5jbXRtisWuXvE86+pDTZaPiC77HsAE+1fwCGEvUh2LDeHjzsm75IMS+qj
 DrC2nytzCS8cZZdK5/D7Ila4wsxEzFOk/Kh7lAc2b7B25L36z+fUDU9SZy20abaxMgJz
 UYOzjhhzZo9iGqVYPa3YeDtjje2vKlSXJJeDlHQ475Ox+g3i/7roXd+/mieGtBWLL8qn
 xe9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCGNHON3hfeheKriRMpVwiLlkDvk70CzUPGkb7lEcBQ=;
 b=GkGO6PiUL6H77lbFq6hmmBMy/ihg5XQz+QbWJ31KZCjhfEyxfNTsdFhylKiy+eAJND
 FpbgLBGv+7JTjxk88VlQKp+jCnhcLxkIXlGMJ9QKTvOmyy3ytLjkn8xf5ub/3QfsugIz
 9c8HzfIkvXeuf8vikXwDfay3BHzraFcADpuhdbxvls9ug+/Vf6Ps1z8aY9mOGU2U5RFz
 rSuTi+JApVb6fZMyEhtNn31NqPPPFQVq9Nbi3NKDMbH6SBTnUHCyeHSpuGVgRa6Jl4Zo
 hRuN7AyMH6xa9gigPmOAESdoFoHslBBvZYFHACLcnr/72DjCNCbh36x+OmU9rGdrofeo
 VFEg==
X-Gm-Message-State: AFqh2kr0tRlgenYZS7Hawrinj23KM5Nn12i9cHwZhLFT3+VY/GjrgKLy
 fodhCs/AMcNN2l/vlT9maxQ=
X-Google-Smtp-Source: AMrXdXsK1iSSizm9GlzoiftUlUNP6W0jN+znALegHiO3JgJNTBQ1vcNIoszA7dZ1BkxEXkIIfm/tOg==
X-Received: by 2002:a17:906:f299:b0:7c0:fd1a:79ee with SMTP id
 gu25-20020a170906f29900b007c0fd1a79eemr6979800ejb.63.1674051341500; 
 Wed, 18 Jan 2023 06:15:41 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:11b:aaf8:6e8b:724f?
 ([2a02:908:1256:79a0:11b:aaf8:6e8b:724f])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a170906315600b007ae10525550sm14627246eje.47.2023.01.18.06.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 06:15:40 -0800 (PST)
Message-ID: <144efbc1-7604-c2ab-0612-dfcb223f7c00@gmail.com>
Date: Wed, 18 Jan 2023 15:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Karol Herbst <kherbst@redhat.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-5-christian.koenig@amd.com>
 <1b69d455-ce93-4a9d-0bb3-f145c03837c7@gmail.com>
 <ca4ae666-b971-5edb-733c-dbed7826b40c@gmail.com>
 <CACO55tsVW9EVdK9TWVMx-v=0YNyMmRAVdBLYGoBOmBKATPO4Gw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CACO55tsVW9EVdK9TWVMx-v=0YNyMmRAVdBLYGoBOmBKATPO4Gw@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Am 18.01.23 um 14:01 schrieb Karol Herbst:
> On Wed, Jan 18, 2023 at 10:04 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi guys,
>>
>> another ping for this. It's just a minor cleanup.
>>
> Acked-by: Karol Herbst <kherbst@redhat.com>

Thanks!

>
> Though I'd say that having a wrapper function like that isn't
> pointless on its own and I kind of fail to see the reason it gets
> removed in the first place.
>
> Also.. I wouldn't call this a "cleanup" because it actually removes
> something useful. Yes, it's only calling one function, but it's more
> of a pain to use the wrapped one than the outer one.

The problem is that it's hiding the timeout.

Just read up what discussion this triggered within the Intel driver.

Christian.

>
>> Dave/Daniel can you help me out here?
>>
>> Thanks,
>> Christian.
>>
>> Am 11.01.23 um 10:52 schrieb Christian König:
>>> Hi guys,
>>>
>>> can I get a quick ack for this?
>>>
>>> The patch has no functional change and is just a cleanup.
>>>
>>> Thanks,
>>> Christian.
>>>
>>> Am 25.11.22 um 11:21 schrieb Christian König:
>>>> TTM is just wrapping core DMA functionality here, remove the mid-layer.
>>>> No functional change.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++++-
>>>>    drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++---
>>>>    2 files changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> index 335fa91ca4ad..288eebc70a67 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>>> @@ -922,6 +922,7 @@ static void nouveau_bo_move_ntfy(struct
>>>> ttm_buffer_object *bo,
>>>>        struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
>>>>        struct nouveau_bo *nvbo = nouveau_bo(bo);
>>>>        struct nouveau_vma *vma;
>>>> +    long ret;
>>>>          /* ttm can now (stupidly) pass the driver bos it didn't
>>>> create... */
>>>>        if (bo->destroy != nouveau_bo_del_ttm)
>>>> @@ -936,7 +937,10 @@ static void nouveau_bo_move_ntfy(struct
>>>> ttm_buffer_object *bo,
>>>>            }
>>>>        } else {
>>>>            list_for_each_entry(vma, &nvbo->vma_list, head) {
>>>> -            WARN_ON(ttm_bo_wait(bo, false, false));
>>>> +            ret = dma_resv_wait_timeout(bo->base.resv,
>>>> +                            DMA_RESV_USAGE_BOOKKEEP,
>>>> +                            false, 15 * HZ);
>>>> +            WARN_ON(ret <= 0);
>>>>                nouveau_vma_unmap(vma);
>>>>            }
>>>>        }
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>> index ac5793c96957..f77e44958037 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>>> @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct
>>>> nouveau_cli *cli,
>>>>                    struct drm_nouveau_gem_pushbuf_reloc *reloc,
>>>>                    struct drm_nouveau_gem_pushbuf_bo *bo)
>>>>    {
>>>> -    int ret = 0;
>>>> +    long ret = 0;
>>>>        unsigned i;
>>>>          for (i = 0; i < req->nr_relocs; i++) {
>>>> @@ -703,9 +703,14 @@ nouveau_gem_pushbuf_reloc_apply(struct
>>>> nouveau_cli *cli,
>>>>                    data |= r->vor;
>>>>            }
>>>>    -        ret = ttm_bo_wait(&nvbo->bo, false, false);
>>>> +        ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
>>>> +                        DMA_RESV_USAGE_BOOKKEEP,
>>>> +                        false, 15 * HZ);
>>>> +        if (ret == 0)
>>>> +            ret = -EBUSY;
>>>>            if (ret) {
>>>> -            NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n", ret);
>>>> +            NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
>>>> +                  ret);
>>>>                break;
>>>>            }

