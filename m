Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BD9A31F8E
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 07:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78D10E7BE;
	Wed, 12 Feb 2025 06:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WshZsmyU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF76310E7BE;
 Wed, 12 Feb 2025 06:59:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VB2PliK0mxzxnvAuUMIqhKlFoMqX0h10IDpHTWzDNs5iphYPhoBQzyI9naFYIoMNvx+wrhUuUTq+xVxwWv2UiJs1NtCpFy8zo/EVsbPNUSShxKFQYcknF8qNED2sg10IAS9GNa5gaCG6XhrhAZUVqlieHnaHAku9abmjYf5Iy1Fic8l4YX16tgwEkKhXa/+KBxGOfE6uzB3viJXuJU9wGzwqIc+YoZALPFQfVqPnvquDI3sQ7OfoIpkDYjP9qVOw3szcKUcHCjH5ZqNISM4FolFaVmy0hvYFvHm1QyQJsk/JcyBx9JbV0bEbYrENw1qLJUy8ln/RdgDYJZDWXkrzsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQQeOrIjZDf9dqbxvILF3BjCSnYEqPanNnglartZZHw=;
 b=tDUZsledAN+JL5xnbBfJzOGyFbHGZHPIbfzMLy+uE03UPOeDEoa4d7CYq0pLASCAsSVFTU4p08v9hn4Te+h5jlsxN7XdIHKUjIpYjq/qmCHUPCCVmUWfEKQw5iP9h6qHotrqbsu8vZZ+NRfyrGyMjmGcwtiY6IdtG35iVRkawoKwfM0qDDg8wB5yAPYl0U7/EppJjk9XaHwwjz+4Knf6VfBd7978OhIUCM++LFdNG2O5d1siLjyqmS1qLrtUZqHLrDN291ix8HH3o9wUx1uZJXm/FkMPzKOChVbsgRiHkFXTo6dqvQliMsjtH8uP2WdYdKFt+lfx7/Za74JVyQ06JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQQeOrIjZDf9dqbxvILF3BjCSnYEqPanNnglartZZHw=;
 b=WshZsmyUymIzapGXYQiQEx0NZ5takW2ID8uugrR/D3JGdXWjGxtf/cMqeGOMSNu6gjL+ANxa+krsYb5LiI+FHC8O9MPFn8DY+UV7h47oTwmc0hNcwxUWRZQKB4qDJUpu1QtAVSVWqNR9aQv8E0jzeKo3OtER+pJypNwRklbeUVsmQ5iDLEvEFOTOKewIjIQzAePrYihlLj7BC5ku3QNrUIbF5JAa6BYGyvd3WiFPeMWq1g6v6x3EJIX6Qe8iKf6P3EGgiGzYZEd4EdVCZQ/7Vtu6WGAYgoB7h1JYgQZynaTG8ofqaXBOIxUOnxmQwkV6iu+LKySMIR5V7fvr8w0/ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 06:59:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 06:59:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 15:59:25 +0900
Message-Id: <D7Q9U36L6M2V.2UM9CN44RJTON@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>, <nouveau@lists.freedesktop.org>
Cc: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiwang@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/nouveau/nvkm: introduce a kernel doc for GSP
 message handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207175806.78051-1-zhiw@nvidia.com>
 <20250207175806.78051-6-zhiw@nvidia.com>
