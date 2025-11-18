Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3167C698A1
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 14:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A2410E49E;
	Tue, 18 Nov 2025 13:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rGWUQhvf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59910E49E;
 Tue, 18 Nov 2025 13:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJfrXucNt8b8qgzIHo+MC4kQy21AS5VgakUVsi4W8WBEnLyDti/eHDKOYjQxihtlmzr5S6C4eZZVPvtNoc0jDvqd4aFUOuwxk8rnTmhFDwM54CkU2DxAhvyfPVNqmNU88HzwLkwBXWqrBpaOtQIi54z18xgTguoIzKprmNprXrV3/xFz3xzFRsc3h6PxeixAw8RYlv98DOpyMUyBw44wqtZEaPYOtF2JA8LMNVL+srzpKpy3gOVOUxscqZq/rj7l+saGpxCeSzYJZZ885YbrYnIm1cUrdLB6EA5R+S/Mng/mb9FK/TRnv6uYcPnHdQDFcgafR95rmpvpQcp4Sm1oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoOjb7WCSOs/AyjRHpW0xTL1byPUGRqfvkRiUptDTIc=;
 b=NovsvdOuRaGarZEyHE5c6TeJh3RdLPlFQttnMtcKlRTS9xaEeajxe2ZHuqCw61w/ux3WDwoKbq6EjMcZkP0pBwqg2N1xCcsclBoemGydt5gjHRKC3KvaY8FCdiONuUgCVmQ6Iq/AZB1ubU9nkcpvTu25cl7lcvkA1larOFgtQ/dwzTzp+dgTQ8dI7gjAOKupr48OaFsxThHsZOoWehNnjj4JNCMVJr7Pr/TkpDrqAyv5kU+HnY4k+Co9B2iBzLPx3rzMbDuUuA/v+fVNlFQqQVxCRPJRpn4VPMlGUVakxnghtc4rm57zf6WnWo89PgHS+h29j+eZX0ZYvR5MWdMBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoOjb7WCSOs/AyjRHpW0xTL1byPUGRqfvkRiUptDTIc=;
 b=rGWUQhvfow4/9NNJZnO+fKu84m+ibGD0HORa8VxxgX6Y4MroRDnKHTcUQS4imFo1zOo5IQmtGaqt7VGi7iA936aYIPxQ10pFUQP2DdtVdvsZDMsmqOPxDzEGu7FxOZE9aBN3/yamRw5VmTh7Qqzn0l9b7Q3Qdl0g6hOIEgwLgbSyTPJ6ogCjtBdZRGsSBM+/5gl+w4i27hQvBy9NrjpiH9r3m8phxNQYnW3xSnFkU5TjwCmvpyLAdVqxenjBOT1oPFTEmj8wLzidgIDUYAdVpGjFF0dG3TzJxiD6GOvKzBKWAWbFB5oWPGlDKEQIdZ0BWgMkwPd07wYbKhK1w3F7NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 13:08:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 13:08:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 22:08:18 +0900
Message-Id: <DEBUEIRJGKV7.2V5MUMM01SQWA@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 11/11] gpu: nova-core: add PIO support for loading
 firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-12-ttabi@nvidia.com>
 <20251117233434.GA1095868@joelbox2>
