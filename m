Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECB41F67D
	for <lists+nouveau@lfdr.de>; Fri,  1 Oct 2021 22:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841846F402;
	Fri,  1 Oct 2021 20:48:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0681F6F3F9
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 20:48:18 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id e16so30206qte.13
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 13:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=fTwGjqOo2qpFUBnSVDlFyolMyzUY3P07s+PYc+sfnxY=;
 b=DoDhvCYRyP3bI52k2WCEwtOJHIoz8ay9LklCmI5z0nlSjdj2gKo5hP9c/Xbp0MpgYa
 QkDbjNuGI1fN3ObZzMb/IffcrHuMfDl1JqpDiziGrymys0Mj0bpC18FoM/SQRJ2yhh+H
 mokkTqv/ZnP32g0hiEA/BcCjek8ynV3GjR40GtWy0/S2DA10ernlOVr5p65Kb0An0xqp
 ZaOOZjGcZtf04Mml416DbxGvTXbpoK3UueGTN5Jdjky0/3POHDtxBxU2PKWtUz0cjVCU
 D9jMXomhHB/OKNZVK51aa82CckJviyHHBn4r+QId2nGXfkZzAme7XSAZs0jtbiyCVQ2n
 AokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=fTwGjqOo2qpFUBnSVDlFyolMyzUY3P07s+PYc+sfnxY=;
 b=O7/dproDnuMS+ENNlThleMFkY00p7O5TStDb3zLndzNnLMoE0RTstqD2iCDvHDoSHf
 v7DTGdFIn4b3dJR1NYd6WR+uj+6jEhz4AidEwAnen6V6B3++T08S6dXH0TOynNbSi6vj
 Tic5klWYrjM95iO/3ABht3JySgYSgdZ0N+x2b59vNs3UpauzFQHty63tTlNkNcRjeEpS
 mRp7KS6f1ofUfP5oh9QkOXCNm1GFq6rG8oBW2Z6mT6B3xQyV1mqe4jucTyYMzrDq8C7T
 6QBeIFELng+63v9wZYz8n8rtk4CUZ04qQSChb9+st7OjVQvQtguOQOAC/QC1OiSo66gf
 cbMA==
X-Gm-Message-State: AOAM533RJOEnrwmOqnoZCbfKrYHQ9AXLw8fQXnOxXEJd7CdPxrytnZiX
 SYaZLgR/1AbZUvgMImF8eFM38A==
X-Google-Smtp-Source: ABdhPJxa6tbnxCBVxCCTZMZ2tB2zzEWn+wtu5XraFB8rYcu4iq9lSU2A8XqbxRaJTOI7W1N9S6DK7A==
X-Received: by 2002:a05:622a:1206:: with SMTP id y6mr82618qtx.68.1633121297387; 
 Fri, 01 Oct 2021 13:48:17 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id d16sm3951352qtw.14.2021.10.01.13.48.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Oct 2021 13:48:17 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:48:15 -0400
From: Sean Paul <sean@poorly.run>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>, Fernando Ramos <greenfoo@u92.eu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Message-ID: <20211001204815.GA2515@art_vandelay>
References: <20210924064324.229457-1-greenfoo@u92.eu>
 <20211001183655.GW2515@art_vandelay> <YVda4jNSGuQf50JV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVda4jNSGuQf50JV@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH v2 00/17] drm: cleanup: Use
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

On Fri, Oct 01, 2021 at 10:00:50PM +0300, Ville Syrj�l� wrote:
> On Fri, Oct 01, 2021 at 02:36:55PM -0400, Sean Paul wrote:
> > On Fri, Sep 24, 2021 at 08:43:07AM +0200, Fernando Ramos wrote:
> > > Hi all,
> > > 
> > > One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> > > "use DRM_MODESET_LOCAL_ALL_* helpers instead of boilerplate". That's what this
> > > patch series is about.
> > > 
> > > You will find two types of changes here:
> > > 
> > >   - Replacing "drm_modeset_lock_all_ctx()" (and surrounding boilerplate) with
> > >     "DRM_MODESET_LOCK_ALL_BEGIN()/END()" in the remaining places (as it has
> > >     already been done in previous commits such as b7ea04d2)
> > > 
> > >   - Replacing "drm_modeset_lock_all()" with "DRM_MODESET_LOCK_ALL_BEGIN()/END()"
> > >     in the remaining places (as it has already been done in previous commits
> > >     such as 57037094)
> > >     
> > > Most of the changes are straight forward, except for a few cases in the "amd"
> > > and "i915" drivers where some extra dancing was needed to overcome the
> > > limitation that the DRM_MODESET_LOCK_ALL_BEGIN()/END() macros can only be used
> > > once inside the same function (the reason being that the macro expansion
> > > includes *labels*, and you can not have two labels named the same inside one
> > > function)
> > > 
> > > Notice that, even after this patch series, some places remain where
> > > "drm_modeset_lock_all()" and "drm_modeset_lock_all_ctx()" are still present,
> > > all inside drm core (which makes sense), except for two (in "amd" and "i915")
> > > which cannot be replaced due to the way they are being used.
> > > 
> > > Changes in v2:
> > > 
> > >   - Fix commit message typo
> > >   - Use the value returned by DRM_MODESET_LOCK_ALL_END when possible
> > >   - Split drm/i915 patch into two simpler ones
> > >   - Remove drm_modeset_(un)lock_all()
> > >   - Fix build problems in non-x86 platforms
> > > 
> > > Fernando Ramos (17):
> > >   drm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/i915: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/msm: cleanup: drm_modeset_lock_all_ctx() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() drm/vmwgfx: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/shmobile: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/radeon: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/omapdrm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/nouveau: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/i915: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN() part 2
> > >   drm/gma500: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm/amd: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
> > >   drm: cleanup: remove drm_modeset_(un)lock_all()
> > >   doc: drm: remove TODO entry regarding DRM_MODSET_LOCK_ALL cleanup
> > > 
> > 
> > Thank you for revising, Fernando! I've pushed the set to drm-misc-next (along
> > with the necessary drm-tip conflict resolutions).
> 
> Ugh. Did anyone actually review the locking changes this does?
> I shot the previous i915 stuff down because the commit messages
> did not address any of it.

I reviewed the set on 9/17, I didn't see your feedback on that thread.

Sean

> 
> -- 
> Ville Syrj�l�
> Intel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
