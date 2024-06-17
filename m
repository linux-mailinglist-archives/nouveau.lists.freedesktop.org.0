Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8138490BB72
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2024 21:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBC610E4D4;
	Mon, 17 Jun 2024 19:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LPiQrvx0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0E810E4D4
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 19:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718654070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QiFuOQZKjtkMF3QUZF6+ldHxfCSkiR5sRzCz1ELUBqQ=;
 b=LPiQrvx0Kj6T5uI6X6Fq3nkB7a4xM58ftT85LO3F0qXEjlC01DrUZyZ4WcxhlSKIipLI+r
 PhVrq9kFzlSivuFOuASgIIeQn5ELatE/FjUIRrOSoWGKYwGiNgquX+DKCv19NYNdWt/pDJ
 gzkfKsmTCfxo1X/0jdQ5KVWV51O4Pv8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-t3GPDBFGOsGsQZLFQoBADQ-1; Mon, 17 Jun 2024 15:54:28 -0400
X-MC-Unique: t3GPDBFGOsGsQZLFQoBADQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-421179fd82bso30903295e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 12:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718654067; x=1719258867;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiFuOQZKjtkMF3QUZF6+ldHxfCSkiR5sRzCz1ELUBqQ=;
 b=vNURHDRztL8Ffqn/FfqtjxvVzrdlDPdi9wE/TeyaLoXzaMT5yx2k1HF5a9eZsnKgFJ
 ebqm7qQZVXQqrBO5SPLROArIYyMM+qvMpLSNbcM/S4eKpAzF7LtURyfVCYaa+w37em/7
 55pGGkO6AExCFJLZq3CjLLiXl+wtFzAY+nMmTE6ip8d/0Zl6G+ePD3+lFVwcGIRzwPeF
 7ShpDHWtg+ptqBAuFG3+KsEjF2Ofmp4ZLt5URxg072ITx2I0RRhT/jQwyChQxoGXdGNV
 sPkckMLIFfjdwROqvwBEtE3cz/RMDrYvDwLYtcvef420bXppT9AbDkCpnmWB6OYeTWCf
 MQlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXumgLWPSQM0aq0zFJO4plnRzd9AfEuh54gIF8aLt3gBojGMVjNhlvRQsLzmcCJIVFbVBcKCtSMAhxpCE9KPk6a3SKPyqOghHS4g/uXYw==
X-Gm-Message-State: AOJu0YxxxAOsEslEwdIvrxvtetfReCpGOKW40+EWd9OhrWjLGX4gI+Kc
 2PKjt/IfN72vdnpr/y4fw0F/Gb1UX8xWdfI8xV9PfuHdf4/pYhES9Ugzf2b19rMG8fxZJav+2Lf
 OEiu949LD8ssiaNyu6HN6cCjh/rC9hnsOfa24hXX7A0ensZPvEZflJ4hdHhTNk8s=
X-Received: by 2002:a7b:ce97:0:b0:423:b6cd:8ea5 with SMTP id
 5b1f17b1804b1-423b6cd8fcemr54576595e9.4.1718654067062; 
 Mon, 17 Jun 2024 12:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2mXPJBsdnNRMFatdvsbZfGD4DJKhoKKW+1rw9FO4iwg1s2rx4z0xzOctWI1wa9CDaHKxK0A==
X-Received: by 2002:a7b:ce97:0:b0:423:b6cd:8ea5 with SMTP id
 5b1f17b1804b1-423b6cd8fcemr54576425e9.4.1718654066456; 
 Mon, 17 Jun 2024 12:54:26 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6419e38sm170431035e9.39.2024.06.17.12.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 12:54:25 -0700 (PDT)
Date: Mon, 17 Jun 2024 21:54:23 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, bskeggs@nvidia.com,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/2] [v5] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Message-ID: <ZnCUb-lWCVlV5x0v@cassiopeiae>
References: <20240612235253.1624004-1-ttabi@nvidia.com>
 <20240612235253.1624004-2-ttabi@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240612235253.1624004-2-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Timur,

thanks for the follow-up on this patch series.

