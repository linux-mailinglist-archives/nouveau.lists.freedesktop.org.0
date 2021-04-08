Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0753035817B
	for <lists+nouveau@lfdr.de>; Thu,  8 Apr 2021 13:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E75A6EA93;
	Thu,  8 Apr 2021 11:16:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2796EA93
 for <nouveau@lists.freedesktop.org>; Thu,  8 Apr 2021 11:16:50 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so222023wmg.0
 for <nouveau@lists.freedesktop.org>; Thu, 08 Apr 2021 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2rGXrZ6/Y1EiQNPy9lkbFWL4CJZGqYO2LJVNvjD1io4=;
 b=OHopb0BGApE+w2iQb+y029BFxSz9rLKFQjmM26EOnFqolAo53AqcdxDPcgH4GGshsx
 BDo2R1Ngn8YhwFfhU1bRXkxhUkC8+CvFuLK4r/rDY/d45eKlxh8hkZKuhBPd4fzNvmq9
 9HQn1Z6vWXn5rxmfhIbP53Ja69zxlwtLV+/WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2rGXrZ6/Y1EiQNPy9lkbFWL4CJZGqYO2LJVNvjD1io4=;
 b=m+g9xHqz9CYBMOhv8+GcRaFHO6D1UoicC093w1SfpZx+urgQHRnWwaFIjd2exeTLXt
 7tJF14L10w0ni5lNGST+cF8fxXyeyCiPv/XuwGA1/jbj166IX+lBQODNVmwBmrSfSJSZ
 p96iZhQZC3xhHmcw8CjQgMgOLHRJ14fkEqjBAGzxdloHY9dJbFEUxdGrV+Og16adR3rj
 FYyxjVOc1hci8/Sbuaglls1wRD4cIEScSpaauViSDrEF/CFb+3UxJaxGDYt//wMUgXUe
 40V/4ytoUUfTmZJAKrA5MZoNZP7empgL3Kddalsx5hcMpYWRrxhJ5qXUTARRkO5vP1en
 d2PA==
X-Gm-Message-State: AOAM5321UzcW9YqVyPYSikieJhS5yFouc8aIgrrSMRGt0mCnPem5BJdl
 TzhQ9S2+IyafAX4KMB9shA+7Ug==
X-Google-Smtp-Source: ABdhPJxQtEIMNNWiroexEm/m5G85YkQS1wiT3VlgjBBAAWlukovDIO0E7vB7vyBxMtzOmujVy8JS4g==
X-Received: by 2002:a05:600c:89a:: with SMTP id
 l26mr7826257wmp.179.1617880609163; 
 Thu, 08 Apr 2021 04:16:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b6sm9577334wrv.12.2021.04.08.04.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:16:48 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:16:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YG7mHvmhPZIPA37B@phenom.ffwll.local>
References: <20210406082942.24049-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406082942.24049-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH 0/4] drm: Generic dumb_map_offset for
 TTM-based drivers
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
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, virtualization@lists.linux-foundation.org,
 kraxel@redhat.com, daniel@ffwll.ch, spice-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 10:29:38AM +0200, Thomas Zimmermann wrote:
> The implementation of drm_driver.dumb_map_offset is the same for several
> TTM-based drivers. Provide a common function in GEM-TTM helpers.

Out of curiosity, why does this not fit for radeon/amdgpu?
-Daniel

> 
> Thomas Zimmermann (4):
>   drm/gem-ttm-helper: Provide helper for struct
>     drm_driver.dumb_map_offset
>   drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
>   drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
>   drm/qxl: Use drm_gem_ttm_dumb_map_offset()
> 
>  drivers/gpu/drm/drm_gem_ttm_helper.c      | 33 ++++++++++++++++
>  drivers/gpu/drm/drm_gem_vram_helper.c     | 48 -----------------------
>  drivers/gpu/drm/nouveau/nouveau_display.c | 18 ---------
>  drivers/gpu/drm/nouveau/nouveau_display.h |  2 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c     |  3 +-
>  drivers/gpu/drm/qxl/qxl_drv.c             |  3 +-
>  drivers/gpu/drm/qxl/qxl_drv.h             |  3 --
>  drivers/gpu/drm/qxl/qxl_dumb.c            | 17 --------
>  drivers/gpu/drm/qxl/qxl_ioctl.c           |  4 +-
>  drivers/gpu/drm/qxl/qxl_object.h          |  5 ---
>  include/drm/drm_gem_ttm_helper.h          |  5 ++-
>  include/drm/drm_gem_vram_helper.h         |  7 +---
>  12 files changed, 45 insertions(+), 103 deletions(-)
> 
> --
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
