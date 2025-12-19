Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F1CCE629
	for <lists+nouveau@lfdr.de>; Fri, 19 Dec 2025 04:43:43 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F0CB010EC9B;
	Fri, 19 Dec 2025 03:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bDEG1yRY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C17E044B95;
	Fri, 19 Dec 2025 03:36:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766115369;
 b=ryMqCY28Ibzj1fG9C0HsjofEY4pNjvj4GelPZbO7IL2Qo3KR66aDUONLBCGpoJjAHLB3m
 sSvaNkHZmkUCOFOGXpgyK1gdcij5SD5rL89QBrSpdqLBxuayq+Cln++GNOWcKWUoPD/7SOy
 xV0aGEl1rcqWm1iEfQRLqLfl7X33nxxbqq2mDerJMOpFfWrCvZJaLXGo6Spk94yhr0G/BZ3
 UuxP6jBxzeUNZPfx2BnfqTccoLcIh19txKaSBspxqP6vRt392JTA7HcLTe4toMwwwzK+uHz
 P7/GS32PnIY8uxzF/KsyRtgO03A9hFg+wQx/lwSqTnUpvfB2+Deib4tFHBAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766115369; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ft8gM/nyTM4NtLbu8RQRyCpZbcXyc+IQv1sO/juiuQs=;
 b=CJs3U+zlAZYydi2djTky4xZa/4XXF6uXIpENBYvL5dltwN96/O2waRw2jQhAe1B+Jhm+c
 6l4xPq86+T8M0+osFtVws5CnOEdMFtRLtrhtqvUYD+0eAYGZmZWoU3C9HHr5i4mzezxxd3b
 QKuOqtxSTivMq+s4gPTHFZhfX1dvgSCycElt0aOpXmnyGz5LK+hxJSLeVYmokj2acgZAuCY
 VrBDr4nmEtU8j4oxznLyPep4i4d/CgVAPkJ2fo2u7uqhhWMmzxg1y3kgqMHwOIWbdcxZP4o
 zgcxAirkcV6ixKizBusULaXHWetBS2fzAiyWs57uxuloAZAETQOGbuy3rHoA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A2F6544B95
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 03:36:06 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 84F1A10EC98
	for <nouveau@lists.freedesktop.org>; Fri, 19 Dec 2025 03:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHoolU8at3yAgN4AaAnyEr1nE5vfncZn8nuFesclSJ9+lpbhUAg6TC1ft7nWYj04UXfQlVXUpRUyx2waj7ArKJUEhRtxthy7v+ghFXKNhwyzG55HVB1RYNfDOTmcJFibxsAxJtY5qyck3avTK6HdPdSzFoc8udjvOQ820H7YHxUn7MiJc4Cj1Jc7gm+n3n/Utlu8mxd/ZXBiAtEbMOt3vdFnyu1B8t+OT+o8aQfk1jXODJ2bdYwAt4Ckb0VkUB02LAF+pqiAllrQl2TB6bAj8xOXKq4pLQrxpPWx4W8GV8+NB3Wp4YmbfzPIjT+hHldZ0UojdQHubl/Hv8qzMDWwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft8gM/nyTM4NtLbu8RQRyCpZbcXyc+IQv1sO/juiuQs=;
 b=UCfa+9xi6/tii9/UYYrxUefK3MfloYWnoIwkE8qT/w/Div4Ect4xnQAuTSJl8uFcpGjYSp0r8Q1DXsx3yPDyfPppIlpxp4iTs2WMuJ0cF+RprRHtOvnMFsG5oeG4Dpk8keX8mGRtLYp/4Zluaafmzr6RmeY/BTIJ7aIEq5XvTytoX28FFeab5uMR3Fsb6QiQmgavXplG0Dcyxw72sb54dtSJLr+dqRHGGSN4hxMzjS9u/BWxip9vkG1MTa8QDkji0eXfUYQtKr9cvVlZl7pUpzdIs9MUGz5i7EgKzILfWCme1SZtJuUiGWSFUUxulXbOq5FRKWCVo+TAYExGtXc7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft8gM/nyTM4NtLbu8RQRyCpZbcXyc+IQv1sO/juiuQs=;
 b=bDEG1yRYrre7wzBjlGrp5qx89WoTo3UTrRlF8qm524YFKXM7fpJ2jKsJgZVX/X4I/nEO5KqLqoBnQ+3n4Qpfh5BJ69devu2Ad6UfpiYV6hP9Zq93yv7CJhxdeZgkOtiFProhD+0Fm2x+2VzUOvp4ZvpPbIlZgbh06VEH+Pmxg67RtRZnfw+Wkhe9Ntd0MxjfkHNfLgPnBs+mjaJKykbCnmDGxeyJ4davERpt89UHx8ijKL8kqCTPmfk/CBi965OUVjUolgZSrRJ+OC/BX7C9RQ4gavrSbQPoNZihu68sOalyTER4+KrXpY7WDWsO3pMsRKJINMuGXw4TUbx5v/VZ7g==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN7PPF683A477A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 03:43:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 03:43:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 12:43:32 +0900
