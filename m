Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5F8C9DD94
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56CE10E70E;
	Wed,  3 Dec 2025 05:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="upWCRvha";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5F710E715
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYCSND8S2TNr+i3IVZe1MKCQTRbu1xM92qAIrpOjuK0dLOQNMq1B+GNVcUSd4cKeiI8hlUxWHwurCHC8VBlepFMQ+1n+dWWr4O1AI1gt7W0BhMHGytJBuAKLmKpn5dYH51mFj/iuQusSo2sy2bEj9TpZ2dEWYMNHRDm1FcEbqXiGnWpHEhCZqIW8zoj1l1u/7ZAsRM4UecYksEVipWKwZyxsSb9OOR5b3xs/Oxn+8DUHaP1r33wEmaXQ5zoYm7vSd9UNEjtZ/E/3Rcm9nQc3FxRY/+wXYEQoOmzPeMOSJMpUIbHan/FyQY3bVM2sA64Zckqmn+mba7sJF9Y72O7N6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kODrv7J43eNKte5sFljHIxQmrgcZn3QWebdZR1YjHYg=;
 b=CeCq8LqSyzsUQAWF2wl246ZsKavhu2oYH+hwkui/60a9eFGZWwQ4TsODCKxvHDtra6HVjvjiSfII11Irf+g8rf1hJKQ2QfP8IVj3wEngtaA4jUlX37hft7IU55ICCoUTltVeeRJ56FDHZAY/B28QhEpCVuzn9eqBQSaWgkbGp07yaAXYbhrnWzHRj7lGkI3jICdu7rv5/hmzXAmiZoB1Wa5EpPFRHbjAQA+Hv+2VHIuTxM0ZQYjRcDJcKZPUIwQAIbe1p6qON3scuoUUcVbECCLrxDWRHWT7eCDiWIYoPAjhXr3iXYnnojHeAovYfF5c4cSiP586gyP3JQhaenI9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kODrv7J43eNKte5sFljHIxQmrgcZn3QWebdZR1YjHYg=;
 b=upWCRvhaizh1eaAObffYcrG0XBS0qLjGCDFoxZg3leB2LHZTP/zOKRHZr90L5FineutTeI4qY+jH6asKfcBuzttob/ZTwVv8FipzuKQ4GsHkIiudsAn9I/GiF2ouQQv8oI0ghAVKrqBxW9Qa9TR33/v6Ac/z/7NYy2jnE4gM9AufzPvNdQg8zKybtwz1tbEAaF3PgABbSdafJ1IHL6k0EfXQPt8bvDFK6vDn+TJKmjLhgmoz3ON5WjEk40/fsIdnrSNsJ7MeZgwRt5Vp5znNDA+hph0bDURl+lbyfIup4Smv1xya/5wBGuD29TnMuOsD7bUha2hDvSu4sVI156pIXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:48 +0000
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
Subject: [PATCH 16/31] gpu: nova-core: Hopper/Blackwell: add FSP message
 infrastructure
