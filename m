Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D679D210A9
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:41 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3059310E694;
	Wed, 14 Jan 2026 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P3MBQy8w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9AF9644CBA;
	Wed, 14 Jan 2026 19:22:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418528;
 b=fUBh8Tf7r8U27xESEwPYHXRyQYrLA8L1AjsEB9ozJCQI7QuN0uPiahU39jsR7CKbEu/9H
 fRrFon0ATta7y3joPnJi6ccOQDj0Y0M/UJzSfxb0K2iZuWeq3b4JKj8GFm4wUvnf7nmY5Gb
 Uk72ut3Zo4muanYWFp5hsfwIWNoGLvcQcQZjQpQeCZrSAAj7GPHL7LskDqykltCUoFx0jO1
 vpVo6oLsjFv04dBokkY41IndqZvIOgxhvKdGld2wsP83Ug7MOnWNm+1aHTejSLfYE8FDMI+
 Et3jRnDetnhEQmZacx3wQqP9Uw1utDt2G27/InuR/Zh/T3N6L+OJPF2mVgCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418528; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=KDLztAGbdo56DOiNfMpgVwG6PLS+5OVbprKq+N2we/Y=;
 b=cIdBRC+uz9cjBKlhYaAuACqRb5C5/whfr51ISIeenOTVGwLyI9IeEo6tqeEguLrvqzJrv
 pzaUe9fijmKd5fLbWsbNhcbYiOMbqOiMlaxeMyHIfGotPjdY210z82o+3uMtdQRfq6lQyan
 VC1ipBqPUC7mDRWCY1Na0wMkvmqTUCiyp+IcH33Tk2TAqFWjfdKSS7ZkAXZk2FMLUkDqZB/
 vvQKWMts1Ead284ek/dl8FlWeGk6uZHbtSsBUD54V86E15J35Re0SFmFSnfxK/jUOA6fU8A
 LpwmfTBbgNB5XK9cz9ZB/15gNbjvN0cERrxincyErmLvEFNVQH5HLR3Ux2CQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0AF0944CAF
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:22:06 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 616C410E68C
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prIlbxbLsZkYm+ewewP5Lw+VksIBdd5b+djrYVBymD7RCKW33Fh0vRY6EekpgMXeSU660NtwmUOlo2S0EeAAO7fIWqMXegD8g9LIUSL2WIwuO6rB1tuEmu4jkWrpqfaRIWQ7dZlYBucW2GgWYeIVT8u4kG7Ffg1xDB45dNOF38ZnOqA748uy0KryTOI21reUBT2eLLnjY+CAHRN2AVmU64Un6e+Po75XK8oHabw80DoI0f/ODgMATc1F8XPCCkALi2mLFhU6DUfGFwoERCHPHGS1bmrtUnru+AXo53I//PsRZgojSMPnYDwFM2UD2XhXz0HBWUVawbIS1mHRMw6LTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDLztAGbdo56DOiNfMpgVwG6PLS+5OVbprKq+N2we/Y=;
 b=t86ZNzVBHfFwgx2AgUbrT0lJUHiRqgqJFj87v5Aiyurw7zH9plZEcMcOk19zVq/6uGaQkdWMD6ppPla2fN5VJ5hsGRH9IQvc5u2fIa6sw2zfNQatia4k8QCp1MJAxhHj6RHAzcr0GnOOyPVpaY48dHpKvkupl5AoSmayqRrAzOZc+zEaXvxmOToAB3XDiLX7nJ1BfBAmjeJNvW8B0fNyGmJKBvx325ogtlM/afv6hOPDXfnXhdwMKAbi1KiU9LBbUqNTrsFV2y1PMQJFzZs2ap0MmUm2nS/7xFtqor/ElnxfLG2x0xvWlvcuBk1N/cQjgYNpwBOQRYgsl1YyBmQ9LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDLztAGbdo56DOiNfMpgVwG6PLS+5OVbprKq+N2we/Y=;
 b=P3MBQy8w4NoO8sVgsktKIs0HK2xK1onv9zmt9WaNxQKE3548l1y9/pMrSULL/oUjxtTk2QwCyyVvQu2j9BXHYoXO0+s1Zxtr6DOJWreou/btNrAC646sXO0Hz4y+aPY0vFAN9CvSnbnh6b+oK0s2Yuk3Qa5P3EAEjLzfhHuIIUuJqqDW8gzDSfE93gJLjDMOq3e1UJLrnIk/T9/a/SFP4yjDBY0hth5xORmjPaAM7vEEp9KvmauXR5ZzEfns0+44ZM3E1L5BaA1KQJRqcpJYNiQ5q1Q7qNYvxjJLObxvEmFcm3n5OwJ15anhc5Nx8OvUb8ZCxzu+FjmckC7PMINKKg==
