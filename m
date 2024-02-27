Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10485869768
	for <lists+nouveau@lfdr.de>; Tue, 27 Feb 2024 15:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3227410E4D6;
	Tue, 27 Feb 2024 14:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YgswInB4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9069C10E3E4
 for <nouveau@lists.freedesktop.org>; Tue, 27 Feb 2024 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709043657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIRuA1+ebbFRV7KLX3S7RlnuwFLYOwDRsft03BC5+RU=;
 b=YgswInB4m9Yz7sTfolBx30Uo8eCFVf9duktG+54SWL9ajvM/UIWdBd6c3Nl7+cNIckrNEW
 2H6Y91Ne9o+lioDcvMcK5Hz0eP1KTiZR+ebIGqomZy0XZG6c4DIBwFTH6QC18H2B343vFV
 cWSQdxaeJfUpHC+Nxf5qdn6RAtoGC9c=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-4Cz53fFrMh-Fd-_h0uY3NA-1; Tue, 27 Feb 2024 09:20:55 -0500
X-MC-Unique: 4Cz53fFrMh-Fd-_h0uY3NA-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-68ffddbb60eso30588756d6.0
 for <nouveau@lists.freedesktop.org>; Tue, 27 Feb 2024 06:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709043655; x=1709648455;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fIRuA1+ebbFRV7KLX3S7RlnuwFLYOwDRsft03BC5+RU=;
 b=EJ+9lBLrTPosNVJBbyOi9u3u0eAXCSlUgrhdAtQwqGMpvhCNaV2JTt9XbZerpJSVId
 808LTuh6GRjOheT8qRsuUrbBfu7r5WetTdVQ7UPD/NRxknwo2mSd6J1f6e2mO6SzOCgX
 VGWsNy3qUlTM0wrY9J1tCyUZkCEYTPE+CFfJaVS2vg6xyiSRGU/vi8TWLuY0w7LajEiP
 jz7IzrBrEoXYQdNna01eDEPYTbnWw4fAnO8hTzw4sHCuCwN11B13C1XCDZ66JrgauPsD
 sDHSfH9YuS8kDrywWC5nRqIEgHGbTS1Cut8Q1/SdbCR9EYtE+ARGi8ClfgyzACGloIfP
 cTzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOeCK+uQbKOO1L9+pcaENXK1kPQGv4nZvjtSFlMjWLPiJbiD0kaoLjI6dW6hL6qU1bF/NqZtKCCh9dqp8z3PTrMx/A/URqCEaQhcZHdQ==
X-Gm-Message-State: AOJu0YyZFS4z7RH8+O7id+LzXdlJcrcnXYAFaLhx4I5mk6sMWPmyssw/
 E2neUEFYAJLRB+/nn72JfoowXOy1lF2UcXUUxzcmxhvwO64KQfcuZpW57dRpi4YY78eGnpxe7N8
 p9TgtKZ56YsBWHiGqaVx4U5evsH9U98Iqmng1s/wCwCJjseVMriLxStPKeiwf1AM=
X-Received: by 2002:a05:6214:2483:b0:68f:e779:716c with SMTP id
 gi3-20020a056214248300b0068fe779716cmr2309767qvb.63.1709043655077; 
 Tue, 27 Feb 2024 06:20:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTj3MzhQWea6Wm1ib5OWjVCSH4aWi3rd2XwPHxsYhL1wctSmWhDUIx5k3OVrKaLO51D2LPQg==
X-Received: by 2002:a05:6214:2483:b0:68f:e779:716c with SMTP id
 gi3-20020a056214248300b0068fe779716cmr2309741qvb.63.1709043654592; 
 Tue, 27 Feb 2024 06:20:54 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 lx12-20020a0562145f0c00b0068fdc55ec7dsm4140163qvb.68.2024.02.27.06.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 06:20:54 -0800 (PST)
Message-ID: <510003da-0641-4dea-84ee-3b686644583c@redhat.com>
Date: Tue, 27 Feb 2024 15:20:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v4][RFC] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
To: Timur Tabi <ttabi@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
References: <20240226210245.4022456-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240226210245.4022456-1-ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

Hi Timur,

thanks for re-working this patch!

On 2/26/24 22:02, Timur Tabi wrote:
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

Typo in "debugfs".

> driver is unloaded.
> 
> The buffers are exposed via debugfs.  The debugfs entries must be
> created before GSP-RM is started, to ensure that they are available
> during GSP-RM initialization.

Generally agree. Just wondering why you are pointing this out
explicitly.

What if we'd create them directly after GSP init? Is there anything
subtle to that?

