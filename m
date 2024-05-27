Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECE8D11ED
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5AA10E76B;
	Tue, 28 May 2024 02:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="inrgK+ku";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC510E1D0
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQ9zdn1zvvtc8bEMXlxOOEaTGNoP0HCGSOVfzyTfbXyi6IfDGm6YWEc6tznwcwzFjU1u9+cpcemOnEil0Dy+qJaMs9Q+PTmE5M+Oo5vzefQaDVwhJE4wGbPuAO17eLubPDbiDVZawX8wNhiribdpfef3DTYvkJf2R4GCM5VPCWvQRQUAX083MlbNcFH6ipK+3gP+bRw9QL0ZJY2cMGymiJL2uzzEb/qNvMpPvpN28vUnMtjSm5ifOxF/l4rC1Sj2tE4ZhUwEmE/pq0Y+hLkBV0nv/1rKXvJTxXhAqF3mFsaVjgZ4lXY8oTR6bhPRGPzpOomPCJGFwYwdr4kWIgAYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw7AGf+wlaKWzoeslii0CbSTEuL6AAAg5UpbM5230xI=;
 b=ak7gEolrlJ7fc7EQRXFcSNiNNJhDU/xFQj8dXh1jWkxz/gqzjHic4bOT4wt+A/j5Brqt20ye7jUBckvVDTEbI692EpoDIXc1rN15v58kybinAHE4BpXnMwpXIwFsU4qcgZVKlQfDAvtKZ/czCwE8zduxia9Ci/IkS9Y0aeVUubjA8QtXTKzlyoZmwXWoTeLnZdvXs6Vr/g+ktXP2b4HjHsELX8qmsFRcVwO/JMZ95J8kxbhCOwnpbaWDaFiljX4mn53mt96BJnjbzqeExy3nYOccVaYdmHVDcrzuw8lFNRufXHI35Fu51QGE5lFWPvQ9vwcSttF4xSpL4O6arhTeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw7AGf+wlaKWzoeslii0CbSTEuL6AAAg5UpbM5230xI=;
 b=inrgK+kuyzGAvTwAVplIblEPhYh61LO9CdXbkrhMBb11MOQHoi0a8gOm1e0aCuNZRYRfW2HDu8RD4qcIu6r5rjS8armNNIUGj+urv0xZHtCgxFT2HCmrMBM2WNqCe2m6b6phvoAEpGepuDjsSy/m1swVFUKZbNt5W17UpRP55MflTOVq5zpe7/faz0YUyKQq1IavrDyu0L+rLia7ssQARU7CcEQcMzZE+MSy4ZM9if6uwME6wH/sE4f1cQFbHb/yKtnvcEc9x0fGEUUU3luOogZt3zumwcU2ZxyJlQvyd9k984FmitNm0jW7zQMWpfpKJkcOseVLBfOF8OJ26nKq3A==
Received: from PH8PR20CA0001.namprd20.prod.outlook.com (2603:10b6:510:23c::15)
 by CYYPR12MB8752.namprd12.prod.outlook.com (2603:10b6:930:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:22:55 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::61) by PH8PR20CA0001.outlook.office365.com
 (2603:10b6:510:23c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37 via Frontend
 Transport; Tue, 28 May 2024 02:22:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:22:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:46 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:22:44 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 01/34] drm/nouveau: create pci device once
