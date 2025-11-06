Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862AC39075
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 04:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7918E10E7F9;
	Thu,  6 Nov 2025 03:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qPvJphnh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664D110E6FB
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 03:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1EtfKFtwLRGNXWOK572Xf/vEneChwrTcXaPckouH7cgytEnawTtWJPaHjjI1VKI0lZnCQNcWDYi0QuIaM4bOCfQqXl1gkv36xHWvG9Ao/7eAiSU2vkE0UaKwFX/ZOPmRI21J/RpX87XbdcnzdHBbmpC9jg/dFgKoBCqM1KzoOoy7u5S9PayGRYXCgiD1LqZtORLqzFU7qvdXGIuV/oV7nXpcJkoOvUezRPaVV34lTuvfPPr8wwIAeCbXWUZfBx8JKjrBz7WO0ufdGkTZQlAZ4SYpWde9phqyZ5XIfsruZInZo0pq6HMB+IxAdkV59/6Frf0g2zqDgmFbgy7jdUAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5f5m0zUYzX3hdtKZCWOujpyoUTeh9JIE9gODNEPFYc=;
 b=RKq7khdjsup1YdDEXdmZDRjEAWy4njU2kGY1SaesWJWc6Pd163YWNk1ooTW2yF75vo++zVSmjoU7ZwuIDWC1cbWL5GkXSIImfa/XdQXuf0XezOVhMgRurFBI3mtdwFHdg1bUDO9WJdspu/gPgdv7dT4zXNhysRKU/17Z0PvEjpZrdN1iuUrsoq7nOfI5kjEuueoEgKS5m3l+lnAPVj0ut6y7Eh6mexx8JAJiOWkUhGPE7HdDZCphsnr4vjdJwEjmsW8ByXOGEd4hzdegnPjwx2UF4f3bZCPoQBPramLxbW5dJqgm7no/dSrofrpb+GEZde6FN3iDuiDkQ7xTHji2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5f5m0zUYzX3hdtKZCWOujpyoUTeh9JIE9gODNEPFYc=;
 b=qPvJphnhnKAgBxwxothaxU/JS2Dn/MZNm/14xhpN1eq8BPx33b5DcfuqE8uxqYgKZQxTjARnVTdQ1ae0qDnsHh3jq9LsgqhwjYaAA0qPwJRe0TDTWgXghr/DEhF3eDEFCJyyE4YOflox0b8qo2403eejJcYCnZNx++0hymZ6hNsV/dqmh2A6CIEbxxyh2FJHBd+EkCQIYDadtrfU/TeX/51YUqBXgMQc+r1Rm1a0//it73GhZOo66/Y0eM9ArWmDUZppJNGB89dkTuE2LH8GiBGM3w3NOOw35RaKY3IxmwQnYBM258qRKZ+vzwJVU3IQTgoKQ18afeNhc9aCytN/QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 03:54:40 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:54:40 +0000
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
Subject: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
Date: Wed,  5 Nov 2025 19:54:32 -0800
Message-ID: <20251106035435.619949-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106035435.619949-1-jhubbard@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 8580b952-ecf2-4962-6897-08de1ce83656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tJ0fas0Jskz2+NeSH+DZQM8hdHGgw/nkiyxK4LF6yTxDZ7rMtY86H3kPyEPX?=
 =?us-ascii?Q?ZPWVRY+du9LowWUcjkFs7LIepbPTXPk/vZ717/3QQOb50+JH1YIBhKISR/lX?=
 =?us-ascii?Q?7lFjPrgCHzJWUlwzUCAKYY6U1sKFzr65mQu7rNXxNyGj0XqKCMR59seN8wdK?=
 =?us-ascii?Q?F/OZjiEaC9gOIPMiQUKfZW5iupgZgNbwwkkoVeIYL26a8wpLtCpHrhR/BYaM?=
 =?us-ascii?Q?OgB1vetndpWcTitCxh8sKiDIEM8viQ75+wjGzzr1aiIacFkW3yBYnoKAEQtD?=
 =?us-ascii?Q?25iVDJyPwUbNr3DgpUO0TTU8bRVCjmxjojcJPZgdxp/N644IwFKeRpP8AaZI?=
 =?us-ascii?Q?m+Jz793k2B/Lwo4SfPljGnHxz+Gy/kfZkJEDR56JRlNkomircaLEN8Ms1Fkb?=
 =?us-ascii?Q?YLynZsdrK7fOHM3WWkgC9cPksf+exIKhxugGnjgBQgjLvsnCgEDNYpyopZGC?=
 =?us-ascii?Q?zrxpPe9Phr0s5Y4UeLaegC4GKQes5AK0aLb0XieYQ5Qfi/1V017LTBZR+XDJ?=
 =?us-ascii?Q?v4/LEk46+qJmb1ux3DbTmsmcw09czQC+XNySIXd63mE74y6bVxOXQofqbZCN?=
 =?us-ascii?Q?M8J6i++5QD8UpIkoX6iSNBMFbE4U5MKK7d+4mKmkeTv9SubXeweBc/GMzhpZ?=
 =?us-ascii?Q?0YKKc9QRW73iHBNbdsawzBuwykG2VVnL2kO03NEZ2Wjd6pyj66v+O19tDghN?=
 =?us-ascii?Q?2ew7sT9oEVwrKj5kMbiyHPYfZhuyPzExQ5ijayNlUhWVnOdsJpnjIY36OS62?=
 =?us-ascii?Q?VUeupsM4xM0Sz+I9T0ZBv3R3i5ME7mXPeD47LH6kBIJIpzaFX0aj3aoQppUf?=
 =?us-ascii?Q?TfqubZBLWdM2wEG6V/hLaYi/8FSM+WpsoWi3z+1aE43e4eY+mNFW9Y8k07GY?=
 =?us-ascii?Q?WEbWy8aQ3szGJYJ1Av9v01+9zk0lF0X7fSdShsa0gtl4MKtWAM6+ErMiCjO+?=
 =?us-ascii?Q?+YoXSYwKccFcOWGhHSZmiS/QJLTBZ6NP0/RbQPuRx9inVvHLonkQ+ra0GeOE?=
 =?us-ascii?Q?fI3X+zwomGzk6G1PJtRDVoZgaB8V3iFIGtkZWHvo9xja4fh/3G1q+DQXZMm/?=
 =?us-ascii?Q?xgIWbYtzD+wGu946J9j+mRdbGOTVD7sbxpHCogzwRrLMyQ9Q2xU5Hfd7N9ed?=
 =?us-ascii?Q?jOR4Kv5ML6dZbE0ZkrQZv9Atnc5IvUO5ELfZFd8q/845JMVRUGUDxPwQSquQ?=
 =?us-ascii?Q?FaF0mEqtjTiZXrMTdbDJYSm6JKpU5SPEtTcjR+fOSMA9z06Nxcaqa/HRKzCq?=
 =?us-ascii?Q?reulRcjHKxQaKrliQRchs0/eVQb1a/M5/Ny3JlvfgTspzunijgdRKPjJypXC?=
 =?us-ascii?Q?pxc4fWwYgQ/l1QlW/yjo4LXwLyQx6xyMIy2Icy1MSiFeMtHA6vwQ4+Yxlt3f?=
 =?us-ascii?Q?6XGKEsEOSBHhcTEMmGzdjHsndlPKnmoinjn5Vms95L4F0aHjhRiHm7XMaKQD?=
 =?us-ascii?Q?/y5O4DJpTuDoGDwvnESE6Y/b8ej+HIB1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+RY/K1wdOfMY9LqcEjgO1yXIlCE6kYcrPenKjL4TkNl2VcwaCt6xgfyPS3ce?=
 =?us-ascii?Q?eWyFCqtMm1o3xyS6VvsEks0r3nJl3CapJwd0o18iAdL6kEWhMINaqtUH0ra8?=
 =?us-ascii?Q?A/JgY2vvpdyI6ITE8i2lEgeh745uBy1veV9YXAJy58L6VZtewzKsoCz/IbN6?=
 =?us-ascii?Q?Hi2x+nw/leRihhvZjIjzrnplFg2g8zBFmLf76W4rVMoohT/FwtybPx7wMJv8?=
 =?us-ascii?Q?u8rh/F7Hdv/Q3VZdNlDW/rFfT4joHQ6kHGobDOu/1wZ8CVBNRCMzes+K9+wY?=
 =?us-ascii?Q?XNOAwJ31UPxiDaemqylrheJ3fJa6fpn1AlZ0CUo5FD8tWRub23s2jxq0Q4Ke?=
 =?us-ascii?Q?zsTeRPDYKi3SjbqxoM205FIMn03lRNGydyJSn4aRn7/9NSkDVpG9badtjf91?=
 =?us-ascii?Q?rIE+awa0kh6TfIBtoCpmMSQR/8NWbhXAzjmCvPsIIYfbELgQ8fdWngab0oFL?=
 =?us-ascii?Q?S5zhPNnlDnhZHzefWHJlesvxAwXEAFi8qeGvyBfONJjsiByZpGd5tG/UVdBq?=
 =?us-ascii?Q?mbaamtaKDB8QdPQsfsSoiIxRFMvQZTrGW/yqsanGpzr/2IXlUQcPn9n29Xn3?=
 =?us-ascii?Q?FSMVYb1hY431s4KNErjIiqeLkLJ8tzdiZ3ycrgOdJMh+7e1q8DNZruWcWeVg?=
 =?us-ascii?Q?Tmbcog5+g/BEAin+Qd/oKMWbRY3+Vop66NjeZmTr6lO5dQ2sCge05KKDFBZj?=
 =?us-ascii?Q?NJ5chdETW1vLukKb24EYdYuVFEP8U4cnzfvz7tc8c8hZbgNePMzF9gvU7Vza?=
 =?us-ascii?Q?HHIkxf8A1fie6SaI9MyuJ+OpVoY268mvn/FXrWed3IfE/sN80qznYvMJ3667?=
 =?us-ascii?Q?Kq3NIjaJ8UDTZF4feMzReZXwxeeyziCAWIpqeaYOwKhvSPUAp3cxE/VC3LGO?=
 =?us-ascii?Q?k9rPNevAnb7JFUw6OW1amvtjviabKjoez4BjA+Gntt3Sl8zsyAcOCicvn69X?=
 =?us-ascii?Q?XEhej6wp8EhmGj7D4FjJN/j4JBcRqSH5OOkuMv5DvRdWzwTnhQ0+VzQCON3I?=
 =?us-ascii?Q?2XseYWGkUWylCEle82waZ5VrZwKuD8nbdfnW8N4qGwWu5wU/faf0sUEX3D83?=
 =?us-ascii?Q?4zft4yKl7efRefrwfWzciao7kKu7ABSqvgpJeYWWtQV7QMtJrfdZiQzMa9nR?=
 =?us-ascii?Q?N2F1Bl796LPOMzrPpwWlt4NaCCBGtULZaeBRE3Jksxksi6u7P96Tdfm/oOPR?=
 =?us-ascii?Q?zDjoXSlMqXyAtAcB+YPjqJ/UAnTQ6XUVof0WezgvuH1p2C8l5+9R6LqCHLUC?=
 =?us-ascii?Q?ZumYtD4OQyOGfIM1auEN8bTuK0Wa3b0r3hg8IhRWC8qw78FPu3odJwgYBwej?=
 =?us-ascii?Q?49WX3/StG8ew/R8eYiIlcnE0wDeMWs3RxTXertd/vzep1n0CrAHaWfMBZZJv?=
 =?us-ascii?Q?xo4/bZmfw53xg5DUIT5wUGj1TcWnt5GYLmXVPcmZlgIYpAmwAUwfFUn1mpK8?=
 =?us-ascii?Q?raAViJFD8pZeTLazA4FxowboohmZyvoMrnV2h+RT25fuOuXkOVA7UfaBq23u?=
 =?us-ascii?Q?sJgOtVtE2JAJNUdI4dFvY9/PWsCHxQ5Ql1iZkkvErb6fw9eAgio04srW8kWs?=
 =?us-ascii?Q?XIC22xtjSvHs1eEyoY1mCLMfjZ9jdrHX/X6R+6RC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8580b952-ecf2-4962-6897-08de1ce83656
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:54:40.3905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xmUpve40MjZ3YkR4Q3aca7yYXeTyR3AWw8EPecl1GOLyduh8eFh01JjfoqNABzVB7BQnAg+56tZyawz2WG/DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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

