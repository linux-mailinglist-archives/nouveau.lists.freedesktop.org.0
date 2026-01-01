Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06EFCECC58
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 03:43:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD7710E6EC;
	Thu,  1 Jan 2026 02:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rPdynlb0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E8BF644C85;
	Thu,  1 Jan 2026 02:35:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767234907;
 b=Hl0qzTd9Z1a+JQXJ/TUbsa6bgp+lUyJPP3hvm31e84fMmxxDOce+pxtrp38Q+IbhqEsOe
 qZN9G9ogAwqR8Rc/t+CiTHZP3JM6fFwGd287j+2GU8x8Y5oywIpG9uEnDH9of6PDIeTOySN
 LNW+vTPfw+pPZNKQ+lBL2AxCbI26csB6nM1RAI2bjCWD/0dfspUOmSOn0ux+84odeP7d2tb
 v0zWTQr1uwqnG37uR8bAC/2D3dadD36U6VASeObH4nzIt3KsoLBl5BTPxvTfhAceReQG6Ad
 oK5aOitpRI8wLSdMszsx9GGrGPNK1pEQRvEnHEMIX1K/uKUr4z5xTUa7Otzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767234907; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2YahD3k2ftPqtssEZ66S130zX8+PKkXxNBtMjHNH0ak=;
 b=i7mMJq0nt/Dd4WIIWwfSnWqkUV+n/b+4yO/CWjd30kJOVINLwcl88lwylQ7poYElYWVn9
 M35KTF8dCzZfmSnFilHRNxCWFWU8Dd8TAgTuHTMsEM2DkbwOlio5NBaU+lMAnZfcAS2wl2l
 PR0gYkSrG0nvJOdpwtyACc2jizZ1ug4dxxoPv/vzrESm1fivEYuHZXQdegIXX7jX6kkg/2R
 M43mF7u+p0YHj/FSj4S64fe6PNccrnO6qEn7X9BxbtYznm8lx5jSNmAQqSEaw6679PnxSIG
 upTUU/50exL/rzv/Kwllm/HTLjHFFrlsmvi/tmOrS/9tJPOsXJG/OtFgkcRQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F2DBE44BF7
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 02:35:04 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4C010E04C
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 02:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZq47kHkwQr8bjsRBA7jkrArDlE0nVxVlUk89AERmsSnkIkfZknuD9wrGT2vvcgobtXSrbiaKXmQlebGduAuhKVO5/bF/1w4D7E7kLnNR1FLs5RDFDonX5iIGW6T1/DfRb2bz9X/+f2iuDpWMp1Lp09mFzsUUpX5QHlKPx5zzY98LX/+7URSGd2wQB0BPW5JdT6a0hAIaGHZT3EGw3aALXj40Xzf4SQWs9knEcG4+ymBkaHkN12FnXGq9DQmjBiEpj9hpsVvneQLMaP/wv6M101yc8OjV/h+BxXlunvAYT8MMI4XnQapcxPILrtK7NRLG0TX8Qhf057tpBqOyRMsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YahD3k2ftPqtssEZ66S130zX8+PKkXxNBtMjHNH0ak=;
 b=vdPHD/PASH6WlgSXHgXQQzl0zHgzO8BTfNaG5z5J0TVxClKLT1pNx15bGCTgGQ+MIItMBYAKSwOjXRgcULbW8QTLjshSu0QNwIpMXHcw9uaqSkfhx5qOLNgO4gZxqqyAkNnDObyxq7FbNl3pTTRbae+JjPlTnS1+Z56TpzSVcvNNZwsACdcpVqFlgix7smnPFc6ke5MmKIqzJ63YxlFlXwdvYdoHyYzWqF1nIJFfUCxOmn0iV8XLYMQgekC/vELZlfMSDU44EY2Zh/IQTZq0NoXZFrJdB2N4Wbqq602xEW3Co+RiHHPx/dMrEaWoO+EDqJEuUACs34FIK9WY1JvUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YahD3k2ftPqtssEZ66S130zX8+PKkXxNBtMjHNH0ak=;
 b=rPdynlb0aEjRwLxxuoqYUcD4+VL0KYd/QVMfTyfUBEIJa27kHSjcfpYo/Pbk5d7fdm4AOqAchUeIDe1btv4KnHn7RgvyVAjvfUOYU9MY1SiA6sCXAMIzSIQPj/azPyqzGwoiRjqnjcBQreDDpGNmriO+syuCIY6uolEot1AxMy4HzoVj6zRgj+89vPEy4Pq+LuxSDVjXTDfqF3WN6+/nHP5qFSqO6JImmNxLp63H3TN+aQTQflqJJ/nopoGJX92vSPA5t+veOS0nmDygZWPDZYFGk092UUkxL6+eaxZfFcUMT7GDylwac43A5NIYnrF96r5gD2BazsMX95+HA+f+Tg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 02:43:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 02:43:00 +0000
