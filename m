Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E3C38B24
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 02:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DD110E0EF;
	Thu,  6 Nov 2025 01:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iRC+GDCv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010060.outbound.protection.outlook.com
 [52.101.193.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CFD10E0EF
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 01:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFEEFly3KWwBKJjkY9zAWly+URIw43hSl7ULiyZQwlBUdSIZM5JAInfnNRT9r+qF7yx2+qYFspMIQ/ZTxxlmxlSYHuIQAd0gT9eNlCJqT4v25PaVPRg5W6Yv1qN8VwCBrcDHifJKDTcVaHtUawWsSgjRNckqdMXfhwIEy195U9U0oI85OJvb2zkADK2QyfwyCONo5SQ6OTVG1c8ax+xLtL6q1jILKLbaggW+oymFIvKGyFTvFf6RYUhvgeL0O+B17iwHDzqbFckVpWWpHJpFVMinM9ISAvo8HMzrQ78NhBrD3OXSNlHeh8MiOCyHxAjB4teVWdKCe0dxLNjJGlzmBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChJSCC335UUo+3gIrpN8RUhEv7xUAbXethQysrj9Tqw=;
 b=biYt+kGOWj1C7FvRwHoRr8uNw83QZ01LvXiPI7lsgdIoIVvxOfssCGtTc+EaW5ssDRoLsApCxrBOwNZ4z+B7zuUcUpfJeq+2ANHmaaLwXb8ztm+MGFPytsoAZx+8z83rssSEJtaMWHiuHC6bLlFfbgcjyuHktVHPlkBOC11sOZSRUNDyzqbk2HaMCmeOeq7dcJjw5sIvPqS6p4NzMQE9DRmDkHjUDeKlzECYu1z4e+TMcEuRyCNKrvFwn3CLTToPf4CdduQ32qVNmEFn9WXISsJa3bmFcvJt5PMfacWpW3G7O/4x2AYMVZmUFmtn9QXTAOqYI9KTB6mufoVjgtwMhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChJSCC335UUo+3gIrpN8RUhEv7xUAbXethQysrj9Tqw=;
 b=iRC+GDCv9/IDBbzsv0g2npfSQU8dhJ0iXVbG3AqTzs/KWL6uZXJe8yzo7E9otBzYYCokHl9UuEpzaJ1W9IMlULWMWspgr39l6wxBDAqwJjrKlukWkk0JDCtWyZLMbSLbN4JNgHK+TUoN1FQHVIEx9KirMtlTEZegoGcfP9yusYwvpVY65OA5mGdJwVrMAR5VKKSVhqAsbI6fQyDNOOiq4osVDQ6jNXoF0w3+aJKh14BJ2ZVWRzfBk8bkyNrVuMpdMdTQkfESSGDldPDKgNsD3F3l9jQveB603/V4nNP1cN3ylzlh42B0CbMAyEmyM5eRaj+AJisADsEAPR4WwDZHaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY8PR12MB7658.namprd12.prod.outlook.com (2603:10b6:930:9e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 01:27:56 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 01:27:55 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 0/3] gpu: nova: add boot42 support for next-gen GPUs
Date: Wed,  5 Nov 2025 17:27:51 -0800
Message-ID: <20251106012754.139713-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY8PR12MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ba3e28-2815-41bf-f3c2-08de1cd3b639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3EH6ggr712tleRtX9eBIqTVhWI0cHAMap/ca+b8ZVTPVt29xyGy+fHJnvepi?=
 =?us-ascii?Q?pVO1GMQRm+g5a2nooQLqCjDSqHKjqPwY/5xyZRf3C456BK66e+DSoCYF51ci?=
 =?us-ascii?Q?yRSbWmbiur0OGnFNmTOd/eb+778ZfZiUiypJr9u/JCmNEyU/8TNU+LA36hJ6?=
 =?us-ascii?Q?VPx0YsM+uQsQvKIXjVx2n9q5uAPfz0MefWhv1d4y5MGAxfcBOgEI5zcWADiz?=
 =?us-ascii?Q?LgNmybL8onXBEuAdNMwi4YF+zCqkaAOg6Ip5WffOOpBtXikvA3cV3sxyWqpM?=
 =?us-ascii?Q?s2kroNmLGqG05NgzUSkcxDDY8qXB4r78prItsa3KR7AP67cZKhd4dIO04YNg?=
 =?us-ascii?Q?8BkXNZZwfhP2qMBtgvuQuzM/kgHf6/ku4A79Rfbb6MuNR4AGSMjGCvCYFBIF?=
 =?us-ascii?Q?IiHv6A8WnJlCxPTiNKUF4aVsTJ0KBXOdyc6j4EcUt4QCLiyJ6UbLNy80vED0?=
 =?us-ascii?Q?Z8yzLwdW1Nt5bnxm4TlXI+wG6gtsmBhmOi2FH/jDEZmNavt0FuXPNBvsH+Ne?=
 =?us-ascii?Q?BWUDvhQ8ULK6jKUsEVAFA7z+wbdaPCQUr4So4IiVM/jDL8FFvl9xSR+HdEOO?=
 =?us-ascii?Q?2uWpXSVSvV13SSs7KoTVOvCipBoJ5VLUjSELpS+sXVik3BaojOzqmV+NG56a?=
 =?us-ascii?Q?3AjlqSUZgAFfPcnu1Kh00KU97PDnY91MHecz89gshx2XhH0QXe1njpzMNpK0?=
 =?us-ascii?Q?Mf6Sf3/F/Dchfq6LRCHDeOV44rEhEqy0eX4yEFYV7Qgo1ijHS1BFRW/5hUZI?=
 =?us-ascii?Q?dvU3nMInq1H0ScpLgkqZQ2dazGyYC7JcVsm35mcVTlIrkajeYdGy8qZEfME6?=
 =?us-ascii?Q?xob3xBgq1TDQYHfkpMuECdvba1Mo1k2iWxFWnZs/mg4bEt0yyRtdFVYMLOF9?=
 =?us-ascii?Q?Ait5hRdzalBQF5wN+eNkRJNho+pjItW6SfWi0KsX1S9U/4aw4OJEt+THneCc?=
 =?us-ascii?Q?XAVj2ldS3h+C6iQkzEbIB0hS1NRTkYBBfwBAJQbK2BnwZC7QCa9VfNxd+6yO?=
 =?us-ascii?Q?gAhIBPHWY7M1NMzW+Qc6WCvrHBGyPC7KkQmHllhX8sGkiQatJBFuoo5la4KG?=
 =?us-ascii?Q?uw4WeLEW0oS3PLLlFksUmBEubJilnJIXOBr8OIvFHsQ6rnz03img0Ki3vDow?=
 =?us-ascii?Q?nc1KjX8Op38rcvvCH9ofinDj1DEgodPwdv8R9IR4D2N3QTG8iZZsTSlzckfq?=
 =?us-ascii?Q?h8g77CNhY4D3RE9Rma7bMS6KJ+jyNgisR1T1meQkwqXE3Qa3b01wEPRA8qTf?=
 =?us-ascii?Q?k4TjAVnvcfD427TbT3mPDGR55MUjiOW0i4dxKse895MSpRVcJi4XvZZ/xuAE?=
 =?us-ascii?Q?GBmXTQyZ8iuIlTTQsWxJ7bOs9pxFAmh2B98uekXMZ6VXQ8wr2X64UGAaH4a8?=
 =?us-ascii?Q?JR7VKL6Sjav0/s6d/+3rjxSxXtWcYyhOWcqxeYkOoFpEyiOEFef+sNliixaS?=
 =?us-ascii?Q?zsar4dgOuzUBdj+u/HsUGK+++LmYOPED?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Mip2IzpuLROk6+xodSlyo7JGsTwnIUr8sBRy07qwW7KSRlsCpBd33XQJEu3?=
 =?us-ascii?Q?1Zp8ciXOcseGVXRiPrh6KJddDPndPMqcvjp0MnL86PcccmWaf4KGRjOa9rdn?=
 =?us-ascii?Q?x4MX4s9Th27Nkyoc9z0eSwcyA9NeIXycvKMxmbNu3SP1/mCesLeV7fyMF4B6?=
 =?us-ascii?Q?luOIvjDEGiLnjgkknqb55uhIYeTvIt4oRPudSt0IhDZ6Z947TX8sg5S0wgxU?=
 =?us-ascii?Q?Gv2+UJb8AOgKkF7oytU+8RzDuKhP36VCnyBpOI+/wWvvxDAFHL3RdVhwS+rX?=
 =?us-ascii?Q?fUtDge7D9hLKsezgNYgcBnyfdzklxdxbb/QCqCi7G56+5U2RpFLuHSC7ahvT?=
 =?us-ascii?Q?RpXFjP+yHZw7CNA1mu+erHTVWdR2J9Uyc0opoHF3YFWv9lUPPkop5fPIuiMb?=
 =?us-ascii?Q?NcRHuKld7V7Kd3t3bkR+x+6uPEIiP0S0v8rplJ4WZKGItwwSBexo487zvGZ1?=
 =?us-ascii?Q?AUpn4Vwa/hQZdPTcMmpGhvcDsDTPT8Mnj98QtEa4LOpp+saqfGZZFV2J9955?=
 =?us-ascii?Q?btnnbz8uYfYoqViQMS6V0559K6WVBKh01m7RtL5d0I+UqGUNsJaerk9sEU6a?=
 =?us-ascii?Q?psB2TOEUQiigN+WLS1XuGuQmlF0gXZOSsUAxS5Pe6J3Gel67gI8hDolklWJd?=
 =?us-ascii?Q?zKesDakEHah+uxb585PGU5Zg6sNPbea20TP3EyNIw2a3DgEQpv3TX/tAsaor?=
 =?us-ascii?Q?p29Kbr4xGcjOGytbHeyYgJcjF7LoLrHv2grExvlwsDI88pzjzlNgkK89qVCJ?=
 =?us-ascii?Q?erwmGVdbmW95VTys+kHQnThWDGZdKhwr4ACz3oMLx5kx+y6B5PN3pN3suzEU?=
 =?us-ascii?Q?HSS5JYQTdYeCgH6/gZCyWuwvB6kjgVFC948zhbyWdwsegrhpgup8C//W0Coe?=
 =?us-ascii?Q?NrJszQxbecUjEQcoj2Xvz9GG6tiACk80YNnIL69hg103gMt1seVlVKzIR5LW?=
 =?us-ascii?Q?pQo++Ol4yVvIS52PCzR3kOIhqdpy2nmhw6gqbezti7PJ1QCrZGldLA1AUO+Z?=
 =?us-ascii?Q?BGLVCXxngHRaCvcAPff4gD4c+q0V4larl1fiZL03eJ9lM0pOLvnVG4ItMS3S?=
 =?us-ascii?Q?ucA2PkmDBqfcEMlMSJx/lEFQtBoX8Ly/sEW5QfEVFcO8q9kynr+GyxXg2Dr2?=
 =?us-ascii?Q?1wIiZl6CQopvRWSRxYbY7UdIiiah4uG3STrBgetE4aPWGfneSl0cLagZBynx?=
 =?us-ascii?Q?ozuLO4IzckimpK26/MMVh9T1h2KvgqIP6Xk/vU0hicppCqMNa8B5Yi0991tv?=
 =?us-ascii?Q?fQMFYF+fUIJBP/Tbj8ZZg+ouOjCS/Y+ezYq7bxWmCp42MLgBRUicAt7MFt9N?=
 =?us-ascii?Q?CdE5J7oZxMpzd2km+MLj734sK82Rw9U8BID0ksTT8t9m+DCPXVNEKnBoRBF1?=
 =?us-ascii?Q?V9K9VUxLWzm3f0P7wTmRpyuDjnTc1Vl8Uz1zq52SPng+eAtLIUzHX+F4ZkKF?=
 =?us-ascii?Q?oR6BxPaEBrvYWcSY0I6BeE/vfU8/7O6bxUX9YrsHOSUdMk4JuFyXxl35JAlG?=
 =?us-ascii?Q?Jtz9XHs8loH1j7RHRQ4J2ojK8xp1OLeC5D7II2qloQwqBCvzW/BySv2OT2kw?=
 =?us-ascii?Q?FoMXgY+6YlGYW5WMXuSgakoES/HI8fjTejl/I+hk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ba3e28-2815-41bf-f3c2-08de1cd3b639
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 01:27:55.8263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzPqNV+B1gUsddD9c9JvJdePvuh7WEgm+p6NKzoHZZ/HO6+mr1f2Ndhr0tSXIIYinxAg7O9gZ/orn5Qt78Upgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7658
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

Hi Danilo, Alex, Timur,

This latest one addresses everything so far, of course. I'm hoping to
pick up some reviewed-by or acked-by tags at this point, unless anyone
spots additional issues.

Changes in v5:

Two fixes, both from Timur's review feedback (thanks!):

1) Updated both the cover letter, and patch 3 commit description, with
the correct description of the future contents of NV_PMC_BOOT_0.

