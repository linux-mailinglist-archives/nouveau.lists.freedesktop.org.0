Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D68CC659A
	for <lists+nouveau@lfdr.de>; Wed, 17 Dec 2025 08:18:11 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6515D10E9D8;
	Wed, 17 Dec 2025 07:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qq4LSllJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4AC2D4562C;
	Wed, 17 Dec 2025 07:10:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765955442;
 b=MoehjGgdK1hdmAMkR32txkdcHxmlpqEzna9RaMyscbjPdU3ZgJPp2CjzT/cKcMMJwGoqU
 xTVp8Pq3/ejBcmxckudMnyyzs3bd9xIxkAr4F4KLchpWNtQi1OFaQgNoF9zCnX4MibHxSQI
 NoW6kiRX4I1OGOnzKgEPeBUsA/rDGUhbKDzKzNffLC19zIfGyYrJ9A5kXm+TkbP5bSZ0NyM
 G6f/djg6bMne+K6FhNAKXWuefbYTuLt7L2RYF9vBoA9KyfSQJUXPBQ34b5ucKyBqb3gG9D7
 2ZrZjXh3dgawMAE61glCfeXdnc6UmvGIuz46W7RkYGaZHAx99ObVPM7+E9Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765955442; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Jh1yybA6ugszkeXxFb0iO3jYp3dTos1WDw/i8GfsrY4=;
 b=07aijnrTm3/iBdlEQv2E/x9I45Gf/4hopg+4SlG35de8U/3OPUh8UmfB0PH12kZWfNpSt
 xLBfHfElKIvY0WAZwjO7hBKPASvMv1Ot6OkKZdjcZstbYGRoMfAMF3K5wmvnnBFPq8+pioQ
 5t8JOReM5v+12a9p1IdasVOwHPNvsAUH3xah23+gnPKpw9cX9+fdiR5C0myHlj6+hQg/1y4
 M2QpM+05sniuCbtaywyzfuT5xuI4X/FomukOCEZXP/jIyGm2Ip+YHptTEFsbGBGXiY5l0Cg
 5674Xx2RsnKLK0M+wglcr4o9wEoOtlhCwy9rueqmq/uNaJYL2YYaXLPhjk7Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 78D1145626;
	Wed, 17 Dec 2025 07:10:36 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45A5A10E0D9;
	Wed, 17 Dec 2025 07:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFEzPegTccFd5G53mc047STmiG+y2Seol/X/jEepiSWN3I7ezPrmCPjZATjyQrjpFdiktnRX808eYuaUAhrY9j30RLCR4O0VM6sKa1dOLzeK0fYoFoxKTGEAAF2XH4lsSbUDoIggoUgAgC5j8Y/jrm28PdT1zttG3mpSq0ja2UlhHRSWBQ9jc0ECNP8+guwiaTO5vBlnB2Op0b1rrDnl1BqNA8H0yNLTHYAu+cljiR7lrx55Yew0vAf0K6HFxphuX+o6kOP8rjbSiHvsl/bhz92mibNFkBKgVMXyFE94YSTM7rl4WS0s5kSmf3ycdjFLVk1zwCapfpF+qfdc6SWcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh1yybA6ugszkeXxFb0iO3jYp3dTos1WDw/i8GfsrY4=;
 b=OHXV7qR9YWIHT95VvKCPQLSdQgKLDJw1QaQLkPo8eEdA5mgeYnjaNP/VfDa57e4zgd6EriniwUnmlIq3xUXGE7iRGTJXuIO2VwEtQ5Vl/IJRsIV6m5U9dDlRAZvalBwIokZhB8Ecj4rGxXC/k6HjQTbx+5QQhaQdr0fmes0yF/mu5s6Aiexj4ZiH2oauXBv0Zubzw3O5Re1X2pe+CIv3Z8oiqcjpsan92tIA+s7Nr8183Vt9y7gTbsLShHOL7E9jZnQFH2YPvFFgjnE+eUOeEGi/+no+jenwmCrtSPbng+vJlAY5e1qxJHydYTGUBwhVJ37baQr0G8BopgYezjnmKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh1yybA6ugszkeXxFb0iO3jYp3dTos1WDw/i8GfsrY4=;
 b=qq4LSllJAdQTVDghAuwqY4Au6s3HUS3oeKlZde++iW8AwzBZJzzh5oCBJ5xfWcJYyP1gGufpFtHlcsSs/9KCw181n4H54gSVbPFjDrtXyTESGmJmEj2S3PH+DCug5OuzabEwHGGZjn0Vo0xrA66BsWUY7WsCLB4YkghgxTeEL6jiTv+sL+oKQnKAA2EJBcWXzz3zgTrr2F+CsjyNnyI/R/9XAkzf0TFQeGti1rNGQVGiuHBzn1OWjcOYNmg3PGGJ1jr5S6GcfSy2GPP7Kaee1WbtVzqCbGHqWuUuiaO4+pDHexMFsr6bdoA7eyZZ84pj5WR6ScB+SvzfxZAHqnw1uQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6892.namprd12.prod.outlook.com (2603:10b6:510:1bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 07:17:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 07:17:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 16:17:55 +0900
Message-Id: <DF0B41FU249U.1TCM73282SDFJ@nvidia.com>
Subject: Re: [PATCH v3 11/12] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208231801.1786803-1-ttabi@nvidia.com>
 <20251208231801.1786803-12-ttabi@nvidia.com>
In-Reply-To: <20251208231801.1786803-12-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0240.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 71be25bb-6da2-4aa7-373a-08de3d3c6803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TmpNR0lrdERiTWRvL0tSMjBCR01LbjdNbm53cnpvU1VCVGpWaytneTFqdlBl?=
 =?utf-8?B?b2Excjl6TDgxSGJsYUFtSm1JSXIySVUrUmkxWmo4R2RBT08wRlp5b1lOdi9y?=
 =?utf-8?B?ay84RlEvM2JsQXpsbk5UZ044NGpOdnF2ejA1ZmNUdjdYZ3dqWHZDV2QzdG5V?=
 =?utf-8?B?SndDU0phdVBQdTA0SzlrRWo5L3RuYmxLd1R5MzQzNGJqR0pueUZvZFFZbjZ0?=
 =?utf-8?B?RFEzY3BRNzc2aWpsMmUxY1ZVMEd0VTBNSE5ORTVRd3UvVWU0TFhPZDR6OEtK?=
 =?utf-8?B?ZzRPZXNwVE5DU1ZEZWpTUlU5RDhRYm54QWgxUDZ1QXdwY2FzSTEvemU4ZEk4?=
 =?utf-8?B?c3M2QjBiZ3dVRlM0V2dpbEQyMVU1MWRIRGlvWXFrWkRzanp0aDRRWnZMdXY4?=
 =?utf-8?B?dkxlRE01S2tlRnZPUzJ3c3V5S1BKTWd4YjF4Y3FUWjVEbzMyUHlEVWpac2ZQ?=
 =?utf-8?B?OWFINW85VFNVUUtVcUEyOGpLdTZqRzhXYkVmZlJuOWZSTFdpdFpodUJGWk5u?=
 =?utf-8?B?TG5nUHhtVFBNbHY1ZzZuUmJob3ltZDN3M3FIa3FyZTlXdFI0WXZpcWhOVHE0?=
 =?utf-8?B?aG9OVDRDSzNMbHZjOG9NSzRCMGhDd3lVSXZnY1k1ZzMzNGRuc2lHRFd2dE9H?=
 =?utf-8?B?a3JEUG9kaG91RTY2dFVYbzJRWEZRV1NyanR3cXZtNHF1eGY3ODFPU1ppbDl4?=
 =?utf-8?B?NktyN1UybCtzejlReENKb2x5V2pHbkhuaUFTTHVNc3hXNzBoWmx6OEdpOWcr?=
 =?utf-8?B?MGRhS2VMMHZnZFhwcTJ0U2FCVGlyTFVFam1uRFhGc2xMczk1OFZLZUhUdkRa?=
 =?utf-8?B?ZXFxejd4RE9XSjZia1cySVBjMTZTNU1xak9xczZodURxdU5VRndSekJLdTFW?=
 =?utf-8?B?ZGp0QU0zQTdRaGlQZnE4dlFOcENLMDU4ZDRsSmtZZkZreWZoNUtRRlBWd240?=
 =?utf-8?B?bXlNcGxEOGxpaVl4TndRQTBTYkxMYXNnUUZUcEhYQjlMUlVmSG5Db2hKM05z?=
 =?utf-8?B?QWgwbXBBVVZlS0VsTzd3WmhGNm1zcUw1alYvV1dpVnk3NXUzMkQ1Si9vY3cv?=
 =?utf-8?B?Tk5URS9Pc3ZNTHg1aGh5U3d6dkF1ZVRzK0hIZ2hqU25sMG5rcTQ1dmFFK1hZ?=
 =?utf-8?B?ME1sNkhpR1JuaUdIKzhmS2F1anovSExTS1ZBYWRreTdRSlc1bFVLZlYvbkJE?=
 =?utf-8?B?bVVrdWYxVCtOMXJ6OUY1UmtsQWF4U1pQOXlEd015OWdoZVpWeE9EZ0ZnT0dK?=
 =?utf-8?B?QklCVXdibGhDcndubjl3L2Z0RzhZMVdyUkx1eDY4V0NMYlBQQk1GOWR3Z01Y?=
 =?utf-8?B?WU5HYjg1Y2loazJ5Mys1NUhWZU5XcjJTNkU3NjZFWHlGNk9ZZmowSjFtRXlx?=
 =?utf-8?B?TVN0dkRmNktnU2RxZE5OODdRQU1rMlZpQXJrdTFFQ1NRYWxQeEN0eTFkZ1Zk?=
 =?utf-8?B?N3BKK0pHQjBIc1ZISElLZlViSGY0Ym9saC90V1dvdElmNk9YdW9FaFl2YkZ5?=
 =?utf-8?B?Rmx4eEdFYUZHbGJIOVNWdjNRcXJwZ05Kb3ZiTlgyY20wdkZyRzNsTnZ1T2Er?=
 =?utf-8?B?ZkFNWXg0c1lJeWd4Q3dISkswWVJIU0Y4YlZDOG1WSDg3WTIyR0FCck1Kdnl5?=
 =?utf-8?B?YUo3b1pKK05MeGxCSU10eWNQbGppWTZTOHY3VFl4cm1KbXM3REg3cVNlZnN0?=
 =?utf-8?B?aE5qWDBJODM1UVNVbSs0UDNhQXUwdmFRT0pkeElxZDBoR21uelZpVVhpTHZD?=
 =?utf-8?B?MlVjOGlRa2dDWENJdUIrVzZxRFpsM1hoSkV1K21XaGJWbXJicmQ1c21wZ3pR?=
 =?utf-8?B?dzFDclFveVJwb01jc2x3UjdKcTVBV1FLNVBsRlVQTFNXcHVTenZPUzZHTzcz?=
 =?utf-8?B?elViaC9PaFJTOVhuTlB5dUFQQlVwS2dFVExwcjh2bmx0dkRXMGRoMy9CVmpB?=
 =?utf-8?Q?Y5p1e5hyOo1ofguZAOTiWCTUXCru9NjP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U01rL0twSEl5anFObEh6SVV2Wk42WGlickc2VnFoYjV6S1ZURG1reUhnY09K?=
 =?utf-8?B?L09tNjVsQnJyMXhWeENKOWZPU1p5VXFSZ1pMU2ZCQ1RoOHE0UmwzRk11c2xP?=
 =?utf-8?B?N1pvQTlpV25qZjIxeXo0ZU9xZVJzT2ZPQTA2YWRmWFlKWWx0NlNwV1RVM1li?=
 =?utf-8?B?MHg2WW56QkE4azRYenJvU3dDSkNnVGtWRU5xcjRLbTlrUnQ3L01UdVE5cENB?=
 =?utf-8?B?a1hpRkpaSnBobVBtakovMVVMWVhLVktNb2tNSFhaUmRsaHZXTlIwM25hb1hD?=
 =?utf-8?B?TG9IV09yR3pmM2RVaFpJRm40VlhRcVRUL0V4dm52ZGQwUFUvWEk1MFhBZkp4?=
 =?utf-8?B?KzFHWE95RnpqUzVTbmRnajRWYWlCWFM1czcvaFc5UThJQlRRb05UMHFuVk80?=
 =?utf-8?B?S2Q2UnF4SGJUeC93ME4zL3N4aDlRc2M5ajdEc1lnUXowdzVvZi8vWVA3R00w?=
 =?utf-8?B?blhBSDRQZCtUVC9MbWl2Tk9VZVNidTFtcmVvWC9ZaThNY216WFRKNGtuTE5h?=
 =?utf-8?B?bnh5Z0NMZnNwMGpWcUVxUkFHUzFVYjFZeC9ITGtRSSt5cWNva1dlc0JUYlhJ?=
 =?utf-8?B?d3NBcG1KMm85REpONGlKVklsdldFeHZkWWdHNVhsOExCa0NOb2ROKzhHZklL?=
 =?utf-8?B?QlVEOU50VkpucU5zRHZ4UmpTSnQ4OFhQY3pudzA3Y2dLL2NhaE9ta2UxaEdt?=
 =?utf-8?B?c0tOZlZzU1RtNnNpc3ZhZW5hMk1MWUlSYldYSlNYT1doT2ptNTVIalowcUpP?=
 =?utf-8?B?cjNQWGFLWHBFTWhxZnRyaHBYcndONFBURVhPU3ZIcVE2RHpjcElhSDV6SDFw?=
 =?utf-8?B?eTRTM2wzeFEySXgwYzFFbDdsYkErZmlFRDRnUXBjNkxJdUZFRTB2MXdwWXIz?=
 =?utf-8?B?NHkyV3U2Z3FjU0NMMmNOR3hoOUZmOEtoUkRwVUFkdVB1dWgzYURVcXRpTzl6?=
 =?utf-8?B?UXNZUjBIajlpWW56TUJmZm5NWDJjTTlOdmNMb3IxMFJEeUIvZ01HcUl6M1dL?=
 =?utf-8?B?QlAySHZIeU9WQW1OQlhTdkdJcm5qNEZDb05MUDg3L0lyS0hJU29zL1R0bmFo?=
 =?utf-8?B?ZVliQkR6SDRPaVVTWExjTlJCWGVlUnlHZGhTVVc1eDR5bHdEdWhCN3pRSGUy?=
 =?utf-8?B?eVBkbWxMSzdaK0NrQ1NkcHMzeWVUZEN4UXQ1UElJTHpYSEJUWjdMZzhweEdu?=
 =?utf-8?B?VTZWVlllUmVSSnlvR2l1M044ZllJZXl3MEM4U3I1MFNiVmhqalY4ZVRRT1Av?=
 =?utf-8?B?Zm1uN2FSOTk3VmVPaTcrbnl4d2Q5aVFoSjRmSGFRcFJHbWJHdTRKcDd1MVdq?=
 =?utf-8?B?SzRzWklhOTAvYXJRUWtyQ3FEdXRxTENObkQ3QUpjUUxrMGZZMlpCcEduVkUy?=
 =?utf-8?B?WFNtdSsrZ3lqcVdpRGFmVXFISURaM2NOaERESlgxVytsVHRES2k4THd2c0JJ?=
 =?utf-8?B?L2xVVHNiYUNsUXdmckhvNTNMZmhQcHN0WXlFTnNqRG1tODFyYmpPSHN3djlB?=
 =?utf-8?B?MVNlUzFOdGd5Rk1lNWlQZzdjWkJuQWc0bkFTV0pubDFDY1hwcnN5bVBLd0Nj?=
 =?utf-8?B?MDZZc0lmN1NMZEEycFVIcDVxbGdxc3h2RThOT3BaZ1lvNXdZTEs4RWladFIz?=
 =?utf-8?B?Q1IxM0JFT2hxWlUyTTZRam1VZU11VWJnR0hoTC80T0F2UHpUeFB2ZTBCa2pL?=
 =?utf-8?B?MDVIcENVUGJvQSt1SkpaVWFTUSsxYWZnZGE5N25ERjBRNVp6aFdZdVJGT2xh?=
 =?utf-8?B?UkFQVkxuM3BrQm9mVHBrYjdXK2lYRlh0VWZTK3lDa2EwSnFqcDAyemJwcmYz?=
 =?utf-8?B?SXlLS0J1NkVwSmhhbTFpbG15bW5GQ2hqb2gySTUyRXU3bWdkU3ZQQWpGc0c5?=
 =?utf-8?B?QWVSdUJlVUdFdmUrV2o2dVhjb2VQSVUraXNDZk1Cd0JDY1hmRUNyanFsRFps?=
 =?utf-8?B?R2Y5K2J1aUh6Yllza1pkc25YZVZRRlh2cHpIVEkxeEhKKzB0cHlZa0doWXZE?=
 =?utf-8?B?Y2NQVUxpQ3UzM2tXR3dvSXRhQjRJS01JZzZ6WTlCeFJuU3AvaXpTNXdpbVg2?=
 =?utf-8?B?eE9QWXRXNitsKzRHaVVVa2FVV2xPSG5EaGowRW52UmNQVDJDVmRqYlZ4N2Zm?=
 =?utf-8?B?SWlHVGlIWmI2dHk1TmQ4SWc4dzZjSjRtS3RYZDN4cFJQZGdVeTViYVVHY2dh?=
 =?utf-8?Q?v4A47twpL/jkZflqoXcXX2d95AEn5b5gGuzwaNH+Fa6k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71be25bb-6da2-4aa7-373a-08de3d3c6803
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:17:58.7762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JQ0svLQG8n4sNer90cBGGRfmULPsehssf35g0lN7aicDx2UtTUT4KCcIYHo3C2JLy/duekWBgfSxfst/iP39fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6892
Message-ID-Hash: LOG5TKM65ZDTAGCOYKBVNV3UXFZW7HTJ
X-Message-ID-Hash: LOG5TKM65ZDTAGCOYKBVNV3UXFZW7HTJ
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Nouveau <nouveau-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LOG5TKM65ZDTAGCOYKBVNV3UXFZW7HTJ/>
Archived-At: 
 <https://lore.freedesktop.org/DF0B41FU249U.1TCM73282SDFJ@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 9, 2025 at 8:18 AM JST, Timur Tabi wrote:
> On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
> that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
> aligned to 4KB.  The logging buffers are already aligned to that size, so
> only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
> adjustment by adding padding to the end of the struct.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index abffd6beec65..6f53df0f6f3d 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -889,17 +889,27 @@ unsafe impl AsBytes for GspMsgElement {}
>  unsafe impl FromBytes for GspMsgElement {}
> =20
>  /// Arguments for GSP startup.
> -#[repr(transparent)]
> -pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
> +///
> +/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgume=
nt`
> +/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to f=
orce it
> +/// to that size.
> +#[repr(C)]
> +pub(crate) struct GspArgumentsCached(
> +    bindings::GSP_ARGUMENTS_CACHED,
> +    [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CA=
CHED>()],
> +);
> =20
>  impl GspArgumentsCached {
>      /// Creates the arguments for starting the GSP up using `cmdq` as it=
s command queue.
>      pub(crate) fn new(cmdq: &Cmdq) -> Self {
> -        Self(bindings::GSP_ARGUMENTS_CACHED {
> -            messageQueueInitArguments: MessageQueueInitArguments::new(cm=
dq).0,
> -            bDmemStack: 1,
> -            ..Default::default()
> -        })
> +        Self(
> +            bindings::GSP_ARGUMENTS_CACHED {
> +                messageQueueInitArguments: MessageQueueInitArguments::ne=
w(cmdq).0,
> +                bDmemStack: 1,
> +                ..Default::default()
> +            },
> +            [0u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARG=
UMENTS_CACHED>()]

You can use `Zeroable::zeroed()` instead of this last complex line.
