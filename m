Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9BF84AB1E
	for <lists+nouveau@lfdr.de>; Tue,  6 Feb 2024 01:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927B8112716;
	Tue,  6 Feb 2024 00:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="amm1/94t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EAB112716
 for <nouveau@lists.freedesktop.org>; Tue,  6 Feb 2024 00:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707179769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkF8YMbmE7HJm0lmbv9iWu+MU+EB3/B0iyu7JNrLlaI=;
 b=amm1/94tINTQ1TLFZxFre9PMeptAbMGA/tiWb9Edm2ywotfOLMOkWUcZdUtG+A27g94TJR
 g1D1xhFjXS3iednU44RWVnd7U7q3AY71boOUdkQTbpcDj5DmsChNaTtqaigbufi1adqg16
 BnZ0AVdTtBoTUOb67PYBg6nHKFUsCHE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-vmqJe8ASOXKRtbrLLN5cZw-1; Mon, 05 Feb 2024 19:36:08 -0500
X-MC-Unique: vmqJe8ASOXKRtbrLLN5cZw-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-42c273bfb77so15316381cf.0
 for <nouveau@lists.freedesktop.org>; Mon, 05 Feb 2024 16:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707179768; x=1707784568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkF8YMbmE7HJm0lmbv9iWu+MU+EB3/B0iyu7JNrLlaI=;
 b=wkLmQfDkodiuzqexjwYnvW8xUqys1Ri3H/xUC8AkClymVqAH7ZO7hQUmHfmDko85nv
 d8Nf1LNzulIFNvy6o0IWex4v/0EZmD212Ug9sRm2F82hARjgxt1nv4tpRHG51PAt9kNX
 O3cWG1Zrh3dDpt7plGFAFQSUm4+Dhr9ZFcO1UQ4S8ygFBERHlDeZI2OLhViqM7SF9FNm
 +iF9VKx9Zn7B6i7ZQ9U4n0cad9MAzl4hlJ7XPIDLknGcQtXooxwiqlVQDHNMtB3I1EQ5
 GZC3YUEsE51AEF+leefCPXaMQj2g7EFmTSAIsEphRDpftjkagiPA3ASV8ZTxnkqbKjRo
 R2ww==
X-Gm-Message-State: AOJu0YyYm3xjHDL3pFg5Fv7u9csBv6t5UjPju06a7U64qfn3PmXuq/Mw
 VO3iRdSvMjhbTWNnsu8rZCM4GR2geUg17iaO2skRGHVKg1FDwCfNqP1dM2NEFFGv3Pnh7Oxva9j
 pLeoYtrCFdXQpEOeZltxWI4krPcZ5nL2SYuBDWLbFjsahZLEsUMiXST7Ok9jhQgtGMY+vlJ9fZe
 7zz4d/9VhcGJ2z3DHI5LCkP9wTjcF6xmBPe4Sx1w==
X-Received: by 2002:ac8:6ede:0:b0:42c:2645:53aa with SMTP id
 f30-20020ac86ede000000b0042c264553aamr689778qtv.38.1707179767697; 
 Mon, 05 Feb 2024 16:36:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiuoDMJ7r97J5UhIejfhNBuaZyqLUSXCaV7L9LuIilbOxnGGI3Igbz+fhq1Og1E+ii6ZulIkXOf5ys7YN5Bv4=
X-Received: by 2002:ac8:6ede:0:b0:42c:2645:53aa with SMTP id
 f30-20020ac86ede000000b0042c264553aamr689769qtv.38.1707179767322; Mon, 05 Feb
 2024 16:36:07 -0800 (PST)
MIME-Version: 1.0
References: <20240205214452.2580940-1-ttabi@nvidia.com>
In-Reply-To: <20240205214452.2580940-1-ttabi@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 6 Feb 2024 10:35:55 +1000
Message-ID: <CAMwc25r0zr4orsFKRO4rVNMrNNQh5PxWze9b3xG3HvXuM1CpcQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: expose GSP-RM logging buffers via debugfs
To: Timur Tabi <ttabi@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 6, 2024 at 7:45=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote:
>
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
> The buffers are exposed via debugfs.  The debugfs entries must be
> created before GSP-RM is started, to ensure that they are available
> during GSP-RM initialization.
>
> If GSP-RM fails to initialize, then Nouveau immediately shuts down
> the GSP interface.  This would normally also deallocate the logging
> buffers, thereby preventing the user from capturing the debug logs.
> To avoid this, the keep-gsp-logging command line parameter can be
> specified.  This parmater is marked as *unsafe* (thereby taining the
> kernel) because the DMA buffer and debugfs entries are never
> deallocated, even if the driver unloads.  This gives the user the
> time to capture the logs, but it also means that resources can only
> be recovered by a reboot.
>
> An end-user can capture the logs using the following commands:
>
>     cp /sys/kernel/debug/nouveau/loginit loginit
>     cp /sys/kernel/debug/nouveau/logrm logrm
>     cp /sys/kernel/debug/nouveau/logintr logintr
>     cp /sys/kernel/debug/nouveau/logpmu logpmu

