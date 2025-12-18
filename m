Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28F5CCC57A
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 15:54:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B4E9310EA24;
	Thu, 18 Dec 2025 14:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QilvktSX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C109C44B90;
	Thu, 18 Dec 2025 14:46:34 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766069194;
 b=yC5s3DMrOKPGrF96hK9Qn/6+gYb4c00N7LhpbwCIJCdBsEJ/xQ+o6lHTjpXgDR3Ht+64a
 0zHuCODes3qnZyjB6k9YvZ98oNzwq6FI1JZ3lO4TBDraJeL92asFI/dq/HXhrmx98Bueej9
 pOYOAt77AumV4TkiSRi9XKJa3lMBAM9F01U+t8ha0rjgbJJJ0IsZTcW6rLFB2aW4yyjnyBq
 qzRHN15FQVaqLBEk6QB5nmwi8tyerePEu38QGJtvmKD3wJB7UpVeMj36TK85YCXelpXwWE5
 kYERm4i/RkJYgfhPZ8eYTfRs7JwKgOPeBcXhKz5pF3FP6/b9milvV123TmtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766069194; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QVoXg2/ZavM81yf0V0bSoV+t63hyCcSWXkY8GTKzVEA=;
 b=uEy6fPkD7hjqOq5HHtRVkev+p+fORUmq5p52onQ5/vWfUmthm8VhIMbNaVWTcDTfH+GUY
 jJaGkc9miOcN/Jr9XCVp7RIUMibK+rkBPz2sVHoURPqeqjGCpbfA42qpBXsXHf+66n4PtfX
 5WskN9pDCruFQ9r7vq2GXumsetet4hedqj1WuPXAZls9h/yUVTxNZak9045eDpOYP3Vga3y
 sD4YF+1ssfTLWIpYcKnaHZow/7n3acEaWC2hF7qXs7RR8G4FFgNyrrTXStw9cyi7Nu8KrPH
 4sAFKu67JrepDQmwlOTh2huxXtq+sjD54BHFQNiXL3kglEuYNMKGMb/v99Ag==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0EF414562A
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:32:15 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011034.outbound.protection.outlook.com [40.107.208.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 85A8F10E414
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 01:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3s9CQIv3BKc6pUYGjcP6OJqaBoT6gpulzOOdX0PA6Ig8kGlQ4yS/gqkZBozybSkaRi1xsJm9ELeJWjMjc+YrSp7ObtwfQrlpZZBU9sPsM6r759CmxsoWJLUaB1DjTlyDOOczgc2a9VUx/N+O7rSmxHNcZTCQkV8X598boJ5CpEs85+QTggoejGSSg2Ic1WxaBcQIcQx3PqZCM383eun/4BxoZnGDmsd0+jXIUDq+NSmgbL85rfTQBL/Sa3WidZqQgIclRLCaqBJv8rxUsfUalcZGjC5UGGKuS47FYvxLQH5v/EALFnjx9KU8345F2yZUov4ibqjrq3wfFnQiTNdPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVoXg2/ZavM81yf0V0bSoV+t63hyCcSWXkY8GTKzVEA=;
 b=RLlNRbqrQMpWWmzKvGDTDiSSxiV4ys+1hp85Fh0gG0PrF+oNc2c7me9HwamEh94jcB2Hld8+spTsXVIzl3MLfQWSmXkdITXWNyr7dFh+9/sl7CuI8yRw2pDK7EV5+M5gML+r2hZ54Nl8Ah7a6N9UnLZdhfbFaQQgLu4Qw+oh122HHEUt2OLsMbwQPmrrevB7fUG/R6lbxxdyW52F53S+4atSUdskDkAFW0R5WlFypqW68eJmJWOSSRtJgDJU6wX7kACP+YQuVOwGSUm45LAaeUuQeTYcmj7y8UvY4EzverEnjKM8MFmUs24FpDFno88P8Jsjx5WW4xRzOBkbtIYlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVoXg2/ZavM81yf0V0bSoV+t63hyCcSWXkY8GTKzVEA=;
 b=QilvktSXLjkls4gjJRIHjhe4YZM55uZKlxXz0cO5qYRTTergUuGRluqkfnFNYo7nKAt+m5J0sTbKwwBoNFku7kyIkHbIBkZKQwyie6IL3Ke6vOJw7bV3Ba4f7Dj9baQc+MVfdwER0zugJcYTMrvGWXBHSwhdlBGI1NXBJhdFcMZmpVzzvHrR6ZZQHc91f79JPhrDPT6JESfBzEK6nw5Nov22jTxNjFiqKEAP7AlV7K9PKTN5trQeQaYIJPC4bVSrSSU9uL9ZEYN0+ikv0z8U7UlWhYH/Dhf/ZM3AefyqTTvTOTgZBXARVbXiuXYG388D+C6i4W5iEvx6ujUxirU8rg==
Received: from CH3P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::35)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:38 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::b0) by CH3P221CA0004.outlook.office365.com
 (2603:10b6:610:1e7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:20 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:20 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 2/9] rust: debugfs: add lookup contructor