In-Reply-To: <20251117233434.GA1095868@joelbox2>
X-ClientProxiedBy: TYCPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: d7ddbc16-31cc-43f5-38fd-08de26a38cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXpZOGJPSXpEZDV1b3JpeDNUa3R1UDZDUjMyaUppU2J1WVlGckw2TlRSZzFY?=
 =?utf-8?B?dmdYc0RZZ0tlUWZ0VlJaUHBMcGNCS0JCZjdaOXdETFRvZGt4UU5iZUt3SVJm?=
 =?utf-8?B?S1JWd0hTN0twU3g2RlF4dTVMeGFIQUhRcW8xQW8vMUNCZVkrREpkd2VhMk4w?=
 =?utf-8?B?OXdxYUZVRHVRNzdLL1ZjU0w1a1pUQUtqRExpL0ZjR0JqVXZJT255bzJBd3hX?=
 =?utf-8?B?VGhST1prS2ZIZStaN3RNNXdPMWVrb3FEaExLNWlQdGc4K1NYbFhNczRieU5m?=
 =?utf-8?B?dFN5UHh2S3RsWityN01YWTJFOXlGTFpwMjBuc29jMnpiMGlTcG1CZ0ZzemtN?=
 =?utf-8?B?UmlSRE1KV2NSUDE3bkphZDJMOFF0ZUV3bXBzSDFtUU9iVmNycEtTOW5Hbitk?=
 =?utf-8?B?NlBDcCt3Qld2U1ZDd3VhUWEzaWd5RjdJK2JEOUpmWVdXWWZuWXVqT1ZVMUZr?=
 =?utf-8?B?WVFFcEwvYVhoRUQ1Q0t2VXV4ME5PSTZsbjJMenJ0UnU0UlhEWE5uc21QQjF3?=
 =?utf-8?B?SHJ0OEhqVWpUcS9USHcvTy9qUjNJWE1JckpZUXRyNEJVcUVnMzc1bjhtSWJQ?=
 =?utf-8?B?SFJkQkdGWU8vY0RBRDZwT1F3WkZzNldOMzhLaklhM0lJOVJqN2FXTExJc1d4?=
 =?utf-8?B?R2psREpyV1orY3VaR3N2ZXQwOVFibUt5M3Z3eGIvZ3FSa3E4RUNQZ1FFVXRX?=
 =?utf-8?B?Nnp0c2pjYi9JVkp3VXFEVHYzT3hPYzV4T29VM25JbG5wWTRWTVg4cEE4WWtu?=
 =?utf-8?B?dlE1UzI2b25MSHZMdXFEcnRBU1oxZnZMU3FjK3NWanNrcTNtekU4QXFMbjNX?=
 =?utf-8?B?U3p4S0NneGsvWlhkSDZ0Rk82dHNyYVpTQnozb0FtR1E5eUxvZ0dFR2hIRFlk?=
 =?utf-8?B?UW1HVlR0QWtEQldCTUc3Tks0ZVVNdHdUeHNBVEptMFU4WEhRKzBHUjJVVVlR?=
 =?utf-8?B?SHV1cnJNWDVrdVhyYXJ3M2IzVm1uUVpESzl5WjIxVzlENmlUWkxBQm9aN0Ev?=
 =?utf-8?B?a1QxejU3TzNlWmVTQnkvenNHa1lXZ0VFbVFSazA4NnZ5cjZwd2JUenNnMTRY?=
 =?utf-8?B?MDdxcFplMUsrS21EVVJMYnpoVXJkeEhucEZKT29XVzJxLzUrejR2c3V6d3M2?=
 =?utf-8?B?Zm9HbGtyZE5PU0FLc0s4bGFUSmk4aWxjWkVVYlBmbVMvVGxGYy81cHB6RUlr?=
 =?utf-8?B?bGdlbzNXOWJaTU9sQ0ZPN3lETjlyb0daTktiK2F5NVZhMHozYmVka2VvQVZ6?=
 =?utf-8?B?WmozVjd3RXI5bEVMNWVRVW1UWXNYdFpkNFpmUzJ6Y0d1M0wveXRGZHprV203?=
 =?utf-8?B?RysyMjlLbWF4MktDMnpKR0hjL2VQd2JCMjBZUHZ0dHpFRC9IdlB0b0VpWW5H?=
 =?utf-8?B?cU41Mm0zWkdBbGlZbUxVUC9GTHdCSUpQRHZoWnY3TExSN2hTRTlERnBuL2tz?=
 =?utf-8?B?V09QR1lPYnpvTlRlOHpsTVA2V2FrWHBYYTZJN3dlcHUvdEQ0VHh6TGZ6dzlH?=
 =?utf-8?B?TmdVVnFZMUhqWkRZMlVrWkI0WDM0emVGUkFNODIrbFhwVnRyNmx3WURIcENn?=
 =?utf-8?B?bnJwQmdGbjVMYjF0Q2ZFVnU1RGttSTN5WWcvVnVsbm9XMjZMQ2gvUnZZMXNh?=
 =?utf-8?B?YXFWdnJER0dFQlhQdWN2QVhLenl0WGF4dWJmZzFkS2F5ZjVESVJIQWVMeExJ?=
 =?utf-8?B?SGlRNXoxWWlBUGNDblR2L0NtWExvNCt6VXlDRnRCUUJydU15YlVjNlYzUjNx?=
 =?utf-8?B?eDhYYXJwaGxvWFl4bXVEd3RUOFVCQjU2d1l5RkFpdUJjaU1HOUt5eHVLcmlF?=
 =?utf-8?B?dEVHR1dxcnRKT25aTmc4SFNORXBhbXRXbWdlQUREYVhtRmZSWkIxOUh6dmxm?=
 =?utf-8?B?MVVIVUtNVUxMSmFQK2k5UG50cW41SVNGMDRTQlY5VzhjYzhhSjVYeUhIL0p2?=
 =?utf-8?Q?5z9qmdzSV3Ic217kk15ZNXRZQ8bzhXiO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enptT1hLTVVvait1Q2EwN0FqTjJ5cGs3clZWb2NUM2lnbm1LNm1MUU5EQ3hw?=
 =?utf-8?B?OHZ3S2hpdGoxMXdCNHNPNkRqRnIxL0JJWElORnUyckJvYVgrcHo0emI4emVl?=
 =?utf-8?B?bEttQUJPU2RkV2lqaTA0L3BLOW51ZFdzQUwrT3dnMC9uRHhrZWJud3h2Z08v?=
 =?utf-8?B?S1ZrSlZSckRJdzZ4UTdCY1hxdGNHdGd0SVlZR1BmUG1wQ2QwbTlnSWRTMjFv?=
 =?utf-8?B?MWgrK3FGZFo3dkFEV1lCK0VLNzZyUmdPaENTd3NSUzRBUFYzTHJWYkZVelpu?=
 =?utf-8?B?aklRQXZObndZOUo0UW5zTnpYbUxnMzAxc3JEVWxaY1FyTDgybWVKMGhOOFVE?=
 =?utf-8?B?K0dkdTZJclN6RmNMaFFBT2M0OFdvRWJ0ZlpIM2VTcHlDbGdaS21kSjhJdUpS?=
 =?utf-8?B?QzV6Z0VkdC9JYVhTRFZsK2NEbnJhcDMrOXF5RjN2RGd6N3p3SWRRVGNvY20y?=
 =?utf-8?B?TGFNcmxoaDhydXBldEF5Z3poZXJxcVBVNmtVNDJGRnEyTGhIVTE1RXV0dmhp?=
 =?utf-8?B?Z2ZzWWltNERSY2lhUXh5dGZJNjhZdkxPY3lRT2V0K2RpRWk2cUJMdFNxYU9N?=
 =?utf-8?B?cmRoRTVhNmpJRGg5ekh5Y1d3dU90MUZKc2hmSlROaGRDRHBGOUdGbno4SXM5?=
 =?utf-8?B?bi9WWTJybSt1eGNSVCtqUXp6ZWtYb2NhKzZZQTN3QjZEQkxINmV0OXVIM0xW?=
 =?utf-8?B?MTRoaWdLRnYyaEJtaHdMK21SQ2ZhbnV6Z1lBNU56TGFqNTYveTlYblUzaGM4?=
 =?utf-8?B?S2phSlN3aGRMQS84N1JKQkJxQTJXK1FFWko5V1B4WUNXeXV5OFFCQ3RQQzdV?=
 =?utf-8?B?N3JYVDBpcVlHUkNoZ0RZY2N1WVRCMUk0UyttUU5KTG05N2ZLUTU5dUpVNVNa?=
 =?utf-8?B?ejVmYnA3U2pJZVJFbDBMb01kendBVkEzem15UVo3ZU9OdjVYaHd3MGkrTTFk?=
 =?utf-8?B?SGZ3dHJSS0ZHWlIrc1J3Wlkxb1BqQWMxSXg5TG5LWFBMWHlsRFdpN2JsQ0or?=
 =?utf-8?B?blNtZVRvU2tmRUF6NDdtSmVTdE5YNUgzSDBqZVBaUCtWOGhJa0lqY1FTR2ND?=
 =?utf-8?B?dFN1RVNsd0NhZmExVkFyQTFLSjR6dFI2aVlTcWt4R2p3RmZ2M2RRVit4SWFj?=
 =?utf-8?B?QTJldGVzeFZpNGJTRmpTUWhZdjZuaEVmNE1jWXR4Q0RpQUF4SkFObUlPTVNP?=
 =?utf-8?B?NDY2ZXNTQzQxb0J0S052QUwvT2swYVdrbmpkZkxub3FDRlNTS1RyWG5uMnpS?=
 =?utf-8?B?bmtLTWV6aGlMcDB1c3NCT0NJUGlqVmY2ck8wb1pYSlZyMU5UbzBCNkdlRVQ3?=
 =?utf-8?B?MnFzL1R2eUlySGd5cUVnblh4QTM5QUU0VnBLSDNvb2pIRFIxenVJanJidlZh?=
 =?utf-8?B?ZHlDQk1OMTVQL21pNkdNODFUSE15NkV4UGxTWlB2eUFKU3d3VzhKRmNHVHhW?=
 =?utf-8?B?bkhrUFNvTnpFVTBhWklKMHA0aHFZeCtnRmQzTGhIMEViY0Vyd3hrR0tRanZP?=
 =?utf-8?B?NjVlbElYMURlN0w3V2tob0w1LzlyUjExalU1R1hxZXpwTEVFdGs2aVVaMG50?=
 =?utf-8?B?cXRJQTZxUzY4VHNRalYvaGl6RzJPcFRpYzJNdEF3LzQxYU9LTlBNVGoxZWRx?=
 =?utf-8?B?MXd2WHNVaENmdnFGbmhIZi9HK0ZoZDQ2QjdXUmJlY3FGZ2QvbXpqZ09NQm1t?=
 =?utf-8?B?amx3b2RpT1RKU0U4M0o5S2d6cjc3WDQvQ2VSejNDbHkxL2xjTHlISFRidVcx?=
 =?utf-8?B?blM1Wi9nU29sVy84RWx2aUF3NldjazVqRmVxaElpTDFZYk95WTlZVXNlZ1R6?=
 =?utf-8?B?VkI4TGVjT25jeEh3UXFnWEtWZDQ0THZjTGdYSzBkSjNJK080YTNOUFJsV3g5?=
 =?utf-8?B?QlFuZTF6TnhIMDBTZFRqckxXRkU3L1RUQUtJSzVQOVFtbDZOanVPM1N4WC8w?=
 =?utf-8?B?UzQ0NmRGYlFabHdNUXd3T3RhM0JuaFQ2djFCdGxIM2VxdGIzZ2V1MHdtTWt2?=
 =?utf-8?B?K0RDYWlBK21LS1lkeHU1QkpwbzZxR1crWDdySnBpTzVRa1lUdHU3NHhIbGts?=
 =?utf-8?B?c2lYYVlyT0JOUTNtVm94K1h1bEM0UUVmMis1L0lOTHNWaGM0VEY0WXdHMXp3?=
 =?utf-8?B?SUhlWFM2dmx6cEI2c0ZyVXhzcDIyTEVWdU9PNUZGNS9qNTVUWWVsQ1U3cEVy?=
 =?utf-8?Q?bD5/lSdh3hrwjeQtPe+jQX4E+wpUnc7etUW/Xp9Dl/oR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ddbc16-31cc-43f5-38fd-08de26a38cf6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:08:22.2613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WY+EbMfzNYCjkc2A7hXJ9SnXtGu8ghY7J8MtL+eZJNnAgF/9En8sF9xYgN+XFfCM0gQibV9tRPT5fwR1VcH5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

>> +    /// See nvkm_falcon_pio_wr
>> +    fn pio_wr<F: FalconFirmware<Target =3D E>>(
>> +        &self,
>> +        bar: &Bar0,
>> +        fw: &F,
>> +        target_mem: FalconMem,
>> +        load_offsets: &FalconLoadTarget,
>> +        port: u8,
>> +        tag: u16,
>> +    ) -> Result {
>> +        // FIXME: There's probably a better way to create a pointer to =
inside the firmware
>> +        // Maybe CoherentAllocation needs to implement a method for tha=
t.
>> +        let start =3D unsafe { fw.start_ptr().add(load_offsets.src_star=
t as usize) };
>> +        self.pio_wr_bytes(bar, start,
>> +            load_offsets.dst_start as u16,
>
> Lossy conversions require comments. 'as' is a lossy conversion.

In this case, a fallible operation
(`load_offsets.dst_start.try_into()?`) might even be warranted.
