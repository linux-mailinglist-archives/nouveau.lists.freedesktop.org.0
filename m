Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D927AE71C3
	for <lists+nouveau@lfdr.de>; Tue, 24 Jun 2025 23:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F4D10E179;
	Tue, 24 Jun 2025 21:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nqZa3vp0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037F410E179
 for <nouveau@lists.freedesktop.org>; Tue, 24 Jun 2025 21:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzGWyJm4XJi3MoZC7Rqm5TgxhgII3u3yCCA8oJWbbhd9HAR0+gnvlXcY6XRcszEc0hLQdyg8/8Ekj9q5xbVeisqwXvqPwHNQNno4ag/y/PUCyxEwAVNTIwnlcL3B1tW7kle56cHv1qe83f3Hye7LVo8+6cG9QErgLr8Oz7AsUx4LX78ULmxBfqXWRAhxkrTa1qeCNTsR7hM0ufe+BedrBsJta7WP8MFB/VIW/N1M0Xi1J0HY0ZWjR6frOG0Wx/NWbGyq5Pqlqsvb1BwKsPGFoXzip1ASj6DRXkBup4gxMdLAvOMIlVcI+idrBvAwHTuk1tPDDTEJes1HLfKlt7Xz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8TXgyDieAxxLUEQNectFJh4ud5z4jqV9kaN21gkhZ8=;
 b=Kj0PYVfFH8BMj//h4b4VUGp/8HQeTOO46+wZn+3gFUb8c+n56mZzbzw4RPiiXyVLaoi0k9r25bgjDqlhus49xnH+w3gYZtuvYeENqpnajedYy8ZUteWQ+ZRbRXTX+vB3NZtHgrnGCBIWmpja33pr2K3s7uNYhNeP+iSYckVcPhOj2IUhs0pK528lzlmnejTgf+1yigkEAiuxGyKsUzE7NxlcqZsSGVCohHPWLiEIi7zErzh9ZUUay2NBedyuQNSxmJgUjBAvoDhcFaAQXPUg5YkcvWFxzWgAHY/3mskH3QMXQldhPjTW3IVsB4s8yQgQmPhuICidGFE2WwKR9jwgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8TXgyDieAxxLUEQNectFJh4ud5z4jqV9kaN21gkhZ8=;
 b=nqZa3vp0NF1Vi2g99dqGUrwjDF9Kz8IIRJdUzlxN+ZDfx1t7thLs480fdCosEcpbR6S6uCQUNRMp/q6bHIyJEJegeWwNwc6X3Lq74ZegoYVi6jMRDxuzgTlfhQqHhF0qpepL6Vlu0TXaeGJzUWk1Qbcg5QP1LsTleMcHtkj/3NYv8KWc0OfPMR6R5nmYxFh+dlTDjzJNBLOw0YEfh+PrZ/I1LYTpxnMH9U4jIHJcqaJddjEidUGClnH4jeSyAlOeTq9HVpR5SlDhPmefxfO+eZ6T/nhju6VYQmFVDKVHN4ImRwqfdEmTCcwVSlc4EWGJ7Doym6QkrqAMLM036s7N7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9614.namprd12.prod.outlook.com (2603:10b6:8:276::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 21:56:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 21:56:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 06:55:57 +0900
Message-Id: <DAV3KFP156H2.2IN5UVOWBDC86@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>
Cc: <airlied@gmail.com>, <simona@ffwll.ch>, <jhubbard@nvidia.com>,
 <bskeggs@nvidia.com>, <joelagnelf@nvidia.com>, <ttabi@nvidia.com>,
 <apopple@nvidia.com>, <sbaskaran@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add Alexandre Courbot as co-maintainer to
 nova-core
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250624170517.105148-1-dakr@kernel.org>
In-Reply-To: <20250624170517.105148-1-dakr@kernel.org>
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: e06ec437-a3ad-4633-5772-08ddb369e811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWdGbDNyWUs4U2FJZUhEbDlleExDK2I1MDZLbGFLL2NGdkJGbUdVYUFSSWxM?=
 =?utf-8?B?eEhYc2o4YzNCZUE4VlJqOW5NTWpoQ0hyeCtHUytNK25GR3VmeUo2eVZnSnZD?=
 =?utf-8?B?aEQ5SnJDRmErOGlqRjlyV2NnZHpFWDJrNjJLeTJyQVgrUFJGcmNSNktVL3Js?=
 =?utf-8?B?QVNCNXlOS2IrNXlSZURLOXBLT2gxaUc0cWo0aFR1K3RPcjRGc2hDT2pNc0Q2?=
 =?utf-8?B?d2lWY3ZPNUVYLzlJOEtxZjM5MXlML1JMS1BYcFY0NC83ZitQL0JzZ2lIUkNU?=
 =?utf-8?B?Z2Z1bldGS3VZaWxXSHRpTll2RzJVTDNmUnFvZGxxSzdneFU5TVBVbzNtRmdK?=
 =?utf-8?B?UUVwSFdXbFYxM1dReHNLdnRMRXlHdmwrRWZhNk5LdkkrU0tZNnB4ak1Ic0RN?=
 =?utf-8?B?YlJNdFZQZDFXSXJROWw3ckl1aDBlSjgwNjZJUGNvNGorb0NPQjlXMmsvcHRI?=
 =?utf-8?B?amNISE1VaDFYb1dUN3gydHYwR0F3STVYaWRNL3VuZnNYMWpNT1U3ZmJ2UkZq?=
 =?utf-8?B?MjNxWlNLUUZPcmU2clIyaTBRTG8wRWRlRTZzTlNFOTZpNUZRZWNNTzgvNGQw?=
 =?utf-8?B?N0VnVWdiZWZMSmk0cUFnbXVnclpwSlduZTM3OEhjaFNBZmJvQ2ZvYjZDOUZK?=
 =?utf-8?B?NWVhM3VnRkRDTWhVOEpuN3NjbHd1TEZGN212cUJMbGF3cjRjK2hBZG8xQ3p2?=
 =?utf-8?B?ajVXbHJncmdFVlg4VWNRNXNheWpvNmxpRDVhdEU5TjJUL1ExSnRidDVRWGJJ?=
 =?utf-8?B?RE9TdWtBYlkvVzFHV3gvNHpRZWdBb3RWSjYzSWVFdkxKN0JvRHovdWg4UHQ4?=
 =?utf-8?B?N1pmcXJQTkNDYVJtdWJ0TWF0alNLQ0hiU25NdTN6bFhjd0Rnckl1dkl0NnNq?=
 =?utf-8?B?VTB5MmhlNDNTMHBkQWh3dVExQVBib004S1BTbEhMc3JMTlppdEhQR28xa1A4?=
 =?utf-8?B?enhCWE1sbWc4eGNqU0NpTjJGbmlRWFAzaUtBb0VLeVJUSkV0cFhnbjc5YWJI?=
 =?utf-8?B?Tk5HZXBBYzRVNGZ3L0cxYlIrT0VSMVVNNnRUemFOdHk5bW5Dd0FlaXVqOTFm?=
 =?utf-8?B?WGg5RlJLdzJLTWQ5Nm5pRzNETXU5aGhIODRyU0t3THJ4UkNWd3RyRUU5RG95?=
 =?utf-8?B?T3h2VzBWNHVBZFFla21YMzRjaEtxUFUvU0JlcUNhSG5RTEdkeWl4YmNtaGww?=
 =?utf-8?B?eFh1THBkRWExaTE4cFN5ZEo3eFZldjFlU1g2SFVLL0RpcFMyTXplVWU5eGdi?=
 =?utf-8?B?TDNJSXlkVUc5eUxUMDM2YkhnbVN0ZWczWTRacm1MUXJLTEh6VkxtSzcyL0c3?=
 =?utf-8?B?aW1zVnN3SU5DZy9hZVBmc2RVOXNMNVZYdi9ZUElHTE5jMmsveW1OYncvdVpy?=
 =?utf-8?B?OFR6REVQVy9nUlA2UzllTWV5Z1g2MTl5WVFTRTF3MUZ3TFlDQU5VTUdzREFO?=
 =?utf-8?B?VkppdnFoRU8raTJWK1dYMDlrUGZsTWJ6VkV1RmxPN1BRa25KM1l3NVNTYk5I?=
 =?utf-8?B?NWh4Ump3SkdZM2V6SVFTVlhyUUV2L2t5MHJjWHJXK2xUN1kvb2gxZDJPTjVy?=
 =?utf-8?B?TEp6djRrWEFhUS93R3hLWHp2eE1Ta3R5V0JGc1Q2enlQVWFoVHpNQ0RBcTVG?=
 =?utf-8?B?alFsSHFqQkpoZEM4VFJEalRtVCthR1ZudzZpM1FncjZDSEIxdVkvZFc3cVp0?=
 =?utf-8?B?VDE4YmN6MUFHN09uQ0pEeFg1Y2JNTzU4b2NYbVpTWWtJN3BjRTVtQXhqcVlB?=
 =?utf-8?B?TXZCYXRVZmNkMWRzT3ozZmJ2K2NtczBCUWlOcDFlWXQrMXJKUUN2UWcyRFBm?=
 =?utf-8?B?bnNuRnlqN09lUmVYZlB3Q0ZJWGJTWjNjUTZpU0RjSnJ2SmorbCs0UXZXZXht?=
 =?utf-8?B?OXV5K2tnQzFBaWFkNXJVS054b2ZPT3NCWVhjWk5XRjdxaDFIbGg1cWVhWTh0?=
 =?utf-8?Q?nyUy8M2lwh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjJwcUk5a2J5WlNJRllXTWlEeTM3TjNpWXdUOC9WYXhpU3NFdTl5VVp1VzE2?=
 =?utf-8?B?Z2ZWa0RGMEs0Q0oxSDdjZ2Rxbmp1cnJiN21XSGppZ2RpT09BTzNZTVBpQi9q?=
 =?utf-8?B?dE9WQjk0eWd3aWZRdHlWaGVqSk9meThxZmxKOWt2eTlWNkhEOVRUc2ZsV2U4?=
 =?utf-8?B?WFB5Nml1TkRXVWs4M0NGTW1hM2pHclA1czJSRnZiVVRodGZ2SXJEYTg1TURF?=
 =?utf-8?B?UGpJK3cwQlVUbmtYcHVhcVVNMC9YakZUdDNaeXhCOStncFV4R2hRaVJPQVhs?=
 =?utf-8?B?VDIzR2RVL1QrWjVqUFhaSlA5R0ZFVVVYbnYxSUxaWFdQNmFmc25xcSt3MllB?=
 =?utf-8?B?dDVDMTdMUEpuQktQeDFQTWNKQkxoT0tDbEZaQzVEckVZamk0T04xNUtQaEll?=
 =?utf-8?B?SEE2aWh0a200dWxQMDltMUdGdXJsYnY1WGNrVUhCNDJzSWhqekpBcjRzSkpW?=
 =?utf-8?B?S0JkNkU2WDVVWWQvMnlRTEhFTjd1K0NhWGkzZTMyK2NuVGpPTGR1WmlqTFNZ?=
 =?utf-8?B?cWdRWDV6aFJRaWJMaExxaWE5dld0WFFuN3ZPVWxscFVRdktkWTNsMksvSzJ3?=
 =?utf-8?B?cDJtTHAwZGJRaDlvNDY2MWcyc1ZjSGJwQ1NvQXhJalpKU1BQWk4xd0YxMDVv?=
 =?utf-8?B?S1R2MnA3ZmNKWXFyWmVVb3c4RHVqOVlDWlc4OEZpMktpbTk0MG9XRnpSbEhs?=
 =?utf-8?B?dTIzYWVOSTRDY3Q0Ni9idTJEdXg1V21GVVhVTVRPUWx3UEtkV1RiTmlkR0xk?=
 =?utf-8?B?WWQyTk9xdnplM0tHMWdSM0taWkI5Rmo0WkcxWDRib2VrT3BXWTRjYzYvc0Iw?=
 =?utf-8?B?b2IvUElJbWp1allvSmpET2diNVpPOWlNVUxteGwrRmlKTE9DbjBSYmZOMnhy?=
 =?utf-8?B?SnhwMFlPTkkxYktGTUJpQ09PdWZuRHA5Q1Vwek95YTgzTkRhZmNUTWpJaGNh?=
 =?utf-8?B?RmlFc2Y3cmJVVEx5Q1N1dXNQOTJFL0QyTDZ2aDlwUlQ0cldlSTFZbnkyK3dE?=
 =?utf-8?B?WlFVOFRRS3R6Q1YzbjRMUndEZHNqbGxEMXNZOW8vcnZxTXJWNmdkOVVmNG9U?=
 =?utf-8?B?ekt5SU5VV0k1NWxVTzlCVDV1M2N1ZE5Ucy85UThPelBWeXJCY2ZIUldSYWVI?=
 =?utf-8?B?cERjQThtWk5HRVBCTlY0dmswNkJsT1paVWdaTVJrUUJySHlwYkQyTEVaMTNn?=
 =?utf-8?B?bXh1MmlkK0lMNHQycG10WGxlSWlLMkhNYk04bXZEUjZOWnhCQkNIZ0pROW5a?=
 =?utf-8?B?RFBwWklQZ1BORnkzK3ZRZDRuRHhlVCs4YldhVy80ZGYySEpPMU5MV0ZhaEYy?=
 =?utf-8?B?VnNHN21nOVlnTGlnQkpjcGhTaHRUQkV6VUlNOTVCa1I1TjhsVmNkSU5DQ3l3?=
 =?utf-8?B?SEVoWHBPdjA0dmxKU3RmSTJjcDdRd1JKOWtZWSs3UXUyRXhvYW8xTzFGdFBW?=
 =?utf-8?B?ejAxeUJ5Rjk3OENxRHVLTU1YS1lZVW9TNlpLREJQeVlYc3d6bFdRZkNQRnUz?=
 =?utf-8?B?bkJrdE02dzVnbTlHSnM2b2FBR3lEZXh2c0dNUUYwOTk5akc2cVlzVFg1ZFRL?=
 =?utf-8?B?Q1dXNEpycm1UVTdod0U0NG9aTzA1QzRrMFF0TVBqNmI4ZitUbUlrdFlMRXdD?=
 =?utf-8?B?TkpuUjdkNldjbkpHdDYyR1RVaDVmSTFkYUZTTExtSVVCTVZoZEVCenJPeEdX?=
 =?utf-8?B?ZlRsVXV5Szk2K2ZFSyt3dytyYldtOFJuaUVGY0ZJOFVmUTJPQnZ6TkZFWHVO?=
 =?utf-8?B?RFN1WDJSSVdvRVlpeFVsYUJZYk9SNks0K2dFVUtCL1cvSzVRTGRGakhOTmNy?=
 =?utf-8?B?dmNKTVRtSWJnQ1c0Q2U0RlFLNDVEbzlVOHRsNk1ENklPbms4OWcwQ0FQS1o2?=
 =?utf-8?B?MCs2azdVV0lHcUkwK3grbkdrLzEzeERUWXBadm1GR01IOFZSTXhwS0NTUkds?=
 =?utf-8?B?QXYzNnZpZGIyNGFwVDdOVFR5bE8rZFJMcG4zdjkwMzBleGdZUzBUbU9Xa2Uv?=
 =?utf-8?B?ekhHbHo2T2MxNUh1OER3S2JHNGxCeHFmbDNGcldjanR4S1M3UnZKT3lKUk5l?=
 =?utf-8?B?cFhLNUN3WG4zT2dnSDhWbUlTQkl0L1VTZURvYndsM244TE9hUHVZRkF6dk9Y?=
 =?utf-8?Q?wzq8vlGvh6cgO19/FAK+44wUN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06ec437-a3ad-4633-5772-08ddb369e811
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:56:18.3487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEo7wG5OgC98SAgUxa/ZUncmGYv5w1a86bCIFQu/CBDAnu6nYUfsQjAXiqXRg5eDZqCYgoXpUq2qYUElu7hwuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9614
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

On Wed Jun 25, 2025 at 2:05 AM JST, Danilo Krummrich wrote:
> Alex has extensive experience with NVIDIA GPU support, is closely
> involved in nova-core development, and brings valuable Rust expertise.
>
> In addition to his technical contributions, Alex is actively engaged with
> the broader community. He works closely with contributors and
> stakeholders to identify and solve issues, fosters collaboration, and
> helps ensure that the Nova driver evolves in alignment with the
> community.
>
> I trust him to take a key role in making the Nova driver a successful
> upstream solution for NVIDIA GPUs in the Linux kernel.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks Danilo for your trust and for guiding us to this point! It is
still a long road ahead, but I am happy and excited to be involved in
this effort with you and the community.
