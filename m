Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0110FB18F10
	for <lists+nouveau@lfdr.de>; Sat,  2 Aug 2025 16:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FBE10E03C;
	Sat,  2 Aug 2025 14:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E+Aqr/g5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7F810E03C;
 Sat,  2 Aug 2025 14:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxUZvV2uQFeL1iqES2L3M783WCcg2b+noAcemd1haa8BN1wuTFDRa5hzoxJ/kMxrWss6IfiuPVCjYH2GYdntrrlRhj4Q5KfIjiM+/2ZuGRKViWsEbLB3rymyN6mDDwjiS2F9IgRwDgWx1WnfqHP1iGD8TuAbnax/2hDFrsz/psUaf5pkY/BqScSa9GV1PBLPKtux82J1V5JdP7PVQR7nIUEC4vfn2erez7fOCyZQwu/K8upCuBZwmlRObIpv/CPfQTMyJLRHatdbNw6X1CB6HHsYb/+y87y6sZcXgX+OBDzARVaRluhwcSk+6SDjf3siRrmKi0tVR2ofbTxq5VGvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndN1pI5nfMy7d7T5RCqGRPBcFdPMdywxLtj+cIT0Krk=;
 b=J2yjF3hA8G/mxktlblLjBRwJ6OXbSpw4SrjplVlx5sDHMkCZSQ7dggWZUNDNokKlUr3QFbZ6muMCxqeGarb3pJMssWmj1Mj1r/j+ZLduG0CgrnqW1xLOVPmgXpCjqrwRLkkJuRKu0cTvYk7m6eWcFcTH8Hgr7f7mQ+kFQnWdITOl/bXqkRufMeeJNf4fszoaBCKPPShqawTZZATKQLzhJC+MkHmWYXf0AGMUnCHhtbfkgXit/osL3BXClBCcVCk9CUohoDirLyDkgu5uTa+lzXG6trMmgROxyMjU11uqSpjVPqIdsKdRecmgeytlqS9ScChaVELiziiOqa/s6UT6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndN1pI5nfMy7d7T5RCqGRPBcFdPMdywxLtj+cIT0Krk=;
 b=E+Aqr/g5WX65gx4PB3xtZqPGx41yjId4HVF0VZNKJG9+upWzwwfMXb5wXxOJTKMY9OnZvAg0ZyFs6IBedNCn5YmY7h4iwCoc8SHh4hjNyLo+8SRv3He8wC5pYerQKtcrhjM7hPAGr/TfKjG/1PdAnhr9MuNEbL//6hm/djecqJO+CxNXEHHQCWogsOqSjBMIp8Entq3r5P9hY/mSegCDQXMtx04EivhK2m2Bg75iQRiFFlqYz/+bYbBtS/iJUvw9G4ddM3LPsOoF+/7TewrKF5ULSZK3KlZnGXYyrudqQ0ViSCUIEN9ELwF1517M9Qb3vHSK/SVGsdMspSDlgHFw8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Sat, 2 Aug
 2025 14:02:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.026; Sat, 2 Aug 2025
 14:02:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 23:02:32 +0900
Message-Id: <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
 <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
