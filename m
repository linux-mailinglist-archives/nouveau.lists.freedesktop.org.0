Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA8CA196A
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 21:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D424410E782;
	Wed,  3 Dec 2025 20:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sqvlRxCQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013003.outbound.protection.outlook.com
 [40.93.196.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264010E782
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 20:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIWA1VfPkdPoiKcq7Ietn5VfZgxoepUgja1Tx3hkAl+JD3H0hyJxxjVstZNMpBAq2JYDB1uBPzbcHn+WP/WNOh8CNWQmHpRb8TjydcFCgDqOkzyoVudHS2KxPqmIhJvMiJ4Sahyiv5T8SF6sRAZd0wIsTS3b/vw6kG422FFzeAa6PuAzazDoQhcaOsUCDFy97gKKwW7J+0T4Xf+Ox4zJt9I928eYx4nJqvDvUzC7D06HmT6bZG2MMn0ffCzxPTn0ESyjDRlvJF71MMmPUawobqSknFVOaLCp3wL0/H+UPe97LH3foGgk+B4PasX8MS3o2ByxVs2stqwhPpx6aa8AJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9o2KFse8f3zNl0Q1Rgbn34pWBPZoRgz4Hi0XyFiU60=;
 b=u46mCJIQ1QyvPCNTmF+wEB5eaG0+x5fapWf+PN/t+nwhXoTpA4YlljUJ6DWb/HvHrlY7No87BXZDZQtE33zUPjRjlCcc+a4uRKx+iFfzVRV0cSFMuybJ407XhESuo2pikmVZDYsQVOl/WU5v6nQm6Hbm9xllwcYhMi9Fs+5Dw6XLxreVkUyBz12LC0tY512adpkkJ268ng/81z/3WjjyD7J4SZ2DY5kx3fihO2ByL08CyleU8+pwb0ENqe1tw2SHIrvJD86pdhdeOk7liuTDxmRLPRO/M2uH7luzYwL4P1mzK7W320YfZomMrjp8mAictAvDoxKbrL4enfLdsDydVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9o2KFse8f3zNl0Q1Rgbn34pWBPZoRgz4Hi0XyFiU60=;
 b=sqvlRxCQD7X66lq6zz6qRsJ2aGnjJQXhfkoDdrbqKXCFPhO9oCYqB3yTJWdi6V1OcTqi/NbCKx/feuwxKMbCcYAJEVd84gMy2donBaCRFjyFgrz60pVoHjEOChp5xuYKXtmboiy0DLiC0hb15TPnlJ3LVevyUYRgCYO2r3rlJtpNWQKqUXF1Qh4Jv1oPBEGz1VuF3bn+Az6szpw78SQk2Vw4V6TDY1oIIw0Q5y1LvP7nqi+tfdm1zMU87Jg1ciZqk4rRA8x9Dd1baTml2tUsrBA6QuA9NUm+B77SA2VbFtNw+q2HvU0gjSN5CICG4FHiWnrj9ITRF6X7a0xTO/vz2g==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 20:48:16 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 20:48:15 +0000
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
Subject: Re: [PATCH 17/31] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
Thread-Topic: [PATCH 17/31] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
Thread-Index: AQHcZBoMRrQLk5qSKESp0nyUO5JZP7UQZAGA
Date: Wed, 3 Dec 2025 20:48:15 +0000
Message-ID: <4e36e160bfa53240987f65ba36cae8e6fe4d6e6c.camel@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-18-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-18-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|MN0PR12MB5978:EE_
x-ms-office365-filtering-correlation-id: 0468d2cf-7b08-4971-af17-08de32ad485b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N2tiY0wyY1ZhQmQ5YXVPd2IyaTVPRGtpQjM4Wm9LbmdtUmpldE8zQldRcWcv?=
 =?utf-8?B?QnNVQktta3N2eVNJZmVkU0Zxc2NDVy93QTFwUlhNMzcwa3MwMnNGK0t1RmpC?=
 =?utf-8?B?MmxDRURMSkpzN016QUNZVUZjdDBLZUsycTZxTkZJZll3cDhXOHkyYzR0RWEv?=
 =?utf-8?B?Y1ZwTmd4TlpUT3hObGxudFQrdnUzVGl0ay9EYzBBM3dzdGtjMDY4Y2o0dzVx?=
 =?utf-8?B?V1FYOSt4blpOdnRJVjZLY0FaOCtVQkhZV0lHa2cxMGRYUnZGdXlMN1JldW1h?=
 =?utf-8?B?NUVqSXlBSldPa294d1VuTzJqWE1VTmd0N0pDVHBiNjZTUFRqSzFtTndHZ1Vk?=
 =?utf-8?B?M0IrOWFxcTdRS2dSbkpkaE1PR0dBMVg0RUtBVW5NcVBmcnYxZXZlOHMrNEdz?=
 =?utf-8?B?aW5PQXIySVNCMVJWVWlGanVjT01lbXpnSEo1eUxFNGJzWUJZYmhhNHZ0N1Ft?=
 =?utf-8?B?ZXFPMUorM0FTaGtYbWlNUFJBMUlPWHJWZ1lIZVhNTlp2TU5Ua29nMkliRWJl?=
 =?utf-8?B?T3NDQ3FHQ0FNMm0weEtNVjhvMG9ob1dRZzAvcmtHY1N1bzBadWdiK3QrMHVK?=
 =?utf-8?B?Vjh3WXMxaGNhMEpLWFliQjVPMXE4L2JNVTZKMFZpcWlEcnFNWDFoZmtPMlNY?=
 =?utf-8?B?MzhTT05acHJCNUVXRysyUGw0QU1vNEdCYmtPZ2hNMldyejNaeWRCdm1EUmZv?=
 =?utf-8?B?dXNBWXlKZFJqV0QzSTkySVdTVVYrS2dTZ2xwa05CcWltcXkydWg4T2RUdVli?=
 =?utf-8?B?bDlTQUZDNkV5bUYzc083anRXTEpHdUd5bU5RUG8yS0dBRlpvV2llNmRKbVJ1?=
 =?utf-8?B?QXZtMk1EMUNkNEVqcmpOVTN4RTRYalcvOXlrUDR0NW9jZmRPVDJVTk1JYnRE?=
 =?utf-8?B?V0FEVUJreCt3Yk9BQlJRZk9zc3FRRVhSTVArYWhIb1o3eXdta2dNVm12QWcr?=
 =?utf-8?B?YW1NankzbGNRZndMQnViM2hKUGhLa0lITzZLNDlBT0RrRzlhSjVsQ0JvNk9R?=
 =?utf-8?B?aDFTUmk4blVja1QyY08waDdQNTEwdjc4M0VaYzBZbVI2YjRpWVovNTA3ZlVL?=
 =?utf-8?B?SDdMa2xncmJiVXdEMHdWelhkSlJjdmtmdys1ZFdhVkI0TWdKRGFna0JmbGgz?=
 =?utf-8?B?NjdpM2doaCtUZkFwWE41WTJ2bUFDdUtXbTEwYWJDd21JbDM0N0FvVEVuZTkv?=
 =?utf-8?B?aWh6aEl1aS9rSkZxZEdpV215YkRDSlBYdXQ3Qm1EK3JuRlpWOTRReEszQ0k5?=
 =?utf-8?B?RGhXczJBMERJeGpVbTkyckxBblVzWi9hL245UEhJQTdJd2I5Y2Qyek5SSGxW?=
 =?utf-8?B?L0RUSVRpSWZJZnRiSDFYdVBKazRUWVRpSE5sSFlpZEFkdU9kZ09QenZieVZn?=
 =?utf-8?B?VmlkSjA2cCtDOThJeHRZQklKY2ZPNG5kb09pZjRUUEhhL3A0b1hFZVk4Rzdv?=
 =?utf-8?B?RTlkZVBQSnpxa2twc1JQNUtZVDVCMGtKSC9HZGc5QnhVMXBtcVZOV2RQR1Ro?=
 =?utf-8?B?QXBpTUVvdTJkdThFODZGWUxZRTRXdzZ2aUtCTWUrWFhYb1NPMS92dVV1aWti?=
 =?utf-8?B?S1VWa3pmNk5yZkdHRW50dGNNdlBhVVd1VnkyVThCTlErcmZSaUxad2FiUXJr?=
 =?utf-8?B?NzVyK2F1MEVvemY5UjVKZDdxUFNjWTkyZWxySDNBcGdLUXVIeHFPemhkZ3Bj?=
 =?utf-8?B?elRQM1B5VGNPWEFkU0Z3YVRZbWxJenUvQm0wMmxUTFFSc3pqSnBXMFBqMW8z?=
 =?utf-8?B?YnEraFJJUXdrbW5NQ0xkWFk1YVJleVRuZUJBZklMYTd5Nk5OTDU1NzRPZmFt?=
 =?utf-8?B?MzFoaEdWc3FrcHp4V2sxbHU0dC9jaFJMT0YrZll0S2hiUWtxK08ydnZnbVZV?=
 =?utf-8?B?RGY4VTVvbnVUNG50bmhYanRyZUpicVVxUGtLMEtTaFZPZ2MxT0NRSDN3Rm1U?=
 =?utf-8?B?Q3B5WTdsTXBLRGNRL0l1MlExK0JmTU5CTkppZXo3R3ZNRk5VcXNvZG5BRG9B?=
 =?utf-8?B?RVZkbmVISjFnT0EwN2k2Uk01MXlMdHJWbnVXN3ZjV0Z0UmNmTEVLb3p3V1V5?=
 =?utf-8?Q?AU9iSt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWRNNVpOQkQzZWhzbmwyS1M2eHpCbjFpNHBOMmFZRktmMTZkTVlrNUZSOHhX?=
 =?utf-8?B?b2VJWUFSdU02eXNkaTc5TEorTWR3aVhJR1dPNGhOdXIrbmRHbkhsWE1zWVZO?=
 =?utf-8?B?T2NsaVJSN2hwby93WmJDdWtiOCtDRXFXY0MzTjRSdHI5U0p6ZWgzUW1aUFBz?=
 =?utf-8?B?YTRVVmx1ZmNJWGdVdHNIVTdDcVRZVHJ1Rk9GRCs1dGhQT0Z6emphNThUc1E2?=
 =?utf-8?B?Nk4ybjdvMDdjNU9LZldmc2szOERiS2xrclRMbUhpV2lJL25EcmhGSnpKMHRt?=
 =?utf-8?B?TGpjdlU1RVNUSzVXdUViK3Y1S1pEclZMNlJvdjF1ZnhxZjVQa1JabldFUXhG?=
 =?utf-8?B?cEF4cy9XbGdFc1duVi9UNW9vZS9EcWFnbDBtbmk1c1IrMWI3cHJ2NUJnTU9L?=
 =?utf-8?B?TG5DVStnWWp5cWxuYTcwR1BURHRvb0pOY0g2NWxybVZxcDRvR3c0VkZRTEI1?=
 =?utf-8?B?V3ZXampwQXI1YTdWRncvRUJ1L3FrQ2FUNUxoZVF1Q2ZnMVoxcTBFODM1cnJ5?=
 =?utf-8?B?NFJqLzc4WklDMUxFS0JKRXl5cnlMMzdUN1NKaW05cEZXaXZRamZ5aGg3NmMy?=
 =?utf-8?B?bTl2NWp1RVRPQjYvc2ZsUFluTmJuWmJKY0VGSEdDL0h4cWlxeUllb0Vma21X?=
 =?utf-8?B?Y0lNd2JNN1I3amprVHgweXF6WE5SanloSmpSdjFtOWl4OXRpZ3lRWDFmdFc0?=
 =?utf-8?B?Qi9EVzVCZWpHYldibEh5MWQxdU11SlVVT2V2TnN1QlhOaWpXU2Y2WnNhT3Z1?=
 =?utf-8?B?U2d5VEIxRnlyeEJvWUJxY2xWdzFaMmZRUy85TE9LbWNOc1FJYTgwRWlmSm5w?=
 =?utf-8?B?VmJqZmZBTGZNYzB5Y2VXM3Y0NU9HOEtNZHBXRFBTUEZPajVaWUdDaFRiMlNp?=
 =?utf-8?B?RmhWSWwzTkFGeUdLM0lMdVoxay9HU3d3ZytnM3FIMUlmdHJiQVRmZFRaQll0?=
 =?utf-8?B?WEhBM0VxcXVOOHFXUGVpNVhXR2RYcWZYaS9kK05mSXFuSWtxZUU5OHNnWW9u?=
 =?utf-8?B?c2xXMWQ0WEkydzhWam9vM2wwSEVadDJjOC82a3N5Mzl0NjlML004RzNKdzRw?=
 =?utf-8?B?SXh3bElsZEl0dExHeUEzWkZlUU96U3R4aitaR2FPTzFSY0dTL0ZpYkx2WkZR?=
 =?utf-8?B?eXluVFB5WjJ4RDFiejFjYVAvZnhSaGdUOE5uTVNDVXBBSTdYZk5jRzgvOXFu?=
 =?utf-8?B?MEU4VURFdUlQZkdPTGVQcitEQyt5MVIwZmExU3FaRFp0UkorZ2JUUHBDRGtY?=
 =?utf-8?B?Vm1MVEZ1NlNXYXRoS2t0QWZHUHJxR2ZNS1lJMHV3Qkc3TGwvNnYrQ2JMUG5y?=
 =?utf-8?B?QjRla0RDbEUyY1RRQ1d4MzVDYWFOaFhwaS9aTEJXM0JabEltWFZxczE5Qkpz?=
 =?utf-8?B?VnhrU2QwYUhyNzcwM2thS2E0N2RZSGpsNUloQ0hKbGdqclRFZldTOG03TUJM?=
 =?utf-8?B?QytwbE9WM0duSUlPMyswVTJodGhoNlpjUUplb0locGZZWTd6RDJoRmZaRlZm?=
 =?utf-8?B?U1d0V1oxbW1ZSUxqcVJTQVh3QXZrM2w1TFRIb1VMc01ZVUlJKytlTGt4TFlw?=
 =?utf-8?B?dFpadnl6UlBPUjV6WlVjMC9rSitFaUVKOHZRdGxEdWtkUk05dGJ6a3NMM29V?=
 =?utf-8?B?aUNWWXplZUIvTUN0U0MwNUhVRm9qbnlFMmZ1TDl5U29HbHprbDFjTU41dVM5?=
 =?utf-8?B?bnRYdUphTFppWDZTZjE5WHZqWnNtRjFZWUVqb0tmUW1QSzZaMG03amRkOWVR?=
 =?utf-8?B?QklMK0pVK0cwMFZJd3JMdDhLMWZ2WVZ4N2lSME1qeStMZlR2L21mSlN2MnB0?=
 =?utf-8?B?ckJneDN3ZitEYkd6N3NpYW9XOVZOOHo0VHdEelVXMG5mbmhwa0xTYytRREZq?=
 =?utf-8?B?aTNwZkxuTi9SRTFHRm13czRMMGxyR2tORXBodm92OFp3RXpjdlpxOFRBVXJE?=
 =?utf-8?B?aUxRNHFQTmdsNnJtUlpBY3Z5SHhRTElqWkVtVDAvbVRJMVFyN3B4MEtQUFpK?=
 =?utf-8?B?eGNrc0VKSnU4Nkl1bW42dDZvaW8vSnVkK0tOUk54SHAvekVPaURFdjRTeGtr?=
 =?utf-8?B?TGFXYXlUaHhaby9raTJaT0ZyenRobzVhOHNYQ083ZjJoU2NMRTRsdUxaeFox?=
 =?utf-8?Q?CjIUCzRCbWo0XlwIi0HuAVvG9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6972D479DC3E844EB85412B7BED34934@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0468d2cf-7b08-4971-af17-08de32ad485b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 20:48:15.7456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcX9Q9k5m8Y01YN2Q5wr6BCLXcKnuh5L9C1h4Z6FTic/fPfRVUholGtXZeLVH1bbMEiVyi58/8Lz0JjImMs1AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDIxOjU5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICsjW2lubGluZShhbHdheXMpXQ0KPiArcHViKGNyYXRlKSBjb25zdCBmbiBjb25zdF9hbGlnbl91
cDxjb25zdCBBTElHTjogdXNpemU+KHZhbHVlOiB1c2l6ZSkgLT4gdXNpemUgew0KPiArwqDCoMKg
IGJ1aWxkX2Fzc2VydCEoQUxJR04uaXNfcG93ZXJfb2ZfdHdvKCkpOw0KPiArwqDCoMKgICh2YWx1
ZSArIChBTElHTiAtIDEpKSAmICEoQUxJR04gLSAxKQ0KPiArfQ0KDQpTbyB0aGlzIGlzIGp1c3Qg
bGlrZSB0aGUgaXNzdWUgSSdtIGhhdmluZyB3aXRoIC5uZXh0X211bHRpcGxlX29mKCkgaW4gbXkg
cGF0Y2ggIzEwLiAgDQoNClNob3VsZG4ndCB5b3UgaGF2ZSBhIGNoZWNrIHRvIG1ha2Ugc3VyZSB0
aGF0IHZhbHVlICsgKEFMSUdOIC0gMSkgZG9lc24ndCBvdmVyZmxvdz8gIFNpbmNlIEkgbmVlZCB0
bw0KYWxpZ24gdXAgdG8gdGhlIG5lYXJlc3QgY29uc3QgcG93ZXIgb2YgdHdvLCBJIGNvdWxkIHVz
ZSB0aGlzIGZ1bmN0aW9uIGluc3RlYWQgb2YgYWxpZ25fdXAoKSBhbmQNCmF2b2lkIHRlc3Rpbmcg
Zm9yIGFuIGVycm9yIGNvbmRpdGlvbi4NCg0K
