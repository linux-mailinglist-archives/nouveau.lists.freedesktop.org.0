Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE4C087DC
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 03:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AACF10EB45;
	Sat, 25 Oct 2025 01:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hjx/qRI6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB6210EB45
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 01:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNH6pL3+gJMQqjgoSqilVEY6wTBgJUxDUv1TzNdmmw2RCK4P0PUTvt3iX2SZO+VUbJzdufyNByBHG8YkKlU66QwYd5DPmauVBO2ldBf+wIgRM2wN6UcXgxkS7N2NQsGVB1dEVHFbL/9VPyJ5vm+PkYc46Bw5gvxHKQVBSUe48eRyEIp1D26WJKfuNPsb8oG5Ti8H3NIduEQTaRup7RDeJ1vaRrFH7xx+WJlXo+PbtxbR/zrjmcZ4qQ0oXD9j4GgkT0MUeuhDULr+y+UL7uT3t2R+v/n2bjfu3yYHL5ikFx5jLLaE6rt8GYMdKR555/20e948wC0IEM+zejCE83v56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUL87BrDs+d/oUJ5rjAmBlaPkQAM8teMZzHQ+mM5ZkU=;
 b=MJ6S885dDH9zf/WljvDy0bKY8KN+IHDG1sMaSr8rvIOjo2VGvldgNefef2vlMtrNdxGz5BN4uXiWX/9fPuFAT+0EaFp7yazY7bN2MSOd8krMbibmj6zHZ6XHWP2WB9boXP2smDU/iCbuFEief7Hl6F0dcZgqkzfBoAp1PnWkp7TxMvNCF7szLziWTTswHOODcyrKO3ekUaVzZkN6ZvVb06lph/Qpg3NDQrcz0G2QJAvbigvgNtJTiBJiwJx8YRAUss+339jJDyI7X4+CwHL5sSzj3ph9IEBtdWGUFwRZn5ZyM4MRLvQEQ8nL+qECiXrp778W11cEFnL7Bslosu14QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUL87BrDs+d/oUJ5rjAmBlaPkQAM8teMZzHQ+mM5ZkU=;
 b=hjx/qRI6nUuGoQ27aYcmdDaqEdsRphsWGQa2hplneA114S1awwTXh2My5UelLjCaKeDm/QqDILDwZHqsXClK90bF3hd087D/lepgJGs4vurLQbKU8L4PVSx/qWEct4dE7RhCLsvJ/4KTuVN5nI7DfsWE3ezWZ8LZyksc8yg6+cFFHA9eyMFmW4F5lEJgLtAh50VZN+KpHoxKVjP1XX+dUGylGBtEfbN9IpkugvvETZuRe5q5Ja5hJe9QwM3vZ+1PqVNaR/vY80AX8kpvpT3Pmnw6Y4cT/HWnPIgr3NRfNtYmDTEsk/6lYl3XBrbwk4jzx32jkMK9L1I5mkg9S8VcLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 01:08:18 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 01:08:18 +0000
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
Subject: [PATCH 1/1] nova-core: regs: rename .alter() --> .update()
Date: Fri, 24 Oct 2025 18:08:15 -0700
Message-ID: <20251025010815.566909-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025010815.566909-1-jhubbard@nvidia.com>
References: <20251025010815.566909-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: ade6d14a-097e-448e-7e58-08de1362fb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jrcqP+WQrnsgj7ffh2CFZT2VGY2XLvn0KJ9vKHujLYv2lOk5y9A6ZOG/d/57?=
 =?us-ascii?Q?Y4mtOZDu/0DqtNVo8DK5MSz1z28huaYl3sUNAlU0V8RyBI6V7tEcIfKFpkiu?=
 =?us-ascii?Q?iVC59qLBt1cTWfxp2FP3WV5IAEsjM2FlaGG++7khpCVDjkZYgMTAyy2RAs6P?=
 =?us-ascii?Q?1fpxLrFX41NvYGpCudk41jlT2XIZN5qrCXXZcl3HpImegWG7mtAlOlw5ZTGM?=
 =?us-ascii?Q?xg6SEq9TMjtw0dXktzQOuhkmD00n+SJ/004eHPoJvUfj2hVyNp275AUfMtwx?=
 =?us-ascii?Q?T4mdcXdK3N/inzpcdDpIpUTGRPh8bp8qYQatLvAXi6nJHOJCxV2WlzLuUseG?=
 =?us-ascii?Q?AMHPrjhpSlmVNlk4bjckLZ7ZYE5YP3HYlNU12zloaO7+HaahV9jitCGSySDi?=
 =?us-ascii?Q?nlBVxJeZLPaHaJ+Zl8uDdnQedUNUPRDVNToAWhwDoO+ifZcTBPo5vIicw+9P?=
 =?us-ascii?Q?ghe97K5/ekZe3CpelMIqhjJdGwfWGxXXpq+Y6E1vfr0XaZL7W2OYZpMxIoQ5?=
 =?us-ascii?Q?XeBuyPywUBwQJSspcIaMXy2KwY51+tTGJsOlWHRoLmA1Aei8jK+C6pAtCd5d?=
 =?us-ascii?Q?VNEZV7ba+2/cfJ4beUkVpSsXMU93wjGRHeT+Gmja6z6w3JslcBNY51WxjrZF?=
 =?us-ascii?Q?v5dbBN1b9il+axUA3LpDunjaRfFc42W3Y4PRTFmRTtyDDtP6OFclf2oUkxBK?=
 =?us-ascii?Q?m3cmXFgEULavc1B9Mfc6wZ5m+PkKWopV1VPUzBjiS9y255rltSRLKf6sfkAD?=
 =?us-ascii?Q?Jjgsj/DQNC80zJVwTW5Wx+25BKOAkB4201F6W2W1aYHl+f/1Arm9RYLbnm1W?=
 =?us-ascii?Q?kGORR7Gx/rTIziybKLyyBL9PJaOy6PssL5iArKoyRCivySeIppAqvnlBQkWQ?=
 =?us-ascii?Q?A6cN9P6BeHgQqZfj12TnazmziAnKSWMCbkV9hQBhwcrCBSxJC2or6GSLoh2x?=
 =?us-ascii?Q?OFQ01HsI+hmjgtKZPi9OWXyBd/iE32UfE2MbD6pyrZzY+naIkTDJe873pZbV?=
 =?us-ascii?Q?TE6Hze7Eo54mZ88HGicu+dgaBLjHaNW+NzNo5lnnjCRV8aubhUOu71J09ShF?=
 =?us-ascii?Q?ctY57Z0CnFCP8LguoGgt+0onk28uWlm7O4rxEQmUsmFdhazlH0s5t2gKPILM?=
 =?us-ascii?Q?NdlVVOXbF/ZZcdL/+Ni+x6g9e0OVYlIOW7TqnTkvNr6fAPcVs2/xky+TmFmB?=
 =?us-ascii?Q?x7VazJH8V9WqPN8eInW5Wrf+lAXvH5xg/AITexDPX2Spf3oZM1m9fzR72JVg?=
 =?us-ascii?Q?1EQ2UThzGYWq7tp186avUOBtrd5YmURDBkhZ2OzXWTUXc9warvRh77MMlCQX?=
 =?us-ascii?Q?lDxb7XaaDtSnj8PXPaGH9bGzqBZ7AOMBNy+1FTArk+6VRJ5GeD0C4UqrRoL5?=
 =?us-ascii?Q?Pth6fdwH6Ic9+w1C3KkBbZsM/1l5KsotXdC7BPU/Z6H/VD4zbv4aTRK4UBCF?=
 =?us-ascii?Q?blDvSOcuriImgsyDK65ZZ+cpTjeE7tyj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6/8Hnz/2U6sQfwyqImk77QP2AYRW7FQC3SBmzrlW3omW++dzRTNPSEVaS19v?=
 =?us-ascii?Q?aypjGCpm+WIlJzK9rPNhbqVbp1i2aLXOiQvlkN+2bqV47FwNd8i5I230ZH2M?=
 =?us-ascii?Q?fIbWnc+QZqgt4NhbGsf5UmrPuop7ZdODsaHmr9zXmevdtoo4IidykbDjhIK8?=
 =?us-ascii?Q?txdHAjktGIPwfSy1DgAq/ZtfVGkJmYfktleZ0USAkhL37LaoIzUKBcMezvQ7?=
 =?us-ascii?Q?lQx5P6zTDwknP25j1rkdbEe+3SuqqMc2IqMGTEVf0hyYqtKipxj8cLFjeL9j?=
 =?us-ascii?Q?3l/pDAEv6m67TnzsqPHNkwuPWUf50Yr8bkY3nCtxmnWz3WvaYbnOyKQKtHBN?=
 =?us-ascii?Q?1ShB2GOHUGxdE+ZFPRR/CVteiN4z4xp4jbh4Kn2SQi27r8Vnd24zlNAXk/dr?=
 =?us-ascii?Q?CiUEuZx5pV++ItJXnS4artpcfN2wWUjx9btcNLns4993DqUAiHn+ccq7ufS4?=
 =?us-ascii?Q?OkEgfipVXeuoWHw/ssyyWE3mH/42Ts8D/hr7VwClz+NHjMsPwV37/9TUL50S?=
 =?us-ascii?Q?Xt/TuqIoQpPqdZiJ/FahMNzQ7PbRuqIHxckrTkMlLTxO6rts1iBi3C81m0sV?=
 =?us-ascii?Q?Il29b19G2BOT3OaAtCwxExuPQehfJSnHDV6DAKKXfewRf2HRaUUZkyX+4kZa?=
 =?us-ascii?Q?reOG8u8j1PDbR9P1YQ5PSqoYYqtQqYcPn8ikCfmgRGTOjQ/jxWEaWrxAxj99?=
 =?us-ascii?Q?uwsijCF2RxIwhKK29ytFhpFW+nFU1QO5dbpeJeCU1fyvivNXxzc6N3ymaC5J?=
 =?us-ascii?Q?Q74qfOzX62uXKmK+iBY5ZFyB74AmjbB0rtdaDOTBwbavYqGHuPDYIuTv93TY?=
 =?us-ascii?Q?VT7v/nYWTekpisiUmikKYJdrrlzFpPxgxf5lKiUCv/dZUgRszgrfkWkwS7r6?=
 =?us-ascii?Q?XEYdu5+Myim8mzboglh5BDgNx1U5enRb0MsR9701JL3XeFKO/Ld74KIA2vWz?=
 =?us-ascii?Q?jF6y6Md32eqkp8d8B41IaRtyChBtSPZ1HI7TA+fCA62jf7XNKuk8VLYgVBIv?=
 =?us-ascii?Q?tjHJXcK89/vn91P0R08C9nXPBvQY7JpRqVf5mrUYb0JDWE7DTG29u8BVkBBk?=
 =?us-ascii?Q?4dmWmoedgLxkX6z2zXXny0718lNEiVybfEv7/eS+T8gQNom6hKY1HZY9eQe2?=
 =?us-ascii?Q?Gx9PUVq+TU3SIIACFk4LEjJkd32DLI21j3f6ucwlIZnZDmfgb3o/9EWJCPD7?=
 =?us-ascii?Q?oj0yKOAbSFRK1bqolIwa6X4ktBhTnfbth3r7ixXaoikTNuB4CixHr+t9P/GE?=
 =?us-ascii?Q?nifghJ3Qy6psYisnJKheLEoFLggN8LItsW0EjAKVuOenLflE0ZKjgd6RpfN9?=
 =?us-ascii?Q?n7tKDebfVRelQEqLj8kidLT/Z9/cy8ZbVnDaJJueGhy7HvWVW7Qu3IpKQRGp?=
 =?us-ascii?Q?ZS6UcHPdocodPplmFw/C5jMrPc1m/A6cwHyfexzrgemHNEWEzrkIF8oscxl0?=
 =?us-ascii?Q?pXKTo1SdtkiK8v+SdRpZoMBo0+MwWqBEsH+VAgg22S/XcmB4vcZOuo+I2SKf?=
 =?us-ascii?Q?M6A27c9gxkJ2taqlr5cb2Q4QKbKPR+Zko6akyYbhwH6Eu7t2txsz7EXAb8CM?=
 =?us-ascii?Q?CiGsj+Taey8USVMj7TEkyivG+0ZssXB/HUEvqbxK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ade6d14a-097e-448e-7e58-08de1362fb83
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 01:08:18.2119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClDggWK7Adl0uKMJ3aDMsHwasLoG1FF7dn5kzSGJnFv+HSmXwLNFvtNm6OJjnKjTh7Hj5BR/ttE0njGPNoOGbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801
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

