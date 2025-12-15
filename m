Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70822CBEF99
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 17:45:16 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 731D810E644;
	Mon, 15 Dec 2025 16:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cx2CJBNr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F33884554F;
	Mon, 15 Dec 2025 16:37:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765816669;
 b=mlcExGaiK0P/6MZYh38lWGMBneWJv1pubstSM6T7/Uxv6KOGend0bYs7n6aP2dn2ugaB4
 wZ0Brv1AbT6fN+tPO3m5lviiEk/tYRdJoOc6v2xrTFRt4ogVI9YkRVIXab/ZKoCX8rAoVA6
 9syDYbYvFK1thFGRAbHIsbXvw49PLcT8E9kJMDWLdvJMZDDoTTQf7Ed+cD94gDgD69PjnOG
 69LoeJYGjC275j01wwAboqExeIFCywy221iy7OWw4etDwFOdCI3YM6AsXcTzLzP+qDyKIAw
 6PjOkmGhb+etp7FeP48a9k6571X8LkwlJa+HlMNVIQVELDfM6tOt+hvJhTIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765816669; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FnwE4Fxwjj4O+uwZ6vKdBGO+j4ASYn1jQ/eT+AnEfos=;
 b=RNx5XbicDeM3/5ZkyGEuB96PMi56YFuSxzgLAhC8FYKr2xVcJ/fkWrTPP3/hbf4vbDozN
 DVATacO1p4rxyerBm2aJDrkoBXqBRjyS2TCajmJG+Lf+vd6QkkNIYzBAso0sQ5uGWWxmoNn
 tIXh+EeGJuXO565TaYwiy5XJgha8FJXjbUrQQNHh5OF8ugymJVbF4MVc9SKq2Ugnvcv43lL
 RCwHIQz8lsRmIPHKwFnaVsiDXU5lUkSEY/1Clq0wWLgCp5MI5M/Is3ZO73M/euzcqyz70qz
 oGeUAXp7tequadt1dIdrd+T9nxX1SKmJEpRYRJzq2S5s0s11zExjtJq+5CoA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2D0D045518
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 16:37:46 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2158C10E627
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 16:45:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gg7yEvCwwIzqjxmYhlAVVAU4Nxh+QH7amoGqgnk7ZlIVDi/Iv9vhztIaWZNw77ikFDc9UxsW1VIb5SOwWl17fv8memMqxzqhQ4n8iJX4b0meIuYyTt6F4PTB+OSNdVjd/JeUh3AG5P/PVf7/wHaB3uDI0Mu3BXKzT9sqDy0bMvD3xLVMTCNh+xAaTWR8vaL8HKRcx6S6hh3l6S0R2osqmI/2NHZxUL3mGHNuS5pfaMpIDY7qP7hZ0/mbKMDcfXkANmEL3lKaTIEM9oL7bbAqghCopjaWpQcIOrQqT8Vka3owP2GYflsj8uOHNO7Af3BUQSj5a+kg/0YYAaQM/udjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnwE4Fxwjj4O+uwZ6vKdBGO+j4ASYn1jQ/eT+AnEfos=;
 b=g1GsMhEnje6+Z6VCzr68Kk2Nw1HNVcrwd/708PlN9evaa2p8riLp93R5VyTrnns2ZR2jSRRRLh2auRLbsTpX937x0FiWH+xBBJTL26lyqshgTxbrIJRgCFcsLElBSAcnDpyna8ORoITzKe1MPLaUaHJVOpEt4wgXWoMBHSjT00r+FKriv2oK+30rg4DV3FHIlds8uPdLBBT2fYLN+m4o4sUB1fNy21manYV5hvYAcWms0YN03MRN6fxSrcvrMPpA1RLRjBtpIaOEJZyRmnRdIlgOf+uS+twWQhZ91FfTiv9hQZ4EHVu9SP24jEIRZTDE3EEtuDCCudxqfv4NG+BkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnwE4Fxwjj4O+uwZ6vKdBGO+j4ASYn1jQ/eT+AnEfos=;
 b=Cx2CJBNr0JAZA1WHrLYOQGjES5F8JZ57TQyjlw3RWnJXMD4QI9/65hKXlocGpW1gR/rMMeuaQa5nWzTz3TeQBjUuOce+EllL9JYlqreogPPnLMPyyGk+7fmvReiB55TTGupmgUqjLcpFm3aBB22ihCu0LBWGYVaHO3va4ucmtHFoyMqRMRy9ML/3vxtzmB2mFBhn18T/JILDprDkK9LGqBLX9XJGqpUTdfsCDIrelshgujfWQ1URTBbFyy5rFe3igWX0Zp9wOjAZ/t7arAC01VDnwfszQGcShcGaDxVMONldJc78O5TuH8bmV5X0mDVXn0hcLJQ6Zw2Nm5Z9ffFxsA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:45:06 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 16:45:05 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 6/7] gpu: nova-core: create loginit debugfs entry
