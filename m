Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42DC9DD9E
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13810E71B;
	Wed,  3 Dec 2025 05:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GXm9MYNs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3810E717
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAt9aQw9nLB0HqXRH34Phg2WKbFgyrAnZ7w92Br51TifKoD3sI360oybfdCAeQvZoZib3Vi6A/1vD8GQtlcAbXjRd8MPSHlZm8LJO2uBYV42Mg8N75ie6vIy+Di48oaTlQ61Y4GF19af0rz5Y5gqYgIjwYbZcTToH+uS4jfd41AN6LBKPr9A5U+uxxnsIjqORdfvfhFyxovSQTbWdpeHQKBMeCqIn3J9Wi7AUtvw15I/OlyeHI56fEtfh/2xFs0R2eibVZRZsBcqE6lIhbOZd5q7A4xxDldXWlhpmpi6jpGfaKHMm91E+LisvRqrPR/uJkoCAY6gsx4wSrvS4Ck6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJallg96W4WHTt461KNd4CSqIPgFr6lCMdAQFPukRAs=;
 b=Bk2M1Ar5pfOfLU/eHswqsSNXLBi75PEhh62NQXsu5NnHxIY2VkAZPxoGF+AnELpnt+8NnQX8ZR/PTAY3/7FCfgMvyMKWtMmv8D9S0I6rcM6kTFx9LPhlMc3LEk991B8IwBDAgXJS3f/go2ff7aRk/e2oMTdg/Q0U6zT1zsOY4lYYy8RiB4RSAj2eYxd2U3L0MH6o7zCNHhmZjMxhOzJcxExakMFwOyLwgtF/GG19wNAiPMSkPM4rYutmhzEfuDueWp2YfOjGfP4xe64h8zTgRwqHPBnY1rEB8L233dvMijcyjEBmRS4LsenuKBBu9fRNPJn1dw5+jvbmfbgiFo/oNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJallg96W4WHTt461KNd4CSqIPgFr6lCMdAQFPukRAs=;
 b=GXm9MYNs382XbSAEzXfF5ZGBeZ+Kc99dtVqgOQExN1qqatygT/vRBRHjtaP2fXuF86+zoAGVcpkWBCKsWN/H0LrVW8rJMd7QtLESGKudZcwp0MBNA93rLH+Q+Uiu+femBKIvBI77ZgZy3FX0/chXLQQBi/2jdgfgRM0GUZJru7vOftLYDQ65x71WzXFelma3Idry3jXN1csLPdwX0seJV4WyHWTUzP3crbs3c6Ji9fQjg7UUd+2Jq7xpYoFQRJfHa4zCrfvq5F3+M/I3mWXlw3tP5bffpEzqQ7P3gaWbUki4PxSldy56tPQN+6tqiU54KY9qdcE9L+WUDXhSF9E/wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:52 +0000
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
Subject: [PATCH 18/31] gpu: nova-core: Hopper/Blackwell: add
 needs_large_reserved_mem()
