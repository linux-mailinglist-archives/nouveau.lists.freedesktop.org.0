Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1EC7DC2A2
	for <lists+nouveau@lfdr.de>; Mon, 30 Oct 2023 23:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8986110E39E;
	Mon, 30 Oct 2023 22:51:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A97410E39E
 for <nouveau@lists.freedesktop.org>; Mon, 30 Oct 2023 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698706290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6P4UoiErWNPLHNyco5VawfLkVvD7SWLKAqxTsw/cRyU=;
 b=fJgya7b1FTZU8M02P4rlR3r9Ko6jvQAXBZ3oH3l9lJFE3U6qWr1n1qtil21+Xh8uL6gulX
 Fl3nRXmP1Ftqzzl4w0YDwfagOctMiJpzLBopwbLzLuJBWXjSDv8tMJCQanEc4fr7jm+8xj
 RUuRUOQuvZSUSiqn/Fx7h9ENL6ClntI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-wpV_QelONXCJmP-ao1gjGw-1; Mon, 30 Oct 2023 18:51:09 -0400
X-MC-Unique: wpV_QelONXCJmP-ao1gjGw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5402e97fdd1so3662132a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 30 Oct 2023 15:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698706268; x=1699311068;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6P4UoiErWNPLHNyco5VawfLkVvD7SWLKAqxTsw/cRyU=;
 b=PNiNdWB0PFdjf4Sdxm/JvSiALDefdylVBC1eJORSHdcDNcb9klWahcselFxi55dfUy
 ppKkH5+pBmNsqCpwgZt+aXiL3/AR7DNbxUZkeQ6/ERE9o98fMxbwPYKQqVbwzZjfUpez
 3b1n2AU6x6xOAuvEESdRv75N4FavT0UGZZBmO04WpzyYIzCa821Ovt03KSNKjtnKif3+
 PjtREy9im8UaljX1u6UKML3L5dCJinJRY9ZNa0ap4Tc32huUW4Pg+PJgTD8B7m/u9Ivh
 d8g2tasQK/Iayy4+s94aHFNaCEMOHjh/tlQOL5Gb9k0c3bSGvtT1VbSwHiNg2ueS46w/
 TWCQ==
X-Gm-Message-State: AOJu0YzuyzIz9zoaR1mIP6YTlwTsoO8gR2zzSMiGYQDUy0f0IzCB08OB
 JcSGAxRHyfCjVMtVJJg2mExI29vDuHHlavdc/tejCK7D/vAOl+wK654RsnHB6N8uo68CJccJxRI
 YGadpfR+lpR2GtinETza2Deu2Zg==
X-Received: by 2002:a50:d610:0:b0:543:6542:6627 with SMTP id
 x16-20020a50d610000000b0054365426627mr376828edi.32.1698706268344; 
 Mon, 30 Oct 2023 15:51:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLsW7uF3tuXKERXpeftJt/BN8R6xJmywBYCJRg8g5ktCvwYvWS8QJrH0eShU7WGgLVz/GBmA==
X-Received: by 2002:a50:d610:0:b0:543:6542:6627 with SMTP id
 x16-20020a50d610000000b0054365426627mr376823edi.32.1698706268157; 
 Mon, 30 Oct 2023 15:51:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a056402345200b0052febc781bfsm105445edc.36.2023.10.30.15.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 15:51:07 -0700 (PDT)
