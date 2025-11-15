Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48CCC5FCE0
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 02:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DA710EBA9;
	Sat, 15 Nov 2025 01:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VB7g4EwQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AEE10EB94
 for <nouveau@lists.freedesktop.org>; Sat, 15 Nov 2025 01:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSlfJ25ojxMN4yd4j4JheSqFhXvBEsaxc1+0UqfZr7+udPl6oRa52G73ADHyeKV7tSCxg1OaeomnWk4QNN+zPybaU8noPqW4W7nSoCIz4NE4qw3j7ReDcjBuLBjYJ+rVTh1OqW1Y5ouW96brT3Waf8i10+KeujxhyA1Isva0vhSJk0awyQxrrdoiFt0jH0w9OQrPnbLB6A3q9IorMZ3rO10FdqhLXySha6wGJyw6ETyXCx3m2h8iFdvoQkCAUvJ6Va4mYatXnmn9His62M+FAs4YKpf7ITOYHclhIED5wTlusMy8sze67AA03KfhTLhWKOjm19hJYJqVrhRbPzBzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0F23LPxvpmwNp3kKYQSwA2OyjDovWJ7mR5q4Fag9Ks=;
 b=xhBbOWsfF35vOuB5vjCDFgcFfnc755YxSRjT8zsyFSartMnpTXX3oZYFSttwQTjFbqB7B24ZBaojD3m2ZkeBxpKdXgAFXG1bQmssfg/iMTBXrvLOozpQPDDOQfuvi7IimQf5geW6OTUKYnEUzcyEzDBOwFWziypnm0YsslBthLcDKPqltEiGPB5awMLeoTFHU9dlEhqOFGDN7+lzKp2SIT+yu3pAn5C/2YRWwpp9im1ukFHfJpQz6kEanAqNLrqVzhItWbkNCxelyb055hSVrSxpcf9aNbSf3h3O99Nksvce6/Tux265GhmzUGcj7fmP38PNTUCYXEHyqbr0LHo5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0F23LPxvpmwNp3kKYQSwA2OyjDovWJ7mR5q4Fag9Ks=;
 b=VB7g4EwQcYdES/AHoJ6dkjImAJmrl/TM8lGeCE+A19A+myKIVgMpxZr7mLLWyYku4BbVlKo+wA6cA6lEMP/BBKCaG8KRBSTditZbxJvCDCe3n6xeTHysyAWNmzbqgOeUVh8P6EUgkrroWIvEgtJT6T5Dwy/p4rBoICYYPHXQREZUOqSJ+lgPfBBmhqo+QpRIPEcxmk/2AYpzarbKhvNk877eG7PSocs/6By75R417IdMHI7dtiVsUDpOKq5sbaydutEw8H1C4aMPEUNKRp9jz/toXE5w7aez/lhdbJwqhatdW+k1VeqxP+L+Xa1Y4TOODMBArg46ueBO+jBAkxlkKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 01:09:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:09:28 +0000
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
Subject: [PATCH v9 2/4] gpu: nova-core: make Architecture behave as a u8 type
Date: Fri, 14 Nov 2025 17:09:20 -0800
Message-ID: <20251115010923.1192144-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115010923.1192144-1-jhubbard@nvidia.com>
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f8c66e-c4aa-447a-f14a-08de23e39ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FeyeK2q/+hFWLIgSJhdUbadAIhigTBloizD28HXuZOtEbMbz6Dd+e66KX/ao?=
 =?us-ascii?Q?ZqBJDQFvRoOH1CjDSg7mjyE14lfhAzO1mi5+sEzkbzv7zNHGGuvtsiEFhVo6?=
 =?us-ascii?Q?UOcEgiy9Eeffw76dfjg3vwuI0X0q06yXKpxkgRAehuOxK7/APSE37f9QAaoc?=
 =?us-ascii?Q?fTMF+lONdBPYJxyVeTEdduD2idJBdRY4N5qe1GOrwzoy5krvA3Tfpge6zwyp?=
 =?us-ascii?Q?ru+BxPZNgBJI+q9g2wrFJvYWJ/Z9YYaY9kz5xghKT1x6lC00888HiYuOJMqw?=
 =?us-ascii?Q?UdczpovhQSLuUgDuplnBe2ZRoDGP2+6RkciyAx+kySTyZIMTu5oZ/GAz/rZu?=
 =?us-ascii?Q?U+hI72OncHo54+GBYq3dMyLR0k9+u6ku1yvlGSl60Qqfv+KEsv5NbVMoeV+M?=
 =?us-ascii?Q?lJjI3i85XMu7P+ILaARWOdedBXKUSddexSix4K8gRZbyGv9wYvD5zO3/2gYt?=
 =?us-ascii?Q?dpxa0r7w+Whl7Ajy46NHksf2D+ZGlLsiViAOGhHw4V1e7Fzb+o1XUZCX09Qc?=
 =?us-ascii?Q?6bxpn28mFjVi4D9aXZ9huo5FxCsUOwODqF6mEibxjxEetwj92dVy+kEnLkSM?=
 =?us-ascii?Q?SM1IQAzGPJ0MZ+CcTfhF058c1EHMjiMiXRDn0XCHnD0cwDvxZOcZ3bJHMcLj?=
 =?us-ascii?Q?b9smS1bWr8p9ce1SdR1UNPZjMGt4A8mXozY7fc4+mYbZsS76LqaVuDhWkBLQ?=
 =?us-ascii?Q?/Bk4evlhk3hT8RWrhQ0ZCo2aCgzeRpnwsH7StGKdv5n9Bl2dON9ObqkNP6hu?=
 =?us-ascii?Q?K9ON4zE5t2qh0MWlfFCr+V+g8PwIwpdjGKCia8+wNG+9RE08SqxV2S0vRTgI?=
 =?us-ascii?Q?rz6NAzHLrqwrfMqR9q7ZWOnPqCgUTj9bWGOkXQ8l8Mym6AZJFY0upWaDZiQR?=
 =?us-ascii?Q?p1FdF7ncRAXvYz/ShgYw6oPjxu7lujGY0pVpLHd41qyoTRO6PhnMVB+27kgs?=
 =?us-ascii?Q?TsyjYGmpMMVMUt5GCcbwk5/QwaPi4U8NSeXz3yTgAeq5LLXWCNJDpGzo+a0B?=
 =?us-ascii?Q?utzbp2w1e6hdPFXod3WCHrU/vAuJAH1OowiIzH0OC2f+lESiXSV5CLfO/LJ+?=
 =?us-ascii?Q?tA7WDh3qo3sZMbcahLPns9jSGObcbIcI8ufAirllUNK6UI+bXIBxUmNzYxWP?=
 =?us-ascii?Q?55ps+bJvGTSBQz0Qs/UNj4iqUy6uawg/v47zSU9ZafrgcoLLVPqgvQahppmZ?=
 =?us-ascii?Q?wFeBEZUoGyOaiYd37haahRKdprS/faypfAnELB/Ajd6cjCLsXZG3hKMFcqxz?=
 =?us-ascii?Q?wITT6eiUjWzJmNBkIOMmfP+1Sfshn0JBDpMosNsYb3Rl83kRann2WBEzvKnD?=
 =?us-ascii?Q?7qcH/2wF6ilkFRcmOm9i98/8t06k3Elw5tcgEpzXlBOwjKWpsQHJd3w1t978?=
 =?us-ascii?Q?dx21TJdIukRpL14fUF0r2ZuYhfQpc6eHZDP2/SJ3O3A4Nfvr+qgjiS34EqAV?=
 =?us-ascii?Q?+QqEAyGM/8GbJhiCNXAc0TGubNm9V3AM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5KKe8e1QUYCxTTYOyEGz0TkECakdbVqIKfxWVAzYR1VvSBQ5AzYxj4wzdjUs?=
 =?us-ascii?Q?b5yHbHuEBc5h6Ka2XGYy+ArZVXSeXrnJZq/Td7LDy2FJsFmO7KJ0yViPihYM?=
 =?us-ascii?Q?Rhf+TvYQ2YEYao+p7ISO5feKP82frj7Wmv2KFElWAWxz+n/UOGGPR+85bVUz?=
 =?us-ascii?Q?kUpXygcrBeVhGamKb0kAZUyEEc5RS4B/5nkYW539FsSe7oCrJE2N3Fn9xsGJ?=
 =?us-ascii?Q?2Uy6hlVE/8+8L0tiQIW055jVNpL4IThJPofM92DS3x75eks/SSsSEcbBZ+3C?=
 =?us-ascii?Q?NLxVjdsUK6WcAMl8ocecSxwtLppbMldw94kb+PWFO4PvrsIl/3gvE8Cv1oX1?=
 =?us-ascii?Q?lQyGvUUUAzg66nb1UvW6naRp6VXWEKGujprk0l2qnje1x6jdafGencyMG96i?=
 =?us-ascii?Q?kCz3axb4XkU8IdRCVHig+mjh+dt05MiLnhgGWTliV8uUXN6mHbTc+JlaSqbL?=
 =?us-ascii?Q?LnCvcTJ86Q/yfnMLnUc7f5opllHuyxlwiK+SGUMtDF0v4F60EkxrhqOf+JKq?=
 =?us-ascii?Q?/MctuaWDRZeChga167zeq8gXcUOXthX/vb0cE/XywH1qmEbyk1NV++SDQRDy?=
 =?us-ascii?Q?YpOUsgLtauuQBed/5YlBAxcOepo3Asdd8+cLGyyr1TFlFZxB+eWjGwwYww7Z?=
 =?us-ascii?Q?DGn9tP5X0qH2i8x2bfmTh9yF8YuzSVmtA0PFJoqO/qpqFq9Shxien6txwP7M?=
 =?us-ascii?Q?+c6PQP3JQQfEPLuBTMR9c3jyeN0Rhrt/KOvuIHJsEq1yRxNV09rv4DCBuSRx?=
 =?us-ascii?Q?BYzapaP3LcBRUxkXHBQEtMwN7t374p8juYBsmH6f1QabXb5eCmT+sQOgCF+W?=
 =?us-ascii?Q?XBX8z8NI4DDKZ3aFRd3kEo0ccuL15xFZSmEzlNPS+DxSUahTXELj3BX5rrs5?=
 =?us-ascii?Q?z5aabu4HznfCk+xPNb/ve4i+yoa5bhZj+SUtlH/c4x1g3eLacsiDYRWNryCk?=
 =?us-ascii?Q?JLCoMFOCBZjmJD+qYIVsFI32ba9cRjn2OFNcjfssnSMf2UWe4SfAqgcPDrNa?=
 =?us-ascii?Q?9Rn38HEOAffrm6C5/WegLz8NZHd+qb5F63c67eQjiDvDsf/YYj06T96frZRt?=
 =?us-ascii?Q?IorLjg2FQNJ0D3iQcBou4mW62t6ydbB27IsXgcK7EWvaUQh5cYJLLDX8uUFj?=
 =?us-ascii?Q?bhBFq9rCr4FXCzlLf/aYf0fcWGKWOwB1iXgaHC+eFnJYTWtn6H9N/3VTCX/N?=
 =?us-ascii?Q?8nLGDbwRUPTU/Q2reuNr1Sn8iVobo6u1nDDvhHX2QnsDOBu7eyhR6re1/JWa?=
 =?us-ascii?Q?ZpoO5oQlze+ncHv5WzJF0p5UEEOiYKOr0vkYbBaigsMn/eCBr/IgVzd+UjhR?=
 =?us-ascii?Q?SjnoHj7UF+vi4jh3tL1PF5Nfi/ckKsP2kEeSo7ZDcQ9/gkPBNWB022mL0lNq?=
 =?us-ascii?Q?HKR49d6FjQ1WuUb8PmVVtpsoNocMv/iyKbl5gvrgJeZB1YbObQXwU8AGCVJd?=
 =?us-ascii?Q?siM/orvmloeteUkP4lNuVaZlGVC0oba+rY1SSP5s8JIJhLIBV+Cbl6il0Uyv?=
 =?us-ascii?Q?czAT3jtAw9Qzl8taZrFjx+xQExIXCOo+ORFiwEH6+8X815JpA0LaT7nBGZkl?=
 =?us-ascii?Q?XRsDz+gBaMxOxzivwtF7IfTx+xWY+UCR6Su8Qg7H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f8c66e-c4aa-447a-f14a-08de23e39ff3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:09:28.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbMgvDz91e3eJSCZ0aupgDcFf44VBe1k4K1/4HF7VvKzVWpIP3sx70EoCFgcuGVpEa3vbcHCqwb77A3IBLGbXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7645
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

This allows Architecture to be passed into register!() and bitfield!()
macro calls. That in turn requires a default implementation for
Architecture.

This simplifies transforming BOOT0 (and later, BOOT42) register values
into GPU architectures.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 57c20d1e7274..88a6d7af9f37 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -122,8 +122,14 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-#[derive(fmt::Debug)]
+///
+/// TODO: remove the `Default` trait implementation, and the `#[default]`
+/// attribute, once the register!() macro (which creates Architecture items) no
+/// longer requires it for read-only fields.
+#[derive(fmt::Debug, Default, Copy, Clone)]
+#[repr(u8)]
 pub(crate) enum Architecture {
+    #[default]
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
@@ -142,6 +148,13 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
+impl From<Architecture> for u8 {
+    fn from(value: Architecture) -> Self {
+        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
+        value as u8
+    }
+}
+
 pub(crate) struct Revision {
     major: u8,
     minor: u8,
-- 
2.51.2

