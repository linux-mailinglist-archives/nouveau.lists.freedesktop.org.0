Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8816FC21
	for <lists+nouveau@lfdr.de>; Wed, 26 Feb 2020 11:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878106E484;
	Wed, 26 Feb 2020 10:26:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5EA6E25C
 for <nouveau@lists.freedesktop.org>; Wed, 26 Feb 2020 10:26:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so2277792wrn.6
 for <nouveau@lists.freedesktop.org>; Wed, 26 Feb 2020 02:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=B/so+mAbz6NPl+q0Sx9udFy2WbzDNdKEQXFbnDQqQj8=;
 b=cUQ6CGdv6WcoV4LLyhRQ4NK2vSe2wWSZgdVgVoBmGwn0pBzsavxYJ0HA5Cpr5pgrO/
 uWxzbSr41SeX3wBUXsFGL8bMxKSE1foG6QURLqVzb4+bGm0zPhnWmTmWs6uyxgNMINNb
 TgqhAjFJFWAgkS5HPxd1w+TKx/JfSYvcVqYJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=B/so+mAbz6NPl+q0Sx9udFy2WbzDNdKEQXFbnDQqQj8=;
 b=c0kNhkIreCSPXnX9UpF8S4nDY9AV2Ng0AuBEdC8GD9pXO3Srdide9f6P+2/LjIBV3F
 q7VZinvpeKKCfsWiAVac5/ouWM/BZ463ZJAV5mUb5lDRMW8BHG7pxPIuoT6uOoIfFc0/
 ALpwNJBNUmjfs+w7hDMXE9wtI76x83X37hJ07G4m3gP6NvG+Ayjj6uEFPJivQuwjEfRO
 yvQJyp3AmL7Xsac5p+Z2ih8pPHGdioGQTRgCHBr9ebGr3fFXjqXD4sugHj8ZXxFkH9cm
 4nAa5IbtcJ3xk1fgYo9GYgcgf+LMxx4quN28NG+3cMiqmqc+chqWN+lponMqnH9wUpdF
 Wn8g==
X-Gm-Message-State: APjAAAU77znTzjzUVK3OeoB0sji2HMc2zXanc3i+hOA0grPuFw942zSw
 HcysPOFiWwqKS0Q9QBICfKAMlg==
X-Google-Smtp-Source: APXvYqyaic4xQo3E/Unf2CRaHpk+u/TEAf+XZMWgyDfAqAgQQDfLUgUJjo2RiePHT9YbE25buECfyA==
X-Received: by 2002:adf:f288:: with SMTP id k8mr4974500wro.301.1582712814854; 
 Wed, 26 Feb 2020 02:26:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v8sm2579370wrw.2.2020.02.26.02.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 02:26:54 -0800 (PST)
Date: Wed, 26 Feb 2020 11:26:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20200226102652.GT2363188@phenom.ffwll.local>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225174400.GP2363188@phenom.ffwll.local>
 <f042cfae-8f74-0bd5-bd5f-dfb962c0c3b4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f042cfae-8f74-0bd5-bd5f-dfb962c0c3b4@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Subject: Re: [Nouveau] [PATCH 0/3] Add separate non-KMS state;
 constify struct drm_driver
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
 mripard@kernel.org, bskeggs@redhat.com, Daniel Vetter <daniel@ffwll.ch>,
 alexander.deucher@amd.com, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 06:39:08AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 25.02.20 um 18:44 schrieb Daniel Vetter:
