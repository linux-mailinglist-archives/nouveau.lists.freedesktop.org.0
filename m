Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C0BCCAC1F
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 09:01:16 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A683610E4C6;
	Thu, 18 Dec 2025 08:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YsgYwYx6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4374E44B2D;
	Thu, 18 Dec 2025 07:53:45 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766044425;
 b=VsxjCLLINhRbz0YREoKSF0khfN65Ddy60YtOujBejend2Mt3UwWtwdq+0ToyB9TKTNUwG
 3TAp1zbFcLpiNsbE5E8gOye2//vC6Xp3AiI4QlkBuzqO8yWom+6npChjVOwlRxlEXZ9AEs4
 8nJE2n4uN+1JZYx1sLFSqOk228kYsX9ofOkbYSBNQ7EE8OD/8ZijFeAQzE1f2lk1d90DR7o
 7W+uhUcesn/js13SQiv0BGcmvKcH973D49/SIudcJyWrstnBz+IGaZH452GvtJGMH8fxT3T
 y+0jaGpgwcAFKPQIOME+iUzoDpy60MJiSZhXNKEbAm25htpUA8xUF+nKBbfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766044425; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SAgIu0is338yIVUnOxFhANTdlUmU2ihOc5BSokHwAfI=;
 b=zduy1O/73CQYbaLueIHn30Oj0L/7j0lPsI3L2MgA8BnHzIQZJGpnzjEeQaaxAu5axDbeN
 zfib+XQru73CXEqDVb+h4BoOLD8McqKeLFpAIfN6lt2VAkK8n8icsFpafLENCO9QDQMiQDg
 90oqKrrdGvSYAiruRRLhCEn0ggWCBQVbk5n4rzVHKWL2Mg1fvN96KjkIF+UmwVPuO4YqqN3
 t2x8ERzvk3idAKFExb1raH56YqsAmca1tlScR3ha5RTFrmE8ltvup28/XZgDg2N7XTghGp0
 WoKWzwbMzWUV9TTuce4qoE5QrzUp+6ZBR4z+ZT8Zqn8KhtQbjLYHezn4HNCQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8DC9744B2D
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 07:53:42 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013058.outbound.protection.outlook.com
 [40.93.196.58])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A78710E37B
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn5N1JJOto0NP+6imV+5lh9Jd47xWC4y37BlwnCytFxfnmbsILEcqBx9QzIYgbclH0ff8+wSaOdzm1Jl2BNt80T4qTknJQSWJwltSrUUq1Mykb85urp3QTrco3ebugq4DTSTLEn8W4wQw3JiZbym0aewhPSKWMab2duQAa9l3jWKO8eMM4IST9wEisJhZH2vUNZz3ZACY6ppHXmfj4QAarCy6T4Rvgop9n0SiqV/xc09PWDgxEO2YBKK1Dm1BBYr2LJDW5nABDS82qAJ6e2wVCmLWYl0cxGZfqEPC1mYxVgMaCfLcbS4ame9NzvrhnOCJekJNMeRZ8R/IILFhzqrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAgIu0is338yIVUnOxFhANTdlUmU2ihOc5BSokHwAfI=;
 b=RATI6pxjQIDtHdKHGVZeGW28jLUl0aW5u+MHjuKnQ+hMZk3JJnkiSTxzPNVbUBvTXRu6SvQGAifry280li+n15xqI4ez7wEyy+fpxeO7d8cXMmvD78Yhu+bMRDU9q14CR9cr/JNrkHz39H+7vTQ1nufkKTe0f4vHbCfFOr6+DivqV1hJE5QbD3RP2ys5OM9SXFQSRe14F8Zem/6P+qAA4rVezTCgSBljd7asdTOSYnh8clAb2F3qrYxOwXolMX+mLg2+uqm32jsqDVHb8looI2pYoZT6J+g/9c2J422v26V62I8ndl1144vrWgegctPR2zneMl6TWL42WOuhg0tRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAgIu0is338yIVUnOxFhANTdlUmU2ihOc5BSokHwAfI=;
 b=YsgYwYx6/tocmJk7Z8U2w7AzcVXhvweol69INN0wzazFsT/hcGg/wp64oGtNTt5P7YbixTq9lDtp3HguGMH6F5ZGQ8EfEwZ1BLAPzeJ6ISxjC98x3FcApyFZK5olj/dAEMtl/Zfi9xc08ngUkrw+0dC24WjuIxXJHAbFLwEliPqlY8EN3eji6x0uucpDngdIZRwgRu5IVH/sjvj+DsT7QPQy/ywDl9tuXUdNsdFzdk4sCySHH+pNDHLvQrWIt8x5u2fgLfKXj1cAKp4CtfeHnQvXsFdnE//euT4SbORCb6woy0nTAAXvBBVsNkzf4js51lQj2O4egUNkp7Nw44TNRQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 08:01:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 08:01:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 17:01:06 +0900
