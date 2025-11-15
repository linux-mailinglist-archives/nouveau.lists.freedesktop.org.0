Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC4C5FCE6
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 02:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E7110EBB1;
	Sat, 15 Nov 2025 01:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXKTriLj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8861510EBA9
 for <nouveau@lists.freedesktop.org>; Sat, 15 Nov 2025 01:09:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohLsShd8tJq/0j/QXptujVmQ7DgZQf0P/oM6CqBVLQ4EHitf2ypwq7YznEDI5GzxKXsy+yT4w2q5z3eof/1VC1y1nRxUsgDeRXwL7skiEvfoNPJbLqsPecWbU6RfYXu8dcoviB7k34Om6LlscsbFhN+1LyCnCCc+Du3q+0/XyZ5/S9SVqS3cgiKPlL6Gpktir+DlCTt5fVYfD1E12TGGs7T6U8loWnOsdeNdbnIao8sLWunRRYdvAMrHvFhlz5s3Zm+FdQBAK2UH6z/AFxKnUAjD8WNJw8IE6GqpszcyGgCWh5i2FbPqtSHzmWM9SZrbrNCBjtCuLNcHg4Cb4yRbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHJ0NAlhhUW6X+ut3rPCiAc6VeeN3F0nLm71bNdkFOs=;
 b=sG16qOruQ4Q45x0eCXS3pdpvD4tpURCXMTyimld9Ppf3+RLM1btd9LCXH4jZ12lLKQrgSZD/IxQOo3S6Y+9901SOwj8gFHom9aWrT9ORIa1zhG4sLcbQXkeqtJViWTO2olXmSNVT8YtE1wPAhSn8J+kkXc1xvLB4MzuyDUj6/jv0JZ1+9p18Nd9veDMYomdYNEwZmUpSzDQRD4KqsfNEz2ha7Riiw7b+JzeatH0CXv1G8BpXCqGBfmOI52iuyObXGvQOdGAzv2eiNQ0T4nMO0ZGLqushWvQPLvr8iong0aM9JTWso3ClrdVKm1+tGaiWLKCFaPHcdTh1BRCeufqukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHJ0NAlhhUW6X+ut3rPCiAc6VeeN3F0nLm71bNdkFOs=;
 b=WXKTriLjSDqTdX61f7lHRbAI/n3edRAG3Tn6IpYoocXIkcLia1bdoeXYlaCxzmr3x3u45ZbnDxBJougaeQY2qD4et0A1pcY8gbLIJmqwurhBgUZvzW44kb8HRR+k3uJojCZ7YpVPRn0extsyRq7AQd8o2xJAE53b7349uXzFblxcMBlBlSnZ3I9BQ4UYgaej8F3T1wFHPUxs4pJoXPhz+AaHAYDNDKR7r/LqN1EUENou7XaZMV0piWt/YqXd5hUfvioVAq+DPbG3KjPMJlUt86msstHDTyWC3ugtRbocUQhVetbU/QJfUUGVzOPxhy+WPCD2cfzy3vGVOZ4kxu2zQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 01:09:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:09:30 +0000
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
Subject: [PATCH v9 3/4] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Fri, 14 Nov 2025 17:09:21 -0800
Message-ID: <20251115010923.1192144-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115010923.1192144-1-jhubbard@nvidia.com>
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: a55099be-f125-4cfb-3878-08de23e3a0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHxuDJc5Q18NjPQAJ/DDr2KD5UlBS++2lO98BiFqu7Ds37JXofO+uV8uE3AQ?=
 =?us-ascii?Q?f+3oyyUB+3UXPfMabmAj5bilYuI3jQrFh0rJ+MIxM5ZXQarksyEIl6aQc0sG?=
 =?us-ascii?Q?EmX3f0yGtGkcQvGXiO04ZeZcsNcntdDdXrhgQ6+idJr0v7mOr2Ehe1GkqB3Q?=
 =?us-ascii?Q?b45ERUsfuCY8SI2TVyC3xtxAkzBnOaoZuF92GyC/SqMgxIbUKqaje+pn80u6?=
 =?us-ascii?Q?gxcOHdtfD9cQXpJ8k3swqn4TMhIS08Kr7eawZEkNOlYfiM03p5OMrSAarLKN?=
 =?us-ascii?Q?n72hQ5xvxri3aLUpTyBKGcLofnTTjBXJ3yxjVf/GZhdENu311nZnHmQYDaEW?=
 =?us-ascii?Q?makPb+9ne5tU284SwLX7A16WeZvzUmgYlSMuK3bUtH3/fkjf9w2nVoNZnVz0?=
 =?us-ascii?Q?uKVOfMtMB5e87ZUqlVAoX2GdRQ3UBSYrrjF0ZAOggrxEZLeCk6CIQfiaJiS2?=
 =?us-ascii?Q?7mzJAuqyxhquUJMEznA/PKpLM7TewAmwVzwHuBtm4DWzhkv6sep4VjrcI/zS?=
 =?us-ascii?Q?tqDeiSQrSjOv7TysucrbFOaRuIRL/02Hifc5/Nb56dH5MA4hSH3M/pVTBXmZ?=
 =?us-ascii?Q?79LeHc5iqrJPwA6sN+Jlqb7EpEGzKRZdcKg6ix43R2tAePc/zPNwF5KyWauQ?=
 =?us-ascii?Q?cJvVmwOrmZuZxrDXDDs5JI9vTv28/qL7pCyYEH2sJ3MWcanP0d+2Fr9Av6cx?=
 =?us-ascii?Q?a4bPinTvWiZ1Fq8HIfy2p/5MAFs2pRH/BNN7SMa7u6m4FlzR1J3OTlubibK1?=
 =?us-ascii?Q?7xAdk2P9bOqr48TBl6L5RXCdfIEqepDxgHSYpJw6Q/Q8clWAy0/E3ms1X+uM?=
 =?us-ascii?Q?Xb+8p6Zfqr7buPcx+H26951dHj9ybhy/vqnwesW4ciZ8HaB26CfTDVltE7rJ?=
 =?us-ascii?Q?TYoXLxzZF1UhscOOgg5VPU+FJACmCMZ/Jm6rsJmIiVC63Ed4IKS5TwBFmu5R?=
 =?us-ascii?Q?4TJsY7dXcdv0QzTOeCazIA6qEtbpTdHej+vEfaC0yOaDmVss760NPaFj3U6e?=
 =?us-ascii?Q?mXO2wOEsXc8/oVo5D0pUVXS97c2rHOezg3X6FxDktqDtTnZV8obpZRr2tsZ1?=
 =?us-ascii?Q?xKgf6+AaGP3bk0jOSxSxP59obWNWvOKEtMleNMtypQXE7ZmUSf7TCS3yMfCq?=
 =?us-ascii?Q?L9a9rRq9JtaxMQ1Lr0Q+k/Oj09HhbIOqltXYGUsPlaZb0D8/d5dIv3WGmRDb?=
 =?us-ascii?Q?Fa/Kbj5HdqXCeEwVrkYGygpSE2v0FyMG6A99ERYgEGm8tNwcAevmUwfAmj73?=
 =?us-ascii?Q?HrQ0y9MmG3YaO3v0rrmUyBXr9a1Ygnl5eh+DQzS7BjmKYbOcfvg2UQqCcW55?=
 =?us-ascii?Q?pUpdaniodzQXbZ65RabFeMx9OKahsfzmr9L1sB/81DV//t9c9OTo6+np7zpI?=
 =?us-ascii?Q?WGGYKVh8lY95CB5Qeh7/sema/XbaQZnjhvjKaolxBxpIbiPtTW2/rXxC1Rq1?=
 =?us-ascii?Q?0jzYDZGQuou3kXfMv3jn8sUG2TsH36AN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PjDf+l4HwovzLGhGhNByPfjhJPs3Z1azPxXFNWrAvm2hQ9K4T+Rgb92GE3Qg?=
 =?us-ascii?Q?wVMaknxcSXGeK14GH6RQaOtBb5+zl/mH6qOphGGAvgEzkerh1tSPjZtO5+dj?=
 =?us-ascii?Q?aTfzA/+4iU6LbyG1kFk5fhbqsjxC9IzXnF/kNSnTBLNS4y2PZ9vVBTmA289m?=
 =?us-ascii?Q?3PXVrO1yi9QrHh7kROBTligtASfrlf6a9nH5/02O6/cQ/dQ+7KCuoTrz4Ezu?=
 =?us-ascii?Q?oCUd/AY2kQAk4NPNWP1aXjE0wKht77W/g6mUzIjFBACGv8RcCMphf2GFZSOo?=
 =?us-ascii?Q?rXdeggdcYTG6q+tje78VxJJ9Y6pXs6V9l78fMe+AiudQtMp4+p5QGcU5Vfam?=
 =?us-ascii?Q?GiTJw7Y+l2yUF2UlKgit7kcpBae3e/MifnFC8z0eQmANezUlUUqFYXhIACTM?=
 =?us-ascii?Q?8wrH3YDID0jVsGDuKCTAo7BnUpXme0zDw+x23lkb2SAB3JlU4x8T8es9zu+4?=
 =?us-ascii?Q?T8UODR/1GWf0HSyx/x1jyBuH17+N/XrokY8+uQoXTP27Vxqrd7rMmGf+54BX?=
 =?us-ascii?Q?qA+TfKA2hSgZ17K+6HyT0l1lpEYUWcyDFMmZwirJyYwqTtHnjldUXh3tU9p7?=
 =?us-ascii?Q?eq0me+YdWx2P3FBzLtwwfNnewY7SBBGhEZhavM7lUeo8G2Q1KNDey+kI33zp?=
 =?us-ascii?Q?Ww0q/D5SmJq8iI8eeg7S1lknZdu772sYxAAy/5z7jV6oANYYl3vTR5UqIQiS?=
 =?us-ascii?Q?z9mlczyg71CLHmXthfb5gKEgm66SaZ3VvQ9WjjPkgwkfA42P2R2iD8BR4Uu7?=
 =?us-ascii?Q?vZCaPHGp9bYyiDNfQt9rA5w9bA1ywMmKGPgsVP7GteIeX1huhgFHLAIgt5B/?=
 =?us-ascii?Q?rD8yDvoDNb3/msN+jbpFnmSNRUjYra9OD5Y0T715NXPLgKWD30sQekSyXv4z?=
 =?us-ascii?Q?T8/UFArCxqW0pEnOuMLVlNPx53d96z3gpCKKZkz4SrhFslYb/QB4Dbn6clQG?=
 =?us-ascii?Q?8LzMjg04dJa9gRNgpPt5PtdLdlNZAO1c8ubQ8OTrOgg4efI22wsD1Ue6EAiV?=
 =?us-ascii?Q?pmwyIllLaioMPsEvFVYtvwccEX626mF9Iij3JelfYhB8Yp5/ht2QYyjn2FC3?=
 =?us-ascii?Q?lduLklw475rKntDh1qtN+UOINaP9Iex1+e2JTPtfAoIC/lapmEGG54w/ah8O?=
 =?us-ascii?Q?VnOTaAKyJwYVcBlFq7YXNd8ktUYyu9LnbBx5a7X7aeHl/o4lPJ+CxgrCrNl7?=
 =?us-ascii?Q?oeUuOw9TTiwAkDvNRtT4UyNaQ9yLyfu682rCDNZoU67NBQZwJptDTjbHF0JR?=
 =?us-ascii?Q?xJm8wsvRJENgij/DfqCc3iRDlBa1DgEZX/fNGahqzJTKOQfog2Cno0BW2r+P?=
 =?us-ascii?Q?cpJdsFKbhzbcYEA+YWnffn78eXb2wvPnMNBCm1GLDTTvPZyhHndZD5SyEwWz?=
 =?us-ascii?Q?cgE0ZpezS0adfsIGPv+Iv0AqKLcVM7b9/2bGfyvYDlWHvKta12N+zk9kJuR3?=
 =?us-ascii?Q?MFvYw9jr9VPHGTkNDKiw4StEkYccHrqzA1YUykzDsMbQTyw9NJSismqnzvFH?=
 =?us-ascii?Q?ADR6LivTHQKpGhK/qg/pk6zGpMMbSPGZUCaLSvukcWLAAW4w+8tr3Wmoe+dF?=
 =?us-ascii?Q?I9xYoGjK6S0yxXcGZvuFXrgNau2zgdZ2+U5qsm/7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55099be-f125-4cfb-3878-08de23e3a0f7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:09:29.9847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gi7wNmfFZFs4DaTEZmegVzZMRTMrHCp9OZ4Wnqj+68lZoi72f0zZfTNRQHnYvqvlV6lveJIRcGaOlyEhLu3zvA==
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

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will contain a specific set of values
that will mean "go read NV_PMC_BOOT_42 instead".

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 41 ++++++++++++++++++++++++++++++-----
 drivers/gpu/nova-core/regs.rs | 21 +++++++++++++-----
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 88a6d7af9f37..8e04628ca3d9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -169,6 +169,15 @@ fn from(boot0: regs::NV_PMC_BOOT_0) -> Self {
     }
 }
 
