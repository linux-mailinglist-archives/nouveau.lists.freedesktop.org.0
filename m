Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18661CC0E38
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 05:27:54 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8A9810E6A9;
	Tue, 16 Dec 2025 04:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q3WUF7gQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6DB3645574;
	Tue, 16 Dec 2025 04:20:27 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765858827;
 b=H1ffAQgmRU68ryQOJoZNBUpQIFcKTS2EKXk+3x4DqmD/WImGIN1I6eY9ntAbTBqPSZUvc
 XliYcCBEDMxp0XihXGDPmEwmpW7nmYBswOBpyKb9nJwWLPeoz5953vXJylJzazlsGemTBAI
 6wQojDbowlxx614I2LXgsS/GPtYMAHx6ZJpf79MAaUILGi+23qb7pUOM2KTf3SxMIAnt9K6
 kwKdEQp1b3GJJQdXrD4O6TPQq/2VijKqrkjX6x7bQhjYjC3DJ1RSQizu+2FzNcrW95o/KCJ
 MgZQEWJA81TgIYAnYIysoBEIDb5BZGnqvLNMwQRsHGk6vTySZ1Ri9IblRAZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765858827; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ic7EptXahZDuq2u/O+ZWlj1Se7HgP3UjssUUpL3y35I=;
 b=S4jAgKRDLokuTX8P9lv65GCmgftZ2XWXJqw0W9HdUV0HYBphd/NxcEBVQbC3bjQNM7VDZ
 YZvt33tNwNgzofhfI1z0sY+UdW3nfuP9hRDfKbamDT6EPWCZZIINURdANQsFeMP4knq6NKU
 h49mD/89/pRruwd3pmzGmZzMrE3OtsaNagP+ADcYAZMjUf0oMHrMCw8bVpH/LJc6uilhr93
 J5fKOt64dnqJ3yoOKPm1QQBj6w1/nOVg8ANWhPwidXqEfUhfCJnvPzfvxk6n0n0GihtPMar
 l7/0td7fDv9XRrGDgVW8/1SfN4XKlijhIpThNPFTXngGni4lnGVCv9wBVv/A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C439C45561
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 04:20:24 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1086310E6A0;
	Tue, 16 Dec 2025 04:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1p7ZXMLe8Z/2HeINL6JP7U1eMhqXrb2wVErpyG9ztO6icvsH/PuY8FXikjNRo79LLXuQsjSGN6ysT4nOsSEfZrBkiE4tp3UsBIQOmShfLtjD/njz1xHFg/4zgUrm/f6/M9qvmwwRCkcaMixhMJ0M9oA/PuR5PdaIZDqsJHW5Ly+5c9rrGK2wprj9U9t6tMydQ6QbvkejleomcxPeBZUGA4GqmVgt1t8+VaZjpX5g9X3eFqy1pfn6MyKgSPHdxVhmcw2bVBLb+yFTESlLqNZo9YMZ+nvRBdeupg9kH9SGlwzrH4eyd4kMya8JkJf0j/RfECHOB+XqFcUgzPWdARIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic7EptXahZDuq2u/O+ZWlj1Se7HgP3UjssUUpL3y35I=;
 b=x+uRfBKpOQukvTo8+TlgAK+PsqakWhm8jJ2e3oNwvVm4ySiWCNWXH8ZCrblZLJhHentTgsCzGtIYZHMqhNOz8jJf8d7FZr4Rk8/CwlBmRt+/YGWjYuNnb3B0k6HySyilueNq86fzfYDhfXNUc6vAIMk/3DSBT2K0qMZ5SiA/JDudNXF9AvU7HbPuMY1/t8q9LPwdsExeMMyNtCNaoHscs9XbQ6jMwzjlx486XsRFIveFmQLN0S3WlzZzv8y/b1zgqRmfaPbo4SP9EwUXApcZ8WvTBRE3mDSzDo+BMAe91bZhCoucWiaCRrM74uD020lQZ3nozhesCAknIXzWuFUdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ic7EptXahZDuq2u/O+ZWlj1Se7HgP3UjssUUpL3y35I=;
 b=Q3WUF7gQivwfSihehC7McaSxUJF1d+0RgKRep93oo+4eijfLCBchIAQwAqzBH2hHeu1ogha3FmahnQFTvvAQywmcmmbJZPGIp2KH+XqFYavSHVPMuWmu47Wwyp6h2TbMcxxTZXfMgvvN+HnhsfCyZ5S2sjSFxGUZGxb5iygqcNQ6qu0OvWiEvbtoqCEuvXSOK7d/QqgX+3JLfncwJHXPLcVs3KssTUCzjUxvXns/wuDb9HkTn2LB1Tcv0ol9U+xJQBUJCSVDMVi2fq47aTWFI6iElCevlrZNEYPBhq2E1UKMAAeCLAGk82oDNZ6sgE0XNKrHfUZMNTzSqCs+aVoPpg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:26 +0900
