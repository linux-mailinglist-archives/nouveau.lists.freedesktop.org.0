Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E223832171
	for <lists+nouveau@lfdr.de>; Thu, 18 Jan 2024 23:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3E410E1B4;
	Thu, 18 Jan 2024 22:13:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A31910E1B4
 for <nouveau@lists.freedesktop.org>; Thu, 18 Jan 2024 22:13:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDXDpyiDwTewPixVzQOEAMO7tBDwZ6Ii/5PFRWnbbOACAjg7t5KAA2I5inPmqHoMPyVjiraDYKm+JzXkAO1xlIETJuVzCziuhyR37rOmK20xlnxGcB7AvlwXdSRIFRxq9m51gyN1gUaTNDgLHqX2H5ZPMqQWaGMf+81b4WOcUe5piJzTQHzPsiNgqdub6Qi9w3Cov+44SLlxlkTjD+h+nCnjwwijnq1AjhUCmdEPtoh0kohZa59Uu9sZqLvflDCvYtrGJVmby45Mg6e1zMdRs3aLjfD6sutM7Lw5wqCo6W6U+tKICVGrdJtgVC31c47lclYzBChcu8h4foeh6wTJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0grBMEzpt+NJnJagdCEAJmf5RA588CaEBYBAor+lspM=;
 b=cZeiyeGccFQSXBeaxZR5T8zl1W1Tt52vM0NgWvQs52fbmf62wPiEd5xdip/IrLsRfDzEpvyODGpfPfhBBWrP951uTvFYKePrHKuswSRVU0uETv5UyUHsbQdaUChbZ5ZpXyyVncAjJyCKD56fH7WHbOLSUqSVJ4JkUCm9aRCJC6f1ctLr1Ensum0OSERG7VabTndV3JZi58oFTQYI8j4AMuz8MyozvA/gLKhLETz1noh+3hejUp0U1U34t6A593pmY1a+t2yTTOmbjGKBlg1hWIA2Hd7QUhoVU9GdyXHYJObbpPBV7+rxkB25Btqp3sNCxPMTqPKhtnaFBqslgOGX1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0grBMEzpt+NJnJagdCEAJmf5RA588CaEBYBAor+lspM=;
 b=oPZk+7gVI5FF3kMwHrVq0vNGPf5dd1WOiYEuZBVDOsWCTtrYvBjCM9R6tRY3CSbulzJprUadtWfz+pIRl6qV4OFK08TmGf+noxnPZer8htYK//SuW+JlE5/U3pj/8Ga2sm5nbBVxbn2Cc84HaPLK3MOonEU96iLfU9KYDsJL7qC1LCcFgzTVQalzid73+Mlh4Om4H4UFQX9dJnDQqAo3eIvGkD+sLcwG32a8wNzCGCjOjIY3M9+izDRZWenez0ySsjVrxGOLMjMNVkXarmV/aXinlGZuqF92Thdk17LMolhrzFvI/Op7eY9vM3zH4nL00RnqMz+NZ53W60Xaa6I+zA==
Received: from BL1PR13CA0389.namprd13.prod.outlook.com (2603:10b6:208:2c0::34)
 by SJ0PR12MB5454.namprd12.prod.outlook.com (2603:10b6:a03:304::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 22:13:31 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::37) by BL1PR13CA0389.outlook.office365.com
 (2603:10b6:208:2c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Thu, 18 Jan 2024 22:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.14 via Frontend Transport; Thu, 18 Jan 2024 22:13:30 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 18 Jan
 2024 14:13:15 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 18 Jan 2024 14:13:14 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Thu, 18 Jan 2024 14:13:14 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] nouveau: add command-line GSP-RM registry support
