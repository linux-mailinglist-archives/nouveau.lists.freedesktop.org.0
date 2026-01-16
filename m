Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3CD388F5
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 22:51:56 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B51D210E0FB;
	Fri, 16 Jan 2026 21:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aThXzRAo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7AC3544CBA;
	Fri, 16 Jan 2026 21:43:19 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768599799;
 b=eWVIjyZRuCu4K5gYB//0H7f4VpjdrY0+BAn6h4bymTVhobA/EsAwtIDeLz4gbQbSGVBs7
 CGIZat7UsznFaX6i8B0Py8F6ZuE2Mdm0ZhEpxH1PWcWqvdKSJlXmJSX15JLQFgqI9IHGs/m
 tM5MKC+lxHh+/fQCqhbqnFiJPj/Yy+Z7xxPL2yZjkB3tgkmGwVS7xQ5hxFrUa+nuiqZp5M0
 MbMKGVxo9d828qLvriPuFQTkAmajM+aFoX2ysOo9upUIkJdH8byeOvMSppsi0WDQZpMyhGc
 3NrWcqQmoVVjgZR+z0JK+pcMajQ31pS22XIuY4/w2wiy4O87dTQTopByq8vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768599799; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ycSA/q3aSyYw4U+De+Eunt1ho3jZzsl52DbjZvciqtg=;
 b=bWJIXNiaFQIshYTuW0GqcfLTZbVMoSzTK0uS9RKUF+TfY7vSmWC4lccCRfR9BTsrnk4Ci
 lX4C6ehzyohiWj5wXwb1A7EXUk1JCU838yXIWxcJjc1R+o6Okf28M1kyPPhtMHuwS49PvDy
 Mnafj5rw+HOmLNrEefc/Dm2m7lgBfsaQwB/lL+TdD5zZ56UXfcf+wMdKcmFnv4pweAcJ1lt
 U8wIw9k8w3s9xfUYW9ZV03Bw3iuI1Zr+yuWEm9gHansx4AG/W2pj5A5YcziUIPnFF5SdJk0
 zZlQO8NeqdVp+WEno3fjZTgKST4/eqvF9XE7Mo4J8QSWuuALSBvMV+QeHHYw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B883740744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:43:16 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C19FF10E00E
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:51:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnA5P1fj+KIfrECU/12bllD5ff1iPIpfU7AdOJ1QORGCfkpeiVF4l/j2mmdHbViYVFcXtci6o15qVbm4VIXS1XboN1pULJjoJ0I86lrfjyg4llL8ShkLEVfKNjDC3afIUIDyz0OD3zcs506fUfSuL0dnCwUWfGIWh3/VWt/4yhkII8FrvFX6hzlRsyFwMUDlkKKPZdn5b1VZFHhyyHm6d5NkfOD5N0uQDv7cb8wOEDRwSuTY23ZyZteqvOLBPwETlLb6+6RgKD8wOq4nOFPTJniJyF8Kuve8uI0AJ5jNq/bXBbz+D8PtacPzaD0CJu7XlkitdVBb5hNYwVZ5lC2Rkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycSA/q3aSyYw4U+De+Eunt1ho3jZzsl52DbjZvciqtg=;
 b=CK3zxkJxjlks0Ak3tjPrE5fWVtm4GesQKxrhCS0Yf9Oe/vFviEY0p/wxjWT5VGWXCs6Zm86056tm86php8t+6A+NUnH7YmqvBVjwbbDqdJg6g71q5DRD6vRO8TETkQvVP/WnELUPuDGMPCAWCX1KpjDkm+56X9A29nv19xx8vBFygpzDDinlDB0W5zkmn3H1d6+gF+kB9jod0NFKLx99qUhwQGKIVUCRtJH+94F6Y1v1t/d2jYoS3Ltwhz/8e5b82jEc3Pvtb891oH6jUSf47WZMwZ2aahTX+jkMoW6apGq6JPe1nCjgB0vv8dAwVV9Zp7VHCSDAV22AeUShT8NWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycSA/q3aSyYw4U+De+Eunt1ho3jZzsl52DbjZvciqtg=;
 b=aThXzRAo7Cw2sulwgl62iuqoEO5NW3zY/FpZuFKuhVVwmrhcOfO3/WUSoi6gCrDRCBoO954TbCwRH56cj4XEoPqruBLwRG9H15rMx4yhktXAPyJnWQOMnvRebCi6+VussXfn6mazvzfmqKKXRPI07+P80PJvOKa7aMm9+x7isFizKnGMRckXQIYypZGurQdGpny+UU8llRWdX1W7IC8ZU6Bmz6MN8GKb42pI9zcwTQVbaJOyEEBCyLN3JMyphXpCjI8RxCVVOAOA/liVl6tfp72W+L9hRDeYM7XBReP7n79e8J/0AcdHcWShJIo8V1L2/bq4iNnwwlEqUDWrng5Bbg==
