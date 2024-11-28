Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19159DB5CF
	for <lists+nouveau@lfdr.de>; Thu, 28 Nov 2024 11:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4010E346;
	Thu, 28 Nov 2024 10:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oPpv9oM2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07AE10E346
 for <nouveau@lists.freedesktop.org>; Thu, 28 Nov 2024 10:37:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0C995C59F3;
 Thu, 28 Nov 2024 10:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747FDC4CED2;
 Thu, 28 Nov 2024 10:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732790238;
 bh=oMqbfJoQR1Y6je4wNRTFmj8vfBPWAMaBmwmfOFEVeXs=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=oPpv9oM2Ye2rIR2MSmCfLXstFlSxtDZ+cprxsvXxVkx5oy4Gf0e48X5A/Gx2EfmpV
 YATrUn72RTUBWoSLc9HZIxdyB3xK7VPSp23cTmIRp50APk+bVQcHT8d2/TFhLWqcrV
 trtUBH6sHsuFGf/XYxH61CFsgbdLSs7X6hTZjVNUekUYh67+LtGwrNS4Qg5VHYn+Bj
 Lsk/2t4hCuKhpNdFNdJ6wQfbTMpPnhXYSsqd/Xq6kXWLN/rZ8jwHmzIoL5QYv+OcCG
 yqmfvnIAM2xfY03NPvqh4bVsAS8gxtiRihymF/5c1A4NoIVGOEpk8uX3uQZfkG/akD
 blAQUrm6jpbXg==
Message-ID: <792a2ec4-ae2d-479f-98a2-32ea0a1ec7dc@kernel.org>
Date: Thu, 28 Nov 2024 11:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: create module debugfs root
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20241030202952.694055-2-ttabi@nvidia.com>
 <20241125142639.9126-1-dakr@kernel.org>
 <1b289bc781c587de41ea489f9a014ca4c3f58491.camel@nvidia.com>
 <c54dae67-21c8-4fa1-90f1-12fdfb302c95@kernel.org>
Content-Language: en-US
In-Reply-To: <c54dae67-21c8-4fa1-90f1-12fdfb302c95@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/25/24 6:00 PM, Danilo Krummrich wrote:
> On 11/25/24 5:55 PM, Timur Tabi wrote:
>> On Mon, 2024-11-25 at 15:25 +0100, Danilo Krummrich wrote:
>>> Typically DRM drivers use the DRM debugfs root entry. However, since
>>> Nouveau is heading towards a split into a core and a DRM driver, create
>>> a module specific debugfs root directory.
>>>
>>> Subsequent patches make use of this new debugfs root in order to store
>>> GSP-RM log bufferes (optionally beyond a device driver binding).
>>
>> "buffers">
>>>
>>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>>> ---
>>> Unless there are any concerns, I'll pick this patch and rebase 
>>> Timur's patches
>>> on top of it.
>>
>> Well, my only concern is that my code assumes that it is the creator and
>> destroyer of /sys/kernel/debug/nouveau, so I don't think it's going to 
>> be a
>> simple rebase.
> 
> I already did the rebase; no action for you.
> 
> Lifetime wise we're good. We create the debugfs root entry before the 
> driver is registered in module_init() and it's removed after the driver 
> is unregistered in module_exit().

So, if you're fine with that patch, you may want to offer your ACK, such
that I can go ahead and apply the series. :)
