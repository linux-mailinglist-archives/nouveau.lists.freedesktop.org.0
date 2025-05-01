Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA1AAA7B5B
	for <lists+nouveau@lfdr.de>; Fri,  2 May 2025 23:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F4610E202;
	Fri,  2 May 2025 21:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f2EyWAai";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA0A10E202
 for <nouveau@lists.freedesktop.org>; Fri,  2 May 2025 21:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjprVWxbQOzZcqsoo31igX23kur1E4i9Hz3CUQcJdIRqbl8B5EcshRfBDeGW3TBotR2PX4k78hF/XZ7RvZ1udec6jD74MtF90YZ3qBWRdeM4bAwQlFdITLZtIQGFARtQvQK7p6/9BUbs9ehJ6E1cBvTdQjYU5KGmM34i/9YQzMmcvcni1PymY5DoX34q54d/CeKy3nAnG7I9xlB5Ve3bixNPi3LZyhhCx22wJD9FkszMM/urmlIZf8B5Ii17fbAsfClN1oYtcLp2hMdXm38Uhqg/uJX0zxnxjSzUBvuHuUNz++pde3U1i9PnJuumPHIW8JgqNZi679SUzz5dE6Lb7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyr/UjxjS6IldB0/gNoyDmN1qV0Inng4LKn68e16c3Y=;
 b=LEd2Pm7rlBiHZ+ouVnIFfal+K32/zKGJ1ndgwSD0dnh3gbwFrE003uu34xfyq5Sy2emOrj87d59RQsXYPrxLj3taVNKwLUwDQXQF5atfIsX/2bq4+9MIg7W22GFXszVmul13+nPvJ58SQYarlEs8Z5kgKRTwMAPpoDWEDKv9Ic1XEfhDD2x7b2EwldmIVD6YcBiLJoVy97VHOnP5qysan1EHfeGBQ9Mv7ZutZSJybafMG9Qp2OfUfvAM6KBfBkPeljw+9yYcZaO/KdaEftA2RhModZ50TurkTfSLh9gDP4x7PPcStHsrJcEvwpbW3wrHRnn6jI/Osk2G0m5UAj0QSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyr/UjxjS6IldB0/gNoyDmN1qV0Inng4LKn68e16c3Y=;
 b=f2EyWAaiZfXsI3E9gXN6Xq6uDxxp4SwPcwcd+2ms49XqFEDIU4bXoB/8P2SuCXaekkSCNzp1apGUv+itTidn4ui05LNxoR1vmQfjxNMt/zYnBMg8nmGoitQiiGiLmJ+O2atr43ueadMmdIHr1yhWSLEPBXnu5wGBAdhTS23FrMP3gnMeGOebGajx18DTyt8+B15qjGfsKHTS00nX3ihdPjiQTM6YShRJ7wqFHSTspj8B82cKOSDu10ihnjDhZvbEKeArZ4ZQpgjMsKDo3crAZxlEw9SRewSDJkXjIG8LYCQY/pKnZtBWVLIHo9PL/ugA1NfBk13Hav4/5eMD8zOmRg==
