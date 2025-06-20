Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E94BAE1BD7
	for <lists+nouveau@lfdr.de>; Fri, 20 Jun 2025 15:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5933C10EB61;
	Fri, 20 Jun 2025 13:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jN098Q81";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6996410EB59
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 13:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+6obA+Qp5mNNByMc7Uk/u9FYD0MYbvY7FbKKa6jM3QRINyyXAQOOCgcckUkVTc2zQDC3Cvf/Ee0V1fwayvpWreHY14/Ge+clOATL7nS4XjHN+JX+vfJxbwaGj6CdrWnAywuWgUJ4WnlmK7xPyUJ1LUyGEYqEyYJsaSN+kNSBuI5Zmh2CrwUxb5QkMU89Tv5w5g6iavRQMvJQQ3rdE1Uquzz0gG0762mh4JUBMQEQNQInGDmXjkJKzv4bXevGmVR3cYnuIFBAJOPC+G4u+riBUPnjEe9VZ74HK6hprb5NsWvt21+CgwgI2wvCG8OF/fU83T9bQJMLFV4HQbhYz1ypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSbBWzWr0X1gdzwS24yGhhRg5BUmP1OPT4+k93KITtg=;
 b=cseMS0IBqWtxEBD4ytNlUEtkq6QoPwmbg6ghzCyzgysoVzOJmB8VJsabv2Jf0ZJKS/gTqZyxv8JQVK+Hb//Yx42XSkgIoTXnSp7mk8T2NviRNEg13NrLu1KmQIwCJg9uvOY/q7qWE61zeFd9V5YS2VUcCvaWy0ef0fOSASpYjhtL6so66km/JvBTU6bAouoBI3UNT8m4M01npsNSUEx2OpkER0gHcLJHXt11M2yea33h5A0tTMCZwi1gW2mqZ3swiDqGTld0eynPYYqdXIbjoeiRJhbwx3406OmRNZhORcqJ7lu2Tc8K0RYUVqR0PRdJJSlJcj6U2o4VoMZQhzWmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSbBWzWr0X1gdzwS24yGhhRg5BUmP1OPT4+k93KITtg=;
 b=jN098Q814Nx/J38c5u6ydvPf2jk8UnaytKWHuZBbyPix73aNYaS19wRQkgpsP5kzVZ9TLIlVD7UimjJ5OC9F5JPw6PbkiiRaksWzeSWO9FEf2FJ4mSSlMM+7hofRzV1azfBOFTkIzvDX9gVceDgItS0FZ30DwrfA4s6s8H8IGYlo2ekETPKgYjPvuT4BnVg76oqapiwkHOB7vSgiROCaX7WFGG+T4CJQQzV9RCA/OYClt07EOXWLrZiotwCYWJRrUyNbB+J2xy6U9fWiiZFwMxQ6HpJlHMFxCI0HrYLaAgTkSrp6R2KwfuK1Vo7mgyUCvg3+Qmyr72cuMpCle5wfSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 13:15:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 13:15:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 20 Jun 2025 22:14:53 +0900
