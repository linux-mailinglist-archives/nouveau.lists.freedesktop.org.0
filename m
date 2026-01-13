Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6B1D1EF03
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 13:59:57 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC9210E629;
	Wed, 14 Jan 2026 12:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ljgp4kpA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 44AFC44CBA;
	Wed, 14 Jan 2026 12:51:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768395083;
 b=c0md7Zb0xAAnhN0kZ+xFdmarCiNA2lGPZpfkRJj3zMNEBjta/RwpDX8a0oC7X+aHnP1B3
 JZpHm7y2lPwqUaio6pOahsw2DXBJeS4+U7F1IgtbwVUPKoIzJqrLLll1y8EFEGQcOpGQ4bE
 cY/429O810S4c0426VawVTzVuy324vqNQH5+OK2E9KUdeKkhkOAvOFum9LZZHX/1nL2KtXw
 Q3sHo/XZvAtQ6DYb4lZtGPNnTj4BAlSAcnKqHMiT80d2lsYU+PL/3q0ZYueFPoaSB7N8wo3
 Zu3rfDZrhpOnMmfC9vCpKZmmScygO5iPydTevNFGv5oCqkC8UdPiN5MpRUrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768395083; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SEDW7ybNwr30MVNHfS0phheGrV0cXYsDACG5oPWT39k=;
 b=h9uGfTDekq/UdvBIwrgXgT8TADMQUBSS2p7hNFiXOLNA3iZkW0uAv+QaSVv3+dz3dh/nw
 jqV2Hh/jQo8l4Jjtcx4M9r8iG1orH/DjdiRlz4ozWYxvqWRk4kbMYERCsyS45dNeBS/hicF
 RYlb7wjfHoHlYpMbwh6OCUm39Z+jZNMCaoMp23A/KB9avZEYnBcarxdWx0x79DKBnxZ+njK
 KUDbgpR1qdBNSnFQkSaoZ21jbnGkvgSHRrNT1qDUiIbf0MhTSVCpr58WpVxo+LM0sMjjmbE
 +9iwbuuUHMuNF7ZnA4v+qvS0xDyqiHIr8yWeDJ0M02OTuDsStHVtN50q5EvA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 862B644C99
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:46:13 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E979010E29A
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 22:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=we/Y+loTBdiHq1azvfR35Ew8EtFSzSgylYdskoKZX5SFtMmcW0FzlDweEGg3qp1gIN9eTx1QpGzmpZBP0yjH+I1H5E8/gQE4KSI/q5pYq9CJd78hgGfLbqGE8dW4tD5cifkG2yzBjrNp8X4qMrS6N9qAsaMaRdi7wsIgdCaWCkwZluRHu4oxVI0rj4szrCGvEdZ8gebIzUFfI6w9JEDvNmu9lg2so8xuHyV9LAfUutdmfLawayYbivswKCAHiIVqpDPCvbUz/PQJTadtAMQfEimiGlewGRNBoyI++7/0UTimICAyvq8JS2PzEgrnBgGVo6t4bbhqtO+59pPC2fbPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEDW7ybNwr30MVNHfS0phheGrV0cXYsDACG5oPWT39k=;
 b=xjyYyJ6gxfe2Ko6TBpiELa9oV7Wzkk9abyaCGrKykfmgopMvwbvVxxDmA3DUtd2wg3WW7CPj7hGd2pF5Nnr99OjobRpO0xpcNP7IehqcZ5W8Jd2ArZOsXpW0TtY2zuTGMMPSVnMbeiXdRZUUBnaU0P+ZzCLIsWYfUetoLp3m37FLZGL3gFWc6e0CeN9o9luGFGVOoZKDZ/tWf7A/Vx9Dfnggrm3zaJZmqwasYVEfY/FlCe45sbFrI3MVnVfhO4TW/QZNsG7B3P11e5A6LfvjbFDCdGEbfCTGQInK71++309HP8s1Us6g6vh7McMwrw/SqDrjy4CQ71ns3jfOEWmgAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEDW7ybNwr30MVNHfS0phheGrV0cXYsDACG5oPWT39k=;
 b=ljgp4kpAapyJnzPLI/gqojfme8ne8Al09XqaeLebKEjezDekN7FI00oWFCaIqnXEGBhdnVrBGdRnC4rN9Tg6roEPApRjP1dD/5pzOz8XiaewLeuPWXddrms99n1sjcOP7KLrt552fSMF9lam8XfsXiVN78LUeIGd0oic/2sqePr0X7lbkx/G9uV+Szn8Sq9kgq/PQ/bIuDr8va3iwMNpxqEM0UK9V/Qjky/H8lWjFycSNKmFWMA+XpafrXaBkgdezXfPxSgRbCBIjwU5MnP1AzIIEZKk+Ut0tasR4T/pvSJua/xizNN+G7LEMIOYOkXbXSl7I9sKnBalhAuGL0uBvw==
