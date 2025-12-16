Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2138CC5499
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 23:02:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B14DB10E99D;
	Tue, 16 Dec 2025 22:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OJit/uw5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7CCDF455FA;
	Tue, 16 Dec 2025 21:54:39 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765922079;
 b=eJcMYF5AuZNmbzhHXOsDmVSAskHtom9ZQfLtf2Or5Z47w51jNEij9dZRpcT9Ec4ldZQSY
 0gL0PHT87hVh9mB69Xn/Kukm7ycRUv/qOAcP0oZK3HiHxszDQ+P/UsX3IbdF6dIT9cC2U7S
 hqtI5sRjY40bJ7uyUa4Yv232zOvPlVTyDq7qYIkWvMqsuq/8quMyNDPbt6upNvpeOWYgWcK
 mtE0nCrB80n3ydhDuFA7ilf4X0HIqi/Rlw7695fJJlf7USYQoSJlT2H1P8SfTMThXPENVOM
 gw3lCTUabrj4WyZNFvdTMLv1ZFvFACgh92dhDtJDBM6sEP6JTcDfR9Lh2YpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765922079; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qtIq9syOMXLu63aZLyCTAbbLeSeSlPe5o493829r+Lk=;
 b=A8PwrW2dGoJyollycuPFlTOPxFbNrlc521KBeXPpCdik2uJIlqgpee3V+tP4AsXh70cr9
 X+tpvqXZ13LQNI49UpgxOA0tVwBtKK1xODpx7yWgFKWcXeY/APisoAYxUwhvaJS+oGM/SyK
 3gogSY2lImxxCEMscZECzaZ0Dqqu5/VbD0dOSpPiqimFI7uVFofJ9/MFM6JWraXakqT7mrS
 ZD39MUJ/xK8VZIZyL5Mgbl5l4hTDvG9r6daDLOuB6OSga3exNLN1aq+hZQSLnXrVfUcc7XU
 1RhDO4oMiv5aklTwInn2B7ydkXKmBsM3re2jXfPHiTFgetDGeNm9mv1Q0AWA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A22F1455CA
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 21:54:37 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013009.outbound.protection.outlook.com
 [40.107.201.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7752910E36C
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 22:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MfiLP7aqfybZfu7AuZbvWayXa7Y7W+rNEV5AE/wokfkAPUN2BmQUMkMPj8Y8Bt87sw+DuzqLYbWoIj+Ni77RHNIwiAiMzdRjR58N9G2dOJJZN8RWO757NR1GUGufrYc59pSXYyeyJWOpQX+JM2nx2q9WwmjJFPt8NOBCJKd9U4Kq6+s2OydKMXRbHk4kMPh3p2zjAPl+FuWAXE1G5UEIHa/DokWCqgADS6qAf+EHmG1O891egL9LUz47tCPrCmThSp6nbd1s2MdGnW+G82N3lYgu2SxY6UEfYjZVqrJHicuss2uOIxPImYtd4GUsNEFh1azffY1hTzudsjF+Ht00hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtIq9syOMXLu63aZLyCTAbbLeSeSlPe5o493829r+Lk=;
 b=yQrbpkQ3GeTwr67TBFsdwEVUzqIlUR+VDlLnYGR+2BdkBdzSx1XLVle9hzd49Gwgo3Zeklmuw3jGE83qwT8YrNJi2j6V9zAxk3OnvMpCWd0wbB7VRvf2YDjdd+Yh7aobboGmg/OOWEEqeHQcckYNjHD1jNvP/PZozPV034NjzvP7ky8RLY2ZcSk4TUBdmtbJPsxytde/8VxWwVn0M+o009wkYPzgjNEpd73PjZoHgIU7y+hGqahqmjU2SNFEsn112zNuqiNepqw7ZjH69BHIm1wUXvgV1kI9+tclYDW0AqcCTsFqpWBeEBto4FT4pL1eX9eydW97DBvaximhwANltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtIq9syOMXLu63aZLyCTAbbLeSeSlPe5o493829r+Lk=;
 b=OJit/uw59SCrR86+P/J5k6iLLqh1LR9bQT1pOQyfZaNQ8DlN0+q5FtllqRgJAGv1VJt0NBlwlc8UQxMnwnr3HsqTkDppL/bJ+xo3NbiCsEcntDaTcEcIAgPIJ+ofMYNyCOWzSTfm3ABNZwN+QUbelM+v+jMDp3fd+g3Qn/g9xXiiyVU4Hs1F5qsN1ImaN+oPbZy+Bfo+5BtDFiu8leZGoWAZCT202/urvx0EVwAIVsPPFpiHaXHnoMd+tO1y72rME7fcou9Cmif7eih7ikzXAbMxCxXZYrXeWhzbXoqJMgqHSpe2cK8RZZSV3TouSHLV+gJxvp7dwo7pSl4c3on3dQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 22:02:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 22:02:00 +0000
Message-ID: <378b8542-86a4-4c8c-b1ec-070d1b2372d6@nvidia.com>
Date: Tue, 16 Dec 2025 17:01:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 John Hubbard <jhubbard@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
 <20251212204952.3690244-4-ttabi@nvidia.com>
 <20251215114036.302303e0.gary@garyguo.net>
 <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
 <a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com>
 <bc1ff6c7c86487143de7afaaef78d8361f590c13.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <bc1ff6c7c86487143de7afaaef78d8361f590c13.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:208:120::36) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1198aa-f340-4348-e970-08de3ceebd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d01iVWZMOE1SMmR2OC84UkZCeWpZUmdUZkFKMEFuRXVYM1EvT1hXOER5VFpw?=
 =?utf-8?B?RG8xRDJ0QnI5WUhycTJ3L2RVc1lXdXJ1dHNjSytPRk15elBJUVdpdUxuL24x?=
 =?utf-8?B?M2ovVkZLTkhWV3FFak9QbTdaZWRtd3EzUnI3NlAxYmdRZHcwTE1CMXluSXZ1?=
 =?utf-8?B?N3FtQ3V1S0JhQi8zelJtcGFJVjMxSFFXY1RycUw1NU5ZSXAyR2tsNDZsOHpw?=
 =?utf-8?B?Rk1kRDZYNytVNk9LUlVuL3MwTFQ2ckFxM1JsV1Q2RVdJWkNMVGFncjhublpR?=
 =?utf-8?B?c0c3ZzBJR1VRT3k1N25wY251M3dIWThzdjB6NStKcm1DN2tFTmJ4YzlRd0Vy?=
 =?utf-8?B?Vms5Vk81bVJEODJXZjB4Ukp5OGRpQVJjeXZadmVUSldMMWdEN2MrRXdQRHNa?=
 =?utf-8?B?TjI2VHFRRjA0SDdjS2l4ODJKZFRySmtxaGNmdWZlWlNSSU9USEpEc05QOXZa?=
 =?utf-8?B?S1VveWlHRTdsbmE2SGxHcWxDOENlRmNNdURpZ2wrQlU0SFlLYURnT01kcC9n?=
 =?utf-8?B?dE40dXBlV3J0T1M3R2x5QlVpNUtwVzVTTXVYL2h3em9lelBKK25rb3pWWW5B?=
 =?utf-8?B?ZjlGQXphQkprY1FndzNTbzFkMUZBdFJoL2ZPWk5zQ2c4WEE0YTlzcVJxWXpE?=
 =?utf-8?B?MFUxS2lDTWV2STZUZTQ0ejlwUlE5c2g3ME4ySnpFVnRIeVN4SDdJMk5rK2JG?=
 =?utf-8?B?ODdJMFkzZVIvR0lRbUVCN2h0UXRPcUpYUFVGVGh3THc1R29GcDRYNk9CM0pr?=
 =?utf-8?B?YUhMOGd6aFVPUERUcDh0aGlRRE5kb2k4WmdZaU1aUXd3TzY0bjJ2b3pDdGVU?=
 =?utf-8?B?ejlUOUhHeTU4QnN6U3g3MUxuZE43TWNXSW0yVGV2NndNZHBaWUZwZXBPWGFu?=
 =?utf-8?B?K29iWE9pWXdhOFBReS9zamJUdnRYcG9ycGY5V1oxQ3Vpc3RXUFBLRlIvUnZM?=
 =?utf-8?B?aEVnQ1A4Y3VWVW1ueG5ReHkvR1FSYVVaQmhMNXBvODBkM2FVSWpYQXpPdTFx?=
 =?utf-8?B?cDVlUmowUmt5WjFRYlY1TS9LdEhiMFhmR2xTZ0ovbmJJdmFVRnpTYmMrN20z?=
 =?utf-8?B?VXJ3L2RBMTVMRHBxNG9wQlBtOXlwY2J5eFhUUERvbjNxY01DTXk0MXJsaHI1?=
 =?utf-8?B?L29aMkZDbytxbUY2NmwycDRnSzVDczZZMkJ1dTEzLytZQnB0TlczWlIvR2pC?=
 =?utf-8?B?VnZ5dnNKU1ZpakhYWFVhYndGTjZMTEFYNEFIY2Q2cGc5Nm5nQTZTMnVOSUU5?=
 =?utf-8?B?SmhyYVFRRUZKYXFoL2RUOUwyalhmMVpZZ0sxMVo4V2tlNzdVNnJPRmU2WVNC?=
 =?utf-8?B?MEJtOGNROGRXWVY0Y0NWVFJaMzNEZzRzY2w2TlFUbTJTMGJKZE1FSjhvTmhZ?=
 =?utf-8?B?cGRmYUVmVlhoSG1KQVpMM0lWR1hTZkx5RW1hVVpzQUVhbVYzRW02MlNSRlRr?=
 =?utf-8?B?SXp4QVYxOUdNQTE4NWM1MmFoYUJ0d3hEeUpHb1hqL2VlODRLNG9FQWV6Z0px?=
 =?utf-8?B?OVFyUHk1OFViR2tDekxPNHNXUWVSL0FYei9RQ05TR3hWR2xDK2phT1I4Nnl1?=
 =?utf-8?B?bWk5M2R5M29ZRDVTQ09tQWJsTUhteVQ4Z294ckhvRmhpaTFBN1dZL0hYanZ1?=
 =?utf-8?B?WVh6OWtoYW9wWTRRVEhpTzVqVmhUMVNyV0svdG8wMTRJNEwvZ01HeTdPK1Yz?=
 =?utf-8?B?UXh5SS9JeWJhYkoraWlxMW9yck5McW93dHkxQnUrbXV6TXJhNVluREY3YVZD?=
 =?utf-8?B?WGJ5ZXNMckFnTkM3WDI1cm0vemZZS3hON0g2ZUU0czJaSmwzN1ZxLysvTFU5?=
 =?utf-8?B?TkttOXRIMWg1NGZXa2txcTFERFJ4eTlTRDNJditmNkVLcGhEQm1rM1NWNFMy?=
 =?utf-8?B?Zm9yRFFqMmUyaFZsL01IZVBvaUtPb0JjcjB0M056dm1EQWxuNDV0V21FM3Zk?=
 =?utf-8?Q?ExA0EvSdIVdZU8Jw1ag3SmVkeYJpZSd2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czZ4NFZneS9hTWMxZ0ZWbk1QZGp0ZW1JTU05Q2dBMUJnUnFIcTRCc1hNSGFU?=
 =?utf-8?B?WFFUenRCTTN4V0xQZDlXT3lXZnhSdTA0VXJOVG5mT01ZcnBzdk5OSjgyWVRs?=
 =?utf-8?B?RTdidlJTdnNyNzUwODNiUEkzZ1c0MEpOYjlMb093MlRpblEyT3FzMmNKWDIr?=
 =?utf-8?B?TU1Bc0lRM241SjVWbS9qVmFFQUdrdTlvb2lLRGNLNWRGZlY2aWFnRUFWbU0w?=
 =?utf-8?B?MFF4NkFrQlNjTXp2a0M0bXB4YUU0dVRLc3NCRFh6cVVKMXlDVlU4N1hHV2ZR?=
 =?utf-8?B?TVVHUnBycXV2UkUwNlBpaHVVaVhWMU0wRVNNd2hpeENJWStTazJ4TUtXMGY2?=
 =?utf-8?B?L3Z1aDNDRzdzSWpiUjNRQXJWaVY2M2tXZENNVlEwbE8ycVo3WWRzdDRtNzVT?=
 =?utf-8?B?eFJHK3VJZVdBcUtWZG9ucjNqYStxVnpBaGZ5emNFTmNKODV0UW0zK016cllS?=
 =?utf-8?B?RnlCUkRXWXV5RmsvbkJRdmhqWjdSVmVFb2xDV2t5WUd1TnV2WGxYWWFickVl?=
 =?utf-8?B?OTVpTll3VVZnSFEvQlRjMERlVm83TGRLcnVaaWlpVGdWdS8xQWdTSENYUGV1?=
 =?utf-8?B?RTI3ZEJsRGZCWkZ2WTZJZjdhWXdaWUF5NG1sdnhOdVBzZkRWRzIzRTNIeHhk?=
 =?utf-8?B?V0x3Wk5qSTRma1piSmc1ZWQ2Z2o4QkFlb3dzOVo4dThoK1dwdjFQcU1qSm1k?=
 =?utf-8?B?Y1FVdWtrNk5Xb1luQk5CRVFNUERDbjMxcyttK2d3cG5QdGw5dEhKWlZqNU0y?=
 =?utf-8?B?VVJkTVBGZzJ3UEgzbHBUelBSSURqRFRKY0hvZ1hjVTFCYXBHK0tkSEE2blU3?=
 =?utf-8?B?cDU5TUVsb3RLK1N0Z2RkelFJTy84YThqVDZuR3FTRHpDVHh5REh4MTA1L0tt?=
 =?utf-8?B?eFZqNWVyalp4WkZKZjIzdzdVenlyRFVtRmQwRktDUWZpS3dRTDl0SGNXMndK?=
 =?utf-8?B?OWpoU0ZaTjA4Vzg3bk5iZTBJcFM4OURmdWJlRHZCblZCb1lua1lDdDBjRFhM?=
 =?utf-8?B?VXJHc1BrUHZrWGVCbnJSejU2RGUwK0RJVUY2aU10cmt0TmdXYmhzL3lDb3FG?=
 =?utf-8?B?aWZNUEU2Mm9CY1JhZVRCcEZwaG5jZ0c0OURrN2RtVjZ1T3ZEM1FtQm04a3o2?=
 =?utf-8?B?TnFJTUhRM0cvTGVxc3hFY1VaOTVpZzhYUDViVk11UE9wY0lCZDNnM1lFYVNq?=
 =?utf-8?B?ZHgvZXhKUDBsYVhHYkJRNHJDRjEzY3U1bG5SV2pXVFlFT1Njc3o3S1p6NU0r?=
 =?utf-8?B?eEZzZXFxdk9DS2xzb21VKyt0MXk1U2dXdXBzei9TK1pyaDV4K3lsMHI2ZnJl?=
 =?utf-8?B?RDBIc2tYTmZUbmtocEhoQUkyR0xURlJad2d0eG9GUWNJM3cxY2RZMDJLMU03?=
 =?utf-8?B?VkJtZk84U01CZ1dyRWJudUlmMDVFZmpQZ3h3YzliY3NqdExzVzBJT0RLMDZ2?=
 =?utf-8?B?Mi9jaWRUcERxUjRJY1hwSzdodlFZNlpDdUc2R0RZR1lNZXhVMXZHNEFLQmts?=
 =?utf-8?B?QmhQcjd3UFhYSGhzNFpxK1BBZ2x0S0Zjb3RScDZleHNjTkxkUU9NR0liVURR?=
 =?utf-8?B?dmIyREZvdlhnbXF4Q0hBanYxdC9Sd0dybC9Fb0FwQlhFUDRKZGJqNjZ4U2JQ?=
 =?utf-8?B?MGFFbkRJNTdCSnlmT1ZPSnNNeS9YQ0poUUl3UlFvMGI3N3dhWkROSjA3UTFH?=
 =?utf-8?B?MzFrY1poY2ZWTDdLMUxDd0JkMDY3a0VYR2pXYjBjWHVjRVNQN1VqWm12dzhH?=
 =?utf-8?B?SE9OR0dVY0Y2dVdUS1UrcnZJb1RyOHI3bXdzUm0za1JCNmtCTStnNWdTZks2?=
 =?utf-8?B?ekpScXZRUXo5a2hDN0x5ZVpvTlNROG01WmVQbjBOOFVUQzgyZmJXYWkvZHov?=
 =?utf-8?B?cnJ4NE5RVnR0Q1dQbHlBVFJoOFVQbm0rVGNEaXZ6b0hrYWMwRDJTeXlyYVBJ?=
 =?utf-8?B?S1c2T28xS1k3TklOK1QrbkliOTJYODAyUDRlS2lQdEl1SUFjS1FmMHBXMlpl?=
 =?utf-8?B?VjJGbnpGbGZFUGxKcjNGRWIxeGNUOFZ3ZDQ4RWU4TUlnYk1oR1kvYlVPbkxm?=
 =?utf-8?B?UmE4elNhTTZsa3BJVkNmK0RTek1qeFFzMUlibnkvV1NZUU4za21MTklpYlRy?=
 =?utf-8?Q?+ZqzJSA4KxCQOFlWfkeD0bgDN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd1198aa-f340-4348-e970-08de3ceebd39
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 22:02:00.8921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fmfu41QZ9HGfISeFv+KLq2AhYAv908iVdJbn3X5ofaV8OL22ZCXZ9aUkJPzqbUKU0UEway+DWTh04qCmdZdIHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839
Message-ID-Hash: NGRDUPNWILEMXMRO7YHCIZDYCHUK4PYS
X-Message-ID-Hash: NGRDUPNWILEMXMRO7YHCIZDYCHUK4PYS
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NGRDUPNWILEMXMRO7YHCIZDYCHUK4PYS/>
Archived-At: 
 <https://lore.freedesktop.org/378b8542-86a4-4c8c-b1ec-070d1b2372d6@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 12/16/2025 3:28 PM, Timur Tabi wrote:
