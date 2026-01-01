Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D96CECCD7
	for <lists+nouveau@lfdr.de>; Thu, 01 Jan 2026 05:05:33 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC4C10E75B;
	Thu,  1 Jan 2026 04:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="urH1T1Le";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5472444C86;
	Thu,  1 Jan 2026 03:57:30 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767239850;
 b=S5c3IuMS5AstCxb6wljJDRwEj6A1UBewH04Ph9Jcn53T5EwYRaoFPNBBK1CKf3HMtvtId
 0SNKkHitvz3pFg5C63UC4RqjNeWHqxKRM5SKOuwzhiMTzZpTUaLKNOFzXCLtlusy5r3xMgP
 bJU6g+EsZlOT6iht1/WfHIhudLzI2FIkVDgVGbtqrVZmsL3oMZWqFZeD9yWaI4RHPJfBkjG
 l+1+0kzr2MK7c0tBnK1E7oMUcvZeAMzkQ2N0csPkm/0UTKnlJLuMJK7TT9nnfRfOnCq4UYI
 yOBofld+93ankbfri7xAKT5nbKe1E4pex5WofMaNKXD5uS3bnOP/2S0Y4Jdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767239850; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8CsB1W/gvSQocsuh9IDxmvITibRj4COX6O+mBpc2mMM=;
 b=GKUpJ15xLGH8s/Wruk/ivUJ6UXr7xAMbNdL3kdvpMp+lE504YXLG61BcHQITAEeSq3lrz
 KKzoLfxzGOouRGiJXRLjca1sOsFSHM3jaXU1LQbEfbzCgO4UEpwakgfGK/vXTxZOsOIbNGB
 KLmf9r0pE7l5+OtNH/CIQA8Cqj7jKaJy2dNaFKcqtcNKO/IjVxW38ZB7cjMyGtC8TvUZDYM
 DAewQRzAr3WQPtvzTOaJtyCtYqvqnRHTgfAxcK7zCy6xI9SSGz5EnfK3yuqBxeLNPnvTCSx
 9WaiLKtGoB9nPdaPgsJjLWIotmNsz4K14oYIo92/ExgBjGspC+aMnGqYkKCg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0A85344C5B
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 03:57:27 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D4E4610E4DA
	for <nouveau@lists.freedesktop.org>; Thu,  1 Jan 2026 04:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMlmo6JYvSDzz/ETiEyfCG3Dvd/cwLI3mRoRuERKgz9OzdgkLtxO8Ff6uJOfiasyVfwiKLhoEdb6HoCKkWeYXghsJ8BWy76kGb81E9J2nP/HYP708mlEjstvAcnDXcAiAGzHqhUZ53WStV16HqrbeKJW20soksJOErGpe6Poyr7aT4NL427AZcvkXMP9+7TWJKS5cPFrOi5tyezYB4Yg7VWys7UMdnjTfxl8j3PYjvylaoQydX0qfwArL+ySVqHssin6S+HIfj7ToguCrTPn/U0rbI1MC9OpCiumlaAOEODVGSKpQuA97vflFIQLMjfJYTvBDsyv6X58ZOjhdoQnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2ZbsmsdkoKAD93PAvkIETi/FxQa3Kv6ZBAU1JOTt2Y=;
 b=Jo+Zcyx1BmKT3E0fb8y9bEoUn33l/6CIDhAtdOLBRdvpJJoe9eaZqbtBu2I3Qb6eeebU/D8gbnK9xXj6wsDkupiZfM/XBQlpt5Jqh5ceOCiv5OkwZS8vyn7GUZlaSE2Go1nwKsPnghfuPpbGGo7bnSJ4q/OTtXTnFtcQ++gkEkPtGA89n+RBOKukxxNJMMMNd0lKmPLDqyBQ3krdql5wOE2b8SVzlbRnQViYUw9pmokD/XbWY9BuYlkDyoKAzQ29+BlUdZda5aODeV4aNmVfX6dtcSq8NgOjLlBSb40L54NwLYlvn6+c6KV0wEN/U/c7Y35CwZClwT/BuHXNUjkquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2ZbsmsdkoKAD93PAvkIETi/FxQa3Kv6ZBAU1JOTt2Y=;
 b=urH1T1Le+hik6nx0x2ZKKxCmCcQFEpIvT6HvE61AmffGVmg7lWCs7Edk6MQUmYMGU/eGG5GNq6v1nIbPHvwxb9C+EZA5gsGF4K2EMIwn3rlZr8KleGgjeMh4sOYyyDCoLPznpMeAtITvo46Wci/3EJ1WUbrdcShQYGCAwi8Rgl2mi/sa3als/pWrg1Bs5j/1K5XXuJI0vZoqY1dX7U7vIRHEC99YwYNwlWzcfLju+TxG/1nTo9FN4EXmZdcCa6stGgcv85bOSrPMv5IGzN+xHW90jNkuClyweQtUb37SghfZ1o1T84JNf7ZcFADXaBfKP+92cOpw4y3kf6+iGLVCnQ==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH1PPF84B7B0C96.namprd12.prod.outlook.com (2603:10b6:61f:fc00::618) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 04:05:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 04:05:24 +0000
