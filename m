Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0106EC6CFB2
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 07:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D431310E582;
	Wed, 19 Nov 2025 06:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SWRQek/2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E7110E582;
 Wed, 19 Nov 2025 06:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVnSINXT/NE7xfQflSn2rO3tU0A0gC0RvMhYbtYQdTbycahQdQpor7AFoNEpWDgtMNo8aw7iY69rBvaIc78+D7D2kMxmaVd8tF/wza1A5nMS/GAjBqaZLtfWmfmKGZVndbZkrqmRN+WjtjOTrERXXtTQ5BeQqUqh9XMRzdNfoA3n6brrcpKt72T7MWqj70dgSKbcywxCVjbA4D8xXbsLb19CAG0mDdp0mzwIqwJqKc9SYFjbMJ0TUe2WAkL6PZkVahewszTVfvNbmxytAXtRvbJqDa6p9Ugn35ttho6onSyXZ5grIpGnCBVheBNRacpBPbrgMzxxNgxpkta0OG9ryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyLDB8mrTqJLMJKqZy3cRK1KZkeYzuss8XwCdBa4hVk=;
 b=guESubHf7rBIcdRAfvrmaVtaN8rV8j8+uM79wj97RfYzbzix5WlBLtIWXJ38wukO3SWYgwD7jyJx7J6hgtw1omKoOBCRB7QO/CALLnKlSV/B+XyZpgzD69hhCX+n4id1Vhs5VV4atwv0RkfrXt9GhqdHSQoPDGP6lO/RqErAyWqeF1jJFT+9Ht1cbxoKuDqubjDaO20Ybswy1B2Eo1g+S980LEmAjlB1+ZXsJmzyDLTCp5DPyzXdUkhlZAg3QY0fm+PpOYwn/wpJ9HjmiT4jsDmq4Tua+MQrHi0NDqV2DMo7eb/g7SZfnHiD92fwWeOfEPswy1xeEccmTuV4ELtnvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyLDB8mrTqJLMJKqZy3cRK1KZkeYzuss8XwCdBa4hVk=;
 b=SWRQek/2skiihEwyaKWH8MCXD1l6LqZrIkjBlyVLvdlmuvzmClAYFSnc1pHaDQPd4oocp36KdzyYtDBHrWK1vFO4Qv1uKhhYTdeR9espeU+NhHuosPvdzi4rxjytHltCCtb4wv78C3WpTICl9S+mtlSILhxfrgZf43Wc/ElwbltFr1X0pl7VHQY1b+Mz9RzOraVjViowQnHaGBfQ+f/8hjRb2d/TFcRFPbs6oLLqwEMwKSSXgdPk/0m4et/4kGmCM0qSO3oCxgX99a1epDdQ7X6HcpksKHwJUygWXi1fXMg7aUQa9SJ5CFCShrj8Q48sERY8ZGy5ORUlFmPSxsIvMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB8143.namprd12.prod.outlook.com (2603:10b6:806:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:51:23 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:51:23 +0000
Message-ID: <1dd37cd3-539a-4698-bc9d-a99610fe96f9@nvidia.com>
Date: Tue, 18 Nov 2025 22:51:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
 <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
 <76f2ab5b-e2f3-4abc-943e-251afefaac96@nvidia.com>
 <DECGXPKLO95J.Z6NF92ZEXY27@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DECGXPKLO95J.Z6NF92ZEXY27@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca4b935-1ebf-4516-a800-08de27380db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T05qaGphS0xrVmtWWHcvWExRVDZRYmNzaEZJeFBpNG93SDAvc29FSCtFQzlU?=
 =?utf-8?B?dTdSZVhQMVZGckVSQ1QzdzB2MWpJSmZDSU1jek9hUFZUajJXMk1pTFNvRXAy?=
 =?utf-8?B?WHZBMGowNUdUczVIa0lqT2phazAzeVpLNmxtUnZDZ0VYOVpZUmptdmNONnYv?=
 =?utf-8?B?Y0tIOXNnOHZTWG45d1h4eHR1bnVpM21IdTNsM2JmV0RPWTcxVTk4M3p4bjlE?=
 =?utf-8?B?bStLb0hNN3dYRlpnbVVLbFp0VkNOSVJaaC9sU3pMZ2tRUzVIRlpUekp1YUIw?=
 =?utf-8?B?T0YwUzVENmRiZ3l1UU5JN29sM2RnOXRPZmMvRFdUenA1Z20raUhkb3VKT1o3?=
 =?utf-8?B?QjlpWGJaNkJnViszOEphTjFYTVZuZG5rcGFhSGRvaVZqQ2VScUZ3Y0pyQVNV?=
 =?utf-8?B?ZWwwSzVxTDI0ZUlOWm1kNWpJR20xaStWVitlZ1FhbjdmeGhoOEFkWWJxelRa?=
 =?utf-8?B?azQ5T252cFhtelFPRDAvQTZDRWpFMmpVUXpaZVVZRCtQVGtUR29YaGxheVp0?=
 =?utf-8?B?aElab3k3RTJlRUpKWk5TbERIdXVLbEgycEtFVkFYTW9qWFRIeElCRkZqdWVn?=
 =?utf-8?B?cndoN1BjTmh3TWszRVM1Tmxkdlp3dkVHRDBXZ1ExQm1NSndPcUVFVk51dGo3?=
 =?utf-8?B?ZldUWWY5UkRWN0ZPalJLRGlJTWRkL0F4V2pUQk1CN3hkbjl0aFVHZDhXSCtq?=
 =?utf-8?B?RXEvdDNPS2M2NytQaitjWGgxMlVDODFkRDJGKy96U1VXSnNEVnEwcEZrdjMv?=
 =?utf-8?B?Wk9FbTVUMit3ZkIyazRQeDJOZFBQK3E0dHRyekFCNFp0MlJTZzF6RzdJT0tx?=
 =?utf-8?B?UUZTRFB0UGd1N0xqLzZja3RUYnQyWENqZEZpUXJNcTVwb0taTDk3bm5kK2JF?=
 =?utf-8?B?UFdnZVowQ2hVZUNiMEhTUTR5Z2hwNVBYV3hFZ0U2MnZrNFZZUWV0UnQvK013?=
 =?utf-8?B?QzJBblcwTWNjcmJsVDVMakVGMlUzeUpnUUJhcTlNWWxCenNPK1FkRnFMb252?=
 =?utf-8?B?OXg4N0VWUjNlelVSZEZzMUdzcEpRU09vZUFMOC9GWktFS3MzV1oxOWRUcm94?=
 =?utf-8?B?NzdKa0ZUNE80TkxIWUZUZHAxNHhkeWRzQUxwSDB0OWFtSUtheDhGU2xZbUE3?=
 =?utf-8?B?R1BUT3lERzdRbE9SVzNIbTFRSlZSWFNQREZzOHRVUkgwL1FqRGl4Ry95bE5V?=
 =?utf-8?B?NGpzRHRGZDUrb1dTL0I1WE5rbHpzNEpMQXJmNG9Yc0MzT2NLcnphVjFiSUlq?=
 =?utf-8?B?ZXk3UlE0ME1rOFlLWDcwTzdybHR6T29rQWZaRHRmSU0rUEM5Yk1jTVZmUVMr?=
 =?utf-8?B?N3BnVlhlZmJldlZkRFhSTGNpdFBWYitFUmhwNUVmaE1EajRWLzJvejdsZWtl?=
 =?utf-8?B?WnVkd3dUL1BFVW1aSllMQ2JDU1MyMjNrOEdoN09lRkNBTVJDdmFrQjZndjJr?=
 =?utf-8?B?eTYrdGo3V2ZzdmJLa21PSHlDTjZtS2JkZmgrQmMzWlFjcEYwaTNlRS9qZkpv?=
 =?utf-8?B?cXV5MWpnbDRvU2hKT05PMURsTFo3Y2VFL2hQWVR4M0MyOFcweFd0a1VjQkkw?=
 =?utf-8?B?Z1BFM0c3Wm1qbFhmdU9id2NBZ256eWhuN3JVbll5MXNkTkJzdlJ1VFFJaUtS?=
 =?utf-8?B?YUhwWTUwN3MrTkNMbitacWZ0NUl1SDlVTDVROWZVb1RSTnhiNnJSR1RHTXZk?=
 =?utf-8?B?bmh6MVBzelZZQmJuYnlsVUhtY0JmV1lXUiswSEo3RFIrMGNBZTdGclRILzR6?=
 =?utf-8?B?bEF1Lzl0REFOblZ3YWtKdHdLbms2TTh2SExLQlI4RCtaU3kvUWZaWHpFdUFC?=
 =?utf-8?B?UmhGZFVMSEg5UlVCZDYyQVM0Rk9HNFEycVE1TjFSRU03TExCOXRpSW5BRXFz?=
 =?utf-8?B?eW01cW9QQmpObW93VXVHbUNiaXR3dUlnS1p2ZnNmK1NYOFQ1TEZmMEszbUsr?=
 =?utf-8?Q?cu/EfHiS+NB8+3oAVq0wbE7u0x0NLXiW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTVPOE9oMmxnMFNvc2ozck95a21EQVVpb2IvdDJmdjZuTVZ5azQzZXFnMFl5?=
 =?utf-8?B?dEgyRFNtOE9iZzh1YnZxdFRoU0Qzdnd4RWVtVWZxL3BKSFZRQWxHa0lCUUlh?=
 =?utf-8?B?cVBKUi91QXNaUy9PTktFOUxPYTZYbytLaC9PakVxR1BQSXk3K3NOdE81a1lO?=
 =?utf-8?B?MDJYcFVRZnFEc0dnbFhNNWJVVXdvRDZWZnB6d201QkdaaGthMnVCNEllMzUy?=
 =?utf-8?B?WW4zbkxsRWJ0Q3NteUdINTAwcjNQblBnUGU0dGdUeG4vZUVoelp4WFhYWk5S?=
 =?utf-8?B?ODV3VGpiNnRJV3lZTmtNcEdkUnRTSjV4TlM0MWFheDI2V2FscXQ1YTZ0T0lq?=
 =?utf-8?B?dXpzRlAwZTJnMyt2a2pwNjE3QnFoK0RmdkFGdVljVm1HTkpEb2pBU1BIZjlQ?=
 =?utf-8?B?MWJ1L0crbm1tUldpNndFVkFSeDBzamVLMEJrS1JKNWxBNWlGbjdZbEgwNDBt?=
 =?utf-8?B?TW5ob296bENLOEVFbllVOXpCRXBNWm4zV3AyOVYzbEhZSXhIUXhvUGtTVXlI?=
 =?utf-8?B?cGFzdUJRN2JTODZWT040djEvdGR2TGxFMzNPVGllZ0VmVCtmMWw5UXIvZHVW?=
 =?utf-8?B?aEpDN3hkRkpZNXoxeEpFWCtoTzNhck9WdDBub2szYjB5dWNpWlRmV2R2b2Nr?=
 =?utf-8?B?ZnAxSkczTHo3RjlCZFBjRitFUlRuN2RlK3IvRkdrZVdQSUN0ZHlscmhSRDV2?=
 =?utf-8?B?ZW9vWXJBVjJrekwxVmxMUmJKL3lUVlJsNlBxdFBrMlFhQWNRWi9OVVZ0ZnRz?=
 =?utf-8?B?ZEVwbDBla1kxbTN6bnpaVFFVbjhGbjFFaWkwOUFiWmNXRGpGSm15dmo1ZTRF?=
 =?utf-8?B?S1cxUW9hRHlIQVRSQ2NUZ1NqY214Z3M1Z0V4NzdqK2dWVlJMNld0eTFLM3Ri?=
 =?utf-8?B?ZGI0amI0M3AwTEZjNFlYaWRGK2RucE1QeGtZZGpuT1NvQWNKazlUcFllekJJ?=
 =?utf-8?B?ZVE3N1FEaGFuWk56djhoN3Jodkl2UGw1dmYvaERZT2tGNWlkOUxxSThQVFZh?=
 =?utf-8?B?M01LQWJsOHcxRmcrSlNkV0NGZGpEL3pObDI3T2krSmc5a3J6Nnd5ejRyNW1X?=
 =?utf-8?B?QklYeGlyOXd5d044NTd2V2hEZWM0amRWMXA3Y3pkWXBZdGFkMnluR2plNzJJ?=
 =?utf-8?B?K24zbWFESG5Zb1I4SS9qcFo1cnlldElPMlM0cEFibkMxOG8zN213Q0txUUpC?=
 =?utf-8?B?SUJQWi9RMXRHR3ZDVFIzN3gxOWJFVWR5cVJ5SDVFOEZzK0pDdFJLUml0Z0pD?=
 =?utf-8?B?R0VJTC9hVGVvKzJLOTgyTlhIMzhDUnJCeEltL2RPazc2Yi9zejJvS3QxTXRP?=
 =?utf-8?B?bHlrNlBkbCtUR29qRHF5Z3l1ZjFRVlEyZ3dRbWZPVjdvTDZ5dkpad2lkTDUz?=
 =?utf-8?B?Uk1tS1JNeU1aZGVrWE5tV1NnQk9sbUJMVFlzM2w4NGEvQUM2KzZTeit3R2NH?=
 =?utf-8?B?OUIzSGhDODB6UDQ1L3lBSnBJdHYzcWpMS2dLcWIxWGo2d1VYaFJnY3VSeGV0?=
 =?utf-8?B?aUs3cEdyckxhWjdZRU8xaG9zc2pCNTZNOWttVnkrbkNhNE5zR080SWRHcEh3?=
 =?utf-8?B?TG9mUmFmSE9xUGltRExmZWYyZWQ2RFhWVFFtVWNNYW00aitaNjdGcWZRdlRC?=
 =?utf-8?B?QWQyK2FwSmR6ZFZqSUpSaUhPTzViaUYvNURCRGIwd2pIWGxObjNNSGZ4TW1Q?=
 =?utf-8?B?TnVmSU1iMEdGRDE5L01pUllRTjZBWmp4ZjR0MGtJY0tIeHJ1Y1ZjSG5GMXpS?=
 =?utf-8?B?VnRBdWJrOXQ3MFFNSmI3UnQzTFF2OW53a0tHQ3hHL3ZIcTRsUm9Oa2Q2Mytz?=
 =?utf-8?B?RmRGMTBmUEMvT096Z1ZBM0hwNERYamU1citQSWR6MkNBNnpwa0t4YnRlaExJ?=
 =?utf-8?B?cmtacUl2Yjc2NHB3aUxDYzlDWXFxNG16RWRFOWtyREVrcGJWUXRXWGo3U2NU?=
 =?utf-8?B?QTdjQlZqbUVjUkNPVGVmYmREaHpOSVFHbEhDQ2JPdHVJNDJic1k0RWlYV25J?=
 =?utf-8?B?RGFTU2RiY0Y0bDd4YitsRWNiQkpMcTNMNUVrTnpUSG9XNkQrWVVWMSt4UnZz?=
 =?utf-8?B?dVNIRE5MN1VndElOVW5LbG5sWG9uZFp4MmJ4RUlnTWp4dElJTWJqM01ua25v?=
 =?utf-8?B?Unp5aThRVHB2RkZwQWVUb3BxZVVHVFIzVWQ2NEVUbU9RY3l6bGh0cEpBMlNP?=
 =?utf-8?Q?MFwN+ssk3yi/XWx2swODsXc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca4b935-1ebf-4516-a800-08de27380db7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:51:23.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38xsAzUM1Y16Dz242FITmK7gA/GgppH1+rrxSGpID5fNZTH6eFdgQm5bn1lVRgFiYKgoB+sP7gwVwKPKz0Jctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8143
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

On 11/18/25 10:47 PM, Alexandre Courbot wrote:
> On Wed Nov 19, 2025 at 3:34 PM JST, John Hubbard wrote:
>> On 11/18/25 6:17 PM, Alexandre Courbot wrote:
>>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>>>> Define some more GPU registers used to boot GSP-RM on Turing and GA100.
>>>
>>> Nit (for the patch title): these are falcon registers, we just happen to
>>> use them for booting the GSP. Also IIUC most of them also exist outside
>>> of Turing.
>>
>> hmmm, falcon registers are *also* GPU registers, though. You arrive here
>> via the GPU's PCIe BAR0. So I'm not sure there is anything wrong with
>> Timur's patch title, right?
> 
> I was referring to the email subject (which I should have quoted for
> clarity): "gpu: nova-core: add Turing boot registers"

Yes. But what's really wrong with that? You can't boot up Turing without
booting up its GSP, which is accessed through registers that could
reasonably be referred to as GPU boot registers.

I don't really think the patch title misleads, does it?

thanks,
-- 
John Hubbard

