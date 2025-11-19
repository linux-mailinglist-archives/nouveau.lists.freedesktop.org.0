Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A463EC6CBDD
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 05:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA3B10E56C;
	Wed, 19 Nov 2025 04:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qu2Ka3qp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B4F10E56C;
 Wed, 19 Nov 2025 04:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaAy/7D1PPINnSvT9VOy8tqMJPh7on64Nj0JJejjUm2udm8OP2biT37cnFC048auvQ4n5XKDYK20H7pkuX2ormsLp6J7zVqDusvyoNDAKM6rXcrnOqgJlE5ifBi504tHiiVu1p+UBlLo359smxmmoMtnUurWoqD8AmPSrKau/vv+9yKUwVW2fccvDYa0jLGJcvExvB81yDsO3IyltGEIjaC3/kRvrH69JG5FbgIKQgNeQDUrDhuuDFKbULZnb1Jg78emHXK6G/oYqgldrb8qA5PhTfX1C5FkbnEPuah8YvjJR0c/Hc8t1ab83ghDcgrK3xDuVlV2KfRfkVLclq4kfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YICFqp9g2rKvWqg88a/eiXYLwpW4/YRHCfE3eVGtp3s=;
 b=A3NRT3bcLkW9Hyo3YXPM1ChIDcbipzFTdmWpc4T77QZ7gQ9ba4HG8OZQ8py+GUq5djGJWR+J1M3iduBzFWkzfX3Su2d0WfFqekVIHiWqDfOT5uW3+xZCBCsdh/B4QdQPl/xd7tRviaiuzeqftE+opC21YCJBUTTld8z0SJz8uDGA2MVfrq+pG4M9WZTYOJv4CQ9+EDC9PKuKPSbv+e5TYgR3cP/lBLz1Fo2yKkOIYK7rSdAdXVrG8hFm1RyVgNZPKSyXovcBUJC2s/lNBZ+LbH3Me1DWvlNxNWjseCb4ERLGomhjjT5XKYcRXOB6lAxhvT4/gwxLNK1ALIlz2rHxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YICFqp9g2rKvWqg88a/eiXYLwpW4/YRHCfE3eVGtp3s=;
 b=qu2Ka3qpzD/V12CTHzPNa6g3lrvHng9XsrYdYS1wDsAdNg7XWtJHxAvdXjpd4R867uay6j/AfeyfVV0q4j/QhKo9m1ms2TM9/DVurPnGA2Xqk5zjAGZn2NzdaF4aZ90e+XKTxsFhNgqHn+5KchYueG2xRxcxDZ6LnlLeHxvpFwZdcizU978bpDYmITP1kZEQRQbi+0blW/ur1uiDxRPnzfHajGj2ln/2H84Hr83/OVQk5PQffKCCtNWf6wx2VBW5F4YSIu1Z3LK48jDFcGk7E+LN5yjdFud3ovtf/xREvvFIKJ5OIriH3+3s+eRJgyMsJz7ehQM+Ols/WwGwkTY8Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:29:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 04:29:04 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 13:29:00 +0900
