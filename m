Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99848CCA109
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 03:15:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2B810E535;
	Thu, 18 Dec 2025 02:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BjMGLu8S";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3651945659;
	Thu, 18 Dec 2025 02:07:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766023661;
 b=lvv0HaorbcRJW99XLsMpJav/b2i0lKnzv4/DgmimpcqLSBnVhF9NaodVETY5L2CMS/Ptt
 7E7XIvq07Wcuk9sVxU/Z1DzTPtQvlFsjw/jxWL46u+H3ihy/Z69lHcYU2u2IparAJLVoi9K
 YVoZXCqgtxr/3vYYVKo59pb2seZU2YZpvMWcGT66zuN3Ki85MoOamWWctjJdtwS04lC9fK+
 /HGfSuo94awN4N/Bf0PnAMjf0/O3YfgCGfC1enwOD9cSRHTaLcoq2JF3v2xocGgB+WoaTBf
 +9a2zOo5WtXizRDQYUrtekTpQkMGBJGr72Ny0syEEmmCwJDN4gZbRfl/wMuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766023661; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=27zEediCJ1+eZgWFOmd1jKsD5cMBSZ7f0UWtvGARH90=;
 b=BJmohlKfCU0YVPjFhdiGbrRnJiJc1DxevsMn6yMviAPVyu2AB3SLDxq3HCjbJIjMNyeJU
 rDSd1lQrdA4IxResM1sUOJPgPitPO/CUhe+R0ITVVsG3NBil1GRrB2G9zgz/OrLkOPSvwsl
 MNZWvQ0x1lA9UmyKfKhZtvHhXc2adUBY2wlMOjnnWejD/OfwS6x3+BrKOI4Q8BSyoTiPRA9
 iPLySxb1H/RqXLv7VNUJQQfQvOdozhAFzlorojvsgYR6J9r7W9JiieL4ZGPU4CrR149s6SA
 j5G+Ml1FMcURR9EitolzCy2Bvx0wq6BJoqEttgAEb0HyrBTR2B0N9k87XCkg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5E5CF45650;
	Thu, 18 Dec 2025 02:07:25 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013048.outbound.protection.outlook.com
 [40.107.201.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D782D10E2EE;
	Thu, 18 Dec 2025 02:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Utrg8FNfrtz1IquTSXMnPSVQW6fhRcKmi7vkLYDADEJINrxHDD/88wKwUWVq5hDdlCSvau4uCEvxKo5D0r/hFmBGKSBHzNmlpN2gkcuvAfDEi0DK7/WEC8tF0Eh+nJf/dvyaC9Foyrqrh/M4hJt3Gv8eYDxU4l2zJhGV1LodW+1mitpT2QV69S/esIx2YN1ZBrx4MnPAQclmfAdsESomDCzUuCVYFLgFNmaqhlUJjM8n3aqHadPjPxkqrDjqqwjqRxoI/XBguiJgqQTEWWib/DiPZqMH6ClfqGYNDorVud+8upIBbNiF37RzlLvdmbXVXwQLy5DsX+4H6PnKDbcpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27zEediCJ1+eZgWFOmd1jKsD5cMBSZ7f0UWtvGARH90=;
 b=C0MI9C1y2D2HE465zzspyeKFg0rYo7FfhJQ8ooX5fvW9h5RlMT+4GwN5BqO3qUWztju531uAO43wo0lx5NVL+vv5Cte/G2rR5pNlGaW8CeQdalyQI0Z/SBVjZ7L+37EWTzskiRHvJdZHY1A3vyFXk21mSS+Bt6ex55+ohi2TiPAG64CKm6QKnC1wG5iJVtXVwUWP01yXy9N9PNj5CYPlGNpRPn4MqNQP7FtyUDfByuSne3TUZ8z1vwfohPHaL9iozdzwWVIfF4XC2kg00Z2O6xQQxWZLJA4i90SFfzsWY1F6emjKAgcZu2oICgCYIGXqOz9SUe6zUFNwHOl0hOWB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27zEediCJ1+eZgWFOmd1jKsD5cMBSZ7f0UWtvGARH90=;
 b=BjMGLu8SOgNhaaLiVsK7RjcKRrzf+r+7sHiiGdP7169EIWHAtnujed9sW91rhhfAFcCgOGDgOy9+/Lu571//3BT0+bTBGFRv4y+WVmRpr4ickT6FKEoDX6oaG/3fRf2bFCb4wVMG8ojwHTCCXyfI/1EogPTRpPm1mW7ExrxnFrCb1dvuWxIOaxkX4BTTaSXIaTRZhIFewag/BvcJOBjPTGjiJwaUND2TOwDIOcEuOQ0DN/RV51NEoO2B8PKmWi1tnxwGiaZbq6CIriKyka4VT7+bIxgNmvMO7i2LAwWOpJGHNWPzEp1gUDr+zOSwRm6mtFMo1FAclQiRInGtQ9iZPw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SA5PPF50009C446.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 02:14:45 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:14:45 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"lyude@redhat.com" <lyude@redhat.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	"dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/12] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Topic: [PATCH v3 03/12] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Index: AQHcaJj71yApYYW0TUOnkWe42eFJRrUlaiSAgAFMuAA=
Date: Thu, 18 Dec 2025 02:14:44 +0000
Message-ID: <3835ee99bbfd3df3ba8d2375277d35123631ba81.camel@nvidia.com>
References: <20251208231801.1786803-1-ttabi@nvidia.com>
	 <20251208231801.1786803-4-ttabi@nvidia.com>
	 <DF09YET9UFY1.209KXGTYK2485@nvidia.com>
In-Reply-To: <DF09YET9UFY1.209KXGTYK2485@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SA5PPF50009C446:EE_
x-ms-office365-filtering-correlation-id: f52c0114-565a-4fbb-fe21-08de3ddb3632
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?bmJpMnNyeXhvUEcxNXZrUEJYMXNaN2txc1Q5TkJRYldSN01ZeEhUWS9iSCt2?=
 =?utf-8?B?bFJPTDRFbjl3WTN4aTJyN3AvbHBFNDFGNHMwSTIxaktNVG9zRXN1NVEzcCt6?=
 =?utf-8?B?MUcvWW1xQmd2NWFNaXgyQzFocmRMVXRicXdxVDNaZHVMYzEyN0dnSVF5eExF?=
 =?utf-8?B?SmF2UUJuQmhMb0dWNnR0TjZMZGFyWWc0eXVDamRHanMrMklCZ0FsdUcvaEs2?=
 =?utf-8?B?NVpqbC9scklNaDR6TFcvSzVRZWZKSElIVDBTd29VT1NzZEhmR3Y4ZENSZG93?=
 =?utf-8?B?YmVPa2Iybmd1dG9mc2dKTmJqV2JsOUpQQzBaRlRMLzB2cTdaeFBtaFUvbjZD?=
 =?utf-8?B?S0Q5d2VKMWZ0UC94OU9vMTE2bjlubnk1L2FqdDQ0eDB3STYraW53bWg2NitH?=
 =?utf-8?B?YStTTm90VC9yMG5yK2VQcmpncm4rZGZWSTc0T2puNDVDQTdMRlZ5UlBUVHRi?=
 =?utf-8?B?SCtpSFdRNnRWNzBlWlFFSE05YTkrbElFcFlUZXJoekNYekRxUExyNU95SzY5?=
 =?utf-8?B?bENWdnd1NG01RTczTUplZUZlaUlsUFd6V1ZoTnhtOWMzYWZDSzgvdS80MTA2?=
 =?utf-8?B?MjZCS3kzeVdZdzFLRUZjdCtKNHdtVGN4SkFsckxESUFMVlVoUmlOTk91QUlK?=
 =?utf-8?B?WUVCMTZkVmZTQzRnTlBTcWc2WmxQTXJnRzA1SUxDUEwwd1J6c0tjdUg1TWhB?=
 =?utf-8?B?RnlCT1FzamhoTDRtZWFPL0RuK0c0RmdRYmtQaTFYdXJGek4xQmRxK2d3OVhu?=
 =?utf-8?B?NGNBRTM4RkRjMUZkcCtReHNYaTRoQzA2b3V6eHlReUdPVkZ6ellwd2FmbVdI?=
 =?utf-8?B?eWx6THpUT1VZU3JQSVpLTFVETzgwZE0wQmRyUm93WTMzWWpzRWQvZWptYnlF?=
 =?utf-8?B?b2tzQUI2d0VoWncwYXkzbEF5eXdYYUUrSGpxamt5WlJZajBPZlJReTZjQXFq?=
 =?utf-8?B?aDg4dk9Bb3pFb2UwUHNxUVc3SVFLT05YYXprNGFOYXhsSnhCZm9oaHpVRFRZ?=
 =?utf-8?B?WmZlc3ZnaTRUQnQxcjdXN3dmcFgvWE9GOXRYeHFiNWhrMFAyWGhjUE11KzNl?=
 =?utf-8?B?TmFaVTVyTVgxSmErTUNoeER4WUt4RE1acnVzeEQ4Y2QzMmhGM0EyMURCWTRT?=
 =?utf-8?B?b3h5cXZhMUVyclBvZ1FTZmFpY0JjUG5hUTBNSTMyNlVzU3JMTDdDOTZCR2Ex?=
 =?utf-8?B?NWtvcnVTUFlvMUlLMnc5L1ZhdG5EaE9IMC9LaFNhQU4wMm5MR1hCeVA0a0gr?=
 =?utf-8?B?b1lDMzBoQm5aZlMySDY1TjlraEhmd3ppcDFVUzZ2MFcrMWNpeHR5d1NlSmdv?=
 =?utf-8?B?TTJXRXQveFY3RkNDZE42d005TmdWUnNZam5vczlPQlZPQWVKK3ZIQzdjd0pP?=
 =?utf-8?B?Q1FOZWhwdTFtZ3kyUEVIcUJYY1R3K1Q3Sno3NnlncndLdEwxNjhBRzJPN2gy?=
 =?utf-8?B?anZaNG83TnNQNFErMDJFd3RCb3dZQ2d5aFZjeHlDa0hRY3B3MU41U3NHV3hL?=
 =?utf-8?B?NDBsR2toL05NTGpiekhGMXJGUVdIRHQ3ckJXeWc2dnUrbjRYQ1JPOXBIbDZ1?=
 =?utf-8?B?U3UrTUdwUnFFTW1YK3M4b2FwcnZCNm1jYkxnZUZYcm85VE1Vd1lYVGVXVnZW?=
 =?utf-8?B?TmJ6VktCUjgrSUxLUUlNaENWazhQN1RBT1U0RFJXeFdtQ1FONTBWRkV2NHp0?=
 =?utf-8?B?NlIyZWlGaTVoZjBFcnFKdjlOaEVhTlB2R08vUVN3UTQrRGdLRGlYMGtxRm9O?=
 =?utf-8?B?UFpER1p4bnU4a0kzcEhMQjBPZzlKeU5jNXNJVG1WR0x4Y3ViUFdjb3M3aTNS?=
 =?utf-8?B?ZE9qVzArVk1Fa09pUXJONTNjanVJOUh6YzFranBMSGFBSVhZQ2NNSnllYjBI?=
 =?utf-8?B?SG1qUWR0aUVhVkYyRHNDcWg5aU0raFQrSVg2cXRrRStQMlNmcGRXdUg4SlpL?=
 =?utf-8?B?b2FLVkt6UEhhZEJadEg3U2hIWHpaRExYdHBwK2FyTVpZb0p0eCtkaEQ0UXJu?=
 =?utf-8?B?cnBxMTJKMHFUVGhPSWpLNnkzbUR1S3YwNEJFbHp2TGdxNGpnQ09KQkhhV1Ax?=
 =?utf-8?Q?uFgKuQ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MlRZWXcwTnZJTHdTaFZMK3RGRFU2UjhTZVBQY0RKQ0VuVnF6eGUvMHBDc1A0?=
 =?utf-8?B?akE3Vlh2YVRocmxScDRGY2pOb0ZOSCtXZkYwSHU3S3ZjcU5NdkxHemdURStj?=
 =?utf-8?B?RG51QThXZW9yVUpBeHB5bHFHeDZNY3pKSjgrYzdKS2M1S3FXb0ljelRZUGJo?=
 =?utf-8?B?OThPM3Bnd1ZiRTRjOGpWMWZib3AvSFhtdmZTRlpPcFVyWU16aUJhM3hERmMy?=
 =?utf-8?B?akxCcnB0NmExcXBNd1dzWmNITDlGUml4UXlWUVlwSzhVT1lmRXdLSHBIV25C?=
 =?utf-8?B?S0pvZE04cEpxQzBKZUNUNTR1OUkrTWFEY0xRN3lGYkdVdzd5NmZyOUdURVAy?=
 =?utf-8?B?Ui9QaDNJZmpZbE9kV1ZkZzFxNVZNMjhRR3UrcGZUdTdQbC9RaTRmdnAvRmhU?=
 =?utf-8?B?azNHNDk4ODJiN3BSeGp1bVZtQlBEQXYrd3FWc1Q2MlYyN3hueFF3cSs5OE5F?=
 =?utf-8?B?RFVVOWRtVkFoUmZ4aExNd0VEa0I2eDVnZ0xGNS9SOXZxdGQrVzJwVjBxV3F6?=
 =?utf-8?B?WUZpRjY3SEJ5RUJ0b0trNmxZaWR5VzY1cFdsbGswbk1lcHdJZ3dDQXE0bEIy?=
 =?utf-8?B?R3F5eG15dXlKWkJHcXErY2FUdVdROWwyUG5oOG5CRUZNb1JOaVR4dVBLYVRR?=
 =?utf-8?B?eVFZQ3o2MHo4TzFRQURibnRCcXpOaXc1UWg0eXlMMFl0Z2ZLWDhXVnBUMk5I?=
 =?utf-8?B?QnhYVlR0ZkRnbm5iN2RaVXQ5dlBtVW5JZzBQRUxWQWozbmFOWHRJZktxMllm?=
 =?utf-8?B?L1FCd0lpQUg2eFRZU3N5TGRwRTF5MVJkVXk3QlNxZzJYL3pBZjFCMmtLWVJF?=
 =?utf-8?B?TUFlOElNOTdhazBrUE0wSUlKTnIyaGlQUnRyZUkvSTNRY1ZqaHEraWt1cDRp?=
 =?utf-8?B?bUptdVFpYUFKWlJpVmdDY24zNURNdG44T2JONzQ2cm1nQWRvcVlNWnBuOUEy?=
 =?utf-8?B?WmZkQjYreEJ3QTdkTXB6YXJMSUIyTHRIeDUxK0ovOWJEUmZ5STJYWkdCZmxW?=
 =?utf-8?B?ejA5NTdxUUp6MnlDcjJpY1d2R3JoU2Y3Z1REdzVyQmhkRnNZcmhVT0RnYjBW?=
 =?utf-8?B?QjZzMW1DZGhYcHBOSzdjbis2RGpwQnF4eWh1RzNDSGRPYU4yR0Z3SDVkUS8w?=
 =?utf-8?B?RXhGR09OcXQxVlVkdm9rMFBZMWhreUlXUkpOY3VoSU1XZE1tTEZEYXhPZ1Rl?=
 =?utf-8?B?SFlHRXFteFVveDMyQVk4Z3FjYlhocHgyUHN4bTZzZXlMd0J3Y3lCbTdzTE9W?=
 =?utf-8?B?d2hkbHE3QVFJU3F5a1B2UlkyazRJT1dMaEJSK3FEYnNWc1lkeG1jYm5aendB?=
 =?utf-8?B?R0VJTVphbDErVWw3Q0ZkZ1AvQmx5QjNDQ2JuWURVc1l3bVBudTNnRTErNXBD?=
 =?utf-8?B?YnAvOFhCNThkUVlzSmRSMWkrekt6QnRGMFQ5ZE9sSGZKaEc2d01kVWpLMVJz?=
 =?utf-8?B?ZkRqNUpXelJEZlltQTBGMHlKVklmMEJZVnU1dUIwVHBOVVY0dkp0K0VzWWpY?=
 =?utf-8?B?c3RRTmZEM2RoWW9WZTJKNjNyRkorMldCMW16bGlmNldxS05vQUh1SnhXTkRQ?=
 =?utf-8?B?d1JrckF6V1lUbVBYMWJYbVZVK1V1am5tdVZCM2xTVmltczJFTDcyNjdyUTNy?=
 =?utf-8?B?MGc2bVhFMkJvOWhCelJFMFVqUEoySHJoN3VtNTA1Q1VSbEhhajE4Y0YxekN0?=
 =?utf-8?B?NkIyWmxQeE5DZm9Vb1UzSk1DeWx1dDVNcmFxZkE2NW1pZHVSbEdBSmQ3bCtY?=
 =?utf-8?B?Tks4NmRzZDZKUUhvY0RwbHdkTitxdFJ4U2xlWnk2Rit0VU4wdGRZdzNpRGhs?=
 =?utf-8?B?RmVmNHRYRFB0YUh3ZTFFUEZWUmpKM0tpVVNrclhheW1BTkJYck1zb0s1eVk0?=
 =?utf-8?B?emoyWEk3VW02ZlQxYThsVXh3SDF4YWRkanlPQVVTNE5Tb3JTZk03VEdXRTd4?=
 =?utf-8?B?eGNWNzVTZWxqOEhpa2h1ZURsT1VsSWpjNm9wZHlWQkNHcnBGWW1rekZaTzJ4?=
 =?utf-8?B?R0FQM3VlQlRJbVRpTHlNZHRFMmhEeG9iU0Q1SmQ4dnpzcG5jbjRNRG5zekVh?=
 =?utf-8?B?UnRwWW1XbzNnazI3RlFmYkZPNkVHcG9CU1pualNKS0xIaHArckJISkxyRzhH?=
 =?utf-8?Q?SvO3NifsghsEQ3UbhEH9VxaGc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECAD46B449E35B4D86381F4ED9F20D70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f52c0114-565a-4fbb-fe21-08de3ddb3632
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 02:14:44.9331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zPl9lwS5+p3wHgOp2SHptYdVw3SqTVNXjL26bggS790/RfVuXveMovi8hGrnlaCwm6xQN3b28AO4jN6ODvtgqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF50009C446
Message-ID-Hash: IY3ERSI2HBOOT7RAMQG3YOPQX563HV74
X-Message-ID-Hash: IY3ERSI2HBOOT7RAMQG3YOPQX563HV74
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IY3ERSI2HBOOT7RAMQG3YOPQX563HV74/>
Archived-At: 
 <https://lore.freedesktop.org/3835ee99bbfd3df3ba8d2375277d35123631ba81.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gV2VkLCAyMDI1LTEyLTE3IGF0IDE1OjIzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCg0KDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFRoZXJlIGFyZSB0d28gdmVyc2lvbnMgb2Yg
Qm9vdGVyLCBvbmUgZm9yIFR1cmluZy9HQTEwMCwgYW5kIGFub3RoZXIgZm9yDQo+ID4gK8KgwqDC
oMKgwqDCoMKgIC8vIEdBMTAyKy7CoCBUaGUgZXh0cmFjdGlvbiBvZiB0aGUgSU1FTSBzZWN0aW9u
cyBkaWZmZXJzIGJldHdlZW4gdGhlIHR3bw0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyB2ZXJzaW9u
cy7CoCBVbmZvcnR1bmF0ZWx5LCB0aGUgZmlsZSBuYW1lcyBhcmUgdGhlIHNhbWUsIGFuZCB0aGUg
aGVhZGVycw0KPiA+ICvCoMKgwqDCoMKgwqDCoCAvLyBkb24ndCBpbmRpY2F0ZSB0aGUgdmVyc2lv
bnMuwqAgVGhlIG9ubHkgd2F5IHRvIGRpZmZlcmVudGlhdGUgaXMgYnkgdGhlIENoaXBzZXQuDQo+
ID4gKw0KPiANCj4gVGhpcyBjb21tZW50IGJlZ3MgZm9yIHNvbWUgY29kZSBmb2xsb3dpbmcgaXQs
IGFuZCBJIG5vdGljZSB0aGF0IGJlbG93DQo+IHRoZSBzYW1lIGBpZiBjaGlwc2V0ID4gQ2hpcHNl
dDo6R0ExMDBgIHRlc3QgaXMgcmVwZWF0ZWQgdHdpY2UuDQo+IA0KPiBIb3cgYWJvdXQgZG9pbmcg
dGhlIGZvbGxvd2luZzoNCj4gDQo+IMKgIGxldCAoaW1lbV9kc3Rfc3RhcnQsIGltZW1fbnNfbG9h
ZF90YXJnZXQpID0gaWYgY2hpcHNldCA8PSBDaGlwc2V0OjpHQTEwMCB7DQo+IMKgwqDCoMKgwqAg
KGFwcDAub2Zmc2V0LCBTb21lKEZhbGNvbkxvYWRUYXJnZXQgew0KPiDCoMKgwqDCoMKgwqDCoCAu
Li4NCj4gwqDCoMKgwqDCoCB9KSkNCj4gwqAgfSBlbHNlIHsNCj4gwqDCoMKgwqDCoCAoMCwgTm9u
ZSkNCj4gwqAgfQ0KPiANCj4gLi4uIGFuZCB1c2luZyB0aGUgbG9jYWwgdmFyaWFibGVzIHRvIGlu
aXRpYWxpemUgdGhlIHJlc3VsdD8NCg0KT2ggeWVhaCwgdGhhdCdzIGEgZ3JlYXQgaWRlYS4gIFRo
YW5rcy4NCg0KPiA+IEBAIC0zOTMsNyArNDA2LDEzIEBAIGZuIGJyb21fcGFyYW1zKCZzZWxmKSAt
PiBGYWxjb25Ccm9tUGFyYW1zIHsNCj4gPiDCoMKgwqDCoCB9DQo+ID4gwqANCj4gPiDCoMKgwqDC
oCBmbiBib290X2FkZHIoJnNlbGYpIC0+IHUzMiB7DQo+ID4gLcKgwqDCoMKgwqDCoMKgIHNlbGYu
aW1lbV9zZWNfbG9hZF90YXJnZXQuc3JjX3N0YXJ0DQo+ID4gK8KgwqDCoMKgwqDCoMKgIGlmIGxl
dCBTb21lKG5zX3RhcmdldCkgPSAmc2VsZi5pbWVtX25zX2xvYWRfdGFyZ2V0IHsNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBUdXJpbmcgYW5kIEdBMTAwIC0gdXNlIG5vbi1zZWN1cmUg
bG9hZCB0YXJnZXQNCj4gDQo+IFRoaXMgY29tbWVudCBpcyBjb25mdXNpbmcgLSB0aGUgbG9naWMg
aXMgY2xlYXIgYW5kIGRvZXNuJ3QgbWVudGlvbiB0aGUNCj4gY2hpcHNldCwgc28gbGV0J3MgcmVt
b3ZlIGl0LiBJZGVhbGx5IHdlIGNhbiBsaW1pdCB0aGVzZSBjaGlwc2V0LXNwZWNpZmljDQo+IHRo
aW5ncyB0byBhIHNpbmdsZSBwbGFjZSBhbmQgYSBzaW5nbGUgY29tbWVudC4NCj4gDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbnNfdGFyZ2V0LmRzdF9zdGFydA0KPiA+ICvCoMKgwqDCoMKg
wqDCoCB9IGVsc2Ugew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEdBMTAyIGFuZCBs
YXRlciAtIHVzZSBzZWN1cmUgbG9hZCB0YXJnZXQNCj4gDQo+IFNhbWUgaGVyZSwgdGhlIGNvZGUg
aXMgZXhwbGljaXQgZW5vdWdoIGFuZCBkb2Vzbid0IG1lbnRpb24gdGhlIGNoaXBzZXQuDQoNCk9r
Lg0KDQo=
