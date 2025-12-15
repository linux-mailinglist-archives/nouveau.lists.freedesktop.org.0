Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11110CBEA1E
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 16:27:17 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B46810E5B4;
	Mon, 15 Dec 2025 15:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="frFGbU01";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D9EA14551C;
	Mon, 15 Dec 2025 15:19:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765811990;
 b=jRqW+YRsBG6XWyVF9+ea7zWS3O+nK5F0jZrTqPIxIsPHw9bw3j5C6yl0kzAI++zevel35
 /1eOm76z0hgAd++95/GsPcXJCYGxTQJn7XeoxQbrnvRyvGj+GRZxDRlEv0l+jsw8TC4ARjV
 Hc5tRz8sL85L9XEC7ZTIg5Ni3bJhpS2Suc7bbRez4lf1pCJJY3e8vqd3qdP9Lj2NyqkJUXJ
 f2BcHAHoV6z0qSJ4D7BxHh2/cLVP2KgH7jT6PIOiyIshJ+/XQD95rM4pfQCpRyhXpm+wPyh
 M8GkodvRYSrHG/VYBVoxCKpX8GKAzY6GvZksSZZ57I06nwsj1hLnECPPbg3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765811990; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8O6sFm1Il9uch8et1nXmAmA/H+rzSOFkcJSujG8A8bo=;
 b=cDjGM4vxeJA96v3Px2bz+s+Pifvb5la4zjbrDjyY7JtiaSLttT/T2R5EaNOxPOV858haL
 4la2FgBncugMndnpbCVE0zJEiz78ce0LR3xYI1fXi4gD1ArT2eNhwBfCu6LSq9scbTIZLIa
 vVC5oVJoZJW/TT6sGNUwrmrG5dmAY2ZiZgsTSe9Dv2+LyMYVTVlYr9nKEt4HkjZBnT0ja/R
 ZfYn8xllfDpQbi8pOopA+aJLymR+G1ZaIUlhyEgpURBe14tJ2PL7A6I5Y6EdhAhh9MVfNyN
 v+enNUgiq6V4iZFIG1yCZpje+epKdu+OXsjFOLsyCuIzssksA6cmYBIdg4fA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DDBB64550A
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 11:29:12 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021143.outbound.protection.outlook.com [52.101.100.143])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8602A10E439
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 11:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvFRrMG7oV9n1SwM3XKV3gJwGvgq3XiVZcpn9m+h+7qLTd9NzITyBCqLPeC1Dm2XEcirralaU/Yd0REEcs+ALpCjvLo9mIZx3JkDyvuBPlgm/MMzihmzyqu4oVDW7HlIlK2956HL5TFxhRlwmNPjwozBtWJ39jWUfIu9GkwQdtSKfjoMExei9tDQcSCFZityajxXRIWKpflOJVA6Xw+5Wy/bZ9bp03g+6fzUJBQW63lSrfDAedPzcBpWDCitbjbLJd2//F24gNBMyjA790AdtVb7kklrmzYkkLJG31T1gtK7eV/Gxm/SrN2wOqOCCC532RECL/1shgfa4PCT1p1khw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8O6sFm1Il9uch8et1nXmAmA/H+rzSOFkcJSujG8A8bo=;
 b=QPvMmPSP//lVOmVrZxpSLF2FN54NI5+97k3E8jxRhX5oK8VyF46QNHLpNTvsJK8mg/V0cOmc9kQC2GXV0MAmxH2wowcxJOJ2FZ/BL/8zcSTMGCw78ms74WKcFbx+H77jA7vGh/uGsgCJZXT551u8g//QIotKA+wSDy/prydQ2WgLncFDnSs32rXKTLSfw84EDioxSMOcMwgK6pCDMXw3mCD+G7IfVALuez/DPg1YAbK2II2vlEMpjvdK1yPkWszl+lnqOTWOU6aae4r3L36TooSjmm+NBgS5neaMkYFw7N2gMZF4qtWW5ApXOkoMReiy98Jn+3+L7G2nxeAuPeQAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8O6sFm1Il9uch8et1nXmAmA/H+rzSOFkcJSujG8A8bo=;
 b=frFGbU01yUQkzBQr7YKXQZyERQGUzBU4AJTfPz8J9GccjF8PW/t5MslnOe5tXDY1emsLvn2Cvn8JoFLWbnCgrzJBqrBM1cHkmozsOzrFzNaGrcpwpCcQFZAgWcKlSyCN8q4b1Q0bD4Y/0vPaYqOoWuf8yhXzaVOf17T0XDtdsRY=
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB5163.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:36:32 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:36:32 +0000
Date: Mon, 15 Dec 2025 11:36:30 +0000
From: Gary Guo <gary@garyguo.net>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 2/7] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Message-ID: <20251215113630.5223e246.gary@garyguo.net>
In-Reply-To: <20251212204952.3690244-3-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	<20251212204952.3690244-3-ttabi@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::15) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed32d3c-3167-4fcf-4d77-08de3bce322b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w0kLDCd0oFFzgRXwdn6OMPvgcyWP/4YpCz9NWbftfIWl3C/faiXiP8gY7LSk?=
 =?us-ascii?Q?QXUiF4Jrpia7bhrVFpaRXSPcJNGK5dGhw9pzsUqwAHXIPyJy9CtVMcF+pGPx?=
 =?us-ascii?Q?YvWiYpnkdTFcjVXCusLpLPOmXuhTjDQf8npjJLDAAlCAubs22hOEiweU5xEW?=
 =?us-ascii?Q?ykIcUw5o47kkKaoYbfK+gsr21hC/B6JI294oL3FlrJwNheJFAzpKIe/EfLr0?=
 =?us-ascii?Q?KKO881JKKyMS/ZPTzFTxyPpWgiQ3czMqYDWc16i3SuwX5LuvXEskec0J9Ewu?=
 =?us-ascii?Q?1F30O6ZbnpLhBgQ3sJv4byM6Jv/eQv8v5ASyUWlPrwFp2+xUgmgGNZIdy3hw?=
 =?us-ascii?Q?5i+s8nCpP0DdKlbxyIVDSrPv1VHCAGzRxA4DjCnoIkTjvWrtYHGDTHXiiYJw?=
 =?us-ascii?Q?YRFZZc8peDMP6CQHMjm4TawkxxTGZNwMzPYfmuweYhV9+SgT6YnRWPmP86qQ?=
 =?us-ascii?Q?pq7LghP216tSyq5GcmnSq63nJaRcuMh72hn6/PE+7C5B4zP+mp5d52e3yuh9?=
 =?us-ascii?Q?5gzpMOTszo4Uf6kfvYIe2hMave2mCfrfKUn1CDruT4S+btd3rlxl59JQifUo?=
 =?us-ascii?Q?g86N5breETtuOaW3FrBIFEu3k/+xlhslSN6C9q0YiKdMjtdCxLGSRy7lxTm9?=
 =?us-ascii?Q?YUeFPg1liBV5i2GseKhkMrvElE0EKGxpzjKu423HP16J3x1Q/TpL20aclol7?=
 =?us-ascii?Q?NpVsBJ+Brr97tTclf0Qp6znh8nhjgS3KyGgHdheKVJpOD8Xjwbb2Aave57fP?=
 =?us-ascii?Q?REoFOmzCR1kRH1oQe195J6D98i68IUQIomRV8ZGsCKpSwJ262JMft73nddvJ?=
 =?us-ascii?Q?iev7z3o91TrNDE8CUFRl85O8IJPcM+uSeHkkjEAVP8kwUc/DmCnwkT2b6UmR?=
 =?us-ascii?Q?pTa2Frevsq+vGSTX7/2WiqO0qLzVRS+x3w0dKGBXHPyoyjO7nRXSvkLsYung?=
 =?us-ascii?Q?+pSof77BXOCHdl3EndY1z7pOs5kF6XgpVSZbVPOlA8Nbn1rMRJHXoqyo8TWL?=
 =?us-ascii?Q?Og2JBfYcziwLVRXRSrnSrhIQu5vsvAD0fXz5pLM50lu2qacCXMZ9BuCWqdJq?=
 =?us-ascii?Q?RwFev+Jbo4nqTMf5VhXeXYYkjkg7+qvR/jl5OHMgI5Jwv5rZsDtcGSbxJcuI?=
 =?us-ascii?Q?CAyfTk8XxqW9mVxwn/1keIOum7pYZGECFqbfg8eoPLPGl7iCnSfGF3pc1TnX?=
 =?us-ascii?Q?yZQTE6diMeKfy04DlDaBHVMMsB2sDswlgmezP5Tafk1qGtuPnxqEU0aZVKCf?=
 =?us-ascii?Q?5zWyd2dIuzf8OBrT8IGj9Jefo6l2yOABLbsfypbW9/db2zsVpM7kRpU55UxF?=
 =?us-ascii?Q?Wa3h10CSxZEMaPf7dMmizDjjiKcSIIcffqAey06V6aFgcI3yurvkPS/o0HlF?=
 =?us-ascii?Q?kOH+uloJkxYidFl5Jtq606kgckljY+B3aXx5WlFBw2Cqi89XjUpqDB4ECAy3?=
 =?us-ascii?Q?qMnSLZEj26fC462YS9DIp0yRFSkXwAf8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J2D+FuGv2bob7m9WdkHAH2myfP+W3GJEFzqH3/KXNbnmEudKdYlK3/JX/mqu?=
 =?us-ascii?Q?AYjhfeb2q5RWl0ZxBOdfdWwFcIp2upTM3fdU65JArxOQJhji3cDH7Qkv8c3w?=
 =?us-ascii?Q?GEP4VFQeAH3Po2gytLyzmFKB0FxvE4mKKWODZJOAxc+KSgoRozB84Q0xqSdp?=
 =?us-ascii?Q?xmKpOL7Gji5Tj+M2bL6/X9NmsToMs2ErUu4S7UWdnE/3NvbcfP1t8NiBQKCQ?=
 =?us-ascii?Q?OTj2yXnQ9u6U4Kt7DFElf2u3vg3O/PiahCjSJNkF0s+tD7axsZG1sBGUs4e4?=
 =?us-ascii?Q?IPcjV5Z7w3M4M7UPWS9cdLPkJLP6XVpPpzTmukvXref8fcluMa1WkKCYw8zt?=
 =?us-ascii?Q?q3iSLoQ2qF2yc/0en5qSaRllAtGAOK830N4Ab2CJfwcX2mBZbG7XEEOo7/rL?=
 =?us-ascii?Q?bxbSKJQUDHiVqzTyXpzhngBa49AyYWi4/DtHqB7JnsKBO+i0qiWvFOPIdzsK?=
 =?us-ascii?Q?CD35Ysk6bIfLi1FlYM7ilSMQMDyl/v/37bU8VJ2fF9hGOwkSK18Ld/QXz+iB?=
 =?us-ascii?Q?LFTtZ8FDDlPrLdGxECimgIU/E6oUxI2eVsznsRd8Xy2wLmLqIp612mbxooaJ?=
 =?us-ascii?Q?qWW7n8h96f2WHE4NpjZtK3mNKRl3fsKtqLxQ4ZbPAPFjohn6pyjmQXDUgpC1?=
 =?us-ascii?Q?FYsahDNXJ8aSiZs3vj8dIVMVhAxR6AwxBsyuvbHd0zWjlskaqEVOKYPkdeDz?=
 =?us-ascii?Q?f4kVK0JYPCHuJIve2CTQ9urTnUMqzcqIlHybcek0rqavMGaYim947M1SP32e?=
 =?us-ascii?Q?0T+AGCegeKq5LTKrkfLKh+2EX2j5kZWqCklqJ4Ge3yJr+lzrku6BqHb74Q9y?=
 =?us-ascii?Q?IhdLYwjVsCBGCojhC5+EHlypaElOKAUcgvq6PIq+87v7IHvRmkeMFOyeBaLp?=
 =?us-ascii?Q?/IUCmWp/ifINSBTqABjvHFb8RMwMZvwcsZipWmSfEqsoqalCPLY1fwYjFQla?=
 =?us-ascii?Q?a0Ax9TrAgqg+5fbDoQVfhwldns4Tsk2OFraHgm0y+7Cv2Che8CRyHgJjjZYP?=
 =?us-ascii?Q?I5Q9YQEIktbIOB7UfVy56ME9apaXnRy9pp30nHAc23h74/s5FSVjYMIDgrRB?=
 =?us-ascii?Q?aQNUIYJHP0T7Oz/FqqPnSStxAFWs0RcPWC1+UcD+2FmFODIN69D91JWc1QcC?=
 =?us-ascii?Q?UrTAUPzUkZ3caun6OZYhVeQdSkoQB8qEhy+B/Ldus8peWae3mhw4zbxWoCdg?=
 =?us-ascii?Q?Xzvvc0C2HxgFiD0GsxeBELaB+Wpk3np8d+wZ5zic53b7BIldiIDA/me2YmqJ?=
 =?us-ascii?Q?8GtDHMPe++AnQT4MpYdfkfajDqUYMZjJik4UQ5DnEy0v4+NJZmGGt/oz7lHV?=
 =?us-ascii?Q?qsz4ygqrrXpJK/boSNbHUoW1MPZAKBgKhLSinccjgjrUXfBPLy3T5KfEnxkX?=
 =?us-ascii?Q?MeL3i3GHRMNtr93ChGDEUYWimXT31jEq7Ro22bovTMpilk83xBTIuTGyunMv?=
 =?us-ascii?Q?GYK2KxtX5hDVT7Cuo2gMXUnP6R/BzmzRLw77tpzkUHymtn3ah6LOOfJYb64n?=
 =?us-ascii?Q?KjFvAA28gKX5xVwv7vyHSMenhXD/HTd9Qmy2sVMUWVyAaXREvpsd7IBlToH4?=
 =?us-ascii?Q?qgx66lItDYnvts+nCeeQV8DWjp8zuXtrmK/o3w+WgwH2r3h+Of0NBmOBzRtm?=
 =?us-ascii?Q?mw=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1ed32d3c-3167-4fcf-4d77-08de3bce322b
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:36:32.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8dKHogZClzv8BuyTjPgN48J7y6rXQ1wUjxKJvky+1HvEU4pAKT63HVQbOloyOS/9s65DCAzAQYz4JeYRRgu4OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5163
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 75HIG4KSNZQ6LP5HBXMKWX4K5HXXNHL6
X-Message-ID-Hash: 75HIG4KSNZQ6LP5HBXMKWX4K5HXXNHL6
X-Mailman-Approved-At: Mon, 15 Dec 2025 15:19:48 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, joelagnelf@nvidia.com,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/75HIG4KSNZQ6LP5HBXMKWX4K5HXXNHL6/>
Archived-At: 
 <https://lore.freedesktop.org/20251215113630.5223e246.gary@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 12 Dec 2025 14:49:47 -0600