In-Reply-To: <20250207175806.78051-6-zhiw@nvidia.com>
X-ClientProxiedBy: TY2PR0101CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::26) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4a3b71-49fd-4c92-0e0e-08dd4b32cc4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3RJa1M1Mk9adnRPY1grUXVtTi9ydVdaUnhQQnM5QU9BZ09GM0p2TjYvK3RL?=
 =?utf-8?B?ZTFsS2pwSzBhbEZ2dlhwaFZYQjVDQkNnNVZHcEl6ODVZbW1rOUZBcmdmY0dD?=
 =?utf-8?B?RmM5RC9wTkgzcWN1RUs1SCtJeEZjL3Q0SFFxYVluTTMwVEJ1N3ZUOUlsT2VZ?=
 =?utf-8?B?UWwrNHA2Wm1SRk9pOFBham1tQlM0Tm42bi9NOXZnM0JRZzNXeHNoamlGMlh6?=
 =?utf-8?B?S1FBWnFFTUlTdzdSSFdiSjdTRzZnbWhBUXpWeUxLVWIzWDRpelhnalJCcVJH?=
 =?utf-8?B?ck85bDVyMmV4c0tNK1JKT21URVpoY05lWTNMZU5kOVBDZjFtcUxEVVIxeWRM?=
 =?utf-8?B?WDZqUkpVWVRlRWhlOW1NaXJsQ3FsK05RTXJFSURGeTIzVlVaaXVWR1NrNFhi?=
 =?utf-8?B?OFhHNmRaNDlwVTMwSnVCUVRZYkcrTERLb0VNYW9mUXJUWlpCK2l1RDRIczhD?=
 =?utf-8?B?ZGs0Q25XZmFhcGZkNXUvOWFWeS8vN3VQZlovNk05RHdBZ0FKdm9MOFpnZmg2?=
 =?utf-8?B?YnhRQ2g5Rklxejd4dDZGUGFDN09HNlJBSEpUOWwrR0xYTXZoWHVTbGNxUUVx?=
 =?utf-8?B?K2E5bnZkanB0d0tUYnhVVEcrdWNPUUJ5RW4wS3pLUGhEb3VNaHpIb1c3QU9I?=
 =?utf-8?B?OTdYbDQ5REtHcGo2WHFmL3ZaMkc0NGdWUnF1cDJPdTVhVWhkUnQ1YVZORFhR?=
 =?utf-8?B?QjMzSTZVeW9IcHhkaTFjdEV5WWZlZy9BWmxpaFJJU0xnN1JDL01PVUhmU1pR?=
 =?utf-8?B?dEEzbG9yd1Y4NWU4QTU5TDZsRkhZanVwbjVyaXdKNVQxenY4SENoQkNoam0r?=
 =?utf-8?B?Yno1UHF0QzV4cjZPN3U3TmlaRitCNTNkV0VIZUN1Sk5uT3RFdHZzaEdGeDVQ?=
 =?utf-8?B?Qk1rZUgxOFdvWnV2ckpidkI0RE8vU0Yya0Q0c3dkSkpGUjlLL3F6T1BTT2NZ?=
 =?utf-8?B?NUFyRFI0dmxoMFcvcVVpQTdNRjBEWGZ5U2haWjFIdXlpeHprVHBjUDc0eW5s?=
 =?utf-8?B?NFp6elBRZnVnK0dSaGZoVnh4Z1RvUGpINlpjRGUwVE40RHRZdktOM1lHZFdx?=
 =?utf-8?B?Qm1WT0V2K3FZcExvaks2Qng1c1k0cEtPenhVRzFtdGNJc0ZRQXhaVnBGZldm?=
 =?utf-8?B?T1NLeUdUdGl4THRmNVJuMUtGTEF0ajJZMWgvWVJKQkF1aUlnT0NvQm5uV0kx?=
 =?utf-8?B?eWFEczRTZzdERTNCSlFVRGVLOHNGV1dORHMxbjlmaU10KzJjNW0rbkFnR0Yv?=
 =?utf-8?B?SlZFSkF4MUdNRzhoN1Byc09sQjF5c3ZMUFRzekk2Wms4K0ovbzYrMUVrWURE?=
 =?utf-8?B?bTFaOFNOUWJzdEFHbVd3TlB4RHBOa2JLZlRsU0kvWUMvUkswbWd3Q0ZUVlQ2?=
 =?utf-8?B?R3l3cnlaWWlDa0doQ1VYSjhxVjY5S0pxMm5JU1VYak50Y2dsVHR1UjBQbm1K?=
 =?utf-8?B?SzdUQ3Bsb2dPYzR5SVlEd1Q5ekxZbHZqUjlyRTlWWkFkZEpOYTVEdEFNdVc4?=
 =?utf-8?B?NXAvOGg1cCtVMzBMN25vL0Rqd2JMempuNmpuQ0FVRW54eXJqaUp3VFNxbThi?=
 =?utf-8?B?SjY1cWREcXVHU3hLN084SFZLN1p5UFhRTkhDeVZoQU5jS0hUcmw4dTAzODEy?=
 =?utf-8?B?UEtmcmxiMGFGQVJzOWpMenpweTRiMDJGZWlJZk1lR1IzWWQrbU9SVi9UMGcr?=
 =?utf-8?B?L2pqeXF3TkdsUDFjeUZLQUV1RUxjR1dDWHgxR3VpeVF4QlNXMVo4TkYxTkh2?=
 =?utf-8?B?SmM1K2hzVGZ0dy8vTkVZclJpVjV0RDMrZHlTbTM1T0Z6YkN4aXcxNXlsYm9V?=
 =?utf-8?B?M1VQeXV0Y1Nab3dkb3RmbEw4bkZ0MlZ6emZybktZL05TcDJ6ZUxrRG1oQUFD?=
 =?utf-8?Q?u4tTn56eYcJZf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlNHL2FvZU5pejR6SkNTOHBjVitwZThmUytmVnBxdWt2WW1KLzNkUUF4M1c3?=
 =?utf-8?B?NUNrejRhLzlPQUJFS0lZVDdHM2FXeDBDMlZFdGxYWkNMUEgvTGZmY0ZYRWx3?=
 =?utf-8?B?ZDQzNmF0ak9GUXVYUkdZVVR2WTcyNFhBZlVuNWcvUm9ZMklGdjRQaXRINkI0?=
 =?utf-8?B?bjBzOE5aZG4rTFo2dTRqT2oxREoyY1ZCS2IyT2pmVEIybHkwOXlxbDVkTzJX?=
 =?utf-8?B?a0R3dCt2cE1aK3pVOFFZMUlpN20vQ3VzWC9BOXFrQkw3TW16Y0VKK0hMZkNX?=
 =?utf-8?B?enh3c1lYODNJSmpwbWZXd3lWbXVPSnBCOFVYbVVEb211eHZqMHVvN3hOdkZS?=
 =?utf-8?B?Q3c0c1U4UU1UTGhmZXRRcWpFSVQzdjdyUFRwcWx4emNWUDdTbi9HeVJsanBr?=
 =?utf-8?B?a2lLMGJ2ejRkcHhwUzNZV09wYzIzQ25DQTRieDdRSEcrWjY1dERReXpXSEwx?=
 =?utf-8?B?NVQzZ1FsVWExemhlRE16bFlKVWNBMktQNmM4UTUxaW8vaHZ1aE9xQVVNNTZo?=
 =?utf-8?B?OEJOZkQzUDRPQTd6WkRUOFozdlJxSGNBdk5xY0l4SlZyWFRZWXU1dkRsUkYw?=
 =?utf-8?B?bC95cEtKODVpMG54Unk4bjA0YmJhK2xlTFN2R0tya0VTOHpIVHpodElnWE9K?=
 =?utf-8?B?NVJLQkJDNWlqM1B4R0c4eUwxUFJwcFh1cmNwQm9BZE55MExqL3dxM2wvZWdD?=
 =?utf-8?B?Vmd0TFJZK0N3eEVSUkhuRm9ISHdCMlV0SU5UUjNXMXR3dDlQc2FyNkFCOE5W?=
 =?utf-8?B?TU9qV1J3TjdCcHdzZVowa24yOWh2YlJpSDJkaUZYR3ZqN1NSWnVGZkRZZzh4?=
 =?utf-8?B?TzZNbTNueE9pdlRPd3RLa1FuQmNONFh2UnNEaEZrclQxclM3TGx4akRzZWVP?=
 =?utf-8?B?N3EwekozakZlUnRHZnlDNzVyTzR5UW5lNGhsaFdZRUVJZldid0dhcXVRWlMv?=
 =?utf-8?B?eU9UNGNuSUFSdHJGTlZUMXkySDZna2FWOTRzd0VHRjdqaXN3R2J2VlRiRnVa?=
 =?utf-8?B?UG9qbURkeWFJQzJva29uNmRWdUkzY2V5c3hVMzRoZ2VZTy9uQk1RZmE2YXdo?=
 =?utf-8?B?aUFwUzlXT0NtUzFCTzFZV1BHampZUmlzcGV3YmE1UVhUK1dURXNvR21wSkRn?=
 =?utf-8?B?ZjlTR2tvWnBQWEVjZ1IrZkxpSmZJdzZGMi9BNkVvOEMzNE4wMmU5WFJEYzhl?=
 =?utf-8?B?U1VOb1BqZWtVMElhRUF2Y2s4SEFvN0hLbWZucldlVVFZNSt0Q3lXQ2V0clV2?=
 =?utf-8?B?ZkhKL3l4ekFNeEFNbERWcjRlVytwdkJQa1VVdVFNMUJkRVFIZzEyS1ZicjZO?=
 =?utf-8?B?VUZpUE5rOUtjTElxZ0JmODhxa1kwNzJRU0d4RHNQY2hVNVdqRFRIbGxpOWJl?=
 =?utf-8?B?QjRZSm1wWFNRd3RLNElvRU1vZ0gzWmZhWGhXUFBZSFdKbWttV1Nza3FIdXZl?=
 =?utf-8?B?MCtGVmlpazY3eU5FaXJJVEl4Z09iNXBKSVRvLzBYVW9UMmE5MmZjK244b2Yr?=
 =?utf-8?B?OVhXVm1YWmUrU0J1cWh4NmNWdDFTdkdRdHZjNmJXdFlrKzVDNW1teFltdVJ1?=
 =?utf-8?B?SHI3ZmxTelMzQ3hqbHg2Wnk1R21oaVlVVkxPaXRSZTB3Nng4YmpLQ2ZZQUFz?=
 =?utf-8?B?SGF1R2RmUklwQ3ZGWURyUkVyaXAwWldUYjdqV2NSU3JVM2QzT3c0c05oWUQ4?=
 =?utf-8?B?UnVNKzYxUURnRW4rd2JzYUthbjYyZm9FeWNaeFJIREkzNFJqQ0VqVCtMMng3?=
 =?utf-8?B?UEhxQ1MyaWpHNXhVMG50d2JrR0J3RmI0dk9WMUtxSzZ5cER6K1d2Y3pUdlho?=
 =?utf-8?B?RldaQWJzbDAwSmxuQlJyZG9kQUp3Z25qN0YzV0trYTNqZHI1R3ZUdEhqakVW?=
 =?utf-8?B?REZGdjNnZUR6dmJOTkRkQUVSZ08xOTdlVS9UZDh1V3lqeSt1UVBqWTVkTmps?=
 =?utf-8?B?dDB1d3JRanRTN0RYb0gwbllTalRMUmRycDEwdFBWclZCT3o2RmJjeWdBc08y?=
 =?utf-8?B?QWVGSkJTLzB2UVEvWmpkUGlCNFNWY1NjeTdha05XTVRDUVU2T2hmTVphTklx?=
 =?utf-8?B?SUk1SzZrbC9HcU5EMmFJdWN3c1dLTEdzKyt1bUZtNXJKdllmOXV1bHk3a05U?=
 =?utf-8?B?a2lhdHo5di9rMTdsRmhnZXVqb2JyMkMvaS9DSFduWVp4QnFFVEpmRWxuNTZm?=
 =?utf-8?Q?kusL4V+L/n1o/Eo+LCoZZl0mxllGIDMTcezP/ox7XLdV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4a3b71-49fd-4c92-0e0e-08dd4b32cc4a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 06:59:30.5627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQbeZ5fczTFbR0l6uqMKAORU9kCH76S1tbtDezNk60Liv77CJo9v4dhSUBojw1aCZG0nR534QMOHYG5K1wmQlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
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

