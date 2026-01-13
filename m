Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71804D1BB62
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 00:26:13 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 681B210E591;
	Tue, 13 Jan 2026 23:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U7PgUqrN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9D51844CAB;
	Tue, 13 Jan 2026 23:17:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768346261;
 b=lS47lUCZDNVbq+XlPnL0kOGPUCnocq1NJB1szjOyOYwsEf6QoTUEiSQ9zY9SIMMgsmYYA
 WzXZ4kMIOq1AgKxKtfatr5EroyHDj5Hfx6Z9gMV52KcvHRc1tWY1PG6oeKfvPWjIw0M7B7b
 6z8p8Ypi+dymlCceU31bqYI47wzkpDs9+GHGobeHt0LqWHSdVUc+TeOWM4tWCiz6PWAFYcI
 FPHRbxH+ZBLyv9zUwjZvfLfVmCjZN+oLBAWmlixKtbu8Wx70s/2bMFt6vx41R6Jlkq96bJ+
 dBDRV7L9KBu7yuZ/9ug/iMlpYHQVzvgAXWsK5fwmnQZ7/si+TUn93yOODhqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768346261; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=B8QX3Ycw+y/XGcu1JHlQWpl0g6fV6Mqzpm/UXsIgCZU=;
 b=QB7EUYRhi7k9IwSpraB4cxG7YnZ4obveBtMzVhrg7KoGY+G9hP+G6jJ4dtBD9xZ4XcL3P
 2+vqKsecVa/IiGY314xAdDxTAfjX57y01Isuh8ll+AqVZ+ih5R/T1T1HSLmth7Baf7PYj2J
 /ggj6mC0qgWGKR8GTb2Gbdm/CdTjpp/nV+V8FHRdOOnJHw9k6WxlDgEGg8U9qxOPjxWaaYH
 sTpfX2OyGLZ/5foLqayDfcmUUrK8m3JZjklTZx9/x1gMPJh4LyurIlKh1VJKqLEHgSfJihA
 3Mlhi0qPU7rFDuKalVEw2t8BNA2asWyenjUcMk42Zo4xlHfBrKgj1N2QWuJg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3AA8B44C87
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 23:17:38 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011032.outbound.protection.outlook.com
 [40.93.194.32])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF38E10E13C
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 23:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMQDTkpWuoqOJ/dHjj0cOC2GgJPtwsZjSV9N+J2tZPQHXedqxjG6ZBvsaIbXFzPTRVAI6or6570tWCV/iAaX3zuMS0re5IfdUN3bAFoR0mvoT0YUKLeO1q2ItjlPSYEdC5UOgsS9vmPPpFnVJcuT+cSpQUcpCi53GvYI/qbtJNojH8hqpTn2la5W5X4k5xlMsCZKCo0xWfnyzpho6V7/3dKBRSJWnXBGaUj/znptvcnIzps0noaXnFjWMLwXQcHj5qhquTrN8TYOHTsW92Oh7Z4UBzd3JCmF3NrhOFHq6TH5isPacSPoIGM83B/4ytyVJwbO73g7Jz5XKT1HW+MUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8QX3Ycw+y/XGcu1JHlQWpl0g6fV6Mqzpm/UXsIgCZU=;
 b=w5BG+0SJ8JXvEmbB0WhExp7SbrEZVjWzTLgKtFcGCiijq0jvnN0G993xc22NSecC8FE43Iy/xvmjLGIZUQGjpoeF1wyvLXPiqytwGVsnDVmHfCgsb/H6RAw+mghjRSlIyduz9sELIrKPkZwzNsaPK+nT5stbwqHk94SvHAEvoGrEaO6/dIC1tCJiBs5Z08Mh8+ndvTRkTM/z+gs3Ef9rwbpTOrmYGLFQuE2OLrGRw2MKIX2OJxniTKi7vwG0Aw8BwBwLQB3m3uWk7Tv5c9PG/KNFtf5a/iOjDJyMlgpkaJBkSksWA0nQlMJZ9mExsJkXJqoHBwK3d4L5J4yZuDjgOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8QX3Ycw+y/XGcu1JHlQWpl0g6fV6Mqzpm/UXsIgCZU=;
 b=U7PgUqrN9en9HLPjTUB49dYPpdB5yIbDEKcC8eHunHuEJWgUVGQSUrGsJlDxJlH/n2Hd5+hkWjjzSsI4fW5BeMJSnZcCqEQH21TAdXn9I6MGdbT2eWC9oaZef/8QYD8nWTVXU5WdYodlNG+dMRE9S8ejLxQxbpwI00n34h0Nimoj+CcpuxPbDfkYpemIR1vgRllOsy7Qnhs4owWKYz56B488NIiio4TTwasIzFEFjFIzGvUnZZBFyozb31e2jEDd9vg2mLJYL3pRk5t8X9Tu+wl3G2giXu7h7YfwDi7NSRF8xfKrt0zP4DjmKX/z3Qzz6dbzq+JpX5v10SJRVwqX7Q==
