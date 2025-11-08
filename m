Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E25C42768
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 06:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E73C10E317;
	Sat,  8 Nov 2025 05:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WNBYE1vh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA36410E317
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 05:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUD+vXTRyh/JMB+Dgxa9etwTzfbO1OZyc4bJQdihneQR43maWkNnGG0+UvPDmx+vRtYGDFxd+J09Sc6y6Bja9jdXLidQ+bkq+aoSDMuNizkU/pfZMlxzlzE8GOQNOMBMLBcF/Znu5n4vXk2Hdw+YUihDeHifIunAZTAvlmL3A/Aq59Pd41Mq2rXQ1yNCftSVYBwJ3VE1rLO+NsfMWuJh9/Cqabfw96T/QhQf/iEkAo2UlwM7d7h+v3zRoeZFyVAWZEGf/M2NI6ox/9mI9Gl8/EnE2gtNJPCG1sQFqB66ery2x0wgZMknhk9fMrXYVkDE/+YXQF7rFLN5xEnTu39UHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xKEMeuIezP1nBmM9ByxF4YPGG/SozGlrH4MH79e1og=;
 b=soVoTOhy3ZzkIQaGSpMQ+OJCWXJhcGLM5z4IT78nvJQBHg3pZczql92YtQS240EF6LQe2Xkaf1Oc3qZb9YD7/Lhfm7v0YY5N3/BuAfZtJGXw9tiXfSLgbIDdRkcaqV1KbOCOERMVn4hGCvwMxwjHW4K6LC2/IAqyVAAPw8ELUHHa4DS13GjsramjeN3yDT47ZGvHOe3mMUaliLtax3ejbb5MPYsGWkwFH5UGi9Ra0kS+EJLPqhGmQNtVIweikpF0OB4AFCab2MyCl/D1iIK/Qtoz2ua78nETjfSkmb1hUpY8QwjXPIo6S7cOTFT8ilnms8/isBQNxZUjIgQrgQLrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xKEMeuIezP1nBmM9ByxF4YPGG/SozGlrH4MH79e1og=;
 b=WNBYE1vhylxYHS8KuCrKp/enR9vn8cucxmARr4XXK6z6lxlqjyqVYNb04FbjwNo+iR1FFCLhcHQnFI8WFL+I5DwXf3RWL2IqkS3VuBtxh5eIwNnu30VET7IjkUdilw7QT3v78QYXwspOM9b3qjCttxR99jznwJT4W6TyiApqnMVnfzVbEYI4VXD2alz4URCiCRLdULVEezykSfXSU5YYkCeoflzfPl7swmrat3BGnau6xtpSr3tlAxZERpyYNCGxT3EyOn6zlY1g7PAfaUOugzJ7eXhXBJr813u4CgnPoqAwJWz2vHi2u1Gqnd5B35afoOXKd3uZJ4BUJH4OH9xEsg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 05:03:53 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 05:03:53 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8
 type
Thread-Topic: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8
 type
