Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E54D1923A
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:44:47 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA37410E4E1;
	Tue, 13 Jan 2026 13:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="lrYzUm4V";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DA6FD44CAD;
	Tue, 13 Jan 2026 13:36:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768311377;
 b=Zczy7LgDqMq80cKuDBDN97jP49HWUPRLwMq0j1kDFT5UInRT3vfZVuQbmtaT6pVAXGnEr
 PZSVfBn8MpUcuIHSL0rvXrah3DMA2Xubf+fs9tONwI8EQt5sRZn9wnkjJEPt+DT2kz1EUBJ
 YEqGWSIM/pdvOhfxd78OeCUhZcq25jGrbG8Rko5XlOBhr43Z7JHZlpSY1mIzuu1JnXmvAfT
 9ljiYfxcke5rb8ixPAzdDLaCeFUcQmKkx4mRzLaR/V//kHowKIIzkWDa5plWRVpSRkis353
 3boB4T1F5sHDsjpp7kYJ2UViV1+XOoy1EngGlJGsgqwJCKnLIKU+kjAVxflg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768311377; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=T9AFilmxt6I5aSRduV0vkp+M3rf7Ijvp6RUmw8JWrdY=;
 b=yIe8R57voxVTOJc5fpFznhYro/9lTyn3Kuy0U4eRbIh9YKI0S05qov23TWe/MbQuZ/h0X
 2Oxpow3HwAlpI4ngNJ23MIy5JK51vrbqz1WGTlAsD2OZDpixVA/0pnMePL8UeiE2s1aeR+u
 EeebAVCvgLHukFNySGmLKFUvq4Zk69VQFUJwfXuTSdj9biDyZlZ8FRPQ9Jyt+wZ5FbT91ow
 GD6YG6eRzm8HI0OCRRtb3BuTpmoQFyscIQRsETGUfBNh4N8DLkIKa2wSAfvZpB5Pdb9oswc
 3gGQLK3KgodGuVfIivTQd7WA2MJPSo7Xn9tzYcDL+l/1X/c28x31zQTH3Pzg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4099344C99
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:36:15 +0000 (UTC)
Received: from CWXP265CU008.outbound.protection.outlook.com
 (mail-ukwestazon11020143.outbound.protection.outlook.com [52.101.195.143])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF30F10E4DB
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:44:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBL88otF6yifEpZckYHsALAJsN82t5hNE9EQeshpm8nPVBCxVs9W+4bG0HqplgVFjLzvshZBViT8AIn/BChvQhMIjCRkld0GoyoCPCgeiaIvjepDmgnuJ92b6U37Htj6qLmHVhzd5wibVcMs7cNi+j820Q0YXyUNq0yKNhofaQDYNWpDxV2cfjQxVGuH2ep2Z3j/yU+lJq6Bv6aeUpAZQuEQ8kYcTAuDYQF+Rwun4fSFuxLYCZyyu0YO5NO4hVzR1Rbabi2eV2whuNmbr7vkHFPSiiQKYx9WdMzDJHi734Vq0aCn0Gxn5ikU9qhAOZoqkvgs41s/DL0p3FIjXuLfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9AFilmxt6I5aSRduV0vkp+M3rf7Ijvp6RUmw8JWrdY=;
 b=BzI6Q/HH3974hnCf1mWSg336L8Pbvpg2yN8fKQ8o3iA2ALqg6dn+f5FG7YPLltlofKXBxMf1fOfFrmr4ZXVzbgt/i2Vli8xBsKuJ2beUBPf2qNm+elUzZjlk7G3sSffXSoC6k16dXzKfgHBsjQNBe3UxY6qTyT07CN7xarlZjQPGCLoNWoVZc5EI8lHYwE0qRG1D4OxMjF1M+KRNpTHIOg9m4COZQEUZ5NQ6REM+B+jwXFb3mtIsFOoDGvCedxbtgn85uQkFA0SND6DSkS16BoXheeKHUI7fqVB2xUdol8Dz8iYvnnCS93gFrTRT1Kx/CDXESvwYLXA7xvDV/2mvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9AFilmxt6I5aSRduV0vkp+M3rf7Ijvp6RUmw8JWrdY=;
 b=lrYzUm4V6CBj+oDW0fhz/ydFzJMi4vOX6AWM6WvPECSUw4cVtC7723I9AmDHaiFSQFTLsSONgOyS0SKIl6v1zOdbKwP+Yl9zxBD7WjGpsmIjd0c6NcruYUjpVeocBtO0vSAN+6H1Swsb+aX04VrC4YIrNodQlr2/0uwv5pyJeUw=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6441.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:44:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:44:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:44:38 +0000