If we have 2 GPUs won't this conflict on driver load?

Do we need to at least make subdirs or if two early in boot to have
ids, use the pci path?

Dave.

>
> Since LOGPMU is not needed for GSP-RM initialization, it is only
> created if debugfs is available.  Otherwise, the
> NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  12 ++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 182 +++++++++++++++++-
>  2 files changed, 190 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 3fbc57b16a05..999e3be3f38c 100644
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
> @@ -217,6 +219,16 @@ struct nvkm_gsp {
>
>         /* The size of the registry RPC */
>         size_t registry_rpc_size;
> +
> +       /*
> +        * Logging buffers in debugfs.  The wrapper objects need to remai=
n
> +        * in memory until the dentry is deleted.
> +        */
> +       struct dentry *debugfs_logging_dir;
> +       struct debugfs_blob_wrapper blob_init;
> +       struct debugfs_blob_wrapper blob_intr;
> +       struct debugfs_blob_wrapper blob_rm;
> +       struct debugfs_blob_wrapper blob_pmu;
>  };
>
>  static inline bool
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index d065389e3618..8dc2729f5321 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1972,6 +1972,151 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool r=
esume)
>         return 0;
>  }
>
> +#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU         0xf3d722
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
> +static int r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 =
repc)
> +{
> +       struct nvkm_gsp *gsp =3D priv;
> +       struct nvkm_subdev *subdev =3D &gsp->subdev;
> +       struct {
> +               u32 ucodeEngDesc;
> +               u32 libosPrintBufSize;
> +               u8 libosPrintBuf[];
> +       } *rpc =3D repv;
> +       unsigned int data =3D rpc->ucodeEngDesc >> 8;
> +
> +       nvkm_debug(subdev, "received libos print from class 0x%x for %u b=
ytes\n",
> +                  data, rpc->libosPrintBufSize);
> +
> +       if (data !=3D NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
> +               nvkm_warn(subdev,
> +                         "received libos print from unknown class 0x%x\n=
",
> +                         data);
> +               return -ENOMSG;
> +       }
> +       if (rpc->libosPrintBufSize > GSP_PAGE_SIZE) {
> +               nvkm_error(subdev, "libos print is too large (%u bytes)\n=
",
> +                          rpc->libosPrintBufSize);
> +               return -E2BIG;
> +
> +       }
> +       memcpy(gsp->blob_pmu.data, rpc->libosPrintBuf, rpc->libosPrintBuf=
Size);
> +
> +       return 0;
> +}
> +
> +/**
> + * r535_gsp_libos_debugfs_init - create logging debugfs entries
> + *
> + * Create the debugfs entries.  This exposes the log buffers to
> + * userspace so that an external tool can parse it.
> + *
> + * The 'logpmu' contains exception dumps from the PMU. It is written via=
 an
> + * RPC sent from GSP-RM and must be only 4KB.  We create it here because=
 it's
> + * only useful if there is a debugfs entry to expose it.  If we get the =
PMU
> + * logging RPC and there is no debugfs entry, the RPC is just ignored.
> + *
> + * The blob_init, blob_rm, and blob_pmu objects can't be transient
> + * because debugfs_create_blob doesn't copy them.
> + *
> + * NOTE: OpenRM loads the logging elf image and prints the log messages
> + * in real-time. We may add that capability in the future, but that
> + * requires loading an ELF images that are not distributed with the driv=
er,
> + * and adding the parsing code to Nouveau.
> + *
> + * Ideally, this should be part of nouveau_debugfs_init(), but that func=
tion
> + * is called much too late.  We really want to create these debugfs entr=
ies
> + * before r535_gsp_booter_load() is called, so that if GSP-RM fails to
> + * initialize, there could still be a log to capture.
> + *
> + * If the unsafe command line pararameter 'keep-gsp-logging' is specifie=
d,
> + * then the logging buffer and debugfs entries will be retained when the
> + * driver shuts down.  This is necessary to debug initialization failure=
s,
> + * because otherwise the buffers will disappear before the logs can be
> + * captured.
> + */
> +static void r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
> +{
> +       struct dentry *dir_init, *dir_intr, *dir_rm, *dir_pmu;
> +       struct dentry *dir;
> +
> +       dir =3D debugfs_create_dir("nouveau", NULL);
> +       if (IS_ERR(dir)) {
> +               /* No debugfs */
> +               return;
> +       }
> +
> +       if (IS_ERR_OR_NULL(dir)) {
> +               nvkm_error(&gsp->subdev,
> +                          "error %li creating /sys/kernel/debug/nouveau/=
\n", PTR_ERR(dir));
> +               return;
> +       }
> +
> +       gsp->blob_init.data =3D gsp->loginit.data;
> +       gsp->blob_init.size =3D gsp->loginit.size;
> +       dir_init =3D debugfs_create_blob("loginit", 0444, dir, &gsp->blob=
_init);
> +       if (IS_ERR_OR_NULL(dir_init)) {
> +               nvkm_error(&gsp->subdev,
> +                          "failed to create /sys/kernel/debug/nouveau/%s=
\n", "loginit");
> +               debugfs_remove(dir);
> +               return;
> +       }
> +
> +       gsp->blob_intr.data =3D gsp->logintr.data;
> +       gsp->blob_intr.size =3D gsp->logintr.size;
> +       dir_intr =3D debugfs_create_blob("logintr", 0444, dir, &gsp->blob=
_intr);
> +       if (IS_ERR_OR_NULL(dir_intr)) {
> +               nvkm_error(&gsp->subdev,
> +                          "failed to create /sys/kernel/debug/nouveau/%s=
\n", "logintr");
> +               debugfs_remove(dir);
> +               return;
> +       }
> +
> +       gsp->blob_rm.data =3D gsp->logrm.data;
> +       gsp->blob_rm.size =3D gsp->logrm.size;
> +       dir_rm =3D debugfs_create_blob("logrm", 0444, dir, &gsp->blob_rm)=
;
> +       if (IS_ERR_OR_NULL(dir_rm)) {
> +               nvkm_error(&gsp->subdev,
> +                          "failed to create /sys/kernel/debug/nouveau/%s=
\n", "logrm");
> +               debugfs_remove(dir);
> +               return;
> +       }
> +
> +       /*
> +        * Since the PMU buffer is copied from an RPC, it doesn't need to=
 be
> +        * a DMA buffer.
> +        */
> +       gsp->blob_pmu.size =3D GSP_PAGE_SIZE;
> +       gsp->blob_pmu.data =3D kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
> +       if (!gsp->blob_pmu.data) {
> +               debugfs_remove(dir);
> +               return;
> +       }
> +
> +       dir_pmu =3D debugfs_create_blob("logpmu", 0444, dir, &gsp->blob_p=
mu);
> +       if (IS_ERR_OR_NULL(dir_pmu)) {
> +               nvkm_error(&gsp->subdev,
> +                          "failed to create /sys/kernel/debug/nouveau/%s=
\n", "logpmu");
> +               kfree(gsp->blob_pmu.data);
> +               debugfs_remove(dir);
> +               return;
> +       }
> +
> +       r535_gsp_msg_ntfy_add(gsp, 0x0000100C, r535_gsp_msg_libos_print, =
gsp);
> +       gsp->debugfs_logging_dir =3D dir;
> +
> +       nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\=
n");
> +}
> +
>  static inline u64
>  r535_gsp_libos_id8(const char *name)
>  {
> @@ -2021,7 +2166,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t=
 addr, size_t size)
>   * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZ=
E.
>   *
>   * The physical address map for the log buffer is stored in the buffer
> - * itself, starting with offset 1. Offset 0 contains the "put" pointer.
> + * itself, starting with offset 1. Offset 0 contains the "put" pointer (=
pp).
> + * Initially, pp is equal to 0.  If the buffer has valid logging data in=
 it,
> + * then pp points to index into the buffer where the next logging entry =
will
> + * be written.  Therefore, the logging data is valid if:
> + *   1 <=3D pp < sizeof(buffer)/sizeof(u64)
>   *
>   * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the ker=
nel is
>   * configured for a larger page size (e.g. 64K pages), we need to give
> @@ -2092,6 +2241,9 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
>         args[3].size =3D gsp->rmargs.size;
>         args[3].kind =3D LIBOS_MEMORY_REGION_CONTIGUOUS;
>         args[3].loc  =3D LIBOS_MEMORY_REGION_LOC_SYSMEM;
> +
> +       r535_gsp_libos_debugfs_init(gsp);
> +
>         return 0;
>  }
>
> @@ -2373,6 +2525,18 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
>         gsp->fws.rm =3D NULL;
>  }
>
> +/*
> + * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
> + * logging debugfs entries will be deleted, and it will not be possible =
to
> + * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
> + * not to free these resources, even if the driver is unloading.  In thi=
s
> + * case, the only recovery is a reboot.
> + */
> +static bool keep_gsp_logging;
> +module_param_unsafe(keep_gsp_logging, bool, 0600);
> +MODULE_PARM_DESC(keep_gsp_logging,
> +                "Do not remove the GSP-RM logging debugfs entries upon e=
xit");
> +
>  void
>  r535_gsp_dtor(struct nvkm_gsp *gsp)
>  {
> @@ -2392,9 +2556,19 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>         r535_gsp_dtor_fws(gsp);
>
>         nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
> -       nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
> -       nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
> -       nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
> +
> +       if (keep_gsp_logging && gsp->debugfs_logging_dir)
> +               nvkm_warn(&gsp->subdev,
> +                       "GSP-RM logging buffers retained, reboot required=
 to recover\n");
> +       else {
> +               debugfs_remove(gsp->debugfs_logging_dir);
> +               gsp->debugfs_logging_dir =3D NULL;
> +
> +               kfree(gsp->blob_pmu.data);
> +               nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
> +               nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
> +               nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
> +       }
>  }
>
>  int
> --
> 2.34.1
>

