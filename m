Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62DC9DD9A
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86A910E717;
	Wed,  3 Dec 2025 05:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gA4FpsaL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354BD10E71A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KH4LkL9u93stiWAA64fiarjGkod0G/Gl0bL2QiVRKYy6LPnU48aHdOiTM3XZn1ivtr4tw8p4WKCcxbYv/lujPcqB7dh17GxtM5s0SHsDxPuOeH4uN3w/TT9CSVYz7Na5ZLkhS1FmskpvEhHia6kwAtYSuA57n9+OKArEXbx3VEt4AYVYoA0TvSXIAftuTxjmjcTQ1wLzZcO4wY6JBsMdG6XkjFRQal00M0yXLdk6C5QXKL9h9G+lWtmD9rZ67z/11Nzu1wXDzw662vS+J2xG9pxtnP1Qvgl7VrA+HJtXlmhcY93jduKy0btwZERg+oIi5nOFzPxT+fdQMnPPFyAbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/ul55Maj6UWzxDJTtNaKdK0nSHIJLttEGZ3jIut4lM=;
 b=oOEqtfMKtv94zHNOSkxgEHUnygF7QXDGGayCeEYbBpCmngV80bywEepHi4rfPsXnR8O/4u8ftofVnRlzszYxaNsIEcaJ1W9soK8OvPUQiJR8Q7NWprmLiRARdWAxk+oL5a+y9PaKcAd/fBRsLOWPODnVPSLnn7SURJAFZrSkpsTi/2y62q0Z9OF1KERm8jjGFeVCpgP4UE7V4uHFmQt3zyigR55kzWC6OqWBYxhDvZhIFQTb2Vh/8sqK08mXscsV+7WYMo5CLmbyiIEIc89Rc9WATx3vezXtHawYNefhcwOgB1Ts+TB7ODPAOQqSWRTXsM9eE1IjLgHRITtd4P3hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/ul55Maj6UWzxDJTtNaKdK0nSHIJLttEGZ3jIut4lM=;
 b=gA4FpsaLAT1PNf7aqIlh0PlELwXyXgClpBjJPvFBoHtRueG/UxswgSBFQWho4dIsfhu+WRhjQxF8X0B/WMXSeXPPI3MZuaFNFDWmsIuJ4UeFwEqqtl1p5jGpIrpMTv8/73/w6ZJcITFDip5SCRDEscoKBbU2aUal1yVNl/oKMJ9Of2WchNkyFifLaI4NwCxqafPHouPZdf6VrZQAJFF4AqAtN/8S9NZMCx+nGCNA5i8ctilUxVI4GBfH1HnQVPL+Quy+4RHzKTiaILJj9bYDk4Lq26NyVeED0A8yEQVRF1NMpW0hU3PMF5lSQMnHNMbZqqCZxnBgW89RUFAPzM5HZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:52 +0000
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
Subject: [PATCH 19/31] gpu: nova-core: Hopper/Blackwell: add FSP secure boot
 completion waiting
