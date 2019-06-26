Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63114568D3
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3E46E3D0;
	Wed, 26 Jun 2019 12:27:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A32F6E3CE;
 Wed, 26 Jun 2019 12:27:49 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71W-0001LR-EH; Wed, 26 Jun 2019 12:27:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:03 +0200
Message-Id: <20190626122724.13313-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626122724.13313-1-hch@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
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
 bh=IuSVDPBHudchWUkWljO4sDvSgYSGPjFvkYKeyIq9LMc=; b=JI26dnXHpGPmFcF+rpii1hZv3Z
 Ek0KGlwl/lxGCVUxUSyC/eHM6sl/iVonfU7vti0UMb7JDmvwQIuAiVVyFOYeGUfHdgjpEdqF3+iCL
 a7xG6ajTzxtHTForLNaEe2xJqgLzs1sCEkGqnGaePrdZeWzJajntlWjBj+/M9uyhkP/BE+InVWKq2
 toX0aqRMU8tm+bgQa95bY3Y/xe2T0NBo1ymo91HHPou8tgm1RJMR+UIvcd3lYAoQIc0lSkjVNouQH
 JY+rBvuJYFPW8pUQdujdNPD9ZJap5kl7UgTHeJ0UMv690BqCG2MqrZ1mm6X5XDqeyZtJzLhMcUJEI
 KueE+atQ==;
Subject: [Nouveau] [PATCH 04/25] mm: remove MEMORY_DEVICE_PUBLIC support
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
Cc: Michal Hocko <mhocko@suse.com>, linux-nvdimm@lists.01.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBzaW5jZSBpdCB3YXMgYWRkZWQgdG8gdGhlIHRyZWUs
IGFuZCBkb2Vzbid0CmFwcGVhciB0byBhY3R1YWxseSBiZSB1c2FibGUuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRo
b3JwZSA8amdnQG1lbGxhbm94LmNvbT4KQWNrZWQtYnk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1
c2UuY29tPgotLS0KIGluY2x1ZGUvbGludXgvaG1tLmggICAgICB8ICA0ICsrLS0KIGluY2x1ZGUv
bGludXgvaW9wb3J0LmggICB8ICAxIC0KIGluY2x1ZGUvbGludXgvbWVtcmVtYXAuaCB8ICA4IC0t
LS0tLS0tCiBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgfCAxMiAtLS0tLS0tLS0tLS0KIG1tL0tj
b25maWcgICAgICAgICAgICAgICB8IDExIC0tLS0tLS0tLS0tCiBtbS9ndXAuYyAgICAgICAgICAg
ICAgICAgfCAgNyAtLS0tLS0tCiBtbS9obW0uYyAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBt
bS9tZW1jb250cm9sLmMgICAgICAgICAgfCAxMSArKysrKy0tLS0tLQogbW0vbWVtb3J5LWZhaWx1
cmUuYyAgICAgIHwgIDYgKy0tLS0tCiBtbS9tZW1vcnkuYyAgICAgICAgICAgICAgfCAzNCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBtbS9taWdyYXRlLmMgICAgICAgICAgICAg
fCAyNiArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogbW0vc3dhcC5jICAgICAgICAgICAgICAg
IHwgMTEgLS0tLS0tLS0tLS0KIDEyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEy
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVk
ZS9saW51eC9obW0uaAppbmRleCA1YzQ2YjBmNjAzZmQuLjQ0YTVhYzczOGJiNSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9obW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC01ODQs
NyArNTg0LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKSB7fQogc3RhdGljIGlubGluZSB2b2lkIGhtbV9tbV9pbml0KHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKSB7fQogI2VuZGlmIC8qIElTX0VOQUJMRUQoQ09ORklHX0hNTV9NSVJST1IpICov
CiAKLSNpZiBJU19FTkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkgfHwgIElTX0VOQUJMRUQo
Q09ORklHX0RFVklDRV9QVUJMSUMpCisjaWYgSVNfRU5BQkxFRChDT05GSUdfREVWSUNFX1BSSVZB
VEUpCiBzdHJ1Y3QgaG1tX2Rldm1lbTsKIAogc3RydWN0IHBhZ2UgKmhtbV92bWFfYWxsb2NfbG9j
a2VkX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCkBAIC03NDgsNyArNzQ4LDcgQEAg
c3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGhtbV9kZXZtZW1fcGFnZV9nZXRfZHJ2ZGF0YShj
b25zdCBzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKIAlyZXR1cm4gcGFnZS0+aG1tX2RhdGE7CiB9Ci0j
ZW5kaWYgLyogQ09ORklHX0RFVklDRV9QUklWQVRFIHx8IENPTkZJR19ERVZJQ0VfUFVCTElDICov
CisjZW5kaWYgLyogQ09ORklHX0RFVklDRV9QUklWQVRFICovCiAjZWxzZSAvKiBJU19FTkFCTEVE
KENPTkZJR19ITU0pICovCiBzdGF0aWMgaW5saW5lIHZvaWQgaG1tX21tX2Rlc3Ryb3koc3RydWN0
IG1tX3N0cnVjdCAqbW0pIHt9CiBzdGF0aWMgaW5saW5lIHZvaWQgaG1tX21tX2luaXQoc3RydWN0
IG1tX3N0cnVjdCAqbW0pIHt9CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lvcG9ydC5oIGIv
aW5jbHVkZS9saW51eC9pb3BvcnQuaAppbmRleCBkYTBlYmFlYzI1ZjAuLmRkOTYxODgyYmM3NCAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pb3BvcnQuaAorKysgYi9pbmNsdWRlL2xpbnV4L2lv
cG9ydC5oCkBAIC0xMzIsNyArMTMyLDYgQEAgZW51bSB7CiAJSU9SRVNfREVTQ19QRVJTSVNURU5U
X01FTU9SWQkJPSA0LAogCUlPUkVTX0RFU0NfUEVSU0lTVEVOVF9NRU1PUllfTEVHQUNZCT0gNSwK
IAlJT1JFU19ERVNDX0RFVklDRV9QUklWQVRFX01FTU9SWQk9IDYsCi0JSU9SRVNfREVTQ19ERVZJ
Q0VfUFVCTElDX01FTU9SWQkJPSA3LAogfTsKIAogLyogaGVscGVycyB0byBkZWZpbmUgcmVzb3Vy
Y2VzICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggYi9pbmNsdWRlL2xp
bnV4L21lbXJlbWFwLmgKaW5kZXggMTczMmRlYTAzMGIyLi45OTVjNjJjNWE0OGIgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvbWVtcmVtYXAuaAorKysgYi9pbmNsdWRlL2xpbnV4L21lbXJlbWFw
LmgKQEAgLTM3LDEzICszNyw2IEBAIHN0cnVjdCB2bWVtX2FsdG1hcCB7CiAgKiBBIG1vcmUgY29t
cGxldGUgZGlzY3Vzc2lvbiBvZiB1bmFkZHJlc3NhYmxlIG1lbW9yeSBtYXkgYmUgZm91bmQgaW4K
ICAqIGluY2x1ZGUvbGludXgvaG1tLmggYW5kIERvY3VtZW50YXRpb24vdm0vaG1tLnJzdC4KICAq
Ci0gKiBNRU1PUllfREVWSUNFX1BVQkxJQzoKLSAqIERldmljZSBtZW1vcnkgdGhhdCBpcyBjYWNo
ZSBjb2hlcmVudCBmcm9tIGRldmljZSBhbmQgQ1BVIHBvaW50IG9mIHZpZXcuIFRoaXMKLSAqIGlz
IHVzZSBvbiBwbGF0Zm9ybSB0aGF0IGhhdmUgYW4gYWR2YW5jZSBzeXN0ZW0gYnVzIChsaWtlIENB
UEkgb3IgQ0NJWCkuIEEKLSAqIGRyaXZlciBjYW4gaG90cGx1ZyB0aGUgZGV2aWNlIG1lbW9yeSB1
c2luZyBaT05FX0RFVklDRSBhbmQgd2l0aCB0aGF0IG1lbW9yeQotICogdHlwZS4gQW55IHBhZ2Ug
b2YgYSBwcm9jZXNzIGNhbiBiZSBtaWdyYXRlZCB0byBzdWNoIG1lbW9yeS4gSG93ZXZlciBubyBv
bmUKLSAqIHNob3VsZCBiZSBhbGxvdyB0byBwaW4gc3VjaCBtZW1vcnkgc28gdGhhdCBpdCBjYW4g
YWx3YXlzIGJlIGV2aWN0ZWQuCi0gKgogICogTUVNT1JZX0RFVklDRV9GU19EQVg6CiAgKiBIb3N0
IG1lbW9yeSB0aGF0IGhhcyBzaW1pbGFyIGFjY2VzcyBzZW1hbnRpY3MgYXMgU3lzdGVtIFJBTSBp
LmUuIERNQQogICogY29oZXJlbnQgYW5kIHN1cHBvcnRzIHBhZ2UgcGlubmluZy4gSW4gc3VwcG9y
dCBvZiBjb29yZGluYXRpbmcgcGFnZQpAQCAtNTgsNyArNTEsNiBAQCBzdHJ1Y3Qgdm1lbV9hbHRt
YXAgewogICovCiBlbnVtIG1lbW9yeV90eXBlIHsKIAlNRU1PUllfREVWSUNFX1BSSVZBVEUgPSAx
LAotCU1FTU9SWV9ERVZJQ0VfUFVCTElDLAogCU1FTU9SWV9ERVZJQ0VfRlNfREFYLAogCU1FTU9S
WV9ERVZJQ0VfUENJX1AyUERNQSwKIH07CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmgg
Yi9pbmNsdWRlL2xpbnV4L21tLmgKaW5kZXggZGQwYjVmNGUxZTQ1Li42ZTRiOWJlMDhiMTMgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKQEAg
LTk0NCw3ICs5NDQsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3Bh
Z2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJCXJldHVybiBmYWxzZTsKIAlzd2l0Y2ggKHBhZ2UtPnBn
bWFwLT50eXBlKSB7CiAJY2FzZSBNRU1PUllfREVWSUNFX1BSSVZBVEU6Ci0JY2FzZSBNRU1PUllf
REVWSUNFX1BVQkxJQzoKIAljYXNlIE1FTU9SWV9ERVZJQ0VfRlNfREFYOgogCQlfX3B1dF9kZXZt
YXBfbWFuYWdlZF9wYWdlKHBhZ2UpOwogCQlyZXR1cm4gdHJ1ZTsKQEAgLTk2MCwxMiArOTU5LDYg
QEAgc3RhdGljIGlubGluZSBib29sIGlzX2RldmljZV9wcml2YXRlX3BhZ2UoY29uc3Qgc3RydWN0
IHBhZ2UgKnBhZ2UpCiAJCXBhZ2UtPnBnbWFwLT50eXBlID09IE1FTU9SWV9ERVZJQ0VfUFJJVkFU
RTsKIH0KIAotc3RhdGljIGlubGluZSBib29sIGlzX2RldmljZV9wdWJsaWNfcGFnZShjb25zdCBz
dHJ1Y3QgcGFnZSAqcGFnZSkKLXsKLQlyZXR1cm4gaXNfem9uZV9kZXZpY2VfcGFnZShwYWdlKSAm
JgotCQlwYWdlLT5wZ21hcC0+dHlwZSA9PSBNRU1PUllfREVWSUNFX1BVQkxJQzsKLX0KLQogI2lm
ZGVmIENPTkZJR19QQ0lfUDJQRE1BCiBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcGNpX3AycGRtYV9w
YWdlKGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlKQogewpAQCAtOTk4LDExICs5OTEsNiBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgaXNfZGV2aWNlX3ByaXZhdGVfcGFnZShjb25zdCBzdHJ1Y3QgcGFnZSAq
cGFnZSkKIAlyZXR1cm4gZmFsc2U7CiB9CiAKLXN0YXRpYyBpbmxpbmUgYm9vbCBpc19kZXZpY2Vf
cHVibGljX3BhZ2UoY29uc3Qgc3RydWN0IHBhZ2UgKnBhZ2UpCi17Ci0JcmV0dXJuIGZhbHNlOwot
fQotCiBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcGNpX3AycGRtYV9wYWdlKGNvbnN0IHN0cnVjdCBw
YWdlICpwYWdlKQogewogCXJldHVybiBmYWxzZTsKZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9t
bS9LY29uZmlnCmluZGV4IDBkMmJhN2UxZjQzZS4uNmYzNWI4NWIzMDUyIDEwMDY0NAotLS0gYS9t
bS9LY29uZmlnCisrKyBiL21tL0tjb25maWcKQEAgLTcxOCwxNyArNzE4LDYgQEAgY29uZmlnIERF
VklDRV9QUklWQVRFCiAJICBtZW1vcnk7IGkuZS4sIG1lbW9yeSB0aGF0IGlzIG9ubHkgYWNjZXNz
aWJsZSBmcm9tIHRoZSBkZXZpY2UgKG9yCiAJICBncm91cCBvZiBkZXZpY2VzKS4gWW91IGxpa2Vs
eSBhbHNvIHdhbnQgdG8gc2VsZWN0IEhNTV9NSVJST1IuCiAKLWNvbmZpZyBERVZJQ0VfUFVCTElD
Ci0JYm9vbCAiQWRkcmVzc2FibGUgZGV2aWNlIG1lbW9yeSAobGlrZSBHUFUgbWVtb3J5KSIKLQlk
ZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQotCXNlbGVjdCBITU0KLQlzZWxlY3QgREVWX1BBR0VNQVBf
T1BTCi0KLQloZWxwCi0JICBBbGxvd3MgY3JlYXRpb24gb2Ygc3RydWN0IHBhZ2VzIHRvIHJlcHJl
c2VudCBhZGRyZXNzYWJsZSBkZXZpY2UKLQkgIG1lbW9yeTsgaS5lLiwgbWVtb3J5IHRoYXQgaXMg
YWNjZXNzaWJsZSBmcm9tIGJvdGggdGhlIGRldmljZSBhbmQKLQkgIHRoZSBDUFUKLQogY29uZmln
IEZSQU1FX1ZFQ1RPUgogCWJvb2wKIApkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwpp
bmRleCBkZGRlMDk3Y2Y5ZTQuLmZlMTMxZDg3OWM3MCAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysr
IGIvbW0vZ3VwLmMKQEAgLTYwNSwxMyArNjA1LDYgQEAgc3RhdGljIGludCBnZXRfZ2F0ZV9wYWdl
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHJlc3MsCiAJCWlmICgoZ3Vw
X2ZsYWdzICYgRk9MTF9EVU1QKSB8fCAhaXNfemVyb19wZm4ocHRlX3BmbigqcHRlKSkpCiAJCQln
b3RvIHVubWFwOwogCQkqcGFnZSA9IHB0ZV9wYWdlKCpwdGUpOwotCi0JCS8qCi0JCSAqIFRoaXMg
c2hvdWxkIG5ldmVyIGhhcHBlbiAoYSBkZXZpY2UgcHVibGljIHBhZ2UgaW4gdGhlIGdhdGUKLQkJ
ICogYXJlYSkuCi0JCSAqLwotCQlpZiAoaXNfZGV2aWNlX3B1YmxpY19wYWdlKCpwYWdlKSkKLQkJ
CWdvdG8gdW5tYXA7CiAJfQogCWlmICh1bmxpa2VseSghdHJ5X2dldF9wYWdlKCpwYWdlKSkpIHsK
IAkJcmV0ID0gLUVOT01FTTsKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXgg
YmQyNjBhM2I2YjA5Li4zNzYxNTlhNzY5ZmIgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21t
L2htbS5jCkBAIC0xMzMxLDcgKzEzMzEsNyBAQCBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9kbWFf
dW5tYXApOwogI2VuZGlmIC8qIElTX0VOQUJMRUQoQ09ORklHX0hNTV9NSVJST1IpICovCiAKIAot
I2lmIElTX0VOQUJMRUQoQ09ORklHX0RFVklDRV9QUklWQVRFKSB8fCAgSVNfRU5BQkxFRChDT05G
SUdfREVWSUNFX1BVQkxJQykKKyNpZiBJU19FTkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkK
IHN0cnVjdCBwYWdlICpobW1fdm1hX2FsbG9jX2xvY2tlZF9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLAogCQkJCSAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIpCiB7CkBAIC0xNDc4LDQg
KzE0NzgsNCBAQCBzdHJ1Y3QgaG1tX2Rldm1lbSAqaG1tX2Rldm1lbV9hZGQoY29uc3Qgc3RydWN0
IGhtbV9kZXZtZW1fb3BzICpvcHMsCiAJcmV0dXJuIGRldm1lbTsKIH0KIEVYUE9SVF9TWU1CT0xf
R1BMKGhtbV9kZXZtZW1fYWRkKTsKLSNlbmRpZiAvKiBDT05GSUdfREVWSUNFX1BSSVZBVEUgfHwg
Q09ORklHX0RFVklDRV9QVUJMSUMgKi8KKyNlbmRpZiAvKiBDT05GSUdfREVWSUNFX1BSSVZBVEUg
ICovCmRpZmYgLS1naXQgYS9tbS9tZW1jb250cm9sLmMgYi9tbS9tZW1jb250cm9sLmMKaW5kZXgg
YmE5MTM4YTRhMWRlLi5mYTg0NGFlODViY2UgMTAwNjQ0Ci0tLSBhL21tL21lbWNvbnRyb2wuYwor
KysgYi9tbS9tZW1jb250cm9sLmMKQEAgLTQ5OTQsOCArNDk5NCw4IEBAIHN0YXRpYyBpbnQgbWVt
X2Nncm91cF9tb3ZlX2FjY291bnQoc3RydWN0IHBhZ2UgKnBhZ2UsCiAgKiAgIDIoTUNfVEFSR0VU
X1NXQVApOiBpZiB0aGUgc3dhcCBlbnRyeSBjb3JyZXNwb25kaW5nIHRvIHRoaXMgcHRlIGlzIGEK
ICAqICAgICB0YXJnZXQgZm9yIGNoYXJnZSBtaWdyYXRpb24uIGlmIEB0YXJnZXQgaXMgbm90IE5V
TEwsIHRoZSBlbnRyeSBpcyBzdG9yZWQKICAqICAgICBpbiB0YXJnZXQtPmVudC4KLSAqICAgMyhN
Q19UQVJHRVRfREVWSUNFKTogbGlrZSBNQ19UQVJHRVRfUEFHRSAgYnV0IHBhZ2UgaXMgTUVNT1JZ
X0RFVklDRV9QVUJMSUMKLSAqICAgICBvciBNRU1PUllfREVWSUNFX1BSSVZBVEUgKHNvIFpPTkVf
REVWSUNFIHBhZ2UgYW5kIHRodXMgbm90IG9uIHRoZSBscnUpLgorICogICAzKE1DX1RBUkdFVF9E
RVZJQ0UpOiBsaWtlIE1DX1RBUkdFVF9QQUdFICBidXQgcGFnZSBpcyBNRU1PUllfREVWSUNFX1BS
SVZBVEUKKyAqICAgICAoc28gWk9ORV9ERVZJQ0UgcGFnZSBhbmQgdGh1cyBub3Qgb24gdGhlIGxy
dSkuCiAgKiAgICAgRm9yIG5vdyB3ZSBzdWNoIHBhZ2UgaXMgY2hhcmdlIGxpa2UgYSByZWd1bGFy
IHBhZ2Ugd291bGQgYmUgYXMgZm9yIGFsbAogICogICAgIGludGVudCBhbmQgcHVycG9zZXMgaXQg
aXMganVzdCBzcGVjaWFsIG1lbW9yeSB0YWtpbmcgdGhlIHBsYWNlIG9mIGEKICAqICAgICByZWd1
bGFyIHBhZ2UuCkBAIC01MDI5LDggKzUwMjksNyBAQCBzdGF0aWMgZW51bSBtY190YXJnZXRfdHlw
ZSBnZXRfbWN0Z3RfdHlwZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJICovCiAJCWlm
IChwYWdlLT5tZW1fY2dyb3VwID09IG1jLmZyb20pIHsKIAkJCXJldCA9IE1DX1RBUkdFVF9QQUdF
OwotCQkJaWYgKGlzX2RldmljZV9wcml2YXRlX3BhZ2UocGFnZSkgfHwKLQkJCSAgICBpc19kZXZp
Y2VfcHVibGljX3BhZ2UocGFnZSkpCisJCQlpZiAoaXNfZGV2aWNlX3ByaXZhdGVfcGFnZShwYWdl
KSkKIAkJCQlyZXQgPSBNQ19UQVJHRVRfREVWSUNFOwogCQkJaWYgKHRhcmdldCkKIAkJCQl0YXJn
ZXQtPnBhZ2UgPSBwYWdlOwpAQCAtNTEwMSw4ICs1MTAwLDggQEAgc3RhdGljIGludCBtZW1fY2dy
b3VwX2NvdW50X3ByZWNoYXJnZV9wdGVfcmFuZ2UocG1kX3QgKnBtZCwKIAlpZiAocHRsKSB7CiAJ
CS8qCiAJCSAqIE5vdGUgdGhlaXIgY2FuIG5vdCBiZSBNQ19UQVJHRVRfREVWSUNFIGZvciBub3cg
YXMgd2UgZG8gbm90Ci0JCSAqIHN1cHBvcnQgdHJhbnNwYXJlbnQgaHVnZSBwYWdlIHdpdGggTUVN
T1JZX0RFVklDRV9QVUJMSUMgb3IKLQkJICogTUVNT1JZX0RFVklDRV9QUklWQVRFIGJ1dCB0aGlz
IG1pZ2h0IGNoYW5nZS4KKwkJICogc3VwcG9ydCB0cmFuc3BhcmVudCBodWdlIHBhZ2Ugd2l0aCBN
RU1PUllfREVWSUNFX1BSSVZBVEUgYnV0CisJCSAqIHRoaXMgbWlnaHQgY2hhbmdlLgogCQkgKi8K
IAkJaWYgKGdldF9tY3RndF90eXBlX3RocCh2bWEsIGFkZHIsICpwbWQsIE5VTEwpID09IE1DX1RB
UkdFVF9QQUdFKQogCQkJbWMucHJlY2hhcmdlICs9IEhQQUdFX1BNRF9OUjsKZGlmZiAtLWdpdCBh
L21tL21lbW9yeS1mYWlsdXJlLmMgYi9tbS9tZW1vcnktZmFpbHVyZS5jCmluZGV4IDhkYTAzMzRi
OWNhMC4uZDlmYzFhOGJkZjZhIDEwMDY0NAotLS0gYS9tbS9tZW1vcnktZmFpbHVyZS5jCisrKyBi
L21tL21lbW9yeS1mYWlsdXJlLmMKQEAgLTExNzcsMTYgKzExNzcsMTIgQEAgc3RhdGljIGludCBt
ZW1vcnlfZmFpbHVyZV9kZXZfcGFnZW1hcCh1bnNpZ25lZCBsb25nIHBmbiwgaW50IGZsYWdzLAog
CQlnb3RvIHVubG9jazsKIAl9CiAKLQlzd2l0Y2ggKHBnbWFwLT50eXBlKSB7Ci0JY2FzZSBNRU1P
UllfREVWSUNFX1BSSVZBVEU6Ci0JY2FzZSBNRU1PUllfREVWSUNFX1BVQkxJQzoKKwlpZiAocGdt
YXAtPnR5cGUgPT0gTUVNT1JZX0RFVklDRV9QUklWQVRFKSB7CiAJCS8qCiAJCSAqIFRPRE86IEhh
bmRsZSBITU0gcGFnZXMgd2hpY2ggbWF5IG5lZWQgY29vcmRpbmF0aW9uCiAJCSAqIHdpdGggZGV2
aWNlLXNpZGUgbWVtb3J5LgogCQkgKi8KIAkJZ290byB1bmxvY2s7Ci0JZGVmYXVsdDoKLQkJYnJl
YWs7CiAJfQogCiAJLyoKZGlmZiAtLWdpdCBhL21tL21lbW9yeS5jIGIvbW0vbWVtb3J5LmMKaW5k
ZXggZGRmMjBiZDBjMzE3Li5iZDIxZTcwNjNiZjAgMTAwNjQ0Ci0tLSBhL21tL21lbW9yeS5jCisr
KyBiL21tL21lbW9yeS5jCkBAIC01ODUsMjkgKzU4NSw2IEBAIHN0cnVjdCBwYWdlICpfdm1fbm9y
bWFsX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwK
IAkJCXJldHVybiBOVUxMOwogCQlpZiAoaXNfemVyb19wZm4ocGZuKSkKIAkJCXJldHVybiBOVUxM
OwotCi0JCS8qCi0JCSAqIERldmljZSBwdWJsaWMgcGFnZXMgYXJlIHNwZWNpYWwgcGFnZXMgKHRo
ZXkgYXJlIFpPTkVfREVWSUNFCi0JCSAqIHBhZ2VzIGJ1dCBkaWZmZXJlbnQgZnJvbSBwZXJzaXN0
ZW50IG1lbW9yeSkuIFRoZXkgYmVoYXZlCi0JCSAqIGFsbG1vc3QgbGlrZSBub3JtYWwgcGFnZXMu
IFRoZSBkaWZmZXJlbmNlIGlzIHRoYXQgdGhleSBhcmUKLQkJICogbm90IG9uIHRoZSBscnUgYW5k
IHRodXMgc2hvdWxkIG5ldmVyIGJlIGludm9sdmUgd2l0aCBhbnktCi0JCSAqIHRoaW5nIHRoYXQg
aW52b2x2ZSBscnUgbWFuaXB1bGF0aW9uIChtbG9jaywgbnVtYSBiYWxhbmNpbmcsCi0JCSAqIC4u
LikuCi0JCSAqCi0JCSAqIFRoaXMgaXMgd2h5IHdlIHN0aWxsIHdhbnQgdG8gcmV0dXJuIE5VTEwg
Zm9yIHN1Y2ggcGFnZSBmcm9tCi0JCSAqIHZtX25vcm1hbF9wYWdlKCkgc28gdGhhdCB3ZSBkbyBu
b3QgaGF2ZSB0byBzcGVjaWFsIGNhc2UgYWxsCi0JCSAqIGNhbGwgc2l0ZSBvZiB2bV9ub3JtYWxf
cGFnZSgpLgotCQkgKi8KLQkJaWYgKGxpa2VseShwZm4gPD0gaGlnaGVzdF9tZW1tYXBfcGZuKSkg
ewotCQkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOwotCi0JCQlpZiAoaXNf
ZGV2aWNlX3B1YmxpY19wYWdlKHBhZ2UpKSB7Ci0JCQkJaWYgKHdpdGhfcHVibGljX2RldmljZSkK
LQkJCQkJcmV0dXJuIHBhZ2U7Ci0JCQkJcmV0dXJuIE5VTEw7Ci0JCQl9Ci0JCX0KLQogCQlpZiAo
cHRlX2Rldm1hcChwdGUpKQogCQkJcmV0dXJuIE5VTEw7CiAKQEAgLTc5NywxNyArNzc0LDYgQEAg
Y29weV9vbmVfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKmRzdF9tbSwgc3RydWN0IG1tX3N0cnVjdCAq
c3JjX21tLAogCQlyc3NbbW1fY291bnRlcihwYWdlKV0rKzsKIAl9IGVsc2UgaWYgKHB0ZV9kZXZt
YXAocHRlKSkgewogCQlwYWdlID0gcHRlX3BhZ2UocHRlKTsKLQotCQkvKgotCQkgKiBDYWNoZSBj
b2hlcmVudCBkZXZpY2UgbWVtb3J5IGJlaGF2ZSBsaWtlIHJlZ3VsYXIgcGFnZSBhbmQKLQkJICog
bm90IGxpa2UgcGVyc2lzdGVudCBtZW1vcnkgcGFnZS4gRm9yIG1vcmUgaW5mb3JtYXRpb25zIHNl
ZQotCQkgKiBNRU1PUllfREVWSUNFX0NBQ0hFX0NPSEVSRU5UIGluIG1lbW9yeV9ob3RwbHVnLmgK
LQkJICovCi0JCWlmIChpc19kZXZpY2VfcHVibGljX3BhZ2UocGFnZSkpIHsKLQkJCWdldF9wYWdl
KHBhZ2UpOwotCQkJcGFnZV9kdXBfcm1hcChwYWdlLCBmYWxzZSk7Ci0JCQlyc3NbbW1fY291bnRl
cihwYWdlKV0rKzsKLQkJfQogCX0KIAogb3V0X3NldF9wdGU6CmRpZmYgLS1naXQgYS9tbS9taWdy
YXRlLmMgYi9tbS9taWdyYXRlLmMKaW5kZXggZjJlY2MyODU1YTEyLi4xNDljNjkyZDVmOWIgMTAw
NjQ0Ci0tLSBhL21tL21pZ3JhdGUuYworKysgYi9tbS9taWdyYXRlLmMKQEAgLTI0Niw4ICsyNDYs
NiBAQCBzdGF0aWMgYm9vbCByZW1vdmVfbWlncmF0aW9uX3B0ZShzdHJ1Y3QgcGFnZSAqcGFnZSwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQlpZiAoaXNfZGV2aWNlX3ByaXZhdGVfcGFn
ZShuZXcpKSB7CiAJCQkJZW50cnkgPSBtYWtlX2RldmljZV9wcml2YXRlX2VudHJ5KG5ldywgcHRl
X3dyaXRlKHB0ZSkpOwogCQkJCXB0ZSA9IHN3cF9lbnRyeV90b19wdGUoZW50cnkpOwotCQkJfSBl
bHNlIGlmIChpc19kZXZpY2VfcHVibGljX3BhZ2UobmV3KSkgewotCQkJCXB0ZSA9IHB0ZV9ta2Rl
dm1hcChwdGUpOwogCQkJfQogCQl9CiAKQEAgLTM4MSw3ICszNzksNiBAQCBzdGF0aWMgaW50IGV4
cGVjdGVkX3BhZ2VfcmVmcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywgc3RydWN0IHBh
Z2UgKnBhZ2UpCiAJICogWk9ORV9ERVZJQ0UgcGFnZXMuCiAJICovCiAJZXhwZWN0ZWRfY291bnQg
Kz0gaXNfZGV2aWNlX3ByaXZhdGVfcGFnZShwYWdlKTsKLQlleHBlY3RlZF9jb3VudCArPSBpc19k
ZXZpY2VfcHVibGljX3BhZ2UocGFnZSk7CiAJaWYgKG1hcHBpbmcpCiAJCWV4cGVjdGVkX2NvdW50
ICs9IGhwYWdlX25yX3BhZ2VzKHBhZ2UpICsgcGFnZV9oYXNfcHJpdmF0ZShwYWdlKTsKIApAQCAt
OTk0LDEwICs5OTEsNyBAQCBzdGF0aWMgaW50IG1vdmVfdG9fbmV3X3BhZ2Uoc3RydWN0IHBhZ2Ug
Km5ld3BhZ2UsIHN0cnVjdCBwYWdlICpwYWdlLAogCQlpZiAoIVBhZ2VNYXBwaW5nRmxhZ3MocGFn
ZSkpCiAJCQlwYWdlLT5tYXBwaW5nID0gTlVMTDsKIAotCQlpZiAodW5saWtlbHkoaXNfem9uZV9k
ZXZpY2VfcGFnZShuZXdwYWdlKSkpIHsKLQkJCWlmIChpc19kZXZpY2VfcHVibGljX3BhZ2UobmV3
cGFnZSkpCi0JCQkJZmx1c2hfZGNhY2hlX3BhZ2UobmV3cGFnZSk7Ci0JCX0gZWxzZQorCQlpZiAo
bGlrZWx5KCFpc196b25lX2RldmljZV9wYWdlKG5ld3BhZ2UpKSkKIAkJCWZsdXNoX2RjYWNoZV9w
YWdlKG5ld3BhZ2UpOwogCiAJfQpAQCAtMjQwNiwxNiArMjQwMCw3IEBAIHN0YXRpYyBib29sIG1p
Z3JhdGVfdm1hX2NoZWNrX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJCSAqIEZJWE1FIHByb3Bl
ciBzb2x1dGlvbiBpcyB0byByZXdvcmsgbWlncmF0aW9uX2VudHJ5X3dhaXQoKSBzbwogCQkgKiBp
dCBkb2VzIG5vdCBuZWVkIHRvIHRha2UgYSByZWZlcmVuY2Ugb24gcGFnZS4KIAkJICovCi0JCWlm
IChpc19kZXZpY2VfcHJpdmF0ZV9wYWdlKHBhZ2UpKQotCQkJcmV0dXJuIHRydWU7Ci0KLQkJLyoK
LQkJICogT25seSBhbGxvdyBkZXZpY2UgcHVibGljIHBhZ2UgdG8gYmUgbWlncmF0ZWQgYW5kIGFj
Y291bnQgZm9yCi0JCSAqIHRoZSBleHRyYSByZWZlcmVuY2UgY291bnQgaW1wbHkgYnkgWk9ORV9E
RVZJQ0UgcGFnZXMuCi0JCSAqLwotCQlpZiAoIWlzX2RldmljZV9wdWJsaWNfcGFnZShwYWdlKSkK
LQkJCXJldHVybiBmYWxzZTsKLQkJZXh0cmErKzsKKwkJcmV0dXJuIGlzX2RldmljZV9wcml2YXRl
X3BhZ2UocGFnZSk7CiAJfQogCiAJLyogRm9yIGZpbGUgYmFjayBwYWdlICovCkBAIC0yNjY1LDEx
ICsyNjUwLDYgQEAgc3RhdGljIHZvaWQgbWlncmF0ZV92bWFfaW5zZXJ0X3BhZ2Uoc3RydWN0IG1p
Z3JhdGVfdm1hICptaWdyYXRlLAogCiAJCQlzd3BfZW50cnkgPSBtYWtlX2RldmljZV9wcml2YXRl
X2VudHJ5KHBhZ2UsIHZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSk7CiAJCQllbnRyeSA9IHN3cF9l
bnRyeV90b19wdGUoc3dwX2VudHJ5KTsKLQkJfSBlbHNlIGlmIChpc19kZXZpY2VfcHVibGljX3Bh
Z2UocGFnZSkpIHsKLQkJCWVudHJ5ID0gcHRlX21rb2xkKG1rX3B0ZShwYWdlLCBSRUFEX09OQ0Uo
dm1hLT52bV9wYWdlX3Byb3QpKSk7Ci0JCQlpZiAodm1hLT52bV9mbGFncyAmIFZNX1dSSVRFKQot
CQkJCWVudHJ5ID0gcHRlX21rd3JpdGUocHRlX21rZGlydHkoZW50cnkpKTsKLQkJCWVudHJ5ID0g
cHRlX21rZGV2bWFwKGVudHJ5KTsKIAkJfQogCX0gZWxzZSB7CiAJCWVudHJ5ID0gbWtfcHRlKHBh
Z2UsIHZtYS0+dm1fcGFnZV9wcm90KTsKQEAgLTI3ODksNyArMjc2OSw3IEBAIHN0YXRpYyB2b2lk
IG1pZ3JhdGVfdm1hX3BhZ2VzKHN0cnVjdCBtaWdyYXRlX3ZtYSAqbWlncmF0ZSkKIAkJCQkJbWln
cmF0ZS0+c3JjW2ldICY9IH5NSUdSQVRFX1BGTl9NSUdSQVRFOwogCQkJCQljb250aW51ZTsKIAkJ
CQl9Ci0JCQl9IGVsc2UgaWYgKCFpc19kZXZpY2VfcHVibGljX3BhZ2UobmV3cGFnZSkpIHsKKwkJ
CX0gZWxzZSB7CiAJCQkJLyoKIAkJCQkgKiBPdGhlciB0eXBlcyBvZiBaT05FX0RFVklDRSBwYWdl
IGFyZSBub3QKIAkJCQkgKiBzdXBwb3J0ZWQuCmRpZmYgLS1naXQgYS9tbS9zd2FwLmMgYi9tbS9z
d2FwLmMKaW5kZXggN2VkZTNlZGRjMTJhLi44MzEwNzQxMGQyOWYgMTAwNjQ0Ci0tLSBhL21tL3N3
YXAuYworKysgYi9tbS9zd2FwLmMKQEAgLTc0MCwxNyArNzQwLDYgQEAgdm9pZCByZWxlYXNlX3Bh
Z2VzKHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCBucikKIAkJaWYgKGlzX2h1Z2VfemVyb19wYWdl
KHBhZ2UpKQogCQkJY29udGludWU7CiAKLQkJLyogRGV2aWNlIHB1YmxpYyBwYWdlIGNhbiBub3Qg
YmUgaHVnZSBwYWdlICovCi0JCWlmIChpc19kZXZpY2VfcHVibGljX3BhZ2UocGFnZSkpIHsKLQkJ
CWlmIChsb2NrZWRfcGdkYXQpIHsKLQkJCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZsb2NrZWRf
cGdkYXQtPmxydV9sb2NrLAotCQkJCQkJICAgICAgIGZsYWdzKTsKLQkJCQlsb2NrZWRfcGdkYXQg
PSBOVUxMOwotCQkJfQotCQkJcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7Ci0JCQljb250
aW51ZTsKLQkJfQotCiAJCXBhZ2UgPSBjb21wb3VuZF9oZWFkKHBhZ2UpOwogCQlpZiAoIXB1dF9w
YWdlX3Rlc3R6ZXJvKHBhZ2UpKQogCQkJY29udGludWU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
