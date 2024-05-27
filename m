Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2578D11F5
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F227710F309;
	Tue, 28 May 2024 02:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IWH7RUiL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8305E10F684
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAiTRYLeZYFlRlX92OZsHIpTgDEgduloIGXPdshY+D3yrWCB3tAnLrzU6WCLF4udalidfUVd5dx/sqQXQ/dvCW556EnCk5rYL6IfVRLSyOnS/zWJK5RLRlIMpVOu6j33iaeVC8DjojwZuPkUVZejibaDTvERWc7eu9qdVWVb/ITWOTVYEqPBZ9hjb0w3yARhXPDL7mns8gAaBtjgJgbmth68rUfWXU0F/ZOwJ8uWFIMh/MR+7GP2OSr4oKAkCXotYnca5GQYyP20UPASCcE+tTvj2+D0QNHyu3gkBp6LOEPl7SYuiLjRMQQPgRCkstYkqZ3/JKuN/cLG3zYfN1xxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6ViXAEjnalPJEcvSSh0UdzurKw0SdcZNrvr6SYiLTY=;
 b=f/Mh1/8Qvcb0Dxv9L5rwQ6GubWJvcqwlWtn9qRGBTXdOLOfJ8QVFDYbIPAMnUs+BVNuRMyJhQTKBHVVUGyK7ApYRdLi0n0sGNzK8IVc/3Lcsr+YpVcxZxS3fEPS8hKOV3M8PInhpKZwt5FzDW2Hn3l4D1wnsF8/zhO1Oro3ByAW7nPeieYaygQ0Ph7smAUcmxXwttbZJ1/1622Le/V8sNxFDgOCmeLF23lwWjH9+MdEhzxxJMHgtCJzRgWqIDHdD09PIMCiRUsOqvExvFrG19kQYyyBGIJHBovlJdbyX13C3lOCuUTeslwsHNc8WjLW0aeo3sl8HfWKKjf7o0mRkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6ViXAEjnalPJEcvSSh0UdzurKw0SdcZNrvr6SYiLTY=;
 b=IWH7RUiLg9Xlpx0Q9G3PoQ0M8QqPMjp4KHfUb0e+5tgXD6ufHrStrHRw4GL58lyguRvwYe8INmERwVEkO5fjVfS0asayIZrlIjkBJrPjvUtn84A34+4uVbRffv8LJa+9h4W33rEBFMnd97EFzwalOfxV+rUyQ9ReJPJ37ZAwYDhLN8nGfSLGeSq6XpehJWc3/K6Sq1Ak6cEI2Ook6W5eo6DVVT8v37jQ1EY/fPIFb74Uw1t0nMDudep84AZn1rUdvhbpIzLx4y21hto+RdF5nTyxIWUwGR9t53U5YdCFi5BsuBAiLA/u9io3D062qqwmR5sUCGs2Ntnhv+MgCgoK5g==
Received: from SJ0PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:33f::22)
 by CH2PR12MB4231.namprd12.prod.outlook.com (2603:10b6:610:7d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:13 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::bb) by SJ0PR05CA0047.outlook.office365.com
 (2603:10b6:a03:33f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:23:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:02 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 10/34] drm/nouveau/nvkm: remove nvkm_client_search()