Date: Wed, 17 Dec 2025 19:39:03 -0600
Message-ID: <20251218013910.459045-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: a52c8c61-dabc-4b27-ff0e-08de3dd64e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WTV2SvMudeRi5EH0jjrIzsKmOda7AON2XJSK9NhbFx0xXiR4JKmwXyPaz18s?=
 =?us-ascii?Q?fh4MRUH+7ly66OddUL62ACwHZb4MBBf9OoCUvkXUcpSPzP3GNu/3qlaJKIhL?=
 =?us-ascii?Q?4onuEJkEJfTQL28Lle7isPWwljjXdS7r4bS1+Ihu8fzMT7ygF+a4Xetc+QE2?=
 =?us-ascii?Q?TOtgPgb4O8n/WRYduIuY4VSF2pIbJHbrR/UzooMMEAvv9YFwHUPkYLlA24jI?=
 =?us-ascii?Q?87Wx9+xrUei2OEoAh0ffzCwGB72eLfysOcQJhiBfiroX6fidr83dE/WgrZCf?=
 =?us-ascii?Q?98yA6e1/eaifLRupDMnhM/DIjfRk7HEmj/Te+qs/plmSrjpSukmkZ0ZTO5DE?=
 =?us-ascii?Q?D1YVDENo4DsTc4FPzyQLyCZfreIiWUowD08Mc8pRUGplbiEsaqc5cHAgUHBi?=
 =?us-ascii?Q?Re7/kDYhJ2jJF7ce/ugGleHBIB2fMrMsqxKVsQN2CM42Lhap5ThHFbYkaceO?=
 =?us-ascii?Q?6ptPyfbRIlUslGnad7mavBOmiScUaNYcbS+IFO8O6cMUHW9QYAw90LD1i6ej?=
 =?us-ascii?Q?LYmUKjzG2Ei9xw6UpdpU4VB6QscVGY3QCuCbrefumoE00aUjoa+moVlXGwM6?=
 =?us-ascii?Q?qO/S+GnsRevV7CFbquwXfsd8K8gEHBEQEPhvAmKbzP2uxiCeE7pPUPtxmWX/?=
 =?us-ascii?Q?coe/4dR+Un8B3EQWovxonHx4E3LevLRMlZE4Btr1N+tJt4BXVUr6OxQ05JoN?=
 =?us-ascii?Q?9ML262CBk6Af/G0yBSSOP1GhU1OS6ZA5GugbBx7zFjZq4TaMutL/bGtcMXhn?=
 =?us-ascii?Q?lGv6jM9dnh0CXDP3y5n/XL6xPmTuCkD2ZkdQG5dmK1dMz3Ik7zMIWCCWdoBg?=
 =?us-ascii?Q?6wmAOS7p4Aerwl/C3reklurUkAzoqUjjKpZs4pXGHFEQFaZpVolj0YqsbEMC?=
 =?us-ascii?Q?qI7rH34U4xSybzNJvuMz5zUeJIz930MImtw0F4zFGXkWnRPK8kiOHCNu9hjH?=
 =?us-ascii?Q?1C8N2BHmMlZWoYxi42+9XorKs+B7vZW/tKM87MUXLI8R0jRyvyIVndGPzvdx?=
 =?us-ascii?Q?S17YGp8fYXAYN5uc0hCnbgfDjJj7ehn6mLgdb5ASy/dU8U6NYJZ4lPzCtR9c?=
 =?us-ascii?Q?Ef2LQPWO2JNUJ8Nw6/Mcl7vxLsupHJK4+aqTrOruUx6jys4zkBH0KZQh/Kcr?=
 =?us-ascii?Q?TfBYqqC+hdGxraIAQBrd/CZvix/3uraBOuskF24JJBvKgHinM4BdqYrklqy7?=
 =?us-ascii?Q?gWAJRzGfQNT8ax9dHo/mMde+obtA2+ZK/tsJaeCm8rLBSNFGmgUdQcboYEa6?=
 =?us-ascii?Q?mam73vkvseaYvTrNVxOb9GOUUBnjzpHZa55evYxVjHKvxRdLp7V43sVcfify?=
 =?us-ascii?Q?FPg4nmdhac3kTZiUqbD52I0nsvCJFqgnj48rhc2z7jZSK077ohBUKTYCktbn?=
 =?us-ascii?Q?aM1OpnX9fxNm5ijAkd2uTSJ3pyg43OeT4Eqg3qSy/lgSaDXJy1RXnSnw+XTE?=
 =?us-ascii?Q?lDrmW38pvubIqEP6gpWC0/ESbGrGXHLrB81hFEIWhS8iP76eZ3Br2PMbumTk?=
 =?us-ascii?Q?BZ/a8YuO9ge5jyt/J/F50VBWb4jbBm+cMC90yi4H6LCawp5oL5mD0jPJNhwF?=
 =?us-ascii?Q?JslmeiViOt8O0eCcvQE=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:37.8019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a52c8c61-dabc-4b27-ff0e-08de3dd64e52
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: ZKGFBNQLMWZK72ASAA57AFMVNG2CMX5Q
X-Message-ID-Hash: ZKGFBNQLMWZK72ASAA57AFMVNG2CMX5Q
X-Mailman-Approved-At: Thu, 18 Dec 2025 14:46:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZKGFBNQLMWZK72ASAA57AFMVNG2CMX5Q/>
Archived-At: 
 <https://lore.freedesktop.org/20251218013910.459045-3-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a new constructor for Dir that uses the debugfs_lookup() API to
