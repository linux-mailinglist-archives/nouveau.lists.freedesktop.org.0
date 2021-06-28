Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9391B3B6A3C
	for <lists+nouveau@lfdr.de>; Mon, 28 Jun 2021 23:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028496E591;
	Mon, 28 Jun 2021 21:21:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD3E6E598;
 Mon, 28 Jun 2021 21:21:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF52361D0B;
 Mon, 28 Jun 2021 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624915284;
 bh=cwwtqavFK7tU7JXzqiqwlEYlXq2bfP6ekDHIVIt8nIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EKkOWJ6dqG837vdtnS3J2t3k575q4aWV/DyPo0qug3DS8T8oU6kMyVuzXrc5IfzKx
 qzegfCLvGfFnS7dxRABc4r7FvIzt+CK4cKkocttmPnt33GOSf6AMUjvT0jkVJWNxIm
 Sdc7hW8MB7GTAHOnH+/qnJGT39uRRGiwNjjXAS+HCbaYXcZeAFlvY/Hw8k1V1J3j9E
 OcZb6xa/xKL38bdq1ksN3dv45RWfjeQMjdXEZ4W94W613wkwwgQAU8VTTIqs5S5LZW
 ViAuRc92WRjDpX4eqIjOv5S1qryRD3D0LicUVOKJzdygBQ7cH3Mp1ZWy+H8BGWvs9N
 mIgRu6thocDwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 28 Jun 2021 17:21:21 -0400
Message-Id: <20210628212121.43749-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628212121.43749-1-sashal@kernel.org>
References: <20210628212121.43749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 4.4 2/2] drm/nouveau: fix dma_address
 check for CPU/GPU sync
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgZDMzMDA5OTExNTU5N2JiYzIzOGQ2NzU4YTQ5MzBlNzJiNDllYTliYSBdCgpB
R1AgZm9yIGV4YW1wbGUgZG9lc24ndCBoYXZlIGEgZG1hX2FkZHJlc3MgYXJyYXkuCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkFja2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ckxpbms6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIxMDYxNDExMDUxNy4x
NjI0LTEtY2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JvLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5j
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCmluZGV4IDc4ZjUyMGQwNWRl
OS4uNThjMzEwOTMwYmYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC00
NTgsNyArNDU4LDcgQEAgbm91dmVhdV9ib19zeW5jX2Zvcl9kZXZpY2Uoc3RydWN0IG5vdXZlYXVf
Ym8gKm52Ym8pCiAJc3RydWN0IHR0bV9kbWFfdHQgKnR0bV9kbWEgPSAoc3RydWN0IHR0bV9kbWFf
dHQgKiludmJvLT5iby50dG07CiAJaW50IGk7CiAKLQlpZiAoIXR0bV9kbWEpCisJaWYgKCF0dG1f
ZG1hIHx8ICF0dG1fZG1hLT5kbWFfYWRkcmVzcykKIAkJcmV0dXJuOwogCiAJLyogRG9uJ3Qgd2Fz
dGUgdGltZSBsb29waW5nIGlmIHRoZSBvYmplY3QgaXMgY29oZXJlbnQgKi8KQEAgLTQ3OCw3ICs0
NzgsNyBAQCBub3V2ZWF1X2JvX3N5bmNfZm9yX2NwdShzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibykK
IAlzdHJ1Y3QgdHRtX2RtYV90dCAqdHRtX2RtYSA9IChzdHJ1Y3QgdHRtX2RtYV90dCAqKW52Ym8t
PmJvLnR0bTsKIAlpbnQgaTsKIAotCWlmICghdHRtX2RtYSkKKwlpZiAoIXR0bV9kbWEgfHwgIXR0
bV9kbWEtPmRtYV9hZGRyZXNzKQogCQlyZXR1cm47CiAKIAkvKiBEb24ndCB3YXN0ZSB0aW1lIGxv
b3BpbmcgaWYgdGhlIG9iamVjdCBpcyBjb2hlcmVudCAqLwotLSAKMi4zMC4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
