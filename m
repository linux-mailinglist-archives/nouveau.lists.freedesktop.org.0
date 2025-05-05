Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDB9AA9EA8
	for <lists+nouveau@lfdr.de>; Tue,  6 May 2025 00:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FAB10E140;
	Mon,  5 May 2025 22:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m1e/5vni";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E77510E140
 for <nouveau@lists.freedesktop.org>; Mon,  5 May 2025 22:00:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dsq6lu4f7dFLA5Ii2I9Z6FrCtxshoLW0Jc5/3FTd53CiU+YwJaqIZloYbJGg8Zz0x3HxSQNihmutMF1To1gVpb43dFhZqzmEd89epPQCPCVfM9fnVXxXqlNuiLN2WrJvyBaw/7akvNRIxPXoQIvNLgoExj3xY61hfjYPxrwkoP7cdLxAnBxryfPj4JyEusNaKgoq9YyqZ5zgWNdo3FHL3gmk79ELIQyAAxpZPeivHmUSo8ryCvguwKnYQD1DFbXP4RLKJhEko6TT847O6rdBrhJ06vCkqnoWjrmgmQat2Ee7atKLqGld+gtMnloxunrTfKcI+yiuNJC48TXUid0mZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM6Wo9irfM404iigvPN5g6yJGC3ZZnJXgcdl7fgK81w=;
 b=BNOrlS1+s1u/NrefFyt4jczzWEgwMDBEQdRWeHIDmPBTr9yuzehIotX5y0DREM/tkbndiUBnT2n/WuWxKnX+UhhxJN34jDtVMSR0Uv59tvI3WPr3PiBRvd3eP/02LfdOzTnPKW/QhWtMafLD5ZiN0wf4p9e7Rnx39IQHQxWFB510SnWKoY7TbCRmao+1WlThBBpr3d5GLyAwLmictYhkHXY2EyfLn/Uz6hisrcDGNeVA0V5QeqeqWCalOyAahSp/pF9XJ34m47OnouKg24Id65g8NqR3H04ksXdChui4bTkb0boiwtVMHZ1aMEliqIRIJDAuBbO5P7vROGT7GhgC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM6Wo9irfM404iigvPN5g6yJGC3ZZnJXgcdl7fgK81w=;
 b=m1e/5vniTPs7RJGTjTuYBWDCrvy/Qlz4HhlIPALW5y7PvRAFirbB64iCgazSD9yLuMOzqiiISFRnuGs/bmLAdWHjhdPQc4LDfhoB2U8r2moUL5OERpNtZk9URLd0/uRZMSK8dQRh3iKB/4cH9Z1q4G8jLVkT5qSYXZVCq5sbpS5m9GpYo61Qpnyh+NW3d3J/xnr/sbypH259pxEFRzWH9IXOey1/mrUrOzl5JC25G8WjOaQZLXhVsws8bkYoorlqSkARO79TzWF13kuzxIx+R3Q5RZDcSLY5IVbi8yNfoLwgHr3aneebCMGHNggzbLItCk5Ml72M1Lx2ZsWgtY23fQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA5PPF916D632A9.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Mon, 5 May
 2025 22:00:51 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8678.028; Mon, 5 May 2025
 22:00:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 00/60] add support for Hopper and Blackwell GPUs
Thread-Topic: [PATCH 00/60] add support for Hopper and Blackwell GPUs
Thread-Index: AQHbuWAQv8vQgiOLykW3Ci6b+LfR17PEn5MA
Date: Mon, 5 May 2025 22:00:51 +0000
Message-ID: <4d4c006d179341b2d33f703108235cb20ee6601a.camel@nvidia.com>
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
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA5PPF916D632A9:EE_
x-ms-office365-filtering-correlation-id: 65af71b8-864f-4637-16c1-08dd8c204d25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZndkeC9kWlFnQXc4NTJTUStrVGZHRit3YkhaUVByRnd0OVdPQ3ZnQzBjc2l1?=
 =?utf-8?B?OHBsNVR3UnFrdTUzbVlTNEZLTi9DcVEzWWJoU0Q2NWwwTkZTZEJ4Y0pKKzFC?=
 =?utf-8?B?eU1DSGVqZmFZVWlaUC9ienpCeCs2eUdMcDM2cW8rd3gyU0JIT2owUVNEQ3I0?=
 =?utf-8?B?TzNKQkNON3BINk9JWGVPZUVwOE0xUmVzcWI0U0xsdHhiUURWQTcxRThLQjRY?=
 =?utf-8?B?TW5EWkdEeHZEeUhTa3gwbUN0NEFhMjg5NkpiQmlYYW9TZlVwbEs2dXI0VS9Y?=
 =?utf-8?B?R1BnTkZWUDcrbmk1QXRJaVJLdjhORURqN3Jwems1RzlWQldEMTlhcG0xTFZu?=
 =?utf-8?B?d0VjdHFZdmFXZDJmNXNQdWRlL2VnVVR0OUlCdnpPdmZiVStyNWdoWUhkdTNF?=
 =?utf-8?B?U2cwV3dWRnNXVkFvM1BWNmRGNjZQT1FLN0pmMVhZbzE1SHYwRCtCVjVST2cv?=
 =?utf-8?B?TmIrWnNiMXkxRFRwTzVDVGtoMW42S2p0Y05rcGN5RGNFa1pIOWJBNUFCT1RH?=
 =?utf-8?B?Qjg4K003ZXZ6dWVWOG9oTml3eG5ZVUx2VDVnUzJrcm9XeXYyRlRZcVRaRkpn?=
 =?utf-8?B?SWRrdmRsc1dROFpRdTMwTnh4VU9xcFhVei9CQ01yRHVqMG9QcmR5U0tHUXUy?=
 =?utf-8?B?TkV0K0JRbmxxUFo2QjUrL0lITHI3aDNvM2xIcTNSNFpLd2c3Ti9rUXpTeGNa?=
 =?utf-8?B?MzN1WUpuMjVqdjZqc3M2b3FqSjZ2RWxZVzZDUHExYTZQa1l5STgwY0JsK3FV?=
 =?utf-8?B?WVRGRWJ3Wjh4cmlhT0tGNzhFdVd6OVUwcmt6MExYQ1BFRWo3VVdDbThRRVhp?=
 =?utf-8?B?SUhNRmFPd3ZsK3dhTGNiQndsQUhCY1dieTlXdUI3ZHEyNmlBekR0Rk53WkY3?=
 =?utf-8?B?NzFET1pWbFpJeHRrSXRYZnFIZnErdVFLT01zbHMrcUwxZzhGNTJGUHl5TUhY?=
 =?utf-8?B?bDBFakJyVjV6VEltN20xT2c4Y2FKYjhzRCtqL2lhTzdtbzlrUkVQQTlNNzFT?=
 =?utf-8?B?bEEyUVJTTFRnZHB2ZTg3aTl0NHZ4T3pyaFdGdDNiWWNJWktvZkhvRnRMc0pM?=
 =?utf-8?B?WE5VNGlaM1FLMUFzS0JxVE9lOUJLWFpaS2pCZW1tS2xjbkl5V05DQXFHVXVC?=
 =?utf-8?B?R1dnSmtQQTFSTkUvcHRCQ1dnMUJKQ2lQeWgxMElzY2F3bFJCMGVocHB1WEVM?=
 =?utf-8?B?RGVxdDJ0Ukh5aXZiZFRNbm4vOXFpRTlsWXRJM2JjbUEwcnROUU5wcUQwWEQ0?=
 =?utf-8?B?UHBTVElLUGRMWlN0RzBkLzIrenBaS0xXRFVLaUZ1a09ncUtxRS8zQ29ic2Vn?=
 =?utf-8?B?ODdidEJXZnJFTktCRFltejJIUVVtRmZEY2tXM2hwajNkcjNmNnowTUc1VW1J?=
 =?utf-8?B?Rml0M3kyVXQ4NmppbHFzRkg0bHFtTnREa0JuNXdEa1d3VWUwUU9MTWFsaUc0?=
 =?utf-8?B?ZmdpLzVXZGZ4cDI5Y01kblp5Y05IZU1TZ0FJOUNRRjdHeWkrN0g4Y2V4RytL?=
 =?utf-8?B?Qkl5cTdiUFBQRjFEMmhNWVd0Q2VsUXhBZWRDbXFka2dpSzYwQzVBL3hWZjNm?=
 =?utf-8?B?YVJUZXlCVDF2a2VMMGp0YzVqZlIvYnFVNlZMYnFTNzEwY20rTVN4RUpZeTJQ?=
 =?utf-8?B?Sm4xSXR3V0hZWllzYUdQNnMxKy9laFg1aG1vd2ZwODFpY3J3K0JOYWUrWXNJ?=
 =?utf-8?B?eXVKWEdvdUpBUE11Z3BGZUI1QUFjbGFuazhjYmR0dmxsOWlYRHhtUDdRVU5S?=
 =?utf-8?B?cXhaQVZMT3pWdTJmU2JqZmdVdHdPVXVZUWdvS1lHQ1UySm9xUDFMbUR4WFBT?=
 =?utf-8?B?SWdhZ2I3OWtNVlN1L3plbFE0ZnBNYzBzOE1oeVB6TVFLaFptVWtwQk9JNi81?=
 =?utf-8?B?SHpHYzJHdk9PNEVQdEhGNk9NNDZ4ajljV0p1am5CMkpzSHpUNVYvK0pkeTll?=
 =?utf-8?B?QVdyZUtrdDVXRThyVjZ5N2lqZUlweFZrb3o5aE1WNTE2MnZiYnU0ZWZQSXUy?=
 =?utf-8?Q?kozYwE4v3Htgbsn2fahMzCDLtk78y4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2lxdG5rdk5teTM0VTNFSUR3R0V1L0ZXeFIvei9TUXBMNWlKQ0Z6U29hTlRG?=
 =?utf-8?B?YjdBS0FlUFBWdUIwcmlWZGZhQWhaUG1uUmJvUmI0WEY3dGFHQVpBUGxqdkdK?=
 =?utf-8?B?ckg3eTFjN1U1b0M0cElpUU0vNjQyTVZpTWxtMThPMFdVWm1mMXZLTkYwRnRo?=
 =?utf-8?B?cjgwQ2xoYk1OWkcxVWlma05lZXFsTTlhRTNmQ1FSbzMvbkxLeUZ5OG1EOXp3?=
 =?utf-8?B?SE8rOVlyMk4rcEVBTlU0RkY1d2FnN1ZaMlVZZUliWEJiU1JadlVTT0QvUjFH?=
 =?utf-8?B?RkF1WnM2N2c4RFkvdFNiS2g2ZDdjM3hXWDMyWk1Oc0Z3N3ZXMmJXWTlMTndW?=
 =?utf-8?B?RW1Id0pia2VNeGE2WkRTYldaWmZwamtra2pIK1dCbkQzVVNzblFTVGhNbXZW?=
 =?utf-8?B?akNzMElsY0ViWERJQkkzU1FWbDZsODUvR2xWcjZ3dDhFa1d5TnM0UVVObFY2?=
 =?utf-8?B?MnFoUVBRTHFBUWovRGhJcXB1S3IxOENtU21pU2QrcGlXT2lFYjNqdnRHZlJr?=
 =?utf-8?B?K3BOU3JOVFFqTGFrOW4yVWdpdk1EdGp4dkJlL0Z1KzVaRUVWMDVoalAwOFR4?=
 =?utf-8?B?T1Y1RnlTUHoxY1k2UC96OFNWeDc0OEZlMFlsRm1xWU8xbkFZNCtYUmNiay9w?=
 =?utf-8?B?dm51RU1qMThDU04vcExEQkROUkFkWDQwbThOOTBzNjVtMTdWT1kxZDRkR1Jn?=
 =?utf-8?B?dlI3akUxNHkwV0FnYU82M3lIdzZGOVBCUFYxeHZwWEpRNkczcjBYYnRBeGFY?=
 =?utf-8?B?cys2Q0lzbFVKZVZrUmk1dmZqMlhsZURtcFA0TlNjdDhHRGxyWHpjTGd1OWdv?=
 =?utf-8?B?OEY5eDZ0SFlOZm00ZDFyTGpDaDNGZmNEeGhjcU56WlRqY01XVnoxdmUvaWR2?=
 =?utf-8?B?RHorK3gzSm5NMlRVeE44dVIwc1hIQUM4YjJURTY4UWJ4S3NoZXg3UDFPekRR?=
 =?utf-8?B?eFJKVEJaMUlaUTE4SkdnRjg5ZUkzUnF3dmRDOWpDM0tpeEVsT2ZUem8rY3cy?=
 =?utf-8?B?YnhPaUtveGFXMGZnRGxZMFU2WUgxNHJyeElvb0pYMFZMTEw0Qmtib3BXSVpV?=
 =?utf-8?B?UlFnNnVpN2JZcFJwWHAySnpHSS82Ui9QeEVqbGN4QjcxOFRvc09vT1dBQ2Jt?=
 =?utf-8?B?cVZJUXBrN0hUNzNCWDgzVzRtM09PUXlNcXczY2M1ekVMQWpMWFQ0ZUtoNUQ0?=
 =?utf-8?B?MDVtcTVzM1lFdWxUdkxmNzU2Wjg1U3M1Qm1wQkFrOUJFUnBPNjZETkJ5RHN5?=
 =?utf-8?B?Y0M1Tnh1aE1FZzBxMFRPc05HYUlRWGhYbTBFVGdNWWxDa0VrWEM0RlFOT0N2?=
 =?utf-8?B?dExTTExTc2E0bFlwNERoc2tUVVE0cFd5TFBQNkw1c29YcnZ2TjJyblZ4TGxj?=
 =?utf-8?B?TXNmME1vd3M3QWo5YzhiSTVYNjloTVNjbkhxVklVdVVmcHhOTWI1VGpTMVV6?=
 =?utf-8?B?b3dwMUc1dnhGbEVBblY3MGFkM2JzS1Z6VmEwcUhCVGQ4MkNvODZkb3Ezdjdo?=
 =?utf-8?B?OGZHNGdtV21MdDhHNDd5N2E1RzVsY05FL1VTbFhrcVB0Y0FoUXZiOEs4cHgz?=
 =?utf-8?B?KzdWZ2JGTzBaalhCaUlYVnJDM1hTUUhCZDhoU2J4ajBlZ0g0RytSZEJSUzg1?=
 =?utf-8?B?bmYyeWt1VzFIbmVSU1d0R1VxRTdEdzFiT2tWcElySEJOeXl2akIwdENDVEsx?=
 =?utf-8?B?am5sdUNMODdVWWtEWXVkam44T25vMjZhZi9aMWFiOEVhcFNQRlpGazNNdTJS?=
 =?utf-8?B?dEszN1VnUjVWZEVsb0J6ZWVJb1ZyM2NGbDFkZUNTQy9oYmhDcWdRZFBoRzF0?=
 =?utf-8?B?SloycVhEMDBEeWF2c0NhcmVCVU1mYmRyN0Z6ZFB0STdpUkIvQmdwRmZnVGxK?=
 =?utf-8?B?dHpKdG9MR00zb3ZBWlFrZkl1L3NwOWkyOWNKYTRPNXRMeVozR2JlWWJ6Rkx5?=
 =?utf-8?B?Q2FpMmNWRlQ1UnVkRHJ0RkFYOHZ3TWhCeUtxNkw3RGg4RjJvN1pjOUhhWThs?=
 =?utf-8?B?MEIxVVVTdWhtL3RJT0RMKzZKL0p0VzcwWkppbHZRUXRGTFdGbld1Q1J1dzAx?=
 =?utf-8?B?RnZicTVoVFFJNzhRV0lxREZvSHpVMkNjK2lhU3UyQ0xxVTMwUU5ybnhYMjBm?=
 =?utf-8?Q?3kgv2MZrBkeX/JkrYjset2Uvc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA31E9677037FF4A8E51A69BFEF91EC7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65af71b8-864f-4637-16c1-08dd8c204d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 22:00:51.7533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7ncM8+YBSVmdbpC2iyk2mwKM3wHUZi3iZGMk2BHlMsiqQP1jqgUnM3wRlUI0RiQ3kfcowBzvWCgWPJMZSG3JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF916D632A9
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

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDA5OjM4ICsxMDAwLCBCZW4gU2tlZ2dzIHdyb3RlOg0KPiBQ
YXRjaCAxIGlzIGEgc2ltcGxlIGZpeCB0byB0aGUgY29uZGl0aW9uIHVzZWQgdG8gd2FpdCBmb3Ig
Uk0gc2h1dGRvd24uDQo+IEl0J3Mgbm90IGtub3duIHRvIGZpeCBhbnkgaXNzdWUsIGJ1dCBrZXB0
IHNlcGFyYXRlIGluIGNhc2UgaXQgbmVlZHMgdG8NCj4gYmUgYmFja3BvcnRlZC4NCj4gDQo+IFBh
dGNoZXMgMi00IGJ1bXAgdXAgdGhlIG1heGltdW0gaW5zdGFuY2UgY291bnRzIG9mIHZhcmlvdXMg
ZW5naW5lcyB0bw0KPiBzdXBwb3J0IHRob3NlIGF2YWlsYWJsZSBvbiByNTcwIC8gbmV3ZXIgSFcu
DQo+IA0KPiBQYXRjaGVzIDUtMTMgc3BsaXQgdXAgdGhlIEdTUC1STSBjb2RlIGludG8gbW9kdWxl
cyAocm91Z2hseSkgYXJvdW5kIFJNDQo+IEFQSSBib3VuZGFyaWVzLCBhbmQgbW92ZSBhbGwgdGhl
IHI1MzUtc3BlY2lmaWMgY29kZSBhbmQgaGVhZGVycyB1bmRlcg0KPiBudmttL3N1YmRldi9nc3Av
cm0vcjUzNSB0byBtYWtlIGl0IGVhc2llciB0byBjb250YWluIHZlcnNpb24tc3BlY2lmaWMNCj4g
Y29kZS4NCj4gDQo+IFBhdGNoZXMgMTQtMTggcmVkdWNlIHRoZSBhbW91bnQgb2YgYm9pbGVycGxh
dGUgbmVlZGVkIHRvIGltcGxlbWVudA0KPiBlbmdpbmVzIGFuZCBlbmdpbmUgb2JqZWN0cyB3aGVu
IHJ1bm5pbmcgb24gR1NQLVJNIGJ5IGFkZGluZyBhIGNvbW1vbg0KPiBpbXBsZW1lbnRhdGlvbiB3
aGljaCBjYW4gYmUgdXNlZCBmb3IgYWxsIGVuZ2luZSB0eXBlcy4NCj4gDQo+IFBhdGNoZXMgMTkt
MjAgc3dpdGNoIHRvIHVzaW5nIHRoZSBoSW50ZXJuYWx7Q2xpZW50LERldmljZSxTdWJkZXZpY2V9
DQo+IG9iamVjdHMgcmV0dXJuZWQgYnkgR1NQIGR1cmluZyBpbml0IGluc3RlYWQgb2YgYWxsb2Nh
dGluZyB0aGVtIGZvcg0KPiBlYWNoIG52a20gY2xpZW50LCByZWR1Y2luZyB0aGUgbnVtYmVyIG9m
IFJQQ3MgbmVlZGVkIHBlciBGRCBvcGVuLCBhbmQNCj4gcmVtb3ZpbmcgdGhlIG5lZWQgdG8gaGFu
ZGxlIGNoYW5nZXMgaW4gcjU3MC4NCj4gDQo+IFBhdGNoZXMgMjEtNDQgYWRkIGEgYnVuY2ggb2Yg
c2ltcGxlIEhBTHMgYXJvdW5kIHRoZSBSTUFQSSBjYWxscyB0aGF0DQo+IGNoYW5nZSBiZXR3ZWVu
IHI1MzUgYW5kIHI1NzAsIGFuZCwgZmluYWxseSwgYWRkcyBzdXBwb3J0IGZvciA1NzAuMTQ0Lg0K
PiANCj4gUGF0Y2hlcyA0NS01MiBhZGQgc3VwcG9ydCBmb3IgR0gxMDAgSG9wcGVyIEdQVXMNCj4g
DQo+IFBhdGNoZXMgNTMtNTYgYWRkIHN1cHBvcnQgZm9yIEdCMTB4IEJsYWNrd2VsbCBHUFVzDQo+
IA0KPiBQYXRjaGVzIDU3LTYwIGFkZCBzdXBwb3J0IGZvciBHQjIweCBCbGFja3dlbGwgR1BVcw0K
DQpSZXZpZXdlZC1ieTogVGltdXIgVGFiaSA8dHRhYmlAbnZpZGlhLmNvbT4NCg0KSSBvbmx5IGds
b3NzZWQgb3ZlciB0aGUgRFJNLXNwZWNpZmljIGNvZGUsIHNpbmNlIEknbSBub3QgZmFtaWxpYXIg
d2l0aCBpdC4gIEhvd2V2ZXIsIEkgZG8gaGF2ZSBvbmUNCmdlbmVyYWwgY29tcGxhaW50LiAgRXhj
ZXB0IGZvciBhIGxpbmUgb3IgdHdvIGhlcmUgYW5kIHRoZXJlLCBub25lIG9mIHRoZSBjb2RlIGlz
IGRvY3VtZW50ZWQuICBJDQp3b3VsZCBsb3ZlIHRvIHNlZSBzb21lIHBhdGNoZXMgcG9zdGVkIGlu
IHRoZSBmdXR1cmUgdGhhdCBhZGRyZXNzZWQgdGhpcy4NCg0KUGF0Y2hlcyA1MiBhbmQgNjAgYXJl
IG1pc3NpbmcgZnJvbSB0aGlzIHBvc3RpbmcuICBJIGRvIGhhdmUgY29tbWVudHMgb24gcGF0Y2gg
NTIsIHdoaWNoIHdpbGwNCmhvcGVmdWxseSBzaG93IHVwIHNvb24uDQoNCg==
