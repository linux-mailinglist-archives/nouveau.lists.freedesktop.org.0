Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F359CECAB2
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 00:22:22 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9CDE10E6BE;
	Wed, 31 Dec 2025 23:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o1KQPbb2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2659444C82;
	Wed, 31 Dec 2025 23:14:20 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767222860;
 b=SO6C58MDENpubW/0c87RLYaXM2xksulZUHoRgO9JPppTJNHwutEnBEGaaNgzsXBBMKdGv
 jwKBDiYf/8Vcabq3FLob8wv+cpOt9LmoQTVjQOuvUeAOmxMFlGy0cMo757GGhcWUfW/uSlv
 U9R5qtq+h48umUs8TUKgIj5MfXaOE9F+WoVT8VRry4/NHcdPSqldPIwn9XKE/xfVrmaabDe
 M+NDknUBrFZWc7CaQfwJJmzz6OXhq3nqxOZeaN3z9KmNBiFwdIIpXmXOpvUp16KYWrb+c6S
 7n8ULGoqrHZ+CaZMwJ8QHj0CL6D7/QxmJ6DFsiK7al08cOZ77sDYv9yumogQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767222860; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Njek6iDDv9cgBhL7ZSv5cZVRQWJmxQg566rKpHcQd9s=;
 b=D/ErR21/x9KHjbTSftG4O0nMK8p6nfnR3lxo3e5OFHNS4ShRMxtNj/+nRwosp01Nn3c7g
 +FJGch1DThVSrclBHyMSuQdSK0BiFXt3vmZ052GIkp/e6EwHhoQZ430A3jKa0ktu6ED4gry
 qsn9WssvKcRsMdFzJW7S1IBfBoQaL88EgFCHJI7Hbuo9p2Zcd8ZeiKiFkqpdczj3la1u4Yw
 r/E0J/N25OC1t2I7p+WVq5IrPsyoo4i5VTOBQHw4/EAsc5AdQeelgMoOaMTh9MYi8GI0DER
 Sz5StFpr8t22fwqQ7eKt08KS6HejMW/7GSKeaHUUx+ZLTEFMeSOpPRMsVe4A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E8B2E44C66
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 23:14:16 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010026.outbound.protection.outlook.com
 [40.93.198.26])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE7310E2F3
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 23:22:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pi4f1ghNTxad0C3pe0HVYS38pxICYbbOaKK5unrTg5Nv9v0crDCnDpxd8Bqivtkz3kqAl/yEmAZIAEr3d+iPKPpYSbj4PzpJL8UIooOoaoSI7MEflAsDfuxRfSIXQKYjFXNsGz+27JlRWYVHrkEKYGLUdZ+3S4OTnVq5O7/Heny7FTRvP5XindPElV8zuJNnMYWxC4ys2ecM4Zra85MTnp3i8vZYZTSkLlUiSm7OZI6vXGLO2hX8nevUDvhXJ8belKe5v8q7uOlnajs/NtQgGmHjF9dq87MTQUUXdFjEeUa+vgd5x2a5WEBtJYsjWOUo+WIl7CrDguyRsXiug/MGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njek6iDDv9cgBhL7ZSv5cZVRQWJmxQg566rKpHcQd9s=;
 b=WgsNJ6dp9CBr34UYvdt4ezR4DmFULd+YWWvYMZrhA8sY8pocnvEod7LCWcdsWoPWrH64WxC857C/9ZJDCsY5XHjvQKyQU6lEZL7P/MhyDe3lD6+RH1WbbJnsO30bbWlHBJ0fGJK5vkCIRrHCCrCLfVfzLmyWtsaQ56JMIusc2RkdCTOJ+eB5Q3LBRbE2MDdHXSOXxkx9tme7dPjoTjz0j3+7whftcifAcYqL6Gx6cwWw1Qh2fJxsSxef539nck/7dKnnwhJ8wIz+OkiatWnoSJgbgHN4y+uAjOGZAAX5cVHu/Wa0sCNddd+8FdQRnWL+MXpNihNNUbquaaYUo8RQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njek6iDDv9cgBhL7ZSv5cZVRQWJmxQg566rKpHcQd9s=;
 b=o1KQPbb2L32bbdNmLOVvAwGuSOnLSZiGhvAw8SyrdqjKIRHtUABnJlZg1jD6ggrhegaqQ6Y5lCSRGXmsvfqDYrSzIbXK3sc8P8eSVYheUgoLnrfP5FV8frFyb+0gdbGvLIgrDi8bBAEAkgDtAQNRWOLZ2aVQmp0hhcKK7e5LBD96dZ8RK8fFTq+6wLGz56fhka+6cWoIgVQb/PHlPrZDUxdBIQLEXyRXsh/KiQJ5tzicQY5UB1ArNj7OV6yc+B9JZq6YB0IyqJ/esgAGPmgQqGsr7+SInlEdD5GEmCGA/jshtTbztVeO/wwVSdHeV/FJawlf0j6AP5bUtpydV4W3Wg==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 23:22:14 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 23:22:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcb86uRR5PbMKlQ0aCb0DHh7/+RLUnXKiAgBOC4gCAAZlvgA==
