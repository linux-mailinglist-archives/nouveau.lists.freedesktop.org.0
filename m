Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A595A40FC30
	for <lists+nouveau@lfdr.de>; Fri, 17 Sep 2021 17:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275806ED98;
	Fri, 17 Sep 2021 15:24:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EDA6ED92
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 15:24:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso7150273wmd.5
 for <nouveau@lists.freedesktop.org>; Fri, 17 Sep 2021 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=UUmIc1Zm6f0TtwRpO+dF5pS2Y2cDE7pjg0cLbOF+M+E=;
 b=Rzn08IPZenhQ6bvtAtCZFtUgcNOadCOdu78eHBCqYGv/hV+L9cluJaEyplz5gcBA7R
 38wK30kV3P5we6pC4sOpGFJx71Gq1+1ryDNONUjrKLim7Yfc3dXqvMmu3/gJm1MKY0gs
 TcW6XWN+ON+jrkBcBdm/eQYlZqOq4Sg4Mar8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=UUmIc1Zm6f0TtwRpO+dF5pS2Y2cDE7pjg0cLbOF+M+E=;
 b=1kWcqGrmu0lqO/cptSOEROSCKfZKmGwBhtCup1n1EPd8QHVR1VS3RckYp/1Urf2+1d
 aIYLMOATTvl7xPkt7sE7MaZP9TcLr0gkaPRp0CWWH7cN3VXHpf9XM9/Cmq+RTZMiuldb
 QBbD4euleuTRucCUAbUQ9KiCHSJaMHk3qW0Gw0sznKudhNhqywdyhvpu3aBCVXERvuMh
 MQh70rxG3h/VfYcEPnGi2f24YbkB+48W8OfZ6q5wLqGc63jxe5qbo4CDSyZeqZkhuHCA
 uVE1v5hQG8iIV2CbOP0Tukzz5jW2GUYVSf+7HdDAv6VUfJUz5RB21Kfy3GQpST8Takz5
 f8ww==
X-Gm-Message-State: AOAM531EAfCsWv+OPyWwwqlXth6o52Fp5pWPzCC7PDMNXlCVBRGzBISP
 DIuMzcMzvHU9WIWyZCtCB5JF5g==
X-Google-Smtp-Source: ABdhPJy9S40vw/exT9dD330IOj7yv3V6vas+VLUTS5747KBqEVcQ3/55Lywp40+PNtXXNtDS+CHl4w==
X-Received: by 2002:a1c:7e12:: with SMTP id z18mr16190125wmc.60.1631892270408; 
 Fri, 17 Sep 2021 08:24:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r5sm6880779wrm.79.2021.09.17.08.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 08:24:29 -0700 (PDT)
Date: Fri, 17 Sep 2021 17:24:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Message-ID: <YUSzKxZwW8C29dLV@phenom.ffwll.local>
Mail-Followup-To: Fernando Ramos <greenfoo@u92.eu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20210916211552.33490-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Nouveau] [PATCH 00/15] drm: cleanup: Use
 DRM_MODESET_LOCK_ALL_* helpers where possible
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

On Thu, Sep 16, 2021 at 11:15:37PM +0200, Fernando Ramos wrote:
> Hi all,
> 
> One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> "use DRM_MODESET_LOCAL_ALL_* helpers instead of boilerplate". That's what this
> patch series is about.
> 
> You will find two types of changes here:
> 
>   - Replacing "drm_modeset_lock_all_ctx()" (and surrounding boilerplate) with
>     "DRM_MODESET_LOCK_ALL_BEGIN()/END()" in the remaining places (as it has
>     already been done in previous commits such as b7ea04d2)
> 
>   - Replacing "drm_modeset_lock_all()" with "DRM_MODESET_LOCK_ALL_BEGIN()/END()"
>     in the remaining places (as it has already been done in previous commits
>     such as 57037094)
>     
> Most of the changes are straight forward, except for a few cases in the "amd"
> and "i915" drivers where some extra dancing was needed to overcome the
> limitation that the DRM_MODESET_LOCK_ALL_BEGIN()/END() macros can only be used
> once inside the same function (the reason being that the macro expansion
> includes *labels*, and you can not have two labels named the same inside one
> function)
> 
> Notice that, even after this patch series, some places remain where
> "drm_modeset_lock_all()" and "drm_modeset_lock_all_ctx()" are still present,
> all inside drm core (which makes sense), except for two (in "amd" and "i915")
> which cannot be replaced due to the way they are being used.

Can we at least replace those with drm_modeset_lock_all_ctx and delete
drm_modeset_lock_all? That would be really nice goal to make sure these
don't spread further.

Otherwise great stuff, I'm trying to volunteer a few reviewers.
-Daniel

> 
> Fernando Ramos (15):
>   dmr: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   dmr/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   dmr/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
>   doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup
> 
>  Documentation/gpu/todo.rst                    | 17 -------
>  Documentation/locking/ww-mutex-design.rst     |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 13 +++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++----------
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 23 +++++----
>  drivers/gpu/drm/drm_client_modeset.c          | 14 +++---
>  drivers/gpu/drm/drm_crtc_helper.c             | 18 ++++---
>  drivers/gpu/drm/drm_fb_helper.c               | 10 ++--
>  drivers/gpu/drm/drm_framebuffer.c             |  6 ++-
>  drivers/gpu/drm/gma500/psb_device.c           | 14 ++++--
>  drivers/gpu/drm/i915/display/intel_audio.c    | 12 +++--
>  drivers/gpu/drm/i915/display/intel_display.c  | 22 +++-----
>  .../drm/i915/display/intel_display_debugfs.c  | 35 ++++++++-----
>  drivers/gpu/drm/i915/display/intel_overlay.c  | 45 ++++++++---------
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c |  5 +-
>  drivers/gpu/drm/i915/i915_drv.c               | 12 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 ++-
>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 10 ++--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       | 12 +++--
>  drivers/gpu/drm/omapdrm/omap_fb.c             |  6 ++-
>  drivers/gpu/drm/radeon/radeon_device.c        | 13 +++--
>  drivers/gpu/drm/radeon/radeon_dp_mst.c        |  7 ++-
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c      |  6 ++-
>  drivers/gpu/drm/tegra/dsi.c                   |  6 ++-
>  drivers/gpu/drm/tegra/hdmi.c                  |  5 +-
>  drivers/gpu/drm/tegra/sor.c                   | 10 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         | 11 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 12 +++--
>  28 files changed, 222 insertions(+), 180 deletions(-)
> 
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
