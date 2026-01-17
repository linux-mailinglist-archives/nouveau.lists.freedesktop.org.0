Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D99D3913E
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 22:52:13 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3FF910E200;
	Sat, 17 Jan 2026 21:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UblEdTUE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4422B44CB2;
	Sat, 17 Jan 2026 21:43:33 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768686213;
 b=wP6jtMvTZ1tjttTHLTCd1tIwy7XXOgAtukSNIw+q/6e8J0nXF4g5xNoGNz0upX8VcTdhv
 L4nm2x0HR7TuSPyEaO828s17fIxYZvOGChrNaRMJu83JqTyjUHts9Y5NRK5goQG0tH6QvSX
 8jDb/z+lfrp05HKrq4t9TtCY/weKfqWMqY2rF9bKDelbJ8uNcA9iwQAphAll7ZcU8VyBjHm
 h9eIiANomApU5BgsAKaDmnm//zCVsLmAAUOaIU110rdGQnkXm5juEnfVxcj9cXWuqCjZfOc
 1iusSTSyV/BBXvbwXIv5Z0ChJ8lf1bvd37HSCWU3qo/V7/U9oxNc5La2FCDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768686213; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ENIwDfikrMBKUD8XgeT7HdTarZOldlVc6oZ68ZnRbTA=;
 b=PWwGXyOdaLR3T+qupF11/sK3wrsWHvT82vgQfIYxXxqI/2g+1JHVpxtkfkJFKXGTOKwlX
 ecd9OuH0cTxLBeQv88dhiR8ufhv6nXPsjIpKTU2tdkKSBlb8exXEepn6rb0p46MSfhLivem
 eMUBvo7s/TScgIabjvHWTLMoYt6jkzL2mK7oZHKOpDaFWqU9i520z+TeRSOhf6cZlXvTDJV
 RZclPCjcjfqo8JIquTS3JffPbNYqi8IYs6Qqi2Oqewen2Yaa23EGTFVFs2YELfSF4GOJ8WZ
 iCwbWuJcxDZAUQUVeGwrh1NeY8QvQjYXKG3KNomqiVisXyE5iUqbObeSXDqQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F066F44C9B
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 21:43:29 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A80E10E0EB
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 21:52:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp5/CF9/3rOr276nN/qVycXnCZbs7GNOMMAfqYaHhn8Gcl59IMs3KSQjKnuiNlDm+CqPPPO3EmqbwXNZtvScRBZc5+ACYi488fWam8YfguHZcesj7ipoSANgGp+iM6bPDRQ3ombk0P4CJ5aM7KTK/rrkc9W1azmky/6aCxv9pYMwDUzH36QXKrBcQZ9orgOoUKHSxvY06iDfZIkFjTRwxX6qq6iwcF+u4UwdW/Y5g/nOFKdWk6pevn8dvS1yJXS84kcasAN88wkjAeNo6FR741PBVkWW75m88aFsyERR9rPnBor0Sri59fS3vBq3NvLSYbSqXgcOsd5p2p56Hg0JEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENIwDfikrMBKUD8XgeT7HdTarZOldlVc6oZ68ZnRbTA=;
 b=ojz6SQmNfuOkKd15qSrHdjdbG38jkYTLmYtWUn3+0bmLhd7zzu7ZlF4ifIhtflOALcLbbqbMhjkkPhcBlTl29/H1c1pl12ltrhCBkxgLyvGg5ObCLyxjyf7HLyoFs9sy5q6CioSXDG2MSeIZoUOrdia+ibCi8Xq9N/LdMjSQrs5sSJTTJ9OwBwEdDV5663Th6sLk4P1GbXxzNbCTtBku0UWTgwWGHO3UJ1+SceBepq4/udNssDxO/eknS8ORx2SQrtbFBSZsInReWprer3UYo9R7Utxz61UY3iPqrZx7AJ6pLAWKwo21S1CGBSjx+lFQADMqAqabmxceKZWgxG/aog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENIwDfikrMBKUD8XgeT7HdTarZOldlVc6oZ68ZnRbTA=;
 b=UblEdTUE82oGnHqfA+cjujJgakVE2SNjfF8NqHiarX7e4kBvlGCOE3gljJnNuWMefwXmDUg7NAq2kzk3WROP4tR4A4P7nuW864Cg7t2rUw7cciilLklOwpz9UFW1fCbTlHjI6/nXGiPkUION4y34eO4CczN6DD0EY4fuJzW5SIbGL+fhB6OqgKAUhHkyqR7PqpMnB5pBsWWH2I7OXPugkKUxs0kD0nQnsUb3CLzeuDnan4DvlFiRa2DkYmNqOOaXT0upWKhY0q6IR5ycQOEwuVVSKdh0aU7Nj1999+k1fLYcQrJZs/40KoedRAc5HIv6ANoBElRymU3nFO2qzXoNTw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sat, 17 Jan
 2026 21:52:03 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 21:52:03 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module init
