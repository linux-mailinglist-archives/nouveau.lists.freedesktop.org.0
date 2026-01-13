Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F067D191C5
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:33:48 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAE110E4DE;
	Tue, 13 Jan 2026 13:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="AYu3Dgve";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6372D44CAB;
	Tue, 13 Jan 2026 13:25:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768310717;
 b=R1UJNTbHYL6I4WTb294EB62zBA1zcsvcpTx/WMGAw6nrtX+qUfnwq+1H+8Ch3r+BsFV/P
 3OrBAq+x8GfUHVFcZZL/nsIqdVmPIGsF1qj5LFnxdMiLfhLuqZ7ymMcLHjhiC5VLOFqA+pX
 wlX+zZ7/Qzm2oBS3rVYEUPHPaVj0NagHQW9OwM02QnWEmqLviDlIGaX8Qt3vZubfUmA6RiA
 /Ptz7IhSb6qXlqb8M40ABsMEZDkEF9bnF0c9u7O+hHNJm2GKkZurbPtI0X+09dCUh9WxMC9
 sofGBS4JfxadrDRdHzJgrVlSr6GRvN7xhIza5UyskmtkrC7riTiVZcQoPdwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768310717; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uwL3Dew+ng6+tvXd44vp1vLzVPV3nPry2DvyIvT9NHI=;
 b=iSuKcrWaHllEqvhfIJQKMnx53iTKR896yPADLkFzgBGg759v5KqMv2JrwQe1Qd7woX23G
 M8bCiIVzicU4fp3PoQqpoqhkgPy34kwRUOUxE0Z9h6D8DLaRycZw0CT8SqNCb2TwsyL6V5i
 cZQ3VF2l63yEeEA98GIC4xBniurQM+mdUk7pCe1u9zKeRT8akGryAai0d8tsPAD3CvcvA7I
 LprpD/acDfWqTHmcYca4nmIzrXAiVhImz93TSwNmQb15KoxXFoU988Yw/JJOXBSmKILFjY4
 OO41o+2Y97EnZ4g+A2TYJzyUKlIPL0vwCXnefMozro4WzrY/ICMu3p1+jj2g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5BFF044C9E
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:25:14 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021137.outbound.protection.outlook.com [52.101.100.137])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF6F010E2A6
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:33:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlYeo+c9q2qlJ4iBbZRqNbcNH1tpyJkC6sjpqRVvTBP/TQd6LkycAG0jE9XZbPYKVO4VP3VVoJq5aia3DDHdX5rwiM9/VplXwjUizlsw69bnybIMNKqNXzVhCcQFYy+m7rYnB3Tiy+svOcc/t+v6Qi2GwKnM5EfOsVHesdyP81fdE1TKR/6XVE13FJP5nWk4gjN3L6hK+sqZDIv45yyM8OkcL3EIvlS/6Y3NbyTNPunJ4Jd+Za5ZNhpP7GvZmAM64hLUoIh7tjIySUvFpvpUWfN9VrFWFPju1mB0INCbG1Sg3xTeN2/IzkXNdz72r+Nm1SGhUnUEyEnNWHoG1p3Rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwL3Dew+ng6+tvXd44vp1vLzVPV3nPry2DvyIvT9NHI=;
 b=jotEb8Ir9k9I82Uf3l8C52+StHJ8wuq5sKb3zP249gra+wXk1urp6POv1LvwoS3WDqGhNgb6V5L9Akmz9sqi1zAfJaRR0wwMFsjcOp+GHBpw1L7WJh89Xv4jAZLzyL8OIVtKB5DRCW0GW0Os9K+ZvJ3MgC1Eb4OcVH/pSS8iBvG65/bFjeV5LFPtOSZSpeTxM5JuanRBG0IwAP0QyHMpFcKAQYfK9kuN2/V06UnhUOsFpT914hKzEmSCrXMKh6N/T0u0k2CDvtM06I8GLqs0vlwjgrfVRhXnAlJxv0/6wV6bV1b8F0vn0GmFEpJS/snLGAvuiJ/oc0fw6xjeB8VO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwL3Dew+ng6+tvXd44vp1vLzVPV3nPry2DvyIvT9NHI=;
 b=AYu3DgveqSIzgrsd/H60GREMMacDzKCghqoDIq/auhVvRzS6F5gv10VX0kzXrJMjxxUjCdQlPPc7YJw9nEZMD2tchvA+UmMNggqNfmDAKBh4R90APQ+if00xK/8oydsFhbStIDMiwHMU8QKJ+lh0sZCljO8UK49n2mghYFJkp9g=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2658.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.8; Tue, 13 Jan
 2026 13:33:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:33:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:33:36 +0000