+impl From<regs::NV_PMC_BOOT_42> for Revision {
+    fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
+        Self {
+            major: boot0.major_revision(),
+            minor: boot0.minor_revision(),
+        }
+    }
+}
+
 impl fmt::Display for Revision {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{:x}.{:x}", self.major, self.minor)
@@ -183,19 +192,41 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through NV50:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
+        //    boot42 may not even exist on some of these GPUs.
+        //
+        // Fermi through Volta:
+        //
+        //     Not supported by Nova. boot0 is still sufficient to identify these GPUs, but boot42
+        //     is also guaranteed to be both present and accurate.
+        //
+        // Turing and later:
+        //
+        //     Supported by Nova. Identified by first checking boot0 to ensure that the GPU is not
+        //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
+        //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
+
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Spec::try_from(boot0)
+        if boot0.is_older_than_fermi() {
+            return Err(ENODEV);
+        }
+
+        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
     }
 }
 
-impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
     type Error = Error;
 
-    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
+    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
         Ok(Self {
-            chipset: boot0.chipset()?,
-            revision: boot0.into(),
+            chipset: boot42.chipset()?,
+            revision: boot42.into(),
         })
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 274e53a1a44d..c6e2e08c754b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -40,13 +40,24 @@
 });
 
 impl NV_PMC_BOOT_0 {
-    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
-    pub(crate) fn architecture(self) -> Result<Architecture> {
-        Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
-        )
+    pub(crate) fn is_older_than_fermi(self) -> bool {
+        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
+
+        // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
+        // GF100, means "older than Fermi".
+        self.architecture_1() == 0 && self.architecture_0() < NV_PMC_BOOT_0_ARCHITECTURE_GF100
     }
+}
+
+register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
+    15:12   minor_revision as u8, "Minor revision of the chip";
+    19:16   major_revision as u8, "Major revision of the chip";
+    23:20   implementation as u8, "Implementation version of the architecture";
+    29:24   architecture as u8 ?=> Architecture, "Architecture value";
+});
 
+impl NV_PMC_BOOT_42 {
     /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
     pub(crate) fn chipset(self) -> Result<Chipset> {
         self.architecture()
-- 
2.51.2

