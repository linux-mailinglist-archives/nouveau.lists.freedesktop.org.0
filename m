Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1642CEF818
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 01:08:34 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 892C810E2F5;
	Sat,  3 Jan 2026 00:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UNHcVphi";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3B92A44C81;
	Sat,  3 Jan 2026 00:00:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767398428;
 b=GXFxbyTViTK9HjRhG+NcvCA807M3iG+gzcBqUxLrEb5lbKNrA1kDWaYBSWBf7oUeWPHb9
 /rVD4Y2HFbJHssqoeHOnNvnh/KTooII/8jQ8GU80YroVptcjeJEBZEA/Y91DexZTgmZF0u6
 00eSMm0ZtU+qbKgDJ24H9L0Dx0Z7LToZeDbEHWVlMJHlnoEOHshoTQh/glLGhcw3mwMSUbL
 Nz7G3IW81zAHsr57NTb2vT+UC0Py7mrTOEPlv3ro5Uaa4c+1H2TZ3Z4X4SWiPyjEUmiDjO9
 gbU5Y7qPEHlUDfYzG+DiFWM2GvJi7WvTyGiEIxR5CMGhaD7wBtSfA/fVQWuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767398428; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GXXjcpKbsQ7PkUgisjX+bHYjyZ3pPJNkZMMC0EVLMPQ=;
 b=BqBKaxBJ3a4V+RVz82HKu4azSdzFISr8Pn8xF2Nuws/fr/MuvgNmgnNgAanluX+yiyHTO
 GU2W/yKysYgmKjtMV/eGwdklSW+6WJvqN82Thhz4rLCXr2GofNf7d0fDvafjar0VJESMGig
 nWW6jmXCo5S3i5V09nj5D2kwe2DeSIr2Gx8AAJ9WqqCZlbhkxBuJAXJxvMYxvwovoNyXwXW
 W9NwlfAepFJVQsbcWfg5pTfKwiLRlTBfH7YhBVDM0hPL96FY6gdlffruEmpgXjOfTWYmtTY
 joEdXJPSnH+HPOgKskJXTa1YGgDnihd/e5W6Hp1OAWKf7DnqEmMIQKD9+dAg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8FBDB44C45
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 00:00:24 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012055.outbound.protection.outlook.com
 [40.93.195.55])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAEC10E2E6
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 00:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5zHLMWqrRsPtg6c8Loe8pEO45DE2G8PoDXlj6Get1MtzPhZ80fFh2sFFosqaEvzfajxa1NuAkp7h6T5WvM2R9V12s4amjusbGGUVQ9RGZUk/hRCLU2w/RSjnd8GUTcYoStj1mBIWO/ueZynBQl9xUNjvKuIFT+BOFXAMBCpHlngDPZIVxREAxy3xAsWs+36IUQHghgqw/9npN8pf+gfCh/lq8wPsV3qz/oJNDhuuNUxoQNXYN+/+8xHwRX4uoTtaawsaJEGBupOtOrXsVLj0hYQ0JO0r9qKbYmWVPWlISscTFtuo+0xwWe0SwQeRSIV7cI3lEuyhvvmweUfBVeu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXXjcpKbsQ7PkUgisjX+bHYjyZ3pPJNkZMMC0EVLMPQ=;
 b=OcCvpeMiVva/+TbekqwsuMO0cd6tBdHQexEFtGHug9+SnDEHtIKgqBtnUtXl9MtnymnXl80SvVO1uACB94VIj4bgNMWjXK5SFbcLC3WPGUg1XFA4czxmUCaJoI3YmSIbscxV35plTc2M4Wy/2qHyx+cH/dwYtkku34+vCblaHzWc3Cw2giVXBppjQoVyu3stfjk7Vlqhj0rarf+FGWRxQrL9pYfk4pD/R8x97Am+cbPWqZWCe0lIuUDKS7JHrH6UfqkmHMpvmy5cYJyeHaELyTMxT1GXQjmnbrlvqNfDtZVclVmR1uluQt+vXTjrPYBl8ievh4kHfzU9Zrfxef31iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXXjcpKbsQ7PkUgisjX+bHYjyZ3pPJNkZMMC0EVLMPQ=;
 b=UNHcVphiJQUIr3LoAruTZ5eJz5kIIVCv6KjmXEdHQAT/f2Qez7uUrdCrxXkB/o96v+Ajx/Qv/3RTYsNIpq1BuvFHjhjuajZwTW10+3C7TAyzUgFbvEpjcNs+yyRjdge3PSBsF+kmoDtVeW7iqQFOICiQFBV3wqgHFQJ5nfXaq75CIJ43XvQxco92f4F9XdUK5lRpegU2zUf0OPNkrEXMx1lOfDfw7O5W0Vf2x7bWB4mNCzaBE2YKdZgw1UL+WQqu7ukAyvnqzCvYEc2OmawBu0gAxOg2+hnbDz2PSU+IOaucli/AeLqjo2vxqhjy9LV4c8glf83Sn9JgJE35KfgFrg==
