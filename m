Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD562987011
	for <lists+nouveau@lfdr.de>; Thu, 26 Sep 2024 11:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC61710EB2B;
	Thu, 26 Sep 2024 09:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kroah.com header.i=@kroah.com header.b="Hm6UoB+S";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="n1sHVwnH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Thu, 26 Sep 2024 09:26:15 UTC
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC6E10EB2B
 for <nouveau@lists.freedesktop.org>; Thu, 26 Sep 2024 09:26:15 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfout.phl.internal (Postfix) with ESMTP id ACE4A1380519;
 Thu, 26 Sep 2024 05:20:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 26 Sep 2024 05:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1727342434; x=1727428834; bh=/P6JlNt9oT
 w3F/EBwy0EwVzUPK4ujgJS+yL+hqavWD0=; b=Hm6UoB+ScLdykCdXZQUqM3tXaR
 N1VwHs8UjjTqJO6NjuaQiKWdHITXwTbki9N9BlrxL3CVix9EKrT/MCQtWlLioiL/
 8MEQKkahhmCjwtxEeNV0dJL5dHbpz79q+zDzckBst40sb5aCsDjRPVbP1JnLEfyt
 JgqvvaE2XMtDBbo6tplQtmLNlptFCZZKHZcySVO7vBjckB+SqWCPQ3VGbXAPxOd5
 fGX4fQLHxc1uw+CPgTFjnvjXvZ93LMPJr8+Sa6V1DnMvecE0rPAJbJnT6on6hlk3
 A5ynTK9reIVU2eNPuu8/VyLFhkdTbxSqWr3dgIpYPudy1x4oqCFdC+DMt2Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1727342434; x=1727428834; bh=/P6JlNt9oTw3F/EBwy0EwVzUPK4u
 jgJS+yL+hqavWD0=; b=n1sHVwnH0OPdbpeBqlP6neb2+vBQAVQlxi3LP5TrFLhe
 NPAtjFb9asq33nuEEEm+UxU3avWB2q6/lsBLSsgKkqBr1sxOfcAFmxZNxX6eSAvK
 ZaJrENnQjCXeuJQcsvfdS0kIUBKbnX6d/xsqIJfPc//1Hwa9iW9tiQd4x80s5Ati
 YnvpidcTMqNcJqW6aFos6qpCVtflHxg8s6kjvoGymatOvBiF1gjK0MiNJ+strRXM
 iF86Xwc+pM2agy/oxCdfY5gJpQ0Bnd7mgUY2dwH2Mgh+VV0tgFGxSaSeNZpmka7I
 sXwyC6sXaMo9eGQHA31TOv6SePubvWodFu+H2Ystkg==
X-ME-Sender: <xms:Yif1ZgTv3-yH-Eej70db67yH58R3z5QRfEiGm_FKARwPdlaPQOdb9w>
 <xme:Yif1Ztx4vCNz76d8EZp-bgpx9GbNZs1oGpxvqTWPwC2vgXwRAUPbbiH9ix6c6rSNY
 PFUh2Rh8zz6Cw>
X-ME-Received: <xmr:Yif1Zt11BbYrg464HsW87wWY807bNvghRxIKWdA9GkYUVIxvWqXw-hwX2n3p>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
 ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
 grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
 gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeefvddpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepiihhihifsehnvhhiughirgdrtghomhdprhgtphhtth
 hopehkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhouhhvvggr
 uheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrlhgvgi
 drfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehkvghvihhn
 rdhtihgrnhesihhnthgvlhdrtghomhdprhgtphhtthhopehjghhgsehnvhhiughirgdrtg
 homhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohep
 uggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopegrtghurhhrihgusehnvhhiug
 hirgdrtghomh
X-ME-Proxy: <xmx:Yif1ZkAp1_oGiqPgN4FbC00vH1ofrylXy6dj_pen6BLK5Yy32yELbA>
 <xmx:Yif1ZpjU79-Bzv1c65DjzTTvf0xr3Q2BIY4KQ3B522YAsDZSLcEs0A>
 <xmx:Yif1ZgqxJB8oeF16OLAWN9CzMRObQpVKDdAleAZlC6zyeX9KCyOyUw>
 <xmx:Yif1Zsjug41gPt-6gmkB_AdN749qcDg007II3fBKcoenc7lE6ZFaog>
 <xmx:Yif1Zl6oNr96K_Cj3KuGK6K5QB4BAwiDNXWMm0fLstoCLfDLcrQqt7j_>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:20:33 -0400 (EDT)
