Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D951C6D056
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8232E10E585;
	Wed, 19 Nov 2025 07:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ofXHkP+b";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA7D10E585;
 Wed, 19 Nov 2025 07:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4j0+sjB4FHV2AzwWDqloLoofBvPC1boyPXGQlku5oVVWgxFpp6URYK5df52mDAQJzAuU+AZ0E2IhPk2BVWL+yB0d/mkNUaPaligC+dp7yedNsRnDB08ZVLB64dKlrBNqWZlV9HF11G6vdnru1icOWvZ1y6Xw9wRbMc/1PxLO57gTxm9SLHPKGL/yyMaFfDZOKF0stF390mD6aw8Ig4Y/lldgsfPIf2P53g0IIzvPF75qVpWWCXpkzMa/L26d45aaMmW1S8az3oXDJYwT+CT1/hJQjsit8ZWm4Q0oyWxy711d7dCikjpk7o944ZTZZx6Wuh8Y2mFbpzNnCV7/KDMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dlWhEwJk/TFPXoTQtDUzTsvCrIybEbSgwg3HdFGYAs=;
 b=aDi1EztW88jX79PORONtod2eFAX/G4n/O2D8ELTnb5fmrZKJ99QbpyJvBKdPMX7p4S3WyXVrE/nE9taG+U65rVGQvdRaVgvSJnEgIgr8K5OCsmG9vM/x+feOsBaeOZy3fP47VAvR73++AXFJ9shRxhFqS9rFBt23VAht94T5di0oSe06pABEQ+UbzBqJKIB5oBkFJCl+Ag3rO/JS9pmg5QPATktGyczLmxeIE8hGS3zZyqEr+L40N0ZaLFWwCfddXGQQlSUfJU7098JLZDDhgSQ73H52MOMUOKqgmcj0V/qHfS5T4gBI7RucdwbLHcR/JpKjcHRv6he1/In0aX3iYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dlWhEwJk/TFPXoTQtDUzTsvCrIybEbSgwg3HdFGYAs=;
 b=ofXHkP+b8b7D44qW1ca9wSEhDeMQF8Gsx9k8Rgl6iEURRkqkE5q6SlwJfTC5pCI+yJSflFTa0I0MrjeV5DzPeX+BUC8eSPstozEsDMJCa2uhKlrDjF9xULIwAa5aSj0Q2CfM7YUb5UPvHwqZ9l5v6AwWWJcIyzpaf2hH4szpOZS/KXx2btnTpjiwLu4X0jJbdIjVbp+kNFmzbtFKAYFQcHh+ubwko2lpcsSvt9FCW1RVcF2QOVDELQINkxiUzcguD1us1TAvN5Gqgmvg7tDQPS0cGildhz1nXasQpLOcn5wx0AN5Vplrt03cZ1uhpyCpmb4qW1nO2cXfc+sMw4JjLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:03:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:03:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:03:42 +0900