Thread-Topic: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
Thread-Index: AQHchzIqwUaIB+PYB0OD3tkbaxdt87VWS1wAgACOTYCAAAp8gIAABHwA
Date: Sat, 17 Jan 2026 21:52:03 +0000
Message-ID: <c5d5d3fe71f6cd8725b47435f5c75394cdc9d9fd.camel@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
	 <20260116214959.641032-8-ttabi@nvidia.com>
	 <DFQV57XCLMB6.1A0IW206EXE3H@kernel.org>
	 <656bfffe43ab220b387fb56bb6eeb829ff0bd1ef.camel@nvidia.com>
	 <DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.org>
In-Reply-To: <DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DM4PR12MB7718:EE_
x-ms-office365-filtering-correlation-id: 8cbc67ec-8c8d-4986-5df0-08de5612a631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cDRVc0lyYi9OVFZVVkQvMWlHdXNOTE1JWUVHSCtvSDhtcFFFMlBDYmU5cUZh?=
 =?utf-8?B?UUdQaXV0dldRUTdiWnYwZ3pTU0VJN2NDVndjQ20weUU4bTJiTEg2TlhWb3Zq?=
 =?utf-8?B?ckVMUnk0aEdJdmpLMk1jTUplNCtXK1BzV2I4UlNMMExsVUlyOUEvK3lZaTdM?=
 =?utf-8?B?NFEyVlZFdko4T0pzbkF2MEFZUy85WkI1cUJ5bTJIQk9IMHhiSElEZTZNU0xB?=
 =?utf-8?B?V2lEdkcxaTI4elRWR0ZoODVwb2ZxNFI3ZVpnNEg4Q3dKZkZlOW05Z3pZQThr?=
 =?utf-8?B?R0hUNTA4R1M5Y0MzQWtyaXB3Y3VVdWV4NDAxOWhqbURWVStpTUUrSGF0R1pq?=
 =?utf-8?B?M1dBeitUa0FacDcxd3lyaGM1R21mYWlTeWQrQVBZeUdEeUZueURsYVJyU2ps?=
 =?utf-8?B?em9IZFlwWGg0Q2dHZjhEZmhUekxuRjJ6Q0F6QUJDTWlnNXdPY1VuSDNaZmhR?=
 =?utf-8?B?Y3h1RDI3OVFqRjJZa09zVVlxb0JrL2RUQldEeGNJNHQxL2wvSjFlVmc2WC9q?=
 =?utf-8?B?SWw0anFTeEg5SXdCY2U1TnlUQWdkdk5rcFNVYVI4ZTVYeTFhRFdWZDAvb3By?=
 =?utf-8?B?UHoyYXFlSWlOVUdESlFLb1lrbENKVGVmR25EMklNOWFhSkFLN1RDM3F1a1lE?=
 =?utf-8?B?SWZGc0E5dDNvRCtTWE5yUHdvVW85dHJnazRoWGtwTTVTeFA0WStKSXJuenBu?=
 =?utf-8?B?dG9ucWJqLzZJRHdROHU4Qkh6Z09QNmxSRCtHQ1hJMmpwUWJVMndiN3VpdjFT?=
 =?utf-8?B?NHhhZlVmOVYyeUh0MzVFVWFaM2dtY0hDck1mQU8rV1Avc2JSTC9QNCtjV09E?=
 =?utf-8?B?Wm1mZFJHWmxUaFRmOUxpeDV6eVg0VTdTRWljWEF2djg5aDA5ODRza29OMkJZ?=
 =?utf-8?B?TWxWb2w2eFoxUDBZUlFJMkRSdzIyZ1c1bVQvdEk5TlRiV1RMdm5ML0xiaFVT?=
 =?utf-8?B?WWJubGdvZm1wWGtucHhnTUdralJITER4Y2ZQc004OFJwV2FZYmFSdFU0ZkFy?=
 =?utf-8?B?UEJTaUpTKzlwcXJNTGVCeUR5K2tIa2ZJMTBiZmdaTmtlbFFNQUtHV2VycTNX?=
 =?utf-8?B?NFhBaStNejJqTU5tWllaMUtZbzVGNGdOZkxwUTRTdHozbjN1MWtvWVQrQ0Z6?=
 =?utf-8?B?UDBlMWVGWXlBQmFlOXdwTGlTMnpCb1hZNVBGUGZFZGp0SjhnZUpWTlFJUTNR?=
 =?utf-8?B?M2dNMm41aFUzVlkvckErc3lSL08xTVBMQ3NQVk5PL3NsKzVnV296b1V3SGNt?=
 =?utf-8?B?YnlOV1hnTVJjUDVscHhnY1RnVE1pWmZWeGR0T2VLMjZKbVZaT2FtbXVWdHFM?=
 =?utf-8?B?VWJaT1N6eVhIclRlaUtDM1VkaU5PZFAyWisvaDZiaG42Q2EvZlZnc1NZcDB4?=
 =?utf-8?B?STRBYzgreFB1Q1pZczdLYWRnYnhNUWp1L2YxbHI1UDY4bUVndnhwYXJOZjFV?=
 =?utf-8?B?WkpIYW9jOVdoMGM4cy93cExFeFlzWjVTbjZHZGdPWHpzTVlDV0RJakNIdkFK?=
 =?utf-8?B?U0hkdzhHNWdHc2tpRXN0eGd2anlmOWUwTjZiMzdsM3V2djZQQnkvUHRzbTVX?=
 =?utf-8?B?ZzBWODhSdm4zUStLSHFIZFB0UnE1NDlUNi9UYVJRcnZtT1ZwM1l6OXdRbHh1?=
 =?utf-8?B?cXdRd1VXM08zZFVpVkNaSzBwMjd0OGNSMFJwNGlHZWxYbmxiS0FMaEwwdHhz?=
 =?utf-8?B?UHQxNU4vL0djWnlpWDlOY2lBTDNoeXpvNlRaMVlaNlRTWWppaHJVZVY1c3hn?=
 =?utf-8?B?MkFHeVFrSWFiM0dMZlN4NGpEZG1rVTE1dVBUSDkrT3JSMnZPL21Gbk1sSk5v?=
 =?utf-8?B?WW9GU2JIbVRZM0JabEhScDJVR1J5TWt5eC9xaXRWUGU5VVNHM0tIR2ZjbURO?=
 =?utf-8?B?SkEreUF0TDh4YXUrUk92cWRDV05GYTdML1hKb0l2eFBpUG1CYXE0WGNQT2Ru?=
 =?utf-8?B?YUJ6ajVScC9FUWRMdDlKMWxMT1dDMWtKTnExU3I4WVpKS2t5ZDZhbnJwU2xo?=
 =?utf-8?B?clpFRE5kZncvSkQ1dWhxbCtiU3NibDF5RWNOYVZMWUhKR1pYeXBnanptWWdQ?=
 =?utf-8?B?YWtqRVNHRUx1cUVuZmkvMHFNQkduaU9rWG9sL21BWWQreEl6K3NlZDBxVnNP?=
 =?utf-8?B?ajVtcE9IdGpwb000dWF5a2w5MkhoNFVONHBLM1NXaUdERFBlUFJOS1UrbTNp?=
 =?utf-8?Q?XFsc/AdwEDnY/kxxfbk452M=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZUFWL25ibzVqc2NzaXpkSlJyMjExRVNXNEwzeENXM0RCbFVvTUFnSHdwUDQw?=
 =?utf-8?B?TzlzTW5udjB6bmx3T1Zxd1dnT0x1QnhxdFVGSkNrelIyQlJUVlBaZ0JSTEhp?=
 =?utf-8?B?STZCWGxRdlZyQWJOT1dYNzd6TE81YWZ6RHhuSU96VmZCRVVmMXFxSHQrR0hM?=
 =?utf-8?B?R29UY3VzWG1WcjloVHVpa0I5TlhoQk11TENydzdlRk5yMGRjcnRka0tGSThG?=
 =?utf-8?B?UlpLbzFZUzdTOHVELzZ0M3ErUC84QUNGWXhJR2w5ZU44YlRBb3dnbWNYUXVq?=
 =?utf-8?B?Z00wL2ZTSmlaSWFtL2IrNHFSWW14dnhXS2hFRm1MaTNTdnlleU9Ec1RNK3hL?=
 =?utf-8?B?UzdyT2FFV3ZqQlY5S3p3YWp6U1B5YURvZ3hCVnFiYW9oaDN4Z3dDQTlMSUg3?=
 =?utf-8?B?Nm5DNkdhMGxENzJkRlZHZWRpQldEMUFuQmEvcVVxbE1OZDZ5aUgvQ1d4WXRB?=
 =?utf-8?B?dU0zSDhhd2VIc3JJem1kbXdNSU90ejdEN05nQm9FMnNjQ1R6TFlwbFVlcDRG?=
 =?utf-8?B?bHh4dEVzNWk0MTNCNkthTEhxSDRwRjgzYi9raGM5ZWxhbnAxUmFZRDR6cVhT?=
 =?utf-8?B?NU9CSGN6UmVERHdqbko1a2tMMmpKNVFzMUdzK0NvT3dWMm53QVJIVm13MDZI?=
 =?utf-8?B?R2ttMk1vc3NwRW5BSTgxVGtMYlpURmdERG56OW5rZDhNZXp1SlFFYnhvQ0Na?=
 =?utf-8?B?TFVCKzZYVkQvS1FZNkRwTGVqNEY4TUoyU2tvUW1MR2VzbHFMN3BhWm1Ya1dW?=
 =?utf-8?B?eGJRQWNickpoQzh5c29objBFeEtuZUZWMC9TWFUwNk5ZRHY3eUtDQUs5Wmx6?=
 =?utf-8?B?SjZLVGpoVW1ZcjRsa1FqT09EelhwZjNmcVNOTzlEQjR3TDM5T200cmYvUmpC?=
 =?utf-8?B?V3ZkdWk4SEI1RzlJNThWaXZBS3J4dE9BRHMvSlR4T25NNG53VDBjQmkwWlE4?=
 =?utf-8?B?ZzhkVVBKSm5SWmhUUjRna0RZZVpaVGZENk1iQVdoa1JacTJxY3U5WmVLMHl5?=
 =?utf-8?B?YUFsRVRhZW5jZzFFZVFDN0xrTkVJSHdvK0Rmd214UVNjckVDVGI4QXQ2aXZt?=
 =?utf-8?B?aFNWUHBmK1MzZ0gxTHl0WTRZNkxzVzFhKzZHbC9LeDNBaVhQSVZVU0ZVV2ts?=
 =?utf-8?B?dm0zMlY5U1JPR3lvbDl6K0xWZnRTSXpMYkJ4MURTeUJsc1ZEelFaU0x1YWNX?=
 =?utf-8?B?akc2UEVIODJJSWxqWjZTdjhPajRmUWFYeFFVcEFaREd3aXpNMXI5UDR5Nmpk?=
 =?utf-8?B?SDIzOVJCTzhVTTBLVmcrTDFRTHgyS3d4b3IzMThvMjZGeUZKckpCenhqUEpP?=
 =?utf-8?B?ay9wbWV3M1F6SG9zb0E4ejhZcFRnbWxCU1lQd01FWStJdlFsZVdXOHhjQmgy?=
 =?utf-8?B?UXlKNlk2Ym5od1kySFdmMDhIb2NxbkFwTzV2cmt2OFNjSWlqRlNVcDZsN3BI?=
 =?utf-8?B?NDBCcWpwSmRORUJxUTM0TTg1Z0l3VzJpY2I4N09vUlgyWkc4UXdOQ21GNzRD?=
 =?utf-8?B?bWdiZm0rekZoa0dqMVg4ZWRsU3UyeXB2K0htUUQxZUhRajgyRTdjQW9GdG4r?=
 =?utf-8?B?aFo1ZXdxakVHZkdvU1M2a0ExUXBrem5NUTZzcHVMWmFtOGFvTTdLNW8yUmgv?=
 =?utf-8?B?V08vdVpLVThDdzFJcUhGdlhLYXJMeEJ0WENId0JqekNGbjFvMVhKdy90Vllv?=
 =?utf-8?B?am9uSS9WZUxyTkx3QmNGcHBZeldFdjJlVXpXc09mR3dLUmpHS2VJWUR6Vjls?=
 =?utf-8?B?VUwyOENNMGRwV1kvOTJMbFlvNS9FN1BpVmo0bFdjdE9DdEZtUWxSN1FUT081?=
 =?utf-8?B?UEVzNjF3dmJYR2hlT2YzQVNZOGo1Ny9ISWFmRjJRL3l0ZFpUbm1nNEJoOCth?=
 =?utf-8?B?dTVvRVRVUHgzRVpBT2s5dGRjRUF6QjNJN0VXekdpUWlTQ2ZTckZtMUVqWFR5?=
 =?utf-8?B?Z3hVUHlESkY3K2VkMzAraU1raE03WmZhZDBndUsrbjFyMktzNTczaWZIb3Rh?=
 =?utf-8?B?MTk0djBkWTdqSjFReXVtNWk3eGRpN29veG5WWVAwVjVvYk0rdUFvRW1iY1Av?=
 =?utf-8?B?T2l1T01MZFI3SC9Scm9QdmloUGJjWmdGNFlPQUxhdmxjcTlkQnpDL25RLzJP?=
 =?utf-8?B?a2k4SGFVN29ja0U2eXBzdnllMkhObjkyZWJ1a3h0YjhtK1haenRNTFNEbE40?=
 =?utf-8?B?ZXNydVZUalMwYkpqWGJwckZtL0VvREpKOFM1MTltdTUvbWlEak8rbld5OWMr?=
 =?utf-8?B?UnRQT2x3ZjM1RTVuMTR5bkVPWUs4OVVpZnhGczY0ek9hS2lXSFhwa2tYN3hi?=
 =?utf-8?B?TUM4aC93dlB3VkJMY0RDWVJQL0tWOTJvUVk0OHVRVjJPVUg1NHJVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAA18BCF8916CB4DA7B0DDAFB965725A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cbc67ec-8c8d-4986-5df0-08de5612a631
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2026 21:52:03.0626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PX/eNUkqUKXOPtWtLXT3CqJsLGfpAz9mTzhndFU39jIAHejVYAWAtJ77eSz0CY0Ktw3+IInC4E/s7Gdtumh65Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718
Message-ID-Hash: LSBH7FZJKENXWL67OLBFY26XD3ZJ3OQG
X-Message-ID-Hash: LSBH7FZJKENXWL67OLBFY26XD3ZJ3OQG
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LSBH7FZJKENXWL67OLBFY26XD3ZJ3OQG/>
Archived-At: 
 <https://lore.freedesktop.org/c5d5d3fe71f6cd8725b47435f5c75394cdc9d9fd.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gU2F0LCAyMDI2LTAxLTE3IGF0IDIyOjM1ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IFlvdSBkb24ndCB3YW50IHRoZSBkZWJ1Z2ZzIGVudHJpZXMgY3JlYXRlZCBieSBkZWZh
