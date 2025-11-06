Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE38C39069
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 04:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6894B10E334;
	Thu,  6 Nov 2025 03:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YzXG7iVN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B81710E312
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 03:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKMlU7bz5NI5EJI0uU7Yxg4JwxVoF1bB1VGPvV1/wOfUD6H54Btjvb0FmU84ECWBf8qiUHMnF6pplvXK2PXuTtL0GNhl4Wl846O2JSXfV+1k3CzoaISLZwb2eznvPTLGtxJzGnO5tVcUwfrqf4p3ysb6m48oRWwyeTOEw50V+ovZYLQE2hsutDivn1FK389epU/V32uMEeJiK5I5iinZDEGyFZ7Mxd8KngbuJtntepbxNIac/xQy62kti4KWdFeNy0k489bYAOXaveX3t1kDI35j2K/yMn+FYCwiQoxfw5GGXxiY/xMmEHc61ewkc85dE6HX5QiVY3g89Edvt0gPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsoBdgCzbheLXfW8zYxWRiRXpA8nHTIGkCrl/7/Hnk4=;
 b=ikV5YrZr6kPnn6K6wHYVKO/cHtLWFuJ4HjpSft+CCYrqs1OIIgY/fTxsu/UG2FupKJ2NdCd/bIyM5R5B4FAZe3suHsLxTcbotYEJjevOIK6o2YCAoRmRgPbJGmc8pGAHsVF204sL+t+QRcGBleAyqwKxOf0a6b96LhISePW4fca4a6sjJSqxHk7Ap1xmBrKjfzUqosOznGCsDTv3E44mzilmsnZgiDyb54yBlmdm/Yz+smQbs4VXvv3gEtjNPwyKn3HD7KbGMDw5Pyv8WNL2+5HczcxjZokgBzwYv2If4j5c5E5vBDhWuNBUbfewtJeYSF92xV/xTeCNrG831zhURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsoBdgCzbheLXfW8zYxWRiRXpA8nHTIGkCrl/7/Hnk4=;
 b=YzXG7iVN8Qm5MUqCzkRAmiu39635IYyaMpE1p+TeMG0F1lEnuLkcgcpLGgxj8RjyQfkkoprvRAP4uKyDQMSIeS5y0u3y+np0CoJfPwBCaNjRAEMB/mCMjyGvhsXF6xTpk5pzBNqu3N45vARV1HZV/sifP0aMs188eZJ8Gd2YNhbzmsYNluIPAW4pC1aOb/hWvHfvhvnGrfo2Y1m4NKxDXC4eBN9Bt4ZKnJ/8JjtB6uAqEIelcPUQq6cOhXdGH7y2JVFEPAGBLN6N63ZeDV4kyXLfndI/vNnW3RsLQER8XIDowb7Va15YFaLSyOh9zFJG2whNUCWG7ycs1W/0vbrnEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 03:54:38 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:54:38 +0000
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
Subject: [PATCH 0/6] gpu: nova-core: Hopper/Blackwell prerequisites
Date: Wed,  5 Nov 2025 19:54:29 -0800
Message-ID: <20251106035435.619949-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 351ac62c-b9c7-44a1-7bcf-08de1ce834f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Kh7/n5bJOvxMwYXb/3FuxG+w4mb5I8/zEvlCqm2P19N0L1aYUirUVCtkJXR?=
 =?us-ascii?Q?2SPWwPnHQxoO+3oa4Dq+vvjY4IOnzjqBS/WFG0cDoz5ky1CwdWJLLC7WqsRS?=
 =?us-ascii?Q?386UIB49e7xSEIa0dIUj18dFDoww/lkHIKJqEbPHqZKue0NnaRBFvGY1SUcP?=
 =?us-ascii?Q?YV8FDI2zRWcK3dT+8vo+wkolWSkAse9qchLvAxLhf61VbMXlOKD/xPgrWtWq?=
 =?us-ascii?Q?oOYG74sJSasbIpN/ov7pj8xcVck59pI9VJ5ylgH8ev51KTulri59g9L+pRv2?=
 =?us-ascii?Q?LDfPNFdpLEHnoHBF+wfgsv8tBVd4u0/M1B87pxBF6R1YEdzEzVlbtkyI8pTH?=
 =?us-ascii?Q?A0wPqkBW+9DrscOzwYBpsxzVeAZj93udusiDAs2QYxJngqLZOu0PVcUfJu+r?=
 =?us-ascii?Q?9V0lSHH04NMLHfvt8txzcPE94SB3YiR2oeBoPw75/GfhMutjPwH73qaDoMQv?=
 =?us-ascii?Q?YXuwGbLsgZrNN7fiIJ+XQ9Lypko2bYBfNgx7vgGfiVLWdC28R9BuxZWM8nSQ?=
 =?us-ascii?Q?74VvSjhyxxzhX+A20EVt9Ww8ZVjjrSR7dlv8KHWsJwZhN0BiJqRKerAddCCn?=
 =?us-ascii?Q?1amo0r1c2z9sR0znXzv8nEzqvDoVIPo0lSxsoVOcHhk5apJmKI4cs53oa+QL?=
 =?us-ascii?Q?IKX6M/d856qZTiOYvtCfCOREp8/oo84l4jiFzzPiQ6q0+oxClubkkcJmCGFe?=
 =?us-ascii?Q?pgHVZK+Ylsdqc/hFDBXxatSEDk1AxTGkXBIUq4MniLbelervRWnQeyDQrV4R?=
 =?us-ascii?Q?94ukWiex6/tKhOYkseaVnn2m7UsVpNPJRGL9ASyMFgkO9Zs+BfTA1sQjaU3a?=
 =?us-ascii?Q?mXyjl9e6f/yLTjf2YRKQB93twK0rX9UY7lmF0V9MEkgXvcURGV43bP5EFw8f?=
 =?us-ascii?Q?N3pBxlwEVs0h8B9HJdQkSGK4gdkraDvblq6yTrH7F8IkMitgrpr1/Sqsyrcq?=
 =?us-ascii?Q?HG53ILDaUipbHBGFe3zuthXBUe+rRGpqMYgNss9DR8cHSUKIN5586VZuO9Yg?=
 =?us-ascii?Q?wmWBLrTIK4wm74J9txQKmqD6FJ2M6Oo0IBZ4B6Fis90S425WzC5NzNm+OGmb?=
 =?us-ascii?Q?diZGr8jIoD/o6E/8EQWXOqB8F6IhuX/KJCJrsaQFls33BdrYsgFZEYX3JMeu?=
 =?us-ascii?Q?p6h+6eL8qqWhsfRcK7n+5Dz4NLMxbE6Ngon4k98U3NQCmMRsdgSlV9DcFHfk?=
 =?us-ascii?Q?rlKXKoOkKtOce57gnJ83ROB+bIDg7HxjdBAIzkdYf7MPazVZR04XmaY49RRm?=
 =?us-ascii?Q?AA0vuV42UJvvj5TqasuvFJx8oAY9eamyxzu01VjbpYtkpX24EeJiMtQ7iA4X?=
 =?us-ascii?Q?wtxNHV8SZq4XF4/UlVdBBV+2ihl3BFBw8JsRUGFJbO93euZf8YPnYlIwj8IJ?=
 =?us-ascii?Q?Mdk5L9f6MwTCbAjQQVy9M2rPqGzXW/R5XWJ6+21SktbguKH87bXanrcldWW3?=
 =?us-ascii?Q?BstprEYXi3mVNijXqL5lGEmxtaHkuLCr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbH2dLKqbDKF8n0Mylb7oP8WncqS9rH1oAVC9mWsZrlhbNNwcjsqKhNIVSQA?=
 =?us-ascii?Q?Cul8cr81PzvsD2GTvEyA/XD6XqHSWsHY7I3SV8q4QHe4S/Nq7/ClDxf0XYgA?=
 =?us-ascii?Q?nMjhC4J4iYiVWz6D98hQoeVBb8we/TtjjdXCtPNNZNqQx9KjcMT7pf4MKq+/?=
 =?us-ascii?Q?XvcHCtizGIiYPd2BS08b4IM9h7N/moj5qfZ9NbaxOgajI2XA0Vfbi72LRYAz?=
 =?us-ascii?Q?Ahua3b1wHRbL0sOhkB/5AE4XSgHjdgT7vPQiJbASkShjmOpXKwMCBnPcheuZ?=
 =?us-ascii?Q?li6xgrnew/nB9lQEPgB5e/5bjFQv8gURuIQJCKMFP9H732hbs5D2IH6Zysxe?=
 =?us-ascii?Q?7GOZOMoXwVAhuic/tYLAs3cGRyO/NOwfJImrOz/gNEt+IciXlphF+bpmoY6p?=
 =?us-ascii?Q?0EXILj249uzrGKp5QVhtcjx5A7MIkmy0JBjZqsPqyOJBLvRJ3y9dHfs3/liy?=
 =?us-ascii?Q?zLAokWSQfQMJ0dXyVtchwTwIbokUfSrjeX3ES9Lxw4yUtnlkAWHybYwTXymb?=
 =?us-ascii?Q?eqdMnkRFrfP27akpVrp+illPqpkH8V/qEsFZ/hSkoP9kjfL9arpzPSfrbA72?=
 =?us-ascii?Q?T2I45cPPDYEk4BKpc+byLJu9zwtPRvfK0JJKREGpGrkNe4PhTi6/T0a94a/s?=
 =?us-ascii?Q?odACagm4mIffs8AiPaSmeQ235VbQ0/e6eX1O8wiG/QET06YPUb9RGudoRhvP?=
 =?us-ascii?Q?KbSHtn+HxNTmUDGBY+Bb0IjQqylOEwh04q2XJkhOTwlYB64JHnhc9Ln8MVc3?=
 =?us-ascii?Q?cMjQVk4JmlKmgddBOby32JuJE1eEPfXMjWaR89rlv1Lop1EP78h67zTO6uXr?=
 =?us-ascii?Q?R0q15ZuaJS4qCQHAKkHa/3MMea5GR5YNhVZ6jSRZZrzq5Xgu8BD/uQV8Ffzt?=
 =?us-ascii?Q?HvFvpVIrVdAjKdwrCeanGutFvHRCdT9LxggzB6NbGlc1hEVq5QfInu4S0LEO?=
 =?us-ascii?Q?4hNSpekrorrtJPHb975839MLFI7Epp13zQbk7wZTFjITOQRNVJPX8Ygrag1i?=
 =?us-ascii?Q?OTUO/kyGH/2wU8ZCwfELOh1cHS7ILVsQIl7yYzFcA4h5COodm2ftWLMQYCWE?=
 =?us-ascii?Q?EsOmKkbl4W8BjZr8HmrncTfjLNHX+euHHbDPa0hhVKpCzovuOtZn5/gCH7nh?=
 =?us-ascii?Q?luhDHRxNyzDX8A6gxjOAdqK2nzqIVlJ/qcQzbfHwmJf220wuQiltqH5xFq0m?=
 =?us-ascii?Q?WAgpuRJSHj5n+c8pma5oDGLaKsPwUsBJRbUpISVX0bkXdqIVKoVvqhFKSyVk?=
 =?us-ascii?Q?PY/ReEvfISiNi6oWTYTNY9zIecf0oYWvym9VrLc+N2SzTev6huiD13+VXUw5?=
 =?us-ascii?Q?cIsx8AJeKGwpdmZaatLgDslH37Bi7D1Rf2OX/VxbUUnPCStubbJHDh2hL7SL?=
 =?us-ascii?Q?4i4R5HrONx5F5J+eQHHP/hN8i3kOcoReKilG9Q86/FaF3JWp1hY23Mvo7ZAo?=
 =?us-ascii?Q?FtSnLFznn9RWzdD9hHA0KdMPfk28t2C5UAUnoELV6JDvzJdRXicKw3s2zmWe?=
 =?us-ascii?Q?ZNO3EeJvCo62vWQJNZC6IMYDOb9rlY+bn3ihIFDnGyXiBGPf6Bg1MwGgQHUM?=
 =?us-ascii?Q?TWYVvGL/XlNv7mX2LnpIkKZYlwLPm/iKy1l9/+js?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351ac62c-b9c7-44a1-7bcf-08de1ce834f3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:54:38.1126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BR/iMl5mfW0d5u49wirOhJaLIv5VXrUzM50k0s+VQ90f+ziAPSTjvuXWqt0onz5pmiCHL1GmS8cVgOgdbtnDAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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

