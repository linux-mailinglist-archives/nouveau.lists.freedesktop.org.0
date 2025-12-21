Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC5DCD3E5D
	for <lists+nouveau@lfdr.de>; Sun, 21 Dec 2025 11:06:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E412F10E188;
	Sun, 21 Dec 2025 10:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KADYRJAJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9B09445684;
	Sun, 21 Dec 2025 09:58:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766311108;
 b=kQ67RD2Qes49iQe0FUm7NUPW3MHkhQJ7rGOMLfNQStLvemM6r8Y1XpR2Ac3jOIDBcM5dO
 TwNVKisK2gYmwhlZhPq10iMyVoEG8QtulMOh+3EG8xo1bGetCSG79/cmrMPbT7PK9JvThgH
 HIemj8uYv2baPSqzLc9D1BGrrbw6u1lsVCV3TWxS6bekCNcprytzaxkGajajZcbNZoQmeet
 5b/bqj8LXEP+RXxwkvhdgGNg8TG+zDbbzfbPRjm2xvqkOPPHKRJGj8XmkOKt+zhYC6MxCBU
 TTOr9D5fMXS2UDK1dhQmdm88UtQRVyBNEYy4x+4KYlf6tVx9kBqBME8wAg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766311108; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wVgbOFeLTvsZ5lGwUxFxAuXYa1FsA1AfT9YMR5nGAVo=;
 b=L4KIMihcyK09g+8eTYCUyzHUVZD6GhFpyJ3ywKzXT30YbWVM8ZIDfTjLXAdn3bWFdXakP
 cMtu+aDnGgM79huqvMn/LryaPBs/S3Vut0LHX0bbkH9osHoWbAorn3T+y7K2mkYbxHSWTca
 gq3i0mVWsNkvUi4fPIsm3eoLzN/ZjtKttUjXW6WSVp4bn8YG4OeuFMoVYRDbOH6E0KTAFI/
 sYzrR+l3l1AQo34gAd0Wm0tHMKHurV/sBL7ga62lPMKJMq9OjNdoBPb+Yh9tjOZvFDQekRG
 AMfHpPGpW218DB5D+CKKhDKesaTOH04aNFsreG9fA2RGFBNHa2JdnyS1R4eg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6340C40278
	for <nouveau@lists.freedesktop.org>; Sun, 21 Dec 2025 09:58:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4C410E0DF
	for <nouveau@lists.freedesktop.org>; Sun, 21 Dec 2025 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766311561; x=1797847561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cV+GHpTGrrwmoaSg/9bIgLvAKQ7H+KiJlZ1VTLWlF/U=;
  b=KADYRJAJzTMFShd7/j5u7y9PY5sBDiolIcXRioH4ir649O30pspoTVPA
   wB/LQk/WV6Y34Rk54k6M5PW88VCfY7dyFPnLuz6Mt1QCHhkkKuSpKYC6F
   RRckM3olkikX0OA2Yql8HsvF+UYot+7o8TAuj4yPrNgKM8WAurECvBoDf
   O1cwI4aB/DETC0oQs5FAp0Vwv0a27T9Xy12N/NXKl4U2dkcd0PJIzXsC5
   2jtRyjC7s+TPmh4j7ti6+ljBIcCFHLrqSHSWBrfcyErdX5y0W8RpIU0wG
   HsStNCCZCeA7rtRIu0bfH3HV6HqZG3krILxQdqAZJyD+xy0Fn8GCQnElI
   Q==;
X-CSE-ConnectionGUID: KbC4kOPvRdmUMylVw3UNnQ==
X-CSE-MsgGUID: UvWLpgcVT9mNoT/BUJdt3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78520855"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800";
   d="scan'208";a="78520855"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2025 02:06:00 -0800
X-CSE-ConnectionGUID: nflT/EZyRHC2O+klgEorOg==
X-CSE-MsgGUID: FEZ3aVxdQYmwUT8gB9f+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800";
   d="scan'208";a="199244550"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a)
 ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 02:05:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXGK3-0000000050O-26rW;
	Sun, 21 Dec 2025 10:05:55 +0000
Date: Sun, 21 Dec 2025 11:05:32 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 9/9] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Message-ID: <202512211136.RZfacOxt-lkp@intel.com>
References: <20251218013910.459045-10-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218013910.459045-10-ttabi@nvidia.com>
Message-ID-Hash: KJ32U2YWKIMVQ7CAYQUS4VPF5J354IHD
X-Message-ID-Hash: KJ32U2YWKIMVQ7CAYQUS4VPF5J354IHD
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KJ32U2YWKIMVQ7CAYQUS4VPF5J354IHD/>
Archived-At: 
 <https://lore.freedesktop.org/202512211136.RZfacOxt-lkp@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on ea1013c1539270e372fc99854bc6e4d94eaeff66]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-pci-add-PCI-device-name-method/20251218-121537
base:   ea1013c1539270e372fc99854bc6e4d94eaeff66
patch link:    https://lore.kernel.org/r/20251218013910.459045-10-ttabi%40nvidia.com
patch subject: [PATCH v3 9/9] gpu: nova-core: create GSP-RM logging buffers debugfs entries
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512211136.RZfacOxt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211136.RZfacOxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211136.RZfacOxt-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
   Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
>> Diff in drivers/gpu/nova-core/gsp.rs:192:
            // Look up nova_core debugfs directory - only create entries if it exists.
            // If nova_core doesn't exist, debugfs_dir will be empty and file creation
            // becomes a no-op (data is still stored, just not exposed via debugfs).
   -        let debugfs_dir = debugfs::Dir::lookup(c_str!("nova_core"), None)
   -            .unwrap_or_else(debugfs::Dir::empty);
   +        let debugfs_dir =
   +            debugfs::Dir::lookup(c_str!("nova_core"), None).unwrap_or_else(debugfs::Dir::empty);
    
            let logs = debugfs_dir.scope(log_buffers, pdev.name(), |logs, dir| {
                dir.read_binary_file(c_str!("loginit"), &logs.loginit);
   Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
>> Diff in drivers/gpu/nova-core/gsp.rs:192:
            // Look up nova_core debugfs directory - only create entries if it exists.
            // If nova_core doesn't exist, debugfs_dir will be empty and file creation
            // becomes a no-op (data is still stored, just not exposed via debugfs).
   -        let debugfs_dir = debugfs::Dir::lookup(c_str!("nova_core"), None)
   -            .unwrap_or_else(debugfs::Dir::empty);
   +        let debugfs_dir =
   +            debugfs::Dir::lookup(c_str!("nova_core"), None).unwrap_or_else(debugfs::Dir::empty);
    
            let logs = debugfs_dir.scope(log_buffers, pdev.name(), |logs, dir| {
                dir.read_binary_file(c_str!("loginit"), &logs.loginit);
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
