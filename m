Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F676717FC
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 10:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4818910E1E4;
	Wed, 18 Jan 2023 09:42:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483710E6F4
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 09:42:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v6so48753427edd.6
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s7eKcD51t5DyolcsGIUaHuFARlGJjQRVUqZfKDV3k2o=;
 b=MVeZUWtEbaXSNvI9EufFkD53lZFFbk+49pxZ0aJfw5OhNtV2bA4tWezzccvd/KNX7Z
 wMSgOhndDUXfda9tke8S6Ikycz1EEHuKdP41pQmHa0mTexMpSEDTKi/QM2HCEJcumHwG
 TxjfLg2ZZ/NgxSVtIvA6pPMQNXPcVP5CGOwOy0LWmoXS5VuwuhXvVjMEhUJBYuFaBlH8
 LmFqMJubR8MEjoXubWWnr+/Swczm+sCenwq2ckrZmsAQliil9vE/XxgiBB++WVDkeuG5
 uXLIwRNdWvU2VYcmBDImS4n7iMvBOdDQHfCDFDDxpOtDpjyn8cs9NkaStk7Cp/YTxmog
 N4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s7eKcD51t5DyolcsGIUaHuFARlGJjQRVUqZfKDV3k2o=;
 b=mfabyDVktAe1WXcTJP+j8X9nJzsrV6wjhO/3WtZz/dLdL6P1X61l+yMd4y8tpj94qk
 BQE2FzltT8G0jS2Yl7v0tZNqzdcIHgGZZnlhEMCYVREiIRjafIe148GH3+52qZsuuEp9
 l/cYvT8twpk/wx0paX8W61UsZjhp4dRkcttoAgCk7OWiqs+Yg7B0mKiY/szzlPmMC4rk
 iWVTzagIt+yhOf2Y5wLcdVlqnx/wgCgbc2CqH/qPz3OxSb8H+V6FP7eTaZ4WqFpx4t02
 ek204H9CDIYSbtL8wikt0M8ME1P0tJbudkbvBUL+aFT5ImvyBGcRWL0Y0VQrZPU6w5iK
 Vg1A==
X-Gm-Message-State: AFqh2koBomfZ/9EJveFvyoaDIY5IC2PBGJMcMqlvk/lbLp06YFfINa2Q
 cyVI+S90GRAMyuKPCA+IScIwkbwFAQo=
X-Google-Smtp-Source: AMrXdXtXp6gZG/5oU8JKqxIaXv12dXVBAWkgXZPnigifShxnGxN2LPM+RPD3n+dziY5SkVPKcQmisw==
X-Received: by 2002:aa7:c1d7:0:b0:479:971e:58f6 with SMTP id
 d23-20020aa7c1d7000000b00479971e58f6mr5803368edp.19.1674034937114; 
 Wed, 18 Jan 2023 01:42:17 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:d3a3:981b:3e23:8647?
 ([2a02:908:1256:79a0:d3a3:981b:3e23:8647])
 by smtp.gmail.com with ESMTPSA id
 eo9-20020a056402530900b00463bc1ddc76sm6104341edb.28.2023.01.18.01.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:42:16 -0800 (PST)
Message-ID: <c440171d-0257-f568-1571-0aca59b389c4@gmail.com>
Date: Wed, 18 Jan 2023 10:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-5-christian.koenig@amd.com>
 <1b69d455-ce93-4a9d-0bb3-f145c03837c7@gmail.com>
 <ca4ae666-b971-5edb-733c-dbed7826b40c@gmail.com>
In-Reply-To: <ca4ae666-b971-5edb-733c-dbed7826b40c@gmail.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Danilo,

maybe you can give me a quick acked-by for this patch here.

I promise I've going to finish my drm_exec patches so you can use them 
for Nouveau as well :)

Thanks,
Christian.

Am 18.01.23 um 10:04 schrieb Christian König:
> Hi guys,
>
> another ping for this. It's just a minor cleanup.
>
> Dave/Daniel can you help me out here?
>
> Thanks,
> Christian.
>
> Am 11.01.23 um 10:52 schrieb Christian König:
>> Hi guys,
>>
>> can I get a quick ack for this?
>>
>> The patch has no functional change and is just a cleanup.
>>
>> Thanks,
>> Christian.
>>
>> Am 25.11.22 um 11:21 schrieb Christian König:
>>> TTM is just wrapping core DMA functionality here, remove the mid-layer.
>>> No functional change.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++++-
>>>   drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++---
>>>   2 files changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> index 335fa91ca4ad..288eebc70a67 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>>> @@ -922,6 +922,7 @@ static void nouveau_bo_move_ntfy(struct 
>>> ttm_buffer_object *bo,
>>>       struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
>>>       struct nouveau_bo *nvbo = nouveau_bo(bo);
>>>       struct nouveau_vma *vma;
>>> +    long ret;
>>>         /* ttm can now (stupidly) pass the driver bos it didn't 
>>> create... */
>>>       if (bo->destroy != nouveau_bo_del_ttm)
>>> @@ -936,7 +937,10 @@ static void nouveau_bo_move_ntfy(struct 
>>> ttm_buffer_object *bo,
>>>           }
>>>       } else {
>>>           list_for_each_entry(vma, &nvbo->vma_list, head) {
>>> -            WARN_ON(ttm_bo_wait(bo, false, false));
>>> +            ret = dma_resv_wait_timeout(bo->base.resv,
>>> +                            DMA_RESV_USAGE_BOOKKEEP,
>>> +                            false, 15 * HZ);
>>> +            WARN_ON(ret <= 0);
>>>               nouveau_vma_unmap(vma);
>>>           }
>>>       }
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> index ac5793c96957..f77e44958037 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct 
>>> nouveau_cli *cli,
>>>                   struct drm_nouveau_gem_pushbuf_reloc *reloc,
>>>                   struct drm_nouveau_gem_pushbuf_bo *bo)
>>>   {
>>> -    int ret = 0;
>>> +    long ret = 0;
>>>       unsigned i;
>>>         for (i = 0; i < req->nr_relocs; i++) {
>>> @@ -703,9 +703,14 @@ nouveau_gem_pushbuf_reloc_apply(struct 
>>> nouveau_cli *cli,
>>>                   data |= r->vor;
>>>           }
>>>   -        ret = ttm_bo_wait(&nvbo->bo, false, false);
>>> +        ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
>>> +                        DMA_RESV_USAGE_BOOKKEEP,
>>> +                        false, 15 * HZ);
>>> +        if (ret == 0)
>>> +            ret = -EBUSY;
>>>           if (ret) {
>>> -            NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n", ret);
>>> +            NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
>>> +                  ret);
>>>               break;
>>>           }
>>
>

