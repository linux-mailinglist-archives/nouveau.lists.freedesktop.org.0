Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515CB48C9A
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 13:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FA210E4D6;
	Mon,  8 Sep 2025 11:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ll47BDBi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC9B10E4D5
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 11:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6j1hJqs1ynd55fBA8snv49yVrdmbGsl5tB0Tmx+VZpewzkvLGO/RnWJp0+DoZ5mdF8LPT+u35+PUcO4Vz8Id0/LtIN5vhfKtgm1N1WVBf/Y0AjdB1J6bG25rMYz+bfRrkanULfaSyI1L/QZXc6A+SqMH8KiKWp/YPG8uoufEJX/DUi4sGUgBvyWd5R7DOTMCgoJO20DIyxoT5Dp2cdR+rtcXdi5fkUOFU9tfYUlgqsiwjxgFimMm52I+9ErmCpk7lLJq9ltlph4cg1WVxLDeZYy4uWQBfnJGJrSmHIuzj/N5QKG2Nbj9uNdmj+b/d+b6tJXpSUfKOkvcQ847sID7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJQCyjuFbcGQknducPPltqn2j5w4o4YI8JXj3tkeoMU=;
 b=d5itW8X/9ZXko0sSzPcLRDpjcX8C3F/Rn0rVUcfo6DMKcYhjunudE+iEA9T0aJ417cDajxf4EuBdblib3kWXF+HXZoMrgTFMbVPzJOCPoC7ei4MFV1Q45jR4pNRIKSqXfemZX0Hn5Ah6h9vakiPqEoluv+jx/FyZm5rYo4uaafBG8776UzPEk1QlMQByqC+e6t1IkHVVfF8QGscjEiMDJG1jr2v35/Rr/OSxTmSM5IEFivnjniQPvr32u8BO1jCKxCaYGFHAzvMudRGS4wH7TxK+PAvUP0apOux4lvcz+ttEUCgwmo6ypb7Y/4iDu54KRXfTvfkxt0HiI1UFe9Tt/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJQCyjuFbcGQknducPPltqn2j5w4o4YI8JXj3tkeoMU=;
 b=ll47BDBiotowzPfTaDA0G7pZasMBQoOjsJO/q+ODSMtHbQm7b4i4zsNWXNpnGqJk3WuyRfG4xbvtDrfvGHlWXg3/81GJJ0qIdJ/ti8hZPcbTxYwLgNW4HEuYsm4xV+ErImNJWFz7YB/PFAtPDNKML/Z4S4g0d56ew8ltYx/CSlJZxJ+xC0HsqxMPMvmBA9VdQyMuuDaYhlFMTf2MFdzoH2HGWqpezLA0SzjDTTeKoMP1kj9zJzqew7KyRowVAPYDYM2XsIFSoYs3rubbQLP74V97tJd7SooOSOAGeTykNVUV94BzGELTKP5BZ9hJhqPOlrka8vQmiTPacFLlUYh8SA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 11:55:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 11:55:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 20:55:15 +0900
