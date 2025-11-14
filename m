Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94EBC5DCF4
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 16:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D4310EAAD;
	Fri, 14 Nov 2025 15:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AQWr/82g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A05E10EAAD;
 Fri, 14 Nov 2025 15:18:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap92P0i3dcihOGyszxDX6QOoQ4LBvFQ+dXG1HINjomRkJT/KTeXg2EyieFelLPVxKlmmEVsPv5L4iYktqryAYDtnzdpyWTbp9v3MQ3PeRahLccygDYjUMBFsqbnV0iGY3PMXHC/Zjuo/mq+wc99+Gph7y+i6y07IeXvXI8co/WaPIUElgs/y8YhGv3KtumUjn2n9AQsaJ8KjwhGD+z7lIXqgI5L0NQmfc8EmGcbAvKIUWQfpPZt67bwj11NMogpGLzZI+hiHud6nZaKkV6izhYqG5bgN9+NvivHkPHvSn/AeE7jq2fQqrnIitCfoAvk5ueKgyoCFNc5ItjZ8h7yEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J86w1bNMJp2p73tJj1mw1GEpa/fhx2eeU2pU8dxOBzg=;
 b=rPPGsIw4v77JofzlePhC97i+crAkYgodAaWLOzy7WN0U7l/8lyQWgw493qDILdq7cfvVhX+jezJGNwgEm3pVw3g+0BX0iG6kxCXbEhK40x/HBBtmuNAEY6oC1J9dHkzPbkEqOZg1JpwUREyd3mdB0V8uj9ybBalxy2zULqwgz5KylNiu3My2N8lm912pwdOPNGotiO1o801Bz+7G2DQjs4JJKWb2hgV4+7WPf96FSL78ajvIWXClOmEyzGnFhpzTaTtUTDwly3mV08PUarN97h7owMsmMq4o5viqq7K02nBb1X4huGSKalCWaTHmyTRRShKjrqEgOsI/8p0AUNec5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J86w1bNMJp2p73tJj1mw1GEpa/fhx2eeU2pU8dxOBzg=;
 b=AQWr/82gV3ctlOKq9pXFdn2LZvnevw3Oq4/WOouI1ElfkwC56xZUF4Q3fh/oNvdvujE9pBDFs1qhAtlzgW1OwfSRBZK10zM8WJHPvvwOcpQ2y7KUXnfAyiEooeKSMdZ+JXYH8SCoSKf+X3eszJk/BQifF4PzAT8UKUEKk2HMxcGyzFlaYl8ZyllUsNtOK0P3yB7VQrA2gWbJjFsQlhhAsJmHiBZjmw9NJGjOxKBCs4Rz0FhIe8Hton/vBZWowQS2hYITie/RFTYCKHYy1ppybSwIIzln05ZgR/ycAua1cNc7chqfCVVVGyCtOCT9pYmh/qn8YhvYWFZHTYb9Eiyo8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Fri, 14 Nov
 2025 15:18:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:18:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 00:18:28 +0900
Message-Id: <DE8IO05D3GPF.2LD7NH48KAHIZ@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/6] gpu: nova-core: implement Display for Spec
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114024109.465136-1-jhubbard@nvidia.com>
 <20251114024109.465136-2-jhubbard@nvidia.com>