Received: from SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 23:26:03 +0000
Received: from SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69]) by SA3PR12MB7923.namprd12.prod.outlook.com
 ([fe80::6453:c4e6:6f5d:5b69%4]) with mapi id 15.20.9520.003; Tue, 13 Jan 2026
 23:26:02 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Topic: [PATCH v4 0/9] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Index: AQHchN+VGtE8DecVzUS2y/2E1Tf4uLVQujMAgAAEAoA=
Date: Tue, 13 Jan 2026 23:26:02 +0000
Message-ID: <7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com>
References: <20260113225408.671252-1-ttabi@nvidia.com>
	 <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
In-Reply-To: <DFNUAZQOJVCP.1XU9MQT44EEYP@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR12MB7923:EE_|PH8PR12MB7027:EE_
x-ms-office365-filtering-correlation-id: c33d484e-1c95-42b7-4d96-08de52fb1e26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RGZ4VHd2WWliTGhDc2hidG1uM1dUem1aYVVVb25URjdTeldZRzFCRnNHMUlE?=
 =?utf-8?B?ZTZzOXRNVnZramVRS0hUb0d0Mm5CVkI1QlkvdFZuUUF3RFk0TmdHSjhsamtr?=
 =?utf-8?B?TFBZQ3d4NjJad0lkRk4xMGYvSlV5NDV4MmVzSnZaaFdZMXU1NDhwR1JTekY4?=
 =?utf-8?B?Y3h5SjdtYjJBcStRMVM1aHdpOHlwRTRMWmFYRzVUYTJveTBIWnZiY1JBSUZ1?=
 =?utf-8?B?UDFnVE9OcUV5R1VVSzhGaHdjblpIOTROZElBNFIyTTZMN1V0dENjUTh0b3lK?=
 =?utf-8?B?R01Vc0U2c3F5THRpREMveHh4WXcwMjRmVmlkRk9RMVJNYWVVcDg1ODU1Wkxn?=
 =?utf-8?B?TnlKTFVlRDJUNE81MnlHZjlZbW0zQTg5b1BEOWNDU1REdUFqSUR4S2RyQjZw?=
 =?utf-8?B?RmNBNzMyeHE3MXhtZEF1ODIvK1h2NzJSSVdaNGo0MFJqaWMzbEV0a1JEeHRX?=
 =?utf-8?B?UDY0dnZwc3N4dlpTdUpXQzBxNm8yV1dEZlltdHlVNnNuZ3BJb3BHQW9wb3o3?=
 =?utf-8?B?dVE3eGlnRFZObERUNkNpQ3VUcTE4dTgrY293Nm9ET3FTaWV3eld5enV5a1dL?=
 =?utf-8?B?WTBrWDY4dlprQVJQVTFsSEp6Wlkxeld6MTJCV08vYTIreWwwVU1rb3h0Szcx?=
 =?utf-8?B?aWJzRGd5L2F6bjRYSXZxaUl5ekVZTk5Ba3d3YUVpQ3E0QkJYaTcySWZzM2ZC?=
 =?utf-8?B?bFVjaW43NW13Rm1xL2xCYU1aeG9kOTZ4RjZwOVh0VzRrY2o0NXJHV2htajJN?=
 =?utf-8?B?Ym10b1pGVG9iNlN5ZVJHM083b3R5Z1VGYmJaTEpjSFdkV1NBQmlMNnhoQm0w?=
 =?utf-8?B?TWh0eHkxcXd0dXR1L2lRVzM0SG1RTGRkT0k0ZGFMSEJFdTl1ZWp6UWJxdUh2?=
 =?utf-8?B?ZzgwVXpXOG04YS9ZMDh3ZDZRVEhiNThrUVpPb1Q3ako3VkZDS0FpcnZ5QWJ6?=
 =?utf-8?B?aVdYRDVXZUw1WWwyS3VqOU1RRzNtdmc3dTMwR2NFMnkvYW9UZ0M3RlZYclAr?=
 =?utf-8?B?eDZVdXFaamZWSXVHdHFaM3FHU2pHNlp0VHVQMFREYXJ5Q0JyM1RwZGVuaFRi?=
 =?utf-8?B?eTRXN0orOE1rQmZZM0l5T0hrQnJpOEp5Q3FhMkxJeWZNZE1oYTdaOEVsVmJG?=
 =?utf-8?B?MERjMjBscWsxdjBkdTNzdzllRG5MZ2RqWno4djNhSVcwSERsbVNQWDdPb1Mx?=
 =?utf-8?B?Uzh5RnRFUGVwbUU5YnRZRjc5aFpJTDJ4b2NJMDZ1SWtaN1BVKzdTczBtNEgw?=
 =?utf-8?B?YWVNVlVlbHBISStONGJIYjJNQzFnM0RqMUh6Q1lUSlpLTFdtblF6LzhJODRn?=
 =?utf-8?B?VitwZU5BUUxPVlVmVmg1K09ZWnYvZ3JPckp4VnppOHBUSVlSNDVHWS81Um54?=
 =?utf-8?B?U3RDb1VibGxFU2xDekNmRitIKzhVTlhhK2xkWDNmeW0wdW9uWXBOU0xPczc0?=
 =?utf-8?B?L3dOWHBic21kaXlhQUNyNnhVMWlHZHdQd0lUWjR5djFtMlFYcWhxamhpVitM?=
 =?utf-8?B?UnhZckZrR28wc25ZY2hBWlJCcGduVVBtSVRkTkxBMVdiV3RUTzVRRWpOeDhK?=
 =?utf-8?B?b1dPbWJxSTVSQlREWGRIRDVCdkduTWxvNk93TVl6MDNYbXNIZEl3MnlCcXVp?=
 =?utf-8?B?N09OT3gwY3ZCcnlDNU5sMzdtS1N4OVE5L2xoQnNhWSs4UWdEcjUyeXRVTzNF?=
 =?utf-8?B?RmJnYk1rRDVzbHcyb1lLWGI2VE4yRVRsLzdiTkVYUDBHQ01vcmkrdEhXYWp0?=
 =?utf-8?B?SUl3VnNPSVJaQzRjTHg5UWJ5ejMwaVJ3RU5LaWNEcGdYU0xMS0Q3K2FqS2ha?=
 =?utf-8?B?KzJoaXV3NnRQZ3VkditTOUNVdUFsdzNIREdjM1VLR0VjMVl4Z2Z5OG9acmY1?=
 =?utf-8?B?ajZDNElqRlJkY2xIbFFNTUtuVXNxODNDb1NxMmtpcm1BT2M4bUVDeW1rTzhD?=
 =?utf-8?B?dXMvaEhNVk1NL0xKQVV4cEtLT2JMcVJiR1Z4aCt0eTNMaFhpaDh0azJBSGxW?=
 =?utf-8?B?NXNkZ0dhdGVHc2tKZm9aZHU1SHoyRVk5L0JjMis4aFNTSnNOQjFWSzMweURO?=
 =?utf-8?Q?R9Gjep?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR12MB7923.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmZDNzl4NmUrZkdYMXIwak5hTTRjTlhUcm94ekxBOG0yK1JuYlZzSzR3aEdF?=
 =?utf-8?B?SEhxcVBqOXVjZEdYMGs5dko0SE9aaXFpTUxYdkg5aTQvdFNlR2JOcHp3Y0ta?=
 =?utf-8?B?bmpGUWRCNHBxTGE3OWk1YkV2eFRnT3NkalJSTTlMSU05dk9HaUpjdCtWY0x3?=
 =?utf-8?B?WVlwSG1Ca2VQN1BmWGk1NUJXYXZJVXJtQ3o4Y2dzVGRUS1VPTldTQlJNWm55?=
 =?utf-8?B?b2JzcTBKbytvTE5NeFE2SFUzNHJET3JhdTdsRGllWExaS2pJYXQ5a0RqL08r?=
 =?utf-8?B?dDlCeHU5L0VobHBLZ216bHV4RWpINWxTWG5oSFk0bG9YemZvMU42dlJ1U1Bt?=
 =?utf-8?B?NFA3ZkxQei9LYVpHZjJ6V280YVdyenBPNlVmWVJSemUyQ3UzbXkzbHYyWDF4?=
 =?utf-8?B?QVhSZWtqMGxHQ3IvbTZ6cVBwRXRCSWlUUjI1alhLcG93Ynh4dy9YNE1aM0tT?=
 =?utf-8?B?djhjc1laYnZudVNKMEFBZXUxS3A2QlAwSWtud2NkSXVWUGw2UGNyVDZqQWk4?=
 =?utf-8?B?U2tWdTNXTWRyYkZlQWJSSysySzZHYzZPREdpY3lvVHI1b2xSVW5ERUljTFBZ?=
 =?utf-8?B?M3Y3cEsya0lrN3QyRlFxZGpvcmV2c0R0L3VTMzl1d1lKeVdLdnFtWG1xY0Z4?=
 =?utf-8?B?VGFHMHhsd0MxMDY5bGRVcW9kTmppaktQVlBuU0hXOGw4cjV2THhrbmRQUGxK?=
 =?utf-8?B?eEtrdmViWXdGazEwREpHRldwcW14bGp5UzVId1ZqQXg4cW5CYTRFSDNia3Rt?=
 =?utf-8?B?NjVlQjh6dmtENy9POXcvb2w1TFhTdUZmcnN6QzRJVzROM1F6YlNQcVRsZnU5?=
 =?utf-8?B?Q3hLOWtwTFFHcVA4VVFjZ3Y4ejVJY1dhcS9MenhxcFdVQldrc3EvanJiTGlx?=
 =?utf-8?B?eWFXL25jYWlCT0hoRjhCcEhZSWU0THZ0VFFBK3lzSnd5SndYajIwWkNoeGcw?=
 =?utf-8?B?eVNnRkFHZU5uNEdoNGZ3K25QVWpBM1ZQTVJJOXlrY0IzSEhyRFdDbEJBMDNh?=
 =?utf-8?B?bExJNEg2d3EvVElqZ2JqYS84cHFkWlRkN0FwL0swTmEwUzNhVlFOOHd4QTI4?=
 =?utf-8?B?eC9YVFFtVEFPcDBkNzRWelhZbzZQcTFHQW1Gb01UNVdlUHh5TTBXOEU5M1dR?=
 =?utf-8?B?YjBFejJDbkJXQ05mbEp1U01Qb0lLK3BJbkxvVTJOM3BXWTg3YThoT0sycENJ?=
 =?utf-8?B?OTVCMnhCS3pQcmNnTjgxU3A4YzJZaUtQdnVDbXlpN0tsRTk0UVRTdnBIUjc1?=
 =?utf-8?B?SCtlTkZhelliUzU3V3ZGYWVsRHU0LzlGNlhTNENUWmZTUllpRHdOY3ZJWVFS?=
 =?utf-8?B?Z1N5cmRpeG8zVWxZNmFJZjdoR2UvY0J4NWEyS1hHZVFyMnRiK3haMXRQVStJ?=
 =?utf-8?B?eE5WT0FrZ3RiSzdRYStCL3ZXMkdpcVRmWWJHcVNUZjdPbzRFNE1mb3pONFNE?=
 =?utf-8?B?NHNSMUkyV09pY2hlRTE1VHpadlFJYmJYb1dleVBiclhtV3E1R1h3RDF2TmhO?=
 =?utf-8?B?dll3R2Z6cSsxdm90UThjb3ZjYU5EblJPbjlOSmkyU3AwRE1OWnRXdEk5S0FG?=
 =?utf-8?B?SDdUdGtUb1hwSUhtR0swV2x4N211eVJhb0tMRXFXOHk4OVdXU2NMYnB5K05T?=
 =?utf-8?B?NU9GdjB3d2lUWCtFTnpWdkNYV0pGaUtpWnpURTBRaEtPdWxDRkF5VjBsY2NZ?=
 =?utf-8?B?RXBDNDRGeDZ3dWIyOFN4VHNPUGhxUDh3Mnhxc3RBL3NnYUd4K25TK1NSd0ZC?=
 =?utf-8?B?SWhENzF0YlMvQitRNkttNVQvVUhlUlhTMUhaWWZYaUh6MnUrWUJiQzNGYUUv?=
 =?utf-8?B?dU05bWJHQWZJaWpJRXJXWitEWHdTN3M2RWFDSkplRFR3aTREOU93bFVJWTNP?=
 =?utf-8?B?RW1BdmozRjFVd21MR2FXYkhwS3VaNlk4U25WbHZ5RVdFbWNNRUhoSVZDanJ1?=
 =?utf-8?B?d1o3a0NaL05oMlppcThGMVJyWmdHRzVka2x6YUFIc095MTcrLzRDbnBwaDc0?=
 =?utf-8?B?bzVnR2R6SFZ4TWdlZEZQektnS0ZITzdvMVcyWVZxSW1KT3E0OHpJOXJZNzZB?=
 =?utf-8?B?Z3JIVVBjQ1p3SFNwU2N2RkVBM1psbFRyR043ZUxXMnpPd2VTYmNsSktWbEVn?=
 =?utf-8?B?R3FPdFpZUDdvWk9VNDRUY001Q1I3cHFLcFN5YVRXQVpCV3VsZm80d3VrMnl3?=
 =?utf-8?B?S3MyRzU2UFBYZFlsbTh3aFZZNXN2d20yRktVbFFDckpsUVNOWVlnYytOa2Zh?=
 =?utf-8?B?N3A5eUh1MUhWUnpIL2RLc1VWeFlWZGxXakdHWDVCcExqOCtQTkE1NHlCNU1m?=
 =?utf-8?B?enA1OTd0WGRrdjFlUVZSSFN1VVVBaE51TGEySklIVjRmRlR6djAzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DFC6C7BF8D52D4F90EBB8B8B30D3A1D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB7923.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c33d484e-1c95-42b7-4d96-08de52fb1e26
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 23:26:02.8952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 353JxzPPXH0VcMmVhxxtbO7gwBzyIMJCzKKvB6VdytYJm7K20KWBsA8+Pwu/AkNIv5Wjop6EtZL+Ib1gnR/1EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027
Message-ID-Hash: SS7PEWDIU6PCTHOPOYI547IYCML5HPVM
X-Message-ID-Hash: SS7PEWDIU6PCTHOPOYI547IYCML5HPVM
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SS7PEWDIU6PCTHOPOYI547IYCML5HPVM/>
Archived-At: 
 <https://lore.freedesktop.org/7951d14aa8c2aa0b55834cdaf6ddee3d30302421.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDAwOjExICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiBUdWUgSmFuIDEzLCAyMDI2IGF0IDExOjUzIFBNIENFVCwgVGltdXIgVGFiaSB3cm90
