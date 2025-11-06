Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17CC3D7FC
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 22:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908DB10E9DE;
	Thu,  6 Nov 2025 21:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UZQIBwkW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFE110E9DE;
 Thu,  6 Nov 2025 21:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eufhL2yBuynUDdrv2h7YwJvUwEoq2CY82SqAXavMMjEs0dom3DcFOrFznYHi4GskQHlHK7SEsD2BKu7G7egrISOey5RbO/IHxR7S1WxbSJqX3Fl+rsGXIdJd3GJCWSM0e2oDV+nO2Qycvr9lqfTBZdruyC53pwDdBEGiDZi8oy6s4ruINey6IWs9IyngbP/5F9hMGCsbeVuokrRLVmQnl/KCpFf/tsfzuHku02BrxEcHbdU+pYdKvPX3gmUA73mn8wXr9S7D9ASEvqKp+CFFgdnTmtN8PvYplJ1WywxPTvVX7PwgQS01HwSD+k2D4pOOeChHKZusi8rBVWSCKVJTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpciNXXDLsL05UdzUqE3O9Mh8vL38ksZt8mM/fnJ0ms=;
 b=FoOJXimodYbkzFmfQQInRXefGJ63jzyR0tVQZJloa4SrK8M1szexqu5NuydEKZ3k2jkEGrMVvYyOeGxP8+Zyrl1m1iJirr7L85zBnXze1EBVkySOwRnPpSvvjzwZYSRW1euu0oHpchVZX45F+DlceXrKd6MrZUaeZvIuzisQsCOQxkJnt8bL7iCWZHADdxJeDRnMkmn6YdSVttMXIk4qxzwn54wtiZhIt3N3wtj8/v8Z4pB1hj4xnrvNRd2d2e6D4hFVJ4HfoZ+BEzea8wLPLe/Id2d6orGXq3F5o6jS4GdPYEY45h+N4c95yVoY9WQQ7MZ84eioDDOYTcSjrvQC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpciNXXDLsL05UdzUqE3O9Mh8vL38ksZt8mM/fnJ0ms=;
 b=UZQIBwkWuAoPevow3aS7t8Facw0tWb4T0/44qElpJpZ7bzWxZ++xNSBG0RizaHszce/fi7R+Cl2FjmLQ5ttqxD3EH/KkWyu/6WhK0URDuOZm4MF7JHrUtBQ7pP8hffFS3kk7PvawE5lj4/lUtE6pdwj9Pyaiy7F/8fRoFZ7ZAqw7y8vwfXcRRRpfa1K+ASHhBxgLMN/y0GWex7uKruNTgnDKZq+S3PnBMQgZpaB1On/1Np7It8UDolj8M6793hjfuX/DmXTwalOGehRaz4Q8VbUrYq26/ylkphs45mGtdZrKietoU4YenP/mdusLHIrrZwrEvTuOptJn7cVVAcp5oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA0PR12MB7775.namprd12.prod.outlook.com (2603:10b6:208:431::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 21:28:25 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 21:28:25 +0000
Message-ID: <c64e59cc-6a09-4107-8b98-f5f40a4b95c7@nvidia.com>
Date: Thu, 6 Nov 2025 13:27:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] gpu: nova-core: add boot42 support for next-gen
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
References: <20251106012754.139713-1-jhubbard@nvidia.com>
 <20251106012754.139713-4-jhubbard@nvidia.com>
 <DE1FKDK4YMH2.31M2ZHUOKEC1I@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE1FKDK4YMH2.31M2ZHUOKEC1I@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA0PR12MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e4ac1e-11d0-47b4-4a1e-08de1d7b6b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TllEbjdhZmQ3MGNESktGMVRWRlI3RzFiNVpscGYwNXI5cEkvNWlSZjdlU2di?=
 =?utf-8?B?dyt1ckdpb1UyTURFYUJsU0N5bjdROTRQc08xVmxxdnBDNTZrd3NETjhYM3NC?=
 =?utf-8?B?aVhOd3VkQ3VEMzkwSGYvUWpQSW5hZG9KaHJid0hRTWRMMjRqM2FiSlFWQWkx?=
 =?utf-8?B?blA0dG5DU3dCSjVwNE5HcS9rMm5RUVdSZjdlVFFMRlY1RUVyczlWVllNWm9L?=
 =?utf-8?B?MlVHM1hTa0NmdUdNVUxvaVp2S2x6MWhMTHgxM0JHY2JjaUVjaHFmSkQwUm9p?=
 =?utf-8?B?T2FwR3NGekVKZEhQSm5pdFpoeExObURMU0dHZ1d5OU5DWE9XMk5NMzhFcXZW?=
 =?utf-8?B?YUV1NTBlalpUNnhTY1RSNjhkVXZSc0IzVWYyYjloekFOTlE1UGFWTTcyaVIw?=
 =?utf-8?B?NlhseFhlazRuZHFYajVqRnhPZ2doejVkSWErV3ZVZ1JaZFRrUEpkSVJrL2kv?=
 =?utf-8?B?WUNkVzBTYVFNVDNPQm94K0RiTHRibG95dWQ0Qm1zaHcwQXNkT1VNQlpqMVRl?=
 =?utf-8?B?eWFic3ZzTDRFMUE0YXVqT01sZWdidmJVMlhpRnhUaHdrQUloSFJZd3crK0xX?=
 =?utf-8?B?SHd0N3l1Y1hENTg4YkFiU21NWWM3TzFzU0RrTVlHakxmVk1abyt2NlhwZFFS?=
 =?utf-8?B?YmlpdHFlRFdMZ050SHd3NXN5V0VqUlZlMGJqUVJycGcyU3JNVys0STdNM3FV?=
 =?utf-8?B?UGEwUmo5amZDTTdnTGtiWGtoTWhIemhDQVAxOWswVXRlM3diWU40OUM1NGtI?=
 =?utf-8?B?V2xFckNpdlpEeERWNjNaUmplVWhtOU1rOUVFc0VOaDF6RlB2dThRMXNiSGVI?=
 =?utf-8?B?RmR4NFcvQ1VPdkhwR1lvN3FlZ0pvNTk3OXllb0Nvblo2aS9VaUFMcTd5MmlN?=
 =?utf-8?B?RnVWK2NDZ2h0MWdjaUIwQUxZUkxselk0ZE55MVZLK2l0YjR1MGJCbS9OZEM4?=
 =?utf-8?B?aWRCWFVmaUZUdDR5bWNlRWRVRUxIZzNsZXg2RGtzM2ZmRGU3Z1l2Y0RHTmxG?=
 =?utf-8?B?QkpWZEVrMXJuNDdteWhha3Y3Rm1jYmpNUloxeWlFRDIzUVpMYUliVG5zWExw?=
 =?utf-8?B?UmdHWkVsRTBjUXVsZDNKamFWeWNGaHMvcEl5d2lvWTR4VWN2eHF1WGdGbHBL?=
 =?utf-8?B?QmFxWUpweFBmeVhYaVRQdVEzZERMc2VCcWdsc05SNDJVSUdrR1kxSGg3bWhY?=
 =?utf-8?B?RHdKTGdxZVRPc2tzU1NRZDFYWUtlVXRTTEhEbmRVRitQdE5KQ2NvUWMrSmVG?=
 =?utf-8?B?eVlQVUFRaGY3b0hBaklnYzVSWGtCdUc1S2U5VUdzeHB3c3dnOCs0c3diMkM2?=
 =?utf-8?B?YjVYTlJ1VUR0em1vdFpJSHVPWmxjSTJGMXdIanlVbndMczJtM1N2S1JXZEI1?=
 =?utf-8?B?VTVZZzdMdFBvaW9WeVdEbHo1aU11RFh5RnlTeWZtQ1hnbzcvbk1HWlBsRncy?=
 =?utf-8?B?K2J6UGd1UVFYVW55Q1lCUEUxUFFaY0Fzd0RtTWI4NzZPeE9PdUg2cEZiWUY3?=
 =?utf-8?B?SEh1NHBwcnl3MDJYbk1tYTlsbGZpY0NWblBUWnM4Y2VoVlhPRVF3WC9YRVY2?=
 =?utf-8?B?aCtEL0sraFZtektNU3l1M0JRVXQ0YkN3WVdDcWNPQy9zUDh2RHcwTTJhMVRz?=
 =?utf-8?B?Z3FRc0IxUW1pMzVlMGgxY2lTQU8zWUlTN1dYWFdYdHEyTXVGcHZHSTBsem9s?=
 =?utf-8?B?NUdlaFd0Q1RYVFNWUXlaUUtqcDRBUTVWaTlGb3RVSUFta3pGSDNTSG5wV01n?=
 =?utf-8?B?U2xiVWIzOFBWRkhQczNZYnBSSVMwSGZJVE1qaXNJZ0JFUkYyWFp1MHZubnZP?=
 =?utf-8?B?UTVoR1dVeEtOM3NIbldxcnpOWURHY3dDWFdNRXpqMWJzWElvYW9ZR25EN3py?=
 =?utf-8?B?MVltMkU0ZDdOQ2piTjhMK2FqMWdGV3p3M1NRbjhzOWVJWERoU2VTY0gvRmNj?=
 =?utf-8?Q?V0yXk57DUR2IWVcjddxVk3oblttKjrw2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVdnYStHTHZZUmxQWW9vMmhud0oxbGRCTzY3TC95cHdSUms5YThCRVJia3ZJ?=
 =?utf-8?B?WGNRbHhlWXVlM2x3b1htZVM1eFYydEZNcFBwRENFdWkvMXJ2QUZ6ZjRFeFdZ?=
 =?utf-8?B?TmNndE13cGJpYmo3cUR2cTBJZGdpdUZTZWYvbkVjSHMxNGk3N3pCc21DRi9h?=
 =?utf-8?B?TFF0cG5rS20yS0VDc3hZMlhWSWtRQzlNK21OcjJKYVphc2R6TktzdXJBc1Fv?=
 =?utf-8?B?TjdWWUJiVlFtNUhXMFBKWU9DYnN6M1dNSXNuS3RPV3c2L2ZpSmt4dVdlTHVr?=
 =?utf-8?B?RkM1OUtTZTE1SC84ZzJtU0QxSmNOUWR3dWZjVGxSd20zdUtmTEJ2aWJvSjFK?=
 =?utf-8?B?bDVScHFIeVo5OXBVUE53bHQ5QlQ1c2NLVHBCWmJHNE1vQ2ZVWDdjeHNkYTB5?=
 =?utf-8?B?cFBkZ0VpSEI0TVcrdy9kcW03ZTM0NktJQit4WW5wa1BDMVRCWlloYm54SjVC?=
 =?utf-8?B?RS9HYjFYTjh4VkEyaUtTbEZERFNtUXdIWWRUUGZKZU9KMmxzSlRqNnJrQkhT?=
 =?utf-8?B?a21RRi9IM2tOSU83N1RZK1dWT1NnN0IrWkdnUVNYdXZZcUZySmYzdGwzZDR0?=
 =?utf-8?B?YjV0MzAwaWE0NUdFSXc0aG9IbDh3dTFvUkwvbnNCR2JpbzhCOE1TbVZESGZ1?=
 =?utf-8?B?b1hrclVXeEQ2RXdlYzdSUzJNL2o0L0VhR2ExWjlBN28yNEk4NW8wcFMyRTQ4?=
 =?utf-8?B?aFl3ZHF5Y0U0bEY4a3VpRHMrOEpzQThpb2MwUFRPcWVrSVk1K2Q1QWdUY0hZ?=
 =?utf-8?B?N09YcExkQ3BiZ3I2OUpEakU0dkhxRUozaEVNbzM4WXk4aEJBcFdYMVFQa05B?=
 =?utf-8?B?RkpqL3FZQkVXUGNYdDNPc3hBM0lLMHJpRDdUYjVaT2FqWHh6NXBqb0p4ZW9t?=
 =?utf-8?B?ejAyQzhldVRWNSsrUWZJQm9LZko2R3hvZ3JaTWd0dzE4VGVabkF6OFMrUG5T?=
 =?utf-8?B?ckFwcCt1Yy9Oa3plMUk3NG5DZm9EczZzV2VvMHlpcnFZenY3UGJRRlVzMzln?=
 =?utf-8?B?WDlkQzVxekNmRzdRb0s0ZkNZZkIyanNrSy9OREJFUWNXakVHeWV3dytHaGl6?=
 =?utf-8?B?Sm93bDRUejJvY0lnQk5qam9HSjRrUWF5dWpkdjN6R2hYUU5yd0VjSnpXT2dm?=
 =?utf-8?B?UWNRcFJMQ3I5dkg0WWNzcmR2cVJBM3IyTEdKWFZSVnBnSzJJNXp5am02VjlO?=
 =?utf-8?B?WDlmbFVJTWNSaDQrOUF2dGNQb2NYZmYrWkFoZGpkQXZRSXFiUXV1NjZsaXl4?=
 =?utf-8?B?MXdaUFE0NWNUVytlczcxcldwZWl5Q3JnWllzMlVhMm9xYk1Ba25VY1VBS0Ra?=
 =?utf-8?B?YkQ3ZjJsNkZNdDJKVWlrVitoOWxzbGgxL25tVjJyYnE3aW9YdHd2QXhrc002?=
 =?utf-8?B?T2lSdzhtenFzUCtoczdqam9neXc3RktMZ0FQYUNXd3FiYUdKbStyY2ppQkFo?=
 =?utf-8?B?YzhSVkxjTEJ4a0Z0RVl2NmV3Q1dsWm1DOCtpMVBSRWJCS2thMmhab3hFemZa?=
 =?utf-8?B?bzAzejdYOGFuWEMxZzQyWjdmT3N2QVJWc1ZLZUJYaUFlWmZJL3g0TVYzTGNH?=
 =?utf-8?B?bmpCdFkyeWFoc0Uyb21XNThUckRXVGMrbmVoODlmdkdiZVhEOXh2c1FYMDNZ?=
 =?utf-8?B?K2QrQTV1b3pXKzkzb2ozL2phVVl2RGVKazJjVWtnZTNwL3EzVmV6S2Y5TEFZ?=
 =?utf-8?B?a1ZtY20zVklnZUx3akhvRTRBRmc0MitrOEdXOWhsNmZuU0RhYlRhcU9lcEUw?=
 =?utf-8?B?TUlFc1Bibi9MMy81MUlkaG9Vam5pdHZUWTBkYTJ6T3NROFh5c0E5SHRZZDFO?=
 =?utf-8?B?Zkp5RWJVS3o3L3NQSTJLVGRoQk1ES0dRSjJ0Y0p6YnZnZ1RzUHp5V012dHF6?=
 =?utf-8?B?WndPTFR3YjBYd1JhSnVMK1IwczFVbHdERnNtMXpnQnpna3YwRXFmcTFNNytn?=
 =?utf-8?B?ME4yVXdsakU4RWFwUU9NaDJ3VnlOMGRZZnozcllnVnpQdnR0Y2N3YTZNSEpi?=
 =?utf-8?B?UTRyWHZzZmg3QVZ2TTZBY0h0UWZGMml3c09MZ1dNUUE3YVVMOFJnY2xST1p5?=
 =?utf-8?B?SnZxbUFpV01ZYzRuSENwUFZHeGNNUUYwUmtVbVNIK3YvNGx6NGV6U1BBcVhm?=
 =?utf-8?Q?RqyJBuu8IcrChPtPQydBugrVX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e4ac1e-11d0-47b4-4a1e-08de1d7b6b59
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 21:28:25.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVKhP8JkNeQzhGayTMG1eJHdHiGXlXv8uQzqDICR6XjKLlLpapaeJZ3zaZL+Kjip/E2nHKnrdCP6GKNiC771pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7775
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

