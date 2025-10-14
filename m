Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED91BD7931
	for <lists+nouveau@lfdr.de>; Tue, 14 Oct 2025 08:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA1210E542;
	Tue, 14 Oct 2025 06:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g4s57gtu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7697310E1F4
 for <nouveau@lists.freedesktop.org>; Tue, 14 Oct 2025 06:35:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mq9Dr8Wx7yXv6lk5Bs4SDNV1vMwFz8BqOyoPXJsj0Ady4N8ISiP27mMPQHzi+6hD+nSUqMnEqC15cWx/4kqcVXK0fxMWbBzTwPvieQWg3aHChYEwLTiR6NP32eIvsl1+7x+F4QxNxWO8++ZYSShJyEze27FM6dTrASTj6m72Xc91X1nUEJfgicAO6ts0e8wU+uV2dJQ5Vf62R3N2m1UeoZ0xyMQgpXDgUxU5wDBHa+EtJAkZPpy4iD66v+iAQAvaeU3mBYQ4UbVwNjNmkqMSHhstotKUnQ/9zX4GXYIQSHo8tIwwNViRULaLAscBS+jKUegPeSKQbAbahZvIeOXp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLI/NhfsOu0+ERQ5imltfLksnvkHaLZjUDB9X7QcsnQ=;
 b=sOaREfxNcWFZ4bq9pKqxI38Ta7HfvACRHRxn7k/DJ4njSArZogO1bkQzug+Z4Q0mGSLmU6eB4JbjpG3lfyRB0ILRnKSkg7KI7ttywaOrXAjDEU/FLEUWQQnBDMXV0XlkP9rb/cqe4nlY3bF9ZMK9dnMpQa0KcFtHpFr3zpl+YO4dnMeZN2qlc5e7PghW2V+Rpe3FxnqkZo4oCqgmMo8qoat3Nar9ys4otn84mkbAENMNlqch5l8G5IzEje6aRR9c5Ajk+ADeK1aF8eNE8DDs5CpkpUu6a2W6Ku/MqVWuNjX5a1RdzO7dCAuLR+YwlXk/T0BriCmNWZt+VS0JsoINaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLI/NhfsOu0+ERQ5imltfLksnvkHaLZjUDB9X7QcsnQ=;
 b=g4s57gtuH64x9igYKbtnh2sJHd0YvT7e+8wAQUZq1nq+PcDZqRFYcMUiz1BOSRzGJIlOvq9CJfE5Olc/SuXMLi4Rm14+df4Ia2M9HH+BcOY0l4qutP7DWLWJdemFXqXlRr+3depfwUz95UHMNZ3Ss6cmsCvqPfRMzNebyplJPHmKYSiAbtRfAeO422+nB0OKdAya84ycWTkZ19gf2eI9t5ky3rE2+K+mnAsxpvjTlqZh2RNviYwnpLourrRl2dt6+wRpquaMP1N6xcJcgnssfZWzZAHs3pga6QdG0avKADdEO8YdSz6MqCT4mJ9j1y5sUx5Ffak/uvMiVq63TkfM7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7319.namprd12.prod.outlook.com (2603:10b6:806:2b5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 06:35:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 06:35:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 15:35:22 +0900
Message-Id: <DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/5] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1755235180.git.y.j3ms.n@gmail.com>
 <CANiq72nbERSOWKRUTJ96YYKCDeAoHLBuiVP+XkDUKg7JYkoyiA@mail.gmail.com>
 <CA+tqQ4KG98XcWh3rkAxEOiACSUtPf7KM0Wqh9Af=POgVDHJzzw@mail.gmail.com>
 <CANiq72kE89ukxpf3L0_jFOdv51TDtjjj3r=1mjJzdGWJwmAbaQ@mail.gmail.com>
 <CA+tqQ4J7_z7_NmUNojJttF1e8GRR8Ua9w0Rap1t-U4gYPhQ1Yg@mail.gmail.com>
