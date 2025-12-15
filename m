Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49564CBC45A
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 03:47:56 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2082610E0F3;
	Mon, 15 Dec 2025 02:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ArmvLkgH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 09FC0454EF;
	Mon, 15 Dec 2025 02:40:32 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765766431;
 b=aM/KvgEbNa+mRuAuUAGkIFRSJww2qjIslSv3Ow9NX4ELPPZRmAaakhbYSHiVs6pgvfUD/
 duqNvW4oFQ3AZOIvF1zEOxhbHj3qhRlmFGYCeCe83/1o1jpw5zjqAPuVsw3jWAbEFAAJ/oi
 SuN2190EwNJnRT6LbvgmQBx4a56xHsBNOk7k58hWpNtee8vXqGJ/on7qW8AIRZjmUiFSsCv
 CsysnyoO3JxsQLwPMA2GwdodK1y5HDZxRiJVOdhPDRgL8wAgTi2FYmRwg4Vj3DssHNsxslE
 4O9CheFQrStHi8qOOqh2a6SIlSfhh+pOgPhZiw11nNAe728ELfHh+BuwYEHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765766431; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/AhaswqR5oXFBeubMuijD0rZFQ02+uQCi1/LSQ8ehWk=;
 b=sFUb0DqE+J/v8nk/TjuK0lObsdzy8+zBHbe2M0ev2qMX5tWu4kEAbGSKnqCahALc/gPZI
 VYLkoyqHdtBOEmpAPM6Hg7fC7xox13YwPic1jkuiy8bn1eg6TPukY4hz5G9QKnUD6p42tWB
 2rCzg9diOdnao7aWKfhgxnFZ5e7PYue5tFGLzXbQELqZPF5HZS3YfRWsVygDGtoz77W1gbI
 OxurmWRLeLVX92FUdkw4jsiAcJ99OBF15mF5tHEZ0gdwHlCALU4BuikNdLbbgi3nj0QyoZ8
 sEQjNqiLxdgUPSbuLwRA0BxXNkS4vuMKnDci9bNzaiAUbjFZ8S3iNaaGZh6Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AC711454B0
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 02:40:29 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95CBA10E0A0;
	Mon, 15 Dec 2025 02:47:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vM/jSkZL1xkRASSmIxJxp1Ew1a5tnaSnvXIN/YaBvmFX4bsKpeYkdOxSbNzrY8eyAWCL7wMYrz4JrWYWeDxU25sgGmVnqDBIywbz8Jf5Z95tLetSGTUHUtgXa5jUOBv9O92w0KIlgOxVoX+70SDzX4o9oSXy7iVmpNuuz7tY+rB99f4HC4QEofq3jyhK25wNmob0wY+iDrd+quwBVn8DwNz4P/VJhtJh/2vvW2xA2HszXwVS6lMLyuUbi2jskCd73WG+gzXALHadJi68bDEj/FBDjOEHqV9NAvIsxTPUwWWcnmCeA7xsDzpQp9/5SIsPatLtO7AGrocwSgvNbHtkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AhaswqR5oXFBeubMuijD0rZFQ02+uQCi1/LSQ8ehWk=;
 b=U0J57YHpTSOaBq5+fva4cRtvNdolak4uwOni4kElr5QZOKyZT7qa3ip/LkxBKIkvp3/yRuqA4eJ5kkMrpEXbvivTd7ej0MiXblOdBMJvAuzXAUx5LIC6k28nUTmoE/g1LpwZhLKMwdriR5ZVbFlPbr6aLEwGat+7z6XzZRkvpDwPrVnEkqU49SHr5500wabWuOTdRIG++SZgi10o8vCcGkHMjcuKMIBC8bryp/4q5nH/ekqugQgJ5fLP9bis2+CAJbaFbGisGn3t8hdRRy5YE8fyQqlW8OJHdoQZR/0ODidfBGjY13fgm8GbQhqnEq2H/1IqOhpsbhizLxztlWOn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AhaswqR5oXFBeubMuijD0rZFQ02+uQCi1/LSQ8ehWk=;
 b=ArmvLkgHxsCyg4kP/MGuTPYr1kaSnJirlUruteiNi73RiKtP7WPLF0H4YJyBrpkKYdL6GboZklh/pFYixZR9Y0/J1/WBZZamAIiU59W5uMFgvZNhcoA4S2hw/laLyRLJMC+282jvnjpHPTOfceLjCoZRxnNGEc5zkLoPY1HWzZB+OYny2z9RI/ct+A2gCIfRfGPO/8QTvRnKeQXHo3mytYswf9NiMrJwqGZS35DKdZOT3zZjPlCbwGCvABj1eUePYdjRdjbstHsz3WB2gNBCqGbfHvJ10oOv0pzdRFKaqSs9f3PtoDnCZeh0yPBVbCLH33biuFuEvFIfnbnwVtZDZA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 02:47:49 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 02:47:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Thread-Topic: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Thread-Index: 
 AQHcWveUhtdTWvcyIUiSIgFwHRwbg7UdxGuAgAADE4CABClqgIAAG5aAgAAXggCAAAB1AA==
