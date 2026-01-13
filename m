Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ADFD191DA
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 14:36:08 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 893D110E4DE;
	Tue, 13 Jan 2026 13:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="SKu9Ue5L";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AFD7A44CAC;
	Tue, 13 Jan 2026 13:27:37 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768310857;
 b=ZAaPSdG0Diwwn5pSAJ7dfY457xON/HnzDcQ2H3j9qmYdf8QCAtskNIRR9B0PSKo5QBX3f
 InH/Xv6rsA4gcbkC6EqBh2TVfLE2E9TQWlfFqcPxYpvR7BZfKfrdPoVC5O2xyV2M4oVml8Y
 2ypCW2nt/xUR+ZqEhwHxaRHOufWGJqrCHPmFpkxk5sw10gMIZEOvmRqqU8q9CD6y6Zg33PM
 pYPlfdnWuY7dczrY55YqTSiGjUI68MW4v5oI+obwUyHLGwWu3GKNLy2ktGdmC0HJkqET9fI
 xjloi5kg41gLs7YhYvtwr8XL+q74MsvIsUUJMYMJbo6wJdA6w67HAignNkmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768310857; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6jG3C0lXkmgYIxC9GkCBKjG/ZA7jn0pZThE4tCDNW+Q=;
 b=UlnkiXPILpsgC90hpUitQUccrzW5WOZIoQO2Q+mdOQdr+j+Shwrx1uLt0lv7WhpB7z280
 uTLsdOGmHJI19A1ItIM5udWRN0c3Cd+YzVKia8tudqTdd+cUfXJFLRFNPkaEcKClzOm2Qvs
 jatWMz0rADdS9t6qaT6vfhgPWJL3vT71HUUZiDHCMPDjl9ntUa24tQDpdvfuEGqkkWwX0i+
 BttEzUG4NEuknvXwjHIQ9jyFkPQscFFEnp6pVbtBPjnamIOOy0G0K/mJkHLoIVuvwqTvr3B
 gYldoc+MX9HPxnFzlUc69gs8EB2SKU31q9eef9rOlCYGQVes4ESxJk3NZEJg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5543844C83
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:27:35 +0000 (UTC)
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022115.outbound.protection.outlook.com [52.101.96.115])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC78A10E2A6
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 13:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZ2Az/KOAtIn36gre2VyMinoigaNWTkcxXZnxddIzJ7JEIxwRpiLGOqTcOhFAGWzp+bsBQ0gmZogqgvFjQ3F3sHjz5xuzof2h6oURdRWItrXkaR+TUXFhKSET443vwOCQQtSrlvBhrS0P3bP4v9d0o1/jhOc2PsCkCCIassYM4COJep/d4LcJuh9YJ5JuoB4HWpU5MrY8hWetRBKRDLUq53tLfHobq/o5inCobGLXYlMbPDg/Oi+rYXxq7cf2geh70OOF8zS4wOhvYtZ3SJQqQPPHwJYBxAm+0YyI5jmdrsnpJA3AAS2YyLsWaIaz2GZBsdHdYyYcd4UGnfMqpACJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jG3C0lXkmgYIxC9GkCBKjG/ZA7jn0pZThE4tCDNW+Q=;
 b=QZCSBkWwue6wltdoD4Sbov3dDrpLmqUH4RZU6IKUih0lKhN+ZjYVyxO254vWTnVcFsLCpjMOpagcrXMCUU1bET7Kfci2SbaO8/Rj0C+SdjeU/LJSlZUzYuDC+mQQJ1BNLG+ZvUksgvo9D2lAHCtGjA/YzDcx4nJAj+ZlVm+oOvROUv/L8SMQpkDcHzSbnjX2nPQCMpjSpKl/rN/sx/NWm0jsC38NswCMPFI8EogJ3oLT1SL9G0FE5c4SPZuigrfVtUjDQTAQdQcNUuPOPoS4YusD2mwDJ9tUb5quz8KogfvQOd/C0vnxmxOApWzqs0kEKOFgS3x8RX9CoJTnJ+XqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jG3C0lXkmgYIxC9GkCBKjG/ZA7jn0pZThE4tCDNW+Q=;
 b=SKu9Ue5LbGkCIfwd+cG1fXIl8A4vk1c8QxAzcdyLCgHdbweoBmEQEF5gctjof+b7MziifEs84JvBJJ9PjMyvDavn0uZQw+N7n8V20EyWXB+G3Sb4MOf5T/RVWbh9/SgY7OtiQpNU2pavXtIndk7B2nORaom1yqmIDRS3iSnsvRY=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3112.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:36:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:36:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 13:35:59 +0000
