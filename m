Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51000C69874
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 14:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B8A10E49D;
	Tue, 18 Nov 2025 13:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NJUGY2Iu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E1710E49D;
 Tue, 18 Nov 2025 13:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYYfl6eTI5R7AaeMZF/rfCdLQMJZwaBTMj3xKJu08queCajgXWcUYLYXkeIVOIs55+kizc4GkBWSWykMneW9pfeEBsQxyjNW2TGXoUpX0AyIeJkNSjINa0+ierOhIXKOgD2bMRUAl8kVgujdf/jdnblqsC7AedZs0Hwb+08JI3P2Aec3b6ZxYZNmcW3VIOktYgNDQnTtFVPj/BZNM+RMfwC0nvnu1HcXWyXddN12b+281FBd7R9p/ofeyLFyWZVPLSv8QZCOolU7dizW41RkkE7NnumoF1y9dFhLA4r6j8QfOddpkazAbkU3T8EzJ3d0VFCqcuOIB9WabzP8LStdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRnTJxtlyTltC47iYGTeTURQeUToBMV73Y8vf5uvb60=;
 b=w8dEnYmN53hH+01qB8RW9QyIVEtCXnfeJ6PniAz9xGiw00oXR/x9p8N6t6nC+PrxIIgYE+zHKlGSK4l5uz3xe5dUdDrYkJvCYWClsUFVhaoV2Elq/VtxJ2c6N/5+dDwaBTtXMNI/YjdBVncLP+qT7RCzQtNBKekM0BAkgIcXBL5/xdsIv4fyDcRSPESF9aC9CxVn/Mc3I9MRXLO65cL+5WxesQK8SzJFHHvbJ5NnU+5hRTU99WfFmJpknlp/zNs8rSe1CTCE6hVYQ6WjEMEZMMDpn07YPeeSDBH5w0eGmCLXdGTE+xSETQd+C6V2Epl4mpST5Crs/ic7fHnWpKDsZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRnTJxtlyTltC47iYGTeTURQeUToBMV73Y8vf5uvb60=;
 b=NJUGY2Iur6ImewktNLiu0Mzz+EU50nXFoj/uIqr2Mk16o6tLHr85O1jqn2rb+IUK7S8ju7Q16LmM/2QbIr4AGZsa3YViOOs0U/mAZFN+77C6I9VhGeTub7VeeqfXGYYHSF2AXM1LVgcWyVrXX6+IEskCy3uao59q3Vel80ng+YT/MBYdHNccCMB4jViHwkNqIKQTRd9zWjGEdkNVXH5c1pbGnuXTllcybwmbfnteQq0ekMpUK9WaGlckY/iIZ1UllqYXn/WxtKbQjQ6l+kENSLu/9W6TocH0SUw5H1P+QmZv6SG58m39HhNzdcFKHqdOsLpV4K5zf/MVe4c2SqXeLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 13:04:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 13:04:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 22:04:54 +0900