> On Tue, 2025-12-16 at 19:04 +0900, John Hubbard wrote:
>>> If I do that, then how do I access it from gsp.rs (the last patch in this series)?
>>
>> Given that the current PCI .probe() doesn't pass in module data,
>> I looked around and saw that Binder is using global_lock!()
>> instead of passing around module data. It seems like this area
>> is still new in Rust for Linux.
>>
>> I wonder if global_lock!() is what Gary had in mind? That is still
>> effectively global access, but at least it's synchronized,
>> unlike static mut.
> 
> It's only 'mut' in that it needs to be initialized when the driver loads.  After that, it's only
> referenced as non-mut:
> 
>         #[allow(static_mut_refs)]
>         // SAFETY: `DEBUGFS_ROOT` is never modified after initialization, so it is safe to
>         // create a shared reference to it.
>         let novacore_dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }.ok_or(ENOENT)?;
> 
> The first internal version of this code did have global_lock!, but it caused problems.  That's why
> Alex recommended to drop the lock and just have an unsafe initialization:
> 
> https://github.com/Gnurou/linux/commit/d5435f662b8677545a93373b4c4c80d8b4be40c9
> 
> It would be nice if Rust had a concept of a variable that was initialized at runtime once (before
> any concurrent access could occur), and was then read-only everywhere else.
> 

Could the debugfs Rust abstraction add a directory lookup function
`Dir::lookup(name)` method and allow creating sub directories under a known
path? This would let `probe()` find the module-created root directory without
needing global state right? Then store references to this on a per-GPU basis
that the GSP code can access. Alternatively, the first probe can create the root
directory, and subsequent probes reuse it without requiring module-level root.

thanks,

 - Joel
