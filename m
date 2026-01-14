Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5DD1C1E8
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 03:23:57 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9790110E5C6;
	Wed, 14 Jan 2026 02:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XurvEstg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8DC8A44CAB;
	Wed, 14 Jan 2026 02:15:24 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768356924;
 b=ldYijiq6zQ628Lr0PVGDolxMTkLpUYUdSk4kb7MujeYZHUjPbiG1ngKG4ugJIGIi0EKx0
 LQ9HZ7CkzVfKN+NcBzPiFTrTP/EQ/fQsb23ddgOIX+X98jSl0adWl5wnKuHvB9a3v6A6FXl
 tIZlhalyi2ob9cL5mRJmQ8TCTiyuETMikDinuogzr98SS1zC4k6B6yh43xyoB9anPrcYUQX
 qUu3ugKUGSJrSdG6PQXQUqGIClkTMUqLsBsR1yCEmdnDErtHudta7Nl0VlAXxg4pA5DgtSq
 jId1UkJ0e3mBQxF/QoMHb89wlEHwJ5iVb8uPJmGxvFafdBzfJ+W/FrIBJOfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768356924; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z75rh5uHdZ4aoA8INxypz7TNYK5TmPzV4iscs0NPNtQ=;
 b=FE85xykDLWPAg9faQtlMwoTntBZsIL5oCgTypPxIW3i4C6Z1SH5sP58MrP6+LG3BmL59w
 XiS2pImEhi9A5OSJGuRMF/ZZ1TN+kshlMFIqH73cRBM+RbQEGfkel5Yoz/E4rL1mKqNIP1C
 OmxzJhONw+2nfabxHcrFtyAZb1M9tyMKuiasIrO3eY8QKO9DWrXcrnHAtmFQZXByDWIqglm
 vdWjmF8DxuGZvRPGeKSvqtvZqBkTBZ6zy1yrmrTldPhVN+ztcCyv2h89UApq02d9To4dbom
 FfJB0chfa4wKGYaBxUg+NMmsmUjbWWywmUEtkztrHWmBCgYgwwCeibMyob2A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5769C44BB2
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 02:15:22 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C00F10E5BE
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 02:23:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lK54J9i9I5aRueq78zVLVU+IFHpVemS/ylIkQ/wu5ow9GeOcUJ+8GjVG5QzQf2wmxs1jB307jF/f1gN9jWLg6cKo7niPm3lcdY5TIMSrpqVTquFNinr/H8G63gxeud/JHHwGpoG08FVSXUgdrIVoG+y6sAa/iW3A1+/5i8CS1ZA5p612PsldDOiiDi+o4umv3OTt1KVh0dUkES1nDVsJRQZqLkPu+FiDafrINyrz4HnaeJMXD/qotK9yBfYkKt2gEXBPYFPaxLYJvcwB7nsgR/mYk9CDPlWnHCMLIUfnFYwEwgwiMMkI8UeyZPPPbfUmSpVr7gnpDCDqe3gFUysyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z75rh5uHdZ4aoA8INxypz7TNYK5TmPzV4iscs0NPNtQ=;
 b=SvSunw1Q611NgiIxvpziFLCecgB9p1XZgIZosVahUi0GsbzaGu3hQqELrAyHbeVugXNDACyuJpMRTTTFN0/pGhGU2a84tir+5j9aU+E9W2z6VCHzbWwOh015XTAw7uwrctZBnaVkgUHrcR49ZIqeqCdKjhcogbZqb8NwDGqM1ZZSPMo7euULxHr37Boa8nMfz/2jzX0vJz6+PXghzvBSEbjY5x377RMyCp7Hl8gzHjSEbu7fKCs8yWtgXZDjXUaBO8r2R6G/hiha25OXjJphY/een7rjUivunyQ6rt503uCUOVJktJ3xcfhGVz8jM+R3BRIlIB4fB1IpW6d1svqqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z75rh5uHdZ4aoA8INxypz7TNYK5TmPzV4iscs0NPNtQ=;
 b=XurvEstgKS+2kublfcr29qI1QKLTjnHt1sbRjDWlzs9pi7Mk4chth4dVWB1OUY4AV15w4Ahq+uUkbHOtqtrBucWb5wwgNG1MeQlR5dleDkfI+CfFuoM5ejs/FKynUhQe+AVIOlmdcCCBd3UB4mgZGmyZxl8o9z73njjmA2f+DSx2J5Ztqnvd1uKTK2TFOodM8o8Jpu/Yg9/I8lznFA1ulnDs3IoHPNymjLUbzAFIOgsaP8ovIow9qxFooO7n8/Ac6U/fO0ntBcTzxIF9wT7GxdqwDZqPPXJj61R211YgCoQmapbCaM1DLpRPBJeozYTw78zmkJzUXcSbp/mc+loNAw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Wed, 14 Jan 2026 02:23:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 02:23:27 +0000
