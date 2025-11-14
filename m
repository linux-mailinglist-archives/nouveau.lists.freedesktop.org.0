Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB889C5AF60
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 02:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7310E21D;
	Fri, 14 Nov 2025 01:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FWVy3XsW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013043.outbound.protection.outlook.com
 [40.93.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9C710E21D;
 Fri, 14 Nov 2025 01:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AI2PCYbU2w98s1jgdoKoYR5bdmVw7bWHhvNFWhD1bLhZmm6mvVzklenWfsu3S0n9HHBWYEdFI5WIr0R3tz6Nm0xgCcrpQ9U7O0F8jNii8Ro0gYIkKEtWBRPmYlMZkFa4vGE3vYugv7dQ+loZHVgmHHqFpyhkprPaA1KHQlBvBMVgIssT6HY8KG5dUjWI+mWAyzuQkloVrz+KaPl2nM+kusuJW9qbbRYr94b0izG6ToBZDeOwUdxjtZAzO2NMxaePz5S6g9rjbgojbXinpi32G2GcGojjIWOEoh7VBBOxpx+h4liBMJbYDiNspuGcirW9I7wNuokwUD8rkKe/0ko6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWxKbRtaeDPDXrCnlVe9vLRFnRXDAYNcI9ht7QKcV+o=;
 b=WuwlxnUNWT42B+9x+Z1DvZChBL+ZDn3xyB0+5CgSqbu3Yg6Ey9n0OjONqrBX1lUZGHSRE0DS1MoXrmO5pVgOCOQV+VFYnyauM4VLh9H0dUgl39BGgu+RqJY7mul7nzvRBXkK2Mdn2d8Gm801cMv96jWQSP1oUcf2PswHYEnYzd0m/TE19slC+Zv9h7ASz7nVnsLQhlSgyBCtOuhDyJi7IDwzFA1hhOmz2Op8Nxam/+pZ4jaQIv5I3sYjjlw11XliiuH89g3q45nSlcML35JjabAhUSVXoQqMb3Z33u+I6f+4iWxttnViLRDBCrFa0QCK5xNZiHN1pEgwITXKbm9JXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWxKbRtaeDPDXrCnlVe9vLRFnRXDAYNcI9ht7QKcV+o=;
 b=FWVy3XsWwGUxsU13DAEIKZKrHfeP5keq6gRsVOBny7CS28fdGR2UaDPu3amzgQo5D1Wnwc8Hxyx73nGN5qzZhFeBbXciunI9K0KDN2FMU7dHhD+khNHysPBSt7ftE7SQTMfgAb5BmuhwmH+pZvvIn5gaGaIT5i5H/UXirguTZjaWREh4OGiGVykNEuCQ90DuYJrAivlw8nN2B7Zau7X9eGs8N3esDby9hkPEwEPMcEc30m2knDbAcWN5D+FwdobJkXPozqPR7JeOmyWNGFcCq96e1vS3dkCt63piYC0X8tB6kCKVDlX1HQJQvJI72OCbDqYYyVDINtye+Orjw9tdqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5754.namprd12.prod.outlook.com (2603:10b6:208:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 01:55:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:55:24 +0000
Message-ID: <b7d1f702-e53c-4d20-900b-a49f634afb1b@nvidia.com>
Date: Thu, 13 Nov 2025 17:54:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251112043000.83071-1-jhubbard@nvidia.com>
 <20251112043000.83071-5-jhubbard@nvidia.com>
 <DE7ESLFYKP2I.MD5ABO05Q2O7@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE7ESLFYKP2I.MD5ABO05Q2O7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: c7255563-ba24-4a87-67cf-08de2320deff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGVRYVJjbHFaaStzVGpIUGkzcHNnOE5Dc2FDdk41Ky92K3VDaU40amdrc2dB?=
 =?utf-8?B?NnNhL0tWYzVFNWt3YWEwRGY0YThIK2NlTG0zVHdBT0xwdEVHMEl4YnU1MGZ5?=
 =?utf-8?B?UjRVNjlJbmlRd0F6UFdGeGw0a2tQRlgxYUNXL0VkUjBITXhXZFZTSWJpQ2gz?=
 =?utf-8?B?ZVl5TlA0aDltMk5lZUU2aXc0YnRwSjNTekVISktpczZHcTZPRmxnYkxaQ0Q2?=
 =?utf-8?B?Z2hPLytPVUh4WTUvNTJZN2ROSUx0a2RhZjNsV3d5c3dmbUxzcWlaNTJXZnpi?=
 =?utf-8?B?MjF4akNzZ3RzRU5Rcnp0V2VnczNqU3Y0eXd3aWlZQVBTcTB2N1ZzMFdQYmNa?=
 =?utf-8?B?WFN6dTVvK2ZOUy8vL1dOZW1mbWNQS2pOakVkNDVIREFXdkxvWUJWVGwwNkNR?=
 =?utf-8?B?NzNrdEVvcHYxeGQ1S1QrYW1TSkNFQW8wUXQ1Uko4UFhUdTJiakFmS3d4MWtj?=
 =?utf-8?B?S3FrSXM1N3RSU1pxRS9PTVR1TmNZVEE1ZUNwcldvczZHbTRNZTQ2SEZ6cklr?=
 =?utf-8?B?TGxNWCtLa1dKQXBKc0ZHWktBSG5rYnJIODhZNjloODAxWVNiUjRrMG1UWW9o?=
 =?utf-8?B?V25yaXRGeXFnc2pqdGZ6NFIrM3pNUmZ4c05iazROWTlENWZxNGp2Y2FFMUQ4?=
 =?utf-8?B?NUMvNWtKc2RHLzBnV3dTS2RkbWRCRS85Z0pwK3Z2ZGpTVm1GZDZqemNpVkY1?=
 =?utf-8?B?STFFM2dvOTA3S2V0N05kenI3WmZmVWJvd3JkRk5oWkd3dDc3a0lSNHdXTytD?=
 =?utf-8?B?c2FNckFROW1qYzlERHlpVHNCVDcxT01FdlFKME9KM3B3a2tLWklEY1JVL2NE?=
 =?utf-8?B?THFqdlZaV2Rtak5YUU5veUJjcTVTSjRINnZlVndZc2tGUzJiWHFjbS9kNHhR?=
 =?utf-8?B?RzNXNng5aGZmSGNoNWQxazRJVXVnN050dkRrWlhFaTJTZWtpbVAxdkt1dXVX?=
 =?utf-8?B?TDc1cWZwUWJoK1oyQ0VQQysyd1YrYTVWcjhmVDIzQi8xY1RSaWRGM3FHbjFn?=
 =?utf-8?B?V3gxR1RIcEphdTcyMlJJVEdBQlN2MVJWYjNoTlFkQmtHZVB3SkoySk42Q3Ra?=
 =?utf-8?B?bDY2SFoxU3JueTFtYlp4VzY0b0FiVDAwMXJHRW50WlVnc3ZMTkZrZW96UjdG?=
 =?utf-8?B?Z0t3VlM2RGcxenBvL05ZeHptUWdMU0M0cE94aGtQdUtEelR1Q1JQM0djNFFn?=
 =?utf-8?B?cEhUdDRJTnlHbDF6aG1wSmV6ZXZNOXZGSlQxZmFhZ21DVlJSNmV6MVpGRHdu?=
 =?utf-8?B?V2pGaVpudExub1o2aUs5YW11NTRvM0JXazJBZzFkUDBlWmRkM21WVG93QXB4?=
 =?utf-8?B?elhWVDhseTZWaERZVWgvQlB4Q2RwWjMxcHB6SUZVM0d5Yk5NdWdnY2R3bWdX?=
 =?utf-8?B?TDI2NURDa3k5NWswMDlwUHJiUG12VjZlTG9RN1Z4UDNUV294WnhMTEtKRDd3?=
 =?utf-8?B?R3c2Y041T3ZQNGlEdzRXNHB3RWJBclFFR3k5bFo3RXZpMHZocFIxNmlFU01Y?=
 =?utf-8?B?eFdBQXdxM3R2c1owbnNDY3MrOU5VL2FydVFUSHVIcXBJQWJiU3k4ZFRsOEFz?=
 =?utf-8?B?V1RHL2VkMDFDYURTeU90TVVlY3RQZUpnMXR5anBxa2lLWXNXY3p5WmpsZ2la?=
 =?utf-8?B?ZE9YWFBHYWlrdnhnV2kvN1pjMDZraWxYVUdBRWUyTWw0NWNtVjhkM29BcUZy?=
 =?utf-8?B?MSt1blBYem9pVUExdGpqZllBK1VNMmdBd0t2WXg4Y09KaGZJdnUxZG9ENlIw?=
 =?utf-8?B?cEo3WThlTnFFZ2ZqaDRXZFNoV0FYczg3V2VHbVFPWU12Q2ZDd2E5cnlVZU5N?=
 =?utf-8?B?SFhqTmM2c0FxTkx4WkF5dkhOcGFydGNrT3FuRS8vUTdZZUkzVWludGt3V05a?=
 =?utf-8?B?TjY4L1Q2ZER0YVN4L1F4cmo0Q0Fod21CWUxHWC9sQXlQV3RkVGhOSHA3V3Bn?=
 =?utf-8?B?ZzJBajhFU0QveW9XRnF4dmJFWEZUSk9QS256ZjV0aGNiMW8rdDhJYkNNNEIz?=
 =?utf-8?B?bkxzMm9PKzBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEZ3TC9aOVBHazZLdjZONUNCM0srczNZTjZ4U1QvUFFvU0w4UnNDSjV2VmxO?=
 =?utf-8?B?QUV0Q2N1ZFMrQ0FPQTFLa21oVnZQY2dXS3MyZktIclNiYzVEcE5mWk5Ja29E?=
 =?utf-8?B?OThaZWkyaXNManh6d1RVaVdUdFRzQ0JrL1ZpRkszTjlDYWlNZDB3RnN0QmFw?=
 =?utf-8?B?b1lVYVdEMitGNitZNHo4OE52RDltZ25Kd1ZRS1JzVUVEWDhEL0lLb2s1V0pZ?=
 =?utf-8?B?Z1Y0T2UyQVZ6aTR6dElQOEM0eFcvblUrRnJWTDJ6QXhBNUZUREpnQi95Ukxv?=
 =?utf-8?B?UlpnVUJGaUt1TmVBRS9IcXVDelJKR0tFTkdHbjYwbkhBNlB3TEdiNlFQUUE2?=
 =?utf-8?B?UUdZRFViNXdvUFEyenYwbUdzT1lhUWJaUjZoS05wMEUyMEh0WWs1eXlFM21w?=
 =?utf-8?B?bEZvVTBzYllmR0RaeFdhSEtkS1hIYmdyRFBWQWxubkRvMzZQUnREWUQ4eGMz?=
 =?utf-8?B?Sks2akpNdzdsWmUyNHB3QktXdjhJR284ZW04VzM3STJPc0RUREJNWFFqbHBP?=
 =?utf-8?B?QW5MYjRFSWlObktGcUZ3K2pHYnovYWZueVZDckw3YmViTFh0d0JwMktQSHBt?=
 =?utf-8?B?M1RBcm52NVpNa0hGemhqL2hGRFAwNFRqTkd6ajBYbjNiQ3lvOGt2SlRYSHN4?=
 =?utf-8?B?YWpkbWhmYWxacTNiZUcwMHpiaC9KMDBSUEM1YXEyYWg4Rk9rYkdHZEttNFRZ?=
 =?utf-8?B?dU9BTnBaeUNGR3JsV3FtVTB0bWlKWkxjMmYxQkZzdGcxUnAwejEwampLTnlL?=
 =?utf-8?B?MnZDL1FUTFZsRkJDTXNJK0lwRTllZGpwQWNtNVdTeUFXVmZWZjI2Ujk3bHNJ?=
 =?utf-8?B?VTA4MmNGWUdLM1RFMTZLMStCTXp4ejk5RGJHUk9yRkZTTDdiM21xbVBjaTFv?=
 =?utf-8?B?MmhKNmE4QkFPZkdDVjZ6aldKazZNOVZ3U0tCTTBwSEl2NkxQVkhtcEduVS9a?=
 =?utf-8?B?U21ORzQzUWxrTW1xcXMzZG95MlNpdEZjSEZYNEFCMmloa0MvMTBNS1Q1ZzVY?=
 =?utf-8?B?NzZqM3ZSN3NhTDVoYUZhdXdJOHNoTy9hVjJZTFVoQitqalZRRjZaekR0OHJI?=
 =?utf-8?B?eEh5dkJrZzNobUZFMjRoTm1mVE5mb3JHWWdaazRFOE1ueUFXNXBkNTA2N3Vx?=
 =?utf-8?B?M0RGSWljdkJBNkN4REc2cXdtQkVYYVlWK00rNnB4T1lFYTNZcGp3dWN5eTJv?=
 =?utf-8?B?NU1SbmhLTFhYT1J2eHAraG1QR3FuNkhOdE5DMXg5OWIrZGI3TmQ3N2Y1RWpO?=
 =?utf-8?B?SXg3a3pOYkpraGYyMWNhVk5vTVM3VHhLOW5uelpZVDc3UTF2a1Z0UjMxNTZs?=
 =?utf-8?B?dEtNUno0a1U3WUFFMm81QnVLai94NzFSb0l0RmhLcjNEMVAxZXRxd0RqMFly?=
 =?utf-8?B?RDBRdVR6dWtpaEJZSytFb2ZLNEYwMm9qZzhDNHlQemxnK3d0bFhDT1FVSjBR?=
 =?utf-8?B?cUxHR3BvT3kzbHlxYzYvZExTTFpkOThkQ0wzSHZ1V2NhQnFtN0JweGx2c0Vm?=
 =?utf-8?B?RGdxNWlJVEZ3RlY0N24zNTB1WlgvaVVrNXBjVTVRRFlGZmNCcVdxVURWTnht?=
 =?utf-8?B?NEtBcDVuMjN4WDUvNmZwTHZLeHNFc2k5dzF2VUl0cFNjV09QVm84SExaY3p6?=
 =?utf-8?B?MjJWUkp1dVVsQVlrN05sNk1ER3VoeEE4bXpnbXREb2F3V0xRd3FmMExYQzhP?=
 =?utf-8?B?Y0M3R1VvNWhIQXFxRzNqaXMrSHVaUCtuQ25pbnBFeXFHWDRJd3p3T1psVXpR?=
 =?utf-8?B?cGluV01hUXhHb2NhcWtmUHJOdlovZE56aGY0ZkNUMDRGZ2gvVCswWG1ZWXRa?=
 =?utf-8?B?cjRsMEdvSGl2bWQvbkhWRU50TVE4WXFrNGJ5a2ROdUtWcjl4MGM5czlKMnRV?=
 =?utf-8?B?bW5VT0tYRzNDU0s2bzZ4WnBNT0ZicHZsVU5DYys2aXA2d3RZdGNoU0ZlMVRo?=
 =?utf-8?B?RmV6UUp2cVB0OGNsRTlGNHZhK05Pd2VFbGRyOWN6ZktoSytWV3VKdGRNNGtF?=
 =?utf-8?B?VVV4TG44UmxXYVh6VkpaWGgvVm1oKzhqTkQ4bk8reUt2QkJ1RlpUZ1RsQWQ3?=
 =?utf-8?B?YVpBZkRmVVVHdXhBQ1gvdExDU0V0YmNVT05WZ2ZvOHNvcFAyM3Q1aWRaVkJh?=
 =?utf-8?Q?RYFeRv5w/NIZmW0yRfU0oph1Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7255563-ba24-4a87-67cf-08de2320deff
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:55:24.3408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kn6YVmCzuxQn9kk93CGYJ/hmqVDBZ2ugBjvkz8xU61NdTDZvz3Rz7cQfWSdz1J1J308aGRbZlYhCjUWJIBhzDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5754
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

On 11/13/25 12:03 AM, Alexandre Courbot wrote:
> On Wed Nov 12, 2025 at 1:30 PM JST, John Hubbard wrote:
...
>>  impl NV_PMC_BOOT_0 {
>> -    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
>> -    pub(crate) fn architecture(self) -> Result<Architecture> {
>> -        Architecture::try_from(
>> -            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
>> -        )
>> +    pub(crate) fn is_older_than_fermi(self) -> bool {
>> +        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
>> +        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
>> +
>> +        // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
>> +        // GF100, means "older than Fermi".
>> +        self.architecture_1() == 0 && self.architecture_0() < NV_PMC_BOOT_0_ARCHITECTURE_GF100
> 
> We could also keep `architecture` (making it private) and just test for
> `self.architecture < NV_PMC_BOOT_0_ARCHITECTURE_GF100`. John, I can do
> that when applying the series if you think that makes sense.
> 
> Considering that the series has been extensively reviewed during the
> previous iterations, I think we can safely apply it for 6.19, so will
> proceed once I have an answer.

Hi Alex,

It turns out that this doesn't work well, because architecture()
returns an Architecture, not a u8, and then we have to map it back
and the whole things looks a lot worse: complexity on the screen
that serves no purpose.

After looking at several approaches, I've come full circle back to
what this patch has.


thanks,
-- 
John Hubbard