obtain a reference to an existing debugfs directory entry.

The key difference from Dir::new() and Dir::subdir() is the cleanup
semantics: when a Dir obtained via lookup() is dropped, it calls
dput() to release the reference rather than debugfs_remove() which
would delete the directory.

To implement this cleanup distinction, the Entry class now includes
an is_lookup boolean that specifies how the entry was created and
therefore how it should be dropped.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/debugfs.rs       | 43 +++++++++++++++++++++++++++++++
 rust/kernel/debugfs/entry.rs | 49 +++++++++++++++++++++++++++++++++---
 2 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index facad81e8290..eee799f64f79 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -110,6 +110,49 @@ pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 
+    /// Looks up an existing directory in DebugFS.
+    ///
+    /// If `parent` is [`None`], the lookup is performed from the root of the debugfs filesystem.
+    ///
+    /// Returns [`Some(Dir)`] representing the looked-up directory if found, or [`None`] if the
+    /// directory does not exist or if debugfs is not enabled. When dropped, the [`Dir`] will
+    /// release its reference to the dentry without removing the directory from the filesystem.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// // Look up a top-level directory
+    /// let nova_core = Dir::lookup(c_str!("nova_core"), None);
+    ///
+    /// // Look up a subdirectory within a parent
+    /// let parent = Dir::new(c_str!("parent"));
+    /// let child = parent.subdir(c_str!("child"));
+    /// let looked_up = Dir::lookup(c_str!("child"), Some(&parent));
+    /// // `looked_up` now refers to the same directory as `child`.
+    /// // Dropping `looked_up` will not remove the directory.
+    /// ```
+    pub fn lookup(name: &CStr, parent: Option<&Dir>) -> Option<Self> {
+        #[cfg(CONFIG_DEBUG_FS)]
+        {
+            let parent_entry = match parent {
+                // If the parent couldn't be allocated, just early-return
+                Some(Dir(None)) => return None,
+                Some(Dir(Some(entry))) => Some(entry.clone()),
+                None => None,
+            };
+            let entry = Entry::lookup(name, parent_entry)?;
+            Some(Self(
+                // If Arc creation fails, the `Entry` will be dropped, so the reference will be
+                // released.
+                Arc::new(entry, GFP_KERNEL).ok(),
+            ))
+        }
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        None
+    }
+
     /// Creates a subdirectory within this directory.
     ///
     /// # Examples
