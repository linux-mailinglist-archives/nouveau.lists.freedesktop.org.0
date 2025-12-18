Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF5CCBF3C
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 14:17:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F39E310E404;
	Thu, 18 Dec 2025 13:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oFDiaVk+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2095F45982;
	Thu, 18 Dec 2025 13:09:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766063376;
 b=z85QxQxVejZlQQgJWGmDP4KiRyufFnGT3UOTBagcLkHLXYKd4eNsh6PyjVINnvCVYxdvR
 XLhVquZ/D0Vk4+yZ2VdFM8/M6/59jklaJdhfqTe45llnb4IgxWNzjSS6eLC4fQOtdS6WPGa
 nNDCSDyvQs9cjERAdTaNKOYydSAYLTFlpvPG6ZV9I8/Z7v8tEfaF3sYis9FOehHoEiAb8Ed
 83JEavEitDFGqrtsERo7tzYAomY1V1zkkekKd4mnNiJTMrws1B257RiLpoEqfu0DZclZnIw
 K7o5G2j3g9a/2O63trX/vyRchECY4P0uNzvRmXDI8TiC8bAUcp0Drh9AUeQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766063376; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xbiKAVMaHZ3SoTZ6pqv7N0m1LK5nXUJpkOULV8kpiDg=;
 b=HCaTso7Yce8pDMu6mShaD3mzlqPc50NrsGnSne7f38rbEtu/VgkTYTJNXYWBok5nGwd1+
 mpEFR+WlKzY8UcPOx10md3ZUPc52+KUL1Yfxkjrce4354bIPrE9fQyJoFgCpN4EG6jdbVZA
 TSeJ3COGZepRl+FDOYhs7G93pEZ8ChQ0evkLm4mHki8JmU79MDDznyAS5OnV3xt1aAONYos
 jzqa+2Q/Hu4098MS7dP6pV501WtVDd5ofpE5mh7+0Wrrti/H0v28kEIxotTHCSFjN9IR3BR
 e/BhZoUmcyk35pdOnCjYIQdgDm4Nv81AUTgwzQ/pXLd4IpxHebingGINRmDw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2FB4645980
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 13:09:33 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B220710E108
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 13:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQiEXagiurmKBypFUBCPKBlRStjkinaYxDq+l7EQan+icRRqZDVxzci1Ro7IzRpH8Er/MLE/xJ9KvPeg6ouDa1NCFZ3NsOPBXfJV+DwhkEJlm93JRJ/XAI6V3JAqosTOSGuTVEBB4SdkHK3MLVEeWDybMzP+HP1wClfLXzjirMbsYQDINoDZtQnTdlFKZQAh9vPY8WlyO96aAIrzYiNjMIbes80eGPhNsu7aLZdEgrtgmzlkaxo/KewXrTWmLc/WOU1Ag51+w/UNnk9bGj4u9wCirrrnsJrrwBOyvcKzCDmw45UP5KmPxfANKeZ7Hcbubq3jF9eAxu47O9YLOJQ5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbiKAVMaHZ3SoTZ6pqv7N0m1LK5nXUJpkOULV8kpiDg=;
 b=P5EYaVOXex24CKX/wxlVCNT0nC1oNeJsgScFJ2rTKDrKE3KLc+gSve6I9XzH84yD+8fBOZ+eJb+pkio3hKGPkysmja8h5tzs8jFJB3uhN61jgdyiqZ42fG81lqO5BsmnOoHZcESEOaInYc36x+mE6gY01k15mlxqbxQ0w5cd0nZnV+exzGf0ER7h+8e22B4eW7aD7qvzJy2qcDBz7Af56ZY99uLM6C+1omUggpVyOIKFpEA1J7Ppouoe7By7gXp1by+YkDzIcVzhU8F3vLm8G2L13mMrhRA+wpNF8ZjyoZM1OMZaAdVKeTFSkTakIGTaZg74+UW3jlc7Zl7D4E6mDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbiKAVMaHZ3SoTZ6pqv7N0m1LK5nXUJpkOULV8kpiDg=;
 b=oFDiaVk+2ZLDkFLJuD0EAw6QO2eWRdyXENlpHrGiCEtPNRj1SrWv09g/OmJgn9SqFklw80RZoI472X3T74K3s6hQyuB4C8PTkqKojrk76BUIaN2v9lf3aUl6avTihBy4MEAo8Pae0S6FNl0n9vSDxbIq9IuDDlhnQq0mD1rSrGanBU5std87gISgI/BFDCveAZ28iIJ3mzDp7cNrb0HaH8UUI9nkZz14Je9hxgZRIrUPsHrorfbJ0eAownqOLOKRa5bnouWAf8DnNoWCQPie1P5aBQv/eJhGNgmHJ8ApfL/g6qHaFBMU8c5Gfa2TEinaf3b9YtSZ1LNyMv0Ge7zXxQ==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 13:16:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:16:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 22:16:48 +0900
