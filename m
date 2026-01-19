Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2ACD3A839
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 13:13:59 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7410E426;
	Mon, 19 Jan 2026 12:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="MJCroDkY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 610C344CA9;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768824316;
 b=j4Ks/+PXPwbG280xGqCsZugw3Nine+PwqcXSOeYFgyUIe8ZHbzLjNHqRc5x5EXKFkPTgj
 de3lz/Zj/4GO9gZ8i9Vh8TD5Zxx8jQSx1rTDU5Jcxf6XvCExW1b+/ES7/da4sqjFREJYPnt
 AmG6Ql1cIiGMToD3oDodk38GLktMjqoBNNiF9INf54FnZ6w8nQr/cppKJHN3eu9LLLRHOsi
 tJKlTsX9t+4FeL0hnuA5hAihNolhUf8sNEKTt9kx6RO0hulF7IgFT+UN4/Q31uo+34lngI2
 G62bbFsAFJ2lm9haeQsq9PST9RuQ2eN6TCPbpZkyirBikAyePRp347QqCS8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768824316; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vhd7dWWhmKOuCfLkA96amseoi10GDuRq9mdTAtHuCCE=;
 b=DAv7jLmTCiwLeX7jGEjcdPPztMWad7KXipTnaivPhTX8NH9HtzQfWniyOEu3yObPtmBBS
 zRuZQhIphgh0zVl+8CS5o1gGG2KQ+U2YY5F3/gCzTHIDTKGiHvlVhQHBM/bC3wo8SvtNB/3
 PY45PwKDd4ZaAXckHsk3qxDY8pfle6EGT8GGn6Yj9yQ6vz0BXA7LkiKh4JJwxtPyWcjPb7T
 a/f+gFmWQkpPKqvEglv6GVBH6oTn5rhjLkgVb6gs/8q+vu4k0cQ0ctY746DbkmnjVli1L4k
 BYIFbKgiFZFK9M0i+fL8VWQiD4fj6HnjBMStfhP3wl1L0NBt2lI9YNxuK9Uw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 44A3944BDC
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 12:05:13 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021090.outbound.protection.outlook.com [52.101.100.90])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 06DE310E423
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 12:13:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5Yrk8NfrRSsG9UEgwhN1D7/JowOJKCFK/DdhfTQrCx9+gaUogYBTJAYyQCWfRV2umPS68rgmfJ+hKlmmS3Ju4UsZeqyIM/t215YmfNevb9oDatjdFGi+SW50tU+nqn6M0G7eUHhOud0R3phlTK8ieKbhCAqO8omycy78baf85mtRqyDOViRXKCTb1NXwuD9UT1my9EueGqR1j4j6rI6sK/i33q+jMBTaRNSxiPcabcR/X6dKN0TPuz9KrZ6REG4Kx8yIS3S20jC6Wsv1oN9IGZr4qVbNWiQbsqa/8xjS6XAeBXULkXtlYFtfkuSASGNgrO0hoB2JqtXcDnVnt7GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhd7dWWhmKOuCfLkA96amseoi10GDuRq9mdTAtHuCCE=;
 b=b2wFgBSFx7E9Sx8QS1ufVkCmPDrvDgvnHcyWD3Nk+qeR7qhgkIFtlSjZugM9sLuyJi1gPCWz0/MRXsBF8EMBVf3Yk7Vs5HupZkGpP4TKWyh9ozl2FWEVrczhsHg38yQcVItEEYoY7BDUhQWlDhBxkUSaikx4BwysDF32Jam83DX1Bf9wtXkdZgTbLivwQ7zm6FI9nq5XmUny5jlwB8encZ0j8w+dY2pIrsLIWywJi9HCLzLhss2C06V3U2tLPZDrCtRxieccAmE/okPrHsYZKK139FKfRhe17MDpJUQBquly9zP2/rHJ5OAt7whNQXgj+peLf4dIs3pCuCkMoh9tCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhd7dWWhmKOuCfLkA96amseoi10GDuRq9mdTAtHuCCE=;
 b=MJCroDkYazmw2/e5Era1FQKnPmLPoHhHbHRyKzJMFETFNvAdxOc3+e/UMeHYbAkxRjDQVZcuVA0NiFZdGfLfnq0qDefsGgfhHMimXKtckhstJ6ce75zmzZ2sjF4GkBAqDxRUHS/0T0plBvXJ/13G9ZS/m+za/+166R8TJz1XZFo=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7729.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 12:13:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:13:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:13:48 +0000
