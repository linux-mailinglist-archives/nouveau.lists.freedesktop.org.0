Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A52CFBA35
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 02:56:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 82C2010E145;
	Wed,  7 Jan 2026 01:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VlZD8n+v";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1C19944C9C;
	Wed,  7 Jan 2026 01:48:16 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767750496;
 b=fCo3yY62SMeTckP4BWOHZV+xTuzRQSNLaGVlHowOVAXAmNrU9PkKus/e3RO/YbinPc8tv
 L8atDRWFTHyxXAUP4rhlI8P6hK87U52QkQc0+188/5loGWVQT2sjo43vHgYz5Qt6r2zSKj2
 r/sWtABj/6/E2XnUIjfl79oyEPtFt93eTH7gmKMLvpOWz6/7KFw/40UKZEimK5mt9lmBXlq
 6HmLWUDe907faPCFl26MAbWz/UDNsh2KAyhCSH4c44ywVSJSixzV4G1dYv0pFK5Dn23w1FT
 baHS7HEMODWHi11q/7wickf0KlJdOm/2a531AWfFinKKO+4o/P9vJDvNyPfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767750496; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=28g27HsPqPBKAXo4sbxIAqwdXb+UPC+L703TijSDQZk=;
 b=DvYh61Tp7EjkHcAb67aCmWMGhK5CeVDopHWdUgT//KXsqtl+2BSNvLSqPNYCtDHiEzXJs
 Ia96WuuwaxIJqPWlB3BvSJuZJcCe5nPq/VRzzQKToWgaHSr+szpblJEi1pxxwq31AvYkJY8
 84gocoxGKA6t+11qcfQT6HQCxmqN1+5QqWU1QYQidpoi1Wz4G264PCAlfFO/wgOJt+6X9rF
 w2gbA0s7u8WJLLLSN7SBcO/GC4TjK4Ns82mccu34zjo0Yta6yAxRdRjNs58KdTrdnoDohs6
 dtkNgzfK4jTkP74P8mDTdX0pOvz8qm39kkqkHE8foZcHYxDAUZPQcm72UU1Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2B54D44C3E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 01:48:14 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013017.outbound.protection.outlook.com
 [40.107.201.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C83D10E08A
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 01:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBEQYaxPaIDb5aggy0zccWomEZV8C/UqGACx3PltkoKFMujAaBa4aQqKLprVdyDvpTzY75a8Mqr4J799FRJw3GTsvZm1xZFPYQjIhCFLqUaPGPAK9x9Wtpg6RV26bQcnqRYAF7QBX0X09FCF7n/Hq/EVngl1ppcH3BCIRbJuB/9GU/3G9gxnAbWwmOielMtEILa7MkQH7KGuMhaII3RrNojJddvDwHI+9jfhnnUcmbaasbYpxzfWnm04WEJGjzP+9w81eqoRYjOVcU6EirRjxO9elAUa63U3SYq8tZKVqMxNCF3bCyvMeGg8Il1MHgDH/c+3IVQ18KhPy4E5hnDbnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28g27HsPqPBKAXo4sbxIAqwdXb+UPC+L703TijSDQZk=;
 b=HLr/+RWc3XT9KLbIWDluw/D3mkLesMdl1oeIw3RLz26rZgzaeDYznp8cTRM81FqrDoCN5t+VGh5EfNXdUfDmrGX9VG69n3COfG2Tg39TLG9R4uk01CBLchH6tio5/kj/MUv00MT3nnyI8+bBaF4ZuqJtT4jiiAz3lIFLktj+KLSyyO0aiHyet/IAVdt0LR17k3oSsnx1Y2E+W31lfnbzKcpByjexzVBVwkrA+UnoXw8jVRNIiDtPY8KCdiM+zOo4U06BAfsjs2EMeYuvQ3Uwi1dt/lZw9rCcyj11scdHs8CT81Y2G6E6lw+YXrTVpVJUq4RuvrCjHqxtKO/SN6z1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28g27HsPqPBKAXo4sbxIAqwdXb+UPC+L703TijSDQZk=;
 b=VlZD8n+v2D7fqZ+IDqRtRHnIlFMGdnQ4mDxnsqMnFi9f4vhTbtYvICn1ox5i79399zO1Qw1UA1HvHzIOEtM8vYfO6DbU+r2qmuU6i1wo/Y1cOZo+lQXaOG7WVuDSg5nb49R6vRK8HAYgzVkJsJUqaxPYwUsEtSGmax4PpbH6vKY/RR/nRmPAHbs1YZHqkNL8ihLPW8+8fH7CrDDwezxXwXCa6qeBdRyRYm/te4eOSwbhT4nbccv/UDtAdx1Je9fU6UgbPZe2eF1ESXkCEmxXbZO7q/Q4l+9aOPGbnifJdrFAFa2Dmdpp01a9/P42VD44DIxwUMJ1yXRE2wHd71PAmw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9137.namprd12.prod.outlook.com (2603:10b6:a03:562::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 01:56:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 01:56:22 +0000
Message-ID: <60c8a10b-c333-412e-8b13-446a3e04c41d@nvidia.com>
Date: Tue, 6 Jan 2026 17:56:13 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20260107012414.2429246-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260107012414.2429246-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: a432a121-bb4e-4205-276e-08de4d8ff536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czJiYS8vV0dpVGl1amJmUEwvRWhIeTVjZmpsZlF1d25RYTNibFVsOEZJaUor?=
 =?utf-8?B?cTRLNjcxWkt1L2xwRFhkTjNXUEpZd256MmE0MzgyMWpSS2Z1RU5wS1BWRG9u?=
 =?utf-8?B?ZHpXclFyTm8xMGNTVkYrWTRQNVd0U0M5K2hJa0dIcmpCbUxuTTFiTHZ3eGNj?=
 =?utf-8?B?VjVVdU5heVJueFlkVENNbEd5K25mSnM0TlRlcjVPRjlJRzVEUUMzUzZzSm05?=
 =?utf-8?B?SXpwYjRjdW1WblA3dkVJeUVjZjRhS0lMUFpvQ3dzQW00T2tUMzhCRHpQaXp6?=
 =?utf-8?B?alJ2NlhYeThHd0lSQjlRVStDTHVmTEE5aUsyekZ6MzVDajg3WlA1cE1sMTlZ?=
 =?utf-8?B?TUJqTmwwSWlRWGJFY09CdzhsUU0rWmpSM2t1RVRjemZkY28xd3lOM2UyWitP?=
 =?utf-8?B?eDNyWk9YOGxNbWxadlVEMFN3MUdSK1RSMmFBVThnTVVkNTQrVVgyNlg1dDFn?=
 =?utf-8?B?djZFMmRtRVF3ZUN2V1kvbXBpVjBIdzE3VmNxWGtmODUzMUJzZ3JYWkdYNWxi?=
 =?utf-8?B?L0VObnlseE4wUllCelUzN2RaVlQzckNlN1Z1TDdWRm1QQUI5K0lFTzhKNmlN?=
 =?utf-8?B?MFp3L3lxUmY5RUdhcEw0OXViQmNqUHhoVjNDajQyU0d0MHpld1RndTJ5Y240?=
 =?utf-8?B?NzF4cjNPeFVRRGdOQjQ3WEpQdzN6ZXlhcUE1TkV6RDNCSm5JaExSZ2VHTHFl?=
 =?utf-8?B?akdVc0hFYkUweGczK1R0WHJEb3AvREhHa2Rma0xQSUxjdmxYd3JxMlhRWkow?=
 =?utf-8?B?d1RKOThPc3JQOW55STNtaDZVUHNienl1ZWkwbUxjRlVnRHFqREwyTTIwSGxD?=
 =?utf-8?B?QjZVNW5pQ0llYko0WGh0Zkc3cHZsVlVzZHMyT2FKM1NIbkRXR1RqWWJJTVdx?=
 =?utf-8?B?WmdscUV4T3o2UHhGeFdwRGhDcWhXak43T2taZmxLZFZGaytzT2hFSy9Yb3Jh?=
 =?utf-8?B?a2VGQ2Z3Y213NWhadnBMRE5hbnpUNFZsWlNGZE5QdGZzRG1nWGZmbVlXSzVU?=
 =?utf-8?B?cDNaWGx2R1IrZncwM3U4QUJjV1REOGswMlM0TXVtS1FkU2lUc2l1VUgyZXY1?=
 =?utf-8?B?Yng5cUV2MTM2c0VyTkN1S2taWENKRUJCdkdsQWQ4WGlxMmxybU42V2lWaksy?=
 =?utf-8?B?T1JSZTlOQVg0Qk5MTUNDQ0NZWnN5STRpN0tZZ2dkaDV2NmliTTAveGFkbXNn?=
 =?utf-8?B?VlA4NWpjUEtrMXJHWFNHZ3pSUjZBVHNJakExZmNJejdYVmZibzc2cFc4RE44?=
 =?utf-8?B?SWxXMlBhajI5VGVDUHFIYnNSTkRmMzIwOWVtMnpUTTJrWlVMWXV3djNFbFNp?=
 =?utf-8?B?Uk51ZVdoeG5QeGdrZXRBKzRGTE1vYWlGR1RHNndLYUQzbmlBMVZkbUVpZCtY?=
 =?utf-8?B?UVAzSFRwSm5BOTcwRUNCZlIvVGFSQWlzSnMxUC85UFRUNm5mZFkreGtKRng4?=
 =?utf-8?B?Y1JYZTlPbms5UCtGb3hTcnJFQzhlNGhoOEwrc2ZnbnJMVnpMTlVXSnQ4NUsx?=
 =?utf-8?B?MEw2aThRZnlPTnRuRjY5aVBMQlJSNzRKamQ0QTZmR01YUnUzME1HaytkSEdU?=
 =?utf-8?B?QXNFektiRWN4NFk4YXJLY000YURkc0g2ZVJlYlpGVDN4eDhsTnVGdWhaRWh0?=
 =?utf-8?B?YTdHNnhyOWdhWDJJK212blJPK2k3UDV1Y1FFb2FWM29pQWp5S0xNRkNsNUV1?=
 =?utf-8?B?c0M1SC81OHJscHBUeldvRG9Eek5qN0Q3ZFhIQVh5TFBLaDBiRUFJWXJNUG0x?=
 =?utf-8?B?NW9HMGhpdkNTazE3dCtYTDZqek1kYnBGaXpvNlpwT002TEhrU081R3p6Qk8y?=
 =?utf-8?B?Q0ZFYzljc2EvdnFUVWFBb0JSNEJJUS91ZnZXSWpIZ3FwTmt3S04rUVVUZU4y?=
 =?utf-8?B?TWp1dTNlbW5YSytVaXlOY2djY3Q1b21PMVFOMSsvN2NQOTJ1Tm9uZ2FtN2RI?=
 =?utf-8?Q?qzWlGxjHW1YQlpbc3if8lPX32YPr3IoU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d1U0Yjl5Ylo4Y3FCeWpISmtuZGdOaEZOaTFtWjRoNXJnd2pLM2Y5eHpGRU1o?=
 =?utf-8?B?NHMxRWorUFZtSWt4QUpySWpMeXlmeWZMaWRscnNtSll6SDI2ZEZFdU1ycDFa?=
 =?utf-8?B?QUJESy9GbS91cEh0dGxNYmludzhrblgrQ1lSbSt0RDMrVWVzd1FjS0hRalcz?=
 =?utf-8?B?SStuRCtpOERQNWM0OVo3ZzFnZDhGVVQweFJabFdMcDEzeE4wYUxhWDJzUUFo?=
 =?utf-8?B?aE9NNlpQdXdOWjNpZkFxczhISmtLRlYvNmRqTjdTKzkrS2VCT2xjNFZ2akh0?=
 =?utf-8?B?ZkhrTmtTN2pmekVSNXNEWStlRDFqSUQvU3ZGYVNFTWJaOWVnTDFCNUg2TFJJ?=
 =?utf-8?B?OWFJeEh2YVlqUDZhR2NhejJacmFNTFpHUlFKcXNhQUdJM1JlaWZpRkd0UGhz?=
 =?utf-8?B?c3JBK0FjM2ptWklkMFNVbUpQQUwwTWhXWkxaOGVLSituVytqSUgyd09OeUkr?=
 =?utf-8?B?WWJ0YU52M1hqdnNNNXFDaXhsK3ppMXVLcEpuMGJTOE13Zkc4U0xzMkIxNUhP?=
 =?utf-8?B?cHUzU1FrOUVFTHJkY3hTdUdRYmlDZHExdzBnWjhTT3BvVnF6SldrVXRiN2Jn?=
 =?utf-8?B?NzVFSldLZTJoZkt5YVppblgwVHdVU0pDaTlxTWw0eUMxRkhLQldhbGRZZ09N?=
 =?utf-8?B?VGxyZUczTytsZUtLQUVySUZXb24rQWZRYmhtS0hJOTl6dHNQRzhRdm5MYVE0?=
 =?utf-8?B?SzhrbFNqMENnYndEdnFCVnB4eEwxL3FqSVBDQ0Fqdk4vYS9BYkwyVkNsL2g4?=
 =?utf-8?B?Nk54RkN1K3NTQi9hTCs3SXhlZncyK20zNEFoR2F6TnMzNWNJM0NOOWtldVBm?=
 =?utf-8?B?UFE5bFVzWkVrMFdQN0VUUWRSd0RrMitpK1RCZTdpemViT1VHN0NWY2RpREhN?=
 =?utf-8?B?UXlHZkxpTGpNcmlLcUEzRjl3clhVNFhGZGdLMWpNZUFWQVducGV2ZndRWWZ1?=
 =?utf-8?B?STFUejM1R1B2cFJESUZ2bHFPeTJQZ3pocG1rUDFITVU2VWJvc0FiQ01XaUtW?=
 =?utf-8?B?NWdRbWpHTnFYUUMyRCs5bFlUNm44Z3NVRm03VWZvbTRaWk5rc0hiR3ovTE10?=
 =?utf-8?B?UVRMMU5MK2RmUVNHeFZuYkx0RWtDSkdadTBPWTIzVTVvMHd2UlVabmhkN05X?=
 =?utf-8?B?T0NGTkxlNUhnbmE5ZWZPUy82Y2I5TG9EK3p6Zlpyajl5QlBLcXNjNnM5eTdz?=
 =?utf-8?B?MjZyb1BEQ216dVYyeS90VTNmQUtha3dmOUpYN0NoYldYQWJvWXRSN051cjI3?=
 =?utf-8?B?TkVEd2hxSnV4eVBSTEpLcFU1WmlZM01pQzRYa2tycVl1SVZBamd6YmhSZEMr?=
 =?utf-8?B?Z3NTRThMR0dYaGJoSnVwVTJjZjBHcURVK3kzU0VLNzAzUGVGVWZQb3FyTGZX?=
 =?utf-8?B?aDdCcDdxTU9YYUNoU3NDVHNsczdOa0taVGtkbjdLZjZZdThTcUJ6V0x0TGY0?=
 =?utf-8?B?QVJVdENUa0plUnFTbE9iYU9xNmFYOWdKUStKSGFSeVF2Y1NsaXJjRDMrc3V1?=
 =?utf-8?B?TjNyY3grUmo5ckpyeERNOGVvUE1lQ1hBR0ZDOWNaUHY0Ti9peHhFbnQ0RlhF?=
 =?utf-8?B?YWRTcDFZYWE4Vjl0dUNKcXFpV3VjSnFqbzRVaDZvY2JreGMvWjJGZUdTRmZI?=
 =?utf-8?B?VDdYRmhudVY0WHYzMnFHVnppTEVjZ3hwa3ZwS0hEbkZqQ2FOZ3pHa3o2dnBO?=
 =?utf-8?B?RUVYcFc1aytoT1EzdDl5cW9vRDZiT01FNkRjZ2ZScXhCYlFtUW93ZnQwRSs0?=
 =?utf-8?B?T1JlQVUwYkhLb0RSUkY4OUFZQlo5Z1FGL200L0NuR0lGMldDbHJIaFhMWWRv?=
 =?utf-8?B?Y3ZjcGVTdktvQVhmdkRVdGQ5aUE4bVN2dUtkZkhtMGpiTTlKMWZBS2xQMGF3?=
 =?utf-8?B?emcxaW9HL3VHWUlpYXhNSEdnRHI4N0hUeHVxT2w2T0UrbERaNVV6dUZzVHp3?=
 =?utf-8?B?YzJJbWRjVkR4cGVTRjdKRXh2SlRYYXdGYWN4U1lOc1ZITGUzbGVZejhwemVQ?=
 =?utf-8?B?NzZqMU13TlpIdXVjcEVXcDFJeHdEbWU4OHB5QWh4NGdFeXE3UUhhb0N5WDdE?=
 =?utf-8?B?Uk5ha3dVNzdxTklTODB6ZHAyQm43NkM1SE5OeWdaZzhMeFF5dzJhcGRaNlpH?=
 =?utf-8?B?cW94N0ZYWkErNUg2WEN3UTZkZTM4Rjd6RjNqQmthbzF5Vjdjd29Yb3l4YUVI?=
 =?utf-8?B?RXI1c2JDM3ZOdXdOUXljTUNGSHMyWUVGendtMnUyblRVQTRwZzIyNzhiOVZQ?=
 =?utf-8?B?clZSUEFCL3N6RE9vdFM5SHFqaFIzcDJBY0d6Q1RNclIxaG5VT2FIL2d5c1lN?=
 =?utf-8?B?MXlTNk5RT1BYZjZORTBkRzdXblNWVkdkTGlHM1lkcURQRjJUbitJZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a432a121-bb4e-4205-276e-08de4d8ff536
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 01:56:22.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R3dyK3A3R5/eXwquuxjq4X50ANzH51S//XecqxFzGaVwrZTp/sPnrErI/Y9ZW0zGzb8wJ5ogAMda0IldcSEpmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9137
Message-ID-Hash: V4FFBXZKQY7CSWMZTDK7WHLSSOV6VIME
X-Message-ID-Hash: V4FFBXZKQY7CSWMZTDK7WHLSSOV6VIME
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V4FFBXZKQY7CSWMZTDK7WHLSSOV6VIME/>
Archived-At: 
 <https://lore.freedesktop.org/60c8a10b-c333-412e-8b13-446a3e04c41d@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/6/26 5:24 PM, Timur Tabi wrote:
> The NV_PFALCON_FALCON_DMATRFBASE/1 register pair supports DMA address
> up to 49 bits only, but the write to DMATRFBASE1 could exceed that.
> To mitigate, check first that the DMA address will fit.
> 
> Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and base code")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 82c661aef594..fe5abf64dd2b 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -493,7 +493,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>              Some(_) => (),
>          };
>  
> -        // Set up the base source DMA address.
> +        // Set up the base source DMA address.  DMATRFBASE only supports a 49-bit address.

Your commit log said it accurately, so I think we should use similar wording
here. So maybe:

   // Set up the base source DMA address.  The DMATRFBASE/1 register pair
   // only supports a 49-bit address.

However, one could argue that only the DMATRFBASE base matters
when considering overflow. But even so, it's slightly confusing
at first glance, to refer to a 32-bit register as only supporting
49-bit addresses. Of course yes, they can look at the register
which is shifted up, but still.

Either way is fine, I'm just fussing over nearly nothing here,
so:

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard

> +        if dma_start > kernel::dma::DmaMask::new::<49>().value() {
> +            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dma_start);
> +            return Err(ERANGE);
> +        }
>  
>          regs::NV_PFALCON_FALCON_DMATRFBASE::default()
>              // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which
> 
> base-commit: 4348796233e736147e2e79c58784d0a9fb48867d