Date: Wed, 31 Dec 2025 23:22:14 +0000
Message-ID: <db9670da7e77274103f9784fc61520fa5041115c.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <20251218032955.979623-12-ttabi@nvidia.com>
	 <DF1D026W0BQ9.1DUWS5LKR09TG@nvidia.com>
	 <3b5096f40e724d313d028128818e3e69d3c9fea1.camel@nvidia.com>
In-Reply-To: <3b5096f40e724d313d028128818e3e69d3c9fea1.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SA1PR12MB8722:EE_
x-ms-office365-filtering-correlation-id: 258ba799-dc6a-48f0-5b0a-08de48c36e98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eTVPZmc2alFRLzQyUy9tckY4VldqbHJybVYwcnlQWUZ2V2JCUXA0aTRSQzd6?=
 =?utf-8?B?OGxEWHljUmJUYlJjUWIzU28rOU1mZU5ISGtDd2c0VHpyNVVkS3lTdFgxZGE0?=
 =?utf-8?B?ZXBid0p4OUwrVjhHd0lja0Z1LzBERWFCcDZNWVVKV0JXeFhKZzBveGZLdkRQ?=
 =?utf-8?B?NG5jNTdRaUFLazN2Ukd2KzVmSy9YMytGWU1Ta2xHQXBNcXB4RlV2RlFOWFAw?=
 =?utf-8?B?amx0NnppeWswcXdwN0hIV0FMZlZSWGNpQjcvV1dNZjBBVkN6cU5VSG9wMk1m?=
 =?utf-8?B?dThBajZpYnpqV2FBUDFKNnFqYzRhL1BQNFJtaGhPVGkzRDR4QXI1ZVArc1BQ?=
 =?utf-8?B?RGFEVWxBYi9oK1E2ZmswVjRQcERVeFZDUVNiL3h2dzlqSWE3T2IwNHp0K1RY?=
 =?utf-8?B?VnV6UFJuM3daZ2ZqdUl5RnZEY0huVm5QdnF6NS9ydFl5b3VMUkZvaHRRVW5z?=
 =?utf-8?B?MG9iWlJ2clk3Ulo0NkNCc1JmTkJGTm9POVVpZEUvZHJzSWlBeWd1NmxKc09i?=
 =?utf-8?B?WGVLREdJSytuT2l1NVlLbjBVWnR3TS9TRWp3NEMzbUEycXJwYXB2b0R1RFcw?=
 =?utf-8?B?blZHR2Y2UCtKQVhtcTkvYnhZVFhTbDFnZ0JKWTFRT3N6bzRNY0gwZUZxZzgr?=
 =?utf-8?B?cVAvckRlZWhKWi9tNUlKY015QUI0aFg3c24venBiQ2w2dGZ5OWprZXBicmdh?=
 =?utf-8?B?SW1HYXNYSm1pbDlpYUpwTi9Xa09oaElleWNqNVFhdG9kRTRpYyt6R1RWOWJ3?=
 =?utf-8?B?VXJuR3owNTBNaFJSNTB2MWlpRU9KMHp2c3c5dXhLaEtnTFFHclc5STU0MFhT?=
 =?utf-8?B?WE81RGVLemJmSmJzYzQ2TVNjeFo1aU9SUDZ2WXc5MHpTRXFpQWJIR2VsVDU0?=
 =?utf-8?B?R1NPcXVXb3FVd2dUNDgzR2taVWNyWnlwZHV2SDdlWXNPWW11MnNkeVk3Z1ZX?=
 =?utf-8?B?Unk5cFhIZ2loTUEybFlHR21nWXdySUQ5d3pqaFZMaFk1dVBmMFhZbm9Yb1g0?=
 =?utf-8?B?WTZweVhuVWNHU0cyUE5WeXlQUTZRSXk5SVJRelVpbTRWTGVXL2h6VnVlbDg3?=
 =?utf-8?B?bUYrT1hBcTJiZUVXeFFXM3VJcGVLZjk4d0lpK3NoMVo0Vzhsb3g1Z0h4NStF?=
 =?utf-8?B?QlN0eXNEbHFLZUpEdUswYjhXRWlBaTRBNWt6ekFmYVkxQ1VwSnFBankvNmNk?=
 =?utf-8?B?VWVTSDB2SHdQMlBuSEEvNXJ0RVRiMk1KdzRmZlcvZFFQdUZlQmMxUVl1R2dI?=
 =?utf-8?B?TFBwclNCWmpDNWxwaG9Ma0NjMVFYT09XcmxFaC81bUJUYmE1QUg0LzFCRFh5?=
 =?utf-8?B?QzlVK2F3QlNIU2xkcjY2TG9qRFB5QlM2c2VFMFJrTUc0a0tCZHkxY01WZ3k1?=
 =?utf-8?B?R1lpYjcvenBrRk95dHNqOGsydjdBSWhreGNZeHNKbEp6WGMyZWw3WnZSeGRM?=
 =?utf-8?B?cHJNaFJuMmQ0c2k3OFdiNDU5YkFlMHJ3dC8wcWkyUjM5UHZzMGdLK2tVRHJG?=
 =?utf-8?B?MGJ5T0g3TUNjUkFPaFBKajNpNGlhSXp4QTh2WG1XUmQ2U3l1NXVlRFJzS29O?=
 =?utf-8?B?Qy9HSXlBN2o5dzZoamxaZzhneHVRQ3lnakZWSkJuanNmTGx6WklUQzFVcDlT?=
 =?utf-8?B?T0gxcW0vcFhhVGF3MUdhdG1wM0V0UnpIN2k4SGhqOEhGYURpMG9mZW5QQUJt?=
 =?utf-8?B?aWdCSjF4UFlwMmNKWXlqRk95VmU4N3FlT3NLWU11WlhIM1VKaGhBdGU2OXdM?=
 =?utf-8?B?RlNDOUNNUm5HUnEzWS9xVm9GM3o1UDk5d1plWGFXT29KZnJLeGpWQ0JlRVNZ?=
 =?utf-8?B?bCtTMjJVODRET2w1OUR4UVcwK0hGbXdOSXJGczZNWFNYOVZGUVg1V0ZiQjAv?=
 =?utf-8?B?cDIzNGlqM2JHWnNTWUFpV21HVStqb0ExZGhaNC9LYnptUEdSQ1ZPcytHSEVp?=
 =?utf-8?B?VFUvNkJqd2V5S05WNCtoNUlSYTRxYm8rY3lNL1VIUlRNTVN1QUd3SElsL3ZB?=
 =?utf-8?B?aDhta3VIWnRKVG1FNFVRNGJQMTk0S2R5ZUYwS1pMSUFhaHppMnpwMHJ3SlZz?=
 =?utf-8?Q?PEwYFY?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eDliU08ralIwUTQ0R2hjRHJjam9kTjUrQmFOTjhCL2QzaWVZcE5WK1VGQUUr?=
 =?utf-8?B?bzRlTE5tcW4wYkRhU2JIVjVObWJOc2hRS1ZRUExKNkwzVjF5cFJqRXhtM200?=
 =?utf-8?B?MGo4RjM4VWVheVFMU0FjbjM4NFhWUEFBZUFzMFhCMEdnNmJ3U1lkZUtVQnlP?=
 =?utf-8?B?SWV6S3phY1lzL2o0bk5LQUlEZ2pFZ1BZcEFEcGlMQUdsbWZ2VmxDaGtaOUdH?=
 =?utf-8?B?aXc1TUZNSlBoTUFGaGFjeFUrSTJNRTRyNngrVk81dndGZDlRQ2g2TFcwVXZC?=
 =?utf-8?B?eVljQnlINlB2TjgyNlYyMUZ2MjBPR0kyZStvV1NnUWNZK3N1NnVTUDRtWFcv?=
 =?utf-8?B?cVoxSHlwck5ia05ZNytFSW1MM1pjZS9sT0Fvd1cwaUFzM0JLUHc4aHBLSnFq?=
 =?utf-8?B?K2NYNjJhc2U0MVFFeDFKcHNDNnZTNFFLNFRqQ2tYN2U3RjQyRks1cFYvWTRI?=
 =?utf-8?B?QStqV0pSdjBOMVh5aHRvcWVxYXZ4WVlMNFhxYUxBRTIzaDljNWllT0dHekdD?=
 =?utf-8?B?MFpSREJwbzY4U3VkVUJueXN0WWdwSGFKaVpoSFlnbHp3ck1tOGwxZDh1V0FW?=
 =?utf-8?B?SnBaUlNGNHdsSUdXTXdEbnhsYUZpTUVFNVhIeWlGWnNsVUsyYS95WWxsWWlo?=
 =?utf-8?B?R1ZuYXIvQ05JNTNuZFVGdmpRcnhxOWJyUHdNakxGOHJwdlNCdWVjQk50c2Y1?=
 =?utf-8?B?dnN0N29MRXU0L2pqYjVwZlExNWltUzRwZ3dDZ1B4aFVJaEVkUXBJRCtzVTRt?=
 =?utf-8?B?RStUN29jVEtqMkp4ZWtlUnZRaVl2UVZuYTVyZ3dyZU5wcUcvZ0lLVmJoZUY3?=
 =?utf-8?B?em5ubUFZb2Q1N1N3QjA4RWhuY3BYdVRZMmpwbSs2SmRNWFlnVkpGZGxsdWJo?=
 =?utf-8?B?a3NtSE16SkdpQ01XQzdPSW5lRkxScTVpbnFmdHJXTkhhNkcvcCtYaWZZdnBI?=
 =?utf-8?B?NnFId0QrSEFXaWQxN1h1TUh3M0lTRW1yNHdFLzJyTGlTYUNlTXFjcDJydlRK?=
 =?utf-8?B?VmJtV3IwUHdqeVloNEVOT0FhUTYrMnNxajdzQ1BJUUNGTWZ5MEF0RGN2UURX?=
 =?utf-8?B?akV4OUxwbURwa3haZWlsVHNRblRDL1Y4MjFzUVdOL3dFeUtyR0NNZzkxdVM1?=
 =?utf-8?B?V3dnbGw0ZFdNMTR6NTVHRWVyd3AyMmk1YWNuWmowa3ExYlB3a2VOVVloQits?=
 =?utf-8?B?QUNOZExKWWxRbUx5U1hJa3d1aWpFNW9vTkpmS28xRjZrNEdCU2pwUkoyU2RR?=
 =?utf-8?B?QzRyQlZCNGwyZ3FVdGYxb3FtL1A4M2JnTHVod2JJNjFrMVRBQzF3Q2Z5VTlT?=
 =?utf-8?B?LzZVZnVYakR1Tjh0M3BXRHBjRFM5Q2JIWGF4NFFDMGxRdWk1dVc0SkpPZjdo?=
 =?utf-8?B?aldwdm9JQm4wRWdWeXhGVUNGalR2R0ExNlBDMGpTb080dEsxbjNMdVZZR0xt?=
 =?utf-8?B?S2gzcldnV0lQd0E3RUtTMEJndU9lQ2VjTzJqYUM0K3hiZ3BKZ0s4MzJHTUZO?=
 =?utf-8?B?ellLeWduMlNxbDZibk9uZ3g5bksydFFpUWQxc1d2VU1DczVVV1A1ZDhMMGdr?=
 =?utf-8?B?V1lUMml1eHN6SndoUGY5Z3RFM3o3b2tnNkJHenVwNHFCRWdFSUx2a21SV3Jn?=
 =?utf-8?B?MVp3YmU1clBWcm85d083SUxpekErL0M1TFJNL3BtanpYaUp2Y0ZENk41LzV3?=
 =?utf-8?B?dGxQSGxPcm9KemtwT0NpVXQzZW9iMkRmU2VwQlpKby9ta1R1UTBESlRFNTdT?=
 =?utf-8?B?dnVqOUJvS1V3dnVHa20xemc2QlBOaFZ2bklCMVdnMENFQm16WlJXSkpQb1hn?=
 =?utf-8?B?dldCZXJJZi9RRE1KMTZZMzQ2S09UL3lwSitoU09hMUJ4Q1RXR1JXTk5GVDYr?=
 =?utf-8?B?OS9sQ1R4V0tzSDRxcE14clgyNXBlVituQ2t5RXMrU2FJVUxEVERMVHMzSHBY?=
 =?utf-8?B?ckczNGkrVU02NFlSVzRmY2FnY1lxMXJDZHpBTFVKb21WZ1Q2V09naTZ2VUd0?=
 =?utf-8?B?WDNoNmU3S1FKL2hiUS8xdEVqR2ZTODBUdnFDd014Sk0xSVk4bUVkNDNLeE5k?=
 =?utf-8?B?a1VMV0UrSlplK0hUNGVaOUVCd2djcjZweHk0UEJrYWNUbHFoUGlyVklzYVBR?=
 =?utf-8?B?V28wWU9QeUIzWjhZbFFTZjk4eXF1UmI3V3REdnVRWm9iYVZGcktYMkhQV09Q?=
 =?utf-8?B?QW0yR3VCdjlEMXFudjI0TlRzWS91akF0VUhzZXNsTWdxdHpHZ3NUTE1tbW10?=
 =?utf-8?B?L056YWVqQWdtcHBRa0JTbVhsUzk3SVZ4Y01COUQ4aWdHK1N6d2FaWW8xWTk5?=
 =?utf-8?B?NDRwUXRhc3hKeURWTkcveThVNDlRMWYyKytmYWMrTkFqeGQwZ3lRQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FEF393FAC4FDC4CAABE7D7569CF6F34@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 258ba799-dc6a-48f0-5b0a-08de48c36e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 23:22:14.4081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 X46ybJhpcAsFCUhbHirjKkAKYy6XHp3rAKv3QNcSgKfwQGllU4ZY8FO9KQJCAsevCjyA577engOj0gKDDfkmNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722