ZToNCj4gDQo+IEl0IHNlZW1zIHRoYXQgYSBsb3Qgb2YgdGhlIGZlZWRiYWNrIGZyb20gdGhlIGxh
c3QgdmVyc2lvbiBoYXMgbm90IGJlZW4NCj4gYWRkcmVzc2VkOg0KPiANCj4gPiBBbGV4YW5kcmUg
Q291cmJvdCAoMSk6DQo+ID4gwqAgZ3B1OiBub3ZhLWNvcmU6IGltcGxlbWVudCBCaW5hcnlXcml0
ZXIgZm9yIExvZ0J1ZmZlcg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0RGMTlL
VFFUS09TOS4zM04xS1Q5V05MQVVPQGtlcm5lbC5vcmcvDQo+IA0KPiA+IFRpbXVyIFRhYmkgKDgp
Og0KPiA+IMKgIHJ1c3Q6IHBjaTogYWRkIFBDSSBkZXZpY2UgbmFtZSBtZXRob2QNCj4gDQo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9ERjE3VENKUE85UlQuMkJLMjhaT1FTRjlTTkBrZXJu
ZWwub3JnLw0KPiANCj4gPiDCoCBncHU6IG5vdmEtY29yZTogUmVwbGFjZSBtb2R1bGVfcGNpX2Ry
aXZlciEgd2l0aCBleHBsaWNpdCBtb2R1bGUgaW5pdA0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL0RGMTdYUFQxTVU2NC5aWFQ0TFNYUjlDSUdAa2VybmVsLm9yZy8NCg0KU29ycnks
IEkgY291bGRuJ3QgZmluZCB0aGVzZSBtZXNzYWdlcyBpbiBteSBpbmJveC4gIEkgd2lsbCBhZGRy
ZXNzIHRoZW0gaW4gdjUuDQoNCj4gPiDCoCBncHU6IG5vdmEtY29yZTogdXNlIHBpbiBwcm9qZWN0
aW9uIGluIG1ldGhvZCBib290KCkNCj4gPiDCoCBydXN0OiBkZWJ1Z2ZzOiBpbXBsZW1lbnQgRGly
ZWN0b3J5IHRyYWl0IGZvciBEaXINCj4gPiDCoCBydXN0OiBkZWJ1Z2ZzOiB3cmFwIEVudHJ5IGlu
IGFuIGVudW0gdG8gcHJlcCBmb3IgTG9va3VwRGlyDQo+ID4gwqAgcnVzdDogZGVidWdmczogYWRk
IExvb2t1cERpcg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0RGMThSRlgzSUhW
UC4zR1lOSklZQUZGSlU2QGtlcm5lbC5vcmcvDQo+IA0KPiBFc3BlY2lhbGx5IHRoaXMgb25lIGlz
IGEgY29uY2VybiwgSSBkb24ndCB3YW50IHRvIGFkZCB0aGlzIGluZnJhc3RydWN0dXJlIGFzIGEN
Cj4gd29ya2Fyb3VuZCB1bnRpbCB3ZSBsYW5kIHRoZSBmZWF0dXJlIEdhcnkgd29ya3Mgb24uDQo+
IA0KPiBBcyBtZW50aW9uZWQgaW4gdGhpcyByZXBseSwgSSB0aGluayB0aGF0IGRlYnVnZnNfbG9v
a3VwKCkgcmFyZWx5IGlzIHRoZSBjb3JyZWN0DQo+IHNvbHV0aW9uIGFuZCBtb3JlIG9mdGVuIGlu
ZGljYXRlcyBzb21lIGtpbmQgb2YgKGRlc2lnbikgaXNzdWUsIGxpa2UgaXQgZG9lcyBpbg0KPiB0
aGlzIGNhc2UuDQoNCldlbGwsIEknbSBhdCBhIGxvc3MgaG93IHRvIHByb2NlZWQsIHRoZW4uIMKg
SSBoYWQgYSBnbG9iYWwgdmFyaWFibGUsIHdoaWNoIGlzIHRoZSBhcHByb2FjaCB0aGF0DQpOb3V2
ZWF1IHVzZXMsIGl0IHdhcyByZWNvbW1lbmRlZCBpbnN0ZWFkIHRoYXQgSSB1c2UgZGVidWdmc19s
b29rdXAoKS4gIFNvIEkgaW1wbGVtZW50ZWQgdGhhdCwgYnV0DQp0aGF0IGlzIGFsc28gcmVqZWN0
ZWQuDQoNClNvIGluc3RlYWQgb2YganVzdCB0ZWxsaW5nIG1lIHRoYXQgdGhpcyBhcHByb2FjaCBp
cyB3cm9uZywgcGxlYXNlIHRlbGwgd2hhdCB0aGUgY29ycmVjdCBhcHByb2FjaA0Kc2hvdWxkIGJl
LiAgUGxlYXNlIG5vdGUgdGhhdCB0aGlzIHBhdGNoc2V0IGlzIGFscmVhZHkgcHVzaGluZyB0aGUg
bGltaXRzIG9mIG15IFI0TCBza2lsbHMsIHNvIEkgd2lsbA0KbmVlZCBzcGVjaWZpY3MuDQoNCj4g
QmVmb3JlIGFkZGluZyB0aGlzLCBJIHdvdWxkIGxpa2UgdG8gc2VlIGEgdmFsaWQgdXNlLWNhc2Ug
ZWxzZXdoZXJlLg0KDQpJIGRvbid0IGhhdmUgb25lLg0KDQo+IElmIHdlIHdhbnQgdGhpcyBiZWZv
cmUgR2FyeSdzIHdvcmsgaXMgcmVhZHksIEkgcHJlZmVyIHNvbWUgaGFja3kgdGVtcG9yYXJ5DQo+
IHdvcmthcm91bmQgaW4gbm92YS1jb3JlIHRvIGFjY2VzcyB0aGUgbW9kdWxlIGZpZWxkIGluc3Rl
YWQuDQoNCkRhbmlsbywgeW91IGFyZSB0aGUgb25lIHdobyBoYXMgYmVlbiBwdXNoaW5nIGZvciB0
aGlzIGNvZGUuICBQbGVhc2Ugbm90ZSB0aGF0IHRoZSBsb2dnaW5nIGJ1ZmZlcnMNCmNhbiBvbmx5
IGJlIHBhcnNlZCBieSBOdmlkaWEgZW1wbG95ZWVzIGFueXdheSwgYW5kIHdlIGNhbiBqdXN0IHVz
ZSB0aGlzIHBhdGNoc2V0IGluIGhvdXNlIHRvIGRlYnVnDQpHU1AtUk0gYXMgbmVlZGVkLiAgU28g
aWYgeW91IHdhbnQgdG8gd2FpdCB1bnRpbCBHYXJ5J3Mgd29yayBpcyByZWFkeSAoSSBkb24ndCBr
bm93IGFueXRoaW5nIGFib3V0DQp3aGF0IGhlJ3MgZG9pbmcpLCBwbGVhc2UgbGV0IG1lIGtub3cg
bm93IGFuZCBJIHdpbGwganVzdCBrZWVwIHRoZXNlIHBhdGNoZXMgaW50ZXJuYWxseS4NCg==
