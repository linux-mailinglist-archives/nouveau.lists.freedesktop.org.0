Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABAFC426FB
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 05:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DC710E301;
	Sat,  8 Nov 2025 04:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XbfUKC3U";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC46D10E0C5
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 04:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Usd7qW+Bqjq6tjNH86O6Vi+CunzZW9Zni34+uMb4iZpvgoTxnTCKe+GVgdkh4tk+012xCWuQXDy9oAcAlxE7MXEZqMM5t/tYHxEp2J3R7YJKgxO5iW9O0ms4xgFvlXHqGa3HDEweaNiKgydYQ8R/yCUdUv9inDPghWNo68cWKjzgQ1MxFRlNMjlUlg2o9Sga42LNJB7SxjliYaQixhFBJtIJ1RbmvKqAvFV1sKIR8Fnb48hwszKu4JmSaOM71SIBZdRIbligp4j2FpBeRgzwzVKiXXkr25qeCRg7qi/rEtr4+IPmg/Ru3o4AVxjtbNxrmTpM7u71AqvMcHdFO7ueYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leZ4TF2oZcRrXe3OR/GG+jSVNE2uvwsOa4NTd2soR90=;
 b=es5epih3wuD0ZcopQp3UU3mkQTTAGsmr0L80ZLQ8v111Yz9c1iV0lW0iKNw/X0svtsVqeUPGbiFDoOcTD6w2FvUa1tIn8JrUFlb+N1TOo6CkfOcxoU0ogpetfiibt6MNHIb3c191XZKBa8yCSKBlHtejA2hGo3l8eN7AYNDGKYh1YIFjOfD3mzH1yJ2w++QCNkrSum/ouNKOEHae7ajUL7mlIKNBaeYs6oebofY8ia9Cd4RtghZlYnVN8/PY5TjN4S8ldq+Zo2BeCoNvGEH0hwkN44jGfvwyZt7KKesmecJip8KZVuDvrOHQWVfbUbzq9ViXtLrazL32mlHQ+TCQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leZ4TF2oZcRrXe3OR/GG+jSVNE2uvwsOa4NTd2soR90=;
 b=XbfUKC3UFTDIHwhcVNeB5xNfEN/RjS2nOeV5Rq3A31AD9jrGk3qaVG93djWa31pt7F6525363ygBoiDXlsaaqlJlPqL1DSbDKSyaDLb1x38/41vXua/fjG2dXVuNPXH3iMuGWR/VnOTuC6D7L1aGnn7Iy8OlogrX6mLflBE01Oeu86Q8G5WlZULmjJm1N87/JFhc/QPopsEk/iC2jkpldJSBC/OKq5hiru5HfwDw2aEVKI13mZ7a3uzdlDspltUGNVY3UyQmd/A0XLDu2LGDEakW2x55mt9siaMwbsXq4uWjIv7ffwFE2bn8be+Dqlcl3kovkn0JOvKyIc4xbNl+cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 04:39:48 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 04:39:48 +0000
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
Subject: [PATCH v6 1/4] gpu: nova-core: implement Display for Spec
Date: Fri,  7 Nov 2025 20:39:42 -0800
Message-ID: <20251108043945.571266-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108043945.571266-1-jhubbard@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::14) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b3e4e2f-0681-4047-eae9-08de1e80d8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZjRRk6VD8eNL+8A9DXmielt5KeR45a2dGPERATpycaMA7hLb6Wl/UyF1ztb3?=
 =?us-ascii?Q?fMk0Kt/SQ+WZeZmMXjS9qNtzlpniULAdudJVx2Vk+4e6zvkO5Hs+7RHODAyO?=
 =?us-ascii?Q?HR61j4G9xUK25PzjQzh5Ha9QlgicnkCgTwoSX+5peFWePOEcn1yL93KN/OGl?=
 =?us-ascii?Q?NAI9Az0bPiwDmoqP/YYmKLddVIakh25SZN4aiPoVG2aeskoBwLPok8glctit?=
 =?us-ascii?Q?TJK0Ez5shTmtujX4yAyDNy0KWxRJAXDaF4T6PYo/sQh0+rxF4p40leZhnP6S?=
 =?us-ascii?Q?64mmkiKSN2MPDKirDMpKSHFYWeDUDNrsgtZG6+DTl9c2lJ9pefdIpaojMWDb?=
 =?us-ascii?Q?eKtAqB31SGRIcHTHBDZHz23f2zPKoG29QBtMkF0we7fTjCC3DZNucype3B8d?=
 =?us-ascii?Q?WVz9m8eRIsWrsVaQ1SfTK/82R2GHs8uWSF/ZOmoa6/fOxTf+l4huxEbTQY7z?=
 =?us-ascii?Q?YkW83Z/uDcasM0BkG4vI2zC/eqGAXcH7bQc4L4eeokUgkPCj7HB9Icrt+7cm?=
 =?us-ascii?Q?wU5ksUSPvyPizk7uD+e8Tc8aQN98PnPmiNk5Bzzdi07KCB/1AfFxNzh50/8z?=
 =?us-ascii?Q?AOG71aHqLROgfvdeh8Kjqhx7oM+fWYE10V8+wCoZahqDbibcXu06Nkc3Sjae?=
 =?us-ascii?Q?aiWKKju1/MLT3i1Stwh4H72k3BCprRe9/uyXWVM3DJWr7JwafdwY2P9x89g/?=
 =?us-ascii?Q?dBgMRw/4bYM22U87JW8WsR+kyPfIBQtUSVtkyGV+W9Nn/eT8mAOY10GcvtkS?=
 =?us-ascii?Q?7u7ltpJ5ipBqvIZS1o+hi6YjE4TXP4YMnZkBfhC6Yew3gCKwqq6SIIAJcfik?=
 =?us-ascii?Q?oewqwBX8vL5lgfowFTflemrCw106x5wxDy5YBkKPnYjNxf1TgTkyPceHqFiX?=
 =?us-ascii?Q?UldQJfgXYgrm8ytdaYLJn/dRQvW6X4roWnOhwtxEODdcH2EcavwOi1x3PYKN?=
 =?us-ascii?Q?YCSm4CHpSL5a6Pi2g6oUcSFeW+3Xwl62n2YF+tJ+kugcNSEV0g7J5a6RHjBF?=
 =?us-ascii?Q?IkBSj/YXeRIRtnwRWDik5d+lrgveByH1X1vwSKavVdGZpLsOTsLaEWqduMGh?=
 =?us-ascii?Q?nsneeTj1TlDykcECEu1Wy/ZP5b0TI7LIOY1lJ80WER5tKmdPaEeuKF7uj5p9?=
 =?us-ascii?Q?4fBqx4PzkWXCPdd5qnpTgoLc6hYu0YnmEbkG/n2M5xQcvhkI8CsZIKGr0o0T?=
 =?us-ascii?Q?fnh+5aMUt5QrABsti6D6QzcSCBXs3ToxdgWOH19UWuxOUg+XyMBjHxuC6KcE?=
 =?us-ascii?Q?JmKWjbMaIwAIkN5+6dpsj9ubXlYq1bUzMQhSZaNhi2oRQdqJEKRPv6t+Mexp?=
 =?us-ascii?Q?KtWHvF6iRQokjKzXy2DugPG3DwB6lhK+te592c3vDSqVEsGtMBbq3xHE+j4O?=
 =?us-ascii?Q?exivFbQUupL0TuqxgmvWFF13HZ+g1BOeRxSBKJ6PaDToXCUx9AhL7s5G8Ji9?=
 =?us-ascii?Q?92TvmhE5fNq6bmRv+GeNPFyxvIoi2F+2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UaKd9lA2S6j4ds3oMrBegPRy6YfMlv06XOwt5Np0V/zfaTsx3clqXj1ADx5a?=
 =?us-ascii?Q?pIC/4EU8ZpKRa2iwuacuj6CJr/uL7T6CuQNjcDYXEufe6Pjridm6gfEjm21N?=
 =?us-ascii?Q?0YggPoqoUYZUClVKW3xJ3GrAIrFXFaZ9+Z8ppjBeKlt96xruCB8ZK1+AKK31?=
 =?us-ascii?Q?JS2WAfFa6hLxi5VjEnnG588O0e0h7wU/qr9d4/6X6qiORmlJaW/WkJHv7wUH?=
 =?us-ascii?Q?iPatf3fw0njsWLU7mlRz6bLNbmfeRk8mRqG656ET9cil3q2daL+bdHy12dcK?=
 =?us-ascii?Q?3EKoBoj/k/mlOtCmo/vyebK9hsE8H3EKPrxKtLgZkAUbj+TIPBEdrdBDYBe7?=
 =?us-ascii?Q?7TNCJ9J0aEE9fnV++rYRPNlNVRAo3iscP2NA2dNtGDa+oo6GnHLnAj0jmgJM?=
 =?us-ascii?Q?ECPht1abk+R92E4urwGVe5ucEZ/uTgUYEj7tiY9SESOAI9MKoHd+FL+DmQJO?=
 =?us-ascii?Q?7uRTXrbz9T4clOCWS/KjOIm7qYy9jh8ct8z/mELXx7N2dm3Hv5e919GgPwnR?=
 =?us-ascii?Q?SRTvKR1VztATRcs0A0stnctEGwrJojJuyeVGfiN7sRIve3Nsf5G4SRxy8DBW?=
 =?us-ascii?Q?PPcnbAdtVg/dgg+XEOU4Db3+3JjkdYadrwK97JdgEqvTLJKtnaeoTvwHxsw0?=
 =?us-ascii?Q?JN/2QttUWo+gRUh1Q8UmrZPG2iQc+UHNEd86NCAU2VqFBD7bGB5AEfvG+oJv?=
 =?us-ascii?Q?9dHCJR/OttSczwbGXqmjU2kumHK31/nJApQnjgXpPvrdqhP4GXL8tSy3XP++?=
 =?us-ascii?Q?dvV0kf22Wmz+PLMMiJ2vPQ0m5dyT1eKPOtBnkN98PQzL4qOV0Hk+rxJZUxP7?=
 =?us-ascii?Q?ubPheBirssYpBKHsIDMmhLjUt/1f92R92m9ncrawwyziozU6UkcfA3UINGJz?=
 =?us-ascii?Q?0gqLClARo9ByXI/XwCEv0mwiAJta6BGNwy8hR7kBaCViMXmFaS2RjJ/fuSOS?=
 =?us-ascii?Q?G+sZyAC6zzvbJotZP1HJMRKQLL1NduMoRKxhgeDuFb5UEbNyx+X0/IUdF/YP?=
 =?us-ascii?Q?CT4fdgLU7hSs1mPL6miUjYBPRARocHeggIngOTnryh5oSdiZ82oZFKIHcWCk?=
 =?us-ascii?Q?ZqlomOvdCsfRDCXtjWRnqE+fPzlRf8vZ+a93Cux+g0/1JcjQTClSTF6q+s1g?=
 =?us-ascii?Q?52VrB5yj7nxiRA9zwGRsMBWn+W6Icb+Hiz8go8cbLSrQWxCHGryFJ5Vl+XPf?=
 =?us-ascii?Q?ZtFq8n8LoaF1ItOvzZfVJO0b/v0o9F1HBpGbktiC+vPHKdLlGQ3dwfZUtnXO?=
 =?us-ascii?Q?IERbZsri1WaU+a+uS1f7IcoFN3uuBH+DZLxKcc5H7ZbNwsqCpaqOA2kUvdau?=
 =?us-ascii?Q?hTWrcAO0AOI4zfuHlhKD2knwZYORX0LBdzh7ZQ89ZdPDRYAg08nQyC9C2CkB?=
 =?us-ascii?Q?HbmtM4dN0ClvJKqpaDnmWmNS+vIW2oFi9alnqOgdxjSeEBmfUETzzee/FOCz?=
 =?us-ascii?Q?IvgW2sGANKv2NXp+3P/swx2V54tf0xOMuerE31j4uQ91ycmjFJ3Xm2bTXU6i?=
 =?us-ascii?Q?19ureqN4b4+Nf9c5STKSPYNfAD7ZzhfyYAP0+aIHUT2RHlNBBstNsEsPEa4X?=
 =?us-ascii?Q?DoWpodxv5GMPhxNkj/BQRvloWYuM9YH/ZTIny8cH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b3e4e2f-0681-4047-eae9-08de1e80d8c7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:39:47.6023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Mup0VPuGyZQKp4VwAxgj+AIOyeziAesblBgEr+40sUKY74unA9xSzVv+blA+qpJP53pKMIzM4xNxVHKl0rTuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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

Implement Display for Spec. This simplifies the dev_info!() code for
printing banners such as:

    NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 802e71e4f97d..7fd9e91771a6 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -180,6 +180,18 @@ fn new(bar: &Bar0) -> Result<Spec> {
     }
 }
 
+impl fmt::Display for Spec {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(
+            f,
+            "Chipset: {}, Architecture: {:?}, Revision: {}",
+            self.chipset,
+            self.chipset.arch(),
+            self.revision
+        )
+    }
+}
+
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
@@ -206,13 +218,7 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(bar).inspect(|spec| {
-                dev_info!(
-                    pdev.as_ref(),
-                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
-                    spec.chipset,
-                    spec.chipset.arch(),
-                    spec.revision
-                );
+                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
             })?,
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
-- 
2.51.2

