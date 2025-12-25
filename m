Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD915CDD701
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 08:32:28 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB9910EAA8;
	Thu, 25 Dec 2025 07:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kJ+mP3NW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 560A944C68;
	Thu, 25 Dec 2025 07:24:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766647480;
 b=frDol5BQO7edx+w6rlVxlwgMgK2V214z8u2UAHumT7m0kAm3cTzEbjjCh31hzbW7Tl95Y
 2vUzOytvPrKGuqyD4m/iTJ+aTtmzNLoQpabu0dUgFPTc/W4VQtwUpOvt4cVcL1kosWP+9cx
 GFB90ImStqKW7hk/NwVDWH6WkgAqze8Aw6XB6xF/6aXWwCuRu42pnv0IjgQidA8+6GjSAQV
 U7W025LUDYlfgoM1in99pLKchA4o2jOT5euekgP3A1vWJe0j9//MO3zKnDJ1Yu/f5l7UorV
 ZEBQbLhImfX5GBGD0/AayyhnNAcJpuNIylpvaZha4rsDPuyxRSug+uR1qnqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766647480; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nFDoCw5va9hfHYbiXTy2ObVs/zCwUqosyxW9JHqCX38=;
 b=ABkjOCRXZdEMxOY9qo34LqUedFUxgzI/Ldnqs7A1pI/0QhnAPd1AUs+tTTeQNthG+wr2A
 OOMUJSr6lVd6yO772VI6BVo8RHqSjcQ9NZx0HU3CCgctLLoGWlbqAfH56qoBK9oB2YY8kyt
 3EYC8hLxR5kOflO8mFagPdvJ813Q0SSf4vynuCZX+zv19bIZg0EtpQB8zYHhk3wCWWFtsg9
 dSXBj5LDydaKDLGj7i/+Fre5NdHgQiQccLgB4hjNOv2CbzniU3gOMBfh5EwiAmPH0twdIzR
 to+PKpT23AFIjnFJnVtZVnngKuKuvfNOBEyovqbZwHsDjVWXV0UjeybJoOWw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DFDE6400C5
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 07:24:36 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013031.outbound.protection.outlook.com
 [40.107.201.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6898010E08F
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 07:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhhBHDamY9WJaOQY3VGtlno9Y9fDdHQX5rHqc3mYXdBc8T5Qlx7XZSCxgP+JkpBT7a1VWfbj+cJPhkDeKwXVor/83eBZTMTWHp15hifGjknip/CLWXca7yIC7saA0F0yJpFDxI+L8SfF6NIPbBUjOzkr/fSwwZsFQ0ADwN5K3tOOPvln5pjGw49RjskdI7XptEseXcUY7KuhMZ+sMFWGNKxqJcIleDQaQZWqGgjJB+Wiw5S3bHKV8mNbDYPA+6JZFU2dBBEBVbnLjnNv20YCG+aIvckWdXHZ4g9Sicn8NcG5JPxhINR/m72wO6dJCJRuj6aScoND1av9WEU2azethg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFDoCw5va9hfHYbiXTy2ObVs/zCwUqosyxW9JHqCX38=;
 b=jNgVgRORkkxAVkqRMV1Ifs+B7AxEOH+5/xDLbHEfNZZ5w/igJMduoszTD+lC7FBGXjLRlP2TD/fRZtp2YZE07jdfXONnetCRvco4+BP1VUbQhUmJQNxwrc+cHXuRXr+HeRyPJdM2elB3Zyq44gwhMHqOmBP913ekZe01dgX4wyfl4m4Z27BImAkNQh1SxwmV8K4PA2v4tnAa23ZKA1xF2F2FANBfPU2jbIq+nx2lJRTgrvTz4lTwKlDe70BXcFXm0w9mFDpxXcOMVJOZC3w47QJIXzUrrcWbx86I8Rd7yY3HKSbhUDPBLOdGi6RxB0GyO51w8e83CjioGbD9dm4iCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFDoCw5va9hfHYbiXTy2ObVs/zCwUqosyxW9JHqCX38=;
 b=kJ+mP3NWyhjGoToxKSwR8hf65QsNIPwvk7NS4LltDNKIKc87doqYIggD+yTeQEacx6nPnDPEMeXSvw/QNrFTYIRGIox7nJNoZbQYvXBEyH2fym+zl/z5iHYU80sXvyXq6i3U8H+0rUSSDJBwcHteGwY7gTA+6x5+HQ91XGSxQwLwr8Pr0gAQlNLdZBe1PlcUbNzm/UM/QgqYndATY+44tq06jaZDrcJdzAhmquijhhLDB3GtAFLwCTuT6IuCU83erTnBVaHuBfu4ECSD6AuPVo7xDAz9CShA4Q9PLbcNHNwsSgmb2IR5FVrBcCYvfZ3N4KD1gGdYxbfmGAdAOT3bKw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 07:32:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 07:32:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Dec 2025 16:32:18 +0900
Message-Id: <DF74FEXHESCV.3L0KB1DLDMFTV@nvidia.com>
Subject: Re: [PATCH v3 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1766544407.git.y.j3ms.n@gmail.com>
In-Reply-To: <cover.1766544407.git.y.j3ms.n@gmail.com>
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e9cbe3-548c-4eba-660d-08de4387bba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RXlxd2V4eHlWeVY0eFNNOWhQNU1DTG5kcjNaZk5lWjNTa2Z6SktkY0NuOE9M?=
 =?utf-8?B?V3BubFk0UTE3cm8zUWZRWkJ6SjAxTU15bXUxV3dFVWo0a2lEak5nYnVnMmxL?=
 =?utf-8?B?UEJFZFJlMVB1ZWdyUzhWS21NZEE4M0J5MFlZaEtVay8xZmNjYjNUR0U3aUlx?=
 =?utf-8?B?WFhhUElHMGtFZS9PcDRnaXdha2xxM0VDZW00REhFZy96cUsrdXVyYWZPQ3hq?=
 =?utf-8?B?bjRQSERmYXp4SjBJamJaeVFoUnc5MkJBUUVLeEpPdlZTakRVRFNhRDlqQVU2?=
 =?utf-8?B?STRYVTNEaHRKQVFoUUc2d2N5ck9zWWpnVG1uVW1VcnA4eGVBcnVTbXFkRWpG?=
 =?utf-8?B?dlFiVkFNTWlrNTJIajNXL2Y4Wk1tMERaYXpHVm91RCtRZkNxZ1dLZ0d3U2Fm?=
 =?utf-8?B?WFZBYlN5cHpDTk4rMWVHVXdpS1JLaUFsTzV1cGwrZENkaEJqSEFVZjRkUWZ5?=
 =?utf-8?B?SUtDWE1KRW9odGs5dTN3aWhuMzJsajRkTElGWVpZeFo2cWlKbnpnLzAwWDZ6?=
 =?utf-8?B?SHhpeFF5NVNiUi9oMS9sNHhGRTk4U0NtWEJhb1E5eFNaZjB3L1o4YTZhZ3JC?=
 =?utf-8?B?TmRvbW1VaVpST0hENXNHR1ZLc0gzbmkwUGIzellyZmlWTHZTa3lJSmN1R3pE?=
 =?utf-8?B?VDAyejl1NjhZUFhmRnV2bFNnbnJSaUk2M3djMHVobU9sL3ZNMStvbG1GSzZI?=
 =?utf-8?B?RHhQUXl5b0k1VU82Y3hrdi9hUzhWWXd3THgvekU5SWdlK3hJWFYxbDZRY29W?=
 =?utf-8?B?YnAzN1lMS0FrU2hNYUJrUW0zaWU0dVZscU5kd1QyM2hvU3h6ajZWelduRjNl?=
 =?utf-8?B?RjhEMXJMb0llb3FMTlE4TnpFMVlMUlVhbExaVU1sd2svR0FrNFE5ZGdKWVV1?=
 =?utf-8?B?U01OUzRRSmwzcGVscU5HVEc1ODlhQlN0bE5aeldvdFRHL2VxSkZ1M080eVpK?=
 =?utf-8?B?eExzZjE5NFpjdk5BZktpak9nRCtkTXpCZnV6alZVdXBTUyt5S3ROcGhMemw5?=
 =?utf-8?B?dzdYcW0xTUlTaS9BODlpWmtXcVdMM0JPQjJpOGhRU3JqUjN5Y1FsWmZJdXpk?=
 =?utf-8?B?WEV5S0RJR2ZpRXFlSVI1Y1M2dWR5dU95QVduSUQ2SDkrUFdUZ0NmUytmUE5S?=
 =?utf-8?B?aEVjQThOTlpJS2FCRmZyRHExOFdQQmR6Mzh1a0xCT296K2FXd3FuekVUKy9W?=
 =?utf-8?B?bW9aVHBQaUdaR09ZSXl5d0IxS212ZjFuRG9PcithOGpVSmg1ejE0K2ZEYU55?=
 =?utf-8?B?RU5nWmk2ZU5rZmVDQnd0YU9USXVZU2UrSFhub2djdkVMV01YUGI3SjBjcUdD?=
 =?utf-8?B?VEQxeVYvdDA0TGpCV2FsalN3OVhwSG5VN3N6VEU3VHVxeDdXZEhrUUJpTWdy?=
 =?utf-8?B?L0tabklZS2FVSnplV3c2RXNiLzRneWtuZDRZenltOXlCN21xUW9sYzJsc1dK?=
 =?utf-8?B?dThhM3lSdzh0K1BOdXF5dkE2NnFNdEVpcWN1bzRJOHF3bmcrNVZGOHlneU84?=
 =?utf-8?B?NVE0b2lvbUU2Vk1pRGl5WXZDVmY2RWVKbDlqMlI5YXRDSnZDUE51NXdSZHVJ?=
 =?utf-8?B?dDU0MUlCMjUwblN0aFhNaG16RFVCR0JxK1J6TTU0aWs0RVhzSUFjNHVuTGZr?=
 =?utf-8?B?a0NEcjFSZ1QvS2RvbkFMYVlFWGF2cEJrTldqL1BreWhpdnAwV0hMbUpyMUFz?=
 =?utf-8?B?SnBYSWovMXgyVjVTSjQyMVhnU1hsc1V0Y3hWWTZWcVRTMUhWbWJiYTcwWml3?=
 =?utf-8?B?UExjTEJleGhqQmluNlMxYWtHcGZzaXFoUjRsVHFjcEwyajR5TklvWm1tajVF?=
 =?utf-8?B?T3pXZ1FzcXZtQjhsdEhmb1prQ3hBd3h2ek1SWXJtTmpvelJOQTVaU3VFbS95?=
 =?utf-8?B?T2F1NDErZFJhdW5qNTBha2ZRdkFnejJXdFJIYktaS29wSGJmbk81QWNkYjJs?=
 =?utf-8?B?b0NTbHA2NGVEdEFIT1hNay9kUnIwTjdHZ3JULzdMQnlGckhubDhLWVhRdS9r?=
 =?utf-8?B?N0RYZ3JERmQwMVlSdkllTUwvb2pZVGNHSFZ2VVBjSmhBYVNUbmhMQTZYZW1t?=
 =?utf-8?Q?k1m42q?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z04wbFlYUit5UExtNlhJV0Y4YUZqdnI2M2ExbndsU0tJSm5jVkUzcUtmS05j?=
 =?utf-8?B?eW0rbTFiMzFQV2ZOWDU1YTE0NHJOK20yN0p5WGRQd0FROEVlVU1pWEhOcGRL?=
 =?utf-8?B?UVZSTVdVRHNLbkdWZzBUUHRSdm1iVlBXMjB0d1cyUFV0ZlFIUEQxNUxrV0ph?=
 =?utf-8?B?L1VxT3JOSlRTMTVYdTk5eFZpeElRRyttUWk1WGZBL1pXK3A1UUtFRGR5U1h2?=
 =?utf-8?B?Zm5ObU5yd0VKejBYc3F2WUVwaW9OZVVHSlRPbUs3UHREaDV3Mi9hcTRxcHlz?=
 =?utf-8?B?aDZqL2J0UGo2c2UveHpDc2pvSVFVOVhrVDdJeHlSalQxZXVzMVV1NlFJRzlw?=
 =?utf-8?B?NjBObGtZeWVJOXFTL3VwMU5tZ1ZVdnJqL0tqVC9FaVp3c051WnhITi9tOUVr?=
 =?utf-8?B?ejJhNFRMZEpjRGRKcVRUcnZ6RnRDRXNwajNoKzdkSHhlVkNjenZtL2pvNzdJ?=
 =?utf-8?B?Zm5vT3llc0pSWnJjZVZxWG9WMnlGM1dFMHhwWktVbGdySkE3d3UzR0RSanN5?=
 =?utf-8?B?MmxOL09sRWFNSjhVMDl3UVJBRDRnRzNqRGRPWDdvNWI4aEprTUd1UW1RNHlH?=
 =?utf-8?B?djdialNlNnpFSk1IcVZFSjR6ZXYzNzViNFBBdzQrbTdyRk5Nd0Nzbk1VMlIx?=
 =?utf-8?B?UkxlYXRVMStxUzdwbG1icjhlVUxUMUF2ak8vOVhwTG1zZ1JQOTBzWlFtdHVX?=
 =?utf-8?B?UEU2anpFSDdFYy82NzBXOG9hSjRYRCtuK25mSXJUUUY2c2VvaDdSL0VVNXhx?=
 =?utf-8?B?OE44ekljM3FVclFSWmR2bUpqMkllWUZqbWlPVUsxVTNvaXh6M2MwaHRpdG9v?=
 =?utf-8?B?WUtycytIMy9qMUsveXBQQTRQbU80bm9sLzl6RCtNMVpZTFdrUWtFczErRXo2?=
 =?utf-8?B?blpDdmpCWTl2bEtoLy84UytwYlE3ejYyQ1k4M3REdXUrZm85R21zemtMYWF6?=
 =?utf-8?B?Sk5BVnNNM3pFUjhmeEVVQTlVUG1DNWpob2RjdVB1SHgrWG1rblNKcmJvcXZZ?=
 =?utf-8?B?dWhBeXFlUVhuWFZXdzFTeVRDTWx4OXIyQlVtYThRUVdDUEZhS0R5bkduS0Ri?=
 =?utf-8?B?djRlZ25IdllZOTZ4MjMwWGpGYWt4cjVVeW1BSEtJYTRxa1hHVFpta0FTbzhG?=
 =?utf-8?B?MjNVVW5Od1Z2SEUxTjNwQ1RhOUppdFFMTzkxS1pOODhKOGNTcWJCY0NIT3Rn?=
 =?utf-8?B?VTRodVVuSTl1Qlk4OU9senlVRlZXOWk0UXNYazJHRmN4YTRFUVFCNDJ2c0Jp?=
 =?utf-8?B?a0VpaFhObmhxSFUxTHZGSFZncWhBZTJ1NjVpRFBKdXdJMDZOMlNJbzRiOFI0?=
 =?utf-8?B?ZFoybXIzajJ3bjNreDEwQkwyVlYxclNWQ1pQWk9FazRjTmxmRFEzOHZWWXVh?=
 =?utf-8?B?SUxpYmFTU3d3N1hVbnd5eHBXVmI4eTAvQnV5c2hja1NBTVZmMTFNSkFwSDZ6?=
 =?utf-8?B?Zk9DQWdVZzgxRGRPTWQ3WE1ucFVFTGVYcjc3dCsrcUVZR3RoY0dKbWlrRUhk?=
 =?utf-8?B?bldUck1ibHcxTHVXVkhTZFczWjhFRmY3ZSt1NXJmamM2VVd0UkpRUXJtRXJJ?=
 =?utf-8?B?ME54K1lObVcwc2JpTGkzYjFUY01qdjMzKzIyNktyR1VoN21zc3pweTkybWdv?=
 =?utf-8?B?SU01SVNBM1ppZWsvdnhXei9sU1ZldU1vNGpiaEhDREkyWkdVWVQ1dUxwcnRm?=
 =?utf-8?B?c1N6ZXZJRzVHRmIrZmw1WGFuSEFtNHFvMXMzaDJVa2hpdjY5QnVsUmtyMnVO?=
 =?utf-8?B?a3N0VFpTTU90RUVBNkM5RXhmalBFZlNpNjJ4K3JjT25rbmR6bmVrUHIzbm5Z?=
 =?utf-8?B?N2pyUWsvVWxiTGVuSnZnZkJrRm5UMXRiSGFEV0hrdlhPNTdybTFaWEhWb083?=
 =?utf-8?B?NTdkSW9DMTJUR0ViT2FhVHRRUlJ6K3lsVkdXcCsxTlJncUtNK2FITytyWm90?=
 =?utf-8?B?M2xhbWZWU0Jqb3c3cGdPbzRnMHNJbThhUzRhaFpVc3NCaDVSM1FrYWt4anhr?=
 =?utf-8?B?a3Jqei92ZmNESnZoTGo1V3k3Q0NWaEp6QWZpTDFtTEFHMVIxdmMzNEZHL1d2?=
 =?utf-8?B?YlNtZllBQU02d0I5M0o3WHF3RHFuNS8zR0dtbTZLL2xWdW16R09RL2xkK2lu?=
 =?utf-8?B?SXc3OFNPNWdRN2RVUlFEeXoxaVpPRTVPUHF4d1k3ZVhJVG53d1VlbWVmSFZI?=
 =?utf-8?B?bHVnODR1alh0KzJUQ21ReDVDODRZRGtMNzhXUTlqVEoxUHl2eEdhNGVVOGJN?=
 =?utf-8?B?UVozdkdLM2ZkMVNacm5vT1V2L3RhWGpXRUpQNGJzZDlKWGxYNlczUUFqZFI3?=
 =?utf-8?B?MEV4VTNzdkJWbnhrWktlMHo2aTBkR3lYY2tEVTlBdndVT0lSUGpvdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2e9cbe3-548c-4eba-660d-08de4387bba3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2025 07:32:19.0688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AvnfE7W+5AKRuhIeLt7H003mtQ15yYKfjYgVXNblCSWi4rTMERPWxkqdYDZf31Nnjhwdlxwte2gbfWNv/Jh17A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045
Message-ID-Hash: BRS7FGDSDTPMUP6MY7JDCQNV5NSIIBTH
X-Message-ID-Hash: BRS7FGDSDTPMUP6MY7JDCQNV5NSIIBTH
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BRS7FGDSDTPMUP6MY7JDCQNV5NSIIBTH/>
Archived-At: 
 <https://lore.freedesktop.org/DF74FEXHESCV.3L0KB1DLDMFTV@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 24, 2025 at 12:59 PM JST, Jesung Yang wrote:
> This patch series introduces derive macros for the `TryFrom` and `Into`
> traits.
>
> Primary updates in v3:
> - Adopt `syn` for improved macro parsing.
> - Allow `kernel::num::Bounded` to be specified in helper attributes,
>   enabling the generation of `TryFrom` and `Into` implementations for
>   types with restricted bit ranges as required by the nova-core [1].
> - Add compile-time overflow assertion to ensure that enum discriminants
>   fit within the types being converted to or from, preventing silent
>   overflows.
>
> Note: 1015+ insertions are purely from doctests. Most of them are kept
> private to keep the public API documentation clean and simple for
> users. This might not be the usual way of doing things, but for now I
> don't think I have a better option. Feedback and suggestions are always
> appreciated.
>
> [1] https://lore.kernel.org/rust-for-linux/DDHU4LL4GGIY.16OJMIL7ZK58P@nvi=
dia.com/
>
> Best regards,
> Jesung

Hi Jesung,

I'm really looking forward to reviewing this one, but for some reason
patches 1 and 2 appear to not have been sent. They don't even appear on
lore: https://lore.kernel.org/all/cover.1766544407.git.y.j3ms.n@gmail.com/