In-Reply-To: <20251114024109.465136-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 69af92bc-d34c-4e9c-1841-08de2391125d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjNvTkdiQUNCT2dYQVFpdUVCOWRaUDZnU1l2K3FUMm0rUURMTlVQRjFXbjh4?=
 =?utf-8?B?YjZYVWdvendaajVtQzNzT2d0cEVDNkZzSUJjNWcxZnZGbDRGRmwxc0NGd1BT?=
 =?utf-8?B?UHpBMXRyYjEzUWNKY2E1L2tkWjU0ZGd1Ums2eGhTVEpvVkZlekpsYlBWWHRs?=
 =?utf-8?B?Qjh5NlozVG9HclByamE2R3Y0eWwvUzlVMjc1TFpIbU0rOWdOdHBqU2tWZi9K?=
 =?utf-8?B?dEhRaUljWldjQ21pL0N0WUtBYlVsckhoSFBiVjcxY0xyZ0JPTjl3SlhoSXZP?=
 =?utf-8?B?TGNXODUwU0F0d1pkcXJhQUp5MCtON09NcDZNakxQOStFQ1Y2OTdFQlkxbGJV?=
 =?utf-8?B?ZWh0ZGVZOXlyQy9mU2ttUnNCNFRRZWluK01ubXJIU0txeERDTXlicDRuQk1P?=
 =?utf-8?B?SGtoaG9JZldIVG9OVWl2R01PRXo0TEQ0RHBlUXFYU256NUJtR0xhcmdOdWZk?=
 =?utf-8?B?L0E0RkZZZzFkS2w0U1dYbVo3Vm1KWGxUcW42MURZMktCNW91emEzWk1OYUdE?=
 =?utf-8?B?RlhCVUo1VmNrVHVzTGRURXRNUTMrZFI3Qkx6WW1WeFlzZ2dvQzZYQkVxWWZU?=
 =?utf-8?B?b2dLcFdNTWIyWlFoSDhISnkzWGtCVklUVVZNWTA2dlZDWGdaVlRhdzJUdk52?=
 =?utf-8?B?UHZsQVBIVk40WmlMQ1o0N1hEbkFjdzhUN0wrSTllc1JmeTNQSUEwSWdQU1ZQ?=
 =?utf-8?B?RVZlYVNGTTRIY2ExL2dRVUw2clBBcE5FZ2VQQ05YY25QU0lHMWFaZGZyMTkr?=
 =?utf-8?B?dklhTnBYOFNFOVI4bTd1TWU2ZW01azdrZTBTTEc1RlVZS2Y0ZjdRUmtKQUdO?=
 =?utf-8?B?aGE3OEduVDBpUkR1Y2I4NTZ4TFFFZEY5RkZoZEsvelFpWFU5V29kbmRqbTA0?=
 =?utf-8?B?S244bWpCTXV0ZnVjTndnR2gxd3ppRlNXZDY3d3VqUG1qQ2pXZHpodjd3OVVX?=
 =?utf-8?B?cFhkaTFxTTAxc1dmVE9KcXVqc29iZnhBay9MOWlJdUlsMVlTMFBNZHEraWM2?=
 =?utf-8?B?Mkp3OHJkeEx4cE9mTDdqZnNEdUlMc2dFWUtIMzYvMEN4WEZ6UXh0MlNZTXY0?=
 =?utf-8?B?aGpUenlGNTc3ZTFtL05HL21lR3NGSGNIdmZCNjl3YmZ1dkVFZTN5MEZTbnB1?=
 =?utf-8?B?UXp4eXY2ZFUyVlhod2g1aXhBamtDS1BQQkR0YkpvQy9QODZiQVk3amIxK1B1?=
 =?utf-8?B?WDVLSkdPcmgwVlRNS3dsRzZxOTVnWnZIdERYeE4rUU5PeWpNb0JkTk5SeU1H?=
 =?utf-8?B?KzFGclpIR0RIUUlPSzcyektHL2x1K0VMcElxY2tISmo0M1dHeVUweFdSOGxH?=
 =?utf-8?B?Uit2MW9CeGxKaDVJUDFlM29naFdNTFJLKy81bzFQUWkzeFo1Z2hMeTlGenBi?=
 =?utf-8?B?RnFsNkhiMlc5b25zK2h2WVJmQ3hDTGdVcFprczVqYXdjbGZsclI5cVRzcTZr?=
 =?utf-8?B?bVRxWGc3TnFqUzRZM0VhMWQ0NU1iK3NoMEFYNkdXb3VQMU1JQ3VwdnBxWFRx?=
 =?utf-8?B?aldsZ2kxbzN4dFBLSmJ6OGhEd1VKMGlOTjVMSDBjc1dDS1RuKytCTzJIK2tX?=
 =?utf-8?B?RjBGcDM5bGwwSkJ5QzEzcEhEcjJOUUhLeWhvMU9xaWhyUFppdnh6MlEyTXU4?=
 =?utf-8?B?SlY5QTBnMWY0UU11VzJPbDVlSlFLMnZ4cVZ3RkYyWU4vRFhKa25xeTQ0eEVO?=
 =?utf-8?B?cEJrY01vY28vWjd3VDVEZGlxeEVucThKdUpDNE9LSDRoNlJmVGJkbS9RbWxN?=
 =?utf-8?B?Y1Fta0J2REx2TVVsa0VheWJaZlBzb0Zoc1Q5YkZDenJTWWVZQWdxdnZsbm9P?=
 =?utf-8?B?NkppZGtXMmUyN1pLTEtsTUlCTlp5cWt1QVBkdk5vODdjQ002cHdpaG9DS1Vj?=
 =?utf-8?B?SGVSb1VrV0dpR1hEZmdpNjBaZ05MV0lrSjEyZ1JjRjZZVjJTSWZYZFRKMTR3?=
 =?utf-8?Q?Z6JrapXklIF03FaVp6solwytjcUOlQDI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBYbTlYZnNGbmtndG5LWk5nMUhFQ2V1ajRIeThQU2N6QjVvTVIwdkRVa0t0?=
 =?utf-8?B?bThlYVZOQ3lCSnBKeWhlRjdFQ21vMXhUV2YrN2ZaVnltZmFBeDRVc0JUVk0z?=
 =?utf-8?B?MFlxNjdpb0JKdksvWXF5RVlvSGc1aG9CbHlwd1RPY3E5VE43ZlBkV1lLaDNU?=
 =?utf-8?B?WDVMY3ZNbk5QZzA5U2U3KzBRd0VQT21BZE5WdElRdjVDamZ6dEFERDRrTTBH?=
 =?utf-8?B?OUM0aWJMS1BOQ1VXajNLTnZsbTdzODVoM3lzZm9DOU1uUk5xbkFHOWE3NHpt?=
 =?utf-8?B?dDRRbG9wNE03eEZLOWw4UUdKaVM4N3BndHVHSTkwYnBiTE5YV1FlR3BQYU90?=
 =?utf-8?B?STVQaDVDa1M1bjhtTlVnbGtwUTkvNTZ1bWFZb3hUVjNlTWMydEt2bEM5N29N?=
 =?utf-8?B?dGQ0dUhRQjVLem5zdFhXUGw0aWllSVVtcWgyM1ZPdS9uWElVZy9ycEtBTU1n?=
 =?utf-8?B?M0VLWjJ0L3VRZllBTzZ0b2RyalVQQkhpOFN1bTVpU29yYXZiOXJmWTJiOEJn?=
 =?utf-8?B?cTlaOEZwZHdvbW04aGtUWFN2aDM2QTFBdW1STW1GaWcvUmxFRjdDQmt0QVBF?=
 =?utf-8?B?b3FWZThrTFRnQlh3MFM3VzBXdTYvdW4wVHMzMVJGdndkc29ocVRQbExJdUlh?=
 =?utf-8?B?RVNPa0hzMUpVQU0wRUtSRHpwUW1GSHd0WUxtTER0bkdHM3JIb29hemR3Ti9w?=
 =?utf-8?B?SkFDZHlVUXRsUHVrWXJSeGMzSWxQaXp3S0hIeVhEUW5YMWV6aEJRNERmMXBv?=
 =?utf-8?B?eWZMUU1IV0wyMlpPUnNMZmZUVXZjdmlLbDI0N2RCbFpjdTJFUytLbWtmTzM4?=
 =?utf-8?B?ZEg1UytPMjRwdCt4RjdyQkZUM1VHU21TeTM5SGsxZGdlY0dwNnNYZk5CTk9x?=
 =?utf-8?B?Ym9aZGZucUsrNGZpa2Rjamt6eXJ1ZmxCM0Z5WDFQaktQbndaOStrSXk4UnBU?=
 =?utf-8?B?aTFDU3FUVG1wVm8vWVVOYVhxeW02Z21aUXhxWWxIQzU1Q0lkcXErSXVYRnlz?=
 =?utf-8?B?alRHSGRUdE5kYzBxQ0krRnFVZVJkZ25HcFQxRDE1cmZnQ0lTdmFWekR0TXFn?=
 =?utf-8?B?NWkvaWdLT1pTdVcwUFNTVU95azhJSkpNeTJrclFMK0dWR2poUFpreFNDQWJV?=
 =?utf-8?B?VlYzVm1ta2hBL0RsOThvcEFLUzNSMHVkUFhZOXVZNnJCQ1oyZlRoNktySnJa?=
 =?utf-8?B?VkJKZFcrQTlyS2trWmpKKzRYZVN0UmpGQXNlYVVTdG5xMG9FWU1oV1BWL1RZ?=
 =?utf-8?B?NWIzRXpIanZCRHA1WXFobGN2TEdXRE5LRXp2ajZJUjFJT21JcUE2TEFFVXdB?=
 =?utf-8?B?OXBBYmQzajlvMSs4TktwVXhFUzd1VTRWbURrWDh1a1g5NDhDdHJoZER6S2VG?=
 =?utf-8?B?bHhaSUxwSnlNdHAydVd3VEZqd2NhYUJSb2htTnlicVc2VUVFdVZEV2szNS83?=
 =?utf-8?B?U1ZtTnBPbXNuTHZoeGw0Tldwemt4VURYK1FtTFhSWE9YMjFhL0hxYkZqYXJ1?=
 =?utf-8?B?V2xkN20wTTdqaWJXTjVWOWJRbDAwak5Lblk3QS9LeWF0NmJheXFQWEdFZG5L?=
 =?utf-8?B?QjdkakEwV3IvL0dUenRQc1NSYlhnN3cyTWtYYTlta2c1dlZTN0FuTGhUcmZL?=
 =?utf-8?B?OExNdjA0ejhvYUxiaU9rODZuNWZIWmppdEdxWkJTMTFCWmVFOEpoUDBSNW1C?=
 =?utf-8?B?bzR2cjk2cnRpbGEwSXN4ME1VUjBZM1VvQkhxTzk5Z2dUcWY3KzJsejkxQVVo?=
 =?utf-8?B?andUbFRxSlBTd0kvVm9iajRCeGxlR2FkcDJSZFRtaGZycFNqUVZzRTVkKzlk?=
 =?utf-8?B?Nzlib0hNNHl3dVVlWUdMd0puM21mVmQ4SUNuYnQ0M2lxb3ZXWCtxdFh6RE5z?=
 =?utf-8?B?Q21LeUxmdlBtaWFlU3ZCWGZLL2V1cG5MTUZmYUJ6Snd6T3BDd04waEpaOXBT?=
 =?utf-8?B?dFZ6T250QnJ6dERjT0prZmdZSmRTQklMN3VBeXZuS0hPeEhra0d6ZW9NMThF?=
 =?utf-8?B?WStGQ2l0dWxtZWtYbkowRUE2Rjh6QUV1a0kyQjFuUmJJc0dCYW16L0FwSzVt?=
 =?utf-8?B?RzNTSVlwMVB2c2ZVcWhXWlJ3cXBXT3ZMTDQ2b1ppQU1ZTTk0T2VkTTZrV0pp?=
 =?utf-8?B?TUlBbjlYR2ozcDBJN0xWTHB3Mkl2b05DWTZXeXZDYmNzMUIvNXJJK0s0NjVv?=
 =?utf-8?Q?k6KJXgmrpvcEjA3t2zgNNYDyxxAHBRrHktuzAiJJ+n3l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69af92bc-d34c-4e9c-1841-08de2391125d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:18:32.1455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilJVaiHjThopphWKm1gQI5Y6T9+kJZ82XO6f2HlwUFFjslS1TB6Ec81bIlop/R2wc/IftOWuVrPnWAriaAiXfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379
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

On Fri Nov 14, 2025 at 11:41 AM JST, John Hubbard wrote:
> Implement Display for Spec. This simplifies the dev_info!() code for
> printing banners such as:
>
>     NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Pushed this one to drm-rust-next, thanks!

