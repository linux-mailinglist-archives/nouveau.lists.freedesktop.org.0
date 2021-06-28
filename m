Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAE43B6A25
	for <lists+nouveau@lfdr.de>; Mon, 28 Jun 2021 23:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A526E575;
	Mon, 28 Jun 2021 21:20:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5DE6E575;
 Mon, 28 Jun 2021 21:20:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6076361D03;
 Mon, 28 Jun 2021 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624915257;
 bh=uvJEh0sxCUzclhUTIdb3WixNobiqcA+N5C6zNMxBtcs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GDghOrgAGxjexYn0aH4rZguWqJav7fNkQ03GXpFl4PhPY9A3gPcd7keLU3vKi6bQu
 CcXB1RpifGARIAMPQ580Auhk59LbATQMWeRrDgQ8hFYqeIanITckZuzJMhGHz3FjdQ
 VuFAet1Ll9OSEmHKGdz/6PCz2bqbnnKGY0szDJNPBYuGMZaNghqgQE41boAugdbs3m
 1g4TwhIpvrIq+iFkE4yS4YNauYrekzvkwqCFZkaDH05xKOYQnUAbOxTerVQu5o9vVw
 tyn8DW8GvkjVFE2cvb86XLkKyv0otRCNlBhRsbO5WwEKJnKL7qOGEktBn13S9NGrjZ
 DUIdBha/rie3w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 28 Jun 2021 17:20:50 -0400
Message-Id: <20210628212051.43265-4-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210628212051.43265-1-sashal@kernel.org>
References: <20210628212051.43265-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.12 4/5] drm/nouveau: fix dma_address
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
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCmluZGV4IGYyNzIwYTAwNjE5
OS4uMGE0N2EyYTU1NTNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC01
NDksNyArNTQ5LDcgQEAgbm91dmVhdV9ib19zeW5jX2Zvcl9kZXZpY2Uoc3RydWN0IG5vdXZlYXVf
Ym8gKm52Ym8pCiAJc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9IChzdHJ1Y3QgdHRtX3R0ICopbnZi
by0+Ym8udHRtOwogCWludCBpLCBqOwogCi0JaWYgKCF0dG1fZG1hKQorCWlmICghdHRtX2RtYSB8
fCAhdHRtX2RtYS0+ZG1hX2FkZHJlc3MpCiAJCXJldHVybjsKIAlpZiAoIXR0bV9kbWEtPnBhZ2Vz
KSB7CiAJCU5WX0RFQlVHKGRybSwgInR0bV9kbWEgMHglcDogcGFnZXMgTlVMTFxuIiwgdHRtX2Rt
YSk7CkBAIC01ODUsNyArNTg1LDcgQEAgbm91dmVhdV9ib19zeW5jX2Zvcl9jcHUoc3RydWN0IG5v
dXZlYXVfYm8gKm52Ym8pCiAJc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9IChzdHJ1Y3QgdHRtX3R0
ICopbnZiby0+Ym8udHRtOwogCWludCBpLCBqOwogCi0JaWYgKCF0dG1fZG1hKQorCWlmICghdHRt
X2RtYSB8fCAhdHRtX2RtYS0+ZG1hX2FkZHJlc3MpCiAJCXJldHVybjsKIAlpZiAoIXR0bV9kbWEt
PnBhZ2VzKSB7CiAJCU5WX0RFQlVHKGRybSwgInR0bV9kbWEgMHglcDogcGFnZXMgTlVMTFxuIiwg
dHRtX2RtYSk7Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQo=
