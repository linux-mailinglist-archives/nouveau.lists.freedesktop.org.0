Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE4BCCFA
	for <lists+nouveau@lfdr.de>; Tue, 24 Sep 2019 18:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844856EA78;
	Tue, 24 Sep 2019 16:44:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C146EA79;
 Tue, 24 Sep 2019 16:44:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C06C20872;
 Tue, 24 Sep 2019 16:44:17 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 24 Sep 2019 12:41:11 -0400
Message-Id: <20190924164144.25591-55-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343458;
 bh=xnovLF+3uh2WwoA52FYSiy8zjjoMSiF+mmojNkCbgjQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vbM+UvpiqtXQiei5uXyVCRdqpc1uG2ZQEYhQ3xaOP4nvGGSkLlSI/y1HHhXp1ZODV
 sBOLT9wsqGildo7+m0QQUgTwkN7asRBKTbdqlSi6NpdJYvBeDg06f6lwyeXRPJVCXI
 fWGXkdsEdVJXJXaLEFgBlJzz7g/WDCtoP9Xe4LjA=
Subject: [Nouveau] [PATCH AUTOSEL 5.3 55/87] drm/nouveau/volt: Fix for some
 cards having 0 maximum voltage
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
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogTWFyayBNZW56eW5za2kgPG1tZW56eW5zQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNv
bW1pdCBhMWFmMmFmYmQyNDQwODk1NjA3OTRjMjYwYjJkNDMyNmE4NmUzOWI2IF0KClNvbWUsIG1v
c3RseSBGZXJtaSwgdmJpb3NlcyBhcHBlYXIgdG8gaGF2ZSB6ZXJvIG1heCB2b2x0YWdlLiBUaGF0
IGNhdXNlcyBOb3V2ZWF1IHRvIG5vdCBwYXJzZSB2b2x0YWdlIGVudHJpZXMsIHRodXMgdXNlcnMg
bm90IGJlaW5nIGFibGUgdG8gc2V0IGhpZ2hlciBjbG9ja3MuCgpXaGVuIGNoYW5naW5nIHRoaXMg
dmFsdWUgTnZpZGlhIGRyaXZlciBzdGlsbCBhcHBlYXJlZCB0byBpZ25vcmUgaXQsIGFuZCBJIHdh
c24ndCBhYmxlIHRvIGZpbmQgb3V0IHdoeSwgdGh1cyB0aGUgY29kZSBpcyBpZ25vcmluZyB0aGUg
dmFsdWUgaWYgaXQgaXMgemVyby4KCkNDOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXJrIE1lbnp5bnNraSA8bW1l
bnp5bnNAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRo
YXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+ClNp
Z25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL3ZvbHQuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9iaW9zL3ZvbHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2Jpb3Mvdm9sdC5jCmluZGV4IDcxNDNlYTQ2MTFhYTMuLjMzYTlmYjVhYzU1ODUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3Mvdm9s
dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3Mvdm9sdC5j
CkBAIC05Niw2ICs5Niw4IEBAIG52Ymlvc192b2x0X3BhcnNlKHN0cnVjdCBudmttX2Jpb3MgKmJp
b3MsIHU4ICp2ZXIsIHU4ICpoZHIsIHU4ICpjbnQsIHU4ICpsZW4sCiAJCWluZm8tPm1pbiAgICAg
PSBtaW4oaW5mby0+YmFzZSwKIAkJCQkgICAgaW5mby0+YmFzZSArIGluZm8tPnN0ZXAgKiBpbmZv
LT52aWRtYXNrKTsKIAkJaW5mby0+bWF4ICAgICA9IG52Ymlvc19yZDMyKGJpb3MsIHZvbHQgKyAw
eDBlKTsKKwkJaWYgKCFpbmZvLT5tYXgpCisJCQlpbmZvLT5tYXggPSBtYXgoaW5mby0+YmFzZSwg
aW5mby0+YmFzZSArIGluZm8tPnN0ZXAgKiBpbmZvLT52aWRtYXNrKTsKIAkJYnJlYWs7CiAJY2Fz
ZSAweDUwOgogCQlpbmZvLT5taW4gICAgID0gbnZiaW9zX3JkMzIoYmlvcywgdm9sdCArIDB4MGEp
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