Date: Tue,  2 Dec 2025 21:59:11 -0800
Message-ID: <20251203055923.1247681-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b1771e-335d-45d4-136d-08de32312cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QVrC+a+XDxKqHV/VobpQ+bSk+q+MuHi+gixwRM7H9pzibGhSgcLAb+RdcCN0?=
 =?us-ascii?Q?DR9ObnW8NO883y91mOMOLlQc6Lqp8sVaC6VI/ALawS5oXosKA2jVT/v4T0pN?=
 =?us-ascii?Q?qBto4cxTDL/u3CUcb47eZNGBTWNSz4nWHyMnuPXny8YcnjKUjyR5eFEepagS?=
 =?us-ascii?Q?15lxJExP9Sbbpj3nvzDiRFiA/J86lWG0xPw5KmqqEFTDbCDfbwIug+IUv2D4?=
 =?us-ascii?Q?fq8tD0RNqXJeM3ZPsrfp7GYnejFFveEiNWuYfLC/CIZ9nWpYkxggGwx29RPC?=
 =?us-ascii?Q?eDxiVQ+alVBF8ENrakVNqM/jbSkM3cMkUQgy3XH3oGL6ACqns1fM7Mih/QzP?=
 =?us-ascii?Q?8gKNxnMQjXyCvAFkw5Hr6i5M7owHrhIr+4GJymT2YOeaLP1kirR+TYKgFOU0?=
 =?us-ascii?Q?RHskN3/AJwDDq35vdAlnq6Pb3h8K5dCYtTfpWd1A0Gfi2DgjxI7jY2d1pRCx?=
 =?us-ascii?Q?ZkUOV1x/bGzQQ2IfuQJDY5hb5tSzAB19TGVL6jTq0q8MAj/6KAdQ9A2vvfNk?=
 =?us-ascii?Q?uENI6uznaayn8ozMntMoMQt5oq015xeOVIBLcxnH8YtrpTrUFuNUeeZiBpV8?=
 =?us-ascii?Q?XQLCSm+ZVRc+0isJRjQ4QZbQZ4/+1BqCzaTpUHjpHbF2w9x0/77TRQnUKHy8?=
 =?us-ascii?Q?DVapXYmgsjCQvXfabfZ8DxXpVM06iBFeJqD1P2vU0HjtV7zYwMnmEVquzDqY?=
 =?us-ascii?Q?pa1kd7KevT5Kdlr+X3/6IQw3D8zDHOrDDt5/HWKDRpScNB4HSU/PSkNGm+J8?=
 =?us-ascii?Q?Kov6KqjWFHEOYHL5trzazXooz8s0jAqd1ByIehmRrICc/xL5VbGqInda97am?=
 =?us-ascii?Q?6N9jAiPC1SngylvfG8b3adsFhjFipCeWUKSS617Z0EYzPturYZKCEZpAzVNj?=
 =?us-ascii?Q?kW/kxLdjwAcOfnavNY/Cy8e//lXFjMvOdmuxTtpbJnmhZL2FvTwML39q9Vh+?=
 =?us-ascii?Q?26e76hOMQOwNQQxI0CGcCz7Z9NYxLKtJAEFtj4OG5sWDZbDuWfBjXDFevxOk?=
 =?us-ascii?Q?slPnZKZWqKCMYEu2xLeVe5Jq8nZHnDTV2Xze0InJtTvQUiZ08QPIXM2S1HeT?=
 =?us-ascii?Q?OY1+lvJB7JAe7NNaopm5yWZW/a9/bJ1t65lAjT3lRTwn8WIqSfaMXrGOqcym?=
 =?us-ascii?Q?F0io9DfqKiBC+EW2KRdun5lj0Jdml6QktReQkUuNBjRcKl0GPUeF9FFlc44i?=
 =?us-ascii?Q?MRKalNotz2bUpKP1oERr1X8TJ/e1fzeOLQ+kgXwzYFP+ojhZZO6FMcEGus6y?=
 =?us-ascii?Q?kqI99f1C+0Y2Oj1pAbpEdR5URg2dnMz0AiBaxPNu3pKJz3XjJdDGTIxyzKS5?=
 =?us-ascii?Q?9elFB1adlEFb8opWVQKkDd9hJl7CNNCDN8d/zfu0s8nIRnf8GS6Dijlkihna?=
 =?us-ascii?Q?Xed+4hILeMzYhKmGMH4SS/tDJ+8bP+Oax5dlQnk5w141bmZzFJEXA+5qpMns?=
 =?us-ascii?Q?mCeSENe5ZHJZAAfg9XTJkntk0KAyE7We?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Re1wiAEOUpvHA7mB6wktfasNC2zxZzcv4QIgTCewEmRd7/O3vNYkgSiBqAEV?=
 =?us-ascii?Q?FjRQ0u6rnlYzHK5rUkFMEX2VAbM+tSBpMtlHYF0amVW/Cx42mlBSyZihZ7ds?=
 =?us-ascii?Q?PNqG0Psl6ByAXS5PekNRsBdFr7r2Z6U4DVakoUvH8e/J9ndY5MS6apEtWUoV?=
 =?us-ascii?Q?tY3Q3yqs78jYmgoyoMVG9gzcY4Nf8JCLJ4/EMZ3GigsW4kcN4BAtzUS/bnP+?=
 =?us-ascii?Q?QIeeXyAylY5dpDNrFsQyEcahM6/xg+J/SktAUn9opfOylLG6Odaj3ZdjClyT?=
 =?us-ascii?Q?6ZNzByanfkc02uZ8ywMuoIUmimPFEgJMo+89D9Kx6oKttRABhkc9iFUt5dle?=
 =?us-ascii?Q?oAg82fuFd8WxqP5ij0M+/Ycx1u2Q2XY6QOFqZraiqRzNV4lURtloERIB7rau?=
 =?us-ascii?Q?6z8Hu5ByRKeYHS6vL1jVnu9sqyU5TWPsPJVsNq/bYEetdKuRXtjA3qg4s4f4?=
 =?us-ascii?Q?K4/2Wr2WsWwAAmvT7txQ76Etn/iWZamrDZsv6Sa+wbahYTnyA0w/kadyTFkH?=
 =?us-ascii?Q?2TFUUAS0atBOYWdg6ssPdfdG95DyZivfDBPbemAg3AiInE0OOP4LAErP9xJ/?=
 =?us-ascii?Q?69rKRW4fVMIbeHhKW7MaOF8AVQajQkPVGeYWtsIW/IZH2GdVSPSnI5pTLjXv?=
 =?us-ascii?Q?nd0qLol0RbuZA1UkUNgWrOSmKjoVbKTK+AJHa7EItW8lujADbooXH+BM+URM?=
 =?us-ascii?Q?clx5GFlGO35skX9yYFkIZYaKPkRGQGA006hi41EEyzyE0v17Jq4g1cSFvKIN?=
 =?us-ascii?Q?6Afnq2fEulSBWPmIag2fgWMKMu2oKE0Adz5Lr7cG8EcmzFQp0ed2Oh6Ssay9?=
 =?us-ascii?Q?Kie5qoDrvBc7FRlchKEYjgXVYJAG9g5r0bqzmIAdrQA2UMMlPa8Fab1k6vIi?=
 =?us-ascii?Q?kW+NDjBpQtkXD+tVbD93kKoGSOwlgL4KcY7K4ovlmimRAgPzq+S3wGynzIks?=
 =?us-ascii?Q?3UHvxPyAoYq2aY1dhGq0TcoV5w47uud0FoZXDglBefugDKkU9YiyqzOheIiB?=
 =?us-ascii?Q?oovwBvl2JRtn+QfSIr1BFjGwrH7YXUqAImulFYkcmwDJZEoebEAgBShb0LBZ?=
 =?us-ascii?Q?JOHx30FdGNHigwTjDTWwDjb3a5+v9W7LzVZNkxZQvLf8k0AhqRGhz/nHQ/vA?=
 =?us-ascii?Q?jmPRIm+hyZxoBENt2dQOz/qUjsPgjZlSOK/pU6gGMf/t4Suas/F6ic0xvLxJ?=
 =?us-ascii?Q?WA7w25PIewuN85OYSWFP0geaGumvfjIC2Ntf5rXC272mPWaQ9Tgk7tpaeu9V?=
 =?us-ascii?Q?XO70CEamFql0wnXRZo9L42yvenjAQUBUibzS5GxPN1cacko/1M6SK0JqIOQD?=
 =?us-ascii?Q?08E812fgZ2SazNZtxsDINDlkLbqJgoqHgR87tgYMTSM9eUuwboQk5K+vRMa4?=
 =?us-ascii?Q?2nKpjnrO9cRmJRSax1uwE+UEIguu1UItOwuCysFwfJq4UrtVI+tkvxWfLpch?=
 =?us-ascii?Q?t5ejiKfNIXcl1sr09dB4460JOWUrnkOt8bce+3HCVXwJwTAi2zePvuihmR1F?=
 =?us-ascii?Q?dYtYWK7KLS8KCbaC8INsRlSW0YYOcX+2NxoC4BPoXz3N4PTzWx+CD+LJRSFL?=
 =?us-ascii?Q?MqQO9BHpBFPjR3Xa45D14XM5jdYl3QV1brIpsJqT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b1771e-335d-45d4-136d-08de32312cf8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:52.3801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJpBzBo79H5xUyzsXD/ZBl2YnKLfMay1+GTnpbOViM7ZM/wOFGD/Wp6mKpi/YRaIChx6UOrkly+aOSGQyGbYDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 183 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 184 insertions(+)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..12529b139861
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// TODO: remove this once the code is fully functional
+#![expect(dead_code)]
+
+//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
+//!
+//! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
+//! Unlike Turing/Ampere/Ada, there is NO SEC2 (Security Engine 2) usage.
+//! FSP handles secure boot directly using FMC firmware + Chain of Trust.
+
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
+
+/// FSP secure boot completion timeout in milliseconds.
+const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
+
+/// MCTP (Management Component Transport Protocol) header values for FSP communication.
+pub(crate) mod mctp {
+    pub(super) const HEADER_SOM: u32 = 1; // Start of Message
+    pub(super) const HEADER_EOM: u32 = 1; // End of Message
+    pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
+    pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
+
+    pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
+    pub(super) const VENDOR_ID_NV: u32 = 0x10de;
+    pub(super) const NVDM_TYPE_COT: u32 = 0x14;
+    pub(super) const NVDM_TYPE_FSP_RESPONSE: u32 = 0x15;
+}
+
+/// GSP FMC boot parameters structure.
+/// This is what FSP expects to receive for booting GSP-RM.
+/// GSP FMC initialization parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspFmcInitParams {
+    /// CC initialization "registry keys"
+    regkeys: u32,
+}
+
+// SAFETY: GspFmcInitParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspFmcInitParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcInitParams {}
+
+/// GSP ACR (Authenticated Code RAM) boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspAcrBootGspRmParams {
+    /// Physical memory aperture through which gspRmDescPa is accessed
+    target: u32,
+    /// Size in bytes of the GSP-RM descriptor structure
+    gsp_rm_desc_size: u32,
+    /// Physical offset in the target aperture of the GSP-RM descriptor structure
+    gsp_rm_desc_offset: u64,
+    /// Physical offset in FB to set the start of the WPR containing GSP-RM
+    wpr_carveout_offset: u64,
+    /// Size in bytes of the WPR containing GSP-RM
+    wpr_carveout_size: u32,
+    /// Whether to boot GSP-RM or GSP-Proxy through ACR
+    b_is_gsp_rm_boot: u32,
+}
+
+// SAFETY: GspAcrBootGspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspAcrBootGspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspAcrBootGspRmParams {}
+
+/// GSP RM boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspRmParams {
+    /// Physical memory aperture through which bootArgsOffset is accessed
+    target: u32,
+    /// Physical offset in the memory aperture that will be passed to GSP-RM
+    boot_args_offset: u64,
+}
+
+// SAFETY: GspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspRmParams {}
+
+/// GSP SPDM (Security Protocol and Data Model) parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspSpdmParams {
+    /// Physical Memory Aperture through which all addresses are accessed
+    target: u32,
+    /// Physical offset in the memory aperture where SPDM payload buffer is stored
+    payload_buffer_offset: u64,
+    /// Size of the above payload buffer
+    payload_buffer_size: u32,
+}
+
+// SAFETY: GspSpdmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspSpdmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspSpdmParams {}
+
+/// Complete GSP FMC boot parameters structure.
+/// This is what FSP expects to receive - NOT a raw libos address!
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct GspFmcBootParams {
+    init_params: GspFmcInitParams,
+    boot_gsp_rm_params: GspAcrBootGspRmParams,
+    gsp_rm_params: GspRmParams,
+    gsp_spdm_params: GspSpdmParams,
+}
+
+// SAFETY: GspFmcBootParams is composed of C structs with only primitive types.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcBootParams {}
+
+/// FSP interface for Hopper/Blackwell GPUs.
+pub(crate) struct Fsp;
+
+impl Fsp {
+    /// Wait for FSP secure boot completion.
+    ///
+    /// Polls the thermal scratch register until FSP signals boot completion
+    /// or timeout occurs.
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        arch: crate::gpu::Architecture,
+    ) -> Result<()> {
+        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
+
+        // Check if this architecture supports FSP thermal scratch register
+        let initial_status =
+            crate::regs::read_fsp_boot_complete_status(bar, arch).inspect_err(|_| {
+                dev_err!(
+                    dev,
+                    "FSP thermal scratch register not supported for architecture {:?}\n",
+                    arch
+                )
+            })?;
+        dev_dbg!(
+            dev,
+            "FSP initial I2CS scratch register status: {:#x}\n",
+            initial_status
+        );
+
+        read_poll_timeout(
+            || crate::regs::read_fsp_boot_complete_status(bar, arch),
+            |&status| {
+                dev_dbg!(
+                    dev,
+                    "FSP I2CS scratch register status: {:#x} (expected: {:#x})\n",
+                    status,
+                    FSP_BOOT_COMPLETE_SUCCESS
+                );
+                status == FSP_BOOT_COMPLETE_SUCCESS
+            },
+            Delta::ZERO,
+            timeout,
+        )
+        .map_err(|_| {
+            let final_status =
+                crate::regs::read_fsp_boot_complete_status(bar, arch).unwrap_or(0xDEADBEEF);
+            dev_err!(
+                dev,
+                "FSP secure boot completion timeout - final status: {:#x}\n",
+                final_status
+            );
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index b98a1c03f13d..5a8f52cebfff 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fsp;
 mod gfw;
 mod gpu;
 mod gsp;
-- 
2.52.0