In-Reply-To: <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
X-ClientProxiedBy: OS7PR01CA0232.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f33f41-f3d0-4d23-feaf-08ddd1cd3c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVQ5OHNtY2lhV3ZzRmNGcnRyKzF2L09aOHdER1crNUNicWJ1aWlXcmhud0Vx?=
 =?utf-8?B?Y0NqaVFDZkpGd1VWTHNrOTBlQ2REWHBBd05uOUprUHRVN1Irek9XSUhwZHQ0?=
 =?utf-8?B?QzcwUW40enlNYXMxWDQwOHdvbXFJdGpVUkZmUXZKK0lRRkZKTlhBNjNmR2JD?=
 =?utf-8?B?UGZVbzl5YjdVUXFiR29GaGRoZWNDa0gxWGNSMG1iRTdvZE5raXhhYWdZZEZr?=
 =?utf-8?B?eVc1ZXNSMU43c3pWOHprUzRnbUV1aktCelZTdW92LzllOTNkYklPRW5HR2do?=
 =?utf-8?B?clVPbjNzR203NXVOV1JjTC9NakFOSEJiOXhPQlJPbUFQNzYxUDNTU3JmR3Ri?=
 =?utf-8?B?eHFSNlRQdjVncDlkeFlseEdHZ0ExUzZ4bGQ5Mi9lQW9GL01DN0V2dnRlOFBu?=
 =?utf-8?B?T251a3MvUXlRa0N5MzR1QnpoNGlid3kwWjVTaW5kMnF2cVdSbWhPQ0dtY29m?=
 =?utf-8?B?eUEvT3ZmN3hhZGtsdHFhakVHMll4WDcxdXptOE1iZEswVlFXRWtoTHV5U3lh?=
 =?utf-8?B?eWtXb0VJSGJHUXdOdWxrL3lkcWcydTUyTUprdjF2eVd0Zk15SEhqR1ZwN2pO?=
 =?utf-8?B?NEpVblo4R1U0V0h0TEs3Tkp6VzJoaHcvRmYyRTZOdVU4SE9RYlJFZnFpZFE2?=
 =?utf-8?B?dmJGaXU2NHZ1ZXNlQTR0UWZZM3BmblVMc28yV3V1V0VZZFB1S2hDTGdYNzFD?=
 =?utf-8?B?b00ySzZjUGhFd3NkYWxDb3ZlWWprMHlSTDhxTGNGaDBQTmx0NkFiSmlZcU00?=
 =?utf-8?B?V09xMmxZVSs4ZXA0ZmpZdXJMMjNZY25UQTRBQnR1OXF6SVB4NjVqdHdwTUJL?=
 =?utf-8?B?Rmkwc0pnVGNnRXh1STkvVkRFbXh4aUhLbTJVZFByQWV2Y0hpaGJyYlFVb0FZ?=
 =?utf-8?B?a0F5YXg1TGdNNktSSTlCaktHT00zS21MQzhEN0N5ZWh4Z0s0Y1lscFNMSGYz?=
 =?utf-8?B?N0QvRUtIc2ZNSzc1WDU5SHVYRXZhbWF6UEhnY2dDTUhOeEpOWkNXbEZ0Q2ZM?=
 =?utf-8?B?T2lRbmp4SFJBQnJmOUZaUTBwZWdCem9TUjdnT04vb1VueGJYb1M5UE5kY2p0?=
 =?utf-8?B?TDhnVThONVV3N1lkVTByR05QS0tvZW1WWitaQzVOY1VZbCtMWExveXl5Zy9Z?=
 =?utf-8?B?clp5MzhwUXlHYTFuOUZETis1MTJ0cklDZVdDWDluUDNFYk9CMUVwTGZYSU9h?=
 =?utf-8?B?VUZZYW5Wak5TeTRTamFZR0Z6TEhrQ0lHMnVrSjFjYjF0RHFrRnNIOWtDdjRx?=
 =?utf-8?B?bm1ZVi9qUUU4WmY4RWdzdml2N1lFakQ2bGJGYnFZckM3Y29hZm1YL2gyVSt6?=
 =?utf-8?B?Wm1aTEpPSnR6a255dFQ5bGRUYklQQnFQY1l3dndYSXROOTVNTnNDYnlTeGJD?=
 =?utf-8?B?SHFBQzVMMGFZVW5LSjNYYjJaR0NRY3h4MGdqRG5DaVRrNUlEajZBcG0wckZG?=
 =?utf-8?B?YnN1SnBhbHd0MjVwVlhDOEF0SjRpS1BteGhLYWFaS2hsaFFQWGlXbU0wOU5l?=
 =?utf-8?B?eUVsdkNySVRMQm42WFJFNW4yWm5Nc2VYMSttOHNRNHY5c1BHRUptTWZTNHNm?=
 =?utf-8?B?cTZzWmNmU1V3NGhDcHRyWGd2S1hMMFJQN3FqR1R0NzhvQ1VuMklsUjFmaVJ2?=
 =?utf-8?B?VjRlSUhIZGdpYjhvZFdGdEI3cTRyZU9rdUNVL3ZwVWZWZ2xqTVVNMTFoU2Nx?=
 =?utf-8?B?YytUdkFOZWp5aUNBancrcGNENlRJSnJrWVZZWGRzTHJTemMwQUN6K2xBZGpP?=
 =?utf-8?B?dXVmRlkvZHNVaitlZXplQUFkcm43aitFRWFQZjB2V3NGSmthQmxpVC9tMGZo?=
 =?utf-8?B?am04WFBOUkh3eWVKL3VmSExLUmtUMi9tTWxUMmYvZEZtd2lveHY0Y1c2bnlX?=
 =?utf-8?B?Qi9CNXgzd0dZTHJveHhPNUNVZUpHY0dlZU5UYlFXMEl1aDVtbmJnQVc4Y1lm?=
 =?utf-8?Q?wt2bEMUyexY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNpTDg2U0kyQXowbENIM1FlNUJaMU9Sc1hQYjduVi90TmxWTE4zdzJOeFVj?=
 =?utf-8?B?S1dyc0g3eTVIRG1rb25TMWdVcVVrdUJ6MkxNSUV5Z0pCTngrWTA5UThiQzF6?=
 =?utf-8?B?MXFFZlduRGlMOGtobUF5cmtON0RhUnVhbGJ6YXBUWXdvOFNDQm42ZmV0dXpP?=
 =?utf-8?B?UDNnM3l4bEZHOEZqZDN0Sm5zcEZXUWNLNUE0QmxIYVZBY1pqcHVpVzI3aURl?=
 =?utf-8?B?YUtTdnFERXJiYjhyZnFUUk1nTkt4eC95SW5wdVg0MVgxeDl6WWhYOUtSSWZX?=
 =?utf-8?B?ZFEvM1N2Y0J2Qk1UM0w5c2Rlc29nOWZvZnVScllMWHNuSi8vaUZ1elJHYVRi?=
 =?utf-8?B?clZ3aW1zWW5ZZmt5QSsraHFta0k0N01oaDZXUFNWMnFSVkJpYm5ETkowVUU0?=
 =?utf-8?B?Q1M5WmNoR1A3UU9UK2hUWWlmOFZMYkhYbzZrdUU4dVMyaGVXN2p1akVrV2Nw?=
 =?utf-8?B?aXRsQUdVK1RiN1IxU2ZObCs2ZHhmeDBpRlFBVFBKYzlmbzlDQTFPek0rRTNo?=
 =?utf-8?B?eGdvT3RMVzFncG90Sjl5d0RHV01yTGt6MVA2bjhSNzlwRGhIQlhuUEN6WjMv?=
 =?utf-8?B?ekYyOWVHbmJBc1RiOXJvOHlMUGdTNHZGVU5TcDlNQ1BkTnk3K3oxbklFTnVM?=
 =?utf-8?B?NlI1eFNZU1VrVVc1OSs5bUhyTXRybFFNYXY2djdJQ1liMXI3Q2dvTnRkcHB0?=
 =?utf-8?B?MTNjb0w2cWhxb21rMjY3Mm80K2Z6NlN1eElkS1R4bU5RUWpXajdvWng5QXF5?=
 =?utf-8?B?MkJIOVJPNHBmZm9wTDNLM2dDWmExWm5LU1FvUXlXYmZQM2UzbnVsOGJFRzBn?=
 =?utf-8?B?c2o2djNiQm03MTJnODBqOG9uUjZWMjQ3dW5MMXA1MElCaStUd212Y05KckZQ?=
 =?utf-8?B?bGlHaWhtakdqaVRTTjNmZU5TazdVcUZyU2w0c3o5STFMYmdONTBZR2prZC9w?=
 =?utf-8?B?T3B2NDAraFl4QkF0bUU4NWhXUHhwT1BwTmZFNVI5bStIV3VWejhZMTVLT29q?=
 =?utf-8?B?dHd2K0dmUE1mdFgwZGpTZG11Z0ZUb1MyRW5rdXI5bzNIZTdzVDZ4MlZVQS9K?=
 =?utf-8?B?ZmtCUFpyWjJaQVVlOXNiNy9hY1dwRHhIVG1jY0diOFdBWmMzcmtNSElrSnVw?=
 =?utf-8?B?aWFHRFVCanZTWWhxcTZSd2Q2QVFRUnVsWWVPVURzai82MVJpd3hkWnVNODFR?=
 =?utf-8?B?UTZORVNPMVVFSHd1a0FwdFkxK3doUDRzdDZZakNpZVNlUUNWUmFOblJoRnVu?=
 =?utf-8?B?Q0Q0eDdBU1lmYkd5MzBsMlNab3E0RGwwUC82TjdIUHJQRGJCZkdQbTJuWVFv?=
 =?utf-8?B?QWRsVXcrSVkyKzRBUGtvb1A1amZQV0hSRjRsQlRxN1lTQWpIMmc2RXJxeU1t?=
 =?utf-8?B?em94K3dIYjNBNFR6Q0ZjU3RhdDBMcjNlKzNrWk1EOEVFWG5BelFCWEwxVmhk?=
 =?utf-8?B?Rm5HVll0RUZ3Yyt2OEVoNkFDa3BaL2NOblZEKzE5MnBRMndudGVaUU80S0hx?=
 =?utf-8?B?b3JXLyt5Mm1nQ1BYOUEzRzNDMFloTSs1b0EzSnJjRGJlbTMzNkQ0STRzKzhC?=
 =?utf-8?B?MmFLMUVqRDJjbEhXUjhUREdvSTBucW1PZGhHUExBM2IxcWU0UXVBTzc1RnZI?=
 =?utf-8?B?YmNod2xhUWdTRmt2SWgrWGZpRWdVb1NZVHNsay9GejJpeDlYSGxONkRpeC93?=
 =?utf-8?B?RS80OXVzbDJDdlhrR01vYlUzNk1lQjF4UVB2eTlYWnAzZ2lsaFdGb0F0TEw0?=
 =?utf-8?B?VUdFdEpycUo1QWJoczRYREdDSFNLTm5VQWlFWHNpc2wvNWVOWGFxVlZrY2Jp?=
 =?utf-8?B?NGVaVmRRKzlTaUUya0lpM0QyTEdDMnE5ZDQwYVU3NHpETEFRZ0lING1YUWZZ?=
 =?utf-8?B?MTJnR3RDbnZxZDZrNktSWTlpdWkwODV1ekd0VjhMc0ZLRndGWXl4b0pjdml1?=
 =?utf-8?B?TFd3KzNsVzZJUW9Pc2tyRW5PaDh0U2Nqbk9uVWgveE16bUdQdlE1clNKczdB?=
 =?utf-8?B?L2x6WVU1aDVRMzBWMFg0M1R2WDVnQW04OGVGOHJ6VHE1anZzdkduOFZSQXF0?=
 =?utf-8?B?aXlodnBVQzB5VGJLSk5xS0ZPNzZXd3ZDbUE2RHYza0Q5b2VERnZCSm1TcUdx?=
 =?utf-8?B?WVVRTDJTVlhDTGlQUmtVOUphaFduOVJ0am14Y0YzeUhkeEZNc291T1JRWVI1?=
 =?utf-8?Q?m2Zr9qfyMbqs96/GgAdnkNC1FKi7AXz0EZPx05XFTZMP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f33f41-f3d0-4d23-feaf-08ddd1cd3c88
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2025 14:02:37.5319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dffDMoeYFOOxG1+4eX6rLNIjn1WDJ98PBcoxzV3cPIyZkqtTrPS9mL1K2JpWE41OfDs1k2VSCoAJIWUeMsuNtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312
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

