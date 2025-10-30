Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B98EC22212
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 21:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B27810EA18;
	Thu, 30 Oct 2025 20:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EoYk+m5t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF64310EA17
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 20:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZY/dBR0KiX5u1BEnspMQYXxMC5rgmqIElD5cXlKxdVdBBxn8BtvJgwoJcTCEdOkaxyg0IwXtOzOhJyIJeHAEJLpPqvsiQELUH9BYKPm4gSEshzojieiA45byJxdc6yTIiNweL8zT4yk4PuBaXFmNJKlxrLeC5h7cTDc4OMD29fQbuwXj1BtpIBFJ2fIfmO7ZHPbW1R7O+ksBjClHcAPvjt0IBBTPGyuqTgFv6dguxREEHEmKdnaH3M7oiM4R26WkVM5xgcDetOUFvsjiyw//iqZx4aKlGpywES/O+Y21FERroSytnBiZkoaFsKrPAD1HE4faQtmJVGmXvhB6+X0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS3J+KZUcF5VWfxAeoZeaqGJDZ/Ytfnne3VCVb+E55k=;
 b=uMNeX2IPhI0B5CRgfeEpLYWzGPwJ2gUK5g6jFqgLryxG4bp/1U5wQUyvr/VlBtBSkTMRWvo+qmApLIu7VyYqqS/8E914FSCsD8NG1k1C5ho6Q0XdxzgCqdq1C11h2vgZj2B1OO+b808N18uWURdVgpdk0XC/hlLFnRN9KzVF9yUsRv/CmG/I5WYCAp6+RwD78aPYa3KrThV6Kcf9pOoTeIDM4yCq1cNVkQ+mAUFqVO/ARNUGv+UzSuHl5ep1wIIT+bvgffyUHJFGNsQhd7ONKtsO2v2OqETct0HXvYud6HvZGOE0em+OPhpr5ZbyNDauAvhRn0yFMfutX7ro8cLwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS3J+KZUcF5VWfxAeoZeaqGJDZ/Ytfnne3VCVb+E55k=;
 b=EoYk+m5tVTL+ghKHubObKONj0mbMwC104e1+tKWXntY9i9BDP04ek+4Wdf5nBUS8X62g7q/eO0ynZEd69DnE8k79SygPofU2ht6DRr8Yp4Nf5am3JQ7Bp+lSL6srdrhHF7fxYsOrE0sZP7ut5Q0wC4NjM8KkPeZtMSrc4c4dDcxskWORS82JJC9kegLrGNVrbEP+7/hic7wXZq3utDG/O+wn/WNu3lv11Q+P7pj0zplbdjig52u96imyoFgLLEcXcBtORZyQ9zTDHQQQ6KCjz9E3BsU3JybB5GQINmyVInJTikg3FRD+mGOTfR5CDaGaZlBl129LcDGsuSXvBkKAag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY8PR12MB7364.namprd12.prod.outlook.com (2603:10b6:930:50::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 20:10:08 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 20:10:08 +0000
Message-ID: <0d591052-9c85-47a3-abf3-02a8fa9c4dae@nvidia.com>
Date: Thu, 30 Oct 2025 13:09:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nova-core: Ada: basic GPU identification
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
References: <20251025012017.573078-1-jhubbard@nvidia.com>
 <7c8ab212-3905-4652-baa4-b422e69fea0c@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7c8ab212-3905-4652-baa4-b422e69fea0c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:a03:333::21) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY8PR12MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a0a895-b092-4865-f754-08de17f052a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2RVblgyMXVkTzNIenUzOGFXTEUrajdOQzVqMU5SaWViMEpEU1haRzNiaGFm?=
 =?utf-8?B?eUJ1QWtGNGxiZEpQRFlEM1NyVk5MMEFuQlRvMmdFNm5ZZE9rUWpMdjZUTTAv?=
 =?utf-8?B?KzY5Y25SM2RFdlVGSEFVMkozdUNybkVlRk9lWjhZdTZGS2JIbkpzRWJrNWdJ?=
 =?utf-8?B?S3JJeWF1MHgrV0t1OHZ4R0ZhZ2F4aGNEOEVxcitNRis4d0h3ekRva1RFOWRn?=
 =?utf-8?B?Zlc0UmhJc0dXTSt1S2dDQjVDRDRETm1aRm1SMEpRMVBJUE5WcmsreUk1MGdh?=
 =?utf-8?B?QlJpWHJYNjNpUHRBQjNpQUEvYzZzdk9WeWN4U0N4SUwrRmJvQm5BcXBIY0NS?=
 =?utf-8?B?VUQ2WFZ6Y2VBTEFPSGdSMlBsZzhidEJ6TUorZTU0em9CT3E3bVQrWW9RdjBr?=
 =?utf-8?B?VkVBTXdVU0RXTFpKb2o2VnFNQ21jQzlOQ2E1d1lnWUxzSkxldk9LWTFYOHZV?=
 =?utf-8?B?RzVYMERwVDBSS25YeDJJT05aRG1aZUFuaHgwZTdMV3N3bmc2aENCRk1aVkFz?=
 =?utf-8?B?RXBXV3hjbTkxYTA3Tm9ZRk5FcGk1Y05mL25ObXVMdUFLZXdBRHVDNG5jMXdM?=
 =?utf-8?B?Wnp4djBRMkQvTXd1dy9hNTIxd2xjbmxsNlFZdHd1VFUwTUp3alc0N09adkZM?=
 =?utf-8?B?cm5rZ3o1S3ZWZkl6V1JyL0x6emZiWGpXWGoxbllzVXFvemdQdm5nb2E4bktq?=
 =?utf-8?B?eHdJY3NSRWJyd3lydzNmNnY5L3lTYmhaSVZFNlJaV09JL2xMWjhXQittcDhx?=
 =?utf-8?B?TEZuMGtmMzcvR1MyL1ZkbE41NFhZMG54alo1eDJrME9iODZoUU1sR3dVT2hk?=
 =?utf-8?B?eDlFQVQwNlhXNTQ2YjlvNGNrWEtUeXZ1RWorQ09kUDhtbUhaeGtzMXpUZkNO?=
 =?utf-8?B?SFY4a1ZPbEsyTU03N1lldzlmdGxrQjNrakF2N1Z2YVNkWXRpNk0xN1k0S2k3?=
 =?utf-8?B?bDNYWUZhMm1TcnlLMmYrMGdicmhZUTd0YXVWY0E4OXpSMWhQNTlTMFkvTDFL?=
 =?utf-8?B?dk9IaGpLbHNGRHJ1Z3ZVWjVBN2hZUUM0QWRxWnlTMDVFTnZLOFE5YUZrd2NG?=
 =?utf-8?B?N0x0M3graVg3MElLb1lrck1Fd1kwWnBrK2I1ejJUaUxSQjB0ajlsVDhseXFU?=
 =?utf-8?B?c3pKMTV2V0ZCM2djRGQ5Tk1qYlZWR1JCdElxUTBFVWJKQ2JkMnVpeWFKREQw?=
 =?utf-8?B?eWYvOCtESURpVkhGdEtWdTFHUkt4ZWpncE5wS0lmajVoRTFwWHRQZVpqUE9F?=
 =?utf-8?B?cDZqOVdkTUxWSkRUOEhPSG84MEtRZ1FWU281RmIzanVueGx5K0t1aVprMCtx?=
 =?utf-8?B?UUs1aitSeThQVnVEazlsMVo3VVdQREhoTktpbXkyUFluMUY4UFZzVk9mR2hT?=
 =?utf-8?B?T0drSmI0LzZYVGYrQ3lrUExiK294SXJaaUFWVHM0LzJLMUxnaFQyb3FYWFYx?=
 =?utf-8?B?eUNTK2JqOVN3K0ZhaEk1cEhXeDAxOWw2ZldkcmFjNlExYy9ReXBjTnB2WHZs?=
 =?utf-8?B?ejFpem14Zzc1K0MyVnRnSlgxU3ltckV6Q3BBc21ZbjFGeG1zbFdaRXNjY2RZ?=
 =?utf-8?B?SUNGWmFuRll1bDdvUlNnWVR4bndmQWxsWE1NVDUvRU5PcmQ4N0RuWld4YVB4?=
 =?utf-8?B?Rzl3ZFZCZGp1U0pqMlhhTGUycFpaMUtkWlQ3SSsyZ3YvRVU3blhidXlNOWFR?=
 =?utf-8?B?YS9JTzhST2V3MDRleWREdktaUkErdU9sbDVvN1duRWszbXZhb0J3YW9oQ2cy?=
 =?utf-8?B?NlFqNGU2cEZpb2lTMG5ueU45c1cxU0h2ZDFHdHZTck82YnU1SVlUcnV5Wm8y?=
 =?utf-8?B?M3FMNUMwdnZVVzdCd3luK1NoaUs1OThkZU5SdjRIYUxDQTBQcmFzTXB3bXJE?=
 =?utf-8?B?Vk9SUEdVditLSDI4NW5wUk52cWdRMjBKR01XMGNZQXpiZXJxQ29xOHo1bm1M?=
 =?utf-8?Q?YIoMX7IP1W21iWiAuCZvOWluLwj7mnXl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymc3ZWJhVnFJbEQvNGdCTWU3cXlCQ3VuTHE3ZUhkbUVJaVlQUEVLR2pGWTZ0?=
 =?utf-8?B?bVhuRlBZcHJBb0Q2ZFl6cUpGOThlQVcvSHhOb1ZZdk5MMmx3a21JNjYzZ29Y?=
 =?utf-8?B?Q0ZRWUxFZFJCRHlUZUNZNFlDZ0hyOVgvYXFXd1dyZjNVN3RsQXZhS05pbHpn?=
 =?utf-8?B?OGk2ckRvTEF1N0JldVIzaXBmUDNsK29QRUZqMSt4SzVLZlczWG4zNWFWSWc0?=
 =?utf-8?B?eERweUx5MHJKTkNPQzFadURwVkk3aVFuaEVLUFBVbDVKTTNoWkpkQXRNWFRn?=
 =?utf-8?B?WU1ydGlxd0FYVlQvNS82T0JLajFNK3NGOE51Q1FaZ0VrZ0xOL0FWbmE4WEVv?=
 =?utf-8?B?UXJ2RHplTzhTNnlIZDJZREpyYnFEalA1VXV4Y01FdzhlUXhpd0g4RjhXeHJI?=
 =?utf-8?B?SzNpSlRnZmtsUVZ2R0ZZczI4V1hEc2Jac0kxSFlsU2xtWHk5dFNCbWszMVNW?=
 =?utf-8?B?d2wrWmNIdWZ4NWNhaUM3MWhUNEtFLzdJa2ZMU2lWK2lNQjVSK2pQQVU0c3A1?=
 =?utf-8?B?dnlocHVvS3ZnSTVRL0RsUkpubE1hZnNOMjV1bXdZNENubnF3YVArK3VqZ1cv?=
 =?utf-8?B?RXhib0Z6OVpOR2VnU1R1YUxIWFRseTVPck5peFVpR3hWWUNpVStaK2hWQWlv?=
 =?utf-8?B?ZkM0T3NDZFI3dC9oWnBuOFFKcGFjZzdCVHRnN3dLTEEzWFdDb25ENG9sMURJ?=
 =?utf-8?B?R0djMUdJSktrQmpxNEpVdmVFajgxSTA5cmFrUHpkaEhMRDNZdXI2Znh4RWNx?=
 =?utf-8?B?ZnE5NnQvZFZ3VG4vMkMxM2I0RjFkS016N1gzS3FnQ0w5cll5T2s1NXJDV3cx?=
 =?utf-8?B?aitBb3JqYXR5NURSR3EzUEtRRGtYUU40VWhpdThkZWp1S2pXWG5CV2xrZWlI?=
 =?utf-8?B?MVhTcnRtRHRiTmIvVEh6SzBKNkk2aDZZR3JtRko1UkVXbWFtYk52eTR6UExk?=
 =?utf-8?B?a1piclFvM1NNQ2doc2VNMlovSHQzdy90VWprSFVZcjNCcFk3YjU5eVptWTFx?=
 =?utf-8?B?VVJMRndhbEwrY2NyM0lwQ29aaVNBYnBMVHJFN3JtTHVRdktBd0FIMWE3cDc5?=
 =?utf-8?B?WlR2Qm44cExXSFBwQThSa1RKdWhwMkQ0dTZ6Q0NMb2tiSllRbEJiMk44NTZM?=
 =?utf-8?B?aUpGVGtMZEpKUnkrcE9zZ2JqTGUyaFBsM21Fb0VDTm94SmFpTE5uNnhiVjZU?=
 =?utf-8?B?bWhWeVh1citsVU9aQVhQRHdrcDVlYTk2YnVUTXd3eDA4bFZleE0zSnB6aitM?=
 =?utf-8?B?K2RtMGZpUzNnc2RYa3NUWVoramhoOTB0enBwZlYzSVZWR3Y5VlgyamJINGla?=
 =?utf-8?B?dk04OTgyOHg0UkhsazhaK0grU2RlQXUwS21Db3ZHN3BwalN2OW5BSmNNMk5P?=
 =?utf-8?B?SUg2VUJMSmdhd3prZHY1c0ZnUnJQckkzL2lFVjhXeWg0c3hadGJHYUh0cU80?=
 =?utf-8?B?b05qTHAxSmFvcXFpZlMxNmNUTzZKamdFNFY2ZHE1ZmlqWXB2OHg2T0pKd3ZK?=
 =?utf-8?B?NSttLzlYalNwVTlCenBFS3AvNFJnT2V3cC9RRU53N1lHVlovNGU2REJHOVpH?=
 =?utf-8?B?TVQ4cnFTZnpURmM1MVE3SHU4SFNXNUdiTVQ5WW9iSDhlZDFwcHVES2EwKzNU?=
 =?utf-8?B?b2pRRnZHWjJTYlNPSjdaUDIyK3ZPQTg3Wll2R1hXTys0eXk5QmN6Szl1dmVs?=
 =?utf-8?B?ZE1VbWE3Y0h6UlVkcXgzeTdqVWFsYnpwUDdEajZkWm1EN2JQVkE3ZUVDclFR?=
 =?utf-8?B?eWdEcFQvMHBHRGZ3RXY2TGZ5S1ZPSjlIdHROZGZ4d2Z2YUNocUttTXgxa05p?=
 =?utf-8?B?OTlDQVZFMFJUU0NiK080RmJBYlE1Mm5ZYk9RNXBlakp4bmszSVpyWVlKZ3Fj?=
 =?utf-8?B?MGJTTGNZNHBydTRMMDZXdjZIczFqTXJ3RWwvVUdYVGJOOWdWUmRlVXBJMm9D?=
 =?utf-8?B?Zll4VG9kY1BCMmErWWJMZkgwRittOThJNkdNanMyd2dRTUdzcTg3RTZwZkJ6?=
 =?utf-8?B?QWIxalBKRkNSRm9tTmhKNHJlbEJiL0dkVGxOZnRsMURUWkRqbW9LNm5WbTlr?=
 =?utf-8?B?U1YvME96RVVJU2ErdHZLbUZmR1RtMVczS21Kend3Z2YzN1h6Y1JZN01SbGkz?=
 =?utf-8?Q?lQAnHrLus/No1sVZ3381o60gm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a0a895-b092-4865-f754-08de17f052a8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 20:10:08.2055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+e1I49g/B3KmWw/n2SDtiT+OszbBFRrgKoa60lEtOqkk2ErREWUEvHAuvoC2qXXN8dOM6E5DbrigA+OK8vBoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7364
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

On 10/30/25 4:15 AM, Danilo Krummrich wrote:
> On 10/25/25 3:20 AM, John Hubbard wrote:
>> ...which is sufficient to make Ada GPUs work, because they use the
>> pre-existing Ampere GPU code, unmodified.
>>
>> Tested on AD102 (RTX 6000 Ada).
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> 
> You may want to consider requesting committer access for the drm-rust tree [1].
> 

I really appreciate the vote of confidence here! :)


thanks,
-- 
John Hubbard

