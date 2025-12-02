Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C838C99EEB
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 04:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3121B10E514;
	Tue,  2 Dec 2025 03:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qySIODBs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC4B10E514
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 03:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKuK1whZWG0UEISmnv2lMp3x71nQirZYt1i+XYYEXcI/kKMX4ieA+6mSWAeRj3JN8nUrzVue6uQ0mopWWxtnYjhay3RwMA2RhJHkMaBlK2xVa5AhEucOrPgW3RvvJ/YaVKgr9VWz7n5CKcDBxeCmFq7jEEJ+0t676KVtQDMNCzNxus5LKPwwbIM+etta/v8U/zH5G2IkWDn7VkOCTqUIEyLV7Grijh8BfSny2A4OGoJZv/1g6qQzDXR4rStr7NvuEB+Q3dcAZTXwSgrbWckzGRXwwJZ9BiOKoyh8HNsOna2qutQH/92nJwzqtqHCOJKjZB3QjdCiw//KTTYxwO6wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBnuqT+snAY+sufV2cmV/19sh4KHiJKp49DXYRaa+V0=;
 b=G/JZnBhwtGH5EFN4c+K4DnynIf/QwuB+C1b2nxnWYZ7xzKBjfjHAk6iHNJ7rJzMA2nzIME41AXbkgSELqenrtcbuBUorpjqKvXVw9uS5aRB0ao2MzsDtxjuTiES2XtrSLG4IRs67ta7Px5mdnw38PaLAQ5yI8AIZec/dHXPpOJsJVRN0Xv8G/dw7ddrGYbQWX0VgS/gD0uOpH6PEsy8caYFMsmylyJ+2Us9xan7LrsduthnWgC8+darirONZ2pkD9KNCb346ZgvcRc3GR1C5NUeHYilUeAuJDEeCt2FCC6jqRxR0uFRfun3b9GJ1NRfvcbWn2zQwQZx2W70JeJkvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBnuqT+snAY+sufV2cmV/19sh4KHiJKp49DXYRaa+V0=;
 b=qySIODBsIXFQq2SfUanXMf0MAd7Xw/CRFKWygVJlM5b5hkdGAVn2V28VcNBulQQUfED4Aj1WcYVVmFEE9vIe3aKwZRoD/vqdJWNUGk3govSMGX623U5iJTS3rKrYeJo892SrxkjEcxIXX761e58no0xV+9ReGDVEWozvWL8DWxpiSrpKmNN53kCZiGj8hVACPc7yQ1799LljewYjPmZ+uBHo/qSg5yEFXZdPOzrPyIo+Q5pbMD8tIaPltvxIqmOBn03UWaiaLjFMYGFO9WOeyjnpr8N+wKrO/Ewar6/p2lWVzm5Q5HYLEuYGXqQH6LoGa8kJ60NmuEutJNFHKV7BNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 03:00:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 03:00:28 +0000
