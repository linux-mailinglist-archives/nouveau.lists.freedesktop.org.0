Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C69CBEA2D
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 16:28:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4710E5AC;
	Mon, 15 Dec 2025 15:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bne-home.net header.i=@bne-home.net header.b="hyl6IPV+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AAD344551D;
	Mon, 15 Dec 2025 15:20:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765812054;
 b=IWxu4Ba0TeoSpFOyhbpRD/aDFZCkyCxGhaF9b0xNY4AT1WykrKFUjoX3X/gOlbJ7PmALu
 HgYUwO6oGNLpLNpOjLMon+pYmi8knMsYEm5ZLvzczwNpUURXnCoy6bymVgNFV607o5fVfLG
 QsRcfbAlEugwl5YcwzqK2mwMDzgna0ukNkkY5IPo9SJMdKTFQlZ6pjF49Xforhea7EDsp+Y
 KNG7uRwOTwLuB1M68+UmFJX6t7mXnQFR0o9gdQlIW0zqPjB/ShWsflhmUAUsRZTNe5Zmz6u
 2h9Cefqe611KMj1sezy6QTMyFCTXSrJosxpbbb0r8xUumQY4ADIffGKp2MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765812054; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uwwg/9McXJj7Oq330haHnzUQq3y2iibMjqrcmLMasbY=;
 b=mDD0vp8/dRFfIXdsHjHqcsqOTnUguUHRmFhss2lj+b0co+SiuSDrPw2CGggKfECQ6aIJy
 6IxCtX/8r1jcQxijrBcwAstrVdABnlpfJi+wdW4xRrLZTz0m6JoDHqAIWKLs9f1IcwtzR+z
 zi0Xqaio6iXC/lqjgCb7S0idFUZD0s5Mj0zZCt8YuI5NbbOIhPrBZ7TpraVQHguq9dtQxQb
 uk+TnYG8yojzs8dwbiPJacntG5bIyFEcPkKLj1oJvtE8XDUh6aDtJSiB+lnEiWmtPjHLAlq
 JugeH3furdokCENj1ONUNKp9oXrlMWKgZaVzevu0zykBs/QPbevQPwxSL9PQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=bne-home.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=bne-home.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DD30345503
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 08:27:15 +0000 (UTC)
Received: from outbound.mr.icloud.com
 (p-west2-cluster6-host9-snip4-3.eps.apple.com [57.103.70.86])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08F1E10E39B
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 08:34:38 +0000 (UTC)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with ESMTPS id
 2546F1800105;
	Mon, 15 Dec 2025 08:34:36 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bne-home.net; s=sig1;
 bh=uwwg/9McXJj7Oq330haHnzUQq3y2iibMjqrcmLMasbY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=hyl6IPV+t+rQ2huSH+ZtvMSpipnjCX6WWU28mjTZUXfmtEcqabEjb0L9v3RzQOXbRNKgUujvL0HuAyvsiLU41/e/czG6Rm7jmTZTkstKs+OxAM3Gko6AVAZ57LAs5zYsLVyxBe+Ew4jd2MyGb8ZLpJIvGgZfBlK4BJfqZ7WmU7SoRtOhiDbn9YtPmGzfYbMS2HI8pkDEYOYipXHn3PEWh7fhmzys/jkLi9rpbdt9g8aVy7ytiY9tHQzRqyNIihEmKzc2WBI/7399r33LAfbHfMcWKH7SSToHNBxVJ16n4y1Ra4+xLxiaQt5cvF7lTtxNtRw4xrcBhQYvBFDvyHDkEw==
