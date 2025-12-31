Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C7CEC849
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 21:02:36 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 844CF10E804;
	Wed, 31 Dec 2025 20:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fRsKJJNh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 06C8D44C67;
	Wed, 31 Dec 2025 19:54:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767210874;
 b=Y7eNz360zujfBPFL6hnhFVPHP/EnYrR8zl0eXiZgz2tVMm91Ajr31Tu3PHf7Ozbu0xmc9
 kMJRNqN7szD1jq5akbF99l2fs1NEFJHqb9TVBb6og5F/MCb/uPC3WLnFVP1GXlK/YkcHMCW
 mP+tkO4/OQwUtjrJQRCo5OzDN+OoSxRLE6SKPQq/zh1LaUtsBgpgyF1cyRMK2E6kXJ23l/u
 keM489JIOXgIqJdJ6UvW652AYApUHf1S4LhztPb4f9IKXVy/R5eTqDZrZAdZ1C5GOqm0vFq
 +aFKCAF1RwP6F1raUQ/f5ZnfWXmtgH9on1y6IFpfkIsqPDluL2PSzR2H5xvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767210874; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EvT6ZmT3DZKyUCgI12FiCJ2j+CylnYaDb4mcyfx0ji8=;
 b=o9TcBYU9ZM1VPIsUyB2ukTMDsp+QanqBk25ZFd4gnfIdbR1awBBpKhEZLVyIxgYIk5ffV
 M8f4ZQYKU/U6Bl16zGGO/9FmeavmgdjGWu0lFyUOxSUsb4avyTHyjMKYBrYpFK0TE2goAHF
 kDeqUWcLjMhdCTJTIzPNJSv0E/Y4DV+cBFe2fvL7p38oOoOKj6v5sYE8EK3omLtDc/zj8Tg
 xMZ6mNtyLL/erAZdFoE15PDsAeuShmUD5SGk7g7mRfuvkI44lNgrPOeJcgNWjMjQvgq61Gw
 jQKYCIl1ECCToLjoWuILEjIHIKnphLg2rrW+OuYwjHV4HQjgdGjPjEo2n/DA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B010B400F9
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:54:32 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013069.outbound.protection.outlook.com
 [40.107.201.69])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA50410E08B
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 20:02:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5MvYwBMpCLZtr7ngbfKy54eqUmgCDIctJqeyk0mMD8hhe3kZf8Ae2lWCP631GWe5kmwh1uhrNFPDkue7jUY7uvQBPN2gnXdlHCg7W3dpfBODXJ/veUv5wSL/LC9YPw2UdZk1o5unomei8ZGAp+7fe4iw0cQpOL1X++wMDO9WljwS2EFQDGPjuFMoUBxqbcHXHLrvn45QaQgsXK2OQUE6ZFbY3h+WZAw5kNq750Y3UrAeJjEJJ/cPeVaUwoDoFLEK0yJstqfi/R7sCQ2z9ZiTI9TTwupsbKNhYgkUcPm1FpFKb6Wbm+eJ4bouDuqUAjAqpAlze/GMvay3C6zxi0M0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvT6ZmT3DZKyUCgI12FiCJ2j+CylnYaDb4mcyfx0ji8=;
 b=Zr+WeMzil1VOMq0lrjuLSfVNqIuaC9i0XVuST5HVvfH2eMbfFwtQWsFN9GMHznw87Sg6ckK2QP8RAF6E4EbLDshL/GJll70aDNdX0rcax561996E3PK1FjOdPmemANhyFD9mNW9+sppVsB/1dIDQsbq33ICEh4R7mIFz0t1D9WbO6v+Kv+/kTIVR7ggNdIeX5LhMV/FIacL3Bf8RoLGVvQxuwg/jpUbQtpHjPH5VpyH7ExVM0pIE1T6hXl9eiR3SuX6BgZnxnKnPoSqED3zDZbOGYuwEQNx7rQisA4S87wS7YnmPgQWhVxBvmZAgghop2diUFgoZOsyGxNH2l7Aq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvT6ZmT3DZKyUCgI12FiCJ2j+CylnYaDb4mcyfx0ji8=;
 b=fRsKJJNhPyv3gi6iE7TkBVXGV5zpKSKmPSr2wmQ4Ub2vAkNlkZuTiuZ+CO+OjoFCdIOvi1GAOx1t/RKbCgP9lWULZIzX8WcoSHWKXlxMDnqQnYBv/jA8kJJpUD6SaqZfkT1fI0OqN+cJ6QniUa51FqszLFno/8zsDmcKSuA2/2UzRKfAGtDSsfKoSYHrGwx8zJIQezPNEXfCl9R9UZ8QttuVy4lbtSyri0VpFkC8XtfTgu38WMg+dj4dk6PIBtRbxBIygVj13w/Vz6H1XclQlQ+n9CzZJ4wuVkq6qnqSlnSeVzjqnxw9oJ8MDD/pg5vBLs5fIurW5vUnuZv4OoZdWQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 20:02:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 20:02:29 +0000
