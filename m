Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC18B1F45C
	for <lists+nouveau@lfdr.de>; Sat,  9 Aug 2025 13:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32B910E14C;
	Sat,  9 Aug 2025 11:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CXlFgQp/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D616D10E14C
 for <nouveau@lists.freedesktop.org>; Sat,  9 Aug 2025 11:26:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CC097A55149;
 Sat,  9 Aug 2025 11:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD436C4CEE7;
 Sat,  9 Aug 2025 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754738781;
 bh=UK42PTeLM1fVCCV7CS5T0TYsGMFKIngrSZDnTu4rP+E=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=CXlFgQp/NN8UAkNtL9Lo4D/u7J0UGyc3T3EezsXyf/0GPxggAEkQoAwxVqGWNnXN2
 X+J4JMJV8leyVMeY/SVKPpRn0S7R0BkPQ1epPh0KuACNv3knK4lJffdO0zkgmYonlv
 ZQnD2vuOfsSFlMYdGmNDEKFBujZBXYYYZkcozfuHWQwPsL50WFl7rkhy1D5t7dZU4C
 TrJ9brC7OFqlgtUF8tL02oZEZfJB5CNEsWPTTJrmokVf1MySbH6vZorOHZLwhOQ6Nm
 +Ukc/VbVHXbPM0sItVltWaNqJbURcTXETp0rxwOsTPgmyqsmg/YU55IbkbZUq9osKd
 SoD6fmTnmvnEg==
Message-ID: <aff2be6d-0c86-4712-b198-a3efc43a015e@kernel.org>
Date: Sat, 9 Aug 2025 13:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
To: Timur Tabi <ttabi@nvidia.com>
References: <20250804192601.10861-1-ttabi@nvidia.com>
 <20250804192601.10861-2-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <20250804192601.10861-2-ttabi@nvidia.com>
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

On 8/4/25 9:25 PM, Timur Tabi wrote:
> Function nvkm_gsp_fwsec_v2() sets 'ret' if the kmemdup() call fails, but
> it never uses or returns 'ret' after that point.  We always need to release
> the firmware regardless, so do that and then check for error.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")

As mentioned by Philipp, we should Cc stable for this one.

> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> index 52412965fac1..5b721bd9d799 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> @@ -209,11 +209,12 @@ nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
>   	fw->boot_addr = bld->start_tag << 8;
>   	fw->boot_size = bld->code_size;
>   	fw->boot = kmemdup(bl->data + hdr->data_offset + bld->code_off, fw->boot_size, GFP_KERNEL);
> -	if (!fw->boot)
> -		ret = -ENOMEM;
>   
>   	nvkm_firmware_put(bl);
>   
> +	if (!fw->boot)
> +		return -ENOMEM;

Good catch! It's also good that you moved the return below the
nvkm_firmware_put() call.

But don't we also need to revert the preceding call to nvkm_falcon_fw_ctor()?

> +
>   	/* Patch in interface data. */
>   	return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
>   }

