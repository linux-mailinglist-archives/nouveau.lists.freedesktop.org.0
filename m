Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE60D388EB
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:50:45 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C60FB10E940;
	Fri, 16 Jan 2026 21:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nuoL1u7v";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8BC0944B97;
	Fri, 16 Jan 2026 21:42:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768599725;
 b=xLvCBeWdqnHUw1lK01Ypifm40r5CKH85VZ98sSsyNFfCwb9isITkIhZ02akqiv2XgzVyM
 /nJ6CLA7seYFjNZTFOCgc7rO7RIoGMXX8rfNBTX4DS4SI1+6XeFAi9HC48wFZsjMt/F3q1E
 fgFY+MzisWGAyHfTPUVytEHh7/U336m8TFY38piT9k5LPKf9v3MY3YSPnqslledEnE80ZLQ
 9QQOhnbeCIC42b2jiwaAQc/4fGewx0+mBdus/ZAihyX9egXbclZRez9zP4rNgLq99oHzoRX
 jfR8tp3VbiuLDE7WSBy13r+V1dWSSJxEF9qxgE+eWVZpc//ts0mNB/+osJfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768599725; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ENHJm9Yn9/4bGrGxzSc632ORGbzHF9HItZ95wTpuXhg=;
 b=joNXhc2JgIOzcKg0hLCnNdxKcGBOPVS8ooDrQYriaK65SUmLJRZ1XAUPODJ5XMHKxe+HR
 h9uV+IBZMGv2al0jM/hDs5NmgcshiGenogLJsIdvnokbLhuZeoU+WOHUQ4teqzi38Zgioco
 Ad/tMLCz2szKMbNBWyHitbynTQ4DksKxY5BkKQ1FdUtfMJ4gPEfdkZrVSGGmhdKQp1swGu7
 CVF432C7ihyK4xVzk8SUcZ7SlX8XFkdBYvQ6dYBWVd7kfLO7h4sJcru14KCP2tSey1jRU0C
 W2VrCHM7SrUjD0lQHvX/7y1Ldf2+/gDzU7JCXyLNoJQAsnRkPn85sjzxuDeA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F0D4744B97
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:42:02 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EC89D10E10B
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wf5cRIskX6RYEDfrqAJ7b4dWW+IEGfk/xhLrq+gF6YekN5POwvSwm0jyOs4gYEoWHaAdGftQSN71TGP00pJLmJVoZ4aocjA0tMqFE19VqdsvKy5uXYeiHwYdX3y+qBQ63+1PDjMGQs9BIOPBBAs6SfriZuxs1RjUfKewlRzfrTkT5A94JB5Vo65bpniU6PW4XDMKCvx4avEWRI3D4MDPN+al87/ofza2YN4oJqpPs8S5Gws/wrLFQ/p+7WMm9SQ/KcBBTD3s2AHdvwcNwmz+UYJkM3wF6+GdM8JDo8Wad2N6zBz1syURd4vzmYtWEwmWqBbCJZbAgdYe6GUKBfGq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENHJm9Yn9/4bGrGxzSc632ORGbzHF9HItZ95wTpuXhg=;
 b=dIj7Ea61K+GP3ki4JQN1ecaTZ83pPYtm8eeFke3UXnwT7u/8KrFPKsPwIQz1njKG57EEcD/JaFlMdAAdJvf4ZP1de398pZ2UzDUwb1S2nOMkuBGq7yoYCfwPqDETar4fIwWLfUj/CFhCJHfCLyh6UmdeIggIY5CaioGFp2yx2tuYBzHLBasTE5ea135svDftbrl8NrTflXh1+6JJ8Mo8fzFzr4pMp3Z/z0eJp34rBe59b9SUuf2nae4oWFe72EVPEC/YVgqTM8PDdHwwWqYfUlIwgj3QM6Hhl1ugYudBWJAJemk9+Mo7nq/ddGv65UCBPTkkrIQ3HVJ7IsTKwWBCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENHJm9Yn9/4bGrGxzSc632ORGbzHF9HItZ95wTpuXhg=;
 b=nuoL1u7vewcIGviefjI0xiqzwtQOm/PgrQpwKQFKMBmnsFay2x7KwuqS4GdPSvM2ha/xmSPYe/19xPVyF0slMrl4noydm/xpMiwNN+DBrYKG5bJyOw5s2ZB92YBeJCg4f0OAIUgrD5/mh6Xgyf9rqINtDJZNpBy+Dg6hUyrphQzrne4GSOh4J90fwcL8/9SO0tlR37ExUg0XwU9lRNK6/bCGBGi0s/6Ky0L3xwLogAf9XIE+E2oy2w1npe7ASynGvVbUMP9EKkiv+46aU+8i0bDAPk97OPuKfthPcS45TaqpeRHcb4pc90KbkOv4UPB07ySCeE1yP2RCPcYBnbQkCg==
