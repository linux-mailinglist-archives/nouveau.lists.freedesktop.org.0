Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46827CBEA24
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 16:27:18 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D74310E5DA;
	Mon, 15 Dec 2025 15:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Rg/xhJft";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 34E8A4551C;
	Mon, 15 Dec 2025 15:19:52 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765811992;
 b=SX12QR3fGuW/dGSNs8ANmGlIbbmBdm5Qmp3HXaHN2UvYNUgcc1K2bF3LrfNwbXqJWAojW
 wRcbkcR0nX41DYFiAXdItaVvIEqD/mOTkJFEVRH6MUTMWLUiuwPIprGiZnBlvWVUt1eMfxk
 tZuXCt/mdBr4UbMxuzpXRJ/eMI6CwQOLH8gCLkjbGlJsm5l9IKLiR9KbMj9VuuFLdCvvSeV
 JiYg2MRP+r/Nj+iH6LJiMKMsESnSzE/CodG/gNKCCoTYGoZF2vGx4g+BGU/NKBE4WrDYuFv
 7xhXLUIXgLN+3GjCxs0zMx99L1B3Z5WMKlxy3SZHhaujtvRQJqa8pMHDqT6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765811992; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TKg3diLlurzzTRZDeeMhMqzLdob/4O4p8rTYuAeARIY=;
 b=FI8Hda9jOG720wo4vB5C2WWMzCFfMxEVTdXKUY16v55Yk9fATQAvn7PR4gpfhzcAFat+j
 FRq76paI1jfUZqAlCFS6ry6EhvK+Mbq2wc6E0877X9BrZVS+3dhcie2XvxQUVdf71pSuBaS
 o+rZD5y1yI/CVYncgx+9O7lcFHv4HeEgrSa2mVNEC7mLUBGwPDLfqK5hyVi04xrItjeFkrx
 UhqX1/ptc1hmHejtUMoc7xCjxFwlVxkmmXmTa1nW1DZne0BL5iMUFngbyv4h7hw0Uv2CF4+
 0INteg6QDH2gLUIbRUTTvqJeXT5Dw0FqB8K16txxg0ir592Yb1GXda16WWaQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9405F4550B
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 11:33:17 +0000 (UTC)
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020073.outbound.protection.outlook.com [52.101.196.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1E10E43C
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 11:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+rF4bb85HujUCu+qO4ag1m2ZcU9kbqtt8VpZEVQz8SyMm5upoDmSTzFaMYKzyc3bOr+ONVB8/xVqX1lSEGaclPDtP9CDMjj9Dlut7TGg9rHP1pVG/+PNzk7qzUhK7wIIXu/dIah/nVaIprhBIS52naCy5vvnW26r9Y3Hyh6ro14JsT9l8V98TgOWeJHe01PH+vfZAz8fv3kvNJGubGcYkzzZrvWqtADS8gUbDDyJt2V0dVdT7qbsOk6O0Ct6XI0k1zpMMF4XEflgG9s0JjHFNYDY0O8Ezq7lF1Iw2wFqun0Du6Jq+rA0Ro8vNyC6PR8mOCSzlDvx2uxR6ULxq88Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKg3diLlurzzTRZDeeMhMqzLdob/4O4p8rTYuAeARIY=;
 b=HtEJu695+5wRY7xGN0VHjIM0tyhyHtflxoxlnhwPW8q46t9o4c0OimJaMEUkx/Gv8j/vBqwBdeIRwG12Qz5wONepPxQGKBdnrQognTKrKMqLYsE0UsGDyqADX6lQC6bQXKLH7xHKPEqSBu01IvkOnAMDAoxZchaJxnpUr077tsnhBn2paydaOvRXBLOQ18ePn2Y/MzT3UzCpYJ5RuKfS0XuIGawjTrD7C4gR30004ZCr0Qm07OzrGYNiAOAmkotLk3XTVl0s/LwNnJIZ4aGVmAAdr7/9nqooHGH8l7iSzcceqZsl5E1sbCoJsNatKg0zD0V0hzHzBfoNUo4gQGQGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKg3diLlurzzTRZDeeMhMqzLdob/4O4p8rTYuAeARIY=;
 b=Rg/xhJftAbqmcRz/VykH3QfhEjglI5EVbxDIar6veeH9+H69M/IOAxiBQ6EAxgW4aiKc5nnsiYjpN0E25liqrzWdlRV4MuIUGGrk/Vjk8DC+Mgr6vQg9QpSGiVtd4ED01qLh3OXfhGpGeOc+qrZGFPCcDnvnf+56sKEg8UGBKw4=
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO4P265MB6445.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:40:38 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:40:38 +0000
Date: Mon, 15 Dec 2025 11:40:36 +0000
From: Gary Guo <gary@garyguo.net>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Message-ID: <20251215114036.302303e0.gary@garyguo.net>
In-Reply-To: <20251212204952.3690244-4-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	<20251212204952.3690244-4-ttabi@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::20) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO4P265MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f75175e-881d-444b-76f3-08de3bcec49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xwI4zJnB2iBDk/AXyEDoN1OE3Zz0UBsbnw5yGJ7TvYSYQx5/1MeIeFx3sHLK?=
 =?us-ascii?Q?7vcLWHITRv0Ak4ovn/+CrU6tgbrUyJX2PHAdNcNsCGNvt1CZO1N57N/MC+p4?=
 =?us-ascii?Q?DCmqb+/Wbqn0u2ibo0X0yD+SDph6Co9YVqoaVi/CTePPXRa6Itqws1ui78+A?=
 =?us-ascii?Q?VkSXJUPsDjsUAUrq5fML/dfVCXU/9BDJe7m3b6RMX9o8GNBYI1+4tuiR4pr5?=
 =?us-ascii?Q?SLB2Z92BVY+KnxM7wpifm8Hlgdw4LVkNSIwssTCIB/45bkDs5JG8gd/KZQ8l?=
 =?us-ascii?Q?1vyob6DqWED+WZXvDpup70f/IgYBxHTXfUiScmeruCEblFVJ1L0t7hWnpjzy?=
 =?us-ascii?Q?g7dsZgh1DRj1njelJxp93YUxf77C2J8dh6/ky1l40DP5XmbAZNSLj30pg9O7?=
 =?us-ascii?Q?R2GGtJYtjcwo4eAzLjS7w3f6IPLuBJciUqMmCLB+u4b1x8Xk7M6fuTM8cucm?=
 =?us-ascii?Q?aZTnRN6MTVo7ynwf/bBbEG0RlUHxTMmABWIy3gHPaIxTNUmCVP+Jvq/8Vc8c?=
 =?us-ascii?Q?R3edO2Nh/oI3dIag+2iTRkmfKEAggMmgoZWgM1GU3wMzOuRa+MOYgL4D02jE?=
 =?us-ascii?Q?eLTNuF+o6J2qofwS3sqkNcMCs9bhLhQHjnWVm5LFlndxM5XvSOmrfmWuTE+9?=
 =?us-ascii?Q?AK/1HbbesaGDNudx8eIYMsn6W6M3x4jSa5uO9mlQdQLrWT/L5OmDoHmSLy6t?=
 =?us-ascii?Q?mDtqJSiL/puyuYo4DfS1GbOFdPBXgMEKdaWNlIuvjohF0AMtZA+rkZhiUU3x?=
 =?us-ascii?Q?HCcw6U21zMcv7d/GWzWCldeeLBjmupKQAca/dffqzvVIADSqxJXmMH8AtvoV?=
 =?us-ascii?Q?4DJamYzNPqi5scw0lWxzD2H3OP68Gsvj1uc2DKO4p1WKin9AfQIQvJ9o+h21?=
 =?us-ascii?Q?VeMFVpIkCETDV72JcubSOEGBDeXzWhtBIu2BzBShVLcujwxMaNjdEv1dtCbk?=
 =?us-ascii?Q?BXj99YfaPdguD1tM/0Rjg/8X9HE/YODMSjWmMKYCzUNBcYWrp5HI8+JJJ7Yj?=
 =?us-ascii?Q?ijzgofpeXW/vRMo321BJlm/LHOyJY9g4onkf95n6OU8dLPXeg7WstKh7MnOO?=
 =?us-ascii?Q?Ecn72cYf6GOmN338SgO11k463q2b+IjgoNsIzkpHG2X3no1hqRKkWKUh5/oF?=
 =?us-ascii?Q?LVwcnJUbewN/Jm3jbenQxwt4k6cGvAp/8dRvwWvepxXNdWnkCf0i2qug2NoU?=
 =?us-ascii?Q?8zg3wsB7qziA52Rqbve3A2OJCzavnsN23rPQgyw43ixft2zq/IrcbAUmCCv8?=
 =?us-ascii?Q?2y8akCwsQrVuF6/fstvHA1p4jyrh/PdWpZ7/SwNjlKF6y4Dw6xuCTYBgty9L?=
 =?us-ascii?Q?K72Sm/FJP/bOWggf2wFIgB10GxMBljhSP+JqJnz2CX7w+TdvtUV9fneQMetK?=
 =?us-ascii?Q?m3DIhd/VL90OfihDf4A0kSwg4OSMytMPelaWUA/c4fNsqtuW4BlZP8D5WSyV?=
 =?us-ascii?Q?ZzcPBDtSwRZGCQ/dt1xPF1gr4CL4umRP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jYg564LnyI49tOaYt8NDD+RMkW8NBt6qQLU+4ya6NotLWWCizNrHxouqBuSV?=
 =?us-ascii?Q?Cu/MZQeX8vD8orAhmXQykKbmcl/H7sIaN/htfxG1Cr+0Z1VlSzgybHJoOnNb?=
 =?us-ascii?Q?D/nt2sHYszQXAvtcaOGqgzTmsBLqbeeLatpntqq1CrWoMuwlJj+U7cv+wvtS?=
 =?us-ascii?Q?izUlysdTw5mW7onrr3jP7n8CXASlxeSDXJ6nQL/81qm1fT9f2qe6WvgdleTz?=
 =?us-ascii?Q?tVft28Pg+m5Eb0p7VxDSCK+drvhQ/bZRhVCKXUG5O2fOXLVK5XdJXujh7LEy?=
 =?us-ascii?Q?ca4dGROmH++uOv5pH4jmg7tmjDXlstyKJ7F3TDAirFAZQSxcbmoJzWjlRmOx?=
 =?us-ascii?Q?SUHvYHjWbOYtv0t+fb9c9+bCnEEE0SLy0ZO5E8PDyepUo9dVDlq5nmQd+e1b?=
 =?us-ascii?Q?2Djk4LW0NGUcJSk6ZYEFKPtSqHN51EkHAR7UEhSNPTpB1dk3diuq6tnaFVqh?=
 =?us-ascii?Q?bR7AYIwk/QdVgtJqWo6KgP99RVwo/gvoOFXCNZVLO1cH9mlRLTnhQhcek/cd?=
 =?us-ascii?Q?mHF7xlaTHPbQapaoFfy2bNJ4MWpmNhhQa9rICbuSAsldMu4KEzeLeVK6t4DN?=
 =?us-ascii?Q?t5cUAVExbsKis9UxexMmDu5U2WA4yg0E0dUbGbpoJOWgc9eP3Ldcz0gHs5wg?=
 =?us-ascii?Q?M5yXnqymYCV7GokX6z/B0hkjCWdMjVC9Zsoz2EBisU7L0UerrOL7eCaMYF1V?=
 =?us-ascii?Q?d3dBDNgUdDiLB08pRPROHYuHndIhK/YdcdtIU4SLvC4e1ZIm4jSnQrtKzw+5?=
 =?us-ascii?Q?ntRCOsUZJ/UCzYsZJDGcHMVVDucvPlKawhAggYJFfZNIbO4Fk7DbTi67n562?=
 =?us-ascii?Q?DLVP0CtxGNViZttr4PuiYvdKQDgCVimK3xSI6YgGzSBSfPaLlJuA8P+3/pV3?=
 =?us-ascii?Q?lr4mFZEJIeOVQ7wYzjcT36erXp5TWJJdgc95PnxsVMOQ8UuiXyGDu6WwIoJ6?=
 =?us-ascii?Q?8I8r3j9hP1a+Z3XR4xTbDnQD9ZDfKmxAqPyU87CVcD6eLs5bPzrb/LPuLANO?=
 =?us-ascii?Q?LHjg3Is5iBlU7BftRwbJPDC2LLaJ8hR5zVEaSHx+WQlSjt+1JYjCVAltKWZ4?=
 =?us-ascii?Q?oOIdTudQB05Gp1gSq2IEqxssUxEo77sigUer4v1KOUsjOczBqiNr1Tc5OZ3I?=
 =?us-ascii?Q?gFsPYWu+0xZrp7q0DuyVKE/JjbnKm7avY6NgeQqiE6aofk+Ecrzw/emt1bj6?=
 =?us-ascii?Q?uvfsPAPLiY+1knNwXvdx06dHaCie1FIKCX6voWaepimnViW3lIBqlBnJAgoy?=
 =?us-ascii?Q?uNS3S2hwU2LtG3Oaif3/y+vKndVqoJPKsscT2zhmo/BQ92brO23BmtDs6bwm?=
 =?us-ascii?Q?j0chxn2kVLihx+imCh3Mx5QbG4dVWQM1nT6KPel3NhT4JSswJo43s3qSPpSH?=
 =?us-ascii?Q?yz32lfFw1ymmp34imfe+mccsPitVS9o7jzvZ6I2avb5VklKRFiTsjp6dFgxJ?=
 =?us-ascii?Q?IJcz4t/XS9qLIImLYE5UznW8Y3mx0KgJf6grtWwPnntxeRVMYqyx1h9UMR3d?=
 =?us-ascii?Q?VRYUWQDy8q0j0uYDHT5jrQtR21jzTYqs6SwFGrLUbUxowf5JsZ9fFQchZRuL?=
 =?us-ascii?Q?mJ/72N+Us+1mnkTQastYO96aUi9LE1kXQ3VcdTAGI1g+9CNVYL/TaIPYjI6t?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f75175e-881d-444b-76f3-08de3bcec49b
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:40:38.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V2j4nIahfdBnf45Gm5krADyCrhQP0g+FRP5X2JVUYWlnnSQbQr1Jfcps8X6UVVe1ZgBD5lBMhaG5PQJrF/9wNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6445
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: APLMW4RQM56STKOPSUEZKXNHOODG4ZNR
X-Message-ID-Hash: APLMW4RQM56STKOPSUEZKXNHOODG4ZNR
X-Mailman-Approved-At: Mon, 15 Dec 2025 15:19:48 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, joelagnelf@nvidia.com,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/APLMW4RQM56STKOPSUEZKXNHOODG4ZNR/>
Archived-At: 
 <https://lore.freedesktop.org/20251215114036.302303e0.gary@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 12 Dec 2025 14:49:48 -0600
Timur Tabi <ttabi@nvidia.com> wrote:

> Create the 'nova_core' root debugfs entry when the driver loads.
> 
> Normally, non-const global variables need to be protected by a
> mutex.  Instead, we use unsafe code, as we know the entry is never
> modified after the driver is loaded.  This solves the lifetime
> issue of the mutex guard, which would otherwise have required the
> use of `pin_init_scope`.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 7d7b75650b04..591edede4376 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,7 +2,7 @@
>  
>  //! Nova Core GPU Driver
>  
> -use kernel::{error::Error, pci, prelude::*, InPlaceModule};
> +use kernel::{error::Error, pci, prelude::*, InPlaceModule, debugfs::Dir};
>  use pin_init::{PinInit, pinned_drop};
>  
>  #[macro_use]
> @@ -24,6 +24,8 @@
>  
>  pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
>  
> +static mut DEBUGFS_ROOT: Option<Dir> = None;

Please don't use `static mut`. If you need anything associcated with the
lifetime of the driver, please just put it into the module.

> +
>  #[pin_data(PinnedDrop)]
>  struct NovaCoreModule {
>      #[pin]
> @@ -33,6 +35,13 @@ struct NovaCoreModule {
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
>          pr_info!("NovaCore GPU driver loaded\n");
> +
> +        let dir = Dir::new(kernel::c_str!("nova_core"));
> +
> +        // SAFETY: we are the only driver code running, so there cannot be any concurrent access to
> +        // `DEBUGFS_ROOT`.
> +        unsafe { DEBUGFS_ROOT = Some(dir) };
> +
>          try_pin_init!(Self {
>              _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
>          })
> @@ -42,6 +51,9 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
>  #[pinned_drop]
>  impl PinnedDrop for NovaCoreModule {
>      fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: we are the only driver code running, so there cannot be any concurrent access to
> +        // `DEBUGFS_ROOT`.
> +        unsafe { DEBUGFS_ROOT = None };

Sorry, I missed this from my previous email. But if you put this struct
inside module itself, the dtor will automatically be run on module unload.

Best,
Gary

>      }
>  }
>  