On Sat Feb 8, 2025 at 2:58 AM JST, Zhi Wang wrote:
> Introduce a kernel doc to describe the GSP message handling policy.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  Documentation/gpu/nouveau.rst                   |  3 +++
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h   | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rs=
t
> index 0f34131ccc27..b8c801e0068c 100644
> --- a/Documentation/gpu/nouveau.rst
> +++ b/Documentation/gpu/nouveau.rst
> @@ -27,3 +27,6 @@ GSP Support
> =20
>  .. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>     :doc: GSP message queue element
> +
> +.. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +   :doc: GSP message handling policy
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index bc16510261b8..2d0b80a733d7 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -31,6 +31,23 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 =
fn, void *repv, u32 repc);
>  struct nvkm_gsp_event;
>  typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv,=
 u32 repc);
> =20
> +/**
> + * DOC: GSP message handling policy
> + *
> + * When sending a GSP RPC command, there can be multiple cases of handli=
ng
> + * the GSP RPC messages, which are the reply of GSP RPC commands, accord=
ing
> + * to the requirement of the callers and the nature of the GSP RPC comma=
nds.
> + *
> + * If none is specified, the policy is the callers don't care. Immediate=
ly
> + * return to the caller after the GSP RPC command is issued.
> + *
> + * NVKM_GSP_RPC_REPLY_RECV - If specified, wait and receive the entire G=
SP
> + * RPC message after the GSP RPC command is issued.
> + *
> + * NVKM_GSP_RPC_REPLY_POLL - If specified, wait for the specific reply a=
nd
> + * discard the reply before returning to the caller.
> + *
> + */
>  enum {
>  	NVKM_GSP_RPC_REPLY_RECV =3D 1,
>  	NVKM_GSP_RPC_REPLY_POLL,

It would IMHO look more natural if the documentation was introduced at
the same time as the variants themselves, so they are not left
undocumented for some range of the git history.
