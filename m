Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50A7D66B6
	for <lists+nouveau@lfdr.de>; Wed, 25 Oct 2023 11:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D28CD10E616;
	Wed, 25 Oct 2023 09:26:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AD810E616
 for <nouveau@lists.freedesktop.org>; Wed, 25 Oct 2023 09:26:15 +0000 (UTC)
Received: from [192.168.0.33] (unknown [91.156.66.55])
 (Authenticated sender: martin.peres@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id CE28E19F57E;
 Wed, 25 Oct 2023 11:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1698225973;
 bh=axRGblze/FEmOK2YhWMZUmt3/yNSuPCdD8/EF59EK7o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YrX+oNJSpsLgRMipIcNZwkeazetPS+2izETkbu0hO6GefZ6zalHQbhdr5W+vcktcI
 9UmEKkSWElsKnajl6vDT8dydCUK7aN4A64XW/9mqmedSSLB5H216iJZyy88zF450G4
 x/Oq17SWiMIkHutklJnX3j8zoURjnCoxxiFojB99vW1u93gtNWEq/7h8N6irQF+gPs
 XURPenLzOWoWLsufBSirNe54y1tc3i6P6DQkTnBiQwShJrYZ8iaGjUcdkyfOFYGsMY
 9gM28mG+7UK2Fp5jE9IzBUTfZ8t9lcszj9BS5Lm4eQo0L7lJbfJfypVNbYJd57SosZ
 WmYpDttOrWC0A==
Message-ID: <29b4d0fc-a05d-470e-940e-c733d88b84e0@free.fr>
Date: Wed, 25 Oct 2023 12:26:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Philipp Stanner <pstanner@redhat.com>, Ben Skeggs <skeggsb@gmail.com>,
 nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-4-skeggsb@gmail.com>
 <94809d4ad95df753e88230a9a8a36621b481d8c3.camel@redhat.com>
From: Martin Roukala <martin.peres@free.fr>
In-Reply-To: <94809d4ad95df753e88230a9a8a36621b481d8c3.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 03/44] drm/nouveau/nvkm: bump maximum number
 of NVJPG
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

On 10/24/23 11:37, Philipp Stanner wrote:
> On Tue, 2023-09-19 at 06:21 +1000, Ben Skeggs wrote:
>> From: Ben Skeggs <bskeggs@redhat.com>
>>
>> RM (and GH100) support 8 NVJPG instances.
> 
> I don't think the commit message provides enough information.
> Instinctively I would read the RM as "remove", thus "remove support
> [for] 8 NVJPG instances" ???
> 
> Two sentences (with verb and object) would be helpful here, one
> describing the problem being addressed, the other what the commit does.

Agreed. Here is my understanding of what Ben meant to say:

Bump the maximum amount of NVJPG blocks to 8 to matching both what 
nvidia's kernel driver (resource manager) and GH100 support.

I hope this helps!

Martin
> 
> P.
> 
> 
>>
>> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
>> ---
>>   drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
>>   drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    | 2 +-
>>   drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c    | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
>> b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
>> index f326b09680be..6af0352a4873 100644
>> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
>> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
>> @@ -44,7 +44,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPPP   , struct
>> nvkm_engine  ,    msppp)
>>   NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,
>> msvld)
>>   NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,
>> nvdec, 8)
>>   NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,
>> nvenc, 3)
>> -NVKM_LAYOUT_ONCE(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,
>> nvjpg)
>> +NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,
>> nvjpg, 8)
>>   NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,
>> ofa)
>>   NVKM_LAYOUT_ONCE(NVKM_ENGINE_PM      , struct nvkm_pm      ,
>> pm)
>>   NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,
>> sec)
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
>> b/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
>> index 84790cf52b90..4fa6e2f19bfe 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
>> @@ -76,7 +76,7 @@ ga100_top_parse(struct nvkm_top *top)
>>                  case 0x00000012: I_(NVKM_SUBDEV_IOCTRL, inst); break;
>>                  case 0x00000013: I_(NVKM_ENGINE_CE    , inst); break;
>>                  case 0x00000014: O_(NVKM_SUBDEV_GSP   ,    0); break;
>> -               case 0x00000015: O_(NVKM_ENGINE_NVJPG ,    0); break;
>> +               case 0x00000015: I_(NVKM_ENGINE_NVJPG , inst); break;
>>                  case 0x00000016: O_(NVKM_ENGINE_OFA   ,    0); break;
>>                  case 0x00000017: O_(NVKM_SUBDEV_FLA   ,    0); break;
>>                          break;
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
>> b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
>> index 2bbba8244cbf..0f1675e57256 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
>> @@ -89,7 +89,7 @@ gk104_top_parse(struct nvkm_top *top)
>>                  case 0x00000012: I_(NVKM_SUBDEV_IOCTRL, inst); break;
>>                  case 0x00000013: I_(NVKM_ENGINE_CE    , inst); break;
>>                  case 0x00000014: O_(NVKM_SUBDEV_GSP   ,    0); break;
>> -               case 0x00000015: O_(NVKM_ENGINE_NVJPG ,    0); break;
>> +               case 0x00000015: I_(NVKM_ENGINE_NVJPG , inst); break;
>>                  default:
>>                          break;
>>                  }
> 