Message-ID: <4482eb34-0961-4b40-868f-77dc001d98e8@nvidia.com>
Date: Wed, 31 Dec 2025 23:05:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
To: John Hubbard <jhubbard@nvidia.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
 <9db27bd6015ccebaa20e51450d8c42eb2864cb2e.camel@nvidia.com>
 <ec3e5da4-f944-4526-a339-3da8286c36d2@nvidia.com>
 <CE6A313F-9DF3-4944-A5AE-F26464D89C17@nvidia.com>
 <e1d4a5ca-d425-42e9-9e05-4dd09980dcc5@nvidia.com>
 <efec6ee0-9287-4375-b535-5c50cb218eca@nvidia.com>
 <d1a8fab7-f405-4b4e-84f9-8057c25c5ee3@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <d1a8fab7-f405-4b4e-84f9-8057c25c5ee3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:208:23a::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH1PPF84B7B0C96:EE_
X-MS-Office365-Filtering-Correlation-Id: 744107a9-cccc-454b-7189-08de48eafd32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UklpbkE2NE82OFdsU3NiWmVvLzl3Y0x4WHpDL0o4UEZSTXZ0VFJOOWZJbjhP?=
 =?utf-8?B?S2t0RDM2T2pRRzhpeDlJZ1Q2RHYxTzYzWVVtTitweEExWjZTdSt1Yk52c2tV?=
 =?utf-8?B?R2F5OHZ0WVJzQ2ZUdTVReWk4TkMyazNDZlNRY21tQnN0bjQ0dDJmcXpCN0tp?=
 =?utf-8?B?RjlxR2laWGJaaDhsMXo3ZndHUkNXQksrc21GdHJoSHNtQUx1c2UrOE1QemRr?=
 =?utf-8?B?dnlaMmx1VlA4YXZPS0R0T1VuTTNVTkE1emowYytjUnZONDgwRkNUckZJUFMv?=
 =?utf-8?B?dy8xeW54eS9vVnFMTUVPdW5NdGpJeDU1QUFTSm9IV3BpTzdXK04wekxJL0h6?=
 =?utf-8?B?VjV4WUlKQmxZOHFpeWU0N0NIMStCdmZ0V05LbDgwajh6a0dXUEtTdkFYbG9t?=
 =?utf-8?B?Rm1nLzhveTkzMFFHSTJpYmp3SVRBcVdLbDBBOGpjWldSd3RjNzZhK1ZLUTJa?=
 =?utf-8?B?ZnoxVmJQd05CMWxNOU1NaUlKZUxJcllVV3YxS1lIUDRSMjNUSjlXN1NKd0Fx?=
 =?utf-8?B?VmlXWE9ReTUvRk0yMzNOYysrbjFRNHFlZnh2WUczZEZEbTFZZHhJVDF6a21E?=
 =?utf-8?B?bFk1ODAxOXBaUGVZc2RONFpNTG5WWkNxN3dqNEJQNWNpejVMdGVoU2VaTFFM?=
 =?utf-8?B?VG9xL2w3a3ZNakFCWUxaZzU5VUJ0bkNZdU03VGgrMTBuczdFcEltWmw2MEJG?=
 =?utf-8?B?UkZEVlJHbVJBd1h5NEcvSUs5dFFRSjVYRUUwQ0tqckNFRDdnMTE0WUltT2Nx?=
 =?utf-8?B?anhTNFBEdEJCS1poUVRtN29XY0NTd3NpSFZtSTdtNDc5c09KNWQ5SGxlVHVq?=
 =?utf-8?B?bEtUVWROaFl0WkJ6dmk5OG1uQXVyQm9MbHRkREI2L2c4K1RiOHlNcGc5YmJD?=
 =?utf-8?B?VVQzWjY0Qm0vcFd5Skhqcm9SbHpmQXFrSklJdE1RR1Y1WmN6QS9BWTYrZXFk?=
 =?utf-8?B?ZW9qejBkNkhHZVU2UUN6dFprNDNEcSt0YW1tZHFaS3ZCWjIrZkIwc1kwN2dr?=
 =?utf-8?B?TjJuR3A1dTRBYjNkQVEzQjJhSzlYdG1maS9PQkRIL1dCd2Z2cjdYVFovMGhP?=
 =?utf-8?B?YWNTdm5CNUtvU2lzSmttaVVqTURFV1B6bVJKdnVuVFpyUWovUzBHYkdrdDVE?=
 =?utf-8?B?ODRRQTJjeTRJL2hQdzczNDRuOC82eDlRZjMyVXJHRllBbjRGZlRZQlRkTHk1?=
 =?utf-8?B?cDN4Z25ZNUJPVEtEeTNoanVjc1NmdGJQRXNLUEJOQ0J4Mnc0UFBweXF0b1BR?=
 =?utf-8?B?aWFPUWZtem82dzZSNC9vL2gzZmVyU0Y5V2VvVlcxdUswU000cnZzMTFYcTZ5?=
 =?utf-8?B?Uyt2SHdZUGR5UnZKWnVQanA4OFVpRlZPdEZSNUJvM2RMT1Y0dWFZU0RnMlhl?=
 =?utf-8?B?TUNaeFhkcndkL0FqUlMvS2RzY1N4ZXFUWFFMSDVjY2pLQVFPaTMrUExDS1Rw?=
 =?utf-8?B?L0tUNGpSMFZFNXh3dXJmT2tueEx6ZHZPWnJZVXRYZzJDMU1JZnp2dzhPYnNV?=
 =?utf-8?B?a3MvQXBWdjZNNGhIWDhTTVlyRExXT1BTUnUyNDJoTjVseU56MVJyaVFTYWkx?=
 =?utf-8?B?Nm8ycU9qelczMVliUDlEekpTYVBwMmNJYXdhRzBUcS90bG9rU2xXN2o5U0JJ?=
 =?utf-8?B?T0xZcWRCUFZiQmsrZm1JQ0pEZlpjemFyTUp3TGhCNnJTbWlCejF6V1diTjUy?=
 =?utf-8?B?MU1QOEVmbHh6NmRRcEI0QnFQU2oxSk1lSWpjd28vaFV4UWRCVkd1K1JSbXJX?=
 =?utf-8?B?L01hVTJJckxvcldobGJkajc0cWlORXNUR0RQb09ORkxpMllNbFlDMXd3RzdJ?=
 =?utf-8?B?bTgzdE03SUNXeGJiNUlCVTkvaytCdlNiNUtTb2s3MmxXMUVadnhxaElTUVZt?=
 =?utf-8?B?N3k5a01NejdnMVBlTDlSNFRHcklOV1JJb0VJN1dWRFkvaWd6S0lXOFpLZ3hi?=
 =?utf-8?Q?va0mWzR2FT6y13T1j1wVFn2f7sr9u2M2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEF4eDkyQ1d0SHhJaktGc2tYN29kVU5PL0R5WDlqS3hQTFFIeURZdjV5OUNH?=
 =?utf-8?B?RWN1MG1rN3RLQVY2b0trVFI0MmZFMTR3S213U3plc3BObWFISXRCTHF3RVBv?=
 =?utf-8?B?WmdHMWJURlorcE9EdnJTbFBhZzRDTFFDZHhXSEdicWpISHh3Rm1xdzcxb0tC?=
 =?utf-8?B?U1pFZkZjUXVoazU2dERaSXpCRW1kejFRajQ5bTkvaEp6V2ZGbDJmL21pa1Bh?=
 =?utf-8?B?U0x4bU8rbmdMNElyNFVEK3drYlkvWDB5dS9aRHVjN1VML1Q1cGd6VU9CMmk4?=
 =?utf-8?B?cDJXRmlTYXhmd2hhWGZzNUVNVDAzZlBxL2tDWUtpeGZUdHFNa3JkL094VHBW?=
 =?utf-8?B?YXlrdXdXUDZuaFdjcWVONUQ4NTRlWUd2R1pZMEc5YWdnbk1QV0tWR21vbGpG?=
 =?utf-8?B?WmdnbXU4V2k4WkNJZERCVUdBR3U4TWlhUEhmcDVBRGxvbGMxRkc2ZUNxMG9W?=
 =?utf-8?B?a2x0RFVnU1FkbE5iSXIzTzZPd0g1ZnJGdGlIdHFHb3lqWll3QmdpTmoyZTBZ?=
 =?utf-8?B?dmpCNlRDT3ppK3hrZDZFRk5QeDl4ZlRXSC92VHI2MmRENXZvNEpXRld6SVkw?=
 =?utf-8?B?eVdsbnZvcytaNHVVSnpmVWVKcWJHeUR3L3NKUytkeWZEQnA3Y3I4bmxGdERl?=
 =?utf-8?B?ZmE3blNzNHgvWUJyVnVNazRyTWlnbk4xc3dPbXVTK2FHd21qMzZrVjJUREwz?=
 =?utf-8?B?T0M4U2F1Y0tiUEhOZmdHMHJtV1BFYXNocnRLQUNvUkorVzFnSVNWSVUyOXJC?=
 =?utf-8?B?YzRmKzFwL3VYMjhqVmxtT2d6MEl2WExZdmFaRmhXZ2Q4WkN0bGZnMTN5ZlAv?=
 =?utf-8?B?azlhZnh3clpZMmcyUUlnSithSmluYlFMODBQVlpiNkRTbVRYZzJ6cmxqRWRz?=
 =?utf-8?B?RHBnb0cyRG4vZS9ZOTNnN3hyT0phNXlrTWl2N1ZFQXlnaFZGb0F6c2ZaVTVC?=
 =?utf-8?B?Wm1hWVFOSGs1Y3ZFbDRyTnlJanZNaDE3UDBUVk4yWEp1SU4xTHRmSkJxM1Q3?=
 =?utf-8?B?TUZpd0ZNME9NVVh0MUZEbmpBMDhVWjZxL2wvYUtWN0Y3ZlpUbU12UUI0SjlY?=
 =?utf-8?B?Y2RORjBtbWhYV041aXBNWGpBMi9ydUhBL29HSmsrRkR6R0N3c1dpZHFIODk3?=
 =?utf-8?B?MFRjbE9hMk5FczQvTlZJZk84a2YyMWM1NGV4a1J0VnhEbUF0NzU5MkcvT0ZH?=
 =?utf-8?B?Rm5HK0dvU3B4NlpvOUEzazVWTUlmdlBKWDBrOEZudUpodmhZQWwrbnVIMVZH?=
 =?utf-8?B?a0hqRU4ySWwwSENENkR5M3phb0FkRVNVK0pDLy93V0YyTFUwRlpCY0FLM2dQ?=
 =?utf-8?B?dnpENm9DRmRobU1VZHVaSXVQeWZrU0NiR0JndHlwOTB5YTZicUk3a0tsdzVK?=
 =?utf-8?B?cWxaVUFOQTFBRGk0SEdoN2NzcC96OUxmdzdkbnFMSVYzY2FUampPMGJUa1NJ?=
 =?utf-8?B?a1o3YlJTSEFDc0g5ZHNHVzl5K1BUUExRcDl1aXlYQTdKSENtbGpCSkt2eExW?=
 =?utf-8?B?Z1BEZ09ENGwwSXk0Zlh1SFRYb1JwQnZBZTZaOS85eWJQbExvWnVOdXdqUDU0?=
 =?utf-8?B?ZFV6UG11N2kwRWc5aWwwTUkxWUI0RHE0cXZteks0enoyT2J6bnorUzBzeU10?=
 =?utf-8?B?TzVSM3E4ZjJKTGU3cjZHb2ZjLzZWY1FPRWcxODZKUW84bG9DRURQejFLV0Z1?=
 =?utf-8?B?UnpEcGt2OUlsYWh1ZzNhNkJ2d1dBSnNDM3BobDROd1ZkbkwxNkdBNUN1OWw5?=
 =?utf-8?B?dm5HaGgzYW9VMnlHUHNhTkxCK3hjRGFsQkxjOStUbUZoL2FzL3hXQ3lJWlg1?=
 =?utf-8?B?ZUFrVmpvUTIxeG1Ha1FacWtIZ2JPaUMxT1hEcGlsU3RFVXdQbTJZbHphWWxM?=
 =?utf-8?B?WDN2R3BWTFJxeDg0VjFGSmhCWlI5SjVDRFJzYWcrb3B2cHBQcnY3Rk9sUk5N?=
 =?utf-8?B?OVBwRkIyTksxR2l2QzBDVmhySW5TcDFYWXVET2xoTnlNWE1CQWJiUk9OMHdj?=
 =?utf-8?B?eDRuUGUyMlE2WVRyakZLOTE0L3NQcms4M29EZkIwNkhKZ0VESHJJMzAyZzZq?=
 =?utf-8?B?Y2w3WGYzRjVmaTYxOTlFUnZBRzZ5NXBlYUdmY1Y1dk9DSG92RWdCWTdsVkNK?=
 =?utf-8?B?RndZbk1qR09oeEJJSXBrUUJxbUVONGtjaEtrbm41UmFtS2J6NmdtYkJZdWZn?=
 =?utf-8?B?NExjRWJjbnQ5Tk9jeUVpcnRFZHBzZkRjcDIvdlhQVDlmcjBWQlducmI4b3I0?=
 =?utf-8?B?amdSdXhCNEJGSld4dUw2ZS9NQnFsUHpjd1RYendIallDL2FCcDdWK0l6MUQ1?=
 =?utf-8?B?VXJNdjR2TTVqRkQ4T2JTeDl2akM1TnNUc1ZFaXJCUXROOVdmckZEUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 744107a9-cccc-454b-7189-08de48eafd32
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 04:05:24.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TTIAhdzx6CCd1hCHDaxXXZc4s3iARYHM8bkvDl4Ln2nZtKdtrvmNQjClDjgMccsNldV+slLiNf+O7ahl0ocuBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF84B7B0C96
Message-ID-Hash: ZZP42FVBZUM3VW6XNNUVI2DGXLYSPP5D
X-Message-ID-Hash: ZZP42FVBZUM3VW6XNNUVI2DGXLYSPP5D
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZZP42FVBZUM3VW6XNNUVI2DGXLYSPP5D/>
Archived-At: 
 <https://lore.freedesktop.org/4482eb34-0961-4b40-868f-77dc001d98e8@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi John,

