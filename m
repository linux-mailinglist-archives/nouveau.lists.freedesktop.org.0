Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B09CC6466
	for <lists+nouveau@lfdr.de>; Wed, 17 Dec 2025 07:36:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98D5A10EBAA;
	Wed, 17 Dec 2025 06:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EewWZP5J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 99BEC45609;
	Wed, 17 Dec 2025 06:29:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765952951;
 b=QQxtiOKviZZk8tnZwJQbx2D/jiTalYHnUecKAUaLhU11ZlNNG8fKljVWaXQmpqs3QQTw0
 1nhPInsL/Cy3IScHDopwSSwGVwflAYAEEb292oPiBAt64piBSVDlGXDuNPNyzKERLq9PC9H
 nnxNVGUu1HyL0PmwU3LAfx9FS2I5ggqWZ62aGjnafdwu9Zr/1xnDEpU83qjroxBNLyq59F/
 L+eFEf0HdwbJeiabkQ7OllWy/mEL3tNe1+jrvNBPu0lX7w/77NWYIIC2Sc4FpUJaLRf6o9P
 DpjiwHcgurC/6IvswAF9vYC39+UG7aBdTdaYKDTMKbEHuM/+9FVQCS9fZs/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765952951; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GFObqeew2aIl95FbEOKIwF7LDD2aloW+3z714Zm3l7c=;
 b=A8juIiPHHekmzkkBBsHB7TUCsZ16M2tacM1UoN9rP+ktMGjukbF37IvctSQzUrq/0pVNl
 NozfgX1VsD4yTpGc3/uBvMcBLaFdhji6I1guIQddUnwE6YdTToX7ET+176RWX5AfBhJFfYy
 oLXJdsivtaz/7eal0LakNE50Bd3LH2HVWM1cSrEhOigF17wWeQ0zEUldNHHSQXI7fHdXTW2
 VswK7nl0zB5s//e1Y4KI2PX/x2wktW4d6xgRM678h0B0CsUBXSNSmaL+VOsymHDJJCRjVEM
 WeUoJUSqRMbEmo1BGSDA1paGvco7r12xzhgNnqQr3HkvrU91nXr87zQa+O+w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BC3C345609;
	Wed, 17 Dec 2025 06:29:06 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6A810EB91;
	Wed, 17 Dec 2025 06:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3chtthnxHmOfD86EQqUiY8kvWqd0iQ/ua5u/giTsnWbYCe5KKrPqsXep22TNfm+k/vKa/Flaret6GSbW/h9h9j7NbVEaG3Qa2T1Uo3uJpun611NcZdyvDAU4l2x6InsEzJj+9Bcl/tIzgzdB3voXHMtoc3R1jw3SU8iUyVI0e7jhVRy1+vcOm39KNjMb+AbMDv+5DA/RRpDGWnIEasnxLCgW4He1hVaEHIMw9BcDCntKeaSvHs2xB7LhpaDfxcdFlV2P65twnj7S7Al6qOKmc/SrAwVrSZoh85v1SQAa2ONWxr25d75kGQTC2j+PiPs53WNHVto9z8mLEvxiNBWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFObqeew2aIl95FbEOKIwF7LDD2aloW+3z714Zm3l7c=;
 b=MgZ8+l1z2zMgJscUZrGqLgsQRzYAcMsjJaLWEPWC7P4h5MP8BOC6CvcQe8VgrfnZ+OWBhntiVrlXpgUq8a26q/m4LvAs+vhRHwBApdM6pWgghJ/l8hpK45SOuUn2i8dlJY1KzX6GX4ZE8Zaz0Zc352yvTo558U2/aqIOf0Yvg7QWa1Ia3hWYrtuXRsQ2WJy2gCvGcVMd+tAwUdBYPTW2ph5gE1Hn34dibVGdXfMMe/BtlL9X91mYRcaFBra0dicnIpJfxhIZrgKciLTtOql2mdbLYajrihJiq4MOkak1Dbdpkg/pNX3bySqZvu1moKlylwucR6T9vKdkAMG4rvOVsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFObqeew2aIl95FbEOKIwF7LDD2aloW+3z714Zm3l7c=;
 b=EewWZP5JOpUgbzZj9NQRr/EUtYaF2+xL3QyOf9SCrBoGEc4C4mhkvvI+UEU7bIc7P+Xj4iY/Hh2EbFIP6tzmfeSHf9NqU5Tstww+LT7tNiUFJCjnwZzd1Yzep006MuPABj5Y8ebh1yzTITZX4hGgiE+Y5VZRHDtrKfgvE6g6tThXk9/tz1/cgCJhMvOfvgOMq0s719W7nfGlKrNJc7BoQBFuYnz+x9oaSVhH818NEJ89cRYgeUY7X42vHTg/PL1NoXw+viaa4q+QaWq3M28t3cOoVkHvhvMZSn/QOqjFXw6ZnSjuPUBSr1FaHF//UgvI1DMhw9dIr+lVtLaEozfJIw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:36:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:36:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:36:26 +0900
