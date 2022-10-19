Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA7604546
	for <lists+nouveau@lfdr.de>; Wed, 19 Oct 2022 14:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286BD10E0E3;
	Wed, 19 Oct 2022 12:30:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2577B10E5AB
 for <nouveau@lists.freedesktop.org>; Wed, 19 Oct 2022 12:30:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kyUQEP5sR3Zqdby795M4NegxxRpant1I94ZfMkeBbHNPUUdeoUQy6qjK0YlYOfFYuQiPKUW08fugmRqGdYSFGk409OSzQfz6rJ6Gfsh85SiV0U255K0DaUnZcm+9wN7QunsKRQ6sFplzjn61Q4FunJYSKvynXly5DEkCIiSkpV1smv5ihEA7F/DP0igQ2Y+f7yfoPJ20/7MWyFAJv1JC71ym+N0GFV/T42NzJqIeMsEzd/RSizQnEgdNLt8jdu/Q+giAdHPusbeZMgtj37NpujdJl4pL7dO8hoBl2/qqI0M/KGSGeBSlMVD/UuIfujLHaseM1FY7b53WXxD/HoUCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHMsVtzMuJtLpSDQxIGHKYLY9W3uNuVyK4chBymrdaY=;
 b=drdcL726GwGpRRj8r4I+tZKfRINPIEMBDAgzJxCmeYig1NEu7KEzBaIU78DPUCRgnRcq3DJrheuzgptJEgh7zVPQsAIHqBdVLvWEVOrLbNWUUa0U06OLLskYCbyWAtEvmBb8/GH1Vjxk2ItDO+qbWzNfacxB+6yN4fNryDDaQIVvi1Gui6n+wiLpGRmQ3Eg0ioqMMpWL461J9Md39/Nbb2n3JJXQPxmyfbcZxCp2tvnG+X3TPBGHsQ//Tp6vc9ywSvFxvM0KUtloNTUJ9O39A/JEv9zrQZ0RatAuxrTta4f1ZFZHICuSoIuGA7vprCsgY9cOK/GlHsz+WgmhVBdjcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHMsVtzMuJtLpSDQxIGHKYLY9W3uNuVyK4chBymrdaY=;
 b=h/AuKusaDsbMSPWuiBWASIMm86JwYjwRAPFnVwjfXCiE+gWqAYEY3gaaTpMjf2o13hsGF3YS3MF27ovRUv+tsRULdByBlee1SNorBLF8MLWmG/660ncTTerLbYNtVrtL7Zds6ZtdG+YLVBcB7uPEAjvbUIIz4yZk/2d4VtNP0OzL8OZbZh6lPtjBQdNHboYxoZlWpCKGvaIHydTeYP0QIESe97+rvUBQiPww8EUcnJohlF25vJkUL7oG6VVda7NU4bMh83/afeITk3OA0fxG8kGNXOUm2S524/x+PtQbH200hpUh9jLQPEGFOk8p52FFq/w9/LpLF0a4do8jWDXsbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL1PR12MB5190.namprd12.prod.outlook.com (2603:10b6:208:31c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 12:29:59 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6ed5:b1a6:b935:a4d8]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::6ed5:b1a6:b935:a4d8%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 12:29:59 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Date: Wed, 19 Oct 2022 23:29:34 +1100
