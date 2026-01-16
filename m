Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43732D2A76F
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 04:00:53 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF8CE10E209;
	Fri, 16 Jan 2026 03:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OLqYU/KA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 610EB40744;
	Fri, 16 Jan 2026 02:52:16 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768531936;
 b=RwKLBg7C6cMxPBBdRoGBc7l29s8PmMbwnfTqCgJU2sUP16D3gKe1F0yc5LSmoqj7saUDO
 ln1xFlAtmWyD4kgpi11HSbSOKSncV8aa5lTuu4bqxdojzxidleCKm/L+QTnLm6E4ksUXRA0
 nVoqzWaLs1eNNMQOeokLkDxF3B4ZHjdpkFlDcx7V3oa6+mrLnsAR3r3T96mlxcfn9SH73px
 wN1XZGMBCxVRect25N5C0KBGn3phvJhWECOUGBjkfLt4eQT/cHA81CKRzik6KI++U7T1BNI
 0bp5NrvQdsU4ybFVfLtSoyoU6J/mZjn/HAitkefHm4EkVwkhEr6N+PehnKvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768531936; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ekv3aBGFSCKhgRzaui+w3oVa8n8gSxYl8HQqS7c1jX4=;
 b=U+BJ/6ICQWYhFHElcYRzmAi08VY9mBf7oT/cE0BDfd1z3egJsRyUI2CNfcil3vQ1pf3Ca
 TVvcIlwRezkbIWiIGZTw2cPUm4O6oUOakUppdPo+1dyUL9EY0BC+aTsuOiYEmVMiAVOFyf9
 GgivO85LTugP9kKCoiQa67Kj6Y+rhTa4YuuSK5VpujM9oFreFoKATI/sKchdItkOhX2wXdP
 qXQQaC/ygob8sI3d/elxZcIDFo7KDUzHOomG//qbr+aGZnvQJwQ3RNi9SdU0YgPjB2/9usZ
 r0QosfUl+YtDOoyCa0CNWa9P2Pu4x5/5TTM+QsWce4Fprmszvvm0AGBFyiLg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4154340635
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 02:52:13 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013011.outbound.protection.outlook.com
 [40.93.201.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C27D10E142
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 03:00:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZsoUUj1+9L4a1DrNrLIluBomehEjD2Bc6sVftkhtSZWFlyTBRz+Kj/d+tLaJ4zqnDdBVKqLMbLrvVnko4vUK3nZFsYxtahnVZV8yr8Qs8lnBRDUS1RCzwLqJAfT+inPzuRYUSXRzOpa4z2VXWZrllpNWhi1Q7HA7GqHeB/+2f+fgu4wJVCXXnaRNBLE47i60cZ6rkj+joxqrIvk4UvSf1Ugu+F8FBYhDCJCq1qiLlKEqZkry7juIiSx7kIrjO3S/LfofdRTw2aLX+yiOeBhDKuLw+LCfPRQgeYAiufTTHYwHKi/jYSFGMlmyAEtRta5iv1lqpbcoumzhsZTNjp1pHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ekv3aBGFSCKhgRzaui+w3oVa8n8gSxYl8HQqS7c1jX4=;
 b=Wp/BFq/A62NjA8r/YLTR4Tr7Hqio/9iISclvYKY7AwOl40qNnHc/9c9zWPWpuO2DJ8MkZCvnGXHlxQ17HLR+/re5IJmmg5QVT8hT9vENu0EkxFaZyjksn68OCwiOLuGSDIz4XQqhNpYfiw7S3Be+wAdPRVMUh1GGG1lFlKdVSrTIOPLcn1IpxXxYKXdI3jKDLfodn/BZrGEw2NwlRHZlIj6C7ee34oMw8hI8LBQ1Bn7hJWjsNYP2JA9asQng41qF+viVbXi564+fS+mCgF3KIUXwYmrTJ7yU6JA0JMWtpQiKHPhih+SmbDV2kMotFFFIhjjbV8T9AjYak9hUH5b/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ekv3aBGFSCKhgRzaui+w3oVa8n8gSxYl8HQqS7c1jX4=;
 b=OLqYU/KA3SsMkQP6KkYn3JixmtSLf3grSM78dMLr7PXq+hGRu6ys9i5MY9SwEFAbmwmyyk0SvR09m1kJo53wAKmi+ObiO/x7AGoIpTSU2eX3QIKOVxbVPTSHuyJoA82A6gDXc1fmiSFSsq7gCdD0MDNFPZ2lM26KVtH2MKmpSRLszpSC5AOA2Ht+J4Um3fjH8mk4n8ZcmK9q1Y9/lXGTXPdTw3PEM+SH5iX1EkhBsyo/qU1Ccc7lyaCXwyrJVM4I35CUY3BzfU/IouJxYTbcLszrp38Bv4lSoNAHCpwJp223dlzc9rFhC7qiSzU8BI6vJo5/867KQ4Kg1D8tXG8jOg==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SA1PR12MB8741.namprd12.prod.outlook.com (2603:10b6:806:378::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 03:00:44 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 03:00:44 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v6 08/11] gpu: nova-core: add Falcon HAL method
 supports_dma()
Thread-Topic: [PATCH v6 08/11] gpu: nova-core: add Falcon HAL method
 supports_dma()
Thread-Index: AQHchYxAxAszBe274kWrBB0IKXLnS7VUCsIAgAASwIA=
Date: Fri, 16 Jan 2026 03:00:43 +0000
Message-ID: <fde6f4c38cc60513027f4fff9faabca0d8fe9c7e.camel@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
	 <20260114192950.1143002-9-ttabi@nvidia.com>
	 <DFPN02R1FL1I.2YYMWZX57DEY8@nvidia.com>
In-Reply-To: <DFPN02R1FL1I.2YYMWZX57DEY8@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SA1PR12MB8741:EE_
x-ms-office365-filtering-correlation-id: dfb521bc-b01e-4b74-f458-08de54ab70bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TDFNMklndVo0Y2ZZOEhBZWVxZEkwNi9LQXRYM3NhR0VvQ204ZCsxS2hwSzBL?=
 =?utf-8?B?NDE2VmZONkhVRys5a21pNG5TRWppaVNmNmZzdWhXZXhNdWRwVXdyTGZwL3J4?=
 =?utf-8?B?NnFaQXdtbFg5dTZZSXFnNVRQT1MwRUE2Vmd1MFJvL1V1UVBadXdQMWVhZkV1?=
 =?utf-8?B?RitQRyt3MDlKck1LcCtQalZGTHlYT3RQT0YvYlBxaXgyY0hwVThVaVBESi8z?=
 =?utf-8?B?dHRndS9nYjM1em0rSk1HdU1wblk3b1pURXg1V3ZsSlU2OUZqU2VDY2VpcnRj?=
 =?utf-8?B?SC8vT0dZRjFQaW42aklmZ0NIMkhrR2pWYVBLVWtHd3Q0TDRCRWY3RHBYVkFH?=
 =?utf-8?B?NkI1TjVDeGJwaVhhdXovNkI2U2ZTRVM4QUc3SjU4NDNiZGpwcktnbFVTUXJx?=
 =?utf-8?B?UEFCY0ZuRGIwSCtvMklQTEpOaGVSelhIbzhtMEYzZ3NST0ZpZnVSZE5MRE9r?=
 =?utf-8?B?eEdXWVRTOFBBMTBtdkxMV2xkQk13K0p5MzNlendKNVNEMnF1aDJpWmRHaDRF?=
 =?utf-8?B?c0dta0ZQVEZ6T3hlb0pvd3hYVWpTTzBGalNRYkRGcVNNMW91dXAvcU4zWnA2?=
 =?utf-8?B?cUxNdDhhcWNqRHFnN0pIbm1mL1gxL2lZWSthcGRtZzZoVzBOMm9zWklsaXlO?=
 =?utf-8?B?elhLclE3L0ljU21DS0dsTTRRWkQ2Vm95RGE0NW8wOHJwUTZ5UisvdjJJQ2dz?=
 =?utf-8?B?S1ZyUmZ2c09kanBIcjFSeXFWcXhCQ0NiL2ZpT3hTSno3L052WDJiUklhWEhq?=
 =?utf-8?B?eXFiZTE3T2pYODhuRmlxMm5jbkpVamlOa1Fvbk40SVpJYkI2ejhLalRURkd1?=
 =?utf-8?B?NTVkTXlZamxSZDM5eGdra3hQZTBLRDJXY1BCTVpUVWRiUmsvMU5kNjhKbUlw?=
 =?utf-8?B?NzgwZHQ4eExFSjhZUDFhL0JUWXFTbXRzUTJwMm9RWVE0OHpkckVBc25hdXZu?=
 =?utf-8?B?UlUvc1pqVVdlWVVrZ00rTlQ3QnREZVZzYW1TTlhRM1E3anMrQURVZXB6MTJs?=
 =?utf-8?B?blUwQnBpU1h1cFo0RkV1RGhvb0x4TFRiYzBDQ2ZyZ2YxVFJnZ2F3SWdjVFB2?=
 =?utf-8?B?V3ZiRmhXc0xOSm03Z21kZmJTb1MyT3RQeVhhdVB1aHEwazdhMzRqK3VxTGlE?=
 =?utf-8?B?MEcyRlpOZ1U2LzVCWFg0dTVnYkVWS2t3dkozQXpmK2J4QUNRK1pKZlpUTS9O?=
 =?utf-8?B?OUtQZ3lJNU9SMjRVUi9vMTRrQmI5UU0yMDZJUHNMUU5BZC9STUd0KzZkMXBj?=
 =?utf-8?B?QmZ5SUl5bUp3V01kYy9yZVVGa0NId3dFbWdGTTdJS0hla2ZvdXhwMFIyd3g3?=
 =?utf-8?B?N1R0b0xqNE1xbC9XNFJVejB2dllOR1hiODIrM2c4TDgrOTlDWko1VEVMOTFt?=
 =?utf-8?B?b1RnN3ZEd2F5Ty9sczkxam50NERhNnlFYWJvRis4YTd5U3o1N1EyV2lRMUZ2?=
 =?utf-8?B?STNOdFRpazdTTFZWVlZiQVFDYWduTmZsOTVIL0ZnTE5DV0FGYTkyeVRJeDJI?=
 =?utf-8?B?T29GeVRJaEY3ZHV3ejd4RE1icGxBd1psVCs0QzUxSWFjeDFUdE10ODBRYy9Y?=
 =?utf-8?B?Z1MweG1DTDh5YThOcmY0MGtodTZsalhtTlFMbTZ2ajhHVW9uVXQ3dFE3YVda?=
 =?utf-8?B?OUcxc1p3TXRFZVhPVFBpNSt1QnVPdkpVak1SWjFIZWhOcEdvUXhtRjFubnow?=
 =?utf-8?B?a3hkWllRZnlBcTl5THBkR3JzUGlPVHFZVFg4UWNJZlE2ZVl6NjFZODFQSTNj?=
 =?utf-8?B?NUZqdFpGbDFyMnQ4d0JQdzhma1lnSW5XaWxqNm5TODRsbFFqQXBkNnpueG9P?=
 =?utf-8?B?TkE3WitpK0xIamx3R0ZKYlIvbjRaek9lemQ2ZThKTm1FaFVKdURTQitldWJO?=
 =?utf-8?B?TnV0aEhnb1pLTkdWWWUySkhxMWdjRnkvaXBmcTU4SU02eGJ0UnJ0dnJ2bkly?=
 =?utf-8?B?TW92aEo4SDUwd1dXVzZTSDUzcGFaeDVCajdWRTlNam9Ud2RpaFhXY3dIeEpl?=
 =?utf-8?B?RE11WjFGSHU2dS80VG5ibVNpZmNQNlZKSGVpdElXa21XOWp3a0NTazErd1Nr?=
 =?utf-8?B?RXJ3REtUZDNBOE1pbDlScHNnUUFCK25vbUszUGdabjdiSUtuYW8yS05MNVdp?=
 =?utf-8?B?cGMrMktsS0xVNy9tVitSblQ0SjNxRHkzYzVhOGEvSmFqN29hZkJtdVhseHRy?=
 =?utf-8?Q?rK8MHZNMpox/ZAaqq2+LAG4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WWdPREx0YWRMUGV0U21SZXRFdGNXOHlxN1V3TmYwM3N6MGtiaW9XUXlNcFc5?=
 =?utf-8?B?R0c4aGpIYVpMYzlRcWxPTThuRHJhQWZzK3Y4V2ExOUxlTnpaK3YwblZhS1hj?=
 =?utf-8?B?NU04b21xNjlXdjJvenlnOXkvdGtOdmwwSWdFTTFCK3dXR2RmM2Nub1l5SnVZ?=
 =?utf-8?B?dmZ0WEJ6bzBYWm5HQURGM1htbW01SjNvZzJaejRTYXpwZzRkd0F6VVdtOTUr?=
 =?utf-8?B?dTV0RGxwOXFacTM5c0JpMHlWdGNteFNPR1dGOGJEOXFSWENnQ05HUlRQVkpY?=
 =?utf-8?B?ZkEwUnlNdFdIKzRBRzBpR0FTWnBTWVQwcVFGV093Wlp6Uys3eXRCT1E1SGpV?=
 =?utf-8?B?NVZ6R29sb2d0amtySlplVll4WVdmV2VkdE5PUXN2U2JWdG9JaVdnbkRtQXpU?=
 =?utf-8?B?dzYrRVY3KzM4M2RaNEI4b2lwMlhRL1V2T2FBWElvTm1YUU16V2ZKcjFwMlZK?=
 =?utf-8?B?WFB3WHJtU01CVzVkYWZtSGlBdnNNZ0JBR21EZzRsVE1mUlVMNGFvVk1PUkJr?=
 =?utf-8?B?M2tPUmhaa3RDK2Z6S1dkMDdlb1RXYnlTZW5yWVdYZGg4anhrNFYxbkxDMmN1?=
 =?utf-8?B?TFlzNzFiaktNaTZOM3pXcVhaS1o2Y1FBa0p6a1NDQzlaMG8zSjBieW93bFRy?=
 =?utf-8?B?RlFrWXh5T3JETWdIQnBsYXNaSzBuQlFOeFdERFF4TGEzRjUzUms0eHJ2RGJI?=
 =?utf-8?B?cjgxOUVGYjRXdlFwZkZVQ05rVWZaMWdSL25KcnpMZjlIQkxoVDNaTjVWOG1S?=
 =?utf-8?B?akFOZ3U3ZkFiTlptajNzeFRmdVpPWkFnYXhvQ0xqR3BoUERBZk56WWs1MTlz?=
 =?utf-8?B?aHZwYng4UlhodVFUSjl2QWRld253WWk4Y1EwZlF2VXBOditCNUcyL3dldmJL?=
 =?utf-8?B?K25oZnUzVU10VjNUU0pZME8rdUh2TG9EWlAvaDc1Ni9BanNsNHBBTExRZGZD?=
 =?utf-8?B?TzdKckFkZlArbjZLV1dlbHowZU4rek1qOGJSUGNxcE0wVndHQ2VHNVc4Z1ow?=
 =?utf-8?B?UnJlRzNvbWFiNEkrYVlxUmVHWVV5Rzljc2lmclVwTFBtOG9zTFAzME4ya2lu?=
 =?utf-8?B?b3ZvTmtVWHEvMFhRL3hCMEdNOFNrWW1lTFJiU1BobW1qbUpWVHh3SHRwc2g2?=
 =?utf-8?B?Sm9UcUtHUFFrMVp0K1FQenhUdW9ZTFNyTkZ6a0xkOGdNNlhheXdhb0hxblRo?=
 =?utf-8?B?SkhqdS9qWmx4ZmVsaUxJTWNVbXk1L0tVS0MvQUp5d1dtaS80Y2l2Y3lBY2JV?=
 =?utf-8?B?MmRwTDFsakVoSlFmcTZvSXJyNUxuUTdLRG9rU3hQbCswYUMwTlkzL3FyRmhX?=
 =?utf-8?B?MDk3V1cxVUZhc2RQeWpRejlxSWlOMzVEeVQ1TndhWGxBMmRkOXp4M1hhTGdZ?=
 =?utf-8?B?a3BLVkFYVW41d0ppZzJobEcycHQ4aC9Yd1d6OHBNckZvMnovZi8rQkJRWGVa?=
 =?utf-8?B?SUJ2RHVSYWUwMi9qYktQSVlYWnZ2WFNRUWE4NVNSd055Q1RLejlnckZkUVVp?=
 =?utf-8?B?eTR1d1hPcG1DdzJldTZjaHhZNENGaDhnSTREY2tNLzVqM1BxL3g2ck0yMVpV?=
 =?utf-8?B?cllyeFBZU1dtOXJHVDNnZXRSWTV4Mm9sS0FBWDN4RUdzL09tNjd4MldHZzZQ?=
 =?utf-8?B?bDhwcnMvWjJLVVM3OFdnZUt4VnZEWllqUWJnT2NkV2NBK3RaR3d1aDlwcEhw?=
 =?utf-8?B?MU45OGZGc0sxWWpFY3NHUlVWRldSYzFvVENyY242Rk5sT0dRVHRNSml5S21E?=
 =?utf-8?B?MVY3TFNjK0hBTjZWZHZnR3lncHM0ZlR6Y2hOL010SnZnNlZ1TFRmLzJJL3cy?=
 =?utf-8?B?TE83S093R1BOWGViTmNqbUhUYjJzWU1HWDhjVWFHOXVtaTgzYnNsRVVQcWNO?=
 =?utf-8?B?ZTRLcm9HSWpsMU5wSWtBbkF2WjRoN0R0VkljTnBxYlVJRFB3YndxN3k1NXhH?=
 =?utf-8?B?b0xvS1h5QnZvbkRtUzlDK242ZjI5emx0dmtpMVVRMVdaUnRLemNPbE5DVWZB?=
 =?utf-8?B?MldIYWZlVWgrTmhrbTdZeHFBQy9YdGM4Vy9yUlhwYWtyR2dabWliWmp6MThV?=
 =?utf-8?B?cEl4RkdwY3pobGVoUUVSR0YwMmkveDMrUEF3dC9KcjMvT2dCYkNBTGRzWCtS?=
 =?utf-8?B?RURVOFg5MWFwdFZVWFNjK2tJQjFzSDZFcDhLejJFQlRvSVJxMDlaWHh4dHFt?=
 =?utf-8?B?NjlrSGJiVGptSk5yMjJJcWk4VlFpTS9tdnNYZzg2OHJDbUQvSWZ3RW92QjRs?=
 =?utf-8?B?Ui9ZSFBuRVRSeUwyVWhFMlNNWWY5NXI1TFhvTFBhL3VlZ2grYW1ybEdBdEdE?=
 =?utf-8?B?ZmpwbzFwdlhldSs0ZFRab1Q5blE0THNDbWlhY1NSQm1TMXhmZm55dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA034EE8465FE54A91773AE5C9B99BFC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dfb521bc-b01e-4b74-f458-08de54ab70bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 03:00:43.8856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 uJCsnFUxnMlpSHp+sfzteU3GSTPALEne7PwrEzRARJemVKFq8IS3YV4eBLwtZ2zI49D4xsu17GkKXV7FcUcgsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8741
Message-ID-Hash: 4XZWDDGCYGKFVSUPB5XOUHMNR2SDXIES
X-Message-ID-Hash: 4XZWDDGCYGKFVSUPB5XOUHMNR2SDXIES
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4XZWDDGCYGKFVSUPB5XOUHMNR2SDXIES/>
Archived-At: 
 <https://lore.freedesktop.org/fde6f4c38cc60513027f4fff9faabca0d8fe9c7e.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gRnJpLCAyMDI2LTAxLTE2IGF0IDEwOjUzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaW11ciBUYWJpIDx0dGFiaUBudmlkaWEuY29tPg0KPiAN
Cj4gVGhpcyBwYXRjaCBpcyBjb21wbGV0ZWx5IHVuZG9uZSBieSB0aGUgbGFzdCBvbmUuIExldCdz
IGp1c3QgZHJvcCBpdC4NCg0KSSBjYW4ndCBiZWxpZXZlIEkgZGlkbid0IG5vdGljZSB0aGF0LiAg
VWdoLiAgSSB3aWxsIHBvc3QgYSB2NyB0b21vcnJvdy4NCg==
