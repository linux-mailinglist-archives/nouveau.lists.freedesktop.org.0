Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC2D069BB
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 01:25:47 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3431D10E7DB;
	Fri,  9 Jan 2026 00:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VSiCnT+f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7A4C044C82;
	Fri,  9 Jan 2026 00:17:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767917846;
 b=U9MRIFAXmh//YlEUTh1DOmeQn3F9BW53pirEBcXBjDvQ3ZmhGJaybTso/vmgEQAk8kCxw
 G5pOqU3f6mAIo/Y7HnKHvMwbOwI/Z6kWgMZWEH5hmrqEjFh1OjlRVde0hXqDYZvxBzgJzgQ
 nS6o+5lCMMprDcz9BMzlCMFdYtjphW7qZP2vcFkk/qfK5we+Pyv+US4jWJdquelJfYkCfD9
 Bs3cyvB+dq5TwUHXEzBzqDvdYo8pthv3RFVLRIwNmUvWWZROY1hYgGXsq78yUfWaPXnnE+H
 TWG9JUCipVJj5uRU0d5Er0Q8EHq3PPCvRjbKOQdppk9GYdAyekxgp7AW3OFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767917846; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Z4b18prFUlUi+Wf+L/L0oU/u/wS9dTElbWz3b2gAqXU=;
 b=I/aSe7jrme/NBo8aoCZMaXalLLS6WrVsFdZGFIG5GhHMEEC9aK4Yw28zb5riP2AsOaOt7
 Z4/R1nZprWF7mo0IEhr1t3H3d9A0JatEaa9a/mBZB2Bb7bOVJGkBpCieXZHB/t+Wq7ClivS
 wcqMEQr1WviAotUWyrv+lBB0H65iyQy/75n74t3gTNKDBg5s98npnk7R+t8XyiGcJ77/jvM
 iP7zQUvT8WBStJ7TxUPWc5d2o3dNpnqSYl0lsVqhpvi9dwab8y4MIjIWOO0pdFLLiPTJL/D
 LiFZyzdg2CKVhoMnbLLY39g4te8bOmzGOewNcgPW5m/jkU774FD7mHwkcwxQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3DF6B44C4A
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 00:17:24 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011061.outbound.protection.outlook.com
 [40.93.194.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 82D7210E113
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 00:25:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbNIi+5d3xEQW2dQtC26E2TpJv2R2znflI+c8h+RTcrTJQLDH58jyUpe1+sxh5DCFKz+PlQHGHRDdz/yVkbjOJrWqzgnxG8x9y5EQsygYZBW36lgp2/cBCMYh1KYmCkFSWm5llKpF8RRtYwFPyRi34GI3EulVzFarDEOLjDjUEiWWflIb/2ZpI0oa2s86gJ72tzNXs9RKRN8O97OnKfZ+AJvpyrJ8KZ7QmmhWnVaCvOBe4Qg+gZrVny+Wo0LryEJFOaPKmeD8to/OB2/ywlYhSqiN4ksXjvMp1K/DSScFRLppOxqthTHQ57tLOSFPL6b7diQWjyCBNkuBvQsfDifPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4b18prFUlUi+Wf+L/L0oU/u/wS9dTElbWz3b2gAqXU=;
 b=nLIlFY5jFFx4byvdwjCOk4lGSrO5m7WajYJAYqUHHaQ8i2RM+RZLMz2jwGcB9++g0hls/+k2d9XHzAybYDsYXC+TfbLyJ9tso3Y1y3Jr4YfoV56N2f/4vUG9FrDveKW+xvIzbQlks1Z2nCOaLe1AYPr8bBkDl2atBeyd57W89nIIv7oqen6fmMSHr1HT+3z+v01IJeIcNtA4vA9iYKPbEN6jqfgl5vLNOjsUxrGhGD1AUDtkW/diIPLceYea2d0KqQj6tTQmGFXJKOl0h3gG4GxBiyj3dAkR1Fg0eZbsOHxaVuNiEJp2GnhK14IfR/nxknYBLxtKvtGnS24qgiPOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4b18prFUlUi+Wf+L/L0oU/u/wS9dTElbWz3b2gAqXU=;
 b=VSiCnT+fVuoK0vqXApk+M+h7ckbh4KWV+qKkJxIHSJvQLLM5dkrZaIniMnKljLPWrmMvNYcBFYeYeg377K8V7yO104BhS8QG8XNVsSXuRCqSz3ipoExWkZkHbHz/YLLQDDZT1vRo8sGRGks+nwcdGvoiI8STS3hYIfKRE7SKD97DpkdevhA6y4ygYOMtrROPIRuAq6k1LDDtqAs48/TqSKe9HXrbuvxonCbhtIkEbQ23lY6QuutADTj5l49AJ0DT+V4//YZWJx2eSRSQzHuJ383JxMLLZFDLsPf4NhZ9LO5bkK1lzYLNRwY9p65gkOCMoKPXNm27raaCRSs5UxOcGw==
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 00:25:39 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 00:25:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 16:25:37 -0800
Message-Id: <DFJMQW4HIW3C.2KIH3H6RZPD7@nvidia.com>
Subject: Re: [PATCH v5 08/11] gpu: nova-core: add Falcon HAL method
 supports_dma()
From: "John Hubbard" <jhubbard@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-9-ttabi@nvidia.com>
In-Reply-To: <20260103045934.64521-9-ttabi@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: e5cf557b-a570-4f56-a2c5-08de4f159d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aHJDVmQ5UHl1TVVrdEc2Q29SbTlzTlNnVnkxN0pYV3RvVFhVREx2ZEQ1VVBt?=
 =?utf-8?B?bFRyN1B6NkU2bm5ITmxuN0swc21DaW1najFzNStyUCtOQUhiSUdjRFJlZDBM?=
 =?utf-8?B?cGRra3ZFR1o4TlhIREM1RlRtM200SnpxNHBFNGhjdDY5QnJTbEtWUFNyYWlC?=
 =?utf-8?B?NWNqejlOOVpORVQ4UW9qWjlvUllkWCt3eUZGdFErcE5UbGxCYVNxcXppaUdL?=
 =?utf-8?B?NUV6VmJEY1R3bVJjTmQ2SGx2bkNLNW44VEthRG93eTFOalJlUmxYWUJpOFk2?=
 =?utf-8?B?UWxPZE1lcWFscXhmdUlwejZ3dHM4WHNaSkpvZnBSNEJKeHpsWmsvY2dHd1Za?=
 =?utf-8?B?SW5XYWhObDFOQ3NrSkVkM0Q1cVFCcjhpYmhUeWxiNGcraDJOK1plenVoR2RC?=
 =?utf-8?B?S0ZPQ3lGSmZCVnFQMkpqSmxvejMxT0loQ2xRVzhDcHBmbi96S0RwYWJPa0l5?=
 =?utf-8?B?SWhWWU9vdWFRYnBhYVRlNXVqM3gxSUpMRmlqNFdtMlNvZHBQb2p5OE1xaU9v?=
 =?utf-8?B?RlFCNDlVaVl5Z1h2Z3NRdnNuNkVjb0E0UGhxUjhLZ0N1ejRQKzBCUHhUeUtU?=
 =?utf-8?B?VXIyd3BBeGw3N0hhbXpzbGM5TVRtdWlnVCtSdjd4Unc2ZS9vYWJiYjFPMGJ2?=
 =?utf-8?B?MFJRbXBpT3BJM2ExTGdwTVo1cW15c29GZDVBdlhhSVh5Y1ZLbnhLKzI0MGFQ?=
 =?utf-8?B?ZDkwSDdKKytpdnJhZGRYZFB4ZEJYSmJtQm5uZ2pEVkZDNzZIRDdKcHhRaHFT?=
 =?utf-8?B?dC9xTnBQNFZVb2FzakNlOVRuR2w0ZGYycmdwdk52aVc4SmN4Ukxjc0ZKOE4w?=
 =?utf-8?B?NHEzSUtXKzJEWHhqVGkxUENUcDA0R0NUR0ljd055RnU1bFdnV3p2dFFmUmVy?=
 =?utf-8?B?c0dvVjk2ZkZrL3pldWk4TXJoK29GdnBWU2Z3SGZGYzJDMHFjZDdjSklady96?=
 =?utf-8?B?NTJSM0dTQVU0ZEdNZEJRK3h3cU85akxCeld3NzVlSjRaTll4SUpTZkQ4NW04?=
 =?utf-8?B?OTJGNGxiMTl4bkVoa3ZDRkZ6OFBZQUN4djhFY090OC91RnFvVXBPNDh4RGVI?=
 =?utf-8?B?ZFBiNjU4ZmZCNXJIeGhnWEJ0V0RsVkkyVEJBUkNnQ0tmQ1UrYnMxa0taQU1z?=
 =?utf-8?B?VjZFK1NXVVlPUForUkRUWGwyNWtQR0lJV01WbTF2RWl1NzQwZGIzR1NaeGEy?=
 =?utf-8?B?bm9PRHBsekY4cE1ieUF2bytLR0M5TWxTSW1MNUNxTlcvekRjMWJJcXY4Ky84?=
 =?utf-8?B?UE1FMjZZbWlQNUt3RHExUklqdWs1bzA4L0dHWThPWnk5VVRwWUxMTXM2S1ds?=
 =?utf-8?B?QURrK1BMdWJ2VSsrRDR5cllEUkNmSjFURHA3bEdHWVpHa3V5a0ZQRFNlRXo0?=
 =?utf-8?B?M0Uxay96NWNHV0NkNzRpbmpldzdEbnFKT0pYM3dHVWV6My9IdHVUdnVCY0FK?=
 =?utf-8?B?TnVHMTAyTTJKME1Ub1ZSU0xESExnRjVzbTdGZGhPRmhWU2dpT3h2bndPeFps?=
 =?utf-8?B?N05BcFlmM2wvWlRKSDYxOFA1ZnZ0Z1hiR00xMXJJNVo5UDZMOHN1OFhldDRM?=
 =?utf-8?B?Qi9JVnlKRWRMbHV1bnFKOVUwNVhpV0VDcHY3QnphNXdlM1BuSHF1T0FiS0JD?=
 =?utf-8?B?UEhLZFZEYTFZY3YxeVMxZy9vQkRlZkFvWEVZdThKQnZwWDVRWGZUMHd1eUtk?=
 =?utf-8?B?dk1ESE5FdFJFWWFlVDZtd3FoNjQxbzhOdVF2Si9LU2xDNWpySXlhMnJlS1Uy?=
 =?utf-8?B?d2NDQ3pNeXRyTkRIQVpRNDFueGN1Unc1dktRSG92R0EvRHV5RlV2VnNxczZO?=
 =?utf-8?B?ZktSMGFLVmRYd3VjYW5xNGd5MVRESis3bk1vRmVwZm9SZzVjQlFRQ3RNcFlj?=
 =?utf-8?B?dWtJVHRvdEREc09aSWl1V0RYeEFGOU8zNGJqZDFLUGh3eGZ3ZWtKOUdMeTBV?=
 =?utf-8?Q?d19nK6AZuXc8ZZD6V7c9qU+h1InfihZh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFM5TW43QnJ6TG1KWEJIVlVWTEd5UlBhU0JtQVU0L3JtczdnSFkzam15SVQv?=
 =?utf-8?B?dFhqcjh1dW82eHovQjJJbmV5anpZWTZoQkhxMmJUeExSOFlsS3pMTkxVdE50?=
 =?utf-8?B?eDh5MzgyU1poSk43bjh3YTFDVWRvU2QxVVhxMHVxcStGMmFRM2FQdU82TzBm?=
 =?utf-8?B?dUU2NWI5b1BERE5vMExnNUlndWpPVWZVN0VUQmNoY3JlbXpCMjFnaERrZ1do?=
 =?utf-8?B?VWZFanJFZXFTVmVIZlZJaHNHNUJMUFpJdytwbk1tV2ZENVZObVc2RjdqUVdh?=
 =?utf-8?B?QW5pdHBQNWxDRmxQZk5WOCtNVXBPUEFhNnV6cDhOSHlvVjkyTisxWGRvLzFh?=
 =?utf-8?B?NUdzUUFoUWxqR0JmVDBaL3haY0pGdUJkRHh1MlNmdnNkaVNyYmdSMVNETWxG?=
 =?utf-8?B?dEtxY2NYTG1hK2pJREJGZi93MGdOUWthZEM5UEN5MFA2VDdjYVVrZ1FpOTBD?=
 =?utf-8?B?OXRjeDgxK1M5YUtNSEpqS0dLVFE0SGRveUhZQjVKQU11TEtxcHZleGxlR3M3?=
 =?utf-8?B?aERXRkNBVFlXTWlmNHJFNGVNRjFGRkRQTzFNZUZObjhYcjNia1dVSDBoemEy?=
 =?utf-8?B?WUNoWXI1c0pMOFZhclhSY1EyUnFqdDRUK2JpMHQ0QVBFb2Evb3B6Z0VlUTBV?=
 =?utf-8?B?QmxqM2FPWXppWmhTMlpEQXVHWDJ5U0dhU0dwemw0NlVqK08vS0NHNGNaamdI?=
 =?utf-8?B?SXVEYjZKV0VCejc5M3VNVmN5bE5wMms5UE5IM2lpZENQOHlRb2FzYXZpTXhV?=
 =?utf-8?B?VHBDMXBmR3dtbWtJdSttUWJtQUZvVVU4Yml3RDAvZFN0aXRUWlJTSjhZYWh4?=
 =?utf-8?B?aEdDSWEzbXRyWkZldktTcDR2VnZNQzZ4R2NSekpmMkpuNTV1eU9XbUtRS3k5?=
 =?utf-8?B?MXlPdytvVkhHUVlIdFhPTDd4eXI3MlJlQXZpdjZPbnZBak1taW4zUnAzM1p4?=
 =?utf-8?B?aVhJMWY1NmxjZGJiWHNRVU4rVlFpR1Q2a29LekpCemJDYURObGg1RVBtUkFB?=
 =?utf-8?B?KzhySnRRVDZZeCtIT1k3NVc0QTM0Rkw0SW5iMXZzYXVBalNFaGFYMkhWQm5G?=
 =?utf-8?B?UVd1b0ROcTFselhDRG9BeHpmOU1mTGZPMHg4b0x5VXpaL1gyaUZxQlg2bFRB?=
 =?utf-8?B?OFdDTXN1VngzaCtpZDhCbitzVXJzOTg4Y3laekNaNVdaRG53V29NN3haOFVU?=
 =?utf-8?B?L1V4aSs4ak5sb3VZck5uNEpRcDF5YjFhUXM0R1JBTEIrSStGT2prNXREVEZP?=
 =?utf-8?B?ZnJuTnZESXk3MWZoWlhna2dmcGVGeDZZRTNzUk45SFh5NStsbndzQmFXc04w?=
 =?utf-8?B?K3hydzBSZVUwUFVpN3FqMzNld2dFNlAvUUdxVVZaMFZpaUJxS2Z2S1ptaU9u?=
 =?utf-8?B?OXJtZmRYT3JWbXNPM3pmenRIN2p0VnJ4cUZhaEw4MEtsZGltWHp6TTFUOXor?=
 =?utf-8?B?S3M3WFcra3pneWIzWkp4bTh2TGlzVjFsWDZuVk03TGoyTVdqOEpDZWJrdW9Y?=
 =?utf-8?B?RWxST2oya0pzNFNEZ2t2TkM1eGxOdXc5RnJvQ1Q0dTh3QkhSVVJXQ1J1UWp0?=
 =?utf-8?B?OUVBYUdoTzN3enZxVFhoWnVaZGtQT1o4Y09TYU00cVJGaHFhM25henFDS0lN?=
 =?utf-8?B?UkhoMjJTaTVIMGswRkRLMEFSWlFRSW5JMGZtazBQNGlXREowTUdGMGFxZms1?=
 =?utf-8?B?ck5QYXFhRVpIbUo2cVVER2dqSTZLd0pwNlUrc1pFaGdtRkhPc3kzVUtJWlR1?=
 =?utf-8?B?TkdRTkdub0xkYWdNRUF5NURuS0kvdmdOd0R0eGhxZGNEdFlYT0JWZWpzV3Zi?=
 =?utf-8?B?YVVhaGd6V3FHcjNXV3VLeXhudWVSOTUzbXY2OWh6L0JIekZNY3NsNVowdURx?=
 =?utf-8?B?QTBZT2FRVDF3aCtPMkpuSnkzZzZwcjVTSE9DZm9IV0dJcjVGcTNFTjZBR08w?=
 =?utf-8?B?d0o1dVZzUEpqbTYvT1F3Wi9hZTErRE9DWXNlWEl0S2N4WVFLQXN1L08vWnNJ?=
 =?utf-8?B?cHZKTTUzYUhHWTJoSWdSd01Wa1FyVHhzS0xIQm4vYWxFMGprcWE3b1VET2Fz?=
 =?utf-8?B?K0VHVEgyaDBpT0dvQ1pCL0xsdHMycHF6QitmVTJHdlYxZ2FBRE9QcWMrVEZC?=
 =?utf-8?B?TXVrSzZJdy9oeGNxMTB6OWJQSVdPaW9SbG9NY3k2NnNYbi9HSnFuOTZ5QTVS?=
 =?utf-8?B?QzFBYTJLQ1RWNGJ1d1cvNWc3MHI4Ylc1ZEN3dHhMQmltcStMdFUxMHNLeU15?=
 =?utf-8?B?M0xhRGJMZ0pOYUttb2lucjdKQlV0SDBaY2gyYlR0VnVJejZyRkRMY0MwZkZN?=
 =?utf-8?B?clVsdkNkVmN2VkNLUVQvKzhaeHdGU0U1UE9ZWXVuUWJDcDFNcUNOZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5cf557b-a570-4f56-a2c5-08de4f159d87
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 00:25:39.1704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D6autkbqcnRmSOpS98BtSLA2uVoUw43QiYj7EPv0NJbn64AXLhfjrBkrY9wYJ59eesGil0xDNROnCgq94A589g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
Message-ID-Hash: YW4E7MRC5JQPBIPIICHVUDIGPVMJSD6U
X-Message-ID-Hash: YW4E7MRC5JQPBIPIICHVUDIGPVMJSD6U
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YW4E7MRC5JQPBIPIICHVUDIGPVMJSD6U/>
Archived-At: 
 <https://lore.freedesktop.org/DFJMQW4HIW3C.2KIH3H6RZPD7@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 2, 2026 at 8:59 PM PST, Timur Tabi wrote:
> Some GPUs do not support using DMA to transfer code/data from system
> memory to Falcon memory, and instead must use programmed I/O (PIO).
> Add a function to the Falcon HAL to indicate whether a given GPU's
> Falcons support DMA for this purpose.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 7 +++++++
>  drivers/gpu/nova-core/falcon/hal.rs       | 3 +++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++++
>  drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 ++++
>  4 files changed, 18 insertions(+)

Seems simple and clear. I know there was some exploration of alternative
ways to structure this, and I haven't read the following patches yet, so
maybe I'll eventually notice an opportunity for improving the Rust HAL
code here. But at this point, it looks good to me, so:

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
--=20
John Hubbard

>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 1669a7d19b1b..744f513da9cd 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -629,6 +629,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> =
bool {
>          self.hal.is_riscv_active(bar)
>      }
> =20
> +    /// Check if this Falcon supports DMA for loading firmware.
> +    ///
> +    /// Returns `true` if DMA is supported, `false` if PIO must be used =
instead.
> +    pub(crate) fn supports_dma(&self) -> bool {
> +        self.hal.supports_dma()
> +    }
> +
>      /// Write the application version to the OS register.
>      pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) =
{
>          regs::NV_PFALCON_FALCON_OS::default()
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index c886ba03d1f6..49501aa6ff7f 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -48,6 +48,9 @@ fn signature_reg_fuse_version(
> =20
>      /// Reset the falcon engine.
>      fn reset_eng(&self, bar: &Bar0) -> Result;
> +
> +    /// Returns true of this Falcon supports DMA transfer from system me=
mory to Falcon memory
> +    fn supports_dma(&self) -> bool;
>  }
> =20
>  /// Returns a boxed falcon HAL adequate for `chipset`.
> diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova=
-core/falcon/hal/ga102.rs
> index 5a263dc37d63..b2857293e653 100644
> --- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> @@ -158,4 +158,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
> =20
>          Ok(())
>      }
> +
> +    fn supports_dma(&self) -> bool {
> +        true
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova=
-core/falcon/hal/tu102.rs
> index 586d5dc6b417..28dc03db8240 100644
> --- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
> @@ -76,4 +76,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
> =20
>          Ok(())
>      }
> +
> +    fn supports_dma(&self) -> bool {
> +        false
> +    }
>  }
