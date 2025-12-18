Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AE1CCBB09
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 12:54:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B027F10EEAE;
	Thu, 18 Dec 2025 11:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VecAbe2C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DD8EA45685;
	Thu, 18 Dec 2025 11:46:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766058408;
 b=P9LgCSpKdGHneYCTza1ZZ+rZlxYtMrY4+lpKbypTTlUuCGQiB18OOrY3vp6/4nKGoV6Ed
 wPXv1hStiZKOjwdf2kcmV1W6B7NlzBK9UyC4E9q8R+QTP3M5sA6A5LlyO3NpTJ26Bk/4Z+a
 obeKsvzre3oYKUeBrhopkx8G12MOMTYjRnaeJD3jvE9ZXGMlrB691hVvkHzfbSkkWBFlXa2
 ioQPC6pYa/ZOSIYjCoKtZ7O0mIc/TilXLp2eFpNTOKa6oAVjcVhfIo7GlZTCKkQvFMSfqJa
 Clxcc749a2yb8JFiojSRYh8afz/28wPItHhNjxTIxNbC9UwmM7V2W/KKUHmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766058408; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7JFy2/BHEhgEevooYPHDc9Jl/BvVwInbF/ACO9MDO48=;
 b=g159ttaeoGcupLJbCb2azdbCp104UuhIR0LbchO7avAdmn4MR/r+d0g5VyuuqruFzilko
 Tqx35houOabju706nHx1lX7UOco7si1i7yCICFP2kbhnPwS6aPzbZ2a87dbsfU+VBueqn8Y
 maz5xJJoIdmrCVL9lXHZAojBoNzmMyYht6zEheztlxvT9QDhg3JUUL4daiG3jltHRYcIAF4
 V4Zx0Z7PmL9BNIHROCaVnxwdHFUsuAJ2j3SCvk765KImq0mSdtPhxer/Rnd7C/hjaykUkjW
 voyyQuYIFRTFmRZCROUuiiSO6d2MEouehFW9f/3BZQVRpUxxTqOFkRn4SKFQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4DBB545656
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:46:45 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B222A10E9D0
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 11:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RP1vpQzlIj8yh+4KD5pVnZRkLJt1BSU9rgMrWNioQyIYwaoAo3rvl0XiJxxo6qsKQqAsscqLJycQcdlU+IUZDxTRIHKFFkbB7uxTCPxq8iqJn+SMqlnVZEPFlykZVjXlyFRjaxSD7ZOLhuw3uz+Ilun5m1/MyaMUrJ+Yo4MF4zYhUyzc6RdWWaEKVNFMUIcgS+RwGabtJSKxQZ/aRTYMTdHzgByPfgIIYIRJ1T8ADQ2+c/NYVxKxVuU2w7vtJTiThjy2UDZKZnlERkTsZej3e1zSIcyYWAorJq+PzODCq7f+CXV71zk24jKlQIRSsWAWyzxGvl0rc8YTZFZPz7iyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JFy2/BHEhgEevooYPHDc9Jl/BvVwInbF/ACO9MDO48=;
 b=MnJ5kjZ8aKP6s+tQCutDzwoX5X3XJ7huA2bcjL3uf4w2L2160NcSRfelnCTC8OTGLjmpY4yziIvbGpLIEGq8WoEYbnZLAQh/mko2LNHQ+kCV0n1iNJxCZzpELjhP+QOPR1roxnaoYsJawrD5e/fbzmWTQtd9hxZZZA8DiTtG80He+vSzKUf9rz4LnOuGOAjNXJ1S/Qr7GX0Qabj38UT5FzpTDEfin4bHRly3hJTZr9+WRNSURxliOLBIW51jPUpreiH7caiG50xdSV7KG5LpnrcHeM4xWHia9M7Z3uAMZHWJzDtE7qEziRHpgcb7kxTzmZciGUZMYn2+y1WD3i9aww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JFy2/BHEhgEevooYPHDc9Jl/BvVwInbF/ACO9MDO48=;
 b=VecAbe2CBSifXJsWpZ+dC9eRL0AkAmrUpok6zeFKi6J0RJp2te/EicPVb+UXY7uKM9Lqq2nUZN+oDZd2LQOH0meOBa6SqoM+jhRpci3582tyP/esFK5fTgVF3kJm5M+rxVhy8MBClcgkNfocYMpZ8e6/oY/q/IDD9P/m9GJ5Nt/3zChVXxJv4yrz9FQTkfhS/gR+W033ia2KzY/lSgOSYYTdD9P0T6EIgba7at3D/Esulo0V881/NKJkvJFL8ZYVpswTPl3q5VWICJfq0NB8oxI2lDCraT7sv3rEQvncphobG41zZkNdQLES7BO/8zCy0AMECTzNuz+/NOfh9ULrPw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 11:54:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 11:54:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 20:54:09 +0900
