Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEEFD1EEEB
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:47 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70AFA10E605;
	Wed, 14 Jan 2026 12:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jx8jTjtu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7A08144C87;
	Wed, 14 Jan 2026 12:51:15 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395075;
 b=okZ4AjqRxGgq+J/gjaudtipCKXE8hqc+7DzUYF0qo8xXP0+IG+aFoXSvTYeJ/8T4ZPR1z
 LhiWck9GGitDdpFS+3JLNU5FPxp8ymKI/85+ZVFss6LBlYgD+Ukg8QtJJ6tx1qBh9d9lJ8M
 sOoO08bbmVCT+TkueA2M6VYBmGcSe2vNholyx54lhT4j0zrdLk9DfV3loPjvLBld80DFeHE
 OqYNzjWX3pSpW+JXUAp+6lUQUCOr2NbRP+KuQDlxLX/JR3hWeWSS26rsUqbZlDnCvCdh4hg
 4lpJzD3r9LrUG/TIxtqVqmztr872L9x5kafFuW3yX+SzKZ1viihDeuCwqUSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395075; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+FKtdhYNgcdRX9177AKew5k1JnfBuiQSaznZQp8IAew=;
 b=DVkoUVtbnYM40X8mo4pBx4jHwc1z6XeiKnYfz8Ti5KrBiqlfLKXIG7xFFBnvtWr4sl8Ys
 iJB+d/CkEkokb7DMQZCzqwp60Fz4KP1jIBA88mv1M099tMl1RwfcQ09Tbl3AtyVIC3peDPi
 R0zsEAOu59GVS4sEahGmXxqyhTw6KY7rxrhKfWFoUL659cjeqzvdkKZNEl7+mkTtsUzD74J
 g5PTj1hFM+iYvCvcmPcteRhG/m7mWT/b0eP59uGqMjADDQV4zypeKaqERtjlGzd3Jcxy1tr
 57Z0calwFUKC8LHPV0DB8GnT0rY7UXIa0xmHQknwh/AG4uQP+zGdRk466aKg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 54AFD44C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:04 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013011.outbound.protection.outlook.com
 [40.93.196.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A7CE810E566
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAn1KMtFLJ+VQIyXEjENMHMeYYTyl0iwTZbrvBJDchj0yMeqPLjP+FNbQNXBEvi79CmyjuHYKxB/ucGI6u6M5+++C0Raimp0cI4cWjNn64lBgFVEMnYlkYPJ1LjH/PGalow4NL0TQMdcLpiWRYvAuOEuKQI3xf9ntKSKQyhdmr+sl9lPAUbjF5lU47S8HF0sR2DM4UEGxnZbYAFMV+tAPkGP+S62Y9ZJ0HARn/mRvaDpY0HL3+cu5ghWyvkvHegKK23PoVo5x8esvFjV4ocX8i2IiM7+q4blEDv0F3e6y/hljT4XTv2vvXxBVLdMWhJGkeiZ3qjN6HmhoVCv3rfDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FKtdhYNgcdRX9177AKew5k1JnfBuiQSaznZQp8IAew=;
 b=MFbNervmHw2Y5TNEecY045W2MoO2zmpvOZIMI4qokroz7HuC0CSF5l2KCx/gXKhtlCxixQlk8P5r18kJ2ZP/RP5uKb325H4kNFqYnzfCx4zROVb3Sdfmkon8vkbdOSJ5QuS2F4HD2Vb2SThQnzQvBsyA6gG04KFIU/5u/VDDKQdkGT+aEZ8PEpOqg9GlaiVAvXNCCRBI3cyHT6yMfK/YF3mgyjugt1A9XtxMA0oBnFDWc1cSEJW2ukAOyzosNL8z24a6j4vmblA6k/6prLXhfwX7yDAJfqANVbc6O9xhcJNauNrDphEYEZGYu2LEVvHMKpsJIqk2ae/so4+z994KWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FKtdhYNgcdRX9177AKew5k1JnfBuiQSaznZQp8IAew=;
 b=jx8jTjtuXyJuiQxz8Dfd8gzpUIigjfqkIe2MlXX/JkEukonB15X5KeCGDnoU3CvlvsIIxo7794liurZyzF2B/Yg1LxFuQUvZnge2pOPyusYo/EPmmRpMx5NACXBKupqI7b6RgCP+yGzmc7D4Qg41EJ8kjKw4o8RsFZ/XYHoZUeU3sPs9E3KyuLZVIhYFrVqetum/LgmZoU6CppTQ7/hUWL7ctgxPdZETJIiVprN1ZHmfFtGRPRgKuRUlXWy07GTxG45P3Kz3mQO865ttIqqUzyUsKpYvCoce5WN/lwWPA7PhzsIy8QfB3dF96jebJQjl7uaufsOtpITZtFj1O/AR0w==
Received: from IA1P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::9)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 22:54:29 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::c0) by IA1P220CA0018.outlook.office365.com
 (2603:10b6:208:464::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 22:54:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:17 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:16 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via debugfs
Date: Tue, 13 Jan 2026 16:53:59 -0600
Message-ID: <20260113225408.671252-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd0648d-9fa3-4d4b-4675-08de52f6b5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZlUwdUdaMDUyNHJoOWpyM1Btd2hydHI2V2M5RVFjTkppbm5aaFJ1MmVsdGpV?=
 =?utf-8?B?VGNLL3RIL0xsWDBLQjBiUlJzTUk4TEdMUFI2aG5NeGErblBrV2poclcxZmRn?=
 =?utf-8?B?c1dpeEV4dC9Ib2tXRFZFaHQxSlk5TGpiNUtydTlJRHVwUkpGTXoyekRERUNx?=
 =?utf-8?B?Q2VhQzhTUVZtTk52SG5QRHkwaVkrL2h1UVNnc21nNHlyS0o0V1FCQTY3S0k3?=
 =?utf-8?B?OGhNbFNVcWFTa1JtdUt4aTk5TUFjSmZ1YjRKZ1hMdDZvOGE0R0IzVitwQmVn?=
 =?utf-8?B?Zm5jNHVXMDdicFJTS1MzSWNla0t0UUU0VVZPSHJPNFloS1RSUEZMeUpLb1hk?=
 =?utf-8?B?MXZBRG1sM0NmWk0yK0VDTDVFMGY1akxFaGJLUUI2eVM3SDVSQnlUZUFUQkxU?=
 =?utf-8?B?S2l5RElCdVcxcmpwWDNqK3lNUDZKRktiempCRjgxM1piNXRyZ2NxVDMvNG5w?=
 =?utf-8?B?OUJoeGgrQkJuWGNpUXBhQUtLT3FZQ2NaYkFBVHFwZHQ4Q05xZmdrbVp1ZFgy?=
 =?utf-8?B?TFMzYlN0dFFKclJySHVFanBKNTI2MmxHTkl0dFBRVUt0cWd3NTZtYkY2ck9a?=
 =?utf-8?B?N21MSXhCTTB4TXlRUjkwVWVub1I4ak01dzZOSzNUNzVjQzV0NlliaGJzWU9i?=
 =?utf-8?B?UTNYcXVhcUcycHhBLzlpbVdxcThTUHowSFlLcC9raDNla1BEcEdka21xUVlX?=
 =?utf-8?B?MWhDUEJvQktHK2xYTG5MWlBJeEJvOXcreC9rSjdad3JEbkFCdUdYRGkvem8z?=
 =?utf-8?B?M3FkV25Fek9adm5oRHlHQXpmaDFJemdIblJ0TWlUSHF4L1lKWlVRVjUrNTh2?=
 =?utf-8?B?eHMvMHlndmRuZDM1RlZZRHpJVHBFUkEwSHJWbDlLN2hPczdhVUl1SmxPVXU5?=
 =?utf-8?B?Q1ZBYmZZcEgxZ2IzQTZUblh6eDBLWks2OW9JL0xtYmJaVG0vTmliVVMyQ3dZ?=
 =?utf-8?B?UjJkWmFidXJncHVkamxHcG5EdEVCNmpkV0tPWnVyTjFST2V5YURxaDlaR0kx?=
 =?utf-8?B?OS9zSVVmV2hkWHdHNVBwYkp1aFJMRzhINU9mZ3lHRThBU2pVcjNRVDNlZHNk?=
 =?utf-8?B?NVozZHc5RmdHUU84WWdJcjRld3U5QXVua3VXM3pnMlVQVkVocG9qeXVmRGxr?=
 =?utf-8?B?WFBHeTBSa0UrSDRsMzhnekFaSkdzVEZVUHBUZGlGU3VnVzF2T0h4dDZRVWxk?=
 =?utf-8?B?NGdKRjIrRG4vMS9zc3pjblpLQ3BZV1JPSDBrTlNWVjJ3eXdSL3NDd0wwdVl3?=
 =?utf-8?B?WWhaTjJ0MHoxUzM3bis1anNPdUg3MVo4VktUNEliSnBpUUNTZytjbFZsM0Ir?=
 =?utf-8?B?SDBTeE1vY1diRERwZ09hZGRhOHpKVTd6eHRkQ1o4Y0lMZTR0NytQRzdTcVpV?=
 =?utf-8?B?ejFFYUF6SHk5UXRVSVNvcnFBWkZTVXNrYXlTdTRuSkFWMnBJU0Z2U2lPTmRi?=
 =?utf-8?B?QmFoYnRuam1PQU53ZHAramErbDhTZjNyRnF5Um51R05uNkN4THdSUE9MTjlF?=
 =?utf-8?B?Rk9mUlVHZ3BSc21VK3RLbjhCQ05rU0g4TXVJSy93V211d0dYL1VTVVluNmVB?=
 =?utf-8?B?Sm42clEyb0tzUEpJNnZOUFpxbnRYNjJuWGpvc2ltNDNoQmZ0UkRXZXFHMlpy?=
 =?utf-8?B?S2tmd2laNktjQlRsNG9zWEo4Njg1amFpeG5zU0FSejlSbUxVK3pmMWxDTUJo?=
 =?utf-8?B?NGlHaUJhT1BCOURCcWwxaVJnSHJnN2tCZXUzbTVvNGNZZjlpb0k0Q3ZGV1Jr?=
 =?utf-8?B?M2pjeGZud2F1Q2xjYktWRFVDdG5GQkk2U3JoVGQzZnhHdUFyV05qVHRCa3Ft?=
 =?utf-8?B?RjF5VlVFNmc3dFBqT0lFWG1jdEp2MVpnRlBhWGlMbXNvamNQbE0wVHRBeU5V?=
 =?utf-8?B?T3pjTDhWQWlmUHVhdlN2dUN3VDIyQWcwSWZEbHZWdnhhR00vZFI1K28wQWh1?=
 =?utf-8?B?RkpET1VNQTFMSXZoUjBDN29LRkk5OWVJYXRYK2NsdXFwWW5OVnJiVG1aVXRE?=
 =?utf-8?B?MlF5ZlJmMmhqOUJubm9VSVBnSnJpODl1UTc2cDdQWnZmdGRqYmF0aEtQTDdI?=
 =?utf-8?B?dEJKZzF6ZVlvOFRubnVXYytySTVQNjZnbTdMWHV4WWljdFN0bEtvNmxEWVlY?=
 =?utf-8?Q?u+40=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:29.4928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ffd0648d-9fa3-4d4b-4675-08de52f6b5be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BFREGTXWYXUENLCS7U5HERMXFLIB5XFW
X-Message-ID-Hash: BFREGTXWYXUENLCS7U5HERMXFLIB5XFW
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:13 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BFREGTXWYXUENLCS7U5HERMXFLIB5XFW/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GSP-RM writes its printf message to "logging buffers", which are blocks
memory allocated by the driver.  The messages are encoded, so exposing
the buffers as debugfs entries allows the buffers to be extracted and
decoded by a special application.

When the driver loads, a /sys/kernel/debug/nova_core root entry is
created.  To do this, the normal module_pci_driver! macro call is
replaced with an explicit initialization function, as this allows
that debugfs entry to be created once for all GPUs.

Then in each GPU's initialization, a subdirectory based on the PCI
BDF name is created, and the logging buffer entries are created under
that.

Note: the debugfs entry has a file size of 0, because debugfs defaults
a 0 size and the Rust abstractions do not adjust it for the same of
the object.  Nouveau makes this adjustment manually in the driver.

Changes since v3:
1. Implement a LookupDir struct instead of adding lookup methods to Dir.
2. Adds a Directory trait that is implemented by both LookupDir and Dir.
3. Creates DynParent enum to wrap both LookupDir and Dir.
4. No longer tries to "fix" Scope or scoped_dir.

Alexandre Courbot (1):
  gpu: nova-core: implement BinaryWriter for LogBuffer

Timur Tabi (8):
  rust: pci: add PCI device name method
  gpu: nova-core: Replace module_pci_driver! with explicit module init
  gpu: nova-core: use pin projection in method boot()
  rust: debugfs: implement Directory trait for Dir
  rust: debugfs: wrap Entry in an enum to prep for LookupDir
  rust: debugfs: add LookupDir
  gpu: nova-core: create debugfs root when driver loads
  gpu: nova-core: create GSP-RM logging buffers debugfs entries

 drivers/gpu/nova-core/gsp.rs       |  68 +++++++++++--
 drivers/gpu/nova-core/gsp/boot.rs  |  14 +--
 drivers/gpu/nova-core/nova_core.rs |  32 ++++++-
 rust/kernel/debugfs.rs             | 148 ++++++++++++++++++++++++++++-
 rust/kernel/debugfs/entry.rs       | 100 ++++++++++++++++++-
 rust/kernel/pci.rs                 |  37 ++++++++
 6 files changed, 377 insertions(+), 22 deletions(-)


base-commit: 654826aa4a8f25cf825ad9254f37e6cb5092098f
-- 
2.52.0

