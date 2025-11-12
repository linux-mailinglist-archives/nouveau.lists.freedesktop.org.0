Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E08C50860
	for <lists+nouveau@lfdr.de>; Wed, 12 Nov 2025 05:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D80410E68A;
	Wed, 12 Nov 2025 04:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IzJcQyZ1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2B10E685
 for <nouveau@lists.freedesktop.org>; Wed, 12 Nov 2025 04:30:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFu+2oycL5e0Tu7fdc+BsiFB74nbwzJIuMAA4cPcE3Rh6A06awWxOXwkoZBGzX1Ju+YewCPeyxyTSK8fbhbrhNayIYRXvQF+tT9ZYUG06ndTAEskxWnjflfnTOaQdBHhqX34mmXAHfVXm6bhfwOgXI9eXFqo90PBLSb8GI/xQb0sN0XRQ68YmdkP2gUSi413zfnoeUBb/jZc87lwHXTivzu/M7OBCLtsZJX8KjXJzg7xW3VVlazjMUE1Pkg7FokBbHdYZ+M4KWHbsC51t+Gy38y6vrJ/sDUVdqgWzFrWtl/gbSUqAqC7/DSgmwi/mBNhAwpVha0tqtwWAesUp+0+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXTKu5JpqKhnzmNKfGahJzhUoqQP0ZcG49v1auciZ9o=;
 b=ZMv27Le2z2L7M3HUOJzGBcIWBkZv2I/3T+EWB/r/4t9LGv+Z7hIFUtgCH/CO9r+iLRA2r+VRbZKcaxJmgY0E/nPQGksQ1ReTGrjwuc0FmyFcTC/pLyUB63+lCAL7x2i1DML0ieMLVAZgM56LmdIHaX738tndmQ5jB/3IczJts3DHOdQ5NQDGXcgI0wKPXFK0wsTFe9G1h2+zSN7zw9VUMA2y0e/JgmKm5G8LPSEc/Fw6wFYQMyQ+yo8DxiTGuJuzUCq4SVM5O3ujvrreCtTybaZDAPj7EkzMo8JrnE+v5Bw/3vLzgsOf1eohUKWFYubuDszqberHXW84RsG3gu75+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXTKu5JpqKhnzmNKfGahJzhUoqQP0ZcG49v1auciZ9o=;
 b=IzJcQyZ1j07sWnR2X3bgr4ovOlbQ2gY8Ng2sFE1am0Dv6gquSTQDAcfKY9jtgFDymtjfy+gKV11AsB0Z2fLqPmGm/vwpfa4nUCKu194B5pKuZBt60CUAVzMa6EZ6wL9rxYiklOJOztn/sac7lV72cHtCQQeDRXjFYH4GvRHMRDHrNFNqmZ9SjzN5iQ4IGfXoAL9DvjczvmooREjP1gPxBo4HRhQ7afqwAeCrDVCHiG/HiAqhBNqLUdLS1gHpHWNeTdxwjmVr9zXDG9HqiYox7eZDuQJ0lHFdfGZTisuRXGE423Gunkw/cirIO82gsNKbg62hf9WFG/OvOnIXFDeVDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 04:30:04 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 04:30:04 +0000
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
Subject: [PATCH v7 3/4] gpu: nova-core: make Architecture behave as a u8 type
Date: Tue, 11 Nov 2025 20:29:59 -0800
Message-ID: <20251112043000.83071-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112043000.83071-1-jhubbard@nvidia.com>
References: <20251112043000.83071-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: de201c91-dbc7-4d58-0bcf-08de21a426a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2gJOQ8FCbGXo5UbjI44gxeVEn2clxa9qi6yNPuvv4bt4NTRWXbHOsEwIRg2p?=
 =?us-ascii?Q?aiCOCUUGFGYu0rsFomoUnSobylK8TIsswc9Lqbx7c3dH17rGlxVIHNbS/bIr?=
 =?us-ascii?Q?WLigMAm1Y13bUD18BSvu/mtiFBHbGH4SwScKS25p/Fabi7J+DoZEdp2iNUcR?=
 =?us-ascii?Q?qhtepWGB7bOpHNKNZmK0gidiYHpqHE7tPkdTlJbt3AaQMUbiBtk4kt9Gxer0?=
 =?us-ascii?Q?N+rxmFq0CX0wctiCZOdb0NE5KKXXtOE0HSLeDTYapEPO6JEkWw4qaDh3nlzM?=
 =?us-ascii?Q?Tme9ywTDeQnvjE9BSqXNc3PAwLrZCHd0c8vDJ4cvHFad4Yl1p/ovELFaJD2L?=
 =?us-ascii?Q?a7pSP+hfGxLg/wTCeXNvTjZ9W3yCEuq9JfEi8/bWf8vbd8haJvROz8hDT2zr?=
 =?us-ascii?Q?Vw8u3CnrpeboQCshcDblP7zHQoLDQZfCAuU7Z/wk4PRbOXvkWhcolqEqTQke?=
 =?us-ascii?Q?B6x/SiW3FILEps3qCNs4vm5v+Iwbv8vc9rOCYqcALt6fJVvWjrFuPcpZc9jO?=
 =?us-ascii?Q?zGhJwL7wydbUWiP0z21TftytgmfnVVZFdFafI0NcofNVGCxeXQfqOLsy8UPs?=
 =?us-ascii?Q?mF1ALcSXxsj+LnfGltqzu4Thw3dRvdWNkq8j8cuhTM5X2LO7472qk6vJMBin?=
 =?us-ascii?Q?SP/14PoiQnuS9dUpjWWQPRo9IB4TtEfVnt0Dv0sm0owQ75OsdRDvrsGE2AJL?=
 =?us-ascii?Q?T2AIQ6B8EfymfoqllQO94eR0vQJ/YHlIr1+2PGQK99NG7hKi5SEfAnQmQlUl?=
 =?us-ascii?Q?53C8bgaUAAGdO2rtbbvDEH0L7tdqsPN1wIGv9PMPKZreFiLo/+OmfTJUernW?=
 =?us-ascii?Q?HPkWAS6ow8JrWD/iurfD77uBUR7+iuPhBHHfZr1B9EtXo6j4K051nNjyECmx?=
 =?us-ascii?Q?IVodWr3ntLGdVPBzX6+ueu56j1eD4IyV8nyKCwRwX01ODss8NLk0e3mW8+lw?=
 =?us-ascii?Q?ZLxvUQKReKnTMhkngR3Ikq82rhuBMNst2feZ8naXNtFI+RhLcl6j2YgrWORu?=
 =?us-ascii?Q?G5rIT7aesxIPsCwKoFGiGP20Oc1CPB9OCGtxJ3TOk6nIJ4+4pbaP4+eDu490?=
 =?us-ascii?Q?Mb+BLQ+K8JnS7uTv9OfNgsziGP2Tor6Y/n70QSL4p9k/b6L2nhljJpFNsmr8?=
 =?us-ascii?Q?yzc9EsE0EO6XxAC38qDt9jVAoRhtyprkIS9nr2T+sqK5fUbyRhY82jug+4YY?=
 =?us-ascii?Q?k2h4Smgk++iBS67QPxxWLRylNgRAMWWs0QmJKMVWrS+F21BX+mxg6pgm0w4K?=
 =?us-ascii?Q?e5sRey/6ZYN6WZ0R2SU2bH4dUh2aEvtMH9wWXogiuzkJBQIV3ZpmLatfl/9M?=
 =?us-ascii?Q?2/3SYiw1l4Bu5WHa2I/++DLU2c2ttq+DuEWEZsibcN7zOfhvLc3XJdW6wOQc?=
 =?us-ascii?Q?8FxV36ucPO4dKPo0q/ejNmIeYjw4jSVwCP9my77y8F8FZBs5TtiT5eZRVyKr?=
 =?us-ascii?Q?egIdNoNhU9yE4Xn9XkggDzmvby5rogwY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JEASM7UjaT89YNp/CQUo/+mUNyoeP8KQgXAhKGzNFil0yFtvoYss8Vmnj/Dp?=
 =?us-ascii?Q?UZSQ7mhxROrKAmMUhWLAW9pzXfgu10m5O2ljUqJ4zfVcKTioLjF0B68vdHLo?=
 =?us-ascii?Q?+s9kDk7dKsSL+peNWAiW4bKWuQwSKcMGSRiVYv8FQUm5N2Vx55vasmDH2go+?=
 =?us-ascii?Q?NKUktFbNiUiYfZlcSyBcQOmObJuxSxycTYsg1OG3fzFS+8RC556DPAFGbgKi?=
 =?us-ascii?Q?5Gd9nAATMKDP5A+Tw7KGw1YLxLK+XPNby+yRbpxLbbL5cikhr4EcyKiVv+O6?=
 =?us-ascii?Q?Z99hQCbhmji9DwGWg457Xnlzf+WpDNCEl6uIvc1iLAS4FoI2OqNton2uoYPM?=
 =?us-ascii?Q?7z3MnkFlt7f56DLLVspaQ341VgqLtusAoFJxeZBAqt8HnkMltDkvb8GGm7l9?=
 =?us-ascii?Q?Nes8GSEi1jB2Gs29sSh5grMLz/vxkc8b9Hz18EKlKmv4pbJKRrC8uT/21UdK?=
 =?us-ascii?Q?lo+f01pk6lrjDOh9M16OKCqb5Q2YR7+FqEYhrWSxypzz2ur9TxS+I5GuivjP?=
 =?us-ascii?Q?ZekCKptFzuOkGAGs9sRX/1FCiQMTDvvBSU6bt61oHqR5JtSLvUIniSdJ1OjI?=
 =?us-ascii?Q?mBgUtsu1NAbL2apXlxEiBj/ba5nWWGN9rfccTJQ0pYklFT84jmq3nvrW/8nb?=
 =?us-ascii?Q?zggk2ISsgFHZr32HsJkbj9s1GJVhb1LomBpFimjZBGvC+2D71sEmsdE9EVaS?=
 =?us-ascii?Q?ZRNU4av64L8eQE3ow65KxlCX+a99kUvmfkW/hxiKdroa72lCkvQqJJILbseg?=
 =?us-ascii?Q?oas66WqE74yhEYt/7QutdM++IMWJXWKjlsveTjbLI4ImtuTaq74fKCZBhIFM?=
 =?us-ascii?Q?NAqnfhhCTx8h8vTF+ajIEiisJmqNC67wgHhWlo8WR+ozqS7/A8uYqXsNi1uW?=
 =?us-ascii?Q?ekGGRetwnRfT4AQIaaFsCFlG5w4+AMcqVhb4b9ycuWjlKFsLotD2VOAUvtG3?=
 =?us-ascii?Q?QUmnYdf9y+WlW/HEBcWrtDfgcDYU/dtmPU2+RzSolj3f1gzafjhkFjVz9Klu?=
 =?us-ascii?Q?0FbmVOezy3SVdMrs29sGgSmkyHzjAlDRfUwnY1Xh8xBOwr1TUOl8UQpFqvyM?=
 =?us-ascii?Q?7AUVYbxUHLIVdqT+Wo+VK/mMAYRJkd1DsPX/m6zdbhhPkWAfH5ggT+WVCazb?=
 =?us-ascii?Q?g73zW2/qvYcGqI3vWkseFwMpJuilZ+AnvHINW6IFF2NwlXv44pl8sYbIQWGN?=
 =?us-ascii?Q?s6w9kf10DZu2sUopyjl3DqTNInTUlbTmKPgSZiTQ9OsH0W/TnDuSIS4Tcxma?=
 =?us-ascii?Q?4NKN08y43SMDbx/jHMDSHWzIkDEyWL5BUK7NezIzK3IHF+Ke1/GgsWZg26Zm?=
 =?us-ascii?Q?3Tmxcj3m1b1x9OI67geCN+YDLbgg/eGdIZImQcXOlFmqysA7SH/o2UlT7NrQ?=
 =?us-ascii?Q?w8wOPwAW3OVCI4iLQ6py4zCkEc1ABPlcf4nvIBpiw5ac4LreN9cjHjs9u38V?=
 =?us-ascii?Q?2Jo0CzMUVmxgXCR3156NTZFzl0m4oSnV3Q4SWdAe5Be21z9LPyew+Up4LXJa?=
 =?us-ascii?Q?YEMpD5olyWb1NJgqRFOlhQ+IKSfVgu20SoBX8j0dfYRKk9CPJtU99XrNd5oW?=
 =?us-ascii?Q?kzeEmTJCV9GcqlLrPXpyWVgHS1QSz7JuZPE23LVu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de201c91-dbc7-4d58-0bcf-08de21a426a8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 04:30:04.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02Wl/3O+28xJAX7xTZiosA1Nh0ZZhJ/NFeLo6bhnJDfXSCKbEJgR+EYBjqk0xanrJxm8qoejV9JiPd+6LfmJXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
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

This allows Architecture to be passed into register!() and bitfield!()
macro calls. That in turn requires a default implementation for
Architecture.

This simplifies transforming BOOT0 (and later, BOOT42) register values
into GPU architectures.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index acf564fee9c8..cd58040b681b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -122,8 +122,14 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-#[derive(fmt::Debug)]
+///
+/// TODO: remove the `Default` trait implementation, and the `#[default]`
+/// attribute, once the register!() macro (which creates Architecture items) no
+/// longer requires it for read-only fields.
+#[derive(fmt::Debug, Default, Copy, Clone)]
+#[repr(u8)]
 pub(crate) enum Architecture {
+    #[default]
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
@@ -142,6 +148,13 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
+impl From<Architecture> for u8 {
+    fn from(value: Architecture) -> Self {
+        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
+        value as u8
+    }
+}
+
 pub(crate) struct Revision {
     pub(crate) major: u8,
     pub(crate) minor: u8,
-- 
2.51.2

