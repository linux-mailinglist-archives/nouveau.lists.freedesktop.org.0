Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEAED1EF09
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:58 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3328210E638;
	Wed, 14 Jan 2026 12:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mpew96rF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2EFB544CB1;
	Wed, 14 Jan 2026 12:51:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395085;
 b=rmCfbzTQq+a2c+7DycHqlnh69BtvfKfI6B//d//1Nt1b7dvj9NiYKwY/d8wiC2wM0esEP
 PSLAT4mMWRdJzdHsabKVSnKCoISkfWfwTOKEK4IvrR/E1OVOCF+24w51XTuzRakUKnnk9fI
 XmXlTqbOHxsGlUCbfA68ICoQT3KlcfLPMS7itBYfQpR9DIMtrGYdHEd+mDxQZENkeqB+onG
 BSpK9AobgRd+5o8TxFztUz56t7QZqgXLeDC25JnNDmxY8Jw/1zPHEESEX6lKTvroh6wpHsJ
 UxzmMZ78bNwD3UQ1cWA6X7SxX+36IxzaA9/3G1Pbgpy6pJygkrIqsSf8FPcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395085; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TJPP276D+BJwY6hUAXttybmxn/4m73DmNrVx2FjRjLw=;
 b=SdjsTittjOPYDZ9sAqCMI93hUsGHGA0Am4Sryslvr/0ZHgSWrZSaVfHjFOQzWIM4gynbL
 RJF+b6Yx0xIlvXCwmhUj+GKn10UCIh/X7wLEOpyBZ3qq1c/crtRhB8iXQHbOrzfuadCqIig
 RA9kdbt9OkgRDZFdDISYFIIZiQ6KqB2EnWxT3/94q0c/ooW6Tj1xFIPkG9LiVcsV+KyqEmS
 ABC2WN0dFokTZR1gWWxpP7cYiXV0RIQw3/rZTFiEkz7Ni5E1dewRXPPReCT70RQcoKGMZA1
 MjQS+G10hVwx/0U0N0vRUOR8jrUglpxIUtdPoOPs75wWATPwzbpdMIn6JPPA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 054EA44C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:17 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6352810E29A
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0WqwPP2KDTXJu/k7HxhV5K4pp/O97rleC5o3HVPQKYMa9fNyDmg/h7IFBPTg2tEXBXxGp4Pfh99JLpi83LfLbi7/gO0i7lpAPGC7kIrhali8Ec9zPla/wqJtafj3QO51FEXidvKFhjcC0v28+kGUbYFreQDN3gQfRqABkuikmcVTeuXooxzy2KRyrH/yqzciisGs/r5Mx9te3LcfEyYwVK1dnx9uJUtFFWsHJ6GKG9kHhVGxXiLK5APi0QYu0PaCgGjrzeDQYHNKvuQ4N+JF7Y91OgsKnybA48jU8H+lS0bqD6umEKocdj5AN5K/JjXRgDdUg0A2fTWZFRqdS7HUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJPP276D+BJwY6hUAXttybmxn/4m73DmNrVx2FjRjLw=;
 b=K//FAnRPRXs55riOzFFdwxTcNUk/e7eEjrPolCIxdojQ8p2gVI+DszbvfOjAtAzEXCa7z3TwM38fpISkhS+O8zwce2hjM3kIzNqr5hjZBraYouEGBDupIjQHSKaYW3VGEI6Uo+4u4Am6XYFK5crAxw3U6TJTf0XRGSdJ/wyH3Sj1oddZ6oCLeagbAcLPy1EUMK+My6Lqsu69dr2JBAZNZwn4183hmd8hiLtcxXCkk0ysOuwgDXfF50BHEPw7+K1WwmEyktp43btkTTwzw3u35JiyzzPsotq15aR4OSq9MdeAxqrpMWFd07aGYmbY9jggnIX2CNhzTj8jtTGeS3kTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJPP276D+BJwY6hUAXttybmxn/4m73DmNrVx2FjRjLw=;
 b=Mpew96rFlDzRKahtLNA4BRVaeDSWxiAH0ZjylTPShdmCm/g1xxMohQZbYMURB77YvgL362zrUzw7EZ9bb3O0l7QMZN5e9AtzRyVTryP0OgpZ3pg2yi67Bh9R9yWYg6AsuPehRNm4o1ocZ2zFZ9M+wCvbeIfY9RpyoR3AJJLBX0r6kNgZFMr6ff03yf3Y8KkeiwLVwoEGGb3eB4AavZHZKTMRV+ipaYNSMgIUsUbKqy4CiT+B3b1/SU+WMNsNh/QL/kNudbhCvMhd8qZliZYO04dWsT2pesNm4ap41fr4Qg7abQ4nNsJuaQzu8j83ThKpfT304ncQLm3da4mIHb7byQ==
Received: from PH8PR07CA0035.namprd07.prod.outlook.com (2603:10b6:510:2cf::22)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 22:54:41 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::5d) by PH8PR07CA0035.outlook.office365.com
 (2603:10b6:510:2cf::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.8 via Frontend Transport; Tue,
 13 Jan 2026 22:54:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:25 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:24 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 8/9] gpu: nova-core: create debugfs root when driver loads
