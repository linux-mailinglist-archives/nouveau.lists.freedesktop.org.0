Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7748A78BE
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5367F112F36;
	Tue, 16 Apr 2024 23:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YURoOD8I";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0EA112F2E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOAZSEvX6w6X1ULmW8q1Zhudj2JN+dtE+XJURQOiTCjYFJkgyxgtU+dizjwFt3MizqydeYZ2sd5oYbVMi3ne+sVe4C02C2d1GeVP6cF1DlXHgdk71+T4HgFJpZ9AttALF9OvIZZiDq6TnXLDhvG10iZr7f/2tvbN7vs8BRAsv7r8tZutCoMHWYxzFEqcSyTlHUT4UKVpTcn8hEtCHpRnp4uPWsjfUK+qL2moG4wGXcYIovIjJ7wgUAHVIVn6hbfLqAi0WfmIXqd456Ry0MHbbHp0rw9lLzRAyfHgKhNiVxoHI9/ArT4XppRLwYGIFcC9R2p3J4pWPszwAR2Bru2T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k8CtRkIF7cXCTU6Qbre74lElf/spnujhN92Zm+J6Sc=;
 b=O8Gq/qxY6hUXnbH0WkIIQEB/rOPIgXCcmGse9SB4tJI+yclBiSr2eGmQeLWNvFI87u/duK4hTxQp3BmNs5QmEuI7h8iRfeUJ+EbVKfPouKdMCxGm2VUTrz1n3AiW69E+vR3wVEfqKGDxjNEkVfXHKggZGTvPJFm5DjT6D0eT5ynmpQYIXWqn37p6hSDPcW0hqNos98ltCZUe9qQ5iYrVkCw8guKGHIdbo0dubtp+FzoMgOkbNExFUmSWQhub1HNu2zwSb6yM9JNXtAk9PvRvysnaZMH/tY49jzdXplXaXmAGEllX5rTb3BNhlYb3alEaFw8ZkJ6nIlHYMJgnr/0iPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k8CtRkIF7cXCTU6Qbre74lElf/spnujhN92Zm+J6Sc=;
 b=YURoOD8IEdGH2DvRV/uMjS4lTY6nBIngGF1Hq0SxevpOkBoy35h1PlSPywsNMnGVrtnJUPOdcRiwzOv5+1jxZEmqe4MYpzNmkDczAW1CPn2dkrQidn6IdHZNN/NiI5lpldBm7WTnYrEIk/9KN+2R5wemLN27LNANE49p5jouSa6IdCUPwOILszGiOLjEIkFJ3bt4i/72s2bRKBCpExF057aqfC7sRpeWWnU793WdqltwXU4HWaHcohSv5eqTgpJyeNcECumya8dMz7kXBD3qmv3QnWSnBTOuRkBe77rzZTz7fd8qe/xfXpxJ1nPHScmPUMf9oN4aEW5VZHLu+4t1ow==
Received: from BN9PR03CA0665.namprd03.prod.outlook.com (2603:10b6:408:10e::10)
 by CH3PR12MB8257.namprd12.prod.outlook.com (2603:10b6:610:121::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:13 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::84) by BN9PR03CA0665.outlook.office365.com
 (2603:10b6:408:10e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:58 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 024/156] drm/nouveau/nvkm: move nvkm/engine/device/ to
 nvkm/device/
Date: Wed, 17 Apr 2024 09:37:50 +1000
Message-ID: <20240416234002.19509-25-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CH3PR12MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: e674e33c-b8a3-4fc1-a4b8-08dc5e6eb3b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SltCnz/BggtHEVyNBbrOdAgesNIIphDU+/WBE9T9Cxwzc6tDiXpaIniswgo2DkxiUI+a33yyW35FpUEjeUzChwyQiXRd8fqAnidCV4v2MF9N3dbBKmUnpMqG/T4j6KQKikbvAowP0/x1i1VJ2Dv9TkPTyzFkfW9T0uno/0+3N2smlkUeCJ67tiOMWSWpBAnKzyK1WT55kGi3QR/hlc0iF6o/1TmyqjIP8/X8MAAgvjoyVWUJHmQOWeVef8GK+GUG9jMunNUr1YXRkB/gwpGZ7VB6RULxFkRKXW/x2l1+tM+WIvdYGD93nc7Sd3YZzBcbH+ZU8UZyjelTMlN0V8miJSvB4eL9AYS5F29QpIrB0lZBIy3+pIm8OUjy43IR+mYzvEYNNFxMjPdYX83Z7kJnxncV5vT2HfTacr1UV3CbUNegs+nw8JtsRVYYrtj1xXbTOqAyBcflehwHL5IUfIKLUXofu5aVWJiCrtHkBJDkfXDsQWHSt5ipwOp+bU5ugqdPrskYGc9xXYlYVcnQ6rEyjgemULadGGtSjxjik3Ya84TNp/mw3i7DgVFtLZbgU3VYyE4Enw5G/Fu+Y99bUzO8CkEJ/OpD9I5jrxDYupoGhLqye9/u4zn3nynSPxZDd1h32m6vBt53xUBCHH3h0NonUe9YCH37kwjlEFXzYM25DxOTUA2v7AIrxuBrDSfsFHoxgAQxX0uoVpA7D39wsGydjwYnOPhfjosNkYz0vXOKgIqxoFAmUizDIVty4MeKMSzs
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:13.2594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e674e33c-b8a3-4fc1-a4b8-08dc5e6eb3b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8257
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

