Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B338ACFB95F
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 02:24:54 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0FC10E56B;
	Wed,  7 Jan 2026 01:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nbIDvO4i";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 41EFC44C9D;
	Wed,  7 Jan 2026 01:16:39 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767748599;
 b=vespLErM4aZrcWpxbRcwnfTu/x7sQg7MRpU4AISWS9haonTGawvSbG+NwiFhhIvHvEzvm
 hg/T+MfdObc8br2HbgRyzyLCi3PbhnayqzQrixg9AmbY1C53JdvKf2xocvn7pJdJZUgrSTR
 glHbv407L6nn04YuZFWKpTQO5zx+fWZHakVDo5VbTMeyRKgQGBTYa8926/1LLqt+nZsJLir
 4Op5G9t7WNJekYVtq6d90PdmJ3vDUHU8K21lTqfZ2vMPJAVMa8CV0Hjvl77SixIoquQK898
 9UfdHp+RRz2OMNGRJ85wSfzZ+zpAeXM5LyMgE4E2AhA9GFI9MyF4rxXJgZHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767748599; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FXmxtNjri4MChHWUqcW6snwdUK0TmI1zBlKt4UaLvu8=;
 b=ZhfsqroYQP6vG4WhMM1QplJQNB1EcovktDJ13C42tljiqQePfEC1CgLh2xd32waHOsvoN
 hJBvEhmq82FEpq0A9JAqb37jup+UtiY7H9VrXGeK08z5X9jBrp+q4od95X+EBCWr/RUYajK
 VyNybCvCf2jMfH9/jjbZOUsauL/O9zMqAYTfTqdEIR91k2E29nHb5c4pccJ3V5WcT7bdsFq
 K/Cgu3EHRrwn3q6pl8Xd1o0dZSKsU1t3O7rV+j7T6JicUqr3Mf5Rc0eqzBBWrqBszOaNjVm
 5KnxvJY4HGD3Vg+5ph6slZ6JEZsPwFn6iOm3nYfmVPnIoy5SyeSln1e7rlhA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1E9AD44C3E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 01:16:36 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 29E8D10E564
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 01:24:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h29fEK0BAF8pOjGi3wLcnn1GuEYXQnDnscj2bc0J4JeJKYh87NleaCMfgNuYRheAU9AXkE2qoruocMcDTPim3Nt3sX2ynxWLxa1Zf/wgsTXhJAShRlzBfT1vcMf9/aSdr1TOdMniPnhBatFSucY5vZWy8Zkz+eDfWDacDk2iKz1e4GYSdCFVR3vee9Q7ArWzFtLlGOfYWLq8AZzOB8AUQLCRS8d6mOb0F3QIBxHLevN/1kz2W4JeCA2EX0iiQAJOmUFTk5KVYMk+kTFO5hEpyjelH/vyXaGjuJ99TYftOZtRJnfoTIqk7X5Dj06gkx2lLGAmZUZqAlksQEPmE+o/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXmxtNjri4MChHWUqcW6snwdUK0TmI1zBlKt4UaLvu8=;
 b=BEafPpUqGOG5tGQW93j9Xe13FMphHvi0iZH3H5W8aVbGLzTLj93a83wYQjc5Z2R4ASFaEz1B1IiYAYnYEYxR2M3kLgAzws+ldCxv8w+IgJWXnKeZ2cnxIuYRpeHLTglD554WEyikGvBp95s2j9FMzQzeLIsj1ybX6CbPY+Mxj7UcuPv4ZHblGLUci4QuWdlH9YjynhU+8OaBnQLxeQj0q+ZgZ85kj9vhjx8FbriQ+aQuwPumnMS8rL1XM8R7ehygiBR45DfP7+XsSsPdEBvioh7n4HxI1UBOSg7nXdHVOTv6k5b0z8S4AppVKWTaUOeUWsuA5KWvQ64iwWYXg+WdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXmxtNjri4MChHWUqcW6snwdUK0TmI1zBlKt4UaLvu8=;
 b=nbIDvO4iKGjRU4azDp04kRjsEUjGsYEGSUCVsUUeRpWUdi9oHUdTapIm5KVoYoCkT2po6Qy6CX4zRLM7INURFRlQwjMoaQziXFmLe4MfbRl3KuYvG1pIjiEeC1rUsTuilgqAEu3asUQObCuK2xQgSDL7iQbwvGtRH/U17nNJkHhxUYHXLM95ifQyF0DP8eRjPXg9PpMsFuN4zRAurrG8tMOl6McCv/RiNH5ALRX8+2DnZ3PtcG8JpB5Vjh9wYlUaOAr+7i0FXQBh8LedL0rZcbpSNw2jbPTLrkmMoIVDvOagxUDuGbSbu+G6yrXejlTH4SCYi8erLstXax59uSFOfQ==
