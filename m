Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E8AE1BD6
	for <lists+nouveau@lfdr.de>; Fri, 20 Jun 2025 15:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B876B10EB5E;
	Fri, 20 Jun 2025 13:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I8qpfg9J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E0510EB5C
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 13:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPiOFjOxek6C7mYQESdZdeqPlTO61prklcz5CDY+MwlSJV2b8TR1VAP9ifjkHlIFq/1Tuiya8w/mosbGr33swfhAPEE4YG2WIwayrXetpslP0/o9XnE6QCE7JFQ/f4CCpE1IEov/x2e8sTDwcTQy3z+pEkeDnOTdC6PjglkGV7+3YvIXEJPAVG/Z7HjFYFddQumrmqxXd1cRdLjlvCHqtdpTd0o6Ed1iR5C1Mxj33n33ZYeAo+hb7wPYYhdxNxH+Hb2YvLGPF27LFU+/8jp4lr778HaY8OC1Qmrxtl2Tk2y7ypmq+oKtGC93Tx7hOkx0LMnKpMEi4mae8NAyJ7o20w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCOvhckJ5zg7t/7XIIUxMcWycjPJLrNziVr/TrDOtnc=;
 b=uSUo4VswV1nrA4dm/A+DMVt7t63gPswyQxWsUGtoEI9eW+zOwQK/eAXjdMUtssvJDsEMoFPy6ePnAv1HWFhYqzW5ES/vRx30NzKmJnnA74tF9FAoEGRtuPT9ZbgSOID/puwtDZwup43NoK51TxmmlB5BvnPPluQULjKk5B/4t3yDaBMZ+wy5vxZYhcYai6Epu+yQ5GaTjXcGZNcjsvaSyM/G92HuPkU+Qo9sA89uRmTJMjpfykI1MjVrkrN14sOG0hNpKKhBJfp2DVJsPse1s5aa95fe/WSMs7/s+FTpeI/asoQ0u/X2fYh9sWZ1YaIdDe1bGl7ARsbqJEhoa50rFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCOvhckJ5zg7t/7XIIUxMcWycjPJLrNziVr/TrDOtnc=;
 b=I8qpfg9J/PdNAY4PiWEr45wjaYGRvGVRDiLtO+oBLhVuOz2+s53YTnU5wvgqPGl95DFzogXMMjRpDABzhKTgRbZC1Cq5ezPcIerH7l+aabcyStHgZ4/kSVSlxeGkq4hGBTP1YQB84XZkmteoKGSi51BotfmUS7+zyEYPMG28e6pMPjaD75M0KgEBfKHsjY85G+wrRJBG5RHRYgLPJRD6mG7BXM+uG1NgDtLSQqTaPEgn08smY0zI5ig2khgT1SOalAfbR6c6fwZIYiyhKtWrby4cEsn1Uovk5+g12n8U9mx9PnY2q025WWU76WulrNY+1R0jKj3kkmGylmn8l6Wb5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 13:15:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 13:15:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/3] rust: add `num` module
Date: Fri, 20 Jun 2025 22:14:50 +0900
Message-Id: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpeVWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3bzSXF1LEyDXwjDZwCjZXAmosqAoNS2zAmxKdGxtLQCFwgrSVQA
 AAA==