Subject: [PATCH 3/3] nova-core: use `num` module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-num-v1-3-7ec3d3fb06c9@nvidia.com>
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:404:15::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: f5fed006-6349-4491-b9d4-08ddaffc7fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFZtVjVvR2JZSURCbkJlTGt3dXpTcnRzQ2FQMW1OWmFSazRZRFUwc0ptWWpZ?=
 =?utf-8?B?UFU0SVBkZXFacDI3dzd3a1pTZk9NRWJjeXJKeFowMHV3ZFF1cktENkExdHNR?=
 =?utf-8?B?STZ4UU81M2MrMVR4TWo5Z0N5VkZsVDZSNFBRd0FEQlhNS1VETmpiWDlRVitN?=
 =?utf-8?B?OW1ZWmcwQzFCR2U4ang4RDVPNXFrOUZqN0J6d1JiUDhJdk9oOWJuakFqelNq?=
 =?utf-8?B?c3ZLNHowYXBqM0VvK1JtWFVscExyVCtGWmhib0ZiWWFJS1EydjNHeHlOM096?=
 =?utf-8?B?T052cWR1U3kyTkRuOTZSS0xOd2xBSzlQamJmbDdiRitIejB3SDF4VHVVbi9N?=
 =?utf-8?B?OGsrc0l5TTZKR24zSU5CUjNlS3RUQXRGQ3VCUHArRHJlWkxzVEhKTFhmOENl?=
 =?utf-8?B?Rm12c1BMQk1KRmZlUS9aUjZzTzNQVTVkTWRNSit4NHdONTdzV25JRlZTaS8x?=
 =?utf-8?B?NEhCYmwvNUwrbUZZU3hKZ29hNHNIVXBhN1UwdC9hVmY4U1hCVHpIdW1PYzA3?=
 =?utf-8?B?V1ZidHJaYWVjMWtxVHRLSmJldi9HRlJSZkdBcm5tY3lNSzloWno0R2o1TlRk?=
 =?utf-8?B?YmdZbHUwdG1nNHdWLzVFeGJHODlzYzVzcEQxK2FQaHEyeUVUQVdkNnRiWFhN?=
 =?utf-8?B?d1d6alJqUXhoWmxhRG5BMHhZUkVBSVp2cU1TSGN6RGFndCtsdk1RajM2RDAz?=
 =?utf-8?B?RDBwVTdSYWJ1aUJEaE4vNytkdjI0Vkk0YXZCa25hV05XbmtXUGEvKzV3YzM2?=
 =?utf-8?B?eHZMSFhxRzh5TmxZN29XZHZBQk9YRlJoeGtrR2Nlb0VZTHJyUzdweUtBL25J?=
 =?utf-8?B?QUYvcWZtYklIaXYxV3h5djIwckE2ampKTXJ5bzFhTkp6TXduRlpneG4vT0xj?=
 =?utf-8?B?MW0reEZZVkZHZUsxU0xFMHdUT2JabEhBZmVLSXg2bVJ3YnlncGROd25maWJV?=
 =?utf-8?B?MHVsZStKdjBuT3ZaWHFVdmRjb3JHRUIzb0p5eStoZ1ZENW1IcHBFWmNHdTh4?=
 =?utf-8?B?TWlCeEJTdFRFL3QxaWQvU3BVVERvc3pxNEpzUlBrRHlwanpmUGpHeVJYOUl4?=
 =?utf-8?B?bXpJUGk5TjF3dEo0cnFGcFZGVDFGTzZzUjdzejNYNkhLeUdhZmdXMUF5ckUw?=
 =?utf-8?B?OXF4cUYzTmdtS2VPai85ZWZjWHA0Mm5ZU05TeFdzRzRkVFo0ZnJDcVRQZEhZ?=
 =?utf-8?B?dlZPRk40SjU3dEtGdmgxdCtrRDFHZmpySktxakFRSnhxbzBiNUxtYlVmU01H?=
 =?utf-8?B?Tll1bGdmWHE2Wklqc1NCWVZBc2c3aWFPcWJvcGNORVpkcnB3SVlFUjNXL25y?=
 =?utf-8?B?a0RkbWxKelZDNGRDY1U4ZmlwSnNPRVZIZStXbUtWWlhQZktCVmhHQmdHZ2Rs?=
 =?utf-8?B?ZDMvZi9UTjNjTUNKTGlwZnFoRHRqWEFtUXFDYUZQYzBIaWRrOGErUzlwSHZZ?=
 =?utf-8?B?anNHdGhhRzhJNklUWlVSQldFcDYvaGpqSEJ1M25GK0V4TXhvZEhINDhuM013?=
 =?utf-8?B?dTh3bTFKS2hmRkRNZnVwN0p5OGZHcFNrN0owSjY2ZFhJWVE2TjBPTnJDd0pG?=
 =?utf-8?B?N0lxb2pUUmlHNGJ0aGZKS1pFQVlzWVNXTzMwRHlYQU9EOFlsZk8reXFST3l2?=
 =?utf-8?B?ZG9PVkZlc3U2YUtBZ3JDY1ErMlZGMHplMkZ0TDFkaktNZDdiQ2M5QWxtZ0xz?=
 =?utf-8?B?dW0wMkRhcXVZd2dRajZDWEsyY012K0xwZGFIajhRc2lOeU5wZUYyaG1wOWdV?=
 =?utf-8?B?RG5QVGhnUGxva2tCcFJieEM5RTgzWnZTT1V4RGI1R09ScWM1YjhkWC9PdTY3?=
 =?utf-8?B?KzhhZDhQeUM3d0RucmhjQmg4Q0ZSbCtBVkhVZ0xyRkRxU2dPSytFaUl1dVNa?=
 =?utf-8?B?dERtbjdDUmNOWDVaR3pqMUJURWxoN0Rmc1RCMmp4b0ZOc2tlUDVGUkRYdERw?=
 =?utf-8?B?RnJsZWM1ZWxtelNRNVhZSkJLMkhDL0JvYnV5TnlXWlo1V1Bwck16bnQvMmU0?=
 =?utf-8?B?WUZmeUZuaGVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R29kOG1tbHZ3WUJ3TkluYUVzbHZZc2pGL0cyaDRUNFFtbDh4QmNjeFh2Tkgv?=
 =?utf-8?B?azl3a21kS1BBV1JCVmtNSGc5MjgyTHo4MUN6SkErVHNtYkVUYTlqL1ljQ2xQ?=
 =?utf-8?B?MEt5dFJCdmFyY09WZGdOQnNjaTlFaEpLbEpXa1FaOUZ4aUJnR0w4QmMyTy9t?=
 =?utf-8?B?SVpxdXRlblZwbldtUG56a2JxUjM3dU5xTHNDeWF0ZHVrVVRkSUVFZkU5M3Vt?=
 =?utf-8?B?ekxqMEJzQTdMcHNwa004L24yUlRxclFOUWJDOGZyNGFrdjNSaEloNHcvM2Z5?=
 =?utf-8?B?SXd4QjhCUFVkcm9hNHdBYldsanhSRnhZakJvRFFKeXQ5WGV2SkJCYzNhb016?=
 =?utf-8?B?WXNkdElqa3g3MVVxMDMxek1obVBjWWFSUmt4elpxUTNHWitZNW1mZ1Q4V1N6?=
 =?utf-8?B?QkdBclozUjUyUVR2bDRoSG5MQWVERW1vajdiSndMdEtPVWx5MGdSaGhIaHZO?=
 =?utf-8?B?Yk1SU3BCbGdNWHlSNlZ3cXpzcjdZM0lNNkZ0OGpxcWoxeXdsaGZBSW1Ydmsv?=
 =?utf-8?B?T2lrQVNUY2s1ZjY2VTI4UnUrQWNqYm1WWWMyVjhyWHc0cW9Ea0ZZVXhxVUVE?=
 =?utf-8?B?WFF3ZDJTcHpjWnFoZkwxS0lVYWJMSzlLdThOeUpLbmdpUVZhRjhhNmJHWEdM?=
 =?utf-8?B?eEN4M21QWExhTlVJYjhKSDkzb0padHdyMndoM0U1Mzl3VmJwSlRsalMwb1J1?=
 =?utf-8?B?cjhWeGdjOTJuVDVpSGVvWm1tcExBeEVYYmthWDI3REtSRlErQlR0QWNmZUxS?=
 =?utf-8?B?RzVRUzN6NEhocyt1U1Zka01CR0ZXUE00RE9nMzhLYldTbGJGOGtSVWtKTTRJ?=
 =?utf-8?B?eWdQY0F3cVl6d1R1MnpoNnlmRysxcFFJYktiK25EUGFyVmtUbGNYS29SNHY0?=
 =?utf-8?B?c0EzL3liQUU0aStYNEltWGFreXZ5bnJYK2k1NU9ydzZNNVdhTDA5bU1WNERW?=
 =?utf-8?B?MXBlSmRFRURYdkp0THZEZGR6UExZZTRHTDV4UEk2RUFJMXRLZG5OR0JJZ1dq?=
 =?utf-8?B?b0NQRWRMMjV2TlZ2YWVaeW9RUnE2aERaYUpscCtBYVErUVc3VFp2Y1RYVEdT?=
 =?utf-8?B?TlZ1alQ4anl6K1MrdTZldElRVjFERUh4eis3NGx2bHRJTXBkS1Z1bkJRdXA5?=
 =?utf-8?B?N2hYVWJSaC8xUHQxS29IOFFIcTdBejFvMkQwNW1vOFlvd0kybFZNV001bUhs?=
 =?utf-8?B?SzZTcm9XRDc2UjJLRkNtcXdWbVhNY2l1aU14UkljT3VWVDdrajU0ekgwSmJX?=
 =?utf-8?B?d2pvZXZxRDNIcVA1ZFFla0lVVTRrR0xXN1FONnRNeVJ2alhpWmJ0ZFJmYUhz?=
 =?utf-8?B?SzFGZmdPOHhnbUprM3k1bEhnTG1TOEl2cThmNG9rWGVYSU8zVC81dlBrb2wx?=
 =?utf-8?B?ZXBkekhxU2JzcGdCSzdmaVhrdlJmOXArbDI5QTAySlRLcldObFBHRFdQNGZp?=
 =?utf-8?B?UUd0S3JiV1ZBR1lNSXZXbmkwRldIdnZrSUw0QVgvSGZnaVg0Y3lPZ3BHV0ww?=
 =?utf-8?B?RVZ5YngwaXRreGl4ZjJzYzN2Tmo3TzcwZ2xsSk5GaHJERWYweEpjbmZleWtt?=
 =?utf-8?B?eGh2VDFxSWhMUjBRd0VkVkI5MUVlQXZveFYrQzRpVis3RVVKS0htUVNSaGpn?=
 =?utf-8?B?a29pZWw5LzhqbnlScVN1NXZJVlJLVXRlbm9MZUJ4UkNyNkoveVBxdVdWaXlu?=
 =?utf-8?B?d3FicmZvSnFyL0ExSW9aenljNXhMOEZUTjVSSTVOOFVGQkxvcHVuTDc5cjZU?=
 =?utf-8?B?MFFJb2tGbHljY2ZBTVJlZ2w0d3o3Y1RaOEZrbmhYK0xKekQ2MTBJNVRLVjJr?=
 =?utf-8?B?YUFpaGJNRE55SUVtTkYxcGw4L212WG5QN09kMkZpdU5jODFPUTNTODFqclI1?=
 =?utf-8?B?S3VpaVFoc3NhUXREY0xkQXVhbmFtSWlpRGYrdmt1LzB0OG5uM3BuUjNYdkc3?=
 =?utf-8?B?cmRTeHVES3ZVNXltYWttTVdpV2NGYlNSRFR6THlKV1Z2UFo2Z01HMW5yR2JN?=
 =?utf-8?B?bnU0eUVNMFBqak45UjBJdlZock1BdFdhTlJVZ2s0VnF6VWZGZS9nM2pRdlFR?=
 =?utf-8?B?aHZ2N1lPL1JwS1NJeFlkWU8yajI2ZU5tUWVnRkROMm5lVlhEZENySmwrTnF2?=
 =?utf-8?B?bEhwSVdyNjZLYnF4TEVvNEJhVmx6WU9uN3VaaHJaTFIyTmNXREVEY3dMNnN0?=
 =?utf-8?Q?3NNUZ1HD4+E6na7qngEEEIp2gRh9XlHwIye9C892FMej?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fed006-6349-4491-b9d4-08ddaffc7fd9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:15:16.9441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9P3IgxOi8KeYCRgg84Qvg3HRITT6jg/ou0K1mD4GPgSRZG6IXaxfFZ8bozwn7rs19z/b8tpBccqlRcjvo7BSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426
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

