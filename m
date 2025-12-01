Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9D0C999C3
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBDD10E4DB;
	Mon,  1 Dec 2025 23:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sJlFTm1G";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6DE10E4D8
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9s4fv329PYju39F9SibrXSfzqP05UsrFL3dK6QnhVfKNrfg/4n3+PNsInFxwKq5vSDMSCnS5NaxKDUMD5IHf/ZZo39Rvtl0snC3EbP/lxNe+q5kar9ph5fJ/poPFIx1AuDmMqMYcZq+bp6vVshLvQubdj0HAddcOuagqPbyX28kLfj0Oj+1OqGp8uAu0FketxqYuauxdB2xtkeLaw2ORzRbxfqPRn7KJKaGr7pLAtdiOaQe4dzjA+JjOmlhX7TGTkXGmNfszy/Jl23YSRn7+JYobItIVJPePvNPs13j0QiUCY50ESskFieWGemp1JnbvUFTQF90/pBjSrv/7SL2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VylLdfotgM+SodWNfVWDsuSE/WuyEQ3swuUgquPYrw=;
 b=lf6/TkBJ1uuTyVXPBYzAJo3ZLaTr1l7XURSf3Cs3r2Z91PV2BP8hWXXgV6sCVILbu2PDTm8EG+M6Duk+Xi7r/HPMPIHnAUqRDsF8hYLS8BzOsIpAuMXwZrC3vUiNxvdMeL5c1kVYA47hKtoLKEktGMJO6GrfZAJNTniFN7AnnMai0wD8Cs5tWZuH/+4g6AE1z4J5rLSlNbvYb9lhP1l8Hk9ytqBWD6VhSiQ3rO/5BnZeXG8RIO4Bu4iJSDPRJoFwdxaxJKPMFPCXUOCLXsUL5HK5t1vzqYgwBtoqL8zZxLYUjQhAOqqRM1M3OA+RA8lDw/OBTTKZjpsznWkCcLUlXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VylLdfotgM+SodWNfVWDsuSE/WuyEQ3swuUgquPYrw=;
 b=sJlFTm1GDZSXtVragqXlmL1MZqG1B0N3xvrSLj1zd8avxr6dBjuqGmCC5CVgHAkx+E34k/ZhXfxtg60Fl5GlayYHYQbTO6mPhnye11hwFWmDgOlvzJacPPohQTSJ2nYwghNbPJuyz4/Ugf0bxRARD5uUJqZulbhLQfhyJWx3M0wfCEXqotV4ntPdPUUxx/MVSPE6xb+LbGfDbeaca4bDbypRyl7sL37HQVEavZge56QPv2Np9shq2MzJUJekMGyz/v8XuRi3tm6W3yEn8Q/n1Amlj1oVrKSCMmEzJk3sN8YeVOh4dSI31ihhZj52bDr46hFheMTLjElUNS7a2GZsHQ==
Received: from DM6PR02CA0086.namprd02.prod.outlook.com (2603:10b6:5:1f4::27)
 by MN2PR12MB4046.namprd12.prod.outlook.com (2603:10b6:208:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:17 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::3e) by DM6PR02CA0086.outlook.office365.com
 (2603:10b6:5:1f4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:04 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 04/13] gpu: nova-core: add support for Turing/GA100
 fwsignature
