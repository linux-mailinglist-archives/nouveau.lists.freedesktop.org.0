Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333BDC181D1
	for <lists+nouveau@lfdr.de>; Wed, 29 Oct 2025 04:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A51D10E6E0;
	Wed, 29 Oct 2025 03:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VQ0eZcih";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FA310E6DB
 for <nouveau@lists.freedesktop.org>; Wed, 29 Oct 2025 03:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MVyAWOgc+9jCaA65ok2Uyzx+kesRmPqyTqG3nau1aTZapxO7SKXZBDVSg1XmJ4eSXPqjr0oDM5pm/6CKhDe9ZymJgLvG0f0zQjTy5EL4kW01LwLtBoon2JiudEPVCw71xilrRgBb/FdXbzUDhihdLRYdF3h//b28OEpLfOHecEUqhLt0A9cGnSr6tCJAvPOpzzP63IaGyF8tJzvTVwK2pChlk5KsC1DisaW8YET8bkhyVhsCZzU6K9C79SMC4pZyOuT4kd90v7TgqgUryZ1BbRh9OA4TlNXKEbGM1xejoq6LqDJ3v5U7FSOd1HNYB1LxW/1cN9jFybg4cpC0TCnWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkZHA5OiTSoBNs/EtxwZKGC6nogDXTeb76XtvVJtmnQ=;
 b=EOlTyiTyeov319ZJzY4elUMosZiNi2LbvSdpXPNNnOSe+C3va79AjJG2HUlAdOKPiCBuKfZzIuuD2+6ETtKhYcWjhbhlNtu9n8grwKOTEQQj/GSBoriW5c4ssT3tNM5AETOQOdRyuz5BD4fWejQ8Fl+q29fMtrirM+BlRskjb6p6Nx4Qy816GxuJpJZTRGXkrNqaDEpbgjHzoc43hTXmV+6mEgi7+euHNxblygOaIgU0xeXVHZYIGLIcsju6EjHPYJvmv00x6veGRPnxd0WsPKgBYBpMCXzb9dlb3Tk/w8F9kJdV1JVVisamnXV0Us5LSBiNRVscIoxyAmuUQ3+PPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkZHA5OiTSoBNs/EtxwZKGC6nogDXTeb76XtvVJtmnQ=;
 b=VQ0eZcihm/GfLgQRheqt+YpR33peUKAwjJpdD+zvC8qY9ZtB2ObC+4Gunblu+FTSr10MptM6K+OeQ3g5sqMatryymDrpVlE0ikXoCp5bNuSL6vkg5dkWWxxUnC7isduE5V4OvS51HF9hG8UcpcJoBI9e61WN7pkGoP297c8fGlZpWIWKAgkR57y8QIxVGV1XWOFOaX/tJrI0fDRFcaODng1J66VxJRYFKAP0gtji3SgZIeambTdtfWHYpzJ8oJi6aVoU1ywkjPwhNIlFjihzTn4dHDzwh43A6s+q0XSJS27kClafBl+fOkmzjFnAHEmhOA8yl5Y5RQiRlYYpV3wqgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 03:03:35 +0000
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
Subject: [PATCH v3 1/2] gpu: nova-core: prepare Spec and Revision types for
 boot0/boot42