Subject: [PATCH v2 06/10] gpu: nova-core: gsp: derive Zeroable for
 GspStaticConfigInfo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-6-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0137.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: a370dbca-266f-4c49-d85c-08de3c5b77ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RnBPQWFyVkpGREpwVUxWMit5aW8wbU92eUVuN0dTRStiZUVVMDlWL0tzY2J4?=
 =?utf-8?B?aUw4UUNxTi9XQnVlazYvQ2JKbG1uSEh0TWdueHJwcmRRR2xoZ2hudkJrMGZN?=
 =?utf-8?B?MXVUdzdYMG1rOUV5QnUwdHozbGlvRWFYazU1UlFIQnlDYXBjRHZwZ0hocU81?=
 =?utf-8?B?bHBKOUo3Tld0MjJlbFFRTmQ2clU2aFUzbUs2NmFhMWJpNGRRTTlUYWVSV0Fv?=
 =?utf-8?B?bnVLTHVQNzVFYXlna3VUTEMvb0pwUTJLZHlHcCtzYWdVdDFFakJIUnlUOG05?=
 =?utf-8?B?TDM5dkRiUm5iMndoaFBXUXFQSmsyRURtVVloaUJURk5FRElITEFYM2JYb3Zx?=
 =?utf-8?B?Uk9rWjhnZWhyTGIxQlVXREJwU1RPa1p2L0YramhoRlAzQmFVWUhXVFBJR1h3?=
 =?utf-8?B?RVJpYW8reU5ra0p5Ym9FMGxNMjlUYXNyR3NjQ3pJUnQ4dFZzUnBQaUZpVlAy?=
 =?utf-8?B?NE9vQ1E1SFZZWk9uODdFRC9qcXh3MitZeTh1bGRLMnZCbFpEZDB3ZUE5U3V0?=
 =?utf-8?B?c2VIVVlFcUtsak16cFpsYmNnV3BFSFlYNm52bGM1QmtyTnNxb3B6aGQvWExY?=
 =?utf-8?B?MEFQeXZ0S2dEamFqTms1b2RiSGNRTUFERTZQdDdpZzBkMDlJVS9KOFFGNElM?=
 =?utf-8?B?Vmw4VHQ0elhST3RBOE14OHBZVG5uSnJhWk1hYjAwNlFjNVNXU2JkMFlRZ1lC?=
 =?utf-8?B?YkRLUzZIb2lKbUx3RHZiZVY2MmxSeEVGV0I4cGJaczYzZjlmNTZDeVZNbzE1?=
 =?utf-8?B?VE91L0ovYkdHVDUreGJhU3RUNEVrMmhLc1JuWm5VSGxzOXU5em5KTGkzN3hW?=
 =?utf-8?B?MmtvZkc2T3V0cnJ2aU9BTVdMNi92NTYzcDJwUm1ockREcDYwV1JKSHhORzB1?=
 =?utf-8?B?cVUrV3RHaStGT253SC83dzdzYURyYVdOK2JrMm5Pc2pXb01heXpWN0ErTmxn?=
 =?utf-8?B?OTRsZUh4dW5MS1FwbHIxSXo5NE41eER6L1g4Ui81dk01Q1BvZlowc1ppL2cv?=
 =?utf-8?B?ZEVPQ0FwZVpKekh6emZpN1NOT1plaXRrTEVzZlFOUVpkaWVZcHNPS2hPK2FS?=
 =?utf-8?B?Y1NOcFE4Z1UxSlAydDI5aWhlYU5VU2d6REt5RllIYUNCSEpmR3hNOHFheFMr?=
 =?utf-8?B?Mm15cUNjS0lod3JMbE9OcTUvRitORXVpRk4zcnlGQkRDMkZMVWllY1A5RHp0?=
 =?utf-8?B?MnJnTUVheEcyV1FnK0Jma3NEcTZFVS85MDRPSG5CMXo2TjRTK202NWFEVjBD?=
 =?utf-8?B?RzdOcHFEREZYWGxQNVdwWnY2VnpkUEhrcEFYOVgrd0J5bDBURzI1K29OSzB2?=
 =?utf-8?B?b0FiR3g4dEcxNFd0ellFTWV4d3pQbEEzb0NYZnUveG02THFQelhvUjJZVmJw?=
 =?utf-8?B?R1h5YnZNd3BxM0hTa2xKc1RMNE5GVUJnRGhPS0REVkJqaFBLWVdzS0FUdU5B?=
 =?utf-8?B?Vlo5UFFQdHhjUkxHL3lFMldJQW1naGluQXozTEtZYXNJT250cXgxam8zMkEr?=
 =?utf-8?B?N2o0TzRVbDFjTVNKZit6NGNzOVlYanZSZzMwTGh4RmVNV0phU29qdWNJMzFW?=
 =?utf-8?B?bG90a1pWWEM1YllhNmQyTVAxSlorRWcvVzlXbEhtU05FOC8rdnpiLzVCbnl3?=
 =?utf-8?B?ZFFqNlo4VjZ5LzZJNUxTNmNBeWVwczYxYVBBYmoxSmlBOEVhN0NaMVVVNXRX?=
 =?utf-8?B?ZEwvU2xJSDkvaW1YRGpzWVIydXNEQnVkRWdGOGU4bkpHWURTR2hpWUw1WHU5?=
 =?utf-8?B?SThXa3FxaUY5NnJSQ1hMb2R6TzRmSU94UzFIOGJlbjRvemdUUC9ucnBtS2FM?=
 =?utf-8?B?TnNsZTIzOUJQbEtYaEhWUWIzdUdZVXMvbjlyc2NDK0theDNQQmplODJLL2tV?=
 =?utf-8?B?dmYvT2xObFVzRnlnQ01KVEpYY3VId205blhFTHh3aVJ1RllvZDFObkR0OFdM?=
 =?utf-8?Q?Eh7PFQSyY2jOkaJVy5V7IeUJUxCrb2dn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFROQWVMclFBWjgvSFBneDNlOXNrSCtBY056b0x1andqaU45UjZ2SjJBWm9v?=
 =?utf-8?B?TExzK1JGOXRPT2lxeEJHZzB4V1pPZE5PWDJzNFFtazNaTU9DZ0ZYa1FDMWhM?=
 =?utf-8?B?U3RJRXdhMGZxcW9pcS9WemxmTjlJMFkxMjZaeE9CSFJ3aGFMTkxhRSt5Q2lh?=
 =?utf-8?B?cE9mUS9QUk0vZmFiOUxpVFQvNGxFNUcvUTZtMzhyTVVnT1FyVXRsSWhIR3NN?=
 =?utf-8?B?ejJPTkp0N2wxSEtlbVN2S0VNbVJzYWprYmsxV2FuNU40bEtDeTRkb3o1TkZT?=
 =?utf-8?B?cDd1ampzVEU0aHlWdXQ2MEo3UGRCOVNyY1pvQ2V1Umg2WE9JSUNSc0U2RnNu?=
 =?utf-8?B?Y0duMDZPQU10QnVRVW9xRFhscDFnbVF6RnlSVjBiNVF2ZnhZTGNtcEpud3NS?=
 =?utf-8?B?T3A1MndwMXNLY0JSNkZKYVVZVFJLanBGL0ZhMnVsQXRKTGxsVVVTTCtZbGFw?=
 =?utf-8?B?N3VZU3BjZWgveXo4NDhLcGQza3ZIRFQrdDhUTS9ZUDl0OHdXaG10S3JiV1gz?=
 =?utf-8?B?aFJ3Y2k2TktxaWt5UjNHcW8zMmZVMjV6VlhsTFpkcHlnSW81eld1YzYvanJ2?=
 =?utf-8?B?QXg2QWxIWkZMbFRrSm5PeEdpdEF3ODNxZTAra21YOTY3dXY5enR1RDRhSjFL?=
 =?utf-8?B?cjB1TjF1MGJFbHFxcXFWTnBPUWRhcGlNZGJHaDF2Yk9jbWUxbGxoQ2dmQUZZ?=
 =?utf-8?B?Sk9KaFFtLzdvZllKdmdlV05wdzhLK2w2a3lweFk5bzRsK2pYcjFSR1ZsVzg4?=
 =?utf-8?B?NWVwVG9ENFA4ZE4zV0xLZVd5RnYyMDAyUzJXSEJrQkIzaXk3UFhvT2oyNlJa?=
 =?utf-8?B?T1g5aWNZbjBwdTgwK3cxRityL0gxRUVLM1NPa2t4SHoxMnVEMUZjY3pUbDd3?=
 =?utf-8?B?djgySkN6N0NDS0ZVNDdhN0dURzNtZlZCakVrbVc4QkFaWlc5bmlrQlVWb09J?=
 =?utf-8?B?TTdMTldnRWJJRTFIT3lsb2dlR1JuNmNGZm9xTDlRQXg5aEl5dzgra1h4SFdz?=
 =?utf-8?B?b09XcGNkZ1NoS3RtTFN2S2lxeU9BOE9iVnpiWkZhalFoREZUa2lGMjl0Q0RI?=
 =?utf-8?B?S05wclJxMW5hZFFKRnJXQ0ZoWWk2Qkx2Z09ZMHhSL3BpWGtlMFFzd2U5MVZK?=
 =?utf-8?B?OEZRV29xRFUxL1V2TkFLZ0IzOUxpMDBJVGtYaFhmVVNKRy90YkcyWDBnZGtx?=
 =?utf-8?B?VWNjSnBsYzdYUzVLTjB6ekJldFd3cjhnRzBzdEh2c3JEVTZhVUZZYis4akRO?=
 =?utf-8?B?bU1aSXYyVG54Vmsybm9NTWVCU2t4NVdmaUhwSlkwTkpaandtTW5zejVvTG9M?=
 =?utf-8?B?ekZNQVhjS0hiZ01sOGpJd1N0eVVqcThsTTAxeHgycjAzSDZ2OE96QU04eDRl?=
 =?utf-8?B?VENpL1hEQkpaNGU1b0F6S1dDa20rd3N4YlZ2c2hZOWhKZ0l6Z3VhWHNOZW1r?=
 =?utf-8?B?Y3VoK29iTkpsaytZQ1Z1NlJMWTJqQkxVTUdUR09wczMxQm1KNmdMT1ZpSTcr?=
 =?utf-8?B?ZXdURzlhVnY3c1E1eHlWNGdLNHF6bG5KVCt4VlBNK3RYMUkxaTV0SzYxTE1R?=
 =?utf-8?B?bnNGUVpYKzB4OXZqSFl5NGFsdUY0YjFoY2Q5UjYxd3ZKODcrMmk4YURVcUFs?=
 =?utf-8?B?S0l2OEhWbTRSb000Q1FUTy9XK1dHSmx4MklrajFpK3NDd3ByaDBpR3c3aUtS?=
 =?utf-8?B?NlVEV3lwaENISHdjSm0xbGZNeFNXbHBDVCtnQVE4c1dDNzliVEhvTCt4clZJ?=
 =?utf-8?B?N1J6N1NQY1UwNnRkYmtHVVFyQU5mT1VHckd4djVkcjY2L2s3cW9ZSE1rOGJ4?=
 =?utf-8?B?c0ZmOVdPN1ZBbVk5bjVqTCtER3d6dThpWEFGMk5ocUV5ZXY0VlBGdG4zQk9R?=
 =?utf-8?B?d016eVNVVXNOMEpYMkdEN2RvWlBqVUlNK3dkbEV4WkJNS1p4SlA2VVZ1WUIr?=
 =?utf-8?B?Vkh4bjEzR2FwcWtrcGszd2g1Z054QUI0TjJjODNXNndTYVBveGJIZU90T25r?=
 =?utf-8?B?ZXV5TGl2M2VuakorRnlBTWxtWWNWNkw2R1IwSXJBMWZubGZveUtmQUJ1bnAz?=
 =?utf-8?B?YnBUQ3oyclJ0OEUycWZXMm1XVDZheW9SaFJiUGs4WUxITTdQVWZqMDdJd3lr?=
 =?utf-8?B?V00rTG4zQ29jMlNZd2tJTXlmSjY1Tnl6cldrZjhmRWlIcWl2WkM5UFVRazNU?=
 =?utf-8?Q?yixTfpjmKQ9lKkLXrlr+hypN9jf9q8A0XL+YZO+Zw8em?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a370dbca-266f-4c49-d85c-08de3c5b77ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:48.1822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kb9FjB8AvZuz4rXO1qHTg4vTuwqeySsgqjTJBLWKsQDwe/BLs5ObLM56F5vbfF2p7fkaM9n/P06y/gooXgp0IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
