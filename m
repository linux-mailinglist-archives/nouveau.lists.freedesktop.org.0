Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4E8CECDF4
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 09:43:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F101810E773;
	Thu,  1 Jan 2026 08:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjy+qP51";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 46CF044C87;
	Thu,  1 Jan 2026 08:35:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767256504;
 b=jMi9BJ55zvKrgDwUFmbUPkfh3NgEClFliW1HU3miGBRT24UZfb8+rTR0sSOBwVoLveCng
 /c1x0CXQFcYs7yk/dOUMIppsTeziXp+Vnd3EUI4zHi1jvXeQ7QMGOIhkIxHjjvy80nBnRDs
 dlP5LozaJiqTdMY6CjhQ530bKyl0Z6g1GheRtwFB/T1on9cPKzLeSNpMCf8aSA2Hz9K9tKj
 6vHzGX04QAga9ihdEDd/vUZtqqY/Fevcfx07ZXOYNbFyguUZ7i1HqKxBnHRlckPBKYNOEi9
 QxVsLG6LwiaPuLMwR8e78kIfFiLcMJO266POGE7KeS+vxwS/yCu3tWKYldhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767256504; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Gsf+Hjhm2PdHxsl5ji88x+w6DHf4YKBZyVc9ZhDbX6Q=;
 b=qrB0PcuAWhAsBMhbMdA3fwS0e2UClC6Afxh8tjtbWz7/5jPP3PBfpcbMlaWodFXlHxPvv
 98wIcF+7giob+sXADUBO9nBwLZb22SM/xGm9mha2jMMVQRolN+UMk+KZV2rcWQDyxAFEGK1
 zKCrndN82Er9bRkbkiJ9OPzBKNLelhCtjpAcye95BKGYLRd2iISpetxSVgfDstGRhjJzDbr
 YCwSsIWGRV+ni+IgyFS0iKjpYqTPlhNYoX1pbC5vPS6Q9Ta8b1FrYRTJHq8SZItsqq98JW6
 yHa4P5WwpJ3mba+iMzARsIJjyhnjir9uV7frWUhRVELhKaspmT0/5oRJPY/g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DA85144C5B
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 08:35:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2437E10E401
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767256983; x=1798792983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ieUt7pqL3M0cxqtfDP5HcO19kjSX1X005ga5kEuTXB0=;
  b=kjy+qP51g6/Bv6r9QLVY0zM52JpJftiDmttTPK5GXDToYpCwhKagOwWF
   jdQfhzwRUTHYeMy/T1P9gE8g8y6v7wQ3EXTet73q263c44YvsCukvp1lt
   /U6xo6bPHyzdHOKd/u20xxvrXTe2YT+PNSQ4RCVT12QU+bko6wA76gGdb
   LNjtbopuaC6UECztSUHF/uHCGFcT+l0QtKFI0Aq/mqczmV+w3qgd/UpK6
   zfOIfxA1ro1RkcWY4bA2sFcdJ4iYdCFXPtdcWg6ivEu0rqPPmYZBThjvF
   dIXUx5Bwkfr7G9DiYN2t5YTFJ8cB8XB9shHSISJFn4SzQQBkcIpvWxcYV
   A==;
X-CSE-ConnectionGUID: UrLHvZuIQ1C94ufWEBrIUw==
X-CSE-MsgGUID: MrZ3GdpfQU+1T2EBZOVAsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="71375263"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800";
   d="scan'208";a="71375263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2026 00:43:02 -0800
X-CSE-ConnectionGUID: 09Yz4ukfTiKIlzHoSM7nJw==
X-CSE-MsgGUID: d3GmED39QPCdGUb8PwZ7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800";
   d="scan'208";a="206118660"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa)
 ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2026 00:42:58 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbEGk-000000000Ej-3qSn;
	Thu, 01 Jan 2026 08:42:54 +0000
Date: Thu, 1 Jan 2026 09:42:32 +0100
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Message-ID: <202601010949.aupX8V1f-lkp@intel.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231214727.448776-1-jhubbard@nvidia.com>
Message-ID-Hash: UIJ6K2FXCFR5J7677XMFCPUZQHX6SWV5
X-Message-ID-Hash: UIJ6K2FXCFR5J7677XMFCPUZQHX6SWV5
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: oe-kbuild-all@lists.linux.dev, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UIJ6K2FXCFR5J7677XMFCPUZQHX6SWV5/>
Archived-At: 
 <https://lore.freedesktop.org/202601010949.aupX8V1f-lkp@intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7acc70476f14661149774ab88d3fe23d83ba4249]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Hubbard/gpu-nova-core-bitfield-use-mut-self-setters-instead-of-builder-pattern/20260101-054823
base:   7acc70476f14661149774ab88d3fe23d83ba4249
patch link:    https://lore.kernel.org/r/20251231214727.448776-1-jhubbard%40nvidia.com
patch subject: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead of builder pattern
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260101/202601010949.aupX8V1f-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010949.aupX8V1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010949.aupX8V1f-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/falcon.rs:413:
                Delta::from_micros(150),
            );
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(true); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(true);
   +        });
    
            // TIMEOUT: falcon engine should not take more than 10us to reset.
            fsleep(Delta::from_micros(10));
   Diff in drivers/gpu/nova-core/falcon.rs:420:
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(false); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(false);
   +        });
    
            self.reset_wait_mem_scrubbing(bar)?;
    
>> Diff in drivers/gpu/nova-core/falcon.rs:413:
                Delta::from_micros(150),
            );
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(true); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(true);
   +        });
    
            // TIMEOUT: falcon engine should not take more than 10us to reset.
            fsleep(Delta::from_micros(10));
   Diff in drivers/gpu/nova-core/falcon.rs:420:
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(false); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(false);
   +        });
    
            self.reset_wait_mem_scrubbing(bar)?;
    
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
