Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0D3CCA2CA
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 04:30:29 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C206B10E374;
	Thu, 18 Dec 2025 03:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j6M8HIkH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C47C044B08;
	Thu, 18 Dec 2025 03:22:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766028176;
 b=duySw4lKRE18v6D2++qMuRSqPdWdPVgUNK7l9fK7bZvbRHqZYehws8YMUJndBlzHIeOMo
 nIollKZdpTOrp+M9eEBbP5fJRofsHvk80sMls5gbQwTihqcQyN5ImNU2ZMWxcROahAnh4i2
 8A/iVZy8F7yTWogQkaLptRU44KXayvKb6sxBPpiR2wp/FZKwx/9O+MSd9BvgkKI/v8G9/yS
 0b1B2mbGWe7m3p9ohY2xm9y37OYzKQy5WHxcBZwaumNQ0i/1yaShx6eqtVvTwGnD6TmetRp
 w3L7+cRn7NIj1snllRIalD86pjH5TJGIvXlNyYSzzwQr6HfHmouirXn0sqAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766028176; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=m9L1hC1L8/WnA58TJjcevxe6EOrA7+1t6oC6gyq5eoY=;
 b=mL0awfuL/Ulu3yb2zRSzNrcBUXiQBh+UfJkn2F4jooV4AMoH1/33jqNrFQapsZVHswvnx
 +NFalBYYr+hDzAxB+aYRVHMW7D1MlIaWCGRqoqednWY3SvGIuF8NBYMyZZAcMcxYt/yPGko
 euKF1LJtmZZMmP1NTPg1yDvFrTy7TC8MGCmYxuaGwGxmEdBA2Wy5b2NiMtS6c/+DDJez8Zz
 t4cfisexU/E0yp/RtZ/8psxNDJS9Fhhtjf1rSBftRbwGfj1GSRfNJ2FgjMbwjlpB9Y4nVXQ
 fNIkBiEzPtDJoSVhILuG25avcNZeWi5gcdrd+B2i5CQS7X496GSNQ3B6c0Aw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B1C944B08
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:22:53 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 17BFF10E0EF
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:30:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKgiko/IlRJfSIXWptFqLInoy7xhDJo9iDul4iAbFdiRyUIsY1Yawtfwgz9d3O+Csok3gH2xN97XTBgBb+E8pDktpbBgfM3FuFiF1pwvuTlKhFQNnD4AJ++SI/zo6Rh06bA1tehBbJe4zZNO4tTZ5i42gWu4eZz/dgVxIncoGAGwwf99YjzafiNmAvnFktD/7haBAYoF37GoDdC0EwOyrj/IXgCaFpx8wyHsJUlxVDnoZvDAgPwn0xbUuAllwn8xg6BvUd95qswNrjK6xiBaa0J4ycsnva+mSh6+LhpvNxCLYe+sMRnhOaicVC/wwdrs5y5IVsNnygmzBYVO7Re+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9L1hC1L8/WnA58TJjcevxe6EOrA7+1t6oC6gyq5eoY=;
 b=vlPKEWAAjjP0HTOHztEpt+6suFVVLl4XL9XSoxDkp5Vs2LMSLrQU9JDfWLnIYAQvxcrQjkj07XDogUaqF9JZj22OBJkN1ZhFrsqS4USackNrejuItcrpHpjP3xzDd7S7Ci1T/sqKSGifPvHdyT036l3BYAVmCpCIRbcKhdbkoJET78W5E8MuMBPqKeYxF1ifxr3QRVFqBT/M6XpiFKG3MMTGJ+d5ni29jSSxieCXia2iIqRzAxIUijc+1T2zAgfdCwWBXA1TR9syNMLMhf7A5FFuy/lqO4VC18KNXTacvNAMe0sUqfrD54MuvDzPZT3MrneFwEl7J0uFjjB5jBPuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9L1hC1L8/WnA58TJjcevxe6EOrA7+1t6oC6gyq5eoY=;
 b=j6M8HIkHi20fDTRzRYo3J0wWnzG5TyZi4tvgWwu7V+TI42dNwk/BXlPBrvbaJI2p+bBTo4GDld/ZLY1F4L5SiWyNpzCIF/o6N2h5190M+1/2c5eEYs9fHmYIgwTPQg2LuFoKwgfL1jR+hIo5AanekyUQyTdiQwe8k00+JGBof5YfPkvzFSgclswpotxY7+dZV1Y1JkPEH+kHBHgpc1OjDOSljASHYjwbd92x6TaQ+DWB6TH7gIGx+rt7lHf+2au9Euex9Ftohitn5mrhRkao+WavG+4sj3nRWb+gYtNgyuAghMGf70auVgVxtWL4wreHsz6BFjhpLemnSR5w4agYVw==
