Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E7C5AE49
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 02:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906FB10E958;
	Fri, 14 Nov 2025 01:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FxpKa8FQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB38F10E958;
 Fri, 14 Nov 2025 01:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k83uiEf/GLNtBAKzv/+/5+/GggwMP1wWtmwQjvzCgJQ91Vkm8fWQbeDVuaSvmLegWzaRiRK/QuuCl1eWr4avW+tm5emsXtRRcqFCdIoslVxXFyBvcVQvNyFJm54Krttn4+YrskzepyJET2pxWdefkhplHXufb2dxaqiEM/V7nyBMS7JZQzDmNMHsMYb1SEq135nYQoAECOuALjKWExn3SDEQ5t8sTCOev71l/Y8cC0W9jE1i5Ym6D85ZCgLVUzDLF+u4ZxM9VWigUydKZE2u6KWgfTXYM8nGT+pd0RBriuRv8clhs0HukLJMimcDaCvvdeuiQ3W9XMuiZBzfm4kpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoNAFQjgdu/55sExJfo6gXM7BLe4vJ0FMfjtfcj6K5U=;
 b=gObMLitYplh1hM+h1sYZBXYBjUZvXvAci0/38VIAcmWTSYl6JHgszWHT8c1No6AiQVMpBcT9MnX/80WXrUF5l1SILYh+veuIZE12Qv1nRckD+Pr4sEJzX3XaNEf94wBkkn0eIwezmj/AAytKpzMhL5IrEMFlKJN/5d4cyvK9EwQyxgZxf6Gd1EyHufn02X5vVU4LqrXIYeqCiTBxZSdey4jbArx8pURDeBE+TqzMbnIDAdT6bEc1tcIl5C5MDvWi2eQ4/4jq/RE/n4fIz3w+5LJhroBisZnbLZs6DL4MsVI7L6vjuM8AUH8kgMtrxv9zI3mZxQSsD11mMdZy9srOCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoNAFQjgdu/55sExJfo6gXM7BLe4vJ0FMfjtfcj6K5U=;
 b=FxpKa8FQomRL8OYFpYS3ivbfFYnQshOukReRxlylY+oSLKKdWZ+7F+evrz1HArKEBjsz6gwmhLleSu7A8bnkb3GffEmwcn7D21RV1CUC1C00wRGRMxdujp4mYAjIRlTl2gXBid6tTrssoBWTpYfLYLiHWmlmr0eWnY/P3lKV91M3dHQ2fHJZ33S4YigSspJEctADwj066cZBstwQyT3UeKbqcWT1veE8rw00aRo5G1gjSSGgyg6fhnJpINbbZjFhc3nYSr2GWnO7J8puaG21J8PRWl3MGrnxmreOPnyWZILTMXAEOj517MYb/zs1XNhMoFjMQMyggx9BjrWG1Mrxlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 01:22:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:22:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 10:21:58 +0900
