Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B4ADD644
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 18:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1C610E719;
	Tue, 17 Jun 2025 16:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jtLU4xL1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0976710E41F
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 16:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8sD66r5iDPpVHCV08DqTltobOZdAK/AZP+0QqFHPri9FhhR0qa4RDYHbrpq4UC1kw9o9Se+1AzwhIyZxyrGwO0hjtMoixBYCNeNV6HxxyVmf2JiOw5K+EmdHv298iFt3xic05xkz+iIHKxblj0xebjj+0CltEJ89olbcVnCJI2uLho0D9/gip3eCkBvuxMpBqKO7YtbDrd/6zC0zUlzcsvUM7ZxU9a4IhgvQwwdokufCgAjHjtQkodOPjjtvlM57L87Usth/13TrdpJQwjVPqQUHAQSQ8prSIXSseAcnWlssfqpcqb/UaHFma6aDB3RBu9HnOlB8jbigpVmecnnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE3XkCxRYEbX8wKQ3OZ1g85wyWIhGsSMarjSBi0vGyE=;
 b=Vfvc+mJg/j59VU2ZI2Y0SPQNO4rNvOttY2EUVfqxMyJFtVXuCHQsvgDXOgpiRDD8YcQAPPCMMfQ8wZAcdTb9gkI29sOZjv7At6KnY/XavtxG0CfH74VWMAMwI+dsOMmLInktTxTXtxCh02201uOY79wCccv8W47aXkJvCnL3gm/DoKvfv8srGikdCve++QtNJKFDhwucyrPmdn3i1W90p8qGP74ANUDUgiACnhxp8Ekw8dnrVx2e486eRHmESm/o53AuVDD9JZbcFlZFP/3VuoCwU0pRWsNvyjNSe0wo4Fd9fQ114HDPNOjGHP9/ykbfC5b4zwC6dLUKiNaevwtLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE3XkCxRYEbX8wKQ3OZ1g85wyWIhGsSMarjSBi0vGyE=;
 b=jtLU4xL1Zq0m6/RlLjcMgtBx+t/ghw3rrBxmT+CvaNboY2J+6Iw8XV6lz/Mb3DjwZTw7LNM1jAaE1Fleuc/JN5G4dXXWexrTVqXCmAZvZx/jVMT6Z8xJJXxqnmiutBlkyXdiyUz9BKBQlgfZZBoJxfUWpohvY1T0Y6wAbaTzZxBN7O2IqPr5enp0FQaLmyhuqR58UWrnuKlym09rWDhnBOs13dRfOwCtB19P175zo/bTPTvAEUXnZpRurGDzEVfzNNxt9mWiA6hb0D8BpW6VXieQjMmenK6d4FPrm/dpZ1+M9+4QDkiSVECuRus6j45L4qRvXzqnf2N9cGIC+IQWnQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH2PR12MB9541.namprd12.prod.outlook.com (2603:10b6:610:27e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 16:31:31 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 16:31:31 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>, "mhenning@darkrefraction.com"
 <mhenning@darkrefraction.com>
CC: "kherbst@redhat.com" <kherbst@redhat.com>, "lyude@redhat.com"
 <lyude@redhat.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Subject: Re: Set DRM_NOUVEAU_GSP_DEFAULT to default y ?
Thread-Topic: Set DRM_NOUVEAU_GSP_DEFAULT to default y ?
Thread-Index: AQHb3u5dUTpnSiZ11U+xUqutQr+CYrQGvW4AgADPRAA=
Date: Tue, 17 Jun 2025 16:31:31 +0000
Message-ID: <20e965c8a3021f052b15ad4d1626b811391b96be.camel@nvidia.com>
References: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
 <5a742cb7-1b06-4e84-8de1-9dbe03f99250@nvidia.com>
In-Reply-To: <5a742cb7-1b06-4e84-8de1-9dbe03f99250@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH2PR12MB9541:EE_
x-ms-office365-filtering-correlation-id: 5d522220-78d2-4610-2bb7-08ddadbc6ac4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NTd6SFFxK3JsWlZLcUlGUHdUdXpscmNteHFmSFdaREJHMHdENmJRT1BOQytw?=
 =?utf-8?B?djVqalNRZlFwTm9UZngyVTVMb1F0T1NUNnQ2aDFFNnZZRXZKKzJGTXg3Sk8y?=
 =?utf-8?B?SE5mZGFvdlUxYmNwRmsrS1JJUUUybG9HVjByU05sdFBiWGtVRkFkUEs5M3Ri?=
 =?utf-8?B?Q240KzlYR25kUzVyY3pJbmJhSlN1MGdjRkZnSDE2cUNwa3I3b011cVZJSG0z?=
 =?utf-8?B?cjVsTytaLytGbDF5d0xCK3ErNEp6T1ZrS3d3MHN3R0lhODk1OFRoT1FpWTRG?=
 =?utf-8?B?SjAySFVKRForakVxZ2Q3NllBazRKZnhRMy9LclJBeTAwdnZFNFNSOFNrSlpD?=
 =?utf-8?B?clF0b2RVRzIxM05VTmNwMlFtRFlkUFZyeVljSk0xNnJkZ1ZMUEFsTUdreHlz?=
 =?utf-8?B?L1JLZThHRzhrQWFxMzJKemdDL2k2S1VFV2dEVDZjTitsWXQwQ0lRYjFyQVdE?=
 =?utf-8?B?allUbnlkY1dWQWxEZmNyNXF5WUJXTEQ2VS95L0o5ZEZUTnVCWUhkdHdRYi9i?=
 =?utf-8?B?ZjI1aGtDN3JWbXZiRTA5cTUxOFd6RUt1UEU1QVN3bFk2ZVgrODByQnFLNk5O?=
 =?utf-8?B?Z0ZmTjlIZ3MrdlhSN0xWUXZzVmh1bGxZbVIyQm1UODlNUFJLVzh1RC96VjZW?=
 =?utf-8?B?QXpzc1BuY2g5bmVqb1F0Nnd1SkVlNmg3cnJOVzdoaXlQNWdUMHVDMi9IbGp4?=
 =?utf-8?B?eU5BMzZrNXpYOUVrK0xTcVVVQ2NYVFNkRndwSHdENE8ydGVmY0JVbVVRTEpR?=
 =?utf-8?B?aDJNWUlCb2ZEQ2dpcHlxV01tZ1ZEa0VPeDIrWGZmOVhUMnhVQytJTWtLZkZV?=
 =?utf-8?B?aDdxZFllaHFuaUoxUW5iQVRzaVVqY2gvbmdKTlgrUHQyQTc4YVNpSEhJSElV?=
 =?utf-8?B?aDVJZGMya2NpVWJ0RmcrYlBUeWN4SlREMENpLy9xSThmMytSQkN1aGxpM3Fm?=
 =?utf-8?B?N1FDeSt6bmlFdkZwcG12bTZMc1plbktyT051V1h3SUJuelgvRklVZ1lUVll5?=
 =?utf-8?B?RE00eHVuczhpNUlUaGVveXlLckFPbmt0MEdsWEsvNDFpVkxrR28xakJVcnp6?=
 =?utf-8?B?eWNPZVFaRm5GejhVbDBVNTlKdE5NYmZQSDY1d0lpMVJFYlJFa3VUaUt5bXhT?=
 =?utf-8?B?RHBoQmhsSW40OGx5NW9FSDdiMlp2bmhpc3UrUnMxZkRBVGJ0Mkp6SThZb0dP?=
 =?utf-8?B?RDRhbEwyY0dSenlDUllvOGNoOXJqSUtIQ3VKUHlpSUpabWFRU2NzWCtNNXFE?=
 =?utf-8?B?bWVTSmRGSXovQjdLTHNMTG0rdkFheTRxSjBpd3FsamNPWEJwUDVDcGorVGhy?=
 =?utf-8?B?a3JjT2JvTFNnOFk0OUZHcUJ5Tmkwc2E3ejlFV1ArcVRRU0VrK2ttdzNtUkRu?=
 =?utf-8?B?RUh5Q3hxNzdUYUlPMEVxK1lzclpNRWg3cXZIdWFBc3Rpd013b0U1Z0pWTGR3?=
 =?utf-8?B?VXN6bUFmbjB1MlBTMGNtbHloTHEyaHZtREZGY1k5Njl3TEl5UGxrdk02RDFD?=
 =?utf-8?B?WUJySnJLckJiNFFrT01PU2p4eVoxLzJ4cXJiT0xmcHlUYkJPUmtRcGUwc2d5?=
 =?utf-8?B?dmhMQzgxanFYUzdzMUNZODRzQ3NiR28zRUZlTnJJS0tKWVNKQ1o0ZlBVOVdI?=
 =?utf-8?B?ZHd5WmgxbGdJYlRxSW9OcTVDSnJROTFRbE1YZ3hIaHptK2pxaUZieUhlOWFR?=
 =?utf-8?B?eDFNTEtmblk3Q1JSbWpXbmhyaFkvK1U0T3pjRUkvWWxEWFlsdFA3ait2VmNW?=
 =?utf-8?B?czRpL3hoUEpqMW43cVArMkVUaGIrQUo4SHlqQWxsVUJpeVlmNFdCeG0xQ1hz?=
 =?utf-8?B?T1RmYWZET3lkeXkzS3I1UXVQWVF5aEhPY3lkVFhweUpYTzR4ZXJSYm1aSldL?=
 =?utf-8?B?WllST1owalVQTFBIblpyK2pLS2pHSnk5b0Q4Wi8zTU5GcGNkbXVlWlBJOVZ6?=
 =?utf-8?B?R0FFZWZrU21zd0JaMEpRWnM1VG0xeXM3aFhnTXltSUtnWG80YXFPQ2VGbS9I?=
 =?utf-8?Q?VX+zkjPWHmZaD+3C5axoitOvR4Vdq8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUxRNEtHZk9naGNaRitSRnY1WVNML3YrOFZiUGZSZ1dXcWVKR1dXMHlqZXNz?=
 =?utf-8?B?TldyRjJYTVphNHgwWENPRjRUSEIzREtjTmxsZU1HeDZTcGdUZEZWOVpOcERy?=
 =?utf-8?B?bEJFcFBpRjM1bFd6cERjS0ZRWjV4ejZqSnlrV3RwNGJaZ2NhU2RXYXdvSkhH?=
 =?utf-8?B?T1hxeEdiVFNGUlVNRGRpZ1VqRzZraDlPNktWdnNmVzN4azQ2MVAwaWYwN1BV?=
 =?utf-8?B?RDlURzk5cVFIOStNMUZRY3pzYTZpVGk2NlBZaXZMTGpDRVhWQWR4ZU9CWS84?=
 =?utf-8?B?N2g0cnpUQWtheUhMM2s5bUl0TkZVNXpGekppN1lodzQ2eTJnMmNsSEI2dGFO?=
 =?utf-8?B?U3lMUkVEVnM1bnZZR3FJVE8rcTFkZENmUkhqNlZtLzFVVms3TUx2eHd3YWV1?=
 =?utf-8?B?bTVoN3ZBNno1Z2cvN1A4YzZBaGlRSVVja3I0cXhpVnVtcU9SdlRFSjZMZGtw?=
 =?utf-8?B?c1g5MDgybGdpaC9sYW5xaWUvai9KejBZcXZKYUMrZVFjdXBxUDNpSWxJTnVj?=
 =?utf-8?B?VTVZempyV0oyRUtUT3I1eTI3WWRZV2luM0c2b0hhOWVmYmt4eHkrWVpXUzdV?=
 =?utf-8?B?MUppMXhUd1d1czgxRUFHUDZNTHQzVEpOblJNNldkSVhYWWdsTDBWQ3dvS2Rl?=
 =?utf-8?B?MlNGeXRjRWI3NmFyc0s3VHZ3amtlOGJUZUs2SmQrUUNzQnlGVlNXVXVWMHVG?=
 =?utf-8?B?MDBjN1FINGYxbDhEWjhhSGtBc3BRQXU0SWpTLzRMdUV4aTdoTDBtYWtBZXc5?=
 =?utf-8?B?YUUrdGN3Tm5OM043N1ovY2dJNysyRjNpUEs2dHlCNkdxKzJxNEJnR3krdWpj?=
 =?utf-8?B?YUVlRDJJYTRoOXN1TEEvMkQ3SVMvc1hueDNlOEhqUm16dTU1bTdqbDlrcGkw?=
 =?utf-8?B?ZHVmTlcrM0Q2R2xvZDhTUWxUMDRXcHBPM01vRFdEb3JQZURmOVplNzJxdGp2?=
 =?utf-8?B?ZjB6UzNNc09nOGtuZTFmSEdoeDl0b1BFclhESGhKTnR5SmdYZHcvaW53Qy9J?=
 =?utf-8?B?M1pQVEREWU42a2VNSDkxelVCOWJPT3V1aXlEYlpOWUNJcXRzZ1o5TXFNbGh6?=
 =?utf-8?B?YkpudHlhTmpPUHh4NnA0N1NKd0hlL0ZLUFROMllXOEtJcUROQkU4bTJEYU8w?=
 =?utf-8?B?eS94V3RsUWlqdGV6emVXV1VPYlRJU01JckRFV2JrRTZ1R1ZZRHhrVHRSTVN1?=
 =?utf-8?B?TytiMVVYdlpSbi9MWmFyN3drRWtXeS9kMWNiTjI0WldRd0J3dGlDWEVDU29w?=
 =?utf-8?B?bWRUQ0hoZ0xvVFJIbVMwcDgrVllDZGh0aXlkMjloVEdNVmhLVERKc3BWTHpW?=
 =?utf-8?B?TW15TnpsSG9JTnZFOVlsUzdrc3NTZUdvZ2xNak90Zm9UN2ZWY2dhRWNpdkRk?=
 =?utf-8?B?bTkyTy9QVnUvem9KMlFybGhjNzZFbmZzUXZxbk9QcE5jWnQrRGN6b1loQm1K?=
 =?utf-8?B?RVZFOWtrRlNKMEE4QUhGclMyaGMzeXVEN0JtRHJTODRtQy9ETVUvVmJyUUNT?=
 =?utf-8?B?N3gxVXIwamFlSVUyRHQ2VmZSenU2a3FJTFFINDdYNUMyZE5sc2xMWmlVS0xq?=
 =?utf-8?B?bkh5M3l0U3ZyckFFVFE3L0U3UlhUVzQzRkJkZ3FjQXZSQ1RjQ1VUc1BIM2th?=
 =?utf-8?B?UUNkcjh6NUJWUWpvM2JSWHZ5Mm1sSVh4VVNqT1ZGZHY0REhMbTFVb1RPMHAy?=
 =?utf-8?B?d2p6bWFldnhkd0k4b3hrNzhuNGJPb1JxalBBdWZJOVMreW5hZ3JMakhsZ3Zu?=
 =?utf-8?B?M0ZKMmoxd1dsalZQN1hwU3Q3Qm0vT2loZGl2Nnp1c0YvOGFmbU5ZNFp4dlAw?=
 =?utf-8?B?ZWRreTlhRGQyNkxoNlQ3Vk4zWS9tbWJMWEJvdGQ2TVlQTlg2T25rb1JGcEJE?=
 =?utf-8?B?cXp3R0pjNzcweXcxQzNUMFZJYXB5bWs1WktsQUxJeWwwWFpodkFuR2FRWnpM?=
 =?utf-8?B?WmhpT2htVUlldjlvTlZ4cUxqczFDdTZjVmJza3MvZkRwamFaWjVyWHZDMG93?=
 =?utf-8?B?dVNjbGlFS3JsQlgzdkVjZS9BWTdKTE9QVnFSK1cwRHVUWXd1cDl4clY4Vmk3?=
 =?utf-8?B?WVVsNThrd3Jnc0lwbEtzTHVFOUppS21EOE55djhXNThQVTA1dVZtblNhaGQ5?=
 =?utf-8?Q?tvvsmFrf3N5pN4hEnplFSWJiT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <01C243CD8D3B03449CC1B20128686C61@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d522220-78d2-4610-2bb7-08ddadbc6ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 16:31:31.3077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sg24ImcMRTmS8pcWmi7ZuOvqX2tz4qBkzzpCu4aMCrkUwLkUg0KD/Q4bBkw9XTGUjN2B3OlJ/X/lzV3RJlGs/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9541
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

T24gVHVlLCAyMDI1LTA2LTE3IGF0IDE0OjA5ICsxMDAwLCBCZW4gU2tlZ2dzIHdyb3RlOg0KPiBJ
IGhhdmUgbm8gb2JqZWN0aW9uIHRvIHRoaXMuwqAgSW5pdGlhbGx5LCB0aGUgcHJpbWFyeSByZWFz
b24gZm9yIGtlZXBpbmcgDQo+IGl0IGRpc2FibGVkIHdhcyB0byBnaXZlIHNvbWUgdGltZSB0byBz
aGFrZSBvdXQgYW55IHJlZ3Jlc3Npb25zIC0gYnV0IEkgDQo+IHRoaW5rIHdlJ3JlIHdlbGwgcGFz
dCB0aGF0IHBvaW50IG5vdy4NCg0KSW4gdGhhdCBjYXNlLCB3aHkgbm90IGp1c3Qgc2ltcGx5IHJl
bW92ZSB0aGUgS2NvbmZpZyBhbmQgaGF2ZSBOb3V2ZWF1IHVzZSBHU1AgaWYgaXQgZmluZHMgaXQ/
ICBJDQpiZWxpZXZlIGl0IGF1dG9tYXRpY2FsbHkgZmFsbHMgYmFjayB0byBub24tR1NQIGlmIHRo
ZSBmaXJtd2FyZSBpbWFnZXMgYXJlIG1pc3NpbmcsIGFueXdheS4NCg0KSWYgdGhlIENPTkZJRyBv
cHRpb24gaXMgc2V0LCBpcyB0aGVyZSBhIHdheSB0byBmb3JjZSBub24tR1NQIHZpYSB0aGUgTm91
dmVhdSBjb21tYW5kIGxpbmU/DQo=
