Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279B9C9DD8F
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAC110E716;
	Wed,  3 Dec 2025 05:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="av7KYsdJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011061.outbound.protection.outlook.com [52.101.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F410E710
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7tnWCINcvWGTOkuPgSGUAuIcZkV8Wp1gLDT6MQOIPKQpLSZ/uCdGvdUaAc1W8vYAfRgiPhTs5rpYqJDNPuA4b5lcD936coNnkR/1/PAKjtDCd6AjjHLyC7WrbU26Hp5XePY/6YLiw7kPIksR1dj1kmF+QKbEGVGEn804hQKQ5zydhftqjOvn56cbE7Dsha+OlmSrwJMXIMDbQCOLeODPlNB4K85+MDdURIbctKQJUHnKk/Uw4DYr6YvEVWwYFqFkZTKvSNXZiWo68fBCAk7r+oqSr3vnDMn3ER5hdWKK7TYovw/Nk5OMl97VEGqzbJn4lXsE/ELkPCjgwdaxmDbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLKw/G/1o4wc1Mp2/N1Ga01B85m7WaVrLrjkmmAPFnM=;
 b=s7UHwpG2QTkRhiHwch5443dmROQU3HWnvVLDDuayXzlB1x7d1iyVmpuf6Lu0ErKPEAys1SCy1S43xe4L0QNcF/TGhIG9g6C55UoIblCMdwFKEpSpetKJBhkhrmmZEqQccde6Ft+hKf0f7HT47SyOxXm+MTBTxn2h3hW+nEMDRcG0F5KY5QzR9rdErac8Ckt3Y2UEV9K/8pnMUY1w6fD+aloP3K6nUY+IGbHPVKG0fiBrm06U9PfFonbIdjQ4eHcjNgymKzrnBcp/pTjudKzTGiIiPbsMxi6xCyundtFOKRjXKipw72FrnjjJ0vA0xB8tKaE/qIAafv9HZVebwsmuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLKw/G/1o4wc1Mp2/N1Ga01B85m7WaVrLrjkmmAPFnM=;
 b=av7KYsdJ+bXjVyowQp2lBe5Y9mHovu9o0/HNHoz/vbgc2b9NjLXwt2QJ+y0uijqu+pNAFHrPDRp8bB1mWA6aqjd+e9H88tV2suqbfdc1imU6qBH5ir/OiI+Kp6/ABYbNhGxWSphQWMBY5zX2Sti8cjKE/Ka7VqnpH63qtNUEGMrIzT4AJnVX6RQVE+mHmb8tuUndyFevN3WK+nW1UNxG6LPxwlP80J4CHwHaboV+OJU7L7Lrt7H+rLTnyY8pM5tW2IlJdnuazfcTiEiUAQGNxsTxYDIPOVazGSWsvK6iiMkZOeWqpFmlsiWr1yS+pOkpOweCeumN7tsoXs57cViYdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:46 +0000
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
Subject: [PATCH 14/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine
 stub
Date: Tue,  2 Dec 2025 21:59:06 -0800
Message-ID: <20251203055923.1247681-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 459114af-cbd2-45c6-981b-08de3231291d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/nknTJbegKBQQYKT00PriLZHaF8KHY3V5N040dKfnUFQ9xLGCLnSmYvKj+rp?=
 =?us-ascii?Q?AJShK4MhEeWL72dYC/C9HNdje9+Xf8sT8yKGaZVL9ek3/e7O3mvkILbmhbIb?=
 =?us-ascii?Q?cMSrDDi2Ylppu1HdJWBiFBnL/rVuMBXytBAI3RohqAyUXURA4CQIPR21WC1x?=
 =?us-ascii?Q?givFN5bKSM9F3354dU3zoacBiXTubPykWOR+TkiEx3RG+gYbWArrVTXAwMmE?=
 =?us-ascii?Q?pavV2+xnR2jsWy/Cm+eI9lG4V1Iy5uEQ7kYGOhxwjHp67iOY728g304ZU8tW?=
 =?us-ascii?Q?+Gx2G1fnJC6/38Gl8ddS1y0qHFpjm8pts87/KvELavDFM165tNvskz2/8q/u?=
 =?us-ascii?Q?f616Zk74MoDcSkcgdTas19d+robeK0VTJhlx4pwc9OdY+HR49qiHKRHQN0bv?=
 =?us-ascii?Q?raVmhVhRB3IuskjebATV+Ma8IrbodmQwGXBXGPnA7rckP6lNJIM+QGN0kldS?=
 =?us-ascii?Q?cpfUA/0AkoD4pQBjeBvA/oEUm6ipWQmE5s949dwDRsIkhHsGTxaGuBcDRQDu?=
 =?us-ascii?Q?EFzPKKzVB1zPIp+KOMlpBzvGppbG86r8Of5ch9Xwjo0Db1n2Tzsn0Po8tAX/?=
 =?us-ascii?Q?kc8G6kYHj52J6hepg6LSmiwGanDJjDgbo0WdB2Ij0i2OzPBNG6SY7bEWspaT?=
 =?us-ascii?Q?A0IldtOzHiZr94/uOV/NMZ1CsPpXJVUB6FaqoF2m5HAEs2X3T3Vd09KD6ICI?=
 =?us-ascii?Q?pukaaqQfGOGIVj1GkZGLz+m4+k3X8z2Fd6UHFvS804sUZSYHsAbp6fVj0Ls+?=
 =?us-ascii?Q?y2jWvc2Ob3mnRcuLZ2ZJwy8jyYYbbRaYM2R6E3Zm2AijPAm38pTbqr+Nqs4J?=
 =?us-ascii?Q?zUIBFu9BTFGzGXYK4Wb1u6uoM1EPO0R6oWvmM9UvPaPIUWassGPTs/9Lhl7Q?=
 =?us-ascii?Q?B1RpMFCwm07hTzwIDxQhBRc1iH+QurtmwoaGg2P9TqrTen8NYb4Guzl9DhGi?=
 =?us-ascii?Q?ufkth8NtKpsrGXXjFKAZCaviq6Z8JfTExE667t+e7qdI12Bk5/g3APv5LUWg?=
 =?us-ascii?Q?Lp5a61lxPiPz8oWcx6SVoYkM22A7gxQic5IMh4JP6fqAk7ThrKslk0dVcy2j?=
 =?us-ascii?Q?UVeJnBxle4Qdaqcy7T8M1qu3mIxQkbkXr5fXaSNyhol8eoWIaNiztrPtOnCj?=
 =?us-ascii?Q?c6SNQv6V7iY38yhaMnowBDfcSylBjwrXe4On3k54zi3RLtJJfOQlOMQQ4bg/?=
 =?us-ascii?Q?4QJdK5y5k2h1tFnDakV9WSJW//Q9Rgp5HcXsHZmaqIKnmurre4jndESIkpzr?=
 =?us-ascii?Q?b2/Mw80LFzD2MR4TANYp+OirRiP1mIwAxh5pTr15MtbywOw+ICyppQglcxg0?=
 =?us-ascii?Q?7+ZKGJ57+wOtTddC2vjRWwwTjLpHFtoAXaxluMTe/IhmRMnP0Fml7nRUXZZ/?=
 =?us-ascii?Q?/JZBU8zb3tJHIbcHRREBL/WUovzyLfLrfzE1pbZhCrggSBxp+55yu4IwwPzR?=
 =?us-ascii?Q?Yh7lkKGnHCPIY/v+TU+mNf79rO6syVun?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cedSy+WZLS+pIT6dfln3rWoNaglSHs7XJGXSW5bQar0Znmu74fi2dB1x6Vru?=
 =?us-ascii?Q?4cBD0E1lrzB6TvOizV0Qt2RxNPbB7KGOrnd30dCOP5Ct+dQs1qJ2cxldwAw8?=
 =?us-ascii?Q?2FAJjcAqlcKKpF0wljrWdN+r/1xXNQS5vXQhty0iRLznixBX7P7uD9semVDx?=
 =?us-ascii?Q?i7uqBTJf78rdQLzip/kaS1ozTA04feeiCcaLm4hBeByOYovyAy/lREujpCDV?=
 =?us-ascii?Q?aCfkaYZtGDGE25KBYxHodGMPbli5ANGIGDT6pTl9ozAoxI/OIjb9EsOYZQjV?=
 =?us-ascii?Q?eiJ9rMqzwYFCNPx7Bb3Ss+uqlua1A6Fnmg0NKQdnc0dEMcqLcqSfn0739Cnj?=
 =?us-ascii?Q?rlxAb16Ex9MKBGyMKIqbNpjtQ/eCTYh+CFwIedAbZ71GuA3eXnQSBGb/rkIz?=
 =?us-ascii?Q?E9PFqnCMm0KpslQeQohSDfT9imH4mFPjbQ4VtpLW4dQL1NXccw6caJB76bmH?=
 =?us-ascii?Q?VQNnx/F3y2UkRTjYFkN824OK/QOMjVYIuD8AJl+LR4I3hrM8tp9jYdH6hGsc?=
 =?us-ascii?Q?vzSjGRTousO+PWImZTIkYghQPEdIAaZ0/rGK+YY655EnueaEi44WumW+4dcu?=
 =?us-ascii?Q?7ObBXp868xQXONQHhsrIpSdt4m4JpBY+6KuulSIkNaGg+5pSp+K2Tk/bkGei?=
 =?us-ascii?Q?6wCTrLcNJQ6f8VpfRRcFBjhsFTIxRKqeYhX66oVo5+yNKaasG5k/3an2WZyu?=
 =?us-ascii?Q?5BVhwMYt3P/7An7tFINEU2kvw+EGyc9A4xs4UXQZidyYtbtktmIniM4FjF9+?=
 =?us-ascii?Q?MVX4zq2UZMHg4FyiJrZO7pBe77MeurZyjCblq7uzEvFPMSmoveHISyxT2I99?=
 =?us-ascii?Q?5VEIz/H15mPAkuQ7BqkgVGVEPL6M7kbvJu4kEffnFS+Fm65afVt+j0NBXJbz?=
 =?us-ascii?Q?P13zNoatoPlVsvL4I5oA8BewXA2PrGCs7y0PM4JSRg4yhWcldVbNT22IPqHy?=
 =?us-ascii?Q?ReMJUm3J4iiD4yYAHx8an/BDQji0jQ7+zKcMuNZLY7Uk8MocAi60cgsUv7Me?=
 =?us-ascii?Q?qENdj/bzaicb4Q/UvgHoxrO3dqSuLtTPhLRYDjayUf+NLN19Z0XeTPHfRG5p?=
 =?us-ascii?Q?1eNyRC4Ch6EwStGgq5I0a/zbfrJDClciq+79inVSOdqtqqjUM+HBVjylqmK5?=
 =?us-ascii?Q?+H2qjYNwhWvAgV+/OyZCw4cFmv8KM/OhI7uW1YhEyMa2Xd5Vx27a+VzSwn5a?=
 =?us-ascii?Q?gpWOkgYDWc6eAVYAonqlGN6wqt0b0EZuaiByqtfWaxySNJstcA5I417OInnI?=
 =?us-ascii?Q?IVtdzd3z4Zl1FRznW7NxddXHFs+EsaNoooc4nzm15IuaLnKBahuN/yhhsgV6?=
 =?us-ascii?Q?JUYUTEex27IDyGHugGx/bNMdPXZ/pDwNoyC5T83+5JMtjyVDPv4+blUK3Vqr?=
 =?us-ascii?Q?0CCQtWOQ5LZ3i19sjGAQrRcxPYwSxAnbuJUjlETvv65UO2QfhjGbgjwJlZbm?=
 =?us-ascii?Q?zFmsJ/qstgLPgW29GBwdbQZ4D17R4bPxLQ+/UHRtmX0VK14/6UYEAOQBSQYU?=
 =?us-ascii?Q?XGuiNPijIakpfpheTWVlSy/oIT0Ub7ySxkghcoWzrGNxHCN7CsT35p3CY+Kj?=
 =?us-ascii?Q?dJPKvH/13EZfvV3LmIM3n1Z+JYM74Ehk2ps1+UTS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459114af-cbd2-45c6-981b-08de3231291d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:45.9558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGzEO8FA/JjXU8lcR4rOkDWW91t3CzpEeJFH7oBWQAnFzgGBerUaA7p/uX7TSfNrNoQRwVqQj12tBtOAGP6LRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 32 +++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..4fcd55f731d7 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -30,6 +30,7 @@
     regs::macros::RegisterBase, //
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..7323ae2f2302
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase,
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+#[allow(dead_code)]
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    // FSP falcon base address for Blackwell
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {
+    const ID: Self = Fsp(());
+}
-- 
2.52.0

