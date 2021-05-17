Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96932382A94
	for <lists+nouveau@lfdr.de>; Mon, 17 May 2021 13:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADAA6E929;
	Mon, 17 May 2021 11:09:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66896E03B;
 Mon, 17 May 2021 11:08:59 +0000 (UTC)
IronPort-SDR: FWzk8ctLKNGkv51/KalBf3wj6T5hf5TIzn1+LRugNpsOtOK6vkIFMHRCO5AY0oXxGwm28RmDiv
 vJv2YyCouEiA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="180716843"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="180716843"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 04:08:58 -0700
IronPort-SDR: GGEOLPLOmLJeLa1cAW3kGTxlUUNAQiB9Y8BmFXg07FAYZodrtWGUlHmB3GWBWgUvoG5lmMETjT
 +goB1MxW2RJg==
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; d="scan'208";a="438868164"
Received: from sudhirk1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.50.192])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 04:08:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, bskeggs@redhat.com
In-Reply-To: <20210516185937.5644-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210516185937.5644-1-tzimmermann@suse.de>
Date: Mon, 17 May 2021 14:08:51 +0300
Message-ID: <87lf8dhb24.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH 0/3] drm: Remove some includes of drm_legacy.h
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, 16 May 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Remove include statements for DRM legacy headers. None of these
> dependencies is required. Built-tested w/o CONFIG_DRM_LEGACY set.
>
> These patches should probably go through drm-misc, like the rest
> of the legacy cleanups.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Thomas Zimmermann (3):
>   drm/i915: Don't include drm_legacy.h
>   drm/nouveau: Don't include drm_legacy.h
>   drm: Don't include drm_legacy.h in drm_lease.c
>
>  drivers/gpu/drm/drm_lease.c              | 1 -
>  drivers/gpu/drm/i915/gem/i915_gem_phys.c | 1 -
>  drivers/gpu/drm/i915/i915_drv.h          | 1 -
>  drivers/gpu/drm/nouveau/nouveau_ttm.c    | 2 --
>  4 files changed, 5 deletions(-)
>
>
> base-commit: 77fc6f68ed347b0a4c6969f6adac70026d5b1449
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: c59ca2ddb182af06006fa360ad3e90fe16b93d3a
> prerequisite-patch-id: 8c45deec68d6ab65d66f551b51b12acf2e9ae0b4
> prerequisite-patch-id: 742f08083f0d5776068a761b1e2432e8edc2bdf8
> prerequisite-patch-id: 39cfaf5f337ec53d3237bf2a700e77c84f789039
> --
> 2.31.1
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
