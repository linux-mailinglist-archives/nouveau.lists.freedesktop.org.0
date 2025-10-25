Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D6C087F0
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 03:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC2510EB49;
	Sat, 25 Oct 2025 01:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UxU/3tPJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013025.outbound.protection.outlook.com
 [40.93.201.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A449510EB49
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 01:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awoCOLAMuqeXLwS/ApOeE9LvUCPP93nqnhvBPdFBsE9a0Sdhz/KTgguoypvMN7/6H26F2doBL7m5inYb6pxbfmrp9B+Ipd0zGlEiGLp+PlKLl74p+q/t1OxJIS+Msg2s5DN9mB0Ufe987GmFSnzJFTNYXwo82i/awntcSpd9okaElCiIKLyQiVWZoc7roGEKOT6tYrbhgV16glk/PJjI4yxsAy8KbjPF8eQbImtFHzeEUzBuh1pULbb9NlCvuOKC4OlD/il4qyTOEXpaRAbZpjSDa7lOsDO19yxq9UbNBwK/bXycGjfAljaZT4yTfwnufsC3z6bccFmsHQmTgkpVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv0VHXWBcLYCBsP+ayNXhhEmbY4IZU79XcommkBFtEw=;
 b=QKV42hVM1FOPDCHYbPSzRz76he8sJs8Y48nMpeXLFPKWEow8L8ItQvgjKabml90w4OeVWyxPbe5QK7Hko5MQSu8aiKXxr6kVvbIKd6TxQh0osMba8IB2V2dciCXI/N9rXIaP/3whBXOlvvRGSMNBTPYg8PIdKsD8qzW5+fH4scEjTWseea+0PeMHP09OKphVSYsU9QSwltbObLLAPzVQEf0z5kPJcCPvXxIFiwg0RHgy4stY2WmClQZOl0Sz7EfiBv7/919kxvIic+x2A2mdovMj3FQHhP6zmEg9Qhs7/0fK3ZcJUktDfW6DNHqzdFs0x25b6HS1QATgKOtaPma0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv0VHXWBcLYCBsP+ayNXhhEmbY4IZU79XcommkBFtEw=;
 b=UxU/3tPJMpzszSBwQeIKRwuAn1wV/fDcsXwzS1OCWMTPBIL2uavN6CbcTA8cG9TQCbZ6MQ/SqSKcEHz8UYNtXTu6YgD8rroKkVsVlh8u5pLj8nJwn/eDO/G1fZLYDBFQTnWerCGoyi5UuSDXdJ5QBxoXzL7g90gAvEywxu0MQZXrBfLCDy6DsQQ9DWCXX/rqph7ZhfDpAvxUa4Cvo1ISoxP9j7OzlKDAXSAblR5/hvbKCpfzsODHkOOVcPjJAYesHv6IC4xVDSI1mOJsKd9pGQATLFumj4R3U0Yzbu0QL8itFPFJrxi8IpU1VIV4dohVAafajKAsYVwHtQklk9AyYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by BN7PPF08EEA05B5.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6c5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 01:20:20 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 01:20:20 +0000
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
Subject: [PATCH] nova-core: Ada: basic GPU identification
Date: Fri, 24 Oct 2025 18:20:17 -0700
Message-ID: <20251025012017.573078-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|BN7PPF08EEA05B5:EE_
X-MS-Office365-Filtering-Correlation-Id: 96b5327e-a57a-4e87-5c0b-08de1364a9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?piPXckejHZOh6B/tEqiNwupwkC8H5BUbXxsQEiF7197Y+8Mw7Sw6H14pkWSM?=
 =?us-ascii?Q?b7D1dwqyOJ/rn5CSGm+POLWT/MrFEEz3S5m0lzpWDCtevbIaYg416vBiUFwl?=
 =?us-ascii?Q?gxDP19nvydCw6CGSIuS8Snb7uTmhAlEqLBiYGJjjJ9dApLSCUfD8238cygea?=
 =?us-ascii?Q?3cvbi0FA32/ur5Z/rREbW1Q3oTDoAeWNDBflBYdT+mC8jbqMYV1/rMNsoEBj?=
 =?us-ascii?Q?WBrJ1XIYEm0D5XZX0ZEgO4eiUmbTbSR24NBCEEoE9CxHtMS3WaScbHAqNqUV?=
 =?us-ascii?Q?/4CVl5wmmacALlKtjzIQKfD/fVU3Z4WIsBvZx2lQegeFj8wjvw8R9v1UtArd?=
 =?us-ascii?Q?60Onlrsni5XujZdrEl9dm6Ja/46WGJepZLCiHFku6+/37R+hCcmwfFLHqDJ0?=
 =?us-ascii?Q?W32DJd8ATaBMJaHOWC7uWI+A+/BIUY7Cghe/82DHVu3xHBMltD0AWl/YFUsT?=
 =?us-ascii?Q?ya0W6j8rC9ffJodKRVxZxFSGawmBSo5tGGI7eZuZIocLzbPxy25/0lKgeO4H?=
 =?us-ascii?Q?W3eQ415lEqQtxmVGlXzgLn8eRadtZMawNk/qYvmb59szp5Zew22jvnepXogU?=
 =?us-ascii?Q?SvfagZEEcg4CmO7joqoiuetSnCEved7QIRw0vNfR8JW32mjGLrWNjokSj1th?=
 =?us-ascii?Q?/LHy/WFM6VoNyHrYWtdKNXpipVzm7UUoKGYaRV9Bg6ktac2SljsY4C+n2u5+?=
 =?us-ascii?Q?MLinLGmDGd+yCmkOruvHI8kCv5ciP5b6W6EPeqsLvn0CCzYIQ2FJ35Ve+wPu?=
 =?us-ascii?Q?MeK7hGmWboZ6jX/gGhY6B5qkcgPOAXmEnN/qWD9f+xhNzN5mPJRukAKoE2eY?=
 =?us-ascii?Q?d18NqE70yOtHTvzlvEfofNFVqIG527pg69+265NTBad0DbC7gUsGT9ZT8AcM?=
 =?us-ascii?Q?Rc69a2CFWtbotXVj1Z5qr+2Lx9j4Q8O9zICfzD8REmMOC2LMjvtiVQSJj5lv?=
 =?us-ascii?Q?aek84VV9p1ReYcLdSDlW3vbYBaL8fLn7iXFWzLgh3zUVE1CBppEDeC7H6ARy?=
 =?us-ascii?Q?MbsL8/qmtIc8NjQi9Nwsh3UN0Z3BpIDP6DDueiT5babRjAxauE8rEjeXEX/q?=
 =?us-ascii?Q?Pzx73z4C0Gr9ptn3cKcxV4Yt1BrK670cU7Ck8fRs7ortFyMSequhGDrHntUb?=
 =?us-ascii?Q?/GZ7Ri8GCwig5afsqf2ihXdUPfk11Tnev8McYG3VwxFPUoYOC4w/m6cfOUqK?=
 =?us-ascii?Q?0xRMLMjUDFuJYlMhKXQrBGJwkLbUd8hbSklyiGTbbD3k0cP5VKw2DUhgyx+n?=
 =?us-ascii?Q?7TNrxA28GfOMXGddYtdIic4uZBAEwjcGpWtJkU0fmTXDrozjs1RKucMH+QIs?=
 =?us-ascii?Q?JO5KB596paoyR7QzDNZ6awLiVNQl1DbV1WIN1Np5FQX9AXp++hKnzVe9BtYm?=
 =?us-ascii?Q?zOGJdvC/95qJ8gS4TTmKJi1k/kllz4SYi0diO+8S3Cw9mwpADnEUbOCKIPIO?=
 =?us-ascii?Q?rUwMN08zQ/rRfFJ9rId441CnRD9tSZOg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Id1z3FJDRWJLBktUpgBuRdb9svI40q5KfstAEWmoBf6UAjYGzoLPj+3m9EiA?=
 =?us-ascii?Q?UMZUxdsi0viamDj5mo47IA1GDstp1nBoxbehl5gBIbz+yVMnuofehuRYhZ1N?=
 =?us-ascii?Q?YXnF2ErKllgDOubfFWK21aZoCzB5lthUmj3bFDmvxxp7+8pTDulp/liIEApl?=
 =?us-ascii?Q?kvrooADEDM/joD4bxl9IOELiCB4oZ8K5gAMPmgMNu6ZkmWjPrqj9iQDM3lM0?=
 =?us-ascii?Q?h0zKamE6ZYOAMNBhRGPlU4Eb0V+LBBnQT69+Ydet3k1YAH3wpQPkW/R9WI+U?=
 =?us-ascii?Q?XS7U1LaKsuhG6yTFB7XVQzMoW5K1kz7byUvHU/u5zIyIopUKZmUqqSy/uoRv?=
 =?us-ascii?Q?l0f6ijVzFjN9xNXCIBcRVyml7WluefaBTmlt6ZGg8PjX3pEjBx9W2WwocYGl?=
 =?us-ascii?Q?PEToYH3J1KCWLuzK5S2CewWk/TzfL9Q7WH2fOU33rvbcxhQYMZbYiN0xYjFx?=
 =?us-ascii?Q?m/JlnT3USVisvKbsCB77ZWGC8PpX9TXWhqu31+Di1UnsNRqnGr1rmAo+t0h9?=
 =?us-ascii?Q?i9bI1LxWIqU1O31JfMg2DcTmX44POWIDIskPCt4Hxr8bAaJ4EMsCFew43ZBx?=
 =?us-ascii?Q?+ctVslbv45MZvH2bUUjCXsfBOXymoR0i8LwALIetW6AHOB2obTYgFqIS70dG?=
 =?us-ascii?Q?3lqE/LqmseUJeIPDibjjI6xPm3HLBRBF/1SLGwgKwEFHdq4WTdRc83PPwKv6?=
 =?us-ascii?Q?hf4MLA5kBRoyaFDv/aw44MqlY/HYvMKvbE9mHya4pgUqNCSNwd+7gLRc5cPn?=
 =?us-ascii?Q?QO/EISIdWUl3+ftE1iGJpyMfA7ApYZzox5DUl5iGp61vBWTBYHtSm53JhZEz?=
 =?us-ascii?Q?vlZwPSXgx7xvRP7BX+bGGn8zscIzQSsUVxeL3x+7gA7R7zGDhhBF68XIOKS1?=
 =?us-ascii?Q?cnwAIyzuYMPFz6EdeD4//+SGYYB35Gc/hFTm2R6BF166unk422aU5oXoWxkG?=
 =?us-ascii?Q?iuyeXofV8l+1isYv3QpX+vTWPI8l6+ps8qbIjlkkhgXEzhVeKN3pibusHkWH?=
 =?us-ascii?Q?qeBD5h5+AeA9Wax/amLdPCCUHEFk/P4w0xyZwzKgF0B4jKFMlsS8LNRo84sj?=
 =?us-ascii?Q?Idjh3xvzFk9dOrqp3Zr0CSBUJYXX4RF4jeEzzFbf8Brbd1zdnVyHod1B0GH8?=
 =?us-ascii?Q?rziqeyUaljtLCafJ0KCgApfDEWHhtCmxYsjyUATysQ5CHnUVOAQbjyjkHASE?=
 =?us-ascii?Q?EYoNnYtGCFU4VWM4WbylUOYBdWOl+bepfPrnmyNaAjCi+0DWn6wZ3zo/4JhK?=
 =?us-ascii?Q?pn1F0vtiPvys6CBElbuCbe8evXkx3hb278l43sHczZI1fHtWo9mVjtiakli4?=
 =?us-ascii?Q?JIHwkMCeOyny4EEkAS66+32/zulT0q/rAtdNzpn0BCXcrcbfXY85b7ep7cL0?=
 =?us-ascii?Q?/KmhNd/D98cierVqxn+nT21JqgNJeLa6c6TghC2arAGKQssFUDnSq+hTGjfG?=
 =?us-ascii?Q?FIfvKpJZb+iGO5Q+W5n2JsLibEb92bKXqE37ao/qkhdN+f/tovJoqKVl1BUh?=
 =?us-ascii?Q?vBI0OKLM4mnYPgZks6mdkNYuosFY3c63zutQg31ATRz9upU0Xea0nY+jQank?=
 =?us-ascii?Q?Mmtgz2WEavy0seXzXK6Oo6yNx2PXGFPXZVkN6Pf0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b5327e-a57a-4e87-5c0b-08de1364a9c7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 01:20:20.0310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuNnU8YYl7XGq2pM051Tiw++WRC8VsOzhOi5BLvnXhRGlYE2vfIauMayhSjrXfYF48neHxmYEOkuQpQoFFRhUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF08EEA05B5
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

...which is sufficient to make Ada GPUs work, because they use the
pre-existing Ampere GPU code, unmodified.

Tested on AD102 (RTX 6000 Ada).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

This applies cleanly to today's drm-rust-next.

thanks,
John Hubbard

 drivers/gpu/nova-core/falcon/hal.rs   | 2 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index bba288455617..c6c71db1bb70 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -44,7 +44,7 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 6b0761460a57..24c3ea698940 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -150,6 +150,7 @@ pub(crate) fn new<'a, 'b>(
 
         let sigs_section = match chipset.arch() {
             Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Ada => ".fwsignature_ad10x",
             _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)

base-commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f
-- 
2.51.1

