Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D8C181D4
	for <lists+nouveau@lfdr.de>; Wed, 29 Oct 2025 04:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278E110E6DF;
	Wed, 29 Oct 2025 03:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p1PEk7Sy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4354810E0D3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Oct 2025 03:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/DLS7EYorTpVa6vE4nRQTWmLUBGQP9IH6v8lSh186JRWNr7LFZ2+ygwbD63rFdWgUP7LKe6YHcNL04xmIgC/ASnskU9lo5sEwJkUCzZAL6f3x6Ywlc4nxtCmNThVhMXKBck1cPgbaN64CQQOZSSn1VsnY66+CIB6oqWATcP4HwFi2sUrCxiHPX8dPDy0XyFKTMICeCw+CX7YfisebLpgP25YCK1hAcQGjIQre4Zi3KskxAdeoLU43yylFyBVAbLJIknI3GaG1cO+n562spQg24TM2Nlp6mCJO5EqjJNhTri3q1YWE0lGHoO1nLrBmbYxU4R6XYWcuJdhUdFobmF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdXQTrRdF5z2i2t8E9DtyWHr73zuaBuVcUMolbyne4Y=;
 b=k4j2aexyhTI3O+CpMcS75Nqp1t9+sKF0pqlmdq7OSJwlRt3spnbxKmTflnx7cGiY44wlNLImu71UKtFx2Hv3e8dscS4k6Pkn/vhH/eIDa8TkWzKrrLwnf/6BKVteDk1yDympeMFRwIktM+adM5K6AKCA8GOCSlM8ZIKd5lE2YcTAFqDlS8LgOMxulQbT0DtBFc5jsBCK9U+hTYjpdMbQm5OUORv5cvOVmgQiaKOak3yROLAjWss63YoSvhcpKiRvs+AqTEQsGJZrszXZhQhOVvUIlzgi245RnV4viudlbgwlbC85B9KIVxGtE0QdGd58/xsYjatj2woCi3s9PQspgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdXQTrRdF5z2i2t8E9DtyWHr73zuaBuVcUMolbyne4Y=;
 b=p1PEk7SyXNi2f9ryiYj6F7cHT4bxOWCJ/rOGTlw9oqbp3Eyce4243ucZEvl0YMGCBToOEsLLv7qNEsPqyGLjY+5gYeuXV2UbsyMU/W/9oQXix4yJ8fJbaXcdz9AYPYJ+f0nZMh7ysrBcSjHLtr+Y70dMAofvTeVA5BW0L/Qsh/3e3STpY/FSQHwqOsTJVHVBI8/oGJjaNB1gtWasFbtxxFQ8W1HeSq6crADb/BfVT4YLujzjzt+8Zc9QD3E/MYiAji/BuZwj1CixOIiEHUX4lwchUEEPW1Qafn3qsxu6GOFkvanbP6FWdyVNsWqMtz0h/40YKLXn644lrEIb0JoCEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 03:03:34 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 03:03:34 +0000
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
Subject: [PATCH v3 0/2] gpu: nova: add boot42 support for next-gen GPUs
Date: Tue, 28 Oct 2025 20:03:30 -0700
Message-ID: <20251029030332.514358-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: cb84b5bd-e19a-4cd9-0d85-08de1697bf4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mwcqVrwmt6mKAh/TvVkhgxh54baJ5GYovzTz8EpnCFdSSy+u0PUkOSYQWRMi?=
 =?us-ascii?Q?PL0IKQEEfF4mxbBaCY8Xc6IZXRSouTiF7/0FiUO9LTlYWGc84iNgkGgaI5RI?=
 =?us-ascii?Q?VkZa1Ytp0zLxHYY4Ny0oWYjJCZiiDatckVADRrMCpxiHbh0OFK802Qg5nYvP?=
 =?us-ascii?Q?Yvk7eahFGCQLDszZWx7yIMQSmt4tFra6NwNXFcvEWo7m1PbKE1KnAET4K9ex?=
 =?us-ascii?Q?9V38WpTXNUfXLz32+hl0wOjI7b6otvJZ+t3xq8H/5x4qBdPz7qQwHWUpMnMY?=
 =?us-ascii?Q?Ryatsunih8LOwy3DWCbt/vFpDux4yCEp2VLdZKITKyRAkcYUolVtbgpJosxb?=
 =?us-ascii?Q?4V7l0G58Y6eXwHOCPnQIfwJIW437L9UnDnBkGleV9btUEzW0YhPaH9eUad/i?=
 =?us-ascii?Q?87ZY9SYeml/HYv+WW6H6O/379Om3Hze2ZoEsyZJvnvAxoyyOQup6giN+HqiZ?=
 =?us-ascii?Q?ZR5sxmvfausWecU77BomG/OKRPbw4TbIJgBMTPNwwkBF0WYqVRmiMBwLU4Cq?=
 =?us-ascii?Q?9RqZAVHVMreDDMyUpG2Pi/wpFB+snUXgMYKKP5/BBbFvTMn7j9DpjfbRs5Gd?=
 =?us-ascii?Q?AwtycHLkQmaGvjCJ5+xjeKtmsUQSEzgX0UBkYdv7xFldudGcdNVnKZ0SZzck?=
 =?us-ascii?Q?2Dr55D7wlkbm2z4MIlUzhZxjIxMli/ObpWlckEIH42vA9AM+H/zT/Xp3+Q0z?=
 =?us-ascii?Q?RJ60i1GEXc2/4zVSiWPNGUx4BokMDtW7EIK7HQCFoAwl98Z1zdH+hS2CcEfe?=
 =?us-ascii?Q?QHFCG6FHkxNkCIWu+/x/any2gVlrIdxUDz3+fTcCHVnBLXzQUgyD3d6uGU4/?=
 =?us-ascii?Q?xS9Tr/pHazGaglZH25X/jDmBms5r9KgXvkSXaAS6u/4+O+1zpp1aw/mQGcub?=
 =?us-ascii?Q?la6u9RxSkwOGfxc5DQZHCaQAAUH0PInIhYFtPIT6gI/7w4yvI4rlc2s6qXeZ?=
 =?us-ascii?Q?lW5clNZ+mVBdNcreOaARoGLpZPwfqE/UBBgXEsgBJf31wTKQDqzSW7zLxaYG?=
 =?us-ascii?Q?ulwYb48x9shceVdhi5uaVfeh3BIGnagHl2G3J/ck3OQW5B6P40XlCu9h+4kK?=
 =?us-ascii?Q?A54GdPfqDwjX/5+NC5mZF+cj6sAoYSUP6fayItghQ9vKvkLAahZTbT58R8hJ?=
 =?us-ascii?Q?5AztmZu1474SFtjVJoPpICMNAa2WkMcG9D9O+nEKH+VLXSamX3+xJ2L0zrz8?=
 =?us-ascii?Q?AkthV0tOHACdWG1+okxnrWdn9x59GVN2MgFVhMrV7OfVr6sQkfBmAKH9jTPl?=
 =?us-ascii?Q?vaW3xJ8il82BvU5VRjthti8Gd1laehS5wlQko5l0nOhn1IroDerP6p8hXmjY?=
 =?us-ascii?Q?vaCFZOuNc1SvR4K2hGCn2Xk5HKyFceEBXDZa/sed6GNGjL82XUrq47wkWcYv?=
 =?us-ascii?Q?M3EzJwBkm295NezGD4RrdG5dccE0BlTaaAH9jYw2C/vfCzJUmppFkqTAqGc0?=
 =?us-ascii?Q?46eR/au+SJYW2r4aDvQ9whPL+CjQzKUr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gKqKPmUkZq7xGEANFi3+Mbu58JfpUJV1wI2AYqRVpsXljyLYAnIA7S7mVc+J?=
 =?us-ascii?Q?8tYa0+dK3XBX8QTeoT1Y1b8ORR/Ev+A2ztbVBaQL0SE46xhCrFOJosugvPNg?=
 =?us-ascii?Q?+nqbX/REnIu94vOP/cf+6qNw6Wljn9Yu21lRuV4VAZ5o790e9bpSTVcMaU09?=
 =?us-ascii?Q?dVFHVeHnQnes2k/DHYwyhi7zXY5g8QQ4mqhqQXt2+Qu3bweyTLiXCOw657h0?=
 =?us-ascii?Q?JnfWCi1wIwTJBCQNh1fptEdwFzO2mofrH2izIbpdwnXO0SJS3jRlv0pyKaO/?=
 =?us-ascii?Q?bJcgk+pBs9uavkK1OSmY2IcaboNKhMZiXx2qQXQ0vG45h3b5AsBUWlYER/W/?=
 =?us-ascii?Q?7Y1JSGCoENYDYWTo6CK7/GXZRkCa2TS+3k1pJwhlcmQriqZUI3USvs7BT+CW?=
 =?us-ascii?Q?+cEqTEZgEJ/aJp1yb9o00AcvkmQ0K0KbUbG8Ug9K3CdIXrT91BjiczhaTfMT?=
 =?us-ascii?Q?3dXFyZJbruMxDf6OMkniio8p1piyvetBFSWgpZG1AwemOVccQOzXbbRahNWj?=
 =?us-ascii?Q?UVrazALhPmoipWJ9VXtQkHxJ6HSs64aVka+6sbP3Cb0gi1TWEIj0dUQsIiyQ?=
 =?us-ascii?Q?3fpoUEY3J75asnHL8t/aOLN8G0y40GvDOStkhu3aDvhvZ3nYzOy7VVl/xL6A?=
 =?us-ascii?Q?lZXBnusNI2iwZYOQiSWCLD4ppaR+rkLQkdSzKz7y//oFa6P+qcFQ+GpVpF4U?=
 =?us-ascii?Q?ME7Q5+Fs+aVTWv2aXcOkqaX9MqO5bZoUCc0az/55hf3t3LHh1E3LgrwvRB+e?=
 =?us-ascii?Q?vgKvSy3wtbC6zIDo5vb3T0wTZ+z9+NinK1L9v+B9t2LeLjDt0JeYwep5HrgJ?=
 =?us-ascii?Q?2iNUVdI5I0sLOo7GU8ZX2W2ZLrSfP3OUccDBSMA3xvgcQLX0rAukB9HYR4ME?=
 =?us-ascii?Q?pOUGwRKn7kCmKzRiBJPNk8RGNH9FCxffw8NA4kCXPZr7SQ46eOy/h/5IGUtS?=
 =?us-ascii?Q?yrQ9R5yQFt2JfKY7/SckWIubaUd1ijzKLJbyslHCorrgLY93pSNVh19QuGLa?=
 =?us-ascii?Q?QCYA3LKT0x/7C+Sj5ZFffIwOJWjV7FjhKA3QbwGUVIyYWoS0MHArLgSACgwA?=
 =?us-ascii?Q?ed0zA+7oBYSd00y/P0dC5ASSOr7SBepoOOvDZwAufOb+x5hSwZbh2n8y9pZB?=
 =?us-ascii?Q?sgNw2D0aqP3t9hleQ+fO1BaHxndflFE2hlTrJ30T5eFnGPyqJhVLEJ2rMlJ/?=
 =?us-ascii?Q?2xl1fpYJqkI6XO7k/6+eSXPG4a5jEnlRu8Zch6MQNDnjqpbJvnLS7WSo74rW?=
 =?us-ascii?Q?NHdsw627XwW5W8p7lXYd7+OrEmatmovq3zjP7ZTDCXyNY4H6/LOBB/gQ4hSg?=
 =?us-ascii?Q?1njuV6MoqGrljNx0A3Ukh7TrHM0V6CJFwHWGjXHqoKk5JjqcP5oZAEk3QJBy?=
 =?us-ascii?Q?0xiRmqIMGN6Dn5YwZny7l2SAxsvIRHbAQB7IM3n8I053KGtsW/aYDLafMQeR?=
 =?us-ascii?Q?0JtnhC68MwEIWSS8bpO144ntJt/FhvDLBblfJ6CTpWC89Ohs4ZL+oTofMnCu?=
 =?us-ascii?Q?sQ3siFw+g/o5v3tilI5ZPZWZMUCb2tCPUEkCtrZkaoC9fl5eFq6hRuze4KUT?=
 =?us-ascii?Q?aT0KG7i2BNK2Ffw7n/dX1AJc1bIWa6/RPRzuEgeZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb84b5bd-e19a-4cd9-0d85-08de1697bf4b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:03:34.0086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiAQUrcRop6COlBmWp55jd2HWXRnGxOg+y74v5PQ6FJxNARIVAlCkRyf23UBrGbffNBBZkf0C445NnkIWL5Bsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263
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

v1 cover letter:

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will be zeroed out.

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

John Hubbard (2):
  gpu: nova-core: prepare Spec and Revision types for boot0/boot42
  gpu: nova-core: add boot42 support for next-gen GPUs

 drivers/gpu/nova-core/gpu.rs  | 94 ++++++++++++++++++++++++++++-------
 drivers/gpu/nova-core/regs.rs | 27 ++++++++++
 2 files changed, 103 insertions(+), 18 deletions(-)


base-commit: ca16b15e78f4dee1631c0a68693f5e7d9b3bb3ec
-- 
2.51.2

