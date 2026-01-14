Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BAD210B8
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:49 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 546BA10E690;
	Wed, 14 Jan 2026 19:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l0tGHrGd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B273344CC5;
	Wed, 14 Jan 2026 19:22:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418532;
 b=IPh8MuhWV8fc2oa2TGXF7pV1aqA9lkX1x1lgxYkL0rtpAMtl3Y71OQkCIn4uv3FXBAccw
 Vy1cJ8c1GybBqacYSCSw0uolMl0ZgXwQuFzOYCXM3+3v277kqSI7oz6vB9KFlYq/bbZr2i+
 ykVuMVow3js5WToUbjK0tp8AQga30CN8KQPTEtRD3QyDlh/AyGPMbA0flNkz80tmebc0OoE
 PQuS/GVfZrlCbHQjcujb6SZRrMWYKON+VRsGWvB4PekGTsjacJ1UK/ljU49wte8hxvd7LF9
 SdXElIwUMHlEcwshSXeX5sqsloWqtCycGBUwk7DDe6PKQzhhMkCL8BpMMJjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418532; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=c2VggK6gItZrqQzqVnf+64OZZJouFDQdrS2LDWWSPB4=;
 b=b4AnCySNjohS8TNIlH8yiwLZGpnaRb5/yhsL9JCep8F5N/XOt4oR24EnH8pW1NBmkSpQF
 fJCR+yN/bW0SmufHGUsFALglWHhKaFBAaEkA42nCqM1CZYMcR3vHXPoFNdS9KnxhA4rEkRr
 ztDr0jnanL1VEOTkDYOq7NpxQoRK6BZmBXDNjVTibPIRMqiqQ7MfiEtBkBKbQkRlXwO/L2k
 Zn5tzfnaF8xsiJO5ZH1Tcq7UTnsdXXii4LMCEvhjfnSjqIwRnDzH8iB9IolvPdx3+na+I2e
 CVscWmCk0enMvHq+DkoxaNP+JE4wn9S1vQRhEg+Le5d/0hGwLv8168Pj7a3w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 127CD44CBA
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:22:10 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6074710E697
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcR86MpSi9C3pPG1a8fGwUmE5faDeVg3GpdbxrDL1E0CfqU40z6CMivAhX+FaEt30Bb9QpT1NPmGeD2RNJGPYfPiKV31DnpEdJ4uHNMPJtHCKutnx/WYX/iOhY6TG81HaXNu2nHs0kP/nVhBOcrL3S7+8cbxZr/ZXNLM4USMXi0zDdYDk5pF7YdooCOIEEnuGEzjZSJUU91mkjoz1ztyycA1Mc9SQnYi8t0uJ4t6+CkjIG2qiHFAV5Is0xYjqib5g1qi1qyI/ZxDs4a+uI8dh6IkJffhgtBvvAn7za5LFq+tXYc8VeMaVkiWE7KnRi+zD0ecEUi6cRmDIH4rvB1Kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2VggK6gItZrqQzqVnf+64OZZJouFDQdrS2LDWWSPB4=;
 b=Icn63l50l0ehsWlX4MMXTwT1Fz03v0o6TiyxjSqnePM2nG+VviwdKggkWS4+q1xHTgkDcNG9GpQEJuk2W4+UuljM2AJ1n18I+Br4kVb5InsF1eQUizanmT3zDQaPNbrq2eFfFf4utLefRYPDFXCX4GCU3ZGz3yi3lIs48Urdq6f+dte1kzjZNhBnkyHQ9dlWTJqMpCHqY1b94QEDy6u38VshxXRkrjkFNfpmYnfiWUO/1X7cmjJz2XFguXAU/eKHkDDSNvT0TbOKCq6X05EJJVx5jtG9xNtUk34Bzf11FpFBOS6vTpC5vee6MGjlQiWMf1OGbhn9Ojths/KBOL2qKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2VggK6gItZrqQzqVnf+64OZZJouFDQdrS2LDWWSPB4=;
 b=l0tGHrGduYKEsx3vDrW4MrJG5W8FD5QyK61KeaL4OZcMfAeFD3DB45LcIZ5BjckGKyzU7n1C1wE7FcIw/U4Ej0Oa6hNdFgRKrKXw1vSnoZhNfyey+waFj2UoWQlFow2plPHOPDVQbmWbF0ycKzgzjy2yHNokB15jymdSm1Te+cZUwIsqKlVIUxiHZHC0W8gzt3+LCtvUxDyfWp8piHuTDf8e+1OPLYTwPChLlq+cwigcfUD7mXL6biWG0Xh0aaRoGVYq6BDTPpuvYnxiFphMC+F61Trpd6zAC4MBi1AZQbI73sT9h6PyshOM95c6DuTFCZ81xR1uqc0g1UpLnWVSjw==