Thread-Index: AQHcUGm4XHfVkDQe+kGD6KnInhYSULToOVSA
Date: Sat, 8 Nov 2025 05:03:53 +0000
Message-ID: <5342a0f10a3e9ef7d3165bd8912bd042ae7f68f5.camel@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-4-jhubbard@nvidia.com>
In-Reply-To: <20251108043945.571266-4-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SN7PR12MB7811:EE_
x-ms-office365-filtering-correlation-id: b4e817c6-8efc-4f6d-a05c-08de1e8436bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QzFUcmVuam5iYmNWTU56ZkdnY0Y2aWJvWW5XL09aMldRN0FWeS93SVdBclFD?=
 =?utf-8?B?S2xyNzlnWjNEUG8wTldNUWNjcUJEWnRibEdjWlA2MTlQd3MwSnY1N25XWEpm?=
 =?utf-8?B?Vi9Sa1VEcE1hcGJiSDNCWWFWSytiV2I2STR2c2tpOEQwa202dmFOTVV1THk5?=
 =?utf-8?B?OFFXTnBLTkpqcWxXUmlMaURUNEJtTU44ZVFEUWVBcXJuRUJ2c1U5WXcwQWx0?=
 =?utf-8?B?TUdoWnpMTHY1emR3OVd2amswYWZ6dXhhd0J1emhUMmZrSVJpNzNwa0o5WHJZ?=
 =?utf-8?B?R1E0K2FGLzVDL0hsU0FxTWFvakhqTFh5K04vRGVzTWxJWVRIVmpXdWkrWlN1?=
 =?utf-8?B?ZWdzcHVOVEtsN2xmYlNMalV1dllia3VvSURDQjBvMHQzK0NSV0s1UDNITjA0?=
 =?utf-8?B?emhXQkVVSkhzYnZKQ2prVEFGU05LWGlSRHl0VVliTEVMc3A2SW0xOXZPU0RB?=
 =?utf-8?B?dTB4M2dxdGVwd2RHa3VweTJuU2JMRzc3cXp6NzJyTi9PdE91ejBWZUh1OXVB?=
 =?utf-8?B?WHFOSm40cEFHTDIra012TFBRVldMM2xEanZldWpJSzFRY3R2azJSSGJUMnAz?=
 =?utf-8?B?MStMOXZDRHNqcXcwdHBzVlhFS0JFQmpGbHVqL3NXM29sRWpVM1RLWER3YjJT?=
 =?utf-8?B?NEYvNnYwdUlvV2Q2Ky80VE44Mit2Q1FkbmFtTzJCd1ZNSk1zMHdpbUlkL1BU?=
 =?utf-8?B?dFZXUHIrcUFleWNWdFNhQWl6Y0Z6SERBbUhPYWgyWmY0SEFnR3EwcjBUUmVH?=
 =?utf-8?B?T2hJeHBOajg0SUFzOWZQUUNuN1hQZEx2bER2ZzloZEdGcnIyeUNIazhDbW5T?=
 =?utf-8?B?UEVpWGxGa1ovVGkxa0tsV3RoT1Ard29KMXRrYi90OXQrV3NPc2M2R3VReVRZ?=
 =?utf-8?B?ZHVSL0I1amluV0c1R0hVWHB3RGVGVWtQdWVkNFhlTzEvTDZQbmNxYTJScGVR?=
 =?utf-8?B?U3J6OGY3ck9qZlc1WVZlOU5udzJLUGdKSDVCdTJWc0c5dWpqUEpLT1JGaUxz?=
 =?utf-8?B?TUIyTFh6QVg3dzdhTmtHdVArOVVuWGhadW9FZWdLQWRMUTFpcFFIMzF3K25O?=
 =?utf-8?B?czkxZ3RQSXNTN3J6ZUlwRkNNaW15WW1JSTMwWGtoMmxySGkxeUZVSWI3M0t1?=
 =?utf-8?B?T1oxaGs2YnBFSUNIU2JuMU1XMnFRZWFnOFp0OWRHcnhIcDVlSDN3OFhEaFRD?=
 =?utf-8?B?bUd6ay9zR3NtUXJqYXRhUjkzVmthNzdISGNmRC9vY1Vjd2RoTS96eEZQdVRs?=
 =?utf-8?B?eVpQMFNDU3J3ZU00Y3d0eEExMGlFcUpxSmVxbzhjVGlVekFCZGVGV3N2cWd0?=
 =?utf-8?B?bUY0bUcrRFJ4NzdjOWsrbmxOU2FKdURGUC9BSEx0SFVyR2NJRnhkZVd2WklS?=
 =?utf-8?B?QWdWVG5sb3k3Y0dDa2MrSVVWM3h0UDY0WjVOY3J6UzVjNEE3NGx6R28vaUFH?=
 =?utf-8?B?T0Z2RC9TcjhySWREOWkxdExYZFBleElsRmtkWWRrR2pvNVFEY2l1VzBralla?=
 =?utf-8?B?aXRDT1RGT1RRTWpkckNXM3N0UzVTbUgrN0ZzSVN6WWtJNDlVbmlxejZ2SEdl?=
 =?utf-8?B?TERVamxtdGNCblB2REtpL2tWNmNKaU1oanhOS1JRSXBLNEVTV1QwMkhHMDZ4?=
 =?utf-8?B?cStWNU4yUFRjN1pINm9nTlZvL2pVYm1MejRkQlpaejNQWnRCNTRBMkV3S3Jr?=
 =?utf-8?B?WUMyM0dvTk82YW4yM3NKOVJRZFlYWktBdU1qWVZxNWsyNTVXd1VNY2hLSmlN?=
 =?utf-8?B?WjVWYlJSMmRESm5ObCswQURyVlhnOEpTL2VVajliL3JWdnBBdzFFblBJNU1E?=
 =?utf-8?B?YjAvNU9JbytPNFhMMXlQcXlJdmJCNjROK0hnVENZZXp0dktNSWNJOStkS2Q1?=
 =?utf-8?B?VkhEenlCREh0TFhtQ3BLMm0wTFFTcVR1Z0pxZkJDemV4b2R2Y0pvTy9MbWRV?=
 =?utf-8?B?bk81Smh6REt0dFQ3bmlHaHBGai9raGV5VkRnYWNscWVzNStSZm1kV2FvUzdq?=
 =?utf-8?B?ekpmbHMrckl4eHkyM1ppNlRleXVoTldqMEZJcGNseXhYRUFnRnN5K1NPdk84?=
 =?utf-8?Q?YtINES?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEUvbTRUQVZKSHp2eUNCZ20vWDJVbmx4TzJIU3ZPYnhsemc0cmtZWGdVUjlL?=
 =?utf-8?B?bzJSWXdvSnBaWkNyZmJRSHNXcnZ0dEIzTDJhcVdMTTZHc2lRK0lCSVFWQllE?=
 =?utf-8?B?R0poYy9GTEUvWHJDUzdtdXBKV0IvM2tTUk94bnZnaEpabTdmQzd0ekYyanBq?=
 =?utf-8?B?Vmg5WUhQU25Wb0J6ajJ3MFNtWG1Ha1AyNUFUWVY5NTlCR3hqVE1VUGtXZ3py?=
 =?utf-8?B?aUJQR2FMcDdGa1kwTjFqcFRhSlFwWFhlanV0QU9FaGxOZUMwMitOd3V3WnNE?=
 =?utf-8?B?Y1l6VkhqZE1WZUluMFRtSmZWWC94b3ErbkFXc2syS3F4Vy93Y1IycStHcnJM?=
 =?utf-8?B?NG8zLzEvQ3BiR09RZmRhZDFUa21nbm5KRUdOY1FJNzZ2K0ZUYTZaeXRRNkNS?=
 =?utf-8?B?bHJTNXo2R28vRmFHQ29PdTA0NUZyOXYxdDB3SlFMWEU0VitFVWR5SVk1YVNE?=
 =?utf-8?B?MGJpMk52dTFiWEsyNFIySkVwbExoejRsUk1Pa3h6QzQ3RnFGdGdXYXRMUDNI?=
 =?utf-8?B?b1d3TGJRSFlFWGYxM0dnMWVhdnNLd0YxQmVkZDF1bVZPdkhOMnBpWGxPYWw4?=
 =?utf-8?B?MWxaT3VSTVZhYVkvcFpSRTdGZmRTR0VFVENFOTZ4WDl5T2t4TmRkZmJ1Qy93?=
 =?utf-8?B?cTN1VVBDbDB3dDJBbDBoUFVxN2s4KzlCSzRMZFVvZjl5Q05BUGhGalBMb2Qw?=
 =?utf-8?B?TVJUNGJqOGV3dFE0RW91RFBnajFEZkpXTDE3c2gwY040ZDZUNExnTFJjbFVV?=
 =?utf-8?B?VkdnYXVtSTVWUENzdGhacGpDWnJheEVaNzZnTjJhWmpibjQ0akhuNk04V0VW?=
 =?utf-8?B?U1lVZ1lramRPaEtabS9zcnNlcHArWXk3aUt2eERTVGI1TWx3UGxUSUFsOUpT?=
 =?utf-8?B?MDA1dUxYN0NvbGp4ejJ6cWRxZG1TQWt3K0hNZ28yUWhWZm93cmFzb2c4YlB2?=
 =?utf-8?B?bFR5c3lpb2tmc1NLa0gzb2dNWXlrZGpPTDFaWXF2L2lrcDdJdWhuYWZRa1VH?=
 =?utf-8?B?Y3ZEcGNGaUhaTXcvbnJDKzBVTWZqK1J2VXdsVjJCbzQzNzgxM3dxZGFybExG?=
 =?utf-8?B?TDZDcGEyMmpheHJvcTE5anQzOHcwaWYzUFF4Y1lkeGJZUW5yd0Z4SEhLclEy?=
 =?utf-8?B?dUdiN0wzeWRqM1A4ajdia0Z5VHROSG92angvMGNZN0djWE9kZnNCYk8xL2FC?=
 =?utf-8?B?Q0ZZM0I2ZDYwOTlUR2FMdEk2aXp6U0w3bm0zWlpBQ1c5MW1GRjROZHA1dlRm?=
 =?utf-8?B?bGtRMURCaytUQ1lHVlQzcGo0M29uMkFFL0NvTFJxZWhua0dkTk1Qd21GN2Ji?=
 =?utf-8?B?VXdUa1FlUzhEKzFDRC85QWYwNmRtS3I5N0ltdjNLMEZiemdBTGdtcmVBME9o?=
 =?utf-8?B?bkZDamE4dWVTUnF1ZVFpT3ZuK2ZqTkNUcis4cEUzSnRrY0lteXMwYTVtM2xZ?=
 =?utf-8?B?THJ1SGoyVElzYk0zK1VRS0NrY2QrcnZMaWFYMk5MYUY0U3o3QWFTaDZ0dW1M?=
 =?utf-8?B?cW9zUmVIVnpLYkdTRm1aZ0RCTW95aXd0c3ByT1FFZWNLdW4rbFFJZWtaa2VC?=
 =?utf-8?B?cGRxUjNBd2o5WVdvNjRDQXZOOWZZaDB0VStsdzR3UDZ0Vy9UK3lpU2lXaFlB?=
 =?utf-8?B?SXBYMWZpUzh6dVpvNEd0UmJOR2x3Y2ZJUUNqN0NUa3R4RVRPc2RjTWlHTkc1?=
 =?utf-8?B?bVdXUkpjaXhSQ1hHSkFNNTNkSyszNnVKVnEweXlDV3lSdmsxUVpkanJCWHV6?=
 =?utf-8?B?ZkVmR2RlK1dvNmszSUZ6MTB2bWI1TmtqYW9EMHpqS0VXanhYcTJYbEZnTUl3?=
 =?utf-8?B?bFYvTFVMRlAyanRRMmMySWlDYWorWmJxaVJ0Q1hwQUVpcjYvOWFsUExvdkNB?=
 =?utf-8?B?TmQzQmZiRTBoMFJGcWoyR0U3UGI0SlNQNVpoSVd1cXliTGdDSUFpajJYR3Qv?=
 =?utf-8?B?WEw2OUZsRGFRZ3p1SElSZm9YVWN5L3hVVkdHUXpEaTl5QTIyVm4xRzNMRlY0?=
 =?utf-8?B?Yy9CTnhFVzVaS3ZFSDhhZFprQVk2c1dGN0NicDZxUjVhMHZ3cUxDbVhETmpW?=
 =?utf-8?B?UkVYdmV4Q0s5VlJKTjdUNEZEcGllcWhIQzRyRWsvdDM3SHlXc0E0bHhjSFJJ?=
 =?utf-8?Q?omoE3T+JSlic8PE342Y9RMqpb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F19EB3AC50823A43BE56999A86703746@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e817c6-8efc-4f6d-a05c-08de1e8436bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 05:03:53.5490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILYbTUB0KhERs36Xdm8ul7jnronibrR1f2ZuhWTI/1+TWfa96NUQ2Cdg7mCzucJSvvk0d36PTzo/WXZualw8Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811
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

