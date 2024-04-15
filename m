Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E79A8A4B13
	for <lists+nouveau@lfdr.de>; Mon, 15 Apr 2024 11:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022931123B9;
	Mon, 15 Apr 2024 09:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="W+Jwz14X";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E571123B8
 for <nouveau@lists.freedesktop.org>; Mon, 15 Apr 2024 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713171812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYKa4KTPniO6R7CGdMFUdNW1Z1y9QZTKRFmp+ZRDLRU=;
 b=W+Jwz14XJGDiLRbFeCnRK+eGC1OYW33R9FZF+03eay7wiFZZOQNpeRYkcHJ8HunR9maoG4
 3O2m7A0CsYpN5vzMOj8qwQBKQDqdnASwnKIu3Io4xyxx2zbTRtmri3mO18A5ftkimqbMJs
 FdbmY7ytDNwvQAu0NNZ4HIoq5o0z1PQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-cVMnlKwuMd-g6Nb0bmKI5A-1; Mon, 15 Apr 2024 05:03:29 -0400
X-MC-Unique: cVMnlKwuMd-g6Nb0bmKI5A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-343e775c794so1892117f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 15 Apr 2024 02:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713171808; x=1713776608;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYKa4KTPniO6R7CGdMFUdNW1Z1y9QZTKRFmp+ZRDLRU=;
 b=StzakqdI8rkviPYMwdfkX73lSNEzxAyHtmrZy6jrgNNVDN2pUAyFYc124KEPRcZ0Qu
 A9HZ4/sDZ07kU8olcJvs/ktRD+1KZFUqfy26WcPYj7RaAXHspHPhQhzppq/gJhh2fMPc
 p65/9La16+qFh4ngdeAfoWcS/3asVSGhNo3w+SPfDA73YEW6fOrwj7hqKbXQBrPPZKbu
 W4jgsmZauyn+iwcTN5LgtVf2orQBMvG9FL9EJ+MwoL93z4vAYsgfOGrTCDl3tlbsfsye
 vOQ6bXR1fYMTzH5AyHGBHRKLUJZx0t4uFua/Iu2p9/1ZXHDfA54fRn6YLOXZXnxngNQ6
 rifw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKVBw4XFBeaVW9Jc+WQ4/x3VT9MRGhTBaugjw9/Z7arABHxOvV0KomfdtJAdq3l9pYj2OzWAv6UuTI4W/G/D7nGFJlwdKYDgaQhIeVJw==
X-Gm-Message-State: AOJu0Yz3g0ooiZ0Za7+Fm98fHtD4fgDMg9d7ltt18IX3XPANDs5tHIpQ
 /ZCE1xfiXtdy6AhXCyfZTjhFzT40267shAkKn+KZgSGX2hy26eN5PtYU+mIxry+DBJvmzECrqk9
 TuZ/bRbkpdRsE2xlRAkJAejgVaw9xSXxg1bqmYx53/FjApsXGnKjG1L0pj5ia+Sc=
X-Received: by 2002:adf:e591:0:b0:341:e358:7bee with SMTP id
 l17-20020adfe591000000b00341e3587beemr6359829wrm.39.1713171807920; 
 Mon, 15 Apr 2024 02:03:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpwdZY2D2UwysYuZQw3OrScHwpqCJhWnmaPIklA/3flPX0PP7YVvECg4t0EjHiFSoANE2vtw==
X-Received: by 2002:adf:e591:0:b0:341:e358:7bee with SMTP id
 l17-20020adfe591000000b00341e3587beemr6359799wrm.39.1713171807476; 
 Mon, 15 Apr 2024 02:03:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfeb47000000b0033ec9ddc638sm11497808wrn.31.2024.04.15.02.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 02:03:26 -0700 (PDT)
Message-ID: <ad01f30e-4944-44f6-9efa-8e04726d1486@redhat.com>
Date: Mon, 15 Apr 2024 11:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: nv04: Fix out of bounds access
To: Mikhail Kobuk <m.kobuk@ispras.ru>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Francisco Jerez <currojerez@riseup.net>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, Karol Herbst <kherbst@redhat.com>
References: <20240411110854.16701-1-m.kobuk@ispras.ru>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240411110854.16701-1-m.kobuk@ispras.ru>
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

On 4/11/24 13:08, Mikhail Kobuk wrote:
> When Output Resource (dcb->or) value is assigned in
> fabricate_dcb_output(), there may be out of bounds access to
> dac_users array in case dcb->or is zero because ffs(dcb->or) is
> used as index there.
> The 'or' argument of fabricate_dcb_output() must be interpreted as a
> number of bit to set, not value.
> 
> Utilize macros from 'enum nouveau_or' in calls instead of hardcoding.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 2e5702aff395 ("drm/nouveau: fabricate DCB encoder table for iMac G4")
> Fixes: 670820c0e6a9 ("drm/nouveau: Workaround incorrect DCB entry on a GeForce3 Ti 200.")
> Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>

Applied to drm-misc-fixes, thanks!

> ---
> Changes in v2:
> - Instead of checking ffs(dcb->or), adjust function calls to match
>    argument semantics
> - Link to v1: https://lore.kernel.org/all/20240331064552.6112-1-m.kobuk@ispras.ru/
> 
>   drivers/gpu/drm/nouveau/nouveau_bios.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index 479effcf607e..79cfab53f80e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "nouveau_drv.h"
> +#include "nouveau_bios.h"
>   #include "nouveau_reg.h"
>   #include "dispnv04/hw.h"
>   #include "nouveau_encoder.h"
> @@ -1677,7 +1678,7 @@ apply_dcb_encoder_quirks(struct drm_device *dev, int idx, u32 *conn, u32 *conf)
>   	 */
>   	if (nv_match_device(dev, 0x0201, 0x1462, 0x8851)) {
>   		if (*conn == 0xf2005014 && *conf == 0xffffffff) {
> -			fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 1, 1);
> +			fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 1, 1, DCB_OUTPUT_B);
>   			return false;
>   		}
>   	}
> @@ -1763,26 +1764,26 @@ fabricate_dcb_encoder_table(struct drm_device *dev, struct nvbios *bios)
>   #ifdef __powerpc__
>   	/* Apple iMac G4 NV17 */
>   	if (of_machine_is_compatible("PowerMac4,5")) {
> -		fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, 1);
> -		fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG, 1, all_heads, 2);
> +		fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS, 0, all_heads, DCB_OUTPUT_B);
> +		fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG, 1, all_heads, DCB_OUTPUT_C);
>   		return;
>   	}
>   #endif
>   
>   	/* Make up some sane defaults */
>   	fabricate_dcb_output(dcb, DCB_OUTPUT_ANALOG,
> -			     bios->legacy.i2c_indices.crt, 1, 1);
> +			     bios->legacy.i2c_indices.crt, 1, DCB_OUTPUT_B);
>   
>   	if (nv04_tv_identify(dev, bios->legacy.i2c_indices.tv) >= 0)
>   		fabricate_dcb_output(dcb, DCB_OUTPUT_TV,
>   				     bios->legacy.i2c_indices.tv,
> -				     all_heads, 0);
> +				     all_heads, DCB_OUTPUT_A);
>   
>   	else if (bios->tmds.output0_script_ptr ||
>   		 bios->tmds.output1_script_ptr)
>   		fabricate_dcb_output(dcb, DCB_OUTPUT_TMDS,
>   				     bios->legacy.i2c_indices.panel,
> -				     all_heads, 1);
> +				     all_heads, DCB_OUTPUT_B);
>   }
>   
>   static int

