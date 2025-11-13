Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 340FDC59E4E
	for <lists+nouveau@lfdr.de>; Thu, 13 Nov 2025 21:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D459210E935;
	Thu, 13 Nov 2025 20:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h3UA7SKn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013000.outbound.protection.outlook.com
 [40.93.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECD510E935
 for <nouveau@lists.freedesktop.org>; Thu, 13 Nov 2025 20:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMHMJoUGlEo6fGVLxVUKeY4D0h1n5kDXJRudxV9PtFOWQ0q2oqWayn+4nKg6cs/WBcXRfwqg2qdmdVGJGBhpVyivkm019AVy8u07nv1sDpzReA0Fzn4VgOEYorePqml/DKwpzOzNV8AFkiewnLt4TvWh79XWROR44KtYIzC2Nr+vvZ5s4YtqLCeBaDr2hvHWWR40BlOc6awPgsegGASL19JdJYMRv6hO7865VyrG2IdVcadBhCgvkIRlUer5/WfWcgU1alcfNdJHYlTyk9iXMDmZZY3NL9FUDqiNUi215SnNVZT5EqMPBwRLEBjTaaZKW6H1lMcnkquAPJOGjhiiyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qiQCOOWwcR0k5qiR4JjChUWP8Swo2Y6QGUoc5rBTvs=;
 b=Np7XCw53Klq2X2crXgDkqnS8C7fkpfE1c+1S+s1n1gIHOlT8Axy5zunKO0anRFCm0tpCnEKxKquwzUsb9A9PKyYQNV6H4Lc8oXzJMaa7oF3l459w7IbTjlvrjob0XeerXMD6o/VFsLqpGMlBE8hn2nlBxNfecEel5QlkXaZH9vZYVpVHiU8TOXyy4/Ddk0mLkay4o0zo4v/JwfyKP43jSXzGwqpwKH0k8Mq3poYDRVChwMOonVwIcwsD3qajsjoKu3EbO1azoR9vTA0e6cEKiSt4OlTuzJgxdGFZlu2WfuR8NLy8spo5XlRbMHVugomT9EjVNYW2EjzOXJ3QgXNnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qiQCOOWwcR0k5qiR4JjChUWP8Swo2Y6QGUoc5rBTvs=;
 b=h3UA7SKnD0tPPxdachWf9b60KAXUKFgLy/Dgc9nSAkiwlNKkH/HU4TCX77sOfv1AoeFuN2dRdvN5rHQWIMGU3HiTpOhP1+K8QPr2g8Lgl6eSexzqh6uKivkYnvG5sBAzXccVrMrQUlbt78kST4BCIYsQD6T47pEe812cOkkUaGQcT0PBME64bkAif/1b+Qz8KFNv1XIXu0G2QNaUyTuvD1yZi+DWE5qGGEJfY9Kd9X5zqICIYaU79Mv5gTtd372XSXW0RJ0Pdv5y2vosp8n0whZM8UCEsilwZ3hKyuQ7mq5mk9vDvdMidJMtxxwWpVAHwDd71TfSgO+s3zV+Ulxbjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 20:02:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:02:23 +0000
Message-ID: <dc0b1e89-6419-48bb-b037-966703180b6f@nvidia.com>
Date: Thu, 13 Nov 2025 15:02:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] gpu: nova: add boot42 support for next-gen GPUs
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
References: <20251112043000.83071-1-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251112043000.83071-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:208:23a::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 7875c654-c125-473f-a662-08de22ef8fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUFvVmZNS1dFZ3d6TDhWLzdjWm90RnBQRlJNSGlQTHRXWmIyT2NXVGpVRTEz?=
 =?utf-8?B?MWlkT2xQL05iNHdjRzVKTDRUc3ZNMFFzc2FSb2tGQ2pBVnJyMGYvOGNHQURt?=
 =?utf-8?B?MHNzTUYyVGNTM1J1bmxCYWRNVVNOR3VCeGNKWVJzVDNXbWdIeE5EVW5NT3g1?=
 =?utf-8?B?bXN3aEZCbUZyU1BwaEVtODFaTVNUNW5wMFIycTRrdjdjSm5hd0U4MjI1NnM5?=
 =?utf-8?B?a1AvYkdTNUZweXA2N3M2azRwRXNsY0tWOVE3Tlh1cnBhYTVHVktmOCszQXdP?=
 =?utf-8?B?VUhvRG1RK2R2NE5BSVd0SlNXZEFMM2ZGZUdpMkVPd1lNZUJtcTkzS1Y1Kyt5?=
 =?utf-8?B?NmNLYnMxK2R0eEE4N3dQc2hOb2dKN0lRbUFXUWpOV0JNNTJVNHVhTlN0NUZQ?=
 =?utf-8?B?eTBmalRDbFVpWjlabzJwWU51RlpzcWVFd2FwQVEydENvVnNIaDBrTVNZaWJL?=
 =?utf-8?B?MW9UTkYxL29UYmU2V3hCTmk0VHlDTXk0di9kNHpmUnM1RFY0ckpmazBDdEhi?=
 =?utf-8?B?ZlVBcHZyVDdGVWthV2NPYTYyQzdKckZKTE5Ka3lmR1FzbXc4MURTaDFXSzJL?=
 =?utf-8?B?cWFMN0NraTZHZEVXZDZuMzBZUjJ6Y25ZOVVNYkRYQmd5Zm5BRXZjdTIvbkxE?=
 =?utf-8?B?VmdNbDhKOU5wRFdWVUFPS2hxMWxnMGJRSC85bWdlcE1FKzA5bUQ5TUxuUzRo?=
 =?utf-8?B?cTlUS1luSDRBcS9LYXUxQS84MFBiVWVtU3VkR3hWSGIzb3A5TnlzWXpWV1cw?=
 =?utf-8?B?c0Y1V2tGenlOVjJOaS83TkVidWNNVUtPcTc3Z1VqNzVFbnJGdzhIbTVXcWZM?=
 =?utf-8?B?dSt5N3R6TyszQzQ1RHVxTk5nN01lcFo2NHZ5MmxTVWhwS0FVV010NXNvRm1n?=
 =?utf-8?B?UG84ZEV0Y2RvdlBmMHRTT3Y0bCt6aUJFV0h0eGhZUGFCRCtFNlBwdklVb01M?=
 =?utf-8?B?VzFIOUtGcURORktDRUU0L0lIMFYwc3VXS0oybGp5RTZEaFNqUW1Xa01SRzN1?=
 =?utf-8?B?bEc1Q2w1UzF0SGtwK1pJRmVQNlIrTWNFZUd5UGhJTnRJbjBBR3NyZVI0T29P?=
 =?utf-8?B?TXNDcE1zeC9naXBaL0NTcnA1cTJaaHVLZ1UwbDlNYUFxTHhTemp5V3l6bGVy?=
 =?utf-8?B?US93QXdiQm5TTUkzWXcyWUNXYVB0enk3MVRlWm42RzhIby91SmFJV0ZZNXYz?=
 =?utf-8?B?SkxBTGVWWFEzVVcrV3YzaHhrdE1YZUFWZ1VXTG1CRS9ueVpuRTEydFRHNUIz?=
 =?utf-8?B?cnBENFJxeG04WC9hM1JJTnA2aEx6dXNpOERwd1JEQndxN2NnSml2c0dUd2Qx?=
 =?utf-8?B?NWphc3FucThYSFhZUXg2NFZ1cUIwaTVodlJyemZuZC8rV2JPK1FSL3lOd1pw?=
 =?utf-8?B?MGFvK1dyS0VwbGg5WVpaVEJjdjh5U05lNEd5TDYvT3dkN2ZhbG5jYTBRaGxI?=
 =?utf-8?B?Tm9ieFVsdUYxWnR6ckdRK3VoeE9vWVlPaXhqRnliVjdmalpwUzBKWWcvTXNE?=
 =?utf-8?B?YU9oRHVVTWt1ZWRGQ2Jrc0x3OTRQcWZ4QUFJZ0dMRDRleHd2SU1VVUhsaEsr?=
 =?utf-8?B?dzhYOG1OSE1MOXlqdUQ2RTRnUjQ1OGZpbWcvKy94VHBVRTNSYlE0M2tQWlNy?=
 =?utf-8?B?MGlQQ2ZSeHBvQ2lFKzI1TWZZV3FaL1I3UXM5blNhNTZxUHJKR25YYTJhV05D?=
 =?utf-8?B?aWsrZjg5b2gydGdyQ3l0SU1mWmptUG5aRjBITVZEZThKbXRPeDc1ZDk0Y28v?=
 =?utf-8?B?d0pneWtqUEhuQ3FwaDJMMXFzK1FraWdVRS9ITlo1dXBpRUs2c1BsNUE3cENk?=
 =?utf-8?B?MHRRdENhbHBWMWxlMjlNY3gxUHB6MHBUZWVrT2d5aDBmdUluMVhJK290RGNK?=
 =?utf-8?B?dnNtd0trbW9ReFo2c3J6YkdNV2NKRXpkQVZRcnIranJDVFNrRzFCdWIzc0VJ?=
 =?utf-8?Q?ruZZDRyrHbMytktSmg1o9ayFTjUUYBWR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3djWStzNXg2T3BEQnE1NGo2MUJOL0Mvak5NUDJkVnZkZFpLNXc2Y1NBT3c2?=
 =?utf-8?B?Q3RKV0hmcmFxL1UrVU9IUHlqVy9kdm5SMUxKOG4ycUJ6NEpXeFk3RkkydDQ0?=
 =?utf-8?B?TXhNWmFXcm8zNGh3WElYUGV4azcyNllNSGRCZngraEZRalh4b3l6ek56UzdB?=
 =?utf-8?B?NjBYUjgwamNDS2QyY2kyaGhqclBhNDN2elZJaThmczJTdkJJY0RxU3VnQ0p0?=
 =?utf-8?B?UGRENktxbC9HTFowV1YxWEdxVDNZU2xwNzFhTnN2czZ5Y3JBNmxVRGtjYWQx?=
 =?utf-8?B?WmZzNE41dTlrOEEyOTJqeXQ5QUNjQ0pxSXZhTEp3SlFFMGZKeE93MGQ3ZTB3?=
 =?utf-8?B?OVRGWVFYeW1TaFVQUDNkdkRWU1RtUUJmUE1sRUhrRXdYcG0wZ3o1MWEwREdp?=
 =?utf-8?B?cWdrRlp1aS9UWDNwdUZDbzhnVldtVmpLQUw2bVhoYVhQL3JiODZ0djFVT2lj?=
 =?utf-8?B?cGdham80WDVXYVMyclRkT0t4NTd0MXZsUXZFZDFCQnN2dDZUaTAwb1RJc01C?=
 =?utf-8?B?bXBZbmdCR1lsbnY4WFU2a3lyZWNiUExQMU1RQStDOVdaOUYzTzZWUzdjMEM3?=
 =?utf-8?B?bDJUcEFhT3k1T1VlNjN0VVR3VDhsWElvbGlTazZQa3E1WmUvTm5lY2ZqQ2R6?=
 =?utf-8?B?RXVFWUx3YW83b0hUTEhscVVNRVhPMUl2dGp1clE0a1ZDaFZGbVg3S0lOV291?=
 =?utf-8?B?dlBwTnJaTThIYVRaZFEwcmRYUW14UENqUHhqTUY3emN6aEk4a1JZdFZ6dzA3?=
 =?utf-8?B?SmNLcU44Q1BvYnE2RThqRjFGU2pOUCtuVVJJMzIzUyt5VnJDUktsZVZOK0RH?=
 =?utf-8?B?dE04VWl1TVUzSE5DNG9KemlQRjRKd09YOVJTWkRRZGpYV1RMeXFjcFBlbnFa?=
 =?utf-8?B?YXFKcU51eWtxUnQ1dDNGSUsxWmZCZi9aYVZrKzU1a1ZrRnMvcjJJS3lIV1Zt?=
 =?utf-8?B?NVp1ejhKTk0ycGoxTk53dEZRUXJWbTBRVjRjSDl1aDZNUkorRTNIRUJnMU5G?=
 =?utf-8?B?WEVmRHhhcVdaajdJdU80cURXZEMzZXlncGY4ZkVva2FESnFJb0dsRzQ3dEJL?=
 =?utf-8?B?SWpVZ2dLLzJaaGRVeGRBV3d6SDI2ZnV5T01sdHpHOXdEditITFJuenNHL2xs?=
 =?utf-8?B?S0hzK2c2U05KbFlscGNnaHc0QXpndS9VWEJDOHo4S3I1UDBLOTVYdm1EY2Fs?=
 =?utf-8?B?QjRXaXhhM21RUk1wb2t6MFpsZHVKb0pDdWMxM1lOdSs3U1dqZy9xNVJCS3RV?=
 =?utf-8?B?c2s1V2paVGttNVhROWRkUTJsdSs5dHBiRVM5UGFUTzlja1BnUEs4ek5lWUE4?=
 =?utf-8?B?TW5QMm5NZnBHUjNrZi9BMjZPQ2haVjlhRitENGlZaDM0TUtQQ3lDR2ZuUVZM?=
 =?utf-8?B?SXVWZVllMWVRKzRhbVNvUGZ5UUtBMExmVy9CNVpDN1hYN0x2djc5aHpmdmNU?=
 =?utf-8?B?YjZNZUE0eGMzeFpVaVRDQUVSVm1ZeGxXSmtmbFNIckpYWGpCdlZDODJBNzd5?=
 =?utf-8?B?NkxLUVQxcWVmN2F6ZWdGNEtLdDNidEJvek03allnbmZKOFludGZNOXU0TGdq?=
 =?utf-8?B?SXU2aEx0blFkOUo3dzVhWGFJa1BqSm1sTE5xZWpPVUg5SFVXL1d3Z1d2S2Nn?=
 =?utf-8?B?cVE5TS9LM1IyTDVkLzhFUnVIblFva01scEJ2U0NOSGF2QXR2T1RrbG5MamN2?=
 =?utf-8?B?cFlvYTVNZXZZT2c3TEg2VExXc1ZXOW5DSlVZc2lRZGdGQ2VIRGlZZW1BWUN2?=
 =?utf-8?B?dWFYelkvTXozcFNsMUtGT0dyc0JMOE5Yalh1MGkzN3pwcGRIQllEdHNWVzlY?=
 =?utf-8?B?T2t2a25kaGVQVVBZT0RXemVUc1gxN29rRnpxUWIxSkh2NGk0c2VURVA4MGVq?=
 =?utf-8?B?ME1PQVNiNzZtSUdBdmMrbng3RDN5OTV2bEdrVThwMzJtM2d0ck00czdOU0FP?=
 =?utf-8?B?dm1ZdU5KOXBWTXN4aytIeTRZWS9zWmpycnYxL1RmUTd0Z1doWWozYUVQN09C?=
 =?utf-8?B?cmhTRlRoWGxENUZ3Ykl5NWt0YU5xWWZnVFIwTnJDa3VXV3FBNFhRaSs0OFRS?=
 =?utf-8?B?Q2NyU1dTK1Q0Uk1jTlhPTTU4WHlUVWRucVdkb3R6SXdxZWVNRHlld3NHQzlp?=
 =?utf-8?B?Slo2K1RRUkZ0cjNXWWpIbS84TW1qd3pNNmVXZ3BZRjhKQ3ZCM3pPVFNEMjFC?=
 =?utf-8?B?cnc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7875c654-c125-473f-a662-08de22ef8fc2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:02:23.8839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFYFmNOOR6kSqHRGukb134VaBwpoKuiPVxBwwF8LSKMxqIX5uxA/Q1Y1Xvk6jOMIqLifNoBhlLou07lv7eybjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
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



On 11/11/2025 11:29 PM, John Hubbard wrote:
> Changes in v7:
> 
> 1) Added a TODO to eventually remove the Default trait from Architecture.
> 2) Further refined the logic and comments for reading boot0, then boot42.

Other than the few nits I left, looks really good. Thanks!

For all,
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

 - Joel

