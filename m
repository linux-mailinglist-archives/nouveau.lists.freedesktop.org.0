Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A7CCEC43C
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 17:33:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E04C410E231;
	Wed, 31 Dec 2025 16:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YfY5AC+/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7CE7E44C67;
	Wed, 31 Dec 2025 16:25:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767198340;
 b=ZfxSYjOKyH56iCMckPkkW9MN5pNfaVKcWhV/a/jLxy0Dj2bqH2AA7Ja96JCTfzbLJmPbV
 CJEKoO7o1UJIYbyy3H2an142YIykBkC9Wk1wuNKa2VKRlOTuaY4QtdbRAS5SwwRJU2eGMM5
 F367sPoJzKV1XV9o+pbXhXUrJ4WA9IxGujfEQwe+BNGJ7R2QabsuQCBFyQ5Mkw0stcrRQE8
 hxqgUEFEaD87YtnK25hji/nMxXU/96PqEKouOSRqRbfi+kuDr+UkqPDoLnpvUZDplMR503y
 p1g61V5XuahXQahaqkHQoDkGAmxIHy6Cl/fxlymvggYJE5l8XpHqpL8VOdoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767198340; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z++PtkNMLtcD5/Y5rokRs4xq5wYIPKbCSzfUqFilE+o=;
 b=CWz4q76HXSsvGx3eV4MGVR//MaMkpygqu84AQ6Cns1PEGIHxT6Q7Q+iV5o2KQfhLlGrQw
 SpZAJO3oiSOqOMC6xrC+kfJyMgUWYlTioPDc/EqUBO9jnH8ZDFbcIMuYZt8JK4YY0Dy3M5a
 +GW3hQhr2HfwpVXxXcVz+70TQMsIrqXMv33c9fy7+Jy23Ip7ElNsiJm3+lKMuF4+0szX0sT
 Zx1kSJTlFBb9JmeroSoEFX01/8NeNLz4i48wAstZqG6qtz/EcsT3avWaAdueooV1O2MgVCR
 8ja7RRL+nW4bf0KNjqhDeqUAI2CPs6Ksjwb6vQm15x7IAUzuS2wD8JUsILtQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A2EE44695
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 16:25:37 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBAAC10E05F
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 16:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwirKPij8opokU2gqTUnhs+V5V5IcXXjTCjRhj0KlS4++21By3W7Z87bOXW0wVUQ2AJaeMcyzHt32rQ98a9SYtYTgG9SSEkHXCGiPpWdguc2erIp/QlFlrNNRiCgqmzgR6UoJiFTm0C9OxNiH6LYjsJ9MKZgghBHshgCE/nfXfyIOrlFcIw7v52l+DN+g5svGMIu4j8G8wtUTAk2yZsow3LlFNfv9bV1jLfoiNLHr9CqCOkogvRUkXFNzruDwmHp/emW2+l0XW0E+wKxZ+syC27ok1ZKotDPvXLQfmdcef5kQd0hr3sCLzmvqM8GexKuIpBiLv8w8AY34Du4A4JhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z++PtkNMLtcD5/Y5rokRs4xq5wYIPKbCSzfUqFilE+o=;
 b=MUP5KIVkGUYuESBRj4GTkghG8Dsco06yyLRerjX85LtfF1Rj7nvKa2+zvPl37FyUbFl5lA93xXY6+WuQhVKCwlEGQFxLLd9/+mf+xaNDSckXBtdIKDv7tFDZnAY81c4jyzirWnq4aL7PJ6X0F4t5en99/Uwp5X6I9shhUp+XYWr1qN1qan0l/6Hmab+I5ixguqagFcvXzGrCO8SIgQzTqQ6hQMUs+SAV7tXtuuWfI2MbmTy8MjCeMTwAwT5pgmpgkZuWuR6ZBYnrshXtjCWudhg92Isr8xaIEyII/KdTQ4Co9/NplN6Y91l0IAhcLB/nY10l1stNGxba1jFcARjNLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z++PtkNMLtcD5/Y5rokRs4xq5wYIPKbCSzfUqFilE+o=;
 b=YfY5AC+/0nxqvCUlob4P3QAy3WIl/cu1yN63CPIP98MzHPYZ2OSJyWfynuC6DvrpKvIsUQlkEW7Wqc9wmNLLXqR5zhRiLILV8bo3s/SDCYLS6lXuCR4699YWIjykVGllca1e3ajPjQz85pAdMuGhttErnTF57hckGMYL+YmSpqk3UUjjeY6QMEW4jAnKmXJhg4ymPoxhmUq/1NaiZlT3Z3CKrOuzM1Uk6ao4LMLwV51E4sJIu2tpI5CckyMSoESSLL1j7gMV3e4u6xdhl2l5ZekBemaSvt5vhGWfzgyVEQvZKlXbZetFasIkbRrrj6+PnBrkrR77JmtE2NAHVsoVUw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 16:33:32 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 16:33:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Index: AQHcb86jUh4zxo0ySUOi4HmApuhn2LU7IyUAgAAYf4CAAB8DAIAArCGA
