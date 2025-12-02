Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCAAC99EE1
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 03:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2D510E515;
	Tue,  2 Dec 2025 02:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uU4EbH26";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012023.outbound.protection.outlook.com
 [40.93.195.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB6310E515
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 02:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvu3jJBUMKqxIVQw9Z/akUgydAnSbAGM3eLQyB3mkppHI1t9Ebw6PU+VqEeiCZNnU9LHDxU8mMKKjEzARYMoTgxJ9P8HFMIJ8iEm1sp9WAyyvqUZCPmKFW7HpFIlE6ibffgWcGXkf99Polial6Mrrn98p6VRc9rxCoDQxOLizV9lFyP9kZSSKfbdZjnHGYURmfFn7UrDClmKgzZ/iQkkcv8x11/0xFuNsQzea4q4hHqvh+Fon05TEMF8aDq4xjHgKU3yNBGTMBGJ0c8hek+01wuJqVrj36A47W7YZ6VAD0sYrEpXu/sPWLWKtfnbFOUTmwwqBieu32Pb+pu+59yyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSgPl3ICCsNV0aYcNQn7ayfgvvH4zcGiYz7hMOlj+vk=;
 b=dH10FyxqZpLU/k+kYBZPG0WamSfZXzIIwLL8ZmiH9+oS6GkJ+lxzDoPuWEaccMyOIboONCPErx2uvvRI/K7nO1VSy6b/MC3PI3NzIbCgrScFr+G7xyCctD3H8j3rO3ClJvnr63SCGRFxY2CuyD3B0vAmtiYAzC/ZtjY6AswNSM03I9zkZLjKbqwbTZF3bsst9ydiabE9qpMWYxmwkJZd+M+ASocu04RIAtwikGDV74rB0AWU08/p/A7WM5zn5/0lbq0tf0YhU7iadeGB3TylA0XYKrPXzc9xm3f2CC7Q7xgAHWl+2CrJN9kNnOqQ/aGAIpMR309L3x6JZDh7Hj/HWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSgPl3ICCsNV0aYcNQn7ayfgvvH4zcGiYz7hMOlj+vk=;
 b=uU4EbH26E1pP1PKDMHtPZ4xt8AIPInCLWQ8UdYNlBV2m0jWtYeW9a2XYso8f0JfjjXROCkqrt6sb1AccE2tkHrbOssNWiAh/7SxXAXMvlDVscfirwZ7QwwceHALdzHvxgBKtGd3mX8onYAP0S7WyKAxYFRvEtNDzQjY5k/2/VseKrSIaZjv8gYzNhDfKV6V4V4chGvql6ZQttpB7YmX21619+uSIHoFV4b/aDFOV0bCuIBMn7IWlRy+Lxedojip1Tl2PwbPWSaeAbTLZxICxJmsOF/WpAue2MkgAG173kqPL4GKf9AjTC7AvSwzp0UgUPQJJVvbZFITreUWtajWARA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Tue, 2 Dec 2025 02:56:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:56:41 +0000
Message-ID: <02950fd9-8cb7-4264-b8c4-6e372eeade46@nvidia.com>
Date: Mon, 1 Dec 2025 18:55:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] gpu: nova-core: add Turing support
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251201233922.27218-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251201233922.27218-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf441a6-98db-4a3e-9131-08de314e6b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVNpQi8wTHhEcmgzaWVIRVJ1WXp1UnVTYkwzNGcvYnhEZUhvTEtreTFVNExV?=
 =?utf-8?B?N1FaVU5YS29qcVJGOHJ3c0RFNW95eGxkWTM1VUlEakxsWmgzemxWOTBMQzNv?=
 =?utf-8?B?ZCtEL25ZTHVIN2V5U1QxOGpoUG14d2pKTHR6a0YyZmoydkpDR2dySXFBM0tG?=
 =?utf-8?B?ckxGWW1QQjlpWXc3TDc0aTlHVVRDbHVVMXlHWGNqVXBPZHdVVFIwSlNtYkN2?=
 =?utf-8?B?eE13OTJ3emZoL1ZhbnU5L2d4Y3ZEV3FYS2czY1JhSTgxb2wzVFF4NFk1M0VI?=
 =?utf-8?B?TXJEaU16WFljNE9TRjROL0QwZ2JYdVAzL1pCT2J1OCs0VndUQStETjZTbXZz?=
 =?utf-8?B?QzBnMHJXYnVJVkN1cEIxTmdBOUFCYWhSV1NjOTVlMEl6SU0xb3ArZGxQYVFs?=
 =?utf-8?B?S1dTTzFjcnZhUm5LWGsyRFNWU1M3bDBIWDRKOW1jZ1ZjOCt4d3Q5M0ZKay9E?=
 =?utf-8?B?NWN5VTRDcTAzYVBFa0VaOU1LZHcrb3V4SUxCQ0xYVDFvNExKN2dkdUJ1SXYz?=
 =?utf-8?B?ZXRzNE9WMWVORDBWOFNLSUlKV04rQzNuUCtzR3BjaGlXK2FOQkxrZzFPaGFX?=
 =?utf-8?B?dHFNWXBXcnFUcy9lRjdHSnVMU0ZkTlNTQk0wRnpyRDNXVjNnUjBuUE5IOVhK?=
 =?utf-8?B?SjJFc1FEdVM5SXNHQWtWUGlpM1BIRGl2eFBNWEIzSmo5bUNTUFBkQ3RvOFpB?=
 =?utf-8?B?RGZKOTR0WnRicGlHOE9TMWJOUnQ2Ynk1SDc4bHZQRVBHMWV6andWQTdJRW1q?=
 =?utf-8?B?MEVHaFNkU1dvR2EwMG9uYmNSTXpyNnU4UTFQa3RqZ0Q4ak0wYkFpWVRaRExX?=
 =?utf-8?B?L2lDbTFFcnBUazBJWWR1d3dLcUE5THl1dVJidGEvdDN6ZFQ3L0JtUDJXak1S?=
 =?utf-8?B?UWZJQTg3elBnaTJyWWpiSWxIbm5aSXBKL3NMWkhGQll1c1hRd3JrV2tTYm04?=
 =?utf-8?B?S3B4S1B6aTBQNTB2VWlOazNsMDFZRkxqRjMzdHY0dlNRLzFmbkZKd0hYZlJz?=
 =?utf-8?B?eEd5Y05XYklPaS8xSkhnU2E4OU9KNndqUWFEbXU1VGxyQi9adnpCa09uK21t?=
 =?utf-8?B?bUNGSDBqZmpkNFQ4Vk5Yd2U2enZIYnVLVStPYzNKMUw4RW1ua1ZOL3d3YktJ?=
 =?utf-8?B?a2FLR1drbjFubXcrTG9PYjRaT21abk9HZVJQS1BGSDZNWjRUZWI2bkF4NWJM?=
 =?utf-8?B?NFdjSlFINkY1SzJ6bUdVaC9zeXFJcTZLWFNES2wyb0FmdDltNWZNQzZ6L2JU?=
 =?utf-8?B?bkIzRFpFdWhHVFJFd2NZV3N4Q1FrUDRuL1M1a1BqTThuczJ6QTAraWx2YTdC?=
 =?utf-8?B?SkU5T1B5Sll2NTRpZ3VxRUxHNzFidFVIalpiMzF3anI4TmpMSjcwVFJZUGVy?=
 =?utf-8?B?STdKTEo4WFVMSjBCVGhtY2cyMTJiQmNNQ1J2OUhObTRTRloxaTFoVWpOMEhK?=
 =?utf-8?B?UmRIMFh0UW14MDIwUm9YU1hFQVNQYzdEd0JMd1U5SU1ocXIvc3RTU3FCWERl?=
 =?utf-8?B?eGRybUNLVVRYNFVPTnBYekRhN2tyNnhjTEJUVngzYkNTVEJ6TDJZZDhwZEVL?=
 =?utf-8?B?OVMvZlZqazhSUmk5TmFXeHUwZmJyK2hRTm5LcmFrdlJCcEEzS28xQisxYUVn?=
 =?utf-8?B?VWVPN2VraU1Oc1cwMVpOaWR1bTdNVzlxY1NyNERNOEttSm5NeXEyQy8rRm5V?=
 =?utf-8?B?aXVHNndndHN0THRIV1VoOW1xeHJXb0Rkb3lLSXRJblRnbkt2M2JFbk00b2dK?=
 =?utf-8?B?ZzNYR0xWWkcvSm8ycWxmeUQwcU9zZlE2RTI0RDlTMHNiSG01dXQvTkFQd3R3?=
 =?utf-8?B?VXk3YVowd0tvazcwQ0tObXk5cWpoQmllSHNzOHJreUMvTUdkS1BaSjNnZ1J3?=
 =?utf-8?B?MEg5SG1QelFNSU1kS2NrbTd1elBiUGUzWkp1Rkt0VzBKaFAvWXUwbElCQWxy?=
 =?utf-8?Q?zieIOxhu/oskFLOE1iUbTddkbo/wxLna?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpXQXdmTk5jNlBiTGRhUE9sN1o5TDhqRDB4WFJMVFhUd3ZLN0VmUFZXUHFy?=
 =?utf-8?B?QWdhcnUxRGMyUSswZnBXaDQ1bHRWTC9BbWhKL3VDZTdxSk9qTWhzNmpEWlN4?=
 =?utf-8?B?UHNBbmkvR2hkSEN6aktWeGZWNDNlQ1FHckFHUURXREpzeW9Xd1RUREVSQWxo?=
 =?utf-8?B?MXJDQWluTTc4Wkl3VVA4Tm85aGtKSWxWWW56aVZnb1l5bVAzVzlJR0YrSDFq?=
 =?utf-8?B?RWQyRTRJVHpaeVI5NnRGNVZab2FHMld3R1lBVmtMd0lHcUF0eitxRzRwMGM2?=
 =?utf-8?B?VDNRRHoxMlY5UkxaTVVicFNLVEdvL0VtU2UrbGI2Z1hHQmNBVm1tQzh1S0w2?=
 =?utf-8?B?bmZ6RjQyZ3lWQ3JxcTZMODhrdkVNcFZLdUg2Ym85RU5vRFVDaUw1RGdwRXhI?=
 =?utf-8?B?RGdGQlhLWFQ0dnl3V0F1RU1ITlV2R2Z5bFJPK2ZHbWI0YUUydGhVRjY3VnZ6?=
 =?utf-8?B?UUZFdEZQa0g3Tk1XekgySXYybnVmZUpwL0ZCOVI2VVRCWFl2MjgwaTh4TVdC?=
 =?utf-8?B?UzFHR2lhYnF6RGpIaEExN1BreWt6cUMrU0JkdnllaFVrOURYRlBGbW9nQ3dR?=
 =?utf-8?B?ZFRMdjZFRW9jb2lKU2FldXk1YlNUSHpzVzYwTWpqWnlFN3hIMTZDclFSMFJm?=
 =?utf-8?B?Qnd0ZmdDZzdXZTVmaTB2YVo0cXgvanN6eERnU2hiR01uQVk1MVlCU2NUdlVF?=
 =?utf-8?B?MzNYQkt3a2U1WERXY09NMTZWYkthYzZCTHFVK29GeFZTNmk4Ym0yai8xMUZh?=
 =?utf-8?B?SVByQ2xYeEhVS3RaQzhtV1E0SVJSYkxadDM2RWJDd0tDUVZKTTVlK2JCR0cr?=
 =?utf-8?B?aGZqbzUwU2l2MmUxT2phWkJrNVdFL3cweVZXWXNKaVR1RXkzU1k3eUQweVpn?=
 =?utf-8?B?UFVOMEY1YVZmNU5jcmJmdFZGdFhvOWZDMTMzK1hPa2VvZ082ZmErS1N3Nkk4?=
 =?utf-8?B?OEt2QXd1cmRISmE2MDZQOFVyWmdpeERmOCs2ZllWK1lHemdweWw3SzBaT1Jm?=
 =?utf-8?B?MlovMHplWnd6aDhaS1c0akN6YVl6blRHZkVRejdrdldRWkloYVVwbzdBeW1r?=
 =?utf-8?B?eVRsOVdOOWpUbTBPYm5QaCtTNm04SHg2bXRNQzRVSlpDMS9yYTcwc2RMbmZ0?=
 =?utf-8?B?Nmc0bHVvYXVkd1V3Mjh0enNpak4wL1lYbWJGSU8wNHhFL1RkdGpzSEMvOXR1?=
 =?utf-8?B?VEw2b25KRW1Vc0IzRFcvMmk4ZTJHblJEZmZ1TmxwR0Jibm1tYWNvWWF3OUE3?=
 =?utf-8?B?T1dpVk5OM3FTRXA4S0UwRFV1QWhmUXRaQ25wd01mU0R6WjhLK2psR1JHL3lv?=
 =?utf-8?B?dnZBUmVPSmhSeDJycWpDWTN6b2J2TjlrWFlrcVNMVGVtOUdWWHc1SVpzeE9i?=
 =?utf-8?B?NU5PelVrZzNFWXNRTmczNmliclU2SzFUcHZ6KzdBcUcwbWxWejArV1ZVOHQ5?=
 =?utf-8?B?dFN2TUduM0NuY2huN0FCZVBGRTU4SFJ5QjdoSTlnWkIvNVQ1WnkwcE1GL0d5?=
 =?utf-8?B?ci9lenV6N2ovb0VzRmxvcE5sbjFkZTdGRXN0TzZKck1ySnNsQ1BKUXF2eGI5?=
 =?utf-8?B?WDJUTmJBbDVLRXlZYWxFdUd2UmZ3YytVQ21Kc2ZyM3hqL1FxeHduR0hxRFF6?=
 =?utf-8?B?cmRGcHkvSE40NFdkVm4zU2dJMVM1QldmOVBIZUlURVpmOW9qUk5BaUFUdldL?=
 =?utf-8?B?SDA5Nkd0MG9NL2d2SU05dy9UVElMdkRhWTdQS1VwTmduR1pxL0lzeGtLaThO?=
 =?utf-8?B?U1NhdHlZYUJodXpGOVc2TG9IL2tqYnFzVUZVUnltR1UxUE9Wd1NRNllXSGVw?=
 =?utf-8?B?RzYrc1loZm9rRTYyeTlTNTZFSTJXYzgzUzVXYVJ0bjFza29nUCs2Yjc4b01I?=
 =?utf-8?B?SjV5VmEwUndwc2pSZTRGUU81UUNtbkVXUTE0djgwa0o4VEIyQVhQWmJHUVF2?=
 =?utf-8?B?ZVFRR3dTQk5wc0FuZWRyNEdwMzJsWnZZWG1zNEpxRTJZclFwUTJrWkFxaFpn?=
 =?utf-8?B?NDZ4MjVld2lxQ1d3UHc4UGxDNnhkWFMvcHpFc2ZWSkFQbDN1YnJiandwR3g3?=
 =?utf-8?B?TGNvK254ZDR3M3QrNnAyNnJFUk1ma01wY1JwT084a3YxY09QY2lHczZVbk5O?=
 =?utf-8?Q?AK6RhwiE79TG71iWNnasTyrz+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf441a6-98db-4a3e-9131-08de314e6b54
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:56:41.2865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ue8gFIxgdHhRU6SUvYMKHSpSUzKTcOslTwTJFYEmQaqAKSs1K6lv9DeO835qhN2N/C1mizk0WCJqzCKWitpHQ==
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
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
> 
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
> 
> That latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.
> 