On Fri Jun 20, 2025 at 11:02 PM JST, Alice Ryhl wrote:
> On Fri, Jun 20, 2025 at 3:59=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>> > Similarly, if they stabilize the `Alignment` one (only) and we end up
>> > only using our `PowerOfTwo<T>` for `usize` and those use cases, then
>> > we should consider using the upstream one (and adding any/all methods
>> > that we need).
>>
>> `Alignment` is very close to what we need, so I don't see a reason to
>> not adopt the same name at the very least.
>>
>> This reminds me that I should also check whether upstream Rust would be
>> interested in `prev_multiple_of` and `last_set_bit`. The docs I've read
>> for contributing looked a bit intimidating, with RFCs to write and all.
>> Would you have a pointer for where I should start? Maybe a Zulip thread?
>
> If you want to add a new library function, the correct procedure would
> be opening an ACP, which is more light-weight than the RFC process:
> https://std-dev-guide.rust-lang.org/development/feature-lifecycle.html
>
> RFCs are mainly for much bigger changes.

Belated thanks for the suggestion; I have finally opened an ACP for
`last_set_bit` (and `first_set_bit` while we are at it):
https://github.com/rust-lang/libs-team/issues/631

I am still entangled with how to best leverage `Alignment` for our
purposes, but think I am getting close to a v2 of this patchset.=20
