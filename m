Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F385CA49
	for <lists+nouveau@lfdr.de>; Tue, 20 Feb 2024 22:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9BE10E2CB;
	Tue, 20 Feb 2024 21:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eIEO1BYB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D9C10E2CB
 for <nouveau@lists.freedesktop.org>; Tue, 20 Feb 2024 21:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAWhcmn1BEe/dXYuBVZYKUsR223IhzzW28bhTvCQQxOb/FPcF6b80yDDCIubJBvuu2KDAfq816BV4r98607m5x+LL3+G2Nw4RhWwAsF+YNMgWxOIuir4g+j/ZbL2jKC+MlTq5Mp3wo7cZx9QVESvlmSpqF/LJwSoh83cDmwM22QXEfgnOO7BpR4J1DPpd5FO9dJV/0TfgYnosUgJ5DXesA01uyYTQ7kUbVMFh4mNSi9RaTjMWRvDGfbbw7XFhOcIq7dyV4qMni+GXxRvS/W8/hjxLiAeORZzhV8Ksk51O+TDBfILaVKxJPsjzeptpIXpHFn5bdQNmXNR9aGhLT90UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHZUgRPZE8SluUhDfCzh5esyWSLgjXJ9T1c7MNQsiTQ=;
 b=OxsjUyG9LCCq+Hq2VhpwWVZHaT2hC+JDYDqujqaoJ1PCvo1Jhb0p25VZCX2OgoRVe05xnB8niyV2uZT9HWmBr7EAGXzggAkYtGW/xpACIC/bYkq80S5sAaESG5PwB4ZI5wky26CK5nx9+PdinWLv7NRWO+2xnzNQ5oCQM9wvb36C8+rlsZci1INiGeDi8MvcNgz+AH5F8PqKaAl9e+EOUOLSjXD7Kw/QT/jZ/wMdCy77v4NDjQRqHwV4gxrN3WE+eJpnyMxMfJ3D7P6/Bt56As539RzSTwf35xilnTsTwmnP29aXLlF8IRr1QXPZPlDFGC//8200rOuwB61YMEuUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHZUgRPZE8SluUhDfCzh5esyWSLgjXJ9T1c7MNQsiTQ=;
 b=eIEO1BYBvRCPgWcFviuiyK0Mxd1x0f1vOA/5x62JhXbVyQRqs3WYF+Ug+ZjL/SLnsUOE2V70xaghJDBUmZ47lvg8AZTae13eoFf9FDHQC9/Q4f2CI4EXL66sumtyMxrASsX4VXcAQl+ynOoTbtywv3z49mq9+15mUzChzjL7DYKyrwV8S81vxaDn70sa6G/eXU+AYd3DhRfz5lN74WzwuDLDttXKlowq89YQFzk9eMvv33oyP/w0+ef1KAx2pB40oLhYvmDWE1zqjuSpD1feI3yk0ofgXJhWGqcB/b6Eo2PUNO0uSGfhXjuzfzABCr6dLv0TiFgFSnSFMsdI5Nuhyw==
Received: from CH5P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::26)
 by BL1PR12MB5318.namprd12.prod.outlook.com (2603:10b6:208:31d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 21:58:27 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::8c) by CH5P223CA0012.outlook.office365.com
 (2603:10b6:610:1f3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39 via Frontend
 Transport; Tue, 20 Feb 2024 21:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 21:58:27 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 13:58:11 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 13:58:11 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1258.12 via Frontend Transport;
 Tue, 20 Feb 2024 13:58:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] [v4] nouveau: add command-line GSP-RM registry support
Date: Tue, 20 Feb 2024 15:58:05 -0600
Message-ID: <20240220215805.3201094-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|BL1PR12MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: dfcedf7c-4046-4ed8-fe6d-08dc325f118c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZOVjHxn4q/H+SmebRnk2nwvtm/T93087vxD48tLKoaeYPhjkTowK+Db4uvnJADkQQwBOlU1Uk2D5YzgMTTgMW+gauxUfu6U/E3IZH5kqx7dS4ZuaIZS3OpJ4OAOdPIGTM6aBMubpXZ6WlbYqyz3LrVOspkFiejulZ+4h7frER5xSPKI/h8Q3Oq0fBTEtqtlN0cIFIYUaMhLKa15qm7xS86KFhv0vBWqXTMA45zgqjPzOgbKUto8BqNZ8iV0netj+Rr41rQ/880lg0uahot9mUWAuNZZ7Iuu+0YWkhMgMd7iKxww+086w+tn2bx+9ZqqzLeEnrWju7/ACQYppAh6+iXJIsYqwqW2tBAP7ZNwtis4ohzuyP/p62DgTmUDq0+i6uxLlZw+b8J1fmA6cXmgat9z4TGPDD/46EVsJNsZlLEvO5WyoOhpXnVLQA/c9OekYv18lDF2Hd8/5A/8zH9kdr4+HNAzJxN16ybmNReqpWMB8ZjjH0FE60CGmcfyC/aBxA+VuHK1Qu3pxM4r7NVR7dCfTZKibRAwZgv98/XF98a/WLgESPE6RHTwD0qoCNUUGV39QwZ6F0s9/7u5GoQBLab79iL8AwgSrmRovEepRwKGrFiAe1mGoRQErXXFQG0TivuJvKZ23XlTVCgH3eothjO5AQYg6XLl9BQJhuPjWhs=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 21:58:27.5315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfcedf7c-4046-4ed8-fe6d-08dc325f118c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5318
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
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 375 ++++++++++++++++--
 2 files changed, 357 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 6f5d376d8fcc..3fbc57b16a05 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -211,6 +211,12 @@ struct nvkm_gsp {
 		struct mutex mutex;;
 		struct idr idr;
 	} client_id;
