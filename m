Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75AFCFB35F
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 23:10:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75ABF10E250;
	Tue,  6 Jan 2026 22:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kjOYE040";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5B46C44C9D;
	Tue,  6 Jan 2026 22:01:47 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767736907;
 b=MNCDqtrp2j+/Gt/D6VUFAYzzwfFJPoqYCiQ7MxcbyuT7D+6yVovY3byJrflJDLRFlGp6P
 RK087zRYtZo0JUfDhHKJ+OZcvl+QhH6Gb+puvpMefek827G05rkdahum8nyJCkR6j16BQCc
 4jujer76h5JqfG3WwrDl+PEeY6LsNcJutW/u0D9AePqD61rxFhimNGi5pfUNDaZT+j4Dm0W
 M3nb+eDjJ/8BodcGuYS3N8hpewKE8Z33P2g0ULLfE+tp0lpBpHprd/OKNplxGKP1tX3H5I6
 w+52tXdUyUtGevOMNdmv0Sn67k3lD7iiVlGyf8f6FcCZFm4SUCn3ldKBclNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767736907; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fV78XbBwGuUqMrlyi4TbSehLFrFzoUrFF0T+QiHNXkk=;
 b=O/FQrNsuZenidEZf7HI9t9ZJZvFvhpwIwev6XHYcCWWO+hkC8wZnCLcC/V40Rkjnz2XQG
 dxNFWL8EgMRppt5PTjA4TLLpmdu+Gh9da2NK6D/2fJ8jVqP7TIVbDAMJtKJ0+X6sI0xiMN+
 raRbrEb81fu+ruOtC46147pccgylX9P9/hwDSQKj4Hyh8faFMucKK0X1QhIklHuAzB30/rK
 ToPJR8m63xLrgGiyKvdtbKj22y3cU0B0PsWDnQNYPuVT5Q0bvldqDyF72BBF1SzLogYQLOq
 0zxXZlhvutCbZy67sTuppOrwHUQF10RNii/JFIzE2u25woxkm1d26Ug6FeNA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7365A44C81
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 22:01:44 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013028.outbound.protection.outlook.com
 [40.93.196.28])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1815510E24A
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 22:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrWq5Cmiw7HGebnM9lgaY46xhBoO+ak4MCiKqEGmJiqDQVTXC7MIfilCpBoB8jw+7gv7QsKrqflY7rBFA1+sMNygegOuJX5fS19cxO9M99ZPblnje/SarBlRCGLpWL+dYHFlD1tTym6Y5EJIbTn1zDPK+2T6GmMon5rhettNNL2WQDuqjX6BCpDc1zmDpTpRAghi+nVhN7CZ5umUaHthV4eDKIyj3Th9UPL8T2c+fxwiBpM2FClyythf0kqxDBQnG8KO8kdzG1m7GZfseEmBcgjb8iOeJBnNzEgbA6NI1EyACprjSl2soduryIPVnkEafjdEBFzmEm1nsNxGBedDKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV78XbBwGuUqMrlyi4TbSehLFrFzoUrFF0T+QiHNXkk=;
 b=fqOlS3s9GN/s1WQe+3PUp4wY/9+d7xmv8Jog8+EfFdKanIHtoGPcGHdvziwokDnbjTIWS338In0Ql312vIaTeolPqT40Dck4z6QTvzwZgzHUOW1kaljTHm6Jm0MEvAuOvTNmE7VptemcDJyZprtrDVtMTkibuNoAg/v2jJnx3EwV314mrYk+ew5KzYQfTzRTSFZNTS8tnGzO0QvPJ5K3ljUtbNrNWu7Ie7VLAngzxpGhpbUk5ii/zWJsLR5ZoyXXD3TzLcPqeu7eDzUFzhOaPGEaORPyqtHnfjBF7bRLeXKTPW7bxiQeOCGIgEviOXnh19Wo2VglxQuE9Agu0QMCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV78XbBwGuUqMrlyi4TbSehLFrFzoUrFF0T+QiHNXkk=;
 b=kjOYE040TGkw5SYqzJ1mj5TlHpDgcstehjcUjYmBdhRgndBpIE3oJUuaYfyDYEe19NfvWNL5v4/LiJHZNHtwLQ8AFkVsrQzLMLsb2iN/EEY8Osv30HPlYQUUbiEuZ/GaT1vbTBEKfOAPj6jzhRZn6YRJtVk2DNuF1SwDsN7UYr5xe0AgUFwtk3z0D+a/9FEg/GHGJ9SIlnoKRxRDMOqwApC/XB8EnTjJQdNvKDUkQGMc76DAp6JUhB4J8cAccGqduM1PbeDHsP2aKMalU6/YMdsww/wjfO18RZjVFsxUzFGLExofcVgTnmBM+0bDi2DCQOVR8kzZLEV33WjI5KsOqw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7720.namprd12.prod.outlook.com (2603:10b6:8:100::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 22:09:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 22:09:53 +0000
Message-ID: <09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com>
Date: Tue, 6 Jan 2026 14:09:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: Danilo Krummrich <dakr@kernel.org>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
 <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFHHP3LVYW43.247TW37BCGYHE@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0043.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 562e6963-64fd-4347-5445-08de4d7051bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVhFVDFodjd1YXJQeC9VcTlGTWRUd0NUYm4vQ1pReXNLTnJSSmlEYi9jenVP?=
 =?utf-8?B?ZU5CUHhjdzNHc2t3Ny9VN3RMOGtHWFZOQUc1em9MQVVGT01kNU1pc3hZN2Iz?=
 =?utf-8?B?Mk04VEVPbnB5K1Y2MEMrcXF2aGJZbTRVZURGK0VYTXhKYmVlemYrRWdCYkNP?=
 =?utf-8?B?eFBUMFR3QUVGMUpPRTJaczNRUGRQZkwxeWZlaDZFYkIvVDdyeWxjSE0rcTk2?=
 =?utf-8?B?dGRJVUpYRUIzYzdBWGdweWhTUEkzeCtmVDlDRGkzak94VXMwL3g0QWQ1SHo0?=
 =?utf-8?B?SzZEM2x5WUlBK2RWZlY2NS9IQXVCV0N6d3JsNEhrSXRPVnlrQ09xV3g1M3JD?=
 =?utf-8?B?VFpHbklaSm9sZEo1Q3BMeEVRbFY4S3RjWlVoenZFYWNRWkpqK1dsb2hudUpV?=
 =?utf-8?B?dlQrTk5EWW9lYWdneUZDeHNDTzdaQVltd1B4WDU5UUZkOEFJc3F4a2wwN2JN?=
 =?utf-8?B?VEdoVkdwczdmdTc3Yk1qRHBtQkV0b29GZkJ3RWd5VWpiTW1zRlFhUmI2ZWhZ?=
 =?utf-8?B?YXk1TFQxeTcwUHpJOUtMZEQ2TDkwcDlOTnUwa2pCOGNnMTI3YUg4UlZyTkk1?=
 =?utf-8?B?bVh0aFErQ09vWjdockN1M2Z4aGo2K2xEZGYyVlNoMkFyczFEUVVHMTJjMmJZ?=
 =?utf-8?B?UDI4OGp6dVFjSUlKODZRaTRuU01NVDFFMURhSnlKalVQRTU4NDFBK3E5SDht?=
 =?utf-8?B?U2NuWmUvbEJrdWpyV3R6cFRJQnBiNm5nekNJZTUyd2VXYnZSbStxRDY2K2NP?=
 =?utf-8?B?OHltQXU2Z2FLanErdnU2blI4WUxickFNWmgvVnVRZ3J6NFBYdVg3VkVUMVVY?=
 =?utf-8?B?SmhxeFhwTDVTY3REcFdKQVAxSEZYSGR4S2I5aDVCZ3dvOTQzV0N5bk1jTWlC?=
 =?utf-8?B?QXpkYVNjdjRnTVU4aU41UE1vbjVmTlU1K3RmN1o1Z3EzajlRdytzazN1dkZv?=
 =?utf-8?B?ZWpza0VZamVGWmRGQnBNQmRFdTRwOEFxVG5jUkFjSVNGVzRBa2pjVGh3bHN4?=
 =?utf-8?B?UmhLZyt4SWRqRjVKeTN2dFNGS1pSbldZWFhFSGxlODQxQjVtZWtwZ0daMGRn?=
 =?utf-8?B?Y0FsVmFiV3VPVXNYRmV5ekR5YXREdE4xbmhmQnJQV3ZFYmkyUncvTTVOL0dD?=
 =?utf-8?B?WHg2dWhGMVpUc3B2ZGZseVBSelBweHd2S3NjSkZFOEZRaWJKWm9ZdVI4UVVM?=
 =?utf-8?B?RjBVeFptN2FEOTRwVERMYVZBekd1bGprRTRtTENsRjI3SWI1VXI0WFBIVm94?=
 =?utf-8?B?VnJDeC9tbUxSYldrRGdOa2FxdDN1ajhtV0JhUWpvemNnN2JSU2ZXeVhvb3ZN?=
 =?utf-8?B?VUNSWTc5SHFwRTdPVmFaMnFYaUxSazdBY05nRG9uVFF5MjNUeDhVSTUyRFBQ?=
 =?utf-8?B?MEJGeTFzNWxrNzZkQ2JQYkNDSWx6QlkxY0pRMy9FN0JtbEdsY2NFdi80Tysz?=
 =?utf-8?B?REs3bStBNnJkbk9IcGh3UnlvU3hPUy9haUM2VjZNTkxZWTdNNWVLOU1xNkxV?=
 =?utf-8?B?MldVUGFoRWU4bms2QUMyQTZpcHlFbEIrQnlRM0hHL3c4MmhFWkFhLy9TWlhO?=
 =?utf-8?B?VlBaaG1Mai9OaTgwY3dXWUhiUlBYTkZYOXJJN2FNaDF5Mit5cXBhVFltN1NU?=
 =?utf-8?B?RnlsWkNqVnBCN1psd1FVQUxQOGlBdDAwOWY1dTloUjBTbEsrZ0hiUkFOK1E1?=
 =?utf-8?B?dnY1WGFYTVJOb2pBdEVFdUJxU1U4MTUrUzl0RTJlREFXOWIyQzhJa05MVVNs?=
 =?utf-8?B?TzR6c0hPRnRuZDYxV0g1U1NIc3R1TXlJcFV5cWltTUxsSVZyZU9mN0FaZmMv?=
 =?utf-8?B?Vy82NkN2eGpJTWgrSWN6ejJVWHRWTUQ5UnFwSnhUSkt2VUVaeWJNRng5Y2xz?=
 =?utf-8?B?ZTVhblpXOVh1anc5WjJrM3hhSXRkRzQyVldsakhEaUl1Q3RCYzJPNUdEN0d0?=
 =?utf-8?B?ckNxZ0tsdzd3bWhxc25nMjNXQTdJMEZJQlVGNkNMN0VDU0NkS2hsQStMQWNi?=
 =?utf-8?B?eGpod2RweHd3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3V4blR5cmlnNU50ZlAzTU1kNU5FYXlpNWhrYjB4SVBVb29BdlBrOTN4c1p4?=
 =?utf-8?B?Z2g0TkNPa3c4RjdtbHNYM3A3R0lycUkxRzlUczZ6WmpmZmpmeFRVSVFibUJ1?=
 =?utf-8?B?Rk1NVDRRYXA3V1lFYVFtdjE2SFF4c2pTVFE4VXhYY2ZteHNmVlZPQm83WDlU?=
 =?utf-8?B?dERENmg1dmpZazVxRmRoUmR4bEM0TzRxNng0N3JzV3hqZkRjQm5QdndyMlRX?=
 =?utf-8?B?UnFXQ1dpMTBmZWxZOWJqZjJCanFTU0dGWUoxRnBRSWJ3Sll6MzR5UmNESy9j?=
 =?utf-8?B?Wkx1VW9oWWhtL0plR1NJM1VVdGZlT2ZleXAvT3ppTzlYNUlHK0FXbmhCMU9m?=
 =?utf-8?B?MXo5YTNkek0rd21WWUdoV1gyM2VmVGtETFhKZStyOTVvRWw2SGswZGoxeDFW?=
 =?utf-8?B?QnhXbWVKbW9zZ09JRjBGTUthRmpGMHo0dUZUMjVVaDlaSkRNUG9IR0ZVZy9q?=
 =?utf-8?B?MDI2L2phb1FFQkI0TFFvTUZHRkJ0QkpzOWhmZndmMVlvZTViT0NZUXAxMTJn?=
 =?utf-8?B?d0xTTGljTUk4ZzJTSnhWa0lXNkxlQXFSQkM3eDMxMzJLcVBLeWZESExYWk02?=
 =?utf-8?B?S2NDcVZJRTd3NjlRc0JEdlhUVzYyWXJpd3U2cWpsTTRudDAzcGZaaFlIU1Zo?=
 =?utf-8?B?Mm94aExFVW1MRXpuYUtXVzB2Tk9maWhFdXBhUjBENEFaWlluVExhbWp0SUgr?=
 =?utf-8?B?TzdSZzV6WENTYXprczhSMGdGUHNqNWY3UWtadk5CVlBFTGRLSUxKNTBwalZM?=
 =?utf-8?B?V0UrWEdZTHVxcFJHOXozVzhzK1BWYWxMWTFTRHlvaFgyZ2pXZ1FYR0xkdnZU?=
 =?utf-8?B?TzhBN09HbisxTE5qVGtlS3kzdmdsM1pRL0RZM3l0U2xBVGV6Z3plemFLQ3pI?=
 =?utf-8?B?RlBXYXA3T2xZaXJHbTF1SnV6NHhPRDRPNWdFQlZOTXRaK21LbFlLNDM5dzUv?=
 =?utf-8?B?UFViVWlqVkdkYU04ZGJ2WjFQSWFxRlhzT3ZTQ201THA3RWZ0U2RPQnFpekZE?=
 =?utf-8?B?Vy9ISWxBOEZuRTFkMFR5MHRjelRERVZaWWhWWXpDdXIwa294eDJBbWsvRkxu?=
 =?utf-8?B?M0xPRGIzYUMrWmM5bWY3K09VVWtyK3lzR1p0YlA4ci9zZGRsb2JON0JPTjhp?=
 =?utf-8?B?NHZseERaZ1BoaFVMSHkxNmsxK2hWMnliQVRndXdBbDV4OG9xS1VUNHB1TDhI?=
 =?utf-8?B?NlpxNE9sWmQzc0ZrTDBvdWJaS3JxaDVpL0NPK3hWa012NGtmSVpJakJOT1A4?=
 =?utf-8?B?YkhBeE1NK2ROaTJzTkNmQTYwdEJjQTY4aTcxbXdCTGdOL0t4Ry9LQ0dLb2l1?=
 =?utf-8?B?SjBsdmQ0UGtRRitvazF6bnRjMWFGN0dtZTBOcmNQRGFsdEYvdndUUDhnbGJJ?=
 =?utf-8?B?NjVzTk05enVQZGZWNGQvNStHSzF1bHNnWGs3ME1uL0QvUzhOZENYMWpuUE1s?=
 =?utf-8?B?MEZQVnNLT0tOc2dhTVBlVVJOcmUxUEg5MHZZWHIzcnJkWWxPUEE4RFFvTUh4?=
 =?utf-8?B?Q2kvN0pwZmJPaXpwS0NmUndaM3l2QnFHQkoyanpsU3BYWVZ3ZE11Yko3L0pW?=
 =?utf-8?B?SS83ZktkTS9KeE80V0ltOWpPL3BJSFBzL0pGMG0wdnZxL2ZHbWRwM2R5VDEw?=
 =?utf-8?B?K2xBY3RUSEpUaFkxZWJLblg0aCtRb2x3Z2tUaTJWQi9SQUx0SlBRcE9zdEFE?=
 =?utf-8?B?Q1pzMkhmcTBQNlBRVVRiNGgvQWVHdDgvNUx4aGY2emdCWThTUklTU0o1ajB2?=
 =?utf-8?B?RGIyTzJqTUx5K2kxNURsNjh3STQ5cWxPTjZNL0k2NzQyYm9GMi9STmQya2Q0?=
 =?utf-8?B?bWdRclVCbjhHbk9GZmtwWGgwbm9NUHUvVFhsazJhZ2pxNERQRXlXaVJ1Z3pC?=
 =?utf-8?B?T0t6S20rNTRUVDlVZDV5NThaWUYvdUtBYlcrcDZpTDlVeURxU2FTNWpEejB6?=
 =?utf-8?B?WG5rMTIxNG14MzJ0N2ZsSk00TitzU2gwaEdnOEV1c1F1ejhMVU5mS1RqVUxT?=
 =?utf-8?B?Y0lCNUdNSVViRGowaEo0K0tEZjlYaEFtQ01VUFIxbjgvTHBJdGRhYjZ6WnAx?=
 =?utf-8?B?OVhQVmg5T0FVbWJqcTg3QUdQemxZMys3NDBrMmc5UDdWMDZudUpiYk1NMytz?=
 =?utf-8?B?OWtoTTYzTG1JWThrRCtVeldvQ0sxd1F2dkVNbmNKRmUybEo3WXcwZEs1TURL?=
 =?utf-8?B?ekFEK3BDaFM3Q1RFb3VIUU5OdGZ2WXVLTG1DOUUvZm52N1NCMDJmTXVHWTA3?=
 =?utf-8?B?aTBzNmJxd3RTaUpkaEh6UTVZalRJMWtkcFdFS25TbllTNkZlYWpkaHZDV1p1?=
 =?utf-8?B?WmZsQW8wUlM5emF4NXEzOHdWRmh1MTNFSk50c3FvRlo2Mzh3VVRnZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 562e6963-64fd-4347-5445-08de4d7051bf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 22:09:53.8248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UpgDF0cMo/CTP/g/DoV2jTqESeHuRGLb/MMwWUUIR6zyVNIyY8LUByqNRRJkephOZ2FO6HmcId/IuLl2e/wX+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7720
Message-ID-Hash: YL7BBHS4AJCTHJ4N47IPPP7XJ23Y4PNK
X-Message-ID-Hash: YL7BBHS4AJCTHJ4N47IPPP7XJ23Y4PNK
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YL7BBHS4AJCTHJ4N47IPPP7XJ23Y4PNK/>
Archived-At: 
 <https://lore.freedesktop.org/09e0454c-222b-41e6-a8e5-6d6240b20479@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/6/26 4:02 AM, Danilo Krummrich wrote:
> On Sat Jan 3, 2026 at 2:34 AM CET, John Hubbard wrote:
>> @@ -209,7 +208,9 @@ impl GetGspStaticInfoReply {
>>      /// Returns the name of the GPU as a string, or `None` if the string given by the GSP was
>>      /// invalid.
>>      pub(crate) fn gpu_name(&self) -> Option<&str> {
>> -        util::str_from_null_terminated(&self.gpu_name)
>> +        CStr::from_bytes_until_nul(&self.gpu_name)
>> +            .ok()
>> +            .and_then(|cstr| cstr.to_str().ok())
>>      }
>>  }
> 
> Did you see my reply in [1]? The question is orthogonal to this change, but

I did, but momentarily forgot it during a miserable day in which
Thunderbird and Wayland started violently disagreeing, and every
email turned into a troubleshooting effort. :) Glad to be past that.