Date: Thu, 26 Sep 2024 11:20:30 +0200
From: Greg KH <greg@kroah.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 alex.williamson@redhat.com, kevin.tian@intel.com, jgg@nvidia.com,
 airlied@gmail.com, daniel@ffwll.ch, acurrid@nvidia.com,
 cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com,
 aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 zhiwang@kernel.org
Subject: Re: [RFC 01/29] nvkm/vgpu: introduce NVIDIA vGPU support prelude
Message-ID: <2024092604-factor-pushpin-99ee@gregkh>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <20240922124951.1946072-2-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922124951.1946072-2-zhiw@nvidia.com>
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

On Sun, Sep 22, 2024 at 05:49:23AM -0700, Zhi Wang wrote:
> NVIDIA GPU virtualization is a technology that allows multiple virtual
> machines (VMs) to share the power of a single GPU, enabling greater
> flexibility, efficiency, and cost-effectiveness in data centers and cloud
> environments.
> 
> The first step of supporting NVIDIA vGPU in nvkm is to introduce the
> necessary vGPU data structures and functions to hook into the
> (de)initialization path of nvkm.
> 
> Introduce NVIDIA vGPU data structures and functions hooking into the
> the (de)initialization path of nvkm and support the following patches.
> 
> Cc: Neo Jia <cjia@nvidia.com>
> Cc: Surath Mitra <smitra@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Some minor comments that are a hint you all aren't running checkpatch on
your code...

> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */

Wait, what?  Why?  Ick.  You all also forgot the copyright line :(

> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: MIT */
> +#include <core/device.h>
> +#include <core/pci.h>
> +#include <vgpu_mgr/vgpu_mgr.h>
> +
> +static bool support_vgpu_mgr = false;

A global variable for the whole system?  Are you sure that will work
well over time?  Why isn't this a per-device thing?

> +module_param_named(support_vgpu_mgr, support_vgpu_mgr, bool, 0400);

This is not the 1990's, please never add new module parameters, use
per-device variables.  And no documentation?  That's not ok either even
if you did want to have this.

> +static inline struct pci_dev *nvkm_to_pdev(struct nvkm_device *device)
> +{
> +	struct nvkm_device_pci *pci = container_of(device, typeof(*pci),
> +						   device);
> +
> +	return pci->pdev;
> +}
> +
> +/**
> + * nvkm_vgpu_mgr_is_supported - check if a platform support vGPU
> + * @device: the nvkm_device pointer
> + *
> + * Returns: true on supported platform which is newer than ADA Lovelace
> + * with SRIOV support.
> + */
> +bool nvkm_vgpu_mgr_is_supported(struct nvkm_device *device)
> +{
> +	struct pci_dev *pdev = nvkm_to_pdev(device);
> +
> +	if (!support_vgpu_mgr)
> +		return false;
> +
> +	return device->card_type == AD100 &&  pci_sriov_get_totalvfs(pdev);

checkpatch please.

And "AD100" is an odd #define, as you know.

> +}
> +
> +/**
> + * nvkm_vgpu_mgr_is_enabled - check if vGPU support is enabled on a PF
> + * @device: the nvkm_device pointer
> + *
> + * Returns: true if vGPU enabled.
> + */
> +bool nvkm_vgpu_mgr_is_enabled(struct nvkm_device *device)
> +{
> +	return device->vgpu_mgr.enabled;

What happens if this changes right after you look at it?


> +}
> +
> +/**
> + * nvkm_vgpu_mgr_init - Initialize the vGPU manager support
> + * @device: the nvkm_device pointer
> + *
> + * Returns: 0 on success, -ENODEV on platforms that are not supported.
> + */
> +int nvkm_vgpu_mgr_init(struct nvkm_device *device)
> +{
> +	struct nvkm_vgpu_mgr *vgpu_mgr = &device->vgpu_mgr;
> +
> +	if (!nvkm_vgpu_mgr_is_supported(device))
> +		return -ENODEV;
> +
> +	vgpu_mgr->nvkm_dev = device;
> +	vgpu_mgr->enabled = true;
> +
> +	pci_info(nvkm_to_pdev(device),
> +		 "NVIDIA vGPU mananger support is enabled.\n");

When drivers work properly, they are quiet.

Why can't you see this all in the sysfs tree instead to know if support
is there or not?  You all are properly tieing in your "sub driver" logic
to the driver model, right?  (hint, I don't think so as it looks like
that isn't happening, but I could be missing it...)

thanks,

greg k-h