Make use of the functions available in the `num` module and remove the
corresponding TODO items.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      | 15 ---------------
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  4 ++--
 drivers/gpu/nova-core/fb.rs               |  6 +++---
 drivers/gpu/nova-core/firmware/fwsec.rs   |  7 ++-----
 drivers/gpu/nova-core/vbios.rs            |  4 ++--
 5 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 894a1e9c3741a43ad4eb76d24a9486862999874e..01dfa858d11fe377c345b463742c13c37878e334 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,21 +141,6 @@ Features desired before this happens:
 | Complexity: Advanced
 | Contact: Alexandre Courbot
 
-Numerical operations [NUMM]
----------------------------
-
-Nova uses integer operations that are not part of the standard library (or not
-implemented in an optimized way for the kernel). These include:
-
-- Aligning up and down to a power of two,
-- The "Find Last Set Bit" (`fls` function of the C part of the kernel)
-  operation.
-
-A `num` core kernel module is being designed to provide these operations.
-
-| Complexity: Intermediate
-| Contact: Alexandre Courbot
-
 Delay / Sleep abstractions [DLAY]
 ---------------------------------
 
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 664327f75cf4199cca37d22ca18b2b9abac781f8..9158991ec6e30f42fc0c7e49c87e2c04b426189f 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -4,6 +4,7 @@
 use core::time::Duration;
 
 use kernel::device;
