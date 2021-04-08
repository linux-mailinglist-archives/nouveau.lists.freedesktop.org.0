Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F75358188
	for <lists+nouveau@lfdr.de>; Thu,  8 Apr 2021 13:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADAB6EA97;
	Thu,  8 Apr 2021 11:19:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45F46EA9B
 for <nouveau@lists.freedesktop.org>; Thu,  8 Apr 2021 11:19:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 g66-20020a1c39450000b0290125d187ba22so415532wma.2
 for <nouveau@lists.freedesktop.org>; Thu, 08 Apr 2021 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7MyYEn9i2H/YcmRBa5m+qswzCV9lJj45DGS2du8D2As=;
 b=VZ6krWmPnff3rHrTu1YBPFVdpjNvgWRo+PMkwb2/yv64ErPAFo1LTBr9XGLjEybJRp
 yDXvpbDylqRd0tH22iKkYhm00Hh3iU5gUzE+oevKRklnndB881b26zFi5PshljLdi40O
 h6ZckHexnPdr0xgMsvLhWxsst+VXghWxVOD8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7MyYEn9i2H/YcmRBa5m+qswzCV9lJj45DGS2du8D2As=;
 b=ShqaaASgHmP+P5OyHUceJeYT0RNYJgHJZ/bFLcdWi/7jsH9zbfN7JZzRsqJrO1VzsJ
 sV60q5A8X4ajGEDt6/LpLjMwFAuEj/QERq5PHQDtKMHGADdY99H2owtQ7rWERQcmGWzb
 fsIMD7QO91vQ5m/XIyMLwVYuvWdB+FwaMiaGUQ4dWfEPqjkwrEEWURHBwPw/aCsJQ5sf
 XfhZjjaIZLAAjIH6fN2Vemg+XDIAAv4ld/X5v/bzqAF4gJ8T8J+kndr5HE7oJmHkZ/nI
 R3IGeSxkE6GwNWLMDOtM7/9YgzNGOQq26GKuqLggZcdc5IyS69RrXTYL/h+ixIG2UCyW
 8iJQ==
X-Gm-Message-State: AOAM532iQL+PG88oDKSOaRkVBIKwFpeBViIjKPc1+KjJlEWG3I2uYuls
 Cs3rvqZ2yhvg2sCeeCrPezlFRg==
X-Google-Smtp-Source: ABdhPJwVXGk6II7OwYliQ9jwB6zvIqzky42R8LIj54sh24c+NrzV1rA30sUfpWa13IAc+0jtn1AqhA==
X-Received: by 2002:a1c:7713:: with SMTP id t19mr6915193wmi.13.1617880755544; 
 Thu, 08 Apr 2021 04:19:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g15sm11081167wmq.31.2021.04.08.04.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:19:14 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:19:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YG7msOScvAKpjAXx@phenom.ffwll.local>
References: <20210406090903.7019-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406090903.7019-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH 0/8] drm: Clean up mmap for TTM-based GEM
 drivers
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
Cc: dri-devel@lists.freedesktop.org, shashank.sharma@amd.com, airlied@linux.ie,
 nouveau@lists.freedesktop.org, Felix.Kuehling@amd.com, sroland@vmware.com,
 nirmoy.das@amd.com, amd-gfx@lists.freedesktop.org, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, sam@ravnborg.org, christian.koenig@amd.com,
 zackr@vmware.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 11:08:55AM +0200, Thomas Zimmermann wrote:
> Implement mmap via struct drm_gem_object_functions.mmap for amdgpu,
> radeon and nouveau. This allows for using common DRM helpers for
> the mmap-related callbacks in struct file_operations and struct
> drm_driver. The drivers have their own vm_ops, which are now set
> automatically by the DRM core functions. The code in each driver's
> verify_access becomes part of the driver's new mmap implementation.

Is there anything left in there which isn't already handled by the gem
checks? Iirc there was some custom limit for ttm drivers once to allow
co-existing with ums drivers, but that's never really been a thing since
forever ...
-Daniel

> 
> With the GEM drivers converted, vmwgfx is the only user of
> ttm_bo_mmap() and related infrastructure. So move everything into
> vmwgfx and delete the rsp code from TTM.
> 
> This touches several drivers. Preferably everything would be merged
> at once via drm-misc-next.
> 
> Thomas Zimmermann (8):
>   drm/ttm: Don't override vm_ops callbacks, if set
>   drm/amdgpu: Remove unused function amdgpu_bo_fbdev_mmap()
>   drm/amdgpu: Implement mmap as GEM object function
>   drm/radeon: Implement mmap as GEM object function
>   drm/nouveau: Implement mmap as GEM object function
>   drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
>   drm/vmwgfx: Inline vmw_verify_access()
>   drm/ttm: Remove ttm_bo_mmap() and friends
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 64 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 19 ------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 71 ---------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
>  drivers/gpu/drm/nouveau/nouveau_bo.c        | 10 ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c       |  3 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c       | 36 +++++++++++
>  drivers/gpu/drm/nouveau/nouveau_ttm.c       | 49 --------------
>  drivers/gpu/drm/nouveau/nouveau_ttm.h       |  1 -
>  drivers/gpu/drm/radeon/radeon_drv.c         |  3 +-
>  drivers/gpu/drm/radeon/radeon_gem.c         | 52 +++++++++++++++
>  drivers/gpu/drm/radeon/radeon_ttm.c         | 65 -------------------
>  drivers/gpu/drm/radeon/radeon_ttm.h         |  1 -
>  drivers/gpu/drm/ttm/ttm_bo_vm.c             | 60 ++---------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  9 ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 51 ++++++++++++++-
>  include/drm/ttm/ttm_bo_api.h                | 13 ----
>  include/drm/ttm/ttm_device.h                | 15 -----
>  22 files changed, 212 insertions(+), 365 deletions(-)
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
