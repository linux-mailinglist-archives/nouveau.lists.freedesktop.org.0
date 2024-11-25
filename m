Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81599D8AA1
	for <lists+nouveau@lfdr.de>; Mon, 25 Nov 2024 17:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EAE10E153;
	Mon, 25 Nov 2024 16:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zwc5kr0Y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B608C10E6C1
 for <nouveau@lists.freedesktop.org>; Mon, 25 Nov 2024 16:50:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DEAD1A41865;
 Mon, 25 Nov 2024 16:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039C8C4CECE;
 Mon, 25 Nov 2024 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732553437;
 bh=Yk0mXXn+0C2rSFT/jNyC+/4o0CeXEbP4rRZpe4HGel0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zwc5kr0Y+TXDiIBDGTGIlSdfYStkXrcsp/+pDc25r4pV4eLFeey4OLs7t3SSWif+U
 S8dSl+WiZVQQSIqo5nnnzWuVG+KQDhNzWhMjOywSZZwks5GHUOX2sKQGSgE5GiBFei
 tPMKSdbajtgk/eUSC0XJ97vkTvirC/a8q6NnRFV4hoeTspJ0eunX1B0yUI+v7fQe5v
 juwIV3C6Xe4u950n+aSj7gjvCV6uXyJJorPQGyfy0vm6EHxrUJQi0n+QeP6BYavBlA
 0Y28UBNjnwpEY6ukaRkYfkANacdRPALs6i7EcIDP9sFT1WDEoPHkl13W55cxArY9gR
 wHuoMQ9sXLr+g==
Message-ID: <5dfea7e0-9b05-43fa-b5d2-c99ea7ac6a18@kernel.org>
Date: Mon, 25 Nov 2024 17:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVKM GSP RPC fixes
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, smitra@nvidia.com,
 ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, zhiwang@kernel.org
References: <20241017071922.2518724-1-zhiw@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20241017071922.2518724-1-zhiw@nvidia.com>
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

On 10/17/24 9:19 AM, Zhi Wang wrote:
> Hi folks:
> 
> Here are some fixes of weird bugs I encountered when I was enabling vGPU [1] on
> core-driver aka NVKM. They are exposed because of the new RPCs required by
> vGPU.
> 
> For testing, I tried to run Uniengine Heaven[2] on my RTX 4060 for 8 hours and
> the GL CTS runner[3] (commandline: ./cts-runner --type-gl40) from Khronos
> without any problem.
> 
> v2:
> 
> - Remove the Fixes: tags as the vanilla nouveau aren't going to hit these bugs. (Danilo)
> - Test the patchset on VK-GL-CTS. (Danilo)
> - Remove the ambiguous empty line in PATCH 2. (Danilo)
> - Rename the r535_gsp_msgq_wait to gsp_msgq_recv. (Danilo)
> - Introduce a data structure to hold the params of gsp_msgq_recv(). (Danilo)
> - Document the params and the states they are related to. (Danilo)
> 
> [1] https://lore.kernel.org/kvm/20240922124951.1946072-1-zhiw@nvidia.com/T/#t
> [2] https://benchmark.unigine.com/heaven
> [3] https://github.com/KhronosGroup/VK-GL-CTS
> 
> Zhi Wang (3):
>    nvkm/gsp: correctly advance the read pointer of GSP message queue
>    nvkm: correctly calculate the available space of the GSP cmdq buffer

Applied patches 1 and 2 to drm-misc-next, thanks!

Sorry for the delay,
Danilo

>    nvkm: handle the return of large RPC
> 
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 251 +++++++++++++-----
>   1 file changed, 184 insertions(+), 67 deletions(-)
> 

