Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D585282A
	for <lists+nouveau@lfdr.de>; Tue, 13 Feb 2024 06:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6A410E819;
	Tue, 13 Feb 2024 05:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1ABwDaZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ADD10E113;
 Tue, 13 Feb 2024 05:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707801327; x=1739337327;
 h=date:from:to:cc:subject:message-id;
 bh=UrzG/qRsqvvZ7Octi6WWYLNThe61GWEaDCTqCpXMM1Y=;
 b=d1ABwDaZlwArnr+fJsNNcZt0+GLYA1RJt3ylYZhrz1a0bDRDAjEdcezL
 dQrYo9PS3ztu8V8UxnAvwg4dHrC1qF9Y9PddWjLIm7rY+1Dh06aQVG2go
 bvxsTdSqqcEOk8DN3a0CTn2gIJ90kKqfDRZOvsTCsR3xeuveTVhrzAeGK
 zn0wgHlrIscAXSynFm6TVwuEc+GolXUX7Go3R0HE/H9Lmvib5iZlseuyl
 Liz+M4in4Ms/0C6yAoGYSXsqC+TO95hI2A1vWDFhiEUfSilZOStDZkfys
 Dug+ZD+xs7F+WiNT61uG16FbvHIGUGRfk0Tf6QjUUY0p2BGMG7lIiaRo9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5632108"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="5632108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 21:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="3110659"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 12 Feb 2024 21:15:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rZl8W-0007XC-25;
 Tue, 13 Feb 2024 05:15:16 +0000
Date: Tue, 13 Feb 2024 13:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-bcachefs@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org,
 ntfs3@lists.linux.dev
Subject: [linux-next:master] BUILD REGRESSION
 ae00c445390b349e070a64dc62f08aa878db7248
