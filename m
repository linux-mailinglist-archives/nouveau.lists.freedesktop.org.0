Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F57AE038
	for <lists+nouveau@lfdr.de>; Mon, 25 Sep 2023 22:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008A810E2D3;
	Mon, 25 Sep 2023 20:13:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FD210E2D3
 for <nouveau@lists.freedesktop.org>; Mon, 25 Sep 2023 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695672807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ABWHfxErZOyNI9XXNoIGykSFWrxwo7+E6VcaSXwXb5g=;
 b=SmVNu5YgNbuCHfbS9irbaXAcHKynj7DUjSUH2NjAVP7d008f179TIqynRXsu40htXji0/0
 ksnhKY9Wg9cvy2qu8xq9mVHjsnwOshIHcCMyyFn/TWHzDsef7BsQBjfleIYqpU7WoFzCiH
 boPAfTk7nhrFoWAYSKE7rqbPPwX2XVM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-3w7tw7S3PEqdfYOGMtC40w-1; Mon, 25 Sep 2023 16:13:25 -0400
X-MC-Unique: 3w7tw7S3PEqdfYOGMtC40w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31f3eaa5c5eso5320466f8f.3
 for <nouveau@lists.freedesktop.org>; Mon, 25 Sep 2023 13:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695672804; x=1696277604;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ABWHfxErZOyNI9XXNoIGykSFWrxwo7+E6VcaSXwXb5g=;
 b=BaGp5ctdoNoHWoOT3agQbOAOCO+Jg1icfefSJmCUhzpcFRcpEEQhNKR4P1AE/b1Yew
 1MjKjD2KyiBzVUtjCyyPC4ueQ+tYpZI7PIsf3R8ZdTiH+eCC5XniN8nHAxxnqT0KJPVX
 Rib3vb8tq98N6DdueDSJBmuS0MCrDkOvMcjfETTlZt1kzqhcVlwLfZovIdrl4SofbTAj
 RQ9WISFB8Jo7hvbein/NSO3mE9dxq9f7rxCOem1OkUr+2V1GA5UsR3f4/vqch+hk/ujS
 7IRQwPKkVrk0OXBxK/xgE/rxPIWlP7wzpD0Pz3VL8XoIOJwuc51EDpJOsVir8wfvIHnu
 NNXA==
X-Gm-Message-State: AOJu0YzAcIWLYZz862vv+bcq6sK9rGb5Zu/4sEIG3k9a8Ayz8XIGsNGi
 4CUXZFrB9OLEy3Cr1RBv5yE8gUmYcZMM8T1E7Ssh/odb8flua4GqunV34LragC7yMLoaJLmm0O9
 H5jupHthe01hFa+/k4YiEIPZX0zrz5zd2umcPoJINHhxyx3tZaCYlHTgdhlI6P+VIAkA7Q/zxpc
 KpuvvF
X-Received: by 2002:adf:e48e:0:b0:317:6639:852d with SMTP id
 i14-20020adfe48e000000b003176639852dmr6869851wrm.43.1695672803966; 
 Mon, 25 Sep 2023 13:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1ZA6xjtXitr6g2XYQZuzhcfdlaJM0LcoTfGwZSaMsv0m8YMTkDdHz7e5otUpq9EnJ/3cr8Q==
X-Received: by 2002:adf:e48e:0:b0:317:6639:852d with SMTP id
 i14-20020adfe48e000000b003176639852dmr6869826wrm.43.1695672803096; 
 Mon, 25 Sep 2023 13:13:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a5d4989000000b0031c5ce91ad6sm12683900wrq.97.2023.09.25.13.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 13:13:22 -0700 (PDT)
