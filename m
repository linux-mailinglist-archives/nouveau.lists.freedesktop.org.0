Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3ECFB758
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 01:24:59 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DE54610E560;
	Wed,  7 Jan 2026 00:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JsDoKhj+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8855444C9B;
	Wed,  7 Jan 2026 00:16:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767745002;
 b=HUWy2P3EKp6a3Ec4bmhMULQNBQkzsTd4ufvW6WNRrfuKOCpbxYNJi8MwOdutRsA3bXHVX
 saj0HVR8TcIdv4DaSAHN4RtyLNhLN5WuAVoRJxjGmjhxEr+WwPidVDrAOX/gla0XZKUHD/3
 84cHcc6VAZlsx3bICP/zuw7njh/th8N/Cn5N3s1MLuOSLsRkuigm7Wypor3oqvIuoU1T3Ms
 WJPrzPQJcHjToU7pwHBe+N2qM0CEqJMTpLzi71XUyRY0/zrthc+mqx5vfm+/ieXUIStYC/d
 jaXG3S7kMcQ87MiGPjGIiDDm5SwYxnvAxadOvKW7Liby46WG5KjrehDbYRjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767745002; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hF0IlKcCWeppRZKqZAZ8dS69sYlZmyLVioDAafrAC0Q=;
 b=OqMmaI6Gry6opbaEjXjh5yuR8WvAk7GBcgmWVcaENTpUzxtXovo08GHdxLAgMNrorzBdM
 qESqX6PKNvcYheGeY2sCph4pTfnumN3lXnTIy0bmOlV0i3QmurYYGlQwULkyfjeqt1iRhPR
 z5JMzgnoPr/IhCH7OW1+DhvuyYPynyg30pANpdcGpKmrBxUYxF5s+io3zTXAQxkeAI99DU0
 jiJ9ZHiVP9dd2CYgfBxhvosHHBwArW0ek6WcyhtvQ96ET74swaRRap7hrCBqLSAoWtfIXot
 J9ld8ymPGgAsFmUw0uDDSQvd3x5UYqiUDl40+ij2SlgnHyokOwlSWuPZX+8A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 961B044C5A
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 00:16:39 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71BC110E55D
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 00:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/pmCrPTUbsX4gZE4e8L0yfy2Ajv/Vm050FixQ0gxSzKZ+5Bw1k0R8ofFbkgxV5QGGeVRlW1ME4OvRnyjprf3zyxdOIqfxCz34mb49IZjuA6iS0cZ+XG6Sw9oTWBXfiibt7y/e+CLO3xS34Bg7ehwlt9JD+HYysEqprz5RIzDGzgFEpDcVKryLapOakQKiVpbsaeWSoa4N9L4xJoze03FVkW+FB3b5g+WdssTOW4XPLSDDCY28rkPFd4KrUbLTxzbQhOQJc5zLttC1hqi19uk67750jsn4MleN6jSPW4VqYopLuFh7wwQEvuFk65X2m/KqHmK0HM8QcegY27YYn2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF0IlKcCWeppRZKqZAZ8dS69sYlZmyLVioDAafrAC0Q=;
 b=tS4DFKO43U5LlJJZEmyaXVelEPb89ZzNBAh8vN6uj0l05Fp7UMDG4CN6FgA6sAgUxNdUtEuvsiIHNOgflAdPVTZve7uLyLFfpMxkMeDJQUva7wMZEzfpGMBUGz3CNMJUktmu2zQqlnMwYe25hMneSkEntRfFI3vmn1h0Kew4jmI+f+QlpZIAFEB+JzKLlVRwQOn6BZTLUsZK0PkjbQuAHqandYyu/T5mkPhfl/P0DL0lGjT0CXGS2nC+ZCpPbp0/uhF+ElaKJrvgBMsQjC0CjwhX5oOTCwn/jet4TN8oQV21ZuIAg9/JrOPEjOaT/eC7h+vHsbAtQO+En1SfW+ASFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF0IlKcCWeppRZKqZAZ8dS69sYlZmyLVioDAafrAC0Q=;
 b=JsDoKhj+A0YxswhNQEMhQHMshcQkyio48LHzHurFLGuZmnkIU/Hvps0gauGlr140XO85LsfOZ3IEc30f3igRCVJ2J4D6RiMDfSyA3wASAjhP2aJT7jXWnPW9l6ujr+WqjPzfCZ+YlEVIJoW18oTQfHRf1s5flmpRgtuWJ4paDbUj25Ee6B0stLdLrt5K0P7scHs4J052fn1luOlDCAYDut3AxFDQNASZOHKTq//wTOGlIWfWDXEjEHvnLdW+bxJPSqflNGls2tV7dw/GdDezcTGCOTUSjHutgY+dzv0MVoMtWBrBWqH0tzzy5Inbg8p+nDeLkh26ri2Ft+5xxQEv9Q==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 00:24:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 00:24:47 +0000
