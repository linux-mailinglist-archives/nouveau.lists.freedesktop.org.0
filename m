Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13BBCC1E0
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 10:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4511410E3AB;
	Fri, 10 Oct 2025 08:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ICimyyL9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1FE10E3AB;
 Fri, 10 Oct 2025 08:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS2Xa2Sgk2sjz2Z5320kyjIOTPI/BCGFr4v2MpukP6DsaxmThUVGFogIVaMJtG9HdLl6aFa+BwkdPJNmeHjyEgvd5bVy1Kb4cfPgWoYOXPNP0eIqSrxOu3r/c+FgA+naLcurbKra5MuYSmVOUAivpFbMfSMzi4U/TIqf50SaiDXo8gCPazztsULgFqfi4fjTB7WuqaiwdHdYSRtRrKEFf0DSaXJxvehvMQTcIMGUN6tD9dWUQmdU6qObiTlAB8Jr9348T9DiEAI/QxmMsgHnERBSiMcjiMQZu7P6/SjdKST+TRC6YK7bFkMXCNPfQiTvChaj+g19VPTg0YS8djy9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sSZNhqVzaB6OO8BI+aSROTV54tByIM3mt1/09RiucI=;
 b=lc8GAh2WHBvBGK714oCzgpZOXEMr8APVb3FrnHJ/kA8G+LldUDdtKWfG3xxnHLr3ah0/eljyX4f9lCHeBSmPwe/Yp/ypUGOD6I/vvx3vCYzXFevxw8p6c9rU20W3RczthAMYu9fb1PX08b0EdmZzodi8pXrDvRRXVjrJkj00LBPthDLoBa+Z6oy8NQmtRtc5CCTXtA8nvQ1Lq5XcdkT3jxVBMaQ8eHd95vLwSDqWTcw4deZkQ2hFrZg573k1IPsprHyLuU6lzx/LF411VRJJsQTua4i/7Wy5Of8wDooLN1hnbT62eAfYTUEBoN0G6VTy7jVhoH3H94jtCcKBWuN6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sSZNhqVzaB6OO8BI+aSROTV54tByIM3mt1/09RiucI=;
 b=ICimyyL9cT+0g9E1g8YwQwIVabM5r1SMld+gc0ssDUVKdeFxxUqe6I9DPy+5jDBpyp5PB1sCuoDJeev29wbzdW0QYJ09epBa21S33rFNz7wtki4aw5nJeg/Ul9A6yEMmQtOFxohVQw+ynnKSYn/vEUtINqq90vlHLQevt19jz8myvBPUhAoHdeuls59rv4sGMEa2v9HPL+H2t357JFX79tpMM9Zp+GLgbWiSTqNNM5v4rvmi57x3K8fXuYje2eZ0qClge9LTNdbe5JnGrT2AeWz1LR0s+urwnFy1SRH/FACF+TZBobUKlHlFStwhHO1l8QcAoQyUhE4NgiqKitl5Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 08:24:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 08:24:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 17:24:36 +0900
Message-Id: <DDEHY1VPGOVS.2P6V3S3GFIOR8@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "Edwin
 Peer" <epeer@nvidia.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "Jesung Yang"
 <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
 <1ba060e1-a3ca-4570-a641-e1f09026b13b@nvidia.com>
 <D797D35C-C1ED-4AD5-8779-C3F3E0D6BC6E@nvidia.com>
