Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DCCFBB2C
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 03:21:46 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3364B10E562;
	Wed,  7 Jan 2026 02:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d86CGYbk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B5E6D44C9E;
	Wed,  7 Jan 2026 02:13:29 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767752009;
 b=dpvr9cMiHKwlOdxCqk/k7fP8HVmnbHpPYVc11bDs6VJ/8r7sDMdvfrxBI5mVEO+NXsqMU
 fVdaBWb8VzmzMy3FmA0J9/hGiRUbuEKc0Dk0W7xxuTpSkkaSl6l4I/kI3ZCzG7S2xrJaTuc
 hPD9e1YH0wMDGJvQya84pUr+VZokuwUBFC5ytquejEj+mQdlJTtEjZWcDc56l83olOmMide
 dvXxpqXzRHs06Pmv2/hZiCyc3pRgxubp6y1tFs8N6fnObFUhNry3af97AXrpiRc41XlOItE
 0caw+XdcwYCJmrakdbmoNHiyTtclxyPjTIlqc4HabZM2HFG20cgYnDaXQr0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767752009; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5feB329/vJHCFfdtDVXKw06EVCwnqkSRZH/OpLVFllA=;
 b=slY2uhiBEDAVyuAcz1krfFMxFxWamqNZmaq/s9/f+CF718f+FJyrhrBwo/xVn2XRr8NDl
 S6N2dB/GYdHNe+zv3uQx4Phruy2K+qTNux3dngAMbnXnoXGYSzTLRo+MyWvsORLU0yBnHkJ
 tei/IhFIJtyEUkQi1Ij/x82I7a5RD2hEDxTDAgsWwh1gPlNvIqTAA+pDbNv1Q/gse9HBItT
 TkZc8CZ3WQqGsrMLro49Qnq2/fO0psXHipkkajBbpImWXnUfZQWsiU5k29cNbNayP/Hq1zR
 vZiOCeZsE7Dx1VhT2eA3k4DdytZzFcsqiokouJo+FdRgwLCMyP+t1HJOFOxQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 058DF44C5A
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 02:13:27 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF2910E360
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 02:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5eokCKiv7nnW1az/uIkzU0Ithyiar7Evw7+kPXllVQRJbJ5ZXsPIsGPKruePj/+jLamyoDP0tf3bpAqIIPojv6xO6p5Gjb4wgcbw/sn+RXBOLfw4Qksw0oP6xNAIoQ2JlSOD+gzK+RYuG14OAcZRqHckcs/PHL2xOFLMGYrQ+Qib1zEQQCeL9J57eeaOGNHwwGrCF7hS4R+s4XNT2FGwO5p7aCo0/N5PitePuZL/poP1gU2hHLbGQcvrPOlfn/FnGXhswIV1C9vhNWhbK8q7SDGYdYp1NfD6brFBfrRrL6LQ5zxrdKAttYhjSGyXtfR5HYDOCeFWil3YQEWsR2GcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5feB329/vJHCFfdtDVXKw06EVCwnqkSRZH/OpLVFllA=;
 b=lG6jbgezlPvuyXcGdu+G8HC0ZzCvAU0uEVUwIBfPhJLA9b6r7rkf44Jlum+17v2wImJPbTX9Lfa4dvgeHMPGZbLPdoFzrgEerUbxtgoBrKd27vYOvKJ79yCvZsl+YG7jO8Q3aMPSwqVtloOwTZXrNSlejO1uY2J4DtDgGu7TUJkOc2aUArReDB3OOrHeIIFCSNPQ+WpVoJby6V/zQAXk1vbF0cQ61jiLgNn687BaFmlpjxQcRcrPaXNCfnGvkSSHlxSGNgaUe63eYKeaswhHF0e2V+/cmEbOV0nH6t3Sawi2ZeekKZBpy9pRScCk88NhgVxdGu5Zp1XBTniRuXi1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5feB329/vJHCFfdtDVXKw06EVCwnqkSRZH/OpLVFllA=;
 b=d86CGYbkjx2RP+VMZ6bYV2WCaeon1CctquSm7QovcDml6/LYteYxmZQ/s6VX5/JxA7Q14rwtqXIWH86VRyJkBmBFxDaA4q6bJrwrwcVkUrrabSLrSwjjJSGZeJ3v5NUg3+ZA9nAQhW9YGzZQcHGPpRJi7LQRG8PjEhnkrG1HDtE2/9+kw8jRvaIYnR21EwiQzOBQowha5zVfoa89itXgmopChhK2KuG5AvibJFJv1DjGFSs/ZKMTf2kr7hLJOM03Tog3YjyGzNzap0hGNeWCdBKPVLBuA+tfL/oGNQWbXL2ESAFFR5CQtL2pOf4kooV3hF/m6EbeqLUK+k3JUYufHA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA1PR12MB9524.namprd12.prod.outlook.com (2603:10b6:208:596::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 02:21:33 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.005; Wed, 7 Jan 2026
 02:21:33 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
	<acourbot@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print
 strings
Thread-Topic: [PATCH 2/2] gpu: nova-core: add missing newlines to several
 print strings
Thread-Index: AQHcf3RnD7uBuo5gikCerHcLLMMwibVF9o+AgAADNQA=
Date: Wed, 7 Jan 2026 02:21:33 +0000
Message-ID: <38a599e8cebb7209cd8e86135794f1d8755d7a7b.camel@nvidia.com>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
	 <20260107012414.2429246-2-ttabi@nvidia.com>
	 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
In-Reply-To: <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA1PR12MB9524:EE_
x-ms-office365-filtering-correlation-id: 993c23dd-b0d5-4607-2c54-08de4d9379cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UkRLZDl0emNUMnRNcGF4OUMra20zNjVFOG9WenlPcUlqc2ZVTFlSMjBUeGU5?=
 =?utf-8?B?QUF6MWNXb05taE14UGd1bVhieTJMSDFQTTBCYXZqdnNmenZQdzRsWFNZMGpy?=
 =?utf-8?B?Smc4N0UrUmhNTmdoZUVCaXlHeC9zZ2Y3OHBsdmczK1M4WjJyL2pldkUyM3pO?=
 =?utf-8?B?RlN2T3ZUSzcrb0xQQWJkN05XMmY0eWM3U3BGbGkvTjlrNzFpY1BwV3RJWFNL?=
 =?utf-8?B?SmFIdEJQQWp1MFk5U3psQStsZng0aCtxdWxVMStQd0xLNFdDQ2MvYVBCM3N1?=
 =?utf-8?B?Mk9sN0ExdVpDRENjek1SYW1GWnhkN28velFHV1c4ZXR0akplTUp3ek11bWRr?=
 =?utf-8?B?aVpQQkRITHZGem9FcXlaWUFOeDhweXFhbEcxNzN1MU54Q0ZZeEhBdjZTTmMx?=
 =?utf-8?B?Y1JpeGRUWGlQNnBOcXpmV0QrSitLb1lMZkQxRDVwMnVPRllNdktwYjlaWG9S?=
 =?utf-8?B?M3J5ZFVJcFd1WkFsZ3VIcWk3YmlUNDZBU0FzaTl6Q2UzNUliMkdsM0JoZWQv?=
 =?utf-8?B?ZkJPSFhrSGNNeHVWWEk2VklmWVBQMmIwQ0xkdGU1eC90T0ZOclBvSmRaS0pL?=
 =?utf-8?B?a2lIVG41SmxEUlhqRERFdTVVQ0MreUxzS1ZaZ1NBQ3grUGRtM0JYY2JJR1Nx?=
 =?utf-8?B?NGtpeWNaK0ZUZmlZNmxCMG05blVFLzhRajNDV1dPTFU0U1BLTkhVeDUwTHY5?=
 =?utf-8?B?d0JwaW44MDlVSTlONDVBTFlDQ0FKWTltUzZvVzVkT0lvVWpUcmNUWjBKSHVT?=
 =?utf-8?B?ZzhSdytBTTRRS05oaGlVYmJ6aDBFc2ZHb2pmQUtML2RyS2VtTXZkR2lIUnJl?=
 =?utf-8?B?VnJCdEVVWE9pYVltdVkydXVibTUwQjEvM0xQZnF3cEpBNGhVazA2ODNaRkVu?=
 =?utf-8?B?NGpWVlZaSlRHRUw5elNOT2s2ZUVKVWFLNjhJcHFmRFZrU2RjUkIyY0VCVzF1?=
 =?utf-8?B?SllEeG1VdDFadmlCUzBOUTZXTTNLQ3l3blVpZTRtbFBkV2FtVzVTcUZDczVO?=
 =?utf-8?B?ODBwZHVINFkyTmkwVWhZUUNYbW9WTmxDMDgwTVk2ZVY2VHlJV0xqSll3eVA5?=
 =?utf-8?B?TEtZWlJnWnhsMlZ4cUNTUzR5K2ltZEptcjhpMVlyVVBZbEt4Zm8zbE0rYlpp?=
 =?utf-8?B?WTlzMWRsQ1ZvL0V4eFA1K3BYQkNKMUhZZ21QRlA2dXRiTEowOUQyWER0M1hq?=
 =?utf-8?B?c0wwTnFQeEsrV3RNSDViU2t3NEtpcjVndGhXV1hPbHlJajFicEJLVDRCN0hM?=
 =?utf-8?B?d3NTUzROV2JEcUIwTjZ3M01aeDl3MmdFWHVrU3VjaWtDK0Z0aHFHVGFveTJt?=
 =?utf-8?B?ZG1XUnoyZG81SVRNOUZRdTJlZlpsYUF2UDZMZk02RkN1SjB2cTJnQ00wbXM2?=
 =?utf-8?B?Z1JvVU9PTmo5R0U2aEpuVmd2UDZxUllYNHN6WnZza1J5ZnNhSmJYVmRNZlpI?=
 =?utf-8?B?Z3pxVWpta0NKdzZpVWFWaDcxdndiYndncCtlRGlycXNieHNYVFNvSUZKUEhv?=
 =?utf-8?B?T1JWT21zamI3Sjh5RFQ2c2xUbmJKMDY3WWhEeFZOR0x4WTdTdkhrU0FyN1I2?=
 =?utf-8?B?eE05ays4VnJkVFVFcDZIQlhEOEZHbm1HMEpBNjk1VUlnWmpoVnk0eW9zZnFm?=
 =?utf-8?B?RWt5MDVzYWdWOEpHQjQxVktVVkJBUlAxaXFWamEvVVFTTjhPdlovb3VYT0E4?=
 =?utf-8?B?SzE1L3N5RHlqMVhoSFE3NHp2cW1aZ3czbmRzNFpVNGxVTFhYYkVPZ2NBWk05?=
 =?utf-8?B?S1AzNjhqajhUWk01eDdmUmNYSkJLNjY3VERqR2RKNis3NzJ5d1ZFZGY4QXQy?=
 =?utf-8?B?VTBJemlBaHJZcVBKT2ZuK211a1ZBOU5GQTlPcms2eG5WVFlNNzZZbm4ralhy?=
 =?utf-8?B?RC82SUxqWGhmS0htdkJvdWFpaUpXYnpFb1AybFBkQkRQYjE1bFhUd2pRQVdY?=
 =?utf-8?B?QVUwUTA1MWI1L3REQzREMzF6aW1SRlpRdDdhamtJcjlIaU5CbHZVNnNUdnpN?=
 =?utf-8?B?ckp2OS9tVVVCMWpKait3VVA1ZmlwZ0VCeFAvWGJwNkNLeEM2S0R2Yk5yYUlS?=
 =?utf-8?Q?lSuyuu?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZkxhbFp1bVFaTzJuWGttUHJ0ak5CK1VEdU5jMDJaNGQ1NGQvNUZISkFLdlpL?=
 =?utf-8?B?WUczSE1sRnhhSEM0dmtsSnptd09rcVdCYnc5b3JMN0hKS0JtbDNxT0VWTktt?=
 =?utf-8?B?V2twL3RqdS9rUVg5ZmR1QVB3T0dqR0UrRExTNFVGZm1hM1hJR2VBVVdTUnN0?=
 =?utf-8?B?dVlRU3RObzkycEI0Z1hTM3hqWVp4QnN1Um9kdHRhQ3cxN3R5Zi80YTZaQUs1?=
 =?utf-8?B?OTBMMzNjbElBV0Z1dGdjd3pDbnE3NmFlNWtBYXFSaWNvT0tuRVZNQWNXMy9P?=
 =?utf-8?B?RWViZjVEd21qQ3dVSDhGNlo5S2MyaSs2eXdIb3MyelA0Tmw0eXh4K0xUSmli?=
 =?utf-8?B?aE14c1BLd3J5UTVYelJ1S3FMVWtGeFZJbHRKK3NjdmJjTUg3WnVzNTJmZk8y?=
 =?utf-8?B?M3pqUUl4d3ZlNm9ieTJMWjM3dTZDNTJwNldsNzJNQWVQZUVoc3M5UE1YS3hk?=
 =?utf-8?B?Q1g2NDZVUWYzYVlSRGxDVVNXMGZCTkZVNmtOZjlRc3JSamF5bTJJcFZpQUxG?=
 =?utf-8?B?RE9TSzhEM0FlYlRKZC9lRHdLU2ZXUVFmSDJ3eHFwTUF2aWFOS3RNVkc2U2g1?=
 =?utf-8?B?bkZsZU5vZm53cTVjMEFyUms0NzZwbG1ucmVxTmVabGdMUm5mZnJXeWg2MWtN?=
 =?utf-8?B?YUFlTjRQbG0zdlVuWUNVelVxcGJGd3d4V29FdlhXT0tYV0JkeUt1aGhuNXky?=
 =?utf-8?B?NE5lcjljRmFZWkJYSVNxZEZUT090MXJBamFneWIyL2hNZFB5c1R0RVpOcVpD?=
 =?utf-8?B?WnkzQjlyU0lRRVJrd3BKK29YdmJhRERPUlFGUU5vZnRUR0NKbUEzNUFkbWlv?=
 =?utf-8?B?WjRlZFF4blZyWG1XYTljVmlORGR5UitYZDB2SUNrU0JWdEsyTk9VblA4QmZt?=
 =?utf-8?B?S1hqQ3piMnFPbXhHZkdDSExRN01HU2hBSWdodDlDUzM2N3QvUTlDdk1aQWZO?=
 =?utf-8?B?azFieXpxTjlERGdndVBMdGYwV3BPR0RnU3FUNURSRWVwdG9EZm5JeDRKcEVI?=
 =?utf-8?B?YnBqc3BpWU5jbEF1ZnJ6SXowOWlNTERqTS81eHU2b2p3U2NJYWZ3QVlIOEh6?=
 =?utf-8?B?bEtnanRzMUdzTEtaZksrNm1lWkJOdVc1a2RMNkNQOEtpNE1IaHA1bjB3ZjRO?=
 =?utf-8?B?a29vWlZwOGFLN0lqOEVITS91NHB4cUxEZnpVbklYbHRhbkdrYWlFazlSazVt?=
 =?utf-8?B?TDZyd21XYVFOb0VqdnpPbG9QZ2pTbFVUWEY4UDc1WTVITG9uM1UrY1VkLzRD?=
 =?utf-8?B?QTkzU2llbUIxeW9NUDQwemFlNjc1OEpuTGVEU1lYQjVldzhwSHkxYVNtU1hq?=
 =?utf-8?B?eWR6dzgwMnNIbjdUWll3TVJvWnV1Y2NHczVMUzl5bzV1Mk5TaHhKT1l0b3NG?=
 =?utf-8?B?aWFtQ21MNktmM0kyZHllZGUzY2h6cUgxZWtEQ0wwT3V5QmViRm9UL2tuWE01?=
 =?utf-8?B?anA4VGJVZ3dxZE4vV3JvNGo1U3Z4TXZoaVVWckFoMjVRRDlackJTMTV4N3JV?=
 =?utf-8?B?UWNTYXlwL3poZjAwMTNUM3BuRHFUWDlRMFBoRHJ6NEZiTmROdmRQYkk5ZkY3?=
 =?utf-8?B?RGFLN2h0SXNMOE0ycCt6QXN4ZW9jM0pHNVNna2ZFWGxWUGlZZzNYcnB4Zkwz?=
 =?utf-8?B?ZE4wcDFFSDk2ZXpYRzE5aExVeXV4QzRXZHdVQ3VJZjZOQmtwNEFLRnlqWG1V?=
 =?utf-8?B?OG44RFlhWElKMkZMOVJJeHhsMU9RNU81U0xBMnZWWW9QUjRFN3dHODJwZkxw?=
 =?utf-8?B?L3YraHdoWEhCb2NnSnZha3NEVWh0QURqZzkzaEJwOHNEY3o5U0RxS3VnZnZT?=
 =?utf-8?B?b2ZhUVlpb242YlBMdmdRc1BFdnpvcXBWUXZ3TEdnN1hmRFAwTU5CK0V1QjZr?=
 =?utf-8?B?RWdGNUc0K0FmV3ZnWEQ5NnFtaC9TUXVWbFpIY1ZNYmkwcnBHaUtiMVVNNnZw?=
 =?utf-8?B?bm5JK0p0SXI2TkFkb3pBWmVGTmk3VHRtc3dsaksyR0o2S1k0SWovYUh0c09H?=
 =?utf-8?B?bWpRMU1ScXdsMWw1dkpxWGJITUdHQmdwK25oQ200d1ovVFArNlVtL0NGZHJ0?=
 =?utf-8?B?OWlCNDc1dVc5YXM0V2xqM1ZuVzVZdUFiVEFrTS90eVNCd2tXQjRQOEtEd2tE?=
 =?utf-8?B?dCtzS2dscDczdFFjZ0FaRmowZ2VtUTF2eXk4ZGswM1ZkMmhFbjIxYS9BYkRX?=
 =?utf-8?B?bGdmZFhiQ2M0d0p1a3JGanZmeml3ejE5UmxXWU1kRmprZ0hHYVNEcnc3WUg3?=
 =?utf-8?B?eURvMk9oOENLSXBubWVVRWkwZnMza2VRN1R2MUlIQmxyWC9pLzJWQm93dER0?=
 =?utf-8?B?ZU9EbmlMZC9yWUhoYmtXNXJMdmhFK241Z2lmWmdpazhUcGpUWkFsdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65B3411C0BA89A4C866313B4868EF35B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 993c23dd-b0d5-4607-2c54-08de4d9379cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 02:21:33.2017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 GSkMNCxkLKIReVuUnkKaCwWTwCYw9IXKwEeeyaix4xuS/DfTR8EqL4OmmBcEdivj17pcFe/tZ1s5UuU9PCTRSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9524
Message-ID-Hash: CBO3KDKTOHKMFB6TL3K62FAI3GFJCTWL
X-Message-ID-Hash: CBO3KDKTOHKMFB6TL3K62FAI3GFJCTWL
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CBO3KDKTOHKMFB6TL3K62FAI3GFJCTWL/>
Archived-At: 
 <https://lore.freedesktop.org/38a599e8cebb7209cd8e86135794f1d8755d7a7b.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI2LTAxLTA2IGF0IDE4OjEwIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
bm92YS1jb3JlIChkZXZfKiEpIFthZnRlciBwYXRjaF3CoMKgIDM5wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAzMsKgwqDCoMKgwqDCoMKgwqDCoCA1NSUKPiBub3ZhLWNvcmUgKGRldl8qISkgW2JlZm9y
ZSBwYXRjaF3CoCAzMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMznCoMKgwqDCoMKgwqDCoMKgwqAg
NDUlCgpUaGlzIGNhbid0IGJlIHJpZ2h0LCBiZWNhdXNlIEkgY2hlY2tlZCB0aG9yb3VnaGx5IHRv
IG1ha2Ugc3VyZSB0aGF0IG15IHBhdGNoIGZpeGVkIEFMTCBkZXZfeHgKZm9ybWF0IHN0cmluZ3Mu
Cg==
