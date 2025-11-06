Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39BC39072
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 04:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC8F10E7F8;
	Thu,  6 Nov 2025 03:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MWYOPq3i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974D010E6FB
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 03:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UhRDJ5cnQEEOB/iHTIVQWiEnuD8W4mM3Jg2wXTOca1pclTbCVtKd0U7crN1jZ0MGY3+9qMjhviIl56HzTAU7w6fc40A0IcaaY3dUO2jWDwknXGp46LI41tdZqNOW83tnQgAeoTkOqCrLeKYHO7mW7EG7WowU46PLBpg49P4QzD+mNAK9dPiG2P/nx6JG/BN2Vgk2BUvMi1nL278qLm3UxgZbX+KPYP907HTVP5bq8EQX+wEJa+DkzTgprTzZJpKt00yGpv6YBCXP2DCQTg/+Hyg7Reh2F5U0U0TqkPeuQpy9jrqFLW+qhiLP3pWf/Ri2EuTGosmNYkbwJwr8SAKcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToIGOjAuspYMxAz6r/+ehHg8Vxm3qquqDupqgRuyP/4=;
 b=KLEz3vfEDp7qr24n+ZDzFLZiXkH9kaaJzybcDomp4OUfAq1/WO1xKjnfHoR0biCf5U/Lx/XKygtUemgpp24SvXn7w1HnC6E65llBCRGrjLCJGdzFtlFbZik7o75/szYPCPKRCHjNLFrfzmiNGeCYY5XUZ9CSz1spD214pDFcYCTLhlvZk8UcAg/GhXRHewA9oHq8+kduwbnR8g246CcU9mUZOnyiJ+sX4+Qt4KSk7fTsxBLL1ihT8ZwoRYE64ppTzZFKXC0eN4AsC0KpFiK+2yQBSldyxIyNnJYNf7NEdlpaylNOwxByBkK1AEgxa+9PLyEGfWQ48ATZ8G5pc6GhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToIGOjAuspYMxAz6r/+ehHg8Vxm3qquqDupqgRuyP/4=;
 b=MWYOPq3iL+hGaRxr2Y10HVRp4jwkW20ose4+lZkR6lo/avxVoqHRxiQWZ5YIrQganOzigcdP/8B2uK8MVxl6eRhshme2yD2qY0qOEcqyhcwjcsrByTVREkU1JGzjx/8Jr8kyrsA8Dfszutjh2RqyiabGYG+0CDE40e9PV+oC8Cp2raivrVctjGu481pGvx+WWtxjOoZA0qwntwHatgjL/Vhof1PAgi+i8QyUb30XFyKUFjNlBnvtaC1QSOwb7938XVRVkvcc3dnEFp/II1JuWOkCxQO7/OvZjE4mqel6XL/5kLSXp/fdRqi9lfSVguSzubJfV0KX1qpI8V9WEEi8Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 03:54:42 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:54:42 +0000
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
Subject: [PATCH 5/6] gpu: nova-core: regs.rs: clean up chipset(),
 architecture()