mail-alias-created-date: 1746336505199
Received: from fedora (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-1 (Postfix) with ESMTPSA id
 A807E1800110;
	Mon, 15 Dec 2025 08:34:34 +0000 (UTC)
From: Brendan Shephard <bshephar@bne-home.net>
To: aliceryhl@google.com,
	joelagnelf@nvidia.com,
	acourbot@nvidia.com,
	airlied@redhat.com
Subject: [PATCH v4] drm/nova: Align GEM memory allocation to system page size
Date: Mon, 15 Dec 2025 18:34:16 +1000
Message-ID: <20251215083416.266469-1-bshephar@bne-home.net>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WN6wJDRvtD-yUFu_zG_72qyJaUihvnuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX5MiCzsRH1NNY
 H+BoFLmlUPzz3zt/mQ87IzaJy4+VrPyi6Si2H89d2kLa1G+426HP3d9MT5bCnt1geJh5i3/Id3r
 JIsWOvLLiPOV+5aAgvOimLwcNplgWeSiY6VPRj3OPtCSxZj9AtV33bXWuFTGXHm9yKD24YG9KYF
 V2ja+7/G/pK6DSLw8HjjGNCwJyxWejSPtIQgBbeXmU2CKJE7kGGkAD7Fuh5meYsUqHz5JfTS4QZ
 C4rARJcPzFSJFjQrs7WZqLB5R7mlGBvB1Dw4FcLpX1DGyO0Nc0ibRSA/R4xxWYqPHrn9C9FHQwH
 cFL+5BsGGBHaXDpMU26
X-Authority-Info: v=2.4 cv=UNLQ3Sfy c=1 sm=1 tr=0 ts=693fc81e cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=JppZAXPjAAAA:8
 a=frRGVck-aN2bEsA2AVkA:9 a=mTXuAFqUwmiQvsSFmwXH:22
X-Proofpoint-ORIG-GUID: WN6wJDRvtD-yUFu_zG_72qyJaUihvnuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 clxscore=1030 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=671 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071
X-JNJ: 
 AAAAAAABNlK4TaBqZ4GA9dhroElKp3CeyRUf3F0p7DxwjpwOox9uqnbK5vklEhwfaVv7BlckK1pBc4bCO5HDFTbO3B8c8JJ311eyu7rTK3IfZW0BUOTZcFxnBjuflFEMqd5dCtQcvrTuCY35eE4JEzkkO2Po4huyNQ5ruDH7kE50HH9jcy9X/y2eGX2JmFhmwTnU/pOEYEu9nbV8sLlS5vpdRYIiVhtruHFP3ii6VP97rZCgIwb20UF1GO/7gvxtyi2ZogRNMj7SG/I/YUngCM5wSTwmXW2x1YjCTI2l9gWSaUTlwyFREX/KefNBKachQBiAFbs81F/gkPi72fV+TABRMp5TcWRavQICEJpfn9H5Plxy1EmGI3W5X92AOdtmbUXB76+RTrAZlT8IEKrp4pBFt0qn+81DfiRmJPZVco7sxB+EI78lKPZOVjAi2tRdZoyvpNdYhFQFGCMQ5lOc69Oam47Dto1rh026vxQMpBk2aTIFPM1WR2Q4iLsul5wO71zJtaZPWmalYRv97xy2+QbflQZOdkX/YmMJ8jOqtb3DIUMciaj56Tf+dsckdf/S4xiuQTNpuBB8A3OKzMpB7QZ8eoxMYjWry6pU0kb6y2b6vcIPOsFhFOeUiSrcJJBGBcuWgDxVAhSuC8nCGOQqS0N5n7pG+clLearXS3xqiuQZXNinlf8Z+Wvi7hy/Dw==
X-MailFrom: bshephar@bne-home.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: IRNUX3EJAQBU566XAMADHQU5BURTNWWH
X-Message-ID-Hash: IRNUX3EJAQBU566XAMADHQU5BURTNWWH
X-Mailman-Approved-At: Mon, 15 Dec 2025 15:20:52 +0000
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 Brendan Shephard <bshephar@bne-home.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IRNUX3EJAQBU566XAMADHQU5BURTNWWH/>
Archived-At: 
 <https://lore.freedesktop.org/20251215083416.266469-1-bshephar@bne-home.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

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
- Link to v1: https://lore.kernel.org/rust-for-linux/98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net/

Changes in v3:
- Add back missing semi-colon after ok_or().
- Reword commit message to be more concise.
- Link to v2: https://lore.kernel.org/rust-for-linux/20251208064405.573026-1-bshephar@bne-home.net/T/#u

Changes in v4:
- Add back the size == 0 check;
- Rebase on latest drm-next branch
- Link to v3: https://lore.kernel.org/rust-for-linux/20251208071810.653223-1-bshephar@bne-home.net/T/#u

 drivers/gpu/drm/nova/gem.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2760ba4f3450..3a3a41e8d4bc 100644
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
@@ -27,11 +28,10 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
 impl NovaObject {
     /// Create a new DRM GEM object.
     pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
-        let aligned_size = size.next_multiple_of(1 << 12);
-
-        if size == 0 || size > aligned_size {
+        if size == 0 {
             return Err(EINVAL);
         }
+        let aligned_size = page_align(size).ok_or(EINVAL)?;
 
         gem::Object::new(dev, aligned_size)
     }

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.51.1

