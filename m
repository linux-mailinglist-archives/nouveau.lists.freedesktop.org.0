Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29865CBA91A
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC90C10E436;
	Sat, 13 Dec 2025 12:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="RFF45l+t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 2226 seconds by postgrey-1.36 at gabe;
 Mon, 08 Dec 2025 07:55:49 UTC
Received: from outbound.st.icloud.com
 (p-east2-cluster2-host12-snip4-1.eps.apple.com [57.103.78.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C0710E3B2
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 07:55:49 +0000 (UTC)
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPS id
 0D2F818000B7; Mon,  8 Dec 2025 07:18:39 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=9iNLAHYTcpiRs27kPYZjhUj5+XI12UGo1cXS4M2+C54=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=RFF45l+t8/jSoaI9690R8E3RK30VwqcD5gwoZj5U/ugo+W1KVTBWYDcZ0dSwSzcEv+wCp1SWxCvbo3RDEnmaB8ztUtTokAPUEU1Hez5eBerpLeUGaGSbh9e1d+a8SDc8Hk72ilIK4tpHU7GlHY7XqezB/Xe/DFU9JJb90byWJhX7+RmVxzG4kxnymWIk5Jj4244BGkCM3sT6etGqQa33ijcc8D3lnGAGrC3nq1oGXS4+47egKlkaiDi70a5A2pK6HC9QkE/91U7uEIR3W+EkiHP7UfLbbgq7Qgkwmxo2nh8F1kLxeDF9J48eqTRsboKeQ0amu44eEh/yKszuuhTSEw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.42.251.67])
 by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPSA id
 4EBCF1800137; Mon,  8 Dec 2025 07:18:36 +0000 (UTC)
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com, joelagnelf@nvidia.com, acourbot@nvidia.com,
 airlied@redhat.com
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Brendan Shephard <bshephar@bne-home.net>
Subject: [PATCH v3] drm/nova: Align GEM memory allocation to system page size
Date: Mon,  8 Dec 2025 17:18:10 +1000
Message-ID: <20251208071810.653223-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8ILczVsIUc-CBsinRvAd2wcSF6ZcevSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA2MCBTYWx0ZWRfXzHmOh005OmLk
 MHneIeDb/OWks1r7R89sfqVnIUgK/eIRsASUyR0Zcp586z11waQ/oCQtFOPxvuyx4zcp2VGEKb0
 kfku3yEh/RdaXH+jIabAGTPXbfifXz8fF9X+IlkIqWzfyw+P5pngEcbBWqRP87N1vKmhz+G9/gj
 kMXeHD6dRXqT2wUsIiKsKvXSMB/4bb/jDt64e0IXJzVXji/5PsQLgDrlfLAZE9bF/pPYQDaCzD8
 6MURJX7aCkMpUgNI5757E90kXmZt/1O0LfHcievfb29zp+4J7IZhraod7ef6/BNbEQIUsDdl7FR
 kPortSS2prNzBKGv7qm
X-Authority-Info: v=2.4 cv=OstCCi/t c=1 sm=1 tr=0 ts=69367bd0 cx=c_apl:c_pps
 a=YrL12D//S6tul8v/L+6tKg==:117 a=YrL12D//S6tul8v/L+6tKg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=3aRIW_Bov1cqN9BWkr0A:9 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-GUID: 8ILczVsIUc-CBsinRvAd2wcSF6ZcevSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1030 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=670
 adultscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080060
X-JNJ: AAAAAAABbfuTk/bEJFvrCWF/8pTbjEOD9bL8Ie7T/yFSXOwOE+FGh6+nBXquzHtca6KiPfkZLUfFUh/8IyfDc6SEI/cvORo0V96umNVjanRphrlH6js9JWcsL5+sapTrPmM0FpuNEGF6YxO4SQzWToFSYFmHgJ2pHj4DUYur6di49wTodEx7hibEMlAsLygUvN0ZUEQeKW6fZ/bbe5fcpQGC36PGXEGc8gOmyjC0GW6BdfMZnURJPi3yy97fdmF2BpNop36qX8RgH8AfYk7IrdgH7GW9mqerU4Cylg/qoM/ipPqZ6Dj8f1eK2pTjlD8+ELNBmErIjCsijLZoRuZBidZUUpOw1gdVbrLY02JPMPtdY6V27pU8v5U3V5FHIK7TLSOQ+PdHTzHLK2gmOVC9qBgyz6W/dthnmSeHmrlAvs442nRZBayGNhaphhGca4wmkoCAIF38I7QLQL+js2km6qTrZEXix3f5JvSG2w06e68cxzSJNbqdtqQuDN5f1Pvt9M+5M7paZPrDLztgXHAwuwlS6M01SY5/C9Fibk7ItQ/QumQhvc1pkwzIuGyhBM6lhX1a38vV6udRgBQpea+iy3+Pn2gMdacCW/NrwF+GXGIQiPCADeBNgJBncHvFPzmUN0kjm8Fm5JzvWMPKJ7Q6WMISvpBUItZXstZfYLfNcvm8t5TyjbrRjQ73P1jiJAC+bTTdcYGI
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
allocation is page aligned. This is important on systems where the
default page size is not 4k. Such as 16k or 64k aarch64 systems.

This change uses the updated page_align() function which returns
Option<usize> for overflow safety. (See "rust: Return Option from
page_align and ensure no usize overflow").

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
Changes in v2:
- Updated to use the new page_align() Option<usize> return value
- Prerequisite patch:
  https://lore.kernel.org/rust-for-linux/20251204224006.353646-2-bshephar@bne-home.net/T/#u

Changes in v3:
- Add back missing semi-colon after ok_or().
- Reword commit message to be more concise.
- Link to v2: https://lore.kernel.org/rust-for-linux/20251208064405.573026-1-bshephar@bne-home.net/T/#u

 drivers/gpu/drm/nova/gem.rs | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2760ba4f3450..6d715044f1fa 100644
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
+        let aligned_size = page_align(size).ok_or(EINVAL)?;
 
         gem::Object::new(dev, aligned_size)
     }

base-commit: 37bb2e7217b01404e2abf9d90d8e5705a5603b52
-- 
2.52.0