Message-Id: <DE80VIWX6W4T.3GFVGHVWZGGEP@nvidia.com>
Subject: Re: [PATCH v7 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251112043000.83071-1-jhubbard@nvidia.com>
 <20251112043000.83071-5-jhubbard@nvidia.com>
 <04594008-7b83-44bf-9e60-930a673dc2ec@nvidia.com>
 <4b3badf1-e3ec-47a9-b90f-5f13234afd5c@nvidia.com>
In-Reply-To: <4b3badf1-e3ec-47a9-b90f-5f13234afd5c@nvidia.com>
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 8283ead6-c3f2-4be1-b143-08de231c366c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXhPdC82YmhET1JibWJZVTljczVML0ljSzROV2VnTUtNNTVZc2lMQXVPb3Jr?=
 =?utf-8?B?VFpvcXF0anhIZ0FJd0Rlb2JjTHVJUDloQzBBc2tCeUUrRnRUSlpxUUJnZ1dK?=
 =?utf-8?B?dlJzUllYS0haS1AxcW93YThrL3h4bGQxMVlGUE9PWmFHdjJRNXRwYnhwRVB6?=
 =?utf-8?B?cXAvRDg4ME14TmlHOGlYMmlnQ1lIcWFYcTdjbytibU5ITzFxakZNbGRtWWlh?=
 =?utf-8?B?eU9ENmZIN3JBOEl5TTU3V2hFOXMya3J6MGkyaGYvSnJBZFlsQTF2WDZXeEh6?=
 =?utf-8?B?UUtBVDErbkZYMWVoR2JEdXFJb1pVSndtclF2QUh4N0ErOWlzTmxLQTJ4Tml4?=
 =?utf-8?B?TlFuaGpVRzRWdnZtOTYvcFVuM3IzcWtQUHJHb2VWU0JmYVdGMnRkL2lNRzFZ?=
 =?utf-8?B?ckFzQ2dQSmlqeFhaTzlKRm1FYlRsc3ZEdzNQKzFrZGtVSFR4d2RRK2oyZC9m?=
 =?utf-8?B?cmJtQXM3YmxlNzV1dzRzV0FrYUZBcFpIaVF4Z00wTUYyMjJKV2VJMTh4YVJi?=
 =?utf-8?B?UkFUR1ZXaUg4NmhmMEsvRXA5OHp3ZkJFZVlZeVFIR05sWEFWcitmWUZoaVU3?=
 =?utf-8?B?ekM2YTRnTVFUcnYyNlZiUE84Uzg4M2ZYWFlNcmhOc3VPeFB2Ym1EVVZ1d0s5?=
 =?utf-8?B?dk5IMGtFdmNxUkxobHdYbS9VclQ2YytPVUpnbDNDY09HNmV2S3Nadm5xamJh?=
 =?utf-8?B?L2xnaWxwbGE0WWY0dHhjcHFUNE5hV3IzejhJUjJJbzBmN2J1Ym93ZnErczJ6?=
 =?utf-8?B?YUNiTkQ3alFWem94WWNpSDVWMHFnd2FDQTV1ZUlIV0loekxhVGJqZGl5U1lt?=
 =?utf-8?B?NGRBNlVDY2RCMW1pV01rWkZwSTJCYURNdklHd1UzaTJrU0pZZ1hZZzJGOGg2?=
 =?utf-8?B?K0hsVjVxVFBDWnBUQ0xmUy9KQlFhWStlQkh5TllVN0dJeGVia2RMNGFIMWkw?=
 =?utf-8?B?K294dmtxZ2hYaFl6RzNySWNPQVVKMXJ5UUdNY2dKNVlBV21jcW5USFdkK3ln?=
 =?utf-8?B?bWcxMWJMN3JTdkFkVDB4ZE5vZkVOT2N0b3c5ZmZ0RExqQUdYMDRpYm5FYmZl?=
 =?utf-8?B?aE1mNVNVcnlLMURLZERzRWhPYXg3OTZHcTJiUDlMWTlENjJ6TmhnMlVjWUlv?=
 =?utf-8?B?Wm1pUVFibDVnNFcraVlQd0hzNXlyQy96MWswT1hLTE5GRTRxWWZUMERlWDlj?=
 =?utf-8?B?eUpFMCs0OFltejkzWC91WjlvWmkvbnQxNDNtdHI0SW56a2Q1U1NrSXd5Q1pj?=
 =?utf-8?B?bUplT0EyZWFReEQ3dWtlYmx0QWpPYlFGTTVYdHl2aVA0SVdnTVNVd3BXaHdX?=
 =?utf-8?B?TmNNa1E4QnZXNTNmK2dpZkZtdGhZeTlOU0RtanJQV0lwZm9NQ3VWN1pqZnFR?=
 =?utf-8?B?N0ZraS84NjhwM0h6QVRhSU1iZ2VvRlU2cG85MXdDcDhCTXQxSCt0OFNuMDRp?=
 =?utf-8?B?Vzk4bjNzd0twVEwwYnhNd1pybFhLQ211R1lPaUpmemVQUGRCUzZjZEE5WjBq?=
 =?utf-8?B?ZDhlWjNBc0F5ajN6ZDZBQUhoWVNIck9zd3pQMm8zbUx6N05GeStuV3drOUR5?=
 =?utf-8?B?NGZuOU50QWdFY2VDaFlYK3pyWmlWUUZLS05HYmRaSGFieUN5OVp5dlBBZ1dH?=
 =?utf-8?B?YXNPclpkb3Ntc3c1WTAyRHZnT0YxbmpqZHBGRHZsMXMyTTlDMEJ4QUYzL2pT?=
 =?utf-8?B?ODgvSitYU3A4RzZ1ZnpyNEhwVEZuS29DcEdra1pPdHl1NE9Zem5XVWpKSXBB?=
 =?utf-8?B?Qkx5L2FnYm5pK0xwNWxVVkRZK1FJbXNpRSt1V082YnlNMUpzOHlpWXRqcUc0?=
 =?utf-8?B?bmJUbVpBWm0vTUJHeit5VE4xbzJXQmpzK1B1YS9TR1dteWVoTytpUDAyWkNy?=
 =?utf-8?B?YUhrSDdEbVhlWjJrbFFKOU90TWdxaUtkMW9aRnJLeFBnYU5ORkN3TkRPSHJR?=
 =?utf-8?Q?qXg0nZ2VLKIef8SQ7bltRjnWB+0HDfQT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJVMTJ2V2lPUEljZGhMSnR4Rlg3cDlCRE9ackJvZHpDSzVMMi9DQk4wYUg2?=
 =?utf-8?B?S0hWS0ZhMFJybHc2UDZld1liYlV5bEhTemwxeVhrd3hSV2hwaTV3aU4zTjhP?=
 =?utf-8?B?RnByR2hTQzV0bnJwUFpCWFZLYWtuYjNWZ0FPOUw1QXFiOWdIZjc3V2U0RUpN?=
 =?utf-8?B?Q0xaVEoyUStpRWZZU2NxTFNWL1NOOVdGZkN1Y05KTWx6YmY0d1A0UlhxL2R2?=
 =?utf-8?B?d2J5WVdLZitKVll3dUpxekk3bit0RjRvaFlaS21GYmxBOGY0QitnREF2NFZ1?=
 =?utf-8?B?di83WmRrcGFVZUlBK1ErOE5tb0RZQXhiUmxWcFRLL1hkb0RTUDBtSHBTQ3dE?=
 =?utf-8?B?U3RMZkF6ZkNMRGE1WlUya2hMcFdvUWhCbnUva2FHOGNHTHo2NUZaNGhSUWZK?=
 =?utf-8?B?aVlBOUptOXVRNFY2L0pvRmRFUDJCL3IzUDZLZFQ5cjJtVlZzQmo2eW1QSlZx?=
 =?utf-8?B?TlA4eEl5WUliT1YwS2l3cUZHbmpGWDdXL0dYK1dtVFZDK1p0RXg0UFVWdnJY?=
 =?utf-8?B?WllvZ3QzanIvbXFSdmhIblo2U2lHZmUyT29ucWRmdTZjL3RFQ0YzUlJQVTFn?=
 =?utf-8?B?bXQyWTN0dlF6K2pUVHdDWGlOY2Y3U0Y5MHV3My9sQTNNNDJGSGw1bWlmQlI5?=
 =?utf-8?B?aGJIcHhWNEp5UE85d1NibnZmRGtzdnhsc2orMm56RVROaG1rSWNhWFl1VSti?=
 =?utf-8?B?WDZFWGc0ekEreThQNHBEVi9DaDRUZ1dmRFgvYnY2YkU4WmhsSXE2ZHhoNita?=
 =?utf-8?B?RzBrS2lnUTFRUHJHSVNmQjU1OGJvZklENjBiUW5qMERHSkVXSlNPVXU3QVRz?=
 =?utf-8?B?MTdrZ25XRlpCU1ZldVBtakVUTHFKNlZBUmtSMnZyMjVQVGxYa2VGUUlqU3Mv?=
 =?utf-8?B?bkRkUTR2OUNoaXRwYllDUGpkVS9iU1ZNRlA3bWtTMjZ0UDhNVjFwZWdidXpW?=
 =?utf-8?B?VGd4N2RXeGJrbXpmNDhEVmZkMkNrVkFCWS9Edi8zeGNKaVlDb01rNGhQcENZ?=
 =?utf-8?B?Ny9Ocmh0K3VLTi8zWENmME42ZjNzSzIvRXRmemV1QVBYeTRibDN2M3N2TDJL?=
 =?utf-8?B?UExjM3FEUk5Ha2VXWGRyTUdqYjNLOTkvVjZQSmhwUEVBQUhETGNXalRDUWw0?=
 =?utf-8?B?djJsTTIraWZOZTlpQzFVc1FvTmtHTnFpdG1lYTUvRURJT0pHeVNWNjNxd3F3?=
 =?utf-8?B?d0RCOXVjMGFBVUtOMFF5SlBXN0tueFM2MWxIK1hJTUEyeU5oV3NyVG1jMDMv?=
 =?utf-8?B?UUhFUWU3bjNUdWZoVkx6QW5UYTJTeEJtRXB3L0dYUGJSaEpnUTM2YXB5S2Zx?=
 =?utf-8?B?MjBNL2JJdnVDZDVkdjVueXdTWEZPdGRFaitDSjZNd0syV2NnNDdleTM2VW1x?=
 =?utf-8?B?a25GdHlrWUJ1UW5ZRU5jQzZ3WGlORmEvSkxDbEs3MThmUHhGMjR2NTFDbEVv?=
 =?utf-8?B?cGw5UGMreXVsYlloUUpUTEZnS1NDdG4rWVgzM21FUUI0Y043TGZxQ0JRQURP?=
 =?utf-8?B?TmZyM1dJQUxLcW8zaFNSQW1WOUpQVWc2b29ZS2hIUFFLelV0OHpLNU9QQWNL?=
 =?utf-8?B?T3kwdUIxYjVmYXdsN3JIVXJUdWtqeWNjRnM5T3hGU1E2VUxxTjkyZlJwTFVv?=
 =?utf-8?B?Z1gvdW1SVmk3bi82Z0VDN3QramlBVGczc1ZtRkNLMk5uR2Flb3F3dHI5d0tl?=
 =?utf-8?B?V1dDUElySDhmU2MvS1JrSzFnbTBhRHdHMmhQeUJ6RHFmVXBlUk0xMEF0Z3ZX?=
 =?utf-8?B?WUZxT1ZYdGVMV1NudjIvbHhQOVo4SU9paFNhSThOajdVL1ZITXRjeXhQREJh?=
 =?utf-8?B?Y1diSWNWNWphQVROZ0hKYUVSOWZJa0lNK1FLeWxpMHpCOHR1VWZsUjA4ZEZC?=
 =?utf-8?B?cU9FOHJETXNEOWl2S1NPRW9XdHVBNzBCbG1HaFRxS2JTa2luUEFFbDhLL0FZ?=
 =?utf-8?B?S3dxYTliSmhNYU05N2x0RE4xdUdCc1htbjJ4YzcvUGdIVVdBdWVXTlNxRFMw?=
 =?utf-8?B?dng2ZHRtNDg1VGZ6eGhjWGlYbVBhNnoydmNtaDlJR0M2eStwNmY0VkRXRklv?=
 =?utf-8?B?SmExSUZ6b1Y4VGVMdW1kU2hNT0crWFA3TVhWMDMyU2JzSWVUOG0rSS90Wlkr?=
 =?utf-8?B?cU5TaEVrZHQ2UWkzRlRIV0RJdmtkRzYvd1g2TTk2ME50WTRGbUIvRnpHSkVE?=
 =?utf-8?Q?phf0GqmxJbW6r7N09/xHwbTocbk1xW7NFfkhNgwULl4h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8283ead6-c3f2-4be1-b143-08de231c366c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:22:02.2205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQ1Mhyeece5ikapebrYnYDXPr7TSfzJSlnpIzlSQpaFpMPbOcAjAaSsL8dp3zC8z+irPjy1yGo7ruQrnrvwVtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336
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

On Fri Nov 14, 2025 at 5:16 AM JST, John Hubbard wrote:
> On 11/13/25 11:59 AM, Joel Fernandes wrote:
>> Hi John,
>>=20
> ...
>>> -        Spec::try_from(boot0)
>>> +        if boot0.is_older_than_fermi() {
>>> +            return Err(ENOTSUPP);
>>> +        }
>>> +
>>> +        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>>=20
>> There is an inconsistency in error return here, if NV04 through NV50, it=
 returns
>> -ENOTSUPP. For Fermi through Volta, it will read boot42 but will return =
-ENODEV
>> because `Spec::try_from()` -> `boot42.chipset()` with return -ENODEV. I =
am Ok
>> with either error return, but it would be good to make it consistent.
>>=20
>
> Yes, good catch. It should be -ENOTSUPP for sure.
>
>> There also does not seem to be a diagnostic if the chipset is not suppor=
ted. It
>> would be good diagnostic that the chipset did not match, right now it wi=
ll
>> return -ENODEV, which could mean the device does not exist. -ENOTSUPP is=
 better
>> though but an actual dmesg error message would be nice.
>
> Yes. The "not supported" case would happen in two situations:
>
> a) Someone found a pre-Fermi GPU to use for (probably) display, and they
> also have a Turing+ GPU in the same system (!), and they have both Nouvea=
u
> and Nova drivers available.
>
> Here, it's not really an error situation. If this actually works, then
> Nova not supporting the older GPU is just expected operation.
>
> But these older GPUs are not even really directly supported, so this
> is a fringe case anyway.
>
> b) A newer GPU is installed, and Nova does not yet support it. Here,
> an error message is OK, because Nova is eventually (soon) going to=20
> support that GPU.
>
> So I think that means an error message is reasonable here.
>
>>=20
>> With these,
>>=20
>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>=20
>
> Thanks for the review!
>
> Alex, I think I'd better re-spin and re-test, in order to safely collect
> the various small fixes from you and Joel. I can do that today.

Agreed, that will limit the risk of me not capturing everything
properly. Thanks!