T24gRnJpLCAyMDI1LTExLTA3IGF0IDIwOjM5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IMKgLy8vIEVudW0gcmVwcmVzZW50YXRpb24gb2YgdGhlIEdQVSBnZW5lcmF0aW9uLg0KPiAtI1tk
ZXJpdmUoZm10OjpEZWJ1ZyldDQo+ICsjW2Rlcml2ZShmbXQ6OkRlYnVnLCBEZWZhdWx0LCBDb3B5
LCBDbG9uZSldDQo+ICsjW3JlcHIodTgpXQ0KPiDCoHB1YihjcmF0ZSkgZW51bSBBcmNoaXRlY3R1
cmUgew0KPiArwqDCoMKgICNbZGVmYXVsdF0NCj4gwqDCoMKgwqAgVHVyaW5nID0gMHgxNiwNCj4g
wqDCoMKgwqAgQW1wZXJlID0gMHgxNywNCj4gwqDCoMKgwqAgQWRhID0gMHgxOSwNCj4gQEAgLTE0
Miw2ICsxNDQsMTMgQEAgZm4gdHJ5X2Zyb20odmFsdWU6IHU4KSAtPiBSZXN1bHQ8U2VsZj4gew0K
PiDCoMKgwqDCoCB9DQo+IMKgfQ0KDQpEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZGVzaWduYXRlIGEg
ZGVmYXVsdCBBcmNoaXRlY3R1cmU/ICBUdXJpbmcgaXMgbm90IGEgZmFsbGJhY2sgZm9yIEFtcGVy
ZSAtLQ0KeW91IGNhbid0IGJvb3QgYW4gQW1wZXJlIHdpdGggVHVyaW5nJ3MgSEFMLiAgQWxzbywg
d2UgZG9uJ3QgZXZlbiBtYWtlIFR1cmluZyBjYXJkcyBhbnkgbW9yZSwgc28NCm92ZXIgdGltZSwg
VHVyaW5nIHdpbGwgYmUgbGVzcyBhbmQgbGVzcyBjb21tb24uDQo=
