Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD3B9D5F5F
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467EE10E0C5;
	Fri, 22 Nov 2024 12:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mfvZO6se";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1008010E0C5
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atf1Ms45uhUKuPjw98iM93svmjyErchsddBghIO0xTO2x+eJ8N4pjbfKhfykkYTg+genf70gyU7BWVnBfZTP2lg/0NlNdQ408/RSrj+b0utPYkOGnVK0oU8gpa7Gp9qJ/Fy2DWj7q4PjU8hgMPvgyLHVRcCowg5OOH74KsHJkzZSdaN6y0UECpCfIFD/Tswvdh18M24G5NL1ppLxAfq4C09bOgsOhXCHfXJPdp0S/0lLkdbgCKDep4qNI5KA6Uy9OqAWEvaWfz01sOmOE6vSHonZ1pa58xZLOPGwyTwG6gs0p1k+PbBY5iW36g5O1KLlGUPj5O7cVTrufydmqCoWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jEghVOedFjfY9PvPSXSc9hABiaCen28/pMmOJJX8Aw=;
 b=j8uNjShMynNL/QsPqj/aVfgazVUHRusHsu4gk315z2bQU0HAtqAxqjyk1eIUSSnztM2r0ie8+fRdQEpewDUeXFOZ0NnEmSPeI24C6aUKlRGA23Jj4kgTAWlINzHX5z22JLcT+ChZHBcAcAPh8IIzFzcFMyWkccH9ljo3DIhjEScCafBmvfLwz0uV/lnutv4vtOWXEtpS7/omh2POSV6LfNe05Oj1V/i4yuxJzz7/2A+GohjnWKf5VPJC2r+x0dC+LS/XuN+Z50oP9roL7xT9ap0dgl8m8hPPW/Yt1oB5KOIwwoladb0rq5heYP6IiRObNoTrpwCzXfHH+i7K8YzQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jEghVOedFjfY9PvPSXSc9hABiaCen28/pMmOJJX8Aw=;
 b=mfvZO6seESX04eQYL57gdl/N9tD/8TeqSI5CeFJj1VD+NabTwfZNATILaltChGNgEKfjHhL5Cq6RNCTKn/9Dfip5jFCvGPbsLvu1eLrSoUs6D0nchOYUneKnDwAu0Mj7oKYrPUrNotbA9BB1Izk/4DMmVL6BzTC5+fwYv7Y1vyCfbO/P4HvwZx0lFfi2C8kQYaPwREGslDwV1wOkXJevY0TAHIrlO24i6BbYkdxDCRiSpjU9tMI95BYtU68XGivjzqDpFHuuDE6qN7JB1MOAUEda0y58152dNxBIy/prcUMrYiTTTnawpdQ6qelKyFNeXvrfXeXAmm79rGgjZo82Gw==
Received: from CH5P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::15)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 12:57:21 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::cc) by CH5P223CA0015.outlook.office365.com
 (2603:10b6:610:1f3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:19 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:18 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:18 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:17 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 0/8]  drm/nouveau: scrubber ucode image support for vGPU
Date: Fri, 22 Nov 2024 04:57:04 -0800
Message-ID: <20241122125712.3653406-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: b1048d89-a819-493d-4b8b-08dd0af53350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?26mv4s+EcJUxbWVAReCRn3oiraJaVo02g+KrKSep4FS/i9sfe1lHAJJL0Iin?=
 =?us-ascii?Q?uUZqvseygVhSnfQzJEAdWMsdhX/aYul/UFzvzFzfOvalhM3RTytQpWmCxUxS?=
 =?us-ascii?Q?irL4qbTRqz43sygV0E2T6zTbd7y9sVauA67ScO1a1Ct+uH0C3nf7WYPJR4rK?=
 =?us-ascii?Q?IQRa/5OAvNxkYiAr9UqwoJUotGWpqecpYeWKzAPwJ0iT1nUsmwTYXLZdadkl?=
 =?us-ascii?Q?vQQn4VTjQ9suWcIn3Z8IgFSkb/Ytu5JMdkDveoXwL9TEH3lLZnB9pisZ9T/v?=
 =?us-ascii?Q?ChlxYloc/ZNQFuADA7Q4jo+pXJfaEqxN/E65vusS/L442Ycdc4S3Uliqa7w+?=
 =?us-ascii?Q?DKpkKCZieGAcByd44IPIPjQy00lQ2DoLLLuqX4uZwDqrt5lYTbL2Z9ydue1W?=
 =?us-ascii?Q?MXuite570DdaMEc903OK49gNqd9ydLzEWQbBrm1TqwUDMrnrKOD55XNvexHO?=
 =?us-ascii?Q?kR2lFOjXjBK9LhwP9m/bfZ/F3OBu4OfQ+R0AgxG3/flZFpl355+JjrN74/+S?=
 =?us-ascii?Q?jxM2+ONc3clh8eLgKjUJY4jFxM138Lk/ZvY7YUjxskOWOwOWopiR+6F0wJ+p?=
 =?us-ascii?Q?pj7d8K9+gQQIv9MSU3aFdoRetdp3hR3HOLUmNOA7TyJ/jQr/q3FiCNIFHzW5?=
 =?us-ascii?Q?wk5IyaOI67yoqzYJv8C9oG5P3fnlgYwzDGLgQHti8R5K5fX2eLHTt1O1rUq0?=
 =?us-ascii?Q?YBxIrdeQBXMcquesChHnXTA4288/vY4E0nkOpclS8tuddvah6uaUfLSJ7pry?=
 =?us-ascii?Q?czqY6sQr/EWLqpD5j7v4qhaNzATbsK/ss40VrUAZS4GRISJrO7yMWl7NWrhk?=
 =?us-ascii?Q?ok+qje0yHSjH8D16bpI3U7Xg2ys5oQfIfWwPoLV/Tg9Bw7J/gnio5KxXVD+h?=
 =?us-ascii?Q?1SgjF1P7Y8jUu6ioP9jbZWEmg3jD9kRUTcaM4OaWQxce89pG1dVf57Q7ytXH?=
 =?us-ascii?Q?U+47tDQU2I1OcnHFYbnFtOOQUPb3MeIOJsKQ+yvHWXMB+nfwr7g43EiCz+rV?=
 =?us-ascii?Q?IjqGQA8fHIU3n8oYj6HO0F6I6S1h9x4dUWBfOjsdJlRnGOy3N+D1Y8I+o02X?=
 =?us-ascii?Q?rwWmXBNO73QsSlZYwpPAft/ofyNWq20grdobrS1gzLO/PxjzFq3RcDgX66P7?=
 =?us-ascii?Q?NVMN8O159sIKrVSN3cQSfUyZPKqUNeyUnTwrMgPtiEAkDQ4MFJnSvbi5P/wU?=
 =?us-ascii?Q?64ojDs4RjjtWeFJoDv2dxX3nxP9SLspXXnHU1s5KnjeC7UsQ3lCAfhaI75Od?=
 =?us-ascii?Q?G3bQhGR628lMHeU5WGzmOk0fq13gK0C5fZ37CqGuqP6MTAcXtpH5LoWdyGbi?=
 =?us-ascii?Q?+JeBeUduK153CWcpJ3SRGnkwwujtsDenAJ8jyoByj5aiepqPRkRcrE3QC295?=
 =?us-ascii?Q?QI7Orp9EevLYCIhMtNGEXgennrgNY0fHWPomT7DX43WG+Qex5yvFNObwlTwQ?=
 =?us-ascii?Q?8mpEcN0kwGoJLpRItLp7r+STj8GWhxrWW5XgD11gm3FEU02NuO/kUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:19.9237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1048d89-a819-493d-4b8b-08dd0af53350
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035
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

