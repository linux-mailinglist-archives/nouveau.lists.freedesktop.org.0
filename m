Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DBC87B74
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9E410E4EA;
	Wed, 26 Nov 2025 01:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lRZ9zzs3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C34D10E070
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1vQxxjbMJagozZUOKtSNk1ptdTM/qBAFxD+ZU5KMHGwDRRXGtdIIXpj5ovbgSv36wFHbSFHBFaMNomv/gR72VOkWM1opmdRCZDNK3NvRruVQJVLt9vx+s52pmVRvWB0ZyIrXaveU8r4feXw2UX9mInn1cJ9AgrefTIt+wYSTi7bs72mt+d7Gs72uED/ipYxrV4sQMeapdnzx0SNrkf/xKv+hIUSW0YTDIm5AihxminfFUM1QE+XZEuDb3kKshNgdbu8cejA4SBttHDCPKqgz2Gt7+48zIOrjTArnA4eRfQ4SXoaIzOPz43FahRf8iw2aPO3UZQ2IdtCg6froKduQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vNwi10DOYcS++uY8HhZa/MIw5285JS31Rv8wMuildg=;
 b=xmT532oT7pGs48YaeOIdFo1kidNqHBlhdxYAWhDmoVLEK0N7iO0yp+10pdkAnULoE1IYimOZxa2H1fp/2tO2+cXrF/Totk4iy7Q5CvENG49TTpos/4sLknIJJfmYXivk42twMK+MTdpHsj5e7/obKrKDhkcEmxq69X/ryaSEV+rY3NW2drsRVbOlHXjwH958P2PaXGoCmP5P4OFEeGEfZYuBPsGhioJiVrFNn6RSwAy6+bLzt618DgZW8lSRauTlK2Njlg4QjcJ7NDDBj8nn5vla/onYCzRP/dVq4Y4PK0W60QKV75+T7/WWCc6lonza4A9jNnVgIFh/RBVSHWfsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vNwi10DOYcS++uY8HhZa/MIw5285JS31Rv8wMuildg=;
 b=lRZ9zzs3VJ3L3Uk2KEAFOf2NW0vrvAryjftboBVwWAKujw2ZYsx5jZCSGFLGSGeZfiu5jDlONz8NoNMPpUmoteGKqHUczzjqOjFNb9g0O/VGRG3QeB/hcxpDWCxy9kE1bOImoYxAcz6RBxT0ELVbTZdTBS2FW1WPIWqMqIPtX92s6lhbwwbqVMy4Wuv7yU8fRL8mDRzBMlREEjkp33cMym81AUEgYRptoMOs+uRcWEe29J7BgZQJqkm6ghBYygmY50tQvQ6l+7v9P24MjlT4ymIqomJLrzJ0erVcIuwYjrSpl8MrtVRq4S+tlVeqvKcd9p/BWszmnehF6LShLrq/1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 01:39:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:39:38 +0000
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
Subject: [PATCH v2 0/5] gpu: nova-core: Hopper/Blackwell prerequisites
Date: Tue, 25 Nov 2025 17:39:31 -0800
Message-ID: <20251126013936.650678-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:332::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8c5954-bb68-4ea7-4566-08de2c8ca972
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mZQusF9krwWCOjm9jPz4S62uak6FfQ2uGFac13EGmjaeybR4lRwHcHNyDUd9?=
 =?us-ascii?Q?4ZY0sd5a8WPoJUOAhD+QvuWgvigTAfoxMzvvt1op4N9FFGbQNMLFNLvlz8Qh?=
 =?us-ascii?Q?jLfMy/+/BMBcbqVweO4o32eDBE1s2geAwY4f4FxQBO1L8FJfuez9HLq8Iy9N?=
 =?us-ascii?Q?X73KStOAo1EAkAT+Vpk2L82/Wni9QOBD+K6Nx6nStfQggNOVGrPmS32a7d1y?=
 =?us-ascii?Q?kk519hlqy/hHoLI78LSjkPbos2BVAs0BoGNues9JJZ0d9xfV+l6RhzN4kSeY?=
 =?us-ascii?Q?pg69OnsIxeDtmk6etuFIPtup3N5xcnvRwFQARyPwU3b73IPhluVHTCXuyDcm?=
 =?us-ascii?Q?aY8zDeABH2eeF+JmI0a4JeeZYGBM4S7xbjkS3scR4c5LId573DAjL6jCGggy?=
 =?us-ascii?Q?w8S3mmTIuo1r0xFlw6iH7jawNDgJobokMfg3SRAE44vhFYRli4h5Go+v+KVy?=
 =?us-ascii?Q?l/KRZq28GLXHT7jxPnSDSLAf1qCE/Wuwm29IYRsjcgbzoGU4r1bZ7kBRDGWH?=
 =?us-ascii?Q?ppUQmwX2fsokKx41QfWAxXZ6bYx3lJ2b3YBITYNztzzr0B44u5y9r/oBR2zp?=
 =?us-ascii?Q?uMlagIBVMqVhl7XsoLZjCvFsCe2vk1TeIpMZ+SfOomTKxMfW+AtnPSVG1tIy?=
 =?us-ascii?Q?lY0mBFwvEjHFfK6rwJzWWodQIp/RHq5clr12zAs15pKchahcs1iNTIUufiJH?=
 =?us-ascii?Q?2Z43yqbUohUcujWMCmt5Eroae9CCcW3krWWmIs7S2d7BDsdgy6Y+4AFUTDWF?=
 =?us-ascii?Q?GE8spEIEuSitKwPFxyho7hZSF6Zu5pnUdz7UaOTsLzVU6WhO7sEIzKvJQoL1?=
 =?us-ascii?Q?RxvH9t2NvcAhp0E/QmeQpwfcpSpFWkrDUU4H9tzRN7C43u8ovTj85bzfdCZO?=
 =?us-ascii?Q?SFarTohtW+4aKf/k2V1fh9uFosPJhngTk9GCSqfEj3x4zPczBxi14W5esQev?=
 =?us-ascii?Q?zn9OJ/9qLQIF5qZgvkBgRgvSZlGqCkk5yXwv/nuxZnT7WgPbHPLOcyDXTtsy?=
 =?us-ascii?Q?Q+eDnhboz+XdjJpeTeUgBbCFE0JKZuzXCNm4opzEX5fSX386CRFR+NgGJYL5?=
 =?us-ascii?Q?0YYk7k8WXy2S03faj15Q89vFNhcGVxtfj6hP7ug1N513MmgJ9LSrkwyC1rVn?=
 =?us-ascii?Q?C8WCOvcYQpmVsyRxfmayZ0shyZosl4Aq7MewrF4rxWRN5kRV+qkapXK5ujkT?=
 =?us-ascii?Q?2oKMZ3j8dzhGED4kVRK3mHBDn/TfVYDctAoDFU03/B9s0i3Ed3O51CoaPl8o?=
 =?us-ascii?Q?4Ik1hnbUB6jn2Xl0W63na8zg+jzZHRLl2wNjWVVmus4ZUh2wbv96kKHKR41E?=
 =?us-ascii?Q?JliT7wvrQc+agglA9cE11FihaoTuF0pQhTfAqnh444lK+sxdey9wJt2pq8ZE?=
 =?us-ascii?Q?YOrUb21CL6atIgp8DpUE/J0D7Zc2fkq+lu0XuC89SCO2ayayCvAi4X2vYn4U?=
 =?us-ascii?Q?GMqXBn239NwxL1bxaE2PCjMW+ro7EIAxHetX4x4fXfa6T5jCJoHU+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6ebBVsd8IzrS8REJ0D+WgqqVTCntPy6MFwCQCyjw2hhmaE3jG1vp7lf5pPdo?=
 =?us-ascii?Q?ohy1XUFL/VAWSV80SsaznITWtFJ9bHubkBhydM/AHyUXKkU82k/IQVlmjDNp?=
 =?us-ascii?Q?M0xVY6v+OmatTDvhaHGVSsV0THtw/iSxY/mvWDttEIYzXtPRqsfQco/dUaCG?=
 =?us-ascii?Q?ANzifrRGCbkvz8p4uFiBzdJi6WB6ZAxsnCL0FoJa7lG9jLTpewNlSSPSUusz?=
 =?us-ascii?Q?FdYxfFpb6jjFssbRZ6L9RKmso/F7GE1My/bSBzSP8WQBfuB+teC+bABnD6r1?=
 =?us-ascii?Q?NzK3KnjiRJqeBhPVhKJMrSTrGE8avQ4oYalJPnDPhKLeTqPh6olNSOkxxIkZ?=
 =?us-ascii?Q?3BahHtvSeg+Wb7mpP85t/N8IxRzdYuGAe09Wc/AcZDKuJiCfGsB5ojvx9c8Y?=
 =?us-ascii?Q?IuE0it4mY+OOPP/f5VkXMGSKN+EJnHKsbW/J408dtPRZMyI/MRIRBD3KwsS5?=
 =?us-ascii?Q?Vk12XpP2pnmNevsjUUZPedA17B1VBa+OCfmejmLv9oB7RH8e1UfyprnZ4fNc?=
 =?us-ascii?Q?b7xm6k2gOd4/bNIO2/isSlLVLA4Mbl7dk6ppvA1r4v2ND0kjCPXN9wfCwGlr?=
 =?us-ascii?Q?NaDvcwL8IF8pVC94zH5TtznOVnWN/+cdtuBTs3MaX3MKZ24MRVE9+e/hSxtt?=
 =?us-ascii?Q?YsJ2ioqACVF3NdrC8kRcMR3mICPDLr6WW2umfXEGcreFSDbC7s9kROt+u5BC?=
 =?us-ascii?Q?Nc2wM3f0oPotH0xP4gDaNsUqKz146swbEi1t7HB5myNzwpfTCcK+97HB94ma?=
 =?us-ascii?Q?kfh83Ld/EajsP9+HANTBdo3IjhewCsahO9n+6F5tSH3tOe7abr3zXXfDOY8c?=
 =?us-ascii?Q?uw2dfQjuxfgciLG6ULsVHrgSt+gWcq5eSwC611+Oh1CRXQQh0C15M+3xbgms?=
 =?us-ascii?Q?eyBQXRvAAHAIE1A3TpP3nmhudjshWY8TlKdT9tkQ5szBOfLhniCCJbuc0kNh?=
 =?us-ascii?Q?LOMHqd1Q+PQ03Eo3GOte6id75MqoNNSm4x8LYTHAYzXpJXvwPz/er+x6jZdH?=
 =?us-ascii?Q?jKRGFFln9DKicL9ZaCcNSgnmZcBVnnn4xaKCrogtpvK4Sl09n6cMAd8cx0/f?=
 =?us-ascii?Q?BDTOFQPKF3tNfXt5F6iE25vIYCFFM7CVomKTp1P8a7hizddrxFj21p0hS3+Q?=
 =?us-ascii?Q?D7PpJpqFvMWL9xObrkjOpSqSh8vGfhriame+G1q9jyQPd8S2B37PkT6wU84X?=
 =?us-ascii?Q?kguNSMFDFGKL3HeeQyiXu+oEe9AFFu/G4XvXEbYhSDeX05/yyybbnG+J9nOT?=
 =?us-ascii?Q?pp3HLmsvBmGq4P2NFagt2q4woNyGoVn8pw1YTXlWsiB7Br7NduW+Iywc3VlO?=
 =?us-ascii?Q?mW8aeIQOhTDpSnMTBmU6i8mMxxccodWpZ6KChS6lrUPmZCuaR2jPN15djwMT?=
 =?us-ascii?Q?g5MAdbJ9tRIsYNnwtYuKKXfCf41aqICJF8O4L0fPEvLLDLY/v/7raM19Bv4D?=
 =?us-ascii?Q?DjmYWmVi+0eww92PwztUHxWcOwcLycy3rjqLRerdtRKXygWqk8BGHk5bV0Il?=
 =?us-ascii?Q?iquypg4YHVXBlDoWNh13Dch22ehvHmA0XfqAlQ4KlNBG02q9/YLNCw8PtYJj?=
 =?us-ascii?Q?c32iocIjT/YcRa68bIPhL2e/+lqdFAxsC8Uax1Sk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8c5954-bb68-4ea7-4566-08de2c8ca972
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:39:38.4688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIQRSqnRdXJa16NKPRqhONq4qwHjY+zx7YN7LM69ciqz/rvLw5SwT1agLyIFOf4J4EptBsn3YlivbGzOQKy/nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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

