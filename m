Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB34C28913
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 02:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B91010E174;
	Sun,  2 Nov 2025 01:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CWTBDMuR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011059.outbound.protection.outlook.com
 [40.93.194.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E4510E021
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 01:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIHsgPrPUbOxLKkY2JSbDDmPFSWu0MI4arKnuRysyRk5OFF7AlhAsxTZx5MDBb27eDLFZiThLr5CvBK/Tw8z/zaB+BUJ8dPP6HCEMpk3PMbjWF7ujnJuLSRIgKyFXpp/AOpqupXyo83xlpfy4xD1ItFs9Rc+Cc7mlP3nfaEKNmZjZlSqPnLdsJI5wzIoCoo2Nh9b0vuSmIjQel19UkNSX8C7Chiqt+fobStxc9dzzDGFLGd4fiW0RRbTMB450/1LKdB/RnzxOukPjxELcCSF7HeCn+ch1m2Bw51yIi7YU3kwwpSFuHQi7WZT2VaYLQ7pQUlz8gRnxPp8OCRsdrtN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKKin2BNEet5oMujEN65fRoWrTQxx3TVDxicyALARR4=;
 b=UubZ6xREICEFb2hqgkXkTqgAzSW6WlI0Ku2RjY8oyEXkO5h3VhjJe6J1c4nbtouuPICyLaWy12iLfHHJAdVLRb34LJR+n6deCxxMGLzePqkd/mkM+Y/HF7d78Vhq1ZAG5DVgh11ztxGZVov8Myny1VzPi9A1zELPJ8xRoQtP59gKQ7sY+EMA1vdaCN7zLv0RNiYXljptqJ8porFxJ6Y8rfBJen3HXAzbZ8IDJdwW3sHXu9xJ1mc25EIdZL1EA+MJ0SrOpY/ns6aA0e+JjK2BSs90Bn6nu/cnjf845tNcbxo8ujsJej/PE2MNBgTYx4c+SHrzfwpVukAP7Yi4aH7mxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKKin2BNEet5oMujEN65fRoWrTQxx3TVDxicyALARR4=;
 b=CWTBDMuRq/Fi8Ypd7EJf1Q/QFU67q4pG2p1IVtkVPcbj64jX5RPY7i6bmXL3eTwnVLIncO7VE5sAcnmpJgvI72xEroaytOKFdxF1/rmurFPQTzY2kEFDSvC2y9tejtu3cH+npSQemFa32JBZO6e7CiFi76Y7ZrzY3P5TKukEA71kImFHKcmmokuzUMMDIBUyghi5XpjHKXWbQS8D/Hx9jD/lO8EcTchPlz9gxZvn0Zfz4pYq2j9mSc5hy/QfYGCU7IC8d5ONAPSDqejZ0lr9Rfs68DoFBSYkuyXljynRJCAweBa6JrVMBWX347hNdeJ/uqr+U6zMqUUmfem6HK/G9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW6PR12MB8916.namprd12.prod.outlook.com (2603:10b6:303:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 01:36:58 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 01:36:58 +0000
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
Subject: [PATCH v4 1/3] gpu: nova-core: prepare Spec and Revision types for
 boot0/boot42
Date: Sat,  1 Nov 2025 18:36:54 -0700
Message-ID: <20251102013656.423235-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251102013656.423235-1-jhubbard@nvidia.com>
References: <20251102013656.423235-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW6PR12MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5adacd-5268-4c31-7e73-08de19b0500d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M+O/vmXBusotknPdrrHufRfpKA4hjbCCGIl18UcBYAINHAfB9VXENJKMGYOj?=
 =?us-ascii?Q?W+hXDgxQlylXgt4TPiEQVZkrXCSn0VC+8PifrmOmm0SJ+PqJg1JnNuk/1GE1?=
 =?us-ascii?Q?nwiwF/e+NXmwvdoGhiRC8pCHuArUwWuKU11WR0Eok3Y+LnKiapIHhrA3csbu?=
 =?us-ascii?Q?+PCqNfgRODII3eEq08yPolNVflOyAz9n2AvUShUcIUnQoX5RtPzjahZHr7id?=
 =?us-ascii?Q?uQTIFOlbxxvCMqX7wvWqAsLPVV9hJUgvLIg+n+yuAKFQwKwsx/JZhOXrkQ8h?=
 =?us-ascii?Q?5c9FEwU3ANnRFRCNp6Dab6pFmPujqVPtlGKfD9mnaqe4SOUJpM6tsJWfL/VC?=
 =?us-ascii?Q?yQ+F9oIHlfFuREGFhxLWcuzdNcmINfXErh0Am7LDvtZukc3gJqL5xOqh695q?=
 =?us-ascii?Q?J4sXslFzmLUjhOdcdq2GZ5tXg3pFOIx9Qsazd0K4XdKDGaO/VcI7qBReQkiA?=
 =?us-ascii?Q?7O9jGMXNdnG5KXyhjSKTf5e0l76H52wltbVRgf1mi+EV8v31MFyZjXFmjT8O?=
 =?us-ascii?Q?T4jvxbJND+BRVp/2/1khU7KJTusp94z5ItYJfNNXFgrcy9W8rwkqOx6u6KO4?=
 =?us-ascii?Q?EHXkfXBHAcbQGR8t9sDLz5RgX7XqWVAXJq+3cklkZp0tsJXmF4su5EyjuKFs?=
 =?us-ascii?Q?ElrTdhl/7+x0r9ZbaUmJSwNVUg4Ltl5Bk6xzsTy5jdrgcveXFGj62ds9S9+J?=
 =?us-ascii?Q?yhveT8kfDp0eTOVUehrsCY6B2KWx3Big7LsuLIknMA2kXz6ICe/H7fMSDnOU?=
 =?us-ascii?Q?qsV67zT5+LGU+VVxyjFfXYHlJ3eGBGT1qykLawGhiSHyuNYwpoJmwyr1q1m/?=
 =?us-ascii?Q?b2izpFE6J525pv1kfdgYDhUf4PaE7Q7hi41KK7nLWFJRuzOjNGA4K37C3XkG?=
 =?us-ascii?Q?ZKHlmNMgUMKBk9RPWJy9xLA+P6kTU9dK1sa1++4rAMqA+gGXMivPmfYfI1f6?=
 =?us-ascii?Q?WCwc8JnSgRH7YxndnsH89S3LJEBz/cOfHLjEm+2/RF3bYHkNQY+rHI6miM1p?=
 =?us-ascii?Q?IGUHMHiSpBuI+x/1BSzRoxgYxToi8M0XSAd4XNF1ell92kUnR8Sks5/4LB6R?=
 =?us-ascii?Q?bYUihkrhilbHvpr3UEaDmF9AeYfJ82+6XoEikDHfFRL6vewBGbMm0L0PNVbI?=
 =?us-ascii?Q?SWk3hmGKxMs5ExRvR0lQcViF9NQVlXynAOM3escPANm4f2k5pn+IKxeLrIdw?=
 =?us-ascii?Q?YI0stb8dX6E10/1PpuUytgj9W5ZhFBwiqyCzg92FG7LbWcCc+cyBRoKwDxFe?=
 =?us-ascii?Q?3ufPg3FOBpCRJnJiaEHPx3QCELkrf/ojqT/vLzK1yanTQMn671xV/iXNRAl/?=
 =?us-ascii?Q?T8PgIXen06Jz6Tk6nTgvxBQKYg7NaQcdiD+Cv/TGtX/UFJlZmwsKz4Nzs8Rk?=
 =?us-ascii?Q?UJBBYtri0vHR/PwLM5DW7W62lAUTclt1YuvKIDnkTM3cEzwkz5HQIV/c7dYo?=
 =?us-ascii?Q?YC59hzTBKMbqFdkx2d20C+YA/3Ckqa9G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GwC0+nKJy9sdSMRtjnemMtmp9WZsw28GLFm/G1qlqWaJ6VweuOFQTxLscwzv?=
 =?us-ascii?Q?vgKiCO1iH9bTJbqObRS6MZpQYNDstZoBKKr9dBI2paSYE/Q+4m6dF+SLzzO1?=
 =?us-ascii?Q?arTdzBrfOvDS8+oB9ygvDf9B73Je1ClNt8SBl3H5fQDFjbgqGkdtT1t1I+wd?=
 =?us-ascii?Q?Nt3v30WbHeDkKmb+t2T1fk+rp19YuBZCZxtespXwAx9WZovC4RpdKF6ZE7g7?=
 =?us-ascii?Q?Cb6Qu2a/Pl7Y5EKy50t7njB0M6lTLcCTGpRDmUUovuxN04ARDIhGtbuAL95b?=
 =?us-ascii?Q?7uz09X808S9ilS5DgX5qCeB1HHQDfIvEnLgUM5Wcq09wUO/L2vpjdEa1Uxag?=
 =?us-ascii?Q?a8knKvlFXOqVAobKEqAgSEWUe1WxygSYab+m544besBJAnzIY9HuMGJQ1dHe?=
 =?us-ascii?Q?iSsz7JVRw7c1Gcj6hLX+jhBleJDSrdG/OSl4lMshHLMzDARqQbKw4yO3zwGp?=
 =?us-ascii?Q?BKjWEWzk4JGZoJ6R7YgQmlsakQSI4fV4RzPsNe9dktjfU/Q02VF12q3KerTH?=
 =?us-ascii?Q?0SGjo4i1Il9A/fE2mkFYA82BYhnyozeVbzBx1vY0cSVSEisic2BwV9f0FAqT?=
 =?us-ascii?Q?ay409RzCzt+e6gUx5EsUkDB1exgC4q4VA4LEd+qVQjLjYt4iy7WleYF7V5D4?=
 =?us-ascii?Q?GvLa7AS4SH+ugZVmfiWjvtdPr2tUjeuBLOm3+9qEggCWuJULcsn9RTDrPMwH?=
 =?us-ascii?Q?rJkDZ5MNBKTGbT/yfxtVkOErXW2D0qBb0sFRfXb3vgon/yb/yEC9MsxhBZ4N?=
 =?us-ascii?Q?Ho2qfh7F8nutBpLSZMdTdWkcLLau69qkSF+F2WoIV1d975DUG6vbrN0MY0dD?=
 =?us-ascii?Q?wXVCqFTlJJaQuu4vaHonDxPNpJssa0F1+qIDWPE7JKVBP4lelzqhzYotMcu/?=
 =?us-ascii?Q?eUTjYrNbQrZB5VcPXPEmeqAifVaWp5c78N/e+vm4ThjcajyjYCs0xTTTQ6/Y?=
 =?us-ascii?Q?vlHr62W/5V8HKt7JigltAryh+3RJPno6M4wnR8CV9GnRdhBRnvDcvmwWnZVg?=
 =?us-ascii?Q?KPfVFhdraWSAePE5nMJwZjL8KbySWxpw/SJ6At/bkIpd8vPmoKi1l/WLiRjC?=
 =?us-ascii?Q?0y4MEg4IEgqGrC8/v1SjE43Ui+5Z9T7aakcm/nSxROCJfW8/uiKSz667nOJP?=
 =?us-ascii?Q?HOIN+r84bQp1xaaUqmDmKCbtOQgamxKtG2oIf4PfJZTZPLg9UMlDnDPKLp0k?=
 =?us-ascii?Q?/u/EvsWVq7i185wwrUPDcSQnbv9uGua1jZs2VrtcCsR0/fi9dLNaWiPM71YC?=
 =?us-ascii?Q?uan+GbSA73i4taIemFAD0FjrhfwmJds9r6ry+73PUmLGcutUjLhN/GpkqtE8?=
 =?us-ascii?Q?TU5RaHGX0E6TaWYNFKOUdtci+z5omNQHOK81X83tBE0f8gD/sXZ6T7QfY/8N?=
 =?us-ascii?Q?chllQUyhFKF8jWBWt0CAHS/ZjOwsSg5JjMz+z0ndVKjBVuznZWNPV3LCBl5O?=
 =?us-ascii?Q?RZXPU4+ZDqmUuC3Z8IsYzooUjtlD7u8yYspfkow8A9U+TssTgsC7GwDH8LQA?=
 =?us-ascii?Q?01c6jZJBEOHqjNiagMqQdHbriSkE6KE0myNevRZLHw/hgrRIT1+tUGn9feK6?=
 =?us-ascii?Q?95JFF/76vNR8qReh7q8f/JeQhe2DJbtLKKgmBlQP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5adacd-5268-4c31-7e73-08de19b0500d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 01:36:58.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PN2KbE4dQtgFoeiVvWlyRfBzVrIaysrhbLGo40ZQ+rdB1ZJBgDRrogwZ4+ygCmGJm72zdKNN2j1wjfZisbPDg==
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

1) Implement Display for Spec. This simplifies the dev_info!() code for
   printing banners such as:

    NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

2) Decouple Revision from boot0.