> perhaps it can be addressed with a subsequent patch?
> 
> [1] https://lore.kernel.org/lkml/DFEVITW4O9DW.P4ITE1PWIDY6@kernel.org/

Yes, so that would look approximately like this, I can send this as
another patch if it looks reasonable:

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index a53d80620468..71fca7350b94 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -238,11 +238,11 @@ pub(crate) fn boot(
 
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
-        dev_info!(
-            pdev.as_ref(),
-            "GPU name: {}\n",
-            info.gpu_name().unwrap_or("invalid GPU name")
-        );
+        let gpu_name = info
+            .gpu_name()
+            .inspect_err(|e| dev_warn!(pdev.as_ref(), "GPU name: {}\n", e))
+            .unwrap_or("<unavailable>");
+        dev_info!(pdev.as_ref(), "GPU name: {}\n", gpu_name);
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index a11fe6018091..426441978b4b 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -2,7 +2,9 @@
 
 use core::{
     array,
-    convert::Infallible, //
+    convert::Infallible,
+    ffi::FromBytesUntilNulError,
+    str::Utf8Error, //
 };
 
 use kernel::{
@@ -204,13 +206,35 @@ fn read(
     }
 }
 
+/// Error type for [`GetGspStaticInfoReply::gpu_name`].
+#[derive(Debug)]
+pub(crate) enum GpuNameError {
+    /// The GPU name string does not contain a null terminator.
+    NoNullTerminator(FromBytesUntilNulError),
+
+    /// The GPU name string contains invalid UTF-8.
+    InvalidUtf8(Utf8Error),
+}
+
+impl kernel::fmt::Display for GpuNameError {
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        match self {
+            Self::NoNullTerminator(_) => write!(f, "no null terminator"),
+            Self::InvalidUtf8(e) => write!(f, "invalid UTF-8 at byte {}", e.valid_up_to()),
+        }
+    }
+}
+
 impl GetGspStaticInfoReply {
-    /// Returns the name of the GPU as a string, or `None` if the string given by the GSP was
-    /// invalid.
-    pub(crate) fn gpu_name(&self) -> Option<&str> {
+    /// Returns the name of the GPU as a string.
+    ///
+    /// Returns an error if the string given by the GSP does not contain a null terminator or
+    /// contains invalid UTF-8.
+    pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
         CStr::from_bytes_until_nul(&self.gpu_name)
-            .ok()
-            .and_then(|cstr| cstr.to_str().ok())
+            .map_err(GpuNameError::NoNullTerminator)?
+            .to_str()
+            .map_err(GpuNameError::InvalidUtf8)
     }
 }



thanks,
-- 
John Hubbard

