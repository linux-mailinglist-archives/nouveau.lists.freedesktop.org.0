Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB97CF69FD
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 04:52:36 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B33F110E1D0;
	Tue,  6 Jan 2026 03:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D/GoO6Cz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 59F0344C9C;
	Tue,  6 Jan 2026 03:44:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767671061;
 b=KxRYWYg4WnrBcp2U+Pp3I2rSkwBuff8wZyKZOvzPw+bWPexJOkPnUGCgTGsD8BAncg5ND
 jb6LMQdxnusutFgjO62rle9N4ljNrQxxSvFThrsrur97vy5kUSTV3KieH68nUopKtVS6Qnh
 Xx744LLS+6dLMkZ4qZ8DsralAmZlb2qf2XEooOtr4ktiUF2eh5ISucMKaWH0dc9lrcgLXxD
 S5Ll1HP7qkDP0taoCHoRsC3xLpjg2wHv7/ltXZjjaUH8q0h8goAz3hDKMJdDhyspzVJIueN
 +T5hCb6ogFIbhIdu3pY6JXDQEC448iscQkS2pGISVmdsXZWVCJUyH/zDFykA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767671061; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CoU/B/VajarV+znuTS5qD1terZa5FckBtsh0aNVsMic=;
 b=WysVbMKiw3rH0KBloYtFopyZcZ5u/0PrOVLAf7KOt3VMjtnHxCbgfEdQFCO7ARc2p1ZH2
 AusTh1+NXzO7+9JCIif/cO3JxQjTago56UPDsBcNARFf/P3J2dA53jJ+YlAQQ0EqT8d6Tfq
 LDRBBvqu8vIRC8EJJ+1xP7gSUPzW4FgmMemFPQF5b4TT4jAIURctPipxmcbjOraFaVkqGLa
 3GJIyjhBgOoCKkbvpybOPNz50mJVSRYL2p0KQmK9WDSg58Bdun3voJUj67QeAV/wZtt6UVC
 2ibELd2rws3mjNnLm9rcEFueNsBZ929UkjDV6BHLuSIyMDVPA2h7dwXr4t8A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 00CA244C81
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:44:19 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010040.outbound.protection.outlook.com [52.101.85.40])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6A010E08B
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 03:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbFcinuJx+JOZ6/YaR/17zUP/DJmEVgqgDzTx+BGaongBx2V1otyXjjSZeIOSlz8DDa/bgDeXPH76OQI+SGHC/uVIiB3nefh4Uss1XWJBkguvifY2rZYSNPUgRJ+m16BbnpSH3vxl2WJTgujgp5CgZWxpGxHEW0jYvv6b9CkU6AKdvLWOZYwVQJYcLIfaOc4PRA/5irW5PYNe8InYLrDoy8IkcR4JCbtAayMWKKfdop/S+1ucCbbZ2/dhKkarO7TQd74KNEHN85OEbOpG3BBkWgl9ZWbxxxbP9iYOnttZVmmx7sRVuxNOMS184vi32ukTHf0HIazRhAdFqoWFd9wXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoU/B/VajarV+znuTS5qD1terZa5FckBtsh0aNVsMic=;
 b=Ci+NQW4QENACpo9jgZ2a88OoZYs+/8KrCSHEnM/mSn1aG02rsi/scqUTei8WAMuWruxxYZJ6XzNVzYdpnDA6wharNoF8EI6bfIV7b+apPRgqgvzuPxB6e6El+ng2uSYuUWLCSajRD5EvnK+8hfRgO7g69LHecu1AnqPz2DFFqIgD71qk1CJ4PSTpOI6pny1/3f5UWaEGcDUOZqRKSnnB3H67m1E4wVOv3I9k93eJ39SzGc8ftNAxXgPiHZ0Ok3eTH1/yC+5n6JQwToUCO4QeGp++/6fP0E3Ss9C0jg9wtbIzgpcxv2ltz3nWtNJbV4rINcKNLNLMYuUT60bvdWsGrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoU/B/VajarV+znuTS5qD1terZa5FckBtsh0aNVsMic=;
 b=D/GoO6CzzKUioRtP+wqTyCB97aFIhMoluRId1oa3ZCaU4ZlCOHi9Ofp2vHavJQJEpS3LyJw2+ranrNmLeX0eU4VskihCZ9m6yk87trtHZIjCckgeWW/kcaeaDXwB/8UFUXTWuLNal+L3GVyjcDUKK43uGwE9ZQWFgIYD4AAzZqG0DoNbUMrcCYeSTooJGzBY0bMI9ZxxittfZyBdHHH+FKbf9zDMAul99JZcrd7BHAMu5eE4moWWgFBZChGs2fFLQvISptcTT8NIuDWbYnQcSGMZd8fFDH4vqwbWCUYXTUCrZCc2I+d4kCHI5qSVSzUI9x89YUXsTe2ZA/AOZ/QXsw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 03:52:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 03:52:27 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/2] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
