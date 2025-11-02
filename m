Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C955C288ED
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 01:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D1B10E04D;
	Sun,  2 Nov 2025 00:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ej2SAkl/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0110E04D;
 Sun,  2 Nov 2025 00:35:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxexHJpVc2dw70rboZujtVRcrR877ZTYVdDvpWzz4vWpahta3I7fg6HNBD+V7UIhFbnRwDKxnrsZDr2r5xHWWa+tbVOTFQEWp7RJZZtp/gE2+Ott2l6D6p5iGjdEx6PE0JcNsCsKI4oKJXpMM+uVl6K0ZjE4anKf8aq0uxegWb05Q493iVI4V8uS5/c5OPvit01Sx6qmUlJEpLSjq3rCgvEKzgBJr+YfkFc+VriI63L9UG1XetCmH5GNEAPPqW1mOVK4GEGYOyRt+4dMi6mOsrbQi6m6eTdmghu5LI3qCv69g2j3zUN0eV5bUa1gT/y1+Sio/LA5k/OdljmkvxlRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nlq0JSPfi712vwOpCvUa35Iod3RcFxY0gEfMDYK0VBo=;
 b=bLURlz8L43FYUQfTLSrmsLf4M1tTRwMjrWGTxMDcekYPXYAP6Ph7bxLxIHNubeJ0jnV7oFSSqp0E+N6VNWHwvmGI3q+SyGsZE/ErLv+l9b0urf4MiH7mVxINVfGLxZ2D9WALBk4f9exe8LYuMv6nE5qIAZZlItpfWWCDf7GLfT0FQoHW8IRAtgCTwGjAYCYEHMGnpiKsxW057BYIPDBn13/rsnOJcEffsCsYWuzmE0VVm2Y+ep6BqRt7DCrgzfQxrSFg4/M3u3xqOuB6wu+hUdgWhfPQx6LWNC5AwyJ1MHI/fssz439VQiiNhzxopBovcjAJsnmBZgD7ypgNQay8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nlq0JSPfi712vwOpCvUa35Iod3RcFxY0gEfMDYK0VBo=;
 b=ej2SAkl/JieBJi+mc4kUI/Csco1AFYIFmwNcxyEXkTIwXB8ajntOd8DH9vxTaP1qYVPRADHlTYcQa/qbx3a39LxytwXKiZzYxU+D20NRNygK48UMm1OZKIRZJGqX0P+clsmS6Mro8xUD5oZ3aoDbxWAEBT3egTD1nu0Vwsle3CRPS73i0L40JngeCOrbPmx10GqheAkNI6sstLnniPIoW0Exont3RQCPUN4wrfwXZgz/syLEbPj8Bb8xs/WRwFyKJYwDChRDPtfk8WSXH9XyczqHRzNnoBfWfv1FYhf61Zv2jvSgbjXxCoTPgKrTe5c8UMY3oCptYIVutdZvYDQ9mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 00:35:33 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 00:35:33 +0000