Date: Tue,  2 Dec 2025 21:59:08 -0800
Message-ID: <20251203055923.1247681-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2c4bfa-7175-401c-63bc-08de32312abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n97CZF3m+hJVy51XkSTTdXiQ5RL+XXbfHSoYLx2wI0nRbxU+okj0XOteYnbG?=
 =?us-ascii?Q?GJbg/vrD7o4HGdjjkE9ay0+akw2njcybwA9w7l5Je+ZotKu2C3TynTsZ7Unu?=
 =?us-ascii?Q?2/OXg2G4XB2CMQQeJabWusC7yFrk9DKLJoDkOvNLkyX2Uv/Fhbuap85EL6yl?=
 =?us-ascii?Q?pHOzt2sKFJW9Vka93d9/ZslKavY0f+1B/W6CLxjfoi64HHEAB4Tdz8k0Ixww?=
 =?us-ascii?Q?hJNwfAdqQohANIvu2hGThgX72is/uBNhmAiERIZl9OdbUY2gT7wOLq9kHuT9?=
 =?us-ascii?Q?ABg7wizU3wCLK1YhI5R/xVs9pQDd3waF5QGAYNbKntake0hnAp9AeoOGYx0F?=
 =?us-ascii?Q?qLRBCqX1/Syrqsc2QBL6CQ8/QkpRCkGkv27dJbiYdpxHPBQXyObGI5PvoaLe?=
 =?us-ascii?Q?a4+jdpEmYKwDqoKzIOdS0dH9wa/1j61qc4FBKG0ftDaWJf8d3pu/JI2XwALP?=
 =?us-ascii?Q?5ZGDn8gr0qFNX42ZA5DBaxCYNmaNV7AEZ9Jy00EwYPbgVGRsuoE8g3Zniolr?=
 =?us-ascii?Q?6XlheQFRrP7iFOv15UStsevVuiZ2Rh1s0QF54tjE7crXV1owkMbspeZV0R1i?=
 =?us-ascii?Q?XouVAXoIRUfuK47mESFaSdP/khNDGx2QddwhjfvR8IrUsKMdsiCwP3laYwSo?=
 =?us-ascii?Q?suZJPpp8fSxBqbUiBgU2+c10GxhAs5ZnLK0if9lA41MuzndkUNw7pEfDRcCw?=
 =?us-ascii?Q?JM4Q/sgMkTAppJCkEKzOvkDD8LWT+4NVfQK4+IvQVEoC9f9ISZD+C0uZjekk?=
 =?us-ascii?Q?IqXyUVWF6GMh0nIFrhArmABrPM+ynbyZuhrp8rSzU5Nqce0rt7PIfC/3gGhS?=
 =?us-ascii?Q?1bdCyybbI3xtqx6YgnU3+JKAv7eLHrOcBw2txy8UYQmDA2htD2KZswRyE7Jf?=
 =?us-ascii?Q?YB1E3h6C0fXMqBcDvEN46LhxG35+TczktmIAzKyTTnku9xHu1zCC9RIfzfay?=
 =?us-ascii?Q?juuuqoIzxuu6+TTf3KFtyZDoPJMiUyRUtG1uEVU9SDVKEcluuRge3itgwpve?=
 =?us-ascii?Q?RISoPPEXZywXuC17jmnaSBsSH5nDH88FVAPtxWylT+qg0BQnoWv0mX66qjsa?=
 =?us-ascii?Q?Onqx9NhIcngfHxJnnXsDHNh9wmxXbng+uM7W8+klBmAvlf2pfHYO23Ykyll2?=
 =?us-ascii?Q?K4fUrGe5qpRW0XJ2PqjQ/pOPOVFQbv8vUhvkxpK0BsM9E8OPWzrtAtage977?=
 =?us-ascii?Q?JfWTMvTjepvCFPDE1nvziPp/1KMGnxe5muTunyjZGaZsQgpFCj2cYuwgaXbY?=
 =?us-ascii?Q?BpRaJVfqJRfFKqz4kBi/oP99CaINlwuSuR0x2OoZT/dSVUUUg6NtB4S51Oym?=
 =?us-ascii?Q?zNEyYcG23O+uUGcpXitdPs36bsyFvZX4uzT4darT3S3HTuJxoud+px1SfgM2?=
 =?us-ascii?Q?WbCVUzZIKglQZ5iK5I4OKm+YnnkAzxSUfxulCXDHeKRhWj7lbyu5kUkspLRb?=
 =?us-ascii?Q?lp23NNx1qydK7TeN+GFsUHX2VoRVWJ62?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oLBjeOGgtrzYSLidoDNvjxRjjiU6LKATQN4sWNvoDDrzDIBlmXdTSLyHbZvv?=
 =?us-ascii?Q?WBh748cFwk5LnOkUOHCbeulgmC3bIzafzDGXyv9GI6U5eEI/hK9KduiGkNqV?=
 =?us-ascii?Q?tadVnFoUbwQHvSKkTGqG1LQHMuPcjlqrpYFsZcLhbfXKrybbaLqHpMzAw/2g?=
 =?us-ascii?Q?BN93FFnqvb+Kee3I/X5cxgVkHlqqBOI0n1IV+vilx2E+X2EfUgO+pbv7G2kz?=
 =?us-ascii?Q?3ZzckRz0H4PqtwEC/GXFMwwiBctrCE0NGZFNcike//OlUDQ98rz3KjzYRtnI?=
 =?us-ascii?Q?swo8KoMv4jGz/besCPsegcirc9Yci2O1BgmRDIhHQKJowwHoPBKRlDv616XR?=
 =?us-ascii?Q?6kxljtFajPNywhtkwH/i3UtgvEAyw6l4QdbRiJ9Chenv+sJPl2C3J5qAsD8A?=
 =?us-ascii?Q?klIMSuRXQ1h8IzhknftPiLH1sunmmol0M/CU6n0N3B3Y7aMI06YRVV8sXPZQ?=
 =?us-ascii?Q?LRH30n7H901EHd/6JG1zUY85OggvuwldIz6Qfwq2fhL1gXebzLP07hEUTdUv?=
 =?us-ascii?Q?yXmbVyFmLCV0Wwvt6nE7fG3LGCotWK8jwQob08MgFHCNhiUdg5asUap4WeGF?=
 =?us-ascii?Q?m6FtgiHqK9UEZwBVF3tKH9JppHc4Wbknlz4HrD0Cu8MQMm5C/P0NOAdFCkgQ?=
 =?us-ascii?Q?CRK+K4Yih4lG8i/L3Gu4rG4mqiOcEjFTZTLlF2zaesR0zCBSGOuVcUaI4zHI?=
 =?us-ascii?Q?RmGGGujnJ/ZIq5MU+tRg2UPKkOd+fe2K/ojgmXbZfFi3wDn/1dgkCgF4kjZK?=
 =?us-ascii?Q?5MAURBc+ivmVtyZOQT1DdAlGlP8QNvMXi81PCej+hZthSQL3w/M1VtrsZ+e8?=
 =?us-ascii?Q?A2CTAB+Jt1s3QKWIrYatiyjQBH+ydBa1gRWpYVIMCmJJLsHQsLapPL0QqhM8?=
 =?us-ascii?Q?z5uG7toSvzZFnQf2eeVFW3l5y97N3A4MZPkP0FWmPmuhYe5bbHO034yO4ogm?=
 =?us-ascii?Q?rbYEg/nzusvDJphsMDx4xIvzUarJLSJWh18L+QY95ZqkEPcWuLDK6/xJlLW/?=
 =?us-ascii?Q?ByCq+AAiAsN62Zxjb5wlGgNrV29jRwMsTTxHfk1UTka+YEKhNsoYAkye7OkA?=
 =?us-ascii?Q?/5HYDnnlmlDYERBkuWNMMNkrAJHtgpHeilS/pf1MPSzCeN9qVDrJSDs/S3mq?=
 =?us-ascii?Q?z1gMuBf8egE85ESbhoZAvGHwd6+nGwvMjxwJXioxnsY6hnOMSMOQra6d7b5D?=
 =?us-ascii?Q?XDMaTO9XgB6DUXVemo04/CWUlRbTRzRvjKBhhjz7gUutUOgPQLMqmTWAM2/V?=
 =?us-ascii?Q?xTtMG/0lComwA+NE7l2YbA+84pX7O5Z8zE8EqfCCfgzOdy8CHFm/L8dnQfd2?=
 =?us-ascii?Q?SOTbhPDX3/xNUUzphaSfMjb4/AHOLN5uYreg6u6CvGUaI74a+eGzvVKr46BE?=
 =?us-ascii?Q?xC118Pu9YfGNyRqFDXfPPGjnG2Ez+yBAKPxLAgbdgwdVaX+rCl6pi3nU+Mi7?=
 =?us-ascii?Q?tuPZU9BBUoJ60qWyTtsVo+RTEISaVZO5chCOosTOB6o6beFXLvMUnhtOeVrs?=
 =?us-ascii?Q?NB2YRLxd4YVPkz+lvyAhsjWIsAuGW1DjDDbtzcF+T7MGMOjMJCx4C5DbKSv7?=
 =?us-ascii?Q?ZMDX+Yu1Su9ujk9h2MLxAQjQ7qbdZY3nGo6yS/PO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2c4bfa-7175-401c-63bc-08de32312abb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:48.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0ressRrEYMUz4NHuc2sZH0XvSY+Sq8cw/ybcJQmGiS5VdLop14bFv2RFxi7vsxs9RKV1hX3uBKSN8W/NtNuhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