Received: from MW4PR03CA0238.namprd03.prod.outlook.com (2603:10b6:303:b9::33)
 by SA5PPF9BB0D8619.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 00:08:22 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:b9:cafe::e2) by MW4PR03CA0238.outlook.office365.com
 (2603:10b6:303:b9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 00:08:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 00:08:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 16:08:07 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 16:08:07 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: r535_gsp_msgq_recv_one_elem should not return
 its inputs
Date: Fri, 2 Jan 2026 18:07:56 -0600
Message-ID: <20260103000756.1002890-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|SA5PPF9BB0D8619:EE_
X-MS-Office365-Filtering-Correlation-Id: a942108e-f345-49ec-a293-08de4a5c34da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TDQpUSh+JbGrUkd8nCJ0Qv9UDlGz2N2FMu3byY5VmZKmLKywTUtpXetdNFrT?=
 =?us-ascii?Q?+L+siN4/vW3uPtsqD7ZRoDAu/5fYp+IhG+uB2vv7LZCrVxacUxw5CmhyNAH7?=
 =?us-ascii?Q?Dhra7JuBPzI9Ad+nV/o0maHLVJJ+Y6L7khO4sVDarU8SG4b7XEW35RNYGWN9?=
 =?us-ascii?Q?j0E8qKyQxgvOqOIvme9Rddk0Z75/lNyN2iNju+Iyek6nzV2HpZUeMyg1EZd2?=
 =?us-ascii?Q?RqbdjoVLvOj1pOT1fiuXw8YKLIqoWlguLlPcX5nWIhp+Pi7+5r2fuo1Rts0p?=
 =?us-ascii?Q?6nHXigcwY9C8VF/Gk8JY/RgtyWYjOAaFYcEMudK3tfdezyQ20vGsl1VQkJyx?=
 =?us-ascii?Q?JLXI6JtVlNuFmyj4Iw0CL4cFFz+ljmXsmFUUOusUTqHnFf0bmKOEAg3+iVuL?=
 =?us-ascii?Q?TnPvqjLjn1y7jWgXsNK9xRYIXCEWEZYwqi8Ta7xpuGovCpMNy06j/f25Zi8e?=
 =?us-ascii?Q?qRUTuxQ7YAbTquMjjwyR1rbCHlWgiaJovNczbzYC6SyF6BqmFsM71+4DZsuM?=
 =?us-ascii?Q?6hFENaWtj8J6QYDdYyElNVTE+6uQ6+h46PCnkES3VB3lM8Q5gFaHwZEJqnNE?=
 =?us-ascii?Q?w0/M/mDkDvqgPVnZk9qcF3BioGI7V/iCPrQy2fW2pNPbunGRSxfKLiCPiZc+?=
 =?us-ascii?Q?lXdTq42/a5nBGx0/Nn+J4kOaTQcC6xwpX6KDPV+ZF876U/JBT9Y3whMqqeuh?=
 =?us-ascii?Q?pwxk/WV1h+1L2OO0DXydvw7jHXmj+Q7d1/WoX3cEv8jeo8tZAIkkbBtJdXqs?=
 =?us-ascii?Q?fI5SsBvVsVtdfT7+i5cNxSpirdP0o/8/mIVGlZdX0L52ENUgzf+U68DVruUg?=
 =?us-ascii?Q?3jZhkAnTR04D5mpXNoPZrVsPmgC7loMQE7Q4cQJw7LZ4Z3Y1WZ0vJbtdE2dc?=
 =?us-ascii?Q?qArGa3hidDUkVWjQ5RQmPYlegJailvFkpyXaZgg3p2t+yTlwuM15UuS2oD8j?=
 =?us-ascii?Q?JLPHz/qGQmuakthUirRJG96LdEST86F0FarmPkOVrwIIv/QeyHkyJGMYwsT0?=
 =?us-ascii?Q?5wcO44S/iK2oOO5Nt+U3OTRj181B5ZDEqcafWib8birttek5smlCvqNMwInA?=
 =?us-ascii?Q?FlJrDV6TqvJbi+7IzUkaGBhFRnBMHbva/ynDxCeVCR6U6Kz5uUHzb/9R7/P+?=
 =?us-ascii?Q?qWzJbOU0HiwomhUgsXL6Wzc8/Hpv+h9y4bWPKXXRtMBU5MgvCIuwNFHQS9UE?=
 =?us-ascii?Q?otBIFNqA/gYWlT+z0HduRfV2awNBgpy0D4x7pPkRIg3OVun1lXOLuRolVp11?=
 =?us-ascii?Q?dBbtt55mqceemh5XWoiA88CqpEqX6VAvg73K93qZ4jhX2Y1QBpNEPZzLbOlt?=
 =?us-ascii?Q?FS1X97LwGS19rgc25KHbRQ6RB6/MweEFeaWHUTQK7f4XIoFpn+K0T0ePeH7W?=
 =?us-ascii?Q?iiScyuGgggMXVqaUFS6D9wRcOCbm7y0nwjmrtPELP87JUqMoT1BGeaqBlcKy?=
 =?us-ascii?Q?/bJ/aznu2qm7xPeMgi4DyMkxV4bkPHSehGXIOfUHmdfbYIbeZqDs1THIJcPj?=
 =?us-ascii?Q?zC6joNKfllKTwT5dlucB36KcrePK+LJdRaBqiCbQlJ+stTfQeapDbf8gGOUZ?=
 =?us-ascii?Q?7znz91zRVaA2yuDmk7I=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 00:08:21.6499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a942108e-f345-49ec-a293-08de4a5c34da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9BB0D8619
Message-ID-Hash: HWY4LEZMSK7KTLAA45LQJPOO7RYYIASQ
X-Message-ID-Hash: HWY4LEZMSK7KTLAA45LQJPOO7RYYIASQ
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HWY4LEZMSK7KTLAA45LQJPOO7RYYIASQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260103000756.1002890-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Change function r535_gsp_msgq_recv_one_elem() return an error code
instead of a pointer to the buffer that was passed as a parameter.

r535_gsp_msgq_recv_one_elem() takes a struct r535_gsp_msg_info as
one of its parameter.  This struct manages the receive buffer for
incoming messages from GSP, and includes a pointer to that buffer.
On success, this function returns that pointer.

This behavior results in callers treating the returned pointer as
a new value, even though it's already known to the caller.
For example:

	buf = kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
	info.gsp_rpc_buf = buf;
	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
	if (IS_ERR(buf)) {
		kvfree(info.gsp_rpc_buf);
		info.gsp_rpc_buf = NULL;

It's not obvious, but 'buf' does not actually change its value,
unless r535_gsp_msgq_recv_one_elem fails.  This is why the caller
cannot do kvfree(buf).

Instead, r535_gsp_msgq_recv_one_elem() now returns an error code,
and 'buf' never changes value.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 0dc4782df8c0..50bd8407180e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -229,7 +229,7 @@ struct r535_gsp_msg_info {
 static void
 r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl);
 
-static void *
+static int
 r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 			    struct r535_gsp_msg_info *info)
 {
@@ -243,7 +243,7 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 
 	ret = r535_gsp_msgq_wait(gsp, expected, info->retries);
 	if (ret < 0)
-		return ERR_PTR(ret);
+		return ret;
 
 	mqe = r535_gsp_msgq_get_entry(gsp);
 
@@ -254,7 +254,7 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 			nvkm_error(&gsp->subdev,
 				   "Not a continuation of a large RPC\n");
 			r535_gsp_msg_dump(gsp, rpc, NV_DBG_ERROR);
-			return ERR_PTR(-EIO);
+			return -EIO;
 		}
 	}
 
