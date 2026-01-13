Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E64ED15E77
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 01:01:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2409510E441;
	Tue, 13 Jan 2026 00:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I+NJGiDC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8BC6444CA2;
	Mon, 12 Jan 2026 23:52:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768261960;
 b=dbiLRflaHZ7i0INLGMXOUDNdr3LjUYjOk0sIIjpl49EBbE/LFNF9KqWY2/m5P8cZM6GKh
 Mbn94J1hhyHuO3t/1HbYfQ92X/KbUlrlBFtM3xQs6xy16nkDRrFTvDZKFY41obedw+AG5Cc
 DAEBYO/Hm4xrRVz7iZlLoprqb8t2fy6a+9ur3rh7dMf/4ejVvWpy9f1wUYUotX6hm8eBZP0
 B/4wUrL/d7bCzhWUBNvZBMGOOrx3+bs7bOEowN0NnXX/Sff3f+5asJYBAMWW7Ae7Q/JjioS
 5XsgIZ7f3szyfBzr+bsW4W1Oa27+FffvEJRJ2aiIqjg45Dd4vhy5+QgtIAjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768261960; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r8SBikyBsyk1zbVshaKHeU7TdvpAjdjsn8YTUIe6T14=;
 b=O5cJ9D82kc3u4Oinkzr6uWMClG7g+o9Hi4TOjbNG8AfZfrU9bKMptHoEvAxMNNIHWTAuw
 wpJgHm9Z7t+ajcUTOrgC2on1ziQhY6T5RdUP++Nl7PXDRpPrDe1xeEbJjG1VGdR0Vazb8H5
 niiMM26VcWZ0ecLclL3miKMp/4VSgxKN0gtCuPJKMyIPjN7iik3ykWoJllQ3XbhEBMOtRdq
 fWx+F6gmyNsCN8v4PYhYoz40ADVO04endkMWDczBcVwrSm1W607JfjlGcpszCw+6Bc2DVSW
 8HnRxzZLf/0I66e/1AZNcVqRQqF21ymbpxy5BKXv8SRhEI9ikjju8Gg+BJtw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AAF2D44C7F
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:52:37 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01BEC10E43F
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 00:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqPLnM2f4SkxXBYDekRMUVCrY3xLICWD9WOqh1PmE+T7mYOxUPv2+4KjPqkZs4HmZJECbzp8xgWngQ1VPdHdX6bXSmoKmVnxBqwzHSxaDNJt9q2tyar+0/Vbee2etLmZmSM4qgauRngvuICCYPnyQJcyA2b3EWW0IsseX7tfLOY9nZ+xy1/Hp8MZvF/DEeK8vy9JmDuTTRCJHoyTx59atzscN6cqaSmtaXjjjCvhj5GPeKjnxry+F9Ercps2J+fRAeMc38lz5ax1kOIVDW4cs0OEK+hOGCUlDm5dPwxWXpytqhJMD53aPWmAIdDkzsqV42KYPvPCr02V3DV92zgBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8SBikyBsyk1zbVshaKHeU7TdvpAjdjsn8YTUIe6T14=;
 b=M9pMQYUInZcj0pXX9jAqvrtC2/uEkqSZz+JbSSeCeGb104hvXjzzsejgB5IoEuvdmCzsbd0UI85t9t9eFhg3Y4yFDPKHpirdEpk5jKxRAO1qaRe7SS+/BggKLUOx2a2By6QcNg6vCY9BMojSZWhlFWRGLoluhpePjN4HQZ581hU6vp35zMU7R8b/ObkW7WALB2ouS2Lhx25Q+bCR2owJ9m9OgSkoJ8WGr4hOh6GXB68sjiIHBvgHK2aQyJAFMV7V0RyUS4MjpwrRRaaWv/zXm2LpqXSoYPfOb5aHTdFvA7JUmDWajmVptmBfwmgPCk4nBZFFwJbeWVJRTPATSEYNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8SBikyBsyk1zbVshaKHeU7TdvpAjdjsn8YTUIe6T14=;
 b=I+NJGiDCgpCyyaup8gn//HdW56runfJ0LT5IAxZ4CvMxy+1B+zTjNEO9oqaPdX03Sirtqu/7m43IrEktyZBtiQ+/rFKGIrh9glwEGoT0gprWSN+27aY1FQ/UTFmic+Jo2h4YHYg+JGbmdgR6CS/mvdDf4br9cZN9oBLiIaSUr4qA2oZgwtGVUqFoNN4++7Jc2Fye4r83K3Fedmp2pZOHk6NgaH+9/TKz6PrUjaIfyhlXPb2WqBlC+8Hz4uyS5x4B/Qpe/y3IwQqC6cGhdEOV9iLC7kueWn1qcFsSwtzVE7DxmAqjBx6D0cp9xI5D5UvleZpJ17Gc4CGoFmXlFXV89g==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB7296.namprd12.prod.outlook.com (2603:10b6:806:2ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 00:01:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 00:01:00 +0000
