Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59BAD1EF06
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:57 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7791D10E62C;
	Wed, 14 Jan 2026 12:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jUf0SlML";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 833DF44CAF;
	Wed, 14 Jan 2026 12:51:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395083;
 b=VVDresK95ERm80HYowSK2IMLj7VBUzsZDWvwEcZVSXZcFb8szYHJeL8k2g/wqt+5f3ZfM
 aTpnhBrFJ3jDsMA5z93V0w2AMlFLCgWu1zXXRMYTLZOA7dPGU11ak6Z0Nr/m5ekXM7Grzpi
 PM7yP7MA5NZWCiljWYtVdv7R3ymhYILZ7VRlLSbC4jsdb/haJra/HrtlunQMqzKb0m5PJ04
 kpnjpyBD1ujP6brrFlfRb/1mc1aLNQ6p+/wHB1dBYcjJ0oW893M8JPZaFC6QIkhYs77LX7Z
 LG/dO94nyddRv11xUz5xVbkOWwtzJwNpbNApYEsYjhXJHtJQr3Wyn4S/wAzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395083; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7Q6nXBr+qpa4Zr1TE+KhsDJYh3Ux9PtfiPiF6bOf6GY=;
 b=QfKAPNSLqghVrBnonyDCCGPhFmWOR/8v7FZk/NduO2hSup3mZRbk30Nw62f1SGljTv7Wp
 J3W9EpR7d/UlMt8Yz9NYamo37esNzlx73O+hOfHky6ihEDTPqDlRgHTsRa/8y/JjVvWquYr
 xeMEscJcLv0rZR3HYhwzSRb+MqGQRPnTRjX7OFq9jJ7oHpNbG/NQ8TqXLw9yv335Wfg2rtO
 G4hWZLS8gf9HSNb8cRujAygqx7zaHwXJP09J8iG65AEGwLgD3z4WN0l155EqGHNeo37DnsR
 A1/Tp5z24BrNpjeiO2YfbdaCUJtJMq+/FF5AcWPK9BCn2VKo8AhbW4IEPd7g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5536244C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:15 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013017.outbound.protection.outlook.com
 [40.93.196.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B580C10E29A
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvbvfWkSm57wPOMybgSPyc7/lCgvf1XCYEYZkNMP6L6JSNuc9MXlp012Pf4isVlgZeHV6fGMf54x7kNIeTBZ5+d4MleIy4i449Fi596dfs9btP7CRoCShlwfpFrrNOqTRwvkKMtyrJr2Zy8faDdNT+afO2Gs3dov3+aIa87Aq4ietwL4MbOBxfhE9QsNAsF6NBbjfagpb6tiaxwpoOQ4V4G+7t7IS2wdq5SOLS0vYpivPDsjpeFe9j+P3KeUHL1LqeD7BwpRbFCYSZTm4G6TsSPsew/NkfxVAiqKWZFEHTSPseXDzVZN6N4SH21OYxEKEHQC08uDA8EKsIKz6/Kjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Q6nXBr+qpa4Zr1TE+KhsDJYh3Ux9PtfiPiF6bOf6GY=;
 b=HZBwy4bZnZnwCwPT7d3oI4+1ekMykEVIv6xw1W31iR3z6DS2mgNGcI3ozsyPo13oYwwfH93W3RBh2V7vgRBf+zW8Wp70O/sMJhLE0FdxfmjQc+GWVVH8Y91/EzrtdEtPUxjNWpx5tRtdYGUZaFrr0SjPOmNKh/wUWL7bBnEfj4Y6xBJL9NKbIaVJhBWxPpnc48Uk8UNc5Iy7cviNvycLvoBoj/l6gL0cg4DLsh+ICqN6ivS44crjlGgdg2boSy6GNboCmgepm17vmn0SAyrYAUtZAOEbfM/uTPl3q/6mAvwvLxw6vUZO3kcRA37CH8poPh3ldajPiK5FX2kOcTPI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Q6nXBr+qpa4Zr1TE+KhsDJYh3Ux9PtfiPiF6bOf6GY=;
 b=jUf0SlMLIcrsqVeD7AebqpbEzRSalhp6elJwnpUSWsM4WOV9KX80MaM2q/1Hfan9LwnqWych6YYYBHol9O3khBEHvPjlkmLXBtZWiAMpFcRZyHTH7EUOHeZDZETiIyCEtC7BPUXlZD/rwRQNFvCGeFBqv2OPNO7vkcTpbZIMCM6ftath6dNr/PZt8pt0D+ovlnsGUdGKMRXiVJqVam+wah1lE+ZSuRSDUzZ/tMyY1OFOGADbCXUiMzolV6bpjoyBp1rqxilLBjCEEF2mZnAQD5ilO24Y+H96e9BcrII/LiWTqTOhxv2aIoBACNklOBJ9Bwd53zTS7wUObfojpKLbJQ==
Received: from CY5PR19CA0011.namprd19.prod.outlook.com (2603:10b6:930:15::13)
 by LV0PR12MB999093.namprd12.prod.outlook.com (2603:10b6:408:32e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:54:39 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:930:15:cafe::81) by CY5PR19CA0011.outlook.office365.com
 (2603:10b6:930:15::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 22:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:24 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:23 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 7/9] rust: debugfs: add LookupDir
Date: Tue, 13 Jan 2026 16:54:06 -0600
Message-ID: <20260113225408.671252-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|LV0PR12MB999093:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc2e587-97fa-4b93-21f3-08de52f6bb3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFNBRittMXFpYzFvNWpja2Zpc3ZSR1BjKzJLL3plUDVvY1FvY1hDeG82WGFE?=
 =?utf-8?B?SFhReHNUcG82d2tUVU9TT0RUVGo5czFYWTN2a0NOZStLSlQrUEhhdjVaYWMy?=
 =?utf-8?B?YjgvQzI5V0lnUWxSREoxWFJ1dUpXS3IvQ1NxdS9YYjE3bVJlbDdRR0x4aVpo?=
 =?utf-8?B?a1pNMlVlUmZaLzk5UnZXc0RDYVlZYWtOVy9vWFNNaHJPUkQ4TGlXQTlwSTRW?=
 =?utf-8?B?b0JXMW15Zk1QU01iZVNDZ3RtMytBYWkzUHRLZjBKQzgyZ2ZPdGFEVktSVzNB?=
 =?utf-8?B?ZFlGbFRqY1QyYkdGQ0hwMm9hbG1LZE1PYTQ0cFdISWJUQk5qQWtlTSs3L3Zw?=
 =?utf-8?B?STlUa2h0akpUa3Z0K2VXZ2xYT0RSRy9SdUxOQXRGdEpsS2dVL08vS0hHRFI4?=
 =?utf-8?B?eEJyK0lRSC9HMHdydXRxYzJIVmlHNG14cWtYR2RYeFlaWHBETG1vUmxZbENF?=
 =?utf-8?B?a1ExNzZITGRNKy9yL3JNV3AzTzgyZGNZbEsraHdKYzhXUEhBWTU4TTk3aGVJ?=
 =?utf-8?B?Nnhvd05Wd2txcUMwYmVaZ05RUG91WjZwL1gzRmgxUm5jdUdKTmhiRDg3djJK?=
 =?utf-8?B?aTNkcjlybTRLTzNWdThlTVFPNm9IcGZ2dzBTUUh0R09QZUl0NEx2cW04Q0hq?=
 =?utf-8?B?K1pSMXNhSFNlUC82czk2WDJNVWVHdndMY094Ri9TeXpFKzhIOVIzNW1lZ2Qw?=
 =?utf-8?B?aUhjS1ZZeTRzTkltMEZpZHltSVZ5dEZ4QkJ1ZHZjSlNleWxFRmlVUEt6K0c3?=
 =?utf-8?B?Wk5XN2VtVFlWMzZkcGFBd3pCSlpDMHZpZjN4Qy91L1RqK2JjQk9UOU1oUDVZ?=
 =?utf-8?B?L3pZTkNaUEdkWU1SeStEeXNyVjZVai9UclVJK3JuMTZPZGFWZ056MHhDZHp1?=
 =?utf-8?B?VEZPM0c4WmNWSFlDU1Y5azEyTkVpakFZRnNlMi9WajdONXk4N0k1K3J2TmdD?=
 =?utf-8?B?akw1WVM0S2Fyb1RyTElhT01vMk5uemtLR3N5M243ZEg1d1MyTjRLWU5KK01r?=
 =?utf-8?B?RW9nOFNzVG42Q1A0NjdHc2hldVBPL1ZmYWkvRUtpekJHWHIyZ1ZPMzEvQzFH?=
 =?utf-8?B?czZiTnl0TWVnQU1rVUNiMUNSWTlKTVVoRzZxemNSTUpxR0dKc3NOYmRmanY4?=
 =?utf-8?B?SENLYmlxSjRZMXVWell6OSswNUMzNWtHM0dwd1Z0WEpHODRKc0RBQU05M1lS?=
 =?utf-8?B?ZGpYS2kzczlHMW14Wm1VR0VQWmtzejJ3R3dDaEdxZVprN3lCK0pickEzSWFM?=
 =?utf-8?B?UlowNHJ0bEtZTmNNUWsvalJFZGJueHlRWUx2ZjhrN2pLYlhaT3dtMzNka1lv?=
 =?utf-8?B?b0dGMC9aNTc2cklQVWVKOWlyME5LNVFzQlNPUlJHbm5CQkNnR1FiRU9wd1lz?=
 =?utf-8?B?eEZXdEZoMUg1bVBYenMrS2x2UDB3bnpWZXRVUnJLR3Q1eFRIOFFVYzJUb2Ri?=
 =?utf-8?B?UGZncWRCeWlWZ0pwU2JQaFFsNFUwN0tyd3B5eGZCV0ZMN0VyTUZwcy9pRDdI?=
 =?utf-8?B?N3RYTXJGUXJOZXNzazloN2tCbnB4cW11S0ZSZit6ZlkrNEgrbStkdjZieDdp?=
 =?utf-8?B?K0FzNGVtNjhqTklxNDBaaStmcG9FNHZrSnp2NTY1RlNucTBkUHgxVHd4R0wy?=
 =?utf-8?B?Wnp6bXV3b3E2Y1JVU1JMbGNDdER3eWVzb0o0WDQvTVN5cmJTTVhuNEUyYzhO?=
 =?utf-8?B?anJpYnRwTDZyQk15bFU4UFNLUXRTSTdGYjRLcVV1ZEpQSnRRTkw2SGNubFBP?=
 =?utf-8?B?dU1NMXNoOUZpNkZvMGhFbHB4andiWVNraXgvOEErdXlBMVlIWVZoODBMNFBj?=
 =?utf-8?B?dHBXMllscWE1cXdlYnlackZKUTVQMlNSeEp6M2RDK005NDJ1NUhyM1RDMSt0?=
 =?utf-8?B?Rit3RFJHTEVYeVFCd1lVUy9tSkNRcVc0QytIcWtiNDRDNVdzdk54S3g4YXVU?=
 =?utf-8?B?U3FQclpoYnBkU0pOVngzWVdvOGJzd3hzdldHdGdsMXlTT1hWdUZvY0ZwUzZC?=
 =?utf-8?B?dGJHN3lYN3VQK2FBZTl3cWNHRUxqMHhqbk1YcWVLZTZGSFprR2hoTmV5ZEla?=
 =?utf-8?B?dWZ6bUM0REx0bjVTSjZhK2hRWWlDT0xJRHpERUdkc1M2c0dUeWc2WjVtTlNR?=
 =?utf-8?Q?8CrI=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:38.8921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fbc2e587-97fa-4b93-21f3-08de52f6bb3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999093
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: IWANQLB75WEHHCFXD4ON2OGRVUANNRJF
X-Message-ID-Hash: IWANQLB75WEHHCFXD4ON2OGRVUANNRJF
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IWANQLB75WEHHCFXD4ON2OGRVUANNRJF/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-8-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add `LookupDir`, a non-owning handle to an existing DebugFS directory.
Unlike `Dir`, which creates a new directory and removes it on drop,
`LookupDir` looks up an existing directory and only releases the
reference when dropped—the directory itself remains in the filesystem.

This is useful when a driver needs to add files to a directory created
by another part of the system without taking ownership of that
directory.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/debugfs.rs       | 127 +++++++++++++++++++++++++++++++++++
 rust/kernel/debugfs/entry.rs |  84 +++++++++++++++++++++++
 2 files changed, 211 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index ed740eb90fc9..2ff70d72240c 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -34,6 +34,8 @@
 mod entry;
 #[cfg(CONFIG_DEBUG_FS)]
 use entry::Entry;
+#[cfg(CONFIG_DEBUG_FS)]
+use entry::LookupEntry;
 
 /// Trait for DebugFS directory operations.
 ///
@@ -393,6 +395,131 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
     }
 }
 
