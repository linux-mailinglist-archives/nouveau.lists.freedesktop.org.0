Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0380289FCC5
	for <lists+nouveau@lfdr.de>; Wed, 10 Apr 2024 18:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE64010EBA9;
	Wed, 10 Apr 2024 16:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DL3xyCSU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764A411231F
 for <nouveau@lists.freedesktop.org>; Wed, 10 Apr 2024 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712766267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SR+1AW9M2A3GnVPo72SCiXJczoeqweAOw7eIFhYpkyg=;
 b=DL3xyCSUeq/0RsGKC7Dhuk5OviNzFURd7mCt3fvBnA3oRCP93mDSauQKA6OQBVsY0ssNZF
 gh4dN9iVwexUTASgRPwapyujwjHr1xlm1Zc7puJlxOYOmy0aRAxtjN8OEolZfpjRY4xNkK
 F5kr7wSYtEDmvivPpqrxmUt0G7yNkAU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-PCi84w9INvatbjT2dtVipw-1; Wed, 10 Apr 2024 12:24:24 -0400
X-MC-Unique: PCi84w9INvatbjT2dtVipw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41663448bcbso17709865e9.1
 for <nouveau@lists.freedesktop.org>; Wed, 10 Apr 2024 09:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712766263; x=1713371063;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SR+1AW9M2A3GnVPo72SCiXJczoeqweAOw7eIFhYpkyg=;
 b=bnzcxnrNbOmJIsEiBc3cYeftKfmnaf/LZRItVF4+ld9pb4HqcQ6kjzyoDfE4nGnUMK
 Rk0RmSBbD0STUwYt2WJWgAFPKZc0nKC91qoBrYQiuCUXo1XZSC1uv9snaueD+ai4XPK2
 e9Hn5a3N11U14jLryVJKHnSx47qtT9zGweu/fj6oWtpOItgXJYEHsZiTeRxSI/doQmx6
 pronpTJEATp5dV6XguDZrv8J0MxLsNd0v2WexrW/Pj56/P/vZvQq9mglJ7MBzo3/SBiN
 vHED9ZIz/BturKv5PjhkPsnjQCr2Cuss+gczEqdGijytk8pkaG0AN1CmI3tRRXgNfzoT
 k3eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi1fZJBVj40mpHnYcig5qLxqtBydF27PYNm553r+Dt3be7kJZ/f2nmfo/1O6j2n6kIcVRxE6qyj6KJyxLLE5T/z/vLncJSFLj7CnMRSQ==
X-Gm-Message-State: AOJu0YwwJ86qmu6TkEnO68rGfYK5Xte1w1/WA3XikL2iwXthQHqNddO2
 2gtw+L/rox0yB5Bk25MnLUceSDpIsBjivfOn8zvX0KPktWd4ebBRvSUV6DgpuekwngFIqSMw11q
 73DOJYpGxnYlleTiPY6zCCfiNXwCEqnPkeHbrk/V/gw2oztw4ial5nLkdaIxc1XI=
X-Received: by 2002:a5d:46c4:0:b0:343:44cd:7d1e with SMTP id
 g4-20020a5d46c4000000b0034344cd7d1emr118402wrs.17.1712766262914; 
 Wed, 10 Apr 2024 09:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMW1X5i7lkXvrY5pH8/hRbgfI9LM1AIWY8oZ53l2ukbPKVk1TIMAo3XiLMuX7AI0rT7T6YFg==
X-Received: by 2002:a5d:46c4:0:b0:343:44cd:7d1e with SMTP id
 g4-20020a5d46c4000000b0034344cd7d1emr118363wrs.17.1712766262429; 
 Wed, 10 Apr 2024 09:24:22 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a5d4acd000000b00343eac2acc4sm13444649wrs.111.2024.04.10.09.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 09:24:22 -0700 (PDT)
Message-ID: <cd044176-ebd3-4fd8-94ca-6630cd3211a8@redhat.com>
Date: Wed, 10 Apr 2024 18:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: nv04: Add check to avoid out of bounds access
To: Mikhail Kobuk <m.kobuk@ispras.ru>, Danilo Krummrich <me@dakr.org>,
 Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francisco Jerez <currojerez@riseup.net>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
References: <20240331064552.6112-1-m.kobuk@ispras.ru>
 <c3253f8a-e654-4016-b0c6-d92703107c48@redhat.com>
 <11096e558e67f2fea2aee976c70a19af1b7c212b.camel@redhat.com>
 <03263130-0627-45c4-ab14-aa0e3b597442@dakr.org>
 <624ee851-162b-4490-8444-0d9e06b5863b@ispras.ru>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <624ee851-162b-4490-8444-0d9e06b5863b@ispras.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 4/10/24 17:39, Mikhail Kobuk wrote:
> On 08/04/2024 16:23, Danilo Krummrich wrote:
>> On 4/5/24 22:05, Lyude Paul wrote:
>>> On Fri, 2024-04-05 at 17:53 +0200, Danilo Krummrich wrote:
>>>> On 3/31/24 08:45, Mikhail Kobuk wrote:
>>>>> Output Resource (dcb->or) value is not guaranteed to be non-zero
>>>>> (i.e.
>>>>> in drivers/gpu/drm/nouveau/nouveau_bios.c, in
>>>>> 'fabricate_dcb_encoder_table()'
>>>>> 'dcb->or' is assigned value '0' in call to
>>>>> 'fabricate_dcb_output()').
>>>>
>>>> I don't really know much about the semantics of this code.
>>>>
>>>> Looking at fabricate_dcb_output() though I wonder if the intention
>>>> was to assign
>>>> BIT(or) to entry->or.
>>>>
>>>> @Lyude, can you help here?
>>>
>>> This code is definitely a bit before my time as well - but I think
>>> you're completely correct. Especially considering this bit I found in
>>> nouveau_bios.h:
>>
>> Thanks for confirming.
>>
>> @Mikhail, I think we should rather fix this assignment then.
> 
> Thank you all for a thorough look!
> 
>>
>> - Danilo
>>
>>>
>>> enum nouveau_or {
>>>     DCB_OUTPUT_A = (1 << 0),
>>>     DCB_OUTPUT_B = (1 << 1),
>>>     DCB_OUTPUT_C = (1 << 2)
>>> };
>>>
>>>
> 
> Considering this code bit, and the fact that fabricate_dcb_output() is called in drivers/gpu/drm/nouveau/nouveau_bios.c only, there's option to adjust function calls instead of adding BIT(or), i.e.:
> 
> fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, DCB_OUTPUT_B);
> 
> instead of current:
> 
> fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, 1);
> 
> and etc.
> 
> Should I make a new patch with adjusted calls or stick with BIT(or)?

Please send a new patch adjusting the calls using enum nouveau_or, that
seems to be cleaner.

- Danilo

> 
>>>>
>>>> Otherwise, for parsing the DCB entries, it seems that the bound
>>>> checks are
>>>> happening in olddcb_outp_foreach() [1].
>>>>
>>>> [1]
>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nouveau_bios.c#L1331
>>>>
>>>>>
>>>>> Add check to validate 'dcb->or' before it's used.
>>>>>
>>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>>
>>>>> Fixes: 2e5702aff395 ("drm/nouveau: fabricate DCB encoder table for
>>>>> iMac G4")
>>>>> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
>>>>> ---
>>>>>    drivers/gpu/drm/nouveau/dispnv04/dac.c | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>>> b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>>> index d6b8e0cce2ac..0c8d4fc95ff3 100644
>>>>> --- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>>> +++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
>>>>> @@ -428,7 +428,7 @@ void nv04_dac_update_dacclk(struct drm_encoder
>>>>> *encoder, bool enable)
>>>>>        struct drm_device *dev = encoder->dev;
>>>>>        struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>>>> -    if (nv_gf4_disp_arch(dev)) {
>>>>> +    if (nv_gf4_disp_arch(dev) && ffs(dcb->or)) {
>>>>>            uint32_t *dac_users = &nv04_display(dev)-
>>>>>> dac_users[ffs(dcb->or) - 1];
>>>>>            int dacclk_off = NV_PRAMDAC_DACCLK +
>>>>> nv04_dac_output_offset(encoder);
>>>>>            uint32_t dacclk = NVReadRAMDAC(dev, 0,
>>>>> dacclk_off);
>>>>> @@ -453,7 +453,7 @@ bool nv04_dac_in_use(struct drm_encoder
>>>>> *encoder)
>>>>>        struct drm_device *dev = encoder->dev;
>>>>>        struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
>>>>> -    return nv_gf4_disp_arch(encoder->dev) &&
>>>>> +    return nv_gf4_disp_arch(encoder->dev) && ffs(dcb->or) &&
>>>>>            (nv04_display(dev)->dac_users[ffs(dcb->or) - 1] &
>>>>> ~(1 << dcb->index));
>>>>>    }
>>>>
>>>
> 

