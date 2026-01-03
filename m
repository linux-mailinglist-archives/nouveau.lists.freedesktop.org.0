Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62621CEFEFF
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 13:54:26 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71C8110E351;
	Sat,  3 Jan 2026 12:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5Vlyitk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED8D644C85;
	Sat,  3 Jan 2026 12:46:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767444377;
 b=O01SjHu37QXYV9Jus5UVSI+JyG+i/bpapmnfz5UvDo3HwqnlnUkkIFrvZaMi9eo3ta4Y7
 3JcDS4NS82Cn6Y359BzkXk+Wwj0dDu4PePy4+VoCYhC9U00mSpIwvzJzURJzEsnzwKLoz9i
 x5UfGcTy+RVYMp7pWmPImJbxY9r+5GDaH6Y/Eo2+a3H5U/5C8osw40L3JgcX2OU1VaD9+F3
 6/5tbhPd2EZN7L/7CLXYyyzlilsvPyozSePqMXsvooXUk7WNfkpOCwdIqULFktI+raAGfMj
 z0tczLcnbxe2i8epSPFFQL11oYZRXyygsdueQ8zJAEOiLKLb6cKnhoKGTphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767444377; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8fb8+89zs5BnaySh8ZDnShCSkOwVwpsEQtpIXdm0NuM=;
 b=RL8WQPeiHvYrpE6I0Rc1eXOOYiugp9RzgFgXp8B42w2fPliU2Ujn1/h1dWnQ6nQ3L/pmH
 Ms1xEoP6dAO+LxMGwe0LuSfcHq5hyPfNFAMfb2k7gev3cVN2Jd8Mo8eJMv+wWLQVEeTf56H
 qX3dtGNYFfh47A8lrWI36gZQ+TAtykGf0z3U4kqp3EOpUfO+4SQO66bQ6fnMC+PCrLFlquT
 840fAX1cVA67+lVIFFjcNWJvoc1okZUCPhOQz9KKHKVbL/pNFGGs51+QhIoAVNDNJ7kMSPW
 FB4mmZwyTOvkBXAE+Uki7aY2QmH6n7+S/NPu2dhUlBxXVvI7gml9jLIi9ERQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 98AD344B9B
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 12:46:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AAB2F10E2ED
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767444861; x=1798980861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oK30coeQKfL/fVgDXIniWhU24jzI0TWms9wqUpCrdLM=;
  b=D5Vlyitko9D2pLek0Fgzwbqdc7TBGUB3j0DIJowW1NiBjtmxyfnxtpsk
   2vAl4BSD1bKVGpHJf+GAPuIme2jr8SYmcHG80kKDlaVUlHwnqe83DABue
   n4xMIIZg6ApaYN6CNfn30mZ/inH/GOq3sUTMWYmdkWDXm+wz1UXGuUGox
   2EBuiSNdWBeHbVyXTP9va84pYuUObsYvxnfklkSXWsJLI5Mgg8TicRyeH
   nck81FOID/nu/F69eTLMXEZviq5/mnzUQ7JIl35x6LMO6pcErJM9zalaP
   8BIjwpTNsknZ5mg26z+Nt1h+j0VNUWMM9agc43hqR9iMuFI7UOEJD8g4y
   w==;
X-CSE-ConnectionGUID: AfzV9ZLETSe2Wz/obc32iQ==
X-CSE-MsgGUID: k8tEnSufSYmu2M9xrfvfDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="91550616"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800";
   d="scan'208";a="91550616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2026 04:54:20 -0800
X-CSE-ConnectionGUID: fzJkLddPSuGrlf+nLBTUCQ==
X-CSE-MsgGUID: 7GpofOlQQ/qWltUQ7b8BMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800";
   d="scan'208";a="202956797"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa)
 ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jan 2026 04:54:18 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc195-000000000hV-417J;
	Sat, 03 Jan 2026 12:54:15 +0000
