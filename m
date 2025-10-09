Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1FBC90EA
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 14:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF0910EA1C;
	Thu,  9 Oct 2025 12:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AuXczbLi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD84210EA1C
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 12:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKvoluWRmith0nEQNap+yvsdPJErGG/Rj34kEofqm4D2KTRro2th0frS2rGzVTWh7fVdZUdISTg5G7HCPcduRdLGf6QhCjp2zV/V8sflviq0sSlgOdkK40U6Au2WuV0Hnmx7WT6KJ6pYKtYhScYgQlGp2QoaYTBsRfoxn8p/Fz5LP7+j9Ir8dUh/68UnACtdMwqOw28/gjDhUytdptAxO1zFbEAPdeIqqLhVvlDmckblHTQq+Yzwxhz0wW50GUbik29zjUjtfNLWAZhBI69uLLkVEAzx/3zL3kbJb4H1Gguxnpp7iRHR+J6NRghzO1a2PhEwb2KJetq9Vfvlobg19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7WBR0kFbgD6TqD0z3deiHutQLa8aDPTqkNbPWDcsB8=;
 b=zLngqSjxiCJrMT8PjlVOKuFGhGfzhcPfu6NVx8/ebAtuTpGF9LFqZwH6X8orp5OyIcLE4Z2cEGANsU/faoupN9yZnd4p5zX0+EWkw5FZkFmKirHjU6VvCusMph3cqmfJHNmoeQx/q/WiDOnysnuoRT9W3Acq5fKXtKamakHsuHcUZvvc7cf22WezYdV93+FFpja3wuKnscM7Y3mvCmX3KM+55GH+z3Q7woLHOGSlzStRHandmah11jaz5ez006soGioYmwzgS5NqbnrKaLeeJDMOjwinpgJw9HAO2LtK7B1AvJjzs2CqlEr+eKAY9ozErCLyJL3BqC0yAXt4S0hneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7WBR0kFbgD6TqD0z3deiHutQLa8aDPTqkNbPWDcsB8=;
 b=AuXczbLiJmucyyFQntEtWUShg102deB7+9CBwoG95aBD+0gZ1N5NtKZJKKPWP8DM8q+V8EebxFgaKLJDfnLhX3PfvMZ5Fi7VgkCbPYX4fLUhwL7Itl05hMnWpoEnjF1YUvS8GAH8RMdo8pjdeLGH/WLSO0ekC4N8mBEInzWgv40j7BqGh2sh2fKOrPGwgzlERr8Z4JIi3LywWIjHvEdtp4h0/VJY1J/89v7/7bUqQy8YRFzJ0xQ7yeVlftuqdpraBC1TKzK81eikpIqa/U1nDmBdUjGliOrbByEMEZX+zrQaWFKQf2U/ppOOSEuPhjZfmS0jYYmBV2AMZd92NN595w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 12:37:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 12:37:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 09 Oct 2025 21:37:08 +0900