In-Reply-To: <D797D35C-C1ED-4AD5-8779-C3F3E0D6BC6E@nvidia.com>
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b72ce7-9f6c-467a-5bab-08de07d6768b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDZtNGVMMU1LM3pOa1hSdzNhZjN1SW5jOVlzVC9uK080V21YZ0Z5aEZMMURW?=
 =?utf-8?B?VjRSL21WdXVxRnFhd2pJWURkT3psSnprYVYrc1A5V0NReGwzcDZITWt4NjlN?=
 =?utf-8?B?UVp1QWplTkl1MG0rOUpGTG41bEZvb1R1SEQ4Z1ZtVnhhUU56aEcwKzg3emU3?=
 =?utf-8?B?UmFSY1pvVDk4TnNZcW0vNFl2alhlRndScjhkcG9RbVZUUG03OFA3QzgrN2RI?=
 =?utf-8?B?TVJNTkJNWVhNSHBPUTFpdDhuTTFKT05nVlhLL1hWV1dOZndKN0t5SEZ5NHZm?=
 =?utf-8?B?dUJsak1ZenJ2ZWFkejFJdGR2NklORkRUUmdHUjhUa0h4Nm1Idkw3RVVjQlVh?=
 =?utf-8?B?M0oxdHNnWHpPQS9vRm5vRDNsVENyMnhvRWVOYmlZV2Y2RXJJK0dTdnUvSm1p?=
 =?utf-8?B?OE8yVG1hNWhTbVptVVAyVi9Cd1VoRlNmNHVUbjdyeFRHZE1YbXkwb3dpd2RO?=
 =?utf-8?B?VXVqRm81NXg2b0RXT1VxcC9HTUYyeG1sbmpsVG9QQ0lGUVAwajRqTStEcWNk?=
 =?utf-8?B?MEZLMk1kamtoTmtoMHdZd2VITlJTUkd4MjQ0eEdpLzRRalg3Nms1WjVyVjc2?=
 =?utf-8?B?MFRPU2c5MllXTmtXTmdZTTBzV0pWaDBudExKV2lZQ2pyVVlRdEhoajc3YlNR?=
 =?utf-8?B?NkhTeUJUdFF5M0xDWDcvTmZTT0hVZ0tYd2pjTUlPTHh3TWM0VTJpWVpkNVNl?=
 =?utf-8?B?UGtxUmRkeHVkbmVrZmNRWTJDcGY1bTZNUWo1dVdRVCtqU1VGUndxTDMrNGdG?=
 =?utf-8?B?bUNTQVJsL3FKQWRteTJOUzFjVWthYUw4RlA2dEU3VjluQTcvTlpBTllaYzFw?=
 =?utf-8?B?T01KdWtibXdZc0FjVkhlem5xa1p4QzI3YllKNkVkZ29kUytDb0xyd2xtb2h5?=
 =?utf-8?B?WVo4TEVnb1NuMHRYU0RvWU5KeGJic2R6M2V0TjRDbmZldStsbWFzY016dXlH?=
 =?utf-8?B?VEdwSFV5TDhhaUJaaTVIWC9jckZEdnpUT0ErYnRrZGpKRDJ3eFF2c2czUFRU?=
 =?utf-8?B?Y1hQRmFRdThMRHd1MWtZR3BKUlFQOFlXVXN5SWdvb2R5NHh2ZDZYLzFzR0cw?=
 =?utf-8?B?ekxVOVBlcC9RK0QvSHI5WmZFVG0wYjc4Y0xySW15MkVpOHpzeHBQN2lTb0Vl?=
 =?utf-8?B?WFFoVnllSGNHdG9YN3lJRzd4MHY0T1RqclZ4aWkxK3VzS0VDS0pkV0pFcElL?=
 =?utf-8?B?QmZTdTZkU3hIeEJLcjFIaTgwTHdKc1c5aURFMDZqTXZqdkRpTTJsMlk5SnIr?=
 =?utf-8?B?M0hYWDRiSytMM1B5cjhnTWZWSFNjb2hwUForRVFJRWVkMTV1TTlaRGR1bHNZ?=
 =?utf-8?B?MVVBbVlhNG14eGJuZVd4WXFXTUZ6K0ZBenIreXRYSWRmakNhRGNzNFBKM056?=
 =?utf-8?B?T2N2NTBZdFZHUGNRMGpjRkpRNzVJRWFzd2g3c0JBc3czV1VEdzZ1dEc1U2gy?=
 =?utf-8?B?eFNheXFUdDI4ZVlaTHZiK25Xd2VyQURsc0lNVFlERjdJTVUrZDB1cDZzWW04?=
 =?utf-8?B?QzB3TVZubGF5QUVNZGtwdVR5MVdyUUt2UEJYaVZZNmt4WTcvS0lyRWdxV1F4?=
 =?utf-8?B?cU93dWdjYkE1dTJ4ZE5ZVklGS0lJWXBxTENKZHZWUjhsajNqenIxUjR3eTZ6?=
 =?utf-8?B?eFYzMzJWcFBiSmh6SFQ1Q25wbG9Md0Q5SnhGZW5jSUxzN3l1T0tZaHhiNUE3?=
 =?utf-8?B?cnlXY0JOYW82QUMydUdIVHRrZXh3cElkR2pkTmJzbWNURktZV0c2OGhaVTRI?=
 =?utf-8?B?V0VOdWpVSDZVa3FubWQzckh4bWtPdFJ3NkFINnlyZkxRMHJjbmRUODJBRlQ0?=
 =?utf-8?B?Vy9HbzIrRDlQeEUvV0N4dE8wWDNzbDhtOEdRZU50WVlsSjJmUlhQM0daZWxW?=
 =?utf-8?B?MHhqSzloNE9rMjNjWlRua1VCNnVvZDliRXlDUmI5QW5iRlcwbXBlU2h0LzVG?=
 =?utf-8?B?aURHV3ZKVXovd2l6SWkxVjJlYmYraXU4R1VyVmh2TVd4RFVEbXlwSTFrZGNS?=
 =?utf-8?B?SUNUYlowMGozN3ZkQ0NxcVhzTFl4d2ZkVVVQNU9SR01EQzJYREllRnpwZHVu?=
 =?utf-8?Q?+pMXqL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzloZm8wME1ROUswemxlV29wQ0djOUtpNlh4R0NTcnV1SDJNVUptY2JHdWkv?=
 =?utf-8?B?TjVvNlJya3JWVmhTYVhBblowVVRMeTR2L1RxMHduU1ZzbDRGZFk1Ui9GMDA4?=
 =?utf-8?B?a0tmVzc5cEFCKy9abDFTUjRPOXBycVZZVXoyMS9Ob011dlJlOXBESFpnc3dy?=
 =?utf-8?B?VmZ3d0RHS00rZWJ0cCs1NEZQVGFDZHNRenVIL0dWOXc3QzlGL2ZGeWdDRnoy?=
 =?utf-8?B?c2NLNENSZVJwNy9oQVpWb0dQcWVidWU1RSt4Mkl2Tk1hN2FMSEUvanZ5MEcr?=
 =?utf-8?B?TTlkY0JzMi8yL2M0eXl2cnFNRmZqRUN0dVFTckZGcEtiUTJpWmF3UHBHcUdE?=
 =?utf-8?B?YklQN0ZMK0FUY1hmaVVDNUR4ZHozcnVoTWVsOVo5MEtYazhTcTExM1Vpcnhp?=
 =?utf-8?B?N3R1K2dTdGtQaytJMWk2YVpQczc5OUpGcm53Qnh1TTNrUVRVdzhMSUtwSXdH?=
 =?utf-8?B?VXhsdFpZcW82c0ppWXlMVFFSUUVjenpSVmxLbFAyM2JNc0l6ZEhha0hZZ1pN?=
 =?utf-8?B?bWV1MStXSVhlL29KOEdvcU5RaVVHUzJTYk51M3Qrd3ZOUWVtWTFLOGgzSG9p?=
 =?utf-8?B?RDRPQjVBWVBDeUsxUkE4SnFUQzAzSnByRm5oaE82ZDJwUmkydldpdDdOdXhv?=
 =?utf-8?B?Rk9yZU1qLzU2Umw5c3hLSnBRTW4vaHpDL0kxVFk5K1MxZFlwb1VMQ2pra1Y2?=
 =?utf-8?B?QmFnNjZHaFlTZVZ4R1pmdnlNS3g0cUIwcm9kNS9RSUFPNklJcmlQcmI1OGta?=
 =?utf-8?B?QzF6SG8yb3BlR0t3dWpTQjJrU3ExOVhIQ2pYYVh2UHN2OTdJZWZlVDFLRysr?=
 =?utf-8?B?andxcjAvdy9jWkpWb1hPSFgzS1lycFJOeWhBYU1OZVNEVENzaVJWbjhvT1dI?=
 =?utf-8?B?YmRnV1FIMmdoRWhGQmluY1RicWVWcFlvc2oxc3RLMzdUdTNtOGNVZFFYVk9C?=
 =?utf-8?B?T1JuL29RcGx2eUpCRlFudU40QU52K2dKYnZiNmtrMGdKM1NDSVhCTzg2akov?=
 =?utf-8?B?US8yY29TVHRBK0hKc3BiVGtHcGliTGZBSnJBQTk2eGJmQlNzK3MwbGJtT2Y0?=
 =?utf-8?B?Q1g1cHloQUxqQlJDdjY4dzRmZVFYcWg3Rjh4WURucG5hUXVTV05RanNIN3Q0?=
 =?utf-8?B?ZmRUSEJGdnNaaWc3cXVCN0dicGRpeXdIRDkyKzFvRThNZ0hqYWwwNnpHZjRV?=
 =?utf-8?B?MkliMVdOYi9XVjE5WC81QjZLTU5BSTFBTjRiWDExMWpmRWN2Ymd4UDVtKzVE?=
 =?utf-8?B?WFcvVm5wWUFtZGxLaEkyUm1lam1ZWmtZalFmZm16Vy9HOXc5NHVFVUQ4b0Jh?=
 =?utf-8?B?SHZoTXNoWllvZlJ4NXVrMDRMYWhsbVRMcEFnUktWR0REdzU4MzZXMUNtRXJB?=
 =?utf-8?B?TXA5cDJwUEppcHVwL1hSZWVpYTVESlpteTJkUjEvd3Q4ZGhjZkZGRXpxUVcz?=
 =?utf-8?B?T2F5T1J3eGNCVVIzY1B0Y0F4bmZFbm05YVpsd1BmZmR2MTVReVJuRzFkZW8x?=
 =?utf-8?B?bHRRVDUxU3drbElySkZONkU0QnY4dm1rcmg4VVl1SVVOR2pYTHdEV05aK1lJ?=
 =?utf-8?B?czBsY1RjT01nSVJ4dm9SaVVyVDBmQXNxai8yeHdwN2tsT2srOEtvK2p4V1ls?=
 =?utf-8?B?bGthQ3ptNVkvS0V4TlpPUGlyU2lzbS85d3AxOStoRmczTHhZYmFUWDVHREMw?=
 =?utf-8?B?K0pNZ0FZV0l6NjM5UFdSV3J0dDd1WGM2U2VZRFYxTjdJelZ6MU1ZVUJURnFx?=
 =?utf-8?B?ZXNiV1o3aC8zdHIzc1IzQXpyMDlCTjRKQytWUng5ek9HZkV6TFZxMHovaEN6?=
 =?utf-8?B?emJOWHY0OTFRQkI1Y1VNaStNRGptS3dXVjg1NG0ranJhVWJ2Q3JLMG1KS0hs?=
 =?utf-8?B?MnFTTHROSHc5Qmd5R0pkMHU2NkVMT1pqckErMVowSCtCaHFLNmhkYk5RUDVr?=
 =?utf-8?B?bSsrRlV2MWhLWUV1aDkydU44anl3dlRYWDNmWUtHdFVzWXhWTDVYd0g2OWN5?=
 =?utf-8?B?Ri9mQzZxOHNPb1ZxK3dlaStacUU5NDRrQzU0ZGtBN0hHajZodTF2alRUMzZ6?=
 =?utf-8?B?aTZ5bFNseGt5RGxka09BOVhzOElWd3ROS0lYRlp0b3pFeVc4bXd4L2VRQTBY?=
 =?utf-8?Q?g/18SExKDHfbhFpe7mtTz3MwP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b72ce7-9f6c-467a-5bab-08de07d6768b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:24:43.0746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSd8jv9sqWrNVf0bzISaNfIxhVzAPHPbC1f93T1ILV66mjnXk0pDJzYWpKVQcC5anfpbnNiiqXqQEL2A6d58Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921
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

