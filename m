Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED13C59E27
	for <lists+nouveau@lfdr.de>; Thu, 13 Nov 2025 21:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836910E932;
	Thu, 13 Nov 2025 20:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NDPs8QCQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013055.outbound.protection.outlook.com
 [40.93.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A8610E932
 for <nouveau@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+reH8XBcKxk9Vhk36C4gaaLSPDR7U6ytFtCnZOUXzSAfqx5jjpMkb7Q90NnQ2tC8CY/2xFuWJg+ylihAzBeY1XMqxoU664Rlkptwn+fMVzaOYPpPv/dY278DTSSRubvVLM2yKgnArU7S71Pj6Xo5WPYxwOca7KM4MkAf4+F5nZlyMyaceZViNWEYHwUG43Bdl+UNNHDoar7r3az/daawS2p0hq3Sgrh85EbSoPjTHRjQ8jmd+izwc4cRg2gor46hXGaqmtPayDaFc4gEtTJPOXu9uC+cqLmZlmxIhA+6v9cF8sithupktmw09ngj2yZ1QLZN+jvmcUBMz1TuDrZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0XvssHIzMEfIkqw0BxixwTmWO1Wljf3QGqIOA5TDNM=;
 b=cn4CPtQPXy9FY+crkkztST1CyADCNx6CErGThvdWiqxeYJFr/M0hyC6ulKKpFbZFhyqpmoGCNGtjcpIWuX2WDnCT8UMHJpFgQrhj0K4yc1ajoQF4srzxGR5zCXe3AAU479yccQS028iKBp7GMtY6SKPPFitbYZPYoK0FQpiIWNvcG8KP4f3d7Ih6/ktHpw0WyTLGtZCRqa5lQfxqU1jFJqI31Wc75gSFQrcenBmj/Wi/X/td2eo9J9xxtC/ggx4uoIE/dwnpNXsQy9HS+pn+CPa/v/lyjGc7wAVLL5I+lvKTTdkIFP4K1gEYDA0vU5uS+L83BHZnsE+hqVx65o4yQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0XvssHIzMEfIkqw0BxixwTmWO1Wljf3QGqIOA5TDNM=;
 b=NDPs8QCQbIX8xxrzpDVdZKx4niDFFuVwQ4L2gS0U9lu2buXzSwPfqkO0pb96FUavFTtmnENwZncMImrEcYC2rEDIQ/wA9urnKEm2/03hEUPwd+YZZ7ZCf1MdX/8jMaghzkWdxOJ+P0qGn1zjaL2b+GzNE575+OfhMVOCZegyZJ1u8witq0WZrOt3CezDqr8VPvx3jYHerlTrHCIKiyUtFf/GpNavxjNj1bG83eu0i3pCsrBwu/6XoLeMurx2bDxOYCEGDdCfXGkqm2lOBuC/al6G3YAu4satCQRM7pHWiEzjZq3SN07H1S9LU3qUuTmCTGm3yxPaK717i/TaebdjhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 19:59:56 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 19:59:55 +0000
Message-ID: <04594008-7b83-44bf-9e60-930a673dc2ec@nvidia.com>
Date: Thu, 13 Nov 2025 14:59:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
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
 <20251112043000.83071-5-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251112043000.83071-5-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0046.namprd19.prod.outlook.com
 (2603:10b6:208:19b::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 699af743-cfc3-403e-11be-08de22ef3704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3ZBRXpkTHBPRWgxWFk2R3RzcEgrckQrUTRBN2d1aTIzVjRheU9teTJYYWFH?=
 =?utf-8?B?WTMxMDNUQVdiek9zZzByRGFDUld3MUJXUnZtdndoaloyaE82Y3BSU28xQnNH?=
 =?utf-8?B?aHk5M3BLWCtwdEZnYkFJcVpQWlQ2RTFSQ3FtQ2JsRHhJV2diOThtY2E3a0w2?=
 =?utf-8?B?SzF6Z0dEby8vMzVjRnRZbmc2VTB2Q3dWTXlxcTJlbnYvR2hqOGNhUk91Skkw?=
 =?utf-8?B?eTFYUElxeFJYTkNjaWlkMlNESGU3RldJdVlRNDZBWlNVd3pmeEJzODFMajRs?=
 =?utf-8?B?UmQzM0FKWTE4bG9nZWFGRGVrWTJZSGlPcEtaVVl3MGc3K3ZrVzJENHppYWZR?=
 =?utf-8?B?bmhXSUcwcWhmbHR6YmRaYzZSbGRneHB5ZmRubmFxc1gzU1AycGdNVk40dHJO?=
 =?utf-8?B?QjRpT29nTG5ETk1GL2p5VUM3bUdDWjZBdEFMa3E5RXRmSklNSnN3SGhtampv?=
 =?utf-8?B?SWxZTkF2ZVFjbWovZjgyZndiVUdjVHBROXJ2bnlBQVBRMHd3bEcrU0xZVllJ?=
 =?utf-8?B?aUFQb3FUOVpyU2htSUJkNVVWNGdpMEtLT3RJend2WCtTRktodjQ1TmYrYnBT?=
 =?utf-8?B?d1VBdmZFbEZFU2U5a1UvVlBydFpObEVjYWk1TGJJdEZmTFlYZ3Q2VkhKWWJF?=
 =?utf-8?B?cHNrRnVQTlNjNnIxVFJvUWZKaC9FTnY4N0I0RnB1eVdRT2xONmx0dENaK1Q4?=
 =?utf-8?B?RldZbXBUbVc4eGJSWW5uZjgrcGsvaTAxUm0reUFQb2tZUXlkbFJ6WXBuQU5s?=
 =?utf-8?B?L2FpQjk4eW10QU5WVlg5R1lyTndXcUZXTW8xOTRzaDRZbUJZVEpXTDZteGdW?=
 =?utf-8?B?cnBxKzZSWTg3SjlWS2FhMzljalovSWhHdlFpMjE3QTJzd1dQUS8xaDh5YTla?=
 =?utf-8?B?NFJ5cGRtZnJha2FRV2Fjd05zYWZuQ2ZuaHV6QnNMUldnWnRkNmpHa2l4VlUv?=
 =?utf-8?B?T2VqWFhmdy9EMjhWR1Nha3VMWW1jU05IcGxqT1FrUWF6Mk8ybHZiYWFocGhI?=
 =?utf-8?B?bk9CNVNpaWpXZjlXNDNwRGgyU1MxM0pLU0xUWHE4RmFVQ3dCN2Q5TmtNYnVu?=
 =?utf-8?B?UHM1dE44U3VwcVhSMlZwR3VMNTQ3ZUxtNXE3ZXZEWU9uM0d1VG5ZcU0rbE1P?=
 =?utf-8?B?R3plWUQ1MkliTVgvSzBJMnVndFBEcnVMYUNWNHhtM2FNcS9lTTRtc3JyY2hJ?=
 =?utf-8?B?WjVuRXJuZUcxaFJZcUVxYUo4bVpsaGt1OXZSYk11RHVXZzduTHhJR3E5Z2oz?=
 =?utf-8?B?WkhEdXNHUlJXNTBEelNKcFFvb3U0b2ppVGs1S0ZwVmF2OG5LdlNFQlN3SlZJ?=
 =?utf-8?B?U3h4Q3BtMkN1WFZGc3lQYnc0bnZQbHZwRmoxcGxYWWdTWW05N1MwZHRrUGc3?=
 =?utf-8?B?OEc5b29FNUlReWFxYTRkMnorRTBTcUV3Zy8zWndOa0Vkd2lkaGtreW9QYmVN?=
 =?utf-8?B?dkEwZXBRaW1rY1VORkpNeVArU3AxTVErZ1BVNnJwcytVNU1UMEFMaTQxaWpK?=
 =?utf-8?B?MUhOZERERDJUV3BmdHl5Ri9nZTFKaWpiVEhPcDBpMUpsVEg1Tm1hdmFsbFlo?=
 =?utf-8?B?TGZyek9ZcUFNTXdZYy8vNTZVeE1DQlZObmEzYVA2Mk1EcXZYOGMvQjUzNE5P?=
 =?utf-8?B?QnR5SVpQVmlJUXYwM2xxdDBpdllpY0lvRHZ0VnQ3aVZKcGtjb0hnTWQvRGVh?=
 =?utf-8?B?ZkxscFpxcHNzMWZuWjliUmx5N1ByZlB2QTJab2RyN0s5d3MzWVczNUo3aWdl?=
 =?utf-8?B?Vm1CQ1N4M2RFM1laQzBWTVZPODZ1S2VKSkZneS90dzRETGh2Q1RJWCtQMnRu?=
 =?utf-8?B?RkNyWkdXeHFWd3NBMWkxTDl5RmNKaTdVaUtTMU1vRGQ0UE9BRkJuSGtIa1Bq?=
 =?utf-8?B?NkpnaENRN1lNWlZxQWIwQWc4d1crc2lnQkIxWkVQelQ4UEV6M0E0ZHJzSWNj?=
 =?utf-8?Q?pLRW0z6uZJ9EBgp+wBCkFEd501pcSQPy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WndmK3MwTE9KSmdwb3NlbFNOZitIMVo2Rk1OUHB1Q3RKZ3picnQ3N2pnZ042?=
 =?utf-8?B?VjJKUlJlL1VoemdmNGEwM0k1RSsvN3gyVjZpM3J0V1RUckVJaGl0eGZjalJL?=
 =?utf-8?B?MEVhZWEzK2VtR244L1E2K0pENVhheUF3Uzg4NmZNK1VUUmZ0Wlo0ZU00Uis3?=
 =?utf-8?B?SWRmbHFLTVZkUlRHV3M2UnFJNS9DakNIcExVZWMxV1diUWxaNG1KU0NIanpR?=
 =?utf-8?B?ZVF0NmgvZ0RzdVd2dmtTRjlDS1N2dXZsRTdYWEFPSHdSNk9GSkY1L29uNitH?=
 =?utf-8?B?NGwrc0QwMnpLNE1yY2x2cWYxR1F6alhIenI5RUNaaHJOYTFLNlBydEVYZ3F5?=
 =?utf-8?B?QldxczhObHNxMTJQSGhlaE1qZzNQMzU4ZlpabFRlMzI3blJpb3J0eXZBY3NC?=
 =?utf-8?B?WDdIajh0dGV2emowd3hlam1XRXF5MG5vWU56Q0ZJN21rckgwNXZVcUZzV040?=
 =?utf-8?B?TzNBdGFuMTRkMEZGWVo1QWRoUmdtb0puMVRRK0ZtdEVQQk5zWHNZNXE1Q0NW?=
 =?utf-8?B?dGtscDJiclJpcTZsWXlyVVZGS3V4djMyNktoM1ZrZzAwaTB2L1hTbklxNnBQ?=
 =?utf-8?B?N2lUTkxmVXdydzF5a1N4eEorRzhxaW8vSGlPN0x0WlNOSFB4MHI0MHZ1NjNl?=
 =?utf-8?B?ckNkR04zSUdsVmJuV3h6ekMxRTFqaUYvSFpLSWpQSzdoZjZUbE9zTWhmeDhp?=
 =?utf-8?B?ZlhJaUR5QmVUVU9ONEgxUWttUy9wNUZHZDR2MHNna2hlaFVqRlBZVFp5cXFL?=
 =?utf-8?B?Y0hJZkxFbnRQTjY3MS9CK1lVMlR3dmpLYnRGSytZZEdUcG8rb2ZGcldlUlNj?=
 =?utf-8?B?ODhvNEM3UnU0MHNmQ2V0aEpQYStpT0lIK0RIM1Vsb0IzNzNYMkVqRWIrZHdn?=
 =?utf-8?B?V1VTZWdXTFBEeWtCZjBXVmwvUDZYR3Rsb3VFZWZFMk5PN1JUWUxGMSt1NVRC?=
 =?utf-8?B?YzZ0UUtLRUFseGRzaHc5a3FkVkFyMkw5aW92R25iVVd3eFJGb0hyVW5ybUVI?=
 =?utf-8?B?RWdneE5BR0dFcmp3ZmJNek1PdW5Ob2dNNVhsZTE3V1VaMFBzL1BjZGhKZStU?=
 =?utf-8?B?SzYvYzJqOTQzODZtVENIRHgwVE9jdWFMRXNDS2lDZnl4VFhwWXZ6ZHBGQlBT?=
 =?utf-8?B?eDZSckpZbnU3eWg1Z000WHVLU1R0ejdXQUNMN1V0SFBPcjI3U3U4NFl4TGVl?=
 =?utf-8?B?K3RlQmpNRkw3MU1OYU9aU3k3YzNZQXBUNVZ6S2wvSkF6cGMwQ1E0VkpnMUVa?=
 =?utf-8?B?V21OMkhZdUdqKzk5SDluWURReklYQ2lJd2V5SkZYS0p3ZXVXNXZRcERrTjJM?=
 =?utf-8?B?SnE3TmlUSGFoL0Z4V3hpTnFnd2hPUXlxT1hzQlR6bWJiWmZPa0R1TERnVnFa?=
 =?utf-8?B?Qk5QWWNqN1c5MnpSWk5iaS9EczlOY1pTOGpIUnVXNjBRZ2JlSGRORXZIMFQ1?=
 =?utf-8?B?eE1ZbGZOUDR4eWs1VWJ1cXRocEdrOWdtejVic09YWFdWb1FKVFY2YUJodUU2?=
 =?utf-8?B?R0lzWlpMMW4wbUlNY09LVjc3N1h3RnpjVXNkd0h5VFhkbkFPZ0dzNFo0bEF1?=
 =?utf-8?B?K1VoQ01rd2VSRUx3OGdNM1V0MzV4cW9GbUoyd3ZZRWZubWlqSWpEZEVtalg2?=
 =?utf-8?B?dFF2Mk9rdHY1V05KVzg3ZmlycE9PVUVEUURRaUZlalJuSm1IOHVBWVZyQzFE?=
 =?utf-8?B?SEh5cEtHdXJyUnJwaThyTlNxY28vWFpLRkFoUWJrbFNKMTRFUWlYVzdWaEcx?=
 =?utf-8?B?NEQ5c3FLUmt0SDJ4UTQ0ZUFMbmdTdTEzQXJUN1lacUxWcWRWMlgyVE5wTjJU?=
 =?utf-8?B?anVHa1pyM2dZUElLNVUxS3NxVEdLVWtiNnQvWlZEeFNDcUFPdDdlYklKazVZ?=
 =?utf-8?B?NjNBQ3hCNmdib0x0YlJPQVk3SXFNWEd4SE53NHhlVkZEdHZxVjhha2NIZFBw?=
 =?utf-8?B?UnpWUitiYUM1blpYd0J3b0ptUkoxUjJxNjNrakRGUmpYbXY5V2VJVnBVcmtD?=
 =?utf-8?B?VFpGWmlCYlY3WFZsY3lMc2laamxGbE9pcnNqRm1JdVdUa0xLVU9QRFpuanpa?=
 =?utf-8?B?eE5kbzhZbXB1VFpzOWl3NmVNN0Y5cng0aC81eWlMLy93d2ZabHhrRWZsTXpy?=
 =?utf-8?Q?dONe8MnAzjqpoPpF8gN+zDjgl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699af743-cfc3-403e-11be-08de22ef3704
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 19:59:55.0587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0OK7P6ZuRC4zGJfUjEPgwOFoQqMRUs6vVF+3IF96fGrge2LQRVO1cdXb3xfbfq9UlF9d/Ora1HezqW4PCWTFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571
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

Hi John,

On 11/11/2025 11:30 PM, John Hubbard wrote:
> NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
> architecture and revision details, and will instead use NV_PMC_BOOT_42
> in the future. NV_PMC_BOOT_0 will contain a specific set of values
> that will mean "go read NV_PMC_BOOT_42 instead".
> 
> Change the selection logic in Nova so that it will claim Turing and
> later GPUs. This will work for the foreseeable future, without any
> further code changes here, because all NVIDIA GPUs are considered, from
> the oldest supported on Linux (NV04), through the future GPUs.

[...]

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index cd58040b681b..8c5f46f6aaac 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -175,19 +175,41 @@ pub(crate) struct Spec {
>  
>  impl Spec {
>      fn new(bar: &Bar0) -> Result<Spec> {
> +        // Some brief notes about boot0 and boot42, in chronological order:
> +        //
> +        // NV04 through NV50:
> +        //
> +        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
> +        //    boot42 may not even exist on some of these GPUs.
> +        //
> +        // Fermi through Volta:
> +        //
> +        //     Not supported by Nova. boot0 is still sufficient to identify these GPUs, but boot42
> +        //     is also guaranteed to be both present and accurate.
> +        //
> +        // Turing and later:
> +        //
> +        //     Supported by Nova. Identified by first checking boot0 to ensure that the GPU is not
> +        //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
> +        //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
> +
>          let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>  
> -        Spec::try_from(boot0)
> +        if boot0.is_older_than_fermi() {
> +            return Err(ENOTSUPP);
> +        }
> +
> +        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))

There is an inconsistency in error return here, if NV04 through NV50, it returns
-ENOTSUPP. For Fermi through Volta, it will read boot42 but will return -ENODEV
because `Spec::try_from()` -> `boot42.chipset()` with return -ENODEV. I am Ok
with either error return, but it would be good to make it consistent.

There also does not seem to be a diagnostic if the chipset is not supported. It
would be good diagnostic that the chipset did not match, right now it will
return -ENODEV, which could mean the device does not exist. -ENOTSUPP is better
though but an actual dmesg error message would be nice.

With these,

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks.