Received: from BY5PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:1e0::36)
 by CH8PR12MB9744.namprd12.prod.outlook.com (2603:10b6:610:27a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:30:35 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::6e) by BY5PR03CA0026.outlook.office365.com
 (2603:10b6:a03:1e0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 14 Jan 2026 19:30:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 19:30:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:06 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 07/11] gpu: nova-core: Add basic Turing HAL
Date: Wed, 14 Jan 2026 13:29:46 -0600
Message-ID: <20260114192950.1143002-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|CH8PR12MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: f7279e0a-ae52-4bc0-e104-08de53a36396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nrk3p9odbcdXatnjpC/v3vxocIidNGh7Gjap2iDEUihsoHICLxAKOxAwaHJW?=
 =?us-ascii?Q?KVI73OQu45px9IyQGEo032jHOHf6f6EqBf46qfdbdqE8PAUk6sDAOyj0XhkB?=
 =?us-ascii?Q?uKEsAJ8pgGJHxV0UaKBm4SDhzOJb34rf3UProe651aPELF5PO9PinhF1Fx8H?=
 =?us-ascii?Q?iE+TDaO7KC6IY3zyiQ5jOrWquAI0dIV5IivcIFaRbD0Yb64N7iJmjiQnJE2C?=
 =?us-ascii?Q?0HlU3qnpDoh2wEmKLk9QRHEUQNE7p4/rwgSTPiZNDbWbnXWRzuizXNll+WoS?=
 =?us-ascii?Q?fl7ky+Ht7/Xm/t+svOY/qjbhdfR6ruT6bk/p7Wm9Os3Guy33R4JDeh33yqtk?=
 =?us-ascii?Q?ID/MU8CSxkZs43l7cc33jABhJ2swMyuLhQ/g3L9nhtlP7iG9WDY6W0FEbqa7?=
 =?us-ascii?Q?ChVFdB4y8LNZLSqSUoHefnt/wx59NovOSTzbGNv3kCmTqnMZsXqLpJJ6DZGV?=
 =?us-ascii?Q?moi36cMheWYYRh9ZAVz2h/5HtbFL6aGvha+pqIRjU1vHX/iHfc2g5EYbBEkO?=
 =?us-ascii?Q?gle5wCi3fz60Z27sXu/dk4KzKaucjeUSGsWK3MhAdGF584rslkEn1H9uyMkA?=
 =?us-ascii?Q?3Fuc1b5dJKe1Wm2Bd/BdIa/7jH8Cb+rWH5YcAviDnqUuKasQsYuoRS0PATb2?=
 =?us-ascii?Q?B+nJYd/D4u9ObmMedrBE4gS5FSyJuXfPrANAyzRoXd0qr8wKwHsrPCm/5I8v?=
 =?us-ascii?Q?SZp1ggUB3WEqtHANrTGpHVgEAxIcvWBU+GQTC9vWAoXJxfW7kuFyUM2EqrFT?=
 =?us-ascii?Q?Dnf+zEQ4VY7feaq/FKNMrRzFeybV0eL4R+4pajCWM2X/r6iwwquOVD3y8C6A?=
 =?us-ascii?Q?0fWXfQ4tJwGla6Njh9DmlDFlvZerOjPUcuCsqdkddXySucPuIQIlqjvSCfhU?=
 =?us-ascii?Q?Y4fLyz4JxSJ/gEjKhgtr8xypRRWW3A6ZuGLj+i9cxiL3m9LWEU6N0H6pvJID?=
 =?us-ascii?Q?cBnILXRZqiaf5i1mI/+6TFeBHFdgnpCo0bcIhDrUL4G2ynN2ype4Mn0e8vmU?=
 =?us-ascii?Q?KQeXSKaZM13XbzRUgDAMA9oXnMdU7MQGLUSuNWr8VOdmOJQPRMlwY3vHfoNe?=
 =?us-ascii?Q?fHnIqEg6L7YmFWjixuocDOTaHULHVl2y6iC/NbcVFald/fMvN94VFXn9Dsba?=
 =?us-ascii?Q?LkBAsb/FEqxyiHiNnpdfhhBE6qfevHm5+NMKP4v5/zKVqukPNM5rehQDiXyx?=
 =?us-ascii?Q?tfE1VwkL0/n4qSW6SiVr7AgMfj5u2a3pGpp8NZV+5FRWvUQ5/8TX8WcEzBiE?=
 =?us-ascii?Q?3WPZqUHMQo7koBzMIPQh3sgXN7U6FS/RVbGcdsAM/WoIs4vyzQS2KzyZFcSq?=
 =?us-ascii?Q?QirPfJSeFGkD5/b3bQ67hFx6UTDqwHBKrOrtwPsYKzVomQThH01MoROHIf4S?=
 =?us-ascii?Q?Bdq5e9ZIvrp88knmrdgOvAf2u1gBp7TySwDvruZiA1MWH4KluCFilcC/+Guy?=
 =?us-ascii?Q?MTu6gEposMH3oslxMAvtTmoEyGnKTK6AiPk8aGof4qTqr+lx44CLmAzigq+5?=
 =?us-ascii?Q?R5NUtbGYSHMOQ9E4i1V6+SsriON9sca+h5OfNzD4psdOyovxr8oKfNMuvBP9?=
 =?us-ascii?Q?JL/dcnTfz+qq6Xe2Zh9IwnVLLI/xES9U3fIABt0CRwycTM4aSIAvUFsF02mL?=
 =?us-ascii?Q?GtsPUtSj0nSBeFvE/Rahn5nrhf7D0jGCAs5GXv50DFNX3QtdNuSIplf1Jue6?=
 =?us-ascii?Q?HT4Mag=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:34.7345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7279e0a-ae52-4bc0-e104-08de53a36396
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9744
Message-ID-Hash: 332SYED6NJIP76LMJY7YNGEETSQ46OZ2
X-Message-ID-Hash: 332SYED6NJIP76LMJY7YNGEETSQ46OZ2
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/332SYED6NJIP76LMJY7YNGEETSQ46OZ2/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-8-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add the basic HAL for recognizing Turing GPUs.  This isn't enough
to support booting GSP-RM on Turing, but it's a start.

