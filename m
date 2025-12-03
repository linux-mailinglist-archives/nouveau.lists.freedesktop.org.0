Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E42C9D658
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 01:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C64410E002;
	Wed,  3 Dec 2025 00:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IZqhxlZo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EE910E002
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 00:35:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HfcVHXr4sxFnlS/z10HDc5E15p+acNZ+7Sfys5Gv5iefN2tX4EWyz4nZuFeMakrAqhJj/7vJzhPQABk5t3wlAnN4onlpMUsMkfKfjCoQAxQULbQqxGWS3n3Map8W4yfJh5AWEiguB+DB6ti8pvYpt32bvcp6vrjsVAsLeWrotiCgD2JhudMw/us6BsSnBp2gw+ZyzMhgtf1vSFid6A9EnGVqvcQVW8lQQ64c5r66SX/0xBgMDin6qD1PdAyD2SG6bTMB/amH6Jt7mN49DIWXiH1zouM7SHz2AGRv9SSjuGnzLjksl0Q7HEv8GaNmNlblhvUKLDURggz0G8gXYid5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRnnTSkC+BcGo3iwVFsJWPzWqqqfZ59m2W3EkAxqX4U=;
 b=YqyFV4AznHF/OEnqg4JafEbVby4qLG8a6GtynZrt+mHGfsUmU9V2p66G7FNpkEszWi7g+l1e6s1GHGfK8PTyCstAPuTD58cAQXiCDZ7eZeKHblNiYB9vuKGK5L/ZyrAflV/OnmB3J4tVg5s6MtqOVoZOkOh+lPh5Tr5jzTmMpG/06N4h+Vxc2Czt4f8wKtMTzKu4lhcYoyI/naifavOgyu1LFh/ufLDQFihhB0wzklQAzltsI7uYJ6zXe9vgkM2snH1Wds+uhwG8oeIjhM1wOoM2j2PYmDSNCvyBZNfrDHbsJODcbr1kbydSbgyzMnMXCk6GsZi84GI0uWgdhIJE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRnnTSkC+BcGo3iwVFsJWPzWqqqfZ59m2W3EkAxqX4U=;
 b=IZqhxlZovLiuDn2tjuY3FemvOnYiPwEBQ7ts3k73X6hwrQ9AUD8GEVcvyDeo0H0QsSLIwELehxvY1CunZziAt5A6cjnzyNxzEzVeih6e07Xm9YucpgRlvA2G1PgoPDGJoLK/jOgFa68YN2E7wcgnd6DbhY7MTOvV6u2e3stvzOZD3f+Xwm2Nzp3aNaIGEMRbcILQUhbK0NycB//9AUdRNYQj9AO52h+GdwTVCSVkf+vc8yoFGH17gl/wuC7OSryZGaVtIkYCNKZekFTB+DDD4C3pxt7SwacNrgs/MIBd2VCffUBHmxk3jBk/aOKl1+zrSvY9BRS6ieA076X6x6go0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Wed, 3 Dec 2025 00:35:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 00:35:10 +0000