Received: from MN0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::15)
 by SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 22:54:38 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::4b) by MN0P220CA0004.outlook.office365.com
 (2603:10b6:208:52e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 22:54:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 22:54:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:22 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 14:54:21 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 5/9] rust: debugfs: implement Directory trait for Dir
Date: Tue, 13 Jan 2026 16:54:04 -0600
Message-ID: <20260113225408.671252-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113225408.671252-1-ttabi@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c3ecc7-8eb4-4f18-c859-08de52f6bad9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZRI9AoaATqXtMI76gu58aZeuseE7oqs1sp3gN2EKUwSQpfANK0JI3lXdJdsT?=
 =?us-ascii?Q?SZP7sp3c7K/VRHH4GkDB7SPufJ+L+gonffJydkah5lh6PE77t3HQHwHicL6P?=
 =?us-ascii?Q?Y1LCQUCcR8MsEFPLO8U6zDuo0xWNMMhEs7R6xfsoHjkbggM7OB6ypHVXC9WD?=
 =?us-ascii?Q?hin4W3Pm37Y4KWdjxvBokBVXIRVyBeDAX+w9v8M0IQYw3zdRDH0F5XY02KXZ?=
 =?us-ascii?Q?xWgcimutBiq795zcgNe13lq9aGxjuQh5Wu+P81bZzvKzYQiLZ5ZGsfEA9WTT?=
 =?us-ascii?Q?V2/Pkq2dJq1ATmfvXRoSVk1s74sAJ27PPMIw7PTLzkTeQ0VJgtao4RWLNiYU?=
 =?us-ascii?Q?zPTCPRzXubhI/jR9kSJv/Zwz11f03P86gG91cGrqVj2gza2DbJd5qkuWTeRN?=
 =?us-ascii?Q?gscG6s1JmwaS/Yq29G87uo+lyC3aAD14ZYnyrHWR2sDPwkwVbs4RqkAZQGAn?=
 =?us-ascii?Q?vR4S+UQoRem9haD2OnFoYkOisZANBocT8cO9hS/ITUMmw++qM87uDqdfnIt3?=
 =?us-ascii?Q?1FSGgTMA95tohGjgVd0rPSW08uqyiipl45flQJY1/+wmiMQUwABRmiT4QXw3?=
 =?us-ascii?Q?RRZMzxqAh3+n3XPYmbMCiPwSvTE+lcP7RmrJDP6DTkB2pnpM3xXYLF3N1Sl3?=
 =?us-ascii?Q?+4RwhTI1q9YmdSyoPYNSnZ3XqevPm6EuwiHlIyhcZcNVdfcUumqxGkPFKgQU?=
 =?us-ascii?Q?rtxyzxqkPOVsoCcqQQb7jwPb1FkgHeD5CHLsq/Ol2nw0Kx5Qap+KEJE25Wgj?=
 =?us-ascii?Q?dNh1cMFKRM7jI/ciFKApyLOjXx8HtKAMvwttxcICVp0Awl+fZSRIuuhBlEDQ?=
 =?us-ascii?Q?bH1/Z3ZBLBI/yXy7dDpMS/aCyIKpHyH1QeiWMG+zg4OT/Dr9eTAojvuOLG67?=
 =?us-ascii?Q?cpZNqPveFuLN6CYOFXgo7C83ihmMYgGrj18ytGp5OYsOAa8ZLr0QYGK4MqtM?=
 =?us-ascii?Q?eXLIcmVHWZxyWLGoIc2ZgrDXYn7hjYji8Fnh/3z1rB3h29vjjKSsrH5twt0k?=
 =?us-ascii?Q?0PbohN8Sl9Q6dBngPb5u2U6THuofRdSVTBy1598kU4RA9+Oa84BwPPs5Q8OR?=
 =?us-ascii?Q?ZYV/dxDJGkYzyKhhNG8iGPtEgnOOZI+HK5e5ixgDe6fDy7tlyGMdh2V7PsaO?=
 =?us-ascii?Q?cQs14Zbx5x18Oz/T6PMzXt1NHJMUzr0iDNqffo4jwCJtRqrpzqZy2YkEKigN?=
 =?us-ascii?Q?dKdRgDrtZ22wz3ZZbTJOAAqwXo9rxCKpCH+d14ndOwggreNiba7cA4uWZGAO?=
 =?us-ascii?Q?EUXEbbyppkJYUgdhlpGy78jxUvsyKeicXINp2h0/c13vSgC06pg9JIjPnJ6w?=
 =?us-ascii?Q?FZPLR83L48fwPnp9mldaaYNIP5pe+uQ3soC9HahU1Caf1eBm1dghUWHnEWWn?=
 =?us-ascii?Q?aToefDsQOm2MlzRKRNbFhcohNWTfbWE1OLNkmwCLdb8y0PXWRracpU9NiKFs?=
 =?us-ascii?Q?jHK3R/dIVl5zf9jzQw7D9oy5W3/M+1ZeO2yhAEoZ+F5OYIWeRduaQ99YJPRS?=
 =?us-ascii?Q?JYcxfkEEh0wUoHD+HqtdToyPp4uitjwbmH1xU/rffL0o13ghW9GRkWq2ZQSS?=
 =?us-ascii?Q?+mwhoF2rywIC6z9Vo+E=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:54:38.1544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81c3ecc7-8eb4-4f18-c859-08de52f6bad9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6UEU4B6YCD4ODDO7OHP7GYPO3GUIEUHR
