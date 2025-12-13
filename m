Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC9CBB508
	for <lists+nouveau@lfdr.de>; Sun, 14 Dec 2025 00:47:03 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 871D110E172;
	Sat, 13 Dec 2025 23:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B/DtrCo9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EA3C345223;
	Sat, 13 Dec 2025 23:39:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765669181;
 b=uWrHtkezQpfqobRRl+LMwZPbEf4G4EfIQfCba75eFk1v43HR+x0Zl4BpNWm6TAmqBxFz0
 FNQ/1SExG6Lrpu/RLOw+hlxghO5G4fOZ8ZASNgo2sbhS/PC52ntgZNYXhYRtcYnkhgffqRD
 gqhadlV+mma0AF158XQdJTqw7WReVCYhq72mr5Q3xmDFUYWgNWZD7n58YOAUHIzbJ+yOYnU
 L+/5Tz6e0bfbGuObn9lmLexQr+LIAcikyWZCwNV2iYkouw5EO6sncYzmm04mbXVU/HCnQZ7
 AAWDkiHm8WkwGqnv+8quf7IBa2QcBuGEmGGjst5qLo5/sXzwZj7F7MdM9eEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765669181; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bLSw6+ZbHviO10KdUNeSvrkPacCwUkbOOl51qYYUWH0=;
 b=HofMZyrdIkgZ7l0ReStT4yjYagCUnqpIojAbr/BLnP8jp81YruEKoFFBeW8IZ4Ov4ryEn
 fIeaog0iwR8XVY52cRG2cVMrqyTMTYepIqgc5QXmozh/3NrIuFE2ZV1fKCWh9kIAVESrFcb
 tmv5Ws6BorX6qn5TOpA6/qN/bQVxo04SFl89QGAJ8ZEO7TJQO1xNE5bF2HR282JMs0u8dyt
 cS7zdnYCG9v3hjLYwhTQj8rmljNvNXnXix51rCmWo+OMZzHuogG5N8usB6Vv8l9/tYWbBvp
 4M5Z2a90PJ+GIkVF/spiIOglmEpj+MKqJkoGOaWdGcxqp3REI+yuMuSC9bbA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DBDF54520F
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 23:39:38 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF3A10E00C
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 23:46:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4LxchShFGsQff9yksCR62Qr0OGIIkmOGuYqk9kgeSP2tb7z+9Kv/7to6aAN3krKqhFbGvjwtQTFQ+1nN6MwF1O8rar4Jm6qFNyZtwK/ioYT5LOPyysGqlkGvDff2+hpJ2ZA1+H4qFJCkr6VaJX2A+/+PKfaF4bKzuQv++Yorjm7/L65W+SN1Qcqp9O6rXn7ULQnO1nCjydwXDPa6MsCGC75q1Z7v9t+qrdFlZg8qQnS8AGD0JRedwMZVMzp+AXn/ITfUvz5O/mXrC9rxYAEzj1rTCwc6RSRE2yNl7+tjRCyIdGhU3OyjPy03azqWvexDR477mtDrLOA5f983JGvuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLSw6+ZbHviO10KdUNeSvrkPacCwUkbOOl51qYYUWH0=;
 b=bvxPvplfMrp/k4ZbU2GYgZ2zsg1JU4pUBKLK73WpN0+7OxcYHW8dhhr5CrKuqKdnYxFY88xfcHKNtMcLPuUuvYLJ1C7TjfHlt7I+awBaxNe9dv86NHm9fYBGydst+DL7IKHra95QXukfK5cZ33qqzzJU0Z49s6mcPOI3d1KevNXyDzATU3mDZuVpT1LhN9vfdjLGsNDIF25cXxi3sB0uVbOJIWx4GjQ26ZvKXWpjBclBMQeDZPfdyp9lxHwDJygu4I7to+oVPEUjtHOmQMViTptaF7rc4Kj0FtFelvMxh6K0Q2nVTpez6N7xMlsPsXcifukEcJhcLe9GwMxbpSegvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLSw6+ZbHviO10KdUNeSvrkPacCwUkbOOl51qYYUWH0=;
 b=B/DtrCo9oPfu9mzB7R35SqQ9/emYgQNt/zlNVL7zTkMRGHj+FFNCvxzRStxkHZTFzASkeBgiK3T88Qqo0YSw4GfV6rN3wNZWwfuzZLanlEGhNRccTMsGCgQyYprJ1yn1M+8RfTWVhNHD1prwDufgYgYOxDixVPd9i4pn7aoLQT13uJUVZ1EUYGTMd+14nnDXYpifJzQ+VB1iNr0GxKi4ip/Fr9M1rqqqP8966gQ+DfhbIjWhZVEvWM11Byy4RhZWJO4g9+UMJPBot8pjm3H+jkumyc7MgIZiyX1A1JGjEOV5pFAHVbuxKnnTpP++e3A8ALX9PvgPCYYHMNAEL/82Xw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9638.namprd12.prod.outlook.com (2603:10b6:8:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Sat, 13 Dec
 2025 23:46:54 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 23:46:53 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 2/7] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Thread-Topic: [PATCH 2/7] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Thread-Index: AQHca6juMPar6jwhSUCnZt+IBepKuLUgPjKM
