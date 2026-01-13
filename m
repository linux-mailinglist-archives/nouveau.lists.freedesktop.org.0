Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF618D1918F
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:29:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF42F10E4DE;
	Tue, 13 Jan 2026 13:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="W7LxG/cx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E3CBA44CA6;
	Tue, 13 Jan 2026 13:20:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768310442;
 b=Hu3ZtzYx/w1+jCjzHeQAvhKvYy1KDdOp6qINqABcR/jgPbhLOgBq+uRr8XCCpeBYpeTIp
 6oha5ydP7akQFXNTmAaG5Wgmegv7hUEMGAEYv+I3XJr5az0tqIMAKhT4Sx0qRgGP75dtFJ7
 /81NluEFF2zZMz32CoBPrnumM9osWlv929nzk/rKjnzGwKduPvgpCHw21rM4bFN69cGfjwv
 2fiuta9qWi2kRyK/LMxQlHLm84oCLZo2vbF0Bjfh7uDjLqkOQc9AfO/nnSfd//3Qtsm+p8o
 CHzxqvdqIwHQB6mf25ZjJ4ZkV+t/AVBpLTHAbhKfdel01r2+3a5uM+wQj/JQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768310442; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dhFvEaX1I2+yJD3W9jmCx2B7esdoFcU2tDDgL7q66N4=;
 b=e6aJny4D8/Mt5GEnEb+BGwK2N2jZdqUpQW9qhJFdgq8J9FIoFRHpjTj/7C8VuW4jriO9l
 3OXEep90HFI8FqNDiJnzoP/qhn9pGab/owhppKzceqAihDpCjdYzEXi5wbl+z27PyFskPdO
 +egcgjJ6bZAU30sKaZhqq3OtZgsk44qgnq1q79PoMZkADLOWyc0XisOe7/JWE2ZNyZfPRXk
 HHHhj8jfDse2rnw+p+H+SIdu77fAO+Nd0HWUX3RvlVtHcBS9rQSSjvUEwrKXkk5cve+qNLp
 0niJg323GfDkRFk9k8COvsgSuovq8iWqu7iJkDS0KyXrsJ3IArolOqzz8gsg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EA37D44C99
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:20:39 +0000 (UTC)
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021111.outbound.protection.outlook.com [52.101.95.111])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE9B10E2A6
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugkw6WHv0gquBI7zHlk6gRuG50b/Yg8MS2BA3eeN52k0SWbMuNs649ixuGptxJD8om+se+IGYgBHtWDuiwf76bI7C5AxU6VwQesUvhjE+FxKcwlKXdUevAoOmYzM9JVgEdS6xxF6iJz2az6ogRyNubs1djbU5ZFXV67+X9TcxfTB/3I9Gg835cvB4JLsctg9THnGJa+1MfHgiK4fZozwqV/T4/tEaXl1eiNWnSdJXYBBzOZdpbbjY4f6g5NaA5f3wWd/lA0p3G2PafESYU+cyRDEHFEWrgooZK0L5F3mlMd5Ca6n3TGDeVvwgpyLd8Ld0BxsXHX3w/tbSs1WUpFHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhFvEaX1I2+yJD3W9jmCx2B7esdoFcU2tDDgL7q66N4=;
 b=oeSPuWddu4twq/FOxqS4UEGCT6sHC7RzmRfmXHf+5LD+imB6Kf3J6YAtxKMrqFGIUNecSTGpWjZ5jmwCnnYAhumNiC1nB8I0YVpd/5gMOwZG1ydmsLATShPdb3RdkV0ikxn+xjaTMuTfx70fe/vXhRQRJhYfNX0Po94S9UKzWKPpvqtlzR8HzUWmCE+GaFujFSiE811Qj2ioYhnDIFFtHJ3/sq1sAO16zIQIrbab8XeU6sOl59GoljXPoAGtNWmTSSaNnmRrCrzCrlWoRnDK0XBwlh1Z7jeLv9yEJxJ/+93pFL0RO63gwOMMcqVnIBdAZlmW9stGvnY6IVO85lgo0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhFvEaX1I2+yJD3W9jmCx2B7esdoFcU2tDDgL7q66N4=;
 b=W7LxG/cxmTbU8mFw1pcPFxvNAMSfntYoJ8NBTOhjF6blsd/7RaqsOjBFymdTL3AyrTFU/rCsEzOJTcfP1BApIV35VOv8Ixnp2PCLqrpNOMdpiD7YvSQPn+1dnkt2blDsz62EzezlpOgLAj5tmV2UNrN98EHLvNf9FtGHqGqUZCA=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2918.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:29:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:29:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:29:04 +0000