Thread-Topic: [PATCH 6/7] gpu: nova-core: create loginit debugfs entry
Thread-Index: AQHca6j02aLs1bYCkkOemM/xcz7WKrUi7QEA
Date: Mon, 15 Dec 2025 16:45:05 +0000
Message-ID: <a469a26a676471cfb507a432406d0fa2488021d5.camel@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <20251212204952.3690244-7-ttabi@nvidia.com>
In-Reply-To: <20251212204952.3690244-7-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|CH1PR12MB9720:EE_
x-ms-office365-filtering-correlation-id: 84e0c6f1-4673-437e-5195-08de3bf94ce0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S04rQ1VwaE9nQW9aWFh2S2ZVWmFLYUUwbGVQOFRoelpmall1K3BmZWp6OXJW?=
 =?utf-8?B?M2MyRjdGNHpTVmVCUk10K3JhdWp3clAvb0ltWUVlSWc0em8xa2lrOVdBUnQw?=
 =?utf-8?B?aG1Ka1Y1SGZLVm9QNjNQbWRhMER4UU9iYWVTRXVHZ2pBeFM5TDBiSnlUQXBn?=
 =?utf-8?B?UlBwZDZSMDVFekY0WHRGMXNRb21zRkcxNEhseDlQTXV5dEJCN3BXUmwzbE1q?=
 =?utf-8?B?UGQ2QTYrSmhQQ096VVdwNGR6R3RJc2x6NWZIZWFFbXU2Q0wvaU43YWd2K1hj?=
 =?utf-8?B?YnA2RG9ua1pSMW04d3BtQlpDQWdGK0NheGo2MzBuRzEzclVlVjc1d3VZZ2NK?=
 =?utf-8?B?OFJ5K3U0OVk0OFprd1NjcGo3S2FFOU92WW1rUHdSSmgrQk8rNUlOSG1yR3I5?=
 =?utf-8?B?cTROT3Y2RGk0OGt0b0JFZUh5SUFEYWNjdnp2dnJ2RVQyTVVrbTR5YXA2WFFh?=
 =?utf-8?B?ME1aT1U4clFPbDZhK2VsL0V5ZkZ2aEU4UU9nb1U4L3hMMDVMeExqNmN1d3Vx?=
 =?utf-8?B?T2IvcWJHcVJPUW5qTnBVVnNvV2hWVXBzZDVzNkFoWFZpOGFLdDRBbzhNUkx4?=
 =?utf-8?B?ZlpXNXJjQlNQdmRkQnMyRWRpM0pydWpxZGg4akl2aFJwdzNpN1hqTGRXcW9P?=
 =?utf-8?B?dkg2bS9QVU01azd6cFZPakNKMytZaUFtWTRYUTcxVTkrUlg5YUl5UjlkVTNC?=
 =?utf-8?B?OFkxTU1oa1RwcENnTXBNWjFsT1JINURJOXRRL2pIZDduY1hkTTNpQlIrYXZ3?=
 =?utf-8?B?VURhZkREZDNpYW9DeUNvanBOeFBUMnY0YmwyMytuNjZLWUxTaGVrTTg1SDhz?=
 =?utf-8?B?dTdDQ2YrOHRDK3pCWGVaOU5kN2x1WWFOeHNTNk14Yy9qU3lGM0Q5aXFsZ3Vr?=
 =?utf-8?B?cWJSOUpVTkVZdTh3d08rSU9TRmc3cjRZTkRLd05MMEZDMDI3TWlrcENvQXRt?=
 =?utf-8?B?WXV3YmM5VklSY0lEQ050TXhpSGlMT01UMnlSTjlNVWlkOVNVK25LeEgwSGJY?=
 =?utf-8?B?UkNvL1dHcHVvcVV6VHRQYkpMOVFiU3VMSmNZMWZsUHpQVSticTZKK2x4dzVw?=
 =?utf-8?B?SmJSREU0NVJ0c3p5VmNuODAwMG5zRVpDMzczYTdMK3ZsU0wyYnZJWXpHekdR?=
 =?utf-8?B?WjRFQUhhWitsUml6VGl5bmpMMmJiR1BrUFFtRUdmWE11UlhlKzJVRG1sK3Qy?=
 =?utf-8?B?M2NxS1VMOE9tM2dIM3JNTlJEWVBla1lCcS9DSVlZQnN5cklsMHZjZ2ZsZlE2?=
 =?utf-8?B?YnBSUHJydkQ0djlNZEpIT3pSdU50SHZkYXdTL3dZYnhWdUY1RHdscnBsdDlB?=
 =?utf-8?B?SmNjSHgxNk5aaExjTFBSNmxzRkpRSVVZNnp3UjJodXZjY2crSFd5N00zb2VF?=
 =?utf-8?B?bVpraElKOVgxTEFuT2x2MUl1V2JyL1NvRFFmWDZPWWQ4clNvM09CVkZ2cUlt?=
 =?utf-8?B?Q25DaWh2Vm1jR3M5VnBrcVZKakJ3ZGtvWGtOQjdXUGpvemJxTWJuUjVheDgv?=
 =?utf-8?B?SDRUUkE2OGVhRUF1MExKOXNyMmdRTmVlK0IxT3hRVVZCSFRoRzhiVStza0Y1?=
 =?utf-8?B?VWZhNXl5b3UvQVU3L0tuR2JBTjJZc0t6T0dSd0NDTHNZNXFsQy9UNW5ibG14?=
 =?utf-8?B?a1RDZXdCNm5lcEVPMUhYcnNLaEF2OHd4ZEl6ZGViNm9kcWMra0pRVHZleisx?=
 =?utf-8?B?d0k5RE5IZHlDOCthbDcybGpRczV1WnJSbHdic3h6c1RFRmlQNkNEM3FZTExm?=
 =?utf-8?B?K1NQWU5rRGRldm8wTGE2WG1oK3JGQTBQNTI1ZUpIZkdHVmdMUHNGQnpQSVFj?=
 =?utf-8?B?cXQ4WCtYbXhleWdxOElzbjQ5b09vQnF2QnJBNnFubzRhQStrUEd4amlCL29k?=
 =?utf-8?B?cUo0cWdWV1ZvdURLOUhiTWovNjVkMXJpT25pY3B1OWtXL01HZUFoNmRhYXhy?=
 =?utf-8?B?OXgyelkwcE40SGRlQmhmLy85R09ZTm53dU9TVmY5NklYVjJoODl5Wis3NHpk?=
 =?utf-8?B?Q3J3bVJkZXpRYXpKNEVkZjR3b0hjbWw0c0hkZGFKaVcxUWpsM1kvc3E5TEs3?=
 =?utf-8?Q?ZszABi?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YmpmdEp2dWh0d0lHTW05bG1aK05RaVFNZVVrUzNGUmJyMndlMGl5am54TmpU?=
 =?utf-8?B?YndpNGhmdW9nZGtZMGVhRVdkejVhVXZKNGFRKy9WNlc0ZFhiSFc1STk5THJp?=
 =?utf-8?B?d3g2VUg5WFkvcjZTem56QlFXRjB4RHdJVFIvOUZHTXdCR3lQYWhWME81NHBt?=
 =?utf-8?B?aXNkMWZseFN4YXRYME9saVFUSGRjbUdIRlhZTUNxdDFmUnI1c3ppTUtsV1or?=
 =?utf-8?B?anFPbTcxRCszcXo5MjdJUUlrbmdScmlhNU84RThQaFhKVk9aMlF5TkZVOVR0?=
 =?utf-8?B?eC9qQXZUVCt3VEtLYUh1YjB6aDJpY3paL1g4WjIxaHVkS3R6NllKUnZIdWgw?=
 =?utf-8?B?VmZjc3NId0pyV09rSmZVQXlad2kzOUdXdFN5WmtrQWZFdktzclA1TUZTQTdL?=
 =?utf-8?B?cHFYUUxLOXBGNDBxS0J3YStnalA0aHVBbjllUWJYaXlHQmZ4MkZ6YWQyejlH?=
 =?utf-8?B?aXg4U21GKzJBWjNPUTh4dllOSGxqUEg4NG84RlNtTlFhZ0VjMUtKL204eTlR?=
 =?utf-8?B?Rzg5aHl1Q1dCeXJSZ1BQVEx3VnZmME95dVRZRUlIWjNFTVlUV3E1V3M4ak9o?=
 =?utf-8?B?a0FtV3lzTld6UmpzRkNndllDeCtLcWN1Z1NwaXJwaERzOWVRZ1dUSFNWSVg2?=
 =?utf-8?B?b3FJY29wdzJ5c1Y2RmhmTXBPNUl5c2luZjZIdW1Wa3htRVhTcFZqQkRuOWpU?=
 =?utf-8?B?ZnhkSWNRaWpwUmxsbnpvQ2F5YnVKL3ptWTJsMUVsNW9waUFLQU1oU21qNXU5?=
 =?utf-8?B?dFc3RFdpRWRmbVVOUjEwdml6cVF0Y0hlaXdwMWQrdG0rV2VvRU8yY0N0YjFi?=
 =?utf-8?B?KzJmMEI0Y0RXYWxManFvMytTS0h1VUoxc29NQm51NkNoUnNrb1QrRGljQ2hL?=
 =?utf-8?B?T0UxRzE1dVV5QUxla1hiV1M4ZnFWdXpXczVUazltbE5qNWhxRUVjdHhheTFx?=
 =?utf-8?B?YmwzSENVQldDekJCTVBPRkgrMWtiaktjVEZTQjZOOHJueE90YTQvc2JxUC9K?=
 =?utf-8?B?OGs1NlBQVFhrN0d6QTNMc3YvL25LN2liWkc5Vzd5aFMxWlZYTEptSHhObS9Z?=
 =?utf-8?B?c00vU3BldFdhN0lnaFY0MDNTOTZ2ZkdKbU5iZmliWlYxeVVybG0xaS92dXcw?=
 =?utf-8?B?d1Z6azhVdzFnaHA5YzBQRVlKY1VjdW9LZk80bHV2RTkwWkhoWnBOWHl4cFNM?=
 =?utf-8?B?UDRmdFNFeDdSRVhqNXhLVDhNN01vU0N2dmlDdnBaTC9nSXlBSTRxN2N6UWVw?=
 =?utf-8?B?R3BYSXd1VTVkRndqV050eC9OeXpGOUdzb2hvbng2ZDNvT2xpTldJb3AvNjh5?=
 =?utf-8?B?QWNRcUQ4NG0yNzcrTWg5TUxVd01rRW1BYW9WZVlLR1A5Sk4zNWpiT1Axdnha?=
 =?utf-8?B?eEM2ODJLVHc3V0VCYnQ3bkJlQmFIbEE4SG5YallDc3kwTjljRGhFOUVERXpN?=
 =?utf-8?B?dzgrbW9NMG9DeVdmK05VS09GeDdINmR1MlI3VWpqTGxpdEtlSk5VUENpcmgv?=
 =?utf-8?B?dGVqcUxycjlIL1MvUDU4b0J6cmdpUTluZUhMUFJjSHBTQ1dUZFpvSXdEMkwv?=
 =?utf-8?B?ZmI0UGxxZm9udUEvOC85a0YwbVZYL3hOeTFLRWFjUG40dFYrMmdRSEV1WEpn?=
 =?utf-8?B?MVJBSnV2emMrY0srZUdSMU1xU2RLRjk4L1VNL1lzVkp4WVVuRm5ya1FyOE83?=
 =?utf-8?B?bk9hdmFoZjM1K0FqanVML1NoSjUyWXZOVW8wU2FmNVlKcVVXRVNobERVZVAw?=
 =?utf-8?B?dkY3SlNiQlJ1VS9Gb3B0ajZ5OER3SkhTZjRScUtHMzdDSGpyQlR1cFh6cEdl?=
 =?utf-8?B?M29kTjAvWDFnbkhQa3FxbEt4bU1mNERCMU03OUdSakwyTjJuK0JmZUdVQUFK?=
 =?utf-8?B?ZmppSlVRM2JQMndKdzYxK2VDRHd6dlVEYjlYS2gzcEkvK1JGcVQvcUt3bHRD?=
 =?utf-8?B?UmpQN1BDdWp4QVpvMWhUbmNWSUtOM2dCODdmSmFZN0lEYnBUSThNelp0M1h0?=
 =?utf-8?B?em5vVDRjaW1JTE15OWkwdWFQODZoUXIyQVcyZ3BUVnZCL2tXUEtITEN6UTRw?=
 =?utf-8?B?a3ZTMzVjVG5aTHRuNXRhTVpud0hrRTZuQm9FdzFzL2JBckppVUlFTXV4UDJ6?=
 =?utf-8?Q?zV2uZZjYknfd1HaFZCK+NWWcB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D2527B0E22FD74F8CCC76D01673783B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 84e0c6f1-4673-437e-5195-08de3bf94ce0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 16:45:05.5752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 jI3c6rWJVX/xl+oMkqJpzBtVi2RbWUOLh0dOtyZe6pgPrvB+YfRkxVU6xbaiY8jW+nua3mta1WBugc7JhFZIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720
