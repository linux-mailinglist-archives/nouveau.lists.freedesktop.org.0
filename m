Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F550C9DD5E
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFF110E07C;
	Wed,  3 Dec 2025 05:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e91dRldI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210B010E07C
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/RE9c6EZvKUXHFaI6OZ+99TB5lqePS6jb4RHMWcQUcitY+NGfQJTMwnhETc1B92M/KRX1CpPeWoARySyGP+FNzs7axmkOc13PWyo6ZThZrDqRPih9KJCp3jlMo4Wm6Fpa1xINIGmu17ToKslEeeDTzpIxTFlBWvfbhOe7z5NtTQqiCvJDLrIoc5opbZ2GRVQbVOslPH3ATY3jkeoGYqhO6T99QoJsdWTMY5X/pNkis7SlR41VnJ5Z/9AgKRPyoxJKAGIkjEfByi6tDOlfOjGScIFe/KAhqaIR2XP199O4v+q52vtWMpr8iFmFI7bDfmTSc2Qnwqsaq3Bed5r2tBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lmz+3xFe3/aI2Lvtcz+K6B+Zjp++J0cYESzT9SN4Z6U=;
 b=Y0MkQajUIw81e2g+cnxnlnfcW5z86JNOd4o36oS3JvHeCfpF1wB/e0Ym/0ByGxptrgn4HvwvuJeI3b9gq2K0/Z6SrMCxn856th1uh2tY3O/2uvzgXmbGgtPYXmGB3YBdZOX0YYMuTWww/8zvk0w/YmYzklGjU7r7hYy8346dxZVjMuA/NQfqC6AeCTcPLJuX0E0lDCJoCjZLsnxdiWvIrItqvo2+/z1SwYiBErkCgw5UtmWwgY7KG2OnnH1C9BPtDoR3YKvEl1yryRyAa0tAOX/l29zXfrLqA7LMNGLxsqKuA73Wn+f+LignIXybayYT5RecRIogmmbKubM6rvo1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lmz+3xFe3/aI2Lvtcz+K6B+Zjp++J0cYESzT9SN4Z6U=;
 b=e91dRldI0xKSwtH+3tp5+sH+njrDcupoPNAU3N9/cwrtiFQGtuBhEc9YCjPyvOJ3c2jTDBEjrqbEw1yyQ2Plpridy+d8lNxglBwcdfsYCO62LG4PqqouAs/ZobdGs/DA5RLd/MKT/GU7unahvESJqv2z8455/Uv4OJ7A0pJOardYNDr2mctCHi4s4FIIj3a3+vXCCdBiNIGiOqAgAvDOmejW/CRtjNyTZwC1DDJr2yxv/Oiub2ZlKP39LXeN6Aq3beLnyGCStW0VF7uE1FR90l4GyfL7pYWDxchuNhyoGS3WJYeUlzWOFenaIj0VS4DSCvqKULGqJzQ7Nto4GCJ0Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:25 +0000
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
Subject: [PATCH 00/31] gpu: nova-core: firmware: Hopper/Blackwell support
Date: Tue,  2 Dec 2025 21:58:52 -0800
Message-ID: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa5cc04-f365-4617-b890-08de32311cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gzGes+d4VogO8mTBMYdfgpbH5YbXWQ10j6ppjcPcMQR2E1vsJgPM4wX0g6EL?=
 =?us-ascii?Q?0dONiy5Rp2ufcUHrprTXZWmKr8KLUjqL6Bx90qjqsLXbyxryJ1KwpjG4ZAsH?=
 =?us-ascii?Q?mpMseLs5bTP3wLyQyiZhIwZubdcal18l1NfGP/mU5rOM86yc6rVIh1eaOP5T?=
 =?us-ascii?Q?7smPRdv5gj31K6vG9l3tP6zF36Vuph6VGNxbUy9nreN6GO16Wo5SdjioMPoY?=
 =?us-ascii?Q?oWL477yEF48Mnocy8kKdL4+9+BSaXuve6iAIcLNhbq+s02MngvrBEo0mauU4?=
 =?us-ascii?Q?jHMDjThuVZ7f1SxdfAE7t4P6AzS9U1bD4MvPqm9gEq2mXvdRuGHioeWmWRBM?=
 =?us-ascii?Q?V6O67cSUxqpvLHzxH97cu7W1CxfxoZmOvTcVAFIjKS4BP9Z8svIIA5MHPbP6?=
 =?us-ascii?Q?TBPWxBjOFLHVL/LzN4lGCNlS7pvNAne7OOUnD4zEBgRnXlJwGeLE8oH2hL+M?=
 =?us-ascii?Q?Bs3U7QMr+aSXrQCpjAo2yQnEOZbi+sV5y/i0KVuLoqVBCZjg1EjsbtnfyiEi?=
 =?us-ascii?Q?p/esAjGAOT7/6m4wcYkyrchx5nghcrI6FAl9gIicD1B/5+Nd/Zbc8GstKMH0?=
 =?us-ascii?Q?sJi//QVsWtNfhoEOKC4cLVsrSVaMKgpO2tBIB/iSioIKCUIDf9G3IqUc4nj+?=
 =?us-ascii?Q?xO44LyLa7frr69Atk9wS7KU0BdjJIE+iM4J2d6x/+uQYxachoKnArkDCN4d1?=
 =?us-ascii?Q?D2K0trjsrd+ZcIEQdYn1wlsZ3a84ztscY9ej+PcuSvqZZxLgPofk8sCwIfxj?=
 =?us-ascii?Q?M+yt0YFJfcq50e/GM/6pzMhWfYNmiD/b733DdSwagc/e3DoxGWaQm5AIn8Vr?=
 =?us-ascii?Q?V4PQm//ac1tz2++zkFf9exQARYSpALVpnsAVpcImeXyI/mglLA9rpPVl9eQh?=
 =?us-ascii?Q?uQeoLPN/ZI/Fb9bYWRVm5QMhGr2Juc8Y72GpMO+PD4dbCYnX/8ARPcL6miOI?=
 =?us-ascii?Q?20rz17K6Yp0FCFV8+U0QKMKF1FKi5B9Rbc1BrwP423SMnuzxyibAh3y8o/+e?=
 =?us-ascii?Q?NsWKp+kNw+As1PdH/XEyt5z/8u1S8zaoUmz4Agcl1PXfFxXaiDOve04hTM2Y?=
 =?us-ascii?Q?TGLwdLs5mvgS49DdvhF36S7gsbwsNjY8JV3/rbEthRrCGT1DCAM2EwD+XtUe?=
 =?us-ascii?Q?wzc3p14pqkskP7gCQiNjnnwMiTmdLMtVc9csv5tSOLgk6Y2ndcCmamgMiPfe?=
 =?us-ascii?Q?RQ0pLFkouRzDQVFg9hg8ueoAeJWCwNzF1G3w/8nPeZgfg3b74hvUgF4OOWLs?=
 =?us-ascii?Q?fkD9MGRX86PE/kXPhIPsi1FLKhzhW8GkqsNkTgN1gRxKsjw5HOk7L3AizFXn?=
 =?us-ascii?Q?Gepsh5RviQFjh+0qW/AecoO4DjyGeWZsVvsiP/y/9NNc8Ul2AIYNyA4B+4Pq?=
 =?us-ascii?Q?ImYqVSZ3CfJe46potq9lNshANqVL7GwShs48mehI/LH6Nf3uUqMcbeqXG3oM?=
 =?us-ascii?Q?FVnepFjM+eJNts1Ay6XNcOsq8V79J6TD41bdrEc6+8fJSl9fAJb4cg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mw+g05Goj7H4rR1ob3HuJnj3CmZMNCJU+uTKscgFAvXF0/DFFIPLNjjB6OHH?=
 =?us-ascii?Q?qeQQ2oYV1Dk+z5XWsMxbBt6xHvGlEvB7f22U/v7gqX/3oNSA1sRx2JWcedaE?=
 =?us-ascii?Q?ptkiqAKF1shh8atIlexsdQMReR2vP59NNbadKcJBQUkMxt6GJ7Jw+OaftQpi?=
 =?us-ascii?Q?d4okj6pJ0xXOjg2qi6N1hQJN5ZJiaYGMR9A65Yxk4WcejUiIkJvQwrtTk5RU?=
 =?us-ascii?Q?0hmW+MnwqIs3+TM/GSD8+l3APDXzus2et1hDa5ow/dsBz7Un47qOtvQf+GRB?=
 =?us-ascii?Q?1t67qEWMWq2Ceu6mesCqUzQheZ1KCU6f2GS/JkGTdA3MTqWaRfpfbT+Q7HXW?=
 =?us-ascii?Q?73Xh28oYgF3/sri7SZIZ7v6sub8ujutVuq9pOA73IbCIU/Vfiokhb22dkABa?=
 =?us-ascii?Q?q6pwhpH05eLHYIVufPrjMAoNVzHHIuaXX3uBs7CJv0XPRxeQQDwmxJBVuq3h?=
 =?us-ascii?Q?nNrCjSkMZ9aH/SJ9Vkk0rJTDLv+P/xmaR9qJio9sPdOF9S1f58787VFiocg8?=
 =?us-ascii?Q?Qjtzgj16j6eC3PbXPQrG45xz+syP+GKQDUDhG37702Zjo9/pFNW0zwil9J3e?=
 =?us-ascii?Q?Tepk2LcAZD54mMUFSwIYGkpcqzLl3CrCAV5Ih0EbWMHSFwGW/LLoot3k0yPJ?=
 =?us-ascii?Q?o5SVOfhjw1VbZvxoc7R9fGwRD743x4QDN5Kc/vTgR3qC3tmcxKAbqb4MEKrB?=
 =?us-ascii?Q?2o7KWzB7QsweXn2u9oH59UY86w4MEFoNVoJEaI5XjSa+tnC9WFuscd+f5LS3?=
 =?us-ascii?Q?beL1/yNXhAIWgnJ+2OY0ZJGui2x8dDOIxnZLEa9jEj6IzDPRgG8R/DqGWGga?=
 =?us-ascii?Q?cJ5uoFcZn7m0avJtThVPj1iUdhAqJqOON8XShOTr6EjR/2kOtlHlO9y7+hMH?=
 =?us-ascii?Q?oLK5/2s2A1Yiab+jumL+CWhIwXMAG4DkjJxy/4xfaO6aFDwCL3eGElZFvVrq?=
 =?us-ascii?Q?IAHkiZ46qB/4k/3YBsEgn54mXe089bzvLzUJggeqEslvccFHShc/6TT1nX7+?=
 =?us-ascii?Q?kN4cvfEl+DAWskAFDPVQIY0mRrVk3rgOPCneOq9gWGNNVVwdqsgoBrMhox48?=
 =?us-ascii?Q?MXxJElITngEc+uben4tRtnq7waIc8P9h5j9xg3cSrDMIpQDP2tbJmiUwT3f4?=
 =?us-ascii?Q?ENHdJXgUQh2+LmxJbLnbLshow1Ra+5iKh/HzxDWNiGUuw0PFoRCOAkJop0nB?=
 =?us-ascii?Q?gCq8Cr3Ial2dELP8s0pjwYKj6pyDmL/K9Ixdebj8ATH+4rdopg3a+vYxG4W1?=
 =?us-ascii?Q?xlNy+PCagTOT27kGrxGmrp+etApcq2Q5YPw4B913LjcLPvi/29V+7rgmDxL7?=
 =?us-ascii?Q?RhQe0e2Y9FAGXl/mNV12ycfXDIdlqn+rmSxj/DlBQhq6Gwme6zrOvEkHKtnz?=
 =?us-ascii?Q?NZAu/QzeR5xXh38enuTqoKUqn9p302/tnGl2mZpa4CpC/bVQSgsQ/fns2yt0?=
 =?us-ascii?Q?PZ8j1ogqm0JRSnPY9xGq8BFJSPMyS9sWokXiph3HoY+ujsAIu5ICFjUjp4X0?=
 =?us-ascii?Q?ZTCHepiIFyp67vnBlLfVZxCiAWWa4A+e4riNALp4sBAwYZFlB0qwmWeJ+qOo?=
 =?us-ascii?Q?elDVs6AVvPnjyXF/8T+HJNZkw5disBh/Bss6lM++?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa5cc04-f365-4617-b890-08de32311cde
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:25.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4JSAHxl36kWPuIghQFiSzTTnKpdIECaWaEtbO1ZdtFTklWtTUkYEO3EwwDxrNY9bZJledEsbQLAleQ8iKVlkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

