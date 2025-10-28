Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBF3C1621A
	for <lists+nouveau@lfdr.de>; Tue, 28 Oct 2025 18:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D7F10E626;
	Tue, 28 Oct 2025 17:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NecIv0Ym";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0530D10E624
 for <nouveau@lists.freedesktop.org>; Tue, 28 Oct 2025 17:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYECVzsXuTR9prjJ3OJR6umUh7B4L8yuqpoloWY5Wy8WdXi0xesk3iA42y4K0tMMZhzjWpfK4TE8P3pj+pSiKrgTU+v4Z7KAVqFi+ApQG07TPzkCvQduYZL5kDHnXg8HqiWW9IOykc5fz+sgYTgFbRIBQE4Lkq6UT50kgkd4Ep6eVKJv42HUSAGmMlKC2lmpQrZ37tZoDHBCjDPYvS4yX3G2UapRISH+i7pdzRwTlb79c2q3zZHUaC3Y3ayXjihu49n7EC50P3Eyp4Hj1RjVwv8RgBTR2dwdh0PoFIj1YJBZU1dnXS04apY20nsMF8p4IfCELyMpQ75aZaqrgQJzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZaJvrmzI0rum9WQv0nKQU03nr8OTXVEw97hrA+aL10=;
 b=TkVSz6p9ff+6pALEIsbvChF7+4ZbJr0L5aVcTuokk1iOqzyt78stB7WOSn7rMZyIq1S3aa4p2h8jYQz5+enLGqn/ASGu9GcQ742WQny3ZzmedWMV7NB+I85GJUI67ugcTykJ0uWIuMbT1wDodirQ4OkXRfp+nf3TGfIBs8ilozQ+AE5K2EzrgVaJJOvKuEGFjGgtshDTLEc8ngh2SufYkMRxL6gS8PCzlReQpz27R2FL+aylIyXehbPtAcdLgIE6cGW6mE3xnKyYGZVfMYVy5Dlgj+lIw0i5BR1y5eU0IEBy3RfSQJIDE1Bcxg4RIiYkMPIvdPm0T7BVetQZbn5Odg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZaJvrmzI0rum9WQv0nKQU03nr8OTXVEw97hrA+aL10=;
 b=NecIv0Ymb86hD8Q3avAilT6e12amcVRp1luNNs65hCJy+hDDTSmYpZSjtFgRrqImk3nKfbP19ieZc6g1LEjofpndbbysjEDFM7Lpfq85qPkuEqhWdWRuEYWHC3Ow5NqXZWxbSH/5hM7ReNQPdabvj7llmh7C91GYceGL4Igm32OwivbMUBzgpPJSmXLxWv6p6vLS5XxwtuiSy374hhleNR8KuFowL5kJpoJZuQA3EME54zZYO6e746jaEG1mJNLKdncMi47B3VkBxy48vmxDkUfLvF+/wbFiI79c2DdVNk/BttMoo8DsS+R5YErmY2pHWN9002x/3fuKPkIz/MOFGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 17:26:03 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 17:26:02 +0000
