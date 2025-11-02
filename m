Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F173C28919
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 02:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E0510E187;
	Sun,  2 Nov 2025 01:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VNLoBj08";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E4A10E180
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 01:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbIzSDp+hILLWx4aspaXV+D16zLtlbrQZ4w8rF/GWNY5isi4HjrFyB4f1J7tOSQGQHcIJoMIzausfVAQuHg0VWxx2xDQVVbiIQEEj1bWFG7wANY6RZQhf2KWbQzZh6bfKvLMCy6dqt6BP1mVchDlnKPtFF+s+wb4CjN/VTZYpyEkLdr/1YnDsu3vpJfOsgciOLNvJ40uwt/fJ0t8RCvE/EeeGmezSt9Zx75nF+SGvU0zmTLGP7sjRF6FxEUBZH6+VKKQpzhhUugW2VVrwSeMhX5Nv0YZf3eQ7ERbPdM/467d0TS/1fvFND1fl1bU61tKZfctf9nZnloKY2p1h+HvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JjXJ5CRObUw+V0OZJWkzwGrDOraS4Nfqqj/UwWBTSs=;
 b=m/4ftc9rS02SyBkS4dkt/gBNTuPMPDT5hGAMhddG/kvwmvLFbicqYwOA3t7dCMqwxhSJLiG8551bFL0c131t+r1F9J1SFPq12S6iDffVYJ6fLCS7p09uhFZDKUB5Utu0kpXrdfHiPHk/dXO/ST09HqRe386a1nSF77LyYwdu+WYwJGCCdeGWj2cC8JJ3PhCyW4H4XrHRow+xGbqkUToKJqoTyT2tDvGa/RMeCZBVlH+Bcx7ejA4xq1O3EJd933lX1k6wrXn/n4txG7xq8dRh1gWpVsFjViY7kzgbV+3ERTN5N+Vw9jGw+3lx/OYpl/TKh/+a0E/eSbQXek921hNCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JjXJ5CRObUw+V0OZJWkzwGrDOraS4Nfqqj/UwWBTSs=;
 b=VNLoBj08+AM/U6f6rJyWQnuFXfcQUu0nheGhMJtToeWZWQrSjjeJq7Jv5qjlJYUo1PyCNBv0XJBwU/qj7WM1anKvtHofgkdvtbxNkzmm4SGk0S/GpqHsmvyY2nJA7QUoXUitVpEw1shmWkI5/WNXeWU+biZo7uBu0gv8VeZzx2hutwOzEGWREIZdDcPjs+7uXwHpLLwhMqElsrNlwRmnD+FZ5fBjBuC5FXHcZ3Ti1zIPgvybHJ3IJPoHjZUGjdNx2iUpSRsq/0m5yo7o1xJkAu/sEqeFm7tlCl8yms5TgUkXvYcmGD/OtZynO2bdUBmMCs2Mf4l065/hGrzISk1mVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW6PR12MB8916.namprd12.prod.outlook.com (2603:10b6:303:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 01:36:58 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 01:36:58 +0000
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
Subject: [PATCH v4 2/3] gpu: nova-core: make Architecture behave as a u8 type
Date: Sat,  1 Nov 2025 18:36:55 -0700
Message-ID: <20251102013656.423235-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251102013656.423235-1-jhubbard@nvidia.com>
References: <20251102013656.423235-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::22) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW6PR12MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 70628ee1-7c2e-484f-0523-08de19b0505d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?elW/KodBFsZ/24coOob+5tVrMFr9JG0NFE8K82LMU2QuBEuzIBk09UJ2KBBd?=
 =?us-ascii?Q?FD7ZcPcgduyWvDHcvlcb4TVkJb+BJkiMMBJSh0JEPzqF2uRn6Bn7vNnZAdCi?=
 =?us-ascii?Q?lSFZE6ALP9AykxLijjj+IRhVr92sSaxc0MtYmOyb5Cm2HzqcANptvqz5RyMK?=
 =?us-ascii?Q?8Dz8jUwZdnq4Hcm6Hxn1Wy2HykS6dnhEQTAYWuWqxBt0mhUuQnfCttsFD8Xb?=
 =?us-ascii?Q?gg14SYHbWlwi1enBhWRuSwyBixULTsu2hed4azJIh4ZtzGbavbZJmE4XohuU?=
 =?us-ascii?Q?iFuo+PCzZB1xvUHqMy4ecIM+v5Qib4Xs72hNFU3XPYlcwVHQFNvcA0xYjC3Q?=
 =?us-ascii?Q?aAhGNWHZnLL1Xyi3cj53I2lKnLCfdP29IXyKG0AZTY1MEbpZcHbXNgjXHkS4?=
 =?us-ascii?Q?q1fVcRDGAL8i6ozyOQmhBLMVBqJkVCWbOFRxycTI6lfiKWuWcWPnB9eHHLuu?=
 =?us-ascii?Q?AkZI2xC3opKFjAX0poVtTWneWmjUWqKjHgkqBydwGSoSyg8hIB6jOg2sXMfa?=
 =?us-ascii?Q?0OQNcM6lS/upgff6uwYnaS9w8R2gISxELlOcj6x+n1jO8g03hSuPRWWINzJy?=
 =?us-ascii?Q?DX/HE6HtXAZPm4Gbt5lDwJeVKdvSq4F4euMiNc6ubCqr4FmLzWCzPOBGbwge?=
 =?us-ascii?Q?6QDQv3c2DluA8mkqlrh/3IiB0/CjDIIA2z79RPHpPyGBJq5OYXAnGST6prej?=
 =?us-ascii?Q?PMHdO5EsXpJDb6/rk43WCboWE7ir1paGjaU/8W9eODrCdYnL9jDh7+y8kX24?=
 =?us-ascii?Q?QonCwXZo2VPihCdzwJ/Cr1UxXyaVT2on7orymLb9t80ZUvYTQ5Thp7bbcOVR?=
 =?us-ascii?Q?0QM4Dp0fzNby073dl0bGKcY1/FE+mvotQaM0vq0GowW5xrH/AfCXXEIz44sh?=
 =?us-ascii?Q?xyQuIC6lh/26WRckD/yjW70kXPHAa8rR+rNHN0iLS7Hdv9x5gfl2hkB5IKuV?=
 =?us-ascii?Q?hnP9gmupWT6seqOdmAXd/mJFyWBNL0HRbHOGc59M37AJX+KAKUN8Qg8Bh8YH?=
 =?us-ascii?Q?4935bxEc/J2plGQNtQMepFMw6GEqoOnJMTOnCon1bZRvZkYRfviWKo72DCyL?=
 =?us-ascii?Q?GXkvcpZw+38/+jIH+/MGe0rNk4/Gslsg+cbmv4jzkjpmxBFJ1pf8sBouRhj2?=
 =?us-ascii?Q?GyTh6ekETwfUIya8zNiO02rKTjpMUVg9jn9he5Fnm7/bDP9LC/wr6BD0N2+n?=
 =?us-ascii?Q?ai4qhtVRRJe7nLcl/NNPJ5jcmZZRkdj8fJm66SLASOz6lJKMIEI5TT0z0D8x?=
 =?us-ascii?Q?dcLaO7qQtC3cOdh9A0txciMAG9hiFC4Q3pq0vquYDkXeMwKPZhtKQvRCRYq3?=
 =?us-ascii?Q?7SBE+16g/pQQX1NswyR5oQm0u/iZbAwKpZhBC7TLXok2JVhNOSrbt4xwSmf+?=
 =?us-ascii?Q?9oQwffD7uCMIBFy6Z1kj78i7DMk+teyqoafH7G0hklqsJvpxfxrqd3psgksF?=
 =?us-ascii?Q?uf6BaOQMgwhJtQxfy9ErCKfZalRGpfDC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nEQTQpRLJfRbTNYmRPOqGTLYYTTKkF6fBTaXw1aqLqwkXE2N384ak9zy6Typ?=
 =?us-ascii?Q?eLrc50Gtvh4t38bwKqoO3fXgYmhgWpHtNUA1/eYRK8hbJClA3+7PmCfH5vOa?=
 =?us-ascii?Q?jadoHCXerFJQEbNJE++XbmYTv+ujusMHMP8xsMaEMWNvciQC31rTTZKvfnpe?=
 =?us-ascii?Q?sNZtS7eXzTyBE94NNfe9lYpqQBDcpmrA3cWGBdG4/9WOTCbn/nwGA3f5Cjkt?=
 =?us-ascii?Q?rtKQXiuLpLk7zSBt4poLrSuXfvZok0Og6qdaIC2lw3K9VYvLjdQ3dJFRlzdf?=
 =?us-ascii?Q?xGrEP6fnCsdEfeaVPOOULUTp9v54pcBXwQEGNtDeh95lamDkDBdJV7LQD7gB?=
 =?us-ascii?Q?4vB+pprEkxsOvsYsHyXz/AxslwDyPrp9zKdTT0G+t/c3ogRF6u1W+UycL/Gf?=
 =?us-ascii?Q?AaokBWvaTIQU/2/+yiSmDPbVB4b4yDRHccVs50lczU1Fh7OTu48ZdjwrU/GR?=
 =?us-ascii?Q?8S3nRbOnqkbX3UStAEFo0Rmbz9O6u4he/q0gtVPQuzNVa4TjTGWKxM+8ws2V?=
 =?us-ascii?Q?Ch84CanOHM7b/F7RCKQ32lJBWLdq8DIoCuFgv62IDNDGP8+5orgeidP99Wuv?=
 =?us-ascii?Q?HUCHqmNo+MT338rfarPJ0GTZMNxnDispWu3K15Cj1Mi138IIhq0tL81l1mrV?=
 =?us-ascii?Q?DjKoQDiPL03lMe3PuDckAk6o0k/V7yutCLjIkPc3wgVfgkvq7NHeNjM6RGqs?=
 =?us-ascii?Q?G2ItgAcZ0sR9BGiWw+tjutz59vHAnoOrrIlx5VIAka03JA+YzDJCCXDs3Q7D?=
 =?us-ascii?Q?HlTCxWDC3b3UXCwqisZ5NQjlQwGG1GBcKHc3NyoxQZ4/lTC6RYiMj3snXphN?=
 =?us-ascii?Q?2Zt41vjIt4gDmAoAWHv4oSZsEdJIXCe3QhIVAaT0CLFk9lgwbWlcUEmr+K7y?=
 =?us-ascii?Q?UHCiZhgAPxzVNHCrJRq5gSncB38e4lqe6WKMZOHQ8SN3M4bpHcR35XNmBJ5F?=
 =?us-ascii?Q?vLnun1Oy2vxwNubllw0ryJQ2y4cntCWdQ5hpa//KQYW002Y2EkNPOipjbYXS?=
 =?us-ascii?Q?J/UkE1GxsKmTHmjLxR9CCcXD5/4kQmRO5gYIngGjBesHZ7pUSvxmaaSSadvX?=
 =?us-ascii?Q?AXTMO+/Dn0K5hh2Ck1493fHIri+KQTQAgrNp/ZPDUAFhEk67D/Nt0anD3uUU?=
 =?us-ascii?Q?8V34ns5pKJjkhiwa0dAp7aQy1aDLNc6CWlBeSQQslTtHfKnIZ4ClNQtpp6aC?=
 =?us-ascii?Q?Qerm7vBhJ1vfObZUI2aC8NrUb/+zvAMwkePDdwA37VxIRz+NGNFfu3TkThFV?=
 =?us-ascii?Q?p5GqCut5p+ER4uQuIICAvlYH198WcpVp2wgVDsptn9D1fAvcnajcJCh2dUz9?=
 =?us-ascii?Q?0juR9TGC/9oeccVs0QBpv3RPcEzpuNorXCWQMYABj9Bhd0H5SPPiOwde9ej9?=
 =?us-ascii?Q?quSBkQ7YMW+RgQAhpjfceendobtnd/lcz/JiOGMKtQXUdBwbVJ5UBtomm+6d?=
 =?us-ascii?Q?l1K6SbQP10J0QhV/4zZpoC6inUsVjuchw6Mm0KFO27WzTbyqAQPwsi1VcKVS?=
 =?us-ascii?Q?arlPcH6K8rM+6lp4Kl/nMe4siWsqL8H2OdyRExdt5RqEbgrkOP/1PsAYvwo4?=
 =?us-ascii?Q?ZtkZg1H547bQj7tELbsCcGMuTjZKvb66Oh+3Hdx1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70628ee1-7c2e-484f-0523-08de19b0505d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 01:36:58.7554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fWZRWBdApS1IEuc4LEkF8g0f4k3ngemVJaN2trEq73YrdvPIjEas4dIU1OEIVxe292CDK0TXlCG1uENOfJIwvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8916
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

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8173cdcd8378..27b8926977da 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -109,8 +109,10 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-#[derive(fmt::Debug)]
+#[derive(fmt::Debug, Default)]
+#[repr(u8)]
 pub(crate) enum Architecture {
+    #[default]
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
@@ -129,6 +131,13 @@ fn try_from(value: u8) -> Result<Self> {
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