Message-ID: <13a0ae05-fbb1-14c0-5847-abe484bafcc1@redhat.com>
Date: Mon, 25 Sep 2023 22:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-39-skeggsb@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230918202149.4343-39-skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 38/44] drm/nouveau/fifo/r535: initial support
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
> - Adds support for allocating CHANNEL_GPFIFO classes from RM.
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>   .../drm/nouveau/include/nvkm/engine/fifo.h    |  13 +
>   .../sdk/nvidia/inc/alloc/alloc_channel.h      | 161 ++++++
>   .../nvidia/inc/class/cl2080_notification.h    |  20 +
>   .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h |  35 ++
>   .../nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h   |  52 ++
>   .../nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h |  42 ++
>   .../common/sdk/nvidia/inc/nvlimits.h          |   2 +
>   .../nvidia/generated/g_kernel_channel_nvoc.h  |  62 +++
>   .../nvidia/generated/g_kernel_fifo_nvoc.h     | 119 ++++
>   .../nvidia/generated/g_rpc-structures.h       |   9 +
>   .../gpu/drm/nouveau/nvkm/engine/device/base.c |   5 +
>   drivers/gpu/drm/nouveau/nvkm/engine/falcon.c  |   4 +-
>   .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |   2 +
>   .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  |   2 +-
>   .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  |   4 +-
>   .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |   2 +
>   .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   | 519 ++++++++++++++++++
>   .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  |   2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  30 +
>   19 files changed, 1079 insertions(+), 6 deletions(-)
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> index 7de63718ae7e..93c75540ba5a 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
> @@ -4,6 +4,7 @@
>   #include <core/engine.h>
>   #include <core/object.h>
>   #include <core/event.h>
> +#include <subdev/gsp.h>
>   struct nvkm_fault_data;
>   
>   #define NVKM_FIFO_ENGN_NR 16
> @@ -35,6 +36,14 @@ struct nvkm_chan {
>   	atomic_t blocked;
>   	atomic_t errored;
>   
> +	struct {
> +		struct nvkm_gsp_object object;
> +		struct {
> +			dma_addr_t addr;
> +			void *ptr;
> +		} mthdbuf;
> +	} rm;
> +
>   	struct list_head cctxs;
>   	struct list_head head;
>   };
> @@ -71,6 +80,10 @@ struct nvkm_fifo {
>   		struct list_head list;
>   	} userd;
>   
> +	struct {
> +		u32 mthdbuf_size;
> +	} rm;
> +
>   	spinlock_t lock;
>   	struct mutex mutex;
>   };
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h
> new file mode 100644
> index 000000000000..29d0b58c25c3
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h
> @@ -0,0 +1,161 @@
> +#ifndef __src_common_sdk_nvidia_inc_alloc_alloc_channel_h__
> +#define __src_common_sdk_nvidia_inc_alloc_alloc_channel_h__
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h>
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +typedef struct NV_MEMORY_DESC_PARAMS {
> +    NV_DECLARE_ALIGNED(NvU64 base, 8);
> +    NV_DECLARE_ALIGNED(NvU64 size, 8);
> +    NvU32 addressSpace;
> +    NvU32 cacheAttrib;
> +} NV_MEMORY_DESC_PARAMS;
> +
> +#define NVOS04_FLAGS_CHANNEL_TYPE                                  1:0
> +#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL                         0x00000000
> +#define NVOS04_FLAGS_CHANNEL_TYPE_VIRTUAL                          0x00000001  // OBSOLETE
> +#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL_FOR_VIRTUAL             0x00000002  // OBSOLETE
> +
> +#define NVOS04_FLAGS_VPR                                           2:2
> +#define NVOS04_FLAGS_VPR_FALSE                                     0x00000000
> +#define NVOS04_FLAGS_VPR_TRUE                                      0x00000001
> +
> +#define NVOS04_FLAGS_CC_SECURE                                     2:2
> +#define NVOS04_FLAGS_CC_SECURE_FALSE                               0x00000000
> +#define NVOS04_FLAGS_CC_SECURE_TRUE                                0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING                  3:3
> +#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_FALSE            0x00000000
> +#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_TRUE             0x00000001
> +
> +#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE                       4:4
> +#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_DEFAULT               0x00000000
> +#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_ONE                   0x00000001
> +
> +#define NVOS04_FLAGS_PRIVILEGED_CHANNEL                           5:5
> +#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_FALSE                     0x00000000
> +#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_TRUE                      0x00000001
> +
> +#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING                     6:6
> +#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_FALSE               0x00000000
> +#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_TRUE                0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE                7:7
> +#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_FALSE          0x00000000
> +#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_TRUE           0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_VALUE                    10:8
> +
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED                    11:11
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_FALSE              0x00000000
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_TRUE               0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_VALUE               20:12
> +
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED               21:21
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_FALSE         0x00000000
> +#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_TRUE          0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV                 22:22
> +#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_FALSE           0x00000000
> +#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_TRUE            0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER                        23:23
> +#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_FALSE                  0x00000000
> +#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_TRUE                   0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO                      24:24
> +#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_FALSE                0x00000000
> +#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_TRUE                 0x00000001
> +
> +#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL           25:25
> +#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_FALSE     0x00000000
> +#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_TRUE      0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT                  26:26
> +#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_FALSE            0x00000000
> +#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_TRUE             0x00000001
> +
> +#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT                 27:27
> +#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_FALSE           0x00000000
> +#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_TRUE            0x00000001
> +
> +#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD                          29:28
> +#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_DEFAULT                  0x00000000
> +#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_ONE                      0x00000001
> +#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_TWO                      0x00000002
> +
> +#define NVOS04_FLAGS_MAP_CHANNEL                                   30:30
> +#define NVOS04_FLAGS_MAP_CHANNEL_FALSE                             0x00000000
> +#define NVOS04_FLAGS_MAP_CHANNEL_TRUE                              0x00000001
> +
> +#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC                          31:31
> +#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_FALSE                    0x00000000
> +#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_TRUE                     0x00000001
> +
> +typedef struct NV_CHANNEL_ALLOC_PARAMS {
> +
> +    NvHandle hObjectError; // error context DMA
> +    NvHandle hObjectBuffer; // no longer used
> +    NV_DECLARE_ALIGNED(NvU64 gpFifoOffset, 8);    // offset to beginning of GP FIFO
> +    NvU32    gpFifoEntries;    // number of GP FIFO entries
> +
> +    NvU32    flags;
> +
> +
> +    NvHandle hContextShare; // context share handle
> +    NvHandle hVASpace; // VASpace for the channel
> +
> +    // handle to UserD memory object for channel, ignored if hUserdMemory[0]=0
> +    NvHandle hUserdMemory[NV_MAX_SUBDEVICES];
> +
> +    // offset to beginning of UserD within hUserdMemory[x]
> +    NV_DECLARE_ALIGNED(NvU64 userdOffset[NV_MAX_SUBDEVICES], 8);
> +
> +    // engine type(NV2080_ENGINE_TYPE_*) with which this channel is associated
> +    NvU32    engineType;
> +    // Channel identifier that is unique for the duration of a RM session
> +    NvU32    cid;
> +    // One-hot encoded bitmask to match SET_SUBDEVICE_MASK methods
> +    NvU32    subDeviceId;
> +    NvHandle hObjectEccError; // ECC error context DMA
> +
> +    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS instanceMem, 8);
> +    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS userdMem, 8);
> +    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS ramfcMem, 8);
> +    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS mthdbufMem, 8);
> +
> +    NvHandle hPhysChannelGroup;              // reserved
> +    NvU32    internalFlags;                 // reserved
> +    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS errorNotifierMem, 8); // reserved
> +    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS eccErrorNotifierMem, 8); // reserved
> +    NvU32    ProcessID;                 // reserved
> +    NvU32    SubProcessID;                 // reserved
> +} NV_CHANNEL_ALLOC_PARAMS;
> +
> +typedef NV_CHANNEL_ALLOC_PARAMS NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h
> index 39652d3b5fa8..eea583de08f3 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h
> @@ -30,6 +30,26 @@
>   
>   #define NV2080_NOTIFIERS_DP_IRQ                                    (7)
>   
> +#define NV2080_ENGINE_TYPE_GRAPHICS                   (0x00000001)
> +#define NV2080_ENGINE_TYPE_GR0                        NV2080_ENGINE_TYPE_GRAPHICS
> +
> +#define NV2080_ENGINE_TYPE_COPY0                      (0x00000009)
> +
> +#define NV2080_ENGINE_TYPE_BSP                        (0x00000013)
> +#define NV2080_ENGINE_TYPE_NVDEC0                     NV2080_ENGINE_TYPE_BSP
> +
> +#define NV2080_ENGINE_TYPE_MSENC                      (0x0000001b)
> +#define NV2080_ENGINE_TYPE_NVENC0                      NV2080_ENGINE_TYPE_MSENC  /* Mutually exclusive alias */
> +
> +#define NV2080_ENGINE_TYPE_SW                         (0x00000022)
> +
> +#define NV2080_ENGINE_TYPE_SEC2                       (0x00000026)
> +
> +#define NV2080_ENGINE_TYPE_NVJPG                      (0x0000002b)
> +#define NV2080_ENGINE_TYPE_NVJPEG0                     NV2080_ENGINE_TYPE_NVJPG
> +
> +#define NV2080_ENGINE_TYPE_OFA                        (0x00000033)
> +
>   typedef struct {
>       NvU32 plugDisplayMask;
>       NvU32 unplugDisplayMask;
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
> new file mode 100644
> index 000000000000..c1e79f64bd03
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
> @@ -0,0 +1,35 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080ce_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080ce_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2014-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +typedef struct NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS {
> +    NvU32 size;
> +} NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS;
> +
> +#define NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE (0x20802a08) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_CE_INTERFACE_ID << 8) | NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS_MESSAGE_ID" */
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
> new file mode 100644
> index 000000000000..8865dd589822
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
> @@ -0,0 +1,52 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fifo_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fifo_h__
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
> +#define NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE                 (0x20801112) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_FIFO_INTERFACE_ID << 8) | NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS_MESSAGE_ID" */
> +
> +#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES         32
> +#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_DATA_TYPES   16
> +#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA    2
> +#define NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_NAME_LEN 16
> +
> +typedef struct NV2080_CTRL_FIFO_DEVICE_ENTRY {
> +    NvU32 engineData[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_DATA_TYPES];
> +    NvU32 pbdmaIds[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA];
> +    NvU32 pbdmaFaultIds[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_PBDMA];
> +    NvU32 numPbdmas;
> +    char  engineName[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_ENGINE_MAX_NAME_LEN];
> +} NV2080_CTRL_FIFO_DEVICE_ENTRY;
> +
> +typedef struct NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS {
> +    NvU32                         baseIndex;
> +    NvU32                         numEntries;
> +    NvBool                        bMore;
> +    // C form: NV2080_CTRL_FIFO_DEVICE_ENTRY entries[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES];
> +    NV2080_CTRL_FIFO_DEVICE_ENTRY entries[NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_MAX_ENTRIES];
> +} NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
> new file mode 100644
> index 000000000000..fce434425bdf
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
> @@ -0,0 +1,42 @@
> +#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrla06f_ctrla06fgpfifo_h__
> +#define __src_common_sdk_nvidia_inc_ctrl_ctrla06f_ctrla06fgpfifo_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2007-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +#define NVA06F_CTRL_CMD_GPFIFO_SCHEDULE (0xa06f0103) /* finn: Evaluated from "(FINN_KEPLER_CHANNEL_GPFIFO_A_GPFIFO_INTERFACE_ID << 8) | NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS_MESSAGE_ID" */
> +
> +typedef struct NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS {
> +    NvBool bEnable;
> +    NvBool bSkipSubmit;
> +} NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS;
> +
> +#define NVA06F_CTRL_CMD_BIND (0xa06f0104) /* finn: Evaluated from "(FINN_KEPLER_CHANNEL_GPFIFO_A_GPFIFO_INTERFACE_ID << 8) | NVA06F_CTRL_BIND_PARAMS_MESSAGE_ID" */
> +
> +typedef struct NVA06F_CTRL_BIND_PARAMS {
> +    NvU32 engineType;
> +} NVA06F_CTRL_BIND_PARAMS;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h
> index 12393c8aaf29..21f53f46a7b8 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h
> @@ -26,6 +26,8 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +#define NV_MAX_SUBDEVICES       8
> +
>   #define NV_PROC_NAME_MAX_LENGTH 100U
>   
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h
> new file mode 100644
> index 000000000000..c87503317d8f
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h
> @@ -0,0 +1,62 @@
> +#ifndef __src_nvidia_generated_g_kernel_channel_nvoc_h__
> +#define __src_nvidia_generated_g_kernel_channel_nvoc_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2020-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +typedef enum {
> +    /*!
> +     * Initial state as passed in NV_CHANNEL_ALLOC_PARAMS by
> +     * kernel CPU-RM clients.
> +     */
> +    ERROR_NOTIFIER_TYPE_UNKNOWN = 0,
> +    /*! @brief Error notifier is explicitly not set.
> +     *
> +     * The corresponding hErrorContext or hEccErrorContext must be
> +     * NV01_NULL_OBJECT.
> +     */
> +    ERROR_NOTIFIER_TYPE_NONE,
> +    /*! @brief Error notifier is a ContextDma */
> +    ERROR_NOTIFIER_TYPE_CTXDMA,
> +    /*! @brief Error notifier is a NvNotification array in sysmem/vidmem */
> +    ERROR_NOTIFIER_TYPE_MEMORY
> +} ErrorNotifierType;
> +
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE                       1:0
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_USER                  0x0
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_ADMIN                 0x1
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_KERNEL                0x2
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE             3:2
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_UNKNOWN     ERROR_NOTIFIER_TYPE_UNKNOWN
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_NONE        ERROR_NOTIFIER_TYPE_NONE
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_CTXDMA      ERROR_NOTIFIER_TYPE_CTXDMA
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_MEMORY      ERROR_NOTIFIER_TYPE_MEMORY
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE         5:4
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_UNKNOWN ERROR_NOTIFIER_TYPE_UNKNOWN
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_NONE    ERROR_NOTIFIER_TYPE_NONE
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_CTXDMA  ERROR_NOTIFIER_TYPE_CTXDMA
> +#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_MEMORY  ERROR_NOTIFIER_TYPE_MEMORY
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h
> new file mode 100644
> index 000000000000..dd706d126ce6
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h
> @@ -0,0 +1,119 @@
> +#ifndef __src_nvidia_generated_g_kernel_fifo_nvoc_h__
> +#define __src_nvidia_generated_g_kernel_fifo_nvoc_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2021-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +typedef enum
> +{
> +    /* *************************************************************************
> +     * Bug 3820969
> +     * THINK BEFORE CHANGING ENUM ORDER HERE.
> +     * VGPU-guest uses this same ordering. Because this enum is not versioned,
> +     * changing the order here WILL BREAK old-guest-on-newer-host compatibility.
> +     * ************************************************************************/
> +
> +    // *ENG_XYZ, e.g.: ENG_GR, ENG_CE etc.,
> +    ENGINE_INFO_TYPE_ENG_DESC = 0,
> +
> +    // HW engine ID
> +    ENGINE_INFO_TYPE_FIFO_TAG,
> +
> +    // RM_ENGINE_TYPE_*
> +    ENGINE_INFO_TYPE_RM_ENGINE_TYPE,
> +
> +    //
> +    // runlist id (meaning varies by GPU)
> +    // Valid only for Esched-driven engines
> +    //
> +    ENGINE_INFO_TYPE_RUNLIST,
> +
> +    // NV_PFIFO_INTR_MMU_FAULT_ENG_ID_*
> +    ENGINE_INFO_TYPE_MMU_FAULT_ID,
> +
> +    // ROBUST_CHANNEL_*
> +    ENGINE_INFO_TYPE_RC_MASK,
> +
> +    // Reset Bit Position. On Ampere, only valid if not _INVALID
> +    ENGINE_INFO_TYPE_RESET,
> +
> +    // Interrupt Bit Position
> +    ENGINE_INFO_TYPE_INTR,
> +
> +    // log2(MC_ENGINE_*)
> +    ENGINE_INFO_TYPE_MC,
> +
> +    // The DEV_TYPE_ENUM for this engine
> +    ENGINE_INFO_TYPE_DEV_TYPE_ENUM,
> +
> +    // The particular instance of this engine type
> +    ENGINE_INFO_TYPE_INSTANCE_ID,
> +
> +    //
> +    // The base address for this engine's NV_RUNLIST. Valid only on Ampere+
> +    // Valid only for Esched-driven engines
> +    //
> +    ENGINE_INFO_TYPE_RUNLIST_PRI_BASE,
> +
> +    //
> +    // If this entry is a host-driven engine.
> +    // Update _isEngineInfoTypeValidForOnlyHostDriven when adding any new entry.
> +    //
> +    ENGINE_INFO_TYPE_IS_HOST_DRIVEN_ENGINE,
> +
> +    //
> +    // The index into the per-engine NV_RUNLIST registers. Valid only on Ampere+
> +    // Valid only for Esched-driven engines
> +    //
> +    ENGINE_INFO_TYPE_RUNLIST_ENGINE_ID,
> +
> +    //
> +    // The base address for this engine's NV_CHRAM registers. Valid only on
> +    // Ampere+
> +    //
> +    // Valid only for Esched-driven engines
> +    //
> +    ENGINE_INFO_TYPE_CHRAM_PRI_BASE,
> +
> +    // This entry added to copy data at RMCTRL_EXPORT() call for Kernel RM
> +    ENGINE_INFO_TYPE_KERNEL_RM_MAX,
> +    // Used for iterating the engine info table by the index passed.
> +    ENGINE_INFO_TYPE_INVALID = ENGINE_INFO_TYPE_KERNEL_RM_MAX,
> +
> +    // Size of FIFO_ENGINE_LIST.engineData
> +    ENGINE_INFO_TYPE_ENGINE_DATA_ARRAY_SIZE = ENGINE_INFO_TYPE_INVALID,
> +
> +    // Input-only parameter for kfifoEngineInfoXlate.
> +    ENGINE_INFO_TYPE_PBDMA_ID
> +
> +    /* *************************************************************************
> +     * Bug 3820969
> +     * THINK BEFORE CHANGING ENUM ORDER HERE.
> +     * VGPU-guest uses this same ordering. Because this enum is not versioned,
> +     * changing the order here WILL BREAK old-guest-on-newer-host compatibility.
> +     * ************************************************************************/
> +} ENGINE_INFO_TYPE;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
> index 9139b34c75d9..a0ca9fff3f07 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
> @@ -104,6 +104,15 @@ typedef struct rpc_post_event_v17_00
>       NvU8       eventData[];
>   } rpc_post_event_v17_00;
>   
> +typedef struct rpc_rc_triggered_v17_02
> +{
> +    NvU32      nv2080EngineType;
> +    NvU32      chid;
> +    NvU32      exceptType;
> +    NvU32      scope;
> +    NvU16      partitionAttributionId;
> +} rpc_rc_triggered_v17_02;
> +
>   typedef struct rpc_os_error_log_v17_00
>   {
>       NvU32      exceptType;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 1db2ad25f504..7652b3218847 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -2760,6 +2760,7 @@ nv192_chipset = {
>   	.vfn      = { 0x00000001, ga100_vfn_new },
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
> +	.fifo     = { 0x00000001, ga102_fifo_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2779,6 +2780,7 @@ nv193_chipset = {
>   	.vfn      = { 0x00000001, ga100_vfn_new },
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
> +	.fifo     = { 0x00000001, ga102_fifo_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2798,6 +2800,7 @@ nv194_chipset = {
>   	.vfn      = { 0x00000001, ga100_vfn_new },
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
> +	.fifo     = { 0x00000001, ga102_fifo_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2817,6 +2820,7 @@ nv196_chipset = {
>   	.vfn      = { 0x00000001, ga100_vfn_new },
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
> +	.fifo     = { 0x00000001, ga102_fifo_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> @@ -2836,6 +2840,7 @@ nv197_chipset = {
>   	.vfn      = { 0x00000001, ga100_vfn_new },
>   	.disp     = { 0x00000001, ad102_disp_new },
>   	.dma      = { 0x00000001, gv100_dma_new },
> +	.fifo     = { 0x00000001, ga102_fifo_new },
>   	.sec2     = { 0x00000001, ga102_sec2_new },
>   };
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c b/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
> index d619b40a42c3..fd5ee9f0af36 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/falcon.c
> @@ -318,14 +318,14 @@ nvkm_falcon_init(struct nvkm_engine *engine)
>   }
>   
>   static void *
> -nvkm_falcon_dtor(struct nvkm_engine *engine)
> +nvkm_falcon_dtor_engine(struct nvkm_engine *engine)
>   {
>   	return nvkm_falcon(engine);
>   }
>   
>   static const struct nvkm_engine_func
>   nvkm_falcon = {
> -	.dtor = nvkm_falcon_dtor,
> +	.dtor = nvkm_falcon_dtor_engine,
>   	.oneinit = nvkm_falcon_oneinit,
>   	.init = nvkm_falcon_init,
>   	.fini = nvkm_falcon_fini,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
> index 5a074b9970ab..aff92848abfe 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
> @@ -26,5 +26,7 @@ nvkm-y += nvkm/engine/fifo/tu102.o
>   nvkm-y += nvkm/engine/fifo/ga100.o
>   nvkm-y += nvkm/engine/fifo/ga102.o
>   
> +nvkm-y += nvkm/engine/fifo/r535.o
> +
>   nvkm-y += nvkm/engine/fifo/ucgrp.o
>   nvkm-y += nvkm/engine/fifo/uchan.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> index a41a460ca9d4..c8ce7ff18713 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> @@ -609,7 +609,7 @@ ga100_fifo_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
>   	       struct nvkm_fifo **pfifo)
>   {
>   	if (nvkm_gsp_rm(device->gsp))
> -		return -ENODEV;
> +		return r535_fifo_new(&ga100_fifo, device, type, inst, pfifo);
>   
>   	return nvkm_fifo_new_(&ga100_fifo, device, type, inst, pfifo);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> index 3701de24fefa..755235f55b3a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
> @@ -36,7 +36,7 @@ ga102_fifo = {
>   	.engn = &ga100_engn,
>   	.engn_ce = &ga100_engn_ce,
>   	.cgrp = {{ 0, 0, KEPLER_CHANNEL_GROUP_A  }, &ga100_cgrp, .force = true },
> -	.chan = {{ 0, 0, AMPERE_CHANNEL_GPFIFO_B }, &ga100_chan },
> +	.chan = {{ 0, 0, AMPERE_CHANNEL_GPFIFO_A }, &ga100_chan },
>   };
>   
>   int
> @@ -44,7 +44,7 @@ ga102_fifo_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
>   	       struct nvkm_fifo **pfifo)
>   {
>   	if (nvkm_gsp_rm(device->gsp))
> -		return -ENODEV;
> +		return r535_fifo_new(&ga102_fifo, device, type, inst, pfifo);
>   
>   	return nvkm_fifo_new_(&ga102_fifo, device, type, inst, pfifo);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> index 4a3ef0277738..a0f3277605a5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
> @@ -60,6 +60,8 @@ struct nvkm_fifo_func {
>   	} chan;
>   };
>   
> +int r535_fifo_new(const struct nvkm_fifo_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
> +		  struct nvkm_fifo **);
>   int nvkm_fifo_new_(const struct nvkm_fifo_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
>   		   struct nvkm_fifo **);
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> new file mode 100644
> index 000000000000..effb97d3eb3c
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
> @@ -0,0 +1,519 @@
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
> +#include "priv.h"
> +#include "cgrp.h"
> +#include "chan.h"
> +#include "chid.h"
> +#include "runl.h"
> +
> +#include <core/gpuobj.h>
> +#include <subdev/gsp.h>
> +#include <subdev/mmu.h>
> +#include <subdev/vfn.h>
> +
> +#include <nvhw/drf.h>
> +
> +#include <nvrm/nvtypes.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h>
> +#include <nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h>
> +#include <nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h>
> +#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h>
> +
> +static u32
> +r535_chan_doorbell_handle(struct nvkm_chan *chan)
> +{
> +	return (chan->cgrp->runl->id << 16) | chan->id;
> +}
> +
> +static void
> +r535_chan_stop(struct nvkm_chan *chan)
> +{
> +}
> +
> +static void
> +r535_chan_start(struct nvkm_chan *chan)
> +{
> +}

Maybe check function pointers instead of creating all those empty functions here and below.

> +
> +static void
> +r535_chan_ramfc_clear(struct nvkm_chan *chan)
> +{
> +	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
> +
> +	nvkm_gsp_rm_free(&chan->rm.object);
> +
> +	dma_free_coherent(fifo->engine.subdev.device->dev, fifo->rm.mthdbuf_size,
> +			  chan->rm.mthdbuf.ptr, chan->rm.mthdbuf.addr);
> +}
> +
> +#define CHID_PER_USERD 8
> +
> +static int
> +r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm, bool priv)
> +{
> +	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
> +	struct nvkm_engn *engn;
> +	NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
> +	const int userd_p = chan->id / CHID_PER_USERD;
> +	const int userd_i = chan->id % CHID_PER_USERD;
> +	u32 eT = ~0;
> +	int ret;
> +
> +	nvkm_runl_foreach_engn(engn, chan->cgrp->runl) {
> +		eT = engn->id;
> +		break;
> +	}
> +
> +	if (WARN_ON(eT == ~0))
> +		return -EINVAL;
> +
> +	chan->rm.mthdbuf.ptr = dma_alloc_coherent(fifo->engine.subdev.device->dev,
> +						  fifo->rm.mthdbuf_size,
> +						  &chan->rm.mthdbuf.addr, GFP_KERNEL);
> +	if (!chan->rm.mthdbuf.ptr)
> +		return -ENOMEM;
> +
> +	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, 0xf1f00000 | chan->id,
> +				     fifo->func->chan.user.oclass, sizeof(*args),
> +				     &chan->rm.object);
> +	if (WARN_ON(IS_ERR(args)))
> +		return PTR_ERR(args);
> +
> +	args->gpFifoOffset = offset;
> +	args->gpFifoEntries = length / 8;
> +
> +	args->flags  = NVDEF(NVOS04, FLAGS, CHANNEL_TYPE, PHYSICAL);
> +	args->flags |= NVDEF(NVOS04, FLAGS, VPR, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_MAP_REFCOUNTING, FALSE);
> +	args->flags |= NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, chan->runq);
> +	if (!priv)
> +		args->flags |= NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, FALSE);
> +	else
> +		args->flags |= NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, TRUE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, DELAY_CHANNEL_SCHEDULING, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_DENY_PHYSICAL_MODE_CE, FALSE);
> +
> +	args->flags |= NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_VALUE, userd_i);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_FIXED, FALSE);
> +	args->flags |= NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_VALUE, userd_p);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_FIXED, TRUE);
> +
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_DENY_AUTH_LEVEL_PRIV, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_SCRUBBER, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_CLIENT_MAP_FIFO, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, SET_EVICT_LAST_CE_PREFETCH_CHANNEL, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_VGPU_PLUGIN_CONTEXT, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_PBDMA_ACQUIRE_TIMEOUT, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, GROUP_CHANNEL_THREAD, DEFAULT);
> +	args->flags |= NVDEF(NVOS04, FLAGS, MAP_CHANNEL, FALSE);
> +	args->flags |= NVDEF(NVOS04, FLAGS, SKIP_CTXBUFFER_ALLOC, FALSE);
> +
> +	args->hVASpace = chan->vmm->rm.object.handle;
> +	args->engineType = eT;
> +
> +	args->instanceMem.base = chan->inst->addr;
> +	args->instanceMem.size = chan->inst->size;
> +	args->instanceMem.addressSpace = 2;
> +	args->instanceMem.cacheAttrib = 1;
> +
> +	args->userdMem.base = nvkm_memory_addr(chan->userd.mem) + chan->userd.base;
> +	args->userdMem.size = fifo->func->chan.func->userd->size;
> +	args->userdMem.addressSpace = 2;
> +	args->userdMem.cacheAttrib = 1;
> +
> +	args->ramfcMem.base = chan->inst->addr + 0;
> +	args->ramfcMem.size = 0x200;
> +	args->ramfcMem.addressSpace = 2;
> +	args->ramfcMem.cacheAttrib = 1;
> +
> +	args->mthdbufMem.base = chan->rm.mthdbuf.addr;
> +	args->mthdbufMem.size = fifo->rm.mthdbuf_size;
> +	args->mthdbufMem.addressSpace = 1;
> +	args->mthdbufMem.cacheAttrib = 0;
> +
> +	if (!priv)
> +		args->internalFlags = NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, USER);
> +	else
> +		args->internalFlags = NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, ADMIN);
> +	args->internalFlags |= NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ERROR_NOTIFIER_TYPE, NONE);
> +	args->internalFlags |= NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ECC_ERROR_NOTIFIER_TYPE, NONE);
> +
> +	ret = nvkm_gsp_rm_alloc_wr(&chan->rm.object, args);
> +	if (ret)
> +		return ret;
> +
> +	if (1) {

Leftover from some experiments? Which ones? Or do we need actual conditions here for some cases?

> +		NVA06F_CTRL_GPFIFO_SCHEDULE_PARAMS *ctrl;
> +
> +		if (1) {

Same here.

> +			NVA06F_CTRL_BIND_PARAMS *ctrl;
> +
> +			ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
> +						    NVA06F_CTRL_CMD_BIND, sizeof(*ctrl));
> +			if (WARN_ON(IS_ERR(ctrl)))
> +				return PTR_ERR(ctrl);
> +
> +			ctrl->engineType = eT;
> +
> +			ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ctrl = nvkm_gsp_rm_ctrl_get(&chan->rm.object,
> +					    NVA06F_CTRL_CMD_GPFIFO_SCHEDULE, sizeof(*ctrl));
> +		if (WARN_ON(IS_ERR(ctrl)))
> +			return PTR_ERR(ctrl);
> +
> +		ctrl->bEnable = 1;
> +		ret = nvkm_gsp_rm_ctrl_wr(&chan->rm.object, ctrl);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct nvkm_chan_func_ramfc
> +r535_chan_ramfc = {
> +	.write = r535_chan_ramfc_write,
> +	.clear = r535_chan_ramfc_clear,
> +	.devm = 0xfff,
> +	.priv = true,
> +};
> +
> +struct r535_chan_userd {
> +	struct nvkm_memory *mem;
> +	struct nvkm_memory *map;
> +	int chid;
> +	u32 used;
> +
> +	struct list_head head;
> +} *userd;
> +
> +static void
> +r535_chan_id_put(struct nvkm_chan *chan)
> +{
> +	struct nvkm_runl *runl = chan->cgrp->runl;
> +	struct nvkm_fifo *fifo = runl->fifo;
> +	struct r535_chan_userd *userd;
> +
> +	mutex_lock(&fifo->userd.mutex);
> +	list_for_each_entry(userd, &fifo->userd.list, head) {
> +		if (userd->map == chan->userd.mem) {
> +			u32 chid = chan->userd.base / chan->func->userd->size;
> +
> +			userd->used &= ~BIT(chid);
> +			if (!userd->used) {
> +				nvkm_memory_unref(&userd->map);
> +				nvkm_memory_unref(&userd->mem);
> +				nvkm_chid_put(runl->chid, userd->chid, &chan->cgrp->lock);
> +				list_del(&userd->head);
> +			}
> +
> +			break;
> +		}
> +	}
> +	mutex_unlock(&fifo->userd.mutex);
> +
> +}
> +
> +static int
> +r535_chan_id_get_locked(struct nvkm_chan *chan, struct nvkm_memory *muserd, u64 ouserd)
> +{
> +	const u32 userd_size = CHID_PER_USERD * chan->func->userd->size;
> +	struct nvkm_runl *runl = chan->cgrp->runl;
> +	struct nvkm_fifo *fifo = runl->fifo;
> +	struct r535_chan_userd *userd;
> +	u32 chid;
> +	int ret;
> +
> +	if (ouserd + chan->func->userd->size >= userd_size ||
> +	    (ouserd & (chan->func->userd->size - 1))) {
> +		RUNL_DEBUG(runl, "ouserd %llx", ouserd);
> +		return -EINVAL;
> +	}
> +
> +	chid = ouserd / chan->func->userd->size;
> +
> +	list_for_each_entry(userd, &fifo->userd.list, head) {
> +		if (userd->mem == muserd) {
> +			if (userd->used & BIT(chid))
> +				return -EBUSY;
> +			break;
> +		}
> +	}
> +
> +	if (&userd->head == &fifo->userd.list) {
> +		if (nvkm_memory_size(muserd) < userd_size) {
> +			RUNL_DEBUG(runl, "userd too small");
> +			return -EINVAL;
> +		}
> +
> +		userd = kzalloc(sizeof(*userd), GFP_KERNEL);
> +		if (!userd)
> +			return -ENOMEM;
> +
> +		userd->chid = nvkm_chid_get(runl->chid, chan);
> +		if (userd->chid < 0) {
> +			ret = userd->chid;
> +			kfree(userd);
> +			return ret;
> +		}
> +
> +		userd->mem = nvkm_memory_ref(muserd);
> +
> +		ret = nvkm_memory_kmap(userd->mem, &userd->map);
> +		if (ret) {

Don't we need to nvkm_memory_unref(userd->mem) here?

> +			nvkm_chid_put(runl->chid, userd->chid, &chan->cgrp->lock);
> +			kfree(userd);
> +			return ret;
> +		}
> +
> +
> +		list_add(&userd->head, &fifo->userd.list);
> +	}
> +
> +	userd->used |= BIT(chid);
> +
> +	chan->userd.mem = nvkm_memory_ref(userd->map);
> +	chan->userd.base = ouserd;
> +
> +	return (userd->chid * CHID_PER_USERD) + chid;
> +}
> +
> +static int
> +r535_chan_id_get(struct nvkm_chan *chan, struct nvkm_memory *muserd, u64 ouserd)
> +{
> +	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
> +	int ret;
> +
> +	mutex_lock(&fifo->userd.mutex);
> +	ret = r535_chan_id_get_locked(chan, muserd, ouserd);
> +	mutex_unlock(&fifo->userd.mutex);
> +	return ret;
> +}
> +
> +static const struct nvkm_chan_func
> +r535_chan = {
> +	.id_get = r535_chan_id_get,
> +	.id_put = r535_chan_id_put,
> +	.inst = &gf100_chan_inst,
> +	.userd = &gv100_chan_userd,
> +	.ramfc = &r535_chan_ramfc,
> +	.start = r535_chan_start,
> +	.stop = r535_chan_stop,
> +	.doorbell_handle = r535_chan_doorbell_handle,
> +};
> +
> +static const struct nvkm_cgrp_func
> +r535_cgrp = {
> +};
> +
> +static void
> +r535_runl_allow(struct nvkm_runl *runl, u32 engm)
> +{
> +}
> +
> +static void
> +r535_runl_block(struct nvkm_runl *runl, u32 engm)
> +{
> +}
> +
> +static const struct nvkm_runl_func
> +r535_runl = {
> +	.block = r535_runl_block,
> +	.allow = r535_runl_allow,
> +};
> +
> +static int
> +r535_fifo_2080_type(enum nvkm_subdev_type type, int inst)
> +{
> +	switch (type) {
> +	case NVKM_ENGINE_GR: return NV2080_ENGINE_TYPE_GR0;
> +	case NVKM_ENGINE_CE: return NV2080_ENGINE_TYPE_COPY0 + inst;
> +	case NVKM_ENGINE_SEC2: return NV2080_ENGINE_TYPE_SEC2;
> +	case NVKM_ENGINE_NVDEC: return NV2080_ENGINE_TYPE_NVDEC0 + inst;
> +	case NVKM_ENGINE_NVENC: return NV2080_ENGINE_TYPE_NVENC0 + inst;
> +	case NVKM_ENGINE_NVJPG: return NV2080_ENGINE_TYPE_NVJPEG0 + inst;
> +	case NVKM_ENGINE_OFA: return NV2080_ENGINE_TYPE_OFA;
> +	case NVKM_ENGINE_SW: return NV2080_ENGINE_TYPE_SW;
> +	default:
> +		break;
> +	}
> +
> +	WARN_ON(1);
> +	return -EINVAL;
> +}
> +
> +static int
> +r535_fifo_engn_type(RM_ENGINE_TYPE rm, enum nvkm_subdev_type *ptype)
> +{
> +	switch (rm) {
> +	case RM_ENGINE_TYPE_GR0:
> +		*ptype = NVKM_ENGINE_GR;
> +		return 0;
> +	case RM_ENGINE_TYPE_COPY0...RM_ENGINE_TYPE_COPY9:
> +		*ptype = NVKM_ENGINE_CE;
> +		return rm - RM_ENGINE_TYPE_COPY0;
> +	case RM_ENGINE_TYPE_NVDEC0...RM_ENGINE_TYPE_NVDEC7:
> +		*ptype = NVKM_ENGINE_NVDEC;
> +		return rm - RM_ENGINE_TYPE_NVDEC0;
> +	case RM_ENGINE_TYPE_NVENC0...RM_ENGINE_TYPE_NVENC2:
> +		*ptype = NVKM_ENGINE_NVENC;
> +		return rm - RM_ENGINE_TYPE_NVENC0;
> +	case RM_ENGINE_TYPE_SW:
> +		*ptype = NVKM_ENGINE_SW;
> +		return 0;
> +	case RM_ENGINE_TYPE_SEC2:
> +		*ptype = NVKM_ENGINE_SEC2;
> +		return 0;
> +	case RM_ENGINE_TYPE_NVJPEG0...RM_ENGINE_TYPE_NVJPEG7:
> +		*ptype = NVKM_ENGINE_NVJPG;
> +		return rm - RM_ENGINE_TYPE_NVJPEG0;
> +	case RM_ENGINE_TYPE_OFA:
> +		*ptype = NVKM_ENGINE_OFA;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int
> +r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
> +{
> +	struct nvkm_subdev *subdev = &fifo->engine.subdev;
> +	struct nvkm_gsp *gsp = subdev->device->gsp;
> +	struct nvkm_runl *runl;
> +	struct nvkm_engn *engn;
> +	u32 cgids = 2048;
> +	u32 chids = 2048 / CHID_PER_USERD;
> +	int ret;
> +	NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
> +
> +	if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, cgids, 0, cgids, &fifo->cgid)) ||
> +	    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, chids, 0, chids, &fifo->chid)))
> +		return ret;
> +
> +	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
> +				   NV2080_CTRL_CMD_FIFO_GET_DEVICE_INFO_TABLE, sizeof(*ctrl));
> +	if (WARN_ON(IS_ERR(ctrl)))
> +		return PTR_ERR(ctrl);
> +
> +	for (int i = 0; i < ctrl->numEntries; i++) {
> +		const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
> +		const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
> +
> +		runl = nvkm_runl_get(fifo, id, addr);
> +		if (!runl) {
> +			runl = nvkm_runl_new(fifo, id, addr, 0);
> +			if (WARN_ON(IS_ERR(runl)))
> +				continue;
> +		}
> +	}
> +
> +	for (int i = 0; i < ctrl->numEntries; i++) {
> +		const u32 addr = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST_PRI_BASE];
> +		const u32 rmid = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RM_ENGINE_TYPE];
> +		const u32 id = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_RUNLIST];
> +		enum nvkm_subdev_type type;
> +		int inst, nv2080;
> +
> +		runl = nvkm_runl_get(fifo, id, addr);