Date: Mon, 15 Dec 2025 02:47:49 +0000
Message-ID: <7f80c6cfbcfb8097f79af6b95f10270743c5ab7f.camel@nvidia.com>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
	 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
	 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
	 <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
	 <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
	 <B5724DA0-6031-4576-9B3D-DB67569711A2@nvidia.com>
	 <37cc2302-6a3d-4046-b28c-605221a67329@nvidia.com>
In-Reply-To: <37cc2302-6a3d-4046-b28c-605221a67329@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SA0PR12MB4461:EE_
x-ms-office365-filtering-correlation-id: 94160f05-dec1-4e99-94e8-08de3b8455fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SUx2cE5EdzNaQXF1TXkrZE8vZm50KzZXQnc2MzBLc0hQWHMvTEM4Y3FXdkpp?=
 =?utf-8?B?TGg2TW9oZi9MVkpudkhqanY0RUUwSlJOREJvZk9VTWErb3BySGZRMGxRSm56?=
 =?utf-8?B?L3VKdHNkLzBOalRQODk1QXBLZlNEenU0ZUI2KzJIT3hyZ3Fnekpic3ppYVBr?=
 =?utf-8?B?b1hmNWlqbHFGNjEwZXpjanF2YmZOUldiT2tVRlU5UGdaTHRYYzJRNDU0Tm1h?=
 =?utf-8?B?SUxLTkZBQVlpUnpBNzdDSWI3VWl4MllyU2ZDR29FSjNjdUlUUVhXL0MxSmpO?=
 =?utf-8?B?N1RvdS9Rb1NiY1U1dU9qNzVoY094UEE4UmlzYUROdmdrWHVSNUVRbXdhUm9P?=
 =?utf-8?B?ZWJ6Z0dhQ3FBWmU4S0xMakgxQ09OOHF1ZHAxYkloVklEYi9vQmtOL3lPd0g3?=
 =?utf-8?B?VmRPaENCWFFMbWRSMzhtdlZPQXJWNkNEbmsyQnFvKzdkbkszMzdpREs3V1Ns?=
 =?utf-8?B?ME5ROWxhV1FQeCtxd2VTYjM2bjM2NndoeEVOMHNRSzNvOGdCcHk4cnhCYTZM?=
 =?utf-8?B?NzRQRkRVSmhQOGc3ZDI5NTdRNWUwVkRaV2tkbGRKZHFPYWc4KzBMUzlIUFJ5?=
 =?utf-8?B?UU1JNU9sYVRqK05kQnZ3YXdKa1pHbndTYjEwaWtxUVRoTXh5VW5YZ1gvTnhD?=
 =?utf-8?B?dWxsVSsyYklEaW5nRkxURFk3bWlJa1VMY3I3QkMzejZVWHF6dFBvckpCK2Vl?=
 =?utf-8?B?ZzN1RllST0YxZUVuNU9jREFPTlMyT3dOb016SDJucGlPbHcvRnNJWnhkNGNY?=
 =?utf-8?B?N09oRDY1alJscmJyMWNWbHhQc2lmUjFhVmRGeGtZSHlyYndKdnZDdy9iT1ZO?=
 =?utf-8?B?Q1N6VDliWUR1NGk2emJmUlJ0QmpLUk1nRSsyRlB0MFh3NDhDNUhtTzJPRER2?=
 =?utf-8?B?Q3VrU29yaTVwRmZyMnEvakY0WFBkQzBTU1o0WVBQRWl5OHo3VzhzVzN2ODdE?=
 =?utf-8?B?VnhpTTdEK3hmank3Lzl0Z3l0bU9zOCtqUjVIY3gwQTYxYzQ3UTJ4a3RSRkVq?=
 =?utf-8?B?cnR2a0Q1eStZTThTdUVvTFpKci9OSjA0SS9LVjVLczZrMjhlVWdqR0RkZkdR?=
 =?utf-8?B?QWczSXF5WUJ2MDlva3lUUngyV0picVNYaTlkQW9lYVhqaGp5bU5rc0lIampP?=
 =?utf-8?B?QUUyNWhHZDh5VWdTQjAxWTlsVHM5YS9jbDk1YklSQUJNd21RWGVML04wUklE?=
 =?utf-8?B?M3F2ZDIxZFZIVkdPMitPQ3ZTZWFodnBRaFZkSklKQW8xZ2FFcG5EaEhnWWlK?=
 =?utf-8?B?RmJoNkVCRHllR3QvVHRFYXZXUUVWM2hCMDBNRG5vVDJia2I2anZqdkxUL0h0?=
 =?utf-8?B?WEtkay9GTzJvVEhFQzBseGpRT1VpUENzS2Z5TFNTTllTZDBCOW1kM1dKeGVz?=
 =?utf-8?B?OERVUCswZVBHdDh0aTN4VU1reUVGN3VEei94R1c0VkduQnlJb2llL3BScU54?=
 =?utf-8?B?QU5qOFE1a0xOZytGV0lYSkpJblpIckplZmJjLzZQTHFNMmRYaEt6NEtFMThV?=
 =?utf-8?B?WURZNWhveEE4RkFIOEJTY0JFQllDd1lKUWw3MElDekczWTkyRGo3dUx3bEtE?=
 =?utf-8?B?S3pwVmJpeStXYUxXZXMzWU1EaXNXOUV0QXVCUXk4ak1DaXdXdDNlTmliczlD?=
 =?utf-8?B?T1NhU1RQa3hOTmNhOG1NYlVoZ3VsbFIwcHdXQ1VtY2x6Wmt2am4zYnhOZ0Y3?=
 =?utf-8?B?cENob3ExeWZ5anQyTUs0UU9MSzdDbDdKeEFBYTVGT28vQk1va2V6by9pTXlY?=
 =?utf-8?B?MTd1Wm9hRWsvNS9hajNhRmZvVkdYcVlTZEFlN2NiY2ZFcThtcUlSV0M5bm5Y?=
 =?utf-8?B?Smg3OHdNRVJrbG5XdnNld2JMN1ZkRmV5c3oyYWl4L2RhcjJXaEVtUFM0a1lX?=
 =?utf-8?B?TjNMWGZUUWZoQjIrVjhLRG1zMmNDeURnVUNQa2tOVnEzcDJTUnFjd2FVaWhQ?=
 =?utf-8?B?ZW1kZUZuRkZLbXU0NWg5SHhOTHhTNDVHWEJmTi9qbzBERG10bW4wQllYWnU1?=
 =?utf-8?B?QjNTdGxIUXowcmVIdURpTG9vSUw0K3FSRnUycHk0UUJxdzJEcjlMemlGZWdj?=
 =?utf-8?Q?7P9cq+?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Ni9YYzRvYWFUbnhqc3BweFQrSWxmckFuRmViemVKK2grbW9Uc0J6T3dYRWJq?=
 =?utf-8?B?U0RVdFFyc1QvTStWUmFQQlBZRUlIcFpWZXN5VlFxcXNkMzdCa1QyRU1wdFdy?=
 =?utf-8?B?aG9IenNFVy9UcEM1eitMYnJ3R1UrbWphZ1JoTUFlN0l1emRFOVZLT2hjbGxp?=
 =?utf-8?B?d0grZjN2R3lodUlBNkZqNG5EUTJKdHpaZm5MN2FTa21xNGpYYmFxaUl3K1FY?=
 =?utf-8?B?amZJWlRqNUFIZUZ4K2FVODJCZWp3U1FIZUQrdlY5akJOMHllbncxU3hibGlO?=
 =?utf-8?B?WmhmL2hteVRnRk1GZXlaT2VmdFp2MmtYdHQ0YVVCam9NSXh5emxwakVaWnZI?=
 =?utf-8?B?V0cxS1VuY3lYRnJlZVZSOURadkNPcjREdFRZRGtVa21ob2ZmMFZQd2w2M2Rx?=
 =?utf-8?B?NEh5RnV2RXBZd0NwZnEyQWdkMkY4ZE0rMVpCRUpwTkFrTjBtQ1I0OEh5eTE5?=
 =?utf-8?B?L1pUM0hLdzc2a0QzdmdmaUdFU2tWZDduSzIyQTBKaHA5aGZISHVWb0pubDU3?=
 =?utf-8?B?N2RvMnZFUlBRUlVBNWZmSVZhN2lBZXR0STJ4c3prRENsK09GcytFdnBpNy9h?=
 =?utf-8?B?Qy9hOXQxK2ZMcXVtbVpibTNvV1JPNmJjTlRadFZMbE8wdHNaUWNrUThQUUpJ?=
 =?utf-8?B?T3d4YUxoNWNxck9Nb3BRbFRJRnRtYTlzb1BneFBreS9PM3l2Ny9KekdLRlY3?=
 =?utf-8?B?bis2TzZXT2JCVE0wdU8zUngwQjEzMWVMZkQ5cmZFd0tQZ29OSisyTGprT1dp?=
 =?utf-8?B?SkxQaUhEbVh3RUJaaEFTSytMdFB6SVdjTU13Y1BuU09SZGJES0p0SWp6L1pm?=
 =?utf-8?B?MzV2SkVDYXRybTlZZWthRmZkYmd3Qmd6RllYVmxER3g4MnV5VGNxL1NESnhY?=
 =?utf-8?B?dWhTa0IxMFpMeHJOcHlhVFBsUkFMOVpGWGVwWFh2L29iak9HL2htWGdoUjgr?=
 =?utf-8?B?K1VQTlh2M0s0b3FIRU00TVFpbWNxczBqMWcyTngrT1k3S0ZsMWNhWUFLT0wy?=
 =?utf-8?B?N2E0aVBadWIzdStPSnVLOHlZSlYvMVBZZHdMZEoyWEFlS2NDWnJBOC8rQitw?=
 =?utf-8?B?S0liWEYzU0NRckdZeEpiZVNqVTBNeHRoZzg2NzBWUHlaL0NHZ0FmdFJuS0Vw?=
 =?utf-8?B?MFVzWE5WRDBJeTZUdzNYckxVSzhqb3JYMXdKL01pSVJ6TzJMZXdxemZmSTdZ?=
 =?utf-8?B?d0x3cGRkdE1kYlRvcFNwT0I1a2RWUnR5UEVOV21OV0tHWmdTcEpTTHJ2Wi9D?=
 =?utf-8?B?Q1dsUEx4eThtalpEdXB4bFQwOE1yaWhtWUtFVmRmOEVnblQ3ZU91Z3g3RHk1?=
 =?utf-8?B?R3VyeVNRSVR4cjRGVVhNRHJiQzZEcElzaG9CVk1TaW9aRTdZVmN5UlRjbElD?=
 =?utf-8?B?UnVOanQ4TFdxOFQ4SFZGWmlsOVEvZ3kxNTdCZ2Myb2tiT1I3SHdna1FBT0V5?=
 =?utf-8?B?MExhR3lZbzZEMFY1QkNYa0NaWjg4MFZLRzlYRFdwK2d5dzJ1bkpSL3hiYW8v?=
 =?utf-8?B?VjVHeFNxMVU2T0xwc01zQ0pRa1lxSndQdFNpbmkzZFRjTFBTQ3pja1FNSXZs?=
 =?utf-8?B?Q29QSzZjbWpObUQxVkhacldpamJ6MGtSVmZQd1ZWMCs5ZE1uMHFDaURHUXlS?=
 =?utf-8?B?ZzN4ZURQeXQ1aGgzVGI5TEZDU2JwY0xGOHd6QnlJRExycFBaSTRCc3BWV2Q1?=
 =?utf-8?B?T1hseGhCQjdMc1paMU14V3lOTGpsc2ZNVFFJZTRuTStlQ3YreEU5WEZ3YUpz?=
 =?utf-8?B?R2E1NGFuRFVKV1MvL2F4dEFkUXovS041Q2wyNy9Lb0lyVUhRRlhmcTcwRlo0?=
 =?utf-8?B?UzVUcG9RdXhzV3lobWhNY2Rqc2doZGhNNXFMQVR5bWErblo4VlFwbUd6em1z?=
 =?utf-8?B?U1RLVHVxZzE5dThKaHZkQnU1TFZuTXVvc1V5NmM5em96Tnc3dmFCdWlaOVM0?=
 =?utf-8?B?VjdTYXRwaHhVaGU2cnp6dU1FMVdybGJSVUVUd0tZNndZbTdiSnliUjNDdlRo?=
 =?utf-8?B?TjVKbUNKeTc2MjZWbHBXZHZPaDF5MVVyQWxBTG0yT1lWNmJLMXRDOUJYVVpE?=
 =?utf-8?B?QXhuZ1NFOEsxVkxTQStzUVlRREN2ODlBazM3OTZTalVMSktCK0h2Kzc1RVhq?=
 =?utf-8?Q?OATjroy1CtbSio9z++j+25BV9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C7DDFB78D45A3479330194E8B7F211D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 94160f05-dec1-4e99-94e8-08de3b8455fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 02:47:49.7612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 1cBTb5qTL0zfAd7nZssgsAfxFwLJPFMuNXx4w+gQNnmHlnMLRMA2xsv0n8vWA1gEi0fPuBpu4AS35h54h1nvlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461
