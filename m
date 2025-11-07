Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00393C3DF5C
	for <lists+nouveau@lfdr.de>; Fri, 07 Nov 2025 01:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23B410EA14;
	Fri,  7 Nov 2025 00:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cW1GRjum";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C70510EA14;
 Fri,  7 Nov 2025 00:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMtSC4ENZmyFsfoF+Tgxb9K11OuRcJ6xT7os8ZWptAE5Zi45VoNR07aLNxzRQl4zvLJkXiS0bcmqdyk5pFhVngR0onwix7NIobjQWFbvnyyKwVHXsMXC90j8HPoraZF2K1+7AmquxkxafpksqQ6q719qsfn2GXbOvsT5zpESrpntGgLL2vjt6rpTO4gS7B+Si2e/37QFQh2M1ZpAj7AaHSVHsPc0XgrTxYd69IQK3fhybB/oGPp92Nkzo1iljCoydw49tBB0znrfxJzRhMCvpa00mgjo/O6H2sTQXcIxa4ffHRNvd4gtzDRjFciEXM/k660rC6lpp5P6DWg2dEs0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pa8J9CrQyBRMPnPn50+oeymlbKgTPKAbaZbr63kCJww=;
 b=i8nBwO3ukWeLNUiEYzlGDc3YB3NbIuxUfuuEvVYI787GTv/UlaINjjKxJbkri+l9+yGE6FKuuGWS23AJ06KTZ9Q9fxaLMW0FhTo6jqhC+tKGHJ6U8DdenVzYNXQglTa9K3S7OLJ9sC4q+8rxu3SSY0KkXMjqN8Z8frbN9ig516DMa/tNAmaEpWV8J3KKVEf0GSKpQNcnl2yF85+QGKS5GmBoexmSE3ewIUMkWTjOwBcQ8bxU5YoIeE4QtP4DE/oPUeofj4rDKjowvEig0oBloztoxHhmsWRz4pdti0wOKjEqTzlUmBubjTSW0DDd7+Tt+NB7iY2dOvObAXvEvBXNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa8J9CrQyBRMPnPn50+oeymlbKgTPKAbaZbr63kCJww=;
 b=cW1GRjumHmvroj7T/aE2ECNLnT7LGIUF3T9sYRCpElKsTbT5jcAeqrusAdMVjrpKrDVYeHEXR+8GOeWK08+oJ9L+k5oVNh2a7RlraiiD3mYlh8yGS2huesbdn2bPofxgi9s59aUM7A8xvaacLERHJrt3C698mH4QHxhTzXVsyYQF5k7oq9rhsApGHOTZwsrGtkLRG7uuuagsMWrU1tY05zpdAcBm2qnskjk6sIJyRT4JlDFU47UxnSbSA6CgnFViwbT5w277Avmp/goXwKE0ZhRhXWlh8kKFVkd+KDOS6H0Uu5aRQ2vL82CYYoh2BOVtVdKBsULnvihLT7Rq3gFX/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 00:15:28 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 00:15:28 +0000
Message-ID: <fb96711a-54e0-406a-8938-721aaeaeb0b7@nvidia.com>
Date: Thu, 6 Nov 2025 16:15:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: John Hubbard <jhubbard@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251106012754.139713-1-jhubbard@nvidia.com>
 <20251106012754.139713-4-jhubbard@nvidia.com>
 <DE1FKDK4YMH2.31M2ZHUOKEC1I@nvidia.com>
 <c64e59cc-6a09-4107-8b98-f5f40a4b95c7@nvidia.com>
