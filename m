Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816E7F3A7F
	for <lists+nouveau@lfdr.de>; Wed, 22 Nov 2023 00:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65E110E040;
	Tue, 21 Nov 2023 23:53:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E4810E040
 for <nouveau@lists.freedesktop.org>; Tue, 21 Nov 2023 23:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mwb5QvRwQ/6MKES53UWdek5fQ2UvFATQ0tG9Xjbzj+DDH/Pur7RbdsAB2OaL+eKUp61K109+s2458JRLhtbsYfjA/ECD0By8FZNuQmKoYPXZEy+866pfMTNtLJaYpED4u3Bb0AP1gIQk2srcBu4IFLY75TdPFb+ZHn1AHsAV5MKmI0XkVazPx8ZOxhL/wcNL4JeED83Q7MCwkDghV0+QSg1G1FgUZetyEUcgG2/kIZ160XH265XP/u8vgwPF0LEP52wFE6f+x4NQVuSg0401hP00lQji8AxpPP+n8oR5Qdz/1EmT5a8sCmjn90DOmg/QiqVc8G6BwVzVt5VE2IZR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v1J/SxR/YQDHUxI9S4AnjeO2SwzUUJqrnSc8VkwC/k=;
 b=fMI8oiTYhddLARoNrukEvDaI44sxYfCHq25lQ+FXkivKAnYgLX4DIpymb7prZiuN4utbZRcJBtqA9PT0A4XbR4XTr+bSoLDzHl62vBj2PllUDwNpG22RdoMNQAf3nmJKkw4cdVnpRBG8mv50xciRDCSTEZyZzUfmcKkxTdIFGYjhHDgFpoMMiGrlku03sCY1Tut2k1yvqHd2AWlc0sVqQfhmlq5XQ2yYNChOXntcbUKISUGV7wW6gspDCQJAPWnZ9SFYlei1CqlAjuoVlh0ZuyBnM/1UnqWZu9c8s/ZYpX8QE8OhF9Hm/t1TtvjP6Y9PS8FlaFrV1SXC6vpmggcFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v1J/SxR/YQDHUxI9S4AnjeO2SwzUUJqrnSc8VkwC/k=;
 b=SbjPGAB7mNml/55JZImwBPamLI1KjfR4FhMLmTGEedMndIVpLZdHmmUGaydOFDpzLUvtwZu8O26ckVFBZsFf/QeEaDwkpKRd9v28fDKQsx0SIzqw72jiRZemMDt+65NmiifY9B24mJ/tIxkp2nAtwBeDOz02ycrWj9JX1EKUR3oKDmbo9agbndbeBW2nUd7jDJozKgahAAORoxFhPWMubC5ResM0rXn2r/gufK6awf7zEAGz2olIS4d9H30MHVVEqU+OSf2Yox7Rf7fGtcLtdQudpDc/GzKA8kUf1NDAbgNiumzJ7pWWKZmWpys43HGfmLsRcjQydLKAXMWKcBs41A==
