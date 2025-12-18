Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD28CCBE2D
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 13:59:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A60B10E420;
	Thu, 18 Dec 2025 12:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jms0xou5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 83D7945872;
	Thu, 18 Dec 2025 12:52:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766062327;
 b=vaMBX7qB6dRk8Fxnlyhgqpq5thDOXdtVFReNFB4fWPrlHDg7qhTV7pGv13YX1aaUL+83L
 9mhGWcucr8U1i38I8Udv3s5pc3U4y3ssaaaqo8QaizFEhlbfg54H/9NLJLk7HKmNDnhw6C4
 SQ9YQtI2LcqGqVq1/4uK5of/fSbt8T9m1YoYtVBgPtjxbjCza8NNKb+eliAaCVTpvKFHG7P
 ABd5pznhfPZuJxOtjkjVy1ZLQYh+F5AAoiApIbv7h6DmW31FL89enLgX+tAub25fzeB1W4b
 HLlw2CVCca0fo5IDT56Auua14odGREsex0RjySnX4tc1cbDUxW1l5eNiMDVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766062327; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DT4YnZBRtgYw4icXxqt4rj8x249+2wdMDhRHzQv9G2s=;
 b=q+bIa1kWJWyOUdVkGf0GIaCzYXDnYGcLM8TvH8hQQMTDLSAOKroQ1BPYefWq1fI3auy31
 S/ZczfCYAtst84JjGQjETBNR+yt7ssRit7Nc7iYU0XbI+W+3BC09q433+zGqxXJZcNPgas0
 RoO3Hkbp2/kbxttVP62JLhXFaglskJGS4igfe02o4Z04dNNeq0Skuav/gkvwaSCIOS7cqaF
 tuSSB1UlffsWk7+gKDTvQzgCjqxbKH+KHafLZmg+gwegZpyMlsmF7s6q5CF8TMyJu/+pble
 oUhfWT2u0IOrPVGsZ/K1HA004fwae75107ZG5DSZPoPBfq9zXdFBzl5yyAmA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 02512457B5
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 12:52:05 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFB510E401
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 12:59:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIj1qhYvFH7wxyZ/2eZiPuvgQ0OJHCqizktGkUvMa5qZuLrCjPuH4czQwvj/PKJwfH2L8aquuhjn/cvmhvD5Os8IyC24UUdDgn8kTQCZnZtT+/BPgZhMTial7fOkGwHnTt99v49ToUXqYRYiE+wBvIY7l3aazh1HqEFgieXvuVD3zQUh/uVBF1bRo+FFMuFRmrM4Bez/xzmOdCS+oqyVNKwBFdOtbP86Ry3RxdrLauSVha3tfv/SzjyjeP7eZKWJpGBEaz4g311VpVaZUYnhE7a3FVIadywZd/441Es9PUM6ov2PJyrCsEu050ABps5J67qwoRFyFl+MwhcsFA01/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT4YnZBRtgYw4icXxqt4rj8x249+2wdMDhRHzQv9G2s=;
 b=tSL+gebu+imz0Xa7pfNCCO+4WcomIEGj5Cqrto5XAvh4uhEL07ugy6dS2ybwEmfXjPWD1tXqSWWxTslRbDym0gMCiattk6H7v32Ij755pdG2XCTeCXVM2Ei2CIzOFgHoHLjG2R/iS7K561cWulQflQugdB5A7IanLDt5aA9OOzJ0HjLiZMKUeegRCe8lkQ2yn4Wu64t2ZuruyJ4OMNkF9Haom+2EY8Fu7K3oe7xHNJAvOetIctWf8NYI3ep/JmX3AO0BBYcHPTljW7vmtNUA39/1bBFOUr7I6yjf/r9CSylSBy5nrvAuU85WDX+tmrJoOuQcqP3GAFxuH5ISY/7AyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT4YnZBRtgYw4icXxqt4rj8x249+2wdMDhRHzQv9G2s=;
 b=jms0xou5tkQWfPHii3JMU5wHMYgquDNkDDGy2wrxNBYi7F3gvzZRxRkUkV/SUCBSIrXAo2viNlfqvid8VZ4jM/kMCpITJzWElIDZXFZVXz0/7LZX+SehuJVnkWoPjIrdEJxBMI3tyULYyQ53+hrbu4M+5GTMU+DQHbD5sgEfOY9Wj22D8P/FPxWEJPfrMeRQjQf8Tn5qmjkB0skE42wa1UyTur68PemFFJqcQf/sP33+j7QAua+LGx+OrINGhFRx4bFLXmWY2Vva0XhpBFKDapS5wcfrw0/Gq++qMQBocmJpck7P2PMuBoZJ97dD1HQjY6bpoWk0cT8zC9vxqJbiLA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 12:59:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 12:59:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 21:59:25 +0900
