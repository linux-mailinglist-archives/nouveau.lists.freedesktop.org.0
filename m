Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CCECECEF8
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 11:02:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0E910E541;
	Thu,  1 Jan 2026 10:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cgg5WnYa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4523444C38;
	Thu,  1 Jan 2026 09:54:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767261246;
 b=S5oWKGGavCuq8cwQpy11+958xHVo45rg3jcClRo5hCI8QNF2xgPiEPnO09SeMNopgoJyQ
 wGRZzj4CCmo0G2Tyiy/j79QB8jhJtvusb39WHXnmKjo6ymMcvUT4Z+MzY4TpJc9YD6Rb7x7
 VTzFlnw3DCBk5kWGylPOUgk5wbEgKMl/G/BkfsAhJlpuyJBdtnOvFzW/+JUFnntRo1MaN2j
 PItlubeGKyw3PI5OEZ6E/0iYC+PknsG2dOa7O4cL3OKPsejW9IsHovAXynJTIdipq+CVnfC
 YHFKsWhCz/jql6QlJBe9805ug4adNlFfKyjfh/WSB1Scdga8zAowSpd4Ucug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767261246; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/gZEhL3ZZd0L0eHKt7hHTC2qFjytJ28+1aD1yZS290E=;
 b=QvjauIdzwPWvIwMmafNPxqnnTdE3tIWUdCf/4CTyX/zYOeQpzuIxSTZAs492+z0isXfoF
 k5FCyFu98YOiujtr8ZUpUtxajvY03ub0gttPPlEAOwssYOnXAePkpRaZ+0xLi5G6rTKs2bI
 ctPsriEYSBm2P6+IqiLLoPiRm7QWTVQ4PedvSQF8bJkBT188HqoApfBHf1i8jjdxhs5G9nb
 BzDw1vuvZ3gHs1pYVd0PWbmTySZ97IGDz5W9a40HNfpfAmvm1gGXMtDqQLx+oGyDnuGHSHF
 om21aMndXbPEN5TXnas/acevvEtiYHVDjwTxV3J51t1Gz7XuH2W0p8QpJV9w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 303B444BA5
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 09:54:02 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012062.outbound.protection.outlook.com
 [40.107.200.62])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 869E610E174
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 10:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovOaBn/b/LsbC+UfXpmbHEtuKCmdqueYi2dy5a2CD7TfNJvjYzJyzX33TaqUaTYkKYsKRk3TQ6uJ+qtWFNF1PXZ4mwIdLU72gMbdMzZr2RlWYvENyoFMLFHSyz0rvAd3VRy+f6FFFSQyTyRP7TXiNh9m29kETzAEqOL8Rc7BCm4wA3YJ9NfL/DvD5TTemTevm/ENx01tzrxK1V4dZAgmgiX2mEy8y9nFfjhhcG/1pPxs4w4iORtXjzJ/ClH6q/XV80Rxvis3d1JYZGYJpaVSs+/T5tSNQuaDcE6zW9xVzjEsJl1jIY1ImbCxpuKnLnLvcdtcvg07dno1bNayrL77yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gZEhL3ZZd0L0eHKt7hHTC2qFjytJ28+1aD1yZS290E=;
 b=p88vRKFdsZd6yt8mN/D7jiZseSOGztzKNXMZcfQcg9Ah/kbzlKV3Wvw4FcubgYwKrTzVpEAArjcqkr5QJs2zHS7ZxozlWGPpZTfOxRdz3pxetzfgAiLFDDn6ekiaT59Qph30BJ664RvC7llDQaAi7U0dyCLY4GV8fVRnm1Etxw0yXvfpV3HZb4LyTnVudbZ4kYqlygkDuguBUBhd/0kyiWshNYpyKrbwl5DdJdaSaE/MXQEMEyeO7G2IRc73KnrWmlWFcfZhq28lUEhT2GeWsXAxmHwV8SbMjC/6Swg5BS6V0MEPlqx/WOXQTB7Tx+WGHopG8uOk+20YCYxCoq3wiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gZEhL3ZZd0L0eHKt7hHTC2qFjytJ28+1aD1yZS290E=;
 b=Cgg5WnYa8oIX5SzpOTjYODFl6fWWwfcmjdGRNV+YQXBexs0XNnNFv1ky8v5sn/ZY+ZBSRMW+15RT2a2jWC4kFqyzjM544Fa0AF22PChLGTq6ynEx9+AhwbtcxFTKcUfeiy53RXhIiXXJj/Nl4icK04XaYG4CYO2nifIM9DwR5G2xGY57fMZAYf1Cx/jYeDUiHbZFuyZYpqq/CKWm/1beMeAzEmtcOIQ6+UMjgYfQHGn+BYnNThJ+7g/8SaanB7tBZpoT92D+tk7+jH3TtlbSKgQsrzv98oMfRlUfjWPuRxNtRIlJQMugHf2jfekPBPUBK3mLcJNn6TQtcoKC/uFMBg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 10:01:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 10:01:59 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Thread-Topic: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Thread-Index: 
 AQHcep8TcL3T9+UiJEia/sl5Ol3pprU8VcmAgAAD1wCAABi2wIAACLGAgAAgZQCAAAKLAIAAFHyAgAAGkYCAAF0UgQ==
