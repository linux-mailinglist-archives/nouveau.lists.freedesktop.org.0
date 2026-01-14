Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F873D1BE2E
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 02:09:23 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DE8F810E592;
	Wed, 14 Jan 2026 01:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="s7OLE0tr";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EB20744CAA;
	Wed, 14 Jan 2026 01:00:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768352450;
 b=SGRC+8uOhm4DnfG1xozg79VajLrohW3MrQJINtyDE4OrKIw7J9WgKsUgwkkO0KR/JyJZb
 wyMn/9RSGBoAxL665zqVcSvwFdccqyGNkK4kJCuff6rAAJlbNbmmo3mnFnlhcL/2dpsrYG/
 ZmguN2DmYLsQkeiamrq6yTP9UW9yIbYmJgRslQBJCEeHuaMbqjxa/ogA1A8bL6WBqciCkiq
 aqKyc9YaoR9zIpKWHw1L/TSpqcsj5vRjz3WExNQN6W+L7DXxNrIjCFKzqz96Z7ecB2FIxsI
 Az4rPwciVYVkcgM6k0GrwL3thG2NUkPCi+bEXjYdZLilQQBU63lI1UaLZEkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768352450; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HAVdpzjwl6eHR/8sO6WmZAqD2gbCZrSYuvcUHbTYMk8=;
 b=nFYcE/wmGCnEe/IQv08T8wGNC2m81g11XmZ7VVtj4txYen1aZeJ1ryctdeHqCUB+W5Ebf
 uyYrNl9A5qo6OpI9fBRIchIGajwcaRYTZSIJgj99PG2COQjeqy33ijow6GuXFn4EbzzT7fY
 1cNdwtAxw5cnYlKS2eGACHNPsuSonZsEmngWskkUU8OxYIDQAdmcpnMFQT57Cpkbvjs0SUu
 Cd2u2kVEaMpQZNgiifgED13IMQt20mNHNVqtBRYSiML3TlXGEbIjHQqmDlwAc2wARV5rd1a
 Szrxkry+pcDN6qIgjFJX7l8q7UNLlZzPNBe19Bwp7GpccP6pnDlL5APXppFw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B4B4F44BB2
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 01:00:47 +0000 (UTC)
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020093.outbound.protection.outlook.com [52.101.196.93])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA5C10E172
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 01:09:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dI0OgDcZwZTJ2AOU+IeZ5eMUZYd8Uy7/xjVaBmFrLHH+uu346ivuocHMLf6B+WyvYmq34vAPZNqtSYSkyvzJbIYiKEX2KkKyDrOHXOWxajRwuickd8GgjmPTFPx1u85VEXVs0ui5j8FvXTT+ATQbWqQ5KcZRvC1ga26Ta74wRxxgsYNuZAGHfjOMjBURI2KJVCTZN/4JefBe8U8dRRg2qZYi5gC6+AVTqabhVDLOsZ14iPkJawv7DVrAyExd9JXEvK7USNUOKYKaAexeTj3hidVW8kPm87ChMqgAYAykeH8YhRYHY5QNoGFed2Djgot8PrEyFNHFLWEiQ4EVRT7N3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAVdpzjwl6eHR/8sO6WmZAqD2gbCZrSYuvcUHbTYMk8=;
 b=ucFoM0xcJmODOj6Z/MkrrU514afrL7VxmCke2MpFhM9uLQF2ebdPYaqAdqRjp0LFomvAphlEQmSFbKhWItqoaYBOfl0b3m3F0QNnGhLrY/myUyEWnWWSd3CfiE8ejsihuaj0Ev4uH0OnxAgrYBEbmPYCqShuJtlVbWCAUs57xdI+LJ6tQR6gj01Aoh+GpWECzbW2mAoB8NbhLesIuVh/Qh/lMyMg4X9ut/JYWiv6U695DhE5OOzqR0XfMMF6xZQWWKG0e+viSlPUrYB5HZJrk80q1LQgMGj9DNTk2c0jaWwMkHIJHmhddJXdsNnrraIy/DjsrXclVfBd1f3h4RTssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAVdpzjwl6eHR/8sO6WmZAqD2gbCZrSYuvcUHbTYMk8=;
 b=s7OLE0tr/kc8jdECrgbK5Acj5kBVkIf2i388DUCPXm3IakveXS/VFrbMqu6CVlWIU2di1J7eR/Fa64abNLljj79QuiptVle9o/x6oLWFZr5UdzDU25L1+C6ViG/5YKC3iTKoSSX0B12UdtASC6g20HdFrnlzpQSQW45WhB4YiPE=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3593.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 01:09:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 01:09:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 01:09:13 +0000
