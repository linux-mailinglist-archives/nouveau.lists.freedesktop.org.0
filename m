Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC817A54AF
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 23:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CA510E008;
	Mon, 18 Sep 2023 21:00:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3460F10E008
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 21:00:25 +0000 (UTC)
Message-ID: <0906d07c-bdf5-37f5-d02c-025f329ea8b5@dakr.org>
Date: Mon, 18 Sep 2023 23:00:12 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-5-skeggsb@gmail.com>
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20230918202149.4343-5-skeggsb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 04/44] drm/nouveau/gsp: prepare for GSP-RM
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/18/23 22:21, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> - move TOP after GSP, so we can disable TOP if GSP is in use
> - provide plumbing to support falcon-only and GSP-RM paths
> - provide a method for subdevs to detect GSP-RM paths
> - split tu102/tu116/ga100 paths from gv100, which can't support GSP-RM
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>   .../drm/nouveau/include/nvkm/core/layout.h    |  2 +-
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  9 ++++
>   .../gpu/drm/nouveau/nvkm/engine/device/base.c | 11 +++--
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |  3 ++
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    | 47 +++++++++++++++++--
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   | 35 ++++++++++++++
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  8 +---
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c   |  4 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    | 17 +++++--
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 35 ++++++++++++++
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   | 35 ++++++++++++++
>   11 files changed, 182 insertions(+), 24 deletions(-)
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
> index 6af0352a4873..30c17db483cb 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: MIT */
> -NVKM_LAYOUT_ONCE(NVKM_SUBDEV_TOP     , struct nvkm_top     ,      top)
>   NVKM_LAYOUT_ONCE(NVKM_SUBDEV_GSP     , struct nvkm_gsp     ,      gsp)
> +NVKM_LAYOUT_ONCE(NVKM_SUBDEV_TOP     , struct nvkm_top     ,      top)
>   NVKM_LAYOUT_ONCE(NVKM_SUBDEV_VFN     , struct nvkm_vfn     ,      vfn)
>   NVKM_LAYOUT_ONCE(NVKM_SUBDEV_PCI     , struct nvkm_pci     ,      pci)
>   NVKM_LAYOUT_ONCE(NVKM_SUBDEV_VBIOS   , struct nvkm_bios    ,     bios)
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 72619d7df73e..688270f62e09 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -11,6 +11,15 @@ struct nvkm_gsp {
>   	struct nvkm_falcon falcon;
>   };
>   
> +static inline bool
> +nvkm_gsp_rm(struct nvkm_gsp *gsp)
> +{
> +	return false;
> +}
> +
>   int gv100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
> +int tu102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
> +int tu116_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
> +int ga100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
>   int ga102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 1c81e5b34d29..395702870872 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2408,7 +2408,7 @@ nv162_chipset = {
>   	.fb       = { 0x00000001, tu102_fb_new },
>   	.fuse     = { 0x00000001, gm107_fuse_new },
>   	.gpio     = { 0x00000001, gk104_gpio_new },
> -	.gsp      = { 0x00000001, gv100_gsp_new },
> +	.gsp      = { 0x00000001, tu102_gsp_new },
>   	.i2c      = { 0x00000001, gm200_i2c_new },
>   	.imem     = { 0x00000001, nv50_instmem_new },
>   	.ltc      = { 0x00000001, gp102_ltc_new },
> @@ -2443,7 +2443,7 @@ nv164_chipset = {
>   	.fb       = { 0x00000001, tu102_fb_new },
>   	.fuse     = { 0x00000001, gm107_fuse_new },
>   	.gpio     = { 0x00000001, gk104_gpio_new },
> -	.gsp      = { 0x00000001, gv100_gsp_new },
> +	.gsp      = { 0x00000001, tu102_gsp_new },
>   	.i2c      = { 0x00000001, gm200_i2c_new },
>   	.imem     = { 0x00000001, nv50_instmem_new },
>   	.ltc      = { 0x00000001, gp102_ltc_new },
> @@ -2478,7 +2478,7 @@ nv166_chipset = {
>   	.fb       = { 0x00000001, tu102_fb_new },
>   	.fuse     = { 0x00000001, gm107_fuse_new },
>   	.gpio     = { 0x00000001, gk104_gpio_new },
> -	.gsp      = { 0x00000001, gv100_gsp_new },
> +	.gsp      = { 0x00000001, tu102_gsp_new },
>   	.i2c      = { 0x00000001, gm200_i2c_new },
>   	.imem     = { 0x00000001, nv50_instmem_new },
>   	.ltc      = { 0x00000001, gp102_ltc_new },
> @@ -2513,7 +2513,7 @@ nv167_chipset = {
>   	.fb       = { 0x00000001, tu102_fb_new },
>   	.fuse     = { 0x00000001, gm107_fuse_new },
>   	.gpio     = { 0x00000001, gk104_gpio_new },
> -	.gsp      = { 0x00000001, gv100_gsp_new },
> +	.gsp      = { 0x00000001, tu116_gsp_new },
>   	.i2c      = { 0x00000001, gm200_i2c_new },
>   	.imem     = { 0x00000001, nv50_instmem_new },
>   	.ltc      = { 0x00000001, gp102_ltc_new },
> @@ -2548,7 +2548,7 @@ nv168_chipset = {
>   	.fb       = { 0x00000001, tu102_fb_new },
>   	.fuse     = { 0x00000001, gm107_fuse_new },
>   	.gpio     = { 0x00000001, gk104_gpio_new },
> -	.gsp      = { 0x00000001, gv100_gsp_new },
> +	.gsp      = { 0x00000001, tu116_gsp_new },
>   	.i2c      = { 0x00000001, gm200_i2c_new },
>   	.imem     = { 0x00000001, nv50_instmem_new },
>   	.ltc      = { 0x00000001, gp102_ltc_new },
> @@ -2580,6 +2580,7 @@ nv170_chipset = {
>   	.fault    = { 0x00000001, tu102_fault_new },
>   	.fb       = { 0x00000001, ga100_fb_new },
>   	.gpio     = { 0x00000001, gk104_gpio_new },
> +	.gsp      = { 0x00000001, ga100_gsp_new },
>   	.i2c      = { 0x00000001, gm200_i2c_new },
>   	.imem     = { 0x00000001, nv50_instmem_new },
>   	.mc       = { 0x00000001, ga100_mc_new },
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
> index 7f61a1ed158b..4b497ad9bb91 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
> @@ -1,4 +1,7 @@
>   # SPDX-License-Identifier: MIT
>   nvkm-y += nvkm/subdev/gsp/base.o
>   nvkm-y += nvkm/subdev/gsp/gv100.o
> +nvkm-y += nvkm/subdev/gsp/tu102.o
> +nvkm-y += nvkm/subdev/gsp/tu116.o
> +nvkm-y += nvkm/subdev/gsp/ga100.o
>   nvkm-y += nvkm/subdev/gsp/ga102.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> index 591ac95c2669..9424d104f2be 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
> @@ -20,15 +20,48 @@
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
>   #include "priv.h"
> -#include <core/falcon.h>
> -#include <core/firmware.h>
> -#include <subdev/acr.h>
> -#include <subdev/top.h>
> +
> +static int
> +nvkm_gsp_fini(struct nvkm_subdev *subdev, bool suspend)
> +{
> +	struct nvkm_gsp *gsp = nvkm_gsp(subdev);
> +
> +	if (!gsp->func->fini)
> +		return 0;
> +
> +	return gsp->func->fini(gsp, suspend);
> +}
> +
> +static int
> +nvkm_gsp_init(struct nvkm_subdev *subdev)
> +{
> +	struct nvkm_gsp *gsp = nvkm_gsp(subdev);
> +
> +	if (!gsp->func->init)
> +		return 0;
> +
> +	return gsp->func->init(gsp);
> +}
> +
> +static int
> +nvkm_gsp_oneinit(struct nvkm_subdev *subdev)
> +{
> +	struct nvkm_gsp *gsp = nvkm_gsp(subdev);
> +
> +	if (!gsp->func->oneinit)
> +		return 0;
> +
> +	return gsp->func->oneinit(gsp);
> +}
>   
>   static void *
>   nvkm_gsp_dtor(struct nvkm_subdev *subdev)
>   {
>   	struct nvkm_gsp *gsp = nvkm_gsp(subdev);
> +
> +	if (gsp->func && gsp->func->dtor)
> +		gsp->func->dtor(gsp);
> +
>   	nvkm_falcon_dtor(&gsp->falcon);
>   	return gsp;
>   }
> @@ -36,6 +69,9 @@ nvkm_gsp_dtor(struct nvkm_subdev *subdev)
>   static const struct nvkm_subdev_func
>   nvkm_gsp = {
>   	.dtor = nvkm_gsp_dtor,
> +	.oneinit = nvkm_gsp_oneinit,
> +	.init = nvkm_gsp_init,
> +	.fini = nvkm_gsp_fini,
>   };
>   
>   int
> @@ -55,5 +91,6 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
>   
>   	gsp->func = fwif->func;
>   
> -	return nvkm_falcon_ctor(gsp->func->flcn, &gsp->subdev, gsp->subdev.name, 0, &gsp->falcon);
> +	return nvkm_falcon_ctor(gsp->func->flcn, &gsp->subdev, gsp->subdev.name, 0x110000,

Is this the GSP Falcon base register offset?

> +				&gsp->falcon);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> new file mode 100644
> index 000000000000..73c3676d15a6
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright 2022 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */

Should probably prefer SPDX licence tags here, below and in quite a few other places.

> +#include "priv.h"
> +
> +static struct nvkm_gsp_fwif
> +ga100_gsps[] = {
> +	{ -1, gv100_gsp_nofw, &gv100_gsp },
> +	{}
> +};
> +
> +int
> +ga100_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
> +	      struct nvkm_gsp **pgsp)
> +{
> +	return nvkm_gsp_new_(ga100_gsps, device, type, inst, pgsp);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> index a3996ceca995..ec6380f8bac5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> @@ -39,15 +39,9 @@ ga102_gsp = {
>   	.flcn = &ga102_gsp_flcn,
>   };
>   
> -static int
> -ga102_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
> -{
> -	return 0;
> -}
> -
>   static struct nvkm_gsp_fwif
>   ga102_gsps[] = {
> -	{ -1, ga102_gsp_nofw, &ga102_gsp },
> +	{ -1, gv100_gsp_nofw, &ga102_gsp },
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
> index da6a809cd317..62d9289bcaa5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c
> @@ -34,12 +34,12 @@ gv100_gsp_flcn = {
>   	.dmem_pio = &gm200_flcn_dmem_pio,
>   };
>   
> -static const struct nvkm_gsp_func
> +const struct nvkm_gsp_func
>   gv100_gsp = {
>   	.flcn = &gv100_gsp_flcn,
>   };
>   
> -static int
> +int
>   gv100_gsp_nofw(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
>   {
>   	return 0;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> index 89749a40203c..351c959476ec 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
> @@ -4,16 +4,25 @@
>   #include <subdev/gsp.h>
>   enum nvkm_acr_lsf_id;
>   
> -struct nvkm_gsp_func {
> -	const struct nvkm_falcon_func *flcn;
> -};
> -
>   struct nvkm_gsp_fwif {
>   	int version;
>   	int (*load)(struct nvkm_gsp *, int ver, const struct nvkm_gsp_fwif *);
>   	const struct nvkm_gsp_func *func;
>   };
>   
> +int gv100_gsp_nofw(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
> +
> +struct nvkm_gsp_func {
> +	const struct nvkm_falcon_func *flcn;
> +
> +	void (*dtor)(struct nvkm_gsp *);
> +	int (*oneinit)(struct nvkm_gsp *);
> +	int (*init)(struct nvkm_gsp *);
> +	int (*fini)(struct nvkm_gsp *, bool suspend);
> +};
> +
>   int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
>   		  struct nvkm_gsp **);
> +
> +extern const struct nvkm_gsp_func gv100_gsp;
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> new file mode 100644
> index 000000000000..be3c4deafaaa
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright 2022 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +#include "priv.h"
> +
> +static struct nvkm_gsp_fwif
> +tu102_gsps[] = {
> +	{ -1, gv100_gsp_nofw, &gv100_gsp },
> +	{}
> +};
> +
> +int
> +tu102_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
> +	      struct nvkm_gsp **pgsp)
> +{
> +	return nvkm_gsp_new_(tu102_gsps, device, type, inst, pgsp);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> new file mode 100644
> index 000000000000..d4a94c115b1b
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright 2022 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +#include "priv.h"
> +
> +static struct nvkm_gsp_fwif
> +tu116_gsps[] = {
> +	{ -1, gv100_gsp_nofw, &gv100_gsp },
> +	{}
> +};
> +
> +int
> +tu116_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
> +	      struct nvkm_gsp **pgsp)
> +{
> +	return nvkm_gsp_new_(tu116_gsps, device, type, inst, pgsp);
> +}