+use kernel::num::last_set_bit_u32;
 use kernel::prelude::*;
 
 use crate::driver::Bar0;
@@ -69,8 +70,7 @@ fn signature_reg_fuse_version_ga102(
     let reg_fuse_version =
         bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
 
-    // TODO[NUMM]: replace with `last_set_bit` once it lands.
-    Ok(u32::BITS - reg_fuse_version.leading_zeros())
+    Ok(last_set_bit_u32(reg_fuse_version))
 }
 
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 48003527a2472a4a8b784af0d481a441c8d2426e..ca5e7ef997bc2b2855a1d60e81300fb99fe04cdb 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -2,6 +2,7 @@
 
 use core::ops::Range;
 
+use kernel::num::PowerOfTwo;
 use kernel::prelude::*;
 use kernel::sizes::*;
 use kernel::types::ARef;
@@ -119,10 +120,9 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
         };
 
         let frts = {
-            const FRTS_DOWN_ALIGN: u64 = SZ_128K as u64;
+            const FRTS_DOWN_ALIGN: PowerOfTwo<u64> = PowerOfTwo::<u64>::new(SZ_128K as u64);
             const FRTS_SIZE: u64 = SZ_1M as u64;
-            // TODO[NUMM]: replace with `align_down` once it lands.
-            let frts_base = (vga_workspace.start & !(FRTS_DOWN_ALIGN - 1)) - FRTS_SIZE;
+            let frts_base = FRTS_DOWN_ALIGN.align_down(vga_workspace.start) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
         };
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 047aab76470ecb0a0486f6917f6fda69b5381391..0edcade5e8b303ee249397736af55c5a6f6fb97f 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -15,6 +15,7 @@
 use core::ops::Deref;
 
 use kernel::device::{self, Device};
