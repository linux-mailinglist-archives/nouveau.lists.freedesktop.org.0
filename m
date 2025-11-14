Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F6C5B046
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 03:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45810E983;
	Fri, 14 Nov 2025 02:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r1scG7mf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697E510E983
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 02:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc1RVixW8BAC9RFqrsxV8AvLKNcczWze4Wq2TQLlMOVdIiIrz49cl07eVe11ITObHligwJ5HtROJDEMncO14tqPR5dnd5Ij9fmKRzkuxLzuk8AmEZ1H1/WVWBDI+lI/D+DkKFQfzL6NZooo8QX2aTpFdR3ec/jmuXAfccObvyuDZDk/BmZr/VSKatwxIs80dD1WJ0Nn9MUnTgANSVDpOIzatsPqXLo19YsMJQENVw9tKFPYkKkVVbAe/cAixJtmt+eSGf5sHGXYtje8H+87a0nnGEOjlHnIE6M1PxxJE8vR3GmhHkOh98zYKRCR8rGhuUrfplwKns+a4JvX0HazY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=191FvbUz1bYnkUEDy7Y2j44hUxEyd2BaZjVrdeu/2p8=;
 b=Gs+l3LVnF3SJAfQkqwNqRPC6c+p+s0D07rtL7Ak6nQrMuzaCj5bYXo7nOiwY5rpw8dxRb1t+V4Z8hEQdQGQyYaNqeu5BeAxkR1L7X+vWK260KgyhyU2c0XF9lkL2GD1i9eDOAdGJrO5IiAkDF/4p4EQfiLnEukEhsZ1YhtUAvUgzrftQr1cTFqf9/CJzUSYwF3iq5kxgZ+KEOPDiNnYh1oHYN7BHBmfNhhDewyh9pnCzt5UczPtoPL0tPqoLvqKGv44M57AHi5NejZWIpA1t/G0KyzRpXh2+DID5RlC5NHTE8mCS6oUNhP1s2EhL4OMC0YuyftDWqpfnLrpAuM1wRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=191FvbUz1bYnkUEDy7Y2j44hUxEyd2BaZjVrdeu/2p8=;
 b=r1scG7mfu4MuGrJyDxw/VVzMeJ68g8wFu2o+iLx2Jr8CnrlmQ/ej63ByIiis1PpLVvOMI9C4HQdV3KEuAAzoFmAUvRaVvobr/hsVFEHqSZPNfWlRniOvFr13rb1p474oSnQFjynPREDoRA+qYyIx9DGnIc+88mJoLZjNbTcvUsNvn3v8C2GQa38/6FLdlu32c0UrXbXrMykf9wFzfJ3rFUsGACoQaKHttCoxbhBZiyUrjEXOlS+1AsS+kyI5hZT785K3PdfHaX610aCj7/f7EJyaeYibg262725ysyooFS4mEF//Ytk5jiO5k8LZhQBc5WWdhm8OjVeu3v4zz2fwxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:41:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:41:12 +0000
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
Subject: [PATCH v8 1/6] gpu: nova-core: implement Display for Spec
Date: Thu, 13 Nov 2025 18:41:04 -0800
Message-ID: <20251114024109.465136-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114024109.465136-1-jhubbard@nvidia.com>
References: <20251114024109.465136-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 61990430-fa09-4154-6e5f-08de23274621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?55iptVwLA8ByOlIa8B2PJqDOBas6mCkOY/kAu871+mlgAED+97VKEiOR2rMG?=
 =?us-ascii?Q?ZBaad648hJNi4XKYJ6K3BPwqzBsTRpEX5LqBTU3uHfG/5IpOE/YMPE+oE5iv?=
 =?us-ascii?Q?FaymZvZbpN2N+C9e1I8/QA1F7s6N9In4LrnPjNlPK6Z4JEAXoaRkG5KIa4bD?=
 =?us-ascii?Q?ZaH2BGQ98waz6g1+pq0p5ciFZSf64JqchYSpRDG1U9yOu3BPrybNxSuziBEu?=
 =?us-ascii?Q?mopc7i3eq7GMKmsaHeSYg4t6hnqX4VgykTPc9TpW7v+d6e9i1B2/sKUugAte?=
 =?us-ascii?Q?ejmaeakSTaQg+eMXXXRKJfeVok63qH7hcwrKXWzAexfS2E4i2oyrN0vWz+kf?=
 =?us-ascii?Q?v5xrAPh1t56RWRZelo5XZGPQ655t/fv1UNlEiTZOgfAA8NUjoq0ar4fMuh7M?=
 =?us-ascii?Q?pgx86iXNZVHlZWit2hwtnJJ9+9qQF4jFl44yEFB62tUCsEN7h3g7x8G/2iuW?=
 =?us-ascii?Q?V9Ezb83MeuoY9/BMoPqNfhlkDbk976trW3mNDoEubAql+dEP1dVrtQd87Siv?=
 =?us-ascii?Q?TMrff/0Ek0B8TzxzVDFavYRVqUqC+twBhUuJzZO0krYcFmhAYpdUgrbFYGap?=
 =?us-ascii?Q?Sz6mFGPjnmyE+sVREpfyrkbgeXi47OyxfXAOEx/S0bwhC1QQxlYBMvwiH51c?=
 =?us-ascii?Q?L8sIsvJBa7A27AZMvFVva8bN/3Nobxxs9k3ANSpKwknnNylx2HGG1VsoXmCq?=
 =?us-ascii?Q?/PQo+9YI+OykrnYDkNzbU0ESbhuXGZrBk4L9iHL/QQrBHC6c+1+wjnwC3P+I?=
 =?us-ascii?Q?EIYAOxj617I1xMQEz4BOhvW6T6kYGpNV0QTHXkhLyr3B/tyvNGFDfjnHTqir?=
 =?us-ascii?Q?v6fQF2SSysPw0xaXl84OJIjvUWHFfA6v+0C+16rjwMgjjMGIQ8uimuigTYot?=
 =?us-ascii?Q?UkpwKc1XAqC3kaA8ykYxBA5O4Uhh4J/OkEmSOJM7sjquJKEzaSAPH0YNQK0m?=
 =?us-ascii?Q?hmwm6B8v91kFykMGReHprgsa57VrV++ZTJo5Sh4MqkTEH8bTftfWCd96ZwO+?=
 =?us-ascii?Q?3iRJjB5h9RmTKI92CMvzygX8f0t7dUp08i/SjwhvDOGNDFMpBL4BJxFYAhs0?=
 =?us-ascii?Q?BEMBCOchxwtX2A4EsiQL5xcIC0P6+Zall/lVk4anGu1fpayK82iH6LJXRzw+?=
 =?us-ascii?Q?Y90ZLdYymAr5DgDUGn6JIitysPCMhmPhRLV2hN3TWiw4xzAvove711S+5N0X?=
 =?us-ascii?Q?aeYToBlEe4OjgYHBEPRx6YvTDCVA2e+KzAvwmJqUrqp/fdeaANBIo0LEga3x?=
 =?us-ascii?Q?xGoQlcFHd1I/Qq02eio208st/e+quaVKGlkQzYXIF2/fbCjkTioOvLFzNZjx?=
 =?us-ascii?Q?0WKmsFYpspU9twAKmk7emR33vwm59AjqEv5yq68V3v32qqFZW0n0Lvks9PrR?=
 =?us-ascii?Q?+ArKDWlZQSgr1yU6eObScyhycfit7PMoVKKUo4pFN+JUIw8Oc5UYCAcLEsyA?=
 =?us-ascii?Q?EAaEX4wh6Up/DrVWZXokrRyH4L49KWVV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sVmwAS2GrSjIWX6tTAVrMqzzuelUJM4p3WC+MhFnGB53+RqCFbNCF/3BUQTK?=
 =?us-ascii?Q?FcnoSozfWIkc693U0fwrWrMOxlpk1lYb+N3vXOY810en9phvPghjxcdbIzdG?=
 =?us-ascii?Q?BSA1GkmaYw2XRXQez63aL5TS4w5sakZzuGzEc9VNv2NzzVvPzmZHkUaFpHom?=
 =?us-ascii?Q?M+Ti8cD6w2ZQHLuE9jAe7lYz4V/MANU0iQ2wNwkv4WJh1kjW+wgwTs1dEawT?=
 =?us-ascii?Q?U4/Q/H9Sogm2VK9a7zj7lBNWXx1br5Maw4y9ZwNKYMdlsX42D2FyExYu3sae?=
 =?us-ascii?Q?PIDH7PSd3vLt07a4Ebt+S0Ea7uJUqv7Vvty2m6bnIKwUCyvWPSbzWGZJmt6S?=
 =?us-ascii?Q?a18hA9Nw19CXyKuB2o3KKiq5Y+BXn6IxI2KjxD7uhVm5wh1BvmGIFn3Qms9/?=
 =?us-ascii?Q?u3+pd/G3H5SgZrARGbb7zxeiuGN8tdKD/KRk0RpUVE/PzN2/jvdG8ktL6IBv?=
 =?us-ascii?Q?4joO/C11QjGrYkzoZJ/TC8zZEdCycq2S/acU3QUbbDgZcQFa16zRlQUuHQZP?=
 =?us-ascii?Q?dqxi0G/4SG2Ny10P/Rg271nxnunhvNHroMeFpJkc81gEVhZnX35vVisOOl4s?=
 =?us-ascii?Q?3euuX5k9cHJxDTNFfnbzJHV0MLNxhhUAWpYROHWz1M3nBHqAjMMHxMHEZ0Gq?=
 =?us-ascii?Q?7KHL+iduasiYBjmuIQDXny+xQD6hoyrEn8BV1INfWjUJDYC02QyIdmoJyPX8?=
 =?us-ascii?Q?Q87PKWRjaIW7w5BfYL0DbWNEaUiDLWOCpYeU0lmyNn2thu3cKBr/v6pifVq9?=
 =?us-ascii?Q?GEsVYsDnw16QvSAbzCJ2jWlFHDjFTOja5H4OJzVdeJ9WAl5fy9yYwbYf5jq4?=
 =?us-ascii?Q?HfAKWVYh5fZoJsRNUuVd+yepjXl5RPiPjF9AO2AJ7KnodqDzPsglB/H9ZIqz?=
 =?us-ascii?Q?K/1R928NCmIvXHciN4U668EBvo/1+Xem3rJF24zXwRhoBnfEITcnNsfA4vkX?=
 =?us-ascii?Q?tWJVwlQeLp1u84ngYxevdorA8HUt/vC8nBHIVBF+jv7QEyLIW4CoRThbqbzR?=
 =?us-ascii?Q?rdW4RSWBwGSMoB4uANsOBv5NTkxzLqSx9KhVLqC+dH0tAtOCmerPDmE+iHtA?=
 =?us-ascii?Q?DO2SpmRaQy0Kc6Gi8OLz6ZQRZkIyxm1438p6CNmOM8WWxHwbwesC9IwjGqSm?=
 =?us-ascii?Q?AMt7lbuj4lZamkBAVCFBV04PQT8w2zQNU8Bb/1v5mRVdfl064we8u/iIe/H6?=
 =?us-ascii?Q?HjCF+JKfxO/jk7hyvjaJw1dzFb4RTjy4LWGFUMYXtqGpurCwM+4QEPwbQ5ca?=
 =?us-ascii?Q?Sp+BYdutWUMl6Gt0JBJGNJNbbXr9Xw+aLJB85whAJP0ubIOVlq3wSynktEWq?=
 =?us-ascii?Q?+QC48wTT2wo3GmuroqXTzDo4i77HQ840rJqzUj9zMq2RxlBAF7+6Ys2IIItB?=
 =?us-ascii?Q?sMBUAxMnO0vDkbqu6mmitddx5VS7hTDlgjEt6X06pHdBZsCn0MT0QgTLuoP3?=
 =?us-ascii?Q?sZlPFV2y36eSXjNDBOt31qYcb7W7IljeKyXGJ0u94K9yKaNw4R5Zcr88bwG6?=
 =?us-ascii?Q?pkMssEPZ88kKAqx/qHmDq3H6wg0U71aDWg5TySHMvu7OKkkNfr6S26vJG690?=
 =?us-ascii?Q?lXPZcSbiS7ftTEWDZGSf+6CRXflY74PY5U7ijHLl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61990430-fa09-4154-6e5f-08de23274621
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:41:12.2018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjM+BuUYAdSgbn1/uBKEAgeLL63FxJTMwnBLAMJEakegJ+CMsQtysoN+lANSe7PXwEzwjUJvOKStpK1ndHFY6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986
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
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
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

