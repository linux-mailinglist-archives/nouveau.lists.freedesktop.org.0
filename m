Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3176C12AD7
	for <lists+nouveau@lfdr.de>; Tue, 28 Oct 2025 03:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F6B10E1CE;
	Tue, 28 Oct 2025 02:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RlvxYdVp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B1710E1C8
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 02:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUHONMYcqyxWR4T8kysAbPksuTMTjDBVV3n0LIo3aZflkBvTk3iZu3bDB2AIxwyWsVu32WcYvqfvuGeJrLbWjnjh+zufJHcS+XKJ7mRz7NWzbt0YsjZJm0cts764fybeZ62MJPNVbpv1Ywyz+FQkDkU9MS7PXAPJtX6J5drJkT5LWubdVY2vkeQXgcW6vYx+0/LRueK0Mk1t+8yRPh9JEu6mtEV7HfXj7tiCikFpipCSclkFfsLqMYnfp6B6A8ZN+72SzNWwTNVw5O+X76jc0tacWcU0TY9F4uNcKc0zHGkr8T9b7VR6mmJFVj4St2XVCMSF9AuIpAduoH0hRsDnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3andDTqUkUiCKm50lljbV1l4Bat2GJw0OlspSeiiFY=;
 b=YRgVFaD0qqwtZCXUCA0BDY36PoNH/09V0YagVy5GDC8Hul7ph5a5Ohvp9PHlqxUqchGda9EZoGYDoIEvpUdxdcB7ryNe0jJu8RoWJBRV3G8GERqLLabipGPnDJYtHZeTxeMzcv7qXpmc8W7BpyAnsDYh3jwhizNEyW/dCM8qWbffNdUYZANy/pYFTqC9bjEho8MeHqi8oZe3PCsFaRcTC5iZmTOxwGkZDcVPGBmUUlJzPhxGo/jJRPVe63Q/qe7xGr0uBCTQZ9JjIAWyNpceKxW5Gh/SOCKzzl4Ko86uPVcPwIn5f7MkrVrYXCAW2S7ydrx/7EmCBkHiHSy4kqE62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3andDTqUkUiCKm50lljbV1l4Bat2GJw0OlspSeiiFY=;
 b=RlvxYdVpBTwV8rX+0JxCZ20aBnjwiN4tCmrtbEx/6jdkub00RGLGmX/rbpqiwzTE59eeaSV4lZHwhgz0rYs7rTYdtegRH5WjqC8b5V15aag9j6yC3dsPc0By5sqfli+m+iMtVZVa8AjdVUSeI2B6ikdyx8IIO9Lwg8Naz8ZZhByntL45nOkMVSGToH18sDKwTApkZcV8X4FGGnIuGS/5IgIgFl5U9rhi5uWGC4rPq835eYxByRW8p8jeiTRRC9Io8cEvOUEGUAmBtpSA7kzBuhdyefZp8vX6BSfH571tiAxOlBy/QT6n9xiyOfJeorhbtr5A8Q5eEGJsbG3VzI+eow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS7PR12MB8346.namprd12.prod.outlook.com (2603:10b6:8:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 02:39:40 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 02:39:40 +0000
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
Subject: [PATCH v2 1/2] gpu: nova-core: merge the Revision type into the Spec
 type
Date: Mon, 27 Oct 2025 19:39:36 -0700
Message-ID: <20251028023937.1313108-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028023937.1313108-1-jhubbard@nvidia.com>
References: <20251028023937.1313108-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS7PR12MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: cd65ad2e-23f9-4313-fc1a-08de15cb3e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZLUwpE84f2e88IIe8pRLomCOcmwU9yjkBYzmWDRPH7smDolzK5NykrY9gVB4?=
 =?us-ascii?Q?9Cv9NFz4Rqv0XPzhlJgUP2rbnOgdmtRqaWJnpFxesouiTci7t/WeMNkPrec1?=
 =?us-ascii?Q?7GIgQFf96lrYmXjBk6CLmKelpRq236XkNOob0Th/7iBB1VZCHUFpORxbmHPo?=
 =?us-ascii?Q?Ju+uJL17SQHhOOiZV7cmZSaeZEXLnUIsUAEwrG57QRPgSHBwZ5KKTzFosRuZ?=
 =?us-ascii?Q?Ig9rxXWotDBNU4HA/uBnENlAVCGXeseHTVUh8U/uTFlxb+piqqii30azMr1l?=
 =?us-ascii?Q?mzTMIkzmRRluDvjmx/Fwd91Pnhz7h3NXnrZqnItWhnCNZHWbKskOReJ3yJxl?=
 =?us-ascii?Q?QGalgJ+8f/BYbuZ++b18GAMNCSmvySNp/mwZdVczVqt0aS/1QEFilItjQ9IN?=
 =?us-ascii?Q?bIh4ICyRq0ZSMuYZWjHyotB06VLhfSt+/IHL0ROBKMf5ttfVoNQ3HBb0+gqI?=
 =?us-ascii?Q?+F/GtxnAO1wFe5KvrT4AuvzL1Ftb18jMI6XK0f80AZm8+f0tTQlO36dqiG9B?=
 =?us-ascii?Q?2xCOj6zB1TTuKO3aqf/Th9ueO0OhgOPOBZIT+PDzGTbNYshf/VnhvKGdXVFZ?=
 =?us-ascii?Q?nXl7yDIpUoN9SLRpGAkNZYv5kkx9/xY6y5yB3noZ2zjROhA+xV2DK107EI0i?=
 =?us-ascii?Q?ypIookNjO7PhumPWxq+Ugvy22AcaKVJuvB8acnwNJh0aKFoPFSWzRhJzsw9E?=
 =?us-ascii?Q?zo12tSy8fBh3G1NC/z6ze2v2a1VNbUltEAcxRlMP5ibA2WWyTpBD+k6mZWXu?=
 =?us-ascii?Q?xciYpMsdssVx2GThv0aarH8AXR9YB+Hrix+OVpahGySWmKo77UUr6wx5MDBg?=
 =?us-ascii?Q?rjEWvtSgJGnU1KcFkxwZktHqJAZ431ZzQiIKe+qDOgN6DL9Qf9jqFogLzDIp?=
 =?us-ascii?Q?O3uRxQKQ3k5LA7uv6Ov5QU4ZAW7Pxia59kJwYROk2z99loqjEJceOFb9PCmx?=
 =?us-ascii?Q?FyF5bFDOR4Odu0ylWBTrw3N7N7uUW/nwQKck6FXbkJEfMb6ML/b3Y8zhF+XB?=
 =?us-ascii?Q?/028T0swakP6TSoyqCDE4nMVsY9NqZqi9Y3J9CeWmbfdQWavKax15+B73/2Z?=
 =?us-ascii?Q?xOiQFIeHYHyhtp9sXN6tlLLvMRjsm/eWBebOw9LJVtIpDCFlwgMNIQrtERWv?=
 =?us-ascii?Q?3q8HO8UzvmVyu7iMKX/5uJbjW7gwpbEXUDliKSBPSyEODnZokH1+uIwQefI5?=
 =?us-ascii?Q?WedN/9mnwMGBfcTxUe/YxKmN5D8AG4gEXFtXd4dikEQYcJmbhlXFVIhHQCia?=
 =?us-ascii?Q?xcgeBLWLhhB6tGLUgoUK1fS1c1w5HQ9jRcpjCXGDcsbhwtMP8d2CBbJUkubB?=
 =?us-ascii?Q?PNRtl/jntyU2SLKWBdG948eYP9d0QLkvlMSccfhlgZUaXoMa2BHvS+bAalcl?=
 =?us-ascii?Q?thd8AvEgpNZbm5ye0utzhrfaCLdyZqbgDCxCATjimHEzy0JsQSVcCEsVNfSu?=
 =?us-ascii?Q?M1NnlGnOiXNzOvIyy6LuqO585fNH8bE4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCiMDi3GDrG78WuxZ2oz6kMehix2uSGTgcA9wi0IA0yM4NvgpzH+vQLzS6Ru?=
 =?us-ascii?Q?Yha2+m+kgvH38pVW619CiZqbx9hIcll1RMGqfyaYwTKLOFBNf+cOEB6Tws54?=
 =?us-ascii?Q?DuyvI6tZd10eM7bw/ckDsqK8DT7YAMRH/5mjsEYma0irPiRmMXIl6tydWaEr?=
 =?us-ascii?Q?9W1zQCNYgV6t2QqREalaCa33a9vHSIQJo0uwMEBq1xVG08yNeetlbPRoSrAv?=
 =?us-ascii?Q?yVVrJVldWJtlvRD09f6du7Hhed83IeA9MPq3rQlfwGlklZL5IN9tbWsIDIB+?=
 =?us-ascii?Q?vrUigroEE4rBznlsn28UmbtiMYrXI9EX4B1TGWR4SDVww65OnjCA2tneNrbD?=
 =?us-ascii?Q?ZL/csWxshC62Z0vJ0Nisd0BZeMDO978Q8KsC+mfqEdNTwBlRhFl59uxPHWjk?=
 =?us-ascii?Q?KYa1F5zFiO6upsbUCjHk1OJxn0Fxj8GjA/oxTsZ5ru5506dglTbUIwPGkVoH?=
 =?us-ascii?Q?2+RgG1yRmE+DoZ4LKudVakpnL/ofcfOD/+7OhL/vlD7OCwnNC6Z1jQ/MFDWd?=
 =?us-ascii?Q?INiOhboLS6hcXU8fcJh1hWZ0WrrhLFH0hF7FEyLCV6eMQQoCSAHV7j3N9WFR?=
 =?us-ascii?Q?qfVKnV9kAH4gz72LSb8uZdhcyirXnJOmnuz10S6PZk8xgZBFVX63FvpPwMss?=
 =?us-ascii?Q?Wuqt6s828VUE1eT+brnbRJlVsv6gWT5atG7CZrR0PcKo0Y9KBJLyL21CSksI?=
 =?us-ascii?Q?gPEOhGiPnvwqjqBTgDCB50qFx6J9s3K6cr7KzVz4HNbsTI9RMQwz1eZMHTEr?=
 =?us-ascii?Q?izjMFQj48lOdLVae+rN5moSlv/6N+gr9p91i2bhCDrkeSGQeW6A1SyQLVSql?=
 =?us-ascii?Q?3JXxfoq4xdbhnmOXw7Jffy5W9KZk1EsfZBVSu9eSb7yHCLGwdzRiTvGJTTdR?=
 =?us-ascii?Q?w2zZMzUV42BhhV2e/n02BtF82pJOWEZJ+Y7R7exLd1WNEcOoJ5NlieZnp9GN?=
 =?us-ascii?Q?MwsYvjGNymeE5bRb3qCPTRwyNBgfrLQcEkaxrr7y3d7vT7cOmh5uqqVhC12b?=
 =?us-ascii?Q?rhsa078cZ9sfpvrJeYy34gbX7O4WRSfZsMNtbdH1Y+bjZHeEgKEiiIZuvduC?=
 =?us-ascii?Q?bFd2AQTLRfKrIo2IEXDUrE7waoCqz3RH0VX/TfngXKsy2S5lbtVi6L3cU0uB?=
 =?us-ascii?Q?3H/+VxmtGcV+pgsiYqs/OLwMb0wW9lxqhnjWfFK5GXMvux7wR0rvjcQDna7X?=
 =?us-ascii?Q?RNo5EJ0JqT4e1s9AQyrmp6HfwvktQIpq7liOcvfa6qZAQQh48jwtBMNTL+58?=
 =?us-ascii?Q?AhST348AB3vcUIufSxZvyK067wJXmoEXeQHndcyXfEsZHcGJCSTroSRg1Pjk?=
 =?us-ascii?Q?Kg7ovoE4ziDb5x/LwMgZwLh26TLcbEHsdHcNcZi2hr3lrCaYOgTO7u10p2RH?=
 =?us-ascii?Q?U7DVVpaO1ebkamy0EZfcLC3ZFDAc2o0cRitB4unZbABLDgxmEAnwblDdNyzo?=
 =?us-ascii?Q?PfcUENNzyA3kzp0Hj696I1RSx+25BtOo0LpuQXYK5RclAIJfisVfyUWgHVP7?=
 =?us-ascii?Q?SR/B8NJekgKfkGPvJPGeGWTY+dTzPcrAbawPLaVD/Kdj4MvX7zw+TipfO9ea?=
 =?us-ascii?Q?AvG1D6NQo2OXajWcZLzCks4Hr05hGQfN6aSqqRPk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd65ad2e-23f9-4313-fc1a-08de15cb3e5c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 02:39:40.5191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAkd12gISnu/sjogdBQl7mALuU/YYvxkocFSK6WrTeHE2z0AQLdhkuXnTjxT4qbpmLa2BFg9ZUdZbgBCQz2sqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8346
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

Revision is no longer valuable as a stand-alone type, because we only
ever want the full information that Spec provides. Therefore, enhance
Spec's Display, and remove Revision entirely.

This also simplifies the dev_info!() code for printing banners such as:

    NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 50 ++++++++++++++----------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9d182bffe8b4..0ba1cdc42ba3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -129,31 +129,11 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
-}
-
-impl Revision {
-    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
-        Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
-        }
-    }
-}
-
-impl fmt::Display for Revision {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(f, "{:x}.{:x}", self.major, self.minor)
-    }
-}
-
-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
 pub(crate) struct Spec {
     chipset: Chipset,
-    /// The revision of the chipset.
-    revision: Revision,
+    major_revision: u8,
+    minor_revision: u8,
 }
 
 impl Spec {
@@ -162,11 +142,25 @@ fn new(bar: &Bar0) -> Result<Spec> {
 
         Ok(Self {
             chipset: boot0.chipset()?,
-            revision: Revision::from_boot0(boot0),
+            major_revision: boot0.major_revision(),
+            minor_revision: boot0.minor_revision(),
         })
     }
 }
 
+impl fmt::Display for Spec {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(
+            f,
+            "Chipset: {}, Architecture: {:?}, Revision: {:x}.{:x}",
+            self.chipset,
+            self.chipset.arch(),
+            self.major_revision,
+            self.minor_revision
+        )
+    }
+}
+
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
@@ -193,13 +187,7 @@ pub(crate) fn new<'a>(
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
2.51.1

