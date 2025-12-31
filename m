Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E721CECA48
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 23:47:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 807F510E9DB;
	Wed, 31 Dec 2025 22:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OipRIV/p";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C112B44C83;
	Wed, 31 Dec 2025 22:39:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767220788;
 b=oer+0Qh4seMl2PLVtnBVhoSMXoXvNk14xtvZhcSPGdqUld2WB37kwoSjUN5h2CecOvWwk
 uEbNKxF3z+Y7vn02uwdy1Et2ga4/pnWJU8yKvjajSJ5GDqLGV1rgwuDWRRoZSykS7wsZyTa
 YhZyV55v8PkexKuio/q3DleDHYT1y3DcaeC2JpCYbOb/QbsWciSbg2ST3GQICauvQ4K9Fiw
 ilsDjVdCnz+yZFcUME5GPDOwWEg5mrkGRzmMYwBRRJFHk6vQAz1PhyglwdI0sZdsPMm8c4/
 j/P59Hgc7MVJ9VxTDmCeAAXsSfKT5yyjsVdhGTwWRstcy0y5ZOXhxztNby/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767220788; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LmLvyhjS5HxtYkEa+IQJ3B/NTfrUW/fgj1p62V2gId8=;
 b=uRS3wIVNOtgfvOa1orkfj0TR6RtHxtnftsr4NUcCbMN2D8qZEKIb8jzo4iSgiVuNb1rJS
 it2ADJPLFK6bFs/zX2miIpkT9nhjFVGSSNdNEbDmA6aDjgOAA0rI69Iu3vG+H7qX15ShcE8
 MXoRDU6vadamF2sOlryHO5GH7Xxg88Y2pURFG4OhP69OnB3Y7Fp+PpjSJIjSWFZ7E3I2GSN
 TpS5djVL0MXQNFVdmIzLlyLFAnDC8UGUh9+mIJVOUV/vbwv8Ecn30Zwu6Fxtmm5aECSffva
 RcDRPA5DWfzkopDqBs4InvuaDRkGcxxXgcm6f4MPMYAKtlGZ6bCxM8cGOP5Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6AB1044C7C
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 22:39:45 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011053.outbound.protection.outlook.com
 [40.93.194.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D036210E2BD
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 22:47:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COH+rjCBw3AIRErK7OxiD1WqxIX5caztpOBVQtgfXpuzVS84rWckwbs182SmdgF1hBO6gC6LZrt49oySgib141ttYEujIVpqPc4it2+Mg0z1mcrzn6WSqWECF/3rqkqD/iI924wv4cB0s5DK4UqwMor+T6YRb5sBVWXc8Z40ZSvd53itigmHrQTD+LwtgC36FyFJ9orhthBIjvQvlUJvvtd1eraQjiW54TLUKfBYwDwYlZSMoF8x624bAYM3njlsimDOAv1LiNZkY0h8ZbOmPF/z0c8UrxzJsdqpIOHkiqTg9Tu8Pk1w7CMjWpgBNgS+CWpufr8vUfqjR1YTKyQ19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmLvyhjS5HxtYkEa+IQJ3B/NTfrUW/fgj1p62V2gId8=;
 b=zNWBXezOW/w9TKqYHc+E/5/95OtrmgpvVQIZpN+PjlpIb5FzFKYZwseu5TJB1SYvLQB31ObjGDdJdTXLaoVkLLPrtFF2Y3owPj8qRx5c0Fk5muMIUbmoCrC65Y074ct9f1UuEv2H2BXhZ8PLFIH9pjUL8v5+JIDYrvi5yxZQ+i8QeAaswb8hDrqT/j4mzLcESk1G7iSdF7EeGziR1JLJJthBYRVL6lBnSdwk2cVdVbqH16lBXR8B88yQxJ3VUXN/c1U/BiQXwjzotTlhZw+XFhvWfGjt7bWeMAwYCarYWJPJdV3jKbpr4DS8Io2JTa6xCJOKBul87AC6uWiCc9ivHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmLvyhjS5HxtYkEa+IQJ3B/NTfrUW/fgj1p62V2gId8=;
 b=OipRIV/pApkib/aC4sewQlGYLFbM3hhfoi9DT+p3UHtjpxLoM0/sTI7pZG+Q2GmsRgJvPOSLEgbTctJToA877imyx55I9Y1/AIThGYu7uA7JyJbzJzw31Z2AEtMpLYuylPxwxH7JB7oaj+kc6DhOh4+SrFNGO58A5zVm2SfH1LxniEEiH9LuOlh+I3A9N7mNRBb81Ni4jq3A4MkTcQwYDzCEG3INryq9xWZM2aBzrzDfM/ha2xMXuVow5pXyteRxcMUNuv0HV289Zdynrash3GIck0c7dqwJRv2rxCHE8ii6hk7TsdllxtEugIB4kjoCmvzxLa7x9XChp026KRX/mg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.14; Wed, 31 Dec 2025 22:47:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 22:47:40 +0000
Message-ID: <ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
Date: Wed, 31 Dec 2025 14:47:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
 <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: aadc8aef-0b44-48cc-96db-08de48be9a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWZ4Y0JLOHQ3MFFMdllDOVU1VEZ1WHdmYWpXU2ZNZ29FK0ZieGdOQWpFSlVH?=
 =?utf-8?B?WldKb3htY2lEaFBJS0I3S0psV09xbHVQWTZ5U2NrS2dLOWF0cHA4Wk1sT0ll?=
 =?utf-8?B?UU0yZVVWRXN5N3pvU3NqS09xN1VJWHhseWs3cDc1SFZ6QjlkZy9wRkhQZDMy?=
 =?utf-8?B?ZHhjTng1S2VSRkZwdnM4L2lBKzdkN1dwdXErSVRXUXUyaDlsSjQrMnpENHBO?=
 =?utf-8?B?SWdsY3Zsbm5oY3VISlZzbTVjQWprRWpnNFpLUnlxZjhkb0xGNVJZeEx0VVRH?=
 =?utf-8?B?VUxrQlNKWENHTEt6cGxESUtvVFFSdVZrblloSFA3dFpQQmh2QkxTOWV4a3ZZ?=
 =?utf-8?B?eGQ1a2ZibUlERU1EaWt1NjRadVp0SllLVUJJQTN1NHp5M2RRYWpmcWI2NzFF?=
 =?utf-8?B?ajNpZCtuVG1aQlBuMnRSNHNWQ3BMemRqNlo1Z2VzbFJ2UU0zdHdLZUhRSG9N?=
 =?utf-8?B?TGpsTG5VQkd5WjZPUmxTdnNrNDZ0dVRJYWVUTWxHbDBkUnpDTDF4d1NpaFA0?=
 =?utf-8?B?amtFbk1LUGd2dnRvVzNjM3UwNjdhSDJVbWpyNnVTZDA5VlFJSnhZc3phby9E?=
 =?utf-8?B?bUcxck51TExkQ3lnVEF0SS9wT2tsc0JKWGthSkRWMFhmM3BuajVZZ1U0Q1Ir?=
 =?utf-8?B?ZkhuUExiQnhjRWRZK2ZiZ0M1VWpNc093ZXEwSDk1VEV2VjMxNDdWZFdwMmNY?=
 =?utf-8?B?dkN5TVdOUHMzcXV4ZHdLd21BaFlXS3hQT2tQSTJCMnBPbGdzTmV4TFl0K1Zj?=
 =?utf-8?B?VUczRk1IUjQ2aWdQOVZNdmpiVEExUTZQN1dkZjYxZ2poaDNSRC9uOWpMelVL?=
 =?utf-8?B?ZStTclljUnB5TndFdC94RjZDdVh5Y1UwLzBMekFqTTBmUGs3L2xMaFhIWHcv?=
 =?utf-8?B?TTFhL013WGNhNlZjN25iVllaYXNZSmVXeVBNQ01CTXk5ZURuWUJjZnB1REZU?=
 =?utf-8?B?U01hZEtCMUtJb0ZDbGdtcXRicUxSTlhRRnZVVnZaYkxhaG9vT0N3VlBTVndG?=
 =?utf-8?B?QStFSkltdzI2eFgyZmpEb3VJQ2dYR2NuWWFkem9jVXN2dTdtelNBTktQaEk5?=
 =?utf-8?B?QjVKOEhWdDFsaEJtSE84bmVBaW9ydjRhekxEY3g4bUU5MExkbjBuaktUZXlJ?=
 =?utf-8?B?clNxREF2cmR0MElNVmdMTi9ZUG9vNm5TUE12RVN0Z1o3RWx0aFVodHlNRUJl?=
 =?utf-8?B?ZUtXays5OE1tZmxpZ3JrdnoyTTh6TjNMbEw5NWRvM1dxbVhaWmV4UG03dWRl?=
 =?utf-8?B?bDY3dUg1U3kxeDFQZFdrQTJ3dGJnNjBjRjdTRnlNMTBhUkdLL1ZPd0lvUkg0?=
 =?utf-8?B?RmxPbVlESE9Cd3VjaWFTU2dEUjJ6RmEycW5rN3RoK2NSNTdTak5xUFc2dkgx?=
 =?utf-8?B?NFB5TW1DZU5DS0U2RmNMWmlHTzJxZW43NDRoRnB1N2NnWGUyamk2SFR4cWFm?=
 =?utf-8?B?Qll2bWttUVE3alR5ZW52Q3I4WUhDdmR5NFNYL04reXEzRTE3Z1dRMEpzUE1W?=
 =?utf-8?B?WHpWcnBDOWNmaHhVdURibTYzSm9XUkdHbndqc3hXaXlWa2N1RmVkckNMSjl6?=
 =?utf-8?B?Q1JXSS9mWmlRc2pDWW1zc1dzUmx5amNCeGo3T0lZd2RudW5WRWdObVJFL1d5?=
 =?utf-8?B?cGsyUWtVRmJLZDJNZkEvMzFuYUx1TmFlaGk2anIzV2xnSWwvbm16MHVTSGow?=
 =?utf-8?B?MkpFWWFqN0ZTZTM1K2hneXIwWGpvbUR1bnRhNjI5blhKS3A2dHBoUHRPSXhp?=
 =?utf-8?B?MkdRY2s2aTFVOFNlSnl0TXFkb2I0TWdhcy9IWE9CaWFhaGFaY3BFZjZNdXZB?=
 =?utf-8?B?SlgxR0MwekFpUFZYUnZGT0RGb1poNzh0ZFhwZzR4QzZmWm1MVXJIMlJuTW1k?=
 =?utf-8?B?Q1JyWnpsWkJLTVZQK01xZHkwdEdYQjJnbXVjc2NmeWwybXpSbUE0SDFIR0FO?=
 =?utf-8?Q?cwIOsPHcQw+7hXk4hr+/TXEzH5z5ZLLC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VHp6ZmowaW9OcU51UjJ2MDVGYVJ0MFVHVVVJbXQ4Y2FsVFVIQndUcjVweG42?=
 =?utf-8?B?ckVqcE9CQS95NDI4S0x3S2JoV0FzNTJ6RVozWERPZGcyZ0ZlRjJYUXlsSHVw?=
 =?utf-8?B?Y1lOK2hyMGdlWHljM0JUQXJmdlRyeDdJYmplNjFobkwzekFRVUZiZUFhVWhy?=
 =?utf-8?B?WUVnS3FESHhuUEdpelA4U0w0Wk5qS1E2R3RTU00xMHFGTWJBeG9lUnJ3R3p3?=
 =?utf-8?B?Y0dZMm5qNkhEYkd0Zno1N20wSmYvK2FPeW1rWkpwaFc3blFwY0NxQzlLRzVw?=
 =?utf-8?B?RHRoeG4wNHJNRExPMVZ1TFRrVmI2TzJ6N3VSd3JPQnZwVDFScTh5N0RQK1dO?=
 =?utf-8?B?WlB5c1o0U2JQUWwwbGkwVlRQQS9ROUhpVDBYaTVRV1ZrNlJIei9TU2E4cVl6?=
 =?utf-8?B?OG1vOHMwOUc5azBsdUJLUzlFOXBjRXpKbWt1d05sY0lMSy9BQkpVYVFTWElX?=
 =?utf-8?B?bzlrMk1PM05ENi9ycUpjaG8zVFBPNGxyUEdRb3Y1eTk5U3NKb1FkcWVpRWtQ?=
 =?utf-8?B?ak56U3ZGRTVnVVRnK2kvbXMvR0o2N2VDakwzOXhNWEwxN3doMVdaZFFYU1c0?=
 =?utf-8?B?ZzhhMzFLSVpKL0VDVGFhaVlyMGZoTXhieUdiQzVoWHBTbVpsYVFrblRtSFE0?=
 =?utf-8?B?VUFQbURJdzFFV2Q0d0hIM2RtbzkzREpLdVpnbWgvdnU4K012VHFFcmN2WmY0?=
 =?utf-8?B?aXcrRGtvVHNQelhEZllYNlVxMHduQlhrZTVpcm9TWEpReVpVVlUwTXNPY0Qz?=
 =?utf-8?B?T0habGNBZElSUFExRXJYVXR4djVOVmcrYmswRG10c2xENFNHRU1sa0E0czVu?=
 =?utf-8?B?dlR5MVlsYTNYSWlROXhud3NPclh6MHM3RG9OM2UyQ2NmemRMeG1hV3dxN0g5?=
 =?utf-8?B?WEpHZ3VqTmtRVm1uYktDeFRFSSt2MThBcmVkN0ZOR1ZPZFFqRStsQm5Dc3R4?=
 =?utf-8?B?YXlYSUNLQ0x2NndpU2N2OUQ1WUJaMEhEb25YNFBIRitIRW5CUm5hWnFNOU9M?=
 =?utf-8?B?MlozUWdKZEI4T0RwVmlwY0twNkViazEyR1VTN3FtbTlndG5lVzdtRU9zK255?=
 =?utf-8?B?cllheWp5S0Y0bjVRdmt5ZE5jSzlLWC80QzZmUFpkMXhYMjJtVnJnN0ovQjhP?=
 =?utf-8?B?K3pkT0ZnaTlQY2N4Z0tOalhsMWdseTJsbi9La0FoMEJvQU04WUh1aWtGeGE4?=
 =?utf-8?B?a3BZaWpjM29EbVJCOWtRcFk2VGtKekJRTFlqSXcwZkI1Yks4Ynd0c3gxc3pC?=
 =?utf-8?B?V1N2ODMySmVpZkJsQUR1cGdPU0hlNzlSUnEyUTRqM3poaTVzeXFvRE5qQmZY?=
 =?utf-8?B?Q0JwK0VxN1BsM0xWeUV4a1dxVmdLdmMzM3U1VVY2Zm8wakNUMHE3ZnJoU1RX?=
 =?utf-8?B?Q1dtcHdEQVVTanlCUkJRUmYrU1BBd3Z3cFJkbHNqNHUxc1I0ZzdlNDFZR3I4?=
 =?utf-8?B?Zy9WOTdQd3NRbnRoNzZyMUFuYU91VCtmbVhIZXFlTWFTck9wZk5rYlVzQVpO?=
 =?utf-8?B?K2VSb1hpMW9DbVlnRC81RzRvdnJzNitKVkwxRGlvSTNJV09VR2pFbktiYUxS?=
 =?utf-8?B?aDBuKzRuRzBKOVZOcHNhb2FJK3oybmk0YllOSzRlclBqU0VGak1rWW9uSjN4?=
 =?utf-8?B?SE9jQVFLVGliS2FvNjBTWFZKUzh5VmJWNlkraHBpaUZ3bnR4R0xpa2dEdlhW?=
 =?utf-8?B?TFhuVzRXQnZXWC9hcGZBWi9ISEhXbFNIeCtHUnQ1b01yWmRObmowTlFVSjUx?=
 =?utf-8?B?WUM2cEx1a20xTnFhSXRyb2JVRkRtVGx3a1dvMkVZRGQ4MUFFUmJiU3hrLy9v?=
 =?utf-8?B?UXJVeTdUck41U3kvbXEvbHdjcW1MVGl1QnRGODFBY3JEOVBXYzdJTExHOGdR?=
 =?utf-8?B?ZUVjNVRCUUUyeXdEUWEzVnAzMzBmVW5HSlVBaFZWMk5nK05yblhlUGVNMXpN?=
 =?utf-8?B?TEFjZit6K2V6Z1ZFSk1maG9VcllsSk5wT3VRcmlzMkJQcXh3ZWdhbS85RVhz?=
 =?utf-8?B?Y09idTlXamlIN3ArK2t2dXRCSGZEaGR3V0tnK0FCRkhHZFRrckZNc1ZHUXVn?=
 =?utf-8?B?N3VPNUJndXM0SGVHWVlteEk4SGJqZUZDS3pxWWFXcWVHU2pLRm1mTG1SdGMy?=
 =?utf-8?B?RGl5QkhCRytxQkpEMjdmb3d5elpFVCtNZGxNaTNaYStrV2JUYUJtTVZjbHpq?=
 =?utf-8?B?STNtQ2NsRDVQM1VaMTBsd3E4WEhrbzNLMjVqaGJpNHoyQVNSVGlTRkFodDZF?=
 =?utf-8?B?ZFA3VERmcHFJUkNHMGF5a3dtb1lwZlZmSG00bXFWeVVxTS8yUUM3NjJuVHY2?=
 =?utf-8?B?eXYrY0dGR2NSUVFheVhudTQ1Um01RmdPSjV0SEpWa2tiYjIzWElRdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aadc8aef-0b44-48cc-96db-08de48be9a7a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 22:47:40.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xqw27NHZsn6DlUAcicxCL4HVKWZEe8mG5VVsH1g3PFqXZjaYYLUMA7GTFMgnNaoWQdzUpKQ+ZzRz9BFJmaPr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413
Message-ID-Hash: SUM6I3EWJQY5JAZBEXD7VYUTNZCK7TUV
X-Message-ID-Hash: SUM6I3EWJQY5JAZBEXD7VYUTNZCK7TUV
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SUM6I3EWJQY5JAZBEXD7VYUTNZCK7TUV/>
Archived-At: 
 <https://lore.freedesktop.org/ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/31/25 2:33 PM, Timur Tabi wrote:
> On Wed, 2025-12-31 at 13:47 -0800, John Hubbard wrote:
>> The builder-pattern setters (self -> Self) enabled method chaining like:
>>
>>     reg.set_foo(x).set_sec(y).write(bar);
>>
>> This made separate operations appear as a single expression, obscuring
>> that each setter is a distinct mutation. 
> 
> So you're concerned about the fact that the compiler is not merging the set_foo(x) and the
> set_sec(y) into a single read-modify-write?

No, I don't care about that aspect.

> 
>> These setters are infallible,
>> so the chaining provides no error-propagation benefit—it just obscures
>> what are simple, independent assignments.
>>
>> Change the bitfield!() macro to generate `&mut self` setters, so each
>> operation is a distinct statement:
>>
>>     reg.set_foo(x);
>>     reg.set_sec(y);
>>     reg.write(bar);
> 
> Are you sure about this?  It just seems like you're throwing out a neat little feature of Rust and
> replacing it with something that's very C-like.  This breaks compatible with all users of the regs
> macros.  Seems really disruptive for what seems to me like a cosmetic change.
> 

It's only a neat feature if it *does* something. In this case, it *looks*
like a neat Rust feature, but under the covers it really is just handing
around copies unnecessarily, when really, it *is* doing the C-like thing
in the end.

I object to the fake Rust-ness that's being done here. It's like putting
hubcabs on a car.

thanks,
-- 
John Hubbard

