Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C344DB21C13
	for <lists+nouveau@lfdr.de>; Tue, 12 Aug 2025 06:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7349510E581;
	Tue, 12 Aug 2025 04:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tuU/P9ss";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D2F10E581
 for <nouveau@lists.freedesktop.org>; Tue, 12 Aug 2025 04:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+v+0XOrxazuCRwncrLFJbLq7ioo7+TJwMG7GLbw8S5M79IICpv5RfvdTd2tgeN/Vwj5Q9Ggx5NNB9Bl14F5Ps0E1Lp3aKeWBj6CNgvNTRKCYvGoQ+ODL/qCkeroITrsK04ZzhbGA2smJr19NIDgmgTPmV49yCLJ5i/YCCZRlWyG9OBHIcHKloY/M1RdyyRhKD3tGA5C9khDIzdb2Ue6NlrWGoz/jn9NjNFhuUnzj1ip27jvNcL2hCj9UrOtmqr25me7lH6wz1Jl5gTIP3UgsOwBqMd685n4+QZ0x2/NhZyejJ/xkIOSeyuLW7PWCwuTvqMyOdiNF0L87EgqqwHkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv0WiDhgLCPj/HGgnrZy8GEoy15CDBGyfFmK2alXLA8=;
 b=mfgZXNfie6h3A1GkuqgxQ+L9Pvg0hFxoLUBfPIltwlDKG689xRTLw3Y1B5c5nfpZxg+Jvc39gxQR6AgWjBwTMWwmfHA/ZeBEp1gRI3Aec6y2ueQG7xih0j/4wRaTr6osxmBJNHF9cHvJMbCVQJYm0I1HLpW0ZdwaMhTeqP+JVNhWZ3L3XvFpkicD7LaC6rPSQy9mIeeV30ffPmtNsZzSWNUIvEiHeqh+tKC/gBOUZ+LoAc9AQqkKJYpijCIJfahldW4TDj5AYbCPK4my/erz33uGV3BlBtGX+Ee/7SZkT/u+VQRiMyPgUgC4OzGTsF0GlCvK66u+hHD0craBJF2HVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv0WiDhgLCPj/HGgnrZy8GEoy15CDBGyfFmK2alXLA8=;
 b=tuU/P9ss6bxwOV1xqgdZrllpG/a/jjBdmtD6vLRMjLSqNS/lmRWO8JMK5NZBLz5TVOcjmXEf/G33p7Nt9m0QpNXZd7OzLUc60IDh1AZH1Hf0NEYqeMYOLh8KsP0Rll/z/LsLZxlkX6pBQ2eewUcE4Zv72MoZ39iVWiinuwsyQm9sTpqSk73RVanrof4NepK9WgbF7Tn7gDzLSCSfz4j+3jgACOpDtb5jZOoGpYHZBDmlRmKoUNygt+6uJT76bldwbpHpOUeJRKIhggiIyXF4HV60FKQ0CJRuiLzIS7piww2Bfawpn+SgOkNnOp+v551G0Ips7TVUwHlcS09TL1RhUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 04:24:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 04:24:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 12 Aug 2025 13:23:56 +0900
Subject: [PATCH v3 2/2] gpu: nova-core: use Alignment for alignment-related
 operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-num-v3-2-569d6fe1839f@nvidia.com>