Message-Id: <DF16NN6KJKK2.FFY3S0XOV9IN@nvidia.com>
Subject: Re: [PATCH v4 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-10-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-10-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4048:EE_
X-MS-Office365-Filtering-Correlation-Id: 102ffa42-9c9b-4b4a-160f-08de3e0b9a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ekZFSXZvY2t6UC9nZGUwMHlHWEhqZWtTVHd6VUU3TnQ5c1l2MXlPZmJ0Y1dE?=
 =?utf-8?B?Q3JKdUNZS3pvSXVMOWY1Nmp1eFE1M1lPb3NwY3R3bE5wd3lvclNUOWVweHVs?=
 =?utf-8?B?MjBqSnU1Z1cyOGdEaDZjZWZjYm8xNzVTM3lETXhaMXRZQUx6eWJxZXNLYmNI?=
 =?utf-8?B?Rk1YSm1nTjVtbEMwNXJ4MzllaVVVcUd0OHFud3ltbFBSYzNRZEc2NU4vbUlU?=
 =?utf-8?B?dnl6TEttYmZPd081NXdoWE52Y2ZpNEM3bDVDTDNhRDgyR0U4a281OVdjZE5J?=
 =?utf-8?B?UFJSUXpKV3ZkRVFwUFVLd0VWQUFJZGtTS281N2Fpb0VLM0JXeWp2TU04Qzh1?=
 =?utf-8?B?d1NRbzhZL2M2OCtPUlkrK1Y4UnRqMWR3S3lrcEJkR0NjZkV6UGJQV2owRmtH?=
 =?utf-8?B?WUY3UHpkd1A2dUVrMEh5b2dobmlYMGdmKzQxb0RPNCsrZXRUeVRRbU1QcEdG?=
 =?utf-8?B?NHZlVVpTSHR1aEtDWWowRSs5bWlXWkJVZWlnTVlRSmg5ZXErZ25lSkpMMFBo?=
 =?utf-8?B?T0RMODg0M01vRTdZRUQxTDlLbzd5MW5aZFNLS1AvVHNVZG5CTldPNlJXU29C?=
 =?utf-8?B?NEdLMzlLWWx1UUhKaVRsQmtXS25ONnhFUjYzSzdIemJPNyswMVRkNWx1Yzl3?=
 =?utf-8?B?WkJDK3ZUT3JSUEFDK1lnLzFvQWx5eHFTMXlIWkJ1Z3NRY2VrZm41d3htN0pw?=
 =?utf-8?B?UDF4YkRObDh4d2p3bnhxZ3VBRitQdGF6SjZsaThFS3ExdVdYM1AxZUJoMkwv?=
 =?utf-8?B?eWZ2Kzc2WG42N2VITHFMaUNUeTJkWWlPYmdQZXFrOFNlcHQyb3NNdlBrdjJs?=
 =?utf-8?B?SHFPYnRNa3ZJUFVUcHlVNHlZeWc2T3VUZkFuUkRyZWpyaTVKVlU4L2N5N0tu?=
 =?utf-8?B?MzErUVNNa3JpL3gzWXZCVEhhM0EzczRFNmZiUWpENndnb0hTWThyRG1VdldH?=
 =?utf-8?B?Z0I5dDBqYkNYZC9qZGdNYXBSaUdsN1l4S2NvUmxjTEliamx6bGk5VVBtMTFi?=
 =?utf-8?B?NmRYQ1k2RTNnTEk5dTg5b1FyZE5hK283bzdBVHZjbmNrQzJuZkIwWFVsMk9Y?=
 =?utf-8?B?RTg0K1Ria2ltOU5ZdExIMXZVVXRMYnRtM0VlOCtBQ1BNZlFDNzlpRGtzK2Rs?=
 =?utf-8?B?R0lyNURRMlVLelNaeG1wckRJNHNTd01vdUIrbmR2MVFvVTVWUVF6cXFXb1hF?=
 =?utf-8?B?Ym82QXlDbUNoakpiMzc0d2EvN2RuMmFkUXQrQTlOUlFDa0crb0diTUpydnp5?=
 =?utf-8?B?TEVYblJMTVBUTTJCdENlOWlaY25mYldKa3d1R001K0Facm1SZndiOTRrWWNr?=
 =?utf-8?B?T3VqUi9TV3hzWUVRQlJQbnlTWWk4WTdBSE11SnVpemxUdEx4RXRvcG5Mc0Fv?=
 =?utf-8?B?MmdHbEF6cWZ2M2NYUGFodHhXNzJ5R2ZEc3BCREpXd1o4VFZwV09QcEJRVGMy?=
 =?utf-8?B?ZUllM0ZmNDVaYi9Ya05YQVZSTDlCbThteVVmWTUxYzNpQ0krM2RnbUJhcGk5?=
 =?utf-8?B?c0VoK0VXdmtJZ0RQWnBhK3FMeVN0UHlzaHV5dHhvb0o1UGs2MUlFTFNMdkpL?=
 =?utf-8?B?VU1HT1QwWmkvYy85Lzk0bmFDdnZ6c3gvSVZPWGJwYjcrSzZxdElkRVY1MmFa?=
 =?utf-8?B?WG5qUTJVemoxU3lxdkE4TlBPckhGclYxZ2hVYXBySlpLb3ltV1AwcWtUcmJu?=
 =?utf-8?B?d0xhT0RUTkFFRWRNdzJHOC9iMWxJWThna051QkRKSTVKaWdoakNGZUQyYzZE?=
 =?utf-8?B?R25kdHRHV010L3ZUZkhzOEVKTEFMQjF2akVISS9Ec2dBdE5CVlAxa3dmeEhy?=
 =?utf-8?B?dXVWSkx3TzFmZnlYWTRhWEgrRk5RZHRuZmVxRlNjdHpZeFkyNGhlQXA0eFpN?=
 =?utf-8?B?NmZHVndVencyQnpVNTZNQ0hadWs4eTBoL21ZL3pJS1ZrWkJLWkFGZ1Y5UDMv?=
 =?utf-8?Q?HQt5ZLYkxO/9Wp25SJ7nViP+WCI061g0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlRCRGg4dWRQRzQzNDV6ejYzMDBJWVpPN2E4NVlTVXFkZDZldlRMbFFDaVZY?=
 =?utf-8?B?THg1MG5hWGpvT2wzVk9HRkJXWVBpeVdtbjg5STZHYmczRlpWd0ZmNUt2aDcx?=
 =?utf-8?B?K2NxQzFnTWJvbzRLbmp5RDNBSE9TekdMaHJpMytmbldEMXVJRnJXTkhGZE5K?=
 =?utf-8?B?MkVidmxXVERRRzcvOWFyL2VhTGhTZTBieTU0MUNhdThUUHNUaU1mWUkrcjhS?=
 =?utf-8?B?TURNYS9IVHVEL0ltYllIMC9OVys5MlVhaFk5dkJjaS8veUxtakxhZUJHNExS?=
 =?utf-8?B?endmc05HZkUvSUpJbHkzNXk4TkRoY2RJVjJ0YnRjSWwwUkF5bVJlK3lGWDJy?=
 =?utf-8?B?c05pbFBYaFYrMm9FTFprTlZnQ3EwekZDRXdXQjlabmNMUHNOOFoyYjhFTEdu?=
 =?utf-8?B?UTdpSzc0alJJUXowekppVGhiTmIrdXNycWIvZElERk5KNjYwenN2L0IyV0p6?=
 =?utf-8?B?K2hneWkzcVBCL0IzalBiRnB5cmY4aTFmV3NxNzQyM2NPdE9lZUxvS0k1OTNS?=
 =?utf-8?B?Y2JuVXFpSmloY2c4dU5TSEZubTY4QUxLc1ZnWEc2MVlIdHNVbUI4dXFiUUdw?=
 =?utf-8?B?TG82SHVrNTR4aGZNdnQweHBQR202SHM2cXpKY3Nodm1tMXE1YVV5MHJCWlUw?=
 =?utf-8?B?bWJjNGc4YU9vR2NPOFhyQ2ZwSEp5ZExSUXNOS1pyVW14YnRrWUh4ajc4cHR3?=
 =?utf-8?B?eWNidVFxalNRcWhYcGVFeWZxdlZNT0ZQNnB4M1ZDT3BBNmgrOEtJNXhadWY2?=
 =?utf-8?B?akZqSExwYUdxeERQTjN1M0JZc1BsYWlpQXlBdjFrRmF1eFlvWStsQ25rUlRG?=
 =?utf-8?B?NDQxQU9nMW00R05hMlRLcEFhaDFhdmlUM2lJM0FSSGdMR2lZQWNnSGk0N0gv?=
 =?utf-8?B?bzc4aVBuZ0ZJZlFkVHpSMmtEVDNBSGxXZkFuSThUcXBqZ0NyYVV2dTdZc2Fy?=
 =?utf-8?B?ZTg2SUJUSTQvbEdmZVg0a2VZWXJQUUxCOTM0RlpNdXBEOFBTQXNmZjNXdUNq?=
 =?utf-8?B?VUt6ek9jcThXL2xjeFB0V0ltdTdDTEh3UCtKeTB4U2Q2ZFFPNlltUkxxOEdC?=
 =?utf-8?B?ODVyTzlRMzcySWVDS0I0V2k1bHcxUnlnY0lZcXVPZ0ZKZzFRTXJwNkcybmc0?=
 =?utf-8?B?UGU0ZVpUQzB2ZXFVSzFXcXIyVksyQ1ZyS3Iwa0JzT2NNNEhrL240aGQ1VzdU?=
 =?utf-8?B?Nk9ZNUJucnFxKzdJeE9Pc0hzV0tRL05VeklDQ0ZzeTJidjFiWUl5Vjc4Y0pm?=
 =?utf-8?B?dDYvU3czUmdhcG9HK3Q5ZDY2S0dMbzNSZm5lTnJqeENhWkN2aWNqR0hDZk0x?=
 =?utf-8?B?VkZKeitRMmhZeEc3KzN2Y2tjRStpWkIrN2Vsa3VxOEd4SERtOVdjU1RUU1FH?=
 =?utf-8?B?b3FTRUVpV2g5MkNxS2s4SG9pMm0xRWFsRGg5cElMTjZ1RFdNSmp3bm44K3A3?=
 =?utf-8?B?anVCVFhlTmJMM1pwQmVjQi9MZHFrYUpNNG10b1Q5cXFBRWhTNkVna0k0VDR6?=
 =?utf-8?B?ZmgvY0NPRkFqZHVNeDJNVDlhWDk3MVVjN3poMDRVTGdvMkJLY0hpc0dVdHg3?=
 =?utf-8?B?NEVycWpBMVZ1RUtITVhVNEp3RmV2NmhlbFpHNjJFbnErR3NrQTg0RWQ1QjZS?=
 =?utf-8?B?Z3pFYkRQdTlrSzVudjhHbkhqSDlKWDBLVWxDNUdmWGF6VmVpQU1xNC9OY3FY?=
 =?utf-8?B?K2RXZkJOMU5wTyswWnp3c0F4WVlCZVZlTEJTTk11NFVObTNBbVI4MmpxRnhW?=
 =?utf-8?B?OUhpRVljSWk0RVU0Zk1vVTRnU2RCcGJVRmxoaWtaR1JNOTlsZERjcXUzS210?=
 =?utf-8?B?QkhlS2t2TEticGxhUXllVHdITkFRaU9ET05iOUtjMUpjTHRYZ09Ma0tiNDdF?=
 =?utf-8?B?YUMrV1FpTVRDUTVtQnh0Z3ZKaVNpalBKMlRiL01DemcyTW52V0U2VVY2NGlq?=
 =?utf-8?B?dXhlYjJnZEtEVFFYdXQrbDVHUk9aZDhBYzVRa2J0TE9yNlZWampIdkRBTndu?=
 =?utf-8?B?Z0hTdEJnOEp0bVdUV0JIeC9WcThMNHVGUFk2Y21md0FZU0ZPK1dnckFFK0NR?=
 =?utf-8?B?MjRIa3duVCtSRGxyOE9rWVlqdlR1M3RTTExmeHdqUjRkUGpVYW1CbUlwblFB?=
 =?utf-8?B?eFVEU0xGSTlEdGVycE9ZN2lERUdmSFg5MFYrR1BaTmtRMW02U2lsb09INXo5?=
 =?utf-8?Q?Jfv0y2ZsSP59AUWUSQ0iIGcE7rR0xRB1aRyHtyCWX93L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 102ffa42-9c9b-4b4a-160f-08de3e0b9a88
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 08:01:09.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BNIAy2/qu0h1myAle/ElQuiIpez89c4KbKNEIBmGRAc59nUvbT25WMZ3CFCvNJ8u63ML712vHSkTlxPfMLgATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
Message-ID-Hash: Q554PKI7DU23BOTPYAUAV4CBMTPEUVXT
X-Message-ID-Hash: Q554PKI7DU23BOTPYAUAV4CBMTPEUVXT
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Q554PKI7DU23BOTPYAUAV4CBMTPEUVXT/>
Archived-At: 
 <https://lore.freedesktop.org/DF16NN6KJKK2.FFY3S0XOV9IN@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 12:29 PM JST, Timur Tabi wrote:
<snip>
> +impl FalconUCodeDesc {
> +    // Return trait object, the only match needed.
> +    pub(crate) fn as_descriptor(&self) -> &dyn FalconUCodeDescriptor {
> +        match self {
> +            FalconUCodeDesc::V2(v2) =3D> v2,
> +            FalconUCodeDesc::V3(v3) =3D> v3,
> +        }
> +    }
> +
>      /// Returns the size in bytes of the header.
>      pub(crate) fn size(&self) -> usize {
> +        let hdr =3D self.as_descriptor().hdr();
> +
>          const HDR_SIZE_SHIFT: u32 =3D 16;
>          const HDR_SIZE_MASK: u32 =3D 0xffff0000;
> +        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +    }
> +
> +    pub(crate) fn imem_load_size(&self) -> u32 {
> +        self.as_descriptor().imem_load_size()
> +    }
> +
> +    pub(crate) fn interface_offset(&self) -> u32 {
> +        self.as_descriptor().interface_offset()
> +    }
> +
> +    pub(crate) fn dmem_load_size(&self) -> u32 {
> +        self.as_descriptor().dmem_load_size()
> +    }
> +
> +    pub(crate) fn pkc_data_offset(&self) -> u32 {
> +        self.as_descriptor().pkc_data_offset()
> +    }
> +
> +    pub(crate) fn engine_id_mask(&self) -> u16 {
> +        self.as_descriptor().engine_id_mask()
> +    }
> +
> +    pub(crate) fn ucode_id(&self) -> u8 {
> +        self.as_descriptor().ucode_id()
> +    }
> +
> +    pub(crate) fn signature_count(&self) -> u8 {
> +        self.as_descriptor().signature_count()
> +    }
> =20
> -        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +    pub(crate) fn signature_versions(&self) -> u16 {
> +        self.as_descriptor().signature_versions()
>      }
>  }

I wanted to make this comment on v3, but took the time to write some
code to validate the idea so this has slipped to this version. :)

