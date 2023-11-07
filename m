Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978C7E48F3
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 20:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728EF10E661;
	Tue,  7 Nov 2023 19:06:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 355 seconds by postgrey-1.36 at gabe;
 Tue, 07 Nov 2023 19:06:34 UTC
Received: from hs01.dakr.org (hs01.dk-develop.de [IPv6:2a02:c207:3002:6234::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ED510E661
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 19:06:34 +0000 (UTC)
Message-ID: <0697cf1f-a763-4765-af74-5395bb895fdf@dakr.org>
Date: Tue, 7 Nov 2023 20:06:25 +0100
MIME-Version: 1.0
Content-Language: en-US
From: Danilo Krummrich <me@dakr.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
 <a5f0d138-413d-4a21-876a-c51b89caaca2@dakr.org>
In-Reply-To: <a5f0d138-413d-4a21-876a-c51b89caaca2@dakr.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [bug report] drm/nouveau/gsp/r535: add support for
 booting GSP-RM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 11/7/23 20:00, Danilo Krummrich wrote:
> On 11/7/23 15:34, Dan Carpenter wrote:
>> Hello Ben Skeggs,
>>
>> The patch 176fdcbddfd2: "drm/nouveau/gsp/r535: add support for
>> booting GSP-RM" from Sep 19, 2023 (linux-next), leads to the
>> following Smatch static checker warning:
>>
>>     drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1016 r535_gsp_rpc_unloading_guest_driver()
>>     warn: 'rpc' isn't an ERR_PTR
>>
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>>      1010 static int
>>      1011 r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
>>      1012 {
>>      1013         rpc_unloading_guest_driver_v1F_07 *rpc;
>>      1014
>>      1015         rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER, sizeof(*rpc));
>>
>> nvkm_gsp_rpc_get() returns NULL on error.
> 
> There are also code paths where it can return an ERR_PTR. I think we need to check for IS_ERR_OR_NULL()...

Sorry, this is wrong, I just saw that r535_gsp_cmdq_get() calls r535_gsp_cmdq_get()
which returns an ERR_PTR. Put it neither handles the return value of
r535_gsp_cmdq_get() as ERR_PTR nor does it pass it through.

> 
>>
>> --> 1016         if (IS_ERR(rpc))
>>      1017                 return PTR_ERR(rpc);
>>      1018
>>      1019         if (suspend) {
>>      1020                 rpc->bInPMTransition = 1;
>>      1021                 rpc->bGc6Entering = 0;
>>      1022                 rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3;
>>      1023         } else {
>>      1024                 rpc->bInPMTransition = 0;
>>      1025                 rpc->bGc6Entering = 0;
>>      1026                 rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0;
>>      1027         }
>>      1028
>>      1029         return nvkm_gsp_rpc_wr(gsp, rpc, true);
>>      1030 }
>>
>> regards,
>> dan carpenter
