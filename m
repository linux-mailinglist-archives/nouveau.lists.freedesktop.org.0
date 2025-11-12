Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E5C5085D
	for <lists+nouveau@lfdr.de>; Wed, 12 Nov 2025 05:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2110810E68B;
	Wed, 12 Nov 2025 04:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k5gDjJyn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823A810E68B
 for <nouveau@lists.freedesktop.org>; Wed, 12 Nov 2025 04:30:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnRtMR0CTUFQDjQwlu7gbkg9Uh5pVn8VMoVGNOZd9ihSI5Wu9sBlhsmehnBEtQtNxP+AXQOkOyoZDod5JBII4nJ9TApNvDRWJHvlAl9vzbv39K4zSpiluWx1hgAKyDP1lB+Tmmod1nkWnqIz8bfyMHlkO1se/DXmCCIUA+lvfvLECRG6ZVXobpPTzknM7G5gF37ucd9O+acYPLK63xUsa2vi3J73Ck0osBgnMDCq4fMUF6b5TlHo9GtQTkdPusJccTft0YzxKASbYVeVcefSCIhkgYT67tG/SprnMZzMkROyODByocmAmi5Tp12yEYGqP26d1ZdokInyhegp+0Zv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYCVmZEnvjoAW5L48Kxf3wndfvsetISdzKSDs7UE08I=;
 b=acPu/owb/PQma2gdhIy6A75SSKE0/hVY3tGb6OXhu/0bnH8OEfRRJAGbsmdOiQkCcJRKp8d4/hp6/T1BHjyV1OH8Dn5ykaMBubqJv97sgWDGpcxEYX/GRLEcQuUlfrTXe8FoBk5nEpEghcCkMBVrzFVOpfZSGwcVm1n/+d4iXQccVztamh6VQVTQqqYsti+wzJVaGiWxf1ldokf04c8Cjev+jmli7n+Sa8+3kPZ8PRmEz7GXlDlZku09I5Et0wOoSL64zFW1tPQxJhvNeHECeyo+Pm27bAAgSky3gNit4wu2rmLuwlf1TNDX2O4Fm9B/+ftQ71KpV3UTFn5vWHexTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYCVmZEnvjoAW5L48Kxf3wndfvsetISdzKSDs7UE08I=;
 b=k5gDjJyncJzvucsursn6cTrE+C3Y9/0cT8qaMzXjCYBiRY6wDA3M6ulNnXMo1WUdMzCNDI2DNfuWej9sIXiAoHFEE6BR27I9uQjhItAVK7YcJEKTUE4cqWgIdCF+n6BlA5ljAjjTIhLwg9VdiFPb2Dd4vYsumDL/dEaagB+wC21so1mcgUO8X33/m0KCTu/euSlpsLxKNIvV9WUEv9roiMIvJk16XwbW+BRm0fyWM95jTe9r+qPXtyrsspWjtY2ymK5ETF/RlkKqeRehKLKYMsqDzk4V4mzqThausSicmtF1qjykGHYy+DzIzLTFGDZvYIhmJFcPVKXmvv6cUsS+LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 04:30:05 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 04:30:05 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v7 4/4] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Tue, 11 Nov 2025 20:30:00 -0800