Date: Tue, 28 May 2024 00:19:35 +1000
Message-ID: <20240527141959.59193-11-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|CH2PR12MB4231:EE_
X-MS-Office365-Filtering-Correlation-Id: c29593ff-6094-4b14-f70b-08dc7ebd2008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kz3shvvcRoe+vbqOedMQG8VIneei5bc5f/lLMp5QTBHirDKfvmrHSsLjGkC9?=
 =?us-ascii?Q?pt5zY+Ci4bsSIV23R/wfK5JUp7fa6I4oUOu4Gem7EqKAEAsFJp2oRs0Merx1?=
 =?us-ascii?Q?+2rgE4J+sUsx5N5iAlq6Yl+tL/cO6dV49OesR6PTF0c3P0Bx/WU7n5RwJtFO?=
 =?us-ascii?Q?XqcJbSwEdHHC9vteI1zadNwMUEwSETMIjcb2JbQB5dArCOyTLgonxcmmxz7f?=
 =?us-ascii?Q?nbyKxBLLvxOI5sRUDgFdjh5VE8233/pZNYTKOVFTYUpbGrSpkCMRd7gr4Dcs?=
 =?us-ascii?Q?Bgxcn4cNSTEINkM0Ig7D4ARLcqM1nS663u8jGe/ayvpM8aJ+0a8TbhfiGemg?=
 =?us-ascii?Q?wLyDsUUsbUgg+RU2OgnHDOypQiZnBmhPgdXqMQuYFmHKveD+U+qHY0PpXpLd?=
 =?us-ascii?Q?oi65QhxsXD+KI6FpQ5Sz1Pi7mVjEh5XoXL+Fd/aTmidzkld1Cuxl2sTDl+Gl?=
 =?us-ascii?Q?OZxS26xyE8LNvvZdlBY41d29C/5CVKeHNPgCoTDyRyfwtPmU5OKgRzinthyq?=
 =?us-ascii?Q?7PQ4QphOQK17sfihpdflm74AecJbECVR2tXwbM+EJK+9uqc9R21BYVGnCZVS?=
 =?us-ascii?Q?97k24X0MTacccXZ0dK48pxhXcghzMBrJB10K3Fks7E3DmaNa/HMOSblCkLch?=
 =?us-ascii?Q?xQGyS0g+Re2bsZSzeMF8fxSYXS6+buSNG1J2TqEqs97lhjKNfVL4K0aeDLr/?=
 =?us-ascii?Q?GGPZBpggomlIHT2IzJS2EFvChO+1Q5AbWE8RbirOlo6dOi4jn0B9NEuc5MU1?=
 =?us-ascii?Q?OaEs9zlx1UvXR2F1C5cIBNcT5jWk1lIPI0PktDkZPSOnO7SVLLHHvnmVvlkG?=
 =?us-ascii?Q?8Q/jC1QCEIduH+e+6FBo21TCm0bld0zX3aVA68bIj88v/fLD5oTshlv6b6VA?=
 =?us-ascii?Q?yZZgNCxN7htngbndD4HS73I2KtysefBlZTD8BhNtV+8IafUolHS912dIZvn6?=
 =?us-ascii?Q?7rwtehIEuMaBs7W1r31ukPD0y3ZHyyofOsmf/N8VbCDZhZJQJVxOYnWgm3ox?=
 =?us-ascii?Q?JfkcjIWdzPRdKdiE9JuyPB6To7yrF71kl4nLsazfoirnFuFERkOk8Fvqjvrb?=
 =?us-ascii?Q?TAeMlq4IfYMCXuzIxKP6h/Y9xQoa9WKc/bM6s70Y/hV++dz7752GFUgFmgPL?=
 =?us-ascii?Q?vEiVb3BU5dMqRI9AqXg9zjY0oTTNSlsK3r/Gvrjrwn+eMsS5wtTOyKl7S/XV?=
 =?us-ascii?Q?gFYEK2ReWFyoZ/lANkHUGgOjxttB12MU3lQvN1d1xxmaWlPjJg68jFxZwixu?=
 =?us-ascii?Q?n/m5IcSYWxi6L7Rr6GD1BDy53ZPDAYS4QFUtO3lWaE8N0dxrLvTbE3//o7H1?=
 =?us-ascii?Q?xlGKivyjsG+RKQUoMoVqDlwIGkeCcoETHMrEYPzEu216efim4MivCpUfCTHJ?=
 =?us-ascii?Q?c1lt5afi2TA7tgsop8dlEyaxBGmo?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:12.9894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c29593ff-6094-4b14-f70b-08dc7ebd2008
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231
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

Has been unused for a while now.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/client.h |  1 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c         | 13 -------------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index 932c9fd0b2d8..15f27fdd877a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -22,7 +22,6 @@ struct nvkm_client {
 
 int  nvkm_client_new(const char *name, u64 device, const char *cfg, const char *dbg,
 		     int (*)(u64, void *, u32), struct nvkm_client **);
-struct nvkm_client *nvkm_client_search(struct nvkm_client *, u64 handle);
 
 /* logging for client-facing objects */
 #define nvif_printk(o,l,p,f,a...) do {                                         \
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index c55662937ab2..48416c5039a1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -67,19 +67,6 @@ nvkm_uclient_sclass = {
 	.ctor = nvkm_uclient_new,
 };
 
-static const struct nvkm_object_func nvkm_client;
-struct nvkm_client *
-nvkm_client_search(struct nvkm_client *client, u64 handle)
-{
-	struct nvkm_object *object;
-
-	object = nvkm_object_search(client, handle, &nvkm_client);
-	if (IS_ERR(object))
-		return (void *)object;
-
-	return nvkm_client(object);
-}
-
 static int
 nvkm_client_mthd_devlist(struct nvkm_client *client, void *data, u32 size)
 {
-- 
2.44.0