Message-ID: <70a8a73e-2dad-4bad-83bb-a245b83afe5d@nvidia.com>
Date: Tue, 6 Jan 2026 16:24:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: Danilo Krummrich <dakr@kernel.org>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
 <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
 <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
 <9a8f8500-aa1e-4145-b84d-7ce424ead644@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <9a8f8500-aa1e-4145-b84d-7ce424ead644@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: b183950e-8469-4e75-ac19-08de4d8329c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T3VML0FmTG1rV2NHQVVoQUc0OVB3b0JwSWNSUFhrUjBodmU2N0EvdEdFdVl3?=
 =?utf-8?B?VmFPM1UwWk9ndWt4WDRrNC9zcjUxd1Y2Y01PLzc0NTgwemJPVjkwTVdwaENl?=
 =?utf-8?B?NFlsam4yVEFnRDhRTnFoYTYrNDFMMWljR2hlajFWTUQvc2hoM2J3YUlqOGxF?=
 =?utf-8?B?cktyV2lidnVYNitaQW50dmpCZUJ3dElQeWcwNlRXM0FXdjhnM3RZNWt5VmxO?=
 =?utf-8?B?VnFnQXI2OG94cnc1NnRlbmVzNXRUTTBxU0FrcUJKMVBZQ3JvcFgxTkRxYk1v?=
 =?utf-8?B?NnBXM2FDYUFsL1F6Y3J1SjY5Y2c4U1N4ejNzS0hnZkVXOGNhNXd1UGM3aFdx?=
 =?utf-8?B?Q084YXNpYnlQMjgyaURBRjU5dzBkcVdiRjczSDVjR3V2aEZIZTJtQjFBcUYw?=
 =?utf-8?B?SGtTT3lTSG0yVFRSWUpUamlRblBRS3hySjB6VGJrR3h6NlBsUVlraWx4TTB3?=
 =?utf-8?B?Z0Y5bjd3WS93aitMMGg0N0h0UzUwSlZKYWVDRlhqcmNvcENpQlFVS0FLN0ZW?=
 =?utf-8?B?bUNvcUZZU3o4UjZ3NnhsbjhqdlBGVGc5TXJxMVQwY3VpZnc1WDJ6QVR5cnVM?=
 =?utf-8?B?OFNFTVRyUWQzTnc5c0Q0bHFUcFNYc01yZzFXNzJEREQyd09ZSVNVNGtWbThn?=
 =?utf-8?B?cUVkT3RZbzNVakRDM1dhVzd6QmY2UGpaTUp5eEpNV1lnSTVUcmJJWUJINFc2?=
 =?utf-8?B?TWxYRmEwbkNLRERoTFdjYnJLdHpNU2VVVm4rZ0JkekRPK1p0UGlNN0ZpRGt6?=
 =?utf-8?B?WEt6dnlyWTVIQXNESnZZRkc1amYzK05kWG44dHd2bnIyeG55Z0xMRVJUcTha?=
 =?utf-8?B?ckd5Y2NZbWhDRHlraFE5MUlrZ2pFYTFLZUJlTGFLZnkzSVZtbWRzc1FxWjVP?=
 =?utf-8?B?Wk1RclRmaytGcE82bjlON291aTA0WFNLbFpzOFJNajRwclFkb2dJT2dvd1hN?=
 =?utf-8?B?WC90QksvT2dPejVOZGptYXJJWWZ6bHpHQVNlVDRqMEZhUmFINTRTR1dZdU50?=
 =?utf-8?B?Sitwa0xDNy9ZZHpxVVZQOUZYZnBaMVV3VXBKalVzeWJySmpnVHNIWHhMMW5v?=
 =?utf-8?B?V0pkdTNSa1BlTGFNWTMxQm84OFg0eVZPMWZvNXo0ZVcwdjZuS1RyLzdrZnVF?=
 =?utf-8?B?NGVvZ2hURHhiSENQZG4yU29Mc0w1dHQwYzNDTjNvNUFXZUtoR0lIelV5Ky8y?=
 =?utf-8?B?Y2ZTUkdYK09qUzZhZ2hndTZ0YWpKcFFaZHBUeU5rNmhWZE0wUENRZGdmeXhr?=
 =?utf-8?B?S0VtaFB6b3V4SGZsUUVrK2lUMjRIYlljbERMOHg0VWZDVjB5MWNTbFFFa2hY?=
 =?utf-8?B?Q2ptbmprQUw1cTM3SDZ0WEdpdEZSa09nTnNnejlHMFNCUThVWVhOVDcrVDdW?=
 =?utf-8?B?NmFmZG1wQjdxNnhGaUVEWUJVd0FrRnZoRjlnbWZPSy8xS3RZYitQVm1rMGFO?=
 =?utf-8?B?YTZ3VUNERUp1M2dMSzlpRi9DamhCV1lybE9lY0RBU2gzM0xzKzQyOG0zKytI?=
 =?utf-8?B?eUxKOU9WNzJXNmRVQzViLzcreTQ1R2U4SllGYkM4eVBENHF2QktKeGFBUWlG?=
 =?utf-8?B?aHhnYytPanJCU084d2t5UFpvNHBtYU1ZbDVwLzhWL0tkZ2pDd2VZcXRQdjAr?=
 =?utf-8?B?RFkrVlBEWThmR1huV1kvbkpDQUl2UlEvbGRJTzFRcmxvRmljZnNmczlPd290?=
 =?utf-8?B?MkFXNzBhNEFiV0Q0WnZiL3ZQeDBuRng4bGw3YkRYT29YSTlmbHlINXB3WHB4?=
 =?utf-8?B?VU14V2ZFdXhBejRQcVJ4YXZSS0pTZHR0MHcvRzhwckd3UlJrNjZ1TlZveDdv?=
 =?utf-8?B?Qk5xYkV3dVpoWjY4VHljVDNwTFNKaW1NTjltK0FIcERIUU1DWDdhUjRiVG1I?=
 =?utf-8?B?N1krZnpiMUM5d1R6ak5lNW83dFozN1Q5VVhDeUJUWGJ4aEhJblIzREQwUVBK?=
 =?utf-8?Q?RC7r8CtZxr5WPToVY/YXBuDDR0S08lHV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZElXT1dLY242bHF2bG56QWoxV3NhL0xiNmNiY20wd0VLRXRyVlpYcGVaWjh2?=
 =?utf-8?B?MndIVzVydTVuSWpZOHFUQzVVQlExT2V6NmkzTUU1Y25CMFl3N2krQWxWL0lY?=
 =?utf-8?B?UkhRYTNabUZrcmpoR2lPZTFBY21pSUVTOFdqSjk4T2JpSFZGN0xSR0JVM3BW?=
 =?utf-8?B?dm8vYXJ1QnhRajl2d1lyK05NcmZIY0xaWXN3dzZmenZjbGxwYWQ0M3VneVhO?=
 =?utf-8?B?L3RUL1U5U2hqTVFaUXliRWlqajUxQ0xPY3dwR3lWajFnS1Bqd05pdmFFUlVE?=
 =?utf-8?B?bVlhaEt4ZWtqN0V4SDd2bHNuT3lHTjhYVFBKVkQ4ODVublE1MXB4Y2pJUFlB?=
 =?utf-8?B?dlVHUU1VZFpEWTRVWm5LOG9Sc2N2bGdZMiswWjBZbCs4WkRCMk04V05UNWI0?=
 =?utf-8?B?dy85YmtTYmlibStMbDkvZVExNHlSUWo2dHA1TEZpcGRPSUFQaFJjSXJVMUQ2?=
 =?utf-8?B?UWtGdVZ0Q3ROcGZiY2h1aXpyZFhUMDFtV25pVnhVa0daTU56SEExSkk0bmw5?=
 =?utf-8?B?OFZHZEtEVnBsNVh5MkRNQkh0ZG9kS08rWXlFU2dMUERFTXV3b1A0bG13Ukl6?=
 =?utf-8?B?bWFyVU1aQkVROU9SUzhzeUJyYWp1YUQ0Wm1iRnBDN05PbWJYOTFQRjYrci9K?=
 =?utf-8?B?NHQzYnRpNHhZbXhKdXAyYWgxTmNldFFxSzAvMDhTUjhPeW1URHBSV2pZeHdK?=
 =?utf-8?B?Y2ZvWm9nTXFEV2tON20wdTV0NlErWFJPTHRRZlN2VUJJRmtrZ3lqNUpUVmpP?=
 =?utf-8?B?b2pnQXA3RVk2Ykg0Q0EwL3FkZVpzdmJmTUFVV1BlRGJoanpyZkhoMTRWOFYz?=
 =?utf-8?B?VThZR0Z6b3BVNlErZnZNbWhLYXFBTzltenNlL3gyOXpwM0pIVzlVdnhKS2tB?=
 =?utf-8?B?RnpxQkJMcFgwQnAwZDV1MTVuQ1YzV2VjakZnbm0xazhXTE5ubmoyN0JidFRQ?=
 =?utf-8?B?QzVnUWFzYlFqenRHVlRUM1dxeEdWVkM3VDRXcXo3TDM3Um5Qcmk5eERRVWkz?=
 =?utf-8?B?azRNM0pWUTZHQ0Z0dGJrU0ZYakY0b0w2OHZEQm05L2RRdkFKTVhIMFlWUnpa?=
 =?utf-8?B?amlOVkl2b2JPZVYwdkFoS01zTzllMlFWb3lwN2FQR3gxTkdtQ2tEMnNjSXIv?=
 =?utf-8?B?R0VXZFB5aTBPNTJQNFQwZ092Ri8zV3F3SWxLQkVucWNrdzBqZTVQdzNicDN0?=
 =?utf-8?B?bHlqbVRPNitNYkpjalVyQ0xXL04yY0g1ZXFYdjFiZTFsMVNNNUpNVG5WeWFv?=
 =?utf-8?B?R0M1WVVZMk0vMGt5R2ZKWnZMSVJxTFNrS0xFNkFZNXdqWWtWZldMQWJxdHpY?=
 =?utf-8?B?TVF3WVJhdTg1eEFLQzNWZ1lxWmE2c0JjQVhrNGRsMVRRSndOaWI3NDYzdjRP?=
 =?utf-8?B?Y3ErcHRBOUFmcVFjLzFWRld5TnNjTUZqNUFkOENvdTRPVktYamZSRHVHZGhI?=
 =?utf-8?B?TENLS0t3TlBSZ2pIditlSVQvT0VLMzFia2NSSVY3bFBTU1dmamN0QytSVmR2?=
 =?utf-8?B?VzJRTmw4Tjh2N3lVZFNyWldjN2RnVmI2M2x6Z244Q1FyaEt2YWtZTUtrU0ln?=
 =?utf-8?B?NkpyM1RXT2dPQzduQU1NTjJBUFVlaDlJVzh0NnZOTW9rSk1MWGFtbXhoZzB3?=
 =?utf-8?B?ZWprK2FZN2thbXluclYvRW5zdTBuMmIvVFhSRFo3c3Y3emlkci9WMHNOV21Z?=
 =?utf-8?B?NDRtUFYwNnRHb0dvQmk2OFc1Wmtid0UraVc3Z2xrb25uZzZtTUlKSTZDVGY3?=
 =?utf-8?B?WHJvYVF6UEVjT3dpelYrbWxqa3JEQ2NFdUlldnI2RTgyd0pzOTZVajhmVjRD?=
 =?utf-8?B?MnJIU1MrMktsRG12V05vaUF2alhoV1g5dms1a1VmejhJNEtRbkJ3eWgyOHFK?=
 =?utf-8?B?ZjFWczhUSGVWaWRGaFpOSWZ6SmFneldXWkpIR0hobVhUbWFxQWNFbGttOTJu?=
 =?utf-8?B?MDM4dDJMNzJ6M0VxRFRVcnQwYXhjVnlWUTBWSEhQeDV3MG9aM0hrL0N1eHZF?=
 =?utf-8?B?eVJDVHZBZmcwc2I0RWNJcVowMnZWbkxiL2Rnd1ltNnBiTE5ycjhOd2ZIMFAy?=
 =?utf-8?B?eTNUZTBFR1RnUVVLSmUrZWFmYmJzQlAyampOdWswMitJRGRyU3dPb2RYLzdQ?=
 =?utf-8?B?U0ZxLytwZlI5TDFmdDhxSDZqSDRoODN5NVc2UmRjQllYak1KUHJwbFZ4cXZE?=
 =?utf-8?B?NTFnU2trb3FRWXZFQU96M2FXb0ZocE9hL0xxeCt2MlpYOGJKR2FtVzYzcXhI?=
 =?utf-8?B?VjhibzBVUXJONEdwVnJYbnhOMW04Tnk3MEtjNUcvdnRKNHZRMWMwUVprekRr?=
 =?utf-8?B?OHJDRDMzMFRhektyMDNTN2tmVnh5VGZQVU41RytmaWpuYm0zc0Fudz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b183950e-8469-4e75-ac19-08de4d8329c2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 00:24:47.2106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F0HsgqBwbUygdbxqmKtj9jO4YJ5HpzwpK0uOW1DXDexX1Y/SxEyPXLqoZbVhQd3wKfOUs3ozCQfyFd6kIvgWgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108
