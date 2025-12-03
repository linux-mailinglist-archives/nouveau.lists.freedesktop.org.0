Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8CC9F9F2
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 16:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D0610E889;
	Wed,  3 Dec 2025 15:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BAm+60OS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6129410E878
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 15:45:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i83p2+xlWjPf9O1GuVP0mk+8nRrJC86jEbO6ofYECWE79nU3Qbl5SCDsXbh6Pt0qdQ4ZipVihRq/4Pz4+MpPT37LOFUIS00oek+mXrfHUAV041/2z75DqmiGSTjwWK9dQbQbbQ8chEoRyZH+TXDoytxFH0nZjwlIXpr7XsMFRCNgh9fKPf60Aw3vDprd4QdqLCS51cnSunev5PAec2Jf8fp67hFN3UO8F1eiFzhaJHWhsaq0kSAreMPrfbNxJoC35vt4yZc+2xafQRtOoGj9DfrSlSZPIS6buIkWBb1GdglUntS35fu6E44co2SsM7bGNsmAHyCDJCWiktg3uewisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjbBhzxh0fcvhS2T6b7aSJstm7oQEKJk4nUy0AkxGWQ=;
 b=XLlLZTW9agZ0DmaUezp61AVQdioRemx/YG9v5hFW1mJ6eNiH5hkV3HJ2s7zKZqYfpUmwKbRpCVi7jsh1VK41nnJko1+rSAWsdzc2TCVvnTT8m8z2/BjW+0Xj9d8W4Z/QK9ajiJQFUsg2uXB73W0X3tGT9sFvGvhCtwWcGIOMggRIlilFUFpgQGURb46At4N0wAQnZu5CCgsPH0TOlzxHXNV7WN5rVkAM7rOkTScKA6EXjcXFDH3GOcuRovn9SVhUZc1aLEL6UM5vxKR1WyXqx0+67QB1SCvyKdtWkAAUFw3+Rcp9B0aNNzTK4RQtpzHXhV19Z4azyb9Lq7KMGIxp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjbBhzxh0fcvhS2T6b7aSJstm7oQEKJk4nUy0AkxGWQ=;
 b=BAm+60OSMtxYFL9pF+Hp04mEuODsHbAjknUDIiwWMQUwzyXKzOa/ZVoJ1Md+rOKDOOKJMo0GTRpnZrGPD84W6UYRnRcAvmlgV5FOwec2U5n/kpapAsQ3KSwcWRwUlu/VgSpnut91LqB/y2AqK3dxPx1vf+ZMjmBi8KF376pKDZUzmhi3QYIRZN+21Ak0tfQfYPvOf1N7pMaaOw9PEHxKiLKL+bocGKTuHJJQFAtq1Y4Xcilqwan56HlLbndoN/3EoSVKd4S9EOn/OHi0elP9Nkuq2Qzzxy5GYwCI9BitOMmmAzKSzZjIGlvZcMV4/zI2HoVX+QX1broUXo6ChpO0qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY1PR12MB9558.namprd12.prod.outlook.com (2603:10b6:930:fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:45:48 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 15:45:47 +0000
Message-ID: <b9188e96-9ffa-4815-ab22-735e2506fe93@nvidia.com>
Date: Wed, 3 Dec 2025 10:45:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/31] gpu: nova-core: Hopper/Blackwell: add FMC signature
 extraction
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-22-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251203055923.1247681-22-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:208:52d::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY1PR12MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3a9499-d562-4197-0ae9-08de32830727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHdhLytVV1UwYU1yWU9vVTFoTXVtYVZpMUdSNXRwR1lCSmpSL3ZTZUNselNu?=
 =?utf-8?B?QkVrYUtoaUNocXdrdGRGMVNiZ3lvQUtPcSt0OXc0UlkrRWxGUysrVldWTlk2?=
 =?utf-8?B?a0xPdkVMenpGSEZ6WUMxbkZ4MEtEZmRYY01FbHN4NE9QcFF6eFZydzI5aElP?=
 =?utf-8?B?NlZ3SlRlN295V1d2WlVMRFlwQjJOa2huT2VHemFLWXJtQTlNZlF2M25CZ2RO?=
 =?utf-8?B?Q0p6S1BZd1VoaHJQQjlaUWZZSVdjdTg3ZXdXMFpwMWYzazZTS3h6dUZDNVVT?=
 =?utf-8?B?RXVGTHozMkszK3dOUDUzVkQvNUlSWi93cW1sVWo1a1RkSVl3anZCcXpURDN0?=
 =?utf-8?B?dWo5aElNcEEzQklLeU9uQmFXTzVBNktnbHRYakRZZ3RKV0VXVmhKRmxBdVpu?=
 =?utf-8?B?WHJWUFlmTW1tTGIyN2VjM1BOSyt2RFB6RGx1Q05TYzVwWE93b05jcTdQL051?=
 =?utf-8?B?VDF3WkRXYmR3WlZTTWRWSTlOa0RTQVN4Z200bElPQUxJekkzaUpqTGdrRE5C?=
 =?utf-8?B?NGNKZjUzZ1ZodFV2WWhJWjVQK2w2VGV0by9lUEI1M3crRlpzTTZ3dWNjazhj?=
 =?utf-8?B?azlGRXBSRVpjcXBxUkVTNXhFYmp2SkFJaHZLR1RRMUpadkJjc210VnlNeTNo?=
 =?utf-8?B?cjFiekNCc1ZVbmJsdkpVenJ2dTNMcVZkZURBR0xlaUJjUkQxZXIzRDk0TGEx?=
 =?utf-8?B?Ky9zbkVMbENQbUgvV29XVXgrdWkrS1QwOUd0L2taSUVLTWozeFRxbUVxZE16?=
 =?utf-8?B?OENyTE40WW1TdWJOTytwYUV4dFBzL3NMS0ZOTW4zRnU3VkNBaWN6c3NoV0tJ?=
 =?utf-8?B?Z1NEVkpCdjFPZzRtSHhENXJDS0dpbWFxZHJpSUtDTlBJeG50WEVySTlCNmN5?=
 =?utf-8?B?MkhnRyszOHRydDNtNEN4RGtxTjY4dE96MDhsckpyN0dhcUNVNEY0WHFhdEtv?=
 =?utf-8?B?cVZRZVczL2xFdEk2UmVXTzgvUlExUzJUYzFPSFJDa1M5c0dzQ1AzdzBxdDBO?=
 =?utf-8?B?NWc2dENLMlQ1aHVVMm1sNCtKZDJGU1NtZnNxU3dLWVN2OTVQMVNIL2xtcXVJ?=
 =?utf-8?B?a0RZejhCZ0gxYVVUSUhsMTlQUFFBL1lnNFJDV0N1OW9Jc1VlYVQzM1VuQlNr?=
 =?utf-8?B?bEVwNk1jZW1mN2pUUFhIeW9nSnlvOVp3dGM3eW53TElXZ1I1amZ5Rjd5SzIr?=
 =?utf-8?B?V1J1R0VDVkl2SVdxUFRlQTYvVXJKcjEyMi9PQ01KVU1QWmNRdHpxVDRTTml3?=
 =?utf-8?B?eDhNS3FuNDFySkpOZ0RDYVk3eXZ3T0d6OWVDMU5iOGhwVk5uMTEwZjlvaFVZ?=
 =?utf-8?B?eTVjaklCeXNEcmF4ckhQM1RoNW9PMXpDTEtsNDFPSzUyRUwwbW5qbmRrOEFH?=
 =?utf-8?B?QnlnZ0ZTcE1oeWw3RENoMHRiSVBtREpsMlA4MmVGdEpBQkFSZVdBQU81cWNy?=
 =?utf-8?B?SEdLc2IzYnAwaEpneHZXd0k4UEEwOFJ4RWVTQk9aS29VeVVOWjl6TU52b3Fr?=
 =?utf-8?B?djdNMmZrVHNiMjhlVnRWN3o2WUZqNjFhbVZrMjVZamxodkFncUdxNVE1SVpP?=
 =?utf-8?B?eTFzdmRUL2ROUjFTWEN5K0grbXpHVitlcWhmMWN1eWhkZ2NrTkI1TGxnNS95?=
 =?utf-8?B?MTN4UkhnTTlzbmJtWGZnaXBrR2o1UFRIV3dpbTg5WnM0Zk9kTTJ4aWU4dElH?=
 =?utf-8?B?ZEtRbWs2RS91eXEvOENKVmR2azdrOVR5eFQ5ZE1pTXFGNlFuSmdmL0xROEdu?=
 =?utf-8?B?aFpJT0N3eTJpeVZxQXhwN3VHZDRCcEMyOUg1NzkrU3NrNk4yK0ZhNHlidDVH?=
 =?utf-8?B?bHZBcm1pVlZLSVBwMk5DQ0JOM3NQbklRMVdzR3g1TmxjaXJmM1EyVWs3SGd3?=
 =?utf-8?B?UDkrNHh6TFh4VVdKV253MEM4cHByVnFxODBpQVZmR21nazMzK3FOa3Y0VjJO?=
 =?utf-8?B?U0d2T2tnaXdWYVhKeXR5TjI3ZVZBc1k1bjM1RndTWkdsaFFPL3ZwRklkR3ZB?=
 =?utf-8?B?UVJqWExFWmh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJSc1JJUStkYnNONEh1OGhxSTlsWU8zdUErSGl3UG1maEVQZEZJdm9VV2FJ?=
 =?utf-8?B?MlYxUnNwVmR5VC8rVGJ1M09adm5adDFLN1JKamZNbUhzbWRGMHdoU2NmRnRT?=
 =?utf-8?B?U2lzcXFrVHBEYUhwM0lrYWt2elRldklDY0NENlNtVEtzeHIwRTFTUTJndjZZ?=
 =?utf-8?B?YUZBcmhHeUhuRkcvUExhcWtHNUhpcjFHSDlSd2g1dElzMmtUUnE4aFRmWlVD?=
 =?utf-8?B?MVZsRFFyYzU3QllyQWZKeUFFa3UySHNCcHNlZ2FhbjJSUmY0YTZkaFdiTUpl?=
 =?utf-8?B?UHViZEg2d3YweTVpZHFMcHhSek01dFJhZE5tUzZvRk9NYW9VL25ScUJhaGd6?=
 =?utf-8?B?S1dBSmY0aEN5c204VmFGa1h3Q3lVTStSeFZYS2NSVllPQzRqQlpkcHRmeElo?=
 =?utf-8?B?WlZmUjIwdkVzbU5qV1JoYVlHbE1zb0FlaU1wVjllRThKTVBibGJibDlBYm9H?=
 =?utf-8?B?M3lBckJVYzRkdFdJODc1Qk1jTm1LeTBnRGVNYm5uLzhydmcyZDNjRkpCMlE0?=
 =?utf-8?B?M1RYaXg0aHE1RU4zY2N0dnVvQnpvZk1WWXYrcW9iaDl0VEFQRWVzb1VGakdV?=
 =?utf-8?B?TFo2TTNHUHAxRFU5eUUxVmlGS0w0dTlBempISldVMmJYVG1mUlNFejJmWFh1?=
 =?utf-8?B?R1gxLzlmUTJNMUR1TXNBZTJ4N1QybG1EbUFRalpSTG1Sem9xc0dtZ0hEdFdW?=
 =?utf-8?B?QWVCM1IrSlNQWGZ4enl1eEpJSVVXSzgzT0gyRkxuNnd2K0R3YmlGb0ppQTdl?=
 =?utf-8?B?ODlHMlZ3NExMemFFS3laWmI3ODR5TERHMGc1SGM0bjZJd21CNFhGOTVwMDlV?=
 =?utf-8?B?d1cyMExYR3VOeDhmSG5Sc0ZIclZvd3RGajI2NHZkRkVUSGZBamZqTjJNdWU5?=
 =?utf-8?B?d04xVFlqZnJXMjJsd1JmYjJUNUh1bGZ0bFJnZjRGcFlUb0xSVVJVRFVtSE1R?=
 =?utf-8?B?bDBranJMcURxRStJQmgwTWFjUEtnWE5lOWcxMVBXVlpnSnUzUUdNTmduMGJs?=
 =?utf-8?B?R1ZYMDJaSW1JeDhTdU9TUm9DMkJPd05pdzNSTnAyNWJRWnFYU2taODlFV3VZ?=
 =?utf-8?B?bXVrUnFrNHZpUEdSSzRoU1Q4TTFQdzg5a2JHcjFqblF4SUZueGU3SjJ4ZGxj?=
 =?utf-8?B?clBSUGdweEFnVDg1V3BBV3poVnFwU3p6K3BuWDQySmtBd2RiYVB0akZ6K1hL?=
 =?utf-8?B?LzlqNFFZdjVHTkhvdTJKcnVaTyticGZaMEM2czJKZVBBN3daMkEzN3dEdUJw?=
 =?utf-8?B?M3p1SktnQTF3cmZlNStXd2paampHVjFnTHFITUw2eTk4UERjaXJlV2tqVy9P?=
 =?utf-8?B?WFNBYW1WKzlqVWZ2anQ1a3VhK2QyQzJxdVNQTnpQV0k4SHR2SlR0OVI5Q2N1?=
 =?utf-8?B?YVZTbHNVQXNvQXF5VEROdk5rVWRjUW5pMHdQUDhKckc4eXdSd3FRQmlWdC9z?=
 =?utf-8?B?VmxSd21MT1Y4YXA0dGcyYzRjTEM3cGlMMlhISEFCZ2I5R2pwUVgyVk9md0Vw?=
 =?utf-8?B?VkNCZEZUVEgvZWExaW5tK3kxajBlaWR1OWk2RUtDREJYVE9ZVG5qUzlCUldP?=
 =?utf-8?B?NktEOFBXSDFIT3o5QWlvTDNDK01nSnlIUENtbmxJa3FUZE9nZllKWE9KaDU0?=
 =?utf-8?B?QkwrZVRuSi9VZkNnU0VXblpoVGRFb040MVZ5cjVOYnJ1UGVxNmJpTDZiem1N?=
 =?utf-8?B?U0JGQi9KRXpNREJWOEppV1VaQlgrSnMvcFNFYmZNMXY2L1dhSG9ENk9nQ0x3?=
 =?utf-8?B?VWl2RUdNNlpJZlg5K3V5U0E2cU5SY0R2TEFOVFczN2F1NTZTUmpReUtPbHJL?=
 =?utf-8?B?M2JpZ3hNT2dwZWpWekdjUG9JbGhha3FzRHVsRUJzR1JEQkdLM2U0V0oyeUhw?=
 =?utf-8?B?THB1ZVZyb0hoYWdoQUdKbEluYTBBQUhubFJLUnVsMzV4TENSZHdsbzBWbzZF?=
 =?utf-8?B?VVpoS2cwUE1uMXl3bnFIUEhuaFQvOHFjQW1XVE4ydThGeFkyL3hBcDE4dEg4?=
 =?utf-8?B?VC9yTThCRk51djJSOHJkNGYzYkdSVElkejhPbE9aVDRXa2JwRWdXRjZIR2pG?=
 =?utf-8?B?VXZVejBsWFNBU01xTURpV1VmY2JjU3NaQ1Y1QWQrUkdnV3dDVml5VXJ3eEV0?=
 =?utf-8?Q?tYsQVexuIONsAGDUuTThzqnaF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3a9499-d562-4197-0ae9-08de32830727
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:45:47.7198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nAsFOy4zCIGkr227TaJSlihvpv9rncZpj+TzQ3SiFy4fDveTUXuiWwSkelp27HYf6c7XUaajvmm+GIax/VCspA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9558
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

