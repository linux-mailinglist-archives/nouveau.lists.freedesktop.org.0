Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD241C66B80
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 01:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A051F10E409;
	Tue, 18 Nov 2025 00:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N8ya9Fe+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010013.outbound.protection.outlook.com
 [52.101.193.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769BF10E408
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 00:52:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abuWcylP5tWr2TXVjQ25DftXBtrcPDApUheNImUuyS0OcXm2phP4xo3TefeEY4KPSgMRNblOdKY7odKGj2L8igfxKBQD0kS8ixQGDhMrIYHyX/1kf+IV9FaFlvV5Ox0HSc04YaIDl1/K9X4386mVxCi1YMXWalzOs8FnGhTc26FNbS2c7lzCTXnlehndYPCHwGD40iv3oquxKF9wPrz7dIcTl4/uimIgl2K90P7hwo0mu8Ve2d1q2uVDLm1UQwDgvV6OZGDBpf/jvjC3mO65Vh4CZ6BHLJwWdagwsqE+9ZEV+fxdbCTgAsZRmuG5ska0idsvqUzDSHcrkLUbmPsCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGvEAOQ40rfhySaJPJqJv3q1yNSJQpsOy0PYyF4BX40=;
 b=vjQYRYxE3lsZTsSRnsm/6tucd8ty5ZuuATTBlGNOHockmkGzPbIiJKJ1bw7ejMsHVGa90chZM/C88aUK14vbleEdIfVujuvxKM3qExHIX2W11J9yCzyLtADH10YGuH+1F6RSJ5sgehTMmInLZf2RxnOO0DmvjVTwR1RRWoqEpm0xOk6G2CnxAwlzAaMJSdGgUCsoVeU0R/DoUKvTNOWzLoqwYkdtnC5hKC+AsAh+YQC1F7B3ipK1naH9iSrZLrF+qLqXPf77nm38PmnIGYIzcraDr7uJ3Jg+zp22+/ljEOI14nDEprNsjN8cpJuirdzv3NlWznlF03Xct5rEI69iGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGvEAOQ40rfhySaJPJqJv3q1yNSJQpsOy0PYyF4BX40=;
 b=N8ya9Fe+Bx2leFHTm3qqnLx4jLh/zZJ8I84cwx5rx6nP7fpHaNCq13t1+J6sFkm/e6413YnY0A6EqSA1jbSqiIqsejI0DAUtXwTg31UXcmUfYZ9REEGx8scwWwIRgjHCauClyiBiwfDJ4G8XFXvPPXhfO4zg/9MThN/gXhiMDzp1xDyY/2A36LuRgiyKgxMbS0XNoJ66q5NSi60WNZhhAtnpOBAxoZ17+FM0vtapd+MK2jwchMP/l0lR7LREm+rEisda0bqN8QmrBsxI75NrxSZjai/z+Sbd8DSyjpFx+mQU1dY2gbxgp5CI9jnmOtIrwsolDyOMQ84gATV7UkZuVA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 00:52:47 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 00:52:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Topic: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Index: AQHcVb7G2n7lcTwiZ0ixsrXV3K+7w7T3eOAAgAAm8QA=
Date: Tue, 18 Nov 2025 00:52:47 +0000
Message-ID: <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <20251117223324.GA1094429@joelbox2>
In-Reply-To: <20251117223324.GA1094429@joelbox2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|PH7PR12MB8180:EE_
x-ms-office365-filtering-correlation-id: 84c453ad-07da-4e89-ad76-08de263cca97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eHNyeTE2Yk9UL3lwVkZiS0tueFVqaU8xa2ZCREk1bUFWcFNrbjEwMGU5MTFn?=
 =?utf-8?B?NkZvNHIrSmRnZlB0VStZYWVEckN6V1UxZVJOaGdHbEk4UGp2RCtaM0ZVcmpM?=
 =?utf-8?B?amVHU1ZPUHpIbFptdkJ6OGROUDB6RE14U1BJekVZNkg0WnorMlpZenp0Rkxz?=
 =?utf-8?B?OURLL1VkdHdmMDU1dUtRem9zME8rRGduRWd2azF1QjNhMWNGSXAyQ3h4NVVX?=
 =?utf-8?B?OVFDcUZ4ZzQ4M2ttL2hHeS9jQkdjVnRhTmdlaWlzdjB4VVJ1TklZMnFqNGZa?=
 =?utf-8?B?amJnZnNKWG5POVI1ZnRZTnFLQmo5RURxN1dUekRjVTkyUUowNlRzTlkzUlIy?=
 =?utf-8?B?L2xmelIzZ2lUSERscHc5a1BOL0U3MXpIdTIzNHF4a2xNbE1YdCtQU2xHRWgy?=
 =?utf-8?B?aW9jWStMeThBdUpEY0s1NWQwMis4WnRZandBN2ZlYmpqUWZ2SnlRb2VOWEpN?=
 =?utf-8?B?TFZUbWtWWklFL2lTbkx3K0lpNXNvMklPMWx1ZEdBTFZuM3NZbUErQUc1NGtL?=
 =?utf-8?B?ZTNrZXJIY2o3aXhwK011WG9pQ0ZHZzRWQzNnL09zd01LRmZxN01hOHlhTE04?=
 =?utf-8?B?a0p1bzl2Mm5vWWFROFp4bXYzU1pDQlFyTURnbm5GcUd0bVhFVXJCM2Z5Qnlj?=
 =?utf-8?B?YVB0ZFZOczc1ZjNRb2hkQ1JrSCtlV0QraVpLYTdmdkFwdXd0c0hKKzZqSXFH?=
 =?utf-8?B?WGswekpKNWMyazFkLzJ3OXNGY0xxOXd6QlZFVFB1cFlrWVZsQU9LVlpobUph?=
 =?utf-8?B?MmsxNmNvVmpyU1hQa0U1UkdkaHZLcG9yc0xUa3g2Z1F0Qko1ZHM5VVNkbzRK?=
 =?utf-8?B?d3hZTjFabWxOUU5kRGQ3bHNDRkVrZTJkci9wMUNoNXlTcnF6K01KY2luS2kx?=
 =?utf-8?B?TnlUU2pxQVJsRW1ncVV0TndmWEdydk9yTE9pZ3VJaGxwOFRCR0h4QkoxZjQr?=
 =?utf-8?B?bXY1eEZiOEZtNUQxWXNKRXdnME1WK09QTFg4YlpsU25lRjFwK2o0TGNVcjNL?=
 =?utf-8?B?UWRqK2Z6WlJ2UXpkdWtNSmxPcVZSd2I0K244N3ZTTTEvNFA0dmp6bzhsaDNu?=
 =?utf-8?B?NlpTYkR2KzZpTVpkUUtTU2E4YWZONVg1S2RHRXZNUmFhSW5rK3M2d3U4Mm54?=
 =?utf-8?B?TlYzcHc5MTJHNWdISW1OZnRZaFdDd3ovRmRRSUgwQ2pVRzJSS0FlNTlxRGpl?=
 =?utf-8?B?WU9rdjFEcGg0VDNEREx2S2lpTFRUTDQvSkxxbThKWTZrWEpaMlhqM1FpaWow?=
 =?utf-8?B?TG5HVjlpektpNW56cFdxK1piSlJmbUdvclNyRTh2VEFkL0EwOVhzTGdqZlFO?=
 =?utf-8?B?dG5aYWpTeXpuK1JUZlFPNnpVcW9iRWxkbDlsWEp2Tmhuend2bW96Tm5wTHc0?=
 =?utf-8?B?elhsdnJDVEZONWowU1BMOFNvazRlL3N3Q0lKenJQakJseXZ4UXFqQXhiWjFQ?=
 =?utf-8?B?VW5UcW16KzRaOVU1UkorUEV6anlNRDNjN3djWkdERVZFK0JzcHY5YjdDRFNz?=
 =?utf-8?B?aDZSb1kyVmNFMWZRUlRrMjBuV2NnOXJCcTA1WTBhRDBQdDFyR1N0S1lxa1I5?=
 =?utf-8?B?V0M5TGgwU2J0cWF4TFY0K2pXak1QSTMrV0JsUGRlM2Q4cXJpSkxreDBGdTEw?=
 =?utf-8?B?YXg2UkJORnpDYmV5OHdiSEtXU2pZSEdjTlVDTHpuK1lzbFBxZ1R6VlNQZDdK?=
 =?utf-8?B?bWl4ZEFhdVdaUkNpQytrVXVzSEkzQ2pybXFsLzRheFdraGRndk81aTg5Wi9m?=
 =?utf-8?B?aVRrN09xVjFBY05hWm1oVkZRMExGTnErelg3QWVKYzF6UGRRU1cwZzBKSkVh?=
 =?utf-8?B?Z2xyb3lWYi9OZVBOZlVWVUMzdDhKejNqQnFDakN2NzkrNEl3dHFzUUp4eFFS?=
 =?utf-8?B?QVZiVTFkeEJkLzFySDdaSWVQb2hqV1dlRHJNdld2REMxbUFsTjVDMEJueDdY?=
 =?utf-8?B?NmlEYW94UDI0R2J0a0dGclBXUk9mbVNlait5UDhrb2VJSUE0a1B2M1FEekVh?=
 =?utf-8?B?TE1veWlXZVhCdHhDOWZKdFE4cFc4QTV4ZWJqeDZ3ZlZMazliV3JHQjRPbGRy?=
 =?utf-8?Q?9w8NF2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEpidUZuelUrTS9lUkJVdmFiWWZaQmJuaUVEdFlKUUFvVmVHcGtQb3d1V1pn?=
 =?utf-8?B?cFlQdkxaVm1TYTFjNWhGVGYyU1U4bWdud1g0bEdEMjYzSEtwbU5KMEVJSWQw?=
 =?utf-8?B?bC90U1NvU1FYL1RBS3lTODFXWS9ORXFBNTFqdEV3eThSU1BVcTdpaWgvR1lJ?=
 =?utf-8?B?aE1lc1VpQWlBSkgvVzRsbzZ6Nnl6YlB6WXZLa2twOFNyc2pvMXUyOUV2Q0FW?=
 =?utf-8?B?a3g4RWpSYTFLaVljUUU2Q0xoNTYxalFvREwxSURWY1I5dnJkQ0lwRnBwKzUv?=
 =?utf-8?B?TjJaVHRzbUVnbmxucnF0WmRRYXRNRjVCSGRPUmdMNFhKS1cwYWZ0WlByREsv?=
 =?utf-8?B?dGpIN0pOVnFMUUNLT1FmYmdLTXhXOW11M1lYeUFNZTRnRWVvS0svWjJmR1Z2?=
 =?utf-8?B?ejVkVEtxZU5HWHMydlowMHJ0MUZzYW9randrUG1TRm5Na2dIcnpKQm8ybjJY?=
 =?utf-8?B?OVE0Mkh0KzY5b0g1dmVTNVd6NDVxbzVpcW9GWWQxeXYveFFIL3hncjdDWDFu?=
 =?utf-8?B?K3RYcEtoQitNU0V0UWRNWXozQWtCb1g5cUUvcDNudUo4R2dKUWRoSFBCd0tH?=
 =?utf-8?B?aXhnZ0pRL2E0QWRoQWJnVHpCaWVOWnRLTnhabmZwRkk1THhZRE1pTTZJZWVo?=
 =?utf-8?B?V2M1RU9CZGNpTXVKa1pRbWpIR1o0Q0xFMXZpN2l0MkxxS01GaExoT2pJcUI0?=
 =?utf-8?B?T3JhTUZ2eUdiN2ZnQnZpTHRzSXZLT1NLaEZnblF4cFJlNThDN1JCRnJIMU9t?=
 =?utf-8?B?ams1Qk9LaEtYZElMejRkQlZydHlLZGRhQWZmSzVtRVlsSjNHMWQ3Z0xWMDA3?=
 =?utf-8?B?MURuWWFFeU84aHp6YkRqSGRFSldXU2MyeFoyY1RBZC90UkpTR0RSOFJtN2F3?=
 =?utf-8?B?TlpBVUhRRC8vSUZuZmdNR29SUlN3L0dxVkFwa2wxYlhCQThibUQ2eStHUkdp?=
 =?utf-8?B?cXNBSkxxdHFIc2RUelFvcGYzTGY0TXhkMkhxRTVUUnZ0ckdtbUZsV3pCeEJO?=
 =?utf-8?B?SjN6SXJxcGhqSE5DRnhNU3NGT0s1VS9kZDdvNWlEYXNORjlQRU95NGN3VU9W?=
 =?utf-8?B?Y3lHUS85aXQybCtBSjBsRkd5dStqZng1T0RJajhyeVBWczl3eU1yMWFCTENk?=
 =?utf-8?B?aGk1bURZaFYrS2N3c1dET0xGSDVLOERLeUI5M25nT0ducE9rVWMzSVczMkcx?=
 =?utf-8?B?Qmk3T2xBRk9hQjZWR1BqMHk4ZE9qcjdMSVdWRkNLK2Q0UWNjWGUwMW95bC9P?=
 =?utf-8?B?V2pZbTNNV1RoM2hTQUdrUU1xRkdFZmNyT1ZtMU9KdjVTWGt4L3QxalRPeStL?=
 =?utf-8?B?ZkRxN09yT2ZhSVJpK3laemEyNlU5cU9EQUVBWEt0cllVdFdNOHNtcVdTaklK?=
 =?utf-8?B?R3U5SE1EOXpLZm0xeXJ1d1lRMERPa2syU0RDRlVadnpvV0V0ZFN2N0ZES3Vo?=
 =?utf-8?B?SDU0VHpnZHIzZFM3VkJZUGlsQ2s4YzF0Y1N4emV3dkFWODcxUy90ZWRhUFVT?=
 =?utf-8?B?V0VybllTUGRpN0xuNnozelExOG1qUUtVdDNCWmUvb2tUYmt2VkMva3grOXZC?=
 =?utf-8?B?VnhoM3N6dzlOaC9lNUljcDEzTGlLSVA2WitqZWRaMDJyR0IyeGU2amtMTXpD?=
 =?utf-8?B?eG5qQWhkSFd4dDl2WlVQNEk1T04ySWFuSnJBaWJ2dTErTHptM213c24wZURO?=
 =?utf-8?B?UmRkRTJYZloyQnZUODZJUUFMU2NqL2hDNDB1b0Q4M2hvN0hFV2VDQTNHTzNu?=
 =?utf-8?B?RUw1SUhZQVhoM3BSVmMvc044SlNtY0JKMGc0Tk5QSHhyYXhjdWxlVmlrdHBM?=
 =?utf-8?B?WWtUSzh0dWw0VlNOZHVnQXd0dVpXN3JKWSs4dEw5dnJNaVlTWTdzTjZBQitX?=
 =?utf-8?B?akJkejI1OXlXQjVIZngrbytJQXhCdTMrSGR1YnhFZU1zN0FVODhOZmpYc2FD?=
 =?utf-8?B?aTBNVFZqaHF4MWppTEVaZURUSjNMYXRSNUoxbU1mckd1U0NkclBubmNPckRU?=
 =?utf-8?B?eEN2SDlxcXNGQVA5S0p3aXRkRUdEUFhPQTBYdUcvMncvVnhyT1JkVEhEVmM2?=
 =?utf-8?B?eWUyTUcwVXkzcHE0WDNFOEN6VGxqODI4RnpUVHJUVUFOV01RR0dkMUt2L1hx?=
 =?utf-8?Q?IMPWBDU9fDgzty0dXZ611mG0d?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F85900520B6984DA517AB39D66D2CBD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c453ad-07da-4e89-ad76-08de263cca97
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 00:52:47.1404 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hXCu9fxjH4yUrL+xCj39yp1b+bvBUiJDP8rRH3GPIiN/UgWgrnIpkoAZJmQx5xBA7a5hF2Wr8oKqwFclUyKFtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDE3OjMzIC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToK
PiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqAgLy8gVGhlcmUgYXJlIHR3byB2ZXJzaW9ucyBvZiBC
b290ZXIsIG9uZSBmb3IgVHVyaW5nL0dBMTAwLCBhbmQgYW5vdGhlciBmb3IKPiA+ICvCoMKgwqDC
oMKgwqDCoCAvLyBHQTEwMisuwqAgVGhlIGV4dHJhY3Rpb24gb2YgdGhlIElNRU0gc2VjdGlvbnMg
ZGlmZmVycyBiZXR3ZWVuIHRoZSB0d28KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyB2ZXJzaW9ucy7C
oCBVbmZvcnR1bmF0ZWx5LCB0aGUgZmlsZSBuYW1lcyBhcmUgdGhlIHNhbWUsIGFuZCB0aGUgaGVh
ZGVycwo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIGRvbid0IGluZGljYXRlIHRoZSB2ZXJzaW9ucy7C
oCBUaGUgb25seSB3YXkgdG8gZGlmZmVyZW50aWF0ZSBpcyBieSB0aGUgQ2hpcHNldC4KPiAKPiBT
b21lIG1vcmUgZG9jIGNvbW1lbnRzIGFuZCBkb2N1bWVudGF0aW9uIGV4cGxhaW5pbmcgdGhlIGhl
YWRlciBzdHJ1Y3R1cmUKPiB3b3VsZCBiZSBncmVhdC4KClRoZSBoZWFkZXIgc3RydWN0dXJlIGlz
IHRoZSBzYW1lLCBpdCdzIGp1c3QgdGhhdCBvbiBwcmUtR0ExMDIgcGxhdGZvcm1zLCBzb21lIGhl
YWRlciBmaWVsZHMgYXJlCnVzZWQsIGFuZCBvbiBHQTEwMisgcGxhdGZvcm1zIG90aGVyIGhlYWRl
ciBmaWVsZHMgYXJlIHVzZWQuICBJIGNhbid0IGV4cGxhaW4gd2h5IC0tIHRoYXQncyBqdXN0IGhv
dwp0aGUgaW1hZ2VzIHdlcmUgYnVpbHQuCgpJJ20gbm90IHN1cmUgd2hhdCBraW5kIG9mIGRvY3Vt
ZW50YXRpb24gSSBjb3VsZCBhZGQuICBUaGUgaGVhZGVycyBhcmUgYWxyZWFkeSBhbGwgZG9jdW1l
bnRlZCwgYW5kIGl0Cmp1c3Qgc2VlbXMgc29tZXdoYXQgYXJiaXRyYXJ5IGhvdyB0aGUgZmllbGRz
IGFyZSB1c2VkLgoKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgT2soU2VsZiB7Cj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpbWVtX3NlY19sb2FkX3RhcmdldDogRmFsY29uTG9hZFRhcmdl
dCB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNyY19zdGFydDogYXBwMC5v
ZmZzZXQsCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRzdF9zdGFydDogMCwK
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuOiBhcHAwLmxlbiwKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGltZW1fc2VjX2xvYWRfdGFyZ2V0OiBpZiBjaGlwc2V0ID4g
Q2hpcHNldDo6R0ExMDAgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGYWxj
b25Mb2FkVGFyZ2V0IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzcmNfc3RhcnQ6IGFwcDAub2Zmc2V0LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRzdF9zdGFydDogMCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBsZW46IGFwcDAubGVuLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGYWxjb25Mb2FkVGFyZ2V0IHsKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcmNfc3RhcnQ6IGxvYWRfaGRyLm9zX2Nv
ZGVfc2l6ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkc3Rf
c3RhcnQ6IGFwcDAub2Zmc2V0LAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGxlbjogYXBwMC5sZW4sCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0KPiAKPiBDYW4gd3JpdGUgbW9yZSBzdWNjaW5jdGx5Ogo+IAo+IMKgIGltZW1fc2VjX2xvYWRf
dGFyZ2V0OiBGYWxjb25Mb2FkVGFyZ2V0IHsKPiDCoMKgwqDCoMKgIHNyY19zdGFydDogbWF0Y2gg
Y2hpcHNldCA+IENoaXBzZXQ6OkdBMTAwwqAgewo+IMKgwqDCoMKgwqDCoMKgwqDCoCB0cnVlID0+
IGFwcDAub2Zmc2V0LAo+IMKgwqDCoMKgwqDCoMKgwqDCoCBmYWxzZSA9PiBsb2FkX2hkci5vc19j
b2RlX3NpemUsCj4gwqDCoMKgwqDCoCB9LAo+IMKgwqDCoMKgwqAgZHN0X3N0YXJ0OiBtYXRjaCBj
aGlwc2V0ID4gQ2hpcHNldDo6R0ExMDAgewo+IMKgwqDCoMKgwqDCoMKgwqDCoCB0cnVlID0+IDAs
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZhbHNlID0+IGFwcDAub2Zmc2V0LAo+IMKgwqDCoMKgwqAg
Cj4gwqDCoMKgwqDCoCBsZW46IGFwcDAubGVuLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAKPiDCoCB9LAoKRG8gd2UgcmVhbGx5IHdhbnQgdG8gdXNlICJtYXRjaCIgaW5zdGVh
ZCBvZiAiaWYiLCBqdXN0IGJlY2F1c2Ugd2UgZG9uJ3QgbmVlZCAiZWxzZSI/Cgo+IAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGltZW1f
bnNfbG9hZF90YXJnZXQ6IGlmIGNoaXBzZXQgPiBDaGlwc2V0OjpHQTEwMCB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbmUKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH0gZWxzZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNvbWUoRmFsY29u
TG9hZFRhcmdldCB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3JjX3N0YXJ0OiAwLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRzdF9zdGFydDogbG9hZF9oZHIub3NfY29kZV9vZmZzZXQsCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGVuOiBsb2FkX2hkci5vc19jb2RlX3NpemUsCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0pCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfSwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEV4aXN0cyBvbmx5IGluIHRo
ZSBib290ZXIgaW1hZ2UgZm9yIFR1cmluZyBhbmQgR0ExMDAKPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGltZW1fbnNfbG9hZF90YXJnZXQ6IE5vbmUsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZG1lbV9sb2FkX3RhcmdldDogRmFsY29uTG9hZFRhcmdldCB7Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcmNfc3RhcnQ6IGxvYWRfaGRyLm9zX2RhdGFfb2Zmc2V0
LAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHN0X3N0YXJ0OiAwLAo+ID4g
QEAgLTM5Myw3ICs0MTMsMTMgQEAgZm4gYnJvbV9wYXJhbXMoJnNlbGYpIC0+IEZhbGNvbkJyb21Q
YXJhbXMgewo+ID4gwqDCoMKgwqAgfQo+ID4gwqAKPiA+IMKgwqDCoMKgIGZuIGJvb3RfYWRkcigm
c2VsZikgLT4gdTMyIHsKPiA+IC3CoMKgwqDCoMKgwqDCoCBzZWxmLmltZW1fc2VjX2xvYWRfdGFy
Z2V0LnNyY19zdGFydAo+ID4gK8KgwqDCoMKgwqDCoMKgIGlmIGxldCBTb21lKG5zX3RhcmdldCkg
PSAmc2VsZi5pbWVtX25zX2xvYWRfdGFyZ2V0IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8vIFR1cmluZyBhbmQgR0ExMDAgLSB1c2Ugbm9uLXNlY3VyZSBsb2FkIHRhcmdldAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbnNfdGFyZ2V0LmRzdF9zdGFydAo+ID4gK8KgwqDCoMKgwqDC
oMKgIH0gZWxzZSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBHQTEwMisgKEFtcGVy
ZSkgLSB1c2Ugc2VjdXJlIGxvYWQgdGFyZ2V0Cj4gCj4gcy9BbXBlcmUvQW1wZXJlIGFuZCBsYXRl
ci8gPyBBbHNvIG1pc3NpbmcgcGVyaW9kIGF0IGVuZCBvZiBjb21tZW50LCBoZXJlIGFuZAo+IGVs
c2V3aGVyZS4KClN1cmUsIEknbGwgY2xlYW4gdGhvc2UgdXAuICBJJ2xsIGp1c3QgcmVtb3ZlIHRo
ZSAoQW1wZXJlKSB0aG91Z2guCgpQbGVhc2Uga2VlcCBpbiBtaW5kIHRoYXQgSSd2ZSBiZWVuIHdv
cmtpbmcgb24gdGhlc2UgcGF0Y2hlcyBvbi1hbmQtb2ZmIG92ZXIgc2V2ZXJhbCB3ZWVrcyBhbmQK
dGhyb3VnaCBtdWx0aXBsZSByZWJhc2VzLiAgVGhlcmUgd2lsbCBiZSBhIGxvdCBvZiBuaXRzLgoK
