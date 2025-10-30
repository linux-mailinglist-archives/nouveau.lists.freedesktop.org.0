Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29210C1DE8C
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 01:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E638410E0B8;
	Thu, 30 Oct 2025 00:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SRtb2NdY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177BA10E0B8
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 00:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYQN2310xsbI2Bqo2RNx5e46nQJL8nCGXcRQP6LYU53NsPYaZABaY3AngKV9/CANGL6ybS23rqkPpEFSXe8SWE/DH6mIr+spAae/JcMcjV+jlOkMMtOtiNMDHvwp7T6Zm6uDY3Kr1ZpuoLzgApXA0k3ppLSQ0Zvtm/MftW4xHePZjB6bdqD8n87xH+UdFILFOSNehq8QsjWZU4oPcARPqQaAcQN3AHvdCEhCpvFILnNBBTbKwhJZ1XUyqVCSrRz0E31D+FH/xk0IH17YC98fvWKWJwcEf8VLKpt8CdNwqV4TRa2Ika61RivXWuD1Cna88oYJ+luMl1p6oGsPviDwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYuL61rs6iuIF7WG25uCsSt7GJGQNz9xq6HiW73JXKg=;
 b=n0yTr4yCOUJ3mC86yb0yDRkJLI6Uwv47exfELvTuo2JVu12/6UndJCJ1htuxYO6xCMdWlH+VBEUWvO1JA0inmy3ugHS1cn6rjab9YMfK9+FJaWtbZ7LWmo9QrclTsKh8K1uoELGRY11Iceo5tfGPcObGXGX+/hP4VWadqk+xl6MLlHRUS3HAkgkb2yukdI1TWlEOFseK8de9fuCkarGSdOCG2P0ZA+jZH8yjjLf5d84PjsBzqqHQgE4RY5OyTU/PF8glXj4zO+9ratwD1DtO/6aGT6TGpkFxknEnIb4IDcfyMdv2Ght/2Ms1tF9nX+qIunVTt/Jdkgr1WhhpZgJxUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYuL61rs6iuIF7WG25uCsSt7GJGQNz9xq6HiW73JXKg=;
 b=SRtb2NdYMxx8rgWYgOoiNmMrN/qWDpVJEDQSTjUd9ODNM3dbN+x9bXscG2RIsy1Vz6/mCVfn67qcQmgIrhSSv1olpYodD//raIUmhgDx/CbxWSC3hsIjGFdXfrZda6+UlaSKyUdydDmfSY6Tk/2tbl0cEpCPaboW4DaZATJkYR9Ff1zmYzC4oc4dYwLSIrUszPwNv6S1LFbBJ+tFTU0K+abUtTOMNJBBLHTvD3OKinRGZBbC0GxdDBYpi0TEnxcN9a8zAev17fjRZ3cis1m7NlsAAiOTmUI6bG8Ixs2Hh7MaknFgAh4L8FTIDmGxo1YnLi3FMbbmi1ctrwmZpjZvbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.19; Thu, 30 Oct 2025 00:29:24 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 00:29:24 +0000
