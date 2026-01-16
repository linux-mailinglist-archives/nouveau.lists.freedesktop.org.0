Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D3D3869F
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 21:08:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D9C2710E1D4;
	Fri, 16 Jan 2026 20:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OR5g4wRY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B3FF244C96;
	Fri, 16 Jan 2026 19:59:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768593597;
 b=M9cZe77Q4GWj+mIDqsuVCf4893WAvTBDXtCMc/1KR7InTneTr06s9iiyLUA/s7B/2WUZm
 Co8iiVMazj+XuZe6Dc4PHJ/eDJlFwYxLy8pFazutWWG/wwuj6RjKyGOSS0tcPp2385Q8pBO
 n1tkDv9KK8HRH3dXBfX34vDPrzHY5agffUO8dilVl5AfxlMTfrYn2c31wlRqUWixUdTQDXU
 +ra/70Mra2WcEB9AyyXuuu6ghl4He+qRhFX0pQ0CHjjnZ89BosKZlfHFniP5szkzEaSs0Vu
 nZHWhztCxiHbXUCvw3LZXT3R5WYh17oFRAaLOj2VXaOUwNRkjPwHNa1s7vvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768593597; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=faU6UzflUm+De1Bua32/ZnONkVP1OVlZiGpsIiT7PYE=;
 b=XjsEjgUA65Q1asel5toqy3+usGDIvry6x+e6+A0glHpPFa98Xb2hgzKWXsvKJncL8SMfa
 HTg7PqfywO7UPFc3zcsu/jmVE8BL6WqcQqJbEY6Lq66DLadYHLtmPyn14kdylbdXUoOB+2H
 CuVISw8f4yMAlTi8LKFzl/itO2MNPRDJaPOXNAc3sPxVFZ22jKJR8P9t6ICpiEbFTd5j5gM
 V8zK/5THKv+hlaTh92ecPlXrO4M8DfEvVZ/GJZnefkW15pJRx2pzPIJ8qX0jxdnA6ys4RYG
 UQ3KM6VMKYEl/CK5O6XP90HWo6QhBjjBm4yE9hUQ4YJ5uUE0lIQi04yj1/xw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0171D40744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 19:59:54 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BBB1910E03A
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrK3jo38LBZPuOd+MDHBCZ8sEV/1NmdtfeaHJUAbZxNSGd8ruyTBuuQZiXNq/GIOo7e6RrZEXAwZnRxhm/ycVuwYpTCVxC752wvJMisG5HBzb732qjl5uJEd4bESOo1dkFN6VgMcBwqvtrYTL+92nm9EduCgHvqxfHrqBVxhfT+bS94SlP3iIqT5EeMAAzJYAVn48j2uFXsiHGAkGX8MW2GmQEK5r94EbJBP6AwsZf/XI++QUmxig2hoxnXNDSgF+uX23df6CfbNU9mXzM4dh1lbbpBpyUUylSFGo7USk7d/mDPXk6IZqTRgprMNDNk0k9xWS+7LpMDSC8f2PvHsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faU6UzflUm+De1Bua32/ZnONkVP1OVlZiGpsIiT7PYE=;
 b=Hid0VOpAksS47vqGAxBITArxBphkNPtl/aVwvP2w7p6BSRqBKJr5XQK5eAa0IC+7b/CUCLviz5yP3wsTE1w17aMmxw5JiopRRvgjU17MNFHQXJJ+c2dyizKX3napdiHCKXvZ8gHZP0GF40ONt8+qOoOhKUj9LMz+v9NFgzy87IsNdfGCsFA1IQAW3emuA/aQCkHIQZPFd4BDsU+ndgPMTUk3aYXdLBkomS18aziilS2wnokHbXBAzAIW02oHmeWmw+Hm89wsqOec98uDjwEUua82ohMWyYtmhxm+a+KntJ4V81w9BzJYsvQVNLzoE5T5PW9ALq4RkcXc78/npYIRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faU6UzflUm+De1Bua32/ZnONkVP1OVlZiGpsIiT7PYE=;
 b=OR5g4wRYM9yZ3wDvPW5qRk705yYX0YJV+hcHcvyV6dZAAThz2kiVlK2EGQQ8kptgysJpTo0jayNBRtL8ATpJwiHEz3JHAVr5iIFm0HZf6JSNhNWE8//DXOF/1TcMqZ5CG0uJ1wnBHQ+9nAD4n7aHB1j/o59mNYkZVfn2mwSyifWZT/U2YBO9KFuAb8MMoDSC3U3gvlzlH+QHR6jOS1V0VKM2+QA7w4ErFhJ6LOn80R++bMzxmYm1iqaADj/qV09YNFoRi2JmtCkr76G5QvlfoYkXTiAdNlsiJ1D6QrMp+dAG/UuI5jRFeezwkb99XzhkNi0i0O7/b4LYT9CQ23wfAA==
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by SA1PR12MB9247.namprd12.prod.outlook.com (2603:10b6:806:3af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 20:08:25 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 20:08:25 +0000
Message-ID: <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
Date: Fri, 16 Jan 2026 12:08:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the HAL
To: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
 <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|SA1PR12MB9247:EE_
X-MS-Office365-Filtering-Correlation-Id: 7132ff42-5172-4efd-e266-08de553b0150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T0tQYjNGVnhnTXVuTFJmSGN4NW1qOU9IWVBGWm1RY3R4SFM3RUY5TG9iZkg4?=
 =?utf-8?B?WGMzdXYxQ3N0cC82ZXMvWUZVMlMrR0xyWVRPdXhmenpXQ0VrTVZvQ1pPV2FB?=
 =?utf-8?B?enFER2txd05LWDZpUEczbXZzbVNoNzBrTWNaWVdhbEF1TU9mTEJWcFRndTFN?=
 =?utf-8?B?SldDTDhzYnFHb01XQlEzeDl2a29aZG1iRytMbUQ2RWxNcnc3RFF0c2crYis0?=
 =?utf-8?B?Z2F4MVNkMHhiT2FVbUVrNEZuMFBQYUEwbm1CenZWb25kS0V1Y3ZGVFRzeUF1?=
 =?utf-8?B?OTJ6UktXUDg3cXR3eUNZVDZnVWIxR3kxd3hNUUc2UUtEUnQ5V0JwTHovWXdL?=
 =?utf-8?B?eHlFdkp5VXU3dFBTYWRCRlpzYlUwa2xKRndUWEFsUVc2b3V2azVENTN4L0t2?=
 =?utf-8?B?eGUzK2pOb2txb1diVEM3d29zeHFCL0FwVlF1VDdmRjJpMERXcWxoTENsYnpX?=
 =?utf-8?B?RXhXOTlMQ2NMVVhYSzdrOEJ1ZG1vdkcwRFdpRmljMWlwbGkzSFVJeFhyblZF?=
 =?utf-8?B?anRXRDZVQkpla211SzY0U2FPMEVyZlFLZUtRS000ckVqUFVrOEw1QkdQRTg2?=
 =?utf-8?B?M2d4UjhCZlEzZXM4QlJCTVBGdWFLK3NhOW1UL2hzVXFISUpuNHlnckxaVXpP?=
 =?utf-8?B?Y2FWM3l1WVIybWV6RE5DVGVnR0pBTUZqNi9vYWNnNGtHdXJsREp1VTh2R3Nx?=
 =?utf-8?B?dlZQcjZaSjJQUU1IdkdoQXBZWU91M0NlWEh1YUNLMHV5TnIwTnAxTXBoZ2ZO?=
 =?utf-8?B?Y3FSSXVFK3JGazhkZHpnWTJzckZ5b1QxTzNqOVhYK0w1bEYyc0FHM1lpaER3?=
 =?utf-8?B?OVdvSWxEejBwVWo0cjRXY3B0NHNoTkJLT2FrZHpPWUFPZlFsU0QrZHlGeWkz?=
 =?utf-8?B?cE96ODVWTjB5RjJ4Q2lSOGV2SnJNM1I3T0RUcFNobEtYOGZhWThHWis2eGNP?=
 =?utf-8?B?WDF3bUFUNXBvamJNVVhsaW1tYjJETlpHcW9aNVl3VzlVU0c4VGsxcXUxUk56?=
 =?utf-8?B?em1QVGNFZmxhUzdVcU5XR0hEeHBWL0ZTU0NJekxyV3BYSG5DN1kwRE9sYlpu?=
 =?utf-8?B?VHdxUU5QRkF6dFV3djFPVjFtWWsxNTVpZUs1MGloYnRUbHdqV3JVanU3VU9N?=
 =?utf-8?B?UmpBaWVWbWVrZHRLeWJESHF2aUtsMEc3b2trMVk0dkt2ajdpZjI4NGZNc3dO?=
 =?utf-8?B?M092anVUWUlzMlQzejJkMjVjTU00dmlDd3Q2T0tLMDUxQnN3bVhwd2ZvUnY0?=
 =?utf-8?B?VGdqWjhtVit6SlNjZXJIMnRRSDBJdFcrVjZvbElKRkQ1ZnpST0JvRnJCbVBs?=
 =?utf-8?B?K2RWcko4dDNodSszMVpCNXlUSGs0OWR0M1hoYjBmV0N5UWhiZkVxaHNwcEpj?=
 =?utf-8?B?N2ZKR21NWEFoY2MzcFJaS0FHTUtjUGVjQWFzd3QxZ2tpQ0tabDQ2bkVudUpm?=
 =?utf-8?B?TGFWRWwvcStZMno5RUdQUTc3MFRqMEFaUTl0K2tFODNuY2pIZzViMmw5dnZM?=
 =?utf-8?B?akFQaWhORWF0NlRvcHpuZHoyWnZvalZ3L3R0Z1ppL2orVUlGa2xTRjhKRDNt?=
 =?utf-8?B?NTdyd2xEVXhwTnZVcGZwd3Nzd1lOY2dKbkZITWlsdjRrK1dlQVRQWlhlVTla?=
 =?utf-8?B?c3JVaHc4dm42NWNrQTMwNGFyRmo0Um45SDU0N2ZYSE4zeXJQVHRXclVLbnFn?=
 =?utf-8?B?dkcrak5PR0owNlV5dVUrWWJQcnJ2NzdLKzEvT3ZjZnF4T2lsWHR4SGMxaDFE?=
 =?utf-8?B?OWtHSkFmY1l5Y0VPenRWWTkxamFhOUpmbEVYYm9hM3AzRFJJaCs2TCtiTU9u?=
 =?utf-8?B?dnVaT0JjZEMyclpIZGlTTFhlQ0wvTmRSWHBZZ1Rpc09vTC95SWZqeitHS2c0?=
 =?utf-8?B?MnlVSGhVekpFelFOTlBuSHZvVk9DekRRczU1TjFKamQ4aStmUHpTNnpaSG5l?=
 =?utf-8?B?bUQzQlBPdkdHMWVHVm1jV2pxL3JseDFhclRxQ3ZLVXZJRFA5RFlIVGJNY2pr?=
 =?utf-8?B?eTJhRXNtQkdJVnJQMm43Nk5pZDBaVGI0VkxESmtaY09WdzBORlIwWmJHaEd0?=
 =?utf-8?B?V2tISlAyeDA2MklrY1AwQmxmWStwYjVXKzVNU3REV2JRR3NyNm1Pa0pXZTVM?=
 =?utf-8?Q?j/Dw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzhiUXRldHNxSG9xODNhdjh3bTFnQUhKRXNXVzl5bUY1NjIyWEg3YTduSGhR?=
 =?utf-8?B?NlFyYW83cmRVMmVaV3BtRGVSN0p3TUF6WEViR1dKU2wzZXdzUyt6YXZtN3VT?=
 =?utf-8?B?REt5OHo4OTVpRE9NSjRVVTM2RnpmbkRIWCtEL1NvTzZhMVhCVC82aTFxeUJL?=
 =?utf-8?B?SWF5VlhuMWV5MTdHSGY0KzMxeFluNm0xUWRCOHlVNHpNaE84b1JUVC9XcWdX?=
 =?utf-8?B?MGpMa0o3MEQrQjlNTG9xcHRTa2lQRVE1cTJwWlU0TTVYblN6RnFTd3U1dVdB?=
 =?utf-8?B?NHlUSzJrdGcwazZkd1JUb2xrUzhLcXJsbmZKeTJmRFZxZlAyZ3VkZG5rVzJ1?=
 =?utf-8?B?Ni8xa3p3a09McUFpUGo0NE5zRGp0QVlhenJmbUkxN3R6OWZsaFcrUmRBQjdv?=
 =?utf-8?B?T1RPSHpJOThva1ZyT1kwd2pwbGNoaTY2MGk1dXRUL3VQSUM3MUlITFF2WFlH?=
 =?utf-8?B?QTRrS2hOTUlERGcxTm9qK3BBTUlxZUNaeDN0S2FmbWI2NlhnRHBVQWpsUVVB?=
 =?utf-8?B?Tk5GeUdFSGkzV2NtOExLS0pXamoxZWhDZE1OeVlNOGdKdDd0cERveUJTSFhZ?=
 =?utf-8?B?dmpMdmNYeWllNFA0MVNpQ0s5emUvd29UaGUzSVBMOGZLN2VUN1VPMHNGMDF6?=
 =?utf-8?B?SWc2bG9Sd2cvdEF3OW90WktmRW0ydGtNUFRKaTQ2cXFwZDhwTnFYa0trRUhJ?=
 =?utf-8?B?L3IvTTAxTVRnZXlKc3RnSE4vY1JoWlM3Ly9mZXVaZEZWQWxPOUVGZGJsc1pE?=
 =?utf-8?B?SGN1NGxxMHJiUXZVYXBxUG13UlU0ZDRSKzg1U3pDUk0zdkhzQ1ZINGdwUEFz?=
 =?utf-8?B?QzdGU0szNmkreEZBUFAxeEZuQVZxTXk1aXpBbjB5VDFwNkRQNTlaQ0x4VTdu?=
 =?utf-8?B?VXpqTUhRcHZTU2U1YlVEVDl2M2NsaEgvY3g0VXhqeks5NWpTSlZvS3hFOUV4?=
 =?utf-8?B?QlJqNzBheG1lMDhoL2lONWpmSG5RcXN1VDhKR3c2eE1FMTVQZ0p3U3hjckl2?=
 =?utf-8?B?MnlZTXhQTHNFVGQydkY1M2ttOE5nZFV3ZElFQWlmakthcnQrSEo2Y1ZOWW11?=
 =?utf-8?B?WjdvdzNIeWpac1BqUHN5MVBkNUEyU1l2dk5EZitIZkRMU2dKSXVvS2xuQW5x?=
 =?utf-8?B?ei9VYkp6Y2VITzRSYWpLdnVtNTlvNC93NUg1TGZHVlREdU5wT25hcTk5VWwx?=
 =?utf-8?B?K0liNEl3V1YvaGtvY0dLRkZhTkl2dTVQbzdlU2lFMlBWRnJ2WnhPd2tkWDg5?=
 =?utf-8?B?Wjh2QnJManNka1hlZWNLN20xR2d6dGN6VFBKMWJxeGRBd3VxL1VGNEpTNlhw?=
 =?utf-8?B?VkZ4aVFHbG8xWHVrbDFiYzdQU3NQNkNyOHJjNW56ZW42ZFo3UjMvcDJhRU52?=
 =?utf-8?B?OG9XcXkxVkdrcDF4TEdLSzgwalk2QzFhbjYxckc5a3lIS1NwbTFpd09DM3BC?=
 =?utf-8?B?T3BZWUZYRDkvY2d2bGdSN2hjb2hST1k1bnFWZUV4eGE4VnFPU2RFK2UvMGNz?=
 =?utf-8?B?Z01ySWpYRGtybEVQMTFBajYzWTArV0R6MjNPVmlpSjJzazhxdVZmbTRGeTV2?=
 =?utf-8?B?dzJ5MGdFTG8wbXk0MWFPTWVHMjF2bzJoM0tJUGNHcnFUUk9mR3Q5SnBUTE5n?=
 =?utf-8?B?WExJcU9SbjQ0SGpmbTNDRG9kbko0UC9GSVpIZmZiTmRzRnk3Vndpa1dWbDd0?=
 =?utf-8?B?YW0xeUdqN3U4OFJUbjY5M09kdE1rcDZ6ODgvOFAxbExvOVdqSEZDa3UxenJZ?=
 =?utf-8?B?Q1ozVVBmZU12YjJCaDQvNFBiY21YeWhlTXpKRVhpT2FoREx0OHdISW4vZXhH?=
 =?utf-8?B?aEV6NVErSFM2WER4YUthcnQ4VUIxTFR4SWIrZTlhRkJEeWFsaHl0MEo3d0Qz?=
 =?utf-8?B?M21SdHQ4dG1DUG56eU9HL0N0RVM0aE01dldrajRDaVlDd0R4UzJkMy9ocmRo?=
 =?utf-8?B?TVVJYXgycWxjY1dXT2RFZWJIRzEvZ3RKN1JmbHNrL0gyaEtwRkJXRG9uTEF4?=
 =?utf-8?B?djMwdDNUVEZsUDYyVnBxalIwaTdQeGlVb001S3FHL2ZVTTh5cW40MDNIS2Nn?=
 =?utf-8?B?dHVXTEVpSWk1L3NiWjB0TDRnODRac1gvUmxmczV6dmNNa3o3a2tRMjdBZU90?=
 =?utf-8?B?ZllyRmlTVnhUdzRGbGd6WmNWanNVS25oeDFoNWVYeUhhOENFZlZjQ0s1NkI3?=
 =?utf-8?B?WTZwQ1hTWG5md3pZeVQ1bEpBZENQRWwwd0NQS2dydDVzUmFyWXdLcG1iQlkx?=
 =?utf-8?B?YnJyTS96MzhURXl2QTR0cFl5ZmtJQWE3dGdMN1VERzFpRUw4ZGdieXNDblRI?=
 =?utf-8?B?ZE53V0dSblpzNGpEYzdRc2JNeTZvNVN0VElyR2wzYVhrQ2hVS2N3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7132ff42-5172-4efd-e266-08de553b0150
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:08:24.9117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BUuRuZfekl4AXIPBFsE7tme1L5zl+a5O/xKtq5hhkx1JlHRKKPDcVyzek6u2l4ruO/G+2HtCcgP6SqlApNmQEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9247
Message-ID-Hash: LDVEQXWPR273ONOQRICUKX3ZEAOZUHCT
X-Message-ID-Hash: LDVEQXWPR273ONOQRICUKX3ZEAOZUHCT
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LDVEQXWPR273ONOQRICUKX3ZEAOZUHCT/>
Archived-At: 
 <https://lore.freedesktop.org/b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/16/26 11:55 AM, Danilo Krummrich wrote:
> On Wed Jan 14, 2026 at 8:29 PM CET, Timur Tabi wrote:
>> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
>> +
>> +        // TIMEOUT: falcon engine should not take more than 10us to reset.
>> +        fsleep(Delta::from_micros(10));
>> +
>> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
> 
> This code is just moved, but repeated in the subsequent patch adding the Turing
> HAL.
> 
> If we always expect the falcon engine to reset within 10us regardless of the GPU
> architecture, we could add a regs::NV_PFALCON_FALCON_ENGINE::reset() function

On newer GPU architectures, we don't even *do* a falcon reset, fwiw. For
example, on Blackwell, the GPU's FSP reboots the GSP by itself. And we
don't do an FSP reset. So we are all out of the falcon reset business
there. :)

thanks,
-- 
John Hubbard

> doing the above.
> 
> If it the exact timeout differs, we could just pass it as argument to
> regs::NV_PFALCON_FALCON_ENGINE::reset().