diff --git a/rust/kernel/debugfs/entry.rs b/rust/kernel/debugfs/entry.rs
index 706cb7f73d6c..455d7bbb8036 100644
--- a/rust/kernel/debugfs/entry.rs
+++ b/rust/kernel/debugfs/entry.rs
@@ -18,6 +18,9 @@ pub(crate) struct Entry<'a> {
     _parent: Option<Arc<Entry<'static>>>,
     // If we were created with a non-owning parent, this prevents us from outliving it
     _phantom: PhantomData<&'a ()>,
+    // If true, this entry was obtained via debugfs_lookup and should be released
+    // with dput() instead of debugfs_remove().
+    is_lookup: bool,
 }
 
 // SAFETY: [`Entry`] is just a `dentry` under the hood, which the API promises can be transferred
@@ -43,9 +46,38 @@ pub(crate) fn dynamic_dir(name: &CStr, parent: Option<Arc<Self>>) -> Self {
             entry,
             _parent: parent,
             _phantom: PhantomData,
+            is_lookup: false,
         }
     }
 
+    /// Looks up an existing entry in debugfs.
+    ///
+    /// Returns [`Some(Entry)`] representing the looked-up dentry if the entry exists, or [`None`]
+    /// if the entry was not found. When dropped, the entry will release its reference via `dput()`
+    /// instead of removing the directory.
+    pub(crate) fn lookup(name: &CStr, parent: Option<Arc<Self>>) -> Option<Self> {
+        let parent_ptr = match &parent {
+            Some(entry) => entry.as_ptr(),
+            None => core::ptr::null_mut(),
+        };
+        // SAFETY: The invariants of this function's arguments ensure the safety of this call.
+        // * `name` is a valid C string by the invariants of `&CStr`.
+        // * `parent_ptr` is either `NULL` (if `parent` is `None`), or a pointer to a valid
+        //   `dentry` by our invariant. `debugfs_lookup` handles `NULL` pointers correctly.
+        let entry = unsafe { bindings::debugfs_lookup(name.as_char_ptr(), parent_ptr) };
+
+        if entry.is_null() {
+            return None;
+        }
+
+        Some(Entry {
+            entry,
+            _parent: parent,
+            _phantom: PhantomData,
+            is_lookup: true,
+        })
+    }
+
     /// # Safety
     ///
     /// * `data` must outlive the returned `Entry`.
@@ -76,6 +108,7 @@ pub(crate) unsafe fn dynamic_file<T>(
             entry,
             _parent: Some(parent),
             _phantom: PhantomData,
+            is_lookup: false,
         }
     }
 }
@@ -97,6 +130,7 @@ pub(crate) fn dir(name: &CStr, parent: Option<&'a Entry<'_>>) -> Self {
             entry,
             _parent: None,
             _phantom: PhantomData,
+            is_lookup: false,
         }
     }
 
@@ -129,6 +163,7 @@ pub(crate) fn file<T>(
             entry,
             _parent: None,
             _phantom: PhantomData,
+            is_lookup: false,
         }
     }
 }
@@ -140,6 +175,7 @@ pub(crate) fn empty() -> Self {
             entry: core::ptr::null_mut(),
             _parent: None,
             _phantom: PhantomData,
+            is_lookup: false,
         }
     }
 
@@ -157,8 +193,15 @@ pub(crate) fn as_ptr(&self) -> *mut bindings::dentry {
 
 impl Drop for Entry<'_> {
     fn drop(&mut self) {
-        // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
-        // `as_ptr` guarantees that the pointer is of this form.
-        unsafe { bindings::debugfs_remove(self.as_ptr()) }
+        if self.is_lookup {
+            // SAFETY: `dput` can take `NULL` and legal dentries.
+            // `as_ptr` guarantees that the pointer is of this form.
+            // This entry was obtained via `debugfs_lookup`, so we release the reference.
+            unsafe { bindings::dput(self.as_ptr()) }
+        } else {
+            // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
+            // `as_ptr` guarantees that the pointer is of this form.
+            unsafe { bindings::debugfs_remove(self.as_ptr()) }
+        }
     }
 }
-- 
2.52.0