Date: Tue, 13 Jan 2026 16:54:07 -0600
Message-ID: <20260113225408.671252-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 6578620c-cb17-4091-c083-08de52f6bc6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IhORNdvgZee/NF3tORdLGwDZNvE6fbquEPWN6hecV22QDyIry8L80cbf8u99?=
 =?us-ascii?Q?1W0dpJu6E564t8xNKd0N6pV1SAZzz69PSzTZQyz4RQA+1AgDaj6hFkk1yC7L?=
 =?us-ascii?Q?xh5yEcLb3/uqQCX/bS0TqF+eBIT2+oLAjNpf1l3l9Qtvk14aO/zpAdxfrY40?=
 =?us-ascii?Q?+/miffmb0dp2vUzCtwal5Gvb0w3Of2czRXgV06V7g5E4ifSB8adLkzeJ5azl?=
 =?us-ascii?Q?VWbbyIB+GQQcKnoLxjB8eYJjXJzAwSlznW0GdXnhkTN5aaifenRAKByI0Unn?=
 =?us-ascii?Q?jN+ued+4oW8HW9xkkpjRfLzzFd8o8LS+2t8TP1ke/mhSITXIsfL19QslXqEM?=
 =?us-ascii?Q?bWkqc/JgkGWXI5dHG5nkQ9QJfshDMdMVv9Bwc+x8y7Xq1hqoye1nmOZnOm20?=
 =?us-ascii?Q?0Z6+Hvjy3r10zyH4iO2XjbIyFneL95ERfTvLfIL+7kvqTGQPWhV+vc5eLkrw?=
 =?us-ascii?Q?RLngLg5rsZMrPDCp5GFeXDrzwNbYPJ1RLWqdIkbGwWnXxp6FOX9dFEAYat+x?=
 =?us-ascii?Q?nUXDBZoazBcwDwN4HeCcyqB9Deie9aTYFU6tviczOCI0Ab0abJPw3Fqd4v+j?=
 =?us-ascii?Q?r5slipTDJAkI46Le1Xteh5GCy8uh2QuBp9wrBZSBor55txB9VK0Lhyr68wKN?=
 =?us-ascii?Q?BjzVFhPf+nFprpAH3IuexEJgld1Ttk6IkzG70E6xiEefF+lB4v02/wCDegC+?=
 =?us-ascii?Q?hqCwbPgXMtrgcvjYuDqgKFfO2/5kGekdZjZbSLqj+2P1m8tx46taGrz+6nLw?=
 =?us-ascii?Q?U+P4heGQ+rO/lha9JBUzJDzsfz6tmMI/RCKAWQdw5yXBOjNlUlIJ3YvlFd5f?=
 =?us-ascii?Q?MmPk93DX8TJUlWqIBweh0XaXQtnO5JqHM5GzEa0TWrb9KZ0yQq80prAbOEuz?=
 =?us-ascii?Q?fi/dhS+pQLFG2sF8T3lIOnff/3qIOwbuiRcaVUqawYcpbg5nX2RRCGD90dsg?=
 =?us-ascii?Q?M71hI1fXGFsE/atxiOjaKGETGI9lJ62HYPOjisW3qAFAAieAV4z2UmiKjN0D?=
 =?us-ascii?Q?A3Culc+EMczVeVR3mclDXpOdIXZ/FTZUBNXHEbitk1vfz7s19hllkNp8MRdY?=
 =?us-ascii?Q?4r8s7Nlqi4PnWLdqGMM3wqIogm0TWpZ8Hl6Vg5sFMHvxs+nWqGfbjbhf4C4x?=
 =?us-ascii?Q?mBpH9VMXtpQFZR2q+2vGVs654ffPY/i9uw098WpS+Lq0IrqZGwNTzd5o858A?=
 =?us-ascii?Q?PS7ar2osBdZzPWMEscDrlzN7tFBZNrG7gbascK+0SioK/JBrrhBtfOYBQcD7?=
 =?us-ascii?Q?6cSTBbWA8ZJ/sYibnHh4Vw7WPkkwj4DPqhhCSbetednVuWwrw1x8wjk6fMpK?=
 =?us-ascii?Q?bBLDDc1JDZhxhdSI3J11AHWbDlL6v9sJka4jb93+L5DmoVEFTlCJg4FQCpqg?=
 =?us-ascii?Q?jp3Dzts4+uK4FpYrfzD/Kyern6aQSp1tDgyamhy9bdpF/cU9+6qxICy+sPGF?=
 =?us-ascii?Q?unaxpeY4ER3gdMrbntbe/thQRu7epUN29591tYjYkVpC7CivOOOKbiSndikx?=
 =?us-ascii?Q?W0pns22+AMUX8IMbyt9TYAvpBmkjYsvAtlPkqeWNRPzkp3ENjtZ6eLCqZS4f?=
 =?us-ascii?Q?k1zAzDjz69iRdbdC5As=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:40.8739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6578620c-cb17-4091-c083-08de52f6bc6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: STACW2J7T3PFYJS2SFYGIV3U7RLC2ULH
X-Message-ID-Hash: STACW2J7T3PFYJS2SFYGIV3U7RLC2ULH
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/STACW2J7T3PFYJS2SFYGIV3U7RLC2ULH/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-9-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Create the 'nova_core' root debugfs entry when the driver loads.
The Dir entry is part of the NovaCoreModule, so when the module
unloads, the NovaCoreModule object is dropped, and that drops the
_debugfs_root, which automatically deletes the debugfs file.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index d0df8db3693d..c9b93ccd6092 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,6 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
+    debugfs::{Dir, Directory},
     error::Error,
     pci,
     prelude::*,
@@ -31,12 +32,17 @@
 struct NovaCoreModule {
     #[pin]
     _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
+    _debugfs_root: Dir,
 }
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        // Create the debugfs top-level directory.  Each GPU will create a subdirectory.
+        let debugfs_root = Dir::new(kernel::c_str!("nova_core"));
+
         try_pin_init!(Self {
             _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
+            _debugfs_root: debugfs_root,
         })
     }
 }
-- 
2.52.0

