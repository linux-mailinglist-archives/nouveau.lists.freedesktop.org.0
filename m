Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E0EC59840
	for <lists+nouveau@lfdr.de>; Thu, 13 Nov 2025 19:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D719010E91D;
	Thu, 13 Nov 2025 18:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FDs4qiN8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012039.outbound.protection.outlook.com
 [40.93.195.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6B010E91D;
 Thu, 13 Nov 2025 18:38:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbqYzS02ZcJVEsyMWaQ14BwJBYw6MLs0B0F7ia3VvV0wI1wghlWUR33ggdEJdHJRxzooJI1uHUVCNIOoST/YPPiRIyGrpWxJ+wrIHfxsE1FYtG7qHYvSjO4q6TyrS3X498kuWWKa8Hc8OfHA53Xdh8PMAOf/T0/9jZ3IPHTmjo4rfRNqPGlSeRpytWGVxZDMugAhHhEVNaNtqUqjxyx2OyLEUjPIYOk8jM4gF3ca8KnHmG+Jqg3ia3qgQ8rxMjGG9JnQ75rJwe5uIGvigJH60qu7ntrgPaJOpcgdIpl7OsdjPx/j1hHk1SwKirhJhHOE44JryfqjeF3mvsWCAmO6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBkTHdcQA0vZtg0/FMHVxuWUcgJ6msNNv1pGvU+l7fI=;
 b=AH6oouJ/RNJm3nr97BD67I5AH8YbFvwqvKuRiivKGKYK90FdSrHTZ1ulUBJxqP1CadiC0fB0PAf+NBaDSLs2XaARDIHY7pvchKxVnac4Ed7yoEt/bhwlLC5V6qu3olJkzdXm/fmY58f+4YTo2uhjjCXE+r9g59CbNAx5MDkMpciypliDJJBm+ehVA2A1RzyKNjnqHHct+PatbG0ZJpWHqzadiRw/pQH/EkOYZVOFf7GO5L006S87QtghjzQbpajnRkftkgAuAt8rKGr9LNR5xNuVaOSaRmQ5agKT2wL8MCg+BtJuOHz0tF5KBvS31eZPYW2svFo76afNr2xVjEydxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBkTHdcQA0vZtg0/FMHVxuWUcgJ6msNNv1pGvU+l7fI=;
 b=FDs4qiN8s9iI2pJoqpHJdGhxlSve4WU+8eCeN4b97R0YjJKt4NyPMBxoCMi2pHSQeTnOXWWSHjNPNstkBJZxlxrWng2N0fqLYtn7PdR0tHkgPNQjKklogJxbPCF+tQnpTQt49ssSORCKXMywKPKma2mRxswKR5D8rAuhVVYRuPT9TRJhkLaKjB6C1VVaj7aBKqkIs2PnyY8AKUt//bZ6Wny3XbCSVF/4lKCvGnLLVAMIUxgOZPLQH8/0KrmSUaQDK/6SizQZIrkZpQdGLJmC/lZgtgiJd+V5qeUSqXNL9SkD4l6qAH6Ee/KdFRP/yrvDLIqyKm0Yuokswh1pYHGBMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB7899.namprd12.prod.outlook.com (2603:10b6:8:149::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.15; Thu, 13 Nov 2025 18:38:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:38:46 +0000
Message-ID: <ab0ef5a8-d18d-43e0-a3f7-68d10ecd1761@nvidia.com>
Date: Thu, 13 Nov 2025 10:38:43 -0800
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: f2350921-adbd-4386-4982-08de22e3e0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXhzYitIMUxwcVpLT0Myd2JvaWs4NmNRei80YUx2ZVVvQ3VZNE52YTNMQlZO?=
 =?utf-8?B?U1JxVlRRNVhJQlREMW1OQ2VvazRlb2JJakx2Y0tIQXpCQUtjTEZtQzlOMi9h?=
 =?utf-8?B?OHJJSzB4MXVGTjBHVmU3dG5pVWJYMy9tY3JlbC8vZ0M3ZXFnNHpRcXhpd3pq?=
 =?utf-8?B?N28wRmkyL1ArL0ZzbDNPZDBXaFZGTE1EUC94K0tHVVBoQk9lQW5oQWhlcWo0?=
 =?utf-8?B?VDVxL3RadG4vRVE0ak56d2s2a3pSdi91Rk5EdTJ6S0FLbXB0NTVhc1ZDZE50?=
 =?utf-8?B?WWp2dnVra2FhNWtwYThsYkhSZDZSRXYxUXpOT0Jhd1c4bmw4eUZaWGNnVkVY?=
 =?utf-8?B?UXAzdkxNSkpkM2dFTUhUdnFycGdLNkxCakpIM0o5cVJhZXpFVFJTaFhWU3NM?=
 =?utf-8?B?czh2SWY5T2k4WWMyWmJjRTIzbzBJaEtKY0hkRHBZSk5IT2UxWGF1M3diWVk4?=
 =?utf-8?B?MU5kbFFXcmhkdnhsTGhHNk1GdklNMzVGNEJnODR3djZIamxSdEQ2Z29jZUJ1?=
 =?utf-8?B?WDkxVzVHRWpwZ0l5dGVrMFp0YWdhcXhLcFNYSmc5SXlROVM0cDk4cFA2Mi9t?=
 =?utf-8?B?a2dReTBHRGVtcExhWUxBY2xnNDFFT0tXTm1pVVFlSlhGMUh3WXZSdmhXeU9j?=
 =?utf-8?B?TFNLdi9FVWNDeG10QXVVTm55UW5Yd1hRUnowUXZtMkRrRkNNbHdBZGVsUVdm?=
 =?utf-8?B?SmMrNEE0VCtxTU9rQkxyVEhudzBHTzNKS0I2NWdIRnBTYXBveENsUklCTGl1?=
 =?utf-8?B?emxxeEpPWVpYdWRMOHFka2FISTF6NzNCRWRqRVNZd2tIbHNvOVUva2l5T1Vi?=
 =?utf-8?B?VzlZRlRTSmM1U0x2ZC80Vmp0VXlqNElYV2t1dm9tOUplK0w0VnZiQWlFbVIx?=
 =?utf-8?B?M1ltSS9QbjlSR25WRFZQN1pxWENiWjZ3VDFtRloxN3pRNTUvYnlqZm53Mmlv?=
 =?utf-8?B?S1pRREFDd3VPQjFxVFQyRVpXbE9OSnJxajZ3RUUxakZwdlMxUmlocGd3VVRW?=
 =?utf-8?B?Nkk0S0M4U0NWdlpJNVg2TENtYnJtZDRyWllEYURNcWFjejUzcGdJT0Rvency?=
 =?utf-8?B?RTFhT0NWdG9rRWE5NHBGK0doZE9QUmpGZGR2WGxWUnIzRGsvZW43OVpjVUp3?=
 =?utf-8?B?OFJNWGlQNnNFNnloTkxIMkdSWEVXV0I1cDMyRVJPL0dMOG1DM3k1Qmh6UHZn?=
 =?utf-8?B?cGJ6Z0QyZTRtTkR5dDZTejNmTzY0YjY1dmVBdzV0RDN4VU02dWRNUFJheGd2?=
 =?utf-8?B?OGlYQWZ2eEVNM3N6MVJRaTdtQ0VFRTFVd3dPK2Y5OHd0L2pvVTFkMmdYQlhn?=
 =?utf-8?B?NEtJbm9mZzFwZzloRmxhbHNKbmg3RzFKMEtpUndQMWthSDdYY2taRnpzK0Nr?=
 =?utf-8?B?cjR6dDV0TVpaajZJbXJrN08xR3EzOFFQQjRzR1dkaEhDQXNZcnZFM25IU2hS?=
 =?utf-8?B?VTFxa0tMSTgySWYyenVxbWRCZ0NYaU5YODk4M21YMC83eHBqU0NnMjl3Tnpw?=
 =?utf-8?B?K3VBQU9takI1YmtwWW9pbHVsMGxaRnlVc25razN5Z01GREx3RjR3MXQvNzFG?=
 =?utf-8?B?dTNpWDViTTE4b2l3ZVdFSDlUTGVhNVlSUFJCTUJmZDQvWEhqdEpqSkhUQXRY?=
 =?utf-8?B?TERLWVFhVndYUUxVK2hvVmpPUU9IRDNOdTNlQmhock5tVmhOQ3dxQ0VvcWVr?=
 =?utf-8?B?d3VHaUhqc1NTRWJEV0VkMkt4cEswais0LzNFVE5OTlZEenk3TUN1MncyMlBZ?=
 =?utf-8?B?NzFXZ0RjNDlWZXY0ZTNpc0I0WU5rQnlLanEwcFVFb2t0bC9SZ0dqSWN1dFV5?=
 =?utf-8?B?Q1V5QUJxZnBkZVByQ2JldHpJYjk5WWZXRS90VStPR3ltUjhnQ2d3RmNtYm1z?=
 =?utf-8?B?ZlBRb3RjZlVIZ24vcDFhNkQveHI4VlAzOFA5NHBCbmpTRkJRdklzTFZ3bDhD?=
 =?utf-8?B?WGkxQWhiSUJOQlcwTllwM0ZQdzJZOEZyMHcyVHA2Q3BKREtYelg3MXRoWkUy?=
 =?utf-8?B?Zkw3WWZocDRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTlNVVFHdTZkRVVVL2RPK2MwdU9lMm1aY0ovcER6N0V0QkFoYUJXbUE4QWxq?=
 =?utf-8?B?aUtBRlZyUmRieVNsdUVmS2lwS3cxb0tWV3dMUkNKd3c1T2dBZkxVdFY2WUZU?=
 =?utf-8?B?cXJub1ZCUy93eERtM1dZb09GZnF5dCtrMEk4VnA5QjJ2ZE9CYnJLS3VqRzI2?=
 =?utf-8?B?WXRvK2NodXM3ZWJSWVBKSmZKZ3BVSUwyOE9DTVJnYzdiOENtWFN6amhSN3VF?=
 =?utf-8?B?Y2U0YjU4cXo0aEo5WWFCaHpleHdFNHU2YThrN3NGaXJsVHRJRENMVnZyQ29Y?=
 =?utf-8?B?WStndU9SSFVXaEM1YzBJb0k1RnRxbWNZN2Frc3Jjb3VyWXlQZVQxczU5Nm1Y?=
 =?utf-8?B?K1dIL2JvKzl3Q2F5bVE3OEc5MkpIdkxuQU5vcFFGYVRIVGk0UmtOZjR3RXdB?=
 =?utf-8?B?MU8zQkg3Q0h2TVB6Ky92ZjhyWkRMOGdRZzZHYkwzeGxBQXF4blBnSWVvb0lU?=
 =?utf-8?B?bDhHVTZuVXMzWm9RbDJYVEFTWjdWWnk5OUJ2OWt5dXJqc2NIMitPdkJPZFVj?=
 =?utf-8?B?dnFrZXV5NWwxNnFoN3R6WllkajQ2UmhKTm5iWGk4a3V6L1dnYXJ0aHR3R1NV?=
 =?utf-8?B?OTZha1U0S1MyVFlhY20vR0xnakwvQmRtbHpmSDg5K1YweFJOZ3hFb3hqTkRw?=
 =?utf-8?B?NEdiU0FEaVVrdC9jSXFOYkEyYW4zckovRDZkSGFIWEdzUjlab0dsQ05lbWEr?=
 =?utf-8?B?WDRPY2F5MnVnK01CMWtwU0daWm54akx3Mmljc0lWdXdyUStyeWx6QUJTb0Rq?=
 =?utf-8?B?dXFIdWlIakVZQTJaVTVBRGFPRnNOcXAzMW9rQXl6d3JNN25mVjZrZW9LUHBj?=
 =?utf-8?B?QTZIWXhtZ0hCNDhqc013OXhMMXhRdHdVRFg2bjh6TmRWZlZDME5US2FXNjZz?=
 =?utf-8?B?bytaeEhCNVhTNWFCbU4rRW9JTU9zQVdEa1JKWHdBVWlzVXJCb09SZWFuMjZm?=
 =?utf-8?B?eDJDamcyeTZwOGlKd0RteGIvb2VDWEphSys0MUo4YVc4OThxbG5jN2x1QUgr?=
 =?utf-8?B?MnByQ2ladnRtWjJqdjBBWUM1UzVYYnpSNEhMVGhmZmpYUUNYRUZFdkU5bXQ4?=
 =?utf-8?B?SVRLeDkybFgzOEdjaFhIQVhJOWlSZ2pYaXRQdzhuNE1jK2N4QUVRQi9IdzE5?=
 =?utf-8?B?Um82bWRaNk9zaXNYYmViRyt4SHRlUGVXTnZTY1JoQjZHbmxvZU1xUm1Zd3lE?=
 =?utf-8?B?LzdMNStKdG15N3ZlWkpxMWcrSXY1YnhaVVNtZTdmSWhONlVNMFVPazdjUklo?=
 =?utf-8?B?eWZzZ1BJMHlGWVArL3YwOFpGa3JXTTQ4KzZ4cW4zeEJoWFM1REhadVlqbFNG?=
 =?utf-8?B?TlU0bkc4SDNkcUl5d1dFTldad1lBZEFUS0V4N1AyazFBNkZOa0V6QUxPOVVY?=
 =?utf-8?B?Y2U5UHVBblV2d2J6RmNLdlFWemNVTTNxdjJUanhXa09QQzRXbXROdTdBcEJo?=
 =?utf-8?B?cE90Nmt2b3o0ZVE1cENuaUJUWDNkd0NWWkMxejNIclVFcUYzUStVbExjVUNW?=
 =?utf-8?B?cDM0ZFIvZ3FVZEFUSFd5SldkOFdhWHE0MDl0cWJBWG5paWhVWHNmR1Jpbmkx?=
 =?utf-8?B?c2VQcWsvRlFkN05QNzBTVlcxeFo1UnJWK1RiOEFYNVpVNTJZeXdZOGRyRitR?=
 =?utf-8?B?bDRwVnpJUVZHWlBOSDRNNWpSWnB4ODFJR296Vng2RjNXWHhYN0NnenE1dGla?=
 =?utf-8?B?SVpTNWxnWnBqSTRNWmcxSldjaXJaaGdWNW9ubWR6QjFidFdZQUtGQ2NWRDhV?=
 =?utf-8?B?b2FqM2NCdTBQUURNKzZqZ1hLUE9HUk1TM3R1L1BoZHVxakF4dE9jd0RpTWVB?=
 =?utf-8?B?QUFpS1U3QnVOSDRsS2R2NTQwZE9MLzVCNDZxWWFZa1l3VmlTeXZjM2RWc2FL?=
 =?utf-8?B?dUJDZTF0RVpKZG9nWUp2UXYvUTd1a3RrYUlxQWJ3U2JNaDExWDBXa21hZ2hN?=
 =?utf-8?B?cFpOVGFocjhvK2hkSWFqako1T2ZsYktYeGdqQ0UxM1h4REVEVGhOcThRWU1W?=
 =?utf-8?B?OERyTWV3M2ZNeFp1TW9ZYWdlN3ZjOU50UEdIZVh1NFVpMTlqNFhkcTYvKzFv?=
 =?utf-8?B?ZFpvamt4SkhMdUNmY00rRVdWQnNqVU5TQk1yNHA3anlkUitPUUtmOTdPUUFR?=
 =?utf-8?Q?dVmFV/BodRJ9skg6ow85LYAkw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2350921-adbd-4386-4982-08de22e3e0da
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:38:46.0097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uospR4Tsah0bN/G1fpMtNgt5xILIWkikyfW0ORVG8iqq5Drmxn7wMr/MwPKXdK1we5vjhwqyApjy18wVIZ9i9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7899
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
>>   impl NV_PMC_BOOT_0 {
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

Yes, I think that's a good change to make, sounds good to me.

> 
> Considering that the series has been extensively reviewed during the
> previous iterations, I think we can safely apply it for 6.19, so will
> proceed once I have an answer.

Great!

thanks,
-- 
John Hubbard