Date: Tue,  2 Dec 2025 21:59:10 -0800
Message-ID: <20251203055923.1247681-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: aa902936-9208-491c-0c48-08de32312c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?piNa1pQiHhW18WvJvWgOnk0eOGeM6XWcdJEP20axF+d2XS2+XOutZiy2QEi6?=
 =?us-ascii?Q?litzH02Oj+jegve0Bwg2JsoxKKBy7+tICdC4vUDPJDDTEBj6rOXPYruzYMEe?=
 =?us-ascii?Q?oQeh2E2HHaOva8/mhEURx7jDe6mqu8+otwrM7FqmJ72A70adBbefN3p7byvK?=
 =?us-ascii?Q?hORN9N1BHKYE5HWTLVLi+IdIt4oj/q8c4xWe/VRVl8TYWcvXVMhaqrqsB13z?=
 =?us-ascii?Q?nGlQPh/s/o/4bL2pE0+YM8nZUk9bpEKANH79o8Zqo3E9T6ub6JI9r0O01Biq?=
 =?us-ascii?Q?a4sXulbO5m5y9UgFqc6nh9Yhh2wyrn1KPVJjOfQKEibcjx1QGkhb4XgmMJ8S?=
 =?us-ascii?Q?ZQ8GGIdn8qaEzoi7NwBaR1Pv+txFq/FxcbWpJM8ueWcCtfgQEhecEdq1ZrNn?=
 =?us-ascii?Q?sQ8Oz3jhiUMVLqVGjbSI9dK0kf6LEUo7vnr+1IZX1SZO6hH35p0/Jd6aRM5a?=
 =?us-ascii?Q?DDctsNiB7ffuroS0ZTNJOXV9xMTAX+BiswAG/yFE/Agb8/meq/zgwIvOQfBi?=
 =?us-ascii?Q?gnV8tjPQqGL/Aaa9pQCJM/TjZgataIlQIYIxQsmqmigK/qjezsn8h2E6MbgQ?=
 =?us-ascii?Q?OGkVMizGFzk2Ra6LMjUMJLLPIgc/1Ywwe7iBID6I4Q+GES/EgS7rhG+CGqA9?=
 =?us-ascii?Q?gdaCt2qd6lidzcBzlKPRFxrLCn6M3nyQHYjvxfruLJ2/FB4HXvP3HqToT20Z?=
 =?us-ascii?Q?l6KUXk3a2fboFNAOaUSWXAl0N1b7sGLyy/MQ47+SNBtgI/q8uB6x2O1HBdoB?=
 =?us-ascii?Q?20J3WSyDJdC/3LK2opyM06i0s/Fq9XqOR5STksuweVEhv9UEzvwWoDBg3lQh?=
 =?us-ascii?Q?44J2p1Pc7AbYN1BnF3j2WqRM6qlHyv33FElaYMi5+Rxvc8ThVyxBEEEagc6M?=
 =?us-ascii?Q?VK19Ju5vKW0uoO/hXBl9Nam7snm01MFiu/CRoW8I31CZRYe2FTRnwKvnsxQ8?=
 =?us-ascii?Q?ZlVzju2j8ZgR3O1UtNnjnPHPJmwZuDB/XR7DO9yBXMYjcsdNy6hzPYVTHFh6?=
 =?us-ascii?Q?h3jUxe99JQ68UmOM6pFpaxJZCY+6fcE8yCq/MnXNRXB+42wY0Vh6djnjJFMD?=
 =?us-ascii?Q?i3+9QlvYqDulvaiH1VzCDHRMld0FVeQevhM23DPXlUJU/IYQC001utpjAJFY?=
 =?us-ascii?Q?evdrPXvcy4Lm4JgK8sYcju2H21r1raBba9EsCddyay2Y+1ISf3fQFRdAAo9n?=
 =?us-ascii?Q?13xtJaph58brTAwYD925773uQfKTCwKN5ssCtb6adqEElEPAdqaX4dhXF5Y+?=
 =?us-ascii?Q?3mQBQt+KSYog3pNK2IUl5B17X0EZ4rgKZnmokWtKLNHaHRHbT00UZMtOU2xW?=
 =?us-ascii?Q?WoK7CRjrc31a22ImvhseTlnjfDsW3BbU9rOOAnsi4oRjOdTUh2h2PWzsIXGT?=
 =?us-ascii?Q?htCinv8TmhXgi28rqhIbWglm9EVguz4kbl2UkSmP4YAimojG3gS+mBl7N87Y?=
 =?us-ascii?Q?EUke4Z7aZJ/lm7eBcFw/yhiPoO0W69iP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xis0XxY4QI960Yu4RrZ2uugDSJgZT2aq3K+CpwuancxvnAD8p9jS74LFmNzV?=
 =?us-ascii?Q?mMY7l+nlTDoiYyLRUtbLKJDNwm6OMuNsG0FM/F8avlGSEDh2vC/F9F1knM9R?=
 =?us-ascii?Q?rmOByjM8R2dmSqZO9J8hyI6VV1FSrvuP4W0jVg4gat4Z8shzpqq25lq6LR1X?=
 =?us-ascii?Q?ZifglVRj9nT6gYzdi4spGiwvRvzDPSPSqnCLXpLDVwHJjn7IfgrM9IQQvl9B?=
 =?us-ascii?Q?A3L70i/sAdT9RzkRk3mvlPgyBqLbmePAVlpbdz+kzuXocvX29EFXG3E5nMvv?=
 =?us-ascii?Q?QjkpBz4QERwNVAknDaN8MbjlhocNGjijK4qFiafcg22BlvO88/RPr0Ab4udP?=
 =?us-ascii?Q?IIfTpyIT5zBLC2SBo1Ma0Plku+a4muGvPH+cFfFRnEMwMoX0sBAkQpkaSKjo?=
 =?us-ascii?Q?tR/a92GpSl9eILl8t6ABHC5YhFMiukE1h5Oiz/8WzODUwZ65Yq0ujiWc6r6A?=
 =?us-ascii?Q?bg6bWd++HPMof/75pIayPglO8c8MZel6VdRulysN4Oxe/jjJRYe/vCzpJljy?=
 =?us-ascii?Q?txDvPh9c8QXN9wgHvTbkS+gX6kPeCx7IPYvA8hlESDCNWsoPTphx2xwNXPeZ?=
 =?us-ascii?Q?KOCyzUJgK4x0NXbtyUkvW3QlfKexUUwbLf/IExPtjroIovbWsgekzDvqC7xp?=
 =?us-ascii?Q?q03rpDdwtM6F05AGlgtqPkrWLRWbCz0Gi8hoON16VaDokeOhP0bbiXll2lFK?=
 =?us-ascii?Q?iQYV9FdFgShcu5EVYj04l3CGk2ULgo7Q5ATY61T/EiZrFLynvw+7Ybv+ZyQn?=
 =?us-ascii?Q?j635jxTx4h3DMxlwpdKd6Am6GQedqFeqPmx4IcSqRO4H4ueSfBa+O7uHM+0/?=
 =?us-ascii?Q?p2nchUrTllzTPxmgsZIY4Pitj0Z5DTQ+TnKxc9QF6YLg13HbndOew9H7KfIm?=
 =?us-ascii?Q?DRVQ0iy7VV45a3kcN5IN801ngmvEqpMZ35ZmkpGMmq8DH7pZKjvJVUBCHBpk?=
 =?us-ascii?Q?7XUw1JFOKGnPogQBGdEjkewZn3ybK9ixdBjTE/s9plb6J/NT3FUDMr/KIquQ?=
 =?us-ascii?Q?hzEUPPVLNwzoizl7GvB0aoaizPAs3KI4NJEVvxxX+6Iepcj8M6USAf6KRgsz?=
 =?us-ascii?Q?5GbkyuU456/+OYusYm5N9+8f1S8ktOsM4Qi9Mu+qPEz84fy4s2ZKez3VRfRL?=
 =?us-ascii?Q?pIk2vD0c74BQJZl4i1mqlZBu9R6kbEat7YgRJ3s+8Dgi3M0B3xdh5hIsAIDj?=
 =?us-ascii?Q?LpC1RrOZrVEvqO/SbTjVcgrFQa+CQnnYRZzW3M2wQQOimG7C9mJLWmx4Tkpf?=
 =?us-ascii?Q?XmPV/d+IzllEdT2Hq9PzWhMJb5I4k3JakSF+zoo34jZsReL+oNrKXursI5gN?=
 =?us-ascii?Q?5Se09ud+9VMxuV8lOAbtEpXVAmBgyEz+Gffgj5raEObObrby3vgLbgUdnOUk?=
 =?us-ascii?Q?cr75KCiQnroe7BZ2GZYKX1z9tzAJ3atV4ipeQJkX5mAQN3f0s0Sj4P13yCkA?=
 =?us-ascii?Q?Hg8bmjeZEMcCWQXPZhwsuDI6WhSq+V7cKjWrTiA9X63G3ZLYUjtsmZGafoE8?=
 =?us-ascii?Q?7NVrSqcbIL0q2fvTMnBfhdwah0O+lQX7mjyf4G+M9w11DuEo1upWF3taG4U0?=
 =?us-ascii?Q?5cFTDXcZuW57LH1N2D1THUjYI6ezM7nM+ePXFQMm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa902936-9208-491c-0c48-08de32312c34
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:51.1203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yg5gbf9tQecKsJ58ZYeWEse7C71d5n5wjtagOgNCr7I37PW5VPo7a8MKTq2yLTke0V8tQQXSg5IDZOlkZ5oOCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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

Hopper, Blackwell and later need to reserve more memory than previous
GPUs did.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 624bbc2a54e8..c0473ef8ac47 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -123,6 +123,11 @@ pub(crate) const fn arch(&self) -> Architecture {
             | Self::GB207 => Architecture::Blackwell,
         }
     }
+
+    #[expect(dead_code)]
+    pub(crate) fn needs_large_reserved_mem(&self) -> bool {
+        matches!(self.arch(), Architecture::Hopper | Architecture::Blackwell)
+    }
 }
 
 // TODO
-- 
2.52.0