Received: from BYAPR11CA0052.namprd11.prod.outlook.com (2603:10b6:a03:80::29)
 by SA0PR12MB4495.namprd12.prod.outlook.com (2603:10b6:806:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 01:24:41 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::63) by BYAPR11CA0052.outlook.office365.com
 (2603:10b6:a03:80::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 01:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 01:24:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 17:24:23 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 17:24:22 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH 2/2] gpu: nova-core: add missing newlines to several print
 strings
Date: Tue, 6 Jan 2026 19:24:14 -0600
Message-ID: <20260107012414.2429246-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107012414.2429246-1-ttabi@nvidia.com>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SA0PR12MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4021f0-2cdc-458c-03e7-08de4d8b87e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UxI0nakBo/45Gi+HQbpLrvPBHo7iT/cAKU9FVp9Ni1t7rXC3L4aWTUsyWtFv?=
 =?us-ascii?Q?XUdtFt9pt5sbYo0ULn0LizHzIyACw+h3/7ulxjfiStwGJenwAkfpLBRzKmFE?=
 =?us-ascii?Q?plwiC10ZhnWAEZij0vDG44CXWhaZl5hOPwOSJ+DT2IjAl2RnFo05rH6ikL7/?=
 =?us-ascii?Q?XNA6NetUxVv+LqGun0K+WByvPhcZ42SVjVd1RS2xqAKjbf/SzMDhHlCuaOlU?=
 =?us-ascii?Q?MCfjqVpcVWORo2/+kjfqb8oTU3ib9Y8iWe1Jyk39Fb7vXYbb+Kkun70wTxPN?=
 =?us-ascii?Q?8//ltZArpP3CBtRRStx/y0OTAdqPccvPQXmox8Z+3bkcu0ryMMnZh8mEBrko?=
 =?us-ascii?Q?1UaiHKxFt8dLzxRpxFrjY1Mw2tg49pjlkDSslaoWSSDK0bodliVqkkxVM+gD?=
 =?us-ascii?Q?qknMMZCeTC62q2TkN+G40975Hw8KGhpfGCIOhe4gyYaRyPSu9RdFBV3l2Dwt?=
 =?us-ascii?Q?nAWlkxAe60/hkCvTLsKzhVEKsxV89uuE6dbddkMrb7ZkDvCROeFSAt8aGUG4?=
 =?us-ascii?Q?vpfECER1CbOrI6X5K9gR9RSl0C2VYEFXJNYwHyNKrhlwm+3wdBnlkDL/dw6e?=
 =?us-ascii?Q?ELG7M5cWGJ+ahwGn2K9ocQ2+ciTz6WbiA1Azbt6mNtplMTJVDIqCPPkFzLHa?=
 =?us-ascii?Q?P8MC7EgbZhiuJa4c2TF1yAd7fHDh7TJkuOhomI913+UTvoNiOJXxJ7TllXxF?=
 =?us-ascii?Q?FQXIkmyw+L4U8KALa5BOCpHE59+HIWSFrYwKDCDpk0z2Qi8dfunlVrHP09dc?=
 =?us-ascii?Q?1CBP6I+UK0Vr0zn+gB1FxNI9QqkfIWXUJVbdZm2s5AQUc+FBpwVdtHSapQmy?=
 =?us-ascii?Q?YzWV2NDK6F7gA3DgWSQYU6MGNIGt8gB/0ahCoHgyCdaOXX1vV/Cj+mN93XpJ?=
 =?us-ascii?Q?5qJ7xi58WA2inODQKqrCWaJwru1pGh43cpXn39xKPzL/lczCk+zxwfJMYgjm?=
 =?us-ascii?Q?lZgKkbUVEg0lzOJEaqfAzX3yAURsdF/Ac+MwNq/bL8AZo6IP+9qitcLzhTrJ?=
 =?us-ascii?Q?PPLCxokaQS2HOt2G0mzr4eoBD1+fGuqMzH9Z8jHn77STkxI6eyhg9uYt+Qh2?=
 =?us-ascii?Q?KGn/Q7YDWl6yQeYUgZVkUS3OZwT1unz8EQDV4wfdv68hXri1+caGzV6mHUkr?=
 =?us-ascii?Q?qxwFZG7knYWu8lMnUrLwVrrV4fJAYtRmbwd1CfGhP7VtOIHlNnyGB6VMxqHw?=
 =?us-ascii?Q?6USAnPHjyoYhGLRVKcWayl9EluZ4/FDbzw0+VPeFscnFD9x7TaN/WjYPVNX4?=
 =?us-ascii?Q?CaUOXzqI79j729c2DD2dBkmLXUVvjgsNGq5FRl+v+Qs8bzFrylPW/FVZlBZW?=
 =?us-ascii?Q?cICUOcS03haqIFyFf0IxtBpeycTWzZFezEsBZ08oMJYbXfoU57pvC8tSu7ZJ?=
 =?us-ascii?Q?INrZvkK2oXZ7NbhAQ8quu6y11g6kb6/9aZWBxBpos4gYx0/z9ZtyOJAck+ad?=
 =?us-ascii?Q?AVVbwiyq5Zxqs9Dx73tXYS89sC/VvtiKT8bdteiHhfGqHD06vnbVyefn6Mhr?=
 =?us-ascii?Q?Y4IpwG3qzDG5AYeA8WRQnfq6XKOh61Gpa41VHpA/bT5K66VeLjK40TVq+aQ+?=
 =?us-ascii?Q?dXbxo7bi13pGf85aOIo=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:24:40.7571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca4021f0-2cdc-458c-03e7-08de4d8b87e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4495