Hi John,

On 12/3/2025 12:59 AM, John Hubbard wrote:
> Add extract_fmc_signatures_static() to parse cryptographic signatures
> from FMC ELF firmware sections. This extracts the SHA-384 hash, RSA
> public key, and signature needed for Chain of Trust verification.
> 
> Also exposes the elf_section() helper from firmware.rs for use by FSP.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs |   4 +-
>  drivers/gpu/nova-core/fsp.rs      | 104 ++++++++++++++++++++++++++++++
>  2 files changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 5cbb8be7434f..7f8d62f9ceba 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -23,6 +23,8 @@
>      },
>  };
>  
> +pub(crate) use elf::elf_section;
> +
>  pub(crate) mod booter;
>  pub(crate) mod fsp;
>  pub(crate) mod fwsec;
> @@ -419,7 +421,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
>      }
>  
>      /// Automatically detects ELF32 vs ELF64 based on the ELF header.
> -    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
> +    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
>          // Check ELF magic.
>          if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
>              return None;
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 389c43bfd538..311b6d4c6011 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -256,4 +256,108 @@ pub(crate) fn wait_secure_boot(
>          })
>          .map(|_| ())
>      }
> +
> +    /// Extract FMC firmware signatures for Chain of Trust verification.
> +    ///
> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
> +    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
> +    pub(crate) fn extract_fmc_signatures_static(
> +        dev: &device::Device<device::Bound>,
> +        fmc_fw_data: &[u8],
> +    ) -> Result<KBox<FmcSignatures>> {
> +        dev_dbg!(dev, "FMC firmware size: {} bytes\n", fmc_fw_data.len());

Let us remove these? I think we discussed [1] that once things are working, we'd
not want these and can add it on-demand if needed.

[1] https://lore.kernel.org/all/d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com/

> +
> +        // Extract hash section (SHA-384)
> +        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
> +
> +        // Extract public key section (RSA public key)
> +        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
> +
> +        // Extract signature section (RSA signature)
> +        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
> +
> +        dev_dbg!(
> +            dev,
> +            "FMC ELF sections: hash={} bytes, pkey={} bytes, sig={} bytes\n",
> +            hash_section.len(),
> +            pkey_section.len(),
> +            sig_section.len()
> +        );
> +

Here as well.

> +        // Validate section sizes - hash must be exactly 48 bytes
> +        if hash_section.len() != FSP_HASH_SIZE {
> +            dev_err!(
> +                dev,
> +                "FMC hash section size {} != expected {}\n",
> +                hash_section.len(),
> +                FSP_HASH_SIZE
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        // Public key and signature can be smaller than the fixed array sizes
> +        if pkey_section.len() > FSP_PKEY_SIZE * 4 {
> +            dev_err!(
> +                dev,
> +                "FMC publickey section size {} > maximum {}\n",
> +                pkey_section.len(),
> +                FSP_PKEY_SIZE * 4
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        if sig_section.len() > FSP_SIG_SIZE * 4 {
> +            dev_err!(
> +                dev,
> +                "FMC signature section size {} > maximum {}\n",
> +                sig_section.len(),
> +                FSP_SIG_SIZE * 4
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        // Allocate signature structure on heap to avoid stack overflow
> +        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
> +
> +        // Copy hash section directly as bytes (48 bytes exactly)
> +        // SAFETY: hash384 is a [u32; 12] array (48 bytes), and we create a byte slice of
> +        // exactly FSP_HASH_SIZE (48) bytes. The pointer is valid and properly aligned.
> +        let hash_bytes = unsafe {
> +            core::slice::from_raw_parts_mut(
> +                signatures.hash384.as_mut_ptr().cast::<u8>(),
> +                FSP_HASH_SIZE,
> +            )
> +        };
> +        hash_bytes.copy_from_slice(hash_section);
> +
> +        // Copy public key section (up to 388 bytes, zero-padded)
> +        // SAFETY: public_key is a [u32; 96] array (384 bytes), and we create a byte slice of
> +        // FSP_PKEY_SIZE * 4 bytes. The pointer is valid and properly aligned.
> +        let pkey_bytes = unsafe {
> +            core::slice::from_raw_parts_mut(
> +                signatures.public_key.as_mut_ptr().cast::<u8>(),
> +                FSP_PKEY_SIZE * 4,
> +            )
> +        };
> +        pkey_bytes[..pkey_section.len()].copy_from_slice(pkey_section);

Even if this works in practice, I believe it's UB as the `from_raw_parts_mut()`
should have the entire slice range to be valid memory (see [2]), but
FSP_PKEY_SIZE * 4 is 388 bytes while public_key is only 384 bytes ([u32; 96]).
This is vulnerable as the KBox holding the signature may not have the extra
space even if it does now.

Can we create a slice with exactly the bytes we need? something like:
let pkey_bytes = unsafe {
    core::slice::from_raw_parts_mut(
        signatures.public_key.as_mut_ptr().cast::<u8>(),
        pkey_section.len(),
    )
};
pkey_bytes.copy_from_slice(pkey_section);

Another reason for doing this is, the code is more fragile left as is, as there
is a risk of unrelated memory leaking into the slice and accessed by new/future
code.

[2] "Behavior is undefined if any of the following conditions are violated"
https://doc.rust-lang.org/std/slice/fn.from_raw_parts_mut.html

thanks,

 - Joel

> +
> +        // Copy signature section (up to 384 bytes, zero-padded)
> +        // SAFETY: signature is a [u32; 96] array (384 bytes), and we create a byte slice of
> +        // FSP_SIG_SIZE * 4 bytes. The pointer is valid and properly aligned.
> +        let sig_bytes = unsafe {
> +            core::slice::from_raw_parts_mut(
> +                signatures.signature.as_mut_ptr().cast::<u8>(),
> +                FSP_SIG_SIZE * 4,
> +            )
> +        };
> +        sig_bytes[..sig_section.len()].copy_from_slice(sig_section);
> +
> +        Ok(signatures)
> +    }
>  }