Date: Sat, 3 Jan 2026 13:53:34 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Message-ID: <202601031330.EOufCyjz-lkp@intel.com>
References: <20260103045934.64521-12-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103045934.64521-12-ttabi@nvidia.com>
Message-ID-Hash: H6CAZOVNLNPPSV3H47JOLSUB2YJBJO7L
X-Message-ID-Hash: H6CAZOVNLNPPSV3H47JOLSUB2YJBJO7L
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H6CAZOVNLNPPSV3H47JOLSUB2YJBJO7L/>
Archived-At: 
 <https://lore.freedesktop.org/202601031330.EOufCyjz-lkp@intel.com/>
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

[auto build test ERROR on 7acc70476f14661149774ab88d3fe23d83ba4249]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/gpu-nova-core-rename-Imem-to-ImemSecure/20260103-130228
base:   7acc70476f14661149774ab88d3fe23d83ba4249
patch link:    https://lore.kernel.org/r/20260103045934.64521-12-ttabi%40nvidia.com
patch subject: [PATCH v5 11/11] gpu: nova-core: add PIO support for loading firmware images
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260103/202601031330.EOufCyjz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031330.EOufCyjz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031330.EOufCyjz-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:13:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod,
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:19:
            FalconModSelAlgo,
   -        hal::LoadMethod,
            PeregrineCoreSelect, //
        },
        regs,
>> Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:12:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod, //
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:18:
   -        hal::LoadMethod, //
        },
        regs, //
    };
   Diff in drivers/gpu/nova-core/falcon.rs:674:
    
        /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
        pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
   -
            // The Non-Secure section only exists on firmware used by Turing and GA100, and
            // those platforms do not use DMA.
            if fw.imem_ns_load_params().is_some() {
>> Diff in drivers/gpu/nova-core/firmware/fwsec.rs:516:
            // console error message on other platforms, only try to load it if it's
            // supposed to be there.
            let gbl_fw = if chipset < Chipset::GA102 {
   -            Some(super::request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?)
   +            Some(super::request_firmware(
   +                dev,
   +                chipset,
   +                "gen_bootloader",
   +                FIRMWARE_VERSION,
   +            )?)
            } else {
                None
            };
>> Diff in drivers/gpu/nova-core/firmware/fwsec.rs:516:
            // console error message on other platforms, only try to load it if it's
            // supposed to be there.
            let gbl_fw = if chipset < Chipset::GA102 {
   -            Some(super::request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?)
   +            Some(super::request_firmware(
   +                dev,
   +                chipset,
   +                "gen_bootloader",
   +                FIRMWARE_VERSION,
   +            )?)
            } else {
                None
            };
>> Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:13:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod,
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:19:
            FalconModSelAlgo,
   -        hal::LoadMethod,
            PeregrineCoreSelect, //
        },
        regs,
>> Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:12:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod, //
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:18:
   -        hal::LoadMethod, //
        },
        regs, //
    };
   Diff in drivers/gpu/nova-core/falcon.rs:674:
    
        /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
        pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
   -
            // The Non-Secure section only exists on firmware used by Turing and GA100, and
            // those platforms do not use DMA.
            if fw.imem_ns_load_params().is_some() {
>> Diff in drivers/gpu/nova-core/firmware/fwsec.rs:516:
            // console error message on other platforms, only try to load it if it's
            // supposed to be there.
            let gbl_fw = if chipset < Chipset::GA102 {
   -            Some(super::request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?)
   +            Some(super::request_firmware(
   +                dev,
   +                chipset,
   +                "gen_bootloader",
   +                FIRMWARE_VERSION,
   +            )?)
            } else {
                None
            };
>> Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:13:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod,
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:19:
            FalconModSelAlgo,
   -        hal::LoadMethod,
            PeregrineCoreSelect, //
        },
        regs,
>> Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:12:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod, //
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:18:
   -        hal::LoadMethod, //
        },
        regs, //
    };
>> Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:13:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod,
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/ga102.rs:19:
            FalconModSelAlgo,
   -        hal::LoadMethod,
            PeregrineCoreSelect, //
        },
        regs,
>> Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:12:
    use crate::{
        driver::Bar0,
        falcon::{
   +        hal::LoadMethod, //
            Falcon,
            FalconBromParams,
            FalconEngine,
   Diff in drivers/gpu/nova-core/falcon/hal/tu102.rs:18:
   -        hal::LoadMethod, //
        },
        regs, //
    };
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