Message-Id: <DECH9WO4EGMP.24N37TGWZV4NL@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
In-Reply-To: <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
X-ClientProxiedBy: OS0P286CA0130.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d2c39c-bf7b-4c41-e228-08de2739c872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVhMVTk3QUFMZlppNllUNTlQMFJITXJzMzJmMitQNWx4QjZXaHR0N3VpU1ll?=
 =?utf-8?B?bHFMSTU0Q0h1T3FmbVRPMkNvanRWZGFzZ2FpVmZjSVYyUjRPRG5zUXVVbTFQ?=
 =?utf-8?B?TzR2QkdtQ2QvSXJ0OEFBa2pET1pFWThSNXFXMktRRHA0dUNuZmNqOHp3bTFy?=
 =?utf-8?B?V2NadFFPMXpDcHE1OFhVVHJ0RUhjL3BMZXNFV1lMYmYxa2l4ZTBURWNVS2xa?=
 =?utf-8?B?Y3RscmIzQXNnZTVBSW05VzVsZTVGMUo1TXFuc0RTSFJ5R01mR0Q2c2hqT1RU?=
 =?utf-8?B?MzlmTVNwRmRZaU1CeTlhRGZNdTA1dWVWNFlYUkZzNUp1M05iTnhwN1hFUjBH?=
 =?utf-8?B?dmRrejhLbzBxZ3dRaUE5V0NhdXhFTVB1UEw3K0VoZlhQUFMzTUFtem85V1hI?=
 =?utf-8?B?eXhUbDI1VGE5SVBSSzdZWDRXUmVNdUpyay90M2crWGZBOHdsbnZzZFNtRk5j?=
 =?utf-8?B?djdyT1lpZHQ3dmI2Yi83NlJoM3JsczlWTmdvbW5vUytMUzNES1dJWW5aUU93?=
 =?utf-8?B?dnI1bGU1RUhRWjh1UlNPOUM4emVReWVHbGdNUGs3dlBrMDh3Q0RHN1FrOElI?=
 =?utf-8?B?bEJRd2hWR2J2cTFoMEY5UUZETC8wdGdYN1dJdzBxbGJFODNVYmlnWFdrT2or?=
 =?utf-8?B?WVBZNVlSMmRLb1pyM1lJSy9EYlJGN0N0WGg2RGZNeDFwSzlLRFZlcllyZzEz?=
 =?utf-8?B?Y3MrZ2trckc2ejVCd2lCQTMrQlI1ejJZTnZSUUh6aXorVzdhSmtCeXpuSC8x?=
 =?utf-8?B?ZFM2a1d1ZytCQllNVllONGdncGl6NTlTMFgxTlRzM3oyeFBHdWVpWnFiWXZV?=
 =?utf-8?B?N2FsaElKdVZJR2R5Z2F2ZXREemR2UUhFc3BKWW1UT2E1QnBaeDBXTEJ3M2I0?=
 =?utf-8?B?dmIrRktGb0RqeENGS2NiMWhzRDNnRDJsM2tMb2NsVGRNQ1JhbDJHVnNoelJS?=
 =?utf-8?B?dlJ4bHVSem1HbmlJaDN1T2l2TmJTamRYNUc3REczc3ZxMHBSVnBGUGJtK3c3?=
 =?utf-8?B?S0dSZ0JISFl2bm5VaUdlM0xxR2kra1RqRnAyR0JqbHM1Lys5czlJMUdyUFdq?=
 =?utf-8?B?R1JWYjlDYWMwcVcrQmh1SE9ieHBwNVBYZWYwa3ZHaEhabTRRWVNKZllvWUkv?=
 =?utf-8?B?ZUFMdWErOXJZTlk2T251TjZUTHZpY2pqeG4vRmt4MnN0OGJyWGl3VW1qRm1m?=
 =?utf-8?B?ZENQV0t6eEZYR1Y2S21ObE4weW5CUG14KzZaVEVUeHk5MHgxQjByWGFiSDl1?=
 =?utf-8?B?MFhDRWdZbEoyTFJlc3dPNG1qNjA4em1McGFMWnRHUWZwYVk0VnhCUGhBY1B2?=
 =?utf-8?B?NnRabVFRVU5vNHkxYS9Ib2xjbkprUmNVNUNkaDVTL1ZwcUVjUjErZ0MvZkhH?=
 =?utf-8?B?VSt4UGVaNC9WZytkY09Jb2FxU052MWtRRzJ2bFE0Nmpwd1VrbUE2N2dodk9K?=
 =?utf-8?B?ZUhZbjhIaGxrMFdEWi9PaGp6R01sMDN3VW5VL0IvVkVObW9wSFREbnI4L25O?=
 =?utf-8?B?cGUrMlhxdEZqRlhJaTc1MTYzK3JLRk5YZTJZMVYwQkR6a0xpdUlMZkUvRmVj?=
 =?utf-8?B?ZWxIUHhVN25zalczbnNmT1plQ2JyUlR0RkxKLzRndVhIeDlYLzBSVlZXUjdH?=
 =?utf-8?B?bW1Oc3cveTBPS0IyUVR6ZVhPdnB6M3c5QjJXUWlOZ1g2VTVzSGtpRHNpalZH?=
 =?utf-8?B?ZGxKcHJiTGd3a0lDWE9hUmFWeVRuVXR3Zm9adUR4WkdTRUtVaUp4RTBQS0VS?=
 =?utf-8?B?UVVhYS9JQzlZY1N1R2ZoMGh4d0JZN0toaDlNaVZqTG4wb3JIdHc0ZThWbjVR?=
 =?utf-8?B?c0dnTnhUZHZwRmFQb2pqK3pvd0gydFZRZVFjNUt3L2p6dC8xTGNyZEFNNUNn?=
 =?utf-8?B?ZFpxbWhRNW5qK1kvNmJEdFJsdXVmcGJDYTRLWlUrL3NIRlduRlFndG5OVktJ?=
 =?utf-8?Q?2CJaizdOyHE5SfnYwNxJl7AY96OQjTnG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q29XZWpQMnRjVlRNWFRXYjI5ZTZ1MVBWaE9IVi9HT0VybGN3TC9sZjBVcDMy?=
 =?utf-8?B?c1VQSEErblNNQ2FBd0RPaDd6VEJaMWVGdktINTJqZHdsL05haUZvZHZnS1J6?=
 =?utf-8?B?WklTQW9rYTVmdllJRjcrNDRGVEV4VkovM294cjcxSi9JZ3dTOExIN1ZmaTRr?=
 =?utf-8?B?UmFwdWk4WkFKYU9MR016cmpPdlhFRzJaMlE2VHJjZldsYkRiY0hyZVJQSlBz?=
 =?utf-8?B?RjkwTHg5TFdlTjlKMldKTWQxcC9EbWdUenA4VWdhN0JNTHlVM0k5Tkhhcnd6?=
 =?utf-8?B?NnhENjRZRU9NbjNJc2pVQ2MyV3NwdmhuV0d0L3dGQVdNUk9rcDJyTkJkYkZ2?=
 =?utf-8?B?eGkrK2VuL3RRSkdzZDZ5dDVWL3J5K1BXcDllQVFXdjNyZ0RYbGcvWlQwRXA2?=
 =?utf-8?B?SzRZTUs0MkwvRkNXdDhLa2lrZnJoRDlFeWc1emU4dFZERjkydW1wSGppUXQ4?=
 =?utf-8?B?QjFrdFo2MlJ4aVJIRG4xQjJ4TVQ2eUVCWVlsNVZURGUxQ3Fkb0FpQXV2WVBW?=
 =?utf-8?B?MTJZS2plWVdvY1MydTAvMWNQRVlMOURPQVN2L09QM0k0b2c0REVkNW82WGpv?=
 =?utf-8?B?d0hqMkxBclpmRVUrRGRSekZnQ2FIUHM3RFV5TXZvS0dPWE9KOUF1clZWN0sw?=
 =?utf-8?B?bnJzWnEwQ2RIRDFPVEk4Z1p2NWlOenVpdHJSZFArYlcyV3hFbFI2aFFtd095?=
 =?utf-8?B?TlBQM3diZUxzb3NnVHgyaVlkRmhabXVtcFNRUnNPNkgzS2VUTjR1OFVzUjlV?=
 =?utf-8?B?NGtCR3lrTDl6SnR2ZE5BQVVOVG5XWnFGbStDM3c0K09WQUM0bTZZKzFDRGFj?=
 =?utf-8?B?aEY0K0J5enlIS1ZXaXFTNnlLdklKOEN6aHZiSDdkTVhQY3Urd2hXZXBlRzZT?=
 =?utf-8?B?SXc3TVJHUmV2d3RTM21MNExncjEyNmJQMytwMU1KODZLRm1rMWNFbVBPeHpa?=
 =?utf-8?B?NFcrSXdlb1pyZzRGd2JjRkk2YTlJTkV3TGtubmNmMVZFY0lCYWV4aEdYRmt5?=
 =?utf-8?B?OWRwcWRCelZaMFRYOWVacEZseU1rbnR0cjFFaWhNMXZ6VzZpdmZtbURRNFh2?=
 =?utf-8?B?NVZCNUFiQXhrTmZkakRhU0trVjZCcWR2KzFjMU1QOFg5NUxhZXA4aEVOaW55?=
 =?utf-8?B?aWZNcG9zYVBxK21TWWhWaWptVmhXc2pWUjlxTkxkZnV1elpxMGNYSkw0bi9M?=
 =?utf-8?B?L2xBR0NDRDN6WmYvQnpJSDZiYVUwdTY4a3c5MS9PSWxkenY5aUJRckd6TC9W?=
 =?utf-8?B?NjNWTU1KZVVWSTNoL2Uwb0gyZklhRHA4RWd1clJaTG9LTlVNWE9BR2FldGlu?=
 =?utf-8?B?Y3RYTlNQTzNLaHp2S0IvWEJvVWRyOTEwWGtXb0ZjNU0rTVlQUllUbDdxcVdS?=
 =?utf-8?B?bGl5akVaWTFYOE5zSXorNUVFaENiQ2poTldneHB4QjdHRStPeGdZNkt6RW5U?=
 =?utf-8?B?RjJFZk1GQVNzNVpKbDFnNTYrZVVKdEZVZHBjMWFKdzFnUEhjR3M5ZHR5WmE1?=
 =?utf-8?B?V3dTL28zWjFIazd3enQ5VS9DS1lJaHRHNGI4VzVxTnFUc0Q3Y1ZrZUpkRVY1?=
 =?utf-8?B?elhhQ3p2TVV0cDlLWUZicEtHdElSWFVlUUMrV0YrZ0VMSVlueE1maFdRQWdX?=
 =?utf-8?B?NlZQRVNsQ0Q3V1BKT09WTjluaHJGWHpJSnIxTDhOVis1dDdUTHdkK0I4c2Qy?=
 =?utf-8?B?RWcyYkZXQVZoVVAzVVhCS1RqU3M1Ky9UYkpGS0VUV3FiZWxSQlJWR2V2cDVB?=
 =?utf-8?B?Z1g3RG1wQVZpK21kdThvK0V1aTY2Ukl4T3JJaFZOWVJqaW9xV0NYM2ZoaW40?=
 =?utf-8?B?WUw0SkR4QWNOa0pFa0Q3SlF5bm43OWhtZmY5cy93ZWNod1VRSjNoL0JlVktC?=
 =?utf-8?B?cFJ2cWlaS1p4WXRhK1k4UlhwbUMydGdJK2lXSDhhZ3Y1TDEvcXF1YXBlclQz?=
 =?utf-8?B?dzRSZkpwWHEvaFVBQ3lzajVLN05qUWNTTk5DYkVlREdkdW9ETy9OaURmK3pz?=
 =?utf-8?B?eTlNRnlrcWgweFQyY0d4QmVtcWJmQTRHdGJwSXI3Vmc0YXQ1Vm9abHN6djhv?=
 =?utf-8?B?VWFrODdpZ3FEdkNRbmlrb09EZXNQcE5kVWEvQVJPbDFjb0h4N05XOXNhQjlr?=
 =?utf-8?B?YitibXJRNTRpL0xGWWNublYzT2xkY2JCMkhsQW1iWUMxMFhLSGI1SmNKTzdM?=
 =?utf-8?Q?XndIz4588/ZOxea5MAwJMUFQLhtc37T7qWyGs7f8AU5G?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d2c39c-bf7b-4c41-e228-08de2739c872
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:03:46.4361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUM8XouwUMk51av1jR0AukcOe+SHUZx1YjvdgFAgcXwBB6dqdowOrZMkgvVTx3E8deZl+FPLbp3D+1izMCLxaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929
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

