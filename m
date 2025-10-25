Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62CC08622
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 02:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9C110EB43;
	Sat, 25 Oct 2025 00:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E4+9jUyy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013009.outbound.protection.outlook.com
 [40.107.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742A610EB42
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 00:15:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKXFv5GQbS58i0ylqXUkZvwkj7B4oF1ZlA1ysrOC6z9HQa9vCnIv9YKg8jUH8IwyPcJnNjnpjIxbDFrY0PWehrF6fuUHe8hQfgGab1H4fe9tX9J1/fgBabcybzyltp27s7BhvFYwONikFt0Jc/lGW65J276b0Ng7DElzUV55dXz372mNsFblXEekSpQvdFJbaSmq5DeWpnIM0fLRBKz6elP06XD38mK3x9uoMq+p6OrUGrk/0sQCMN1ZWkFoHQ/1s0C89AoOCQrBwmeUnmIrHRodSostQ7jRU+TF661+zdoCh/lGze5Un9u1vZ1WZGPAmajd6W7XPidDM6c1qBuN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNvoqG93tSQJM/TSwiaQgf1hux4312sTSM9WonuqYBg=;
 b=DCUuCAMHQnHU8UUsk9TzmebTSZRgm9L9p9AsTAkj+VEKceTUJqze5pM+BDudHrHkx6EqTsUupl/LWCfVjN9X8+qCi5+EB3D2ml4QERSFvXKNE0AAi5Y6QUcm0PX6ODEqXMP+am2nWvl71j2RNbzR2NxE81f4a3Fp3lf3J0NoEVn/Sf/9tO1ziv3R9BICm9fGSyruhYR5BhZwgsqoYSZcIeP6tZpEtZapTvRvUNiIhTH+KEagan1i56URRDB4htoCky+UGf8Y6ZLMDyiCQ1fqjsUWKr2qUWDJQXrzAtd80Cm5ahLtcHIiEQi42kiwyzcgF/2gVNjjgMbXNWfq+21kpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNvoqG93tSQJM/TSwiaQgf1hux4312sTSM9WonuqYBg=;
 b=E4+9jUyyXttFlVdpKNo5kXU4eUM/7Zvkv7frxoLlSF/K8pWAwKCVjAB5NaOd38vaJHV9xbgigvjyEwrHt+BXOMiCwUXNrGrPbfEBDPOqIIpUlGewCAmkC94xLW8eL6q0N/nJu4RsL06jVF0RGq8FHos+om/8hzpT17HOQCk9kRUuHh5eOSHGIPYkEDfaUJIrABA2RXqNptA1ihzQJSrlMrsvT5AluG8SV+YbiS7yFgaAGpyTjg8i+orG6rxEswXZDlb2LDaG87Snb0c6aYC4gVZ7JSarsyzyemQrP30oDCmo5IAwywhJJ3ZD1cVWT4CdIHvGMi0BiKpUMCQiy/iAHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 00:15:02 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 00:15:02 +0000
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
Subject: [PATCH 0/2] gpu: nova: add boot42 support for next-gen GPUs
Date: Fri, 24 Oct 2025 17:14:57 -0700
Message-ID: <20251025001459.491983-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0193.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::18) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: eaafa1ed-9033-49a9-374a-08de135b8ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uWJ+fSDuCB7rMtBnCe+8zoX63+nc4rIgCEmVTyLPUu0sRa7hxDoe4RpkFZ6P?=
 =?us-ascii?Q?DSEy5kfYtUnp9MbRqyc2SitZ7aVbP9zt8+u+osKrYy1ZzufDfNyK0plgs4rz?=
 =?us-ascii?Q?jpoJXXx816P07vDKjumyFXVz+0cJHwEqnmWXDRmtrI+jNJA540fw2SgqSnQ5?=
 =?us-ascii?Q?ZWUURlyiMkWoECnJVxdsLwdBedqHaaaJGoGPXRDc9/eqvFZQff+kk09KuPUg?=
 =?us-ascii?Q?jylxPnTi0wfAy8rxKwM6RwJJToVnKa9fdVY0Yf+GtaRnB62sk5QIiTyCZLrR?=
 =?us-ascii?Q?cm53d+XxrJT0DO5EzPmNqTNjlsvLvq/gidGq4fCl5WirdeOZsxcD2QsuptuP?=
 =?us-ascii?Q?S8z+QxT9tYj0MgCGrqjfTZPIC0E9T0Cw50JBoaWzXCZxlOSrFR0vQsB8ZBSj?=
 =?us-ascii?Q?jNKpg60mlDCx3tySNT/SxPd6nzFU8mbgNEPZeI9hWUDj+7zPsEgvjcNDSVuo?=
 =?us-ascii?Q?BjOe5lCIAC4r2ix47Z6OW7Q5n16L+DdqajW3i/6JUHH9TLskj+KMg58rQzcU?=
 =?us-ascii?Q?UkfQJkc8Oh8NCDDcZ4qj3Pg8vut1+DOKUIx0VtTDOu4GZcxbBYfVdPQLbEFw?=
 =?us-ascii?Q?6oM5anerHI48UhO5ebJEd42YHTB5lgjhWm6Ni3YQ9Cexah8ost1TIE5U+1ik?=
 =?us-ascii?Q?0dquJo1VVMH3aMBl5uZSVut9q9bMMu4KNUvXY5ziW5qhrIikX626wOa9ZsFH?=
 =?us-ascii?Q?7fiVXyw8s8TpgVcM9ENLF3/thafLcUSTZg1ptt9RsseFBNAfpYNGtegp9jqI?=
 =?us-ascii?Q?y8dIAfKCwbi79y8N3RbiQPe4CPGw7bmoYE8vEZpan2b6MQrT9wNheg6j61HS?=
 =?us-ascii?Q?tiYdf+srpmVFhYciReju/AN1QJcKw/C9EjgQOr1R6XoUp+RnlibZBqY67JkA?=
 =?us-ascii?Q?DSwXgoSlOZpj943ODggqOq7LjLxI6PFLxtBnH4rT0jbJvY/O2MFqpnKCLOvG?=
 =?us-ascii?Q?32Z5Zj0tj1CpmlXPrmUvnWII+HZxzEE1gHf6KDOXuEb6k+Yisw3KCwhz2YQX?=
 =?us-ascii?Q?hoeksE09GPJEgGwJvF+TR9CNy5VpHBAklSG6UuYK1YyLgn2vSDTUM4KQ0Mbj?=
 =?us-ascii?Q?ejlE9+TG3UT+jGPnNfwT/ZOmDoeViWL6469MVLU3yphTzfULw2tQctu9/r2L?=
 =?us-ascii?Q?+xSAwp9QH30jH6ypjCH26HSuLU02G4T9nTVg6u+LjXsZ5gONCFiIjRVstv/E?=
 =?us-ascii?Q?rkVWrXox3r+LubPVzhVXvTadwO1x9XBpqG9hfzpTSeKd7DTbvkw3NKkF0mrw?=
 =?us-ascii?Q?e2hzIIu+lIcYNnIbueZUwc/dELChFPajwc3vLafGAesY/zmrVVdIgNhmsgMS?=
 =?us-ascii?Q?v0qhFqLoEulLVvU92R5q3Tr7cLslABRitO/bJj8lQJohZ90X/mfPWqzRVJIK?=
 =?us-ascii?Q?s6rw/rZspJbY83rlyZCxftAltORv2dBWP1/QolqDi74oWrMa9BqbbDfdzcpM?=
 =?us-ascii?Q?88SauyB5kI5ehvOZawZTfwZOnJyrVrp0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NpQTpaQVhOGm9QQS1N1Q1quqtg/LKqjQi5rAc9yd7T7bBG7ZXSyNdW/35hMC?=
 =?us-ascii?Q?c8tpkBrNvmZMEbkyb9NE/dRgDI5YpFDa3lK/Reh+10/B4iLLOjFyTIWEfsLQ?=
 =?us-ascii?Q?X7X3WuuG60JzYbvQL4gC6E5kbvsQk8wUxVuwK0EYwclyzTXSOp7BTfyBVOtX?=
 =?us-ascii?Q?a4jZsI9jNa84yGJZhzgjCgIZEldaf/ZT9FnSPtZ8phF56Tjl82QgcpGhpulY?=
 =?us-ascii?Q?cgxgpsOcUJEuQXsQ3V8iVtmX2puDEDcYAJI7Cd0Fe7RLLhRzLolWwdk9kkXH?=
 =?us-ascii?Q?OJrZxRwq6heoP5BFyMJ5ZaaXMKD9xDEv0+SE9Z+MpI4lbUoyckqDSF+aF3ss?=
 =?us-ascii?Q?Ca3LbVvUpHo0aJrahAc57O/OIRQBZANbJB5WXdoSpdwoX7Dq7Q/bssH0dAJO?=
 =?us-ascii?Q?PYT7OumbwYR3l0RFcp41w/PNvcE/uqlfAXFR59SP9XcJQuvu0WiSjH2l1s+M?=
 =?us-ascii?Q?USQQdXDH9qlENfr7zpITEWQMDUr5DeaFeKceDyt7XyxhEkebxSJllppjUpqD?=
 =?us-ascii?Q?IVMtDo/6k8sEA/wNyMn3tnn2nZFT0ZVCzHiNO31GEWaUkmnAK1iHVEdrdvm+?=
 =?us-ascii?Q?t/KvxyJ6k9qRJ9RnL+3PHMg86WN4v8zq3LDPZ76QORYN/3SRj3oWb26UB+0A?=
 =?us-ascii?Q?9qmTzjQu+QTgZHY+or6LEzHIQHlGsJwOPW5MsF6dqb6poDb2zjT665OqxYUq?=
 =?us-ascii?Q?L+WzObiLN+NZiHj0iLuah5tGHql+VNAVyMsYmzvIqABcrK7zvkCbKXVtMulV?=
 =?us-ascii?Q?4D5m+XXON19c+b77+yd0z8dLlZNyadnYzBmz2uynI4OGfA8PqQJFFaN5YdXC?=
 =?us-ascii?Q?rVabLZEUU95m3RLqWbJhb1WjxIT7ONTq6ybVXspXj5sUbQFdAvOCkVWaNJqr?=
 =?us-ascii?Q?IVcGwyuxbj3X/Yc7k8JPDtFk5o1rdsq2yXKhqra7pXgOphGqyroWHLoRiDIb?=
 =?us-ascii?Q?olmqbca0IYGWBR1C7G25l7Nqq2/PG0Gm7c5A/K1+NzWWCUGaitPcg4I3pZyl?=
 =?us-ascii?Q?J4ztw4BA8maz5flTkej0rxLe4M6MXlD4SBAl0hzxzw+gkUvdjr9/ZSFJp12z?=
 =?us-ascii?Q?Q4kocS/y29PGqzp3Hp+dZ1OC2U9RIogYYSALo0j9j+5D0PP2u//movTy4Nax?=
 =?us-ascii?Q?sFpmA5KDofK7HSGItcqK/Tgo3HB/10pcJ0niH4jVM8zlj80feOSE/MBllC1J?=
 =?us-ascii?Q?vwpIfHUiziwDmGhhpm3Y89vOra2WqSa6DFYOSrh7N8AwKpctquci++TLeihg?=
 =?us-ascii?Q?1Ai5K2d9Vl1ZY+A/UP4Zi9uzHBVKTrsRHMkHRlgBjEzpsisjMCsKMbYCowr9?=
 =?us-ascii?Q?MHjg01FDE4BkYmO2Bidm+/w/XUQu98uHVkD6VryxT/a579supfyLz9roXrLM?=
 =?us-ascii?Q?sWYI+93jj8x9MmvrKoZpv55OHrOgtzitUNPXE9G02yCRIQJGUevIIJft6xmx?=
 =?us-ascii?Q?3ldEPm4RYy7Vhr86RY6QEEkWi7cHeMXckuKG3g8k4zIHSilwJwAZifZv+N+c?=
 =?us-ascii?Q?KK7U3NCQW8w7P9wiHY2TJUl8CsrohR7THwT03JaiTT/fkP+/gvZym2vAF6TE?=
 =?us-ascii?Q?l2nUSd/+uscnh6ushKk2BPqOFWwRUrVW+/7L38T5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaafa1ed-9033-49a9-374a-08de135b8ab2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 00:15:02.4406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMfGXurwY/wzv3EzcelDjOlVhDKV1G+u+MTo893R0B2UBfAsx1h63xHClRChL1dyFH9ujYBvgnURv8jOW+bNTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313
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

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will be zeroed out.

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Also, remove a couple of types: Spec and Revision. That deletes a net
total of 33 lines of code and simplifies that area of code. It also
simplifies the subsequent boot42 support diffs.

This is based on today's drm-rust-next, which in turn is based on
Linux 6.18-rc2.

John Hubbard (2):
  gpu: nova: remove Spec and Revision types
  gpu: nova: add boot42 support for next-gen GPUs

 drivers/gpu/nova-core/gpu.rs  | 120 ++++++++++++++++++++--------------
 drivers/gpu/nova-core/regs.rs |  28 ++++++++
 2 files changed, 98 insertions(+), 50 deletions(-)


base-commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f
-- 
2.51.1

