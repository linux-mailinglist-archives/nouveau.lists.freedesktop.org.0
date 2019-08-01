Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E762F7E514
	for <lists+nouveau@lfdr.de>; Fri,  2 Aug 2019 00:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7872A6E81F;
	Thu,  1 Aug 2019 22:01:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF606E81F
 for <nouveau@lists.freedesktop.org>; Thu,  1 Aug 2019 22:01:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60F1930BE987;
 Thu,  1 Aug 2019 22:01:33 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1C7F600C6;
 Thu,  1 Aug 2019 22:01:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>
Date: Thu,  1 Aug 2019 18:01:17 -0400
Message-Id: <20190801220117.14952-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 01 Aug 2019 22:01:33 +0000 (UTC)
Subject: [Nouveau] [PATCH] PCI: Use pci_reset_bus() in
 quirk_reset_lenovo_thinkpad_50_nvgpu()
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
Cc: Aaron Plattner <aplattner@nvidia.com>, Maik Freudenberg <hhfeuer@gmx.de>,
 linux-kernel@vger.kernel.org, Daniel Drake <drake@endlessm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U2luY2UgcXVpcmtfbnZpZGlhX2hkYSgpIHdhcyBhZGRlZCB0aGVyZSdzIG5vdyB0d28gbnZpZGlh
IGRldmljZQpmdW5jdGlvbnMgb24gYW55IGxhcHRvcHMgd2l0aCBudmlkaWEgR1BVczogdGhlIEhE
QSBjb250cm9sbGVyLCBhbmQgdGhlCkdQVSBpdHNlbGYuIFVuZm9ydHVuYXRlbHkgdGhpcyBoYXMg
dGhlIHNpZGVhZmZlY3Qgb2YgYnJlYWtpbmcKcXVpcmtfcmVzZXRfbGVub3ZvX3RoaW5rcGFkXzUw
X252Z3B1KCkgc2luY2UgcGNpX3Jlc2V0X2Z1bmN0aW9uKCkgd2FzCnVzaW5nIHBjaV9wYXJlbnRf
YnVzX3Jlc2V0KCkgdG8gcmVzZXQgdGhlIEdQVSdzIHJlc3BlY3RpdmUgUENJIGJ1cywgYW5kCnBj
aV9wYXJlbnRfYnVzX3Jlc2V0KCkgZG9lcyBub3Qgd29yayBvbiBidXNzZXMgd2hpY2ggaGF2ZSBt
b3JlIHRoZW4gYQpzaW5nbGUgZGV2aWNlIGZ1bmN0aW9uIHByZXNlbnQuCgpTbywgZml4IHRoaXMg
Ynkgc2ltcGx5IGNhbGxpbmcgcGNpX3Jlc2V0X2J1cygpIGluc3RlYWQgd2hpY2ggcHJvcGVybHkK
cmVzZXRzIHRoZSBHUFUgYnVzIGFuZCBhbGwgZGV2aWNlIGZ1bmN0aW9ucyB1bmRlciBpdCwgaW5j
bHVkaW5nIGJvdGggdGhlCkdQVSBhbmQgdGhlIEhEQSBjb250cm9sbGVyLgoKRml4ZXM6IGI1MTZl
YTU4NmQ3MSAoIlBDSTogRW5hYmxlIE5WSURJQSBIREEgY29udHJvbGxlcnMiKQpDYzogTHVrYXMg
V3VubmVyIDxsdWthc0B3dW5uZXIuZGU+CkNjOiBEYW5pZWwgRHJha2UgPGRyYWtlQGVuZGxlc3Nt
LmNvbT4KQ2M6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+CkNjOiBBYXJvbiBQ
bGF0dG5lciA8YXBsYXR0bmVyQG52aWRpYS5jb20+CkNjOiBQZXRlciBXdSA8cGV0ZXJAbGVrZW5z
dGV5bi5ubD4KQ2M6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4KQ2M6IEthcm9s
IEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgpDYzogTWFpayBGcmV1ZGVuYmVyZyA8aGhmZXVl
ckBnbXguZGU+CkNjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9wY2kvcXVpcmtzLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3BjaS9xdWlya3MuYyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCmluZGV4
IDIwOGFhY2YzOTMyOS4uNDRjNGFlMWFiZDAwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9xdWly
a3MuYworKysgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwpAQCAtNTI1Niw3ICs1MjU2LDcgQEAgc3Rh
dGljIHZvaWQgcXVpcmtfcmVzZXRfbGVub3ZvX3RoaW5rcGFkX3A1MF9udmdwdShzdHJ1Y3QgcGNp
X2RldiAqcGRldikKIAkgKi8KIAlpZiAoaW9yZWFkMzIobWFwICsgMHgyMjQwYykgJiAweDIpIHsK
IAkJcGNpX2luZm8ocGRldiwgRldfQlVHICJHUFUgbGVmdCBpbml0aWFsaXplZCBieSBFRkksIHJl
c2V0dGluZ1xuIik7Ci0JCXJldCA9IHBjaV9yZXNldF9mdW5jdGlvbihwZGV2KTsKKwkJcmV0ID0g
cGNpX3Jlc2V0X2J1cyhwZGV2KTsKIAkJaWYgKHJldCA8IDApCiAJCQlwY2lfZXJyKHBkZXYsICJG
YWlsZWQgdG8gcmVzZXQgR1BVOiAlZFxuIiwgcmV0KTsKIAl9Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