Message-ID: <53329862-1e7a-46de-9867-0cfaf9310ffb@redhat.com>
Date: Mon, 30 Oct 2023 23:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231030012814.1208972-1-airlied@gmail.com>
 <20231030012814.1208972-2-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231030012814.1208972-2-airlied@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 2/2] nouveau/disp: fix post-gsp build on
 32-bit arm.
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 10/30/23 02:28, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This converts a bunch of divides into the proper macros.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/dispnv50/disp.c | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index d2be40337b92..7840b6428afb 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1644,7 +1644,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	// 0 active symbols. This may cause HW hang. Bug 200379426
>   	//
>   	if ((bEnableDsc) &&
> -		((pixelClockHz * depth) < ((8 * minRate * outp->dp.link_nr * DSC_FACTOR) / 64)))
> +	    ((pixelClockHz * depth) < div_u64(8 * minRate * outp->dp.link_nr * DSC_FACTOR, 64)))
>   	{
>   		return false;
>   	}
> @@ -1654,20 +1654,20 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	//	For auto mode the watermark calculation does not need to track accumulated error the
>   	//	formulas for manual mode will not work.  So below calculation was extracted from the DTB.
>   	//
> -	ratioF = ((u64)pixelClockHz * depth * PrecisionFactor) / DSC_FACTOR;
> +	ratioF = div_u64((u64)pixelClockHz * depth * PrecisionFactor, DSC_FACTOR);
>   
> -	ratioF /= 8 * (u64) minRate * outp->dp.link_nr;
> +	ratioF = div_u64(ratioF, 8 * (u64) minRate * outp->dp.link_nr);
>   
>   	if (PrecisionFactor < ratioF) // Assert if we will end up with a negative number in below
>   		return false;
>   
> -	watermarkF = ratioF * tuSize * (PrecisionFactor - ratioF)  / PrecisionFactor;
> -	waterMark = (unsigned)(watermarkAdjust + ((2 * (depth * PrecisionFactor / (8 * numLanesPerLink * DSC_FACTOR)) + watermarkF) / PrecisionFactor));
> +	watermarkF = div_u64(ratioF * tuSize * (PrecisionFactor - ratioF), PrecisionFactor);
> +	waterMark = (unsigned)(watermarkAdjust + (div_u64(2 * div_u64(depth * PrecisionFactor, 8 * numLanesPerLink * DSC_FACTOR) + watermarkF, PrecisionFactor)));
>   
>   	//
>   	//  Bounds check the watermark
>   	//
> -	numSymbolsPerLine = (surfaceWidth * depth) / (8 * outp->dp.link_nr * DSC_FACTOR);
> +	numSymbolsPerLine = div_u64(surfaceWidth * depth, 8 * outp->dp.link_nr * DSC_FACTOR);
>   
>   	if (WARN_ON(waterMark > 39 || waterMark > numSymbolsPerLine))
>   		return false;
> @@ -1688,11 +1688,13 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	surfaceWidthPerLink = surfaceWidth;
>   
>   	//Extra bits sent due to pixel steering
> -	PixelSteeringBits = (surfaceWidthPerLink % numLanesPerLink) ? (((numLanesPerLink - surfaceWidthPerLink % numLanesPerLink) * depth) / DSC_FACTOR) : 0;
> +	u32 remain;
> +	div_u64_rem(surfaceWidthPerLink, numLanesPerLink, &remain);
> +	PixelSteeringBits = remain ? div_u64((numLanesPerLink - remain) * depth, DSC_FACTOR) : 0;
>   
>   	BlankingBits += PixelSteeringBits;
> -	NumBlankingLinkClocks = (u64)BlankingBits * PrecisionFactor / (8 * numLanesPerLink);
> -	MinHBlank = (u32)(NumBlankingLinkClocks * pixelClockHz/ minRate / PrecisionFactor);
> +	NumBlankingLinkClocks = div_u64((u64)BlankingBits * PrecisionFactor, (8 * numLanesPerLink));
> +	MinHBlank = (u32)(div_u64(div_u64(NumBlankingLinkClocks * pixelClockHz, minRate), PrecisionFactor));
>   	MinHBlank += 12;
>   
>   	if (WARN_ON(MinHBlank > rasterWidth - surfaceWidth))
> @@ -1703,7 +1705,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   		return false;
>   
>   
> -	hblank_symbols = (s32)(((u64)(rasterWidth - surfaceWidth - MinHBlank) * minRate) / pixelClockHz);
> +	hblank_symbols = (s32)(div_u64((u64)(rasterWidth - surfaceWidth - MinHBlank) * minRate, pixelClockHz));
>   
>   	//reduce HBlank Symbols to account for secondary data packet
>   	hblank_symbols -= 1; //Stuffer latency to send BS
> @@ -1722,7 +1724,7 @@ nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
>   	}
>   	else
>   	{
> -		vblank_symbols = (s32)(((u64)(surfaceWidth - 40) * minRate) /  pixelClockHz) - 1;
> +		vblank_symbols = (s32)((div_u64((u64)(surfaceWidth - 40) * minRate, pixelClockHz))) - 1;
>   
>   		vblank_symbols -= numLanesPerLink == 1 ? 39  : numLanesPerLink == 2 ? 21 : 12;
>   	}