Timur Tabi <ttabi@nvidia.com> wrote:

> Replace the module_pci_driver! macro with an explicit module
> initialization using the standard module! macro and InPlaceModule
> trait implementation.  No functional change intended, with the
> exception that the driver now prints a message when loaded.
> 
> Also add a no-op module exit function as a template.
> 
> This change is necessary so that we can create a top-level "novacore"
> debugfs entry when the driver is loaded.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index b98a1c03f13d..7d7b75650b04 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,9 @@
>  
>  //! Nova Core GPU Driver
>  
> +use kernel::{error::Error, pci, prelude::*, InPlaceModule};
> +use pin_init::{PinInit, pinned_drop};
> +
>  #[macro_use]
>  mod bitfield;
>  
> @@ -21,13 +24,33 @@
>  
>  pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
>  
> -kernel::module_pci_driver! {
> -    type: driver::NovaCore,
> +#[pin_data(PinnedDrop)]
> +struct NovaCoreModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
> +}
> +
> +impl InPlaceModule for NovaCoreModule {
> +    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
> +        pr_info!("NovaCore GPU driver loaded\n");
> +        try_pin_init!(Self {
> +            _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
> +        })
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for NovaCoreModule {
> +    fn drop(self: Pin<&mut Self>) {
> +    }
> +}

I don't see any subsequent patch that makes use of this added drop impl.
Why is it needed?

Best,
Gary

> +
> +module! {
> +    type: NovaCoreModule,
>      name: "NovaCore",
>      authors: ["Danilo Krummrich"],
>      description: "Nova Core GPU driver",
>      license: "GPL v2",
> -    firmware: [],
>  }
>  
>  kernel::module_firmware!(firmware::ModInfoBuilder);

