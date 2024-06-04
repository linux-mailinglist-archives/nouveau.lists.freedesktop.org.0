Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8A8FB218
	for <lists+nouveau@lfdr.de>; Tue,  4 Jun 2024 14:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E8F10E46C;
	Tue,  4 Jun 2024 12:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L6UfkrOv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD19E10E1DD
 for <nouveau@lists.freedesktop.org>; Tue,  4 Jun 2024 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717503885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yv4LD62nVqMGzkufmHDU70zt6/VVA95LLRPUF09MzLE=;
 b=L6UfkrOv297EaV39hNeJpaZ8lD1A1D0zD64lZvTeY4YdyXuZV+SxY6RGQALsVNbHYhc6SL
 EyPso6Nj0mDadB8J+1cPnhzipEciS9lhWuRKp5rKZ1c2tYpuUstRKFbNIJe/aE06+mmGeu
 BiNUll2ecXplUTrR2arYJs/wSQVObtw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-JD_Re567NSq3Ki5sH6SITQ-1; Tue, 04 Jun 2024 08:24:43 -0400
X-MC-Unique: JD_Re567NSq3Ki5sH6SITQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35dc5934390so2863749f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 04 Jun 2024 05:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717503881; x=1718108681;
 h=content-transfer-encoding:in-reply-to:organization:from:cc
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yv4LD62nVqMGzkufmHDU70zt6/VVA95LLRPUF09MzLE=;
 b=ieYXB+s7qSdIpFoSlQLycRYFG4pjm/tYYeg7MkE1R0awG4mngL601VxFvIazAscHsZ
 cUdoO5ZrVd81/W2DthE6e9Oagx+AS+oktzH7UHcCTL30GSgyIpJRcEhWGFiPWrvpFUNZ
 LPa4a4jlEHu5Jvg/Mrf8VPfMbgDpmYo65p5kkUY0wA1jzkh+O4MPK4zRQeO+Zvqa6faH
 jZbN8TZeVaXMooUiebqwr4SzeQTAWVTNzJ9AH4x8OKrCumJdrTWwblkgP07WgG8+S1XU
 +V022Nu3FmwsHJTw65rGpbY8A+6up1d6EzvcuPRA72zTjHzQDuLY/8YzW3LktocrqTBP
 MWag==
X-Gm-Message-State: AOJu0YzH57jWNyPhbe+0gqXDaCUVu6TeTte24qo+5PxcAV64YyXU7QI2
 hrNJSgAZBPB719ObtfN81nO15LiR4HGijLwiOZVyJORcUp8RbZqrAFbQs8qOea6r+rZ36bBz3uX
 /xc5QNvSMJoyxwecVfqraIn7GDW+gfBOrZDlzTWegKGQzVqm74S87m02YbUSXCzjf7nxC8Rw=
X-Received: by 2002:a5d:5612:0:b0:354:fc89:5432 with SMTP id
 ffacd0b85a97d-35e0f259a0amr8853935f8f.5.1717503881441; 
 Tue, 04 Jun 2024 05:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJka5g4Iw3nopGPqNzorVTWpoeKnDr84MROWCiZoLEeRHIU1bBfPU2OJsAdJsnBRyrL20vvA==
X-Received: by 2002:a5d:5612:0:b0:354:fc89:5432 with SMTP id
 ffacd0b85a97d-35e0f259a0amr8853912f8f.5.1717503880922; 
 Tue, 04 Jun 2024 05:24:40 -0700 (PDT)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0630010sm11481856f8f.76.2024.06.04.05.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 05:24:40 -0700 (PDT)
Message-ID: <7c9462ac-6a8d-4982-8a91-5e4bdf46e099@redhat.com>
Date: Tue, 4 Jun 2024 14:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/34] drm/nouveau/nvkm: remove detect/mmio/subdev_mask
 from device args
To: Ben Skeggs <bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
 <20240527141959.59193-9-bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240527141959.59193-9-bskeggs@nvidia.com>
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