+use kernel::num::PowerOfTwo;
 use kernel::prelude::*;
 use kernel::transmute::FromBytes;
 
@@ -218,11 +219,7 @@ fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
             dst_start: self.desc.dmem_phys_base,
-            // TODO[NUMM]: replace with `align_up` once it lands.
-            len: self
-                .desc
-                .dmem_load_size
-                .next_multiple_of(DMEM_LOAD_SIZE_ALIGN),
+            len: PowerOfTwo::<u32>::new(DMEM_LOAD_SIZE_ALIGN).align_up(self.desc.dmem_load_size),
         }
     }
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index a5889eb149a16beabc0ddbdc87666520114c8aec..cac55d1534831775c14f3fed1e939ed89c7eba84 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -8,6 +8,7 @@
 use core::convert::TryFrom;
 use kernel::device;
 use kernel::error::Result;
+use kernel::num::PowerOfTwo;
 use kernel::pci;
 use kernel::prelude::*;
 
@@ -175,8 +176,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         // Advance to next image (aligned to 512 bytes)
         self.current_offset += image_size;
-        // TODO[NUMM]: replace with `align_up` once it lands.
-        self.current_offset = self.current_offset.next_multiple_of(512);
+        self.current_offset = PowerOfTwo::<usize>::new(512).align_up(self.current_offset);
 
         Some(Ok(full_image))
     }

-- 
2.49.0