> 
> If GSP-RM fails to initialize, then Nouveau immediately shuts down
> the GSP interface.  This would normally also deallocate the logging
> buffers, thereby preventing the user from capturing the debug logs.
> To avoid this, use the keep-gsp-logging command line parameter.  If

"introduce the keep-gsp-logging command line parameter"

> specified, and if at least one logging buffer has contents, then
> Nouveau will migrate these buffers into new debugfs entries that are
> retained until the driver unloads.
> 
> An end-user can capture the logs using the following commands:
> 
>      cp /sys/kernel/debug/dri/<path>/loginit loginit
>      cp /sys/kernel/debug/dri/<path>/logrm logrm
>      cp /sys/kernel/debug/dri/<path>/logintr logintr
>      cp /sys/kernel/debug/dri/<path>/logpmu logpmu
> 
> where <path> is the PCI ID of the GPU (e.g. 0000:65:00.0).
> 
> Since LOGPMU is not needed for normal GSP-RM operation, it is only
> created if debugfs is available.  Otherwise, the
> NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

The commit message and some DOC comments contains trailing spaces 
between words.

> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  25 ++
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  13 +
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 340 +++++++++++++++++-
>   3 files changed, 377 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index a9be0d86e412..e2f8ff58d408 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -5,6 +5,8 @@
>   #include <core/falcon.h>
>   #include <core/firmware.h>
>   
> +#include <linux/debugfs.h>
> +
>   #define GSP_PAGE_SHIFT 12
>   #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
>   
> @@ -27,6 +29,20 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 fn, void *repv, u32 repc);
>   struct nvkm_gsp_event;
>   typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 repc);
>   
> +/**
> + * nvkm_gsp_log - structure for tracking GSP-RM logging buffers
> + * @head: list head
> + * @shutdown: pointer to function to call to clean up
> + *
> + * One of these is created for each GPU upon GSP shutdown if the
> + * "keep_gsp_logging" command-line parameter is specified.  This is used to
> + * track the alternative debugfs entries for the GSP-RM logs.
> + */
> +struct nvkm_gsp_log {

Maybe better to name this structure nvif_log instead and move it to
include/nvif/log.h for consistency. It's not really limited GSP,
although I don't see what else it could ever be used for.

> +	struct list_head head;
> +	void (*shutdown)(struct nvkm_gsp_log *);
> +};
> +
>   struct nvkm_gsp {
>   	const struct nvkm_gsp_func *func;
>   	struct nvkm_subdev subdev;
> @@ -218,6 +234,15 @@ struct nvkm_gsp {
>   
>   	/* The size of the registry RPC */
>   	size_t registry_rpc_size;
> +
> +	/*
> +	 * Logging buffers in debugfs.  The wrapper objects need to remain
> +	 * in memory until the dentry is deleted.
> +	 */
> +	struct debugfs_blob_wrapper blob_init;
> +	struct debugfs_blob_wrapper blob_intr;
> +	struct debugfs_blob_wrapper blob_rm;
> +	struct debugfs_blob_wrapper blob_pmu;
>   };
>   
>   static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index a947e1d5f309..a258e02a16af 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -113,6 +113,10 @@ static struct drm_driver driver_stub;
>   static struct drm_driver driver_pci;
>   static struct drm_driver driver_platform;
>   
> +#ifdef CONFIG_DEBUG_FS
> +LIST_HEAD(gsp_logs);
> +#endif
> +
>   static u64
>   nouveau_pci_name(struct pci_dev *pdev)
>   {
> @@ -1446,6 +1450,15 @@ nouveau_drm_exit(void)
>   #endif
>   	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
>   		mmu_notifier_synchronize();
> +
> +#ifdef CONFIG_DEBUG_FS
> +	if (!list_empty(&gsp_logs)) {
> +		struct nvkm_gsp_log *log;
> +
> +		list_for_each_entry(log, &gsp_logs, head)
> +			log->shutdown(log);
> +	}
> +#endif
>   }
>   
>   module_init(nouveau_drm_init);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 1eb1bc5df39a..f69afd5ea263 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -26,6 +26,7 @@
>   #include <subdev/vfn.h>
>   #include <engine/fifo/chan.h>
>   #include <engine/sec2.h>
> +#include <drm/drm_device.h>
>   
>   #include <nvfw/fw.h>
>   
> @@ -2077,6 +2078,149 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
>   	return 0;
>   }
>   
> +#ifdef CONFIG_DEBUG_FS
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
> + */
> +static int r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
> +{
> +	struct nvkm_gsp *gsp = priv;
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct {
> +		u32 ucodeEngDesc;
> +		u32 libosPrintBufSize;
> +		u8 libosPrintBuf[];
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
> +	if (rpc->libosPrintBufSize > GSP_PAGE_SIZE) {
> +		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
> +			   rpc->libosPrintBufSize);
> +		return -E2BIG;
> +
> +	}
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
> +	struct dentry *dir, *dir_init, *dir_intr, *dir_rm, *dir_pmu;
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

If we hit this, dir_intr and dir_rm are uninitialized.

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
> +
> +	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
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
>   static inline u64
>   r535_gsp_libos_id8(const char *name)
>   {
> @@ -2127,7 +2271,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
>    * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
>    *
>    * The physical address map for the log buffer is stored in the buffer
> - * itself, starting with offset 1. Offset 0 contains the "put" pointer.
> + * itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
> + * Initially, pp is equal to 0.  If the buffer has valid logging data in it,
> + * then pp points to index into the buffer where the next logging entry will
> + * be written.  Therefore, the logging data is valid if:
> + *   1 <= pp < sizeof(buffer)/sizeof(u64)
>    *
>    * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
>    * configured for a larger page size (e.g. 64K pages), we need to give
> @@ -2198,6 +2346,11 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
>   	args[3].size = gsp->rmargs.size;
>   	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
>   	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	r535_gsp_libos_debugfs_init(gsp);
> +#endif
> +
>   	return 0;
>   }
>   
> @@ -2483,6 +2636,182 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
>   	gsp->fws.rm = NULL;
>   }
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