Date: Wed,  5 Nov 2025 19:54:34 -0800
Message-ID: <20251106035435.619949-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106035435.619949-1-jhubbard@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a79e5ad-801b-4d5e-e47b-08de1ce8372a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZV48mmU6wS715PA4s1w1zeDPWblYjDCbGf6sVp/i20SuJhCO/cru1hp1xdDF?=
 =?us-ascii?Q?/O3QWgmE2CBuPVIga5Cm4X9BoNGvx09qu5EXHwAA8GuPzX1bmM1eHo+0/6QW?=
 =?us-ascii?Q?i8QJvcEw1N30bfMjG9Wxx6CgRtBvuaXsQiLTpEmKm9fDao4yJ7mBVxv3BwaG?=
 =?us-ascii?Q?k6Zz7eOP+w6EHz9AkTQor63elCPv3ZFzPXYyds50lgC3FKhA5FuB1JzN9J5o?=
 =?us-ascii?Q?YDpOZDfAI181TdmHomprL6ec8gj+9SSSgYK7fEeF43ikfgh1AHpGNsZdridp?=
 =?us-ascii?Q?JVOcwMB19BUsxieArjSW6FXmTiCPfsVmh5eMRiDC8Wa4SCtRoYFrGOgjsxYw?=
 =?us-ascii?Q?vIp51vy2Wyf5lHwJdB+m5FkfapeDn3ebfSpNymkFBxKm7jhGVQ9ecg4wDmql?=
 =?us-ascii?Q?5crwwN5RxCcKg0ZzluMFx1r/NDSQlqHjcR5bjhvajI6Xv6C/Y/zdkixC0HhU?=
 =?us-ascii?Q?di1HTtYVUc5zjIQr4EOh89P9dQNrDOJ71lHXLFn0i+4VYKq2AD3o1r6k+vsw?=
 =?us-ascii?Q?wfkBWKgt+n11WsBQIrGr/YxbbRPc4Desyjr2OkNoLNX9jaEBtkD0oZmtx7dq?=
 =?us-ascii?Q?5rn4FW++opJTFpkoqOsgP1+z2BetcGT+JjY557lOZ38BtdTppcYDylh9Glk/?=
 =?us-ascii?Q?rhNRk/PDDWWY3TJK/IX5KY60HCjdVnHOf3vuH8MSSrlABRZOBbPU435PwuyJ?=
 =?us-ascii?Q?C+ssfazdl8qa6+AVDClIvwn7ypuD66ghnCLguJ27AalLArZXhPxOmIAGmPe7?=
 =?us-ascii?Q?xtnYp2B5av/MNAPc+hedNz8/EnWnq2IaHURn3M/3/1Qq7bGFryzUAzVTWkIG?=
 =?us-ascii?Q?nWCSNG6ANwoEgUszaNog4aVQP+NtWfnzfnRlBc6LXBBdfP+SMTHsHB/6mjdT?=
 =?us-ascii?Q?xt3j69ZzIsQTgESpehKtEA2Hqs/OCv+XB+yITwVa5s0q/EkhcQYseH40ByCo?=
 =?us-ascii?Q?43ROWw8gjyLKw2nJ9SN9UGDE1SpYQMS8b0ARpY/rUaJBw6gzmUkyPHaLo7Kt?=
 =?us-ascii?Q?3btVz2Ce8pj70+k83rHTqHy53UbsIHWf/cQ2AKjrEMA1/sRBsJNWHDUxTl+k?=
 =?us-ascii?Q?cAoOw8HdqlxZFbbIK9RHISM2WwwaNFK3l7Ap5lhwzu/u5LTXpTBQTTXc7asR?=
 =?us-ascii?Q?d1VVPCE8b18JaKiIAAohAmLDDuEAxtCLBlSmxhXU5u/gXisvvaOzFu/Ye9yB?=
 =?us-ascii?Q?L8vWQ9ZdXtt26qYWPYZU5bLXK4Jh9CAE5CU6Poq3ekiOAd9RmHnBxUwhQIsd?=
 =?us-ascii?Q?lxK2BBvfY8P+DM6OUSzORmo/sjlEx8LdYDWkUR1yULTz1qkP38JAgNGt2V+v?=
 =?us-ascii?Q?Gabp0ZmGtJtuh3FFx2G/POmDrVLxSLXB/dPoaLedjfoDOliSsA/BJz0fgKe2?=
 =?us-ascii?Q?6z9B3mmJzEc6ToEo0PaISMnju6O2SI1mgUB1o+tRk8Byo7JJCrVFQuysE6Zk?=
 =?us-ascii?Q?oVgKyqQbWc0MmaaUgmqc3ZcYaL/RtO0Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JsRTpxGAXGAbPsLQt1M2K5rzTyZQHyEHV/HXDkHH5OBQOdU8vPpqoywv/y2s?=
 =?us-ascii?Q?Ge5DSJsrCJiMpI8+JWZR11XNcwiTwnuuAFhJjxhWwLMjwaghZscX3in7Jdoi?=
 =?us-ascii?Q?vIYGo556KYKNRRJHZPl5HGKzQM/YPdsmqGskNcmvZOMZEea4A5OeOMcWIsVf?=
 =?us-ascii?Q?deBuHhg/gWz5niBqYg0CX5pSPovE8e5OcAlkuAKH2Xdadwa86Qoss4f7/1SR?=
 =?us-ascii?Q?KT9Lg4dDYmYqqdwtzCft8xxBUwyxCqnXYQZWzhxrMm7+03pG0NWKLx/t5JQ6?=
 =?us-ascii?Q?zKZD0BS30SJEYrA+InBKrVvqi2BQzJvE1ZOGayKz019JHkWO3DlSqQpNLAnu?=
 =?us-ascii?Q?r35ooV9JhzYZDcppx6OremkJZB7Doy6FNVVdaq8doql/bIHeQysFeamgPwa2?=
 =?us-ascii?Q?OQUPuIHb8Ksr6SA5Cl/JO0odT8yeR68X/GXnmQnY4/+8YDTXYeyaALm12l8g?=
 =?us-ascii?Q?EfaXr6jjMJ+Y4MfTh2P14TwkU1xtXvP9NqIao9S9B6GW91HsvGFukKLtPVC+?=
 =?us-ascii?Q?ftmqh2qRvEWydrnkh92k7YV/R1fjC+9J0gpt6uCLTwpC4bzIG0mWL0uX5vhv?=
 =?us-ascii?Q?F3Q3RHGqmPoQVa3t4bBbeuhszsnWG83F70T0SZLFkhvg5iMayO9fD35eHQKO?=
 =?us-ascii?Q?BiWxVLHcVdyuhBpewJkDibdRlttNoK7ECgsLeXvRhJdzhn0lbwVbmY7qE0j6?=
 =?us-ascii?Q?vSpYhqI8tLET8ieQfXl/K9rZEdeZVIFLpUSP1BMyPF5ckrjQcciM53R58czu?=
 =?us-ascii?Q?xsG+6Pb6mCQHOnuE73XurnujhROlDCjrJFHx2PgZ9yjQTm3s6Ul8E+BjNuxo?=
 =?us-ascii?Q?JpTsgpAUDOUDglVLiBgmc3tLXYlMJ2pnfnkVQpcYwLwHYtabru3eLvrAcY1E?=
 =?us-ascii?Q?qFcGP66rQRt3ppcmumuFen9xZoeLJWtPDsZ5LX8pBdJUgWhkWnS61PsKEVO8?=
 =?us-ascii?Q?evFR694GAplvwsVlE8LVKwECqFmBVtBU/Wz4e5D3VHNoLkqzTBFSXAAfSnnZ?=
 =?us-ascii?Q?AsLsKBucc2UiPxdwKtuXPKa8IQMQJfET6Hoh/I/bxspjExOKs2Cbi8bowcXV?=
 =?us-ascii?Q?9RFbR5m+EW65Zx0jpNOOJiSQax99RRJHfojvETMceNNBRO5g4WV8VWwN9ZlJ?=
 =?us-ascii?Q?31ELunR4580EV4JoObiMAeSskUnN7tjQuZI9PN5WveE44eIHeLtACttrmH0B?=
 =?us-ascii?Q?6JImgvrIHxvn6GgxE9+Sf4/SqUqPjLuyQQt9Pp7u6CyN3RG0BgoC6tOviG7t?=
 =?us-ascii?Q?maHMGaGiZoEzbjsXMrHfl8Bu1/+LOavMKtLR7jIrpGMoME5ny3xj8Zve5Ifz?=
 =?us-ascii?Q?cPyWro7bGpkI4t6ygbFompIjHnioPP3Q2W2dz6KH7GsAhLiLZkx6M16/xY0V?=
 =?us-ascii?Q?jHGZhxOrnzTnLgmrIrskpXmwF403UChHSETjjgVUzS6XWb54ult/guWq5hI0?=
 =?us-ascii?Q?k8zfWotDAp4GygGqjmppCh/zUL/gl8XWxXDY6Jeyz3yF4M9CRvgH+UB2rKci?=
 =?us-ascii?Q?GNR2UYe04AG7je03SyGTnx4RHO9SW3B3aLWBi5tkLeeSFHQ53zoucinJbT60?=
 =?us-ascii?Q?DDahdQ+T/9HvCZugNltwb7hMXduc1foTspSnWirW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a79e5ad-801b-4d5e-e47b-08de1ce8372a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:54:42.0349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wp4zjoeHn/XEAtnAeGQwy9+L9plvBwG/0kPDQac3Zfw7ejQ85imQnpD6EDmE0Etl7zRJ9zl9ZPALDt+sMN+83g==
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