Received: from SA9PR03CA0030.namprd03.prod.outlook.com (2603:10b6:806:20::35)
 by IA0PR12MB8838.namprd12.prod.outlook.com (2603:10b6:208:483::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 23:53:16 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:806:20:cafe::15) by SA9PR03CA0030.outlook.office365.com
 (2603:10b6:806:20::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 23:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 23:53:16 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 21 Nov
 2023 15:53:04 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Nov 2023 15:53:03 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Tue, 21 Nov 2023 15:53:03 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, "Dave
 Airlie" <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Date: Tue, 21 Nov 2023 17:53:00 -0600
Message-ID: <20231121235300.2406522-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|IA0PR12MB8838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b94e7b7-643e-44b6-06f2-08dbeaed07f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ttvrtygKFiafu4zUnEMyqigJ86fWtAppGpw+hndeVXqkt/fNyO/Yq7QKfnGnQGGcBKHW1G80Wn26+TfAVmCCgmkYHY/w1V4POGiQDEBz/5ZqrswfJwy56I/Uh02deniM6XO8Drj6UsXZAKhc9kYXVX86R0onMRkB+rPOoC9tw1TnPqPo0a7kal3u0sV6fUNDQyx1AFq1OOGWIi0nZ+TT1rNIxpYWDkbZJPXD6YMOuqajy7QTdw2dfbBNe6Do+KjbNuaylrQpJoXgyCMdjIeVct8CTmzOVkN0Ixy3t+I26L7Wdmz6TaVnZ2ZQ3WfAP+ELgtIc8pcCXZGf0nGWkAGofsiij2L0sU5KJ4RaA+SeRgqGBsPU7CW32js2CIN03R/EuX6ZlK6nCiBsu6QQTKrsU/sqFcZdeoFkKm6fdn8ZIIs62vM4GdF2V/Gyb8Vo1KIK0cIpS5NIo2nJSZtwBVpp03oWjsh7aUmQUvN5DStHwc3/WLUx2Htit6gkkEyNM80HdnmV5BAhh/tc/L118wtNF9gH75iEg6xh50mTWlfWsYCuePxaGJOo0kZ/6ITL8z+kKdfo1S8MTGvaaZDT5CS4vuzrwni0SoVEc86b09sn+WESVFpEd6YGPf+mQJxlz8cjRJcg+jnbS5BuyJMFfBJ1NAHgOOSvvqasYkLiBaaB44ZznhQJcIsCHNtam0WHrzFk3hKwIH1M+RNswXEX5Csag4DRd5T8DgmETTRiFQncRqI=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(46966006)(36840700001)(40460700003)(66899024)(70206006)(110136005)(70586007)(316002)(426003)(336012)(2616005)(1076003)(478600001)(26005)(83380400001)(82740400003)(7636003)(356005)(36860700001)(86362001)(47076005)(19627235002)(7696005)(36756003)(2906002)(40480700001)(5660300002)(8936002)(41300700001)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 23:53:16.3494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b94e7b7-643e-44b6-06f2-08dbeaed07f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8838
Subject: [Nouveau] [PATCH] nouveau/gsp: document some aspects of GSP-RM
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

Document a few aspects of communication with GSP-RM.  These comments
are derived from notes made during early development of GSP-RM
support in Nouveau, but were not included in the initial patch set.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../common/shared/msgq/inc/msgq/msgq_priv.h   | 79 +++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 86 ++++++++++++++++++-
 2 files changed, 154 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
index 5a2f273d95c8..1e94bf087b23 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
@@ -26,21 +26,82 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#define GSP_MESSAGE_COMMAND_QUEUE_SIZE	0x40000
+#define GSP_MESSAGE_STATUS_QUEUE_SIZE	0x40000
+
+/**
+ * msgqTxHeader -- TX queue data structure
+ * @version: the version of this structure, must be 0
+ * @size: the size of the entire queue, including this header
+ * @msgSize: the padded size of queue element, must be power-of-2, 16 is
+ *         minimum
+ * @msgCount: the number of elements in this queue
+ * @writePtr: head index of this queue
+ * @flags: 1 = swap the RX pointers
+ * @rxHdrOff: offset of readPtr in this structure
+ * @entryOff: offset of beginning of queue (msgqRxHeader), relative to
+ *          beginning of this structure
+ *
+ * The command queue is a queue of RPCs that are sent from the driver to the
+ * GSP.  The status queue is a queue of messages/responses from the GSP to the
+ * driver.  Although the driver allocates memory for both queues (inside the
+ * same memory block), the command queue is owned by the driver and the status
+ * queue is owned by the GSP.  In addition, the two headers must not share the
+ * same 4K page.
+ *
+ * Unfortunately, depsite the fact that the queue size is a field in this
+ * structure, the GSP has a hard-coded expectation of the sizes.  So the
+ * command queue size must be GSP_MESSAGE_COMMAND_QUEUE_SIZE and the status
+ * queue size must be GSP_MESSAGE_STATUS_QUEUE_SIZE.
+ *
+ * Each queue is prefixed with this data structure.  The idea is that a queue
+ * and its header are written to only by their owner.  That is, only the
+ * driver writes to the command queue and command queue header, and only the
+ * GSP writes to the status (receive) queue and its header.
+ *
+ * This is enforced by the concept of "swapping" the RX pointers.  This is
+ * why the 'flags' field must be set to 1.  'rxHdrOff' is how the GSP knows
+ * where the where the tail pointer of its status queue.
+ *
+ * When the driver writes a new RPC to the command queue, it updates writePtr.
+ * When it reads a new message from the status queue, it updates readPtr.  In
+ * this way, the GSP knows when a new command is in the queue (it polls
+ * writePtr) and it knows how much free space is in the status queue (it
+ * checks readPtr).  The driver never cares about how much free space is in
+ * the status queue.
+ *
+ * As usual, producers write to the head pointer, and consumers read from the
+ * tail pointer.  When head == tail, the queue is empty.
+ *
+ * So to summarize:
+ * command.writePtr = head of command queue
+ * command.readPtr = tail of status queue
+ * status.writePtr = head of status queue
+ * status.readPtr = tail of command queue
+ */
 typedef struct
 {
-    NvU32 version;   // queue version
-    NvU32 size;      // bytes, page aligned
-    NvU32 msgSize;   // entry size, bytes, must be power-of-2, 16 is minimum
-    NvU32 msgCount;  // number of entries in queue
-    NvU32 writePtr;  // message id of next slot
-    NvU32 flags;     // if set it means "i want to swap RX"
-    NvU32 rxHdrOff;  // Offset of msgqRxHeader from start of backing store.
-    NvU32 entryOff;  // Offset of entries from start of backing store.
+	NvU32 version;
+	NvU32 size;
+	NvU32 msgSize;
+	NvU32 msgCount;
+	NvU32 writePtr;
+	NvU32 flags;
+	NvU32 rxHdrOff;
+	NvU32 entryOff;
 } msgqTxHeader;
 
+/**
+ * msgqRxHeader - RX queue data structure
+ * @readPtr: tail index of the other queue
+ *
+ * Although this is a separate struct, it could easily be merged into
+ * msgqTxHeader.  msgqTxHeader.rxHdrOff is simply the offset of readPtr
+ * from the beginning of msgqTxHeader.
+ */
 typedef struct
 {
-    NvU32 readPtr; // message id of last message read
+	NvU32 readPtr;
 } msgqRxHeader;
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index dc44f5c7833f..265c0a413ea8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1379,6 +1379,13 @@ r535_gsp_msg_post_event(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
+/**
+ * r535_gsp_msg_run_cpu_sequencer() -- process I/O commands from the GSP
+ *
+ * The GSP sequencer is a list of I/O commands that the GSP can send to
+ * the driver to perform for various purposes.  The most common usage is to
+ * perform a special mid-initialization reset.
+ */
 static int
 r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
 {
@@ -1628,8 +1635,8 @@ r535_gsp_shared_init(struct nvkm_gsp *gsp)
 	} *cmdq, *msgq;
 	int ret, i;
 
-	gsp->shm.cmdq.size = 0x40000;
-	gsp->shm.msgq.size = 0x40000;
+	gsp->shm.cmdq.size = GSP_MESSAGE_COMMAND_QUEUE_SIZE;
+	gsp->shm.msgq.size = GSP_MESSAGE_STATUS_QUEUE_SIZE;
 
 	gsp->shm.ptes.nr  = (gsp->shm.cmdq.size + gsp->shm.msgq.size) >> GSP_PAGE_SHIFT;
 	gsp->shm.ptes.nr += DIV_ROUND_UP(gsp->shm.ptes.nr * sizeof(u64), GSP_PAGE_SIZE);
@@ -1718,6 +1725,23 @@ r535_gsp_libos_id8(const char *name)
 	return id;
 }
 
+/**
+ * create_pte_array() - creates a PTE array of a physically contiguous buffer
+ * @ptes: pointer to the array
+ * @addr: base address of physically contiguous buffer (GSP_PAGE_SIZE aligned)
+ * @size: size of the buffer
+ *
+ * GSP-RM sometimes expects physically-contiguous buffers to have an array of
+ * "PTEs" for each page in that buffer.  Although in theory that allows for
+ * the buffer to be physically discontiguous, GSP-RM does not currently
+ * support that.
+ *
+ * In this case, the PTEs are DMA addresses of each page of the buffer.  Since
+ * the buffer is physically contiguous, calculating all the PTEs is simple
+ * math.
+ *
+ * See memdescGetPhysAddrsForGpu()
+ */
 static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
 {
 	unsigned int num_pages = DIV_ROUND_UP_ULL(size, GSP_PAGE_SIZE);
@@ -1727,6 +1751,35 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
 		ptes[i] = (u64)addr + (i << GSP_PAGE_SHIFT);
 }
 
+/**
+ * r535_gsp_libos_init() -- create the libos arguments structure
+ *
+ * The logging buffers are byte queues that contain encoded printf-like
+ * messages from GSP-RM.  They need to be decoded by a special application
+ * that can parse the buffers.
+ *
+ * The 'loginit' buffer contains logs from early GSP-RM init and
+ * exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+ * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+ *
+ * The physical address map for the log buffer is stored in the buffer
+ * itself, starting with offset 1. Offset 0 contains the "put" pointer.
+ *
+ * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
+ * configured for a larger page size (e.g. 64K pages), we need to give
+ * the GSP an array of 4K pages. Fortunately, since the buffer is
+ * physically contiguous, it's simple math to calculate the addresses.
+ *
+ * The buffers must be a multiple of GSP_PAGE_SIZE.  GSP-RM also currently
+ * ignores the @kind field for LOGINIT, LOGINTR, and LOGRM, but expects the
+ * buffers to be physically contiguous anyway.
+ *
+ * The memory allocated for the arguments must remain until the GSP sends the
+ * init_done RPC.
+ *
+ * See _kgspInitLibosLoggingStructures (allocates memory for buffers)
+ * See kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
+ */
 static int
 r535_gsp_libos_init(struct nvkm_gsp *gsp)
 {
@@ -1837,6 +1890,35 @@ nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
 		nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
 }
 
+/**
+ * nvkm_gsp_radix3_sg - build a radix3 table from a S/G list
+ *
+ * The GSP uses a three-level page table, called radix3, to map the firmware.
+ * Each 64-bit "pointer" in the table is either the bus address of an entry in
+ * the next table (for levels 0 and 1) or the bus address of the next page in
+ * the GSP firmware image itself.
+ *
+ * Level 0 contains a single entry in one page that points to the first page
+ * of level 1.
+ *
+ * Level 1, since it's also only one page in size, contains up to 512 entries,
+ * one for each page in Level 2.
+ *
+ * Level 2 can be up to 512 pages in size, and each of those entries points to
+ * the next page of the firmware image.  Since there can be up to 512*512
+ * pages, that limits the size of the firmware to 512*512*GSP_PAGE_SIZE = 1GB.
+ *
+ * Internally, the GSP has its window into system memory, but the base
+ * physical address of the aperture is not 0.  In fact, it varies depending on
+ * the GPU architure.  Since the GPU is a PCI device, this window is accessed
+ * via DMA and is therefore bound by IOMMU translation.  The end result is
+ * that GSP-RM must translate the bus addresses in the table to GSP physical
+ * addresses.  All this should happen transparently.
+ *
+ * Returns 0 on success, or negative error code
+ *
+ * See kgspCreateRadix3_IMPL
+ */
 static int
 nvkm_gsp_radix3_sg(struct nvkm_device *device, struct sg_table *sgt, u64 size,
 		   struct nvkm_gsp_radix3 *rx3)
-- 
2.34.1

