Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39399AA7C99
	for <lists+nouveau@lfdr.de>; Sat,  3 May 2025 01:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA62B10E978;
	Fri,  2 May 2025 23:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h9n/S2Yl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D38610E978
 for <nouveau@lists.freedesktop.org>; Fri,  2 May 2025 23:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zrlw0FrJuvuHKiv8UamvbF4eDwDM6QlZdRlmQ0IaqO2lxKjgBMojpd+1OoXPn8gdQ9sf+GDfqinwqhXUx+ILfGaEg9GP+TqI2m5iPHwTdLEJywsy8klr5h0uK3FLJ11VAUg04fC1Le0NbVHtt2fzt86GU4iWXtgYizIzhGBTeRhdTRfyXo0jGb9r0bs++S4+3b/2fji42KK9z6BAejDPRswYxe7Sj48KkDj1u8Ji2jl9QmQuG48hzWz+xe0LddebgFwL4BlpDMS1kvLLH3HM45a12mY4Xm8+MQWTpVyFg4P85u9qX7VrTpByM+DlwDk27gZpnJ3nCUHPdNTplQrhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYOJ7CdKyJxGJ5JC5spRJKbtpMXV8ufCUtuKReBZHJc=;
 b=xyBh6C5xhfMkjgQHtekejDVwg5NHMThdB0u7Y276aiMBvjD7Qdun62zQvBrDFBu7BQhftNlm9nj47gRg65UaezeMsQJ1zc9s82Vf5m87CLk+WjUPLCcTclrmZSyTEXzhvvRc+Y+16WxCZuyq24WwKWgG2i5y62x2Bsfi0PjX2BAnOv6rN6fNhpgxaFTLvXxRwNqLYRKlyPsBC/ELbTwPcINiXjEV5hqlOgS4Pb45QQFM1WI2xsJmA5QKWoHak7w8GYRrdlotub/zWtmdgZyxzC+88zbahtZck0qz1sV6kbR5MRJL6Qj/9yS4dBqu3GiR/etNFhlHTRDQS3eN4yVhDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYOJ7CdKyJxGJ5JC5spRJKbtpMXV8ufCUtuKReBZHJc=;
 b=h9n/S2YlxKgpn9V0NsU/0q14kCvGoH/c+hRd5haG13Kwsnk0m7kjOp7lgTXFbKWBK86KXsPyKrMBvyrZV/hymXhZBaQdltb70pN8S72rysDbM0ZpANHsOKsYWBdUDNOxxex+AYKinhi6qSrD5nEwgZvkfl0iyD1uWIsgbJNu+Aa3wWBERbezrAngdRk57G0krv2tW5A4fU3aZL/db+NG6pTDvkyGgETHyr/E+EhT+SCDTqmTqwMoNSvsHAPhvPbP3y8lz1kFh8jZuNxUeiPezkV78vsCyKrxeaXaAYkmF6iAq7GC2b2ArgAJBlU+8r3SWTr5MFqot9NvwPbZrIsB3Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CY1PR12MB9698.namprd12.prod.outlook.com (2603:10b6:930:107::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 23:05:15 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 23:05:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 00/60] add support for Hopper and Blackwell GPUs