Received: from PH3PEPF000040A9.namprd05.prod.outlook.com (2603:10b6:518:1::4b)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 21:50:36 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2a01:111:f403:f90e::4) by PH3PEPF000040A9.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.5 via Frontend Transport; Fri,
 16 Jan 2026 21:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:15 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:14 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 3/8] rust: uaccess: add UserSliceWriter::write_buffer() for
 raw pointer writes
Date: Fri, 16 Jan 2026 15:49:54 -0600
Message-ID: <20260116214959.641032-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214959.641032-1-ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 413fc351-6d7d-4e7d-fc10-08de554947fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v55D3BOGoVD/RKW+ouUI/1TXFEOqZpJ/dTQPRBFAd8Jd3p5iMbSRsyXi7prI?=
 =?us-ascii?Q?myIUwhNSaAWP4o0RDAxhLBv6VgWa1FtqAYm9ov1QnxiDjKr88ltqtGJsKRKJ?=
 =?us-ascii?Q?5QZ9Amg9uN0wonRrSGT9UtwCxtwFdrMsdtF8dQR//1xZEKEsGgl9BX5oeLam?=
 =?us-ascii?Q?YqLESZ4T+UW7tFnz2riWMgjfleC+OdAkCqicx5SseJ6ne8HT22S/e02TszBi?=
 =?us-ascii?Q?ktYc5S7cTzv3LQyOvRlQKJ+5J8aPOiuoXBCjz4j0E6qrqoNcCCgQCXZeIASD?=
 =?us-ascii?Q?aB+HQjEBLIq29ANYO3svtheooMlQDeOjCFP23Uu1lAz7U9HM14a518NgvNf0?=
 =?us-ascii?Q?AV/DXfRZ+Ov1GClCb8lhCJUFWINZz/D27PWBFq68tnC9W++xB+4z6KKQXtgw?=
 =?us-ascii?Q?qGmtm4wouxMuASz78SOF3IEW+D/h/z1os8MXomlqBUUGN0fX+cdil5Ck8gzC?=
 =?us-ascii?Q?Jef0+iPcDKiEmBV+rp1VLvvDO67wk77e8Ix0PlgOXoRWked9pRH9jvjoli9p?=
 =?us-ascii?Q?shfUAMKqaFDCWLPKETN9gsl18apzy4qHOJ1WAAte5aUNyeFE3h+8SKq7xdwE?=
 =?us-ascii?Q?sBd5a4MvD4U3PlwKJKbMxToP9SiLlbKSE22YLtdyVpC/7CzqpPByQzAihZDi?=
 =?us-ascii?Q?aJxpLKDxu3Xm45ZuuHDNCIcdqhrBPnW6PxJZCKX1KJwoVtpyBdPMefhD5h9N?=
 =?us-ascii?Q?xhjBGOUwRUq14isAcm18jc1Mx27cl0hID03TIrMBwSvoIgtqpHMri8tRV4Hm?=
 =?us-ascii?Q?19MM8V0hZQb8j+HCXnqGYgeqfP1AbAM6tFC9dz8QvuoPFqFWh8QIUxlZAuz9?=
 =?us-ascii?Q?qdbJj0sOIeL/RbZ9CW2viuqE7Z180QdiVk7KtuzqvLyzAe0qVshJi/V+ihds?=
 =?us-ascii?Q?ZE1n50XIpqGS2lewAc18/PMBlvCwY4vC5gr7JgalgKW9n+Ynl2PjJt3ah+GU?=
 =?us-ascii?Q?gHh6UGggMHxbxYdFfGB18cUShdgT3IRInBvYMEy4eIQivGS/kvP2rJMcEEQj?=
 =?us-ascii?Q?uWVEtuZmsmldcC7ZbVSIxO/jlLfWicXqr4BT7eoVNxKF+s93g9vJzWkLTNkX?=
 =?us-ascii?Q?eK1B5BQ/SY9hyBsXTPo4+hoDyDC3uBDKa+KiYS0n1lL4uY/a7CuddVzC+INt?=
 =?us-ascii?Q?VlddU2kel8x9khik6F1LLF/IDmdCUliFoFyPBavoyBgGxlc1fzHsrEt54Ukj?=
 =?us-ascii?Q?klPZbFVYMMdWZBmQeJn5snOXFYbOiGPXBe2RYs57qLDkQorfqWqVLkE3Pwub?=
 =?us-ascii?Q?HeDX1UMicRmIDvTU440XdJnwMUvB03t6NAic8Nn4GKnPfjCg6jC9VsXv7REZ?=
 =?us-ascii?Q?Mm0s9erGkIb7Pzp5XIYXVKZB2mSihpAmeGYJay4YEtrWRk5MkH5l+jd4Iq0k?=
 =?us-ascii?Q?BGv+B7dpXWw1vtifIiefNmBve9vIDhTgkGE9H+5yKne64NrTtITdMB7eiRDL?=
 =?us-ascii?Q?QGTUwlUQL4CB3Y6rUWVSjU7qYH74SSdH0RS/apH79RIHgx2V2zPxKpILRwQI?=
 =?us-ascii?Q?8xhBKSB3YFoiyw9QQSMAOJZCZV2LSM2BZsJ5OXgG2Ngn08dJmXQsg6ZnjmlH?=
 =?us-ascii?Q?8L/m4gMSv/voDV8TxjGHkAm22BvIIifpmng8KX/vEOtkU2P27VLXMN/TvLYB?=
 =?us-ascii?Q?Ygwq8NQ20Z8ZOBir/xB6YdVagkxL8S9dYBEaRbjO/xaFO0gLqHR6oB3j5zy7?=
 =?us-ascii?Q?/4iLiA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:36.0239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 413fc351-6d7d-4e7d-fc10-08de554947fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910
