Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDDA8363E
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5314A6E445;
	Tue,  6 Aug 2019 16:06:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CE16E445;
 Tue,  6 Aug 2019 16:06:35 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yq-0000ee-I1; Tue, 06 Aug 2019 16:06:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:52 +0300
Message-Id: <20190806160554.14046-15-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806160554.14046-1-hch@lst.de>
References: <20190806160554.14046-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AGGvPGg8AA1Gw6ylv1raBDjNXF6ccyWYsPpDnZmLmBg=; b=RzYHdp4mJtW15Li7cWdiL7Rv01
 hFHEseFq+n0UFJMU+3w0w0dcwm6oTnyxs0LPJqTeUb/aik4SEyGDvWEb+rGvDp6r84fKCRpR8iku+
 LvpAQVKD7G9QKkzdJ/DeuZbZbTKro358y+zjuzVRUmFj6CfDmyP5rU7cFg+Mei2TOZGLqki/rhkRI
 +TaF7MWaORAz4mLE/jjH44uvJ1K8vxtIQOYU/+SL0CT+znouLR7X0cSZDFf8qWgYeOqRr0qwLahZj
 AwGNkm8JajYbsE5/lptaYXs7oJbj9ULssrgVQGlVhokMiDkdGrjv85x55+c8YH7Bg4a1zNcPtjDA3
 0XcoXJNg==;
Subject: [Nouveau] [PATCH 14/15] mm: make HMM_MIRROR an implicit option
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

TWFrZSBITU1fTUlSUk9SIGFuIG9wdGlvbiB0aGF0IGlzIHNlbGVjdGVkIGJ5IGRyaXZlcnMgd2Fu
dGluZyB0byB1c2UgaXQKaW5zdGVhZCBvZiBhIHVzZXIgdmlzaWJsZSBvcHRpb24gYXMgaXQgaXMg
anVzdCBhIGxvdy1sZXZlbAppbXBsZW1lbnRhdGlvbiBkZXRhaWwuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9LY29uZmlnIHwgIDQgKysrLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyAg
ICB8ICA0ICsrKy0KIG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysr
KystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9LY29uZmlnIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvS2NvbmZpZwppbmRleCBmNmU1YzAyODJmYzEuLjJl
OThjMDE2Y2I0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvS2NvbmZp
ZworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9LY29uZmlnCkBAIC0yNyw3ICsyNyw5
IEBAIGNvbmZpZyBEUk1fQU1ER1BVX0NJSwogY29uZmlnIERSTV9BTURHUFVfVVNFUlBUUgogCWJv
b2wgIkFsd2F5cyBlbmFibGUgdXNlcnB0ciB3cml0ZSBzdXBwb3J0IgogCWRlcGVuZHMgb24gRFJN
X0FNREdQVQotCWRlcGVuZHMgb24gSE1NX01JUlJPUgorCWRlcGVuZHMgb24gTU1VCisJc2VsZWN0
IEhNTV9NSVJST1IKKwlzZWxlY3QgTU1VX05PVElGSUVSCiAJaGVscAogCSAgVGhpcyBvcHRpb24g
c2VsZWN0cyBDT05GSUdfSE1NIGFuZCBDT05GSUdfSE1NX01JUlJPUiBpZiBpdAogCSAgaXNuJ3Qg
YWxyZWFkeSBzZWxlY3RlZCB0byBlbmFibGVkIGZ1bGwgdXNlcnB0ciBzdXBwb3J0LgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L0tjb25maWcKaW5kZXggOTZiOTgxNGU2ZDA2Li5kZjQzNTJjMjc5YmEgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvS2NvbmZpZwpAQCAtODYsOSArODYsMTEgQEAgY29uZmlnIERSTV9OT1VWRUFVX1NW
TQogCWJvb2wgIihFWFBFUklNRU5UQUwpIEVuYWJsZSBTVk0gKFNoYXJlZCBWaXJ0dWFsIE1lbW9y
eSkgc3VwcG9ydCIKIAlkZXBlbmRzIG9uIERFVklDRV9QUklWQVRFCiAJZGVwZW5kcyBvbiBEUk1f
Tk9VVkVBVQotCWRlcGVuZHMgb24gSE1NX01JUlJPUgorCWRlcGVuZHMgb24gTU1VCiAJZGVwZW5k
cyBvbiBTVEFHSU5HCisJc2VsZWN0IEhNTV9NSVJST1IKIAlzZWxlY3QgTUlHUkFURV9WTUFfSEVM
UEVSCisJc2VsZWN0IE1NVV9OT1RJRklFUgogCWRlZmF1bHQgbgogCWhlbHAKIAkgIFNheSBZIGhl
cmUgaWYgeW91IHdhbnQgdG8gZW5hYmxlIGV4cGVyaW1lbnRhbCBzdXBwb3J0IGZvcgpkaWZmIC0t
Z2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcKaW5kZXggYjE4NzgyYmU5NjljLi41NjM0MzZk
YzFmMjQgMTAwNjQ0Ci0tLSBhL21tL0tjb25maWcKKysrIGIvbW0vS2NvbmZpZwpAQCAtNjc1LDE2
ICs2NzUsMTQgQEAgY29uZmlnIE1JR1JBVEVfVk1BX0hFTFBFUgogY29uZmlnIERFVl9QQUdFTUFQ
X09QUwogCWJvb2wKIAorIworIyBIZWxwZXJzIHRvIG1pcnJvciByYW5nZSBvZiB0aGUgQ1BVIHBh
Z2UgdGFibGVzIG9mIGEgcHJvY2VzcyBpbnRvIGRldmljZSBwYWdlCisjIHRhYmxlcy4KKyMKIGNv
bmZpZyBITU1fTUlSUk9SCi0JYm9vbCAiSE1NIG1pcnJvciBDUFUgcGFnZSB0YWJsZSBpbnRvIGEg
ZGV2aWNlIHBhZ2UgdGFibGUiCisJYm9vbAogCWRlcGVuZHMgb24gTU1VCi0Jc2VsZWN0IE1NVV9O
T1RJRklFUgotCWhlbHAKLQkgIFNlbGVjdCBITU1fTUlSUk9SIGlmIHlvdSB3YW50IHRvIG1pcnJv
ciByYW5nZSBvZiB0aGUgQ1BVIHBhZ2UgdGFibGUgb2YgYQotCSAgcHJvY2VzcyBpbnRvIGEgZGV2
aWNlIHBhZ2UgdGFibGUuIEhlcmUsIG1pcnJvciBtZWFucyAia2VlcCBzeW5jaHJvbml6ZWQiLgot
CSAgUHJlcmVxdWlzaXRlczogdGhlIGRldmljZSBtdXN0IHByb3ZpZGUgdGhlIGFiaWxpdHkgdG8g
d3JpdGUtcHJvdGVjdCBpdHMKLQkgIHBhZ2UgdGFibGVzIChhdCBQQUdFX1NJWkUgZ3JhbnVsYXJp
dHkpLCBhbmQgbXVzdCBiZSBhYmxlIHRvIHJlY292ZXIgZnJvbQotCSAgdGhlIHJlc3VsdGluZyBw
b3RlbnRpYWwgcGFnZSBmYXVsdHMuCisJZGVwZW5kcyBvbiBNTVVfTk9USUZJRVIKIAogY29uZmln
IERFVklDRV9QUklWQVRFCiAJYm9vbCAiVW5hZGRyZXNzYWJsZSBkZXZpY2UgbWVtb3J5IChHUFUg
bWVtb3J5LCAuLi4pIgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
