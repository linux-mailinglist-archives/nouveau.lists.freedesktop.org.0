Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDD31BEB
	for <lists+nouveau@lfdr.de>; Sat,  1 Jun 2019 15:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED69C89B3C;
	Sat,  1 Jun 2019 13:18:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3487E89B38;
 Sat,  1 Jun 2019 13:18:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52F71229EB;
 Sat,  1 Jun 2019 13:18:15 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:14:07 -0400
Message-Id: <20190601131653.24205-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395096;
 bh=3AxVhhfeTwP/UIeayUxSzq1J3kA3JwnFmCZfJ9onbEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LCw2KpJxmuTo/9IBnSEa1BC8GFJaweFK+D5gcnuD4hgCK+RL8u8IlN3yL5+uBqugu
 Z33xzqf22MWXjdg6b7ba2fDsP/ZqAEYj9MmntK8Dn9kqaJfozsp+GTk4eAwg1SBXOb
 y1MlnIEzq9EVvHY7cvP8sxWQSUPEKE0qP3oaFWc0=
Subject: [Nouveau] [PATCH AUTOSEL 5.1 031/186] drm/nouveau/kms/gf119-gp10x:
 push HeadSetControlOutputResource() mthd when encoders change
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
YTBiNjk0ZDBhZjIxYzk5OTNkMWEzOWE3NWZkODE0YmQ0OGJmN2ViNCBdCgpIVyBoYXMgZXJyb3Ig
Y2hlY2tzIGluIHBsYWNlIHdoaWNoIGNoZWNrIHRoYXQgcGl4ZWwgZGVwdGggaXMgZXhwbGljaXRs
eQpwcm92aWRlZCBvbiBEUCwgd2hpbGUgSERNSSBoYXMgYSAiZGVmYXVsdCIgc2V0dGluZyB0aGF0
IHdlIHVzZS4KCkluIG11bHRpLWRpc3BsYXkgY29uZmlndXJhdGlvbnMgd2l0aCBpZGVudGljYWwg
bW9kZWxpbmVzLCBidXQgZGlmZmVyZW50CnByb3RvY29scyAoSERNSSArIERQLCBpbiB0aGlzIGNh
c2UpLCBpdCB3YXMgcG9zc2libGUgZm9yIHRoZSBEUCBoZWFkIHRvCmdldCBzd2FwcGVkIHRvIHRo
ZSBoZWFkIHdoaWNoIHByZXZpb3VzbHkgZHJvdmUgdGhlIEhETUkgb3V0cHV0LCB3aXRob3V0CnVw
ZGF0aW5nIEhlYWRTZXRDb250cm9sT3V0cHV0UmVzb3VyY2UoKSwgdHJpZ2dlcmluZyB0aGUgZXJy
b3IgY2hlY2sgYW5kCmhhbmdpbmcgdGhlIGNvcmUgdXBkYXRlLgoKUmVwb3J0ZWQtYnk6IEx5dWRl
IFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2Vn
Z3NAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwu
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYwppbmRleCAyZTdhMGMzNDdkZGJlLi44ZWZiNzc4
YTNiMjA3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFk
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZC5jCkBAIC0zMDYs
NyArMzA2LDcgQEAgbnY1MF9oZWFkX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqc3RhdGUpCiAJCQlhc3loLT5zZXQub3IgPSBoZWFkLT5m
dW5jLT5vciAhPSBOVUxMOwogCQl9CiAKLQkJaWYgKGFzeWgtPnN0YXRlLm1vZGVfY2hhbmdlZCkK
KwkJaWYgKGFzeWgtPnN0YXRlLm1vZGVfY2hhbmdlZCB8fCBhc3loLT5zdGF0ZS5jb25uZWN0b3Jz
X2NoYW5nZWQpCiAJCQludjUwX2hlYWRfYXRvbWljX2NoZWNrX21vZGUoaGVhZCwgYXN5aCk7CiAK
IAkJaWYgKGFzeWgtPnN0YXRlLmNvbG9yX21nbXRfY2hhbmdlZCB8fAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxp
bmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
