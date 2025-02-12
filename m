Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAB0A3302F
	for <lists+nouveau@lfdr.de>; Wed, 12 Feb 2025 20:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1876210E97C;
	Wed, 12 Feb 2025 19:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F66YoUBK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1818110E97C;
 Wed, 12 Feb 2025 19:57:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ht/rwM4DBGluRwiR0cX1fI+qQtEej46ymceYAIZR1fuBMrKNnlzVZH6a/LVXRnpn+NHo1+JU9FspJJiFxYBfmxjadRSy1qhjZQyPvAQUJcKYvotl1HUy7zEubLbIASmfJx6rpLiY9PHlOJPek5mf293eaagbVGeG9ZfLgXMP/yKqv1IQKA9Dz1Al3pgFtlUqseKVbuMVVelBAmyUb/Hi1AYnMwAeWLNfhWrzyaOtdjs87ODWr4ujgaa1fthDe5cm741jpLJTc88sAMcKnrONqD36dxm2qfD8r0fW9dDTCmylppM4axlWWASfJum/VbY4Xfy7Ur+gyF6Q9Y8cBhLABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3toa2qBiCnEmjFMa1DPUjZVtvgQfacb0iG60ehdxazg=;
 b=SSuo2SzYDogEucxRFQYeNfPl6TEgPtKaogwQJBW4DJr9wWjrpUNtqT489DYdBORALm45ZUwBesKL4V+UswebSd9ZIm9+jv0HsqP2xLQuhrStugek8XevQ8Y8cJBS1ZqdiG9G9t/Fd9oOG4UGYUniDxx8EMp9Ld0plSQQjq+B9D7DdHSj3opYAHjrMyO8KlUHAd1AWut89ilDD7mZt/S0FiV30neX1cnF03arfvPYI9Jv6cnMQ98fa4dtfgebXHs6XwF6VhP2YCGNv1BaeM3NbHlQlzvl3LoKKL/jymo4eo0EpNgUbFpLeLUuD2iH1441tn1IsjRs5na+TTk/MnidkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3toa2qBiCnEmjFMa1DPUjZVtvgQfacb0iG60ehdxazg=;
 b=F66YoUBKuOabKOSWLYC7D88v/85aOGnFLcjg4I7JYcO7WEcCmA0cLu7RElaLS3axqnf3s5dwiBy4mUpvJcppREw7E0dCA2pDz2NsJN4q94NBPwTLmcAdHyxTKPXKwo41u5ATYuC1ySBFfCmJLBBxezfgqLRDHR0WE2zDCrT3gnHJIjyPFInyBU5tOyfXmRf+DjilbJmqcIudBplIcSHr08VHhepJD7y1JvsiDbjyT2j6qLm+THy9S7z9sv0XTV9Uy+ljwQ1HmqP/9EyOKnbsq+/DZP7D2Ug0A10+OrYzHRjxl3OO2BUrZ5gRdYT+962I9B9xg41qloP1wN/g83PbYQ==
