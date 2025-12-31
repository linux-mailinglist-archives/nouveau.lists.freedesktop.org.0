Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D62CEC867
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 21:11:52 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C39E10E8AF;
	Wed, 31 Dec 2025 20:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jSFPF+KL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B83D844C5F;
	Wed, 31 Dec 2025 20:03:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767211429;
 b=MKXxy6IcAjwfz1CD8xY3KQZyYDoCm2zuEZN66gKxd0DN+CeIF7Jf2c5ZVb2gDqaoK2VY/
 VnKKJgP//NfUve5/aGSFwLQF+Zkmr5v1jwuYLgsx2hcJRyQxGp4NLR31wi/+oojsHw8YWH6
 uUXSIQh7tGqKXL0ocxsb2xsxmD4D9OOpALSnGpZJgsQOPzMnGdwbWtCmF/FttFuympcnDyu
 vcG373VsoiK6DLj14qYuZuLUovjeZejzwATN8TCuIs+1bWkTXHvSKyfPUAYIoSP+oetfG4R
 ApiF+eEwaxLKTcP5N2B9CCUt3ohsGxUkX5fM3xpHqaQ3LP5uvYStKOz1KOcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767211429; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z/9ieJZlLd/QGaUR36ry2k3xydWtKgQw6F+qsnP2XOg=;
 b=uuWin7LFvMWrI5Kk+eMEXTGgSp2w981PmzkW7WXMRn9lzEowvsYCfiAw1XLNn3xfQbNTg
 ih++NWRP2bqHO272Xi5/69pCLswIpAJ7xXdtPdvSHLxuE75WoUrz6xo46CrdLI80Ik1GX0P
 oLDz7/cDmROERXoPszhGOlKC52qoMTrOHyWY9FRy/GYHydqjk7R3TKVeuNSnuh9J5FwiSP7
 8lHDzn7zrxJuQ+Vq2ITBrfsitrkDvKTwAyH16bVc6L2BcWlceKsdle2ibcq95fpxt0FQkRF
 vq1z+CWDby9lsZywn5cXkz8B8BAyNqObQalQz02m8bnPB/j3LSKvTbRKwg/w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1B20E400F9
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 20:03:47 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3A210E20D
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 20:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qjm22GUrzZENvne2CP2uNleVvS3Io2Yaqp1dkDYRXANmSpislzQyKV9QX/DspNLn/a9S89GGtonjhGfwhZO6MEWH+xdT/VzpOQ+8HLYIVmolVvIUDScUocHNv6ObuYDdkz39pCOVZEvmjzUI/nXuWSh9wzBtsHjTCWaRNpTtlk5hfhqPb15txWW3gqgSwPgBL4b+q8ZoYDgi+UXB7TFpRisBQKqxFa/CgvSzFRmKfqdSjUjINHJM9ZxAkNm21bDY4PRynikn3oOTJW93t5iEzZZKbkpPCTM4qkiht+3vqJu3CmSsdlZ6t8L72SR7Mz/oLfEbbPA0br7VluoCxG8p9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/9ieJZlLd/QGaUR36ry2k3xydWtKgQw6F+qsnP2XOg=;
 b=KWsYJ7D1zA2dimk+HkZKADC8rB+BxukexLN2kwCKoPkHXOyDiWiOpQLNMe7aAVndgc1S6lb3AZOVeAioUinDyv0bsqkCwAYSxU/7bPD6JMTrOVIrn+q7pLdd9+r1B2JggFjnkv3CQX+O9H/5on2R5IzIaEsmjt3sEi/ans4gv+PKDbwBvBfEgJDUoRThxx4mbirpJtsOYf/F++P19MAANn3EMLK8c1QBdaP8AWOFw0bV41QlxTp2sPtg1lcHbM6N3l5i1tpznGVPi0i12zvNOXHktkMtvSiAg5SWuBYy/woSddhZp1qGDKxwjVVo7CygHwsvd8qr2bt7JbM+jSyVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/9ieJZlLd/QGaUR36ry2k3xydWtKgQw6F+qsnP2XOg=;
 b=jSFPF+KLPVBOdAejLAKAmOp656yhomhV+Q24O0Y4D5h7/TwCJxW040jSpI50BqCvk0WlOr5sA40gomHsK2SDKsacxTN47d5vPb6o/umeKeeXyxQkeJUwAKfAGtsMuUBXs4CjC6RyjrSCWKpmZkkD5dRkjmaPJBipWQzM5eumXl/c9kunKZz1rXApgR6WRd3g1K3PtSAC2EECv7XGGWQLAKkSUh05pzaQnOV19DCiT4kICUV+aWcM54Ka9lu8MH/mQ4Y1r91TqvvXvcaxvFJW+1E2gn/aaG/yUJJb160hu2AR8hFYM6Efea8ki0d8yLwZZ1zFnmkpmfjPDgUfUXUn+A==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by PH7PR12MB6978.namprd12.prod.outlook.com (2603:10b6:510:1b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 20:11:41 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 20:11:41 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Index: AQHcb86jUh4zxo0ySUOi4HmApuhn2LU8QjkAgAABgwA=
Date: Wed, 31 Dec 2025 20:11:41 +0000
Message-ID: <bdb21987d97329393fc082e63257b03eff372b31.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <adc47679-baf2-48e5-b726-7ebb27634e1d@nvidia.com>
In-Reply-To: <adc47679-baf2-48e5-b726-7ebb27634e1d@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|PH7PR12MB6978:EE_
x-ms-office365-filtering-correlation-id: 5f9997fe-0ac9-459d-a188-08de48a8d014
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ajRpbnJWVFoxdjdTL29sN21pN1BHWkVJMnk4NVNYZm5uUFN2NVNmSEdLc2x1?=
 =?utf-8?B?UXFXZ1VQdGRDNHlaRXAwRG9mbEZ6cjJZMXpobXE4MEtrYWJoQVA2SXRWUGU0?=
 =?utf-8?B?MWEwa3RTUDdKMTlxUThtcHpTVEpEa082M1E5K3NCMmFybHF5TGpiWDhmL0ZY?=
 =?utf-8?B?elp1bkVIWkVXckZtYlRRWEZiRVQ2VGRDL3BCQS83R3k5b1NnL1RlQmZISG1Y?=
 =?utf-8?B?OUpNcmZ2SzdBcVh5SlZWTUNERWFacVNya0g5bEZBNGQrNHB6VTIzK3FDNW9r?=
 =?utf-8?B?U2tPZlEwYnhId1VlODdNdTFMZEZHL1crYlNyd1FXczRoakRXNmNnL1k4WDN2?=
 =?utf-8?B?eUVtekdiWG8vZzcvTWVRRFdaS253VzdBejJpcVNEalB5T1B6WlRJYi9hTFYr?=
 =?utf-8?B?ZlYyNDJmT2dOdXBGS2VEa29VK2NINXBIYVB2d0hZYkdlNm5TMC9UWXM0cmgr?=
 =?utf-8?B?UFoyZ2RUSCthOW9lcDNPQ0hRWjI5ek0remNoOHNMcklyeVNIRk55eGpYN1dp?=
 =?utf-8?B?c1BranNMZ3dRUGp2OERob2twRDVCdlc1anhmSmd3bmlISGg5ekF5WlhHek4r?=
 =?utf-8?B?MWVHbmJqNnBiaXJDNUJsWEszT21tMWdWMEdQbkpxdFlHZis3QVpwMmRzd0ht?=
 =?utf-8?B?VEdZeTU4TTNlMG5WOFZ6bmJLVEdEQ3ZlcGhGSHJZa2FNbXk4Z3VPb2RUQm9t?=
 =?utf-8?B?aUROQkhNMkxxMmczMXM3T1VnSVJGQnpVT3BlckVhb2lNY3EwMHFwZjlJNjg3?=
 =?utf-8?B?MDhrRnB6ekJUeW1HRFg0MjVUaDhIQUd1YWN3TFo5bzV0VDZvbktMTFpDQVhP?=
 =?utf-8?B?T2pxdmNjenMvdVFBMmt6K21wYis5cFk4ZEV0NTM4aE9tcU4vVHFITExIbTBt?=
 =?utf-8?B?eEVPanY0SXRGblk0SUpDckFzdnZMVXJjMlNIOGV0WVp0VERwa2RYYlYzQjNL?=
 =?utf-8?B?eXp5NjVXaHA1eEZVZlpYdGFYYSs5dEs0cnVGMXZmaHVPVy9Oc1FTdSt2SU1p?=
 =?utf-8?B?Z0lUb1BCUndNY3JoVDBaNld2WWl5d1JmbkNmdVZrLzZWQzE4bXljWG5BaG1N?=
 =?utf-8?B?c0Iyei9UT1l4MTN3SUd3bnlqdU0rMWdKRmM0OUUyYytNVXF4TzBZMU5sYllo?=
 =?utf-8?B?WDFtVTF1S2Y1eFVCMHExWjJkMkZVcEdlZGNwVmlhY1BIck9WN3BXaG5OL0R3?=
 =?utf-8?B?dHU3czhIR2lpaDEzdUExNDRBZnBNN000cjJHWDZ3cUdsdDFySFlKK2Y4b24y?=
 =?utf-8?B?TGpkbGEvYlBmN0tHZEEvelhVckRDdlRuMlQyRVdYM2JsMHVRNUpIdVJpQmJi?=
 =?utf-8?B?ZG81aWNEdTdtL1hhNUYxaDdmbHpxYTNRaUdMcm5Dbm1QenpoZ1dwM0luSHA2?=
 =?utf-8?B?c2hjbUpZREpGMkxDOUYyMWFnSWNaSlV0Ty95UmM5L1BFWkxpOHArak5aY2Nx?=
 =?utf-8?B?dVZGRnZEakxqNUoweTIzMWExRVEyR1lVWTg5c3VCRng4M2h6TFovUkdRT1RX?=
 =?utf-8?B?cEt3Y0JqRnRzQTVPaGJVbmZiZWtadE9xRXZJdHpoMkUvd21PcmNraVdocVVH?=
 =?utf-8?B?dVo3VktJMTNHbFphV3J6Ukthay9XZk13a3M5aG9Xb0x5aXM5OXpmTGxuaUdm?=
 =?utf-8?B?UlhQM29Td1htVjJpdnhsOXdwV3NZcVh1RDhKcmxUU0tZbXkrR3pQMFlkbCtV?=
 =?utf-8?B?UHRjVmkrVUh6c1M1MEF1V250OFdWaDM5RjlDdTBycnJCNUZKSG82ZndBeFVJ?=
 =?utf-8?B?OUFXTStRNWhjSlJLYkg3bWF2UjNjUTJxL1dDamlFSnRWbjJrN2J3TnBpYzE1?=
 =?utf-8?B?RThGdmh1dlF1TGZaVm5iaU42SjdyRmRLNXY1Z293b2g1Q2FMeEJhRSttRklF?=
 =?utf-8?B?MEdXamwrd3dZNG42dUtFU2g0dUlSR0x4cVBGUW1mY3dOODdPM3R4YkFaaU9n?=
 =?utf-8?B?QWF4WmpYb3lsRHFJZW1mcFpyN0s2S0k3WWI2N1AyTXZ5M1h5NmJYOERIaG5X?=
 =?utf-8?B?WFJ2dkgxdFJmUkdJT0JmWUMyS2V4eVM4L2tTMk1SOHowMkhrYm5xdjg0aWxH?=
 =?utf-8?Q?E/OLoX?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cjFJRHZVcXJlZHVTRUJJWEVKYWtFUHNHYkRDN3pCS0ExNEdOYnN2bkdEbzlr?=
 =?utf-8?B?QTMvbWdZdDIwY3U0Y1RkcjZXR2Fpc1d6allPdnhLRW9WeDVQbEx4c0llTzZq?=
 =?utf-8?B?TlFJTEk5bHQ3RlZwKzJ5THNXV1RObkNycThKQU13NVlWd0huRlpFZWxkT2h1?=
 =?utf-8?B?ZE53WkxidUw4dXRjaGpydTB6dWlmNmJGSlV1YTUwcXRMZEtXdUVVbDNJVUlV?=
 =?utf-8?B?bFhyWDNnWW1uUTUxWjRJQnlDeEIyRU5qMTRjQnM3cnlXYVlQL3lYMEUrZkxi?=
 =?utf-8?B?SzNrN2hvMWV5Z1NRVVJGcG9NbVFYWGk5Rm9ETnFFMGlkMndzUTJ1UUhKNkdw?=
 =?utf-8?B?Q3ByZDBqTVpMZm1ydnJ5b2xRZm4xK3ZneVd0UnZON1g1ZitOVjNlWHhlZDBE?=
 =?utf-8?B?ZDBRdkpvSWk2MWhEM0FYNGhITUFIdzB2dU0waTlGdTdRT1JEN2Z4RGZIK2tJ?=
 =?utf-8?B?dnZyS2JtbEttOXlqSlpZcEY1V3lIdlVZd0pFaDhQVUN5Qm0vRDUvbHYvTktP?=
 =?utf-8?B?UGhTbXBrYlM3ZkJlUTBVRkx5SHgzNXVwVklFenhTcTdiWGQ4VUhsTStwdDRZ?=
 =?utf-8?B?WVVsQ0Q0UmpwS1REc3AxM09xZHNDWm9wODluUU9pbTlaTEdFTnhlQlBua3JV?=
 =?utf-8?B?cUY0Rk1wTUc4UWN2WUNvUktiYnQxRDFYMFRnZ3NzNnF0VjlnenN5VHJuVHRs?=
 =?utf-8?B?MU9FK2VodE11Z01NeWFESldvbGpka2sycWxDNHo4K09ma1JMY25uajVnZGVu?=
 =?utf-8?B?NmdnWThOcnUxTUhzbmZYdVR6UFhUL04zM3UzS0VDSjhQMmJMd3RvWXZIbzZI?=
 =?utf-8?B?VWRVY0hXVG9TdzIwbUtmZnZWdC9lRGhETlNaNWFlWHVDaHF3S3NJdisxM3NO?=
 =?utf-8?B?M0tCVlhGcVNIRGI5WmczMUxJeTAraEFDb2l6WmxYVEdRSjdpMmkvYmNUWkM4?=
 =?utf-8?B?ejh6MVRQL0JmSlExRlpTUGxGZ01OOC9WWjB1V3NUUVdWOHpkdWE3eXB3eSs1?=
 =?utf-8?B?ZGRMaitHdVJVTWFVdFE0cVgvWXpHSkNzYzhaWkQyZCt3Nlo5TWp0UERvY0d2?=
 =?utf-8?B?dlp2dVoyRUNTczRNMUN6SW5nOWd5U1ZzM0VkRlhxUkpNcUlaa0loM2xHQVd4?=
 =?utf-8?B?OTB4V2hZUHpTT3hkL1RZeU1xNkFtV0N3QUFCM2ttQzN2cnlQbjZGRXdpdGlB?=
 =?utf-8?B?eVZzQmdSbDVsTUlsV0NKUlhDZnN1bGhuOW9tKzlFaDNwWlhCMndiQUpWdEFu?=
 =?utf-8?B?NlBFR3o4citIUFR1TlBmQkp3T3RYYTNtVDZVTjVIb2VvTE55bnZxZkdPR3Zu?=
 =?utf-8?B?L09CZFdlRmN6VDBBc1JhalFHd0FIcE5Kcnc2VEdzYU1icXB1NnZGK1ZFak9G?=
 =?utf-8?B?OFFUWE4rNHNQYXhBa1V5ZUh0TG9VZ3dXWjFBNTYwZ28vSG91VlZVeUlrMHNz?=
 =?utf-8?B?djlUYUJmSkUvdlgyNlNJTXVBZ2ZjTi9CWkc4TDQ5Ynk4TW5mVVFyN001ZWpU?=
 =?utf-8?B?UUNKbUxmL2sxQXdZdnNPM1dRK2hGMThRVWlKYmx0RHhRekNwOUp6S3A1aVRE?=
 =?utf-8?B?TGtMcnYzL2Y1NGFXV1hieDZ6Y051QXkvU0NBRnFReDdiZFFTRExFdEZWUzVE?=
 =?utf-8?B?aWV4dUFFV3doZ25iL3hnK0xSOTFjdlozdGh1UVlJbzhSd0tRRnRQbUFmeDhs?=
 =?utf-8?B?TitJYi94YTNiTmtPMENkUUJlTW9OUjFHTDVDZUNYZU00MDlhTkpDN0p6bzRL?=
 =?utf-8?B?T21aMUZBSkJJYUdmeDNZNW5yUGhuNktUcnh3cEQ1NlVVcnM1bmhjQmM0ZUxE?=
 =?utf-8?B?ampuR3RaanlYVVdIZm9KYTBIWUxiMDNxTndVb0VFOFVCSklsNDRZRUcvSU9U?=
 =?utf-8?B?OFdUZTl0T3E0bXJNSENNSzMrUGc1WlN5SXQwZ2FXS0xDL2I5SWNRTG8yUlBE?=
 =?utf-8?B?V29jajhvN0pVbFY1UmNwdHV3clN0YXRvK0VPMXBidDkweVl0bmYyQTN3Qktt?=
 =?utf-8?B?eFpDNmFiaCtidlQyQmNFM3U2a2hJTk5mYSs5YkdoNzNIZUx4cEpJQmZzOUZZ?=
 =?utf-8?B?bEtxK3RuQXI3ZVh5Ykp1N2xNSjU4SjdGZ0hubWRtZUVObmM4NlNhRk91aURx?=
 =?utf-8?B?OEpRZjJDZWx4elhvNktzNVNQcHpRR0NPUTJ0ZkhSOUg5SjMwdmJ2b0NuNVpG?=
 =?utf-8?B?QXduWjdCbzJZaXgzN1hjOGNDZGMxRk91aTZ2TDg3S0tsQm5QMHdPakhYVzFB?=
 =?utf-8?B?dnhSNXNZR2phbE1aM0hKTzhLSzZMWER1b2N5UVlENWFORXNWOUtJdzB3RVZR?=
 =?utf-8?B?YXNjTkg5Q0MvcHVUbGxQZ1c2UW96SElwL0pEcHdQZ3YwNnAxR3o5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE431A198FDEFE448BAC60CCC5221C57@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f9997fe-0ac9-459d-a188-08de48a8d014
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 20:11:41.5294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 pL44DfWG0BxgaKYCHl+ia24mKvsb9PQAneudestrwiW/pxuexnLo7uWlG/nG2flh9kv8Z+3usquOMl5yp9vhqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6978
Message-ID-Hash: 5DNE6BV5HGKPUF7TSIRIVZ6STNBFWYLK
X-Message-ID-Hash: 5DNE6BV5HGKPUF7TSIRIVZ6STNBFWYLK
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5DNE6BV5HGKPUF7TSIRIVZ6STNBFWYLK/>
Archived-At: 
 <https://lore.freedesktop.org/bdb21987d97329393fc082e63257b03eff372b31.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gV2VkLCAyMDI1LTEyLTMxIGF0IDEyOjA2IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gVGhlcmUgaXMgYWxzbyBwYXJ0aWFsIHN1cHBvcnQgZm9yIEdBMTAwLCBidXQgaXQncyBjdXJy
ZW50bHkgbm90DQo+ID4gZnVsbHkgaW1wbGVtZW50ZWQuwqAgR0ExMDAgaXMgY29uc2lkZXJlZCBl
eHBlcmltZW50YWwgaW4gTm91dmVhdSwNCj4gPiBhbmQgc28gaXQgaGFzbid0IGJlZW4gdGVzdGVk
IHdpdGggTm92YUNvcmUgZWl0aGVyLg0KPiANCj4gSGkgVGltdXIsDQo+IA0KPiBBcmUgeW91IGFs
c28gd29ya2luZyBvbiByZWJhc2luZyB0aGlzIG9udG8gZHJtLXJ1c3QtbmV4dD8gVGhlcmUgYXJl
DQo+IHNvbWUgY2hhbmdlcyBhbmQgY29uZmxpY3RzIHRvIHdvcmsgdGhyb3VnaCwgYnV0IEknbSBo
b3BpbmcgdGhhdCB3ZQ0KPiBhcmUgdmVyeSBjbG9zZSB0byBnZXR0aW5nIHRoaXMgcmVhZHkgZm9y
IG1lcmdpbmcsIHNvIHRoYXQncyB0aGUNCj4gbmV4dCBzdGVwLg0KDQpFdmVyeSB0aW1lIEkgcG9z
dCBhIG5ldyB2ZXJzaW9uLCBpdCBpcyByZWJhc2VkIG9udG8gZHJtLXJ1c3QtbmV4dC4gIFVuZm9y
dHVuYXRlbHksIEFsZXggaGFzIGFza2VkDQpmb3Igc29tZSBzaWduaWZpY2FudCBjaGFuZ2VzLCBz
byBpdCdsbCBiZSBhIHdoaWxlIGJlZm9yZSBJIGNhbiBwb3N0IHY1Lg0K