+
+	/* A linked list of registry items. The registry RPC will be built from it. */
+	struct list_head registry_list;
+
+	/* The size of the registry RPC */
+	size_t registry_rpc_size;
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 1c46e3f919be..40757a21e150 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -54,6 +54,8 @@
 #include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
 
 #include <linux/acpi.h>
+#include <linux/ctype.h>
+#include <linux/parser.h>
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
 #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
@@ -1082,51 +1084,376 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rpc_wr(gsp, rpc, true);
 }
 
+enum registry_type {
+	REGISTRY_TABLE_ENTRY_TYPE_DWORD  = 1, /* 32-bit unsigned integer */
+	REGISTRY_TABLE_ENTRY_TYPE_BINARY = 2, /* Binary blob */
+	REGISTRY_TABLE_ENTRY_TYPE_STRING = 3, /* Null-terminated string */
+};
+
+/**
+ * registry_list_entry - linked list member for a registry key/value
+ * @head: list_head struct
+ * @type: dword, binary, or string
+ * @klen: the length of name of the key
+ * @vlen: the length of the value
+ * @v.dword: the data, if REGISTRY_TABLE_ENTRY_TYPE_DWORD
+ * @v.binary: the data, if TYPE_BINARY or TYPE_STRING
+ * @key: the key name
+ *
+ * Every registry key/value is represented internally by this struct.
+ *
+ * Type DWORD is a simple 32-bit unsigned integer, and its value is stored in
+ * v.dword.
+ *
+ * Types BINARY and STRING are variable-length binary blobs.  The only real
+ * difference between BINARY and STRING is that STRING is null-terminated and
+ * is expected to contain only printable characters.
+ *
+ * To avoid having to kmalloc multiple objects, the value for BINARY and
+ * STRING is appended after the key[] in memory, and v.binary just points to
+ * that block.
+ *
+ * Note: it is technically possible to have multiple keys with the same name
+ * but different types, but this is not useful since GSP-RM expects keys to
+ * have only one specific type.
+ */
+struct registry_list_entry {
+	struct list_head head;
+	enum registry_type type;
+	size_t klen;
+	size_t vlen;
+	union {
+		u32 dword;	/* TYPE_DWORD */
+		void *binary;	/* TYPE_BINARY or TYPE_STRING */
+	} v;
+	char key[] __counted_by(klen);
+};
+
+/**
+ * add_registry -- adds a registry entry
+ * @gsp: gsp pointer
+ * @key: name of the registry key
+ * @type: type of data
+ * @data: pointer to value
+ * @length: size of data, in bytes
+ *
+ * Adds a registry key/value pair to the registry database.
+ *
+ * This function collects the registry information in a linked list.  After
+ * all registry keys have been added, build_registry() is used to create the
+ * RPC data structure.
+ *
+ * registry_rpc_size is a running total of the size of all registry keys.
+ * It's used to avoid an O(n) calculation of the size when the RPC is built.
+ *
+ * Returns 0 on success, or negative error code on error.
+ */
+static int add_registry(struct nvkm_gsp *gsp, const char *key,
+			enum registry_type type, const void *data, size_t length)
+{
+	struct registry_list_entry *reg;
+	size_t nlen = strlen(key) + 1;
+	size_t vlen; /* value length, non-zero if binary or string */
+
+	/* Set an arbitrary limit to avoid problems with broken command lines */
+	if (nlen > 64)
+		return -EFBIG;
+
+	vlen = (type == REGISTRY_TABLE_ENTRY_TYPE_DWORD) ? 0 : length;
+
+	reg = kmalloc(sizeof(struct registry_list_entry) + nlen + vlen, GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	switch (type) {
+	case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
+		reg->v.dword = *(const u32 *)(data);
+		nvkm_debug(&gsp->subdev, "adding GSP-RM registry '%s=%u'\n",
+			   key, reg->v.dword);
+		break;
+	case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
+	case REGISTRY_TABLE_ENTRY_TYPE_STRING:
+		reg->v.binary = (void *)&reg->key + nlen;
+		memcpy(reg->v.binary, data, length);
+		vlen = length;
+		if (type == REGISTRY_TABLE_ENTRY_TYPE_BINARY)
+			nvkm_debug(&gsp->subdev,
+				   "adding GSP-RM registry '%s' blob of %zu bytes\n",
+				   key, length);
+		else
+			nvkm_debug(&gsp->subdev,
+				   "adding GSP-RM registry string '%s=%s'\n",
+				   key, (char *)reg->v.binary);
+		break;
+	default:
+		nvkm_error(&gsp->subdev, "unrecognized registry type %u for '%s'\n",
+			   type, key);
+		kfree(reg);
+		return -EINVAL;
+	}
+
+	memcpy(reg->key, key, nlen);
+	reg->klen = nlen;
+	reg->vlen = length;
+	reg->type = type;
+
+	list_add_tail(&reg->head, &gsp->registry_list);
+	gsp->registry_rpc_size += sizeof(PACKED_REGISTRY_ENTRY) + nlen + vlen;
+
+	return 0;
+}
+
+static int add_registry_num(struct nvkm_gsp *gsp, const char *key, u32 value)
+{
+	return add_registry(gsp, key, REGISTRY_TABLE_ENTRY_TYPE_DWORD,
+			    &value, sizeof(u32));
+}
+
+static int add_registry_string(struct nvkm_gsp *gsp, const char *key, const char *value)
+{
+	return add_registry(gsp, key, REGISTRY_TABLE_ENTRY_TYPE_STRING,
+			    value, strlen(value) + 1);
+}
+
+
+/**
+ * build_registry -- create the registry RPC data
+ * @gsp: gsp pointer
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
+ * +----------------------------------------+
+ * |Null-terminated key (string) for entry 0|
+ * +----------------------------------------+
+ * |Binary/string data value for entry 0    | (only if necessary)
+ * +----------------------------------------+
+ * |Null-terminated key (string) for entry 1|
+ * +----------------------------------------+
+ * |Binary/string data value for entry 1    | (only if necessary)
+ * +----------------------------------------+
+ * ... (one copy for each entry)
+ *
+ *
+ * The 'data' field of an entry is either a 32-bit integer (for type DWORD)
+ * or an offset into the PACKED_REGISTRY_TABLE (for types BINARY and STRING).
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
+	list_for_each_entry_safe(reg, n, &gsp->registry_list, head) {
+		registry->entries[i].type = reg->type;
+		registry->entries[i].length = reg->klen;
+
+		/* Copy the key name to the table */
+		registry->entries[i].nameOffset = str_offset;
+		memcpy((void *)registry + str_offset, reg->key, reg->klen);
+		str_offset += reg->klen;
+
+		switch (reg->type) {
+		case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
+			registry->entries[i].data = reg->v.dword;
+			break;
+		case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
+		case REGISTRY_TABLE_ENTRY_TYPE_STRING:
+			/* If the type is binary or string, copy the value */
+			memcpy((void *)registry + str_offset, reg->v.binary, reg->vlen);
+			registry->entries[i].data = str_offset;
+			str_offset += reg->vlen;
+			break;
+		default:
+		}
+
+		i++;
+		list_del(&reg->head);
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
+ * @gsp: gsp pointer
+ *
+ * Call this function to clean up all memory allocated by add_registry()
+ * in case of error and build_registry() is not called.
+ */
+static void clean_registry(struct nvkm_gsp *gsp)
+{
+	struct registry_list_entry *reg, *n;
+
+	list_for_each_entry_safe(reg, n, &gsp->registry_list, head) {
+		list_del(&reg->head);
+		kfree(reg);
+	}
+
+	gsp->registry_rpc_size = sizeof(PACKED_REGISTRY_TABLE);
+}
+
+MODULE_PARM_DESC(NVreg_RegistryDwords,
+		 "A semicolon-separated list of key=integer pairs of GSP-RM registry keys");
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
+ * This array lists registry entries that are required for GSP-RM to
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
+ * @gsp: gsp pointer
+ *
+ * The GSP-RM registry is a set of key/value pairs that configure some aspects
+ * of GSP-RM. The keys are strings, and the values are 32-bit integers.
+ *
+ * The registry is built from a combination of a static hard-coded list (see
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
+	/* Add the required registry entries first */
+	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
+		ret = add_registry_num(gsp, r535_registry_entries[i].name,
+				 r535_registry_entries[i].value);
+		if (ret) {
+			clean_registry(gsp);
+			return ret;
+		}
+	}
+
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
+			if (!equal || (equal == start) || (equal[1] == 0)) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry string '%s'\n", start);
+				continue;
+			}
 
-	rpc->numEntries = NV_GSP_REG_NUM_ENTRIES;
+			/* Truncate the key=value string to just key */
+			*equal = 0;
 
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
+			if (!ret) {
+				ret = add_registry_num(gsp, start, value);
+			} else {
+				/* Not a number, so treat it as a string */
+				ret = add_registry_string(gsp, start, equal + 1);
+			}
+
+			if (ret) {
+				nvkm_error(&gsp->subdev,
+					"ignoring invalid registry key/value '%s=%s'\n",
+					start, equal + 1);
+				continue;
+			}
+
+
+		}
+
+		kfree(p);
 	}
-	rpc->size = str_offset;
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY, gsp->registry_rpc_size);
+	if (IS_ERR(rpc)) {
+		clean_registry(gsp);
+		return PTR_ERR(rpc);
+	}
+
+	build_registry(gsp, rpc);
 
 	return nvkm_gsp_rpc_wr(gsp, rpc, false);
 }
-- 
2.34.1