> > On Tue, Feb 25, 2020 at 04:58:59PM +0100, Thomas Zimmermann wrote:
> >> This patchset moves legacy, non-KMS driver state from struct drm_driver
> >> into struct drm_legacy_state. Only non-KMS drivers provide an instance
> >> of the latter structure. One special case is nouveau, which supports
> >> legacy interfaces. It also provides an instance of the legacy state if
> >> the legacy interfaces have been enabled (i.e., defines the config opti=
on
> >> CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
> >>
> >> I reviewed all call sites of legacy state and functions to verify that
> >> DRIVER_LEGACY or DRIVER_KMS_LEGACY_CONTEXT is set on the device; or th=
at
> >> DRIVER_MODESET is not set.
> >>
> >> With the mutable KMS state removed, instances of struct drm_driver can
> >> be declared as constant. The patchset modifies the DRM core accordingl=
y.
> >> Individual drivers can follow later on.
> > =

> > Bikeshed: We very much have modern non-KMS drivers (vgem, etnaviv, v3d,
> > panfrost, ...). non-KMS !=3D legacy, which is what you're talking about
> > here.
> =

> OK, probably needs to be more precise.
> =

> > =

> > Other thing, and it's a bit raining on your parade: I don't see the poi=
nt.
> > Sprinkling a few more #ifdef CONFIG_DRM_LEGACY over the relevant parts
> > sounds like a reasonable idea. But this is a lot of churn for drivers
> > which are all pretty much dead, and just waiting for their eventual
> > removal. And from a compile-testing pov of making sure modern drivers
> > don't use any of the deprecated stuff wrapping it in CONFIG_DRM_LEGACY
> > should be plenty enough.
> =

> It's not about these old drivers, it's about having constant driver
> structures and maybe saving a few bytes in the modern drivers. If these
> old drivers hold back improvements to the drivers we care about, I don't
> see we they are not to be touched.
> =

> This cannot be solved with CONFIG_DRM_LEGACY, unless you want to wrap
> any reference in core code to legacy data. I tried at first and it
> turned out to be an unreadable mess.

Laurent has a patch series to constify drm_driver for all !legacy drivers.
Without changing the world.

So yeah it's possible, we're not hurting ourselves here (aside from the
few bytes if we don't do the #ifdev CONFIG_DRM_LEGACY).

https://patchwork.freedesktop.org/series/73811/

> And from a complexity POV the patchset is trivial. It adds a data
> structure to each old driver and moves a few initializers around. The
> worst thing that can happen is that code tried to dereference the legacy
> pointer when it's not set. This bug will happen with modern drivers, so
> we should see it easily.

Laurent's series is even more trivial I think.
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > And from a "make stuff const" I think Laurent's much more minimal series
> > also gets us there for all the drivers we care about.
> > -Daniel
> > =

> >>
> >> Thomas Zimmermann (3):
> >>   drm: Add separate state structure for legacy, non-KMS drivers
> >>   drm: Move non-kms driver state into struct drm_legacy_state
> >>   drm: Constify struct drm_driver in DRM core
> >>
> >>  drivers/gpu/drm/drm_bufs.c            | 10 +++++-----
> >>  drivers/gpu/drm/drm_context.c         |  9 +++++----
> >>  drivers/gpu/drm/drm_drv.c             | 12 ++++++++----
> >>  drivers/gpu/drm/drm_file.c            |  4 ++--
> >>  drivers/gpu/drm/drm_legacy_misc.c     |  6 +++---
> >>  drivers/gpu/drm/drm_lock.c            |  7 ++++---
> >>  drivers/gpu/drm/drm_pci.c             | 16 ++++++++++------
> >>  drivers/gpu/drm/drm_vblank.c          | 11 ++++++-----
> >>  drivers/gpu/drm/i810/i810_drv.c       | 10 +++++++---
> >>  drivers/gpu/drm/mga/mga_drv.c         | 16 ++++++++++------
> >>  drivers/gpu/drm/nouveau/nouveau_drm.c |  8 ++++++++
> >>  drivers/gpu/drm/r128/r128_drv.c       | 16 ++++++++++------
> >>  drivers/gpu/drm/savage/savage_drv.c   | 12 ++++++++----
> >>  drivers/gpu/drm/sis/sis_drv.c         |  8 ++++++--
> >>  drivers/gpu/drm/tdfx/tdfx_drv.c       |  6 +++++-
> >>  drivers/gpu/drm/via/via_drv.c         | 16 ++++++++++------
> >>  include/drm/drm_device.h              |  2 +-
> >>  include/drm/drm_drv.h                 | 21 +++++----------------
> >>  include/drm/drm_legacy.h              | 27 +++++++++++++++++++++++----
> >>  include/drm/drm_pci.h                 |  4 ++--
> >>  20 files changed, 138 insertions(+), 83 deletions(-)
> >>
> >> --
> >> 2.25.0
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
