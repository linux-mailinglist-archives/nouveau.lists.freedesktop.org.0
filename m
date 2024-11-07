Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671A29C08D6
	for <lists+nouveau@lfdr.de>; Thu,  7 Nov 2024 15:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A0910E861;
	Thu,  7 Nov 2024 14:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ik4W7vTI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F7A10E861
 for <nouveau@lists.freedesktop.org>; Thu,  7 Nov 2024 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730989540; x=1762525540;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=IWitzg14ROFF0cmYF9Ab3bVZ64Mqo+TiJwI2DGcYL5k=;
 b=ik4W7vTIxKrzoC9vknYM+VZKBZKbw3VjYotSstT6umRsEnwrBgMaYfRX
 XERpPxK6dgeY97NzROVtWHyhCF6dR3VwAaVLCYLkEB2rZsrSNsGAq+8GW
 +G76lp8ly3fcZ1ejckQjz7wcAIpceJ2zp9OZpfJy3SiuDkVkDs9HvcL9i
 4+5wt2FCGeAdcribzhwQds/oLWh6Tq3Ogj7hFxNjADf3uWyw0QSwPdYG3
 1sLyvIxaGQXelYEIue3F7JdrmzPTcssm3iyabvLsW6Q3GhWfKae7DPjuA
 YGYtxocDgcbWvKO/VZ5LmB9FJsBdzPoiKRp92NEckYICk7wLtjO7t5BTL g==;
X-CSE-ConnectionGUID: ctC+XBAwTF67Yul1O3DXiQ==
X-CSE-MsgGUID: W7tWvBoCRjKBmjuwPFTnaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33676184"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="33676184"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 06:25:39 -0800
X-CSE-ConnectionGUID: xlbvUB2oTr275R/tFtD46Q==
X-CSE-MsgGUID: d1vmDv1/Rg+En0V72f56Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; d="scan'208";a="85026480"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2024 06:25:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 7 Nov 2024 06:25:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 7 Nov 2024 06:25:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 06:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl0hOo1WeTly/UCJInOsWm6V5RpuSoT7nF6JM7fF+UD6bpxNBLbMUzzqGl5q9GJKC6Wwo0Yo7c+hFlj1DEdDU95NYHfaXJvGhtcq6d/rwCGopUZieICsm6guhcasV0DP7OZByyGZFrwMeja4LSfwP9oK9Mcoy+pCMNlwkQhMglUFEk0v1p0QrkaezM37w6qcqpuFmf0pucTuDHk3pCBxuZ++0kwt3/nNF9tyR0lZeIOmscOESiaxvQezZ50DnL1VGm2SJBsLKT/dhk8kxOEQmXrRAaeA0oyw4DFwVggH/BBapWMe+8ir2NUIYBhaPywomDIB55MweC1TpY8P+NpF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw8U2GCG0BxPQswPWdDDo6G+aA7p/a186vh3AtVrV7c=;
 b=qkQ0wi1CiWqfPjMLHpq3nUiDt2QVxvrR70bjnk/FlrrKKrC1CrW0Fs7KBuHR6jmKXgFPcldTpW3yNmb2FUxuuH6awRHe1ZnvLpAeDaLdZoXx3khBkdc/xP73fAsxnr38UnDM1MZc6YX5f49GTQdxWYG8ES/P4eoYd5mH/HWr+DjQhZJ2LPAXv0abfwypJXR3c6qs1Dlldx48jAt4iqqwRae3vH0JFk43WFJaFKvPm4eCh+h+WFtdV7q9i2xhW4pzSKdPVwpkb9/4YRHNxWMI/Fcvi4Rkdymx+BZ6X/wxKswrWcLFrta5qt4JixOul2kZu3zp7WVILi0PjVRi84SA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Thu, 7 Nov
 2024 14:25:33 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 14:25:33 +0000
Date: Thu, 7 Nov 2024 22:25:23 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Zheng Yejian <zhengyejian@huaweicloud.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Steven Rostedt
 <rostedt@goodmis.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: [linux-next:master] [tracing]  49e4154f4b:
 INFO:task_blocked_for_more_than#seconds
