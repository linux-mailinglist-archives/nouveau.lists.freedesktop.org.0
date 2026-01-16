Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738ECD2A920
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 04:11:58 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 612B010E7DB;
	Fri, 16 Jan 2026 03:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nWfCRnyX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C92A844CAA;
	Fri, 16 Jan 2026 03:03:21 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768532601;
 b=B6EOt7zWyUNXmkPzoG4zyZaAyW5E1DWwsttPguOwxU/Gxz86RaGKsM378iB45DcKnE+G/
 fgHZoNSV4/vZKDScgkWXKGbe96uXauwn5B87km8cvrxcWbhOY4vI6WS0F1EeXdbyHPtkcjI
 myskBceRkPSo2TzNgF0IQo3tfDSFntVnp1RogZc+LCAnxP7itHCOWQk4tH0/wtn+dzN1uIw
 1WQ+tMH7uwF13B7273PqT6Q3RctImYcAY+mIaMqaBVapUlyKfM5Z/8HntzZMvu+i58VQstP
 4ZwFb7MkQSuN2452d2O+O0ywY6WwviV0D+8EyFNMpqH7IDzYjp6XGO+zp8IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768532601; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sgLcMOTuvPGypeGQMi4DmOYjseosoLdO/jbwQA83vPs=;
 b=CfydFYLn0r/vqot3qBL60VCzYb3580M75+6DooZfVegzmIpQ0djNpiqXRHhgA+krUfJbK
 YEKP6DG8yelr0bB0vPi82tSzROD/abqYVe34tHhmauge7um9aj4ixDb3g5gKbyo6ZjxlKDJ
 OFXIRXz4UfOZxmeUdMxgQwdpK3/9coIjrlhlm8Oc+m/Ua+agv+AZLhocbdage+o6VgmsPGt
 07DxBVDnd2mKmlQBi6f4guaeIA48doSqgJ3JgB49QbXSjRRD+rz8XnCYtS8iFg8gqLP/p6t
 QcjE2A3rjZ13VPORmtXSk6zS2Y7+U9wPgNfEWunRhzNdI+1xrI7x8hZJJCzQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0988B40744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 03:03:20 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010052.outbound.protection.outlook.com
 [52.101.193.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0A610E201
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 03:11:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtjVj6wWH1z6sSasuZ0s9y+Nsg50KRUKh2FjzYVbozLaJ+T90966pCz8ksky7AuHLTt9Tpzzpsb/YCGXW04ebGUR3kTib8znQhHlGsIQqdlw3wzQqoN3fVDXvfn+p7CVZnef+BgWjGOJZq1kNmoa7Il4yf3LrmrgwdSGtfBCfyHwOOHy2NJDD8x+Hst28+KPFztne2WSSWe4qmbLdQ/LGQenG3F6NjPUqrQqQtCJPGCoEiLPnSFDyGKgf7t3JP/b0uw1fjmCH9SDGmDv1n6xEaY4zCwcXyBpOCg87zpaiNsJMhMubP8Hbg3BFjjEbGH9/hNdToWbWqo3Ts/pgzgC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgLcMOTuvPGypeGQMi4DmOYjseosoLdO/jbwQA83vPs=;
 b=r3qMWDlX61qSGBBgU4hPb+92mUkpyCFTkYnuHHWv9Qkq/WaFXfh3RXK2YM35PEyWc2VEEBKimtGpJ4ymY9Zlg7yl3vyz9B9PtSQGJLpsGh83J6d+WZP93v+egaoZF73KilHXFCO/DsRA4rS+G9vdhb9JRAvwjBCU9nccdY+yGDwP3dJN9hBELZ9VlNO3LEWoc84Jpg0XIFRPSlZK7ARBYZk1hr8TzLz0lXTFMhyWWE/uhs/6Nje+NZuFwCKzX+3+DiV7ThSnMjsRSTP8t2UImsxYpeA4161wTwz0C6Bt/Jvg8czWTR34diuvuyLz6F3APQtQOl1vmfawoIP8KzcJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgLcMOTuvPGypeGQMi4DmOYjseosoLdO/jbwQA83vPs=;
 b=nWfCRnyXHUwflAJn4tt50XRNHqd/iOjz8nraYyjvVFFfCZVOnnVVnzWxozG6taSUaZhebS6JPvwYzpsxao1nGxjn1vVwAjuTmgbVbZAiYSmOJzVwyR6VaMmdugKES/7PB9rUDsuEbmsu52sLCMplfSCiKZ7kxPDZ5OXDpYpinvqnWqSduAwBqmy62gCi/n+a2C5U0xMBYYzBH4ybdvT1B2dSzy/ChzZfB6bgrg+TrQJytSX8IrlRsC/p6ggBKJ+/87e93qxAhqRIj8yyoL2YgQBiN6qbnrN5sMKEYL1P6Gkt+0EvY2WGz6EDTum7w9VaCSyToetojwjvKwHIB4+xGw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS4PR12MB9707.namprd12.prod.outlook.com (2603:10b6:8:278::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 03:11:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 03:11:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 12:11:44 +0900
Message-Id: <DFPONWB8ZGY8.1SXWBJBUAWN4U@nvidia.com>
Subject: Re: [PATCH v6 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-10-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-10-ttabi@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS4PR12MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b32364-f6c1-4ae3-9dd7-08de54acfdb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bUZrcUkrQ0QwcVRrS2xWN25BR2tteUQ2T0d5VFhJOG5QeDhPbzlzOVlFNHBr?=
 =?utf-8?B?djZoVENNa3B4ZTZON2RuckRmYURyL2w3LzJJWHNQUTMvUWhOUWpSRGdWdHRv?=
 =?utf-8?B?ZFN0WUxicXlUUlE5dHhPVlZmZktrK0t3Z0hZT1dGYjBCT3ZNdys2R3E4Q2dG?=
 =?utf-8?B?cURpYmVzMEwwbDZoMUxjK0pVTWZXcjZFSHAzV1R1aUgvVzRDVDJrZVE3UUlD?=
 =?utf-8?B?ZElIdDRhcWk5LzEzT3ZwMGo3MHc5ZTdDaDlUV3NjUG9nQytycnFVdk44Nlha?=
 =?utf-8?B?MjJBWHY3Ukw3ZVVDOFYrbVBNK0E0aGZjQmY4dVNXRUVnb3BUd0xMV09XcFN6?=
 =?utf-8?B?SEMxamdIV3I4WCtSRG9QVXlXUjZiYW44MEYxUVVIRDdjOUI4WDF2VjdwbE8z?=
 =?utf-8?B?Y2lvWllISXAyN2JFdVJQWmFSY0V0N05ub1B3VmljZVdEc1p4OWNoZEsvS0M5?=
 =?utf-8?B?b1FETTAxbHBmL2tFamhuRWFMeHhyaWR2NFExUmF3Mml5Y0YvbThWdlhKWkYx?=
 =?utf-8?B?N21XMUprSk9aL1JIeTRQYlF0cnJqc2swWStJNDd3MzM5TFIvdW9JS2RNVlNX?=
 =?utf-8?B?Vkx5U1o4N3Y3WnoybmtJbzVXc1RxV2d0cWRrd2I5UWxnQlFjdWlQcW85dkow?=
 =?utf-8?B?VzBVRDZhREJ3RElCYVQ5VDdQb3ZzOHVuM05LQ08vRVRjV0tmaWtDRllmUmRs?=
 =?utf-8?B?MU00OWRPMit0NFF0NjN1VlZMWjN4SUQ1VFJJUXZMYUxJY2JPMEw1RjlEUHNu?=
 =?utf-8?B?Z3MySlZzRjRjMkJ2a0FSczBhM1hBL000VTl4bXRLYlJibllEWWw3dXV4YXNM?=
 =?utf-8?B?MmhiNzM0eElwamtjY3k1QVpjZzlXRy9xd0pCRy9rOTNNY01SRm9PMktVdUFQ?=
 =?utf-8?B?MXNLY1VxVkdDRGpmSi8zby8zcFp1cnBISUc5cDhpU2d3NFNUZDUwZEhlMk9U?=
 =?utf-8?B?ZVlWZXkyRWhPQ3ZwQjBzalZ1YjRGcVB4TjJ6Ry9HRjVmUGJOYmkyVm9FWGpJ?=
 =?utf-8?B?MlQ0S0NOMHVzV1dXTlBRSXo0ME5NZlVTM0RrQ2hxU3pTa1lUZ1BKQTN2R1cv?=
 =?utf-8?B?N2U4N0JiSWx4cWlPOVJiT0pJaElVdHhCRi9IYW5vRkozSTNjbnlNTGxqNlNn?=
 =?utf-8?B?UWhsQzRrMmxZbExOaWdZNEE4NGlCOXByS1ljWld4L3lTTW9KS1Z4UTlDTTVk?=
 =?utf-8?B?eVQ0RXBsM0w2NDIxYmNwN2pxSEI4MDFZc3dsb2Q3aENPak5BaVREa25QODA5?=
 =?utf-8?B?bHhXVElRL29naDdvNHlSZWh1em1XZ2QrL0ExbjlEa1dsUFJ6eHdiSUVxSnVL?=
 =?utf-8?B?UGhxL09oTkp1Qk5tdC8wRlp5Y01CTTRXMWdScDJ4NmkvVWNabzJxSlZtTDlq?=
 =?utf-8?B?L0d3N0REZXdrMktjRVVMcHdhKzdnekRoRE9pQTZRaUl6L3M1TjRqUW5mWThp?=
 =?utf-8?B?YTFNaFhraCtCZHZnSTB4UFpoZ1Z4K3IzTklSZXhTMjByYVYvM0JWNXZVcitw?=
 =?utf-8?B?QXBjZ0hsWjJlWVgrc3hQNUxQcjVIb1ZyemZnY0dyQWJzY1JUak9YUFkrejBS?=
 =?utf-8?B?N1pJQ1ltRCtYQ2QzNkZFbitYT0Rabm9rdFJxZ0ZlK3VWY0xxdFhBTFBrQkhY?=
 =?utf-8?B?L1hCanVJeGp6cWkzYWI5SVdYU25VbGlvVkwraUg1V2xQeFdrRUJrQkVYby9S?=
 =?utf-8?B?VWorcnpCci9XcFhTME91RldpUGlBS3h1alg4bUNPSGl2MnZYQlV1TXRpTWQ3?=
 =?utf-8?B?ZnlzNUdILzY4MjVLZ1NBTHFrRmw4SjEyWDFFOHBLRnpwSFBqdVhhYVRFVVd3?=
 =?utf-8?B?RXJ3bHBaV2lHR2ttMWlXRnhNTDhTOW5WWFd5QlpWSFpLNmMvRzh1ZWxnc1FO?=
 =?utf-8?B?WHhMUm5Sd1BhRTlEVnljTGdSWlhqL2xmbk1JVTh3WGpTRFhGeFdmNEpLK3E2?=
 =?utf-8?B?Ri9sTVNyTDBmQlZRUjI2V1o1LzRuYzVHbm5KTEtjaE5NSk9JYUNsUEdGZnNT?=
 =?utf-8?B?Tnpvcy9paGdJeWZxcFdEVlRob2dMc1pYaWFqdktiZThSV3Q2dERxQUVOUHJM?=
 =?utf-8?B?S2RaMm1IQW1xQVBwZkhUaWVjVHdHaVZiaDYzR3pCNmtjRHVzYkM2UHlNNDVB?=
 =?utf-8?Q?tA6w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cUp0MDNDRm9wVWp2ZHBkV1hqRktkMEc2SW5RNWJmODM3V0tZZWpnTWwrQXZC?=
 =?utf-8?B?emtMSUpLdldqb08yelo5UGdBOEtJTmlaZ01WWXc3RU81RG1FL3VIY1ZaQU9Z?=
 =?utf-8?B?SEtRdDdBM0t6dVYveGd2VWJxcFk0SE1RYU9VNnMwVlVabXl0elh3VlZidTAv?=
 =?utf-8?B?WFdwVGpoNlNKRXBpZ3JydlpsTmdrZjZIa1l1emVHNHJVZkt5KzMvamJncEZ1?=
 =?utf-8?B?dDBZdDRqRTBuS2UxYmxidi9qZVNWTldOWDJLeURrRFo5aUQ5NWVnWjRiakJr?=
 =?utf-8?B?dEt4THplUWtzWkx2anBIMGpPWFRaa2ZTOW5OYkpnRVZtRXVuUWU1NDdzaytl?=
 =?utf-8?B?L1pVblhWV0FCU2RkUEMwQkQ5YzU5Qitvc1AzR2Jrd01vMTQzbWlkb0NqcGQ5?=
 =?utf-8?B?RnVadWhrMGI4anAwRVducEhyUUVwYVNVYlhMVHYrNVdxdVZWVzlLb05qbHVQ?=
 =?utf-8?B?VHNBcXdkYzk0MWZ2U1R2UE56dWFIdjhpeFdvY2xndVdKak1BWmtoc09Qd09G?=
 =?utf-8?B?MEE3VUdQZzN5NDFzRW1ISXdYdWVVc253dVFuYlVrZU1qbVp1NzdSMmlzTjNQ?=
 =?utf-8?B?S29tdGU2Q1RqeVk5UGRwZFJTRm1tU0tJRmlacUxwYXllcmFFSG94MXkyUExI?=
 =?utf-8?B?QTVybCtINEVJbXZlNHQ0aHRVdnVzWHl3bkk2bXhmTWgwUy8vTm1Rd243cVdZ?=
 =?utf-8?B?Z0EvNWhhLzlQc2RodW95SkJCNjFwK05GQ0dMQ2laeTBudkQvR2NlOTlRK3pu?=
 =?utf-8?B?UEc1NDgyR0hmOC81aG5pTWR5b29lejBkOEZEWGNWMWZkVll0YjI2dk9mMUVR?=
 =?utf-8?B?YkNHUk9VYnU0akJWcEJoRVo4NnZ5cmFGZ3FBV0Vma2JZdG1lY29WSkRzQi9H?=
 =?utf-8?B?VlV5SENRMGNkWk1nd3h5Uy9OOFNwbTRYclA3dDdDM1JXZ3FhSVVZamFmM3Nq?=
 =?utf-8?B?ZlN4SVBsZ2VVbGRxVVBRTXhXSFp2NzViQlVIUC9rZFB2alBYeEpodmUrZmpD?=
 =?utf-8?B?bnlKTVVxeU5BdnkweXI1Q2twVlFKWTFQUldMV3JicGZYeERST3RvZGk0MnRu?=
 =?utf-8?B?WWNVUnppSHY2RzhLY0dJakdBYUVNZWtKL3RSMEladmJwZGsrOUphRVpnL1dO?=
 =?utf-8?B?T2gzK0FkM3hhZUNBdW02QStrSXdyOGFIYy9qSU9JRWs4NEdoRTRaNE5yQmUw?=
 =?utf-8?B?NjhjRkNpdC8vMzk2aUgweFpkM0JoMVJnSjB4L2QxMUNOVnp1MnhKMUZjNEEz?=
 =?utf-8?B?TDRRVnV6NlZyYkh5MHpLRmdKZTJWcVR6bllPamE2QmJnaGNLNkF4UEgzRFNq?=
 =?utf-8?B?OXIzOEc2YWlyT1RwSmlTSXRvTndpT1BOOStJQXhadWRNZDdoZkFqQVJSUTZ3?=
 =?utf-8?B?RWVRSDk2SWxkR0pjdEhmTldOZnZnclJWVTd4c1hBRnVkQkIrbk9XSlphYzVi?=
 =?utf-8?B?SnJGSVluU1E2ZExCeHVpaFZSOWxHU2VXQWV3SzJVSHVNUklrWnBqcnJYNmxY?=
 =?utf-8?B?eW5OVzd3UEJ5d01zVkowSUhXZGpoK0JvZHRySHp6dXhTYUV0ZUQxSWhJQzE1?=
 =?utf-8?B?YTN4eTRycTRPRnBWWDBzYWczRHF6Ykpnd2ZNZVdwR2FhZWUxMW81OVJ0U21X?=
 =?utf-8?B?bHYyaEdqSWpVSUF3dUlKeFRjcGREK2dDcit1Z3RCdTczT050THh1cTNtNllV?=
 =?utf-8?B?eHNCMzdCZDZzYmprVDl6cUY2ZlpPdXQ0MlExZm45SG5YRXZ5UExuNituT0NY?=
 =?utf-8?B?QTJyWmMyc0R0eTF5YU1RVnBjVlBMa1QwUUtacTFjdWNybitDdVdsdkgzRzZC?=
 =?utf-8?B?RGdXT3YzUHB0Q2dNMXJteWhOQkZhMHUwRjNTQ1FzSGNtTEFhZUxJQXROOGMr?=
 =?utf-8?B?TWJaQXE4L2xZd3NFK20rdjI4NGwxbG5BdGU3Qll6b3p0cFFrL0grMVNobEdv?=
 =?utf-8?B?dXIzQVpwUTAvbGNtWUdZTTZzRHVKRS9QYVNUWmg2citFTGZqRlVzNWNGSGRR?=
 =?utf-8?B?c2NQVDdBbDNhbm51RGdQZVRsbURJWFFNTEI0YzFVeXR0M0FVaVRFR1AxazAy?=
 =?utf-8?B?cVp6MWZpRTl5VEpzSnovUTFrWHMycVJ4aGN3VkxyeGhuQUJsYUFjeng4dk1E?=
 =?utf-8?B?ekNqS1lFemJ2R0N1eCtyN3hqc0pDZkhmY25qNFl3eGxIQVdoZzBNS3R3WUJw?=
 =?utf-8?B?S0lBbW9SRng5TktQWEF4OEJ0RFNOKzF2dSsvYUxvcTkrZk9TNWNxNXBBaVBt?=
 =?utf-8?B?cDVGTDlxL1R2L1M4Q0svbVpoOVJ2MWQzbzVheDgxL08vcUFHQTNXaG5aM2py?=
 =?utf-8?B?REtmVXBBb0lUc21neGlIWUZ1L3pxMnpEWDN2SUpqcDN6TVMxSmVKY1d5ekdD?=
 =?utf-8?Q?Tqs8tbU7+w9Rg2zX1adovVNUcpu+RIAO0wWazlEZjWk5r?=
X-MS-Exchange-AntiSpam-MessageData-1: bag+tijMm8503A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e2b32364-f6c1-4ae3-9dd7-08de54acfdb7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 03:11:50.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Cs1VwaU1eIvG1rpHh28mgHQwJsdx/29eNF3dnSm3kvafT1DK8dCNBCALh5U1AG34i8z5RQeK6OwbRozAbc4Acw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9707
Message-ID-Hash: B5FGOI3BPGUTHCCQQQUT6SMS7RP36WA3
X-Message-ID-Hash: B5FGOI3BPGUTHCCQQQUT6SMS7RP36WA3
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Joel Fernandes <joelagnelf@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/B5FGOI3BPGUTHCCQQQUT6SMS7RP36WA3/>
Archived-At: 
 <https://lore.freedesktop.org/DFPONWB8ZGY8.1SXWBJBUAWN4U@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Jan 15, 2026 at 4:29 AM JST, Timur Tabi wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index e59eee2050a8..07a28c4c0837 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -19,6 +19,8 @@
>      driver::Bar0,
>      firmware::{
>          fwsec::Bcrt30Rsa3kSignature,
> +        FalconUCodeDesc,
> +        FalconUCodeDescV2,
>          FalconUCodeDescV3, //
>      },
>      num::FromSafeCast,
> @@ -999,19 +1001,10 @@ fn build(self) -> Result<FwSecBiosImage> {
> =20
>  impl FwSecBiosImage {
>      /// Get the FwSec header ([`FalconUCodeDescV3`]).

This comment should also be updated to refer to `FalconUCodeDesc`.

> -    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
> +    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
>          // Get the falcon ucode offset that was found in setup_falcon_da=
ta.
>          let falcon_ucode_offset =3D self.falcon_ucode_offset;
> =20
> -        // Make sure the offset is within the data bounds.
> -        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>=
() > self.base.data.len() {
> -            dev_err!(
> -                self.base.dev,
> -                "fwsec-frts header not contained within BIOS bounds\n"
> -            );
> -            return Err(ERANGE);
> -        }
> -
>          // Read the first 4 bytes to get the version.
>          let hdr_bytes: [u8; 4] =3D self.base.data[falcon_ucode_offset..f=
alcon_ucode_offset + 4]
>              .try_into()
> @@ -1019,33 +1012,49 @@ pub(crate) fn header(&self) -> Result<&FalconUCod=
eDescV3> {
>          let hdr =3D u32::from_le_bytes(hdr_bytes);
>          let ver =3D (hdr & 0xff00) >> 8;
> =20
> -        if ver !=3D 3 {
> -            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?=
}\n", ver);
> -            return Err(EINVAL);
> +        let hdr_size =3D match ver {
> +            2 =3D> core::mem::size_of::<FalconUCodeDescV2>(),
> +            3 =3D> core::mem::size_of::<FalconUCodeDescV3>(),
> +            _ =3D> {
> +                dev_err!(self.base.dev, "invalid fwsec firmware version:=
 {:?}\n", ver);
> +                return Err(EINVAL);
> +            }
> +        };
> +        // Make sure the offset is within the data bounds
> +        if falcon_ucode_offset + hdr_size > self.base.data.len() {
> +            dev_err!(
> +                self.base.dev,
> +                "fwsec-frts header not contained within BIOS bounds\n"
> +            );
> +            return Err(ERANGE);
>          }
> =20
> -        // Return a reference to the FalconUCodeDescV3 structure.
> -        //
> -        // SAFETY: We have checked that `falcon_ucode_offset + size_of::=
<FalconUCodeDescV3>` is
> -        // within the bounds of `data`. Also, this data vector is from R=
OM, and the `data` field
> -        // in `BiosImageBase` is immutable after construction.
> -        Ok(unsafe {
> -            &*(self
> -                .base
> -                .data
> -                .as_ptr()
> -                .add(falcon_ucode_offset)
> -                .cast::<FalconUCodeDescV3>())
> -        })
> +        let data =3D self
> +            .base
> +            .data
> +            .get(falcon_ucode_offset..falcon_ucode_offset + hdr_size)
> +            .ok_or(EINVAL)?;
> +
> +        match ver {
> +            2 =3D> {
> +                let v2 =3D FalconUCodeDescV2::from_bytes(data).ok_or(EIN=
VAL)?;
> +                Ok(FalconUCodeDesc::V2(v2.clone()))
> +            }
> +            3 =3D> {
> +                let v3 =3D FalconUCodeDescV3::from_bytes(data).ok_or(EIN=
VAL)?;
> +                Ok(FalconUCodeDesc::V3(v3.clone()))
> +            }
> +            _ =3D> Err(EINVAL),
> +        }
>      }

We can be a little bit shorter here and avoid the redundant by
leveraging the new `from_bytes_copy_prefix`. See if this applies on top
of your patch:

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.r=
s
index 07a28c4c0837..72b6bad5964b 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -1012,39 +1013,25 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDe=
sc> {
         let hdr =3D u32::from_le_bytes(hdr_bytes);
         let ver =3D (hdr & 0xff00) >> 8;

-        let hdr_size =3D match ver {
-            2 =3D> core::mem::size_of::<FalconUCodeDescV2>(),
-            3 =3D> core::mem::size_of::<FalconUCodeDescV3>(),
-            _ =3D> {
-                dev_err!(self.base.dev, "invalid fwsec firmware version: {=
:?}\n", ver);
-                return Err(EINVAL);
-            }
-        };
-        // Make sure the offset is within the data bounds
-        if falcon_ucode_offset + hdr_size > self.base.data.len() {
-            dev_err!(
-                self.base.dev,
-                "fwsec-frts header not contained within BIOS bounds\n"
-            );
-            return Err(ERANGE);
-        }
-
-        let data =3D self
-            .base
-            .data
-            .get(falcon_ucode_offset..falcon_ucode_offset + hdr_size)
-            .ok_or(EINVAL)?;
-
+        let data =3D self.base.data.get(falcon_ucode_offset..).ok_or(EINVA=
L)?;
         match ver {
             2 =3D> {
-                let v2 =3D FalconUCodeDescV2::from_bytes(data).ok_or(EINVA=
L)?;
-                Ok(FalconUCodeDesc::V2(v2.clone()))
+                let v2 =3D FalconUCodeDescV2::from_bytes_copy_prefix(data)
+                    .ok_or(EINVAL)?
+                    .0;
+                Ok(FalconUCodeDesc::V2(v2))
             }
             3 =3D> {
-                let v3 =3D FalconUCodeDescV3::from_bytes(data).ok_or(EINVA=
L)?;
-                Ok(FalconUCodeDesc::V3(v3.clone()))
+                let v3 =3D FalconUCodeDescV3::from_bytes_copy_prefix(data)
+                    .ok_or(EINVAL)?
+                    .0;
+                Ok(FalconUCodeDesc::V3(v3))
+            }
+            _ =3D> {
+                dev_err!(self.base.dev, "invalid fwsec firmware version: {=
:?}\n", ver);
+                Err(EINVAL)
             }
-            _ =3D> Err(EINVAL),
         }
     }