Message-ID: <202402131307.QAKvYq3Z-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: ae00c445390b349e070a64dc62f08aa878db7248  Add linux-next specific files for 20240212

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202402122047.yDhRZmM4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402130633.bfNCWVeh-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202402131351.a0FZOgEG-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/md/dm.c:2131:(.text+0x9f34): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `set_dax_nocache'
drivers/md/dm.c:2131:(.text+0x9f34): undefined reference to `set_dax_nocache'
drivers/md/dm.c:2132:(.text+0x9f3c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `set_dax_nomc'
misc.c:(.text+0x14f0): undefined reference to `__ubsan_handle_load_invalid_value'
or1k-linux-ld: drivers/md/dm.c:2132:(.text+0x9f3c): undefined reference to `set_dax_nomc'
sh4-linux-ld: misc.c:(.text+0x1698): undefined reference to `__ubsan_handle_load_invalid_value'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arc-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arc-randconfig-002-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- arm-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm-randconfig-001-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-randconfig-001-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- csky-randconfig-002-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- csky-randconfig-r061-20240212
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-buildonly-randconfig-002-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- i386-randconfig-013-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-015-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- loongarch-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- loongarch-randconfig-002-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- microblaze-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- microblaze-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- nios2-randconfig-001-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- openrisc-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- openrisc-randconfig-r011-20221209
|   |-- drivers-md-dm.c:(.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-undefined-symbol-set_dax_nocache
|   |-- drivers-md-dm.c:(.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-undefined-symbol-set_dax_nomc
|   |-- drivers-md-dm.c:(.text):undefined-reference-to-set_dax_nocache
|   `-- or1k-linux-ld:drivers-md-dm.c:(.text):undefined-reference-to-set_dax_nomc
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- parisc-randconfig-002-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- parisc64-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- powerpc-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- riscv-randconfig-002-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- sh-randconfig-002-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- sh-randconfig-m031-20221009
|   |-- misc.c:(.text):undefined-reference-to-__ubsan_handle_load_invalid_value
|   `-- sh4-linux-ld:misc.c:(.text):undefined-reference-to-__ubsan_handle_load_invalid_value
|-- sparc-allmodconfig
|   |-- Error:vdso-image-contains-dynamic-relocations
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- sparc64-linux-ld:vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- sparc64-linux-objcopy:arch-sparc-vdso-vdso64.so.dbg:No-such-file
|   `-- vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sparc-randconfig-001-20240212
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- sparc-randconfig-002-20240212
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- sparc64-allmodconfig
|   |-- Error:vdso-image-contains-dynamic-relocations
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- sparc64-linux-ld:vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- sparc64-linux-objcopy:arch-sparc-vdso-vdso64.so.dbg:No-such-file
|   `-- vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sparc64-allyesconfig
|   |-- Error:vdso-image-contains-dynamic-relocations
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   |-- sparc64-linux-ld:vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|   |-- sparc64-linux-objcopy:arch-sparc-vdso-vdso64.so.dbg:No-such-file
|   `-- vclock_gettime.c:(.text):undefined-reference-to-__ubsan_handle_shift_out_of_bounds
|-- sparc64-randconfig-001-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- um-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- um-randconfig-r052-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-001-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-002-20240212
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-011-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-012-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-014-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-015-20240212
|   |-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|   `-- include-kunit-test.h:warning:s-directive-argument-is-null
|-- x86_64-randconfig-071-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-072-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-076-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-randconfig-102-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-104-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-122-20240211
|   |-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-em_perf_state-table-got-struct-em_perf_state-noderef-__rcu
|   `-- kernel-power-energy_model.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-struct-kref-kref-got-struct-kref-noderef-__rcu
|-- xtensa-randconfig-001-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
`-- xtensa-randconfig-002-20240212
    `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
clang_recent_errors
|-- arm-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm-randconfig-r051-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-randconfig-003-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- arm64-randconfig-004-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- hexagon-randconfig-001-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- hexagon-randconfig-002-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-buildonly-randconfig-006-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-002-20240212
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-005-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-054-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- i386-randconfig-141-20240212
|   |-- drivers-bluetooth-btintel.c-btintel_read_version()-warn:passing-zero-to-PTR_ERR
|   |-- fs-bcachefs-btree_locking.c-bch2_trans_relock()-warn:passing-zero-to-PTR_ERR
|   `-- fs-bcachefs-buckets.c-bch2_trans_account_disk_usage_change()-error:we-previously-assumed-trans-disk_res-could-be-null-(see-line-)
|-- powerpc-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- powerpc-randconfig-001-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- powerpc64-randconfig-001-20240212
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- powerpc64-randconfig-003-20240212
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- riscv-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- riscv-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- riscv-defconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- s390-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-allmodconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
|-- x86_64-buildonly-randconfig-001-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-buildonly-randconfig-003-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-buildonly-randconfig-004-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-buildonly-randconfig-005-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
|-- x86_64-randconfig-013-20240212
|   `-- fs-ntfs3-frecord.c:warning:unused-variable-i_size
`-- x86_64-randconfig-073-20240212
    `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg

elapsed time: 1451m

configs tested: 175
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20240212   gcc  
arc                   randconfig-002-20240212   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                        mvebu_v7_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240212   gcc  
arm                   randconfig-002-20240212   clang
arm                   randconfig-003-20240212   clang
arm                   randconfig-004-20240212   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240212   clang
arm64                 randconfig-002-20240212   clang
arm64                 randconfig-003-20240212   clang
arm64                 randconfig-004-20240212   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240212   gcc  
csky                  randconfig-002-20240212   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240212   clang
hexagon               randconfig-002-20240212   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240212   clang
i386         buildonly-randconfig-002-20240212   gcc  
i386         buildonly-randconfig-003-20240212   gcc  
i386         buildonly-randconfig-004-20240212   clang
i386         buildonly-randconfig-005-20240212   gcc  
i386         buildonly-randconfig-006-20240212   clang
i386                                defconfig   clang
i386                  randconfig-001-20240212   gcc  
i386                  randconfig-002-20240212   clang
i386                  randconfig-003-20240212   clang
i386                  randconfig-004-20240212   gcc  
i386                  randconfig-005-20240212   clang
i386                  randconfig-006-20240212   gcc  
i386                  randconfig-011-20240212   gcc  
i386                  randconfig-012-20240212   gcc  
i386                  randconfig-013-20240212   gcc  
i386                  randconfig-014-20240212   gcc  
i386                  randconfig-015-20240212   gcc  
i386                  randconfig-016-20240212   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240212   gcc  
loongarch             randconfig-002-20240212   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240212   gcc  
nios2                 randconfig-002-20240212   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240212   gcc  
parisc                randconfig-002-20240212   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                  mpc866_ads_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240212   clang
powerpc               randconfig-002-20240212   gcc  
powerpc               randconfig-003-20240212   clang
powerpc                     tqm8548_defconfig   clang
powerpc64             randconfig-001-20240212   clang
powerpc64             randconfig-002-20240212   gcc  
powerpc64             randconfig-003-20240212   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240212   gcc  
riscv                 randconfig-002-20240212   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240212   clang
s390                  randconfig-002-20240212   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240212   gcc  
sh                    randconfig-002-20240212   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240212   gcc  
sparc64               randconfig-002-20240212   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240212   clang
um                    randconfig-002-20240212   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240212   clang
x86_64       buildonly-randconfig-002-20240212   clang
x86_64       buildonly-randconfig-003-20240212   clang
x86_64       buildonly-randconfig-004-20240212   clang
x86_64       buildonly-randconfig-005-20240212   clang
x86_64       buildonly-randconfig-006-20240212   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240212   gcc  
x86_64                randconfig-002-20240212   gcc  
x86_64                randconfig-003-20240212   gcc  
x86_64                randconfig-004-20240212   gcc  
x86_64                randconfig-005-20240212   gcc  
x86_64                randconfig-006-20240212   gcc  
x86_64                randconfig-011-20240212   gcc  
x86_64                randconfig-012-20240212   gcc  
x86_64                randconfig-013-20240212   clang
x86_64                randconfig-014-20240212   gcc  
x86_64                randconfig-015-20240212   gcc  
x86_64                randconfig-016-20240212   clang
x86_64                randconfig-071-20240212   gcc  
x86_64                randconfig-072-20240212   gcc  
x86_64                randconfig-073-20240212   clang
x86_64                randconfig-074-20240212   gcc  
x86_64                randconfig-075-20240212   gcc  
x86_64                randconfig-076-20240212   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240212   gcc  
xtensa                randconfig-002-20240212   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