Message-Id: <20221019122934.866205-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5PR01CA0084.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::14) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|BL1PR12MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a142808-3297-431c-7ed0-08dab1cda35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3Smg2jwYOGhfGsx1rAFCtUCo7RJ6tq1bAfLZNgejDOs4ZzheTIGo14/pU3U4M7Y+GlITVhiRpebzY1lFvv4HtDLSOX4cigQkij/od9JRAJq3bg4uDYcmK6ND+N92Q8XmQSVFxwfQVcnOjDHQUAf/9veiLWAnf/nZNg8JwTzdF7/v5a4pumlkU+lk4eBlbWMcTUtmjPdw0ibeoLJzZCEZ0kYvLUU2KBJeBPbc9jeJ59l/CyDioE5Bm8tawBc6bZgKUmQvLSGX512Nim4yBv6ChBkNVmSU7gPK5uSLxcjcEXxRT8zb7vXuVdvZnBiq+uat2q7LLV1mZ+MQuGqQdeYHZOl2pSiiDSR3PVEisuA4j8br03ziBPntcuGAGsLR6PXr/1GDr5tgcDQx8MLiPKJ4/vHy93sEBGLLo6q62kEny57GW7cHgfE7noQ9Vhg6OzEt3jqBJX8Jsq0Y/+IKMBAfQtFCWNyyHIeJ1ddB2GaMugBUV48i3gE3g91rbImOioxkfylsqp4zzyzkp0BenlyeDoFJGE0sua9d+9pd3yyBdlO4GnhRtqS4aVT6vYV/K7dW9lk2TT7uxfBmpW1DhCdO9lOghIl0X/W1T11IHoS9oeBgatpPkHwhUnqNbf3TFLk2WiP5+NE9LUPFdxZ2ySgK3HQYB3F4QWHlMnvIT84SmXrR98NXgAcplBOYhPLkabahDoFVuKfSJ26bvfcDo4HYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199015)(86362001)(36756003)(38100700002)(2906002)(83380400001)(5660300002)(6506007)(26005)(6666004)(2616005)(186003)(1076003)(6512007)(6486002)(316002)(478600001)(54906003)(110136005)(66946007)(66556008)(66476007)(8676002)(4326008)(41300700001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LmTdIS02OkaaYXIcScxcN8Qvur72W/mXvkm6jXH7huO4okn9LnnX2oWYci7t?=
 =?us-ascii?Q?EV8eHq2AF21QrmmQmzSzeKrpVrDet26ZmCOpgzmGGKQhq2jwYOq11XgH1vjU?=
 =?us-ascii?Q?ySX7YjW8eoTlkh+vdpGiKs3rkMYU7KW//mT+StG9f2oYLZh2gJGrDfItSVXq?=
 =?us-ascii?Q?bgT50sOLMhmuuU5dFC/h3/j5+IB0t3rfWqK031gXg5wTaODPXWZp+j1p0y5j?=
 =?us-ascii?Q?ixBswJSqpaQzTpa88lP9M7yUbq7YIea0Fdl7gX2J/g/qSNwIxWzWNOMH75W8?=
 =?us-ascii?Q?6I8TivKTvfVqIMoft/3Wagpfh5eHUCjrT6h8pu+bjh0RC3QHuxmdS/8TYTBi?=
 =?us-ascii?Q?Sgt4q2j66PX63WzuiU4yuzdkRFKsjnDudgmlnwQgh95ZFR5CRB9aFZCYh2ch?=
 =?us-ascii?Q?Ii1W3qLRyTReZiEYqnOCb/R+YUSje7x2b7C0q8MMqs41APnBDgZenC5X08RJ?=
 =?us-ascii?Q?pOTSGFqgGeovZgd6KnQRT15oDW+FX17jgrqjE95YuM2RJuEcbu5q1a327luW?=
 =?us-ascii?Q?UA/E9toJYzF0DS186Mx02dBXed3JsYDU3Vf++3I+2+jIQmyJgmmaVCpvmPcu?=
 =?us-ascii?Q?tjbJF7poRMOHB989O1avB5YZGzs9vL1VFcuay02prZXmvCSfzeZtok+XEKzl?=
 =?us-ascii?Q?ziz04Py0k9QT5qY7isf41jCgzatzfBbiLHxt7eEFbgVAyi2BJ4BalLK1rl63?=
 =?us-ascii?Q?0ifKN7cBaYZgBA5LgDHS5W45C0GVDFBTAYF+6JAOZi735HHGDV+pG/WxNffT?=
 =?us-ascii?Q?t+oQRiEdUqj6n6cRG+kzo65k+JQyqjKUn1yStyH5TAGsg3vtimNqDWTW1t63?=
 =?us-ascii?Q?It5PVSKOXzoAiSk/zxGZoZr3RfN5GZD4aKYEZEkF+iy1/SNU+nGemaK+JQZD?=
 =?us-ascii?Q?qTl4fENtRUuYNyDn9lAmpidaakWThoYdTLsswzyyVBrifhujfvljlmGutcJg?=
 =?us-ascii?Q?wwVKu6wYWO+LpBrmVEc/B3o2fIEnPoi10E9sAN9eExl0vvnGvilea83qGy/O?=
 =?us-ascii?Q?t+a7ClIVEl6Ii5nw+hvxEs8mt8BoPzhzrRNeKQLrMo6dTyF9cS4LfawoFaEd?=
 =?us-ascii?Q?4l+Jp07lEwudQ3GtSTpRgmWeTDIq2qVmJfAEwapq6TL65tfOiV/H6QNm4r8a?=
 =?us-ascii?Q?TLsgTAUlRgcsAuDckujfNWPx5Rr1O85jzeW7mOEoCUECv7ovBQK7/uCdJjpX?=
 =?us-ascii?Q?0CUrph4QFtDO9U9B2hfLIzDIZ6ni7vxYK3J6aYnqqBdKEOXjkspQhil7azoh?=
 =?us-ascii?Q?drabPEaSNks8vMzH2gpN0FYo8kSSS8Il88pF0Fw1UWIU6FOoTv/fHEVIzK0m?=
 =?us-ascii?Q?RK5q1zanOP6qFy8Ghpwd6vTNvFefZg67pXhKndv+CKCI5YvzGISUNSUuAVli?=
 =?us-ascii?Q?MhfOBF3VyZU8UiR9etcaOcpWsRxYyHeSDHz6bRRlfHvr98r+k/diXQglH7I8?=
 =?us-ascii?Q?LfJbTL/DcPhgxi4QlQ1scMFNWwNlZZLOZn1/k1y7pyQ2eYs7v+qi3yjWdENs?=
 =?us-ascii?Q?njHfGtTuOCDaLm2uSCqxJuo5aj/orqC22BykNBjD3EnDY/wxcoqFGMWEmiR6?=
 =?us-ascii?Q?ACcnw2IsIMqkwgn4xZKdks/YUSx22sv3nIpAk37Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a142808-3297-431c-7ed0-08dab1cda35d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 12:29:59.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvXfQKuDE2dF96vuA+/f/EEi7jUuw5sJBAwgoxGZieCu0HVf+6Dxzz2e4UXXUTY6mveITSz/c1K3Sjw6RIuvRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5190
Subject: [Nouveau] [PATCH] nouveau: Fix migrate_to_ram() for faulting page
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Commit 16ce101db85d ("mm/memory.c: fix race when faulting a device private
page") changed the migrate_to_ram() callback to take a reference on the
device page to ensure it can't be freed while handling the fault.
Unfortunately the corresponding update to Nouveau to accommodate this
change was inadvertently dropped from that patch causing GPU to CPU
migration to fail so add it here.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Fixes: 16ce101db85d ("mm/memory.c: fix race when faulting a device private page")
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>

---

Hi Andrew/Ben, apologies I must have accidentally dropped this small hunk
when rebasing prior to sending v2 of the original series. Without this
migration from GPU to CPU won't work in Nouveau so hopefully one of you can
take this for v6.1-rcX. Thanks.
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 5fe209107246..20fe53815b20 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -176,6 +176,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.src		= &src,
 		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
+		.fault_page	= vmf->page,
 		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
 	};
 
-- 
2.35.1

