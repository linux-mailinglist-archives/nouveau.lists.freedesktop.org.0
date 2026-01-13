Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8693CD19189
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:28:25 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE8010E4E2;
	Tue, 13 Jan 2026 13:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="yfnpCEEo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9A70244CAB;
	Tue, 13 Jan 2026 13:19:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768310394;
 b=s23ijtuSubwEorzntJYgO2HkLerMVrYtpxLmJuM8sf4dTMeuVBzF9swM/+tx1wzaUbpE+
 Sfxl15b1Sye5BM1H3Cyi3EGQbnm7zTHDZUCdBggZhBFH31MS6bdkA503G/cCNNV3zF6Mwpe
 SjlC4y4jhV5tLiDFhOQg2zN0k/DX0CpQncaUuiKQPxzoymopfhIi8j+y9tYmOaQ9REH8DUi
 uOktleq41I5cmrnbDgl+3IiCB8NvHmio4PRLB5b3Bj10uQaHLUbzb4WR9g1M/TUBNUqwGbh
 n/kzqdy0gguqnEvD6VlDIspVbHc5WSDxoPjQmpcM7MNYhZyNcqQTsxXBjGAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768310394; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=COEsWvQeEZvlMpznFp90lhZFwRfMTCJX0qy5ADF8OCc=;
 b=SOEdPxBjeRP+AI+USePUThCbXnjnHBhyIPNIsLu0Jsa8Q9TL0TKeAelcSrHyvMxQbYCOG
 G1TK8nac8i0WRlgtOtVFBhxSJsV6MuVmJzPDQkbixi/pkFxU3pJWC1ueAw8tYKrCtamIOCK
 vNKUn2MHsfF8+hEvbdLLg8MNbiU2Tig61zwxBYnqxD1Yj/ZHrdyz+6cmkprV+14qYumsPvB
 ZyU4sMX1VC4oBASu5+j178x44ycC9lVRUS3nXQbUHZsy4GhQG8cXpS20o0FGcDmfqPF29+y
 h+GmcVU/ZuwJFl7fFp0VfE5/YPpghwIzvjXvbFFiHxEVEM6IiRmzBMnPgkow==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 79E6B44C99
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:19:51 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022103.outbound.protection.outlook.com [52.101.101.103])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 39BCC10E2A6
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:28:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+59o9RpskaU1DSADKUl9uizpYCrMaUoLGmEpiEQHhxElh/STfzCZObIhKrK6/eBGweLhEEM28kYrEt0dDTAvAWfyNcPa8OJHf8Owq26xQn8IrkkuDBqoa6FtTcnKFwS6IRX+iGrog00m5F0sR6cCwKQ9AYpBDITJLd0wirXTKNJQZOk0aJj3Wfhnv+WH6eE872V2gRLvk/LYN6muVutYeiKfYWecznI42jPhTbSmZS5AxaXye/J3pfQWkYSdmq8g9r0JLzjNneegwazPZBQ5UDuMmwzMMZVvVeSfpjhYYN860EhcxivdR8y8a17GEf/k7QfojkkZhsJ1cwcqMmSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COEsWvQeEZvlMpznFp90lhZFwRfMTCJX0qy5ADF8OCc=;
 b=IJPIYfwYdjiOK4dXeCCSBynwOK916byzqt0jxdwaQxwCAL5fXec3NVvOtmrBsZYAEXvdqwhJvuO131l+vW+xtBCYwFGVmNrOcp3eaKBzI6thVNJO5H9h3tp84fZrGNVhsvqfLcvodlLaPZGmhV56eL+Gr9IL5Yfaqe0PDQnzm3a1VmKLkxcnZBw6ll/Xp9cOWvWDgq/NLyzuEcStc1ziD91/GfdPMDSwT/rrSAfxfMW6PEYehj0zuVJ5plGhTmbu2LCdrGUs4VGjkjMmVg5f6wgu4+9dgtbI9oPhT26nvRnGd/BT35sHlHrMbs/qthzd19kFbHquo/UkaM9HkFzJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COEsWvQeEZvlMpznFp90lhZFwRfMTCJX0qy5ADF8OCc=;
 b=yfnpCEEoWQtNSb0f8udR3yD8A7RGLVyG9il44/aMEY4TU5aFlI5Pwe9ZjQeHvYIfsRHYf46I1MV0W1QFojHhTDTJOmfb8TJaGXbfD4TC6PduHn0gDr5ucAAzfkptVKzphVdtz8hlNjFrsgt28UIhOkQCiiv5c1wAZK15cXvhJvc=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2918.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:28:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:28:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:28:14 +0000
