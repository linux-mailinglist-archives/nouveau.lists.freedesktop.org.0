Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4BBC6C590
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 03:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD7D10E21C;
	Wed, 19 Nov 2025 02:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L6PJRPNL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B99510E21C;
 Wed, 19 Nov 2025 02:17:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHUHuDnic5O5uHrDD5MrHRfYqkP9UtL8ACKi9iYPqNMCwPJRucx4OuczOIvofcS8qqi23tOmYCfS4PMJkGD+DOTZDP5GbCOSiabV83VVh4CLwKKzS8CX1ti1k0DcbBwf4+qtoxFsXzozYqt+mJFd1DJoP315BTlUY/iPClidgX6eH+XkTceFnglQZ313GIE9YhSBGnRkXpc44icl2iCt2V6nNPdzSwdSzpqSgHnolO8GOhMxM8YOhdTxE1UrHxf/tOmHbXofzAXSRKDaCEWpzN0GDff+kgBLikFKyDO0dgZeg8tifc9d5YmSH3h1BQkRpI9sEXUnKqWCUixyUKz79w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeiyXsl3ldq9SW+YLrIMWmGBSwx3phjXSdBHMvBLxPI=;
 b=EC91fFTvrAUMHBtwCWghUVq5CdVxTh7WhQY+T2w34h3GABFHQCfRTaCS3sa3Sqp5fSQtGsabtLdqJbBIw9uT3i9Uhx6AISnkfTqCRKBs5fDX96gCmfIMZqJ551pnH06NrPdNR7Z0tv/EYkDroyOvcboGT3VDsb/F9SMZnfcCgFFxMY+fD2UPRO/eBokTUGSkyYEbqJzH3lbdZVLYWAp/X8UREAEthAi3LRqARSUs4z21LNdZ2z8iBNOD9OYhGQQoGZ5wKgLJciyiR7TBNta+kEEe50SGIoZAINL74T2TrDIeP7Np2PzRqwfQF4c/zYfOUPjiDQiYy2xuoxBf5Gd7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeiyXsl3ldq9SW+YLrIMWmGBSwx3phjXSdBHMvBLxPI=;
 b=L6PJRPNLFSowxJlxhQxrttmSSoKON4nL/uibnNjwFa771y+DwPMEuOWTyIkL9b9/sjEEcBl5CrRMaWTSe1Mdc8C7u9RKARpYGJzyp2PKvbSyRJP2vHWqxAlX1QPVdscdJvYb3J381V3YB1+MHF+Hy1YsxmQ2o20H9lcJmhwCIvU1tjBzovbMnKIkt5sslE3aVVIwrmnKncPoseg3VW4KANu6xQZVQCHDhc3tJPJqb31JowHupEnu0buVykVXbAyRrrPy0C15eif+SpvCKOROHQajK5wquMWnp+Cn+ucFipWad9oMs7S8LxKKbBLWYK7ZVxtWcYB19KDuxVTS/rmtZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 02:17:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 02:17:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 11:17:04 +0900
