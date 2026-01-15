Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE702D26658
	for <lists+nouveau@lfdr.de>; Thu, 15 Jan 2026 18:28:41 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5BC10E7B3;
	Thu, 15 Jan 2026 17:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiXoyk4b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DBB2344CB3;
	Thu, 15 Jan 2026 17:20:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768497606;
 b=bZlazzNKGksTG8xCSLkuwoP0IXBXnUgitSnB1jLWrvhQVYp7WIR9kYz1SujCJSSzjcdXh
 F8r+EmUwW/1ZGbU05McfyTlUKyiCq5vVuFJkaxTKpT4V9zNifKa48qs8vhtWN/mEU7Uhr0W
 zUV6K7QHlftBedCGSRR+vxwfRr/Iu+pzKJLKQgCXmMr2yVbGlg0AEzXhfb0A77crO1WbU7N
 jxPvPBM3USAqO26KWmFsFYRnO/2t9AedqGrnpRL9RyNGQ2rH1BlHjQ/XIhEccq0POMWFwiL
 XsAsgAnMm+R3LMrYw62vc9gT130tukB6Gy1Q/IGV9VItilK9rCbe+HIb/JGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768497606; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=X7GMr+uMn/6XC/T9OWi16ZWglwIJ3SwaXiD2lk372b8=;
 b=kmGyF+goLjCZLSDMgviVcUtiW+MIKEcrXRIRrIGYjkM75TGdaYOaQf0hJQbsRyRfecSkp
 pCPNSAuX96FONJuoFU5vWFrd91x/WNEx7sRyoYWm2x55ZhJy+mBhtGxXulmFqxGxJhRiHvQ
 iLhmZ0H1BwDiAZ+jgiqdwIFhQkRN2s5AJAqOEFEpEBAIugM8thRBxi66ZV5cnczwygLm49l
 EfKKmOPavw9yks34lBtVfurQyeLS4CLmcdMpx4TYNamCKPIBRxXO/Ox9LN4cnnvlXJefvH5
 vnkoJ/JO/w1C/4n/+XtwXkuXliSJ71lutbo+WUbLeJT+C5AVxX4eeWf5lAnA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=intel.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5662344CA1
	for <nouveau@lists.freedesktop.org>; Thu, 15 Jan 2026 17:20:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C95510E78F
	for <nouveau@lists.freedesktop.org>; Thu, 15 Jan 2026 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768498116; x=1800034116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P6LyHnXwl97jHbEhU+1xZ3S5rlbWeSwOLxVdj5CzHFQ=;
  b=DiXoyk4bOVFRjs+gDFYAe0nG/YPxO+/dcCWmlJ6N2L1te5YsbBnrgtLv
   qB1XEPpisfbQclP+tAAflsB3nAY0JaKzVNKGGkZ5AyWjhGr/2ziJcx+Ah
   UxIuyXiuYFaWUhFVaO0TOhsLTMIR9DM7rzqxYK1xvdvFWIb8NSHo49lVb
   0CBvgIwUDnDFyHGosjRdBdG2eTbdcg/Oeodh1Cjif0ikwwf2JakUvmZUw
   XjzDTS2SIpfWIwfnSTMFRNyIGWOeUZoOnpjmtMflsKPFaF+5izjb6WwVO
   LSshghub35U+NxEraIhWU5jxmo5tEcttzYeCasp8egQyVA9O9LYRt45KT
   Q==;
X-CSE-ConnectionGUID: ZtL9jWAjR766KH6alO28VA==
X-CSE-MsgGUID: 3aGqGnQORXS1IfWXEJL3Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69544758"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800";
   d="scan'208";a="69544758"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 09:28:36 -0800
X-CSE-ConnectionGUID: 3exdOicFSFCvGWvaJ+T6tw==
X-CSE-MsgGUID: eCD674mvQpeeHyeVfRGR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800";
   d="scan'208";a="204897663"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jan 2026 09:28:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgR94-00000000IlM-0fbh;
	Thu, 15 Jan 2026 17:28:30 +0000
Date: Fri, 16 Jan 2026 01:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Matthew Maurer <mmaurer@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 5/9] rust: debugfs: implement Directory trait for Dir
Message-ID: <202601160158.7mf9LG1y-lkp@intel.com>
References: <20260113225408.671252-6-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113225408.671252-6-ttabi@nvidia.com>
Message-ID-Hash: 6HIO3AHSWKMS46UJK743LWEOJP2J6U4N
X-Message-ID-Hash: 6HIO3AHSWKMS46UJK743LWEOJP2J6U4N
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6HIO3AHSWKMS46UJK743LWEOJP2J6U4N/>
Archived-At: 
 <https://lore.freedesktop.org/202601160158.7mf9LG1y-lkp@intel.com/>
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

[auto build test ERROR on 654826aa4a8f25cf825ad9254f37e6cb5092098f]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-pci-add-PCI-device-name-method/20260114-065717
base:   654826aa4a8f25cf825ad9254f37e6cb5092098f
patch link:    https://lore.kernel.org/r/20260113225408.671252-6-ttabi%40nvidia.com
patch subject: [PATCH v4 5/9] rust: debugfs: implement Directory trait for Dir
config: x86_64-randconfig-122-20260114 (https://download.01.org/0day-ci/archive/20260116/202601160158.7mf9LG1y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160158.7mf9LG1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160158.7mf9LG1y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4085:16
   |
   4085 | let dir = Dir::new(c_str!("my_debugfs_dir"));
   |                ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4145:16
   |
   4145 | let dir = Dir::new(c_str!("my_debugfs_dir"));
   |                ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4204:16
   |
   4204 | let dir = Dir::new(c_str!("foo"));
   |                ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:3973:20
   |
   3973 | let debugfs = Dir::new(c_str!("parent"));
   |                    ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4028:19
   |
   4028 | let parent = Dir::new(c_str!("parent"));
   |                   ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:11462:20
   |
   11462 |     let dir = Dir::new(pdev.name());
   |                    ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3     + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> samples/rust/rust_debugfs.rs:136:28
   |
   136 |         let debugfs = Dir::new(c_str!("sample_debugfs"));
   |                            ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   34  + use kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> samples/rust/rust_debugfs_scoped.rs:134:29
   |
   134 |         let base_dir = Dir::new(c_str!("rust_scoped_debugfs"));
   |                             ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   9   + use kernel::debugfs::Directory;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