Date: Mon, 1 Dec 2025 17:39:13 -0600
Message-ID: <20251201233922.27218-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201233922.27218-1-ttabi@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|MN2PR12MB4046:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a8923a5-6e52-40cf-4e43-08de31331f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eT8/fpMRUckE+MkBRXXNTvwKKGL+T8KGOvIM1jUugRLJB+w9F0BgauGNW983?=
 =?us-ascii?Q?bmZOaKTt5JGrhzFX6b6EWssHS8ATymtL1yEfU92Ve5RiRqj257RT8it+MRI3?=
 =?us-ascii?Q?J4i2pECDK1EhXRr5ewCiyjEM17EYlivTUO1SYParE8RqJeRGRN8xFqsM/Vzu?=
 =?us-ascii?Q?spaNn7FlKAKSjsADwLxfir4UhIYSSSVoTpQLQcZAM/1WZ6VEjwPJ/VyV4CZq?=
 =?us-ascii?Q?nL4COIcONKmcvU1oMJXqf2r48ND3we2Q+ZipSWk4+S0WOVewaKq6DG+yNkqb?=
 =?us-ascii?Q?5mi19t9VCLO5nuTm9/WWzU5aGCNuE4eRvEnkNlZvwSnaVmQ4GOevK+NMkExE?=
 =?us-ascii?Q?yHrZWH41lzNoKPzkSDVX53eg8CfQ6v4pvoH51rZshDVuyOKm9gzJHOFhSCZu?=
 =?us-ascii?Q?7miTBx1VNKtJSkn/fyKG29MzzxfexPNkxGUjBPHhwFXUwCkxKgh7wFO7PRVq?=
 =?us-ascii?Q?TyL/VYLPjmb8K7hhno7o8tn2oxM1faN+9OYxmcdKD502+21gfSA1pEa065JJ?=
 =?us-ascii?Q?WmxYampiGGnag0VTlnskJ6ccBmQwNJVecap7DdTaqJE5ZnYak8deqsImkudP?=
 =?us-ascii?Q?o8aUcYO2vCIflOtYMcMZfY9V/BhM0xrmw0f5ygF60AgVc8r710I5915C88aV?=
 =?us-ascii?Q?2YahnICPyP5xTzEWlp/pSfK4Jj5YdpBDy6LsbhVCK7eDNHLsw8uuUuVsL9+b?=
 =?us-ascii?Q?FGZWornAKLKlvrsXECLso+10yYrvjZ7ybR9y7zk38LmKTTUOZw8LRSXH8+8l?=
 =?us-ascii?Q?sYlLfal853W1HSVNHBP8jk6c8LPccD2KviMZ54d3ixzh3tZNpqK3JKfN3PA4?=
 =?us-ascii?Q?k08ffkKQDNe4OHZc0dagKu6qDyFIeV7rq/vq1nTaH6rjkuX98ZMfRKTprAN2?=
 =?us-ascii?Q?gyak0lyo3V1fkTuMdiZhLaLkNJpgqMvV9zcBGCy6a/H1EmAsd8wji0+8MwPw?=
 =?us-ascii?Q?K7beCGJVgq5n7Nw66Yu64bkCxfs0TaFHBuuZuEsx3FQmovIuCXC0iaWrkYcS?=
 =?us-ascii?Q?qOnIv2t3raeI8lSgiPbgX40A2KOxtxCq6vxs7KXW4NYrNm+cAuldJEP3zXyP?=
 =?us-ascii?Q?NG4PCzHNXQHYyP5yxK0s7wF30zPOExF3Xikdgb1BWAOLPxIJIfBArJpbMm8l?=
 =?us-ascii?Q?/YOITvvsi2I++KetyGSGfpRJyhl08rqzHosR5vXE2WXodCXS8tiDgSJEgb2v?=
 =?us-ascii?Q?c/GZCMDlYwxpHqAuxQyB+NNXUOCHLb70pT9F3hTgXaW/w6bFEybpuGfPVpb7?=
 =?us-ascii?Q?TuFGXCxXmAGGp0+j+Kih5FdHhspU/L+azR7b7F5jo9xQO75s+YfPNGMb2eBm?=
 =?us-ascii?Q?cAHri1tPZytZ97cN1Dn1Rnw/SV2TSA/d/yfFi5yaDbVqiJPUxoyb5jBQgLzD?=
 =?us-ascii?Q?BIY0bP7kEgVhG6zrwO56MeTDRoLT353bfd1ZhT88rRhgoE+ikQnB7rax6nXX?=
 =?us-ascii?Q?W+cdT+3kKLQjO/vMO1gE0dnU9zZ6PaKiDITG1xABVflE7w4i1XbtKsIlW0v6?=
 =?us-ascii?Q?rw5OqbEE4VE1lor/3Be62vC5I0NsE5ruGnLhAHSP9P9Zpl/FnZseRldhHX6/?=
 =?us-ascii?Q?C2imdA/0wOtYtd9L/Gw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:17.3424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8923a5-6e52-40cf-4e43-08de31331f83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4046
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

Turing and GA100 share the same GSP-RM firmware binary, and the
signature ELF section is labeled ".fwsignature_tu10x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..aa5a6433c377 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -163,9 +163,14 @@ pub(crate) fn new<'a, 'b>(
         let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
 
         let sigs_section = match chipset.arch() {
-            Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Turing | Architecture::Ampere =>
+                if chipset > Chipset::GA100 {
+                    ".fwsignature_ga10x"
+                } else {
+                    // GA100 uses the same firmware as Turing
+                    ".fwsignature_tu10x"
+                },
             Architecture::Ada => ".fwsignature_ad10x",
-            _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
-- 
2.52.0