X-Change-ID: 20250620-num-9420281c02c7
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 59115505-5eac-4150-d82e-08ddaffc7901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnBRdG9FaEp0SlFiaFBhakpTMytTVjlSM28rRURSWXZBdVNybTlzRzNjbXUv?=
 =?utf-8?B?RVMwQzIxbXhyclRMTFhtUHJQMmQ1RklkTGQwWmRIaTFaMzBkZ1JuTkNaK0ti?=
 =?utf-8?B?Vld3MzZqeU81RTdWWHphSjU4WnAwNzJhdnlwbHpnUUY4ZStrVDBiK2JhUnVM?=
 =?utf-8?B?OUJZdTRrd3FhRW44anFGY2IyVHhVM2dKZEI0bjhublNqVnhmT0JLZGdaSUl4?=
 =?utf-8?B?WjE3SUJXNmN2TjRpUVFTbG1wN0FTTmJrR2NrZ3NnT1VHQkNhKzhxVHpXVWhh?=
 =?utf-8?B?NVVmeEVadmpCUEJuSlhNc1ZMUDA5MlI2Y0tWSWcvd0JpcXFWUlBhM3dXMVpo?=
 =?utf-8?B?U3JRc2VMMHQwc1dkNUFwcTl1Q2VlMmhyZnRsYlZWWTNyeElpOEpkbm40Mnc2?=
 =?utf-8?B?bUU0RFJ2VlFTZUFRUzBZczNpb2hsWWhDSjVpMXNyMlRSQzBEa2J2TWtpQWhV?=
 =?utf-8?B?SGFUVFV3RjRVTzFDMzYwOEhobmF4a2w1Yk4rdDVRRlVPUEsxRWNzWmhSdS9t?=
 =?utf-8?B?QlNpaGFlS2NGRGRPMHNvMDRRV0V1UVZvNGdRZVpQcjVEMlVnUklRMml3dUgv?=
 =?utf-8?B?QjVBek1ybDNNQ3FpeHNqSGliWm5zYWozK3FGOEZMbkdpekcvRkp5Zm5nZ0dk?=
 =?utf-8?B?TXZSQ3FHWDVReFZZaVRCVWltM1lxU1RzVmxVWVdIQXNlbkJWMUFKNmgxOTBS?=
 =?utf-8?B?YngweTZXUnNXdW04bmw2NWd1Y1V0dnZKRHlNNTdMd1Vxc3YxMXBQbTArNWJF?=
 =?utf-8?B?MnZ3V3FkTjBWVU5LWDhDVC8wNk5FK1VCcVdQeW1QbGxkKzRRLzNqd3AzK2g5?=
 =?utf-8?B?ZENhaVU2MUk0UHJsTm5UTk1IdW9QWVNaZ2FVTEFEQm40SzlhQ3ZJVitMVWJz?=
 =?utf-8?B?S3I1V1Y4ZVYxTFNBRmRqNW1JczRlTloxODJzTTRQbHFXOXNuYUM4R1BpWFZn?=
 =?utf-8?B?Vit6QzgrTlZOaGVEQjZJendxSllMeWkvSWhoN2NUQ09yNWp0WHdtcFIxVnZC?=
 =?utf-8?B?VmJVOWg5eHZ0RGw0a2YvMEMrVUwwdytETFdSZUJ2alo5NUZFa1l5bXViTExx?=
 =?utf-8?B?Slh4NDhJdTRodUx4TldGTTgwRXYxREVkS216TnFKWU52bHFXM0NtQjZ5cytC?=
 =?utf-8?B?N1ZET3ByZGhncUFSS291RWdUMy9mYzEzTGl2eS92S0hkY1lkOC9LNVJHYnly?=
 =?utf-8?B?Uk1udDFQOWZVRzFkUHh3WW5PWlRkZHgyZXZoTlRUUG1POGFlWWpmQm4wclEz?=
 =?utf-8?B?Q2UwVGJ6dW9hMGpCWFBtWDBqZzJPL09vQUhseCtCRUVycm81Qkw0OGNxOVVC?=
 =?utf-8?B?bjljUzhsSG5Od1ROckxJS0lHZ3lndUxzZ0J3b2pXRXpuTTltQmp1OXFjMnph?=
 =?utf-8?B?S0plcnZaWktkUmNRYVl0eTkySUw5M2c2cGlFSlUzMVJkTlNrYmswTHA2M1ll?=
 =?utf-8?B?UW1ZZnovZm1aMUU3SGI5MW9ycElhVkVwaTlnVnIxaFlEcHU5V0swVUVTajNw?=
 =?utf-8?B?M2pSeE9TN1Z6L21rM0tDbXhiZlpmcUJrTFJuZlJxSTNrN3MySzh1ZkRsdmQx?=
 =?utf-8?B?RUNDUzF5TTJ0VlBLYmp3Mm9nVTJ6S0FmMTUwMGtteEdUZVRRS3lJbTcvcmZa?=
 =?utf-8?B?K1YvYTgvL2tOQWRUYXhIQm5OeVVyTnRwenV2TjlKSEpZcHN5NFByYTV2em9p?=
 =?utf-8?B?OWFXN1lpSGNSa29aVzZRV3psaU4xL2dtbng4RkIxblN4WWpsbUg0T1IwdlVU?=
 =?utf-8?B?N09rVERvT2w0SDJZVFlGZnV5cDZmd2phdEg3ZUpJYk02a2l3cnp5QVNRcy9t?=
 =?utf-8?B?cnlDNmhMOCtIUUR0SDlwZVkreUt6T2ZOQUJjNzdzQlc3RW1GdExFVHg1K3pC?=
 =?utf-8?B?VXBRc01IdEFRYXNiUkp4Q3dXY0hjMld2Y0Z5TmZYQjR4OFJqZFVQbldMRGhu?=
 =?utf-8?B?L2dNcmdWZWxkWkpFWFhtOFoxaWhGNzRBNWw5akZ2VXpDZFdwb1FTMXNQcTRW?=
 =?utf-8?B?S0ZYT3RuZTl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUdWUGQ5U09SR2F2SjNFK2pnc0xUa2I5T1FwSHM3eUIwZnpydXMrV3FSMGp3?=
 =?utf-8?B?QlRobEhoUklNVDhld29GcndkVGVKUXYzSGQ4MitncGJGaWpHaVhyR1dSU0Uw?=
 =?utf-8?B?LzBsV3R4RS9FRVNGQmoxR2svTlBtcTRHY2NqaURtWUgzRDJqUDdvLzRzbGxR?=
 =?utf-8?B?QlpYS201dlBEY0Q3SUs0WlRXVHI3b1RLV01wZ3NHSlcvcFh4V0RpdXNZVGND?=
 =?utf-8?B?Y05TSWNQVVBCRTVnSkdpdkR4dTVOS25YdDZtQVRqeWM1STJ3bE1HbjQ1MkZ3?=
 =?utf-8?B?RVQ1dW5TdU9kejE1SjY5cjVUZFZSRHZRNTFyQnRhK3JpVkhkU1Y2YVVZWit2?=
 =?utf-8?B?OHdTclY2cTVRazlNQ2ZydDh5YVlURjFRRjlEcTMxUkZPZWNPWXlQNC96VTlQ?=
 =?utf-8?B?VlloK0R1eWdMZE9Wa2laZ3Rrc1ZVNVhYWnRlcjhxc1hSVWJuMmxsejVGTXlj?=
 =?utf-8?B?YmJWWnRVSXRSZE9aQmwwUWNvaXJIbW5JYmZxeTFVYjBCbE5iOHdCdkZ6ekRW?=
 =?utf-8?B?WDRqc0xpaThzVmxEM3RrWndLVmdlWHFkZTdHUFBCNWc5Mkl5MzRSd2tOOElD?=
 =?utf-8?B?Yjd2NVNtYXVUSUladUg4S0tIc0lTTFFPYmo1ZXNHU25TMXAwcDZ0RHR3eDZP?=
 =?utf-8?B?RGo5TFlSZk1mSjRJWFlMaGJ3bVIzWi9SQmRmUEJpVTBWMmo5Ung2c3IwR1V5?=
 =?utf-8?B?ZUliSElQWDFtZzIzWHNqYmttQnJQZ2thd01VTFB6ajRYUUg5ZlIyTlgrS3dW?=
 =?utf-8?B?NnlzL094OE1FYWFETGdZWTVIcTV4OFA2b2l2clJvQmRpRDcrVElTQ2tWTzBO?=
 =?utf-8?B?dU03UXVSRkRYajcvR0I3elZ0akNMT1pKbXZoUDFrb2lja2srZmdvT2M5RlB4?=
 =?utf-8?B?UUtwejJtMytPOTVKZk5FK2c1TGw3aGwrNHNFOTJxWXQvL2wyVmptNUxpVlJh?=
 =?utf-8?B?ODk1ZzlWQUJzeGcxcFhVWFpKTXRQZElTWFN3aWdTWGd6L0dKdXBPSnVCUUxR?=
 =?utf-8?B?WkpIVUhNRld3dnJLM2dDZE5WeWNHakVrQlQrZFp5KzJxRmNKM1FVclVnSzFR?=
 =?utf-8?B?cDdEd0t0NU8rVUI5d3VaZGFpaUdoWmM3ckdyRTBhY2xtaDZLUVpkWGtmcnNl?=
 =?utf-8?B?ZnVEMEVScVR4OVdYUWJSbXZYYlBoM0x0OWJSd1hxYVZRY0s1eTRZeHpKeGpy?=
 =?utf-8?B?TXNWUEUxNEIxTGJHRXY3WFlEdi9OcmtkUmpOYStjQ0ZHVVkySzNiVVFCU1RI?=
 =?utf-8?B?Tk0yNnlnTmg4cnhCOGJycUlGOWRCWDI4RkRUSE96Z3VvVS91VWk0eTdjUUlW?=
 =?utf-8?B?dW9SOFFzRUZZRGRKUDhJNE9CQlEzNVZlYXlqdjlpUVBzTWZ5U1Z2NDZ3ZEVs?=
 =?utf-8?B?c2trWm1md0VsUFNTOWJpZ1RZWHkrMFN3dmg2c2xGZUp1SzlEcGxhYllOTjJ0?=
 =?utf-8?B?cTVTUkFvbnhLYm5kNkoya1pUZUVmellFNWp1UXEvV1g0WlplaWFoNzRzL3gz?=
 =?utf-8?B?d0JiRXNGR0s3cEVydllyeDREOHB3cnE2UUh6T2JpQWtFRkJBOE9ZbVVnTDZI?=
 =?utf-8?B?S1g1YjBWQ2ZJRmozbkRPV3NNaHpNNU1UQnQ3YkZPTFNRNHJabWVySXJNMHgr?=
 =?utf-8?B?MW1YbkFQQ0V0dlVzZlArUEtWTWNpVjNkWk1jbmMxd2luRlcrM2RZa21sU1g0?=
 =?utf-8?B?WEVIMWEyRGw2WGZUWjVnMERVbDc1QTlKemwrckltSkszbHVmTkFwcVB5QjZJ?=
 =?utf-8?B?Vi9yY0Z3eVNqT25NQjFMVTR1ZEo1M2JpTC8xWTd5QkhPZlJFR1htL0NzdHIy?=
 =?utf-8?B?bEtSbzk2bFA5Y1JMUkQxdnhkT0p5QTZmbFlJUGpuM3g0bFdQbmJqTU1uYVRN?=
 =?utf-8?B?eGUydjhNelppbmFFVko3WUduc081YTFXQTRBZWhlMkJRVk1neUxyM1RqbFFt?=
 =?utf-8?B?VUNFT0c1cjJJekN2a2xBenI1dmJIcjcrU284NWVjdXk4d29BSVZqckQrU0lh?=
 =?utf-8?B?UzdFMlRScmxrZWRpRE9yaU40bktNUVBmNHhYMjFQeEpOQW1HcUJJTDdnaWVp?=
 =?utf-8?B?WithZWVWQVN6SEJEYTB5UWlYcjZvTEswb2xkZ2hXVXkrTWdvSWtnU0RnZ0ly?=
 =?utf-8?B?SHpkNzFZUG44NmFpRUp6SUpxaktyb2tSUzZPbksvd0JIbUsrc3REMU9iM1d6?=
 =?utf-8?Q?IDZZnFrfjw1jqDE7wRYfbFtmJQ0BZdzi5kne1mbYkEb0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59115505-5eac-4150-d82e-08ddaffc7901
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:15:06.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ftoe5ScmgIQiJ4mwK4ym2CQ90qfu7dzOwbSyQ1d8a/cwLdby7tYuUfbpxlVfPdtZrKjGFiqk7e/2rZTNvQz4sw==
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

