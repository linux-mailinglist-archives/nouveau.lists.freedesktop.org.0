Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A244C9DCCB
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D161010E0C9;
	Wed,  3 Dec 2025 05:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JXLTNnxu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010009.outbound.protection.outlook.com
 [52.101.193.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDB710E0C9
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:26:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6Ob78ksxH86hfnmPve4mi0UnsFEV1wB0XKE15+uf7/mNTZgQ0RHxYy55PK1OhxuCHjgRejr1h0FCX78H4fdDb2iwPGBaxiydaTTUYldwwlXs0KXtri9oWjpPCtRCRfY91dy8QGUF9cx8HtKKqTp2taPToUh7mnDLCr3UiHDozy+fX0I+OIVnL9UzFXBRDNdB8mz4TcalP3Enr387QGaCV4iFEOqoC8mE/Iat8Cf9+aBV/wQM6zODQVVQZZS+HCXIt7BlKZufrA3FO1M5gQSRAE9oLYIjn+B3NknX0MlB5zH9GwHhcVg22DDSkA2ZbHEuATqVbLNmFfB8zqo+U0INg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Efywpx+Sy+aN9sTmmmlSB4uAEwoWKBcvCVUpoE1V5YU=;
 b=rMRZJrfK/Tge0BNWS9nZ43zO+dX7x6/0pvzT8T5LMMjvx4S4Yl+kstJMZJxtR7cSxtjQZJSnQmoD0ByZ8ymsIF7t2mIXBVnhSkAteBIwTVpDE2UmHsAaztobHNRqx3rueOoT0kd8uVL6gAJWAYfMJJO4eEYjMSm1+a1dmxLI6uim/auw6GrkezPduqIVvH+y7K+PhIz82Iq7Vv5twBNrDkTkhm9OmHa16x8s6IlPEKNq8HNmrR0ZzclSyyxZgRhRBo4TqqDVkk1SYOe1CdG5skOnjRNrNkdkWW7XOVxk0hcfuldmkL8O0eBJIu615drCF9o+vDoGfBs/nOnI6FCNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Efywpx+Sy+aN9sTmmmlSB4uAEwoWKBcvCVUpoE1V5YU=;
 b=JXLTNnxuKC4JFrewG2i82jd9nLETn+72KfmP7/Dbg9mkMFGv7bAZWvsoSRfZqqHMWAkSpeV1gimGWQrdc8m2UQ3J9Q3TFlPaRON7Rov0ggsOfbMVBlEZEJrSMMyuTmoW2PmmpV0ATHfU6wo8avPN4byHlGZbdFHl36uaEP6XeMv4aKWFxDdSXDuRZQsma8RVJ1LKtgyIFscQ7SW7OMmkv0uZp7ZMJgtV2BiQMAMdRuNVxCrV8mq+6NZubO+zCNrDZ5pbjPtmND39gRC3zx2DpUN6y9cfXleVZ3zCQ2cYiNSZd9njMrqv8qF/MUKkhkBLK6FavPAGdHPWSuTEBuWa1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 05:26:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:26:40 +0000
Message-ID: <7e231836-2c1b-4917-8136-9bfd58073617@nvidia.com>
Date: Tue, 2 Dec 2025 21:26:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] gpu: nova-core: Hopper/Blackwell prerequisites
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
References: <20251126013936.650678-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251126013936.650678-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0537ec-98b9-4ba2-a747-08de322c89b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk52NGhsSXRKYk1qWHEwajNhSHdldVR5RmVvV013WmhBRHcyMFJJeHhaSWdp?=
 =?utf-8?B?VVlRNk9JZkxvcVZaVFh3VlJvVjBCYk83WVMrR05YY0JhMEw5cGRmY2dnTjNn?=
 =?utf-8?B?WVhzWC83RW1uSGs5b09Rc2UyUHFwdVRscjFwT0FONWFhakxkR3ZMVU05TzAv?=
 =?utf-8?B?RlI5OGJ1aFBMSk9QL0pQanFtWDNZbDN1SXAxQ1VTZnFGa0dKUVd5eEZrQ2gy?=
 =?utf-8?B?NW43TWxWRnE5N1R6cXpyK1pRRW55dUF3MEFvNGJiYVl0TGpoN0NqdVFLSjN4?=
 =?utf-8?B?YXdmZ2FRRnNIVFd0ZS9kR1RaazBpeWE5RVpZdzhEYXBaY3RrMEJzZ2xudkNx?=
 =?utf-8?B?Nyt3VmdVZWVHQmZ2ejVFUlp2bytNNWhFbTIzOVR6Y29EM2ErSTlKQVdoTlUy?=
 =?utf-8?B?eDd1ZyszUURydlJ6dzA3SEJVby85OXlKTzVPZlBZK0tSeCtZYmRja0FoT1p0?=
 =?utf-8?B?dXFRMWQ3TnoraVF1eWFuVmp3eEdqMHdpckRWQ21zSTdLV2VzUGgvVmIwKzh3?=
 =?utf-8?B?NkNvUkZwWTlNd0JSbW5nN1lvbGJrQVZsV01BTGxWUWdwQ2dRaXRlRmxBd0d3?=
 =?utf-8?B?Q2Z4OW9BWTNEUmMvekFUc2NjdFMxVTJzNVVYR0lWd080L0xNWGRiaENpWERZ?=
 =?utf-8?B?SEExNG9walVUeC9NWDJ3Qjhwa1N6c2p5Qk9XL0xZL2UyeTdEcUh4YUt0elV0?=
 =?utf-8?B?dVVJVXZrNWhKWHo2QzNBOFltK0hvbFNHQ3k4WVFEMWc2dU0rYk5TQk0rdTda?=
 =?utf-8?B?VTBsakdoc2oxbHJNMENCbk1QaWs4cG5wcU85RlkyNTNMbmR3YndwUHlUWWNJ?=
 =?utf-8?B?dWNIVFB4TGhtdDJJL2VyaDJiNnltL3ZiWTdNRnQvRkR3NVFqcUp5UWNHL2tp?=
 =?utf-8?B?R3Q3S2NTa1F5UitnU3dlaXRzK2x4K3BhazdqL1NWb3kwb01FZFJOWEtYc0hN?=
 =?utf-8?B?ZnZDZE5WampjYmdpcWdUM0lNMXZSaHRCaHdZZ2k3dEhkZU9JcFEyLythV0Vp?=
 =?utf-8?B?UGN4OXFDVEpJdEgvK3hkUDV2dEhHTVVqMUhxdXlnR2VCN1FmU3lWakhwVHF6?=
 =?utf-8?B?ZVNKekJKOVFrTUM3WFhEdXRuZUh4ZWhueDlhbEdoYTRJSEpVblZEc3lpbmF4?=
 =?utf-8?B?K3QrUDVaRDM3VHdzRWY4Q3dJN1ZhcDdlOHBoNUhKUk5iZll2Ty9IYnZBNkpr?=
 =?utf-8?B?QzRLd0VydGNocFgzZTNINEFxMExtUXZzcmMySHFxb0hRQlZ2NU44QnVXSWVw?=
 =?utf-8?B?TnE3RXQvZkdDYkJ3ai9DWkRKejl6VURFeDBSSmczRE0yYkc3aGprd3htcUts?=
 =?utf-8?B?N09PRzNMQnphUHZIK2FvemIxRzFOSk5CbTEzS0tCbmdNV0FNRGlhck5TNk1J?=
 =?utf-8?B?dFcra3V3S1hVTFQ0aUxZOHhLVlNqSWV5M0Z0YlN0N05vOUVKUXhEcndKYkNJ?=
 =?utf-8?B?WG5ZN2w0Q2lZSDJyN0RQRTFaMU5vaXB0MTRPYU4xcXkyVER1SWUvU1pQdnBl?=
 =?utf-8?B?V0wxZmhwYmwwSFVKc1lQakZVRVRtV003ZGQ2RDJFQW9wSGc4MFovV2pSVFBm?=
 =?utf-8?B?SHJsd2RVLzdKV205bGMydW5lR0U0dXdzTjVGbkY5bnNtTzJFSWNYNUloY1l6?=
 =?utf-8?B?RmtKSk9TaWlCdTFLT0huTys2MHhhdjhia3RkNC9HenFzdHlhbitFTnFVRFVZ?=
 =?utf-8?B?TjhFcW1pdHNMTGI4amora005OEZrdTQwazdDVWhER1dDQ1cwZmpGbzJ6TkZN?=
 =?utf-8?B?MFlIclEvVElHV2hrdjJKelRuTHBnV3lmejYzT1BEYytVb2p0am8yTWhPYjRJ?=
 =?utf-8?B?NzJNcnlLN2VWTyt3OXgyOU9CbUJSbDJ3RTMwUEFiakNLcFRIMG5BNVlnenBs?=
 =?utf-8?B?TFdqWkltNC94RzZaMjdxaHBCVEFQTWJpN2xUeXBlRWdqcjJ2akkxOHdjR3ha?=
 =?utf-8?B?RFIyRUUwdXFiZ2NyUmlYdU9sWk1ydHR6SE10aWRiUU9IamRCMUUwT2JGVG5s?=
 =?utf-8?B?VUx3cVVKdUR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9QejloWWhROHJrMTlDdytEeitRc1VMVWJvV1AxcERqWnU2akxiNE5rZTdB?=
 =?utf-8?B?SlhOSVFsdE1wVmxZMG53NitWV1ZsRTU5ZXF5OElQbjRsdTZEcTJHYmlHSVds?=
 =?utf-8?B?SUQvUTFMdEpKajNJTzhwVE9pKy9wa0RaNVF0M0xaa3RnRW1nbmVJSG5nK29V?=
 =?utf-8?B?NnU3eEFaRGFwY1JKeVhoWVhrbjl1RngvdnBGMkd3MTNyZFBLUVV4RlRKT2s4?=
 =?utf-8?B?Vy9jby9pdlMxcmVJSG5vMlViWjlPNHNaNGhFRGZtQ1VrRWg2bWl2dzJmNlJJ?=
 =?utf-8?B?b202WTJ0OWYyN05tL0liajJmSnNHazRaS0hsRlRuUlhtWmwwMDBvOW1mZGU2?=
 =?utf-8?B?OFJyeEdMeElzVDRMclNxdnBnZ3NFWjFsZzBkakNUZGM2K3dWWW9hSFR4R2lV?=
 =?utf-8?B?MWRLazBYc2RhanNHZ2d5QXZleWtlc3JtbnVQTGhzMGRndGszZWN6YWVSZUVx?=
 =?utf-8?B?aHFNYS9CcjZKOU1TemhVbUo0bEZ3S2xmN3JweUdaaW05TmFZZ1BuWldMcUd2?=
 =?utf-8?B?TkZBY0dTTGlQcVBPME9jdWVoOWFGeWE0MGVqQzYvUGFIdjA1TGJ2WTBBZGZn?=
 =?utf-8?B?VXhFdmZHNUZnZHhxOWtwdWJIUzd6T3FWMHZXeG05clFkS0xlU01mOWIxMzhX?=
 =?utf-8?B?QVZRdHB0QnE1Y3JJUWwrZzgyRXM1ckNZb0ZBS2paQzd1SGNORnUwS0RaSEw1?=
 =?utf-8?B?cCtjZ01qN1pzMEcwcVhsOTByZHlqWmtwNUlTbUpoVFNCM3ZiS0JmUmZwbFBT?=
 =?utf-8?B?aTlBZEFJcDEwYU5Pd2IzRVB2WE8ySXJJK1BvRDRRMjJkREk0bDJBN1Y2V25n?=
 =?utf-8?B?T2YyMDRGdUxpTGJaQjJ2czJwYzVqZXhqRlJSbTd6Mnl4RFYzMEV5Y2hBcmxl?=
 =?utf-8?B?MloydzlGVUp0cmNDcDhneTh2a1JkellRUTk0eUZPeGJ2SXE1czI5OWxSaVNs?=
 =?utf-8?B?bnBWYWFMNXhnNDl4R0dvVmxDMVluYURqNmtFSmJBNzB4NW0vaVBXT3RsSnlr?=
 =?utf-8?B?UHFkRWRESUtwd2Q3Ry9BZTJqVU90bzgzWWNSRTQ5eEZQMTkwVHJkVHVkL041?=
 =?utf-8?B?bzc1ZXZ5RE0ya2hXRkcyUktxZG01MGo4WWlZS3ZIaGlPU1NYcmU0SXFOYzIx?=
 =?utf-8?B?OGU1NU8vallsM2VreU5oRm9ucGNRb0p6aFVqNExGU1JlU0l3b2ZDSnhXT1V6?=
 =?utf-8?B?N1VDY0tWYnkveENPMkFBa002SkZ4dGJuMW9lZmRiSmtiYjJnQ0hrNWUvVFFK?=
 =?utf-8?B?STFlODkxeW9LcGl6SXpuRmdXSzhkS0w1dVFzQkMweTR0cGtKNStiWVg5MHI4?=
 =?utf-8?B?d2Zibzg0WHo3V2h6UFhIOXFiM3ZIUFZHQzhzTEtHeWMvM3pqRkhDS1VUcTdB?=
 =?utf-8?B?QWZxcGpEZ3UrRURmVnRqelE5MkVncEdlOXJNZWtPUUtWSm93SG94NTJwNmZQ?=
 =?utf-8?B?NWpGVklxRWl1ejZCZ09weGN4SEJvc0MwUHpjUmNyWkdKSVAveXBUVG9aTERP?=
 =?utf-8?B?OUROYXZsNGFIWE9NSHFTTkQxZGordjVLcUNKV2xxc0xJUjRldFdWZkFUOHI0?=
 =?utf-8?B?SFp1ZkxIQzIvbE1YQUgweDlEb0Vwa3JXNk1HVDliUFVUQUlqK0lHelFadEVh?=
 =?utf-8?B?RTZiTitFMmhDM2RCK0ozbW5UWXpsZncxTlIrV0RQQlFkSHA3ZUg0UVhvVU05?=
 =?utf-8?B?aUlMTTM5Vm9rbDRFK2pDRFVsLzJhZCtCYVhhb3RWWUFiQ21GV2lqVm9aOTJC?=
 =?utf-8?B?OUN2ek96czhCTTk4ZXkvbGU4Z3M4U0lobFAwbHI5OFR2UDJLUU1sSHp1Q0h2?=
 =?utf-8?B?RVF5YWMrZHhMTlFkWkNwTFRDVyt0d3ByczBwUjZDVW8wMkhTcllmTUt6Z09Y?=
 =?utf-8?B?djZ1eEQ4WDJKVVNmeFU4VmtGTnFGT1B4SXkvY2JsQVRmbmVIRWpqZ01hMjR2?=
 =?utf-8?B?am9qVEh3cGFJbUZVYzBnUFpxcnRIQ3laQ3p2M1BGUmt5ZzZmOGVEVEljTlhy?=
 =?utf-8?B?N2hXRFlmQzhZU3pmWkVGdFZQLzFpQkJxMnlDZjluSDQvN1U0RlcvaDZEczFQ?=
 =?utf-8?B?MGVmOVpPVUVsU0FSUi95RjNseTVSRDh5aGVWSFl2NU1EbE5WcVhVaDk3YzRl?=
 =?utf-8?Q?FxnpgVc9ygve0KPh6hdDWjS8k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0537ec-98b9-4ba2-a747-08de322c89b1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:26:40.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4UQGQxZhjbq9dHXzgvdFu2cDCFjPf4G5W/oAZd6ZyY/uXVob+5HnD9fVN0fDkSv2jBKZ2qhSy3Oxz0GgY7YAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906
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