Message-ID: <ce6366ed-4a9a-4a8d-9207-f1da487dca62@nvidia.com>
Date: Tue, 28 Oct 2025 10:25:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpu: nova-core: merge the Revision type into the
 Spec type
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
References: <20251028023937.1313108-1-jhubbard@nvidia.com>
 <20251028023937.1313108-2-jhubbard@nvidia.com>
 <DDTYCAZWUZL5.36Y1LKLB8EUD6@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDTYCAZWUZL5.36Y1LKLB8EUD6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:a03:180::36) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bbaf124-4205-44e6-2ffd-08de164711a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ymd6dk5lbWdlMlh0eWE3UEFkZDJHa2QzMEY4Lyt2MTArbGdLdGF6OWhPQ21Q?=
 =?utf-8?B?Qlh5bVR5RlljZE9RMDIxem5MSHRQa0g0TnRhc1YyQUd3bEJWYm5tNUJ0bEZM?=
 =?utf-8?B?T3BjZEZPb2E0cnRRWWRyZEQ0V3BUanplUUQxdXhBdGp3MHlTUVAzY1Q0NnZ6?=
 =?utf-8?B?LzJpcWJrZy92cXRVeldKeGIrTXBiQk9ReWdHcGRPWHpEMSt2akY5NzNnWHkz?=
 =?utf-8?B?cEY5LzBLU1RHWG0weWErNzhHOHNCNGEycVJoYkttZlRHcExYVCtVTU90YlFx?=
 =?utf-8?B?N0NTZHFneXJaaWplekFHY25RL1pkZHJtWFpBM2tRNGdFblVtVFlZVHNyS3NJ?=
 =?utf-8?B?blRMZUZWZHZyKzhFREM1bmZ0SkcxamI3a1JXelYyRFU2TmZMODd1RC9JSUhJ?=
 =?utf-8?B?dTc1elJ5Wjk3Smd6UWVweGhra2tsMTdtTjRTOWlWR2V2TzRpR1NhbW1xazdK?=
 =?utf-8?B?R0I2dE1IQno2YmhTU3cxLzRaaEgvdm5TbUEzWHg5emVZWWU3dHRhM0VSbW5F?=
 =?utf-8?B?M2dkV0JmV2FwZnVUZVMxdVhWZTRIem5aU214VHd0K09DeDBTYjRCWHgyZG1O?=
 =?utf-8?B?RVdVVkEreFpCRnc3ejY1UUQ1QVFvVDZ5Q2JZa3hpcmZuWk8wa1dPanZjS2Vj?=
 =?utf-8?B?NWVPUmxmMkV3NjFKZnZLSWJJTkR5cVFTMUNjOExhL2JVVGg0YnpjWGQvR0Nk?=
 =?utf-8?B?Wnp4cEVKcUFHMWRsd3czNzhhVTZXM3VMMkhXeFJvSHMvWDBvMEsyb2hVdWo3?=
 =?utf-8?B?Y0tFbHVyK2lOSkdNZExKZkZYUGtFV2VWV3lHWldnVFh3bWN6NDcyNThyUXdS?=
 =?utf-8?B?UXptYkRnZDZsazlORkZEMFg5NWxuU3Fiam0vS204TjZBN0RtWXhDZGpXOFJa?=
 =?utf-8?B?K1F6VDViS2Y3ZUVDS2RxM1lYWUs5UW9UQ09oTlVVb1daa1lxWDhvRlVWYzZq?=
 =?utf-8?B?L3NTMHB3MlZJcWdveHJLVG1qRUtOU05iUGNQTkpyZ1diZU1BblViaVp6YlVV?=
 =?utf-8?B?Nmwxb1llOGRsd1pBaHNMRHA3NVo2Z0p6dC9ITnhBdWloSVUvanNjLzh5UmpF?=
 =?utf-8?B?NFBBY2VEbkd4aTBSRVRha3lTQlJXN2x2bSsyVHB4N0c3WXhiTG1EYkFOOS8y?=
 =?utf-8?B?bW5nWVAycnhGeWNEOENteGphaXZLazV3MlhZMC9QMTlHVUtPK0UzOG03Sktt?=
 =?utf-8?B?bHowVlR3aXF3T2FhUXJoWFBTbHZXQVFEZVBkMWdBVVZoU3pETmF0ZTJrRlVn?=
 =?utf-8?B?YnhvRSthWkE4T25vUGtOUU5GZzhZdlZtU0V3clN0N0FBTzJXaTJtLzR2VEc1?=
 =?utf-8?B?OXQrNi91SzNmekpMeGNjcDMrbWlWSDhIMFBSN25KTGNvZlVOTXJDZ2piMUQz?=
 =?utf-8?B?cG44RnhwOUhONjkyYjJGMGxXWmR0S2RIYjhhblFOT2hqQ283OHAzOXF4V3k3?=
 =?utf-8?B?R3N0em9mMldabURKcUZqbzJaUFI1L3ZIMUlqRVUwOGlKbng3R2tlTkZnSHJi?=
 =?utf-8?B?QWd3K05EVEdLMUNvL0lNMElDSjgzblhRMWxOZGpNQ1hXVFc3MzE1NWNKVXRJ?=
 =?utf-8?B?QlVOM1BwYThURll0cTZDMVkwWXpTbVI2QUhPbWhyV0RkZDY3d1l3RDBQRTJO?=
 =?utf-8?B?Qmd5RGtWN01aOGVoMXVhcVowZlFTRVJOWDhONzFzY1BJY0pyMXo5Q3k0QkY4?=
 =?utf-8?B?VVFDc2t0bzQ3elhjcVVjUXZPTlZ6V2xDRmFoc2tqZW1VcWlDUWs1MG94UWpF?=
 =?utf-8?B?YnNWVHBYME1SVlgxMWd5OWNGVm9IV2hGVlpNRUlzVUQrc1BtNmRBbk5qVjBn?=
 =?utf-8?B?cFppa3FPR1VJNklwZ3lxNUZPcXN5dlduSGU3VGgyRVRKNlIxZUg5VzMwNVZn?=
 =?utf-8?B?eGt6SzdIYnhaOUFlczVpeU0zMDUxWHRRL1ZZL3lyY0htdXZMaDFQZFRTNDlw?=
 =?utf-8?Q?i1vaEV+utCJoxm5mnS0mwwcqRd1Y99sZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBPelpxYkFLeTg5M0c5TU5OOEhqK2hpS2tWYXVEWGNoTndFVENrWWdNMGxE?=
 =?utf-8?B?ZTZxaTZxUmVXZ09hS2gwNFN6cEVUMXFZMDdKUndUSzREbHZnQVpJOWcyZ1hW?=
 =?utf-8?B?MDdWUXExbDRhdmR3ZTZsRkk0cXk5ZWxEcWpNVUQxdHkrb0NWcVpWU29RaFpy?=
 =?utf-8?B?V1hyQnJ4NUt4dDlQZHQ5MXFFei8vSjk2TW9BZ0dybmVUUTZJWVNtNm95cEtt?=
 =?utf-8?B?TEpDckpjQkpKSmt4ZFRNd3gwZ1NYUnpmWTVtL3VtaVBDYW5GMTJBM0VpaXhF?=
 =?utf-8?B?V1RHUWJXWEpBYnNtZW5aVGdnUGtFQkJ5QWZaVm9Pd0xPTm9US0w0RUVuL1c4?=
 =?utf-8?B?a1R1YVBCd2h4VmQ3b0lJem1IOU9lOGU1bnBiamQvb0d2NGhGZjRqMENMTWov?=
 =?utf-8?B?K0NXWUxjSjJzQzlsNS82TzQwK0FxUnRDZE04QzRBODdFeWFUU0tic1lleFFU?=
 =?utf-8?B?Q25ScWNqL2ZyMFpHZEZRU2hXYVpuWjhDNUlvV29CNlBQVXZJNUFLd3JwVUQ1?=
 =?utf-8?B?RFcvS0FpYzcyZThrY2xyRmNyT210NmRGeWI0YmR4R2tVYThlR0ljQk5EVm1t?=
 =?utf-8?B?d1Rkb3VpcXFIcXo5OFpqeFl5UnFRVU9UUkdsbW1ObVo5S21sYldvS2pIblo5?=
 =?utf-8?B?Y3kzdU1KZHFOWFZyckFYWG5TQmMrbEs3TC9zYTZPNS9XSVBVMGNLOTJva1NB?=
 =?utf-8?B?U1o5QkFYSFFVNkN3Q2pCZmJpTXEvNEhySUJiWDFpRFQ5RDNKVUZuNWhuNWdN?=
 =?utf-8?B?VWxXRmJkQmEzSTF3cnhxMjRDRmNVcHFDc1BuTFczNGhOVDgzTTR5aVk5OVJW?=
 =?utf-8?B?a1U4bWR6MlgxOUl2bUx0T2RJbUttcnBHekF5ZitLTXZ2dEQrd0dkRGRQa1Q0?=
 =?utf-8?B?YXNSbnQ3Y3JJMGR4NHdEc0ZZNDk5MzM3Y0VKaGZ2d3k0SngwZ0c5MG5IcFY5?=
 =?utf-8?B?TUZIdWhpcjFZa05jZkFYOFZLSW4yVHZPSnU3b0xZYi92VzFlZ0R5cGxxUkxN?=
 =?utf-8?B?a2U3ZUpZVUs5eHgvVVQwcUFVbFdvcHZGbjl3YW5ZNWNjc1V4ZHJGUXhKOWZz?=
 =?utf-8?B?UVZmOEg1bUxBR3hjRWp5eDVPZlFjRkl3RFhYTXZsdXVabWQzSDFGb0ZKZnBJ?=
 =?utf-8?B?dENlVk8rUGU0STBGV21zYU5IaHFpaDNBMzAxMVY2VldPck0xYmxPR1dZRTdH?=
 =?utf-8?B?aW8zdUIzRElkUi9tR0drcUlKUmlDL1V0Nk43MEVzaUZIQWpIL1FlUHZDMTAz?=
 =?utf-8?B?Y3N5VW9RMmxYM25TVXlwbHYrM1A0RzFJdG1wNHQ1dWlCNE1nREg4RkFvZGV0?=
 =?utf-8?B?VUtHM1g4d2MwS3ZKdzZhU2EwN1VJblVraTFUZE5RMHVRRXFiTEwrUmFlcW1X?=
 =?utf-8?B?VGN1b3h3UnRCME1lQ3Avb2N2NHI4d0J2L2lMNjVPYUJBL2c0TzJPWWpaSFlW?=
 =?utf-8?B?QzFjb1BGUjQ1aEpPL2E1MlJMZUJBUmIzOWNsTlZiUklRcmUrYll3YWJBQzFN?=
 =?utf-8?B?UkVLVWlLR1poWDdyWDBabkY3eVAxZUNuV0ptMCswakdJNTlQVFdlM1dJYjcw?=
 =?utf-8?B?cU96aUw0ZUNiZ3ZkTkd4TGg1TlE4azVKaG8wMHVhZVhQVE1PNTNDRzB4WlVP?=
 =?utf-8?B?RjV5QVdIM3gyUkRDc01NeHl5NlB1eGl6VkhUZGxaYmZWaitPRGtvaXpBWG1V?=
 =?utf-8?B?MjNkVk5CUmtmeFZOdERMR3lOY3ZuaDFKbEhDdUJEekZTRlFjN3VJK0dtSmt6?=
 =?utf-8?B?TGpMNGZabCtSb0F4OFh5NmtOMzhTbC83c0JESFc3U3I0UVlGZWVhczEzNDAx?=
 =?utf-8?B?MVZNUFIveTQ1K1dHZ21KbVFCd1N6NGdqZG5ydksyWEwxR2RXQnVIeG9ZOUxa?=
 =?utf-8?B?VXJMZWFWQUxyaEJaejMvTjA2THo2Z2xLRVlrdVdlcjR6bFpsazBYUmVQbk1P?=
 =?utf-8?B?ZWV5WjI2aWdpclI1dWk1aE01aGV6VFVvc1lmOFdORm8yeVFyQkhzV01qWTdC?=
 =?utf-8?B?U3hmQUFyMENxL3BvbUh6aTdQcFN4eFV3NHY5WFJpQ1c5SHlaRDlGb0M0SUxL?=
 =?utf-8?B?NnA5aUk0ZGlxdGNPbDJjZ0M4RVJlNG9KUjZJVTNocmlwNkxNUkpmVStxWXFW?=
 =?utf-8?Q?NrrQ94antdU64CO9j7aZxkJnF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbaf124-4205-44e6-2ffd-08de164711a1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:26:02.8712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uk4hNQz6iYIVHFfKE7ficWoQ7ymljFuKpK9qZoCZbqYiKP+aUO0Rr3Uh+Selk9Sg7cUNG4WYZApkfdRjXPmIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078
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