3) Enhance Revision, which in turn simplifies Spec::new().

4) Also, slightly enhance the comment about Spec, to be more precise.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++----------------
 drivers/gpu/nova-core/regs.rs |  8 +++++++
 2 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9d182bffe8b4..8173cdcd8378 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -130,16 +130,18 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
+    pub(crate) major: u8,
+    pub(crate) minor: u8,
 }
 
-impl Revision {
-    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
-        Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
-        }
+impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+    type Error = Error;
+
+    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
+        Ok(Self {
+            chipset: boot0.chipset()?,
+            revision: boot0.revision(),
+        })
     }
 }
 
@@ -149,7 +151,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
 pub(crate) struct Spec {
     chipset: Chipset,
     /// The revision of the chipset.
@@ -160,10 +162,19 @@ impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Ok(Self {
-            chipset: boot0.chipset()?,
-            revision: Revision::from_boot0(boot0),
-        })
+        Spec::try_from(boot0)
+    }
+}
+
+impl fmt::Display for Spec {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(
+            f,
+            "Chipset: {}, Architecture: {:?}, Revision: {}",
+            self.chipset,
+            self.chipset.arch(),
+            self.revision
+        )
     }
 }
 
@@ -193,13 +204,7 @@ pub(crate) fn new<'a>(
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
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..207b865335af 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -41,6 +41,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
             })
             .and_then(Chipset::try_from)
     }
+
+    /// Returns the revision information of the chip.
+    pub(crate) fn revision(self) -> crate::gpu::Revision {
+        crate::gpu::Revision {
+            major: self.major_revision(),
+            minor: self.minor_revision(),
+        }
+    }
 }
 
 // PBUS
-- 
2.51.2

