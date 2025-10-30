Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D04C208F9
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 15:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2816110E8AB;
	Thu, 30 Oct 2025 14:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IfjWt2iv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74EAC10E8AB
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 14:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFeA6B6Ib/JTq7IPxQox7BJPM4SM4HnISWOKLN0vPvPa8l6RUwL3TUSWYuXzCEDWTEnaRvudoYsntNVHGhLyGUqPbXAnmLnhjDPCMf+UDmHPwbGLBjl8ROQ+/EuL/ECvu1RJWqodX4Wf1O3Y4Iy/qi9G2cZVR8+Z6+d7S6rNRx1aQav/nsxSimLffFGesEb7Ge9qh7nnMQ95Gff2LMYEqd8/V8VAa+4638AbOo08WDbla/u64S1hJm/d1nVwc90P6ZDeTJz/6b/oeHtBJnG1WdizaSpRS4NHy5DIWF/kjDG/9/da3ffkToAb/oGkfmq3xfhfYEMnHW8EhsqlExRpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv26tqbhoAqmG8zGQCI5swxcdO6tqNxf7zo7Ws4tfS8=;
 b=cAbyNYPg8m/7QSUQxuJbDQMP38nhWzpkel9AXhHt9r01la9dVNeQBGksmSuKgFdLAtR96HCyGLNhYQjosXGqjCWqvap3+sU+ptWbGWAEZ+s7/Y7/kED/ifWxQa6wx6sEiavB18Xqcxq2eZvgyZszqRGuCnk6yv5jw3UVoF+WMQztG+d6IAF/UwkxrovSPN4wQDoQJTa1VINC/AEyaGwlavxSuKwwJhzacmQ8t33EAOHyQD7hDgvNd/abyUNslt8+/H2LibYU6RttW6W5WFf+DWeE4qjOD2LzbNHHTTlA3xEVBdf7Hd2bqW0ZtyeSqCfVJFutDvQHFscr52o1jeyA2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv26tqbhoAqmG8zGQCI5swxcdO6tqNxf7zo7Ws4tfS8=;
 b=IfjWt2ivSZWFPptmfE2D8uW+l5OoS5EQm4/8X7ab60/B13SCRSmlN4PysL5rptavicgP6rC9aWOLLhdcjUpmJcY1a+0KyCJhHaVtPeNvOnUNOJtMwkEvDFonQxKX2vnOYnTGK6l3cXTL+8FYn/1yUSO3iq6fXq9SUnVs92k1pkKPpn/1kJdxMyNwSdQWzF+4M6/BYrgnlz4p1IkGBS8f/mia+g6vDRN+xi9dagtd22cGgBHbnUqcxyQzOeNRrKJsZmGmrVHM9AjPPmk8L20ZC1S/i96jfdwj2+btfO7g8kuW6y0nJSAF5k/Jd4mhsw7HiCLW0v3FpdS5uQyIWmCHjg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB7891.namprd12.prod.outlook.com (2603:10b6:510:27a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 30 Oct
 2025 14:22:28 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 14:22:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Edwin Peer
 <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, Alexandre
 Courbot <acourbot@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Topic: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Index: AQHcSICfwqqVMX2fo0egTMdmm17vE7TY/MCAgADaswCAAACzAIAAAPSAgAAHe4CAAAGHgIAAClcAgAA/SICAAJR+AA==
Date: Thu, 30 Oct 2025 14:22:27 +0000
Message-ID: <18f013a69371ecd86783d09f73c7fb66d860e7df.camel@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
 <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
 <b9686644-e2dd-4abf-9dd7-fc12081f400f@nvidia.com>
 <479ae6b7fb05376d21bdfe1fcde9e3705c11ecc4.camel@nvidia.com>
 <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
 <35c2d37d02409be8fea5acd713832da938966c43.camel@nvidia.com>
 <a1622011-6c86-4052-a808-31553e0b4916@nvidia.com>
In-Reply-To: <a1622011-6c86-4052-a808-31553e0b4916@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB7891:EE_
x-ms-office365-filtering-correlation-id: 7b1d09ba-a70d-4fe9-33c4-08de17bfc0df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QkExTUNXRTJBdFpVS3dEb1NRcXpFMDBYcGRQRUtOVkZXZWQzZ1BiYm96L2lt?=
 =?utf-8?B?NHZHWDhxc3R2SWdYSWVLSWhLSG5UYWh5Zk1aU05GQ3RXMnNTWmZTZ1EyQnly?=
 =?utf-8?B?ZkZ3ck50emtaQ0tpdldWcVhVNmhqdUZPZ2ZqMUNRYXJFSmZ5TXpiSXNDdGFO?=
 =?utf-8?B?bFkxSHJBYVo3T2FJUC9wTkVzaTRGUmVMNHFQbGFOK0hOZVFFeWJxNUwzb2do?=
 =?utf-8?B?Z2dsVzU1V2JlcC83RHpFakVkVCtkWG4xYzJaL1hjZGhIVlJ6V1dsZEdJeWF0?=
 =?utf-8?B?TVhQZTBQdkNWVkxhOEZreTVPS2diNk1JVEVuTU1pTCtFejkyamsrQ0Vsak5s?=
 =?utf-8?B?ZXd4Q0JWcnp4S0VON2s3S1NDekgyd3RIcEhwM2NLak5NK2dpelp0TVRBcTZI?=
 =?utf-8?B?NUlwMUo0bVJPQU14aitSRFM0cnpFdVN0eUFwVnBiZXZhQk1BdGp3U3RCbmFl?=
 =?utf-8?B?dkozWXRYMlFQWElKWm1ESHpxdUFVRHFBZk9YZWJMcU1RODI4T3BqTDM3UCt4?=
 =?utf-8?B?aGw5bEVPdHVHNUxJYXgxRWZOZGIyRDR5bmZaUGRuQXN6UmV2cXN3WkFLdkxv?=
 =?utf-8?B?eDF1ZGxpZmJjVURDKzQvc1JKQm1wVFd3WkVzUnQyU2UrYkw2NnN5SFlaTStW?=
 =?utf-8?B?WHFrVTRLWXFkV1k2V2FPOXFPWTZDOXhWQ0ZBeExCWm0yN0tYRm1mL1FtWGJC?=
 =?utf-8?B?OHo4WkRMVGlBLzc3YWNzQ3h1Y1lJQXl0UkQrb1R4bUpMT2ZiNnRRWXVsc2ZT?=
 =?utf-8?B?TU1LVjdpcTFVc2lUUmxpR2k4ZUJoeFd5aWxyVHk2cVdZalYxaHJPWFZYZU1Z?=
 =?utf-8?B?Y1JzUTBOV3hGYTNMTEFaNnBtYndkamtKNFd2VVYxeWVTYjY1ekRiVlFFVzMx?=
 =?utf-8?B?M3o4RmQvQkZIWmJsd2U0cENqVlBiS1JpNnhBdzdDU204Y2kzZ2NFV2gxQXFi?=
 =?utf-8?B?Vm5LU0h5VXRTdi92KzdDemJxQk1OM3lPKy9zaG9tbmlTWlYxdEx2SldlcTVZ?=
 =?utf-8?B?b2tYM1JiSjU5bERmZ2N5NDZIREJsd3RWaGJHeGt1S1VlczNCUlhrOUVSKzdk?=
 =?utf-8?B?b0lHeDE2UFY2dFNKcHlZdk1HeEN4TDl6OWlQMUpUM3hteFptKzBBaFBwd3R1?=
 =?utf-8?B?R3lzNlZ0SXZ6TVQvOStwVVR1UzVGS3ZMa0kxcDQzN0lRNUdMbjBnaXJLM09Z?=
 =?utf-8?B?aFZkMWxZeUpEZTBBQnIwVnd1eEkyQzRVSXNMeFlaaGkrWURaWWxXem9FTlox?=
 =?utf-8?B?MnRBTGZmZURTUS9iM0FxREdZWnRUS3VFNVFMa2RXbHFrOU5TejJmR0w2M3dT?=
 =?utf-8?B?OG5WWHlxbWJLVDlnYURzUXBkeXVXY0ZYa0hvUFZzejhUU3hoVVplekVQQVAz?=
 =?utf-8?B?N3J1Y2E0MFVQazJSNFh0Wm13dkYwcDRkemloYlVkalg4UEZDMTE1dVJrNUZR?=
 =?utf-8?B?Mko2aW1VTm5PMDBLbXZ2ZURqSnJDQi9saDBvaUsrVGZnRE5pdlZlWForTXZy?=
 =?utf-8?B?Nk4vbE1jOUtZUW1hdWphRXRQMVdSTllTbDdKNFVYenB0dzFaNjd6c0dDaU1i?=
 =?utf-8?B?UHVxS3FVR3lFUFR3RTc3Z0ZrODk0Ry8raDIyUi9NbmZPTU40czJyWUxUT2Qz?=
 =?utf-8?B?S2M2SmtKQ3ZjWUxQdjc1UExDMVp4RFhsN29iZUF6ak1LUnh3ZmMrN1lUYUJi?=
 =?utf-8?B?TmpHZ3lycDl3NEJTelhnSUJpcnAySWRVejUrN0JEeVVXaFR6dC9vYXhpdkpN?=
 =?utf-8?B?SEd1N3F3dUxCTWpyNmFGZXlUTUw3cDdjU3EvbVZxQmQ4Z2VXb21hUVFUZ2tN?=
 =?utf-8?B?WTVORWZsUVJ1Lzd3eUhtdUFiWDhkb2xFSUlPM3BvRnZhSllWVXVNUkNoR29n?=
 =?utf-8?B?WWFjNExoUHFwRWZwQ2hYOEVUbHRwOGcyc3JjQ0NSUzZ2TXozZlZOWUdxRVJJ?=
 =?utf-8?B?clRGeGpxVlZTSExXenRBUHJVR1pHbUxUa1RoUzBXRFJXYUxxbmxwbWxrVWJr?=
 =?utf-8?B?NmJTRk1RcWFiamwwbDViWDdIakR1REw1a0RTY0h2bUViaU9NNnhHdEZXb2RE?=
 =?utf-8?Q?YPw6di?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEhHTkNyZTkrNkdUWkJZQ0lLS0ZvSE15ZlQ2RFN3MUNLRzdSTXNaL3dGT2xH?=
 =?utf-8?B?TnRDQUh6U1JlVU5ZZVJyaWFYUHFEem5lTFVXb2plVW1vck11RU9nalVoOWdU?=
 =?utf-8?B?RWsrWWt2aXRDd1VWaStWb1FjNXBsajNlbEkvL3cxaDhQbFI4eHBTdlVxd3hz?=
 =?utf-8?B?eWEyZDRYMXFXTk5pMjd2Q1J2b2t0YlR6WEZEY2wzVUFBRStodHpHUDNXY2pv?=
 =?utf-8?B?MWxKTGxuKyswdlRiSGNQT0tJc1pmWTBLQ3hIZjl4T2xDUk1Jakc5NkNycVpC?=
 =?utf-8?B?cjFaeExNT2NkckFmaktvY3BrNXpseHdJcGRHWHVzY0YzaVlEVVBNM2Y0alJY?=
 =?utf-8?B?K1c3ZloxeHUrRWszVEZlY1oyRitRVm8xOU9YcjdKZ2JNQXM3OHdXalREV1A3?=
 =?utf-8?B?ajdhemNUQktYZVRrUk1PcTg1alVSMHFFc0c3dFh5blZCeWF4Y3g4SjMyeVhl?=
 =?utf-8?B?dENlMS8vckJSYlFuZ3JnMTZCRWVrTEhDWEJsQ21obUtuQ3BCYnkvN1Nza2ho?=
 =?utf-8?B?WG5ZREtTeCtzN1B3ci9BUnlpY0FmU1ZIZUZQOFEvenNhYldudGxTcHNhVHVo?=
 =?utf-8?B?QUdsZnFlWlhIeXg3aDU3eUo0Z3IyRVBEazFTcVhVTGRDY1lnL05kdjFXTTZs?=
 =?utf-8?B?RUM3dzIxYnIyeXI1RllTVUVYaHk4RDg0a1Fra0FXWEJxdVQ3SUU0T3A1SVlr?=
 =?utf-8?B?bjh3S0xyZWs0Yy8ydWYwRkUrWUNjbkg2bVJKeitxQ05uaFY0VDd0MXZyaUdj?=
 =?utf-8?B?ajlPNE12NGk4UTdSbmlZbVZJWXp0bHpnL25MNHRoYXo2cU1jWWFWMnZLTFZI?=
 =?utf-8?B?V0ZUeldkblJqQU5IME5udmtxZkY2dC9ucHRDZlZsTEN2czY3dUdSK1NiNmlO?=
 =?utf-8?B?MThsUEhMOUlSSTVXSklWeUlWbE5ySlhyVmtQUWcvM1ZOdXlaaVVDNkVma28w?=
 =?utf-8?B?Tk90Y29wdjg2ZVhuQnlqZkpsaWxoY0hUZ0xLYkRSRXVaRUpKb1kxS2t3bW1r?=
 =?utf-8?B?ZWdoSHVwaEt1dU90MmJxODNUUWFSNTBLa0JUNE5UR20rMWpaNW5Hemd2Qjdx?=
 =?utf-8?B?MmZkaTVFeVpCR3F2V01nSUdLMXlpT25BNDZRSzF5NDJjTnVIcU5La0daejk2?=
 =?utf-8?B?aTEzNjZGSTg0aXl0dE1UQjV2dU43NmJXeG5LR05vQXdVRjIwUFZDNU9jMjVh?=
 =?utf-8?B?RXRuSU5JeGhRck5pOWVVZ2VrT0NNOWhISDcwcVBEaUNOSEZ1M1hEb3MzSVdh?=
 =?utf-8?B?amlPWG9sZWp1V3FtVnVFb3VycFFDYmJKNUUvL1VuQU5MR2RSNSt2VHd6Nzdm?=
 =?utf-8?B?dFAyb3Z4bU42bnJ3U3FTV2dtYjFIam1IbXNzbGhBcklmUTNuZkdzdktxS1Jt?=
 =?utf-8?B?ZzQ3UmMxeGlaWWxpMTdQdU9EdEFPL0J3aUlNcUhtcWFpTlZ2SzcxNHlnZG1D?=
 =?utf-8?B?RFltd1ZhRGFRcUU3RGtIakJoVDNoejZHeWpycGRLNHJrWU5ZaDVGdzhhRFZk?=
 =?utf-8?B?aGVvRkk5WUhEOTJkbXNObEFGdEJ2R1EwTEpiaGVMaDhVTmZXeDFBeTNOb1Z3?=
 =?utf-8?B?alQ5YXhRdGJ2SDVBSDJCNjdBd1E3ekVRVkNSd05zN3RhejhwaXJKaXhqaFpP?=
 =?utf-8?B?QmpTalJSUnQ3RWYwTjhBU2JkeDJWYXBPSWhVTWpCSy9nTTFRNktHWmg4RlAr?=
 =?utf-8?B?YzVmbGJ0akt1b0hYQXY0VGRRVjhYU1NHbXNMUk9HeXVsSDdaWTFOT3UvNDVo?=
 =?utf-8?B?U014WSt3OWJ6akd3MmgrcjhERjFGbUNLakg1Qlc0WW9DcVd0UU0yUk1NckNp?=
 =?utf-8?B?MzhVRzd4YXhyQWszbWx4UWQzQ3JtN29hUzF5NFp4MVIzcWxncmlzQVZONzJ0?=
 =?utf-8?B?aTZWYmw4Z0pxYjAzVjN4ZGFNZWFQa2JmVjNXajRKOURXN2s0V2t0SnpOMXRv?=
 =?utf-8?B?OHI0a2JrbFJUMmVtc0tNd2dKQkNVbVNWak05QmQyNUpJbXNob2dINnpyMXFq?=
 =?utf-8?B?dVRrZkFIWXhtZHhZbzNseGVtV3ljeG52WDBBRlVlckg3Ky82a29TeEJESHJr?=
 =?utf-8?B?T2s2VDJIU256S0M4cks1VDFDaTgxM25Id3B6blIwYTFhTCtCcEl0UTVvWU5L?=
 =?utf-8?Q?3Z7VW8AXbipw2c6fgeD9Inx0K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20C2637872E9484FB7575C591AC1A60D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1d09ba-a70d-4fe9-33c4-08de17bfc0df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 14:22:27.5036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PwQqPosJIdHq28MNQNf0H4RDeE4P3VdezwpS0oX06ZyLaUgR/K65CbbJjJp+Xorve6WD12gisEJEePdBp/er7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7891
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

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDIyOjMwIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEhvd2V2ZXIsIEkgZG9uJ3Qgd2FudCBhbnlvbmUgdG8gaGF2ZSB0byByaXNrIHJlYWRpbmcgYm9v
dDQyIG9uIHNvbWUNCj4gYW5jaWVudCBHUFUgKGVhcmxpZXIgdGhhbiBGZXJtaSwgZXZlbiksIHdp
dGggdW5jZXJ0YWluIHJlc3VsdHMuDQo+IA0KPiBBbmQgb3VyIEhXIHRlYW0gaGFzIHByb21pc2Vk
IHRvIGxlYXZlIGJlaGluZCBhcmNoMD09MCwgYXJjaDE9PTEgaW4NCj4gaW4gYm9vdDAsIG1vcmUg
b3IgbGVzcyBmb3JldmVyLCBzcGVjaWZpY2FsbHkgdG8gaGVscCB1cyBvdXQgaGVyZS4NCj4gDQo+
IFdpdGggdGhhdCBpbiBtaW5kLCBJICpkbyogd2FudCB0byByZWFkIGJvb3QwIGZvciB0aGUgZm9y
c2VlYWJsZSBmdXR1cmUsDQo+IGFzIGEgZ3VpZGUgdG8gd2hldGhlciB0byBsb29rIGF0IGJvb3Q0
Mi4gSSByZWFsbHkgdGhpbmsgdGhhdCBpcyB0aGUNCj4gd2F5IHRvIHRocmVhZCB0aGUgbmVlZGxl
IGhlcmUuDQoNClN1cmUsIGFuZCB0aGlzIGlzIGV4YWN0bHkgd2hhdCBpc19hbmNpZW50X2dwdSgp
IGRvZXMuICBJdCB0ZWxscyB5b3Ugd2hldGhlciB0byB1c2UgYm9vdDQyDQppbnN0ZWFkIG9mIGJv
b3QwLiAgSXQgaXMgdGhlIG9ubHkgZnVuY3Rpb24gdGhhdCBsb29rcyBhdCBib290MC4NCg==