Message-ID: <7737ff62-163b-45eb-857f-c9eb00ea2914@nvidia.com>
Date: Wed, 31 Dec 2025 12:02:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: ba1b40ed0e34bab597fd90d4c4e9f7397f878c8f for 6.18.y
To: Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
References: 
 <CANiq72=ti75ex_M_ALcLiSMbfv6D=KA9+VejQhMm4hYERC=_dA@mail.gmail.com>
 <DFC0SMRNXSCF.VFRFCASVMX5F@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFC0SMRNXSCF.VFRFCASVMX5F@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a7e768-1a6f-4303-454e-08de48a786ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TTBrbGh0VUtabjNKN0RLWVRSOTNUczRrVlhRVmVhblhNVm4rVTgzSllXYmRX?=
 =?utf-8?B?UFVabmxSUXc0TTN5cHpiUlQ3N1FTZ0RRaWdwT0dUTUNBbVREdHkyTGcxSDRE?=
 =?utf-8?B?TlRkSnd0Ni90aWZPbXJPNmNKejBhdWJXRGVLYVlVcncxNTBONnp0YlJHZjFt?=
 =?utf-8?B?Slh1cC95SEtoZXlMT3M2aVIrd1JibFJ5UVJjUG1BekxBTStRU3JPbkRIZTZL?=
 =?utf-8?B?NmpQNHNYbnl4WVNwQUV4OFNEd1hKUHMrTHA2eUZLVm1HZHd1WW0xMkxkVWhv?=
 =?utf-8?B?OFBnbFNHMGYyNGZXOXFyYk1IUHVPM2NJZUVxQzBKalF0Zy9iVWtjTmtkWWtP?=
 =?utf-8?B?eWtwOVhURWdkTWJIdlRmTjJxZ1dZbDZybE1QQXlXNzBtK2d6cHhRRmg3bUFi?=
 =?utf-8?B?U3dnTGI2Qzh1c3pwbERrT3BHTG9iL2xPcC9ENnpOU1gyWk1CblpJSHRIcGgr?=
 =?utf-8?B?dlRjTVVMVTdBQzBqL2FNTHg3c3RLam8xaUlqRUpOSWw0ekNyTDZxVFlvN3Zv?=
 =?utf-8?B?UjNRNUFKcnpmN1dxMkk2Rlo5NURESGE4eFFreU9vTEY2U21uYUVLZXQ2WTVo?=
 =?utf-8?B?WXdybHRma0FHa1A2UHhCak8zUENqSlpWckYvYm8zcUo5UVJ3S2N6OGZub3R0?=
 =?utf-8?B?VWF3cU9NbENQbFgxTnkyTG1QeHlGMlJkeG44czQ1eFVjcEs4djMyMXQvWDRx?=
 =?utf-8?B?aVhkeUJLTUNSZWJYa3YreUNKbXc1TlAvNVA0YnU4S0U1RmlsTEdJRHVpL0Ni?=
 =?utf-8?B?QlEybDIyK1dYeGRpQWVESmcvRU5TMDgwdS82VVJlQVowWmFpb2h3cGFQbnIv?=
 =?utf-8?B?NkxHRWU2RVdwNXpZMURja1dxZG12SWQxaWp2eVh6ZU9qem11M0hMeFM0SHRu?=
 =?utf-8?B?dTh1a2FZcHNRbHBTemlpV050WFM4eWE4ZC9HQUs2am1VMDdmUDRkVVBDeXJQ?=
 =?utf-8?B?RWtBVnZHbXdsTkRrMCs3U01ESld0a2dja0crbVZBWU5rRnlrVng1U3BBc3V5?=
 =?utf-8?B?bVl1ME8rSWJqZE5xcmhLa0Q4UHo2MEM1OUxvSXh3Y3BVdHJicU5kM1FZYm1N?=
 =?utf-8?B?N1FBKzB3cHhkR2pycW45WWx1NDlyL0JBVXIxM0lrZm5MK0lFSm1Gc0ZNb0tv?=
 =?utf-8?B?SGw4Yy9vWldGWFFtRVdrM0Y2Q0NlenIvdDRsSnV6YW9qM3p2MUUzNGdYQ2Vv?=
 =?utf-8?B?dG5Mbk5KcFFZMWFCZEZib0ZKd3JMdGFuNG1UMTRKeThRL2dWTGFmL0RXOXF2?=
 =?utf-8?B?OS9YclJVU0dSTkk4K093OC9CR3JFSGV5bmFnZHY1N295S1BwRmFaNUFlbjhl?=
 =?utf-8?B?U1YrRDc5Q3dXVGdaNEpXY1ZGTitJOVI0QUVXcG9iNG5qMnFRMjArcDRFanhP?=
 =?utf-8?B?SnFoOG1TVVZTRlRUT3RRT21VbEU4a1N1WTZBRGU5R1VWVUtZMmxZd2szSlBI?=
 =?utf-8?B?REMwcVYyZHNOQjk0T1hFRjVBQUtKSlpzNm1OcUJVVExVR3lWbkJBRTNPRk9F?=
 =?utf-8?B?ZmdYUG5pakJVL0pJeDIwRFdaVHpZWjBKYWprcGRYU000UjVxbExFTTZTQU5R?=
 =?utf-8?B?VWplVG5STUo1OEUwU1UwSVpOZ29pYmN5b04xVkc3ZlU0L3JmZUtHOWRXbXBi?=
 =?utf-8?B?VlU3UTA2MytJQVRmKzRwVGJEQUl1Z2ZpaWV4YXAxcFEvaTJycXptUmlveUh5?=
 =?utf-8?B?bFN0aWRhMVczcWhNZDFXM3BxNFRsL3dzZDlqVXQ5UWV5aW42LzNqSm52Smx4?=
 =?utf-8?B?cE5xOE5rVzV2YTA5c090eWZ0VFA0K2puUmdIQmtpQWZvWUZlc3NCaHBiTUlu?=
 =?utf-8?B?T1JIZWZvZk5jcDc2OXVNQmJ2T0VMWkFSRzNBd0hTVnRTcjAvZjFRNXFVcU1z?=
 =?utf-8?B?Q2FKeldia3VRdXgwRVdiQ29HdHFaalAzVDlabGQxZVk5WlJTNWNpb2dEUUVH?=
 =?utf-8?Q?KNW4PtMmtVZHt20eCx33QZukZvHj43QR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MU1RRHR4ZHpYaFdrMlpVbmNEL3A2UzFCZlZHeGxLUFE1M0g1ak90SWVLUTFj?=
 =?utf-8?B?ZHZWVkp6eFNEbUVXT2hqbDRwUlh5Q292NWlPQktKeXpBSzhNR2ppRUJ3WWpK?=
 =?utf-8?B?OFFWdDRmMjlpOTVKV1BxMTZYUUl4Z3FFS0ZGT1N3Z1VJOTh4MGhvL2xuVFZn?=
 =?utf-8?B?YWJ2ajhsNm41blh0anhpWlN2aGZhaDQwamhzbzYvMHBwK1hINTZzaEgyTDZs?=
 =?utf-8?B?MVFRZmFhN00wK0grTzFBRW5saU9OQmZNa3JHaGJxZ2dpMklIZm9ubklQa0Zy?=
 =?utf-8?B?UWNadlhUM2ptbStRWFRuN3F2bkM2ZG9ZdXBXbUxPcEd1bFNjcHZ5bVo1alVO?=
 =?utf-8?B?M01pT1B2MERMTmtGd0ExK3VvR0hrRjBBYXJTS0NoYzBFcitiZkt4UEZ2K0dB?=
 =?utf-8?B?ek5PMTZDNXB5OGhSWUZqWWh5Z000VVVkemNIcmlSWDZ0eW5naTdGTTMxNnps?=
 =?utf-8?B?SFY3clhSN3h5aStZYW81dysyaVhwU01OYmhyQ1k5djlENUpYTlVYOFFkd1lw?=
 =?utf-8?B?TGhQZ1gvS3ZySzk3dFdsQUE2clFtbDNSSEpwUEVraDNzZ3gycDRtSGFRUU5s?=
 =?utf-8?B?bUJTUGpsa08zZ2RoZkJMQnBwcml6VnFPRy9DdHJDcTFFZU9YaE1wZHNWSjZH?=
 =?utf-8?B?SExkUFZqbDdiUkRzdVlGeFlsRlErbWNPOE1ncStkK0swOEdPUDJzck5pa3VU?=
 =?utf-8?B?T29aQnJDMGhVUTBOZ2dnNXNDRklWdEQxejZVVlZzQklJci9FRGRrTGpGY09P?=
 =?utf-8?B?R3U3aU4zbjhiQ0R2TS9vVHl2YWtMajc3K3RSSmxtV0VqRU1vTGlXa0FzRGlL?=
 =?utf-8?B?NFMySzhsOHZFWlJjUUdZeFhiNGVuQzRCZTNNT1FzQk1wZkdveUFqWG9WSHpZ?=
 =?utf-8?B?Z3dGUDFQNUh2dU9nbkJKK1NvU1FNT1kzWVBOTW1JQVUycVdUWU1sWFpYYWJP?=
 =?utf-8?B?cjcrSUVGNnVUa3pvbnJsaFlabWV0dWtCeWtJb1AxazBDWGh4YWk1SDlyNjd3?=
 =?utf-8?B?UFhIeHBJdXNIQmVDODJ1SnhvK0ptWjFPRGViRlNSQ2VpeHE3akdQc0xROUY2?=
 =?utf-8?B?OTdpTzkyZ0ZYM3BENzY5dnJqYjdaSUZiSzc5aGpXZXlPY1RwYVJreHZxRVVi?=
 =?utf-8?B?S0c3emJZQUJzdG5ESkFBRDVTNmFacjJqMVc4TEVoSFJHVTBHUmhrbENucUFh?=
 =?utf-8?B?VGNPS3ZWWFdFeStiSDZQRXlDWDFSS0FUTVFaRkVsN3VldkUyYm5Hdk5Odm9h?=
 =?utf-8?B?MjRNTDBDZHhOaWM1ZitKbUJyenBKL1F6SUdTak1ja2F6bmt4WFhwQkN2QjB0?=
 =?utf-8?B?RCsxS2cxVjNJNkROVmJvTzNwbng2K01SbWc3UG1KZ2pjVlUwbTFNZXlocWkx?=
 =?utf-8?B?VnZNRGFHQmtLblhjcFAwVnE1dlg2emRCRng4VHRPNEUyaGxFVWE1L0ZLUnhs?=
 =?utf-8?B?V0lhd05lVUQ5eHlQMm54UGZaeFlFR2w0UjI1QkFncWY0anpiOVRoV2w5UHFK?=
 =?utf-8?B?aHB0azA0U2pkTmYxSmg4NEpIdkpYbURZTUFGMHFDcTlpMy80UXNEZkNXbHVV?=
 =?utf-8?B?YXREQmY3a213cGVDNzhpb20wK3M1VHo0cHE3OTdzMlc3aHdkNlF0c2tzRnIx?=
 =?utf-8?B?ME5sai9LQnBYcmt6SHdYUm5ZQ0hYNmpDQi9XbHBlM2R5S0hWdDNqNjJQdVc5?=
 =?utf-8?B?SzRPWHNqWGcxRmREamFld2ZNNmFQSnM4RCtBQmdTOEhrZzU5bytQcjdDZFB3?=
 =?utf-8?B?L2J5cUxic3gxVFhlOUV3ZHdCczVoMFJVMGMzNldCZmZGalVZT2RzNzBkU1dG?=
 =?utf-8?B?Nk5oMFdsUTh6bXdnWnh4SEJhTld0UHdlMkR5Yk84QXI1S1FXRkRPeGNDRllu?=
 =?utf-8?B?MGYxQ05acnBhaFZMNXdIb2o0dEhRcUJESk5Kd3M2NmF4TnN0aFkxTmpSWm51?=
 =?utf-8?B?c042RHV0cTVqSGpvbjZzSDhZdThBRXJiNUthL1MzVHFaL0NZZHJNeFM4RTZD?=
 =?utf-8?B?dDdVZENOQkNjQlB3eU9sNkZXeDRiWkt4d0tEb3dZVzMyMUlLRUpsQUtvQ3l6?=
 =?utf-8?B?U2tCcUNNcDF5Q2JiY2ZaTndsa3EzMXJVUUMzVjJ6Nmh1MkRqSFZsTFhyd0Qy?=
 =?utf-8?B?OC9Yckd2a3E0QUMxbWFYQkphVTdJL2hvc1hNY0tQcDRoTyswSjJEaVl1Zm1L?=
 =?utf-8?B?Q2I1SEtheHJ3bENLM0NkdlBZRHovcTN3TE9tVWpnS3VkRnhySHlLUDBJQzBS?=
 =?utf-8?B?L3BYSE5JQkxkeitEaHhiVmJZTUxVeVRkSXNHaWNoZm9neHk0eFY2bWpDYWRH?=
 =?utf-8?B?WnNweHZralVETTVNSjZvRzRUUk1teE55ZUk1WW1RbTc1aTRSdnJZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 04a7e768-1a6f-4303-454e-08de48a786ae
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 20:02:29.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qTOF4ZJlLGpm8xnUhtT34DhKZA3/sjZ5rTX4YFhONh5I71dV6KhD8QvzRz/9xVe2X0x44t4BxhM++u7bX2KUHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
Message-ID-Hash: ACLLSB5O3FFM3RBC27VBO5DW23K7CWAS
X-Message-ID-Hash: ACLLSB5O3FFM3RBC27VBO5DW23K7CWAS
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, stable@vger.kernel.org,
 Nouveau Dev <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ACLLSB5O3FFM3RBC27VBO5DW23K7CWAS/>
Archived-At: 
 <https://lore.freedesktop.org/7737ff62-163b-45eb-857f-c9eb00ea2914@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/30/25 5:44 PM, Danilo Krummrich wrote:
> On Wed Dec 31, 2025 at 1:57 AM CET, Miguel Ojeda wrote:
>> Cc'ing Danilo and Alexandre so that they can confirm they agree.
> 
> Good catch! Greg, Sasha: Please consider this commit for stable.

Alex is away, but I also agree with this.

thanks,
-- 
John Hubbard