X-Message-ID-Hash: 6UEU4B6YCD4ODDO7OHP7GYPO3GUIEUHR
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:51:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6UEU4B6YCD4ODDO7OHP7GYPO3GUIEUHR/>
Archived-At: 
 <https://lore.freedesktop.org/20260113225408.671252-6-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Instead of having an inherent implementation for struct Dir, create a
Directory trait for it.  This is needed for when we add the LookupDir
struct.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/debugfs.rs | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index facad81e8290..ed740eb90fc9 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -35,6 +35,18 @@
 #[cfg(CONFIG_DEBUG_FS)]
 use entry::Entry;
 
+/// Trait for DebugFS directory operations.
+///
+/// This trait abstracts the core operations that can be performed on a DebugFS directory,
+/// allowing for alternative implementations (e.g., for testing).
+pub trait Directory: Clone + Sized {
+    /// Create a new directory at the DebugFS root.
+    fn new(name: &CStr) -> Self;
+
+    /// Creates a subdirectory within this directory.
+    fn subdir(&self, name: &CStr) -> Self;
+}
+
 /// Owning handle to a DebugFS directory.
 ///
 /// The directory in the filesystem represented by [`Dir`] will be removed when handle has been
@@ -96,7 +108,9 @@ fn create_file<'a, T, E: 'a>(
             } ? E
         }
     }
+}
 
+impl Directory for Dir {
     /// Create a new directory in DebugFS at the root.
     ///
     /// # Examples
@@ -106,7 +120,7 @@ fn create_file<'a, T, E: 'a>(
     /// # use kernel::debugfs::Dir;
     /// let debugfs = Dir::new(c_str!("parent"));
     /// ```
-    pub fn new(name: &CStr) -> Self {
+    fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 
@@ -120,9 +134,12 @@ pub fn new(name: &CStr) -> Self {
     /// let parent = Dir::new(c_str!("parent"));
     /// let child = parent.subdir(c_str!("child"));
     /// ```
-    pub fn subdir(&self, name: &CStr) -> Self {
+    fn subdir(&self, name: &CStr) -> Self {
         Dir::create(name, Some(self))
     }
+}
+
+impl Dir {
 
     /// Creates a read-only file in this directory.
     ///
-- 
2.52.0

