Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D5492AD4E
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B862B10E45A;
	Tue,  9 Jul 2024 00:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SJWWofif";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D958A10E456
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwRv59MEM78rXIHO++4AXvfAYPzPdPpELzLKgsQPbXaqtIkiAmpfdZMMADaenmCbp9CW9V6re7m81SB2r/OsFpj0eqp7K8zaXW4SctOvozyQaQ6ciH0iKYhV0nTM0rnuf9bkzGSWHlf8PzdsXeOlOZl5ZyK4hbNEPqI309qFkCatSA5EMuFx2O/MbX4iK3vFqnNF/SvJ5rzPTzZXFa2nCjE080LycnvfRuBiAjCepMaYmgnNWatjQC3TWOvsSJaEAu1HQXcB883Mj3yEHsLv/WsKdxWkUEKNuTg0IxkVDwBs8m3FbBJ3mzTqVjFVOINHNmN6VSZRa6FaqTPvxi56ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZw1+qb6esgfGnsiAauzgT6IIZ2aK2fmWoMaEuviZ5U=;
 b=HDc9zv+HRK+vd/XTM/kUAAjqd8aVNPa8ZIsjbK1VeKPc4MgbDP8p+bk8qeS4jJjt57i+chhE7ZzA+SjbZsWidJ2aLufXt0j1JP7O7J4Dne8FUsVzQOjMUxS/XSLZ2JJ/bzqjHULI5tZIblIFOUc9OP6FW0Dadg9yrG4go5usbrMGZAEmOeWFPRXME50Yc2S3Pr8qUMSWFwdDyt+KooX0O+yu0kMKS6X2RdoBnPkGuSAWk432o3QHO9phXEmt6LexlOsBLeic/Lajf/NpRL+HIlsmB4z0TTrA9WPJ2NSVU+BvyVhMdRh1WCK0vM+6GPCx9eHqvLlojHQSVmd1bdaRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZw1+qb6esgfGnsiAauzgT6IIZ2aK2fmWoMaEuviZ5U=;
 b=SJWWofifNY7098J25UWKY0VgLoJ+XjsEl+BZ+jQDmUcJg27a8rYcENQRYfDUA/P7uVM5cGOlrURVcIi1nJMQLKNvMLtIBhXOdI04fihAJqDoIUsMXtxRu7eBpYxwwsnTurWH1+UtsH6/fhORz8Zg2VgITsvvhmXbrHH/qEJhi5+r0fMt81W80GPDxbpI/7HIBaR4GJ7SLgVaKs5LCRU5pdLYpaJ3CWVNI2TAN6jF+iiVpiywRhJzi/gyl1CAix120wmHsE1gbqKkeqJ0ny2K1dFMqKVjcWCCe6k+KYBOigY6PdIVWj/MmBK2xAreqeD0EOS5oj3d+/Zyebrh0jaaJA==
Received: from BN9PR03CA0076.namprd03.prod.outlook.com (2603:10b6:408:fc::21)
 by SN7PR12MB7024.namprd12.prod.outlook.com (2603:10b6:806:26e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Tue, 9 Jul
 2024 00:55:08 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::5e) by BN9PR03CA0076.outlook.office365.com
 (2603:10b6:408:fc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:01 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 10/37] drm/nouveau: remove abi16->handles