Date: Tue, 28 Oct 2025 20:03:31 -0700
Message-ID: <20251029030332.514358-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029030332.514358-1-jhubbard@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c22310-6e58-49c4-724c-08de1697bfb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XqkCKQ6SBtVwTsGBBjBYRxJa5vQWjSJS7Wom9KawdTDYg5gykZ+TOA+vYg1a?=
 =?us-ascii?Q?xUnQ9ud5FCc99MLALKme+1thHszs/H3H4pr9aV84fuk11doTZt4VFqlUFk3S?=
 =?us-ascii?Q?hGMi8L1xzFsiWmiw103BzYyROHDRMx1umuIFD2c+nlJxJo4n7e8WUHGq7Y2Y?=
 =?us-ascii?Q?jr+zmyHiNNfzxbPCuVVqg9FIgz4WrbnYzzOTSIiwWnB0Xeq8KWLHVgl4tOOn?=
 =?us-ascii?Q?7G8eEACPpwIaxHczvZ4JseeppN7stg2S/+jWRKksiHkB84U6XcIRdGy9KzcI?=
 =?us-ascii?Q?cEIhL6WmGw9EWMix4NdnXS7dDJJpZuXNtFLBTigM4tbEv6fRTHaT3Lid7Aai?=
 =?us-ascii?Q?DK7hYpYDHzBJuK9Us8f0TUqbbwpXzh6615T3M7qNbniYMx8gYz4/K8LTpeOx?=
 =?us-ascii?Q?G5i5+L3mjT8xzQMbLP1LYYf/mA28P3NWjC5x+wrPSmy8aTSCCWhLw4fS2pWC?=
 =?us-ascii?Q?5YbXjpw3Y3kTSDKdFC1uXzquV+RQiJXI68emXIehKWihfcILkG1wepQcXk5O?=
 =?us-ascii?Q?3CdL93GtQHANcCFDnzGdM+IjWg1fjt5tzm43ILIUadU+J8wwdbe9VYaC/Ts0?=
 =?us-ascii?Q?REubssuiExTq3enmS7261FUMOaZnh5/hAfnGyaweQ8aU8xpIzn911vQxovRX?=
 =?us-ascii?Q?zKFdgMNOehcGHhkcm+ckLxfN9KpuaC4N/s/BYD2dtFDkve47hFD5HCgYTTbB?=
 =?us-ascii?Q?9+zXoPFYbTkZgC7XqAXLyDPBQ5ywKq4YOXAU+Yza0WoVLMmI7n1dhn8SOLig?=
 =?us-ascii?Q?KVKYA/9w3ouJkcp5sjFtjsOpw0Ds15072agYirC7ow6pesABk4brMaO+vnOO?=
 =?us-ascii?Q?JLZmAH3XD+O/zrfoH7X3Mv5Na5257f/vmd4E2EOLYQSmwn4AiBeSDsGoAXhQ?=
 =?us-ascii?Q?P4Q8H6tCjS5zI6a3EreEkWnKD/hqHvcTQPCov1kJ495fsPY7+VrgQarjaaO0?=
 =?us-ascii?Q?Mts4BMJwpWuwQcvLGQiKzDO+KKfDP5lFWCtWayxGfs6qW2gW1W35XwmMJloG?=
 =?us-ascii?Q?Una11oGvh/iz18BS9QSxgmzmtY4Wzv+IpB99UmtdT5JI9r34bWKKVaZwd7HK?=
 =?us-ascii?Q?I/foM0ehWhvJisxowzYOq93NNuSmtRcAZAJXazijtIwLBsFIM+wYe+zY8Jrh?=
 =?us-ascii?Q?TDRnFtYnuv2mJAOtQdFiFL7GrdHkRTwjSyfOyMrWd7YL5Pl2NyKPEkzjoR8A?=
 =?us-ascii?Q?SVKdJczDm2Kb8iRWUnbK32ntARj0KPQm3yMFa0fsvL13fG8VYi2EyZaQ34rQ?=
 =?us-ascii?Q?tklUmxJ5BhfjTlBYCV+Q4IB38QKKxmv91lCKugAfrJn/1uODsIFP8gglYIX+?=
 =?us-ascii?Q?YW52PXLAfNQVskdZ5gr1Yeu5cQt6dJplFBjS2DpHIbhQG42R162sBPIqR9wa?=
 =?us-ascii?Q?h3tLjMIxpRJyHCP4BWats1pF3qCYu31BDe5uZoJVA11Y0i7yifGhMJoFD39U?=
 =?us-ascii?Q?+z7r9KqYw1GEQuqevu520oS8L4raUnSi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XgpAd/4rUH/FHjcicSjAnR8RRV4nuWY1u5da5WSpI4/EpoMED3UfxzoRPIJ9?=
 =?us-ascii?Q?kPyGHU5p5iA5hjzUuhrDKQW9h+CPg2+fjfbA4I+xOTeNqdbcpakVMyaJO1PD?=
 =?us-ascii?Q?3g6OEYsmiglMV7lM0p9MbCCIJeqxP1/PTI3mDzCeY6+08IihMT1IPSg2pQPF?=
 =?us-ascii?Q?ZfrAxVvuNcPf6EDKOA18PGHRa4wmuZtzfxn79j7PrVcohfn0Eal/+qitMgk0?=
 =?us-ascii?Q?/aO/268k0qa+Sez30CjIyCF+8BNFJd2zwh7U4wwxaIVg4hBHoDKq8pxpkuyK?=
 =?us-ascii?Q?Na4dEBFhKUN7ThkZSQg3SsIBdyOgX58yf5fhbfl9ij/snBPsFeVa1l00H5Xc?=
 =?us-ascii?Q?P52ODLeLB06tuwHMvO2dyiYPs85+PG/LQ+lUGOoCfq6DLdgyeZ7/LxGfXXsS?=
 =?us-ascii?Q?eYtTa2h0BqPDHg0BwgzIxoYbEamJRo3KtHGzFihhjK7sElv+Ag/v01SvrLxd?=
 =?us-ascii?Q?jKCdiOrTGhmzi047spKFx4oS0L0qLcU8hnaOyCyd/lmribpgamNcS8CnAGlH?=
 =?us-ascii?Q?fpuWt5UqXqrqIkANSWrfCLCh6RdCklQWNma2Sskt6/UEzvB8JCvLEBAJDp08?=
 =?us-ascii?Q?OGA6xSo6jUGqaY36gOBg8/ITGA2hgBXgvOBlWD7aI/8hapY4mFm8T8DTGFfe?=
 =?us-ascii?Q?JQN4Hcrelyzj1tY/Lxs7ykxDe7gJCoNslMARNxs0jhuZOsJ/E+seJAjMvBWj?=
 =?us-ascii?Q?A2N5TCi4kCW7nrd7FJpBvXX6SNRvPTR0KtY7jDEZSJHzR/tJF1Cr1cDLYSWC?=
 =?us-ascii?Q?BEo8EzTElBYmhuyf4lmtS+g0Urc4JRPeDaw0aZvBBrd2+saQHq/p7RRjd4NX?=
 =?us-ascii?Q?SfhfXNXVGVn8qNKWaeF8w5h+Facn6X7Uw5CIFdMO7JfzEvTrGQ9IX27p8NfV?=
 =?us-ascii?Q?j5ixNT9HQZpt1BEwnNn0/z3hUyUWQzDLgLc2020tuiO07UiJo+xXIGKJ0qW/?=
 =?us-ascii?Q?xt0r5aRlxEXkqDlhiCktDsul0KEdYn8taHw9nGCxDnDF0vK2ZmcRqI6Wx0mn?=
 =?us-ascii?Q?/9oXnubUk59fvgrNwGQbhUF0FZbSybdGpDPlqpmr1ACzPhI41M0MiXEnZicl?=
 =?us-ascii?Q?BuleWwWCHNP6p5p9zv7eZ7BT5mlPi0cHcAoH9iYeBEaS4v7gp8NamvOiMp0p?=
 =?us-ascii?Q?EjLFtQMIzznv34xGavLrHjxHmfayZ06Iow0kBQRMg4M4TvwFOEgQ9+7OY02S?=
 =?us-ascii?Q?vdrsH18WGmFTjRjdqAWqIwWeYbIT5NulQnrQ2vKW2wmKotyvqnHGT8W51cU5?=
 =?us-ascii?Q?uxXjGLydVsqCc77LCd5gjVQTqNnwIU8vGKFdN5oK6gnR8ob+SYSPUEbobVtW?=
 =?us-ascii?Q?lnstyGTWJXgZ1p6+6OjZxLTCnBeZf4Zf5pbCksqSTiXJ84FXTBz4WPfyAJjX?=
 =?us-ascii?Q?va3B1qZcsuvEpsQiRn1J9HxfzWRL5jeBO7E79xQ9vgIsPShrqEbAAF23pvbI?=
 =?us-ascii?Q?okCUhYabW+oiSb6DMThWeZ1ci4AYoAh3hR2CVV1T5hPw9G7BQkH/RCELMRyA?=
 =?us-ascii?Q?QzjqSs+7nDMqvJgInPt/TNgSDHQqyp1rPvPuelmHgpbORfw47G2dxi5mBse7?=
 =?us-ascii?Q?coP0/u8xFYjA8B6DWqrk7WO4KU2uL1gwmxpWZlEg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c22310-6e58-49c4-724c-08de1697bfb3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:03:34.7206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KJa47DIos26i5Z2MYVPNrLq7AZHcwWOXawYASOjdhOu15FOr+9guItfjiKoyGJtDPyX+PT9JyrfL9SeyPWtbg==
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