2) Removed a trailing "boot42" typo from a comment in the code.

Changes in v4:

1) Simplified and improved the decision logic: reads both arch_0 and
arch_1 fields in boot0, and skips the unnecessary is_nv04() logic as
well. Thanks to Timur Tabi and Danilo for noticing these issues.

2) Added a patch to represent Architecture as a u8. This simplifies a
few things. (Thanks to Alex Courbot. I added your Suggested-by to that
patch.)

3) Enhanced the Revision type to do more, which simplifies the callers.
(Thanks to Danilo.)

Changes in v3:

1) Restored the Revision type as recommended by Danilo, but decoupled it
from boot0.

2) Applied Alex Courbot's suggestion to use TryFrom<NV_PMC_BOOT_0/42>
for Spec.

3) Reflowed the new comment documentation to 100 cols, to avoid wasting
a few vertical lines.

Changes in v2:

1) Restored the Spec type, and used that to encapsulate the subsequent
   boot42 enhancements. Thanks to Danilo Krummrich's feedback for that
   improvement.

v1 cover letter (with typos fixed)

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will contain a specific set of values that
will mean "go read NV_PMC_BOOT_42 instead".

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Also, remove the Revision type, because Revision is no longer valuable
as a stand-alone type, because we only ever want the full information
that Spec provides.

This is based on today's drm-rust-next, which in turn is based on
Linux 6.18-rc2.


John Hubbard (3):
  gpu: nova-core: prepare Spec and Revision types for boot0/boot42
  gpu: nova-core: make Architecture behave as a u8 type
  gpu: nova-core: add boot42 support for next-gen GPUs

 drivers/gpu/nova-core/gpu.rs  | 92 +++++++++++++++++++++++++++--------
 drivers/gpu/nova-core/regs.rs | 41 ++++++++++++++++
 2 files changed, 112 insertions(+), 21 deletions(-)


base-commit: ade19c5060dfa39b84a9475a4a6b05e2a8a2b3ac
-- 
2.51.2

