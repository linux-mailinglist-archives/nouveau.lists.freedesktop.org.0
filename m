Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50BC08814
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 03:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D34D10EB4B;
	Sat, 25 Oct 2025 01:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lISDOntx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B2A10EB4A
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 01:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emR0BiLQYfUn7TBaUqf9p8UVsOFxJIehzMfGcsJvlo1bsC84MdJDyolUDpBT1RygQbyb2gxjMe78Cdzpbzt/A9i0KkqMplFq1/DN4dvzjF1ARkSA4+jK5Pfe0bvzJnAkbPFNXGTbMvmzmpTYOFt7twHFBxFxCQbkcYGAxkudCclxsIMiaUIqdsR2jFpFryBO2+cRSm0TGtrPuzRrUBHYRnVAByfNCeDL1tRD0qJsvw/s99S+0HG9/SBKZr2A5sR6kY6uQcbpEK2xu0Umo5Ih+JtpcL2I726+3F+hXkBlsklp2E0YIW0vFBqM/HSK8zm4NfhpoibNqIh+vlzf1iNnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A48b3DXKvbvfpIm87SDO4bY3fzIv1mpE7PV8bRKTWLE=;
 b=LbJPbpE9JdW08YGNapElFEiBGD0YLejgre/+IuUXc9IZRMIm0JYHaEQovOPt7BE8O3rNiQYjbPw0Gap3RtdiiviQcxbHZODW35TQt7wXeRvwnqp54zgmeXdh74RMbBAkEmAykREDl8nayfRAJqHC9HnU8J2sJIK2sNipzpUZJWL2ujjTuFj5pCp3zhMNxyrCTugbTLwuaG4FeRcYOHyvmXwjfHhGXnq4bvRroNo/q8kc5wPndNYtNVMxer7dDnMDN4jm5tJ+E9maguJpMcTENnu9fQsM+/jCyZnE7J0uDebfXDR76uA83WPI/Q33S95IXZ7NToaGJjA9nCGG4madCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A48b3DXKvbvfpIm87SDO4bY3fzIv1mpE7PV8bRKTWLE=;
 b=lISDOntxXaV8R8LfkhNc65Wv1J7C2kQy7HBqg/fs0olbu4szE5o2OxKftZcfN8ujoTuaydiJy+xoDZQP/y777rXczo6+80GETZJEYABheJYII6ljOUz2QrqUmFoREneRLenjMbJEl20wAXqXFPvt39GCTg3HV2rNuaDltLKFck2Ue64rKkc2cGKhMxqQdH98N3rW/n5QW0ssOsz725V1VR/JJYwXM/9lkTDtwBV1XYnWTpCqzmhDNIHIIr1+PxPc7zchOzQUT+hkltk2uNEbjb+YymrXzqcC53GQxKyhLacRl5nv4DSAk+LB3Z8St1jckOTEukkSGgP3R5+mvu72cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 01:40:51 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 01:40:51 +0000
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
Subject: [PATCH 0/2] nova-core: remove HWCFG1 and need_riscv
Date: Fri, 24 Oct 2025 18:40:48 -0700
Message-ID: <20251025014050.585153-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 25456deb-066a-41d5-00de-08de136787e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mfdaAeU8fP04YAY0FKKWqV6ZMDVIdAE/XuTEJ8DidI12DzMnIPurvNSktSg0?=
 =?us-ascii?Q?aqOFACssgGKVNtZFYqzA2d01nd/2mneAwifNQnM63ApZr5/zvEKSj+0838Cx?=
 =?us-ascii?Q?Dxa7B4yzXchBnP62FKMm2XY0pZx9Sm/IPPfy6rwuzfcR847aAflprr+xeGjy?=
 =?us-ascii?Q?e5OqaXLW8x7pwkcSZy0m9+gG1cSterEIveaQ/aazVH8e27rNiQJhnMnSnnEi?=
 =?us-ascii?Q?MPhw0H+jzpt4P7/v50AVVgMyJUguVpstXelGKgON9X1qgOenUHlHfZwzLcKD?=
 =?us-ascii?Q?RPpuQqjNvwhYDBSrRSF47wt6x61IPWHiXuEH+tzAch+uZJhzaW//eSBVRcbg?=
 =?us-ascii?Q?SzNq36RwQke98+D+XkcPahjzoPq/Rgac542m8lyvkxWxGB1prvkw3+IBwdGT?=
 =?us-ascii?Q?aR/C7fvIpU5rnmLdhBKq8DjQ9jTdBnEjJvgkLSqyFvYnVJbKaGkSLvW5KmbV?=
 =?us-ascii?Q?XQzoOH8seNBrFvRBqlzjs/U7z5UFZYw3fLfM35dAPvXoSZTYj9cpXkY8tYWn?=
 =?us-ascii?Q?dg0LHkIC3hjKNJnxi/OnqUsGPrggx3cDCoa6WCq4+h/hp9DaM+xE8Y1X4c6O?=
 =?us-ascii?Q?SrgByBI/sPTx1n6/vE7tx0tRxQQnP7LgJu8yMryZZhSB5/24olr7UJfsnfIC?=
 =?us-ascii?Q?f8AWVEzPZ381gcmo6h5ZnS3dTFn2xgjMNh2imDDJZ8amobdwyx5ehFN9heZQ?=
 =?us-ascii?Q?U/aUrxkUfvY7oAjKHDj+Buk60/zRFQXlOkJHFSRovDqMCgipH0Q0RLErklkb?=
 =?us-ascii?Q?si17oWqYqsOxozhaNX2FW1nQt1eWPiB3zdpGDKw/igfqnJ5xgUqquOJA273o?=
 =?us-ascii?Q?jpjJju1+6WVoo2HlMgkvEnpqh1sLHh9GRisFLtGf/uvu0CZQOuz1dFQXe7cK?=
 =?us-ascii?Q?cEha/7AmScJk9X7XLl/NTqfcvETKAvv/jkmzb5VcJfYt2TL5cV1xR2REA/c9?=
 =?us-ascii?Q?yuylalvdjm5nUf05PwShaUBd7R73ioHnfyHnjab9u2EyqqYXOqZ0WGOPYYz+?=
 =?us-ascii?Q?g0vrON2VXl1kurGiEYPFhYD1SWyD55MvcaJltA0gRtpbmgldjzwYcDEeZvwF?=
 =?us-ascii?Q?mq2BFUlWp4JgbnhvYG9+gSs9OYmGNJw0X7bRcY7c0XkxEJVyHQTvEJJ2o6FQ?=
 =?us-ascii?Q?jOS6ex4BUMY6zgjwO3pwQLxgptiW4RZM/CEgl4xTN+bOnOI7jruz49oNFpJa?=
 =?us-ascii?Q?YWOO9kNl4lJEQbpb6aZkYeT8cmbQCzdYU4bc610fX2mTh+A+4C9AAj4NRwVV?=
 =?us-ascii?Q?s9dcXN/kk7blCDGFDBPFneIt2z8zl3o2BkPL5sMguAcaxLUUOAXNUW38uI7p?=
 =?us-ascii?Q?l/aBI6UN/4/a8i/8GCb7X9XIvN4vyUgVSbRCseG/b0V5ty98UcHPg4ZG9ID8?=
 =?us-ascii?Q?eKRc0tFeodV+p2TQH3L6phJDpqA2LNPe+5s57GSaQEkOt0EEkkUzL6Ck+QL6?=
 =?us-ascii?Q?tJ07tsalyv+wYdoqEhDautRiS5PiQSZ+c7AxrEFJQHyeYJgG7EWMEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E+3jh0KHhXGg1UcaiUCemIu89EIwC0Mtc7ljFDRUyQS6d9Mw6V8liPdLShCT?=
 =?us-ascii?Q?qAEClrLvd3/mQhwO/eptZAqhLmxn5NcDE7+kqBaAiLu2qWNI/GbrCT/q8HJ0?=
 =?us-ascii?Q?72xoUSsZZNzUFWTjJwH5CQM0PMhJz9vTS5ISwEvzq/ksdtHmHfZVmPImjDQx?=
 =?us-ascii?Q?BLj5P67VWtxHw0PzA6fSR/HffiqsiMUR0GTaIdK28afrzdau/jQ9Zju9sn8i?=
 =?us-ascii?Q?/pWMr/jpjTnPtgnHkbN6VZgF/gxHW3KnLXq+BHHtIFWIugl5gdRy2x8h5bS/?=
 =?us-ascii?Q?z4HJsEjTmAIEsN8uznm4Sn9oViB5hAbs6p9RulilrZfahbQKK/iVzymkaKm2?=
 =?us-ascii?Q?quXmTB1jgP7SSiVniyrgeU+hrMP69aVZpBIK3n/7CM8ABPXl85t5rgv76Opv?=
 =?us-ascii?Q?RkgW8LbQq9UozY5Jt/uxDvHlBNCCVT2w1NymcJlR41Oem5dsxQVVZGrV+qak?=
 =?us-ascii?Q?4RwrojzsUOLYg/R8g6+1q3I9m1UsiWUQBTGfHR7uoS1S+6vdlRyNQZInQIkv?=
 =?us-ascii?Q?zAHEpWk3ugj6Kx0dllPRgrIBmvS4GYlHLY/IK6ieIAlW4qFAP73HU2yGxwbc?=
 =?us-ascii?Q?PjlktP1t1pwitLOyyLpW0GbFcdr2NL3a5YrdV+Y0wy1d71ybeYD6tf/MUpWW?=
 =?us-ascii?Q?u1nxDYo4eTIdiq3u+2nW0RZYFKsiONOY1EF+Iynkn4XAaTCqu1+PAVAmw1Ld?=
 =?us-ascii?Q?7QaU4gqL7LQGnzxxqadA4bN9DF7UL4uQQrOP1rR+NFYS7ZrTMuJvZ/pSnavA?=
 =?us-ascii?Q?U1D0pxqXTlrQxYMzVoJBJC2ubfq4obMQBi2mFq+hYXOqyHYp1QsRA4Diwy/7?=
 =?us-ascii?Q?IMprjFLzoUJlGvz1fVy/E10vGlkGMmKoSxvK35PqTiqsofbd0CNDOFxYb4kS?=
 =?us-ascii?Q?/L8OWp/gIaPfVIO76Q7c5gZSn5Ew+hrsZDowafr503sUL+w4VojICI4Z3vMw?=
 =?us-ascii?Q?prTcpPYLdCxlD0mu23jMwWs8f6rdPSdltjuEHj2jGgcC99y3i0X4A9/AFB4W?=
 =?us-ascii?Q?mQsrKHUp4iIweC5zHfXmRJU6n+q7+h+U4BcSNPfZc6RbP6f2TNYlHrGXfkLB?=
 =?us-ascii?Q?ub1T5gHEF2mr0oH+Cu9EgOEebwdLi7BPM9bBYal8V/CqvK8xBAFL1B37i3rV?=
 =?us-ascii?Q?CmQnSyhfr5xWWDtuBn6BUX6wPx/xkU7NnLLZqSKFk28hsUYTmHp4yEz8HZaQ?=
 =?us-ascii?Q?MQGWySQVAif278oWq9kTObx7SzRnrXvtRZOxWJSsB7Nb5ggU/g1sFJY2hIjM?=
 =?us-ascii?Q?OWRvIEsUHs5CN5osJMzYLm8reU+BhRycsqAfqblBVGs8M5LiDrRDqzqeoP5q?=
 =?us-ascii?Q?FwD8XUwf+cAbewNxgh4CiNh+iWATBart+9u+/mAzRmKNmxjdx/NY/MFmjICH?=
 =?us-ascii?Q?J493QplbrSid5vLYfW4QAK8tRqXabrsncobBVWGhx33d9tH5pcccPYa0Oiz6?=
 =?us-ascii?Q?lF+oHVkNLbG6FBXuKv5Y9PB3ZNnsn3EZyHBTl+tOaFnpnbQlsyBwmVr87EFE?=
 =?us-ascii?Q?Dmm33P04BYcN2WOScm0vKuSC+QxM17XALKeLi877i8FlNUrDx4hGAHhTGOhW?=
 =?us-ascii?Q?qR3dh6i/BlalBQcezrAILupEtacdPnaIIlHoXXx4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25456deb-066a-41d5-00de-08de136787e4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 01:40:51.7071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Up04eFLaIDSUqJazDp6KMGmORzlfMLTdYaNO9L+RHwK5vTJCukU2IW5Rfb6vcS/du3qDPjg9ia85l61I5Io3Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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

The second patch builds upon the first one. The series applies cleanly
to today's drm-rust-next.

The first patch is identical to what I sent out as a single patch just
now in [1], because I forgot at the time that they should go together as a
tiny patchset.

[1] https://lore.kernel.org/20251025012409.577596-1-jhubbard@nvidia.com

John Hubbard (2):
  nova-core: remove an unnecessary register read: HWCFG1
  nova-core: remove unnecessary need_riscv, bar parameters

 drivers/gpu/nova-core/falcon.rs | 26 +-------------------------
 drivers/gpu/nova-core/gpu.rs    |  4 +---
 2 files changed, 2 insertions(+), 28 deletions(-)


base-commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f
-- 
2.51.1