Message-Id: <DF0A8A969D0M.24MRUBP6XTV8S@nvidia.com>
Subject: Re: [PATCH v3 06/12] gpu: nova-core: add Turing boot registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208231801.1786803-1-ttabi@nvidia.com>
 <20251208231801.1786803-7-ttabi@nvidia.com>
In-Reply-To: <20251208231801.1786803-7-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: af41eda1-dc6f-4fc2-0d9f-08de3d369cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZnNWRGNJZHdjUXVSVkhLVGZzTzY5UUJQSXR2LzNkN1A4TnpuSmdndkJKWFlv?=
 =?utf-8?B?aFpWRkVsdFlCeHVxVDZJb3dmd2dOWG80eTZYb0hTQndTbG5VQk9kT0dhMVJm?=
 =?utf-8?B?RlpIQk1aSHcrU1daWmNoYU12K1VXdTlhN21WNW03RXk0Y1Q2bjgzY3pEUS9P?=
 =?utf-8?B?ZnJJRXlQMnduSlJDNUNYL0Y3aWI1OWFBdEIwL3p6bXAvcjBEbkJLSGFWQ003?=
 =?utf-8?B?eHlxSXk5MXpUSlVSYjhlaEtlL21IcWJkNzNqOC9NMWZYbjhIYnhka01renV2?=
 =?utf-8?B?TVBsTlRHd1RZT1RoR1VZcDl6c1EwSkNySDNxSmIySU9rbDN4OUg0MndCOVVi?=
 =?utf-8?B?bnRyOHdwWU9VUUlabi91QlVld0JSYlMrVStKY0FUUlZ0L2FTTU5vbFAzZHY1?=
 =?utf-8?B?dVZncHl2SFhZU2hxWE01SU1WVFNtQ0hhUm1Jd1RlQll2NW5Ub1FzOGlTZWtF?=
 =?utf-8?B?M1pDNUVNU3JlV3NzNk1CUXV0QzlPci84N2g0NU1jTkpLak5oNTllOGxSYVdU?=
 =?utf-8?B?U2tWRmxaSE1KeXhOWWJwcUpNeEhQZ0FPN1dWY0grRjhJajlJZVU1Ly9razBD?=
 =?utf-8?B?RjhydGUvRGdJb3JqM1hvWFFKMmxwWktmcjd5ZStDUUVyS1NmME9XWHdyc3pT?=
 =?utf-8?B?ZzFQbjRVR3cwVitML0lCNENxeVp1RmVTT1p0eDRtb3BFdkRwTkpCekw2SDYw?=
 =?utf-8?B?UTUwSmUydmZOMHU2TWxFN0o5bXJWSS9aYUtEQ0M5czZPVlJsVEhHT3BZcXdl?=
 =?utf-8?B?TmFyVmlhTld1UUFxeXJNT2RkZWVtcDIvMWdQWHJFMWJkbW1TYTMvSjQreFBq?=
 =?utf-8?B?MnJwRElLcmhjN2dnbnBrS09HMHBzNjRIdFkrRnFKUlM5Y0RzNVZ5c0RKTTR4?=
 =?utf-8?B?UGpMQWNQTGMveTRLcENGSWsvcWZKK05VTDdYTmtqbTdRN0sxV1B5dnJ6ZVNU?=
 =?utf-8?B?VGoxZy9HVS9XbWdhVngrcmFzTlozYXRtZmthNHV3T2ZaTDVlcERPcDlkU3J1?=
 =?utf-8?B?L1hYejRqZGJMQldQK0dQVnVwL0ZOSnlUYlVIYUkwYjlFT1dnaW1OM1kySzRk?=
 =?utf-8?B?YjM5S2JTK09oN2JwM1RDZ2c3dGlUb2p1cUxDbW9iMzdrd0M0aHFMMzJESWls?=
 =?utf-8?B?eHd3dEhobUxUSmI5QlQvNXlrOURaaVNyZ3hSTzRWeFJsT1FNUXdwekR4QmpQ?=
 =?utf-8?B?MlR0ZHVFT0pOMm0weW5FTE4vUGhFcXZpTmpRSnlKNjRtVndVVWJnWXYwUnRG?=
 =?utf-8?B?VmFDUHduL25UQ0l1U0h4eisvU0dHSXA3a1hjaFNkenByV2w5ZDJJMGVuWi8v?=
 =?utf-8?B?NjNkR29TU1dDTGp4dXVHYlo4YWZ0bUNiMlNqaFFWdndVVzFSdlJuRUk3U1BF?=
 =?utf-8?B?czJFRitEYVliUkh4a29iK3A0VmdTaFd2QlQyRHlNSmxNWDVPTDZFQjBhV0sv?=
 =?utf-8?B?ZnJhNUhYcnVZQ3cyU1EyVHBXRHM3MDB5SW0wazEyYjhTblNSenRjNUp4MHVM?=
 =?utf-8?B?VlUxNW5NTEkvUmVzcHJoU0Y1NWFyZjlrQklyZzhPY3RlY3FTUDRRTXIwZzB2?=
 =?utf-8?B?M1pHSjlCMEEvL2NwNlA2QkhrOFNQemMwQ2dnT0hEdTNpT1FuakNWV2dVbjJV?=
 =?utf-8?B?QUt3ODcvdm9GYS9zWkZ0MUVtU0pGa2RiTmR4YmJGMkdOU1cyR2FOTCszaHFM?=
 =?utf-8?B?UDJRSm85RUhWTTNxMHhlTGZuS3M4Uk1ZTVhIZzlWSFJzdTNWUitMb2FRTGFB?=
 =?utf-8?B?NndCc0NFbkIwcGd2UDNKUkp5aDR0a3J6L0dWS3FUMjdqUGd6UEg2Zk1vbnlj?=
 =?utf-8?B?T3BERWVaR2lpYmtuR2lER09mQ1UrR0drZWhLZEl0SnJCdkEyanhUNUFMckR0?=
 =?utf-8?B?VnBzVmZwNVdDN1JLODR5QVU5b0ZIeklXdmxJdlpZbjVCZ25rbGk4V2ZWcXRR?=
 =?utf-8?Q?cg0HYQJwO6CMyX5h01sdhplKS5h5Emfr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aHF1aUlzeitOanJ5amM3SU1zTk5xRUQ4VXpBU2Y1UVViRFpSTEk4aVUvTGR2?=
 =?utf-8?B?VFdjS1A2Zyt4cEM5bHpJSjRtUHhQeW52Sy9aNG9CSEVvR203c3A3QVIzbTJU?=
 =?utf-8?B?ZXJldUpXdkptajJnellLTWRaM3FBbkxVQzhrWEhBL3l0RVJ1YnViS2l5MThC?=
 =?utf-8?B?dHJNVXFmandmYklJWlFSZlpmZGFrVGZJcTA4NW02SFhrc0dkYkxuelZndnFz?=
 =?utf-8?B?YmlkUFZkU25aSE5TQW1NYWxicUoyVE1KTm94L01neU8wUk95OFZUdG44dmtm?=
 =?utf-8?B?ckdlZFA5SmdOMDdOZW8reGZRSUkvV0dpY1dyUGRjalhNc2RVaUJMTlB5RDlY?=
 =?utf-8?B?MVJ4NGhKckRtRm9LNlR6ZXV4My84Y0ZJMSt1SkJUMyt0VGx4RUlGVmROTnRU?=
 =?utf-8?B?YlJXMEtkS1pnU2xTTUJHdk5aVUFvRzAweFZpOW5uTzQrZzlQZDQwTXlkMUhr?=
 =?utf-8?B?STA3ZnRMVS9ZTGZHTlZVZnBBSkxFRzVIaFpBUU54SWlXSy9abUhXem5hdlJx?=
 =?utf-8?B?cFRLV2k0bTBsNGlQT0NWS3NubjJIbHl4QjBXNTNuM1IwU0lMRndnZnMvWFpo?=
 =?utf-8?B?VWJFWHVqODBYQXZBNWxYTEZuNHd2OStVRUMwWStRSmgxWUk4bXlrK2FXaFdn?=
 =?utf-8?B?Q2x5Z3ZGSUk3bUVDSS9IbFpaYUYzdFJFQ0NSUE5JSkU2MnBSYUZHYTJUYTFD?=
 =?utf-8?B?aFZuUUwwRnBlREU4OWNJU3c1TmNBbm92Z2ZtNTdLNmo2aUVFQzNScGtRWWFn?=
 =?utf-8?B?VVRuU3g4eGg5RWtQU0VXTFV3anZVa3ZDa0FiYTlZQWxqcUJ0WmFSbCt0Q0o0?=
 =?utf-8?B?T1hTTWZBWWIrbThNNDBRZVk2VStaazh1bUQvNHJ1WnMya3JCM3JCRWVNODB0?=
 =?utf-8?B?em4xTDBWRWRYVEwyZlVoWWM1N2diS1pTVmk4NlRNaEpISDdYdTV2SmxOalk5?=
 =?utf-8?B?cmpPSmhCNEVwV05KcGt3RkhNNDNHQmlQR1FlMVEzRXRlVGpsdklucHVWNzFQ?=
 =?utf-8?B?SUNQODllUURMVkpNQkw3NUhrM2NHeDlsVUxpcUIxZHhmTHBRdGo1bFFMRENU?=
 =?utf-8?B?aEdRaTJ2QUdMWkFSYU0xeUJLMWVmbFplY0I2MjFLMnUra3crRTc4dUQ1WnlW?=
 =?utf-8?B?WnRjMWtRVjNLOGFld1plQmg5TmllZlJ6czczSzhCN3dsZ0I5QmoxSUJFUnhk?=
 =?utf-8?B?cGUrcjBiQlZjSTA5NU5FYUNTVjV1YWI0V0Jkd28vTlYybGtzUzdpZzYvZDgw?=
 =?utf-8?B?WXorSU1CejNjSlN6VEd6dFpINHV6RWsrbENmMzdLZzlEOEV6L0dicnFKWXhu?=
 =?utf-8?B?NXBjd0xwclplSkFSRUl2MStvZjF3WmlNUUpKdDIrMGRCcm1oaVNWdXJpcXQ3?=
 =?utf-8?B?cE9LYWpaOWNaNU04R2k2QUFBc3RsQ2lmQlpzRHBXVzF3ayt5Z0xtZCtCY0dO?=
 =?utf-8?B?RXVDTlpJNWhrcytwdnJUL1ZYbXdDbHJTTlpQQ3hjMGZHaW4zNlhpeCsyWXlU?=
 =?utf-8?B?WlFWdklJVUFLU1hGZ2dUaE1yWE13endxbTh5SFd4NTlFbXk3L3htMDZRMHVw?=
 =?utf-8?B?WUozNjBIZEl4RWpoWkZleFc1NEo4S0VTVklIWUw2b2ppRFJsdEJTaE9wK1By?=
 =?utf-8?B?VFoycWNuaVI0L0RIUVBIYTAvcGZuN1U3UThvZnIySklxbDNpVWFPYyt6RGlC?=
 =?utf-8?B?WUpZeTJlTFVkYlowM0FKTnJab3Y2K0dvNjlHT1E1enFCWnhsdDR6WUtJN1VL?=
 =?utf-8?B?T24vVWZVK0xOcFp0ZHYvZUtCUnR5cDgvVDF6bXplTFRNNzFHK04rSFYwUnZh?=
 =?utf-8?B?aGk0Qy9kczlKZGppZWlCZ1g3ZFFZTkFsblBiVnBNd1VYSkxzWDJKekpybC9w?=
 =?utf-8?B?dU1laFQ5a3NJc1VteDhSalgzbnc1aGd5ZWFEZ2thQXVXcWRJa3R1QlVkVkxm?=
 =?utf-8?B?a1pvYmFWcnIyZ3dmQ3pKVjFYRmpKd3psTy9HRWVEcDZ3WVp1WUkzQnRBRkV6?=
 =?utf-8?B?KzBsNkhXTm9melU3SUVHdXF3MnQ3YVBUOXJ3dXF0dnZtS0I2WGlnRUhESXU5?=
 =?utf-8?B?aUthaDlnRC9DZkluODNERjJ6RW5PNkZvbENHeXNPR3g2TWh4dGdnUDVsL3Ni?=
 =?utf-8?B?dk83bVJUKytZT1gwNXJYQjJmT01xZktlRlV1VFJRZmdsUk0ycWRXcTVZK1BZ?=
 =?utf-8?Q?RGs0GRhi7euzbelkxW0istYuhbi59Lh/fkmiNZsbilAj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 af41eda1-dc6f-4fc2-0d9f-08de3d369cda
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:36:30.6974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sdXpq3cVIR3qVWBk3emY3PBa8wVVAwmmFjL6IvqNbrkg7aqy44ZBoxgEcJTCUrBvT/bpTrv0k2iIpgtHN5ozGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342
Message-ID-Hash: 7MKXFMEQG5IGTMBCAWWZ5XWODGXA4PDE
X-Message-ID-Hash: 7MKXFMEQG5IGTMBCAWWZ5XWODGXA4PDE
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Nouveau <nouveau-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7MKXFMEQG5IGTMBCAWWZ5XWODGXA4PDE/>
Archived-At: 
 <https://lore.freedesktop.org/DF0A8A969D0M.24MRUBP6XTV8S@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 9, 2025 at 8:17 AM JST, Timur Tabi wrote:
> Define some more GPU registers used to boot GSP-RM on Turing and GA100.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/regs.rs | 63 +++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 88bec1d4830b..2143869d27ba 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -258,6 +258,11 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64=
> {
>      6:6     swgen0 as bool;
>  });
> =20
> +// Interrupt mask clear register. Writing 1 to a bit clears the correspo=
nding interrupt mask.
> +register!(NV_PFALCON_FALCON_IRQMCLR @ PFalconBase[0x00000014] {
> +    31:0    value as u32;
> +});
> +

This register doesn't appear to be used in this series.

>  register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
>      31:0    value as u32;
>  });
> @@ -266,6 +271,14 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64=
> {
>      31:0    value as u32;
>  });
> =20
> +// Interface enable register.
> +register!(NV_PFALCON_FALCON_ITFEN @ PFalconBase[0x00000048] {
> +    0:0     ctxen as bool, "Context interface enable";
> +    1:1     mthden as bool, "Method interface enable";
> +    2:2     postwr as bool;
> +    4:4     secwl_cpuctl_alias as bool;
> +});
> +

Neither is this one.

>  // Used to store version information about the firmware running
>  // on the Falcon processor.
>  register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
> @@ -307,6 +320,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      7:7     secure_stat as bool;
>  });
> =20
> +impl NV_PFALCON_FALCON_DMACTL {
> +    /// Returns `true` if memory scrubbing is completed.
> +    pub(crate) fn mem_scrubbing_done(self) -> bool {
> +        !self.dmem_scrubbing() && !self.imem_scrubbing()
> +    }
> +}
> +
>  register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
>      31:0    base as u32;
>  });
> @@ -353,6 +373,42 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) =
-> Self {
>      1:1     startcpu as bool;
>  });
> =20
> +// Config memory base address. Specifies the upper address bits that mus=
t be matched
> +// to access the config aperture. The base may not be zero as that would=
 conflict with DMEM.
> +register!(NV_PFALCON2_FALCON_CMEMBASE @ PFalcon2Base[0x00000160] {
> +    31:18     value as u16;
> +});

Or this one.

For the one that remains, please introduce them in the patch that adds
PIO support - that way they are introduced alongside the code that makes
use of them. `regs.rs` is not touched in the PIO patch, so this also
won't complicate review.