Message-ID: <c8483697-d5bf-4f56-91f7-06ec5f1d57f3@nvidia.com>
Date: Mon, 1 Dec 2025 19:00:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] [RFC] gpu: nova: implement trait object
 FalconUCodeDescriptor
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-14-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251201233922.27218-14-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 90627ca3-cffc-4cac-6d01-08de314ef2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0ljSjNMVnFKU1RtLysvbE4vVlJnQmRrWE9CU1RCbmxpTmpKK2xhYkVoV2I0?=
 =?utf-8?B?MU53Uzd3T2c4WU9BYWVNN1VEa2EzOUhDcWNlczRBaXBsOWVNVGViT1Q2SjBj?=
 =?utf-8?B?cys3S1dEU1MvdkFHVlNoT2VmcU9iZE9zV0lZMWVTajRFOVJGSmRJZGlDc2FZ?=
 =?utf-8?B?SVhNZkU1THg1d0dSeDl2TjRuMENlVzlMYXNHTldIcllrREVpS1Bzb1lBMGVH?=
 =?utf-8?B?NTZtUm8zcGFXaGlZRFUrclpXUFBYbmNqYS92UUJpUjBDczJVZHZuM2crclI5?=
 =?utf-8?B?STR2dDIvWXIwd0pDUVU4VzRndGJ4dG1saTZEZ3pDQzNlU0ErS0NxdW9vNUZL?=
 =?utf-8?B?TGVzSk1tWGJqa0t0MmVKOEFyUytFd1RhSWtPS1dpR242bzQvOEhWNThYT2dY?=
 =?utf-8?B?WUtuVjAvbGRxMCtUdVk2NUJuMnBncW1ZbS9ObnppZEtFb0tXNWJhbDFqVTJS?=
 =?utf-8?B?cGpaemFXVXNHR3hMN1lpdzNqL0M5NGNUdWdoQnh5YW5FWFV6RnV4OE54dmdC?=
 =?utf-8?B?SS9pWnZEeWptVVIvbEUwd1VlOHp2R0ZZRDlQYS9EWXRlaFZ5dk12UTlkRVQ4?=
 =?utf-8?B?QTZFUC81cE51SFQxZ2FTNWRiUWd0eEVRN05xZzg2N1M4cTNickp0a0p1eFAy?=
 =?utf-8?B?WWVJYWJHRVFhd2h3ZytIKzFnYTdsbnJ5ZEQwdVdLYjgyY2hVMTlDME5MaFpR?=
 =?utf-8?B?cXh6ZXNhZW0rVVBxWjVtUGVHT0VHeWM1V0h3TWRkK2xSQXMxUGhyc0s1NU1J?=
 =?utf-8?B?azMybVE0NmxEYzkrTlplRE40c28rYkFrZjlITERiNC8wWXFuUVpoTzdnNk9S?=
 =?utf-8?B?SDhwWGQ0TVVjVWcyN3BSQU05US9lT1ZySU1HMHAvTXEwRUJDQVJhQW1xMUZB?=
 =?utf-8?B?TUV1K01qQTdWZVZwbWJITlZVdWk3RWdLa3FQNEdYZXhxZDJTWWlWcTlCN0hQ?=
 =?utf-8?B?OWg4VmJLaE1WencySDlaYXFFNjUwdnY1OWU4d2o1eThuRVhaOWVpVFprM3hn?=
 =?utf-8?B?ODFoN0VvSXRsRkUvYzBuM29aeUhOOFJrL2tSL3l4TkNQd25kMWRqTkt4Q01p?=
 =?utf-8?B?VlQvb0NGK2pLM0NzOW1LN3VNRlk1RUJRYkR4QkY4V3lpQlM0ZXJ2dGZhbmZL?=
 =?utf-8?B?NWIvcGFOMDZMeVUvTWFWeXIyVHNMWkdwRUMvTm9PaE5mSCtNQ0lWeWEyVUo5?=
 =?utf-8?B?Q2UvN2NrTklDRWpXbEpKNzRVYklFVGFDR1R5UFJrVjA1U0lPM3ozOVhhU0J0?=
 =?utf-8?B?OVZpYndKQk03QUlDTm95QUFQWkM3SGhmSm9PN2QwWlREZ0FSWWY2dWkvRmxY?=
 =?utf-8?B?RXVYQ2ZEc3ZHanN3UE1sOGMxTldqUjB1NEdrc1FXMlIyZmg1YkxVMGhhZWtB?=
 =?utf-8?B?WGx5bmplbXQ3RUFCVzM4aTdHUjdiMW8rWjd3cWJUaXFwUFNWL3IyNjBlUmV3?=
 =?utf-8?B?bkhMSnpkMks4NDRESHpTMFJQME1yYnFaQXJlb0RwaXc0djExZ2hqTE1la0lU?=
 =?utf-8?B?T1ZWbXFDMzRWR1NDTUxiMWswMS8vV2ZJeGp0YkVTQWVVYUk3WSszMk5ZcDA5?=
 =?utf-8?B?dXFDakR0Ly8zcEMzaUJpczRLVStiZ0xTS3VxVmpZVW1jNUd6dTU5eXdrc3lT?=
 =?utf-8?B?cTJEdGRsYUhwRm9UWUhLR3dpSEFHTDlkeUw0Y29DbDFtMGdtcnVCaG8xSXdu?=
 =?utf-8?B?NmJBVkRybGJ2UmNtYXp3MTBVRkI4akd5UjVXQWsyYVFWSkhPanFPSTVnbW5k?=
 =?utf-8?B?dVR4WXExVkxaeWIvUThlM1lEOFc1bHdOOFRpNUJPV2FnTmpJbUlwcmtyMHBy?=
 =?utf-8?B?amczdE9nbFNUdkgvcllFblRwZ1Z4b0gvS3BHdVpobUtYWWtwQ1lEeVF5aVk1?=
 =?utf-8?B?VTZvSjZobit4WjBTeDRSQUkraUlZbW1NazJZOG9EM0l5ZHErc0JTRDdnVllu?=
 =?utf-8?Q?dYQJsHvxFwZA93ckLKXF3eEucOH+nCV6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDJ6UkNONUE2YzJkdTZJc2Q5MW1PT1VqdEdHK2RsQ2tEbVFHRmNybE8ySHE0?=
 =?utf-8?B?V1c0QjBuS0VMa0ZRNW5nRGovVWZUeThnWjZxNWtIdWJRZGJSZHdyR2NyR21r?=
 =?utf-8?B?UG9aUDgzcjBKR2JpQllPOE1xL0V3cVRwSW8yZW1oem52ZU1RQ3RiZjBmS2J3?=
 =?utf-8?B?SXVoczlLU1l0dUUvV2pCeE9xUGtQQXkrRWk5Q1hrMGlKdzZUWEtVMmlYMGxx?=
 =?utf-8?B?NGFjNi9tNm0rOEt3QlFEVURkbTExL1prZ0JRQjBBMklPSVcwVmhDNWF2WEM2?=
 =?utf-8?B?MHJONEtFOVcvRjU3TURvUzlMS01uN0hGU3pXZk1tVmxuSTMvNHhkVFlzWVRr?=
 =?utf-8?B?QzltMWZDWkRQMkdWa05lSlhSRmhnS0F1MU95bnIySG5ZbEpGY0VMZ0lvY2Ev?=
 =?utf-8?B?OEorQVIrc2NwSUptK3BhM2hDZXRkYUx3MGJ1T2NrUVZQUmlEb0VSWjUwNjJJ?=
 =?utf-8?B?T3dzTGhUYjhEczZMcHFsdFhaT2U5M3VKVjJXQ3ZQaVp1bjJDQjFOdVlPdm1W?=
 =?utf-8?B?YXAvSUlIcXZITDQ2NnVBNlg0VVMxUHI4anFLVHdvamQvRUxkRUk5WXg5Q3Z6?=
 =?utf-8?B?NlF0eSsvTjVoWEtoSVBjeVoySE9ZUjY2T3ZsTm1IME03eFpUNmxPTG9TbW5W?=
 =?utf-8?B?N29xaktISUtRb25hbjFtbTlFYUhsSDBZMGJDL0FGTWl2eHdHckdxcnFoOHpB?=
 =?utf-8?B?d1dvaEphK1FrTjVoV0p2T2ZTa0lNU21JaFpRQ2IxUFVJNGIvZ0RVUnhXL1dN?=
 =?utf-8?B?clROeDZRTU9RTmhGTUtjY1pjbmRGRTZaRnU4TE1Qa0VjOHRIMVY1c2VlWGVC?=
 =?utf-8?B?R01EQ295QlZFekNrMnhka2lTVzF3dXJQOUN6NHRyRmRweUE0Zk5NNEpCUndO?=
 =?utf-8?B?bWpWS3N1azhLbEdEYXBLUkNiNGd5QXZoUUt0NjZydFlScXE5cE1pclVvUitw?=
 =?utf-8?B?UmZoa1RaVWpoNkpoTUZacHlxUFFER0VwMGNPRDRRTXBTaHB1MElVOUVTNGVQ?=
 =?utf-8?B?M1pyeUlJZ3RrYlR3QSs3MUFYdzdjV1hKNGs3eExkVkhXcTFFZnZUTGdiaTZx?=
 =?utf-8?B?WVRsQmpCcHhTMjBWcCtKZFZoN1ZRQVdrQlBtNjJBdUFxMXI4Rkd6Z2JxNE5j?=
 =?utf-8?B?cGpVR0I0RFRMMHFJdHl2a2xQdGp0L2tvUzVZRVlrdnZVeFRWTkVoY2RKbXFT?=
 =?utf-8?B?TjhuMFMwQW93S0x5Njg3TU5IS3N3TG1zVDI1dm4yWjIyREk3OUFSK3dsdDhr?=
 =?utf-8?B?R0ZhbjgvL21aRDlKUkZTQzN1QVZhNUxFSlJRckpjS1F4b1owaFUrZFBXS0w1?=
 =?utf-8?B?N05YS1lpRGhiUUpIeDBMa3lVRFhpTFFLblh3b3k4UzNxeHJPblZxS0pKZ21Z?=
 =?utf-8?B?SXB3Nk5HMEFFKzdZRGtpTTRoM1hnQitrUERVOUV5VVNCMTVVTmMvbFNiRitB?=
 =?utf-8?B?MUo2cmF3TTA5YzBzQTBUeWpESmJ3dHdoNVRBYVU3L1V0NGtkY2ZZQWh6SFZ1?=
 =?utf-8?B?bEE0aEl3WFRsWUR2OGxmcmpCWHZNWnhCcHlFREtkZ2Z1c2lHQkU2RWxXKzUv?=
 =?utf-8?B?bmoxSUpGZ2VCTWtKaDZQSEh4U3ZCbG5mYmpsOUJmZ1ROSU1oMzN2bDhSc01P?=
 =?utf-8?B?MTdGdWcza1krSjZNT2V3WU5acFROR21KNkpFT1F3YXZvYTRvZ29QUjZ1K05o?=
 =?utf-8?B?TWR0cXgrUzdneUtpTmxIUGpMcktEdW0zZ0RsNlk1bDNLVmtaRmRYVERSaFZX?=
 =?utf-8?B?NGd6MTAybVdRYXUxSHFqV3ZsN3k4NVJQeHNjck5Ncys3RFlGVitJOURIcmUz?=
 =?utf-8?B?dk1tL3ZSYVBlOEViK1M4ZmYvNWgvZTJuRkhYSitJMFU1WEhGdVZvTlNQZExW?=
 =?utf-8?B?Q3k4cTYyVHE5YUlWRXJuYUdYQmZhWHdiMUJJZnA2ZnpYUzB0WUY1OEk4Tkhz?=
 =?utf-8?B?clZCdnJNR0hMcnluTHk3TjZqWEs0ZkNoRCttaDZ5ZHd1WTB1a24wV200a2hz?=
 =?utf-8?B?SzY3MnNTYWd2b2owZVZhQzJBUi83S0sxaFZCVmE0TzVXaC93WlJYK2l6RGll?=
 =?utf-8?B?OGhhUjFjSW5RM1BVQWpkbmdBWkxwMnJaejRjNXltQlRZV1lCb1FtY015bkpG?=
 =?utf-8?Q?p0XICVWephn7B7jEfaxVX/Wld?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90627ca3-cffc-4cac-6d01-08de314ef2ec
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 03:00:28.7364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8jyJ1+i3sLziHCfC2LqH1Vg9rQXPWteaAOHSjYmzL2H5uy3U/l2jS1Hwj9YiZXWLyllsB3YNwfFeu8fJ5gbPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014
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

