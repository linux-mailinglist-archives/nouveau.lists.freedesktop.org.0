Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83603A246FB
	for <lists+nouveau@lfdr.de>; Sat,  1 Feb 2025 05:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1730E10E168;
	Sat,  1 Feb 2025 04:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jW5wIYrd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA0810E168
 for <nouveau@lists.freedesktop.org>; Sat,  1 Feb 2025 04:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdVcy8g84pnZcb3j1gau/pPj15C9MeD79NOXoKtX/tRAFOgEbqCng5WTLkST42rCEcTHOWuxwbr6I8vU9Hz55EnuRzHreGL22IV/rI6/V9l39VCT/uBoIFpWzEKb3rZQeRT1ZGhbB/lITzRnUuNW01IDYPqCkRHA898sDcD18lr/nYu6IN/bz6Uz/cCFyHfqRJA9lnwqS8Eb432GBThsiHOEl8uUroLdIC8gU0j0UIDAysNoJm03Blx0axVAqrnnacN2gKJD2na6Os80BgSLhGFxn/TAyLhOrT50TO3eQVZ8ZByqF2jZ23DmyGQbnkFHdniViiK/XtKQgROHo70W/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63P/0eicJwNmTAmdrQ3dbta+yeuzZNjuBVsrverXCTU=;
 b=FoTpkxjStHQqJVbsQgJgkruZEBI5qsIxgAHclLwhEkWYuuD2UeoqSff0fpDjKOxE2c6KPkG/IwCxmXBn5MGNGFhJOorX2pOm4YuTpB4ULv6Fdbi/Kv+hvyTJKdC4lqddqrxhVqbkL3tpsU1qXn9DFwwkspdvjQLyeaOaZJICTQCPo/x3liXlYdqlU8BaMxp8/78cnTH1UxsvQ2qmDvMjC2bmW2cnYLOo6jnaRXJayF49WZIi95GnuW1rW1tgrwLRbUOUWCQjmvzXfojAYajtwyrT2LRUuBCsF1TBejAiijARD3lfvjd2+6JW7vZRtDPvypw3tYnMbXvNeHsnH9Gg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63P/0eicJwNmTAmdrQ3dbta+yeuzZNjuBVsrverXCTU=;
 b=jW5wIYrd2dv/9XOrNxx7E7D3c5TjoeLkW3PEBgqTI9oY0yUC3MvIiCU+1qh84b2t0xvOFhFbALsX0MskJHWDUfIiyNu1kmfJHkJUJ4nyW5W93FilCKIDc83w98d1lYx0miu7Px529d9zEdfMEK3wWKdZly1TiHBsahYgsMjw3RzRvhhZm3P4Mg5oQSUqzmV4kyG8MDX5FwIj6LIOgxq9B76Xr7Y2QAw6c1KFlp07duHa+gTckyk4E3tqNLPe0YWYp/mwEpMEnnm3kokceLl6UbhVmX9tt4npPIXbyNPNmDN1gRkveWiw5wqWhPJuUEzaO0ocfmzUsgW1nGsHj3cZfQ==
