Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B2CBB082
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 15:45:56 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 261ED10E3CC;
	Sat, 13 Dec 2025 14:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFUxfOQE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4FBB144EA5;
	Sat, 13 Dec 2025 14:38:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765636714;
 b=VPpgy9LstkwNoWKoJA12EdXCy+gcd7utZtK2fy2KdItqHtlWf4YAtsAqjFFLOD8sJVEW1
 tskVhsULLUVbfCstOPh7sAGSuY63YiDl3uz1aNyHMrbmup5rOPwOZVCVRx1dQ2x99Pz4gJE
 omWwBJarsU05BPz7iVYBn3nrNk2p6oyBxbrZTw8FsizE6J9n1JCPO9BOqGSyBRVOerSx8Nj
 sNmKNJVZvxRA3FQxqSVISUpEJ8mLtQ2Gdf1AVXRnkl6UN2Uj0+Cl8EeFOEqr82L1RMEm6Y/
 M2KbjlhFrRb6AF6v0DIeLHG5yGL+VAsrdiEmrerRsfaQrUnQ3satMrvil/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765636714; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uJLWCuraazYVNYvdbBRPhuMviLXMQA3f4GQx3Gx5EeA=;
 b=a3lVanbvt8iWfTWCqS8lNd3iMkRFiZDDxMRHhFwcBXn8sk+nUGKiFOr7FXIOTb6kwhrT5
 bvi0cULU3uH1/5aL+OeI7roYI/ZrYi7/sBdSnpyNwDl1yItxoen8zh53D8uPH5Fg6TQC8pU
 IVxBa+mkVzpxeM54AWstsuK1C+TqOMAGPxZo3bwJ2fx97IOr/JC+FVq3VaODCxEI5lHDDE4
 AqecCAah83/BfrDLb5RPLFbML+RM770I0OeOQNNsY8cbEi+81kKD1k2ixMIh7vqsm5VPFws
 nsOYVcvYK4eVJ9DU5bUBMI8T8W0aAsQ/5RvN2qxAGPohoXH4QbRoBnacdSCw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D6B5444E20
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 14:38:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F64D10E15E
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 14:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765637152; x=1797173152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3O7UystAmu0laPnZukWplU+jTS2X0j4gWkEiv+zu7M=;
  b=MFUxfOQEL4v61VWsLUof/rRrVBwfqUaBpg5vAAlwoLFWm9s02rCyzLYL
   KxvOO4n10v1ZDeGEjM7Hgv602wiSq/QHydFnqoQBMZrgnrMa26oBhlGhB
   peKRS32ZZPSJbV+64qEnNyef5poEhFsOoCBc6tFl0fl5otIUzZZz6Dh8m
   GHf+OnpduxjxChYqEty7OW0npoywoWFriMRxPbsk2O0pt6uYPGWKQFRCF
   Ypg7oOg/O18jUi+xudgVt2RsOu/hp8kvdQnekLJpBulkvfXzcj1Pw9O/g
   YfMLM5Ycf0i6Tc8ntKyb5VCOdBDbxXg1p2XTIXtDWnKxw2SFbTplsVW96
   Q==;
X-CSE-ConnectionGUID: XZtW6agBQsSw9vZQBl8dnQ==
X-CSE-MsgGUID: KW9MhGFLSyq0q4mUsL5ihA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78727492"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800";
   d="scan'208";a="78727492"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2025 06:45:51 -0800
X-CSE-ConnectionGUID: Pv9s2lbRQmSJaXuB0ktrRw==
X-CSE-MsgGUID: r3LA0x/jQp2Xk2n+5OlajA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800";
   d="scan'208";a="201502891"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 06:45:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQsU-000000007kV-0nSD;
	Sat, 13 Dec 2025 14:45:46 +0000
Date: Sat, 13 Dec 2025 22:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Shephard <bshephar@bne-home.net>, aliceryhl@google.com,
	joelagnelf@nvidia.com, acourbot@nvidia.com, airlied@redhat.com
Subject: Re: [PATCH v3] drm/nova: Align GEM memory allocation to system page
 size
Message-ID: <202512132208.bhsQf8d8-lkp@intel.com>
References: <20251208071810.653223-1-bshephar@bne-home.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208071810.653223-1-bshephar@bne-home.net>
Message-ID-Hash: E555BXSPRIHMVDRKEN5L2E75RBZW5GMA
X-Message-ID-Hash: E555BXSPRIHMVDRKEN5L2E75RBZW5GMA
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Brendan Shephard <bshephar@bne-home.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E555BXSPRIHMVDRKEN5L2E75RBZW5GMA/>
Archived-At: 
 <https://lore.freedesktop.org/202512132208.bhsQf8d8-lkp@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Brendan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 37bb2e7217b01404e2abf9d90d8e5705a5603b52]

url:    https://github.com/intel-lab-lkp/linux/commits/Brendan-Shephard/drm-nova-Align-GEM-memory-allocation-to-system-page-size/20251208-153603
base:   37bb2e7217b01404e2abf9d90d8e5705a5603b52
patch link:    https://lore.kernel.org/r/20251208071810.653223-1-bshephar%40bne-home.net
patch subject: [PATCH v3] drm/nova: Align GEM memory allocation to system page size
config: x86_64-buildonly-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132208.bhsQf8d8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132208.bhsQf8d8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132208.bhsQf8d8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `ok_or` found for type `usize` in the current scope
   --> drivers/gpu/drm/nova/gem.rs:31:45
   |
   31 |         let aligned_size = page_align(size).ok_or(EINVAL)?;
   |                                             ^^^^^ method not found in `usize`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