1) Implement Display for Spec. This simplifies the dev_info!() code for
   printing banners such as:

    NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

2) Decouple Revision from boot0.

3) Also, slightly enhance the comment about Spec, to be more precise.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9d182bffe8b4..6f1486d4e9c6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -134,22 +134,13 @@ pub(crate) struct Revision {
     minor: u8,
 }
 
-impl Revision {
-    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
-        Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
-        }
-    }
-}
-
 impl fmt::Display for Revision {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{:x}.{:x}", self.major, self.minor)
     }
 }
 
-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
 pub(crate) struct Spec {
     chipset: Chipset,
     /// The revision of the chipset.
@@ -162,11 +153,26 @@ fn new(bar: &Bar0) -> Result<Spec> {
 
         Ok(Self {
             chipset: boot0.chipset()?,
-            revision: Revision::from_boot0(boot0),
+            revision: Revision {
+                major: boot0.major_revision(),
+                minor: boot0.minor_revision(),
+            },
         })
     }
 }
 
+impl fmt::Display for Spec {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(
+            f,
+            "Chipset: {}, Architecture: {:?}, Revision: {}",
+            self.chipset,
+            self.chipset.arch(),
+            self.revision
+        )
+    }
+}
+
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
@@ -193,13 +199,7 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(bar).inspect(|spec| {
-                dev_info!(
-                    pdev.as_ref(),
-                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
-                    spec.chipset,
-                    spec.chipset.arch(),
-                    spec.revision
-                );
+                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
             })?,
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
-- 
2.51.2