References: <20250812-num-v3-0-569d6fe1839f@nvidia.com>
In-Reply-To: <20250812-num-v3-0-569d6fe1839f@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY4P286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: d32472e3-22cb-4cb0-537f-08ddd958158d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTlDMjdJaXNlZCs0U0RZTUdSY0ZWbDB4eHB3MkVPQTEwZ2YzR3FIMmRWY2Yv?=
 =?utf-8?B?ZXgzTVVBZkh3a2NEQkYrQ3pManQ0VVlGcFFpWkZ1ZEVUdXpscXllQkgzTEJv?=
 =?utf-8?B?c3dSSUpIZEZpZ0VRK0paK1RmVk93ZmtSbC85aFZtSWx3VVFnck94VUxDaXdr?=
 =?utf-8?B?ZGZveFMrQjI1c2xDS09rczZ4dVIxaUZXakZJMkhvVmFWZk1zZEpqb3VjbHFz?=
 =?utf-8?B?UGp6bElabnNnTjB2bWZiWWlIaXE3TGEzcVBzdGs1TmZ0UjBDVlBGQmJYUDFG?=
 =?utf-8?B?dXR6QUdGMlZnSjBtb2NUeEk3d1VDSnhvZ2taK29yTFRKZGwrRm0yMkxKWFRw?=
 =?utf-8?B?SHdaakJNczhEV1ZQQ2U3U0pkdEp6RW1vSUlNbEhxY1ZLM2VBNFkrWHlaTnNr?=
 =?utf-8?B?VkdXQm4zUEIzSzVjckdLajVWNEVNZFV2dURFRStUYWRSUHRRdmJUamtzTVdQ?=
 =?utf-8?B?NHNKc0xySkV6R0NBMjlBSGl4c1gvTTBtQTBiMVZmUk5EbzNaMTVjc05nbk53?=
 =?utf-8?B?RUE0SC9ldm0xR1hOZ1VJZ0dhQmtFelhITlRoKzY0bkNJMjUzY1V5RDFSR1Js?=
 =?utf-8?B?RTBnS3J2UVo1cTdTK1pJUXVEVjlVY3ZzZkFabWlCNytJQ1p3bXRyaDg5MG9N?=
 =?utf-8?B?eUhmTHlMZlRuZDhralJlLzB4bHRVbFBicXdUY0w1SzJCOTF6bVJYeUZwK0ls?=
 =?utf-8?B?SGVuc2ZMYUNiVVdacXhma2N1bVhua0pEa3p2QjZqaEZnQU80U01WLzNaSkVy?=
 =?utf-8?B?M2l1Z05jSUNPRmpwaU5ydjFlWmczYzNDRkYzcGpxSExHK0hJdG03Z1ZxbzB3?=
 =?utf-8?B?T3J2QjhZT2tUb2xrVjJtZW15b2lEb1Z6bkRqWDFPK0d5QTc5V0hDWmw1ZDJO?=
 =?utf-8?B?WTZwV3hSRUJnemJDWEJwL2VXV0VPNG1WU3lyazJKaXNPWERCTmZ1dFgxV1Br?=
 =?utf-8?B?N3N6NEpSVHlQMC9ac0UrSWM2ZGNXbGtYOFVGbU9OTlJzcUpSZVhWWjVVbk9T?=
 =?utf-8?B?ZTM5c2FaSGw5TEd5bC80YWhPaWRwZWZ2WWdHcVlIVFl5MHQ2ZmxJZ3A2bHdu?=
 =?utf-8?B?WG5mcGNVTjloR2NjczBGcExLU0w3UzVGb2VBOFlad2pGQUsxdzVmY0F5dlJI?=
 =?utf-8?B?Y3gvdEdCaC9GMXN1RE1xTFBRQmZDd3RTMmt6NktiNWpLKzB0U1d5Z1pIOTYx?=
 =?utf-8?B?Q3ZYcERQUmNnbWhkMWZsdVJ3TVljSjMyYjIyakJ2QldXT2RJNGZDYkJhaEFQ?=
 =?utf-8?B?MmxjLzFnZkVPY3FpWlMzcVBxd0s5WmZPN0pFRFdQai9DWVFnbHBheEI2K0Rx?=
 =?utf-8?B?eXRJUHJqdUp3U2JweVg3cmZBNXNNZ0xtUjZtYWhOWVdWL1UwaGRhT3ZNM1Ey?=
 =?utf-8?B?clY5VG1zV2VCRVpjQVZUeUpwemM0WEFtUUNKRjZlUjFGdUdWNmtJWm9Ya29i?=
 =?utf-8?B?MHJqd2JzY2JIODlJZnRwZG5UMlBWdEx1S1k1MzZHMFdsU2lmb0J0cFJYVHRr?=
 =?utf-8?B?S09Yb0MzK25DQzRld0xhcndZTkNnQTI4Yk90SWdnajBxb2hQcVd5TGs3VUtZ?=
 =?utf-8?B?M1NLWVphTmpzTjk2SEVWOEVDZzdLN3hHR3lDMnYxZmlIUzhOSGtwME14dG5U?=
 =?utf-8?B?Vm1rcHRramZlRkZDYkZ5aXdRQ3pyYTFBVkp4SjNoSVZZZHRjd3FvbG5lT1pB?=
 =?utf-8?B?QThkZ00zaE40Nngvck1Id1hYZmJYMHp6S2xRRnlmalRWdkRMdFVpWldOYmg2?=
 =?utf-8?B?MkxQTmdpMmZ2T1ByZU04U0lFa2kwZmdHMzBhTUNrMUhYUjBFRCtjeXk0UWd5?=
 =?utf-8?B?OEoxQ2FWZnQ1UVdyOVNRSGIzNitKNUFBWG5ZNjhFMjIrTmpUY2tVdGppTTRT?=
 =?utf-8?B?bkRuK1IvZzI0WVJ3YkIzaFJhVHZzVGlsUW4yQ2ZydVVObE1OQ2t2M1Fnbm82?=
 =?utf-8?B?ejlkLzBLNWFFVk9hSFI5UjRtWGNCV2luTmQ2RHYxc1l1S2tMcjBHQlQrNDFj?=
 =?utf-8?B?aVlINU0weEx3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWtSY2JDd2YrWkFnQXc1cktHRUdvazFrdHVBeXRXYXduT3Z3NndyQkxTZzFY?=
 =?utf-8?B?S3FXZlNUd1I5NmdYT1RxMHFxaGExWlZQMEF3K091NFV0dXQwaVJaN2hQaEVW?=
 =?utf-8?B?UzBrL1FVamY5aE4vK0p0MW82TFhtR0wwbXg0bHk4c094dHdaRE50a210c2Rz?=
 =?utf-8?B?VzZmSkJBNlRRWXFubHNMelRkbnZRelJZL0NwVHZSMW0xS25NWkRxUjVId3Z2?=
 =?utf-8?B?VmVtcWx5M01QcHVDKzlEKzBhekcrcmo5dExTdDBENkN3aEJzTVlFUHVDcVdk?=
 =?utf-8?B?ZVpNMDF0cjAzZGVBZk5xUDNRQUtsVFNTTmNOS3BMWXVxQkkwOURiVGU2cEtn?=
 =?utf-8?B?UnZsd0JqU2JSa0pvWEwvcVBHcDBkTmU3RVNMSDJKMDYwamI2bGUzZ1pSWlBW?=
 =?utf-8?B?WlYvV01EeW5QTmhEYmpWRGJvcWRnektDQ05JQnRzZHVXVkZycFVRbHNIZ1NS?=
 =?utf-8?B?N1ZvMlo0SEoyVVV1bDcwUWRKaWVHV3VKY0dwekNycW14NkVsekliOTlKY1ZD?=
 =?utf-8?B?N2FFTTRYL2NPYTROaFdrbkoxVVc0RFAwNlVoc1IzYm5SalJWZVNHWk5majJr?=
 =?utf-8?B?b1R0Mm55SmNndUxCOWsrSm1xSlFJOW9hcUJyS0FnaCsyNzIremk5L3QxaU1Y?=
 =?utf-8?B?SGUvbmIvNGFPV0xtRDlDMDIzeWRicnJuMG51K0xJZnFORFZMakxLWGFNVFdX?=
 =?utf-8?B?RDNadGtPRUhyc0ttYkF2VG5SOExLcDV1R3VIZEVmdWMrTEFhWkFBVlV1Sms1?=
 =?utf-8?B?YnV4MGttQkh3RHdDd29sTGloK2NOM0hwaUtTUTVqZHNQcE16WTFTT1B1ZVYx?=
 =?utf-8?B?Vlk0QUZVYm5iSlRDOGNoV2drdkJRbXFKTUNzekFFMUZhZFNnVFh0VGNIM0xP?=
 =?utf-8?B?S3pxTWt0NURmZmc3UnN4aUtaa1MwMWltc2hzQVRWemRRQkJNTFRSRStFZldh?=
 =?utf-8?B?MHJZQ0tGTjR1VnN6bGpSenZyNGpHQ1dRckhuYWltTzlGUWtBVTNWZ2N4U0pp?=
 =?utf-8?B?dXVsRXJLNmNDWWlZTWtYR3pkZnZhMjg4Q0l2WWhHc1BkK1p2ajg1OWtqQUlQ?=
 =?utf-8?B?Tm9QbkRKMk9FTkd0dlh1YjBxdmlaQTVSZVRvZStRbm1UQjFOMnpaNUw2Q0Fz?=
 =?utf-8?B?MGg4VWNTb1kvVVFpYjhZOHBoWitkS1kwMVdJOVZNVFcrRENreS9sL3RDbEMw?=
 =?utf-8?B?YzdSblJOdEcyelI5QmJkTVAyYTMzS0h0S3cwb1lEQllHdE9nczA4ek1EdXB5?=
 =?utf-8?B?dzlkUHlLOVJqUis0eGcxTy8vL3ZuSEZBRWRWOCtVR1dIWUNZQUduTVlDMDlC?=
 =?utf-8?B?RDdzTDRJY0doRklKL0k0bW5OdXlwaDllSVRBcHRkaFVkektaa1MyN2FJd0xI?=
 =?utf-8?B?TEwvRUJxOTRQMFYrQ0RXMUZvTkRGdVB6dnNZWlYvQURWRmk4aU1tQXQySzI0?=
 =?utf-8?B?czlVRUhiRklvaDFtakhScm9kQlUzWDZ5ZUxOa01VckhQZ0dmOEM1aU1UQmVz?=
 =?utf-8?B?N3RtajZiWjZ6Q1lJK0VGRVlicWN1Mk1VV1pBT0QxTmxUSmIyZWVBR3RkZ2Qx?=
 =?utf-8?B?VllZN1VwdlpzbDNSUGdnSWFlaDZuMmc0QzZtQlJEcWY3akFZamlaOU5TbmJl?=
 =?utf-8?B?NzFhcFZrc1JUNENWdm0wUWxpVmtSY0pOL1N1UnBqeVB0UEsraDZpZUUrK3Y0?=
 =?utf-8?B?RlZMU0lJV1ppSmFkempObXFwVCtOR2ZTVDdOM0tYMml5TkI1bHNqaWN4eXpE?=
 =?utf-8?B?clBOeWdjUnNRakJtSTQzdGhTOEZCTktobUFyRFhMbk5STXFyekVtN2pHRW9V?=
 =?utf-8?B?cDY2YXlvWllDSU1YMTN1QitGeC9rclVVbnFwQWtiSVF3ZkJoWElUeWJGRW4w?=
 =?utf-8?B?aTNtYXFacDhpL2FrOUdvcTZ6ZU83QkZtVU9lckxYaTZNZU1JVUlEL0x3bTl4?=
 =?utf-8?B?dEpoU1owYjJ6dkpTUWtISlVzL2xpQ3Jhek9adDJVZC9VTGpRNGFDQlJzMDkz?=
 =?utf-8?B?MmV3UEsxV2NyUzRvN0JCcnBJcU5CZHRBaVZLMEl6MzB4dkZpMElEZnB1U1or?=
 =?utf-8?B?Szg0N0pmWUVHT3kwb2N4R0Zsd3d2V0RRT2FqNm10cnFkKzdOUHl3QUhQU0Zm?=
 =?utf-8?B?elJCYUZDODFHcXhxaFNKQUlpU1crM2JsYVRPc3ZXU1haYzhxL3BLVSs4eDho?=
 =?utf-8?Q?iyWLnLlDcB3612GAU6BKinmr1N4D1KMwCl+NGe8ruD2s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32472e3-22cb-4cb0-537f-08ddd958158d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 04:24:09.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65SRcMNhVndCdY0TdDflq6h2O+v7syCKd1BfzhenxGv9rmtoLDVy6lzKik8oHWKdmMZ5gQBRE8Ux9xAtHbakIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677
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