Date: Mon,  5 Jan 2026 19:52:24 -0800
Message-ID: <20260106035226.48853-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 525e81e6-d5f6-40c2-430f-08de4cd70285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OruFU8zhvhjJA0eHUMR59B+qUQofiHbWbHy3XPaSn40/k4FhaVg1KtfN9u2e?=
 =?us-ascii?Q?4v7q5Zm4rOCLnqUZ6CYZZe3q8IFYroVpG/fYP4qWQzK7ZsQUolfoOl2wRan/?=
 =?us-ascii?Q?N3R52ngW250IJSnFGoHkMS6uiU+9xqKDAIGSzvqeGlhQZv3kedlr793zjP6V?=
 =?us-ascii?Q?seA9Bz2xFStMAdjnikhIKtSNYR/QGz9Ajfg9/7+DimAATxTV57VVO5/3pu5m?=
 =?us-ascii?Q?or3Fs+w5r9fT0rWfhRpnViV9FjXe7MgR4a3Iv3+sr7f4RBk0aM80Sltb72uF?=
 =?us-ascii?Q?oPhRaxXYqhebXF0sKOLJhvUY3R1l9lu2iYg6OCF4P4ioRdqtt2J6n1jQgZEd?=
 =?us-ascii?Q?B7fLLCNgsHETIt5/VU3O9z91qfAt590TtIPw0idAxs+gX6TL3T7youUfls7i?=
 =?us-ascii?Q?T1VBrmhktHontuQ3Hte+mcZM+EhShvOM6aO+zPmM83nc1t6TYlYz+NxOfVk1?=
 =?us-ascii?Q?wzQGM3CMsmXyfUFJtjIA5u2mEpKM6v2OO0XhjfrEvjQ8UMy/jAXI58Hs7RV8?=
 =?us-ascii?Q?BtsYan24r4QTj5sEeVRNo1Eamcaa47MhJv/nzpbDmzZJVkLMZKu/NUkbN5Ba?=
 =?us-ascii?Q?hpAZUTwc0BBaamK2KrIz3XLIjLr28n677xaDcrH4ahqrL78WOEcRFk+093Wj?=
 =?us-ascii?Q?uOzCfjD6SgYK2PflKGkqiwpGMTed0NkhsBqMC7hkkZMQQlUPC99QU+HZcodV?=
 =?us-ascii?Q?Tz0ZbBFAFtPmOO2MPEnpUGFusxl69VyU7qnRws4E0zA88wQoQfQLm2IdihwK?=
 =?us-ascii?Q?5US71GTxGO7VsJ3yLaAJ7mKQWIAa7wbakDZecIPqF6Mpb1dnah3imtz3WTIZ?=
 =?us-ascii?Q?6iE9yJHIE1LszavypI4fLjKCN5yrSq8NOCgKtSp1OrQP8mUJxZXzxrRLeEpJ?=
 =?us-ascii?Q?eWIzRXxtFZnRaK4aVWTTrbzklR1Q0b1IvkKd8QViPEMv5ZRW+rin1DoLu+Kb?=
 =?us-ascii?Q?rQ+r3E7BtJxlUveZCDVmb09WBQ5s4P2i0GCEQEK2+TUJlvsxoxHBlsOk/oHo?=
 =?us-ascii?Q?F8vGejk76DyP5XOLtUl2rnxwRJvp3OU3v2c/8c9QS2L9G7Dau4qnVlICvWgh?=
 =?us-ascii?Q?z+Tnu4Y4A9RmSbEKPi4xvchZKBtQnqv7Nxh9i8ubldRhQ2Y2J4eIKRCgfe5j?=
 =?us-ascii?Q?t2l86JbAJ7+3KIdTaocYi1FIA/zBk60rXp7Xzf8dgmXuli/3OQ+/JXo8lNcZ?=
 =?us-ascii?Q?WUsicCdiy8FucpfgY8AnCOus17uzV/J7J+3F1LS+e+R8zW5Btu0CiyzY8sZ6?=
 =?us-ascii?Q?AMv+z1yYb0p1fV8XWiCw+jYy2Y68Wb5Vqq80gWcP/3nzA0673FzAsckxji5f?=
 =?us-ascii?Q?JQV/dgajoEaGOTo/DZq2bj/MWjI6y06OdYXnJVHelmp4fSFFC/VmsfD55vgS?=
 =?us-ascii?Q?JeKmwQmJglVGh1D8SY7JVGPOLGgzkN9zI78iQmkKrVyNPHpt0P4Pb8IOhA4v?=
 =?us-ascii?Q?f3MD5T0WXsApdr7SnlxkpwWPVz1DVwTs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pwbc3+M8+JJNfCZrQWrheNnTYGJ8+M/i0WanVIgZAeVYtJzKLJZ/rsCiSlZM?=
 =?us-ascii?Q?3eNB4CWAp+8rRrUCBUxErXI32qIfJm5LW0ZgKKhI0ioMM/Foedr6Q8h1POHo?=
 =?us-ascii?Q?yPi2OCDcYvJWpkpDWU/H6FLMfkJXAlj4v2AsLop6VnvglxozeJkI8JvS2ysi?=
 =?us-ascii?Q?yQVEORM8S5fxIkzaZaJnXt9Ljv+hljFN9hgvybFR0pH0VT86M0Wcg9kt8ul+?=
 =?us-ascii?Q?LpgloCXeQn6t0748a3PwPtTffipif42Yp0uxz38VRyo2u3XHQ1qhsRrjc+TW?=
 =?us-ascii?Q?9bAMtZmfGL3S/5Z61Y86z/HhbAHjAYi57Jw95AVaMUMUeQyY4VDL8YPitZfd?=
 =?us-ascii?Q?/zjWU7Qvh2+aUD5yzT215/kp6cb1ZubE3FygG336e2ae/52DCsnMHaqpQBl7?=
 =?us-ascii?Q?H1d9oWY/qPWWAnirmuQ2w3JnbQoecYaCzG5pLL+du7ztknFxwJvo6SBpWYWL?=
 =?us-ascii?Q?X9tbm5rRmGSvIk7Wt8AElO8jibRWYAfgJLTVdDzNvpeRqUhLMBhQItqvzGaK?=
 =?us-ascii?Q?C0tP4kNx3xdUL9WFtt97kb+Ug6pJcyPcFX3N9UYub0VraAozMhu31kW3MD84?=
 =?us-ascii?Q?VgqKGnPps7IClCiWe/XgbVXY9xqIBTBof2AQVSjEfvdyWrUochcjjLPprWBE?=
 =?us-ascii?Q?h+DxG68KY+VAhbHIgA0Kt3GBdxa5qp7tj3MsjbiJzp8AqgRPUzJbO9/p6UMw?=
 =?us-ascii?Q?A0QjbFf3retMHQLuPLl4PIApLkOLAvASyGQxyd4QSLEjRgzVgzhkIwE/GNFM?=
 =?us-ascii?Q?72z81Hb4TuxLLtxp8QzG0Yu/OftFfSOb6XwyyQo/2leYu9J6FKGLCq1Kmjak?=
 =?us-ascii?Q?WNAsvcQYyVY5YQ26pp+v2vUptCZ20KB06XbkTpU4Gc9hr/N2ZaDvm5mTtS0B?=
 =?us-ascii?Q?5qbbq1c+dIEgmp7H6Hi3E8j8FonxKWtujhvBQPGSEE+UA47JGbrwQA5wNFqF?=
 =?us-ascii?Q?xf/1yVirNQjlxArptM0fHWC2rTgs00MUYGu2ksg9crhWtPnBH2ZrPRgPGVUX?=
 =?us-ascii?Q?Dx45PXvRjsMBVeQAPNdW5n+U11x174QdqL7JnS0K1Os3aJnKRFSgSZBmzn6M?=
 =?us-ascii?Q?wWcMintRFawEiVYWyYLWr1IqUymZxVBl6iOIWFq3Kuvufn/u/K7W8XZlcA9x?=
 =?us-ascii?Q?LkWXHB0FPGhKyb1Kdrx6VSyuvp+8h7VqtBX88IGWd/VKGb27BdS2lf2OvszL?=
 =?us-ascii?Q?dKOPn/q7vSGt7Wm+HVcNZ90A6wBXG/iFdVwhn+mixn4mbCKadNp1H825VR06?=
 =?us-ascii?Q?RwHvNZsQjtYiScCsjHQCu+WzbaPGDei+b+XM93ISLjLdlyFgQ/cehgD7SiJm?=
 =?us-ascii?Q?BwqeVXjaLuz6FyFFa4o6ON4Vgk2v3BER6xOs9969j2b2Tj36hR+P7cFqg84S?=
 =?us-ascii?Q?kMjHE5DmCI7wIQdAZdez6aw+7/6iDKXCKA08R3u4VOekiLRTSato5DRPXZEJ?=
 =?us-ascii?Q?pWimEYf8JSChfqdw2yvzMnwlSf6ysuUZz1GKCjm5bxj/ov5xv6v+JTwDei2t?=
 =?us-ascii?Q?DCv0yPC5ZMnPfzZtjQIQMhxaKjottIXYVSkJSGVUMFLsSwYJa2hUpUyaxbYN?=
 =?us-ascii?Q?oTVL1cZMjwPUeKbNtEVmhy9L/rSviQYOxuUQZXuOlxbpbk1H93mV/TNjBVSp?=
 =?us-ascii?Q?tHgVgGZ4VbLL4+LFoTPCtDkN94iEPFkAtqBlbACF3h31wvitf3MV3Aftc/sU?=
 =?us-ascii?Q?YyUs8gBJ8B5suCJeP9OZW5OJ/3ndMk8Nx3sYHrw+CeCM0k1E/zyu/kyc2dxq?=
 =?us-ascii?Q?nLvQc2C9wA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 525e81e6-d5f6-40c2-430f-08de4cd70285
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 03:52:27.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CHoyW0s4qd6KwHv6hoGU9gpTiTD9hRaKgcW3wP6wX9Y4yUPPj8FSeIlMY5hmA5FR3/sB3y/Cdks3pVVxA46pMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
Message-ID-Hash: RPFO6ERJXOYHHC7DF5X64GASIY7JSAXK
X-Message-ID-Hash: RPFO6ERJXOYHHC7DF5X64GASIY7JSAXK
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RPFO6ERJXOYHHC7DF5X64GASIY7JSAXK/>
Archived-At: 
 <https://lore.freedesktop.org/20260106035226.48853-1-jhubbard@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Alex Courbot's "[PATCH v2 00/10] gpu: nova-core: miscellaneous
