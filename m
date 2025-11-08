Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C2BC42704
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 05:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B391510EBB7;
	Sat,  8 Nov 2025 04:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CiX0O5JM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396DB10E0C5
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 04:39:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUrchra9VDFLsN8aojqEUA8KqnQmuXuGeyTEYuPTCPSk4V3DQJ2GkT5CP99hFsAiRw1Ojo7PCcOIfGaG7VEvQg7Cy/LTbejKy7ubz29SmKN+d9uDH4JGCSvfyy5iafHwVP202d+9u5eG+sOU8EcEK8X25D/Fmyubb5NLd0k0ePD3XfmayQocnPfV56h84+gidwoNz62MXnwsVtJZDAaFSdL0Q7m1EU7cQYTlP5kt+/NvROsjuwLDD4UrxwkaGxFobof8Wjb4Mnkm//uUbAk2EBgKuZM0iMRXpgIBwA+eHQZGVDOCJ33loAxX/clVoXpynU60zJ+QDpIMP62hIVLrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgWBIXx+jUe8V+sduVdomn4C81q8S3cYGIaFZBV6tMg=;
 b=GcihryyKQTDTizvvwlNj94ovoSYpFHpOffhIWTmpqdXHIq9saLSmz0Oi7ktt0plln98OYk7Q7c4cKT8a2u57vpTufyqlQQ9H2adyafHwmEXDnRpfD6dYPry29SruluAuw2/3V3eJoYv2uomjmkvUJ3zT48KLy4rSrGqtw7rl1yaHCUsKwpsKpA1ufbp91p0t2gtAoIRe4L5Mc31ktxkeN/eye78TeqqHjRxjtbMuCccEneM5/k/1gir2EAJm6UXauLOmLNcIqMIk+vSIM9XcZPpMm3TM/fltlb5jO6qwaPYP8FXCRXhbemJBu7LwcSrWOzdvaC8dPerswIk8pNkGvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgWBIXx+jUe8V+sduVdomn4C81q8S3cYGIaFZBV6tMg=;
 b=CiX0O5JMc6o37r6UggQ0uqp3ZXV8P7GquPnUBBjrGhkTOpzOEnC/joHW4UX05G3m16HxC5eDDpcSXOV4hM2RuxBaGyQm/L+saX0ADeF8yybots7fjYon4tdaDDrIN9P7DFKX2Ae4F/vfKG+6sE6DsacEoOWWUb+miWg+AOnjofOoYMVA55fO2AV3re89ZqgTphYvTT0pqRdnSp95cocgefV/+eZh+KzLYbW8JTDtpiKAqOBMjV7/JLAlkA0PPAlNAMFymDlld35MWDbX+xP1pf66aI55Wmj02tZo033boHaI7WT7cuWJ4a5RfT/WQjahWB0wrg6mPnkH7BGTYaaSUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 04:39:49 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 04:39:49 +0000
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
Subject: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8 type
Date: Fri,  7 Nov 2025 20:39:44 -0800
Message-ID: <20251108043945.571266-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108043945.571266-1-jhubbard@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbe91cf-a1a3-4ba7-00bb-08de1e80d9db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+/+beLMcml6laxSzo97mqjWWzVCFfys8W563mwR4FI3vMtYevek0iRgpV32r?=
 =?us-ascii?Q?Gu/alxbJ4wuoim5gK1FYjdggMKECCNIL3tlXX/x8zUjsI3zTdGrGiwgyxrbF?=
 =?us-ascii?Q?WJWcAOg3CRlJdvD9XkT2scm0OZQiW1rvHX4xy67MdAH54ll5p/DwbNFe2BSa?=
 =?us-ascii?Q?87N+mLfo4YMWUKGXMCdXc6PjAZU1tIXLbQqz9lI3xxlwd9+9/WcssZ2u5h9g?=
 =?us-ascii?Q?vLTU0IzTu9bFE+96Dlbc8To16r3pAcWsqHuNAdK2118UHYjCKvp6DJwhP+C8?=
 =?us-ascii?Q?wJnnopgZ3ZPTjhZdHYqU55NEKB8ea4POnn1vdOdG+JouypW9RBklTunEPSOL?=
 =?us-ascii?Q?92o/boSUPgYlArjFw+GOWGADogMoM8+s2AryLdgua1sG9w6TALovBWLZ4OSm?=
 =?us-ascii?Q?+9IofqHqdrcyEHJhXs3EpkoMszi0NTGKiiM/zylt6Bp6/Tsod8FdAr5/zzfo?=
 =?us-ascii?Q?nTe52jixQ+jiQEF9HWv2AeH6JWEUuc8Q8xpTSHb+7YcHvIw/Iz/lO1RJZLc7?=
 =?us-ascii?Q?knc8Qpafo/tJaYSi1PaNtxIOCpAuO17tCVLXZ758xiO3ECMTwXu93RkKvxLN?=
 =?us-ascii?Q?meKpUQwTsU/RAEW81d4CT59xk05Rkik3v2ngDtKiXUgP6/mOJEbMDsNg6jBl?=
 =?us-ascii?Q?KlvXEZLD2cVL2CHfoAzkZvGnA10deaMuVIjgaCli0BF19YCgsYSZkL+lKdTL?=
 =?us-ascii?Q?t/4drGWST/7lUYcrkXh6CY+UB5p4Ni2e2vJZ32wfjicra2AfVoTDze3+Nk68?=
 =?us-ascii?Q?cfTsiVmhrYuTKpgZZiV5qUX/VuktcQDWy4baVeMOk3rYmB5Dc5uqVpsEudNv?=
 =?us-ascii?Q?edPs8WvquacoJZiNtQqhQHrkJLGa7rwJHom00Ahv1hHVbF0RFEuzcZp8BPqC?=
 =?us-ascii?Q?O3pwRX9hS0lyomwfNhhyPMee7XcqbGokqw50pNd0HIk2RmhPJPtVBlz+FapD?=
 =?us-ascii?Q?zYFZhcb0e/y0bG3QdFR8o+YU0lCGNX0DZqw4oj+T9GLINDNF2j/NqdaY/GGl?=
 =?us-ascii?Q?p2mITjKzffEIqkUozfZrTIp1p0h3xbbZ5ZVuEaWaRhl1AhLdKZTIsoS0FMUR?=
 =?us-ascii?Q?OxSGcMMI5NeAVysKpEs19ffsAWzA+OV3Q/us0UVVkzs2v2cr1baCSWq2GnLJ?=
 =?us-ascii?Q?i73FHSOTKYWZNdbb8Qo9rkz8UZzuliclwd0ztIr2UiuGPo8DuXP6M5K/NX6Q?=
 =?us-ascii?Q?gbowghL82zA7fkLkqKwPeAJsgOGEHiZlfsnD6hcuWkuC8gAei3AkYrRAaLXj?=
 =?us-ascii?Q?uF3kA8VYcxYE6PwXe2nLNOAK6uiebLjAOd//dBs3bWAcrm7zhV6QAe3ZuggR?=
 =?us-ascii?Q?pNxzUxgu6wzHIlHBgivAtUIibtdyGBANO8OWvF4ON9bBso4q9StRESIHAD0E?=
 =?us-ascii?Q?PGDh8o0NuluMYnQeYv6rPyO9sWn3f8SHH1AsIzGR9dAk03aHDqIZVuNBtLrc?=
 =?us-ascii?Q?szdJmrOX9yJ5YKGniEjyGP80tCDwcdw8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AY/BPOEimSCpB8aY234nODdtrF3hG1JskHqxKcmnCnc0yzaR+7tamha4ZERC?=
 =?us-ascii?Q?YAoZ2Chu+YeCd7F/AX03el8ANS6G7uQd4dFibGLdTFW7qV6RGJ0Lmo8wGVIW?=
 =?us-ascii?Q?lYid1PemA3QPEeLxAL6OfCezZ9/mHJPrBPdG2IiSWgd1Ed7S2J8qJ5eLrUjS?=
 =?us-ascii?Q?A3zzWbF+1yVxi+oMGHG/6MK6/SOIt76blSEa3mZ5yAx6PETAHeKksUjeR36Z?=
 =?us-ascii?Q?MSJo5TeyC3U8wToV4/qzNXOZbqRu42RAMlUfpDypWL0NLrVnOiIZjhlwsdPh?=
 =?us-ascii?Q?FlPLUNkTvjAbZjFZBTNxn6DzLNoD2E3LEw9MDn7NTpam66eJueghmDL/LR7T?=
 =?us-ascii?Q?7O+EI2rTbhVFL31RI5uimct3lvZf4WKx3DrSY2JbxdyBhzHbvENOyC/rJUi+?=
 =?us-ascii?Q?EOkiaUJo6sZ0Her6CGhHcAlj8UzJyBeLbe7UhJTKZZnxuJZWv26qiuHHfJiw?=
 =?us-ascii?Q?VivgpkU1BrouXS28mz2UTGN/9xzv4WAXzpYE646I9qaXV8HRqTsUEJc+QzRB?=
 =?us-ascii?Q?f4CcrRKBRhgn3+6mxY3D2bzrauUGlFWoETOvpceESRuHip6er59a68pQ50nU?=
 =?us-ascii?Q?17f24ASCpRFjEdeAYVIYGXhcptxTQ5QcHWn3Ba5tUk3pBlt2M5NCAZls8B/U?=
 =?us-ascii?Q?CPhpSFCraeuXZmQ1lhPTO8gEHmj/r7/G9HtVJwBo2v+jHygF2l/agSXINGrF?=
 =?us-ascii?Q?bl0tvGxUmk5sysBr+jgZEJykGD2kbijywheB9ioUb0snWQS8nW60xP3h+BYq?=
 =?us-ascii?Q?xhfyVyZp0MV+zmA6TwCxlRfSooGiOCUq1OeMTMn28jnOziztZNXH8HMZTBZc?=
 =?us-ascii?Q?10jxOVYRZ4Zcej7cC7fDEVXjWQrNFLkkRZFuRSTwtAkGq/sGjOQQ8DABcGXN?=
 =?us-ascii?Q?jXUY6PBag9c06qgemC3LBrRathPfBe3gdnK0Zam6HT6tIYp2KbIvl4S0FzOr?=
 =?us-ascii?Q?67qmf4PzazADx0hCSUeLgnjliok+1501dzQ1d7SEvT3wz2QtdFcE2S6n7DcF?=
 =?us-ascii?Q?KJfTMJV41obENAO+x2KIbv082JxxUcRLmFDhufg+dgKdhi3Z+di1HXHJyHWk?=
 =?us-ascii?Q?/dRiIIzOvFm72xM71i+PExEjt3+KQSojJ3XMfhDmMblKog+pO8RnvdNq0WS8?=
 =?us-ascii?Q?tkohnFt+Xpx8UmNfX7tCkp5ie0tRg2q8ooGJOtj/Y7/oUKui6dxY5XHlKoVR?=
 =?us-ascii?Q?5Kg2ZMUwBheuL8ut9VMcGwZ/hdCKsMyqEnCCI/CzuEeD5IKYCRlynim1AAsr?=
 =?us-ascii?Q?Q0wVR1z7gE4SFZOAC1Q0+A+RVk6qNV2zQC6K10dcpkV9i/NFXL0GCEBBHk/F?=
 =?us-ascii?Q?qDWKWrH/Os3r2B/C4Mnt4GPCLRkUUy3w/GtfUDMZ+g72PiyV+kWIfxGdLfr1?=
 =?us-ascii?Q?thc0l/0dvP0mfJ86GQlDSXmkC604NAClIyX28Qctz4AKMUWjDlJ0rc8VXyIc?=
 =?us-ascii?Q?8AL/BjAuJmB++Ib0/vd0GFpLJMa0irK+oErL8UjUd+Ib6ceZTs1+9M8MlEPG?=
 =?us-ascii?Q?+jCywjeTcDrVhCIINpJtnmfV/ZfG1cafYNMrWJ6Trlb3e6IklmyjqiCusOtV?=
 =?us-ascii?Q?ShVl65hnI8Ln6tMm49nB3A3FBaIuoCrHyQFr37qp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbe91cf-a1a3-4ba7-00bb-08de1e80d9db
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:39:49.3921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIWp/gGP8zBienrGq6F8S5ViXnuDUucoAHrATpoxsx+Mmrfe6hyY7PhacJDAMJVmN6ccDpJp+zltxwDPjs4Wzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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

This allows Architecture to be passed into register!() and bitfield!()
macro calls. That in turn requires a default implementation for
Architecture.

This simplifies transforming BOOT0 (and later, BOOT42) register values
into GPU architectures.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index acf564fee9c8..94a6054bab95 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -122,8 +122,10 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-#[derive(fmt::Debug)]
+#[derive(fmt::Debug, Default, Copy, Clone)]
+#[repr(u8)]
 pub(crate) enum Architecture {
+    #[default]
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
@@ -142,6 +144,13 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
+impl From<Architecture> for u8 {
+    fn from(value: Architecture) -> Self {
+        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
+        value as u8
+    }
+}
+
 pub(crate) struct Revision {
     pub(crate) major: u8,
     pub(crate) minor: u8,
-- 
2.51.2