Received: from MN2PR22CA0017.namprd22.prod.outlook.com (2603:10b6:208:238::22)
 by SA3PR12MB7857.namprd12.prod.outlook.com (2603:10b6:806:31e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 19:30:29 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::53) by MN2PR22CA0017.outlook.office365.com
 (2603:10b6:208:238::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 19:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 19:30:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:08 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Date: Wed, 14 Jan 2026 13:29:48 -0600
Message-ID: <20260114192950.1143002-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|SA3PR12MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c1de19-f274-4600-c6ef-08de53a3608c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O3Ym9kix9SFYUhm9jkCBQLuViZgJgsWeo7vRwSzxZwKrSLpQZR65uWNI/HxP?=
 =?us-ascii?Q?5NiSUT++J21hTDkMubOg4AIi23rKYTvkpeTDHSfvpwNAyFQXQkOnGhxHoGEM?=
 =?us-ascii?Q?53HTBlAZ2/FCKxuRay83opp2oQN+25VVugwWNR4yTWcX9TFyx9cqyYWMXcW0?=
 =?us-ascii?Q?Kg+4ncgdp8cPXIJlpKI9I3JY3Vusg9E1NTfOtqjNMrXOrB4Xv8n6aN6eY16i?=
 =?us-ascii?Q?tERjr/9d4lPFxiy18x0MW4vKfm+/2VgdUF4wOiTfbV5JWUULqWEvy68MOIeT?=
 =?us-ascii?Q?qQeRnujPbBXTPq+X4RNHQBDfVdlvaErZYS15SiOXqEOSnOyyKiyDv1lGmgA/?=
 =?us-ascii?Q?Xf67dsHWb/hoP3tBC4EEIDDw4JA9u6tTJpYvctLaa4xEOU1TXYrIO8tEOe2x?=
 =?us-ascii?Q?7w9J+QkMPXJccPPhmAzvvfjUv0PM5dTSJFJX7B31+TqbR8GgyNqcq/FpbqMP?=
 =?us-ascii?Q?lCkn+eS02LDvIZ7S5rG31RFXahkWdtikraq1CDgP/sQR/cssOknnIggnOoAl?=
 =?us-ascii?Q?qy4aIkQG24hBkcZSTQyR5WLo7t9UVjFd5tfVPqjfL0FlD771t5aWLNzPEJBM?=
 =?us-ascii?Q?C9oWBBJdtpBR6wZLjTy7yXbzJWJddaxF4TkbiVmURgkWfzZoaS9dtdwkgRlt?=
 =?us-ascii?Q?DVxNwhTBFPXK0rMwW+oCyMLw+OHZBRs8F5VMmmES+KaFdsNQlZ65xGYx9nyh?=
 =?us-ascii?Q?VA4WQuEefMLr9EZvyOuYTbIRmQNijgtJ59M3exE6S79d1afViHDtmVJc8N6M?=
 =?us-ascii?Q?v0GA0PIJj5mbOihWacLknzowb9qvwufsN5uPd0pdCeXgYX3AJe670KAEIAGa?=
 =?us-ascii?Q?a6fBD9XPTYp2QYXCy4EUJ+7VKvZ9E94fQ3UYT7xu8o09+ISiRBJ1/EvPnEZZ?=
 =?us-ascii?Q?pJbxCij0e+UQ+wCdfRaaNIyk8Y0tYCAHLKYi0ajeiiqkkaywwa+N33SsC9PH?=
 =?us-ascii?Q?a0CwnDuDfRFWscPx7+TmZYEog2Tn+dOcBN27USTgDHI8NPky3YK0BdvYFJax?=
 =?us-ascii?Q?BPIzZmf6Bku0G4D6o6ttBh5x41NKpxO43vixT+Q6Hs/Nle+ZIgguMtbilcfZ?=
 =?us-ascii?Q?ip/XhK2fpvZ1nPzrfVf/fGRWa4MbHrP9AxT4bqCY0SIQQbEvMFBvg1BviCZ3?=
 =?us-ascii?Q?SvXDhFJtOmFPxfg3UBOoeirDjlr2hj80TXUWid5HLhGUFjnWmH9NERn9ExFx?=
 =?us-ascii?Q?4iifr+o3z5h2AlKxo/pc7rSlFZpMstw08OlOhUQdNeef2QgH68/KzsVtsD7/?=
 =?us-ascii?Q?/ndnc604BUDR+mw2Cz12iteEoqUIsVffCLJz5mHxE+DQ4DanhM4rqpfw4bPs?=
 =?us-ascii?Q?z+ET4g2eSLemb9Sq6G4sSUNlEVYlkBOTkSgud0pAesye10oZjS6Pwcj027U0?=
 =?us-ascii?Q?eybaDhrxK7IXvgU4ay11uIQO0CQw+XtMdCTqdm5TkW/bKTQj7ZiCUIscfUjC?=
 =?us-ascii?Q?HIqmorp8q0OPt1QMA9Z89C0MsEAdU5IfcuxYF/ISpajl5oAFCNtomTAMFK4Y?=
 =?us-ascii?Q?EJ5bZxXI0SY4SkkuMxXJ/k7MyehWdUfUuzYmLc9yJTDY/mGuGj/xrsBI1XWV?=
 =?us-ascii?Q?ds+n8jfcKpBVrDexO8rHZZYqVHIbSmF3cREcBA5Q1agm/Wyn+lYsyy7QUZYI?=
 =?us-ascii?Q?s5WM3srvogYrVDasqlsEjbcBLSO9LTxl3MdyuoiwRl5ik+wBiydQLzBtlwPJ?=
 =?us-ascii?Q?UDtw1w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:29.5919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0c1de19-f274-4600-c6ef-08de53a3608c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7857
Message-ID-Hash: KMSZ6V6FLHGAWEIFCZTCEGCECBYE6PXO
X-Message-ID-Hash: KMSZ6V6FLHGAWEIFCZTCEGCECBYE6PXO
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KMSZ6V6FLHGAWEIFCZTCEGCECBYE6PXO/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-10-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The FRTS firmware in Turing and GA100 VBIOS has an older header
format (v2 instead of v3).  To support both v2 and v3 at runtime,
add the FalconUCodeDescV2 struct, and update code that references
the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
encapsulates both.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 149 +++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware/fwsec.rs |  72 ++++++++----
 drivers/gpu/nova-core/vbios.rs          |  75 +++++++-----
 3 files changed, 237 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..9f0ad02fbe22 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,6 +4,7 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::ops::Deref;
 
 use kernel::{
     device,
@@ -43,6 +44,46 @@ fn request_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV2 {
+    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
+    hdr: u32,
+    /// Stored size of the ucode after the header, compressed or uncompressed
+    stored_size: u32,
+    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
+    /// is not compressed.
+    pub(crate) uncompressed_size: u32,
+    /// Code entry point
+    pub(crate) virtual_entry: u32,
+    /// Offset after the code segment at which the Application Interface Table headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into 'IMEM'.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into 'IMEM'.
+    pub(crate) imem_load_size: u32,
+    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Virtual address of secure IMEM segment.
+    pub(crate) imem_sec_base: u32,
+    /// Size of secure IMEM segment.
+    pub(crate) imem_sec_size: u32,
+    /// Offset into stored (uncompressed) image at which DMEM begins.
+    pub(crate) dmem_offset: u32,
+    /// Base address at which to load the data segment into 'DMEM'.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into 'DMEM'.
+    pub(crate) dmem_load_size: u32,
+    /// "Alternate" Size of data to load into IMEM.
+    pub(crate) alt_imem_load_size: u32,
+    /// "Alternate" Size of data to load into DMEM.
+    pub(crate) alt_dmem_load_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV2 {}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
@@ -76,13 +117,115 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-impl FalconUCodeDescV3 {
+// SAFETY: all bit patterns are valid for this type, and it doesn't use
+// interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV3 {}
+
+/// Enum wrapping the different versions of Falcon microcode descriptors.
+///
+/// This allows handling both V2 and V3 descriptor formats through a
+/// unified type, providing version-agnostic access to firmware metadata
+/// via the [`FalconUCodeDescriptor`] trait.
+#[derive(Debug, Clone)]
+pub(crate) enum FalconUCodeDesc {
+    V2(FalconUCodeDescV2),
+    V3(FalconUCodeDescV3),
+}
+
+impl Deref for FalconUCodeDesc {
+    type Target = dyn FalconUCodeDescriptor;
+
+    fn deref(&self) -> &Self::Target {
+        match self {
+            FalconUCodeDesc::V2(v2) => v2,
+            FalconUCodeDesc::V3(v3) => v3,
+        }
+    }
+}
+
+/// Trait providing a common interface for accessing Falcon microcode descriptor fields.
+///
+/// This trait abstracts over the different descriptor versions ([`FalconUCodeDescV2`] and
+/// [`FalconUCodeDescV3`]), allowing code to work with firmware metadata without needing to
+/// know the specific descriptor version. Fields not present return zero.
+pub(crate) trait FalconUCodeDescriptor {
+    fn hdr(&self) -> u32;
+    fn imem_load_size(&self) -> u32;
+    fn interface_offset(&self) -> u32;
+    fn dmem_load_size(&self) -> u32;
+    fn pkc_data_offset(&self) -> u32;
+    fn engine_id_mask(&self) -> u16;
+    fn ucode_id(&self) -> u8;
+    fn signature_count(&self) -> u8;
+    fn signature_versions(&self) -> u16;
+
     /// Returns the size in bytes of the header.
-    pub(crate) fn size(&self) -> usize {
+    fn size(&self) -> usize {
+        let hdr = self.hdr();
+
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
+        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    }
+}
+
+impl FalconUCodeDescriptor for FalconUCodeDescV2 {
+    fn hdr(&self) -> u32 {
+        self.hdr
+    }
+    fn imem_load_size(&self) -> u32 {
+        self.imem_load_size
+    }
+    fn interface_offset(&self) -> u32 {
+        self.interface_offset
+    }
+    fn dmem_load_size(&self) -> u32 {
+        self.dmem_load_size
+    }
+    fn pkc_data_offset(&self) -> u32 {
+        0
+    }
+    fn engine_id_mask(&self) -> u16 {
+        0
+    }
+    fn ucode_id(&self) -> u8 {
+        0
+    }
+    fn signature_count(&self) -> u8 {
+        0
+    }
+    fn signature_versions(&self) -> u16 {
+        0
+    }
+}
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+impl FalconUCodeDescriptor for FalconUCodeDescV3 {
+    fn hdr(&self) -> u32 {
+        self.hdr
+    }
+    fn imem_load_size(&self) -> u32 {
+        self.imem_load_size
+    }
+    fn interface_offset(&self) -> u32 {
+        self.interface_offset
+    }
+    fn dmem_load_size(&self) -> u32 {
+        self.dmem_load_size
+    }
+    fn pkc_data_offset(&self) -> u32 {
+        self.pkc_data_offset
+    }
+    fn engine_id_mask(&self) -> u16 {
+        self.engine_id_mask
+    }
+    fn ucode_id(&self) -> u8 {
+        self.ucode_id
+    }
+    fn signature_count(&self) -> u8 {
+        self.signature_count
+    }
+    fn signature_versions(&self) -> u16 {
+        self.signature_versions
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index e4009faba6c5..c4fff8b86640 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,7 +40,7 @@
         FalconLoadTarget, //
     },
     firmware::{
-        FalconUCodeDescV3,
+        FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
@@ -218,38 +218,59 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
 pub(crate) struct FwsecFirmware {
     /// Descriptor of the firmware.
-    desc: FalconUCodeDescV3,
+    desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: 0,
-            dst_start: self.desc.imem_phys_base,
-            len: self.desc.imem_load_size,
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
+                src_start: 0,
+                dst_start: v2.imem_sec_base,
+                len: v2.imem_sec_size,
+            },
+            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
+                src_start: 0,
+                dst_start: v3.imem_phys_base,
+                len: v3.imem_load_size,
+            },
         }
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        // Only used on Turing and GA100, so return None for now
-        None
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => Some(FalconLoadTarget {
+                src_start: 0,
+                dst_start: v2.imem_phys_base,
+                len: v2.imem_load_size.checked_sub(v2.imem_sec_size)?,
+            }),
+            // Not used on V3 platforms
+            FalconUCodeDesc::V3(_v3) => None,
+        }
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: self.desc.imem_load_size,
-            dst_start: self.desc.dmem_phys_base,
-            len: self.desc.dmem_load_size,
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
+                src_start: v2.dmem_offset,
+                dst_start: v2.dmem_phys_base,
+                len: v2.dmem_load_size,
+            },
+            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
+                src_start: v3.imem_load_size,
+                dst_start: v3.dmem_phys_base,
+                len: v3.dmem_load_size,
+            },
         }
     }
 
     fn brom_params(&self) -> FalconBromParams {
         FalconBromParams {
-            pkc_data_offset: self.desc.pkc_data_offset,
-            engine_id_mask: self.desc.engine_id_mask,
-            ucode_id: self.desc.ucode_id,
+            pkc_data_offset: self.desc.pkc_data_offset(),
+            engine_id_mask: self.desc.engine_id_mask(),
+            ucode_id: self.desc.ucode_id(),
         }
     }
 