+/// Non-owning handle to an existing DebugFS directory.
+///
+/// Unlike [`Dir`], a [`LookupDir`] does not create a new directory. Instead, it looks up an
+/// existing directory in the DebugFS filesystem. When dropped, the directory is **not** removed
+/// from the filesystem - only the reference is released.
+///
+/// This is useful when you want to add files to an existing directory created by another part
+/// of the system without taking ownership of that directory.
+#[derive(Clone)]
+pub struct LookupDir(#[cfg(CONFIG_DEBUG_FS)] Option<Arc<LookupEntry>>);
+
+impl LookupDir {
+    /// Looks up an existing directory in DebugFS.
+    ///
+    /// If `parent` is [`None`], the lookup is performed from the root of the debugfs filesystem.
+    ///
+    /// Returns [`Some(LookupDir)`] if the directory exists, [`None`] otherwise.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::LookupDir;
+    /// // Look up a top-level directory
+    /// if let Some(dir) = LookupDir::lookup(c_str!("existing_dir"), None) {
+    ///     // Use the directory...
+    /// }
+    /// // When `dir` is dropped, the directory is NOT removed.
+    /// ```
+    pub fn lookup(name: &CStr, parent: Option<&LookupDir>) -> Option<Self> {
+        #[cfg(CONFIG_DEBUG_FS)]
+        {
+            let parent_entry = match parent {
+                Some(LookupDir(None)) => return None,
+                Some(LookupDir(Some(entry))) => Some(entry.clone()),
+                None => None,
+            };
+            let entry = LookupEntry::lookup(name, parent_entry)?;
+            Some(Self(Arc::new(entry, GFP_KERNEL).ok()))
+        }
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        None
+    }
+
+    // While this function is safe, it is intentionally not public because it's a bit of a
+    // footgun.
+    //
+    // Unless you also extract the `entry` later and schedule it for `Drop` at the appropriate
+    // time, a `ScopedDir` with a `LookupDir` parent will never be deleted.
+    fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static> {
+        #[cfg(CONFIG_DEBUG_FS)]
+        {
+            let parent_entry = match &self.0 {
+                None => return ScopedDir::empty(),
+                Some(entry) => entry.clone(),
+            };
+            ScopedDir {
+                entry: ManuallyDrop::new(Entry::dynamic_dir_with_lookup_parent(name, parent_entry)),
+                _phantom: PhantomData,
+            }
+        }
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        ScopedDir::empty()
+    }
+
+    /// Creates a new scope, which is a directory associated with some data `T`.
+    ///
+    /// The created directory will be a subdirectory of `self`. The `init` closure is called to
+    /// populate the directory with files and subdirectories. These files can reference the data
+    /// stored in the scope.
+    ///
+    /// The entire directory tree created within the scope will be removed when the returned
+    /// `Scope` handle is dropped.
+    ///
+    /// Note: Unlike [`Dir::scope`], this method consumes `self` because the parent entry
+    /// is kept alive by the created scope via [`DynParent`], not by the `LookupDir` handle.
+    pub fn scope<'a, T: 'a, E: 'a, F>(
+        self,
+        data: impl PinInit<T, E> + 'a,
+        name: &'a CStr,
+        init: F,
+    ) -> impl PinInit<Scope<T>, E> + 'a
+    where
+        F: for<'data, 'dir> FnOnce(&'data T, &'dir ScopedDir<'data, 'dir>) + 'a,
+    {
+        Scope::new(data, move |data| {
+            let scoped = self.scoped_dir(name);
+            init(data, &scoped);
+            scoped.into_entry()
+        })
+    }
+}
+
+impl Directory for LookupDir {
+    /// Looks up an existing directory at the DebugFS root.
+    ///
+    /// Note: Unlike [`Dir::new`], this will return an empty handle if the directory
+    /// does not exist, rather than creating it.
+    fn new(name: &CStr) -> Self {
+        Self::lookup(name, None).unwrap_or_else(|| {
+            #[cfg(CONFIG_DEBUG_FS)]
+            {
+                Self(None)
+            }
+            #[cfg(not(CONFIG_DEBUG_FS))]
+            Self()
+        })
+    }
+
+    /// Looks up a subdirectory within this directory.
+    ///
+    /// Note: Unlike [`Dir::subdir`], this will return an empty handle if the subdirectory
+    /// does not exist, rather than creating it.
+    fn subdir(&self, name: &CStr) -> Self {
+        Self::lookup(name, Some(self)).unwrap_or_else(|| {
+            #[cfg(CONFIG_DEBUG_FS)]
+            {
+                Self(None)
+            }
+            #[cfg(not(CONFIG_DEBUG_FS))]
+            Self()
+        })
+    }
+}
+
 #[pin_data]
 /// Handle to a DebugFS scope, which ensures that attached `data` will outlive the DebugFS entry
 /// without moving.
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index 3152e4f96219..1e8a5cedf69d 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -15,6 +15,8 @@
 pub(crate) enum DynParent {
     /// Parent is an owned `Entry` (will be removed on drop).
     Entry(Arc<Entry<'static>>),
+    /// Parent is a looked-up `LookupEntry` (will NOT be removed on drop).
+    LookupEntry(Arc<LookupEntry>),
 }
 
 /// Owning handle to a DebugFS entry.
@@ -56,6 +58,24 @@ pub(crate) fn dynamic_dir(name: &CStr, parent: Option<Arc<Self>>) -> Self {
         }
     }
 
