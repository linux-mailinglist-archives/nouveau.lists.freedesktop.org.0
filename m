Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFEFC9F286
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 14:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9353B10E7E2;
	Wed,  3 Dec 2025 13:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tu5LTsv9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92D110E7E2;
 Wed,  3 Dec 2025 13:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA2MNNd0VXYCkg0mbLGNfXtCrGVySdD2AfmVy+LSfjsc0reP872o5DdV4FLdHbdZK5BUysx7t16LZ4O8o/zBz411AyG42W36FabczmiNUsx/YwEGbDMKpinOt//UePIIcUQ0Ut3QQkpQztq1FYNVP/CGe1l0HtzPRAzeAdlhNUnYns9q3mo1BJqYGDU9nlSVvhKDUHEBXYlwuucq/e8Knmef6bem2HYBufeFaZruKC4A/H72X0eXRIeMvMIxzXuLq78ftTBq4gXGvQYp0b6BiNfT7sOdtHMwHq3zOacuqYxVCFsHLjqzsokAv7dlSnKsZvhIRdE3my+4YU3I0l+hUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeyd8fyLbxeMn2J/hU95igbRCA6ae69tU+zYq4SyIjo=;
 b=s6Xm+7A4hNouxBc9SVAoMhyFsEBM7bBHiukg7CXzaMgXJZCPn4PVPDGBkhJabNssnos0ZdXlmn/ix0/bNRp0loy4+adf/LQS8awyOiwdwcOn4kdw2KW0aWyt99rUYjOBeo0pnG5YMHIU3Da034pmRZ9DfIpKh7ZYAsjnmZyJqUuLxW0VqZnYMqxGa3BevQOnOvlAN8GPE7BJewXDT+BFRTsHdywWE57UL7C+tHEX9qCF7Nyi0zVRiwvsyqOQD5AJy55Dn+oIIJYjTkerRPdoS3vUDGG+kBOJSzQoLP3dkleAFNHErGEeAGv2pGEVc7rrfR4Y2mxkGuWpNnDo30I/NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeyd8fyLbxeMn2J/hU95igbRCA6ae69tU+zYq4SyIjo=;
 b=Tu5LTsv91bYpbrFDFgzIRETBnKdDVRmsJIO3jpyWwlvw6awm2+ipOrKKUI1fqkV5ipDXbgCe6EQL8VAbwaNlnDv9DawFE/LVTVZyVVxJIxXTrqWTbrt+4lkLsBJRPKWslzb1DPQFstU1iHT86+dUweeVCIemOj25sR3cnjVvGMHcIM6JWiFp/ck+7qnvpRbr/28mnK1n1uCgXGjyz+mKAGLv8ctWEZNLFjseoUdUArLMy+w30z4eCcF0lsGzDp3p5UqiSt4joN2Y9+E2TqNCY1FoM691ijE6189JL5QrwsnKmSamDz3pMuikqwcCBkZ8rom/4rV0Q8pQeDcgsntN3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7324.namprd12.prod.outlook.com (2603:10b6:806:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:39:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 13:39:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 22:39:38 +0900
Message-Id: <DEOMGOAG4BJU.1TS2N5I0WRFQR@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument
 size must be page aligned
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com> <aTAnHrcaP23_6lDh@google.com>
In-Reply-To: <aTAnHrcaP23_6lDh@google.com>
X-ClientProxiedBy: TYCP301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a3d1a0-3250-4af9-e542-08de3271698d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWgyZGRxek5vVXpzOG96Q05oMGlhR09Pc3FXb3VzaWhzaW95SmlkRE9MWFRG?=
 =?utf-8?B?My81c01xS1JwZCtmWGJjS2RCcnFRb0hjNnJmNVRRM1pLMTRSRVo2aHJ6SmlL?=
 =?utf-8?B?aTdlbkdYNVE1VC80M0ZVV3hWL3lSeHlTOGhJMWYrbFRLV2ZUR0NZMDl6REhK?=
 =?utf-8?B?R3psYWV1bFBYaUV4STZvV2tiSDJJL1ZPVnFKTGxOMEZRcnBWcTNveDhxUXAv?=
 =?utf-8?B?cy9lcnVGZTMxa3J2eFFFUlc5SmxaajV5MlVmck8yZGNjMytMYnFweUgwY0Uz?=
 =?utf-8?B?U2Zzc1JjOXFFeFFTS1NNbEM4dGNPMmx3RTV2UDJKVDU0bTRqQUdZRWM5YjNT?=
 =?utf-8?B?ZjlmYVd0cysyUFIyMmxGanByREFXZkdRZ1ErNDQzY3hGVml6YThya1N3V29t?=
 =?utf-8?B?bGxYQ1RQd1cvaTBJTzY2d1RXSVYvL2VveEp4UEVqMjBMUXh5eUlRbFZSRjNx?=
 =?utf-8?B?dHBYQWkyT3RwQXpZMDhLRVlUd0srMWdGcUM3VGVQemc5bkkrOGh6Z3RJVW1V?=
 =?utf-8?B?b21JcU5kVEtNQnpUUkVvbWR5NlQrSFlkZTNZbDRJN3BQdURJWE1DdVBBNXZr?=
 =?utf-8?B?dkhkcHUwOWJCYmowSmt1dlBIbjZtZFQ1T1hucU1YRVY1VWFPN0ZXZmFZL0o1?=
 =?utf-8?B?UTEwS2ZZMkl0cDR6ZEs4ZE9meG54ZDBiMVluVU9rWW9zMVFseVR3amJINEZ4?=
 =?utf-8?B?V29DcW5TRm9YVzZJRnJXVXZuL2RJMFVzS2FKWHNxSFo2aE43Y0FaVFlTNHBB?=
 =?utf-8?B?VEdSZ0VnK25zaHZjbG9KWE5YOG15VDZPT29EWWFxeDZFWk80bHlGeVZVUnlX?=
 =?utf-8?B?alg1N2tEM1RSNVdIbllrOGl3akszbVkvd3JRcTFiNTRJTmt3engvUVo2N3Mw?=
 =?utf-8?B?aVVHNDlsWEVrMFprU3JNZ0E4KzFyL2ZWVWFaRWlvam9saDRMNVlxbmdvQkZV?=
 =?utf-8?B?WTZNSnpyeG5jekJ3VmxJZG16dER0WVhiZ1VySDJGV3I0R09pRUVSa0tDVEJL?=
 =?utf-8?B?MFFjQWRGNTlyaUduL3VNTDJMN3dRaG5Cc0lDbVp1VVhjSTZORk04Y3lUSjVp?=
 =?utf-8?B?UTFPTFhtdlBoK3Zmb2ZYd2dZYVk5NndtWlpqcjhVZzlNWXpDZTFTMzNKM242?=
 =?utf-8?B?ektCcUR3elZvcFNtb25rMi9ZVDd4NGN3Nyt3ak5tU3B2cWF3YUs4Z0ZQQUpo?=
 =?utf-8?B?ZGUreHJ6M25JcVdidjIxNXBYWUliZkZ1Sk9wUE9kL2J4V3dtc2JGZUZISFlG?=
 =?utf-8?B?d21zdHhHV3NoeHBCdURQOE9McW5YYnFBY0NvYVZIQU1QcUlsenBFMEtYT2xL?=
 =?utf-8?B?K1YwQnZ4YngzZDY2SXNrMkV0RXBZRnFwSG5PV3B0MEwybHRyUWljci9WdWFE?=
 =?utf-8?B?d0FsWEZsdHFNbEkzcXpWRkR2WURnazVnd2ZiTzJXRGJ2WWRZSk1PUG84azhK?=
 =?utf-8?B?M3MvMXhqR28xZWt2MXRrcXNRajk3Z1pMWlZkb1ZETUpMTEtFcUtETDhEc1V4?=
 =?utf-8?B?OXdkQzh1SkR5eUdaTXR3MjRSK1BBKzZxd0NFWjBHVjFRNGM5eXcxemRVMDls?=
 =?utf-8?B?RXhBYlEvMUQvTk1JdnhsYlFxZ05ncFE0OE1TNHNCUXlDQnVsR3RIcUUvR2V0?=
 =?utf-8?B?RCtaV2lJR3NLMVJ5NXNXaXp0ZWpJcHA1R3cyTnZCemZtSkh4VVZPL1FqWkwy?=
 =?utf-8?B?N0h1RXI2WUtkODFacHVaVjBVb01FSFhkeGRHVm5RNVN2UG8rQmtOTGtvcndX?=
 =?utf-8?B?bDA3ZmtJVlc0L2U4WE4vREhLejg1bTBHY0MyZ2pRTDJBZGFTSHNhLytrakhY?=
 =?utf-8?B?QzdlT0hvNEUzUTA4aXpneEpHSk1USEh2N1N5dmdIZVNOVjNnci94aTRqVXNG?=
 =?utf-8?B?WlRUaGNVRWIzaTIzcnNvTHp6eTNGRkhMcmdCUDRId3ZTWjBjMyszaWJFZjlz?=
 =?utf-8?B?MWpFT0NwTExUODhveWJFbmhvY29xU2tiVWNVT0kzVm94MmF3RVJRdXlLc2dQ?=
 =?utf-8?B?N2wyVUtyRklnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUEzT1FIbXNWY3BLZFhlZnRwZXpRNjdZT01HYWRzSmNsZHV3TVQ4YVp1M3Qv?=
 =?utf-8?B?YzJYa05MbnN2VzNSV1NrMlhTVXJaajRpTXdMWTgwQU5YNkpmK2U2dXNhdWpi?=
 =?utf-8?B?U2NhWVlFVHRwNmZHcVVOK21vUDZza1huTmlWQ3V5c21VTTJ1YnJiYy84WG1u?=
 =?utf-8?B?bkhicXlhdkVWQ0U5UFBCaTRlUUgrNVQ3TUhzMzJuRjhHWmxhYldMRkorMUJk?=
 =?utf-8?B?enpOSHRqTmwwa2JYY3NmU0NDbE52NGJhQ1FUcjliUHMrVWN4K0Y3bXJ3SGE0?=
 =?utf-8?B?UkNnNmJWT2h1Mm9lZHdzbW11eHA1ZC93VjRSc3VUcjNWamN3Sm9mdU9EMnNt?=
 =?utf-8?B?YlNhWk55TTA4MW9kSE9jL2VyVWxWdnFhOTRKeUdaTkg3WStGUVRRWGJadDN1?=
 =?utf-8?B?Z09XZkFtRldmN25CTERyL21EelBKeStLMGhMNEFOeE9tMFZRTnBsaXd2V2hG?=
 =?utf-8?B?czN4cUxoZWFIMjU1cmV5UmNBOFNUTnFuZzd6V3BVSTBMdDZraU5kbW80RHNz?=
 =?utf-8?B?RllJUW1iSlF6SkVjeW50NXNCUXBRcEU2THB5a1R5QUlCc0RIc2Z1VTBvamtY?=
 =?utf-8?B?a1ZuTy9aWk1OVGNmaWhXdU5hcjBXbzM0N3VyTDZJemJqS2wwUE9kNndkY2VO?=
 =?utf-8?B?MXp3UjhWaFZpNW1mbXl2U1BXMmdsTHgxcHpiYlJkOGlhOW9aUWhVVU83cEto?=
 =?utf-8?B?K0FwQnUyVmtwcXpXMDNqNWJNQUJPYVRVOHdMYXAySnEybnRTSk0vRjhTZDc1?=
 =?utf-8?B?eE9RdnNReE9PNHdreGxkRTUraDRkSThZeGRIWDRCaXptK0JyMlBWTjBNRkU5?=
 =?utf-8?B?aW51aFZuTHp0UlBaYmgrT000amRxd1FKa1ZDdUZRYzVOUytuU3BvOEdnU3BQ?=
 =?utf-8?B?ZS8zWmhCeVViVE5wUS9idC9PUEtwTW5UU1I2NmRjcVZteGZEaXUrUUNRT1gv?=
 =?utf-8?B?ZFBwVU9OTzNyd0I5dGZoZHdvVWNMTlNrMVIwQlR4TjlOTHA3VUM4Y0VVSmMv?=
 =?utf-8?B?c2p5TjU5MTJSR3BvU1JZNldjV1RFbjJWaHFGT2QrcFBDUTJ5Znd1djFwcmNv?=
 =?utf-8?B?LzVPZHFTbkovSWtCZk9TU1hieTdLSUxwVGpuR3pONDJHR2ZiYnpIZEMzempK?=
 =?utf-8?B?ZVFRMDBCSmh5UzdsZ2tmeXdWbEpDMUdoWmVaelpEWFNvVVhlU3EzT1ZYZExZ?=
 =?utf-8?B?bHErUWVBT1lidHhML3JMYWVkN1RJTnFidGhZaE9XN1JGSGlRK2xpWmV1Qi9Q?=
 =?utf-8?B?QlBsOGJocEFUMjBpc1FMdVd3TkdKeFhFd1JLYWFpYUlwOGs2V1Z1VU9hTTdj?=
 =?utf-8?B?eUczZUtjeEI1T1A4VC9JMlZ2YzZ5R3htNzdlMTZRTk9VN29BV1ZtZFR6Y09M?=
 =?utf-8?B?KzQvNmtYbHd5cUZPQUZJYnpHT3dPenVCRHZDb1RhT2JGVzBuMG12OU5WTzJ4?=
 =?utf-8?B?eEhlbGJTY0tVSG95UEtKSDdIN0JtL2tzWE4xTGhidUpLV2dHd3ZnaDRVNnlK?=
 =?utf-8?B?cFRrdFBSaEpMNU9YU2hiR3pVYkFxeTFtd0RSTk1yenphT2ZIMUc2TlZMQ3dH?=
 =?utf-8?B?NkhWU3VwMFcwQWc1NytwaXB0d3ZzblQ1QjhobE9yR09kNWh6L0dlUW9SNmJv?=
 =?utf-8?B?SFhaUHV0ekpTcm1pMitmVkFFd0pwRjNZTUNUN2M3Zm5RTWpQSm5MZmxGQWk0?=
 =?utf-8?B?NTVoWjVod0FZVVlBWWQzTXRrRGFNNEI5aGJpM0VwMmlUZVlFV0poSWhJWFhP?=
 =?utf-8?B?eC8wa2dCUmQxdlV1MDQ4ZFdxeTBHYmtNc1c2UXorTE9HenFQekFBQmtzZm1L?=
 =?utf-8?B?bmtha0xUbWdBeit2VVB1MmxpemdHR1U0aFdkV3d4cmV5bDJvczhBNHM2VmQ1?=
 =?utf-8?B?UTBqRTJUSWRZUWFXdWJTV3RhMmZCSjlPa0I2S290SitxN2wyOEZKOXIybWcy?=
 =?utf-8?B?MmtmOG5nY3Z1U0NUaWtxWjhsUjl4VE44cUJ2K0NBY3BudHgrdTlZTmFmakRz?=
 =?utf-8?B?a3Q3MWpzY2lZc0psTTNaR0ZTcG9IRmUvUWl6eHlhdzR1QVluakFwcUR1QXJB?=
 =?utf-8?B?QXdUQjBibFd3SWJ6VjlXUnRJNS9YRXFTQlRVYVlkTGhmSnVXS3NwajNiMG10?=
 =?utf-8?B?Qm5SL2Q2MDJ5dW5ITmxDcElPZWIzT0dTVHFDMjRENnZjKysvV2paUXVQaWE3?=
 =?utf-8?Q?YLPd122VLC2OE0yg/ksWG1XbA1Kb3/zwi0GUVyA9pdKQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a3d1a0-3250-4af9-e542-08de3271698d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:39:41.8292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWxOq39cIZIpti0pDm0dxzrMaFpKNxti9zmUlx3VrvnW/oJvVQ7fDHjmTLVSsT/1wWMgJEcrHx1EKlqlT+SdrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7324
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

On Wed Dec 3, 2025 at 9:03 PM JST, Alice Ryhl wrote:
> On Wed, Dec 03, 2025 at 08:54:31PM +0900, Alexandre Courbot wrote:
>> On Tue Dec 2, 2025 at 8:25 AM JST, Timur Tabi wrote:
>> > On Wed, 2025-11-19 at 12:36 +0900, Alexandre Courbot wrote:
>> >> You can use the `Alignment` type here, as the rest of the code does:
>> >>=20
>> >> =C2=A0=C2=A0=C2=A0 let size =3D num::usize_as_u64(obj.size())
>> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .align_up(Alignment::new::=
<GSP_PAGE_SIZE>())?;
>> >>=20
>> >> Now `align_up` returns an error in case of overflow, that we will nee=
d
>> >> to pass down to the caller by changing the return type of `new`. It i=
s a
>> >> bit annoying, but better than the behavior of `next_mutiple_of` in su=
ch
>> >> a case, which is to panic. :)
>> >
>> > I see your point, but these are u64s that we're talking about.  The on=
ly way next_mutiple_of() can
>> > panic is if obj.size() is greater than 0xFFFFFFFFFFFFF000, which is no=
t possible. =20
>> >
>> > I would say in this case, a panic is preferable to a convoluted error =
return that will never be
>> > exercised, because failure here indicates a coding error, not an input=
 error.
>>=20
>> The input data is a usize, so technically we could get an input that
>> triggers that error.
>>=20
>> I know it's a very edge case, and clearly indicates a bug, but the
>> general rule is: don't panic the kernel. And in Rust, if possible, don't
>> even let me compiler insert panic-handling code. If you don't want to
>> change the return type of the method, then maybe use `unwrap_or` and
>> `inspect_err` to print an error before returning e.g. `0`.
>>=20
>> But others have already thought "naah, that's never gonna happen" and
>> got burnt very publicly [1], so let's learn from that. :P
>>=20
>> [1] https://blog.cloudflare.com/18-november-2025-outage/
>
> For what it's worth, my friend at Cloudflare tells me they would have
> failed in the same way had they used ? instead of unwrap.

Complex software stacks tend to do that. :)

In the current case though, returning an error would just make the GPU
probe fail, which sounds like a more acceptable proposition.