Date: Thu, 18 Jan 2024 16:13:09 -0600
Message-ID: <20240118221309.1311766-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|SJ0PR12MB5454:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fe8e69-7b3d-4e90-b36c-08dc1872b401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4IMFtxtVbIA58ZYAvZmxmwupK2lW1Wk/u77SBy56aaY2OSbrnRDpu3knizCFl2K7kLhTV3jb56y3EqqXddl5POgfuIE7YOzeKguUa/F6/tV13spmeYMXPBeLPxRw5CiFSqd+AM4Vjd49Ta/zZfHk2It+QAnYwu6MQAuDZdP+BGbVM1RDzazchaGlAIcWXGSRTjPUZDAlT/XZpzIQ+izt1bOeFRya6dENK2i2o/qPBy+sRcfE19R0xQdNDqx6nRTDKqErvqwKkyZtLmECDEHOgGyOl9gUTU00hhjYvTD4uSMa/R9bKdpHGz5ZAOre6LrqFk+T6TVfEwlkep64MxvIR2AfPjimmHyJT9vRUhFL5xVnMOrIXb7tkpkdmGJDRyHoBmIX+b74r8ZS8XoZ0AKtvjWdMOeuGcWF/RmmYsmAg2++WAL0AgBCFIufyEVuNxQRolAz1AFOHSCr94FuUKhs8wvU0XdbisgiLuqCqSE2tQAOQYDOOHbRdtMNKtRtJdVKEFSsu49drCEf8XOYYDU26AoufXpprGDHmrebstiOCR85imp5awCL1+ZZPZbFVY8laFK/jkKL+CFvPjReTAlsfXDpWyfDzUArJvVsotdfX6oG4R1pu9BE8GaCFbvEydYOBg1fbakVF0jEC5jYvB+b9g6uV1qzqhczUcitnaKhqNkHHX0rYtoIY3prHcaLlxr/c+bsiJ/uRkaT2vlHcp0cjmqQXzGCSGoV+gvd+S8VQKZPtm5zQUDEEjgBditYgYv
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(186009)(451199024)(82310400011)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(336012)(26005)(2616005)(478600001)(8936002)(7696005)(47076005)(36860700001)(2906002)(83380400001)(8676002)(1076003)(41300700001)(70586007)(110136005)(70206006)(30864003)(6666004)(316002)(5660300002)(82740400003)(86362001)(36756003)(7636003)(426003)(356005)(40480700001)(40460700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 22:13:30.3241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fe8e69-7b3d-4e90-b36c-08dc1872b401
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5454
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

Add the NVreg_RegistryDwords command line parameter, which allows
specifying additional registry keys to be sent to GSP-RM.  This
allows additional configuration, debugging, and experimentation
with GSP-RM, which uses these keys to alter its behavior.

Note that these keys are passed as-is to GSP-RM, and Nouveau does
not parse them.  This is in contrast to the Nvidia driver, which may
parse some of the keys to configure some functionality in concert with
GSP-RM.  Therefore, any keys which also require action by the driver
may not function correctly when passed by Nouveau.  Caveat emptor.

The name and format of NVreg_RegistryDwords is the same as used by
the Nvidia driver, to maintain compatibility.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 275 ++++++++++++++++--
 2 files changed, 257 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index d1437c08645f..a19c1e9cc305 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -211,6 +211,12 @@ struct nvkm_gsp {
 		struct mutex mutex;;
 		struct idr idr;
 	} client_id;
+
+	/* A linked list of registry items. The registry object will be built from it. */
+	struct list_head registry_list;
+
+	/* The size of the registry RPC */
+	size_t registry_rpc_size;
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 9ee58e2a0eb2..b7a4c2749a55 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -54,6 +54,8 @@
 #include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
 
 #include <linux/acpi.h>
+#include <linux/ctype.h>
+#include <linux/parser.h>
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
 #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
@@ -1049,52 +1051,277 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rpc_wr(gsp, rpc, true);
 }
 
