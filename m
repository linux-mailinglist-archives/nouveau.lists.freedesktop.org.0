Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F8C3D1C43
	for <lists+nouveau@lfdr.de>; Thu, 22 Jul 2021 05:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5D06EEAD;
	Thu, 22 Jul 2021 03:10:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jul 2021 01:22:44 UTC
Received: from qq.com (smtpbg556.qq.com [183.3.226.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D466E49B;
 Wed, 21 Jul 2021 01:22:44 +0000 (UTC)
X-QQ-mid: bizesmtp32t1626830092tvk0adgn
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 21 Jul 2021 09:14:50 +0800 (CST)
X-QQ-SSF: 00400000008000209000B00A0000000
X-QQ-FEAT: vVcPbn/qd608TjkLW+lP1vQk+x9mgReMe3lNJie/TUFqAXdwnWFDlL1b/rUzE
 v5UiGTjPaQiKMAhyLt6tDbkWRI3jILrtxhGS4KYE1hHy0+lsiT0/3mFMcrdT8naRg+05Nf+
 ORhRlqb6qcKKXP+yqZ3YTYybTNRyR1zLnZlX59oUkPJYI4AsPH5WZHKJqN4YP23qTpQPxt+
 xSevRrO7x6QU4nACNnnKjvMiBmzrQ/5UcK5Ak6r4wcIiEyYNlN5gcz1elzff/87drG3dkfv
 lrGuFmm6QXalaifafG1PsmQUfJXuInD0zubOBk/vqlpyF2chewaYFpCkCLDpfJu9LXk3Zlz
 FCnrHFa
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Date: Wed, 21 Jul 2021 09:14:48 +0800
Message-Id: <20210721011448.24333-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 22 Jul 2021 03:10:04 +0000
Subject: [Nouveau] [PATCH] drivers/gpu/drm/nouveau/dispnv50/headc57d.c: mark
 headc57d_olut() as static
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
Cc: nouveau@lists.freedesktop.org, zhaoxiao <zhaoxiao@uniontech.com>,
 bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cgpkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jOjE3MzoxOiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGhlYWRjNTdkX29sdXTigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQpoZWFkYzU3ZF9vbHV0KHN0cnVjdCBudjUwX2hlYWQgKmhlYWQsIHN0cnVjdCBudjUw
X2hlYWRfYXRvbSAqYXN5aCwgaW50IHNpemUpCgpBbmQgbm8gaGVhZGVyIGZpbGUgZGVmaW5lIGEg
cHJvdG90eXBlIGZvciB0aGlzIGZ1bmN0aW9uLCBzbyB3ZSBzaG91bGQKbWFyayBpdCBhcyBzdGF0
aWMuCgpTaWduZWQtb2ZmLWJ5OiB6aGFveGlhbyA8emhhb3hpYW9AdW5pb250ZWNoLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMKaW5kZXggZmQ1MTUyN2I1NmI4Li5iZGNm
ZDI0MGQ2MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hl
YWRjNTdkLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2Qu
YwpAQCAtMTY5LDcgKzE2OSw3IEBAIGhlYWRjNTdkX29sdXRfbG9hZChzdHJ1Y3QgZHJtX2NvbG9y
X2x1dCAqaW4sIGludCBzaXplLCB2b2lkIF9faW9tZW0gKm1lbSkKIAl3cml0ZXcocmVhZHcobWVt
IC0gNCksIG1lbSArIDQpOwogfQogCi1ib29sCitzdGF0aWMgYm9vbAogaGVhZGM1N2Rfb2x1dChz
dHJ1Y3QgbnY1MF9oZWFkICpoZWFkLCBzdHJ1Y3QgbnY1MF9oZWFkX2F0b20gKmFzeWgsIGludCBz
aXplKQogewogCWlmIChzaXplICE9IDAgJiYgc2l6ZSAhPSAyNTYgJiYgc2l6ZSAhPSAxMDI0KQot
LSAKMi4yMC4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
