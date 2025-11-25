Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5002C856B4
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 15:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8868610E40B;
	Tue, 25 Nov 2025 14:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h6fx2Auh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3394810E40A
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 14:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWVrAKodA9BgvHSSc5xQKlhm2z37VVZza3t/BmsYpwts/torF1twS/Rq7MKE8yAHrGD03Bjgem2RV9y2yhS9p4dU8fzymlzlEwVhb4bv/Ir6IxpeAFOfxMPT0aYKj6Ll+pbaPEhn65RZXz6jX2ZM3QGmK2XPTaExtgljOxqrnb2BJJ920fvRBrARUtcusosAjFk6LrZ+tUVTCbEI/KkXozhobfSg2/5+Z0My4m4QrnWC/cXBmY+QuIX0Yxcasrnd+UGebt9PR/DTU68OaI1FlNd4bfYk18ueUKrY4nduD6VQkNQvmhwitqY2xwuBjf7zhGh4Tekz68VbHqaLuraKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGt6KQoXgJBdeTaYjrnRyrayEotuDx8QZj88Lz3EA/8=;
 b=mFpGgauYnXsTGDCIzgeXHoYgPWbwQTLVWnP9uKs6lXT55mSztjpCaQ5ReYsmw7sqGkPA5TFqnxI02aalqt9Gdtc5zqwbaG1SXoGMog+4rzgoFJNxVnfiulzbzKAxZ/m063m/+Z91KORlZqq686HjLt0mONGiKjq7IcJF8+TjG8RiSLaj3jedKUlj6lRoijO7neBNEHV2IxhhU7Q2apFOrALR8rvJyBjIPd8ZcAN0/W7E+UA2t5TdkjD8dQTHiB4UuO0rGfeG7ynhDNQmOPm/+VlRIJBdo6LkJgVKti17WrEWcZainnN0Ubz83bE5t3WYFQ3fP6mfe9UwFLk+W2/BoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGt6KQoXgJBdeTaYjrnRyrayEotuDx8QZj88Lz3EA/8=;
 b=h6fx2AuheDAEsFvuGZ40hKUaq1qWTJRDg5o4UvbKJlMd3CO+fgPXlUIc++A23qaAYl/Z+P2ZomTaVrapoqikLNXiFyT2b8jD/mdSDdw/h5+J8ijuuKB1K1kacuHHGTV6fyRsmZjN7F0opfuyrkv6afkz8wCqkUc4MqP13sbnkBLmzQfdM5aHy6vNnVkO326DNsufWRN7BWbVa1PGfVq8rihQPdSjDcta9pwOH21a7T3pkWclU0SjOccth5u02+0CYYMpk3O6nH/ffg/Y/ZFrnPF5h81HsUTL5zQl3SmZVoW5/mAxrApDXausfZefznDvjcE94/1upUj0iWFCqLC2TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6034.namprd12.prod.outlook.com (2603:10b6:930:2e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 14:28:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:28:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 23:28:29 +0900
Message-Id: <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <brendan.shephard@gmail.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system
 page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: <bshephar@bne-home.net>, <dakr@kernel.org>, <acourbot@nvidia.com>,
 <joelagnelf@nvidia.com>, <jhubbard@nvidia.com>, <airlied@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
In-Reply-To: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf5a514-ae14-4009-2fbb-08de2c2ee933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXdCNnlqd0w2ZEI5NzE5c0hDTnh1VVlRQVpUMDBrNEhuTm1lcTg0REc5V2xP?=
 =?utf-8?B?bzZxdWd6SHhYeHNaemtHTWZZODdWWmd2clV5WkVPdjBnVnRSRHY4eVZkQ201?=
 =?utf-8?B?cW5jRkJsRFBiWms1Qm04SjhoTVRKazFnTm5UZ2N1MXZMaERqUHkyclhKOUl2?=
 =?utf-8?B?cWNXUjFhQkRCWGlRWm03ZitYaVBMdWlWQUJxd0JSYzczTnhCUlJXT2kxQmht?=
 =?utf-8?B?SVYwcElQWTQrSXVndHVsam91YS8wM3dqVnp4MlFKODc2ampTcUkyVU9CZnhm?=
 =?utf-8?B?NG9wZldSQUgyUTJ3U0N2VmtueTN0TUh2a3lWZk5vTUFGUTJ2bDNmZ2laODQ5?=
 =?utf-8?B?WWc4T3Rkenh3eWl0Q2dIdWpEeEJLYXNHR3NkaG5WY1BSVUNiV2VjanN2REZ4?=
 =?utf-8?B?RzV4dmRnbndmemE4YUJrZjZNRDg3eFVwa3U5dEx0SzAxSTZoamJqdk5YNkFr?=
 =?utf-8?B?aE9vVFFBQ0UyRUJsTVFEdmVGUWZqU0FBbWV1M1N2TXZld0JaZitXOEQ4VUp1?=
 =?utf-8?B?cEtCY3M0Zll2bXpwRTNWL1pEbnFPUzd2bzZVR2thRnBESCtlOVhWL2JZMk1B?=
 =?utf-8?B?MGF5djdpREtVd1V6alRMenNjWDJUZTNBWVFIUC9qZWdQbndRSWx1d0M3NkF1?=
 =?utf-8?B?ZlRzTlpuVW9KMFZuUjlNTGtOUEJJRk1RaGNULzI4dndYU3FkSHJIRkh3Vk92?=
 =?utf-8?B?OVNyYWpPRXhvSEdmbU96aXlVS2RqTDNkd2lpaUtWU2pTN2E5bGwzNUtlY05n?=
 =?utf-8?B?SDRzYndxdzVqSUpma3orZ2hzQ2dBcUVzNFF2SlcwYlVTVGZ3VjQ4bmQ1OTFN?=
 =?utf-8?B?VGtxa3VDSEdqWHZyWjBIR1Jjc3hpbkloWVZhOHRBbE9tTm04U2NwYm1QZ2l4?=
 =?utf-8?B?clQyUzJTS3BheGZFNWhTZGRqTGVVK0lxN05NUDN5N3BBNXowUVhOU2EyOGJQ?=
 =?utf-8?B?bHIrMUowdm0zN0ZPbHJ2dTcwOUZZSzVFMElHaWRRUUViMGNmWWtJNlNNdmVR?=
 =?utf-8?B?cTQ4Wnk4V0ZTN2hiRHFpV0xvU2RXTllIUlBGVWp5NmFRdHFPVzdwU2dFeEZN?=
 =?utf-8?B?MUJaVktoYjBrZ0JBWGNIcGpQUWJQU0g1VDB3SGN5VkdSbTJydmRIRWVncDFa?=
 =?utf-8?B?U1RkdWgrdFNXWjVtcGxsN1h6NEJ0dEt1VXN5ckg4NnNRelFXZXREWjRpaW1k?=
 =?utf-8?B?K2pIWGV2Wk1kOGw1enpPTk5OeXRwQUg4RFZZNjlad1NDd0hCbktyOTdyRjNa?=
 =?utf-8?B?T3hvbVZHWHA2SXZDK2c1VlpCMmtlcWxTUVAyU3kyMFk0K3VRdlVubmVZRWRG?=
 =?utf-8?B?Mkgwd1FscGhEYkxJTmNZNHMrYkJXczh5M0ZHdzg5WDd3ZnZaZldRQlRZa3c3?=
 =?utf-8?B?ajNxbURyMnpRbEZhS1Y1UWVLY3RaMDMrckRsWkJtbzhaZk8zREFxQUFsbEt0?=
 =?utf-8?B?bmZuSmtrN3VleVZ2NXJrZjhwTnpjK3VVUHE2bk5ZWjk1dnhTdzcvOVlKYm1k?=
 =?utf-8?B?cUdjcU1LeUVOMnpNYWVUNjZOSE9hVFdlYTlHa1JLOGRTdHdtMXdYcmxTUW1R?=
 =?utf-8?B?ZEZ6aHVQSkxFbDRkdHA2Y04yRnlPdTlpdEdSdmJQS0xndWdBTkIxZkQrazlD?=
 =?utf-8?B?QXdOaXhYKzdyUThQc2xYampudm5ld2gvQjdYK1dGR1hNSFZyTmtGNlFhRExS?=
 =?utf-8?B?cEpicUNHVWJ5VTc5VWFodTdONkpKYlk4cTBIK05sN1dWY0RXMWFGM2R1YTdx?=
 =?utf-8?B?YVVQVjVJRzB2ZThjVmtHcDAwZk1vc3dwMmdINmMyZTlwaGZObmR6SFlpRTNE?=
 =?utf-8?B?aEZvcnNWVjNjN2kwVitsNHUzTlVJSW5WNy91ZmkyOEs2UXhLYXYxQ1Y1NUZ2?=
 =?utf-8?B?TXJtcW03bWV1MlFmdm8vZzJRQjZhMjc0cTV5RzN3SzZaL2N0aTRobkI0STlj?=
 =?utf-8?Q?emjS680UtrY5wVAMlBtgAiOapENQFLgy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFV1bWdsYlBaZUJuV3Jjb3J2QWNJaFhhYnE1Zk1POW80U1hDUUZORGVVLzc2?=
 =?utf-8?B?eUpHelVPbE0zbnFZbGtYVkdlTmhueEMyeUVZSk5sZGM3TTdpa2MzS3ZuNnFh?=
 =?utf-8?B?ZHZJWXhLN2lRSGtzeEpER2N0SnQzd1FtSXRkREZrNG9DRDN2Um9YV3dkcGg4?=
 =?utf-8?B?d2JxNTVBV2R2SWpZa3BiVXphL1hpNEFTdXZxMHhNd25PSVUyZEtuVGpkSWF6?=
 =?utf-8?B?TERHS1BaSXg1Wk84VWlQQmxiQ21zcWVTMlRrUXNPanZPb2VMWUpiSFdvaUtU?=
 =?utf-8?B?OG1ZaU10R1NwOFBkaW00Z05XaUJ0aEliR0QzcWs2MWp0KzdUbUlqSTJDOUZt?=
 =?utf-8?B?L2NhOWJBeFg1TjJ4VGkvUzdjZDB2RmZjVDdIcWtYTFlIRTRCemp4UHV5N2Jz?=
 =?utf-8?B?aXVCalZlaG1BMnhHMkVLazdia1FuTVFrdzFtcmtUQm5hUTk3MTNZRStlVjVY?=
 =?utf-8?B?QmZyNmU1YXNzcVNrTVF6bnFWTkVIWU41bExkR2wxYlJ2b0FSbUZ6WFF1NlAw?=
 =?utf-8?B?R1JJMXdtUTU0eGliektTMEhrV0s1NUVQK3Uyb2tyYlVaWjJvMGsxaERiazVQ?=
 =?utf-8?B?OG4zWngxZ3VuY0xQZDRYc2lJYU1zMDhybVVoYTNOdVFOUlZIMjRoMmRpZDBa?=
 =?utf-8?B?QWM2bERoTzJRVnlxTnNsZHhENTRJWUxveUhZM1EzeU5HV3JLVEtTdHBXbUpV?=
 =?utf-8?B?MkhaZkhScnhHZ3IvWUYzb3NtbXM0d3lqVUFEWWhJVzJyMGcxNVVNWGp6blFp?=
 =?utf-8?B?M2hNSWVWWTZEU1dSYTdtaTI5Y3FOc3hTNFVWUHFBbHVwNCtEUGxDeFlIVTAy?=
 =?utf-8?B?SWgvT25RUXVNUDQrdWQ1Y2F3MFNTRm1QMndNUnBxVVMwMElJRzVrOEZSUFgr?=
 =?utf-8?B?dFFkemxzK3psakhqemEyR3BPYjRueStuS0FzeC9NSzNjOHFDdlVLemhValVx?=
 =?utf-8?B?cm54Sm42Zi9LNVA1WjFKMHpseVlPSVFOMWlOL3ZOVEVtNHB4eks0TCtTMTl6?=
 =?utf-8?B?c0pUbTlrNDAwV0JrT0ltcXdady9yUlNRYnhOdUtPQlkrQWVwOEhIUERqT2JO?=
 =?utf-8?B?ZDhFNjVlUDluVDYwdWVTN21uWk1STjY5V3RjVmR5dVVJYWJvMDh2TkdTU3Rt?=
 =?utf-8?B?M0xLSjd4cVRUV1NiSHZ4Z1NJbDMxUWdXeC9KRUpuNVRqQVJISElRWFBvb1d3?=
 =?utf-8?B?aXNuUE1WdXQ1RXFIZjdSK2ZNeEViWUlUdW4rTis4dWNkNUNQVHZ3TFVPRmF0?=
 =?utf-8?B?RUhuQkhCL2IySXJNVTBaOFB4bkJQdE9KakNOUzlYaXo3QmpQZmhuMmZ1VTE4?=
 =?utf-8?B?Yll1bzBaa3Y4OURNd05jS2ZmTFdLRkMvajNWZzRnQjV5eE5GMGxEQVJJWG95?=
 =?utf-8?B?cDV3OHpwVHZ5Qlg5Z01YWGFRWUdETDVmeVdPRjltRVFCd3JkVWNyNUxmSkJM?=
 =?utf-8?B?clhZRExvM3lld08vY1dId1VjZnJ0OHRVTzNzR2hQSm9wS0tuZ1pnUUpQMWwv?=
 =?utf-8?B?NEFodHdHNlJUNEo2by9CbDFnaW5tMlFqdEVwQ3Y3K0pxVmRaeU9YYmxad1g3?=
 =?utf-8?B?TGUrSlhDRzVJVzNUOWt6NVF1bWh3MlZOZ2VlL0o1MnNrSWJtN0pSVUFrYXkz?=
 =?utf-8?B?SE94aFhnbmRkc2ZUYVRsQXUrYmxRaytuYjFkZE9BSG5LZXdMRTErSC9CanVG?=
 =?utf-8?B?Rm5xcGZLNlZCaWpjQWVjWUVYVW5rQmJ4dGZYN0JpRUtzcTYvbUZVTHMwaWlh?=
 =?utf-8?B?RHpJek9WQzdGcFd5QlU5NVBNaXhzV21oaFlkeStzYk1hempCUStVc21QMnlX?=
 =?utf-8?B?OHh4UlBBWlN2OWxhVHZFUlJYOEc5ZVBRK0dSY0NSelZXZ0JVZEdpa2x2TW5z?=
 =?utf-8?B?NzVJcTQ4L25xZmpySEorc1VYRUFjVjRGSEowdFFuVE1TbjRYWENCN0ZraUx1?=
 =?utf-8?B?OTNMaXB2dlNQMzVIVFUybUZ4M0pJb2dlWXFyb0JUcktRSW9DeTFPQzJrY0VN?=
 =?utf-8?B?NTRJRUh4YW83ZzhoMEdkK010aS8rUC9ldExQbFNRYnpnblhZdE1PVGVTN1Vs?=
 =?utf-8?B?MVBya1Yxd0J1R0U5MWVZZ2EyVE91QjV4QzB6MDA1ZEpWUzQ4VzBJOGpveWlM?=
 =?utf-8?B?M01rQTFOUXozWU9YTVo5VktGU1NJemlSSW1UYXdZR0F6Y2U5WXZZYWVreVoz?=
 =?utf-8?Q?HqYBoR0Gk+nRmrO/Zq/H5qldYauDhiktp6btzguo6uiB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf5a514-ae14-4009-2fbb-08de2c2ee933
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:28:32.8030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ue8gbSTTJT6erw/EEHanM+4pmhqR7D0IMsexFesvWlzJ6l7edBaIi3DSPzonTbHQmQ8+e+wNgSbiBehAI/n1Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6034
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

On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This ensures that the allocation is page
> aligned with the system in cases where 4096 is not the default.
> For example on 16k or 64k aarch64 systems this allocation should be
> aligned accordingly.
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
>  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450..a07e922e25ef 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -3,6 +3,10 @@
>  use kernel::{
>      drm,
>      drm::{gem, gem::BaseObject},
> +    page::{
> +        page_align,
> +        PAGE_SIZE, //
> +    },
>      prelude::*,
>      sync::aref::ARef,
>  };
> @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinIn=
it<Self, Error> {
>  impl NovaObject {
>      /// Create a new DRM GEM object.
>      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem:=
:Object<Self>>> {
> -        let aligned_size =3D size.next_multiple_of(1 << 12);
> -
> -        if size =3D=3D 0 || size > aligned_size {
> +        // Check for 0 size or potential usize overflow before calling p=
age_align
> +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {

`PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - well,
I'll admit it looks better as a placeholder. :) But the actual alignment
will eventually be provided elsewhere.

>              return Err(EINVAL);
>          }
>
> +        let aligned_size =3D page_align(size);

`page_align` won't panic on overflow, but it will still return an
invalid size. This is a job for `kernel::ptr::Alignment`, which let's
you return an error when an overflow occurs.
