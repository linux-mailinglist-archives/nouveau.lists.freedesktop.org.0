Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8958CA2A68
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 08:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5A910E8C9;
	Thu,  4 Dec 2025 07:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rugTJaPc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ECF10E8C9
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 07:37:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ustSC2hVdvVpKsnycLp6DT8W01/f6qpv3xXxF3uSsGKAKbHN/aOv+0FROMTjZWqsjxWcFTusZ556hmjHUj/eyY5KdAm8BHwoDypnLyxx6MtU+P1QmUmql4ChHOv00Rp+BFs13mrNB+I0Mkq9yjGJezm/LWAqELygEm04phkXXm+gUI4a/4ajBXbdJhvv1nAGIn6ktke7/Kbf55xqM1EtRZnhjsDyz6MhhuSl08AHy/hZQrXFdd1tZQrZtAGwvPWyihVwBr+k4bfGSI1JykzliDgEiwzi1qPxEbKyOC8u7tThPXblEGBYXaFVbh+U0prEiW6CFAVSbPwG9DwGAzcYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIBwwXSOuuTG8k4JIrWeZFQ9YjDeHLqAAMdzKserQfA=;
 b=QE+m1G4ReFLOsmB96r7Lmb7PHMxcU3gViB8ICxLTxtng+rZZEMOcxUXinF2rO2nc74wZqipYvfPt55iSlshFFA+UIrUOVGY3crFdD44eaeMHMW7nGOnUudQZVHUMioSlx++v4+H55/EhJ1eHRYcxgLlV+f+xTn8V/T8pBqpm+Cai44QZrYJgPMoPCW+EdpbvaJEyDF+ZFRcKcI11Anl2i9SIdWAWj06fG0+yDul7PpkztpskvAff7Torkv67rdMVzA2PWBUdj2/s0BwTf5XLjrMyeFaKnVICSrtLwUqgskt8XMcLcnne4/TU1C8/gzrsep+kI+akfPh/c7HEGlC3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIBwwXSOuuTG8k4JIrWeZFQ9YjDeHLqAAMdzKserQfA=;
 b=rugTJaPcejQmg24uIPgM2M6tkYxpdXH7XrRq1lSmLD626Ds7ThTjlHpFukTNEmjBO/qkWILfA/0RwxzuSksL9DDyWCu71jnnf2c0qBbvfjgD1l5vWU+nF3v1vaV6SaF+i5s7zONcGxR+F4imlA03HmJcvfeQMFRJT2NhRfcaLp75PieFzDJ2jYjmTT5Ci+RPZkINRWU2X256fmKLcnGz0qjhdUrEZFTUSi5peIcOcsOcKLGA1VFGUJK0PaqIIrTusnFiBn4Y9nVdB/kCQJ4C4gLVGfVMOPbSGb6JlyO57v3N25xZQ/xktjnQjY4VWGSFicYHxCiCP1mvZ0yDIURxLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7229.namprd12.prod.outlook.com (2603:10b6:510:227::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 07:37:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 07:37:00 +0000
Message-ID: <b2710a3d-a1f5-449f-b0c7-be0f7c8b2be3@nvidia.com>
Date: Wed, 3 Dec 2025 23:36:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/31] gpu: nova-core: Hopper/Blackwell: add
 needs_large_reserved_mem()
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-19-jhubbard@nvidia.com>
 <0cc12131c0f48613811df893309904e940abf1a5.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <0cc12131c0f48613811df893309904e940abf1a5.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7229:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e208ae8-1195-4b95-278d-08de3307e96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWpVSGxJUHhrTWhpdWM2SUZGcWVLeVB6NC9TbkJ6a29qdExGMnlablpndERL?=
 =?utf-8?B?VVFhR3ppSU0ybTJEQUVmajBGVTRpZzFMWVpKU2lQcU4yaStBNkJPelovcmoy?=
 =?utf-8?B?V0VHb1ljM2dud0t5WG0zWi9sR0xuWGdIYXpoRjFCMXBueEF1cFk5cEVhMmo3?=
 =?utf-8?B?Y1UzVGlCVzliOFhOUnIzWEZVVGxUUkd2cm5SSTIrS3JCaWRnNXlLZVFLd21V?=
 =?utf-8?B?blRHSU5CLytWeG9vcnVqNytielZOQmptMGdhS2ZmT0lMOVkyTFlWYjI0ajlt?=
 =?utf-8?B?aEplcTlkNnM3cU55cFVZYWo3dGhSRE52MVZNRmQ4QlpRZ0RRRTA2TUlEM1lq?=
 =?utf-8?B?L3llQ3ZseUVTQXMvOTJ3TnFWOUVWc2FzTmxvNEgrU2VsWUFFVnlucjh0aUVJ?=
 =?utf-8?B?bzNTdzNNK0x4N09COFVjTEFwVWxpeWVWcFI1MXJ5dnhlMXFPWW9hdlY3Z0tD?=
 =?utf-8?B?Q0tUTER2Q0pGaGZ6NjhuYmJocnUyRGQ3RjNxZ25CandqN3RrWXd3T0dBM0Q5?=
 =?utf-8?B?WUtyZ1BmcEJqNXRUdlZGNytsS3kwK2t6c1FsSzRzWUN6akNCbnhWQnZuM0lQ?=
 =?utf-8?B?VUpwK3o2MjhtQlREV0dDd0MrRFJpV2lSaitCUW1pcmpsVXU1VHAyN2tsQ1Mr?=
 =?utf-8?B?V05ZM1E1ZEhETDV5UUJGS2ErQmtHcU5DelVCQS91SVh6VmxLTFlobDhuUTUw?=
 =?utf-8?B?NnIwK3VGaDJtVDNPbzF6ZzdsWC9QM1BPOTFOOHhCS0p5dzFXS0pXekdIRUZM?=
 =?utf-8?B?VFVNNGdwWDZKWDJpdzExZ3E0dzkxSEduUTQzT053KzU4YmFNWGVFUU9FaWNK?=
 =?utf-8?B?NUZ2SGk3SXgvdUU1VEFnN015UlZmZFo0VWlrSThHUkNMNE5wSms4Q3NVd3Zm?=
 =?utf-8?B?V2dSVFRXZVRCK0NUTkhHWEFFMHJRK2pOUWhaNkRIanZkOWx4TS9Pbk5DS0Rv?=
 =?utf-8?B?RjlJOExaekpzV0daRndmSFJvWmNyK3FETmJhcFNUSkRHTGJBRFJPaTIvWDll?=
 =?utf-8?B?K0pUdUUycEFyWXVCQnl2a3dnRGc0ZGEwejZOUzRIUU1NcHRFaUxVRFpaN1ZT?=
 =?utf-8?B?dktyT1RRQWFNcWNRNGVRaWFVL1h5ditpcEU5T3pRWEx0YXlzZEJieG5wTHFy?=
 =?utf-8?B?UVFpNlpad3UvZDN5S2tSUXJSZ0ovcGFUWmp1T0t6eFZuQXM4QkFlblAvR2JV?=
 =?utf-8?B?RkNmMnd6YUpuZXgwVyt5emVDcmZkdlRkUUFSZmNQRnlkSVF4U3lHNzVrUm5k?=
 =?utf-8?B?K2RhbW9YamNNdFlpMmYzSC9TaEs5UEViVGdTanRHME5pNXJKNVl6TmZpVG11?=
 =?utf-8?B?R0N6MVhJMTJWZUE3bUxoRVZaM3M1TytZSWlsN25ROXRzUzJKTklreldhd29r?=
 =?utf-8?B?MHJXZHNUVkhqYi9PWmZDT0hEYmh6MExaOG4yUTcyWkpsalliSUVWZUc0K2xl?=
 =?utf-8?B?K3R2UEs3RFFUZVp3R3FBa3BhbXkzUlRneVAwQW1GayswTTFsUXlwTll6ejB3?=
 =?utf-8?B?akRyMlV6VDA4N2dlVmt4eGFxYmVSRWVsdk1CQk5OVVpRbE9Tcmg1ZjNnMmNR?=
 =?utf-8?B?TzFkN2Q2TFFnNnc5NllIUzFRaXkxdTJnRVpZYnRGY0dwVGJTM0cya3l3MDYz?=
 =?utf-8?B?WG9KVGV0YldYM3hja0J2UlRjdjNKL1ZueXZDMGJiamZ2Qm1PWW14cE1yQWVI?=
 =?utf-8?B?RHFCUHVxZDRwOWU2R1YvMS9Tekg2N09tRWlpY3cvQ2V2VG5xUTBuR3ZYZXZm?=
 =?utf-8?B?NTNxSHQxY2o4OE9LdnNxZ3ZGbE9Pbk5WK3g0aVhFNEJKWE94Mmk3RkNZdGs4?=
 =?utf-8?B?c3grYm1QS0taQVlZS2pkZ1lFaHR6QjEyUkxSVk14SW9rWjJjTnNUUy9lcXRt?=
 =?utf-8?B?ZGR6Yk9mdW1PVkpVdkdxbEFzSE0wZ2hTY1lqQVdCMmxDVlF1bjVLR3pxVTVG?=
 =?utf-8?Q?ZENNgQBTrcIkN7zZvY5Z7IVLWh3jtyh4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alZrNXU5RjhqMWVyRGhTQzQwREVObFFDc0VOd3ZBUS9iS1BJcmprcTBTMnlH?=
 =?utf-8?B?WVVVTnpDb1A3Wkl2cS9hYks0Zit3K3pkRGVKa21wa0J5TGppcmcxK0pxVzhO?=
 =?utf-8?B?MGlKMml5VHpaSHhWUUNVNEk0bFpzbGdGRU5FZk9jZ0dLc0Y3cmJNOFptOGJn?=
 =?utf-8?B?Y2xoQTVJZ1JIdVM1N2w3RWtUeTlSNldnNE1XQjB3NGx0S0liZDNmU3JIeDBj?=
 =?utf-8?B?NU9OcVpoUlVxeTNjZ2k2bkNMWFJoSy9VeTRwOVFwS05TM1FXK05YcHJxYmha?=
 =?utf-8?B?ZmxVemFYNnY2TjNsVS9XaHA3U09rMVo0UkxzaFpuam94aDBXcllnVWczTXJZ?=
 =?utf-8?B?Rnl2TE1sWXBxcWtKckVPVkRZOVZTTm1wdjN4bGl2QXNWUWZsR2tJR091VHhP?=
 =?utf-8?B?SFhoVm52dFBiZkF6bHVGd2JURDJNTFBLandzVUhPbWQ4ZnZGL01tdGJQNWd0?=
 =?utf-8?B?Mms5MXZNalFWbEFtMFZET3Ava0dSdXV6TmVIYmkrb3JLK2FXaStlSGp5VFY0?=
 =?utf-8?B?bXJkcCtUOTBSeTc3UFZxV0VmZXF4MTJ4a0NSRjFvQVJqNHJBQW9ocEJBNU1s?=
 =?utf-8?B?akFGOFVHNzV6RFo1blFvdnZGTEdITG1halVWQWw5aDh0SlRWQndhTHNzckdo?=
 =?utf-8?B?ZnIvakhDYkc5RzlVNFYxNnFxVFRQVFp0RDVNTE1zbjErZjJmaTRUS216Vzla?=
 =?utf-8?B?Q3dHOXo2UjR1clZPUTB1aU5maHd2cXk2UFNuRFB0YzY0Mlk0dUhCV3BjYmJ2?=
 =?utf-8?B?VStycVo0Qm5XQmthcEFzT3YrMkVpbGZ6RERsdlJIa1R0dG1MbGxBQkhnNmpB?=
 =?utf-8?B?bng3bGNtMWdJYXk3Mm1xWDZTSzhCc2o1RTlkS2wyUnYwRDVBbXVkdHM3anZH?=
 =?utf-8?B?KzF3Z1hBK3k0YlZQczdpYXBBeW1oWDZTZ05BbUpqR3VsQWt4ZTZpTC9XbGZD?=
 =?utf-8?B?VENDQm0xd1QyTzVXVUxJemxlcXE0T1VjWUVTSUkvWVlDVkZzRW1ZM2lXTXZJ?=
 =?utf-8?B?SDBtWkQ3ZmtIT0dtQnBKVnJZMkpmbXdBZ0Zpd01yb3hWMHo5dGRGZUFCc0ho?=
 =?utf-8?B?Q3dIb28zQUNzTC95MllNK2ErTGpJVDEvVytncTlrajdNNUtLK0s3ajJVOTRI?=
 =?utf-8?B?aEtKbFFMWFpGcHJsK1F1NW5RUXNsVHl6YnpKOGJCY3JmQW0vS0wyU0FmMHhN?=
 =?utf-8?B?Zk84dThnMUd1ZlVjRnNtREQ4QmJJNnQrbFUrTWV4L0h6K2xySUVNVUtjSFN0?=
 =?utf-8?B?d1lQQU9Nd3lyV0NEenI0RkUzdCtKRy9aWnFvaEZDcnBodVdveWdYSkQxN0R0?=
 =?utf-8?B?c0xGM0U2Ri9BZ1RBbG9tVHM1WU5TSW55ZDBRM2RtL0tpanZEY0gwbVJrRTZP?=
 =?utf-8?B?MFNHVlRXRWwwMUpHcTdxRTlTSFRrVzZlTWMyTVRkc0M0RDlzK2ZTREpJS3hj?=
 =?utf-8?B?aUM5NTRKZnp4OU9DajE2NTQwWmhiOEpoMDJtR05CWEZpZFVHbFE0d2xVeGNo?=
 =?utf-8?B?eVVqaGFRdTEzMC91M3lBOTNVVGtQaXpHRTlSTWJvNGVEK1RYUHBKWVdxaGxE?=
 =?utf-8?B?SktEbVJ3R2ZrQ0hnNnJCUHJyck12LzhuejhhT2Q4TjFuNnVoT2s5UzArV1Fx?=
 =?utf-8?B?b0RMOVhuQXI1M3JwQ254ZE5VT0hrVVNpRm9qZ3ZCOUNWcFJac3Z6YWJXVFJi?=
 =?utf-8?B?LzNZdEJFbUJkSThpMlpDY2Z4WVVmeHRMdkRCeVZmUTMwMHRJeTlBbHExYUhP?=
 =?utf-8?B?WklMOTIrbmJ3TTFwQ2FBdHVxcFZLSm1tRzE3eXNCOTQ3M3EzcytWOW0reitW?=
 =?utf-8?B?RzVxeG9MdDZJWDMydEFOWklEeisxTEtQUmtadVlheWFtZkRnOWVnOW5meGNT?=
 =?utf-8?B?U3ZJOWllSHV2SXJzRGVmaDlsUVg2aTFhRmJoaWV5cnkxK2dOVHJleVJic3NQ?=
 =?utf-8?B?U2tDUU9xYW00b2xOZE43Q2I5bG5XalQrSjFQWTFKa3A3cERjNisrSHFhR24v?=
 =?utf-8?B?WDZSbzkvK1dUV0toU2l0WW1uQUJITCtoM3phb0RBYnVIU2R5Y0QvREgwY0dB?=
 =?utf-8?B?OXFzS3BKZzc1RFg3NXF5ZGQxNjBUNEFLWWZ2Nkh4d2ZvcEJNaVNoTmZGcFNO?=
 =?utf-8?B?eXNBUGxpMEhNSUZOdTFsTDRYWTh5cUJYa2dET3RBQWxFbE4ydHdHZ1d0NnJq?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e208ae8-1195-4b95-278d-08de3307e96c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:37:00.8859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qY7tBHo8hgtqdFzzpfsJ/9YADbkqcWCTKgUnKfd/XaFbZHmdPTDcv9AJ6R7k+Z83oVPLRsf8shQ+gNOMGaVdCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7229
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

On 12/3/25 12:51 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 21:59 -0800, John Hubbard wrote:
>> +
>> +    #[expect(dead_code)]
>> +    pub(crate) fn needs_large_reserved_mem(&self) -> bool {
>> +        matches!(self.arch(), Architecture::Hopper | Architecture::Blackwell)
>> +    }
> 
> Wouldn't it be cleaner to return the actual amount of memory needed, instead of just saying, "Hey, I
> need more, whatever more is"?
> 
>           let frts_offset = if !resume {
>               let mut frts_reserved_size = if chipset.needs_large_reserved_mem() {
> -                0x220000 // heap_size_non_wpr for Hopper/Blackwell+
> +                crate::fb::calc_non_wpr_heap_size(chipset)
>               } else {
>                   total_reserved_size
>               };
> 
> Maybe have calc_non_wpr_heap_size() be a HAL function?
> 

Good idea, it does look like a HAL function now that you mention it.
I'll do that.

thanks,
-- 
John Hubbard

