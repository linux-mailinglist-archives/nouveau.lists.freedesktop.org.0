Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF8194665F
	for <lists+nouveau@lfdr.de>; Sat,  3 Aug 2024 02:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F5F10E03C;
	Sat,  3 Aug 2024 00:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YujADknh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A7310E03C
 for <nouveau@lists.freedesktop.org>; Sat,  3 Aug 2024 00:00:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AE652CE1BD4;
 Sat,  3 Aug 2024 00:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77DBC32782;
 Sat,  3 Aug 2024 00:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722643217;
 bh=5IJRrwxoQfc14s5Q2qgQiPrFZPWKVI3C2gTCrpLAx50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YujADknhDgRnFEmeRj8nlFQYvJ8M/09N4Xo78gohJI8zSB6c1g7ClfkYW0H7J47Of
 EBY1WoWbLsSlbaIICCJM9957WlFk1Xk1BCgzEziYOa/mr0fquEjGiPLx/1Bl6NAL9e
 97z/CSMFg85zD2Ob/RolS9aJAiVcgY2DPmPEz1AhkO0uLQ/9T7NEf4dz8QUqfRy5gn
 AmW+aZ4Hwmy16ZUU4tS1Jl/dOnEBaUozjlbYSITBfa0bZWW/Tlj5/aZOMKe7LK6y4z
 t1wWAjUn336R4YzCYlkBk6T/USaCnEhnbmYl1o/IpJu/ar5NDH+lllTyYlG5/OfThm
 /MdjLKshUmBZg==
Date: Sat, 3 Aug 2024 02:00:13 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <ttabi@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, bskeggs@nvidia.com,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/2] [v7] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Message-ID: <Zq1zDcN2JYTro7VW@cassiopeiae>
References: <20240802190517.2548654-1-ttabi@nvidia.com>
 <20240802190517.2548654-2-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802190517.2548654-2-ttabi@nvidia.com>
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

On Fri, Aug 02, 2024 at 02:05:17PM -0500, Timur Tabi wrote:

I was about to apply this patch, but noticed a bug while smoke testing things.

> +/**
> + * r535_gsp_libos_debugfs_init - create logging debugfs entries
> + * @gsp: gsp pointer
> + *
> + * Create the debugfs entries. This exposes the log buffers to userspace so
> + * that an external tool can parse it.
> + *
> + * The 'logpmu' contains exception dumps from the PMU. It is written via an
> + * RPC sent from GSP-RM and must be only 4KB. We create it here because it's
> + * only useful if there is a debugfs entry to expose it. If we get the PMU
> + * logging RPC and there is no debugfs entry, the RPC is just ignored.
> + *
> + * The blob_init, blob_rm, and blob_pmu objects can't be transient
> + * because debugfs_create_blob doesn't copy them.
> + *
> + * NOTE: OpenRM loads the logging elf image and prints the log messages
> + * in real-time. We may add that capability in the future, but that
> + * requires loading an ELF images that are not distributed with the driver,
> + * and adding the parsing code to Nouveau.
> + *
> + * Ideally, this should be part of nouveau_debugfs_init(), but that function
> + * is called too late. We really want to create these debugfs entries before
> + * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
> + * there could still be a log to capture.
> + */
> +static void
> +r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
> +{
> +	struct dentry *dir, *dir_init;
> +	struct dentry *dir_intr = NULL, *dir_rm = NULL, *dir_pmu = NULL;
> +	struct device *dev = gsp->subdev.device->dev;
> +
> +	/* Each GPU has a subdir based on its device name, so find it */
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);

In drm-misc-next dev_get_drvdata() returns a struct nouveau_drm. Interestingly,
things do not blow up however.

Instead, I noticed that your debugfs entries are created in the debugfs root,
instead of "dri/<PCI_ID>/".

I think we shouldn't try to use the DRI debugfs directory anyway to avoid DRM
layer dependencies in nvkm. Let's create our own nouveau one, like you did in
earlier versions of this patch.

Please also make sure to test your patches on a recent drm-misc-next branch.

> +
> +	dir = drm_dev->debugfs_root;
> +
> +	gsp->blob_init.data = gsp->loginit.data;
> +	gsp->blob_init.size = gsp->loginit.size;
> +	gsp->blob_intr.data = gsp->logintr.data;
> +	gsp->blob_intr.size = gsp->logintr.size;
> +	gsp->blob_rm.data = gsp->logrm.data;
> +	gsp->blob_rm.size = gsp->logrm.size;
> +
> +	dir_init = debugfs_create_blob("loginit", 0444, dir, &gsp->blob_init);
> +	if (IS_ERR(dir_init)) {
> +		nvkm_error(&gsp->subdev, "failed to create loginit debugfs entry\n");
> +		goto error;
> +	}
> +
> +	dir_intr = debugfs_create_blob("logintr", 0444, dir, &gsp->blob_intr);
> +	if (IS_ERR(dir_intr)) {
> +		nvkm_error(&gsp->subdev, "failed to create logintr debugfs entry\n");
> +		goto error;
> +	}
> +
> +	dir_rm = debugfs_create_blob("logrm", 0444, dir, &gsp->blob_rm);
> +	if (IS_ERR(dir_rm)) {
> +		nvkm_error(&gsp->subdev, "failed to create logrm debugfs entry\n");
> +		goto error;
> +	}
> +
> +	/*
> +	 * Since the PMU buffer is copied from an RPC, it doesn't need to be
> +	 * a DMA buffer.
> +	 */
> +	gsp->blob_pmu.size = GSP_PAGE_SIZE;
> +	gsp->blob_pmu.data = kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
> +	if (!gsp->blob_pmu.data)
> +		goto error;
> +
> +	dir_pmu = debugfs_create_blob("logpmu", 0444, dir, &gsp->blob_pmu);
> +	if (IS_ERR(dir_pmu)) {
> +		nvkm_error(&gsp->subdev, "failed to create logpmu debugfs entry\n");
> +		kfree(gsp->blob_pmu.data);
> +		goto error;
> +	}
> +
> +	i_size_write(d_inode(dir_init), gsp->blob_init.size);
> +	i_size_write(d_inode(dir_intr), gsp->blob_intr.size);
> +	i_size_write(d_inode(dir_rm), gsp->blob_rm.size);
> +	i_size_write(d_inode(dir_pmu), gsp->blob_pmu.size);
> +
> +	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
> +			      r535_gsp_msg_libos_print, gsp);
> +
> +	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
> +
> +	if (keep_gsp_logging) {
> +		nvkm_info(&gsp->subdev,
> +			  "logging buffers will be retained on failure\n");
> +	}
> +
> +	return;
> +
> +error:
> +	debugfs_remove(dir_init);
> +	debugfs_remove(dir_intr);
> +	debugfs_remove(dir_rm);
> +}
> +
> +#endif
>}
