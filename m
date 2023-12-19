Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C681872E
	for <lists+nouveau@lfdr.de>; Tue, 19 Dec 2023 13:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1690E10E489;
	Tue, 19 Dec 2023 12:14:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A08410E488;
 Tue, 19 Dec 2023 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702988092; x=1734524092;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MzXwOKF36dSLvD7SAiEMA9wsT0Rd8g3q7N4ec+ws4cI=;
 b=Bf59oeaakCBqdI4kc2dPu7Y6nIdzOLciUjAdaGWj9DeXfDzZH3slkEOz
 zDNXKS0z86HFX0e2J4JmFo3YBcG8vPvlEfFNoPSej8Mi2+7GVl2ExzHNF
 xvvhtMq+bAUNkMRPLyH9ckfQQPCe2PgptLMtXgSbDwJUuz/A3eaZhzeOv
 LBi0LELoNK+zvjs9eU3emmuWDG+7sXi14ff+nz4PDyi1L8uLVNYXxR7t4
 mHA1sRlJZ/YRldtWUrnKnz6qGXzeSps2doSTe89sotqWrtYcsKkUkhq9C
 jZGT+jtaXQXBBOkO4V/Gpg3Z75GLtGNgh8y6XBvjyPEZOOyGFOtGe15oK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="459991812"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="459991812"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="810216191"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; d="scan'208";a="810216191"
Received: from alexeyze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.118])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 04:14:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: include drm/drm_edid.h only where needed
In-Reply-To: <20231212135418.3816792-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231212135418.3816792-1-jani.nikula@intel.com>
Date: Tue, 19 Dec 2023 14:14:46 +0200
Message-ID: <87il4utmmh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 12 Dec 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
> files when drm_edid.h is modified, while there are only a few files that
> actually need to include drm_edid.h.

Ping?

>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/head.c     | 1 +
>  drivers/gpu/drm/nouveau/nouveau_connector.h | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
> index 5f490fbf1877..83355dbc15ee 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/head.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
> @@ -32,6 +32,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_vblank.h>
>  #include "nouveau_connector.h"
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
> index a2df4918340c..0608cabed058 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
> @@ -35,7 +35,6 @@
>  
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/drm_crtc.h>
> -#include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_util.h>
>  
> @@ -44,6 +43,7 @@
>  
>  struct nvkm_i2c_port;
>  struct dcb_output;
> +struct edid;
>  
>  #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
>  struct nouveau_backlight {

-- 
Jani Nikula, Intel
