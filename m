Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C6CBEFB8
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 17:45:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF67210E653;
	Mon, 15 Dec 2025 16:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MlEF24l+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4844145551;
	Mon, 15 Dec 2025 16:38:30 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765816710;
 b=mnegPv3rEWybW1SPKO7Jyms8lixwrp1pqIBUtNuI6rGmcZP0PMQaXprvkQskQb+aPJ7Bo
 AoLh5F2t/6GZ1yzRNC3VRtTWzL85Ij/HJKzP0ELeCfR+fKlojCLFLh5h5eUabUmCXHYIKXR
 6MssSXYw2r3SHh0elz62leFTEs0NqegCOrgP0mDHg+wIlC9rPADK4Y/9XnSzXYMAo5XcPKV
 bIkGqhWZKWdsjDzYAzGX496+PYtzCbeEsgrAjWY97lM9i2FOXTAxAKd4mvewuhVU0UYyBfX
 qrbIMNujkEkMHO1cwCpBSX5kHie6vKkuiJlU5uNub9sNyYYO9S4TjYAbFvtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765816710; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YtVycY28tUkEyvR7byKEL1tphhGfttN52SlQymMgsKk=;
 b=XAbs76sR4Lpqevr6vAbKMHlzyGsVcZQ00QaX5YBCeBJDhOP3Qc4u5y2m52wAYCGywj2U8
 kFozPhZRNOIIJSUrVyndT/wTvQuEhfmwKqYn9R4wYKj8D5qbi5wL4Zy1Hg52xYCKDi9CUPi
 eotAT0n5PkuHgg4rt7zUBZhjgQRbPb0LKC90S3dHlJqpoTfhhnsBA1cGJBPa/dvMgl24WMa
 nmcfPaFa4y16b1+ffRes7RlaDzwe62qQXOZ1Bg3PaucqoVZ0+L/3QpkcRwm+zVu8Pg0A3Qg
 0ccZLYXR6QsPe6KfBLDsoAMS/H4qhuv3iv98hBzJF7D65pbPc0wcXwR0f49A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1EC7645518
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 16:38:28 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47F9A10E641
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 16:45:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI0Z/bn25v3PcLeOeky6oAvwEvciMywm1PV9+v+yYrA6TRxfMo68cjkoFpfz4ZWX+P7Ju7KEvi0WNHG92m6Y5j4P4B1r5eewurpEHbsVXoifd/HX6Vm90COzMPTaByeQL+F2S7JBJp9PA8xgtoCNXqKDWIBUand5IbRFTG8TQtuotiyO2eUtLx4gNZ9OGtK9H6o6Ny+dBiNkVlsTApnb59hMwG+5jBj05I5wRHHUw+VUKuIyjxCqjM1eg6dWSxO+txLp2Tt4ApuAHk841yudmMO2gPQlvaJrMpAywczbO0Zi1WhsWWM35lPBR9PB6kNf9flG3KVd44yhZiXj4LvbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtVycY28tUkEyvR7byKEL1tphhGfttN52SlQymMgsKk=;
 b=RmoIZxw0d8W5bR3O+AnbjyiVFkIKZ+6sHiislC8b31ooJjUDp1B6YSFRcljKLCBqnPXN+2Uc/fnm1TlTL0ZGrSNQle4aBwdtJTa4jZiEcBLDKK+wisYbmvkMWABMOZ8dXxKODDwCrkXcCI0w/Jgtb/4yO2TSWQKgwNSYr0AAmmeZkJgrGX/AXYFJObM1E6lOLJS0KWVEAZaz3K3KfVuDS6/i5LudbLOU8mVB/ZFl6BEwOH5lcQS+ipkxg3LzihNb096rlqoZn8s7S+TM/C4ZdM7kobNeOtPt28/XC0UaUK9kJik5hsDZxpTVinS5y8b2wZ9uY2hXjkbywlze7+AElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtVycY28tUkEyvR7byKEL1tphhGfttN52SlQymMgsKk=;
 b=MlEF24l+SnQqhIEO37leEAh4mrXHXp/i1jXx8XfMS5EANSfCXlj6i7tZV3HGi2+TqHzNPXcKT2y3RN4z/YtF4YpbyaL1uO/jH/PwZo9ksjrso5J/GqVHcdJ079CekEYaXnMxBAee/x8jskWe9D2Wag90liIvjFM0UbadX8fGHq4anHbnf5GmzVpmb87KiVCXNJgzd1ERPz4k2qY9zwTE0IrzpmKEzJk7UQY+GighITDvTXd0PcEImsQkRMNfSpogFdAxA4tPCumSi0i9OfVso6vPY3YCX/szyLYYmkn82zeD3u3tvBYdGRFTjqQYFXiqtXJOvjijBfCuEF80XpPvIw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:45:47 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 16:45:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Topic: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Index: AQHca6j1wQX/qkHUuUaaDA2+kgrCnLUil+8AgABVRAA=