Message-ID-Hash: MQ4HL5QJ32GLHR5SJKF7BXZS5IMZRN77
X-Message-ID-Hash: MQ4HL5QJ32GLHR5SJKF7BXZS5IMZRN77
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "dirk.behme@gmail.com" <dirk.behme@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "dakr@kernel.org" <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MQ4HL5QJ32GLHR5SJKF7BXZS5IMZRN77/>
Archived-At: 
 <https://lore.freedesktop.org/7f80c6cfbcfb8097f79af6b95f10270743c5ab7f.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gTW9uLCAyMDI1LTEyLTE1IGF0IDExOjQ2ICswOTAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFdlIHNob3VsZCB0cmVhdCBkYXRhIHRoYXQgY29tZXMgZnJvbSB0aGUgZmlybXdhcmUgYXMgbm90
IHlldA0KPiB2YWxpZGF0ZWQsIGV4dGVybmFsIGRhdGEuDQoNCk1heWJlIHdlIHNob3VsZCBtYWtl
IGl0IGEgcG9saWN5IHRoYXQgYWxsIGRhdGEgcmVhZCBmcm9tIGZpcm13YXJlIC8gZGlzayBuZWVk
cyB0byBiZSBpbnN0YW50aWF0ZQ0KdmlhIGEgY29uc3RydWN0b3IgdGhhdCB2YWxpZGF0ZXMgYWxs
IHRoZSBmaWVsZHMuDQo=