This also changes .try_alter() to try_update().

After this commit, instead of "read, write and alter", the methods
available for registers are now "read, write and update".

This reads a lot easier for people who are used to working with
registers.

No functional changes are intended.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs      |  8 ++++----
 drivers/gpu/nova-core/regs/macros.rs | 28 ++++++++++++++--------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 3f505b870601..1e70e39c9671 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -420,13 +420,13 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
             }
         });
 
-        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(true));
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
 
         // TODO[DLAY]: replace with udelay() or equivalent once available.
         // TIMEOUT: falcon engine should not take more than 10us to reset.
         let _: Result = util::wait_on(Delta::from_micros(10), || None);
 
-        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(false));
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
 
         self.reset_wait_mem_scrubbing(bar)?;
 
@@ -543,9 +543,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::alter(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
-        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, 0, |v| {
+        regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index c0a5194e8d97..fd1a815fa57d 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -52,7 +52,7 @@ pub(crate) trait RegisterBase<T> {
 /// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
 ///
 /// // Or, just read and update the register in a single step:
-/// BOOT_0::alter(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
+/// BOOT_0::update(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
 /// ```
 ///
 /// The documentation strings are optional. If present, they will be added to the type's
@@ -136,15 +136,15 @@ pub(crate) trait RegisterBase<T> {
 ///     0:0     start as bool, "Start the CPU core";
 /// });
 ///
-/// // The `read`, `write` and `alter` methods of relative registers take an extra `base` argument
+/// // The `read`, `write` and `update` methods of relative registers take an extra `base` argument
 /// // that is used to resolve its final address by adding its `BASE` to the offset of the
 /// // register.
 ///
 /// // Start `CPU0`.
-/// CPU_CTL::alter(bar, &CPU0, |r| r.set_start(true));
+/// CPU_CTL::update(bar, &CPU0, |r| r.set_start(true));
 ///
 /// // Start `CPU1`.
-/// CPU_CTL::alter(bar, &CPU1, |r| r.set_start(true));
+/// CPU_CTL::update(bar, &CPU1, |r| r.set_start(true));
 ///
 /// // Aliases can also be defined for relative register.
 /// register!(CPU_CTL_ALIAS => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
@@ -152,7 +152,7 @@ pub(crate) trait RegisterBase<T> {
 /// });
 ///
 /// // Start the aliased `CPU0`.
-/// CPU_CTL_ALIAS::alter(bar, &CPU0, |r| r.set_alias_start(true));
+/// CPU_CTL_ALIAS::update(bar, &CPU0, |r| r.set_alias_start(true));
 /// ```
 ///
 /// ## Arrays of registers
@@ -160,7 +160,7 @@ pub(crate) trait RegisterBase<T> {
 /// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
 /// can be defined as an array of identical registers, allowing them to be accessed by index with
 /// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
-/// an `idx` parameter to their `read`, `write` and `alter` methods:
+/// an `idx` parameter to their `read`, `write` and `update` methods:
 ///
 /// ```no_run
 /// # fn no_run() -> Result<(), Error> {
@@ -386,7 +386,7 @@ pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
             /// Read the register from its address in `io` and run `f` on its value to obtain a new
             /// value to write back.
             #[inline(always)]
-            pub(crate) fn alter<const SIZE: usize, T, F>(
+            pub(crate) fn update<const SIZE: usize, T, F>(
                 io: &T,
                 f: F,
             ) where
@@ -449,7 +449,7 @@ pub(crate) fn write<const SIZE: usize, T, B>(
             /// the register's offset to it, then run `f` on its value to obtain a new value to
             /// write back.
             #[inline(always)]
-            pub(crate) fn alter<const SIZE: usize, T, B, F>(
+            pub(crate) fn update<const SIZE: usize, T, B, F>(
                 io: &T,
                 base: &B,
                 f: F,
@@ -507,7 +507,7 @@ pub(crate) fn write<const SIZE: usize, T>(
             /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
             /// new value to write back.
             #[inline(always)]
-            pub(crate) fn alter<const SIZE: usize, T, F>(
+            pub(crate) fn update<const SIZE: usize, T, F>(
                 io: &T,
                 idx: usize,
                 f: F,
@@ -562,7 +562,7 @@ pub(crate) fn try_write<const SIZE: usize, T>(
             /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
             /// access was out-of-bounds.
             #[inline(always)]
-            pub(crate) fn try_alter<const SIZE: usize, T, F>(
+            pub(crate) fn try_update<const SIZE: usize, T, F>(
                 io: &T,
                 idx: usize,
                 f: F,
@@ -571,7 +571,7 @@ pub(crate) fn try_alter<const SIZE: usize, T, F>(
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 if idx < Self::SIZE {
-                    Ok(Self::alter(io, idx, f))
+                    Ok(Self::update(io, idx, f))
                 } else {
                     Err(EINVAL)
                 }
@@ -636,7 +636,7 @@ pub(crate) fn write<const SIZE: usize, T, B>(
             /// by `base` and adding the register's offset to it, then run `f` on its value to
             /// obtain a new value to write back.
             #[inline(always)]
-            pub(crate) fn alter<const SIZE: usize, T, B, F>(
+            pub(crate) fn update<const SIZE: usize, T, B, F>(
                 io: &T,
                 base: &B,
                 idx: usize,
@@ -700,7 +700,7 @@ pub(crate) fn try_write<const SIZE: usize, T, B>(
             /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
             /// access was out-of-bounds.
             #[inline(always)]
-            pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
+            pub(crate) fn try_update<const SIZE: usize, T, B, F>(
                 io: &T,
                 base: &B,
                 idx: usize,
@@ -711,7 +711,7 @@ pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 if idx < Self::SIZE {
-                    Ok(Self::alter(io, base, idx, f))
+                    Ok(Self::update(io, base, idx, f))
                 } else {
                     Err(EINVAL)
                 }
-- 
2.51.1

