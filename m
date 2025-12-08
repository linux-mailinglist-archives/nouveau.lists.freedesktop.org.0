Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6685CBA8DC
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E069010E40A;
	Sat, 13 Dec 2025 12:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="lCGuFgni";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Mon, 08 Dec 2025 07:04:19 UTC
Received: from outbound.mr.icloud.com
 (p-west2-cluster4-host10-snip4-8.eps.apple.com [57.103.69.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4209810E0E4
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 07:04:19 +0000 (UTC)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPS id
 D00D71800191; Mon,  8 Dec 2025 06:44:27 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=zkYFu2V1ACrqhCXdzvEsiMc0nIxkYl+fHDMyoPJps5M=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=lCGuFgni2nYzmevzu3Bt7bv8I+89Zj673Gs3YkeT0jgDflMZaEoqFRddTCtps89jgWPGZg8U2hY1CUUgCQjV5B0jV574ZlqknFN8ZfdyIOcYVwTCrfuaxiwCJsyDHc53VSH/8DQRYQjo9xapfPowFAgYUgqD8aKKVfmiCaZmgUC0wpBZzrZJf9DW0beO+W0ixbFzT1VhzoGzzL7aCVuZabpjO7edClpBVbnQiHhivDCcn8bY6yo+shjlKF7AxdW7vi95HjB3LhoMNqBnbNj0nOdGf3VqibNQmox268qyfgxZ+YLzNTxCoBTY7MxAnQHJ3duk5JRu9OKy2Xvn7yQWzg==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
 by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPSA id
 A9BD018000B3; Mon,  8 Dec 2025 06:44:25 +0000 (UTC)
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com, joelagnelf@nvidia.com, acourbot@nvidia.com,
 airlied@redhat.com
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Brendan Shephard <bshephar@bne-home.net>
Subject: [PATCH v2] drm: nova: Align GEM memory allocation to system page size
Date: Mon,  8 Dec 2025 16:44:05 +1000
Message-ID: <20251208064405.573026-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uKk1vmXC8Np_kz_mwKuC94ybQZH3fT03
X-Authority-Info: v=2.4 cv=MLhtWcZl c=1 sm=1 tr=0 ts=693673cc cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=a2W8XFUYhzryu76BgXoA:9 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA1NiBTYWx0ZWRfX/WgfiVLktDgc
 Al9tJofbK2kG2HjR3x+aiS46gw9aP6AYEig/TQ8iCQk7xhlLnKuxLUaqKw2bNVYpQ9lF7YTDlWq
 uE520Uh2OWK9moDo5/x88+f/N8FCH+T94BOajtyGSINyVO/SrvNKXXveEbnViEXWsEDTIn1oagt
 g56KkKd0XG/veetcX7psZ6BFJeudJMYRfIYLqXJfAXNaJ0LQSo31naeTW6RgoNO4ZDhOr8UBIMP
 +DJKYfG+W1a3L6EtcfE8eRxSUzDeF9JnsVFzWRHqDFrVTOPUJRAgLQpRHFnU2tBK/JFxW2WVShx
 lT4cn4Y+hiHDzjeUBG/
X-Proofpoint-GUID: uKk1vmXC8Np_kz_mwKuC94ybQZH3fT03
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=717 mlxscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1030 phishscore=0 adultscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080056
X-JNJ: AAAAAAABW7y03TPmhTExObnEYfir4eGrX6PStdqBl/8zgZY4eSZBv5kyBGnJL92XRYkHgRX3YQ06BfWeQgSbYhGcNVGD7othFDjbR00f35IC9FgNz3XxIkADCMhRLpHMr9JiznnyqBLgqOJ+0tGpQdBq96nzkLZ9OV95uloJV0PjE2QxepPnyaNn9+IEJsXRl2OsScagnRXZoKDCZRX2fYCUm07pkaJ4d5+lwWUxlFu3u45fKmOxMzPR914T361DMCzpYl+GK1NsP2SDKuzTGy3XCmw6eXE+9BXW1kPj5gpQ4RsgVro8YqkE/KlDGYDI2mr9SaFt2T4uEpJJiA9UgA3HebfpN1R6ViupFHDM0XLdm7iIqI3IsIQDwceOrCnqNvBqU+xCjANXAlbXYo8xFxMWwsaRk5adrYv+3QxpUIBRb/v6Gb9VHY23P1H4cte8AI8buGo7Id70TdcDzs/2VyacrGzNVvvfkxnFNykAraUDcS/P4yZ2NH4Vb/AeN8tgrfOHyBFvcS1QdQMZX0JtEWLIkYzKsH5hXPm9cmgv//PkTCZ8TOh50OIZlhEprrkrUCB3vtR5+1WY6p2LeYZGZ66MPgH/HSVhfZQYNcux+E0/g0RFl0v1+pEj9W2UUynQgzZeUWO3MvosD8jQWrOShodI5z3FDsof2n2o5EQbdOdEgMlFol5jU954I2J257RuCAoSQqz5NX3GNEdbvAPUxS2GEA==
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:17:03 +0000
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

Use page::page_align for GEM object memory allocation to ensure the
allocation is page aligned. This ensures that the allocation is page
aligned with the system in cases where 4096 is not the default.
For example on 16k or 64k aarch64 systems this allocation should be
aligned accordingly.

This change uses the updated page_align() function from commit:
"rust: Return Option from page_align and ensure no usize overflow"
Which returns an Option<usize> for overflow safety.

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
Changes in v2:
- Updated to use the new page_align() Option<usize> return value from:
  Commit: "rust: Return Option from page_align and ensure no usize overflow"
  https://lore.kernel.org/rust-for-linux/20251204224006.353646-2-bshephar@bne-home.net/T/#u

 drivers/gpu/drm/nova/gem.rs | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2760ba4f3450..41439f3b9361 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -3,6 +3,7 @@
 use kernel::{
     drm,
     drm::{gem, gem::BaseObject},
+    page::page_align,
     prelude::*,
     sync::aref::ARef,
 };
@@ -27,11 +28,7 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
 impl NovaObject {
     /// Create a new DRM GEM object.
     pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
-        let aligned_size = size.next_multiple_of(1 << 12);
-
-        if size == 0 || size > aligned_size {
-            return Err(EINVAL);
-        }
+        let aligned_size = page_align(size).ok_or(EINVAL)?
 
         gem::Object::new(dev, aligned_size)
     }

base-commit: 37bb2e7217b01404e2abf9d90d8e5705a5603b52
-- 
2.52.0

