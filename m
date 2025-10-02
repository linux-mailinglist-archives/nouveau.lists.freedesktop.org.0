Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B090CBB22E0
	for <lists+nouveau@lfdr.de>; Thu, 02 Oct 2025 02:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFB810E74D;
	Thu,  2 Oct 2025 00:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LLElWZ5R";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012000.outbound.protection.outlook.com
 [40.93.195.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46B610E74D
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 00:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsyzuhtCWu/2cMhPDeZrH4vVPfQjwNL/Z5zl0nUW9kgxkdW6rKGivXGsrAAWNpou6CrE0dlbQF6ZJY2WhvtQeD2KpBPbRiMykbizF5WiYObD0TZjvh45SBLHBJi5qpXAb9uushlfgbe6TLJzM0CTYTqIijazgk3EY03xUumsSLJrmc/wQximqwn54NJ9j8LmCYHezrDKC1c3Kh1SfpGT6KX/VQ39QWmDgGuq31zNo4fqfGrohNVQfdhZ443bT7bLJggk9GaMwp0bmPMfOUpb8wnO+B66e2HICXxWAWgcgHe4AK6/JNhXoBYdHZq1lME8WalPRWOCPy9Za95ERXzWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0hlFGWSfsTfMZdmTSUSOgcf701GvxV6Qn/P1UXIK8k=;
 b=lB4ae2x3HYQdMi/699Qnq1YdSuBLWxmk8Y3+wneN2SLcUCKaA+gITfUB1AGEnVIRB3WztDUgIF+3w089VGflG5+86V2hiVHJ9ooKpfpX+GbA1r4+T0lMYIUcb9U0QXlA2EKAQ7UAXaNZ7MkxeVtxRVnbkN6JYlUZQ2phh2OLn3R/v2vVsXaJc6Vfc/Dd1B7xU2SYkPKL2gu+71wtK8DD+QKq0YIBYaG6lXtyC1OonQmwX1noWX8qCkmRUHiYVL04/cT4SCGSvreQXI///8BYLdAuKpdWF38RW2VMH8pZMRsSv5E9vwWImwuqzdcZgCHQW1ZanZTYksLrGYh4vjsYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0hlFGWSfsTfMZdmTSUSOgcf701GvxV6Qn/P1UXIK8k=;
 b=LLElWZ5R3lReqXG9FxdeJmrzTEmhxcmEtGNQPBEH00r53r+F5dDW2JytHk5XgwVhc8cKp+Xvu+tetCyCIgQytd4FFs0ZE0D2+SQYhy/u59nReo6TM8UlrH3NTQjoDsX4tn4q7yX/Z6xEXj+YVRRmI57aPNcqT6xnZWbXfFfrCsR/FDW1q9iAeLEGqqxJypOT51kemrIDHCzzIKUmsYOPuu6bcHbJOxBSfI2waRZyvzPFuHYpxQdbc6D+M0Qau0NaiEqT+blTi+D/6lRh+tb5NcVJlormZhvJ1AqKE8xUenzk8z/oS0MIRFMB14kctqyLRC+OAl7a3UUjuxRorgpIjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH8PR12MB9743.namprd12.prod.outlook.com (2603:10b6:610:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 2 Oct
 2025 00:55:21 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 00:55:21 +0000
Message-ID: <7fee5949-6ff3-4da9-926d-01c1ba89e2c6@nvidia.com>
Date: Wed, 1 Oct 2025 17:54:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: pci: expose is_virtfn() and reject VFs in
 nova-core
To: Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Zhi Wang <zhiw@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20250930220759.288528-1-jhubbard@nvidia.com>
 <h6jdcfhhf3wuiwwj3bmqp5ohvy7il6sfyp6iufovdswgoz7vul@gjindki2pyeh>
 <e77bbcda-35a3-4ec6-ac24-316ab34a201a@nvidia.com>
 <DD6X0PXA0VAO.101O3FEAHJUH9@kernel.org>
 <f145fd29-e039-4621-b499-17ab55572ea4@nvidia.com>
 <ae48fad0-d40e-4142-87d0-8205abdf42d6@nvidia.com>
 <DD7CREVYE5L7.2FALGBC35L8CN@kernel.org>
 <e19781f3-1451-4b4d-b4be-c71c9ec8dc63@nvidia.com>
 <1FA2746D-6F73-4D5A-A0DC-803D0563A5D7@nvidia.com>
 <a7bd8285-922e-446f-9b43-a67fff67a505@nvidia.com>
 <DD7E4902SAFP.3JLTVDIKKCRWS@kernel.org>
 <68BD4291-A757-475D-A1AC-582EF4ADE197@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <68BD4291-A757-475D-A1AC-582EF4ADE197@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 291b0059-cd36-49bc-9a9f-08de014e5d02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am0xTE1WeWlBYnJXcGFvNEI2WFFXazRoT0NWR2xWU2c0Z2szbWxJcmhVZmdG?=
 =?utf-8?B?ejJGcDNKV0JXZ2FEbGo2aGVKTU5idElFM21lcHhWVFlYZHM4U29nVmNYcm5X?=
 =?utf-8?B?cjhzd2xEemhINEJxMWVyMTErYkd1UWFrNkZvV09rVk1OVFZteTBkbGZDTzA4?=
 =?utf-8?B?OUdtL2NoM0l0TEdUa1NaT3hDekoranExVThQUUMwNVN2U1NQbEhYa0IyVlY4?=
 =?utf-8?B?VGxPQlhkZGlvUHJKbC9JM0J2cGozV0ZOQXZYYUd5SERPTmRuVDdueE1rTHAx?=
 =?utf-8?B?YXQyOHNxY05sRkdYbUhYeGtDVDg0ak9GVnFITlNVM3NvUXNUZlZCMHB3Smx0?=
 =?utf-8?B?bHhXOUlGVWZranREdCtkdWJOcUJLbzZIcEhGemIrSnN0eXRHMlQ3WENubWFa?=
 =?utf-8?B?VGhaV25UdWV5Q2dxM3NISHFKRVVreHJXVzlnV3Y5a21ZZ0twWEdYMEVESkxM?=
 =?utf-8?B?UitYTDE4OHl4L1FWQW5lbGVjTzVZTHl4Wjk1UU9jVWdRTGtDd0MwQmNpTS9y?=
 =?utf-8?B?UDA0dDZPMEdldEp1RStteENkZHFhcW5JQTJPV2Zsb1VBRVFSTXc1ck56UVRK?=
 =?utf-8?B?MHBlUWM5NWllZStDVmp0YzJEWXRKZit5b0tIVmVWbW91d0piMkN0TXRYQW9J?=
 =?utf-8?B?b1Z0dU9sSHphQ2czekhmNUM0QUNrajQxREY2UXlBRURKZENqT3UzLzdQaGFp?=
 =?utf-8?B?LzhwcVd4ODIrNURVaVdFN0xXbHhlS051ZDZsRDBUS1pIWTBPdE5adW12ci9u?=
 =?utf-8?B?dWN4SXNzSTdVTHZpbXdWQUZnREdaQlY0WGtmRkU5bHlodEZmU2NFN1hoRita?=
 =?utf-8?B?ekNVSlF3L2laU2hjMjZCb1pUWVZhR2Q2a0xjblZJOE54clMzNjlRb2UxNzQr?=
 =?utf-8?B?cG8xOHY0SEVrMm5sN1V6VjVwcFVPR2hsVDdOM0cxc0hFNmJzQ3ZCc09jRTdI?=
 =?utf-8?B?d0FxeGdhaFNoOU1PeHAzd2tNNTJoK29ydGdhR1NYOUxJV1dDZ3RsTWVRUlcr?=
 =?utf-8?B?c1JuUk1EV2ZNQndKTUlwZkdsNjRKZlN0dktWMWJnQ0tPNThOdXRhdVpWSlZW?=
 =?utf-8?B?RzA4NmFWTFZvNWoweGk0Rzl1cnFUKzRLMnBsUENxdFFuaWVvMTlHY2JUeU1p?=
 =?utf-8?B?bzYvSDg5Ymg0YlNNK2tTbkdPQzh3RmpQenQ0MU90am12UGFVcnBsZEZaUVZL?=
 =?utf-8?B?czNra1lBL204WUJEeGNQZms2Mi90UmJ5eDkzZ3VROVJBT1ZnS1pOZXY2cWxD?=
 =?utf-8?B?aWZlc3ZUNDNaRWwyQXNqZXZuRHlVRjU0THNtTHV1Z3RBQVRyZDJkck1TcFVy?=
 =?utf-8?B?ckV2TGJxSTkzY1JZVk82SHB1SDU0TWhVc1lMVXpjZFNraU9manhKS3FXQnpY?=
 =?utf-8?B?N3JBNEowWFg0d3BXakpLQVZFeU5NZkcvNzRvdG1McW03eXc5Yk9Ed1Y3c21h?=
 =?utf-8?B?TktjQThtZklpSEtuZHI3MmRnUDBuRGkrMkk4YWRyYUZyN3JkelhUUGVzSDBL?=
 =?utf-8?B?WDNQdGJFNnBCU2x4SHhURS9lU1FjcFFnNzg5ajJBcGgzWnNzUC9vRWFZMVVt?=
 =?utf-8?B?NzFiY1ZYNjY3d1cwckQ4cmJpc1RheEpJTXhRQmx0aFlRL3gyL3djdGhJL1NI?=
 =?utf-8?B?ald2djF5c3IzWmhmYS9mb3I5ckR2eXFnOU9vQjNVS285L3FIRHAzUG80dWxR?=
 =?utf-8?B?eDRHSGlhZW5TbnVDQmVIVElWdW5zWWNFcE5DakV0ckxuOUJ5aG5SaUV6c2Zy?=
 =?utf-8?B?cDBQR3hXdG1QMXgycmRYRHREUEdWQ29ybWgrV2NyMHVYOHZBTm04TmRuczdD?=
 =?utf-8?B?dU9PSlVhY3oyQmM1Vjl6a1FnUFR6cmd1UVFwSWxrV1FSM09nS2FlbjFiaCtr?=
 =?utf-8?B?YmtGSzBBMHdleFdTVTJmaGNyUDljUWl4R1VWYmU3UVFJdVd5ZTk5NEFnR0pD?=
 =?utf-8?Q?qMZrxLK3xpHyG+TckekTffPo8IjMVEz3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andqZlZuSTRPeGc1QVdLNmhzemNWbEZ4ZWsvTHg2M3FVaGUvRmdleFJWaXdi?=
 =?utf-8?B?YWttcHQrT25pVC8vMFBlY1hBYXNSa1ZlTWJBRDFCOTRuTE1TQ2xBcFo0MGlk?=
 =?utf-8?B?UGJlVWNiRDZhRW9yRkhzZ2NFdHVpb05CMDNudHFqcHByZzNjalZjbW9qcytK?=
 =?utf-8?B?Zkwxa2dLVXR1Ym5ZZ2FhU1oweHZJMWsyS0NvZHZyMHpodnJWNExFNFZJTHF4?=
 =?utf-8?B?MnFZRlhVcTQwZzRXcXZaTmhQS21rZDVrKytZaFN4WEt4UFRSZzg0emdZR2Nh?=
 =?utf-8?B?SWRZT1lkajR4NTJvMEUrbTIrRXFKVytnbEZXSGZnQXVkWE9FSjJhNkJlY2Vw?=
 =?utf-8?B?K1ovZ3FOM3FvaDFSNlVtMVlvVFJReE5PRkJpTzhDTG94VERoMUFsNTBQWWJt?=
 =?utf-8?B?Mi91RkZDYktmbTc5R2tBTUxHOTA5SXRwWVZHalJSQ1REeGpoVEo0OWxhN0hX?=
 =?utf-8?B?bkZaNUxaeTZHb3pHV05GNFpPSGl3UjRTdjJ5czdRcTlVTXYrRmZHODhXNHJS?=
 =?utf-8?B?OGRLTjl6QUg0WjhXSHBCQjFibTl5V0xMT2lzbzlaWkNid3p4V0l2aDVzUEJW?=
 =?utf-8?B?QnhjU1pWaXpYV0E3OVVBVEtHSGNxdmJTeVpVMkdENGpvZVdYME96THd5SFJy?=
 =?utf-8?B?TFJWS2g5dXJmYVhmNDBGVm1ZNHBROWFNSzhVSHNwbTlhMHpiZGdNcjcxU2Zs?=
 =?utf-8?B?dmtoU2ZnUjkxNTIvVWdzOVVmYzh4ZXI4M2o4cE45a2tCbTdPQnQvY3A4cU5w?=
 =?utf-8?B?Z0FNTVk1ODRMVm5FMStTUlErVWRMM2svS2tSZVlScGtma3d4MDB3bXY0QzVE?=
 =?utf-8?B?dFNEaFhoQ3FOaURuK3lOUHJ3dVlJbVpGUGJpNUh5UDNuNy91aFQwUHBEK2dj?=
 =?utf-8?B?MVZLcExCZVVza2dZalk5OVl1aXNWdUtMcDVxaGM5RW1XRStKaktQcjFZYlZI?=
 =?utf-8?B?ZXdnMmkyanU3MzRrc0VHT2pud0VwSVc3MGZPQnZaUXQ4VytvUk42UU9vWU5w?=
 =?utf-8?B?Qm0xMlVQWTBSVDBBTkliV2JaZ1FDL0U0KzdYL3dXc1EzY0lDZVV3bm5wb05v?=
 =?utf-8?B?dmJDd29aZHJCY1dLa1FqU0lJQzU2N2pwdkptYlRweEV2UWJ5ZzhMcVJ4eGtz?=
 =?utf-8?B?K0lhNzhGL3B4a1htQldSOEhsOTVHTnhzV0duZ0ZZS3Y2WnpWU3NXYnVGeWxy?=
 =?utf-8?B?aUNUQm1WUVRRTVVNZ0trYjNaK1dkdmFrZlcvRkxuYmFDbGROOGpZd2doeHo5?=
 =?utf-8?B?U054UzNmSUkyczdGKzFqZmtwc1daZHZyVnZ3V09QVitiUE9tNjNSWmV2bTRQ?=
 =?utf-8?B?QW5BdUo4b3dzS2RuQzFjeGlNaEdXMmxvdzVBMmJGMjIvMjVWUnM4WEZCdDcw?=
 =?utf-8?B?UDJGUlRJOGVYNWNWVGtteG1BdXI1OTZhbVl3QzZGb3RCd2hOSEFIL01HS0Zu?=
 =?utf-8?B?bkJDcjVXSFd3RjNDYktZS1JBZDlaWVVUV3ZoYWRqSENRRUJoZmZIWk9KdGtE?=
 =?utf-8?B?MHNXN2YyNzNEZkRXWFB4L2I4Rm56ZEIxd0oxRlV3a3Nxb1VNVk43UXhod241?=
 =?utf-8?B?eHZUcFpFZU9UaGwrMVlZcVVRMEI5UVBQSEc2YzRSOFVHMVhkdzRPRmMyRDVK?=
 =?utf-8?B?VktrTlQ5RU95TGg4ekgyaHorM1lraFowNVdWb0tFbjZoQXRPaXpSZ3VqaFNH?=
 =?utf-8?B?NVQ3dWVtdkFMdGkxWExHMTR0TENZU21TeFNiaEt0TUpqckRWY25SZW1GSHM5?=
 =?utf-8?B?bDZWdEhpRzN5UGhiQ2k0cHp6Kys3b0JjQlQ5NTRBNEFlR21lbWpFUHVxcTdI?=
 =?utf-8?B?YW9LWkpyY3dqUlBsd3R0R2RaQ0l3eWRmZ1RSNDdRQWhadFk2QnRieU9Oa0M3?=
 =?utf-8?B?Z25IZll3ZGRzWjFleFhyRHNGS0l1TTlLRmtJWWVoVlpGbDdlSXZ0VlFPMVB2?=
 =?utf-8?B?YUt5aEtHSG1NN3BlN3lhQ0xCZFBxUzc4ZE5PWnZHYVJWRVFvckIwQTN3bGFW?=
 =?utf-8?B?ZitFcEJPaTJQTWw4dDhpeVMzZ2VxV2ROdDZyTnpQS204THgwMUNQeGJWK0k5?=
 =?utf-8?B?eWhBNjJKRzR6VTRHTGlPc3c3eXFzK1d3R01uWGpXeGlneUVBUS96T3RMZXVX?=
 =?utf-8?Q?ONMPIAOEeHLyomW0OeLwo21EK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291b0059-cd36-49bc-9a9f-08de014e5d02
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 00:55:21.4253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4C0BW1kIOs2AeFpeU30z8WwGfSETvQMNCNmqvLc+MQNmOtuFiHdlRV5rcEO8prO3P79KLMsxpr8IGRB3K9KQBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743
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

On 10/1/25 5:48 PM, Joel Fernandes wrote:
>> On Oct 1, 2025, at 7:56 PM, Danilo Krummrich <dakr@kernel.org> wrote:
>> ﻿On Thu Oct 2, 2025 at 1:51 AM CEST, John Hubbard wrote:
>>> On 10/1/25 4:47 PM, Joel Fernandes wrote:
>>>>> On Oct 1, 2025, at 7:00 PM, John Hubbard <jhubbard@nvidia.com> wrote:
>>>>> ﻿On 10/1/25 3:52 PM, Danilo Krummrich wrote:
>>>>>>> On Thu Oct 2, 2025 at 12:38 AM CEST, John Hubbard wrote:
>>>>>>> On 10/1/25 6:52 AM, Zhi Wang wrote:
>>>>>>>> On 1.10.2025 13.32, Danilo Krummrich wrote:
>>>>>>>>> On Wed Oct 1, 2025 at 3:22 AM CEST, John Hubbard wrote:
>>>>>>>>>> On 9/30/25 5:29 PM, Alistair Popple wrote:
>>>>>>>>>>> On 2025-10-01 at 08:07 +1000, John Hubbard <jhubbard@nvidia.com> wrote...
>>>>>>> ...
>> If a driver does not support a certain device, it is not the user's
>> responsibility to prevent probing. Currently nova-core does not support VFs, so
>> it should never get probed for them in the first place.
> 
> That works for me. If we are doing this, I would also suggest adding a detailed comment preceding the if statement,

The nova-core piece that decides this is not an if statement. It's
a const. It really is cleaner. :)

 saying the reason for this is because the VFs share the same device IDs when in reality we have 2 different drivers that handle the different functions.
> 

I've got it passing tests already, I'll add appropriate comments and post it
shortly, and let's see what you think.

thanks,
-- 
John Hubbard