Message-ID: <202411072207.b2321310-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afd2ea3-c9b0-440e-c4b4-08dcff380a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P34k90iRIHOhcTsvTsnrxQVCuVUmbDGOxurAlbLAuQtTiEPNnlDNOvJUAT3P?=
 =?us-ascii?Q?aYZMkbsoCG5Pk+eFkaivZ2npl1uELH0fybBamSUrpvsqJopxHICMAq6B+6IE?=
 =?us-ascii?Q?MeJ5oQ6Nqh6HCVV38BtiO2/VkOoSWCR2oonB6k7aAguU91/tW2eQlY/JP1Z2?=
 =?us-ascii?Q?S8QpFsHb+zoN/fDqJuTpVOvKDGATlUIY11+lVVFIa6Chac+THydRoip0KhVq?=
 =?us-ascii?Q?kUemHAzRaBaH2layc0gqWi4o7FeihUdoYeHjqxy4m1MhValN2//GRX18XTpg?=
 =?us-ascii?Q?GYSM3D00hcbL9fZ/6juVqAAwisGGiMdzlCCRRBiEWDKKCWcX5HKyLffQRK7L?=
 =?us-ascii?Q?zXr8qcIrKU005wrKTQdqUQCdIA+Y6hHOZn45MqANoI2O5qbWBC1XP5Kad/Wp?=
 =?us-ascii?Q?o/HgTd+i8d50sUtxx1KivHDs7QHu7SsWGWDGPC4HXyltSdkHGjwwDjQzNBrz?=
 =?us-ascii?Q?OYjLzPilrTYxKV9eqMCBtwQtiuWqTMsjhvbo+w7+eH5LBYOl1IbialRUWHL7?=
 =?us-ascii?Q?8h+zFAwlWd19Pnd8G8Ea8QCTjZpRPAkf3jWd8AO2ZnoUUmO1+ZyuhkMHSimf?=
 =?us-ascii?Q?iwomo9XB51PSfHuPP7BnaaMZsK6hZPH7p6l1JhsyOMv6npun1r/xgLlTBPgC?=
 =?us-ascii?Q?CFcAi43W6K9sS1+WoKsJUnO96+1EoBmYaz4g2t8lz1cLacJaHMYUVDMeKdDI?=
 =?us-ascii?Q?mDkON5vrygF1OALvHpI+wJEiZJNpfarEbi+ZDhXKL7PUWJ2Ap9sY0zCwm1SX?=
 =?us-ascii?Q?T3m+cyL3jtm+fEPdlKMpE0POkgcA+lnxcNSVix5789cBg8Iv2A70FMsEx9L8?=
 =?us-ascii?Q?sd/oys5/WGQQpCsj2gvJGJ14O1l4ZEoM/MVxDj/tW+M2vejtEHz9ez1lqrN4?=
 =?us-ascii?Q?V6CvzHgCRByRy4y1x38dGYyolwwWt4XTZKPl7g5eatSTn1unFZUmLYT5qJHP?=
 =?us-ascii?Q?A04VY2AqV4HJ4cEo3CFb0X7R5oxK+cX+WsuPnT4xZz+oFvrSaFT3Ew0XL4f6?=
 =?us-ascii?Q?5cmOy2pPOdXgCLTkOSWM606U5GSSjyzrDr9qEFX4MxLty7e4UzXqYLQCtUv4?=
 =?us-ascii?Q?n8MltFB/KvUfoqKsza68+KbSBHFcfxa/pFUF51LYbpL673uX6JLpR+bX4qnF?=
 =?us-ascii?Q?o4V4CXsZ5VCvLhMTcjvH3Sk+gBja2UltLKSLHz0Pp7CsVDnQSyKIULUVucn5?=
 =?us-ascii?Q?gbWqxKzdoa1CwUubh0B5EWQfKbp1zk/WP43+aaHJLB7bTXvW6z5dQwua/qLt?=
 =?us-ascii?Q?CLNL+ql+cRfuWGUnmIq5qO6GCOK9qGFkFF0AoYDOqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sjini1JOh/8ZfJmPaLo9CasXUOAXb9wUMov6Dlt3ntsAfLrekQWnGWTk8vI1?=
 =?us-ascii?Q?cMY4R0n22rdLG0bDVKgtdB5M5OezOQWjCTxGeb3U6qJcs7MiXh1R/dYGeXqI?=
 =?us-ascii?Q?uqE9NnrQH8W75JasfqRy2lBH99hWGprorGwBEzsZhBaWunrNwfxHjf/bzfqu?=
 =?us-ascii?Q?YB8JevDwhhQ5z3XDH6kiUagt+PUnnhONEfiH7AjBkLH3WyKSrNAMNJJi53C+?=
 =?us-ascii?Q?98ouR9dX8I9r+yYgoH5cIF3D63ntmNBqEcCczVWp1mtgZT75ruU2lfTltS0x?=
 =?us-ascii?Q?Lnwqj+ZcpL5wtRvoJdmFNgbRsV7Z6kQouIWiFzerbYT9CBLy3Qjt20CsRlcP?=
 =?us-ascii?Q?rSy4v1zpZFddINAEPOvXaea4sloV4yK7UdRJEuApQNzOJ2nXX8HC2tr5m8HU?=
 =?us-ascii?Q?7adaDfr3RfsB9b8jGfFlqtqinfV0RZbkwaJsLK52UUpi9dUier3SmE/8h/G7?=
 =?us-ascii?Q?hXpBRJI3ru0ZZAc2hfqwC2O7mdV0BsDUn6apgBk0xp1yEnlDcjdwZh96iGnl?=
 =?us-ascii?Q?BblyrH2j+UOy0QvYvvBGOkLne5UfytMVwYKNfZd5ZBt5ckOIX5RjEtXAx+Nw?=
 =?us-ascii?Q?UK0bZZgcCybhWVJDLh/8zt8HKKreaGJyB6Ql0q5Mc+OOp7TwOpCT4lags9ia?=
 =?us-ascii?Q?eNYI+x8g3rrSRlIcBNepT0mcDbEiwNiQL4L4e0AfxYcn28YKOYzDn7FuAVi3?=
 =?us-ascii?Q?EsmcADXkAgyII6KzAZB/Y+XYWXPqI9R/+XeG5E4KLAhlNdRfh/xDmKeYChkW?=
 =?us-ascii?Q?zUQsdAjRubwq76sENIcL0iCs6ZIoS364K1OG6Zi3TIKu82/4dWr6E9inJsEO?=
 =?us-ascii?Q?OsL1piVjTsgNstMWjaqajsNpYKISMp+HTTs8IJ9ieKktuwox3o5qPpJOI+m4?=
 =?us-ascii?Q?8IUMgDckSNli7dGQYO69cUA6zzgV/Pf4F+wViBCt8l3LU/Gea6hW/EJxm0aP?=
 =?us-ascii?Q?8BnA8cQ9XGK29MXA9Iz6vWBrmqvCczJpzIoqPbi2P0AK9SM+9n+2Ug0gBQ5u?=
 =?us-ascii?Q?JKGRndYaplHwLaatWQQeCfJBF8spPBoiM49SAoh3U+lLEz7cXcbZZO2RDKfA?=
 =?us-ascii?Q?+LPUc6N0qS4N49axy5UTeD4EK7Xva16nDdE9rkQN4s7USXAAA5udfSnrWLXf?=
 =?us-ascii?Q?ViBVie8NmAoJMrdeS9CfJbvfshdZ42LGuyR3dkNlIjwnlbMcdR8LJX0UZJIg?=
 =?us-ascii?Q?mlaGZd56dBERC+mutq1/VlEBymjqNrw6uE/khmvqhKlj8jMnPsLwg8eXNzZJ?=
 =?us-ascii?Q?yoajjUOs1/2YYqI/mAJBv00J630NWrTIky9B2M7npCgdDEPXoM/q0lTv5m+b?=
 =?us-ascii?Q?j2Bl6e4DlJUPYRKMbpX/PoVGrHRQesvWHYD4wMJMLBRMKxUHHR7neCVDSJ6G?=
 =?us-ascii?Q?ldwQjvL/qP2Cuu5pYQ81onaIg0TYtxsHDvgkxw9dxg60Twc/7ks5b8/4CS/8?=
 =?us-ascii?Q?axCNg7oPhC/LhCIpQEXye9jR2R05Tz572vQKuSJcRwQ6nTV8/qMVMM2/KQRI?=
 =?us-ascii?Q?W0TZhPYcbwiH848d3bQbcVUCCCXuscOKMXN9C5uIkJqKdL30HgE8cka4AXLJ?=
 =?us-ascii?Q?AbjcqYgWBChoOtymMq+js/Qaytf+hiyQ/mdvl40QBfBw/jcSWwdqZBekWTs0?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afd2ea3-c9b0-440e-c4b4-08dcff380a16
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:25:33.5655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecY7vJfEAhLr79HcsbjDXaDf1t1v2GgNCk8lnjJ65b9sLP/9P/bbgZTt9uGe99suRY43jCdKxy3n4fJOl6Da1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
X-OriginatorOrg: intel.com
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