Message-Id: <DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net>
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-2-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-2-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0132.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2918:EE_
X-MS-Office365-Filtering-Correlation-Id: e16ec394-a9b3-40da-f4c0-08de52a79b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2UrQlN4L0JtMHovTEM0K2ZWMWQ3cWxrTEo0b1h0U1RWdCt4YUJwc2JOQjNn?=
 =?utf-8?B?MzVaa0FJcGF6M3lUTkNKVkRKVVhZb3hIcXg3TnZpenB5dlVWRGt3TDJFRkZr?=
 =?utf-8?B?V0hOUm1TMUlsTCt5aUNhYldOUFlHbTduYURSN0x2NHVPcTVVSlRQTmZPQ0tZ?=
 =?utf-8?B?a3pLNFB0VmJxZjVaNlJKd05QWTIzSDIzNm5UZWJXV3pyV2M0ekxSOFJnS25E?=
 =?utf-8?B?OFczYnNGbEYzUlhyaTB4cmJPSTRqRytsTnpIeGhMY2puUFpVamk3VlAwclVo?=
 =?utf-8?B?Y1B2Qkd6UFNMVGNTLzFFaWVueFJOUUxlWlpOcDZUNGVmV1lvU2lENXJGa0M0?=
 =?utf-8?B?UWtCUUFiQ25UZUhObmV3ZDBWcGJpNU0rdEQ4SmIvQWZtQnU2eXRJT2JBRkVY?=
 =?utf-8?B?cHVjTC9IcUxNSkpEaFFBNE1SSlNzanRacTQwTlhZSVhnZVFNRUlGb3NWY1VC?=
 =?utf-8?B?c1RoUkY0NE1nditaSVhBOTZZdnFteDZERUxOYlV6VnVGU2d5elpJeGsyMkpi?=
 =?utf-8?B?QUNxczRXeVB3SlBndUdSRTNEdFFrMjVzWDRIdS9SZHNsak1IWUFzZWlIYm9J?=
 =?utf-8?B?eGFUM1N4bUxnZVVMNHBpbnBjb0ZRdE5BR3RpV0VSMWZ3azd1VXdvM0FVaGVQ?=
 =?utf-8?B?K1VCcTduQTJtWHNjN0RWVHFCSFZJa24vNWVyWnhuZzVDcFo1dElMQVB3Zk9s?=
 =?utf-8?B?aGlLSUdBTGZjanN2QzhOdVpJMzQ2NkxKa1g5bk0rcysyajF1anJmMHJDUEh1?=
 =?utf-8?B?cU51RFdQclA0K1pZeVBHb0hDRWswZ25Fb2dDbE5NTzQyUjltRjFUR1dUSHRC?=
 =?utf-8?B?Q1VsbXpGMndIUTVuaE8zclB4OEIzQXJNSFplY2RldUxFVjNrOGNuNXFoZEVR?=
 =?utf-8?B?dlYrOGlSb0V4NXlaU1VoRjRxcmRXbjV4ektGYW1xOTMvSU8vLzhHV2JadUFu?=
 =?utf-8?B?L3AvbVltMEs1T2hQcXZJK2VzSGw4YThSc3dsZXlRWFZvR010N2ZYOXFlNmxS?=
 =?utf-8?B?SDUvZjBCTjhERkp1amVkdnVXdnhCcnZwcE9vTllYQlQ1Ync0V05ZbnhQT3Fx?=
 =?utf-8?B?MmtWZFZnVTRORmFHVFJYeXVvbGQ1UERPVXgvZGFKdVZDMjhLeEpTQmt5NHlq?=
 =?utf-8?B?cGdhS1FkMGJhbUhGdEZqeU9Zcnl2L3dZZUp6aG5aOHJud2NmcDMzZExJUmYx?=
 =?utf-8?B?YW1rM002Q2tnN2g1T2MvYmFxOHhlMXdVSlZLUGVxU1FCTzZWZWpHaHc4WDdq?=
 =?utf-8?B?aDRPbGVIeEpTQ0lyNG01Q1NyMm1Vc1M1RU5lWVhxelJhdTVmR0xadHN3SE56?=
 =?utf-8?B?c2xUaXFHeWM0ZHNoRG4rWjhvMlp4bzJSVVJUb2ZGR0xjb1drVXoxRUp4amo4?=
 =?utf-8?B?L2g5aTR2YkpTU0FUOWQ2WFhxRTlGNzA1cjV0OE1lc0Vna3lvVlVHckx3TW9l?=
 =?utf-8?B?REFaZzkzbGdKczgrTkVoOVplMTI5L0FzWHpWbUdvdUp4a1QvYll5bVVNOVdk?=
 =?utf-8?B?TVZFbCt3eXE1UThjTlB0Nkh0R0JMa3prdlpNUDljUkNkNExuMnlWQWdBcnI5?=
 =?utf-8?B?dG1xa1F4Vk9Sek11L29YaEVmQUFUM3ZuQ2t6SXF6NzNOWUZXc0NTWjJISlMw?=
 =?utf-8?B?ZkhlSzliTnZaS20yYmlDQzVTYWc4SVk5SVYvL1dIWjJETFJPTlhtMHBrRzN0?=
 =?utf-8?B?blk2WnVuYnorRXlOcGtBK2ticGlhRTljZGxidkx6VDk3N0hlVWpzS0Z3VThk?=
 =?utf-8?B?OFpwQVgvNUo4cmcyQlFkbG9Ebk1pMWcyQnRNSTZUNVBlSHh0UTRCNlExUi8x?=
 =?utf-8?B?UHFUbVkyQjFXWU1zdXhMNE5LOC9jVE5RKzJJTm1VNlNUY0NmM20vZ3RyVUht?=
 =?utf-8?B?MElIZFBOeVVuV2JCM0RBMGJaekVhb3hZcDVjeERSOUVKalBkY2JTZUlrR3dl?=
 =?utf-8?Q?20R70iF8+j1FOyLGyIat8Sx6T1Nr2wic?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTlTVjB4Ui9HekhuSmQ5L0RqOEJsTk9iZFdEVFpCSm9hajhVVk10R2tnbmdm?=
 =?utf-8?B?N2NreTl0SDM4ZkVta3hPZmhFa1Z3WGY5Ylh2K0ZZZTI1ZHZZaEs3NjJxbCtV?=
 =?utf-8?B?d0lRdU0vcjFPYXNyamNBMjNBT05VYktib1RKZU01T2ZEenVYcTc3eXF0L0M1?=
 =?utf-8?B?NWhXR3NEVk80YmhoSmFlei9mU3BFeFFyN0JpbVpmWVVnR3lBNDNWRUlPN1VG?=
 =?utf-8?B?M0ptOUlvckQzWmxieE5pNVQyNCttMFNYT05lNVkvYW5ZdzUyaVIvazl3c2Vv?=
 =?utf-8?B?YVRtdXd5YnZ1ek5aZ09KTjVCVjM2b3IyT3hJNDRseHphMmFrVFFPL0ZVcHlv?=
 =?utf-8?B?dkdFUDdhQ1hycDdWKzFtb1Z2N0pvTjdDNU5keEhRR0c5M3c0UFpnaDVJbXFN?=
 =?utf-8?B?cFhMMEZwTHc2Vk9jNm5RQXRZZUNVb0hFYm5VNHhEdktMZkh3Z3ZsS0FCaGdt?=
 =?utf-8?B?TlFWR0pBSGs3blNPQmJFOHZxQzdEL04zb0pVZmJIWGFac2I2VVNacmtvM2tj?=
 =?utf-8?B?dHRTa0NZL3JocDdnUVM1bVkveVhsZHA4Umt0L0g3czZKejFmNEVrUGdIYWMw?=
 =?utf-8?B?aXZ2eDlzRXJSOUM5OStaUG1BRy9RRlZvNUZZci9MMXZMcE15Y0htNGQzNEdZ?=
 =?utf-8?B?ekJDZzdnRUp0R3ZqbTE5dDdDMWlDMUYyUDkzYUd0R1lSSWpRVjR0YnI2NVI4?=
 =?utf-8?B?anhlRVAxb2JoY2VvMGp2NSt1TjA5TVdoVjRhTWQ0VHhvbVhOZFFjbks5Q0ZL?=
 =?utf-8?B?Sm9xRytYKytVY25QRm4zL1FpdjRhRkxEWmN5MnRnSVJRQ3A4aCtaZVFudnlX?=
 =?utf-8?B?dzJ0WTJjRFdMVE9VNlhEMVE4bTB3Ty9wdkNoeUh5N09KUjFpNzkySkFadGlu?=
 =?utf-8?B?dVNadTY2ZEpJZE50dC9DT1BxQnVqWnNGYjFlcVZZSEtndElQOFAxQW05ZEhx?=
 =?utf-8?B?QVEyQTdLS1kvVERDeTA4bWQ1S3VBSmhESGI3Q1Vla3FmSnF1VGhFZkpOSm1F?=
 =?utf-8?B?TFBkTEVnWDZIS2w5SytBZVNiQUJqdWZIMk5LaTBRMnBMUVZMbVNFdXZIcEpQ?=
 =?utf-8?B?RWxKbjlSVHlEbXpmZDlvK1pleXg1YjRpd1JPQmNEZFJDdysyZGtyWjRuSCtm?=
 =?utf-8?B?dmFhSUJEZnVwNTVDNFJYV0JhazNQbTRXbFFnZmdWSFVqRlBmckFrSDB6eFlP?=
 =?utf-8?B?WXRlQWF4enFRQzFOQllEV0t5TjcxQ3FaeFpOZGdRdFB4Qm90N1E1T1ZORTJ3?=
 =?utf-8?B?SlRHR1NUYUJ1ZFFtREF5OGZ0V0MyWHhrQmdTbXpHeVZpdUJRWXBsaUxDM1Jv?=
 =?utf-8?B?RmlUMHQ3VXhkSFFEaSs2UzNPNVZXRU5IYXczN1dDaGFZU3BOMWwrWGNKcXU2?=
 =?utf-8?B?TnBXMkhER2UrVzVDVUlYd25iZnlxWGoxY2xGOTdCUFJmUmpoT0VySjFzaVRN?=
 =?utf-8?B?OWtaeHBxR3N0UGhjbDdzSmNobmw5MU9tTENndC8yYU15KzhTTkd0NTdEb0dX?=
 =?utf-8?B?Mnpidno4R3hCZDB5aDloMThMQi9LRVlmeUxZYW9kWVNYd0pOWWNaVWFpVlhG?=
 =?utf-8?B?UFFjWnEyUzcvbklQcTY2dGx0Q1A2aVRaRW5oV3FqVS95djVFU2x5YmZSTFg1?=
 =?utf-8?B?Z0xGUXpUWnE1KzQ1OHZ0Z0dWWDgzK3RkbWREQ0pVNWVycEhMR3J2SVNpMlZN?=
 =?utf-8?B?dWVHYWIvcWlxbHNOZDZMUTdnMU5Pd0tsMzYwSjd6a09HelVKZ0wvRzh2Mk5P?=
 =?utf-8?B?c2xaSVBNUW5sQ3lnbGkwa2p2dWczQVNlQXFCcXJwUnlqSkRSalhpV1JBNll5?=
 =?utf-8?B?MGJnUWFoUFZhK0tWZkNnUlhPKzB5dmdSbDdqWXQvSWFEY1VaZjZxR2pvL1FU?=
 =?utf-8?B?VW4yb1hhWlVuOFcxRVMvdTNBU2tJWlVSRDRzS0g0d2grdytEUVY3Z3RtWTlN?=
 =?utf-8?B?SDJBMlFscHFYK1o5RGhJTkg4V2ZKR0FoYXlBeVo3SGN6L0pwVm56UnpGSldQ?=
 =?utf-8?B?ejNjMHZ1TG9ULzRWT1BiMkZaeE03Z0FweGg2bDZFQmxKaFYzQ3UxSi8vRUlM?=
 =?utf-8?B?MWVXSFRPSkhta2JRa1VHV0Nyb2R1VVpZZ25jYU9RcFdodVE2RmJHTUxkZGli?=
 =?utf-8?B?Y2FlWjdDTWgrUjdwdGgzREpkaW4vYWpLdjZSaC9JUkVjK0IxQ1BzQmZxNHlS?=
 =?utf-8?B?ZHRSaUgzZGVkYy93UU90OWEvVDJYbkVqRU5UYkVoTkkrUWJyV3o1WkVmTk5k?=
 =?utf-8?B?ekR0MkUyK214M3Fsb2pLWHdxblNRY1lEZnk4ZXZrOGQwK1FyT3NnQlRkNVJW?=
 =?utf-8?B?M0hMM1ZCbDF4cm8xNUZTbWE3WklOOUlsYVdQN0lxYmdaVU9HU3VlQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e16ec394-a9b3-40da-f4c0-08de52a79b5a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:28:15.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WbCCOQ8paVbnd0rEL8d+keLayzVsaB/CkJ5vVLfnrltK/qL+WjDChmjb6OsJ2z0bnq5AN8k16im7WwGWGRRT4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2918
