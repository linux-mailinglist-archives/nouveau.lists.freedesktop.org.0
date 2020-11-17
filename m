Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3582B6DFD
	for <lists+nouveau@lfdr.de>; Tue, 17 Nov 2020 20:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4780C6E044;
	Tue, 17 Nov 2020 19:02:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B756E044
 for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2020 19:02:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c9so4306224wml.5
 for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2020 11:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aB3RzbF3m+Z6/FqXxyXIhr+Vt8dqXl3DQEjdVHMAUy0=;
 b=bjFj8+TPtQ91/C4v+b7Q3YX2K36GbTX82dI9b4XJJyTVGANQGMae74PG7x4101XdKE
 YsUWmw7CIPHamCogS+tsfuM3qEL0q4Ur1cJaA/GPPBhNVajADE4yS0DE4HLaVGjSmAzC
 3MYk/b8xWFtlxRwxIOvSUvuA385V+kiL1S4dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=aB3RzbF3m+Z6/FqXxyXIhr+Vt8dqXl3DQEjdVHMAUy0=;
 b=T9vi+sdLsCJwlCY2uItVQQFj2p95oCGgSvRpMPhRtW2UV25dMEJloi+7mILfyLrxA2
 Ny96emBl0wXj3CMKZV4Bkwcezos1A9ESsHGoXaACdeSy3S+I7MTdnuUVpHenU1IIuODt
 S+GVALrYyuhBG1lAQBmaGyyVYhcIIYxUmQkqvhonSnlP1VMpYLkgOHSwM0Q+3n0+zU8p
 VDn6tXstXgEetYyzpWtTbRr9e/A/ha8ZXAS5V5XYLHNkptDtPVFNKs2eaQAEvlt/ciaw
 WfIBQSGH6DRnfW+NJ7XdkRC5qPVPDyyoDEH6v+UZLO/DP75ljJngu0C0SPebbAMi5mBe
 MNEA==
X-Gm-Message-State: AOAM533rgh81S1flvtM4z6eGnqUD+mCAKcODjxLDz6g7u7EoMD8eGB7Y
 /6rD5f41F+urgyKHzndngKW7wg==
X-Google-Smtp-Source: ABdhPJy33P35zG5c/C2euGoTdmYRuFwy2hKncNNGdVb5M/FEMoYCCXo0rdgmO/wiGFMvk6EwL//oAQ==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr542288wml.174.1605639754375;
 Tue, 17 Nov 2020 11:02:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v19sm5020653wmj.31.2020.11.17.11.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 11:02:33 -0800 (PST)
Date: Tue, 17 Nov 2020 20:02:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20201117190231.GQ401619@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20201116174112.1833368-1-lee.jones@linaro.org>
 <20201116174112.1833368-22-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116174112.1833368-22-lee.jones@linaro.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH 21/42] drm/nouveau/nvkm/core/firmware: Fix
 formatting, provide missing param description
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Nov 16, 2020 at 05:40:51PM +0000, Lee Jones wrote:
> ... and demote non-conformant kernel-doc header.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'subdev' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fwname' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'ver' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:71: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_get'
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c:106: warning: Function parameter or member 'fw' not described in 'nvkm_firmware_put'
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>

Ben fyi I smashed this into drm-misc-next, seemed trivial enough to not be
a bother.
-Daniel

> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> index 8b25367917ca0..ca1f8463cff51 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> @@ -58,9 +58,10 @@ nvkm_firmware_load_blob(const struct nvkm_subdev *subdev, const char *base,
>  
>  /**
>   * nvkm_firmware_get - load firmware from the official nvidia/chip/ directory
> - * @subdev	subdevice that will use that firmware
> - * @fwname	name of firmware file to load
> - * @fw		firmware structure to load to
> + * @subdev:	subdevice that will use that firmware
> + * @fwname:	name of firmware file to load
> + * @ver:	firmware version to load
> + * @fw:		firmware structure to load to
>   *
>   * Use this function to load firmware files in the form nvidia/chip/fwname.bin.
>   * Firmware files released by NVIDIA will always follow this format.
> @@ -98,7 +99,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
>  	return -ENOENT;
>  }
>  
> -/**
> +/*
>   * nvkm_firmware_put - release firmware loaded with nvkm_firmware_get
>   */
>  void
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