In preparation for an upcoming commit that uses the GPU's reported
architecture, rather than deducing it from chipset().

This means that the architecture() method is no longer used, so
delete it.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 15145426f8a1..fcb319806391 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -33,21 +33,16 @@ pub(crate) fn use_boot42_instead(self) -> bool {
         self.architecture_0() == 0 && self.architecture_1() == 1
     }
 
-    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
-    pub(crate) fn architecture(self) -> Result<Architecture> {
-        Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
-        )
-    }
-
-    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
+    /// "chipset" is a unique identifier for the GPU. Examples: GA100, GA102, GA103, GA104, GB202.
     pub(crate) fn chipset(self) -> Result<Chipset> {
-        self.architecture()
-            .map(|arch| {
-                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
-                    | u32::from(self.implementation())
-            })
-            .and_then(Chipset::try_from)
+        let arch_bits =
+            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len());
+
+        // Combine with implementation to form chipset value
+        let chipset_value =
+            (arch_bits as u32) << Self::IMPLEMENTATION_RANGE.len() | self.implementation() as u32;
+
+        Chipset::try_from(chipset_value)
     }
 
     /// Returns the revision information of the chip.
@@ -58,7 +53,6 @@ pub(crate) fn revision(self) -> crate::gpu::Revision {
         }
     }
 }
-
 register!(NV_PMC_BOOT_42 @ 0x00000108, "Extended architecture information" {
     7:0     implementation as u8, "Implementation version of the architecture";
     15:8    architecture as u8 ?=> Architecture, "Architecture value";
-- 
2.51.2

