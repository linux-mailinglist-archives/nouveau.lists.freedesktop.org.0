Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A0C9DDB5
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326EF10E723;
	Wed,  3 Dec 2025 06:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a82yf28c";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7991210E720
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYlbOsynDvpy67zHuFPaHxgN56aF5GllR9jO7uj25pqcWPyhGyyOU2SpnZwu3oSH9pARHDgk8Mr2WDhO9shKEklAOGAj6YvQ8m8Y2ReR8wTOfspP4umeRfMa80i+RiGevEdmgqHt8nQicSynGWjFP1WzcGxYMDKCGL56v2mN5Zj1veGmzR5+G9oqeD8IEZKYY7cGJPxtteYtfDPEaHUTwKuDSmkLe46to5EeQJmmehiLVq8Tx0j+7Ib3MhW+YyfzqATszgVj1L+By9XKlL2zwlTwWYbwZ/eJLUwKeVZCurihWgN4ZBM9G1mea3ihi+6cm/23yedV2Dya4LDJBK+WwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdOEfq/4/WA8oFd55Dd2IZjvlGjNk54RHH4FoQyUuOo=;
 b=OhFjBGuduX7hLsCePpCIebyo+QlXE0VRxnLtXsK/11mwB96SjA8Pa/lVdZe4Xak5uF7qmejITDbeb2MWdkVf/tH+2oPbsVb9SgnKONoS+TkV21BAdfkrpclgna0jeMr68vvWrcCTjgcLcvCFQPRlgCdLiaXbEKjWWOw7zv2NQDK8P+nRlE6nTTGc8V1Hfnzjn8eMCmEqBeC5JliUdN272Ubg4Qoye5JO/omf95QKSSi92bv+jHyCjWAmgcvEaDSMDtPk1/i6hRMSraYIM4qmacr7QXyoyCsA9FRraDvLbUoxMDbxz1ZJPSlXrajECDpwfqdsTsm2GmKlM2cSwrs7YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdOEfq/4/WA8oFd55Dd2IZjvlGjNk54RHH4FoQyUuOo=;
 b=a82yf28cYj2TxeVtxsW5pyCqith8F0O11leBJ3aviDF94swjFtFixEUtU68uCWQKoNSt7nqL+MnElxBcPt7G3BkzU5bBiFv8+Cv2gBoP6o1hXA21NXFncowU0mgL/DNw6puBiFoPrWmwoM4YZAOcG0dqsOLI40OWMQDn3z7tW2dTthN2QJLSohke+XKt9dju6uHpnq0r8JUikkKxQI9lzU9BLBLDU+hwb4+7G1u7pM0j80grDvmV9Vp9ZoALiOHd4fXESN8cb6YFtO0oMOy5BjxawFYzAIW7f6N8dwDmJ7C2D2/P7hRIZhCjCbGl3Xqxskcz2X3EOKv01JbZRw4kLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 06:00:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:00:03 +0000
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
Subject: [PATCH 27/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Tue,  2 Dec 2025 21:59:19 -0800
Message-ID: <20251203055923.1247681-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9023e5-1223-467d-6d60-08de323133a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FdrYszBzOmMyP60cK+7MTmsJlDNeOwL9DniKSz3p7mTGOnRaT1WxgaIcBjDf?=
 =?us-ascii?Q?oXhxxEphqgehO4mdPxqminvBYtG5UJCO3l0dvZ0LFb9ZA17v5Pz8RILUyKuZ?=
 =?us-ascii?Q?Xy6/Zfg6zPM+pP2fOkrxQXKEwGXYNtGeu9rnwAReb0jLz15eSPp0z3pJf5NQ?=
 =?us-ascii?Q?eOAHz4lkpjU39KbNWK27xdP/FZGEHF+NsL/heCq3MGzOw7JHV2ij6CCAQNdX?=
 =?us-ascii?Q?caC6xwNJWIzXrQIWKvGMbCtQiyGiEU+fFHx0vywUQWK/8Mk+xwuWgS93hfPc?=
 =?us-ascii?Q?0qwAzHNFjT4ASyrONKjLFpZfUxf5QKmj1imc18xqgjqy717U3xm8ycWfEhM2?=
 =?us-ascii?Q?LcETGBOvD8zS23BII6Yj5fSLk0kgO7nBkF6Q8EtA55CvhrUq1gY/Qi4ER332?=
 =?us-ascii?Q?3CJISKEqyyV2zZr7dlW4ncLnutFz64tRSkwcZpEQbbLoESHBGOVTf+kjug4S?=
 =?us-ascii?Q?Xb7iB+C/J+3Q9mqko8aOmr6rkm0Kx0ovV0wllkslshi6sW8CB6rng25I4RB+?=
 =?us-ascii?Q?DagIRKg6KjjHbqq1LF9avjMyIUG/jyHOESDABvEdwtib1HHTu0PUGW0II+ZJ?=
 =?us-ascii?Q?fHJkGEG3JxMCVIfJEnivhxII4AI34wPaiIFoQCz6A5Dj9qzMIrvGcbNQAusJ?=
 =?us-ascii?Q?t8nv/kPhL53a8lhhHkCZI8jyDMPVPN0FqykTar6xu+LmIb33ByRkRao+MliM?=
 =?us-ascii?Q?a1Lr4Bq9Jp9QMYnHsSI4qCuxZOXQU8vNwKGicTUZtO9gaZUd0xdx6rTCo1zc?=
 =?us-ascii?Q?lWogiXom/Q1teT/Z2KYYoU48b00YCHzbBeRCH+5O/WGDIf7nl4VLIPYX8uFh?=
 =?us-ascii?Q?zW/lwRjaF5hqpzc1+DrD3fwiZAe2lD8kQauw+JEgyXFQQQA4aXtvbLpU4GZ1?=
 =?us-ascii?Q?um/EnVgB5dyh8b+uTAQGBhav2moUIkhN181Ns8N9Wu/6xk4dNh7WE/vePYiv?=
 =?us-ascii?Q?P8Kz85O/7lOSvggqxlUZVcpRrM+MsatNHlcju284VHzVin0Z6jN74aQXWVmY?=
 =?us-ascii?Q?joA4dmwGYSLieZSa+5LvyK5+yzhInbtzJSrnHeVD53A8pWwGLEMpCPP9ioBJ?=
 =?us-ascii?Q?WEkEfZ7w1IDwmHkepIpWYT7isBCcGPw82ccLSHAGnsZ2C0wiliOm07315x53?=
 =?us-ascii?Q?dFHkLZEIi2wDODRYHWStz/1gmIz7kn46Q2984x6AA77M18SPASgYBwG0Amns?=
 =?us-ascii?Q?RNgxxJC8QMGDxykAdWxiLnCdX6HWZ79XnW0JQjbmEPYBSfe5fU1EdZ5kHhup?=
 =?us-ascii?Q?CaJRwFYZrV1hQvjjmCuR/daMTAkvR8I9qUTNpQxPV7bTp6OmA6YW2w5ydD6H?=
 =?us-ascii?Q?+07i5/4vsXbSMYN3HveKXeC6bBW39zCInm3Wg41XfowrxoyH1ExJrS5ZWkIU?=
 =?us-ascii?Q?dP71uu7Xx7d6QhzRU6eoKV7Bn/lojHMk5J4RSay8JueNAYgALOooM4nDkxE4?=
 =?us-ascii?Q?xm+haMydF0kOAtT90YlFGIQFfSMMKqWx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dv4Rmgrb8FqGi5aInS8SOcyMv+YfLHJ2e0MMOSh8gKDmcYWwnwq3SU5WKaak?=
 =?us-ascii?Q?J4958WQ+IaqjXUg1T3yUFzGz6Cy2ft7HEJPJ8LYIHSdsciPcSSldtccfqBBH?=
 =?us-ascii?Q?gd0z7l4heawWE7XSTN0moK7fz6YbXT5OEXfsOq9Xm/XnvAOI1jEX39AW5MsZ?=
 =?us-ascii?Q?DjqS8QVL0wNhqS4AhThnrAUlwgT62Ns5fZoDrW5QQTjtZycaS6YSqxzs6ykW?=
 =?us-ascii?Q?cOKwYSZzxQ4zDpfglSrksGlUWiO6rsbaboJbqHyvl2QYOJC4Az9g07IMo2mT?=
 =?us-ascii?Q?WxJsxUilj4O0P1846jHNEw/XCIWlP+duUH1BvpUguj2Xw6Z3TjJGQdjCWLAQ?=
 =?us-ascii?Q?Jy5mtVKmnwWVyD2wlRCK95jgxw04u6e9DFp8Ch1ODAGQlKWA0kTWYxfrzizP?=
 =?us-ascii?Q?+tQ35d4WvmcZuvKKN+bOLOIYv+PM0j+wIdO253Hvwdz6VyzeDg0+CBP6JFML?=
 =?us-ascii?Q?HP/dvsV5Ke86+hBbJ6bml5EGloGpNYiaUzmKo5SV59ex9lc1bIhMtbS4MQYR?=
 =?us-ascii?Q?tYOKdfiHpw+mWkCHrp5An8HVHGOl99LdpeJ2twmLMkzn4JyaWRz5G1Zrw+bb?=
 =?us-ascii?Q?dIBnsr7y4aIrZR059SSrlCyat3+26zj1XEAxswnHgIQE9lSWfGfe0KOLGQuB?=
 =?us-ascii?Q?oqvyy7JZG3XQuA7LGyzjlK1uzlQxzndi79gXfeS5g8WIKVXxeoqVRWX2VTqQ?=
 =?us-ascii?Q?EN1IgXSMVepThttvQGfa8oMw3H9IKgLls6mX46Ai4BR8gbsx6X4w3yGYODpl?=
 =?us-ascii?Q?4yvcSFzLUB8MQr3kcN5KIeoBAzEUHiIvClKh7Y7YDl5bBUb4V0w1KeJtHHGY?=
 =?us-ascii?Q?IwWVblHu1kphrTaXt02FJhZwzKfIcO0CzP2jTWvSvOwqAJwzTLtXgcMSWK6K?=
 =?us-ascii?Q?Lv8qHW80nVt1mv8HWCCZftJVPTLeUrGQ0HIQ8WFZBu254ClLsZiNDcXWcr46?=
 =?us-ascii?Q?5/5dgfjbkJsv5lvwkRRQZUKpFVBk7jY7W0yxHr8Nw5XHkfOPBEW9zKCDV/kv?=
 =?us-ascii?Q?Y76kEapT4DZfYxGAKb+Xd0s1yLPhmavrQWmoptPM7GBIpzZSFhC6S6e4lFW1?=
 =?us-ascii?Q?ZRSIRTKfYJeUUxGFl9PDeH4ov8tbgXcC0zZsjLhPB8efuIOaa2yai13WWEzU?=
 =?us-ascii?Q?5+n5Yhbqrq32RIAFK7moZMh+HXcQ+Ya1kYtbgbhrXidtJZq+/1VZvyjQuSiv?=
 =?us-ascii?Q?MSRHrtMIsh0CAo09xFf3qg0NeHwUw+jEWf1Iy//757npeLC0lqu4JwyDCrSD?=
 =?us-ascii?Q?8cqbxgh5yDx9ANA2zP59iMw/yuxhiUxL4OxG8o21HGrX32zimMPos8RdjBTw?=
 =?us-ascii?Q?bqQkqyMB+MZvyZ45sW44LGgm8gvPqSgg7Lw42XGDJdJAeEJjACO4i8O6NWed?=
 =?us-ascii?Q?jSpnNpbH7W9+QBrXorcNxW8JYcXxdgWAQX/IoiFfMd39yYsj3mK9g1RibJug?=
 =?us-ascii?Q?3t+hEdXdK/OHOL/03cRaLupi0LvsZ46kuY7GlejnxnasBuq79x1z4XnbHfo0?=
 =?us-ascii?Q?Y2zpwfhRj5/k7OnaPPN1vhTj1KcQg/BKkajlloSERrIZ1oRM5Vqvz0Wr06KG?=
 =?us-ascii?Q?otanBznWXfTYbM6c2qfANcxOWYgAD8VeLIETz4g8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9023e5-1223-467d-6d60-08de323133a4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:00:03.6442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DOinwZijy1ZegOLrqmXYylA3JmhWE4O7JEb4C1TjCVj+6+T8X5jO4wUw7WsA00UruAJstYA8I5PIFH5eWulUA==
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

Hopper and Blackwell GPUs use FSP-based secure boot and do not require
waiting for GFW_BOOT completion. Skip this step for these architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8fdce488612a..fe078547c9b3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -320,8 +320,13 @@ pub(crate) fn new<'a>(
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
-                gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+                if matches!(
+                    spec.chipset.arch(),
+                    Architecture::Turing | Architecture::Ampere | Architecture::Ada
+                ) {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+                }
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
-- 
2.52.0