Date: Wed, 31 Dec 2025 16:33:32 +0000
Message-ID: <b8386ea25078f9cd9012645732ba3ef943677003.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
	 <4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com>
	 <91be3c66-6296-4c37-9fb4-a45cf9865973@nvidia.com>
In-Reply-To: <91be3c66-6296-4c37-9fb4-a45cf9865973@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|PH8PR12MB7325:EE_
x-ms-office365-filtering-correlation-id: b2d7a950-d081-4e7d-296b-08de488a5625
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VDNFTXFMMjJuK1FaZVZ5RVNYZGNzVytlalBBQ0wwOGJVcjNtcnBvTmkyQUVS?=
 =?utf-8?B?NEpSNi83Z1poaUFhdEk1V2tGTmgrNWxmQzBCcHdlejBiT3o2N3BwT3lPSEVK?=
 =?utf-8?B?YmUvcnBHbHZITmJQL2N3bGt0TXhsWjE4RUVEc1lXeFhpcU1McVJQcm5zOExE?=
 =?utf-8?B?UkpJcm0xUjRLY3k1QWFSZ1B1NFVjZU9RdDVSQkdIK0phd3ZYMHQ5d3FQSjF1?=
 =?utf-8?B?bDhNb21SeEN4QlVPMXJLUDZGWkgvRkgya0lLMHU5YzlhN2RudHRvZjRhZ3N2?=
 =?utf-8?B?QUtqdlZqOGM1NllLYzFITXVCa0JTUzZPTHREQlA0ZFRYTEZERFZVTTZDY3lP?=
 =?utf-8?B?OWlvK0VCSWdybUR4Yk9mS0h2MjBTS1M5L21pQkhaSkVHZGx5TGhZUUYxeUJz?=
 =?utf-8?B?NDhOMUJUMzQ3OHNjckd0ekt0OWtsSUY1WVFEL1ZibHczbm9pdTZtaWNVNENR?=
 =?utf-8?B?QkhaOUNiVGU1OTcyMEhocmp6T2wrUTFSdmlPT2R3Q285Y3g4cVZhaG5WNkZZ?=
 =?utf-8?B?WStXdmk4SjFKZFp6cVNZV0p3SnI5a2Z4bnE3NTFpNEk5YUlaOURCMExNVllq?=
 =?utf-8?B?U1U3SmNVd1lBbkVQZUg3dENUNzZBSXhndktMVExqSnNGejFCenR2bTlqYmRw?=
 =?utf-8?B?dTEwQjBuVS9FdCtEaEYvM3Q4QlRwZzdUY3BMVjFhOU11OW44K004a1UwR2Rv?=
 =?utf-8?B?cHBVY1Q1UEJ5NldlRFdLN1d4TGxiM2xsOXE1QnlEdjhMeWFzeVBVa1dVbUhH?=
 =?utf-8?B?eW42TmRhQmNEZTZOSTloSjVNbHRwcWRaeXk0WUh1OEFiLytySVJSc0YwbVdo?=
 =?utf-8?B?Vm1SdTcwSjRXcWNJalJibzl2SDJZNk5UM2JuWElUZ0h1YmFNVjlsSXJEZUYy?=
 =?utf-8?B?OTU5Ry81MVdiVXV5UW1saWMxbVVrRTlBT2hRVVB0WkVoM3labWd2aXVXWmpL?=
 =?utf-8?B?SUExRTI5ZUl2S0tSb1J4TWxMWGNqYmYwSFpkTmY0VDlkNzdJc2JWTUN5ZHVJ?=
 =?utf-8?B?S2xJcjRieDM5bExqWGJVcXNiN1JKZzEvRldjTXJDUnk0ckFIdWQ3SWRrV283?=
 =?utf-8?B?clh6aUxrc29Pd1JhNGVvZDAzY0NZVWxPMjZoOVRCekxZWlVBbkNJdVMwYWho?=
 =?utf-8?B?cm1MU1YyaXg1Y2xRbGYrNFo5TzUwZjcxdk5pV2xpVVR0dVI5bmhpY0p4bGdz?=
 =?utf-8?B?enJwKzNPQUNOZ3BqeE9MOTh6TUM5ZjM4YUdkeFNaYWJLNFJEUVBySi82ZGNJ?=
 =?utf-8?B?ZDYyeU91TW1YNDFqV25SSEZhM1hHOWJZT0w0MlVjVHgxWXFMZ25PZDE3WVV1?=
 =?utf-8?B?R29uVi9BWHRRQzh6ei83M3R1WkhhT09zU3JSbFpJZFQyMml5OTJ4OVR4Tis2?=
 =?utf-8?B?UGxmWjZLWmJWdTRvT0VMR2ZEMDN0U3JoaHhCODhLM25IUzJmN1RueGlEUmtT?=
 =?utf-8?B?TkVEa09IRHgwcnJ2Wmw1S1ZtcERVNDB2U05sODVabzFYemlkMVZTUmhCUVdm?=
 =?utf-8?B?TTlvdXh6aDNuaCswbVhVc1J4RFNHOENFWUFFV09QOC9OaVJaeHlQL2RtR2tw?=
 =?utf-8?B?Z2ZHaEJYWU5DSDJJc2lBVTlkQjZqZy9Pd1NQSTdySHdDb3BGUnEwUHZXeUNU?=
 =?utf-8?B?RFViSEZwb0xCZlRSd00rWVExbjZKQ2VZS2d0UU9wOTY4WFk5NWJnNkxCRi9U?=
 =?utf-8?B?bmhwT1g1QjB4NWdONXFXa0IyK1Qzdm9PejFjRmVtWFhaTHpIN3oxaHA2TnR4?=
 =?utf-8?B?RWVHMFZvK3lDbFcwVGQxb2p0MDNjRVhTWXlLUVdjTk9Rem45Vmw4SnlGME5i?=
 =?utf-8?B?aEFYekZPL05iWFVpQkdjdFJNeUM4SUVFaW44am1TalgyMUVHTVdGOTcyM2RW?=
 =?utf-8?B?MWhscGkvdHR3WDNiSXZDQWRWSUVPL1JCSXJvNTcxeFduNVlvS1drRHVPdnd2?=
 =?utf-8?B?Vlp1Mlh3M1RLYXVjYm9yOUpKQXFkTGJPa1pVbjZ0Njlvb0xZUHpVYkNVTjdC?=
 =?utf-8?B?aEY2VStBUE40ODVKNlF5N2JramhyZGk5TXM1aUhYT3owZVBPMEtaUmFzN2Zq?=
 =?utf-8?Q?+M+Wrb?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVgzMVp6NzlYU1o0QStpT0RWb1dlTHllaXZ0bHRQNzVlY0d2Zmx6Y1lvS0pF?=
 =?utf-8?B?RVZpL3BScDdsNTExM3dvbUJJNVArckxQeVZQREVZRkhabVkzZCtVaG51cm94?=
 =?utf-8?B?bUYxK0xxL3c1OCtVMzRDbEZQeW9rTVY2bHJDK3gzMzNtTU1TeUFJTkpNaFFB?=
 =?utf-8?B?bXVvL050YkVXM1VhVERmRjZTSFJNNHNYRXZkTSs0R25ma1FqZk1rZVFPdStm?=
 =?utf-8?B?Q3ZrVjk3NUlCcmpDWnMxQXYxOEZzRXdyUm1LdDcxYXNtT2FnRGtLbUx4TFFn?=
 =?utf-8?B?SjZyRUJxajV4bEQzWlBINTBKSzcyQkZtdlZYYWw5M0kxMkNzZkVESVBEK3U4?=
 =?utf-8?B?cjBzWE5EaWpXTzlQWlBjR05oTTNNYTN2cDhoMHY4cS9ubllnQW5lR21iRkp2?=
 =?utf-8?B?b3h2NHI2RGo4TDdYeXVoNTJaUjZpOG1rZXdvVXFEV21tVllzZmZaZVVBdzZh?=
 =?utf-8?B?eUpubGdhZ1IxTGRLREpYQUNCOVdhbjhETnJMRklZZDJkQ1FXV1RRY0NKeFJJ?=
 =?utf-8?B?cG9QVlBtZitydjFMcUdYNzFBVjFVZ1NrdzVpQmtMTVlzNEFBeUFMSS9QTGVD?=
 =?utf-8?B?Vm5WTmMrVlBGSzJObzd2amFNanhWL3RyKzEvNnRsODBzT3l4d1lHUVp6QTlj?=
 =?utf-8?B?bTN0RW9jb0VWd3FHOGg5VG5pNzk0emJ6RUlTRnErMnlKUTNPM2ROb2xzTGhH?=
 =?utf-8?B?YkNrRjF0RzlNelNWUlpBc0xLa2RlaDRvaEFlQndTOGt3aDdNbWtsQVF1RzdU?=
 =?utf-8?B?K0daRGkvU0RaMmVMMUZLd3dyUThJdCtENGQ5MkNNTVVzUXFBcjlIZHJtMFJJ?=
 =?utf-8?B?dVloQjgvYzdDS1dYcS9PVnNHZ1pOdzVMY3hjckFqZWhpcG5BUUpLT1RXQi9k?=
 =?utf-8?B?cWdWd0R5RThDSjJCWXozdVM1dWRadVdhZ2NvdFdRYVljQ05YNDFYUVlPajIv?=
 =?utf-8?B?eG5oRDUvSGJVUWV5ODJ6endRVDRJamtEOGpwYkE3V0xsN3VPdFFWc2VndCt5?=
 =?utf-8?B?VnZFTktOTGpPakU5VHlyT2cvNVpvUVRWK3BMWGd2aW1jZG9kKzkrVHhCeFFN?=
 =?utf-8?B?eEkxQTYwR3BubExvbktJbXFWRzJPeXFsaE1yV0JYMEJCZW1aUlk4R1lhbmFr?=
 =?utf-8?B?MlFWL0I2K0hhdlBRMUIwMVhqeUhHZ2FKcGFPVWNFME5TRjdibjQvMGM1amV3?=
 =?utf-8?B?MlJiTVdLSEVIYTFEZ2ZYcnZIdzRiK1BhY1NDSlVvbEhjNnJXdGRNY2dTNkow?=
 =?utf-8?B?SWRpbUl6NnVJME9ueGdVZ3kyS1hCZ0ZjN2x2U1drOE5oMi9vRjNUcEw4U0JG?=
 =?utf-8?B?eG1Bc3hQdVdEbHlGNllzYU1Nb1NjYkpuV2tNelp3cXNvNGJmSldEZnFjamUz?=
 =?utf-8?B?WjFuWUtxOUtwZ09FOHFOMEdmRFkvRUhHVlh6TWUwdG51YVBjQm1SZ1NRV2Ft?=
 =?utf-8?B?UHptRGdra2dianBiTUhrSStBR25LZnJodnhYQlp5akEvaVRKSEdpK04xNDhj?=
 =?utf-8?B?ZGtjdzJFZTMwN1hzbnRDMWRCZS9nZjdSazBLejBobnZpa0t4Nmhvb3FuVlds?=
 =?utf-8?B?OHBRcFlaN2dpUVAwWXl2bHBsY1RQK3B3UkViV2pUY0FuUHNLKzMyNnlPZUJV?=
 =?utf-8?B?VmhoUktvVVZtRTZxb2VxSU53MDNpWTFTQ244bGxNT0p5U0xjUlo2dG1LZGo0?=
 =?utf-8?B?OU9ydHJzaDl5dlp4N2ZiclFDbHFxZ1FEK295Y3paNTVIUnQ3L0NXZTBsRFBS?=
 =?utf-8?B?cHZNczdCVGtKQ0VSVEd6OTVhNStkVFlRellRMFcya0NsS2c0Kys3SlNVTFRW?=
 =?utf-8?B?ak52RHBQa3BHVXliVFBqT2U3MWlqekxucTJSc3ozbTlkd1BWTWkwUEJzZVBQ?=
 =?utf-8?B?UG1rYnRJQWdCZDMwUGMxR2xnUkZDNW9nRVlmRlQwK2UwMWJDbzhCWnhsell5?=
 =?utf-8?B?ZmdzMllIdHJycm0vVmR1WGJWNGFFa3FsOUFJVy9mWXRoYm1ZWEZLY0Q5S3FM?=
 =?utf-8?B?QUUzK1h0cVVpbkhPN3ZpUndwM2cwSEh3b0ZYVDVac2kyY1lNcjB6Nm5BUzlS?=
 =?utf-8?B?ZHhlZWhqeGZ0cUM4NXpKQlZKN1o5OWcxMXd2SWtDZjQ2WGhNZWpRc0N1S2c5?=
 =?utf-8?B?cnV3bUZ6K2R1SjhtRUR1ZnBkQmRzTDE1a0thNmlJQTYvL3N0UllRQlVVZHg0?=
 =?utf-8?B?bWZuYzNqKzBGQmNkeTZ5dWdqOWx3dG1CQ0ZqSmNKNjJyWW40d2Z1c29WQzZC?=
 =?utf-8?B?RTJYc3RTUVVCRVRMTDNEZko5SkVaTGpJSEFUL1A3bmFvMVJRc2ZZVUp0enZh?=
 =?utf-8?B?ZzVqai80WmNITTRyVzMyUU5LdVdtRURwc1pIWExaL1M5Y3NuVjFGUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F21DB67D1F705949AA1226C1B09D6AEA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b2d7a950-d081-4e7d-296b-08de488a5625
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 16:33:32.0982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 1wwbCsIJHlm5Ay5PM0TDf7ZcXqx95jJUkesV0pCCxfZ+PoKrRJz9R97KPz4zcw6SxIUUvHpi2EAY0xI25ZRhNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7325
Message-ID-Hash: ZNGH3CUQ3UAEY2QGIM2BTSETHE5USEJM
X-Message-ID-Hash: ZNGH3CUQ3UAEY2QGIM2BTSETHE5USEJM
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZNGH3CUQ3UAEY2QGIM2BTSETHE5USEJM/>
Archived-At: 
 <https://lore.freedesktop.org/b8386ea25078f9cd9012645732ba3ef943677003.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDIyOjE3IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEFjdHVhbGx5LCBJIHNob3VsZCBoYXZlIGJlZW4gbXVjaCBtb3JlIHNwZWNpZmljLCBhbmQgc2hv
