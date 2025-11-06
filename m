Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0496C396ED
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 08:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D177F10E827;
	Thu,  6 Nov 2025 07:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LwKvwZB5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E76D10E827;
 Thu,  6 Nov 2025 07:45:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+VUAxdwgPRvHewn0zs2r4wA8peVWE+QJpkaWmyOGmxeCVBz7dO1bw33/pAC69YZ1wFK1o6zB9UvPmw4TTghANiNQMPXdiBvxsRdWNWbT/l9dOB2j+AnG/836v1ouvkKkRjxh8NayJZXu3QpND8YfZFPtPzgDmiFL/V2G0Io2cfOHblfHvKTbC8GbMFJvEL35zadGKJuXLaOmTQnChDLTa2vHBPJzAsxafMojolkx2eyALY0/8EGb2d9h1+1p3P5bwetKGyPZp4ESwoHGoap+hVOfhTxzIoftPG+El4YojLGlaYROLSsBvCvDQc7qmCyBawmz6FzuOBF9fNoYaFLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74BT5uPkZXwyJsjuuMeqicBwO58plPtAyriFSCUrdJY=;
 b=TE/7Ma7L628qTIphi2uMWl7Lu+Hq/XEo9J28GuZwY5Ws11e1gLitTRryE9lqzw78H7JOm/a3FQF//tXEv1dEPj/dU76eGsIm3UQE1k5cNfFx4bFT0p8mrYFC35uKnnsHaWg5yigmSnWvXPYS7wb5+iQOcuAfXRHzK7Ao2eEumEc5EG99AC+E+vqWCNwnPU4F0W+hsCx4R8m2+L/CiCZ89VI738Q1XFM9qxNVoXmq/f7q7we6FUp8Dp0ti7lFCriTm6Bd7AAETozvYnLWRvLDblp28WgtHR6y/XiWvqcGA016ER8Xr4YGCF2bFEv6+Dv4OXrfJFePFlvMz7KWQ7ukbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74BT5uPkZXwyJsjuuMeqicBwO58plPtAyriFSCUrdJY=;
 b=LwKvwZB58H6odqJ7JEHbstcGept00sBxVf8eP0y8K22XLSl98IcwZr1jOR+LvWfa7VP8MRMcPZa0Reve9ut3Nqr5S7Y6rfWeFsZMwUeli5iAYuAuBgp+n4ddQjAFXrT+4X8ELMVA5dlrVF3ChQmkW6s9g/XOr41NmnyFfl1RVKwBGnaIfOGHjzsdpZCYAbDQ+njoIbEr7beDstjmdugsvIoHo1X7oprePAwHB5mqhRG2rAdbnrzAKUTCHjVAtCd9Z50CySrf8FKBL2wcqZhNhEtmzYK4TJYmNrB2VKBWda3YJ0E6Wwg4/5F2F4MVYpeOFzaIf+/+lGEIZyhupsTpKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9261.namprd12.prod.outlook.com (2603:10b6:408:1ed::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 07:45:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 07:45:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Nov 2025 16:45:25 +0900
Message-Id: <DE1G0R9W3JS9.INLIKG0AXGES@nvidia.com>
Subject: Re: [PATCH v5 1/3] gpu: nova-core: prepare Spec and Revision types
 for boot0/boot42
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251106012754.139713-1-jhubbard@nvidia.com>
 <20251106012754.139713-2-jhubbard@nvidia.com>
In-Reply-To: <20251106012754.139713-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea5cbb2-3f5d-4c9b-42fc-08de1d087445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djNUVG5VUmQxSzg3SWcrYWt4ZVpicXhCQU8vL2UxUzV6WkdNcW5HckJUeGVZ?=
 =?utf-8?B?U25JemVpUDk5TUtmUlM2M3M3VDJSU2IvVmR1V25FRHNscXF3bHJSb3B3aGVP?=
 =?utf-8?B?b3pEdExld3VNR24yNmlFdEZUa0xPcjdpU0dmRW95NHJXL3MvS01wOGs3cVFC?=
 =?utf-8?B?Q2ZKMzVtdWc0ZE9PY0FXbVA0UVR5ZU4rRjRzL3hVTGxDK2htUnc3S200VDNR?=
 =?utf-8?B?TzBZWGlmbEFWL0JEcjM2ZEtiYlU1MnBTeUtxcGQyRm5LTGpDSXF5eENEWXhx?=
 =?utf-8?B?ak1HNzF3eXNkTXFLKzg1OTJxVnJqbk4waGUrWjN5TXJPWThXSVdTdkRGOGdC?=
 =?utf-8?B?Y1ZGOUtxa3p5WEF5K3pPOXJ1cFJMOVFaT3owUUhRQTY1cGdndkVrNS9XVGE3?=
 =?utf-8?B?SHN6VEROSEQ5czdhT2JmOHFzcVh5N0FXaFp3K0RmUjYyaW9KcXJvUTFVZ1I0?=
 =?utf-8?B?WUVpdnJza1RhN3R4cmR6MXB6T21hMUo2SzIxWTZQdHl3elVCNjNYOXNpZ25l?=
 =?utf-8?B?SnpMdCtydm1tZm5zWU1VQWhyNHYrZjlZSFFYNE5ONXNra29rTVdscHhVQTVt?=
 =?utf-8?B?bUM3b2NyeFRKdWxHd3JCdy9NZ0ZzU0t5bnV5OVRVTHlFWmduN2EzL3NBRldL?=
 =?utf-8?B?YmxlS2RSVUg0UjdnUHZQMWt2YnNkaldSK0E0NTREa2xmYVhnZFd5clhRL01Z?=
 =?utf-8?B?VzRzc1NyejRqQ3RzQjBCVUVzbHpYKzdXUlpRa29zZFRXRlJzTm1VbWJ6d1h1?=
 =?utf-8?B?a1BvVWJIUmlZSTgzeWRDb1VydXo3QzZQVUtoVE9wREFwZ0xUc01XLzJzajJ3?=
 =?utf-8?B?c25ORDl0ZS8vOG1ERHRSWG5FQjNQSW9XT1dYaEZNazF3S0RTZXlKdWlLN1ZC?=
 =?utf-8?B?UVFITHg4aFQ4MUh6cUE0em5pUU5nNkx4eW1kZ3RXTld0aVN6UURPcU9wc1Qz?=
 =?utf-8?B?ZVVrMm0vUTRFZWN0enZ2NStCYkhjUjBMY3JpMnRsbG80Yk5nKy92STlYcVpH?=
 =?utf-8?B?Rmp5dG5pVlV2V2VxZnRjQWxUdjJSbTRxbGpCaVo1TlpJUDBHdTh3Sm5nOEhh?=
 =?utf-8?B?QktTN3JuUS9yNmozQ3BkT0NGSkx0ekRMbjR3V21SbzhnRVlqQU80MXpua1Zi?=
 =?utf-8?B?bk4xMjh3OEVXRVRBWmhmcU5tUHoycUFzNXBUQVJEejR4ZGVkVWhZNXdwV2dy?=
 =?utf-8?B?SFYvL3JDNGg3T2w4NzljVWthRXhtT0ZRYVRlbUlzNTE4SGkyRnBVUGNrcGFF?=
 =?utf-8?B?TEdwZUJwcTlTTGxLV2UvSnluYmpRRFpWajFEL3hFYkRQOC81anlNK0NhQUdW?=
 =?utf-8?B?TUZxS2FMempObS9xTDNZUSszbHc2czhkenhmY3RkWDBJK2pyL05ONWZXMHdZ?=
 =?utf-8?B?ZGtuZ0hsZk82bFY4VUZ4ekNSME1WOTFpeW9yWkJSZm1Pbng5b0VNY2VCM2hO?=
 =?utf-8?B?S0N4SytFUjB0L2czZnozajA3S3lkYlRDaDhpYWFTcXRLYk5FRk5OQmNUMjZs?=
 =?utf-8?B?UmRjMGtHS1owMjZaUWdlNy84Wmg3TjVpOFVSaHpGaUhvQ002dEtsVTBkZmFB?=
 =?utf-8?B?dlpPdEllcDNadmdnRUtuTk1ja0pmZ1BmQnk4ZFBlTi9vTVRuMzM4azZUd3Fh?=
 =?utf-8?B?enlwOFJVMFBVQXloRFNXaC91S05RME90aHlSTGlLc2tCTWdPSTNOeUt2S3J3?=
 =?utf-8?B?bmhoYXZad2JCWUl6QUxKdDNuR1llajVvMjZDdlExQWZoeHB3Rm9IczV3cXl3?=
 =?utf-8?B?Qjk3WEhUL21RekZhR2RRMzUyRy9IV0dOVlFqM3B0VXFkSjRPbDJKYno3MEJS?=
 =?utf-8?B?enVLWlNiK3JQYVJoemhxMU1yTTRHZjNpU1dCd3ZWaktkdkUxOFVFY1hCSnQz?=
 =?utf-8?B?T1R4d2lOOFdheFhpSmFQV3FndEtoS1VmM3hOSElIcXlDS25vV09lclhyWGJt?=
 =?utf-8?Q?C3kmrW3IuRb2OGBZBpJ97LP17NUwRPYQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTQ4QzFwU0tpdHF5SUFVOEd2Z001OVIzYTViNmxicS9nSWRzSmRTRzAzZ2Jk?=
 =?utf-8?B?S1poVEtyZFZ5NGtCemxqcGtsUi83ZGUyZXlqNXZaZ244R2hsRm1ib0xWTk1T?=
 =?utf-8?B?WTg0cjI0ZmQvcndYZFlaZlc3ODY2eGxYcVcwSDJ1TlVzUUw2K3ZsMlgrYWRi?=
 =?utf-8?B?VklhcEdkU1ZVcEpsKy9GQXp4OTVZbE0yeU5kWnlhNnRuM2RSbWwvY0V4bkVy?=
 =?utf-8?B?c0tpdEM5cnEvVFV2ZU9IdHV2SEpLVEExc3plbkFXWWNLbHRuaXUxeGxEbGR0?=
 =?utf-8?B?SG12ZE1YamZ4N0JKNm9xL1dSaXVhNmJNZkl2cmdkdkpCV2lkWGkwYWxpVHUy?=
 =?utf-8?B?N2R4aHhmTEpCbFQ3Nk40RGppTXcrcGRkODdtcnpWOHVyR29XVEdhV3FrTmMz?=
 =?utf-8?B?TkZvR09MWFNYbVpiampFS2dyWXJ1R1E0ZHhpSEU0MjBFVGg5Q0tFNXNHcnNH?=
 =?utf-8?B?TUJJZU5xZytNUkVDSUdJOW1IUjV1K09JdS9LNUpOa3paU1hXdkErR21KTGxw?=
 =?utf-8?B?ZndNY29PTHdJek1xeDdjdkdiVzNRY1NNeENwOTdMZTdMalFheGdsS3B5bVpa?=
 =?utf-8?B?T3hKNkJLeTltUDRFdnRPd0ZMSHkzQXdDeVZjZ1lUY2JmL0xZQ1h5UDhiSTBr?=
 =?utf-8?B?VU80YjJYeTc3NytzU0J0QlRhaTA3b0NkQzhUWm9NU3E2SUdkb1RVMnh3KzRQ?=
 =?utf-8?B?UHc3K3YySHB2VmRDZnJpZnZUN3lkMjk1WCtHVWh6VlZQd1JhU1lpL0tkdWFx?=
 =?utf-8?B?VzZCeE1RVzZoMENCb3JQQ1QyR2JiSVBQL3NWM1RxZGNwcGVGdFByZDlnOFF6?=
 =?utf-8?B?ZjREZEVoQjFaKzJiREJNVDh1cE10elRLUGZWRkN6cDl6clJJRVZzWTk5RHR0?=
 =?utf-8?B?R1VCR1hnb25lamdyNThKdXJPdWR6NUNlaW5Hanl3ckwzK0FLVlg2NFZhRXdk?=
 =?utf-8?B?dkU0bVRJN1pBa0M5VlNBSXF4aFlKTmlZTUtHVHZ6dFQwaW1WaEN6bE9SWWlE?=
 =?utf-8?B?Q1daTklQejd5STg5aXFZUkVmYTBSQldkVERFa0xlNHd1V3RmangzL3hHVGl1?=
 =?utf-8?B?TE9mOVJpVHJZaXAxc21nYy9FTWo0WkpyUHN6akl3clNoVmwwNVFQYmFRRytP?=
 =?utf-8?B?blNyeVY1V2N1eWxhMjRUaG5QN2FjZzNNcDJ3OFViVGlhK2lrUDA0SmtVeVBo?=
 =?utf-8?B?K0tYbjdLQWhOWTBJUkFTd0dMQlYwS3dISUZiZEtOTGxERy9zMXZzbDg5R21G?=
 =?utf-8?B?Qk16TUpIV2J3SGV6QlRnR3E5c2ZCRWNGL2s5cDdsd2hzbGEwbGZ3UGJ0Tzdu?=
 =?utf-8?B?VmY1elROdlh4aFhGVW9EdkVtbTBQeWpiYlNzM1BKRytYUisxUHdqTlJKTFdp?=
 =?utf-8?B?WlAvNGlGNCtZZmY0U2pRTmR5TUE0VE9ZVzhlMkRoQ2JBeVBEVCt6M052UEo0?=
 =?utf-8?B?Smp1bUswWVFrTDZNR2JqNzM3bzczSis2YjJ0bGJQaGlaaDRXY01JelhWNisy?=
 =?utf-8?B?ais2K0hENFB4anZWendpNUM0MU52T3NiQWU3K1d5ZGs1c05HQk9UdDlnOXZs?=
 =?utf-8?B?WDJYMjNZaTY1ZE5YM1FJTHVhRjFYSms2c0tZL08rODFvWE92ZERMa3drZHRT?=
 =?utf-8?B?TzY0dU5yd0I3YVlJdVc3S1pvRUNzYlBMdHVWZ1JGd0d2VzZJQ0pjR3U4QUFL?=
 =?utf-8?B?bko0bEc0YVVSQTJ5TVp6ZUY5WHhVa1NLMElwM2dseEdEbVd4QWJPN3JaVzdP?=
 =?utf-8?B?TzNmcUNWaDZMd0ZEbzRtQndhMHlxS0ZTVC81UmlZejhMSjhoL1NXd1JMTkxJ?=
 =?utf-8?B?K3pqd2REcHMrQU96bk5jdmQ3RVBEd3VhODRJbHlFaXg5ZkthR0Z1d1h6SlVn?=
 =?utf-8?B?V01hTXpDSFdHeExKSXJ6ZjMvM1NkeHM4a3NzeUI5a05zek1lbm1wUVlhejBW?=
 =?utf-8?B?aDJ0OUMwVXJndXVYMGZFaURGMCtWWW5ReXVlYmpRVkc4SlRRNEhJcTgvUU12?=
 =?utf-8?B?bHNBUkJRL205MVR3VERBbVBjZmVIUVUyWTNKbk5ZYTVObWRoOWFjR3ZWWXo4?=
 =?utf-8?B?S3dKYzN6cHVhRDJNaEMzRXRqaTR5K3N1RlRmc3cyeU51bTBZZFNLVlNaQWdL?=
 =?utf-8?B?Q09BRnFiNlhFZ05oeFZ3UG5lR2Q3Qm84UkkycDJRWWxTakdYQTU3emlITlJr?=
 =?utf-8?Q?COMGpClXUf5vc9XvLDrlRQwvIyNNWjBIsXUV2pWSp9BU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea5cbb2-3f5d-4c9b-42fc-08de1d087445
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 07:45:28.3903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tP8kPXhYcFSWLJGtMVodsddvHS1k/qmlV48D3DhtdE8jUhxlB9FBAdvcZ40dp8p0c2a4L7sOoF6HcNh4hx6GQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9261
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

On Thu Nov 6, 2025 at 10:27 AM JST, John Hubbard wrote:
> 1) Implement Display for Spec. This simplifies the dev_info!() code for
>    printing banners such as:
>
>     NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
>
> 2) Decouple Revision from boot0.
>
> 3) Enhance Revision, which in turn simplifies Spec::new().
>
> 4) Also, slightly enhance the comment about Spec, to be more precise.