Message-ID: <d94e68d7-84a7-4540-8de8-5f163d22d763@nvidia.com>
Date: Tue, 2 Dec 2025 16:35:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
 <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
 <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
 <44986645d9ecb62887f8d3506533d4ef369af69a.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <44986645d9ecb62887f8d3506533d4ef369af69a.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a3e3b8-9d30-41d7-98eb-08de3203d07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUozSzBUeUtpVXhEWjZtYkkxMDEwdHI3YlBrMFY1MFhMK2JnaXJhMkhZemVG?=
 =?utf-8?B?ajZhc1ZkU0RwTkdHMVUrZEJHd1l0RnI5ZldYTEtBMlJkcGFCdmtiWmd1eDlT?=
 =?utf-8?B?bkdpTWhaQjFXcWpDVUkzU01mSXc2c0tsUXNuZUZ1ZFVnRFNEa3h3bTJEUjdJ?=
 =?utf-8?B?WVZucUlEZHdPaGg0YnljMGEzS1ZBT2REWlZGUTlHT2luTjFKYXZOVlptYmpM?=
 =?utf-8?B?blZXOXVOZU1aSlpuSE16bEVOMXJtb09MbytyTWVvV2ZrT0dHV25DS2JFNkc2?=
 =?utf-8?B?dkZhWjl3VHVuUE03SVdLM2tiV09VZlowUnBNQis3L3hmZnFSNHY5akRjbFdJ?=
 =?utf-8?B?VnVwOVRZbjZvS3FTUFFVdFB3SEtyUTkvd21veUp6dnU2YkxjbzR3cG81dXR2?=
 =?utf-8?B?dHpvRCtrdnl5bDdKeE1GaDBMMjlJWVloTW1iamVtbWI2QU8wcjNJbCtaMXVV?=
 =?utf-8?B?MkV1eDEvUTZEaXFPOTdFMkhHNGxlYVVna3lpd2xTZ3lBYi84RHFqY3BaUnoy?=
 =?utf-8?B?YXdmUXFUMkZxUThDSzJpd080ek4vY1N4Vy9GMC9IR1VPUmVEQ1NDVUkya2Vy?=
 =?utf-8?B?ZTNqbnl5UUZCM2NudFNDRlFPVXh6a1UzUEFNNDgzZnM5NTRsbk5aZFl6R3Jr?=
 =?utf-8?B?NllkV1B2ZGM3S1NkUTQreG9rVXRUTmdyd3NYenlTSlAySjYvNWd5dWVZMlN0?=
 =?utf-8?B?Um5HbW9jeDNFdWdvTm5KSHZZNVNva053b0xrYUtxRzlpZDhMY0tFNis1c0FH?=
 =?utf-8?B?SDNwM3laL1F0R0JPVmhJUDIyNjZJSjFnT3NVL1V1M3Q1VXV5NUlNM2Rtb2hk?=
 =?utf-8?B?UXhPTDZzR3dYUEpTZFl2K3VTeklsRHRISnp5ZWRCT1VKdEpZMUNXZXN4UFVW?=
 =?utf-8?B?dGNVS1hMT3lqbGMwM1dDTzRBdDhtM0hpSlNhbGJGa1NYalFIM09MVDgzMVBN?=
 =?utf-8?B?L09tb09PcmZtU01PeSs5Z0c5a3NjeHFzcEpHU2c5bFZCa0FlK0VFdk91RXcv?=
 =?utf-8?B?dEV6Vk14TE5VVmtBa29QMVNaeFVEaC9NNkZKNitEa1Q0QnA1TWxBckNZZGJZ?=
 =?utf-8?B?UFBVQW9seFpLWHpJeVlNTHIyT0pGL2VGcjFsOWVFM0NIdG5jWlhuNFAxNFRS?=
 =?utf-8?B?K25yT2JlY2RjMllTVThVTXBpUTdDTlpJOUlTYkJoOFRpdElvNmZjWHAvam1z?=
 =?utf-8?B?ekU1cm9DMTVOTHhpMjZlaEkwSjVBcXJSeERGRFhUYVRDV1R2b1IzT1JYOEgr?=
 =?utf-8?B?dHBDSE1waXpDWm5QOEN4b0pBL3NZa3VHc3BQaXlEZVJZVVdoMzM2RzVDMWlP?=
 =?utf-8?B?Z0o4c0VHRzdNckhCUE5IblZYOFhlMTNnR0ExVUpjdkxyZ09SOHFISU5ieVNq?=
 =?utf-8?B?VnVxdThnYm1zZWpOVG9iU1JvZXZRNUVUa09xbXBxK3BudnM3VlFMd25wdEFr?=
 =?utf-8?B?Mi9ubjBQdm9sNUpsakdrM3pBV0hGUDRtVTZWbHVaZWJoclVoYXdyK2lKdnhz?=
 =?utf-8?B?YUR1SE9TZDFnMFBhVDhPdXVuVG9JZ3luQ21KckRRYUM4em1tRCtxaHFTd1p3?=
 =?utf-8?B?cC9JU2tWOGp6R0VPL3pySDNyT2VGSHV5RkEyUlcyR3ZBZXFCdk80MW5UdjhO?=
 =?utf-8?B?VmN3WGRnQWFmdXU3eE5zSDBSY2x1Z21FYXNvYkp1WS85MnhLVXYzZ2lySTlm?=
 =?utf-8?B?Z3dMSlRkalFiSk5TaDdBUWYraUFwR1I3MnVSb3ljWWd1SE0wL3R2V0R4Zkla?=
 =?utf-8?B?SnV0eUFENGVmT2tTK3FHNmw0TG84WmxDZlJUbTY5V2Rpc0QrZEdjTE5EbDlY?=
 =?utf-8?B?d0lFQkkzSXBnNFdlS3QrWW5VQzZUQ1crMUsvNkVuUi80MUVUNjFlS1ZRVlNq?=
 =?utf-8?B?OGpCd3dCYmpGeU0xOE53by8zSE5jS1dvZS9JaGUzS2w4NEdQR0hKK2RJK01n?=
 =?utf-8?Q?2+LwoyK3kDqz8mtGxvtyslkZd1LWF5uU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFhVaGVYbU1TNjJWZ3NLWjVSaDZVMENVQTE4SFMwbzI3UGlnSEVPdlVQMUs0?=
 =?utf-8?B?cWh1Y3k2Z2JlV0lHc2RGR3hYRytxRFRwVFdNbVJlQlFQemFBMEJFdENZSEVC?=
 =?utf-8?B?QkpTTTJ1SzRLMVMyWUhRUmk1eFFzK2xGOW5vZHRmekxaWUMxVVBrTU9tR2hw?=
 =?utf-8?B?VVNUcXNCNzhGR2t6S2I1OTRvYjNldkJZb0lxcVBXd0dWUnFZbkg1LzJFVCt3?=
 =?utf-8?B?enhwKzE2T3dJT2kyMWZtaEFKeHRsT1NJZTJLQjlPYXFBbnkwTVJsOXFRWjJF?=
 =?utf-8?B?bVdYeWFKUDZWdFBabDZ5d0M1QmN4dFV2V2FEVFRKSGZrZjhzelJ5L1lNT3BO?=
 =?utf-8?B?eVFCd2dvRG15M1ZHTmpVc2NRTFZ0L0M1Und1a2ZURnlNVXpPaVBCMUlKVTNS?=
 =?utf-8?B?cnI3SE44SnhIdHI5UEhLUXNlR0JMS09WTFQzRUQxOFdocTUrcGN3OXh3TmFl?=
 =?utf-8?B?VytBd1JOd0lBY2hxVEFDczJoWWNBL2JWcEFKOG8xTnp1RTcwc0FkL0xqL2ZQ?=
 =?utf-8?B?bW1FVzZDTExoWjZ1YkF2ZWRPeUNoZk9nVENJM2VpeWNkYXhQRnNSeTl5VUVz?=
 =?utf-8?B?Q2FxbzhqdzQ4Q0tlZHBZQXhKT2NkWEV5TUszRnRYVitGMktjYzJPS2tGWHhN?=
 =?utf-8?B?aXFZSElpK3NVUC9WVVpXOEpWeFBiY0xGK2NsL2NmSDNEZm5Jdk96Y25HL09i?=
 =?utf-8?B?Y3RvbUR2bTA4NW1lQkpFUEZXNXZaVDFuVjhJQVM2bGs2S3lMVmw1d0FHdUJQ?=
 =?utf-8?B?OGF1OEc0NUViSEZhbGc0aTFDVnNRY2JJNnY2UVBTSmZpTW9UUm5YQXg3VDB0?=
 =?utf-8?B?WkxUSXJIdHVBVmhET25BSERmOFBDN1V5bGluZk5oYTJoOXhVcmIrOHcrK2hD?=
 =?utf-8?B?V2s5aUpBdmlRNFNkUnRRZklVdDhHMDRVcDNyRjdCeUdRNkdGYUlGak14eElQ?=
 =?utf-8?B?UlBJRHF2ekEwN3JDSm9yMXRnU284M0ZPa3pKeis0Y09tSTJvMHJCNXQ1T3da?=
 =?utf-8?B?ejF2aXUwK0FCdWVVajlseFhLL3NoWkF6bHd5SUZQUFZUOTMyRWYrSUJvcVdE?=
 =?utf-8?B?T0hramxHcmdWcUR3bWRiM3NRVWJISmpUZlQ2Z3ErMWM5TytncGlQeVRJTkR0?=
 =?utf-8?B?bUJ3UEdlK1l1WW5qNWwyTDV6dTNlQldBTjk1TXl1THBpVnR5YVRpTGtsZUI3?=
 =?utf-8?B?cTh5cGJTblp4Wmp6cm94UkIrRnNzZ3ZTdVVta1FLNlU0Qkl6OEkwR0xha1Zj?=
 =?utf-8?B?VytoTmtYSXNsTW9Jc0E3RG9OdGwreWNCeTM3RGw2cjBRSTE0UVZ2UXFyVUxh?=
 =?utf-8?B?RXhGYWlzMVZCdVZmYk9RM0h5aHViSG5LNWpHNGNJYkIxTG9hL0dzb2tKaUFt?=
 =?utf-8?B?Q1Jtd2xIdTBNRDdQVEtUVlo4dHN2WUIwU1ByK1ZnMjBkVUNSVmhqYnZPdUdX?=
 =?utf-8?B?UFhPQ1pKcnAxMnpTTnVzeUdNbWY0RnJPckJTKy94SnZuSXFQY3lIRlhoRzJm?=
 =?utf-8?B?aW1vRnVFVUJRNVhHSTFwbkZrcldTWHRvYmJVQkszTUtBcnRSMGFveUJ6NmxX?=
 =?utf-8?B?UXVvUmI5d0x1WnYrM2ZCQ3c3QlBNZHlEZ3hLczMzSEJKUEdueE5ISWJCUnVD?=
 =?utf-8?B?bVFSKzdQMkozMmlodHBSNUpwY00rWlRCM1RzUmJIZ2gySVI1T2R3bG9xZEZs?=
 =?utf-8?B?SEgyNTZEbnQzR29Pb25jN3pQYXhaV3JtUHp4Z1htaTF2dkNNR0k1OW9ndVNi?=
 =?utf-8?B?RjYxaHpuNTVBV01QL3ppZUFGUFdjUDE3Wmg2SUJBbmJKQmRSdDBkYjUyaWRK?=
 =?utf-8?B?ekM0dlFuYk0rakFsMy9PUU0wZkpZa1hZRkR3VXVHekJGaGY0a3dCVW9ZR0Jh?=
 =?utf-8?B?VzJYay9NdUlZTHp5ZzJGeUQ3eE5vQkdOQjJYSDBvdVk4VmpjUHdjVFFxVXNC?=
 =?utf-8?B?OFNpMTgwN051L0pnV1ErYjNweVRPZFFWYkZRUFpqZkdSNDF2eU85Y0pDck5y?=
 =?utf-8?B?LzMzaDNKOFdKQlhheEk2N3NKQi9DYmtMbW16SWprQmg1SGZscWYwQnl2eGZY?=
 =?utf-8?B?bFZqQXQ0aVBjR0MyM1Yrd2Jxem1IVTJXMVhkZHdvY3ZGN0hZVFQyWGNsM0Zn?=
 =?utf-8?Q?JNKbbFmsOPDJosbFo+sK3OYJH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a3e3b8-9d30-41d7-98eb-08de3203d07f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 00:35:09.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRTLoxHwdZS5WxuaFunFCjzfsAFA3tkNnzyTEwj03uEfOz9vv72KieF4fpLrwui3u4qrN9g9GfpaQ18hDVwo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160
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

