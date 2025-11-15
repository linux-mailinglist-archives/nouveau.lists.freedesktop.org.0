Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26BC5FCDD
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 02:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0684A10EBA2;
	Sat, 15 Nov 2025 01:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r4iH/lYM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3502510EB92
 for <nouveau@lists.freedesktop.org>; Sat, 15 Nov 2025 01:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjIMMrCla3Td3Ngz0h/x1fWRoP2HyGIQtY+EYnD096BB18PZN6BBDqPTLMwfrIrrBfG624CdOmGppHNI7xgG4dXhkhibcr3R4EMm+LSFDuUAYVBnLyB3qLY3q8+Sr2TsQgLqsmZkA2rtDwglod7byjA9NKwcKvIG3UEERULsVOfsXXtLTCn5SXta++e6vkK0+CZTAUYea+BLCkWDCE63BjLcPBm5bc9lo5E52gKn9lCsm3za4mvBFnPoph2YFIA8brqSKNxEWvPI8n/8ROC2tTLPe1YxNqFcsk3Hma6phRKRsWFpNuv4C622dF+UN0jv/29NGjZal9u67y/SbgxbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaoTIO5B5/izh7QUqiKmRZYvzLCtnWTbvqhlVW3pW9U=;
 b=iwqIeu9QMDtC8KGPmPagAiEStHISVTJVmTJeU+5cdKYY80CBoBI6CEVYFM5xwcjWM1nl8MeBctb9V3ZKDjUuQ5ByfmhLvEyJFglI8ujWvu4W4xsEGI0dlYhBVbCnGENUAXMUYZ9X21hRblVO9pdVxXIBNPPVrmQgQ+PXaMPpG6vRYvBFXDltclYqzMvWFj+lHIn/Ih073qRqH2WpiBZmTQcotzYDOEjtdrPAj1k41+0fpIyBToyQ/ceFV/14YfHEvJvQnSeYoyK46VV3McDC+7F31ZCrg7V4+I83GM0lg9/5LAM6Nf9ZmqtskjiEepW5TqsJT+m6halw2bkDVH1e8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaoTIO5B5/izh7QUqiKmRZYvzLCtnWTbvqhlVW3pW9U=;
 b=r4iH/lYMvW0DTc9OVzp+WYkdg1uE/r0DoggLhhu6mFF6x5npxdH4WpXU3N17Z6BdIY0vrhy5XSZ0fbA7++sGVNNqupkVF6ApVf7+KbK54If99NJYYhAAg+paG+stmS/tFWAI4rOgu9vYTS2z0Rax1cCLX2ptYmCUurOPqG7R4jDg7V0PKN9ZgadzTOanWS3TgEnmm0hbTVBn3PfdMge1YP6LjVY79D+QNhr3jKwSGHIa8mcqQonVP6yUwIjzdiXbWgUOcRKDjDZslfyAGi0slbffb2CtEWBTCRG2KcES18e01UgxSRKxqLC/IYKKUn8emU9Rod6zTuOTp6tjrGnVEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7645.namprd12.prod.outlook.com (2603:10b6:8:107::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 01:09:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:09:27 +0000
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
Subject: [PATCH v9 1/4] gpu: nova-core: prepare Spec and Revision types for
 boot0/boot42
Date: Fri, 14 Nov 2025 17:09:19 -0800
Message-ID: <20251115010923.1192144-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115010923.1192144-1-jhubbard@nvidia.com>
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 434c29de-7f6b-42f7-d87b-08de23e39f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5yUTyDnwD1I1uWitjXmdKIWgVspCLWzH7yPqrXPFA7xqb7R/CL48fpJzbmC+?=
 =?us-ascii?Q?gc86UH8Yba3u6A5SDAHP+adDIdgd0uwS++XSI80/X+zWTiLccGFCrqnZxsZz?=
 =?us-ascii?Q?6YR3HlHHcjN3/eOCnUfIqew4OPqEWDT+9duL0xWabZ9lcGb0eXvI/nJKZudf?=
 =?us-ascii?Q?RQi4pvlM0xfjFelNKU5HdnMe7wXPexJo/XwalTOjYoLj0fxKZ6G8DcU0noLw?=
 =?us-ascii?Q?c6B4PJiNSBz9qplMlpHXGb+Q2fKXcGWK3di5Tip8sfJQ6k4KHrKJ1Hx2/HSp?=
 =?us-ascii?Q?DErO5zxIWg4A92YCGSnnQAEBX7G9K0CE4ke5ardCyHULoKcqhU8O5nKcewZM?=
 =?us-ascii?Q?kdVVE368Uubvf1K5szQiMcir7yiOpCYeNWYKGpGa/MJp9hncFfuoJFfWaP0Q?=
 =?us-ascii?Q?BAqwAz19evvrVW364S4KO8c7e0qdFSLGjxFyYhYlWNH+nvmN4CIc5c9aAf8L?=
 =?us-ascii?Q?jHRqXJqqMs6PGlVR6hW19XnLaqv86CqGrCRoxW//S8EcikQeoR6t6+5C8sZN?=
 =?us-ascii?Q?ealBCAz4O2Evlk2NsPAB2jXLHGWE3XOanhFp+Qet7KqoGh70S6729vOsKF60?=
 =?us-ascii?Q?4MQl+ELICDvKYFE3wyc6x3YfeySB2EP+8zxHYw6t3pqZEBKSe8A9UmkTwF6B?=
 =?us-ascii?Q?T6MWX0zfTt48pJYn+3MsuSOKygstPEg3/VqVHtvExgu9S7htvcHt0GnMuF0m?=
 =?us-ascii?Q?ZbyooJQUy46BgbAQWzQ7wZOVQVNRGya6chAY+vPAZWDxKaZIODvPlPyI0fuo?=
 =?us-ascii?Q?ICxZQ6UkOTlYrHrZcnw36kzSjQbe7DSMzDt/9obAcMW9FjK2kfKloCaBPGqV?=
 =?us-ascii?Q?K6NEeF1YuyDS6iSwFWoeGWbuUQVjOJrPCbz4wjz7ixne9F61nphdryf39FER?=
 =?us-ascii?Q?gd9vkyYfUv1heiCpMt9egt+ARLyoaHMcHFrS6uN91ITp3uvbmpB5S3TChVee?=
 =?us-ascii?Q?08SJrK8eD3foHHKL0SpVdqiOikAAVmf5nEsAwmW1KY6qaogZBPa62Cuh28cQ?=
 =?us-ascii?Q?umBzBT36juw0lp94+Y6DSPUdD6TZoh/kyh1InjUQG1lV2ey9M5J0iMoMKeFo?=
 =?us-ascii?Q?3mOqg5rzmOyfi8UajmOfE1N8xY/Fxui6wmLDnKWmGH+h/Yii+e/jdt20q4L5?=
 =?us-ascii?Q?qmZ0D3w1nB1nNF/7nSb/s3vRkpgeCg5GCDa2WH7US1Mp9/m0jUUThs/iDU1I?=
 =?us-ascii?Q?8as6q8zzo2FLTODSUPLZHEX9rARpJJoZ4Eh2/c5aPt1EIX1DssRjBGDT9SED?=
 =?us-ascii?Q?JbAm3CuT++n6zb+/YTBOhRwvd5eirMhnUR5zmlrzpikaB9ViMBTftbR2GtGm?=
 =?us-ascii?Q?sdqmFFgRqZA42aXN6OPqegD/GQHE3Kqv/qiWmy7C+UveWHJRtFhpLOEnVU3J?=
 =?us-ascii?Q?H00s9lfnQz4NmZsTIXjLER6DokO2TNBlKoFSQBuCOrxSVOc917bCjFfYSN6b?=
 =?us-ascii?Q?Q1eFqQAWJ+KSvmUff5B5ljW/nAyeA3Sj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6agX0lNOYit6jD1BxBlVemkHcUYwRw9it1bSydC0L7DUWWK75D89UMTw4OcF?=
 =?us-ascii?Q?1h+K4DfY2oqjJ+h5bTa6YauDvRbKnLZA86O3tvpnvXTo56ypUaDiM4M9KINc?=
 =?us-ascii?Q?xJsGfLtUOOAnnkk3xuo1l7J+kUaKMODnDYRMk9WoXzI4jxhEtegElSRZWFzH?=
 =?us-ascii?Q?cAq+VVjojbLnf0RXnrTvedkuy4FIRZ0BIfQRV6exlUkcWTP09CeGHPTsJl0f?=
 =?us-ascii?Q?jN2uLiAcNP9N3dhhHcb6oQ0lnh70/vqyyPB8UjEPRtlenXfrMnfLAT8kO10y?=
 =?us-ascii?Q?TqW12ZQIbzFE47ZO4BP5pLG3zu5KmDN501SciGDHSo/H7JfPFKdimMH/HsoW?=
 =?us-ascii?Q?+FN3diVz42i+D0H8Vd8QwqGWjylZQWyqhf5kTMLun01yPzMF4umaB2sLnURS?=
 =?us-ascii?Q?KUgQwh6ZFKi3nn3ZPyP5HsdMB4cmmkf/ygrAplE+g2xSiYsUNeV04ASeA2gD?=
 =?us-ascii?Q?Win614i4My2E1MTsLdQMMx34ealg2IlAFg8pu4NsjNialolFCgAesvhgjYIX?=
 =?us-ascii?Q?ehto1PWJqAyjjDAj9msbxkru3t4hUIhEEbi2GC057eoVR52bKDYVxc7fZwTQ?=
 =?us-ascii?Q?r/GnBSQobPNNVj2VvNWYM/u7TvHExeD3CW/T5r/5ScyVEZwxutVn4XTU7Zzl?=
 =?us-ascii?Q?kNE+XkUZOWH3L30rmWgkxmSL1rhxmboEL5UwU+9f94EcVLReE1fk6FUqys3/?=
 =?us-ascii?Q?+8n0ZSjpl3z/vDFd0mOCAKDJiq6UPFgzUQ5D0GucDt5IOl2BrXxzIfSJ0w61?=
 =?us-ascii?Q?1Pgw30X4XHDB54lkn7eDPRbmR0QmXUj99OXWd0iL9Jz9aoWnY22rtamim2Zi?=
 =?us-ascii?Q?3Vs+AtECPwSzUIFacvaicS07xUF2qEZc7aIt7iFwt+EatJsdwbsccQw4yoBd?=
 =?us-ascii?Q?TYcwDz30sWfku+c8xJOB1n+n7K8Y1J6jlqphFadhwfAGSVZNoEiBh9iyJdmc?=
 =?us-ascii?Q?nG11ff6ezFVgkn80pppfTWxzhkmdYZ3ZdEtcV9LvNzk4kyJ0KrijCX1eK3k1?=
 =?us-ascii?Q?PyPFloqV8tcZryyJcw7pb89rd49FfcvyLEc6E4v78JRnRApuhKabJpy5INym?=
 =?us-ascii?Q?k06hVMiIiwpIpZq2Sn0KrbvagsyWU1GePZ7nJ171sts28R3mUJu4ik+NnKH5?=
 =?us-ascii?Q?eJXragKeVEr3R2NKKTNe0Q3W8S8QP45VFlyMBNTBuw/zAm7/Nv+/5p1gTMS6?=
 =?us-ascii?Q?HodrSgOPadURblAeQ8+3ma3OdCQwm/VROcUxkLV4rrvZc/KzfJYZGhidmzpB?=
 =?us-ascii?Q?lQgcqjlNbCj4avZnMjEELxHEGFl4h9IMznRGYPoKE51IeUj6SjjuXwp5PmkF?=
 =?us-ascii?Q?yMQCg7H5Eo3wEc9xwFmQEp4SEOwQE7VddP+Hdc32WkAuFMpCkaND9y48Qz7o?=
 =?us-ascii?Q?XvfMVAtn42E3zDRL6zEwr+qFin2+oftFi4fpZF5vAo1OYdJCxnpLKOJgVAQm?=
 =?us-ascii?Q?gPKkMj4IS05LfrepTIPflrEsTz9w0jshzELS8YcBKQITr3K5U2au+08zfhvr?=
 =?us-ascii?Q?5ird2fSpuxTNXIwRmdg/+0VIzfPg3efvsptxMeIACeT7k2fltXAsk/0lWw3s?=
 =?us-ascii?Q?8xZ0TBwoxIdgIlSX+UvSdpj6CUyH6MRofKh4WRAF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434c29de-7f6b-42f7-d87b-08de23e39f22
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:09:26.9313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELD6PPTpxl0OBWVo7EpV2LPJKbTZAciO11yE1KffRCIUZex9G6EQrKtAHsWNl4WEjFZiQdmaeVvG6M913Qtygg==
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

Allow a both Revision and Spec to be constructed directly from a
NV_PMC_BOOT_0 register.

Also, slightly enhance the comment about Spec, to be more precise.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index dfeba9d5d8f6..57c20d1e7274 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -147,8 +147,8 @@ pub(crate) struct Revision {
     minor: u8,
 }
 
-impl Revision {
-    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
+impl From<regs::NV_PMC_BOOT_0> for Revision {
+    fn from(boot0: regs::NV_PMC_BOOT_0) -> Self {
         Self {
             major: boot0.major_revision(),
             minor: boot0.minor_revision(),
@@ -162,10 +162,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: `Chipset` and `Revision`.
 pub(crate) struct Spec {
     chipset: Chipset,
-    /// The revision of the chipset.
     revision: Revision,
 }
 
@@ -173,9 +172,17 @@ impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
+        Spec::try_from(boot0)
+    }
+}
+
+impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+    type Error = Error;
+
+    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
         Ok(Self {
             chipset: boot0.chipset()?,
-            revision: Revision::from_boot0(boot0),
+            revision: boot0.into(),
         })
     }
 }
-- 
2.51.2