Message-ID: <efec6ee0-9287-4375-b535-5c50cb218eca@nvidia.com>
Date: Wed, 31 Dec 2025 21:42:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
To: John Hubbard <jhubbard@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
 <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
 <ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
 <CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
 <e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR18CA0009.namprd18.prod.outlook.com
 (2603:10b6:208:23c::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 600bf491-895e-4055-d582-08de48df7a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWlYVVZHcnlHdCtxbVdJZXQ5SVNHMUdvaC91TGU3ajBsUjBHV0RkU1RoVE9O?=
 =?utf-8?B?b292WVNaVy9Sb0ZlcHpDSUFMNmxtaGdDeU05Wk1hRjNOR2JmQ3pNdUlQRGdG?=
 =?utf-8?B?RUVmZ0Q1bkxKUW1QRHQrdURVRUVqYTgxeEZKeURMYXdoU1Z3Q2JkQnVUL0x4?=
 =?utf-8?B?UGlYc29CSWR4TEZ0TzQzSFlKWVVSOVRKTGFuSlg3YmFqd1BiTWpvdHExM2tV?=
 =?utf-8?B?azN0V1J1TW5qQkNyZUxGVE5JRmFXR2ZOdzQ1S0xUNERrVDd2Qlp5WlR0bXRV?=
 =?utf-8?B?L0YwTWhhZmpCRWlCNWhmYmNlY29CaFVKc3hOaDBmWGY1azM4dEFlU3ZhMWRo?=
 =?utf-8?B?dm9XU0JmNFJXL0paUjBHcmxPUDF0c0pPU2NSMm96WlQ2VUxVQ3kvVEh1VlFi?=
 =?utf-8?B?eDFKbkQ5aUo3OEFZaFVUUUUrWDhWaGdRd2krUHk5YzhsRTVTY0pxd2JFOHhn?=
 =?utf-8?B?WmxHMVFZSFpHaHdWWFJibXhDR2ZaUS9QcE9nMjFGaWo4RFVwSlRqVS83RmZq?=
 =?utf-8?B?VFlmdGI4ckowQlhZSkZ3MFdqL1BYQ2ZXSG5aM3RMOHR2QXdHdWZlU1BHYUJZ?=
 =?utf-8?B?UFBoTFFmSGdwYlV5Q2Z0NGlGK1dUcUJGenVGRFNHbzJpZ2ZFblZHZ3BZWFRE?=
 =?utf-8?B?eE9zdW9pTUxvRTBxV2pBR1hYTkJ3YnZKYWNpYWpoa3o4dW9EZ1F1bnZhd3FM?=
 =?utf-8?B?dGswZEJZQjk0eEFScHlJcGlOSktlUWNxb29iRlJiYXFzQk1HbDNpR0xqYXEx?=
 =?utf-8?B?L2JGNlU2dmFMdWMyZ1hpdmZGSG9DV1M5cm1Yckg4U3FKNmJlSlNaNWszL2RL?=
 =?utf-8?B?TXZtamdNc3dRa1FUUW1KRzF0TkNlQVdGNHFJMnhNL29CM2FOc1d3QWxrR0Rk?=
 =?utf-8?B?QUk3MVNiMU1hTVM0cDhIbU10Z1ZZeGZWVFk4QjBzeHFGSjczU2VPZmJQWjd0?=
 =?utf-8?B?R3cwRVYrT1loQTF2bCtoT0VvOHpVUy9YU1U1QVNtSmJuQi93WmQ4aTNsaUVt?=
 =?utf-8?B?cXdzdTRZZGdZYjl6UnYzNGRwclFGejl3OTFXOENxTDNpeGZ0S3BFM1dYTWMv?=
 =?utf-8?B?d2NPeHRMazM1TjcxTHMxMCswWWdUMHlVYSs4S2xGVzRJVVRiMy9HellQZTJB?=
 =?utf-8?B?QlF1MmJtYms0cWdwZGQrNXVlS09NeUVzNzU3Ui9Jc0hnRnRqcTA2TWUrc3Z6?=
 =?utf-8?B?bEVrTzl2U0J4c1hhNkhrU1Erd1A4WktUS296MzVkYkJkb25kQU9HYnZTSzNF?=
 =?utf-8?B?dithZDNoaU1uR1NlRHBDTjl1UDlGVldjUjd2M2tYMlA5WStlTW5sU3Fwdmcx?=
 =?utf-8?B?cTF5cllmQWk2YWRXcXhSMGlSblVYMkw1TTlwa3BLc0RFZVo1ZjlCNU5hUnZq?=
 =?utf-8?B?a0UwM2tWaXV2bDUwYUY3ajB1SGhTZ2JRK3ltZGRmNGl5b2N0L1M2bnJ2ZnEv?=
 =?utf-8?B?L2gwSFhDRDUvbTlKRmd6VFQ1aEZiRzlUYkhlYXh1aHgvbC8zdVlPRFo4YXdT?=
 =?utf-8?B?K2orejgza2ZpcThYZUJXZUQ5d1l6NHo3S045b3ZkaSt5RGJnZDN0ZFE1ZUI3?=
 =?utf-8?B?ZDNkWG0wazJmNnIzaGh6ZEk0cCtHejY5SEhZL3JXdktVb1JEbFE0N0FZQ2Uv?=
 =?utf-8?B?akgzelhHWXlJamJEMWcvNVVMYjRtNEgrTk5BWVdLc2ttYU9pTFRudmtqTytH?=
 =?utf-8?B?NTZXaWlwS2YvK1JKZVlsK0ttRmppZk5UR3Z5UTQzcG9vVWlNMm82eGVwMUsv?=
 =?utf-8?B?a0I5dFdKS0k5Mm9WNTE4VzJISVRJZWpVRVpucDJuUkVkeWRXQTlHWjVWY2x6?=
 =?utf-8?B?SWR5V2dscEZ5ZlNneEFFWEdxa0l2ckQvUmF6VGV2RWNvQUdibk5CS1l5eW5j?=
 =?utf-8?B?bXE5VWJTU3FpN1pDalFMd0cwaXZaT1EwZ2RsMFBqOWJtbXIra1hxSWNqeHc0?=
 =?utf-8?Q?mQ1SpCXx9ghOwUDS+r3JgwY8VDRzBUro?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azJRL0NXRmFOMWZ5SjZUM1pNbDRZNzhyQ2ZpK2MrMElYbDJJV04xaTVyTnJi?=
 =?utf-8?B?WkJYaGl2VjI1VGZ5azlBVDhtcC91bXdJYzFlM3JpT3BmNU9EVWJmNmpaREFJ?=
 =?utf-8?B?T20ySzVlWURnaUNHcUkvUmNaaHdtREZuU1grMkFRaGx5VkpSNk02bnNuTW5K?=
 =?utf-8?B?dGFVUDBlS1ZQcnpza0dJSFpjbjZQWk9Vd0JlOHdmQTEyVVpUY25DVmh5ZklS?=
 =?utf-8?B?azlTdy92NmZ6RDhWd2J3c3M2ODYvczVNVmhPMXhiZ2dRQVdBRlVzVVVja0Yz?=
 =?utf-8?B?dVA2dFJ5N1Rrd1JvQlF6WEhUNDBHRHVDbVRWclJBWDlVTVFzc0ZaT2IwZmVs?=
 =?utf-8?B?RVYrUGFCRC92dWlRMTZ5UklqWHBzMEhUUzBRaEVEY2cwZC95N2hvL3RJWnpn?=
 =?utf-8?B?QmFTVTl4MjJkdDFtNHJORXl5VG1kYUc5SE4vN2tmVUFwbFFuaGoyemZsK0Fl?=
 =?utf-8?B?VWM5OFh5NlBaUGRzeHVmYUUrUkpXb1hPS29LKy9pZjg1K3ZUbkNaM0huWXN5?=
 =?utf-8?B?SmEvMHJUNjJPajErUmlqVVpQdlpDOU12RnBOdU1QM2hlT3Z1VFJpUzRQVlFY?=
 =?utf-8?B?SzdydHBrL0FTUHZBS3dXM01wdFc2dzBWdzRrSGZKcG8zMy9ZKzZCN1dlVGFW?=
 =?utf-8?B?dE9xNktGaE1EdmZpWlQrZ0h5NVJxZmpFMitaWG95VndiNHdLTXZmZjZFeXZx?=
 =?utf-8?B?OHlCZWN4MUUyOEx3aHZ5dTB6ejFqQStESDc2NEExOHFoSnFtNE9SSFZvRTM5?=
 =?utf-8?B?a1ZleHNQRUFuV24yUnkrTmFSVktIcmh5M0pQMFl1SnBsOGpUZ2I4aThJSFdF?=
 =?utf-8?B?ZGJXd05uYTB5am9SSVl6b2tSSzRadU9WZmU2N0tIWGJSUUY4K3FOZU0yYjZ4?=
 =?utf-8?B?VnJvNDhvNVpxeU5aNXFMd0tGYlNiWkpxd2JOVmdMNUVQVmR0aVkrODBqa2JN?=
 =?utf-8?B?cHgzVmRMVHlySzkvYm9RUFhLSWUySDA4d2xaSHZmbEIxd21RQUlhYjlTRkU2?=
 =?utf-8?B?ZitsbldiSWVHYy9HZHcxR01FTzFGeHRKd0JYZWk5ZTJsbEZSRkFpNndUR2JO?=
 =?utf-8?B?RkVnVzlpa3ZHdld6ZTlGdFN6SGRTYjN3T0NYazZQQnQ3UmpZUmluQ0NZeTY0?=
 =?utf-8?B?S3NFNkV5WlRZaG9oMjcvMndOL0lXb2ZZZjVsK2JmM0pPN2VzL1hYTTRubTBk?=
 =?utf-8?B?UDE0TmhlazMxUlNab1pnRktVNnFpRnpObDVZSkZYVFBXZ2w0cnZscWdyeTRn?=
 =?utf-8?B?RHBYTHBUN1VZcnIwdS85ajRWQlMrTGtrNEtOeldnamhUMzBHQ3NyZEtMRDhZ?=
 =?utf-8?B?bEJYOWs2Y0VudXM0WUkwMUhhbTVFME15WjNWQmFnMEsvcWJ3dkpvNHN2alA2?=
 =?utf-8?B?Y29NN1lUaVhNQ3IyR09Jc0NFRjMwejAvNHlZRHpmZDRoNjBZQlJxN0luemdv?=
 =?utf-8?B?NVRhbWI3RENpK3JGTHptLytyRlhYTjRzWDhsVnNUeFRCaEVWcFlDQVAwclFZ?=
 =?utf-8?B?aWZEUnBCQ1FUd3U0UU5PcC9WUTIxMW5VMkZyUlExcHhBMWpvYzJ5cUJOWks5?=
 =?utf-8?B?R1QxS0IwS0tjUFE3OHZzWWJQdGdFZ1ZlcWRjeUJudEcweEZwZEpYd09hR0hB?=
 =?utf-8?B?N3hpYU1YRGU1UmlGamdaSStjV1ZxalpmS21pY2hOc2FWTXJscjY1Rm5tbTVq?=
 =?utf-8?B?SDFxOUY0eitDalFlNFhGQXZOYmlvbERGdTZEaTdEZ1gzNUYxVERTU0diZVNR?=
 =?utf-8?B?WGJtUEJ4dVQzSWRSYllrbGkvODcxVGFkMkI5TUVwQmRlTWU0ZWJna2JsV1Vp?=
 =?utf-8?B?NmVHY09vYVd6Wi9ub0lMVldiS09BSlY5a0Rob0s4ZVVmeitubC9KdEtpUVNY?=
 =?utf-8?B?c3R1RHFmaUdoRVU2UFRjRENTT1pQSWgrci9RRmVmTVovUS9kelVPZFB4RTJJ?=
 =?utf-8?B?M3BUcGFOclVqeUo2RUhMVUtpOExKM0lLMU0rbzNQSFNtMEFBdndwa1ZHQnV6?=
 =?utf-8?B?UTMxMWd4SjIzYWhPSGovdFBqb2pQUTNpM3J3SjBBam5pYm9oRXV3MXNUMGRC?=
 =?utf-8?B?UlpvWW9zRXgxWGJ1Wjh6aHRQSU02MklTRHkzcjgvM0xNdTRScTZzUVZNckhQ?=
 =?utf-8?B?VlBDOW16TVVvanVQOUU2eVRScTk1NWRYb1pMaEtwMUZXckJmbGZ2Y2d2eHE1?=
 =?utf-8?B?VWpZbUlXdG5oWXM2enQ5VkxYZEJCN0w3MldUbDFsNFlxNVVadmFrSlhUZEJP?=
 =?utf-8?B?Z3NjdXdEcGltaUg1TFdHa3YzcWhCbW5XeitpZHFlSXdrNXN4UzdTYlptRWQv?=
 =?utf-8?B?MnIxcnVuNlpsdEt4VWt2ellLL1JtMEdCaGtuL3UxVmlrTURIRUJ6Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 600bf491-895e-4055-d582-08de48df7a54
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 02:43:00.1865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kmULHTF350jqu58/iwUWiCugM/DLBrg+OfNDV0wTxi1gPEH+1E3bZIi3G9Xr/jMZbD5Qr0SlocXO4jwpqGNcFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
Message-ID-Hash: LJJGOYHIKTDVKYZH74EAVUSYJC2M6BPK
X-Message-ID-Hash: LJJGOYHIKTDVKYZH74EAVUSYJC2M6BPK
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "dakr@kernel.org" <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LJJGOYHIKTDVKYZH74EAVUSYJC2M6BPK/>
Archived-At: 
 <https://lore.freedesktop.org/efec6ee0-9287-4375-b535-5c50cb218eca@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 12/31/2025 7:46 PM, John Hubbard wrote:
> On 12/31/25 4:15 PM, Joel Fernandes wrote:
>>> On Dec 31, 2025, at 5:47 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>>
>>> ﻿On 12/31/25 2:33 PM, Timur Tabi wrote:
>>>>> On Wed, 2025-12-31 at 13:47 -0800, John Hubbard wrote:
>>>>> The builder-pattern setters (self -> Self) enabled method chaining like:
>>>>>
>>>>>     reg.set_foo(x).set_sec(y).write(bar);
>>>>>
>>>>> This made separate operations appear as a single expression, obscuring
>>>>> that each setter is a distinct mutation. 
>>>>
>>>> So you're concerned about the fact that the compiler is not merging the set_foo(x) and the
>>>> set_sec(y) into a single read-modify-write?
>>>
>>> No, I don't care about that aspect.
>>>
>>>>
>>>>> These setters are infallible,
>>>>> so the chaining provides no error-propagation benefit—it just obscures
>>>>> what are simple, independent assignments.
>>>>>
>>>>> Change the bitfield!() macro to generate `&mut self` setters, so each
>>>>> operation is a distinct statement:
>>>>>
>>>>>     reg.set_foo(x);
>>>>>     reg.set_sec(y);
>>>>>     reg.write(bar);
>>>>
>>>> Are you sure about this?  It just seems like you're throwing out a neat little feature of Rust and
>>>> replacing it with something that's very C-like.  This breaks compatible with all users of the regs
>>>> macros.  Seems really disruptive for what seems to me like a cosmetic change.
>>>>
>>>
>>> It's only a neat feature if it *does* something. In this case, it *looks*
>>> like a neat Rust feature, but under the covers it really is just handing
>>> around copies unnecessarily, when really, it *is* doing the C-like thing
>>> in the end.
>>>
>>> I object to the fake Rust-ness that's being done here. It's like putting
>>> hubcabs on a car.
>>
>> But IMO there is only one operation here, the IO write. The setter is just mutations. Builder pattern chaining is idiomatic to Rust.
>>
>> I would not call it fake Rustness since it is Rustness in the Rust language. Afair, similar arguments were made before and conclusion was, well, this is Rust.
> 
> There is nothing about doing sequential .set_foo() calls that goes against
> Rust idioms.

Huh, I just meant we should "Ok" with and inclined to be using Rust idioms even
though they may seem unfamiliar at first.

> 
> But this really is fake chaining, because there are no Results involved.
> It's not buying us anything except a bit of indirection and cognitive
> load for the reader.

Chaining is not really only about error propagation. Builder pattern can be used
for other cases too, like passing a setter chained expression to a function
argument for better clarity, I was planning to do that for the sequencer for
instance since there's a lot of parameters passed to it.

But in this case, I am actually absolutely opposed against this, it makes the
API hard to use because now how do you differentiate between an IO function call
versus something that just mutates memory? Is set() an IO or write()?

     reg.set_foo(x);   // no IO
     reg.set_sec(y);
     reg.write(bar);   // IO.

So no thank you, I quite dislike it. :)

Instead with chaining, we can just rely on the last part of the chain concluding
in a write() with the intermediaries just mutating memory.

Further, your suggestion could also make it easier to introduce bugs?

     reg.set_foo(x);
     reg.write(bar);
     reg.set_sec(y);

While this is also possible to mess up with the register macro, it is much
harder to do with chaining since there is no opportunity to interleave a write()
incorrectly.

>> Regarding the copies, I am intrigued - have you verified that the code generation actually results in copies? I would be surprised if the compiler did not optimize.
> 
> 
> No no, I just mean conceptually using Copy instead of a mutable Self.
> 

Conceptually, but the compiler would not do any copies through the setter chain
was my point though. Note that all setters are #[inline(always)], the compiler
should optimize chained calls to simple register bit manipulation. If that is
not happening, we should definitely look more into it.

thanks,

 - Joel





