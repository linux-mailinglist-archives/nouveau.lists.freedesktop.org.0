Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6CC6B7C4
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 20:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFE810E1F4;
	Tue, 18 Nov 2025 19:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nzaDHzux";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012037.outbound.protection.outlook.com [52.101.53.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B371810E1F4;
 Tue, 18 Nov 2025 19:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xpxk27yVqYre87lX835M7JV7O0+geNV2HPY2PjPamVZWFnq04/r0jBQIsJfy9W2KSJtQkozUwfnGmnP6/sSvK23Xzuy9Rwmtra4XRdNvgDapt/El255yfXQizUqupFaxsXkVDMCW+MCudIJwypfWtsk1xBltf1lv3gNahVGvif0y7rGni0AXuiUfaZkifig5P1kq32bZG0Hb5BtoCxFWesYWoAzg0RTPTlzYt6pWShK5/s84S65OiJu7b0+2rF3xQZ1WP5eUvEKLQpgy7oJxxFnyTueZ8ibYHCN/3DZzg9i/JausBLa3e06JD0QLxyOUpiPkgqyNihrHYuv5l8qOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhoqZlsR4YWZ7E43nuSv+sjgcMTwDriM0l1jsEiu7Hg=;
 b=DyEkvkfG+K21M1ji1IWaoyM4i/eBFjsgesrMNEpxfW29/wXeJHESi1gmilexT1qKUmAf9tpUzA1Znc5tus2JGsKVoASo1vTHcQMYeuzf+4hDJMPHF4qE87uyi226lyofLTEWHU7oyYia4SBaDbZliQKJRyxZz7BIBTVdAeLueZuywAg5uiOOOBB2KyWJY0StZBxZnwYfp0oYr5OF6+17rgvn2qe768FumbucNuBWDhClFNVu4ULPAhgHzK5gL26sIxTd8EShGW9ccvsi5HCMya/CTIAXSW1dfq3o2KRoNGZ4wcrv5eNQ7f1fDl11OglHXko3J2VyfngomqudjqTXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhoqZlsR4YWZ7E43nuSv+sjgcMTwDriM0l1jsEiu7Hg=;
 b=nzaDHzuxD8f8MAddf2PjvZW8ZDdNGsJl25ZYQyprAIbb82z5WZt7mpJCqL/0zIJZbSvvLqkmqboVY0EcuM7zv7SWiwsDsjsd28uGNPuOgNgW+0WuaqtNVrQMHGRFschRp4Er5Wj0mqBW/IIYUv5ZUMMJrjy3GQBz1b59QoPR5gPdPe6h6izIdQrjrl3DnvOJfn3UBEuvetcrGpU1MHYWcQ6p36/Kpt728hxJAxpBb8rrhtTwe34Ej0QEdsboC5fR0VgVq3g4mRpJBOh5RxA5d8jIFZAklaPQKjkzqcVicWv1c2Xq2dzVOMFxQC3vuTqr3VGAHkErZSHCHaKw6YxQkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 19:46:34 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 19:46:34 +0000
