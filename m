Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695DD8A74A6
	for <lists+nouveau@lfdr.de>; Tue, 16 Apr 2024 21:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C28112E05;
	Tue, 16 Apr 2024 19:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ok+sbTew";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B2410F2C2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 19:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G3GLkfZULdKui5q7MKbHHpsuxtjFWv/1RQes0j8E/gj+79c9q/QN7VHGe+OisqDNX/h7Z7wllmM1ZPE4QVa11xTpmb5dZniiy1F+sEFHPFpddxu6mu088+vdl4rQfZbU7axSoz6OOJ9LTmvzdFBut3Fy+2z4G2/YtdDxKPQ9YEjY1N9Q7/1ei9nAMNtsWkvxwNalVFn0pq+fxMGMrBnTs7TDta6QSCC6HOuOj3IdC+KrBAa3dWyoXbUHhJ4NQpb5YVQF6gJV3J7M5+0LfV8o2Y/2049zFVQSYCQocM0eVCSjVFoAm9J2Y215pG7TaTxp/fcCzSCQ9oezoH7swY4xAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+9uuehIs6tztxP2H10/1+GocRaGEgtyh7NxYI2lIVk=;
 b=dQGrxwMzVC7yT30tP1VVB3unKucEoETYMBhVL1ffY83ems7Ukc33IZN2EtNTZaBx/85yiSCydI2Mj+qmvKsEFIhYO0j8Kn2U9Kvob5j2UoPdr4ZYptMepUqdfRA+WoN0MsfFNG6jkJ3IWtM74UTOA3G1rDS00LlgzWifAUQUNb4cc9Tv5lYB4Yrnz/QzNjg+Z2BBUFetCwaKCICjCsbemt3CjZdsoPNTmkRd+3aY9ngBWJw2L/4IIiHaDtjgK0DQoZGyxSIVo11mddTYtJc1XRZdownE9V/zFdatwlexA3PstB43RL6CQ0wIm79s0aWfIST4/VcFEgrRYvBQE28p6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+9uuehIs6tztxP2H10/1+GocRaGEgtyh7NxYI2lIVk=;
 b=ok+sbTewO0Kt+/q0RRV1HDMPfta7dDUaImY5iLWibrrTZUMdb6GoUYBB1xXSbFdz+H60Y4CNIRk8rdWD7ysMk8+ALFZkPZY+UNO/v1bKsCXb1zbf46YM6K1KOVBkxIR1honZh1AJIy3GEOvCw9m6Z5Gl1VYArohgUpOpEOtmlYCMKVryJ0MzXxUATlHaaJQIPVczP/0gYUSE8Uvhq0EuVLovALNEfxiLqTiMDQ9M6/Xs3z2fSkBmaiDE3gdFFimqd4Xyr333IoqmVx2S+N9eLMKZMxg1n2fcLVh155I6SHn+zS0Gh1qwy8x1VCU5agjsa5HSXkmD7c3iJFlgR0GYyg==
Received: from PR0P264CA0213.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::33)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 19:27:39 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10a6:100:1f:cafe::ab) by PR0P264CA0213.outlook.office365.com
 (2603:10a6:100:1f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 19:27:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 19:27:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 12:27:22 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 12:27:21 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, "Dave
 Airlie" <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] [v6] nouveau: add command-line GSP-RM registry support
Date: Tue, 16 Apr 2024 14:27:10 -0500
Message-ID: <20240416192710.3399006-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 9918db5f-1eb1-4019-4b78-08dc5e4b4630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +duLLgkSjJ5Q+Fr4hhFRdbabWS9ayhon6bDxr0OZD2nZMSjelJbvk45LJ/7Nf+pSbpgVY9Lo/vWxAUv2yYyR9jFzWz6oPvE1fIWGIka9IP2/4Bx6IuTxn87IvgrdkUlAbMtpOu7GuE2vQ2rcGos7hpVmBrv14YtPVcN2R6LjYDaHawahdo6sC3gkCknIO/Zm6o5msNO48MLkHCaUl0Xr4TrFiol4Pi+pxM1Gb2elccL3Dl1ekAwDVlG0jchVXWlb9UMXWbdvTGu8YDd3tzBvAMYEda4EFR6+ZrlJsduZIG/NUMLzLHEFDTBWa9YcOSncJVEZgTZNZ8kKPVmJQBTPPVMaXi2Pp2YSOYY4qRBeD2epZOXTkrmkLuXvNGIuAANGWu4gk4cGmMskUI1Tuf4dvI7bh++FPxE+Jm3X8zhBnvPCtza7rfizXzf0y1Cr442lA/RYvQk7BCPeb+UH6c5t1iCDR5udntPmMIxM4xgnZAoDHWf1lRS+v3RmAQmAzHJfVrbgU+x1UL0tW+ph//cRUJWc1kn8fSYXNe9Kb+7wK17rHlRlCwsaBgCRXgBzR3eF7CaSR8WRWep4J0guh5KzV0bHsYFitWcYUKi4eY5KrNHFZwjg4Wdomrt7yNYt61hEC9TRBNPVkbExAaxkwCSYAfLKnqcoV4W0FvH4t3TlvUDm2o3a94dq/eppEK+2Gjxj5P14nbv97wyHTF+XaeZCqbfvxB9L+VSyYTRb/wFUOj71TA1PqxFpaeON8QJVuQYX
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 19:27:37.1489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9918db5f-1eb1-4019-4b78-08dc5e4b4630
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927
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

Notes:
    v6:
    Remove __counted_by on registry_list_entry.key
    Return -EINVAL instead of -EFBIG
    Fix wrong value for registry->entries[i].length
    Use vlen instead of length
    Update several comments

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   6 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 355 ++++++++++++++++--
 2 files changed, 337 insertions(+), 24 deletions(-)

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
index 9858c1438aa7..019d8bf2fe12 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -54,6 +54,8 @@
 #include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
 
 #include <linux/acpi.h>
+#include <linux/ctype.h>
+#include <linux/parser.h>
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
 #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
@@ -1080,51 +1082,356 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rpc_wr(gsp, rpc, true);
 }
 