Subject: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
In-Reply-To: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 3250571d-8dcc-47d6-3203-08de07309b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZCtGVFMrZklZaS9Ya09YbmViMkNOYWs3NXZxNGVnWnUxU201YmZwTTVucHY2?=
 =?utf-8?B?M3h3QUw2NStWeVJPS3g5RFF0d3dvdTByakMrZnE4ZElwSjFpWWRtSWZWVTl1?=
 =?utf-8?B?KzIrZ094MzFsM3ZkRG5UR1pOUVRQaWJKNGgyZ290emxoTk53czYxc1F6UDdO?=
 =?utf-8?B?REc3eDA3cjBtajU3bE9tUy9lKzkvVU8wdm1Yb0E5SWRLWWUxdU5qMzQ4ZXVh?=
 =?utf-8?B?Ky9vL1djQksxSkZxZ3VNN3JUOEQvcFZuQ3o5Sit2c0N5T1lJdGJHeGxSeHlz?=
 =?utf-8?B?RkdlYUJocGR5WVdQck5BYktwOG13R2NVZVZvK1JiQzN2dit4ZUFUQytDVTZH?=
 =?utf-8?B?eFV6N0F0ejI2TG9LSHZHdk1ycjFEd3g3dlkveVJFOVRSeThjVmNtVVhtYno4?=
 =?utf-8?B?MlFGOW82UzJXd3NlOSttbE5TakV1NFZaZ2dNMU9rK2FFb1IwMWpIdmMxd1pp?=
 =?utf-8?B?dG8rREM3VWJrNUtYLzl5M0RTZGFYdjNaNkdOck1iZmtIY2lGZEhqQ2Z1TTB2?=
 =?utf-8?B?djB5LzhvYU9Ma1pva202SHdya0VHL3RLWXBDK3l0NmJacVgyQm1VdjVqZmJm?=
 =?utf-8?B?V2EwcVdSd0JTU3lGdlJlRWE3SHMxb0xHUnIxWVlxdVJ1eUFndGZvL0twSlhs?=
 =?utf-8?B?Ynl3NWNzNEczcXN5bUJoUWFyblljeEtlNTl4Z2RZS1BEZ09aVjMzL0x4NVRy?=
 =?utf-8?B?M3NRSVBlTzlaL3d0aEdTUVdkYlAzWGhubmxKanJVbFp1bkZRZjJ2cndWbmZZ?=
 =?utf-8?B?VFkwY0FZaDlTKzVNMitRTElSK2tUeDk2cTFSbUdmbXVxcUloc0Y2aGFnRzhB?=
 =?utf-8?B?YXFJd0VTeENISS9sQXh1cFg1NGlQcmdUUzYwWm9Jck1HY21zS3BxQmRaRGNV?=
 =?utf-8?B?QVp0M3JYRVovNHFRbHExNkRUWVprREFQNHh4RGdhTHRkcFBkWXp4SUduWW0r?=
 =?utf-8?B?M0pTclBpcThoeEovUW1TVjRIdk1BT1NsYWhPSGk0Z0V4dUpFZ3FIK1lobGVR?=
 =?utf-8?B?ajE5MXRrY0E0RDN0OFRtYXladTBzcVRtVlpsT3pBTS9MQVB3RGh0WHhvMTBl?=
 =?utf-8?B?c0VpT3YrZzZTN2x4Ykx5YTNkbVhlZitqZ2wyeU42aWIxWFFVMW1Fb0N3bFBq?=
 =?utf-8?B?NDJOYlFVdXNxdzBvMnlnM2ladjhFamxGc0lJbFUrUDN0R2llZlhlVVkwMW1M?=
 =?utf-8?B?bDcyeWxOMWxkL2tvZ2E4YTFLZTJLYVVSeXhNU2FabXo4U3ZwK2VkUVp4ZnFN?=
 =?utf-8?B?WjhRWkVYem5VNzA3KzZaWEJwZnRjdmNYMzBMc2t5SHoxQ2hZRG5LVWFQNFdT?=
 =?utf-8?B?anV3VS9BV1lqYW12VFM2ZWgveWpzLzRWaktTUjlFK0xwWVVabFNMZHRYZTMz?=
 =?utf-8?B?MmdVZmcyWmxvUndkQmg1Q0IxL1FwSXpER2c4bGRNL3lFZDJ1cERvc2ZOMTVn?=
 =?utf-8?B?VURydUpnYWo1bGZjQWEvUU5wMkg5U2c4bzRDN1BZbCtDTkkwKzcwN0JvLzRq?=
 =?utf-8?B?anZYbmxPZHkwOHZQSStIenQ2b1cybEpVV05wSUZhd1BHUTdIUS85bVNHcWtL?=
 =?utf-8?B?bko4b2s2ZHU0djBsdXl3dGZrVWZqSkZUQnRSNWFlKzZFbU5RWERwSUs1c2VM?=
 =?utf-8?B?OFBYbm1ZN3RsYVkzelN3QkphK0FoZTZhcmpNMENmUDJ2WUh1S0Q5WDNkeEt2?=
 =?utf-8?B?RU43T2QxLzVScnpIQjhMbXZjeGdLek43SWF6bW9odnVvYS9ZV0tETUxxNnRR?=
 =?utf-8?B?STVwT0wxcnB0V3gvUnBabzdVL0RLaFVpeXovRERJV09iejZFYVkzZlR3L3hl?=
 =?utf-8?B?RlZIOXY5dGM5OWpiT2NrQ3JSdWljTEE1V1U0NHNNYUVIQVZ0SXJDaE9na0xO?=
 =?utf-8?B?eFMyR0RUZmVJOVdUU2hqMjhrcGNFdjg5cENFNEtIdm1SbDhoVFgzMkpzWU5M?=
 =?utf-8?B?TnUzamtONVlxcmhMOWM1QVBYTTBvSmhqczlFUncrVjNjRFNvQWJuRENKSm45?=
 =?utf-8?Q?ZvCijLnk9m4RdRgYhAI8H5s//uDfx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUhzU0VVcGJobTNiZUpjS3VRL2tIUGd5cUlQUjk3blRieTRBTEFlaHN4TVc1?=
 =?utf-8?B?Vm1XcWUxZUZtaFpUYXFCZy9vRmVZNjBvaE9FUkpCbDNCNmcyQzhDRjlkNExQ?=
 =?utf-8?B?Ti9uQ3R1bWlkdFl1VytmVFNKY09YaGI0MlMrTG00OEIwM0VwN0ExaE9oeEs0?=
 =?utf-8?B?RmpUL0xRa2YvdlJ5NHZhL2tQRWZuV2VTblA2N2l4OG1rQnJyTFhBbUJvYUpQ?=
 =?utf-8?B?cDhJTExMTnMwS3VIMnJLL2U0ZmdTK3Z6NEVFVjFqbkZ2akVoMGxPWTlOMmx0?=
 =?utf-8?B?U0VtaUNKNGhPU2dpSU9TNjMvbngxVnZCWSs2UFk0NHhpSFJGbzNWZmxLamVx?=
 =?utf-8?B?L0pWR3E2SHBUSFVSQWp6WjZOM0M5dGNTRTZDNE8za25XcThQWjNBQjQ4YlQy?=
 =?utf-8?B?L28vd1lVREFIZ2IvVlhXWmw5akM5VDZDdTVTRysydXhXeTdsWDVpWjhIWUV3?=
 =?utf-8?B?TDZ3aE96a21SZkxQMnJQRmt3ZWo4WHI1Q0IzcitSQ3U5alJpT2c3WGJqZkVP?=
 =?utf-8?B?aTBYMDRCTWRReDFqVHRNMk5ZdTdhVnJnaFhWK09jcnJvcCswQkZ0STBpcFU0?=
 =?utf-8?B?b3BqckcwUUNIUHk4MEFDRjhRQU5BQTNObnRXRGdPMHJtVmRkWCtyeVovK3Bk?=
 =?utf-8?B?NjVuSk9uSnBrN1VaaXhlUnpmdFFpMWF3K2pkekdxVVpWSUY1T281V0JGajVp?=
 =?utf-8?B?Y2NOQUZpMEVHTHB4SVZXSXAxcnlUNko2cmtkTFllczQvTEtTUGZhZWdGU05n?=
 =?utf-8?B?MkJQckVUR3lhVXlMWHB1WnZUYkFQeEZUelFvZE1SV1hZb2dtejM4VWdTcS8z?=
 =?utf-8?B?T2xaNkVXTkRHb1IvT0lJd2Rsajc4c3BaRkMvbW0ybTErNzBnWk9IVlcwand2?=
 =?utf-8?B?bU5tZHd3VmZZRWc1MXpxQ05TK2g2M0hRZEFIcDlxRElxUzFjUXduU05tcmZL?=
 =?utf-8?B?dzJWN0c2VituVy8xdTV2emczWVYwcEpxQUNQbS9HTHFHSXZtY3lkYm8rT2RM?=
 =?utf-8?B?d0xVNU5vRTRUaEZ2amJpU0xyQjdHMWtkclRGRVlwUFYzR3JKTU9aTWEzQ1Ux?=
 =?utf-8?B?eTd4U2Nsd010T1FjUFdoWjdHQzBsckdUTkhzZmM2MlQzZ2NRN3krbE4vUEdq?=
 =?utf-8?B?cFQvc3M5bnFqQ25YaS9ENjNBYzZzdVNuVjFhT2dMd2dKV3NlMWFicXMzNDR0?=
 =?utf-8?B?RmZnMzExMUdtZjJYZ0xMNFB4OU43QjlFTWs3MmJmWXZ6NDB0RXhYdWY0NzlG?=
 =?utf-8?B?SGtiQ25KeS9sWlZlMFRxcnU3YTNnV2hlMW5mZ3NDajBWWThLRUJSMkF4MDlE?=
 =?utf-8?B?enNVdDVCNnNPS2loOW04Z3FJZkwrNXpmQVNtMkFuUzZqYUNlNUNJT1dnVkxY?=
 =?utf-8?B?MVBnUStLLytDb21XdnRJcWxNSmoxYzBiUDF1ZWdxS1MzUVQ0TXAwSHlIOS85?=
 =?utf-8?B?R2FaYk5TWEROKytTVTM1dCtBY2VNZ1pMOEMrSHVQVUxNTm1rbGlrcnhXS1hR?=
 =?utf-8?B?ZXE3RDJWcHY2UlBkaGNQZGs1OGlwWXN4OFpTdFZEbVp1bHBTNkZHbWtlK2Z1?=
 =?utf-8?B?dWFJV215dzF4WFh6RHo0WnBCbWo2d2N2VTlwZkN6L0FicHF0YlFXRWRKVlM2?=
 =?utf-8?B?eVFVdi9aWGtlREQ2bVdiUnlzdTd0bVhHaVAyQ2NxZXBvVDZ3dllSNjlZZUZN?=
 =?utf-8?B?Z1pBUHRqeDBNRUZNY2lFTGlDbW8xaHJZTS9LR0ZWeW5SOWhOMnpFT1hHemND?=
 =?utf-8?B?WjVRaUI5Q3pYQ1ZmY21yeGdrM0Y5eW9MdG9aNnZRTTExU24yQ0lDeVBiNjBO?=
 =?utf-8?B?aFF5dE1xLzJnUElTMDBxNEM0eGh5bDBoTEtFeTJrWE1qSGpIb3dsQTlMNFY5?=
 =?utf-8?B?RHJhQWxFTzFHRTJRTUVlZnJYZ3ZXWnNUMFhoQU0xVXBwOG9zRnZSZ0QxMEY5?=
 =?utf-8?B?M3pObEJoZms4WG9ncGw2dGxkMTY1NmZCTE5aVHVWMmZZeUhVdXc4eFREMEV4?=
 =?utf-8?B?SytpS1B4UWFyaG0zYTE3bkRLQWlnM0xwelZKQktCNVlzTHZmODFKTDJpRWVB?=
 =?utf-8?B?ZjdnWEJNUFBzdytNRG44L3pXcDV3MEVxclBSM2h0cElxSGRDSjd4USsvYnZz?=
 =?utf-8?B?YVBQa0tQOWhBb0Zib1J4WmREeFBUcENHbFNNSHZkK1JRMitUaXBmaFZNK3NW?=
 =?utf-8?Q?rdwIsiO7V+V/lTgdWHAPguWCDlf32tFAOh049f99g9JY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3250571d-8dcc-47d6-3203-08de07309b94
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:37:28.4377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGczkW3tXV4DkGWn/ykj1vaA8F3HpaAV2eNNudGR62jOBpqtQ3AHCqLBgZnFW3SGLSj087/q2Q+IogOsAjNVDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315
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