In-Reply-To: <CA+tqQ4J7_z7_NmUNojJttF1e8GRR8Ua9w0Rap1t-U4gYPhQ1Yg@mail.gmail.com>
X-ClientProxiedBy: TY4P286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c37c96-afa3-49f9-e78b-08de0aebdbed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE42aFk4TjV3SU52T0l3YzBRdm0rZUptQ1BRckp3NDFYakpGODM1VTV1cGx6?=
 =?utf-8?B?TkwyOGhLVmk1eEM1QlhPQ1cvQVlXV2NIQjl6a3VQZktuWFdoTUdpVUUxM1lw?=
 =?utf-8?B?cHhibUkrS0hxUGNkZGNJb2dDVXhqSkRtQUhjb0hUWE0xWWhMVUlPSjZIbjZp?=
 =?utf-8?B?NitTZnR1NndTUTkrak5XUlJoV2JuOUtRWU90OU5QMnE3YkVjdlI0ditzalRV?=
 =?utf-8?B?ZzBWZlJLVlFqR054eFVlVmNIV0JjZ0pCQk1ST1Z0M2NXazFIYkp1MWJxWDJQ?=
 =?utf-8?B?SiswUndockJVdWdmN21MZEtSd2Vua1BwUjE4cmREckVhem9lL0xMMXZOWGM0?=
 =?utf-8?B?UWpBSHJBNERtYW0wTlpEUFUvVkE3eEY5WCtpZUgrMzA3WmRSQTZsL0R6R1dQ?=
 =?utf-8?B?VUU5TGx0WEFTWXVza3FQRjVuK0NSY1g3TGY5S3F4TGNaZUx4eWkwdUVUeTkv?=
 =?utf-8?B?bkk2VDNmb2tpaXpjOEpRZldvVmUvZmI1WDdodkJtbEpuZWtDcWRqY3E0Vzlm?=
 =?utf-8?B?RW1tNUlzd1ZiZi8vMHJzUDdLakQ2VVY0bFhnRmZtUTIvZ3BjRU9LcWpRd0Rt?=
 =?utf-8?B?Qmd4RVB1d0FQSDlYbFZKejN5Y3Myd1ducGhvWUhVSUxubFVTZ1JPRzFwTkdo?=
 =?utf-8?B?YlB0UVJ0RHAyZDB5MDUzTjh1aFBOT2FES1E3cDhoNWgxMW1rUnc1UTR0MWpX?=
 =?utf-8?B?WjMybGNKUFcrUVNNOThQMmFodnhDaUZmQ0RjSGVmSWR3bDIreDJLRTJKa1N0?=
 =?utf-8?B?bUVpMGlOSUxLSlQ1QUxRSVBHTmRaM3l5WnhPWDgzQUdZMTZYMmsvcC9DWWsw?=
 =?utf-8?B?ZjN1dDIzYWsrSmN5cnFIRk5XV0FIZk5WUllzb2ZYdUZrRjJ3T2RCcm91elI3?=
 =?utf-8?B?VVo4U2x0N205QVVpc3JxNTFXTmNIdHVxalYxelR6NmxScTJRR2ljMGF2OHdW?=
 =?utf-8?B?bHN2OVgxdzZOWGFMZnEzckZ1RnRvTWswRm1QM3RLNWcrZDBqSnZwZG9zMUVh?=
 =?utf-8?B?M3NSc2FHRVFVNE5wVU5GK0xtZFRkVmhKdXBOalM1Ky80WTZtV0w2dGJIdXZz?=
 =?utf-8?B?eEJOY2l5K2JtZ1BHRkUzb1IwTEc3UjY0MmxBY2hwd1psbTBHSGNsdCtUSmJU?=
 =?utf-8?B?MnZGMUZoRDlvbVFxZ3lrS1BzbERBNGN3STRhbHFiSTNHZnhVWW0rYk9GMkFj?=
 =?utf-8?B?ZjY2eFFGYlNkcnNJcnJLVkdXUk5SMFZLWHNiQnkxdnY2dzlDSTB6dGJlMm54?=
 =?utf-8?B?c0pNei9ud24wM0hzN3NyWEZUYjd0YWdEV1JGcDFzVG95endUYlBWMnk5TjBt?=
 =?utf-8?B?MHVidVR3T0dXYllySHBmRUFWb1NLclZkRW9jOTJrNUxHSnVRWll5dTFub2xi?=
 =?utf-8?B?bStrMlNGbGpCTkFCTHBXRitMWTVyWDkwajhnM28vaE9rcDY1ak5QUDFrL2V2?=
 =?utf-8?B?MzJQeFh4WUVCUUNlL0o0NXJkUTN3d0JpUHNTTFByQU9Lb0x1TFJMTWhLNTNa?=
 =?utf-8?B?QVV0S3VoWGhzSHpPOWVGWlNLRytQUHhLTVJsTVRZZ2p5ZnBlalFiKzZwNitv?=
 =?utf-8?B?cjFoekFDVlcvbi9CMmRiVk56ajV5SnUyZFlSSmpGUEUzVDl5OGQ0Umh6UGs2?=
 =?utf-8?B?RWcweW9KM050R0JPMlcrOXg3Z1FUTnVzdDdzNGV6NnlWc1FoNzlFaGk3cG1p?=
 =?utf-8?B?a0dFcW83alZmZjViVTB6QlNybzUrOHBWdmZNbGFGZWpnd0RkcmJZbmFxcXhP?=
 =?utf-8?B?TmlEM3E4OUx4Q2JMaG44bitrOFkzSmxrODFUeHd6TEo1QkQ2bjRjTUx2VDNq?=
 =?utf-8?B?NnppR0JFQ1FUeldUdDh1N2ZSQUYxbDV6TUw2b0NSZFJmYUVwY1NnWDAvL25s?=
 =?utf-8?B?bFQrQ1g0VVVqMko0bU45ak9DeERJR2FwZGFtNnIyOXRTUlNWS21ZVFBHdlVv?=
 =?utf-8?Q?FDduHHoHSP5+vOEOuOVyx3i84Ju+Izi6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm9wVlA2YjgyMmFvS3Z0V2hraW13SXJubGJxbzBubFlMZ0huY2Zqd0pxZTJv?=
 =?utf-8?B?QXlJd2NraGZ1M3pFYTlsNCtYQzI2T0c5MDIxTnVqcHNxV2NkRHE0QW9HSE4r?=
 =?utf-8?B?b2YydVIyTFJxbUx6SkkyNE04ZUhDUkJIaDVjd1RPWFR3MlRtcTFrK0FidE1F?=
 =?utf-8?B?cXpTOXJTSlkyOUNaYThmMkFiaU4zeDdSRDVqM1o3YWgrd3NvZ0w3SXNUWUtv?=
 =?utf-8?B?YkhPYU5RaSsraS9VemNVbFRZVHdRdlp3YXRrd0ZGR09TOXV1dEdLeWtEV200?=
 =?utf-8?B?YWt3RU5ya3M5TUNTQmVKYTBSc0QzeTVaWkMyWndwYUtJMVlocDZtekVUTXZa?=
 =?utf-8?B?RFlXQnlxWkZ0ZnptYUlLNTNYRE5vMkdTM1JneDdnUEEwSUliUVhYbEQ1Y1VL?=
 =?utf-8?B?SEhIb0hKWnV5cTRHUXA5UUZ0bTk1NnBGajFwWUpoVDB5VGVvOHhmTGlYZ29z?=
 =?utf-8?B?QTNGM0VCMlErbmNaMTdqaE0yUGk0QzZhU09nUTcwK3djOVhpYlFBUmJTYXoz?=
 =?utf-8?B?VWM4RDVSeVM1amp6SkpCWUZpZ0YvaVhXaW1UaThzRTdsQnIvUnM3cDZibnBp?=
 =?utf-8?B?c1FEalRqQWJIWkVoWGVVcDc5RE9jaEhpbVQzZEpFeTFGWEZLdThkREVaZXNi?=
 =?utf-8?B?TGtkYXVBNG0vZlFqdUp1ZzNtS2R2OWxGV2tkQVRYc0dWUzNnSVBhS0Z4QVhS?=
 =?utf-8?B?a1hVcC9UU3NlTmR6ekZvaVRiaGNnNEg2c0VBdzJaQ0Y4YU9zeU4wQ3kxcXFv?=
 =?utf-8?B?cEVIZXcwcisxYlJKM1JYRVFsU1FLaXRxeGgzQU03TG1TaDNvVk9zRFJCTHB0?=
 =?utf-8?B?ZkJscHFnWmZNYmlUeEVSb3BKUXc3S0ZSVGpXU2RhcW1lWkFCamVMc0U4N1VO?=
 =?utf-8?B?cmZSdWtmeFRldkpRUWJLdldIWktIQjdnMVdNS1NVWEZKZUEwNE94RndOa2Z5?=
 =?utf-8?B?Wmh6dEZNUVhqanRVMkQ0czJMTGpDWkZLWDExb2pJaFpOUEJwcExFN3RmYlFN?=
 =?utf-8?B?RGI2VDdKNDcwUEsvbGFOMnhSNG0zNFdYdE1pYWhOb1dDVHBibzJGdFg4eVAx?=
 =?utf-8?B?TnNCSjlqL0JMTXRQamtTdkV5TWQvOFZiTkdxNzJ3RGI4eFdxUytnYWtVTmpa?=
 =?utf-8?B?ZTFoWkR4NkF5aWpNNVRPYWlpYUdxekpjMEZuNTVDTWNsTDBOVnprZFVpWmlr?=
 =?utf-8?B?aXpHUW5zUnlkTDRGaGRVWVFHSGxFamhEaHVVL1lzenN4VGZDc1NkWDYzVzhm?=
 =?utf-8?B?Zk5Kb2M1NVVwU09Yb1hKWVpnT2t2VFRmbzBjVWhIZEo3TjE2eHh3YWVxMVhP?=
 =?utf-8?B?M2gycnlnM2lzU2tmYTR1ZGF6OU1uNll1d1RYU2RNMW9EWWp0K0NzWG9zSCta?=
 =?utf-8?B?ZVBpNXFCczF0OFJvZmUwVEorNy9rOXltdXJ3OEFHU2VGWnRUMVozOHVwaTVV?=
 =?utf-8?B?QzFxcEJDREVpNFdGNzlVWXJ0d21IZ2w5MVFjb09sQUh2d2xNTlZreEFnTEZC?=
 =?utf-8?B?dTdOV0trdEsrVkl0ZjRabVRFeHVDcG5UbHRBdWdWdTFDYTRMQ2pteng1Wm92?=
 =?utf-8?B?bURhcktwN20rVk05OFFORmhsTDdyclcwQWtXajhoYjlnTTZRTENKWnlFSlBV?=
 =?utf-8?B?c280cFBvZXNWL1NhYnFHY002b2ZPVGgwZkY2M3dETmQ1TzI3dGpWMlU1Z0dm?=
 =?utf-8?B?RG45UnpUbUtmaFJsYkNJSmdRL0FYWHJZaThHSVVmbFJxVmhPNVp3M1lSU2dy?=
 =?utf-8?B?MVlJUklzc1pES256Z0l3OGlwMFBrMnZzOGhGTHZmL29UcFkzb0JGL1ZuUmFv?=
 =?utf-8?B?YTNEUHB1MGcxdTFuV1diTGY4UENxZk9HK2ZSWElpUEpReTFtZEx5VDB3Tkpr?=
 =?utf-8?B?OTEyaGtMSUhTcFFnTUFwdXpwN0swRUh4dmZ0Vng5NnRyRVVXZ3dvY0dUbUNZ?=
 =?utf-8?B?Vmxqa3A2R0pxK2hUamg0cnVhZ2V6T0FmVlN1N251c3lROFJSMVZhZ3JaWE1a?=
 =?utf-8?B?eExDQ2lFYk1sQnp3a0p3YVFPY2ZmWjVLNnlMYTJBWWJWcWZwcjN4T09yMjZy?=
 =?utf-8?B?S0RLM2lBMDFQMXhsRmhydXdZbm9jNGFsbjFMNXh3eVErZnhLL0kwZGVmQjVk?=
 =?utf-8?B?NGJUcVdkSmJHcVFSVmc1cEV5NWtTOWo4YVJGM2tORCtvejkyRXBmaGJZTzMw?=
 =?utf-8?Q?EQwlDYNyIToIHmA1zr2rEZXvLFsGv0RrVs/QDt9Uspkl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c37c96-afa3-49f9-e78b-08de0aebdbed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 06:35:26.2265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tFuDusVnxK/LQ6lVojKY8WNT4Xb5DA3AKWLvudNqZNn+2TkQV0e53s/nGHu2zyTbtqa+y87TAOtFI1QzrFOYfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7319
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