Message-Id: <DFNI8U4LJEF1.3AVXPFQPJ926L@garyguo.net>
Subject: Re: [PATCH 08/31] gpu: nova-core: move firmware image parsing code
 to firmware.rs
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-9-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-9-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 493e510f-e81c-43f9-f764-08de52a9e5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3hWMkRYYUNpMUFpN21RU01BZkJtSGZuWmp4ZkhjM3pobWpKcDErM3F3NkRL?=
 =?utf-8?B?V2E3RTlHZ3JTSG9pN25SLzI1OUtNZGhPZmRzYytza015NkV5UnhSOElIUExm?=
 =?utf-8?B?Q0ZabEJrTFJPYUNBMEJYdUlhZEsxd2hmOCtGaVNJWVRvcmxQTGtIaGsvMmNF?=
 =?utf-8?B?KzdxUUZvQ05BZ3NMdWV5cS9ISE50N3doSjFiKzlNZzRaaHFBN1VRbkZXb2FH?=
 =?utf-8?B?MkFSTGhVSFRBZEpqLzIvVHJvaWluWE5MUk9iU1c1eU9USmZwY0haNHk0N3pW?=
 =?utf-8?B?YUVDYmQ3ekdaOXBrNDZBVUVDZXdvRjQyT1ZZZEFqWjZaK1VkSm5TanV0ZHcy?=
 =?utf-8?B?cGd2UW9LSW9VK2ZTS3hGQnNLUHlMRGNxbHYwNU1PNE8zVnRmamM4c1J0NElr?=
 =?utf-8?B?Tk02QUpWdC9qelFJNHhGUEgrbjFYWDdEdnhjQjE4VjJQc2hscHZjd3Z3bEdy?=
 =?utf-8?B?bEJqY0VmK2dUb28wdG16THFTQVEwUHd5NDdTRG8vYmRicHM2dUx1NjVnc0Jn?=
 =?utf-8?B?MVNjRHpoU096NGtCMkUxVlNVZGNRZi9PUTBIV0owZGJuRE41Z1o2L2oxcW4z?=
 =?utf-8?B?aGtjZml1RGhCbmY2cHJnQzZPUDVlY3k4TmxHaFJoMCt5cHhmWnpKSVpxVTZF?=
 =?utf-8?B?RlcwQVYwYkRVdk8zelhhMCtSQnc2aGFuK2tUQkdoNDVvWVRIV0FLT3ByYTJP?=
 =?utf-8?B?THVQSGo0b3U2dFRUVWZmNzhYNnE4SVJrTmczOWxSdmh4U1EvVml1Qlk3ckZU?=
 =?utf-8?B?aFFITmt4UVN6ZGVEUkZnbmhGSG9wNGM3WmYwSGx6ek9nR2pHcWZVa1FBOXNI?=
 =?utf-8?B?dXNaamxXL284RUc5b0ZlUXpCMmhmWXdrWHoxREFLMFFGV3VRSGJRaEZoTDBr?=
 =?utf-8?B?d0RVNkV5djFWdWpjczdEMXBUUzRmeFlZTjFJaW03a3ZPUENJSkcxcjQ0b2ZI?=
 =?utf-8?B?MEhiaTJKdmxIcHY1cmZCc3NhcjRqVHZ5RC96MmlOSU9GaldxVjV4Y21QT3Jw?=
 =?utf-8?B?T1VrR2VWYUl6ZUJJUnJwSXlMUkZmTFFrb1RXOExyS3hYUHVFenN0c2NHMi8v?=
 =?utf-8?B?V1NqbXNYKysvRlJTaVlPTlpVbS9qRXBVZk92b0pMS0szN3U5Z0pPUWU1U21t?=
 =?utf-8?B?WnpwcWl5OVFtRG9QcGk0ay8vT0h1QmZ0MlVBZ0NOOWNKNkRuTUZ6b1lzWW5o?=
 =?utf-8?B?cWRtZFRmNkF4NmNzYTJaU29YQ2lJMVFqaWhDcTJ2RG1HZHBJSEN4T3pMcVpD?=
 =?utf-8?B?Um9BL3dlN3l5UlcySFFZZVI1TW5Xa3A5OTAzVE0vcno4b0lBODQraTNVaURm?=
 =?utf-8?B?bFRaVTVKNi9UdmFQYVB0SzQyM0pFWnZ2ZnVIMTQxeGtKd3c4NFJTamRXM3Rj?=
 =?utf-8?B?RlNadFdNaC9RV2dPeU5wek54Q3pqamF2a1RjU1c2TzhqeXBBaDJqb1Z3VXdU?=
 =?utf-8?B?L0ZvL3VsUEdKTkNkWEFJRGFydGJWQ1pUVWNvQWxxOWNjVi9OQ0xEaG1aVzZp?=
 =?utf-8?B?dExsOVQxYjlyTlNlM2I0NnZ3dGt5SmEwdk8yM1RmQUh1S0tLSHhDMkQ0OWpw?=
 =?utf-8?B?bXp5bW5JZy9HblhPdHNFdUM0QXpSbDhvSHhxcDFrZ2lzS0UvUThPYVJoVUFS?=
 =?utf-8?B?UWcwUWxOTEROb05EZGdSU3d2MkFEQ1hnQWIyK3hIN1c2WlVrblpXYnZVNGMx?=
 =?utf-8?B?RDhKV3BRK21WTURKQTNaYzVhTSt5aGJBSTRWU2hlVXJsRE9XbkpCall2aHo0?=
 =?utf-8?B?MG5pNEdIQVVZeGF0d1JseHVhZG1ZOVB0bkJvTHZnSlU5Sk1rTXdhWTcvUVc0?=
 =?utf-8?B?eit4WXhlNGhvK1V0cUU4cW5wMlZUdmxPZDI4T2xXK2VyYlZSOHl5NnA5Ykx0?=
 =?utf-8?B?UnJQZStDYmNvM2M1OWhrSnh5RkVlbXN6STJLQlF5TUl3MVhBUGg0ZXk0Rnps?=
 =?utf-8?Q?2tqGXbOXkK1KPesiecetD9AGB9fuK2m/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlJQK0oyRktnTDdrdEhROFRvaVhlU3lOcWd5UkVBY2JybjR0S1VxeVk4MExF?=
 =?utf-8?B?UkxsRkdJM2JRbGQvano3VGh3OHp0T0tlVWd1NjE0cHE0VzVJVFV5cWo2cEdQ?=
 =?utf-8?B?VjRzc3NpalNWTk1uT3pJZDNTbkh4SklXbGUreU1YUHg2dUo5NS90S2lyeWNv?=
 =?utf-8?B?cDl4c1JyeEw1N0VZWDdBNHJNei9lOTFiRmZFeE91dXZaVTFVclVzMzhXMk9L?=
 =?utf-8?B?Q0t4b3gzaHQ1Q0lQRHpiQVJVbUhHV040dGJnYW9NVnFoTmpWdTBUNm0vK3BU?=
 =?utf-8?B?SnlqOVhrenlkcHM0Z3hqZGFRUkwvdzZ0TmhMRDNCMmJNMjFiYVhNdEN2Ylds?=
 =?utf-8?B?bzJLRm1qY1AvTjgyTjJucE4zQkRJQjFCRG9LTjBNajI3MVdINjZhdTRZc3RV?=
 =?utf-8?B?NlhLam9tWmRqVlpocTNIdHhWbkp0bklQdWRWSUlIRUg1OWNSSDVwRTkwTzVX?=
 =?utf-8?B?TGd2S0Y2QXQrWFJpU2xSNVU1THpQUW9vN3JhR1J5Rm5pcWpWNUo2Tm9LakJm?=
 =?utf-8?B?QTlOVjJiVU91amkvUGpWQ0FjM0pvQjFISkJzSjRBQ1NUL2FRRWlqTVpmay85?=
 =?utf-8?B?RmdPQXlYYys5VlVZRzRrem9pT1BLMU0wMldpYm1DUFZGSXBwU0p6b0FkRFVr?=
 =?utf-8?B?SjMwcHFhbVgxamlmWlcwa3kzd21CL1Q1ZFNmMEpVL1NzWXo3UFhENjVWeDhu?=
 =?utf-8?B?V2cwbElqd1UyZ25Nb0xBUVM4NTRKZGhLUjBVOUNsclcrMk5GUmZWbFVNME00?=
 =?utf-8?B?NFM2RE0zeXRMVTJ2eFV5VFdaNm1zVWFCUTUyRGEwQXUwcmYyaGUweGd1WDlk?=
 =?utf-8?B?akI3SnVxR2QwYVRwbk9hV3cwMkNDYmFwNDE5NzM0b3NPa2xERXY4dGhsZXdI?=
 =?utf-8?B?QkNhb0xublFxanR3MU51VmRBeG02R0F5bFVuY3IyQkpjYXVGR211c1BhWFdy?=
 =?utf-8?B?ci8wakZ0dTJ1OGlCY0RNZkYyZmlsdW82aWpBK1doVURkN3JybFBiQ0k0czhC?=
 =?utf-8?B?b3RlbUt2SlZ3SFRlRkZtYTBnTlRxS2lKRDhOWWMxVHZ4L3hmRDIrNStOT3hQ?=
 =?utf-8?B?RjlrSWQxSE95WG1jeitDNjVQR3N4SmppdG1wYzI4M3Raci9tbkZzWmc1am9W?=
 =?utf-8?B?SnIwZlJPVU9nbjRLZEFSRlVEQTBzOU5LR1QzQUVqT09FcGVKci95T21TSThl?=
 =?utf-8?B?RHhnUFByQ2VPOGduUElkQUFMNHN4K3hLUFgwWVQvOVlDVjgwWlp1VWdPcFFD?=
 =?utf-8?B?NDQ1akxpa3Zpb01XYVpkekp6MXNwZFFPZTJOY3dJa000RFhXbWpvT2xZL1VQ?=
 =?utf-8?B?RkI1SS9pUk4wVU5sdk1XcEVUSDJrRmR3ZGdoM0hWSm50bVBIKzVWd2E5VytK?=
 =?utf-8?B?dTd1TVEwSG50VW85WTZ2RTZxTnlPcmxlbjgvSFZNZ3lJNXdCb0dDTXM0a1dD?=
 =?utf-8?B?MklNaGNENHdVOU45SDhqY3BmT3VJWEsxTm5aSWJuYVdEeHB2cXphVThqRDhU?=
 =?utf-8?B?ckp1V1pjY1R6L1AzcUZwSjJydGZrVU11OXRIT1Bib1A4OXY5VmZEY3h0RE5F?=
 =?utf-8?B?WjBIL0pQM0VzbWhGZzVHMlYvMTM0cUt6MUJFWHpNdlV0ejBwRElNdERSbXlF?=
 =?utf-8?B?emRDNlhySGJLVk1sN0EvK2w5SmV1YXNTOXpJNzIvRlNidkZwOUswY2U3M05p?=
 =?utf-8?B?Z1JOclZ2akh3TEMrZVB1QzlSNTFzRTgxRjJVU2lHa21MV3E4emJIZmJrZVRC?=
 =?utf-8?B?dW5ydURzV05CVGxZcVN4YmpKT1JTSEVUdmM5S1JXK1VId0IrekIySnBEMjNy?=
 =?utf-8?B?ZFpEaDRueXFnLy9ZQWd3VkFhOGFTNGJvSHByWVorSEZkVFBtUFNFQk4wNGNY?=
 =?utf-8?B?cXlPY1FJUGdQZWVoNWEzeVZoZ3V6NmJqTDF4LzA1VUowallKU2dkcXVLRHBX?=
 =?utf-8?B?ZmpQQzlSNVB4VlQ1dmRBdmdxNmJTUjhLSDFzZ2RITkhxcU5kNno5Y3NvMkJG?=
 =?utf-8?B?VWx3NDNEWk95M3VEMlVIcEJlZEdPb1dFKzdKajU2UmRSNURraDZZQlYwZ1pV?=
 =?utf-8?B?RkhveGo0R1JjWFVsUFI5Z0phTWIrVkMwTUx4VmVCcENtK2g2Y3JTZnRNam5z?=
 =?utf-8?B?bTFXbnpFT09OWDZBdm1XbzN2SDUxNkNSdlB1M3I0aUx4SUljSTdhSVMzRDU3?=
 =?utf-8?B?SkVoSEZZRHduN1VEcVcrZGIvNGIwaWdRdEEzclZ0MEZ0ZlByYmtJZWduekhN?=
 =?utf-8?B?c1pBUXlwOHpyQThqWjZJSCsxUVRjR2F1bnMrenJqS09wVnhWMkJ1SjR3Vno4?=
 =?utf-8?B?WTJCOFJTTHJZYWVZczNQZGZKWENzaFZnRDlscmtwSUpsc2hVRVJUQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 493e510f-e81c-43f9-f764-08de52a9e5a0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:44:38.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 whRIjhpWAXx1xcD+D9sxgfqKJVg9Vd3EE/0SzCOBEAHHhSkloDnb4lTBz0VrSB62WmMHQRTZPIwu9R71kbV12A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6441
Message-ID-Hash: 45BBW5E5SMJCFMWYUUDHDTZ63P2HNHVL
X-Message-ID-Hash: 45BBW5E5SMJCFMWYUUDHDTZ63P2HNHVL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/45BBW5E5SMJCFMWYUUDHDTZ63P2HNHVL/>
Archived-At: 
 <https://lore.freedesktop.org/DFNI8U4LJEF1.3AVXPFQPJ926L@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> Up until now, only the GSP required parsing of its firmware headers.
> However, upcoming support for Hopper/Blackwell+ adds another firmware
> image (FMC), along with another format (ELF32).
>=20
> Therefore, the current ELF64 section parsing support needs to be moved
> up a level, so that both of the above can use it.
>=20
> There are no functional changes. This is pure code movement.
>=20
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/firmware.rs     | 89 +++++++++++++++++++++++++
>  drivers/gpu/nova-core/firmware/gsp.rs | 94 ++-------------------------
>  2 files changed, 93 insertions(+), 90 deletions(-)