Content-Language: en-US
In-Reply-To: <c64e59cc-6a09-4107-8b98-f5f40a4b95c7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 045dae54-bba7-42a6-2b2a-08de1d92c1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGp3ZFBtUG41WkxpWVlRNEE0T1JFTElhUlRWejFvd3oySGJPbHk3bjE4OTVC?=
 =?utf-8?B?OEZiQ3RnUGYzU1FNMW8vQ252ZTg0amxGR2VqOTRBcVVYQXpraVdyYnNBUTE4?=
 =?utf-8?B?Q0thNVJiazA0bXNlZ1JZV0RaQk5kWXdBUEFwdVZ2K1k0OFEvQ2RvUUpteFBh?=
 =?utf-8?B?R3hsVlh0dVU2Rk9TREFkUEZYWDlDK3dveExZNjJKK0pVR3J0TUtmeW5OcmFN?=
 =?utf-8?B?bWFYbWNTT09mckN4Vnk0dnZKaXVxMnNuRmIxTy9tWVh4NU56N2l2bVk3RWJh?=
 =?utf-8?B?eHZnd2s4d1NZZHlNQ0Y2VTJCM05YMjRyakRPS0h5cTI0UVZReXN5K2xza1Mz?=
 =?utf-8?B?dHVURU9XUi8yNzVvL25JVE84elY1dThRY0pudmdnNU5sazF2RWRmV0gxSTFs?=
 =?utf-8?B?YitlRFVxTGRuNG1FMHpueFljajlhZXhnMENBTXhXOFNmOHdkaVVWaTlLeDA3?=
 =?utf-8?B?dDliZTNmQzJ3dkw0WFJRemlPTFhISTREY3dsbE9iTGhDUG9icmk3TkszNlNG?=
 =?utf-8?B?MnVSRkVmZHdxY1o1eTZ1TFRmWC9sZ3BOcEJKV09CMkE0YjNaaFRBcU9nazdJ?=
 =?utf-8?B?YkhjZG9iNC9kRjQrZmV0Z1o1TUJXK2JGTjVHM2FrK1dXRjhJd2tZVXYycFVR?=
 =?utf-8?B?VHBoTGlWaXhQdi82K3BtdTJkZEZjdFZ0RXNhSU1JQkJBQ0d2K0ZiZnM0ODcy?=
 =?utf-8?B?QysvR05rdGFBTy9ieDhoNm5IMTg3UHUzR2E4SXlmSThIaXZ2dTRlNGlrNmRX?=
 =?utf-8?B?Q2pZcFVXMHdaTWtHSHRoT1dCMFZQbmZmcUZ2SjlndjNVN1pUdUNYRW40S29m?=
 =?utf-8?B?aWQzem5yM2ZHZHBEYU8zbC9ZN25rVDBjdnRwaU40UkJqNGRoWGIvb3dBbGlT?=
 =?utf-8?B?NDcrS252b1FJc2JnWWhkS2IxcG9yc2s0WVlmY0RGczZMWnVyYmk0N2NRSm9Y?=
 =?utf-8?B?SVNzeEQ4azFsaWpMNGJoekM0NkM5Yzc5NDNPTFJtQUtEK0VJU1VGOEM1Q1NE?=
 =?utf-8?B?UEZUNG4rT1lQY3VUTXE4NnZtMlRpM05nYmEwbllsWUV5V2JPTFIzbDczcnJu?=
 =?utf-8?B?K05tT09kdStESTAwNVBjRzRvVERXY0lMYmdUSUlIaE8rWXROQWpkdjI0MUpI?=
 =?utf-8?B?OFg1bHZTQXplZGdqQ2V2eHdORjlDeGVaRWM1MFViZkJiUnU5SGx5OFdielZM?=
 =?utf-8?B?emZRR1hBblM0M3grWUJIUlA4bExSbGZXZnJjQWZncE55N0xrQyszU1BnY3Z2?=
 =?utf-8?B?RTNTREoyVHY1MXlPc2lKSmJhY0hYZncyVmxHbklsODg3WDdMMHRYK09ZTzcz?=
 =?utf-8?B?TEFkTXdjL0cwNUVDRFhya2xEZVU3dGV0V2tSTWF0SnpES2oyMVpjc1Y5bVZY?=
 =?utf-8?B?aHM3cWp3WW43ZEtNa1VVeGp4SzFMSW42Y1J6RXpPaVhReDBjOC8veVpGUlNY?=
 =?utf-8?B?YTV6SnpMYTUzM0JTQ0xUK3NaZ2hwR3ErNy9uSzQ1SUNaNGRIVG04NjJOckl4?=
 =?utf-8?B?eHRjbnBNTjQyMHBpSmhaenpXVkRBUlhVQXJwRFozcTZ1akk1cWoyc3I5RGdr?=
 =?utf-8?B?amM1V1JHcWZtRVlUQTQwSUlwOWxUQ2lBbnQ2VW9EVS9QREViMTFPRUNPend4?=
 =?utf-8?B?Sk9TcU9YYUp6Z3l4cXh3YU0zaVZpV2IybmNCZFk2R29tWlkyQ3E2WWhrZlMv?=
 =?utf-8?B?Unh3SlEvYmkrSUpKeGt0YVV0Yk1VMm5MZVZYT0xWazJDWEJaNElpb0w3dzZU?=
 =?utf-8?B?MUxJTzBKUlpkTHBWK2lFRTk3TlkvNWNHUENwMVlNY0Y5RjloYWdDczJUdXNu?=
 =?utf-8?B?dGJNV0UwNEVML3ViL2IrTndYZnJQdURpN1lyTWxmcXcxQnAyc3FqQU1veCt2?=
 =?utf-8?B?Tm0yd1JMekZOakhHNUNZSDJLTXdZUVBCZWZhd2xVK3VGdUVURXRlalBwLyt3?=
 =?utf-8?Q?ozvfECUFfQHRKwk/miHAaXwuHg0gSibp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDVNWit6bHk4dWhMQmxNeXJ2TDNMaTQwZkRsZWhKT2ZsQ2dLaDJ2aVNOSGYx?=
 =?utf-8?B?bU5yM01xNjJkdTBsdUxpZDdJVFYxZjJxbmZpUTVSbFByenliRjFBaEVpcFo5?=
 =?utf-8?B?d1M3TnRESDhHaVFFeWl4MUMzY2xLSkppMVlVL1V2YVIzc0txRjRYSWE3M21O?=
 =?utf-8?B?TkR2c2hZdUpWWVBWYWp4QjhBS2lNemQ4d2EzbW1Eb0U2MnVkdnRJZ0szUDM0?=
 =?utf-8?B?UnNvbk1MWCt3SFlJbERCVlhQWTZCcVErQ25ucU0xLy9hbVhiT0hMenZLbElF?=
 =?utf-8?B?ODNMZVRxbmhqRTRFWk9uN1NEOWpLQlJ3MVNRTW5iclF5dmpaU2dWSzBDdm5K?=
 =?utf-8?B?VDVzVXRkZ3RMajlXbWlFVks0OTQ4OTY5WlRETXJoeUhtcmpLTmtEMWlldGVO?=
 =?utf-8?B?OUNEd2ZQKzNMOWJrMkRTdlRieituN0tXdmZDRkRVaEJnRmRET0NMcEN3dXVN?=
 =?utf-8?B?QlVQYUlqOS85aVRoQjNTeTlINXRvUUN5aE9NRmpqUGxlRGpIRXd4a0pqeGY2?=
 =?utf-8?B?eGs0UHFmRUwwa1RjS1lWd3ByQ1A0eWdCRHh4VWpvOGFBRWtDTnZaUTBFaHd6?=
 =?utf-8?B?QlkzVXV3aHhiVXNzMXo0cUJNL0VuaXNTOUV3MzhKOXYyOVRQQ0p5Y2FJcnlx?=
 =?utf-8?B?Z2ZwS2R3VUVLWnlGQllTQlN2NGFjRlJ4aG11OEtZS1lFZlhEckxLQnFEZktv?=
 =?utf-8?B?Qk1iWksrMEduZlhoTnpjaVdzN1hOZmN4QTJBd0hQWnJuK2xiRVQrTEY2ZFho?=
 =?utf-8?B?Tzd6bzNJcHcwaWsxZGUzWnQrbmJ5WXBTMDNEM04raklsaEpUQkh5RWtLZ0lN?=
 =?utf-8?B?QVl4MUhQNC8va3djamxhMVNUK3lIZ1E3SE5TbUtrVVkvMzBXdTlzN1QvWEhT?=
 =?utf-8?B?clcrOVV3Qjg1dlhDTWtlMG9BZFFsYTlocXZyeC9kN3pWQVE5RWsyZllzdXRO?=
 =?utf-8?B?ZFh6M2hNSTFOeSt3cDFXdGVkcUc2Y0ZrdU1PQUtwU3BQRmpIWE1UcHFJWTg1?=
 =?utf-8?B?eEhrVFFxakJtdzdnblRjdytwbEc0T2dCbkdFbHdwYmZadEd6ejI0aCtLWFNp?=
 =?utf-8?B?a3M5QTZBeksxVlF1a3NHN2hPdTZhdEJ4N1RoNEpaVjJaYUV3QmNPNXlEYUpj?=
 =?utf-8?B?bFRoNHlvMnErZko0Mkd3aFR0dXdUVWhrSy9vckowSDBtbXRyQStHRXRkb2hX?=
 =?utf-8?B?a0daMjl0aGduWWNpeEVsdlF3U3dlY2hKZkp1ZXdDa0treFJVQVVtV2xIdHhv?=
 =?utf-8?B?cFNvQnQ1cytpQ2VjbUcxMUhkUTBTQXdXWStpUHY5dFZlV1U1bGVqVXVsbWhw?=
 =?utf-8?B?dThHOVN3bkNpci92eXdWa0hhZE1xV0hMWWxsWjFTaHBhNGNWTUw0cEh0K3hz?=
 =?utf-8?B?b29KV2wyQkNxYzVDUzFaWjdZNlZmRklOTkc2NWx0N1hUcnRtY1VMME9BTE5C?=
 =?utf-8?B?bEEwZVE0ZUlibUNLWEFGem05RDVOVVFiV2lrdEZUbXhLUU1QUUJFSU42VG9i?=
 =?utf-8?B?L3RmN2dvYW9HM08yeTllR1QvcjhZT3lzM0ZPTVdKQllEVTRtd3orSWdHY25R?=
 =?utf-8?B?VVA3Nkw3UVN3eXZTYkFmcUZPMllOK29ObG1qSUpXQW82SGxod2FPdnRON255?=
 =?utf-8?B?V1ZTbEh3VTNyWTFlUURQcG1wYkFEN0lMS0RxTmc0Y0JqbHU1R3pFSW84cnR5?=
 =?utf-8?B?SkpZSzBRRXBjbkluQlcwVkF3MWZTd2RiNzhMQkltNktlVW1ySi96bUIxSEt2?=
 =?utf-8?B?WGFWMCttdFpSeGNHQkpocVdBMmhNV0dRVGYzejhITlF2TC8zbkI0UFRLUGs2?=
 =?utf-8?B?cWFtSnlvZGl1M1phZzFnQzJjdlFtdEQvbTd6QUFBTmwxQmhtUmtFNlJ4NTk3?=
 =?utf-8?B?cjB1WTlKeWxyL1hwM29tVjNqcmJ6cWVST1JEM1o5NjliRlNyd1dGdk16SkM3?=
 =?utf-8?B?eVQzQlhJZ1NxY0VFWldXOUFiZ0RxWGNsZlc4YnJqTGNCTkFJMzNMaWZ2d3Js?=
 =?utf-8?B?d3k0ZVlxaEFnR1o2ZExRZ3NnaWliMk5sakJBTlBvSjdBbE00M290RjJVTDly?=
 =?utf-8?B?Rk5TekYzSWpZTlVGOFB6bTBqK0xVd2xxZk9WbUZ0WXpUZ2xnM29RZUtRVytm?=
 =?utf-8?Q?GV7q4fu2Fk4qW2cFubvnA84/f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 045dae54-bba7-42a6-2b2a-08de1d92c1bc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 00:15:28.7310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Udpge6urvdiOZ/rDKwZVXXHBqWdRq0uNk4PscYjjardbeD0TvyXOyYye0r1IV7eDg3bRxuuf6tuepS8FsZzYaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927
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

On 11/6/25 1:27 PM, John Hubbard wrote:
> On 11/5/25 11:24 PM, Alexandre Courbot wrote:
>> On Thu Nov 6, 2025 at 10:27 AM JST, John Hubbard wrote:
>>> +        // Rubin:
>>> +        //
>>> +        //     Only supported by Nova. Need to use boot42 to fully identify these GPUs.
> 
> Ohh, I scrambled the comment when I added Rubin to the discussion. Actually,
> the first sentence is correct, but the second is dead wrong. :)
> 
> Rubin will still key off of boot0.
> 

Correction, the dividing line for when this changes over turns out to
be mid-Rubin. So I'm looking at going back to "if later than
Fermi, use boot42" after all (Timur was advocating for that, earlier,
too.)


thanks,
-- 
John Hubbard