Date: Fri, 5 Jul 2024 04:36:54 +1000
Message-ID: <20240704183721.25778-11-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SN7PR12MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: d02edb23-9a92-4165-3ca2-08dc9fb1c773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sLmYmJGfUDHQd6YiW1Truzsjnpmz0P+dHEeFIdu+mDSBOXLnAFDIFFrM/EuM?=
 =?us-ascii?Q?0j/C8R5gySsVjwPqL6C9p/+F2325/6zTWcSlZvjSK1fRqIUUnH1z2IfKEcKi?=
 =?us-ascii?Q?w37KKWASmR5ktUYc5zC361Lu7h7162l3O1JttaYVQ0tI2Yq2NI1rrLoKyup8?=
 =?us-ascii?Q?cG0yb7YJJcHC6T61Zw0a/fJuGGgK7uZD7R3CSwRXJ+/hfVAB/K/VBHs0lnsW?=
 =?us-ascii?Q?9vm8bi6xQnIqj96Lnz3f1f2rLEJUXSEP5yKv9KDcnosA99KUA6Lz51MIk4WJ?=
 =?us-ascii?Q?fHHfnc69D3qoZ4gnwB0CuJ+6r2u2uGo/jrlzlm+GtCZ50PKk2R0uufEYpR++?=
 =?us-ascii?Q?GeI63DCXodRSW5f4//leSd1yG079iBSdvHEkqTGatj7BupqVO8bcf5Q9Bxdb?=
 =?us-ascii?Q?8c1x571NrMXM4HRZslEM5h5cl+34xgkTLbLIAZrNpgA2W/i74BtDy0TjE7H2?=
 =?us-ascii?Q?d+hp6lWzK7icem2ysgdSt4FuQk2sDzatywoAAZ2fbrUP25S53uUTkaYkbl02?=
 =?us-ascii?Q?s/jJbqVuJ1WYjT83svuhPyQJSIi4HySx0NdRvt5Vj7kGKZ01z83YTRS5qXMk?=
 =?us-ascii?Q?xFgslGefcm5WKphu8r6fvtsQHYb6v1cbGliQELrG/Q4j4OI4OuoTq87JPcyo?=
 =?us-ascii?Q?hTcVbpBxiNhfOjpribc7RXk+Hf0I0xwqdyj5Qfo0jSRf7h3CvokDIGOrKK0B?=
 =?us-ascii?Q?z57479+y15eI2L5h1bNndO49cl+/iQpKuIgBUPEmvfdYUF9jDkaZZvojERBM?=
 =?us-ascii?Q?sqWEIBDqFxgqQihAsyXV4KiMVIOm7zScy1jNq3TOaosXyQwbXjsJLDHpK1xT?=
 =?us-ascii?Q?gXbotWeuymgsXdLdO3NPgDE3WnRtLBq9orHtTcldp469ndRAtcn8F3Q2QMtm?=
 =?us-ascii?Q?sYFqXwIJYPMUnhT0TCaC7BYie9stvisxtVWvIa6DedsXgPXdpy6xDQgy87J9?=
 =?us-ascii?Q?vP4WY14T+haQ7f35EWXOW1oPXz0ytxqq+37BusWSSFUEzU1qoyds+/dLuhqz?=
 =?us-ascii?Q?rqhzOuPTAMedvHC6ZSJ4c24HqXDsa2r9oAxxSPECjljv/wjSCvOCuhU39721?=
 =?us-ascii?Q?T5GG4DCqj6UVEV2VUgUEfsom3k1p+pYe2UEnrKhrRo1qZwlynaTKiIQZat53?=
 =?us-ascii?Q?WMcJZEWVif5N8+jmVpovUTxT/rysbhmTTZjYhg0hjlUK77XCq67HyqwShC1r?=
 =?us-ascii?Q?fKk4ffo7Xdd2t7pkDlMKCKYLyKeFZ8fqFZhX2XS0yRa5KJWGdZmwqgtQomrc?=
 =?us-ascii?Q?OWf+3sy+Z+RgJSBa4E+D9ZhJlO58aE4SKbP5nzLBb/dQP4Ifw8MTlpPitPZM?=
 =?us-ascii?Q?qV8kOZ4Q11vNUkR+/6Zr5q25QG9fpGJQWQYq2bHHp34LawVwvqjxeRZcvbH8?=
 =?us-ascii?Q?RGdE8FjQR0hLfGXSHcLjIAdS7+JlfhmZeG8m81nf2dslqnBIn3aHogQqIw9D?=
 =?us-ascii?Q?rpYuOSPvRiem5qqCxTWNxHo2zK+aHEV9?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:08.1982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d02edb23-9a92-4165-3ca2-08dc9fb1c773
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7024
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

Hasn't been needed since 2015...

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 4743459ea14c..af6b4e1cefd2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -32,7 +32,6 @@ struct nouveau_abi16_chan {
 struct nouveau_abi16 {
 	struct nouveau_cli *cli;
 	struct list_head channels;
-	u64 handles;
 	struct list_head objects;
 };
 
-- 
2.45.1

