Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F45CCB9A1
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 12:25:30 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 75CA410EE82;
	Thu, 18 Dec 2025 11:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LZ6pgw7+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CB6394567E;
	Thu, 18 Dec 2025 11:17:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766056678;
 b=FrLh067XoUf4SUBOU8ItrWLp1MI7hmz1/9Hlruaiy1M0px59nrvY2biI66vvaO52j0mjs
 eQ+IP7ymS7ZiaQ3vpEwqUQpVkVsErZTiqmRy/+rljNDT6xhXdPeoR+6joVkUYUJCNzneKqy
 Tfl7Dof9T7+iG2f+hrra2eHZAxLglOW4TmntWJU9VjHeGztz3Fobk/cHH7noeS5jtyemWQh
 ISfMPZ25N6xUblPJCZ9qq56DTFkPCXQ/fv5Rp7v8pt+tJ2eX6uZtiIydbcTesXjY9LZkDG3
 RpUfb5N/SrWTFYnw4ZqBK2R/FDd3IWjieWL/aYBIhiXdz1IITVU9PRSu7hTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766056678; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZJFB6ASDVXeDVlQMjzw6o7Wlxth85lg0Pb5+IAussTA=;
 b=toNw1uy5SkfC3wBLmm2TxE5svIS7Kir3YASPnXojytUDPyz3IBdCZQm+ma9HQ+jAxHm+Y
 8yWOBGlC57qgQjZDdu71olAgBB5qjTKvG2COZ8LlF/EKzHoadjStVjG9GsHUSfhNWD9rIEC
 phJFyJBSJxgO8PCMe9cFFsREfmAWgxgM1apVbJwuV0YLOcBnOeZrLRlG4FNMWSQ5BoMv3/p
 P3aD6VEMUHvArF03TFox22cmpLHa9HdFTjoLiJ1uHKGF/k+PvNS20+BuRsyZNet2cLwQEWm
 2wuVaIqgWNiZJK/g9xA/uxIkamlEIOcB4xlXT2lPWhsKZN4X39IyiRN9i7hA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9D4AB45656
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:17:55 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011002.outbound.protection.outlook.com
 [40.93.194.2])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F194F10EDEB
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiAEbHl58iOjh97OcbZc+mXDc429olB7NhFnOfJa7Ylbs2DdkaONgpsHnYAcyKjQgujsKu3dkOQ+jIQhnZKBRPfWmx3cUlY5lTEJmpwrIrwobCYubZfVMDomS94X5b0cuj1V1iBAewtlwT2eb0U1AHb+/shT0b21BySWqbiFzKd86Tgm9qHg3Ocg5x06EDXMvC0Au8ENmb5q5LwAN/1pS7DzzL+yNgxeH5yy8u9MB1+q9ql1Aev0azDBXJ6/GHUIbncpZEHTMXXqsgNoOwdRUuLP1Ao2Xnbf6lMj7zfLUWNgX0Xx2qxIG3s+rDD6rbIVvrvbIIcHcbWot6lhUgPTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJFB6ASDVXeDVlQMjzw6o7Wlxth85lg0Pb5+IAussTA=;
 b=JyEJpsBcRrAYR5r1o5NejVn6EzTBA7oxOA6XKWM0FGSDLUaG5SZS1GoFkh6wMH36hEpC9A/5ukVy8XbVDt5UL9GQcL2IncSjtXkxVnf4foO5ymfUdttu7no18NiVmuPWH+UxwIV9Od6elmGtAQa7S2lAMp+2bCbISHpdV5b+2f4Zg5A9u8cambv/Er8KeTY1ObSF/ffynd4xcqO90PyhjQE4+OnL9kjRMC3+IXPNYfpX5zW+1I5e7wbw4RHGYcCB9lRTICeDdLtR2XgoYgI6oKiQyfqj/4MK+4owS66rrDe1iHef4nWnvQLHCnh5QDI9ODf13orI4U3xiWoG43dGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJFB6ASDVXeDVlQMjzw6o7Wlxth85lg0Pb5+IAussTA=;
 b=LZ6pgw7+WfoXdggnvjZpvCGc8xhpiQc4zRGRJ46lu08oF55R38MfFD6Vbh/JPL0ispjeEIC0Jh068jfKNmLul5VMVosAByOcrmK1Rfzt80+uCnnBJ0KMsfMjY9oca9eKsONqBWT/0nUwV9CGU2IvcPg7340yoQMh2/MZgDp66IKmBY7RWObVAcaZtZpnYjoCk+xlBDROOE4r/5XeHqoQoEH4p8ZdL7CSpXcLWzxBh9JRo7S69ViEeWdWyp4dcaE0xhWxrcTz39Os25+u80EcgE/xPO0ro3L8JVeW1ZsSZdJuSbGnUK5KkZ91wfnJpe1d4LdurbAFSArSC6NMz7ZFTw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS4PR12MB9682.namprd12.prod.outlook.com (2603:10b6:8:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 11:25:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:25:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 20:25:19 +0900
Message-Id: <DF1B00BDKMF2.3T2W6PRFBQ0L@nvidia.com>
Subject: Re: [PATCH v4 06/11] gpu: nova-core: move some functions into the
 HAL
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-7-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-7-ttabi@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS4PR12MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c2d700-3856-489a-e229-08de3e282245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTV6NkVjTk10RmFYQzZ0Sk95Rk9JaVlUSVZSZ0VTSkQ0ZUl3WEtuYXMwVjJs?=
 =?utf-8?B?OFc5ZjRJQWtTdUozQ3FOdGVDcVNQOEtnUk92UmV4cmJpYk1wYTUzQjNCZndJ?=
 =?utf-8?B?Mm9teVdrRFllSk8zbUxadjFrbDFyMEJoYkJORVJ1T0I5aUpqK3g4Z3lHaWhW?=
 =?utf-8?B?cWVCNXliUVdhMVVRMmxVNTBiMmJjRkpVVFRrekpscjFGMFRwb0RKTys1MDZB?=
 =?utf-8?B?ekVoUnNublRiL3hXTzJqY0krZVAzWTVTVWZXa3RrSDN1MDVMSkJrZElVaTQ5?=
 =?utf-8?B?MWNlWnJlaXcvd1pmazNGNENiODVxSS9JWUxEVVFZT2dvWitnV080eElWdWpx?=
 =?utf-8?B?WVlMVTd6cjROQlc1a3ZJaVBmbmR3YWJZTEhyVUJIS3puaHh4NEYrZjZySkR4?=
 =?utf-8?B?ODh2MDNXeTlSR1ArNXpZQkJmVUZseG5FN2RMWitPZ21FcGlJSzcwQ3I1YU5D?=
 =?utf-8?B?bUlwakhodlFrQksyKzNHdjV2ZDhqYW41SVFWblMzTm8rd0hRM2dPZTRYKzJB?=
 =?utf-8?B?bG1wTXo0WFRyYmRkRnlEL0JTQmhuOXZjK1h3Y2ZqdU5Tc1NQS0Zlalp4ZFU0?=
 =?utf-8?B?VjhkWGxuSlErSEtFOHMwdm9DTVpyR0tHUElPOGZPTldzL2VBcmN2SzB3blZD?=
 =?utf-8?B?dnVDMVJId1RYb3NycVJvOXo1NFNoY2dPVFF0c0tmeWREYStXVGtaNGJvZGZM?=
 =?utf-8?B?Tm82YW9aOVVWeE1wS3dIdTJGWDU5WEgzcE5CYXVBRnNHZ1BqamlkOUVJYWZy?=
 =?utf-8?B?RHFiU1ZYeXVkRGtaMlpDV2dNaWlFaGE2eWhNNHYzOC9iSlVLVVE1NjZIQ0xF?=
 =?utf-8?B?Q2ZvUVR0d1dBNllweHdPb1JxTzlUaEVmWngyRVpvYjNYbWg5OUJHRldPTEVz?=
 =?utf-8?B?akVLbnQvdVFzZUJEK2k4TUxZNHZ3UkdSZ3JDSHlnUC9nWXpSMUtJZlpWazRI?=
 =?utf-8?B?VGR4b2JGWTJkZTg5bElzbksyMkM1R3FhaS8rZjJzSnFleUJ3ekZubHJzcVhN?=
 =?utf-8?B?OHllZ0IwQnp1OS9aRjlONmthbm5nN0ZtdjVDOXFXQXNwVERoWkRiWEFScnY2?=
 =?utf-8?B?YlFTa1ViRXlDVjBZREo3ZXcyb3lPMmxwMysvQlVuY1JFOW5wTFZ4OFVrcEl3?=
 =?utf-8?B?MDY3SnpYKzRRVWt1V29sa2pQTFFGZ3I0VEFMUHd1VHpBbHptR1A1anU4Nmk3?=
 =?utf-8?B?YXBPQ0xzZy9vZTI0azZIVlRtd3F5OUd5THV6eTZWejFxSlZvYmtzMm5DbkdN?=
 =?utf-8?B?N3h3WEdhSFNkVlRWR2RwTGFRMVRDZ3NjQ1JEVDRjODJFZzRqZ0hKWUhLMlRB?=
 =?utf-8?B?bTErdm1Sc2dDdzlORGRCM1VucWhvTklBNUZpdEo3enVTUmpCa0JnbE54b0FR?=
 =?utf-8?B?MnJXb2lBdVgrL2NLcjBTczNFb3BnWElJSEdRUDZURWs5eWJNZFVNYnFNaHJE?=
 =?utf-8?B?UkVnaXpxYlJheUNNSWMza0FVcVVZdFpQbElLRk1UT3d6eGU2MDFzcldxRzVK?=
 =?utf-8?B?TTZMZU0rcVVjYzR1RUgwd2o3QVk2MDJGUTA0a0JxclpCdU1aU0c0bll0aHl3?=
 =?utf-8?B?cDVkTU5WemFrNEhRSUpDb2k5VmlScllZTTRqMUJNb1hwN0JRMDV4L01jNUpj?=
 =?utf-8?B?N3JXcU85bFlwZ3NuN1dreFdpQ2hBanVtamROaDRUZktlV1U5aEVoMC9DZzBL?=
 =?utf-8?B?cXdFRGZRa1lJanhXWlFJbFdEcCthV0RjeFhMSnNaWXRYMTg2STJlM1BFU2pr?=
 =?utf-8?B?UnBtNzZLSmNiTUNoOWNRNVVSTExFUWJHRUp0bmFtRnNKem1FaHpxZWtJV0lk?=
 =?utf-8?B?SEYrSUxyTXo1eFRCemFPdC9kN3pqNjdWdFJ0aFA0bnpDWTVDS3FiaXlSZHdx?=
 =?utf-8?B?a0ZWWEw1cGpwc0hFQUJUeExFdWZTcWtCeU5IT0M2NmlnUC9sQTRRclQ5Smt4?=
 =?utf-8?Q?7R2TLWJFdASj9uuDYh0/s0IZ76UF4diy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUQ5djdabUltb0ljRngxWXR5TGVHckV1ZzJ1dW9zZXRiR0ZZNERSV3o5QS93?=
 =?utf-8?B?Z2s5MUNHWFE2bTB1THJyYlBUSkRwbFFmcFM4MkZ5RWgrWnBMeVpaN1lTa0dN?=
 =?utf-8?B?WWZ5bjlzamNFTVB6emFTQ0JoRDZCMTk1dTRXWFYxWnY3ZDNsZVlMdk8zV0gy?=
 =?utf-8?B?aEJ2UStkSmlOcTRqclpwK1pib045UHJLSktTNFB4akR5UlZHTFZWTGJYM3ZO?=
 =?utf-8?B?ZTdqZlRWdTVBSXptUFZvSWtYRXBQdlcwZTJnekdMb2RiSmIzUk0yL2ozVjNX?=
 =?utf-8?B?VkJsUE9UN0l4VTdyaXBXRG1sMUl6UkJaR3JXeUVVNnFyTDNzTXhIaTFoNTJR?=
 =?utf-8?B?SjBNWFRMWVlKelIyM0g0aFJLRkVuOG45bTlDbEtpaElJaXJmcUsvU1dNQmFm?=
 =?utf-8?B?ME1mdTlmWWtQdjFkNC9TR0hKMmVremJnTmJoeHUzSk1hdUVZWlI3TDRENXQ1?=
 =?utf-8?B?WXRuV3RuTzB5ejhkSkRoQWJML0VaalBhMDh5T0NXbFJ4bHd6SjIyS3phekRJ?=
 =?utf-8?B?M3RBYzJybmNYOXpnNysvRmhQbjhkZXBBdWJGYmY1SWw2RWRwRUd1bUowWU5F?=
 =?utf-8?B?TE5UOEhkK2Ficm9nTVBkcnpBZmFlRTVCUFg5ZXBub0dxa0hSQzNyTzUvUTZH?=
 =?utf-8?B?elZKWlZuaGlQNlpEOW9jQzI2U1NpbXUzWEoreUV1b0dNTmMxaHQwd25VMWlv?=
 =?utf-8?B?emovUDRjdzA0U3JjSU85STgzS3duVXZsMU9DeGxQS0NRZHFOZ29wOGVOKzl2?=
 =?utf-8?B?WnRNeThINjY0elJNZGF4SnZrblFLY1UxS2FYSVpDNm5QUTYvYmRDN1hGNXp0?=
 =?utf-8?B?cTJHNzBBSzZmSE5qY0EyTndCaURVWlNXTkNtUXdNREFiTURXVnJveWJkWGV0?=
 =?utf-8?B?U09jcGdiQTFCN1J0YkxlZGZzZFFqYTA4cG5VQS9GRFY0R0xmcmMxNXA3UHVL?=
 =?utf-8?B?bUgrSnluQWpvWHVDV01Jakdvd01ydE1LNFBrOWJFeEZGUy8zU3lmSGdVVzU0?=
 =?utf-8?B?YzU1ejcyNVQ4cGlwUjNzeUFmcG83UlJrS0crOEtOT24yTVlRUTdDK0w4OTRl?=
 =?utf-8?B?NjJqek16cW9XYjdZeno3YUxja1ZFTXJkSjkvVlBiZ2I2Z3M1Qkd2a29kT3M5?=
 =?utf-8?B?N2J3Ykd3eFVCN3UvRFRJMnRFUlVLN0RKbmF0MVIzc1VXaUlBSjhOcDQvaU0z?=
 =?utf-8?B?YVl2aExrZUc0VC9Ea0ZSMHRNT0xyMUZTUFAzdjBFenNxN3A1R0RLcEtWMlpz?=
 =?utf-8?B?UktYSm5ZNGtlOC9pWk1hOU9HaEVlZ25wSXBlQm9sOUp2LzliTDIxNFozSXhi?=
 =?utf-8?B?UGtrWVVac203Q1RFQUxMcmNucW9ieWRFNVpBYTA0Zy94OWpaU2J6bHNaS2M3?=
 =?utf-8?B?M1hXa2xXUEJIeDdPNnJMQTljZHhQVzRTNFkrSWJJZzVTNXZQcFRVbitoOUIx?=
 =?utf-8?B?M0R6QkVkMG51ZWhuR0RtcVVqelJQKzdMSXFUdklVc2drbTdFR29CMjV6RFhy?=
 =?utf-8?B?Yk5WcytmRVZ3ek9aM3NkL2djenYwU1lPUG1SdDdRdU85Zm1VUlVVTzlqUWw0?=
 =?utf-8?B?RHNvZmhPSkQxRDJwc2hreFJtdEVBL2RFNURrWEI5UFpuL3lqYzJJQ2t4bGR4?=
 =?utf-8?B?UURzZWduOTk2UVRsc0RyUHZTbTZPa0Nrc2dvMVNVVXRDSGlzU3VaMmNmamtk?=
 =?utf-8?B?aGt1M0VDVDl2U3pxaWd5YW5YOURyTUQ2NUM2TmVYcU1LSVd3MXRxTWRnNk5R?=
 =?utf-8?B?R1JQU3htaCswd2ZUbDg4L0lseUkyZ1FHRDBjUDRkTEhWWkJteDcvRGVOdGs4?=
 =?utf-8?B?VE54UnRPSW9jYi9mZkR1RkxDd3ZQeTFkalViQkNiS1BveGxDRllkNHRiZWxu?=
 =?utf-8?B?QzRRMzd0cXU0TDhEb0RtcGovREdreHZRVmNnazJqaGlYN2ZHSWFYVm43QnVl?=
 =?utf-8?B?RnMrZFM1Z2tyQU9RMEV3OGpzSU8yRUZvUjFwZytNazlldkEzYkVpUzZlTllE?=
 =?utf-8?B?aGE5aGdXdzdtWTYvYkNEMXFqSm56b2RlYlA4aG9IVXVrWmRtMDk5Ymh4Nk8x?=
 =?utf-8?B?NnEwSnk2Y0lzYUkyV0JlbnNkQkkyWEhDYmVDdkJRaWgyTk1BdzZMb0F3S3dw?=
 =?utf-8?B?M2M0Q0lhZkRDeHlNalVMa1ppQVVkc3JLZTNNYlpKWnRJaWJtVy9GY0J3eUdQ?=
 =?utf-8?Q?WLFw2bemCtHOPcfIS4w9bXI+DMSPDCCbIID0n3IMBsAy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6c2d700-3856-489a-e229-08de3e282245
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:25:22.8943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tX26jvonrKVgcvLFq/MXSVqJ4aq8ovGeiX5DDLBCHLd0esWgX6hZd055VpjMseOCnlYZN1x3bw6LfM0YlkJXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9682
Message-ID-Hash: 77ZEOV7RLIZXBAI2DD7W4FSSVSDWCL6K
X-Message-ID-Hash: 77ZEOV7RLIZXBAI2DD7W4FSSVSDWCL6K
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/77ZEOV7RLIZXBAI2DD7W4FSSVSDWCL6K/>
Archived-At: 
 <https://lore.freedesktop.org/DF1B00BDKMF2.3T2W6PRFBQ0L@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 12:29 PM JST, Timur Tabi wrote:
> A few Falcon methods are actually GPU-specific, so move them
> into the HAL.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 45 ++---------------------
>  drivers/gpu/nova-core/falcon/hal.rs       | 10 +++++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 43 ++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 44a1a531a361..6b54c0ca458a 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -13,7 +13,6 @@
>      prelude::*,
>      sync::aref::ARef,
>      time::{
> -        delay::fsleep,
>          Delta, //
>      },
>  };
> @@ -394,48 +393,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
>          regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
>      }
> =20
> -    /// Wait for memory scrubbing to complete.
> -    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
> -        // TIMEOUT: memory scrubbing should complete in less than 20ms.
> -        read_poll_timeout(
> -            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
> -            |r| r.mem_scrubbing_done(),
> -            Delta::ZERO,
> -            Delta::from_millis(20),
> -        )
> -        .map(|_| ())
> -    }
> -
> -    /// Reset the falcon engine.
> -    fn reset_eng(&self, bar: &Bar0) -> Result {
> -        let _ =3D regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
> -
> -        // According to OpenRM's `kflcnPreResetWait_GA102` documentation=
, HW sometimes does not set
> -        // RESET_READY so a non-failing timeout is used.
> -        let _ =3D read_poll_timeout(
> -            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
> -            |r| r.reset_ready(),
> -            Delta::ZERO,
> -            Delta::from_micros(150),
> -        );
> -
> -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_re=
set(true));
> -
> -        // TIMEOUT: falcon engine should not take more than 10us to rese=
t.
> -        fsleep(Delta::from_micros(10));
> -
> -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_re=
set(false));
> -
> -        self.reset_wait_mem_scrubbing(bar)?;
> -
> -        Ok(())
> -    }
> -
>      /// Reset the controller, select the falcon core, and wait for memor=
y scrubbing to complete.
>      pub(crate) fn reset(&self, bar: &Bar0) -> Result {
> -        self.reset_eng(bar)?;
> +        self.hal.reset_eng(bar)?;
>          self.hal.select_core(self, bar)?;
> -        self.reset_wait_mem_scrubbing(bar)?;
> +        self.hal.reset_wait_mem_scrubbing(bar)?;
> =20
>          regs::NV_PFALCON_FALCON_RM::default()
>              .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
> @@ -665,8 +627,7 @@ pub(crate) fn signature_reg_fuse_version(
>      ///
>      /// Returns `true` if the RISC-V core is active, `false` otherwise.
>      pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
> -        let cpuctl =3D regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
> -        cpuctl.active_stat()
> +        self.hal.is_riscv_active(bar)
>      }
> =20
>      /// Write the application version to the OS register.
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index 8dc56a28ad65..c77a1568ea96 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -37,6 +37,16 @@ fn signature_reg_fuse_version(
> =20
>      /// Program the boot ROM registers prior to starting a secure firmwa=
re.
>      fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &Falc=
onBromParams) -> Result;
> +
> +    /// Check if the RISC-V core is active.
> +    /// Returns `true` if the RISC-V core is active, `false` otherwise.
> +    fn is_riscv_active(&self, bar: &Bar0) -> bool;
> +
> +    /// Wait for memory scrubbing to complete.
> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result;
> +
> +    /// Reset the falcon engine.
> +    fn reset_eng(&self, bar: &Bar0) -> Result;
>  }
> =20
>  /// Returns a boxed falcon HAL adequate for `chipset`.
> diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova=
-core/falcon/hal/ga102.rs
> index 69a7a95cac16..232d51a4921f 100644
> --- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> @@ -6,6 +6,7 @@
>      device,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    time::delay::fsleep,
>      time::Delta, //
>  };
> =20
> @@ -117,4 +118,46 @@ fn signature_reg_fuse_version(
>      fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &Fal=
conBromParams) -> Result {
>          program_brom_ga102::<E>(bar, params)
>      }
> +
> +    fn is_riscv_active(&self, bar: &Bar0) -> bool {
> +        let cpuctl =3D regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
> +        cpuctl.active_stat()
> +    }
> +
> +    /// Wait for memory scrubbing to complete.

This doccomment is already in the HAL trait, so no need to repeat it
here.

> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
> +        // TIMEOUT: memory scrubbing should complete in less than 20ms.
> +        read_poll_timeout(
> +            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
> +            |r| r.mem_scrubbing_done(),
> +            Delta::ZERO,
> +            Delta::from_millis(20),
> +        )
> +        .map(|_| ())
> +    }
> +
> +    /// Reset the falcon engine.

Ditto.

