Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF556C5FCDA
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 02:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0310EB92;
	Sat, 15 Nov 2025 01:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qJRkjBol";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010066.outbound.protection.outlook.com [52.101.46.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABD810EB92
 for <nouveau@lists.freedesktop.org>; Sat, 15 Nov 2025 01:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BttpN2UDu7reGlvrdmHSJeA7ai/lv0pIcT1O9aMHNKWtwmTbWfETX0NY1hwdakIYvykOjnRoVylNe2pcuAPpF+X/FWess4H9u3W7JSaw2IRH1tE8ASyuXMtROILCH2eQYHsWCpAG/gkESnqH7ttDxmiCHqT18+cckEY9fzl/UBu/dWGW9OQaOudHpxvwvU3VFthdG2fSmvyZB1X/ISkUG1gsDa4Z/XLHLoTQyv7gqonIE7O28uu+6T+YiX54NCjAHIC+ym7Is3pXzac/mZFyJcAP1OdQBozZ6rDIlKOHLVT4tcvQ+87cT6pABvR23fjITPUp9OkWNbzfrY+SCdXkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w100ttZLSa1UwBwdVvabDq7vGf0fbicjgcvOKs2nQ6E=;
 b=D5QIz4p1tz7Vjh3SWyhSj9J12A+xnOBukSOSd0Ek0cIBQTJ9M7Q5xJtDChQKKwf01N3iGKmqqwrL+ighDur/8q0Qho/4LpLQGx24+CHqbvG1wg6dYAqI89WgJuKMAyVAvq4PxWggfwdrkTAFejwhixcKsAqn3eezGLKIHEWBT4c/84i8XnqJv6f3GVzPPNB0Z1hndj+tIl9Bsu0Ti66++ZRrngwtMhLXhwrblDj5BlImthLeQdqVvNGc6K442qtt3pWT3ZDEjEYzWdLJ22sA33yk/Klh/D4vSvHI1TVeB/TyDTqoNsu4DApgNP4XrkDBNbwCxGvPYEPPLLU+EGr3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w100ttZLSa1UwBwdVvabDq7vGf0fbicjgcvOKs2nQ6E=;
 b=qJRkjBolILInt8LTqN+2QBBvAFa+veT+ToS1bu2t0gS/NITJZpfE5TVv2Rb8HORjwU6F3qd1VXQU0F8kJUteoaxuhhBC0YBUO8L0yI5fvjDL7ciRpm1/aZ8JGM3+EgFg2u1PafgASEGUKdIWsGVARi9MXNV4mSQtDZYhmM83VV9mFDUOl6SGIb5+b9t/PGTUra8S1bbZxsx6Qo+XR5FoDgPpD1B7VxuFoy+mJpPeIWqpfNUk2OQu6A4T/S8YwlC2eYe+ZOa7BePSNIe9Pnrei8i/Vp21u33ywnFCGEgZhoVfPDkb1G858Hu8gANHNxwefhyO1uu5mvltGdX54n2NuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 01:09:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:09:25 +0000
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
Subject: [PATCH v9 0/4] gpu: nova: add boot42 support for next-gen GPUs
Date: Fri, 14 Nov 2025 17:09:18 -0800
Message-ID: <20251115010923.1192144-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: aedb9fe8-fdb8-40f3-76e5-08de23e39e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eSChfMNWPhsfn4T/uBioKd/NgGaRLc4V3QqwNyc6kjQhtZ/nWitzwJYWG6RM?=
 =?us-ascii?Q?EIHMuQoL8IXjolVeMVp1YqW+d7HcweEILVSgJRNwE1MEF8ZnwGF6v7AjfXix?=
 =?us-ascii?Q?TsiNrY68A/6UK0ixAt5A7w2l/fU/2tzF0CmoMaEcz1xmBFHLRakrYaGAwDZN?=
 =?us-ascii?Q?v9kDvvoQlFXFHV7w8IhlUFSisyqSkRV6oISRWmIckJbDVGz+v9WrN8h5LWpw?=
 =?us-ascii?Q?f0GyoBa8WxSU6npF1CFofm4BBOKwnN/38SZ6JAqJJvDK+XdqMxsWuiELggSZ?=
 =?us-ascii?Q?WOFoKJrUTAggQ5tx4Es8clQPHKiwlfKANEEJ/rJAwVJSja0hnN/hhFD5Nrlh?=
 =?us-ascii?Q?p1iEmM5il983u0jM3T072iCT0mt0LN0Rby+d+oCu6N6a3Ynz+LikAO1oIhDl?=
 =?us-ascii?Q?DYc1MVL6FNu1wOYBlhCR+jrsCrLA/Zjk/aJ0PHXDIJ4x+A4PZmksWGfp7Lf1?=
 =?us-ascii?Q?2LUmKFBQzuS58PngoZg7ApKAmfl8yTqEOzio6RYPnsH0T6VB/j8b2Mc2wIEJ?=
 =?us-ascii?Q?s/7Clx4ZmrXhGf1Adjryr9W330TnSmmpgCj203sfdCCqhvuCFg8QCx76UI56?=
 =?us-ascii?Q?/ZmOdi1eHW4s3istTi0ZfqDrwxE2f+57qAos6rBvwSTNwQYdIIAq5jk8qr+X?=
 =?us-ascii?Q?fmsJJymUeZCUAPQCTvT8zPnIlXniA9dfgFJAr/TWC0cLlElkC22Kavy899Fw?=
 =?us-ascii?Q?Yju7gKDA+29XPkcHHvZrUc+vENRcg21zyUvR0aq9vrGTOgRn7t56Ll4OB8fa?=
 =?us-ascii?Q?xS22KWV3xxI6ZH3c+QeZkTNZFwb8zbj2Tv+RE9PdFCENHJjiJq+iKnjMSucw?=
 =?us-ascii?Q?Zf07i3i2pdfADE0GpO7FfENyD2LF4KY+GFU17+FwGGyK1FOWacO+c+VVYRLS?=
 =?us-ascii?Q?YYSzmfT8LTC+MLTSYkccTnDI00sS4lLkh7Un8qAuOWAxOW4Nq5hcfcvOqJ8K?=
 =?us-ascii?Q?x89dc7CaOKIs12TOrYv3pPqw+Kp3AniNkpG8QMtz1btSoWYZTun2aTIy65oT?=
 =?us-ascii?Q?4m30WVb81sjbghAukT2B1LK35w2/viEqFTHSDYTZoCyt1CKHPUVdVtu7OoB6?=
 =?us-ascii?Q?1iXm9n+WdEMhDmKjG2F62qmXtWP+8WvgaaTsvbA8H5UCY1r2FPAesmg8COdH?=
 =?us-ascii?Q?nDVeZaq380payXT9on0eDfTrOld6S4Rid1n2zLj0Z7m7rZSFKvxzrOWdcncf?=
 =?us-ascii?Q?v6AaLcSB9NnBYUFJz8akyS3Oz9lYNLb1pj4gWIkoSK75WIct0eg+UQJ1s5iN?=
 =?us-ascii?Q?HMH1nHXm/oHdJcnIFzcbDAzXAq1z/bmK7wktuW0djX3kcGCGc/gp2358Y+Jc?=
 =?us-ascii?Q?cGA/HxyOdLql3ZxxQHQ4nKQmeL4TGkWYayfcC6L05yxFOpzW2doHupOPdES5?=
 =?us-ascii?Q?NzP3kmVLl7/NWqGiRE4Pr8PD8mfPvafmjMLtv18kZb/Tm+vHICtqhRkkRWI5?=
 =?us-ascii?Q?mzt0lF2HG5ooL4EILZRKAxPNLxN7iLZs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ciH1cMNwmCvu2faFRMsKzc9//MhctSbgkB2MgxKFIQFOQhg0TKvDKqrYY+Db?=
 =?us-ascii?Q?2WXJp9tAg7fB6LME7J1731dGA/Q+ld95QJIRt2sHHYMxBBdsovDKAt5G4bt0?=
 =?us-ascii?Q?PVtdC4HdIX7P7XmOZ+68TIkWxaX9xVe4jxzZPcF3OoHrPZQl+lvnBZsdOsgt?=
 =?us-ascii?Q?RiowjLI0uSpB0wWAtqVdz9J/p6TzfdYK5h55aWU9iLbaiu5AB+tHvvmECPOh?=
 =?us-ascii?Q?edsCUtKFVZrpaNd56HHP0/ZdG42568poTP8v3DYHhAPBO8FL6820R4NyS1GT?=
 =?us-ascii?Q?SaFAyfDK+dSZYfjSQkXLt8keueu6qZM8PUiBcj2+xHvXbQ0P7qLep3wFWVgm?=
 =?us-ascii?Q?VCjf/fFvbPH5AaEvH8PqPN6nYT1qQeTjB2iFhyhpa8g1KuxUBZrhJ2cXw0aL?=
 =?us-ascii?Q?tHjSr+Tv8Bpl3dIcsOHM8nsg8ULPocdOFVz/2hQE7Sax7mCcDdZsPawKXu+R?=
 =?us-ascii?Q?ab3xCNkp0bwK9qYYlU9feZEGpPE6XtURad8Bc1iBkfa0YnA6TgBoRcU8r4mw?=
 =?us-ascii?Q?/XYQRhEk7Nn3mQq1uOzr0lJSUuEWGr/eq+riRV25c19hxMMiItzl/WIRlBAV?=
 =?us-ascii?Q?9piMNQmPoED3ZyYN3Hu7Bdgxx0NbDNpso+PEHUZkuUtsr4rdggyBv3JbXKZC?=
 =?us-ascii?Q?gqEtyslX7JG5HBgroSwu/K8bh9nZOaTPlS3+beJk2erjvxjsPgP74gw1wvRe?=
 =?us-ascii?Q?+A+DJKCANogaQbK2ClQ6IkhdusFtvym+H2Eniq+efULZRUvo8Riu0JaqBvz3?=
 =?us-ascii?Q?7TjoBgtkQSU1IgvNwwM7DLU0dWNVRKYjMk7rHgN72qXSzyxuu3lrzVsBxyb4?=
 =?us-ascii?Q?1S9CwwVGC02TVgS+kl72KLVXzj96xAYzQcAXYpoGqlQDn4t167jcgPIvbNHj?=
 =?us-ascii?Q?RNdqhntF+1GtxJ4gr0IsI8iiMMHnpsQj5D3wCUCfC81ZCPvxbtw9X69yfJOU?=
 =?us-ascii?Q?jlsY8ezEYJars0hGn4aj4S5lEwu1w7jjLVNwnpHLvWFNDvXxcm85emDZ2Ywj?=
 =?us-ascii?Q?XuvSnv7UtGVl6PT20eUcj90qdo1bhNgTjv6CLS/bafqRCB/aMWDm/GgkCBC9?=
 =?us-ascii?Q?NUeefCimuEZ2mQc0M+cfivzNtcpbBub45kP0wPGjQoDAhOELykq0VQsU20eZ?=
 =?us-ascii?Q?QIuc8hbsgJvYyuHqRF5+KFb/y9hTK1RS9LA59i+0RK5mZXJPlAI0ODCqNX5T?=
 =?us-ascii?Q?F0FFRZhLUW8vGHLBZ+qar2b+D8mKb+nhgTosG0bBvtXRl08iO8GHGqk2dtEE?=
 =?us-ascii?Q?0DGHNnBl+O7Ln0dB7hPVXWgq4B9BVJsw0BTeGuU+GFvD4gjYhUgfZtvy0TUX?=
 =?us-ascii?Q?PE9NIFU40lxDfboyupbYOFuNtruNq6ZrmBvn3vrWXgBcn6Cld47Jz+qs4aFf?=
 =?us-ascii?Q?HCVTEXzv59dossvwr9jqu4cl7sWWhue8FstYbOO+IecZGyz3q/wB4ngbMeNZ?=
 =?us-ascii?Q?1cFNEHLRK8QoEM1vSBEBm91/cxn6Waxias3AB0Jg+E1SYVDApX050WdUTEnV?=
 =?us-ascii?Q?IDo1KRver1W6ilnSw/L9mX7cQcakB0/JB6e/ROjs7sFXlGsaSrSpZIG1ECE8?=
 =?us-ascii?Q?88HUyAWMHC1T47YK6NvdwEZLK/iaDpSpWeut92Q+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedb9fe8-fdb8-40f3-76e5-08de23e39e42
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:09:25.4328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5ekPbXBhxnVJT43t/sIknE/EUug95UXK1Ebsj1SMHUmESYQqD2dy82YF0Ehhbir9uI+VRTwrNPTqZPlX/if1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
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