Received: from SJ0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:a03:33b::31)
 by SA1PR12MB8886.namprd12.prod.outlook.com (2603:10b6:806:375::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 03:30:18 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::16) by SJ0PR05CA0026.outlook.office365.com
 (2603:10b6:a03:33b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.4 via Frontend Transport; Thu,
 18 Dec 2025 03:30:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 03:30:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:06 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:04 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 01/11] gpu: nova-core: rename Imem to ImemSecure
Date: Wed, 17 Dec 2025 21:29:45 -0600
Message-ID: <20251218032955.979623-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SA1PR12MB8886:EE_
X-MS-Office365-Filtering-Correlation-Id: abc3cf7f-4b5b-4ef3-c839-08de3de5c42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4CLlO1z1f2RW6cJVZgWOBdudjMSK8cd0N0pgbHhOJrvZ6GJtIYzPe+mx7ZxM?=
 =?us-ascii?Q?DKuNHiauzmZlM/baBSK5O7k56gBO44UK1qtUfjOU8p8GTiVI8GWgOiwup1oK?=
 =?us-ascii?Q?/6fWxYHJpczQh5l0v10VZuVcrHHW6bO6joXjHZiPuUbzIYAqEcDA1cFlRvpH?=
 =?us-ascii?Q?ppp6pLEzK0x0XWBIiCVqX/I0IZdOQ1UPs4f9zngSi7ZfcJ7CbwroyQ6aNRMF?=
 =?us-ascii?Q?TbNqHvaARVir5Zy91TbZy60S3+wJM77XvCcqdaK7FqCeA47ZJaAYwIZXFs/b?=
 =?us-ascii?Q?g/FTRyPKA4Ajsn5kMOCGm3KoVQrcDqaeQVb+8hpm48LCelRnrJ5krBjo2BvF?=
 =?us-ascii?Q?c9vwIRmDwQjP7evDXglhbKjoqqRdK3TCzpcPb7wNgvhPRxmGOkdevRnbpraA?=
 =?us-ascii?Q?Wwus6m8cxOw/FFBfZmYVVSNiOQa2HlR4Z5WvrYeZevCXtydhCpSYKkC5EZxX?=
 =?us-ascii?Q?6OLv6RGe9dDWedT99zHGDLb25ZgVsO6QiGqz8RQNRQ/OEbgGOummRCB5hR8D?=
 =?us-ascii?Q?n325dAg/18zDV6WCgfFnCjeDBWcAN9bg2HDVBeRHeQEI5tgEz1tht9F1hpaX?=
 =?us-ascii?Q?FCnUfdMeWh013Nr/HKB608qsGgMSkAtnjZx3MteJ/JabS7cdjjozIyoxBmYt?=
 =?us-ascii?Q?tZT5FijM4jWjp+wiSElNQVhkZiiXfG+jStUzQg4pujhUHOjYoquda54Fonzo?=
 =?us-ascii?Q?X7Mb2tLhTfbQF1dkMjBlpKhBHdhpp4oZctBTdjVmJwo7KmvpmQhlLnGbicsx?=
 =?us-ascii?Q?++2a0PyKnd3hM4BpJ2WJ9gugEMRVZ86yR1mQ+wk/npky//8tMnVSj2y9XzdB?=
 =?us-ascii?Q?eCwcVPTwfwusmFpdjVwiSzz/UVPPlBVv22NgbRJ09qU5WpXHGlYqBfpXzQcW?=
 =?us-ascii?Q?gkVqB0ZITjwug5IgrieXLS4XDlmjGEiFYppAmiKVc8gtXctNaBinFdBJed5M?=
 =?us-ascii?Q?3RgPhyWDzp1PgZQ7ygbS2j9hLIsd0tnhmhs8/LtWNAPB58WCGmYKUt9pYmwz?=
 =?us-ascii?Q?VFKAMVgifxn8qxyE9dytzqGVwZDLdwjIbnfg+4Ks7Xkvne1XCj+whdbI9cKx?=
 =?us-ascii?Q?YsgkZvkSvoRcam0uH7wT92cjiZYCtDKVZkyWDz9iE8LdmvwWk7IOm1do3+BN?=
 =?us-ascii?Q?m9qUznnqcWTfkNTAIg3MISTwdDbdm+Ytb4pZ0MpskVXjuQkX8A5ESVuhtyYx?=
 =?us-ascii?Q?Fopbx1CVflUgw0dSYYMzoMhegQQjUnbWIjwh4OPSbWVCRfCiuXDh77tSP3jL?=
 =?us-ascii?Q?zT1K8YKJH+Yh+k+a1eP5Uv+XoAZmZ9Nv7W+Fqbdlh9QyeB92ybzAUbt0GUgd?=
 =?us-ascii?Q?Z4A5QKWNriU8+Peh9JlgZOO0huncBdbmJETCZlBGZec4XODj6uxBKfqhnW0H?=
 =?us-ascii?Q?Cg1EDLUEB7whmuuRLPcSzKSBcU868LSQjyhlqcFcSehnY8k5iNi2XLB54Cuj?=
 =?us-ascii?Q?hHXTPcLrjylfggNTXC6KacQV4W/PLaOqwfXAOb3cs+prs1E0uCBD7phWMTbF?=
 =?us-ascii?Q?fS79dc0ldyyryg40yEa3WlhCT2R/ZwuOp3dEdp0CTcfAX5z0SYRXwm3a5tpX?=
 =?us-ascii?Q?y1EN3OzO2fhjAhTYVoE=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:18.0906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 abc3cf7f-4b5b-4ef3-c839-08de3de5c42c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8886