improvements" series [1] includes a similar patch as my patch 1 here,
but this one here goes further and deletes the entire util.rs file.

This is based upon the latest drm-rust-next.

Changes in v2:

1) added a second patch, as suggested by Joel Fernandes, to do a little
more cleanup.

2) Added Joel's reviewed-by tag to the first patch.

v1 is here:
    https://lore.kernel.org/20260103013438.247759-1-jhubbard@nvidia.com

[1] https://lore.kernel.org/20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com

John Hubbard (2):
  gpu: nova-core: use CStr::from_bytes_until_nul() and remove util.rs
  gpu: nova-core: use CStr::from_bytes_until_nul() in elf64_section()

John Hubbard (2):
  gpu: nova-core: use CStr::from_bytes_until_nul() and remove util.rs
  gpu: nova-core: use CStr::from_bytes_until_nul() in elf64_section()

 drivers/gpu/nova-core/firmware/gsp.rs |  5 +----
 drivers/gpu/nova-core/gsp/commands.rs |  5 +++--
 drivers/gpu/nova-core/nova_core.rs    |  1 -
 drivers/gpu/nova-core/util.rs         | 16 ----------------
 4 files changed, 4 insertions(+), 23 deletions(-)
 delete mode 100644 drivers/gpu/nova-core/util.rs


base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249
prerequisite-patch-id: df9c0cfe56901c27064ac88972dffe3a4314c2f8
--
2.52.0