Date: Mon, 15 Dec 2025 16:45:47 +0000
Message-ID: <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
		<20251212204952.3690244-4-ttabi@nvidia.com>
	 <20251215114036.302303e0.gary@garyguo.net>
In-Reply-To: <20251215114036.302303e0.gary@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|CH1PR12MB9720:EE_
x-ms-office365-filtering-correlation-id: dc23c902-8a12-4b79-2a01-08de3bf965d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?S1J1NkV3QUdxRkh4anNUTUd4cUFuY2YvcCsyOFdRb21kUzkzOUNIb3MvNTFp?=
 =?utf-8?B?amNSNVFoMFJDVFlHeU9RRXh2bGFxcmFHYWg4VDRrMW5ndzU4dG1jWW1vMkxl?=
 =?utf-8?B?eDlJTDFISnVpNHBaV1VYWVdFWmRISGpJRHhwM2ZBK3crd3ROU3lRN1BpTTVk?=
 =?utf-8?B?enRhTzVjbnpibURlSStmS2tKYWd4RXRBR083UWZSc0xrU2UvY0hDWkFtMjZ6?=
 =?utf-8?B?TW8xSmgzVGFuSHorSVVZOFJIVXc4VEpkTm9pRjBxMXFVN3RTNFFVbDk0eVlT?=
 =?utf-8?B?dFBaeGRlR3lmczl6YWhOOVc3Zmo0SURLWS8rNE1EeGNOWVZmUENlZUFITnpO?=
 =?utf-8?B?YWpjQjZwb0Z6UllFSWhhYzdYZ0lpSHdwWFlQM21jV3Z6aFZwNk1wYUowNGFU?=
 =?utf-8?B?REVIOGtXQVFIOHRmbjF3M21CemdYYzRkK2tWTWFpVnVaby9IRHpyM1V1NDZW?=
 =?utf-8?B?UUZEdnc5TDNPNWJUSWl1OTE5NE45WDVzMnEwT0ZrTUJKNTZ5QXFadm5TVUtX?=
 =?utf-8?B?Nm40eXJWMU00VlpDdVVSTTJiSUw1eS84RW1iTDRvWGYwcEwybzFyYmpWVENS?=
 =?utf-8?B?SlZFRmFUR29jK21ZVEdXdnNHUW15Z1NQL1d4bHZCd1JVaDNnL2ZZSVdSMzM5?=
 =?utf-8?B?cU9zY1ZubE12VHJ1N24xNzlVTFZIb1BHbklUVVFmNmM1Z3dDWjVFR2dSTTBW?=
 =?utf-8?B?MVhJeDBlOGhzTm1iZGF6a0RwYWRrby83Wnd5Wk9WTk5UQXRXYnkxQ29LV3lk?=
 =?utf-8?B?SjZGYTN5c3dPYjVCc3NWaVNyVkJZR0E0WHRlRis4T2dZYTAxSk5VeXloUGhT?=
 =?utf-8?B?Znd3bHFwdTVldkIwb2JQandkemo1d1RBUGlyanBIaWNiMUtZY1lyMWQ1dEFX?=
 =?utf-8?B?bVduamdBTStLTTJ0YnE3VzNqQ2VtUlJYaXgzOXhiNjFuODNleDBwSnN3REZ4?=
 =?utf-8?B?TUkydWF5UHJYUHYwMkV2d0g1cnZidW5uWlZSTjlpUFBFeUE0aHhDZ2kydVJK?=
 =?utf-8?B?Nkt3V215ZmhrS2hQNG5QSzdZTWdvR1pUY2NtQmNSb3A3SzlYeGUzQ0hXd044?=
 =?utf-8?B?R1lLUzh6aTFYc1VWdXJEcnlIaGR3TXNnaXdLenM4L3JpYnBnbC9hVDcwSHdU?=
 =?utf-8?B?bzRNZnZ0QWg1UnY0VGUyZE1sVERObmtteUtTS3pkaFNlVTBpZnV6STZuL2Ji?=
 =?utf-8?B?NjBVQWQ5SW9wOUtrQUZkZ2hCeGZuMUUvbUhQcVRmVS9qemVuN0FJNkZWeXFr?=
 =?utf-8?B?RHlLS01RRXJIb2VuM0F1akl6UGlzbnhsSG5rMklTVFNvWDk0UWhha2trQlZO?=
 =?utf-8?B?WW9wSmlwMGdER3JIZi9Ta1VjNmJnVnlEdlRmdGdVdCtZQ0JoZ241ZUxtUlJn?=
 =?utf-8?B?bGZVTk1HZEVZRlcreUVkUVlBcXRPL3pvMktWbWN6MWVqcUZUY0RjZ3c4Mk9T?=
 =?utf-8?B?S2haTnlkZEozVmZRZEhtbUZtcktDMjhZYktEajRBb0ZiK01GUnBWQ1U5aklF?=
 =?utf-8?B?bkx3c1ZXb3AraUZPTHMyZkgydVF3b21UeW91WEZMOWlKTWJkd1lIMHIwMHZv?=
 =?utf-8?B?QjR1dFR4cVRVN0RQSnZ2WjhKRDFDaG9JaXhFcktzajJ1dUlMZ0RhM2ZYSVNo?=
 =?utf-8?B?dTZXVmdDSU1BV1dXM0YwWFp3WXNscHJsdzE5U0NtaWZocDZmc3V2bkdoZXNZ?=
 =?utf-8?B?dTdEbmIwRiswdzVLYnJlTlAzVGUvT250T1VDc3hJdUJmRmF5ekk1REdCUnc0?=
 =?utf-8?B?SGUxRE1YRllkODJ0R1VqMTdjWmNiczNtMlcxTURkL2xMNlo0WnViOEFLalR1?=
 =?utf-8?B?eFdOUlJ5OGdsZTlRZE40UTEzdEZ5WE5MbGM1M0dzaEo5R2FsM2VXREs4U2pw?=
 =?utf-8?B?N2h3NHlPS2h4UTdpdExkbVJINUFWY3BlUWczVmNRZU9Gd3p3OXVsTDVzd2dN?=
 =?utf-8?B?R0ZjSkQzMnQrbmJpZUt5QTJDSzdPWFFqNVhpVlQ5TjNSWjBPdUVlV3pSVU9M?=
 =?utf-8?B?M1VKaFMzU1V4TGhSTVBaRXl5MkhQVi9qSjF6enNKR0JCVEprSFNibzhlM0Qx?=
 =?utf-8?Q?h9dUmg?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a3k4b244TG82dXlxYTIybjJvZkZHaFpGakk4dCswMzBremVLczFVbU5EcHg1?=
 =?utf-8?B?T2pRLzZDZG0wcTRJTW0xYjhhNEN2Qzh1S2lHMnJuaFEzL0JsNDgyMGRmeldv?=
 =?utf-8?B?aGMxVnhjL0JDaVNQNDI4dnE2WDdCTzdNa2ozcDlFYldDdExCaFpXWFNxTktV?=
 =?utf-8?B?VmM5QTVKYWRkclFIT0pxY0xLWHBTZGJKdzVGUDdkY0EzL0RBUTlGMlhLekdZ?=
 =?utf-8?B?aWFDeUV4VFpSWGIxNnlPYkwwbzRGbmJreDZmV3JGTk1vNUp5cTM0VHQzS0xo?=
 =?utf-8?B?SzhaazdZNmhpbS8xMUZEbU91RmVOQWUyU2lkS3RGVm4rZ0U1YTVJbW5QdSt1?=
 =?utf-8?B?Y2tJQkcwdHRzbTZlNXdzaXJJZXZYaVRZZzZ4MUdVNEl6ZHF6RUQ3c0RnZ0FI?=
 =?utf-8?B?RkRVUVNhbkVmOTJQbkJjYjg0dHhHYk5BYlpvaHFXN1pjWUhDLzlZeEQrb1cz?=
 =?utf-8?B?Yk1rQ3BINUFFd0ZEV3FlcXpydHJBRG15OFM0dlJwNm9OSmJ4M2Z3MXVaN3lC?=
 =?utf-8?B?ODkxUm1wSDJhVXZibmJ2a3JUTzIvQWl0ejNiN1FiOWlrdG53c0E2dXpJeXhl?=
 =?utf-8?B?ekhqRm1vTFg4Y3NUanpVc0FTTkU3d1U2cy9QUVZjNW53NFR5NWxiSWIxM2ZQ?=
 =?utf-8?B?NG9mYklBUmxSMEJubXpmR3MzZEowaGZOZTBsWFYyUVRpcjRjak5LSTQ4NkRG?=
 =?utf-8?B?WkhjaHpocGJwSDdEOTM3QUo3a0RRd0ZTR3ZTNm1ZYTRBSnRoeExNMVMxVXdG?=
 =?utf-8?B?S1JDTk45Q2JSYlBsT2IvN3hsUHZzYWJNdFVCNS9xNjhHSUgrc0xxOFVsdEt5?=
 =?utf-8?B?ODlsNk9HdUhPVWhuMmdWUzFKYmwvNks5bFROUDdpenZwN3hHaE1uRy9JNmpK?=
 =?utf-8?B?bHg2RC9mL2IvSkc4aFUzSDZVSkw5MWhGcmFUNDlBSmcxOFRlK1c4disvdC8y?=
 =?utf-8?B?RUZUUkZTVWtmRVYydE01WFNsZUxVL1luMjRrVWw4UTU4WktUM3RITG1GUWl1?=
 =?utf-8?B?YlhOcklxanlQNnhUcUlHVS9rQmxBN21DK2tsb3JSN2Q1ZjlTdVdLak5CSjdM?=
 =?utf-8?B?ZGE4K2Nhc29uOHF4aXdiL2pzWE4rU2h1ZlJlZnJGMzZJbzhMckdURWloWGR6?=
 =?utf-8?B?SjMwbmdHZUFqQW5HcDN1bEhwVXZ1enZIM2w0UlpGU1ZFL2o1ZzgrU2FyU3d6?=
 =?utf-8?B?UFpuUnhiZHR4RSszR25KS1Q5RkNLQzBoT1R4NndPSmgySHFhMWh3QVQ5UUQ5?=
 =?utf-8?B?RnhOc3N2Z3ZKbTVCMGovMmpLVkNPem4xaDNrK2xhSEcvcG5PSjV4cHQrMXBZ?=
 =?utf-8?B?eWdieTA3TGRHUnk2bC9qVURPTWpDQ0dBaThZZElLaU04RjJ1eFV1TDRSMGxB?=
 =?utf-8?B?eUcrZjRHcjdzSTZqa0xuOURlSUI2ckhRVitSKzQrRklDVlRmM0VJLzVFbC9j?=
 =?utf-8?B?ZzlFS3pTV2ZrZFVJVnRXRFVLaG40Tk0vNVgvN1dKTEhVcml1RThNMlhEbU1V?=
 =?utf-8?B?c2FQUnVtRk5LWWxmSnRYZDhKQVZ3R0RQMHJhaytBL2wrQ0gxQ1VRTGtHemJx?=
 =?utf-8?B?Ni9UODRGQmdOYjkvYlgzUWlpenp1RVpNcEVNS1BaZXUrMmNzNy9mbStaQmZl?=
 =?utf-8?B?dmpsYXlERXhtdW82R1ZMR3BIWCtaU1pJM0t5Ulc5RG9Wb2s2Rm1qOS8vZVNw?=
 =?utf-8?B?aUVOZEN3YnN5VFFjSlgwRGlLd1U2WkFVbU80NVRjT0Y0U0wrVitIb0IwaVQw?=
 =?utf-8?B?cGpodGhWUy9mM012T3gyRlJ6TzdsOVNZZUdKTTY3UUkxRS93KzhkYXcyL0dO?=
 =?utf-8?B?Nkc3WTVvcnovOWJCUFhBNkNqVzNiOUhHMUdzbUI5bUowd1BVQ2hvMldqNjFT?=
 =?utf-8?B?VXhvL0p3U3ZpTXRVUGtGdWNWVGlGYzUzN21aUHo3U0JhdnJ6UGFuclFna3ZN?=
 =?utf-8?B?c05aRFVXQmU0Uld3RitOSWFHQ1JQY21ES216cFhHYVlFdGROemVJM3VwakNr?=
 =?utf-8?B?bGFBTjdZaXJxZFhXOU1SVmFnalgreWI4V1hGSVNYL2dTa1h3OXIrYndtdS9Z?=
 =?utf-8?B?WU1wbVI0Kzd4VXU2S3NqbUpFSEJEaFdscEU4RU04azR6REQ0MWZZUVNYMms2?=
 =?utf-8?Q?7rLgiO0C2sY4vsFC1rOfoftSZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CB013613D387E418B7D27E1667759D6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc23c902-8a12-4b79-2a01-08de3bf965d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 16:45:47.3738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 7BVLbW+GK12hH8CcWak21htXh6QkWBG4hWbP+9rR7EmhhsJc9dzWGv8rtYMRcn+DdYXSxLRGVvXjcEymbFDmaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720