@@ -273,10 +294,10 @@ impl FalconFirmware for FwsecFirmware {
 impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
     fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;
-        let ucode = bios.fwsec_image().ucode(desc)?;
+        let ucode = bios.fwsec_image().ucode(&desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = usize::from_safe_cast(desc.imem_load_size + desc.interface_offset);
+        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -303,7 +324,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_base).into_safe_cast(),
+                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
                 )
             }?;
 
@@ -317,7 +338,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + cmd_in_buffer_offset).into_safe_cast(),
+                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
                 )
             }?;
 
@@ -364,11 +385,12 @@ pub(crate) fn new(
 
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
-        let ucode_signed = if desc.signature_count != 0 {
-            let sig_base_img = usize::from_safe_cast(desc.imem_load_size + desc.pkc_data_offset);
-            let desc_sig_versions = u32::from(desc.signature_versions);
+        let ucode_signed = if desc.signature_count() != 0 {
+            let sig_base_img =
+                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
+            let desc_sig_versions = u32::from(desc.signature_versions());
             let reg_fuse_version =
-                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
+                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
             dev_dbg!(
                 dev,
                 "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
@@ -402,7 +424,7 @@ pub(crate) fn new(
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
             let signature = bios
                 .fwsec_image()
-                .sigs(desc)
+                .sigs(&desc)
                 .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
 
             ucode_dma.patch_signature(signature, sig_base_img)?
@@ -411,7 +433,7 @@ pub(crate) fn new(
         };
 
         Ok(FwsecFirmware {
-            desc: desc.clone(),
+            desc,
             ucode: ucode_signed,
         })
     }
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e59eee2050a8..07a28c4c0837 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -19,6 +19,8 @@
     driver::Bar0,
     firmware::{
         fwsec::Bcrt30Rsa3kSignature,
+        FalconUCodeDesc,
+        FalconUCodeDescV2,
         FalconUCodeDescV3, //
     },
     num::FromSafeCast,
@@ -999,19 +1001,10 @@ fn build(self) -> Result<FwSecBiosImage> {
 
 impl FwSecBiosImage {
     /// Get the FwSec header ([`FalconUCodeDescV3`]).
-    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
+    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         // Get the falcon ucode offset that was found in setup_falcon_data.
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
-        // Make sure the offset is within the data bounds.
-        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
-            dev_err!(
-                self.base.dev,
-                "fwsec-frts header not contained within BIOS bounds\n"
-            );
-            return Err(ERANGE);
-        }
-
         // Read the first 4 bytes to get the version.
         let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
             .try_into()
@@ -1019,33 +1012,49 @@ pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
         let hdr = u32::from_le_bytes(hdr_bytes);
         let ver = (hdr & 0xff00) >> 8;
 
-        if ver != 3 {
-            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
-            return Err(EINVAL);
+        let hdr_size = match ver {
+            2 => core::mem::size_of::<FalconUCodeDescV2>(),
+            3 => core::mem::size_of::<FalconUCodeDescV3>(),
+            _ => {
+                dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
+                return Err(EINVAL);
+            }
+        };
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + hdr_size > self.base.data.len() {
+            dev_err!(
+                self.base.dev,
+                "fwsec-frts header not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
         }
 
-        // Return a reference to the FalconUCodeDescV3 structure.
-        //
-        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>` is
-        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
-        // in `BiosImageBase` is immutable after construction.
-        Ok(unsafe {
-            &*(self
-                .base
-                .data
-                .as_ptr()
-                .add(falcon_ucode_offset)
-                .cast::<FalconUCodeDescV3>())
-        })
+        let data = self
+            .base
+            .data
+            .get(falcon_ucode_offset..falcon_ucode_offset + hdr_size)
+            .ok_or(EINVAL)?;
+
+        match ver {
+            2 => {
+                let v2 = FalconUCodeDescV2::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V2(v2.clone()))
+            }
+            3 => {
+                let v3 = FalconUCodeDescV3::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V3(v3.clone()))
+            }
+            _ => Err(EINVAL),
+        }
     }
 
     /// Get the ucode data as a byte slice
-    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+    pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The ucode data follows the descriptor.
         let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = usize::from_safe_cast(desc.imem_load_size + desc.dmem_load_size);
+        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
 
         // Get the data slice, checking bounds in a single operation.
         self.base
@@ -1061,10 +1070,14 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
     }
 
     /// Get the signatures as a byte slice
-    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
+    pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
+        let hdr_size = match desc {
+            FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
+            FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
+        };
         // The signatures data follows the descriptor.
-        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let sigs_count = usize::from(desc.signature_count);
+        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
+        let sigs_count = usize::from(desc.signature_count());
         let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds.
-- 
2.52.0