@@ -280,7 +280,7 @@ r535_gsp_msgq_recv_one_elem(struct nvkm_gsp *gsp,
 
 	mb();
 	(*gsp->msgq.rptr) = rptr;
-	return buf;
+	return 0;
 }
 
 static void *
@@ -292,6 +292,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 	struct r535_gsp_msg_info info = {0};
 	u32 expected = gsp_rpc_len;
 	void *buf;
+	int ret;
 
 	mqe = r535_gsp_msgq_get_entry(gsp);
 	rpc = (struct nvfw_gsp_rpc *)mqe->data;
@@ -307,11 +308,10 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 	info.retries = retries;
 	info.gsp_rpc_len = rpc->length;
 
-	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
-	if (IS_ERR(buf)) {
-		kvfree(info.gsp_rpc_buf);
-		info.gsp_rpc_buf = NULL;
-		return buf;
+	ret = r535_gsp_msgq_recv_one_elem(gsp, &info);
+	if (ret) {
+		kvfree(buf);
+		return ERR_PTR(ret);
 	}
 
 	if (expected <= max_rpc_size)
@@ -332,10 +332,10 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 		info.gsp_rpc_len = rpc->length;
 		info.continuation = true;
 
-		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
-		if (IS_ERR_OR_NULL(rpc)) {
+		ret = r535_gsp_msgq_recv_one_elem(gsp, &info);
+		if (ret) {
 			kvfree(buf);
-			return rpc;
+			return ERR_PTR(ret);
 		}
 
 		size = info.gsp_rpc_len - sizeof(*rpc);
-- 
2.51.0

