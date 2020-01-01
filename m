Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE1B12E037
	for <lists+nouveau@lfdr.de>; Wed,  1 Jan 2020 19:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E2389A4B;
	Wed,  1 Jan 2020 18:51:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43B889AA2
 for <nouveau@lists.freedesktop.org>; Wed,  1 Jan 2020 18:51:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a5so4000814wmb.0
 for <nouveau@lists.freedesktop.org>; Wed, 01 Jan 2020 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8uPCxi3Y1/pc0576oAFGCcv9ILxWB3/3GiCiHCXgko=;
 b=CovNZjlE6y41FxRRV2dQgC2LXmUHj1E8p0Nrv8qiRfWxbkQdYpbWLSMjj/b+oII78U
 wl3wEHZITaqtJDiX2UUnM3rU9Poj3VDz0KTlFfXfgsLsgcwqUU8n+ad18kAFMtdYP3Nl
 H6F+gk0amyScbp2FsWH2Pzgq8Mylv+lGIT/y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=D8uPCxi3Y1/pc0576oAFGCcv9ILxWB3/3GiCiHCXgko=;
 b=fy3OyhEyEsgfrgQcmhPmtAyHQA6r87fjTwibFvyQ1xyyg8dpjdfchl2iO3lzQ7F9Ht
 ieCPD4XwSkjrBOp8qWZs5UUyy5EkDMdFrrKWHFavOMveFioazX0lQaRMCpwUIWcyTdw0
 /GADRBnAwfwjKOm2MUjnGo8AD6X9dysktbKtWqhqu8AYKlInmULH5W86Cisrfy5j0oAd
 5FuQe+3W7YD0EJMAsp+hRsaRvWWtvDuPhZdL8f7EvGQohnpy2taaoI6R1F+1pZFhDvU+
 FTXlmkzy+zjYv4a2NiutulzD7UEmM+XUJf8jeIeTn+34SJ+j4aaGpeQ1EJfPTE2tbcgl
 7pgg==
X-Gm-Message-State: APjAAAUrspO1rtDgbmH+4YZrOHYmxTrsAQMeyhdYvkdMF9zg1dg+njDu
 8mmdtXz/GpXBKXdSVY0AbyxjNw==
X-Google-Smtp-Source: APXvYqyjqRvgYGtxavvSSbnVsxx3hbCvsLvioRActoXXQldrptMzEMi+l6Q2nwcO1dPqXP/rbpsjRA==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr10459265wmm.70.1577904711502; 
 Wed, 01 Jan 2020 10:51:51 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([194.230.159.125])
 by smtp.gmail.com with ESMTPSA id b21sm6272694wmd.37.2020.01.01.10.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 10:51:50 -0800 (PST)
Date: Wed, 1 Jan 2020 19:51:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Message-ID: <20200101185147.GB3856@dvetter-linux.ger.corp.intel.com>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 bskeggs@redhat.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191231205734.1452-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191231205734.1452-1-wambui.karugax@gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
Subject: Re: [Nouveau] [PATCH] drm/nouveau: use NULL for pointer assignment.
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, daniel@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 11:57:34PM +0300, Wambui Karuga wrote:
> Replace the use of 0 in the pointer assignment with NULL to address the
> following sparse warning:
> drivers/gpu/drm/nouveau/nouveau_hwmon.c:744:29: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll check with Ben next week or so whether he wants to pick these up or
whether I should stuff them into drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index d445c6f3fece..1c3104d20571 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -741,7 +741,7 @@ nouveau_hwmon_init(struct drm_device *dev)
>  			special_groups[i++] = &pwm_fan_sensor_group;
>  	}
>  
> -	special_groups[i] = 0;
> +	special_groups[i] = NULL;
>  	hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau", dev,
>  							&nouveau_chip_info,
>  							special_groups);
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