The getter method of a field works with the field type, but its setter
expects the type of the register. This leads to an asymmetry in the
From/Into implementations required for a field with a dedicated type.
For instance, a field declared as

    pub struct ControlReg(u32) {
        3:0 mode as u8 ?=> Mode;
        ...
    }

currently requires the following implementations:

    impl TryFrom<u8> for Mode {
      ...
    }

    impl From<Mode> for u32 {
      ...
    }

Change this so the `From<Mode>` now needs to be implemented for `u8`,
i.e. the primitive type of the field. This is more consistent, and will
become a requirement once we start using the TryFrom/Into derive macros
to implement these automatically.

Reported-by: Edwin Peer <epeer@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs      | 38 +++++++++++++++++++++++++-----------
 drivers/gpu/nova-core/regs/macros.rs | 10 +++++-----
 2 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e4..3f505b870601 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -22,11 +22,11 @@
 pub(crate) mod sec2;
 
 // TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u32 {
+macro_rules! impl_from_enum_to_u8 {
     ($enum_type:ty) => {
-        impl From<$enum_type> for u32 {
+        impl From<$enum_type> for u8 {
             fn from(value: $enum_type) -> Self {
-                value as u32
+                value as u8
             }
         }
     };
@@ -46,7 +46,7 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u32!(FalconCoreRev);
+impl_from_enum_to_u8!(FalconCoreRev);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRev {
@@ -81,7 +81,7 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u32!(FalconCoreRevSubversion);
+impl_from_enum_to_u8!(FalconCoreRevSubversion);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRevSubversion {
@@ -125,7 +125,7 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u32!(FalconSecurityModel);
+impl_from_enum_to_u8!(FalconSecurityModel);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconSecurityModel {
@@ -157,7 +157,7 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u32!(FalconModSelAlgo);
+impl_from_enum_to_u8!(FalconModSelAlgo);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconModSelAlgo {
@@ -179,7 +179,7 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u32!(DmaTrfCmdSize);
+impl_from_enum_to_u8!(DmaTrfCmdSize);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for DmaTrfCmdSize {
@@ -202,7 +202,6 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
-impl_from_enum_to_u32!(PeregrineCoreSelect);
 
 impl From<bool> for PeregrineCoreSelect {
     fn from(value: bool) -> Self {
@@ -213,6 +212,15 @@ fn from(value: bool) -> Self {
     }
 }
 
+impl From<PeregrineCoreSelect> for bool {
+    fn from(value: PeregrineCoreSelect) -> Self {
+        match value {
+            PeregrineCoreSelect::Falcon => false,
+            PeregrineCoreSelect::Riscv => true,
+        }
+    }
+}
+
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
@@ -236,7 +244,7 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u32!(FalconFbifTarget);
+impl_from_enum_to_u8!(FalconFbifTarget);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconFbifTarget {
@@ -263,7 +271,6 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
-impl_from_enum_to_u32!(FalconFbifMemType);
 
 /// Conversion from a single-bit register field.
 impl From<bool> for FalconFbifMemType {
@@ -275,6 +282,15 @@ fn from(value: bool) -> Self {
     }
 }
 
+impl From<FalconFbifMemType> for bool {
+    fn from(value: FalconFbifMemType) -> Self {
+        match value {
+            FalconFbifMemType::Virtual => false,
+            FalconFbifMemType::Physical => true,
+        }
+    }
+}
+
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 754c14ee7f40..73811a115762 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -482,7 +482,7 @@ impl $name {
         register!(
             @leaf_accessor $name $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
-            $into_type => $into_type $(, $comment)?;
+            bool $into_type => $into_type $(, $comment)?;
         );
     };
 
@@ -499,7 +499,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
                 <$try_into_type as ::core::convert::TryFrom<$type>>::Error
@@ -513,7 +513,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
@@ -527,7 +527,7 @@ impl $name {
     // Generates the accessor methods for a single field.
     (
         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
-            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
@@ -559,7 +559,7 @@ pub(crate) fn $field(self) -> $res_type {
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from(value) << SHIFT) & MASK;
+            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self

-- 
2.51.0