Message-ID-Hash: FRFW754WDIL332IVER3YGZPP7A3LYP7I
X-Message-ID-Hash: FRFW754WDIL332IVER3YGZPP7A3LYP7I
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FRFW754WDIL332IVER3YGZPP7A3LYP7I/>
Archived-At: 
 <https://lore.freedesktop.org/70a8a73e-2dad-4bad-83bb-a245b83afe5d@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/6/26 2:44 PM, Danilo Krummrich wrote:
> On 1/6/26 11:09 PM, John Hubbard wrote:
...
>> +        let gpu_name = info
>> +            .gpu_name()
>> +            .inspect_err(|e| dev_warn!(pdev.as_ref(), "GPU name: {}\n", e))
>> +            .unwrap_or("<unavailable>");
>> +        dev_info!(pdev.as_ref(), "GPU name: {}\n", gpu_name);
> 
> I'd probably only print one or the other. Also, I think this should be

Done.

> dev_dbg!() instead of dev_info!().

We have been *very* sparing with the dev_info(), and at this point,
there are precisely two places where Nova logs at info level: at first
probe, and after finding the true GPU marketing name (buried in the
firmware).

I think we've found a nice balance now. The output looks like this:

$  dmesg -t --level=info|grep NovaCore
NovaCore 0000:e1:00.0: NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
NovaCore 0000:e1:00.0: GPU name: NVIDIA RTX A4000
[drm] Initialized nova 0.0.0 for NovaCore.nova-drm.0 on minor 0

So I'd love to leave the GPU name at info level, if you agree that
this is about right.

> 
>> +/// Error type for [`GetGspStaticInfoReply::gpu_name`].
>> +#[derive(Debug)]
>> +pub(crate) enum GpuNameError {
>> +    /// The GPU name string does not contain a null terminator.
>> +    NoNullTerminator(FromBytesUntilNulError),
>> +
>> +    /// The GPU name string contains invalid UTF-8.
>> +    InvalidUtf8(Utf8Error),
>> +}
>> +
>> +impl kernel::fmt::Display for GpuNameError {
>> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>> +        match self {
>> +            Self::NoNullTerminator(_) => write!(f, "no null terminator"),
>> +            Self::InvalidUtf8(e) => write!(f, "invalid UTF-8 at byte {}", e.valid_up_to()),
>> +        }
>> +    }
>> +}
> 
> Do we need this Display impl, or is the derive(Debug) you have already good
> enough for the warning print?
> 

Good point. Prettier printing is not worth it for such a rare corner case.
The Debug printer still provides the key information that one would need.


thanks,
-- 
John Hubbard