Message-Id: <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2>
In-Reply-To: <20251117231028.GA1095236@joelbox2>
X-ClientProxiedBy: TY4PR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6b9e0d-8959-48ee-9cd2-08de26a3134c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUZRVjh5Q25ONHZ2SnF2NkFYak1Xd0V5cnhzS0RRNlkwRzk1b0piTVpiVjdH?=
 =?utf-8?B?ajZteFJINEoyUkZYVDRRV09LV3FsSDFFbUpYRXFzQ0xwSmt1WEx4MWwxTzdy?=
 =?utf-8?B?bTNnSEp3SnZMVHF4RmdDcm5nUkZNb1dETXVmaGE5azJDOExzRXdGTFVncFBq?=
 =?utf-8?B?WG52eFdxRTY1SWp6cWtFZUFDMkFlYXgxQzljVlFtd3EvQW5VbzBEMGVsQjk5?=
 =?utf-8?B?dXg1N0FsSDdtUDBhWVIyZ1gwcDZZbk5CemZSRi82UExqSGJzV1NGdFVBSUhV?=
 =?utf-8?B?UDNwUXVWR1Z3TC9UVldnVjIwRktlZWh5NmZ0d01ENEFTM1dVaVppN0gwa0ZR?=
 =?utf-8?B?OHlTSEZFdTIvL1cxWE84U05FZVVhK3RZRTJjM3dGK09wRzZFQ09uLzNOVms4?=
 =?utf-8?B?NDRZTWpURmtlWEprN0JSSlh2akttYWVjazYwcDRjeHhLaG9wazdRVElQSUpZ?=
 =?utf-8?B?QUpWcm1HOEJRVVFNdkUxNDFySUdPN0haU2lQSXB2MkRJelVQcVJEK3BjZS9T?=
 =?utf-8?B?S0t3VEdybVhCMmpPV0lFc2dOaEhpQnpuTHppems3ek9JOU0zcVhVWDNGQW1q?=
 =?utf-8?B?Qk5kZHF5cTVkcklPdUpDVUpqNGFqZ3p4VTlpN2FYK2lzc05JUjVrYm1rNTl3?=
 =?utf-8?B?cWJQakk1bVZlaG81Ymt5cDdtQm02R3hDUjlLaTB5c09xa0RhcHF3b1lwQ2hW?=
 =?utf-8?B?YVBrS1MwdGNwaURBNW0zejljcjRsaEF3N3hkejlQblBmcmJNckg0Nm94N0lm?=
 =?utf-8?B?Vm5VUFFQaklsdnF0VlYzV0doY0xXcXVhSmI4elZLcWxyNFp3bi9ycW9HRlFU?=
 =?utf-8?B?Y0lxdGpGY3dPVm4vdko2a2VSNUNJM2s4eXE1bURpeENmayttTm94cHIxK1VJ?=
 =?utf-8?B?Vi9BMEtyTFY3NkIrc1E1TWJTS0hqSzdCb3F4RTFQcWYzRVdrQjlHRjFSU0gz?=
 =?utf-8?B?UXlYV3JQUjUrVEJOZ2hTbEVUelNqclRITlZiU0pHc3VLbjNNcW10V3lETEhy?=
 =?utf-8?B?OEdURlJ0VlNoZ3plQ1k2V1NDb3VIZ0J6NThEYTF4Lzd4cWlqS2I3WisyK212?=
 =?utf-8?B?VzdlUEVtRWVUcHNJcmJSd3l5aXorUUdYN0NFYSt2S083ejV4aDl5WHJxalpt?=
 =?utf-8?B?cVFCbDArcG5GcExmeWprVFQ4MEdJOXl4SUpISnF1c0gwd21SOUdFOXdSZHlF?=
 =?utf-8?B?a0ttU1ZVeHU4WURLOHliWmpTK1FhcmswcjlldnVOangydXJGNHRrMXRQQ3Er?=
 =?utf-8?B?TzhKS21wWDdGaGtONTlpSk1uK0k3RHlzZFMzb0dPcjZ5R1JOQTd6SmJrcDRr?=
 =?utf-8?B?UXZnQ1lscEp2TGpWcEExTW5ub0IzRlFNWE9tNUVJSXZMWUZUMzFYQzJhQ3or?=
 =?utf-8?B?dVlyNHZuWlgxWEFpWlNvKzZTcDdPTGJhNTZENWxQVnA1SFBISW41SGx5d1hB?=
 =?utf-8?B?K2NEcmxQTVNXZGpiNHhUZUszSmV1bXN5S0RxaWdhSForcCtNMDZQc3Z0MTIw?=
 =?utf-8?B?UEppSDdseUZFUk0vKzdyd1Y5RExkVHdTSWlEeDNnS3B0b1NtU291MCtCVTlu?=
 =?utf-8?B?SDRKM2xpdzMyeFlFMGhGaU5hbGxTcEJwZk5KcHRKdUpwaitrbGNhcVRXaFJn?=
 =?utf-8?B?ZU1URlJpbVR1bGhwYW8wV3NJR2I5L3kzYk5KbXJORVJqbFdYdzljc2FNcUhF?=
 =?utf-8?B?UUl2SjBCb0JtVjR0T3RSLytDZnpCaDFwTGdBWDFia1E4RHYwdm11MFR6R0FB?=
 =?utf-8?B?MHdoRWlGQ2NGdjN1VTVRNHEvbjRZMlV2Ykh6bzcrL2dvMDk2cS9FaXc4VmJX?=
 =?utf-8?B?V2JTMWhBNnF4ekhhd2tCTW9FTkJkeEYxNXZKeWJxbk41YnBxVVlBZ3JPZElR?=
 =?utf-8?B?YWduTUVjS1BRODJmK2U3NUVYV1pKZ0lYTUt2a1hIM1FBdk9NR3k1K1hDa1Mr?=
 =?utf-8?Q?nJCrnKtjVeh973rkE8UOO5NwWK+uhDcH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXlsNkNBK1djYW1iNlVWY09mTHE5T2ZRWk1WbmhCNGhVL0Nlc3Q3eU91bGNP?=
 =?utf-8?B?UjJaR3NzakpqQ1crdnRnbk93OHZzK0hKYjZIb1hhOS9tZFNuZk9rS1FEMUFN?=
 =?utf-8?B?YjduOGk1b3cyQnFOQW5hOTN1TVM2OHc4YVpqSVlkZ1EwZGdXbFhWUmJQSW50?=
 =?utf-8?B?aEVxc25KcEdWQ1J5VEF4bnh2K2VKWEdady84ckRYdURDYkNzOGlNNFN0QTBw?=
 =?utf-8?B?ZEJzRy9wSytpUlQ2d3ZVZG9qSmRSNDg3SERUZHZsVXBjNXMyYzRzZUc1cDlD?=
 =?utf-8?B?TGY1a01KaGhxV3RHOXIrYnhZdVhsNnBJdzNQUFRjazhvNkNIUExzY3RnK2Vx?=
 =?utf-8?B?MHVESCs0aytvOUcyMWY4T2ZlSU8xeGpNYjJkRzV3RHFmaFQzWUZxemhvb0dV?=
 =?utf-8?B?dVcycExlMDhrM054QmhETWQ1WEcxVGJpeW51UlYxMlZzVDgvcVZRVWdrR1hx?=
 =?utf-8?B?WkxVVVNuSUcyeGt0akFtOVRJVjUvWUZSbytZS1hXWFNFSEZUYjZtZmhMSFUy?=
 =?utf-8?B?NUUzdlVFTUd5QU95di82MWNNRmo5L0ZZSDZEbnBicGttakZyZ3VKaFhveVAz?=
 =?utf-8?B?WEhBSWxncy9nek5DeFArQWhiMkxNTkI1TThqUGYwQlE0QUoyQW1xSlExdlZN?=
 =?utf-8?B?UDNWVzhoS2F4Z0toRE9idi9LVkYwemExRER6VFhLdVJvVjZ5bERzOXVFQXdD?=
 =?utf-8?B?VGtybWtMZkFra1E1R3JscThPeC83aGZkcytYNjVzTmZ0Vmt6ejhuaW9LVmFH?=
 =?utf-8?B?bE1qeXFhdnJGMTh4RW5FVmdveUw3NGJtSUd6TnM1cWZsQk1XandvWU9LeXJi?=
 =?utf-8?B?RFAyNllKVzY4RUdBOW1ZcjZDaHo2K040OVlON2pUN0ltdnZmaGpBRGVvVEY0?=
 =?utf-8?B?Nkp1a2tmT21mUUJqRis0eVNBOHdVVWxvN2RPY0Z3UHpUTnIzamMyRnhDR3g0?=
 =?utf-8?B?cllpSGtvY3hoYjJzNFVmdmZiMzF5VTBrdGpLT2lwK09KMnpUb25rM2Vnbit4?=
 =?utf-8?B?Z1RPellFSENnR21LRWlFVmVIdGFSamNudzFCRFppVVFHSXpUU0w5SlpCRnBi?=
 =?utf-8?B?UVpGYytac0ZKSjA2NEh4c0hOUFFwQjVjdm1KRXBOMmdWTEg2U2Fpd2VRODdo?=
 =?utf-8?B?eWdrYmw3VVlFU0tLZ015YnBSWSt1bzk0TmNFSTVqZ3NLN05sbStmZFZDZnVI?=
 =?utf-8?B?OXJCYWhqT0JBZVN2Z1ZuMlNmTW00L3lESnlnTk40VVR0RmpyT0VYZCtFaUxi?=
 =?utf-8?B?MXV0aExIN3M5Nkc2NVVoVHVCdjYwZEZrMzE3YWVNVmFFTnZ3Z01QVlF0S21Y?=
 =?utf-8?B?OGg1VWxqQlhkT2k1Z2lYU1JUZWIvS2VTc0x4bmt1ODBYQmYwL3FEODdzZWFw?=
 =?utf-8?B?ZUZLZHVOdVMydTlZeUYxdmJvZ0pmN05MamtJcktLcmtOYjhzK2xHcENnMjd2?=
 =?utf-8?B?bDgwY3ZjaTRHSzFhREN6L0wyODlrYmIxWi8wcHR2YVdQTG5HY2k0VjBmRnNJ?=
 =?utf-8?B?WWJNVmtKL1pFQXllcUYwOGdadzFWdkVPSyt0SkdYYzQ2anJTclZWdGJuSE9C?=
 =?utf-8?B?elVnck8raFNJbEpWWDVkazZMdDFIZE54b0pmT3RNVGgwUEhhOVVHbHBpcnB1?=
 =?utf-8?B?c1pUUUFqeUxBVFNQN3RmQ2VOVUJWdzZCdy9oeWpXNGt2LytnMDBkWEF1WmhR?=
 =?utf-8?B?WTZwNzhUeDJzWkZMM3N1NFdCZ1k1d1c2Z2FQL25TVWcxbG5UY3F2cHd3T0tL?=
 =?utf-8?B?VUY5dUs5elg3VERNenVOTVBqKzNueEtQY3FhM3hreEphbmJTS2dzV01kM2Rr?=
 =?utf-8?B?YW5HR2FKQVRrOTJORHdkaG84RFhMMWRPYm05bXlrbjRPR09GTXo4L0VpM2do?=
 =?utf-8?B?b1o2SzlNNHd6MDlKMHJLZThRbld0Zkovd0g0bWFFWlBDeWFsUjRlbE0vYytu?=
 =?utf-8?B?eFk5ZDJQVUU1UkRkT2dQOG9qbUlyRjA0UVZhTklxQ1NwVjNtaHpoZkRjSEkr?=
 =?utf-8?B?NEU5VCtOaTBkajVEQzEyK1ZwQ3NRM3pmbTdMaGoreXd6U2dCdzFKYVBtZGRm?=
 =?utf-8?B?WUY1MWIzNXc4VFpiSi9SOTN2a1lmamFNMmlOUHdFWkFOV1FMTzQvZlNyWGIv?=
 =?utf-8?B?a3U0ZVFDaEM3NlBNWVlrL2hlU2kxR3dPbnlybkxzUjBVRk54UnBMU0FNYzVq?=
 =?utf-8?Q?b8Ljadr/i8YmuUr4Lo8LqSGphVEZ40NM1YtBdAG8oElr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6b9e0d-8959-48ee-9cd2-08de26a3134c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:04:58.4330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+8IqBRMk7oKGNk2ujt747rBgKK/VphQU3oifOkTbfnmUMoL0Ot0HTlJEEXPARrugsI+m6/dpiNwV+Jw61Qc4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464
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