Hi,

This series adds firmware support for Hopper and Blackwell GPUs. By
that I mean: Hopper and Blackwell can now get just as far as Ampere and
Ada do: they can receive a GET_GSP_STATIC_INFO message from the GPU's
GSP firmware, and print the resulting GPU marketing name to dmesg.

Having made that claim, note that I've only actually tested the new
functionality on a single Blackwell GPU, so far: GB202. For Ampere, I've
tested on GA104, and it still works as before.

The doctests are all passing.

This is based on today's drm-rust-next. For reviewer convenience, there
is also a git branch that has this series applied:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-complete-v0

Note: I've merged in the earlier "[PATCH v2 0/5] gpu: nova-core:
Hopper/Blackwell prerequisites" [1], because it is no longer useful by
itself. That makes for a large series, but now it is entirely
self-contained, so it's easy to apply.

[1] https://lore.kernel.org/20251126013936.650678-1-jhubbard@nvidia.com

John Hubbard (31):
  gpu: nova-core: print FB sizes, along with ranges
  gpu: nova-core: add FbRange.len() and use it in boot.rs
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  nova-core: factor .fwsignature* selection into a new
    get_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections
  gpu: nova-core: apply the one "use" item per line policy to
    commands.rs
  gpu: nova-core: set DMA mask width based on GPU architecture
  gpu: nova-core: move firmware image parsing code to firmware.rs
  gpu: nova-core: factor out a section_name_eq() function
  gpu: nova-core: don't assume 64-bit firmware images
  gpu: nova-core: add support for 32-bit firmware images
  gpu: nova-core: add auto-detection of 32-bit, 64-bit firmware images
  gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support
    of FSP
  gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
  gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
  gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
  gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
  gpu: nova-core: Hopper/Blackwell: add needs_large_reserved_mem()
  gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion
    waiting
  gpu: nova-core: Hopper/Blackwell: add FSP message structures
  gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
  gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
  gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
  gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
  gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
  gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
  gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
  gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot path
  gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
  gpu: nova-core: clarify the GPU firmware boot steps

 drivers/gpu/nova-core/driver.rs          |  33 +-
 drivers/gpu/nova-core/falcon.rs          |   1 +
 drivers/gpu/nova-core/falcon/fsp.rs      | 167 ++++++
 drivers/gpu/nova-core/falcon/hal.rs      |  19 +-
 drivers/gpu/nova-core/fb.rs              | 101 +++-
 drivers/gpu/nova-core/fb/hal.rs          |  18 +-
 drivers/gpu/nova-core/firmware.rs        | 193 +++++++
 drivers/gpu/nova-core/firmware/fsp.rs    |  42 ++
 drivers/gpu/nova-core/firmware/gsp.rs    | 128 ++---
 drivers/gpu/nova-core/fsp.rs             | 617 +++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs             |  64 ++-
 drivers/gpu/nova-core/gsp/boot.rs        | 342 ++++++++++---
 drivers/gpu/nova-core/gsp/commands.rs    |   8 +-
 drivers/gpu/nova-core/gsp/fw.rs          |  55 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs |  32 +-
 drivers/gpu/nova-core/nova_core.rs       |   1 +
 drivers/gpu/nova-core/num.rs             |  10 +
 drivers/gpu/nova-core/regs.rs            |  59 +++
 18 files changed, 1642 insertions(+), 248 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp.rs


base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
-- 
2.52.0

