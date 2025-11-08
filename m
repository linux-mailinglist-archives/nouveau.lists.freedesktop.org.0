Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEE2C426FE
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 05:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A7810E0C5;
	Sat,  8 Nov 2025 04:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fq//M3ho";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AA910E0C5
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 04:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXB8hbimkRbakmkYH0hO1QXU6T4sX3fsQkerxmx5aAcz+0yJuGSEUNChbOz08EBpAuDwyZfrHelU16NJ2O0g/RWlo+RqBr3FxJ/lFthwG30vJiN8+nt1iOD8Z7o/W4bwgQHPvBkK/4kgw62wuT2w2wmnoUsjc8AvPU1fOjd20CdMJH7r6qUCG3Is97EXIgRcqzUSBGRX2ZXJAVYPEamglalAY+zHjPqU4Ahj7HgB1FPkeZqfo7N44T1oDWSsayanAwQDP0pqvoR00bEbkMY9ki1NUgYLY4PqbzA3MpIZgRzjagNC1ZuFAJ870sDDM3HYKi/xW8mOHwdM7HL581O/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+rpU0mpS8rDpnBmWWJHEr3aX5WsaxVbK4aQJsXmHBE=;
 b=MDZbtfXeC/JP/IOSL/FmNHp6RUJZ4WpTchU5aN/vf4StJ4jsPndAnBM2qMoPRiYsWZmp2mh0bf+D+Sad1VfqbGFk/FMbNjdF6REdI1oOQ7aBCKDm7tFFfLNQI1oJQQQbbxPrZbsW9lB8MhxUXwsp3Pd374lqrvAMCcgRphY5Ct1EfeQ9G87tvW8krUrwGJVhr0DIpEwLub8mO2JHqd4bM+7/i4e+vfPThHdLXfSyl2X6zAmq6PVrzRXLJt1rSeUmBw04t5Mxl1VStG+LaoZjHlAxGJV+k3YeiBOip+bFkAXhlyoX89zexxanoJgSz1Fh+dZ8E0ULZwtlsR1dM8qIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+rpU0mpS8rDpnBmWWJHEr3aX5WsaxVbK4aQJsXmHBE=;
 b=fq//M3hod8TyfwGBzJZyyZDeMtxP9zS7MrzMcnAknLuKYb+F7R2hVC/mzfxTA/JZWuRtH8yNRHS/CXMS0B6d7fAKYv4TgHsKJ+CD9fQ32f5BE46omgFGGGenbojHEM7+ifX9r6GW2QJApHhA7mm0zQqQk/JW9qyD1XFsbHb+H+nAU9w0MjQMfQmXxQWBLkJDB1EPAus2hnCS3KXTVzwikdMryUmTqI5asF4U05als3ugq8slvJNJYvLJ61y3JvNKMmfAH7WbEHCNNZLODajrxQlQdtDGMvB+P1/V34F2juMppK1z72VJk76m3UVM3WTDz5/t01wmRrMSqNra+AN44g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 04:39:47 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 04:39:46 +0000
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
Subject: [PATCH v6 0/4] gpu: nova: add boot42 support for next-gen GPUs
Date: Fri,  7 Nov 2025 20:39:41 -0800
Message-ID: <20251108043945.571266-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 97912d0a-27ba-4938-a950-08de1e80d846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rl/0BE1Lx45k/lfi3KIhLVVUw0WLotSvzQMRNrqGWTyyyH8SANd/f/QP/sXY?=
 =?us-ascii?Q?MrO9ChDyQugO0GBb71dqIxUjdoV3m4JhT1k1gM4zIDLo9IwBwtsx88eGDyuR?=
 =?us-ascii?Q?Kev4RfB4UGfUkKh1EwWkH2r7L6b6xRwTig21ZeH5U9Tf8y0pHFz/lXpTx3yb?=
 =?us-ascii?Q?eRJ1Hngr1ukiPKkhmRsV8GseqxNK55bOgZ/2mUbYMq9FZpL8NcUN/rbWMquy?=
 =?us-ascii?Q?x6nWoJZ115tBII4ZXqF/rxBmomBe6ooXffT1o9o3VfKM8qvs2JDRP16AAyNN?=
 =?us-ascii?Q?6dm7gCA4gwNpnuOXXcOyEdQ3MHM860ng7SdFpkKEprzVm+1Deg0L90Ud1WoM?=
 =?us-ascii?Q?XD3YfFBdtfqhOmpiC0+QUJTbpb4U+nrS0z9HYAtXrk8rAfE+dk5LV9AChAbj?=
 =?us-ascii?Q?7gMou8b0bEl18BRl9Sf2Z4l2FqRcPotWlCKyfxzcCCrvCqCam+mC8EGTygR9?=
 =?us-ascii?Q?MSel+ppB8tZzP0kENMYqE1mJWzmnJAh5s/MYTWP+uXTsFB7KxUjRMmkuy8TW?=
 =?us-ascii?Q?l2qhfdrmaXpp1o0XgEAO6Oko2uvwYJIDRU6RI1qHu6bpLd0E+X5VDFNSVQuj?=
 =?us-ascii?Q?FdNArMHrmpgyr/GyKN+i0UdvZApJA2THKKeohl0W00E2tQoddNvwy8YZK01M?=
 =?us-ascii?Q?ugrjmrNleoTjtla28pZfDES6oPDuV1qjt7iZD0nFz2a/p6bmAqL4ODPBC/dG?=
 =?us-ascii?Q?KTP2kXnvMXnJGAsaxbjsVTobwQ8tr7pe7dtjmHEtgUyVrWyofLm5KGESwC3t?=
 =?us-ascii?Q?tZ3czmjitFaSAQOEINy8Dm9fXNmFKMsjHUzVy5OR7QERjWh/ZLUM1mgDed1i?=
 =?us-ascii?Q?RGea5nw/jDApc7o3z7JYmM/RcfRNbok8mDHEQ6Lix52MhMcpWYVsNXJc7CHP?=
 =?us-ascii?Q?whroG5nAMpCZQcFvmjf6Y0iwGYmvjQHFJPMgrWjG8qTj0LE7lfTcULrJ5D0U?=
 =?us-ascii?Q?0x/vuxtlZWMQcmcsaKed0Fngo21WFTZCkyXrpPCtffzoDohqIpergeLNT6dO?=
 =?us-ascii?Q?LiQLItfH8b9h+Va89N5jiTh33r2H3ZGDm5Qg60XX0VRfclqrhDtUNoZYNmQV?=
 =?us-ascii?Q?YxvWQWgZEb3gf0ruqODoFlxNikHJk++IypBZX2O6OnYGaiGlQCNT382H/slX?=
 =?us-ascii?Q?yXRQMggADSxaKZAILRmDNLPkG10GC/n5S7359yOImplqPFz3jv5s3zv6vx4I?=
 =?us-ascii?Q?IribczOr2Sc0PhyYcXYki54BAsqhEyIXgdAqR/a9DkLwmOPPWImThA+5nmOo?=
 =?us-ascii?Q?pDEwuOl0wb7l+Z6FnNftxaPETVMHZLCAhtpiA5DHIXdiS96+zU/TaV4UA087?=
 =?us-ascii?Q?Cy+uSYPPmoAHjxJoAc2zp6NMLPUEBiF0GNRfGPQPDZMSv2QpAjo+5Vot3MuX?=
 =?us-ascii?Q?x2/l+DeuOTl2/iAyhK798xvJXU/T4hQh4yhXJ97rYEbzcG0uxx7Wsgm7Ew1q?=
 =?us-ascii?Q?/9EfUJV3z5ZwdzJWGRKBlkYKSwZlqTBq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LPuXFCegeTN5+7WqsGMOmCUOVl8t60F5iHX41fgXOfbiLUzWsIwJ2hUz4A6G?=
 =?us-ascii?Q?6HBWuzDKEosgfcF590mJLnBIxpDNi+1jQ7arg0Zhg8ahwZN61NcfjQEbpeUq?=
 =?us-ascii?Q?fxwIK5KCPvmSmB6oXPql9cbPRcWj02fbd7sTeBj9aZVgh7/1guov83/+8cS3?=
 =?us-ascii?Q?iWNdMRKirDlUGza8yJAFMOaWOiMLbE77gkc8VFVRKhOnlQ1QHYoANKmJxjg2?=
 =?us-ascii?Q?BneyaM25azyd+od//fKxVGQLb8Ol27RYs5z+oZwoT4/2t10yGyT11kqLgMH0?=
 =?us-ascii?Q?rYA7TQ0HoSzAl1yx6LY6P5ekkZrhPSPy0fH7lAaOtQP354F5/WHpg5TBlSwj?=
 =?us-ascii?Q?SttOahXfBK3HHNg/qdDbwd7z0yg22BbEQxkw9ITw8ST+aBNnNotFOG6/XfCF?=
 =?us-ascii?Q?h1LZkcJcAg6VTaJ7+q2g3+NLZTrfTwpdEZ65//CFnScQVFJiaHWMi9RCFxDh?=
 =?us-ascii?Q?ZM/6icGBAkoHQ1ZkY4B2H3hZegUUUDuH8bHFnhct7okMILjlLNGmNQfJ62rG?=
 =?us-ascii?Q?Efp9S2ZCdGgyppzwD745XvhymjtCzl2KE16f5hsx/ttTnmOPbraxxnwBl1Ld?=
 =?us-ascii?Q?OAyXZiOpEkBcNVZIevPdeaoY5qImdJpZB3EU6+A25S4sZwhH0ijWwlyP+DeG?=
 =?us-ascii?Q?0XW1lwGWbuxvuJId2UYE0fwC2m18Tz37uMytQqXDj4dCYMUGU1byhvJ7nqaP?=
 =?us-ascii?Q?rgXCLanNAnnmV+ewOEpqEsNkQ7Su1oM+ILgS9342TgPYhM0SiQMnF9RbOAjC?=
 =?us-ascii?Q?yX1cpIqKdH5ZZtgklCNnpiuw7whe46MJSJ+18FtAxxhtoCgG6dyBndiO4fA8?=
 =?us-ascii?Q?KuDAsJV3QsNbsbe9/MjvGn1wb1xAixcKxgpy0AucLiKlgQEoDAyd3Qtcy9+M?=
 =?us-ascii?Q?L/kwBOt65v0xNosHqMGADugOd/ey8mkxY5RDgIMwu6bgP0i4RmeebhlGRZqZ?=
 =?us-ascii?Q?9k0lIHbxjAZ3F98IZcAQOBQdHzu2yHen2mgY4U7ZJPO5DEHsOCtS8i7vSQnk?=
 =?us-ascii?Q?GnlyAh6vKFahv0QDMNOthc17CcJT0lAkOjtNvbA0n5wfA4OjGoX5gpwSakLg?=
 =?us-ascii?Q?ZyDs123rZ0eie7leNlMWDWlzSo6BL6zRuc43mUQw4DOmoKKgDMuCHqJgGeCP?=
 =?us-ascii?Q?lmiwlLiMoTFPn8EcAj8TPfbxLoVrw0o9C/y5AwkHmCoJoUSg3d1zdacReULl?=
 =?us-ascii?Q?tIC77iF+wS17NTpOd7P6F/P2QbUeZEvhBUg9ARJLuvonxsV3tPmYrleQf5Ib?=
 =?us-ascii?Q?nE4pMhrOeRstibOABZgFOsrQdeiLWS0xnX9ns6rUaHq842a+hKmHRPx+mMWb?=
 =?us-ascii?Q?WsyvcCyZsnge4KDjAwtrdhLenKFzcQ9rSDacLfVNWdg6MS6RjCGIJLXDTs/f?=
 =?us-ascii?Q?p/WpGMQfDx2XT3TWXvPyXhM8ZMwIL5TKdzVNH2JfjWUQgZ4kTc2heBxJGNEz?=
 =?us-ascii?Q?kWoGJ7W7eAyIVBoSTH9flTS0w1byVWRVYI88vkle5za1581BEoHZjZgvZj6d?=
 =?us-ascii?Q?zMOcgQ6O57g98Kb4TrrO17tpmj+3EipbIpilz9sfunRBY46ntmCKmQoROUVv?=
 =?us-ascii?Q?q7oaXMDehqTTFdnk0lGJMsBVKNa3zNZmbKEXXUGe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97912d0a-27ba-4938-a950-08de1e80d846
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:39:46.8123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vioF5PhPqp5t7P0kdN3KlT0sWhLa8pTSFPckGrQj7JXPRDnnd4ifWOmsTe8wnT/hMAaL9BzJnMwDwYdv3V0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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

Changes in v6:

1) Split out a separate patch for implementing Display for Spec.

2) Moved Spec implementation code to its proper location.

3) Significantly changed the use_boot42_instead() logic, and updated the
   comments accordingly.

4) Fixed the boot42 register and field values, which were wrong (and
   had not been exercised before).

5) Imported Revision, to save a few ::'s.

6) Rebased to the very latest drm-rust-next, which now includes the new
   "one 'use' item per line" updates.

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

John Hubbard (4):
  gpu: nova-core: implement Display for Spec
  gpu: nova-core: prepare Spec and Revision types for boot0/boot42
  gpu: nova-core: make Architecture behave as a u8 type
  gpu: nova-core: add boot42 support for next-gen GPUs

 drivers/gpu/nova-core/gpu.rs  | 87 +++++++++++++++++++++++++++--------
 drivers/gpu/nova-core/regs.rs | 53 ++++++++++++++++++++-
 2 files changed, 119 insertions(+), 21 deletions(-)


base-commit: 80b3dc0a5a2e51fb2b8f3406f5ee20ad4a652316
-- 
2.51.2

