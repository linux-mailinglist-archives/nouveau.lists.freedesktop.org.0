Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96155CEC948
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 22:30:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 28C7A10E9CF;
	Wed, 31 Dec 2025 21:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hmN29iWd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 851DF44C7C;
	Wed, 31 Dec 2025 21:22:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767216129;
 b=PhOzF2weF8i9CO3hZ6E0VRAqWzQvs3jZZNW2AqjgBeYcb5DlABZqUe24uM5+X5ECgFC00
 Ux6IF9HYK1VV9nEXxnlwhDwuRhJt4GhVey0tGov1CRlm9jaQwvRuFnjikNLGsz2+yyI3vhQ
 gPIdSkUIKHMb+LK/VY2dvWFxb7LbCTG58nTsnMUjvJO/YxC5gKRmlXX40Kbrx+jI44V+OsN
 2lCykg+NsIY886aEW52KvGvW9QKoWXLabXV6HsXNvCnBkpRO4LJ2P1h32qJXUqRfw5ofpHy
 b9tKGT8piCuDtwEuC5cfOAf9PVF/DHnVHwjOb7r2inyEdC/otq94h0+U7L7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767216129; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=id9TH78Z4kW4GyYaM1liABDYs2dSUI+Mc7Btbw412wU=;
 b=ZuztDYUIMk+7JUXyAb1n95E8bU5mwdZWuMFVK2KXjIYsxTuQE0CGnFgzbihYqsqpDmqQu
 GiTKEcGEMqsVhgP/novW6aB0tRQU8PwwVk8KycapztvMvAVdDPx0qWrE97lqzah0AJ/yvEq
 h5CcEhR1QYZeqSCXFOGHNdoErMJ1bqtSWoHGx8FIkniO7yBTcC11w1LQl6xyWgRDUAT8m0o
 aSTTu4LYPc1cj5iBvUimNVEQzwMLyF/9CX5ZGhFeKzIz/vsd4kHNCj+XIqF/zJz0pEWQfof
 nptt5yQ4v9UxCT7q28mObruCO08frWV3cvOvs2GDSRo4Gd9E/BsW9TfHNbBQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5589444695
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 21:22:06 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6E610E07E
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 21:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvgZdKYNzcPwCwI9UoqjGjOzonWL/qm0JLKHCozE3mbV8i7R79J3Ik0Qiy2GJ3BztDYY4qUzh7OiiPSwoSRkylCU3s2EzUJmsj1nCzw687UeyAN9ARZKaeG3XAzMff532l1ALEqoZ5SHoM8CGIog8qv1fQz5K2PVm/ACrINqvcveWUDUuFUWWvo+3X+MrM/Rfk2x7d+W/y6JUzU9y+IlYjMlyxCqfXk6TMVAL7jDGLjHIKfx9Rrz2mV4Iu68FdSChL+3+Fh9wDTJEKFqZ9uBo6n6Ojy+E3jxLwzw1//iTKQZCs996PEmOnYvrWaWuZYeCXh43WxxxHT7r0+5M/sgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id9TH78Z4kW4GyYaM1liABDYs2dSUI+Mc7Btbw412wU=;
 b=PwAlxELzHoi/0L1sBYXZpNmVJL1yRgEAxezBNY++ogEDSKwry6rEqzs1pT1Ufv3qiSdKsdYc/Tzmlc2fbGqBO1inxo8w4s5k6hCjnIZxizOdRH3RurJZyrmgxN956dJkRfAyBMhaRlU9YPqiFmrFueu0TpC0EhQougVUBB9E8W8NoAORTBxEz+qftMAB69MHdxYZ1HA2DqJWS0vo6sy1sKCfcheqS7htNVlCYBOuldSfbk3AIDAZ1XcfBy82uy7kkqdvNKzDoQ0kam9c95g0nzs7x6jciZD6PSdUFa637erdiN1F1TmmcVE7ewV67zowbr8g+NYrlyt2ClS+R9YarA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id9TH78Z4kW4GyYaM1liABDYs2dSUI+Mc7Btbw412wU=;
 b=hmN29iWdRcd6ZbZNp8Rg0A4qyzhX9XEGXq69vOTGrcFOpcwrmQsPiJdRRXqrVWmtkYdgOPIHMDi+dV/psiWRH32Uq0BCva5MI+5AGc6m/77JsArPWf34BsfbJ3k2V6NHoPckvVJ1tFGkcKW8BtKfypFYV7q8UgkOszjSS/GU9Tck/GSYxfTIsUhp/LpgSAu8FbB1yYhAr6nrREyjio3+x+mJEV6NSijkVoCQFW0kPIdkKEPMNtjeuxlApUNvDCfT7IxEV1W0y0dz0XlGLQJaM+AvRPf+Rm1PieWcs/IFCt7mgyU1K79acUrXEn3gXpjbRszf/3nOR9jFhVpJy92sqQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 31 Dec
 2025 21:30:02 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 21:30:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcb86uRR5PbMKlQ0aCb0DHh7/+RLUnXKiAgBT89gA=