We should fix how get() and put() suffixes are used, it makes it hard to understand the code
and spot memory leaks.

> +		if (!runl)
> +			continue;
> +
> +		inst = r535_fifo_engn_type(rmid, &type);
> +		if (inst < 0) {
> +			nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", rmid);
> +			nvkm_runl_del(runl);
> +			continue;
> +		}
> +
> +		nv2080 = r535_fifo_2080_type(type, inst);
> +		if (nv2080 < 0) {
> +			nvkm_runl_del(runl);
> +			continue;
> +		}
> +
> +		switch (type) {
> +		case NVKM_ENGINE_SW:
> +			continue;
> +		default:
> +			engn = NULL;
> +			break;
> +		}
> +
> +		if (!engn) {
> +			nvkm_runl_del(runl);
> +			continue;
> +		}
> +	}
> +
> +	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
> +
> +	{
> +		NV2080_CTRL_CE_GET_FAULT_METHOD_BUFFER_SIZE_PARAMS *ctrl;
> +
> +		ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
> +					   NV2080_CTRL_CMD_CE_GET_FAULT_METHOD_BUFFER_SIZE,
> +					   sizeof(*ctrl));
> +		if (IS_ERR(ctrl))
> +			return PTR_ERR(ctrl);
> +
> +		fifo->rm.mthdbuf_size = ctrl->size;
> +
> +		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +r535_fifo_dtor(struct nvkm_fifo *fifo)
> +{
> +	kfree(fifo->func);
> +}
> +
> +int
> +r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
> +	      enum nvkm_subdev_type type, int inst, struct nvkm_fifo **pfifo)
> +{
> +	struct nvkm_fifo_func *rm;
> +
> +	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	rm->dtor = r535_fifo_dtor;
> +	rm->runl_ctor = r535_fifo_runl_ctor;
> +	rm->runl = &r535_runl;
> +	rm->cgrp = hw->cgrp;
> +	rm->cgrp.func = &r535_cgrp;
> +	rm->chan = hw->chan;
> +	rm->chan.func = &r535_chan;
> +	rm->nonstall = &ga100_fifo_nonstall;
> +	rm->nonstall_ctor = ga100_fifo_nonstall_ctor;
> +
> +	return nvkm_fifo_new_(rm, device, type, inst, pfifo);
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
> index f310091b74e4..1d39a6840a40 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
> @@ -284,7 +284,7 @@ tu102_fifo_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
>   	       struct nvkm_fifo **pfifo)
>   {
>   	if (nvkm_gsp_rm(device->gsp))
> -		return -ENODEV;
> +		return r535_fifo_new(&tu102_fifo, device, type, inst, pfifo);
>   
>   	return nvkm_fifo_new_(&tu102_fifo, device, type, inst, pfifo);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index acc689c336c5..55ecb4d42c51 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -24,6 +24,7 @@
>   #include <core/pci.h>
>   #include <subdev/timer.h>
>   #include <subdev/vfn.h>
> +#include <engine/fifo/chan.h>
>   #include <engine/sec2.h>
>   
>   #include <nvfw/fw.h>
> @@ -1226,6 +1227,33 @@ r535_gsp_msg_os_error_log(void *priv, u32 fn, void *repv, u32 repc)
>   	return 0;
>   }
>   
> +static int
> +r535_gsp_msg_rc_triggered(void *priv, u32 fn, void *repv, u32 repc)
> +{
> +	rpc_rc_triggered_v17_02 *msg = repv;
> +	struct nvkm_gsp *gsp = priv;
> +	struct nvkm_subdev *subdev = &gsp->subdev;
> +	struct nvkm_chan *chan;
> +	unsigned long flags;
> +
> +	if (WARN_ON(repc < sizeof(*msg)))
> +		return -EINVAL;
> +
> +	nvkm_error(subdev, "rc engn:%08x chid:%d type:%d scope:%d part:%d\n",
> +		   msg->nv2080EngineType, msg->chid, msg->exceptType, msg->scope,
> +		   msg->partitionAttributionId);
> +
> +	chan = nvkm_chan_get_chid(&subdev->device->fifo->engine, msg->chid / 8, &flags);
> +	if (!chan) {
> +		nvkm_error(subdev, "rc chid:%d not found!\n", msg->chid);
> +		return 0;
> +	}
> +
> +	nvkm_chan_error(chan, false);
> +	nvkm_chan_put(&chan, flags);
> +	return 0;
> +}
> +
>   static int
>   r535_gsp_msg_mmu_fault_queued(void *priv, u32 fn, void *repv, u32 repc)
>   {
> @@ -2001,6 +2029,8 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
>   	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
>   			      r535_gsp_msg_run_cpu_sequencer, gsp);
>   	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_POST_EVENT, r535_gsp_msg_post_event, gsp);
> +	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_RC_TRIGGERED,
> +			      r535_gsp_msg_rc_triggered, gsp);
>   	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
>   			      r535_gsp_msg_mmu_fault_queued, gsp);
>   	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg_os_error_log, gsp);