Date: Sat, 13 Dec 2025 23:46:53 +0000
Message-ID: <50A007D8-FA6E-420F-8B6B-EA9A3786F9CE@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
 <20251212204952.3690244-3-ttabi@nvidia.com>
In-Reply-To: <20251212204952.3690244-3-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DS2PR12MB9638:EE_
x-ms-office365-filtering-correlation-id: 10ac3c7e-780b-4126-c92f-08de3aa1e4f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OE1DZU4zMDdEendGaTdYY1A5RHNDeTZmWHZaamh1MmoyYjRGQ1JkcGZMalU0?=
 =?utf-8?B?L09Mb21IU1pmTmxLV1NqTVlOSDdTWGtjY1hxRUZWZnVScm5JR1RiNEhTdEhH?=
 =?utf-8?B?OTFGdktHa0htRVdWQkZBb3BLTkVlVFhMLzBsWXFwL1ZpeGt0eGlhYXRmTmla?=
 =?utf-8?B?dWVQNFF1amdYVEY3ZTJKcUNldkl5RTYzRVBIdFN6VGFKUVBTQW50MTlJMGEz?=
 =?utf-8?B?QVh3Y2QyRUEyMVptYnRFdys2QzIrdnJhSXhXU3pKdzlNSGlYdStuZjV2eFFh?=
 =?utf-8?B?MXh6SThTYzNkanpKdTYxZnUzSnpJZnFWOU5GZkRhNnlBeUhMTVlZVHZ3UU9R?=
 =?utf-8?B?MkVyQU42VHJ2MkhGczMrbnRNTnMyaFA2U1g4M3FOcEQ2azFlRHNZV1hYVVBj?=
 =?utf-8?B?bzJkVHBYRC9rUm5CTkl1VGdQcU45d2dLRm9RQzdsV1gvQlMwZlFGb3Z4MzQr?=
 =?utf-8?B?RkxuV2t0ejlTN0ErZHZVSkdNbmFwVXhBQW8yMXB0MEVFdkQ1VWtmeldUTnRn?=
 =?utf-8?B?dVVMaDV1VlZ1TkpyelpuTU94RlB0ZDROMml3eGxZYkdvSlVUUEF6Z0Z3MGlN?=
 =?utf-8?B?aXdKS2k0Y3ZlVDR6UDQxUEwvUnlxbXl5VTd1NmlVUXp0QjNPaEFkRmlIaWhQ?=
 =?utf-8?B?UjMvR2xSWkxraWVwNCswNzc2ODcvcjVxeFVjUWlHTnZhY281WHpBYkpBN0NK?=
 =?utf-8?B?RDZaWjRlNG9rNmlseCt6bWhXM2hoZ2FjTUhGRUg0SUVsZGJPZGV3SFhINjUx?=
 =?utf-8?B?Y2JBZHI3STc2K3V2eTBRNmNhMUxXbEtoUkI1ckFXZ2xNRWhENkZqZXlycVFk?=
 =?utf-8?B?dnNCTzBpTVJpQ2pHd1BSSk1ndDRhM084WGV6MG1XTzQyZnkvZVBRZG9aa1lj?=
 =?utf-8?B?YTFMaUtXeTl0UUhhcVJkVmpmSzlUdGhHUlU1Y0puR0kyQTRPOHYvQXpZa211?=
 =?utf-8?B?OG1jL0RXYWhkYjFoMUFPaFo1Z2toeExQbFBjcFgxeWlsZXU3bVJ0ZGFBZHBz?=
 =?utf-8?B?cURFV055QjhJeWxhZlhLYUJKNG5RVHRzdGJzSFpPbnpxQ3Q3TGdkemFDUHpy?=
 =?utf-8?B?MFYrcm9OUTlpL0g2N2dSMTNlT1JoRE9UL1k4VVhPVVExbStzclBQdVlySWJC?=
 =?utf-8?B?dzFJdWxadUlNMmQ1czBXTFhDL2xnMkkySStySTBldFpDSnBTbWZGZHNLV2NY?=
 =?utf-8?B?d3NyaTFic0ZxdE5qc1lXeFErSGRidjZDeWUxVVg5a2lkS3dxQTdFdWR3eDhO?=
 =?utf-8?B?alZUdUtqNThnMXlWNCt4N3RXYStPNXJmamtpM2dmbXhpVnIzb25xS0o1T0Q4?=
 =?utf-8?B?UU9wMnZTay9yQ25QdVZTSzR3ZG13ZTh0RnU4dElaZU9nYWpJd2tkS3I3YmNW?=
 =?utf-8?B?ZnFSV0NpWi9SaDBIeVdCVDBiQUx1U0hSdXNEQzhNT1RWbE0wV25zNTRyYTVZ?=
 =?utf-8?B?Y0o2ZjV5K1htOEVqYTg1WnNScGVCTmU1cjdFZEJuMllaWXNob3NlUlNsZXpO?=
 =?utf-8?B?Rm91Unp2V21jVmp4RTVJZU03dlpuQks1TVVqNEp0Lzd3emlOelpLbGs1THlF?=
 =?utf-8?B?YXUxTnFNWDkzdFM1R1lrczVyVTM0OWIzamIrTURnd2tWYjdnR2kxbFhTWUd6?=
 =?utf-8?B?alJ5YzU2c2xGVkdiRS9mb0wxVGZGUldUa0MveW1tZ3g0Q09IUGVQYVZmTjJH?=
 =?utf-8?B?Q2lWS3VYODBjOEZORXBmZGlNQ2E4ektWaTE4ZXJnOEJrdzVScktGREc4ekxI?=
 =?utf-8?B?Q0hUK0d5Z25VUVRxaVhvUWQwZUI3NndSMU5pcUFHOXphSm1Tc0ZWKzNIdXVH?=
 =?utf-8?B?Y05Ha000bFRJRTZjUk9Bbm9uZjJaMmhubU5teVVNZit4dmxlaHhYR2VFWHJq?=
 =?utf-8?B?MkE4b2orWmhvT0ZMb3FZSmZHUFp1b3lzbFZKYkpOTXVwMFNDTWR0V1FLRy9F?=
 =?utf-8?B?dTlNRTZ1azhQQWhwdUs2WlM3ZW8raTNtMmdSTHllU1Zma1dLNjhsdVY4RlhX?=
 =?utf-8?B?VUU3djdkdnFiMDJQN1JGK3RLd1E3RytEUHhWYjVtZ0x4UG9wY3doVkFMeFdq?=
 =?utf-8?Q?lsUt0Q?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cTBhMmdCNndpdWpRRlQ0R3RxcG82Y25tcW8xNExvWktJOC9hQWM1OXJKaDh4?=
 =?utf-8?B?OFE1WmJFL1ZOdHZYeCtmTEY3QU0zMks3TVRzTDhvVWtKVFNQMTc2OFRqbnVp?=
 =?utf-8?B?Uk1ic2FBeUdMNzJOdFBHUG5MK2JYanF0NVlHeUs4cXY4VTI1Y2pRcjYwWjFS?=
 =?utf-8?B?UldVb3BqTHBLV21mTEd5VzAxWTRKb3BaYmszYjdOMWlkbW5ycFBHRDNxWVha?=
 =?utf-8?B?UzhSWGFxOGtCTU90SnRlMzdPRElmNms2V3ZpcVA5YjN1L2xyTVF4b0ZTTE1t?=
 =?utf-8?B?L244bHhKalBYVHFENU1nR09ERE9oU0VlVC9jTHg3UG0wZ0hDWDlxUkZQUmdT?=
 =?utf-8?B?TzVXZTdsbFJyZlJiRXQ3WHk3QUl4ejJJL29jSTdXbDF3THVwT2pyM3p5T0xM?=
 =?utf-8?B?R3FZWm53M0JLUStzMytWaThESFRPUjBjY0g5cUNxZktQaklJVHVKbWxHeGpJ?=
 =?utf-8?B?djhMY0NJY09VQzByTERFU2xDdmp2ZHZhd01aYlJJUmNZVUc0bDlEY1dJNmdT?=
 =?utf-8?B?MTlPSkV6MW1Kd29Edjd2N3FUbEtaTmk1OC9yT2x6VVkwN0xVQmxXMlRqZVZQ?=
 =?utf-8?B?S29sUytOYisxRkgwVnBXNUkyd1g5MTY3bHp6VTRNVi9yUG9FbjVMaFFBWWpw?=
 =?utf-8?B?dlJtVUp6OStpY3gwMjNQTVM4Mk5saUo3K0F4dFlqVkZ0WGV0UGs0dTlnVERD?=
 =?utf-8?B?WUs0M2FNSzNORlpKTW5DSythaEVCQm5zWXdIZWZ5dm9pWXA4cDFSbVp5ZzFl?=
 =?utf-8?B?NzRDTHYzanVkL1NZa1ZpYUF2T3U0clo4ak5JN2dQTmhNZlN0S3didUV2WXlC?=
 =?utf-8?B?a1BLME1IMEw3Uk95dFFSMUF4WHpQV3V4clFWbnRDMkhKSFdYd3p5bmxrWnBN?=
 =?utf-8?B?WnRVVWFPb3RVeDdzbXFobVZXSlFVUGJvYmV5cHN6ODV6SmJhQ2p0WjF0RFZD?=
 =?utf-8?B?eW9vTUg0TjlacGFCU0tRTzFKVWJSVzliSnNPSjgwVnQvd2ppTFg0T1NCOWF0?=
 =?utf-8?B?WHk2aDhLOXlEUzNqWnFsSzBTOFVsKzk5aDR3RDF1N2toTStoZ3pnUGNYenBV?=
 =?utf-8?B?NWQzK09JcVkva3BIN3pKbzZGbTI3NmNDUzk0RFAwZ0UxZVpaQ21XVnJ1Qzk2?=
 =?utf-8?B?VWN4S3RuSFdKeVhLdmc0TTRoNk5iUEt4RE11N0IyeEQvK21rcGk4em50Wkxh?=
 =?utf-8?B?VFJzV1BxV20vOEE4ekRlMFNnMVQ0dnhkSDBpM1crWlFJQ3NEdm9HUDloTjhh?=
 =?utf-8?B?K2F2TGtwM01ReVk1RkliVnRpRWgyWlByYXFrWURNZElUd0hicmFBZlVmeTQ0?=
 =?utf-8?B?MmlEeW5VVUxadloyb1dSMkVNRkdIVDAwRGF3OG5mOHpxVGZydG9lV3hheVRQ?=
 =?utf-8?B?UENETE51UHBSa3pFbWdXeXdCZ2QvRWVIQWlHdHZ5cFNLSXUwSXdFaG9DUXB3?=
 =?utf-8?B?VTNrUzNxZG5HNnh0Y2ZhRmtrT2hqenZjcGNLVzNlOG45UWJDS0dBWm9mQzgx?=
 =?utf-8?B?QUdwUXVJWXRDcldwci94K2YvYnpGQkhDT3g1R2s1YUFmWVFVbm9nK2xHMkhi?=
 =?utf-8?B?QjBINUVTM05LQmtJWWdyT09yQ0UvaThrSGlyeWtrY3dQU3RHZUhBVlRDVkph?=
 =?utf-8?B?czIvclJrYzJBaWFUQkNuZWt3YW5jWmFqV2ZJQTc5WnNvV1RxRTZ5dk8yWWpx?=
 =?utf-8?B?M29maHplUmEwRzJHS3dlNWF6aVRCU2xjWk9Sbkk4UXdrZjFpTm1ZeG9jMnIw?=
 =?utf-8?B?ZFhld0Y0SHdaSXdXSnpXSllHYnpiTEVTZ0ZtcHBpMUhTSlphbkJhWlJpbFJv?=
 =?utf-8?B?SWtsWTdkajkwK1R1SS9hbzNBeWpDaUxRVEcwR3Q4S1hTSXBWeTJja0VoQVp6?=
 =?utf-8?B?RkcwdVByTUc0T0YydGtOZWhmd2tibzg5VWhyNFM3NTJkWWlJNDVYTkNSeHdi?=
 =?utf-8?B?cjhBRlkyL05paG5yeG11NnhLWUlkUnZWazlRL1FNeklMTWpNRWZIN2FqaTlR?=
 =?utf-8?B?NmI0a3B3Rmp2SitCZE4yRldZcFdRZ3NYS3BRVG80WXM4elplQmFXWSs0NDVZ?=
 =?utf-8?B?OHpqY2hUVW5KT0NZLzJQRTNLemlDNjBaL2VOZythZTNqazhOdUxkOUdFTnRU?=
 =?utf-8?Q?ciCRbpGQu12yhLJoMTvcVRItA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10ac3c7e-780b-4126-c92f-08de3aa1e4f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2025 23:46:53.8551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Ds3jD0LKMdFFRrElqXI+QQp+YpbWfOBMXuA3BfQzVEPUsWkssKuN2GUQPYO3ul70ClFxDGzt/JJGYwK8id/6Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9638