Message-Id: <DFNHWXHGF0TQ.3JS8MNNULB3JQ@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Subject: Re: [PATCH 02/31] gpu: nova-core: add FbRange.len() and use it in
 boot.rs
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-3-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-3-jhubbard@nvidia.com>
X-ClientProxiedBy: LNXP265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2918:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c23273-c91c-4e39-c612-08de52a7b96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eUI0ZjJXeEpwTUJOTE9pWHArU080UzQ3T1doeFJlQ2UzQVptanpua3I3NTdk?=
 =?utf-8?B?UmluT2V4ZkVZYjYvOE1HS2hJNmZBQUdJemJzamVEVjRKWVhnYWRoQUwyYWZF?=
 =?utf-8?B?K0NkaGdHelNWUTR5d3l2aWY5UUNmZDl0ZmVISk5TWWxYVUJsR3FVbHNhZC9X?=
 =?utf-8?B?bHdMd29aWS9KdzU0bmZrVHdCTmc2UHBwcVlDNWw0Wm8rYUxPYUpOd3hZa2Qw?=
 =?utf-8?B?alU3YWhFdnRqOW9hbGtuWE10NktDVEkxemRyK3F3anhIc1JXdEg4cjdsNWdy?=
 =?utf-8?B?WC9oQUUxZDc1VVdISVlubVU3dUx2cGR5MXJxWk5la0FtcnBYVEdmT010a2pI?=
 =?utf-8?B?NWtRMmRUaWNaMzAreUFCVmE1RUFOU0V0d2FGU1hmZEdObStWMVYxbmRwZGhH?=
 =?utf-8?B?dG41T1hFYnBpb2FmY3hES044dzE0QkZFWmlzWDRCRWxaZWtPUE1DMlY3SW9U?=
 =?utf-8?B?L0lYcVdCVEJCakhteExSdWxyVmlLK0gwS0Q5QS8rRHY3UU9JYnBwck1KZ3VL?=
 =?utf-8?B?SHA5b2JJQm1CYkFZTTBCR211a09nMW4weFB2Y2dKbU9lamVVbWY1VWh5bUF0?=
 =?utf-8?B?czJSQlcrSFAyMDBiUnRTZTVQSnZyQ1Vtd1Fvekxmd0Fzb0FzTGRENDA4UzlY?=
 =?utf-8?B?czVEWnZNYkZpTk1jRkNFRkNEMVdXRW1rZ2ZWVy9OaC9NdFFIRTlXV2ZZT2Fw?=
 =?utf-8?B?L3FZTzhvTWZ6N0EzdTg1YmowWVFNeCsxWHJHTWs3K0d2R1E0dmtvNkorc1k1?=
 =?utf-8?B?djVJVnczampQUnFhTGdka3FsdHg3R2JoMEpJWnhXbUF6djY3Vk9FcVJmLzZ2?=
 =?utf-8?B?MXFINUJFWG5saUJBUy9Lb3hFZVpwLzMwK3A1dGJzQnRPMnIrVFNGazVUQzk2?=
 =?utf-8?B?OS96WE9ZSTYwWE9jMXhDSDZpL1U1NE9yNXlXRzJhbmRuTVp5OGNGWlRpNmVD?=
 =?utf-8?B?VitIYnRubURmWG1pUDZabmRZdUNINk1YU01KN21IcTd3eEY3TFM2MGVuTjcr?=
 =?utf-8?B?Ry9TMEdyczFtTEROQUdDVGt3aWpLMjFZVndFZksvaFpzcHJWdDRELzR5ekhp?=
 =?utf-8?B?azF0RzNLdlZoTkg3WDByMVRNTVNmeVhkUlNST3llZ01QeEVJMkNqOGZubmZ4?=
 =?utf-8?B?V1Izc1J0ZmVSU2lUbW5tOE5HVjdMYkhkcUx2WTdyTlI0aXlGK3lJUkpWY05q?=
 =?utf-8?B?THBZYS9XajRINkhNSGdjdXFrejJzdEFrRERCeVRCZkNyTHVCdmVaM2pqckpo?=
 =?utf-8?B?ZHM4QlEra2ZZZ2ZaeEVsaHFhN2UxWnJTS0VraTFkaWtpTkFBd2wwdk9UODZm?=
 =?utf-8?B?d0VvU2Q5ZmZuVTZYdzZ3Z05TZzVpR2IrREJzVElrQjlnR1VkMWhFKzdiV1F0?=
 =?utf-8?B?M0U0Z2RYdXcyWXJObnhDYmVhVXoyYTdBcS82NFNlOHRiNWdYbzg0dWtzRmJF?=
 =?utf-8?B?VHdjQ0xrRXFhOHNMQnV4bTZONDJLckRaMlRyYlRiMTRZeDhUclNrU282WG5L?=
 =?utf-8?B?enFxdzRTanJ0Q2ViOVBWQ1ZLU3F2MmlQL1krcEFIenl6UTVDbmRQSDdtMDJN?=
 =?utf-8?B?MDNDYzJhL0FiUUZoeFM1V01nL2dmUUFkVXhPRjNNcGZXdFh2ZGFySlVDcGNR?=
 =?utf-8?B?QXZSVE81Snc4WUUrQnZRNjlCdG9xS05MN1dCOE1BazdRME9vUnNoTkp1NS9R?=
 =?utf-8?B?QWhTNVd1TGhLOG1ZZ0NaTmlNV0xpU3B1QkpHTk5KNmxKNlI0ZWY1ZDkrTSs2?=
 =?utf-8?B?TEFYYzhMQTcrcGFwamk2dlozblB6TzNTUDk5TWdKOTFYcmgxRjJCS1FRWmZv?=
 =?utf-8?B?UTRxS2FuNlNXZG16eDE1d3g0SzBqY0M3Vlc0NXBZZnQwQkNzc01BSmpLZW9p?=
 =?utf-8?B?amVXSEIxQmRQZFBibEtHL1dIRUtVNWxqS0IvaFZBTDgxWWVnTmxOOXNTanhI?=
 =?utf-8?Q?Zyf/q41RGBqBmFnRCdENgSG0XQrjilOt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU9sZk9pSzRGVE1ZQjcxTVczK0JFMysrUEMzNHZ6V0gwbjNPcmtpYW56aUl1?=
 =?utf-8?B?bjNoS1A3QzBzOEhNdHNxQVlyVndrNVJRb1VtcjBTSldaM3h4OEtnTTV5Tit5?=
 =?utf-8?B?eGUvYURoRXcxK2oyN29HMjlZcHZ4emNFUkJPNlNRa1dnTGV4U2FBVW9rQjFH?=
 =?utf-8?B?QjRnVEtmM1QySWE4Zkt5YzI0eGdBdmJVcTl2ZWVoSU1DVDFJNEExd05WTG5i?=
 =?utf-8?B?TGhvTFBZRU9ybmJ1L0hwditaQVBuS1Zheis0UVFOUUc1UmlZNVhQdDVTcyt0?=
 =?utf-8?B?c3FUOCtkUjgveG5QdktIOFlFQ0FkMnFLUjJWV3c1M2toRnF5dlptRWlRT0JE?=
 =?utf-8?B?SXNMZEFaVkdwTVBUM1kydHdLbyt3eERLRXV2VHNReW5qQUFOQnQwN0J1MEJh?=
 =?utf-8?B?WVkxZWJKMThmcGtybEVCNG9XR2plQzhPWElSZ2VQTi83bFZWVVBkdFVNU3pU?=
 =?utf-8?B?OUZNNXpRTXJiOVV0YXdGTnZITWNReWJMZ2N2eVhmUlR4S3VNeFlORXdZWkZC?=
 =?utf-8?B?emgrWlVMMDJZemR2MkxNcFJSaUVvUTh6dVFDU2kwVE5XczFrZ2xremI1TUdy?=
 =?utf-8?B?Rmo0aHlTR25YTStEMDZIMERReHpnYkI5UUFoUWFJZG0xb0dHQ0F0RThwa21h?=
 =?utf-8?B?Mzd5SGh4bnpYVTFIVkVJMWR4ZndsVzJpek5JL2FSYmxOa0x1N1dLdjRFWDl6?=
 =?utf-8?B?MXJWSGN1aDVWSDh6LzdmWHhUS0NIY2s2ZWw2SDF1djlUNENWV1pZbTVicXNt?=
 =?utf-8?B?SjBtN1ZacWM0ajYvTWpSZk9ldklmU0FQVVIrTWdWb0tqWlIzdmwwc0pMN01L?=
 =?utf-8?B?MU5EYUVMcmpsMnQ1OFdFc2VjV1hiMkVUV01qWk1sRThITjRHTkQrM0NxZy8r?=
 =?utf-8?B?ZTY5am1CamhTeDdodHZxbld1cGNTckVtc0lZeCtCMFljczJLWnNMUFZnZVlU?=
 =?utf-8?B?QWpuWFdDbUNxRG8zd001K2tYUTBFaHFRZ0grMjVpcUtObmxuRVQwdmloYWQ3?=
 =?utf-8?B?VkNqOVZTU282VDAwMXhENDZkVUtyenpQcGRtYjF6WElpdzViWW5lNWRVYWNx?=
 =?utf-8?B?WmNTRmJGZE9LbXorNXpCcDFwTUhyN2dxSEkwV1Q2eW84ckY3T09MeHlLWG84?=
 =?utf-8?B?dmVJbzUyN1pQdDNPRmVYZWZTbmhkREVrM3IrUFptZlJ5ejl1U2JCalpLaGYx?=
 =?utf-8?B?VlNwVUV0R1BreDN6Z014T0FKbUh2eXlSZUthbTl0K2pMQ0hFZjdrN2tkTVI2?=
 =?utf-8?B?NTdoWjlVeEx1R3NDdFNJODk2a3FoZGRLeFBSYytrTVlYRXhDK3IwOHlIR0xo?=
 =?utf-8?B?UlhjYVM3cXZuRk50bDRjN1hZMGNSKysyOTNBNjlKSGNyS3MweTFyOWVFbzVK?=
 =?utf-8?B?VnIybGZESHVzcjdzdzBnNEt2b1lmaHFpdGdmMXRwMDlpSVp4RHgrcEVBVnhK?=
 =?utf-8?B?QW5zN28xMEZ2OThhV1JwY2k3cm5Ldyt3NzM3YW05M3dnNDA3YTRWcmpVamZX?=
 =?utf-8?B?eExVQkN5dkZIZGY2UVYvTzJlWCtsNUlPckMzdysxK01lOGdhR0dHUkNLWG1x?=
 =?utf-8?B?ektOUEhNcEZpaG1SQndrR0ZISXIySjJBV3MvVHU1ekxnOEdxaFNScU95bTRx?=
 =?utf-8?B?cW81RExnVHVYSFVHc09ZQTdkVTRLQ3ZYRzdSeVFvMEt1RmpiaGpzcDZJUVFY?=
 =?utf-8?B?NXVkN1l1ek5uS1NYQWhqUWpCRFA2VzN2NFIvL21CQXdsVUxNVnk1VjRGTy8r?=
 =?utf-8?B?d2lyQ1pwU3FSK1V1c3g0UzZMVFRQbVhWYW1QOEJkdU44L1loRGdqd2gzcmJO?=
 =?utf-8?B?TGZPNVZMMitGQml0dGExRTE3aFZCcVdObzZEZlBBM1pRYTVHcmpxdFpmRk1q?=
 =?utf-8?B?TDJDcVpqdmYvZ0RldDUrOEVRQ2ozNTl2cW5CRlM0SmdvUFphYng0MVJseWE0?=
 =?utf-8?B?S1BZaVo2WENoU0FyeS9JREJWQWh3cVFNU2hZOFBNcmZScDRFN1pXZTNERG9w?=
 =?utf-8?B?anhnQjJmLzl3cjhLS1FxbmVtYjRIc0lBVzBJMGZNMEtob3g3RkN1ZWxxN0xi?=
 =?utf-8?B?aGlqT2FXV2dtdkNrVHY3UEJwRDVIRk81Ync4UjNySTZMM1VFbm9ieS9pVmdX?=
 =?utf-8?B?ZmxvcjdmUVFIL0FFUklYaCtUaEF5VnFVQ3I2eVlyTnA2SDJhdFBmTjRta3E0?=
 =?utf-8?B?dDhUdFdNQ2NMa2R0Mys0RmRxMm9wd1pCQ2Z6bUlKeEdERlloZTZiWWJSVWsw?=
 =?utf-8?B?d00yZ0JnSEdxKzM5UTk2ZmMzejBwOXJDdi9URU9DUFA4d05JN1dhd1EwRDlx?=
 =?utf-8?B?KzdOS1FRRFJ4L2pnMkVOVmhjMTBudmtQdDJXejlva0l1RlIwZlE3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5c23273-c91c-4e39-c612-08de52a7b96d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:29:05.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SNCoLk874B5UNB6rcYfTjaLtp5Qf2B7Ylwmg3oZ550pHdJtWSeLdhvqDGsh6ykJJvPpHBKEOyZgkKSABPrP1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2918
Message-ID-Hash: RY6NPYYJFGRFY3EKNZQ3SHOQSRJNIFSO
X-Message-ID-Hash: RY6NPYYJFGRFY3EKNZQ3SHOQSRJNIFSO
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RY6NPYYJFGRFY3EKNZQ3SHOQSRJNIFSO/>
Archived-At: 
 <https://lore.freedesktop.org/DFNHWXHGF0TQ.3JS8MNNULB3JQ@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
> A tiny simplification: now that FbLayout uses its own specific FbRange
> type, add an FbRange.len() method, and use that to (very slightly)
> simplify the calculation of Frts::frts_size initialization.
>=20
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/fb.rs       | 6 ++++++
>  drivers/gpu/nova-core/gsp/boot.rs | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)