Make use of the newly-available `Alignment` type and remove the
corresponding TODO item.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst | 1 -
 drivers/gpu/nova-core/fb.rs          | 6 +++---
 drivers/gpu/nova-core/vbios.rs       | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 894a1e9c3741a43ad4eb76d24a9486862999874e..8fdb5bced3460a3971699df79ffa2c69f84b2735 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -147,7 +147,6 @@ Numerical operations [NUMM]
 Nova uses integer operations that are not part of the standard library (or not
 implemented in an optimized way for the kernel). These include:
 
-- Aligning up and down to a power of two,
 - The "Find Last Set Bit" (`fls` function of the C part of the kernel)
   operation.
 
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 4a702525fff4f394b75fcf54145ba78e34a1a539..344cb5d2d919c456212d60d7210667de8041f812 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -3,6 +3,7 @@
 use core::ops::Range;
 
 use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 use kernel::sizes::*;
 use kernel::types::ARef;
 use kernel::{dev_warn, device};
@@ -130,10 +131,9 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
         };
 
         let frts = {
-            const FRTS_DOWN_ALIGN: u64 = SZ_128K as u64;
+            const FRTS_DOWN_ALIGN: Alignment = Alignment::new(SZ_128K);
             const FRTS_SIZE: u64 = SZ_1M as u64;
-            // TODO[NUMM]: replace with `align_down` once it lands.
-            let frts_base = (vga_workspace.start & !(FRTS_DOWN_ALIGN - 1)) - FRTS_SIZE;
+            let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
         };
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3a6b1c374c1e0eee2509eb8d5660c..680d4d961593d7cb88bdd58c6c1dbf77b51b6d7f 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -10,6 +10,7 @@
 use kernel::error::Result;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::ptr::{Alignable, Alignment};
 
 /// The offset of the VBIOS ROM in the BAR0 space.
 const ROM_OFFSET: usize = 0x300000;
@@ -177,8 +178,7 @@ fn next(&mut self) -> Option<Self::Item> {
 
         // Advance to next image (aligned to 512 bytes).
         self.current_offset += image_size;
-        // TODO[NUMM]: replace with `align_up` once it lands.
-        self.current_offset = self.current_offset.next_multiple_of(512);
+        self.current_offset = self.current_offset.align_up(Alignment::new(512))?;
 
         Some(Ok(full_image))
     }

-- 
2.50.1