I'm posting this now, instead of with the upcoming full Hopper/Blackwell
series, because this includes some HAL improvements here that will
undoubtedly interact "a little bit" with Timur Tabi's Turing support
patchset [1].

Changes in v2:

0) Rebased on top of today's drm-rust-next.

1) Use a new FbRange newtype, in order to clean up the implementation of
printing ranges with sizes. (Thanks to Alex Courbot's suggestion.)

2) Combined the Hopper and Blackwell HAL additions, into a single patch,
as recommended by Timur Tabi.

3) Used a separate patch to change the "use" lines to vertical format.
That patch is already a commit in drm-rust-next, so this series builds
on top of that.

4) Dropped one patch entirely, because the boot0/boot42 commits fixed
up everything already.

As implied above, this is based on top of today's drm-rust-next. There
is also a branch, for convenience in reviewing:

https://github.com/johnhubbard/linux/tree/nova-core-blackwell-prereqs-v2

[1] https://lore.kernel.org/20251114233045.2512853-1-ttabi@nvidia.com

************************************************************************
Here's the original cover letter, edited slightly (removed the link
to the v0 series, to avoid anyone going there by mistake):

I've based these Hopper/Blackwell prerequisites on top of Joel's and
Alex's changes, and also on top of my recent boot0/boot42 changes.

This makes it easier for both Timur Tabi to post his Turing support
(which he's about ready to do), and for me to post the actual
Hopper/Blackwell support, without generating conflicts.

Testing: This works as expected on Ampere and Blackwell (bare metal),
on my local test machine.

John Hubbard (5):
  gpu: nova-core: print FB sizes, along with ranges
  gpu: nova-core: add FbRange.len() and use it in boot.rs
  gpu: nova-core: Hopper/Blackwell: basic GPU identification
  nova-core: factor .fwsignature* selection into a new
    get_gsp_sigs_section()
  gpu: nova-core: use GPU Architecture to simplify HAL selections

 drivers/gpu/nova-core/falcon/hal.rs   | 19 ++++---
 drivers/gpu/nova-core/fb.rs           | 72 ++++++++++++++++++++-------
 drivers/gpu/nova-core/fb/hal.rs       | 18 +++----
 drivers/gpu/nova-core/firmware/gsp.rs | 30 +++++++++--
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 6 files changed, 125 insertions(+), 38 deletions(-)


base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
-- 
2.52.0