Received: from PH8PR05CA0018.namprd05.prod.outlook.com (2603:10b6:510:2cc::21)
 by SJ0PR12MB6855.namprd12.prod.outlook.com (2603:10b6:a03:47e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Sat, 1 Feb
 2025 04:13:29 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::e2) by PH8PR05CA0018.outlook.office365.com
 (2603:10b6:510:2cc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.23 via Frontend Transport; Sat,
 1 Feb 2025 04:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Sat, 1 Feb 2025 04:13:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 31 Jan
 2025 20:13:20 -0800
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Jan
 2025 20:13:20 -0800
Message-ID: <60f92b8c-0550-4692-9231-94934a6289cf@nvidia.com>
Date: Fri, 31 Jan 2025 20:13:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: <nouveau@lists.freedesktop.org>
References: <20250131220432.17717-1-dakr@kernel.org>
 <35d74754-ed0c-4f6d-817e-86638ca2bb70@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <35d74754-ed0c-4f6d-817e-86638ca2bb70@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|SJ0PR12MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: d4594fb7-c04e-4e9f-342a-08dd4276c81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blJUSEtrSWtOU2RkNkNyNHp3eXZXVytPbmZFcW1IQ2VCYjJZdkxHMldMa2pZ?=
 =?utf-8?B?RDBZUktLcjIxNVN3KzNvVHBlMWV2RStRVC91WHJCTHd2K2F1aUcyMDdaZ0hK?=
 =?utf-8?B?SjJleUI5bDVHVGlrMUR3S2VVUGFORzFEdDF3NHBBbXllenFtK1RGSS9yN0lZ?=
 =?utf-8?B?ZkRmcDFsdlJ3YlJ3NGdZc2hqWkFzWm1jaUpyd29WNWNwQ0x2Z1g2M2pwNkpt?=
 =?utf-8?B?cDJCaFlwN05vcHUvNDJoNWN4Y1RFSmw3dUI3aU16dCtBb1BubEZhWWp1UHY5?=
 =?utf-8?B?Rlh2NTlKTVpNUDEzSHNGZG9leEVWVUJHQW1RRTAxblBGUFJ2dU5WK0o1VUJz?=
 =?utf-8?B?L1pzRWxmd3lrcHVyMGgrTzcxcXZzaS9PTkJPTjFNK2NpYTRCL3RMSXVEMEN5?=
 =?utf-8?B?S1dGNUR4aW5pdDVOZmZxNlNIVUtBOUw3bVJhMkVBcis0N1Z1UTF5d0JmM1BZ?=
 =?utf-8?B?d29wdWdXVmtBZHllRjJYNEZmWlVsajJ4S3BsVGJCc3RheklTTkQyTTRoZ1Ba?=
 =?utf-8?B?VEhpb0dQK201WE84V3hLcEVNK0xvays3MXhHU0xBWG9vOXREOGF2RGE0Snd1?=
 =?utf-8?B?ZFJrbWtoSVFqcndYV3JiVzQzWUZQV0tDNU5heWpHZGJvOFpzcmZWNTBBTGhR?=
 =?utf-8?B?a2lEbHhjcnhBNWl1b2RlclV4cExOcFg4VXdiSDQ0enhOOEpBakQ0ZDVkWHB5?=
 =?utf-8?B?YTBiVlVHdytWMzlkdzhwdjR4WDJFWHlLdkZMVHFneEhJRlBaaWFKWHBJT3c3?=
 =?utf-8?B?WjNZOWtsanZCY2xYOHk3NS9VK1hXdnlxR21HNzA4WWQxQmI2K0d1bTBpT3dV?=
 =?utf-8?B?LzdMdTNKeHdrRkk0K2hUV0dlTWY2N1JGNE9Ib3JFN09pcGdKMzUyak9ObVZw?=
 =?utf-8?B?aTdvZTREQXdBVFdreHg5L0ovcUdXSDBWT3ZlMTV0QlZjV2FzQldic2dHYkxM?=
 =?utf-8?B?L09DUWtTckFESlUzNkhSSWo2b1dlbDEyYytXbkFTMDkxcjlsSVdXL2xkWHNM?=
 =?utf-8?B?b3JLaEZVclg1enJIZFhieWdZQ1lnbG53RTN6ajRFVERURk5ud2ptejQ3dXVU?=
 =?utf-8?B?cmcwWTUreGR0L1l0b2lUNXg3Z0laVURKWGtneVJ3Q1pxQ2JNdjlhOVYwb05Q?=
 =?utf-8?B?NlZPOGM2OTJaNFBPUHdMWWJIcTBrZTRMZHk1K2JVWUs2eGhpekV2em9reXpT?=
 =?utf-8?B?dUtUaEJRVVZXbGpkdkh4VVlQbUduQ3BEWkR0a2pBSDdlam5SM015OGtXQlB3?=
 =?utf-8?B?UWo1MDhzbDBzTTdDZHVHdEZuZzA1ZlZQeC82OE51VnhNd0htRUR3ZzgyaTVH?=
 =?utf-8?B?ckF0bVZVSW5iaS9MK3g0MW1YUXg0Ky8wcU13VHNTdUJRcHMvcVpObFRwMlBM?=
 =?utf-8?B?bTRJODFxVitGVkhiSTZWeG4yWUJnaFA5VlpBRXhxY3N1Y1dtWUlrMFAyZHA1?=
 =?utf-8?B?bC9GU3BmczFqZlRuVkdReHE5NTJzd0lEWHhyUXBDVGtFZUt2elZwZHhUNlZi?=
 =?utf-8?B?YzFVVGt2S0Ivc1RyVG5TYTN5bStIVCsyYURTdFB2aFJYbVI5QU00enhhUzQx?=
 =?utf-8?B?UVJtWkw1R0ZJRjRPVll3ZGlaNmQ1ejBWQWVjaWNlN2lyS3hIQ05SR0kvZDkr?=
 =?utf-8?B?WUlVM21hSDRmRHoyVlg2dU5SNXFhelBRSmtBL2lUTk9YMFkzd01OVXpWVHoy?=
 =?utf-8?B?VlFWQmlnQytkK2Uyb2ZqaUJaTUZVMnhTem8xU0Z1bTNBUGd2Mm1ySHdjeTl3?=
 =?utf-8?B?SlJTSGh6U3o5cWk5bjE1YmwwZHA5WnJvQldpMTdGakdvSmhIZmhua2tQMmd4?=
 =?utf-8?B?Y0JLWDRTYWFqa1ZlcnZlTHJJem5wcXpFdzFVSDFHaCs5ZzMrbjJGb0ZZTGlz?=
 =?utf-8?B?NVBFT2tNdVVQK1VUWlRuRkFpQUVrQU9CQXRSdmQ3TWNZbUxLT25GclYxRm1h?=
 =?utf-8?B?U0dEWlkwa1lqWU9lOHFUbzdQTm9EWEVEbE84UnRhRW1LempIcGhHQkEwY1A5?=
 =?utf-8?Q?bnNA4gh/molqeMW0Nm+HGkoVCz0ABk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 04:13:28.6068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4594fb7-c04e-4e9f-342a-08dd4276c81e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6855
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

On 1/31/25 8:01 PM, John Hubbard wrote:
> On 1/31/25 2:04 PM, Danilo Krummrich wrote:
...
>> +        let bar = pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core"))?;
> 

Oh, one more thing about naming, since this is going to set a pattern:
let's consider changing:

     "NovaCore"
to:
     "nova_core" (or nova-core, whatever)

Because that's how the rest of the module naming works in the kernel.
Even the Rust samples do it. And NovaCore just adds a pointless obstacle
in finding things such as /sys/module/nova_core, etc etc.

I understand that many Rust-for-Linux things are new and different, and
it's a judgment call on which ones should be. So this is my suggested
judgment call, after looking around at this (and also after spending time
with Dave's out of tree nova-core, for a few days/weeks as well).


thanks,
-- 
John Hubbard

