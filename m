Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B365CBEA1B
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 16:27:16 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D177610E51E;
	Mon, 15 Dec 2025 15:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="C+r1ntFg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8DB7D45520;
	Mon, 15 Dec 2025 15:19:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765811990;
 b=SpSbgPguiYzJkO92672je/PZKEohBtczfv2n99c6eChcG6e0ZvSfdGkkM2CwkLiXfKYZC
 zLANXsFwxygTGFqPoFJKzXULnIvwDZvhAbz2EWD/Le/eua8KyahPd3kfX108C4gjJ7C9ym9
 WsbgUQioLDADMuAadL2Tz7gKxNPuHv4/LBNNfXoBdXEyQ7QbozpFCBTe1SLAddqlhftpQQc
 AKTSFnrYmZWyPacWXvpoW5zPLxEKtSn81Ao8psGBDB5FPn/vtbyaPzxCMuma8iNeUyArUX5
 lFHSXmH75o/Z38RNliL4Pxa+wIbAvkP6yCuhrrAfSRVpiPkxpKqISWB+wc2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765811990; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tZmJOU9JTruHBXHhfT9y6jztjKw/NUF0wafzx5dil9k=;
 b=jTULpEUhR8o/qHh9hBIONfgEDhP0zQ/2sFVnLQTplMbb4UFV65yFlGeYP0+S4NW5D5uPK
 2NeI+l2iRSMDQhVt3rtsxsqYeozp0fUDBPh1z0mCweEsdG0kSlvBWJBVGkxV5sJj9UIjqBj
 Ru2UL+vyBswFc9IqAljt2WO1Sg5llBxSmfLk4Hp/40bszbuwn9K+gDolEq+DWsq2o7+qjF5
 qWN7msdBsGWH1hleDwi3Bs91U419wB67YPfiadJCJqyNQB+fG+k5VVdA0a+higXrHk5LHQ4
 4fy67VWZxy00uatug0Ul2AO6kMTw6kJHz5Uz7rBm/pg/UMA3a3ULlwVaa5ng==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DFE10454CF
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 11:27:50 +0000 (UTC)
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021112.outbound.protection.outlook.com [52.101.100.112])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 662F110E439
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 11:35:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9jeA05Dr0KUEs4NdDOjAxUaz6KOLxsC7tx6A5Qq68asvAYkj7vlzl53+XZ2ZpxTlWPWSdPWpVmqisb+i3FIeUugf7sw1P1IpNFnQ44f5rtL6NaP1GDhK7Dw8mXT7yszRYVcazwJvQTdEi8wNRAQcDdx6Cbq8nCK9n7He3Jt7274WZfgns6iesztPsPNjJK/qYWiIVw7ouP46SfAIr93p7dpLl25gewu/2DGATdqLXq3pPFIMOGsyFopARWeG5mZDewhvpXQ0KXJizs8xFdZ2yedn3yGOYuCwtAQFfD5q8cdPz6qZm4zkPZq6V4+WLsDiVSd+Ys15v/zbpt23zUsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZmJOU9JTruHBXHhfT9y6jztjKw/NUF0wafzx5dil9k=;
 b=WaW4Pt5zvjFoFHa1gwyQFFmQGuAXI2po3grRRICdudOFOy80+BufJAPIgnKUHigRI2yC57HXtQQHfXUc2rAfg7e7nGa4Z0RbUMfYWZrH57er44MvePwBcxfzJuUdBJdM7Uj7+VYwdavlm63G5+JNQGK/H2/RNEht4u7wcI+v3VRGh4y2AQ3i4JlygSaSBtIJHPq5NlwdhtqT4XkJWydnWlm+o4c7UX9xCEgOhyYOurejegl3vQfG7zmmAOYfC/uTe7F1iHu6vFwI54ObQStZqHM2ptvZG8ZD7v647uRD+VOte/W9QA4TxB4rn8kh8DuyNmNWszm2WoILLq5U0IglTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZmJOU9JTruHBXHhfT9y6jztjKw/NUF0wafzx5dil9k=;
 b=C+r1ntFg1DiGUxSDLCe8/B0FXgKv5tOU5wE5IoUtcTDnF97HyBA7vEnzPyn/of9xmJVtQU3GzCGOKv+pW/4A3lsRIPRHANZceHA5vE06M105kO0ttbwIC5TuCioVsfCqNGXzGnlv8ilCNVY808DGHcygtLC/pCaIsMz/sUdep9s=
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB5163.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:15f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:35:10 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:35:10 +0000
Date: Mon, 15 Dec 2025 11:35:08 +0000
From: Gary Guo <gary@garyguo.net>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 1/7] rust: pci: add PCI device name method
Message-ID: <20251215113508.50362196.gary@garyguo.net>
In-Reply-To: <20251212204952.3690244-2-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	<20251212204952.3690244-2-ttabi@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0330.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::30) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 020e7d34-a7df-4441-3342-08de3bce014f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2cVLDPc0mU2BvXRW4ut3zK6ouwZOUD70LFaPiJXXSasS2dxkBDYjCRe6Y3bk?=
 =?us-ascii?Q?6nQ0SFO5F4BqEKqx9WjfByh2pkIFTWps5b5h6WcgiXt+mRA98EViUzV6Y+t9?=
 =?us-ascii?Q?JhZvEYoDOViugRbfHW5t2DendFf8pKisOTo6t1Lf4w8dt4EN0IcIkbcW89DH?=
 =?us-ascii?Q?0n9orcI56ifR700h/s/xQ5c/6H8MVYXDZHcQXODI+orMQn9PPeVUHBZ05lGd?=
 =?us-ascii?Q?dCz8SZEcQ8i/A3+4ZfHfhxKn6nLIra20GWiTkJ3kKqa+TVyxb2l60nfSlJJX?=
 =?us-ascii?Q?JCqie5DLxVQ/ikH6KyEFetzc/d7LXUPx418h43gzEVrHK2OiJRc+sB6/8OyF?=
 =?us-ascii?Q?zILg06nvpyVTRo+m8KwCJqh80aJRI/+O95YYTHQOojOSBzV7rkfIeqjGJdih?=
 =?us-ascii?Q?qjhO5rcTPekv1mi95Ec/J+yrMAiL0MLJanWzC2LE3oXG2aLgKMCd2nSZ9fth?=
 =?us-ascii?Q?7TBed/rlWB9ed1d/i/+GFKk5NWMELNmua9L9YJZrsGwLHmyF6LTi4kx5mWZL?=
 =?us-ascii?Q?YoqS+9lI0vPlO6kVQCaKexz74rmSrzCWnU1iEZ94x9OTnR9hbE6lrI/LKBwF?=
 =?us-ascii?Q?GYOdYCAW+fDWkwq1rALGtygJ9IdqDP30ok3ECOlXPvuzwowGCzIb5InI7nzz?=
 =?us-ascii?Q?4r/zOHDmkN7OrQyb24Q6E2/AK+IaH5HrTT5cr8fJeGPVG+8JW8Y7fU7nJXEo?=
 =?us-ascii?Q?Jv8/74MSBLzDwchoA2WpdtcXb8D0IuQ/abWgTnPBa1sPb6zg7O4mPGyzW/8Z?=
 =?us-ascii?Q?Guap0yhCZY/kFuL4CUgjKEo3ltap1SKjgVJNfzPKQzLA6tEGAi4UgQuWsWAT?=
 =?us-ascii?Q?uThWWYYX05/eDn4C9ihDV3RqlJz9BSkPjNqWLSdkCkIOFvfDMwWaUNxGIJXF?=
 =?us-ascii?Q?+XNStEmGIJhzDLhiG4E7QzqOvEuOs2MT8gGFlH5PDCliQ6pYnlglaE/tRKc+?=
 =?us-ascii?Q?ERgvW2/p625V3FQ5FJ117Lt5805oDaNC3oy/APUxZ/gdzA9hDr7BTRdvqVVG?=
 =?us-ascii?Q?ngESWbG586552VkY3Xfz22sk+0zkV5dTn+7/kaTiMZgzn8kvyaXWVyLlO4+a?=
 =?us-ascii?Q?sH1BsgZ+ZiplFwImoT0R96FLnaiqmqGn/aKA4lNr7gSnUxxDNgrbk51+uhLU?=
 =?us-ascii?Q?ZIrMnOh9T77O+WZtdHGmJxXDt34nxgpNbVw/zG8yOZLpZx6ke2w7IZ2GA70x?=
 =?us-ascii?Q?gIVQqhfFBrwqDJExCvf2MyWts8AksWlajg5a/B7ALpvXWFUtPJmXLrFP0+qh?=
 =?us-ascii?Q?uFYtY3N31ez6sS8uqCKbRVG9fpXdX3aA4xaVv2fhbZjDknkIbkB0MaEGIEq5?=
 =?us-ascii?Q?C1+oHakWzTsSHwEv/WHwI0LC/t73EHDW9rw8y6VeS/lYvnwFfgnkuPfKKrUj?=
 =?us-ascii?Q?QO41FcBzeKkzZQTrXctGbyqeNrTd/1gJKIcgHqgrFVWBuoT1KxzSUnXXHwpu?=
 =?us-ascii?Q?IwPG3KoX96Wt05PMu1wSTr4QQwH5Xa0K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KsS740SPexW2fjGrfdxxlKUNh17REQfhK1YP2NkPwdej74Hiq4UhES5P7xF0?=
 =?us-ascii?Q?q6J8bAfBsDE0pyMewnBVLhjlDTxVbX56S+ZQ+nBC8cU7eUIxWiloIud4F601?=
 =?us-ascii?Q?fj84MKiiFzqd9UXSpn6X07XRoEy99tVwSaESONi/cw8+tUo4HnMWYq/VIU+H?=
 =?us-ascii?Q?J+hETMpi9pZ9GcX4NZ7d3FjbMPfIvE9ToOHoJaf0oQAFrfyGR5TzffMSee+Y?=
 =?us-ascii?Q?RwMbafaLqhKMT8lpDAb+NBwAu8GaKPd2RrcjKLBcUNhcqKEuVQNwWjjArqgn?=
 =?us-ascii?Q?ufCo/RnOLxdtpRdbHOju183IpqnCVFfvtmIROaQ60AiACiUeuJ2qvnWfMxfD?=
 =?us-ascii?Q?VmAlhIc0KVqRvyE0oKJ5UFzO5uLfDgjALdxcC+ioXw6K0DciR05zqiQuH8vd?=
 =?us-ascii?Q?tNzRvvYz19TkGYYf2EAexBwrlgKCiSz+mRHdnQJH6UiL5Hw4zaC1XwXZBjJa?=
 =?us-ascii?Q?TvkrfKFEn9fRybPltiwzuEAropVdCqRMcRqHcIwuIzrjs0iZyW1yqo9KYrTF?=
 =?us-ascii?Q?3KDOlF0U6x8OyQM5L7qqhAzcRoUVHknaEao6V4zddZHpLBdmYn0ISHcFtEY7?=
 =?us-ascii?Q?lMgg52qhwkF893iCyEr/UqMKqjcjn0W1Tk3e0VmS5moHQJt8JnhMdfMJOxmz?=
 =?us-ascii?Q?kCP6X/DXba/9TfIpfTdse3f9tf/dWyKdXYp4jFfoIZ9L/yHll9TvlNKzUi9V?=
 =?us-ascii?Q?oWOomMa4MPgat1MLhGw71XIqShwybvRHfSKgftnEWiqdfQWMtd/xpGYHk8im?=
 =?us-ascii?Q?2FpW7GrI7x3uiQPw9B0bGavH4pWQoXIcLKm02krzdKML0qq+PWOBtEtGX0pV?=
 =?us-ascii?Q?Sqnsm6LdsjIiKPVJbba1BtJBoz1FAE4UQyeHQMBdRFWFCCN+uswNX1hFZYkL?=
 =?us-ascii?Q?TUno31TJcXhSRfIwFNHXFure98byZ5mv7hxTuo+y9YcciQtr0WM92w91m3sd?=
 =?us-ascii?Q?2ktjTwMFU2bsHqPqczugMTYAmMdNhN30uVHpq7Ucpz2fV8AOcsWyVoXxiv4n?=
 =?us-ascii?Q?W+nWw5tgvEQRoNDrkOMXIZnHuNZGkc4JKhjo565/my60tLXqn8UiCbmhDBwu?=
 =?us-ascii?Q?sAYzISgkqefCzs4I/ItT+LWujWaCDUydhNbypp9pT6O1fXvFKx5cqbG9b3gQ?=
 =?us-ascii?Q?v3abVkElYzNXrTBMZzY6m9PT0ogtQ6+DbX9TEf48EqeyFMmftESxte1RtZA9?=
 =?us-ascii?Q?pZaOmGzJJftt83bPnMxxpFN+XSrOnvBesGcBI7naeQ3BrFm3/h1xu1dzvF0P?=
 =?us-ascii?Q?Lesf5V85axpehXQ+5pNW3H34Pmmi+UZWkPg9vbahgC8MKZB8QPZaG/BLEj4C?=
 =?us-ascii?Q?G/aoCmPgY2cHUKXGeBzndm9rV78QAodYCURwCcrmZ915FvCuCMNNOoyEFqlN?=
 =?us-ascii?Q?74K/cRUBYi10lUZeAsCqv+YYP4+tdx7XV/PQN3ZLVMD4jDnSg6Y6dkyk19UV?=
 =?us-ascii?Q?KjhETqHBH473uXd5nDdZ2DIfxzGoREJqTdilTkCx4EenU38SqDDSN6Nr76iK?=
 =?us-ascii?Q?KzSCZpHZqS7zdGOgaygGl7HCLOqk1ObH39Z3IuR6fouz3WRHnd5kByyxIDJR?=
 =?us-ascii?Q?8xt6mFEBcbOvtxXHmHcVSktICQ/dCXiEmxiKSqZc1Rw1k7JaQVp6hrXcuGhc?=
 =?us-ascii?Q?Mg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 020e7d34-a7df-4441-3342-08de3bce014f
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:35:10.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8fgIM3jeL/2Lx5k+rGZdYGEwvosY3eggtx6UGOXkVK1Xn1gneJ8YRl7bWoka7qUbKUV3FvSn6xdSJ2erjdaqnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5163
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: VHXOEIX32L6DFAALUR6B36JZA3FNRKO5
X-Message-ID-Hash: VHXOEIX32L6DFAALUR6B36JZA3FNRKO5
X-Mailman-Approved-At: Mon, 15 Dec 2025 15:19:48 +0000
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, joelagnelf@nvidia.com,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VHXOEIX32L6DFAALUR6B36JZA3FNRKO5/>
Archived-At: 
 <https://lore.freedesktop.org/20251215113508.50362196.gary@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 12 Dec 2025 14:49:46 -0600