On Tue Nov 18, 2025 at 8:10 AM JST, Joel Fernandes wrote:
> On Fri, Nov 14, 2025 at 05:30:42PM -0600, Timur Tabi wrote:
>> The FRTS firmware in Turing and GA100 VBIOS has an older header
>> format (v2 instead of v3).  To support both v2 and v3 at runtime,
>> add the FalconUCodeDescV2 struct, and update code that references
>> the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
>> encapsulates both.
>>=20
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs       | 108 +++++++++++++++++++++++-
>>  drivers/gpu/nova-core/firmware/fwsec.rs |  72 ++++++++++------
>>  drivers/gpu/nova-core/vbios.rs          |  74 ++++++++++------
>>  3 files changed, 202 insertions(+), 52 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/f=
irmware.rs
>> index 2d2008b33fb4..5ca5bf1fb610 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -43,6 +43,43 @@ fn request_firmware(
>>          .and_then(|path| firmware::Firmware::request(&path, dev))
>>  }
>> =20
>> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
>> +#[repr(C)]
>> +#[derive(Debug, Clone)]
>> +pub(crate) struct FalconUCodeDescV2 {
>> +    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in O=
penRM.
>> +    hdr: u32,
>> +    /// Stored size of the ucode after the header, compressed or uncomp=
ressed
>> +    stored_size: u32,
>> +    /// Uncompressed size of the ucode.  If store_size =3D=3D uncompres=
sed_size, then the ucode
>> +    /// is not compressed.
>> +    pub(crate) uncompressed_size: u32,
>> +    /// Code entry point
>> +    pub(crate) virtual_entry: u32,
>> +    /// Offset after the code segment at which the Application Interfac=
e Table headers are located.
>> +    pub(crate) interface_offset: u32,
>> +    /// Base address at which to load the code segment into 'IMEM'.
>> +    pub(crate) imem_phys_base: u32,
>> +    /// Size in bytes of the code to copy into 'IMEM'.
>> +    pub(crate) imem_load_size: u32,
>> +    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should st=
art.
>> +    pub(crate) imem_virt_base: u32,
>> +    /// Virtual address of secure IMEM segment.
>> +    pub(crate) imem_sec_base: u32,
>> +    /// Size of secure IMEM segment.
>> +    pub(crate) imem_sec_size: u32,
>> +    /// Offset into stored (uncompressed) image at which DMEM begins.
>> +    pub(crate) dmem_offset: u32,
>> +    /// Base address at which to load the data segment into 'DMEM'.
>> +    pub(crate) dmem_phys_base: u32,
>> +    /// Size in bytes of the data to copy into 'DMEM'.
>> +    pub(crate) dmem_load_size: u32,
>> +    /// "Alternate" Size of data to load into IMEM.
>> +    pub(crate) alt_imem_load_size: u32,
>> +    /// "Alternate" Size of data to load into DMEM.
>> +    pub(crate) alt_dmem_load_size: u32,
>> +}
>> +
>>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>>  #[repr(C)]
>>  #[derive(Debug, Clone)]
>> @@ -76,13 +113,80 @@ pub(crate) struct FalconUCodeDescV3 {
>>      _reserved: u16,
>>  }
>> =20
>> -impl FalconUCodeDescV3 {
>> +#[derive(Debug, Clone)]
>> +pub(crate) enum FalconUCodeDesc {
>> +    V2(FalconUCodeDescV2),
>> +    V3(FalconUCodeDescV3),
>> +}
>> +
>> +impl FalconUCodeDesc {
>>      /// Returns the size in bytes of the header.
>>      pub(crate) fn size(&self) -> usize {
>> +        let hdr =3D match self {
>> +            FalconUCodeDesc::V2(v2) =3D> v2.hdr,
>> +            FalconUCodeDesc::V3(v3) =3D> v3.hdr,
>> +        };
>> +
>>          const HDR_SIZE_SHIFT: u32 =3D 16;
>>          const HDR_SIZE_MASK: u32 =3D 0xffff0000;
>> +        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
>> +    }
>> +
>> +    pub(crate) fn imem_load_size(&self) -> u32 {
>> +        match self {
>> +            FalconUCodeDesc::V2(v2) =3D> v2.imem_load_size,
>> +            FalconUCodeDesc::V3(v3) =3D> v3.imem_load_size,
>> +        }
>> +    }
>
>
> This looks like the perfect use case for a trait object. You can define a
> trait, make both descriptors implement the trait and get rid of a lot of =
the
> match statements:
>
> // First define trait
> pub(crate) trait FalconUCodeDescriptor {
>     fn imem_load_size(&self) -> u32;
>     fn dmem_load_size(&self) -> u32;
>     fn engine_id_mask(&self) -> u16; // V3-only field, V2 returns 0
>     ...
> }
>
> // Implement trait for both versions
> impl FalconUCodeDescriptor for FalconUCodeDescV2 {
>     fn imem_load_size(&self) -> u32 { self.imem_load_size }
>     fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
>     fn engine_id_mask(&self) -> u16 { 0 } // V2 doesn't have this field
>     ...
> }
>
> impl FalconUCodeDescriptor for FalconUCodeDescV3 {
>     fn imem_load_size(&self) -> u32 { self.imem_load_size }
>     fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
>     fn engine_id_mask(&self) -> u16 { self.engine_id_mask }
>     ...
> }
>
> // Keep the same enum. If you want to get rid of the enum, you'll need Bo=
x,
> // but then that requires allocation.
> pub(crate) enum FalconUCodeDesc {
>     V2(FalconUCodeDescV2),
>     V3(FalconUCodeDescV3),
> }
>
> impl FalconUCodeDesc {
>     // Return trait object, the only match needed.
>     pub(crate) fn as_descriptor(&self) -> &dyn FalconUCodeDescriptor {
>         match self {
>             FalconUCodeDesc::V2(v2) =3D> v2,
>             FalconUCodeDesc::V3(v3) =3D> v3,
>         }
>     }
>
>     // delegate to trait, no match statements!
>     pub(crate) fn imem_load_size(&self) -> u32 {
>         self.as_descriptor().imem_load_size()
>     }
>
>     pub(crate) fn dmem_load_size(&self) -> u32 {
>         self.as_descriptor().dmem_load_size()
>     }
> }
>
> // Usage example - no more match statements needed!
> impl FalconLoadParams for FwsecFirmware {
>     fn dmem_load_params(&self) -> FalconLoadTarget {
>         FalconLoadTarget {
>             src_start: 0,
>             dst_start: 0,
>             len: self.desc.dmem_load_size(),
>         }
>     }
> }

On principle, I tend to agree. In practice, we will probably never have
more than these two variants, so we need to balance the benefit of a
trait against the overhead of defining it in the first place (there are
quite a few methods in there).

Trait objects come with their own complications, i.e. you need to store
them on the heap if you need more than a short-lived reference - but in
our case the short-lived reference should be what we need anyway.