Add the FSP messaging infrastructure needed for Chain of Trust
communication on Hopper/Blackwell GPUs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 77 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs       | 48 ++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 9e796e82e556..0e8522b1171d 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -87,4 +87,81 @@ pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Resu
 
         Ok(())
     }
+
+    /// Poll FSP for incoming data.
+    ///
+    /// Returns the size of available data in bytes, or 0 if no data is available.
+    ///
+    /// The FSP message queue is not circular - pointers are reset to 0 after each
+    /// message exchange, so `tail >= head` is always true when data is present.
+    #[allow(dead_code)]
+    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
+        let head = regs::NV_PFSP_MSGQ_HEAD::read(bar).address();
+        let tail = regs::NV_PFSP_MSGQ_TAIL::read(bar).address();
+
+        if head == tail {
+            return 0;
+        }
+
+        // TAIL points at last DWORD written, so add 4 to get total size
+        (tail - head) + 4
+    }
+
+    /// Send message to FSP.
+    ///
+    /// Writes a message to FSP EMEM and updates queue pointers to notify FSP.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `packet` - Message data (must be 4-byte aligned in length)
+    ///
+    /// # Returns
+    /// `Ok(())` on success, `Err(EINVAL)` if packet is empty or not 4-byte aligned
+    #[allow(dead_code)]
+    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
+        if packet.is_empty() {
+            return Err(EINVAL);
+        }
+
+        // Write message to EMEM at offset 0 (validates 4-byte alignment)
+        self.write_emem(bar, 0, packet)?;
+
+        // Update queue pointers - TAIL points at last DWORD written
+        let tail_offset = u32::try_from(packet.len() - 4).map_err(|_| EINVAL)?;
+        regs::NV_PFSP_QUEUE_TAIL::default()
+            .set_address(tail_offset)
+            .write(bar);
+        regs::NV_PFSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+
+        Ok(())
+    }
+
+    /// Receive message from FSP.
+    ///
+    /// Reads a message from FSP EMEM and resets queue pointers.
+    ///
+    /// # Arguments
+    /// * `bar` - BAR0 memory mapping
+    /// * `buffer` - Buffer to receive message data
+    /// * `size` - Size of message to read in bytes (from `poll_msgq`)
+    ///
+    /// # Returns
+    /// `Ok(bytes_read)` on success, `Err(EINVAL)` if size is 0, exceeds buffer, or not aligned
+    #[allow(dead_code)]
+    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
+        if size == 0 || size > buffer.len() {
+            return Err(EINVAL);
+        }
+
+        // Read response from EMEM at offset 0 (validates 4-byte alignment)
+        self.read_emem(bar, 0, &mut buffer[..size])?;
+
+        // Reset message queue pointers after reading
+        regs::NV_PFSP_MSGQ_TAIL::default().set_address(0).write(bar);
+        regs::NV_PFSP_MSGQ_HEAD::default().set_address(0).write(bar);
+
+        Ok(size)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b642cee9611d..0d5c13f19073 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -401,6 +401,54 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     31:0    data as u32;        // EMEM data register
 });
 
