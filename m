Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630F85011F
	for <lists+nouveau@lfdr.de>; Sat, 10 Feb 2024 01:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BB410EF7C;
	Sat, 10 Feb 2024 00:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UzxgbQxv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE0610EF7C
 for <nouveau@lists.freedesktop.org>; Sat, 10 Feb 2024 00:29:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsRcH0ElIsYUFNo8uI7NjXbU6vlX9FiT11+tchwIate3g+WGvDeVOIMs5fxJnCRTboDSUHa24hRMv6Z12gkNfn6c3HDXYzWsMsFdrqngfLYu+oUCQPrXpjAopPsH0LH7JEWhOJPEhnPNm43ZHynBgvbvLEx7o2npZFSH/7oh/nWcswZCEHg5caDfOfpMbJ67A2WK+DdwQAeQaYlPATZrLjAEXHNdtxyMLSC1mg9ImkdnzAeJNf766H6JNV+8Ex+GFcVm+wf4CyCNb1oDGlz3v8xk0D0mR2iNMVO0NFCldMJ8On/pRTdqi2LIfT+WUVQ9wIrZkUa6WdUVjQ/Ed7Vw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncc413Y0xv0JCWVP74Y3o8K1G8I4N3Y0Cu/EVoKlozk=;
 b=UgLgQrtyFjW1EeKg0exbn9NoT5LzlH+5qg7FoyVyryJjKqhFyq0vf9H8/eSitqEoKCnbhonBh/4aX2lqF3DXhwFG5iTn9z8oucP6DJ/oVLWsoyMIKWlO9bAyQTg5u98ajVSB8TmdAIPfUrqRf3TYBwc+AvpenaMiDSC4uTeX0u+5pJveDCYdaiJMkCcHRgnNCTXbrIUlHMpZwmL+1R3rSHHWiWPM2i87/BTEILQeIL055xQM5BM+OS59x/Vqm/3rfxurRPwu1lFjXg7b0kh6loBHcxhy44RHNeJ2N5erCPx3REeQ9f6itWQ03oIjFfMGC4qRbliDstEx26OseKf9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncc413Y0xv0JCWVP74Y3o8K1G8I4N3Y0Cu/EVoKlozk=;
 b=UzxgbQxvAgvqhs9ThM/IllEhEHP0cbYply//YfwsJmNv291Rdz5/pkMc0kx1tdKEYgx+lQKnrYRxeOWf48QA6VwYyUbztgdBQoEj2gGDzcwDhP9jAKf+0yBCYUoHNNas8ztFeshbHNH1qRS3IkNf6vW0HH4J01LBKzdRrPZ1lzYPB77Jbj2Cj6fT+GBnvgVVc/+Sl1WFE7IxI/xWyTnHwfn2r2bNDdSusMsD70kq9RcTRJjtTZCuxChsaFI8n1BvU31cZKX9J4fcZNuITaJGqb0JhGVX8FjYP1LFzj7G103Re5Nqq5WcdytBTPED/BpX+iOrzVPy8LsSTKJ980/14w==
Received: from DS7PR07CA0004.namprd07.prod.outlook.com (2603:10b6:5:3af::13)
 by CY8PR12MB8195.namprd12.prod.outlook.com (2603:10b6:930:77::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Sat, 10 Feb
 2024 00:29:13 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::ea) by DS7PR07CA0004.outlook.office365.com
 (2603:10b6:5:3af::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.26 via Frontend
 Transport; Sat, 10 Feb 2024 00:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Sat, 10 Feb 2024 00:29:12 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 9 Feb 2024
 16:29:04 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 9 Feb
 2024 16:29:03 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1258.12 via Frontend Transport;
 Fri, 9 Feb 2024 16:29:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, <nouveau@lists.freedesktop.org>,
 <akpm@linux-foundation.org>
Subject: [PATCH] drm/nouveau: fix kerneldoc warnings
Date: Fri, 9 Feb 2024 18:29:00 -0600
Message-ID: <20240210002900.148982-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|CY8PR12MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3d43bf-2243-4d31-01e1-08dc29cf4e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r5u6o2I4APoPDl5xZ/P8hRPCf34hQaOiUvhMxxk+GvbJs0SU1aX0ozmpD9iqdOvfxoKqqhK+OABGHAPtKUSbk5hLrF0m7qruT2YyyICJvOfsliKwC/VIM94KHNXFmmj2KoRzVZX2k09s5A1xsdB7prkIASWKw83PHjDeuk7XriyLn3JKNEpb0Iid1J284vkoOyhmWf+1y1QP1rbRbtXebMLAq79UjTMS2rsGq8KggxzRMd49WWQEJFZegqjAfcqOqRseLJSQ8MkSm0d6ImjdEWBR5aySrfBFy5OuVqUYYMeABPN1lnv1xit48MoJmB/Qh3844fwo0IoW/Jfdp6zlqBWgCBTpcaZoOlo/7mXcQouEqmEMhx3wAaRQA1vW+vTS6mLcnr53T4GpvRheS93ACW0aax/2zHw0PsnGfC3sIsDi22RT/t0Hlh/PTTfuIfpTEBBBSQsdq9k1uNS5Ri6ZbN20Eh1oya/KjM7fT4dmyZR+f8mlz0FVZt+QaB3tCfknN5N9rmDCjI9tZ1OAGgzh+Fg8NTnMm6d+vJk4dT7TYxa/+yoz6XF3KQBPTBsZ3wSASP7heaJ9B3Qq3P5H8yETkEaqhGdhHXdGg9fZZK6zlZw=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230273577357003)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(36840700001)(40470700004)(426003)(336012)(83380400001)(1076003)(26005)(2906002)(82740400003)(41300700001)(70206006)(110136005)(86362001)(7696005)(478600001)(70586007)(8676002)(2616005)(7636003)(356005)(5660300002)(316002)(8936002)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2024 00:29:12.9097 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3d43bf-2243-4d31-01e1-08dc29cf4e6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8195
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

kernel test robot complains about missing kerneldoc entries:

  drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:
    Function-parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index a41735ab6068..1c46e3f919be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1432,6 +1432,10 @@ r535_gsp_msg_post_event(void *priv, u32 fn, void *repv, u32 repc)
 
 /**
  * r535_gsp_msg_run_cpu_sequencer() -- process I/O commands from the GSP
+ * @priv: gsp pointer
+ * @fn: function number (ignored)
+ * @repv: pointer to libos print RPC
+ * @repc: message size
  *
  * The GSP sequencer is a list of I/O commands that the GSP can send to
  * the driver to perform for various purposes.  The most common usage is to
@@ -1783,6 +1787,7 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
 
 /**
  * r535_gsp_libos_init() -- create the libos arguments structure
+ * @gsp: gsp pointer
  *
  * The logging buffers are byte queues that contain encoded printf-like
  * messages from GSP-RM.  They need to be decoded by a special application
@@ -1922,6 +1927,10 @@ nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
 
 /**
  * nvkm_gsp_radix3_sg - build a radix3 table from a S/G list
+ * @gsp: gsp pointer
+ * @sgt: S/G list to traverse
+ * @size: size of the image, in bytes
+ * @rx3: radix3 array to update
  *
  * The GSP uses a three-level page table, called radix3, to map the firmware.
  * Each 64-bit "pointer" in the table is either the bus address of an entry in
-- 
2.34.1