Message-Id: <DFNI0EDLI3MD.2YNWZBAWOFTBQ@garyguo.net>
Subject: Re: [PATCH 04/31] nova-core: factor .fwsignature* selection into a
 new get_gsp_sigs_section()
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-5-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-5-jhubbard@nvidia.com>
X-ClientProxiedBy: ZR0P278CA0056.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2658:EE_
X-MS-Office365-Filtering-Correlation-Id: f28bb0db-31ac-4a85-54c3-08de52a85c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tmt4RE5FUWtxR0k1d0dMWjBqTmFMaVZlZ1lEUVZ4aWlNdWZScWhWTmdpZ0pI?=
 =?utf-8?B?cCtUL1pCZXpXUWpIZkpmU2h6VCtzcXNycEluY2pWMnl5RGZmMHVIREpPM3dG?=
 =?utf-8?B?cGFKWmcxRGx5ZkJPZFF0YUx3bHVYblhUWjhLdXhCdnNFNEUvTUxMRU14cThR?=
 =?utf-8?B?eUhpM1VDSnZJNk9UUFJvenU3bjVjc3NGVzExNHdEQkFVYmlBRDN6K0tWaHRy?=
 =?utf-8?B?NCt1Y1pYcmtEa0Nqdy9zTXVBaU93ZVlBQTExZnR1T3IzMmp4dU5ENXp1bGV0?=
 =?utf-8?B?YWgxWFo3N2VVMzJFMWJPMjZTcDFnZTJaTUZ0ZVJOaHEwWkhsbUhUN3ZudHVx?=
 =?utf-8?B?QXByamlwNHhlRTc2T2p4MU0wVWFzTVR4Z2FXWHkxeEVpdVcwb1JONjdvLzZi?=
 =?utf-8?B?QWljd0FtcGFVempUNVRQNE5uaU01WFhBblFDZ2NVbWs3OTJUbklyeXJjOTZW?=
 =?utf-8?B?VVZyYThoZzVGQkFQamU5YzBRSDVlcWZNYnQvOHlROFU2c29TbG5TM1J0ZFY5?=
 =?utf-8?B?RU1jb1Q0NStEQ2U3ZHlQQXc1OTNia2ovcGdIcHFjc0hQNXNBbEcwcHlnVHJU?=
 =?utf-8?B?U3VyWWF2WTNzQnM4a1p6bjk1M2hLYzZHb0ZWRlpBMkYxVDgxd0tRWEM4SnQy?=
 =?utf-8?B?R2xzc1NnOHd1RWwyQzJJMElMVFpqVzViQ2FoUjFSQ0FRK2h0QVNMQVJVZjFk?=
 =?utf-8?B?Ly9IaVNwb01DQXVsQ1dVZTg5MFBRT1dhTXQ0YUd2ZkJ3bkJ0R2x1U3J6QkJn?=
 =?utf-8?B?VG00YU1KcGljUS8xOHptMTU4NG1OUjRRclBqa29GRHJMNHd3WkhiVWgxY0ZL?=
 =?utf-8?B?MUp2cEprUWV4ZzJUVGt1SlhZVW82QnBSUVo1TmFpWG1hR09TVU01dGU5Rytx?=
 =?utf-8?B?NFRuUEYzc2hVdVF2djhicGxUVU52eFhUR2t5cDJzdDZ1d3RlSHpzSHJRWTBS?=
 =?utf-8?B?czRScmoyanZjMFIzRno2ZVlrWXhrRWlDeGpBQ0h0c0lMMjdwK3hTS0VoQktq?=
 =?utf-8?B?S2E3Z2RwMkxFUm1YZXNyY0t3aHdpUUIxNnFVWGFGL1J4OXBHVEQ2bGhIUzhn?=
 =?utf-8?B?eURMWFdRL3NwSzVOaWROQTJnMTQwWWtNdWt4Zy9UWUk3VUp2WVFlSHVOL28v?=
 =?utf-8?B?cnhHaU4vaHNoWkdXT21yVGQvekJZMXNmcFZxRGJ5OTBXUmFRVUptcWcvbjR4?=
 =?utf-8?B?MWltZFBCMjhLdXlZV0dreHFadStHN3M3bExwR01UMytkRW1IUGp3MG1qZ1E0?=
 =?utf-8?B?a2xURVprdlZnSWJJYVNlNnUvd1h0eTZNdExsc2pLaHZHU1VyMWQraXlEQmpB?=
 =?utf-8?B?ZVlsNHM0dnBiTlBMdWlTTEdmUENtZWord3BZR2FTNTAwdERZckc2R2RZM1R2?=
 =?utf-8?B?TW1YTDJPdldLUDJsVmZnS1FUbUpwSlUvOHZSRGd0cGpCZklzczF3L3RWTm4w?=
 =?utf-8?B?dGtjbjFUMGhaeURNZ25ibEl6Njdiekhxd0RNcjJXWmY4M0lubTIrUFg5ZEZL?=
 =?utf-8?B?Vjl2dis1ZUZ5REtCeE9BZk5qa3k2VjRKZTFwWFNrbU5PVHZjQnNEZEtndXor?=
 =?utf-8?B?ek5pYzE4eC9MSkFjbk5saW9VVlM2bFJrVjh2dTZ6WlpOV3pyV3NLbDlMTWhI?=
 =?utf-8?B?V21oN0FNRTAxTExReVVCdFRxekxaTTVoS1dvc1VjV1ppVytJZlcrUW1GZVNo?=
 =?utf-8?B?ZUtBc0JOOHd6R2xwTWVnamJoSWlNWVMzcXpjTVNFN0J5c2tjaVhod0dJdXl3?=
 =?utf-8?B?RWgrZVhjSExRRG9EL0hXVVNuMURlQmZBbmN4UzZnWHJKUk1LaUVZRGNSZmMx?=
 =?utf-8?B?dG9ZbEE5K3k5N1hZaGorb0hBaFBRb09yVEtyQjROd1NUZFo1T2NNV2dmdHlZ?=
 =?utf-8?B?T2VvTm5tQnAxb1VPcm9xYmRyejZhMkI1YWh5cWtMWHJ2N0tTMXhmTTRhTk5z?=
 =?utf-8?Q?HlFkRT830TED/5c7J0mGcTi9JWivJUgS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFMzb2UzSjBrck4zOWc3TEt6SE1YdUY0SzE5STZiamU0ZTIwTlBLWGx2eU5U?=
 =?utf-8?B?NW1wSmN2M0xVNnlSOEYvZlk1bUxuaXFiOWVOLzN3cWlxNGdJaVQ1ODkyYlBu?=
 =?utf-8?B?eUhGSHJGR1VGNE8wcnd3MDdhYjVYSUdTaVplL2MyQTRwZjEyM3k3d2Q1dzU3?=
 =?utf-8?B?ckRubGd4MnppbEtTbGgwRmJLeFl3OWZrWWNqcWpJYVFscHAvaE1NdDFWeDMy?=
 =?utf-8?B?SG9PNmVyOXZvYXA4QWV6L2doZ2lvTU94SjBqN28vMW4rWVJoa3FUVXc5ZTda?=
 =?utf-8?B?TW1RNkxmVjN3cXRPWm0zT3JWRzNOVWYyM3VUOXZaS3VrclZkVFVja21sOHZU?=
 =?utf-8?B?VFJvWm4xeXMvT0k4WnhBell0endpbElkOWZKcXRjL0haaEFzdFhNOE8zbHZT?=
 =?utf-8?B?Nzg4TERWczlrRGZwMG5ZZm1lQTdOSnpBbllTbURmaG82TzNtNzhJTWI3YjhI?=
 =?utf-8?B?OHM3T0ZrSWwybGNYSXRXQkdodDVuKzNmU2YwUFRJdGJsd3RqS1NSOEl1OU80?=
 =?utf-8?B?azBRTFZ5blJBTTBBVVR4d2xxS3ZlcVlFVU5mQWd3azJDZVBlSlkrYTZsZXN0?=
 =?utf-8?B?OXZOZk05dVdaZkQ3Vy84M2h2akFQY1FzN1lRVDI3cHBqbCtIOEMzNXdrVnVD?=
 =?utf-8?B?VVNlNGY0VUxwNmM1SnJ3aVl4Q3k2akh0MVAxNkVyZmg5SG5ya1U2ZWJNVFhp?=
 =?utf-8?B?aU5NL1dqZndTbzlReFdzSHA5RG5ibFdsVGEyU0JObVZmc0JJdkZqZFU0REZT?=
 =?utf-8?B?UGdXUG9KWHo3V3N3RGFiUjZ0TnpnaE12MGtTeTV1Q1NPV0RuU1RvZUxuOC9j?=
 =?utf-8?B?NHZHU25UekJFdC95OTB0SmNQTTNJWUdCVC9ROUJrSjhXOUptbEwvRzd6Q21S?=
 =?utf-8?B?azlTVnhxRUY3RitVMlcyYVdvTE1ucDdWUmI1T1B4Y0xHNmVCMWNTdnZGcFlj?=
 =?utf-8?B?U3dYL1I2d3NSaTZyUW9mSjI1dU1CeEViR1ZXeExlVThXdGxDNjV1ZldMd0tQ?=
 =?utf-8?B?T1M5ZHc0VVg1K3lkUmJZQTVTYkFEeEFiVlFaSEFGb3FUZnNDRkFUYjFtS2Rw?=
 =?utf-8?B?WmZ6Y2dTdjlJd0FaaXV2cVZZbWNmS1NRV2VSQlU0ZTlkVksvVGF0akNkWFBN?=
 =?utf-8?B?WUNDczVqbG5QWDdCalZ4aVpqYnZOTlE1c05NZWlTejIzZnBqN1ptc1ZCeWd4?=
 =?utf-8?B?TTA4MXRsSnpxSFhjMk5vUzloaUtjVE1oRk91cG9vZXNJWEduU1BSdHp1bGlz?=
 =?utf-8?B?USszQmlkMy9SWDRXRkhlTUZtY3FGTm1vUVRuZ1h0SXBXM2RvYzdLU3pQRjhj?=
 =?utf-8?B?SVI0RjFGdDVWaGt1ck5tUWZiQzlKRy9rZXMwQkluNitYZ21uckFoWGdObVZ3?=
 =?utf-8?B?U29rQ3N1bVQvaUowb3Y2Y0RnY2NvU0t1WVdtVUNhZXdGNm9qNVhMR0ZsZGdM?=
 =?utf-8?B?RW1YOWZXOW9HYk9aWTUxWEZJWFRuOVpJRDcraCs1UDhKZTFiV0RDRm9PelVP?=
 =?utf-8?B?WEVDMnlHM0ZJeXBhdFZEU1JESVUvRVUzSGNMaVU3TGU3MGdTeGNyNm5USGg2?=
 =?utf-8?B?MHJCODRXWUNJQmJWYitEV09YT01EampxcitINWtvdGZldHpEVWdzdUNxRDNw?=
 =?utf-8?B?b0MxdkcyQmpxU0taNTJKcEcwc1AzSHJwWFVFQXJDakxuRy9PckZTcnV6RW5x?=
 =?utf-8?B?WmZER1F0Qms0cjVpSGU1Snp0OEVBYlV1czMxb1Q5c09UaG0zaTJnam5GaFZN?=
 =?utf-8?B?Yy80Z0Q3UExzRzJjcVRVb3JyYlpoMHR2d1NTbW1BUWRINUpSRmZHeExWWWs4?=
 =?utf-8?B?bG80ZnpRK1B0NXVLdStsa1hZQU5rZlUyeXhsMUJ4YUhBalpKcVdXZ0NOK2Zj?=
 =?utf-8?B?emV1RVY5eDJjQkVOSENGcitGNFp5RDJmWHAxMjJlWVU5YUNzbDJROUlaSkpR?=
 =?utf-8?B?WWtNa3Q2ZGgxREgzRDJ2R1RWSmVHTXpzemtFNnR1aittYUpjcHU3a2pPTVZQ?=
 =?utf-8?B?cWZFalhSYmZ3akx1bnpRSmFNeWltM3M5alNpb3hsKzB1TyttNkV4WUkvTXMy?=
 =?utf-8?B?VVcvd0xCOGo5UFE5amluNXRBM2hsbms1M3FZaGxqYnBOQXk4enNQYTdJUVlx?=
 =?utf-8?B?V1ZwTHFNMzVDVnBIYWhTSHJ5UWNmVlNFS1RuSUVTcXVTc3dRaTI1Zm1SRGps?=
 =?utf-8?B?c3JCdEgvdmR2aVg3aU1Dai95N0lxZ0NBZk5TWGtERFZzeDI5NkFCOXpZdlFq?=
 =?utf-8?B?RG8rNXhLRXIvNGpXZXZPVzRtMGZROWVWODFpcUVMeEJXQWpNMldmM3dXc0x6?=
 =?utf-8?B?d2xFQXhkU1JuRUEyK3ppUWJraXliMzRvTVB0STZqQXl2Ukx2WjNnZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f28bb0db-31ac-4a85-54c3-08de52a85c5e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:33:39.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uNn9tbelWcAcRvpbA4ba0BIRtk38KfUBLUPJBc6FChXmqG7T6HHYcVNMySeEEnBhBDBxw7MDvm9G0dLDEGb3KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2658