Message-Id: <DF1BM2Z71OY4.246P9YGJC6J4N@nvidia.com>
Subject: Re: [PATCH v4 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-11-ttabi@nvidia.com>
In-Reply-To: <20251218032955.979623-11-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: e8395af3-1932-49f3-73ad-08de3e2c2909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGNqTWEvTksvWVRSQmI5RjhCejluSHJUeG01eTVYZS9nU25DalFJK2ZPOWZk?=
 =?utf-8?B?VUY4WWo4dGt3UkV3WmttSjMxYVNHd2t6dzBvNzNYY0UycVhHWWVzTEIvRDFP?=
 =?utf-8?B?VXlMNGxuWHpodSsvdW5yaHEzL01TUnFTQ1RKa1RJejdHTWJHUXE3YUw0ekdi?=
 =?utf-8?B?azBXNHlkUnFWZG9yZmpaUVlKd0lmZjVXMXlCUFVlV1diMW40ZzhzV1VmWnYy?=
 =?utf-8?B?WnVSU2pCcnQ3R0h3a2l5OGx5b2hqdDdub2w0OEFkYXlLQ1cydjcwalBmZE53?=
 =?utf-8?B?R1VDZVpjUTUzeDBVVUIycEEwa0dMZHZFaFJlUElGS0hrYys1ZGx2UkoyekJQ?=
 =?utf-8?B?YlJkZHhUa2psSlovUmtvWGhBdFhnaFFjMzBYQnR4RnRHa1NDNk42cndSUEln?=
 =?utf-8?B?NnFhcFpIVTgya2xSTkRuQVpQd3hHRDk1Z2N0dUNtTlpTU1hQWXNVSUVLdGdm?=
 =?utf-8?B?b1RodnFzS01tTytxZVhnOWo4RlYrS2VGdWNlRTJJZWUvZHN6eVpQM25ldVdJ?=
 =?utf-8?B?NjZReXNYUW45SXJKV2s0T3JSa0xlSEZ5YVc5TDV4dVplU2dkUlpkeFRqRUxt?=
 =?utf-8?B?Y3RHakVySm5IMUZWQWlTa0NYaExRSHcyWWRaRXJFWVBDSS9SWkM3L0tGVUpw?=
 =?utf-8?B?ODhvTnBOWlRXQW1FS3AyMTliRGJSY3BJUUZjbkU1czFZd2FZRFFONWlCK29C?=
 =?utf-8?B?dEM0RDdDZ25UYW5zbk9DMmVKa3pFazUremNxOXZOT0trVlVmVThDSG1GaS9N?=
 =?utf-8?B?VkVnVlVRYUJxN2NUeno4VGVHbkpRbmpJaVFyOEFmWExadUQyUFg2YUNDeFA4?=
 =?utf-8?B?dlVPTFVSOGhhajVvYUpONy81bDNlYlBjcDMxNkV0TWQ2bWZXRGNDRHZ3WThJ?=
 =?utf-8?B?YWZSSit6amw5NlBsWDdja2gvZmxIeFBQU29uOFBObEFBZTV4U1FQZTFKYlR3?=
 =?utf-8?B?anFwd0hpRmNyQTVsK1Yrbm1DRGdaNWZqbFJUb2l1WWhtS3FySFVBbC9xekF1?=
 =?utf-8?B?azk5aDFWN1M4bTJwZVk0cWN0SDhnNWRLSS9WS2pYTXZuWGkvd2g4VzN2a1Zk?=
 =?utf-8?B?V1NEU0NLUDErMlp6cXBPTVE4NWJkbUNHOXBmMU5nNllScFd4bkdYL3hpbmNJ?=
 =?utf-8?B?VkNORFJWc1AvNzRBWS95eVlvZE5mblhHK043REIvbTdmek9lU3hxcHQxUzNW?=
 =?utf-8?B?VVJjQjN2alRmdVZ6cnRuaHhYZTVMNy9pWmhBbFRzTC90c0M0Uk4vR2djTnB0?=
 =?utf-8?B?blRNN3lEQmpFYytwODY3ZEh5Q0xNL1ZQRllYY2R1cVh3UXh5ZjNFZXRvNzJF?=
 =?utf-8?B?N2hkMS8wVUhGUFNzU0FnWGsybXRIT215TG9WaDIxb001SDhiOTFoem96QnNK?=
 =?utf-8?B?UytudllUbG95WUtUQWR1TXlqQUl4ZkVJRktwbFV4aTFZMXlNR3RoM2F1ZmVY?=
 =?utf-8?B?c0d3YlpLb2Nlc0p3QVpRWEl2YmptQkNqU3huS3VWOCtNY2M2KzcxTEtvRjMz?=
 =?utf-8?B?emNSOWFsdzV1Y1oxcVVZSlNFY0RKbjRxdDc4dG80aWNraTdWMHRmQkxYRW5I?=
 =?utf-8?B?enFyNU5HTE9ab0ZzQlNUSlVSSDlFdm80ZlF6YTNzUmF3UHo1QjVTcjRHblNW?=
 =?utf-8?B?Y0dNV0FsZXZJWmJkb1VoamtJZWNXSmhPUHdVK0xxdmc2ZFNsZ2Nlb0dmL251?=
 =?utf-8?B?OW9LWVoxQWtRY05FVE9ONGhQYkR2L01rMTJVNXc3RFZ6OE9TRE8xSWFmV0NR?=
 =?utf-8?B?OUQzb1RqWW9CODZDZHZrRDBLSXh5OVRXRUpqQ3RzaFY1bkovUGNvQ3FqYjFM?=
 =?utf-8?B?NFYyOE5tNmxzQ1UzVVRBWmJCNys3QVBYRzMzd3NnQ1dLMlkyamRaNXpHL05T?=
 =?utf-8?B?VU5vb3RYTzRaMFh6Mmc2RUU0MGFBazMvc25idmxMbFp2U0xqanU4VkhYMFZH?=
 =?utf-8?Q?LWB7jsILrLRb4K8F6/nMxE3SkmX2+X4G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0lBTzFGM0FOdWhWYjRoZVhIQ20zdW9uUUxDZEh4K3BXYUVveElKdS9kczRm?=
 =?utf-8?B?cm03S1NQb2tKcTE2NWxoS0hNdGlPWG83L0MvYWRMTzJkbVpFUCs0UDR5VUFl?=
 =?utf-8?B?RnJvdzNQcnBTSlpmdDNkSE9IamZZME1nZGdlMlZHYmZHZzUzcTJ2UzdpcDdX?=
 =?utf-8?B?eEc4WGtWNFNaSHVEU1JrWXFlRldISXdSb0k1MmZ6WitmaExpTlFYY2dPSnY1?=
 =?utf-8?B?V0FBNDRtUVY0eWlIRzRrU2xhd3R4cWhxZTg0b0RPU2NEK0N5dktraEUxcE5r?=
 =?utf-8?B?VmYrRGp4S3AvRFBvOTltWkUrc0pvak1adW5oY0s4S3dTOG5LS3Y3cHRCQzRQ?=
 =?utf-8?B?YURwdStLMFYzWWt5ejlwL08zcEZreTRENldiQnI2OExIL01iODExRDg4TU1F?=
 =?utf-8?B?R3IvanBPWlRYSnRDeFNLQU1jdDJoMkpTU013OUtzUk9zSzlhQzhyUnU3TGVm?=
 =?utf-8?B?a3pRa2NzSmVOM2YwRFBqODE3ZzcyOFpscDNrL2lYWE9xQ2M5VjZITng4Vk12?=
 =?utf-8?B?SXN1RXNTanBmc2h6b3hRYlE2dFZLckh3Y2YxczlOUTdhNmJxdzZMSXlSNHNv?=
 =?utf-8?B?V1JEMlFnZ3k0ODRQSDQydmJ4Q0tNaTB4ZG05MmN5S1V6SmJQMGExa2xqUXYw?=
 =?utf-8?B?TSt4R0xwUzUwNTY1eXRGQThnaDNSNksveGtPalZIaHdHdW5WcE1uK1hjUy9U?=
 =?utf-8?B?OTZGRXhZS0V3VGE1aFdVaW92eXhjNm1GUjdWd0ZpT1NBZENKdlc5M2dTOG01?=
 =?utf-8?B?N1NOa241Q3lEZkE1NUNBaHJzNFh5eitmcWxtZ0lUcEhYT1VwM05nVDh4K2dw?=
 =?utf-8?B?T2ZNUkNZQTVub0dKcmZHbFd4cWV5U1ZXZ1M1bG9wQ3ZxL2lOMTFyc0VkQk9l?=
 =?utf-8?B?OXpQbzd2aWFVUms4SlhNSEdPL2dRdXptUlo3R0hTV3ZncWt4UDdjK0x2allR?=
 =?utf-8?B?NkdTMHQ0SjVoTkNHc3N1UWlTd2VVTG9hQjFaVUROTFgvbUdYRnUxczhZQlVR?=
 =?utf-8?B?UU9tUkVjMmlDTkxRMmkzb3U5QmlWVlVBaGFuWkFDengvNFZZbnRNNi9veno2?=
 =?utf-8?B?WEowdzhKVzhGYkQ0VWx4K1A4cnpPb01DSXpzVXpFeWJXTWVhWEtya1BKbGs5?=
 =?utf-8?B?K0IzR2U1ZHp1TzJzQ0ZzUG9Ma2dVQnYrYWtBUlZLQzltTisvRlZ2eUpiT3dU?=
 =?utf-8?B?RWUveUIrMHVHbXVCUDZuNHlndUlWZTVIVHYvYmFGZjByQ2FuOGhqVWw4V2JQ?=
 =?utf-8?B?UHIrTkxWZG45N1RqSkVCazJvQXMyejV1QXpVVngrU003ZVZ1eGM3YXdnekI1?=
 =?utf-8?B?TmRVdUZwVFhsd08zb2RKMXBSb2hhUVN5UFB1NzJzZzFlQVdGRFAwbzVsVkJ3?=
 =?utf-8?B?SU1vTlJYdjFCYXB1UzlxajhWQitFb1JDZ0l5Z0dtNU54NjY2cXBCb0I3d0h6?=
 =?utf-8?B?dkM3YlhrTWtSaGhhTno2VFJ5enRObkp5Z2RaSTBMV0ZhU2hRRk9mcDNxL3Bw?=
 =?utf-8?B?YjFLOU45a1ZOcElIUklZU2lQYW41YWhoV3A0d0Q1TjBTRGpwbWsxV3lOZll0?=
 =?utf-8?B?WFVxOGdsN2lHdy8rcy9sVDRsUWRJMEJKMU8zcUVEcFl6a3BMdTJsQ1BqanhB?=
 =?utf-8?B?OFRaTk1LdHdKcEhjZ2dCZ0Z1WE0rcEovN1N1eWl6Q1lIRzZnak9PT0hQdnlO?=
 =?utf-8?B?VTM4dmRwcVBDWDA3ZXZlZ0xMWU1wTmpEdlVJOC91Z0FoMlJ1a2hDZjV3YzNF?=
 =?utf-8?B?U3ZSNWl1VHpVZm9lS3dWRnB1L1U2RlpOVEtLOWNxRis1aFViRjJyYU1mYlFR?=
 =?utf-8?B?cnpLbVM2WGlKdlJTdStXRzdIUTlVNUV0azZxZ2Z5VlRFZHdnNHd5dHp1SHg1?=
 =?utf-8?B?UllQeDM2eExBT0lHdzdkK1hUcTlGckQ0eCtrR3B3STR0N1pkaGtneElONzZF?=
 =?utf-8?B?cTFLTkR5RmlZdElTS05DbFdsbk96WlV6NWdZNFJKS3ArZDFtK1dMakxnNTNP?=
 =?utf-8?B?RFQ2YTdiRHNvSGRNYXYyMkU4QkhLbUNEcGlacERUKzBJTHpEeitRQk5wUzZY?=
 =?utf-8?B?MVZBWEFmUVo5Z2R2ekJRTmpLb2p0ajJZam1NV1FzeW83MTFRWFJEalNKcVNV?=
 =?utf-8?B?Wnl5Q1hURWlVRGViWFBFMTMrVGFOMWZoZnFRczZkTlA1Nld4Vnp6aGNjcitH?=
 =?utf-8?Q?eKTZhd4aY6+vM3885+R70slHSnA7orR4qXAAYZKqFrg5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8395af3-1932-49f3-73ad-08de3e2c2909
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 11:54:12.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YoepvG+Jf7uQMfWSP7tGVRAjJxzohVQSeEmX6IPIXP0bnge+jfN/vcyYQm3miYhmZ0aBYpBbQe5+c6P/DIYOQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
Message-ID-Hash: Z67VDCGD6I6WW4XTE5D5VMATVN4AEV6S
X-Message-ID-Hash: Z67VDCGD6I6WW4XTE5D5VMATVN4AEV6S
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z67VDCGD6I6WW4XTE5D5VMATVN4AEV6S/>
Archived-At: 
 <https://lore.freedesktop.org/DF1BM2Z71OY4.246P9YGJC6J4N@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Dec 18, 2025 at 12:29 PM JST, Timur Tabi wrote:
> On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
> that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
> aligned to 4KB.  The logging buffers are already aligned to that size, so
> only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
> adjustment by adding padding to the end of the struct.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index abffd6beec65..ab3ad038889c 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -889,17 +889,27 @@ unsafe impl AsBytes for GspMsgElement {}
>  unsafe impl FromBytes for GspMsgElement {}
> =20
>  /// Arguments for GSP startup.
> -#[repr(transparent)]
> -pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
> +///
> +/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgume=
nt`
> +/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to f=
orce it
> +/// to that size.
> +#[repr(C)]
> +pub(crate) struct GspArgumentsCached(
> +    bindings::GSP_ARGUMENTS_CACHED,
> +    [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CA=
CHED>()],
> +);

In gsp.rs we are still initializing the rmarg as follows:

    dma_write!(rmargs[0] =3D fw::GspArgumentsCached::new(&cmdq))?;

Which passes the `GspArgumentsCached` queue by value to
`CoherentAllocation::field_write`, i.e. 4KB on the stack.

So I think the proper approach is to keep `GspArgumentsCached` as-is,
and use a different type just for allocation:

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fb6f74797178..0feaff5784a7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -25,10 +25,9 @@
 };

 use crate::{
-    gsp::cmdq::Cmdq,
-    gsp::fw::{
-        GspArgumentsCached,
-        LibosMemoryRegionInitArgument, //
+    gsp::{
+        cmdq::Cmdq,
+        fw::LibosMemoryRegionInitArgument, //
     },
     num,
 };
@@ -114,7 +113,7 @@ pub(crate) struct Gsp {
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
-    rmargs: CoherentAllocation<GspArgumentsCached>,
+    rmargs: CoherentAllocation<fw::GspArgumentsAligned>,
 }

 impl Gsp {
@@ -141,12 +140,12 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> Result<impl PinInit<Self

         let cmdq =3D Cmdq::new(dev)?;

-        let rmargs =3D CoherentAllocation::<GspArgumentsCached>::alloc_coh=
erent(
+        let rmargs =3D CoherentAllocation::<fw::GspArgumentsAligned>::allo=
c_coherent(
             dev,
             1,
             GFP_KERNEL | __GFP_ZERO,
         )?;
-        dma_write!(rmargs[0] =3D fw::GspArgumentsCached::new(&cmdq))?;
+        dma_write!(rmargs[0].inner =3D fw::GspArgumentsCached::new(&cmdq))=
?;
         dma_write!(libos[3] =3D LibosMemoryRegionInitArgument::new("RMARGS=
", &rmargs))?;

         Ok(try_pin_init!(Self {
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw=
.rs
index abffd6beec65..15ca9c183ae1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -906,9 +906,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspArgumentsCached {}

+/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument=
`
+/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to for=
ce it
+/// to that size.
+#[repr(C)]
+pub(crate) struct GspArgumentsAligned {
+    pub(crate) inner: GspArgumentsCached,
+    _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGU=
MENTS_CACHED>()],
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspArgumentsAligned {}
+
 // SAFETY: This struct only contains integer types for which all bit patte=
rns
 // are valid.
-unsafe impl FromBytes for GspArgumentsCached {}
+unsafe impl FromBytes for GspArgumentsAligned {}

 /// Init arguments for the message queue.
 #[repr(transparent)]