Message-ID: <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
Date: Wed, 29 Oct 2025 17:29:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdac7ff-e018-42b6-c787-08de174b6025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWswSkFEZVBvUTRDeG9qNEZDSitQUGFiMGhDaUEvRkJnUllhVUhHa1ZDNWpR?=
 =?utf-8?B?Z0s0a2V4WG5HNG52bzZFdnVxQ3VwMm0xSkNjUlZQSUI5VGFlRnNPZCtaS00w?=
 =?utf-8?B?RURZYnVpenI3ZWZWY2d3OGZFclg4WWt2eUR2bjdrc3ZuUk5KYllpYVRnWTUv?=
 =?utf-8?B?VmxVQUwyYWJHUzYwcFFXUnl5MUdYcit3cm55NFZFYlcvR0pScm12SE1qZ0lZ?=
 =?utf-8?B?SzdvTXY2OTQ5VW1Vdm5PM1Uycm1SZGpkd3c2U0NtTVFYUERIOC9VWjFzRnEy?=
 =?utf-8?B?dnlSalBYallyRG5HZU5MY1o4blNVTHh3WUlVWGpQTzdVcUdXelY5QThYTmVQ?=
 =?utf-8?B?MDY3R2NPNER6VmMwQ3FIYmcxNEViby9LeXh4REJXSGMrQVpqZGRLc2ZXbEJQ?=
 =?utf-8?B?RFNIM0lvYXV5QkRvZXc0MXRZUFlIaVlKQ09MazJrOHpNWUdvNG9hZEI2d0tw?=
 =?utf-8?B?cDUzcmIzc2o4akNkSUtHMDg4T0lkUm5LdEt0SjQrR3I2cm96YTRHU21lazVy?=
 =?utf-8?B?cUdKWHNwb2xWenhseXRiOU9JU2lRMi9PSzdWSUpYVnJyNFNxYnZ1RFRyeDRR?=
 =?utf-8?B?amhHekVyKzRIOHVvbjY4bndaMnF1TFFOdG9hN2hldW5NeStUMmZPOElEbjNh?=
 =?utf-8?B?MGRDeDhSdE12bWZZNi8yTCtzN0Y3cnltQitTcWs1RW1HMUthR2psS0FkWVM0?=
 =?utf-8?B?WFNRY0lSSnIxOVAyR1l0STJSZHlxRWhrdko2alZYMFhLcUs4SXB3WVFaeUl2?=
 =?utf-8?B?SlRVclBXZUpwdFdIVXFRaDV4MW9GR2c0ZEtRMlNaUFpXd2V6QmJRanBoWnFs?=
 =?utf-8?B?VTA3MW5UUi9jejVOVWZENDUyN3p2d0c1V2ExSmw2UHlCMUpRbXRhMHhmWCtW?=
 =?utf-8?B?MXJqUzlEWndOck9rMDlJbDB6cURIMy9vT1E1VGw3akZnWlMvandKdWtXTHFv?=
 =?utf-8?B?alJ4QXhEQy9FTExackJkMG1FT3pGcXQ3aDZBTHZ1N1g3Z0VaamQ1MVpxd09C?=
 =?utf-8?B?VXpWVVh0THplMnEyTVZsSTFVWS95eDFRRVNacDNSbXRtK2h6TDNLNDNoMkNh?=
 =?utf-8?B?WmtySll0eGpEOUh0N1lacE5OcVZUWlhZRzB4eTR4Q2RwZlFibjVJclZQa2d1?=
 =?utf-8?B?VVNZSHlwMXVKZmtOeWZWKzJLRFdxNnhrejhhVDh2OTdtUzk5am1lb29yZ1V0?=
 =?utf-8?B?NGFLK1A2UFgxNmdOdWFnMk96dTV1K1dnbysxU2NXM2NxTGJqZTlyZXkwc2ZH?=
 =?utf-8?B?N0xRVkNDR1dxK2RDdmtxRElFTldGR0pVTy9tMDdvZllTUW5IWkkrSkhRTU5I?=
 =?utf-8?B?R2JRU1luNHAzR3ZzU0h5UHJvOVhxMjlOckwyN3MzQlVBM3EyaldjbUxSYTQz?=
 =?utf-8?B?NzYzY3lxYXFaMG5uaFdTVmdPaWo4OEpJVFNKbk4rckxKSjVsRkVjUllFaGZr?=
 =?utf-8?B?Y1lKWWhUSXFtemZSTTBvNk1NMVAzTGkyZ3Y5cDdEOVNnSlZqYkJZWFcwR0dB?=
 =?utf-8?B?YXJteDNFWEo2TU5XV1pIRGJFRVU4SXkwMDVqZXVsdGNYN2EvU1BxV2dNdWVV?=
 =?utf-8?B?bXNOZ3VxbnMzZm9XZmx0RzJYYnZRbzh3YTBhVTAvUTlKVWxSTkZuaVRhc2FV?=
 =?utf-8?B?UGJza3o1TFA4YWh2QXBRMHVoVWtpZFdBeTlSU3hZdUFkaGNQenF5aW5OZHNp?=
 =?utf-8?B?SVpBY2hRNjYwL0VTZUM5VThlUU9DcFpKT1BLLzltdGU1SkoydlBLbHQ4a1FP?=
 =?utf-8?B?L2VZUFpSQVVjSGRaUExYQ3VtQXd5VXJNQlZZK0dCK3RuQnFUVHo3SThJc2Fn?=
 =?utf-8?B?eTYwVXhNQjV4YzlWdlhlMERGUTNlQTVCTWVMTERiaWNwb1dQWlhybEtMQ211?=
 =?utf-8?B?c2FvNzdmL05uYmZEdlJpRkY4WWpKS3RiL2swekY5cExhVnRtdDYxbFhSUm1V?=
 =?utf-8?Q?NJhDJ5COQoRq8nXoRcb/NZraVl5SAq8B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhFdm1VUTRnRy9Lejlud1c3d2JtYm5Kekx6VmJJcE1KbjA0dEdXQXovSk1y?=
 =?utf-8?B?U1Z1aCszMWxPWkZNbjdKc3d0NWZCa0tpb1lCNTBhMFIwWk9QdnZjOFZkTm44?=
 =?utf-8?B?TGFubXlSUng2bWh2SVpLL21PZDU2TGtZRG5LNCttK3lUdENxWkloVE9KNFlm?=
 =?utf-8?B?STlqeWpZa1NHZTlJTkp5YjJ1TGZpWFlRUkVPNjdPSFRaM3RCSGZnN09ZMkVv?=
 =?utf-8?B?c1BLVFlKRU10M3NaTVAwRzFvcG8vUlZFOE1neEpUQWdRMmRZSjVOYkEzL1Q2?=
 =?utf-8?B?blZlYncwK0FQMHRScVhqQVFpWUI5SWRTT0Z0MXJLUlNxa1IvVS9Kb3BCTFJ4?=
 =?utf-8?B?UlRnVkZuUVVPWFFaWjdHL2lLSzNoVDJQR041QjhnZHh5UnhaNWtndnY1eHRG?=
 =?utf-8?B?QjZ1SkVKaWo2ZU5UcGNJREtvTFloWG9MRjdXWGx3Z3R3NlVOVVk1STBkQ2pn?=
 =?utf-8?B?OUZNY2hDTE4xcmZoY2tuOW92RC8rWXc0TUNYRGk4eFlCbWxQV0lKYlFKTG5Y?=
 =?utf-8?B?YW9uUjBQYWRYc3pPZ1BXZlJ6bHFxZnlUT3RpK0d5QTBucWZRNVEzY1loTStl?=
 =?utf-8?B?RFhGdjlSUDhuWnBkM3RSQ09Wc0tQekQrTFo0UXppYk5wWXdyQ0NkLzhEZVBV?=
 =?utf-8?B?NnZab0l3TFgraTdrdUx1UTlSd2hNaFFqYWhGNDlyL1BTK215NmdXYzRCZXNi?=
 =?utf-8?B?VTl3c1krNklodWUyNWVrL2RtQi9Sa3RISUhQQkxQeUtjQWlvc2Z0MUQ1b0hi?=
 =?utf-8?B?bXdmdDQxRTFwaUJJR2NCV0xsTit4S01nbzQ5YVZUdjU1WG04UzJXNldzSnU3?=
 =?utf-8?B?NmQ4OUc5VERVd28ybHpBdlRZQjVDWVNVcG9vK202MmhpOWRIUk5GMytKengx?=
 =?utf-8?B?VmluT05qRHR4S2xNdnRGMFRURVlSMWdpYXN4ZzZFUCt3Q2tqYytMTjVuZnJR?=
 =?utf-8?B?SEczZ0tHcmtKOEV1azhDZU5UYk1wbzVqeldjVWN3eEhOTDBHRFZ3Umg3cFpk?=
 =?utf-8?B?MlYxbjNieWl5K3AzZEdaTDBkZFgvcm8vL0FsVmlYeHlHQ01zQ3ZtSWU0RU5F?=
 =?utf-8?B?ei9JVm5DREtydVNqR1FpTzdESkQzV0hQR3pDejJQalRmQklsNWlKUy9jb0Va?=
 =?utf-8?B?UEVkZXF2NnFod2FTWlRsS2g4OWRvbHgzNVNxTytZT0sySmV0TTV3RzdvdEpl?=
 =?utf-8?B?dWNpZW00N1RLbVpiVW9ZVHV4amVZbTRlZkk1Rk8rSDIwelhjZmg2MlhIeExu?=
 =?utf-8?B?aFd2U1hGQ0N4b254OFgxZld0N1lRL0RHSXZKcU84RG9BTm1KeTRobHdPNWQw?=
 =?utf-8?B?VXp0SUhLNUxvN29mZWlIY3d1eEkyOHhGeTBITmxQYXBqQlgvc1VMNDFGWGdu?=
 =?utf-8?B?dVA1a0Nva0NURlE4UW1zUHZlZUJjY2cyMS9mb2NCZXFjMEphR2U3NzZWQm5B?=
 =?utf-8?B?S2xvNDZPVjh6VWNkZUh2aHRha1pxN0crT3U3aEQzZzdNb3ZEOG9UbHNTenpP?=
 =?utf-8?B?WWxmMkRFZkFXR05idjcwMzdRdTgvY1NkME9vTDRGbXhxdXVCdjllbGJ1aC9y?=
 =?utf-8?B?c1dOa2NUbGRtZ0R6NEh3RXVuSndQcllCVkszRlRGaWQwd2dYUEoyeUlmUGM4?=
 =?utf-8?B?QlR2cGM2a0NZenU0aXlTM0t3MGlhVXZvcElxaGh5eFNObUdUR3BQVjRubnp3?=
 =?utf-8?B?OElwRzlZT2YrTVE0SzVjZTczZVJHWHB4aFNzMVV2eWlXVFFkYUxtVERkUWVz?=
 =?utf-8?B?MG5KTWNxOUgwa3hjcW1SU1pQVjRKbnNjV1BJQzlaMG1HWGlNMERzN1hCckov?=
 =?utf-8?B?MmE0VDExdzBvSUZFRWUrUGU2ZlBLbTNDY2lnRE0vS29BNW03cldhZUQxdG9E?=
 =?utf-8?B?bGdoMTJ4R2YvT3RJMnBydEhoMWszVm44UkFtd1hBcVQvT0JRRDlRdjJKMGV3?=
 =?utf-8?B?V0d2UndFV2YzMWpJREJaY3RxTkJlYWtPUStkOUtya1JhQ1hiNkt5cUN2Tzkv?=
 =?utf-8?B?K2ZvWklFUTl1ZWFNbmFLczJvQnNQYjhBQVFEQ2I4ZmtRcmV0cWl2ZDFOeEN4?=
 =?utf-8?B?em5RWGxjc2FWSUVWcWtzYkxWUjlxVkMrSXExQWF5OWt6WmZseCt2Y0Z0TUxw?=
 =?utf-8?Q?3KEf6vReUSNhA54nXnh5HNlQV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdac7ff-e018-42b6-c787-08de174b6025
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:29:23.9918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJQ2Ogya1/TXi5Nkq3RbUTWV50xXXzi/OWwopFwxSB/aPZYfNpzT3ubzi7R678JXLC9P8PmwPryVjMvNo0Ic6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
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