+struct registry_list_entry {
+	struct list_head list;
+	size_t name_len;
+	u32 type;
+	u32 data;
+	u32 length;
+	char name[];
+};
+
+/**
+ * add_registry -- adds a registry entry
+ * @name: name of the registry key
+ * @type: type of data (1 = integer)
+ * @data: value
+ * @length: size of data, in bytes
+ *
+ * Adds a registry key/value pair to the registry database.
+ *
+ * Currently, only 32-bit integers (type == 1, length == 4) are supported.
+ *
+ * This function collects the registry information in a linked list.  After
+ * all registry keys have been added, build_registry() is used to create the
+ * RPC data structure.
+ *
+ * registry_rpc_size is a running total of the size of all registry keys.
+ * It's used to avoid having to avoid an O(n) calculation of the total when
+ * the RPC is built.
+ *
+ * Returns 0 on success, or negative error code on error.
+ */
+static int add_registry(struct nvkm_gsp *gsp, const char *name, u32 type, u32 data, u32 length)
+{
+	struct registry_list_entry *reg;
+	size_t nlen = strlen(name) + 1;
+
+	/* Set an arbitrary limit to avoid problems with broken command lines */
+	if (strlen(name) > 64)
+		return -EFBIG;
+
+	reg = kmalloc(sizeof(struct registry_list_entry) + nlen, GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	memcpy(reg->name, name, nlen);
+	reg->name_len = nlen;
+	reg->type = type;
+	reg->data = data;
+	reg->length = length;
+
+	nvkm_debug(&gsp->subdev, "adding GSP-RM registry '%s=%u'\n", name, data);
+	list_add_tail(&reg->list, &gsp->registry_list);
+	gsp->registry_rpc_size += sizeof(PACKED_REGISTRY_ENTRY) + nlen;
+
+	return 0;
+}
+
+static int add_registry_num(struct nvkm_gsp *gsp, const char *name, u32 value)
+{
+	return add_registry(gsp, name, 1, value, sizeof(u32));
+}
+
+/**
+ * build_registry -- create the registry RPC data
+ * @registry: pointer to the RPC payload to fill
+ *
+ * After all registry key/value pairs have been added, call this function to
+ * build the RPC.
+ *
+ * The registry RPC looks like this:
+ *
+ * +-----------------+
+ * |NvU32 size;      |
+ * |NvU32 numEntries;|
+ * +-----------------+
+ * +---------------------+
+ * |PACKED_REGISTRY_ENTRY|
+ * +---------------------+
+ * |PACKED_REGISTRY_ENTRY|
+ * +---------------------+
+ * ... (one copy for each entry)
+ *
+ * +----------------------------------+
+ * |Null-terminated string for entry 0|
+ * +----------------------------------+
+ * |Null-terminated string for entry 1|
+ * +----------------------------------+
+ * ... (one copy for each entry)
+ *
+ * All memory allocated by add_registry() is released.
+ */
+static void build_registry(struct nvkm_gsp *gsp, PACKED_REGISTRY_TABLE *registry)
+{
+	struct registry_list_entry *reg, *n;
+	size_t str_offset;
+	unsigned int i = 0;
+
+	registry->numEntries = list_count_nodes(&gsp->registry_list);
+	str_offset = struct_size(registry, entries, registry->numEntries);
+
+	list_for_each_entry_safe(reg, n, &gsp->registry_list, list) {
+		registry->entries[i].type = reg->type;
+		registry->entries[i].data = reg->data;
+		registry->entries[i].length = reg->length;
+		registry->entries[i].nameOffset = str_offset;
+		memcpy((void *)registry + str_offset, reg->name, reg->name_len);
+		str_offset += reg->name_len;
+		i++;
+
+		list_del(&reg->list);
+		kfree(reg);
+	}
+
+	/* Double-check that we calculated the sizes correctly */
+	WARN_ON(gsp->registry_rpc_size != str_offset);
+
+	registry->size = gsp->registry_rpc_size;
+}
+
+/**
+ * clean_registry -- clean up registry memory in case of error
+ *
+ * Call this function to clean up all memory allocated by add_registry()
+ * in case of error and build_registry() is not called.
+ */
+static void clean_registry(struct nvkm_gsp *gsp)
+{
+	struct registry_list_entry *reg, *n;
+
+	list_for_each_entry_safe(reg, n, &gsp->registry_list, list) {
+		list_del(&reg->list);
+		kfree(reg);
+	}
+
+	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
+}
+
+MODULE_PARM_DESC(NVreg_RegistryDwords,
+		 "A semicolon-separated list of key=integer pairs of registry keys passed to GSP-RM");
+static char *NVreg_RegistryDwords;
+module_param(NVreg_RegistryDwords, charp, 0400);
+
 /* dword only */
 struct nv_gsp_registry_entries {
 	const char *name;
 	u32 value;
 };
 
+/**
+ * r535_registry_entries - required registry entries for GSP-RM
+ *
+ * This struct lists registry entries that are required for GSP-RM to
+ * function correctly.
+ *
+ * RMSecBusResetEnable - enables PCI secondary bus reset
+ * RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration
+ *   registers on any PCI reset.
+ */
 static const struct nv_gsp_registry_entries r535_registry_entries[] = {
 	{ "RMSecBusResetEnable", 1 },
 	{ "RMForcePcieConfigSave", 1 },
 };
 #define NV_GSP_REG_NUM_ENTRIES ARRAY_SIZE(r535_registry_entries)
 
+/**
+ * strip - strips all characters in 'reject' from 's'
+ * @s: string to strip
+ * @reject: string of characters to remove
+ *
+ * 's' is modified.
+ *
+ * Returns the length of the new string.
+ */
+static size_t strip(char *s, const char *reject)
+{
+	char *p = s, *p2 = s;
+	size_t length = 0;
+	char c;
+
+	do {
+		while ((c = *p2) && strchr(reject, c))
+			p2++;
+
+		*p++ = c = *p2++;
+		length++;
+	} while (c);
+
+	return length;
+}
+
+/**
+ * r535_gsp_rpc_set_registry - build registry RPC and call GSP-RM
+ * @gsp: gsp object
+ *
+ * The GSP-RM registry is a set of key/value pairs that configure some aspects
+ * of GSP-RM. The keys are strings, and the values are 32-bit integers.
+ *
+ * The registry is built from a combination if a static hard-coded list (see
+ * above) and entries passed on the driver's command line.
+ */
 static int
 r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 {
 	PACKED_REGISTRY_TABLE *rpc;
-	char *strings;
-	int str_offset;
-	int i;
-	size_t rpc_size = struct_size(rpc, entries, NV_GSP_REG_NUM_ENTRIES);
+	unsigned int i;
+	int ret;
 
-	/* add strings + null terminator */
-	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++)
-		rpc_size += strlen(r535_registry_entries[i].name) + 1;
+	INIT_LIST_HEAD(&gsp->registry_list);
+	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
 
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, rpc_size);
-	if (IS_ERR(rpc))
-		return PTR_ERR(rpc);
+	/* Add the required registry entries now */
+	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
+		ret = add_registry_num(gsp, r535_registry_entries[i].name,
+				 r535_registry_entries[i].value);
+		if (ret) {
+			clean_registry(gsp);
+			return ret;
+		}
+	}
 