Message-ID-Hash: 62E736TEEDZCLVXDBA5FKFBOXLOML4JR
X-Message-ID-Hash: 62E736TEEDZCLVXDBA5FKFBOXLOML4JR
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/62E736TEEDZCLVXDBA5FKFBOXLOML4JR/>
Archived-At: 
 <https://lore.freedesktop.org/5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gTW9uLCAyMDI1LTEyLTE1IGF0IDExOjQwICswMDAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiDC
oA0KPiA+ICtzdGF0aWMgbXV0IERFQlVHRlNfUk9PVDogT3B0aW9uPERpcj4gPSBOb25lOw0KPiAN
Cj4gUGxlYXNlIGRvbid0IHVzZSBgc3RhdGljIG11dGAuIElmIHlvdSBuZWVkIGFueXRoaW5nIGFz
c29jaWNhdGVkIHdpdGggdGhlDQo+IGxpZmV0aW1lIG9mIHRoZSBkcml2ZXIsIHBsZWFzZSBqdXN0
IHB1dCBpdCBpbnRvIHRoZSBtb2R1bGUuDQoNCklmIEkgZG8gdGhhdCwgdGhlbiBob3cgZG8gSSBh
Y2Nlc3MgaXQgZnJvbSBnc3AucnMgKHRoZSBsYXN0IHBhdGNoIGluIHRoaXMgc2VyaWVzKT8NCg==