Message-Id: <DF1DDD8BUIYQ.1YCAA8T6557NP@nvidia.com>
Subject: Re: [PATCH v4] drm/nova: Align GEM memory allocation to system page
 size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Brendan Shephard" <bshephar@bne-home.net>, <aliceryhl@google.com>,
 <joelagnelf@nvidia.com>, <acourbot@nvidia.com>, <airlied@redhat.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251215083416.266469-1-bshephar@bne-home.net>
In-Reply-To: <20251215083416.266469-1-bshephar@bne-home.net>
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b0cd91-84c3-408f-b078-08de3e37b522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mmd4ZThNZGVYbVJTOUgzMUorVUc5emlnU0hwSXpXWkhZeGVnUU0xK0RndWli?=
 =?utf-8?B?bWYzdTVIZW9oLzFpSlVIaVdtNGs4VjdDcWp3em4zWXdFelVFS1BGMFRNa3JF?=
 =?utf-8?B?ZDR4MFlDK29pVkZvUi83ZVBRMzA1TzdKdTZrS1RQM3YvQXRhR3oxRTlTMHda?=
 =?utf-8?B?U3JXd1YySElROGVXSVFnQ2hldUw1aU4vd0NobDhEUjNhZ3R3eGcvOW45YzdW?=
 =?utf-8?B?VHZmbzh3UHJUVVpPN2RhQmR0dFFkV2lWZTgzL2JmK3duZkI2UU1tc0E5elVG?=
 =?utf-8?B?TDczaTF3eFNoTzgrWHZLdzNwaUl2ZlFFaGJ6WjR1czM3V2pneUVxSTBVNEFR?=
 =?utf-8?B?VnpBd2duMUt4TkJwWU9PaHBrbkNob2pweWNTTWNONWFxanM4bHJ2cVhrYUFH?=
 =?utf-8?B?VGw4VEZUTjh5VWtoZDl3TnNyb3lpSElMU3Y5SDZGajNGY0ZUQWtTakRHblBH?=
 =?utf-8?B?dFhxWjFjSnVQdmZBUXRWUzA3KzZ3VEVINFZHaVhyY09rR1MyYk5hak9JRk5G?=
 =?utf-8?B?ZlI2d242Z21hekZlTmNCYVZ3WUhkWHFXYVZDWUdiampOdDJjYTdIYTAxYU1v?=
 =?utf-8?B?NE5meTVsTnVna0pTUCsxd1NpZG9sdE9lS28veDZWb2o4MmpkdWMra0dwcjRI?=
 =?utf-8?B?dFJudEtaMXJLdWtMYkg3Y0h3TXlKYkxieHI0c1ZSWXJXRFQxMTB5b3VzcTMv?=
 =?utf-8?B?SXJuK0xhN0tRWTBqQWlZdXlRWUFFSTBxZXZjMEdHTkRxVjJWcnl0TC95UU40?=
 =?utf-8?B?N3FwL1FiZDhOZ2NlWCtocXZYYk1XS1lGUHVuTVhRRE4xMll6dTA5WjZsZDA2?=
 =?utf-8?B?d3NTMzJCV29tdmJQSjdaWEwxclB2ejlsVzd2RDFpeFpXd0NJYnZwVXlEbXBt?=
 =?utf-8?B?eGlpNE9XRnZvdzVJTUh3NTJ0V1NuMWtVMkNzTVdDdDhSKzJwYk1NWnl5N1cr?=
 =?utf-8?B?VmlxRFFvRTdnRS9JWEE1dzZCb29IS1cwZ2E0TXQvcUZWc1k3VzlybUo5RTZi?=
 =?utf-8?B?SDhlT2dNTGlFazJOWldKR053SDRXN0J4TnNNS0s3YXZjWlQ3S3FlRzM1RGVi?=
 =?utf-8?B?Z0JTNzc1TnlCejc4RldITTVmZVpsVUdSa0YxQzYxVXc4Z2VtbUNqcm4yS2Vj?=
 =?utf-8?B?eDhVZVBJMVNoajB2REhTeW8yTDRQdG90SGVLQlZ3YkdYTG9HNktyTXN2d3dv?=
 =?utf-8?B?S2IyVGE1QTRCZ0orajZPQ3VQVDJ6QWYvc2diRXpWU09Vd3VvTWVHdkVRZ0cy?=
 =?utf-8?B?T0QycnBYRk1WcVVmeFZqZXpoekFMQS9QdE9PdVFUUjdlRlFOMVBsRktISTlr?=
 =?utf-8?B?SEhLNHpDM3ZXWk5XTnNISmE0R2NXQ05ydis3dTc4OUE1NHhOZTMxRE1IWEND?=
 =?utf-8?B?eHVqajVVNHFNbnMyU2ZxN0kwU1BmK1NLZ2xoNzF6cTFRWHFLNWl1elRDK3JR?=
 =?utf-8?B?Z0wrdkd5S3BjMU5YdWVOSTBUWWxQekJDMk9TNmROTUk5SGVjbXVmTEduS044?=
 =?utf-8?B?dTI3SENoTlFDekVTOTIwcWxnMXpMbE04aDhkeDBKejk5RG5lNDJlcVpOZ3N2?=
 =?utf-8?B?blNHU2ZuWnhyS0EzR0F0ckhmWlJDRCtoalBFc0lHUGhGak1kcFV1VEdtUUsw?=
 =?utf-8?B?VG0xaklkaWVId0Z2Z2NtM0lWaXYyT29LSEV2OENsQmdBZ2pFUFBWb0FwZGd1?=
 =?utf-8?B?cldoeDBhNFlYSXhLblRpWTJCMTUwZFNXcEdKUG1SNjJWYndnbnNiTzVhL21D?=
 =?utf-8?B?QS95aUptTG1NL0RWZ3NGUFlBOVFrZWV0QXZnWFNRcHhVTFRkZ0x1UGNjVzlJ?=
 =?utf-8?B?NW9TQnJtQVhyTXhyemgvVE5LY012ODNtVUMwUkFvWGdOc2dIQnNtekQzOWZh?=
 =?utf-8?B?bTFuYm8wSE5mTXNNZnU4OVI4bHZvQVNuQWwvbS81L2ZHRi9PYVl1dGNrVFhF?=
 =?utf-8?B?ZmVLYnRncDM2a2RrN0lvTGt6VTFSUmZsQ3RTUGt2R2gzUldOdXlvdmpRb2ww?=
 =?utf-8?B?ZEJuYmRVbFdRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?azJVRjk1Mkl4VkNMaTdBUkp5K3dWMFpaemxVd21HWHRmRVFpd01iTlBCU2Fu?=
 =?utf-8?B?cHRyeWhpZXBrTWhMa0xCM3F2OU1IdmRORndqYmZ2WUI0T1YvYjQ0d1haRHpP?=
 =?utf-8?B?bmF3eEFmdElaOVJ1SGI5WXdNTU1QL1ZXQ2ZWUjhoYS9uSzdjVWh4SFhqdmJP?=
 =?utf-8?B?YmNzRmNmbG44Z0d6UEFSVmMyUEJKOW9lVnNOYXI4T094QStmTEhiSkV0SThZ?=
 =?utf-8?B?dUJ6cnVrUVZoUEpjeDZTbm5VTlJ6b2tVTkJZWmFmQVBZSkIzdFdFdHpQN1JE?=
 =?utf-8?B?dGV6T0J0NGgrcEZQVDhiM0VTWlpJQmpXdFpibTdoZVVCMi9GYVozbDlwSFRm?=
 =?utf-8?B?NWI3L1RoNWRvWmNjSWJFbG5zenhYZTZsSFZIcUtxMDVBZW1vOXFTZE5HSEU2?=
 =?utf-8?B?dzR0RTZ5eXFwaHZtS3NNVmduR1JYaFVzT3E5Q0Q3WURzRVRvVFhNN3k3TTNY?=
 =?utf-8?B?KzdsVnhFR1NxQWY5TklrRzF0d3YrZ21ENTVkMjNqMC83TGZDNjQ1bUZXam5h?=
 =?utf-8?B?ZDA1N1hIV05uZzJBaXdpa3N0NGtidEJJVk9ySmd6RFBoMXk3R21pWkIwdE9t?=
 =?utf-8?B?bDdadTFmK0lHRTFBcHdRL1AzTHJhY2Y2SnpHc3ZpVnpTQ3htRkluc3kzQ0NW?=
 =?utf-8?B?ZW9SSENGZ3RhZTN2Z0dBQWljYU5zd1NyUHNPT2JxdDJuVHJQQy9PUnBreWRE?=
 =?utf-8?B?bEpsajRHTDZTWHVRT2hZV2J0MUptZCtjQVFLOWszeGwzRjBQZEpQMlFiMzV2?=
 =?utf-8?B?Q21haEdEcExOWU5yV1RVc1NmNkQwNDZLME42Tkd6Qmk2SjVlQUpkL3pMMndH?=
 =?utf-8?B?VmZaeEtSRzN5NTluSEgzRDhxcUFCYVZuSnN4NDVYZEpXWGo2Mk14dzdEOG4r?=
 =?utf-8?B?U3JMTm9pL3p1MDd5aHZOVnJSMTkrRmhNcTlqSXQrV0MxL3drRWNNK1ByaThj?=
 =?utf-8?B?UWRSaXl6ZEJHbVNMQWk0WEE3TmsxU3hBRmxuSnljTTRoNmd2NTBhU3NhVjBM?=
 =?utf-8?B?QlM1c0p3dnh3a0JXaGttbi9uNlcwQU5rM0lEZGswZGVjWlNyME91enZ5RGd6?=
 =?utf-8?B?bHNySjhMQzVndzNyQ0dpeSttaE9zWEpBKzlxUnh1blJRdjZwSWhoVjQyK0hW?=
 =?utf-8?B?d0xDejd6RWdDRWU4c1JpcGliY09lUDM2OTlIdlZlZmpSa0RpM2xEeGJCbkd1?=
 =?utf-8?B?UGJKcXI0N1VxSlZZUGxUTVUxTXRGbjUza2dtWGtlREZBalZsTUE0SmlzS2lU?=
 =?utf-8?B?bFRFdVpKdE13NUg2UUJaQU9KWlkvZHpZaFE4QTlOR1drcGZlUGpydnBuckgy?=
 =?utf-8?B?WlVVK3UwSHQ0LzFEckVXWHdlVm5HMW9OWjJUNlhsS3FsVUNHQ1ZHbWlKRmND?=
 =?utf-8?B?NndZTytldGhkOERYcUtVblhoMU9rWFlpNVQyTHd5TGhEazlobml3WjNHeW95?=
 =?utf-8?B?Tmp5Ry94dmgwTXFLTVJXY2ZEd2R1NUUxT2JzOEVTV0NkYml5bFpRbUgwRnJk?=
 =?utf-8?B?aVZ4S0hranNoaVZDSmkwRGdTSmlBMEtqOEdoTExPd1o3ZmdvOHVoUzRHY1gw?=
 =?utf-8?B?c05GOGpRaDkwSkZuR3E4Q2ZzRExaS2J6c05VN00wMkltOUhrM29lZHkyVTRF?=
 =?utf-8?B?V1paOG9qMFZSV1daZGRUNjJONElTSWFpdzhxenBPa0JQcmdxZklRMDFwU0hv?=
 =?utf-8?B?Z29qQUQ4bkQ0U0V5VWd2V3JXR28rTXNjZHZxekdqdHU3ZnpGNCs5cW9Ualc0?=
 =?utf-8?B?UUxwNWxjbDhKV0Z3WVJEeURrNWRmUU5QUWQ3UWZzVHROcHZES2h6MXlSc2Ez?=
 =?utf-8?B?b2dZTkxtTjVsUHRXV1czcGNBcGNEbG5ONTMxeE1KQ2s0endXMVR2eTJtUGNl?=
 =?utf-8?B?TUZQbkYvOFZlWWw1dTVzSDgySkRhZEZLS3MrVzdtNVdzRnR2dzUwampCdjZV?=
 =?utf-8?B?SW5zMll5c3dxenc3d1BUT3FOOUpwYWtpNnIzSTBVdkE1d28yZXNvUUNhVzcw?=
 =?utf-8?B?U2k2cXlidGhPL1NSNDZnV25oV1YxZHdVQU5uMnpVbFNQV3k2Tmd2TjQ2clQ2?=
 =?utf-8?B?eDMxd1A3aCtRNVUxRGg0YjZSaGhwc3VZY1Q3ZC9XYmtudlpTdVhNK1dkVnor?=
 =?utf-8?B?d3FxNVRtNGFCeFRkUEdnVXV6Mm95VFRhSEM3bHErSit6SGNCd1RUcGs1OUt2?=
 =?utf-8?Q?NFGgLNriGVgA/t/CD/ZMpJtc6NYo0hpovLkJifEixRRL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89b0cd91-84c3-408f-b078-08de3e37b522
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:16:52.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a7Hj34cXwLBhpFRsorvy58aOsIagWoJ/bWLAw/dJebLoS22y6V0ZZ9SVyT6oQviQzaP0mlIi1f1ozuauIcMzhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
Message-ID-Hash: LXC3KBOD7PJS5FAVS37UM7RSYFF6CWT5
X-Message-ID-Hash: LXC3KBOD7PJS5FAVS37UM7RSYFF6CWT5
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LXC3KBOD7PJS5FAVS37UM7RSYFF6CWT5/>
Archived-At: 
 <https://lore.freedesktop.org/DF1DDD8BUIYQ.1YCAA8T6557NP@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Dec 15, 2025 at 5:34 PM JST, Brendan Shephard wrote:
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This is important on systems where the
> default page size is not 4k. Such as 16k or 64k aarch64 systems.
>
> This change uses the updated page_align() function which returns
> Option<usize> for overflow safety. (See "rust: Return Option from
> page_align and ensure no usize overflow").
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
> Changes in v2:
> - Updated to use the new page_align() Option<usize> return value
> - Prerequisite patch:
>   https://lore.kernel.org/rust-for-linux/20251204224006.353646-2-bshephar=
@bne-home.net/T/#u
> - Link to v1: https://lore.kernel.org/rust-for-linux/98227EBD-92F7-40FC-A=
5A4-3FF3780FB2CB@bne-home.net/
>
> Changes in v3:
> - Add back missing semi-colon after ok_or().
> - Reword commit message to be more concise.
> - Link to v2: https://lore.kernel.org/rust-for-linux/20251208064405.57302=
6-1-bshephar@bne-home.net/T/#u
>
> Changes in v4:
> - Add back the size =3D=3D 0 check;
> - Rebase on latest drm-next branch
> - Link to v3: https://lore.kernel.org/rust-for-linux/20251208071810.65322=
3-1-bshephar@bne-home.net/T/#u
>
>  drivers/gpu/drm/nova/gem.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450..3a3a41e8d4bc 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -3,6 +3,7 @@
>  use kernel::{
>      drm,
>      drm::{gem, gem::BaseObject},
> +    page::page_align,
>      prelude::*,
>      sync::aref::ARef,
>  };
> @@ -27,11 +28,10 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinIn=
it<Self, Error> {
>  impl NovaObject {
>      /// Create a new DRM GEM object.
>      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem:=
:Object<Self>>> {
> -        let aligned_size =3D size.next_multiple_of(1 << 12);
> -
> -        if size =3D=3D 0 || size > aligned_size {
> +        if size =3D=3D 0 {
>              return Err(EINVAL);
>          }
> +        let aligned_size =3D page_align(size).ok_or(EINVAL)?;

nit, but it's a good practice to always leave an empty line before a
block of variable declarations.

> =20
>          gem::Object::new(dev, aligned_size)

... or if you prefer to avoid the variable altogether:

    page_align(size)
        .ok_or(EINVAL)
        .and_then(|size| gem::Object::new(dev, size))

