Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428F51A9D55
	for <lists+nouveau@lfdr.de>; Wed, 15 Apr 2020 13:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22AF6E9A2;
	Wed, 15 Apr 2020 11:45:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601426E9A1;
 Wed, 15 Apr 2020 11:45:48 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EC6D20775;
 Wed, 15 Apr 2020 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951148;
 bh=+J1rnpev1mWG2DjbDUlUXV/sV3CYW4t3iOt9gosTfsA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbMNizmO/SrHqDVT3DGUhz8T1XvrHbaZIi1UuWIgmcfQ1Kx6wAXHEuJQv31f9JYOP
 x/Va64ODSJ+i5/NFQsF3PffY8mgj8KFUT3fe8s/jQpzLvvvaK2zRzZq1R5c1EdFNDw
 vWEHsgqPHlIeMAQisX2jHqPFXBhUsU6ZmGVzYvhI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:44:12 -0400
Message-Id: <20200415114442.14166-55-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114442.14166-1-sashal@kernel.org>
References: <20200415114442.14166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Nouveau] [PATCH AUTOSEL 5.4 55/84] drm/nouveau: workaround runpm
 fail by disabling PCI power management on certain intel bridges
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
Cc: Sasha Levin <sashal@kernel.org>, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA0MzRmZGI1MTUxM2JmMzA1N2FjMTQ0ZDE1MmU2ZjJmMmI1MDllODU3IF0KCkZpeGVzIHRoZSBp
bmZhbW91cyAncnVudGltZSBQTScgYnVnIG1hbnkgdXNlcnMgYXJlIGZhY2luZyBvbiBMYXB0b3Bz
IHdpdGgKTnZpZGlhIFBhc2NhbCBHUFVzIGJ5IHNraXBwaW5nIHNhaWQgUENJIHBvd2VyIHN0YXRl
IGNoYW5nZXMgb24gdGhlIEdQVS4KCkRlcGVuZGluZyBvbiB0aGUgdXNlZCBrZXJuZWwgdGhlcmUg
bWlnaHQgYmUgbWVzc2FnZXMgbGlrZSB0aG9zZSBpbiBkZW1zZzoKCiJub3V2ZWF1IDAwMDA6MDE6
MDAuMDogUmVmdXNlZCB0byBjaGFuZ2UgcG93ZXIgc3RhdGUsIGN1cnJlbnRseSBpbiBEMyIKIm5v
dXZlYXUgMDAwMDowMTowMC4wOiBjYW4ndCBjaGFuZ2UgcG93ZXIgc3RhdGUgZnJvbSBEM2NvbGQg
dG8gRDAgKGNvbmZpZwpzcGFjZSBpbmFjY2Vzc2libGUpIgpmb2xsb3dlZCBieSBiYWNrdHJhY2Vz
IG9mIGtlcm5lbCBjcmFzaGVzIG9yIHRpbWVvdXRzIHdpdGhpbiBub3V2ZWF1LgoKSXQncyBzdGls
bCB1bmtvd24gd2h5IHRoaXMgaXNzdWUgZXhpc3RzLCBidXQgdGhpcyBpcyBhIHJlbGlhYmxlIHdv
cmthcm91bmQKYW5kIHNvbHZlcyBhIHZlcnkgYW5ub3lpbmcgaXNzdWUgZm9yIHVzZXIgaGF2aW5n
IHRvIGNob29zZSBiZXR3ZWVuIGEKY3Jhc2hpbmcga2VybmVsIG9yIGhpZ2hlciBwb3dlciBjb25z
dW1wdGlvbiBvZiB0aGVpciBMYXB0b3BzLgoKU2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxr
aGVyYnN0QHJlZGhhdC5jb20+CkNjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29t
PgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KQ2M6IFJhZmFlbCBKLiBXeXNvY2tp
IDxyandAcmp3eXNvY2tpLm5ldD4KQ2M6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJn
QGludGVsLmNvbT4KQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LXBtQHZn
ZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQnVnemlsbGE6IGh0dHBzOi8vYnVnemlsbGEua2Vy
bmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA1NjIzClNpZ25lZC1vZmYtYnk6IEJlbiBTa2VnZ3Mg
PGJza2VnZ3NAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBr
ZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMgfCA2
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZHJ2LmggfCAgMiArCiAyIGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RybS5jIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYwppbmRleCAyY2Q4Mzg0OTYwMGYzLi5iMWJl
ZWQ0MGU3NDZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Ry
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmMKQEAgLTYxOCw2
ICs2MTgsNjQgQEAgbm91dmVhdV9kcm1fZGV2aWNlX2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRl
dikKIAlrZnJlZShkcm0pOwogfQogCisvKgorICogT24gc29tZSBJbnRlbCBQQ0llIGJyaWRnZSBj
b250cm9sbGVycyBkb2luZyBhCisgKiBEMCAtPiBEM2hvdCAtPiBEM2NvbGQgLT4gRDAgc2VxdWVu
Y2UgY2F1c2VzIE52aWRpYSBHUFVzIHRvIG5vdCByZWFwcGVhci4KKyAqIFNraXBwaW5nIHRoZSBp
bnRlcm1lZGlhdGUgRDNob3Qgc3RlcCBzZWVtcyB0byBtYWtlIGl0IHdvcmsgYWdhaW4uIFRoaXMg
aXMKKyAqIHByb2JhYmx5IGNhdXNlZCBieSBub3QgbWVldGluZyB0aGUgZXhwZWN0YXRpb24gdGhl
IGludm9sdmVkIEFNTCBjb2RlIGhhcworICogd2hlbiB0aGUgR1BVIGlzIHB1dCBpbnRvIEQzaG90
IHN0YXRlIGJlZm9yZSBpbnZva2luZyBpdC4KKyAqCisgKiBUaGlzIGxlYWRzIHRvIHZhcmlvdXMg
bWFuaWZlc3RhdGlvbnMgb2YgdGhpcyBpc3N1ZToKKyAqICAtIEFNTCBjb2RlIGV4ZWN1dGlvbiB0
byBwb3dlciBvbiB0aGUgR1BVIGhpdHMgYW4gaW5maW5pdGUgbG9vcCAoYXMgdGhlCisgKiAgICBj
b2RlIHdhaXRzIG9uIGRldmljZSBtZW1vcnkgdG8gY2hhbmdlKS4KKyAqICAtIGtlcm5lbCBjcmFz
aGVzLCBhcyBhbGwgUENJIHJlYWRzIHJldHVybiAtMSwgd2hpY2ggbW9zdCBjb2RlIGlzbid0IGFi
bGUKKyAqICAgIHRvIGhhbmRsZSB3ZWxsIGVub3VnaC4KKyAqCisgKiBJbiBhbGwgY2FzZXMgZG1l
c2cgd2lsbCBjb250YWluIGF0IGxlYXN0IG9uZSBsaW5lIGxpa2UgdGhpczoKKyAqICdub3V2ZWF1
IDAwMDA6MDE6MDAuMDogUmVmdXNlZCB0byBjaGFuZ2UgcG93ZXIgc3RhdGUsIGN1cnJlbnRseSBp
biBEMycKKyAqIGZvbGxvd2VkIGJ5IGEgbG90IG9mIG5vdXZlYXUgdGltZW91dHMuCisgKgorICog
SW4gdGhlIFxfU0IuUENJMC5QRUcwLlBHMDAuX09GRiBjb2RlIGRlZXBlciBkb3duIHdyaXRlcyBi
aXQgMHg4MCB0byB0aGUgbm90CisgKiBkb2N1bWVudGVkIFBDSSBjb25maWcgc3BhY2UgcmVnaXN0
ZXIgMHgyNDggb2YgdGhlIEludGVsIFBDSWUgYnJpZGdlCisgKiBjb250cm9sbGVyICgweDE5MDEp
IGluIG9yZGVyIHRvIGNoYW5nZSB0aGUgc3RhdGUgb2YgdGhlIFBDSWUgbGluayBiZXR3ZWVuCisg
KiB0aGUgUENJZSBwb3J0IGFuZCB0aGUgR1BVLiBUaGVyZSBhcmUgYWx0ZXJuYXRpdmUgY29kZSBw
YXRocyB1c2luZyBvdGhlcgorICogcmVnaXN0ZXJzLCB3aGljaCBzZWVtIHRvIHdvcmsgZmluZSAo
ZXhlY3V0ZWQgcHJlIFdpbmRvd3MgOCk6CisgKiAgLSAweGJjIGJpdCAweDIwIChwdWJsaWNseSBh
dmFpbGFibGUgZG9jdW1lbnRhdGlvbiBjbGFpbXMgJ3Jlc2VydmVkJykKKyAqICAtIDB4YjAgYml0
IDB4MTAgKGxpbmsgZGlzYWJsZSkKKyAqIENoYW5naW5nIHRoZSBjb25kaXRpb25zIGluc2lkZSB0
aGUgZmlybXdhcmUgYnkgcG9raW5nIGludG8gdGhlIHJlbGV2YW50CisgKiBhZGRyZXNzZXMgZG9l
cyByZXNvbHZlIHRoZSBpc3N1ZSwgYnV0IGl0IHNlZW1lZCB0byBiZSBBQ1BJIHByaXZhdGUgbWVt
b3J5CisgKiBhbmQgbm90IGFueSBkZXZpY2UgYWNjZXNzaWJsZSBtZW1vcnkgYXQgYWxsLCBzbyB0
aGVyZSBpcyBubyBwb3J0YWJsZSB3YXkgb2YKKyAqIGNoYW5naW5nIHRoZSBjb25kaXRpb25zLgor
ICogT24gYSBYUFMgOTU2MCB0aGF0IG1lYW5zIGJpdHMgWzAsM10gb24gXENQRVggbmVlZCB0byBi
ZSBjbGVhcmVkLgorICoKKyAqIFRoZSBvbmx5IHN5c3RlbXMgd2hlcmUgdGhpcyBiZWhhdmlvciBj
YW4gYmUgc2VlbiBhcmUgaHlicmlkIGdyYXBoaWNzIGxhcHRvcHMKKyAqIHdpdGggYSBzZWNvbmRh
cnkgTnZpZGlhIE1heHdlbGwsIFBhc2NhbCBvciBUdXJpbmcgR1BVLiBJdCdzIHVuY2xlYXIgd2hl
dGhlcgorICogdGhpcyBpc3N1ZSBvbmx5IG9jY3VycyBpbiBjb21iaW5hdGlvbiB3aXRoIGxpc3Rl
ZCBJbnRlbCBQQ0llIGJyaWRnZQorICogY29udHJvbGxlcnMgYW5kIHRoZSBtZW50aW9uZWQgR1BV
cyBvciBvdGhlciBkZXZpY2VzIGFzIHdlbGwuCisgKgorICogZG9jdW1lbnRhdGlvbiBvbiB0aGUg
UENJZSBicmlkZ2UgY29udHJvbGxlciBjYW4gYmUgZm91bmQgaW4gdGhlCisgKiAiN3RoIEdlbmVy
YXRpb24gSW50ZWzCriBQcm9jZXNzb3IgRmFtaWxpZXMgZm9yIEggUGxhdGZvcm1zIERhdGFzaGVl
dCBWb2x1bWUgMiIKKyAqIFNlY3Rpb24gIjEyIFBDSSBFeHByZXNzKiBDb250cm9sbGVyICh4MTYp
IFJlZ2lzdGVycyIKKyAqLworCitzdGF0aWMgdm9pZCBxdWlya19icm9rZW5fbnZfcnVucG0oc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpCit7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHBjaV9nZXRf
ZHJ2ZGF0YShwZGV2KTsKKwlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGRl
dik7CisJc3RydWN0IHBjaV9kZXYgKmJyaWRnZSA9IHBjaV91cHN0cmVhbV9icmlkZ2UocGRldik7
CisKKwlpZiAoIWJyaWRnZSB8fCBicmlkZ2UtPnZlbmRvciAhPSBQQ0lfVkVORE9SX0lEX0lOVEVM
KQorCQlyZXR1cm47CisKKwlzd2l0Y2ggKGJyaWRnZS0+ZGV2aWNlKSB7CisJY2FzZSAweDE5MDE6
CisJCWRybS0+b2xkX3BtX2NhcCA9IHBkZXYtPnBtX2NhcDsKKwkJcGRldi0+cG1fY2FwID0gMDsK
KwkJTlZfSU5GTyhkcm0sICJEaXNhYmxpbmcgUENJIHBvd2VyIG1hbmFnZW1lbnQgdG8gYXZvaWQg
YnVnXG4iKTsKKwkJYnJlYWs7CisJfQorfQorCiBzdGF0aWMgaW50IG5vdXZlYXVfZHJtX3Byb2Jl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCQkJICAgICBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCAqcGVudCkKIHsKQEAgLTY5OSw2ICs3NTcsNyBAQCBzdGF0aWMgaW50IG5vdXZlYXVfZHJtX3By
b2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCWlmIChyZXQpCiAJCWdvdG8gZmFpbF9kcm1fZGV2
X2luaXQ7CiAKKwlxdWlya19icm9rZW5fbnZfcnVucG0ocGRldik7CiAJcmV0dXJuIDA7CiAKIGZh
aWxfZHJtX2Rldl9pbml0OgpAQCAtNzM2LDcgKzc5NSwxMSBAQCBzdGF0aWMgdm9pZAogbm91dmVh
dV9kcm1fcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogewogCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CisJc3RydWN0IG5vdXZlYXVfZHJtICpkcm0g
PSBub3V2ZWF1X2RybShkZXYpOwogCisJLyogcmV2ZXJ0IG91ciB3b3JrYXJvdW5kICovCisJaWYg
KGRybS0+b2xkX3BtX2NhcCkKKwkJcGRldi0+cG1fY2FwID0gZHJtLT5vbGRfcG1fY2FwOwogCW5v
dXZlYXVfZHJtX2RldmljZV9yZW1vdmUoZGV2KTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZHJ2LmgKaW5kZXggNzBmMzRjYWNjNTUyYy4uODEwNGUzODA2NDk5ZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oCkBAIC0xMzgsNiArMTM4LDggQEAgc3RydWN0IG5v
dXZlYXVfZHJtIHsKIAogCXN0cnVjdCBsaXN0X2hlYWQgY2xpZW50czsKIAorCXU4IG9sZF9wbV9j
YXA7CisKIAlzdHJ1Y3QgewogCQlzdHJ1Y3QgYWdwX2JyaWRnZV9kYXRhICpicmlkZ2U7CiAJCXUz
MiBiYXNlOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXUK
