Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4BBC6D23C
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C497210E597;
	Wed, 19 Nov 2025 07:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qgAf5geU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD510E597;
 Wed, 19 Nov 2025 07:34:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUjkWXnQwX4ugbc4C/BmFWXFnzC7AJ+vg9j+1jwqhF/C+IehOX/qm8/VWaufH+priQfchMkyrZXzozTOP5cR7y7JcsbSjWrGGlfhbRvgx50BK3W+bH7PajBzciJy2PJB3+uMKTY6lsud86wkckgXDRqEbqc1CqB+YVhr9B/vj0v25IDZTkowSe9CpK7gNdxSPOMDeV3WiK4AIx/rkoQB6rrQFo3CT3xwpq8+GDV9VFJDr14GIoolVOgxIvAXAHoX1ov0s+s3a4Q1NHAS8wRkmmMg6Z04gh5Zl7r4g6n5TLRQlV4kn6/EzZxCZ36btnlqQYncB0X/BJX/xnO8Bj3paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Izb47npIZvRt+eQDKAhnmoaIzI30tD4D6919Nn7O6UY=;
 b=EHvwLeACTD5Sz8CHHlpK2Ve0fj0rg92EUGfPz1j8ImCpVxVHV5R5EWISG8wiR3ekBGccdNF/Ix/feoMlN2sQkbIM8p0eKlebaGIdO6L9iaGQJpORBGYeusnkqxtq6k2gUFWIDRyssYZ/EAtzhpBxRrU/qjqDafGwZWs36pnEaqN+d9aPGWHu8G8sZmVx4mXehy15wS7KGyh7S0RlOqdWmANODKsiym8REDfSipyTUKE+q6KpIszWbETtG5U7sox6w2dARof5Zo9wOJrX1bDWzpgL7A2Vwn88pevIIL//NfvWs0d1DyNCPHmBLfglfZpFRjaqey55VVe1obqQzv1toQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Izb47npIZvRt+eQDKAhnmoaIzI30tD4D6919Nn7O6UY=;
 b=qgAf5geU/J+Cdi5NZmfzJTcZoGRfIVKWgyB6Ku0lQum0W2v+EPkH1DMlZRJlNl+bmRNvajjxPOosGcLNajy8FNUItZTlRVPRYXf7MhbAP3Z27hKtr94MMtj1xxHVtLJWktCTG+oNpf5lUEVeI8yeWNsKcMTClpIu4NDEE1HLsxiGVl2U7k2fYvvAeSjUeZxvq/qFyXrwrWnrTbRgt5jbP9WhMxpcrumxQOykCadMuuwdrv4kO7hH909tvyvIbJblLbCIfWe3Iz+l61XA3foj62sny0W25hVfby+/S9DJCawW5ASK7XOLJHmXB/FMRrRId1+15a7NKB+WYruYBi1ZsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8854.namprd12.prod.outlook.com (2603:10b6:930:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:34:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:34:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:34:23 +0900
Message-Id: <DECHXE4VD7CU.1U991LC4CKNSY@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-5-ttabi@nvidia.com>
 <DECC2NFSLDLN.236BCLPYHUVNI@nvidia.com>
 <DECHG7EBKJM1.104GLFJIRJ0MR@nvidia.com>
 <0f11194b-edb4-4206-9a6c-b7ada3cba3e8@nvidia.com>
In-Reply-To: <0f11194b-edb4-4206-9a6c-b7ada3cba3e8@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0083.jpnprd01.prod.outlook.com
 (2603:1096:604:218::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: b439f772-9ec0-4499-0447-08de273e11b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEQwMlhMZE9RWVhYcHlrNDRneWY2Skl3bkpnSEllRHNIUjN3anVTWEJGWWpx?=
 =?utf-8?B?bS9wc001eUVTZng2bk1uZDM3NmZyakdLUE9TRHk5dTcrNHVLQlMrK3BEZVo4?=
 =?utf-8?B?NDRBajlGK0RFUnd6OTNlOFovTUhPNGN3cURybWZNRnVkeGFmaDVSMHU1clBT?=
 =?utf-8?B?TmRUNVZmdGlSdWRaZlNZL2lpb29YOTAxNGZZOVd5VWdGZUFNK2p2S0ZBbFpB?=
 =?utf-8?B?L3lUcUlSWlpRS0x5aFBDbW5EbjZuemxEbDMwVU9OeVlFOGVOTjdxVDNNZVZw?=
 =?utf-8?B?Y3ZyeHFDUWk4Q0c2NldRWXpTTG1MRUhUdnFBdzdSdXo0Qlg0SzV4aHRTQ2FM?=
 =?utf-8?B?U0s5Ti9malBsdVRtMlVDR1BsRkhjazBBeG5iUEROMnJLaVBIb04veUJEMTdy?=
 =?utf-8?B?ZnJndmtJZTZvT3ZMVXdyK3AwbkhiQ3ZHNUM2UEVBRU5sdTFKWkN4MkNLeFlV?=
 =?utf-8?B?d3RoUVJ0Q2pLd25iOEYycXd3bEZ0R0NxK3k4MFBrd2U3TDM0NnJ4T1FPR0c3?=
 =?utf-8?B?V01waG5BQVNSbGZxRS9wejJVMlEyakpycTlEQjZBVzZzNGpNOEIxWWNLWnBH?=
 =?utf-8?B?a1ArZjBIOUFlVkM2bTR6UmlrR3VMWGRGUk1hWnVQNjRHQlZEWUF4aVNTVS94?=
 =?utf-8?B?bFAzckdzeHgybmdDSVhnbkp5ZnVwK3VxQjJXbDJid1l6cmtoV1plQ29oRWlJ?=
 =?utf-8?B?UzMrY1FENE1Ld25JZGZXQ1VMTFZwME5Xc0xqZHRzbTllUGM2MnhiQUxUdWVN?=
 =?utf-8?B?TDNSaERsRkJNRHFCbS90TTBHT29xSmplK3dNLytXRUVyQTU4b0FiUFNuajkx?=
 =?utf-8?B?N3ZTL1VTeVRpODc5NGFrUDJsWlpJb3pmQUFCejlqeFRiZDlERVU4NE1pOC9Y?=
 =?utf-8?B?bTROMXFpNWM4K2Z0UUJKNXc1aTBRV0FQUnhYcTVRR294TjIrbVFweEw4RklW?=
 =?utf-8?B?bTBOU1RvRVZzamxIUUR0ajZubnMwam50cWpMUGxST0ErWis4S0lmc29NUk9X?=
 =?utf-8?B?aHZFQzFVMDFBVHZ0NmJjcU42TG5GM1VaYXBCNUxTZk1uYjZJY3BKTkNlUlVm?=
 =?utf-8?B?WXh5SkV1Tzh0OTNnazhreGdpMUdxT0Y0TmozaCtDeVErZnIzY1ExQzN2NC9P?=
 =?utf-8?B?TTZsUDR0Vm40NmNHWHc5cmp0QzIyRkFBSUR5TkM1T0IzbzA5WWVha3Z2bDA3?=
 =?utf-8?B?b1R5RGFIbTBuRmNLNEdRdXQyTkpBNzBhZDRJYitzanh6QjJnb1QxOGtTU3Z2?=
 =?utf-8?B?TzBtSGlGQVZuUFFNZnlsaUhpZmd1OTl1N2p1d0JJL2pCQ1V4a3ltZE44azJ0?=
 =?utf-8?B?OVV0NlJwc3lDRVJqcmpGTVM3MEl5SEhpYVZrSVlxQ2oyOXJIQkxIVHJCaHRz?=
 =?utf-8?B?Z0lMdUg2ODVlZm9kc0RHM0hOSlliaU1XV04zSng2a2JDTFVSdGdRRWtUaERp?=
 =?utf-8?B?K2FERUlKcXIyQ1VKTTlBekhJRDNrWHhTYjNMRUZZdXNCRTNtNWRPWlQxTWZ3?=
 =?utf-8?B?azZWbENCZTZ1TW1FRU9lcXNMbU1NbVVETms5aEs5TG1zUEl1N29meUlIZ2pM?=
 =?utf-8?B?Q1hNMHc4ZU9KTXNadzRZVmxNT0MzSnNKN3BrdHEvMDNJL3pLNGlPLzI0TWZK?=
 =?utf-8?B?ZlF3d2pzRC9FSHpjbGlSSk5NRDNTYythQ0E1VFRwRHlsZzJqRnZLend3RkJN?=
 =?utf-8?B?RUY2TTh1QWFDdG9rV1pCaGlKOW82eGtiUk5Kbit5Wmt5eUdjYjFGQUFBZHVN?=
 =?utf-8?B?MkVQUUxpWTFON01ZZXBveCtLcEZoeG9ocVpxbFcwZnRRN3FuSm9MQ0hVNGkr?=
 =?utf-8?B?eEhVeUNQVGlwUXNld1pmdmQvUys5bUkrT0o0WVBQTGd6elRlZDBaaVM3QzNl?=
 =?utf-8?B?WE45ZktoZkpMWWh4TXlYNmI4Q3lmOWtkcTVucHg4bDV5cHZ1UFdmK0trbGJy?=
 =?utf-8?Q?jHotUUlYXmKaKlxgfVu0wyqjbMu1aVlS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXdEdm9xQVJlUG92cHk2dnNtQ2VjSlgzS0FLeWVlUXhsUlhxV3d6NW5LNW41?=
 =?utf-8?B?d3ZkV1BSYmJQam5FeitTTFczSVVtOVprOEtKV0xVQXVYZFYvcVcwODUzUHdC?=
 =?utf-8?B?bU5RUkhpNXdvTDFQNHRQMnB0OVVVSXZ4eXAydytNR0JoWEdMNGkxZlJ1Umdz?=
 =?utf-8?B?ZkM3SVRUL3ZvWVdKNndFNDIyKzJnK3hUSStIalFJVkRXcVZPM3ZQT3dQSHor?=
 =?utf-8?B?R2RYVW9RR3NjM0RqalA0TjU5SUhVMFAvckdYc2RSN2phcjd2QmtYMEt1ejEy?=
 =?utf-8?B?V2lOMXVBVjdkb1piRnkzMmZuOEZpcDNjYU05N2R6eVZhUGdDVUx0L3pEd3dp?=
 =?utf-8?B?QkZLR2JUMytab3FYSzZEcU55NzNvbUpEZnV2ejFRV1pOOXZJNk1NSnU0N0R6?=
 =?utf-8?B?UnN1eldteEVLQmY4MmpxcmN1N2pUbjhEUkl3S1c2Q2gvRDc4NjErNzlXd2RW?=
 =?utf-8?B?b0VWc3JLUmY5SWo5QVpGUGZQejN6b0hQaXBiZFVRZlJYL3liWm9pdSs2ejJC?=
 =?utf-8?B?cUNNaFAxZ0RacDJsQ3ljS1hmVm9talJoRy9LdDhBWk4zd3FWVUJCZE9EVTlC?=
 =?utf-8?B?VHdLTmdWUHk5NERhQStFeUNZMTRMUTJGRFZPV2pSNlFRcG1EaXhlOGZ1T2x0?=
 =?utf-8?B?KzYzRktNK0EyamgzMXpEYm5nNW56amVqRUsvWjNpdWxlaElGZnNmVWMxSklN?=
 =?utf-8?B?NW80cE9KUlJ2U3NqWUhFWm5GUHZzNElVOHRZZDM2RUlnTDJkVno3MEFEYzBC?=
 =?utf-8?B?cGFDbmFaRjhYZ3VKOU03MGxOdzVzRmxkQitEQmNEYUw3N2VWK2tHMmhYZS9w?=
 =?utf-8?B?Rm9uQzNCS21DVWxTdCsvaTYxa1d5MUFMQk5JUlE0QXR3azBuZE9OL3Jham1D?=
 =?utf-8?B?RVhLWlI0OHdSeFgvdUl3NFpoMVVTOUJrNUdtTVgwSVJkdE1Lc09udVBuTnRl?=
 =?utf-8?B?RzdTZEx6cnNjTEJQKzRDUXJ1VTFrbmxrejdrR0VZSmpCeERoT1hKV1FYNUNr?=
 =?utf-8?B?dDU3WWdzanhjVFl2VzRrTFRnQ3NQZ3FEeFpxaVRORkVZait1aUhMK3l0UXY4?=
 =?utf-8?B?MmQzRWpISGFTU25DQm1hcC93S3h2ZHJ4dUUyb2NvZFUvdTN3dXVQZFM4ak9T?=
 =?utf-8?B?Zlo4MTJTU2FTQVFTLzB0VkFRL01aSTRieVFyUStGeTlRSGh4VVA4RUpOengy?=
 =?utf-8?B?T29tUTFxRVE5SkxFSVhINEpMZGM1TkxWcEQ4cFRlcVUvSnE4Y3QyRi9KczM3?=
 =?utf-8?B?WDdzbGVVZTJnLzB6S1RIQjZ5TVMxU1JWSWYrLzVIWEhOL05mQnRGM2xJRTFx?=
 =?utf-8?B?R3M5b0xSSmpqYWthbTdFTm1ucG1ldk5UTWRWc3pKT0w5U0V3cG9jVk1hRUdu?=
 =?utf-8?B?SjNQTEtGRXg3YnBjUjRUUHo1YWY5emUzUDFCcFJ4cTFkRHZIbWFXbDE2VmIr?=
 =?utf-8?B?T1RnV1NISVZNWUIzR05tNWZtNzl0Q3NMMUZjYVBlMHZZemNvUHo5b1FDU2ps?=
 =?utf-8?B?RldJUXh0b2JGWUZkY2M4WjBUMHAyc0M0WlhZaFRPUS9SeVFqSGtlZzhhSm5I?=
 =?utf-8?B?VHdZeDJKWFd5dlhpRGNDeTJma3NwYml3L1VyZEtHUmNFRXA3SkwxQkNFUGx0?=
 =?utf-8?B?UXJpd1ZJellkOUNyS2VvY3l4aWhMRHRGekE1L2ZnQ3dPVkozc09BUkFBbmFZ?=
 =?utf-8?B?OHV4NFJURzZ1TW9jRjI4RWg3NUxQRUdtc1JZZjd5aXBLV3hraFpIZG53ZkVr?=
 =?utf-8?B?R3V3ZkQrTTJPbGlKeGdFUm1TWUlVZTdlbThaZi9sUnBUbjZQL2cySHpPc0RQ?=
 =?utf-8?B?L2w4ZXc0NGhoTk05cjRyY2ZLa0FLWjN0Z3QrcWx3TSt0dFk3OGJjWkQxSVMx?=
 =?utf-8?B?R042emRMazQ0Rm9aQUw2dmt1cTQ0S016L28zdllKTTJWdE1TL0RkM0gyOFB1?=
 =?utf-8?B?OGlEWjZxRXF6aVN0LzZBOFh6dFB5aC9VODczZU9jc24rYlVEc0Z1VEd0VEw5?=
 =?utf-8?B?MElTS0wyMGpXZmpSQnk4NW0wREQzZUw1b2lDZlMxZHdpRWhNRlZEWlA2a3c0?=
 =?utf-8?B?dlBPYmZmSnV5NmMvNU9WRlVOcEVSSGlpMFArRmwyNzBYREdtRDI5Y0djRytr?=
 =?utf-8?B?SEc1UnNKWHlvQ09vWHp6TFh4RzJETDF0SlUzUEt2b0g0TjIzZnpVbzVTSGlq?=
 =?utf-8?Q?tV6l4vVfAyh4PLGDXTlR763VSYUgYOPB/H210+br/kp5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b439f772-9ec0-4499-0447-08de273e11b6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:34:27.4310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cd1xA8jKrLp0A5qTdskygQnnb3ZoqyNYGiiQs3bsMeXRO3G0lDlvOYu9/qoj3YGmC1QmK0lf3Kx/MQIFvMyX3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8854
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

On Wed Nov 19, 2025 at 4:17 PM JST, John Hubbard wrote:
> On 11/18/25 11:11 PM, Alexandre Courbot wrote:
>> On Wed Nov 19, 2025 at 11:59 AM JST, Alexandre Courbot wrote:
>>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
> ...
>>>>           let sigs_section =3D match chipset.arch() {
>>>> -            Architecture::Ampere =3D> ".fwsignature_ga10x",
>>>> +            Architecture::Turing | Architecture::Ampere =3D>
>>>> +                if chipset > Chipset::GA100 {
>>>> +                    ".fwsignature_ga10x"
>>>> +                } else {
>>>> +                    // GA100 uses the same firmware as Turing
>>>> +                    ".fwsignature_tu10x"
>>>> +                },
>>>
>>> Following up the point I raised on patch 3, this could be another site
>>> where we use a potential `Chipset::has_bootloader_thing` or any more
>>> fittingly named method.
>>=20
>> Ah right, that's unrelated. In this case can we just express the
>> exception as follows:
>>=20
>>      let sigs_section =3D match chipset.arch() {
>>          Architecture::Turing =3D> ".fwsignature_tu10x",
>>          // GA100 uses the same firmware name as Turing
>>          Architecture::Ampere if chipset > Chipset::GA100 =3D> ".fwsigna=
ture_tu10x",
>
> I think that should be:
>
>          Architecture::Ampere if chipset =3D=3D Chipset::GA100 =3D> ".fws=
ignature_tu10x",

You are correct, that was a typo - thanks for catching it!