Message-ID: <0fcef086-c309-4789-9ab7-a3c4581da6b7@nvidia.com>
Date: Mon, 12 Jan 2026 19:00:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-10-ttabi@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260103045934.64521-10-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5fa9ae-1422-4144-9e60-08de5236d594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0l5dHBPR0IvQkRDa2dEU3hFaDFOODZSV3dzWDRkeGowVmxzSCszTklTTUVx?=
 =?utf-8?B?RTdsMlhDQ25wdnZQY0lsbEtzeWlOL2t4ZlJrSnp1dVUrTWU3L0NJKzJqRzRh?=
 =?utf-8?B?WUkyWE1HckYwWnROeWtYN0xQM0E3SHBxM215azlycDRPTUlzckM1NHJITklP?=
 =?utf-8?B?Q0hFTElTcmQ0QXl0eHZQSGZDbDYzVXZ6OEVaV2dOUTBmTTlHeHMwVUhSWm1Y?=
 =?utf-8?B?SXVhY2FxWUc0WGNTR29YSWUxUEltQkwzM2NzV2YyMWV2a0hUZjJ1czc4UTZP?=
 =?utf-8?B?b20zcUt0dzlMVmNiSHFzaU5MVmV2WkZhaW9DdHAwbVErNm9aeGZKa2VQVzFT?=
 =?utf-8?B?LzZCRzlVRFNmQ2liZ29ST3RVNDIzMWVIWEtLaEtCZnlhd0ZsVG1OWWlzT0l4?=
 =?utf-8?B?MHl2U2g0TVlXQklJcytEdnVOUHpOQjBLL1lUQk1nVDg0QUlBZWZhenpOR2Zz?=
 =?utf-8?B?b3hqTzJDUlBueUoxTXBBRUpUWFFoV1F2NDVDVWlCVExrM21aTVg2ME9jREZV?=
 =?utf-8?B?UTkyRU94UHlhUHpvdnhjcEQ3VGFXdGk2d3gyWXR2cVJGam9GeERPYTdSUENy?=
 =?utf-8?B?eElka3pQN0VoNWw3N3IrY1RBT2Q1TURSMjM3TmYwUjBZNlRCT2pMN29ENDg5?=
 =?utf-8?B?bS9Rd1h2cGRITzlYMWJDWUNDS2RLdGNQK3F0U2RLMzh5eExWV1N0eE5OQ2Y0?=
 =?utf-8?B?RGxhZS9PU2NvaWFVdzdNOGV5Y0NyeEdaU2gyQjBHcFFHQnVzUXNZM2FQTGFC?=
 =?utf-8?B?MEpWcDdCZVdVM0VHVXl2RlhaT3c1Y3pIWHFLWXhUMW81RXIydFNpK2hxYm4y?=
 =?utf-8?B?VmgxTEsvYVZTdVNOUVh2UVpRUk45dDRIb093WjhoWWZDck5GUVVCYTEvL1hR?=
 =?utf-8?B?ZmIvU1lJYitXWHdNdDdheXN1ZHNvbVpiZUc0NXlGNVZXdm5lbmUyWk1QaFRE?=
 =?utf-8?B?d01VQXk2RTVNdCtPS0JTQU03aEo3bzFSRXBKN2tjZGxSNFpkdm02NkRUNFht?=
 =?utf-8?B?ellpcHpmbXNPK1ZJV3BPeUFDRCs5d0JsYWNNM253S2Nhdyt5YmlGQ3J1N0dN?=
 =?utf-8?B?ajRyOW1vWGE4c0ZTekZadjhaYm11bW9tREFmT2c1NmRxMll6M2ExRWE5Q3Jp?=
 =?utf-8?B?Vldpa212a0pydjM0eHpzVlVva2o2MkJkN0o4YitnQVhLZCs3SlFYTjdXdFJ5?=
 =?utf-8?B?YWlxZ0p5MWJBS3BrWVlveW5HYWZoYUpoWXVIbG9EZ0hzNC8wNjBzSUYwdlJE?=
 =?utf-8?B?NjNBemlQWjVXOWVnRnlCZyt3RlNzdzYyQ3lsV1daaTV2akVPejBFZ1pXRFp1?=
 =?utf-8?B?amNBUTdpVnk2UTkvRmFQbTNLN25zSkx2THE4REVkQ09UWlVKMjdmaUVSS2Fz?=
 =?utf-8?B?Q0p1bmNkV1hqcFFsY0crWmo2Wm9uQ0pNZHNJbnpzcFRWcnNzaThnYTNLem9W?=
 =?utf-8?B?ZnJvUzduQnJMRW1RejU1MTQ4dVI0VWlvNWVRbGJhQ0t3WFAyWm1kSS8xYUpO?=
 =?utf-8?B?dytrcXZRKzdJbTBnSjNDSFY5eUYwS0M1cGJKTWtIRk1RUWdQbUNvZG1yY3Mv?=
 =?utf-8?B?dVFIZWhZMlJZeGJWWjlCeGJhRElNUElLV2h4a2YwUmkwelAwb1hRTVoxems2?=
 =?utf-8?B?QkErdFlWcGNuUm9CZ0VYL0hGZit4bzNoUCtLeUdvcDN6TUtyLzliOTNUNXk3?=
 =?utf-8?B?bUVlbk83eFVuZDhST1BkeGhJZnVQVkRDNGFvVjlxK2dHV2pMVisyZmNnSW9N?=
 =?utf-8?B?MldzdzNSZlhwZGJjWUlsR1d6aVVhSzliMTlWVmxMdjJ5TjY3V1p6ODNNbnhq?=
 =?utf-8?B?TjhaVFRyM3RjUWtwaTFLd1FyVTQzRWpURlFTOUJ6dUxwYlYvRkFUbno5RTMy?=
 =?utf-8?B?QWR0T1psUzRuS1B5cGczN0QyT3luNVhPNndkOEdDdStPeUltbTl6ZFJyT3FS?=
 =?utf-8?Q?AaQn+IGicEr6Ej6q6P1qWHfY5WTM3Rlv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?REtKTnRrYUNmUDZ6OENlNEp1SWN4d2xqOUloWGlMRWI1R1lja0RKNTVVUTFn?=
 =?utf-8?B?VVNUYmdjNEswNzMxZlNNZ1orRGJkMjk0N01SdFUvV1AzbFA5OUJqQ0F3RGNo?=
 =?utf-8?B?a0g2Ui9NWWN1amFiMDlEL00yaTcvSVVlN0RqVGFQc1QzWU4yQ3FNUFVGV3Iz?=
 =?utf-8?B?a0QxYmE1aE5OWFR2TVhCMzAzUzFEV3M3N09DVi9IZWExUzRVdWdSQjBwaHlI?=
 =?utf-8?B?Skw5U1JPb0wyUTgwM3ptQmt0dmxNTFp3VCt3MDBic3VwdTNhcmQ5YmZtWWhQ?=
 =?utf-8?B?b1hhK3RCd0t4d0JKYVJ1TWdTSlNSYlNJUmRqdUFpNjFhdVZjWC9ScFVxeGJw?=
 =?utf-8?B?YmFndUJmWlUwOG0yNllWTWZTUUdqakwwUjRXSm5ielY0cGw1d1Jad01qZlNi?=
 =?utf-8?B?NGJqbXdYRWdoOUtDZGxsb0tLQlRDcmdVVVNQWjU2V2ZPUFR0dnFzaHlDN3dm?=
 =?utf-8?B?L3l6Ny9rUVVQZTBYQy9RbVNPSFArRkdrK3REVW1VdnNqK1BKakNEZ0M5U1ZB?=
 =?utf-8?B?OCtnLytxK28zZlpaN0g2amQxVEtMYjlBdGZYdDRoQmF3bHh6NDZ3bGlvOXBI?=
 =?utf-8?B?UUtveEVjS1IzcHhqK3RrR3VYQlRBUlpINjdiLzRQUlVVWlJHdzh5S0FlaDRH?=
 =?utf-8?B?UE9VKzZ0VFV0Vk5DSXU5WXBLS250d3ZSUFh2Q0JVOE5OQncxMjJlMDJGOGFk?=
 =?utf-8?B?enpiNVRRc25FWks1TnRTVGlYLzVBdjE2bFZndFRSbEFxL2RmT2MzM1A0eldW?=
 =?utf-8?B?K1lPa29nbm41RzVXRUkwVHc4bFZDNnYzTkFneWdqNDdSTkhFT2hCc0ROanNx?=
 =?utf-8?B?NHA0ekdWN0xDUDY0Y3lRZ3RBQW5GNkxuRkpPSE1HbGJFVHZvTmpwczNVSzJy?=
 =?utf-8?B?QVU1SGN2czVQdlUyTXp0QnovN0ljTU9jOFNuN05LZnRiZnhJRHNGSXVjL1ZX?=
 =?utf-8?B?QythTTVTNXMzM3FkdDhxQ2dwODJ4eldxYnAwVWpiZ3FqU1pTelVWNUxOYXFE?=
 =?utf-8?B?YVRwa1NWS3RBLzEzbWtPRTNhMFlqcE4zU0ZSZHhybHB2UWF3WDJ1Tnpna0NT?=
 =?utf-8?B?QjFVRVRVeHU2M3YwQ3g1cnI5UGZ1a0hiL0JVS1FEeDgrTWJFSnd1dC9KYmxO?=
 =?utf-8?B?ODVnY0ppdkg4MDlaMzdVcy9qOVUvNC84bTlBQjNLaCtqWmVlbFVyNlNNZWY5?=
 =?utf-8?B?ZWwxd1Y4N05NbG0rWlZ6bmU3M1BVTk9YQjZXQmlsS1Z5b1JOR1BGS0MzUXdU?=
 =?utf-8?B?ei95T0hsS0RrRk00Y3JLdUc4ZmVkVUJxRnJkVkE1N0dJcU45Wk5ab2JKdG10?=
 =?utf-8?B?Z0lmNHY1ODYwZzJvcnFVdnhwOWhqVE5nQ0llNng2VFVuVXlSVEtZdlBBYytK?=
 =?utf-8?B?TURpcjFSUlFNaVJWbWZ1OFBXV0ZqSkdscTdKWGZlZTVtb29QSmNjdENBRnJV?=
 =?utf-8?B?TmQ5K2lhNUxpU2p4SFFXUnprYXZUdEJSUzZCdmxabWc2NWhWZnZyd1ArS0pv?=
 =?utf-8?B?U1k4MTdvUXgyTmRmdVFPZktOaHRpb2J5YlZFRDRYYVRVRjVqTFlEQ3Q1b0xU?=
 =?utf-8?B?RXlKcWFKSGtvREEvZ0tNV1BDWUpyTzhMZk50UzRjTENLWFVnWkUzc2Jmb05m?=
 =?utf-8?B?Q1Z3WlRXYzRIemovaE94RVRvWE0vL3E3TmlWSEMyNW1ZRm9FcVV3SlBQT09s?=
 =?utf-8?B?Vk9zNGxSQmlrdFRkejdDdFNCOHBmd1JBTzN1OFFJREFCWWpQN2x3ZnZ5dFpk?=
 =?utf-8?B?eXNiZFA3Nmg2MG9SaDZIdFFqNkIwYXFWaHhuaFJmclB4REFLTFI1aDlxY0JG?=
 =?utf-8?B?cjNKcmdrSmxSdzFacEtvWVdoKzU0VFJaYVdnamFvR3FvZlE0NHJodng1MkVo?=
 =?utf-8?B?MnczaUpYaDNTeFNjQkt1TS8yVXBYMzd1dnhxZVdXZlFiMlEzdDM0UWs5WEFN?=
 =?utf-8?B?MzhKaTBuSDBlRmpqbzRReHhMcWpJOE40L1pNYmR0WjhPc3pOdjBiS2FiVXp3?=
 =?utf-8?B?a2lKUWZCVkdCb25CM0pmMjJ0bDJDZDUrYnk1aGgvS0x5ak9lWnZZYkl1eTZP?=
 =?utf-8?B?Q1NTYzVueTZ5MEdDYlNlMWtzTkE3d2VUL2I2NW1DbEYyU0Vab1hFd0p2dEUr?=
 =?utf-8?B?Y09xYlFnV3ZYSk5WK3ZDeWNXbG9WZTR3QVVsQjk2VlBPTStJR2NWZzRIR2lY?=
 =?utf-8?B?WjBjbmpmbFgwaGQ1djV6dnU2dk5LR2psMTJWZE1INS9UcUpMaWU3OFVUam9S?=
 =?utf-8?B?cVgvSFdYWWkrWHlYNEZKUXRSRUw3eWs0QklmRFROVWZVeVdlbFloODQwUHNQ?=
 =?utf-8?B?VTI5RmhDd0pqMVg1OFBKMVNaa2tiSHU3MFY4V2E1WGIxZisvZ2VWUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c5fa9ae-1422-4144-9e60-08de5236d594
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 00:00:59.9562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JKAvahlv09z+DZSAtVSum/JwSTQk9uLlrNqE1bCP+Os56YWQp1jatzipySOVbmBnOYpi/PTfbYdVy2ISsXqDiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7296
Message-ID-Hash: LVSQYLMP4VQ5QEMW25VJWEJHOAWRDP76
X-Message-ID-Hash: LVSQYLMP4VQ5QEMW25VJWEJHOAWRDP76
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LVSQYLMP4VQ5QEMW25VJWEJHOAWRDP76/>
Archived-At: 
 <https://lore.freedesktop.org/0fcef086-c309-4789-9ab7-a3c4581da6b7@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 1/2/2026 11:59 PM, Timur Tabi wrote:
>  
>      fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> -        // Only used on Turing and GA100, so return None for now
> -        None
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) => Some(FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_phys_base,
> +                len: v2.imem_load_size - v2.imem_sec_size,

Since this subtraction's values comes from fw, it would be good to use
checked_sub(). Otherwise, this could:

1. blow up if overflow checking is enabled.
2. len can underflow and be entirely plausible but incorrect, causing
unpredictable failures.

I am fixing other similar existing issues in nova-core as well but since this
patch is in flight, it'd be great to fix it in the next posting (it sounds like
there will be a next posting).

thanks,

 - Joel