On Wed Nov 19, 2025 at 2:16 PM JST, Timur Tabi wrote:
> On Wed, 2025-11-19 at 11:51 +0900, Alexandre Courbot wrote:
>> I'd prefer if we could reason in terms of functionality instead of
>> specific chipset versions.
>
> If you can figure it out, I'd be happy to change the code.  I wasn't bein=
g lazy when I made this
> comment:
>
>   // There are two versions of Booter, one for Turing/GA100, and another =
for
>   // GA102+.  The extraction of the IMEM sections differs between the two
>   // versions.  Unfortunately, the file names are the same, and the heade=
rs
>   // don't indicate the versions.  The only way to differentiate is by th=
e Chipset.

Yeah, the answer is definitely not clear for me either. :)

>
>> IIUC the relevant factor is that Turing/GA100 have some non-secure
>> bootloader code as the entry point of booter, which GA102+ doesn't
>> feature as it is capable of starting in secure mode directly (please
>> correct me as my understanding is probably incomplete if not outright
>> wrong).
>
> That sounds about right.  There are secure and non-secure sections in the=
 firmware image.
>
>> What is the HW or SW fact that requires this on Turing?=C2=A0
>
> I don't know how to answer that question.  That's just how it's done on T=
uring/GA100.  I would
> need to start an internal Slack thread to get a better answer, and I don'=
t really see what it
> would gain us.

I'd like to see if we can get to the bottom of this, mostly because this
post/post GA102 cut is noticeable in at least 2 places:

1. The way FWSEC is loaded,
2. The way booter is loaded and started,

For 1. we have the firmware header version that tells us which method to
use; I wonder if there is some similar information we could use for 2.
in order to avoid hardcoding values.

>
>> Is it linked
>> to the fact we need to use PIO for it? What I would like to achieve is
>> removing or at least reducing these chipset checks into one single
>> point, which in the worst case could be a method of `Chipset` telling us
>> which loading method to use. But if we can find a distinguishing factor
>> in the parsed by this method, that would be even better.
>
> Both OpenRM and Nouveau use the chipset to gate on how to parse the heade=
rs.

If it comes down to "This is how things are pre and post GA102" (and the
evidence I have seen to far suggests that unfortunately), then so be it
- we at the very least encode this as a method of `Chipset` to avoid
hardcoding chipset versions in several places.