Message-ID-Hash: AYPBFBW6NE74COUGZ6LX7QFJY6NBL2JB
X-Message-ID-Hash: AYPBFBW6NE74COUGZ6LX7QFJY6NBL2JB
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AYPBFBW6NE74COUGZ6LX7QFJY6NBL2JB/>
Archived-At: 
 <https://lore.freedesktop.org/20260116214959.641032-4-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a new method to UserSliceWriter that copies data from a raw kernel
pointer to userspace, without requiring a Rust slice reference.

The method takes:
  - data: raw pointer to the source buffer
  - len: total size of the source buffer (for bounds checking)
  - offset: byte offset into the source buffer to start copying from
  - count: number of bytes to copy

The method is marked unsafe because the caller must ensure the pointer
is valid for the specified length and that the memory is not mutated
during the call.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f989539a31b4..8bbb0084abb1 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
         Ok(())
     }
 
+    /// Writes raw data to this user pointer from a raw kernel pointer.
+    ///
+    /// This is similar to [`Self::write_slice`] but takes a raw pointer instead of a slice,
+    /// along with a total buffer length, an offset into the that buffer, and a count of bytes
+    /// to copy.
+    ///
+    /// Returns error if the offset+count exceeds the buffer size.
+    ///
+    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
+    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice
+    /// even if it returns an error.
+    ///
+    /// # Safety
+    ///
+    /// - `data` must point to a valid memory region of at least `len` bytes that remains allocated
+    ///   for the duration of this call.
+    ///
+    /// Note: Unlike [`Self::write_slice`], this method does not require exclusive access to the
+    /// source memory. The memory may be concurrently modified by other threads or hardware (e.g.,
+    /// DMA buffers). In such cases, the copied data may be inconsistent, but this does not cause
+    /// undefined behavior.
+    pub unsafe fn write_buffer(
+        &mut self,
+        data: *const u8,
+        len: usize,
+        offset: usize,
+        count: usize,
+    ) -> Result {
+        if offset.checked_add(count).ok_or(EOVERFLOW)? > len {
+            return Err(ERANGE);
+        }
+
+        // SAFETY: The caller guarantees that `data` is valid for reads of `len` bytes,
+        // so `data.add(offset_val)` is valid for reads of `count` bytes.
+        let src_ptr = unsafe { data.add(offset) };
+
+        // SAFETY: `src_ptr` is valid for reads of `to_write` bytes per the above.
+        let res = unsafe {
+            bindings::copy_to_user(self.ptr.as_mut_ptr(), src_ptr.cast::<c_void>(), count)
+        };
+        if res != 0 {
+            return Err(EFAULT);
+        }
+
+        self.ptr = self.ptr.wrapping_byte_add(count);
+        self.length -= count;
+
+        Ok(())
+    }
+
     /// Writes raw data to this user pointer from a kernel buffer partially.
     ///
     /// This is the same as [`Self::write_slice`] but considers the given `offset` into `data` and
-- 
2.52.0

