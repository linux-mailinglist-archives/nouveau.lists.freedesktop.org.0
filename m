Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3006C3E1FD
	for <lists+nouveau@lfdr.de>; Fri, 07 Nov 2025 02:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD6210E0D9;
	Fri,  7 Nov 2025 01:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t47K2zb4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010004.outbound.protection.outlook.com
 [52.101.193.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3510E0D9
 for <nouveau@lists.freedesktop.org>; Fri,  7 Nov 2025 01:28:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xD+ATxtrmzUu6EYsuD8HQ+AS7G12PWI5Hiiav2jWLJRRI/4VgNDDwYmgvQkrIyODTJQ4WoHKJBIlMqbRu3FxlayLwHB1lAEfQ9O5dhXDXf0tCVZHAZNmd+ZQmzW8/f75p1AuGRl4wBZ03YRbHm3d7suaJ5Lwj0VtHwTK/uf4v9xBBN+UEVrmnUS1eOttjg4CENX+a1sYxfhBFHj3N1TrSMLrau3RJ6xAzmkawRdRA4g7dQcnnUhOSo7CIY5wotLtwOFJ+Kk3lQSrap893R0ikoBmSSnxcVHowOmioDVSqTHgzSo9dgzRlpruvk8N3s0QurlGbPXItdEOS6Vsm8JnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmp/jpuUbnTqTltqifrgXUuADbUHGTQS3inwVQMLKmI=;
 b=vxBrRoX/pcLRig1+rL64H2fzYcsToL1utIetXv1kF4QaV+TV0XLbSbAVtCO/CM9a58Mx+2phXPhdH16RT62CiW38iOhE3ryf1uCFh34CatTfUWWGTBi660xdt/hkXSLozjVO3aemky1eV7NOyHQR3yGwtPjF3w2Ctu5M/axWyMy9VOW6TjqVRsVYtPU5NgQkHiQ7H9+o2p8Y74KGqT0fkeh1AvmYCWStLXQAVThRZ4qJAeJRnJSpUJvxju9xczFVDfjvYDqfpeBDWxRhRLa/IRMiMg7FYYdHHqZY9vxAebZwoBnEOF5r1pogEN2u3n0JPCFSpOdmgLnjmETd4l3nhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmp/jpuUbnTqTltqifrgXUuADbUHGTQS3inwVQMLKmI=;
 b=t47K2zb4728xPRULzsGAJYkINvxgOE68H1zeuw7ugUQRtSyjeH+f+XF8avs/31AD1ANrph3uhEEEE74SrMyZXfABsEXk8mru83x3vXEdJ6ak0bF0ibQ9f4ZthBswE6lXKvtHHJLzRiUaz1ozLT3x8bGfQOggUEEVxjNYz4BihqhT7VI8DzfFXyM4W+ZOTwv9Z7YB13bVusZI7frDglk1cKulQTyiMJNH5RHFRkvyQBNhESXteYUT03WBOloA61SKnHAIchLgvKbwM1KPeqHCgQ+McuU2xSIyCTYN+VoAUvaWiSpQHgETFC3+LCsLzb1LuV7ghDMjmnbfZK1zFZLuvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 01:28:16 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 01:28:16 +0000
Message-ID: <c6128429-9a56-4d44-8f84-40fd33a52962@nvidia.com>
Date: Thu, 6 Nov 2025 17:27:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] gpu: nova-core: use gpu::Architecture instead of long
 lists of GPUs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-7-jhubbard@nvidia.com>
 <fc6616d404d8fd04a62bd90fa0f79e2c9d2a17da.camel@nvidia.com>
 <1c86eda2-b9ca-426c-8813-f91ddcd22085@kernel.org>
 <4d93d66d-d186-4b0c-b51d-94303c58b791@nvidia.com>
 <33fdac0d-fd7c-4c8e-9aa5-fa5558ff82d6@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <33fdac0d-fd7c-4c8e-9aa5-fa5558ff82d6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:a03:331::22) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 837c54ff-7b7c-447a-bba0-08de1d9cecfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2NkeTQvRkg1VlVXbWlBS1JNN2JXZVNIM0ErTW40a0QxZ3g0ZXZ2emhNRnJz?=
 =?utf-8?B?cklmNHB1QkRzeWowdFZCdW45aTU5Rm4wZ281T0FlWnliLzRkelVZSjIwSDJv?=
 =?utf-8?B?UlB2UVEwZDN6Um5Qei9vZ3llREU3N0ZMN0dZK2RTeWpOOE9HYUJFNjR2VHJ1?=
 =?utf-8?B?Rm15T09JTGg0SGJlcjlkdlB2dFJKcEJBeG45M2JrNUlHQVVJUW1zM2NPUFky?=
 =?utf-8?B?a0ZiVzRjWHIwcnc1ay9OMmUrWUNUMTFxV1kzcnVabHI1aGJZYnE4dzNsSklO?=
 =?utf-8?B?UzlnMDJ6cXUzeFF5b3ljWk5qcHlKeWUwZHhRWUJETFh1V1Y5TkwvV3plK0hY?=
 =?utf-8?B?R0dIVEJMdTgyYjVEVDEzaDZXVCtTK0NOaVJiWUs5SThsTmhoTFpPM28wSk96?=
 =?utf-8?B?U2Vmb0gwaWlOYW1ISy9QVWpNNlEyV3ZGYTd2cFZ4TG84OEVRWC9OdHJ3djdo?=
 =?utf-8?B?bENFcFVsbm4vNkpDNEF2UWorV1hzMEMxZWhERVdTRFB5MnhnNUdCV1pNN3lw?=
 =?utf-8?B?akg1amdsUTk3STVjcG1vVjhTcnE0OXd4NkVvbTlJQXB5YWhzY3hjNzB1bkt0?=
 =?utf-8?B?d0NsaTBQbzhuQXFtRXJzWXA5b3JRT2JETHFaYXlQYmhPNHZtTExkSXFwOGl2?=
 =?utf-8?B?ZkN0WiszS0xzWHRVd1FOQlFBQXZvS09pWWxSaGRGUnQ4MGswSmZ3VTRtbHZt?=
 =?utf-8?B?RWhFa1d4Z1dHZW5IZ3I5eVlOTWI5S0NweUtXb2plN2phMVZmYUNnNCszU2E0?=
 =?utf-8?B?bTl3bjFaZHFJTzFobkxlSHNqU1VjUE15b3BkTUhQVG1NNWIzN3gyb0owc0Rj?=
 =?utf-8?B?WlZyRDdscGJqb0lzQlFqOG5QOG5aVE9qaGpid1NZUWFOa0N6dlcvSDIzaytN?=
 =?utf-8?B?RVlSK2FFbFY4ZzRzMTMxSldSbHFSd09GL0VGZTRITVA3ZXdxYXF0cVVLRDNl?=
 =?utf-8?B?OHloS0hmSmZiMUxSbGNsenlwT0d0cFdVNFFPYnUwQTExaUtSZW9zTlRTUVRI?=
 =?utf-8?B?eHl6QmwxMTkwN2VTUjZOYzcxa2NZUDRHMU5vUGlON1M1WmMzOFhHOFgvelNu?=
 =?utf-8?B?ZGM1YVlrS3JoSXo5N3ZIMnJVNlhMbHNyeDEzbEVYRU0wbFNtY2I1V3BjZGxh?=
 =?utf-8?B?UkNnZW1JSjJvSU55cU5mOWUyM1ZSTlRkNklzcFBPSmRwalJWcjlDOWtYNTls?=
 =?utf-8?B?THJScWt4M0R3a3c0REJMQ3JURld3dTdFSzVjVHdqVTZOT1VXUUxGZ0g5aVdv?=
 =?utf-8?B?Yy8vRUZqeHI4NGFMb0pOcm1iK3YvSjZaRWFVak0rS2w5RzdiajFoYmZaK2cw?=
 =?utf-8?B?b2podXJOdUJ5ZFRhaEVYMjloVE8vem9XNnZ2UXFLZ0RwcERoZWNHTXRnNTBY?=
 =?utf-8?B?MGd0UFcwcG5rcjRSbEdUYWJKRXk0OEUzMzA3dTZYNjBqdDkwZUxEMC90d2x3?=
 =?utf-8?B?NGNNcFNDdFoyQ0xMa082U3R4K3puQ2VpQ1JZTmpQTFJGRkZTTTQzSndFQXR5?=
 =?utf-8?B?a1BEOWg0bkhuTklhVVVBaWFPeWV0SUozU0MrNnJLVnZ2amRVUm1HM1pHNG84?=
 =?utf-8?B?eDNXT3ZoamNaSEM2SnJ0YU0rdi9YdVJzeUNzdyt5dFFDbmVGYzJkRzdFazhR?=
 =?utf-8?B?RUZwQlJqUzZIVmJlTDdSVUNac1JyUjNJZXBtdkRxUkxLT2tJU3dOMnlCbGxy?=
 =?utf-8?B?NE9xcmU2elpNZEdGa0QvQ3loYTRFbWJjU3VLQThBdWhkQ01PUHRVbFVSaWVM?=
 =?utf-8?B?UUhsM0VRVDI1MFBjaW5tNHlOelExS0pBYUhwZFIzRnNOejd0Kzh1UC9NVGx5?=
 =?utf-8?B?MDI4L2pLWXFnK0xNUjdma3NUeVY1dmxmdHV0dDA4bzNZbFNkWHBaa003R3Rq?=
 =?utf-8?B?WkE0RzZaMnd4QzdRWkJKbTFFL3dBejhRY1g4WjdCWGFieTkyVldKMkRSdHBB?=
 =?utf-8?Q?Tq6XxlB+VvO6FG1obdykoDKllsOojp7G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFhoenNPU28vUGRCSzJzaHRleXI0U29wV3lrM3FCUnlNQjl2TkpXdytBdWJZ?=
 =?utf-8?B?ZFptam41VlRjaE43QU5ndlNKM094MmFBQTRGcEhCQ2dKK0R2N3kxTDZhaEZr?=
 =?utf-8?B?WVRJZkNlL00xUmxLcFpSMmszSjVTWjF6cDBBWVQ1TmpUbThPa3Bxc09taloz?=
 =?utf-8?B?U2tTSzV3aXlsNFhDSmVFUU0xZ3FNYXc5QjkzRW1mSU5MWjRUT01YY1RDTjRD?=
 =?utf-8?B?MnZSVkhyaEJyZmh1Q3RMSXpHWkt6UEFGN21FSXB3REpxNGhQQi9jbHV0aS9u?=
 =?utf-8?B?dHNYZ2pEM0I0OUwzVlJJWmRzc1lPTDJXVWdsOTdIbEd3N0xiZEtYa0EwS1Zi?=
 =?utf-8?B?S3dDaWZBRmRmckJDNUF5NlZnVWNWUC9nNXp5VjM1S2JKWFNuUE9xNVRFcU4v?=
 =?utf-8?B?aWI1MU1vTmlNcFZscWJxbU05UkpWamlHcGVaUlRhWDBNUXNsbmdnU2JLYitl?=
 =?utf-8?B?R0tNV0pRNkxtaG9KVFRIZG10Vm9MVFZabm4zWExnQ3ZqREFBK0pHZW9tYUhv?=
 =?utf-8?B?MWlEUklWWmRrWThGSDczSnBsWXNEQ0I5bW1MS29KeE9JRDBDZGl0ekF5TEFh?=
 =?utf-8?B?K1BEdEhwa2FZK3JGS2RLZUNBdXF0Rzc0VzlHSnRtNGZVcFVRbEc5Z2hkVk56?=
 =?utf-8?B?VFVNeXVVWFVzaU5FZTFiVXFzSHBjVGtzQ1pwUzh4bWM5UW0zTWZDT3orUmo3?=
 =?utf-8?B?allCLysraCtWQzJRem03eHpiMlhPYTFXTG4zcDhaRzNRWUR2V0RzSnp6UHZ1?=
 =?utf-8?B?U1FhUTFUWmlZR3dQTHU2VVEveGdCejF5S0Urd2taRE40TDhOYVNhOTU4bnNV?=
 =?utf-8?B?NlE5K2xHMGt3SUJOVHMwQmYvT1E2dWVuMGtiQVZLKzQ1MkVjbXNhQWo0NHRQ?=
 =?utf-8?B?QW1Pc3ljVU5hd0tFRDF5Y2dMV0QveHladkpzeXdCWEJuUVR0dTF4dmJ0QVR4?=
 =?utf-8?B?cXVxRVp1Ylorc1dOU1NFbzZ4R3hNTFFIa0p2NTZ2M1NuQzN3Q1VkbjMyTXhy?=
 =?utf-8?B?Y0UxVG83a0ZCMDc3bUEzVUlQa21vQXpOOFJhMGVMNnJ1SUZSU3NJdWlxa2Nw?=
 =?utf-8?B?YzlEQTFmSFZRa3QyS1M4bHdFSWpxQlpzVXdWajhlSHZSVCtEQVF5QWE1SllG?=
 =?utf-8?B?eDFHT1I0aVNBSGR1d0ZxanEwZVJMVVRxaUt6cmludTZJMjRCQkRxcUpObzlI?=
 =?utf-8?B?ZFdIYXFLb2c4QkY1YU4yVUM0UVV0MXp5cDBRcWlKQi9DdzF0a3Uzc29TZ1pG?=
 =?utf-8?B?Q0Jucm5nMmFkclhpNmZneW02Ry9sbnhEQU1tdWtSTlhVYW1lTmhRZ3lEcy9y?=
 =?utf-8?B?SEhOekd3NHduZlp4bEpJR0k1ZEpjQU16d285RUgvSGl3M0ttY29uRnRGV1dB?=
 =?utf-8?B?dFJTeTNnaVRmaVdqTitJdUxLVEtWOEdvbUtsREEzZTA5UUFFUXRHMnRJOFk3?=
 =?utf-8?B?WVQzYlRxODVzdmt0UTBkSGpOanRaRDAwN2RNamtmelQ0M2crVVQ3cldTYmlz?=
 =?utf-8?B?bHMvUUJ3TG5KT0V2S21zODdlaU9WM3U1RGpQVGdkeUduT2htVXI0WGNDTFYr?=
 =?utf-8?B?NjdqOTJKZnBMbE81OGdCajhGWFdEMitFNjB5VU1PRzROUmFHNWRTTzJ3eGEr?=
 =?utf-8?B?Ym5MTUs3RDVDd08xZ0RMa2NsNGZxaHlGbVN6MERrMVJaaEtYQWU0Rnd1WVZl?=
 =?utf-8?B?Y2lyRFBpR2xOMVFJUTlsVWNzZnFad0lEZUNLZEIybHZxekpya0Q5S0cyOE1l?=
 =?utf-8?B?KzVncENGQTZNTk9SR0pxc1NGV2NuV0ZydXRBWFNFTlZuY280cUI4aWwxZUw2?=
 =?utf-8?B?VFdDVW1SYjc2Qm41NFlTRUIxc1hsc3VKTHoyZCtzNUs4ZTQ4TnZSZDhFM2NZ?=
 =?utf-8?B?elBCU1dkUGNhbzZuc205OTdidVdrejUwS0pjMUpUSXFJYnNKRTN3cXhUSlZF?=
 =?utf-8?B?S3lHQ3dNZjkycGVoTll6T0RiL3BzUEgreXJaUWpERDB6NVAvS1MyM3dvbHFr?=
 =?utf-8?B?b09ubEpxZ2ZqaTIwaGRacWxEQm5aTWNmL3JTOFJTN21QZDRVMW1oaU5odGM2?=
 =?utf-8?B?QzJDM2o2OUJ3RENrN3JZTjNRSlBBVHpjbUlJRjB2bXZXVWpJQk1xc21FeWdH?=
 =?utf-8?Q?XXNOYnJZDgAjy2PGBA7jJAg7h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837c54ff-7b7c-447a-bba0-08de1d9cecfa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 01:28:16.2965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dOIV0EgKOgoMdCSzHKoRW8z0KHIXhMP0w2vd1mbNVo5/aVNariwQsy174t8+IAYl0F0cz5KSim8blG+HuyM1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927
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

On 11/6/25 3:30 PM, Danilo Krummrich wrote:
> On 11/6/25 11:18 PM, John Hubbard wrote:
>> I'm thinking we can either do it, before or after the big pending
>> set of patches that have been posted so far, probably.
> 
> I'd prefer doing it before, it ensures we have consistent style throughout the
> driver and gives the chance to cleanup unnecessary imports that are covered by
> prelude.

OK. I'll post something ASAP.

thanks,
-- 
John Hubbard

