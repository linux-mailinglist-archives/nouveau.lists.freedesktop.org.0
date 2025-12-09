Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB441CB013D
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 14:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DC510E004;
	Tue,  9 Dec 2025 13:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="krmwnd/u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013043.outbound.protection.outlook.com
 [40.93.196.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B11310E004
 for <nouveau@lists.freedesktop.org>; Tue,  9 Dec 2025 13:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ET7wqFL6UgjAcD26Cxl48sqA33hBJaVtByeJK8wOsK/2E0PmRjvsDX5MaBueGrp2u6mDHdVMsR2Kg6/cZG2bK0K1YbWwI9/97byb690qkGg8jYEMrAWb0SSP/VcmSSmVjnfzIUTic6VvvgjV2tJd7lXZ2gNOsLrTKS7FCt4QnQsT6WKevcu+wkyUH5YSNk4i7TB8YDVHoEUKdu3l29WOc5T0cwP6zwLhPv4mR+7mlQAzGqo5iyZyEmcEYEn4/FKxG9S8DtPczAOJk6YXhG5oBjSErt3W2pVKPL6Mn8rTmz3qyA3gGod1Dz8TGSvn9dv+tRUCLqT9tJBxy6lvQuDelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZBxBEViAN3fBQ8JGVIpZSYBJsOKL/5LvBt1KF7iV20=;
 b=uqywueA8AYM4WjiLNazXYis3TQwxYFo2qX8wNnvAFOSAM8Cp5FHdDg6lq1vclBBWxGoR4E927s9t1ernWPPjdLNqZkOw6ewswh7QxSJwu35lefkknSuSdKbkBVdlIC9NYY6YueXo5On+GzOxfYvlH+Fb2O13/s1Hh6u9A6LNUaEptUKPfndjCQNgkwPUhnwXUAK9dvRTYahEURWIz6GrurYp9JfxXfxEKcEe+OONsTBdszcvK22k9xtQiwWSmux4nrrEDr4BMoCpYAzD9CbyuFiSC5hnhCmPu4E0sh0bd83S/GtebWx5HWQ1ukJNzcUYm+NxRFnKGqjcVmp47uRsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=shazbot.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZBxBEViAN3fBQ8JGVIpZSYBJsOKL/5LvBt1KF7iV20=;
 b=krmwnd/u/n05AwJfI42lAFwEaUZybOqaYFv1ggb+861cSWDPLip+HZkuHWMfPdYyV5U25FM33Xj89XRnusaZ7U74cQTMmEFQixwkTv60pUXpw/xyTxjoe17cpHBbTKp6y+7SOnQ1DXL2ffjT++mZj3jhXcU24wEhFJmtXtFTpcY1y/32UDmBb86RmmWeWw27AUQbKIhju4ECOubMzI4Nn52mHGDPqDWjCVeZXgJf1ObHgaQdv3Kx6e1+mPdAUig2b7urF0E36OYDDx13OzUJJVNg3qPW2+ylrcIVclQpWNYSDAFVQB6JsdonKBWCiyFCpE0X6WK+f7xMHmGVG+KObg==
Received: from PH8P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 13:41:45 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::bc) by PH8P222CA0025.outlook.office365.com
 (2603:10b6:510:2d7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 13:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 13:41:44 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 05:41:22 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 05:41:21 -0800
Received: from inno-ThinkPad-X280 (10.127.8.12) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 05:41:17 -0800
Date: Tue, 9 Dec 2025 15:41:14 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <rust-for-linux@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <airlied@gmail.com>, <dakr@kernel.org>, <aliceryhl@google.com>,
 <bhelgaas@google.com>, <kwilczynski@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <markus.probst@posteo.de>, <helgaas@kernel.org>,
 <cjia@nvidia.com>, <alex@shazbot.org>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <acourbot@nvidia.com>, <jhubbard@nvidia.com>,
 <zhiwang@kernel.org>
Subject: Re: [RFC 4/7] gpu: nova-core: populate GSP_VF_INFO when vGPU is
 enabled
Message-ID: <20251209154114.09cf245b@inno-ThinkPad-X280>
In-Reply-To: <9cf6135e-43c4-4c31-acf5-03fbe32e2bae@nvidia.com>
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-5-zhiw@nvidia.com>
 <9cf6135e-43c4-4c31-acf5-03fbe32e2bae@nvidia.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: f59c2b4c-bd48-42e6-0e23-08de3728b162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tlFM9EhT70kSrY/nr1EgX6lMV1aJAFX59gECyYC8Go666gqOrqFANU8SqxFs?=
 =?us-ascii?Q?V2ZZ2m0/4+3M4dyUGzMVlt3QMDaTTvQgfor3IJ6fg5PVACQ+ys8+5RfidedF?=
 =?us-ascii?Q?LEMfe074MvmQn9JvfIpt9raE+F2E9z8HW+jVxU9VLbqaSwa1eY+9DNA8hCQq?=
 =?us-ascii?Q?O+TpQgag6rQ5RI0mHPlOnK8JJaZxv00XOkL9azXb0P21gAXjgYNOC9/KM/wF?=
 =?us-ascii?Q?PIOr5Icg7sj/jVTHffExrschGa9zGGPvbiKDrCWzcBGAwkNHWev4IYShabQc?=
 =?us-ascii?Q?8I+qW1P7mgIKpnAai9cR7ztYLm+tqDZqagz498Es7o+NIpVUVRoxrPU3f4fJ?=
 =?us-ascii?Q?9QNwSkPBKOUDbovC2BQ2TNkVd1UqW4PV5sbWEH7hpEKreAw6Zgu3oz3PCeRo?=
 =?us-ascii?Q?H6AbjTMNSkpwHriLSNcxHhLc9aL5Qk2qYuaA/vqJgnmBl+l0tnRgsiZJcAM+?=
 =?us-ascii?Q?QfXP4+IqlocZOPee71c2M2HF6OlW/zr0vA4yHKGyRi8a73Y/wdpiCTRd8giP?=
 =?us-ascii?Q?oRxIHqc1enOIb1mU6QjBDXL3Ntnr4Ms4ldVhg/FIjeG+m1RAxw2Sqfa4dHMC?=
 =?us-ascii?Q?UHkHTusPxVJEYNkUggujrIMdxALmKDnTppEBOJSjhdn/1KCXKxrhmijVsAwe?=
 =?us-ascii?Q?QNscS74zspNda0+DlnERAOi0WRo5OLfS3u7a5VThw5pi85K85t0VnRJkZ3Qv?=
 =?us-ascii?Q?2x0QlpLyB3wKDdeSiFm8bXeu0LdN99yzFjQmvkVVFi3H6CdyUxliXgdrSfua?=
 =?us-ascii?Q?1ps0ABYTKF3M1PnFROcCgd1OW82fa8qovcEVKwESdHtcz40J+NqW2ZQg5ywg?=
 =?us-ascii?Q?a+qdXkH/K1nDJ06WSOzG28UNkBmRCDNSYEAFf1J9xxxouv62PrfvBQcr40tJ?=
 =?us-ascii?Q?IagjfCrHrG6YtSpV6uVNghLv/zW75abdssrBORImhCUGXtP8iwE9PJAfKUvB?=
 =?us-ascii?Q?h2vEOqacHs0fVyI7MNLCN/Ctt6ks3aUb7yXXH9obpXhJT9Ik9+ep1fOuAxN3?=
 =?us-ascii?Q?D0YCPoIGb4u9lcggQQwqi67fUXedwRmf+xc+uMaQhjOOq5KejEqbnprUg4rQ?=
 =?us-ascii?Q?2n4awMES2S5za9NxsXbYNlqwTgUmGFnCEjwn2HpdTdlmKedHI5GMQEVJSKoP?=
 =?us-ascii?Q?GKXEJCEb/EjOzX7j5QYvQtPVH1UPp6cbeaZMn7CocM3yimDxG7+v2ztJWHmK?=
 =?us-ascii?Q?tGcuVtKK7X91gR5ctQTnM1Y8FOxzJtRn4JYQcXpu/21UqNv6iEeAC+SeOPBv?=
 =?us-ascii?Q?GqPX8qqgbwcfjH8ppHstBVNM7WI+ehQyOUJvz8OOLUMpC5VUV0QCcdXQmGaa?=
 =?us-ascii?Q?/SswhO+pN1RqXdvSoTpRNmVcg3Zj0L4+3AFWsNvQgWUDDFiy92x3SaeOsYL6?=
 =?us-ascii?Q?XanKlIfsP3gPnZCs1xg4wsFx2D1co/CaEQjLhFRfxjnmtVmy1sUQOgpVLEFf?=
 =?us-ascii?Q?37nBszyL3UcyUZNK0FpoU+ers36L2mBeMIDnUhCYpbDPKMsNVmmZ2d27mktb?=
 =?us-ascii?Q?U2X05ZPZ18yJYVdxReO6MfUC5ciwXHIw7bvrAER15zTnjVD0l/It9cVTmKvs?=
 =?us-ascii?Q?yeyn7aH5Hb3kn0M+Ho4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:41:44.6487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59c2b4c-bd48-42e6-0e23-08de3728b162
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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

On Sat, 6 Dec 2025 21:32:51 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Hi Zhi,
> 
> On 12/6/2025 7:42 AM, Zhi Wang wrote:

snip

 ==
> > 0x00000004); +
> > +            let val = bar.read32(0x88000 + 0xbfc);
> > +            info.b64bitBar2 = u8::from((val & 0x00000006) ==
> > 0x00000004);
> 
> Please no magic numbers, please use proper named constants with
> documentation comments explaining the values.
> 
> Also BAR reads here need proper register macro definitions/access.
> 

That is true. :) But this is because there is no register definition in
the OpenRM code/non OpenRM code as well. I have no idea about the name
and bit definitions of this register.

Suppose I will have to find some clues from some folks then document
them here when going to patches request for merged. :)

> Also the above code is lacking in comments. All the steps above need
> proper comments IMO.
> 
> General philosophy of Nova is it is a well documented, cleanly
> written driver with minimal/no magic numbers and abundant comments. :)
> 

Agree. :)

> Thanks.
> 