Message-ID-Hash: XYD2YVCNWC6VGRHHI27KGCB5OU5TKSNT
X-Message-ID-Hash: XYD2YVCNWC6VGRHHI27KGCB5OU5TKSNT
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XYD2YVCNWC6VGRHHI27KGCB5OU5TKSNT/>
Archived-At: 
 <https://lore.freedesktop.org/20260107012414.2429246-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Although the dev_xx!() macro calls do not technically require terminating
newlines for the format strings, they should be added any way to maintain
consistency, both within Rust code and with the C versions.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 6 +++---
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++--
 drivers/gpu/nova-core/gpu.rs              | 2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs    | 6 +++---
 drivers/gpu/nova-core/vbios.rs            | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fe5abf64dd2b..c1cb31c856b5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -466,7 +466,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
             dev_err!(
                 self.dev,
-                "DMA transfer start addresses must be a multiple of {}",
+                "DMA transfer start addresses must be a multiple of {}\n",
                 DMA_LEN
             );
             return Err(EINVAL);
@@ -483,11 +483,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             .and_then(|size| size.checked_add(load_offsets.src_start))
         {
             None => {
-                dev_err!(self.dev, "DMA transfer length overflow");
+                dev_err!(self.dev, "DMA transfer length overflow\n");
                 return Err(EOVERFLOW);
             }
             Some(upper_bound) if usize::from_safe_cast(upper_bound) > fw.size() => {
-                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object");
+                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object\n");
                 return Err(EINVAL);
             }
             Some(_) => (),
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 69a7a95cac16..0bdfe45a2d03 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -52,7 +52,7 @@ fn signature_reg_fuse_version_ga102(
     let ucode_idx = match usize::from(ucode_id) {
         ucode_id @ 1..=regs::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
         _ => {
-            dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
+            dev_err!(dev, "invalid ucode id {:#x}\n", ucode_id);
             return Err(EINVAL);
         }
     };
@@ -66,7 +66,7 @@ fn signature_reg_fuse_version_ga102(
     } else if engine_id_mask & 0x0400 != 0 {
         regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else {
-        dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
+        dev_err!(dev, "unexpected engine_id_mask {:#x}\n", engine_id_mask);
         return Err(EINVAL);
     };
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 50d76092fbdd..9b042ef1a308 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -268,7 +268,7 @@ pub(crate) fn new<'a>(
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
+                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index d78a30fbb70f..d965ffe9ba89 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -121,7 +121,7 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
         };
 
         if data.len() < size {
-            dev_err!(dev, "Data is not enough for command");
+            dev_err!(dev, "Data is not enough for command\n");
             return Err(EINVAL);
         }
 
@@ -320,7 +320,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         cmd_result.map_or_else(
             |_err| {
-                dev_err!(self.dev, "Error parsing command at offset {}", offset);
+                dev_err!(self.dev, "Error parsing command at offset {}\n", offset);
                 None
             },
             |(cmd, size)| {
@@ -382,7 +382,7 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
             dev: params.dev,
         };
 
-        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands");
+        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands\n");
 
         for cmd_result in sequencer.iter() {
             match cmd_result {
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 7c26e4a2d61c..e4eae9385f47 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -790,7 +790,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
         // read the 4 bytes at the offset specified in the token
         let offset = usize::from(token.data_offset);
         let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
-            dev_err!(self.base.dev, "Failed to convert data slice to array");
+            dev_err!(self.base.dev, "Failed to convert data slice to array\n");
             EINVAL
         })?;
 
-- 
2.52.0