Message-Id: <DF1D026W0BQ9.1DUWS5LKR09TG@nvidia.com>
Subject: Re: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-12-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-12-ttabi@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c180bc8-c55b-4471-4e0a-08de3e354792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjlqTUNtaGxjU2k0eEprUVRrWlBZMzVDUGdNV0xPSW9ZeFBpVVlpSTh5WGk0?=
 =?utf-8?B?NTMyVWVyOXEweUVNT2UrNzhtUVpLUHZ1WXdzbUI4aE1qTUxaamtDaHorV09a?=
 =?utf-8?B?SkVqSFZ4UVoyWjRHSGRXYXNkbm1NYmUxOWh3MzRjd0RXc24yWkpxYmhYWFRL?=
 =?utf-8?B?ZlJVWU1zT09FMUVrQjgrcm9aMExRclpYK0p5SlJldG5ZemFIQWlyeVhOR2Y0?=
 =?utf-8?B?eXVNTlJ6dC9WdmNkWFVEc0NlWHc3QUFZRTRocUU4RFJYTTlVbWpxZVNtY3p1?=
 =?utf-8?B?UFNwZG1wbXp0dEVDVmpMelVTUW9qS29zQnhablV5di9NZHJsaXBYMnN3Z1Jt?=
 =?utf-8?B?VTJ5QlQzMkUxbkRlK21DL2t5UHRNUlZhSW9icjd3bVVDSy9BSkdCQUdMQXhU?=
 =?utf-8?B?VFhhcFBkYW5ncnl2M3BLZGJmOXNqd3RRRXhzQk5ULzlkUGdRblcwd3l0TmE2?=
 =?utf-8?B?QnY5SjE5b25ML3RJMlZ4S005bllQcDcwVkgwNFdyVU16anNVVXl6emNiaGdD?=
 =?utf-8?B?YTZiNjZra2o1c0x1THArcG04UFk2RFJST2UxSVB4TUkyZUNpLzV5d1pJRjRo?=
 =?utf-8?B?akQxZml2eVdNc1pkRm9mTm9xYnIyYzd1Ly9EbkxkYjZYcGk1SUF3dVlBMVpF?=
 =?utf-8?B?dmtZNzgzQzlBRzdvUDdEbVpBbUFWVzhxdWhNSm1oTmcxaWVWd1FndFNEeEpC?=
 =?utf-8?B?bVp6M3hPOHhrNzVOaU4rZVVGTjZRU0RvMVFJa21DOCtIaFFscUtWU3FJNWZ0?=
 =?utf-8?B?NUtvMkJvVzNieDFsbzArRHNBTWtqSjJjYWZuM2lrUEo3OE9UOWhPT1hlOW5H?=
 =?utf-8?B?eHQ3eXp3M0FyTjRxMlJYQTV6OFB5T05udldVK3dZOTNIN05BQU02eFc2b2tT?=
 =?utf-8?B?MTNGWFdybmhhZHAwNk1yNGlUY0JXbzVlOUlxSnN0d2ZFdHU3ZElqd0hYeVNM?=
 =?utf-8?B?d0I4SExEZTdCS0dodXdXcVVFRzNEUnZFTHpTd05jd1BNNnVtOTFXN0hka0VP?=
 =?utf-8?B?L0RGcTlLUTMwZitSVEV4OFhzdHEvUEJXa0lseTBsUWRUN21kZ3U1RmVZVEdZ?=
 =?utf-8?B?SHBWZWF4RHQrNG9TeXZtTzZ0d2pJUmNoVzh1QlVmRUI2blZCZUtPWCtzVTN6?=
 =?utf-8?B?bXlhZmdMNDhZMjBQT09lWng4bW1SUEFPQjJFdUo2VktkQkxNbEhLd3RXQjho?=
 =?utf-8?B?TmVzWXVONzVvTHFoRUlFalpDTURYMk1jQVZ4ZFpEL3Y2aDdlOERra2c1WU1O?=
 =?utf-8?B?R0xRQUk1VGtZMkFxK1NNdnY2b0VjUW9KYURUd1VPSGJuRVNYVmFaam1hNTdC?=
 =?utf-8?B?S3ZuWk9kMmFtakJBOVhQWWNJTVorYlJSOXU5UUZrdmRSZk5ucmpOL3psdTNZ?=
 =?utf-8?B?OURaUThkM0FmSy9IWGRucGRheEtkL1pTblowMkZNQVNWR2NKZ3pUUTE1emNE?=
 =?utf-8?B?T0hJd29CY3V5NnZUaDdiYkFvN0FaYXVqWkU2d0FVNEMzSjFJSDM3OEoreFp2?=
 =?utf-8?B?Wmw5YmRIdWg2NVR5dXRSZXpNZkdTT21oQW5VSlIrbzlUVGVzdlRVSGhRaStQ?=
 =?utf-8?B?Ylpad0lyYmc5ckZQamlkZGZRekRRYWVFQVdBQmw2a1BSQ0oyaGp2VlN0NFhT?=
 =?utf-8?B?dVVRZ1UwT0hqcFVydnVYSlpLQU0xcnhpZnFVRUZ3czBqbEluY2k1WGdyN0RP?=
 =?utf-8?B?SVI0a2VPbG1ESGMrTFVZT0h3SlhNODVqOXVJaUlIdUZhS3hzWlI1ZHdPSW1Q?=
 =?utf-8?B?YXRJVUQvQVVOQ3c5OXZvWnE1WkZHWTIvUlJ3TVY2MFBnd0p5WG9OZmlDajU4?=
 =?utf-8?B?UnFXdUV3dElrSi9lWS9teGIvc2c0SDhoVzh6My8vaVM1T3ZhSWh1RlM1SGUr?=
 =?utf-8?B?aXJybWZOYlNyMHdHSUVYRVAvWEhqR0ZTeTllNCtuZUkzRjd3UllOMVl0OUZF?=
 =?utf-8?Q?AVV/2lTmwUSVdr5YuSVd5DD2HFW84Tjm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3J0MXJ3T29jbmRabUt2TWpEdVdQYmxTRWtVR2hvTHBiaXEvMjVSWEcrcmhs?=
 =?utf-8?B?Z3lUQXc5c1NHV2JvT0Fkak5HclFnK1YwVFpGUG5RZXExYlN6d25zSG9kVUJV?=
 =?utf-8?B?c2E1QjN3UWgxVkNhUmJKNWVCY25TdFpTejYwRmVYczgzTVM3djgvWjVwbVMz?=
 =?utf-8?B?VWh6MXh0d2c2aU5wSnA0cGxIM2JtS2l6YmVQd3pXYTR3N0JqT1NQMU5WNUVB?=
 =?utf-8?B?YStPOEIzd1M2UnVwUFRzcTFRWXdTVlBwbzRBRHAzWGt1ckkyRkxtektGR090?=
 =?utf-8?B?WXJCQ2h4Z0dCUTY2U29pTDRDS21GV0xaL3Q5Nk90emVPbmVUYXREaW5Eajh5?=
 =?utf-8?B?OVJlVkJadXozSzE4c0x6akJCbmZGKzlSQlVFMDJVcnMwVmdpMGVnQy9CTytu?=
 =?utf-8?B?TnNKYllYSzkxVGY3bnM3T0w4SndmZVl5Qkw4aTBPU3pXNTNLd00rcVRMUmNh?=
 =?utf-8?B?Q3ZhZTM1ZUZLSWdyQ0V4SXJLNkoyMW9KeHpVNUtyVXdtNlhhbHh6RThJa2dT?=
 =?utf-8?B?M1ZreXBsclh5allBQzdna2xqM25YZjRTelg3dzBjVGU3Y1czWmJraTVSUHRr?=
 =?utf-8?B?bklITmRBOG54SHFGOGUvaXI1bmhHa21jTU9tZFJtbk9tejlDTVNWdkxrb1dM?=
 =?utf-8?B?L2JGeWRaN3E0eWw1STU5NHBJREkwUUpSekZZVFZnNUJ0TW5hdWhEZXlKR2Vo?=
 =?utf-8?B?d2FvcHpwN2Z1ZG1ISEFZbkpsanRiU3BKMUtZTHBBR2ttM0ZUdC9DWTRaSkRY?=
 =?utf-8?B?bzRud3E5ZkNqeWdZaURIR1NmU1lyeUlRaDhJQUZieXc3a0dySVFQS2UwWWZs?=
 =?utf-8?B?Sm1Ecys3elp3cS9HTWZETE1nY0xKb1RwcjRIcFo1djB2WWUyOVRNNFVocnRv?=
 =?utf-8?B?eFJlWVRsZ2VNaDI0TEViWUMvMlptUm5jYUJNTHJiR28vQkI2SEFyYmVkcURi?=
 =?utf-8?B?K3FNREk5bU5tQ1UxN1Qxc29IdURiRmdQcXU2b3ZhbEIwMTh1aklJdGEzZGxH?=
 =?utf-8?B?aFM3TDN1d3ZGQVE1UVNEUDJORUFqTEx5THVreU9ta2pweGErTjdlWkZLcnpT?=
 =?utf-8?B?Y3I4VUN2OTNxN1JDcVp6TW1kSmZadERqU3dLSzFMbnlJZ1UxU1ErNmc0VW9s?=
 =?utf-8?B?TnFjVlp1OU9PMkszcDFINHlNQmFnQTl5Q0hVb3AyU3ZLYlU3ZWd2bHRIRkc5?=
 =?utf-8?B?MTRNR0ZoU0xuTmRjVVJVS2ZkaGtGcU5CNTYrWmtBVVJEWDZ6TGdWM21Oa1RT?=
 =?utf-8?B?dms2eG5kRVg5cUxTblRoam9iRm9qdm0vVXJXaVVSQU9CUVFxOWh5OS82MHJ4?=
 =?utf-8?B?V20xZXF6dndYYitrdmdueTQrcGFKWmU2dE1jcUxDTzdRTTB3aVJuOVdwMisw?=
 =?utf-8?B?TTRrcVVaRm1ySHErdklUSGR6dkdLNVAxS2taUnR6NmtTMXFIdW1PYzVoL3VK?=
 =?utf-8?B?VDRDdkREaTgwZkNVQUliWlNURVpZbTE5cXB5MjU5VXlYV2ZSWXpnWnlOU2pr?=
 =?utf-8?B?MjZmcWdFQ3lmODBVQUJ6S082QXlsUlY1VEl0ck1XUEhWRHBoTFlwb1hsa25J?=
 =?utf-8?B?RzkvSnZCcjR2RW9aK3dRV0hxQjdBRmZxdTlNQmNLcUtDVW9WU3YzQjNBUG44?=
 =?utf-8?B?T3owTkNiQTZvaUU5cmowdk83QjhlM3lIKzBhcWtaMThqVUZreHZDSHE4Q0Jv?=
 =?utf-8?B?OUJ2SDQwWkwzaitMQ09NenVMaHVna284bm11bVFtejNOZUNWMnhTZ2JJTVRO?=
 =?utf-8?B?RExJZThmbzZMbHpTOThMM3U3dGFiNmJHMEQwS3J5aDhhZlp1N3RHVVFuNldh?=
 =?utf-8?B?RkVUK0NBblk2TG5OL0tHY1p0QWpxTHY0N3NRNFIrR2xLNU82OEFiOG0rd1Ft?=
 =?utf-8?B?RXBrWHp2ZG40ak8vaW1pRjNIeUd0OWZ6bVVHWGV5R3BIT1A3cUpPcm5oWHVy?=
 =?utf-8?B?ZW16blBpaDNYc2FJSkVzcnd3SFZiaEJ4dW1tQnVTSlpUVkd2ZkFLU2RKNzNI?=
 =?utf-8?B?Qk85TnMrbFZEdlp4NDFraWdhMWhCeEJEOGFYM05UeENoQ1ozUDB4eWlwU3V0?=
 =?utf-8?B?aUxmemVLdzZWNGFpVWM2ZWt5WWVGMExlbnVWTEpRUHJJd2o3eDJSYlAxa09F?=
 =?utf-8?B?SjUydWIwZC9xNjZkTEFiSkd3Rnorbm02S0hzNkxMM2I1QVhoVHlZTmVuemZG?=
 =?utf-8?Q?ycCAeIE3kqmty8ekd1h87bODPSlZxJ3wN8/NEZ6kHJLv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c180bc8-c55b-4471-4e0a-08de3e354792
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:59:30.1028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FuWXoZQQITEL9Gj+rtbfuPzKGF7JRCmT+2kZbNx43XauDMNKc5ZbtGjdC+DTzAz/YoWTuTPO+cPOBuY2BtfEaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
Message-ID-Hash: CWOWXXVLTCMG46KOK6KQ4ESRFRNCXFAQ
X-Message-ID-Hash: CWOWXXVLTCMG46KOK6KQ4ESRFRNCXFAQ
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CWOWXXVLTCMG46KOK6KQ4ESRFRNCXFAQ/>
Archived-At: 
 <https://lore.freedesktop.org/DF1D026W0BQ9.1DUWS5LKR09TG@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 12:29 PM JST, Timur Tabi wrote:
<snip>
> +    fn pio_wr<F: FalconFirmware<Target =3D E>>(
> +        &self,
> +        bar: &Bar0,
> +        fw: &F,
> +        target_mem: FalconMem,
> +        load_offsets: &FalconLoadTarget,
> +        port: u8,
> +        tag: u16,
> +    ) -> Result {
> +        let start =3D usize::from_safe_cast(load_offsets.src_start);
> +        let len =3D usize::from_safe_cast(load_offsets.len);
> +        let mem_base =3D u16::try_from(load_offsets.dst_start)?;
> +
> +        // SAFETY: as_slice() ensures that start+len is within range

That's not the safety concern - check the documentation for `as_slice`.
We need to ensure that there won't be any concurrent access to the DMA
object. Since we are the only user of it at this stage, that's a
guarantee we can indeed provide.

> +        let data =3D unsafe { fw.as_slice(start, len).map_err(|_| EINVAL=
)? };
> +
> +        self.pio_wr_bytes(bar, data, mem_base, target_mem, port, tag)
> +    }
> +
> +    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare t=
he falcon to run it.
> +    pub(crate) fn pio_load<F: FalconFirmware<Target =3D E>>(
> +        &self,
> +        bar: &Bar0,
> +        fw: &F,
> +        gbl: Option<&GenericBootloader>,
> +    ) -> Result {
> +        let imem_sec =3D fw.imem_sec_load_params();
> +        let imem_ns =3D fw.imem_ns_load_params().ok_or(EINVAL)?;
> +        let dmem =3D fw.dmem_load_params();
> +
> +        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
> +            .set_allow_phys_no_ctx(true)
> +            .write(bar, &E::ID);
> +
> +        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
> +
> +        // If the Generic Bootloader was passed, then use it to boot FRT=
S
> +        if let Some(gbl) =3D gbl {
> +            let dst_start =3D u16::try_from(0x10000 - gbl.desc.code_size=
)?;
> +            let data =3D &gbl.ucode[..usize::from_safe_cast(gbl.desc.cod=
e_size)];
> +            let tag =3D u16::try_from(gbl.desc.start_tag)?;
> +
> +            self.pio_wr_bytes(bar, data, dst_start, FalconMem::ImemNonSe=
cure, 0, tag)?;
> +
> +            // This structure tells the generic bootloader where to find=
 the FWSEC
> +            // image.
> +            let dmem_desc =3D BootloaderDmemDescV2 {
> +                reserved: [0; 4],
> +                signature: [0; 4],
> +                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
> +                code_dma_base: fw.dma_handle(),
> +                non_sec_code_off: imem_ns.dst_start,
> +                non_sec_code_size: imem_ns.len,
> +                sec_code_off: imem_sec.dst_start,
> +                sec_code_size: imem_sec.len,
> +                code_entry_point: 0,
> +                data_dma_base: fw.dma_handle() + u64::from(dmem.src_star=
t),
> +                data_size: dmem.len,
> +                argc: 0,
> +                argv: 0,
> +            };
> +
> +            regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 4, |v| {
> +                v.set_target(FalconFbifTarget::CoherentSysmem)
> +                    .set_mem_type(FalconFbifMemType::Physical)
> +            });
> +
> +            self.pio_wr_bytes(bar, dmem_desc.as_bytes(), 0, FalconMem::D=
mem, 0, 0)?;

So this `if` branch is really special-casing the generic bootloader. But
at the end of the day it just does these things:

- Write an `ImemNonSecure` section,
- Write an `Dmem` section,
- Program the `TRANSCFG` register so the bootloader can initiate the DMA
  transfer.

The first two steps can be expressed as a set of `FalconLoadTarget`s.
That way they can be handled by the non-generic-bootloader path, and we
can remove the `gbl` argument.

So `FwsecFirmware` could have an optional member that contains both the
generic bootloader and the `BootloaderDmemDescV2` corresponding to it.
If that optional member is `Some`, then it returns the `FalconLoadTarget`s
corresponding to the generic bootloader. Otherwise, it behaves as
before.

Interestingly there is no `ImemSecure` section to write so I guess we
will have to make `imem_sec_load_params` return an `Option` as well.

And `NV_PFALCON_FBIF_TRANSCFG` is always programmed as the worst thing
that can happen is that we don't use the DMA engine if there is no
generic bootloader.

> +        } else {
> +            self.pio_wr(
> +                bar,
> +                fw,
> +                FalconMem::ImemNonSecure,
> +                &imem_ns,
> +                0,
> +                u16::try_from(imem_ns.dst_start >> 8)?,
> +            )?;
> +            self.pio_wr(
> +                bar,
> +                fw,
> +                FalconMem::ImemSecure,
> +                &imem_sec,
> +                0,
> +                u16::try_from(imem_sec.dst_start >> 8)?,
> +            )?;
> +            self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0, 0)?;
> +        }
> +
> +        self.hal.program_brom(self, bar, &fw.brom_params())?;
> +
> +        // Set `BootVec` to start of non-secure code.
> +        regs::NV_PFALCON_FALCON_BOOTVEC::default()
> +            .set_value(fw.boot_addr())
> +            .write(bar, &E::ID);
> +
> +        Ok(())
> +    }
> +
>      /// Perform a DMA write according to `load_offsets` from `dma_handle=
` into the falcon's
>      /// `target_mem`.
>      ///
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 44897feb82a4..26efbf4f6760 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -31,7 +31,7 @@
>  pub(crate) const FIRMWARE_VERSION: &str =3D "570.144";
> =20
>  /// Requests the GPU firmware `name` suitable for `chipset`, with versio=
n `ver`.
> -fn request_firmware(
> +pub(crate) fn request_firmware(

There is no need to change the visibility of this function.

>      dev: &device::Device,
>      chipset: gpu::Chipset,
>      name: &str,
> @@ -321,7 +321,7 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, S=
igned> {
>  /// Header common to most firmware files.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> -struct BinHdr {
> +pub(crate) struct BinHdr {

Same for this type.

>      /// Magic number, must be `0x10de`.
>      bin_magic: u32,
>      /// Version of the header.
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-c=
ore/firmware/fwsec.rs
> index 1c1dcdacf5f5..4c26257bbfe0 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -40,12 +40,15 @@
>          FalconLoadTarget, //
>      },
>      firmware::{
> +        BinHdr,
>          FalconUCodeDesc,
>          FirmwareDmaObject,
>          FirmwareSignature,
>          Signed,
>          Unsigned, //
> +        FIRMWARE_VERSION,
>      },
> +    gpu::Chipset,
>      num::{
>          FromSafeCast,
>          IntoSafeCast, //
> @@ -213,6 +216,72 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsByt=
es>(
>      T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? =
}).ok_or(EINVAL)
>  }
> =20
> +/// Descriptor used by RM to figure out the requirements of the boot loa=
der.
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct BootloaderDesc {
> +    /// Starting tag of bootloader.
> +    pub start_tag: u32,
> +    /// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
> +    pub dmem_load_off: u32,
> +    /// Offset of code section in the image.
> +    pub code_off: u32,
> +    /// Size of code section in the image.
> +    pub code_size: u32,
> +    /// Offset of data section in the image.
> +    pub data_off: u32,
> +    /// Size of data section in the image.
> +    pub data_size: u32,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for BootloaderDesc {}
> +// SAFETY: This struct doesn't contain uninitialized bytes and doesn't h=
ave interior mutability.
> +unsafe impl AsBytes for BootloaderDesc {}

We only need to implement `FromBytes` for this type, `AsBytes` is not
needed.

> +
> +/// Structure used by the boot-loader to load the rest of the code.
> +///
> +/// This has to be filled by the GPU driver and copied into DMEM at offs=
et
> +/// [`BootloaderDesc.dmem_load_off`].
> +#[repr(C, packed)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct BootloaderDmemDescV2 {
> +    /// Reserved, should always be first element.
> +    pub reserved: [u32; 4],
> +    /// 16B signature for secure code, 0s if no secure code.
> +    pub signature: [u32; 4],
> +    /// DMA context used by the bootloader while loading code/data.
> +    pub ctx_dma: u32,
> +    /// 256B-aligned physical FB address where code is located.
> +    pub code_dma_base: u64,
> +    /// Offset from `code_dma_base` where the non-secure code is located=
 (must be multiple of 256).
> +    pub non_sec_code_off: u32,
> +    /// Size of the non-secure code part.
> +    pub non_sec_code_size: u32,
> +    /// Offset from `code_dma_base` where the secure code is located (mu=
st be multiple of 256).
> +    pub sec_code_off: u32,
> +    /// Size of the secure code part.
> +    pub sec_code_size: u32,
> +    /// Code entry point invoked by the bootloader after code is loaded.
> +    pub code_entry_point: u32,
> +    /// 256B-aligned physical FB address where data is located.
> +    pub data_dma_base: u64,
> +    /// Size of data block (should be multiple of 256B).
> +    pub data_size: u32,
> +    /// Arguments to be passed to the target firmware being loaded.
> +    pub argc: u32,
> +    /// Number of arguments to be passed to the target firmware being lo=
aded.
> +    pub argv: u32,
> +}
> +// SAFETY: any byte sequence is valid for this struct.
> +unsafe impl FromBytes for BootloaderDmemDescV2 {}
> +// SAFETY: This struct doesn't contain uninitialized bytes and doesn't h=
ave interior mutability.
> +unsafe impl AsBytes for BootloaderDmemDescV2 {}

Here we can do without `FromBytes`.

> +
> +pub(crate) struct GenericBootloader {
> +    pub desc: BootloaderDesc,
> +    pub ucode: Vec<u8, kernel::alloc::allocator::Kmalloc>,
> +}
> +
>  /// The FWSEC microcode, extracted from the BIOS and to be run on the GS=
P falcon.
>  ///
>  /// It is responsible for e.g. carving out the WPR2 region as the first =
step of the GSP bootflow.
> @@ -221,6 +290,8 @@ pub(crate) struct FwsecFirmware {
>      desc: FalconUCodeDesc,
>      /// GPU-accessible DMA object containing the firmware.
>      ucode: FirmwareDmaObject<Self, Signed>,
> +    /// Generic bootloader
> +    gen_bootloader: Option<GenericBootloader>,
>  }
> =20
>  impl FalconLoadParams for FwsecFirmware {
> @@ -275,7 +346,19 @@ fn brom_params(&self) -> FalconBromParams {
>      }
> =20
>      fn boot_addr(&self) -> u32 {
> -        0
> +        match &self.desc {
> +            FalconUCodeDesc::V2(_v2) =3D> {
> +                // On V2 platforms, the boot address is extracted from t=
he
> +                // generic bootloader, because the gbl is what actually =
copies
> +                // FWSEC into memory, so that is what needs to be booted=
.
> +                if let Some(ref gbl) =3D self.gen_bootloader {
> +                    gbl.desc.start_tag << 8
> +                } else {
> +                    0
> +                }
> +            }
> +            FalconUCodeDesc::V3(_v3) =3D> 0,
> +        }
>      }
>  }
> =20
> @@ -376,6 +459,7 @@ impl FwsecFirmware {
>      /// command.
>      pub(crate) fn new(
>          dev: &Device<device::Bound>,
> +        chipset: Chipset,
>          falcon: &Falcon<Gsp>,
>          bar: &Bar0,
>          bios: &Vbios,
> @@ -432,9 +516,49 @@ pub(crate) fn new(
>              ucode_dma.no_patch_signature()
>          };
> =20
> +        // The Generic Bootloader exists only on Turing and GA100.  To a=
void a bogus
> +        // console error message on other platforms, only try to load it=
 if it's
> +        // supposed to be there.
> +        let gbl_fw =3D if chipset < Chipset::GA102 {
> +            super::request_firmware(dev, chipset, "gen_bootloader", FIRM=
WARE_VERSION)
> +        } else {
> +            Err(ENOENT)
> +        };

Using `Err` to indicate no firmware means that we will proceed even if
`request_firmware` returns an error. This should be:

    let gbl_fw =3D if chipset < Chipset::GA102 {
        Some(super::request_firmware(dev, chipset, "gen_bootloader", FIRMWA=
RE_VERSION)?)
    } else {
        None
    };

> +
> +        let gbl =3D match gbl_fw {
> +            Ok(fw) =3D> {
> +                let hdr =3D fw
> +                    .data()
> +                    .get(0..size_of::<BinHdr>())
> +                    .and_then(BinHdr::from_bytes_copy)
> +                    .ok_or(EINVAL)?;
> +
> +                let desc_offset =3D usize::from_safe_cast(hdr.header_off=
set);
> +                let desc =3D fw
> +                    .data()
> +                    .get(desc_offset..desc_offset + size_of::<Bootloader=
Desc>())
> +                    .and_then(BootloaderDesc::from_bytes_copy)
> +                    .ok_or(EINVAL)?;
> +
> +                let ucode_start =3D usize::from_safe_cast(hdr.data_offse=
t);
> +                let ucode_size =3D usize::from_safe_cast(hdr.data_size);
> +                let ucode_data =3D fw
> +                    .data()
> +                    .get(ucode_start..ucode_start + ucode_size)
> +                    .ok_or(EINVAL)?;
> +
> +                let mut ucode =3D KVec::new();
> +                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
> +
> +                Some(GenericBootloader { desc, ucode })
> +            }
> +            Err(_) =3D> None,
> +        };
> +

Actually, let's put that code into a new `GenBootloader` type. You can
follow the example of `BooterFirmware`, which is quite similar (only a
bit more complex).