On 11/5/25 11:24 PM, Alexandre Courbot wrote:
> On Thu Nov 6, 2025 at 10:27 AM JST, John Hubbard wrote:
>> NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
>> architecture and revision details, and will instead use NV_PMC_BOOT_42
>> in the future. NV_PMC_BOOT_0 will contain a specific set of values
>> that will mean "go read NV_PMC_BOOT_42 instead".
>>
>> Change the selection logic in Nova so that it will claim Turing and
>> later GPUs. This will work for the foreseeable future, without any
>> further code changes here, because all NVIDIA GPUs are considered, from
>> the oldest supported on Linux (NV04), through the future GPUs.
>>
>> Add some comment documentation to explain, chronologically, how boot0
>> and boot42 change with the GPU eras, and how that affects the selection
>> logic.
>>
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Timur Tabi <ttabi@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs  | 38 ++++++++++++++++++++++++++++++++++-
>>  drivers/gpu/nova-core/regs.rs | 33 ++++++++++++++++++++++++++++++
>>  2 files changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 27b8926977da..8d2bad0e27d1 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -154,6 +154,17 @@ fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
>>      }
>>  }
>>  
>> +impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
>> +    type Error = Error;
>> +
>> +    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
>> +        Ok(Self {
>> +            chipset: boot42.chipset()?,
>> +            revision: boot42.revision(),
>> +        })
>> +    }
>> +}
>> +
>>  impl fmt::Display for Revision {
>>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>          write!(f, "{:x}.{:x}", self.major, self.minor)
>> @@ -169,9 +180,34 @@ pub(crate) struct Spec {
>>  
>>  impl Spec {
>>      fn new(bar: &Bar0) -> Result<Spec> {
>> +        // Some brief notes about boot0 and boot42, in chronological order:
>> +        //
>> +        // NV04 through Volta:
>> +        //
>> +        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
>> +        //    boot42 may not even exist on some of these GPUs.
>> +        //
>> +        // Turing through Blackwell:
>> +        //
>> +        //     Supported by both Nouveau and Nova. boot0 is still necessary and sufficient to
>> +        //     identify these GPUs. boot42 exists on these GPUs but we don't need to use it.
>> +        //
>> +        // Rubin:
>> +        //
>> +        //     Only supported by Nova. Need to use boot42 to fully identify these GPUs.

Ohh, I scrambled the comment when I added Rubin to the discussion. Actually,
the first sentence is correct, but the second is dead wrong. :)

Rubin will still key off of boot0.

I'll fix this up.

>> +        //
>> +        // "Future" (after Rubin) GPUs:
>> +        //
>> +        //    Only supported by Nova. NV_PMC_BOOT's ARCH_0 (bits 28:24) will be zeroed out, and
>> +        //    ARCH_1 (bit 8:8) will be set to 1, which will mean, "refer to NV_PMC_BOOT_42".
> 
> From the code it looks like Rubin and "Future" GPUs are handled exactly
> the same - do we need two paragraphs to describe them, or can we just
> have one for "Rubing and future GPUs"?

They are not. The code is correct but the comment is wrong. 

> 
>> +
>>          let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>  
>> -        Spec::try_from(boot0)
>> +        if boot0.use_boot42_instead() {
>> +            Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>> +        } else {
>> +            Spec::try_from(boot0)
>> +        }
>>      }
>>  }
>>  
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>> index 207b865335af..8b5ff3858210 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -25,6 +25,13 @@
>>  });
>>  
>>  impl NV_PMC_BOOT_0 {
>> +    pub(crate) fn use_boot42_instead(self) -> bool {
>> +        // "Future" GPUs (some time after Rubin) will set `architecture_0`
>> +        // to 0, and `architecture_1` to 1, and put the architecture details in
>> +        // boot42 instead.
> 
> If this is "some time after Rubin", how do we infer that we must use
> boot42 for Rubin, as the previous comment suggests?

Right, we will actually use boot0 for Rubin. Thanks for catching
the inconsistency! 

thanks,
-- 
John Hubbard

