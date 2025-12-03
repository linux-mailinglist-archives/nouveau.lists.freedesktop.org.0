Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94908C9DD71
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4056F10E0E3;
	Wed,  3 Dec 2025 05:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jqd3YtZE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2B410E70E
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2ZOvDZjA+EH+JmGHeCfm5KS0vCrHjDdkkOVlnDhZoyyoVL0gy3ceZWj2iYm9KKSvAYsv9xpgWedtNxRg/ISqkOxqcO+YYqG8pxed0pPlizY338T9Z+91BguqcKkigPFSw3HP4/FHr9dsRP0N64eAPBXa8ud3fdK8RQk9D6mpFCBcjK0X1xZS/aKVnSH5h7Xw2BCX87+nryHaPo5NbWFzK3GDsSLrdvGsYKLwL+mwpITHKGWKMQPjOiArtIw4DTocv2i1hPxp3SYgOuaKk6CwXB7AxVa5o84kwJ5JbJHdK3tFTLC3pqhx45Lp55WexEaVnbBZjdyWyB7uJMliXzZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeK9DGKlp6BnHYdfvS5MibxiBQ6NWE1f+Q4CUyaSG2o=;
 b=Ex5ikoeKRmbjarsM4dgMk1OOKLTXGeXPfcI6pakweNAF+i8K2fKLPlczciPbch1WQ0a2pCjfwnIETSGpXFExjvyX8AIjoijSxsk6Ufv5yN6DobDxvMhWp56XJARV4PxlPgSfNe+I5IcAO2xUtZS5pH5nl3JxxTwXY6wXX4gXj9afky3Q/v2anRaZKVRTXFQqXdJ30NvjGsL5b5qJdNTbhi/628izk0v06CMp/Usnpzqv8Qel3jCBZd5QrJ9JY0D0/IALU1DKMBvhbtNshCrOGLgyJF9oNCVC9AfiJ/8cvypr2D73r3tKwtgxT4MsVtCfxvoexZij/sevCSvrm4gOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeK9DGKlp6BnHYdfvS5MibxiBQ6NWE1f+Q4CUyaSG2o=;
 b=jqd3YtZE0hrkAGlT19XBw87O/BEZZ9951/Iwz/Rkjo1bqhX+5e8E8uKVnTwG8JLLjdiccc8j6smrYgVqZiBqxQrN0+1BoZ7vfnhuH8LLZm5eLRIe59q3YNreiCx3qxMqfkfnz/uPX9o+7qm8dMIPcZCNYfKm/lmjjhqutPiDucVd0OawZzFJhltCweCZVp3hKODwJMmEg2zylFSRlHkH02fZbH5qoL2a/0Dk+JiX2NYcOYLC4zRDR1zFe/2iewkEhOS+OPssXMZXswbkvUppKiEKjgl2287j0FXfVSE2zIP5mn4ZuE8SQB77F33JcNZLcauVrVbTrNyWvm297bsuug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:33 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:33 +0000
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
Subject: [PATCH 06/31] gpu: nova-core: apply the one "use" item per line
 policy to commands.rs
