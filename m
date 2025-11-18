Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE662C66D5A
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 02:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1550B10E136;
	Tue, 18 Nov 2025 01:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Huw0mw2A";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012012.outbound.protection.outlook.com
 [40.107.200.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EFF10E136
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 01:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFKK6natwiGciNP3EkELZCgOtwjUjA81fBMBkfs9FTPF5JlMftnnGlZzI5OJNbtv+gCmNjtdM4JkDLTwexJJnosirUUfaDITwoKfHMNLb6iQT9oqMoOcKTDhLxqNufq1o9rbzMZT3gsxFkc7nifHxT1DUjy8mzfmQ0LRV7u0/ejIni4JhrMoK80BwCmQx6EZXYD8HD2qgCocFb1+1b7K3DgEM5BkfagOhJ0tjniZ9+eEQ4h0waikg7K8gupB2mQMfX+eBIbiPp2/DgHV30SHEaKuTh614aSbaTQ+PZEf6TK3o6/TRzouaEmE/JIGsQYmEdnlaODYLBiGa0H8X3+roA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTzpykpLytR1nm/7LTKijG6mrEB/FPVbdXTblucQHHk=;
 b=wUyeTOGXC50NkwB6k1dohmh7Cksi23svwVbse0A7RaSRXrQQzmnkVjZUPjZy2xSkLyWrgPm4Bpy4Vi7uvn3zVinkA+lLFO2thtj8mrVr1KYT5DFx1DgMw/vAN8oSu4OxsvwCsympbJ9k+URp+y7g97dmm9KQl/+bGWGZsPfxWVthPA+DqXKHaPXO/QXEfDhhsj9JSwLnkmkZYc94WrReG/Z6lLwyK58wK8OAdhmHGS13J9ctRg5fg0TRmYqZtJkFrrQbAwAIavzREVMc7/yevI66I38eDKWVoG1GD958f8E4rjymdyVlB3w3mdhlaQeA9plCsfid/l4RgcB1Dipwzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTzpykpLytR1nm/7LTKijG6mrEB/FPVbdXTblucQHHk=;
 b=Huw0mw2AFpPpMT6HaNAhWOv8qU3iKA7KVKZgzMwXn24tPw00BeQneAf+nQJZuK76+tBn02K661N9YSTchmvxu1hlDd0j2/7EgtF+QKU2hDoLk2qFm95izOoaPNFrY2RChCdE+UYw3ahF8wiX1dkGU7yZrtQWqW4nzF+Dy8vxeNm3q0IYRdTv08snUSrPHOHIpdoHvha1YtVR5N42ad71tL72ls1MtW1FKgEwylDohT1c7KpLwM1CF21Goh4UfCRDlixW3oQvQjvEed1Z0akU45wYVJgC8Jzcvdv497CtO4BZ75Gbkq9eV1loXJN6G9nUJ71H7shb7Dqd+G3j1CHmtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by MW3PR12MB4412.namprd12.prod.outlook.com (2603:10b6:303:58::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 01:29:38 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 01:29:29 +0000
Message-ID: <64faa47a-25cf-48d1-964e-c3d3d1b456c1@nvidia.com>
Date: Mon, 17 Nov 2025 17:29:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
From: John Hubbard <jhubbard@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <20251117223324.GA1094429@joelbox2>
 <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
 <20251118010424.GA1131446@joelbox2>
 <3665d524c89605169d5c283b621394158e0f6067.camel@nvidia.com>
 <7cc3ff01-1e39-469b-ab0f-0814e314d570@nvidia.com>
Content-Language: en-US
In-Reply-To: <7cc3ff01-1e39-469b-ab0f-0814e314d570@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|MW3PR12MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: 397b402a-f0fa-4968-be2c-08de2641eb1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEt0YUFuQVAvU1BXWEpsNzZRTlJPVTRzVDZtNjd6Nm9sam5PR3JBYUxtOEhD?=
 =?utf-8?B?M2pQWnM5Y0dCdDZNR3RTVnphK2lSWFJNcHFwZGgrK3c5SnZVd1BEOFg1Uk96?=
 =?utf-8?B?UjZHQUxHT2dYSkgyNU1wdTRlWlJ4SGxHL0J4L1VibC80QTN3d3MvUEp4YktV?=
 =?utf-8?B?Z2RmcWVKNjAvQjJlbDhjSUszQkNqOHhjTmhqNGQ5N0lscGIyRE85Rm5EMm9Q?=
 =?utf-8?B?VmRGeGVpNnNqL3JCc3VtWkp3aUYvanoyTitoM0c0bnlUaUd3ckU2OW1IN0wv?=
 =?utf-8?B?T2dhYlh0MlYzaWFVSit6TldpYjJKS0dNbGlURDNsazUyWHJIdTlrTkU5TkE2?=
 =?utf-8?B?dER3UjJ1SGNTbG43OHFzWGJhejdNZTJYWXBJZDk4YmxjVEpySko2RElETk0r?=
 =?utf-8?B?ckdhdnhnWDU1UXZSWFVucUR1Yk9LS2Z2eUVzRFNnb3c0WEpzWWluZzdwNkhS?=
 =?utf-8?B?bG5tRWRHdGJlRnlvVjFjZ1FrdUxDZTdTMDYzM1JrLzhtL1hoTEdaOTlEVFpM?=
 =?utf-8?B?NnhjWGsxZHZBbll5Zk1uanVmTnJjMHQycTQ1bzJWb0Z5TXF0WjV0OG8wYlgx?=
 =?utf-8?B?RmtYZngxQ1FER0JwekhMZTJiaVhQQklyeURVRXlSTE1pLzlUQ0l3VnJTMVZ0?=
 =?utf-8?B?dFM2blp3UDlBNUMxMUpyTnl2TVlXVUhrMm1nYzlSTVpGWW90SlRYbVUwSHk0?=
 =?utf-8?B?RzdUdUEyRHBnKzd1SWd6WkdGWWlUdVdSRXVPczdFSDFOZkREOWxORmhzVlRr?=
 =?utf-8?B?WDFyNmZDY2JDa25URDBxVTAzeU16eC9BYnp3VTg2dVBWZWtxUVZON1dpcHl4?=
 =?utf-8?B?M1pURnNkUGc1UFNjZ0F1bW0wbjBuSDE3NWdJR2QyV0QyblFtcHJQM1hZaG81?=
 =?utf-8?B?Y2p5VGJzbkJ0bG5BMUZ0M1ZSUFBZR2pSVmtrbkJURWRxRHBiNEo5RmxhR01G?=
 =?utf-8?B?bGFWQmlXYUFvcklVcE83QnBoQ0ZqWVpXeU5aQXFVb3VNRElOV3lsYnJ4TWgz?=
 =?utf-8?B?WXJ5QUl1dG5Za0o3dDdNd2F4NXZZRkhyVEtrQ0lDVVBlUUFadmJIdytVVllK?=
 =?utf-8?B?N3JFLzUrS01VaWZxemdhWCttbURHdmdNM1lVU05zMUVhV1VMMlZsZ3h1NkJP?=
 =?utf-8?B?SU9aTXlGcGVFcHo2TVRuRCtvU2JDVHpQaW16L2wrTzZxTElXK0Jld29MWjRt?=
 =?utf-8?B?MHN4VGkxZU9idVpKOGJaOWM1aWduMUtZYmU3THk2WCt6b3ZKeHFLamJtMkhx?=
 =?utf-8?B?bkR6bnE1RDZzWlM1OGtlUVQyVGtNYlZ3K3F3bFIyUVJRV1BVMWp5a3lwS3hM?=
 =?utf-8?B?VHB0YUpGaGVZMVJLNTBXRzQ3L3ZyQ293WlZZbWxtUUMvZGVvNE1sYTROZkxY?=
 =?utf-8?B?OWlkVGdyN2ZXV2NSYWFabUpzaXg5MldSR3lEc254YWo1TjlVM1R3MVUrSW1z?=
 =?utf-8?B?RHEvaW5xNmQrMWR4QkpZYld1eUpCSytobkF3ZGdoRlhsVGI5bFZmS3E0eVNs?=
 =?utf-8?B?b2FiOXBJdEdpRXNNaFJiZy9xRVBMWEFHbTJaazQ4OUM5WVRmcW41TmxyRklI?=
 =?utf-8?B?K1A4WGtSMDgxZ0JoOEpndWRMU3hYdTFNMkF3dXRVOUZFYUZzZjVpMkRiOEU3?=
 =?utf-8?B?OHZCSGJrdzZCTVBlYlZXN1JscE1UazFuc2NzeHBaaVRMQ1dNZ1hpNmF4a21N?=
 =?utf-8?B?M0Jybk5HUW1acUw2R0t6S3kxT1B0RUFqY05xbW8rZ080Qms3NkExUkJ6K0E2?=
 =?utf-8?B?aE1BMkRNcVNSTmRMbFV6SzhuYnY1cXNhZ2szVHVqeW9sZ0xvdHNxaktqL0lK?=
 =?utf-8?B?ZHR6NVZabElzaTBnakhVSExieTVPUWhtMjhoaFdTWExRcnNwcXRuU2V3Zy9K?=
 =?utf-8?B?aGFCWFhRUnZZVVJ3Tjd6VU1Bck9WRENFTU8wRTc1UG1xZmtyZmZkOEpzaldL?=
 =?utf-8?Q?5/N3WkWdEU45ga7sibiYh4VALh0YB2oa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9412.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdQcm5QMXQrWjFZUUZnWXFPTnlYV2xYWHpTMU1aWC95YWVlM3lVck9KN2Z2?=
 =?utf-8?B?eVZZUjNyS0VpQWFTRTlpSmx2MWlla0JTNlVzT1oxeVg1c2R0ekNQQ1NCMWdL?=
 =?utf-8?B?aEpnZlBWdzhSYnNqRlpQTWZiOGx2NGJiS0dGVElyTlM2MHUxSjArb3hObjNt?=
 =?utf-8?B?Q1lwL1NaZk55OTlaU0tiRnFMK3BKVm81aStYTGVRQUU4MHhQeXFhVzljMWha?=
 =?utf-8?B?cjVsemczSHBTaGs4bkNVOUZYREI0VkljYlJvZ2xLSWorbzA4TE9hRk9CTWRM?=
 =?utf-8?B?RGJOQUlhcWQ4RDVZd1BZZmVMZW54NTZ5WUdwN1pyeWhyM1lJNktDZjhqRzB6?=
 =?utf-8?B?dFZlR0NpTzQrT25TN2REaWFDcm5CckU3Tmw4TU84MC9VOE9MWE9KdmFYTHNI?=
 =?utf-8?B?dWhWa0pmN09NTmcwdGVGVUIzZVkzNFJETkQ2a3loa3ZzUHUrWkNiRGtZVi9P?=
 =?utf-8?B?c25nV1g5SjFrOHY2RFQyWVR5czk1MmVUUzdFNWtvQkpMczN6WW1ldDdGRk5h?=
 =?utf-8?B?YngzYlp0M3h0V2FGdFd3cEhEL09TRFA2OFZuQ3ZFSlhGT2s0aHRyVlI1Ry9n?=
 =?utf-8?B?TitLQ2dlc2llTCtoRXZLcGpvU0dma0tKMXNoZWtwMGxtSkgvTDlvV3R1cldL?=
 =?utf-8?B?ZWNqaW51ajlMMFBUV1JyRWpoT1lGUFc2K1lGa1RLRjVqUUdqZmpEbEVWaUtv?=
 =?utf-8?B?dG1wT0dRMnBhUDducW16NHJDWE52VWg2bGxoTVo1dGt3UlVsblYzQjhXelE1?=
 =?utf-8?B?cFYzNklyNE5WckI0bDZBMENDQVBiY3poRHZvMzZVVHRBL3dsSE5pZFFObS9P?=
 =?utf-8?B?OVlDZ2Z6WWVadU5MVzI1eGRIMGlnaGN5eERiY3FwQnRmbHJrTGR0YVkydFdZ?=
 =?utf-8?B?RmM1eTdEV2FsUGVBU3VnQitlbEpiTjcyb1RUVmcxMGxxRjdXUE55TkFIcitE?=
 =?utf-8?B?YmZaRW1DS2xpNFRiamJzVm1CY0pwUlZSeWhsRWxuRUxqaktNK1hhdjBmZlNH?=
 =?utf-8?B?N1JZa2tXUENSZ1U4cXNQR3RJYkQ0TWtEQmR2UWFWWVd2YStDR25ibmtueVJG?=
 =?utf-8?B?K1NJdzZjbDArcmlPZzRnc3JTQndEMi9DeDYrL09IWjlyZTdCbXJ3c1JLZWcw?=
 =?utf-8?B?SDBERW9raTlzYUZIZFFnWVNXQStyeEFkWFJCelFwa1FzWlNLSm5nMi9sS1Y1?=
 =?utf-8?B?dHVHcm5TdUIwMHFKTVR6OWhkL1pDNU1GTnhHdFRPb3pyTHFOQ1J5QjRIbVN1?=
 =?utf-8?B?WEd2Ly81UGNpS0tDWU5QTTR0VDc5Z1lsdmgxM0ZRVlg4bkxBREsvTVdXM25G?=
 =?utf-8?B?akF6U0N1bnVXOHdtUXV1Q2pmR1g2MVgrV2NoZTczVjd5VVV2dXpnTHEvZmdy?=
 =?utf-8?B?VFlSZG55ZndRNml2Q2xZdy92ZnRiRDhBc05rZlJ5cUtyRWhUMWJoVk9TU0pm?=
 =?utf-8?B?TEo3V3hKTnE5Nm1zai9ncSt2UDYxdjQxQlFkZlEvdy9KZjJ5M09XMXZUZ3lW?=
 =?utf-8?B?aXlYazhRZmozMW10WktvNTVSeGZwQ2drYm1iTzl5T3RGb3lJcDVhK0tqNzBK?=
 =?utf-8?B?eGhBY3V1c0dIdmM2b0JPODlRWEpGajRoditQWWd5cUN1THljM3kxcVIvS0tB?=
 =?utf-8?B?R0xwS1B1YWllN1pmVGZrZUpRSGtZVUR6RHhVTHQ4SGJNL2hNT2RHNUJ2ZUU3?=
 =?utf-8?B?dW9HWXVnRDRneHJtN3FMV3RKSXBiSXFpTDJXdkhIUHk2eU1LWlhsekF0QkZZ?=
 =?utf-8?B?NlhIQjJrWnExRnhyS1NEdU0vWjVaS1JkeFVnZEFPTytoUkVyLy9lWC9rMFVE?=
 =?utf-8?B?Ly83M214OW1DUm5SZ1k5a2NmK2FMVFMxZTN6Q0I0RmdPWng1aVhQenNWdk91?=
 =?utf-8?B?VG9QbjRkaStVQVMzcXA3OUNXVFNmdjM2eGxpR3R0cXc2ZmFobjJJazlCQnFs?=
 =?utf-8?B?elV6dkFxME42ZWdRMjFHUTJUUFNMZ3FKb2VQZWg0dGpUN1REVWRmVndvbkhX?=
 =?utf-8?B?MkdhckVLZnloZkJTUncxbVRneGZDM2o5NVJXaDgya3dxVzVWN0puVTdzRnhZ?=
 =?utf-8?B?ZUswN0N3YzNZMnFYd3Y5NWNSQmoyczNpZStFczZ0OHEzcDkreFZTVUZpRUpX?=
 =?utf-8?Q?rfgdTWpQEESzbwIaK7F33ckJS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397b402a-f0fa-4968-be2c-08de2641eb1b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 01:29:29.4338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gamK3g2q41UXbpiwY2BN45Ek/ITWBAw0xF5oUp4qXSxfgmIpHUOaAMt3md1Tc2GYBQMKeKy56i2X+GGKtNKMQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4412
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

On 11/17/25 5:15 PM, John Hubbard wrote:
> On 11/17/25 5:06 PM, Timur Tabi wrote:
>> On Mon, 2025-11-17 at 20:04 -0500, Joel Fernandes wrote:
>>> I don't care about the if/else as much as I care about the opportunity to
>>> just specify FalconLoadTarget once instead twice. I think the match here is cleaner for this
>>> snippet, but I am Ok with the if/else as well.
>>>
>>> Something like:
>>>    imem_sec_load_target: FalconLoadTarget {
>>>        src_start: if chipset > Chipset::GA100  {
>>>           app0.offset
>>>       } else {
>>>            load_hdr.os_code_size
>>>       },
>>>
>>> That would be one more line of code, but pretty much the same.
>>
>> Interesting.  I would have thought that duplicating the if-statement is the higher offense.
> 
> I think the use of traits here generally makes this all a little better
> overall though, don't you think?
> 
> Traits are easier to read and internalize quickly, and easy to maintain
> too. They are yet another way to make implicit rules explicit and 
> self-documenting.
> 

arghh, I replied to the wrong thread. I was looking at patch 9/11 earlier,
and had that in mind.

Here, my comment is not applicable.

I'm not have a very productive reviewer day, to say the least! :)

Sorry for the noise.


thanks,
-- 
John Hubbard

