Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B7A98F947
	for <lists+nouveau@lfdr.de>; Thu,  3 Oct 2024 23:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C7A10E267;
	Thu,  3 Oct 2024 21:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DGyNj7l3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B55410E267;
 Thu,  3 Oct 2024 21:55:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8F015C5973;
 Thu,  3 Oct 2024 21:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB67DC4CEC5;
 Thu,  3 Oct 2024 21:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727992526;
 bh=xOjdTn+0KHxGvPQv4VL8wLsownOXdNAg1fw1fwx8JjI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DGyNj7l3Z5piZ/alfc6qwx1jeOwz0ISpn/6LF81xH7qlgh4I3MPwSWTnt8wrM9FJs
 jBYLccNjffKy18r4GP9nXdCrZsjTYXaD0/6U42PWQWrt8nI1hXVJZ8Uf3rsG3Y9LgX
 HEh0gMH76Qa9ihuw0ffMoLsWYM2SD6JU5HVKPmJ37rnIk916HyOfBqM8tqO5k3qFmg
 egLyOkVY298GGyRtTNXge4+EKMSLGLGnZEW3XKjOKKpcYT7z80mCRVmF1kP9sKrfmC
 vMZAETHke116oUvn8SdgmLdPOvJvSrsboibyq3HQPsnGXmPJK9bBCb5vKchuVmz4Zx
 g2sMiU5hUJPvQ==
Message-ID: <a581ba08-11c1-4d0a-aa0e-0650b698355d@kernel.org>
Date: Thu, 3 Oct 2024 23:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/gsp: remove extraneous ; after mutex
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240917120856.1877733-1-colin.i.king@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20240917120856.1877733-1-colin.i.king@gmail.com>
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

On 9/17/24 2:08 PM, Colin Ian King wrote:
> The mutex field has two following semicolons, replace this with just
> one semicolon.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to drm-misc-fixes, thanks!

> ---
>   drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 9e6f39912368..a2055f2a014a 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -210,7 +210,7 @@ struct nvkm_gsp {
>   	} *rm;
>   
>   	struct {
> -		struct mutex mutex;;
> +		struct mutex mutex;
>   		struct idr idr;
>   	} client_id;
>   

