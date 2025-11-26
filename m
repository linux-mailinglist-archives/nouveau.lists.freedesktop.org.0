Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978D1C87A4A
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 02:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BDC10E4DB;
	Wed, 26 Nov 2025 01:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GljNTDVT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D22510E4DB;
 Wed, 26 Nov 2025 01:09:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czM1WsMmWRJBaPjPZroFDU89xZ/vzTG+mrM61nPOrt7w6JN4UakHanG7/XyyWwmtasBARZ7/bRz6tQscXla4isUl4JAJIB++A/OdlXdYHqioOk8nU/oqr3cUTWf/3cU48hBJ3sQuvk1UpB17f8YKgLNobfbRBSr8E8VKQecjKkUhdL9Jc7G4e/O0XoScc8B399YjlYo6rPfuObocgYTE9qjkcphbD57xitNTz/WfJnUf/xVqknEBnXXYdUdRdr60POg7ZQ7QKDpkhaO0FxxfTIF9uL7qKcykLC4oIttD0mNkWELkP5sljTP8W6v3aqyhfl0ycytJD9zxsEp8fWgfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGFSUbLTedSIFxhs9iX+sUioiLuvjqeuz2l8+7wTd4I=;
 b=aGqQLbAO+xpQvp/p7yIxE9MsCslcHlyg9vu+wqIGGEwQsOzWdzBwuWmwmpWDb375i6VzMDpwrEBQTFrN1wuWbLmSuqA+umIgoxGUdcEr0kR69RMwZDyFCwCJtBvZbxj6Ya2uhho6KXCYllwbKlnzLCB94BhE7aV12HuMQaQnxNm7BMigJp2I14B5/wV1gXubGjbkHbYDG0BY1uEsU0nKrQBERJ3nwXgllDUMZZHuNcMG6EWMKlmaXZzZp2j5D1Bhd78vjeghupMy9lv8gigUEuVjDhb82BFtM3lREGT7VK/7fykia7Omrv1Zes2p81umzhpqG1Xs0mP3syyXCghPzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGFSUbLTedSIFxhs9iX+sUioiLuvjqeuz2l8+7wTd4I=;
 b=GljNTDVTSIBH2VsQgVBPlCVkTQk4deK7nMNJNTMVkJpJc9mmaczec51nrn5/57F7oFDyXl3b7kZKs5ol0fjLk1E7FVEXj+BeftlMMi7fOspu7KqFDg5GCju4pHj4rE+HzuDY0nq5boH7iQbGRqMIPSn7yKWmh/AYOXArXDXnlASvXCxNuP8godaf4ZkIcSRn4cSOqN2/J2sxowjWu5Zg5O8XZoYsaH+IH/DLl93PyPrluUTmh7cdn7Ww1avG8V9m8Hg1pf1os3XPJcCGnpYxKyegfWecSChDFucbCczzIu94fbMkTWqnFgHwG+hvVH2/pv3pncrD19krDboSdyY3Uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW6PR12MB8759.namprd12.prod.outlook.com (2603:10b6:303:243::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 26 Nov
 2025 01:09:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:09:22 +0000
Message-ID: <d75a82c0-f275-4437-bc99-21e85f1dc9ea@nvidia.com>
Date: Tue, 25 Nov 2025 17:09:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2>
 <0808b509a969458003accdc3be7c262500b305f7.camel@nvidia.com>
 <054d9c84-4231-4662-8847-4028228cd290@nvidia.com>
 <DEI81MO6OJNB.180OOZADPPCV3@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DEI81MO6OJNB.180OOZADPPCV3@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW6PR12MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dec40e1-9e48-4861-dd17-08de2c886ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVBoQWljdktrNzZoYU1FYTI3b294V2c5MDduSHFWcjE4bmcyeU5lVHJ3RXJn?=
 =?utf-8?B?bW1tSmExZEp3MnR2dnFXdjNUamY1dTlGUStMbFRHcU9RQkxRM25XRUpvOExD?=
 =?utf-8?B?aU4zRzE4ZTVHYjhRTyttYUY0MDV1Y2ZIZyt3SG1jZFhGcGQyVzJEaWpYTFhZ?=
 =?utf-8?B?VEpiVlJwUCtFdVhQblpnRHNlNk9iS1BkYldoblJmUkJxQ1Nud0RqaVNFRVFG?=
 =?utf-8?B?RTc3Z0dHbDg4TUg5eGdMMkFHSWdmdVpuZkhpVThSOVpCVzd4TzlZQWhZQnFF?=
 =?utf-8?B?ZXBSekg4LzR6NU5tcW00YnhpZEVGdFRQanlDTWNVYWdNckRLeHYrNnhVak43?=
 =?utf-8?B?TEhMd2lqSFNjK21QYldkMEE0TnNlMFdqWTVIQ2twZXF3N0R5dlVtWStaejBY?=
 =?utf-8?B?QWQ3clVON2xydXVuR2NFY0JXOWFtRi9YLzF0Q0xvSk5nNDRFTHB2RWFaU1NE?=
 =?utf-8?B?Z0tEQjJjZWQzM1k0dktxK0djMUJ4MHVvZ1YvbzU1UVk5L3Flell4cVRndktS?=
 =?utf-8?B?eVFzWG50Qi9qcFZXcHY5L29QblBUNTdwNUc0ZWtzSkRmb2ViMFpTeENmb2xa?=
 =?utf-8?B?NUhlOTNsa2tjNElOQTEzcXNxc0NUWU9sRVpjRzh1dGlnRXU2U1YzTzRFWFlm?=
 =?utf-8?B?OW9id3lYcWY0ckJtVG1hQXRtMmlQZ3lZYmZoeXMyaTRRenlndEtrTU8xZ05H?=
 =?utf-8?B?UjRKVlVBbGpwclRLUnpqRTJpLzVFL2pOSFAzYWV3VlBtbVltRGhPNEVUa2Mz?=
 =?utf-8?B?Ymp3TmNoTUsrazNqbU03cHFsZDNhZzJ5cjRkWmt5c0VXMkFpVDhnU2l3SFo0?=
 =?utf-8?B?N2VGWVVRZ2JtWlJHeDFvdWgra05EUGdmN3FabGZGY3RWdEoycEIrTlE1WDVR?=
 =?utf-8?B?UW40L2s2TWI0ckJaL2VRVTUxa3paS3hNYXJWVnV0c1cxbVBZYnU1cHNHNFY2?=
 =?utf-8?B?UU1ac25nVGRXK1RFZ3NUZDI0THBIc0VwLyt6ci9mNVRCK3Z1cmRFdDFVa3ZK?=
 =?utf-8?B?d2hFRVkrOUR3S1JodnkxYlc2S1JCclpvTHR5M2N5UkRLaXdCV0FPdGhsWUh5?=
 =?utf-8?B?enQ0U3Zmdm1UNVk2TDE5ckRFK0I5emp3V1RuNEZ5YjI4WU9qdnVWY1o0TTdX?=
 =?utf-8?B?VUxweDR5U1c5ekk4bTYvK0hzdTdMeXA3UGVwYkcvZi9vQWMrelMxNHhYcHBu?=
 =?utf-8?B?Yzd5TDlJU0JUWkM2ZGpRZkZraDRwZmtlaVBOY0hFLzJKc3JiL1VYM3NUN3JM?=
 =?utf-8?B?YytKSmM4ZFN0QUdyUXZ4S3VhcFA4SWFENVlGVGF1MllPR3pMeWc1WnhQTU5l?=
 =?utf-8?B?T0lxdDZvWHBPZDZpR0gwMWcrWGV5d1JGYm5qcWZuSlYySDI5VG9aTUZmZHc3?=
 =?utf-8?B?ZndXOGRLc0JDcDNPbzduMkZxeGd5VGNNbGtieS8rS0JYNDdYcnRiSVVQT2w2?=
 =?utf-8?B?L3l3RURZczlUUmxnWjZPeFBXb3Bqa25MZjdYYURhN1BaeXlPc0l2eS9VZ3pP?=
 =?utf-8?B?QjI0Z1hIbENIMjdiTHRvUGwzcVkxM2dOME1pY1c2SzRJdzVlTWxxOGs5MEYx?=
 =?utf-8?B?M1Y2WUptQzhxUmhKaE5TL2NSYjRneGdpZDhUWnRxWDEzNm93cTFiNk8wSTV6?=
 =?utf-8?B?VmpsS2JXQUp2eFliMlVZWm1SQ1puUWEvRFovdkoxQmpIVTVlbzRxWHgvaldt?=
 =?utf-8?B?M29BaHo5dzdIeE5nLzZDSUpzUHVabnlwQmljOE9BaXZRczZXNUN1YkFKMUxi?=
 =?utf-8?B?L2c1UURWVXdabnpCZTErWHNWbDEvUXN0K2dPMnNZaUttN0dkLzJkL1M4M2N5?=
 =?utf-8?B?emJPQ2tEY1RmVUIyVnpnVnVDY1VXYlM5RzR4cW1ZZUZ5V0tDc3lHKzBQdHd5?=
 =?utf-8?B?LzRqcFo1d2hJVUswWWM5UmZsQzl5QVh0VFMydEI5K2ZFN1BDV3NCTzRXeXdy?=
 =?utf-8?Q?/RcoXxkb0LUAOgc2j0hwKOw3TtXJCwEE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3NnMVh0VVEveVBDTW0zS2FTR0k5K0RpendleHhZVm1JRmR3U1FBTkJDR01B?=
 =?utf-8?B?YUFna0VMN3VKNSt2MFhCUUZHaTBmd0RVaVdBV3FBWEU1cHNQTXROZ01sVjRJ?=
 =?utf-8?B?VDhuOEtnTWFqRUg0Vk12Zk56MGUvSWpPWkREVnVtMWkxQm92Si93a2htN1F6?=
 =?utf-8?B?dFYrZlVHQVo2RVFLU0tPN0pETS9yV081SDRhMjdVb0ZkWElpNnNYbzdMWGZG?=
 =?utf-8?B?R092WWl4L00vdzEyVUlWdmxCVUJuQWxkTThuK2o0M29GLzVVL3lpWjgyOXll?=
 =?utf-8?B?Z1RjQjRTNjRQVXE0QVFKUFd4WXIxRjh4c2J0U0hpNm56TkEzZzJCU1RxWGww?=
 =?utf-8?B?dG1ERitKZ2pJemJnaHBnQzZBS0NjVFd0YXVMd2NYdUpERXE2MTEwWlB4d2FI?=
 =?utf-8?B?bGFzN2lkTmFpMVlZd28rb3RjL3RrbHZLRXBWVGFkaHJpcytQM2NLcnpCOSsz?=
 =?utf-8?B?MnZZVlN6M2VLbG5tc0lSTDIxWCsxQlNmL3ZmbmdjYU5JWmFtdkdGdzhSdUh4?=
 =?utf-8?B?WjYrUW1tZ0JCc1BLUEI1cjdHcTFzQ1V3aDZPTExldktiL2JHaXRLWG5QVUdT?=
 =?utf-8?B?RE83WVJIRUJuVC9IVWs2MzN3VGx3UG8rRENRRS9FYUx6ZGNWblBtMnRHZnR1?=
 =?utf-8?B?am9ZZ1d6VDRkZDZrY3Y0RlpNMmE3Q3lDQVZyZXlSMWNQOEtzRHVBN3VGMlph?=
 =?utf-8?B?NU1Ldy9XMmRMVllaTVVHUW9tTDAzVTRGSFc5UGdIUVoveEU0OTIrV0E5MXpV?=
 =?utf-8?B?YzkxODE4UDN1U2pVaGhoM0VUVDV3TXR1SWFGa2lKM2pTbmJmdVlxaDB3OUJu?=
 =?utf-8?B?dTJnQkQ3aGpoYXNCbUFkKzViQzVaUEpPdi92OGxGQTE0UGF4b2JONklYK2Na?=
 =?utf-8?B?QnYvdGE1VTBYMEQxaFNweTFEcGp6ZEJ6QkpEaS9uenZ6bVBPTitCZlJ1RnYr?=
 =?utf-8?B?T1F6M1NBUGFGRG1CNHMvSmhuRU5ySzE3VUhxMnJ5cFM5d1Z4UkROZFRPUm5Y?=
 =?utf-8?B?MmJlYUJvMkI3MGhVK1V3Y2tjR2JYekkvL0l6S1JRQnp1VzRueHRBNnd1L1p3?=
 =?utf-8?B?czd3M29paXFLbXN1Um5STklqUjZwQStHV0tWUjB6RnRXdjN4UW9SUHR4RFBk?=
 =?utf-8?B?SWJJeWNSWkFxQTk5dDBJdUI2c2N5SGsreXVjMElVcXNMMG1HTUNTaHM2Qmlz?=
 =?utf-8?B?d2cxR3hNTG5ZWXdhWUFEaGM0bnJ3WThwTmZZd3F6Qk52UE9iSVQrY2Y1RHVq?=
 =?utf-8?B?dkx5NlA1UC9mdmQ1WElEdzFiYW9MYzBqUW5tM094QnRKdnhMcUNxZlQrTXlD?=
 =?utf-8?B?L1Z3cXdKYXNzdUg5YmhnWXFobm1wclhSZStzNGYrVlVBWlBCSXFCWWp5UDZ3?=
 =?utf-8?B?K0Y1amVPc1N6TS9UbE54Nkplc1U5L1RCaDg1T0RYTFNaM0xpcDE5TDlFZHRu?=
 =?utf-8?B?bmtQZEFjQWdDVUUwdmw3QzBXQmdJaDkvd1ZPNHFuRkxHM29yUnh5RjFEc1ZW?=
 =?utf-8?B?TjdzYkt5MmJ5QkxWKzJnb2lob1NWc2Y0Tkd2bTliOWdTaTFrWGtoZzRNdWxj?=
 =?utf-8?B?VkZyM0FsaHhoMHB6NUgzTGFEUDlzdjNzNjVYL1Z3RS9pY1lSeFZHM0RudjNP?=
 =?utf-8?B?RkdPWFlROHB5SGNTVWlFK0NsN3hTOHNEdWNaazZWRnN6TGl6TTg0VjM0WWEr?=
 =?utf-8?B?YlI2S0lSZVNPdTNDVWpmSlRlMFlHeDQxVWlTT0ZhanpUSnFWMWhVQ0tiM0xM?=
 =?utf-8?B?NVd5Z21OWnI2d3J2c0Fud0dnci9id21lME0wRHl3amQ2T0RuRlYza1BHSGw3?=
 =?utf-8?B?OUxOUHlnUHNpZ2E5bWNyeWthL2YwcVduMXFEQmYrc1B3OGgyMzRsQlllK2xU?=
 =?utf-8?B?Zi82OUsxQm5PelhiZXYwc3EzQmppdnJ1N1JvSVAreHltT0l6bk9CTWxxdkdW?=
 =?utf-8?B?MFdOVWVNT2c1WnlCY1Vib1k3YytDaE8rbW53T3B4cmVQNUNuNVhBSUg0UjRo?=
 =?utf-8?B?OTcxajJuSXNwbTVleWJvSDY5TXZ4OWRpT2lUNlRnK0F5SnlQZ2tadlRHTy94?=
 =?utf-8?B?b1FlVEpCQ0xIbjVueG5rL1ZUUHNCa0Z3Y1BjZ0dIN3gvaUxocjZyVGFjZzJH?=
 =?utf-8?Q?WyQHfGCz4am8/dlmxGxc/CpB4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dec40e1-9e48-4861-dd17-08de2c886ec1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:09:22.0821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M55xpzSSqDn5hpKNWrdpquvHWDget0ZUck9YikDiGI1DtPHTxYhYVmtnPrbsvullPfQOeX5Wwg4owTFwTc50Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8759
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

On 11/25/25 5:05 PM, Alexandre Courbot wrote:
> On Wed Nov 26, 2025 at 9:31 AM JST, John Hubbard wrote:
>> On 11/25/25 3:59 PM, Timur Tabi wrote:
>>> On Mon, 2025-11-17 at 18:10 -0500, Joel Fernandes wrote:
>>>> // First define trait
>>>> pub(crate) trait FalconUCodeDescriptor {
>>>>     fn imem_load_size(&self) -> u32;
>>>>     fn dmem_load_size(&self) -> u32;
>>>>     fn engine_id_mask(&self) -> u16; // V3-only field, V2 returns 0
>>>>     ...
>>>> }
>>>
>>> Isn't it more idiomatic for engine_id_mask() (and any other field that exists only on one version)
>>> to return an Option<u16>?
>>
>> I don't know about idiomatic-ness here, but we have been trying hard
>> to avoid Option in fields. It really makes a mess of things.
>>
>> Other approaches require less special casing, we've found.
> 
> IIUC Timur's proposal would not require an Option as a field, just that
> the method returns one. I tend to agree that this is more idiomatic.

OK, then. 

thanks,
-- 
John Hubbard

