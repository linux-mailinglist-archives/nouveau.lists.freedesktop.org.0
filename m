Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14D7ADDEB
	for <lists+nouveau@lfdr.de>; Mon, 25 Sep 2023 19:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0EE10E263;
	Mon, 25 Sep 2023 17:44:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E873510E0E6
 for <nouveau@lists.freedesktop.org>; Mon, 25 Sep 2023 17:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695663859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z34V/DBwTEjSiN6paJccBBZ6bnNj5FlqFhoRd2/fImw=;
 b=ICoQHvWlY/scUtXh2RYT5vLatko4zs9/li62KIBqbvE5XAmdpb/8V6/JogQKIERNDVQVLb
 OlHat/cdh7A550AIXHBlwpa/+q0ToY6LXLIlNeNpCWjJ1S/5KuuCcWsCl9xCUMGyeHHrD0
 qgbPWuqQrg5m1dSY7KUAwI1hUxtQKVE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-mZ1L3NPDNWSXrXS29qdBZQ-1; Mon, 25 Sep 2023 13:44:17 -0400
X-MC-Unique: mZ1L3NPDNWSXrXS29qdBZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30932d15a30so5365516f8f.1
 for <nouveau@lists.freedesktop.org>; Mon, 25 Sep 2023 10:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695663855; x=1696268655;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z34V/DBwTEjSiN6paJccBBZ6bnNj5FlqFhoRd2/fImw=;
 b=GOYCgyjAquuIG+F0H6esMHkmzU1y6pYbyBitkzsOdvnLrL2S7oQEVcjPX5NcR+6Wv8
 +MiO9o8uGig0M8aEBAlP2LbE0AgFmMev2XthBZSDGk2CYoEFrvM+iqW89zWkEI+ZD0/7
 2fTo0udyTpYoEd9m8hID+742KoX9W6I54mkmj+BAB8ncyWl/oSEacc05XHUXDRhERm4z
 Gg9bXFO39mEYezqOEdTwDDTHmyV7RWWG0jgLc3sMPAu2HBDNHpCX91NnVNkNTiob0RfB
 IWJcGNJePCqojdPNyUqB/52xwhKO2dk7iBzo+woj97LWji4uRROUmAunsU7WiajjfUaA
 yv2g==
X-Gm-Message-State: AOJu0Yy5RJjYEaahlBaca05//nZ7GoYLoSTTx79jxGLu/Zpkkur7bxtp
 hqs5VvtbBBc3SX2wK20ZtKVyJr9VIdisOStvoZETOQQ80sEI8DEeBhXEPgb/s3nQa0s8S6Vz2rj
 +ZqWMknZw8qe1wL/5U0rifQC/uqGxOoCOYQLfE+E15XTXUAUiarvr+PGnwOuxAl4Aj5i8T2Upkm
 lpOqmG
X-Received: by 2002:a5d:6a8c:0:b0:317:ef76:b778 with SMTP id
 s12-20020a5d6a8c000000b00317ef76b778mr7667919wru.63.1695663855339; 
 Mon, 25 Sep 2023 10:44:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpbWehRfPAUPE0ntuOvsDPPozFx9JSJHMNfueOXaUlSOU2kV8Eidy78iUvEdNvAJFdQO0TVw==
X-Received: by 2002:a5d:6a8c:0:b0:317:ef76:b778 with SMTP id
 s12-20020a5d6a8c000000b00317ef76b778mr7667894wru.63.1695663854651; 
 Mon, 25 Sep 2023 10:44:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a5d50c4000000b0031fa870d4b3sm12374677wrt.60.2023.09.25.10.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Sep 2023 10:44:14 -0700 (PDT)