Timur Tabi <ttabi@nvidia.com> wrote:

> Add a name() method to the PCI `Device` type, which returns a CStr
> that contains the device name, typically the BDF address.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/helpers/pci.c |  5 +++++
>  rust/kernel/pci.rs | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
> index bf8173979c5e..411bc743fcc2 100644
> --- a/rust/helpers/pci.c
> +++ b/rust/helpers/pci.c
> @@ -2,6 +2,11 @@
>  
>  #include <linux/pci.h>
>  
> +const char *rust_helper_pci_name(const struct pci_dev *pdev)
> +{
> +	return pci_name(pdev);
> +}
> +

You're adding a helper function while having a Rust reimplementation of
the added function. Please pick one approach and stick with it.

Best,
Gary

>  u16 rust_helper_pci_dev_id(struct pci_dev *dev)
>  {
>  	return PCI_DEVID(dev->bus->number, dev->devfn);
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 82e128431f08..d0c0c2f6aa32 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -427,6 +427,43 @@ pub fn pci_class(&self) -> Class {
>          // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
>          Class::from_raw(unsafe { (*self.as_raw()).class })
>      }
> +
> +    /// Returns the PCI device name.
> +    ///
> +    /// This returns the device name in the format "DDDD:BB:DD.F" where:
> +    /// - DDDD is the PCI domain (4 hex digits)
> +    /// - BB is the bus number (2 hex digits)
> +    /// - DD is the device number (2 hex digits)
> +    /// - F is the function number (1 hex digit)
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{c_str, debugfs::Dir, device::Core, pci, prelude::*};
> +    /// fn create_debugfs(pdev: &pci::Device<Core>) -> Result {
> +    ///     let dir = Dir::new(pdev.name());
> +    ///     Ok(())
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn name(&self) -> &CStr {
> +        // SAFETY: By its type invariant `self.as_raw` is always a valid pointer to a
> +        // `struct pci_dev`, which contains a `struct device dev` member.
> +        unsafe {
> +            let pci_dev = self.as_raw();
> +            let dev = addr_of_mut!((*pci_dev).dev);
> +
> +            // If init_name is set, use it; otherwise use the kobject name
> +            let init_name = (*dev).init_name;
> +            let name_ptr = if !init_name.is_null() {
> +                init_name
> +            } else {
> +                (*dev).kobj.name
> +            };
> +
> +            CStr::from_char_ptr(name_ptr)
> +        }
> +    }
>  }
>  
>  impl Device<device::Core> {