Message-Id: <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-7-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:405:372::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a9b4d3-ef64-4ae6-1bd6-08de2711bdaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEdaWUVGWGdZSjVrMGx3UlJPSDBCaFFsZEtibVc5Tno5RE1PeVkrTTJ2VHJl?=
 =?utf-8?B?SGFzZms4Mm4yZVR0alQwRUE4MnIwQ1dSczJ1U21oaXN1N2M2WXI5eUoxbUdO?=
 =?utf-8?B?bjFrck5DeVBKV1BQeHg1RitKcndPRTBsSHZNMHY4dTltSWhEUysrOU1CMEpK?=
 =?utf-8?B?Mm9oZEQ0amlBc1dQTHNiRnlDN2VwM3pRZmVHUThWNHA1amtHU2NvdzlIbGcw?=
 =?utf-8?B?WkpZTncrTGYzem02L2JJM0hTbytGUmErdzl3eTFNdmhKMmxqcXE1UGJVbEJW?=
 =?utf-8?B?djIwNzMvNENGaCsxdnVvTVhLVFNmL29tUXFhMkxrcGZDVEpXdkI5ZjRYcHFC?=
 =?utf-8?B?NndRN2JQeHVZU0pCUmhVTEI5Ryt4WmlTVkFQWUJscFQyMGx2eUFZZzl1M0pj?=
 =?utf-8?B?di80N2YxNHJzTzlCTVM1ZU9xWm9rUXV6SzVCNm14Tk55S1BxMk5BN0hFOUM3?=
 =?utf-8?B?WE5kRUU5LzJ4Yyt4aEhpUFRpMDg0MTV0SGNhU1JRM0YzcmxmRGE2Z3RIWkQw?=
 =?utf-8?B?aDhVTitnR0NrQ2YzTktYc0N3aW1CaGY4N2lWdng3Y25EajNOWDJGREorYzBr?=
 =?utf-8?B?Nk5qMmpxTjNtT3JZRWFvK3RQeVgxUm8zMFRTS21adWVjVnFVcFNPV2k4Y2Zk?=
 =?utf-8?B?K21teDVJN0RVd3BrRDVLT09ka25CUVNCcVdsbTFRUUpIUmRnZXpUWFA1aGZR?=
 =?utf-8?B?NWVTTngzdm85aTNiTjdicTBHR0FlOFRtb0hmRW5lYnFDMGw1WTMrb2hYVGRp?=
 =?utf-8?B?LzZTYVZOc0l5UmFvNHl0NlBlY3dLVVJPNGl0cC84U0JvMkZ6NE1CdWQrb3Nu?=
 =?utf-8?B?T2VPVDV4eG5HdjJYZlp2b3VJb1p3TDdyOGI2c3IrUW1aS3g4VnpsVy9mZGxo?=
 =?utf-8?B?blc1azhWUmNXa1I1REsyN29oY2c1RVNNSVVQdTlEeE1UZlo0K1VTT3VFQThr?=
 =?utf-8?B?RTN3OG1wNmZSMXFWbSttZ0JXOTYrZ0kzNmFjZWIzVGU1NlhNWHFxbWhPbDc4?=
 =?utf-8?B?T2lFMkJSVEt3WWRJNytqQXg4WUd3Ny8vUmtNVmxKbEZ2TzNYZHo5UUdXZThy?=
 =?utf-8?B?b1FHUjI1UzVqVmNRL2t0NjVFRzlmTERiM2xabGVRczVkZVN1UlhQaEpydHFn?=
 =?utf-8?B?SlFyeDJ1ZzZqeGY0L2wrYlZXYVp1bGM0bkxQUUN2Z0dhdjlqNDVyeldManp1?=
 =?utf-8?B?Zzh2cVU0Mmo4MURvWHI4WkRDck0xVyswc1FQazJRNlNjeTRPNUZUOW5NNWow?=
 =?utf-8?B?T2IyYWNZSFJGejZQS1FkM1lENm5ZM0J3ZTk0ak56SmExZ3d2Nzh0a3JQeDcr?=
 =?utf-8?B?SGFPckVYVjRWZWxZUlRpRDU2bEFBQXdXWWxIYitVdXQ5eGd4ZW5aKzJibE13?=
 =?utf-8?B?RTNaQ0tnTzNWUkFNK0lVaEdEVWpDb1dwckpTSy9TNHdvNUlQQnZCR2JVV1c1?=
 =?utf-8?B?dzg5SnhDNHBaRi9MbHVsdnVudWxrdVNRTDlOOTJPaEtJSjZhbEEwUXdJSGhp?=
 =?utf-8?B?T3hlMmZqUXZMVVpiVkIvbzN6WHByalBOVXZKMWxINmtBeTA4RDUxMlRWM3ZC?=
 =?utf-8?B?Um1wc2d5bDFBMEUwNUlKVGYvOWpaNzlzWEd0UTVhQUE4cW9VTmx3TEpHV3A4?=
 =?utf-8?B?NENzcFg2N3I2NS81ZWZDT3JCZDRmTXdRMUtKR1prN2lhOEV4QUpQc3h3WVVQ?=
 =?utf-8?B?S2NLT0c0Mmlma29rZWt4TDAzbElxd0htd3pqMDdzM2VlU0FHN21EbjRoRW9p?=
 =?utf-8?B?K2pyZEZPYXowQWtvOFM4RWhscW1xWG1vcldyZXg1MFNtRVF5dEk3bEk2Sm50?=
 =?utf-8?B?aUpXN09aNDFyaHZTQmljbWhnaHRGaDFwQ3QyNnB5UGFBYVZxSWlueS85amhk?=
 =?utf-8?B?VURpczRxbktjdG9wVDNiak5ZTXc4ZzVReCtXNnU0NU9uU2tqTDBnOFY5Q0RF?=
 =?utf-8?Q?pP62oRBqXAAPpi0Zc4GW/Fc69NjC60+Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnpEcEM5ZUkzQlBpQjlnRlI5eGVMaGtUak5YV1M4bzdjd0IrN0RJemhjYXVI?=
 =?utf-8?B?T3R3aXNyMXdiYlhxREh0V1RzUG5aQ0MzLzQwcCtITEhwRTg5TmQ1T0l6YTFR?=
 =?utf-8?B?LzBZaEdaOVlTVG9XS0hvNXlqcWNoLzlWT1V3RzRGd21wdzhxT2tjNHlkbkd3?=
 =?utf-8?B?Ym5STFZRZXg3N2NOWTNZZ0VTZWxicmt2cDdQL3lxV2xyWGcvSlcvaWd4dVJK?=
 =?utf-8?B?ZmZBMVNtbU9Yb0dqeW5MY0JYbzgxMEY1aVowM2dpaklkeDhuTzFzRE9GRkVK?=
 =?utf-8?B?ZmVnWWxKaUdpdlE5NFNWdTlOdXgrUWg1ZktGZUI2ZnI5VlRMaUxQREhtaTMw?=
 =?utf-8?B?M3BiaGVoWGRybGp3YzBsQnBYRzFVcCsveFp0Q1UyNnJqYUg3QktMb3kwM0o3?=
 =?utf-8?B?UnVyd08yV01vU3Bwc21VMWltSmZXTjZBd2hMMXZvcWNteWxqTDUzaEhXSjd6?=
 =?utf-8?B?RjFlaTJJUG92cG9VUjZZRXkrUnBpaXAzV2RKZkgxbW15bEg1RG81eVErdGNn?=
 =?utf-8?B?V3FpUmw5YWh0RFM3c0pjU0h1U0FEekowejF5SUVRYlFXclgwTGtDR3V2UGIw?=
 =?utf-8?B?YXZrL1J6cXNmWTJmRnBla3g3MVVlMjFmVFZBTmpyNXhORDNyWEZNd1YvN3F1?=
 =?utf-8?B?ZFRXUktjeHVFaUU2eXlpNlZsZGUwbVB2aGo5OFk2Rkx2N3IxTGUyVGt6Ty9K?=
 =?utf-8?B?YmVVNWJEQnV1SjFsMGtzczk4MlhteEZuUTN4S2p1djd6WkVPMlFMSnRvK25z?=
 =?utf-8?B?bUs3MTd3TXBER3d1eldzWUhuaGd4TXNSbURBdU5tTUI4eDNCQjdNdWErMzVu?=
 =?utf-8?B?YVRLdjNNRUcxZ2pxOHdDSHdHSzJwRlJPYkhPVHB0OThoUnVyNE5QRFJjakht?=
 =?utf-8?B?bDhsSzFOYVdqV0ZQTXVteXhPZGVVRWFPQzl2T3pRVW1mM3dJWmgzZXllcThW?=
 =?utf-8?B?WVBNaWZjVzhjZVVMa0Ftdy9JUFN6bmVzMkxQU1pMUTBZaEx4NW9peVdJeTg2?=
 =?utf-8?B?WGRoc0hyTzNONllqV3Q1VFZSbGptdmNMaUo5Qmo4Q2hvekQyaDFJSG0zSUQ1?=
 =?utf-8?B?K2RJcituL0ZsZy9lV2RhRmkrcGJFa0xvMnVxRlhNYWJDOVNGZGlma3YrVjVJ?=
 =?utf-8?B?U29tUVdLWVRlSngzaDhHUFdJOVBVdTNJaXZxbGFhcmMrbnZ1OXUrTVFRdzNK?=
 =?utf-8?B?bFJzR2lCL2pCdjhGWklJdVFUaUF2VWMxYVUzRllLNERtNzRjeTJYSit0aGxJ?=
 =?utf-8?B?WE50MHhHZXc5ai92aExiR213Z3pVQ3Yva0FtbzJHVDhMMXhCNmRWYko4UXgx?=
 =?utf-8?B?K0hhWDBNRWt0a0tvK2JoOXAyNTJENVFNcytPaGhleGU1YnE3ZEl0cVNiWGh0?=
 =?utf-8?B?SmErNTV1VTdkZG1Ca1RXRGZPY3BJbnR6SFp1QmxBTEUrdEx3Ny91bzRTRlhL?=
 =?utf-8?B?OW1XZWlpZHZLaVFVaGtMTjQxNTBWNGF5ek44ZUlnYjNTQnYzS0Y2bVozc01R?=
 =?utf-8?B?RE9XUlYyYUk3M1gxemhTSzhLZkw1T3VtOHVmelhUQmxISWtmdFJwMkgrbGhp?=
 =?utf-8?B?U0MwNGZzTjJmQmpHY0JlRkZHNW9NL3lKamxtc1BnaUxTUmVYZ3dKaXNNcEd4?=
 =?utf-8?B?aDVLMGp2dStHbEFtV0VGdXgvaFB0TWxieGgrMG1wNUhBTmdkb1J1MmtJclVL?=
 =?utf-8?B?UkdValJ2bmRiNW5ib2ZDb3ZLWmtha2J4THJUeE9jYlFVblFzWDE5QkZSek9w?=
 =?utf-8?B?WjRYOUNxSDB0d3VDdXowZW43eWphLzMrR2lUM285cjJBVUcxa01mbm5nT284?=
 =?utf-8?B?OGJDM3hYeWwrZWV1dWpqMmlhbEdwYllOYnM0MlYxWXBJbGFPNXIvZytYcGZh?=
 =?utf-8?B?VEF5ZWRaRys5WVBIVGlkYmJnbms4SkJjYjdJbi96c2NDNTEwcnJ6emUvUEY2?=
 =?utf-8?B?eFFTZVJTSFFpNnJiUDRaMVFKOUtsNG05TEVWeUpHS0JZODVFRXZYU3lwOUVp?=
 =?utf-8?B?TXpET1NnUVhqUkdINUNqaDdWa2M5di9BaTErcmpCc0VnTHh3L3ZiQzA2ZnJY?=
 =?utf-8?B?NDVBV2orUVo3REV1VVZKQzUxWkRYaGhpSjUwN0paQi9SeHVDU29tUEdHMFB6?=
 =?utf-8?B?cVJKaURsZ0FnS3JMOGQ0bEtGZ2RDdFRjZVR1aENvU21ORWhFTFpPZWYzaEdX?=
 =?utf-8?Q?45miTCDMLP5alIijeYog1FQxwMvxpdjbi2AV9w0PjXdb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a9b4d3-ef64-4ae6-1bd6-08de2711bdaf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:17:09.2133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMkxBT3zYWoYokFcB+sfV8TuDOAL+V52mXu4V3ckW5OjrcZUGnVxuXGDZf1doFaUWt4cTV1prsC255138Dw6RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
> Define some more GPU registers used to boot GSP-RM on Turing and GA100.

Nit (for the patch title): these are falcon registers, we just happen to
use them for booting the GSP. Also IIUC most of them also exist outside
of Turing.