Message-ID: <1847188f-448d-159e-2b55-3762ba117a60@redhat.com>
Date: Mon, 25 Sep 2023 19:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-35-skeggsb@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230918202149.4343-35-skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 34/44] drm/nouveau/gsp/r535: add support for
 rm alloc
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
> Adds the plumbing to be able to allocate and free RM objects, and
> implements RM client/device/subdevice allocation with it.
> 
> These will be used by subsequent patches.
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 131 +++++++++++++
>   .../common/sdk/nvidia/inc/class/cl0000.h      |  38 ++++
>   .../common/sdk/nvidia/inc/class/cl0080.h      |  43 ++++
>   .../common/sdk/nvidia/inc/class/cl2080.h      |  35 ++++
>   .../common/sdk/nvidia/inc/nvlimits.h          |  31 +++
>   .../nvidia/generated/g_rpc-structures.h       |  19 ++
>   .../nvidia/generated/g_sdk-structures.h       |  37 ++++
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 184 ++++++++++++++++++
>   8 files changed, 518 insertions(+)
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h
>   create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 8f0805474981..94b14f906df6 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -158,7 +158,24 @@ struct nvkm_gsp {
>   		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
>   		void *(*rm_ctrl_push)(struct nvkm_gsp_object *, void *argv, u32 repc);
>   		void (*rm_ctrl_done)(struct nvkm_gsp_object *, void *repv);
> +
> +		void *(*rm_alloc_get)(struct nvkm_gsp_object *, u32 oclass, u32 argc);
> +		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv, u32 repc);
> +		void (*rm_alloc_done)(struct nvkm_gsp_object *, void *repv);
> +
> +		int (*rm_free)(struct nvkm_gsp_object *);
> +
> +		int (*client_ctor)(struct nvkm_gsp *, struct nvkm_gsp_client *);
> +		void (*client_dtor)(struct nvkm_gsp_client *);
> +
> +		int (*device_ctor)(struct nvkm_gsp_client *, struct nvkm_gsp_device *);
> +		void (*device_dtor)(struct nvkm_gsp_device *);
>   	} *rm;
> +
> +	struct {
> +		struct mutex mutex;;
> +		struct idr idr;
> +	} client_id;
>   };
>   
>   static inline bool
> @@ -247,6 +264,120 @@ nvkm_gsp_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
>   	object->client->gsp->rm->rm_ctrl_done(object, repv);
>   }
>   
> +static inline void *
> +nvkm_gsp_rm_alloc_get(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u32 argc,
> +		      struct nvkm_gsp_object *object)
> +{
> +	struct nvkm_gsp_client *client = parent->client;
> +	struct nvkm_gsp *gsp = client->gsp;
> +	void *argv;
> +
> +	object->client = parent->client;
> +	object->parent = parent;
> +	object->handle = handle;
> +
> +	argv = gsp->rm->rm_alloc_get(object, oclass, argc);
> +	if (IS_ERR_OR_NULL(argv)) {
> +		object->client = NULL;

Why do we need to set ->client to NULL here? What about ->parent and ->handle?

> +		return argv;
> +	}
> +
> +	return argv;
> +}
> +
> +static inline void *
> +nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
> +{
> +	void *repv = object->client->gsp->rm->rm_alloc_push(object, argv, repc);
> +
> +	if (IS_ERR(repv))
> +		object->client = NULL;
> +
> +	return repv;
> +}
> +
> +static inline int
> +nvkm_gsp_rm_alloc_wr(struct nvkm_gsp_object *object, void *argv)
> +{
> +	void *repv = nvkm_gsp_rm_alloc_push(object, argv, 0);
> +
> +	if (IS_ERR(repv))
> +		return PTR_ERR(repv);
> +
> +	return 0;
> +}
> +
> +static inline void
> +nvkm_gsp_rm_alloc_done(struct nvkm_gsp_object *object, void *repv)
> +{
> +	object->client->gsp->rm->rm_alloc_done(object, repv);
> +}
> +
> +static inline int
> +nvkm_gsp_rm_alloc(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u32 argc,
> +		  struct nvkm_gsp_object *object)
> +{
> +	void *argv = nvkm_gsp_rm_alloc_get(parent, handle, oclass, argc, object);
> +
> +	if (IS_ERR_OR_NULL(argv))
> +		return argv ? PTR_ERR(argv) : -EIO;
> +
> +	return nvkm_gsp_rm_alloc_wr(object, argv);
> +}
> +
> +static inline int
> +nvkm_gsp_rm_free(struct nvkm_gsp_object *object)
> +{
> +	if (object->client)
> +		return object->client->gsp->rm->rm_free(object);
> +
> +	return 0;
> +}
> +
> +static inline int
> +nvkm_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
> +{
> +	if (WARN_ON(!gsp->rm))
> +		return -ENOSYS;
> +
> +	return gsp->rm->client_ctor(gsp, client);
> +}
> +
> +static inline void
> +nvkm_gsp_client_dtor(struct nvkm_gsp_client *client)
> +{
> +	if (client->gsp)
> +		client->gsp->rm->client_dtor(client);
> +}
> +
> +static inline int
> +nvkm_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
> +{
> +	return client->gsp->rm->device_ctor(client, device);
> +}
> +
> +static inline void
> +nvkm_gsp_device_dtor(struct nvkm_gsp_device *device)
> +{
> +	if (device->object.client)
> +		device->object.client->gsp->rm->device_dtor(device);
> +}
> +
> +static inline int
> +nvkm_gsp_client_device_ctor(struct nvkm_gsp *gsp,
> +			    struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
> +{
> +	int ret = nvkm_gsp_client_ctor(gsp, client);
> +
> +	if (ret == 0) {
> +		ret = nvkm_gsp_device_ctor(client, device);
> +		if (ret)
> +			nvkm_gsp_client_dtor(client);
> +	}
> +
> +	return ret;
> +}
> +
>   int gv100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
>   int tu102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
>   int tu116_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h
> new file mode 100644
> index 000000000000..dfb3b3e0c45b
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h
> @@ -0,0 +1,38 @@
> +#ifndef __src_common_sdk_nvidia_inc_class_cl0000_h__
> +#define __src_common_sdk_nvidia_inc_class_cl0000_h__
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h>
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +#define NV01_ROOT        (0x0U) /* finn: Evaluated from "NV0000_ALLOC_PARAMETERS_MESSAGE_ID" */
> +
> +typedef struct NV0000_ALLOC_PARAMETERS {
> +    NvHandle hClient; /* CORERM-2934: hClient must remain the first member until all allocations use these params */
> +    NvU32    processID;
> +    char     processName[NV_PROC_NAME_MAX_LENGTH];
> +} NV0000_ALLOC_PARAMETERS;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h
> new file mode 100644
> index 000000000000..aeab857b1e50
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h
> @@ -0,0 +1,43 @@
> +#ifndef __src_common_sdk_nvidia_inc_class_cl0080_h__
> +#define __src_common_sdk_nvidia_inc_class_cl0080_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +#define NV01_DEVICE_0      (0x80U) /* finn: Evaluated from "NV0080_ALLOC_PARAMETERS_MESSAGE_ID" */
> +
> +typedef struct NV0080_ALLOC_PARAMETERS {
> +    NvU32    deviceId;
> +    NvHandle hClientShare;
> +    NvHandle hTargetClient;
> +    NvHandle hTargetDevice;
> +    NvV32    flags;
> +    NV_DECLARE_ALIGNED(NvU64 vaSpaceSize, 8);
> +    NV_DECLARE_ALIGNED(NvU64 vaStartInternal, 8);
> +    NV_DECLARE_ALIGNED(NvU64 vaLimitInternal, 8);
> +    NvV32    vaMode;
> +} NV0080_ALLOC_PARAMETERS;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h
> new file mode 100644
> index 000000000000..a0106cd77cd9
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h
> @@ -0,0 +1,35 @@
> +#ifndef __src_common_sdk_nvidia_inc_class_cl2080_h__
> +#define __src_common_sdk_nvidia_inc_class_cl2080_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2002-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +#define NV20_SUBDEVICE_0      (0x2080U) /* finn: Evaluated from "NV2080_ALLOC_PARAMETERS_MESSAGE_ID" */
> +
> +typedef struct NV2080_ALLOC_PARAMETERS {
> +    NvU32 subDeviceId;
> +} NV2080_ALLOC_PARAMETERS;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h
> new file mode 100644
> index 000000000000..12393c8aaf29
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h
> @@ -0,0 +1,31 @@
> +#ifndef __src_common_sdk_nvidia_inc_nvlimits_h__
> +#define __src_common_sdk_nvidia_inc_nvlimits_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2017 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +#define NV_PROC_NAME_MAX_LENGTH 100U
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
> index 1ae0a97df392..38d42cdbc9cb 100644
> --- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
> @@ -1,5 +1,6 @@
>   #ifndef __src_nvidia_generated_g_rpc_structures_h__
>   #define __src_nvidia_generated_g_rpc_structures_h__
> +#include <nvrm/535.54.03/nvidia/generated/g_sdk-structures.h>
>   
>   /* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
>   
> @@ -26,6 +27,11 @@
>    * DEALINGS IN THE SOFTWARE.
>    */
>   
> +typedef struct rpc_free_v03_00
> +{
> +    NVOS00_PARAMETERS_v03_00 params;
> +} rpc_free_v03_00;
> +
>   typedef struct rpc_unloading_guest_driver_v1F_07
>   {
>       NvBool     bInPMTransition;
> @@ -33,6 +39,19 @@ typedef struct rpc_unloading_guest_driver_v1F_07
>       NvU32      newLevel;
>   } rpc_unloading_guest_driver_v1F_07;
>   
> +typedef struct rpc_gsp_rm_alloc_v03_00
> +{
> +    NvHandle   hClient;
> +    NvHandle   hParent;
> +    NvHandle   hObject;
> +    NvU32      hClass;
> +    NvU32      status;
> +    NvU32      paramsSize;
> +    NvU32      flags;
> +    NvU8       reserved[4];
> +    NvU8       params[];
> +} rpc_gsp_rm_alloc_v03_00;
> +
>   typedef struct rpc_gsp_rm_control_v03_00
>   {
>       NvHandle   hClient;
> diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h
> new file mode 100644
> index 000000000000..4ed66c13bb91
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h
> @@ -0,0 +1,37 @@
> +#ifndef __src_nvidia_generated_g_sdk_structures_h__
> +#define __src_nvidia_generated_g_sdk_structures_h__
> +
> +/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
> +
> +/*
> + * SPDX-FileCopyrightText: Copyright (c) 2008-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
> +typedef struct NVOS00_PARAMETERS_v03_00
> +{
> +    NvHandle   hRoot;
> +    NvHandle   hObjectParent;
> +    NvHandle   hObjectOld;
> +    NvV32      status;
> +} NVOS00_PARAMETERS_v03_00;
> +
> +#endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 0fafb8f1e88d..c1a5f0696e85 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -28,6 +28,9 @@
>   #include <nvfw/fw.h>
>   
>   #include <nvrm/nvtypes.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h>
> +#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h>
>   #include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
>   #include <nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h>
>   #include <nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h>
> @@ -354,6 +357,169 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
>   	return repv;
>   }
>   
> +static void
> +r535_gsp_device_dtor(struct nvkm_gsp_device *device)
> +{
> +	nvkm_gsp_rm_free(&device->subdevice);
> +	nvkm_gsp_rm_free(&device->object);
> +}
> +
> +static int
> +r535_gsp_subdevice_ctor(struct nvkm_gsp_device *device)
> +{
> +	NV2080_ALLOC_PARAMETERS *args;
> +
> +	return nvkm_gsp_rm_alloc(&device->object, 0x5d1d0000, NV20_SUBDEVICE_0, sizeof(*args),
> +				 &device->subdevice);
> +}
> +
> +static int
> +r535_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
> +{
> +	NV0080_ALLOC_PARAMETERS *args;
> +	int ret;
> +
> +	args = nvkm_gsp_rm_alloc_get(&client->object, 0xde1d0000, NV01_DEVICE_0, sizeof(*args),

What is this handle (0xde1d0000)?

> +				     &device->object);
> +	if (IS_ERR(args))
> +		return PTR_ERR(args);
> +
> +	args->hClientShare = client->object.handle;

Is the handle used for anything else than this?

> +
> +	ret = nvkm_gsp_rm_alloc_wr(&device->object, args);
> +	if (ret)
> +		return ret;
> +
> +	ret = r535_gsp_subdevice_ctor(device);
> +	if (ret)
> +		nvkm_gsp_rm_free(&device->object);
> +
> +	return ret;
> +}
> +
> +static void
> +r535_gsp_client_dtor(struct nvkm_gsp_client *client)
> +{
> +	struct nvkm_gsp *gsp = client->gsp;
> +
> +	nvkm_gsp_rm_free(&client->object);
> +
> +	mutex_lock(&gsp->client_id.mutex);
> +	idr_remove(&gsp->client_id.idr, client->object.handle & 0xffff);
> +	mutex_unlock(&gsp->client_id.mutex);

Should use xarray instead, this also gets us rid of the dedicated mutex.

> +
> +	client->gsp = NULL;
> +}
> +
> +static int
> +r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
> +{
> +	NV0000_ALLOC_PARAMETERS *args;
> +	int ret;
> +
> +	mutex_lock(&gsp->client_id.mutex);
> +	ret = idr_alloc(&gsp->client_id.idr, client, 0, 0xffff + 1, GFP_KERNEL);
> +	mutex_unlock(&gsp->client_id.mutex);
> +	if (ret < 0)
> +		return ret;
> +
> +	client->gsp = gsp;
> +	client->object.client = client;
> +
> +	args = nvkm_gsp_rm_alloc_get(&client->object, 0xc1d00000 | ret, NV01_ROOT, sizeof(*args),
> +				     &client->object);
> +	if (IS_ERR(args)) {
> +		r535_gsp_client_dtor(client);
> +		return ret;
> +	}
> +
> +	args->hClient = client->object.handle;

Same as above, used anywhere else?

> +	args->processID = ~0;
> +
> +	ret = nvkm_gsp_rm_alloc_wr(&client->object, args);
> +	if (ret) {
> +		r535_gsp_client_dtor(client);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
> +{
> +	struct nvkm_gsp_client *client = object->client;
> +	struct nvkm_gsp *gsp = client->gsp;
> +	rpc_free_v03_00 *rpc;
> +
> +	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x free\n",
> +		   client->object.handle, object->handle);
> +
> +	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_FREE, sizeof(*rpc));
> +	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
> +		return -EIO;
> +
> +	rpc->params.hRoot = client->object.handle;
> +	rpc->params.hObjectParent = 0;
> +	rpc->params.hObjectOld = object->handle;
> +	return nvkm_gsp_rpc_wr(gsp, rpc, true);
> +}
> +
> +static void
> +r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *repv)
> +{
> +	rpc_gsp_rm_alloc_v03_00 *rpc = container_of(repv, typeof(*rpc), params);
> +
> +	nvkm_gsp_rpc_done(object->client->gsp, rpc);
> +}
> +
> +static void *
> +r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
> +{
> +	rpc_gsp_rm_alloc_v03_00 *rpc = container_of(argv, typeof(*rpc), params);
> +	struct nvkm_gsp *gsp = object->client->gsp;
> +	void *ret;
> +
> +	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, sizeof(*rpc) + repc);
> +	if (IS_ERR_OR_NULL(rpc))
> +		return rpc;
> +
> +	if (rpc->status) {
> +		nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
> +		ret = ERR_PTR(-EINVAL);
> +	} else {
> +		ret = repc ? rpc->params : NULL;
> +	}
> +
> +	if (IS_ERR_OR_NULL(ret))
> +		nvkm_gsp_rpc_done(gsp, rpc);
> +
> +	return ret;
> +}
> +
> +static void *
> +r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass, u32 argc)
> +{
> +	struct nvkm_gsp_client *client = object->client;
> +	struct nvkm_gsp *gsp = client->gsp;
> +	rpc_gsp_rm_alloc_v03_00 *rpc;
> +
> +	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x new obj:0x%08x cls:0x%08x argc:%d\n",
> +		   client->object.handle, object->parent->handle, object->handle, oclass, argc);
> +
> +	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC, sizeof(*rpc) + argc);
> +	if (IS_ERR(rpc))
> +		return rpc;
> +
> +	rpc->hClient = client->object.handle;
> +	rpc->hParent = object->parent->handle;
> +	rpc->hObject = object->handle;
> +	rpc->hClass = oclass;
> +	rpc->status = 0;
> +	rpc->paramsSize = argc;
> +	return rpc->params;
> +}
> +
>   static void
>   r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
>   {
> @@ -509,6 +675,18 @@ r535_gsp_rm = {
>   	.rm_ctrl_get = r535_gsp_rpc_rm_ctrl_get,
>   	.rm_ctrl_push = r535_gsp_rpc_rm_ctrl_push,
>   	.rm_ctrl_done = r535_gsp_rpc_rm_ctrl_done,
> +
> +	.rm_alloc_get = r535_gsp_rpc_rm_alloc_get,
> +	.rm_alloc_push = r535_gsp_rpc_rm_alloc_push,
> +	.rm_alloc_done = r535_gsp_rpc_rm_alloc_done,
> +
> +	.rm_free = r535_gsp_rpc_rm_free,
> +
> +	.client_ctor = r535_gsp_client_ctor,
> +	.client_dtor = r535_gsp_client_dtor,
> +
> +	.device_ctor = r535_gsp_device_ctor,
> +	.device_dtor = r535_gsp_device_dtor,
>   };
>   
>   static int
> @@ -1473,6 +1651,9 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
>   void
>   r535_gsp_dtor(struct nvkm_gsp *gsp)
>   {
> +	idr_destroy(&gsp->client_id.idr);
> +	mutex_destroy(&gsp->client_id.mutex);
> +
>   	nvkm_gsp_radix3_dtor(gsp, &gsp->radix3);
>   	nvkm_gsp_mem_dtor(gsp, &gsp->sig);
>   	nvkm_firmware_dtor(&gsp->fw);
> @@ -1601,6 +1782,9 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
>   
>   	nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
>   	nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
> +
> +	mutex_init(&gsp->client_id.mutex);
> +	idr_init(&gsp->client_id.idr);
>   	return 0;
>   }
>   