Date: Wed, 31 Dec 2025 21:30:01 +0000
Message-ID: <707f5d20ae40b2eabf0820967fefbe84822fa956.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <20251218032955.979623-12-ttabi@nvidia.com>
	 <DF1D026W0BQ9.1DUWS5LKR09TG@nvidia.com>
In-Reply-To: <DF1D026W0BQ9.1DUWS5LKR09TG@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SJ0PR12MB5635:EE_
x-ms-office365-filtering-correlation-id: ae6e0692-3be6-470f-2850-08de48b3c1a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NDFZUExMSkZkdzhEcDJzZGl6WkNYMnFjQ1Q4clhzR3lWcEpteVM0NTlaWVN4?=
 =?utf-8?B?U0FKTEN3akV2UXFub1dOaDlwV0lTZmxSMCtXYzVNU3Q4S0RsT3lKeHlxbXY4?=
 =?utf-8?B?Q1BJYnBSVXM2MXVvRnNCd2FpbTI4WmNkMjhJRmQ2OFRyamxWVEVDMlRBdUlO?=
 =?utf-8?B?aFRFYXpGaHJoNEhOM1dzQUlUWHhOdnFmaUx2U00xd1BVWm45bjZKNmsrc3JU?=
 =?utf-8?B?Y25IdDk0eDVFTjI1b0FXZEhrZUZIMEt6R2VMY0wvQmgzMXlPNUVVZzNwb1l4?=
 =?utf-8?B?UzdtVDVIUGpaWjlCalNnUnZsSzZET1l0c0F3WDBGSWFaV01QcklXK2FoOVRD?=
 =?utf-8?B?YTZtRWVkUnpjVHJ2cXdTckVzcVZPcVN6MWxnZ0xDMnhuRmdFMHFTTWx3UU1r?=
 =?utf-8?B?cTlNbmxsc2pYcDR1ckRMblBkcWZmRVFDakZJM2VWMEVqTmhCQVlwMHR1aHJq?=
 =?utf-8?B?dERkREphL1dEeGE1d2oxRzBHUHNtQjVldmhwcjlsZTRSMEwwUzB2VG12T3gy?=
 =?utf-8?B?eElha3ZsUXY4VDVJeVh1eDZ2bXVvM0k5Nkhvd3ZDSFZrdk9RM2JpTEFpUzlT?=
 =?utf-8?B?QVgwU0JCenhPR01NbEt2ellvWklKMkZVeUNFbnpZN2tPT2NXL2FoYjh2TFZU?=
 =?utf-8?B?Z1RTczVQSWxsMkZ4MWFmYzZvZ0NKL01sZ3FxSmhxYVh1c25McmxPaURxRGl3?=
 =?utf-8?B?a3ZNV24rMlpSV3Jub1RHbGNLUkluajU5MW5HQk1majdQa3lGZ05LQ3hhS2Rk?=
 =?utf-8?B?M2NkRlFPVEVxamIxQnFsWWFkZXNTV2hQUitjMGtsUmdMMzRuc2xENGN5bjVz?=
 =?utf-8?B?ekdhTDNzbGlJUlhrTkpOUGFvYmdZMU5FaldXQzVkZEkrdElHR3g2NEJQRzN5?=
 =?utf-8?B?UC9SRjFNcm80T1IyeEVpcTJMVDQ0ZEJXVlJCV1BuczFvWUZlQzdLQkloZlR0?=
 =?utf-8?B?VVNNbjNIRHNQYVFHT2FrZWZpTjRCYXgrMFlyMWE1ZUJab29SWjE3RXBsaGdn?=
 =?utf-8?B?Yk1yOUVBV2Y2RGRaQ01Ed0kzMHFhK3JvbG5obm9UR1YwaVhhck5RWEFnMzdZ?=
 =?utf-8?B?OVNJeU5iRmYwS3dVMlVlRm5yODJkYUdmZVdxZXl5cG8wK291RzZaWW5TcmlH?=
 =?utf-8?B?QVBsVVRIUmVKL3VLZHVxVTAvTjNiQzdaSnNnQTZMSEhwaWhNUXRVdDkxNmpT?=
 =?utf-8?B?TnR0ZG93VXJQcHMwMXBPQ2J4YjllWHNYYjR5N2dTUk5UUDhxSEhzc0pUc0RW?=
 =?utf-8?B?ekJZT0hXLy9GSmFKTDMxb3JJVmJQdllrQ1J1Y01md3cvZVoxSW1mTGlVZDNk?=
 =?utf-8?B?SHlQZkJIdVdaRHJpRDB3MWNPa21jM0p1ajB3NHEvQzBUWUgvMkQvTEpDc0Ex?=
 =?utf-8?B?QkpaR2EvaEM1SStnTy8wQ0tMNDluMWlxNDl5MnViZndDNC9ZVFpjVTFCVHBr?=
 =?utf-8?B?K0xjN2F6Ti9pT0lsaWdTV3YyVVl3bTZpK01CaitZR28zV1REb2dHcm1rQksr?=
 =?utf-8?B?RUJzcW9IT2Zja1dkYVN1TStibEtWUlBIdUtaZzhZL05YN1RtWGZZSDcydUdO?=
 =?utf-8?B?amVFeFg4dkplVUZwbndVR05XbTkyYlRrcWY3VmkyeTZ0MlNKNGRvZGJvbTdr?=
 =?utf-8?B?NGJCMzloRXUxZkhoY1RsUm0xQW9OVUpVY0pyYlgvWG92bzhESUV3dFFUaElT?=
 =?utf-8?B?RTJXaDIrUllwWnA2Ymx2VWNmNWN0YXIrU0d6UEFMWTdEMDh3a0o0R0FaVDIv?=
 =?utf-8?B?TUpQOWd1Y3p3T1UxV0FHOCtYMjl2bGx0L0xyQnhHR2d4aW9GbVQzYkNvNVMx?=
 =?utf-8?B?WlZHSmliek5rdDd0bTE2dTN2bG5mOXpTYjRYcFpOd1VlNmxtdHlyTGI3ZklN?=
 =?utf-8?B?VEVIdUYvU1JjeWQ0U2hXUTN1MEozeVdMVWNtVlZueGNQUUVkYy9XZExZeGN6?=
 =?utf-8?B?MEg4TDlZQ3NIUmp5b0NVY3F3YTBKazZ1WDV3ZFVKdittMkQyTmZrR3hJSWQv?=
 =?utf-8?B?WFJIcm92b1Jwc3hOODRxb0U1M0labmcweXVWYmhCUnU3TXkwcXlIVHVFZ2hR?=
 =?utf-8?Q?nA7BQT?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MFJuR2oxS1R4ZEwvNjRBUDVtNzJteDNYa1NhR29xTXhzQzZUTmFPSUU3MXZv?=
 =?utf-8?B?YnZzY3FvclFMdlozM2tiTWsyZXBXS0owU05VM0JGMzVHWVZNRlhqZTk3VWc1?=
 =?utf-8?B?OTg4SlVHZDJHaSs2aUpsMFVRTXl4ckVjRkZVb0VvaGoxQ01RYytvRXlLbWEr?=
 =?utf-8?B?NFJpTTlKVGtuVmdIK1Q3VTBIZzZOUWRJc1NNc0w4YUVHSiswWG54Q3ZVemxQ?=
 =?utf-8?B?Vmp2dWNnTlZKUExCTzNyVmFNZ05kRHJsS3daODBkcVE5dlIxMHlOcFNON3dE?=
 =?utf-8?B?Z21FUEVmTENJMDM2UGZUR2E5UDdYck1BNjdiZzhRVzYrd3NJbmw3dlYxNy9D?=
 =?utf-8?B?RmYzejgyTkJzUW5jbEhvMllXNXozeXNkZDVFdFVFZXhtZURGSFJsSDFTOUk3?=
 =?utf-8?B?cURLeFRRakRxaUR6NUFQQlNOWXZ5WElRQk0yeGl6TThzM1FxVDFKU0pMSHZz?=
 =?utf-8?B?QlpVSHZzZGZnd05ycGxldkdaZUtnRGs4MCt1TGE4SjBvdU5tYWg2bzE5N0M3?=
 =?utf-8?B?OEI0cTNmdFBoQTVHdWdEVVZiMG9LQkJhZnlnR2xJNmJjV3Zyc2ErM1htanVY?=
 =?utf-8?B?L3ZMbFE0emxTcTlpbXhQVGF5d2NyVDg1a1p4eWVncnc3dlI1ZFB3by9JVnkv?=
 =?utf-8?B?ZDd0b3FQd2NuNWU5MzFOK1FZUHlvSGFrMlBudXU3N3lkNTErVFV6YUhMU2Zm?=
 =?utf-8?B?U1VvN1lzNjRFZ001emNUNDFyYlVWMm9xQnFtSzl6amxBWEFPMGtqek1nM0tZ?=
 =?utf-8?B?Qk9tZXJzL2p6WlN2QU1lVEQ3YU91L21ja3p4QVU3STJCSHRoTHJtV3ZhMXAv?=
 =?utf-8?B?NWc0Rzg5OEJYeDQrWUxJdW5TRUpteUJtelp4N21uMmgxN213V0c3L0xYWEtY?=
 =?utf-8?B?ZHY2Wk1jYjV0Yy9CdG1Ic1dIR0ZneG1hYlp2MjFXUzdDYlkrQW15K3dOTS9H?=
 =?utf-8?B?UDRqYnE4R2RLR1dseVJMQ3o3KzdJL0x5WW5vaGkyd1N1RlJmamo1TWxzN0x2?=
 =?utf-8?B?YVhua0RVdTJiVjdXWUVxejAzQXRVSEFlMGxOK2xmQmxySEdPelRZU1BSNzNl?=
 =?utf-8?B?bU1kWnl4cGQ2VUkrbEY1ejk2T0g5OUJUNUdoNlRSc2VhNGlsZmVlU2Y1c3lR?=
 =?utf-8?B?Y2pkNGRNYk00TkdLQjlhdTd1TDk2V2Z1by9JM3pWWDFKVVdjNm1keUh2Mkc0?=
 =?utf-8?B?Vy9EVDEvcGVtMzRWNmVuQUhQUC90eG5FVXpzUldYNmJHV3pjMWk4dlNMd0hk?=
 =?utf-8?B?OS9oVFpiK0Z6ZWxCSU5vL2NVbDJLQy9WM0psNlVLazhBV25OTm1mbGF1YTJi?=
 =?utf-8?B?aHZLUTNBK3QyV2NndGxKb0xNR2F6UTBLSGplMVl3UkplZlN1NE92SW51aCtF?=
 =?utf-8?B?cWxRN1YzWnBjNDRwOTZiSi85Y3ordGJya3RDVXM4MFF6WGp4Ti9teXRhMWoy?=
 =?utf-8?B?aFNxYmlTRnU1SDh0K3NvMTVSdWRWVHNnaDd4eTRLMjA4eElQUzNGZE92RllN?=
 =?utf-8?B?Nys3Nk5jVnlmaWs1Zm5NRnUxR2lGb2NIZ1FtemdCNTAwb3RTa29xV0xVTTZ6?=
 =?utf-8?B?R3NnbzU1cXdIRFRUc3I1ZUl0REk4Q3JGSG4vM0dzTm5jZ0didXlFWGhBOG5y?=
 =?utf-8?B?WlJvb1NCZDdZc0lBYmlpeiswREc1MUo0VU8rWVpSWENQZmpEck1oOUt3Smth?=
 =?utf-8?B?SUpVUVFqTGdWU1RtTzROOThvZ1c5aEQ0UWJBL1pIWmNLL2VrTXhCOG9lTHFE?=
 =?utf-8?B?K21ubUhqWDVWZlFEV3hpcVNsNm13YS9Fb2pGaTJhNnRBU3ZLK3ZKczUrOWpG?=
 =?utf-8?B?MTJQVHA4dXM1ZzgwUG9PUWh5YmJYNjc2OHY3V0xPL3A1anhDcGtEZ2ZOZzFw?=
 =?utf-8?B?eXE0T1dRaGs4eDRxUkFLQUdmZjF4TC8vb3VqVG4vTGtFcXpES2hPNVFWK2h3?=
 =?utf-8?B?Ri9hQmlTRSszakFDWjZVNHROUkdGSjlRK2RlUms0eks4RmpKbGtZbmdiZjJP?=
 =?utf-8?B?ck5YZVlvb0gvMHNOaGVXZmlnTExVbmlNZHN0eXJrKzNVV0MvUEZkNng2WVkx?=
 =?utf-8?B?ajNGUlU5aW1DTDZhYnYzaUNBNE5qeFJCRkpFL0VaaGhVN1JvVGhtSXgyOVd4?=
 =?utf-8?B?Y0Rycnp0eEJaY0xTdEVqZUhYSWJ3aitMdVBZZ2RhNDBLWUs3MHJiNWNiM3li?=
 =?utf-8?B?azRWNU5SdThhOEJ6dWpwS09kYngxbitkS2JBWnU5TVpQanZ0UTR1dGhQZGxF?=
 =?utf-8?B?MnJoOEpOYUFaVE1oSnoxcnNGMzdSbkkxYnAwQ0hCZFNOdSs5U0Z6R1RSUGdR?=
 =?utf-8?B?TGJxR293dlJxdDV5VnZkNDFVd2pxbVhSVkcvM2RGM3pJWm1MY0RHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B144E08F52119A4AA78F9442B3ED05C2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae6e0692-3be6-470f-2850-08de48b3c1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 21:30:01.7972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 k1DQTgZqGCDxk+pPhpQTzpfqk9mrShNsRgtkpGup74dFdC+yI2V7YwVXMk98iIog96Vkyy1MBb0QvMOxV3EmpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