Blackwell GPU identification, including ELF .fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 16 ++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 17 +++++++++++++++++
 4 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 2e1fcd7ac813..7ba8ba856c72 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -44,7 +44,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index c8e86193317d..30fde2487d8b 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -32,8 +32,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index f824863ad551..ed2dea2cd144 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -153,6 +153,22 @@ pub(crate) fn new<'a, 'b>(
             Architecture::Ampere => ".fwsignature_ga10x",
             Architecture::Hopper => ".fwsignature_gh10x",
             Architecture::Ada => ".fwsignature_ad10x",
+            Architecture::Blackwell => {
+                // Distinguish between GB10x and GB20x series
+                match chipset {
+                    // GB10x series: GB100, GB102
+                    Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                    // GB20x series: GB202, GB203, GB205, GB206, GB207
+                    Chipset::GB202
+                    | Chipset::GB203
+                    | Chipset::GB205
+                    | Chipset::GB206
+                    | Chipset::GB207 => ".fwsignature_gb20x",
+                    // Unsupported Blackwell chips
+                    _ => return Err(ENOTSUPP),
+                }
+            }
+
             _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 678577cd8c9c..024bd4d6e092 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -78,6 +78,14 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -93,6 +101,13 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 }
@@ -120,6 +135,7 @@ pub(crate) enum Architecture {
     Ampere = 0x17,
     Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -131,6 +147,7 @@ fn try_from(value: u8) -> Result<Self> {
             0x17 => Ok(Self::Ampere),
             0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.51.2