Message-ID: <03f705dd-0135-40e8-9003-5d2a626bc439@nvidia.com>
Date: Tue, 13 Jan 2026 18:23:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-2-jhubbard@nvidia.com>
 <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0134.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f14b3d-7941-496b-9ef3-08de5313e68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEtHTUNaUWpaV01GaXllNVdKU3Y1a3NVYWtvU0taN1RJd09Tc0diVWtBSVNu?=
 =?utf-8?B?b1JsUmJiQXNrZWhaY3lUTC9sRmFNWDI5UmRSRGo5YjRpbkU5SWx1K2xqZUpq?=
 =?utf-8?B?aFh1UWhkdVovcUI5eHFBZW42aDlDdVJnbzNDL3lqcDB6bU1Kd0l4VUY4ZlZN?=
 =?utf-8?B?eGY0OGMwblFQY2l4TTFvSTdFMjNuWU5Oc3BhVmRCMjRrZDliQXA2NDN5dUlP?=
 =?utf-8?B?aVNnTVdPUWpXUjQycXBiYndJb1VoYmhYYXIxUG4xV1hjTzEzM3NnMDBMK1N3?=
 =?utf-8?B?VjJ3dDhHQUVERko3allQQk1uQm9RakR3cDJ0eklERXlZZXZiS3AvZFlaSWxG?=
 =?utf-8?B?MkVvbXFwSmNBQ1lZakRhdGo3Szh3bzk5NDZ4VGNobGRGalBDT01jRWFzY0lU?=
 =?utf-8?B?ayt3ejFJbzJJZzQxdEszNG9SdjR4K2NFS216dm9BNFd6dGVUbkpYQUM4WWlS?=
 =?utf-8?B?SlIxU2xuakdVYVNuMUxwYWdYU2ovLzEyU3lZanpVdUtES0RqRlRIN2NUZ1RG?=
 =?utf-8?B?YXhMVnEyRlNJdWdrelh0L1lkbGZ0a0YxbUJGRGJ2UkhYaVI0dHQwV1JvT21Y?=
 =?utf-8?B?TW1MSUl5aHQwSlRvRElsS2hmemxpSFBNMVowWHl4YkU3UTBPM0kwcGJmMWFz?=
 =?utf-8?B?eTZ2SUNOeFdxTWZ0dkRmM0tMbDZPcUJ3cWY4TjdSUXVHMW1MZXhtMzBtZWtE?=
 =?utf-8?B?UlBqOFBPdk4vaWhJTlBOSGppdVRVek5ndldWRG9FcHNhSlh1aGdxbEhDUHBv?=
 =?utf-8?B?OE14bmpmN0JvbmVrd2tjZXZkaWJkOGE2M2ZTR0RYaHZTRUw2YWFPQ2RwMUEx?=
 =?utf-8?B?Mk5JeXVKamxhNTFvakx2MFZOelU5RnI5bDQ4dUxaZ3FMVHZqZUExMHR6VnE5?=
 =?utf-8?B?TjVRK2o0SEFoTW5CSk0rMm55Y00xZFhqMEQyRWhkQTBaY1F5NWgwazRJQWRY?=
 =?utf-8?B?cnN5RUNlZ3lzMi9Hd1RCQ3NKU0UyWGcrZHVXLzg1OVZsVXdjaTcwWWF1VEtR?=
 =?utf-8?B?VWc0Ynk4UWZoKzhmMWl4TUk2SFJTM2ZDOU1LT21rNnduQnBEd0lvWXlXQmtM?=
 =?utf-8?B?aWtDMFBOck5PSXFWRGtnb1VHK3ZDeERTZDdONHkxWHR5Y1dML0dXT2haYTNV?=
 =?utf-8?B?bmFpVjdCaE5zemFMSGUxcFVLb3ZvVUNZSmxPdnNZWHljUXJBejEzeWYzSUR1?=
 =?utf-8?B?dklSZDRMYTZlNGtTeU5mUlFGU3paMUk0eGFXZGtjRUZSbG1OQTkwTlM2c3Jo?=
 =?utf-8?B?ZDlMbW8rVjMveUg2M3JDSXM4Wm1RZXhtNEQvRDFuc21xcTRkZXlRcHI5WWxC?=
 =?utf-8?B?ZjVkM2RNU2lGZFJEUUFqSGdYY0tWaC9wajB6bStrdmFlRkxLNTRWSU14S3BE?=
 =?utf-8?B?ZFV5TDR2OVNlU0VqQjBpR1JySU1FSWJFQ25wbVRRTysxbzVJK1JzQzZlMFBu?=
 =?utf-8?B?M2N0R1J2b3lDWnBndm5xSHJOZXV3ODlMdmlicGdvZnJGa1lLRytvcGlXRFkw?=
 =?utf-8?B?dWlFUElHajVnRm5NTHgxZ1pPbnJ0TCsyZVJZMjAzWkRQc0JyUjBEbWJ5eHBV?=
 =?utf-8?B?b0pTK01QdExGQkcxM1Y0MGw4dDdhRjJOZkNaV0lFeXJPcDdFL3p0ZTNvZWdq?=
 =?utf-8?B?TnQ4Mmc5L205emxDU1lSRmFYcHRRaDRxY09hZnpLMytqQktUMWEvSmNXZFAr?=
 =?utf-8?B?OUx1WVJKV1FjQmJuNTFnRVpwaEZXdnl4SkMzYU9hZTc4am1hb2JuVXdGcTdz?=
 =?utf-8?B?Qm1sRTRjRFdjREhRSW0wTm92T0lpM0xGVHpGN0Z3OTRLVnJLempzOTFFeWFI?=
 =?utf-8?B?MlJTM3g5WldMeUo1dTFRNSsrZ2o4VXBvaGRRWkFFeHRRR1ZVMkEvOU9SYlMz?=
 =?utf-8?B?cEtpQmlSZ2NhWEdGMjhDOG0zVTRmWFlQUXB2dy9YNzVGY0JWcDNyWUpyT1FV?=
 =?utf-8?Q?vREeQ83E9MObfm4zs4xGSkObqXcu8cZ/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzlpZUY0RHhJbGg4TzNZeVJ5MWE1N1E1MVFsK3ZKbllOTE0xZFBKaWJaR1c1?=
 =?utf-8?B?SC9vODFyNUY2OWNTK20zL1NXak40Rnp3SmFjM3lWVE9OTDI5c21YTWdtQ3RQ?=
 =?utf-8?B?U2ZXYzFyTGV1RjB5OUEvWnN4S1FjUU44U2ZsM2pkOG5Rc0tKK3lmd2xkdVhw?=
 =?utf-8?B?cFhpaEJKWXk2bFZYZVpGdVZpK1puWERub0lobCt5dkcyb0hnQkdXV28zVW56?=
 =?utf-8?B?U3lsRWpJZjdiZzdMYVFtaFdaRkVrMVlnU2ZSbVlNTSt5a1ViVlVlSXZHODAz?=
 =?utf-8?B?VzMveVhDMFNINzdObmJ5M2JRSEpOTEE4TThwaktIZU5zaVgzcGhHK1RESy8w?=
 =?utf-8?B?QWFkb0tnbFJMTFhsOHdMOWdhSnhkTFNCMDdLVDFNT2dMeE1QejBqZG9YY3Mv?=
 =?utf-8?B?WDhCSnBKODN2ZGZpejNxYXRXSUZGSXVGVEpjK3hyZ3R1MThieEp0Z1dlWWNO?=
 =?utf-8?B?a0JrMXV6STAzaUQycjQ5RGVSQnI1aVluS2JBdDBBQW5pZFhMZi9nWWJOZDhs?=
 =?utf-8?B?QWp0M1JCWnFGQ25HekFlSU0zNWp0YmlxL040Nzl3TGpIeU5acXNWTTVLOFgr?=
 =?utf-8?B?aVdwY0hTR05QUDV6TzhTM1BDRjAyOHdKYzdCZm1vS3lRRGZYTFNqYk1wNitl?=
 =?utf-8?B?dHdyRmZFMElpZlJWeDFSZ2tFaXNrRGxPRGxLNk1kMjBjajNqRExlUlUrWldx?=
 =?utf-8?B?cVFXcUJ3SU5waTJNckRqNy9jZGJZWWZYbmphOUVSTDllU0hGOUEvdkNwK0RQ?=
 =?utf-8?B?OEQ4cjRlVyt2dkg1amVPb0JJN2k5NEt3VXpFUmJNVWE5MDl2cGxZaXRnclZ5?=
 =?utf-8?B?TStLV0plakdCaUNSNFdEa3BqbDc0N1F0MjhTazlkSXlHZTUrZVdBMDBUL3FP?=
 =?utf-8?B?VjQ0b1Bmd1JBME81RzVpelBWQjVJNGhscUFHVnZsSEJySGE1cUpIdWtSV0Yv?=
 =?utf-8?B?NGFlOEgyYmtNTmpqOEloekdZM2xNcW9jVWFudFNpZHJ5UVJtSk8yNmFZL1N2?=
 =?utf-8?B?NnFwdEg0VGhuV2xReFFZUU1vYXdvTk0ydHNXNjNVVkF6WktIZEVqY0oydjVm?=
 =?utf-8?B?UndIbGsyaXlCYkYrK2dBQUtPUTZDQm1pK21nV3Y2NVFUVGhMbldoZGhmV3pQ?=
 =?utf-8?B?MjMwZlRVSTR2QVVIL3JXU2lDb3FxT1NtN2J4bU5uSTBONmpDT1plMHNzTWVC?=
 =?utf-8?B?ZzY0NlZXeUR3NDd1Y3NRNjhRcFVEOUtRQmJOWkxpR255VkgrdFlORDhiRTBP?=
 =?utf-8?B?c0M3c0liUEJWbU8vaWNjZG9MSXFkYy9aeU1WUHlSWng3SnIvZHB5V0w2QkJW?=
 =?utf-8?B?d3M0VSs3QXpUUVdiNnRXb2RUTHNiZExlY2Rra095SXQwRC9Ha2NMZUd3R0Zk?=
 =?utf-8?B?OHZuR0JYSlpkR21LL3FaVEhTbWpUbk4zMkIvWENzTlp0Q0JYNTk3czdvSGFU?=
 =?utf-8?B?d0dxdWZSajdORDRPeFZjcTFjWEdreXc5UHoxdlhQMEZTdnRmTjBWUlBiR2Jh?=
 =?utf-8?B?a3Ivem5keEFpWTZiU0hNWXBuWU05QjNXSnJnekptSXNPK0x0cU5Ea2ZacFdn?=
 =?utf-8?B?dkpBdHcwdllCeDN0b1hnMk8rNXVnd2M2SFc1aG5XQkp0L0xxWDkvL3JLZ2dz?=
 =?utf-8?B?TE8wa3BVUHJrTm5ySEFoMkhRbm1ycU5nN0YzWTZzeE5mdlh3eWhZVW83U3Jp?=
 =?utf-8?B?aDk0UDlGMXYyWnRndkZqbFBTNEVXZ0hZcUcwYjJ0S1FtQXMyZ2toVkxvUUVq?=
 =?utf-8?B?dDNXRFdWQWVHWFNCakkxYUhTVVgvSkc5b3N5bnhFL3VGOEIybkdqZU1UeUhM?=
 =?utf-8?B?L3JHR1hSM2hSWW41QjltdzZTRjQ0Q3NERFV1QWZUdlF0RkpEL0tCemltTzY0?=
 =?utf-8?B?Y2g0VmwwNm5VbjF1Q1ZpU3hncFhYc0RERWpwT1VtOS9TZWkrYzcrN1ppSnA2?=
 =?utf-8?B?d1FSVlo2alM0bkFNQzY1eWFhL2JEUytFMlFLNnZGLzkxV1YxWVRPdnRmWDJW?=
 =?utf-8?B?dS9VMUR5elhsaHJoZlB6QVNVaEpGS1NQUUZrVjR4OFpmaENieTlQSmw1ZTRP?=
 =?utf-8?B?V1dIYUllYUIvM0o2OGVPTlY4ZEVLVWUvOGxCRGQwcFk0NWhqaEVCa1RQU1lV?=
 =?utf-8?B?cmxvYXUzcm54b3RueGROaTE4amZvcUc5UzJMS2s0OW5OS2dwOG9JcE14SXl2?=
 =?utf-8?B?Z00wcXZLSXJ1UGZsazEzaWt4L0VwMlpFYllnaE9ESERpNGladTRDbTN4UnRD?=
 =?utf-8?B?bk5EazZGRk5ock1MS2RwdVpTWDZRcEVWcW1zN1JKMy9VajVKZEt3VE5wUTJR?=
 =?utf-8?B?VUJNL3MreUVCSGJPSzdtZ1ZlVUt6a2tPakdpMjBLdi9OaG1vUEdyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83f14b3d-7941-496b-9ef3-08de5313e68c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 02:23:27.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 96eZNj7jSHoskWV70XWKzZAuVf+HcnhIuLYx/gvEHeIjgwFvRf3j/rO3MNZmoa0MN5RXTacxl2RR8fTW+pHZJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