Message-ID-Hash: AOFZWXVXFVECLXWU27WTRLYDJZ37YMRY
X-Message-ID-Hash: AOFZWXVXFVECLXWU27WTRLYDJZ37YMRY
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AOFZWXVXFVECLXWU27WTRLYDJZ37YMRY/>
Archived-At: 
 <https://lore.freedesktop.org/20251216-nova-misc-v2-6-dc7b42586c04@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

We can derive `Zeroable` automatically instead of implementing it
ourselves if we convert it from a tuple struct into a regular one. This
removes an `unsafe` statement.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 21be44199693..85465521de32 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -107,12 +107,15 @@ unsafe impl FromBytes for PackedRegistryTable {}
 
 /// Payload of the `GetGspStaticInfo` command and message.
 #[repr(transparent)]
-pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
+#[derive(Zeroable)]
+pub(crate) struct GspStaticConfigInfo {
+    inner: bindings::GspStaticConfigInfo_t,
+}
 
 impl GspStaticConfigInfo {
     /// Returns a bytes array containing the (hopefully) zero-terminated name of this GPU.
     pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
-        self.0.gpuNameString
+        self.inner.gpuNameString
     }
 }
 
@@ -122,7 +125,3 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
 // SAFETY: This struct only contains integer types for which all bit patterns
 // are valid.
 unsafe impl FromBytes for GspStaticConfigInfo {}
-
-// SAFETY: This struct only contains integer types and fixed-size arrays for which
-// all bit patterns are valid.
-unsafe impl Zeroable for GspStaticConfigInfo {}

-- 
2.52.0

