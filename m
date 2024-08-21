Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D195A341
	for <lists+nouveau@lfdr.de>; Wed, 21 Aug 2024 18:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B338A10E66C;
	Wed, 21 Aug 2024 16:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e1LM/ziK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CC510E66C
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 16:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgWwgrA9u/TmLhKQX28stkatEmyL3/1f+cnHnahQzoq748Puws0qGXRL2IVFC8uYuPeE0tk362szEA9e0k6hHL5qR/sO4UVJfIAvrQDZ3K7ST1O74YmNlpMN1O9Slzk4GQhyrwujzLSj/t5WhlX8TX5i/MyOHAu/zfDv2ZjVeK43ip3dARxVhhS0qtswQMzfnI9Abxo7zsqKqviUjEBZ08nUeuakXamz8quo6hlFNub+o0wAjnF2qx856U2nTr8PEs+m5xI23c5qsgF8xn+3wONHBms5Jmzv3q0EL2jtMDklPIm18ZxhxqP9Xkav0n+7UruPyKaEvoOFQhoqwMSAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulu7mCyADaBxhof5RWlPBJMyJ76BivWiHqV6MiurjKc=;
 b=r3xi4aIjHniAlQBp5U97pyY/dJyfWXIw1BzbeG3G6THANX0lKZXEdTDtnza46KTRlj+9iV9E5PH5WAFzwEq97uadxZxGsMnqLRC9yyododJrOAKIQz9MkwlzQoSKSGLYIG6oAaXAW7nxpmSZRbNGJotyCGnvifdv4Pqy+9tb9fVsyz59KuhBeno+wHR3I4pGgkI8b8yMg4imVHMd1PZ8yFYQEBFGNGqQVLsBcoc2CCyBAZs+TzrKhCMQXtkbzms4a7TphYJ8TpsZlaVxzQvpy37CILIDo+7gPFP3T8uo+dhremdl5l6alSTm6eJa1MLtWrSpX4n/8A5L4U/YGCd1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulu7mCyADaBxhof5RWlPBJMyJ76BivWiHqV6MiurjKc=;
 b=e1LM/ziKrLgN8VM7HbyMgu3dYSrGqxpwQslux36FTdEE1RK+8I2b33DVBBoYFyIMKXf9WwhwDBh6Ljc1otX1rw4Vecu1eGwnPC9/d4ohSL+TzuUAxEbaqLLDtYAAFJpLN6YK73sdlGWAU8kEtTqPkrwmPbKDX4hobzOKvKfFTs4DE0jQhs1rWTTIPluUu0uqIRMUOj2QmzHdgTq/up7KYQzZLeKU0ii7rgzRCkJ8iazdsLpK5nDs+stNDe2LH/pW4LpVXQl+3RIi0fSwn36rlM+smgiy0AE8LEJObRx1NVsFo/araM6XK0UnlMcYN9C+vx2pvnGyf4GeTmd9ova64Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 16:56:41 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 16:56:41 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "agents@meddatainc.com" <agents@meddatainc.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: Possible nouveau driver problem?
Thread-Topic: Possible nouveau driver problem?
Thread-Index: AQHa73NpvGTC/2+IvEKmMlnDtpV0HrIr2/qAgAXhcoCAADndgA==
Date: Wed, 21 Aug 2024 16:56:41 +0000
Message-ID: <1c7ec6c85968cfa8c2a68997b1cb203c2fa18d28.camel@nvidia.com>
References: <E2CB6BBD-35B1-4359-99F7-BBB0A6E6CA7A@meddatainc.com>
 <B2AE2FA5-1D8A-4359-B0D8-F5EC9828A2C9@meddatainc.com>
 <26AD7741-0AA8-4C79-89B8-57C206C634F1@meddatainc.com>