Message-ID-Hash: AFR6KXJTBLQAZXCOKBYANYBC3PUIGJS7
X-Message-ID-Hash: AFR6KXJTBLQAZXCOKBYANYBC3PUIGJS7
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AFR6KXJTBLQAZXCOKBYANYBC3PUIGJS7/>
Archived-At: 
 <https://lore.freedesktop.org/50A007D8-FA6E-420F-8B6B-EA9A3786F9CE@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDEzLCAyMDI1LCBhdCA2OjAw4oCvQU0sIFRpbXVyIFRhYmkgPHR0YWJpQG52
aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/UmVwbGFjZSB0aGUgbW9kdWxlX3BjaV9kcml2ZXIh
IG1hY3JvIHdpdGggYW4gZXhwbGljaXQgbW9kdWxlDQo+IGluaXRpYWxpemF0aW9uIHVzaW5nIHRo
ZSBzdGFuZGFyZCBtb2R1bGUhIG1hY3JvIGFuZCBJblBsYWNlTW9kdWxlDQo+IHRyYWl0IGltcGxl
bWVudGF0aW9uLiAgTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIHdpdGggdGhlDQo+IGV4
Y2VwdGlvbiB0aGF0IHRoZSBkcml2ZXIgbm93IHByaW50cyBhIG1lc3NhZ2Ugd2hlbiBsb2FkZWQu
DQo+IA0KPiBBbHNvIGFkZCBhIG5vLW9wIG1vZHVsZSBleGl0IGZ1bmN0aW9uIGFzIGEgdGVtcGxh
dGUuDQo+IA0KPiBUaGlzIGNoYW5nZSBpcyBuZWNlc3Nhcnkgc28gdGhhdCB3ZSBjYW4gY3JlYXRl
IGEgdG9wLWxldmVsICJub3ZhY29yZSINCj4gZGVidWdmcyBlbnRyeSB3aGVuIHRoZSBkcml2ZXIg
aXMgbG9hZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGltdXIgVGFiaSA8dHRhYmlAbnZpZGlh
LmNvbT4NCj4gLS0tDQo+IGRyaXZlcnMvZ3B1L25vdmEtY29yZS9ub3ZhX2NvcmUucnMgfCAyOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvbm92YV9jb3JlLnJzIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL25vdmFfY29yZS5y
cw0KPiBpbmRleCBiOThhMWMwM2YxM2QuLjdkN2I3NTY1MGIwNCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvbm92YS1jb3JlL25vdmFfY29yZS5ycw0KPiArKysgYi9kcml2ZXJzL2dwdS9ub3Zh
LWNvcmUvbm92YV9jb3JlLnJzDQo+IEBAIC0yLDYgKzIsOSBAQA0KPiANCj4gLy8hIE5vdmEgQ29y
ZSBHUFUgRHJpdmVyDQo+IA0KPiArdXNlIGtlcm5lbDo6e2Vycm9yOjpFcnJvciwgcGNpLCBwcmVs
dWRlOjoqLCBJblBsYWNlTW9kdWxlfTsNCj4gK3VzZSBwaW5faW5pdDo6e1BpbkluaXQsIHBpbm5l
ZF9kcm9wfTsNCj4gKw0KDQpJbXBvcnQgc3R5bGUgZXJyb3JzIChvbmUgcGVyIGxpbmUgd2l0aCBm
aW5hbCAvLykgbmVlZHMgZml4aW5nIGluIHRoaXMgYW5kIG90aGVyIHBhdGNoZXMuDQoNCiAtIEpv
ZWwNCg0KDQoNCj4gI1ttYWNyb191c2VdDQo+IG1vZCBiaXRmaWVsZDsNCj4gDQo+IEBAIC0yMSwx
MyArMjQsMzMgQEANCj4gDQo+IHB1YihjcmF0ZSkgY29uc3QgTU9EVUxFX05BTUU6ICZrZXJuZWw6
OnN0cjo6Q1N0ciA9IDxMb2NhbE1vZHVsZSBhcyBrZXJuZWw6Ok1vZHVsZU1ldGFkYXRhPjo6TkFN
RTsNCj4gDQo+IC1rZXJuZWw6Om1vZHVsZV9wY2lfZHJpdmVyISB7DQo+IC0gICAgdHlwZTogZHJp
dmVyOjpOb3ZhQ29yZSwNCj4gKyNbcGluX2RhdGEoUGlubmVkRHJvcCldDQo+ICtzdHJ1Y3QgTm92
YUNvcmVNb2R1bGUgew0KPiArICAgICNbcGluXQ0KPiArICAgIF9kcml2ZXI6IGtlcm5lbDo6ZHJp
dmVyOjpSZWdpc3RyYXRpb248cGNpOjpBZGFwdGVyPGRyaXZlcjo6Tm92YUNvcmU+PiwNCj4gK30N
Cj4gKw0KPiAraW1wbCBJblBsYWNlTW9kdWxlIGZvciBOb3ZhQ29yZU1vZHVsZSB7DQo+ICsgICAg
Zm4gaW5pdChtb2R1bGU6ICYnc3RhdGljIGtlcm5lbDo6VGhpc01vZHVsZSkgLT4gaW1wbCBQaW5J
bml0PFNlbGYsIEVycm9yPiB7DQo+ICsgICAgICAgIHByX2luZm8hKCJOb3ZhQ29yZSBHUFUgZHJp
dmVyIGxvYWRlZFxuIik7DQo+ICsgICAgICAgIHRyeV9waW5faW5pdCEoU2VsZiB7DQo+ICsgICAg
ICAgICAgICBfZHJpdmVyIDwtIGtlcm5lbDo6ZHJpdmVyOjpSZWdpc3RyYXRpb246Om5ldyhNT0RV
TEVfTkFNRSwgbW9kdWxlKSwNCj4gKyAgICAgICAgfSkNCj4gKyAgICB9DQo+ICt9DQo+ICsNCj4g
KyNbcGlubmVkX2Ryb3BdDQo+ICtpbXBsIFBpbm5lZERyb3AgZm9yIE5vdmFDb3JlTW9kdWxlIHsN
Cj4gKyAgICBmbiBkcm9wKHNlbGY6IFBpbjwmbXV0IFNlbGY+KSB7DQo+ICsgICAgfQ0KPiArfQ0K
PiArDQo+ICttb2R1bGUhIHsNCj4gKyAgICB0eXBlOiBOb3ZhQ29yZU1vZHVsZSwNCj4gICAgIG5h
bWU6ICJOb3ZhQ29yZSIsDQo+ICAgICBhdXRob3JzOiBbIkRhbmlsbyBLcnVtbXJpY2giXSwNCj4g
ICAgIGRlc2NyaXB0aW9uOiAiTm92YSBDb3JlIEdQVSBkcml2ZXIiLA0KPiAgICAgbGljZW5zZTog
IkdQTCB2MiIsDQo+IC0gICAgZmlybXdhcmU6IFtdLA0KPiB9DQo+IA0KPiBrZXJuZWw6Om1vZHVs
ZV9maXJtd2FyZSEoZmlybXdhcmU6Ok1vZEluZm9CdWlsZGVyKTsNCj4gLS0NCj4gMi41Mi4wDQo+
IA0K
