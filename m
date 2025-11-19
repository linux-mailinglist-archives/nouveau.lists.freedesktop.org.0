Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD40C70FA8
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 21:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D717B10E25A;
	Wed, 19 Nov 2025 20:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KhOUUjBm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013029.outbound.protection.outlook.com
 [40.93.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB3910E25A;
 Wed, 19 Nov 2025 20:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWaozuDmltkvK/aau+2FBqPGQGLg7d0HVSQr3l4ChP0qMFbBoR6UQ6n3U+yhtHC7d/IjRwhxz1Gx7V9NMldE4JrfxUnK1c7z4Itf0gG8/3N3xvT49hP2c3ICEi286mjTW/4/Un5oTqaeWbpffSJz0gt/lAewbXFOPuWzKtlum/guvbCU7WLrJMOrq47y8Sj6C1trDWYA46HOnuQbeLpI/J7yqXIo2X0an2zQw0nclF7BDb8yzv6IhIRpoEbcWIboyGcjHUZNT254Q10W6ijQN4T8JtXIX7ACY4XSiwrVn1cCkgLPyxjLbL6yJrCqH+sXBxxbzR6+Mi2B3I6lPDqp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46ydBZScnBQ06I3aOChInveep6vUm8NcYhv65CG2s/c=;
 b=HHunv733EBR11EJk/LrRR4efcsX/ihnVz5Q2XKQDxHE2nwXEI2NKTVODrRtQLXr36aj+YRpvwGu2QJf9xJzpoAwMSq1PyZ8gMvTUF/+xlhFHQK9/cVPNorPiQacvv3cTF3UJS53p100Vwf85ZXglWxex4j1nCLfZLiaOAd1v/mPJtrYaMIar+gCzaxOnt9bAHeyVDf5oCnFVEI5GobdyY9fpjdtwnXYJZrBAmoAEeDXvOInbAxw4tAqaw5U9/6QUlcSbPjDSh9wxloJTTz6kjb7fj25Hi5hdhgjabdkeXeeEeRPpFIx9mFGNXGOpwlsMl8oHjH/gsyHguUg9oiZCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46ydBZScnBQ06I3aOChInveep6vUm8NcYhv65CG2s/c=;
 b=KhOUUjBmh6n/Po6Ih8JLXZJWibSlJ1l8V9Qd7FyLgfyrHkeOaGemi8ht/+3+c/OUDNPML+M64avm7d2w6bMEL96woabECgv/WtwGLVbxn8RhAzlxTeR3hakIrOiH4poKTATi2IxfssIsqyinV4u/NI5fFilp6QPWR252TO9StYQb5848zpwCtwvYFV9WP7WQwVn+ht53T0RSJs475G7SpOwPSBrpTG2Lxegk5Xho35Mm3zptsnpxjMN+4Tkv13Mc7ptkS+HqwHj4XLlO8ayj8HqcW5L69tAomJjHQN8WSiD6I89HsmARa0jUYYV8epoiHI6hgvA2RsSaD6YzcqKjRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6275.namprd12.prod.outlook.com (2603:10b6:930:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:10:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:10:17 +0000
Message-ID: <d900795e-bc56-44f9-9768-c22527e67f0f@nvidia.com>
Date: Wed, 19 Nov 2025 15:10:15 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY5PR12MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7011f0-de76-4f15-fd6f-08de27a7a809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEh6OGdGUWJtaXVKWTJ5emtlYkJHSTQxa3hLUFVQeFE1a1JMMThqUFB2QVho?=
 =?utf-8?B?VlZXNktpd1VwalIzY3BBa0FVYTBCRmFkU1BRSEpzREFsbno5VGhZbndYSks0?=
 =?utf-8?B?cWpRL2szczhFWFVJN0F6UzFFaHFRM2c1Qkx6OTNnc2I5dkN6WkxES0xTTUc1?=
 =?utf-8?B?aHBJcHptY3BuZytXbjl6SktkTHhSQi9rZ1ZXZ0JvSk1kckhVenZqYnhoUGE2?=
 =?utf-8?B?M091R0tidnNrMHlxbU02dVh1SU41TGI5aTYreG9GRFlVZWQyaHhwM1EzNlR6?=
 =?utf-8?B?b0Jvd3FzelZmTURENm9KUE9XL1RHaHBYRUY0NnBSRWVIN2xVOEhXK3F1OWYv?=
 =?utf-8?B?Vlk4Q25HVUZLRWdlNyttQVJZQlAvK0JLWlFiQ2JUSmprT3psalBWQWxDd2M4?=
 =?utf-8?B?cU9ueHRxaUJoRmk5Nk9JRFkvckpUOTcyVU5QVDU4U1ZlNWlZV0hPZlAvS2F4?=
 =?utf-8?B?K2pFc1lLWFhVK0YzakFYS3VHaDNiSExCa2xXY2dCdmEycWVwbzQ0dEc5dy85?=
 =?utf-8?B?NVJLaWVBd3JZL2JhTzhCc2VKQXlobDlSU2F1UUpJL0R3T0lWRldHQ0J5MDhD?=
 =?utf-8?B?U2ZrbFNmdGFaUHl6QnVCZHZPendJUUFYb1FzbUNBRUpYYzlobzZMc2k1KzUw?=
 =?utf-8?B?SWdOOU1OaGxXZlBwcVNieXIxMnViKzVvcjlScHN1YWFtZGpCdk9SWStwcDJO?=
 =?utf-8?B?TEp2a3Iwb1EweHV6YVdoZmc0SzM4c0MrQlI2YmxyTThKVXRkaHJUbmhXM0Nk?=
 =?utf-8?B?N3oyQ3R4YURrR3Y3bklMbXYyelBZNHpXZTJ2cTJVdHMybko0b3M2RjZHb0dP?=
 =?utf-8?B?aUJCM0ZaRVhobENIKzBqQ2pWemtETXAycUFMVmZHbnJPQU1XcFJjb2MvODFr?=
 =?utf-8?B?QkZIZFZzZzN2Qmkza00ySXBQMTU0SEZiaENzekNqbTJPRlJvUVpRR0lGdjJ5?=
 =?utf-8?B?aStlRXRQQ3JIRG5ZQit4R2JRdDVvcGM1aDJCZFZlb2Z4czIvdE9Oa2V5UUdp?=
 =?utf-8?B?UWE2N2o4d3BXdVFobFFDVGRZQWdRRndqRjZibkV6aitSVGtwekFhaGFKNzlY?=
 =?utf-8?B?NUh0d2pvajQxSUVZOWlNN093Z01VWGFRWVdVZ3FqMDJVa000TGpjR0FUSTFu?=
 =?utf-8?B?MWJ0MU5sS2VBazhFQ3crK01Gai9mZlZDdUdPaXlMNDBYdXN1Vk1SdkZxeUFi?=
 =?utf-8?B?NVZ2UHllRkpmL3JORzhDUkF3UUlJUEhuVHNBMkdEdkE1OUZmSWd4cVMvQnZB?=
 =?utf-8?B?SStmNW1OVFc4U2JSTGpxZk5CdzdKSkkzSUl0WUdBNkgzdC9URllUMTYrcHhI?=
 =?utf-8?B?YUk3WVY5OXlHQXY1ZVY0UUZ0TGx1TWdhME82RGNiZWlHeU9LVVcyb3JwZ0hv?=
 =?utf-8?B?cytaTy95aUhkcGtWMHdoK2swMzVwOWFkNUNEREJnUzhJV3BjbHJEcEhoWlNN?=
 =?utf-8?B?ZlI3UFlrVHNOTzZOMUh6Z3RUOTlkdHh6UWM3UFlDWEFhTDA2TytUYTFYOTJm?=
 =?utf-8?B?SFBJWUgvNVBLdTJ4VG1oUFZyY3puUDBFVWZPZkdGZEpLUjlLWDJxbkdFREJ2?=
 =?utf-8?B?V1ZtZTg5azdSTHBYem56RTRicW12NkJjNjBqbmtRVWg3SFhnenJOY2ZSUVlM?=
 =?utf-8?B?eGJySTRodjZBSHJhYnp4VEhoUlBzRGM4ZHovV2h3RXJsN1ZXdEdYQ3pJbUZ5?=
 =?utf-8?B?dE1hTGhIMGFNY1NqRE0xckdKSm1MVEZzbjQveDMxQm9DZ0w4U2I5S0ZpUmcr?=
 =?utf-8?B?U01aZTBOWVlFaFpwQW5ycFpuelh4TkZjRlA1ZlY3RGlIY3RzZW52VnVYL1BM?=
 =?utf-8?B?RWpaYndqU0ZmSmRyUEY3ZU1KcUVFcitkQ2wvQkVERnlQdzBZQ1Z1UVNwZE45?=
 =?utf-8?B?SmFDMlZyYXQ2eDNDTi9ETXJpZ08xa2RYWmJjWTcwbS8rYkQwNU1WdTJvQmps?=
 =?utf-8?Q?PaneXiv+vxrOZmcsKBL47O8GC0+tTsyX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vlh0V0hvQkFxQWNUTWhnbXI4YTNIM25tMEhIUmdwOEJEejAvUDZLTW8xZVFY?=
 =?utf-8?B?NDVKbm1PK1lERUlWWEtiR21UQ3RQRHJFcFY5d29MWDZpTTVQOFhiVUtvTUlC?=
 =?utf-8?B?WXNUMHFJaDhjTEY2NE01eFlid0d6dWR2UzhEcDVnSmY4a0NCQjh5VVBnRjdq?=
 =?utf-8?B?TEkyRDVrTXpHTk9mbHZyR2ZzYTRmaFU5ck9DTW1VRFkzK2p0Zjh5THovYlI3?=
 =?utf-8?B?dDAyM0x1M1cyREhWWml0Sm1SQnlJYkF1WEdTOGNXSTdlN1Z2WHZVd2xZUFp1?=
 =?utf-8?B?Y3ZISTI2Q202bE5aUGxVeS9sYVlmRkJ1N1BWOTdvODl5bkdhVlFnQlZQTi9u?=
 =?utf-8?B?YUNoMTRsbGF3bUg4ajdVOUdDR3Ixc2MwM1FMQVZpTEd2TWptYXRET1hkYWZk?=
 =?utf-8?B?WmNZYkNTNFp4NWNtaUI4azE0REhRVElkM2JkRnBhMUxDMkRld0lBb3FIMVA2?=
 =?utf-8?B?MDQzRGo2WFhCdGpnVlRJd2Jmc0wwQ25qaEg0UUoycU9CRzdYZXc0aUJkbjhY?=
 =?utf-8?B?ZnZOV2tYYW1pRlJTWURJbmZHQ29tNVY3NVBFK0F4QTVhMVU2RjExano1STNw?=
 =?utf-8?B?VFRwSHFLTEo1cERjK250Z0hrQTJjY0J0blRtYTFBTFY3bGpQUFNIQmlncFcx?=
 =?utf-8?B?TjJsbm8zOWptdjVTWGtnbGFoemdoMno4dnhqYUxsOWg2cnNsam8vZEphQ21k?=
 =?utf-8?B?VEUrUnIvVk43U0V1dXd1YnhuMnJBNjhnVlNPNjdVZmNSaDBYNGp3ZVQwaW1K?=
 =?utf-8?B?YXpUZWFBVWYzZEkveWF4WXk3WTg2RjZGWlBPZjlaS2hyUVZSb3VtRzB6b2Ix?=
 =?utf-8?B?eTRDRU5zNWpXZE5PZ2JLSWFXWE80OUc2Z0VvTjhPcjRSckpNamVISDU2ZEJy?=
 =?utf-8?B?cEFYTVhhRWFWb1F1Qk9YVzQvN3dJalZ5ektOY0djNjlXSG91d2xDWmhWYTRZ?=
 =?utf-8?B?a3YvbFRLSzE1eHNqb05EVGxySGQyOC9UamwvZTlFM1gzakFqRmhZYm0rOEU0?=
 =?utf-8?B?bWlMSzdGSnZxSVU5bFJEbTBUZm9zRHdCTmxMWjdxY3ZjMnQ0b1VDMGhjN0Zz?=
 =?utf-8?B?Y0JtMklHdmdzRFRIczI5bzJqa1p2UXlFdGJnUjZvOWJxMWVpWmVIMDdzWEhi?=
 =?utf-8?B?RUhlUmJiY2tZZlJXV3ZOODFiaHdMam1XL3VvTmE1dDF3YzRMS05uMDJsZWJQ?=
 =?utf-8?B?TC9xWndpV0o3REUycFpKcVZaL1dCc1p0VXFxVEVDZ2ZEQXR3MENneFNYQnFv?=
 =?utf-8?B?eWpGZTlwMzFCS292SXRlQ3NHdkQ1eHgzNkxEN1BjaGpEMm5DeU5TNG9ZVm5O?=
 =?utf-8?B?TjlxbktHSWxKTWxrY21DVW9mTmNFZXdCeEp4Y0ZOYlBUdGVNeUxCalVsNElx?=
 =?utf-8?B?SXV3K1JQd2RxMWJJN3hQU0ZkbFVxUWI1M3lzZFRFb0l3WXgvUXhza3ZoVTdT?=
 =?utf-8?B?a3NYckV1RitMczVBd2o5QmNaSXg4VTl1L1hSTVZORCtQTVJ2VnBSMCs2TnpN?=
 =?utf-8?B?bXdXdzR6ZFcxMkxyNUM0K2dSdFp5M1RBVEsyUDRSTkozcGZyN2JFeG5KZFNT?=
 =?utf-8?B?VEZKNjhlcUwxaUJmdThMZjVub3ZTVHNMR01UY2krUDBoUFM2dWpiNjltUDdk?=
 =?utf-8?B?ckVqV2NxNktXcDVWanZuSm5lbzN3Rm95Zzcva05zd21uOC9keDRYZXVHeTRC?=
 =?utf-8?B?K2NqNkwrYXU4SWs1bjk2TXkzekttL2ZnUzEwNVN1bGZuOTN0a2pUcFVtZmp6?=
 =?utf-8?B?OWhva2M1MzV0TGVIQXpOOHNEL21iWkZ3YzBRNVFxQUVIZDNncmtEUFdQRWZi?=
 =?utf-8?B?cHpjZzNvM0VSS0ZCRWxzUU1BWU1mcE1MM0lJNHN5b3lGa2dncGhYaWJleXdV?=
 =?utf-8?B?WDJhQXFCeHlBZ0NFMGRicmMrL3AySWtwTDJ5M0lVcEw4QWNNcjRSUkZVakhD?=
 =?utf-8?B?MkxldUNLOTluRUVDbzVRMUVmQnBjSEJWeVNONnd1WkhzMXRmTk9LdGlWZTc2?=
 =?utf-8?B?ZWROMC9HMW1DNmdwR2kyZjRMcHg5UkcwdmFmVURkMDZCajhBRzJPUE95eW9M?=
 =?utf-8?B?Q096eFJNZTh6MHdqVXJZZ09iQ2x6Y0ZRTmd2dmdBSmcxdnkwa2liQmJNSVhx?=
 =?utf-8?Q?Cyv4mxueNsS04OE+AeU1YNIta?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7011f0-de76-4f15-fd6f-08de27a7a809
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:10:16.8580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVXfR9YDkFF96PU89cxIY7uV31+1FnlOoMbVqpcz6Sb8jQDs0s5hy/o/g+dzvBAbb3XSAQHG3oT3UpkfwBuaxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6275
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



On 11/19/2025 2:04 AM, John Hubbard wrote:
> On 11/18/25 9:16 PM, Timur Tabi wrote:
>> On Wed, 2025-11-19 at 11:51 +0900, Alexandre Courbot wrote:
>>> I'd prefer if we could reason in terms of functionality instead of
>>> specific chipset versions.
>>
>> If you can figure it out, I'd be happy to change the code.  I wasn't being
>> lazy when I made this
>> comment:
>>
>>    // There are two versions of Booter, one for Turing/GA100, and another for
>>    // GA102+.  The extraction of the IMEM sections differs between the two
>>    // versions.  Unfortunately, the file names are the same, and the headers
>>    // don't indicate the versions.  The only way to differentiate is by the
>> Chipset.
>>
>>> IIUC the relevant factor is that Turing/GA100 have some non-secure
>>> bootloader code as the entry point of booter, which GA102+ doesn't
>>> feature as it is capable of starting in secure mode directly (please
>>> correct me as my understanding is probably incomplete if not outright
>>> wrong).
>>
>> That sounds about right.  There are secure and non-secure sections in the
>> firmware image.
>>
>>> What is the HW or SW fact that requires this on Turing?
>>
>> I don't know how to answer that question.  That's just how it's done on
>> Turing/GA100.  I would
>> need to start an internal Slack thread to get a better answer, and I don't
>> really see what it
>> would gain us.
> 
> Here, would it be reasonable to just create a tiny HAL-like construct
> (a trait, I guess) that has the function to call, and it decides which
> behavior to use based on the chipset-selected HAL.
> 
> In other words, we know very clearly that we need to call one version of
> the function for earlier chips, and the other version of the function for
> later chips, and the dividing line is because that behavior changed at
> a certain chipset.
> 
> I think this HAL-centric, chipset-centric approach is fine for some
> things, where we really have no reason to care about the internal details.
> 
> For other cases, the functionality based partitioning is probably ideal.
> 

How about a BooterFlags enum in BooterFirmware, and during its construction in
new(), do the chipset check there? That way the chipset is in only one place.
And the flag in BooterFirmware saying "NonSecure" or something like that for
Turing, and default to NONE for other chipsets. That's similar to John's
tiny-HAL idea, perhaps the call to BooterFirmware::new() can check with the HAL
callback instead of checking which chipset.

Something like this on top of Timur's series, only build-tested:

diff --git a/drivers/gpu/nova-core/firmware/booter.rs
b/drivers/gpu/nova-core/firmware/booter.rs
index 6ac9593504db..b9a8dc8d08f2 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -249,8 +249,19 @@ fn as_ref(&self) -> &[u8] {

 impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}

+pub(crate) enum BooterFlags {
+    NonSecure,
+    Secure,
+}
+
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
+    flags: BooterFlags,
     // Load parameters for Secure `IMEM` falcon memory.
     imem_sec_load_target: FalconLoadTarget,
     // Load parameters for Non-Secure `IMEM` falcon memory,
@@ -361,8 +372,16 @@ pub(crate) fn new(
         // versions.  Unfortunately, the file names are the same, and the headers
         // don't indicate the versions.  The only way to differentiate is by
the Chipset.

+        // Chipset check.
+        let flags = if chipset > Chipset::GA100 {
+            BooterFlags::Secure
+        } else {
+            BooterFlags::NonSecure
+        };
+
         Ok(Self {
-            imem_sec_load_target: if chipset > Chipset::GA100 {
+            flags,
+            imem_sec_load_target: if flags == BooterFlags::Secure {
                 FalconLoadTarget {
                     src_start: app0.offset,
                     dst_start: 0,
@@ -375,14 +394,14 @@ pub(crate) fn new(
                     len: app0.len,
                 }
             },
-            imem_ns_load_target: if chipset > Chipset::GA100 {
-                None
-            } else {
+            imem_ns_load_target: if flags == BooterFlags::NonSecure {
                 Some(FalconLoadTarget {
                     src_start: 0,
                     dst_start: load_hdr.os_code_offset,
                     len: load_hdr.os_code_size,
                 })
+            } else {
+                None
             },
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
@@ -393,6 +412,11 @@ pub(crate) fn new(
             ucode: ucode_signed,
         })
     }
+
+    pub(crate) fn flags(&self) -> BooterFlags {
+        self.flags
+    }
 }

 impl FalconLoadParams for BooterFirmware {
@@ -413,12 +437,15 @@ fn brom_params(&self) -> FalconBromParams {
     }

     fn boot_addr(&self) -> u32 {
-        if let Some(ns_target) = &self.imem_ns_load_target {
-            // Turing and GA100 - use non-secure load target
-            ns_target.dst_start
-        } else {
-            // GA102+ (Ampere) - use secure load target
-            self.imem_sec_load_target.src_start
+        match self.flags {
+            BooterFlags::NonSecure => {
+                // Turing and GA100 - use non-secure load target.
+                self.imem_ns_load_target.as_ref().unwrap().dst_start
+            }
+            BooterFlags::Secure => {
+                // GA102+ (Ampere and later) - use secure load target.
+                self.imem_sec_load_target.src_start
+            }
         }
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index ff53d58c1df6..21ac1cebb6d2 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -21,6 +21,7 @@
     firmware::{
         booter::{
             BooterFirmware,
+            BooterFlags,
             BooterKind, //
         },
         fwsec::{
@@ -184,7 +185,7 @@ pub(crate) fn boot(
         );

         sec2_falcon.reset(bar)?;
-        if chipset > Chipset::GA100 {
+        if booter_loader.flags() == BooterFlags::Secure {
             sec2_falcon.dma_load(bar, &booter_loader)?;
         } else {
             sec2_falcon.pio_load(bar, &booter_loader, None)?;

thanks,

 - Joel