Message-ID: <eb30817a-ce56-4328-a948-9e4d88d92e24@nvidia.com>
Date: Tue, 18 Nov 2025 14:46:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2> <DEBUBWW4AF8H.S54ZKX607FND@nvidia.com>
 <7246f7239cef8a3e7dc6d3ca8ec9336821e88e6e.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <7246f7239cef8a3e7dc6d3ca8ec9336821e88e6e.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: dda8fbb4-9093-4d2a-793f-08de26db2da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3I2TEt5ZHFvdXRCVVh6UmVHKzdIcDZxbXVRNEI3UGJSK1E1UCtLbGpGRVcv?=
 =?utf-8?B?OHFDVXExeElFM2dWUmxZK3ZGNXI3VWF5a2RQQkZYNlZNRXpBUHdJbzN4RFVZ?=
 =?utf-8?B?NUpYWDFJMjF1am05eU9rYU5EM1VwcXRuT1NIb05IR3V6b09xcVk4VlhSbE41?=
 =?utf-8?B?S0xUWE8vQ2V5K2JDRldtZmNFSkx4c1E2dWNjK1c4U3RpbDBNUnBFMjhzeDJX?=
 =?utf-8?B?ZUt2UG9oTmk2ZVBqNXdFdS90aU9WZjJuUEg4QlFESmhrVEREY00yS2FXRkZH?=
 =?utf-8?B?MDdyN1V2TmM3YzBNWGpDNFhTQlppTEIwVHVRYS90THVYTU9LdEJ6Tzh1Y2hV?=
 =?utf-8?B?VGZmQlBBNVFtd1I2cWRsTmJNeDVmOUpudkt0ODRhNmZUS1lzbDFoYy9palBj?=
 =?utf-8?B?dFBRWmUybk5JN0lydGNHeHdRaytPK3VSWDFZRXNRcU5DZVN6Vnk4dUNWSSs0?=
 =?utf-8?B?RTA3bzlvdEZpODB1d1Z0ZFdzTzlnVXZVcHN1bHdka2ZnYjRxQld3Tk8xcHZq?=
 =?utf-8?B?WDAwcHpFYkZtemRZcURjcWNEZjdTUkdDR2VVdWovVW1BbHE1QjN2SEJQMVp2?=
 =?utf-8?B?cWZDd2ltNGdDWm44TjV3REdWK3RIM0JLZU9LYThDZ2U2NGQvK0ZNd2M5V0Yr?=
 =?utf-8?B?WGxmL3ZXOTcxMDJJTWlrdkprZEhwYWx1WUJCVnB1VzJPMnJ4WXFubkljd1BS?=
 =?utf-8?B?TitPUXpjRDFhdDYzdWYxaVlGcVRMNm1EcG1TOGNwYysrZ3FqYlZRd1g5ZmhS?=
 =?utf-8?B?cEMvYzdrZzNxL3kySVlTaDNBV0NFU3B0MG1jektyWG5SbWRBYk9BdEZuMXV1?=
 =?utf-8?B?RHlHLzhLR01pN1ZzcFgwN3EvUTBPSGJ5ZnNYVktPcVJLY1NITURjV0NVaVI0?=
 =?utf-8?B?V2VUc2FWbHJNWjFaZEM2RTllOFhHd0RTZmNCS2tEQnNrQXIyS01oU2JzYUxl?=
 =?utf-8?B?ZFM5N3ZQbWZPK3EvMklQZEI2WFNNNnBDTkxTUVBqL0FFZG1pU0FYdlp5U1Mw?=
 =?utf-8?B?NjRUSkZnOXkzcVlxYzhldHFia090RU15ako0RGNzYVpqWFpZa3o4YUZBV0Uz?=
 =?utf-8?B?NFhFdUJQR2hsaGZqbVBHcm9wRkY5L0RCL0Z0TzhjS3JUSVExaldIbGVoejlr?=
 =?utf-8?B?K09GNWoyMHBSSUM2cHdOWnhtSnlneDBBUkU0cWcyS0dBQ1h0VFJ0NFFmQWhE?=
 =?utf-8?B?UWhiN3Y1aHZPb1BTSmdRUFNhZzhUUCtKbFlrRkU2RHlIRlNEeDIwM2hSZXZu?=
 =?utf-8?B?SnRsaDhIcmFzMHV1N3p1ZnBnTXBmYVdCRjlHU1FYNXpHd0R2SW1sRzU2b3RO?=
 =?utf-8?B?bHhDWXlpcHd5dGJ6RVJOM081QU5LNVlnWkp1RnRsaldvbERNNTZNbHA2ak55?=
 =?utf-8?B?VlRXc0pSQnNrdmlvNUN2cmhhcFFGWnc5aG9FS1FYQTNLdmlLVWZCVTVjRUZG?=
 =?utf-8?B?dnFrM3NzR2VKMHVSM1JyT0hpZW16NC8rbzZ4MGlqMlMxMXRNVFRKcWFTNGhz?=
 =?utf-8?B?T0dxN01HVm9VSnM5d2xiekRhWEdmNXBEZ25DZ3Q3Uy9LQkxNeFo1QllEd3U5?=
 =?utf-8?B?SmpiUUcxTmFRa2g2N0I2cU82Mk9BMnV0NFg5WmRZeldjTTZrZnkzMmtvT1dN?=
 =?utf-8?B?TS9lQ3pNS0VIT00rM3ppTmk1VTJ6ZVhpcW1sQm9WZVNNVGx1eFE4dVJCQW1G?=
 =?utf-8?B?YzQ3a3NPODlLbDFVaXVUM0dYTmkvT3hMRDJqUElSR0Q4RWU3Yk9zSWVqejVD?=
 =?utf-8?B?ZkJMZ3UwaTIzc1kzckJ2bWVJSmdRMWYyODdrNGZud3RZMGR1dStSNGZOWGdn?=
 =?utf-8?B?OHVDM3A5SW9ZL0U2MFlpRk9Feng2WklLNlY2eXhEOFpIK0pSNGVpaldGVk9n?=
 =?utf-8?B?WXgwUTlXMGhCSnpCcTFaZE9yYTR4Y1NsS3hxMWQ3R01WUDJPeHJHeGhxUjYz?=
 =?utf-8?Q?Zt4zBc21fSJ7qgM9WZu7VkGAHtVtrEbM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1l0V1c1OUoySWRHTnVOY2tWSjBjbHA3V1RiQjcveERMMmVaUTZ0cEZuRmQ1?=
 =?utf-8?B?Y2FxZWdIT25vUWRqOTl5aEpXdWs2b1ZBZXR5a0l0TkR3Q1dMRUI4aGFITnNo?=
 =?utf-8?B?RGVFNnRVRG9sY3RZS1c5U1dmT2dUYVA3NWhESlZ1MDViZDJva1VtZGRPSzJq?=
 =?utf-8?B?QVluT3grcm1JZGZuOHNqVXdxL3lqYzNxOCs5eks2MVh4VnhPU2FMcEF2Yito?=
 =?utf-8?B?cDY4SVJDOHdZeTZCZjJhUWoya0ZhYzdIWG5jVUhabXR3bGFVZzFuUGtCdEpo?=
 =?utf-8?B?RnJzNlN1SFNGelAvMElZbVU3aEpNbWpwVGFTVGY0ZTVaYmhmU2YvZWEyMnJw?=
 =?utf-8?B?OUpyaXJiZHRkUkxVaGxhMGJldEhsc1BCUGV0dWpzczJYSkJjSzZNZDdWN2hr?=
 =?utf-8?B?N3o5c21wOVBhSUJpWkxuOElmWE9sRFRoSHBaS2NXOFFWdXBFM1JDWDV3RTNj?=
 =?utf-8?B?dnlxZ0FvYjVZVnVEVytxd3FVTWtRUURtVWoySFA0SDNWSS9aQWV1MUhBNVZ3?=
 =?utf-8?B?QVJtb3o2VzFsY3gxaDJBZ2MxWVhQalJ2UFBlcXZKcnhic2U3THJFRE42RG50?=
 =?utf-8?B?ZEgzVnJYRjJWS1hNVkZTaEo0dUZJb1FmenRidUVRdEJPUGRUZ0ZYQVlTZTla?=
 =?utf-8?B?ZU16cDhzcWtFTmRCa24xYStuaXRPWDVxYncxaWtQT1MzTHA4SkhlcVp4OGFH?=
 =?utf-8?B?ekpaWjlIZnFWT214d2R4eU1NUUxBT2M1bFFmcXFuN0h2WmZWK1EvZmdmL0di?=
 =?utf-8?B?OTZXYUl5ZzZVdHJiZ2J2Y3R6TVFHSWtVR1gwOUcvSEFnK1B5SXBoVEpnRG1z?=
 =?utf-8?B?TkdoenRhc3lpU3hLRzNDc3dxbXBpL1gxcWVVcHpZaXNPV3B5RnkyL1FNQUNL?=
 =?utf-8?B?R2o5cDN1V05XKzRNRUxjZWtwSCtyU3JXS2xmT3prYkxhOVRCeS94eHk0U2VM?=
 =?utf-8?B?UC9JalloZzlFUEo1NXE3MmhpTU5paFZldm5vRHdjVnQzNlg0S2JqeXd6eDlo?=
 =?utf-8?B?aEdwWDAxZGJ5Z1BWdGF6b25XOVk5S2JtekRNVzEzdHZYSnZpS0xrSUxnOEg4?=
 =?utf-8?B?cEZaa2ViL1dLNTZvNjhwY1hhMTBQc0VXWUZGSGNLd0YyVjNwUGhHOEc4eTN3?=
 =?utf-8?B?bmVyTCsySWJ6UEFiLzBrRWVYV2puT2pnYms1MUxuVEhIMXM4ajVZVVpCQ2Fh?=
 =?utf-8?B?cWNtK2NkL1p4YzBhd0Q0R3d4WXFoQUx4T2xZbENrMDNtaWVSR3pBeEJzOE9B?=
 =?utf-8?B?enFtdytiZkxGWmlZdjVQcFBBN2M1dlRIMXVEelJqdHp0R01GdkVGOHdNbFZF?=
 =?utf-8?B?NGNYZkw4QklDTVdZaEw0alRaTHVEME5hZWtjVnZYTVdNQnRzeDRGSCt3ZzdQ?=
 =?utf-8?B?RVJ2NHR2KzlnRDZPdGg0U1ZBckNPY01GQnpFUE9aZ0ZmYjQzYWsxdVUvQmVZ?=
 =?utf-8?B?Y1JxMFFCRU45aUFJK2dVa1VuMldFTlg3V0QxazAzc1pJZTZpWHF5NkNTM2Zk?=
 =?utf-8?B?ZVlXL3JOcmxVVEpHbU9GVWtVMTZUa3lmdlE4bVRYTDQvaEh2UFY5dWxZOEVs?=
 =?utf-8?B?U25lVWZOQVVSc0txMnQwODdGN1doSlM2ZXZGN0t0MmtEYVIyTFJFQ0RhNEVS?=
 =?utf-8?B?T2VVSWtLRUkya2lUeEZpOEJkdVE4YklyajI0Z2hFaU5DM0ZxdGJBL0JadHdy?=
 =?utf-8?B?cnFOOUNPMFFKQmc4ekIzVTFVclh3djFmbTZsUFZhUVl0YTVZeWhhaTV3K3Ur?=
 =?utf-8?B?OU9teFRpY2xMR3pBUk1ZTTZ5Q1oxOENuQmY4TmlYdjFWRjdyN1UzVThYcjBU?=
 =?utf-8?B?RUZlbmo0dEtlTHJYdTFRNkMxSGljd08wKzlYWmNGSG5JTzdRVWlLZzJjcjk1?=
 =?utf-8?B?b0l1ak05N2RzS3pzWkx0NGROTy9jT2IxcC96NjdKRzlzeUxMLzhya0Z3Yy9O?=
 =?utf-8?B?T3hRMUFSS2NuVmt3ZlgwSjJheGZMK0U3c3FJdDFYMjR0b2E5N3NPcWFVaW5k?=
 =?utf-8?B?WFNuMG1jSjJiVUpOOUVmL1UyK3JTL2FESk5sR3JUQ3FXSGR1SE1lZWxUNWRi?=
 =?utf-8?B?SDdaV25MZFBqYlB2NnBmMWxLSkl1MVM1TEZ4R3hFVS9ZeStpS0dWd3dFdHJi?=
 =?utf-8?Q?52i0rWwGVxxQReN/T7Ib9DPil?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda8fbb4-9093-4d2a-793f-08de26db2da8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:46:34.0048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOTl70/td0NK2Kp+Z3KEDBP7ST6JrNjUgc1qxdzE04YjVmEieIH8saeekr8WmSuMaz9jVmWmfRAjHB/xpLizOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
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



On 11/18/2025 10:08 AM, Timur Tabi wrote:
> On Tue, 2025-11-18 at 22:04 +0900, Alexandre Courbot wrote:
>> On principle, I tend to agree. In practice, we will probably never have
>> more than these two variants, so we need to balance the benefit of a
>> trait against the overhead of defining it in the first place (there are
>> quite a few methods in there).
>>
>> Trait objects come with their own complications, i.e. you need to store
>> them on the heap if you need more than a short-lived reference - but in
>> our case the short-lived reference should be what we need anyway.
> 
> So I would prefer not to rewrite everything, especially since you did tell me early on than an
> enum was the right approach.

If you see the example I provided, you can still keep the enum if you
implemented it with traits. The trait is on the inner object.

Thanks.