Message-ID-Hash: 4AKIEE5A6BTTE7DECHYCDHMT7FVKCXNT
X-Message-ID-Hash: 4AKIEE5A6BTTE7DECHYCDHMT7FVKCXNT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4AKIEE5A6BTTE7DECHYCDHMT7FVKCXNT/>
Archived-At: 
 <https://lore.freedesktop.org/DFNHWA9PXH5X.5HWPO3GQPX6R@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
> For convenience of the reader: now you can directly see the sizes of
> each range. It is suprising just how much this helps.
>
> Sample output (using an Ampere GA104):
>
> NovaCore 0000:e1:00.0: FbLayout {
>     fb: 0x0..0x3ff800000 (16376 MB),
>     vga_workspace: 0x3ff700000..0x3ff800000 (1 MB),
>     frts: 0x3ff600000..0x3ff700000 (1 MB),
>     boot: 0x3ff5fa000..0x3ff600000 (0 MB),
>     elf: 0x3fb960000..0x3ff5f9000 (60 MB),
>     wpr2_heap: 0x3f3900000..0x3fb900000 (128 MB),
>     wpr2: 0x3f3800000..0x3ff700000 (191 MB),
>     heap: 0x3f3700000..0x3f3800000 (1 MB),
>     vf_partition_count: 0x0,
> }
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs | 66 +++++++++++++++++++++++++++----------
>  1 file changed, 49 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 3c9cf151786c..333e952400e6 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -1,9 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use core::ops::Range;
> +use core::ops::{
> +    Deref,
> +    Range, //
> +};
> =20
>  use kernel::{
>      device,
> +    fmt,
>      prelude::*,
>      ptr::{
>          Alignable,
> @@ -94,26 +98,54 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>      }
>  }
> =20
> +pub(crate) struct FbRange(Range<u64>);