On Sat Oct 11, 2025 at 11:53 PM JST, Jesung Yang wrote:
> Hi,
>
> On Fri, Oct 10, 2025 at 10:04=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> [...]
>> But what case do you think we cannot assert? We can always take the
>> discriminant and reject whatever inputs (e.g. ranges) we decide, no?
>> And we know what type we are going into, so we can always decide what
>> the values to check will be, i.e. we could in principle even support
>> infallible conversions of the discriminant to other types like, say,
>> the bounded integers or powers of two.
>>
>> Maybe the issue is in what you say at "the discriminant value
>> interpreted as the target type" -- I am not sure what you mean by
>> "interpreted", i.e. I would think of this as accepting only some bit
>> patterns, i.e. working with in the discriminant space, not the target
>> type one.
>>
>> I may be missing something, but in any case, at the end of the day,
>> within a proc macro "everything" should be possible one way or another
>> -- even if we had to inspect manually the literals :) And it seems
>> worth to remove the pitfall.
>>
>> If really needed, we can always drop support for certain combinations.
>> We already do, in the sense that we don't cover every single other
>> type out there, like the ones I mention above, e.g. `Alignment`. But,
>> just in case, I assume with that approach you mean skipping some
>> combinations early (the ones that cannot be checked) and then still
>> asserting the discriminants, right? Otherwise the caveat is still
>> there.
>
> Sorry about the confusion -- the rough sketch I shared earlier had
> several mistakes.
>
> My actual intention was to emit a compile-time error using
> `compile_error!()` whenever a conversion could overflow. With this
> approach, the caveat wouldn't exist, since proc macro users wouldn't be
> able to generate `TryFrom` or `Into` (`From`) implementations that
> could potentially cause overflow issues. For example:
>
>     // This emits a compile-time error because not all `i128` values
>     // can be converted to `u128`, even though 0 and 1 are valid `u128`
>     // values.
>     #[derive(TryFrom, Into)]
>     #[try_from(u128)]
>     #[into(u128)]
>     #[repr(i128)]
>     enum MyEnum {
>         A =3D 0,
>         B =3D 1,
>     }
>
> To make this idea work as intended, I should have revised the earlier
> sketch as follows:
>
> - const U128_ALLOWED: [&str; 9] =3D
> -     ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "u128"];
> - const I128_ALLOWED: [&str; 9] =3D
> -     ["u8", "i8", "u16", "i16", "i32", "u32", "u64", "i64", "i128"];
> + // Allowed helper inputs when `repr(u128)` is used.
> + const U128_ALLOWED: [&str; 1] =3D ["u128"];
> + // Allowed helper inputs when `repr(i128)` is used.
> + const I128_ALLOWED: [&str; 1] =3D ["i128"];
>
> The downside of this approach is that, as you can see, it is overly
> restrictive for large target types such as `u128` and `i128`, because
> the remaining numeric types cannot accommodate their full range. As a
> result, the macros could reject some valid use cases, for example when
> the actual discriminants can be converted without overflow, since the
> check operates at the type level rather than on specific discriminants.
>
> Considering this, and as you suggested, I think the right direction is
> to introduce a compile-time check for each discriminant. I initially
> thought it would be difficult, but after some exploration, it seems
> doable.
>
> Thanks a lot for your feedback, I really appreciate it!

Note that if we adopt the bounded integer types [1], this problem might
get exacerbated.

The initial motivation for these macros was automatically generate the
conversions between register fields and their Rust enum. This was
working fine as long as the fields were represented using primitive
integers, but we will likely switch to more restrictive types where only
a given set of bits is valid. So it is highly desirable to support
conversion from/to these bounded types as well.

This might not be too difficult to shoehorn as there is an
`is_in_bounds!` macro (which we can turn into a const method if that's
more suitable) that your proc macro could leverage, but I can't help but
thing that maybe there is a better, more general solution than
special-casing this?

[1] https://lore.kernel.org/rust-for-linux/20251009-bounded_ints-v2-0-ff3d7=
fee3ffd@nvidia.com/