Message-ID: <20251112043000.83071-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112043000.83071-1-jhubbard@nvidia.com>
References: <20251112043000.83071-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: a36bfe59-b2a3-466c-de2e-08de21a42759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nYzNUvDgiOcbB0QO8pdMAqaBJO9WHbNcaK7N2z3Kl6zW14AcZ7xUqbwdWmO7?=
 =?us-ascii?Q?09obp4L3z43NIffk8s8Woj/SQWrHjDeABbPE/FzRUMaG7cU40DLmHLU0me31?=
 =?us-ascii?Q?7yT+4e6yyx/HVcHYO1KZblqDXOLZTPMCms1OihB7MRAF4KW8Ay9+kz+dlAhi?=
 =?us-ascii?Q?KrtKD/gyzP4z2LdGW64tgxYLUdzqrVuFEW9um58UzYW4diCt1FP1LjshAIjA?=
 =?us-ascii?Q?XKv/z3/UAe/bp/NBWNYSBnxbKfYyT6gP4EPb3/tu5fUNHj/E284SLVcf4Lti?=
 =?us-ascii?Q?Bvmi8yy4Muo+KpN9qPsWfEoBnv2r/ds98yU9Ef4wUzSefgET8Mj5T/RKmc1y?=
 =?us-ascii?Q?GKsihVV9J5BFb44eNzgmNxG9iE2Yp1TBc8/TQK3LbrcwmoZRXwVoM/WQ60Gh?=
 =?us-ascii?Q?wXvvDoDoXLyVgKXfyu6KY/c3veWBnCYUSzhy7dgzIb63lkei3Gw7fwxzDPKK?=
 =?us-ascii?Q?w+VTc2avoawDs0Bd/5CXgHEicQDJ80iW92m8fmGAHqvgdLzU2yjG66ljmoL6?=
 =?us-ascii?Q?Aw+AV1EOyd6EI0Y9sQ3jxZ/tCANWfTegAEwp7AP+e2f/5fNWSs4Vjx4Fv/Eb?=
 =?us-ascii?Q?kqyVg1daISobElPtMYHX/wXFkTtRoQVRbyu1+afHgsv+N7xbXvS0j7AMB1jW?=
 =?us-ascii?Q?M15+DYuhS0K7e9d/tFmxI6qqNRnj5zziOhx0nsRXmGVa1N+OriXQWEo70SV4?=
 =?us-ascii?Q?lP2npuKPVt4i0VPle+McN+aPsSwDzKr9a0OoqOM7t865DUkG4yIpz31CdEJj?=
 =?us-ascii?Q?SpwrsAbez3vs7YT8PZDeInmqMkl0U/p8zR1JVkNCxdqnsDVCrjxl7MfKcsUb?=
 =?us-ascii?Q?rEMOQ4QZYjEVVOa5B2vRbTtirEker4fTyp56MpbjI4+CshnMINqCQKt4HIRD?=
 =?us-ascii?Q?6LCtvWmvt/vDGbQjNPGysTrbVoIMdZzDtbpE82ws0OeXyhfWNxM/MHd5B2fP?=
 =?us-ascii?Q?tnVdjQcg1mrhdZaEHoNtzYIRn5eqwObBXHeLHZwVyO3MeU1ZvoSwluuINZBc?=
 =?us-ascii?Q?vmrfIirhR2jTlZki05Ncq672pLEsIa34QPOSY/PF8AHEqiPOBTehz22/i94C?=
 =?us-ascii?Q?Gla6CBCJ/NJbcPZWwMzb80NyBVoOYEy+TMYCfeXXiFG9zx1DOK/OTbS7REVp?=
 =?us-ascii?Q?fYULiYLntSPVXI5ymT+xoGNQ57iNkZgkaJAMm92g8jVqwTxZWmJZoAnoZlfA?=
 =?us-ascii?Q?bc78qOyJN9knl0Na6RS/3Ys3PTPFYr15Mggh+6xmlVEWoKH5Xc6nr7pZhjaK?=
 =?us-ascii?Q?g5TOIIXYj3rPrIZgDca3WTizUh/WlgSSabR3YXtGth3dGYNyOFS5ZSFY+8an?=
 =?us-ascii?Q?yNQOblzCmkvVElyNlJqBwfyfXRGDyDkBzd4q+KBlsGUitraV0rfAY1cY+ri6?=
 =?us-ascii?Q?8VrICeg4cg36I9/zaHR1AXc4c0TouPlSyWuBXxdJae8FKIhtnDIrHJShCOl+?=
 =?us-ascii?Q?445ZGu7NZh0BbCFE9fh+6zyY+Ec8VNUoiZyFD7wFJsYY7CBs+p7ugA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aed+50LGd9/w/zHG8+5Nhudy9A7Z8qc5mjRPDsKwygtPsmw27zGoUN4qBMoW?=
 =?us-ascii?Q?ullz2LbRTyrCSae0Gfl0c0OYLZliTbWW63VxczhDTlZf3/K6SjFKK3QoDKmO?=
 =?us-ascii?Q?O917YSOU0IeJTJnM4bMYy7218HXetAcKgi035AOTChpR5IygQANAdqLOxx3O?=
 =?us-ascii?Q?uHXfylJ6NZAXZ94KhGOt/zn5hdH8lMqkFKGiL0fw8dig0JXXf+BIVyFxDa0O?=
 =?us-ascii?Q?V0hRNG0c9mfGuSXBWt1pfz0I9B2DLvdh4dUZihEeP9qEuAc6wKkWhftlJrkT?=
 =?us-ascii?Q?IsfYNqoHNbbpDabNWRJHj9u2MMpFYEzORaLLab9XIwsI4LtX69HYgYh/p651?=
 =?us-ascii?Q?j+J2ow2dHrlIjZ/VWamf23QtBLq9iV4gzyvBBRltnxS+ff0AG4/bZY0b6MEc?=
 =?us-ascii?Q?XzNGWl0bTte3/DkQnSgN96iIyEvU0BY8Y7PkguLQn6iWDT0yFyn+leWKIyVa?=
 =?us-ascii?Q?rjgThJBk8IN1i+RsATntBhtiaAA9NRzZwdbySPqQ+kAeuiPEy2XIw4+/tdeg?=
 =?us-ascii?Q?kkxVgG3AL+ZQM51STg2el+XQyUQoF+Jh2l78lZNSyzGs2ssgenAOR9cPGkK8?=
 =?us-ascii?Q?iqPtgJbFFOrHxMWBvdVn8628pj2Pljj1xmAP5EMG0cc8s/UmnmnFS/aPhfUo?=
 =?us-ascii?Q?uVtTCR5lHPozhmFynI8vVRpG7l+T9mIIOf0IxB0NhvNfMjCT69R2/icdqODM?=
 =?us-ascii?Q?8H+0AmCBHnU6pwTjqygD7RVu/DN/BqYG51/mtVylBqmW6wL9Ix499xkmMCIE?=
 =?us-ascii?Q?I5+Qx7xGTyq3PRiU+aRHWWeEo1x1eJRo6drZj2booUt3eIZlRRobs2NSoFFq?=
 =?us-ascii?Q?cyq8hw24Bjvy20lT8rpa+4QdzvNuy8Nt3un0Uu94lEr1+gc5Z1L0f7hogBQ0?=
 =?us-ascii?Q?O6qGuP2Af7qLjJ200UNhZL9SpEC37xLwQYmadRTpoQ73D2B3MH2961S2MlK9?=
 =?us-ascii?Q?TA2Gf3CTfS/yjQBnuylNvwK4g0YcGrktf50lF2LaPwok6taNnuh7MrE4ltDX?=
 =?us-ascii?Q?yMpZGPugun9IiQt6mx6HspN6X/WsSdn9+YNplTkW/Z9HTwu28tO/kHxfJSwr?=
 =?us-ascii?Q?eVw7Ul+BrWCUtrTNUshLA4H5ASHjlQ7Z9cSowUw2V7UfzACv2v+0WulPcfAJ?=
 =?us-ascii?Q?v6ei2fpf2MuLxIkyKhkroJxVuXBq4w9YR20/KZBxOvNrZUKrMkmHr3w8frtS?=
 =?us-ascii?Q?F4TLsY6eT5fb1/lJsu20kXCnhWGJMPme+g+ZoQlNS9dtEnLna8L5myu/YDHM?=
 =?us-ascii?Q?ErX2SPm0rU1Jg/QIPouCehVNjAWHKREfbLqvYKoWuPEkMfSm50R93Vh0+aQs?=
 =?us-ascii?Q?KXboHEqh/IMGBHX3NxaOrdm99S7Kjlw8D/ixtfJcrhmPIRBpGguwBoz3FhJv?=
 =?us-ascii?Q?YHyr5EZYrEwuVmEpIwzCebLy3BFDx6cxipircFwZGIcVoLmUtKnvQO7hFYKV?=
 =?us-ascii?Q?dMgVPqnYPVE6IezXsxTgt+UmNIjIflcj8X05scwCbjuRqhb2Lf1WzFVWa3e9?=
 =?us-ascii?Q?vBGlZYPJTkTnCr/htRSMrZCWmDcmOqlwFgH3c0LVI5CQX07dZc/wJldJhUt+?=
 =?us-ascii?Q?7zOwDi/OwcqzGRpFZ6j48jbl9Dh1GWVWKxajxpF/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36bfe59-b2a3-466c-de2e-08de21a42759
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 04:30:05.2879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZR0tdHJxSRNfjn84Dx0cFr37kRGNUehPCKdmPchZBkqABUe7VmUBi6PdIIrkRLmZNFSBDpSooy4qLciW9dx/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811
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

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will contain a specific set of values
that will mean "go read NV_PMC_BOOT_42 instead".

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 32 +++++++++++++++++++++++++++-----
 drivers/gpu/nova-core/regs.rs | 22 ++++++++++++++++------
 2 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index cd58040b681b..8c5f46f6aaac 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -175,19 +175,41 @@ pub(crate) struct Spec {
 
 impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through NV50:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
+        //    boot42 may not even exist on some of these GPUs.
+        //
+        // Fermi through Volta:
+        //
+        //     Not supported by Nova. boot0 is still sufficient to identify these GPUs, but boot42
+        //     is also guaranteed to be both present and accurate.
+        //
+        // Turing and later:
+        //
+        //     Supported by Nova. Identified by first checking boot0 to ensure that the GPU is not
+        //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
+        //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
+
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Spec::try_from(boot0)
+        if boot0.is_older_than_fermi() {
+            return Err(ENOTSUPP);
+        }
+
+        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
     }
 }
 
-impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
     type Error = Error;
 
-    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
+    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
         Ok(Self {
-            chipset: boot0.chipset()?,
-            revision: boot0.revision(),
+            chipset: boot42.chipset()?,
+            revision: boot42.revision(),
         })
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 8c9af3c59708..81097e83c276 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -41,14 +41,24 @@
 });
 
 impl NV_PMC_BOOT_0 {
-    /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
-    pub(crate) fn architecture(self) -> Result<Architecture> {
-        Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
-        )
+    pub(crate) fn is_older_than_fermi(self) -> bool {
+        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
+
+        // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
+        // GF100, means "older than Fermi".
+        self.architecture_1() == 0 && self.architecture_0() < NV_PMC_BOOT_0_ARCHITECTURE_GF100
     }
+}
+
+register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
+    15:12   minor_revision as u8, "Minor revision of the chip";
+    19:16   major_revision as u8, "Major revision of the chip";
+    23:20   implementation as u8, "Implementation version of the architecture";
+    29:24   architecture as u8 ?=> Architecture, "Architecture value";
+});
 
-    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
+impl NV_PMC_BOOT_42 {
     pub(crate) fn chipset(self) -> Result<Chipset> {
         self.architecture()
             .map(|arch| {
-- 
2.51.2