+// FSP (Firmware System Processor) queue registers for Hopper/Blackwell Chain of Trust
+// These registers manage falcon EMEM communication queues
+register!(NV_PFSP_QUEUE_HEAD @ 0x008f2c00 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_QUEUE_TAIL @ 0x008f2c04 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_HEAD @ 0x008f2c80 {
+    31:0    address as u32;
+});
+
+register!(NV_PFSP_MSGQ_TAIL @ 0x008f2c84 {
+    31:0    address as u32;
+});
+
+// PTHERM registers
+
+// FSP secure boot completion status register used by FSP to signal boot completion.
+// This is the NV_THERM_I2CS_SCRATCH register.
+// Different architectures use different addresses:
+// - Hopper (GH100): 0x000200bc
+// - Blackwell (GB202): 0x00ad00bc
+#[allow(dead_code)]
+pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize> {
+    match arch {
+        Architecture::Hopper => Ok(0x000200bc),
+        Architecture::Blackwell => Ok(0x00ad00bc),
+        _ => Err(kernel::error::code::ENOTSUPP),
+    }
+}
+
+/// FSP writes this value to indicate successful boot completion.
+#[allow(dead_code)]
+pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
+
+// Helper function to read FSP boot completion status from the correct register
+#[allow(dead_code)]
+pub(crate) fn read_fsp_boot_complete_status(
+    bar: &crate::driver::Bar0,
+    arch: Architecture,
+) -> Result<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch)?;
+    Ok(bar.read32(addr))
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.52.0