Message-Id: <DFNI283CU0R9.27OZOE5NJA2I5@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Subject: Re: [PATCH 06/31] gpu: nova-core: apply the one "use" item per line
 policy to commands.rs
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-7-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-7-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3112:EE_
X-MS-Office365-Filtering-Correlation-Id: 0182eb88-c171-477b-9269-08de52a8b0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDU3KzBMQ1NKRDQvNk96bEdNYmU3eGpxNTl3YzRSYmljbjJtWG5IVytIZUdD?=
 =?utf-8?B?T0lSdnVRR0Q4b3VONXpZT0psZEY4aEhVc1FZRGtVTjRCN0FXTnMwKzBRNmUv?=
 =?utf-8?B?R0w0ZFBzNjgzang3TGtNckxBSktnTVAxR0dvZVVaMzhxcHJ6d0dxYU1ialMy?=
 =?utf-8?B?dTNkQTF5TURteVhVY29WakhkYzF3b0R3MWdqUkcrV3hjaThtbXpyR29PTE9i?=
 =?utf-8?B?RnhpN3F6TlB0bS9FZndnYlp6UGhuMUdCRCtUeG5xY1crc2dxTCtrcmk4Tlp5?=
 =?utf-8?B?Sy9aaGt5NS9kOU84Q3pWbVZrQVQzbGV6NU1JcktzaEcyMWNvRzBaamd3aDFh?=
 =?utf-8?B?SjE2ekhPNkJUY2FuOE1FSHcwT2ZFRkFKcUpZQ1ZIN2htK2RRREdSQUZ2Slhp?=
 =?utf-8?B?VUlsVFg1OGpIV2FZbWhaZGxDYUNXSit0MUFwZThCRXIySzlpTjBTZjRMQ1pI?=
 =?utf-8?B?Wk1jMU9HYnlyWTlkYXBzVThIS2R3WnAxck5hMHpTeVpIbkVpa0Y5NU1tbnVw?=
 =?utf-8?B?em5mcmd2SG13a2hmQ2lsSDhNWmRxQkRrbVp4Z2lkckZyUFZMOXZpS2RkaE1B?=
 =?utf-8?B?VnFxM3NEbW1IQ2d2VHdJZVJnL0ZLRWRwOWR5eVZidWU0UzdFZE9LNDFCOENG?=
 =?utf-8?B?cytZUVVPRUhpamRqV1ZXV3dIUjlJVFJZdGpXWGV4ZGZxYUl6MW8rUlo4YnIx?=
 =?utf-8?B?T1lMaVc1NnMrZEJXVE5iRnFLOEpQNWJYQkNUSmdiaGQ3b3BDcHZMb0IrWktO?=
 =?utf-8?B?Y2NBZXNFa1pPbTRuN2N6VVptTllKUmV6ek9KblVOOFdGdXhmcXFraG5mRHRJ?=
 =?utf-8?B?OW8vUzQvVjBDNGpsT3B1VHJEdG9vTnNBcTltRDJKaUtEZS8zTVQvU25iMlUw?=
 =?utf-8?B?UXhaTjRkMXZSY2l4NnBJV1pFMkxNbjMrTitRbVprYVVOcHFlNFQya1RiekV4?=
 =?utf-8?B?eGU1dDllcUNRYkp3aGhnc1hXcWRsMWplNDR5OVJ1bzhBV3FDZTdvc1VrVGJo?=
 =?utf-8?B?V3BUc0RtZjhDbzh4N3Q1VnBFMEo2VXpuNHMxbkRXbWoxV0VvYWt4eWFpeGFo?=
 =?utf-8?B?QXJoZGszODJQVHh0NDhnVWxsK09VUWJNNXlOKzBpYU1aQ2pSVUpIV2RJUUZh?=
 =?utf-8?B?bS82allTSWFFbks0OVdLa3ZpTEpvYzQwUVBoQmRjQUs5ZTFFdzIzUW9samJq?=
 =?utf-8?B?TCt2a05uZHBQTHZDMkpiWWM2VFllNVlreWlpUFNGdGdaUEErb2R4LzlkcTR6?=
 =?utf-8?B?NEpDeE9sUHBoNW16YWxiWXFscStoVGx5MGtzM3h3T0NMSVg2eGcwRGdjTFF6?=
 =?utf-8?B?aTdWbUZqTit1RlZHVTRPZ2duVHlPRFp5SnFVOEVMNlROQ095UllHTkNpWFBL?=
 =?utf-8?B?NnhXbnRWMlpQUXRMUU8zUzlFWnVicWdSeStwQjRQMDRjRUt6NHdmdFk3Z2NH?=
 =?utf-8?B?K0MwU0VTWnpGNXV3SVJtMVp0aXdHOWxzb3VnejdkZEZ2YmVYL29NaUZSZzJz?=
 =?utf-8?B?WEFSNCtTK01vcGJHRkNkSkZFeEZhWU9JOXNGcndFSVBrM09BaXpHUTNCajhp?=
 =?utf-8?B?YUl2SS9JaWV6ODQxdjdybUZMbWpDWEt1U2dGYjNNTlJ3RkJtYzFwbXZHSkhD?=
 =?utf-8?B?VThmblZucW0xaE1zK0RmTjA1ZjRwM09DaXA4VEhVdWNEWmxUcGRlSmNaUmZ1?=
 =?utf-8?B?OHAxSnZHd2FzaTlNR1JtZVhHR2diZEEvOEpJZk5UM0ZDSGVZS3dTN3BTYzFj?=
 =?utf-8?B?QVFsY0dxTG94aXZxelZoejhCTXVNa0ZLMzBSRGdEV1lXMmxiME0xT014dTRp?=
 =?utf-8?B?aXBham1ZSjc4WGxSOWVIOFhRc0o0QjMvOWIzZGZGNGZ2UEhYQkRNdmNkVTNR?=
 =?utf-8?B?VE1QVnRXamUweDhWYWQwY0dWVWV3cWlHVWJXNU1VT1lERkV6bmJnWnI4cy8y?=
 =?utf-8?Q?5pPu6jbO6YriaxIvoQnT7/3F2lmgzQWY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aFRNU1dSVjIwYjZpMjdiNU5sUjZJUFJJeTFwWi9sR0dRVlhlK2N4QXp4YW1j?=
 =?utf-8?B?b1Z1UmFsbThpTGp6N1hSUUwra2NtdVV2VHM4UWo2QW9sMVA3RFJ2dHhvNGVh?=
 =?utf-8?B?aFRaWEtGcWhJYk9jWG15YjF0Ky9RZitjVU10ZWdwWVd2RjBnUGlXSmdOZDU0?=
 =?utf-8?B?VFNTSVVDZ3ZDZXdhN09xN2xsRHhwcXE2S0RmclFwR0VUL2k1SFlyMmhlWDNH?=
 =?utf-8?B?Z3JsdkZoU1ZHWjIzeGt3YXJyVEk0T0UvZWRmWis1emNxbzc4czJEZ3pzMlNX?=
 =?utf-8?B?NVZmQUUyK1JBTi9oQlhNVlJCV2plcjkyanY3NzBFREF2QUhBakVhS3BxK3Vx?=
 =?utf-8?B?NnhmTG1PaGZFVXFoWnNJNDQ4c3N2emVoLyt5OHJvRWFwZndBbmVZeDBPNlNa?=
 =?utf-8?B?OVE1U2sxeTlXRkpsTXBQUGlTc3BWbnorTHZuS2xJRXBscnpPUnFsaHh4eDlp?=
 =?utf-8?B?WVR3a29CNlY5anFqVVAyZlpMOWNKdVEzNU5BVkNwOTdzcW5acGVEUTk3VXZp?=
 =?utf-8?B?Y2VYNC9uMGd1b0ZsaUdNd00vcDRZaUl6aWVoUFpmdHpMQmM2TC9lNVJpSFBY?=
 =?utf-8?B?VGtGSFVSYkQ4bkVmbmFnVnJaaVJTTXFLc2RINXVtcGVWVEJaOUh6OEZWZlEv?=
 =?utf-8?B?QnJRYWtrSnFkaFcrVnQ1MUhjT1FxL3FkUURBSVFKMUtSUEVkSExrYndWZHZS?=
 =?utf-8?B?S25VTVo0eTk1Umh2ajR2RXh6WWxhb3VUVE9hWjZhNzZhZUlINUlLRFJQZWsy?=
 =?utf-8?B?c1F0WUg1bG5ZRVRiN0s5azVURjJqK0NEM0FXR1hLMGFSZTZaNElvTG5SaW56?=
 =?utf-8?B?VElYRVRLaG1QNnJPanR6SzdUVlZmZ2VFaGxWb2pheWRFZkc2OFFtZ0tFUGhJ?=
 =?utf-8?B?aElIS09mbjBBOUxQV21yY04rSzh0ejBrazFPVDlkSHU1dWxXNFFVMjUzaitz?=
 =?utf-8?B?cU5iR3JhK0dCbDMyVnVoUWFkb0pUZG1HTjIyamk2V0RLOUlNVDhNMURBUVNF?=
 =?utf-8?B?dkJjczVJWUR2bEJPblpTODlYbndya0NQQ3o3c3pxNGduY3ZXZHNzUnVxcXhJ?=
 =?utf-8?B?RC90a0lTYmdJZDRtZ2ZZN2lIWG5zRUlkamZSRFhrWWtIK0hNT0xDYitGVENB?=
 =?utf-8?B?L01BanVUakJrWitPR1RwU0VKZ00vTzB0Zkh1Z045RU9sclA4VDBkQlQvMGZZ?=
 =?utf-8?B?enhmTWRIWHFJb0pBNi9Qb1ltNEp4dHNOaUNsU3RFOFJBTHpSZ2JxVUJGWlFB?=
 =?utf-8?B?WlNiczZsNEh1QWJzeU1ndkVhNTBWalhVZlQxeVhnT0RtSm0yYkFNbXkwTWxT?=
 =?utf-8?B?RHFnWU1WK3dZYndwaTlqNndqTXlBZHZuaTlIcFE2cXBsMTFxRkRmeXNORUVE?=
 =?utf-8?B?Q3h6QjVnM2pxSW5kWDVWaUw2SzdsWU8wMEtjclNxeDQ1K2FhL2xtY2pRNjhm?=
 =?utf-8?B?elcyN0ZJdk1NUzZaZDdvKzN3K0xCUDhLayt1a2ZIOGNkNithOGh0bVhvL1Qz?=
 =?utf-8?B?SXB5NGliWmN3RFFjUzByb3dvYnNDYnhFTmtDRndOallpeElLNHlCVDlLZ1dj?=
 =?utf-8?B?elJuZjdFbUNUMHlaVmYvN2Q5QkZjY09pQlFLQmh2VVI4WFM0bUFwcml1dXFB?=
 =?utf-8?B?dTFvZjdGWU0vN1JIR1J5cmpPM3hkN2Y1UXRGSWJZcnFzZ0ZDalUxWDY1RnhN?=
 =?utf-8?B?bzYxUEs0eTVKejRNaVh3L1o0ZTN1OXg3QlN4RlQzQ1RoTXppdGs3NS9DZHpw?=
 =?utf-8?B?S2o1dGpEaS82L1YxVDRmY01zN1ZOTDRLOXZQTzNuWGdtK1pYcHhIcHR6NEp2?=
 =?utf-8?B?SnNXVExEaDlpZGhqODNscGV2ZzJpV0xDM0dmQzgvYWdqajJGUnphYmx0K09o?=
 =?utf-8?B?SmhHY3ErdTlydURHQnMxVUhHUTBPZGRUTUJyRHJ4dXlVU1lOQVl0S2Y4bUJC?=
 =?utf-8?B?WklHaHcvZ2xtTFZSa3YwcUtscDZwamNieVZ6Sm9IRit2emdjSzdndU55WWgx?=
 =?utf-8?B?YU4zQkRUa1A3dHp6SmRJS2s5ZmJ0TXhYTnZBcEV5bHZwVXBZWXZwMFZkK04r?=
 =?utf-8?B?LzVJTlltL3ROZ3lXQjU5K1NWL3VPVWswOXQwQklYMHRBZjg1UCtWeUpjbmhN?=
 =?utf-8?B?VkJ0bVhabW1mdHlMK2U1NHROdVl5U2hmQWlkTWtPdXUreWtYSU0vY2ZEN3dt?=
 =?utf-8?B?dStaSWFaRjczd1hoTGI4VE55eE9RRjVORlJkdy8zSW10bFlxbFhpWHJYWmN3?=
 =?utf-8?B?N0ZBd2p1a1paVjAzVUxweERjUDNsQTVyLzIyblNCU2phT2ttS3FxSEtkZG1r?=
 =?utf-8?B?UWNaWFBJZmxXRU1vN3BhRTIrRGx4Sllqc2lpbGV2SkhnQURjMWZsZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0182eb88-c171-477b-9269-08de52a8b0be
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:36:00.7121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mMDJEF+bs8nrvUjB+QpjPZg2Fs8lt9oWpXaX506NCuSX/mId9QaQjZxR7z8XRLIlX71wu6p/edeUbD7AEnivSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3112
Message-ID-Hash: 7W7DF6ALMYAAVXFU7HJEIRIDFUQ3VCTK
X-Message-ID-Hash: 7W7DF6ALMYAAVXFU7HJEIRIDFUQ3VCTK
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7W7DF6ALMYAAVXFU7HJEIRIDFUQ3VCTK/>
Archived-At: 
 <https://lore.freedesktop.org/DFNI283CU0R9.27OZOE5NJA2I5@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
> As per [1], we need one "use" item per line, in order to reduce merge
> conflicts. Furthermore, we need a trailing ", //" in order to tell
> rustfmt(1) to leave it alone.
>=20
> This does that for commands.rs, which is the only file in nova-core that
> has any remaining instances of the old style.
>=20
> [1] https://docs.kernel.org/rust/coding-guidelines.html#imports
>=20
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

