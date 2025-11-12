Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89397C50858
	for <lists+nouveau@lfdr.de>; Wed, 12 Nov 2025 05:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E18B10E685;
	Wed, 12 Nov 2025 04:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ShO1T/Jh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2F910E685
 for <nouveau@lists.freedesktop.org>; Wed, 12 Nov 2025 04:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwEkpiK5uhkA6FVGnL/XhGvB5teQie1apPZh1jKzaJZaLLC/yEsQr9SUl2TLj/3Jinrf7V3kR0lJJdLyCC6qgRB9PnkREeWs3D4/9yixYq9wQiNJqjuJYFQlKlCCmZY5dmtMnL1a7jia2emxElCN8uyncbJO1XW5a3Bb8DZgkD686Fx/MttVr0Iv2Ho6UIa74dO6QjE7t3lRS6GtWrpZsStOdKHNxep2DPnCjSUWDGEMC4iN5v81OmZs/3nee7JI1WCc6REfR5R3E9/XBpYUEJza+eD3993mpt/eAhQJfMXH/OQuUj/9txp3Q0EZbBuJgyUEG8Xhe8aIOcmO4Mb09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leZ4TF2oZcRrXe3OR/GG+jSVNE2uvwsOa4NTd2soR90=;
 b=Z5lmla5WOIDncBsbJNZr+esv2p11+kRk3hS7/TVdGxbnDANdsxGmEeaEV3+EGguEZLj8hoVF35R1bklL7wTq+T8kp3C8tsYhXseuCVYb67AVzaC8Z9jAtLkE3CZSYx2YVlxPmxLiPkze+JAsmtfofekhsO8TDaza9MzD0vFonThNCQO9fsU0uCUM6sQSx6qNVgFDAcpF/lX8BmUDVl+TPohTor1PP0g6vQWBl+bTxV92s5gNZMFZkLcHj++/4NKGuLmEcwHxBrzk0hTleh0MTxPIDdsQrTf9LjINk5fe1dC573ycRW/ttmt94E5hWn6YlDMKClv8E4UHHMJGzb5EYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leZ4TF2oZcRrXe3OR/GG+jSVNE2uvwsOa4NTd2soR90=;
 b=ShO1T/JhLNeZVvo9vROWHtlppxMY90+sdjeda7B++K/E6ryvK8R9eNF6TessG72XAPZRVtElEfShh3A8JWu/XQf9rvoA7Ms93r6j/7Gp2iKdakfoVpucrrfyCf47DqMlAXpD1Kd+TPwnVas/YM5k4xmcgRppatoUl0BB7V74Vy74SSRu5NwXHvNtYeA8/pL9Ro2E4/60Qb3b8fpC/mTdAOTHe3Of6TFscuJZ7oBtNuydNuLooF2Q0fOE9YrPFnTM22drE30BhkUaS1SOJf6xjQH0r5s5n5GZz414egDV4rywvhgpUg2c7O0/W4AalaU2LqEA9rG5rUAIJKjOWveZRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 04:30:03 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 04:30:03 +0000
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
Subject: [PATCH v7 1/4] gpu: nova-core: implement Display for Spec
Date: Tue, 11 Nov 2025 20:29:57 -0800
Message-ID: <20251112043000.83071-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112043000.83071-1-jhubbard@nvidia.com>
References: <20251112043000.83071-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6e4473-f024-4f6b-d261-08de21a425a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nw/vP0PNoWEFTQdrsipPezEFN7lhp+4ghVyLUCwl8/7FAq+oA//1Rl8Ug6L0?=
 =?us-ascii?Q?zNVPHCuH7hNXBBwEBkaHNP457bw3KoaabYi8KXBQeveN4PtAczY/VZW3jXsf?=
 =?us-ascii?Q?f7hXMUwTVn/hvjK0BPgvRJcLW9hzbA2316hmtIpnlAy5V+cfT5blkklI6SXt?=
 =?us-ascii?Q?YU//+5ajIr5At6Xd9I1iN/C56gB42nud1vqpZmcengnXQ4kNyRDcgOzI4NCz?=
 =?us-ascii?Q?MsU1EUCxo4UwTOomqS5l4ahp7/UYN/cb8yjdLFkxcc62DXIjJVUFpq6qeDv/?=
 =?us-ascii?Q?akatFQ2epohup2G/sKP+M86m8c2cpit52/eRmzIyrMMW6fSbReqocTcip0Mp?=
 =?us-ascii?Q?nM9disFBXp9s9+7eScfntI6LtD5VCXOk9BMjdGF8TZrzfrncwhwyBRK/l99b?=
 =?us-ascii?Q?WhE2Lhjv3sEKoKDPwcHAzzMF2SjBXxDRD9cExoUv1Sgm9iHAQoMci+Ttf/P/?=
 =?us-ascii?Q?Qz0wYS6FMylKZXMyDVwXJRGg9lyKOziuT2kS/saw2YUp60o174WvN6hjOnQS?=
 =?us-ascii?Q?mu74npxNgf6HdyeIagLmpt7nPqY7yh+8O7HVUQ5MlwCuW4/CDGW+0bEQCtDV?=
 =?us-ascii?Q?wxUlhQoHqo03NczWA4PZbiZpJZhvWFXe3C+Rjif8G4kw6KVfWAFyPMrSO/Im?=
 =?us-ascii?Q?di2OK8eoKDmCczAsph5og2/0B7JjcKsQndfmoOKRMUJ85/ehQSSKlo4zKsN1?=
 =?us-ascii?Q?VG6QiFBHrdFeHsEb+IlhzheQQ/McBBe+T7PMYgRfAVulEYgJ4AtOJ0fT/oWf?=
 =?us-ascii?Q?WOE0XsmVcFGFicyyxlcwsQ0zuzpTrzDB3JmSxpSKRGDYOyMXxD2/aO8C+IDV?=
 =?us-ascii?Q?ppl93+EjAox6y/TkzWknTftPNr2+CQgUysyUKOtoUFCMhV7zMYltKjX0pWAm?=
 =?us-ascii?Q?nugZuMW3adomcxwVaC1O9MB+HJLvPiWLJGSmOPZN+QyL3Hb7aSpP1dkTIwQ4?=
 =?us-ascii?Q?tCDj464KldKZHjQvg47/5GHn5el7v6PI8T26EifVALdfh9+pMgy9H6EYgErM?=
 =?us-ascii?Q?6xwG1jj7mliL3S1Z57/vGDR2a7xxR8Wuv0Mp5WJrfQg3NBpDvzpT49tpIj8U?=
 =?us-ascii?Q?MdCIkoFyKIEnfcIk2AJ+fSdCZVVWuXQaqKhB5ln1rYgMQ8pd+xEVaIZoPbIB?=
 =?us-ascii?Q?cOP0jFkH+9vBmzpJPyuDgkGl8PJje58Biu+PaHw0AuC9liSxEP/Qcn3hICXD?=
 =?us-ascii?Q?ICBPs3Sy42yyFNfnT3aFbsjuXMxkWaGEXJ5ZKRows6puyZrS4uSjtNJU48+X?=
 =?us-ascii?Q?hC3anpxl+ydscqNrD8Ckm0H/SqFAH80wjlziHD+BhdsMcYIyFFuRxUhJf7Gq?=
 =?us-ascii?Q?ueqBjiVp87T+WWBcAH1bOkJi0J2tmI4S+LoLMHPyOtDTTVkI/Wz+EgubeUyy?=
 =?us-ascii?Q?AEzaIz+Ia9JUFW3DEyYpuzIaZ6MHXcmCtIJPqsuAzZYkl8TphoGgqJHagh8r?=
 =?us-ascii?Q?K9SlL4XGiFD8fs9CFq1pjApIgX2frt/a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q+RElUt1x/2QUA8iaxJ5nVPqZGMz1c6tp0ILMtjcoT212uWGtygXW9yhlzmt?=
 =?us-ascii?Q?po3V9Fdo06Cv7p7kXuBrXZbuApUtoP+WLozfpcTZyypdiM/leW2q0OG3tNsL?=
 =?us-ascii?Q?qrUROsU2KsY0FGBLc4AooUOuS+Xm4nl7fD/HziR8wez1u8fbs+URfcEkVmsc?=
 =?us-ascii?Q?usq3MKPb5G+emkMCKW5W8kCGPcr1NFpoqPXNz5GCAq3S/qU/05kDlU75uroB?=
 =?us-ascii?Q?Y8xiCTczxg95uvRjmTPUUjL/L/2LhQeHMc79Oe39jkZ/ugrkCnWLIj3TAa1h?=
 =?us-ascii?Q?GMwsBXelwci8cNujQQTBPkLM4dZc5S6mrtqipeXRsl6zkqJnCHE6FgTm3Ht/?=
 =?us-ascii?Q?E1Azj9Pq3CrVtALm8vSv/OYN4owCfsAIYuF+Dp2B5bqZPt04nXl53ZxqR7NT?=
 =?us-ascii?Q?OdujAmcjZtcDW0MheFYyZw7ADHBPuEYpL3AsO5IfJdjfTrViahY6HQLbktVg?=
 =?us-ascii?Q?9M1kr4sdbKmk2k0ZMJV0lhQRG4Vr0k6ZAOk/I8Lagl6UqNpNDn0e5R9oFP5G?=
 =?us-ascii?Q?dXcNmsUibkWn/m094A3jH2VJaM6b7mHBxocGggbSxVBX5TSumwhBD7K4rdHT?=
 =?us-ascii?Q?cV4D4VilsdGBJFBqQxp0vTYaVasyF6lnAgv2/kNCybyqHNJnOFWiX5TuDGAo?=
 =?us-ascii?Q?5SzCXHhSRKGeGdEOUTE+lb7frJE2I5lwpNj6yLgRkr1YdunsCbaByfv4ZLrg?=
 =?us-ascii?Q?kWgRiANhIxjhevqFKPaPbIOEW/JVMvkPsxx6DZ9DLoOVoxGihsNtuBjSW9ux?=
 =?us-ascii?Q?xEWon/A/Cbn/AFb2YiydEeRp7tPB1VrOJXu129/t7ERBps0Kw2VCUrnBnGds?=
 =?us-ascii?Q?aosaVTXkuzWYerAD/rLriBuIMAvlYHHE2rJXDlEfpeDF2Wxt6eSdduYZ/EYb?=
 =?us-ascii?Q?m/+E7rIiv0+Zp1EOWKFgXou+uv0Xi9alPXcSjgHuVaDGkav0/5vIg3KpjH0W?=
 =?us-ascii?Q?nUDe3gjT1PyWetAtj7xiqOI9tB8bmnkNS/7dm6+u0Hm+qWbXK7ohSCD5EFzn?=
 =?us-ascii?Q?XJ9sDL5lJCb05aqoj8zqgIiGsjP/PCZe5zEJncUFUZNc7lRmBpXgzSmv2ecD?=
 =?us-ascii?Q?xTBtQy6NMZNlzyUNc8BC2UkJP8A2tE0ipNxweg+kzs9W6Dm2dfYUegECqHIj?=
 =?us-ascii?Q?COX534udUm5IzHe56hYbfO7yO5VzrqbfEuOzYJSwlfl9jESrb1ZuhDQD10xT?=
 =?us-ascii?Q?WigLSLJ1H4oonaaJzXRDLfeeLaghB/8j9OnqSYC79oQ94aEwEfM2yFMb2VR/?=
 =?us-ascii?Q?bHNE5sCf3LA4lDKt2a97qQgvdH85FNSnGGjM2uIEpvJyYiV1LKxwyGsjegJX?=
 =?us-ascii?Q?Ur3KkdPaZUlq+xkK8ctt656lP7CM6j5j5F9povlP7gc+TfZWuXFXby6FSDxn?=
 =?us-ascii?Q?hXe1bCH1g/PuH9RaUpPj6WerO9VNB6fwWLBcXaGdLFiiJrDePE7a3GtTr/Sk?=
 =?us-ascii?Q?8KVRWWmIo7zulMvDGHBNXUXaUS+A4bbMb5xzDWgEgS2AE3Mt5Ty3uD4ciGff?=
 =?us-ascii?Q?Es34qBeLXzwetdHA2IPC7sDsJqAiOUJeWpuCpD5SLQ7b9jrZ5mmYOGm9A/IO?=
 =?us-ascii?Q?f7gG72bM29X23KIrp3HDj+/EpekmVsyVEM3Opf4U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6e4473-f024-4f6b-d261-08de21a425a3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 04:30:02.4533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ImHMOtI9Q5A3QRfYvIKgs3WrckprDxxPTENnfcibNCPQ3pfyIurTo/Aq9rKByNYvijRpUtrlmuW/nNl3cyjRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
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

Implement Display for Spec. This simplifies the dev_info!() code for
printing banners such as:

    NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 802e71e4f97d..7fd9e91771a6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -180,6 +180,18 @@ fn new(bar: &Bar0) -> Result<Spec> {
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
@@ -206,13 +218,7 @@ pub(crate) fn new<'a>(
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

