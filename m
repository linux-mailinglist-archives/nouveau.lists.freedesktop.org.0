Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45DA4A0375
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 23:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6841B10E153;
	Fri, 28 Jan 2022 22:21:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5187B10E142
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 22:21:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a13so13437225wrh.9
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 14:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=O6jBj3yE34tMPyiH8WiT/7pfKWSenbjdGRkVHMIkNtk=;
 b=PohzoxAm5ukiTZAjB9mAUKVzFJchHbX8tH+Fsk66VWOGNBYvMDA0AXcXO0XsHJ8CF9
 Zj4I3iz26pHmBbmhCBUD/TZxU4C0BRhS6KCNrvW9agZJ3PwDqNdkxU2k3Il24JgqprCh
 Ph8Qb1t2tbjjSOyZYNafXvV38P1nxntJ6iU4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=O6jBj3yE34tMPyiH8WiT/7pfKWSenbjdGRkVHMIkNtk=;
 b=m1xC+coIqrNV7Mmpu8BLhOyOcMfQYazTU42LWRFRFz0pEMNP9TL36fgm+4VM0RaHvX
 yk3glWkrrbN4hlVlFDa9d/WgIVQFhf7+I+mFe04tN3G36T18GovEE/zW8zLc41e7O3JG
 ClgVv9fxSt2QKYUBM7zNNQy7lFrYV3hMjaOJVhyT56iznw22QECMEsUCGDp8+bGsx8F2
 iG/n3Og0aLp6ecDonrqClYmiBZzxFWGIAffSq/C0idgsTFUuoUyGzOoMjrG8dDIFxzaG
 cilqBOs+8dHb1RqD5pRmeuHNcfuuDZ6iSmr+cnuMmdW+ube2dFamlCkXFQ5WVH0W7MeK
 AYaw==
X-Gm-Message-State: AOAM533K68Ny990W16ottqaAdsjxDXeQosPQafGG/RXn85umEQvQT5Z7
 sxa46VV/JqvGlQy5GGDS2+CQ4w==
X-Google-Smtp-Source: ABdhPJyYnfwW4GpvwtYzDjoWM0WpzW/oIzI4gBHD+DV56yWwd0aJbs6KPAlXKyagq/4wkTOCQATqpQ==
X-Received: by 2002:adf:ed42:: with SMTP id u2mr8475552wro.57.1643408489814;
 Fri, 28 Jan 2022 14:21:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f20sm3531608wmg.2.2022.01.28.14.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 14:21:29 -0800 (PST)
Date: Fri, 28 Jan 2022 23:21:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tomohito Esaki <etom@igel.co.jp>
Message-ID: <YfRsZhMW1dS3EAxa@phenom.ffwll.local>
Mail-Followup-To: Tomohito Esaki <etom@igel.co.jp>,
 dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ben Skeggs <bskeggs@redhat.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Simon Ser <contact@emersion.fr>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Mark Yacoub <markyacoub@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Evan Quan <evan.quan@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Daniel Stone <daniel@fooishbar.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Takanari Hayama <taki@igel.co.jp>
References: <20220128060836.11216-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128060836.11216-1-etom@igel.co.jp>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Nouveau] [RFC PATCH v6 0/3] Add support modifiers for drivers
 whose planes only support linear layout
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
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>, Lee Jones <lee.jones@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 28, 2022 at 03:08:33PM +0900, Tomohito Esaki wrote:
> Some drivers whose planes only support linear layout fb do not support format
> modifiers.
> These drivers should support modifiers, however the DRM core should handle this
> rather than open-coding in every driver.
> 
> In this patch series, these drivers expose format modifiers based on the
> following suggestion[1].
> 
> On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
> > I think the best way forward here is:
> >   - add a new mode_config.cannot_support_modifiers flag, and enable
> > this in radeon (plus any other drivers in the same boat)
> >   - change drm_universal_plane_init() to advertise the LINEAR modifier
> > when NULL is passed as the modifier list (including installing a
> > default .format_mod_supported hook)
> >   - remove the mode_config.allow_fb_modifiers hook and always
> > advertise modifier support, unless
> > mode_config.cannot_support_modifiers is set
> 
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20190509054518.10781-1-etom@igel.co.jp/#24602575
> 
> v6:
> * add Reviewed-by and Acked-by
> * add a changelog per-patch

Thanks for resending with all that added, makes my life so much easier!

All applied, thanks a bunch.

Cheers, Daniel

> 
> v5: https://www.spinics.net/lists/dri-devel/msg330860.html
> * rebase to the latest master branch (5.17-rc1+)
> 	+ "drm/plane: Make format_mod_supported truly optional" patch [2]
>   [2] https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3
> 
> * change default_modifiers array from non-static to static
> * remove terminator in default_modifiers array
> * use ARRAY_SIZE to get the format_modifier_count
> * keep a sanity check in plane init func
> * modify several kerneldocs
> 
> v4: https://www.spinics.net/lists/dri-devel/msg329508.html
> * modify documentation for fb_modifiers_not_supported flag in kerneldoc
> 
> v3: https://www.spinics.net/lists/dri-devel/msg329102.html
> * change the order as follows:
>    1. add fb_modifiers_not_supported flag
>    2. add default modifiers
>    3. remove allow_fb_modifiers flag
> * add a conditional disable in amdgpu_dm_plane_init()
> 
> v2: https://www.spinics.net/lists/dri-devel/msg328939.html
> * rebase to the latest master branch (5.16.0+)
>       + "drm/plane: Make format_mod_supported truly optional" patch [2]
> 
> v1: https://www.spinics.net/lists/dri-devel/msg327352.html
> * The initial patch set
> 
> Tomohito Esaki (3):
>   drm: introduce fb_modifiers_not_supported flag in mode_config
>   drm: add support modifiers for drivers whose planes only support
>     linear layout
>   drm: remove allow_fb_modifiers
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
>  drivers/gpu/drm/drm_framebuffer.c             |  6 ++---
>  drivers/gpu/drm/drm_ioctl.c                   |  2 +-
>  drivers/gpu/drm/drm_plane.c                   | 23 +++++++++++--------
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  6 +++--
>  drivers/gpu/drm/radeon/radeon_display.c       |  2 ++
>  .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
>  include/drm/drm_mode_config.h                 | 18 +++++----------
>  include/drm/drm_plane.h                       |  3 +++
>  14 files changed, 45 insertions(+), 32 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