Message-ID: <64018a2d-1c0c-4851-95d5-989f041d220d@nvidia.com>
Date: Sat, 1 Nov 2025 17:34:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
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
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0028.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::41) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: ee446e40-67f2-4d42-4559-08de19a7bb71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk8rNi9nODV0QWpvTEt3cjNtZWp3VDEyM0xWQWxyTFYzWk9mTCtTZ0d5ZTJy?=
 =?utf-8?B?Y1JYK29kd1ZKTm5oOUs1SkV0VlFSZ0NiczlPRm5ZWHQvNS9yKzVEallYMlRG?=
 =?utf-8?B?VDFBZnNIb3ZzcXFaWGtTemVuaDQ2VDZwc0NvNUlEMWRMN1drL2QzbnNsZGky?=
 =?utf-8?B?ZEdzU3FCK25lS0Q4M0ZNM1daZjFQd09SZ0ZrZVYvL0VqeGVRbUFMbytMRjd0?=
 =?utf-8?B?dTlkUG5keW0zd3NtRm1iNlB6L0pEdjNsWW9Qc2RWZEdVSlkwLzB1ZzZ5Q2lL?=
 =?utf-8?B?enNuclJwc1NLSzFwbExZeVJJQVlNWWg3VHVCeFNwbVRaVTBYV2p5U1BiUDJK?=
 =?utf-8?B?N1VlQXQ4Yk1xNGc1QTdHNFo2TThiRDN0K0FoTlhTNzRRWmtmTEdOSzA0NTZV?=
 =?utf-8?B?NmNpako4U1U5Z2RaUVU4cnhjb0ErMHRvK0h3VTFnQmt2czlaY2RsTFgvYnIz?=
 =?utf-8?B?Z1N1ekRnaitkMlJvT0RyTlQ4dnB0N09SejFZWmlIUlVCU2NQWkI5S0sxK0U4?=
 =?utf-8?B?d1ZCNHc0VTF6ZVJmc003aWc0U3R0dlR5SERLbENsS0RpWUtBa0JDY0tPRHhj?=
 =?utf-8?B?TGZRdE4welBtY0YrbVZSZUFqYlJSWUg3ZlhEZDU2MjA2a0ZHeVJCaloyZzNJ?=
 =?utf-8?B?QzJLNWNpbHU1S1lFMXJ0YUFlNGRlcitoWFlBVURpRlUreEgrbmJpemsvM2hC?=
 =?utf-8?B?cVFzNjMwbWdvaEx2WFNnZWlSOGVSZkFvdkowWGhnVldEdDNLM2hMaVNEQ1VG?=
 =?utf-8?B?RmR6NXZoRElOaWUzaVNHSDR4N0JGVzNaakVrNFpnL0ZtVmY5b3g2czdwZ25I?=
 =?utf-8?B?cGp5alFXeVlxR0Z1ZzBXQVl4K0d3YVpIcjFpTDArQnBXUTlaS20wSWNtT2VJ?=
 =?utf-8?B?YmV2eWp4eWM5bVhlWmVnbVN5eUlPL1RnZ05jZWJoMVQ4KzdGQXNXWjVKRTAr?=
 =?utf-8?B?eGFBdlg0dXdubUd1UExFV1Y2ZDcyeWlSd2VtdEtzVHJJUkYxUHBBVVo1WjJp?=
 =?utf-8?B?NzJzMnBlajh6aFVuWlZSb0JCcDJ3WFQ5eE83YWRhaGtRQXdvay9QNlJHYzFB?=
 =?utf-8?B?VHJIekdxbDlpbTZwcGtiZjNuSmFHaTltemR6L0V6S2JIbjRQenJoelRXakNq?=
 =?utf-8?B?WHE5MHZ2aUZHOE5CYytiTUovUXVkYzFFSCs1c1QxWGszaE1KNlg2VFFCWU9S?=
 =?utf-8?B?VUphZ1hZZ1JvY2Z0RkVZblkyeXdkN0RlNGtGVEpiQitWbC9uMmw0dlg0ZkVO?=
 =?utf-8?B?NXZub3c0TVdwd3JLZUtTUDh2dkJwN2t6NDl5WnozckhDd1JVdU9leGJDV0Jp?=
 =?utf-8?B?K3BlOWFZWUxta3ZaK3FMczlhTmVSc21NSzk3TUYwTGpRWEMvTzFYWS90K0Nl?=
 =?utf-8?B?K1FQSGVudzRCcUpCQ1U0cUdvaE4vNzN3d0VFZVhjRnVYY1VjTHNZV1dCSFFJ?=
 =?utf-8?B?YXFUSXBFTEFGYlc1aHpmU2xDdDhkNk5QWjZqYzh2bDVkRmtoL1dvWUVORmFX?=
 =?utf-8?B?L0hlVUMya2tpdGQ5cFgyOWpiM25Vbm8zTTBjVkY5SU5NL2VsMitpUHJORGpo?=
 =?utf-8?B?bURCclFUZmdKNEttWmxnbnFkM0NwejBzR3FwS1l6d29sZHRVN1BIeTJldm1Q?=
 =?utf-8?B?RVdHeW5mTm85UllQd1NQMEdpeHNIVTBGZkJCdUtoTVYyU0pxL0ZJaUo1dW1H?=
 =?utf-8?B?dzBrNDdhUnVBaEVWbS9uc3k5MWhJdW1mTUEySys0VFB3WTMza2cwYm0zYUtv?=
 =?utf-8?B?OFdDVktKSkRvMFJXbmttMUl1ZkVqSzZMaXBrWElNbnhLWnhWaW1zM1JDRThR?=
 =?utf-8?B?R0VOdmFhdXBCN3JXMWVFeFpjaitDSDVsS0EwMnExMjE2UnpYeGtVeDU0Mm9l?=
 =?utf-8?B?MXFWSzU2SEcyTDdTU0FqbiszdmNLWit2bkN5aEs5aUJ4UVRCVE9FOG5Ucm1X?=
 =?utf-8?Q?EjNJo3LhJLStKU1/ofYViR4TyYyW8FY1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkNLbUU1QkwxMzdLOGVoSngzZ3czbDUvMUhiT1cvYUNrd3F1clhyOVRDUFM2?=
 =?utf-8?B?MEx6ME54NVhPRVNkYTI4QXpJQUdPbkdkSEpiaHJnQ2NwY1BtcStYcFpZTE9X?=
 =?utf-8?B?d0V0cU9sbFlSZHBrcVJzczFaQnF2c2owWVJJSlQ4aFUyUUpOU0s1UTlKdE1J?=
 =?utf-8?B?VTY0ODJmV3BPdEFLZlBtbHV5S09hZ1g4dWsxUGt5VG0yQzRDV0dnRERqdE5R?=
 =?utf-8?B?MS9hTVlxWTd2Smk4OVVNa1RWWlVyYlR4K3g2bkE1ZmxZZC9BU0xib2FjalZw?=
 =?utf-8?B?SDhIbitiZzZ3MDBtOE1GRStQYlJ6dTFCTHA0ZnRNTmtBT0t2QWZLSThVdTZZ?=
 =?utf-8?B?NEsyK05aV3kxbGF1YWxCb3JOTTBsR0I5SXNJWEs4MVlmUGVlbmhJZlJlUk5o?=
 =?utf-8?B?MWswOGU3a2tZbncvYjBrb3VnL2xFTnJ4Mk1qemFlZGtRdXc5R1RNM0M3VnZl?=
 =?utf-8?B?VUhkMldQem9SN3k3aFpFbG0ydGR1OHYvZWg5dVFITmZnbzZxayt6RE1SR244?=
 =?utf-8?B?OGlreWNLVjI0clUzVndMK3J6U25YQUd6NXBkekZVWml5anNvYXFVSW1IOGVJ?=
 =?utf-8?B?OUhyUkpKcGRiekd5VXZGNFBxU1pGODFycVBjdW44THFsMTlMZ1JaU2JEQUJJ?=
 =?utf-8?B?MnUwR2JRL1JLdUk2SWF3L0grRjJLR3RIZjVlMkQ2cnVDMS95ZzA2WE9mVTZF?=
 =?utf-8?B?MXZJTytONzRDcXdCK3puQWtmaW14TXA4MUNzbzBxRmNyaWRqYXB4Yzh5RUVN?=
 =?utf-8?B?Wko0WHVQMFlaOVhTdTRGNlNoa0RtaE5HTDBnMDduVkI3c2hPLzByd04va2xn?=
 =?utf-8?B?TEV1UlNqREo2YkJZb1cwbDk5b2VHOUR3ak1vRWZveUJUU3NKK3NHVHRFZUQw?=
 =?utf-8?B?RFY0N2t3YnlSV1FRREYrajhnUExUNGNLYStSaWljaUZ0eWF5bWloTStScXdE?=
 =?utf-8?B?M3I5U2E4OWhKeVRYTU5VcmwrcnZtN1hydEczRCtNYngzRjRpSFppdC9JQm90?=
 =?utf-8?B?TlgyZEtZREN2M3FZYThXck04UkFkbCtoY2xWa1FIcWNjUm9lVmhQRnFGL3lG?=
 =?utf-8?B?M2lycEk2cmhvZy91ejVTTHhTVUNXSlY4UTBFMmJIN29NUk1ubEpoYnA0dmJZ?=
 =?utf-8?B?T0I0cU1IT04vUzRucmtMQTZiRVRteVp4YVJYZGZScVBJTS92QWcwM1ZTUDBL?=
 =?utf-8?B?Z0xFZmwwYlRRM1ZTTEVvVllJKzdEaDk1UWJ1V2hZM0VnMXp2RS84UExHQ2pK?=
 =?utf-8?B?cGRncUhMUTRTdyt4UENTT1k2eXZ6NGZ5WTExOTF1Q01ZcjRVNC9DTEVUM0p1?=
 =?utf-8?B?YlNTVmJuTGxtV0ZBOEFoT3cySlBmdEpkOWNQenQ0emZjT1BPWEJWT2NUSSt5?=
 =?utf-8?B?L2M1eEVUbE5mUXQ1cXlxR0x2MVMxYy9zd3E5ZkhIZ3hDQ0kwME8zVEhCK1Zi?=
 =?utf-8?B?NWtCNXVPRFpxQ0szWm5uVlV0NVV0TTZrdGhTWG5nTUJzWndsTGgyMzBjOUlV?=
 =?utf-8?B?QlVCd21JWU03UHB5UlBtWEt5MkNvdk5zdzhMa2pka3Y0bGFsYWFYZFhRQVM5?=
 =?utf-8?B?cGlBb1ZZQ2xpenA4RmVnakh0dG1YVXkwSWxaN2RNK0Nza2l0N3NZSUp3dlY2?=
 =?utf-8?B?Z29ZOWhNMmFQQWt2dDNBaGc5Z0VFMUg1Zmtyd3JhaFZKN1Y4bzgwdzNlQ2xT?=
 =?utf-8?B?NzVuUjU5YzhSZGxGVldBUG1YRGEzZ3hNYzJVREpDTDVsKys5dWlxZ2Y5YjY2?=
 =?utf-8?B?U1VqbklNUW93RHRUbjdydjRkcS9FOENuUGlNWTg0N0liK3BQMlhCNmxxczFI?=
 =?utf-8?B?c3JtSFJ5eW1ZbDhiS015eFA5NC9EMmNid21RNjNGNG55SzBSMVMyY044ZnNH?=
 =?utf-8?B?RTBmMmt2OE5XaFp2dlFnZDE2NWVjNjhYbWxZSXFqMmNMdE1hRURMMXF0SlBR?=
 =?utf-8?B?RmV4UXJIa0RsYldnbFQxUSsvVTVHYW5xaUkwejBMaGdKMEN2OS84WW80bVRM?=
 =?utf-8?B?TWJ4QThTSXRTOVdXSUo4anFYZzFmVXBsUWJSZnQxY2NZRlNPUUF0SytSQUpo?=
 =?utf-8?B?WU55QjRQVnI4aWZ6TXRRR3hIVmgzZ0twcHF4YTMyWU82SmxCbnNKKzdrZmJx?=
 =?utf-8?Q?wYcD1ybTDEp2yi5APcqf59veV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee446e40-67f2-4d42-4559-08de19a7bb71
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 00:35:33.0489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97VR+AmhpNghIdsqe/DN2TdCz+2+pTCaYix2qA5cVg94VuIiOxPD2+7tY5LEWX2ReVv8dlkC+9gD4uX1TGv+Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421
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

On 10/29/25 7:05 AM, Alexandre Courbot wrote:
> On Wed Oct 29, 2025 at 12:03 PM JST, John Hubbard wrote:
> <snip>
> This allows the implementation of `NV_PMC_BOOT_42` to mirror that of
> `NV_PMC_BOOT_0`:
> 
>   impl NV_PMC_BOOT_42 {
>       pub(crate) fn chipset(self) -> Result<Chipset> {
>           self.architecture()
>               .map(|arch| {
>                   ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())

A quick note: _RANGE() and related functions are (I think?) deeply,
madly undocumented. Not only is bitfield a macro within a macro, but
bitfield itself leaves the user with only the following as "documentation":

    ::kernel::macros::paste!(
    const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;

The net result is that those of us who did not author or carefully
review register!() and bitfield!() are going to have a rough time
using these facilities.

I'm not sure of the best way to add documentation here, but just
thought I'd better give an early warning about this.


thanks,
-- 
John Hubbard

