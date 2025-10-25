Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CBDC08853
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 03:57:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1839310E118;
	Sat, 25 Oct 2025 01:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nvf69Mf/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012027.outbound.protection.outlook.com
 [40.93.195.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159910E118
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 01:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Go6hDVLz51hIQjU0HkJ73yghl358wYOR20ArXhHC/+0VDWOmVZGMCSPYwYZ0UMVi+57OxGoOnWF2OcDrvNsnzYxpU6xUuEEWf6SPPvPjZlOrOzZr2XqHxHG2uYEJWOygguC6Z2ZS9SSGSuyyVR9JtpI4bR5bmFc57JLQUmS9bSCwDfJOxzXQKAXyd01i66kSJbCbB8+X9lZyCRPz/ogVjYFti7YI7zIcmdqU9SIIhXQtGBMSs5AWTl/hp6pXrSYfGEUCMtRX8AcIHUr1DdM3rGH0hlmt9x3ApGMgQKF5ntDfNI+P7dtnFUur7RJ7vVp6OfKUmpPyLScUTkk9PbCxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3KGd70+Pevvd406Mf4HIpRhLwkkNyASEtzKyt+2dFY=;
 b=xyBToLHSrXIFkz8RKiUr+jPUKf9xVSYWt3Y7U4Wj/wcOt0a49cklvdTSYWMgbt0NDL7AhrnJ32h+LygTSSP+63+jLAvkGouEuj6cxnm1Hpe/y+c6p5sVcxkl+hFHg7k7uJzdlAPpcQxYBH1mF7oK9Mq4Z6tpeRlOuxluQohOSL6JGKpQz8Ifyx/6nom6QW7HFhBQo2h3Ep/v2xOIMLpnCFqz+//DaTG+We4cSaD+2OHzXBNryCoaXGMMGXti9goYj55sAC5zKRYie5P6xotKWW50Tn8ylDFkPM8dUiqgabIZkVThE1Uqwhy1zU/4VR6Ij/mlv+bSs3o1jI413Mdf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3KGd70+Pevvd406Mf4HIpRhLwkkNyASEtzKyt+2dFY=;
 b=nvf69Mf/d5lXvN3/UskY4s7Y3J6W2+jOpna5b5wgTRR8Thtxs6miEL6qiJ+vD+u0fWdYz7fI5r1+eiAcChKyRZJf0elfPSPJNa3z9fzqF0CeyGX2q9ntcIJRYQImT0t3YLIfhoGL+Ns3MdE6ek+BdNjwXt1+KEL1g0K+W2DG8rtArY2m0kSn3ibKhXHYRRyLVmbY7ShJ7OSXebU2nBzu49JiCb6zU4RrCc7qTkpj3MygyX2akn2Ifl2yLdrNOM73YJfu3qAH/J6YiXDeFL7C2LqLN68ltRjn1L6nMmYuOBDbwoh7LlWMbJo/Ezqw6U/8usgg1ija4Iql6wGOxBX1Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 01:57:03 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 01:57:02 +0000
Message-ID: <a0a0c618-0b23-437b-891f-ee530c79fb6a@nvidia.com>
Date: Fri, 24 Oct 2025 18:56:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nova-core: remove an unnecessary register read: HWCFG1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20251025012409.577596-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251025012409.577596-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0044.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::21) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfb055f-aab5-429c-faa2-08de1369cac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2VOajlqeEhSTUdaRk5kOEU2RjZSNWlSSGtOK08ySHQwRnNndEpzNjNDR21z?=
 =?utf-8?B?eGVMZ2Fyc1k1cXl4aFhIdkxsNGdiQ2ZpZTdURWY3NldEWEkvVDgzQkdERnRI?=
 =?utf-8?B?Z3JYNTlmSXVkdW1lcHVuUTByYnkxbFZaK1FhVmNsZTRGZlR1RUExL0lEU1Uy?=
 =?utf-8?B?WEt4L0JtTUtsbWNIbGxzNG5BeElCaU8zeVlDMjY3NFV1cVZkZmxpMkNwQ1JR?=
 =?utf-8?B?VVM2VXJBM0gveWFkb2hLNWhzU1BraC9UK0x5UllNckloMWdqc0JheVdsN1hm?=
 =?utf-8?B?K3JpOHpybzU3VllVM3BkV1pzK0RnTm9HUVUxVGM5ZnptUk5ibDJCekRiSGpF?=
 =?utf-8?B?QnVWN3JqOTFWbHhkdzUzOGhYRld2WkJIbHZ1YVBTNkY2ZUdGN3plb0dvUmtj?=
 =?utf-8?B?bUdCeURmcWhzWGl1R2w3eWpIZm54MnVUdzlPaHovMVdEWVNYVlNZQTFBbFZQ?=
 =?utf-8?B?c0ZrTEZOU1Zhc1Fab2xXd0ZyZVhxWE9jKy9oS1ZEa09MRXAwQ2tEQlh5QU82?=
 =?utf-8?B?V0VIMU1HckZxU3dXd2JXUmQ5TkNZaFNVUHJmYUhDc1l0QXQyWnovOTNtVGFF?=
 =?utf-8?B?eXZITlY0ZnNWZFF1UGNxRGNuRGpEUWVINllqaTFhL2tuYSttRHZFSzZCVEhU?=
 =?utf-8?B?cy9hdXA4djRPQnh6TUFpVGVNdllpU283THR6TEhSRlNJZ0hXYVNJanpPNjVU?=
 =?utf-8?B?dmNKWFFBYlU2ZDljWU1kd3ZJWDk4NGNCQmhiUFV3b1g1bW9WWWIxajhKeFlD?=
 =?utf-8?B?TytoUHFDUkNTOVVzUHM5MCs1MExYZ0VRcmd4bmdZUENyVlpRUFB3N2toZkNq?=
 =?utf-8?B?Ym9HcnBtSVlKb3pPdkhwQjlub1dBdzNuV0hnRVJkUHo0YWQ4WGlyRHNVUi9I?=
 =?utf-8?B?SzlEa1NVZTJoUlA2UUlQZDlaQ1dwamNhVEdDQXJHT2VkV3BJY2lsRXp6MEg5?=
 =?utf-8?B?eGFBRk90K3pMajYzc3h6aHJKSm93T2g4ZFlLN2s3NklwdXlobkFTbkR2RjYy?=
 =?utf-8?B?bEVtMG1CWTd1blhjMGZ4WWFSMHBrbWJXRGtmcnVFeVRNQ2V0VFN1MFpSNGk5?=
 =?utf-8?B?T0ZnYVhzTmo1Mit1WU92LzZ5TTNVd0VFV2QzeFRCZFF5VE10TWhtOExZaHc1?=
 =?utf-8?B?Q2hwU1lGOHR6T25LWFkxV290RkJWTFVzakF4QnNoUnZZTzdaOVB6Y3ZDUEZs?=
 =?utf-8?B?WGNsM1k2MHhXOWs2NWlvZ3hNNDBIa0N6WThZL1F3NEtzNmkxWUdHV09Mb2Vq?=
 =?utf-8?B?RkNSdUhJWmhaaW9zVSsxVHFCNG5qcmZjVWZXZUV2c0ZHQjIxdGY2UG1BK2sy?=
 =?utf-8?B?ZXkzTnlkRnhycjZDK0VqTXZtTkhnY3dockNKTjZVVy9FNDYyeFpub1c2Mnl4?=
 =?utf-8?B?UUVQRytmSDBFZGVpWmhYL2djQ29GNkNuaUxkNm5PQ3c2S1JTV3UxRmR6anpC?=
 =?utf-8?B?MjNBeGRSbGZyblczN2dSUHdwTDNRN21ha3ZBdGc3Q0JWTFBmbk9Lb1BKOEFa?=
 =?utf-8?B?M3ZnS01xN1dsZFlQUkpwSnJGRVMxbUhrTTlJRkhRRzY4TDZyQlVZWlpZbGc3?=
 =?utf-8?B?NDdhS0F5aXpmNnV5cGpXWnI4VmNoZDNZbkt2QjNWZHl0YzJFVlkyeEVOOW1D?=
 =?utf-8?B?WWJsc3JmK1hBVUh6U25UZVdGbTU3SG9wemVTQm9RRHpIVmhvazJmdVZyOXN2?=
 =?utf-8?B?dHlEQVJiK2lHSExpYWFsOVJwLys1b1FZL2t1TUNxcUVqZVdhYnpJc2VHSnBh?=
 =?utf-8?B?NzRmVXlGMWtUaEV0NnZoWk1GcmJuVjQwWU5JTjhSV0w0R05HMVBNbGE1TmNk?=
 =?utf-8?B?dkEwbkFPbC9ibkJPMnlYaVU3OEpHKzlMNFE1Y1lLbmVSbDBDV0dGZ3AwWG1V?=
 =?utf-8?B?cno5OXRrSVdHdzh4N1pPbnBsYWkxcHBteWRobDgzbnZaUzJaVjAxN09JMVox?=
 =?utf-8?B?a0lCbFFrdDM0bmF3eUpNM0VlQm9jRmFDWnl2UW04a2hvV01tbnNhTTNNUm1T?=
 =?utf-8?B?bk9WWjZ4MElRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjVKQ2c2dTBPVExKa1djZjF6MkorY3dPY3dRM2k5WXg2MWZhT29HVCszYi95?=
 =?utf-8?B?dVd4Z0JiL3N4VEZTTDl6UEc1dExqUCtJV21RWk4ySlpKTDRRS0Y3Qm1BMFNE?=
 =?utf-8?B?R2F4RElBR1lvS3dNZHFIQnd0ZGgzTyt0VDVWT0JGb2VYejRmbmtLdFZCNXY5?=
 =?utf-8?B?TGNtKzBIVVhuVlhkeFJUOXF0S1ViUStucmxCbFJKQzFkS25aQkpKMFRqQ3VT?=
 =?utf-8?B?dzFVTDlHc2FOazg4QXBOeXI4cEE0amJRZ1lMa0ZpK1ZEQk1GTUlhUDZwUFVa?=
 =?utf-8?B?eVZ4amk1YVAzMlNNWTZGN3MzaWNnWVFaa1RuNFl2dFNpb1JscW8wcUJaSXky?=
 =?utf-8?B?bVRqV3lkVC85MWFDQVVCNG1GNlIrRXVzYmxiUWRMblVhQVY1WFhLYlNFaTJS?=
 =?utf-8?B?UVJleU5qaElPMkgrN3hmbVRCNzYxR1dWZ0ZFcmNVd1BsMURvNFJjVG5QcDdR?=
 =?utf-8?B?RDZSL09FWVZyWkdYVThTVjBiNlRheGxFQUsvaHNmeVRmakVFVWJUM3RYNWFm?=
 =?utf-8?B?Tys5bTdWamJ4TWtLYWkvZkloUUxhNlkxWmU5NzUrK2t1T3RiNVRqeVNZSVlH?=
 =?utf-8?B?SmdjdkJoRndDZDlqTzJ4SG5FL1ZValdsako4MFFGZ0pQVEdYVnVmblJVNlg3?=
 =?utf-8?B?S0hwZ1BOUmZjYnFTV0JXUkRjcHdKcjZLc25FT3BYUElpcHlSOEFDN3BUdm5i?=
 =?utf-8?B?eEhIcHhSOWdVWitUZmJVcllCNlJ5dmtISnJ6dlh5VUVPOFVkU2dEMHk1ZFlw?=
 =?utf-8?B?RnlqVlNqZlZHRnN4MGpHVlN0U0VnTEhtdHpGVndaL0doWXBzMk5IWStCTXhH?=
 =?utf-8?B?Wm9lR2R0N0l1L0xEQ0hVbFFob3htckZNdzdJMDdCdjlXQndqRTFYR3ZwM2Ev?=
 =?utf-8?B?QnU4TmpzcHUzWmZKMWN0d01NZDZPNU1PYWV1MTZwUmluMjBQbGdhNmtYMUpJ?=
 =?utf-8?B?NU1tdUhIa2I0eEtnYjNWbEc3V1hjYnJKR1BvUVJiNU5QWW5CN0lVa21wN2dv?=
 =?utf-8?B?OUlOay91ZDNyL3dyRmcwOHBTR2pLVlk0c1kxMU9mdkpUZTFOMUdCSWs2Uk9B?=
 =?utf-8?B?a3dwdGVCY2tjOWlCVHJ5OCtqZ05XbUVHaThmT0ViUk5USGNRb0dBYm9DTDlV?=
 =?utf-8?B?SnkxRWJVTWtmSjFTSVYvajNHSlZ4N0dLblowQzE2VXpVZisvUHJxalhEMFFU?=
 =?utf-8?B?T1F4WlZ1djdiVS9IQlIvU1ZKTjNqakxsd1ZQbndoN1FmTXFFN3lJcmh0VExD?=
 =?utf-8?B?dVlUdkV4N0tsb2ZHc1MyMGY3OFlYQytpcEQ1SEpxT3RSMDRhc2NIR1VXVEtP?=
 =?utf-8?B?bFd0UVgyZS8vWUhDeHlTVmhIckZ5VjNHRUpKTGpqWmE0cU9selZDdVZtbU5Z?=
 =?utf-8?B?d1JLYWN5Q0I1SUVpVEZLazVkK1VzY0IvN2lvRmwvTHZRdUFpTnBKOSttdU1x?=
 =?utf-8?B?SDhJMHZUaTVGTEJ6d3IzajlLQzF4eXI1MmlwdlJGNW43LzRaRFNJQlpTMElN?=
 =?utf-8?B?aHRxOG15bEliTml2QXNUbkVwRm1IZk4waEZPc1pzMlNDUlJ3clZ6NEJyZEJ0?=
 =?utf-8?B?V1hKSWl2eU9GaEFCUldqSkZ3L29yQjFLTmQ2aWkxc0l5L0NZZ1h6TXFlZnJw?=
 =?utf-8?B?LytpeW4xSGl3bVhjZ3RJRHZRTlMwdzF5TVhtQ01XQWlESVlxL1I5ZkVyTk1M?=
 =?utf-8?B?NTVMTmVjcUhqV1J3cXd0TktzaGlUN1NIQTJLT0FxSHRKLzErdnY1OUtVN2Iy?=
 =?utf-8?B?QllrZmI1elM3L1MzQ3FVMjBWYzZxTkhnT2RqVmhmeXlHK2UyQ0lrZWJobExk?=
 =?utf-8?B?ZVJ3VkhGU3E0UGc1Z0VHUVZ5czFiZGFIVk0wbzNtalVBclA2MmZxU0JaRUxJ?=
 =?utf-8?B?YzZhaHhUU01HTGRScEdiMVVnYVM5UE5nSTVsbjJnMC8zS0p5UExTV1BVKzda?=
 =?utf-8?B?TzZWdG1aaXVGbmt6Nnh5S1RzOXlBVnVCQjE5K3hQT1VndWNqQjVmMFEyUUU1?=
 =?utf-8?B?bzY2c0ZSbnpHd1ZWTWFwT1Nla2Y2RGhCWkxwOHhIUTBrWDMxR2RleDBWdEZZ?=
 =?utf-8?B?Nk5DbVozaDR2cnBrRHdtQU5jOVF3ek50aUlycHVLcTBlUFA2UTZGVTlnSTB3?=
 =?utf-8?Q?sOWmRuepnmB+Ae2Ts+oYau2lS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfb055f-aab5-429c-faa2-08de1369cac4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 01:57:02.8985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gnt+63s6spoyhyXqLuEIXm2q76a9XfQ+06fm2WwGE8K683UB9zmSrPVY1zX+j2l7rHO+EBicLpFc31aRkqEKDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784
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