Message-ID-Hash: 4BQA6BTFFN3S5ZZ7DDUJ4KA3NHHU4AG3
X-Message-ID-Hash: 4BQA6BTFFN3S5ZZ7DDUJ4KA3NHHU4AG3
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4BQA6BTFFN3S5ZZ7DDUJ4KA3NHHU4AG3/>
Archived-At: 
 <https://lore.freedesktop.org/DFNI0EDLI3MD.2YNWZBAWOFTBQ@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
> Keep Gsp::new() from getting too cluttered, by factoring out the
> selection of .fwsignature* items. This will continue to grow as we add
> GPUs.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 43 ++++++++++++++-------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 547f46b6655b..86ed4d650d05 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -151,39 +151,42 @@ pub(crate) struct GspFirmware {
>  }
> =20
>  impl GspFirmware {
> -    /// Loads the GSP firmware binaries, map them into `dev`'s address-s=
pace, and creates the page
> -    /// tables expected by the GSP bootloader to load it.
> -    pub(crate) fn new<'a, 'b>(
> -        dev: &'a device::Device<device::Bound>,
> -        chipset: Chipset,
> -        ver: &'b str,
> -    ) -> Result<impl PinInit<Self, Error> + 'a> {
> -        let fw =3D super::request_firmware(dev, chipset, "gsp", ver)?;
> -
> -        let fw_section =3D elf::elf64_section(fw.data(), ".fwimage").ok_=
or(EINVAL)?;
> -
> -        let sigs_section =3D match chipset.arch() {
> -            Architecture::Ampere =3D> ".fwsignature_ga10x",
> -            Architecture::Hopper =3D> ".fwsignature_gh10x",
> -            Architecture::Ada =3D> ".fwsignature_ad10x",
> +    fn get_gsp_sigs_section(chipset: Chipset) -> Result<&'static str> {

I would just return `Option` here, and have

    let sigs_section =3D Self::get_gsp_sigs_section(chipset).ok_or(ENOTSUPP=
)?;

similar to the ELF line aboe it.

The code looks correct to me regardless if you make the change.

Reviewed-by: Gary Guo <gary@garyguo.net>

> +        match chipset.arch() {
> +            Architecture::Ampere =3D> Ok(".fwsignature_ga10x"),
> +            Architecture::Hopper =3D> Ok(".fwsignature_gh10x"),
> +            Architecture::Ada =3D> Ok(".fwsignature_ad10x"),
>              Architecture::Blackwell =3D> {
>                  // Distinguish between GB10x and GB20x series
>                  match chipset {
>                      // GB10x series: GB100, GB102
> -                    Chipset::GB100 | Chipset::GB102 =3D> ".fwsignature_g=
b10x",
> +                    Chipset::GB100 | Chipset::GB102 =3D> Ok(".fwsignatur=
e_gb10x"),
>                      // GB20x series: GB202, GB203, GB205, GB206, GB207
>                      Chipset::GB202
>                      | Chipset::GB203
>                      | Chipset::GB205
>                      | Chipset::GB206
> -                    | Chipset::GB207 =3D> ".fwsignature_gb20x",
> +                    | Chipset::GB207 =3D> Ok(".fwsignature_gb20x"),
>                      // Non-Blackwell chipsets, which can't happen here, =
but Rust doesn't know that.
> -                    _ =3D> return Err(ENOTSUPP),
> +                    _ =3D> Err(ENOTSUPP),
>                  }
>              }
> +            _ =3D> Err(ENOTSUPP),
> +        }
> +    }
> =20
> -            _ =3D> return Err(ENOTSUPP),
> -        };
> +    /// Loads the GSP firmware binaries, map them into `dev`'s address-s=
pace, and creates the page
> +    /// tables expected by the GSP bootloader to load it.
> +    pub(crate) fn new<'a, 'b>(
> +        dev: &'a device::Device<device::Bound>,
> +        chipset: Chipset,
> +        ver: &'b str,
> +    ) -> Result<impl PinInit<Self, Error> + 'a> {
> +        let fw =3D super::request_firmware(dev, chipset, "gsp", ver)?;
> +
> +        let fw_section =3D elf::elf64_section(fw.data(), ".fwimage").ok_=
or(EINVAL)?;
> +
> +        let sigs_section =3D Self::get_gsp_sigs_section(chipset)?;
>          let signatures =3D elf::elf64_section(fw.data(), sigs_section)
>              .ok_or(EINVAL)
>              .and_then(|data| DmaObject::from_data(dev, data))?;

