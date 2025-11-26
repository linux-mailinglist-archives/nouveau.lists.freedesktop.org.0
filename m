Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C54C87B76
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FEC10E4E6;
	Wed, 26 Nov 2025 01:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FTxL6rU5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C49E10E4E2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 01:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXAbzqmv1jWfd8ALKBbkay0Z/kkkjaOr3buunu4749Z1ZUCblH2A5So3wyuVYll3A3QIOgBBV60yyJkm33StZNhARPdGV6nycfDFtgxOeAg9sb9U4JRFzBEWDuwXf18oacEa51n3pyLzU0tyayHat13pk1i6krpXyQfNhY+6kR8H68HMZeL34wExu3fZ8OMHHrjK8pyF3C+Gm985eyrBKbmhNZ29m5N4MqxjH+HvSw4flVMcoB1LlR/7VF6b+HUnVkvVod+3ujIxhLY6FtijwaKLlfsyfrNlCTm/e7nh4LEC9mbfd0MSXlDnNrKFr4ysmefqu91qljIhtDLQeXBSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+P7Y8Xer31zLZMaL0KBtNkDpAvUwi1/CVg/Jt1bYAE=;
 b=EgqVCr8T+AEAmZW3gVs+l/MchB5C9ux25YVsCipvQAzfiMVOcEteaPMua4WNEuS/YkcLAXWXSw7IU9fbN5K2sVoX5HhkfUE07ARNDau+FREXr5J1Qi0CWF8j7BOXUp1vXG0x9OvQxIFoNbXQdsSMhMN5f546zgSqZOwtxvoB7kWcPYUneCsFR4e9xdNxAq2ADIYa/XDBtJmUrAk8lhVsS26Wq/pt+sSwaxYMDJ/H/1VAkl2ySMXCxk/pF10csCjMLAi8dYWIt+S7sj4v/InGzzc8CSi0WH39nF1PyQ3RDS3pgLuAKgvHnBiL5p7QJpCqOo9bfEhkSUjw5qDbYiPs6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+P7Y8Xer31zLZMaL0KBtNkDpAvUwi1/CVg/Jt1bYAE=;
 b=FTxL6rU5Ibbki+ClU9fGfpN+eKAvBYXqof2TJIjLc2PBdcwlBtq383Gv8Pm33wZ5r7P/rOdhsPPRm8VZCnfOIiIa70W2b698xR39bcp5K+YKaxtTBlKROvgVyOS4Q2BwJYJxDJFaz42GBgdilBB+DATWbjlySyRZmnjX4A+M5H1cTumYN37aSwzP6kmJru127d27EmQ1HdC6RG7FbdTYAKWGtFnQ26pK1RYb12pxB5Yb5hkU6/4b/qSW/Qz/4jhSSBFIiy3z/rPoIgwOtTjTgvaGGa4z8I56wD92Nu4I3JxB46Qggufwsu5oegRFrku4pFGpfoaDQT0jMIi5ZelRow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 01:39:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:39:41 +0000
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
Subject: [PATCH v2 2/5] gpu: nova-core: add FbRange.len() and use it in boot.rs
Date: Tue, 25 Nov 2025 17:39:33 -0800
Message-ID: <20251126013936.650678-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251126013936.650678-1-jhubbard@nvidia.com>
References: <20251126013936.650678-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 8614629d-d995-49dc-20a3-08de2c8caaf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8QRaNd1Zc2Z6cqUlC8mCtIAxAECVm1BY6/HB28iP3zi+ExmgFbZB5tLziGUE?=
 =?us-ascii?Q?HrJyiCoR2sSCBaXStzx/j7QiLo/9zecXGYTbwez8E7H+WPZbYYDy6ErUGF+I?=
 =?us-ascii?Q?4fWJO4dLXF6em1wk2XufGdiTrcgln2HgPxbHk7HTajPfnpfwEspq5GMWOAps?=
 =?us-ascii?Q?REbAlLLPQxHWY2nyS9ajaRARlDyptUcO8dqYT+W/1Xmqx4o7o3GuLWQO7U24?=
 =?us-ascii?Q?YS7e0kbGETdvzi0zDMsk9kazdldRTyzxXrZkEkjBV78oeFkfM18i6Py5Rclj?=
 =?us-ascii?Q?A/6p7a6l6S2zFUaWX3CzyIwKS4Gk0tlr1OGDUP5RfgxtFMIPTQotn+9chJZr?=
 =?us-ascii?Q?dXLpL2ARmSLiSN0i/5H7DNnoDkfpzbsDVBa1Qk286HAiKN+3k+cv1QsE1M+h?=
 =?us-ascii?Q?Eei1qz79C5Z1kfqs7bYnY5ky7wSho6qJ9ygxLv4FD7UUh1CqJUOBCvNAKfKj?=
 =?us-ascii?Q?mUoyehBDlpmFizaNcQyFd9mjGd9H5iS8hbUrIvJrjTI+4K8fv8OvGSf1Z2Nl?=
 =?us-ascii?Q?uNI4nILOtQqfcnU90ROQojbkV3shrixOBbKqHo5LLK/p7MBsMDyXFTV3/rrY?=
 =?us-ascii?Q?IRMcXcdEevT5GpfAUwn9VhvHdEjvy1fjRcIT38wMqfa8QDgmddtYT8rcCKmT?=
 =?us-ascii?Q?7nO1kcnkxCdcILPF8iXPCnjXpCsIy2fHwKsQotSyuNfAX30J6bU16UuochFL?=
 =?us-ascii?Q?f+jXescbZgVkZKV7KgUF5S3kxR7m+ts9iMofoBT/lJt+pHYAZFfyec9x6NmY?=
 =?us-ascii?Q?EulX+ZXgGhao/U5IynVRVAcKRuQMmfy05WzOI6CxtrpeNKLGjprqw8VYHFM5?=
 =?us-ascii?Q?qzmTvGSaRv0BGX/9SJqYknuGFTzw5anXL/65VEjF4bCvmRMUkz75IILUVDGl?=
 =?us-ascii?Q?lAd+DzkZVtTDwy7GT5l2gMrKFYLTQzRfLqFSrzaGmrenZIuUfYg2EtiJ1dHk?=
 =?us-ascii?Q?9ko9d9xTG7wVU1C9LBIEMooXLhMNUv+jAqXF6IkTp0SIOdze8Q7BcPdden4+?=
 =?us-ascii?Q?mK8mk2J6tdZerA+uXqVuHQ791eZRyRMrOwF9p8MLgbNBE9y9p2fbHWLk7cuI?=
 =?us-ascii?Q?P2+hp0HcCBelZDZ7Xr0VNY8gERuyT4+k9hFYHGgkYPhOk1mkhuxJdPjfaj+K?=
 =?us-ascii?Q?4id6KTbxSH/v2YvGM1pIO+Kjgj0ZFku8eSOYEcKz0POAyy4c7kapP4UFcNyu?=
 =?us-ascii?Q?h4bHfHXGJRDOcL6pFbmEryjI+ApUeU4jbbtNDiWPpqBV98b3ETL6yelbKw4U?=
 =?us-ascii?Q?B4ntXVoAzlXccwLagUMREJApn6Vv0rXyKzSV1sEQZc8m2fHspQF5j9vE/pL2?=
 =?us-ascii?Q?ywAU08ddSqYVf9izrKGgGSQQzsw2lag+GmU/NnfMZ4tAeZqIgXnOvhduqn2D?=
 =?us-ascii?Q?XQfOndoaNiKiLatbrrT/U5KTYXwz8eJu1RnIVKURJZc1nLo48IkdQEN7S2fj?=
 =?us-ascii?Q?lObtRxtqyQQxEPJNGXVodLBgKbvizxc8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idtXtEOnWroMU0KXRcj3Vx/oBXs3OWA6Wg8nVml376rY4AjUjKLyrmhFPTDX?=
 =?us-ascii?Q?yX/UyozReZv6f9TscZ9mzauaJ97+wEJe4xYL0CtXjtvZvmGwc9KRHhPimf4+?=
 =?us-ascii?Q?57HbnkLYP4wpmX8+1bbmF0/2SzLt47jWeAP9fNaX4tEvwmXXW5uA6T3JGU8B?=
 =?us-ascii?Q?hX1ogiC9nAGcw3gNPMOwM9AOqj678q8kGhGDJ5ZhEniv3sjbrq8QN7L+vpKG?=
 =?us-ascii?Q?Qhzs/8Dt/9d3gUhLbDP9aklFDFhv7K0bg3fxjrW60nCqrHQUXkKb5B6Ck9tO?=
 =?us-ascii?Q?MflBuBzsrBXfJ/XijtPa43PaRt02mHdsAp77WGs+Eolxn0cqK8ay0VCNK4LL?=
 =?us-ascii?Q?h6nv+3MdPI1ScaCi07Oci97YeCe+K0IpHUY1u0DjV8CMUJP4LOATyD8ebdXX?=
 =?us-ascii?Q?XagO7i0Rp1O8fp11xSawxAABzjWyL3Gs4dpRx9p6bXsyz1M8/iSLXxboUNsz?=
 =?us-ascii?Q?EqsdTWwtiM4EyNLF0EF/KANj5XCQEK33NOr6mC/oPsM1rhaEa7fHqKQLxQrK?=
 =?us-ascii?Q?iTy+U/3ogyc2Ea0lCcqi5SGBy9qvf2+xpdqC1qfocy3XXZMt1x1KoqFTAg4J?=
 =?us-ascii?Q?A/uked1kRTNJQIoydWGAi847FJJH3cS0LyB+Khv+6GynhBaT0nZeFHEBT1cy?=
 =?us-ascii?Q?DOQAYGq5koqLeI/jR3eKmVCQixa/iFJ/vr8OdKvrRA5Xz+tgBELMo9c5/35T?=
 =?us-ascii?Q?EAsxHZQvMYJxvbwBVsxzSqzJhYP77ASaHBRP5vybqzRU4EqGEGFr5a1TuudB?=
 =?us-ascii?Q?ttlsed/6SXD3e5+GsmUAJ3pX8kmJSPQO1IhlgKAM4XnljPDGPHPXooB83CGl?=
 =?us-ascii?Q?8wOeqeELJ9dpTaI8EBNavbwjT9pfHg2HG7DxdGNR7ad1VxJa03Oql2o1gS/q?=
 =?us-ascii?Q?ex3/Py/B5fctPTPlL7QMlD7H7KVeZl/BCnrWUc2W5gxnfeyje1yVShPJMJfa?=
 =?us-ascii?Q?s4Dtn/EOsSNFQenrl/EPWk9XTjtuOQ7x73wENFKxYNXoiXZKl05kc0KMpAOG?=
 =?us-ascii?Q?0hySkYEMNpJ3oHDQSgLApADHbrWpg4LfuOxDuRIOUV6ihu0sqNWAXG7919Qk?=
 =?us-ascii?Q?U/s+GC4KCgChYIhmriixKjst0TveKw67aDgwEgW/pqG3DLhOOGdZwkcusknN?=
 =?us-ascii?Q?nt9omP69CX63lkt4CzgOQjyJ7df65untgEmu5BsUhVaYksTe83L79uPWce0F?=
 =?us-ascii?Q?+YEUCvfh4OYY+Blgba1UJFc/oiRuW3Y0o/AS+braMQ635sAdb0guAGrBxXnK?=
 =?us-ascii?Q?B3rwxmgcI1EnJu7G4XGQ9aFZApN9umU/7vZx1GrrLdk+z4iR4ey/l4bZLouG?=
 =?us-ascii?Q?v9Y5QYMe27NdQWNAC+M7+iaHuhmZQJRnNOd6ZNJqLo+WfuD2uKMrcxeraMnX?=
 =?us-ascii?Q?TnG+SefR4BxCKbUv1WGj2HUhik54JGyAeOH9XdQQKf72iTgoOR7O8XGVw84n?=
 =?us-ascii?Q?BT21GehHSU7aO+DavwzVDrtjnvrSRqUXKnLKUf9LmYZOv9USqGLxv2l6mbco?=
 =?us-ascii?Q?kPCwm55RupkPGDLMZxlIVfrCescbx5CUq9IRrS+3U9pS6ha+OStEZjFPiYoZ?=
 =?us-ascii?Q?cSafiTDIZFWAl7sIGaoH4jeG1RYwoKaxTB8+HL2p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8614629d-d995-49dc-20a3-08de2c8caaf7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:39:41.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JS5G0R2oa1I9/YP6CV1xgEqCXyQAsJJ4DSr7GFlsn7Hj1RRPxpP38Omht3DK/0P4Mquj3LvHyI7NDBrmWBpmOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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

A tiny simplification: now that FbLayout uses its own specific FbRange
type, add an FbRange.len() method, and use that to (very slightly)
simplify the calculation of Frts::frts_size initialization.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 6 ++++++
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 333e952400e6..9fcd915e12e1 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -100,6 +100,12 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 
 pub(crate) struct FbRange(Range<u64>);
 
+impl FbRange {
+    pub(crate) fn len(&self) -> u64 {
+        self.0.end - self.0.start
+    }
+}
+
 impl From<Range<u64>> for FbRange {
     fn from(range: Range<u64>) -> Self {
         Self(range)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..846064221931 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -70,7 +70,7 @@ fn run_fwsec_frts(
             bios,
             FwsecCommand::Frts {
                 frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+                frts_size: fb_layout.frts.len(),
             },
         )?;
 
-- 
2.52.0