Date: Tue,  2 Dec 2025 21:58:58 -0800
Message-ID: <20251203055923.1247681-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c473121-8632-4a6b-0244-08de32312167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5FfzTMyl9P31LklCftAN0YjDMUbwr51VgaWxV4qrFnMQtgC5mg8/resREBTX?=
 =?us-ascii?Q?99dgPKHLYo28Lq4SOK3MYb/qM1m1jgWDiTHTDEnpiRPs+DEy3ehXb3JQkwTk?=
 =?us-ascii?Q?J+K5KKcs1JKsd5rJl6e8Ca2P0kLpZ80x+8JfDD+1gZTfYDksrcIMPwV22Vrx?=
 =?us-ascii?Q?HRADQRBECT7j2fdX9tOgYrn9sW2JyDUv/4LMolNlltOQvPfcC92Z+zVY5Klk?=
 =?us-ascii?Q?kQBXgQCaGV5gQAYCm0xOyf9t5fNGIe94UiB8O2nqw/hJhTcHgmayfcnca6vv?=
 =?us-ascii?Q?expWdIoFo9EF8IIQwor2eyCSZFgG3ndoeUGSkxYe92dm1Rob7/8yAePZPU8s?=
 =?us-ascii?Q?T1xS5mRVRpBD+tMD9ssMwiC/1weCrV/HcGmorIqOEo5D9n7C2OLqOubZmavE?=
 =?us-ascii?Q?bzz509I2hw+JuNQT/j7t4FhJjX9PrvcqemCR9NHpEzqVzTCBQySsl62oLE96?=
 =?us-ascii?Q?mQZOsEOby4dRK0Hoq1IN/q5dv/MmMukT3UnhhY8tv931Yfc22NzWFEudNfS+?=
 =?us-ascii?Q?263QL2UD/yM2sn94aMxZZoL6mtnrkJh/yEBXlnMSHtU8GCVzQylhHTy3RXY7?=
 =?us-ascii?Q?XFucjCe57ixV3UAOv47L88A/3N3IviZ9DvI1YpggnT3wUFyWI78tHa+cK7bc?=
 =?us-ascii?Q?9bumpVogR/DvNVH7iKQk0DHlrWfeVeuDsClV+aEVcUaGHPJiCjOVaXGE4cow?=
 =?us-ascii?Q?IOiEG1mq0TLXqojoWhcCSEa8tgjlRhZ8ZO/vBxBg/Xax/cu9/FVtHgKH53wC?=
 =?us-ascii?Q?tsGlw70g6Rmr859g+lLNrLHgKXmtTtAOV3Q/aXWEri/F7Th5FD2x4BUY4QJ0?=
 =?us-ascii?Q?LGn2eQvG8K/Pe7eGGLdxHN7j4EtKUaXvQNY6WdVkhONcY4cWRgJwdE+7/bb1?=
 =?us-ascii?Q?aiTm1wDuhIuBhOz4yPd2OTnW/7SA5PSYqZ+l4A3jowkJ7kIFhjCSJR+x3rdo?=
 =?us-ascii?Q?2CJo0rWmTdL4EleFSKwwdFUIRlvMGF+F+T0gKkh7wo3vl5FSDuepnr3eMTYe?=
 =?us-ascii?Q?0Y5+U3JOASQuxsvGOzc/pswDaaY9SbykvmwvGxU9MG/RnGoaSaOSvQ+P3KDy?=
 =?us-ascii?Q?tPjrX/qFUk3ixeEbjfBEXOizECpD8TVOklOnawkr/3cS7rLVrKSBaX6EP//F?=
 =?us-ascii?Q?3RGB9LwOAHRGDAUNbwydIswLHUQMqf6xX8OI2C+nGV8u7eK6sVJCUdCvloyC?=
 =?us-ascii?Q?LHPvrt+XB4GSNLOSGee7b3WpJJpty/qRE/vp9tCv0r/RzoximhWUtLYb7SOv?=
 =?us-ascii?Q?tEp7HNv/G2JkDSzp9I9+6t40WNWfLmPMnvbgfHgBq2U5QmUDTqYh1HpqaWzc?=
 =?us-ascii?Q?6hv2XB74Y0k6VG+S8QLtFPukoU2JUoK3HuIwuPOlJ362OgTsqPSu5rSnE+be?=
 =?us-ascii?Q?BxqFFcLZH6f+bLmlh9If0hFTyZ8qBjP8KRmgmNVAyG7nfoa5MKEwPTNWQP58?=
 =?us-ascii?Q?h7gp4fO8n6glVgYifUXzOx6/E4JvIkZp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NFAvZbcGFKpfkr5XmKt1yjzVaLVX+41UvHfHGKo+qfL7hS7twM/6c9E0j3CP?=
 =?us-ascii?Q?QMgmyA1c7cMf4P7RxGnkdJtPd+eK1gm2xHXP3XAN6u8na1sym+2/FmFBQBWW?=
 =?us-ascii?Q?VCBQbW9emntOUNh/pnkeLYuZm6RRooEhOC6MFw7g7xJNkijZLHdmL6lcGbzc?=
 =?us-ascii?Q?yWidfwaDLUAxAlfBz45l9NEbb4jTXFZK3MLiJr2EEVLdjTKaozrVnLob7p9N?=
 =?us-ascii?Q?Hq2sCUCunY48w3QtOLPHQ3AxipzgoBWLqOkpfdP9LXsEiTU+hqUDiuVUvRoc?=
 =?us-ascii?Q?A8uq7RakqmAhh5h4MhaTjSvGFbAa00kkmOAq/l3wxcwGMdrOy9jy2i1qAeIf?=
 =?us-ascii?Q?fwCXPYMprczJBjxb3Ifrp3yQ1L2qfOr+lEPb/+lC4Hpu2rF5ZiJahpoDpB9L?=
 =?us-ascii?Q?W1YCg8g5wwmmgvwuirE5Rm+eHPbMVZ8pxmR+U1wgy9oSvoQR5tDdtL1J8pvl?=
 =?us-ascii?Q?Rsn36mCh+4ei+W9emTM2ZkO2mY/AvvBC256gWyo6X8SCnEuf5YVjYwJnwsqF?=
 =?us-ascii?Q?sEh2RqMJ6z6LR0MArA8mG+IkfRWg5+G+SHMjhrD5Qx3O9+pE/+9hEY4dTJ6R?=
 =?us-ascii?Q?Ca00j8/TPH9QoLcAlfOvEO96xvCuh81gzpJM1BEDnEqTHS1VFRRE3aJFdA6n?=
 =?us-ascii?Q?nbSMkBq0nQ+3HDH6nWevkpb/6hekoDhqv7UbJCNOxHJ3kNJI6lR5oqJK2pRp?=
 =?us-ascii?Q?7YGqCga4vrc23sLT+uexgaHyuSw4E0Ow/4M4MRF4Wvg5aUVeWxCc+2S2xNe4?=
 =?us-ascii?Q?6tML2FcOOUQNI5m/x2+27lTqzrZvWhba/Zgq9o6EhawSt4DBpQCpZd8SCDOS?=
 =?us-ascii?Q?yVEHUyVfPFz+0KVilRwabr15UR+TzwxEShsKOvdmSv7GiotrRfqfJAj9Evhr?=
 =?us-ascii?Q?lRwrIAwMbsY4z+pVuwVhwI/KwvkwANxaChNP2ecnK0oK/O8y1ZFsIRcXJdgS?=
 =?us-ascii?Q?/eVH7Sdf3YzhL42PgD7GnDSoFkdbpSkFUbsadBR3yu9BHHJVldus1wzU/26S?=
 =?us-ascii?Q?TvjA5X5q00F7x2X0nunazmB7yzzy8vR2kGhHbmmJHzUAcOIledWpR5Xa7SLE?=
 =?us-ascii?Q?rywVym+i+Po5GYpYoE1Cw4gAFKlUVDKtRjz2i2mTG30j+9vWwHG41Tn0ep9b?=
 =?us-ascii?Q?bfwe1UmThcnMyGJ0+2TwCwvbcZ4XDmEiSEYBcA9HkALs2Edh6t/x/1xA8XPO?=
 =?us-ascii?Q?7nGq4hoTwu0Yt8jb0/PlhxqLvqwjt377pBbenzq5QSNGyaWvI55xSKtnBQNG?=
 =?us-ascii?Q?i1DKrMeApl2HzWbxPJtcLen3sKKDoK3SjbyToHaAGcg9cBFM+seOpDbczEyQ?=
 =?us-ascii?Q?JUjEODJRYI8jcSC9KVz/xZlEEeRndi7m91arNLgVjSVr0QwSNnJemCGKR6KV?=
 =?us-ascii?Q?/K1sPUdj4QgCRUdmUDCh740Ot4POxLcj126X0cnmp14dlCwSPOCwifaJ0Hx7?=
 =?us-ascii?Q?FC/53iI5GFhxQjQPkHDf1eQ4COPxXvX3ym2MDXEuYPL4Yte4OV+TZlKO7P47?=
 =?us-ascii?Q?KnSkViLQw4CM7uBvaAxy7NP7AHgefFfJhFPeSbSaGLDO1Ik0pTqb4NQ4eR6A?=
 =?us-ascii?Q?+h0FFzZJIDYCPXSEzTgZ6Z7tvy4WCEj8lbAxrpkB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c473121-8632-4a6b-0244-08de32312167
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:33.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWY0KPlOjn3zLlLnO8gnvS7S/YyllPPslj+i01uBpN1yEUO0j+duJb4fAIqvrC8+cymSN+xQEVjFl8T8cokF3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

As per [1], we need one "use" item per line, in order to reduce merge
conflicts. Furthermore, we need a trailing ", //" in order to tell
rustfmt(1) to leave it alone.

This does that for commands.rs, which is the only file in nova-core that
has any remaining instances of the old style.

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..470d8edb62ff 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -1,8 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
-use kernel::transmute::{AsBytes, FromBytes};
-use kernel::{device, pci};
+use kernel::{
+    device,
+    pci,
+    prelude::*,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
+};
 
 use crate::gsp::GSP_PAGE_SIZE;
 
-- 
2.52.0

