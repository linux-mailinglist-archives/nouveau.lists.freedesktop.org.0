Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82196C1E0BF
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 02:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1CE10E122;
	Thu, 30 Oct 2025 01:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q8u7PBeh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013029.outbound.protection.outlook.com
 [40.107.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7592110E122
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 01:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDwhAvW/Eb7MWy6HNTCAK+EBo4JPRd9YEDZZFYHdjCl2nnV0F05qci223M5UG6SWVn52AhlDA2lgj0pyOlX+SZipxgdwh9cl5zj65KtpDoLIQJrA2R2J5wgDrK9bwSEgKdEDP4ZVswpPm6yfhBf5N2xsnSOfDnsn1r1TOneBj0mk8APVLQsQLY4CI/v6YrM45AkSdlYZxLQn6K5Z+U+0wASMfMK/TcdTWcAdCuFtWqp0ADki4+qHNGpqCJ4vz0iGq84rIwIAt8w4yRNX3PuLY2ZPvSi8jgEgtuzev5rKZsjQKXzLJgKV95+Opp9o5M0O0Wd347zus2L9ARKHUi/EKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdsqsZRyoMX1Up2Hu0tkRLlE5mUv0dmBJ27UlFwMlug=;
 b=T/nEUeOf1BlSPOyaQeG16jeh2r7ZDwRFGpW+sPcp2nAGhfyvunOwYNoch3pi/kCNhT26cETSHExRRP+JJwkiVqAsMFe1DWqMdDnxOv+CxDUd+ySCQ1in02hQkjDNV66qoJZ+mjYBf+tmHqrhw3J8mHRIMnNYpUzz2UJNyt/36XhOrawFRylm2ZNUDBjjhEhlxEIw9AW0vvD/u/RX4HkdShkh8dv4ibGUeU4fp93PHvJJYQL+lm5dhXES826Dhxx5lSit6PPIFaeA1fFEbo3HK1ARsV9itDpb75vvE8NO5NOAGFCE91YUMWgQXmy9XC9o+zzIVlFraMTopTSwAHX9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdsqsZRyoMX1Up2Hu0tkRLlE5mUv0dmBJ27UlFwMlug=;
 b=q8u7PBehgjdFC0F1kP0/g3G8NohCJ+Mly2P4P6Z+BdLT0YuTFnpqoEEvv5GM/I2o400cTZg/7AJrP5hs0VXOKWA93Dut+ciyjwh2uyJDRO1k5lLzfL2SWZmVothBz9q2Zfr5YVz7pB3DhMcKk8bd2zA7W00AMoFTVPM0cqxw1IH/Yf2s3aA0man6SyQ4jr2roMvGWso+wdk90vGuFB6gpN7NKHLvJkylbIU01C3Ee/31Kbn26ne0Q6FKqrDZvH6caF+oVMtgN5rbMbcLwZ2RE/JZvw+EZEL/T/SigcXnGxSOd5vHTY/yBuZJcXC/WruIXZkY/ZaJWnpbgz5W3ESM9g==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 01:44:28 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 01:44:28 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
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
Thread-Index: AQHcSICfwqqVMX2fo0egTMdmm17vE7TY/MCAgADaswCAAACzAIAAAPSAgAAHe4CAAAGHgIAAClcA
Date: Thu, 30 Oct 2025 01:44:28 +0000
Message-ID: <35c2d37d02409be8fea5acd713832da938966c43.camel@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
 <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
 <b9686644-e2dd-4abf-9dd7-fc12081f400f@nvidia.com>
 <479ae6b7fb05376d21bdfe1fcde9e3705c11ecc4.camel@nvidia.com>
 <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
In-Reply-To: <b8796ee0-05fc-48e1-a075-2bad99b938d2@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ1PR12MB6121:EE_
x-ms-office365-filtering-correlation-id: cd731253-d4f1-4bbd-0252-08de1755dd74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cnpHRk00VENRVWNrZmRTUXZhMzAzUUZZWlhBaXFqUWZFQWFLZTFGcDZZQlht?=
 =?utf-8?B?dEN2RCtoamtZTjFnTXYvVTlSZU5GTEtQN3BGYURvd2UwT2hkWC9TWlQ4UXVZ?=
 =?utf-8?B?NWY2RFdiSklPNERYd0pIaCtONEJ6UkhhblZTRjgzWkxvY1d2b2U5V0h4WE5H?=
 =?utf-8?B?R1lBUFg3RTZtRk1tVG9pWnExa2dXSS8wOW9HU3c3QnQ0TEFRV0lvT1lGd2VV?=
 =?utf-8?B?L1NmSFZ0Y2dvNjhuaDFZVDk0VmQ0WXdyNy9XZDZHZldGeHNaVWFuVzcyYVBu?=
 =?utf-8?B?dWRIVGc3RkQ3QmZRVUoxbDIyR0tOM3pxVGpCTy9HQ0syNjRReURwMVJ0cHNh?=
 =?utf-8?B?WWJIKytMa3lFSVFIeXN5YzVOUjk2eis2eXNDZCszVEZyOUZkQnVZU0tjcXdZ?=
 =?utf-8?B?L01uYVhLdGlqcDZZaEV3RGFMRTFWVHlWbFhGT00rdWt5Yzd4NGZhQXN5aTBF?=
 =?utf-8?B?dStLOCtZN1ZZWUxKcDBoM1lOVHpXb0ZzR0ZOQksvb2xxU0JnUGR1UlpwMFpN?=
 =?utf-8?B?TFB2bU82WURnbWN6cC9PSjRzcGV6amVQTldXR2srdUZWWU1SSngwZWxQbFB0?=
 =?utf-8?B?SzRDYnZIRm9VSVdCaU0xS3UwWlVTVWZuRk5pZ1hMRUUrRkw3QkRsaHhXL2k1?=
 =?utf-8?B?K3Y1TTJsN3VvakVZc0JlZlBjYUd3SFppQVN6SUFUWFNrbjNTUFZpZm5OMEVk?=
 =?utf-8?B?T3owMDBjTU9DSzJ3bXJYemM5NGVHUHByL284eDhjS21hQjZoYTRXZGJVT0lh?=
 =?utf-8?B?aDF5a1pYYzJCem82cUNqZUJZblVuUld4OWFnOVAzWXlNYXFhZWoxNkQ3Qklh?=
 =?utf-8?B?SEp5QWhhUXRCenNlajh6SFdvRXVSNmZOVGpqNi80WHVjaUlJa2RIUGZyRzVo?=
 =?utf-8?B?SXB1eng3MlQ2U0l5eFJPZXNiV3FnWHZlT2p1aGFTYWVURVZrd1FCb0o4aC95?=
 =?utf-8?B?STltL2M2WGU3TjJkdmdIeC9uVEJ3MDk4bTNGYjhvMHlKai9HRUJ4Z1IydnZu?=
 =?utf-8?B?WDk3K1JjREJnRHVXL0lZbzRnaTIrbUhYU1VGZ0l0ZVFsZTlCQS9Dczd2V2ht?=
 =?utf-8?B?ZllqSUpPSFRSQ2IydUphNk9ZYVZabjJZNnBrT2o5RUR1VlFvRGpHdWlTMDlj?=
 =?utf-8?B?eFdzaHh3WkdQREQ5cjlZNUk4eEJOYmkwN3ZnU1JkQlZIamxUOTYxNDM1MmNh?=
 =?utf-8?B?ZGl6dzJhbEZBRndPVEdoNWpwYmR1K01Pd3Jpd1YzVW1WRzhRczNlUmc2cGls?=
 =?utf-8?B?OWh1Zjd1T0t4a3RnRzk5YTQ0Y29UaEhydGpRb09sNzE0dk5Hc1VkWGZNN21l?=
 =?utf-8?B?SEJ4RjVSYjJEd0w4a3hwYWxMemwxN1NsSTlKZUh5RUUvbVp6Q1JFTmtMK1RJ?=
 =?utf-8?B?em9MR1I1VE11ZC9xWGNTQnJ4eTUwQTVDSWpZemNkSmU2bnYyS2J4WHVJK0ZJ?=
 =?utf-8?B?Nm9wT1pINFFkdFVJQ0p1ZmRlT2VaT2Uyc3JtTEdpZ1hneXE2VFRkOTR2S0FX?=
 =?utf-8?B?TSswT0x4R1hLdGVsNUtlUGg3NjRXNDBVeXgzOXhLaWFHT3lRUnYwWkZ2dnhD?=
 =?utf-8?B?VGQvd3NPdS9VQmRVUU5IZ211V25wQlphYTk1Rm4zVUdKdWVKSVRKeFJUUDE2?=
 =?utf-8?B?dkFmUWVEME83a3luc1JvSFViMnJMdWQ0Ly9FVHpBbVVIM082cXc4eWoweDdD?=
 =?utf-8?B?M2p1Smp0TWU4R2VGTGlWQXB1b09XUndEc2dhVGhmalhncTZpenlTbmhxdDgx?=
 =?utf-8?B?L2VSWHNpeG1Scyt1a0tPV1ZwdDVCcXpBYUJjK25pK1VlcmtXTHNRQ0pLOGJS?=
 =?utf-8?B?NzNrTEVTT3RiTGF5dU5xL0R4c09seFVSS3YwRmR1VlpmTFlFN3RuVXRkK2J5?=
 =?utf-8?B?UC9XYVJINlNocFlmR1NibmhYRWZkRWg2dkFLOXFJNkJvSENCZ0dnMjl6M1RF?=
 =?utf-8?B?WTFGa2VXajdBVGZNYnIxbHRuaEU0UnZLbnN2TnZMUUxGSk1RSXR6MGY4ZTVL?=
 =?utf-8?B?cC93MHk5OTJPelpOTTZBaDBOS2lFaFk1eGt3M1dSUGhOb1h1ZDB1MGRGckNv?=
 =?utf-8?Q?qWjQ/V?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVp5OVgvN1VwMGVIWjZ5RXBlQTNWTUNaV25WTTJwa0tvTDRXenJGUXBkNE1B?=
 =?utf-8?B?Q0haL0h6c3JLK1JpUDhoY1djZEg2S3pMYVljY0k5SzNzamtjSTRHUm5sdWdI?=
 =?utf-8?B?WDNNekU2YzZrMmxtOTdHTnNMWFA4Q0RGSDZHMFhqcXg3QmJpT2tSVmlWK2hE?=
 =?utf-8?B?S2xucWQyYkFOU295Rms2VmthQkpYeWtsMVN1REorQWdSMjVUNWZSZHFCREZQ?=
 =?utf-8?B?bHU5YWRSaUdzVElGd2xlY3dKRHlqSGkrdDI2UG92Y2pTd01JN2RNZmI0K2N3?=
 =?utf-8?B?bFY4L1djUjZzWUNZd2YwTGEzbHp1ZFZDZ05ub3NBWVgrNE4vNnFlc2trancx?=
 =?utf-8?B?enhja0IrMXp1Szd3ajIzSXIybVhVMmZEWW5jdVVPQ1RTMWhnZ2ZDbFg2UjhG?=
 =?utf-8?B?ZDI4Q3ZORnpWMzFNWFJKWG5DOEZ2eE1Xd3N3VjZGTFNOWHBUZTRXa3lrejY2?=
 =?utf-8?B?cjZVU2x0SkZSUVdXaGxnQVJIMm1PMStjNE9wTmdaZVFtVTVZOFlyam4zZThU?=
 =?utf-8?B?cUVJQ3Bnci91TUpqUTl5TmQ1OHNyRkxOTXVDWkduYjBjUm83Y2M3SlFVY2Fl?=
 =?utf-8?B?SG13OU1kb0h3TUtmN1M4bXRpRTNlUEFQd0lVUHNrT2xPbGhkSUxMTkR6YzNw?=
 =?utf-8?B?TTE5MzBwUkYvSE9BYkNFUlRzU0g1N3FQZzJkQ2FYRVF6dXVmT2xiUk1YTmNC?=
 =?utf-8?B?MFhWV1dIZ0l5NDhyVXNNR1FpMkFULy9Xa21LMFJlZUJqM3pHa0pDNkwzandR?=
 =?utf-8?B?bDhXQ1U4MzhlN21zV25rdTNnb3pHd3laZFBZTEoweU5zeUtkbVh0TXVlQWhk?=
 =?utf-8?B?RHViK1ZaclZ5NlZsSHRxUVdCejdFYlkxd1VMZjBlTVkzby8ySVp2SWtTNjFh?=
 =?utf-8?B?cmIvMXJQNjk4aCtkcXQ5QnlpWEV6aTV1WkhqdWVrbmhzRFJwOXJ3ZUE3bFZG?=
 =?utf-8?B?QzV0RHIwNGpQYTNEZzZTTG11bDlHcTRDdDZwQllRWlk0ZERVb25ZVFNnUkVO?=
 =?utf-8?B?eGZscmdnMVVKM05PalI3OFBNWnFRaTg4UkNWc0JqTVZicGVVUnk5emwxbDdE?=
 =?utf-8?B?YXgvZ29PK0x6MU1pRDcxUE92aEF3ZG9RSGtORndneXZ6ZFFsNEhzbTJPbTg0?=
 =?utf-8?B?b2dXQzljTHdGWm9XZVBqdFhTQmhBTzFiUWc0ZnFJUE96OUxacnlDZGJxdU00?=
 =?utf-8?B?bWZOVi9uQzZ2NEFkNks2TFJqd0wxMnppSG9abEs4cFl0WWdBSDVVWWhRT1dr?=
 =?utf-8?B?eDM0dnlzbnVxSU1aRzhTdGRHdHhxREhqanhEZ25ibnZxTkx6NVZUNDducDA2?=
 =?utf-8?B?anNmTGtpbkVZNW5BM21NeE1KUkdHeXkzTllhNS8yNWNTcTVZV0VLcktDakt6?=
 =?utf-8?B?ejFOVUhhVmY2NE1MWiswZzZ1dWFNV0dOcUl3Ymt6UEp3NHFQNldKYWp3Q3pT?=
 =?utf-8?B?eWxKZEJhMVUrdlZQRVB5YW02OVpoNGdhQXRnekN0N2FyK3UreXpkdE1Bandx?=
 =?utf-8?B?YXRGaWh3SGxpclBDK1VBdFZ6enpPdVlPNjNWTUJuVXpKTmcyd1BCUllEaGgz?=
 =?utf-8?B?aEpEejJVM0xCeHlYQ0dJZWRCSUdvMEhQT3VXU09vdVJOTVhQa04zUzVyTlpM?=
 =?utf-8?B?REtIZnNoVGVOZWt2MDlKb1d2djdQWndEeE1iemhZR1htakhEdFpjUGtFdE9G?=
 =?utf-8?B?azhRS2owOGMwNzBQOStRNEU2WktyQ0RHUEh5UWhiRy8wdjYwVUxpYytieVdW?=
 =?utf-8?B?SU1nczlVN2Z6bmlRdy9jOUFQeFdiaHI5dHdYcUY3VFUzbDdkZVpxdEdlRzcv?=
 =?utf-8?B?cnFKcFNwU2hEZFRudDR1Um4yMGVpL0JtdG9MMTNsaitLRno3TUJzcXFhMW9k?=
 =?utf-8?B?eVF3a1ZpSE9nZEhOcTc0YUYrZmhGZnNoTUJ4VEhlSVJJS2pJUWVCNSszVmtl?=
 =?utf-8?B?TnJmdXBMSDM3QW4xaVdQc1RTcklTdVBTc041KzhiQ1cvM2xvYkVXdFU5ZUJF?=
 =?utf-8?B?K0VXc09xUktoeHdiVnRjVDMyTHZJN3hDcVBZRXFDZmkrcVExQzIzUjlpVmhq?=
 =?utf-8?B?eUZ3VmpnVTdPWTM0ZDBuYUUrNXN4UmlEdERmdDROeUVxVWpLVnRsZVJwdUs0?=
 =?utf-8?Q?PibR1ZJbfiswdWFZcbfiqRW2a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE7539F2DB47864C8DFD9986FA64F0B2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd731253-d4f1-4bbd-0252-08de1755dd74
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 01:44:28.8192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kPwE02FWreUY6RZU/uM2QJbVz8O0cSlskv3hjNx5Tb7kyZomEHD8glY5KCaxkT4+ngX+RLUlWmmlxm4l7or9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
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

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDE4OjA3IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFllcywgYnV0IHNvbWVvbmUgY2FuIHN0aWxsIHBsdWcgaW4gYSBwcmUtVHVyaW5nIEdQVSBhbmQg
dHJ5IHRvDQo+IGJvb3QgdXAgd2l0aCBub3ZhLWNvcmUua28gb24gdGhlIHN5c3RlbS4NCj4gDQo+
IFNvIGl0J3MgaW1wb3J0YW50IHRvIGF2b2lkIGdldHRpbmcgaW50byB0cm91YmxlIGluIHRoYXQg
Y2FzZS4NCg0KU3VyZSwgYnV0IEkgdGhpbmsgd2UgZG9uJ3Qgd2FudCBhbnkgcmVhbCBjb2RlIHRo
YXQgbG9va3MgYXQgYm9vdDAuICBOb3ZhIHNob3VsZCByZWFsbHkganVzdCBsb29rDQphdCBib290
NDIgdG8gZGV0ZXJtaW5lIGFueSBhcmNoaXRlY3R1cmUuICBTbyB3aGF0IHdlIHJlYWxseSB3YW50
IGlzIHRvIGF2b2lkIGFjY2lkZW50YWxseQ0KcmVhZGluZyBib290NDIgb24gR1BVcyB3aGVyZSBp
dCBkb2Vzbid0IGV4aXN0LiAgSSBiZWxpZXZlIHRoYXQgdGhlIG9sZGVzdCBHUFUgdGhhdCBzdXBw
b3J0cw0KYm9vdDQyIGlzIEZlcm1pIEdGMTAwLCBvciBjaGlwc2V0IGlkIDB4MGMwLiAgU28gd2Ug
Y2FuIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoNCmZuIGlzX2dwdV9hbmNpZW50KGJhcjogJkJh
cjApIC0+IGJvb2wgew0KICAgIGxldCBib290MCA9IHJlZ3M6Ok5WX1BNQ19CT09UXzA6OnJlYWQo
YmFyKTsNCg0KICAgIGlmIGJvb3QwLmFyY2hpdGVjdHVyZV8xKCkgPT0gMCAmJiBib290MC5hcmNo
aXRlY3R1cmVfMCgpIDwgMHgwYzAgew0KICAgICAgICByZXR1cm4gdHJ1ZTsNCiAgICB9IGVsc2Ug
ew0KICAgICAgICByZXR1cm4gZmFsc2U7DQp9DQoNCkF0IHRoZSBiZWdpbm5pbmcgb2YgcHJvYmUo
KSwgaWYgaXNfZ3B1X2FuY2llbnQoKSByZXR1cm5zIHRydWUsIGp1c3QgZXhpdCBpbW1lZGlhdGVs
eS4gIFRoZW4gdGhlDQpyZXN0IG9mIHRoZSBkcml2ZXIgY2FuIGhhcHBpbHkgaWdub3JlIGJvb3Qw
IGNvbXBsZXRlbHkgYW5kIHVzZSBib290NDIgZm9yIGV2ZXJ5dGhpbmcuDQoNCkp1c3QgbXkgdHdv
IGNlbnRzLg0K
