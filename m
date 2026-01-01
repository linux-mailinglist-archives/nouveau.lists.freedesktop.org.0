Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DDECECB1E
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 01:16:02 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 518A810E7ED;
	Thu,  1 Jan 2026 00:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h6+USOSI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7077F44C81;
	Thu,  1 Jan 2026 00:07:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767226079;
 b=fmwDgp1XZ5JeXsooN66EeO5pjDY4LPL9vsTbmESTsA/Xm1VLW5398fpwj8MuB2qOX7FMf
 YbrcTBDORdC4mQs+30SQha60hiI5sSlW6Qlr3WKgO3um/9pz/pEQIYMJDqLAUsGfJO4Kq/7
 84NAy9HwIDlHwBGrMMxnEXP/5tfOClHcscOPw4jHzPXsCZtI11e9tUPcIf/9dv7SRUaPYrY
 Hn1OA9c7jczUmOvnJPQLhY/dJ9i06lrGwoTTKPRvz2HgdOju48SBjhYudJ358keL6ERh1tr
 rjqT3GnBZ7AtqFPIGWRI8yKyu703SwbVzvZ4bJMu4jU9QvwEOjiy6jKvec3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767226079; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TkM9gxJHUdvznx1ZmVMzPMaq/1Cf931E8oKJKlvGncA=;
 b=cPYCkukyJ7HRT+LTQLYbaIkePmOpVEtom6R21ZWMaheWL4ThR/jQ4QEx5/TixEFi4kbHJ
 gtSZjqEwtBAwSi6t4L7FeefZm0DRMANeALiAG6m09rYuTlydEOAzsc2h83G6z3oOaaJTpNz
 SGTyUy68e3ALvRe0eUeVDK+JNtMBpMxpED8V+0jv3FQmp4WXApxhuR5NK9QBU4EfeiWBQHg
 ZtiWuqBD6m8kEu/S+9glS/6MTek1i9lCHOi11fXuovm6KO25kc0FYkvuT6FSDttEFRNM9R0
 Cd8f1xQYFJWNxGAwVqtZPWsxXmcdKC/BW2/niwjEHK+G2jK74s/myDZAXbOQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1CD1444B9C
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 00:07:57 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013048.outbound.protection.outlook.com
 [40.107.201.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5A10E2C3
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 00:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXRc00xfqsPCJyAB++j9jWqCHWU08mUcgz2FQUF0aO/lkOBfITPWkuqy3742lB1Kav/s3hfb5nZmFy4PCGQ9toLlAhOj9VFx8izX4uc1a2lml9KmanvI9mvW89ILRgu9M8FYezf27X1bSkbSaB+TWajlr9P6C3wSw26OdMWOLF/8vR/ocbfVtJQydgTWCKnsXy+cr2IZJV7qMnREy7XPLj0Em3hnET2Wz9XLcH5EcKHH3s9WTMNApzzw1cE0JbGDfldi9Xp37cBkNHaHTBVnOHouBwaUE5f3nrtXTQ0gLj5ulru/ajCLYHxSOPQKsfjjXHyEAYY3BikO11MFf8c8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkM9gxJHUdvznx1ZmVMzPMaq/1Cf931E8oKJKlvGncA=;
 b=CYC0MGqdFjeaZ2VJ+PnxFT0zsHXllsOBnOvcmnFagDPnqoQ/ufkmN7wYQI89GWRtjX0Npz/ZY0vLjh8dHX1Uftq4URjKq9iZzb3TdTQlUbgbMf/jTBo0vGrS7ITHisGSPM86tGaDlvd/i02CjajEXlQZAVFD2q8pdwqwjVeoptbVgrwiWK2pmCfZpMBvnppH2+7GRJYL+MJhmsJCX7NCp5EUSB/BL6UteJIdcYi/fwpRN3wGDDznzUstYhU+oXpyagtb29gkHebeeJsm07e66GRFiWaFr4iSaQsCsAY6n3fDr1HUjL1obk1Eptw9eeg+UObxxoP9+Et/5g5/3hCvVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkM9gxJHUdvznx1ZmVMzPMaq/1Cf931E8oKJKlvGncA=;
 b=h6+USOSIkSCAxULZyRn9ivK8VsE4enJySebr69veA8XZDrInSqOdj7zDMKF8Y9u2UcZdywX5420RDnWPwsoBTMuCcjdiuj/I7us7BsN9717tUYQDtgHuPxsNRrBX0gBi6Oc5tCxbFKgYJUzfUgpplnOsnibazwtZHVYDrumymDZyVxJ7QLCTpO8rECgYd5QawNCcvd3lXtRbnnefK8Y24vJ4EJUh3KcKGRGNDFPhmxKvv/B1MxqWrOCUQn4xss5O+6gwBlaw1j+mCEH47LQ8KAc7O84DbU3EMwYjEJRf6e86aInYx8b92/H5IJk+RbkqHoqxUPJVu1c6axez4Sa/xA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Thu, 1 Jan
 2026 00:15:52 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 00:15:52 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Thread-Topic: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Thread-Index: AQHcep8TcL3T9+UiJEia/sl5Ol3pprU8VcmAgAAD1wCAABi2wA==
Date: Thu, 1 Jan 2026 00:15:52 +0000
Message-ID: <CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
 <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
 <ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
In-Reply-To: <ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH8PR12MB6699:EE_
x-ms-office365-filtering-correlation-id: 2fdc976f-be10-4849-6e35-08de48caecdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VXBsbEN0Y09YVndCbnZXMlRRZlR1dGoxbkVCMnk1Z0pla1pMWEw5c24wa2hK?=
 =?utf-8?B?bUNaSXR5YVdhQUo2V2xpZFMyS2s4Njh6VXNCVjZPdXNMallaZWNuTEJqaFFV?=
 =?utf-8?B?SVMrQUpkUy9pTnJjQ0xzcUQ0VEw3anpIMVlyb0ZiOEVJTG5qUGJmUmk3SFRE?=
 =?utf-8?B?MEFERG9OYWpBakJoUkZ5M2M3UkM5aWJNYkw2THFKb294cUl1dmZHUnlDK1lB?=
 =?utf-8?B?eVc2MTAyK0NXMDg4MWUvQmFRVEUzU2VYWXROeGlRZ3JhUkxuWGhjWlNJYndL?=
 =?utf-8?B?bkJ1dmN6SlY4QlNPbDhUYnV1aU16Q2ViUFc2M2lWUUZ0ZGpOTnNtQTdLTmtD?=
 =?utf-8?B?UFV1eEVrVlZPUWVOVTc4b21LNGprWEtQaVVsdWQ5dzBxNDZTZC9lL0VKaEVW?=
 =?utf-8?B?cXJnNmh1MzFzbmhkWlNiSVNGbXlvWjVtY09STlJMVURrNG9qZUxJUk44aExz?=
 =?utf-8?B?RWdOMjdveEsya2d3UlBleW9vWm9kZktyYVcrNGt1N1IvNFBVcXpNbFVpd2lK?=
 =?utf-8?B?cmlCd3p2c01OSUt3endLV0Ryb3dEaGVXakRRVW4vclFoekFhd0ZTMi9Gb2wv?=
 =?utf-8?B?ZUdVYktaSVhKakxqTHUzd1FlZ1kxY3VQY2EwNTNSUDNERUFzWjExckEvQmJY?=
 =?utf-8?B?WXpwTUJLdGJkNncwWmRQK2dRWmFldVJKZnMxRXBUQmZTUnN4MUR1MjRETzlt?=
 =?utf-8?B?N1UvR29zVkhPOUFGazVsUWIwVlh4V3hrZGZzNEMyV2E0NU0vQ3ZVTlQxVWtJ?=
 =?utf-8?B?MFh2ZUdCM05IaVIwV0RvUlRxTW1TK3laQnNreW1MRWtuQlRSd0tpcXorNEU1?=
 =?utf-8?B?RnMwTHFXVVhrQXJ4QTN3enNPcHJOMVpLSHlMbEhSalZSRHo3ZHkwRmlrbEMw?=
 =?utf-8?B?TWk5S2t6LzdsTXUzOXpkemJQRno3a2VSRHZYdnpyK1JRN1N6ZXVaT0dnQmJp?=
 =?utf-8?B?MDN6bzlXdDNUTHBtU29xWGo0S3daM2xhSStyQUQ0YldBYzFSSm8vZWFjcFF4?=
 =?utf-8?B?VlluSGxRS1V4ZWwyL1lpcUlhMmNJY3U0WmFRNVdJKzhTTUpTdkVuMW1PTUdk?=
 =?utf-8?B?S1B4YU5HSFRpSEdJNW1OZzVRamNER3czZjBsR0lpNjA2ckJuR0VVQ2tLaWxw?=
 =?utf-8?B?bGJndytDSmx1V2grMVp2UG82aElhdFRIZHhGZ08ySVRmdzd6VUc0NDBnb3Jp?=
 =?utf-8?B?K2ZpRWtnUzVNU216bTVDUnRrcjNCaWcwRHFpeXhobG9NSzZPY2cxMFVBcjV5?=
 =?utf-8?B?ZWVuMjRtL2UweXVpN1hRQnE4ZWdWMU9UQUZIWjdVTWNzUzV4V0hPbFZpQlJN?=
 =?utf-8?B?Wmt2K3lHQkRYRGM0NWF3QTBlc3pGN3NIN0l1eWZNSlhsc2ZqL3ZMR3YxMHVG?=
 =?utf-8?B?NUFGOUltaFAvUG1qWFlXOUVNNjB4bW42RlY4RGpYRXdoYWdVVHlCTXFHME16?=
 =?utf-8?B?MSt3RDRzWjM5NXlFS3RTWVEvS1RPOXZBVGJtdlpWWEdHTmdCODM3KytJWDVp?=
 =?utf-8?B?Z1NVcll3Sm56Wm1ML01GVjV5VWhXRytWdmFlOC9JZ1Z1UHJKOHI5cGRkcjVH?=
 =?utf-8?B?eGVYV0pIV1dQYTdaSDVLLzE4aUd0MWNvdUtOZHU3L1NPOExab3dnSlFzV3FL?=
 =?utf-8?B?eUFqdEJQZ1VFMEp3bUVNaGtrYkZkdVN0cGk5VUFIOEh6LzQxWEU2SDVsaHl1?=
 =?utf-8?B?RGNzZC9BQzl2T1dVT3lxT1hGN2VsSTduWjlZNUMvTXpKQXNVUldZaUZOYUdz?=
 =?utf-8?B?U1AxTXdObDZiVmtRalhJbnczK2luTzVHbjhLRkVLT01ab1BPR0NtQVM3aktX?=
 =?utf-8?B?R2tsYkxmZ1hWVVVTWGYwQlFSLzNKdVhPd3dHeHhJbnN2MFhLeStwYXVYZFdy?=
 =?utf-8?B?WlFxMzdWd3Y4bnA2aFdtQnpQL1JNeVNGSGs3S0R1OW5xNXEyVE40MFNqRFlv?=
 =?utf-8?B?aWpWd3h2ejFSdTdZenpGbGgyK2Z1UHNtWVNyV1REWmtGYjNsRzhYV09YQjFP?=
 =?utf-8?B?Ylp3MWtraU5POE5DTWNSYU9UU3NzY0FQWURKMkFCNU04c3V6NEZObjdjbXJT?=
 =?utf-8?Q?+Cifv/?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWg3ZVlueXpidjcyUTNuV2ZEaWhoS21GOEJ6cVNxT0hwVzRkdEhnYlIrSlI0?=
 =?utf-8?B?M2lyM3lteEgvRlBlSVAvMS9MTjJ3OGMvUGFlTGd0dDJmenZrZXAzeUUyQWtY?=
 =?utf-8?B?cVEwVFkvcmF1WHhsZzVBMWh5dlFWZHJqNzROeTdLWVYydmFKMEdHaFI1eUpy?=
 =?utf-8?B?N2NVRmVxcExDb3hnU1c3SmxDSWxHc1V6YVFxS242Wm04aDM1THlaOGxSODE1?=
 =?utf-8?B?VDNPVzJmNXUwZ0JNeDNqWjNWemcram9weHljY0w2UW9hS3NzSjNlbTVtaWpR?=
 =?utf-8?B?YkV1QUpEUC9UZEVJR0wyVFZCVHZhRVkzYS95VitaSE1xdnVoQ2d4eXdZOEFs?=
 =?utf-8?B?cXdyaGRmdUx5ZU5BRlcxUTkwWEhvaHZYZWd1QlptNjBhbG5PeksxVExNQkFl?=
 =?utf-8?B?WGlZZldHNXVGaFBTM0NKSTJvNHErdlptTEJ1blRtbEFRckRLRWxCd05pdUVU?=
 =?utf-8?B?eVNVaEs5d1loVXlDTGFLMTlaeUZpYk45K3hjcWZRSmhDdkdNaFlYYWJ4bHJz?=
 =?utf-8?B?S2x5U1Jvck5HOGRpdUZHWW93SnJqQVAwR291MFRtVXpMVU41YWU3VDlxV1RS?=
 =?utf-8?B?Vk84NlZ3QVd1aGZZNXJEYUIrKzhxNkFKRmVVVjR3ZHBjdTZyQlpOaE0rdGo4?=
 =?utf-8?B?L0FCd0swcFVZbFY3d2ordHpaTlJRdy9WSGd6b3d5YVVtMjd4U1JSMStMWmFD?=
 =?utf-8?B?NmtlWUxUSXB1ajNUaVZUUHJwUFZlSnFKNzlydS9LYkFvY2N5Y1lVQVNEVHE1?=
 =?utf-8?B?TWErdnBCYnp2MlkwZjk1TjFkT09UNXNrd2NiaVQvdlF5SHB0bTFYa3hvQWlW?=
 =?utf-8?B?cHNkRkJSRzJjZGlIbGcxYnpQWjZncjZhc25ybkVlVE5sQXJrY2xCd0YrOWFS?=
 =?utf-8?B?WjNQdGZnNlBYeUc0NTRiRUdBYXZHbzhJSVY4SGZvWXkvWjQrWmJLdFdrckRM?=
 =?utf-8?B?NzMwM0pjcWVDMmE1ZXlSYkpEdlFoMTJWUE5EODZOZC9HcXhVbzlRVnE5ZW92?=
 =?utf-8?B?cVJ3Z2J0RDZlSnIyRGhWemZXU1h1OHpmWElURkF6YnNLOWgvNGlEd3B6QUtS?=
 =?utf-8?B?aFU4VlcyQ3NRTE1SYUlNdmdSUklIbDIydG82ZGVFMDl0VXNwSFV4VG4vTVJ6?=
 =?utf-8?B?THlyeGl1NUpWTEZrOWRGOU84bk9SVnFUWndRTjFQTkpTbFpJRjhzaVFFZmxs?=
 =?utf-8?B?blU2cTJ2RFJ1UWJqdHgzeWpPcnZvVzIwTWpVWDJIanArMzFkZkk0eGEyeHNB?=
 =?utf-8?B?R1I1cXlETWZDaUViWXJvNkFpWWhxNWxVby91UkRlYlVMUERWSEVFZWUwOGht?=
 =?utf-8?B?bFBETTBLQnYySnZsTUoxbmpYQkpHbS9WSHpYMi9QVm9yZGhPTVZ6QmpmTzdV?=
 =?utf-8?B?alJxR2QyN0cwMGhxTnRqOTRRd0U1cUJ5bitEd3UyQXphL3VYcyt0WkN2aVp0?=
 =?utf-8?B?NHg4WXFkd3lHYUQ5Z3NIQ0VhKzg3eWRtQlZ4RzZtVDZxZ2puSUlHa3ZIZTEv?=
 =?utf-8?B?VmtVM2NtVS9xOUFuVXdTR0syc0RBZVA5a2JUZ2FXZE1Va0ZOYkh2UllQYkJD?=
 =?utf-8?B?MXpEZENNc2QxTmFzWjNQaUpxeHUwL01zTzJDVUhYQjg2OEJxcCsxaGxtUHlJ?=
 =?utf-8?B?cEdmcUk2YVJlNWsrQWd4YzhxZGhwTnNidUFkNHYvOU9SVlNueE05amYwVi9W?=
 =?utf-8?B?OU5JTGphaU9aN0Qyc2ZtSVplNjlBR2NEYWJqUWtLMlh6eWk3UjF2VHVJMm9j?=
 =?utf-8?B?VGpCVTNiQ3JPdjRYYlZBZjJVVFZlNzliQ0dnZHlGK1JXeVFMYjE2RjQvMTZy?=
 =?utf-8?B?eDVHVzBMYnd4cG9reTRBbGx2UTVPNm9kbHlGdE92QXFqaUhXQTI1eEJEb1lO?=
 =?utf-8?B?WEI3c3huclhxSFN2b2pnOXJXNVBseWJ4T3ZEQUJ1aWhUUXRmQ2Z3amZ5d2Np?=
 =?utf-8?B?YnltR3o5MDFZMmVVbDN6RFIrZ1dlRk80bXZrdHJlc251WWhISzEwNUI3dVZy?=
 =?utf-8?B?L1FkTldXZXorTHptUmFUVzhhYlVPYklBOG5jZlRlSXJEL2dzMXFYM1hJQjRL?=
 =?utf-8?B?a2hWaGFzcGtqd3RYL1FpbW1tcTZYeWRBR1Q2ZlZmN1NCOGZ6bVFPZ1BNUVk5?=
 =?utf-8?B?anFpM3hGb29DT1ZLRS8vNjlwZzF2SVBJVGpWV2lWMDBXQWhBVVlNM2phSmo3?=
 =?utf-8?B?cVVyVEpCNkF4MzRJQmdLNERjZEN1SUFrNnBHclVaNTZ4aVZ2blVZRDF6T1Rk?=
 =?utf-8?B?U1R4cXlPZEsyOXEyN1AxNmpvQi9VcEVGNG5aSTVEalh3LzV2UHFndzNQRk9a?=
 =?utf-8?B?M2dTZkt4RWZla0lTcjFUNWdZMGhDa1ZzZ1BQOUxsbUJwNndJakRkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2fdc976f-be10-4849-6e35-08de48caecdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2026 00:15:52.7172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 /mo8QSqE6SKJ61oirC7txRqk+2jjWKam59n6L7sNwDzBmFQDbK7ejhFr0G3jD0fu1FOZqdUgGAB9Z+qOimPqWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699
Message-ID-Hash: GJGQHSLNJBRHBWVHR7QKRLOHBMQPV4EA
X-Message-ID-Hash: GJGQHSLNJBRHBWVHR7QKRLOHBMQPV4EA
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "dakr@kernel.org" <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GJGQHSLNJBRHBWVHR7QKRLOHBMQPV4EA/>
Archived-At: 
 <https://lore.freedesktop.org/CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDMxLCAyMDI1LCBhdCA1OjQ34oCvUE0sIEpvaG4gSHViYmFyZCA8amh1YmJh
cmRAbnZpZGlhLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiAxMi8zMS8yNSAyOjMzIFBNLCBUaW11
ciBUYWJpIHdyb3RlOg0KPj4+IE9uIFdlZCwgMjAyNS0xMi0zMSBhdCAxMzo0NyAtMDgwMCwgSm9o
biBIdWJiYXJkIHdyb3RlOg0KPj4+IFRoZSBidWlsZGVyLXBhdHRlcm4gc2V0dGVycyAoc2VsZiAt
PiBTZWxmKSBlbmFibGVkIG1ldGhvZCBjaGFpbmluZyBsaWtlOg0KPj4+IA0KPj4+ICAgICByZWcu
c2V0X2Zvbyh4KS5zZXRfc2VjKHkpLndyaXRlKGJhcik7DQo+Pj4gDQo+Pj4gVGhpcyBtYWRlIHNl
cGFyYXRlIG9wZXJhdGlvbnMgYXBwZWFyIGFzIGEgc2luZ2xlIGV4cHJlc3Npb24sIG9ic2N1cmlu
Zw0KPj4+IHRoYXQgZWFjaCBzZXR0ZXIgaXMgYSBkaXN0aW5jdCBtdXRhdGlvbi4gDQo+PiANCj4+
IFNvIHlvdSdyZSBjb25jZXJuZWQgYWJvdXQgdGhlIGZhY3QgdGhhdCB0aGUgY29tcGlsZXIgaXMg
bm90IG1lcmdpbmcgdGhlIHNldF9mb28oeCkgYW5kIHRoZQ0KPj4gc2V0X3NlYyh5KSBpbnRvIGEg
c2luZ2xlIHJlYWQtbW9kaWZ5LXdyaXRlPw0KPiANCj4gTm8sIEkgZG9uJ3QgY2FyZSBhYm91dCB0
aGF0IGFzcGVjdC4NCj4gDQo+PiANCj4+PiBUaGVzZSBzZXR0ZXJzIGFyZSBpbmZhbGxpYmxlLA0K
Pj4+IHNvIHRoZSBjaGFpbmluZyBwcm92aWRlcyBubyBlcnJvci1wcm9wYWdhdGlvbiBiZW5lZml0
4oCUaXQganVzdCBvYnNjdXJlcw0KPj4+IHdoYXQgYXJlIHNpbXBsZSwgaW5kZXBlbmRlbnQgYXNz
aWdubWVudHMuDQo+Pj4gDQo+Pj4gQ2hhbmdlIHRoZSBiaXRmaWVsZCEoKSBtYWNybyB0byBnZW5l
cmF0ZSBgJm11dCBzZWxmYCBzZXR0ZXJzLCBzbyBlYWNoDQo+Pj4gb3BlcmF0aW9uIGlzIGEgZGlz
dGluY3Qgc3RhdGVtZW50Og0KPj4+IA0KPj4+ICAgICByZWcuc2V0X2Zvbyh4KTsNCj4+PiAgICAg
cmVnLnNldF9zZWMoeSk7DQo+Pj4gICAgIHJlZy53cml0ZShiYXIpOw0KPj4gDQo+PiBBcmUgeW91
IHN1cmUgYWJvdXQgdGhpcz8gIEl0IGp1c3Qgc2VlbXMgbGlrZSB5b3UncmUgdGhyb3dpbmcgb3V0
IGEgbmVhdCBsaXR0bGUgZmVhdHVyZSBvZiBSdXN0IGFuZA0KPj4gcmVwbGFjaW5nIGl0IHdpdGgg
c29tZXRoaW5nIHRoYXQncyB2ZXJ5IEMtbGlrZS4gIFRoaXMgYnJlYWtzIGNvbXBhdGlibGUgd2l0
aCBhbGwgdXNlcnMgb2YgdGhlIHJlZ3MNCj4+IG1hY3Jvcy4gIFNlZW1zIHJlYWxseSBkaXNydXB0
aXZlIGZvciB3aGF0IHNlZW1zIHRvIG1lIGxpa2UgYSBjb3NtZXRpYyBjaGFuZ2UuDQo+PiANCj4g
DQo+IEl0J3Mgb25seSBhIG5lYXQgZmVhdHVyZSBpZiBpdCAqZG9lcyogc29tZXRoaW5nLiBJbiB0
aGlzIGNhc2UsIGl0ICpsb29rcyoNCj4gbGlrZSBhIG5lYXQgUnVzdCBmZWF0dXJlLCBidXQgdW5k
ZXIgdGhlIGNvdmVycyBpdCByZWFsbHkgaXMganVzdCBoYW5kaW5nDQo+IGFyb3VuZCBjb3BpZXMg
dW5uZWNlc3NhcmlseSwgd2hlbiByZWFsbHksIGl0ICppcyogZG9pbmcgdGhlIEMtbGlrZSB0aGlu
Zw0KPiBpbiB0aGUgZW5kLg0KPiANCj4gSSBvYmplY3QgdG8gdGhlIGZha2UgUnVzdC1uZXNzIHRo
YXQncyBiZWluZyBkb25lIGhlcmUuIEl0J3MgbGlrZSBwdXR0aW5nDQo+IGh1YmNhYnMgb24gYSBj
YXIuDQoNCkJ1dCBJTU8gdGhlcmUgaXMgb25seSBvbmUgb3BlcmF0aW9uIGhlcmUsIHRoZSBJTyB3
cml0ZS4gVGhlIHNldHRlciBpcyBqdXN0IG11dGF0aW9ucy4gQnVpbGRlciBwYXR0ZXJuIGNoYWlu
aW5nIGlzIGlkaW9tYXRpYyB0byBSdXN0Lg0KDQpJIHdvdWxkIG5vdCBjYWxsIGl0IGZha2UgUnVz
dG5lc3Mgc2luY2UgaXQgaXMgUnVzdG5lc3MgaW4gdGhlIFJ1c3QgbGFuZ3VhZ2UuIEFmYWlyLCBz
aW1pbGFyIGFyZ3VtZW50cyB3ZXJlIG1hZGUgYmVmb3JlIGFuZCBjb25jbHVzaW9uIHdhcywgd2Vs
bCwgdGhpcyBpcyBSdXN0Lg0KDQpSZWdhcmRpbmcgdGhlIGNvcGllcywgSSBhbSBpbnRyaWd1ZWQg
LSBoYXZlIHlvdSB2ZXJpZmllZCB0aGF0IHRoZSBjb2RlIGdlbmVyYXRpb24gYWN0dWFsbHkgcmVz
dWx0cyBpbiBjb3BpZXM/IEkgd291bGQgYmUgc3VycHJpc2VkIGlmIHRoZSBjb21waWxlciBkaWQg
bm90IG9wdGltaXplLg0KDQogLSBKb2VsDQoNCg0KDQoNCg0KPiANCj4gdGhhbmtzLA0KPiAtLQ0K
PiBKb2huIEh1YmJhcmQNCj4gDQo=