I've based these Hopper/Blackwell prerequisites on top of Joel's and
Alex's changes, and also on top of my recent boot0/boot42 changes.

This makes it easier for both Timur Tabi to post his Turing support
(which he's about ready to do), and for me to post the actual
Hopper/Blackwell support, without generating conflicts.

Testing: This works as expected on Ampere and Blackwell (bare metal),
on my local test machine.

Here's a working branch, with my patches, if you would like to apply
locally:

    https://github.com/johnhubbard/linux/tree/nova-core-blackwell-prereqs-v0

John Hubbard (6):
  gpu: nova-core: print FB sizes, along with ranges
  gpu: nova-core: Hopper: basic GPU identification
  gpu: nova-core: Blackwell: basic GPU identification
  gpu: nova-core: factor .fwsignature* selection into a new
    get_gsp_sigs_section()
  gpu: nova-core: regs.rs: clean up chipset(), architecture()
  gpu: nova-core: use gpu::Architecture instead of long lists of GPUs

 drivers/gpu/nova-core/falcon/hal.rs   | 14 ++++++++----
 drivers/gpu/nova-core/fb.rs           | 33 ++++++++++++++++++++++++++-
 drivers/gpu/nova-core/fb/hal.rs       | 19 +++++++++------
 drivers/gpu/nova-core/firmware/gsp.rs | 30 ++++++++++++++++++++----
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
 drivers/gpu/nova-core/regs.rs         | 29 +++++++++++------------
 7 files changed, 115 insertions(+), 34 deletions(-)


base-commit: 7f6c212713e07e714bdf29d1158e21c3965917f2
-- 
2.51.2