In-Reply-To: <26AD7741-0AA8-4C79-89B8-57C206C634F1@meddatainc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN2PR12MB4174:EE_
x-ms-office365-filtering-correlation-id: 009f5c70-1d93-43f4-658a-08dcc2023afe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eS9LT1dHZnF5U2dnNXJSd3hxY3VBMkdEOHpDUHFxNU4rM3BFMzUwMEp4WFZY?=
 =?utf-8?B?VlpwdlVOT0ZXaklaZzVJaHJibDVYZDJ0MWJjUlQwd2ZZZDJsNUk0cXBIejAr?=
 =?utf-8?B?YTRKWFY2d1cyemRpTDM0bk9uTmxxUk9kdFAwMG5hUEREOThTRlBBNzErNVNy?=
 =?utf-8?B?S3JDSGpsSkYweEZNazJndVhOQVdRTENBcDBHR00zSXJmdGxtVHRwT2I4Uzcx?=
 =?utf-8?B?UVdwalJzcWw2Z1ZrOE1GRTJBRzBJY1RnZk5CUUpQUGFibUZrU3lWOHE4aXIx?=
 =?utf-8?B?b213dml3Yk5adFUzaW1BaXlKR3IrVlJVWitva3VicFdidlRGVGNiSGVPMERx?=
 =?utf-8?B?bUc3VVFEU0h1eG1sOEtRRmZPUFpHL1FvR3ZrTWpxMk5YeFRBbEMvOHZ0aThi?=
 =?utf-8?B?ZVViSjViaUtBa29ScDF2c3o2NCtmOUpZd09kMlp6TUovK084d3k1VG5MTkRR?=
 =?utf-8?B?S2NacGk3NTlzMHNLbEdmNUpIWDlsRGxBdk1SNUUrTDhRQU43Sk9jcS9sbzk0?=
 =?utf-8?B?dlZTTmtzWktzbEl0Rkh0YzBqRjF6emZzdEFqdFIzZlZ6UGF6dE5XN2xsWjJW?=
 =?utf-8?B?ZHo5QTZremVQU1ZDOGJqYlVGcGVoekJkSE1lQ09JVm05YlpsWUNLMWJSRS9F?=
 =?utf-8?B?bDN6UitDSGRISlpMS1R5Nm0vV09UVjdWc0tTUS94dXAyUmwyWXY5MTZ0K1V1?=
 =?utf-8?B?UjBGYW1FMmdxNVRsZHZGaU1Tck16RUtlZUpkZ05YQWpQWmZ6ck1zWGcvdEpR?=
 =?utf-8?B?c1pDdVkwS0lndHRlWE1RcGFrVmRBMjVtKzI5OXpHN2VBTTZvNFNyeTkvVnpZ?=
 =?utf-8?B?bkp4YUJWWHVIdEwzZGFEUGlydnpCUzVrc1J6U1MzOE9xKzFJY0Q2d1BUUzl6?=
 =?utf-8?B?L1VpVHNuRlF4TmltQ3BDZXVUMDJ6YWF5L3QrdDI0ZHN4bjdFMEhrYlQ1VWs2?=
 =?utf-8?B?TlJZQ2JNNUt1Qy9FbjFUVzEyc1Nmd2E2Y1hjZGM1NmtOdnllaEFzbk1TWnB3?=
 =?utf-8?B?MXZ4UXB3RjZuSytseGhOR0hSNElXb0RmQ3d1OFE1bFIzdGZyNmwwVzJIcm9s?=
 =?utf-8?B?bkUvbGxXZFBrQXVzU1NrbzA2dmN1d3A0b05Nb01wVDYwUVR6Szl5bnNGVnB0?=
 =?utf-8?B?eXJUWHl2RG1FTzdDajRQWUd4dFBaNU5MbSt2Sm1vaE5BMWZBRVRnTU8ydnRj?=
 =?utf-8?B?dzNGdTBic1BuRGk3ZE9kTU5ZWXlVOFdjQ1FMYVNuZU82TDdxR3FwMkhkOVpX?=
 =?utf-8?B?UUJrcHlhQmpWOGxzVEhrQjlzUjl1SVVFVW8zczZzSHM4ejA0VjlEbUZ2M3FI?=
 =?utf-8?B?bStRN0UvcjJNVmtlcFNnYXBvakJEODhwZ2lEcU52ekh5K3lSQVhBOG1xa1I3?=
 =?utf-8?B?WEYwc2loRVBkVlRGSUZUTmM5eWJneEQyWTYyU1pMRkdpOC9EYXVhc0h4SmFz?=
 =?utf-8?B?ZSt0cWFLOC9PcXRXcmd2eWxEYXVtdzFWVnhBaUQ4eUJjRU10d0JZS0s4RlZZ?=
 =?utf-8?B?TnByMkpaT0xCR2RVT0F6YnFkZ3VKN3FwRkl6aWhFN01nZ1d4ZDZBQURKMG1k?=
 =?utf-8?B?VzZEM2QxbXB0cWlzWlJTdHpKK1U4c2tYOUZoYWl1UmVGZHR4VzN6eVlueE9O?=
 =?utf-8?B?WWpwK0E5cTV5enFJOFZvMFlicDdNYVZIb3pGWk10QW9nMGY2N3N1dnE4Mjl6?=
 =?utf-8?B?b2xZV3QrV2hOajh2SURRWE1kMjhWclNCem5aS1QwdHlVblgzR05TRU1OSjAx?=
 =?utf-8?B?elZISlJ2MVVnTWdBMWZ5S3p1bTNINEEwcWEvemJma3picytId3N1MlVicTJK?=
 =?utf-8?B?YS9aV0hhNEZCZldFMk80MkZRcUxJNVRibDB6VVJjelgrcnl0U0cvUlEwMkw4?=
 =?utf-8?B?UnZnZVpLbGgxb1I1UkR4NVBqUjJtditiaGdKWU14YWI4QkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFk3bTgxeHF4T1dBeGxjU1BLNng1QTlyVXdwU2piT3dKZW56TldYd1c0SVNF?=
 =?utf-8?B?UlZBOWp0ZElIRzVSbUMxQ3BaRXYrNXRsSUdySlJ2NmU5RnBxdzdaK2FUWFBI?=
 =?utf-8?B?WmR1aDM0WnBBKzd4blBzNUJ2TzdpV1lFd2NQa2VrNUdxdmo5d2NGZ2pMTU9X?=
 =?utf-8?B?V0UybXdqNXBiMlp4RzN1V2dRZHB4azU0YzVieU1iRk9mOFk5WmdqckNWbC9o?=
 =?utf-8?B?TTZQSENySDVsR1J2YU5yTVN0bXJCK2M1b3d4dGtxaXptR1RjRkkxT3VONGZI?=
 =?utf-8?B?dWtuVXdMZFhnRGVnYk9LRnJvVmNpNFM5dllzN2Rsek5weFMxWWZ4aFFTRkpS?=
 =?utf-8?B?T3V4YnJRWjJtMDJ4TXFnWnBTUmdlYVJ4Tk9lZzFhK2llWlQxM3BqQzJXUUpa?=
 =?utf-8?B?b0MwYS9OUXhJdGNXVlN5bjk5amF0WjY3RUhJWmJSbE5GYWF0bzlmdVFtcTVn?=
 =?utf-8?B?SzFMRkpRQW9kK05GcUpGTFpwNm9hcVB0YmhlY0M4TVozYkNhM3hjNkd5Tmht?=
 =?utf-8?B?YmIzMXVLVnlycjh0RUtHWWExVUt0TnF1UFJFQ09MbUFOOWhNenBvTWw0QXhK?=
 =?utf-8?B?YkZuYUJ2NS8rcGl2SGM0MzNCMlhtOVVRYkJ0WWVocnRNMGxKTStFY1gvd0po?=
 =?utf-8?B?WnN1YW1CU1NzYjUvbmFJUkJDWFc4VmlxaXdDTlhXSVN6Q3o2bkQ3UUY3a3pj?=
 =?utf-8?B?N3c0dmJlMUR1d1R1dHhzbU9PVDEvSldsWlpvdEp3cjJsRnBJMzc5WDR6YnlL?=
 =?utf-8?B?bU1sazN4N1lmTzhIcUdRdVUySnRSQ3lIeXpjVnZSRDRNNS9jTmY2dHFHWU8z?=
 =?utf-8?B?dy8xTGt5b1J1SUJpWGdBSG5yc3psWjJrYm9kNTg4RFdNdXNvTk5JcWNRMERy?=
 =?utf-8?B?aFJYK1NZTWJYd3VDbUlJSjVoT3l6UmNSNzh4RUlPL3ZMQUxRandrTWkrd2Nn?=
 =?utf-8?B?UUVkN0hVOXV4Z1YzdFFFSVIrc0ZtSVJiRVNNYmlTSS9ZaWtFRUo3czVwNmN2?=
 =?utf-8?B?YktlMFZjMFowSmZMOStIQlIvelczbDZmWTFQcktpNlQxVnlRVTRHNnZyVlNz?=
 =?utf-8?B?cUQ5eEEwR2xoc2Q0RDZWdWtvZ1VreHZ0Q0JYbm0xUlhraU4vbktJTWhDaXBs?=
 =?utf-8?B?bjJKVGR1cVVaRVdNU1N2ekd6MDV1R2tMdS9PeXpBeXJIbWtVWTFDcHowVmJr?=
 =?utf-8?B?RmV5TTFoK0swODR4bG1Sem9LbUlpcWNxWFpib0Z3QjFsY0VGRGp6bGZSL0JQ?=
 =?utf-8?B?elc3NnR1ZVFTbVZGandKSzZUVElxNUJzcnNUdkp1UTBRUmVjSDRRMDh2Q2hC?=
 =?utf-8?B?QmZkS2Q0SWpsalNkS2xqd2RSTVZ3NlBMc0hmSHlObDlENmJTWXIrQmhsSzlk?=
 =?utf-8?B?RitGb1ZaM3IzdXY4Qzhwc1Fuazl6cmMvYXg2SEhKUXR4RHE0RTJqRWR4VWNa?=
 =?utf-8?B?aTBQSlg2QTI3NXM3QTR2RmF2MUZZRW9KVjJsQ3g2VVhkYjRXZDZhY0lqaENF?=
 =?utf-8?B?UmR4M2xnaFJhb05sc1BpcnRKcFVMek0yZjk2N2g0K2o2dW9jb1EvTGFvbjZK?=
 =?utf-8?B?dzJEdzhUTnJHejQ2SG9wMEhwd1ZET25UT09NanJLYkV5My9MMDk2ZzFMRE5x?=
 =?utf-8?B?K0tvdkJlYTBZTThUb0k5MDM5SFptbDdQN1ExUlhJTWplNVh5OW02dHg2MzYr?=
 =?utf-8?B?Rzd6TWoramQyeUVHSjhsV05HNFZlUFc5em01TDhVdmttWUh3Mlh0SzFQNXFr?=
 =?utf-8?B?ZkI5bVBsNzk0bXpjNEZWaUJFdU5CYWdhMTRXalVBbENnNStOU0dpdXdFTzdj?=
 =?utf-8?B?VnI0VVJIRHhhUEtRS0c3UnIxRENXQnFzM0k3ZUo5NThabzNvby8xY2dQVDZl?=
 =?utf-8?B?UUxzblBrWXEza2NuVU1qR2ZiOGRDekdBYmpiZFdVc2d4WXhTT3RndFNXWDIz?=
 =?utf-8?B?SGQ5NkVMRkRWanZTYnF1SFJuR21zdXpxTkpMelhQd1IyUDF2R1pYSzlUdUZB?=
 =?utf-8?B?Q0FkMDRjcHp2L0lobkU4SDBxQ2lXSnM2bFlhdm56WVNQdTdNWEpyNVJDQTY4?=
 =?utf-8?B?MWRvQVFGZ1lUR1FDV3VXQ1NkRk1COHBKbHNpZnE5SGJPNDErOWRQVEx3MWlE?=
 =?utf-8?Q?YCkBV6u+I0Y8LJtdQ1kujtZ/D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7017F86B8A3B0408EBC6B1D34EE7F4E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009f5c70-1d93-43f4-658a-08dcc2023afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2024 16:56:41.4681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zm4tfN51Yo54Z2Cs+EJ7ZO2qocyhU1FLShQNyMD0JLg4a/ujj99lXDCzbfPAhDufAUe4VlfIY6GZzkTw9YoMkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI0LTA4LTIxIGF0IDA5OjI5IC0wNDAwLCBIIHdyb3RlOg0KPiBJIGhhdmUgbm90