Note that GA100, which boots using the same method as Turing, is not
supported yet.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       |  4 ++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 79 +++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             | 14 ++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c77a1568ea96..c886ba03d1f6 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,6 +13,7 @@
 };
 
 mod ga102;
+mod tu102;
 
 /// Hardware Abstraction Layer for Falcon cores.
 ///
@@ -60,6 +61,9 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
+        TU102 | TU104 | TU106 | TU116 | TU117 => {
+            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
+        }
         GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
new file mode 100644
index 000000000000..586d5dc6b417
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+
+use kernel::{
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::delay::fsleep,
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconBromParams,
+        FalconEngine, //
+    },
+    regs, //
+};
+
+use super::FalconHal;
+
+pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Tu102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
+    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+
+    fn signature_reg_fuse_version(
+        &self,
+        _falcon: &Falcon<E>,
+        _bar: &Bar0,
+        _engine_id_mask: u16,
+        _ucode_id: u8,
+    ) -> Result<u32> {
+        Ok(0)
+    }
+
+    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) -> Result {
+        Ok(())
+    }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        // TIMEOUT: memory scrubbing should complete in less than 10ms.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_DMACTL::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(10),
+        )
+        .map(|_| ())
+    }
+
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
+        fsleep(Delta::from_micros(10));
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b8ddfe2e5ae7..cd7b7aa6fc2a 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -307,6 +307,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     secure_stat as bool;
 });
 
+impl NV_PFALCON_FALCON_DMACTL {
+    /// Returns `true` if memory scrubbing is completed.
+    pub(crate) fn mem_scrubbing_done(self) -> bool {
+        !self.dmem_scrubbing() && !self.imem_scrubbing()
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
     31:0    base as u32;
 });
@@ -389,6 +396,13 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
 
 // PRISCV
 
+// RISC-V status register for debug (Turing and GA100 only).
+// Reflects current RISC-V core status.
+register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
+    0:0     active_stat as bool, "RISC-V core active/inactive status";
+});
+
+// GA102 and later
 register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
     0:0     halted as bool;
     7:7     active_stat as bool;
-- 
2.52.0

