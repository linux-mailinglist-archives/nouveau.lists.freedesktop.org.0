Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27D19A20FC
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 13:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD4D10E7EE;
	Thu, 17 Oct 2024 11:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PViMFZho";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4216210E7EE
 for <nouveau@lists.freedesktop.org>; Thu, 17 Oct 2024 11:32:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39AC25C60EB;
 Thu, 17 Oct 2024 11:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F670C4CEC3;
 Thu, 17 Oct 2024 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729164768;
 bh=r1IiSnAkYiS0NP/cyGmYsw7K91UXDo3rqnS7feSToCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PViMFZhoKibeY/qlUhuSHFSYXlBRSr17NW3Nrgwd9YF5wPav0Cb3bBnboqAWSikDS
 nhEIBDiKWiDKimNbcGuiVcf4F/ApyL6zyp3aoUDyFICdcod5ho9WMwr+33DJU5reL/
 9PZCg2an4ZNQubAKd3SCCwQo51l+SRWrM0C9e7ikwo1903BHvL968osCa+FID/FWOh
 HEulfEXIrCX3DttdF6TgFQOH6B85pqZIWBNQP23GJ/PE2zqPeDFlBd5S3Z9QK3kp6u
 TnnON0QdfHO6R26onc+gW6oPF0yQbFHegmapmMn2prMgUfRVrS/9QOY3d3BP+kCkPC
 4MV80ku6aWLaQ==
Date: Thu, 17 Oct 2024 13:32:42 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: nouveau@lists.freedesktop.org, airlied@gmail.com, daniel@ffwll.ch,
 bskeggs@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Subject: Re: [PATCH 0/3] NVKM GSP RPC fixes
Message-ID: <ZxD12t-L_eDhaE33@pollux>
References: <20241017071922.2518724-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017071922.2518724-1-zhiw@nvidia.com>
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

On Thu, Oct 17, 2024 at 12:19:19AM -0700, Zhi Wang wrote:
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

When you send a v2, please make sure to pass `-v2` to `git format-patch`,
otherwise it's hard to distinguish patch versions from their subject.

> 
> [1] https://lore.kernel.org/kvm/20240922124951.1946072-1-zhiw@nvidia.com/T/#t
> [2] https://benchmark.unigine.com/heaven
> [3] https://github.com/KhronosGroup/VK-GL-CTS
> 
> Zhi Wang (3):
>   nvkm/gsp: correctly advance the read pointer of GSP message queue
>   nvkm: correctly calculate the available space of the GSP cmdq buffer
>   nvkm: handle the return of large RPC
> 
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 251 +++++++++++++-----
>  1 file changed, 184 insertions(+), 67 deletions(-)
> 
> -- 
> 2.34.1
> 