How useful do you think this is in general? Would it make sense to have a
dedicated PhysAddrRange type in kernel crate that provides this feature?

> +
> +impl From<Range<u64>> for FbRange {
> +    fn from(range: Range<u64>) -> Self {
> +        Self(range)
> +    }
> +}
> +
> +impl Deref for FbRange {
> +    type Target =3D Range<u64>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl fmt::Debug for FbRange {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {

If you want to make this more generic, you can gate the size printing on
`f.alternate()`. So if people use `{:?}` to print a compact form of `FbLayo=
ut`,
they get just the range, and if they use `{:#?}` then they also get the siz=
es.

> +        let size_mb =3D (self.0.end - self.0.start) >> 20;
> +        f.write_fmt(fmt!(
> +            "{:#x}..{:#x} ({} MB)",

I would either just use IEC prefix "MiB", or alternatively use the coreutil=
s
convention and use "M" to represent MiB.

Best,
Gary

> +            self.0.start,
> +            self.0.end,
> +            size_mb
> +        ))
> +    }
> +}
> +
>  /// Layout of the GPU framebuffer memory.
>  ///
>  /// Contains ranges of GPU memory reserved for a given purpose during th=
e GSP boot process.
>  #[derive(Debug)]
>  pub(crate) struct FbLayout {
>      /// Range of the framebuffer. Starts at `0`.
> -    pub(crate) fb: Range<u64>,
> +    pub(crate) fb: FbRange,
>      /// VGA workspace, small area of reserved memory at the end of the f=
ramebuffer.
> -    pub(crate) vga_workspace: Range<u64>,
> +    pub(crate) vga_workspace: FbRange,
>      /// FRTS range.
> -    pub(crate) frts: Range<u64>,
> +    pub(crate) frts: FbRange,
>      /// Memory area containing the GSP bootloader image.
> -    pub(crate) boot: Range<u64>,
> +    pub(crate) boot: FbRange,
>      /// Memory area containing the GSP firmware image.
> -    pub(crate) elf: Range<u64>,
> +    pub(crate) elf: FbRange,
>      /// WPR2 heap.
> -    pub(crate) wpr2_heap: Range<u64>,
> +    pub(crate) wpr2_heap: FbRange,
>      /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
> -    pub(crate) wpr2: Range<u64>,
> -    pub(crate) heap: Range<u64>,
> +    pub(crate) wpr2: FbRange,
> +    pub(crate) heap: FbRange,
>      pub(crate) vf_partition_count: u8,
>  }
> =20
> @@ -125,7 +157,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>          let fb =3D {
>              let fb_size =3D hal.vidmem_size(bar);
> =20
> -            0..fb_size
> +            FbRange(0..fb_size)
>          };
> =20
>          let vga_workspace =3D {
> @@ -152,7 +184,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>                  }
>              };
> =20
> -            vga_base..fb.end
> +            FbRange(vga_base..fb.end)
>          };
> =20
>          let frts =3D {
> @@ -160,7 +192,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>              const FRTS_SIZE: u64 =3D usize_as_u64(SZ_1M);
>              let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_A=
LIGN) - FRTS_SIZE;
> =20
> -            frts_base..frts_base + FRTS_SIZE
> +            FbRange(frts_base..frts_base + FRTS_SIZE)
>          };
> =20
>          let boot =3D {
> @@ -168,7 +200,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>              let bootloader_size =3D u64::from_safe_cast(gsp_fw.bootloade=
r.ucode.size());
>              let bootloader_base =3D (frts.start - bootloader_size).align=
_down(BOOTLOADER_DOWN_ALIGN);
> =20
> -            bootloader_base..bootloader_base + bootloader_size
> +            FbRange(bootloader_base..bootloader_base + bootloader_size)
>          };
> =20
>          let elf =3D {
> @@ -176,7 +208,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>              let elf_size =3D u64::from_safe_cast(gsp_fw.size);
>              let elf_addr =3D (boot.start - elf_size).align_down(ELF_DOWN=
_ALIGN);
> =20
> -            elf_addr..elf_addr + elf_size
> +            FbRange(elf_addr..elf_addr + elf_size)
>          };
> =20
>          let wpr2_heap =3D {
> @@ -185,7 +217,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>                  gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end);
>              let wpr2_heap_addr =3D (elf.start - wpr2_heap_size).align_do=
wn(WPR2_HEAP_DOWN_ALIGN);
> =20
> -            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
> +            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOW=
N_ALIGN))
>          };
> =20
>          let wpr2 =3D {
> @@ -193,13 +225,13 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp=
_fw: &GspFirmware) -> Result<
>              let wpr2_addr =3D (wpr2_heap.start - u64::from_safe_cast(siz=
e_of::<gsp::GspFwWprMeta>()))
>                  .align_down(WPR2_DOWN_ALIGN);
> =20
> -            wpr2_addr..frts.end
> +            FbRange(wpr2_addr..frts.end)
>          };
> =20
>          let heap =3D {
>              const HEAP_SIZE: u64 =3D usize_as_u64(SZ_1M);
> =20
> -            wpr2.start - HEAP_SIZE..wpr2.start
> +            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
>          };
> =20
>          Ok(Self {

