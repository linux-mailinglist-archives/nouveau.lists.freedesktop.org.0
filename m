Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0340FC294AE
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 19:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF8610E076;
	Sun,  2 Nov 2025 18:14:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d5V9T9BA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013037.outbound.protection.outlook.com
 [40.93.196.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2C210E076
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 18:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SomQNwsi2XHWK7p/y93SnW/7PKCnyYYUxLZbGaxpoVm7xOAnPz5JorHYTWc7HvGx7pTm3vsdGv1UnrhPTBIIj4uTG44zLAixGJgTYzbd4qxaugijpnA3/tpBhZqb0k5okTXMXBdhH7c0gSafk+7bEcdEHcmpYM7qIBvimLfLS3CjQWZe8Q4HWehRU2mE+R7c4ZI2srCp2PSPjQk+zQDIoocb+Nmq+tZI5hDbOkdJx305r9HyVPSCuY6xRamPkFS5Z1j2DTsml7P155iZY5gF4gKxkjc/DLIJKLKIJONjtbRWIObEsuO/JsI9prW1b5kh1rXUWCrI5klAgE/JlykdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mEvnOFltxW+bCzMR9G3AzzzC4YHRA5VJi4Ld8w6+4kc=;
 b=V9e4c5os55Xq9wg1kDomOf3p1FakLMk3Y8al0SRH2oRVl70ATXsv9MQzs1g3MbPa4nDqe5cDdHss++nnIxVIktcEi9ZmuSQ4xTmoVnEnsqL8VPrtku2kdkNjfg5UCnHBJh7ObzWbgrXK85OtKqXMULJTtN/Dr97evjEdfi0/BfjDOoUVgRYJbSsGx3AFn2DAHoHLXm3ggv4nwoRABgB0H8KbZymWx/vaY/592+3vWGf3mAcM10DfskHxfkzdaL34nF+g2C/aTCYPHqJ2s8GRjGi5eeG3fALvWg7rnvf4HPW8XgOJVMjQG4tKonSFNN8LFWXSqBFZo/EKdhmuaSHcCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mEvnOFltxW+bCzMR9G3AzzzC4YHRA5VJi4Ld8w6+4kc=;
 b=d5V9T9BAWCmSiN9fRwurqv34prjzmUgIf0nspqZVtrc1Tar7XMQjZ7VjAIcpEJppJNh+ZzEoFSD94JEygAOYt3XKh6YDeuwpP4mA66vGHEwy2ESazrXMr10iARSKXaMSSBBZI2iLISXdyZX+JBhd0dNnqCmNwEJDzackcIRNDDSIt98xgNXLon7P17SFvGfDMdJssAym/SDvQpCEsniKAV5+4qFJzdQESFa2cC7UF/MxoDK2kAOdUN4dr1ZnkJfTxquOoTK2rHxc/yTE5ywxIc9/DQU53YM5hH5M+yJARY9GX2ovGK6412fh+MupyusiLOxBr9lrIPG6hcQHt+VltQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Sun, 2 Nov
 2025 18:14:30 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 18:14:30 +0000
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
Subject: Re: [PATCH v4 3/3] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Topic: [PATCH v4 3/3] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Index: AQHcS5kvDmmWDWjtwkmv1WTC8DlzqbTfsdyA
Date: Sun, 2 Nov 2025 18:14:30 +0000
Message-ID: <4c6df1aa00dab5b7e2a43c952180fc74e40f146a.camel@nvidia.com>
References: <20251102013656.423235-1-jhubbard@nvidia.com>
 <20251102013656.423235-4-jhubbard@nvidia.com>
In-Reply-To: <20251102013656.423235-4-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB6000:EE_
x-ms-office365-filtering-correlation-id: 5621c26c-b2a7-47f9-45c5-08de1a3baaba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aGF5WFZTZ0dhaFpqVGtESVV3VXBzaUJRdzFJYWNhSVlPQzlHQlJHL1luZCty?=
 =?utf-8?B?dy8rQm9yaTFOY25MdWRoQ3pCVVFZVG0zRUNMYUtuWW5JdEJsYUVZZU1EZjYx?=
 =?utf-8?B?TzJUV0pEWW0weTRWeG1wZVpsNytuQTVMdUpCakFiMHloL1kreThkTTA3OXdE?=
 =?utf-8?B?S0I3ckJ6aG9vUjdQL2FIZjcyWGN4eG9Qckw5Tlc4ZXQ1dnZGYjJXcnhmdldU?=
 =?utf-8?B?cUt3emRZS2pkbTVLWXpsK0I2YXFLaGNoSDZtY3V3U29lZlArQXFOWHdkNWpR?=
 =?utf-8?B?TGY3NXRRQUhyQVNwdGE5TVZ1QUZGTHpVNVEyeEhDL2h4TjdTM0FCaDF4bmYy?=
 =?utf-8?B?M01mbnZkRk5KS2pqV2hnQVI3aHJUbXNnVWN1OU9leURLeUdmV1ZjenN0YnFi?=
 =?utf-8?B?TWJZNDhVOXYvQVBFSTc3bTNQUzNqV3lOQ3ZlVFdoZDRpTlEvRlJvSVFTcEdt?=
 =?utf-8?B?SXFDZlNrd0JMTHlGTjRWOGpqazVJSVBaOGdiVU1lTFM2cTJQNCtDeVNUSzFx?=
 =?utf-8?B?RXUzazhsMks1eHdwejBOQmtOZThjUUNoOWg3Umc1OEhvNkVtYmdGZy9HTjla?=
 =?utf-8?B?SDBBTkhIVHdUNzdxVDFuRzExSTVRR0x3cUJRUHo2ejNRSGFYUndTMGt6b0l2?=
 =?utf-8?B?YUhpbEpzbExwQVVpb0FiYlJad0xMOWRqbkhWcUV2NGgxdTBLdlRDWE5MeEFs?=
 =?utf-8?B?M2lnNEEwek1HbE1WbWRqVFpPQWk4ZzFzcDYzYm82RU1td1dWLzRYQlgrb0d5?=
 =?utf-8?B?RWQxb2Z5WGtmTlJpU0lIMDVVLzNjZkVOVUZvSUVuVFN4WVg1ZzNLQVN2TStr?=
 =?utf-8?B?Q2IxUWtrSDRUUkltbDhieW14QXNMTzhNb0t5WnBhamlZYjdncjVwRSttaHN1?=
 =?utf-8?B?UXFQWDJVem1zdFQ0anh6Q1pnOXVsRHpDZnoyWG0zalBBSFpoaW5FQ2tCWlBN?=
 =?utf-8?B?WmtHaytiZkFURkU2MEJES2ZHZTlGaExHazl4WEc3RFdaaWpNK0xhQmdaTk1w?=
 =?utf-8?B?R0FMWWh0bjBVMWY1N3o0SXNEQXdybDFKWlkrdGx0THZsUVlsVFlYVTNJS1VL?=
 =?utf-8?B?TkVHdlBDcStJYnE3ZjRESzFFQXhRcHZaMzVFNjRBOUZVbGtaODMrQWNRQS8y?=
 =?utf-8?B?U0hLaFllN1I4UnhzcDQvZlhzaW5oTkt0SEJNb2pwTm1GK1hMbTQwOXR5ZXVo?=
 =?utf-8?B?V2tFdU92S0RiMXQvVDhWVnR1aXpJQnJoMTh4NmR3b3ZCa1haOWVxbGdXZTZi?=
 =?utf-8?B?YzhETmZ4N3g1ZkRTNmkwOFhtVE02Y2xHeEJDYi82RDdnbHM3bnNhZW5Hc2FO?=
 =?utf-8?B?dVhlTWkwNXE1ekh4THlQNTVPUWsvSUZraSszdnF0SWd0d0RZbS9vc3FRRXp5?=
 =?utf-8?B?Y0l0MXEzZDdWS2FKOXhIc2MyOFBjenNhN0h4eWJJNkwzM2ZZdHpmUTZEa2ZM?=
 =?utf-8?B?MkM5QklSYkExRWErN0RDUTIzczRUOUUvRXR2MDhFUlN5SEc2bWlwMHIyTFVG?=
 =?utf-8?B?TEliTTNjeW5CR3c2RXp4K2lXUHRxTVNWNVJXV1BlTHcydHhrR0oxd1Z0U2J6?=
 =?utf-8?B?UDZBWWFmc0FQUTkzZjF3eDRuY2FtMXZrZDNzNlNLNzg2ZjRDRXZZeVRkdjFr?=
 =?utf-8?B?TmFUQmJpeWJ3QlB4K1RwOEdHaXZMTDNkVkhRQ2R1MjFJWFFWRWNmM3dlZnhO?=
 =?utf-8?B?VVBYcUwyeW1MM1ZRVE5xY0RuRWpna0VIUEJxRXFCdi9GS3RIM1RoZm4yektp?=
 =?utf-8?B?RVZEMVNEYTl3bHNqZEVmWXU3ZGZDTTEyQXo5VHRWSEJGZjNjT3JqVTZFOEl6?=
 =?utf-8?B?ZVcwdFlqZE5kNVVhYnNFSzVYZk5LSWdTNmtwQXNBNTZ5TU1oMk9CcmdOR0pi?=
 =?utf-8?B?WnJuZVJWQ1dMZGF3Y3Q2dWVXN3FCbXFYdTBKa2hMM1gvb2JrdVdUWmV1b1NK?=
 =?utf-8?B?UlRrbEVYbG0vU3VCTVo4Z1RVcWFHSG81SDRiTWVqck5Fd1JNcWk4c2UxdkJ1?=
 =?utf-8?B?dGJvMEh0OTJDeUt4cG1uL21Na1pHMCtGNlc4NC9vUlJ4NHQwSTZSa3p1d09C?=
 =?utf-8?Q?XB4BsP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1ZweEcreDRSWkpDTUFlUDlnR1NGVlF3bHVDZjFOYTRwSWJkd2FqK0dFU0JQ?=
 =?utf-8?B?MUVaK3FqbC9PMm8zMG9uT0hMM2w2elo0U3E3aithbjZ4TzhvcWV5UTlzUmZM?=
 =?utf-8?B?SWVvWS9rNGhnWDJSK29XcVF0YVNRSk80SHJ3ck9vQnFZZ0thVzRTalpjbVM4?=
 =?utf-8?B?ZzNnMFo3QTFUZVpDbE1kZjBuS1duVGI3R1hhTUMveFBKNkMzUGlQNFBHKytk?=
 =?utf-8?B?N2phREdNTE5YblBJZ255L2t5TW9YRmR5ODJMejNML0hMajRXQVpuVEdSbGwy?=
 =?utf-8?B?R0lRdE0ySjFwcE9vTzBPbmlPM2c0UEpoSGErUExwZERvbjlpMVhkbmFMZ2tN?=
 =?utf-8?B?L0RFTndGYlo0SFJSSm9lY1NtWTdxVzZzWGJYRXRQV2hhaitnTXRPMHplR3RP?=
 =?utf-8?B?ejFWcUw1ZUZFemVjdit4QjhDWFN6enpxamg5dmtncXNlbll3eTQycmpNNGI4?=
 =?utf-8?B?Z25NWCtISEt2ZVdIODAyRnJwa2YvVVFjMDg0OXJISlo5eldhQXRTSmFUOWZv?=
 =?utf-8?B?RjIvSXRXdEhhTkpCQmJmYTlqajRKS01lUEo4U2RmSjh2azZvRHNzV0IveVYx?=
 =?utf-8?B?VUJhZWZMNFVvK3BwaS9WcG1tL2gyaXV2T1psa3crOTMrLzNqelpEejRnVU93?=
 =?utf-8?B?V3l5SmprSTkyWVZ6RXlOYXlRYktNT0xMQStod1JpUGhVNWl4emYyNWFZNHVr?=
 =?utf-8?B?cHNDTWk2Z1NaOUhHbEVnYTlwK3IrY2pEd2N0aTMxbU8zMUV1UjJ3MGFMZ3NM?=
 =?utf-8?B?SnhiL2FQekUxbVpyMVpwSXlqKzVLMVVmeVFsaDFzdDJ3TkxZQ3RNY0xseGF3?=
 =?utf-8?B?SmRkNmJIVy9uZXhPYkEvcGZIMjV3WVNzZVFmK3B2MVJPcVdvZTFIbjRLV1Nz?=
 =?utf-8?B?ckNrU3hrWlRvUWJSYzloZ1ZpQnQxVnVXdi9tSUdWMWxOOVVSTzNBOXhFKzRN?=
 =?utf-8?B?ek05U0ZOWGxzemFVN0hIN25YOEdIZ1F4cjAxRGpGWm1oZ1B0Z0tScUk2UG1G?=
 =?utf-8?B?MFBhZTJCTnJvNjAzakZ1SndMWm1GZkpuSFh0MjhLRmpIOEFyWHVic3EyL3Jq?=
 =?utf-8?B?blR1aitRc29GZnI2bW5ic1RWY296dUc0L3RSUWZDYnJoVWRmUmZlVFpublpw?=
 =?utf-8?B?QUZhbUZPdER0MFNPWCt1WDRTb2VwQmlXQWlHUGVzZG51LzhpYnVwMTFaU0lU?=
 =?utf-8?B?VjZrN1g5aUxRZ0ViN1RzYjZPYzFyNEVzTFZ1V1FGQmdzMnlUcERSYUE1NS82?=
 =?utf-8?B?b2pTc05JY1c2N0J3NlpWL2lZMXloUjJneHFrK2RXVGV3WDRGNWVEQUQxQTJn?=
 =?utf-8?B?WGhEZWs2Qk53VDRGenpES3hVR1ZHOHhyS2dzYzhxd01GbE9BUiszWmhkcHlJ?=
 =?utf-8?B?SzRVb2hCZ2hoTVdnRS9JK1Z6SldVV2RkbnZ5TEUraW5sd3MzNE1VN3BBckR2?=
 =?utf-8?B?eHBIck91eEdFNTFPRW9lRlY1ajFlYUVaVGRrbHlzTXNsb29jckY5L1c2bFdh?=
 =?utf-8?B?eGJlY0NCcnRRb2VFbG5IdVROcnVJOG9zRnhYMWx5dGgzRnMwOXFVSHVvSXBN?=
 =?utf-8?B?bUtoSGVueEZVdG1xYkxyYlZwclBPT0M2WVh2RkxLUlJSUXZKNWhLaDc1UE16?=
 =?utf-8?B?WGFMb1RONU9qZnpodkptN2RlZU4wRUp1Rk1ZVkdoejd2SExRVmRnNU1wRVo4?=
 =?utf-8?B?c3l3RGNSYjRBRTMyN3N1VHh1TVNLNVhRZmhGbnVlSHV2Q3dZQ0cvK1NOaEJ3?=
 =?utf-8?B?UzJkSWE2YThSaXFqeUdISk1PMWU2NVByY2tWY2hCTWx0ZWlXcXIyM1VFekNj?=
 =?utf-8?B?L21HTGJndjlOOXVOTm1zVytSWmlTV296L09aR2tJT3FGdzZTSGNOSWY2dS9X?=
 =?utf-8?B?eXBXNmdxNDNFemhUNTVBREhOWVMxRHk1c2xKMHZqUDVGcll0eHZ1b1BMY3RO?=
 =?utf-8?B?NTlNdGdSVkN0T2VGRkJocVJ0eHAyTHI4Nk5kSkl2amZkQ1hzdmlqSkRadERz?=
 =?utf-8?B?dkk3L3dRbWpjR0NUSUI4eUpCQnN4Vzl2N05CWXVhQnpGZklSd1h0M2htU2J6?=
 =?utf-8?B?c0hKelorMXRBNWkzaWVaeGxLTUlmUm51NXJlb3VjU2lHbThiZW9kbFJWVnkz?=
 =?utf-8?Q?8Pn1KwZM6CDyDKYHYIUq42XLu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5831CFDA5685E0499FD4C9473A3C1194@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5621c26c-b2a7-47f9-45c5-08de1a3baaba
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2025 18:14:30.2776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7oiRIRSv0BmIyegBP7k3iBlW2R/2sUOd4NfnJN5tMZXIb9XuGH+7OOEvY9+USF9t0W5sjGMt+HGpNvsu7YN5Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000
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

T24gU2F0LCAyMDI1LTExLTAxIGF0IDE4OjM2IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE5WSURJQSBHUFVzIGFyZSBtb3ZpbmcgYXdheSBmcm9tIHVzaW5nIE5WX1BNQ19CT09UXzAgdG8g
Y29udGFpbg0KPiBhcmNoaXRlY3R1cmUgYW5kIHJldmlzaW9uIGRldGFpbHMsIGFuZCB3aWxsIGlu
c3RlYWQgdXNlIE5WX1BNQ19CT09UXzQyDQo+IGluIHRoZSBmdXR1cmUuIE5WX1BNQ19CT09UXzAg
d2lsbCBiZSB6ZXJvZWQgb3V0Lg0KDQpZb3UgbWlzc2VkIHRoaXMgb25lLiAgQm9vdDAgd2lsbCBu
b3QgYmUgY29tcGxldGVseSB6ZXJvZWQgb3V0Lg0KDQo+IA0KPiDCoA0KPiAraW1wbCBUcnlGcm9t
PHJlZ3M6Ok5WX1BNQ19CT09UXzQyPiBmb3IgU3BlYyB7DQo+ICvCoMKgwqAgdHlwZSBFcnJvciA9
IEVycm9yOw0KPiArDQo+ICvCoMKgwqAgZm4gdHJ5X2Zyb20oYm9vdDQyOiByZWdzOjpOVl9QTUNf
Qk9PVF80MikgLT4gUmVzdWx0PFNlbGY+IHsNCj4gK8KgwqDCoMKgwqDCoMKgIE9rKFNlbGYgew0K
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGlwc2V0OiBib290NDIuY2hpcHNldCgpPywNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV2aXNpb246IGJvb3Q0Mi5yZXZpc2lvbigpLA0KPiAr
wqDCoMKgwqDCoMKgwqAgfSkNCj4gK8KgwqDCoCB9DQo+ICt9DQo+ICsNCj4gwqBpbXBsIGZtdDo6
RGlzcGxheSBmb3IgUmV2aXNpb24gew0KPiDCoMKgwqDCoCBmbiBmbXQoJnNlbGYsIGY6ICZtdXQg
Zm10OjpGb3JtYXR0ZXI8J18+KSAtPiBmbXQ6OlJlc3VsdCB7DQo+IMKgwqDCoMKgwqDCoMKgwqAg
d3JpdGUhKGYsICJ7Onh9Lns6eH0iLCBzZWxmLm1ham9yLCBzZWxmLm1pbm9yKQ0KPiBAQCAtMTY5
LDkgKzE4MCwzNCBAQCBwdWIoY3JhdGUpIHN0cnVjdCBTcGVjIHsNCj4gwqANCj4gwqBpbXBsIFNw
ZWMgew0KPiDCoMKgwqDCoCBmbiBuZXcoYmFyOiAmQmFyMCkgLT4gUmVzdWx0PFNwZWM+IHsNCj4g
K8KgwqDCoMKgwqDCoMKgIC8vIFNvbWUgYnJpZWYgbm90ZXMgYWJvdXQgYm9vdDAgYW5kIGJvb3Q0
MiwgaW4gY2hyb25vbG9naWNhbCBvcmRlcjoNCj4gK8KgwqDCoMKgwqDCoMKgIC8vDQo+ICvCoMKg
wqDCoMKgwqDCoCAvLyBOVjA0IHRocm91Z2ggVm9sdGE6DQo+ICvCoMKgwqDCoMKgwqDCoCAvLw0K
PiArwqDCoMKgwqDCoMKgwqAgLy/CoMKgwqAgTm90IHN1cHBvcnRlZCBieSBOb3ZhLiBib290MCBp
cyBuZWNlc3NhcnkgYW5kIHN1ZmZpY2llbnQgdG8gaWRlbnRpZnkgdGhlc2UNCj4gR1BVcy4NCj4g
K8KgwqDCoMKgwqDCoMKgIC8vwqDCoMKgIGJvb3Q0MiBtYXkgbm90IGV2ZW4gZXhpc3Qgb24gc29t
ZSBvZiB0aGVzZSBHUFVzLmJvb3Q0Mg0KDQpEaWQgeW91IGludGVuZCB0byB3cml0ZSBtb3JlIHRo
YW4ganVzdCAiYm9vdDQyIiBhdCB0aGUgZW5kIGhlcmU/DQoNCj4gK8KgwqDCoMKgwqDCoMKgIC8v
DQo+ICvCoMKgwqDCoMKgwqDCoCAvLyBUdXJpbmcgdGhyb3VnaCBCbGFja3dlbGw6DQo+ICvCoMKg
wqDCoMKgwqDCoCAvLw0KPiArwqDCoMKgwqDCoMKgwqAgLy/CoMKgwqDCoCBTdXBwb3J0ZWQgYnkg
Ym90aCBOb3V2ZWF1IGFuZCBOb3ZhLiBib290MCBpcyBzdGlsbCBuZWNlc3NhcnkgYW5kIHN1ZmZp
Y2llbnQgdG8NCj4gK8KgwqDCoMKgwqDCoMKgIC8vwqDCoMKgwqAgaWRlbnRpZnkgdGhlc2UgR1BV
cy4gYm9vdDQyIGV4aXN0cyBvbiB0aGVzZSBHUFVzIGJ1dCB3ZSBkb24ndCBuZWVkIHRvIHVzZSBp
dC4NCj4gK8KgwqDCoMKgwqDCoMKgIC8vDQo+ICvCoMKgwqDCoMKgwqDCoCAvLyBSdWJpbjoNCj4g
K8KgwqDCoMKgwqDCoMKgIC8vDQo+ICvCoMKgwqDCoMKgwqDCoCAvL8KgwqDCoMKgIE9ubHkgc3Vw
cG9ydGVkIGJ5IE5vdmEuIE5lZWQgdG8gdXNlIGJvb3Q0MiB0byBmdWxseSBpZGVudGlmeSB0aGVz
ZSBHUFVzLg0KPiArwqDCoMKgwqDCoMKgwqAgLy8NCj4gK8KgwqDCoMKgwqDCoMKgIC8vICJGdXR1
cmUiIChhZnRlciBSdWJpbikgR1BVczoNCj4gK8KgwqDCoMKgwqDCoMKgIC8vDQo+ICvCoMKgwqDC
oMKgwqDCoCAvL8KgwqDCoCBPbmx5IHN1cHBvcnRlZCBieSBOb3ZhLiBOVl9QTUNfQk9PVCdzIEFS
Q0hfMCAoYml0cyAyODoyNCkgd2lsbCBiZSB6ZXJvZWQgb3V0LA0KPiBhbmQNCj4gK8KgwqDCoMKg
wqDCoMKgIC8vwqDCoMKgIEFSQ0hfMSAoYml0IDg6OCkgd2lsbCBiZSBzZXQgdG8gMSwgd2hpY2gg
d2lsbCBtZWFuLCAicmVmZXIgdG8gTlZfUE1DX0JPT1RfNDIiLg0KPiArDQo+IMKgwqDCoMKgwqDC
oMKgwqAgbGV0IGJvb3QwID0gcmVnczo6TlZfUE1DX0JPT1RfMDo6cmVhZChiYXIpOw0KPiDCoA0K
PiAtwqDCoMKgwqDCoMKgwqAgU3BlYzo6dHJ5X2Zyb20oYm9vdDApDQo+ICvCoMKgwqDCoMKgwqDC
oCBpZiBib290MC51c2VfYm9vdDQyX2luc3RlYWQoKSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNwZWM6OnRyeV9mcm9tKHJlZ3M6Ok5WX1BNQ19CT09UXzQyOjpyZWFkKGJhcikpDQo+ICvC
oMKgwqDCoMKgwqDCoCB9IGVsc2Ugew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTcGVjOjp0
cnlfZnJvbShib290MCkNCj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4gwqDCoMKgwqAgfQ0KPiDCoH0N
Cj4gwqANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9yZWdzLnJzIGIvZHJp
dmVycy9ncHUvbm92YS1jb3JlL3JlZ3MucnMNCj4gaW5kZXggMjA3Yjg2NTMzNWFmLi44YjVmZjM4
NTgyMTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9yZWdzLnJzDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9yZWdzLnJzDQo+IEBAIC0yNSw2ICsyNSwxMyBAQA0K
PiDCoH0pOw0KPiDCoA0KPiDCoGltcGwgTlZfUE1DX0JPT1RfMCB7DQo+ICvCoMKgwqAgcHViKGNy
YXRlKSBmbiB1c2VfYm9vdDQyX2luc3RlYWQoc2VsZikgLT4gYm9vbCB7DQo+ICvCoMKgwqDCoMKg
wqDCoCAvLyAiRnV0dXJlIiBHUFVzIChzb21lIHRpbWUgYWZ0ZXIgUnViaW4pIHdpbGwgc2V0IGBh
cmNoaXRlY3R1cmVfMGANCj4gK8KgwqDCoMKgwqDCoMKgIC8vIHRvIDAsIGFuZCBgYXJjaGl0ZWN0
dXJlXzFgIHRvIDEsIGFuZCBwdXQgdGhlIGFyY2hpdGVjdHVyZSBkZXRhaWxzIGluDQo+ICvCoMKg
wqDCoMKgwqDCoCAvLyBib290NDIgaW5zdGVhZC4NCj4gK8KgwqDCoMKgwqDCoMKgIHNlbGYuYXJj
aGl0ZWN0dXJlXzAoKSA9PSAwICYmIHNlbGYuYXJjaGl0ZWN0dXJlXzEoKSA9PSAxDQo+ICvCoMKg
wqAgfQ0KDQpTbyB0aGlzIHdhcyB0aGUgY3J1eCBvZiBteSBpbml0aWFsIG9iamVjdGlvbiwgYW5k
IEkganVzdCBkb24ndCB0aGluayB0aGlzIGlzIHRydWx5ICJmb3J3YXJkDQpsb29raW5nIi4gIFRo
ZSBjb2RlIGlzIHVzaW5nIGJvb3Q0MiBvbmx5IGlmIGJvb3QwIGlzICJ6ZXJvZWQgb3V0Ii4gwqBT
byBzb21ldGltZXMgTm92YSB3aWxsIHVzZQ0KYm9vdDAgYW5kIHNvbWV0aW1lcyBpdCB3aWxsIHVz
ZSBib290NDIsIGRlcGVuZGluZyBvbiB0aGUgR1BVLiAgSXQncyB0aGlzIGluY29uc2lzdGVuY3kg
dGhhdA0KYm90aGVycyBtZS4NCg0KSW5zdGVhZCwgSSB0aGluayBOb3ZhIHNob3VsZCB1c2Ugb25s
eSBib290NDIsIHNvIHRoYXQgd2UgaGF2ZSBjb25zaXN0ZW50IGluZm9ybWF0aW9uIGFjcm9zcyBh
bGwNCkdQVXMuICBib290MCBzaG91bGQgb25seSBiZSB1c2VkIHRvIGF2b2lkIGFjY2lkZW50YWxs
eSByZWFkaW5nIGJvb3Q0MiB3aGVuIGl0IGRvZXNuJ3QgZXhpc3QuDQoNClByZXZpb3VzbHksIERh
bmlsbyBzYWlkIHRoaXM6DQoNCj4gSSB0aGluayB5b3UncmUgaW5kZWVkIHRhbGtpbmcgYWJvdXQg
dGhlIHNhbWUgdGhpbmcsIGJ1dCB0aGlua2luZyBkaWZmZXJlbnRseQ0KPiBhYm91dCB0aGUgaW1w
bGVtZW50YXRpb24gZGV0YWlscy4NCj4gDQo+IEEgc3RhbmRhbG9uZSBpc19hbmNpZW50X2dwdSgp
IGZ1bmN0aW9uIGNhbGxlZCBmcm9tIHByb2JlKCkgbGlrZQ0KPiANCj4gCWlmIGlzX2FuY2llbnRf
Z3B1KGJhcikgew0KPiAJCXJldHVybiBFcnIoRU5PREVWKTsNCj4gCX0NCj4gDQo+IGlzIHdoYXQg
d2Ugd291bGQgcHJvYmFibHkgZG8gaW4gQywgYnV0IGluIFJ1c3Qgd2Ugc2hvdWxkIGp1c3QgY2Fs
bA0KPiANCj4gCWxldCBzcGVjID0gU3BlYzo6bmV3KCk/Ow0KPiANCj4gZnJvbSBwcm9iZSgpIGFu
ZCBTcGVjOjpuZXcoKSB3aWxsIHJldHVybiBFcnIoRU5PREVWKSB3aGVuIGl0IHJ1biBpbnRvIGFu
IGFuY2llbnQNCj4gR1BVIHNwZWMgaW50ZXJuYWxseS4NCg0KVGhpcyBJIGFncmVlIHdpdGguICBU
aGUgZmlyc3QgdGhpbmcgdGhhdCBTcGVjOjpuZXcoKSBzaG91bGQgZG8gaXMgY2hlY2sgd2hldGhl
ciB3ZSdyZSBvbiBhbg0KYW5jaWVudCBHUFUgdGhhdCBkb2VzIG5vdCBldmVuIGhhdmUgYm9vdDQy
LiAgSWYgc28sIHJldHVybiBFcnIoRU5PREVWKS4gIE90aGVyd2lzZSwgZnJvbSB0aGF0DQpwb2lu
dCBvbndhcmQsIG5vIGNvZGUgd2lsbCBldmVyIGxvb2sgYXQgYm9vdDAgYWdhaW4uICBib290MCBz
aG91bGQgbmV2ZXIgYmUgdXNlZCB0byByZXR1cm4gdGhlDQphY3R1YWwgYXJjaGl0ZWN0dXJlL2dw
dSBpbmZvcm1hdGlvbi4NCg0K