Message-Id: <DCNEDWOWA73X.W2YXXSB09J2G@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/2] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
In-Reply-To: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: 40acc743-d44b-4c39-60ac-08ddeece94fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUJ3eHh0QW5UVy9TMUEwb3lTWUhDYVpVejY3WE9Xa3JNeldBOTZJQ3MyZGxr?=
 =?utf-8?B?eTVMUnMwSkQ5WEJLVy9qV3lYT1NqeFRsWDAxWnJwUjc1RlBUUXYreDVjaXVt?=
 =?utf-8?B?Rmk1NW44NWNqc2hiZW1MYks3N0dEUGI3aTZ2bkMxRzFweU5LWHh6V2hMcmFv?=
 =?utf-8?B?Z3JLTU9HejMwYmNQTlhGbDZETG9PNjdhVTRDcUdlSWpQRG1uRGdMMkpCS2pu?=
 =?utf-8?B?TlppTTdnOFJZbjFsWko1OXF3dXN3amNtalNWUWF5R29CTTdSYThQOWRScDNa?=
 =?utf-8?B?WEIwb042MXM5YTFLRE94UVVITkF2Zkt5NnNBejhZcnlYZEx3VXYwK2R5aHNR?=
 =?utf-8?B?dXpLTTFiOExBVndqTTg2bnNJcGFEZGxEcUpRUkxwb1RSN2NjZ1dlTkV2OWg1?=
 =?utf-8?B?T0RiWDdieU9SZ1ZCWXU3ZUdJZkpyT2I3R3dkc0xDUjBwVXBqY3RqbEtqV3ox?=
 =?utf-8?B?T3YxZHFueWp3M1NwSXF3THJiayt3L3VyR1BYSGpnQTRvWDhDenlYYUdYWS9k?=
 =?utf-8?B?ZDQzcHUySGxxMnFrVlhxL0wyaGhIcDR6aVdLbzlLV3JVb2RqWVFpamlWak1a?=
 =?utf-8?B?ZDd1NXQxVVFyVzVQdTdpWWhwZGtTb3ArcGN5SjQwL3RXZTA5Yi9aMXdrRkVj?=
 =?utf-8?B?dVFLbUVWWWhWVmtiWUxTbzIvQy9oQlBVNzlWa01BS1ZWZFNld2EwRldlUXhS?=
 =?utf-8?B?Rm00Mzgwd2hFd3QwMHVFSFJGUHNQQWYvalFwaUROMjFUQjdXaEJIbStaN2FK?=
 =?utf-8?B?Mit3SUpwK0ZtcUovNloyYTVFdXRrLy9veGhJRTNURGdnY1BPUXFzN2lJZXRV?=
 =?utf-8?B?eFRXM2NOVklJaDNUSmN2Uk1BYm56RzdkSzljNWNObW1ZczMycHlYZEw4eDB4?=
 =?utf-8?B?bUxDeVBlbVM4UzVRdkpqdFJtYlBqK2JFU1VpZ3ZKUk9wbTBtMHhFZTR5ay9j?=
 =?utf-8?B?SnEwWEM1bGtZMXlkbko5cDFOUXVoc3hSZnVqWWlhR3JYYWRaU1h0RU1vamxl?=
 =?utf-8?B?ZlNHdUVHeEV0SEdiT05RZ0tGRlZjUEJqSmlPNlVtQThPdkpXQ0ZzQTRidkU1?=
 =?utf-8?B?YlZCSFhVUU1QUEF1RlR0MDlnRStXNGQwam5vcWhLMGovOUNmcUp0ZDNqeWpR?=
 =?utf-8?B?MnVoVmRpR2tYd25tcS9BcWROQVhEUFdwVWkvdlhtOW4vQTFNVWhWaG94cWx6?=
 =?utf-8?B?cGJhTE1VWFlhZjBZZ1p3aW8xazR0dkFGRDA1VHJkTWU1d01WanB3YlVURWRS?=
 =?utf-8?B?am9KL0hFZmlyNTgrc0NQMUxXd2JKa3FaSUxmMENUQ3FNcUxnOHlGOTlrUnFr?=
 =?utf-8?B?MDV5MkYxQWZyamtWd2lPRyt1Znd3YThnZlBaYXNhWDlxdXlwbDRNdk12blZ1?=
 =?utf-8?B?MmpPVjZ3TWtmYU1McjAzc0laZUFKc1Nza2JuSmMzOXZIcGc5TFNJcENWZkZC?=
 =?utf-8?B?T3pnT0JhSG9wV2xJVXpERk1xZ0haZi9jSk5NU3V0Rm5XcUxpRVl1QUVvZWJQ?=
 =?utf-8?B?dVJ0VkZ0NlFNM3lBM2lZU0dHYndnZGJ1cmc0c1kwbDJBRUVnMUp2NThlNVZZ?=
 =?utf-8?B?TXBRbEV2czY5N2cvZFZacExVSkY1NjRsOElxZ1drRTVxYzVaTzRlL042di9D?=
 =?utf-8?B?dmIwZlk3SDB1N0xtTEZxUFVWU3dkWXF3ZDJMdzRjZUNXNHlpSkdoUVJGU2tn?=
 =?utf-8?B?cGREbHFWcHJYcVIycG5TS2ZXMjJIdklrSFVpZUlNL3JZczhuU0kwZWF1NGlO?=
 =?utf-8?B?cXpnN3VRTTl1U1FmZlRqeGUwZEdLaU85SU5YQ0JDOFNJL0svUHE5cklBb2NB?=
 =?utf-8?B?N0NSQTN3TlpqZWFnQXJ3aDZlbHJIeWgrK0FtRkIzUEs5TlVnMkZpY0lUY1dI?=
 =?utf-8?B?OHJBRjdQQVVSYzVya1czZlR0ZDBBUlpTYldiZEdYYXp1U0liL3FCZENuQkFl?=
 =?utf-8?B?NW1XNnpWQkVVeGpMemI4cUdqclZia2drbGRxb0ZDaVBhcHpZYnFUU2pwR2VN?=
 =?utf-8?B?Ny9vRzJBRjBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cStYQ05FMElEQUVvRFR1dVFiQk50WDRLMWNRS0gxT2Y5cllrNmNsZUpGTitB?=
 =?utf-8?B?ajV2UXpsenU5ekV5WVhZck5aMHQwUHNRc2pEQTU0RnlRSVpXdkI0UUtBY2FE?=
 =?utf-8?B?MkhHNVZGSXZpOFlOZ2V3ZG1qa1Y5MERHeG1NUWowQ3RBMW9XbEM0Y2Z2cXNv?=
 =?utf-8?B?dTJhZ21SUjJkVTQydGIrblFUdUQrTjd5T1VlYWJuRHE1bTJWZU5aeVNNTFlt?=
 =?utf-8?B?b0s4UUE1TXUrOVo4M1NZZFRJaVBNM3plSmpXbEQ3TkhIYkl6VXphWlIrZ3hN?=
 =?utf-8?B?TVkwQlkzZzNmVkJGRnEzdnR1enZBdFEzbHpQWmJzMHRpZHRON2hmWHVDMkVu?=
 =?utf-8?B?VjNxZGo5eVB3QkpMaFdod2wvazY1dnV1eUpDK0grN25TTVRGWkZkcytxeHN6?=
 =?utf-8?B?OVdBOU00YWQrMXYra2VaM3UwWWxUMUlBS0tkbUlIQ0wyL0tJMjRUdkFnbElv?=
 =?utf-8?B?WEpsWVV4ZDl1T0tMTFcydjRDTVB4REowQlpTbjcxQ09uTklGMS9VTldhQlA5?=
 =?utf-8?B?TFhQdEE5OXgzUll2NE4rZ215eEVBc01pR1Y3TEkwTGp4bW01c2FxM3VGRDVx?=
 =?utf-8?B?cy9kN1d1TmxZMFJ5UnpYQXZSamUxeldXUEN0QVBiN3E1VjFVWlExSlVFZXdJ?=
 =?utf-8?B?WjA0aEtBVnc3R216aFNtVVVnZVdKYlVQdEljSWV6b1FubllBMjgvV1cwNEgv?=
 =?utf-8?B?dGNCQjhoQjFpT1J3RmQ5M0VxTG5sendTTjNUK2FnZjU4dkdnQ0MwQUFQYTJr?=
 =?utf-8?B?dTVLVlcvSEkvMjZyT0x2bE9YbDRmbkVZaHNVZEwwb0NIaXc4T1hDaU1lWmQ0?=
 =?utf-8?B?d0cyYXdxTmhlUkp4N1EwWVZ4cHB6SVFlMHZ0SzhPZk5qQUJDYkZ2WUVVWm9E?=
 =?utf-8?B?MzV2b1plOFQreTAvL3ZFcGlYem9qTnFKZWZjbFpLOEN4dDB5akxpSitmWFdk?=
 =?utf-8?B?QTFzY1RIb1ptejRmN3JveWxiZlNSWDV0ZVFUNzVrU3JqWi94TVpXU0c3MWpJ?=
 =?utf-8?B?eFUrVklEN2xnNHRVMUQyRUdjTDFKRUM0eGF6RkRZY3dxV1UxTG9oaUYxa3hK?=
 =?utf-8?B?WEQwU21JYnR3WURYUjRSNjFEcFI5Mld5Rmc5c0VQUnQwWnovcWlsSGtOUnVa?=
 =?utf-8?B?Nk5GZlNnNXNZWk9odFNTdSswREFFb0dZdkVESDZ6TjFPcisyV1QzWStjTXpj?=
 =?utf-8?B?WE1vb1NMeXJ1a0NtTUdITkxIcEZZKzdhakUyQmJZbTRQVldCNEdOQjg1RG9Z?=
 =?utf-8?B?VGFtcVJlMWFad1paM3RzeTIzbmxMKzBMTWoxY2JOb2V1eFRaaE5PR1loN3BN?=
 =?utf-8?B?R0JTUHdBTHQwK3BVUlc5MmZmN0YrUU92Z1lRL3VsZmRCODNhUGptVnh2SDJU?=
 =?utf-8?B?OGk4dm5waWh2VCs2UDFTTE1QUnhiQUU0dUZvbld6a05CVXZOdHZLajc1enRQ?=
 =?utf-8?B?cDNScm5ic05GUE5HelhEUmhQNW1mL0lWMFc5VjVpS3JlRm8vb1BnNDRPdFlM?=
 =?utf-8?B?WDVvUDZOWXdiVGExTUh0RjU4b0cvcE1iQzFFVGRaZlJNVSs2VFlBd3kzWUNy?=
 =?utf-8?B?RnNJVnVTdW9WS2lGN1p5a1JPV091amtaK3lLRmFzRGh0aUxQL0ZMK1hxMWZT?=
 =?utf-8?B?TWFjZENMK1d2bktEdzlDZDYyMHRJMWxFQlpnV2Z4eHh2K2VqUWpVdW5iZmgx?=
 =?utf-8?B?NHVmNTVJK2ZNM3EvM0Z1ZlV6TXpVVEM1bkdWTkp0TytkaUJManJ3eW5kRnNO?=
 =?utf-8?B?UGprWXNvVzd1UHhnSTVseE91UlExRmQ3RTVhNFFBcFVVSXlKcjg1NndscVZ4?=
 =?utf-8?B?QkY3TTZsNlhmOTZJcjczWHJmakNBSTR3UTJSRi9HK3E0QmFIdDdIK0dYK0Fa?=
 =?utf-8?B?UCtjNE9pNVA1OHkrY3Z6b3g3eUJQVTNpc0d3TDNWaGttV01zcjdyRHhsME1a?=
 =?utf-8?B?S3lvM1RsUzV5VnAvbUJWdS9PNDhmZ3g0Ukt4MEdiMFVqcnZ5aDB5ajVYQzly?=
 =?utf-8?B?NjhiS25RbDFyd1hOZStqbGlLUTRtb3hJQmN3OU90UGs2WE5JdHpwZk12NzU2?=
 =?utf-8?B?djlNTE1vTnA0ZU9NNThjSnd1V3dIOTlPZG15aGs3WUFQSkdVNENtZFMxdktk?=
 =?utf-8?B?Mm00RE9tRkQ5eXhiaFgvbTJNTlA2YVgrSy9lYWNRWWtKWG1WS2hnRHJrMEZn?=
 =?utf-8?Q?jtcJAKDfvPbzjkyo+eTf/jFK3DysV7R6bG6kCPOuHymO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40acc743-d44b-4c39-60ac-08ddeece94fe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 11:55:18.8771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgpG9/3OJAik6g74LaeJK+JS7qPofl3//gwJ2Omta0D/xcfUN9Zr53jgflvVr1NwRmNb5PV/ZGLnIexxK2ZtHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099
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

On Thu Aug 21, 2025 at 9:42 PM JST, Alexandre Courbot wrote:
> Basically a resend of the previous version, plus fixes to build with the
> MSRV (1.78).
>
> The first patch makes two additions:
>
> - Bring an equivalent of the nightly upstream `Alignment` type [2] with
>   an identical public interface,
> - Add a new `Alignable` extension trait that provides a way to align
>   values up or down according to an `Alignment`, and implement it on
>   unsigned integer types.
>
> The second patch makes use of these in the Nova driver.
>
> [3] is recommended as a dependency, a small cleanup preventing an unwrap
> upon applying this series.
>
> [1] https://github.com/rust-lang/libs-team/issues/631
> [2] https://doc.rust-lang.org/std/ptr/struct.Alignment.html
> [3] https://lore.kernel.org/rust-for-linux/20250808-falcondma_256b-v1-1-1=
5f911d89ffd@nvidia.com/
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Gentle ping for this feature, how are we feeling about it?

