Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8347574D
	for <lists+nouveau@lfdr.de>; Wed, 15 Dec 2021 12:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B055210E715;
	Wed, 15 Dec 2021 11:04:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5353410E6F2;
 Wed, 15 Dec 2021 11:04:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="302576979"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="302576979"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 03:04:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="465553346"
Received: from adalyx-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.7.70])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 03:04:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
In-Reply-To: <20211215104318.18866-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211215104318.18866-1-tzimmermann@suse.de>
 <20211215104318.18866-4-tzimmermann@suse.de>
Date: Wed, 15 Dec 2021 13:04:00 +0200
Message-ID: <87pmpy3za7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Nouveau] [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into
 separate helper module
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 	* move DP helper code into dp/ (Jani)

I suggested adding the subdirectory, but I'm going to bikeshed the name,
which I didn't suggest.

$ find drivers/gpu/drm -mindepth 1 -maxdepth 1 -type d | wc -l
68

Assuming we move more of the drm modules to subdirectories, how are they
going to stand out from drivers?

I suggested drm_dp, which I understand results in tautology, but hey,
all the filenames under drm/ also have drm_*.[ch]. And I find that very
useful for git greps and other code archeology. With just the dp name,
you'd have to know and list all the drm subdirectories when looking up
stuff that's part of drm but not drivers.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
