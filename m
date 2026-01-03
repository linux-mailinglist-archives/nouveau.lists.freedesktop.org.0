Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6DCEFA28
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 03:15:21 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 27BAE10E308;
	Sat,  3 Jan 2026 02:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="stF57MOc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9D44844C81;
	Sat,  3 Jan 2026 02:07:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767406033;
 b=Sy6Lp3c+4luAYuEQSyFdGqBxBlH2ik8vPkMZScCvpEs9q8KCiPJ8FOhqbbXxBreZ+/gGI
 zFASDt9n1g6GnAfNT5wc89YtnuF/TiH4IdIsmgG68S2ueFL7Gju4fxq7PuubX4CR2D4riS1
 nFw2LHFQafFYVZH/riUiFafvxTnVUTlKinFLR7daX/avBcS+JnMXBuwO0ljY33G4XlJWuDm
 4EsjoYP+FoE/J5PC9g66dOLx6e6ntG851yQBCyoR6nbj/ZBSyD4OGWLg9U5uqFvD9YPlPdN
 UgPVe7rvwKEESHyydSeAlhjQOxupJYxIakstnfgQ75PaRVlH96xj3Nw5j+Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767406033; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i+/IZtwVk4t617Di/of8pripzQnYR6vUYJhtYIZZ1Zw=;
 b=yxSCil/8P2XfYOsG7Fg2eLc13SfbGYycx694D/TVMG8FXknj8ydOk/GTMse1o6/r5u/CA
 twgXiV8qiqPrvoqdVAZ4/LGhziNLuMAsorFCoReUoVZTqxTa4lEFij5+uwyu0RXDYG/bwMP
 4cn3Jdkb/PabuLYRU2YXAmam3KiA5+pVlHOZ6hvGidl3xYVKRV5H/iOjdaHAJ/m77Y7QvC1
 sVGtKKJulBykj6e/cp61Xc3u4IlrT8mzpF6hWeYSihAVLK8LNNUrqFeofu0EZkE0acluz3+
 kiQMPI5X3bfktec4s7hu3TLWGpUv/ZGpNjmB+fHMhMO7XkfGckKni/RvyXJg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id CD07044C41
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 02:07:10 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA6310E13E
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 02:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJbUIr4Hw2Sze4zzoz9Nsots8my/vqmxlFCsFP1kKwGiF68zMtZ8XEq5PT6S8bGCC5cKOhKiy5ZdKU/QW4/BwWz1xs3QzKVvBtP6Y9XpaJicMobt2qbRk8e7Mgs5DZ+WMv4shbbDTJMc4PekQzlyMNz+TJ4yO4wCSmI2Z19YBUph5vYhIXBX3PwDtbT8UumO6E571FIhhZHq+GkhaPL4sYtycFp676alh3mniI4Y0qEfeQs9Xh4RY7FfXkMJM1uwwFKfVQd0UkGl+stL8QJE7AdU2++FQORW0pO2myKK2QotPpSryXd/d75E4nz+XSrpdeOKPQ96VDrLQXvJ79zBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+/IZtwVk4t617Di/of8pripzQnYR6vUYJhtYIZZ1Zw=;
 b=sXBLw4HdKsc4mR8hJcUlN3+vQcTn1lNu9U6/258imPFO2wyfcM5pjnrZ31xIT/tKK7InrkL411tfvPUOFuNSQOiemomYJvUv/nVSEVl0ewt+X3mmbJl5P35zMRjo9scK7NbTYLenkHsgPv7At5C0suQ3kfjuqqUAHeXW1D1cDx3XxXud3sBqWa6ZeNlIWpPb83/I8fKt5udjLmms3OUPusHx3mLgqXz8xW0h0tpA2p37f+kShV9onfaF6v9hAYPt+fgsz7HAgoXmlv+dqQzz81ZUR4Lm8fnwiL/t/3EvN6tbfhWX+bQUhcuUBbq5CNjU3PvCfOYkv/ET/GOmNuBFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+/IZtwVk4t617Di/of8pripzQnYR6vUYJhtYIZZ1Zw=;
 b=stF57MOcME3pn17ZIa+342rEr5QaRQvGpEEhbwTsreJfwpJDX1ykP9mvwNCbN7svF2dCYrcrOnfNyDPtHEMCUQjyl8iiFUPzS6s4q3y2wzybPUjft8ub18XhNTc9NKx/te7yhd9HQu54XfkgChcmMMPZdcCTO00oA4mutt6S42u+FiVivtXQBE9mS34gIVZS5MAu+xdAz7+RsozlKp0vZaA9/d31k8WewnXmnDEuXFMHGneaOSyvcQOxGgyhAFPSDZ5UN7JAnvru+60yyY53NoS2S/a5qUtsAZrMyWpPGot3HUGZZJQogsNtGDj2zUSkCsbtEWG4uyBrkN6aAt+C7w==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7358.namprd12.prod.outlook.com (2603:10b6:303:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 02:15:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 02:15:10 +0000
Message-ID: <2603ab3c-98aa-43cb-9d7a-525c7df3616d@nvidia.com>
Date: Fri, 2 Jan 2026 18:15:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/31] gpu: nova-core: Hopper/Blackwell: add FSP message
 infrastructure