Date: Thu, 1 Jan 2026 10:01:59 +0000
Message-ID: <F04A303A-90C0-4056-8B6F-6022848C5D78@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
	<9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
	<ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
	<CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
	<e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com>
	<efec6ee0-9287-4375-b535-5c50cb218eca@nvidia.com>
	<d1a8fab7-f405-4b4e-84f9-8057c25c5ee3@nvidia.com>
	<4482eb34-0961-4b40-868f-77dc001d98e8@nvidia.com>
 <20260101042851.08576bdb.gary@garyguo.net>
In-Reply-To: <20260101042851.08576bdb.gary@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|MN2PR12MB4238:EE_
x-ms-office365-filtering-correlation-id: af657e8e-2272-4f4b-9629-08de491ccddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cFlLT1llTmluekExcmNhZUFqc1ljazRJWGc5S3lTZnl4STVhK1ZLK2FjT0o1?=
 =?utf-8?B?aHJWVzA4cGNBNVBXZVdYYkcxOCtTUFF5WlcvYnhmUEJ3c0Qram40MjZURFJv?=
 =?utf-8?B?dzdxQnRzd01UaTA5OW1HLzlSRXIwb0huVHdOM3JBWmEyRVVsTTIrd05WM3hL?=
 =?utf-8?B?VUZxazk0bGhoWGk3c0xHbHhJUDJ3RXloSlJUeWdpdnUybGp1Sm8wZHA1WGJ0?=
 =?utf-8?B?ZDhsUWNYdUNBTnVTOWQ5NUdvYnI5cEwwZXc5aXlYUlNrcnpJNzhCTjlNK01E?=
 =?utf-8?B?T0RoUmlXUGN1cHMvL05WMHZRQjZSK1hHbSsxRXNXczdhdHBuNGc4eUhMS0FK?=
 =?utf-8?B?UjdOdGhTTmVzQ2FKbU1Ub3pOTWI5a29HV3V1NWxlRUhPdE9NZjRkdDBFWWVD?=
 =?utf-8?B?aGVpajc1TE9FeStkWW5yb2VxdFptT2x6VVFsZ2Jza2F1TTN5bmxQSW4rL0hI?=
 =?utf-8?B?Sit6REFhSmZlZldVanRMMS9wbitMeENpYVJlZTMrRGVCdWsrTE9vd0puSDdU?=
 =?utf-8?B?NHRzME1ydGRVSXg2WUt2a1VOMG00Q0pWV2pzQnd6L0t2Q3FsK1hTQWhYRTU3?=
 =?utf-8?B?YmRMMzZaRkpzVzBqN3JWdXRFQmRvWGFxVTJJejhwa243WEcrRmpVMkN2MkI1?=
 =?utf-8?B?cXM3ZHRCRS9jRjhKazRaRzBSaGl3dWJ1RWVpZzRnTFBGVzRmZWl4ZkowMzY0?=
 =?utf-8?B?NEkvdkRHaWtqSU4vaDhBS1dDaU9VMms5dklEbTNUZjJnMDJZY1h1cHlIa2RQ?=
 =?utf-8?B?bi9XeGx5eHdRL1VsRG1RZDdzbUZHR0h5SC9KUHE5eVNTQjg3SjIycllobWN0?=
 =?utf-8?B?RHRkbFdqWVVTVzh6OWg4a1ZNOWloWndBdXJyWnNhdkRJeWRtekhVdXpacTN5?=
 =?utf-8?B?ekpsekcwSHhYbUNvbjNqUVpWZCtlU0VjYXV6MEVtRER1Z054OGJnL0tEdnJh?=
 =?utf-8?B?c0g1UjJhdVRXYWJVcmhwejBvcGcyY0pseFcxN2txb2Mza1ltUlprdkdOQysy?=
 =?utf-8?B?UU0zaEtzUGZXOVlKRVltbmw3NXVsMnk4aWFaRWJWbW8yd1hDdlVDTm82NmNQ?=
 =?utf-8?B?WDdZV2c0aytOdTJSbjVwOEgwUTBybzcrQTZQMGxFRTJ4ZGVualJxb0dBMHJ4?=
 =?utf-8?B?MGhPczJYWGhtSmlkWUNVbTE0OTdaR0VYMTR3c0tRZXVxMHhFUmtFVzFFV1hC?=
 =?utf-8?B?UnNnZzdHSUdZbFkzN2dxd0F3WldDMWp1VlpKc3NhNkp1Y1JkMzgrbVdhQjRZ?=
 =?utf-8?B?NS9sVGEvSlh0Z3J3UjBrWVpzeGJQMGxnNEJtZS9CQTQwZUxjN0F1M0srczE4?=
 =?utf-8?B?WnBrRTQ1eHgyemFhV2cwbXQxc1kwbUNwQXZNMnlvblU2NmQxRG5XaTNuRjEw?=
 =?utf-8?B?MzhkVHRkOXEwWkN1N0JjVFFHV0dKU0tkTXdYOFhQamdGNmd6M0xkeTJ4L1Z4?=
 =?utf-8?B?M2JwZ0ZpLzE1MnUzbWVzWmRqaVVNWU5hc2R2U1JlamxmdXZKSlAyVHpDRkZu?=
 =?utf-8?B?aXplTTRiMUUxOVZXQVVEd2F2bkFxSzdjanpUZDdkRnczR3JSbXhtWDJUNUFI?=
 =?utf-8?B?clp5ZlEwcmFGMmxyTjYyVEV6Y3M1SlMwbXN0Ym5icHhRY2NlK04vbURsRXNz?=
 =?utf-8?B?cHVIKzU4ZDFvaUhCMmdPa0RKRWRkdGdmOXR2QS90bkRwOVpPcHBrdWVEenJB?=
 =?utf-8?B?RlVrQ2RMQXZ4L2tlU1FWTERWb3p2VFNUZkc1RmhKbGdWYlBrcktPS1NBYWRT?=
 =?utf-8?B?L0ZPeENERDk3aVhCQ3Y1UjJzNDNkby9ucWFxb3RUMDd2VCtHcTB2Y2dqam1W?=
 =?utf-8?B?UjluMEtVMGJDc0plRkVTNzh2aVVrbEVMQnRmazNYN3FzK2w2TyttaXZBRHRK?=
 =?utf-8?B?dE41enNkQXFGaUY2bFpXRmo0VWVzWGZTME1lcUM3TEg4dTZ6WHpEQUNCR296?=
 =?utf-8?B?SERQWjRsc1c4Q1FNVStyOGFHWXRBWmlmeUo2ODVFK1ZkM1ZLZmxEVDVtMU82?=
 =?utf-8?B?MC9ERUFBYkhpcXR4RGZkdFR1czBSdXo3RUhnUVdiT1FTSFpuMng1NHJ6cnRP?=
 =?utf-8?Q?anoTWm?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VVc4dlRXZmlFQ0xrZXNTeHhWWjlsczIvTi85QzNjREVUWS85U21yVTJ6VjZC?=
 =?utf-8?B?TDFDNFFjWElvQzRpSDUxRmFXR3pnalFrdmphZUs3ME5EeUdOT0xkcUZvZWdU?=
 =?utf-8?B?Z0ZraFZERUdMZFE5cHNDYmwzSlNXZnpXcHgvaHBOZVRVdkMyNG9Pb0xsWk1W?=
 =?utf-8?B?eUF0dlBHZGMyV0hKYVhmMUFYSDFLL1JJaGZVaU9TRWZScjBwY2VieWgxRDVD?=
 =?utf-8?B?ZXNtWWdlZUJoVWpPd01WLzZLclBxbEhJdUQvajQrb2hpQ3BlUUZ6U0M0Q09R?=
 =?utf-8?B?TkNBbXNXK0ZUU1hPd0NyTVFxdjNQZ3cybmlqY2FtbWhHbmtROGFTR3RtMzdD?=
 =?utf-8?B?S2dmMTUrZFYyekEzZTFIVDNNRlBmc1VGZjArV0VrME1LWCtFbmdVN3pqVzRq?=
 =?utf-8?B?c0lramlvRTN2TmFyMlpRLzlzMklNQ3ZwNE5qOURoRjdqYW4zaG5scUR5OHV1?=
 =?utf-8?B?YkNTZGpOaCt5UHFHOXFwSGhVZEFpbVRLVFBuYkhUTzhQc3E4VXZTV1FEUnJt?=
 =?utf-8?B?ZWc2SzA4ZU1uVTYwcThNUHFvTk9MbkxkcUlYcVYralh4NUMrNHpMRDJmVS9W?=
 =?utf-8?B?SVNkNFJSM1dCWlZrU1VQdnQ3aHBST1h5Ni9PZEpHQ2tFSGZ6OGQ0a1VCYmZq?=
 =?utf-8?B?SU01VVFuamZsMWlHRFVVd3VXc3JUUkVoQVZ4TGNUbGlSczhmREx4WWF3RWlv?=
 =?utf-8?B?VmNQdStIbVNZK1N6alV3OWk3U2JFZnd6OVdDZXhLamxtdFAvN25xME5iSmdB?=
 =?utf-8?B?WURrMWU0MUMxckUzK0JubjJjZHN3TVhYb2lnZStydVpoaVlXemJUeHBNS1Fq?=
 =?utf-8?B?THJRK0RhK2h5TkFJM0Y2OVRMVHIyZ2JNWEpEcTlqUFg1NjlxRjlqUndybk5M?=
 =?utf-8?B?MmdCaWsrclprbThZNzZsZ2k2Z0RqMFNQVldpSWdQQ00rRjRZcU1CaHZzS08y?=
 =?utf-8?B?YWVBZTJKa0lNazVxMDNEWG93bW5uZ1BuVFBWYWREa3pDc0RFRkd6cGRtN3JF?=
 =?utf-8?B?bnh4b1pUaG9oS01TSHV6ZWZlN09lNGRFQ0FBeWJuRGwvYm56blAvL2VKeWty?=
 =?utf-8?B?RGFLdUlIcGlmL2Z1NVM4RWZQMzhaR2pTTzM5ejhPS2FQcWE2RkYvLzQ3NGNz?=
 =?utf-8?B?U2I5ZEpMZzNHMUY2T3JDOFZ1WHFqZEVzdW9iVHJiODE4Y3Y5bGdvR3FlbGl4?=
 =?utf-8?B?cTZUdndYbDZlK0lkbjliUnFhS1Z4emxINEtQeHhINkJLcS85Nkt0Y0FyWSs2?=
 =?utf-8?B?UFlObXNGM3JwR3RQSUZpY0xwUitiaDNaNjhNb1I5NVJPUittQ3BERUZ2Tk85?=
 =?utf-8?B?QWErdzU4YkJnMmxnbjhRUTdGQVplSU9EeDhWS2VQN1k1NzBkTEk5T28rczRT?=
 =?utf-8?B?dXpWbGVYOWV2aWdLMlExc1U3QUpsUnVBa1ZTd2FBSVc0VUxXc2pmZkZuQ3BB?=
 =?utf-8?B?WDNqTFN5Tzc2Vk8wak9yNDFZQVJJdEsxZjRyK3NKMUhqTlY3TDc3R2VZUklx?=
 =?utf-8?B?UmdNbG9mYmlmYzB6L2dSK3B5MmF6dDJhTVBkb1NWOE5tMDI1MnhjaHR5YTlY?=
 =?utf-8?B?UlR1UzRGTEwwYksxdUpYdDlrNlVWeVZaZHhQUnp5RjBrL3Z6UTNXUnRBbGhL?=
 =?utf-8?B?blJhc2N3SGt1Y2JLZkd4Z3NIa3JuN3RPVGc3aDBXaWNYenBXYkZ3bTcrQnJ1?=
 =?utf-8?B?dHkvLzJZOGF5cDhoRjhIWTZoTm10RllnVG11T2FINkgyeTNYMXNlN3kwSlZU?=
 =?utf-8?B?OUxDS2RqdG93R3kvanlEVnB5Q2tsQ3hOVklROG5TUFZGVWRQS3hOaGhHaWZh?=
 =?utf-8?B?VnFMUGsrT3MzenlZaFE3YXFNSDh1NGRLM2VPZGh1TjNwN25OczVha0Z4UVBv?=
 =?utf-8?B?OEVNWjdyQTliNWt3S09xcElQaDZkVTh0YytDc1pvcDZ6ZkNCYWRGaW5aMGdy?=
 =?utf-8?B?VWFxM2NsVGtQUGZsQUFrT1BjV2I1d1dnZXJZd2ZXeXVtRHV3eUpaaC9LQnNs?=
 =?utf-8?B?Nm1xd2JGR0Y1Mzd5dU5zZWFHdS9hMmxkbmgwa3k1a2hWWGhlTFNoQzVwaUhu?=
 =?utf-8?B?NU84WHRONEhwdE00aUFpYzJrSlBjaHNNS0pjQ0NLVlErT1VRSE14czgrK0JT?=
 =?utf-8?B?WmptM1EvNU1BMzlOdzcrQzFicTFZRTFuZlo4ZXVyQmt4S2x2NEFobEVDWjNU?=
 =?utf-8?B?WnpUNzRTZk1zcWx0MzcyODhKSzVhTVJSdzRkZkJTalY4UFEzS3ZWZTBOUzJM?=
 =?utf-8?B?eXFUdVgzb0VsYkEyaTRzMTlhRjE4eEh2TVNSOGxEOWZtc3p0Y2lxT2Zoc1pp?=
 =?utf-8?B?VEVMM2QvLzRDakI5aldsQ0QxS2x4cTVzdFBOY2FYUW1tWEtlbFR4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af657e8e-2272-4f4b-9629-08de491ccddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2026 10:01:59.4515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 W+5F7NKDqwxP4C8QdrJX9mT/v0Cd8uML9Tqt00xj4cXx/OK03h+WZHj8yDU0ESC+6YKpwYjw9FE2U0U3V8p1oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238