-	rpc->size = sizeof(*rpc);
-	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
+	/*
+	 * The NVreg_RegistryDwords parameter is a string of key=value
+	 * pairs separated by semicolons. We need to extract and trim each
+	 * substring, and then parse the substring to extract the key and
+	 * value.
+	 */
+	if (NVreg_RegistryDwords) {
+		char *p = kstrdup(NVreg_RegistryDwords, GFP_KERNEL);
+		char *start, *next = p, *equal;
+		size_t length;
+
+		/* Remove any whitespace from the parameter string */
+		length = strip(p, " \t\n");
+
+		while ((start = strsep(&next, ";"))) {
+			long value;
+
+			equal = strchr(start, '=');
+			if (!equal || (equal == start) || !isdigit(equal[1])) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry string '%s'\n", start);
+				continue;
+			}
 
-	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
-	strings = (char *)&rpc->entries[NV_GSP_REG_NUM_ENTRIES];
-	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
-		int name_len = strlen(r535_registry_entries[i].name) + 1;
-
-		rpc->entries[i].nameOffset = str_offset;
-		rpc->entries[i].type = 1;
-		rpc->entries[i].data = r535_registry_entries[i].value;
-		rpc->entries[i].length = 4;
-		memcpy(strings, r535_registry_entries[i].name, name_len);
-		strings += name_len;
-		str_offset += name_len;
+			ret = kstrtol(equal + 1, 0, &value);
+			if (ret) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry value in '%s'\n", start);
+				continue;
+			}
+
+			/* Truncate the key=value string to just key */
+			*equal = 0;
+
+			ret = add_registry_num(gsp, start, value);
+			if (ret) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry key/value '%s=%lu'\n",
+					start, value);
+				continue;
+			}
+		}
+
+		kfree(p);
 	}
 
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, gsp->registry_rpc_size);
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	build_registry(gsp, rpc);
+
 	return nvkm_gsp_rpc_wr(gsp, rpc, false);
 }
 
-- 
2.34.1

