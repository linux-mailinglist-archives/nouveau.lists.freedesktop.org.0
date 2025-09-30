Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297BBAEA7A
	for <lists+nouveau@lfdr.de>; Wed, 01 Oct 2025 00:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BA110E2A4;
	Tue, 30 Sep 2025 22:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="stTYumNP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013031.outbound.protection.outlook.com
 [40.93.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEB610E1E7
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 22:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kistM7ycP0U2U/MJtQWJIaHSU84+nrV6LgB9zYJLkdoWGpPShBvr/eV4pT7fou4k/4+hFr1Btc+Bx2oYPilTbD7BWbHgS4OqPeuxI9QXjVTYGhxZF+8XIcBQy2PeGrG4+Wc1fxWs3rOPqQNz7Nmx0C1FbCJDaACwA24wV/PeAEC22PSSpOukBoajq8GVpn6n4WYZHYlhgU22l3nJe7xyhXyccsXJiTF4l3Ex4CAVGNwCJ0IiUzPO5sanWgb76zbfDGzSjQDKzObV1FNPIi1YUskRsvrfAiDInF8DkYxB9Hr60noy11UMtvCZbTe4/TkcW9spvuyNaZfr/UKuLiZIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqWMkOwieXVgfGiKwqUcYH6t+p/ib5+yXZ7VJxTMc08=;
 b=jlpGNX++lCNupdSU3xTVW3OWnv+a7QxVMOOIhF6HsOJhcUOSn2hBnY95WwIEdaP7VSUWHc6FvOzNj9y2L85+D8u66VOP90ZE1s/8MOPM0nc2UdX0ZtblWphexCkUDeD/Es4lLD5wq9S5e7lkN3ZWPXbVVdu05yx7bCB9RENic/oUHg5COwHjWbmNqedtJ5pY50dD4QZkeilhSWa+tvPEi0nN0m1kRg30sQinHyEJ7JeWofP94VaDiIfpd86+twTvMJqjoo3WhPZF5hCU0+rF20ol++PpBSkmBp52Qz4aQwmOPwJjoMZI4L8VO5uWSVKsjVNokJk/Bz4Tbmur+l/QxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqWMkOwieXVgfGiKwqUcYH6t+p/ib5+yXZ7VJxTMc08=;
 b=stTYumNP2cvX5NNoItLaGDxQJuTr+31TJlGjjMOYSp0abANYuWdDcBdpQZjrCkGSBjDrntmqMyNq11VPWn3FKkGJg4FSeriN+gHy5x6stscQKlbo/FRHkisbMgb9r/gbrpNaLKf09PXsxIoGKaEBZ6H2yV+txsNkSsLHPOWaOG8GMJF6MWH2m/ZPm8LSBgouJahgrJmB+EeEq/PeLmJVW70sijPXOZwaHVph57di63KiGW4Q54vLdu2fYl57Qv4yy6+jntQcX3bfUAx9bTzV/usvN8XxCtmT0QPZzOs8U+5mBTVmX3zzAbMrNdwwp09taWb9m3BxEP9OkevcV9/4uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 22:08:02 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 22:08:02 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 1/2] rust: pci: add is_virtfn(), to check for VFs