What if we start supporting multiple firmware versions? I think we
should move this module_param() either into nouveau_drm.c and pipe it
through nvkm_device_ctor() or move to nvkm/engine/device/base.c and add
it to struct nvkm_device there.

> +
> +// FIXME: This should be in a header file
> +extern struct list_head gsp_logs;

What about include/nvif/log.h? :-)

> +
> +struct r535_gsp_log {

Guess we need this abstraction, since we expect that a different
firmware version might change the available log buffers?

> +	struct nvkm_gsp_log log;
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
> +static void r535_debugfs_shutdown(struct nvkm_gsp_log *_log)
> +{
> +	struct r535_gsp_log *log = container_of(_log, struct r535_gsp_log, log);
> +
> +	debugfs_remove(log->debugfs_logging_dir);
> +
> +	kfree(log->blob_init.data);
> +	kfree(log->blob_intr.data);
> +	kfree(log->blob_rm.data);
> +	kfree(log->blob_pmu.data);
> +}
> +
> +/**
> + * is_empty - return true if the logging buffer was never written to
> + * @b: blob wrapper with ->data field pointing to logging buffer
> + *
> + * The first 64-bit field of loginit, and logintr, and logrm is the 'put'
> + * pointer, and it is initialized to 0.  If the pointer is still 0 when
> + * GSP-RM is shut down, that means that it was never written do, so it
> + * can be ignored.
> + *
> + * This test also works for logpmu, even though it doesn't have a put pointer.
> + */
> +static bool is_empty(struct debugfs_blob_wrapper *b)
> +{
> +	uint64_t *put = b->data;

Better use u64.

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

Maybe print a warning as well?

> +		return;
> +	}
> +
> +	/* Create a new debugfs root. It has the same name as the old one */
> +	dir = debugfs_create_dir(dev_name(dev), root);
> +	dput(root);
> +	if (IS_ERR(dir)) {
> +		nvkm_error(&gsp->subdev,
> +			"failed to create %s debugfs entry\n", dev_name(dev));
> +		return;
> +	}
> +
> +	log = devm_kzalloc(dev, sizeof(*log), GFP_KERNEL);

What if the PCI device is removed before the module is removed?

I think we should just free it in nouveau_drm_exit(). As long as
we keep the convention that struct nvif_log is the first member we 
should be fine. Otherwise we could also just add ::free() callback,
like we have ::shutdown(), which seems to be safer.

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
>   void
>   r535_gsp_dtor(struct nvkm_gsp *gsp)
>   {
> @@ -2502,6 +2831,15 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>   	r535_gsp_dtor_fws(gsp);
>   
>   	nvkm_gsp_mem_dtor(&gsp->shm.mem);
> +
> +#ifdef CONFIG_DEBUG_FS
> +	if (keep_gsp_logging)
> +		r535_gsp_retain_logging(gsp);
> +#endif
> +
> +	kfree(gsp->blob_pmu.data);
> +	gsp->blob_pmu.data = NULL;
> +
>   	nvkm_gsp_mem_dtor(&gsp->loginit);
>   	nvkm_gsp_mem_dtor(&gsp->logintr);
>   	nvkm_gsp_mem_dtor(&gsp->logrm);