Date: Tue, 28 May 2024 00:19:26 +1000
Message-ID: <20240527141959.59193-2-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|CYYPR12MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b5dc334-2acc-427f-c394-08dc7ebd156c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QuVXfZBflJlK1xV60I3aMQt9EnMdp/8dq/hf3Y5Qph3BnCNCWuL5ENelxz9k?=
 =?us-ascii?Q?hV47rK8AbsG0wDr2RAG3F3oeHIbVGQse0PYfFH73TrcmpWWL51+pmYgMDeBz?=
 =?us-ascii?Q?ceeStlyIL8r4T5Gbf93igGOopJdLZAysg0kBzwEhaLirtoYr+G+hfiiwCPZ2?=
 =?us-ascii?Q?jkN0S2S4pUJnS7lb7Uvi5d/t2vTDhx0jWeII8g3+fPSmlvaaln/xYM/fftVU?=
 =?us-ascii?Q?pA0+4NZiB13Qf4+J4zJD7rKbGfK2hIJUjSE2HKHHk96qiF+G237TNGpThqkD?=
 =?us-ascii?Q?2PdcX6J3I4wvn1jCVONJd2Q0Zjx0+y0Eh1KCLqKqtLQHQC5Ofo8lXr8ObbwM?=
 =?us-ascii?Q?8xD4fnOmsxM8pZ+quDDMZWFST5LKdyj8cJX9AeSkNymqqzHI6FwpWF/HOvsm?=
 =?us-ascii?Q?rAr3ws2RSkN6GyIojmFnCY0yWpvhNcX2cd1OOV1dC9UPbQ+xQRoFGbkn1MCR?=
 =?us-ascii?Q?HoBW9ty3VZqe1kSmcxerOASqfJkJHdOWqgYfF+XExNeSxzzsTf3M+N0wUrOT?=
 =?us-ascii?Q?7Pt+YWf1bFe2fkRm7VzR3wBUlPX5m/Bcch9mKIecEnx3+Ge2F63Lvrxwd3Fm?=
 =?us-ascii?Q?eGDkynlwcAAuis0aQtgA/w+uTIpU+h1jISS2RWyHuY8sZzQRVUSbSdMRwjv6?=
 =?us-ascii?Q?NoKmWWvjREinASjxICj5yi291otFfCyQ85XWEcEFCvVtJozNJCvTDk949QC3?=
 =?us-ascii?Q?iaCzcEKWKdXM+fNR1/pZ4C7P7k0znOKqAUKZOzGfSHwcI8LMWmBfFkeQebOS?=
 =?us-ascii?Q?6XRTU6xRzc23smeH+moVE0kQ+D5qmZVal03kb2ERnpd2DfikKla2K3D4pwSO?=
 =?us-ascii?Q?MC+Ezj+swyP91MS7BYbGscsMSmTIHi/prJAjlFvIIrspl3E/u7wAtIMspL5o?=
 =?us-ascii?Q?T7RcjyC5WCuZge6gnp0GWRg0e0Df17zf4r+EDyj4O+WmZyH1BJSHyqyKLwbC?=
 =?us-ascii?Q?AXpelEgfMXk2VAKp83xw6nNP6MZJX9r9UeSetB2VaMw3o5/rBN8GY7aB6pzK?=
 =?us-ascii?Q?Nbs5JLOZj9Kr+wqN+zgCyiRAy+8Uz4e9JL1Lhj3B7z996ZZRS81U5WlT8ep8?=
 =?us-ascii?Q?o1RR2IRWYNgnAIqyN6/BI0HIRpWn8nlvlAIjapGyMhL3aY37kvPNGDzotZ9U?=
 =?us-ascii?Q?e3HrN6+qhuCm/wZVqAmhpnJHkPbELD2QEHiKWrpvC61+yxqJTWMOfH7Tvq4v?=
 =?us-ascii?Q?hPjf6vbo+oXOlQRFxY2Ki/0nUppYHb126NuVFFqr8ZRSziq07XZJTTIxwFxs?=
 =?us-ascii?Q?h+s3Umck1P2z9zfkHCudCgnkcAL064wntE32bMMuDdTp0jPk14A20Ts0re87?=
 =?us-ascii?Q?01A+wmJjLJwAxGvPYfn44aVYUbRUdIWgT+HEyzEWK6roBQ9zZzZOJVG2BBf9?=
 =?us-ascii?Q?yzheRj0AZdasl6gan4zUzvIU7MBO?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:22:55.1729 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5dc334-2acc-427f-c394-08dc7ebd156c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8752
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

HW isn't touched anymore (aside from detection) until the first
nvif_device has been allocated, so we no longer need a separate
probe-only step before kicking efifb (etc) off the HW.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..c37798b507ea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -803,23 +803,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	/* We need to check that the chipset is supported before booting
 	 * fbdev off the hardware, as there's no way to put it back.
 	 */
-	ret = nvkm_device_pci_new(pdev, nouveau_config, "error",
-				  true, false, 0, &device);
+	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
+				  true, true, ~0ULL, &device);
 	if (ret)
 		return ret;
 
-	nvkm_device_del(&device);
-
 	/* Remove conflicting drivers (vesafb, efifb etc). */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver_pci);
 	if (ret)
 		return ret;
 
-	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
-				  true, true, ~0ULL, &device);
-	if (ret)
-		return ret;
-
 	pci_set_master(pdev);
 
 	if (nouveau_atomic)
-- 
2.44.0