Hi folks:

Supporting multiple vGPUs is one of the goals of the next version of the
RFC of NVIDIA vGPU support. Requesting the a larger GSP heap size is the
first step.

However the pre-scrubbed FB memory size on Ada is 256MB. Thus, using a
larger GSP heap > 256MB requires an extra scrubber ucode image to scrub
the FB memory before any other ucode images are executed.

Thus, the scrubber ucode image support is required as a pre-condition for
supporting the max vGPUs.

I would like to start this RFC for discussions, collecting people's
feedback before the next RFC of NVIDIA vGPU support. Besides, a kernel doc
is attached to explain the story.

This series should also addresses the comment [1] from Jason in the
RFCv1 [2]. The series can also be found from a repo [3].

Tested on vGPU RFCv1 repo [2] and [3] with running Heaven for 3 hrs and
Vulkan CTS without any problem.

PATCH 1 - 2: Factor out some common routines for all the SKUs.
PATCH 3: Load the scrubber ucode image when WPR2 heap size > 256MB
PATCH 4: Execute the scrubber ucode image when the image firmware is
loaded.
PATCH 5 - 6: Set the WPR2 heap size to 576MB when vGPU(SRIOV) is
supported.
PATCH 7: Set the max supported vGPU count when SRIOV is supported.
PATCH 8: Introduce a kernel doc.

Generating the scrubber ucode image
===================================

The following patch is required before generating the scrubber ucdoe
image via open-gpu-kernel-modules[4]:

diff --git a/nouveau/extract-firmware-nouveau.py b/nouveau/extract-firmware-nouveau.py
index 837edc8d..6268934c 100755
--- a/nouveau/extract-firmware-nouveau.py
+++ b/nouveau/extract-firmware-nouveau.py
@@ -335,7 +335,7 @@ def main():
     booter("ad102", "load", 384)
     booter("ad102", "unload", 384)
     bootloader("ad102", "_prod_")
-    # scrubber("ad102", 384) # Not currently used by Nouveau
+    scrubber("ad102", 384) # Not currently used by Nouveau

 if __name__ == "__main__":
     main()

Once the script is patched, it will generate the scrubber ucode image binary.

[1] https://lore.kernel.org/all/20241015163556.GN3394334@nvidia.com/
[2] https://lore.kernel.org/all/20240922124951.1946072-1-zhiw@nvidia.com/
[3] https://github.com/zhiwang-nvidia/linux/tree/zhi/scrubber-support
[4] https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535

Zhi Wang (8):
  drm/nouveau: factor out nvkm_gsp_init_fw_heap()
  drm/nouveau: introduce tu102_gsp_init_fw_heap()
  drm/nouveau: load scrubber ucode image when WPR2 heap size > 256MB
  drm/nouveau: scrub the FB memory when scrubber firmware is loaded
  drm/nouveau: support WPR2 heap size override
  drm/nouveau: override the WPR2 heap size when SRIOV is supported on
    Ada
  drm/nouveau: set max supported vGPU count when SRIOV is supported
  drm/nouveau: introduce the scrubber on Ada in a kernel doc

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   | 81 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 85 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  9 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |  1 +
 8 files changed, 157 insertions(+), 33 deletions(-)

-- 
2.34.1

