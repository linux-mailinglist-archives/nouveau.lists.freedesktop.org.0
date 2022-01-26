Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6457E49D195
	for <lists+nouveau@lfdr.de>; Wed, 26 Jan 2022 19:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4651910E5AF;
	Wed, 26 Jan 2022 18:21:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6275010E7D8;
 Wed, 26 Jan 2022 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189970; x=1674725970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZbI2cuArWWdUB2fC+oAVhsfmcYeXYC2uQgZrAJN4GB4=;
 b=GLIqyRFEIxT1aoRhdHUsHxJ+0XKCS0nhEfogfzowNTv5VwguGJK8UTSv
 7ePIOUZGN7hMwH4E7t2j2qBgaaQCU85iSun8NU9zoc06roYMTAEZjl0s2
 Us7skCUJ5iKOALTy6AXCTBSWPDOIybHceczOZm8MtrcHQg+uycPlHusWB
 mmA1FE0p/asGJoHPDQxlwPTvkT6UZzVlbmG/1jRD9aPBetNsq2IP7TGJh
 dYIbfMg18erxA4hVHSuVIphDmlOdAndxp4D1CAzEB868zaHbSaN9PLJd/
 8GB8YrwiOhzTllag2mvefhXQ74+lRyL7GrWs26DL2aAUIsDLdOo/mX/wA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227188776"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="227188776"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433076"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Date: Wed, 26 Jan 2022 01:39:40 -0800
Message-Id: <20220126093951.1470898-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Jan 2022 18:21:14 +0000
Subject: [Nouveau] [PATCH v2 00/11] lib/string_helpers: Add a few string
 helpers
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add some helpers under lib/string_helpers.h so they can be used
throughout the kernel. When I started doing this there were 2 other
previous attempts I know of, not counting the iterations each of them
had:

1) https://lore.kernel.org/all/20191023131308.9420-1-jani.nikula@intel.com/
2) https://lore.kernel.org/all/20210215142137.64476-1-andriy.shevchenko@linux.intel.com/#t

Now there is also the v1 of this same patch series:
https://lore.kernel.org/all/20220119072450.2890107-1-lucas.demarchi@intel.com/

Going through the comments I tried to find some common ground and
justification for what is in here, addressing some of the concerns
raised.

a. This version should be a drop-in replacement for what is currently in
   the tree, with no change in behavior or binary size. For binary
   size what I checked was that the linked objects in the end have the
   same size (gcc 11). From comments in the previous attempts this seems
   also the case for earlier compiler versions

b. I didn't change the function name to choice_* as suggested by Andrew
   Morton in 20191023155619.43e0013f0c8c673a5c508c1e@linux-foundation.org
   because other people argumented in favor of shorter names for these
   simple helpers - if they are long and people simply not use due to
   that, we failed. However as pointed out in v1 of this patchseries,
   onoff(), yesno(), enabledisable(), enableddisabled() have some
   issues: the last 2 are hard to read and for the first 2 it would not
   be hard to have the symbol to clash with variable names.
   From comments in v1, most people were in favor (or at least not
   opposed) to using str_on_off(), str_yes_no(), str_enable_disable()
   and str_enabled_disabled().

c. Use string_helper.h for these helpers - pulling string.h in the
   compilations units was one of the concerns and I think re-using this
   already existing header is better than creating a new string-choice.h

d. One alternative to all of this suggested by Christian König
   (43456ba7-c372-84cc-4949-dcb817188e21@amd.com) would be to add a
   printk format. But besides the comment, he also seemed to like
   the common function. This brought the argument from others that the
   simple yesno()/enabledisable() already used in the code (or new
   renamed version) is easier to remember and use than e.g. %py[DOY]


Changes in v2:

  - Use str_ prefix and separate other words with underscore: it's a
    little bit longer, but should improve readability

  - Patches we re-split due to the rename: first patch adds all the new
    functions, then additional patches try to do one conversion at a
    time. While doing so, there were some fixes for issues already
    present along the way

  - Style suggestions from v1 were adopted

In v1 it was suggested to apply this in drm-misc. I will leave this to
maintainers to decide: maybe it would be simpler to merge the first
patches on drm-intel-next, wait for the back merge and merge the rest
through drm-misc - my fear is a big conflict with other work going in
drm-intel-next since the bulk of the rename is there.

I tried to figure out acks and reviews from v1 and apply them to how the
patches are now split.

thanks
Lucas De Marchi

Lucas De Marchi (11):
  lib/string_helpers: Consolidate string helpers implementation
  drm/i915: Fix trailing semicolon
  drm/i915: Use str_yes_no()
  drm/i915: Use str_enable_disable()
  drm/i915: Use str_enabled_disabled()
  drm/i915: Use str_on_off()
  drm/amd/display: Use str_yes_no()
  drm/gem: Sort includes alphabetically
  drm: Convert open-coded yes/no strings to yesno()
  tomoyo: Use str_yes_no()
  cxgb4: Use str_yes_no()

 drivers/gpu/drm/amd/amdgpu/atom.c             |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  14 +-
 drivers/gpu/drm/dp/drm_dp.c                   |   3 +-
 drivers/gpu/drm/drm_client_modeset.c          |   3 +-
 drivers/gpu/drm/drm_gem.c                     |  23 +-
 drivers/gpu/drm/i915/display/g4x_dp.c         |   6 +-
 .../gpu/drm/i915/display/intel_backlight.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  46 ++--
 .../drm/i915/display/intel_display_debugfs.c  |  74 +++---
 .../drm/i915/display/intel_display_power.c    |   4 +-
 .../drm/i915/display/intel_display_trace.h    |   9 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  20 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   7 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   7 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |   4 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |   8 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   6 +-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c    |   3 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   9 +-
 .../drm/i915/gem/selftests/i915_gem_context.c |   7 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  11 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   7 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  52 ++--
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   5 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |   3 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  13 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c          |   9 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c  |  10 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |   3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |   5 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |  20 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  17 +-
 drivers/gpu/drm/i915/i915_driver.c            |   4 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   9 +-
 drivers/gpu/drm/i915/i915_params.c            |   5 +-
 drivers/gpu/drm/i915/i915_utils.h             |  21 +-
 drivers/gpu/drm/i915/intel_device_info.c      |   8 +-
 drivers/gpu/drm/i915/intel_dram.c             |  10 +-
 drivers/gpu/drm/i915/intel_pm.c               |  14 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |   4 +-
 drivers/gpu/drm/i915/selftests/i915_active.c  |   3 +-
 drivers/gpu/drm/i915/vlv_suspend.c            |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c |   5 +-
 drivers/gpu/drm/radeon/atom.c                 |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c             |  11 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c      |   4 +-
 .../ethernet/chelsio/cxgb4/cxgb4_debugfs.c    | 249 ++++++++++--------
 include/linux/string_helpers.h                |  20 ++
 security/tomoyo/audit.c                       |   2 +-
 security/tomoyo/common.c                      |  19 +-
 security/tomoyo/common.h                      |   1 -
 60 files changed, 482 insertions(+), 373 deletions(-)

-- 
2.34.1

