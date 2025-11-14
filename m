Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3294BC5F9D9
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E43510EB4C;
	Fri, 14 Nov 2025 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uZVBtmWP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB3D10EB46;
 Fri, 14 Nov 2025 23:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL/1JhV83loEgJ0/uzeMBHsQAnMFDlWf7HHWiqu3/gkvluRnNIF4owBERt2DsSpQGIE9psYENWWjZII0mhMs/NUDsKHbV7nA11F51h3LCTExWGQBOMO6UUp2c4q91DfW9A/HECKbg10FvafNuUr7hTu48UPumYjsyyBs+AfjVJ37R7yLhXbiwUJBBMXldvkbjzhVK2QMV+M/okWqcw2Xhl8vq0BvF7mjeMzKU2JIqWJgIxupvwSLARHtULZmlx5Dovo06CDyPTsGKqPH0RohhDIrbSZ3bmwCOWS5W0MpVKxeESZ4CilJCD8sVypwsb/yTmZyPREphLNZSjpjtvE3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZuS9qeoTNaFa9c6Djhc4hW1pTalxAJSKJMGNMo4yIU=;
 b=E/7P26x1iI8daHiYByhD0PP64p4VxB9qWZt1hi0zjF9qZNnPkG8s6bt7JPXIvOesoz40XWWq7ARBpUZUpP9LvLu5nUKOrjBMBZ4wCxIBAHV1ZWmFx6Rg6oVmRwBtr/8ZAAeqSRz0ET9hhmAEXYLbCncRkUuU8Riuk7XLqrSlAV9j3rYxpY1H7erT1XTD+pb93J+k4QuuvklsRMg77ytr0gqvLta/+P+Em3SpyziDsu347c/yCm2Csi1q+yDhFap6g+GMb+8lxZ9Bf7tFmGXag+jdWElp3fg41u00+A1HuNSuESc/n+u8gSabPQSDIOiuAhwIsiP7rREA7YRW7yaWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZuS9qeoTNaFa9c6Djhc4hW1pTalxAJSKJMGNMo4yIU=;
 b=uZVBtmWP2mbjgFFRmeJGHpyhoMymwTwc7cCAGkfs+wqtIkxUBrGGsjyyrX/rUWbpbJvzMiVUfpp3BCoFtIk/4Rx0YPN+8ZCC3zIr78wHYibivkUwTEf4iIG0xsZjraQY7XNDTBJlSdMB/MsbcAIIjD7tt4r+i+tVjxl9tPML+GQUmbHBQjheo5EmBS7ox/SlES87g873dM79lkh+UfhU9gvENfocdFln4RYFAlQHCgOjbytx+4kbCKMSvTaaCI06W4IYBq+2IY6e2/+V3QJzD3D0vOUoaC94Tgnz++CHjkcDvnmZ31nUhfHk+rK+kVjiLWI3BFuwjT9KamRtKtZKgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:42:00 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 23:42:00 +0000