Message-ID-Hash: ZV4FY7CCVUF6Q6E5I6A2AGUXTLBV6RVZ
X-Message-ID-Hash: ZV4FY7CCVUF6Q6E5I6A2AGUXTLBV6RVZ
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZV4FY7CCVUF6Q6E5I6A2AGUXTLBV6RVZ/>
Archived-At: 
 <https://lore.freedesktop.org/20251218032955.979623-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename FalconMem::Imem to ImemSecure to indicate that it references
Secure Instruction Memory.  This change has no functional impact.

On Falcon cores, pages in instruction memory can be tagged as Secure
or Non-Secure.  For GA102 and later, only Secure is used, which is why
FalconMem::Imem seems appropriate.  However, Turing firmware images
can also contain non-secure sections, and so FalconMem needs to support
that.  By renaming Imem to ImemSec now, future patches for Turing support
will be simpler.

Nouveau uses the term "IMEM" to refer both to the Instruction Memory
block on Falcon cores as well as to the images of secure firmware
uploaded to part of IMEM.  OpenRM uses the terms "ImemSec" and "ImemNs"
instead, and uses "IMEM" just to refer to the physical memory device.

Renaming these terms allows us to align with OpenRM, avoid confusion
between IMEM and ImemSec, and makes future patches simpler.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 20 +++++++++++++-------
 drivers/gpu/nova-core/firmware/booter.rs | 12 ++++++------
 drivers/gpu/nova-core/firmware/fwsec.rs  |  2 +-
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..0965cb50568b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -237,8 +237,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
-    /// Instruction Memory.
-    Imem,
+    /// Secure Instruction Memory.
+    ImemSecure,
     /// Data Memory.
     Dmem,
 }
@@ -345,8 +345,8 @@ pub(crate) struct FalconBromParams {
 
 /// Trait for providing load parameters of falcon firmwares.
 pub(crate) trait FalconLoadParams {
-    /// Returns the load parameters for `IMEM`.
-    fn imem_load_params(&self) -> FalconLoadTarget;
+    /// Returns the load parameters for Secure `IMEM`.
+    fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
@@ -457,7 +457,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -508,7 +508,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
+            .set_imem(target_mem == FalconMem::ImemSecure)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -543,7 +543,13 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
+        self.dma_wr(
+            bar,
+            fw,
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+            true,
+        )?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index f107f753214a..096cd01dbc9d 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -251,8 +251,8 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
-    // Load parameters for `IMEM` falcon memory.
-    imem_load_target: FalconLoadTarget,
+    // Load parameters for Secure `IMEM` falcon memory.
+    imem_sec_load_target: FalconLoadTarget,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -354,7 +354,7 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
                 dst_start: 0,
                 len: app0.len,
@@ -371,8 +371,8 @@ pub(crate) fn new(
 }
 
 impl FalconLoadParams for BooterFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
-        self.imem_load_target.clone()
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        self.imem_sec_load_target.clone()
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
@@ -384,7 +384,7 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_load_target.src_start
+        self.imem_sec_load_target.src_start
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..6a2f5a0d4b15 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -224,7 +224,7 @@ pub(crate) struct FwsecFirmware {
 }
 
 impl FalconLoadParams for FwsecFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: 0,
             dst_start: self.desc.imem_phys_base,
-- 
2.52.0