Message-Id: <DF1VSZIO9UZH.YU8SUUQ72GPI@nvidia.com>
Subject: Re: [PATCH v4 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-11-ttabi@nvidia.com>
 <DF1BM2Z71OY4.246P9YGJC6J4N@nvidia.com>
 <e7b6a0bcbeeb7312b52f0e9c755e6af045d99d29.camel@nvidia.com>
In-Reply-To: <e7b6a0bcbeeb7312b52f0e9c755e6af045d99d29.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN7PPF683A477A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 2818231d-dc72-46d9-bdd5-08de3eb0c9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eHhkZ0lTcHg2YWZwVTlINDF0OWEyVlJLRHhOQVZiMmtjN1UzTE02eWRQejFU?=
 =?utf-8?B?cXMrMWJTOVVxV0M5aXRtUDQ5dkZ3TXNsek5zNzlSS2RYTTRlVFhIVDROZ0lw?=
 =?utf-8?B?cDlpTmd2L3BVd3RyV0xCNXUrYXNiaHBOVkZUOXlEL1NuRGVZYzRlMmRsT3VE?=
 =?utf-8?B?b0lPTlZ6M3Rwa0hmVTY3OHBMcWJIUEZEKzd1UVdZUHVScUpqcHpkS08wQ0hO?=
 =?utf-8?B?cy9PVHBJNVljeEE0RHlGUGp5cjJTeWF1MHhWamhtczFoUXNOUkNpRlRuODAz?=
 =?utf-8?B?ZkErekh4MEpkQmZlTDN4d2tkdU8wVk94Qzk1azdvUVR0aDZ2dndhclFsNy80?=
 =?utf-8?B?ZUF0ZkRkL00xdUJoZFpaaDlNTVZkRmUzdnNpYnFGdit1UXY1OThqZmRRdjNY?=
 =?utf-8?B?Y2pyQ1JzSEV0RDM4aUVBTFBQR1FUVTRqbURGaU5lSEtxc2k1ZUtzUjA4MHdx?=
 =?utf-8?B?V21CR0dvL0RGNGJkaE5SMVdOR0hQSzVlVmV2U1IvMUVpWnkrZHQ4ZXFuMkZt?=
 =?utf-8?B?cjFlSGR2dzVLRzhNanlITlVjWkhrMVZhWHIybGFLMll2c3R2eE5hbjdPWkJ6?=
 =?utf-8?B?WnVJaks1d0p0WXhOMWRkR3kwVnZpWkFzSzBUdkNNS2hHVkpzNU5mTWp4NUxv?=
 =?utf-8?B?K1VUdmN4QTZWbmx2MHBWSG1ZK3E3L3ZrRnAwZjdtZXhWb1hwVGNWRnpyV29N?=
 =?utf-8?B?c1lsdlhDazQ2KzAxVURrYmNmWlZrUWkvdTJ5b1Q1aFNtWlhkU3VSV0hlVXVz?=
 =?utf-8?B?MVA1dmJmQWFoVXgwNmRVNGFkdCtobXZtYWhjcHlPTzUyVnpXeGl6YVJIOFBG?=
 =?utf-8?B?T0ZkU3lZUnEvVmJqSUZkYktVejhSckJpWkNWZWphMC81K0pwMkN1ejB5cEsx?=
 =?utf-8?B?ZHYrTVNuRGJxdGhacmJNQ1RRdHFRb1BOVDhLSTJwWG9hclJYYTV6VDVTVWQr?=
 =?utf-8?B?ZGdyNGRHWW9UeXFWd1c5eHNIWUxTNmFORWxrQU1tWUVCQjhJUHJKWm0xOUhY?=
 =?utf-8?B?MHlPYVpPNHBCbDcxb0JJa25RSzVTS2FUb2pCWGprQU1sb0ZaUHJuZkx4V01w?=
 =?utf-8?B?dEN4WXNnc3NGUjJMa2lXd0prNUEybGloTUtTVU1BZjJLTnVwK0U2b3dGNjVx?=
 =?utf-8?B?QjNBRVU5RXRPMlhpNnVlUzdwRVBHdEtlYUdGeXp1VTZtT0w5WFQwR1kzYlJW?=
 =?utf-8?B?YWxrT0hDM0l4WlVpSWJIamFJY3hlUlJUamFuRnpDNmw2WWgxN1huT3hFaHU1?=
 =?utf-8?B?eW1NeWdwOFJmdS9YdFRCMlhyNyt2R0t0YWQ5dVBnMkZGdHl5NmUzMjA2RzJy?=
 =?utf-8?B?ZEtNOFFzanJGUFkrbDBOWjR5QWduMHF1NGFzWU1WSnh2TmFnQ0pTY1FZdFJL?=
 =?utf-8?B?VGtnTkF1U2srZFhYbmNYQ1ZERzBSYURDZ21qekhWajZPR3UwTVJ6bVhwSER0?=
 =?utf-8?B?NlFXbE5wMlkyM3ZBMlpiMnRVRlpXRkJrbkh5U08yL1BFQk8zVHh0dEY3YWtj?=
 =?utf-8?B?NVFOYVA0QU96dUVYNmU4N0dFNEJCWTlSQzV4Rm9GVCtseUgzMWJ3NkRPWEN3?=
 =?utf-8?B?OC9lL0tDcHJVTU9RUS96b0ZLTEQyeitSQStYaC9XbWRzQ2hYT0NpNkxTQUpZ?=
 =?utf-8?B?Sy9OUUpyendBYnJ1NlRueEkxYUpJZHkzVy9jdVFlVnA5N0Z4SFNyU3EyYXdD?=
 =?utf-8?B?T0E1cW1tZE9RSkc1N0tJYjF5dkZBWU50MmRJbUdFU3FZUU9ybm1ZeHpuZkt5?=
 =?utf-8?B?aXJlN1JkMUkvUENjZEgycUxxeTRMdVgzL09tbEZqRDMrQUh4VlBvaTFmcDlJ?=
 =?utf-8?B?NWxyQ0xTRHBvcWpFQ2lMYjBQL2RSRTdBbm9ZRm9kRDFsQlFCcnhld2NNUzJZ?=
 =?utf-8?B?NDRsZGEvOXY1Ylk5b1pZQ3JqcGpaTFo2QmVYejRHaG5tU25tZFh5Lyt6bjEz?=
 =?utf-8?Q?hwXKGrg+fPBt5UZPq+keJeUCxs/9PqZw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejcveWxwQ0V3NUZQNkZ6bS9kV3c0NGlPbDVsMlR0Z2dDc05aRmFKU0k4dDNs?=
 =?utf-8?B?UVRobldYcXVuN0NxYjA4d256QVhQdjFPTG8rZHcwWUlZeS92OXl6UE9QaDd6?=
 =?utf-8?B?R0owZHFBWjc0MTk3Umo2Tk0wTW1yYXNLc2tJSFJrMXlhbXhhQ08zQkwyZnBP?=
 =?utf-8?B?MXQxdTUra0VxZDV0YTAvQVNTNHd1OU9RajUza2plNjVFU1VIUzc4OHg3YVZr?=
 =?utf-8?B?VVdNRkE2QktoYitaeUtYcFJWQnlyeEF2WU42c0Q4SkZmcG9QTU5SaHpCMVhx?=
 =?utf-8?B?bGVWSERlOVJzUU5ReHQwcGlTOVYxbjlmTlBwbjJzbmI3NUh4V0ZvZ01mTmE3?=
 =?utf-8?B?NnBMY09WMkdvUHVJRDJOM2luOUtNN3hXL2xqeDBjV1VZNlhwWGNrM25mRjBa?=
 =?utf-8?B?eXJxaE0vbDgxUjUvaDAyaWtiQUR1TFZDWHVzNFBOQnkwdXY2b0o1ZmdKMG9s?=
 =?utf-8?B?VzkvTDNUTk1vQXF3M1pFTDBGbHJUcS82YkJIelBxSnhCdWFweHJTMUk1Nm16?=
 =?utf-8?B?NnE5NUgyQ2pzSXorMWdSNGVyTEZJYnJ2MEUxZ3dTeWcvNFd4ZUdNUmdHWGpR?=
 =?utf-8?B?NU5XTENhYi9JeGlxNGN3cUhmWUJUU29iVEN2Zk9sT1JORHQzdk1XWlpGZ3Nk?=
 =?utf-8?B?N1ZXcWNNS3l5d3lZR1o3WDJOMUFueHkyUWs1NHNDOEJmclZ5MVRyME9qYkg1?=
 =?utf-8?B?cHVseFVqRklEWEJDWlF4ZzRzenU0d0FSbmZVTm1EMXhYb0kyNnJMMjJ6eE9V?=
 =?utf-8?B?QmoxaDhzMHBNZlM1K3h5TUsvblV6ZGpvVWV6SDBtdU9ZcXAzK2EzdEx3bWkx?=
 =?utf-8?B?Z21sK3Byd2ZKVGVWZnNGdFpPY2VTdlJWOGtuWkFQNHRRa2p5WUdpNThIaVFX?=
 =?utf-8?B?dGgwSTZRMVVKNG12RnMxd1pXZVRNR1ArNCtLU3N6UkR6d2pvZTBFSWNRbnRz?=
 =?utf-8?B?NkdVMjdvOEE2VFFZeHVYWTUzV2hBUGoyN2xNS0Fudkdsc0dMWFN2UWpZdE1P?=
 =?utf-8?B?dWdUUUVXYXhWMy9JWHRlTTZnRFdaaVBMUFIycDNpWlA1YlFVb2QwUWJwcXJj?=
 =?utf-8?B?QnRkbXVlbGhMam8zQ2xIT2hOdHdYRjh0TWo2R0NQcVZ6aC9OaUp0aDc4NE5p?=
 =?utf-8?B?TWwrYjVSOE4yd25ueVlncE1NR2ZzdlJ4OXFJRVQ4RGxrYXlVSmVLS09EVkJM?=
 =?utf-8?B?QkVTQVRsWGhsMHdURE5odm1ZZDBYclhaZ2pHcVAxNEZDQ3RHdVFyNGFaazNS?=
 =?utf-8?B?WE5ycG1jVVo5NEN3MTNIYllqQXdLdCs2QVA5bms0azZEdFdDZC9ZdE5kblND?=
 =?utf-8?B?Qm9TTHRSNWE1Nnd2bzAxa283QkV5Uld5dFlmblJGL0lJWnZncUxqbFpJRzl4?=
 =?utf-8?B?amJyQWVUcG9CVmV5N1B5d21pcDJSWUxicDNNWEQ4VWRMa2NNV2dZODRrTDlB?=
 =?utf-8?B?UlpYWjN2bzlSeW01anRwNGpaRFB5SXliTWoxSkY2OVg5dkgvT2RqWWI0Rkh2?=
 =?utf-8?B?bWZwQWZEdWE4ZXJjTVpTak9CV20vaDBlT3JtMkRvSHJNVDZwaXhDZGtENkYz?=
 =?utf-8?B?NWlkdm1ZdndScGJYNEUyRndHTDYwcW11S0ljaDliNUZUL2hCZ3hUSDBWcjg3?=
 =?utf-8?B?Y29XcGRYUjNmSkVSbkllYkVhZ1Q5ek9WbCsrNHdmUXljQ2l4aFJ5S2NOSFp6?=
 =?utf-8?B?MTZHdlk1UHEyaWJHRE5Kc0ZBdU5tZlU2WnpBN1pTNWhaVmVXSU0yL1dQU3Jx?=
 =?utf-8?B?SHZCNXNiKzdvQlVBcWxQRHhpQWJqNWRWdHFiY3lJSktsbDNhYnlZc3dwTnc5?=
 =?utf-8?B?dDdBeXlFVEs5aEord2gxOTFJSDdtMGFib0ZyVVBJeFN1dHJsUS92b2tuOWlw?=
 =?utf-8?B?Y2VlaXU4UDNONmZvSjVlUkMrcmlVdnhjVG5qUUxEbjR3QkRvcVFUa3lzVE9z?=
 =?utf-8?B?T2hyMTk2U1JBcUsvdnEzRU5kbGhMcGhKdnlXSkpROVdCQkYrWEM4SkxFVjRN?=
 =?utf-8?B?ZkVxMXNqZVJWdGxCZkRSNmRQMUt4bnUwb2tJWmFtV2NSdTFEZ2RLQTdFczlM?=
 =?utf-8?B?aGJ5NkpCY1UycjkvYWZYR2NZSEE2UHNJc0N5UDdVSHYzRGowdEJVbEo0M1Bv?=
 =?utf-8?B?bFBYM0xXVXRmcS9SY2lHKzljZ2p6RUNOVlg0QjNxejQ3bmJvNDNZYitIV2FP?=
 =?utf-8?Q?BxBM8owCcvB3QabwwpnaS2xpeHPKnq98bTsbGAD3zfXX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2818231d-dc72-46d9-bdd5-08de3eb0c9c3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 03:43:35.4780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dZLiajoLqg3ZhGLkqsBGCwBJoVc76VBxy+WnAwr9TkXCM87c3U4GyUote9tL8OotDA+epEKCaUYNTD/t/JFFYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF683A477A9
Message-ID-Hash: SOKBIC4QSGDFF4CBWNCZY3ZXCO3YAT7T
X-Message-ID-Hash: SOKBIC4QSGDFF4CBWNCZY3ZXCO3YAT7T
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SOKBIC4QSGDFF4CBWNCZY3ZXCO3YAT7T/>
Archived-At: 
 <https://lore.freedesktop.org/DF1VSZIO9UZH.YU8SUUQ72GPI@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Dec 19, 2025 at 7:51 AM JST, Timur Tabi wrote:
> On Thu, 2025-12-18 at 20:54 +0900, Alexandre Courbot wrote:
>> +/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgum=
ent`
>> +/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to =
force it
>> +/// to that size.
>> +#[repr(C)]
>> +pub(crate) struct GspArgumentsAligned {
>> +=C2=A0=C2=A0=C2=A0 pub(crate) inner: GspArgumentsCached,
>> +=C2=A0=C2=A0=C2=A0 _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<=
bindings::GSP_ARGUMENTS_CACHED>()],
>> +}
>
> Shouldn't I also remove the _padding from GspArgumentsCached:
>
> pub(crate) struct GspArgumentsCached(
>     bindings::GSP_ARGUMENTS_CACHED,
>     [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CAC=
HED>()],
> );

Yes, the patch I sent in my previous message was in replacement of
yours, not to be applied on top - I should have mentioned that.

>
> and with the padding removed, doesn't this
>
>         dma_write!(rmargs[0].inner =3D fw::GspArgumentsCached::new(&cmdq)=
)?;
>
> now only copy the args and leave the padding completely uninitialized?  T=
hat's okay, I think, I just
> want to make sure I'm not missing anything.

Since we call `alloc_coherent` with `__GFP_ZERO`, all memory will be
initialized to zero before that line is run. It's not 100% ideal but
does work.