This patchset was part of the Nova FWSEC-FRTS submission [1], but has
been extracted as it was not very visible there, and seems to require
more discussion that the Nova code. I hope that presenting it separately
will help make it converge towards something that can be merged.

The motivation for this new module is to provide numerical functions not
supported (or not optimally supported for the kernel use-cases) by Rust
core. One example is how kernel code often aligns addresses or length to
some power-of-two. While Rust has `next_multiple_of` that provides the
same result, it also supports non-power-of-two values and is thus not as
efficient as the simple substract-and-mask operation that can be done
with a power of two.

Another missing operation is `last_set_bit` (`fls` in the C code), which
is again commonly used in the kernel but has no equivalent yet in Rust
core.

This patchset introduces these two features available:

- A `PowerOfTwo` newtype for unsigned integers with `align_down` and
  `align_up` operations optimized for the kernel. The newtype ensures
  that these operations cannot be used with a non-power-of-two, which
  would yield an incorrect result.
- A set of `last_set_bit` const functions for unsigned integers types.

The last patch makes use of these features in the Nova driver, as was
originally done in the patchset. It requires the v6 of the patch series
[2] to be applied.

[1] https://lore.kernel.org/rust-for-linux/DANP9ATT1T5W.1KP4992E26FTP@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com/

Changes since split from the nova-core series:

- Rename `fls` to `last_set_bit`,
- Generate per-type doctests,
- Add invariants section to `PowerOfTwo`.
- Do not use reference to `self` in `PowerOfTwo` methods since it
  implements `Copy`,
- Use #[derive] where possible instead of implementing traits manually,
- Remove `Deref` and `Borrow` implementations.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (3):
      rust: add `num` module with `PowerOfTwo` type
      rust: num: add the `last_set_bit` operation
      nova-core: use `num` module

 Documentation/gpu/nova/core/todo.rst      |  15 ---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   4 +-
 drivers/gpu/nova-core/fb.rs               |   6 +-
 drivers/gpu/nova-core/firmware/fwsec.rs   |   7 +-
 drivers/gpu/nova-core/vbios.rs            |   4 +-
 rust/kernel/lib.rs                        |   1 +
 rust/kernel/num.rs                        | 201 ++++++++++++++++++++++++++++++
 7 files changed, 211 insertions(+), 27 deletions(-)
---
base-commit: c7864f7ab73417e352d8d00e46d3e9e6a228c5ab
change-id: 20250620-num-9420281c02c7

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

