Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B71E87AE089
	for <lists+nouveau@lfdr.de>; Mon, 25 Sep 2023 23:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0B310E327;
	Mon, 25 Sep 2023 21:00:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625EF10E327
 for <nouveau@lists.freedesktop.org>; Mon, 25 Sep 2023 21:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695675652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ruviBgdWjBTqQvQAKwxDOiv49W+vVVzoy+iAOT4n18k=;
 b=TXhbguOTLvTbMBG2MFMK5Ba5FWKSoDNigw8k6VPVKghCx7bttfEKKyvH/EdQWLj+D9Bdai
 Msiy7Y//0O9bM6q+gAVk44OWqg3U4fbQR6ch6FZa8PcTkf8vfBxGd+Cq5h6yp1Vpc3sJEx
 fxlinTsYTCs4blaz7RTC/AN8SjjfGGQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-v84O9dxYN3qMxnSmX2sI9w-1; Mon, 25 Sep 2023 17:00:50 -0400
X-MC-Unique: v84O9dxYN3qMxnSmX2sI9w-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3231d7d4ac4so3366681f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 25 Sep 2023 14:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695675649; x=1696280449;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ruviBgdWjBTqQvQAKwxDOiv49W+vVVzoy+iAOT4n18k=;
 b=roa4Mw85cFhTMtGNFscznJPW847T69yAds37kg5i+JMnoqoDp+vcvYKflO9M0+lTf2
 4RJqjB6b+De7U8vnbEuOhTCa3urR341cZmyNqJ57JCxScpdJDxW5V4tr+O6z3uKIuY1I
 NAv4oxMGp356zWxL4SRyMbsnYu8n7CTECZlyozhXWabBuQdxu22j2vkChVDxAWyXRIZu
 iYbx88NmHJnbHKsQSYeLcMYbCfMUFwy1ys4DAUr4UfdYZEFmeRLkEEcBgBaO6IZFMXp8
 4P/oudeqhSwmexflvE/uZdHjRMOW4NNA0oEjPSTix8JFYC7rNWrfAoc3Lpeg/Gsu/cuE
 B/8Q==
X-Gm-Message-State: AOJu0Yz8HS39SA80RdhExxBuRGiCwdvg1yZUAV2wI2+lzve8/UpxOACV
 1yqUzaNbWKkFgCb/qmVEmYiIB1soPX9sNdxKV1wsCSofAZf3EgS9SFVVWEtVSqPY3fZL72bmYca
 +SoorKu05p5/+Jo3M2tQ8or1arcsO0sGxwR7NdoPomgIKyr5O8GizucQtT3FuShkOhS3QOOZgqx
 RvNuUU
X-Received: by 2002:a5d:6084:0:b0:318:7bd:349e with SMTP id
 w4-20020a5d6084000000b0031807bd349emr7381193wrt.29.1695675648916; 
 Mon, 25 Sep 2023 14:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOSAxnBHENK9Wt4wu/i/YjUGKU+d6L3CETHYoN3huWC+pfGfrMpzDD9J3vAcOPgii2//s3uw==
X-Received: by 2002:a5d:6084:0:b0:318:7bd:349e with SMTP id
 w4-20020a5d6084000000b0031807bd349emr7381164wrt.29.1695675648171; 
 Mon, 25 Sep 2023 14:00:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b12-20020adff90c000000b0031fb91f23e9sm12731588wrr.43.2023.09.25.14.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 14:00:47 -0700 (PDT)
Message-ID: <2cf377ec-ac67-e1ee-6ab7-2f85b8b4823e@redhat.com>
Date: Mon, 25 Sep 2023 23:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-41-skeggsb@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230918202149.4343-41-skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 40/44] drm/nouveau/gr/r535: initial support
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