On 12/2/25 3:48 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 15:40 -0800, John Hubbard wrote:
>> In fact, I just finished looking through my Hopper/Blackwell PIO code, which
>> also needs 4-byte alignment, and concluded that returning -EINVAL for misaligned
>> data seems to be the appropriate way to handle things.
> 
> I've added this for v3:
> 
>         // Rejecting misaligned images here allows us to avoid checking
>         // inside the loops.
>         if img.len() % 4 != 0 {
>             return Err(EINVAL);
>         }

Looks good.

> 
> And I manually create the &[u8; 4] now:
> 
>             for word in block.chunks_exact(4) {
>                 let w = [word[0], word[1], word[2], word[3]];

Yes, this is probably the best way. Although...

>                 regs::NV_PFALCON_FALCON_IMEMD::default()
>                     .set_data(u32::from_le_bytes(w))
>                     .write(bar, &E::ID, port);
> 
> word[3] will always exist because of chunks_exact(4).
> 

Interesting, I was just looking at this, and the 4-byte manual
construction bothered me a little ("why must I do this?"), so I'm
currently wondering if "// PANIC..." plus an "infallible" .unwrap()
is reasonable, for example:

impl Falcon<Fsp> {
...
    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
        if offset % 4 != 0 || data.len() % 4 != 0 {
            return Err(EINVAL);
        }
...
        for chunk in data.chunks_exact(4) {
            // PANIC: `chunks_exact(4)` guarantees each chunk is exactly 4 bytes.
            let word = u32::from_le_bytes(chunk.try_into().unwrap());
            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
                .set_data(word)
                .write(bar, &Fsp::ID);
        }

...but actually, I think your way is better, because you don't have
just justify an .unwrap().

What do you think?

I figured you'd enjoy this, coming as it does just one email after I
wrote "never .unwrap()". haha :)

thanks,
-- 
John Hubbard

