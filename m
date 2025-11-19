Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AEAC6D162
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D668810E13D;
	Wed, 19 Nov 2025 07:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IlHs7O+Q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011024.outbound.protection.outlook.com
 [40.93.194.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758810E13D;
 Wed, 19 Nov 2025 07:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfTj+xCfFiifcUQa74+D6hwhvwS/VXrjXlh4OmzWrUgXSRF7yc+QdRWgxidPd9YhLOFwfPcJfljnnwFK0sejZpsYM9yxW457hPECfzQOybuXBlMvzLthxuK2l47SrgKeLGfDikRDrkpNwNmFEdfiSjieJfQPvxjFd9C8TTagAQkDunNi30eaBeCC4Nsvv1scCChjCd9vwb42BPyUnw1SCo1PrVLxrH4jSFr7oKFgRdHWR+Wy8gbhSY3t3sSQBMU4GNTQwNzWt9MVIRfqg1Xl21xP06BAGDOT0M7SGflq/0A/mQEVXhJHX+KYRuZVzzLMzd3XglkNTanvJ0gM+77+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2QICqw7yTunCNDlSE+ZY6p4jM4hnBY2neOfAWj8zcA=;
 b=nBzDLcBlWb0Lir+U+eP7n6YT4FjWWs2BEwNxo8qOBsHX2HUHGLOGCgjOIpadmJsw96KQSbF0OCKri5M3Q+D3Cq7+vibdpErAOv4HpkV2eiHzlQFWFnTI44KaIVLsRbZRbBSmdy976YneLnAJvnOm9ACeH0G8HNQJREIQc/jJ4D9f76fnHPv7iwm8WBtlRTnCsW3vDUGhSUVOIOBUfqjtYQsYvpCAeiGgVTz7bsnbHPQR0pFkX4DJOAhz66omJXkHjUdinn5RnmewvgGhDRA8ibIWqvW5pVHAn3/j0mOEzNTm+NIBNDdBGHu7qak8VAML1wTP4Xj5wLX95ApXxc6LBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2QICqw7yTunCNDlSE+ZY6p4jM4hnBY2neOfAWj8zcA=;
 b=IlHs7O+Q3NWVXwvo58vtW9plWQtBx8IRPaov4pYzUnG/waKBwNMZlOfH0l/ZmJgGIzlRjxtcMJUyBC1DsganhQzi3xVM12VD0OERIluIDOfEcTRKHAOHiOClhKpuOObli2HXOpqy2pO+Oi41O6IDH8meq/ZaJAj/kuEXwpI0/lAc7F2CUq+8La+FaRX3lJsHjKF8WXWepAy8UoHJdZJzoqlzexOj90l/JUtvqRBjN9M7sgbh6tlgps81kn07jQlQB2jNwPuqi6QOFrn/1zpm34N3Gqd+WPStSa+WJ3o/asye429QSqcSRX0i36M76yS+X4KtIDly2R0hGw67lFUuKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW6PR12MB7070.namprd12.prod.outlook.com (2603:10b6:303:238::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 07:24:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:24:26 +0000
Message-ID: <6634609d-0377-48b2-b8b4-3a7861258305@nvidia.com>
Date: Tue, 18 Nov 2025 23:24:11 -0800
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
 <1dd37cd3-539a-4698-bc9d-a99610fe96f9@nvidia.com>
 <DECHIL6CZUVR.KJPD43LSJFDE@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DECHIL6CZUVR.KJPD43LSJFDE@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW6PR12MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 3746c83f-1774-443a-9c56-08de273cab92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjVEN0V6RGFHMXhJZWVDNUd2bmZ3NEtyRk0vRWNZdklLY0R6amJ3a2RZTHZI?=
 =?utf-8?B?bVdIRUJvNGN1WmdVYTY1NHFXaStZZEs5MHcyMmtLMlpxelhMQTNTZ3h3MnJM?=
 =?utf-8?B?cS9KYTBqTGZ1ODNCR3JaWGxGS28zZTYwRkVqZFZETUZHWkVJQUdiamVFZk9J?=
 =?utf-8?B?OGVoVXNGS05Idnh1eVhFVGhHVXRFYWJhejRpRDBFU1FITjM3MmF2K1hKNzg5?=
 =?utf-8?B?bjFkQUlVbkJ1MXA0VmpuYVhidzd6MXk1bW1ZTnY4RHhXb0lGc0MvV2M4Vlk4?=
 =?utf-8?B?eE8rampMemVYTFBkV0tkYjJ6QitaUXFsZGI5bXpIV0JmMG85RVg3OXA2SE1y?=
 =?utf-8?B?aUZaUDEvN1I1dXBaeXFJMWtEZHFVNVNKVmZsMVZOczFPczluQXpRcVVkaVVn?=
 =?utf-8?B?bkt3R0NmbmVjTnZicGxMdWE1RnNoWCtVem1STW5rOXJzRzN6TkRuSndISHlM?=
 =?utf-8?B?MjdMY0tLYWluZy9acjdIUjBTMWgrQnlzOWg0cGtQRStYMHZkaDNnVm9mRndE?=
 =?utf-8?B?c2dwbGdZZVZsV3V1eSs2UlV1UWdocjR2UDgxalJwdWl2aUlqSXB3aUdBcnZ4?=
 =?utf-8?B?bTdZb2FrLzRjTk4vZUtTZWZYVnNsZkFhcUNhN21zYTdUUEdSQmNVUUltaDJt?=
 =?utf-8?B?bklUUCtJbVdxS2t3a3RneW16VnB6cHQ3S2RpMVpYcm5LTVpwQlZReFFJeEwx?=
 =?utf-8?B?d2xFeFpUdTZHWmxnbFdxY3hESEE1S0lIWHQvMzlacXJEOGNRdW5WUFQxMU5B?=
 =?utf-8?B?dXlxRVo5d2dNQ2ZtWTkwanhRMmhVNFpmcjBhR3E2YTFIVkhxcnZtTEdVS0k1?=
 =?utf-8?B?aFFjM1JiVDZQRHRvaFQyVFRiSXZFaDd0Zmt0S05mb0l4YVZmL1NKSk5MaFRi?=
 =?utf-8?B?bkIxNlhiZENOM0NBcndyN09pNFZLTXJKakFrUnZWUFlrTWR1ZGUxTW9mZmg3?=
 =?utf-8?B?YXozaXAxVnhVc243ZzBEOVBnNmVQTUNuWG9IcGpTR0xmWnhaTW1PeXRwTm4z?=
 =?utf-8?B?Zjh3UzJaN01JdE1aSTNDYnVwTFhteXROeDI4MTc3TW5yMXBVMVVqVnV2azMz?=
 =?utf-8?B?Uml4L2IzTlVDdWR6NjFnZVozUXlMdFV1c1J6dFNIV2l2TVJsSk9EcVdkSnZC?=
 =?utf-8?B?dStFTHFEQmZ2dGlvaEkzR3JEdmJtT0dLNkVuZEtYRnBocDN4ekVsS0pGQVVn?=
 =?utf-8?B?K3o4WjRmUXRWNUIxZVZnRlZ6OUQwL1IrOFlUdytyWjRPL3U3ZlBwRCtST2R2?=
 =?utf-8?B?M3ZOaXRWcHNHSEJtZFpCbXAzeGcvNFdSOGViMi80Z3huV3Z1UzUwNkh1ZFhm?=
 =?utf-8?B?c2ozSTZwTWRJeGxrNnFmNmEyK2pVRjhxdzdXcThHMnhxWnB0cVFKcmlvNkda?=
 =?utf-8?B?Q2lhNTh4NVdPNnhBTEpPNnF3VmtHa2JTWVFySlZQVzVRRUFLSzhrMElYNkdx?=
 =?utf-8?B?cW9yaWpnWjhMRWZzVXZXdGY1TFlKV0dHb0FndDVNWnNoNWNUaEVEcGdnVGow?=
 =?utf-8?B?QmNUUUtjZW9rNml1L2hIbTZHNE9VMlNGcU1iaWd1SWs2VmExUWlkUk5HZ3RX?=
 =?utf-8?B?SFN2b0p4U0tQcFlDK0lSbWtPRTdqdHJ2MEpDRmUrMks1K3J6Ymw0S3NHRnJW?=
 =?utf-8?B?WlBFTGt6Rjc3d0tYamJyYlBuUGtNWXBUanFRYWNwZjBMbjBVNlE2OERJbTZG?=
 =?utf-8?B?S1JHK3NOR2dPbUxEUGZiVXFtYjloRTZsZS8ydEswSlo4NmltM2dxSWxsNXVO?=
 =?utf-8?B?MldEMHRlN3FuQ3ZxUk5tR1p1OXBwZUhmd1NrSWN1S1l0aks1Wm5BWHZRb1kx?=
 =?utf-8?B?T1UvejBzRmRieUFJcTBxMXYyUW5Pdng5RStSdkJ0cm9LbWNoM3ZtZVI1QUJG?=
 =?utf-8?B?MGpBdVMxb2lWK3B6cXpLRlEwZ1lBaGQrci9xNks4Y0hGMXBQbzA2VituYUFD?=
 =?utf-8?Q?kB6tkF964cDGju2bN5oxEOxPgyEHFCu3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjE2MGF5QTBVSVBTRkZjTmF5MlkwZytrb1hUZllpTFF0ZUdMWll5azgxcTVK?=
 =?utf-8?B?RVB3NS9CWEl3UWRtNHRWem5Kc0FWMUNYN3FRSmdKMzNMRnFuc1puN2RCVVgr?=
 =?utf-8?B?VlB4M2ZTM1dZWVNUNlZrN25uWDhQRnJwaDUzd2lUS3orMW5UR3p0OGxqczVm?=
 =?utf-8?B?K2pacGZ1RUJIR3hOT1dleFBBVXZhUkx4UnU0UVBRQXAyTnRycy83bkdNMU1B?=
 =?utf-8?B?czhoUXU2TnBHNXlObGFYREp6OE1VQlZRVU1KaDljUHlRcEprSnU5bHMyTFhp?=
 =?utf-8?B?blhNNGdJMktHb0hNYm5haDV2UkVhSXZiUmNCZW9odFYvTVdDYThJWXZKRlRv?=
 =?utf-8?B?SW9TTmZBWmJCOU5lbEt6NVA1WlQrUmw2Wk5CQUx0amg0RnQxZnZKckpOZEE3?=
 =?utf-8?B?dGU2T2VKQWkxL1BRaGRzZjIrRHZjZEZyWUpmSlRjZ1YvZkkvb1JIVWN2VzhI?=
 =?utf-8?B?Ui9BVVUrWURjY1MwQkNnTW5hQkRBQTVHR3ZJQk1aN2lLUlNFb3B2bHI1aUhO?=
 =?utf-8?B?WGFnQlR0WUJ5L3VTOUFueSs3MzR2bG95dGwzS0VSQWxEY2RsMGNlTk5VZTlM?=
 =?utf-8?B?TURWemxQRDM3a3Z3YWRXQUZNWjlVTVh3OUNRcnE1djkyQyt1anVzT1JHVnNa?=
 =?utf-8?B?UUlZRE5FcGcwZWtocUdxdDNoMTZqdzNGMkRxY2lwdTVTWTE4ZlNKSFFYRU81?=
 =?utf-8?B?a3p6dHFJYm16SjhnU1Ftcm9jTEVoSFVFSHIvcXlXRXp2K01VVDVySUlEa2tO?=
 =?utf-8?B?QnFxWnVxdzdaTjBDcnZ4VThMMHBhUmZtTnBGOEdnL3Y4UVd3QlBuTEFTQzJB?=
 =?utf-8?B?L1M1KzdNbGJwWjhQVG9kb1lSNHVzcFFNdVF0SUtkcUZGMUV1VmZRWG5oSjF4?=
 =?utf-8?B?cGRZbXRJT21lSXJVR2luc3dSc1lMVG4rUVF6WmEvRFVIa0NHUEw4aFVJTy96?=
 =?utf-8?B?dU9aU3Mxd1Y0YWdHT0JJMnlzQ3ZyUXpVRDQ1ZE5FWjhSSWJvN3hhUmthd3hP?=
 =?utf-8?B?a0doOCsxbGlmYU4yZDRHbVZISXZOeXE1K1FYdG1hMGhWVkhXSHIxaUFFL01y?=
 =?utf-8?B?NkoxazQ0T2MyemljVDNKOHhiYUpISW9YMWFycGs5R2xyY1lpSmpxWURybmZE?=
 =?utf-8?B?VWlWbHVDVFdmaHpJMTdmOFBHL0lROFZ5cUtaRHFKRjRJVFdzMjlPaE8rVlY3?=
 =?utf-8?B?RGduVEZqNHRoOWJEVnhld1B1VDZ2aWJrWUVWU29kakZVVm9MVmZkM2Q4dEkv?=
 =?utf-8?B?VjlReXFoYTFHbHpETXFYb1pGTGpzMWNWN1UzUEtFTlBiWnE3ZnRNR2U3bkpR?=
 =?utf-8?B?RjNkRGNIQzlDb3A0QmRiSXB0VHZTTWlTcFBiNXZSWXhwN2xGd1Z5R0RBUE4w?=
 =?utf-8?B?cUFNaGNzaWRrRlhkam9zZkxXeWpRK0d0Z1FvNnFJYlQreTQ2Wi9OSURHOFk3?=
 =?utf-8?B?MkVxNTZhN2VkSDJSUUg1ZHR3SUtiNnpTUmh3L1hwQXlEWmIwQTZVTUJETU43?=
 =?utf-8?B?ZjB2ZkdNd1d1SXIrUGw1TGtUOUlYeFB1eTRHTDFHWTNiWTJiRHp3ZzNSc05Q?=
 =?utf-8?B?clFFVzQxVmZidmZxTzRvWGtYS3hKQXVscld2VkhjeUhOVmpjNGJXTWhaZUJQ?=
 =?utf-8?B?MXNzTmVIZUcxWno0YzNoN3RLVzRwdFFad1MyWENIUDBRSnZVSFQxQWw3cXhz?=
 =?utf-8?B?ZFNiejN2VjdJcXdBaFJDQjA2MjVka056L3pvL0Y5MUtmMW03SFRLOWJkelRx?=
 =?utf-8?B?a21sQ0Myb1kwWjZnUzE0bjN2aldaTmkwVW5VQWVHdFhSaUsxQWlNLy9QejA4?=
 =?utf-8?B?bmxXenhQOTJPZis5dmMyZlpWYTdBSHZobnpWei9FaFRpcVIxVjdyQy9FUlcx?=
 =?utf-8?B?V0FxVGx6REwvOXZ4bGNFY3NIMitIK0U2OHVhc1lQeGpnbzloV0dsTVR1NXRU?=
 =?utf-8?B?NkY4dWRCVGdIa1VZTUo5YXZaemxOOVV2WUJKM1I3SmpQdHllK1VkVUc0V0w5?=
 =?utf-8?B?MnhTcDlJUVZkZkVJZGZaWHZWeGlYOVpsV0s5MnJ2djRFR1FRMmU0Wk1ZV0xt?=
 =?utf-8?B?UE9kTmZ0V2hGUWpTOVJYODVZeGQyeXBxdkxKNHIwSDlmZHdCdEpLVjNYNjc5?=
 =?utf-8?B?Vk10dHlKZHM0RERWWVhWSnhSMG1vVGJYaEcvQ2ZTRGRrNWw2Z0txOVpjb3lF?=
 =?utf-8?Q?MC3w8c3mjzt0z4Stx+quk0k=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3746c83f-1774-443a-9c56-08de273cab92
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:24:26.4712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kb/GXYIEKzvbZj57ynCARme6+6Qlw0BvwVKc9J0GOe1QKLvfDglMcuH7WX7ukOe+ge8N83WmDUtvJdMnM5IQVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7070
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

On 11/18/25 11:15 PM, Alexandre Courbot wrote:
> On Wed Nov 19, 2025 at 3:51 PM JST, John Hubbard wrote:
>> On 11/18/25 10:47 PM, Alexandre Courbot wrote:
>>> On Wed Nov 19, 2025 at 3:34 PM JST, John Hubbard wrote:
>>>> On 11/18/25 6:17 PM, Alexandre Courbot wrote:
>>>>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>>>>>> Define some more GPU registers used to boot GSP-RM on Turing and GA100.
>>>>>
>>>>> Nit (for the patch title): these are falcon registers, we just happen to
>>>>> use them for booting the GSP. Also IIUC most of them also exist outside
>>>>> of Turing.
>>>>
>>>> hmmm, falcon registers are *also* GPU registers, though. You arrive here
>>>> via the GPU's PCIe BAR0. So I'm not sure there is anything wrong with
>>>> Timur's patch title, right?
>>>
>>> I was referring to the email subject (which I should have quoted for
>>> clarity): "gpu: nova-core: add Turing boot registers"
>>
>> Yes. But what's really wrong with that? You can't boot up Turing without
>> booting up its GSP, which is accessed through registers that could
>> reasonably be referred to as GPU boot registers.
>>
>> I don't really think the patch title misleads, does it?
> 
> I interpreted the title as "these registers exist on Turing only", but
> it is indeed subject to interpretation. In any case it is a
> non-important nit, so feel free to ignore if it parses fine.

Oh, I think I missed your point entirely. I think it's likely that
these registers really only apply to Turing, actually, because
we know that subsequent chips don't use them. (See: recent boot
success on Ampere/Ada, without these registers.)

Timur can clarify that.

thanks,
-- 
John Hubbard