On 9/18/23 22:21, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> Adds support for allocating GR classes from RM.
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/include/nvif/class.h  |   3 +
>   .../drm/nouveau/include/nvkm/engine/fifo.h    |   1 +
>   .../gpu/drm/nouveau/include/nvkm/engine/gr.h  |   1 +
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   5 +
>   .../nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h   |  57 ++
>   .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    |  42 ++
>   .../inc/ctrl/ctrl2080/ctrl2080internal.h      |  19 +
>   .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   3 +
>   .../gpu/drm/nouveau/nvkm/engine/device/base.c |   5 +
>   .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |  34 ++
>   drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild |   3 +
>   .../gpu/drm/nouveau/nvkm/engine/gr/ad102.c    |  46 ++
>   .../gpu/drm/nouveau/nvkm/engine/gr/ga102.c    |   2 +-
>   .../gpu/drm/nouveau/nvkm/engine/gr/gf100.h    |   2 +
>   drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c | 508 ++++++++++++++++++
>   .../gpu/drm/nouveau/nvkm/engine/gr/tu102.c    |   2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  11 +
>   17 files changed, 742 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
> index fa94d69d3eb0..550e96db41a0 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/class.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
> @@ -194,6 +194,8 @@
>   
>   #define AMPERE_B                                      /* cl9097.h */ 0x0000c797
>   
> +#define ADA_A                                         /* cl9097.h */ 0x0000c997
> +
>   #define NV74_BSP                                                     0x000074b0
>   
>   #define GT212_MSVLD                                                  0x000085b1
> @@ -239,6 +241,7 @@
>   #define VOLTA_COMPUTE_A                                              0x0000c3c0
>   #define TURING_COMPUTE_A                                             0x0000c5c0
>   #define AMPERE_COMPUTE_B                                             0x0000c7c0
> +#define ADA_COMPUTE_A                                                0x0000c9c0
>   
>   #define NV74_CIPHER                                                  0x000074c1
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> index a26dfeece4b7..be508f65b280 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> @@ -42,6 +42,7 @@ struct nvkm_chan {
>   			dma_addr_t addr;
>   			void *ptr;
>   		} mthdbuf;
> +		struct nvkm_vctx *grctx;
>   	} rm;
>   
>   	struct list_head cctxs;
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> index a2333cfe6955..8145796ffc61 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
> @@ -55,4 +55,5 @@ int gp10b_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
>   int gv100_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
>   int tu102_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
>   int ga102_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
> +int ad102_gr_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_gr **);
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index e7e8b30ceb44..2fa0445d8928 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -176,6 +176,11 @@ struct nvkm_gsp {
>   		u64 rm_bar2_pdb;
>   	} bar;
>   
> +	struct {
> +		u8 gpcs;
> +		u8 tpcs;
> +	} gr;
> +
>   	const struct nvkm_gsp_rm {
>   		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
>   		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
> new file mode 100644
> index 000000000000..7fda8d2d2067
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
> @@ -0,0 +1,57 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080fifo_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080fifo_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2006-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + * SPDX-License-Identifier: MIT
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
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID                          4:0
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS                 (0x00000000)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_VLD                      (0x00000001)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_VIDEO                    (0x00000002)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_MPEG                     (0x00000003)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_CAPTURE                  (0x00000004)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_DISPLAY                  (0x00000005)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_ENCRYPTION               (0x00000006)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_POSTPROCESS              (0x00000007)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL           (0x00000008)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PM              (0x00000009)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COMPUTE_PREEMPT          (0x0000000a)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PREEMPT         (0x0000000b)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_SPILL           (0x0000000c)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PAGEPOOL        (0x0000000d)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_BETACB          (0x0000000e)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_RTV             (0x0000000f)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PATCH           (0x00000010)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_BUNDLE_CB       (0x00000011)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PAGEPOOL_GLOBAL (0x00000012)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ATTRIBUTE_CB    (0x00000013)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_RTV_CB_GLOBAL   (0x00000014)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_GFXP_POOL       (0x00000015)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_GFXP_CTRL_BLK   (0x00000016)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_FECS_EVENT      (0x00000017)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PRIV_ACCESS_MAP (0x00000018)
> +#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT                    (0x00000019)
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
> index 49a1390743c4..ce43708a6f18 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
> @@ -32,6 +32,48 @@
>   
>   #define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
>   
> +typedef struct NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY {
> +    NV_DECLARE_ALIGNED(NvU64 gpuPhysAddr, 8);
> +    NV_DECLARE_ALIGNED(NvU64 gpuVirtAddr, 8);
> +    NV_DECLARE_ALIGNED(NvU64 size, 8);
> +    NvU32 physAttr;
> +    NvU16 bufferId;
> +    NvU8  bInitialize;
> +    NvU8  bNonmapped;
> +} NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY;
> +
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN                         0U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PM                           1U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PATCH                        2U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_BUFFER_BUNDLE_CB             3U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PAGEPOOL                     4U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB                 5U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_RTV_CB_GLOBAL                6U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GFXP_POOL                    7U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GFXP_CTRL_BLK                8U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_FECS_EVENT                   9U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP              10U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP 11U
> +#define NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_GLOBAL_PRIV_ACCESS_MAP       12U
> +
> +#define NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES                        16U
> +
> +#define NV2080_CTRL_CMD_GPU_PROMOTE_CTX                                    (0x2080012bU) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GPU_INTERFACE_ID << 8) | NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS_MESSAGE_ID" */
> +
> +typedef struct NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS {
> +    NvU32    engineType;
> +    NvHandle hClient;
> +    NvU32    ChID;
> +    NvHandle hChanClient;
> +    NvHandle hObject;
> +    NvHandle hVirtMemory;
> +    NV_DECLARE_ALIGNED(NvU64 virtAddress, 8);
> +    NV_DECLARE_ALIGNED(NvU64 size, 8);
> +    NvU32    entryCount;
> +    // C form: NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY promoteEntry[NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES];
> +    NV_DECLARE_ALIGNED(NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY promoteEntry[NV2080_CTRL_GPU_PROMOTE_CONTEXT_MAX_ENTRIES], 8);
> +} NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS;
> +
>   typedef struct NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS {
>       NvU32 gpcMask;
>   } NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS;
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
> index 732f20ee2bbe..25994b299c82 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
> @@ -38,6 +38,25 @@ typedef struct NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS {
>       NvU32  internalDispActiveMask;
>   } NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS;
>   
> +#define NV2080_CTRL_INTERNAL_GR_MAX_ENGINES         8
> +
> +#define NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT 0x19
> +
> +typedef struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO {
> +    NvU32 size;
> +    NvU32 alignment;
> +} NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO;
> +
> +typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO {
> +    NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO engine[NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT];
> +} NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO;
> +
> +typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS {
> +    NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO engineContextBuffersInfo[NV2080_CTRL_INTERNAL_GR_MAX_ENGINES];
> +} NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS;
> +
> +#define NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO (0x20800a32) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO_PARAMS_MESSAGE_ID" */
> +
>   #define NV2080_CTRL_CMD_INTERNAL_DISPLAY_WRITE_INST_MEM (0x20800a49) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS_MESSAGE_ID" */
>   
>   typedef struct NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS {
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
> index 0965c2ee50e8..6cef62a0698d 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
> @@ -34,4 +34,7 @@
>   
>   #define MC_ENGINE_IDX_GSP                           49
>   
> +#define MC_ENGINE_IDX_GR                            82
> +#define MC_ENGINE_IDX_GR0                           MC_ENGINE_IDX_GR
> +
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index bd4b8cf40d4c..8cd57e0e7333 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2762,6 +2762,7 @@ nv192_chipset = {
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
>   	.fifo     = { 0x00000001, ga102_fifo_new },
> +	.gr       = { 0x00000001, ad102_gr_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2783,6 +2784,7 @@ nv193_chipset = {
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
>   	.fifo     = { 0x00000001, ga102_fifo_new },
> +	.gr       = { 0x00000001, ad102_gr_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2804,6 +2806,7 @@ nv194_chipset = {
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
>   	.fifo     = { 0x00000001, ga102_fifo_new },
> +	.gr       = { 0x00000001, ad102_gr_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2825,6 +2828,7 @@ nv196_chipset = {
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
>   	.fifo     = { 0x00000001, ga102_fifo_new },
> +	.gr       = { 0x00000001, ad102_gr_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2846,6 +2850,7 @@ nv197_chipset = {
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
>   	.fifo     = { 0x00000001, ga102_fifo_new },
> +	.gr       = { 0x00000001, ad102_gr_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> index 102e5a586e01..82303e4c5c2e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> @@ -29,6 +29,7 @@
>   #include <subdev/gsp.h>
>   #include <subdev/mmu.h>
>   #include <subdev/vfn.h>
> +#include <engine/gr.h>
>   
>   #include <nvhw/drf.h>
>   
> @@ -67,6 +68,8 @@ r535_chan_ramfc_clear(struct nvkm_chan *chan)
>   
>   	dma_free_coherent(fifo->engine.subdev.device->dev, fifo->rm.mthdbuf_size,
>   			  chan->rm.mthdbuf.ptr, chan->rm.mthdbuf.addr);
> +
> +	nvkm_cgrp_vctx_put(chan->cgrp, &chan->rm.grctx);
>   }
>   
>   #define CHID_PER_USERD 8
> @@ -76,12 +79,19 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
>   {
>   	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
>   	struct nvkm_engn *engn;
> +	struct nvkm_device *device = fifo->engine.subdev.device;
>   	NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
>   	const int userd_p = chan->id / CHID_PER_USERD;
>   	const int userd_i = chan->id % CHID_PER_USERD;
>   	u32 eT = ~0;
>   	int ret;
>   
> +	if (unlikely(device->gr && !device->gr->engine.subdev.oneinit)) {
> +		ret = nvkm_subdev_oneinit(&device->gr->engine.subdev);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	nvkm_runl_foreach_engn(engn, chan->cgrp->runl) {
>   		eT = engn->id;
>   		break;
> @@ -347,6 +357,27 @@ r535_ce = {
>   	.nonstall = r535_engn_nonstall,
>   };
>   
> +static int
> +r535_gr_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan *chan)
> +{
> +	/* RM requires GR context buffers to remain mapped until after the
> +	 * channel has been destroyed (as opposed to after the last gr obj
> +	 * has been deleted).
> +	 *
> +	 * Take an extra ref here, which will be released once the channel
> +	 * object has been deleted.
> +	 */
> +	refcount_inc(&vctx->refs);

The corresponding decrement doesn't seem to be in this patch, which seems unexpected.

> +	chan->rm.grctx = vctx;
> +	return 0;
> +}
> +
> +static const struct nvkm_engn_func
> +r535_gr = {
> +	.nonstall = r535_engn_nonstall,
> +	.ctor2 = r535_gr_ctor,
> +};
> +
>   static void
>   r535_runl_allow(struct nvkm_runl *runl, u32 engm)
>   {
> @@ -477,6 +508,9 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
>   		case NVKM_ENGINE_CE:
>   			engn = nvkm_runl_add(runl, nv2080, &r535_ce, type, inst);
>   			break;
> +		case NVKM_ENGINE_GR:
> +			engn = nvkm_runl_add(runl, nv2080, &r535_gr, type, inst);
> +			break;
>   		case NVKM_ENGINE_SW:
>   			continue;
>   		default:
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
> index b5418f05ccd8..1555f8c40b4f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
> @@ -41,6 +41,9 @@ nvkm-y += nvkm/engine/gr/gp10b.o
>   nvkm-y += nvkm/engine/gr/gv100.o
>   nvkm-y += nvkm/engine/gr/tu102.o
>   nvkm-y += nvkm/engine/gr/ga102.o
> +nvkm-y += nvkm/engine/gr/ad102.o
> +
> +nvkm-y += nvkm/engine/gr/r535.o
>   
>   nvkm-y += nvkm/engine/gr/ctxnv40.o
>   nvkm-y += nvkm/engine/gr/ctxnv50.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
> new file mode 100644
> index 000000000000..7bfa6240d283
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
> @@ -0,0 +1,46 @@
> +/*
> + * Copyright 2023 Red Hat Inc.
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
> +#include "gf100.h"
> +
> +#include <subdev/gsp.h>
> +
> +#include <nvif/class.h>
> +
> +static const struct gf100_gr_func
> +ad102_gr = {
> +	.sclass = {
> +		{ -1, -1, FERMI_TWOD_A },
> +		{ -1, -1, KEPLER_INLINE_TO_MEMORY_B },
> +		{ -1, -1, ADA_A },
> +		{ -1, -1, ADA_COMPUTE_A },
> +		{}
> +	}
> +};
> +
> +int
> +ad102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
> +{
> +	if (nvkm_gsp_rm(device->gsp))
> +		return r535_gr_new(&ad102_gr, device, type, inst, pgr);
> +
> +	return -ENODEV;
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> index 2b51f1d0c281..d285c597aff9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
> @@ -352,7 +352,7 @@ int
>   ga102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
>   {
>   	if (nvkm_gsp_rm(device->gsp))
> -		return -ENODEV;
> +		return r535_gr_new(&ga102_gr, device, type, inst, pgr);
>   
>   	return gf100_gr_new_(ga102_gr_fwif, device, type, inst, pgr);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
> index 54f686ba39ac..b0e0c9305034 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
> @@ -445,4 +445,6 @@ void gp108_gr_acr_bld_patch(struct nvkm_acr *, u32, s64);
>   
>   int gf100_gr_new_(const struct gf100_gr_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
>   		  struct nvkm_gr **);
> +int r535_gr_new(const struct gf100_gr_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
> +		struct nvkm_gr **);
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
> new file mode 100644
> index 000000000000..a7501b52137c
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
> @@ -0,0 +1,508 @@
> +/*
> + * Copyright 2023 Red Hat Inc.
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
> +#include "gf100.h"
> +
> +#include <core/memory.h>
> +#include <subdev/gsp.h>
> +#include <subdev/mmu/vmm.h>
> +#include <engine/fifo/priv.h>
> +
> +#include <nvif/if900d.h>
> +
> +#include <nvhw/drf.h>
> +
> +#include <nvrm/nvtypes.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
> +#include <nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h>
> +
> +#define r535_gr(p) container_of((p), struct r535_gr, base)
> +
> +#define R515_GR_MAX_CTXBUFS 9
> +
> +struct r535_gr {
> +	struct nvkm_gr base;
> +
> +	struct {
> +		u16 bufferId;
> +		u32 size;
> +		u8  page;
> +		u8  align;
> +		bool global;
> +		bool init;
> +		bool ro;
> +	} ctxbuf[R515_GR_MAX_CTXBUFS];
> +	int ctxbuf_nr;
> +
> +	struct nvkm_memory *ctxbuf_mem[R515_GR_MAX_CTXBUFS];
> +};
> +
> +struct r535_gr_chan {
> +	struct nvkm_object object;
> +	struct r535_gr *gr;
> +
> +	struct nvkm_vmm *vmm;
> +	struct nvkm_chan *chan;
> +
> +	struct nvkm_memory *mem[R515_GR_MAX_CTXBUFS];
> +	struct nvkm_vma    *vma[R515_GR_MAX_CTXBUFS];
> +};
> +
> +struct r535_gr_obj {
> +	struct nvkm_object object;
> +	struct nvkm_gsp_object rm;
> +};
> +
> +static void *
> +r535_gr_obj_dtor(struct nvkm_object *object)
> +{
> +	struct r535_gr_obj *obj = container_of(object, typeof(*obj), object);
> +
> +	nvkm_gsp_rm_free(&obj->rm);
> +	return obj;
> +}
> +
> +static const struct nvkm_object_func
> +r535_gr_obj = {

Prefer naming this r535_gr_obj_funcs, makes it easier to read the code and leads to more
distinct symbol names.

> +	.dtor = r535_gr_obj_dtor,
> +};
> +
> +static int
> +r535_gr_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
> +		 struct nvkm_object **pobject)
> +{
> +	struct r535_gr_chan *chan = container_of(oclass->parent, typeof(*chan), object);
> +	struct r535_gr_obj *obj;
> +
> +	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	nvkm_object_ctor(&r535_gr_obj, oclass, &obj->object);
> +	*pobject = &obj->object;
> +
> +	return nvkm_gsp_rm_alloc(&chan->chan->rm.object, oclass->handle, oclass->base.oclass, 0,
> +				 &obj->rm);

Looks suspicious to return an error here without freeing obj. At a first glance I can't really
find where a call to r535_gr_obj_ctor() originates from. This might be another place where the
caller must check both ret and *pobject and subsequently must call dtor() or not.

Note: dtor() returns a pointer to the up-casted structure such that nvkm_object_del() can free it.

> +}
> +
> +static void *
> +r535_gr_chan_dtor(struct nvkm_object *object)
> +{
> +	struct r535_gr_chan *grc = container_of(object, typeof(*grc), object);
> +	struct r535_gr *gr = grc->gr;
> +
> +	for (int i = 0; i < gr->ctxbuf_nr; i++) {
> +		nvkm_vmm_put(grc->vmm, &grc->vma[i]);
> +		nvkm_memory_unref(&grc->mem[i]);
> +	}
> +
> +	nvkm_vmm_unref(&grc->vmm);
> +	return grc;
> +}
> +
> +static const struct nvkm_object_func
> +r535_gr_chan = {
> +	.dtor = r535_gr_chan_dtor,
> +};
> +
> +static int
> +r535_gr_promote_ctx(struct r535_gr *gr, bool golden, struct nvkm_vmm *vmm,
> +		    struct nvkm_memory **pmem, struct nvkm_vma **pvma,
> +		    struct nvkm_gsp_object *chan)
> +{
> +	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
> +	struct nvkm_device *device = subdev->device;
> +	NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS *ctrl;
> +
> +	ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.device.subdevice,
> +				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
> +	if (WARN_ON(IS_ERR(ctrl)))
> +		return PTR_ERR(ctrl);
> +
> +	ctrl->engineType = 1;
> +	ctrl->hChanClient = vmm->rm.client.object.handle;
> +	ctrl->hObject = chan->handle;
> +
> +	for (int i = 0; i < gr->ctxbuf_nr; i++) {
> +		NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ENTRY *entry =
> +			&ctrl->promoteEntry[ctrl->entryCount];
> +		const bool alloc = golden || !gr->ctxbuf[i].global;
> +		int ret;
> +
> +		entry->bufferId = gr->ctxbuf[i].bufferId;
> +		entry->bInitialize = gr->ctxbuf[i].init && alloc;
> +
> +		if (alloc) {
> +			ret = nvkm_memory_new(device, gr->ctxbuf[i].init ?
> +					      NVKM_MEM_TARGET_INST : NVKM_MEM_TARGET_INST_SR_LOST,
> +					      gr->ctxbuf[i].size, 1 << gr->ctxbuf[i].page,
> +					      gr->ctxbuf[i].init, &pmem[i]);
> +			if (WARN_ON(ret))
> +				return ret;

Looks suspicious that we do not have an unwind path in this function. Who cleans up all the allocations?

> +
> +			if (gr->ctxbuf[i].bufferId ==
> +					NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP)
> +				entry->bNonmapped = 1;
> +		} else {
> +			if (gr->ctxbuf[i].bufferId ==
> +				NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP)
> +				continue;
> +
> +			pmem[i] = nvkm_memory_ref(gr->ctxbuf_mem[i]);

And taken references?

> +		}
> +
> +		if (!entry->bNonmapped) {
> +			struct gf100_vmm_map_v0 args = {
> +				.priv = 1,
> +				.ro   = gr->ctxbuf[i].ro,
> +			};
> +
> +			mutex_lock(&vmm->mutex.vmm);
> +			ret = nvkm_vmm_get_locked(vmm, false, true, false, 0, gr->ctxbuf[i].align,
> +						  nvkm_memory_size(pmem[i]), &pvma[i]);
> +			mutex_unlock(&vmm->mutex.vmm);
> +			if (ret)
> +				return ret;
> +
> +			ret = nvkm_memory_map(pmem[i], 0, vmm, pvma[i], &args, sizeof(args));
> +			if (ret)
> +				return ret;

How is that cleaned up - on failure, but also in general?

> +
> +			entry->gpuVirtAddr = pvma[i]->addr;
> +		}
> +
> +		if (entry->bInitialize) {
> +			entry->gpuPhysAddr = nvkm_memory_addr(pmem[i]);
> +			entry->size = gr->ctxbuf[i].size;
> +			entry->physAttr = 4;
> +		}
> +
> +		nvkm_debug(subdev,
> +			   "promote %02d: pa %016llx/%08x sz %016llx va %016llx init:%d nm:%d\n",
> +			   entry->bufferId, entry->gpuPhysAddr, entry->physAttr, entry->size,
> +			   entry->gpuVirtAddr, entry->bInitialize, entry->bNonmapped);
> +
> +		ctrl->entryCount++;
> +	}
> +
> +	return nvkm_gsp_rm_ctrl_wr(&vmm->rm.device.subdevice, ctrl);
> +}
> +
> +static int
> +r535_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *chan, const struct nvkm_oclass *oclass,
> +		 struct nvkm_object **pobject)
> +{
> +	struct r535_gr *gr = r535_gr(base);
> +	struct r535_gr_chan *grc;
> +	int ret;
> +
> +	if (!(grc = kzalloc(sizeof(*grc), GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	nvkm_object_ctor(&r535_gr_chan, oclass, &grc->object);
> +	grc->gr = gr;
> +	grc->vmm = nvkm_vmm_ref(chan->vmm);
> +	grc->chan = chan;
> +	*pobject = &grc->object;
> +
> +	ret = r535_gr_promote_ctx(gr, false, grc->vmm, grc->mem, grc->vma, &chan->rm.object);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static u64
> +r535_gr_units(struct nvkm_gr *gr)
> +{
> +	struct nvkm_gsp *gsp = gr->engine.subdev.device->gsp;
> +
> +	return (gsp->gr.tpcs << 8) | gsp->gr.gpcs;
> +}
> +
> +static int
> +r535_gr_oneinit(struct nvkm_gr *base)
> +{
> +	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
> +	struct r535_gr *gr = container_of(base, typeof(*gr), base);
> +	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
> +	struct nvkm_device *device = subdev->device;
> +	struct nvkm_gsp *gsp = device->gsp;
> +	struct nvkm_mmu *mmu = device->mmu;
> +	struct {
> +		struct nvkm_memory *inst;
> +		struct nvkm_vmm *vmm;
> +		struct nvkm_gsp_object chan;
> +		struct nvkm_vma *vma[R515_GR_MAX_CTXBUFS];
> +	} golden = {};
> +	int ret;
> +
> +	/* Allocate a channel to use for golden context init. */
> +	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, 0x12000, 0, true, &golden.inst);
> +	if (ret)
> +		goto done;
> +
> +	ret = nvkm_vmm_new(device, 0x1000, 0, NULL, 0, NULL, "grGoldenVmm", &golden.vmm);
> +	if (ret)
> +		goto done;
> +
> +	ret = mmu->func->promote_vmm(golden.vmm);
> +	if (ret)
> +		goto done;
> +
> +	{
> +		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
> +
> +		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, 0xf1f00000,
> +					     device->fifo->func->chan.user.oclass,
> +					     sizeof(*args), &golden.chan);
> +		if (IS_ERR(args)) {
> +			ret = PTR_ERR(args);
> +			goto done;
> +		}
> +
> +		args->gpFifoOffset = 0;
> +		args->gpFifoEntries = 0x1000 / 8;
> +		args->flags =
> +			NVDEF(NVOS04, FLAGS, CHANNEL_TYPE, PHYSICAL) |
> +			NVDEF(NVOS04, FLAGS, VPR, FALSE) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_MAP_REFCOUNTING, FALSE) |
> +			NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, 0) |
> +			NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, TRUE) |
> +			NVDEF(NVOS04, FLAGS, DELAY_CHANNEL_SCHEDULING, FALSE) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_DENY_PHYSICAL_MODE_CE, FALSE) |
> +			NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_VALUE, 0) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_FIXED, FALSE) |
> +			NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_VALUE, 0) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_FIXED, TRUE) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_DENY_AUTH_LEVEL_PRIV, FALSE) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_SCRUBBER, FALSE) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_CLIENT_MAP_FIFO, FALSE) |
> +			NVDEF(NVOS04, FLAGS, SET_EVICT_LAST_CE_PREFETCH_CHANNEL, FALSE) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_VGPU_PLUGIN_CONTEXT, FALSE) |
> +			NVDEF(NVOS04, FLAGS, CHANNEL_PBDMA_ACQUIRE_TIMEOUT, FALSE) |
> +			NVDEF(NVOS04, FLAGS, GROUP_CHANNEL_THREAD, DEFAULT) |
> +			NVDEF(NVOS04, FLAGS, MAP_CHANNEL, FALSE) |
> +			NVDEF(NVOS04, FLAGS, SKIP_CTXBUFFER_ALLOC, FALSE);
> +		args->hVASpace = golden.vmm->rm.object.handle;
> +		args->engineType = 1;
> +		args->instanceMem.base = nvkm_memory_addr(golden.inst);
> +		args->instanceMem.size = 0x1000;
> +		args->instanceMem.addressSpace = 2;
> +		args->instanceMem.cacheAttrib = 1;
> +		args->ramfcMem.base = nvkm_memory_addr(golden.inst);
> +		args->ramfcMem.size = 0x200;
> +		args->ramfcMem.addressSpace = 2;
> +		args->ramfcMem.cacheAttrib = 1;
> +		args->userdMem.base = nvkm_memory_addr(golden.inst) + 0x1000;
> +		args->userdMem.size = 0x200;
> +		args->userdMem.addressSpace = 2;
> +		args->userdMem.cacheAttrib = 1;
> +		args->mthdbufMem.base = nvkm_memory_addr(golden.inst) + 0x2000;
> +		args->mthdbufMem.size = 0x5000;
> +		args->mthdbufMem.addressSpace = 2;
> +		args->mthdbufMem.cacheAttrib = 1;
> +		args->internalFlags =
> +			NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, ADMIN) |
> +			NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ERROR_NOTIFIER_TYPE, NONE) |
> +			NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ECC_ERROR_NOTIFIER_TYPE, NONE);
> +
> +		ret = nvkm_gsp_rm_alloc_wr(&golden.chan, args);
> +		if (ret)
> +			goto done;
> +	}
> +
> +	/* Fetch context buffer info from RM and allocate each of them here to use
> +	 * during golden context init (or later as a global context buffer).
> +	 *
> +	 * Also build the information that'll be used to create channel contexts.
> +	 */
> +	info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
> +				   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
> +				   sizeof(*info));
> +	if (WARN_ON(IS_ERR(info))) {
> +		ret = PTR_ERR(info);
> +		goto done;
> +	}
> +
> +	for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++) {
> +		static const struct {
> +			u32     id0; /* NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID */
> +			u32     id1; /* NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID */
> +			bool global;
> +			bool   init;
> +			bool     ro;
> +		} map[] = {
> +#define _A(n,N,G,I,R) { .id0 = NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_##n, \
> +			.id1 = NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_##N, \
> +			.global = (G), .init = (I), .ro = (R) }
> +#define _B(N,G,I,R) _A(GRAPHICS_##N, N, (G), (I), (R))
> +			/*                                       global   init     ro */
> +			_A(           GRAPHICS,             MAIN, false,  true, false),
> +			_B(                                PATCH, false,  true, false),
> +			_A( GRAPHICS_BUNDLE_CB, BUFFER_BUNDLE_CB,  true, false, false),
> +			_B(                             PAGEPOOL,  true, false, false),
> +			_B(                         ATTRIBUTE_CB,  true, false, false),
> +			_B(                        RTV_CB_GLOBAL,  true, false, false),
> +			_B(                           FECS_EVENT,  true,  true, false),
> +			_B(                      PRIV_ACCESS_MAP,  true,  true,  true),
> +#undef _B
> +#undef _A
> +		};
> +		u32 size = info->engineContextBuffersInfo[0].engine[i].size;
> +		u8 align, page;
> +		int id;
> +
> +		for (id = 0; id < ARRAY_SIZE(map); id++) {
> +			if (map[id].id0 == i)
> +				break;
> +		}
> +
> +		nvkm_debug(subdev, "%02x: size:0x%08x %s\n", i,
> +			   size, (id < ARRAY_SIZE(map)) ? "*" : "");
> +		if (id >= ARRAY_SIZE(map))
> +			continue;
> +
> +		if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_MAIN)
> +			size = ALIGN(size, 0x1000) + 64 * 0x1000; /* per-subctx headers */
> +
> +		if      (size >= 1 << 21) page = 21;
> +		else if (size >= 1 << 16) page = 16;
> +		else			  page = 12;
> +
> +		if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_ATTRIBUTE_CB)
> +			align = order_base_2(size);
> +		else
> +			align = page;
> +
> +		if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
> +			continue;
> +
> +		gr->ctxbuf[gr->ctxbuf_nr].bufferId = map[id].id1;
> +		gr->ctxbuf[gr->ctxbuf_nr].size     = size;
> +		gr->ctxbuf[gr->ctxbuf_nr].page     = page;
> +		gr->ctxbuf[gr->ctxbuf_nr].align    = align;
> +		gr->ctxbuf[gr->ctxbuf_nr].global   = map[id].global;
> +		gr->ctxbuf[gr->ctxbuf_nr].init     = map[id].init;
> +		gr->ctxbuf[gr->ctxbuf_nr].ro       = map[id].ro;
> +		gr->ctxbuf_nr++;
> +
> +		if (map[id].id1 == NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_PRIV_ACCESS_MAP) {
> +			if (WARN_ON(gr->ctxbuf_nr == ARRAY_SIZE(gr->ctxbuf)))
> +				continue;
> +
> +			gr->ctxbuf[gr->ctxbuf_nr] = gr->ctxbuf[gr->ctxbuf_nr - 1];
> +			gr->ctxbuf[gr->ctxbuf_nr].bufferId =
> +				NV2080_CTRL_GPU_PROMOTE_CTX_BUFFER_ID_UNRESTRICTED_PRIV_ACCESS_MAP;
> +			gr->ctxbuf_nr++;
> +		}
> +	}
> +
> +	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
> +
> +	/* Promote golden context to RM. */
> +	ret = r535_gr_promote_ctx(gr, true, golden.vmm, gr->ctxbuf_mem, golden.vma, &golden.chan);
> +	if (ret)
> +		goto done;
> +
> +	/* Allocate 3D class on channel to trigger golden context init in RM. */
> +	{
> +		int i;
> +
> +		for (i = 0; gr->base.func->sclass[i].ctor; i++) {
> +			if ((gr->base.func->sclass[i].oclass & 0xff) == 0x97) {
> +				struct nvkm_gsp_object threed;
> +
> +				ret = nvkm_gsp_rm_alloc(&golden.chan, 0x97000000,
> +							gr->base.func->sclass[i].oclass, 0,
> +							&threed);
> +				if (ret)
> +					goto done;
> +
> +				nvkm_gsp_rm_free(&threed);
> +				break;
> +			}
> +		}
> +
> +		if (WARN_ON(!gr->base.func->sclass[i].ctor)) {
> +			ret = -EINVAL;
> +			goto done;
> +		}
> +	}
> +
> +done:
> +	nvkm_gsp_rm_free(&golden.chan);
> +	for (int i = gr->ctxbuf_nr - 1; i >= 0; i--)
> +		nvkm_vmm_put(golden.vmm, &golden.vma[i]);
> +	nvkm_vmm_unref(&golden.vmm);
> +	nvkm_memory_unref(&golden.inst);
> +	return ret;
> +
> +}
> +
> +static void *
> +r535_gr_dtor(struct nvkm_gr *base)
> +{
> +	struct r535_gr *gr = r535_gr(base);
> +
> +	while (gr->ctxbuf_nr)
> +		nvkm_memory_unref(&gr->ctxbuf_mem[--gr->ctxbuf_nr]);
> +
> +	kfree(gr->base.func);
> +	return gr;
> +}
> +
> +int
> +r535_gr_new(const struct gf100_gr_func *hw,
> +	    struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
> +{
> +	struct nvkm_gr_func *rm;
> +	struct r535_gr *gr;
> +	int nclass;
> +
> +	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
> +
> +	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	rm->dtor = r535_gr_dtor;
> +	rm->oneinit = r535_gr_oneinit;
> +	rm->units = r535_gr_units;
> +	rm->chan_new = r535_gr_chan_new;
> +
> +	for (int i = 0; i < nclass; i++) {
> +		rm->sclass[i].minver = hw->sclass[i].minver;
> +		rm->sclass[i].maxver = hw->sclass[i].maxver;
> +		rm->sclass[i].oclass = hw->sclass[i].oclass;
> +		rm->sclass[i].ctor = r535_gr_obj_ctor;
> +	}
> +
> +	if (!(gr = kzalloc(sizeof(*gr), GFP_KERNEL))) {
> +		kfree(rm);
> +		return -ENOMEM;
> +	}
> +
> +	*pgr = &gr->base;
> +
> +	return nvkm_gr_ctor(rm, device, type, inst, true, &gr->base);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> index bda8054c6b59..b7a458e9040a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -219,7 +219,7 @@ int
>   tu102_gr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_gr **pgr)
>   {
>   	if (nvkm_gsp_rm(device->gsp))
> -		return -ENODEV;
> +		return r535_gr_new(&tu102_gr, device, type, inst, pgr);
>   
>   	return gf100_gr_new_(tu102_gr_fwif, device, type, inst, pgr);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index f36eed2fb3b7..71b90adb4382 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -855,6 +855,10 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
>   			type = NVKM_ENGINE_CE;
>   			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_CE0;
>   			break;
> +		case MC_ENGINE_IDX_GR0:
> +			type = NVKM_ENGINE_GR;
> +			inst = 0;
> +			break;
>   		default:
>   			continue;
>   		}
> @@ -930,6 +934,13 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
>   		gsp->fb.rsvd_size = gsp->fb.heap.addr - rsvd_base;
>   	}
>   
> +	for (int gpc = 0; gpc < ARRAY_SIZE(rpc->tpcInfo); gpc++) {
> +		if (rpc->gpcInfo.gpcMask & BIT(gpc)) {
> +			gsp->gr.tpcs += hweight32(rpc->tpcInfo[gpc].tpcMask);
> +			gsp->gr.gpcs++;
> +		}
> +	}
> +
>   	nvkm_gsp_rpc_done(gsp, rpc);
>   	return 0;
>   }