A bullet-list in a patch description is a sure sign you will be asked to
split things up. :)

And in this case I think it makes all the more sense, since all these
things taken separately ought to be simple, but having them in the same
diff makes it confusing to review.

Although it's mostly the `Display` implementation that at the very least
should be its own patch, the rest can probably be kept together as it is
related, and adding an intermediate patch would require temporary code
to build Revision. The diff becomes much clearer once the impl blocks
are moved where they should be (please see below).

The comment update can be squashed together with the Revision/Spec
patch.

>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++----------------
>  drivers/gpu/nova-core/regs.rs |  8 +++++++
>  2 files changed, 33 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 9d182bffe8b4..8173cdcd8378 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -130,16 +130,18 @@ fn try_from(value: u8) -> Result<Self> {
>  }
> =20
>  pub(crate) struct Revision {
> -    major: u8,
> -    minor: u8,
> +    pub(crate) major: u8,
> +    pub(crate) minor: u8,
>  }
> =20
> -impl Revision {
> -    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
> -        Self {
> -            major: boot0.major_revision(),
> -            minor: boot0.minor_revision(),
> -        }
> +impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
> +    type Error =3D Error;
> +
> +    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
> +        Ok(Self {
> +            chipset: boot0.chipset()?,
> +            revision: boot0.revision(),
> +        })

This impl block for `Revision` gets replaced by a block for `Spec`,
which is only declared later. Can you move it (and the one for BOOT_42
in the third patch) to the right place, next to the other impl blocks
for `Spec`?

>      }
>  }
> =20
> @@ -149,7 +151,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Res=
ult {
>      }
>  }
> =20
> -/// Structure holding the metadata of the GPU.
> +/// Structure holding a basic description of the GPU: Architecture, Chip=
set and Revision.
>  pub(crate) struct Spec {
>      chipset: Chipset,
>      /// The revision of the chipset.
> @@ -160,10 +162,19 @@ impl Spec {
>      fn new(bar: &Bar0) -> Result<Spec> {
>          let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
> =20
> -        Ok(Self {
> -            chipset: boot0.chipset()?,
> -            revision: Revision::from_boot0(boot0),
> -        })
> +        Spec::try_from(boot0)
> +    }
> +}
> +
> +impl fmt::Display for Spec {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(
> +            f,
> +            "Chipset: {}, Architecture: {:?}, Revision: {}",
> +            self.chipset,
> +            self.chipset.arch(),
> +            self.revision
> +        )
>      }
>  }
> =20
> @@ -193,13 +204,7 @@ pub(crate) fn new<'a>(
>      ) -> impl PinInit<Self, Error> + 'a {
>          try_pin_init!(Self {
>              spec: Spec::new(bar).inspect(|spec| {
> -                dev_info!(
> -                    pdev.as_ref(),
> -                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: =
{})\n",
> -                    spec.chipset,
> -                    spec.chipset.arch(),
> -                    spec.revision
> -                );
> +                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
>              })?,
> =20
>              // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 206dab2e1335..207b865335af 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -41,6 +41,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>              })
>              .and_then(Chipset::try_from)
>      }
> +
> +    /// Returns the revision information of the chip.
> +    pub(crate) fn revision(self) -> crate::gpu::Revision {
> +        crate::gpu::Revision {

nit: let's import `Revision`, or at least `gpu`, to align with what we
do with the other structures.