Message-Id: <DFNWSZTBVBW9.16O23RX61JCMJ@garyguo.net>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
From: "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260113225408.671252-1-ttabi@nvidia.com>
 <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
 <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
 <DFNV4H6O06OJ.1KU1PGYYQ1PBU@kernel.org>
 <2bae7712bfb3883fbf8d40fd9b54b922129dbb81.camel@nvidia.com>
In-Reply-To: <2bae7712bfb3883fbf8d40fd9b54b922129dbb81.camel@nvidia.com>
X-ClientProxiedBy: LO2P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::32) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3593:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e962692-6911-454b-3806-08de53098841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WFB5Ykd6Y2ZKb2Q0K2k1bkltc0xzcU9PQXNxU3o3WXZLU2czMjhkcysvTVpn?=
 =?utf-8?B?bGdrUVd0dlQzMFU1c1VQOUNFYWtLQ29BR0NRWnExZDFQMExwS0MzL281RlRK?=
 =?utf-8?B?YzdVQjB1S3J3TnV2MHFDMzBhMHNiMFBhYXE0MEJMR2lLZ2NJeVpCamY0Q3pM?=
 =?utf-8?B?SkkvMkNoVjVmYjJVQlEvRWNuZ2Vjcm0wODNhQ3ZiN09ZYmtwOTE5bUduUXNN?=
 =?utf-8?B?eW1PaDlTTExiQ2JuS0RrdThiWWJLRHlGd2dXSDhmRWpjYkNrUVVTb29lcjhL?=
 =?utf-8?B?dVYzNmllMGJhTWpHNStYZWNYTGxDQ1BJbHJwSytIbTZvWU90c2lyR05QOFo5?=
 =?utf-8?B?dTVnSnQ3b3N1akpZcmRPRXozTUN4elN2c2piUjVmb01lOWxTWlM0aDJEMjBK?=
 =?utf-8?B?YTBkVU1aNVU0WjZ2aUNBcUdvRDYxRTRSNU9aQTVrSjFxQjlhQXl6UnRrNU9G?=
 =?utf-8?B?U3NENFpIYm9WWEFFNkhJS2dMSmYzcjJZUDkwNlE1aUk3dFNjNGVTN1UvRGts?=
 =?utf-8?B?K1NZb3RYVGhleFVKNTJ6RjlyT0Q0R3ArN1VpcDlSTjBRbmxZTktNaENMdlkw?=
 =?utf-8?B?TUxwWUNPdzlJVVNGZUQ2ODNIU29PTERPYmxxRkJaVmVQUGxTTDBzRlJtL3VD?=
 =?utf-8?B?MTJQV3pYU25SVjVjZk1kT1JLVXBTY0lwMG1yL1RCRzJzb0t5N004M0NGUzNy?=
 =?utf-8?B?dFlKNmh0bDdSWkxMUlpycjd5OTZ6M29PZ3hyakVSRHZSbHNUekNpVUJERi9P?=
 =?utf-8?B?YmFOc2NFWVlrRXNZUUk4WmhIQUFydXFxZzBwTW5PaXBqcVh0OGhaTEQ0Q1ky?=
 =?utf-8?B?RjErVkhMQUx4c1lBUUVTU1RoSHFMU2s4eVB6b3F3eWp3SWp3dmhTS2hReXd2?=
 =?utf-8?B?SHBQVWN3cFJab09Qd3RIMGRPbHRvVmdZN2ZWYXREYjR3dzJKMzB0OExnS0dZ?=
 =?utf-8?B?SGxTQXhIZ3Y4bWVzT0FoamJpemhWMWFCVVdBOFRTSlUzaHlXZi9yZzNMNWpS?=
 =?utf-8?B?Z3kwRDVsSEZVNUtWYlNCQVgvaVVBVmc0L1AxV2htbGEvcDZnWUFkb0E2S1dz?=
 =?utf-8?B?YjR6U0RwUUhlWmxMR0Z6VGoycHNtbFV1NTllMDhWbk1xWXcwVGNqSnB2QXBH?=
 =?utf-8?B?SnM2YzU2amRQZVJhVXZVcHh4czNxTCs5QUZlZE01aTZBMWh0UGpQMm8xQ3pR?=
 =?utf-8?B?V1hvWjNOYjJMTFJnbmw0QnBYZnBySUs5T294b0pHMjd6M2tZTThMY2lWKzZk?=
 =?utf-8?B?aklQbFlhTnZndEY1RHVHUFR3eDFXRjh6bjg2cTNnV3l5QWpRczVCc0dYKzJO?=
 =?utf-8?B?cVd2TDh2WlcrM0dDQjFib3ZlRFd6MElvYW5YaUhWRWcvOE52VWppTXIzN3FS?=
 =?utf-8?B?N25FVXZxUS9HUEoyT01UL2FDVi9wOVFzY1lwbHlncjRuWFVad3ZidkxkOW9p?=
 =?utf-8?B?bXVnRUZtUGc3d1duS1VRKy9OMWhWMnlFaUh4NUhGWWJjVzZ3TWdDRzBRay8r?=
 =?utf-8?B?RG1KRkUyL3VTQm5KbDc5WndIV2p5K3pocTZlOEx3N1hqVy9nSERzbWpUWlN3?=
 =?utf-8?B?eGYvN0doS0lwTjZyV29zVzVJdUVMRjNleFNKU215N3RSMTBGd2RBNnJCSlF2?=
 =?utf-8?B?R0JOeXJjT0p6cFlGKzFCcWFYSzh4dFdHeExTaVI4K3hFTk83Y0pidFg1emxF?=
 =?utf-8?B?WmlVNmt6b3c3c1Eza0cwWjlOdit1NmhWMWRqL3Nqc3RSMkhOeTFiK0JKSEh6?=
 =?utf-8?B?Ykg4cUd2Um5CV0piK1Q3Zk92dWJkTVl3LzByYXM2T3l2eW5yendHY3pNV1hM?=
 =?utf-8?B?b3Q5bXdUV1YyNndaSGxLS0E5clFiZlJjdDB6MTZ0TWhiWWczZ3pwa2swOVFu?=
 =?utf-8?B?emIxZUNtN3I1ZGIzV3ZTS1NaUDQxYXNHMjN6eTFFendEd3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmNmN2c5VGVqOGovbDRSTVdDd0J1MFlkM0tkWWtab1VsbEw0UTZ5ZHF2L1Ux?=
 =?utf-8?B?ckE0VldlOW42dVU3TGttOFFpRVJZQitydkRHZVVwSFdJcnprTWRCU3VwTG52?=
 =?utf-8?B?TC9ZMUs3TTMwSDJjUE1ERmRrSWhYbXd1cUZ5bU1iRHFFdExLUXB4SVdCelNt?=
 =?utf-8?B?dkx5aFdmSS9YVFNhb0pkV0NvYll0WDY0cFdiSFl0QzRlUnJIaFZqdnFCa2Yy?=
 =?utf-8?B?RloxdHh1VVl0T085MmljTjZxNEFBdFFKWWRydlh6TitqdHF5NlNDVDBCR1p0?=
 =?utf-8?B?VFZIZ2piRytWK1NOaWNYRGV4SHdMZ0ZWS29HWmhZU1VQZ3dDcDVCUE1penB2?=
 =?utf-8?B?ejlUK2RFbVVTOFFqK1pLUjA1R1dFNzdYMXJHOTd6WDRkR2kxYm9qMExCMTJi?=
 =?utf-8?B?Qk9mNE1yclhkMjB6NHZGYUZlb3BJOVpFT3hBendadERCdzhsRGw5L2YySEJI?=
 =?utf-8?B?RWZGY2xJYWxpQzFYbmYwTkIvb0VEZDdGaVdUSVpzL25XemRsTHdQTERnOTZ6?=
 =?utf-8?B?V1ZBTm8wNzV4THc3UHI4QW1HSGdzRUJ2ZXZ5ZW9NY0lDcStXU1lvMFQ4R3du?=
 =?utf-8?B?aEN5YTh1NkhiUVFvMWtkdHl4K2hGQ25PUGxUSVVDNytSL1dOeFFZb1lNVVJj?=
 =?utf-8?B?N3lWVVlBTnN0YVJlVXB3alM3NkFYdTd4cGttTDVNVnd1NEx2SmdINzljcFd5?=
 =?utf-8?B?c1R6RU11V05qdFNBVkpzcmh4Y0lGNlYxeTB5dy9uQnpuWHc5UUFuMVNPZHRW?=
 =?utf-8?B?cjMxS1kwMjMvZTNVZkREeDNpNU0yMlZPcFh1bVAwVlpKaHF6OUEzOW96MVdX?=
 =?utf-8?B?cy91ZDlXRzNMZ29abXdmTmt2UktOdjl5d3E4bGcvNXZFYWo3NXZhaXZmbmZu?=
 =?utf-8?B?SkVuQ0NNcjdaQ3RFOWd5Y0tkUEViTXdCNlY1RUdVTXdZUXNGNncwMWVaNEFF?=
 =?utf-8?B?bm1hYUhsMTRvTjBMQkpZWXp6aGhzYzJERVNUV3E3czBnajRkNVppc0NWSGhO?=
 =?utf-8?B?UlBTdGE1c2dPN2JzR3RDY1ppSVl6cW5YTldmeDBJN1hKRTBFODFOWHhHTmJJ?=
 =?utf-8?B?VUZxM0trUU5kazVqWmRmZTNoVzBMdDJYdUNDdlFGbzY3d0QzZlpVZWtGRldL?=
 =?utf-8?B?Sm0xS1o0emVFWTBtVjIzOGdDZE5LdGVZMEY4Vis5bXVqcHRsQkxzWk0wQlph?=
 =?utf-8?B?SzBuM0JsZzdwZzlSblNqYUFxaFVoUUZpeFhRa0hVdWlTUnhBL2pBTlFUbzFz?=
 =?utf-8?B?SnZYN2syY1NXL2Y2NTZUenlOM1QrZUQvOEZITmxrRWtybElGbHFkVS9OMFcr?=
 =?utf-8?B?RGE2eEF0d2lGL2FmdkhvSmtSbjlYTmNrT2FuSlpaL1l6eXl5VFE4OVdsaFdI?=
 =?utf-8?B?M2YwMk5zY0VGeUdGNFVjekN3YWtYUmpkRHY5UlhDMmtBWTUwUUlHeVVPb1lv?=
 =?utf-8?B?SytIQUZwaVZMU2dSMWJFN1pudXlHN2l5cmNMek1PeVJUblhWMFl6Yk5ubHpU?=
 =?utf-8?B?Z1VDVDJOMERaMnJVcHVxU2MrRW9wZzBkRnhDUjFCM1ovRlVQekZYc3Z0b2RQ?=
 =?utf-8?B?QXVzT2dsWnBEc3Jmc3NkT2E5QzVJNlppVXFYbk85b3I3Y2xFdHE3anhSeDAw?=
 =?utf-8?B?Q0NQWGVBc1dNd0xTTFZiNWhqV0gwbEMxMzZqM3V1SW1RSWNnY2ZZa2JheTAr?=
 =?utf-8?B?TGdGSHBNakJmaFhvcDJ4VTBSZVVCdkh2U0hsclZVRjlhMVdVUDAyclZ3bWor?=
 =?utf-8?B?REtTc2R3TjZvUFRRT0tJaU9yVkFoNkRkL3Q2NmdUOEM0OHNabms0SldnWFdy?=
 =?utf-8?B?VS9WUlFLc2lVbjF3YXZYcFNJTUQ1TUhuaVMrMWdXUW9KQndab3ZEVm1LL3Jz?=
 =?utf-8?B?cjJKaVVFVmxIdmZMOWxlSnRzVmZhVHl3NjJFMkV0L3FpTlk0R1N4YmRadHFu?=
 =?utf-8?B?dG5LTjUwNGZFc3ZkZXZWOTNsZS9yVnZBNVVxV0dhQ1BSeURVbHdUVnJwRnY3?=
 =?utf-8?B?QkViMVBwd1hObnl3cngvTlRreVlIbU03TlA2aEdEWFA1bldEdXNrL0J1RFJS?=
 =?utf-8?B?bWtkRDNQcTl6emdqeU1rR3JsVG8vbVZWQk90SlZZRm1LREN0Y0hSRVM4WWpX?=
 =?utf-8?B?QWpZaENhR0dMS09vNjVXOExobVltQ2hQVlhvZGg5YVZ4d2RVOFVCdnBvYnd2?=
 =?utf-8?B?V2hNTmRSR09KbjY4WUhHUG56bi9pNVNiVE9nV1FCR3hWcWVBWmoyY0ZpUGJj?=
 =?utf-8?B?eTF0TFl0V2Q4V0FpVFJoWHc3d1ZuZGFoVVV1eW1nbEp3RFRjSFduSUd6djVR?=
 =?utf-8?B?SGZaM2gzRjF2cVZPaklVRU0zY2pCeHBtNk94VCtWa2FBeE1XTVhrQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e962692-6911-454b-3806-08de53098841
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 01:09:13.9966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OGEmly396cJodFpbFOGU6uRP5F6ybX+B3NI+5BgLJ31x34NspyKbKuFi3bJ4cPWxn8cUma4/i8o6oAgEgG9xKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3593
Message-ID-Hash: CI2FHSNJ65TCN6UVO6EX3KOW3AF56OK5
X-Message-ID-Hash: CI2FHSNJ65TCN6UVO6EX3KOW3AF56OK5
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CI2FHSNJ65TCN6UVO6EX3KOW3AF56OK5/>
Archived-At: 
 <https://lore.freedesktop.org/DFNWSZTBVBW9.16O23RX61JCMJ@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Jan 13, 2026 at 11:59 PM GMT, Timur Tabi wrote:
> On Wed, 2026-01-14 at 00:50 +0100, Danilo Krummrich wrote:
>> Maybe Gary has an alternative idea for a temporary workaround since he's=
 working
>> on the proper solution to safely access module fields.
>>=20
>> But again, I think a simple global with a FIXME comment should be fine.
>
> That's what I had in my initial version.
>
> I wish you had said something when Joel suggested it:
> https://lore.freedesktop.org/nouveau/246c1ad4bb1ca7ef34f331fba33989bbae86=
18f8.camel@nvidia.com/T/#m69a23a3db642c8cbb22efe0e24647811e8ae3f12
>
> I spent a lot of time over the past few weeks implementing lookup support=
, and now you're saying it
> was for nothing. =20
>
> What exactly is Gary's code supposed to do, anyway?  "proper solution to =
safely access module
> fields"  I don't know what this means.

There're quite a few ideas being discussed here:
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/M=
odule.2Fdriver-scoped.20data/with/564476412,
although I haven't had time to do any proper implementation work yet.

Best,
Gary