On 12/1/25 3:39 PM, Timur Tabi wrote:
> Implement the trait object FalconUCodeDescriptor to handle the two
> versions of the Falcon microcode descriptor.
> 
> Introduce the FalconUCodeDescriptor trait to provide a unified interface
> for accessing fields in both V2 and V3 Falcon microcode descriptor formats.
> This replaces repetitive match statements in each accessor method with a
> single as_descriptor() method that returns a trait object, reducing boilerplate
> and making it easier to add new accessors in the future.
> 
> However, not all match states can be eliminated.  The FalconLoadParams
> implementation still needs to match on the version because different fields
> of the descriptor are used depending on the version.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 91 ++++++++++++++++++-------------
>  1 file changed, 54 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 3008d18f9313..2ad56a387a79 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -125,13 +125,55 @@ pub(crate) enum FalconUCodeDesc {
>      V3(FalconUCodeDescV3),
>  }
>  
> +// First define trait
> +pub(crate) trait FalconUCodeDescriptor {
> +    fn hdr(&self) -> u32;
> +    fn imem_load_size(&self) -> u32;
> +    fn interface_offset(&self) -> u32;
> +    fn dmem_load_size(&self) -> u32;
> +    fn pkc_data_offset(&self) -> u32;
> +    fn engine_id_mask(&self) -> u16;
> +    fn ucode_id(&self) -> u8;
> +    fn signature_count(&self) -> u8;
> +    fn signature_versions(&self) -> u16;
> +}
> +
> +impl FalconUCodeDescriptor for FalconUCodeDescV2 {
> +    fn hdr(&self) -> u32  { self.hdr }
> +    fn imem_load_size(&self) -> u32  { self.imem_load_size }
> +    fn interface_offset(&self) -> u32  { self.interface_offset }
> +    fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
> +    fn pkc_data_offset(&self) -> u32 { 0 }
> +    fn engine_id_mask(&self) -> u16 { 0 }
> +    fn ucode_id(&self) -> u8 { 0 }
> +    fn signature_count(&self) -> u8 { 0 }
> +    fn signature_versions(&self) -> u16 { 0 }
> +}
> +
> +impl FalconUCodeDescriptor for FalconUCodeDescV3 {
> +    fn hdr(&self) -> u32  { self.hdr }
> +    fn imem_load_size(&self) -> u32  { self.imem_load_size }
> +    fn interface_offset(&self) -> u32  { self.interface_offset }
> +    fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
> +    fn pkc_data_offset(&self) -> u32 { self.pkc_data_offset }
> +    fn engine_id_mask(&self) -> u16 { self.engine_id_mask }
> +    fn ucode_id(&self) -> u8 { self.ucode_id }
> +    fn signature_count(&self) -> u8 { self.signature_count }
> +    fn signature_versions(&self) -> u16 { self.signature_versions }
> +}