On 11/25/25 5:39 PM, John Hubbard wrote:
> Hi,
> 
> I'm posting this now, instead of with the upcoming full Hopper/Blackwell
> series, because this includes some HAL improvements here that will
> undoubtedly interact "a little bit" with Timur Tabi's Turing support
> patchset [1].
> 

Thanks to everyone (Lyude, Alex C.) who looked at this so far. I'm 
planning to merge it into the upcoming Hopper/Blackwell firmware 
series, due to the timing of things: it no longer helps to have
these prerequisites all by themselves.

thanks,
-- 
John Hubbard

> Changes in v2:
> 
> 0) Rebased on top of today's drm-rust-next.
> 
> 1) Use a new FbRange newtype, in order to clean up the implementation of
> printing ranges with sizes. (Thanks to Alex Courbot's suggestion.)
> 
> 2) Combined the Hopper and Blackwell HAL additions, into a single patch,
> as recommended by Timur Tabi.
> 
> 3) Used a separate patch to change the "use" lines to vertical format.
> That patch is already a commit in drm-rust-next, so this series builds
> on top of that.
> 
> 4) Dropped one patch entirely, because the boot0/boot42 commits fixed
> up everything already.
> 
> As implied above, this is based on top of today's drm-rust-next. There
> is also a branch, for convenience in reviewing:
> 
> https://github.com/johnhubbard/linux/tree/nova-core-blackwell-prereqs-v2
> 
> [1] https://lore.kernel.org/20251114233045.2512853-1-ttabi@nvidia.com
> 
> ************************************************************************
> Here's the original cover letter, edited slightly (removed the link
> to the v0 series, to avoid anyone going there by mistake):
> 
> I've based these Hopper/Blackwell prerequisites on top of Joel's and
> Alex's changes, and also on top of my recent boot0/boot42 changes.
> 
> This makes it easier for both Timur Tabi to post his Turing support
> (which he's about ready to do), and for me to post the actual
> Hopper/Blackwell support, without generating conflicts.
> 
> Testing: This works as expected on Ampere and Blackwell (bare metal),
> on my local test machine.
> 
> John Hubbard (5):
>   gpu: nova-core: print FB sizes, along with ranges
>   gpu: nova-core: add FbRange.len() and use it in boot.rs
>   gpu: nova-core: Hopper/Blackwell: basic GPU identification
>   nova-core: factor .fwsignature* selection into a new
>     get_gsp_sigs_section()
>   gpu: nova-core: use GPU Architecture to simplify HAL selections
> 
>  drivers/gpu/nova-core/falcon/hal.rs   | 19 ++++---
>  drivers/gpu/nova-core/fb.rs           | 72 ++++++++++++++++++++-------
>  drivers/gpu/nova-core/fb/hal.rs       | 18 +++----
>  drivers/gpu/nova-core/firmware/gsp.rs | 30 +++++++++--
>  drivers/gpu/nova-core/gpu.rs          | 22 ++++++++
>  drivers/gpu/nova-core/gsp/boot.rs     |  2 +-
>  6 files changed, 125 insertions(+), 38 deletions(-)
> 
> 
> base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4