Changes in v9:

1) Simplified the Revision updates, so that Revision's member fields can
   remain private (thanks to Alex Courbot).

2) Restore a missing documentation comment line for chipset().

3) Removed the patch that changed from ENODEV to ENOTSUPP, and used
   ENODEV to mean "GPU is not supported", because the driver core
   expects that specific error code.

4) Rebased onto drm-rust-next, which already has patch 1/1 from v8, so
   that one no longer appears in v9.

Changes in v8:

1) Added two new patches: convert the remaining ENODEV cases to ENOTSUPP,
   and add dev_err!() report for some (most) cases of unsupported GPUs.

2) Corrected some comments.

3) Added Joel's Reviewed-by, but not yet to the two new patches.

Changes in v7:

1) Added a TODO to eventually remove the Default trait from Architecture.
2) Further refined the logic and comments for reading boot0, then boot42.

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
  gpu: nova-core: prepare Spec and Revision types for boot0/boot42
  gpu: nova-core: make Architecture behave as a u8 type
  gpu: nova-core: add boot42 support for next-gen GPUs
  gpu: nova-core: provide a clear error report for unsupported GPUs

 drivers/gpu/nova-core/gpu.rs  | 72 ++++++++++++++++++++++++++++++-----
 drivers/gpu/nova-core/regs.rs | 39 ++++++++++++++++---
 2 files changed, 97 insertions(+), 14 deletions(-)


base-commit: 38b7cc448a5b6772cad2b853a011f507ad95306a
-- 
2.51.2