To: Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-17-jhubbard@nvidia.com>
 <37a85b2e-603c-44ad-a346-783842e9c829@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <37a85b2e-603c-44ad-a346-783842e9c829@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb2b5f7-0658-45f5-c0f4-08de4a6dec29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U2dvUFZhL3BYWjVqV09VenJ2UmJrTEtZeHdVL3B2ZzAzSDh1b3gzdTR0U1dk?=
 =?utf-8?B?VWphQjRORmt0VjJKUFRUUUpvVFJYTnZoNjBLWTdhcUNTbXZhREhJM1ppcmxt?=
 =?utf-8?B?c2owRVhLOXJScUp2dFBHY0pocFE2SWw0cU5mN2lHUEh0WlcwZkdVSCttWTZ6?=
 =?utf-8?B?YjRFYXVxcXJQR2JNcThveGxsYXRZTjF0VVoyeEsvWEx6N1hPMUF2d1VYOEVt?=
 =?utf-8?B?NXRjNzgxQnU4bG1tbzVMaHBOWmVzKzJxLzdhWUhhekJ2ZFQxWmNDVXM4bC9l?=
 =?utf-8?B?RnB3QjdieVQ4cUp5TmVQZ0lyM1FjNXRUL3h1SktkcWw3ZFQ2bFFXUzNKTVVR?=
 =?utf-8?B?OUFVakkvWlVoeXZDRDlkMXpsY0EvS1Y3djFvTWtqTEhOVGJSNEhSNmdUeDVl?=
 =?utf-8?B?WTVoMm5XRi9WVUQxT1U4THNDSi9SbzZQV2x0U3RiUHhBVGlMWjltZDJoSzMr?=
 =?utf-8?B?RlhjbWdtbERIaVd5cm5YRXp1ZnVQUjh0cVFFWGdVVHVwQTl4QytyRXJtWk11?=
 =?utf-8?B?b2cvd1JaTkdXT3pZSnc2Qm5pL0xtcWRMbWd3MjJrTUh6eEt1K0QxVno0cTIv?=
 =?utf-8?B?Uld0TTJXcVR3c1poS1BTWWZ5QlMrK3BaQmc2Z1F4NHZQS1pObVZJNHZIVnV6?=
 =?utf-8?B?NmhycDBuM0cxUXdsNkZNNTA5QldobG42NjNLUkIxVFg1dTA0WTR0K2JjdzNq?=
 =?utf-8?B?d1ZoQTY2VG1nZ3ZkVjlWVmhzS3JDc2hyQjNYQUNPcTEremU4YXF1WnVBNE5D?=
 =?utf-8?B?eTRFUnhMV1dUVlhBZGdtYnNpdHZLRnVMZGZjRzV3NjJDNmtmZE9YSE01TjI0?=
 =?utf-8?B?WFYwQjQ5NXNiUjlNUE9oSzljSzF6eUVXY3h5YUJyQW16b2c1enFtUm1GcmRX?=
 =?utf-8?B?NVg3VGhkSTIxelBBQ1pnVkZ0dmVVVnE2ZEswd21rclVWc1NZUG1vbGhTaEtC?=
 =?utf-8?B?Ly9pSnZRY0JFb3AxVnVoRURSYnpxcW5CUFpYK1dHUFJEZzBqVzBsQWZlL2hJ?=
 =?utf-8?B?Y25JRzRmQnVJYVRTbllyZkdsU1FLcjNuSHdUT042aFV2Q3NXN0FKeVQ2cS9M?=
 =?utf-8?B?eVB4bTgwcmY4YzhWbUpIT0F3YWhHOXIyazMxYVI1cTlKaEhNNWIyVVFSMDlB?=
 =?utf-8?B?Y2xMc1ZzRWNldllYSTFKRnBzemFvOEMwN3A1U0dpQUxTdjNHYXVyQ200Q00y?=
 =?utf-8?B?VVdtejlYOXRmUWFHSTB5QWpLMXVJSHhpU3BucnVOTGZmY2p6RksycXVic1BD?=
 =?utf-8?B?eWdobEhRK1A4d25EWnJsOG52UU9ISmc2ZEF5S3JqT0tTZ1RUMzBHQi80Q2Ru?=
 =?utf-8?B?QzBSbHdwRi9Tc093cjJEQ2Jac2lLanhlc0tzV2JxdVJlalZwVVZaR0lpTmg5?=
 =?utf-8?B?Zml6bzFISC9JS0ZHTFBDQlpVdS93akxhSnpRWnMyRHA0Qlg1WFlVb3BMUnFZ?=
 =?utf-8?B?ekZGWTVzWDdWZCtLYWtlMzJFOTRQSVFsRjdES0tmQUUrRC9DQzE5ZEZha0hj?=
 =?utf-8?B?WlZJMFd1YlBSWHRjQ2xERjBzWkRUSmxmekpWU2w0NlY5blFwYWJCN1dTOXpo?=
 =?utf-8?B?Y3hiRHlMYmpOamVkeXc2dUo3cHRORDhjQXRJSjdyeWRZWGZCV1ZSU2p1dTRy?=
 =?utf-8?B?Q3hYYkNPQzMrMEc3L0VuUzl3QkFJb01xeURhMmtTdE54MGhlVytBaDVJZURI?=
 =?utf-8?B?WUZLakFGd1JuZFhEakNPTk1qYVp3S0ZzckJBZFdrZDYySUN5VDdrMy9iUXRO?=
 =?utf-8?B?bEl3dzk1NEQzdHBsQ3BwNk4xcEs3Q1B5YjNtTy9wRmpCZ1oyS0xab1pHbUdB?=
 =?utf-8?B?ZzR0TVFTL1Zsd29EL2F6KzZGL2JOS0VwKytDajJZSnRsWWRHdEExRFNCNmNl?=
 =?utf-8?B?U1Y2UXEwTlVvWk9FMy9xcVArZC9IUHpnUzcxUmtnYU9kN1BuSkwwOWhEczlt?=
 =?utf-8?Q?g63kicqDpBS56afvcFpWC9yELOBEZYoi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzNTU0Z0T3hIZVdMNzFVWE9ST3ZwZU52OUd3WlVRL0tuMmV6VVFUVFY4RjMw?=
 =?utf-8?B?NDVUcXVMSk1xeUpQZW81UkNZT0ZWUzJ6QjFhMGVwWU1qdzlKZXJlelVndGh6?=
 =?utf-8?B?dENVdFdFdldIb0N4S1lPNGQxNUVnLzFlZk1lc0svUGpEYXFtSDkwRStFRUVj?=
 =?utf-8?B?NWplYi9VQnFTWDF3ckg2eHBsMkpKWXhhWEsxREFaSVpHcjZiM01hMEFLV0hX?=
 =?utf-8?B?R3hpSnJDKzFod09SclllNWpLdTFib0FrYjhkQ3VkV3BKcnZrWVB0ajZXTTNC?=
 =?utf-8?B?Z29kQnZwakEwbWM4TjFLQXhDay9CcGRNSGJVMitMb2dOYmVieUo3Zk1qR3Ey?=
 =?utf-8?B?TG1lNHlsemtHeHY1MUphenhtWHU2a0xQQXhHWDRsSk5mZnRhY0s2RkdCVTA0?=
 =?utf-8?B?cWpaQ1FzZVVsOUs2UFlWSmpwZ0JuK2F1dEdGbzJZM3M3SlZRYTVRUFczdE53?=
 =?utf-8?B?eGUyQ0Z2eXZDWFk2OTlPeS85OFhFTlFDWDcwa3dOQk51d3ViQXVyS2hEem9w?=
 =?utf-8?B?aFRKYnR4aUZYbWNjR0dDaXU1b2UzaTN2YXhYRWlVamduSkYwaGdvWGxRVFBz?=
 =?utf-8?B?ZUd4TDdFclVKT2lvNm1ZK0QwNmIxaVBycy80YStRRC9TSUFlNnhFNnV2d3hB?=
 =?utf-8?B?aHlmRjBkYzB6eE51RWl6bGl0dks1aVNVQzlEaW1tZE1rRGxVRDhKRnhGYkd3?=
 =?utf-8?B?ZHBqOXRqZXdjYXJ3NnpqS3RTTU5OMUVhaC9vZjR4QVQ1Zm9sby9WcUk5MzZp?=
 =?utf-8?B?TElEOXpyUmpqeHlaQ3p2NmwwakhZVDVTU2I5OGlZdFZsc0ozWTBGOWpTQUtU?=
 =?utf-8?B?bVFBK0gyZmh0dS8vSkZIbW4yVEpMYUo2V2l3U2NMbFViUWxQbkpHMkJXSi85?=
 =?utf-8?B?ZExYVUQ2Y0gvcm8wT1c2RFJWbWZOVExTTmd4ZGdlaDhtVXpGL3R6SGlSR0Vz?=
 =?utf-8?B?UGdVZFA0U3pKVVYwajBUN2pnbnphc09qRWNGTzJoQkM4cDR1Uk1wY2IvNXht?=
 =?utf-8?B?TnA0bUV6Tkk3R2lRT3kyRkIzSGFpTjdWeHllVlk1djdnZnUxbWtReUpmUW5k?=
 =?utf-8?B?aUU2a0V5ZWhiR0xBalludUszVksvSldhUXhlcWQ5ZG4zNHF3Qy9pOHNyUWJU?=
 =?utf-8?B?ZVpSY05tNUZUeGp1Y2tzNDlYZ1pGOWlkMEFIOE1ReGxHM21jeWRlejZHbXFQ?=
 =?utf-8?B?MHRwWjNVVnlLWDdHc1dHQWVtajVqTFF5T1IzTEJnenQyK2x2VjZOSE5pQ3dm?=
 =?utf-8?B?VkhUV29qYVpnSHU5UnVCdWpZWWN6VmoxODNMaitIQ0JZbGpXNE5hU2Z1WEti?=
 =?utf-8?B?TWpra3ovbEx6NExROWhsSjQxR2lxSlZqWHJVMVBvZDJPK3JXeXlKNEpsY2V5?=
 =?utf-8?B?c0ZRWEVuRjNISnU2Y2VOK2MvanJBWnBzSXJKaUJzTGpLaHVlYmdLQWlVeFd3?=
 =?utf-8?B?Snc3bFhidGRibi85blkxblZka0JISWwwMUh3OVUxc2VKbHkybStqM1A1Yy8z?=
 =?utf-8?B?eUhnVFdZT1B0YjJHUytBVEQvczRCbGhUYXdJTjdjZXlYQkRWSmthTjhxMlVN?=
 =?utf-8?B?Tm42ZEFMeVY0Nzc2TnY3MHBjOTYvUER0QkdTZmpPQlFtcDFIYlJzdnBGS2xo?=
 =?utf-8?B?cmgwS21xUEhZSWFFWkVtQUNmTXZEZkVrOGVRY2gzS096eVZVL24zd0xKWG9G?=
 =?utf-8?B?S2xCcGZsbERmMEl6TWJYbUdlaHFiTHRJMDZxMnBvb3hyNGdGVnNEYTcvUlJT?=
 =?utf-8?B?YVc2RmpJZ1BoNjBWUGJWdG04TFJiRi9DQnM3bHNWVkdNQmJzanJERzBLMnZq?=
 =?utf-8?B?NUFReTlaamptdndrSTFZYUhUaHdOM0UrR3JtUGJCZVRpSlpwaytZaFNranM3?=
 =?utf-8?B?TWFtQkxiakxPbjlNNEtDNWtNeUVtUFdsa1BSV1ZIQitNQUk5eWtOMS9XWmlw?=
 =?utf-8?B?QjFhbEZhdkhHVHMvSUh4YTNxRnhlUS9DL2tjcmh4VVEveFdmeFVzUE9QaGRE?=
 =?utf-8?B?K1ZsSjR0T0ZnUUZZT2ZBK2x3K2kzZmdsQStKUmJBUXpKNTZEUVI2KzQrMGNH?=
 =?utf-8?B?cnN2NVU0bENodXozUDNwaGhXYk8xaktQU3JXSm1Kb0svbXdUcHZsRnFoVXI4?=
 =?utf-8?B?MG5HU1ZwY0lQK1l6d2xxQ2JYNGJ6UnhWUjFKZktNdEtkSFdjZE5yUzRCdzhy?=
 =?utf-8?B?algzeU04WjQyc1UrTUNKRWR2Tkd2YVNlVURybnIxSXhjMUp3K0p1Qy93d0xr?=
 =?utf-8?B?elNCaTg4RnJpbnBvYnhDbjFnbXk4a0JoYVRjdnVlTXo3QkhaS21WaGJnb0RK?=
 =?utf-8?B?Qk54U3VlaGJuWlE3eXJkZkxCZGZEMXRzbDlaNy9yRmhuTzVvdEY3Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fb2b5f7-0658-45f5-c0f4-08de4a6dec29
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 02:15:10.8679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Mmf+ZUoiNHoNNmrv6kgEI+9F2ibp45JB3aPvcPwR/VOp04LINme4iwb39CNfC2lOnNjNJh5fnO5ZSNnpktUObg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358
Message-ID-Hash: 2DFCDS2BGM4EU2GBV2A7R72F4625IFFC
X-Message-ID-Hash: 2DFCDS2BGM4EU2GBV2A7R72F4625IFFC
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2DFCDS2BGM4EU2GBV2A7R72F4625IFFC/>
Archived-At: 
 <https://lore.freedesktop.org/2603ab3c-98aa-43cb-9d7a-525c7df3616d@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/5/25 8:47 AM, Joel Fernandes wrote:
> On 12/3/2025 12:59 AM, John Hubbard wrote:
...
>> +        // TAIL points at last DWORD written, so add 4 to get total size
>> +        (tail - head) + 4
>> +    }
>> +
> 
> Can we harden against integer underflow here? Even if tail is always >= head in
> normal operation, I think we should prepare for underflow due to misbehaving HW
> etc to avoid producing a massive integer, how about:
> 
>     tail.saturating_sub(head) + 4

Yes. Fixed in the next version, thanks for spotting that.

thanks,
-- 
John Hubbard

