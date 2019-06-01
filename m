Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 938AA31BE9
	for <lists+nouveau@lfdr.de>; Sat,  1 Jun 2019 15:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D796989A8B;
	Sat,  1 Jun 2019 13:18:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A499B89A8B;
 Sat,  1 Jun 2019 13:18:10 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2E782725E;
 Sat,  1 Jun 2019 13:18:09 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:14:04 -0400
Message-Id: <20190601131653.24205-28-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395090;
 bh=Au6V8N1tGmfWzLGZV8cy65ZWNYgqrGSrVTj21xNZJog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nLkwqQhEVwNLBvCgI8Yh1ge746zCYGemMBUEJLp776NBG/l0WN5eNhUJ8RlQyrdYb
 GsBtoUMrrdYi9XCOCs/vC3goVzxly8/Kx+CvRcXesKphdNQre+uNTA6uPcPcNlIuM+
 PO+7vgcT6WfYY97AdzpF1DCZI8uXszt0oiQKWOG0=
Subject: [Nouveau] [PATCH AUTOSEL 5.1 028/186] drm/nouveau/disp/dp: respect
 sink limits when selecting failsafe link configuration
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
MTNkMDNlOWRhZjcwZGFiMDMyYzAzZGMxNzJlNzViYjk4YWQ4OTljNCBdCgpXaGVyZSBwb3NzaWJs
ZSwgd2Ugd2FudCB0aGUgZmFpbHNhZmUgbGluayBjb25maWd1cmF0aW9uIChvbmUgd2hpY2ggd29u
J3QKaGFuZyB0aGUgT1IgZHVyaW5nIG1vZGVzZXQgYmVjYXVzZSBvZiBub3QgZW5vdWdoIGJhbmR3
aWR0aCBmb3IgdGhlIG1vZGUpCnRvIGFsc28gYmUgc3VwcG9ydGVkIGJ5IHRoZSBzaW5rLgoKVGhp
cyBwcmV2ZW50cyAibGluayByYXRlIHVuc3VwcG9ydGVkIGJ5IHNpbmsiIG1lc3NhZ2VzIHdoZW4g
bGluayB0cmFpbmluZwpmYWlscy4KClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvZHAuYyB8IDEx
ICsrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rp
c3AvZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vZW5naW5lL2Rpc3AvZHAuYwpp
bmRleCA1ZjMwMWU2MzI1OTliLi44MThkMjFiZDI4ZDMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9udmttL2VuZ2luZS9kaXNwL2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbnZrbS9lbmdpbmUvZGlzcC9kcC5jCkBAIC0zNjUsOCArMzY1LDE1IEBAIG52a21f
ZHBfdHJhaW4oc3RydWN0IG52a21fZHAgKmRwLCB1MzIgZGF0YUtCcHMpCiAJICogYW5kIGl0J3Mg
YmV0dGVyIHRvIGhhdmUgYSBmYWlsZWQgbW9kZXNldCB0aGFuIHRoYXQuCiAJICovCiAJZm9yIChj
ZmcgPSBudmttX2RwX3JhdGVzOyBjZmctPnJhdGU7IGNmZysrKSB7Ci0JCWlmIChjZmctPm5yIDw9
IG91dHBfbnIgJiYgY2ZnLT5uciA8PSBvdXRwX2J3KQotCQkJZmFpbHNhZmUgPSBjZmc7CisJCWlm
IChjZmctPm5yIDw9IG91dHBfbnIgJiYgY2ZnLT5uciA8PSBvdXRwX2J3KSB7CisJCQkvKiBUcnkg
dG8gcmVzcGVjdCBzaW5rIGxpbWl0cyB0b28gd2hlbiBzZWxlY3RpbmcKKwkJCSAqIGxvd2VzdCBs
aW5rIGNvbmZpZ3VyYXRpb24uCisJCQkgKi8KKwkJCWlmICghZmFpbHNhZmUgfHwKKwkJCSAgICAo
Y2ZnLT5uciA8PSBzaW5rX25yICYmIGNmZy0+YncgPD0gc2lua19idykpCisJCQkJZmFpbHNhZmUg
PSBjZmc7CisJCX0KKwogCQlpZiAoZmFpbHNhZmUgJiYgY2ZnWzFdLnJhdGUgPCBkYXRhS0JwcykK
IAkJCWJyZWFrOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1
