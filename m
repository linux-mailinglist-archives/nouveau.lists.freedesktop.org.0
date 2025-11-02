Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75397C28916
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 02:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587AE10E183;
	Sun,  2 Nov 2025 01:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tjBLDuYj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FAD10E181
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 01:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUq3HpnP3y4yd00jCiGCfnt73HX4zILNTD9wzVpMSD1EoA5zoMCiR7PAR2BplG1zwZt8t67265peLnYN1YTuPHTX0mhAkedWf/LVaZ7EnhhYkpnPRJaVujja8O/HaGTY66HeMLBNFSf1wDAEJjPUwM/onz33+Kv2S6kzw+pLeQPxBCylI8NsN1rP/tRTsc0Zf9rRD57YzLJacOmFfQhBxoUZqkGwr1DoZz/pnf7etPhM9jXFgjbPeODJqYcoPLaB4ATYpyvAo3T8ouX4rFjOR4MAVXl+dlUaZCuITx4naMrAOau31lUQJRKWeXtSftt8zdide3tjovjx8NtMOdegdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Fe9YpAKdS75eQQcSJEu5xg1ez0w0FEIK2yY9Goq8+Y=;
 b=jZNxKcE4VaXbZq4/51omU+i5FLpSWXxx6vdU2oYJWwDKtnveEI6+Lh2Jjch7x5AmkPw0VsGK3yjCAYxfLL8LzVTYT8ADziSgzTBySrtobm3nBO9CPMdnyLWSLOS3v0alXqxMhJnEp2f1zw2Vcj++dJXjRLg3UiXIsxJEYp2MurdZ4nPNdnqeiu5lSKICiQTnYSlH+g5Ohujl24VfYr0gDTnddZxYVRE/ZWAp7nyZ5rP9PTqHVWcbKZ5kGkLtlGyDNw7q/FIhK+JSe60Y8YMoKDHmKwLZMhGDqwjLZUI1OJ/798uSXVkrd2nJmRiZHGt7DwsFe1FxQucPxrGpe0jNXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Fe9YpAKdS75eQQcSJEu5xg1ez0w0FEIK2yY9Goq8+Y=;
 b=tjBLDuYjMr2fPtCvgu3xGdtkkcToWPWrCNA0GaceozEiPrB9qiGEIcYK06EYuLBWNVI50UzG6gh2d3aqm8XjUyoLWhQ3QVzfl8tVxEfPXdgTcTblp8C+TyTghnc6DIBjtECQUtq+qkbFQ/VZ228q/RNvj6naiNQelPijZPxlD58I2mmIZZWLrUyb+GoCUN034EfreAj3HHpaCCQ40vXEfNAB96YGqqy+khevuaH3hCVrCwECKeg//g4KxegjJlk5wov8K9qX5hLnANTLjUYdKmSWCkjTGcBVT1HDkyQDC8assLjMvLYKabbfVQxKy8qjfM2MmEpb8XyuR+8CnIwXBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW6PR12MB8916.namprd12.prod.outlook.com (2603:10b6:303:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 01:37:00 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 01:37:00 +0000
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
Subject: [PATCH v4 3/3] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Sat,  1 Nov 2025 18:36:56 -0700
Message-ID: <20251102013656.423235-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251102013656.423235-1-jhubbard@nvidia.com>
References: <20251102013656.423235-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW6PR12MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c830051-11e0-4e1a-1b37-08de19b050d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2a8r2U+p9DuRfL6zBQQv3iy3lQSKNH5xyrLSQWbLeIla33kToDxD7TO1oMIw?=
 =?us-ascii?Q?yP9nevEl9rHJJry3uS7rD0HGb5IEVR9YwpistXEkQ/BHEqT6R4RZTWaphGU6?=
 =?us-ascii?Q?4JRzCH+RXT3mQtdc3ON8Mwk+xYPR0kKDVHcgEUxQ2UaGoOxH2RMKvOXJQT7U?=
 =?us-ascii?Q?vsjXNUuCR71stebeGm0LDNN0ppXtx+eLkfcQtJYYyFOTvIdbm9bzSc4ksfRP?=
 =?us-ascii?Q?LoKIsz0rbAogFs73T8fvj7dBl7UV5Rq+G5oiwbIioWC6T8mKo/QbIvAQtkS4?=
 =?us-ascii?Q?kgX7PbGKh27QI8UVjlzwIuLjcm5lBqTUsTNHmkKiwHuKSxPKt/0qAsxpkoNy?=
 =?us-ascii?Q?Mtock1QIKbARpdc5JKE6VTSZLkpkRs9EgHWCBSWcfyg+/aE38Mvz1ZjUgtQK?=
 =?us-ascii?Q?6EI4ZvurqxEFv1rr4mj0dkNAx/VCvW1IJcE78RnviPutvcad3ijwoX0I1EyE?=
 =?us-ascii?Q?nbm6LMecbNEgMMPuVRDixd1h8uTSRUJwX56G5vO3n0TK3N3hwo3ObkEEvT/o?=
 =?us-ascii?Q?YSbLHHkQqH7n+g9xsaoFzTtlqWwfmpp/BUKYOdsJGyaDkOwdqDYwNh3VpHmm?=
 =?us-ascii?Q?QiJe/TykJ5ubc3mt8tnnx75m/mrvC2cbLzduJa8r7ZLaGh95Jr6YGxNj6CS9?=
 =?us-ascii?Q?Ghy06XhLDDJOMZWFkjCfUBT4j71RRLpQ/NkicfxyY2ohb9IjE/ZmbsWQC2XP?=
 =?us-ascii?Q?PQWYswX4IkbfyK29XBk7H9PV5BMUhYYMOW1UUv9PZf8NDFpfKpBf0sMb7RTX?=
 =?us-ascii?Q?IVCLOleC/xug/7K5UsTy0i8ztLy30yS2DVeGTk4J3cO24z2zDGBgPpxsD3NS?=
 =?us-ascii?Q?PTHjq8aUsAM4aZh42MouHtL75fB+7XE7zPiHceKpRD8d3WuluAqwsCpbWaOq?=
 =?us-ascii?Q?wM4xI0OuKYogaDBvJWdoYSSPlY+1ATgZFggRbXuV1V0MtEo+F+VsBubhTj9D?=
 =?us-ascii?Q?7msnn0/smWlOCrmz3R4ATbh2wMZMlUqYp7srbe3meHu5mb+4cA6QI5x/Kuvi?=
 =?us-ascii?Q?QfVATPivv3JZtmwhRj4a0D5t2xsyt6Z5hwhbG0DZKaLT6dViKrE40lFM9A1K?=
 =?us-ascii?Q?6rY6sfQZLpf7lh0d3YiVvbZs12bQijiL5myxnV8shkf3+tR+luCF7eJ2Jdjf?=
 =?us-ascii?Q?MR/fDSEtJS31HMamCEN+7ANEDlw8oC7+YtzWM1drIGjqR8xO62wFH3XoN6o0?=
 =?us-ascii?Q?Da9JB42MBcTOitohkuadavO38aNMWAfn6Xz7DqJ7Vxw7oZ+41fdWLVJL/1Jf?=
 =?us-ascii?Q?Hn9+euaATA7rkQwqeQ0PXCAGx5xo2FubHTrut1kWdO4cHvKb6H2KmzQ1WREt?=
 =?us-ascii?Q?8CiKQwiI2qS952dSbetX70s2mU1u8Kp870HrQu8GHEiqOgJjnP3pVFTzuXt7?=
 =?us-ascii?Q?iS51gn5Uyfq9VWDG42N86d6N+/4HmzoVqRI6terh9vPtnnV1YjlLJRViicyH?=
 =?us-ascii?Q?MHuiYTdxGGwf07dwqapxlC5lBi5X9XwQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ojNNmYGo+rDsj7XhEw/nBGC5s4XrRE827TM3lABzyWk2mn2k0hBt8FQP82z?=
 =?us-ascii?Q?n3Mh1Wfmj6OkU/w4SPmsProqM3KCV1MnkMWElXkLe5NadD6Mp9lhXzOM7sa1?=
 =?us-ascii?Q?Xu50L852kprfW8q6bny5l5ty9kegTHZ1AsFAbVX/++ADkTETrt0ITkoifYYq?=
 =?us-ascii?Q?jSryEOhWuHonV4iBfDVZ0paLlajBc6Y5I6Xr3WCueVgv1dnioZeebvhYz9R/?=
 =?us-ascii?Q?kERm2dIDHWmiS8eWbQ8FmDgk5a3eYAk1p0b0lbYcQ7QDq/5F6vzP1j2U22pP?=
 =?us-ascii?Q?Hlm1MvdFoBqlthXt1uT2PdyCxFg9BdbeD/Yl8JAZlsjdz/VJB/MXKfk0F/tU?=
 =?us-ascii?Q?kBsgEle8pp6XKYOdpQBohK9WHMMt5AmBM8jcY/B6GQuyEeEpEkmqpKKYKbYR?=
 =?us-ascii?Q?zyoRw4ba8vVAm+XLRYNylHbE8NuVt5TxAMUtpVJqg4GocwDt68wJ0BfySQgZ?=
 =?us-ascii?Q?XotAYVz6lmLpl0rPHx/1KvVx2opvVTrS+N+GE8/sj2bA8+T62xvyV6MYygjT?=
 =?us-ascii?Q?4oun+z7WzWMaKNTwDIt3bA3Y2n/6Fp4ENA57mkYp5R9XDNK0JRYmOqpkWKa8?=
 =?us-ascii?Q?BXd+mTcSL8O1Jj7VG1ccVKUPBeH1GWveu4i6zv+lMW7spqmPCupsRaFaBsdP?=
 =?us-ascii?Q?XTdrf0WsAWTGYri/UIwbEvoHesoAoT9XGdHb2Ti7LHlaJJotIIMaxDUHqCyO?=
 =?us-ascii?Q?yGFsrlUw1w3qtOWeppeg/ud3TUCGrEKUan/NlaMo4yY+m6DZb1vB6BkzTluh?=
 =?us-ascii?Q?jAu88e5zmOQvZZmlHJGlyez7f00KxmnikQfcNfSTYE+lwhv9WXYoiNJ1jSl+?=
 =?us-ascii?Q?bA/oePHJuWxklMXMzOz8O1NkN1GSi/XMKvb1M2kNTuJP44jh8abiCU7j8h+W?=
 =?us-ascii?Q?lbHCbCt0u8l+1XHs6rNC8QP3L8LChz67d3kFhCsMd2TRRHA6gJnj4pVsn+j+?=
 =?us-ascii?Q?XYrwLXLvjguqzh/MbKg5W9QBOlIJtrebk/BALw4cHSUbj3tGrdV0a5d6nSo9?=
 =?us-ascii?Q?d7XYdyNeFICy4J02BVJJBe83xXBTLxRlpbxNOPYA1HphBtRBm2IC7xg+5Z+n?=
 =?us-ascii?Q?yzBjf5MYrdVOYXbV7U4qNVgGiGpm/rP02PiFc7I9jAlCr615KmRAR6eHCcYR?=
 =?us-ascii?Q?U1MDEGX5sakCyq3iM6EtH/O5L+FpHcBby7Da/WHLNNz/fE1wzCmieYKv/0WB?=
 =?us-ascii?Q?XFGaAGFfVDJOQBOEP0xh+QlTupKhUcPfODOi1Tdrk9uulwJ6Fwv6p9DESgqN?=
 =?us-ascii?Q?+bIDSgQ/3LTaq5Oyo3ZLLBc+J22ogjvEmZiZFkGHMu3ekiMthy92ZFuVLkfN?=
 =?us-ascii?Q?f3BVHpwjMxxWgFRAA7tWBeSAy94/0hihIe2GO+mXWyyG7Vc8zLmrWRhL3TDa?=
 =?us-ascii?Q?xELavHm8u2Z/OFqbbrT4bYtQxvhx+DlYukp7ZcL2zUqMh8OA1owayh9sczag?=
 =?us-ascii?Q?DwPGN5KZK1TVv9PdKofiO2rV/3hF8L8OvfGMHVdt7/xCfKgtKbkZHI+MFIPo?=
 =?us-ascii?Q?a4TW/mK+3CiywFpJVROQM8c77BA3h5iLI+xW7XQWV8cwEP9xOq18r8s2nGqy?=
 =?us-ascii?Q?C5xSBZJxyA2RUjBfZYAMQI+wybPx+94/WFB3RsZt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c830051-11e0-4e1a-1b37-08de19b050d6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 01:36:59.5699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hc63gScGsqossfQSQQJH4o0RSO98hoUd9Dgr4hcTU/Wh+XpjyH1G3Dmp+Z+xd8ddGNIu2xrBoL2pskhf7Jqeng==
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

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will be zeroed out.

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 38 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs | 33 ++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 27b8926977da..33d96eb1d887 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -154,6 +154,17 @@ fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
     }
 }
 
+impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
+    type Error = Error;
+
+    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
+        Ok(Self {
+            chipset: boot42.chipset()?,
+            revision: boot42.revision(),
+        })
+    }
+}
+
 impl fmt::Display for Revision {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{:x}.{:x}", self.major, self.minor)
@@ -169,9 +180,34 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through Volta:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
+        //    boot42 may not even exist on some of these GPUs.boot42
+        //
+        // Turing through Blackwell:
+        //
+        //     Supported by both Nouveau and Nova. boot0 is still necessary and sufficient to
+        //     identify these GPUs. boot42 exists on these GPUs but we don't need to use it.
+        //
+        // Rubin:
+        //
+        //     Only supported by Nova. Need to use boot42 to fully identify these GPUs.
+        //
+        // "Future" (after Rubin) GPUs:
+        //
+        //    Only supported by Nova. NV_PMC_BOOT's ARCH_0 (bits 28:24) will be zeroed out, and
+        //    ARCH_1 (bit 8:8) will be set to 1, which will mean, "refer to NV_PMC_BOOT_42".
+
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Spec::try_from(boot0)
+        if boot0.use_boot42_instead() {
+            Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
+        } else {
+            Spec::try_from(boot0)
+        }
     }
 }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 207b865335af..8b5ff3858210 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -25,6 +25,13 @@
 });
 
 impl NV_PMC_BOOT_0 {
+    pub(crate) fn use_boot42_instead(self) -> bool {
+        // "Future" GPUs (some time after Rubin) will set `architecture_0`
+        // to 0, and `architecture_1` to 1, and put the architecture details in
+        // boot42 instead.
+        self.architecture_0() == 0 && self.architecture_1() == 1
+    }
+
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
@@ -51,6 +58,32 @@ pub(crate) fn revision(self) -> crate::gpu::Revision {
     }
 }
 
+register!(NV_PMC_BOOT_42 @ 0x00000108, "Extended architecture information" {
+    7:0     implementation as u8, "Implementation version of the architecture";
+    15:8    architecture as u8 ?=> Architecture, "Architecture value";
+    19:16   minor_revision as u8, "Minor revision of the chip";
+    23:20   major_revision as u8, "Major revision of the chip";
+});
+
+impl NV_PMC_BOOT_42 {
+    pub(crate) fn chipset(self) -> Result<Chipset> {
+        self.architecture()
+            .map(|arch| {
+                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
+                    | u32::from(self.implementation())
+            })
+            .and_then(Chipset::try_from)
+    }
+
+    /// Returns the revision information of the chip.
+    pub(crate) fn revision(self) -> crate::gpu::Revision {
+        crate::gpu::Revision {
+            major: self.major_revision(),
+            minor: self.minor_revision(),
+        }
+    }
+}
+
 // PBUS
 
 register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
-- 
2.51.2

