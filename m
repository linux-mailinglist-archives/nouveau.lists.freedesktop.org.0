Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5933C12ADA
	for <lists+nouveau@lfdr.de>; Tue, 28 Oct 2025 03:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34EC10E1D0;
	Tue, 28 Oct 2025 02:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OgW8GVGb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474BB10E1C5
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 02:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mw+kXtwrG9SpHNTCr+OSpaSGs+0rvn1xiMpfNYl31t14R/wiCXJTzvlcgflmaWp2+rviCNwiwThsIggo8Q7z7uuyFxmt0Vw5p36PmCLqsFmx08YDb+BdrhnZmBciKINL3LC2DwY5CRsC16xfZjMq9qu2gKrIu0bvTMG3W8s7OPCvgHbAryy4lQkchbzkvWMbbrrLAZeml897P+CXc6lto28PP+/tRyymn7L6beM311ApeE3Ft1xK59kItU1apdoK+V32ei7gxnvnNjN+NgMWa1jCGPG+Fe4YLVAheMUxfNYSK0DBs6+tqeDCO4+0zzSVFfn2XHp+oNji0jGuo8Ro/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkDhMVY6K9A04IvNJECmd5MxvvDfrOUrwJzFlPppTyo=;
 b=OUmugMNzGC4Wx2P+sXiKww7xPmmQqF6NnxwHG4rvSCEPzkj9mrHznHtHIdAAmhRsK4bKwIaC/fWeRRmhopz3LmcJlqSwthxDnTkJ252u3wZOop7G6PN8bRrtVOIJmurrwNPOWF5byazzzszvYai7VLk11BSpGxafRYJcCQQlAIoiYleKbbeV0vLij5Jdawk13OTTXxjVueSfwp2NnQBD4ivGMIYzx4kXh8CY6BmSFp4cLRnCNQdRcz4uGD7YZJY6c1WYWjz9cu7lda6dQ2rwQgKUQIWNN+iPGZRGh2dXNsi2gRHSDOOvUiX3UdPk5fRMQhcL23+cBRG9WlP0dQKmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkDhMVY6K9A04IvNJECmd5MxvvDfrOUrwJzFlPppTyo=;
 b=OgW8GVGbjpRIK/avmMDFvjQi0ikjyqBp7v0zv91DW+BlfN+TO8+vAKEQgUE6LvCAPXrI9kWAiKhW6IHEH1Re2F2+akEZbHyugW6Y4bN9FliOi249FDP73uLXW2II8DfDVxIyTXwr9ztKCNPSzbXFmgzKj2k5Jsq5YVRWo3xh9EUFk8g0VOFbRcu+WOoJ/b+/ngOuTZuTx8EGC21mjJi2cS1P/mObx3oYrpzpFjkZB8rMF9BR0hi23TnMyhbgJRYO/Fub0h+Sa61MgDotyDLqhAFzhCs66Pj8+bkCygzqJi9e5S4ECaECaDPn0QPfDOpjt2bP61CDQnahgRR+hMim/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS7PR12MB8346.namprd12.prod.outlook.com (2603:10b6:8:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 02:39:39 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 02:39:39 +0000
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
Subject: [PATCH v2 0/2] gpu: nova: add boot42 support for next-gen GPUs
Date: Mon, 27 Oct 2025 19:39:35 -0700
Message-ID: <20251028023937.1313108-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0154.namprd05.prod.outlook.com
 (2603:10b6:a03:339::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS7PR12MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 3832fb42-a32b-4a70-5d9f-08de15cb3dbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s3HcAx55h6GD7eNy1GfAaauJanO1/UfLgcv8L6vWy34oZkWyOSC+woaVOVCk?=
 =?us-ascii?Q?aJ1qTSUE35jiEVwjfgDN4hfXwYyS2oGsbcBMJ7+dOlUkXEC0nWOXKunjAf24?=
 =?us-ascii?Q?VaGhYqiDA4FANf8mwPJJQB6spqHVmx3sFZRReEG1OvgpepzEHvBWVyrLiXMH?=
 =?us-ascii?Q?PPMEhxNzpCMN/bBZlvJQJcQzoG/sIXzlGW28Qa0jAZaG0lC27zqrr2JWmBzK?=
 =?us-ascii?Q?GOoOlcAwvhZuxtnfVSbduAnGHfVGzNYGb7kJyLpFsQkASExCiHc3udQRn0ki?=
 =?us-ascii?Q?fzZdgVyJw4rVcYkwkpkEb3lp8747zy8k7Wse5s3CVohBMN9BWb3mKXD6DV3w?=
 =?us-ascii?Q?ARfCIFpVbU/lI8UAjSwQQi8KVK4znYlXH7yihcIxQyCrAMQ6CHnn8hHdCHTe?=
 =?us-ascii?Q?NdsZZqZboySPWjrlIi//66RuYaDw9BCs70QO+mpPqpavsKno4CvkwKZWdc81?=
 =?us-ascii?Q?ItRMWhS78MJqCiN/b/0Ewnxb6WWjBk5vznoE3RXjbdxZxpX1uTbuxkTiNY0u?=
 =?us-ascii?Q?fefNCwybc32/YIyuFMfDuqnMl3eY3RXdxpD6RAfSaeS/tUXmPnPG5wCiEeyE?=
 =?us-ascii?Q?EwcRufOFRhM1qpTM3J5hakGh3DZhncFHp6QVQ9RVkHWfDMsKOejxe/FGS40F?=
 =?us-ascii?Q?78rrwRK3v8aKTUpZVg10I2UrPpS4enCOrYTjG8NXOvwuf/Gxe7MLbr6GTF73?=
 =?us-ascii?Q?KIFo8yoiWqw2NHzzDqevDPJkag0PDSqCdaRpSBkVRNLupdUOtdPmM3YqXjE7?=
 =?us-ascii?Q?xM6LRgt+boY/Lh+51x9uU9Lv82meTY+fvXuGX6YZekKs0+Yq1IJVYtXv58oW?=
 =?us-ascii?Q?wydn0aQapWHzRe49cj3Rait/ke6vXTFQjr9lwFtTpGqEsQemKEJ3Vt2yxnxC?=
 =?us-ascii?Q?OSlSs5M1EMLEWmE+bUq7xz5LQpLy50Wa+nf6+0kDyRm1hq+rYH4Z8mfW8X4O?=
 =?us-ascii?Q?zWVX2vwn1/Dy9JkmOlqUNtRMDCSY8kcB1yQbXm0QriXgEwhmRyK8qp2D5bbc?=
 =?us-ascii?Q?vJ39j8WCBe9gIQQ6W7Vd1Cgv1I7b5wcyhXmLgzVMm90yk3x07brulNHAU78e?=
 =?us-ascii?Q?UqnpwO8NBGaz5u6AF510RlVVrhWsDuLzzF938egVU2RFf7rMZu0UZ4MLf5Lk?=
 =?us-ascii?Q?keRYYZ3rxXLxCoUU809mJcgJLVdRrvy1xJt2wbwA40KoINNsK+9BAFqBpDHr?=
 =?us-ascii?Q?axn2C2piSSIsknkYK63T2gK/bT1gjzEygsqONA3b8qIspb6O13dq5lGugg3Z?=
 =?us-ascii?Q?ZBkxl/LbqH2vRNZat4IQc7VkaUT4SA8jxfZyFTDWzyX2zJCBL/zgLPL1RVbQ?=
 =?us-ascii?Q?/EwXHUfktmxoWWpX1MiC+7gXGTWSa+9++EmynHkL+LO1jux1oETUn5OGrwJI?=
 =?us-ascii?Q?j2cuS37UmikX3AvLWPhBazaQasYcSiEBqbf7jxn0a6F/gq0uPNO/nwIWPEfC?=
 =?us-ascii?Q?sH8HGGW2uoSzDHpFvMeGM2ZovskwnBAT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EpAxmhS9+L2MQIFc0ThuBA5axJb9AAldCSDPFF0zM1IXHNo3olw5rr9uv/YE?=
 =?us-ascii?Q?1QT0QsIurzbkOz0iZPJ1kxstG4TQUviim3zPoEL+RqxG9zSfv0kpmOTMLfrh?=
 =?us-ascii?Q?VvITHElJMTbcUi7f2LvhYXEKpbrGqZaaTx7aauoa3Ye1r+HyaeVZ31wDswKG?=
 =?us-ascii?Q?r2gY0p0XKoR8+tUOLEaQbwCFFQcMNSUwiTLMsQaD5RbirT5Oyc5juMoGv/n7?=
 =?us-ascii?Q?tL5POxi8wHrlU3xfYqhPk27DQVKRcRUniZZqDnhN0tInuu4R3kEOgRH6iRRa?=
 =?us-ascii?Q?ciDVwur92teVCKlsIL/EaI3rXNOERn3YhLOsqTb3yKPe7D72iw3PtJh1ann3?=
 =?us-ascii?Q?u3772711I9D+yh9h5aI2e7JxY+ezjLsgdlUn7zwD5sk65qbCCcxnbr+cDHVp?=
 =?us-ascii?Q?M/ZHvLpPhQh6zkt4yIIYQJ73t7uo6P9mMJAt0k8Jgu3zWTkQgUUTn+9uQ5Dp?=
 =?us-ascii?Q?crjguGCmw072lyMz+btGvn9bbAttLKYW5CrUsQpW3nR2qp+WXfKegmak1MuQ?=
 =?us-ascii?Q?iZo27mVJ75pXtPaTTMNYZQ3b+a2hrVhDQzhUK5apyACY3KWbAhpQ/Om259/U?=
 =?us-ascii?Q?HWcvGTarqbeiM8yIrGv71J2S67OisTHUm8fDaZR3CfHw8Ndaenhz8U1shsGN?=
 =?us-ascii?Q?IYSK7P4rpjDuH8vetVgmJrh57+MYS7683qjUIM0w6IgtZH6cxR+lvwrXiB5G?=
 =?us-ascii?Q?ri5grQZzyAuLQRM9sJxfOKb16jC+groeXvyFDHROelhYh37A2rd6a0dP8tzt?=
 =?us-ascii?Q?Zl4ZampAhsXoxQp77lh6lIsX2SnziJUi3JXCpDO8SX6aYVKk8VzF+ZMcG9nO?=
 =?us-ascii?Q?KTOeNBh/qJlZbXjVA2UG8TFOyJ8/a+CfDQZhPwviPCzuIGduO0rY9Vf58VrL?=
 =?us-ascii?Q?hiOl2WvLXsr1mkfTa53s/PyWgXAgd25LPj6SLKjQcMA8/OFoYEI6c5rUkvC7?=
 =?us-ascii?Q?c2ao4SI1ywrJZ1MZkP5AQlMbXPuKuJgPOgHVEWNbxWJLAsFW0bahD//KIk0v?=
 =?us-ascii?Q?H8/hjlLgf+Y4p+nwIwnIOO3bpwSz6pBhXp3c2GezCyy1svuOlTpDuQVcHwR2?=
 =?us-ascii?Q?IaH1MZkHe6wEaJ45uJrZaCIpyGYc5vXtqyS8URWxf2DK3YSko3Lr2mF9tP8g?=
 =?us-ascii?Q?CAmGpGsRBVYxuKv93nL0a/j9gl7nemxoyWb9FKVv7Ba9I5BRLgy2bxIBQzo6?=
 =?us-ascii?Q?YA9+susvckyWBxM9yoZsNQ/9+Xn8CD4R935GQEMUHff4VQtZFWpUPlFBR5Oh?=
 =?us-ascii?Q?G7yXBGHbZ296GRxTrbKYUxmHZRS+XR/+1ySEa5jRXYFX43aQW3pbWPh2l6IP?=
 =?us-ascii?Q?djlgsAFG6PcfoYLAbZ9H0Eq4tyia/56ECgT2bh2yc9F4zgxGTKSPM7bprTgL?=
 =?us-ascii?Q?EJzIfEPSjLwXtdkyRIPpbM8Y2HoBfb2fYg5CYyHQtPAQA7VmU0Conr/Z5FhK?=
 =?us-ascii?Q?HqSISQAOZBWsfCD2XXL8S0z216oll/QgMxCzUOcsOElJ/QOuBo+Sn7jQr8Jl?=
 =?us-ascii?Q?IMsmi5GfHG+0e1OLHLl+ko1oPkSHyhKAZYWUuc0JacP9vilZAT51a9PCaxCw?=
 =?us-ascii?Q?7NCgqzmJ93A4djpKytHyoZwQU+UTRdUf2tDHKm/F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3832fb42-a32b-4a70-5d9f-08de15cb3dbc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 02:39:39.4781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGgX5f/VLdnHiORLoEM/BsYXsJDvKYYP4X3iwZXAK3LvM9dg4HVjV/q0W2zeSmXdRWbRYjcJF71lmNATvUYJXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8346
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

Changes in v2:

1) Restored the Spec type, and used that to encapsulate the subsequent
   boot42 enhancements. Thanks to Danilo Krummrich's feedback for that
   improvement.

v1 cover letter:

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

Also, remove the Revision type, because Revision is no longer valuable
as a stand-alone type, because we only ever want the full information
that Spec provides.

This is based on today's drm-rust-next, which in turn is based on
Linux 6.18-rc2.

John Hubbard (2):
  gpu: nova-core: merge the Revision type into the Spec type
  gpu: nova-core: add boot42 support for next-gen GPUs

 drivers/gpu/nova-core/gpu.rs  | 104 +++++++++++++++++++++++-----------
 drivers/gpu/nova-core/regs.rs |  27 +++++++++
 2 files changed, 99 insertions(+), 32 deletions(-)


base-commit: ca16b15e78f4dee1631c0a68693f5e7d9b3bb3ec
-- 
2.51.1

