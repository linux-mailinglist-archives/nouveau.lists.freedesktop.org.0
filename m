Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF8CBA8C7
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957EC10E403;
	Sat, 13 Dec 2025 12:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="biLsnQJM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 939 seconds by postgrey-1.36 at gabe;
 Fri, 21 Nov 2025 04:20:28 UTC
Received: from outbound.pv.icloud.com
 (p-west1-cluster1-host2-snip4-2.eps.apple.com [57.103.64.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B74D10E0FE
 for <nouveau@lists.freedesktop.org>; Fri, 21 Nov 2025 04:20:28 +0000 (UTC)
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-1a-100-percent-10 (Postfix) with ESMTPS id
 85A6E180012B; Fri, 21 Nov 2025 04:04:44 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=KgRL+95kZnPXAu5ZQLyBzJnkyzaBgtcdyqPhF199Ueg=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme;
 b=biLsnQJMxQlj6KV366WkJzEbDOhAfiKBEpVnveSvHaw6EPRI0RRVlqDI68YRm1zwESYaFhpA9xUtuK9qRzSGls95l+lr+5gxfFwpADpnkdRlokZIgKpMAa4TlhssGekCn7Dxl8VbnoBz7/9d4wunE31vc/ogQt3HbCsx9X7ur6F4elybDslRzs504VeWfUdBDO7PJ/vJr0Nm40otKw8Fcet6yfG+RkXrF+JI8ImHaKuLp1fQHwvlL2YGUw3XNjVpHFmUe3tzdLF8qKztlKLjrh4H4txJEGRezxjTH9YhqTpuGySFk9Y2KTipEM2adTI5iqfEr672D6CCFv/e+ppqeA==
mail-alias-created-date: 1746336505199
Received: from smtpclient.apple (unknown [17.56.9.36])
 by p00-icloudmta-asmtp-us-west-1a-100-percent-10 (Postfix) with ESMTPSA id
 582BC18000A3; Fri, 21 Nov 2025 04:04:41 +0000 (UTC)
From: bshephar@bne-home.net
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
Message-Id: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
Date: Fri, 21 Nov 2025 14:04:28 +1000
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 brendan.shephard@gmail.com
To: dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com,
 jhubbard@nvidia.com, airlied@gmail.com
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-Proofpoint-ORIG-GUID: 4-scDofsmCQXDjcgd3FrXkb231N6wEoi
X-Authority-Info: v=2.4 cv=G/IR0tk5 c=1 sm=1 tr=0 ts=691fe4dd cx=c_apl:c_pps
 a=azHRBMxVc17uSn+fyuI/eg==:117 a=azHRBMxVc17uSn+fyuI/eg==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=JppZAXPjAAAA:8 a=a2W8XFUYhzryu76BgXoA:9 a=CjuIK1q_8ugA:10
 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAyOSBTYWx0ZWRfXyAVcKxbE3roB
 BCGegLr/MNh2dVeNzup/3kdIsEtJMvVNdVp1a3t7qB8fNVd92DnNrgHx23NmgXF5k5BFMFqWb8T
 8iCFxWnx/1+2SzFH/m4xVx2jhGfSvzpjKiRHEBB9B7iMwkwOfj6H+eciHTMH8TCUG3wV2bWf6Q4
 Zjp7T/iMsLgUq1nmYjPxp1EM+EVYL/l8/ykQ4qHlqdJSxMLCaK05aJpPoUNOMNaaHIC161Mt5dJ
 hk7AaTdYDbduLXrzBR2PemeDjiORZ/ItCgq6+d/Q+SRqvbAuD8NxkiupIH3T3ko6dA1uEMXQML9
 eJk99Ln85SlA9EtygvA
X-Proofpoint-GUID: 4-scDofsmCQXDjcgd3FrXkb231N6wEoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 clxscore=1030
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210029
X-JNJ: AAAAAAABPhMs/i7Ev0WhhMd4VFc2iuEJ6Bdh5rQ21jVcuWg8trYiFxmDjZeC8GKd9YzPtljeI24MkoBH953xSKz5Hz3neHOdeNU34hC1Hh4pB5Z8erxfTNLsHDROC85mg4F5v1W9B/CXrDpMoKbsn6cCiIbC2dYEeCQCb3c+c4Tzp1t++fEs7gIqD5OxZaA11V9+krRFhFkSh0LrUs2Jk1dhC/2ers0lec/5YrK6jMDgSYAjn7rZJvWgnxkEm76QkIVEAGqZCYYF0VaNf8rIcWSL3Psb6alYAxPAwG7kovZCg9heWIFo+ofo8tEFsquCgIQ+CQfY0yAYEAV+K3vs5Cpm3iEen5xogN3YbEvPPUQdzD6OToAzHC0l3aZvb3ic7WmbAehml6b4OLfYbnFvFy9mNj3M5fSqUji/EPN4bZbTJEqdbnAVuVsD9qatiFlkA0CCUrn/7G0Ol1OsIkevmmxlVqbxIZ1y+teOHQTfkiznDvZtNwDmb0i6VFe3OhyjmRLdpjrxNmJy7RoFTdo1UnXrFVkl0HAOnZ6I3z5oxgu+GOn7d59xBfDyLf44MIiSK5oSNYbhlIr/raSgsGT7RfG3kaM4/6IocsUHMaByTZ8P/Ka60BMJSA9/vrsntAvgFl3ZlowyuvrYQHrbqYHn77wA0+VN4pL8JCmdEgBdJXK1ysjE2Q1X78x0kkN0phn9s/0q8KDuoCAItIq0HP/x7g==
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

Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
---
 drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2760ba4f3450..a07e922e25ef 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -3,6 +3,10 @@
 use kernel::{
     drm,
     drm::{gem, gem::BaseObject},
+    page::{
+        page_align,
+        PAGE_SIZE, //
+    },
     prelude::*,
     sync::aref::ARef,
 };
@@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl =
PinInit<Self, Error> {
 impl NovaObject {
     /// Create a new DRM GEM object.
     pub(crate) fn new(dev: &NovaDevice, size: usize) -> =
Result<ARef<gem::Object<Self>>> {
-        let aligned_size =3D size.next_multiple_of(1 << 12);
-
-        if size =3D=3D 0 || size > aligned_size {
+        // Check for 0 size or potential usize overflow before calling =
page_align
+        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
             return Err(EINVAL);
         }

+        let aligned_size =3D page_align(size);
+
         gem::Object::new(dev, aligned_size)
     }

--=