Message-ID-Hash: 6U7CCBHAXAUA2P3UACIAMPUAOQRUIKOV
X-Message-ID-Hash: 6U7CCBHAXAUA2P3UACIAMPUAOQRUIKOV
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6U7CCBHAXAUA2P3UACIAMPUAOQRUIKOV/>
Archived-At: 
 <https://lore.freedesktop.org/db9670da7e77274103f9784fc61520fa5041115c.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDIyOjU2ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBI
bW1tLi4uIHRoYXQgd291bGQgcmVxdWlyZSB0aGF0IEkgaW1wbGVtZW50IEZhbGNvbkxvYWRQYXJh
bXMgZm9yIEdlbmVyaWNCb290bG9hZGVyLsKgIFRoYXQncyBub3QgYQ0KPiBiYWQgaWRlYS7CoCBJ
J20gbm90IHN1cmUgaG93IEkgd291bGQgYnVpbGQgdGhlIERtZW0gRmFsY29uTG9hZFRhcmdldCwg
aG93ZXZlciwgZ2l2ZW4gdGhhdCBpdCBuZWVkcw0KPiB0bw0KPiByZWZlcmVuY2UgZGF0YSBmcm9t
IHRoZSBGUlRTIEZhbGNvbkZpcm13YXJlIG9iamVjdC4NCj4gDQo+IGltcGwgRmFsY29uTG9hZFBh
cmFtcyBmb3IgR2VuZXJpY0Jvb3Rsb2FkZXIgew0KPiDCoMKgwqAgZm4gaW1lbV9zZWNfbG9hZF9w
YXJhbXMoJnNlbGYpIC0+IEZhbGNvbkxvYWRUYXJnZXQgew0KPiDCoMKgwqDCoMKgwqDCoCBGYWxj
b25Mb2FkVGFyZ2V0IHsNCj4gwqDCoMKgwqDCoMKgwqAgfQ0KPiDCoMKgwqAgfQ0KPiANCj4gwqDC
oMKgIGZuIGltZW1fbnNfbG9hZF9wYXJhbXMoJnNlbGYpIC0+IE9wdGlvbjxGYWxjb25Mb2FkVGFy
Z2V0PiB7DQo+IMKgwqDCoMKgwqDCoMKgIEZhbGNvbkxvYWRUYXJnZXQgew0KPiDCoMKgwqDCoMKg
wqDCoCB9DQo+IMKgwqDCoCB9DQo+IA0KPiDCoMKgwqAgZm4gZG1lbV9sb2FkX3BhcmFtcygmc2Vs
ZikgLT4gRmFsY29uTG9hZFRhcmdldCB7DQo+IMKgwqDCoMKgwqDCoMKgIEZhbGNvbkxvYWRUYXJn
ZXQgew0KPiAJwqDCoCAvLyBIb3cgZG8gSSBleHRyYWN0IGRhdGEgZnJvbcKgIHRoZSBGUlRTIGZp
cm13YXJlIGltYWdlIGhlcmU/DQo+IMKgwqDCoMKgwqDCoMKgIH0NCj4gwqDCoMKgIH0NCj4gfQ0K
DQpTbyBJJ20gaGF2aW5nIGRvdWJ0cyBhYm91dCB0aGlzIGFwcHJvYWNoIG5vdy4gIEl0IHR1cm5z
IG91dCB0aGF0IHdlIHdvdWxkIG5lZWQgdG8gbWFrZSBldmVyeXRoaW5nDQpleGNlcHQgZG1lbV9s
b2FkX3BhcmFtcyByZXR1cm4gYW4gT3B0aW9uPD4sIGluY2x1ZGluZyBib290X2FyZ3MuICBJIHdv
dWxkIGFsc28gbmVlZCB0byBhZGQgYQ0Kc3RhcnRfdGFnKCkgbWV0aG9kIGZvciBQSU8sIGFuZCB0
aGF0IHdvdWxkIGFsc28gcmV0dXJuIGFuIE9wdGlvbjw+LiAgRG9lcyBpdCByZWFsbHkgbWFrZSBz
ZW5zZSB0bw0KaGF2ZSBGYWxjb25Mb2FkUGFyYW1zIGxvb2sgbGlrZSB0aGlzOg0KDQpwdWIoY3Jh
dGUpIHRyYWl0IEZhbGNvbkxvYWRQYXJhbXMgew0KICAgIGZuIGltZW1fc2VjX2xvYWRfcGFyYW1z
KCZzZWxmKSAtPiBPcHRpb248RmFsY29uTG9hZFRhcmdldD47DQogICAgZm4gaW1lbV9uc19sb2Fk
X3BhcmFtcygmc2VsZikgLT4gT3B0aW9uPEZhbGNvbkxvYWRUYXJnZXQ+Ow0KICAgIGZuIGRtZW1f
bG9hZF9wYXJhbXMoJnNlbGYpIC0+IEZhbGNvbkxvYWRUYXJnZXQ7DQogICAgZm4gYnJvbV9wYXJh
bXMoJnNlbGYpIC0+IE9wdGlvbjxGYWxjb25Ccm9tUGFyYW1zPjsNCiAgICBmbiBib290X2FkZHIo
JnNlbGYpIC0+IE9wdGlvbjx1MzI+Ow0KICAgIGZuIHN0YXJ0X3RhZygmc2VsZikgLT4gT3B0aW9u
PHUxNj47DQp9DQoNClRoaXMgc2VlbXMgdG8gZGVmZWF0IHRoZSBwdXJwb3NlIG9mIGhhdmluZyBh
IHVuaWZpZWQgRmFsY29uTG9hZFBhcmFtcywgaWYgYWxtb3N0IGV2ZXJ5dGhpbmcgaW4gaXQgaXMN
Cm9wdGlvbmFsLg0KDQo=