On 10/24/25 6:24 PM, John Hubbard wrote:
> This register read is not required in order to bring up any of the GPUs,
> and it is read too early on Hopper/Blackwell+ GPUs anyway. So just stop
> doing this.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

I temporarily overlooked the dependency of a follow-on patch, so this
single patch here can be ignored, please. (It's also harmless to apply
it, due to git's behavior with identical patches.)

I've included this identical patch in a 2-patch series that can be used
instead:

    [PATCH 0/2] nova-core: remove HWCFG1 and need_riscv [1] 

[1] https://lore.kernel.org/20251025014050.585153-1-jhubbard@nvidia.com


thanks,
John Hubbard

> 
> This applies cleanly to today's drm-rust-next.
> 
> thanks,
> John Hubbard
> 
> 
>  drivers/gpu/nova-core/falcon.rs | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 3f505b870601..ac55cbc5ac1e 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -371,11 +371,6 @@ pub(crate) fn new(
>          bar: &Bar0,
>          need_riscv: bool,
>      ) -> Result<Self> {
> -        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, &E::ID);
> -        // Check that the revision and security model contain valid values.
> -        let _ = hwcfg1.core_rev()?;
> -        let _ = hwcfg1.security_model()?;
> -
>          if need_riscv {
>              let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
>              if !hwcfg2.riscv() {
> 
> base-commit: d3917368ebc5cd89d7d08eab4673e5c4c73ff42f


