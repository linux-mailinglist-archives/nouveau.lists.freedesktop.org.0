Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBEB7F51A4
	for <lists+nouveau@lfdr.de>; Wed, 22 Nov 2023 21:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA3910E312;
	Wed, 22 Nov 2023 20:29:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C39410E312
 for <nouveau@lists.freedesktop.org>; Wed, 22 Nov 2023 20:28:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmGXwmFmlljzPI/Y1DRFuEAcC5ROkbS24OjxXqBH5EahEDaJgXGlPpmbtABJcQvDvUdWWGuUkuEAku6LwLXPxuyqWIH0reLqJLAMO4qHKuClyqZicdA+yf9tdcgMU7R7eSX1CXO6ZAxB62U6dJ8BUWX4g0M7ukW1ABv9aYn5rJjHr7/dk72e7009Thk3mKgezsvBpnPknw0oL2VjK5glah36jvbJOyMHYQKGVR9QvnbWdmkrudrOHSew0q0ygXaY0Z/gLhtFlja1ckivguZQuRzgNlewaq+meg77X4UYdzFWN8ixAfv69zjno1UKVXZsf0w903aAxbhmmzqQkjof0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6tCxP0T5Sq5i2ezYIroUEPFB2oJrVjsABTTca2sPOo=;
 b=jGbs7T1qFmBWxOG+lNiwmJOpe4Rjo1oIqDlO7X5FJWk1Bt7YrTJiONlCSFCJWwKKSK+b58B+eKJhTrE4/UqA0ZL2YmUp3tyrURvHtdKVBYxqg+e8swu+Pbk4WMUwhyxHfXY5am0l58ONf4f1JBpTtn+fOQqE/S7ow2cr+mLiOw3Ej0qV+0BQ5LQ64KwqWq6P4eDSCrcd3lR6QpvQU5dnXRcrpriyECaK0fIMleUaER9mqIkP5Z0lzH2iuRYF5jNRnCjidcI5/SV127PacYmcLj12W4maaKbMLfF9atCwmQFsmmK7GFYO5MKX1NpZcp2PbGv6CacvHS18v+VEvxC02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6tCxP0T5Sq5i2ezYIroUEPFB2oJrVjsABTTca2sPOo=;
 b=RNBHIFjdXyT9ir/N3C9Yf7gYSPtERVO9CZP9A0pHx1Ee+rEnTr8oDJtr5K03ynmOnJgm2NxSPuM/UNP4r+hOnZO13nzWz5HxYEg/rDJS2kANehMnpiQGa0Fy8PbPgIKQ6atmYYZt/ft3MyMFDKj4iCqNg6AuBlAAgxK+WNIGbEgbUWklgcL0P/O/JHjUZwnN2/dvPaMoMqfuP3elTotuP+Mu1WMxcYVMcwhYZXmUR6otmcDvkqYze3G+LC/MgPVn+DwdX/qZ2a6EMDswAP9FEVd6vg6VVcOj9QZq2RF1B1yXgOtcBj2zLv91BnKLaPmRta1TeOnMw46DZktCr4/zfw==
Received: from CH5P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::19)
 by IA1PR12MB7760.namprd12.prod.outlook.com (2603:10b6:208:418::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 20:28:56 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::50) by CH5P223CA0003.outlook.office365.com
 (2603:10b6:610:1f3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18 via Frontend
 Transport; Wed, 22 Nov 2023 20:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 20:28:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Nov
 2023 12:28:43 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 22 Nov 2023 12:28:42 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Wed, 22 Nov 2023 12:28:42 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, "Dave
 Airlie" <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Date: Wed, 22 Nov 2023 14:28:40 -0600
Message-ID: <20231122202840.2565153-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|IA1PR12MB7760:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f75e94a-cebf-45ec-db6b-08dbeb99a696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nh0TLbop2wSkpzc4it4ldk13kS9uRJtYyv3k6cHYT1scTC8DIKIOGJwE7UWfItA9Wz9xIBxMDW1W/bapfV++yYdefShb+2o5OF9EjtNfWrnyI3fULF1H5JsKAlkXt3mPciujM2QcXfzVaDoddym9g5wwvezF27kYVx9xKPxuaDNJ4Q9w/I/Wl5GIfI8hmYT8wnoMR9u7VGD0xJOUXxVD47Ls0wI1XrYrTlD6QhLt2HYotEzvGj3OiPBihvluuA03h2yPJfB3xHa4l5paCu5ubwnDqrrLYwuRDsu4hzs6OwEL+ajnZ+4SK7MutiF0JlN17RRdDzT48NfniA4c74XTIcfNhwrkKJGisCrMlV9LEYswB9A0rPvY0/NZFoZp9lwc5dJHdCzJdDhK+6LzEdrCp3bnQTUzBCBr1POqxb2xCoO47hDJfduJuGkDf2m8jgUVqh3L23CPzkWQbmhDUELbZuyWZJ1oeDOUo9ICTi1ILgScfsWDANYYoB0ph6tKyv1Zvy465jqY+8qNIJY1cqsszKzz3dic51uASJyjQwM2AhjpzRSKkVr8EjMLdc2Mz79CeR8TRtDk6yj51W0zOy+8e4e7U7nLfDWui7IUXrCFXf79gaw/AHDQLsTHTDPv0RdgOoYBGTLiqZHARRw4Rz5jbkstm0iFY/CbwUa7PO53FcGJ343aPYYfVT63ZcEpi8FSfA4EDHEzdLKBSI8RiaetVEC4rAtWOzYfTL/rBRQd5P4=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(40470700004)(46966006)(36840700001)(5660300002)(2906002)(40480700001)(41300700001)(8936002)(8676002)(110136005)(316002)(70586007)(70206006)(40460700003)(66899024)(36756003)(86362001)(47076005)(478600001)(19627235002)(336012)(26005)(7696005)(1076003)(426003)(2616005)(7636003)(356005)(83380400001)(36860700001)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 20:28:55.9079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f75e94a-cebf-45ec-db6b-08dbeb99a696
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7760
Subject: [Nouveau] [PATCH] [v2] nouveau/gsp: document some aspects of GSP-RM
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

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../common/shared/msgq/inc/msgq/msgq_priv.h   | 69 ++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 82 +++++++++++++++++++
 2 files changed, 142 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
index 5a2f273d95c8..45f0cbe430f9 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h
@@ -26,21 +26,72 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+/**
+ * msgqTxHeader -- TX queue data structure
+ * @version: the version of this structure, must be 0
+ * @size: the size of the entire queue, including this header
+ * @msgSize: the padded size of queue element, 16 is minimum
+ * @msgCount: the number of elements in this queue
+ * @writePtr: head index of this queue
+ * @flags: 1 = swap the RX pointers
+ * @rxHdrOff: offset of readPtr in this structure
+ * @entryOff: offset of beginning of queue (msgqRxHeader), relative to
+ *          beginning of this structure
+ *
+ * The command queue is a queue of RPCs that are sent from the driver to the
+ * GSP.  The status queue is a queue of messages/responses from GSP-RM to the
+ * driver.  Although the driver allocates memory for both queues, the command
+ * queue is owned by the driver and the status queue is owned by GSP-RM.  In
+ * addition, the headers of the two queues must not share the same 4K page.
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
index dc44f5c7833f..4eca81cff1ba 100644
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
+ * the GPU architecture.  Since the GPU is a PCI device, this window is
+ * accessed via DMA and is therefore bound by IOMMU translation.  The end
+ * result is that GSP-RM must translate the bus addresses in the table to GSP
+ * physical addresses.  All this should happen transparently.
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