On 5/27/24 16:19, Ben Skeggs wrote:
> All callers now pass "detect=true, mmio=true, subdev_mask=~0ULL",
> so remove the function arguments, and associated code.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>   .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
>   .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |   6 +-
>   .../gpu/drm/nouveau/nvkm/engine/device/base.c | 422 +++++++++---------
>   .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |   4 +-
>   .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   1 -
>   .../drm/nouveau/nvkm/engine/device/tegra.c    |   5 +-
>   7 files changed, 209 insertions(+), 231 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
> index b4b5df3e1610..7444c4d59e09 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
> @@ -10,6 +10,5 @@ struct nvkm_device_pci {
>   };
>   
>   int nvkm_device_pci_new(struct pci_dev *, const char *cfg, const char *dbg,
> -			bool detect, bool mmio, u64 subdev_mask,
>   			struct nvkm_device **);
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
> index ccee53d4e4ec..22f74fc88cd7 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
> @@ -51,6 +51,5 @@ struct nvkm_device_tegra_func {
>   int nvkm_device_tegra_new(const struct nvkm_device_tegra_func *,
>   			  struct platform_device *,
>   			  const char *cfg, const char *dbg,
> -			  bool detect, bool mmio, u64 subdev_mask,
>   			  struct nvkm_device **);
>   #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index e1a7475db430..ce40a0100264 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -808,8 +808,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>   	/* We need to check that the chipset is supported before booting
>   	 * fbdev off the hardware, as there's no way to put it back.
>   	 */
> -	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
> -				  true, true, ~0ULL, &device);
> +	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug, &device);
>   	if (ret)
>   		return ret;
>   
> @@ -1366,8 +1365,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>   	struct drm_device *drm;
>   	int err;
>   
> -	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
> -				    true, true, ~0ULL, pdevice);
> +	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug, pdevice);
>   	if (err)
>   		goto err_free;
>   
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> index 31ed3da32fe7..006f01e93b9b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> @@ -67,12 +67,6 @@ nvkm_device_list(u64 *name, int size)
>   	return nr;
>   }
>   
> -static const struct nvkm_device_chip
> -null_chipset = {
> -	.name = "NULL",
> -	.bios     = { 0x00000001, nvkm_bios_new },
> -};
> -
>   static const struct nvkm_device_chip
>   nv4_chipset = {
>   	.name = "NV04",
> @@ -3104,7 +3098,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>   		 const struct nvkm_device_quirk *quirk,
>   		 struct device *dev, enum nvkm_device_type type, u64 handle,
>   		 const char *name, const char *cfg, const char *dbg,
> -		 bool detect, bool mmio, u64 subdev_mask,
>   		 struct nvkm_device *device)
>   {
>   	struct nvkm_subdev *subdev;
> @@ -3132,233 +3125,228 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>   	mmio_base = device->func->resource_addr(device, 0);
>   	mmio_size = device->func->resource_size(device, 0);
>   
> -	if (detect || mmio) {
> -		device->pri = ioremap(mmio_base, mmio_size);
> -		if (device->pri == NULL) {
> -			nvdev_error(device, "unable to map PRI\n");
> -			ret = -ENOMEM;
> -			goto done;
> -		}
> +	device->pri = ioremap(mmio_base, mmio_size);
> +	if (device->pri == NULL) {
> +		nvdev_error(device, "unable to map PRI\n");
> +		ret = -ENOMEM;
> +		goto done;
>   	}
>   
>   	/* identify the chipset, and determine classes of subdev/engines */
> -	if (detect) {
> -		/* switch mmio to cpu's native endianness */
> -		if (!nvkm_device_endianness(device)) {
> -			nvdev_error(device,
> -				    "Couldn't switch GPU to CPUs endianness\n");
> -			ret = -ENOSYS;
> -			goto done;
> -		}
>   
> -		boot0 = nvkm_rd32(device, 0x000000);
> -
> -		/* chipset can be overridden for devel/testing purposes */
> -		chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
> -		if (chipset) {
> -			u32 override_boot0;
> -
> -			if (chipset >= 0x10) {
> -				override_boot0  = ((chipset & 0x1ff) << 20);
> -				override_boot0 |= 0x000000a1;
> -			} else {
> -				if (chipset != 0x04)
> -					override_boot0 = 0x20104000;
> -				else
> -					override_boot0 = 0x20004000;
> -			}
> +	/* switch mmio to cpu's native endianness */
> +	if (!nvkm_device_endianness(device)) {
> +		nvdev_error(device,
> +			    "Couldn't switch GPU to CPUs endianness\n");
> +		ret = -ENOSYS;
> +		goto done;
> +	}
>   
> -			nvdev_warn(device, "CHIPSET OVERRIDE: %08x -> %08x\n",
> -				   boot0, override_boot0);
> -			boot0 = override_boot0;
> -		}
> +	boot0 = nvkm_rd32(device, 0x000000);
>   
> -		/* determine chipset and derive architecture from it */
> -		if ((boot0 & 0x1f000000) > 0) {
> -			device->chipset = (boot0 & 0x1ff00000) >> 20;
> -			device->chiprev = (boot0 & 0x000000ff);
> -			switch (device->chipset & 0x1f0) {
> -			case 0x010: {
> -				if (0x461 & (1 << (device->chipset & 0xf)))
> -					device->card_type = NV_10;
> -				else
> -					device->card_type = NV_11;
> -				device->chiprev = 0x00;
> -				break;
> -			}
> -			case 0x020: device->card_type = NV_20; break;
> -			case 0x030: device->card_type = NV_30; break;
> -			case 0x040:
> -			case 0x060: device->card_type = NV_40; break;
> -			case 0x050:
> -			case 0x080:
> -			case 0x090:
> -			case 0x0a0: device->card_type = NV_50; break;
> -			case 0x0c0:
> -			case 0x0d0: device->card_type = NV_C0; break;
> -			case 0x0e0:
> -			case 0x0f0:
> -			case 0x100: device->card_type = NV_E0; break;
> -			case 0x110:
> -			case 0x120: device->card_type = GM100; break;
> -			case 0x130: device->card_type = GP100; break;
> -			case 0x140: device->card_type = GV100; break;
> -			case 0x160: device->card_type = TU100; break;
> -			case 0x170: device->card_type = GA100; break;
> -			case 0x190: device->card_type = AD100; break;
> -			default:
> -				break;
> -			}
> -		} else
> -		if ((boot0 & 0xff00fff0) == 0x20004000) {
> -			if (boot0 & 0x00f00000)
> -				device->chipset = 0x05;
> +	/* chipset can be overridden for devel/testing purposes */
> +	chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
> +	if (chipset) {
> +		u32 override_boot0;
> +
> +		if (chipset >= 0x10) {
> +			override_boot0  = ((chipset & 0x1ff) << 20);
> +			override_boot0 |= 0x000000a1;
> +		} else {
> +			if (chipset != 0x04)
> +				override_boot0 = 0x20104000;
>   			else
> -				device->chipset = 0x04;
> -			device->card_type = NV_04;
> +				override_boot0 = 0x20004000;
>   		}
>   
> -		switch (device->chipset) {
> -		case 0x004: device->chip = &nv4_chipset; break;
> -		case 0x005: device->chip = &nv5_chipset; break;
> -		case 0x010: device->chip = &nv10_chipset; break;
> -		case 0x011: device->chip = &nv11_chipset; break;
> -		case 0x015: device->chip = &nv15_chipset; break;
> -		case 0x017: device->chip = &nv17_chipset; break;
> -		case 0x018: device->chip = &nv18_chipset; break;
> -		case 0x01a: device->chip = &nv1a_chipset; break;
> -		case 0x01f: device->chip = &nv1f_chipset; break;
> -		case 0x020: device->chip = &nv20_chipset; break;
> -		case 0x025: device->chip = &nv25_chipset; break;
> -		case 0x028: device->chip = &nv28_chipset; break;
> -		case 0x02a: device->chip = &nv2a_chipset; break;
> -		case 0x030: device->chip = &nv30_chipset; break;
> -		case 0x031: device->chip = &nv31_chipset; break;
> -		case 0x034: device->chip = &nv34_chipset; break;
> -		case 0x035: device->chip = &nv35_chipset; break;
> -		case 0x036: device->chip = &nv36_chipset; break;
> -		case 0x040: device->chip = &nv40_chipset; break;
> -		case 0x041: device->chip = &nv41_chipset; break;
> -		case 0x042: device->chip = &nv42_chipset; break;
> -		case 0x043: device->chip = &nv43_chipset; break;
> -		case 0x044: device->chip = &nv44_chipset; break;
> -		case 0x045: device->chip = &nv45_chipset; break;
> -		case 0x046: device->chip = &nv46_chipset; break;
> -		case 0x047: device->chip = &nv47_chipset; break;
> -		case 0x049: device->chip = &nv49_chipset; break;
> -		case 0x04a: device->chip = &nv4a_chipset; break;
> -		case 0x04b: device->chip = &nv4b_chipset; break;
> -		case 0x04c: device->chip = &nv4c_chipset; break;
> -		case 0x04e: device->chip = &nv4e_chipset; break;
> -		case 0x050: device->chip = &nv50_chipset; break;
> -		case 0x063: device->chip = &nv63_chipset; break;
> -		case 0x067: device->chip = &nv67_chipset; break;
> -		case 0x068: device->chip = &nv68_chipset; break;
> -		case 0x084: device->chip = &nv84_chipset; break;
> -		case 0x086: device->chip = &nv86_chipset; break;
> -		case 0x092: device->chip = &nv92_chipset; break;
> -		case 0x094: device->chip = &nv94_chipset; break;
> -		case 0x096: device->chip = &nv96_chipset; break;
> -		case 0x098: device->chip = &nv98_chipset; break;
> -		case 0x0a0: device->chip = &nva0_chipset; break;
> -		case 0x0a3: device->chip = &nva3_chipset; break;
> -		case 0x0a5: device->chip = &nva5_chipset; break;
> -		case 0x0a8: device->chip = &nva8_chipset; break;
> -		case 0x0aa: device->chip = &nvaa_chipset; break;
> -		case 0x0ac: device->chip = &nvac_chipset; break;
> -		case 0x0af: device->chip = &nvaf_chipset; break;
> -		case 0x0c0: device->chip = &nvc0_chipset; break;
> -		case 0x0c1: device->chip = &nvc1_chipset; break;
> -		case 0x0c3: device->chip = &nvc3_chipset; break;
> -		case 0x0c4: device->chip = &nvc4_chipset; break;
> -		case 0x0c8: device->chip = &nvc8_chipset; break;
> -		case 0x0ce: device->chip = &nvce_chipset; break;
> -		case 0x0cf: device->chip = &nvcf_chipset; break;
> -		case 0x0d7: device->chip = &nvd7_chipset; break;
> -		case 0x0d9: device->chip = &nvd9_chipset; break;
> -		case 0x0e4: device->chip = &nve4_chipset; break;
> -		case 0x0e6: device->chip = &nve6_chipset; break;
> -		case 0x0e7: device->chip = &nve7_chipset; break;
> -		case 0x0ea: device->chip = &nvea_chipset; break;
> -		case 0x0f0: device->chip = &nvf0_chipset; break;
> -		case 0x0f1: device->chip = &nvf1_chipset; break;
> -		case 0x106: device->chip = &nv106_chipset; break;
> -		case 0x108: device->chip = &nv108_chipset; break;
> -		case 0x117: device->chip = &nv117_chipset; break;
> -		case 0x118: device->chip = &nv118_chipset; break;
> -		case 0x120: device->chip = &nv120_chipset; break;
> -		case 0x124: device->chip = &nv124_chipset; break;
> -		case 0x126: device->chip = &nv126_chipset; break;
> -		case 0x12b: device->chip = &nv12b_chipset; break;
> -		case 0x130: device->chip = &nv130_chipset; break;
> -		case 0x132: device->chip = &nv132_chipset; break;
> -		case 0x134: device->chip = &nv134_chipset; break;
> -		case 0x136: device->chip = &nv136_chipset; break;
> -		case 0x137: device->chip = &nv137_chipset; break;
> -		case 0x138: device->chip = &nv138_chipset; break;
> -		case 0x13b: device->chip = &nv13b_chipset; break;
> -		case 0x140: device->chip = &nv140_chipset; break;
> -		case 0x162: device->chip = &nv162_chipset; break;
> -		case 0x164: device->chip = &nv164_chipset; break;
> -		case 0x166: device->chip = &nv166_chipset; break;
> -		case 0x167: device->chip = &nv167_chipset; break;
> -		case 0x168: device->chip = &nv168_chipset; break;
> -		case 0x172: device->chip = &nv172_chipset; break;
> -		case 0x173: device->chip = &nv173_chipset; break;
> -		case 0x174: device->chip = &nv174_chipset; break;
> -		case 0x176: device->chip = &nv176_chipset; break;
> -		case 0x177: device->chip = &nv177_chipset; break;
> -		case 0x192: device->chip = &nv192_chipset; break;
> -		case 0x193: device->chip = &nv193_chipset; break;
> -		case 0x194: device->chip = &nv194_chipset; break;
> -		case 0x196: device->chip = &nv196_chipset; break;
> -		case 0x197: device->chip = &nv197_chipset; break;
> -		default:
> -			if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
> -				switch (device->chipset) {
> -				case 0x170: device->chip = &nv170_chipset; break;
> -				default:
> -					break;
> -				}
> -			}
> +		nvdev_warn(device, "CHIPSET OVERRIDE: %08x -> %08x\n",
> +			   boot0, override_boot0);
> +		boot0 = override_boot0;
> +	}
>   
> -			if (!device->chip) {
> -				nvdev_error(device, "unknown chipset (%08x)\n", boot0);
> -				ret = -ENODEV;
> -				goto done;
> -			}
> +	/* determine chipset and derive architecture from it */
> +	if ((boot0 & 0x1f000000) > 0) {
> +		device->chipset = (boot0 & 0x1ff00000) >> 20;
> +		device->chiprev = (boot0 & 0x000000ff);
> +		switch (device->chipset & 0x1f0) {
> +		case 0x010: {
> +			if (0x461 & (1 << (device->chipset & 0xf)))
> +				device->card_type = NV_10;
> +			else
> +				device->card_type = NV_11;
> +			device->chiprev = 0x00;
>   			break;
>   		}
> +		case 0x020: device->card_type = NV_20; break;
> +		case 0x030: device->card_type = NV_30; break;
> +		case 0x040:
> +		case 0x060: device->card_type = NV_40; break;
> +		case 0x050:
> +		case 0x080:
> +		case 0x090:
> +		case 0x0a0: device->card_type = NV_50; break;
> +		case 0x0c0:
> +		case 0x0d0: device->card_type = NV_C0; break;
> +		case 0x0e0:
> +		case 0x0f0:
> +		case 0x100: device->card_type = NV_E0; break;
> +		case 0x110:
> +		case 0x120: device->card_type = GM100; break;
> +		case 0x130: device->card_type = GP100; break;
> +		case 0x140: device->card_type = GV100; break;
> +		case 0x160: device->card_type = TU100; break;
> +		case 0x170: device->card_type = GA100; break;
> +		case 0x190: device->card_type = AD100; break;
> +		default:
> +			break;
> +		}
> +	} else
> +	if ((boot0 & 0xff00fff0) == 0x20004000) {
> +		if (boot0 & 0x00f00000)
> +			device->chipset = 0x05;
> +		else
> +			device->chipset = 0x04;
> +		device->card_type = NV_04;
> +	}

Not directly related to this patch, but can we get some description and
/ or defines for magics where it makes sense? :-)

>   
> -		nvdev_info(device, "NVIDIA %s (%08x)\n",
> -			   device->chip->name, boot0);
> +	switch (device->chipset) {
> +	case 0x004: device->chip = &nv4_chipset; break;
> +	case 0x005: device->chip = &nv5_chipset; break;
> +	case 0x010: device->chip = &nv10_chipset; break;
> +	case 0x011: device->chip = &nv11_chipset; break;
> +	case 0x015: device->chip = &nv15_chipset; break;
> +	case 0x017: device->chip = &nv17_chipset; break;
> +	case 0x018: device->chip = &nv18_chipset; break;
> +	case 0x01a: device->chip = &nv1a_chipset; break;
> +	case 0x01f: device->chip = &nv1f_chipset; break;
> +	case 0x020: device->chip = &nv20_chipset; break;
> +	case 0x025: device->chip = &nv25_chipset; break;
> +	case 0x028: device->chip = &nv28_chipset; break;
> +	case 0x02a: device->chip = &nv2a_chipset; break;
> +	case 0x030: device->chip = &nv30_chipset; break;
> +	case 0x031: device->chip = &nv31_chipset; break;
> +	case 0x034: device->chip = &nv34_chipset; break;
> +	case 0x035: device->chip = &nv35_chipset; break;
> +	case 0x036: device->chip = &nv36_chipset; break;
> +	case 0x040: device->chip = &nv40_chipset; break;
> +	case 0x041: device->chip = &nv41_chipset; break;
> +	case 0x042: device->chip = &nv42_chipset; break;
> +	case 0x043: device->chip = &nv43_chipset; break;
> +	case 0x044: device->chip = &nv44_chipset; break;
> +	case 0x045: device->chip = &nv45_chipset; break;
> +	case 0x046: device->chip = &nv46_chipset; break;
> +	case 0x047: device->chip = &nv47_chipset; break;
> +	case 0x049: device->chip = &nv49_chipset; break;
> +	case 0x04a: device->chip = &nv4a_chipset; break;
> +	case 0x04b: device->chip = &nv4b_chipset; break;
> +	case 0x04c: device->chip = &nv4c_chipset; break;
> +	case 0x04e: device->chip = &nv4e_chipset; break;
> +	case 0x050: device->chip = &nv50_chipset; break;
> +	case 0x063: device->chip = &nv63_chipset; break;
> +	case 0x067: device->chip = &nv67_chipset; break;
> +	case 0x068: device->chip = &nv68_chipset; break;
> +	case 0x084: device->chip = &nv84_chipset; break;
> +	case 0x086: device->chip = &nv86_chipset; break;
> +	case 0x092: device->chip = &nv92_chipset; break;
> +	case 0x094: device->chip = &nv94_chipset; break;
> +	case 0x096: device->chip = &nv96_chipset; break;
> +	case 0x098: device->chip = &nv98_chipset; break;
> +	case 0x0a0: device->chip = &nva0_chipset; break;
> +	case 0x0a3: device->chip = &nva3_chipset; break;
> +	case 0x0a5: device->chip = &nva5_chipset; break;
> +	case 0x0a8: device->chip = &nva8_chipset; break;
> +	case 0x0aa: device->chip = &nvaa_chipset; break;
> +	case 0x0ac: device->chip = &nvac_chipset; break;
> +	case 0x0af: device->chip = &nvaf_chipset; break;
> +	case 0x0c0: device->chip = &nvc0_chipset; break;
> +	case 0x0c1: device->chip = &nvc1_chipset; break;
> +	case 0x0c3: device->chip = &nvc3_chipset; break;
> +	case 0x0c4: device->chip = &nvc4_chipset; break;
> +	case 0x0c8: device->chip = &nvc8_chipset; break;
> +	case 0x0ce: device->chip = &nvce_chipset; break;
> +	case 0x0cf: device->chip = &nvcf_chipset; break;
> +	case 0x0d7: device->chip = &nvd7_chipset; break;
> +	case 0x0d9: device->chip = &nvd9_chipset; break;
> +	case 0x0e4: device->chip = &nve4_chipset; break;
> +	case 0x0e6: device->chip = &nve6_chipset; break;
> +	case 0x0e7: device->chip = &nve7_chipset; break;
> +	case 0x0ea: device->chip = &nvea_chipset; break;
> +	case 0x0f0: device->chip = &nvf0_chipset; break;
> +	case 0x0f1: device->chip = &nvf1_chipset; break;
> +	case 0x106: device->chip = &nv106_chipset; break;
> +	case 0x108: device->chip = &nv108_chipset; break;
> +	case 0x117: device->chip = &nv117_chipset; break;
> +	case 0x118: device->chip = &nv118_chipset; break;
> +	case 0x120: device->chip = &nv120_chipset; break;
> +	case 0x124: device->chip = &nv124_chipset; break;
> +	case 0x126: device->chip = &nv126_chipset; break;
> +	case 0x12b: device->chip = &nv12b_chipset; break;
> +	case 0x130: device->chip = &nv130_chipset; break;
> +	case 0x132: device->chip = &nv132_chipset; break;
> +	case 0x134: device->chip = &nv134_chipset; break;
> +	case 0x136: device->chip = &nv136_chipset; break;
> +	case 0x137: device->chip = &nv137_chipset; break;
> +	case 0x138: device->chip = &nv138_chipset; break;
> +	case 0x13b: device->chip = &nv13b_chipset; break;
> +	case 0x140: device->chip = &nv140_chipset; break;
> +	case 0x162: device->chip = &nv162_chipset; break;
> +	case 0x164: device->chip = &nv164_chipset; break;
> +	case 0x166: device->chip = &nv166_chipset; break;
> +	case 0x167: device->chip = &nv167_chipset; break;
> +	case 0x168: device->chip = &nv168_chipset; break;
> +	case 0x172: device->chip = &nv172_chipset; break;
> +	case 0x173: device->chip = &nv173_chipset; break;
> +	case 0x174: device->chip = &nv174_chipset; break;
> +	case 0x176: device->chip = &nv176_chipset; break;
> +	case 0x177: device->chip = &nv177_chipset; break;
> +	case 0x192: device->chip = &nv192_chipset; break;
> +	case 0x193: device->chip = &nv193_chipset; break;
> +	case 0x194: device->chip = &nv194_chipset; break;
> +	case 0x196: device->chip = &nv196_chipset; break;
> +	case 0x197: device->chip = &nv197_chipset; break;
> +	default:
> +		if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
> +			switch (device->chipset) {
> +			case 0x170: device->chip = &nv170_chipset; break;
> +			default:
> +				break;
> +			}
> +		}
>   
> -		/* vGPU detection */
> -		boot1 = nvkm_rd32(device, 0x0000004);
> -		if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
> -			nvdev_info(device, "vGPUs are not supported\n");
> +		if (!device->chip) {
> +			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
>   			ret = -ENODEV;
>   			goto done;
>   		}
> +		break;
> +	}
>   
> -		/* read strapping information */
> -		strap = nvkm_rd32(device, 0x101000);
> +	nvdev_info(device, "NVIDIA %s (%08x)\n",
> +		   device->chip->name, boot0);
>   
> -		/* determine frequency of timing crystal */
> -		if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
> -		    (device->chipset >= 0x20 && device->chipset < 0x25))
> -			strap &= 0x00000040;
> -		else
> -			strap &= 0x00400040;
> +	/* vGPU detection */
> +	boot1 = nvkm_rd32(device, 0x0000004);
> +	if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
> +		nvdev_info(device, "vGPUs are not supported\n");
> +		ret = -ENODEV;
> +		goto done;
> +	}
>   
> -		switch (strap) {
> -		case 0x00000000: device->crystal = 13500; break;
> -		case 0x00000040: device->crystal = 14318; break;
> -		case 0x00400000: device->crystal = 27000; break;
> -		case 0x00400040: device->crystal = 25000; break;
> -		}
> -	} else {
> -		device->chip = &null_chipset;
> +	/* read strapping information */
> +	strap = nvkm_rd32(device, 0x101000);
> +
> +	/* determine frequency of timing crystal */
> +	if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
> +	    (device->chipset >= 0x20 && device->chipset < 0x25))
> +		strap &= 0x00000040;
> +	else
> +		strap &= 0x00400040;
> +
> +	switch (strap) {
> +	case 0x00000000: device->crystal = 13500; break;
> +	case 0x00000040: device->crystal = 14318; break;
> +	case 0x00400000: device->crystal = 27000; break;
> +	case 0x00400040: device->crystal = 25000; break;
>   	}
>   
>   	if (!device->name)
> @@ -3368,7 +3356,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>   	nvkm_intr_ctor(device);
>   
>   #define NVKM_LAYOUT_ONCE(type,data,ptr)                                                      \
> -	if (device->chip->ptr.inst && (subdev_mask & (BIT_ULL(type)))) {                     \
> +	if (device->chip->ptr.inst) {                                                        \
>   		WARN_ON(device->chip->ptr.inst != 0x00000001);                               \
>   		ret = device->chip->ptr.ctor(device, (type), -1, &device->ptr);              \
>   		subdev = nvkm_device_subdev(device, (type), 0);                              \
> @@ -3387,7 +3375,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>   #define NVKM_LAYOUT_INST(type,data,ptr,cnt)                                                  \
>   	WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) - 1));             \
>   	for (j = 0; device->chip->ptr.inst && j < ARRAY_SIZE(device->ptr); j++) {            \
> -		if ((device->chip->ptr.inst & BIT(j)) && (subdev_mask & BIT_ULL(type))) {    \
> +		if (device->chip->ptr.inst & BIT(j)) {                                       \
>   			ret = device->chip->ptr.ctor(device, (type), (j), &device->ptr[j]);  \
>   			subdev = nvkm_device_subdev(device, (type), (j));                    \
>   			if (ret) {                                                           \
> @@ -3409,7 +3397,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
>   
>   	ret = nvkm_intr_install(device);
>   done:
> -	if (device->pri && (!mmio || ret)) {
> +	if (ret && device->pri) {
>   		iounmap(device->pri);

Now that we don't have the 'detect' case anymore, can't we use
devm_ioremap() instead?

>   		device->pri = NULL;
>   	}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> index abccb2bb68a6..3ff6436007fa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> @@ -1626,7 +1626,6 @@ nvkm_device_pci_func = {
>   
>   int
>   nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
> -		    bool detect, bool mmio, u64 subdev_mask,
>   		    struct nvkm_device **pdevice)
>   {
>   	const struct nvkm_device_quirk *quirk = NULL;
> @@ -1680,8 +1679,7 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
>   				    pci_dev->bus->number << 16 |
>   				    PCI_SLOT(pci_dev->devfn) << 8 |
>   				    PCI_FUNC(pci_dev->devfn), name,
> -			       cfg, dbg, detect, mmio, subdev_mask,
> -			       &pdev->device);
> +			       cfg, dbg, &pdev->device);
>   
>   	if (ret)
>   		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
> index bf3176bec18a..c182d9c3e4fa 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
> @@ -56,7 +56,6 @@ int  nvkm_device_ctor(const struct nvkm_device_func *,
>   		      const struct nvkm_device_quirk *,
>   		      struct device *, enum nvkm_device_type, u64 handle,
>   		      const char *name, const char *cfg, const char *dbg,
> -		      bool detect, bool mmio, u64 subdev_mask,
>   		      struct nvkm_device *);
>   int  nvkm_device_init(struct nvkm_device *);
>   int  nvkm_device_fini(struct nvkm_device *, bool suspend);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> index 87caa4a72921..d1c294f00665 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> @@ -237,7 +237,6 @@ int
>   nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
>   		      struct platform_device *pdev,
>   		      const char *cfg, const char *dbg,
> -		      bool detect, bool mmio, u64 subdev_mask,
>   		      struct nvkm_device **pdevice)
>   {
>   	struct nvkm_device_tegra *tdev;
> @@ -311,8 +310,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
>   	tdev->gpu_speedo_id = tegra_sku_info.gpu_speedo_id;
>   	ret = nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->dev,
>   			       NVKM_DEVICE_TEGRA, pdev->id, NULL,
> -			       cfg, dbg, detect, mmio, subdev_mask,
> -			       &tdev->device);
> +			       cfg, dbg, &tdev->device);
>   	if (ret)
>   		goto powerdown;
>   
> @@ -333,7 +331,6 @@ int
>   nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
>   		      struct platform_device *pdev,
>   		      const char *cfg, const char *dbg,
> -		      bool detect, bool mmio, u64 subdev_mask,
>   		      struct nvkm_device **pdevice)
>   {
>   	return -ENOSYS;