Message-Id: <DFSK2KHCXTIB.3RR5Q81ADGKRR@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add
 UserSliceWriter::write_buffer() for raw pointer writes
X-Mailer: aerc 0.21.0
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com> <aWuNbUywGRH1zo-0@google.com>
 <aWubWE4kstGI42P9@google.com> <DFQXTQJSCXV5.2FSUVMTSF2OB3@kernel.org>
In-Reply-To: <DFQXTQJSCXV5.2FSUVMTSF2OB3@kernel.org>
X-ClientProxiedBy: LO2P265CA0427.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::31) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: eca70ec2-069a-4441-c69b-08de575433ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WHF3V3ZzOXVUbm5KUXJuZmpvMktFZnlveVdKcnJqZ0IrNHJUU2svUTdLNzNv?=
 =?utf-8?B?U3dXSmVRWmxHKzJqcGdyUG1iT2tGTThqbE1sazVXMGNnVW94QVZEb2RldGVH?=
 =?utf-8?B?c0dmeFFsU1dMc3k2dXdHN1FqbzI3YXlySVRBTHo4RTBsTFI5Yk5kdUdTRllE?=
 =?utf-8?B?eWNSZDg2TWNTemxNZXBDWU81SUVBcVFtdEVmQUtRR1kvOG5nM2xVVjFvMjV6?=
 =?utf-8?B?Vmx2dnBrTHJkY2dJMHUyMDJuS3g4Y3BpcWdVNDlyQ0tyNy9nK2I3TTNtNUoz?=
 =?utf-8?B?OElYWllySmtMK1ZEeE1wUjBVN0cwUGowQnRkYjUyOEJoYkZ0NkI4Szl4L1do?=
 =?utf-8?B?REM3NDlxRXlYbkpEVER6QWZYRUJxK3BtYjByNUI5VEtrRkRDdzJjeHRrc0tt?=
 =?utf-8?B?anovWUJmNE1XYUVLVnVZOUcxVEtXMkRHdUxvVzRWZmp2bGpaQlZ0M2dhMWNk?=
 =?utf-8?B?b0dKcWtDUnNjL2tKcUVGU1MvakdMRCtLdVgwYTRRRk1xTFluUmdKVmhOM3Ji?=
 =?utf-8?B?cVhUUjE4TXhoaVFmZGU2ZmhDRW9vSGFJZnJ2SUlaMTVsZTU2dVYwUkt5Si8r?=
 =?utf-8?B?MVFhZjZUV2tHNW03d05GN2JOK1ZyeGhKdDJPOEkvTG8xRytmc3JncGJVQk9I?=
 =?utf-8?B?bGhLaC9QWkdiOW4ybGMvL25RWGYzYzZDZVo5aWpYWVF1c0RhVDBmMDg3Sm91?=
 =?utf-8?B?RWxtemcxMFFmZnkxVlJGSDErMUMxYVAwSXd0c0d2dVdHb1F6b0plbXhNaHlI?=
 =?utf-8?B?NmdtV3JaWE5zZ3VSRXZUWUU3UTI4WnB1bFNISFVheDVUMnJSZ1h2a1ExcDFm?=
 =?utf-8?B?TGVQU1NFQVFHWWJCeWhUMGhlYjc4cFFHbGhDRGtSNE5NdkVkZzRGYkNTTDhn?=
 =?utf-8?B?ZXBUcGRSN0hMZ1BtTFJlSTJtY05ZU3ZmZUplT2VMMG5SM0xTOFlFbkI3QlpY?=
 =?utf-8?B?eWl1VEMxR2ovMmJrR2xUTmVMWjJJaEp0bmdZL0RVWDRmZzhQNk9PMGFDdkc3?=
 =?utf-8?B?TU1lM1pDT2d0eTZqdTgxM0drVUZSeEs5RVFkbENnZU13TVNWWk1IUVNQSUdP?=
 =?utf-8?B?bXYrcDdxdnJwWk1KTWlXL1JIblE2TWRiaVhlS3p0SXhUd2ZaTE4wcEJyc0xM?=
 =?utf-8?B?cWRNMUc3ZW4vSU9hQy8zTWZ6NllOdFAvd3lZU0ozQnp1SnkrcEhsVy9LNHVh?=
 =?utf-8?B?OTV6MW8rMms3L2FyaWcvdStRV1ZrdWRPS1lrM0QwL3lGd0JiWTI0ZVFCZlVh?=
 =?utf-8?B?SjdPYjVWV0FXdTVZZUtYeXFUdm1MTXAydi9tTUxzVkpwWHJFd0d6UThPZXhX?=
 =?utf-8?B?aGxjOXJ0ZUp0NEFMRGFJLzRxYUx6ck1IblBjeGRUallFbHhjNmVBUlFna1Ba?=
 =?utf-8?B?TTlGUVdmeTI3UlBQS05BSTV1cTIrSVlrRGYvaWp3cFJHaVZKb1N1NkxIaU84?=
 =?utf-8?B?eXN3VjM0RVpyeklRbmF2WlJ1eldRbysyR1pEa2pvVUhMUi9nKzhXTXM5OCtj?=
 =?utf-8?B?YnBBV0FFZlVseE1NWi9CalhFemp4dSsrTFN0MUFaeFdvem96a0dmcm9IbUdp?=
 =?utf-8?B?ZmtHcGEybThHQUNZZmt0cHFlS2owTVdFQmduTnVYL3NudVFraXg5eEJJUlhn?=
 =?utf-8?B?SW82RkVGMlU1elNIYjI5STM3QkRyNk5NY3BjR0hWeSt1Q0N4dzJzbUcxeW8x?=
 =?utf-8?B?UGdaYVF5cGw0YlhUbUpBTGNVc3l2TjdpZ3FNc0EwbjhMMWUxdXhvQjJRTEhW?=
 =?utf-8?B?YkhOVkZ0SC9zR0xvdHIycXV6V1VUTU9nMk0rcFVNS0dTaklZM3dpQ3lMazVy?=
 =?utf-8?B?ait1TEdKbFlIdGtVSnN6V09Ec0FEWU8xU0lmd3RpOFpPeURGeDRSdytSZ2x2?=
 =?utf-8?B?LzVxaGRKSnZFNTdXeG9LUDhiUlhxdVUwOUlVRlowcWQ1REJad0JoV2ZTS25z?=
 =?utf-8?B?R3RpUWZDd3Evb3FHbndpSU5iN1BUSXFFSEJGSjA2Yk00eTdEcFdaNU9Oc3Ft?=
 =?utf-8?B?SVZsbEgxNkU5TW9mNDM3S2xCSVJKMXpyQXcxME1jZS9oanhJNGhhNVlwYS9J?=
 =?utf-8?B?aE9xVlZxZVJMSEpPVXo1bVAyNDhoQVdPYnhYeUxkNURCWk9xMW9PNE5hRjV5?=
 =?utf-8?Q?NRV0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eHVMS0ljVjYwNmUwQkpua0tLV09OYVRRTUZpY3dySExGN2t0NVpReWF0QWF3?=
 =?utf-8?B?aDQxWFhWdnlGR3UvWlVqdHZydGtmWkZhYWloUVVtanU5NG5CTFBsU054OFBF?=
 =?utf-8?B?dVYzdG5lWkZic280L1QrdXcrZVpiWm1sTnJNZTNrU0pVRzgrN2NiWHJYOWQ2?=
 =?utf-8?B?aHZmVW9pMEU1RUh6NXNsZ2NEdU1CVWY5VHk4eU5TS2YyWTEyT2QvQVdYYlZ6?=
 =?utf-8?B?T3EveC95Vko5SlBrcmNka0E1Y2tUWEdJNUl5ZThVRGZha3ppbkZyOTY1VVoz?=
 =?utf-8?B?Mm42V1N3RE1UYnppbjNOaE1VZVd2UDJ4S040Nys4aXJ4TWcvWUIwWW1Ed004?=
 =?utf-8?B?NEtkNXFRaHZmNFI0dFJiMkxpc1B1S0RBbm9QY1hHV3d0d1dKZG9CNXh2V1FY?=
 =?utf-8?B?K0pRMlgzcFBsSmRJb2xNaXRHYXh1VCtkTFZnRzlsRWNZeDZvN1ZEWmxaK2dr?=
 =?utf-8?B?Vmc5aUF2MGFPcFJQcmo4MU0yS3RPOU9sQ1dWR2dzMVRCem81K2VxVnVabTdH?=
 =?utf-8?B?c2pMMlV4aTk0dzBzUExDVVVicVhNckZoaHFkdUtvTGNGNEdaN25kaFdJenh6?=
 =?utf-8?B?TmltRVZBTjh4QWZkbmlwYUxOdml4MGJzSUpMd2daY3Fkanh0QzhQdE84aGVu?=
 =?utf-8?B?Q3djdFRZT1ZkZ3FOSm55SmJuOXBCay9HWTVRekdXbVpaR2hqaElVR1pJYVNa?=
 =?utf-8?B?d05MYk5NZHZJTW8rWXJZQjk1WkdWZUVMS1JlN0pFNlUyenhvaUlpTTdCQXFW?=
 =?utf-8?B?VVAxWm1wOVo5Mk1PazUvSFhYbGJ1TTkwbkVaaHgyMGxUekwxcnZEZlZiRU5N?=
 =?utf-8?B?cy9MRTBncUxMVFpMczdtSDZyVmxaVGFIUTh1Z1dxeTAzRkNMNlBVN2J3Nlk2?=
 =?utf-8?B?MFFmMzJtL1VKcGhnRG5kZDZFRnlyQmRDWDltL1VqZkZnL2FxRGhKYm9nTXZQ?=
 =?utf-8?B?c0RvakFjWmZQckFPaXlvYUZJbklLV2VTdnBHRzErVWx1YUFsSzhxNmhFT0NC?=
 =?utf-8?B?YThaS1RTalQ3cjIrbmtGb1lLUW96NGFRa0xZQ0hDeWlDZ1BRSVIvelR5NGxp?=
 =?utf-8?B?MWg5eW9VdlRIZEtaZ3BlZExxQzk2REx6S1FEK0xUL2pnU3AvNUtadlc1elNr?=
 =?utf-8?B?S3BOVUZjQ3kzVllqSWxKVStvM2lGZVdTVzk2QlcxK2RKODR1TndlajVaSHF4?=
 =?utf-8?B?bEtkQWRVWXAwUHNCbXdaakdkdzA1M1h5V0I2MTNuR3VkdkFNS0lsNEVzSEFD?=
 =?utf-8?B?cE9VTGtpSlVEd3J2SGtGSThLVmtwTkpmajdQZmV0Vmo3QS9aNmFxZjk1NzdB?=
 =?utf-8?B?RHlmck9PSDJOVm93aDExT2gvcHBUTHpxWVY1eFZYT0wySnNGWldCdHBXVk9t?=
 =?utf-8?B?bUVBM1JmR1Q1T2tQWEl2dS9pWG1mQ3JZaGNnOFVsYlJoQmdCYXpPcGYwZXIv?=
 =?utf-8?B?WUdiYUtMTCtINmJiUSt0ajRWalIwaXFlMVc2c1dIR1E5UUtTdFZCeDl2d0Mw?=
 =?utf-8?B?MGhmVWFWaUdBcGNyUHRNd29KdkJIckk5bjBZbmNKUmF6NE1sQ1k4ZmNOU1I3?=
 =?utf-8?B?d25hZGdMYjFiUUUvc0NzZ1M1K0YvYnRHYkJka0NFQU56K0dWc0hOQnViODRq?=
 =?utf-8?B?S2s3cG5FTU91WTlrNC8vTjJEUUZhc3ZYb04wdU5FSGVMNEhlZk93Q1R2L1g5?=
 =?utf-8?B?RGxueEltY1RmVDl2VWxSWmpmbm9kTDlOdXdlNmdBMzRkRGNDeXNJVEllRkVo?=
 =?utf-8?B?K2hRN0Yyb0VTRVo2c1pEbE02N1NkaXlBY2xqOThhd3ZudzhUcmJlTnp6VzdL?=
 =?utf-8?B?cUsxWUVuaC9RdlNQWHR0enRkalJlV09MSStFaWFZWjN6UUpaZ1NPMWRCTk54?=
 =?utf-8?B?L3VheStpNGVMTWJNS3RxVWRmUFpkYkRZZjJEdGxxMDRxOGt4Y0pPRjA1eWlt?=
 =?utf-8?B?TjJKdVpsbUhLMEdnTVVsRlBVMXpvakxMSTZETXk5SnY2dGhNS25WM0tuUTl4?=
 =?utf-8?B?Vy9GZm05NTA0L2N4YytJR01KQzJoaEVtdG00T05OSytZTDQwUjJJUFNBVjB2?=
 =?utf-8?B?bVh5cGtlV1U4Q045OGxPc2VZbDlrMld4dGlZMXFSc3FvTWg2OHFrdDFtbG5R?=
 =?utf-8?B?NjlNSmVKcXRGdmQ2TVVydTNTMlo1b0Q1K1Jud0tGSWVsT0kwZGRidHhUUldp?=
 =?utf-8?B?ZjJuSE54MnJ5TFpHRzNiRFJ4VDRzQTlkN3VhUUk4Y2ZpbDFUcEw1b3BQaWt6?=
 =?utf-8?B?aHVMZFBlSnBKdFMwcy9hSFZHN1FBZU9BbDI1QWVIMklCMDVvdmptV0lQWEJI?=
 =?utf-8?B?NnlkVzZxcjFzWTVtbDhWbzlXdmVFUmZOdzRRdEllU1NaU2RDclV6Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eca70ec2-069a-4441-c69b-08de575433ed
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:13:49.4093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a3vBEfZfaPklQAXGzOgfQvbXryftbThn/BqUqEyai1gPCF0tpegk6CV5WG0WMe3vM1ZTPdk4ngXZRHN0Kzjhig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7729
Message-ID-Hash: AIGFO6ARL2FOYPFHATXNVU5OA4MFVDJN
X-Message-ID-Hash: AIGFO6ARL2FOYPFHATXNVU5OA4MFVDJN
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Matthew Maurer <mmaurer@google.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AIGFO6ARL2FOYPFHATXNVU5OA4MFVDJN/>
Archived-At: 
 <https://lore.freedesktop.org/DFSK2KHCXTIB.3RR5Q81ADGKRR@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 17, 2026 at 2:35 PM GMT, Danilo Krummrich wrote:
> On Sat Jan 17, 2026 at 3:23 PM CET, Alice Ryhl wrote:
>> On Sat, Jan 17, 2026 at 01:23:57PM +0000, Alice Ryhl wrote:
>>> On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
>>> > +    pub unsafe fn write_buffer(
>>> > +        &mut self,
>>> > +        data: *const u8,
>>> > +        len: usize,
>>> > +        offset: usize,
>>> > +        count: usize,
>>> > +    ) -> Result {
>>>=20
>>> Why not this signature?
>>>=20
>>> 	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;
>>>=20
>>> You can implement `write_slice` in terms of it.
>>
>> To clarify, I think this would be a simpler signature for
>> `write_buffer()`. And `write_raw_slice()` can be used both for DMA and
>> to simplify the existing `write_slice`.
>
> I.e. you can use it also to create a safe helper for DMA:
>
> 	fn write_dma(
> 	    &mut self,
> 	    data: &dma::CoherentAllocation<u8>,
> 	    offset: usize,
> 	    count: usize
> 	) -> Result;

Would it make sense to expose a `&CoherentAllocation<u8>` -> `&[Atomic<u8>]=
`
conversion method and have a `write_slice(&mut self, data: &[Atomic<[u8]>)`=
 for
`UserSliceWriter`?

Best,
Gary
