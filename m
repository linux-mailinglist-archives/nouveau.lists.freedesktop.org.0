Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E66CFF861
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 19:44:09 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 24B3310E655;
	Wed,  7 Jan 2026 18:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y0dG0uaZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2EEFD44CA4;
	Wed,  7 Jan 2026 18:35:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767810952;
 b=YW+TtfkRGlNE9qGIp1ygWXWfEOoVtBN+kLQ7OWzpKvB4//3zNU6brHzV5JOohxQevMVfi
 oHNEgVInsmIp1FusjM+f1KHOE12dYcBAK5bEsk7Yy//tzIOQv+tU61tmoRy70IZ5iUmsyJ0
 6YTSZDPEQ9HPIWJeiEdrL4E9ERXqvjGxmHx6pXoT5f5HGXmArd6BcmpfuPjmYw0CBaoz35L
 pM7G2ljRPYmbUZoqhCELn1X228BulMBhLEPKmJ3GKv7zNXtfj4DQb6+cLTvySiDg5rqWcts
 q3vFixNed+dLFlxFgf/Jo+HgMJILx/T8eaY+7gRMt/IQ0Q8MacQ6krxIqeQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767810952; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hV6cM8BQYEzv4iwJevzAClz0zCl8yksek7fHXzWkNOY=;
 b=A4MquKlxYLtKE5GgWK8V0bIdEywTZxwRbjQKZox0td6mFGXsfici5YvjHqMaHTxbZc73q
 tBl3WRzZFsGFlEN01V88+guxQBJQx7ntVAWXXHvZNIAIaKMxEXEar2GPFCAmT71a1dlqyQJ
 g/AgPkefw0COcBEIG5eEKv5co0MQVokfI2aVGtrTOvMAfq19lk8KCTRkA7aPRi8e3baxoQ7
 vFK4gxbvH3s223iD/WS9P2IgVlD/caq2wmCn7p1V+2u73zNk5VWKQYvm5CTSvI8oiQyo+WS
 zyVlbSU+jzmZdZO/9L9GN/N8IeEG5PVTZvG/3zol5crOwffQT4OwrlCjhEww==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0A22B44C65
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 18:35:50 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9764D10E279
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 18:44:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWw6hIsHa++43rfkOMId1ftvLRcDjCou7pLSOT3CLWlrdLQ8992j4Mf0pm6ny6bL9jrCyoDXeh7FoJpnCohYcZMCuqzAi/l8AbnidYO0j45zVj1fKNgKL2M9oYSAJi0k0cybEL9D9eXOiQ9xb39iw7KxXXQ4QHOoko8N2mL7wiK0iNtOFki/v4HUhanIcJqTrGcv1EDtpmjzcjvpqbrNM5xlMNQ4D7r/nnRmepRulq/Wm64n/VTlkhrfvjIEtWd8G017XcCrBM6xcNh0gT3TrJa4r+YS1T2JkdbLkYSLTNaE844GQ9dgcPO6Kw1ib88HxY0tSrje54CgOM5LZ/V8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hV6cM8BQYEzv4iwJevzAClz0zCl8yksek7fHXzWkNOY=;
 b=vucacSuJKnJRpZAqPDbiajoqMYJ0tbMj0PiPb3QTqZcLF6b8T6BmyXA+coidyI6O+UiKQuLqgRSIcpP+zlDfNlY8+RetFNdv0/6u1pV8Fhf14HInxo9IcRc2yY9WZ8tnlZZASk+AUUxUbFTpRroqHpcPfn114Fqb2LdRVBJvvexrO1NrVOzrNiGv5NgsN1EupukDupB4IRtEj/WSHRO7+sA8OfzipWUFvs2A0e/b41wNuLm2O4//IEt+j5mPYOHrQV2nRC32GAVcBdOsjVFNvvj5AefpfMCTntORmJDeSasmqxE6fq26+nX2Knk9xHhEAvtEeUd8UVFr5LkOyyqtzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV6cM8BQYEzv4iwJevzAClz0zCl8yksek7fHXzWkNOY=;
 b=Y0dG0uaZZaCBaG7pZbVDPv3cIiBqmmakDsbLJo2cY+GzRwXDirAuGwMfJDIGPplYEk9lWRI1lyoFAQVUFk74YONjtIs0JrLIEeiUoEX2/MNW4TaO1R7PMV5UG1d/5E+ffl4cWQJUOV5BvEesYtSmaE2LELMmD4OLmKxn8pr4NcRM6dRoWK/rKQp0CEvos0BVn1XdVvcJb+4LC2seQFdV4Yisp/h1wgjfsV1TkiUEgiY6vKmz1EL25oD+fFv1RdWp9tXNxgEgEYbqOk864BrbcH2JXkSP+7c2+6fN0Z0pMTY/hs+cIVZMuVJSZPcVQ8Nd11HF+ExVaGuM9RGU5Y3veg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB5648.namprd12.prod.outlook.com (2603:10b6:510:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 18:44:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 18:44:02 +0000
Message-ID: <32bf7633-69fe-4818-b5e3-7ec094d74e5d@nvidia.com>
Date: Wed, 7 Jan 2026 13:44:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update email address for Joel Fernandes
To: Steven Rostedt <rostedt@goodmis.org>
References: <c5c5c0a4-249f-41b0-b5f1-87a58514b120@nvidia.com>
 <8822A0A5-CD4C-403A-A001-F4E7A351D81B@joelfernandes.org>
 <CANiq72mUCGL3f=GAYSZfMV1=NXpOjz4vsV7B3Pd-=EG8tmWC_A@mail.gmail.com>
 <39e74621-aba6-47eb-9935-0d2321c56d6d@nvidia.com>
 <20260107123159.7ac61d69@gandalf.local.home>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260107123159.7ac61d69@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0021.namprd22.prod.outlook.com
 (2603:10b6:208:238::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a54854-fcf0-43e8-21dd-08de4e1cba11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZU5penNJUWNwQVY5RUoyVzdlRWZBc05XRExoeFB5c043Y0dUeW5ld1N2RGNP?=
 =?utf-8?B?ZGpQTFJqUDVIY3FRTTY0c2VKN3kwbTcweEIrRWxaeW85TW44YjdqK0s3OEJw?=
 =?utf-8?B?cVBLaHBCZlFDb0xMb2lQT2NqK2tPNjdEcEkzMk54T3pUOWViTFFCSDQ3MnYr?=
 =?utf-8?B?N0JBb3pJWDlLWUpBTHNRSHpMVkpIQmgzeEp3clRUSjVhWDZPUDk3aWdjTnRt?=
 =?utf-8?B?YnJtczRZK2tIL3p6aUNlZUk0TG9pdWdaMitkUm8xMGcyVDVPakNpWkNlTjNm?=
 =?utf-8?B?YmRMUnM5NHZYdXRjVWFPa0ZKVmJBMENONnlCbTYrZVNjdjFvNlRuYjFuVXp0?=
 =?utf-8?B?ekd4NlV6dFBLbTlTTDlIUTlCRVNuaitTaGtMc0ZGMzJYNG9BNjFrU0VVQlZv?=
 =?utf-8?B?cWxvYWY5MExwMm9ZTGNBalhVM2YvQ2NpYU9URjVtTGUxRW8xUXhPVlJKN1dF?=
 =?utf-8?B?VWI0aXcrSDlzbUI5LzlpNTBzY3VjK1RyM2FEUDZCdk9VS1AxRE43TVJwRmd1?=
 =?utf-8?B?dVgwY01RcCs5TUdzZmk2ajdVd1FQZ1R3eFE1TERVUlJ0NHhoaE9ha1p1OVU0?=
 =?utf-8?B?alBZNnFhTUNxc0pnZWFBODB2QnlxbEZHa2NBcVZMSEZadHcrT0Z5TUFjNURL?=
 =?utf-8?B?S25OMkV2dHNrYkx4a05nQ2Nvd2tKMUt6QW56M1VoU1JDSXowZXRROVlmcE1a?=
 =?utf-8?B?UFB4dlAzM2NteE5wODNpL2FGM0xrTGZqdURMNytpbUhaN1Q5VWpBU1FnWEtV?=
 =?utf-8?B?ZUdiTlhiVTlmelBsdE9ibmcvN3Mrb1dzM3ZIQkNpbEVrVFVxQTV6emo0S3hS?=
 =?utf-8?B?SXJZTVFBdDgvbkFaTnB3WlhiWEY0RXVZL0tnL3Jtc01VUXYyL1dqN1BTcUJX?=
 =?utf-8?B?WkMvNk1kQWJ0ZzNQRU1PcHRsa3c2K0hsUzFZTnR1TlJUSGdFZ0pWV1RhZ1V4?=
 =?utf-8?B?RnYrVzNJNUQya21DTFJGVFk3bjhFdTNvTGVoQnVMS21pUlpUUWUrVnZsdzNh?=
 =?utf-8?B?YWtscEcyVkJiZjU0MnFMOGtSUGVMRDZ5TVJ5Z1Y1OVFlUExqbmo2cldpRFRx?=
 =?utf-8?B?QjRDYWt2eG1QYkpwTXJHMS9YTXhwVmJ6WmNKTU5abW5jYmQ0ZllLd05IVnhZ?=
 =?utf-8?B?MDVWMEdveERvOHE3TWFlYkI2ZnBTQWhOdjVSV2MrQnNpRmVXQ1NuVkhoQ244?=
 =?utf-8?B?Sit3Q1VDTStBUFBhK3lySXQrWDg4OW4yY3pHd0lLTy95SU5LVzFMRXdaT1Rk?=
 =?utf-8?B?bGQvTnBoeGZZN3lWTXBwK1JYOFJSTlYzZGpIbndTV29LdWhBcjhjbkR5VHl6?=
 =?utf-8?B?ZmdEd1BtSTRNL3RiWDBaekVwVUVSbng1K0FJK3cwazUvU0FLbTdmZE5WM2NL?=
 =?utf-8?B?UEg2SnNJSTZkMk5VQ01JaXd2Vlh2MUMyaGpPbW01bWZtYkxWbm94V3F3TVNP?=
 =?utf-8?B?WGg4ek1iT2pLbDZTNHV4ZUpJWXlVRmNsdXhTUDZYdS92bHg1RCtUeHJoRTZI?=
 =?utf-8?B?S096eEtKbkplek9BNWVoVVZYYlRDNkh6cE5PUDhhM2pkVGRtR0lKRzRTM2ZH?=
 =?utf-8?B?bmQrdVhHbXFYRzF0K0RzQ3ZINFhYcitIQitXN3BUbjZPN1NOem10c3ZDbk94?=
 =?utf-8?B?QmxYZkU1MDBKa3A4NG5JZDh0ekJORm0yVnU2c3UvbU9JU0JFalVOdDkzVTlI?=
 =?utf-8?B?QnExRG1yRWtpSk5BTWp0cHFWRG1vSFVPczgwcHFZOWlENVAyRm94enZYRSs0?=
 =?utf-8?B?RnZzMlFMZzlYS0RPZENRUFZFdTdzWmV2L0xtY3g5MGlmMXFLTmN2WUg3eVFk?=
 =?utf-8?B?N0NQbVA1Z3A3TCtjaGk4d0ZlYWhlR0hsdXEzd3RSRHNYWloxYTBrTlB2d0VT?=
 =?utf-8?B?T0pNUDNaUXl0UkJubnpVeEVHbzFibld6Y0ZJZUxFZ0IvNkQzRXdtS3MxUXla?=
 =?utf-8?Q?/6B54mCXVx5X2aiip11d9SDyXm57KSU+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2xtY0tWM201ckgzdEN0bXFQeERiL2ZES3VaV09QS3RxamNTaGRNdFVaeHZ4?=
 =?utf-8?B?UDl6ZHdLa3JCcHVFSWpRTFkwNXAvcEpHMEdXRUNIWklUcVhSaHZWZll2MXZj?=
 =?utf-8?B?ZVFLRE9WbjlpS3dSbUVzTEFFWERWWWJLdHdsVVpKcndZWHlFVUhQZDZUT0Rl?=
 =?utf-8?B?dEJYcEI2cXVIOWovQkNJM1BKNVROR1YwdnVldWk1S1hJRUZBNW96L1puQVU5?=
 =?utf-8?B?OFhKcUdDemo1bWVkVVdtSjFPYXUxWGt0NHJNay91TVQ2NUorRDhYTE0wbStm?=
 =?utf-8?B?TVg1QUNyRkRodkh1WVRYcjVDY1NqR1ozdmlpTFBFUkFuVlh3c2VEUnNGbisy?=
 =?utf-8?B?dEl5YnNQRC9DRTNIOC95c05xbURVTUI0RklkMS9QTUIyMGFseG9xZ3ZHZG8z?=
 =?utf-8?B?MVhMQXV6MmNWdzNXYkdEWEV6N1lLM05mYTVCbGhmck91QzhuNmdsbk9CbU5J?=
 =?utf-8?B?MUd0QmJTTVhzQXNHYVJWU0p6UDNWUUoyYzhTOWJwb0pENitidXJJKzBXanhW?=
 =?utf-8?B?L2NsM0FiRXhLKzZKQm5YbVdNQzBNZmluTCs5U2NFbGNJeXJUZm1Sc3FwKzIz?=
 =?utf-8?B?TmFYdkI1eWJ6VWlybjBzdlE4UjdBTFZBa2d6Z2hiZW93eG9ROW9tVVV1MEdu?=
 =?utf-8?B?Sjk3emNkRER3LzNua21XTm1WNEdvNmNVby9LZTRFSGJPRlVnTXRYY3BXTVRl?=
 =?utf-8?B?R0xvT21KM2o1elNYRWo4N3B0cmRoRStLa3ZBTGNqQUFGeHVNbk9ZcEN6T0RN?=
 =?utf-8?B?S25ZNys1b3gvR29DU2ZSRmd0ZFRxd0gzZi9pZTlkbDJ2S1dVdDk1RkkvRkpy?=
 =?utf-8?B?RzZUR3ViS3FwQldIb3JDM3N4eDFIV1BjY3JTRytma3hlc3h0Y3MrU2w3WFhI?=
 =?utf-8?B?bXYvVjh3YUVOSUZPUUFtK1ErUGdJN0thY2ExTHFLRnRKcXpvRytDRFBWbVE3?=
 =?utf-8?B?YnAxL21ta3ZCQUV1Y2VmSytoMFZFWlBwUVpaNUxvZytCOWtxM2tGODBRMUh3?=
 =?utf-8?B?SzN1UDhVSzNzWGJlQ3czWGZhcUlHRjNIVFZHYzljTzlkNmV2WmhZZGpCQmhr?=
 =?utf-8?B?eCtvUFhRTXQ0bTN1Q1lTNGxwMlV2YzhPekgrQ3FVRFdJTTlhY2wvQTBPc1Vp?=
 =?utf-8?B?Q01vVllFRGNzdXYvZm1CVEsxUlhlMkc0TVdoaVoxQXdVaW5WaVIwNjhjcXZ1?=
 =?utf-8?B?b1cyS3NGMGRTQnJzS3RsbTZoUFEzMjFIUkN0dCtiWlAzUjIxYXB1ODk0Wmp2?=
 =?utf-8?B?V0dmdXV6K1hmOXpLeUlnOGJqVjZwMXpQNGE3ZFc3bWhRUU5ZcFFaZ3hCM2Fw?=
 =?utf-8?B?VldDUFpZaHMyZ3hTTVJ6WnVyV09QQm5xNGdDSEYySmdZd2t2VjdUdTY0eEFI?=
 =?utf-8?B?OElpRkljL3Nta2hRQUNtNWg0K2g2eW5GMkhFM3NiMWdQYWpYb01JSnBDWXd5?=
 =?utf-8?B?clYyR1lOeVpPcnRmU0ltSTNQNVByeE9EckVoSHY4VHJubGhYV2xpTWRhN3hx?=
 =?utf-8?B?aXJnclJhdzBOTzJSNkl6SEJheFZoUjRqUHZkOXIwSVlSTEo5ZFVwRXlxQ3Y5?=
 =?utf-8?B?dmFPU2wwbGhNYjlDdk8wNDRLWkpPckJNQUNSRTBJbXBhVThxbTZ3cEV4MHFk?=
 =?utf-8?B?VmtMcHNoM04rZGJlU3hic2FXa0MzVnBpNnd0RzV6YmFPbWg5TkgzUXBYK25o?=
 =?utf-8?B?RTk4ckhyVEhQUlpJYTFUU0YzOTM3TnNvUkpEYitKUU1aQUtrZXhURm5JNmFQ?=
 =?utf-8?B?UGsyU0wydks4ajErUW1idEtrUG5UQmZHc010alJ6TnQwYUhUNmliVHhXOEUy?=
 =?utf-8?B?SnN5bDI4bGFhaVAzZHh4bUhWMXhEZ2FQUjdvR2Yrb0M2dWFUWEhvM05QL05l?=
 =?utf-8?B?Mi9uQk5RZmpxcHI1K2QwZnNRb1lKOUV4K0p1SkdpanN4TVZQdnh5cWZ3MzFx?=
 =?utf-8?B?dnBSbFFyVTV6QjNocm1TWEppcG55MWEvYWdoMHNESERWMTRIcWRIU243cmd0?=
 =?utf-8?B?T2FoZG9VYmRZZ2dYZWZER0NQcnVENVZLTUhuVlc5TmwvRU1YVVNIamhGbWtl?=
 =?utf-8?B?L241T1k5N1M0RldxUmFQbzdUZGhYSFEyZUhTR0ZSMCtpcUhLdXREcTM0UmF1?=
 =?utf-8?B?a05USlkrMS84YTU1dGtFNUVjdHpCbmkrNkx5Nkx1WWJTbDlJTHg1ZnczTmJD?=
 =?utf-8?B?UFJxbnlZa2dHcGlzUWkyQTNqZUd5Wm92dEhhek43ZFVyT091dWlrOXlEWHQ1?=
 =?utf-8?B?T3VkN2NxMmFvZm5TOEE2QjlndERwMkQ2dXFjNktRRjJmY3FVcHdJMk16M0M1?=
 =?utf-8?B?OTBTb2hCQmFSWStCLzIyYWpHSWx0YmhCNzA4ZnNuSVhVKzl0ejFodz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42a54854-fcf0-43e8-21dd-08de4e1cba11
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 18:44:02.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ePVt0BWP1KvLJ2ZqryVgJU16fgtIeycSKhhrKE/vrqpqcm2bHNR2JPh8VSIU5uuFKzfI8aYatNrH+JELN89VzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5648
Message-ID-Hash: VTYCEPYQGDBF5FI4ZL6MJ5Y4IHMAWZ62
X-Message-ID-Hash: VTYCEPYQGDBF5FI4ZL6MJ5Y4IHMAWZ62
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, rust-for-linux <rust-for-linux@vger.kernel.org>,
 nouveau@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Paul E McKenney <paulmck@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 rostedt@google.com, Yury Norov <yury.norov@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VTYCEPYQGDBF5FI4ZL6MJ5Y4IHMAWZ62/>
Archived-At: 
 <https://lore.freedesktop.org/32bf7633-69fe-4818-b5e3-7ec094d74e5d@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 1/7/2026 12:31 PM, Steven Rostedt wrote:
> On Wed, 7 Jan 2026 12:20:42 -0500
> Joel Fernandes <joelagnelf@nvidia.com> wrote:
> 
>> Thank you for the suggestion! Unfortunately, that would hide the company
>> attribution too. Or require it to be in brackets along with the name. There
>> appears to be resistance to both these. I do feel fortunate to get company time
>> to work upstream, so, on this matter, I have to go with the company's
>> preferences.;-). There also appears to be significant progress now to resolve
>> the email issues which looks promising (thanks Jason, John and everyone for the
>> efforts!).
> 
> The one issue I have with people using (or being forced to use) their work
> email address is that people switch companies all the time. I find it very
> annoying when Cc's suddenly get bounced because it is going to the old
> company email address. Worse yet when the developer is still involved with
> the upstream community and now they are simply not getting email that they
> should be.

Perhaps the .mailmap file will help for that? Though I guess not everyone may
update it once they discontinue old email addresses.

>> Happy New Year! Thanks,
> 
> Happy New Year to you Joel!
> 

Thank you!

 - Joel

