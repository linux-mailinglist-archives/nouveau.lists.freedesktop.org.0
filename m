Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF96716FD
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 10:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5D410E6AF;
	Wed, 18 Jan 2023 09:04:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B8110E6AF
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 09:04:27 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v10so47472495edi.8
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 01:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/kRYhGD96LesyGJ/1jFYNyAI+ADiaF/4BZ4JDDmK2Y=;
 b=mjb6XZ0lcmofyLHF82C7gKIreKiz4U8MjHWq9WGEiCfAjtMuktHUImgLOObYI0dSpL
 2/VpyaYtfO8YPQtlAcm9Kg5xtI+xCQ7H57GNWS3GcqfophuqEyUbqA26RrQcqmamZirX
 W2+wfTJaLPgBmwRnATUwJGyXzqs9nBoaW+GT9DWBON68B7w1sOMVQ8ZsDe/PmEI5itBr
 nHFxDxQHB8+2brj5ZRW8h41/ofp47fw/KT1NxdgeA6pTmDqglzFITTkuYOsXwXyOED4p
 XBeqTaymra5xbrcPR3t9bRl3mX2yuAKLrVHDzfGqdjN5wFubYd9cbqQ9pDRdXdrdnOK3
 Rs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/kRYhGD96LesyGJ/1jFYNyAI+ADiaF/4BZ4JDDmK2Y=;
 b=WCfxEtZZtJ8MSbi8lN+bXmZ1LNVrwQ9mVFdIIfadLXFvq9l24DvW+fagSl5DFe+zc3
 CN9v1Rxqim/xYHXIAcjhyHvD7qeDBSU0mNSIQqbzhtY8GSkf9B2jRXq7MAa22W9K7FxL
 vSWkP8zIUabLq6+Z6PvCyVQ+i1M9Lb5v3If9blayTUpbXpiVwgbCu9nFHoufs+YFs7/Z
 U/I/e2wWp/4QlPpvnl2oOkxQrB/hNkgnL9KX9fLTMoTNxZZZ6ArQ/uCkrU3ITI4hAr/1
 IcsR6nqI/Q/Jn00aM+3GT5FDsOUCdc24VWerL8/LBlUbrUdEJW5LN2XQLGD/DwqyPPPK
 GJmw==
X-Gm-Message-State: AFqh2kpxolq8r9QuxY+fp1Xagh43udP+iFmjPgp6CiL26HHnxYDB4QTg
 DNbJN9N1JGbv5Hfcxw96CjY=
X-Google-Smtp-Source: AMrXdXujiAuWxls2q6mDBR8q2X4qcyRS/xSAT3VvIxwuAim9Cd1qEHAtf5UHeOWLqivg+stIX/+ptA==
X-Received: by 2002:a05:6402:3883:b0:499:b672:ee39 with SMTP id
 fd3-20020a056402388300b00499b672ee39mr6828292edb.11.1674032665546; 
 Wed, 18 Jan 2023 01:04:25 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d3a3:981b:3e23:8647?
 ([2a02:908:1256:79a0:d3a3:981b:3e23:8647])
 by smtp.gmail.com with ESMTPSA id
 b15-20020aa7c90f000000b004615f7495e0sm13898370edt.8.2023.01.18.01.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:04:24 -0800 (PST)
Message-ID: <ca4ae666-b971-5edb-733c-dbed7826b40c@gmail.com>
Date: Wed, 18 Jan 2023 10:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-5-christian.koenig@amd.com>
 <1b69d455-ce93-4a9d-0bb3-f145c03837c7@gmail.com>
In-Reply-To: <1b69d455-ce93-4a9d-0bb3-f145c03837c7@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi guys,

another ping for this. It's just a minor cleanup.

Dave/Daniel can you help me out here?

Thanks,
Christian.

Am 11.01.23 um 10:52 schrieb Christian König:
> Hi guys,
>
> can I get a quick ack for this?
>
> The patch has no functional change and is just a cleanup.
>
> Thanks,
> Christian.
>
> Am 25.11.22 um 11:21 schrieb Christian König:
>> TTM is just wrapping core DMA functionality here, remove the mid-layer.
>> No functional change.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++++-
>>   drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++---
>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c 
>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index 335fa91ca4ad..288eebc70a67 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -922,6 +922,7 @@ static void nouveau_bo_move_ntfy(struct 
>> ttm_buffer_object *bo,
>>       struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
>>       struct nouveau_bo *nvbo = nouveau_bo(bo);
>>       struct nouveau_vma *vma;
>> +    long ret;
>>         /* ttm can now (stupidly) pass the driver bos it didn't 
>> create... */
>>       if (bo->destroy != nouveau_bo_del_ttm)
>> @@ -936,7 +937,10 @@ static void nouveau_bo_move_ntfy(struct 
>> ttm_buffer_object *bo,
>>           }
>>       } else {
>>           list_for_each_entry(vma, &nvbo->vma_list, head) {
>> -            WARN_ON(ttm_bo_wait(bo, false, false));
>> +            ret = dma_resv_wait_timeout(bo->base.resv,
>> +                            DMA_RESV_USAGE_BOOKKEEP,
>> +                            false, 15 * HZ);
>> +            WARN_ON(ret <= 0);
>>               nouveau_vma_unmap(vma);
>>           }
>>       }
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c 
>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index ac5793c96957..f77e44958037 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct 
>> nouveau_cli *cli,
>>                   struct drm_nouveau_gem_pushbuf_reloc *reloc,
>>                   struct drm_nouveau_gem_pushbuf_bo *bo)
>>   {
>> -    int ret = 0;
>> +    long ret = 0;
>>       unsigned i;
>>         for (i = 0; i < req->nr_relocs; i++) {
>> @@ -703,9 +703,14 @@ nouveau_gem_pushbuf_reloc_apply(struct 
>> nouveau_cli *cli,
>>                   data |= r->vor;
>>           }
>>   -        ret = ttm_bo_wait(&nvbo->bo, false, false);
>> +        ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
>> +                        DMA_RESV_USAGE_BOOKKEEP,
>> +                        false, 15 * HZ);
>> +        if (ret == 0)
>> +            ret = -EBUSY;
>>           if (ret) {
>> -            NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n", ret);
>> +            NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
>> +                  ret);
>>               break;
>>           }
>

