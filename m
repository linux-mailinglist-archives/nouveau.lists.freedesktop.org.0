Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B963CFBA76
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 03:04:39 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08CB610E25E;
	Wed,  7 Jan 2026 02:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l+NLdRa/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 89CD244C95;
	Wed,  7 Jan 2026 01:56:22 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767750982;
 b=zSKLLRpoFsAWmJtUUwZcS7jcLfn+OHTOhgPzNYeva7vfEIXFAUc1Te+K8+6EqRzRx0VvV
 fUFVgUwo3fqI3m+N2Ry6PThUxGGw9N0UDxns1UfIgynZgEZX4NFePJxN4zhUyZ947hlgkeS
 ilhorNouVtb4U2gpOpaHTI87UnrblhccmdqE0mj7UFlzFJfsJufPvFHMoSO38Doy8iqFxcg
 e+IZqrbqkCwt1FsMrS1BUTNDBMJDVvkT3j1x5Mno0Gv4PKzhGEMC47ZIhMMdvEL/wySQx7v
 4mjJ6zUjkFwprmzCw23Pav5Vfp1u/ygdFjxACGVUMGI09BRGXvsCOg19Xw2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767750982; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=H2ePMgf54HVG5lZnItHKnxwHFEBK9/tTIUoQdSOOa2o=;
 b=LAvANWi1IgPhDWTzcTZyY37WtqTolpDC3YNHyRiWoIq4qOb0QKiK33BlVXqGKEBF4zZwz
 AYYXBhykU4vmeWW00DNER3tGwRkAOcO2UEb7iMhNesTUQ60nGattMGfTns5F4WH5+Cx9wHb
 KD4COPbqnqNtNEzRkSehhHZtfhPHGLU8d+tX48GG9faIzq4gRgKCWUadUUq2jCqwm25DjA2
 JjdzdLF+cgpzBsKjghAXywVXssgwUF10dMHSHQWapfVOqIKu91+ZWFwFMtOjivhsWbwdne+
 t1wgwVUS4gDdWn31ph5S1ywr5zdIlQ9lSkD6pypFse+EdoJQm2Se3Xwiqaag==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7F0B444BB6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 01:56:19 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012026.outbound.protection.outlook.com
 [40.93.195.26])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F88710E145
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 02:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDpzV4iuGSXAyQ3YKaclivIDvLJIBAVzHEUEKZmOYIgQIW1orJ0pUSEUObb4+1Fxf80Ocv4KaLGTOk569PzGfS+Pl8wxVAMzulrLsrOyMSSnCO57YBvkDjy9U+9dVLvTvZWTS3QhHRZ/s5WPfKEmeyW6WzIlvcMFmVFCX4kxzqP4TGzjDwv+7mRJHk7O/PeHLEXQCZOjCbgAnbSqLQBMXSyJXEDmBlyd2nlenvct6XDnc9pH2NPt39V7zrvSFl1oTyeuTzsPLtaTqxjozZrKA0D8Oxb0D5XnWtoFtlGT0/vtvI7SOKRU5RsfwWljzRpBN808BsV+R+rGMVacmWQMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2ePMgf54HVG5lZnItHKnxwHFEBK9/tTIUoQdSOOa2o=;
 b=rbWDlx37Q0yH+aJpeO+/h6Gf4BbS/40vwXEfp8gXzeoB5mjeW7XR06OLfZiLPmbTDePheZ5ot/zEJ4K1L711tbhPkYRMrbQcdYL8ERKIG419YQo2ijQl/pGMb0HhT/i3Nd6dZvBj8Ce0nLPD9zfyhwgAGF/9cuZznQlON0Lbs2IUS0oYPvPgdWHof5fvazHtAomg6OVy2ZGI5kjFVl7WMKhcX6cInNG5VDcxigSuvys47RTPm6dVfyEvC8ooAoScxnnJqqN+PPM1zpoLZdxEFx7N9m7a5G3eDWhL6d11ieh9Dh2P4gvzQuZ5AROLBLNyndgh6N8m6UaGRPMD/m3DUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2ePMgf54HVG5lZnItHKnxwHFEBK9/tTIUoQdSOOa2o=;
 b=l+NLdRa/YAG/U9Vz99CmsFP9WLxDHGl0CFK2o0KLbiu+rtmRdlGi3f2wvnaxquklILqa7/kcSTAuJJvbILqQm0lH8waXk2Hd/5WQ2+I2nRqT9ntDpMRw9b62AayGFxHg1PjTNKUfXndzmtYLHX0YMqMZeQZQFKotBqefP2q4WLxXp7XklLBAdb9SqXC+Eo4t62TE18BC2hCFPq2sFoCnpmi7RJLx8caRqOWzu47l6yWqhey7CnxiM1cmsmcBqQsyiiE843cwJ0XK23H8MlBlhq5xw2OmCDduJBX7oCYiHUgZGs6MvWtlRyRY11x6ULE2Rk+fxonztcvluMbEQMEzWw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by SA1PR12MB8885.namprd12.prod.outlook.com (2603:10b6:806:376::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 02:04:29 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.005; Wed, 7 Jan 2026
 02:04:28 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Thread-Topic: [PATCH 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Thread-Index: AQHcf3RmC1aOwceIiU+yVLqZNlr27rVF8rGAgAACTYA=
Date: Wed, 7 Jan 2026 02:04:28 +0000
Message-ID: <a49a1d378e3d2828bd504de1596379e12becee08.camel@nvidia.com>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
	 <60c8a10b-c333-412e-8b13-446a3e04c41d@nvidia.com>
In-Reply-To: <60c8a10b-c333-412e-8b13-446a3e04c41d@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|SA1PR12MB8885:EE_
x-ms-office365-filtering-correlation-id: 0ade899d-01d5-4472-78f8-08de4d91171b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z01ZNjRPZytRakdJRWZnNG1nL21YNE1hdytHWXJ6b1ZhUmVjeS9XeExSMHZM?=
 =?utf-8?B?SlF5aVAxMDh1eVFQVGMwb3dqdmVseXYweDg4aFB5MVZjVDhOTlhZOUJUb0VU?=
 =?utf-8?B?N09oV0VvRGlCcFJlSEdYanIxeHVRMGI0QkF0Ry9hSFI1RmxTWTZSNmM5UE5W?=
 =?utf-8?B?MTlsNElyeDVnSC80bkNOYWF2SSs1VnVmeDVIckdSV3dtMUNWcTE3bHVnaXpZ?=
 =?utf-8?B?a3dIeGhEVVJ5aCttWmZyUUZtVmxSZWpSNTQxTHVIbWY1MEZmTUZDQXB1OUpR?=
 =?utf-8?B?R2pVdFZlOEFOUDNiNXp6TmZVU3EwRHhaaTVtREVoV1NzTjV3cnI3MVdYbm5a?=
 =?utf-8?B?STU4aEtOUkdScDdYK2M3Qm85Y2c1UDZOU2NUWTJLQW5USWxqL1k2SkdJenpl?=
 =?utf-8?B?a005MWdSdzBJeHR5VFpNT2Q2Q0Noc0ExK1E1K0ZicWxWL2JSalY4c3M3SjhM?=
 =?utf-8?B?Z2tqUERyS09IbU1kYWttUTV4THFkS0tERXJWcFRMUjJkK241YVNQVGVVclpU?=
 =?utf-8?B?dENPdms4UjRDRFBsQi8zdWJqS0VKcTZOSUVLV0o1bkdMYitTV3dqTzNoY1Bo?=
 =?utf-8?B?SmROQXFiRkVaN0xtSG1IR0dleGpRWFRjZ0tCMXIzcFFLbDdZSE03M3Vid3hW?=
 =?utf-8?B?OXRDc0dselpRajRFQ211MTlIVVJaRVBwQmZHcndMdlAvMXR3ZmFKOXQ0OW0v?=
 =?utf-8?B?ZzM0U0lUOVg1QW9RWS9ndHFYMjM2SUFKNVVCVGVhR0hIZXY2V3RYZHlTT3hF?=
 =?utf-8?B?SDZUcVJEekVHZHptem5sZDVld2thbnpIMzVTdGJwTUI3VklsMnRzVDlpQmJS?=
 =?utf-8?B?NjBKcHlVd3ozRmMzWXpDczZmL1hHaU5Cd3k4NzNrTytkNXhja0FmUUY3NlpL?=
 =?utf-8?B?djNOc1ZZWVZMV1crOXVaY3hJSDJXUjV4d3RpUU9oaDY2K1hEVmJuaFcyQUZO?=
 =?utf-8?B?eXpsc09nWTFZZENBTkdJQnAwL0RYYWozckxmcjV4djMrckxRbXhGb2ViY0JE?=
 =?utf-8?B?S29UU0VCVXh5RWNEL0VLTXhCbXo4N2hrbkhBc0RFd1Q2cGRWMlZOcFRvd3VN?=
 =?utf-8?B?aXFWMTdXQTA5RFI3Q1lJSjZ2dzFJS0FXYmFkdlFpdXJXaWNpNENMVDNla3lS?=
 =?utf-8?B?RVh4VERPNWc3SHFUV3h2TC9ObTh3MkxGY21JUklhZ3cwL2orZnhsM1djRmNG?=
 =?utf-8?B?ZXJTdzVTZDNlZFN6K0VLT1RwQlFCdUJVakI3UkZlR3REZ25MNjgyd21Hb0ts?=
 =?utf-8?B?T2E0OTZ0NGN2cEhwLzVvNkIzcVhBRkw5aU1qaENLdXhxSnNNSk5OWldyVDZN?=
 =?utf-8?B?cGZTRCtDWWppNThmZ0lWdWxKOFViUUMyeXcxSWd2dHhaMjdwc0wxNFJSbXNp?=
 =?utf-8?B?U3lOaVVkRlJaT2ZPc2szVSs3QWszN0JVOXF3ZVlDVEovNk9vcGhpalNZaUx0?=
 =?utf-8?B?eUJ3UXlmc24vdmVMWDhGNHlobk1GM203WHBxNmFLQy9DUjJtanNmTTdmZkJl?=
 =?utf-8?B?TXVPaFNyM0lRd3RRUldlN2djZ3FHS2xqVnNPcUlFdEZUMUN3M3hQY0I1RUM2?=
 =?utf-8?B?NlBWRmswblRzalVYbFZnejNmSDdPbTA5MUxweXlOTmx1UnlENkxjQy9aUzJu?=
 =?utf-8?B?SkNuMExNZHpmK0krSlZIbzBVRjhCTU1Xc2NYcm1iY0lrTzZZamd1V2dBTVpD?=
 =?utf-8?B?MnVaL3Y1NHltRVErUlZCNzVDd1prYTNFZGNEZHVRdm9MNVA1elo2c3VTSFBp?=
 =?utf-8?B?UWtxM0xtU2ZkdjZZWXRnWWpUb2JqWDhZMHFRTExYQjJjajdQQ0hoU0Vab1JS?=
 =?utf-8?B?MWhoYzNZZ0xzT1J4Qm9NMkQxNC84UHB0VkF4QVU5Z0tacktpQjNDMUdXcVB4?=
 =?utf-8?B?Z3FIL1BQNTgrYU05bG92VXFEcVhpOGEzK1Q0Sk1zV1FwUVdmYkcvKzFwUzRV?=
 =?utf-8?B?MzFPM0ZVUTlvTWxBS2l4Y0hrSDBrNldLY013T0pyMWROK29DMzZSRVpEem0z?=
 =?utf-8?B?OU5jcGRBSHl3NUdUQkYyYXZFckJiNTB5N2lEcTJRZXRpbVliRmE1VE9ydGgr?=
 =?utf-8?Q?X8SoaU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UnBSMUZrSGN1UTNvOUFXYjlLRm56WGx2UVBUZHRVeFljdWhtUElLMnlPUTJW?=
 =?utf-8?B?bHlyekZBTFJWU21VSlNlWkl3VE44NUVWT2dKeWdGTzkwa1VUM3Y4NU8xbDhh?=
 =?utf-8?B?K0NGdjlyak9lRHpkeDYrVU1ybzVtQndkaUF3a3l3MjdLNkgxT1RlMDFxVEp4?=
 =?utf-8?B?L2JUQTBERnpmODd0YURuSjFUdWZoU1d2UXl4eExUL0lhSUUvWEhnOHhZUWtM?=
 =?utf-8?B?NnJjVUZvUGhLT3BtbEVRNU5kNDhIeGlMeFVkTVRKbGFDTVc0em9VV2xnOHZS?=
 =?utf-8?B?RFF0VFRWendSanZGSEQ1WVRrcTkzenRxM25XWEZnOHFOK2xNUi8ya3B0SmtP?=
 =?utf-8?B?S1dzUGoyNzJXaS8zYk9jSTRMd01pT2QwWWhiV2dpc0hOSFJobHZ4S21KNGx1?=
 =?utf-8?B?R1RtWXFXK05kRHdCWEJQb2pDWTZ2dHNUc3RieGU2VWtPUmE1cmdoZThqMnhU?=
 =?utf-8?B?eXhEVmZuc0NuWHNHcHVGb2xaKzdFWlF1bkNLbXdNK29XUGR1c3Y0R1o5NHhY?=
 =?utf-8?B?d0VpdnN4Y0hHcWJ1aDl1OERqeTFib3JvbCtYZmtNTGFzcFNuSmMzQzdFaHBi?=
 =?utf-8?B?ZW5XMGtwcDFzSVIyV0tPUjArUHVwY0kyUmw1SHQ4c0kwKzZlVlRwK0lJeE9Z?=
 =?utf-8?B?QVROUkpmbm10SVB6dm1qU0VMSGF5QU9aVC9jWFFkM3hRYSs1UDBpa3JMY29J?=
 =?utf-8?B?V3NWaGVCSHZXaHdSWG5ma0p6TVRKa0pBNzY3ekEzbmZvcEhNVThmQ1RQQjdU?=
 =?utf-8?B?S0tTalR3TmRzZDVGamNNa3VqQitkTnVKOTFBck9xVzJmOGFYR1JDMS9lbkpn?=
 =?utf-8?B?eHhRRm1BSzRUK0xoM3k5UDh5OHppRXpyTTFVZmdrdlQ0UnF4c3VRaVJ1eHl2?=
 =?utf-8?B?TXlmZ3cxZVlRUXNlZnc3cTI3eEovZnlpdDJQN2F0MjlnazBtQU9jdWJsTDZK?=
 =?utf-8?B?cGlqSHd0YzZHQ0VHK29MZmNyNzc2TVNIblZ5ZW9Ra1AzYmhpb09JTUVWL0hK?=
 =?utf-8?B?SXJSOUdlQ095Sjl3a2ZTSDhWUHc2T013QWpDUG9reFpLWGpFbjJOOWhUSWxH?=
 =?utf-8?B?S0k1dnkyWTAyMlR3OE0vOU1neCs3dm9qSkVzOVBzaWRadGFRZWsrVWQ2NlBn?=
 =?utf-8?B?LzkvcDNnSkpxRTZhOHhVTUNYVXE1SGh5Wnd4ckk5SXk5MVBMK3lYR2tHN1Jj?=
 =?utf-8?B?bC8vTEF0WWxHRXFTcStUWEovTzZkMFNnY0JCa2JNUnhWTHV1WFNON0NKMUZN?=
 =?utf-8?B?RG53OVNGQzJhSU8vOWtuWU5jb3dxWVRDNWZyNFdkZ2dpRUU3VW5jWnY1TEFW?=
 =?utf-8?B?Y0hPa1pnNzlLL0xTbjVxZTZYTW41YUZ5Z3pIK0RjQkZ5QzB0bzJzdnRzY0tW?=
 =?utf-8?B?M3JxejdIb0V4WS8rYTJsbVBtZ2VhaTZjUjdPaFNPVDdKVWJoVmdtdmYwY0Ro?=
 =?utf-8?B?M0cyVU4zdFdMWjVSbnB2RWZLZFJlZlp5UFhCbTk3WWZuaDc3QjEySTZxUGpM?=
 =?utf-8?B?SUJPYWE0SGVHYk9wWDJ0T2RjaDY1aFZyQkdIL2pjWDFhQStYUTNkeVVlSG5i?=
 =?utf-8?B?VFRPTWFVckhUbkhCQmVNaXVDdmp0VDdnelVHeEJNbXZWUW5qdHpjSFBqVVhp?=
 =?utf-8?B?UEJJemU0OEJaQnl1dzI4d2UrWXBuMnNNZEpBOVNBZzZLbU44V0RINEx2dXkx?=
 =?utf-8?B?MEY2SUdWdGpUUjQ2N1d4UlR5L0xkbko0MElSc05uZUNsamlnWEFwK0RNaDNs?=
 =?utf-8?B?UHZtSmhZazZSdThzbllqZ1RFaWlWSCtvVER3ZGRTY3NUWWEydTFUbWJBTm1z?=
 =?utf-8?B?Z3VHOUtrYkpzR0l6SzdtUVgwbThUdzJyUTNJdnV0Q3VpdWtLbkhXZnVzZnFR?=
 =?utf-8?B?RmFEMy9xZVNGblI3N0o5YVZEMVo5RUl2ci8rZlp6b2I4bThWVWwzQTh3eUda?=
 =?utf-8?B?dExHOEhhcU1sTmtKOGpmMHJWY3gzc2VVcW9KUzlpdmpiMXRQZmpkTUQ4VWFn?=
 =?utf-8?B?ZnZlT3V0U3JEdGthS3E1NlAxWGlXcFp1VFNkNkhLRWRhWGs1UDZYMFlMeEJr?=
 =?utf-8?B?MllzNHJyaVZvaWFqUlgvMGxDcE9WK2xtWTBSRFJzZDl0ckZRdjBXUC9IT2ND?=
 =?utf-8?B?dkFTK01OQVByUExsQmZocENVZFNoa3VXSkp1TWtkWGJMYmVRRXpYSG5KSG5a?=
 =?utf-8?B?cVF4YUR5ZEUrZ3BGbXhhNzE2cVRuMlpybStUb1AvaGNwdmQ0Rm9rTDVGZFlr?=
 =?utf-8?B?SmFlMzg3NUFjRTFHcGtxQ2NyeFpFalJqckx6NGU2SysxOVFreVRjWDQ5ZEVn?=
 =?utf-8?B?eWw1RHdTd01vN3F4QXNhcnRyUDFacnZEcG5xY0U3dk1zWWNxckFpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA3289483E99924FA505B0B2EB63534B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ade899d-01d5-4472-78f8-08de4d91171b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 02:04:28.5876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Mg4XS4N87017V1Akv9i204PolPZZs4v4xqvu0CbgY1bVL0kKvAi+jXwYEHUQMHEelHoiZaYIuMNqqlVZKeQjPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8885
Message-ID-Hash: CST5VQQXQ3VHHEJFLYMYDJCB334JFXDB
X-Message-ID-Hash: CST5VQQXQ3VHHEJFLYMYDJCB334JFXDB
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CST5VQQXQ3VHHEJFLYMYDJCB334JFXDB/>
Archived-At: 
 <https://lore.freedesktop.org/a49a1d378e3d2828bd504de1596379e12becee08.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI2LTAxLTA2IGF0IDE3OjU2IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IFlvdXIgY29tbWl0IGxvZyBzYWlkIGl0IGFjY3VyYXRlbHksIHNvIEkgdGhpbmsgd2Ugc2hvdWxk
IHVzZSBzaW1pbGFyIHdvcmRpbmcNCj4gaGVyZS4gU28gbWF5YmU6DQo+IA0KPiDCoMKgIC8vIFNl
dCB1cCB0aGUgYmFzZSBzb3VyY2UgRE1BIGFkZHJlc3MuwqAgVGhlIERNQVRSRkJBU0UvMSByZWdp
c3RlciBwYWlyDQo+IMKgwqAgLy8gb25seSBzdXBwb3J0cyBhIDQ5LWJpdCBhZGRyZXNzLg0KDQpZ
ZXMsIHRoaXMgaXMgYmV0dGVyLg0K
