Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E838CCABA1
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 08:48:26 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB3E10E730;
	Thu, 18 Dec 2025 07:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FmIgh3kc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AEDF845666;
	Thu, 18 Dec 2025 07:40:54 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766043654;
 b=fskwsJGCFfdDY+1tXjiuKV7gMohyMq5wD6XtgPvUkIzz/2nlXEtIAvOp85CXCKbVQwfxz
 TlNbmwBGeEEROU65DSh93wmbQOkKn0KeZDdss8yzjq4gdnn4G5YXgME0OkZckZtWlPpj8JY
 1+SXJXMrI30WKnHuRT0CWc7rIsay2wlry58lHuB83oQZTySpbCoWXMkG3ELc2iZnX+8grFZ
 2GoodmVlsFAJ9gUhyMt24bO+AzYJnP/2aN2p8ITWwv3VEBi0SIR3LE4rAWFV9b8tX1N9fes
 kNJ7/1xYIcYQcErmyK9V7a+T2ImcgBCICnmVO44B3O722MXWeef8OWdiShXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766043654; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=A1V6J19165B90wZlMPh8LVQ44VVTLwp18Q8+dG5+owg=;
 b=rAIio/GRwipLMyJ+Jx8nz739VbKU/leK3AiEHWF13CojBxaY8xSN59KiwhfdRIcX7/8N7
 llYIy/D77KRDjL97+eQuoPfrkaGX7rAqS76u0F8J5zPc4H/JgGz5mNGdcJkKlEPpQdzw7Up
 s3TI9D31K7p01HBtdlt1FXxf3mFzdQ5zoSsbJEl0KkfYjLkqyZBjL/wWSogd82yy3REj4l1
 33bZEuEf5NePEAUFY1LkSe3juQZ6rDIykjhBGaplfES70LyQDGFJdr2RMTDEjyc8tj6NnYZ
 2NJWy8PLNO1f1+Ckg2ULIvDE2Xj91nv1pDXlLTmjpSlObuBaN/H2d94P8UIg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D18A3434AB
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 07:40:50 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012027.outbound.protection.outlook.com
 [40.107.200.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCF3210E142
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 07:48:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HO/9kIURxLUcrT44NAbfvnXccan/BV0yOuR+lnsgXuBzUhIJbltk0NWqP+dUm81PK+t6UIyI+ezYY82D9ThTWFOA1+1TOsjZ8wa9HqIf+MJ+Orp0u1CYtRlHmHjB7Duos5UtnsuXCG3nDuDE1OmJVMwJqIsoshZylG6b9oV4O562uazSpmcP2TQUNRkvh9goA/MduPj3j1McVy1GYlwLxJ277Epgw4Q3QAk3cqCVZ2ZgFX6KHQLEcqWR29JqmNkMRoVRcsp9h3CgoSVegfqq0AOm0Ongm14dif95KLVqjtkM+d6uq/ypKG5RnXedcmp/aq760QYzGULidErk/YwBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1V6J19165B90wZlMPh8LVQ44VVTLwp18Q8+dG5+owg=;
 b=GlkaWyaoFcgpnPvAB/azE/J96q/2UnHOXAAE5CL4JqMaGG4smk1uu40qErFJxDUaNhFDIZD4+8TGAar2pTdZsv3My5J/XutdZCAJUemH45bSol4qeKCvyBa7l+vAm/UI2LI9I1Xgbex/UC/aLU7bsPfgU6XaNlH6tSwOLMuj6LApe93enBJAHK9WbGYXE5dJ4/igdxtSWmkFkQxzvmVR4Xc0z8iFyFQsTVyrgCi/U9GFJaTvnmd235fKMkQiV1vYOKKD6ozDv9s6wkST84MV9Sjys1aLy3szzsZ12/0C293A+hA5eVXR+uCszahooMKLEMAVaj8Uvo/9CSI6/irmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1V6J19165B90wZlMPh8LVQ44VVTLwp18Q8+dG5+owg=;
 b=FmIgh3kcnKaB3+nrWn8PFn+xlHw7sZfMP82ZE4LboYNRO9N1K2NrsuDCRPQbVQeeFqW2YKIEyA7OpIyrhFc27hn8RaJZM1LlpAz+ty64nI4/1HCqLImxtLjIrQfhKRvvA3AlI5vQc2uBaqQHQv0R9juZw9fu2xmBXFh66aJY9B5mXC26KP7NOrJKCxsJFf0BsFn9SsDDn7hDFsYG9MJeeXPEqNzGZ3HlXwhCZZ7MYc2KvPdztlJSahIL/vzBmRYkvxXOCrZwyaFeyxomUhlvAlwI4m839aNLq+ce19Cok7r6EqS/5ccGT3lJMfTthSNCXEdLgfHGEQogLmTr6lDyYA==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:48:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 07:48:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 16:48:13 +0900
Message-Id: <DF16DSHX4SV0.MI79333PZ8NE@nvidia.com>
Subject: Re: [PATCH v4 08/11] gpu: nova-core: add Falcon HAL method
 supports_dma()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-9-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-9-ttabi@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0313.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: fd84f504-7283-4403-f3da-08de3e09ceaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TGpXU09HdHcrMngrZERBQTlTN1l5dCtvaGdOVll2TldxLys2ZW9Zamh4QkZq?=
 =?utf-8?B?Y1BOUGdzZW1FNDZNTHlKVzhyWGtGc01GNmJmaXNIWHFYbTh2cFRGWGlMeFU2?=
 =?utf-8?B?emEvODZiV1pFQU8wOENDVVh0ckd2cEJQb0RwTjdQV3ZER1VVeENTZTNZKzhh?=
 =?utf-8?B?VU9DOVJOalVsN1JqRjE1YkpuYUdES1NOMGpmM1oyR1I2aXNYdEFOU1cvL1VP?=
 =?utf-8?B?NWhPTDNKU3pYUzQwS3RybzRhZXFRNVBMcm1SdjZnem1XZi9DMkVyZWljZHdJ?=
 =?utf-8?B?ZW1XTlk4VUdqVUlnWmJhS2JCZmh5V1c1aFpjalhSY2Vub0dPWlNLenU3WElw?=
 =?utf-8?B?eUtwSUFVL1lDNUIxV0grVS9YOThFMnNHemZabTJnNUZUN3F0YWVrSUkra094?=
 =?utf-8?B?OXFjUnlsY25GS3BldXZ1U2hqY3B0NUcvT3ZMait6RWY5SkNkM28rSFQ2akEx?=
 =?utf-8?B?bDkrSTBtQ3N1b1cvb3huSExnYWNkbjh6RDVhWGpyTlZPOTRpdlE4UTRXVlFk?=
 =?utf-8?B?cjZIWVNDVm1qWVVMMDhDQjZtUUx5cDc2M2IwUk5ZTXVkMnpDdlBucmdQdnB6?=
 =?utf-8?B?WjgyMjM5dEdENDl5NUdiSVhXMVRzc2toMG9rWWRicHV0d0VaUEJhcXFkSWZW?=
 =?utf-8?B?TWpWbEZJNGpLM3FBRVNodm5oU0hkeGZGZndrRUlRYll2MUM4V01NQkpwSzVH?=
 =?utf-8?B?SEtWeGtoTCtQeTF4c0dJRkt0a1dUNGNjZWh6RjRGRmdkUXFTLy9Da3hXVG5i?=
 =?utf-8?B?OGVTSlc4NlZneE96eFVCU3lFSmxQcnFGTnNOa2c0NFhmeWg2dGMvdVF5U2pi?=
 =?utf-8?B?aXFaQk1SQ3BFdXZ2U2JMNHRlMGN1bEl2L2VBSmhxTXhDdXR0TkR0Umppa1hO?=
 =?utf-8?B?eDdBUUZ0d0xEbjFiWllPZUUrTTdGWkF4T2N1ZnFSZGMyUEN4U3hCZXh0dEcy?=
 =?utf-8?B?RXJ0L0FYZnRyTDVBdHJNYTIzd2RlaGJUdlhjaUhobEl2ZTNmWHBPU2RydFVr?=
 =?utf-8?B?MGlXc2RNY2Z1WC81WUJIMlVkMExBQ2ZCL3QrUzdPRmtKUTdLRE1EL0dFeVU2?=
 =?utf-8?B?bm9qeWUvbmdvOVpNUVM5V2FNanp1NjVZbGRrWWlaYnNXSjFsUkpJeWR5L2M4?=
 =?utf-8?B?SWk4ckNJZ3NtYmtlYUdvWUxPTTRFd2lPcG5zcE41WW5ramtnayt5SVB4QnBz?=
 =?utf-8?B?YmZyMVUyTkhMUkhYRFp3Wkh0QzZkSnM3RCs1RlZwM2l3TTFhLy9EQVpHbHl1?=
 =?utf-8?B?SW5tS01kazFVaW0yc0tYeEdEcHJVV1VmRmFFMUxXeUFRVkJocTkyd3hOTlpU?=
 =?utf-8?B?ZXlmdkV2ZWV2QWljbG5RV2NrK2ZjZ0hINFY3Q2IySjJGejFxZjY1VjE0NkM1?=
 =?utf-8?B?aGg1cjJNOXFnakZpZDVqWjRkdEFBWWdGQTRXMm1CcS9xMi96NVZaWWRwRnp6?=
 =?utf-8?B?TWVWbFJhdVhyRk4zY2lPWnJyVHBGZ292VTBXeUxTTlRaK1VObTh3UVRZZVg0?=
 =?utf-8?B?OGcrVGd3VGZJcHQ3aGJHUnBHbTVrc0JZMmhZbUZnUGtQRm9TdnNiWXJzMElM?=
 =?utf-8?B?bzBoUWhqODRlanhtaC8va3poMSs3WlVkdUxNQTdvcXVIcFNQUTNYWU9MK05F?=
 =?utf-8?B?aENLckJldlB6VEwzUUtjdlkwbGlUUEdjVmhkMjIwZmgyY1E3ekZVdnI4VjBo?=
 =?utf-8?B?WDBrclNRK01XbElXd25KMXNwNEpURi9QTklxZ2VTemNuR25vMnNkSFhzcjlp?=
 =?utf-8?B?U2hCYW5RUm53WjZHSGFRWG5HQzVJa2NFUURLWm9OVHRCMDRpb1k5blpiQnZ6?=
 =?utf-8?B?MTlYZWJ4Z1B4Tm5DZTdGQlVRNlFjQURUVzVpSkZTWmdJYnZwamhXaUZaYys3?=
 =?utf-8?B?VWZlN0NDdEluaHV4bENVYlczSDRNMUsxNHBPR0w2ajAyKzNsUTNFNjJUb0ZK?=
 =?utf-8?Q?sFqii80q78fYCeFHTo29VqLkfqu7Q+Ex?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFdGVVd0K05XSmJ4R0pNblZnZHlMY2FkZVkvQ2ZITFV3amtVQnl1dXNVclVD?=
 =?utf-8?B?V3F2VnlhWWU4SGRMY2IrZ2tpYWgxcVp1WSs3dkZ2WkVrcHlDMy9VRXh0TUNZ?=
 =?utf-8?B?QzZjMWE3U21TWm1CTjFYN25zQks3SXJaMVRFNUhzMmZYbUkyNTBzQXBaTXpp?=
 =?utf-8?B?Rmg0S3FLU2wwYXJFZHkxV1ZGRFJ3Ny96MUVqLzE3MzNyK1pneEdNQ1VRMWV2?=
 =?utf-8?B?OFEvV2w2MjkxNzl4dGJBbU9ERWdTanoyR0F5V1F4NTRqdDVPcXFRcnpTYTRH?=
 =?utf-8?B?ZzFaNER0dEdacDI0bnpKRTJ6MGd3ampLQXVEUWk2RDJ3QjJ4U2oyY2NaUmMr?=
 =?utf-8?B?RGxQSmJZK2d1Mm9nT2hpRmU2T0o1czNJeTZaRS9iM2pIdW43RG1aQytHaDdT?=
 =?utf-8?B?b1QxV0plMnBGOGIyY3ptc0ZVNWpmajZZa0g2czhVcmFoQ3I1UkNIK2xqRmFL?=
 =?utf-8?B?UFI0T25ZZUQ1OG82NDFZZlRJUDRud2dRTXU4Uy91Y1N1aVJwV2pRSUYrUFBU?=
 =?utf-8?B?R3FodG90aUdQc2tzanV0T0NiLzA4VU9FaWNLN1NnT3gxbDUrMktPb2pjem5J?=
 =?utf-8?B?Z0JJL3o5UlhwdlJqMC9MZFpmcW44WlcwelpjV29kYVBNdDBrd25GbTBMVmFt?=
 =?utf-8?B?alZzTXBCRGw2UFNlUnlMNzVXeVg1Y01FNGRIN2xSdk9LeStiN2dkNUdCZW14?=
 =?utf-8?B?eTJ1RGJJMFA0MnRZQmdOL2d5MTZIekNVOXIvdUxGbThMWFh3bERnUmNnbFN3?=
 =?utf-8?B?cFZLQ1M5Z3dFSWZXcEp0WFNiYkJvdGFFTDRXeFpCYzV0SGZZcnoyeGVBUXRz?=
 =?utf-8?B?MTlucCtGSlpyNHBMTWZKNC9vaTNUVnIrV0l0WWkrK0J1RU94RUFvVkdzZlJv?=
 =?utf-8?B?bzA2SWNoRml1TEwzOHhFU0tEUTZhR0JWL3ZGL2hCbXQ0dW81N3FJdzF4c1c1?=
 =?utf-8?B?dGlLeGdMeW16NTk1MkEzM3hjZnRCMHB0OUZCRFNZZjNHaTJ4dnJMS1dtMW9I?=
 =?utf-8?B?V3J3TmY1SW8vOTFqVUF0RnUyc2tyTVgvcHc3dG5UWVM2N3hMb080cU1Pb2w5?=
 =?utf-8?B?T1h1dmd6c1luS3pEZnhlK3VhMHZFYzBINTlZbWpTYm5SQWVJMVlrLzR5ZVIx?=
 =?utf-8?B?Q1BWb09ndXhHbEJxWlhURkw0M2pTRlRKdmk2OWVCazM4ajQwNW5oSzdlZjlU?=
 =?utf-8?B?aVNiK3N1TkZteFBXYjlhWGdheGtrK1ZYMXo2aDRaQ3VYQ0IwRFNydERXOGF2?=
 =?utf-8?B?M0pOaVBzc2w5cHU0Y2Q3bHlRdDZwSUsyMTZpcmsraWJ2cFFKR0o5OExFd0xB?=
 =?utf-8?B?anY3Ulk3aGgwQlFTMVVjdjlVdFdnUE5ZaGtZWnZyOEtwblN0Y0E1RlFNdnNG?=
 =?utf-8?B?MDZnWmwwTFpNRFNvcXkwWXdwbUFscEQ1aCtJdVFIcHkwNko5RjBQRS95U3NS?=
 =?utf-8?B?TnRTOFhnQ01lUFFSUSt2M3JCazcxV1JDeHhPUmpjbkU4MCtBRmp6c2NXdGVB?=
 =?utf-8?B?c3NIRWFELzY2c1NkRGhzMTcvWlJYT29tSFRzRE5qNnVPazFGYThtbjlRNTlP?=
 =?utf-8?B?MXZZRUFIYTRDRWUxeGJBdHZhNERVcHJLY3pMNnNyRHRCbmVoWWlEVy9keDh4?=
 =?utf-8?B?bXloVHVDMGtTcHBjSVlOT2R5dnlZcXNGemNZUk5IbGZTeEg2U3EyejhROFdv?=
 =?utf-8?B?Ti9wdDJwZy9wWTROaEN2Mm9PaHFnUlRaRXJ0dWhRTUhLbnJKMHhiUHExaEVQ?=
 =?utf-8?B?a1J4VnRNb280T0pMY3RtZGlmajlBNGtib21hbXhvSVhlQlUrOXc5eFBUUW53?=
 =?utf-8?B?amo0VFlZZXMxMHBNbHVxVlV6empWRXp0VThWSzJUQzhaRFp5M1VFVmFWaEp6?=
 =?utf-8?B?RkpaZm4zU1cxcVlsaU5Nc3FEZk5yYmtZUGU0cUFtcDFLbHlOWEJ4L0xFQ2Ru?=
 =?utf-8?B?bkFXVHh4QXdxbnh2dkpMS1lSMnQ2Z3V3UUd5S25JZlN1bnNOREI0YSs0cHcw?=
 =?utf-8?B?TzlwOEtVYksrWTBRcXlncHBGRUVIVUVHVUEyMGNua3NVVXFtSkRQSmFFbExN?=
 =?utf-8?B?YkQyYzJYL01kSDVYU2lEbExMbzRVeDY3WVNzOG1QVEpaeXU2SGNhOVhiNGVX?=
 =?utf-8?B?OVFuc1hhb2Y2MWRMUmxYeE53czREK1Avd2lOTmR0S29RcnJtZDQ3NUZ1TnJm?=
 =?utf-8?Q?fqKY1B1PyhrRrVpPTl1CAgu6kFlr73z3Yirz60eOmczN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd84f504-7283-4403-f3da-08de3e09ceaa
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:48:17.8623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gOzlnVn6YPnQuHtI094YQ119bFaUyeiGvwtKXKNiN4WLJ0va2SF8Prp+m97N15js4RzgOgctbE+ahRBpdm+lLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550
Message-ID-Hash: DRT4IHAHLSQFDANGP3QSXALXY6KZ2PRX
X-Message-ID-Hash: DRT4IHAHLSQFDANGP3QSXALXY6KZ2PRX
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DRT4IHAHLSQFDANGP3QSXALXY6KZ2PRX/>
Archived-At: 
 <https://lore.freedesktop.org/DF16DSHX4SV0.MI79333PZ8NE@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 12:29 PM JST, Timur Tabi wrote:
> Some GPUs do not support using DMA to transfer code/data from system
> memory to Falcon memory, and instead must use programmed I/O (PIO).
> Add a function to the Falcon HAL to indicate whether a given GPU's
> Falcons support DMA for this purpose.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 7 +++++++
>  drivers/gpu/nova-core/falcon/hal.rs       | 3 +++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++++
>  drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 ++++
>  4 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 6b54c0ca458a..50c87dadf2ea 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -630,6 +630,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> =
bool {
>          self.hal.is_riscv_active(bar)
>      }
> =20
> +    /// Check if this Falcon supports DMA for loading firmware.
> +    ///
> +    /// Returns `true` if DMA is supported, `false` if PIO must be used =
instead.
> +    pub(crate) fn supports_dma(&self) -> bool {
> +        self.hal.supports_dma()
> +    }

Rather than this, we should make the selection of the loading method
transparent to the caller. Right now `boot.rs` needs to calls
`supports_dma` itself and choose the right method, which leaves room for
error.

I'd suggest the following:

- A `fn load(bar, fw) -> Result` method in the Falcon HAL that redirects
  to either `load_dma` or `load_pio`.
- A similarly-named public function in `Falcon` for the boot code to
  call,
- `load_dma` and `load_pio` becomes private - that way the HAL can call
  them, but not the user code.

Now we have the problem that the generic bootloader argument is only
useful for PIO, but the way it is handled is a bit too ad-hoc to my
taste. I wonder if we could pass a different `FalconFirmware` structure
when it is used so the same code can do the correct thing.
