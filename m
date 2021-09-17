Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBA40FCB1
	for <lists+nouveau@lfdr.de>; Fri, 17 Sep 2021 17:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874E76EDC8;
	Fri, 17 Sep 2021 15:38:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964286EDDB
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 15:38:26 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 72so6943789qkk.7
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eYZWVg2Fo/lgTFAWwDOCdDsCtgn1QSeKcFBATt6HycE=;
 b=RZLdBWyS1zzwyQ8AWr+TO8IbeXMrv4GkD9yrNwWLkEQyOyCXnDQ5fSKQPUD/s0MhKg
 xPGzOeolgoxijwXPYafTXoIFsWJ9ZH5uTwiUOZtfmRRxJKeuYfHYRs1uljQBg7frLMPl
 hB2KoXeC7zy3aDwmTGMjYb7uwpHrgGCEhCUQ/7gSX9y0P86eoYQ0TI2zxNcUCG+42qfH
 CtKDkpmjAilFtakfPBxyf9AXRN+ZAnLX1wMYZX67q6M6bZu0FdgAYrAwrrnr63xoZJHl
 LYjs5GJ8k/UC4yxHxh5Zup/joyt2tOBuMeI9RbWPPU2MQCpcRDe0jZNAiziMVYTANnTP
 cA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eYZWVg2Fo/lgTFAWwDOCdDsCtgn1QSeKcFBATt6HycE=;
 b=B4FHBiTA81PS20At2aAdRgcW3X54lVUKtWbvPoexbgTva8K9gHvQIfs6qL17xwPT2O
 aqVoylJbeq5asJC0mrMdQSP4ckzup4kNPaI63d4pMvY+cCKx8jZV6OMzvm8CKC4HpCoH
 jvJaB4jz39cw0SOxTCxjxoJi70gaBBwOQbvXhaf3s0quQrbo6baZe7FlwbJEDJcvqr+i
 +ohEY8VLq2sQxevF8w/cmfyFelalU0OgDEysKiew8DpKCuQQj/5JhmQzaHJej6powrPh
 yJ5OzRFxiltClLcr7ZgHKjEoc+Nl1Jwckp+UpwJbHNA5Ofrv3NHB8MqUqcbKrVzIk9J/
 hCLQ==
X-Gm-Message-State: AOAM53303X0cU7sFenE1xtkKPgPWADK77LIYFAlDTPCFSAMn9kJACdTz
 7l5kOdlXQnJUXhSbjRipo27+PQ==
X-Google-Smtp-Source: ABdhPJy+sgrVHk4mPzMJ5HeDnAsFrNLkiNzTwH7QjEt5wPfTDeXlC4CDkLSMrSghu4zxd6CNGrA38A==
X-Received: by 2002:a05:620a:1397:: with SMTP id
 k23mr11014086qki.380.1631893105758; 
 Fri, 17 Sep 2021 08:38:25 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id t194sm5357503qka.72.2021.09.17.08.38.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:38:25 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:38:24 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Message-ID: <20210917153824.GG2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-8-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-8-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 07/15] drm/shmobile: cleanup:
 drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
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

On Thu, Sep 16, 2021 at 11:15:44PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> index 7db01904d18d..8ee215ab614e 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -156,10 +156,12 @@ static int shmob_drm_pm_suspend(struct device *dev)
>  static int shmob_drm_pm_resume(struct device *dev)
>  {
>  	struct shmob_drm_device *sdev = dev_get_drvdata(dev);
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(sdev->ddev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(sdev->ddev, ctx, 0, ret);
>  	shmob_drm_crtc_resume(&sdev->crtc);
> -	drm_modeset_unlock_all(sdev->ddev);
> +	DRM_MODESET_LOCK_ALL_END(sdev->ddev, ctx, ret);
>  
>  	drm_kms_helper_poll_enable(sdev->ddev);
>  	return 0;
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