Being able to see the differences between v2 and v3 in just 20 lines
of code is surprisingly helpful. I like this much more than I expected
to like it. :)

> +
>  impl FalconUCodeDesc {
> +    // Return trait object, the only match needed.
> +    pub(crate) fn as_descriptor(&self) -> &dyn FalconUCodeDescriptor {
> +        match self {
> +            FalconUCodeDesc::V2(v2) => v2,
> +            FalconUCodeDesc::V3(v3) => v3,
> +        }
> +    }
> +
>      /// Returns the size in bytes of the header.
>      pub(crate) fn size(&self) -> usize {
> -        let hdr = match self {
> -            FalconUCodeDesc::V2(v2) => v2.hdr,
> -            FalconUCodeDesc::V3(v3) => v3.hdr,
> -        };
> +        let hdr = self.as_descriptor().hdr();
>  
>          const HDR_SIZE_SHIFT: u32 = 16;
>          const HDR_SIZE_MASK: u32 = 0xffff0000;
> @@ -139,60 +181,35 @@ pub(crate) fn size(&self) -> usize {
>      }
>  
>      pub(crate) fn imem_load_size(&self) -> u32 {
> -        match self {
> -            FalconUCodeDesc::V2(v2) => v2.imem_load_size,
> -            FalconUCodeDesc::V3(v3) => v3.imem_load_size,
> -        }
> +        self.as_descriptor().imem_load_size()
>      }
>  
>      pub(crate) fn interface_offset(&self) -> u32 {
> -        match self {
> -            FalconUCodeDesc::V2(v2) => v2.interface_offset,
> -            FalconUCodeDesc::V3(v3) => v3.interface_offset,
> -        }
> +        self.as_descriptor().interface_offset()
>      }
>  
> -
>      pub(crate) fn dmem_load_size(&self) -> u32 {
> -        match self {
> -            FalconUCodeDesc::V2(v2) => v2.dmem_load_size,
> -            FalconUCodeDesc::V3(v3) => v3.dmem_load_size,
> -        }
> +        self.as_descriptor().dmem_load_size()
>      }
>  
>      pub(crate) fn pkc_data_offset(&self) -> u32 {
> -        match self {
> -            FalconUCodeDesc::V2(_v2) => 0,
> -            FalconUCodeDesc::V3(v3) => v3.pkc_data_offset,
> -        }
> +        self.as_descriptor().pkc_data_offset()
>      }
>  
>      pub(crate) fn engine_id_mask(&self) -> u16 {
> -        match self {
> -            FalconUCodeDesc::V2(_v2) => 0,
> -            FalconUCodeDesc::V3(v3) => v3.engine_id_mask,
> -        }
> +        self.as_descriptor().engine_id_mask()
>      }
>  
>      pub(crate) fn ucode_id(&self) -> u8 {
> -        match self {
> -            FalconUCodeDesc::V2(_v2) => 0,
> -            FalconUCodeDesc::V3(v3) => v3.ucode_id,
> -        }
> +        self.as_descriptor().ucode_id()
>      }
>  
>      pub(crate) fn signature_count(&self) -> u8 {
> -        match self {
> -            FalconUCodeDesc::V2(_v2) => 0,
> -            FalconUCodeDesc::V3(v3) => v3.signature_count,
> -        }
> +        self.as_descriptor().signature_count()
>      }
>  
>      pub(crate) fn signature_versions(&self) -> u16 {
> -        match self {
> -            FalconUCodeDesc::V2(_v2) => 0,
> -            FalconUCodeDesc::V3(v3) => v3.signature_versions,
> -        }
> +        self.as_descriptor().signature_versions()
>      }
>  }
>  

Overall, I'm really preferring this end result. The differences
between v2 and v3 are concisely encapsulated, and the remaining
code is clear and less error prone.


thanks,
-- 
John Hubbard

