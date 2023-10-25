Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329F57D66D2
	for <lists+nouveau@lfdr.de>; Wed, 25 Oct 2023 11:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF09410E595;
	Wed, 25 Oct 2023 09:31:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C5810E595
 for <nouveau@lists.freedesktop.org>; Wed, 25 Oct 2023 09:31:06 +0000 (UTC)
Received: from [192.168.0.33] (unknown [91.156.66.55])
 (Authenticated sender: martin.peres@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DE7C519F5AF;
 Wed, 25 Oct 2023 11:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1698226265;
 bh=2vRrbiOvTm5Cl/C1L4BUZpQTbPFcyIRkozr7IvidHvA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uAFYW1bNHjTftOkmfup6ewKdpkLQJgW/VsIlMP9Lu6nid5IGcO8wwGa1E909mhpm1
 GWzQ8rXoK/8haDhO+E9HKAUEVaKOUPZIYbAN6og+7nLnAVwo5VF+cVHjycEvGIrTPD
 BLVszLjs6MnqomFmXWWkWfbDLvxD+Xh7aGScWmFT8cW1vEV9KRcJPwqk9OmzozZn+c
 Hs8wWbSiGRTbpMxBL1XQUiLZPume8A4jBGNb/PAwH86hMpusdzg1m+UdDNeHEdDB6o
 xK7RoeCWcHd37HwZs+jaLzObaDKSQmFgZ8tM/rz5yn2S9y7HEz55DCNYJaYEb2ODos
 LSrW2ppOfY8lA==
Message-ID: <e99346c4-8190-4403-82b1-19ee637c56dd@free.fr>
Date: Wed, 25 Oct 2023 12:31:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Philipp Stanner <pstanner@redhat.com>, Ben Skeggs <skeggsb@gmail.com>,
 nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-18-skeggsb@gmail.com>
 <80febd889ec89a42796d1df39146e838cc06ac0e.camel@redhat.com>
From: Martin Roukala <martin.peres@free.fr>
In-Reply-To: <80febd889ec89a42796d1df39146e838cc06ac0e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 17/44] drm/nouveau/mmu/tu102-: prepare for
 GSP-RM
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 10/24/23 12:05, Philipp Stanner wrote:
> On Tue, 2023-09-19 at 06:21 +1000, Ben Skeggs wrote:
>> From: Ben Skeggs <bskeggs@redhat.com>
>>
>> - (temporarily) disable if GSP-RM detected, will be added later
> 
> disable _what_?
> The other commit messages at least briefly name the component. This one
> should as well.
> 
> Furthermore, I'd say that the wording should be something like "will be
> enabled again later, after XXX has been done".

True. However, I think the clue is in the commit title: mmu/tu102

So, here is how I would rewrite this commit message:

Disable kernel-side MMU management when using the GSP firmware. This 
will be re-introduced as a call to the GSP firmware in a future commit.

The latter is partial speculation, but I hope this helps!

Cheers,
Martin
> 
> P.
> 
>>
>> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
>> ---
>>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
>> b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
>> index 8d060ce47f86..87979952df4b 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
>> @@ -24,6 +24,7 @@
>>   #include "vmm.h"
>>   
>>   #include <core/option.h>
>> +#include <subdev/gsp.h>
>>   
>>   #include <nvif/class.h>
>>   
>> @@ -54,5 +55,8 @@ int
>>   tu102_mmu_new(struct nvkm_device *device, enum nvkm_subdev_type
>> type, int inst,
>>                struct nvkm_mmu **pmmu)
>>   {
>> +       if (nvkm_gsp_rm(device->gsp))
>> +               return -ENODEV;
>> +
>>          return nvkm_mmu_new_(&tu102_mmu, device, type, inst, pmmu);
>>   }
> 