Thread-Topic: [PATCH 00/60] add support for Hopper and Blackwell GPUs
Thread-Index: AQHbuWAQv8vQgiOLykW3Ci6b+LfR17O/+oyA
Date: Fri, 2 May 2025 23:05:14 +0000
Message-ID: <814757de88bda63f6115886d99146e76103d9533.camel@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CY1PR12MB9698:EE_
x-ms-office365-filtering-correlation-id: ae640169-6387-4364-2508-08dd89cdcc8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZmFZeVQ4NW43WUgzQkw3V1BiMVh3WkIzd21McDYva2FtQjJBQkNUdERncDZ0?=
 =?utf-8?B?M3N1WjRjckpmblhlbTlkZkhkdTlzVHcxQXlMejdHYlJYUW44YkZvL0pRT0ZO?=
 =?utf-8?B?M2xLaFdEUTFFYklhV2N5SDAyNlZmOVlaanp0ekh1dVBGZFdjblNpRnh0TDJs?=
 =?utf-8?B?cFkxRTlUOXB5S1FURDVreThXZ1h5ZVMwa2tJdDhkM2hZTW1DWjBaZ3VlUlBi?=
 =?utf-8?B?Z2VNUFcyN0JRcjQxR1ZqVzNzd3ZPWmhLMVFTVzN4Q1gwbC9NdlcyM1NNQ1F4?=
 =?utf-8?B?Q1VqSXRHU1BGOVlaekQ1WXdwS2lrc3V5cDR4TGx4c0FPV3hQQ210b2NKbGxl?=
 =?utf-8?B?ZmVEbU1YektYYzZHTmtPeHJLTmFaSXJrNHovZ1BuNWlYajdaMlU3ZSsvK2hu?=
 =?utf-8?B?b0M3cUcwamk4aEVDeUdyak9jdHA0czVDWmNIaEZiRTZZSG5rN0VZVnVwdXM5?=
 =?utf-8?B?REN1S0ZvaTdDcUNMM1RzOE9ENXdydE1ub1lIT1ZRcnBySmpkWVh2cGtMMzdZ?=
 =?utf-8?B?RE1pQms2UFBUME5YRVRBY1pNNlpON2VPRkJlRzF6VE1HYSt3VGkzektJd0hY?=
 =?utf-8?B?M1lsNS9WZVhSMlBob1hWeDVHQVRjZmx0di9Ra3dwcS93UzNYZ056d0x2a0U2?=
 =?utf-8?B?VG80WGV0WllSU1hjVWNnbEtDSmorWWdFWGpVdERWbExURk1JK3cwWXFEWFd0?=
 =?utf-8?B?SFg1MHFGWjJoZXhvbW11Q3cxeDFmZzlneUxpbHlrbXNyNFAzMFBtWnQvM3U5?=
 =?utf-8?B?bVdnVGNHanRPQ3hKUVFVNGtvTmVQSXArUTVYQlpoN2FMR1dpbWJ5OTcyUnMy?=
 =?utf-8?B?MTlJNFYrVExoVFNXSFVzT0NySmtETVk5NTEyMHQrZzE4VE9lTW54QXVqblFt?=
 =?utf-8?B?QWtwSFRhaWw5QW0rWDFFUkwxSDNxNXNaWnpxWi8zeWJFeXNUR0wzZnJGcE5T?=
 =?utf-8?B?b1cvQlJQWG9DMFdxVFk3TFNJUVhDSXNPd2JrNkpoT3Q4dDRsSXRKcE5na3Jp?=
 =?utf-8?B?WDVKU3kwbmFBVll5NlRwaVJTb0tyQzBFN3ZCSnZqSFIrZE00djA0R1hBSDNy?=
 =?utf-8?B?ZFY4bTd2aitPTVRXS2ZJTHh4ZXZCWG9nNU1Uai83d3pOV0c2elc4OWZ3LzN1?=
 =?utf-8?B?QnFCSzB0djdXV1VoSXQ5S29QQWJjdEVSUklMbHo5ZWVLMm1lVysrNWZDMkRD?=
 =?utf-8?B?SmpmUHRoT2tsN0RnQjNibmpUNE1JZmt1c2tOMmJPNlZvd1pRYUp0cUYvTTd6?=
 =?utf-8?B?QUdQY0tyVlBSU05uUktoLytNMGd4WVdUTmZvM05VRVJFNU5TMXhhMmlWWjFV?=
 =?utf-8?B?VnhPdHZTWTlqR3VDZ1FmdGlLNWdKVFF3aUh1aGoyRlVxNUF3RjJsSCtYeTdy?=
 =?utf-8?B?dkpFNkxjQlcvQmUvUGVrL1YyNFN0WXNmTGZQMjVmeVlqckVLMklDRWQ4YzVy?=
 =?utf-8?B?TnM0VHkyMWFCTGFWRHdrcUZoRXphaXNGZ2JCSTg3LzBCUUdKNDA5cHpmb0JZ?=
 =?utf-8?B?Z0ZhbjBBZVpoUU1NaEJoQUlINW05ZTg0M0JGNXo3S1IyNUJxdzJFRUJlWks5?=
 =?utf-8?B?OUZWM1VNcjJpRFhoeGJCRS9OTU1ZbkhIdGxaNEFjTHd3UUhpZHBMa1NtWnpM?=
 =?utf-8?B?aHU0RjRTS2xMNU55UUpaUGNHZWROdm43SmVlVTNpVWlqeG82b0ovcFlFVWJq?=
 =?utf-8?B?WkduOWJQRndMMmVNelNKVUVWeGhvWGdKdjFmUWRXVVU0bkZjYyt1ZnRTbEUx?=
 =?utf-8?B?ZFpzdFhmQnR6TmY5bXYwSkRwVkZTWnYrTis1THFYOUlYN2tvMUZMNW5lU1JP?=
 =?utf-8?B?U0VtUmhkdmVXOGFnK3ArdzBCWVZJT3FZZFlHS1lqRG5ENFcyMWtBSjBpOVdw?=
 =?utf-8?B?WmhGM2tPVWJ4bkNqc1IxWkh6R3J3Yy9nME1EVUtwWmdQcERVQzhYZHVLTjkx?=
 =?utf-8?B?OGVxRTdQU1NlN2JRbllCSHZhbzJtVDNRRE9uQVYyMXkwOXpvNEpmRnJIbWF4?=
 =?utf-8?Q?ZrmjEfuS1re4F+/PpEN+8A8WJauH/I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yy95YmkyZlNFaTRBaWsrOElkNU1lRC9VeFVQakF3UG84d0xsY2VCd3NmaEtT?=
 =?utf-8?B?VXdZbGtRWVVhbUk2RE95Wk5BTmo0bTFJbDRXZVFUTG1qczhORmZ4YXM1ZW1y?=
 =?utf-8?B?aVQxMmFyS1FZc0NKb1FsR3BCdll6cXNCSjJzRFA1R0Y3Ykg0NnorODZ6T2dr?=
 =?utf-8?B?WEt5MmtQdFVaM1V4ZU1OaXJrQ09VYmJGNlRQQ0w5b0JuaGFBeGRYL1dtTW9C?=
 =?utf-8?B?dXM1eXl5WDE0U0NzOFRZUEl6WVBCS2NXNTVXcUk4d0ZmdXhvSndKRk9YenZy?=
 =?utf-8?B?K0Uxa1BsS09YbUJaQzJ2aFZPN0gycEZqMUJnMFJ1aHE5UnFrMm1EZGhLRDVi?=
 =?utf-8?B?cUZWTzhOWms5NDdRTEJJTDV3NlZnR1hadFBkS3o1Z1BONzJCZmYzeFRUVTFv?=
 =?utf-8?B?SFMvS0ZYRmYrUjEvMmlWZEtIRHcyd1lHZURqZHdpV3FaN1JwbU93ejdnTndC?=
 =?utf-8?B?cDB3RWJVeUJ4Q20vc1g2dVFqQkljNXIxL3lHNUZtZWdoeWdjbW1DTlRBL3JW?=
 =?utf-8?B?SUpzd01pN015RUl4SkU5Rkx4bFMrZGRzQTVFeGRJODVvTUVUajkrYll2VUVs?=
 =?utf-8?B?emFGMmtncTBMY1dIQ2U5eDhHL0wwK2Z0bGFlS3NmS29vRk5yREFZTUFJMExk?=
 =?utf-8?B?SmhqTGcrbmJoNlUwYndocGhEMTMzeFQ2cG1RUDE2TUxob1FRbjNabUtadEp3?=
 =?utf-8?B?eEJHRWUyU2xlRFd2NFRHMUp3VjBpTHlNR1Joc0pEc3g4MTF6TU15VldiU0px?=
 =?utf-8?B?Ym12OTh4Yzk3TERBV3Z5ZkNKNjRaaytycS9ISXlWSmNReXIzRUhLM01oNjJT?=
 =?utf-8?B?T0hJbDU3QjdvNFlJQUlqREpCQWF1ZldMSWdXc25ZYU5xWW5RSXRDZ2FVVGp3?=
 =?utf-8?B?WUhrK1p6VG83OCtTbm5WR2xIMjRHdWczQ1J5enF4bzFSNE5zUUluMm96YnZD?=
 =?utf-8?B?SmhpSmpKbHI1emdSUko5VWhueG1VYzEzc0wzem91QkdacytTUThrd0hKay9C?=
 =?utf-8?B?dU15U3VPK0RObXZlaGs0TkZtMlplRERMQXpFZW80RTluMlhTMmpQMlhDQ3BE?=
 =?utf-8?B?bkRvTlZZL0pjalZKcGNtaXVOUkc3Y3N2VlpOUWxHTkNpWEVLenc2eFZqV3BY?=
 =?utf-8?B?ZWlsUFMyMzluV2l1OUl0Njl6QkU3ZFVKVm41L204aFVGY3oyMTRsTTlaNXNP?=
 =?utf-8?B?U3YxUFh2SDZQeTFpQXA5R0JCVzJDckw4cU80cThZNlZ2ZGVldXQxSElSQlNp?=
 =?utf-8?B?bitxMytmRy9DWTlVWVNBSUdHQlc4RVpZczF0N21rOHZ0T1RjMm1PNTB0U0FG?=
 =?utf-8?B?c1NUWUMwMEZtYm1BNHYxUjZQWkd4QnNiWGZOZkRRYTFZN1ZBeEJ4bVFpQis1?=
 =?utf-8?B?VGRaZ3I1anRIMGU1SEN6cWVBKzZxend4SU11WVdKVi91cUdSZExmZ3diSFln?=
 =?utf-8?B?eHh5Rk84WVRCZ1dEdzRwQ2dEckFZeG9MM3BFZ0UwaGlJOW5vekFPcWlFQ2o0?=
 =?utf-8?B?dHVZenJCWUxSY1FnVmZIb2NjdVhyK0tITVArdkZneGlQbzRIZW5xNHFIYSsx?=
 =?utf-8?B?QVkrM3RyVHhERDVqYjhoMzlSUzF2Wll3T0pMT1hsU1FCR09ZeUtpbngzYjQ5?=
 =?utf-8?B?MlVkTTEzdkRBeWtLNnErN0xFbFBWekxoUEh1b3l6YXU0Y2dtdEViNVJYZE1V?=
 =?utf-8?B?R2g2N0JsMjJrQU5JenBXUWg4eFZWU0VmUzFQUjM3QWNlK3A0Qzl4aW9DMWty?=
 =?utf-8?B?MkNtYzZ6WjNjQkhQdGRRUmhpSThTV1IzaUl3a3FWUW9MN3VaS0FkL0JsTjAz?=
 =?utf-8?B?WUg3Q2NXQ0R5WXJKNVRSWGg3dXRsc0E1S3lQWmVNUVVMdGJqNXJlSkJtekly?=
 =?utf-8?B?eDQ3MzIrTlFGbVFDVjFrQ3l4WEEzVmp1RjF2UnhvSVV3bENiS3BZOXVwOHZu?=
 =?utf-8?B?WW1IY2JySXdjZVZ5RjRWNkdLaE1FZ1hOZGxka1NoOHl4VkFyUmlZZ01TNFpz?=
 =?utf-8?B?T2dqeTRNSmNKcFE2bmU3TzRNS0xNRURpSFVmZmZRdXVPU2xiUXU4Z2lyV0lI?=
 =?utf-8?B?ZzNuOXdrVzJkTkIyU3FKVlNGNjNjUHBTclR4Wm9PbU16aDd2eWp4WnN2UlFi?=
 =?utf-8?Q?ZnBmMzTNRm9ov+ykLYcbKlB6G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10B660558B9EC74AA79F1F443561D871@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae640169-6387-4364-2508-08dd89cdcc8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2025 23:05:14.9478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiqmsqCvTe8PIqazlelFk28acMQ2vg1eG6lkXFh8o0XpdfHJYkaZ4nvkRLYNzvwI2hjZDqR6yW/AEsiJKqOqHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9698
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

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDA5OjM4ICsxMDAwLCBCZW4gU2tlZ2dzIHdyb3RlOg0KPiBU
aGlzIHNlcmllcyBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIGJvb3RpbmcgR1NQLVJNIGZpcm13YXJl
IHZlcnNpb24NCj4gNTcwLjE0NCwgYW5kIGFkZHMgc3VwcG9ydCBmb3IgR0gxMDAsIEdCMTB4LCBh
bmQgR0IyMHggR1BVcy4NCj4gDQo+IEEgdHJlZSBjb250YWluaW5nIHRoaXMgc2VyaWVzIGlzIGF2
YWlsYWJsZSBoZXJlWzFdLCBhbmQgYSB0ZW1wb3JhcnkNCj4gbGludXgtZmlybXdhcmUgdHJlZSBo
ZXJlWzJdLsKgIFRpbXVyIHdpbGwgc2VuZCBhbiBvZmZpY2lhbCBwYXRjaCB0bw0KPiB0aGUgbGlu
dXgtZmlybXdhcmUgdHJlZSBvbmNlIHRoaXMgc2VyaWVzIGlzIGNsb3NlciB0byBiZWluZyBtZXJn
ZWQuDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9OVklESUEvbGludXgtZmlybXdhcmUvY29tbWl0cy9u
dmlkaWEtc3RhZ2luZy8NCg0KSWYgYW55b25lIG5lZWRzIGhlbHAgaW5zdGFsbGluZyB0aGlzIGZp
cm13YXJlLCBqdXN0IGVtYWlsIG1lLiAgQnV0IHRoZSBzaG9ydCB2ZXJzaW9uIChhcyByb290KToN
Cg0KY2QgbGludXgtZmlybXdhcmUNCmdpdCBjaGVja291dCBudmlkaWEtc3RhZ2luZw0KbXYgL2xp
Yi9maXJtd2FyZSAvbGliL2ZpcndtYXJlLm9yaWcNCi4vY29weS1maXJtd2FyZS5zaCAtLXpzdGQg
L2xpYi9maXJtd2FyZS8NCg0KSWYgeW91IGRvbid0IHdhbnQgdG8gcmVwbGFjZSB5b3VyIGVudGly
ZSAvbGliL2Zpcm13YXJlOg0KDQpjZCBsaW51eC1maXJtd2FyZQ0KZ2l0IGNoZWNrb3V0IG52aWRp
YS1zdGFnaW5nDQptdiAvbGliL2Zpcm13YXJlL252aWRpYSAvbGliL2ZpcndtYXJlL252aWRpYS5v
cmlnDQpta2RpciAvdG1wL2Zpcm13YXJlDQouL2NvcHktZmlybXdhcmUuc2ggLS16c3RkIC90bXAv
ZmlybXdhcmUNCm12IC90bXAvZmlybXdhcmUvbnZpZGlhIC9saWIvZmlybXdhcmUvDQoNCj4gVGhl
IHNlcmllcyBpcyBicm9rZW4gZG93biBhcyBmb2xsb3dzOg0KDQouLi4NCg0KPiBTaWduZWQtb2Zm
LWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQG52aWRpYS5jb20+DQoNClRlc3RlZC1ieTogVGltdXIg
VGFiaSA8dGltdXJAbnZpZGlhLmNvbT4NCg0K