On Wed, Jun 12, 2024 at 06:52:53PM -0500, Timur Tabi wrote:
> The LOGINIT, LOGINTR, LOGRM, and LOGPMU buffers are circular buffers
> that have printf-like logs from GSP-RM and PMU encoded in them.
> 
> LOGINIT, LOGINTR, and LOGRM are allocated by Nouveau and their DMA
> addresses are passed to GSP-RM during initialization.  The buffers are
> required for GSP-RM to initialize properly.
> 
> LOGPMU is also allocated by Nouveau, but its contents are updated
> when Nouveau receives an NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPC from
> GSP-RM.  Nouveau then copies the RPC to the buffer.
> 
> The messages are encoded as an array of variable-length structures that
> contain the parameters to an NV_PRINTF call.  The format string and
> parameter count are stored in a special ELF image that contains only
> logging strings.  This image is not currently shipped with the Nvidia
> driver.
> 
> There are two methods to extract the logs.
> 
> OpenRM tries to load the logging ELF, and if present, parses the log
> buffers in real time and outputs the strings to the kernel console.
> 
> Alternatively, and this is the method used by this patch, the buffers
> can be exposed to user space, and a user-space tool (along with the
> logging ELF image) can parse the buffer and dump the logs.
> 
> This method has the advantage that it allows the buffers to be parsed
> even when the logging ELF file is not available to the user.  However,
> it has the disadvantage the debubfs entries need to remain until the
> driver is unloaded.
> 
> The buffers are exposed via debugfs.  If GSP-RM fails to initialize,
> then Nouveau immediately shuts down the GSP interface.  This would
> normally also deallocate the logging buffers, thereby preventing the
> user from capturing the debug logs.
> 
> To avoid this, introduce the keep-gsp-logging command line parameter.
> If specified, and if at least one logging buffer has content, then
> Nouveau will migrate these buffers into new debugfs entries that are
> retained until the driver unloads.
> 
> An end-user can capture the logs using the following commands:
> 
>     cp /sys/kernel/debug/dri/<path>/loginit loginit
>     cp /sys/kernel/debug/dri/<path>/logrm logrm
>     cp /sys/kernel/debug/dri/<path>/logintr logintr
>     cp /sys/kernel/debug/dri/<path>/logpmu logpmu
> 
> where <path> is the PCI ID of the GPU (e.g. 0000:65:00.0).
> 
> Since LOGPMU is not needed for normal GSP-RM operation, it is only
> created if debugfs is available.  Otherwise, the
> NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
> v5:
> rebased to drm-misc-next
> repaced nvkm_gsp_log with nvif_log
> minor rearrangement of some code
> 
>  drivers/gpu/drm/nouveau/include/nvif/log.h    |  32 ++
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  13 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  19 +
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 360 +++++++++++++++++-
>  4 files changed, 423 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/log.h b/drivers/gpu/drm/nouveau/include/nvif/log.h
> new file mode 100644
> index 000000000000..c89ba85a701d
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvif/log.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/* SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. */
> +
> +#ifndef __NVIF_LOG_H__
> +#define __NVIF_LOG_H__
> +
> +/**
> + * nvif_log - structure for tracking logging buffers
> + * @head: list head

What about "@entry: an entry in a list of struct nvif_logs".

> + * @shutdown: pointer to function to call to clean up

I'd be a bit more specific and say that this frees all backing resources, such
as logging buffer, etc.

> + *
> + * Structure used to track logging buffers so that they can be cleaned up
> + * when the driver exits.
> + */
> +struct nvif_log {
> +	struct list_head head;

I suggest to call this 'entry', since that's what it actually represents, and
entry in a list.

> +	void (*shutdown)(struct nvif_log *log);
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +/**
> + * gsp_logs - list of nvif_log GSP-RM logging buffers
> + *
> + * Head pointer to a a list of nvif_log buffers that is created for each GPU
> + * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
> + * specified.  This is used to track the alternative debugfs entries for the
> + * GSP-RM logs.
> + */
> +extern struct list_head gsp_logs;

Better wrap this in a struct nvif_logs (or similar) and pass this down through
nvkm_device_pci_new() / nvkm_device_tegra_new() instead of relying on sharing
a global.

> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index a45a4ad843b9..836443fd5659 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -5,6 +5,8 @@
>  #include <core/falcon.h>
>  #include <core/firmware.h>
>  
> +#include <linux/debugfs.h>
> +
>  #define GSP_PAGE_SHIFT 12
>  #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
>  
> @@ -220,6 +222,17 @@ struct nvkm_gsp {
>  
>  	/* The size of the registry RPC */
>  	size_t registry_rpc_size;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	/*
> +	 * Logging buffers in debugfs.  The wrapper objects need to remain
> +	 * in memory until the dentry is deleted.
> +	 */
> +	struct debugfs_blob_wrapper blob_init;
> +	struct debugfs_blob_wrapper blob_intr;
> +	struct debugfs_blob_wrapper blob_rm;
> +	struct debugfs_blob_wrapper blob_pmu;
> +#endif
>  };
>  
>  static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a58c31089613..3d0fa1f64872 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -46,6 +46,7 @@
>  #include <nvif/fifo.h>
>  #include <nvif/push006c.h>
>  #include <nvif/user.h>
> +#include <nvif/log.h>
>  
>  #include <nvif/class.h>
>  #include <nvif/cl0002.h>
> @@ -113,6 +114,13 @@ static struct drm_driver driver_stub;
>  static struct drm_driver driver_pci;
>  static struct drm_driver driver_platform;
>  
> +#ifdef CONFIG_DEBUG_FS
> +/**
> + * gsp_logs - list of GSP debugfs logging buffers
> + */
> +LIST_HEAD(gsp_logs);

Better wrap this in a NVIF_LOGS_DECLARE() macro.

> +#endif
> +
>  static u64
>  nouveau_pci_name(struct pci_dev *pdev)
>  {
> @@ -1446,6 +1454,17 @@ nouveau_drm_exit(void)
>  #endif
>  	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
>  		mmu_notifier_synchronize();
> +
> +#ifdef CONFIG_DEBUG_FS
> +	if (!list_empty(&gsp_logs)) {
> +		struct nvif_log *log, *n;
> +
> +		list_for_each_entry_safe(log, n, &gsp_logs, head) {
> +			/* shutdown() should also delete the log entry */
> +			log->shutdown(log);
> +		}
> +	}
> +#endif

Please move this to include/nvif/log.h as nvif_log_shutdown().

>  }
>  
>  module_init(nouveau_drm_init);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index bbab6d452aa2..51ac66031b06 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -26,6 +26,8 @@
>  #include <subdev/vfn.h>
>  #include <engine/fifo/chan.h>
>  #include <engine/sec2.h>
> +#include <drm/drm_device.h>
> +#include <nvif/log.h>
>  
>  #include <nvfw/fw.h>
>  
> @@ -2062,6 +2064,169 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +
> +/*
> + * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
> + * logging debugfs entries will be deleted, and it will not be possible to
> + * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
> + * to copy the logging buffers to new debugfs entries, and these entries are
> + * retained until the driver unloads.
> + */
> +static bool keep_gsp_logging;
> +module_param(keep_gsp_logging, bool, 0444);
> +MODULE_PARM_DESC(keep_gsp_logging,
> +		 "Migrate the GSP-RM logging debugfs entries upon exit");
> +
> +#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
> +
> +/**
> + * r535_gsp_msg_libos_print - capture log message from the PMU
> + * @priv: gsp pointer
> + * @fn: function number (ignored)
> + * @repv: pointer to libos print RPC
> + * @repc: message size
> + *
> + * See _kgspRpcUcodeLibosPrint

What is this reference?

> + */
> +static int r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
> +{
> +	struct nvkm_gsp *gsp = priv;
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct {
> +		u32 ucodeEngDesc;
> +		u32 libosPrintBufSize;
> +		u8 libosPrintBuf[];

Why are those camelCase? Please use snake_case instead.

Also, please add a few notes on the fields GSP returns to us here. Admittedly,
two of those seem rather obvious - a log buffer and a size - but maybe we can
write down whether there is some maximum or minimum size? Can we get called with
a zero-size buffer?

What about 'ucodeEngDesc'? This one seems to behave more like a register value,
can we document the "register layout" for this one?

> +	} *rpc = repv;
> +	unsigned int class = rpc->ucodeEngDesc >> 8;
> +
> +	nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
> +		   class, rpc->libosPrintBufSize);
> +
> +	if (class != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
> +		nvkm_warn(subdev,
> +			  "received libos print from unknown class 0x%x\n",
> +			  class);
> +		return -ENOMSG;
> +	}
> +
> +	if (rpc->libosPrintBufSize > GSP_PAGE_SIZE) {
> +		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
> +			   rpc->libosPrintBufSize);
> +		return -E2BIG;
> +	}
> +
> +	memcpy(gsp->blob_pmu.data, rpc->libosPrintBuf, rpc->libosPrintBufSize);
> +
> +	return 0;
> +}
> +
> +/**
> + * r535_gsp_libos_debugfs_init - create logging debugfs entries
> + * @gsp: gsp pointer
> + *
> + * Create the debugfs entries.  This exposes the log buffers to
> + * userspace so that an external tool can parse it.
> + *
> + * The 'logpmu' contains exception dumps from the PMU. It is written via an
> + * RPC sent from GSP-RM and must be only 4KB.  We create it here because it's
> + * only useful if there is a debugfs entry to expose it.  If we get the PMU
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
> + * is called too late.  We really want to create these debugfs entries before
> + * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
> + * there could still be a log to capture.
> + */
> +static void r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
> +{
> +	struct dentry *dir, *dir_init;
> +	struct dentry *dir_intr = NULL, *dir_rm = NULL, *dir_pmu = NULL;
> +	struct device *dev = gsp->subdev.device->dev;
> +
> +	/* Each GPU has a subdir based on its device name, so find it */
> +	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +
> +	if (!drm_dev || !drm_dev->debugfs_root) {
> +		nvkm_error(&gsp->subdev, "could not find debugfs path\n");
> +		return;
> +	}
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
> +	r535_gsp_msg_ntfy_add(gsp, 0x0000100C, r535_gsp_msg_libos_print, gsp);

Please, don't add random magic values. Add a useful explanation instead that
also new contributors are able to make sense of.

> +
> +	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
> +
> +	if (keep_gsp_logging) {
> +		nvkm_warn(&gsp->subdev,
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
> +
>  static inline u64
>  r535_gsp_libos_id8(const char *name)
>  {
> @@ -2112,7 +2277,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
>   * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
>   *
>   * The physical address map for the log buffer is stored in the buffer
> - * itself, starting with offset 1. Offset 0 contains the "put" pointer.
> + * itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
> + * Initially, pp is equal to 0.  If the buffer has valid logging data in it,
> + * then pp points to index into the buffer where the next logging entry will
> + * be written.  Therefore, the logging data is valid if:
> + *   1 <= pp < sizeof(buffer)/sizeof(u64)
>   *
>   * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
>   * configured for a larger page size (e.g. 64K pages), we need to give
> @@ -2183,6 +2352,11 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
>  	args[3].size = gsp->rmargs.size;
>  	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
>  	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	r535_gsp_libos_debugfs_init(gsp);
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -2493,6 +2667,182 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
>  	gsp->fws.rm = NULL;
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +
> +struct r535_gsp_log {
> +	struct nvif_log log;
> +
> +	/*
> +	 * Logging buffers in debugfs.  The wrapper objects need to remain
> +	 * in memory until the dentry is deleted.
> +	 */
> +	struct dentry *debugfs_logging_dir;
> +	struct debugfs_blob_wrapper blob_init;
> +	struct debugfs_blob_wrapper blob_intr;
> +	struct debugfs_blob_wrapper blob_rm;
> +	struct debugfs_blob_wrapper blob_pmu;
> +};
> +
> +/**
> + * r535_debugfs_shutdown - delete GSP-RM logging buffers for one GPU
> + * @_log: nvif_log struct for this GPU
> + *
> + * Called when the driver is shutting down, to clean up the retained GSP-RM
> + * logging buffers.
> + */
> +static void r535_debugfs_shutdown(struct nvif_log *_log)
> +{
> +	struct r535_gsp_log *log = container_of(_log, struct r535_gsp_log, log);
> +
> +	debugfs_remove(log->debugfs_logging_dir);
> +
> +	kfree(log->blob_init.data);
> +	kfree(log->blob_intr.data);
> +	kfree(log->blob_rm.data);
> +	kfree(log->blob_pmu.data);
> +
> +	/* We also need to delete the list object */
> +	kfree(log);
> +}
> +
> +/**
> + * is_empty - return true if the logging buffer was never written to
> + * @b: blob wrapper with ->data field pointing to logging buffer
> + *
> + * The first 64-bit field of loginit, and logintr, and logrm is the 'put'
> + * pointer, and it is initialized to 0.  If the pointer is still 0 when

Double space. Also, what would 'put' point to in case it's non-zero? Is it a
pointer actually, or is it just some kind of counter?

> + * GSP-RM is shut down, that means that it was never written do, so it

"written to"

> + * can be ignored.
> + *
> + * This test also works for logpmu, even though it doesn't have a put pointer.
> + */
> +static bool is_empty(struct debugfs_blob_wrapper *b)
> +{
> +	u64 *put = b->data;
> +
> +	return *put == 0;
> +}
> +
> +static int r535_gsp_copy_log(struct dentry *parent,
> +			     const char *name,
> +			     struct debugfs_blob_wrapper *s,
> +			     struct debugfs_blob_wrapper *d)
> +{
> +	struct dentry *dir;
> +
> +	/* If the buffer is empty, just skip it. */
> +	if (is_empty(s))
> +		return 0;
> +
> +	d->data = kmemdup(s->data, s->size, GFP_KERNEL);
> +	if (!d->data)
> +		return -ENOMEM;
> +
> +	d->size = s->size;
> +	dir = debugfs_create_blob(name, 0444, parent, d);
> +	if (IS_ERR(dir)) {
> +		kfree(d->data);
> +		memset(d, 0, sizeof(*d));
> +		return PTR_ERR(dir);
> +	}
> +
> +	i_size_write(d_inode(dir), d->size);
> +
> +	return 0;
> +}
> +
> +/**
> + * r535_gsp_retain_logging - copy logging buffers to new debugfs root
> + * @gsp: gsp pointer
> + *
> + * If keep_gsp_logging is enabled, then we want to preserve the GSP-RM logging
> + * buffers and their debugfs entries, but all those objects would normally
> + * deleted if GSP-RM fails to load.  So we create a new debugfs root, allocate
> + * new buffers, then and copy contents of the logging buffers to them.
> + *
> + * These buffers and dentries are not associated with nvkm_gsp and will be
> + * retained until the driver unloads.
> + */
> +static void r535_gsp_retain_logging(struct nvkm_gsp *gsp)
> +{
> +	struct device *dev = gsp->subdev.device->dev;
> +	struct dentry *root, *dir;
> +	struct r535_gsp_log *log;
> +	int ret;
> +
> +	/* If we were told not to keep logs, then don't. */
> +	if (!keep_gsp_logging)
> +		return;
> +
> +	/* Check to make sure at least one buffer has data. */
> +	if (is_empty(&gsp->blob_init) && is_empty(&gsp->blob_intr) &&
> +	    is_empty(&gsp->blob_rm) && is_empty(&gsp->blob_rm)) {
> +		nvkm_warn(&gsp->subdev, "all logging buffers are empty\n");
> +		return;
> +	}
> +
> +	/* Find the 'dri' root debugfs entry. Every GPU has a dentry under it */
> +	root = debugfs_lookup("dri", NULL);
> +	if (IS_ERR(root)) {
> +		/* No debugfs, or no root dentry for DRM */
> +		nvkm_warn(&gsp->subdev, "could not find debugfs dri root\n");
> +		return;
> +	}
> +
> +	/* Create a new debugfs root. It has the same name as the old one */
> +	dir = debugfs_create_dir(dev_name(dev), root);
> +	dput(root);
> +	if (IS_ERR(dir)) {
> +		nvkm_error(&gsp->subdev,
> +			   "failed to create %s debugfs entry\n", dev_name(dev));
> +		return;
> +	}
> +
> +	log = kzalloc(sizeof(*log), GFP_KERNEL);
> +	if (!log) {
> +		debugfs_remove(dir);
> +		return;
> +	}
> +
> +	ret = r535_gsp_copy_log(dir, "loginit", &gsp->blob_init, &log->blob_init);
> +	if (ret)
> +		goto error;
> +
> +	ret = r535_gsp_copy_log(dir, "logintr", &gsp->blob_intr, &log->blob_intr);
> +	if (ret)
> +		goto error;
> +
> +	ret = r535_gsp_copy_log(dir, "logrm", &gsp->blob_rm, &log->blob_rm);
> +	if (ret)
> +		goto error;
> +
> +	ret = r535_gsp_copy_log(dir, "logpmu", &gsp->blob_pmu, &log->blob_pmu);
> +	if (ret)
> +		goto error;
> +
> +	log->debugfs_logging_dir = dir;
> +	log->log.shutdown = r535_debugfs_shutdown;
> +	list_add(&log->log.head, &gsp_logs);
> +
> +	nvkm_warn(&gsp->subdev,
> +		  "logging buffers migrated to /sys/kernel/debug/dri/%s\n",
> +		  dev_name(dev));
> +
> +	return;
> +
> +error:
> +	nvkm_warn(&gsp->subdev, "failed to migrate logging buffers\n");
> +
> +	debugfs_remove(log->debugfs_logging_dir);
> +	kfree(log->blob_init.data);
> +	kfree(log->blob_intr.data);
> +	kfree(log->blob_rm.data);
> +	kfree(log->blob_pmu.data);
> +	kfree(log);
> +}
> +
> +#endif
> +
>  void
>  r535_gsp_dtor(struct nvkm_gsp *gsp)
>  {
> @@ -2514,6 +2864,14 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>  	nvkm_gsp_mem_dtor(&gsp->rmargs);
>  	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
>  	nvkm_gsp_mem_dtor(&gsp->shm.mem);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	r535_gsp_retain_logging(gsp);
> +
> +	kfree(gsp->blob_pmu.data);
> +	gsp->blob_pmu.data = NULL;

Please move this to r535_gsp_libos_debugfs_fini() to make it a bit more obvious
why this needs to be cleaned up here.

> +#endif
> +
>  	nvkm_gsp_mem_dtor(&gsp->loginit);
>  	nvkm_gsp_mem_dtor(&gsp->logintr);
>  	nvkm_gsp_mem_dtor(&gsp->logrm);
> -- 
> 2.34.1
> 