On Fri Oct 10, 2025 at 12:41 AM JST, Joel Fernandes wrote:
>
>
>> On Oct 9, 2025, at 11:17=E2=80=AFAM, Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>>=20
>> =EF=BB=BFHi Alex,
>>=20
>>> On 10/9/2025 8:37 AM, Alexandre Courbot wrote:
>>> The getter method of a field works with the field type, but its setter
>>> expects the type of the register. This leads to an asymmetry in the
>>> From/Into implementations required for a field with a dedicated type.
>>> For instance, a field declared as
>>>=20
>>>    pub struct ControlReg(u32) {
>>>        3:0 mode as u8 ?=3D> Mode;
>>>        ...
>>>    }
>>>=20
>>> currently requires the following implementations:
>>>=20
>>>    impl TryFrom<u8> for Mode {
>>>      ...
>>>    }
>>>=20
>>>    impl From<Mode> for u32 {
>>>      ...
>>>    }
>>>=20
>>> Change this so the `From<Mode>` now needs to be implemented for `u8`,
>>> i.e. the primitive type of the field. This is more consistent, and will
>>> become a requirement once we start using the TryFrom/Into derive macros
>>> to implement these automatically.
>>>=20
>>> Reported-by: Edwin Peer <epeer@nvidia.com>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>=20
>> As these are incremental improvements, could you please rebase on top of=
 the v6
>> bitfield series so it does not conflict?
>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=
=3Dnova.dev.bitfield.submitted.v6
>
> On second thought, I could just carry this patch on top of my v6 series a=
nd avoid too much conflict.
>
> So if it is ok with you, please only carry the last 2 patches of this ser=
ies whenever applying.
>
> For this patch:
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I will review the other two patches as well. Thanks.

The idea is for this patch to go *before* your series, to avoid the
asymmetry in the From/Into implementions of bitfields. We could also put
it after, but it would become larger as a result and I think it can be
merge soon after -rc1 is tagged anyway.