Received: from BN9PR03CA0371.namprd03.prod.outlook.com (2603:10b6:408:f7::16)
 by SN7PR12MB7021.namprd12.prod.outlook.com (2603:10b6:806:262::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 19:57:05 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::69) by BN9PR03CA0371.outlook.office365.com
 (2603:10b6:408:f7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.12 via Frontend Transport; Wed,
 12 Feb 2025 19:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Wed, 12 Feb 2025 19:57:04 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 12 Feb
 2025 11:56:42 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 12 Feb
 2025 11:56:41 -0800
Received: from localhost (10.127.8.11) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Wed, 12 Feb
 2025 11:56:38 -0800
Date: Wed, 12 Feb 2025 21:56:34 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dakr@kernel.org>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiwang@kernel.org>, Nouveau <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/nouveau/nvkm: factor out the current RPC
 command reply policies
Message-ID: <20250212215634.00006430@nvidia.com>
In-Reply-To: <D7Q9QSYHW7D7.2GCEXYDRVSMUR@nvidia.com>
References: <20250207175806.78051-1-zhiw@nvidia.com>
 <20250207175806.78051-3-zhiw@nvidia.com>
 <D7Q9QSYHW7D7.2GCEXYDRVSMUR@nvidia.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|SN7PR12MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9b9586-4af1-4369-609d-08dd4b9f6c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IcM+CK3C36w6OjjyueDixskH4hrHACFM6zuxPeRY0DY1HHp9dHrOQA0uxPZQ?=
 =?us-ascii?Q?U6dTpExrphv3ccydsiGcIS7ZhWOyLj7x6I+ndjiKWgrDYDkRZ1bOq7zExyqf?=
 =?us-ascii?Q?koaBGEZqCK68K1Oy69sAd5iVj5R1wqdecnTC9ycyqH2KX2RfHIY2AyJVCf/n?=
 =?us-ascii?Q?jO/botYdY+LvMWdBMXvWcnpvlhsLj2Gmcxl8tjg5z+U9jaaG+X6LlB5gI3NK?=
 =?us-ascii?Q?Iantr5m+bGOsXANPf47Ft6BWccbjUJJFdl85R22er/6r75yoiW3yAT3FdjG+?=
 =?us-ascii?Q?4zWbJY9yYl3BjtEy9hluEV8jPoTBZS6BaEAWggz2JJIGgRhhg0F+JxKN8PTQ?=
 =?us-ascii?Q?JKtaaiHme3buxVwCsqOtyWBDv4tXmW+spf3vZEc3TXaR9JZxiVr72msB6Zy2?=
 =?us-ascii?Q?JVmt58gCU48HrIkxWbGtKICljk1IqzgsTCe/Ge+rrifEk9yxQsbpc6gBNkxK?=
 =?us-ascii?Q?/LhCQs7+OnRf6AznJQnBQL2pwcVmMbuRYF9r4XfLwLPNWX1xwUnGPgDsrOek?=
 =?us-ascii?Q?0oNvSTrjcP910bi0TgYKwNXqgD7RXGRdaZVC8H66hsynQ//AQ1rcHeZhIrC1?=
 =?us-ascii?Q?on84LQoESd32QwtNqXI/eefvVDu+hN46NQZBxvHAG+XTZsbxCWXW/1dXZo45?=
 =?us-ascii?Q?RHtRkJLNwmDogu+6A8tS2iNaAYdpnKbwPlYD+iSlvbDevFz6mIs6T57kHRW6?=
 =?us-ascii?Q?CqbjHOBu1Y5ZkZL9VgZSIhI8IDbrlyPsYhRKqGys9lW7c8b8fweXwlhWtkZ1?=
 =?us-ascii?Q?s+zZFktgcMtIxFhaXjqUcuy9nfkoAB6qMR7Efc4adB/GxpfZQRv5OqXE4Hp6?=
 =?us-ascii?Q?o3QktKVDLgr9G9OqItcSa1NMFienLssh+4WqjNyd0Dl+WdJUMonmeXIOJV0A?=
 =?us-ascii?Q?55VAGcguWGNbgimYxOpTXuABGGiu+RzEPs1JGHF2uhOMwrNjNqsgqBKXrEyE?=
 =?us-ascii?Q?1DZ/nzoTdM6aNHDr73uoECE7D9hNMET+gkJo5dYbXg4sdUZug40i7PBOLcLO?=
 =?us-ascii?Q?AF1GAG/2xVsUSDL7p7e0jFvH+pEVY+R1b+kbRU8Jd1qxWuIemQGY8zNYpnnk?=
 =?us-ascii?Q?0Ml1JR18+Yoc3xlkCW0KcgzzYjdTNxyT53vIANc74EHgsonXFZ+83kEkkRC6?=
 =?us-ascii?Q?hy5Brn1fpCJPHD4HjDKOOYjwCXd02s3X/3s7Qc49TooKAw+ZlCwMOG53A+54?=
 =?us-ascii?Q?BUBQiLGHBfhqxJXvTNwVTDodje6Ii+XE+nOB1pz+YmQT+V8XXHCJQogduEuK?=
 =?us-ascii?Q?izuH+nJ3boRn+pnG5QISPqL9RAmV/0qbYm3XubULmjswA0eRBS1ezFblLflj?=
 =?us-ascii?Q?GCnrmK6uXV9W9Xx8TXqOteckKlNYF7y5C5g0UwgCr81R4erPF+JCFH0UgNkR?=
 =?us-ascii?Q?Jg6CjGuEBqABrTPo1K5Ze777B8OGtC/W9wNUtOMNdLGL1DluIDKNLXFLqtlr?=
 =?us-ascii?Q?WFWu1qfLEB8Jq37txixprzGWE9v5c1OZQOYdD+n+Dv8Ltj+5w8gWpEj8i70x?=
 =?us-ascii?Q?j1ahxWUVuU0vBc8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 19:57:04.5110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9b9586-4af1-4369-609d-08dd4b9f6c68
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7021
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

On Wed, 12 Feb 2025 15:55:08 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Sat Feb 8, 2025 at 2:58 AM JST, Zhi Wang wrote:
> > There can be multiple cases of handling the GSP RPC messages, which are
> > the reply of GSP RPC commands according to the requirement of the callers
> > and the nature of the GSP RPC commands.
> >
> > The current supported reply policies are "callers don't care" or "receive
> > the entire message" according to the requirement of the caller. For
> > introducing a new policy, factor out the current RPC command reply
> > polices.
> >
> > Factor out NVKM_GSP_RPC_REPLY_RECV as "receive the entire message". If
> > none is specified, the default is "callers don't care".
> >
> > No functional change is intended.
> >
> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> > ---
> >  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 16 +++++---
> >  .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 41 +++++++++++--------
> >  .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
> >  4 files changed, 36 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > index 746e126c3ecf..c467e44cab47 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> > @@ -31,6 +31,10 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 fn, void *repv, u32 repc);
> >  struct nvkm_gsp_event;
> >  typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 repc);
> >  
> > +enum {
> > +	NVKM_GSP_RPC_REPLY_RECV = 1,
> > +};  
> 
> Let's turn this into a named type and add a variant for the 0 value, e.g.
> 
> enum nvkm_gsp_rpc_reply_type {
>   NVKM_GSP_RPC_DONT_CARE = 0,
>   NVKM_GSP_RPC_REPLY_RECV = 1,
> }
> 
> and use this type instead of an integer in the client code. This will
> make the compiler warn us if we try to pass an unexpected value.
> 
> (DONT_CARE needs to be defined to something less ambiguous, I left it
> as-is because I don't really understand the intent behind this name :))
> 

Thanks for the idea.

I was struggling to come up with a perfect name as well. DONT_CARE was on
the list, but it seems so heavy when considering that DONT_CARE is the
most common case and not looking ideal when it spreads to the call sites. :)

