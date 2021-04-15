Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F44360A64
	for <lists+nouveau@lfdr.de>; Thu, 15 Apr 2021 15:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38686E50D;
	Thu, 15 Apr 2021 13:21:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2E6E504
 for <nouveau@lists.freedesktop.org>; Thu, 15 Apr 2021 13:21:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id p6so16577867wrn.9
 for <nouveau@lists.freedesktop.org>; Thu, 15 Apr 2021 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=evTMSPPWsjDSCt/BqTT+rrf2SHb4/im2ARce7/nHPGA=;
 b=HDObdOKIBZFbGI0noupV2rQFT7dEvhwUbLyO87HnYkZen0h9MSmx0q7ZZtAlYPpjrV
 XqX8jJ5KpYjDe/UeFC+mxamfz+goUrjHUoljsIflToASY441T2oJ/NcOdp8O+VLTSmeP
 gWhXODCwdtMPni+XLtgesuxHlY5XYv/NkRQJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=evTMSPPWsjDSCt/BqTT+rrf2SHb4/im2ARce7/nHPGA=;
 b=mxL7Accs31j8ZS3AEop4Qwg9VVSU1853at9JFh1IoCQbYS6CgrSkxQ0U+AEVKSlO1D
 bA2VBeBOkp450W0nrVoASk7odqh2GOawlCCSR4b6Gs+I2rbNY87LkvRJQRtt3KlWVCZF
 w9CLkNwwXyc6KOXi80/WVgBCC07F6p5XEIqdCSMRjTuGGv66njoMP2n42tgwhbNmGTDO
 +wFER1E6NNT2PrDfsqXE6mNDK1Annym4/dHWX2KlFxQzanvm4quZ+pSDWMUP/jrFtlyu
 3d1xztxWnxzlIZFEJKoDarYKKo2zdR/hQBJio+yRgi0nHukXqSemUSB56CxsU87S7LEH
 iJaQ==
X-Gm-Message-State: AOAM531kFFVxbtEdS9bypon9RBGy3WATOtPbqIShzQ8U521d/xBdLdy6
 nukzqPKLO9ykmJEkv/VwgJNMxA==
X-Google-Smtp-Source: ABdhPJyapv3SICSDUH7gbFUJPMlWnDA0q7t8TMzMLaKKqSfufxTyth1q/N7zr3wNvZtiBgPcxK1Vdw==
X-Received: by 2002:a5d:4cc1:: with SMTP id c1mr3556812wrt.291.1618492883887; 
 Thu, 15 Apr 2021 06:21:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z66sm2884216wmc.4.2021.04.15.06.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 06:21:23 -0700 (PDT)
Date: Thu, 15 Apr 2021 15:21:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YHg90cqFr0gIqiNN@phenom.ffwll.local>
References: <20210415101740.21847-1-tzimmermann@suse.de>
 <20210415101740.21847-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415101740.21847-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH v2 1/7] drm/ttm: Don't override vm_ops
 callbacks, if set
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
Cc: amd-gfx@lists.freedesktop.org, shashank.sharma@amd.com, airlied@linux.ie,
 nouveau@lists.freedesktop.org, Felix.Kuehling@amd.com, sroland@vmware.com,
 nirmoy.das@amd.com, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, sam@ravnborg.org, christian.koenig@amd.com,
 zackr@vmware.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Apr 15, 2021 at 12:17:34PM +0200, Thomas Zimmermann wrote:
> Drivers may want to set their own callbacks for a VM area. Only set
> TTM's callbacks if the vm_ops field is clear.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index b31b18058965..bf4a213bc66c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -534,7 +534,12 @@ static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_device *bdev,
>  
>  static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, struct vm_area_struct *vma)
>  {
> -	vma->vm_ops = &ttm_bo_vm_ops;
> +	/*
> +	 * Drivers may want to override the vm_ops field. Otherwise we
> +	 * use TTM's default callbacks.
> +	 */
> +	if (!vma->vm_ops)
> +		vma->vm_ops = &ttm_bo_vm_ops;
>  
>  	/*
>  	 * Note: We're transferring the bo reference to
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