dWx0P8KgIFRoYXQncyBob3cgaXQgaXMgaW4gTm91dmVhdS4NCj4gDQo+IEkgdGhpbmsgaXQncyBP
SyB0byBhbHdheXMgaGF2ZSB0aGUgZW50cmllcyBvbiBrZWVwaW5nIHRoZW0gYmV5b25kIGRldmlj
ZSB1bmJpbmQNCj4gaGFzIHRvIGJlIGJlaGluZCBhIEtjb25maWcgb3B0aW9uLg0KPiANCj4gSSB0
aG91Z2h0IHlvdSB3YW50IHRoaXMgYmVoaW5kIGEgS2NvbmZpZyBpbiBnZW5lcmFsLCBvdGhlcndp
c2Ugd2hhdCBpcw0KPiBkZWJ1Z2ZzOjpEaXI6OmVtcHR5KCkgZm9yPw0KDQpPaCwgSSBzZWUgd2hh
dCB5b3UncmUgc2F5aW5nLiAgRGlyOjplbXB0eSgpIGlzIGZvciB3aGVuIENPTkZJR0ZTX0RFQlVH
X0ZTIGlzIGRpc2FibGVkLiAgU28NCm9idmlvdXNseSwgSSBzaG91bGQgbm90IGRlZmF1bHQgREVC
VUdGU19ST09UIHRvIFNvbWUoZGlyKSBpZiBDT05GSUdGU19ERUJVR19GUyBpcyBkaXNhYmxlZC4N
Cg==