From an initial skim read of the patches, this is looking pretty clean.
I'll try to do a full review in the next day or two


thanks,
-- 
John Hubbard

> Summary of changes:
> 
> 1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
> is used.
> 2. Because of non-secure IMEM, Turing booter firmware images need some of
> the headers parsed differently for stuff like the load target address.
> 3. Add support the tu10x firmware signature section in the ELF image.
> 4. Add several new registers used only on Turing.
> 5. Some functions that were considered generic Falcon operations are
> actually different on Turing vs GA102+, so they are moved to the HAL.
> 6. The FRTS FWSEC firmware in VBIOS uses a different version of the
> descriptor header.
> 7. I don't know why this isn't necessary on GA102+, but GSP-RM
> LIBOS args struct needs to have its 'size' field aligned to 4KB.
> 8. Turing Falcons do not support DMA, so PIO is used to copy images
> into IMEM/DMEM.
> 
> Changes from v1:
> 1. Replaced pointer/length with slice in PIO code.
> 2. Added RFC patch to implement trait object FalconUCodeDescriptor .
> 3. Added comments to new registers, structs, and other places.
> 4. Fixed all CLIPPY complaints.
> 5. Added supports_dma() method for Falcon HAL
> 6. Renamed ImemSec and ImemNs to ImemSecure and ImemNonSecure
> 7. Several other miscellaneous fixes based on review comments.
> 
> Timur Tabi (13):
>   gpu: nova-core: rename Imem to ImemSecure
>   gpu: nova-core: add ImemNonSecure section infrastructure
>   gpu: nova-core: support header parsing on Turing/GA100
>   gpu: nova-core: add support for Turing/GA100 fwsignature
>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>   gpu: nova-core: add Turing boot registers
>   gpu: nova-core: move some functions into the HAL
>   gpu: nova-core: Add basic Turing HAL
>   gpu: nova-core: add Falcon HAL method supports_dma()
>   gpu: nova-core: add FalconUCodeDescV2 support
>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
>   gpu: nova-core: add PIO support for loading firmware images
>   [RFC] gpu: nova: implement trait object FalconUCodeDescriptor
> 
>  drivers/gpu/nova-core/falcon.rs           | 226 +++++++++++++++++-----
>  drivers/gpu/nova-core/falcon/hal.rs       |  19 +-
>  drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +++++
>  drivers/gpu/nova-core/falcon/hal/tu102.rs |  78 ++++++++
>  drivers/gpu/nova-core/firmware.rs         | 135 ++++++++++++-
>  drivers/gpu/nova-core/firmware/booter.rs  |  46 ++++-
>  drivers/gpu/nova-core/firmware/fwsec.rs   | 215 +++++++++++++++++---
>  drivers/gpu/nova-core/firmware/gsp.rs     |   9 +-
>  drivers/gpu/nova-core/gsp/boot.rs         |  10 +-
>  drivers/gpu/nova-core/gsp/fw.rs           |   2 +-
>  drivers/gpu/nova-core/regs.rs             |  73 +++++++
>  drivers/gpu/nova-core/vbios.rs            |  73 ++++---
>  12 files changed, 805 insertions(+), 128 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
> 
> 
> base-commit: 57dc2ea0b7bdb828c5d966d9135c28fe854933a4
> prerequisite-patch-id: fcf54aca59a74f7ca677919565b427d18406462c