dWxkIGhhdmUNCj4gYXNrZWQsICJ3aGF0IGdpdCByZXBvc2l0b3J5IGFuZCBicmFuY2ggc2hvdWxk
IEkgYmUgdXNpbmcgZm9yIGxpbnV4LWZpcm13YXJlPyIuDQo+IA0KPiBCZWNhdXNlIG5vbmUgb2Yg
dGhlIGJyYW5jaGVzIGluIGVpdGhlciBvZiB0aGVzZSBzZWVtIHRvIGhhdmUgYW55IGZpbGUgbmFt
ZWQNCj4gZ2VuX2Jvb3Rsb2FkZXItNTcwLjE0NC5iaW46DQo+IA0KPiDCoMKgwqDCoMKgwqAgaHR0
cHM6Ly9naXRodWIuY29tL05WSURJQS9saW51eC1maXJtd2FyZS5naXQNCj4gwqDCoMKgwqDCoMKg
IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9maXJtd2FyZS9s
aW51eC1maXJtd2FyZS5naXQNCg0KSXQncyByaWdodCB0aGVyZSwgaW4gdGhlIGBtYWluYCBicmFu
Y2g6DQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zp
cm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC90cmVlL252aWRpYS90dTEwMi9nc3ANCg0KRGlkIHlv
dSBmb3JnZXQgdGhhdCB5b3UgbmVlZCB0byBydW4gdGhlIGluc3RhbGxlciBzY3JpcHQsIGFuZCBu
b3QganVzdCBibGluZGx5IGNvcHkgdGhlIGZpbGVzDQpvdmVyPw0K