Probably I will go with NOWAIT.

> > +
> >  struct nvkm_gsp {
> >  	const struct nvkm_gsp_func *func;
> >  	struct nvkm_subdev subdev;
> > @@ -188,7 +192,7 @@ struct nvkm_gsp {
> >  
> >  	const struct nvkm_gsp_rm {
> >  		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
> > -		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
> > +		void *(*rpc_push)(struct nvkm_gsp *gsp, void *argv, int reply, u32 repc);
> >  		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
> >  
> >  		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
> > @@ -255,9 +259,9 @@ nvkm_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
> >  }
> >  
> >  static inline void *
> > -nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> > +nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, int reply, u32 repc)
> >  {
> > -	return gsp->rm->rpc_push(gsp, argv, wait, repc);
> > +	return gsp->rm->rpc_push(gsp, argv, reply, repc);
> >  }
> >  
> >  static inline void *
> > @@ -268,13 +272,13 @@ nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 argc)
> >  	if (IS_ERR_OR_NULL(argv))
> >  		return argv;
> >  
> > -	return nvkm_gsp_rpc_push(gsp, argv, true, argc);
> > +	return nvkm_gsp_rpc_push(gsp, argv, NVKM_GSP_RPC_REPLY_RECV, argc);
> >  }
> >  
> >  static inline int
> > -nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, bool wait)
> > +nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, int reply)
> >  {
> > -	void *repv = nvkm_gsp_rpc_push(gsp, argv, wait, 0);
> > +	void *repv = nvkm_gsp_rpc_push(gsp, argv, reply, 0);
> >  
> >  	if (IS_ERR(repv))
> >  		return PTR_ERR(repv);
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> > index 3a30bea30e36..90186f98065c 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> > @@ -56,7 +56,7 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr)
> >  	rpc->info.entryValue = addr ? ((addr >> 4) | 2) : 0; /* PD3 entry format! */
> >  	rpc->info.entryLevelShift = 47; //XXX: probably fetch this from mmu!
> >  
> > -	return nvkm_gsp_rpc_wr(gsp, rpc, true);
> > +	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
> >  }
> >  
> >  static void
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > index 1ed7d5624a56..bc8eb9a3cb28 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> > @@ -584,25 +584,32 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
> >  }
> >  
> >  static void *
> > -r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, bool wait,
> > +r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, int reply,
> >  			  u32 gsp_rpc_len)  
> 
> So here 'int reply' would become 'enum nvkm_gsp_rpc_reply_type reply'
> (and propagate to other callers).
> 
> >  {
> >  	struct nvfw_gsp_rpc *msg;
> >  	void *repv = NULL;
> >  
> > -	if (wait) {
> > +	if (!reply)
> > +		return NULL;
> > +
> > +	switch (reply) {
> > +	case NVKM_GSP_RPC_REPLY_RECV:
> >  		msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
> >  		if (!IS_ERR_OR_NULL(msg))
> >  			repv = msg->data;
> >  		else
> >  			repv = msg;
> > +		break;
> > +	default:
> > +		repv = ERR_PTR(-EINVAL);
> > +		break;
> >  	}  
> 
> With the introduced type, this would become:
> 
> switch (reply) {
>   case NVKM_GSP_RPC_DONT_CARE:
>     /* Works as repv is NULL already */
>     break;
>   case NVKM_GSP_RPC_REPLY_RECV:
>     msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
>     if (!IS_ERR_OR_NULL(msg))
>       repv = msg->data;
>     else
>       repv = msg;
>     break;
> }
> 
> I'm not sure whether you still need a 'default' arm? The compiler is
> happy without it, and since you control all the call sites nothing funny
> can happen without a dirty cast.
> 
> > -  
> 
> No need to remove this separator line IMHO.
> 