Message-Id: <DECDZGMVB5DX.DGX2NMWAQOSD@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 00/11] gpu: nova-core: add Turing support
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-1-ttabi@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:604:9b::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f3db70-65a1-4c76-8171-08de27242bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHZDQzhHbG9yU1hFYnpuR3lPWTBjQjhWU0Q3OXR2VTJpQzM4eHJPR3plcUZW?=
 =?utf-8?B?VzRJYTR1VHNCZVVMRzFzMkNZQ3JkcVBvcEFodDA0MVVqdWh0b3dOYnphcnhK?=
 =?utf-8?B?Qk9zYllhNTFGSHg3K2xJc0EzVGlnNnFBS2hLUlhnTUV2bEUrTmpnVkx5MExR?=
 =?utf-8?B?NFNvUGhoc2RCM1FmNms1VmVCN0FVVytIZFZDMStiUmdyQ1hzelZuOWlMMnpk?=
 =?utf-8?B?NzlrdE94U3Q1L0ZsMWt1cUpoSno3SVk5SmpQbHFGTnlHcm9pVGZ0U2p5SFJa?=
 =?utf-8?B?ZURIUFJkbkJ5M2hiWFBMM3dmK1p5ZEVuelJSaStUWWF4ei9JRzFOL0Z2NmJo?=
 =?utf-8?B?RTdaOVZOQWRGUkluMmNZYnczZXZKY0kvdHpvdWJISHRabGdXUW1CMU1JOU51?=
 =?utf-8?B?MXpLQkFCS1dWVnU1TW14dm1ZMGdyMDk5bUxQUUN5dHBjYmVJVWRQWW51cDZC?=
 =?utf-8?B?eHIzUUZnbFRzcjFEVVd6em5id3N6dmNFZ29la1VPa1FVcGh6c0phUldYVDdL?=
 =?utf-8?B?Ukw3cVhNZHp3Z21Td040b3lCSU8va1dLbXpxdnIxNUtCNCtuSTdMc3E1NWlI?=
 =?utf-8?B?TjlyM08wNmVWUmVTR2pwK25kMTlQMXFHOUJ6Q2Z4TkhpK2tWSWZ3N2dnbmZi?=
 =?utf-8?B?aG1SUjhZOUFjWGNpVXRVbjRxT3h6ZWY3VVBsc2xGN3FuYytUVjl4dTlTcXRU?=
 =?utf-8?B?SzJDOCtQNFgzNERZaDNacGJLSXo5dUtyejhpczNlMTIwVVVoVlUxTDRVY0pN?=
 =?utf-8?B?VXYyb29vbEI4aDY1Z2xaTHFaVjRHc3NjeHVvKzl6TTcyQWlqU3I4cXFnd05D?=
 =?utf-8?B?K1NWTEhqbUd4YUQ0cnJINkJMN2JuZitHcDJFSENvbWpxOVRuL1VqTE5WRk9D?=
 =?utf-8?B?MUh2MzRJemRscGxHcnl1YXArWUIrY1NLRlFPQzlUUTNkN1JnTVo1L0luMmlq?=
 =?utf-8?B?OXVrelBOb3JWMnZtTk1Qb1VHWTFMWGhDUzM4SzhDcWFVcDBITjJ1aUZ6Y2tG?=
 =?utf-8?B?WmtZUGczZi9hWWt1S2tidzJoMiszZlErT05NNWxtUkxtSnVXck8xdnFDQXVh?=
 =?utf-8?B?YnIwVmFCUS9zT21PQlVnMTBoci9RdlY3VDFLcUEvZlh1YVJCRDFKbDNyNzl1?=
 =?utf-8?B?THBMbVJsUlJBM2pPZ0ZqdVhYejY2MEN5QVVUQWFqU2Z3Q3hKMnZVYjgzQ0Fi?=
 =?utf-8?B?cW5lb001NVVaeUkwRVRoRUtGejhIaFZLVmU4VmVLM0dteEVxdkdJMndRZG1r?=
 =?utf-8?B?TGJYNnFoZmJNNmNpRjdVQTRadEhzd3JNZzdrT1RBWWZ3RVR2K1B5VHIweDlL?=
 =?utf-8?B?K3BXVWJwOTJtaWZhZ0xaM3A2QWEzcXhSTlk0aTFoSEt5bFMxRmp2NFcyL3o3?=
 =?utf-8?B?M3VqQWpQNG1Wa3UrQzRGRXg5cjBQc2tvNlErSUdkOVZWcjR2TklpL2pZV1Rw?=
 =?utf-8?B?UFlDWWxvZ0JSSDBDK29GM3J0ZDFYbVVFc3d0S0UvVGNibEkrRmhsM1dQbWxq?=
 =?utf-8?B?OUZsQmZhdTVFcWtEZ2cwdGc4ejZ2MElzMGdKSldVbng4d080dVJ3cmFlU1l1?=
 =?utf-8?B?blo2VTZrV3RCcTZZMHhTM2YyWEFBYWZoVHAxaU93MmdBdmVVeFpGNXFjUnB5?=
 =?utf-8?B?cWthN2tNN243Z3hYNUNBTUxHWmZ6S2ppYnhadUxJVEQza0luN3J0amFXNGVX?=
 =?utf-8?B?aWEzZzNDeDM0SHhzTi9HT2pDMkU2MldvbmhJaDl3cG81U3ZwSXMrZDlMQ0Ey?=
 =?utf-8?B?dk5xTkV0ZHlHbC9hMG9wWG5CMkx0OGVLMU9KZkphN0lxM0k0TjRLVXZXL08y?=
 =?utf-8?B?b3E3eXhONUhlV3ZrQ2p6Y2lnVThvWlZvbkwrWW1HdmdGakg1MWxTYmg5K1VU?=
 =?utf-8?B?M3lsTUdxSTdxd0Eya3RvVWFxVTVOaG5LRGlON0s4UVh5b01JeVA4aEdvbEwy?=
 =?utf-8?Q?lXx1PHOsB1tD/VUyTzNigUkx7M7aX5+o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1c3YUpCL1lDNVE3dzJSWStJUldzVGVkb0NrbE52eUJvalRnb0lTL1pUbVZk?=
 =?utf-8?B?a3o1a29FMkhPWFVsZW9IMnhEVms3VFRCelkwNFplYTRMaUYySGVrZnVuLzh5?=
 =?utf-8?B?WlRoZlkwMUhEWFpUQ1JydXRQSWlJT3FDdVI4a1FWbnBCTjNEVUUwZ0JWdTNS?=
 =?utf-8?B?M2RRN1ZhanBjZmkzaHc4MDgvRVJEbTRxaklYbURyYjFxQytCZmNhM0xxZk9Q?=
 =?utf-8?B?NFNFRUk5NjZ6dEt1WUFaTHcxSnlhSmZ1YXFMYjJZc3d1elN0QVdHL3NIQlg3?=
 =?utf-8?B?UVJjcnFZb0lCVEVhMlJLdkNjb2p2Rnh0TktwWkRpUHpFM1EwZkJSb25DZlBX?=
 =?utf-8?B?c2JGT1VzSUFUWWd3MnJxbm1iWmpZNXR0RGU5Rk91aEh2QndqQ1hUUXFPM2dM?=
 =?utf-8?B?QzFCbHI1OXdHS1h1WUtVcmo2TjRtL3dWRDk5ZnJVMG5pRC9yMXZrdEorbUla?=
 =?utf-8?B?NzVSSHNLWXhKaHBXNU5XQ0oxMmFxWVI0MS9XdFhuMzF6bys3dDZSL2xkeldw?=
 =?utf-8?B?bzVVcGlyZHVCOTlLMXpWemZuV20zTm55dXRnU21uUm1PUE5Bd1lhSnBKeDRQ?=
 =?utf-8?B?NXVMTGQxbVMybmZjMXBYZ2dER0NuYnQ2TkdNTXp3aXNjeU5VWHF0eXV0aTc1?=
 =?utf-8?B?OVlLckk5VVpXWDBxa1lxSGhURW1JQ1A1QmMyTWFOeGRLZmhCOXRCMStjV096?=
 =?utf-8?B?QmhnWXE2R0ExcHh6QU5aWTNDSlkwV2tOa2tKUXluS0JuSzdTUDdOTVB6Qksx?=
 =?utf-8?B?eWt5d3FMdWQ0blBaYnp5TnVFQTJWakk4M3RBRmdBU0tZMTdtVWJtaTd6dTZL?=
 =?utf-8?B?L3NmZWVZTFhKOUVsMldxS0pkSVQ0VWVJWkgyNVdpK1ZXc2plbE5TZWNNVWpX?=
 =?utf-8?B?YjNYU0NzVVlpK0E0UmRrNzI1RHNPMVMrYklrdTRRTXZCNDBkSkx2NzRlWUVw?=
 =?utf-8?B?ZHlJeEMvZkwzK0VaZ2xhRHhQcVZFZDFvQ3pHZ0pBY3B0SUlwa3R4RVR1amFJ?=
 =?utf-8?B?YVJYSjJBeTZDaDJiRTdaQytTcmJoaW81eW42YzE0cS81UHpkNjdTeWErUTBQ?=
 =?utf-8?B?V2tWZGxmcTZTK0poem5ySzVTN3p4SU41SUZZR1Q1b3JsdmNoQjZwRksxczZ2?=
 =?utf-8?B?dVFuVGVDSklFTTRFdXF6VHdwaGd4TVo5cS9oUkFYOVdtMDNiRkltUTVIN1NN?=
 =?utf-8?B?R01QYkQ3S2tGcWN2VEljbHNpeTZCRkNDbFVxdndFYklPNEJJWW1jT3lDTmZp?=
 =?utf-8?B?ZGNrNHZVK2xyNmJkU01oS1JSdUR6N2VsTVJEV0taVDZPSnM1KzBleG9UdGxw?=
 =?utf-8?B?N3F3RUNONFQ5ZjNyM3YvU05IK3VEVTQvaU9zb21HYVk0SnNEYjA3WEZrWld5?=
 =?utf-8?B?VVpjTzc1c1BLc2xEb2ZsNVREcHFvc1FJTUtkUVhsNlU4aUtmSllRUjd1d0dx?=
 =?utf-8?B?VmplUTJBeFUzeFBtK0Y5UmhJZndGS0FrTWRzM2ZMQW5JaVNLODRwUXBuZmtP?=
 =?utf-8?B?U2Y4Zit6MDJUNEdsbjlpeTJnYWdraXdsc1cybzlReHlaSEFCOFAyK3B3NG5i?=
 =?utf-8?B?N2ZlZkNLdW1EUWVJVElmd2h5RXFGTTdoMVk2RXJPYllLRkh5aW1KY3dWeGV2?=
 =?utf-8?B?YndLbmdyZUV2STNlTllWUm1OZTBMTzhZRElPdU5zU3NySDF1dy9wRTRKL210?=
 =?utf-8?B?QlBKcjZaMWRJdTNMeWRucFNrTmlWZ1R2NkppbitiSmhzUUNoRExkaEJOSjFG?=
 =?utf-8?B?YnRtZnJhTERMejZkZ094MnUwMHhNbDgyOUwvOWRJdkFLK3NYZktZeUpCZXpS?=
 =?utf-8?B?NW56QjBEemV3S1lIdkl0Z3pQbFIrYWhielVqUkZRamFyeURYK2ppRFU0a3Ax?=
 =?utf-8?B?YjIyMmxXdnpvTG1sZFN1QkN1V2xDQ3NDKytoRUhhdjFNSTczbThieE0rQ1By?=
 =?utf-8?B?dWs1aE14UXFkK1V1akRMcnh1TUhhMno2ZjZnbWdxdmFjRGRWSGFSQk50eWRZ?=
 =?utf-8?B?WGQ3SUQxaHZxamE0NlcxVG1KQ2lEbGw3ZGZ6dkJaT2NydExTQTM2SUtwL1Uz?=
 =?utf-8?B?dCswSnZITnVKQVBvZ3k3aVhtU05lUXZLQmY3NGZjY1NSYVZhQ2QrOGQwY1VZ?=
 =?utf-8?B?UThmOWFxNk9OUDhXUGNQVFBvR1RHNjZibzJjVUxGU1k3ZkJMaEVsbVpEa0xv?=
 =?utf-8?Q?zpI8weIOmQ3GkW/leN+4QUT9eVvvhoSxI54+uzy072Sx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f3db70-65a1-4c76-8171-08de27242bf3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:29:04.5315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tweXNF8Vv2Jzub2VSXII/Im+DAE6r3ZpNnJP+tx6EBgM7ZFIxhYtcAM75uTT780dgo7FnbNWnG/xAuqi7I20A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001
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
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
>
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
>
> That latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.

Although I had quite a few comments, most should be easy to address and
I think this is looking pretty good already! I am particularly impressed
that there was almost no change to the boot code required.

Two general things to do for future revisions:

- Make sure all patches are properly formatted (using the `rustfmt` build
  target, or better, a hook upon file save in your editor). Doing
  `make rustfmt` on top of this series results in a ~100 LoCs diff.
- Please build with `CLIPPY=3D1`, this will perform a first pass on things
  that can be written more idiomatically, and a clean clippy is a
  requirement for merging anyway.

Thanks!