Received: from SJ0PR05CA0096.namprd05.prod.outlook.com (2603:10b6:a03:334::11)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Fri, 2 May
 2025 21:27:59 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::7) by SJ0PR05CA0096.outlook.office365.com
 (2603:10b6:a03:334::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Fri,
 2 May 2025 21:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 21:27:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 2 May 2025
 14:27:47 -0700
Received: from [192.168.155.48] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 2 May
 2025 14:27:46 -0700
Message-ID: <d5043dbe-d97d-4b03-b07b-3d831f228598@nvidia.com>
Date: Thu, 1 May 2025 21:08:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/60] add support for Hopper and Blackwell GPUs
To: Timur Tabi <ttabi@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
 <CAPM=9tyVnyOFyg=fUWwSXdCzn6VMpt-UQuHe4kmO2XvgMOjQGQ@mail.gmail.com>
 <e2c36ec2210e4e04b0e880e0da6a95629e3c73e9.camel@nvidia.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <e2c36ec2210e4e04b0e880e0da6a95629e3c73e9.camel@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: f27ea5cf-3cbd-4392-6821-08dd89c03669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTJBR0tKVjNSYkhhcGhmTndJanZRVUphUlVTUjFMcWpnQlBNaWdGS2F3QzFH?=
 =?utf-8?B?cGd2czY4NUFkSzhmZHpNenorbE9MY0twTnh3eWpWeEExOExoR1M0YUszcmRm?=
 =?utf-8?B?dU01S1RLQ3g5aHN1bGxKSUVpVjVFS092eTNKQkUrQy84TXJNTlUzaEwvZWZF?=
 =?utf-8?B?ais1ajN4NGR4WmZxNkI0b2ZSR0dPRVo2SDliRVRjVGRuTlJSQTBSNU9QTUY4?=
 =?utf-8?B?Tlp4eTRzdStaeHNJeFFpa3JvQm4wczIvSk5iTjgvcHVScEI4ZG90QnVXVFJx?=
 =?utf-8?B?Q1lCUU8xNVNNRU9Qek1HZkN1NzFsMXgyQldOSTd0bDdIVmhoaXpCdnhmVGFp?=
 =?utf-8?B?QzdZZzJlWGxiK0ltNWxQZWdzS2hmQ0k3Wi9EaTBEOHh4VTY1NDM3dmVFbktF?=
 =?utf-8?B?SUxuS1R2TVB5eGdFdzJhQ0NVa1dMNE1RanIyZG1IWWllbUhvSXZlNzJrdk9r?=
 =?utf-8?B?bjFrK0c4SjhhbDBVS3FxRGR5bWRDYzZIbVYxNjVLRlE3UXpGdSt1aGFBeTNi?=
 =?utf-8?B?Q0RrWkkzZVBoaHEwWHhhWnFCdDNHczJrSnN2VUhHQmVKSTEwaHhGWDRwdXM3?=
 =?utf-8?B?S2tueXc3YVBid1F3K3FKa2pBWEtJTjkyR05LbkdDTmZQaFdibFFya2pCaCsr?=
 =?utf-8?B?UnRXMTVqUkN0NytrYXRuSTIrTk5rZGQyVUdDYllTRVliUHdueVJEVFQyaE5F?=
 =?utf-8?B?bzhvYkpBaHA1c3hYbXNYSEdLOXpWQXlpcVpxd0phMXJVY2NYdmE2WHhoa2hy?=
 =?utf-8?B?ejdoS1RQQTlYMkc0TlpTcXl3b1NxeXRzZ0RMZ05FamJuQndwMGtZNHlKNm93?=
 =?utf-8?B?L2N5VFJ0eWVBanhDYkZuc0JsUkRrT29jNDBpVVVOSGw3OTRJTm12ZXc2TVdu?=
 =?utf-8?B?TElzSzVJTDd1bWpEMGo5WFU0cURqY3JCVG9ST1luekpEUW5POVdFVjFzRTVr?=
 =?utf-8?B?ZzBBa0VFRmVCTC83N0VwYURHYUc4NllMTGNhZkt0TmQzbGJZdkJnS0dLYTZF?=
 =?utf-8?B?Yms0eXJaRDBzZ1BZWk5MMVdTbjROOUp6aHA5NVFNbUdFaUNpV2NSMFBHS21v?=
 =?utf-8?B?RkFKRy9wYldkK3k0T0daRzBlb0l6Vldwa0RVdGJoRFFSNGlRbmlPcXRVNmpW?=
 =?utf-8?B?cTAwdXpibHBXTjJYdnVaT3V0TVpod2hjTEN1U3Z3VGlrNiswVC9MVm9Nd3NT?=
 =?utf-8?B?K3ArRlp2d1E5OVoyZE1IN2ZqVjdwRnppVDRaVzc3eDUrYklpU1NZWkZQb1Vh?=
 =?utf-8?B?K2M5SXlCU3ByRmR2T2hENXdFQmU0TU1jMFpGUFhkcW9keWZLVTBEZ0lhWlJG?=
 =?utf-8?B?WXNxeU1MRVVRNzR2Tnc1NVFidXVRT3VsaFk1MmgvSGtLTldUd2RrY2NjQ1Qv?=
 =?utf-8?B?YWduYVNreE1tWGdSb1ZpWDl4ZGRycHRuTmxwL3hvQzVVUG53SERHRHEyNEIr?=
 =?utf-8?B?U3QxV0RNVjNLOVlxbmhUM2Nub0laU3Y4bTZjYVN3Q1QxOUxTR0lKRDV2ODJ5?=
 =?utf-8?B?U0t3VFhMSENadGhGZVVtRDV3SlkrWUo2b3oyOER6UjRQcG5qVmcxREo1clIw?=
 =?utf-8?B?dDZzMFJvTVlhUXhPcVJoUVlNZjZWR2tHbS80NTNCdjYrUE9oeFQwbGpGcjhl?=
 =?utf-8?B?a3VDeDdVTGdxeFNKMk1GZHJ5a2lBZVJOUWRBdUFGSnk4d2VTK3hQeHBVRDky?=
 =?utf-8?B?bjBXQUtSVkFhSW1Pb3FFQXFtZStmb2xSREllUjd3dzhobHo5Y0xIUDBCQStW?=
 =?utf-8?B?bWY5L1Z1SXdoc3B5MDRmOWtSQVRTOTFTRnhadVFzcWtpd0NUSStuRVpYV2V4?=
 =?utf-8?B?dGdPRll3Y05PR2xLTVBaUnNOdk43S1F0S0NiOXFScVkzWWVrV1k3TWtzSVNr?=
 =?utf-8?B?VXdQeEJUR21VdzlxaTBVTlR4VjM5VG01UkY0SGZsZzBROXBhNWl5SzEwWlQ4?=
 =?utf-8?B?aEYramNjOWhtNmNMNUZFS090ZHdKQnU5Z3ZyMDBzbm1KbW9Fd1ZRNVdBZDRz?=
 =?utf-8?B?bDZmenZqd0J2NXB3eEwzREo4V1VuNm0yUDZ3RDFta01kNHZkMXFvckN6NnM2?=
 =?utf-8?B?ejRJRnUrdVM5Uk8raEVsVFhiTXFQNHNoaHVidz09?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 21:27:59.5719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f27ea5cf-3cbd-4392-6821-08dd89c03669
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236
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