This whole impl block becomes unneeded if you leverage `Deref` as a
replacement for `as_descriptor`:

    impl Deref for FalconUCodeDesc {
        type Target =3D dyn FalconUCodeDescriptor;

        fn deref(&self) -> &Self::Target {
            match self {
                FalconUCodeDesc::V2(v2) =3D> v2,
                FalconUCodeDesc::V3(v3) =3D> v3,
            }
        }
    }

What this does is that it makes all the methods of
`FalconUCodeDescriptor` available automagically whenever the `.`
dereference operator it used, which is basically what these proxy
methods did.

Then the only remaining method, `size`, can be moved as a default method
of `FalconUCodeDescriptor` itself since all it does is call other
methods from that trait.

> =20
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index e4009faba6c5..1c1dcdacf5f5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -40,7 +40,7 @@
>          FalconLoadTarget, //
>      },
>      firmware::{
> -        FalconUCodeDescV3,
> +        FalconUCodeDesc,
>          FirmwareDmaObject,
>          FirmwareSignature,
>          Signed,
> @@ -218,38 +218,59 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBy=
tes>(
>  /// It is responsible for e.g. carving out the WPR2 region as the first =
step of the GSP bootflow.
>  pub(crate) struct FwsecFirmware {
>      /// Descriptor of the firmware.
> -    desc: FalconUCodeDescV3,
> +    desc: FalconUCodeDesc,
>      /// GPU-accessible DMA object containing the firmware.
>      ucode: FirmwareDmaObject<Self, Signed>,
>  }
> =20
>  impl FalconLoadParams for FwsecFirmware {
>      fn imem_sec_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: 0,
> -            dst_start: self.desc.imem_phys_base,
> -            len: self.desc.imem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) =3D> FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_sec_base,
> +                len: v2.imem_sec_size,
> +            },
> +            FalconUCodeDesc::V3(v3) =3D> FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v3.imem_phys_base,
> +                len: v3.imem_load_size,
> +            },
>          }
>      }
> =20
>      fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> -        // Only used on Turing and GA100, so return None for now
> -        None
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) =3D> Some(FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_phys_base,
> +                len: v2.imem_load_size - v2.imem_sec_size,
> +            }),
> +            // Not used on V3 platforms
> +            FalconUCodeDesc::V3(_v3) =3D> None,
> +        }
>      }
> =20
>      fn dmem_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: self.desc.imem_load_size,
> -            dst_start: self.desc.dmem_phys_base,
> -            len: self.desc.dmem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) =3D> FalconLoadTarget {
> +                src_start: v2.dmem_offset,
> +                dst_start: v2.dmem_phys_base,
> +                len: v2.dmem_load_size,
> +            },
> +            FalconUCodeDesc::V3(v3) =3D> FalconLoadTarget {
> +                src_start: v3.imem_load_size,
> +                dst_start: v3.dmem_phys_base,
> +                len: v3.dmem_load_size,
> +            },
>          }
>      }
> =20
>      fn brom_params(&self) -> FalconBromParams {
>          FalconBromParams {
> -            pkc_data_offset: self.desc.pkc_data_offset,
> -            engine_id_mask: self.desc.engine_id_mask,
> -            ucode_id: self.desc.ucode_id,
> +            pkc_data_offset: self.desc.pkc_data_offset(),
> +            engine_id_mask: self.desc.engine_id_mask(),
> +            ucode_id: self.desc.ucode_id(),
>          }

For `brom_params` you are calling the virtual methods of
`FalconUCodeDescriptor`, but on the other methods you are doing a match.
I guess the reason is that using virtual methods all the way would make
`FalconUCodeDescriptor` grow some more, but still we would like to avoid
the match here.

You can achieve this by adding the following methods to
`FalconUCodeDescriptor`:

    fn imem_sec_load_params(&self) -> FalconLoadTarget;
    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget>;
    fn dmem_load_params(&self) -> FalconLoadTarget;
    fn brom_params(&self) -> FalconBromParams;

And implementing them appropriately for the V2 and V3 headers. Then the
methods of the impl block above can just become:

    fn imem_sec_load_params(&self) -> FalconLoadTarget {
        self.desc.imem_sec_load_params()
    }

    fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
        self.desc.imem_ns_load_params()
    }

    fn dmem_load_params(&self) -> FalconLoadTarget {
        self.desc.dmem_load_params()
    }

    fn brom_params(&self) -> FalconBromParams {
        self.desc.brom_params()
    }