On 10/28/25 5:25 AM, Danilo Krummrich wrote:
> On Tue Oct 28, 2025 at 3:39 AM CET, John Hubbard wrote:
>> -pub(crate) struct Revision {
>> -    major: u8,
>> -    minor: u8,
>> -}
>> -
>> -impl Revision {
>> -    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
>> -        Self {
>> -            major: boot0.major_revision(),
>> -            minor: boot0.minor_revision(),
>> -        }
>> -    }
>> -}
>> -
>> -impl fmt::Display for Revision {
>> -    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> -        write!(f, "{:x}.{:x}", self.major, self.minor)
>> -    }
>> -}
>> -
>> -/// Structure holding the metadata of the GPU.
>> +/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
>>   pub(crate) struct Spec {
>>       chipset: Chipset,
>> -    /// The revision of the chipset.
>> -    revision: Revision,
>> +    major_revision: u8,
>> +    minor_revision: u8,
>>   }
> 
> Why not keep the Revision type and its Display impl as well?

I just felt like it's not quite pulling its weight. But clearly
that feeling is not widely shared, so I'll put it back in. :)

> 
>>   
>>   impl Spec {
>> @@ -162,11 +142,25 @@ fn new(bar: &Bar0) -> Result<Spec> {
>>   
>>           Ok(Self {
>>               chipset: boot0.chipset()?,
>> -            revision: Revision::from_boot0(boot0),
>> +            major_revision: boot0.major_revision(),
>> +            minor_revision: boot0.minor_revision(),
>>           })
>>       }
>>   }
>>   
>> +impl fmt::Display for Spec {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        write!(
>> +            f,
>> +            "Chipset: {}, Architecture: {:?}, Revision: {:x}.{:x}",
>> +            self.chipset,
>> +            self.chipset.arch(),
>> +            self.major_revision,
>> +            self.minor_revision
>> +        )
> 
> This could just be:
> 
> 	write!(
> 	    f,
> 	    "Chipset: {}, Architecture: {:?}, Revision: {}",
> 	    self.chipset,
> 	    self.chipset.arch(),
> 	    self.revision,
> 	)
> 

Yes. That is nicer.

thanks,
John Hubbard