On 3/5/25 07:18, Timur Tabi wrote:

> On Fri, 2025-05-02 at 13:56 +1000, Dave Airlie wrote:
>> On Wed, 30 Apr 2025 at 09:49, Ben Skeggs <bskeggs@nvidia.com> wrote:
>>> This series implements support for booting GSP-RM firmware version
>>> 570.144, and adds support for GH100, GB10x, and GB20x GPUs.
>>>
>>> A tree containing this series is available here[1], and a temporary
>>> linux-firmware tree here[2].  Timur will send an official patch to
>>> the linux-firmware tree once this series is closer to being merged.
> FYI:
>
> https://github.com/NVIDIA/linux-firmware/commits/nvidia-staging/

Thanks for this Timur!  And for your help in testing/debugging the 
series in general.

>
>> I've dug through this and been running in on/off over the past few weeks,
>>
>> Overall I don't think this makes things much worse, if we had to keep
>> adding fws I suspect this might get painful.
> Agreed, but we need r570 in order to support Hopper and Blackwell.  r535 just doesn't support those
> GPUs.
>
> The good news is that Nouveau extends support to all GPUs with r570, so distros can replace
> r535 with r570 completely[1].  In addition, Nova-Core will also use r570, so we won't need to
> support a newer firmware version until whatever GPU comes after Blackwell.
>
>
> [1] Apparently there's a small Turing bug with r570, and if that can't get fixed in time, then
> Turing may need to stay on r535.

I found the cause/fix for this yesterday (we were missing our half of a 
hw bug workaround for tu10x, introduced in r555).  I will include it in 
a v2 after I've heard from Danilo.

Ben.