Message-ID: <f975bf41-fb1f-4429-9a4d-681aee10924a@nvidia.com>
Date: Fri, 14 Nov 2025 15:41:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] gpu: nova-core: use ENOTSUPP for unsupported GPUs, 
 in all cases
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
References: <20251114024109.465136-1-jhubbard@nvidia.com>
 <20251114024109.465136-5-jhubbard@nvidia.com>
 <DE8ICG1D8UN0.33C679TUWJDOR@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE8ICG1D8UN0.33C679TUWJDOR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0037.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: b3305312-7018-428b-c9bd-08de23d767a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnFQWU9ZYW5RRTQ5WmlLVTdjYzVLdW1ZbjUvbEFBTlNnS0FLUlcyNDhqU0JH?=
 =?utf-8?B?emdubm8yK25VNnNXMlNtcy9KWkhFV3RVNjJMYk9yeVlBSG0xdnJkYVFwdjV1?=
 =?utf-8?B?dUdTaDhmODJzUXZDUVo0YzAzbnNodWp4c1M1V1ZmbnNndnc3c051bnhVV3BH?=
 =?utf-8?B?b3Z5ejlpeEpiOWo2UElVNXE4NWtJaVMwYlJjNFBobG5RTU5NMENJQjJqbGE1?=
 =?utf-8?B?ZjZ4ZFVaSGJzSWlPZTBkOG5aWFp1V2lwU1VrQ2p2OFhFUHdSZTFpUHN2Y0Ra?=
 =?utf-8?B?a1REVVVsQWljSmpKRDQ4dDRmektMazdpd3Rmd3lqNEdNQWVPTUtSbEFmTWkv?=
 =?utf-8?B?WWpuQTFXWHhxVk4xUkNnNS9PQjVJVGZLZXFVWitqOWY4M1FFYkxsUXZtMzNL?=
 =?utf-8?B?d0U3dCtoT3BDQTQzQWhBSm0xTzV5YjJwUmZLaFVyNCtwZ3FVeXdqemdEbHBj?=
 =?utf-8?B?Q0JmR1RvdHRtWUx0SHhJalhPYkZSckk0MGpueFJPQllneVZ1L3FpNU5xeVZl?=
 =?utf-8?B?dS9zdnNuRWdkeUJwSExnZjVhWHN3dktVL2s3Z2pHMk5JVXJUay9VWlhkd2tD?=
 =?utf-8?B?T3RjaUxIcGFubVY3MEp5TTFrbktEVTFWR1J4RnZ6bk1DV0tsUjc3NGRtV0xy?=
 =?utf-8?B?Y3B2WWJnc05EWmJOS2g0TG9oTTFUOFdOTHNiK3h2d1Z1a0U4ZWZUZzFsekl6?=
 =?utf-8?B?OXBXMmtPSnpDR1gwRnVnQnVwakNicUY3K0k5MUJtTkgybTgzNnRXZWd3Rkt5?=
 =?utf-8?B?SjZubDFmQWl0QVJ2a3pKdnd4YTBuaXVFaTBubzVaeXlOejNORDZkTUlmcmo3?=
 =?utf-8?B?UzZlQ3QvRlBJZEhVSmozZERxR2lGcDFuVlRaRktKSC9tRkYvVVhFNWUrS01M?=
 =?utf-8?B?VlZnb3hEeTBqNHZGeTlLTkZuNDNQamVLYVArMkdteVJrS1dFeHV5ZGNPWUw2?=
 =?utf-8?B?WlluZlFML1lKMXU1ZkI3U21qNVdBaUhiYzdUd0EzK2dzZysrck9OM0QrZDlR?=
 =?utf-8?B?S1FDZGJ6TzBQZWcyUHJ3ZzFjM2ZYZ0J2QlFmT05nS1pacWwraFgwdWN6dG0y?=
 =?utf-8?B?aG1VUW5rQyswZE1qdllYa0JDMjdtRGgrLy8rb05wcHdnNGUwcTZrRVY3ZVU3?=
 =?utf-8?B?aHhWUUNHR0d2VmkzcWhVSzhDNng4WUlUa21IY1FFNVJzcVNXREU3VkxRQlYr?=
 =?utf-8?B?NHA2MmNnaEI5ZWh2aVpIUEgvcXE5NCtHbzJXR3UwalF6OGVBcE5xTURsOFYr?=
 =?utf-8?B?Wm01WVpOZEU1bTB2Tzhielg5MUtQanhwSGM1ZUFOdWJ3RGY1MlVDVWdEcWIv?=
 =?utf-8?B?azY0eFRMTElzMmk5U0NIT09jL1gyVFBxZmQzVEc3eGpxS0l4M1JqYzVENkxy?=
 =?utf-8?B?RnBUK0hjTzlYZUcrM0l1VHhrU3lTeml0V3daR1liOG54TTRwN1NwNlNVR202?=
 =?utf-8?B?ZWZCQnQ2bG5GQVVKb2dtUWV2bDQxa3llT3dCcWJNVmFsTG1TZ2MxQjFBbnNU?=
 =?utf-8?B?Y3hTd1BLSHJjWU45azdMN2NDOE8yZG9vNDFiTDVoUWd5ZGpvc1k3Y2dUTDZo?=
 =?utf-8?B?TjZpeTF0em9lUzFyeWQzM3JBaURnMEVrcTQ5S3c3TXJSZi9nc3ViOTVrUUQy?=
 =?utf-8?B?K2tvazZzMGE4NklqNjVXS1RCMVBnbXdDT0poV3ZJYkE5VFRIa1hJZENJRXNZ?=
 =?utf-8?B?cE1PMVVqUlhvWkdvZVgxTisyN0M4d2ZVUXkrTzM5cWhpeTBvQWFZdncwdUFU?=
 =?utf-8?B?VmlaRVBMRnJuY1ZBcFhnYWJpZVZCQ2xTSm9hZldSUFlQNnc1T0wyZDExbjJH?=
 =?utf-8?B?a014cUhpOVVRQ3A3em8yeUJ2NjlxaXdPUGdxdjcyTmtncDllYmtveXkzQVkw?=
 =?utf-8?B?T2U0K3NjSWJGMGowL0VISnQ2c3RsZlR3SnJWcm1SQ3YxbkwwMzBWSFVMUC9a?=
 =?utf-8?Q?FxSaK+PCFT4wWeB4vCti6oz5ub9TXRCQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEU1YlVEbUlOektWLzVOYVp4cVhTeUt1eVpraE1LZjRzU0l1bTd6cXRlVXYz?=
 =?utf-8?B?N3lNUlltRENRWFQ2WnF6cHpSK1lYZjNOQkFTWWRGZUFBOUttUkVUdE5qYzQ1?=
 =?utf-8?B?TDFtN1F5K2FWb2VPZGtaU1ZOakgxZGNlVk1KVlE3aDhZWWVTUGd0WDZoa01E?=
 =?utf-8?B?czg1VC9tOXNWeHNzL1FyRUw3ZjRWcVI3R3FDTUpNT0RvZkc2S1UxVUlyQ0xM?=
 =?utf-8?B?eEo0ZTJXdXBtMHl1OW40a3I2U0Z6Nk9LcTNmWVFPc25DY2wvRXFDazBWWEU1?=
 =?utf-8?B?aDQ4dGk1UVZodUNzSFFuNlk5bXBUV3o3RnVwQVdLQ1VvV1YrTUdqc1pvTW1k?=
 =?utf-8?B?b1JnRW9jaEcwRjhUc1lkZG5ob3FBd3Y2dDZGVlowOVhwU0ZpbDczUG1ETDZN?=
 =?utf-8?B?ZXp5amVpS0F1c1VyL1dyaFprNXprcHkxMzc2bXd4YzZ1VDJ1bEd3aEpJeUdM?=
 =?utf-8?B?RjArYjRHb1RLZU12UkFMTy90UVNBNFBsVCthZFRQSEgrNCs4T1pPU1RzcW5t?=
 =?utf-8?B?T1BtMzZvOEk2eWdDUDErYWNDVU1HaWhwQWY0TGNITXdHWjFVSFZrL2kvVnM3?=
 =?utf-8?B?K3czdEZ2Q3hzUldBWXBVam9kc1lHaFJkTGdsb0t6YStRSlRnTDJiMHBVSHpW?=
 =?utf-8?B?RmpkQTlrYUV2bkdIczM4cSsvTTc2UVdneHZ5cXRNRkpWdUJQK2cyelpuSVQ2?=
 =?utf-8?B?VFg0dThjTFdyUExzWHJ1YjdxbmR4Q1lzOHc2czFidHZWT0xKek04aldQRUpk?=
 =?utf-8?B?NytoSldkM05aN3dhTWtVU1J3Z3NMQVBoazdyNWNxaWZ5RG1aTzlJMmhwdTBN?=
 =?utf-8?B?UlFSc0dEa0w1Z1M5bEl1eGdyVW51Y2JhOHdmZ3NnN1VrUk41SGdoNVNIN1dX?=
 =?utf-8?B?cWFpU3p4bTBWWmFtM3d5Rk5xY3Q1NG9JaXp2QVlqTlB4bXliNFhQTVRuWUJx?=
 =?utf-8?B?RVBxeGE0Yms2TUx3UE5MQncxQ01WT3Rrd2xiQlFSSzBNOGgwU0RGcFoySmRU?=
 =?utf-8?B?MEo5K2ZkRWRTaEpQVktxazR1aWJCNmJ4QnRtVTRSQndiUkFiUnBUaDVKQ3dw?=
 =?utf-8?B?ZVhBT0FKemcvaWlMVmtqVit6MDRsN2hmbjByZE5XSzJRQTcwS0YwVm53d0pw?=
 =?utf-8?B?MkZuK0loWUNhS3M4MXBrTDlwYndhNE5Td3I4U3o2VXpKTllhTzNnUFdiTE52?=
 =?utf-8?B?MDEwczN6Tjd6VnpMWDAyREcvWGpmU0I0UENEa01MVjdoNHl1UVhvazZERG1F?=
 =?utf-8?B?b2FqZzNHSkN2ZWRPNm5OTTBzczBCZTBwdko4RG9EWTBMMHV1bzgzV2pXQzVm?=
 =?utf-8?B?NjY5TjBoSjNiS2dWbzhvampNWTM2ZTYyZEtLNU5GeHcvM0hPbDVFbFNRdkE1?=
 =?utf-8?B?NmJMbWVLME54ME5TN1RXUSt2cUJKUW9tRzV5Nm0yN0J0VUJuWUVYREdaNEd1?=
 =?utf-8?B?RTM0U2lBNytqZWZ4a25VMlNSdEVmL0poNEp2VUx5Z1pLbHJoOWlkdkhaM2hW?=
 =?utf-8?B?YzRlQUFzbnZ6Rk10MjhwV0ZFcW0wbE9XVER6WGlCMkZ1QTZUaVJnYVJFZ0g4?=
 =?utf-8?B?azV5aElTRElqU21jeDJITnJsRmxCK2M5RUVWT3RVdDBma2NWUis0K0dPVDJM?=
 =?utf-8?B?N3N1ZkdSeEViQ3hVU2NBNVBBZysydFBDRjl3L2IrNnFYcmNhZThFdEk5eUM2?=
 =?utf-8?B?VTdWQlhTKytWYlV5cGtZYTdEWEM1cWMyMTZjTks5OFhYNVNrWlhYbUx5d0Q1?=
 =?utf-8?B?TGIzNzZMbWxlaHRldmRNdDBXNGd0V0E3UTY0NW9jTkoycWEvVTBTNXVTTm5L?=
 =?utf-8?B?R0UrR2JzejNCMkhEbDFZRVBhSXo0bmJLdjNmWUJaL1BsVlVUSXJvNU91RWNw?=
 =?utf-8?B?NjNpcmRTRkJqTXVGd1Q1alQyUkVMVzN3dndtdW1KK09jNUlSYWdMOFB2SkhM?=
 =?utf-8?B?bFdjemM5bmJVTXZBdEhGR3pXU2tzSEdpS3pWQkhNZjlhZU9adlpRS3NYa0ZR?=
 =?utf-8?B?L2I1dUxIdUhMTVZhOTJzQ0JJZ2xJM21HNW85RnVFTlB5ZXV5UGVOdWlvaUl1?=
 =?utf-8?B?WVhmaytrcmxMcTdtbHhlaU5LQjQ5cHE0dmpYdkY2My9MNzVkeVVIQzlYbEl5?=
 =?utf-8?Q?IPfTV/sO0QV7v4sFmwi8OXDVi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3305312-7018-428b-c9bd-08de23d767a8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:41:59.9066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA7m5++mQStSwc7YQBLtqYKKvHp0yUcbIsPFMF7qxaz31/KNfceKHP4KODkjoCRCz7F5H5VGKitnBNxlETQSQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229
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

On 11/14/25 7:03 AM, Alexandre Courbot wrote:
> On Fri Nov 14, 2025 at 11:41 AM JST, John Hubbard wrote:
>> Some places in the driver use ENODEV for unsupported GPUs, while others
>> use ENOTSUPP. ENOTSUPP is more accurate, so change the ENODEV instances
>> to ENOTSUPP.
> 
> Mmm actually I suspect we do want to return `ENODEV` in those cases, for
> the driver core to interpret the error as "I reject this particular
> device":
> 
> https://elixir.bootlin.com/linux/v6.13/source/drivers/base/dd.c#L588
> 

OK, so I guess I'll drop this patch and use ENODEV for this situation,
for now at least.

Later, separately, I might just go on a tiny crusade to improve the
driver base, such as:

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 13ab98e033ea..100fd8886b8d 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -588,6 +588,7 @@ static int call_driver_probe(struct device *dev, const struct device_driver *drv
                dev_dbg(dev, "Driver %s requests probe deferral\n", drv->name);
                break;
        case -ENODEV:
+       case -ENOTSUPP:
        case -ENXIO:
                dev_dbg(dev, "probe with driver %s rejects match %d\n",
                        drv->name, ret);


thanks,
-- 
John Hubbard

