Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECFC7118C
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 21:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C1A10E68F;
	Wed, 19 Nov 2025 20:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZeAAS9EZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012003.outbound.protection.outlook.com
 [40.93.195.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6211610E68F;
 Wed, 19 Nov 2025 20:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXhugZnsN028z/WcKueJHvMeeeL3wK1THIuKVJU90fn1bQe/Tj1cOotf768FJ6lQLpvOID9OPdB5TcP+75IW7p1rZv1oJAQvlEtG5FpWz7jLXcWzPMfxy7HFpzFDgqfsC731RO37rXWRq45eEZGWs8nS3/8oUJ8WSkz8/okYJ+NChnRVVD/ei+tOnLhtF359thX9rhcosnB6YJMlbz20DA5T7w7RzyLLt6au4KmxAgzKYR0MQ7FS7T20ElPInZB4kJax+8phfTIeUi2+9QI0osoUTjP5I7N3QcfvTOirDk/8T+WGJjqb/RvUqhG3cEkLgrG6Aiuglkcy+E8tZSD8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXCgABflGaweq9fT5wV6K8M6ERrfBp1GtRIhTUYec6U=;
 b=BNR+fxSb4ryt2uheaBOyRD2EPTPY6Ct39BdBHwXzxzrWILuG0IwPum2qF8O9l9egorTd4V544SKSa+gyEgllwBuIuenO8V/R825LG5QsHz6hYidjegrnfweP4jTGcc2xOdUNxOdP336NDzEQmfe4c18N+UmMT72l5H/6VbOO0zjYZgnOerwblgafzWvGeP/ezHGmRnu3MZd+kn3Rm2L6mEZQDyDQ+xP5dYZRiBgFYoq3WDGKAfO3E5iCvS2RuOJT+xsbzQz4TD//YCyvt/xFC07vGqUqjn31PvQ1/S6AEMhT6kpj/Z1llUTAHHq4SFmuVYl6nTjG/YsukgMxoCUqfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXCgABflGaweq9fT5wV6K8M6ERrfBp1GtRIhTUYec6U=;
 b=ZeAAS9EZksXMJDDggOLbv/sGBdewdiGKCY01OqfRHMx9ARpI2nI1yo7tBC3fe5rrd7ITOJ9SpgEVhdu9A9Ei7igXvrCwYn2no7VGojPY06gY4uE3JX89I8uboTbGOw4HQ1FW0rlL4pD9q/a5buMAVrm6m6awppCEZRJKlhcKkDZBXWEONWY/iYhGO6fPKEyIag6S9ytGHtKbZimZYSjiCbDB/2yN0fBO2jPb9AlY49rogPM/3Q/YNOi35k1QzlBVdt307PyTIhCqVKCTZ2ntavEQaBelciuX+DlIaSE2kSksUVfZvE01bb6gUly8W+/2wZLolHFcrc2Y+jMQVRSNyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:55:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:55:36 +0000
Message-ID: <65db2753-6c1d-49d5-a9a9-9c99e5b8da49@nvidia.com>
Date: Wed, 19 Nov 2025 12:54:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
To: Timur Tabi <ttabi@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
 <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
 <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
 <81dc8ea0-3cd9-438c-a74f-e5805211fa38@nvidia.com>
 <3ea243f63f0e0efabfc5d306797883b0196399e7.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <3ea243f63f0e0efabfc5d306797883b0196399e7.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 072344a8-9c75-4d80-0445-08de27adfcfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnY5SHkzZHpzaTRTd2QvaDdFb1dDb09WYUwvK2xBQ2VWRlAvVEdaNUV4TUdL?=
 =?utf-8?B?MGJZa1ZUYWtyRTFKS2hXS2pROEkvenVXMUpla01OTEVTdGV2Vkt1SUtWdjR0?=
 =?utf-8?B?UFhWM3VpdTZJMkUrSlhGTkxxUEk4Rk5DdkZNYXB1SFlKeVRxU2Q4TmFma0c2?=
 =?utf-8?B?VGVmRlJkMWFPMTZCS2VEbnFaMlg4RkZJM0xyNzFRcGd4TjhoaTc0d01oWUJu?=
 =?utf-8?B?b0tBcDNNL1BaVzk2U0N0anpkVGlCVlB1QUdwRWZHT1FHbmNIQUluUmpiQnBH?=
 =?utf-8?B?K2t5T1M1SlcxUW5ZVm9NL1Mzcjk5TWxqR2k2QnJwU1B5RTBBYkF3c2Zpd2dS?=
 =?utf-8?B?U2FKQmUrWkRxV3BYdVFIZTE3YXNZbTFNczFPdUpsVk9ZanFyZnVNVDBQSE41?=
 =?utf-8?B?VEVOYU5OVVNIRjBKUXFjc0JYcksxVVMyYjBiTndGWmNoRm9rZFhTMld0YTNE?=
 =?utf-8?B?Ti9QQmxEUFVjQldsSzlrL3FUWGhya2NhaTNOUVN2RDMxanhPVXNYZDlXUk5P?=
 =?utf-8?B?WU1yYk5EeGkyK2FLQUsxdnhzUU9KVVdHOEdjeDNreHRJbDE1bzRmbUVGNjU5?=
 =?utf-8?B?dzBlZ09USGJhQ2hGbVZtN0dwUStZRTNPL0xoNnFvYk16UjFLenhIZHR3Zjkr?=
 =?utf-8?B?SUlBSk0vcDZFNlZLQVMvaVp0dlN4aGE4ZmNRMnhhYi8zRCs1SjhHK1hUOHhI?=
 =?utf-8?B?L2V3akJFVUw5NVQ5ZFlWYlVWNm9LRldYMWRhTEw1QXZjaTFhNlN4OVoySlMy?=
 =?utf-8?B?MHhBUndBT0NCQU1ONVlPekoxZXRmaWZueTEySWd0TjkydklYaEdoY1VSdVJH?=
 =?utf-8?B?NkxOUjdxZGVGNzdlY29seXZLSjNvNi9DOU80YnFqNXVidWd3cE03ZGRMM2Yv?=
 =?utf-8?B?enhobXdVL05iVi82QWVZYXlpbmxuaXR2VkJQSnBydXlFSkFMc3hmd3BFUkNW?=
 =?utf-8?B?VHo0NnpLdFB2WHFuVmwvKzFITlhCZ0RiaVRNYy80UXpIVTl0d3lrYW1zNy9r?=
 =?utf-8?B?TlByeDdwZDE3amc1TUw5RlM4SHBjVVk2NWdFQW11dGJMUGJtaVRkMitoRW1B?=
 =?utf-8?B?RDRXK3QvWXBjcjFVR0dqSzJxMm5xd0NjWG5MVVNQZUZ5MWQwVDhuZnIyTStF?=
 =?utf-8?B?UXBVZW0zNW82MTY1Ym5nQXQxOElDaE1EVEIvMnpNSXRoN2JjUk42TUpNeUV2?=
 =?utf-8?B?dFZTaXZDdkNVZ3pVKzhHTHRVZXlaVm82dlBzNWNKdW94MFdBVGc0N0NNcnk0?=
 =?utf-8?B?SFRNZnNlSlNCVTFickxUK0duZFQzblZ4SWk1SExKRkZoUzVFdmtRSCs5SWtw?=
 =?utf-8?B?SVR4QWNXMVdsRTIxQVFSMXVDTm1WRGxYVmh2dHNKU0tEUDgxN2FxTXJqOXhT?=
 =?utf-8?B?S1p0ODJaMzdlV3kwMUdkWUU2QXJ6Q3IrU2ZxSmRjOGtTNG5uYlZqNzRTb3Jx?=
 =?utf-8?B?MG1PSnNvR2lQM3czWCtlUVNBY3BaY0tKVUUrVmNDcDJtZ21MUUd5R1ZOWVF3?=
 =?utf-8?B?TDlGa1FQeE8zbkJNL1FRdSsraldLZUdQbjNzTHR4aWFpckRaQVkwYUhtVnhi?=
 =?utf-8?B?OGIveEVtTE1vektKdTVhNnVJamhPenR1bU9Ob25MS1J4ZjJhUXc5dDgxcW1W?=
 =?utf-8?B?SW5RcGpuckFEbmx0SExpQkFLVFVsYU4rZy81LzZXcjRCMUlRZ3hMc1hLTkZQ?=
 =?utf-8?B?VmxqUEtmWXJlY3ZzRnc5SWwwZjh3aEMwRy9TRVlnOHBzVlprMk1CTzBjRzB1?=
 =?utf-8?B?ZVRmakt0cEVPY1NwbFJwTkhIZ0FWZ0dvU05QK0NKRFA2Y3VVSVVDZEtkZTMz?=
 =?utf-8?B?NmNTOUJjWll1dXZWZmVwcEl0VjBQN2Y0UFh4Ukd4aHBWVlE5bDJtaHJqZUpR?=
 =?utf-8?B?b3VqWEFidTRISjJ0OFdkdUhXSkZMd2V1d05udGh4a2pGOE56TzludlBkS3Ro?=
 =?utf-8?Q?6L4z//mVAbYJCpeN6NBX25lzUbkQjz/g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFpqQ1ViaEY3dCtsdW4zLzViRklMcmZZaWRaUEVlKzhJMklXOTFnQjd4U3Bv?=
 =?utf-8?B?NlQ1Y1hNUW9zWU9yOFZnekV5cCtabTVVN1JJYVVtZFZ5bk5yRHBQU1pWTm1U?=
 =?utf-8?B?QjlKMFJEOStPYnBmS29mWVVuNXUzT2o1TkdmY0pJVVY1bXc2bmlRdWVOcmk5?=
 =?utf-8?B?UUo5TlhsUnRHbkhGRFY4VFMvaWxrU3RQM2hobGlYblAvdlRtRjZxQ05OZlRM?=
 =?utf-8?B?YTI3NytrK21RVDdvNnU3WHhmdktuWEhtbGs2YmduM1NBakNIbjhOT0MxeGwz?=
 =?utf-8?B?Qkd6TW9EUUttaHMvdURVQ1l4SHlDUlNUQ1phRE1ySUNLRWQ4d0ErWkZYaW9Z?=
 =?utf-8?B?TlVQeC9xWUJVdXo5WjMvem4rVnJUNzJ5Z1ZUREp6czcwZXZ3OVd1YWRxQWtR?=
 =?utf-8?B?MmttamNXZnpTc1c4UDJzRVlQUTExVlRFcGNLV2NtMjgzd0Fjb251UGRENkdQ?=
 =?utf-8?B?Z20wcUsrVnRLN2RYMVVSUTRmaWxVbmVham9McjJmeFhhVEdiQ1BPQjhORHFO?=
 =?utf-8?B?SjJNUUVkRTdXVEpKOW4yRjFJdmxuSStucWlPaTJDMllXbm9jUkRTTWZCZm9M?=
 =?utf-8?B?VFpjTCsxSGhLV1UwditYQktwUndxckkxaXV1eEFHY0VaSHdWNFlHdW8xYkJk?=
 =?utf-8?B?cW1UcmFFQjRoQ2Erd09WQlhtaXM4b2xtaGs0bWI4QUpFbitoSDE4VEZXVExW?=
 =?utf-8?B?NWxlOVVDeU9MUmh2MXZ5cXZEK3J2MnRqNnlhWGk5K0tkZWVoOVZFaDN3Vllj?=
 =?utf-8?B?R3Q3YWgwKzQyeHdsSURUbkZQOG1FMXJoOVk0S052UGwzei8yVUkvNnptanBq?=
 =?utf-8?B?QjJWQlJkM1BxWFB1djlkb05MMzViMDBHVFdBNWFjUmkwemFuOUhkNnNwMGl6?=
 =?utf-8?B?a21SUTViNUZFNEdLYXZkdElQT0ZzNzBpT3BjQ0dhRURHNGJnRkIvelp3MXI2?=
 =?utf-8?B?VVhqYytvYTMxcGFWNFZORjZ0SE1PZk9VMXBrNXkxdllxdWk0aE9kYS9zc3ZL?=
 =?utf-8?B?cXhqam1zcWZuLzNwQWc2dHF0RnQ2ZW5nbWVCbVduZkhjZGVWNnRkSWpRNVV6?=
 =?utf-8?B?Zk5WTFkwb0VNNi9sVThIdUY5RXh1cVdOWTFjc3J0eUJOYUIxaXpFd1diWlBv?=
 =?utf-8?B?OTFmWDlyTXZUUFEvM00rSi8xQzlMcHoxMWljMWFyYUdPYWZXRDVJRDFjQTh2?=
 =?utf-8?B?ZldwUmQ1MXlUd0xkS2RWZFI3ZVNpaG1MK283N0FpRWdRbXRZOXFLQlljUXBZ?=
 =?utf-8?B?Z09jRGh2VnZzZVRJL3ZVMmVpZEwwSzU2b0pXdlZSRzRTWGRuRmU4QVhNOXJ5?=
 =?utf-8?B?R2x6U3I4Sjh3RDVDMENsZTVlb3JpOEg3bk5yb0dTZ2hSM1hkR040Um1xR1ZZ?=
 =?utf-8?B?cVkrb1EvOEJaVGtDM3dlZ08vbDVZcTZTd3ZKSEJUaDk2WUpvREN6UDQ2WmhU?=
 =?utf-8?B?d0pWY2loTlYvZnRPc0tiS2R4eEFYWDZwbmxBMlJ1eEhEQ3VzL1B0S0JMZjlR?=
 =?utf-8?B?bnB0UDVQQ0RQZm1oNm1CY0NRZXpobVBheFNxSkdTVkdSYzJXSVNlTG0zOUlp?=
 =?utf-8?B?cFlGYXhkcVhXbVVxbXo5OTA1MFdkUjBrOFY4R0NnN1VvMEN1eFk0MXIra01S?=
 =?utf-8?B?OGxMUm9KRE9BRDRlREdsck4wUXBxemJoWFVJLzBEL3hoYisrRHJWeUVuY2hS?=
 =?utf-8?B?TWVseHlMV0psNHVvejdZckVkZ1dvMEdPV3Q2WVRnZUtmRDhvdTRnNWtRZFl0?=
 =?utf-8?B?VDczenk2dW0vcnNTWHpkOEQrRm1SV0VzdkJ0RXNBbURiazJUNkp2K0E0WTZw?=
 =?utf-8?B?T0ZZYmRFNHA5cFJvc3RnK1JKME81VFF0L1ExOWNXUHA3NW9DcSsrakJKQkpo?=
 =?utf-8?B?S3FwOEtwSzFWVWl3ZVB2MVVhZzNCeUhWKzVWb040VkFHMDFLSG5tZ2tqVnVN?=
 =?utf-8?B?TWsvaGRMYytXMncyTThmS0xwRllNNGhCVFg5K2txdlFGb3lRWmUvYWZYSXVn?=
 =?utf-8?B?dDlGM2NKY3g2UVVjTWVYMDIvbVphQXdOU29WSWdEcTF6dXM1bWFPOCsvdU5B?=
 =?utf-8?B?OXVUNXJiYVJDZER0YWdXREVhN2RNMEQ5M3dTN243WUwvR2pQaW9qcVhYTk42?=
 =?utf-8?Q?5C59tH1I9WlxAcnDwfXtx9gsx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072344a8-9c75-4d80-0445-08de27adfcfb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:55:36.1844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+7raB6jDuhSOMWvXJdmoquLMdg3PgJQXlu1VyaLRehe0EXAOqh0tX4lo1NQZY7S7u5DvqHaDtcJwToYy6MWTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589
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

On 11/19/25 12:45 PM, Timur Tabi wrote:
> On Wed, 2025-11-19 at 15:34 -0500, Joel Fernandes wrote:
>> A struct could be another option? You have 2 entities here, the location of the
>> memory (instruction memory or data memory) and the secure aspect.
>>
>> struct FalconMem {
>>    type: FalconMemType,  // enum which can be instruction or data
>>    security: FalconMemSecurity, // enum can be secure or insecure.
>> }
>>
>> That documents everything. But it is just an option I am putting out to consider
>> if it helps.
> 
> Sure, but the security only applies to Imem, not Dmem.  I didn't want to come up with a design that
> allowed for "Secure Dmem", like your FalconMem struct does.  That's why I think it makes more sense
> to have just two Imem types.  
> 

Have we come full circle, back to the original patch, but with slightly
longer names (please)? (Spell out Secure and NonSecure, rather than
typing Sec and Ns.)

thanks,
-- 
John Hubbard