Date: Tue, 30 Sep 2025 15:07:58 -0700
Message-ID: <20250930220759.288528-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930220759.288528-1-jhubbard@nvidia.com>
References: <20250930220759.288528-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: db13b312-c290-4a40-2242-08de006dd2eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nMnvJtC2KsyQiTJY/aFiVI95tQbMe3MTqU9d0MTRoJ+zAKYSr9JXsa99a9DU?=
 =?us-ascii?Q?9b4TOvEYgiIrOnziiTldeebGgRIaXBIWYlAYQxlYqE2ZnfI/Zl56P1n/jfVi?=
 =?us-ascii?Q?P8omexrTm/1E+BzH/cc/8BUSmPc8be9vVR2k4r9JF4TKqP57lJBu7sTx9CFS?=
 =?us-ascii?Q?/YoanEcUsnLRB8S2PaE5XcEyX8jVmBX4Rg4wgpu7KdKSDCXcPofdXiXsMAib?=
 =?us-ascii?Q?F2e+kClbVnLyx1wUhG2DmPh/j6mkJ8WSYwk3xUUHaYh7qu/5m1z4ruWyjw59?=
 =?us-ascii?Q?aqdpwbt6Fk7J07hDUkwm4/r/fVk06BvwkCiMErxc4WPYvdFZFKOCDBmUDcj+?=
 =?us-ascii?Q?0d/pVjnjFkulAKA3DWn+6cwufi7Ew9Itmaeu3DBlfR2QXGEikvkp+sIieM32?=
 =?us-ascii?Q?c3Q2ws3JcAXctNH57dz6PTI58DcAsRDfNNk09FhP+w75MfjYsQ8etxwxejhv?=
 =?us-ascii?Q?udUaYFifDi+rzdv5/77b2ZFBS4f6tOOGc6ZaPy3Lnhh90hYGJs3N7kl+8vBz?=
 =?us-ascii?Q?ALlA0geBBtNeQXQFGLH/Fow42QZjpge1rjo6oZ11zYORCV5+nxtJSfQ1qqOJ?=
 =?us-ascii?Q?HZrZEPMTuOFD2gD8yGqURdWFIEARS+sGl4Zgctrdc4a5C/I9tsCV9XJy+Num?=
 =?us-ascii?Q?VmCJhy8HrVCTlA2UBaOS52VzaInPyJUrTuDhYvKYHaDxWwv1tklUxYaKArjJ?=
 =?us-ascii?Q?jTj8/Dyq3IsxGeboKH9jIHRspGJNxRujb31T1TP+3dts5N2ZQ1NggFh2uzpq?=
 =?us-ascii?Q?kdpDY0dfIcNn2LhllXcODPr/5tEik8BuUcCB7oiGC8v+yZ3tapUa9mjYywX1?=
 =?us-ascii?Q?9qgGh09FOl6mokYwcxlrN8AKF5hlyLQIVlF3QIwhrXwqITEAuyjbAFmLxw6K?=
 =?us-ascii?Q?TnZA7jhS8WTRYVCEEm/bx9GG6Jt/xs53CKmmflTMP+2IlYIRsZfnehX21pk5?=
 =?us-ascii?Q?dvhuZNQ5CWBO7A/23nDhGQgeirJJhH8XoMZLAN2jJDM7Gwi5aM5UDFyaCgol?=
 =?us-ascii?Q?zteshN1a71yx/kPXWMyU3TcXUAur4T+LZXJjCwyQpyp3WDfcF3wo2i5q2q3W?=
 =?us-ascii?Q?9ap9VSNYfnMV90dNY0jVNaFk34UWnvY86arbt4TVbp3iMWb+wTfU/x42d/pE?=
 =?us-ascii?Q?aYt5t/YRbODPX6kyQCuwrD5h+c4FwGBN80hidPorE7Xq8J22P7Ialb3yaSFn?=
 =?us-ascii?Q?ZeCIlAHcrKyZKqy4g83GbMkr8NvNHQNgzC8p8NK3ITn6EaEfA0y/RPIZGctz?=
 =?us-ascii?Q?k8rmoO1dtrv69osXnc/qrnRUWsxfJnhzgLQNokqM/0dld7MwENLRNigHWkVr?=
 =?us-ascii?Q?DQ2z/RGWO9aQTjUvi9bHjDUe7F8XrRruWiZVhYuauGE/iLcSirDWNgLvK0sP?=
 =?us-ascii?Q?ac8O0k6pkUiq1h2EKx+tdKe+u8pNjaPP0r6LUNkprVplPyGjr80jzhgPQLOo?=
 =?us-ascii?Q?25pb8xOx5lew8tCXU1+h76Q92ye2O4M8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ep7b1AKfoAPvomCa3F/Qc2cerseYXYB0oOv5am+1X+VfCvsYeEHyQyYrPBwX?=
 =?us-ascii?Q?OLuCqGfUCf/QinAlfLdlpKMq/ZRRIGulNFim5d5vFds19EHJlTNDCpqN6WXf?=
 =?us-ascii?Q?1gyObXdDhmTV2jLooYh7Ebi4I+GKEFN1IcHUTekZVqpxUIocM5A0k5Yuz/Yr?=
 =?us-ascii?Q?MwiFkwhLiJQ6j3a8BrAtAttt2QROZZpEOzs7CBdCKcE8c8pjSfB+oWdX9dCh?=
 =?us-ascii?Q?owO5RzX0FAHP19r5oNd6EVZxKq0sQQc3mHumHyjOBh12Dvj8LJgu+i0b0c5M?=
 =?us-ascii?Q?lD8PQQghQ9kBthMDn6MZSlP2mJMJ3QSm5+mWXRAqyow+ZpWJiPKMelNSVizu?=
 =?us-ascii?Q?uRlvApqpXBVsN0BjsJaZ6Kk4Yu8aHwZqlR/GiXSfa6BJ8aurknQJhinb+RcV?=
 =?us-ascii?Q?+UG+iL2hxMh0P0eRlf4qUSg5i/vwBjpEHe4p1Bq0kaenr+sjRnrIG44bQy0v?=
 =?us-ascii?Q?vGafqvdXENPeHS8WMkuTnUC1MQa9AJzU3/Z6f3IX9sl0Yw9SaOhLt5lYlWTK?=
 =?us-ascii?Q?cBs4Co5K7k0Z9TzcS7WHYmlAJap/wkW4Df9epzvSXPB2VbFtVOj5Yvph3pIA?=
 =?us-ascii?Q?x3anGcVyE7Rncg+dPQlZcQSA0OWPYtjhPOkY9viIg5gmuLNqjMCUPXdK7oAx?=
 =?us-ascii?Q?DH+NRfESvLegwSWoBhVgLgpqbT9fH1deTiPJm+V4nOgcsdPZ0h+0CrepZkYh?=
 =?us-ascii?Q?rCRbTgw7H5SIHQR07QILNTRVwjPN1TrXYTjbyGoyMf1lqzvUpheRRB5gUUuE?=
 =?us-ascii?Q?/kZ+XjZcipsc6HsSr/t2I9vkRq3hFaZyaZ/wKgusyPSR2JPMkSSPjNWK0aDY?=
 =?us-ascii?Q?I91QpEYiep5snGa3W+l2/PKI+5nYyEqCC4PCS8lHgBVHZqbvzokcpqHHOnhh?=
 =?us-ascii?Q?zKdjsoz/tiRcZSAMslbjttFV8LbUs5yR8wQ00MHl11H+ldZnvS8jY5/YBH82?=
 =?us-ascii?Q?ABlr16NqDqgQsa6HFc3lGjw7kYfzpC1CtVYGh435ycwuyFjmklEOnvMnZisa?=
 =?us-ascii?Q?FNOi6w/DVBacvMu6bDumv4ikB+KzQfkMjU4rTQUcQ2+hN/wdueqcTRq8az0v?=
 =?us-ascii?Q?4ON/PFlk3recZjYA24nxsifV0kqB8X/PwrK21bTPc+wD1kb5vApntKJ1U/p6?=
 =?us-ascii?Q?dN9s5cPYhhJKZMxP75Hq+0kTmRq6YacZayodOKENCWF4XziwYSa72cTteUob?=
 =?us-ascii?Q?ev/I+mdlKkGbw505+TGpxLgGLkwIwqhhLM6OGbdmbjA1jC+iua0ZqVSAGj0g?=
 =?us-ascii?Q?8rOkjznkbVIqylkFTTOIQhghnX39Jt8yAkOhfJo86/NigaTPJ2saSCVxgf+i?=
 =?us-ascii?Q?dSmiql+JrMGTwAyfL/2FnvxqPJ0iXAwCNzVNaEpY+gFVQbMoW1rx/k3+l6Qk?=
 =?us-ascii?Q?8pn5/hV4SQ/UMno07yGg9ANFnFiYZ8t6eoZoEJmqWO7kltdF9ikXescQfGXq?=
 =?us-ascii?Q?VEcYSJlkrPq+3Rc4XpCrTN5HZHchZVQ5ZFP4V2mBaRlDD35VLFPxv4M9rpuB?=
 =?us-ascii?Q?WNdUQuSd6t2FsVKZoe2g2BeflcDWJE71sPrlO/9IsnKqlQioS5gS+4UuNHq6?=
 =?us-ascii?Q?HqbPx8RtCJvdKqrVTBNzPgYZOnFh49w+TXxcd6qw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db13b312-c290-4a40-2242-08de006dd2eb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 22:08:02.5327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6KfxhH8mSyQpFgChc+ntKgm+4MH1fPC/QOxgssrmPIAwoZ0Zf0/2ZBb1tmePMCHkMy6P3HfwKzrNJbd7ZGhww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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

Add a method to check if a PCI device is a Virtual Function (VF). This
allows Rust drivers to determine whether a device is a VF created
through SR-IOV. This is required in order to implement VFIO, because
drivers such as NovaCore must only bind to Physical Functions (PFs) or
regular PCI devices. The VFs must be left unclaimed, so that a VFIO
kernel module can claim them.

is_virtfn() returns true if the device's is_virtfn flag is set, matching
the behavior of the C code.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/pci.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 7fcc5f6022c1..476b80f05905 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -496,6 +496,12 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns true if this device is a Virtual Function (VF).
+    pub fn is_virtfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_virtfn() != 0 }
+    }
+
     /// Returns the size of the given PCI bar resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {
-- 
2.51.0