Message-ID-Hash: A4DUSWWBN4TUHCFVHNIUCZQ6JBQZ5X7T
X-Message-ID-Hash: A4DUSWWBN4TUHCFVHNIUCZQ6JBQZ5X7T
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A4DUSWWBN4TUHCFVHNIUCZQ6JBQZ5X7T/>
Archived-At: 
 <https://lore.freedesktop.org/707f5d20ae40b2eabf0820967fefbe84822fa956.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVGh1LCAyMDI1LTEyLTE4IGF0IDIxOjU5ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gU28gYEZ3c2VjRmlybXdhcmVgIGNvdWxkIGhhdmUgYW4gb3B0aW9uYWwgbWVtYmVyIHRo
YXQgY29udGFpbnMgYm90aCB0aGUNCj4gZ2VuZXJpYyBib290bG9hZGVyIGFuZCB0aGUgYEJvb3Rs
b2FkZXJEbWVtRGVzY1YyYCBjb3JyZXNwb25kaW5nIHRvIGl0Lg0KPiBJZiB0aGF0IG9wdGlvbmFs
IG1lbWJlciBpcyBgU29tZWAsIHRoZW4gaXQgcmV0dXJucyB0aGUgYEZhbGNvbkxvYWRUYXJnZXRg
cw0KPiBjb3JyZXNwb25kaW5nIHRvIHRoZSBnZW5lcmljIGJvb3Rsb2FkZXIuIE90aGVyd2lzZSwg
aXQgYmVoYXZlcyBhcw0KPiBiZWZvcmUuDQoNClVuZm9ydHVuYXRlbHksIHRoaXMgd29uJ3Qgd29y
ayBiZWNhdXNlIHRoZSBCb290bG9hZGVyRG1lbURlc2NWMigpIGRlcGVuZHMgb24gcHJvcGVydGll
cyBvZiB0aGUNCkZ3c2VjRmlybXdhcmUsIGkuZS4gaXQgaXMgc2VsZi1yZWZlcmVudGlhbC4gwqAN
Cg0KU28gSSB0cmllZCB0aGlzOg0KDQpwdWIoY3JhdGUpIHN0cnVjdCBHZW5lcmljQm9vdGxvYWRl
ciB7DQogICAgcHViIGRlc2M6IEJvb3Rsb2FkZXJEZXNjLA0KICAgIHB1YiBkZXNjMjogQm9vdGxv
YWRlckRtZW1EZXNjVjIsICAgPC0tLSBuZXcgZmllbGQNCiAgICBwdWIgdWNvZGU6IFZlYzx1OCwg
a2VybmVsOjphbGxvYzo6YWxsb2NhdG9yOjpLbWFsbG9jPiwNCn0NCg0KYW5kIHdlIGFscmVhZHkg
aGF2ZSB0aGlzOg0KDQpwdWIoY3JhdGUpIHN0cnVjdCBGd3NlY0Zpcm13YXJlIHsNCiAgICAvLy8g
RGVzY3JpcHRvciBvZiB0aGUgZmlybXdhcmUuDQogICAgZGVzYzogRmFsY29uVUNvZGVEZXNjLA0K
ICAgIC8vLyBHUFUtYWNjZXNzaWJsZSBETUEgb2JqZWN0IGNvbnRhaW5pbmcgdGhlIGZpcm13YXJl
Lg0KICAgIHVjb2RlOiBGaXJtd2FyZURtYU9iamVjdDxTZWxmLCBTaWduZWQ+LA0KICAgIC8vLyBH
ZW5lcmljIGJvb3Rsb2FkZXINCiAgICBnZW5fYm9vdGxvYWRlcjogT3B0aW9uPEdlbmVyaWNCb290
bG9hZGVyPiwNCn0NCg0KU28gaW4gdGhlIGNvbnN0cnVjdG9yIGZvciBGd3NlY0Zpcm13YXJlLCBJ
IHRyaWVkIHRvIGRvIHRoaXM6DQoNCiAgICAgICAgICAgICAgICBsZXQgaW1lbV9zZWMgPSBzZWxm
LmltZW1fc2VjX2xvYWRfcGFyYW1zKCk7DQogICAgICAgICAgICAgICAgbGV0IGltZW1fbnMgPSBz
ZWxmLmltZW1fbnNfbG9hZF9wYXJhbXMoKS5va19vcihFSU5WQUwpPzsNCiAgICAgICAgICAgICAg
ICBsZXQgZG1lbSA9IHNlbGYuZG1lbV9sb2FkX3BhcmFtcygpOw0KDQogICAgICAgICAgICAgICAg
Ly8gVGhpcyBzdHJ1Y3R1cmUgdGVsbHMgdGhlIGdlbmVyaWMgYm9vdGxvYWRlciB3aGVyZSB0byBm
aW5kIHRoZQ0KICAgICAgICAgICAgICAgIC8vIEZXU0VDIGltYWdlLg0KICAgICAgICAgICAgICAg
IGxldCBkZXNjMiA9IEJvb3Rsb2FkZXJEbWVtRGVzY1YyIHsNCiAgICAgICAgICAgICAgICAgICAg
cmVzZXJ2ZWQ6IFswOyA0XSwNCiAgICAgICAgICAgICAgICAgICAgc2lnbmF0dXJlOiBbMDsgNF0s
DQogICAgICAgICAgICAgICAgICAgIGN0eF9kbWE6IDQsIC8vIEZBTENPTl9ETUFJRFhfUEhZU19T
WVNfTkNPSA0KICAgICAgICAgICAgICAgICAgICBjb2RlX2RtYV9iYXNlOiB1Y29kZV9kbWEuMC5k
bWFfaGFuZGxlKCksDQogICAgICAgICAgICAgICAgICAgIG5vbl9zZWNfY29kZV9vZmY6IGltZW1f
bnMuZHN0X3N0YXJ0LA0KICAgICAgICAgICAgICAgICAgICBub25fc2VjX2NvZGVfc2l6ZTogaW1l
bV9ucy5sZW4sDQogICAgICAgICAgICAgICAgICAgIHNlY19jb2RlX29mZjogaW1lbV9zZWMuZHN0
X3N0YXJ0LA0KICAgICAgICAgICAgICAgICAgICBzZWNfY29kZV9zaXplOiBpbWVtX3NlYy5sZW4s
DQogICAgICAgICAgICAgICAgICAgIGNvZGVfZW50cnlfcG9pbnQ6IDAsDQogICAgICAgICAgICAg
ICAgICAgIGRhdGFfZG1hX2Jhc2U6IGZ3LmRtYV9oYW5kbGUoKSArIHU2NDo6ZnJvbShkbWVtLnNy
Y19zdGFydCksDQogICAgICAgICAgICAgICAgICAgIGRhdGFfc2l6ZTogZG1lbS5sZW4sDQogICAg
ICAgICAgICAgICAgICAgIGFyZ2M6IDAsDQogICAgICAgICAgICAgICAgICAgIGFyZ3Y6IDAsDQog
ICAgICAgICAgICAgICAgfTsNCg0KVGhpcyBvYnZpb3VzbHkgZG9lc24ndCB3b3JrIGJlY2F1c2Ug
YHNlbGZgIGRvZXNuJ3QgZXhpc3QgaXQuICBJdCBpcyB0aGUgb3V0cHV0IG9mIHRoZSBjb250cnVj
dG9yDQooRndzZWNGaXJtd2FyZTo6bmV3KCkpLCBzbyBJIGNhbid0IHVzZSBpdCBpbiB0aGUgY29u
c3RydWN0b3IuICBUaGUgc2VsZi5pbWVtX3NlY19sb2FkX3BhcmFtcygpLCBldGMNCmZ1bmN0aW9u
cyBhbGwgZGVwZW5kIG9uIHdoZXRoZXIgaXQncyBhIHYyIG9yIGEgdjMgZGVzY3JpcHRvciAobG9j
YWwgdmFyaWFibGUgYGRlc2NgIGluIDo6bmV3KCkpLiAgSQ0Kd291bGQgbmVlZCB0byBkaXNtYW50
bGUgYWxsIHRoYXQgY29kZSBhbmQgbWFudWFsbHkgcmUtaW1wbGVtZW50IGl0IGluIHRoaXMgY29u
c3RydWN0b3IuICBUaGUgdHJ1dGgNCm9mIHRoZSBtYXR0ZXIgaXMgdGhhdCB0aGUgQm9vdGxvYWRl
ckRtZW1EZXNjVjIgb2JqZWN0IG5lZWRzIHRvIGJlIGJ1aWx0ICphZnRlciogdGhlIEZ3c2VjRmly
bXdhcmUNCm9iamVjdCBleGlzdHMsIGJlY2F1c2UgaXQgcmVmZXJlbmNlcyBzZXZlcmFsIGZpZWxk
cyBpbnNpZGUgRndzZWNGaXJtd2FyZSBkZXNjcmlwdG9yLCB3aGljaCBjb3VsZA0KdGVjaG5pY2Fs
bHkgYmUgZWl0aGVyIGEgdjIgb3IgYSB2My4NCg0KTm93IEkgY291bGQgYXNzdW1lIHRoYXQgaXQn
cyBhbHdheXMgYSB2MiBkZXNjcmlwdG9yLCBidXQgdGhhdCB3b3VsZCBqdXN0IGlnbm9yZSB0aGUg
ZW50aXJlDQppbmZyYXN0cnVjdHVyZSB3ZSBjcmVhdGVkIHRvIHN1cHBvcnQgYm90aCB2ZXJzaW9u
cyB0cmFuc3BhcmVudGx5Lg0KDQpJIHdpbGwgcG9zdCBhIHY1IHRoYXQgaGFzIG9ubHkgeW91ciBt
aW5vciBzdWdnZXN0aW9ucy4gIEkgcmVjb21tZW5kIHRoYXQgd2UgY29sbGFib3JhdGUgb2ZmbGlu
ZSB0bw0KaW1wbGVtZW50IHRoZSBtYWpvciBvbmVzLCBpZiB5b3Ugc3RpbGwgZmVlbCB0aGV5IGFy
ZSBuZWNlc3NhcnkuICBIb3dldmVyLCBJIHdvdWxkIHByZWZlciB0aGF0IHdlDQppbXBsZW1lbnQg
dGhlbSBhcyBmb2xsb3ctb24gcGF0Y2hlcywgaW4gb3JkZXIgdG8gaGF2ZSBUdXJpbmcgc3VwcG9y
dCBtYWtlIHRoZSA2LjIwLXJjNiBkZWFkbGluZS4NCg0K
