Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C3FC08817
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 03:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5775E10EB4C;
	Sat, 25 Oct 2025 01:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dklM0uaX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE40F10EB4A
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 01:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+yZg8WDxV50O4fmVsMVo9xSSX33iW3VuW/SuN+dkmBlYYvd68Hz5OtAaW9Qs2sHDNzkjHKSyLubYp/2Vht2q1JIRTEweFCa0AKLXmxF1rrSwHjnbOXFslVikZjM6bDA1bP4keengwem6Brp60s8I6VBYGJjThCDUR/1OXxDXYfLTYvV/UoYhwruP0koPKp19WyR7meqd1yO5O5rQHF21L0mnlri6/GT3NwvQJUhewal4+m28fPLpcpjMpkruPr2reKKjnwPTEzheCO/X07Jse5zVGF2I2mpdxqCSH4nO3ZEx0n58mSArgfsQe9o76dHxf3xQ8Pb6pobX5hN+Scdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsUrS+Cdg/S2OXj8ecsWuZwSmHrHIWgkS0+DvrE1f3k=;
 b=dJLgMLpjfk/GAtTh2VXWg+qS1vv/1KFtsQs++IR67vTWfd67sruFLCNHRkgb7cRst1uS6x8TfOemuYYhPeVArG3LzxBge59EIj/5DCbhIdq7q01UfFLAi0vA+sngBPZnHxWu82H/Yz/+nCshBurOLCiINBSFcycwa5dHCNaJr1yCPNPQB3pRNLCGjiwOLAVP7zudhbTFl3Q2LNANjU+Pab8+2DaBKaLgOZlrpXYz7akHEf50KoRiQvHEhbIGPYjgtWipoOWzl3FoqPKKvsLH8Kt2LRHOSrZZoW6ID6UUWCDGb1hKNaTg4+6XNA7WKbc+2tghbrSNPKVxxm01JfbZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsUrS+Cdg/S2OXj8ecsWuZwSmHrHIWgkS0+DvrE1f3k=;
 b=dklM0uaX24PorKyigSvLjklMlzT0PZr2iQdycU1MYkqJwnYvqSb6xNl+Fh5yxVB5FeAEQE22iJH9G2fp6NM0pat+6xTkcq6pmTHVuqfF3WnDo3VXugVeiNTkbCicd2vAGX4QI4TP4PTpwZyDLY95QxfRzf08mqqdLKLvyOVqZBJGxDc7QJ/vkNIgJyWIG9AKPfAErQnOY+9RYDa5b/96OuK38mLqeXjxjS9++qPQFAEOeOCylSMnQEemsYXb1gQmMeBBIk5MkgIQBY2ixooE8tieQ8Rtw7MVuXK4l106Kj/8cPIF2aiiFFUQwYg5vRn36VweCqJp1SPxR5Sr7EtkSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 01:40:52 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 01:40:52 +0000
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
Subject: [PATCH 1/2] nova-core: remove an unnecessary register read: HWCFG1
Date: Fri, 24 Oct 2025 18:40:49 -0700
Message-ID: <20251025014050.585153-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025014050.585153-1-jhubbard@nvidia.com>
References: <20251025014050.585153-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: e8205ffb-9596-4d30-bfa8-08de1367886b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sdU2xXHtIzw9QlkfWFQO/q4Vifun6UB6IhoojtFZ8OP5f/Sx1cCpnFBgeFY/?=
 =?us-ascii?Q?2UhefjLv61iQHxNuyOZQoKsg/iOB7Zb+HuPY2Uabljnc62GknKFN7Cdq1bCZ?=
 =?us-ascii?Q?wjOIhnP6+x/vQ7zTufoEfPvS/bqiib6/nNdyOko4W2AOEHVjhzUKIVDaP90P?=
 =?us-ascii?Q?LdMqzTWMRZh8C2QdsUH//ghJIyAhcnbaHk3mXmQ3ceCgKwnmUSGrRGlPH6Ko?=
 =?us-ascii?Q?HTYR8UO0owFpCw9UnQqabMc/dsbzI+lopKm0k55uVYZPNHGE2jD/LAOh+7yu?=
 =?us-ascii?Q?gTWLedeGwLkjb3DnRbrKWMR25XMDxPlSBHRmSQIhH2JAMRvx8MiaZbUnXVin?=
 =?us-ascii?Q?OwIy2Gc19xoUFziDX4LUGydFeGmrMl71PG4+A8GfYXPLLKcmTWhOJKKYtWl0?=
 =?us-ascii?Q?CVoAhsojPTxvGGTWK34pmDYnXTKe4pNQq5vnl8AbNv4P8PZxItoFrM1AcnFw?=
 =?us-ascii?Q?+bGXhe3fR7L5I8t28uIgP23Q9v/w7VnR0oETdjRhQexPh6UkhgrdI2dvGn3c?=
 =?us-ascii?Q?kvxxtD8yeHECIwcWfTVas5sM4Jo11mZTH+RM0bCybhJP9d6zkOOJ0FI+AdED?=
 =?us-ascii?Q?ZyMVrNJWlqb2y3xSIZcxp5uoE8wsyqUzRTRCg7hcAscvmoSK1ftcpQclxcRO?=
 =?us-ascii?Q?EuUibUUn2PRxkyzr6ijIwXOYs0odDfHtaKMoHp/1Je47HxsbXqLuk0J+6A/e?=
 =?us-ascii?Q?7tFohJIGBRR8Cuw9MCutGw6MhKRHE3pG6gsVG34SE0K+oUJe01XGNgtfpw9u?=
 =?us-ascii?Q?tsY/gXDKm8WeEo4uqTbgip1XCdp2Ar3/lf9CkPdYvNEvJIYheR3LZ1VujE/C?=
 =?us-ascii?Q?BNqhaTTK+D8TeOlAAAVxPcupAl76Rx9O6BlNuQH5J02NRuS3j6O50v98qPwz?=
 =?us-ascii?Q?3VOzi4xDcPT3asO/F3EmfLKJziSIPgKLxmhoSm1aAxv440jk4QsYGrFKTmwg?=
 =?us-ascii?Q?sh89A3hGV34286mPqhhtFus6vSz0WKUfAdgRdhFZlPAeGWJk62QMEoVEV6ZP?=
 =?us-ascii?Q?jKqcX/soDv1wW303Avoqcka2v3C0iWLwFavy0LGDx4XoIi1tu1diSFcecRUe?=
 =?us-ascii?Q?eyt1xZzM2uejXdCRk7g2EIMVrpdPoeSwFhGPQCYw1t4CbiozZOk5OlNxoSJH?=
 =?us-ascii?Q?CJc7nP76/psf5XsQPXCWbEnGkaFeH9odYTXz5YfXvUGsb0iQgDc11f52Diuo?=
 =?us-ascii?Q?EAJzglFqNZwQkCz9LCPaThreY/OOO1xFCvY3lHy9hwvYbT8eQz1pBvABWn+m?=
 =?us-ascii?Q?OvEbuoaoGEQzRjECO1oVkKoZ7cLn8qoghWbeqZL8r6J9UwiUXABVCVXVaeiX?=
 =?us-ascii?Q?zNy9Q3oYqz0EYAcWue6VGdEUA8oM6AWcdNkRx7T2IaDBrEMzh4T+3nvSqAoN?=
 =?us-ascii?Q?b9Ffnd04zQu1z+ajdB0kP+/pdM46HnuQ8xJj6OYP78HeHgbAoH7dsv7nazbt?=
 =?us-ascii?Q?TxiXHK2NO5ghezODqHxFaHVy5xno8CTb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YfRv6+ksG8ZKteIAaNhqIsbF7LGZ0snAYTipaTSP6+LRi98YZV2f0QiamAMc?=
 =?us-ascii?Q?z8mZhZNKU/81PhCAx7KwNbxXaWeIOk4Au6HQIesdOHZQakK8jtMJdU0PENef?=
 =?us-ascii?Q?UwiPH54kx4JrZaPVuEcuF/LRFwOQWhssTyctjM8Rt4+ZIzgU362evon1bEeR?=
 =?us-ascii?Q?12ugBKuQo0VSV7liobUIzpaUad9rq+qpy5XH3Zs2iqCgr/8VqNFviYWAD6sD?=
 =?us-ascii?Q?zarSWM2V9++L5Js7lsz4LVNosB8U1OigCLlKpD+4e0GjhA/iWkZ0hwJCPmRF?=
 =?us-ascii?Q?HsyL01GkGPH5eMuH6d66hVISvP9LmJ7/ws6nXZO+w66cBkrjtq7UnFnmg+t6?=
 =?us-ascii?Q?xLYNTAOCO5dc4zWzHJ7KVMkk6HYij2dUeoyyH8rnhNS6OGpNOeo5MnbCLi7F?=
 =?us-ascii?Q?pYejnnV0JaT1utxjovUgGsUfRcXZVhCOW4caPlqQf0eo8of52nMBEAHoVc7P?=
 =?us-ascii?Q?ucwhmphnkXqNVGJfXU8DLfZvSuhyBwqfaTiqrUIIt6RcKiPc+Y+7pgN2inMm?=
 =?us-ascii?Q?6ikxKT5oT8NTHMV6yEQ1Rc5mgEK/WrryTq5wi6p25mhBtLNp1cyrqUfGjLIn?=
 =?us-ascii?Q?HaQBOB4zD/br3xG7VQ6Wi4WWTQkTeudDHX6Bwsb7O22piAj79CT94cYvlW7P?=
 =?us-ascii?Q?/xBYPSumdzppRUWOPvoPYX2di1V7XTjzFeyU4Ffp5FjaYVtrEZStv1B/6W57?=
 =?us-ascii?Q?8zb3d6fzZvgnV6d6vS069+D4wZWP9Yh4y/ws6CPHbdNiKa4GDjG3CSg7lhlB?=
 =?us-ascii?Q?4aYfbpLe0x1DZPbyPTOJjlzHl41XwxZuDBmqi5j9PUm1Mr9rXDZ4LmHQHIls?=
 =?us-ascii?Q?p2LOsT633XKXzr1Bi8JWyj0/3x6jySxDN4CfAOMqAP2OQhXK1BPTg7g1PVwU?=
 =?us-ascii?Q?Ztbdo8mMiHxiI3vQNB9M+U6No+ZUEOcqKU7HKqi2T91EAqHBTCfZx9vFF9xj?=
 =?us-ascii?Q?WjrFoskQLywmGLwMOA6UuDhGAIrxVeQHkK0q6wWopLGsI8c49Jr2IC+QrFp1?=
 =?us-ascii?Q?U69VFiZBbYvFdKiM3jOAW3WDN0bzbLGVmxMSh4j3n8mquqx80l7zcP66J7yK?=
 =?us-ascii?Q?agOf5KBY+NXox92ot/cGCUskAE4d0a8+CmH/qzzt6hYalE5My888aYxo4gRB?=
 =?us-ascii?Q?OTmd4MwGDUIHqYK0QUofj4LL2VrLHZRTCV0g57oJ32IS9wNGIVmH7yFFpDV4?=
 =?us-ascii?Q?kk3aV8fnqBPRfyQ87UNd8hmIcfS4w4HquGkBoWFVdePAH/kLHByu0V9m3kng?=
 =?us-ascii?Q?hyDqsrI2lt4R9d5H1aQmzFRxF5J4cwLttcPTyoBmVMG3tLUXb1LsXOpApxhy?=
 =?us-ascii?Q?9B1pCuxI3vHoYQdPK24FTwASVL4VkDo5aUsqdtYSdql0y/2XRRhi66NeKRwU?=
 =?us-ascii?Q?sB2J8TMJ58YIvKfxCY+MpfqDjn23RTj0F9rzOS6IKoZoeOUlt9eTrhqe3YpR?=
 =?us-ascii?Q?gTqWdIFVxX9HJGTHqHZeKxQsnASU/isCk4b+PAP8NOC1BR7lOAEwS3Mj8bEw?=
 =?us-ascii?Q?E8vXDJ0FW7YY08k5ZizwC5ZSbiBY19p+6PyrwdzsSGkUeBSpCDHns2NOAITs?=
 =?us-ascii?Q?wJSZGTGsWASxmXuRyCfPmTShT+QKu77P0lhmsEAT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8205ffb-9596-4d30-bfa8-08de1367886b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 01:40:52.5583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KG6DypLE7MeRjw6kxoR7gPZJYvEdWGKuoxB0hbnLvk+ZzxepnC/j7O6JmBkaKWjfye7n+KkbLX7kuQlAWsxnNw==
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

This register read is not required in order to bring up any of the GPUs,
and it is read too early on Hopper/Blackwell+ GPUs anyway. So just stop
doing this.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 3f505b870601..ac55cbc5ac1e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -371,11 +371,6 @@ pub(crate) fn new(
         bar: &Bar0,
         need_riscv: bool,
     ) -> Result<Self> {
-        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, &E::ID);
-        // Check that the revision and security model contain valid values.
-        let _ = hwcfg1.core_rev()?;
-        let _ = hwcfg1.security_model()?;
-
         if need_riscv {
             let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
             if !hwcfg2.riscv() {
-- 
2.51.1