+    /// Creates a new directory entry with a `LookupEntry` as parent.
+    ///
+    /// The parent is kept alive via `Arc` reference counting. When this `Entry` is dropped,
+    /// the created directory will be removed, but the parent `LookupEntry` will only have
+    /// its reference count decremented.
+    pub(crate) fn dynamic_dir_with_lookup_parent(name: &CStr, parent: Arc<LookupEntry>) -> Self {
+        // SAFETY: The invariants of this function's arguments ensure the safety of this call.
+        // * `name` is a valid C string by the invariants of `&CStr`.
+        // * `parent.as_ptr()` is a pointer to a valid `dentry` by the invariants of `LookupEntry`.
+        let entry = unsafe { bindings::debugfs_create_dir(name.as_char_ptr(), parent.as_ptr()) };
+
+        Entry {
+            entry,
+            _parent: Some(DynParent::LookupEntry(parent)),
+            _phantom: PhantomData,
+        }
+    }
+
     /// # Safety
     ///
     /// * `data` must outlive the returned `Entry`.
@@ -172,3 +192,67 @@ fn drop(&mut self) {
         unsafe { bindings::debugfs_remove(self.as_ptr()) }
     }
 }
+
+/// Non-owning handle to a DebugFS entry obtained via lookup.
+///
+/// Unlike [`Entry`], dropping a [`LookupEntry`] does not remove the directory from the
+/// filesystem. It only releases the reference obtained via `debugfs_lookup`.
+///
+/// # Invariants
+///
+/// The wrapped pointer will always be `NULL` or a valid DebugFS `dentry` obtained via
+/// `debugfs_lookup`.
+pub(crate) struct LookupEntry {
+    entry: *mut bindings::dentry,
+    // If we were created with an owning parent, this is the keep-alive
+    _parent: Option<Arc<LookupEntry>>,
+}
+
+// SAFETY: [`LookupEntry`] is just a `dentry` under the hood, which the API promises can be
+// transferred between threads.
+unsafe impl Send for LookupEntry {}
+
+// SAFETY: All the C functions we call on the `dentry` pointer are threadsafe.
+unsafe impl Sync for LookupEntry {}
+
+impl LookupEntry {
+    /// Looks up an existing directory in DebugFS.
+    ///
+    /// Returns `Some(LookupEntry)` if the directory exists, `None` otherwise.
+    pub(crate) fn lookup(name: &CStr, parent: Option<Arc<Self>>) -> Option<Self> {
+        let parent_ptr = match &parent {
+            Some(entry) => entry.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY: The invariants of this function's arguments ensure the safety of this call.
+        // * `name` is a valid C string by the invariants of `&CStr`.
+        // * `parent_ptr` is either `NULL` (if `parent` is `None`), or a pointer to a valid
+        //   `dentry` by our invariant. `debugfs_lookup` handles `NULL` pointers correctly
+        //   (searches from debugfs root).
+        let entry = unsafe { bindings::debugfs_lookup(name.as_char_ptr(), parent_ptr) };
+
+        if entry.is_null() {
+            None
+        } else {
+            Some(LookupEntry {
+                entry,
+                _parent: parent,
+            })
+        }
+    }
+
+    /// Returns the pointer representation of the DebugFS directory.
+    pub(crate) fn as_ptr(&self) -> *mut bindings::dentry {
+        self.entry
+    }
+}
+
+impl Drop for LookupEntry {
+    fn drop(&mut self) {
+        if !self.entry.is_null() {
+            // SAFETY: `dput` decrements the reference count on a dentry. The pointer is valid
+            // because it was obtained via `debugfs_lookup` which increments the reference count.
+            unsafe { bindings::dput(self.entry) }
+        }
+    }
+}
-- 
2.52.0