- move to a more appropriate place before making changes

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/Kbuild                      | 1 +
 drivers/gpu/drm/nouveau/nvkm/device/Kbuild               | 7 +++++++
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.c  | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.h  | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/base.c  | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/ctrl.c  | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/ctrl.h  | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/pci.c   | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/priv.h  | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/tegra.c | 0
 drivers/gpu/drm/nouveau/nvkm/{engine => }/device/user.c  | 0
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild               | 1 -
 drivers/gpu/drm/nouveau/nvkm/engine/device/Kbuild        | 7 -------
 13 files changed, 8 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/Kbuild
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.c (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/acpi.h (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/base.c (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/ctrl.c (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/ctrl.h (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/pci.c (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/priv.h (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/tegra.c (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine => }/device/user.c (100%)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/device/Kbuild

diff --git a/drivers/gpu/drm/nouveau/nvkm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/Kbuild
index db3ade125fa9..f68c19586b53 100644
--- a/drivers/gpu/drm/nouveau/nvkm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: MIT
 include $(src)/nvkm/core/Kbuild
 include $(src)/nvkm/nvfw/Kbuild
+include $(src)/nvkm/device/Kbuild
 include $(src)/nvkm/falcon/Kbuild
 include $(src)/nvkm/subdev/Kbuild
 include $(src)/nvkm/engine/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/Kbuild b/drivers/gpu/drm/nouveau/nvkm/device/Kbuild
new file mode 100644
index 000000000000..0e5ce7877b94
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/device/Kbuild
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: MIT
+nvkm-y += nvkm/device/acpi.o
+nvkm-y += nvkm/device/base.o
+nvkm-y += nvkm/device/ctrl.o
+nvkm-y += nvkm/device/pci.o
+nvkm-y += nvkm/device/tegra.o
+nvkm-y += nvkm/device/user.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.c b/drivers/gpu/drm/nouveau/nvkm/device/acpi.c
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.c
rename to drivers/gpu/drm/nouveau/nvkm/device/acpi.c
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.h b/drivers/gpu/drm/nouveau/nvkm/device/acpi.h
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/acpi.h
rename to drivers/gpu/drm/nouveau/nvkm/device/acpi.h
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/device/base.c
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
rename to drivers/gpu/drm/nouveau/nvkm/device/base.c
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
rename to drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.h b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.h
rename to drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/device/pci.c
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
rename to drivers/gpu/drm/nouveau/nvkm/device/pci.c
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/device/priv.h
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
rename to drivers/gpu/drm/nouveau/nvkm/device/priv.h
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/device/tegra.c
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
rename to drivers/gpu/drm/nouveau/nvkm/device/tegra.c
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
rename to drivers/gpu/drm/nouveau/nvkm/device/user.c
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
index bfaaff645a34..f9eb68a25de8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
@@ -5,7 +5,6 @@ nvkm-y += nvkm/engine/xtensa.o
 include $(src)/nvkm/engine/bsp/Kbuild
 include $(src)/nvkm/engine/ce/Kbuild
 include $(src)/nvkm/engine/cipher/Kbuild
-include $(src)/nvkm/engine/device/Kbuild
 include $(src)/nvkm/engine/disp/Kbuild
 include $(src)/nvkm/engine/dma/Kbuild
 include $(src)/nvkm/engine/fifo/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/device/Kbuild
deleted file mode 100644
index 293c57678dab..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/Kbuild
+++ /dev/null
@@ -1,7 +0,0 @@
-# SPDX-License-Identifier: MIT
-nvkm-y += nvkm/engine/device/acpi.o
-nvkm-y += nvkm/engine/device/base.o
-nvkm-y += nvkm/engine/device/ctrl.o
-nvkm-y += nvkm/engine/device/pci.o
-nvkm-y += nvkm/engine/device/tegra.o
-nvkm-y += nvkm/engine/device/user.o
-- 
2.41.0