Message-ID-Hash: 7PL4BMCLI7GOZK36UF6F5ZV3NZXDLLHQ
X-Message-ID-Hash: 7PL4BMCLI7GOZK36UF6F5ZV3NZXDLLHQ
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
 Alistair Popple <apopple@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7PL4BMCLI7GOZK36UF6F5ZV3NZXDLLHQ/>
Archived-At: 
 <https://lore.freedesktop.org/F04A303A-90C0-4056-8B6F-6022848C5D78@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDMxLCAyMDI1LCBhdCAxMToyOeKAr1BNLCBHYXJ5IEd1byA8Z2FyeUBnYXJ5
Z3VvLm5ldD4gd3JvdGU6DQpbLi5dDQo+PiANCj4+PiANCj4+Pj4gDQo+Pj4+ICAgICAgIHJlZy5z
ZXRfZm9vKHgpOyAgIC8vIG5vIElPDQo+Pj4+ICAgICAgIHJlZy5zZXRfc2VjKHkpOw0KPj4+PiAg
ICAgICByZWcud3JpdGUoYmFyKTsgICAvLyBJTy4NCj4+Pj4gDQo+Pj4+IFNvIG5vIHRoYW5rIHlv
dSwgSSBxdWl0ZSBkaXNsaWtlIGl0LiA6KQ0KPj4+PiANCj4+Pj4gSW5zdGVhZCB3aXRoIGNoYWlu
aW5nLCB3ZSBjYW4ganVzdCByZWx5IG9uIHRoZSBsYXN0IHBhcnQgb2YgdGhlIGNoYWluIGNvbmNs
dWRpbmcNCj4+Pj4gaW4gYSB3cml0ZSgpIHdpdGggdGhlIGludGVybWVkaWFyaWVzIGp1c3QgbXV0
YXRpbmcgbWVtb3J5LiAgDQo+Pj4gDQo+Pj4gU2FtZSBhcyBhYm92ZSwganVzdCBhIG1vcmUgaGFw
cHktaGFwcHkgY2hhaW5pbmcgaW50ZXJmYWNlLCBidXQgdGhlIHNhbWUNCj4+PiBmdW5jdGlvbiBj
YWxscyBtdXN0IGJlIG1hZGUgaW4gdGhlIHNhbWUgb3JkZXIuICANCj4+IA0KPj4gTm8sIHlvdSBj
YW5ub3QgcGxhY2Ugd3JpdGUoKSBhbnl3aGVyZSBleGNlcHQgYXQgdGhlIGVuZCBvZiB0aGUgY2hh
aW4gLSB0aGUgdHlwZQ0KPj4gc3lzdGVtIGVuZm9yY2VzIHRoaXMgc2luY2Ugd3JpdGUoKSByZXR1
cm5zICgpLg0KPiANCj4gT25lIHRoaW5nIHRoYXQgcHJvYmFibHkgc2hvdWxkIGJlIGFkZGVkIHRo
b3VnaCBpcyBgI1ttdXN0X3VzZV1gDQo+IGFubm90YXRpb25zIG9uIHRoZXNlIHNldCBmdW5jdGlv
bnM7IHRoaXMgd291bGQgZW5zdXJlIHRoYXQgaWYgc29tZW9uZQ0KPiB3cml0ZXMNCj4gDQo+ICAg
IHJlZy5zZXRfZm9vKCk7DQo+IA0KPiB0aGUgY29tcGlsZXIgd291bGQgY29tcGxhaW4gdGhhdCB0
aGUgcmV0dXJuIHZhbHVlIGlzIG5vdCB1c2VkLg0KDQpUcnVlISBJIHRob3VnaHQgd2UgYWxyZWFk
eSBkaWQgdGhhdCwgdGhhbmtzIEdhcnkgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KDQpJIHdpbGwg
YWRkIHRvIG15IFRvZG8gbGlzdCB0byBnZXQgdG8gaXQgdW5sZXNzIHNvbWVvbmUgYmVhdHMgbWUg
dG8gaXQgOy0pDQoNCiAtIEpvZWwNCg0KDQoNCj4gDQo+IEJlc3QsDQo+IEdhcnkNCj4gDQo+IA0K