On 10/29/25 4:26 AM, Danilo Krummrich wrote:
> On Wed Oct 29, 2025 at 4:03 AM CET, John Hubbard wrote:
...
>> +    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
>> +        Ok(Self {
>> +            chipset: boot0.chipset()?,
>> +            revision: Revision {
>> +                major: boot0.major_revision(),
>> +                minor: boot0.minor_revision(),
>> +            },
> 
> Actually, would be nice to handle this just like chipset for consistency, i.e.
> 
> 	revision: boot0.revision()

Good idea, done.

...
>> +    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
>> +        Ok(Self {
>> +            chipset: boot42.chipset()?,
>> +            revision: Revision {
>> +                major: boot42.major_revision(),
>> +                minor: boot42.minor_revision(),
>> +            },
> 
> Same here, could be
> 
> 	revision: boot42.revision()

Done. 

...> Without the comments this currently is:
> 
> 	let boot42 = if boot0.is_next_gen() {
> 	    Some(regs::NV_PMC_BOOT_42::read(bar))
> 	} else {
> 	    None
> 	};
> 	
> 	if boot0.is_nv04() {
> 	    Err(ENODEV)?
> 	}
> 	
> 	boot42
> 	    .map(Spec::try_from)
> 	    .unwrap_or_else(|| Spec::try_from(boot0))
> 
> Which I think is a bit heavy-handed. Let's simplify this a bit:
> 
> 	let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> 
> 	if boot0.is_nv04() {
> 	    return Err(ENODEV);
> 	}
> 
> 	Spec::try_from(
> 	    if boot0.is_next_gen() {
> 	        regs::NV_PMC_BOOT_42::read(bar)
> 	    } else {
> 	        boot0
> 	    }
> 	)

That, combined with Timur's comment, made me realize that .is_next_gen()
can be made reliable enough that we don't even need is_nv04() at all.

I've shortened and fixed it up accordingly.

(I think I got a little too involved in the Nouveau-related discussions,
there: Nouveau has a different set of things to support, and to check
for.)


thanks,
-- 
John Hubbard