+enum registry_type {
+	REGISTRY_TABLE_ENTRY_TYPE_DWORD  = 1, /* 32-bit unsigned integer */
+	REGISTRY_TABLE_ENTRY_TYPE_BINARY = 2, /* Binary blob */
+	REGISTRY_TABLE_ENTRY_TYPE_STRING = 3, /* Null-terminated string */
+};
+
+/* An arbitrary limit to the length of a registry key */
+#define REGISTRY_MAX_KEY_LENGTH		64
+
+/**
+ * registry_list_entry - linked list member for a registry key/value
+ * @head: list_head struct
+ * @type: dword, binary, or string
+ * @klen: the length of name of the key
+ * @vlen: the length of the value
+ * @key: the key name
+ * @dword: the data, if REGISTRY_TABLE_ENTRY_TYPE_DWORD
+ * @binary: the data, if TYPE_BINARY or TYPE_STRING
+ *
+ * Every registry key/value is represented internally by this struct.
+ *
+ * Type DWORD is a simple 32-bit unsigned integer, and its value is stored in
+ * @dword.
+ *
+ * Types BINARY and STRING are variable-length binary blobs.  The only real
+ * difference between BINARY and STRING is that STRING is null-terminated and
+ * is expected to contain only printable characters.
+ *
+ * Note: it is technically possible to have multiple keys with the same name
+ * but different types, but this is not useful since GSP-RM expects keys to
+ * have only one specific type.
+ */
+struct registry_list_entry {
+	struct list_head head;
+	enum registry_type type;
+	size_t klen;
+	char key[REGISTRY_MAX_KEY_LENGTH];
+	size_t vlen;
+	u32 dword;			/* TYPE_DWORD */
+	u8 binary[] __counted_by(vlen);	/* TYPE_BINARY or TYPE_STRING */
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
+	const size_t nlen = strnlen(key, REGISTRY_MAX_KEY_LENGTH) + 1;
+	size_t vlen; /* value length, non-zero if binary or string */
+
+	if (nlen > REGISTRY_MAX_KEY_LENGTH)
+		return -EINVAL;
+
+	vlen = (type == REGISTRY_TABLE_ENTRY_TYPE_DWORD) ? 0 : length;
+
+	reg = kmalloc(sizeof(*reg) + vlen, GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	switch (type) {
+	case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
+		reg->dword = *(const u32 *)(data);
+		break;
+	case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
+	case REGISTRY_TABLE_ENTRY_TYPE_STRING:
+		memcpy(reg->binary, data, vlen);
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
+ * +----------------------------------------+
+ * |PACKED_REGISTRY_ENTRY                   |
+ * +----------------------------------------+
+ * |Null-terminated key (string) for entry 0|
+ * +----------------------------------------+
+ * |Binary/string data value for entry 0    | (only if necessary)
+ * +----------------------------------------+
+ *
+ * +----------------------------------------+
+ * |PACKED_REGISTRY_ENTRY                   |
+ * +----------------------------------------+
+ * |Null-terminated key (string) for entry 1|
+ * +----------------------------------------+
+ * |Binary/string data value for entry 1    | (only if necessary)
+ * +----------------------------------------+
+ * ... (and so on, one copy for each entry)
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
+		registry->entries[i].length = reg->vlen;
+
+		/* Append the key name to the table */
+		registry->entries[i].nameOffset = str_offset;
+		memcpy((void *)registry + str_offset, reg->key, reg->klen);
+		str_offset += reg->klen;
+
+		switch (reg->type) {
+		case REGISTRY_TABLE_ENTRY_TYPE_DWORD:
+			registry->entries[i].data = reg->dword;
+			break;
+		case REGISTRY_TABLE_ENTRY_TYPE_BINARY:
+		case REGISTRY_TABLE_ENTRY_TYPE_STRING:
+			/* If the type is binary or string, also append the value */
+			memcpy((void *)registry + str_offset, reg->binary, reg->vlen);
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
+	for (i = 0; i < NV_GSP_REG_NUM_ENTRIES; i++) {
+		ret = add_registry_num(gsp, r535_registry_entries[i].name,
+				       r535_registry_entries[i].value);
+		if (ret) {
+			clean_registry(gsp);
+			return ret;
+		}
+	}
 
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
+			if (!equal || equal == start || equal[1] == 0) {
+				nvkm_error(&gsp->subdev,
+					   "ignoring invalid registry string '%s'\n",
+					   start);
+				continue;
+			}
 
-	str_offset = offsetof(typeof(*rpc), entries[NV_GSP_REG_NUM_ENTRIES]);
-	strings = (char *)rpc + str_offset;
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
+			/* Truncate the key=value string to just key */
+			*equal = 0;
+
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
+					   "ignoring invalid registry key/value '%s=%s'\n",
+					   start, equal + 1);
+				continue;
+			}
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