Hello,

kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: 49e4154f4b16345da5e219b23ed9737a6e735bc1 ("tracing: Remove TRACE_EVENT_FL_FILTERED logic")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 850f22c42f4b0a14a015aecc26f46f9948ded6dd]

in testcase: boot

config: i386-randconfig-003-20241103
compiler: clang-19
test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we don't have clear idea how this commit raises issues, so we run tests
up to 300 times. we observe various issues on this commit but parent keeps
clean.

2aa746ec0240dcbe 49e4154f4b16345da5e219b23ed
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :300         15%          46:300   dmesg.BUG:kernel_hang_in_boot_stage
           :300         14%          42:300   dmesg.BUG:workqueue_lockup-pool
           :300          1%           3:300   dmesg.EIP:lock_acquire
           :300          0%           1:300   dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
           :300          5%          15:300   dmesg.INFO:task_blocked_for_more_than#seconds



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202411072207.b2321310-oliver.sang@intel.com


[  990.007137][   T23] INFO: task swapper:1 blocked for more than 491 seconds.
[  990.056313][   T23]       Not tainted 6.12.0-rc2-00003-g49e4154f4b16 #1
[  990.118200][   T23] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  990.195719][   T23] task:swapper         state:D stack:4480  pid:1     tgid:1     ppid:0      flags:0x00004000
[  990.272724][   T23] Call Trace:
[ 990.330321][ T23] __schedule (kernel/sched/core.c:5318 kernel/sched/core.c:6675) 
[ 990.447142][ T23] schedule (kernel/sched/core.c:6753 kernel/sched/core.c:6767) 
[ 990.491979][ T23] async_synchronize_cookie_domain (kernel/async.c:?) 
[ 990.594686][ T23] ? wake_bit_function (kernel/sched/wait.c:383) 
[ 990.683319][ T23] ? reserve_initrd_mem (init/initramfs.c:756) 
[ 990.747936][ T23] wait_for_initramfs (init/initramfs.c:752) 
[ 990.820345][ T23] populate_rootfs (init/initramfs.c:762) 
[ 990.882071][ T23] do_one_initcall (init/main.c:?) 
[ 990.944599][ T23] ? reserve_initrd_mem (init/initramfs.c:756) 
[ 991.001047][ T23] ? local_clock_noinstr (arch/x86/include/asm/cmpxchg_32.h:139 kernel/sched/clock.c:290 kernel/sched/clock.c:306) 
[ 991.124344][ T23] ? pvclock_clocksource_read_nowd (arch/x86/include/asm/pvclock.h:37 arch/x86/kernel/pvclock.c:79 arch/x86/kernel/pvclock.c:120) 
[ 991.209051][ T23] ? pvclock_clocksource_read_nowd (arch/x86/include/asm/pvclock.h:37 arch/x86/kernel/pvclock.c:79 arch/x86/kernel/pvclock.c:120) 
[ 991.292799][ T23] ? pvclock_clocksource_read_nowd (arch/x86/include/asm/pvclock.h:37 arch/x86/kernel/pvclock.c:79 arch/x86/kernel/pvclock.c:120) 
[ 991.378336][ T23] ? local_clock_noinstr (arch/x86/include/asm/cmpxchg_32.h:139 kernel/sched/clock.c:290 kernel/sched/clock.c:306) 
[ 991.476997][ T23] ? pvclock_clocksource_read_nowd (arch/x86/include/asm/pvclock.h:37 arch/x86/kernel/pvclock.c:79 arch/x86/kernel/pvclock.c:120) 
[ 991.527408][ T23] ? pvclock_clocksource_read_nowd (arch/x86/include/asm/pvclock.h:37 arch/x86/kernel/pvclock.c:79 arch/x86/kernel/pvclock.c:120) 
[ 991.625576][ T23] ? local_clock_noinstr (arch/x86/include/asm/cmpxchg_32.h:139 kernel/sched/clock.c:290 kernel/sched/clock.c:306) 
[ 991.925186][ T23] ? local_clock_noinstr (arch/x86/include/asm/cmpxchg_32.h:139 kernel/sched/clock.c:290 kernel/sched/clock.c:306) 
[ 992.217536][ T23] ? irqentry_exit (kernel/entry/common.c:365) 
[ 992.316602][ T23] ? check_preemption_disabled (lib/smp_processor_id.c:16) 
[ 992.451338][ T23] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) 
[ 992.545143][ T23] ? lockdep_hardirqs_on (kernel/locking/lockdep.c:4468) 
[ 992.694021][ T23] ? trace_hardirqs_on (kernel/trace/trace_preemptirq.c:63) 
[ 992.817354][ T23] ? irqentry_exit (kernel/entry/common.c:365) 
[ 992.956858][ T23] ? common_interrupt (arch/x86/kernel/irq.c:278) 
[ 993.087472][ T23] ? asm_common_interrupt (init_task.c:?) 
[ 993.298189][ T23] ? next_arg (lib/cmdline.c:273) 
[ 993.545274][ T23] ? parse_args (kernel/params.c:153 kernel/params.c:186) 
[ 993.665571][ T23] ? trace_initcall_level (include/trace/events/initcall.h:10) 
[ 993.755608][ T23] do_initcall_level (init/main.c:1330) 
[ 993.843152][ T23] do_initcalls (init/main.c:1344) 
[ 993.895473][ T23] do_basic_setup (init/main.c:1367) 
[ 993.952283][ T23] kernel_init_freeable (init/main.c:1582) 
[ 994.016012][ T23] ? rest_init (init/main.c:1461) 
[ 994.067853][ T23] ? rest_init (init/main.c:1461) 
[ 994.152226][ T23] kernel_init (init/main.c:1471) 
[ 994.250558][ T23] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 994.358571][ T23] ret_from_fork_asm (??:?) 
[ 994.464814][ T23] entry_INT80_32 (init_task.c:?) 
[ 1024.177579][   T23]
[ 1024.177579][   T23] Showing all locks held in the system:
[ 1024.234410][   T23] 1 lock held by khungtaskd/23:
[ 1024.289399][ T23] #0: c3cd44a4 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire (include/linux/rcupdate.h:336) 
[ 1024.427079][   T23] 2 locks held by kworker/u4:2/25:
[ 1024.482763][   T23]
[ 1024.555465][   T23] =============================================
[ 1024.555465][   T23]
[ 1117.679859][    C0] workqueue: do_cache_clean hogged CPU for >10000us 19 times, consider switching to WQ_UNBOUND
[ 1149.530928][    C0] workqueue: neigh_managed_work hogged CPU for >10000us 67 times, consider switching to WQ_UNBOUND
[ 1155.426086][    C0] workqueue: stop_one_cpu_nowait_workfn hogged CPU for >10000us 4 times, consider switching to WQ_UNBOUND
BUG: kernel hang in boot stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241107/202411072207.b2321310-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