On 12/31/2025 9:52 PM, John Hubbard wrote:
[..]
>>> But this really is fake chaining, because there are no Results involved.
>>> It's not buying us anything except a bit of indirection and cognitive
>>> load for the reader.
>>
>> Chaining is not really only about error propagation. Builder pattern can be used
>> for other cases too, like passing a setter chained expression to a function
>> argument for better clarity, I was planning to do that for the sequencer for
>> instance since there's a lot of parameters passed to it.
> 
> Let's see if that has any use for this.
> 
> So far, though, in the code base that we have today, there is absolutely
> zero benefit. The diffs here prove it.
> 

>From your patch diff, I see the lines of code increased. But that's not even the
main issue I have with it (though IMO the chaining is more readable..).

>> But in this case, I am actually absolutely opposed against this, it makes the
>> API hard to use because now how do you differentiate between an IO function call
>> versus something that just mutates memory? Is set() an IO or write()?
> 
> That's a completely separate, pre-existing issue with the API.

Nope. With chaining we clearly know that the final operation is a write().

For instance, you cannot do:
  reg.set_foo()
     .write()
     .set_bar()

That wont compile. You cannot intermingle write() with set_XX() because write()
doesn't return anything that can be chained with. The builder pattern is typically:
  obj.set_something()
     .set_something()
     .do_some_action()

The 'set' can also be 'with' from what I've seen, whatever. The point is the
last thing is the action. IMO very readable and simple. I know that the write()
will be what ends up doing the I/O. It is one entity that culminates in the write().

> 
>>
>>       reg.set_foo(x);   // no IO
>>       reg.set_sec(y);
>>       reg.write(bar);   // IO.
>>
>> So no thank you, I quite dislike it. :)
>>
>> Instead with chaining, we can just rely on the last part of the chain concluding
>> in a write() with the intermediaries just mutating memory.
> 
> Same as above, just a more happy-happy chaining interface, but the same
> function calls must be made in the same order.

No, you cannot place write() anywhere except at the end of the chain - the type
system enforces this since write() returns ().

thanks,

 - Joel


