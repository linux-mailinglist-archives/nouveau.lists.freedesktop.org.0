Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8F0AADA4
	for <lists+nouveau@lfdr.de>; Thu,  5 Sep 2019 23:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107536E03A;
	Thu,  5 Sep 2019 21:12:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EAB6E03A;
 Thu,  5 Sep 2019 21:12:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 14:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,471,1559545200"; d="scan'208";a="190616979"
Received: from josouza-mobl.jf.intel.com (HELO josouza-MOBL.intel.com)
 ([10.24.9.135])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Sep 2019 14:12:45 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu,  5 Sep 2019 14:12:32 -0700
Message-Id: <20190905211232.27057-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190905210927.26540-1-jose.souza@intel.com>
References: <20190905210927.26540-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2.1] drm/connector: Allow max possible encoders
 to attach to a connector
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+
CgpDdXJyZW50bHkgd2UgcmVzdHJpY3QgdGhlIG51bWJlciBvZiBlbmNvZGVycyB0aGF0IGNhbiBi
ZSBsaW5rZWQgdG8KYSBjb25uZWN0b3IgdG8gMywgaW5jcmVhc2UgaXQgdG8gbWF0Y2ggdGhlIG1h
eGltdW0gbnVtYmVyIG9mIGVuY29kZXJzCnRoYXQgY2FuIGJlIGluaXRpYWxpemVkKDMyKS4KClRv
IG1vcmUgZWZmaWVudGx5IGRvIHRoYXQgbGV0cyBzd2l0Y2ggZnJvbSBhbiBhcnJheSBvZiBlbmNv
ZGVyIGlkcyB0bwpiaXRtYXNrLgoKQWxzbyByZW1vdmluZyB0aGUgYmVzdF9lbmNvZGVyIGhvb2sg
ZnJvbSB0aGUgZHJpdmVycyB0aGF0IG9ubHkgaGF2ZQpvbmUgZW5jb2RlciBwZXIgY29ubmVjdG9y
KHRoaXMgb25lcyBoYXZlIG9uZSBlbmNvZGVyIGluIHRoZSB3aG9sZQpkcml2ZXIpLCBwaWNrX3Np
bmdsZV9lbmNvZGVyX2Zvcl9jb25uZWN0b3IoKSB3aWxsIGRvIHRoZSBzYW1lIGpvYgp3aXRoIG5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKdjI6IEZpeGluZyBtaXNzZWQgcmV0dXJuIG9uIGFtZGdwdV9k
bV9jb25uZWN0b3JfdG9fZW5jb2RlcigpCgpTdWdnZXN0ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogaW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IERo
aW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0t
CiAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMgICAgfCAyMyArKysr
Ky0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYyAgICAg
IHwgIDUgKystCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
fCAgOCArKysrLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jICAgICAgICAgICAgICAg
IHwgMTIgLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMgICAgICAg
ICAgIHwgIDkgKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgICAg
ICAgICAgfCAgMyArLQogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgICAgICAg
ICAgIHwgMzEgKysrKystLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9o
ZWxwZXIuYyAgICAgICAgICAgIHwgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfbW9kZS5jICAgICAgICB8IDExIC0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjA0L2Rpc3AuYyAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9jb25uZWN0b3IuYyAgIHwgIDcgKystLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2Nvbm5lY3RvcnMuYyAgICB8IDI3ICsrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX2Nvbm5lY3Rvci5jICAgICAgICAgICB8ICA4IC0tLS0tCiBpbmNsdWRlL2RybS9kcm1f
Y29ubmVjdG9yLmggICAgICAgICAgICAgICAgICAgfCAxOCArKysrKy0tLS0tLQogMTUgZmlsZXMg
Y2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMTE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3JzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jCmluZGV4IGVjZTU1YzhmYTY3
My4uZDg3MjkyODVmNzMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY29ubmVjdG9ycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jb25uZWN0b3JzLmMKQEAgLTIxNywxMSArMjE3LDEwIEBAIGFtZGdwdV9jb25uZWN0b3JfdXBk
YXRlX3NjcmF0Y2hfcmVncyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCXN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAljb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxw
ZXJfZnVuY3MgKmNvbm5lY3Rvcl9mdW5jcyA9IGNvbm5lY3Rvci0+aGVscGVyX3ByaXZhdGU7CiAJ
Ym9vbCBjb25uZWN0ZWQ7Ci0JaW50IGk7CiAKIAliZXN0X2VuY29kZXIgPSBjb25uZWN0b3JfZnVu
Y3MtPmJlc3RfZW5jb2Rlcihjb25uZWN0b3IpOwogCi0JZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9w
b3NzaWJsZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlciwgaSkgeworCWRybV9jb25uZWN0b3Jf
Zm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIpIHsKIAkJaWYgKChl
bmNvZGVyID09IGJlc3RfZW5jb2RlcikgJiYgKHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Nv
bm5lY3RlZCkpCiAJCQljb25uZWN0ZWQgPSB0cnVlOwogCQllbHNlCkBAIC0yMzYsOSArMjM1LDgg
QEAgYW1kZ3B1X2Nvbm5lY3Rvcl9maW5kX2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvciwKIAkJCSAgICAgICBpbnQgZW5jb2Rlcl90eXBlKQogewogCXN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jb2RlcjsKLQlpbnQgaTsKIAotCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2li
bGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIsIGkpIHsKKwlkcm1fY29ubmVjdG9yX2Zvcl9l
YWNoX3Bvc3NpYmxlX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyKSB7CiAJCWlmIChlbmNvZGVy
LT5lbmNvZGVyX3R5cGUgPT0gZW5jb2Rlcl90eXBlKQogCQkJcmV0dXJuIGVuY29kZXI7CiAJfQpA
QCAtMzQ3LDEwICszNDUsOSBAQCBzdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICoKIGFtZGdwdV9j
b25uZWN0b3JfYmVzdF9zaW5nbGVfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgaTsKIAogCS8qIHBp
Y2sgdGhlIGZpcnN0IG9uZSAqLwotCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5j
b2Rlcihjb25uZWN0b3IsIGVuY29kZXIsIGkpCisJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3Nz
aWJsZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlcikKIAkJcmV0dXJuIGVuY29kZXI7CiAKIAly
ZXR1cm4gTlVMTDsKQEAgLTEwNjUsOSArMTA2Miw4IEBAIGFtZGdwdV9jb25uZWN0b3JfZHZpX2Rl
dGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQogCS8qIGZp
bmQgYW5hbG9nIGVuY29kZXIgKi8KIAlpZiAoYW1kZ3B1X2Nvbm5lY3Rvci0+ZGFjX2xvYWRfZGV0
ZWN0KSB7CiAJCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQkJaW50IGk7CiAKLQkJZHJt
X2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2Rlciwg
aSkgeworCQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoY29ubmVjdG9y
LCBlbmNvZGVyKSB7CiAJCQlpZiAoZW5jb2Rlci0+ZW5jb2Rlcl90eXBlICE9IERSTV9NT0RFX0VO
Q09ERVJfREFDICYmCiAJCQkgICAgZW5jb2Rlci0+ZW5jb2Rlcl90eXBlICE9IERSTV9NT0RFX0VO
Q09ERVJfVFZEQUMpCiAJCQkJY29udGludWU7CkBAIC0xMTE3LDkgKzExMTMsOCBAQCBhbWRncHVf
Y29ubmVjdG9yX2R2aV9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7
CiAJc3RydWN0IGFtZGdwdV9jb25uZWN0b3IgKmFtZGdwdV9jb25uZWN0b3IgPSB0b19hbWRncHVf
Y29ubmVjdG9yKGNvbm5lY3Rvcik7CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwotCWlu
dCBpOwogCi0JZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3Rv
ciwgZW5jb2RlciwgaSkgeworCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rl
cihjb25uZWN0b3IsIGVuY29kZXIpIHsKIAkJaWYgKGFtZGdwdV9jb25uZWN0b3ItPnVzZV9kaWdp
dGFsID09IHRydWUpIHsKIAkJCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVf
RU5DT0RFUl9UTURTKQogCQkJCXJldHVybiBlbmNvZGVyOwpAQCAtMTEzNCw3ICsxMTI5LDcgQEAg
YW1kZ3B1X2Nvbm5lY3Rvcl9kdmlfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKQogCiAJLyogdGhlbiBjaGVjayB1c2UgZGlnaXRpYWwgKi8KIAkvKiBwaWNrIHRoZSBmaXJz
dCBvbmUgKi8KLQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoY29ubmVj
dG9yLCBlbmNvZGVyLCBpKQorCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rl
cihjb25uZWN0b3IsIGVuY29kZXIpCiAJCXJldHVybiBlbmNvZGVyOwogCiAJcmV0dXJuIE5VTEw7
CkBAIC0xMjcxLDkgKzEyNjYsOCBAQCB1MTYgYW1kZ3B1X2Nvbm5lY3Rvcl9lbmNvZGVyX2dldF9k
cF9icmlkZ2VfZW5jb2Rlcl9pZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubgogewogCXN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAlzdHJ1Y3QgYW1kZ3B1X2VuY29kZXIgKmFtZGdwdV9l
bmNvZGVyOwotCWludCBpOwogCi0JZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNv
ZGVyKGNvbm5lY3RvciwgZW5jb2RlciwgaSkgeworCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9z
c2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIpIHsKIAkJYW1kZ3B1X2VuY29kZXIgPSB0
b19hbWRncHVfZW5jb2RlcihlbmNvZGVyKTsKIAogCQlzd2l0Y2ggKGFtZGdwdV9lbmNvZGVyLT5l
bmNvZGVyX2lkKSB7CkBAIC0xMjkyLDEwICsxMjg2LDkgQEAgc3RhdGljIGJvb2wgYW1kZ3B1X2Nv
bm5lY3Rvcl9lbmNvZGVyX2lzX2hicjIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikK
IHsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7CiAJc3RydWN0IGFtZGdwdV9lbmNvZGVy
ICphbWRncHVfZW5jb2RlcjsKLQlpbnQgaTsKIAlib29sIGZvdW5kID0gZmFsc2U7CiAKLQlkcm1f
Y29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyLCBp
KSB7CisJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3Rvciwg
ZW5jb2RlcikgewogCQlhbWRncHVfZW5jb2RlciA9IHRvX2FtZGdwdV9lbmNvZGVyKGVuY29kZXIp
OwogCQlpZiAoYW1kZ3B1X2VuY29kZXItPmNhcHMgJiBBVE9NX0VOQ09ERVJfQ0FQX1JFQ09SRF9I
QlIyKQogCQkJZm91bmQgPSB0cnVlOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZGNlX3ZpcnR1YWwuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0
dWFsLmMKaW5kZXggZjFmYWRiNWJhMTkxLi45OWQxMmU4OGRlOTIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92aXJ0dWFsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZGNlX3ZpcnR1YWwuYwpAQCAtMjYwLDE1ICsyNjAsMTQgQEAgc3RhdGljIHN0
cnVjdCBkcm1fZW5jb2RlciAqCiBkY2VfdmlydHVhbF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IpCiB7CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwotCWludCBp
OwogCi0JZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3Rvciwg
ZW5jb2RlciwgaSkgeworCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihj
b25uZWN0b3IsIGVuY29kZXIpIHsKIAkJaWYgKGVuY29kZXItPmVuY29kZXJfdHlwZSA9PSBEUk1f
TU9ERV9FTkNPREVSX1ZJUlRVQUwpCiAJCQlyZXR1cm4gZW5jb2RlcjsKIAl9CiAKIAkvKiBwaWNr
IHRoZSBmaXJzdCBvbmUgKi8KLQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29k
ZXIoY29ubmVjdG9yLCBlbmNvZGVyLCBpKQorCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2li
bGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIpCiAJCXJldHVybiBlbmNvZGVyOwogCiAJcmV0
dXJuIE5VTEw7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1
X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYwppbmRleCAwYTcxZWQxZTc3NjIuLjY2NDM2NzQyM2E1MSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00ODIy
LDcgKzQ4MjIsMTMgQEAgc3RhdGljIGludCB0b19kcm1fY29ubmVjdG9yX3R5cGUoZW51bSBzaWdu
YWxfdHlwZSBzdCkKIAogc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqYW1kZ3B1X2RtX2Nvbm5l
Y3Rvcl90b19lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7Ci0JcmV0
dXJuIGRybV9lbmNvZGVyX2ZpbmQoY29ubmVjdG9yLT5kZXYsIE5VTEwsIGNvbm5lY3Rvci0+ZW5j
b2Rlcl9pZHNbMF0pOworCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKKworCS8qIFRoZXJl
IGlzIG9ubHkgb25lIGVuY29kZXIgcGVyIGNvbm5lY3RvciAqLworCWRybV9jb25uZWN0b3JfZm9y
X2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIpCisJCXJldHVybiBlbmNv
ZGVyOworCisJcmV0dXJuIE5VTEw7CiB9CiAKIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9nZXRfbmF0
aXZlX21vZGUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYwppbmRleCBkMzQ5YzcyMTUwMWMuLmVlZjk1ZTFhZjA2YiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYwpAQCAtNjg3LDE3ICs2ODcsNiBAQCBzdGF0aWMgdm9pZCBhc3RfZW5jb2Rlcl9kZXN0cm95
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAlrZnJlZShlbmNvZGVyKTsKIH0KIAotCi1z
dGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICphc3RfYmVzdF9zaW5nbGVfZW5jb2RlcihzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQotewotCWludCBlbmNfaWQgPSBjb25uZWN0b3ItPmVu
Y29kZXJfaWRzWzBdOwotCS8qIHBpY2sgdGhlIGVuY29kZXIgaWRzICovCi0JaWYgKGVuY19pZCkK
LQkJcmV0dXJuIGRybV9lbmNvZGVyX2ZpbmQoY29ubmVjdG9yLT5kZXYsIE5VTEwsIGVuY19pZCk7
Ci0JcmV0dXJuIE5VTEw7Ci19Ci0KLQogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9m
dW5jcyBhc3RfZW5jX2Z1bmNzID0gewogCS5kZXN0cm95ID0gYXN0X2VuY29kZXJfZGVzdHJveSwK
IH07CkBAIC04NDcsNyArODM2LDYgQEAgc3RhdGljIHZvaWQgYXN0X2Nvbm5lY3Rvcl9kZXN0cm95
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGFzdF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewog
CS5tb2RlX3ZhbGlkID0gYXN0X21vZGVfdmFsaWQsCiAJLmdldF9tb2RlcyA9IGFzdF9nZXRfbW9k
ZXMsCi0JLmJlc3RfZW5jb2RlciA9IGFzdF9iZXN0X3NpbmdsZV9lbmNvZGVyLAogfTsKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGFzdF9jb25uZWN0b3JfZnVuY3Mg
PSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCmluZGV4IDQ3MDY0MzlmYjQ5MC4uYzQ0
MDAyN2NiNTM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwpAQCAtMTA0LDggKzEw
NCwxMyBAQCBkcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9jaGFuZ2VkKHN0cnVjdCBkcm1fYXRvbWlj
X3N0YXRlICpzdGF0ZSwKIHN0YXRpYyBzdHJ1Y3QgZHJtX2VuY29kZXIgKgogcGlja19zaW5nbGVf
ZW5jb2Rlcl9mb3JfY29ubmVjdG9yKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7
Ci0JV0FSTl9PTihjb25uZWN0b3ItPmVuY29kZXJfaWRzWzFdKTsKLQlyZXR1cm4gZHJtX2VuY29k
ZXJfZmluZChjb25uZWN0b3ItPmRldiwgTlVMTCwgY29ubmVjdG9yLT5lbmNvZGVyX2lkc1swXSk7
CisJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOworCisJV0FSTl9PTihod2VpZ2h0MzIoY29u
bmVjdG9yLT5wb3NzaWJsZV9lbmNvZGVycykgPiAxKTsKKwlkcm1fY29ubmVjdG9yX2Zvcl9lYWNo
X3Bvc3NpYmxlX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyKQorCQlyZXR1cm4gZW5jb2RlcjsK
KworCXJldHVybiBOVUxMOwogfQogCiBzdGF0aWMgaW50IGhhbmRsZV9jb25mbGljdGluZ19lbmNv
ZGVycyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dF9tb2Rlc2V0LmMKaW5kZXggYzg5MjJiN2NhYzA5Li44OTViNzNmMjMwNzkgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMKQEAgLTQxNSw5ICs0MTUsOCBAQCBzdGF0aWMgYm9vbCBj
b25uZWN0b3JfaGFzX3Bvc3NpYmxlX2NydGMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
ciwKIAkJCQkJc3RydWN0IGRybV9jcnRjICpjcnRjKQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlcjsKLQlpbnQgaTsKIAotCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5j
b2Rlcihjb25uZWN0b3IsIGVuY29kZXIsIGkpIHsKKwlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bv
c3NpYmxlX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyKSB7CiAJCWlmIChlbmNvZGVyLT5wb3Nz
aWJsZV9jcnRjcyAmIGRybV9jcnRjX21hc2soY3J0YykpCiAJCQlyZXR1cm4gdHJ1ZTsKIAl9CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb25uZWN0b3IuYwppbmRleCA0Yzc2NjYyNGIyMGQuLjQzODk2YzcxMWI1MCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jCkBAIC0zNjUsOCArMzY1LDYgQEAgRVhQT1JUX1NZTUJPTChk
cm1fY29ubmVjdG9yX2F0dGFjaF9lZGlkX3Byb3BlcnR5KTsKIGludCBkcm1fY29ubmVjdG9yX2F0
dGFjaF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCQkJIHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIHsKLQlpbnQgaTsKLQogCS8qCiAJICogSW4gdGhlIHBh
c3QsIGRyaXZlcnMgaGF2ZSBhdHRlbXB0ZWQgdG8gbW9kZWwgdGhlIHN0YXRpYyBhc3NvY2lhdGlv
bgogCSAqIG9mIGNvbm5lY3RvciB0byBlbmNvZGVyIGluIHNpbXBsZSBjb25uZWN0b3IvZW5jb2Rl
ciBkZXZpY2VzIHVzaW5nIGEKQEAgLTM4MSwxOCArMzc5LDE1IEBAIGludCBkcm1fY29ubmVjdG9y
X2F0dGFjaF9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJaWYgKFdB
Uk5fT04oY29ubmVjdG9yLT5lbmNvZGVyKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShjb25uZWN0b3ItPmVuY29kZXJfaWRzKTsgaSsrKSB7Ci0JCWlm
IChjb25uZWN0b3ItPmVuY29kZXJfaWRzW2ldID09IDApIHsKLQkJCWNvbm5lY3Rvci0+ZW5jb2Rl
cl9pZHNbaV0gPSBlbmNvZGVyLT5iYXNlLmlkOwotCQkJcmV0dXJuIDA7Ci0JCX0KLQl9Ci0JcmV0
dXJuIC1FTk9NRU07CisJY29ubmVjdG9yLT5wb3NzaWJsZV9lbmNvZGVycyB8PSBkcm1fZW5jb2Rl
cl9tYXNrKGVuY29kZXIpOworCisJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9jb25u
ZWN0b3JfYXR0YWNoX2VuY29kZXIpOwogCiAvKioKLSAqIGRybV9jb25uZWN0b3JfaGFzX3Bvc3Np
YmxlX2VuY29kZXIgLSBjaGVjayBpZiB0aGUgY29ubmVjdG9yIGFuZCBlbmNvZGVyIGFyZSBhc3Nv
c2ljYXRlZCB3aXRoIGVhY2ggb3RoZXIKKyAqIGRybV9jb25uZWN0b3JfaGFzX3Bvc3NpYmxlX2Vu
Y29kZXIgLSBjaGVjayBpZiB0aGUgY29ubmVjdG9yIGFuZCBlbmNvZGVyIGFyZQorICogYXNzb2Np
YXRlZCB3aXRoIGVhY2ggb3RoZXIKICAqIEBjb25uZWN0b3I6IHRoZSBjb25uZWN0b3IKICAqIEBl
bmNvZGVyOiB0aGUgZW5jb2RlcgogICoKQEAgLTQwMiwxNSArMzk3LDcgQEAgRVhQT1JUX1NZTUJP
TChkcm1fY29ubmVjdG9yX2F0dGFjaF9lbmNvZGVyKTsKIGJvb2wgZHJtX2Nvbm5lY3Rvcl9oYXNf
cG9zc2libGVfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQkJCQlz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiB7Ci0Jc3RydWN0IGRybV9lbmNvZGVyICplbmM7
Ci0JaW50IGk7Ci0KLQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoY29u
bmVjdG9yLCBlbmMsIGkpIHsKLQkJaWYgKGVuYyA9PSBlbmNvZGVyKQotCQkJcmV0dXJuIHRydWU7
Ci0JfQotCi0JcmV0dXJuIGZhbHNlOworCXJldHVybiBjb25uZWN0b3ItPnBvc3NpYmxlX2VuY29k
ZXJzICYgZHJtX2VuY29kZXJfbWFzayhlbmNvZGVyKTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2Nv
bm5lY3Rvcl9oYXNfcG9zc2libGVfZW5jb2Rlcik7CiAKQEAgLTIxMjEsNyArMjEwOCw2IEBAIGlu
dCBkcm1fbW9kZV9nZXRjb25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0
YSwKIAlpbnQgZW5jb2RlcnNfY291bnQgPSAwOwogCWludCByZXQgPSAwOwogCWludCBjb3BpZWQg
PSAwOwotCWludCBpOwogCXN0cnVjdCBkcm1fbW9kZV9tb2RlaW5mbyB1X21vZGU7CiAJc3RydWN0
IGRybV9tb2RlX21vZGVpbmZvIF9fdXNlciAqbW9kZV9wdHI7CiAJdWludDMyX3QgX191c2VyICpl
bmNvZGVyX3B0cjsKQEAgLTIxMzYsMTQgKzIxMjIsMTMgQEAgaW50IGRybV9tb2RlX2dldGNvbm5l
Y3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCWlmICghY29ubmVjdG9y
KQogCQlyZXR1cm4gLUVOT0VOVDsKIAotCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVf
ZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIsIGkpCi0JCWVuY29kZXJzX2NvdW50Kys7CisJZW5j
b2RlcnNfY291bnQgPSBod2VpZ2h0MzIoY29ubmVjdG9yLT5wb3NzaWJsZV9lbmNvZGVycyk7CiAK
IAlpZiAoKG91dF9yZXNwLT5jb3VudF9lbmNvZGVycyA+PSBlbmNvZGVyc19jb3VudCkgJiYgZW5j
b2RlcnNfY291bnQpIHsKIAkJY29waWVkID0gMDsKIAkJZW5jb2Rlcl9wdHIgPSAodWludDMyX3Qg
X191c2VyICopKHVuc2lnbmVkIGxvbmcpKG91dF9yZXNwLT5lbmNvZGVyc19wdHIpOwogCi0JCWRy
bV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIs
IGkpIHsKKwkJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3Rv
ciwgZW5jb2RlcikgewogCQkJaWYgKHB1dF91c2VyKGVuY29kZXItPmJhc2UuaWQsIGVuY29kZXJf
cHRyICsgY29waWVkKSkgewogCQkJCXJldCA9IC1FRkFVTFQ7CiAJCQkJZ290byBvdXQ7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9wcm9iZV9oZWxwZXIuYwppbmRleCAzNTFjYmM0MGYwZjguLmE3Yzg3YWJlODhkMCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxwZXIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jCkBAIC05Myw3ICs5Myw2IEBAIGRybV9tb2Rl
X3ZhbGlkYXRlX3BpcGVsaW5lKHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAogCXN0cnVj
dCBkcm1fZGV2aWNlICpkZXYgPSBjb25uZWN0b3ItPmRldjsKIAllbnVtIGRybV9tb2RlX3N0YXR1
cyByZXQgPSBNT0RFX09LOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgaTsK
IAogCS8qIFN0ZXAgMTogVmFsaWRhdGUgYWdhaW5zdCBjb25uZWN0b3IgKi8KIAlyZXQgPSBkcm1f
Y29ubmVjdG9yX21vZGVfdmFsaWQoY29ubmVjdG9yLCBtb2RlKTsKQEAgLTEwMSw3ICsxMDAsNyBA
QCBkcm1fbW9kZV92YWxpZGF0ZV9waXBlbGluZShzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9k
ZSwKIAkJcmV0dXJuIHJldDsKIAogCS8qIFN0ZXAgMjogVmFsaWRhdGUgYWdhaW5zdCBlbmNvZGVy
cyBhbmQgY3J0Y3MgKi8KLQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIo
Y29ubmVjdG9yLCBlbmNvZGVyLCBpKSB7CisJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJs
ZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlcikgewogCQlzdHJ1Y3QgZHJtX2NydGMgKmNydGM7
CiAKIAkJcmV0ID0gZHJtX2VuY29kZXJfbW9kZV92YWxpZChlbmNvZGVyLCBtb2RlKTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKaW5kZXggNWU3NzhiNWYxYTEwLi42ODIyNjU1
NjA0NGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCkBAIC0xNjM4LDE2
ICsxNjM4LDYgQEAgc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIG1nYV92Z2FfbW9kZV92YWxp
ZChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCXJldHVybiBNT0RFX09LOwogfQog
Ci1zdGF0aWMgc3RydWN0IGRybV9lbmNvZGVyICptZ2FfY29ubmVjdG9yX2Jlc3RfZW5jb2Rlcihz
dHJ1Y3QgZHJtX2Nvbm5lY3RvcgotCQkJCQkJICAqY29ubmVjdG9yKQotewotCWludCBlbmNfaWQg
PSBjb25uZWN0b3ItPmVuY29kZXJfaWRzWzBdOwotCS8qIHBpY2sgdGhlIGVuY29kZXIgaWRzICov
Ci0JaWYgKGVuY19pZCkKLQkJcmV0dXJuIGRybV9lbmNvZGVyX2ZpbmQoY29ubmVjdG9yLT5kZXYs
IE5VTEwsIGVuY19pZCk7Ci0JcmV0dXJuIE5VTEw7Ci19Ci0KIHN0YXRpYyB2b2lkIG1nYV9jb25u
ZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVj
dCBtZ2FfY29ubmVjdG9yICptZ2FfY29ubmVjdG9yID0gdG9fbWdhX2Nvbm5lY3Rvcihjb25uZWN0
b3IpOwpAQCAtMTY1OSw3ICsxNjQ5LDYgQEAgc3RhdGljIHZvaWQgbWdhX2Nvbm5lY3Rvcl9kZXN0
cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIG1nYV92Z2FfY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyA9IHsKIAkuZ2V0X21vZGVzID0gbWdhX3ZnYV9nZXRfbW9kZXMsCiAJLm1vZGVfdmFsaWQgPSBt
Z2FfdmdhX21vZGVfdmFsaWQsCi0JLmJlc3RfZW5jb2RlciA9IG1nYV9jb25uZWN0b3JfYmVzdF9l
bmNvZGVyLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIG1n
YV92Z2FfY29ubmVjdG9yX2Z1bmNzID0gewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52MDQvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQv
ZGlzcC5jCmluZGV4IGRjNjQ4NjNiNWZkOC4uNDRlZTgyZDBjOWI2IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9kaXNwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52MDQvZGlzcC5jCkBAIC0yNTYsNyArMjU2LDcgQEAgbnYwNF9kaXNwbGF5
X2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9z
YWZlKGNvbm5lY3RvciwgY3QsCiAJCQkJICZkZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rvcl9saXN0
LCBoZWFkKSB7Ci0JCWlmICghY29ubmVjdG9yLT5lbmNvZGVyX2lkc1swXSkgeworCQlpZiAoIWNv
bm5lY3Rvci0+cG9zc2libGVfZW5jb2RlcnMpIHsKIAkJCU5WX1dBUk4oZHJtLCAiJXMgaGFzIG5v
IGVuY29kZXJzLCByZW1vdmluZ1xuIiwKIAkJCQljb25uZWN0b3ItPm5hbWUpOwogCQkJY29ubmVj
dG9yLT5mdW5jcy0+ZGVzdHJveShjb25uZWN0b3IpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jCmluZGV4IDMwNzU4NDEwN2Q3Ny4uOThjODcxOTVkNzExIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCkBAIC0yMzkxLDcgKzIzOTEsNyBAQCBudjUw
X2Rpc3BsYXlfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAKIAkvKiBjdWxsIGFueSBj
b25uZWN0b3JzIHdlIGNyZWF0ZWQgdGhhdCBkb24ndCBoYXZlIGFuIGVuY29kZXIgKi8KIAlsaXN0
X2Zvcl9lYWNoX2VudHJ5X3NhZmUoY29ubmVjdG9yLCB0bXAsICZkZXYtPm1vZGVfY29uZmlnLmNv
bm5lY3Rvcl9saXN0LCBoZWFkKSB7Ci0JCWlmIChjb25uZWN0b3ItPmVuY29kZXJfaWRzWzBdKQor
CQlpZiAoY29ubmVjdG9yLT5wb3NzaWJsZV9lbmNvZGVycykKIAkJCWNvbnRpbnVlOwogCiAJCU5W
X1dBUk4oZHJtLCAiJXMgaGFzIG5vIGVuY29kZXJzLCByZW1vdmluZ1xuIiwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCmluZGV4IDU2ODcxZDM0ZTNmYi4uM2E1
ZGIxN2JjNWM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nv
bm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9y
LmMKQEAgLTM2NSw5ICszNjUsOCBAQCBmaW5kX2VuY29kZXIoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciwgaW50IHR5cGUpCiB7CiAJc3RydWN0IG5vdXZlYXVfZW5jb2RlciAqbnZfZW5j
b2RlcjsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuYzsKLQlpbnQgaTsKIAotCWRybV9jb25uZWN0
b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuYywgaSkgeworCWRybV9j
b25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuYykgewogCQlu
dl9lbmNvZGVyID0gbm91dmVhdV9lbmNvZGVyKGVuYyk7CiAKIAkJaWYgKHR5cGUgPT0gRENCX09V
VFBVVF9BTlkgfHwKQEAgLTQxNCwxMCArNDEzLDEwIEBAIG5vdXZlYXVfY29ubmVjdG9yX2RkY19k
ZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2ID0gY29ubmVjdG9yLT5kZXY7CiAJc3RydWN0IG5vdXZlYXVfZW5jb2RlciAqbnZfZW5j
b2RlciA9IE5VTEwsICpmb3VuZCA9IE5VTEw7CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
OwotCWludCBpLCByZXQ7CisJaW50IHJldDsKIAlib29sIHN3aXRjaGVyb29fZGRjID0gZmFsc2U7
CiAKLQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoY29ubmVjdG9yLCBl
bmNvZGVyLCBpKSB7CisJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNv
bm5lY3RvciwgZW5jb2RlcikgewogCQludl9lbmNvZGVyID0gbm91dmVhdV9lbmNvZGVyKGVuY29k
ZXIpOwogCiAJCXN3aXRjaCAobnZfZW5jb2Rlci0+ZGNiLT50eXBlKSB7CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMKaW5kZXggYjY4NGNkNzE5NjEyLi5jMDc0Mjdk
M2MxOTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3Rv
cnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMKQEAg
LTI0OSwxMSArMjQ5LDEwIEBAIHJhZGVvbl9jb25uZWN0b3JfdXBkYXRlX3NjcmF0Y2hfcmVncyhz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBlbnVtIGRybV9jCiAJc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyOwogCWNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyAqY29ubmVjdG9yX2Z1bmNzID0gY29ubmVjdG9yLT5oZWxwZXJfcHJpdmF0ZTsKIAlib29sIGNv
bm5lY3RlZDsKLQlpbnQgaTsKIAogCWJlc3RfZW5jb2RlciA9IGNvbm5lY3Rvcl9mdW5jcy0+YmVz
dF9lbmNvZGVyKGNvbm5lY3Rvcik7CiAKLQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxl
X2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyLCBpKSB7CisJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFj
aF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlcikgewogCQlpZiAoKGVuY29kZXIg
PT0gYmVzdF9lbmNvZGVyKSAmJiAoc3RhdHVzID09IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVk
KSkKIAkJCWNvbm5lY3RlZCA9IHRydWU7CiAJCWVsc2UKQEAgLTI2OSw5ICsyNjgsOCBAQCByYWRl
b25fY29ubmVjdG9yX3VwZGF0ZV9zY3JhdGNoX3JlZ3Moc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvciwgZW51bSBkcm1fYwogc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqcmFkZW9uX2Zp
bmRfZW5jb2RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBpbnQgZW5jb2Rlcl90
eXBlKQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgaTsKIAotCWRybV9j
b25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIsIGkp
IHsKKwlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoY29ubmVjdG9yLCBl
bmNvZGVyKSB7CiAJCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0gZW5jb2Rlcl90eXBlKQog
CQkJcmV0dXJuIGVuY29kZXI7CiAJfQpAQCAtMzgwLDEwICszNzgsOSBAQCBzdGF0aWMgaW50IHJh
ZGVvbl9kZGNfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiBzdGF0
aWMgc3RydWN0IGRybV9lbmNvZGVyICpyYWRlb25fYmVzdF9zaW5nbGVfZW5jb2RlcihzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
cjsKLQlpbnQgaTsKIAogCS8qIHBpY2sgdGhlIGZpcnN0IG9uZSAqLwotCWRybV9jb25uZWN0b3Jf
Zm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIsIGkpCisJZHJtX2Nv
bm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlcikKIAkJ
cmV0dXJuIGVuY29kZXI7CiAKIAlyZXR1cm4gTlVMTDsKQEAgLTQyOCwxNCArNDI1LDEzIEBAIHJh
ZGVvbl9jb25uZWN0b3JfYW5hbG9nX2VuY29kZXJfY29uZmxpY3Rfc29sdmUoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwKIAogCWxpc3RfZm9yX2VhY2hfZW50cnkoY29uZmxpY3QsICZk
ZXYtPm1vZGVfY29uZmlnLmNvbm5lY3Rvcl9saXN0LCBoZWFkKSB7CiAJCXN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jOwotCQlpbnQgaTsKIAogCQlpZiAoY29uZmxpY3QgPT0gY29ubmVjdG9yKQogCQkJ
Y29udGludWU7CiAKIAkJcmFkZW9uX2NvbmZsaWN0ID0gdG9fcmFkZW9uX2Nvbm5lY3Rvcihjb25m
bGljdCk7CiAKLQkJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbmZs
aWN0LCBlbmMsIGkpIHsKKwkJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVy
KGNvbmZsaWN0LCBlbmMpIHsKIAkJCS8qIGlmIHRoZSBJRHMgbWF0Y2ggKi8KIAkJCWlmIChlbmMg
PT0gZW5jb2RlcikgewogCQkJCWlmIChjb25mbGljdC0+c3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0
dXNfY29ubmVjdGVkKQpAQCAtMTM2Myw5ICsxMzU5LDcgQEAgcmFkZW9uX2R2aV9kZXRlY3Qoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKIAogCS8qIGZpbmQgYW5h
bG9nIGVuY29kZXIgKi8KIAlpZiAocmFkZW9uX2Nvbm5lY3Rvci0+ZGFjX2xvYWRfZGV0ZWN0KSB7
Ci0JCWludCBpOwotCi0JCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihj
b25uZWN0b3IsIGVuY29kZXIsIGkpIHsKKwkJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJs
ZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlcikgewogCQkJaWYgKGVuY29kZXItPmVuY29kZXJf
dHlwZSAhPSBEUk1fTU9ERV9FTkNPREVSX0RBQyAmJgogCQkJICAgIGVuY29kZXItPmVuY29kZXJf
dHlwZSAhPSBEUk1fTU9ERV9FTkNPREVSX1RWREFDKQogCQkJCWNvbnRpbnVlOwpAQCAtMTQ0Myw5
ICsxNDM3LDggQEAgc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlciAqcmFkZW9uX2R2aV9lbmNvZGVy
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7CiAJc3RydWN0IHJhZGVvbl9jb25u
ZWN0b3IgKnJhZGVvbl9jb25uZWN0b3IgPSB0b19yYWRlb25fY29ubmVjdG9yKGNvbm5lY3Rvcik7
CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwotCWludCBpOwogCi0JZHJtX2Nvbm5lY3Rv
cl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlciwgaSkgeworCWRy
bV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIp
IHsKIAkJaWYgKHJhZGVvbl9jb25uZWN0b3ItPnVzZV9kaWdpdGFsID09IHRydWUpIHsKIAkJCWlm
IChlbmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9UTURTKQogCQkJCXJl
dHVybiBlbmNvZGVyOwpAQCAtMTQ2MCw3ICsxNDUzLDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZW5j
b2RlciAqcmFkZW9uX2R2aV9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ip
CiAKIAkvKiB0aGVuIGNoZWNrIHVzZSBkaWdpdGlhbCAqLwogCS8qIHBpY2sgdGhlIGZpcnN0IG9u
ZSAqLwotCWRybV9jb25uZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3Is
IGVuY29kZXIsIGkpCisJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNv
bm5lY3RvciwgZW5jb2RlcikKIAkJcmV0dXJuIGVuY29kZXI7CiAKIAlyZXR1cm4gTlVMTDsKQEAg
LTE2MDMsOSArMTU5Niw4IEBAIHUxNiByYWRlb25fY29ubmVjdG9yX2VuY29kZXJfZ2V0X2RwX2Jy
aWRnZV9lbmNvZGVyX2lkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uCiB7CiAJc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyOwogCXN0cnVjdCByYWRlb25fZW5jb2RlciAqcmFkZW9uX2VuY29k
ZXI7Ci0JaW50IGk7CiAKLQlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIo
Y29ubmVjdG9yLCBlbmNvZGVyLCBpKSB7CisJZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJs
ZV9lbmNvZGVyKGNvbm5lY3RvciwgZW5jb2RlcikgewogCQlyYWRlb25fZW5jb2RlciA9IHRvX3Jh
ZGVvbl9lbmNvZGVyKGVuY29kZXIpOwogCiAJCXN3aXRjaCAocmFkZW9uX2VuY29kZXItPmVuY29k
ZXJfaWQpIHsKQEAgLTE2MjQsMTAgKzE2MTYsOSBAQCBzdGF0aWMgYm9vbCByYWRlb25fY29ubmVj
dG9yX2VuY29kZXJfaXNfaGJyMihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewog
CXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAlzdHJ1Y3QgcmFkZW9uX2VuY29kZXIgKnJh
ZGVvbl9lbmNvZGVyOwotCWludCBpOwogCWJvb2wgZm91bmQgPSBmYWxzZTsKIAotCWRybV9jb25u
ZWN0b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29kZXIsIGkpIHsK
Kwlkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIoY29ubmVjdG9yLCBlbmNv
ZGVyKSB7CiAJCXJhZGVvbl9lbmNvZGVyID0gdG9fcmFkZW9uX2VuY29kZXIoZW5jb2Rlcik7CiAJ
CWlmIChyYWRlb25fZW5jb2Rlci0+Y2FwcyAmIEFUT01fRU5DT0RFUl9DQVBfUkVDT1JEX0hCUjIp
CiAJCQlmb3VuZCA9IHRydWU7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9j
b25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Nvbm5lY3Rvci5jCmluZGV4IGRk
YjYxYTYwYzYxMC4uYjRhZTNlODlhN2I0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9jb25uZWN0b3Iu
YwpAQCAtOTAsMTMgKzkwLDYgQEAgdWRsX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yLCBib29sIGZvcmNlKQogCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3RlZDsK
IH0KIAotc3RhdGljIHN0cnVjdCBkcm1fZW5jb2RlcioKLXVkbF9iZXN0X3NpbmdsZV9lbmNvZGVy
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCi17Ci0JaW50IGVuY19pZCA9IGNvbm5l
Y3Rvci0+ZW5jb2Rlcl9pZHNbMF07Ci0JcmV0dXJuIGRybV9lbmNvZGVyX2ZpbmQoY29ubmVjdG9y
LT5kZXYsIE5VTEwsIGVuY19pZCk7Ci19Ci0KIHN0YXRpYyBpbnQgdWRsX2Nvbm5lY3Rvcl9zZXRf
cHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJCQkgICAgICBzdHJ1
Y3QgZHJtX3Byb3BlcnR5ICpwcm9wZXJ0eSwKIAkJCQkgICAgICB1aW50NjRfdCB2YWwpCkBAIC0x
MjAsNyArMTEzLDYgQEAgc3RhdGljIHZvaWQgdWRsX2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBk
cm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzIHVkbF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRfbW9k
ZXMgPSB1ZGxfZ2V0X21vZGVzLAogCS5tb2RlX3ZhbGlkID0gdWRsX21vZGVfdmFsaWQsCi0JLmJl
c3RfZW5jb2RlciA9IHVkbF9iZXN0X3NpbmdsZV9lbmNvZGVyLAogfTsKIAogc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIHVkbF9jb25uZWN0b3JfZnVuY3MgPSB7CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmgKaW5kZXggNjgxY2I1OTBmOTUyLi5jNmU5OTNlNzhkYmQgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9y
LmgKQEAgLTEyODgsMTIgKzEyODgsMTIgQEAgc3RydWN0IGRybV9jb25uZWN0b3IgewogCS8qKiBA
b3ZlcnJpZGVfZWRpZDogaGFzIHRoZSBFRElEIGJlZW4gb3ZlcndyaXR0ZW4gdGhyb3VnaCBkZWJ1
Z2ZzIGZvciB0ZXN0aW5nPyAqLwogCWJvb2wgb3ZlcnJpZGVfZWRpZDsKIAotI2RlZmluZSBEUk1f
Q09OTkVDVE9SX01BWF9FTkNPREVSIDMKIAkvKioKLQkgKiBAZW5jb2Rlcl9pZHM6IFZhbGlkIGVu
Y29kZXJzIGZvciB0aGlzIGNvbm5lY3Rvci4gUGxlYXNlIG9ubHkgdXNlCi0JICogZHJtX2Nvbm5l
Y3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKCkgdG8gZW51bWVyYXRlIHRoZXNlLgorCSAq
IEBwb3NzaWJsZV9lbmNvZGVyczogQml0IG1hc2sgb2YgZW5jb2RlcnMgdGhhdCBjYW4gZHJpdmUg
dGhpcworCSAqIGNvbm5lY3RvciwgZHJtX2VuY29kZXJfaW5kZXgoKSBkZXRlcm1pbmVzIHRoZSBp
bmRleCBpbnRvIHRoZSBiaXRmaWVsZAorCSAqIGFuZCB0aGUgYml0cyBhcmUgc2V0IHdpdGggZHJt
X2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcigpLgogCSAqLwotCXVpbnQzMl90IGVuY29kZXJfaWRz
W0RSTV9DT05ORUNUT1JfTUFYX0VOQ09ERVJdOworCXUzMiBwb3NzaWJsZV9lbmNvZGVyczsKIAog
CS8qKgogCSAqIEBlbmNvZGVyOiBDdXJyZW50bHkgYm91bmQgZW5jb2RlciBkcml2aW5nIHRoaXMg
Y29ubmVjdG9yLCBpZiBhbnkuCkBAIC0xNjA4LDEzICsxNjA4LDkgQEAgYm9vbCBkcm1fY29ubmVj
dG9yX2hhc19wb3NzaWJsZV9lbmNvZGVyKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Is
CiAgKiBkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3NpYmxlX2VuY29kZXIgLSBpdGVyYXRlIGNv
bm5lY3RvcidzIHBvc3NpYmxlIGVuY29kZXJzCiAgKiBAY29ubmVjdG9yOiAmc3RydWN0IGRybV9j
b25uZWN0b3IgcG9pbnRlcgogICogQGVuY29kZXI6ICZzdHJ1Y3QgZHJtX2VuY29kZXIgcG9pbnRl
ciB1c2VkIGFzIGN1cnNvcgotICogQF9faTogaW50IGl0ZXJhdGlvbiBjdXJzb3IsIGZvciBtYWNy
by1pbnRlcm5hbCB1c2UKICAqLwotI2RlZmluZSBkcm1fY29ubmVjdG9yX2Zvcl9lYWNoX3Bvc3Np
YmxlX2VuY29kZXIoY29ubmVjdG9yLCBlbmNvZGVyLCBfX2kpIFwKLQlmb3IgKChfX2kpID0gMDsg
KF9faSkgPCBBUlJBWV9TSVpFKChjb25uZWN0b3IpLT5lbmNvZGVyX2lkcykgJiYgXAotCQkgICAg
IChjb25uZWN0b3IpLT5lbmNvZGVyX2lkc1soX19pKV0gIT0gMDsgKF9faSkrKykgXAotCQlmb3Jf
ZWFjaF9pZigoZW5jb2RlcikgPSBcCi0JCQkgICAgZHJtX2VuY29kZXJfZmluZCgoY29ubmVjdG9y
KS0+ZGV2LCBOVUxMLCBcCi0JCQkJCSAgICAgKGNvbm5lY3RvciktPmVuY29kZXJfaWRzWyhfX2kp
XSkpIFwKKyNkZWZpbmUgZHJtX2Nvbm5lY3Rvcl9mb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKGNv
bm5lY3RvciwgZW5jb2RlcikgXAorCWRybV9mb3JfZWFjaF9lbmNvZGVyX21hc2soZW5jb2Rlciwg
KGNvbm5lY3RvciktPmRldiwgXAorCQkJCSAgKGNvbm5lY3RvciktPnBvc3NpYmxlX2VuY29kZXJz
KQogCiAjZW5kaWYKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1