Received: from DS7PR05CA0067.namprd05.prod.outlook.com (2603:10b6:8:57::12) by
 DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.5; Fri, 16 Jan 2026 21:50:33 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:8:57:cafe::72) by DS7PR05CA0067.outlook.office365.com
 (2603:10b6:8:57::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 21:50:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:14 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:13 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 2/8] rust: debugfs: add Dir::empty() for conditional
 debugfs usage
Date: Fri, 16 Jan 2026 15:49:53 -0600
Message-ID: <20260116214959.641032-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214959.641032-1-ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dac5975-8243-486f-d4c8-08de55494684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oAN7OCYTqNOwiHRPBQWCZnRvdRDR6kqv7qtGLafkcTzZkt8Bv2BdNH5LEnt4?=
 =?us-ascii?Q?9t39vp96aX2gGzH29hZYo0zbbJKCKi9WdDdOprC3+A5HT898V6k4XIumoM8O?=
 =?us-ascii?Q?XD+OftabAGmemU9qWtKhszeQIESnnqc762ziAFjM5CJ4P3nlK7RtPGkdobs8?=
 =?us-ascii?Q?XVl6/47wAQHVJLH4bG01QPIU9UdDIdXtGbPfIw5R8pZnmrSxmCe711yX6JNU?=
 =?us-ascii?Q?hSBNRQTfyYuATAWltHgC3XrmBI9lPrqNfmSmSVWRTB+haBtdWoyuExA8cpUr?=
 =?us-ascii?Q?cmP1dwT9+UxTAnJNeK/kmRjq3MdBPb8zaeNBWqVAz6PPCdiKh8XI3+Q1sJYU?=
 =?us-ascii?Q?6578lb7WWKVrL/OMDz5LkGXyAqLpHt2+JLAguSb3YmWLiTwh51LCUl1lhggd?=
 =?us-ascii?Q?jtwwuAJfd8MYyeKEuUoe2VuPZ6/JaoXSfBzX8N0KgtX/xadsIvOWFfCOLfdz?=
 =?us-ascii?Q?Z9SzFqqIfk8RQhHlfCFenipdabXorDqy3+x/MDAZe9OveVm0xlcE1lcm0MWV?=
 =?us-ascii?Q?8y6d//ZikdPoUhF6Gseb2HNAEtshXDeWqhkMzlPX72H6e3qHGIcQcyrjxUmh?=
 =?us-ascii?Q?RwbqC1gMmtft8rfhMeMrGdcFXbhCgaX3KJGK65/zJ3tkUYxCv2Rt/jmFEYwn?=
 =?us-ascii?Q?WPfCCZMCTSya3MAeGZTfyIGce/EociP1FumpdJGJKo4ZgInAXThpHrxM5ddK?=
 =?us-ascii?Q?YCtMmymJVkaL+OCH44dY5pFH/RfL2OBMSvcPyj9nFm0pvz8i/Gvj/8tUTG0/?=
 =?us-ascii?Q?HrTrO+pESMbF/dYyDnvUncCX+FLKDVrq+QFFpqfBEVhPAGHRWkrgGZwXtAzN?=
 =?us-ascii?Q?H/l3QMtnSEr6opGTYXfyGiDrU2auKf+V6TuPCY/WV+DZj49uEwhDZKa101UH?=
 =?us-ascii?Q?eWfbMBxodOmLtY9AefVEAaYNz+yXRk+jFi1ZuwyqAD8K+Z6Rb7RuaNuoEJlv?=
 =?us-ascii?Q?KR/Y+ALrNLK06AXkbyimoNIdSxHQVp6TU6r7xzSO8DwDBVmXCmD7I2CGIi78?=
 =?us-ascii?Q?FNRuHrI25tzgfhWdCPMOCFcivuT43eO9RdLlYZf1vX8N6DTAs7Rl5hV07hlU?=
 =?us-ascii?Q?SW8xxDctP+qKTXVp9w6PQLgyYjmCet+vmRVxrzdQz69i9smTSePePEnN5yOf?=
 =?us-ascii?Q?+7eDZyx2YrFxkCNNa6zGWW/h7qnJEtJW9SGe3DL/0cS2+E0n9DlRmQhqzRG6?=
 =?us-ascii?Q?pr9a0il0SKcFhKxHJZFMGE2XyTFEVdAeVwUzI2ESSEBMmD8mdVnhqe3HnTDm?=
 =?us-ascii?Q?kk9Iq9bjR0uqA5e0SeTEg2MhweWMrCYee/8MSJdapnaY8VpP58nJR/+shfCJ?=
 =?us-ascii?Q?jiZNBVMxgczkjpt7EiBkoOGEO/qLs+3MW/P7S/HxfW7HJdyuOIGXppjNAxcM?=
 =?us-ascii?Q?hjBG+Yh0p9knIrJU23yedkeKnkpJffNT55hqkaGANgmIZYa8jinmmV8ZbmwW?=
 =?us-ascii?Q?sQFex4Ui5evYjLMn3bysL7HIJoLryryU4C79+WLfetCctkybm0tE2UPpDMoK?=
 =?us-ascii?Q?4uNAq0QvVBije1UTPPbP3IdUrRscbrJj2RawaycVl2KwIPR+anBPyL257dCp?=
 =?us-ascii?Q?AS/OQlLAWOiEJlVJ/H4g1QaxIxzgjQJvlwsdZoi1yhNWBjVMAzkvbAlKxzq8?=
 =?us-ascii?Q?yiX0YQZX/sn6PEnsFgNFEglejM6sp31ruov/RQ96YmritycuStZJePjWVQ9i?=
 =?us-ascii?Q?4AFyxw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:33.5841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6dac5975-8243-486f-d4c8-08de55494684
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
Message-ID-Hash: UYP4LT4S2QJKMLKGRDXQUWHBJOLTFTFQ
X-Message-ID-Hash: UYP4LT4S2QJKMLKGRDXQUWHBJOLTFTFQ
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UYP4LT4S2QJKMLKGRDXQUWHBJOLTFTFQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260116214959.641032-3-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add Dir::empty() which returns a &'static reference to a no-op Dir.
All file and subdirectory operations on this directory silently succeed
without creating actual filesystem entries.

This enables callers to use a single code path regardless of whether
debugfs is available at runtime. For example:

    let dir = optional_debugfs_root.unwrap_or_else(|| Dir::empty());
    dir.scope(data, name, |d, s| { ... })

The returned reference has 'static lifetime, allowing initializers
returned by scope() to be used outside the immediate scope where the
Dir reference was obtained.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/debugfs.rs | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index facad81e8290..44ff2b37786a 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -110,6 +110,24 @@ pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 
+    /// Returns a reference to a static no-op directory that doesn't create any debugfs entries.
+    ///
+    /// All file and subdirectory creation operations on this directory will silently succeed
+    /// without creating actual filesystem entries. This is useful when you want to conditionally
+    /// enable debugfs but use the same code path regardless.
+    pub fn empty() -> &'static Self {
+        #[cfg(CONFIG_DEBUG_FS)]
+        {
+            static EMPTY: Dir = Dir(None);
+            &EMPTY
+        }
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        {
+            static EMPTY: Dir = Dir();
+            &EMPTY
+        }
+    }
+
     /// Creates a subdirectory within this directory.
     ///
     /// # Examples
-- 
2.52.0

