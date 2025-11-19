Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC46C710AB
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 21:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C39810E262;
	Wed, 19 Nov 2025 20:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c2iILIi1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBD010E25F;
 Wed, 19 Nov 2025 20:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsRy0W/3+1pidA2hfXi3VHKIXXM31a6y97s9BENZcHj0PjAfJ9JPMHX0AHXnouwCZAMohkVwmaoTrfRa2/lUxhhTXRSFrouORYtIUADMxirxtnFUv0SsdivhK6YnV82guk7DaEJcDepW+0LKY6idyp30tqzQKuHCkgRVmQdlEys7gxtBZt45fa2CkalVYTj/cuw19CnT3CnXEFmfyujac+/sBsS8Iu2faDJ3RcPLMfrzOfIpWnp6OKHL7p9Swc5gSNh7XCzS3JFugkco9ObzkhgYY4we/t/n3Xn5iLaHWuWJGx9By8iDl6jV8AaGPSd0Cim7QeytYCtdqA0SPXFbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSrvdvnD3eJpPG2Wnr/bSwPOoAqZdNy6+ifSbU9D9RE=;
 b=viNrWrvo9dC94EdWMCi4FVhbur58FK44XNUXko4PNymi5lLC9ruPhDvxfYLjF5me+SvXSGqePo7zJYa2VLDqu10ERzOk7xxzE3ScdaFfrqv8O2LLO2f8x1NyNb+BJAiIwzmwnXmU6ZgEfp5EXEh/8QeBWVWWMX6WbOT2PxgT9AFzlXkMEzvmvix8EOA8AXt435HLdxnD6UUpvirWjB+Xs7SB4ZEadz8kEKCW/qwKkzYeU/mGY3ky4Zzw/F9toI6mQ03wkOsa4qjJkqLhGKQAzIs6aU320r6vRJYM45wRSdox9q1gyWFAGA0QLw7eZMf21vrTCFU5/r3XzxzUV8z3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSrvdvnD3eJpPG2Wnr/bSwPOoAqZdNy6+ifSbU9D9RE=;
 b=c2iILIi1bKhIHGAqTCylN+hI4giJrVQmIhKmXx51tN8YZsufYSEjNAeVtuuIrq3V4v6AZIsHhrALLawtifPG01jf0KgA+7pb/04nxbFklMutI7bvm5F5ZZDmOY9vHMoDOeirk/cZDJxFu4ZDTTL9beg5zq/5cc7rHnWW8dDvc+SMMN2yuAOYsw82J0CrEAZRgk35T0Mme4TT9utBRIbwsn+kgOy5qro3tT/koN/FblPAjhkDuXJbR82nrgqcFv33K55TvCI0XlDUnUyW5P+smWZVNRt/mW6WId3S3b/Hf0Xo2U7GyWZ8i86H3ofa1zgZ6xUEALIERYfLBZhu6DjO0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB9739.namprd12.prod.outlook.com (2603:10b6:208:465::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:34:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:34:56 +0000
Message-ID: <81dc8ea0-3cd9-438c-a74f-e5805211fa38@nvidia.com>
Date: Wed, 19 Nov 2025 15:34:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
 <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
 <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:52c::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c5661c-a5ea-430f-c98f-08de27ab19ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUphSUU0MFFsMnpUVkljdVhDNFF0ZmNlM1hSTlI2NGNvaEIzbzBrVUJhdk1j?=
 =?utf-8?B?aDBicHpEWTRnYVN0SDJEaCsvYVV4U0NiVk1VT25vS01qOFkrMnFtbFA5bnps?=
 =?utf-8?B?OStVM2kyeFQyekhvdkRuOTBBVDFhazJYY3J3ckZFQlUyanhBUzRDMmZKYWww?=
 =?utf-8?B?Q2ZFSzRGb21ScTdvOU5hQmpHMjN3RGdESW1QMU5ON2F1Z29wRHg5MEtTanMx?=
 =?utf-8?B?RzUyREMzMkIxSXFTZDE4MGgvRWZlSHNpR1BwZmM2MTlmZ1hQenJMU0ZrWFNZ?=
 =?utf-8?B?OERFS2RLaVlObVN4NnZORDZDdHBNYW5MM2N3T2Z1TXNUa1hLNlF5SlEyajF6?=
 =?utf-8?B?TG1TbDV4bkFCcmIxenFzM3FzWUNYeC9Fc21ueGdVT2g0YWw0R2dwZytOQUxT?=
 =?utf-8?B?SnhISm5HbEdNdGx5TE1xeXFzOUprTVIyM01PMEdjbWE2by9TRFZMZWF0M0V2?=
 =?utf-8?B?RVovRW5kY3JQOU5RMVZCY0gwWVNHTHorN2JaQlJBVk5KTGE4SytoUk4rSDFW?=
 =?utf-8?B?ZWdteWY0WHRtaCsyZkZqSXZ6QlkrM1lGU1RONzc5cW5iRmNVcU94MXhJcXpu?=
 =?utf-8?B?Y28zdUFUaHhyWEViY1YzWko4REFReHRoMWM4WUNjdnJyOW5XNFBNM1RyRXV4?=
 =?utf-8?B?aktmRlpUc05iaTA1YjR6V202b1FsVHhJdmJlT1pVTzRFMGtvMUpKZUp6cFdR?=
 =?utf-8?B?TXFyTXFCd1VCbzhadGVpdTVWTmxqZUVtczh0ZkhQUHI0QkFETkdDQklJcGk2?=
 =?utf-8?B?bTduaW1sanNWLy9idHBGWU1aN2dTWUNjRE00T1Zwa3hoWVpFVHBBR25zSU5G?=
 =?utf-8?B?dEJ1c3Y4cHNtaWkxL2c3MXd4MHlqRFkrdDZtWWQyOEtVek56WUVpcmV0aFVM?=
 =?utf-8?B?YW1IVEQ3ZExHSDM3azNwbVAySGxZOU9mY3lwM1ZNeUc4TE5vWVhEclhIc21z?=
 =?utf-8?B?YmZ1M28yVFo5N05XV3dKRzVCb0lBN2VmTjZreUVvR1dKcklQNnY4dnIzeGlo?=
 =?utf-8?B?TEE4OC9WVWhPVTRJMlNTSUVJaDJDQnMvWW9UcFVHdjNUOThsdkhsN0NuK2hw?=
 =?utf-8?B?WHlmQ0JUZldjVjNXN3lhM0tXT0hkWXhhT1BXdDRsNHRnQ2VWcDY3SGdPeHlq?=
 =?utf-8?B?MzY0a3VZR3AzbHJSaG0wcjJ2dTZrQ1JKZmNUWWVQNVlGMEZNRHpNWVJEUUh5?=
 =?utf-8?B?SnF5eDJ3aW9RcU1QV3laeXNvcFJhZEVXYkJHaEgySjFEbG1IbEwyOW40TTBn?=
 =?utf-8?B?ZmhZeUVtZGppUUFpYWYrRnArMHB0WTkzZFpWaXVtRWMyQUk4dEEyR3pVQUtM?=
 =?utf-8?B?aU40cDErT0lMb0xMVUpGcXBpeWRraHBIZ0grbDRXcEpoajNkUENmeUtHR0Nx?=
 =?utf-8?B?cjNCT2V2MjFoak1GVGY3QWFEQWdjZmo5VWp5MjBHY0ZYSGpETlVUNitUUlls?=
 =?utf-8?B?UEVmWDIzTnk0SnBqUzlRVEJBU2xIVTZvbml6dDByNFRydTMvQjN2QnZvc3hS?=
 =?utf-8?B?SVNXQXc2SHBnUnQxUFZGaE4wRHR3QUZQSzF1cDNRUWgxVTY5RVRKcXRCZmIz?=
 =?utf-8?B?ZUxUelBxa2M3bG5sZFhmV0V5dldBdW11a3o0RC9CaXZQZ0JkcFpzWCtSb2VM?=
 =?utf-8?B?NmZRckRLUm9pOVBueElGckNpSDRuNnpMWFczd2VDZk9nZmRRYzVxRzdqRkZO?=
 =?utf-8?B?ZWJzMnhDbzhvc0dudzZvcGRzZDJiNEkrVnNNTDVyUTF1Q1BhZFRTb2szQVUr?=
 =?utf-8?B?dGpLdCszRWZvOUVZT3BCT2ZvczRoSUc4Y3hiWkhyNnJHN3JHUGVZLy9yN2hh?=
 =?utf-8?B?MzBzV3F1MStudWlLZmxQemYva3VUQnVTUG1ETlU2eVdhK2hOek8xSGs4Yitx?=
 =?utf-8?B?ZzFvdXlOZldFZmQwZU5EejQvdHVvTGNINWJEZ0NJWU95SEhqL3ArMTlGNHVi?=
 =?utf-8?Q?TaennrSbBWIgwlphFMotDOZr6eTHgixc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?empiY3RIQ2xYQlpUK3lQTnI0Z2dnSzNaZVFOVEg1b05hZjBNWHdKNmw5U2RW?=
 =?utf-8?B?ZG1NNlU5a2YvK0drckRPMFhOSTlrc0ludjBzcWdNa24yNnZHUDlGajZxK1Fq?=
 =?utf-8?B?UkdscjcweXEvbFE1UGVFKzM1V3pmNFdDd3dSQURNSlpyNUZKaktQeE1OQk9l?=
 =?utf-8?B?OGxhZVlXZXBPbXh3eThQd0lQSnVwUGtrdVZ0bDhaakV2MkJIOU9GTm1OMDNR?=
 =?utf-8?B?N3lXcUhqUy8zY050Ni9NK1pBUTY2UThMV04zQzRNV2hnaXZkeG1vMnVmdlNy?=
 =?utf-8?B?eGErZi9IYlJqa0FjQ0M4QWRNY1BuaDlrejc4bXRJM0hGZkcvbytMdlpiQ29v?=
 =?utf-8?B?cEVXR2VLb293UDk4RU1jbTZTeDFrV1lWNGo4Y0JBU041U0pyc2lkV1JpNy9G?=
 =?utf-8?B?enJ5cFE1dVdxU0JsNDVDSWhmYk1qT1Vha3UvRGt4aCtuSDFTRWZXcVBMMlla?=
 =?utf-8?B?RHJRelFQWlVOZTNnakZUb2RBNU9wMFhHeXVJblBwUUl5ZUx6UU94dWZTWXlV?=
 =?utf-8?B?UTVRNmxPYWZhZE9jNVg2NWNjRG9YcTBySXd4VmcvcUhYNjcxbWpDellmblFY?=
 =?utf-8?B?L0xaMThpNExtUkRXSFcxVEJmdkJCeGZMRis0U1hBWW9mRHM1QUZDbzRHcVBj?=
 =?utf-8?B?QWxROTNuaVFBdVhZaVJsOEZJRjU4RjhBUUpHbit5SUY0b0laaDh3TE5nc1ht?=
 =?utf-8?B?amFJcHpnOFdDQWNYL1dYREZWU2cxOFYvUWErRFRGREt1V3VlT21hUHk3V3hO?=
 =?utf-8?B?ZmtNWGZ0UGQxSUkyYVk3aFlvVnN5Q1grNDhzemxlNi9YZU9lVitXMmhjOWpy?=
 =?utf-8?B?bVZBd1l5MThIdUJPMmx0dnVmWis3bHNLeEY2T0VMQy9JZzE1YmlwQzFJOERm?=
 =?utf-8?B?N1M1N1RjZkRSM2YwMjk1TlVjR2ErbmhxNzdia2FUTnVCaXBYaG5pM3dXd1RC?=
 =?utf-8?B?YTZmZy9tUlJGM2d3c1daZDJzYk5WcHcvTE5CWnFhWTFqTUhIbC9sRXlNSDJK?=
 =?utf-8?B?NExyVFIxRTlDNldWVXJsK1QxS09ncEt5RWhLbmFpWjRNZ3pVMCtnSHNKQjdt?=
 =?utf-8?B?N05NaEd4TWRmSll1RlVlR3NNV0Z2TEZ2WTR0b2N6a3NXRGEyMjIrSG9jancz?=
 =?utf-8?B?ays0QjAzdFFxeG1ia2pTUElCbHFTSlhrYThNS1d1SHdlNUYyOGlIQWpzaE0r?=
 =?utf-8?B?OUxqN0NCQVg1b3gyc3pVN080cmF2RzBmbXhEMlVlZjZPUzFGaUtmeHV0MkRM?=
 =?utf-8?B?QVB6Q21zVFBHQjd5aWdQc3ZuOEx1cGZxTG52WHU2dmlNNldUaE1lVTR4VldX?=
 =?utf-8?B?TlJIZTMvNTJ2V0xtbVVPTVpheXRHdEs0bmVTd1R6K1NNd0piUGk1M2pySzFi?=
 =?utf-8?B?VHhudFUrYlRWZHBPTjIvVkRIZWRmTitPUS8vZlVzek5JbEpwRnBUaEtEU0hU?=
 =?utf-8?B?TGhMY24rTnBkTWZCT0FrN1NYSTZVMnczU1NEaUtRTWJaQnorZmdRS0kwbXVF?=
 =?utf-8?B?SFg5TmNKaFF5UGh5cFhKajBqN1RLOWNjMU5YVnpIR1ZIbnRiWGcrdFdTdjNX?=
 =?utf-8?B?YjUyWmdLK0o0eVo1VllPcHZkOXRqMjNvanJOWWVKMHpJRkFTdnY1djJxSUM3?=
 =?utf-8?B?TEtlUm9UeU9HNkp0UU0wN0FieFVTZWpsWnZiM1NXa1lPMkJpT1U5YWFzekZR?=
 =?utf-8?B?NUFvL3RqZm5sOS9Yb3Ewd092MnR3K0NDdUwxWTNGbk9CNFduSTZGT05IQk9w?=
 =?utf-8?B?RHZ5Y3ZSRTVxRmxmSWZIOGFNSysvd0t1dG55S1pVZUVjZjNHQlhyVklpUFZz?=
 =?utf-8?B?S1ZESGxwcHlWUG83VVFjWTB0Z2NBTEZNVFhLeHp3WmVzUUQwMWNNeEV2MGdJ?=
 =?utf-8?B?by9SQ1NQVUpmZlZURis0TE5XdjNlQ2lKb1A3R0thL3kxa096ci80cWFLaHBt?=
 =?utf-8?B?bzF4SHo2Z3UzTmRPVDJZVktIdSsraDkvdlpLcFV1cDFHU3UrM1pNaXZOU1Fs?=
 =?utf-8?B?elBjZHZWZ1BaSWVmeTlzU3dvWXdySkgxSExldkZYdFBEY0VtV0R0cHZYcTg4?=
 =?utf-8?B?NGQ0RTZNamd4alhwSzVjUDlqcTRXam9xZjlZcndjRWFjSTZWT1lBSy9Rc0J4?=
 =?utf-8?Q?ejD8VB1+O0CLJ0lQU9FepGsh9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c5661c-a5ea-430f-c98f-08de27ab19ec
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:34:56.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8o2PRB+YSAfRthGSe8UvSMLo6LWKNOl7OCjGeVyYC0fFNYE+b4hA/UeKCD5G+dhhGgcWIAUIUB8+e0poRlxHwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9739
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



On 11/19/2025 2:54 PM, Timur Tabi wrote:
> On Wed, 2025-11-19 at 15:55 +0900, Alexandre Courbot wrote:
>> On Wed Nov 19, 2025 at 3:30 PM JST, John Hubbard wrote:
>>> On 11/18/25 5:54 PM, Alexandre Courbot wrote:
>>>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>>>>> The GSP booter firmware in Turing and GA100 includes a third memory
>>>>> section called ImemNs, which is non-secure IMEM.  This section must
>>>>> be loaded separately from DMEM and secure IMEM, but only if it
>>>>> actually exists.
>>>>>
>>>>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>>>>> ---
>>>>>   drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
>>>>>   drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>>>>>   drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>>>>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
>>>>> index 0e0935dbb927..ece8b92a627e 100644
>>>>> --- a/drivers/gpu/nova-core/falcon.rs
>>>>> +++ b/drivers/gpu/nova-core/falcon.rs
>>>>> @@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>>>>>   pub(crate) enum FalconMem {
>>>>>       /// Secure Instruction Memory.
>>>>>       ImemSec,
>>>>> +    /// Non-Secure Instruction Memory.
>>>>> +    ImemNs,
>>>>
>>>> So, seeing how this is taking shape I now think we should just have one
>>>> Imem variant:
>>>>
>>>>      Imem { secure: bool },
>>>
>>> ohhh, boolean args are usually not a good idea, because they make the
>>> callsite non-self-documenting.
>>>
>>> That's also true even in magical languages such as Rust. :)
>>
>> I fully agree; that's why I made the field named so its name needs to be
>> specified every time. :) Maybe `is_secure` would have been better
>> though.
>>
>>>
>>> Let's prefer enum args over bools, generally, please. So for example
>>> (there are other ways to structure things, and this is just the
>>> enum aspect of it):
>>>
>>>      enum ImemSecurity {
>>>          Secure,
>>>          NonSecure,
>>>      }
>>>
>>>     Imem { security: ImemSecurity },
>>
>> That would change
>>
>>     FalconMem::Imem { secure: true }
>>
>> into
>>
>>     FalconMem::Imem {security: ImemSecurity::Secure }
>>
>> If we want to use an enum I think we can remove the name:
>>
>>      Imem(ImemSecurity),
>>
>> So we can specify `Imem` as
>>
>>     FalconMem::Imem(ImemSecurity::Secure)
>>
>> which is as explicit, and a bit shorter.
A struct could be another option? You have 2 entities here, the location of the
memory (instruction memory or data memory) and the secure aspect.

struct FalconMem {
   type: FalconMemType,  // enum which can be instruction or data
   security: FalconMemSecurity, // enum can be secure or insecure.
}

That documents everything. But it is just an option I am putting out to consider
if it helps.

Thanks.