IHNlZW4gYW55b25lIGNvbW1lbnQgb24gbXkgcG9zdGluZyBiZWxvdy4gSWYgdGhpcyBpcyBub3Qg
dGhlDQo+IGFwcHJvcHJpYXRlIGZvcnVtIHRvIHJhaXNlIGEgcG90ZW50aWFsIGJ1Zywgd2hlcmUg
c2hvdWxkIEkgcmFpc2UgaXQ/DQoNCldpdGggeW91ciBMaW51eCBkaXN0cmlidXRpb24gdmVuZG9y
LCB3aGljaCBpbiB0aGlzIGNhc2UgaXMgUm9ja3kgTGludXguICBGaWxlDQphIGJ1ZyByZXBvcnQg
d2l0aCB0aGVtLg0KDQpUaGlzIGZvcnVtIGlzIG1vc3RseSBmb3IgcHJvZ3JhbW1lcnMgZGlzY3Vz
c2luZyBkZXZlbG9wbWVudCBvZiB0aGUgTm91dmVhdQ0KZHJpdmVyLiAgWW91ciBwb3N0IGRvZXNu
J3QgcHJvdmlkZSBhbnl3aGVyZSBuZWFyIGVub3VnaCBpbmZvcm1hdGlvbiB0byBwcm92aWRlDQp0
aGUgYWQtaG9jIGRlYnVnZ2luZyB0aGF0IHlvdSB3YW50Lg0KDQpJZiB5b3Ugd2VyZSB0byB0cmFj
ZSB0aGUgY29kZSBwYXRocyB0aHJvdWdoIE5vdXZlYXUgd2hlcmUgdGhlIHByb2JsZW1zIG9jY3Vy
cywNCmhlbHBpbmcgbmFycm93IGRvd24gd2hhdCBmdW5jdGlvbnMgaW4gdGhlIGRyaXZlciBhcmUg
dGhlIGN1bHByaXQsIHRoZW4gKm1heWJlKg0Kc29tZW9uZSBoZXJlIG1pZ2h0IGJlIGFibGUgdG8g
aGVscC4NCg0K
