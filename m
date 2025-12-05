Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB97CA86DF
	for <lists+nouveau@lfdr.de>; Fri, 05 Dec 2025 17:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADD310EB63;
	Fri,  5 Dec 2025 16:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HTh85LUI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A036110EB63
 for <nouveau@lists.freedesktop.org>; Fri,  5 Dec 2025 16:47:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Px5sIHYKVB3Lxwrmcj0WFlN3ikNBRy+LtZ/mPyYufakrz8TmgYpM5cfVtUn+yZxJFyDaO+trHsTUgsd9xYI4aGuDxfYByF8fb8DrMZURYgvv4AWPJ08xvXHaujR7XFQUM2Xr65ZDOkzASHl7hDWyXkvagVwRXT9LKj+1gh8Je1g+GUjr2Nb1k0mkLnI+ONPK4HzPOuc15vtooZXsaj2Pt6Jh87LsIKST01Ng1htCS0cWmtXKSO0MbOQzuuLTSqy0IwNRSVqZDAfbTs15q1s93P36DaGn+13D7uCmvjWs98xzOp+DDQNDJ57jS4zC3CmmQsR0RdjYPMqjQhlb92SLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BX7wSfdulQSFFBlMywzx/WBPmLXtYHJ1rEWZ91Phuk=;
 b=Yh6Fy+cveX+7lL5arblbixx5aNKIUUUURMN43nQVloPnbWf7deMqqnCYgGDa2uWjS+pxxryq0AjPt/4gvH5XRHOW8e0YDudlhsULgC6/P+70QZdjCh+KeD0Am2ZKv0BjYA5qIHRxdLI2J9gHK3xS1iTI9iTsw7WMm9hQeOZtLO8ilVCYFeGMnwu8naO+vYAjuCd8JTnj+5BYNDYILt7Vwscf2Ba+mocmFkgAQrQbfeXS9qV5Aqy6pEU7V3745wn/LzjClNo6LGrDwo7Y1c/r9kiC3GfKHlf0JFPBIC9sGvgsK60p9q4diatoFqBSm0oSHmFeGKYDg+KSZIqxUnLBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BX7wSfdulQSFFBlMywzx/WBPmLXtYHJ1rEWZ91Phuk=;
 b=HTh85LUImDj/NjDcnq3jjITqApia6Heq5je+tjRUfONKybdl2lEmHW7rWf4WhG4y68f9VuCy3FiOG1X8T4EJF+PINbqdD9HcJvBZkdw0HJnTbv/z3235WD9MsrMLluPxy3iYxntyTDP2p6ldayMaA5XQI4BnNsadYCP4TFC6glxuR3mo1JsTT2EHKIrzERjJ0EW0TO5/S4DACI8Yv52+94ZsKNKtCiQAvWiikzL3qEpQAUEX1egUn+uILfE9k+NKy0BEwTVW/5m7jVbDvQutnL9HOjToASq6q8odsLP0j82RWpvyrEna3KpbocEhmZKdgAHXGFsD1GlHub58KS6o4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB9000.namprd12.prod.outlook.com (2603:10b6:303:24b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 16:47:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 16:47:31 +0000
Message-ID: <37a85b2e-603c-44ad-a346-783842e9c829@nvidia.com>
Date: Fri, 5 Dec 2025 11:47:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/31] gpu: nova-core: Hopper/Blackwell: add FSP message
 infrastructure
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-17-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251203055923.1247681-17-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:208:238::11) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: 806b1885-be1f-4e7a-040e-08de341dfb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU1KSzQ1RWExR0dpcUIvaXIyYzljTHA5RHBzM1hHaWh6dk9XT3E2U3NOT08z?=
 =?utf-8?B?Z0oyMmkwcmZ2V0svcXYwMExaeStFeW01TUNzOWdXVEpPRHFKenhuQnN5QjBC?=
 =?utf-8?B?Z1FVWmcrbkJ4UElWQXVVMG9HYUt6VkxTOEpSbnBkQ3VHclh1TmZnR09udUVm?=
 =?utf-8?B?YWZtb2Ryc1ZHVWh6NGdTVkNaZ09SS3Q3MC84YUdvaTgwN3krV2hqVTRyMFEz?=
 =?utf-8?B?RFVhbmwyb3pyOVgySnN6NkdzMVkvSDR5cDZRZ2o3cTZIQmhXeVFBa0FDaGVP?=
 =?utf-8?B?a3YwTTh3NWUyZitEZTRUWGYzL0ZiRDllMnBia1ZXcmg3SFV2NnV5d2ZScS9U?=
 =?utf-8?B?bm1yQTlVWFZxOUlWUUxyQW5hOEJVeFYvVTg4WXBqUmgxMUt6K0lYVEVvaTJD?=
 =?utf-8?B?QXp6VWNMT2dRTFhJenVhTlpNSis3YjJwc21peVF0Yzg5VjVxUE5idjV6UXNo?=
 =?utf-8?B?N0cvOXlNbW9LRWcwRVA5OUJCYjVKelN2d1ozdVJURkZtRmZLZjliUmVuZ2hV?=
 =?utf-8?B?OU1sZEYzTFhBLzY5SHQ1aHJZNnNXQXZlL29lWW0wN0ZhUTlOVDhJTHlvRW56?=
 =?utf-8?B?anlSbHNHbytKekJlTlNoTVo1UlFEQVBMdEdwS2p5Ry9XR0VUTFdTVjNPalpW?=
 =?utf-8?B?ak1sL3gzTWIrRDd4emRoY0pkb1dGcUlyMnpGS1pIaWdrUEg3WHZPN2JudjYr?=
 =?utf-8?B?emZ5aGRQSUQwdjlWZ1Z5YldXNHIweXFzcWFuVGZKUjkvQS9udEwrN1Jxdnh2?=
 =?utf-8?B?TTFFbUZIVk9saWJDa0ZUa3FqLzhwRm8xb3Z5QmxtdU5xK0t2cUxHMGk2RjZV?=
 =?utf-8?B?RURzaXBkcTZmWHZtZUVXYkEzUi9KSEJiQTBIT3pseVdiYmVBQitjQjhjVENP?=
 =?utf-8?B?Y29YS0tZSTl0d3liaFhzMU1uOXkxNytnUnpybEFUOCtUN0xUc2dGakp3aU0z?=
 =?utf-8?B?bFZCYnczRGVpV3YxNEhwaGJrZWdIekxnV2lJNlQ3b2FxUU1wNzJxTmhXbTFs?=
 =?utf-8?B?UTVjaXhFejBRVVEySTkzSkpEeGJLUjdZUndrUjJLYlVHbStxOUNZQmxGekVn?=
 =?utf-8?B?Z3VicVpXUUFXdVY4SzNxbm0zcEpoeHpVRU9BVmZPMXAwWjB3RWNBUGI5QVln?=
 =?utf-8?B?NjNjRFJWM0FYNCt3NXFxVCs3aEFOeFZnK2cwb1dGV1RGR0hhSTU1TzRvbnQ0?=
 =?utf-8?B?UzhiTDhOSGk4K3hWRVVrNjRlN2dZV2FHbFhxaWswVUduZTlDRXl0THRkNFZk?=
 =?utf-8?B?WFdndXp0elNNa2xKK3R3TFYrT1BIZVhjYUdqTkRlbjJiZ1FrOXhNY2V1WUFm?=
 =?utf-8?B?MGEycDBjWHQ4dzh4MTNTajFnaXRFejdtQTMrdy9DWWVDL1l4UnRnSWtoMG1y?=
 =?utf-8?B?RDNqaElkRldnbDluTWVQb0VsdlZzY3NxVWwzTUFGTmFacTdZWGYyQjdycUFo?=
 =?utf-8?B?ZnArTGNRcjRZV0tpaEV3c2VMU0xxeG9paGFtWmJQL3c4akZYZUlnT2twYmJF?=
 =?utf-8?B?ckNaZUQrRXd6OXVnWlJXT1FCKy8rZ0hmRklLd1pqaWcxUU5Zc25yR3VZRm1E?=
 =?utf-8?B?WHc5RGlnemRYdWwvVWluM0g1ak9VdlFzbWVCTVZpSWViSkV6VnY0ejBIWHR6?=
 =?utf-8?B?K1IzMElHVXN2UlVENmo3RVh0YS85bUNmaHdkMmlsMEVmaTdwbU1sWEpiWW53?=
 =?utf-8?B?a00yLys1L0p1OWhZNGdGUk5HeXdkaFhKdkkwRWo0ZTdlV0JHZWI2eTJIREdN?=
 =?utf-8?B?SmhDdEhCRDNObUVRV2VDK3pXOWdaR2hxLzJmRC9xNGpFb0g4Z3ZWQ0ZWZlJn?=
 =?utf-8?B?aUlud3BMbTUvaC94a2VqYUdpNGpmQlZjMlI1MHZiMVg4U1JKZlo1bEUrd1Rs?=
 =?utf-8?B?dm1hdnAvM3dpWWRRTm4xbWdMSC9HYlFDQWRVOVBJbW9NNzRjbEN5aWpyUkZC?=
 =?utf-8?Q?XU1rlj6J56SvPBrui3ek0XY92ExZLOqY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpWNHEwMFR2M2UwSEFIb2ZsWmtWS3NYYmNkVFdhbDZ2TDNMSURrcWhIRXJu?=
 =?utf-8?B?WFRmdFhGRkhQSUNtcmgrZTJXNmV3SHpMVHBzQy9RUlh0T2ZTeWt6aitEckM4?=
 =?utf-8?B?S1ZUcmZsMFk2R0o3YWY4MU45M2pXNkk3NE9zOFl1cC8yaUQ2bmlEZTdzdHNr?=
 =?utf-8?B?SVBKUjNDM1pMRDNFNUwrODhCVENnZThNU3pLQVlIUkJKZUZMczhCMXJRNHlj?=
 =?utf-8?B?Wmc3a1B1R1hjVWQwelVmcTBLL0RTZVl3VUE5Y0J0ZHRhU2xubEl0RGxIdHQ3?=
 =?utf-8?B?cGlaZHJvdjU3Z084WkxKZThob1FvZ2VXTHJ2OHhudyt2NlBicTQvRENkcmR1?=
 =?utf-8?B?M3d3TGxvb0VoenZTZE9ZdE9BdWxhN1FmempuVTNTU3QzVHdrbWZyMVJLWWdE?=
 =?utf-8?B?OFRObHk2c050REN0VSs3dW5JQW4vUjdZVjhTM2RTbnNyMlNRbmx0K3hncHM0?=
 =?utf-8?B?UDByZnRvMXpLMHowaUUzbkFXeG1rZ1lIaVdCd2RyUm5XMSt1WGNVZkRPLytV?=
 =?utf-8?B?S0toWkRmRGxHbThDa1BWOXE3V2Y2ZnZWSlN4TE1OODdrNmxmeVJsMlQxU3A3?=
 =?utf-8?B?UU92bGQ2UmJYc2tscndNOXRjWVdWSW00d2tQSVVCMHRFVFp1d3pLNUY1dEdi?=
 =?utf-8?B?RnlUWm5xTThsOEhRSGdibTZhNW5wY0VHR2hCZmJ2WW8xOEF3d0tWWXBTSWh0?=
 =?utf-8?B?NDROU0lhaXRaR1BSVFpiT2hlNXFLS2FKcmdDWGVLc01GQVdtNnZZN3NIbkgz?=
 =?utf-8?B?MndtYTdqSUtleWYxRmFLMXBxa0F0a25zOEZad2laR0pXNS9lZGFLaFRuOHNl?=
 =?utf-8?B?eWN3L3JqdnRERk16Mmp1dVd3MjQxOXpiV2tmME5xMUFrR2Niby9tdmVBbnho?=
 =?utf-8?B?Q2tBWXhNNjBrQnFWSW1kK1pqWkMrUDUzL2dOTVBsSGlNaHRjWW1GK2lFUlgy?=
 =?utf-8?B?TTlDTGtIZVJUMUVRdWRodUhMaFl1eVBidm4wN3ZpazV3T3pxN2tuelVnb0hS?=
 =?utf-8?B?OTIyRjliL2x4YWdvNTZETDFNdDBiTGloRmRuQUZTcHdjUXIrWGtadVlINkNG?=
 =?utf-8?B?dUJwUWpveGZHUVZ0WjZ4ayt0MG5GWnVvdktMTjBWYjEwbFRlTm9GK3BTeVFL?=
 =?utf-8?B?a1l1enY0M1RycnZXYXVSRjlnS200cUxOcTJwZTBwdlo3d3hkWUhkK0ttaElD?=
 =?utf-8?B?b0JRMDl5Q1U3SXVKZkczY0RGVVo1N0JiZHZGYlNEUFFlN1FwM0VCR2tqbmVo?=
 =?utf-8?B?azhtaU5lMDRsclF4a2wrUTlNWW9abEJqTXI0MWFpcEhtT1dXbnZNdnJlbFQx?=
 =?utf-8?B?WGhyeXIzY01lZUNiRlBtV1NSWU5iN3haMEw5TVVDbkFGQjZaNHFrTGhOYlRv?=
 =?utf-8?B?MTdDR2tGajg5S3lUbXVQMTRzRnRyaW5NODZVOEFPb1NyRitMaFhEUEF3RW1j?=
 =?utf-8?B?TWp4dmtrNWFoOFhaWFhlSm5NVHZSbDZZZ3djMEE1UUVaZ1Z6WG4wVVJnNTB6?=
 =?utf-8?B?clpldE5ZS2pkWU84UTA2R1NVY2Z5S2hPdEY4enRTa3luQ3d0OW83ZkpiQ25K?=
 =?utf-8?B?R0xSWHp0NTBXeEVkVloyVUxxS2xPckdtcGVTUWFTbmNSRlh0em9KczZTNDMw?=
 =?utf-8?B?M2dUMGgyOG9ueE9aQUpYczFnbXVyUkR3NW9DZWJQNzk0Zmk1bWNyaWt6WDhO?=
 =?utf-8?B?b1RCc25LVlhwU2RkcGpZYy9WcHlqMXJMNkg1dFRMWitwcXZzOHkrVjd2MG5L?=
 =?utf-8?B?WHFjN0RMYlh2YmlXNldhR0JDZ3ZRd0RQRnJsT3FBYm5SaVc4VzlLOTExUFdS?=
 =?utf-8?B?UHhaOVFjQmpCRFJKQ1BobEpZeW1oaXNURnpmTUZYWkN4b0xyNHVqLzdkOGZs?=
 =?utf-8?B?TkRPN3lIOHZyZ0tETkd6OUtWSXhNZytlRUI3c29CSThFTklKVkNld3FVUWZJ?=
 =?utf-8?B?b2hoTDNjajkwUDAwVG9pWGQrU3M1clcwZGJzWTZVdmlKVkxiNFVLc01oVzBN?=
 =?utf-8?B?VElob0d4N1BrWUdXeHl0eFlHYUE1ZXZTeExSZFN1THF3ZXBvNHZQdGN6SzRx?=
 =?utf-8?B?aUVXZ21LZGhISFNLT2o4U1g5OUNNNTZxMU9pU3Nac1FDQnVtQWhrSU9FcXdw?=
 =?utf-8?Q?U21XkbXbs4P1Dp0cM5Wqn/XV4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806b1885-be1f-4e7a-040e-08de341dfb74
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:47:31.2769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dz0D+lKPlC0h/2M8iqAbYJFFxNDOhPTCLZaydGHgt58Cf44z0HKgyJNGl3lEUujyf/iHkhkLFL1kKQnxBPf1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9000
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



On 12/3/2025 12:59 AM, John Hubbard wrote:
> Add the FSP messaging infrastructure needed for Chain of Trust
> communication on Hopper/Blackwell GPUs.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/fsp.rs | 77 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/regs.rs       | 48 ++++++++++++++++++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
> index 9e796e82e556..0e8522b1171d 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -87,4 +87,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
>  
>          Ok(())
>      }
> +
> +    /// Poll FSP for incoming data.
> +    ///
> +    /// Returns the size of available data in bytes, or 0 if no data is available.
> +    ///
> +    /// The FSP message queue is not circular - pointers are reset to 0 after each
> +    /// message exchange, so `tail >= head` is always true when data is present.
> +    #[allow(dead_code)]
> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
> +        let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
> +        let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
> +
> +        if head == tail {
> +            return 0;
> +        }
> +
> +        // TAIL points at last DWORD written, so add 4 to get total size
> +        (tail - head) + 4
> +    }
> +

Can we harden against integer underflow here? Even if tail is always >= head in
normal operation, I think we should prepare for underflow due to misbehaving HW
etc to avoid producing a massive integer, how about:

    tail.saturating_sub(head) + 4

Thanks.