Message-ID-Hash: PYY4GCJDRALVKVNZVBNMT4B7IUF3EYNI
X-Message-ID-Hash: PYY4GCJDRALVKVNZVBNMT4B7IUF3EYNI
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
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Gent Binaku <binakugent@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PYY4GCJDRALVKVNZVBNMT4B7IUF3EYNI/>
Archived-At: 
 <https://lore.freedesktop.org/03f705dd-0135-40e8-9003-5d2a626bc439@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/13/26 5:28 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
...
>> +pub(crate) struct FbRange(Range<u64>);
> 
> How useful do you think this is in general? Would it make sense to have a
> dedicated PhysAddrRange type in kernel crate that provides this feature?

Pretty useful. Yes that sounds like a good move. And I see from Miguel's
reply that Gent Binaku (+CC) has a patch that proposes adding a 
PhysAddrRange. I'll go review it in detail.


> 
>> +
>> +impl From<Range<u64>> for FbRange {
>> +    fn from(range: Range<u64>) -> Self {
>> +        Self(range)
>> +    }
>> +}
>> +
>> +impl Deref for FbRange {
>> +    type Target = Range<u64>;
>> +
>> +    fn deref(&self) -> &Self::Target {
>> +        &self.0
>> +    }
>> +}
>> +
>> +impl fmt::Debug for FbRange {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> 
> If you want to make this more generic, you can gate the size printing on
> `f.alternate()`. So if people use `{:?}` to print a compact form of `FbLayout`,
> they get just the range, and if they use `{:#?}` then they also get the sizes.
> 
>> +        let size_mb = (self.0.end - self.0.start) >> 20;
>> +        f.write_fmt(fmt!(
>> +            "{:#x}..{:#x} ({} MB)",

Great idea, that printing choice is extremely nice to have in exactly this situation.

> 
> I would either just use IEC prefix "MiB", or alternatively use the coreutils
> convention and use "M" to represent MiB.

OK.


thanks,
-- 
John Hubbard