Message-ID-Hash: Y4QTW2FYF7DWHJP6SG72EBNM2QBIARFR
X-Message-ID-Hash: Y4QTW2FYF7DWHJP6SG72EBNM2QBIARFR
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y4QTW2FYF7DWHJP6SG72EBNM2QBIARFR/>
Archived-At: 
 <https://lore.freedesktop.org/a469a26a676471cfb507a432406d0fa2488021d5.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gRnJpLCAyMDI1LTEyLTEyIGF0IDE0OjQ5IC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBG
cm9tOiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZpZGlhLmNvbT4NCj4gDQo+IFVzZSB0
aGUgYHBpbl9pbml0X3Njb3BlYCBmZWF0dXJlIHRvIGNyZWF0ZSB0aGUgZGVidWdmcyBlbnRyeSBm
b3INCj4gbG9naW5pdC4NCj4gDQo+IGBwaW5faW5pdF9zY29wZWAgc29sdmVzIHRoZSBsaWZldGlt
ZSBpc3N1ZSBvdmVyIHRoZSBgREVCVUdGU19ST09UYA0KPiByZWZlcmVuY2UgYnkgZGVsYXlpbmcg
aXRzIGFjcXVpc2l0aW9uIHVudGlsIHRoZSB0aW1lIHRoZSBlbnRyeSBpcw0KPiBhY3R1YWxseSBp
bml0aWFsaXplZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291
cmJvdEBudmlkaWEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBUaW11ciBUYWJpIDx0dGFiaUBudmlk
aWEuY29tPg0KDQpTb3JyeSwgdGhpcyBwYXRjaCBpcyBub3Qgc3VwcG9zZWQgdG8gYmUgaGVyZS4g
IEl0IHNob3VsZCBoYXZlIGJlZW4gbWVyZ2VkIGludG8gcGF0Y2ggNy83Lg0K
