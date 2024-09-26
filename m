Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43E1986FED
	for <lists+nouveau@lfdr.de>; Thu, 26 Sep 2024 11:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8889710EB28;
	Thu, 26 Sep 2024 09:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oLfzfQWl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEBB10EB28
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2024 09:21:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57BA75C58B1;
 Thu, 26 Sep 2024 09:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1E1C4CEC5;
 Thu, 26 Sep 2024 09:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1727342505;
 bh=jsc+yal2wRsZ6ma4AV6jppyqJT421Ro1/Wl5XtY4xGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oLfzfQWl9rlfHAxMWpQXsy7hg/Mq/q2RGEBcu3tUwylxTEeWgAGKtBNlAd0BsEd6L
 F+tuRCK5IgjyWUKhjL6B7EyY6ciLv+4O4/4ocKk6GhdbloCZYlaHoDy5w0lpK1YCZU
 z3jU4QjKrs28KR4KG6pT0oPtCHvGbT+zzDg7LiiQ=
Date: Thu, 26 Sep 2024 11:21:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 alex.williamson@redhat.com, kevin.tian@intel.com, jgg@nvidia.com,
 airlied@gmail.com, daniel@ffwll.ch, acurrid@nvidia.com,
 cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com,
 aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 zhiwang@kernel.org
Subject: Re: [RFC 02/29] nvkm/vgpu: attach to nvkm as a nvkm client
Message-ID: <2024092650-grant-pastime-713e@gregkh>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <20240922124951.1946072-3-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922124951.1946072-3-zhiw@nvidia.com>
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

On Sun, Sep 22, 2024 at 05:49:24AM -0700, Zhi Wang wrote:
> nvkm is a HW abstraction layer(HAL) that initializes the HW and
> allows its clients to manipulate the GPU functions regardless of the
> generations of GPU HW. On the top layer, it provides generic APIs for a
> client to connect to NVKM, enumerate the GPU functions, and manipulate
> the GPU HW.
> 
> To reach nvkm, the client needs to connect to NVKM layer by layer: driver
> layer, client layer, and eventually, the device layer, which provides all
> the access routines to GPU functions. After a client attaches to NVKM,
> it initializes the HW and is able to serve the clients.
> 
> Attach to nvkm as a nvkm client.
> 
> Cc: Neo Jia <cjia@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  .../nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h  |  8 ++++
>  .../gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c  | 48 ++++++++++++++++++-
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h b/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
> index 3163fff1085b..9e10e18306b0 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
> @@ -7,6 +7,14 @@
>  struct nvkm_vgpu_mgr {
>  	bool enabled;
>  	struct nvkm_device *nvkm_dev;
> +
> +	const struct nvif_driver *driver;

Meta-comment, why is this attempting to act like a "driver" and yet not
tieing into the driver model code at all?  Please fix that up, it's not
ok to add more layers on top of a broken one like this.  We have
infrastructure for this type of thing, please don't route around it.

thanks,

greg k-h
