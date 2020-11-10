Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E152AE64C
	for <lists+nouveau@lfdr.de>; Wed, 11 Nov 2020 03:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AE989518;
	Wed, 11 Nov 2020 02:19:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECE189AC6;
 Tue, 10 Nov 2020 13:36:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65E00ABD6;
 Tue, 10 Nov 2020 13:36:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 michael.j.ruhl@intel.com, christian.koenig@amd.com
Date: Tue, 10 Nov 2020 14:36:55 +0100
Message-Id: <20201110133655.13174-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 02:19:32 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: Fix out-of-bounds access when
 deferencing MMU type
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, virtualization@lists.linux-foundation.org,
 Roland Scheidegger <sroland@vmware.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Likun Gao <Likun.Gao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIHZhbHVlIG9mIHN0cnVjdCBkcm1fZGV2aWNlLnR0bS50eXBlX3ZyYW0gY2FuIGJlY29tZSAt
MSBmb3IgdW5rbm93bgp0eXBlcyBvZiBtZW1vcnkgKHNlZSBub3V2ZWF1X3R0bV9pbml0KCkpLiBU
aGlzIGxlYWRzIHRvIGFuIG91dC1vZi1ib3VuZHMKZXJyb3Igd2hlbiBhY2Nlc3Npbmcgc3RydWN0
IG52aWZfbW11LnR5cGVbXToKCiAgWyAgIDE4LjMwNDExNl0gPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAgWyAgIDE4LjMx
MTY0OV0gQlVHOiBLQVNBTjogc2xhYi1vdXQtb2YtYm91bmRzIGluIG5vdXZlYXVfdHRtX2lvX21l
bV9yZXNlcnZlKzB4MTdhLzB4N2UwIFtub3V2ZWF1XQogIFsgICAxOC4zMjA0MTVdIFJlYWQgb2Yg
c2l6ZSAxIGF0IGFkZHIgZmZmZjg4ODEwZmZhYzFmZSBieSB0YXNrIHN5c3RlbWQtdWRldmQvMzQy
CiAgWyAgIDE4LjMyNzY4MV0KICBbICAgMTguMzI5MjA4XSBDUFU6IDEgUElEOiAzNDIgQ29tbTog
c3lzdGVtZC11ZGV2ZCBUYWludGVkOiBHICAgICAgICAgICAgRSAgICAgNS4xMC4wLXJjMi0xLWRl
ZmF1bHQrICM1ODEKICBbICAgMTguMzM4NjgxXSBIYXJkd2FyZSBuYW1lOiBEZWxsIEluYy4gT3B0
aVBsZXggOTAyMC8wTjRZQzgsIEJJT1MgQTI0IDEwLzI0LzIwMTgKICBbICAgMTguMzQ2MDMyXSBD
YWxsIFRyYWNlOgogIFsgICAxOC4zNDg1MzZdICBkdW1wX3N0YWNrKzB4YWUvMHhlNQogIFsgICAx
OC4zNTE5MTldICBwcmludF9hZGRyZXNzX2Rlc2NyaXB0aW9uLmNvbnN0cHJvcC4wKzB4MTcvMHhm
MAogIFsgICAxOC4zNTc3ODddICA/IG5vdXZlYXVfdHRtX2lvX21lbV9yZXNlcnZlKzB4MTdhLzB4
N2UwIFtub3V2ZWF1XQogIFsgICAxOC4zNjM4MThdICBfX2thc2FuX3JlcG9ydC5jb2xkKzB4MjAv
MHgzOAogIFsgICAxOC4zNjgwOTldICA/IG5vdXZlYXVfdHRtX2lvX21lbV9yZXNlcnZlKzB4MTdh
LzB4N2UwIFtub3V2ZWF1XQogIFsgICAxOC4zNzQxMzNdICBrYXNhbl9yZXBvcnQrMHgzYS8weDUw
CiAgWyAgIDE4LjM3Nzc4OV0gIG5vdXZlYXVfdHRtX2lvX21lbV9yZXNlcnZlKzB4MTdhLzB4N2Uw
IFtub3V2ZWF1XQogIDwuLi4+CiAgWyAgIDE4Ljc2NzY5MF0gQWxsb2NhdGVkIGJ5IHRhc2sgMzQy
OgogIFsgICAxOC43NzMwODddICBrYXNhbl9zYXZlX3N0YWNrKzB4MWIvMHg0MAogIFsgICAxOC43
Nzg4OTBdICBfX2thc2FuX2ttYWxsb2MuY29uc3Rwcm9wLjArMHhiZi8weGQwCiAgWyAgIDE4Ljc4
NTY0Nl0gIF9fa21hbGxvY190cmFja19jYWxsZXIrMHgxYmUvMHgzOTAKICBbICAgMTguNzkyMTY1
XSAga3N0cmR1cF9jb25zdCsweDQ2LzB4NzAKICBbICAgMTguNzk3Njg2XSAga29iamVjdF9zZXRf
bmFtZV92YXJncysweDJmLzB4YjAKICBbICAgMTguODAzOTkyXSAga29iamVjdF9pbml0X2FuZF9h
ZGQrMHg5ZC8weGYwCiAgWyAgIDE4LjgxMDExN10gIHR0bV9tZW1fZ2xvYmFsX2luaXQrMHgxMmMv
MHgyMTAgW3R0bV0KICBbICAgMTguODE2ODUzXSAgdHRtX2JvX2dsb2JhbF9pbml0KzB4NGEvMHgx
NjAgW3R0bV0KICBbICAgMTguODIzNDIwXSAgdHRtX2JvX2RldmljZV9pbml0KzB4MzkvMHgyMjAg
W3R0bV0KICBbICAgMTguODMwMDQ2XSAgbm91dmVhdV90dG1faW5pdCsweDJjMy8weDgzMCBbbm91
dmVhdV0KICBbICAgMTguODM2OTI5XSAgbm91dmVhdV9kcm1fZGV2aWNlX2luaXQrMHgxYjQvMHgz
ZjAgW25vdXZlYXVdCiAgPC4uLj4KICBbICAgMTkuMTA1MzM2XSA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCkZpeCB0aGlz
IGVycm9yLCBieSBub3QgdXNpbmcgdHlwZV92cmFtIGFzIGFuIGluZGV4IGlmIGl0J3MgbmVnYXRp
dmUuCkFzc3VtZSBkZWZhdWx0IHZhbHVlcyBpbnN0ZWFkLgoKVGhlIGVycm9yIHdhcyBzZWVuIG9u
IE52aWRpYSBHNzIgaGFyZHdhcmUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KRml4ZXM6IDFjZjY1YzQ1MTgzYSAoImRybS90dG06IGFkZCBj
YWNoaW5nIHN0YXRlIHRvIHR0bV9idXNfcGxhY2VtZW50IikKQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5q
LnJ1aGxAaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBWTXdhcmUgR3JhcGhpY3Mg
PGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KQ2M6IFJvbGFuZCBTY2hlaWRl
Z2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgpDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4KQ2M6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpDYzogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+CkNjOiBMaWt1biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPgpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCkNjOiBzcGljZS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIHwgNSArKysrLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA4MTMzMzc3ZDg2NWQuLmZlMTUyOTlkNDE3ZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTE0Miw5ICsxMTQyLDEyIEBA
IG5vdXZlYXVfdHRtX2lvX21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBz
dHJ1Y3QgdHRtX3Jlc291cmNlICpyZWcpCiAJc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2UgPSBu
dnh4X2RldmljZSgmZHJtLT5jbGllbnQuZGV2aWNlKTsKIAlzdHJ1Y3Qgbm91dmVhdV9tZW0gKm1l
bSA9IG5vdXZlYXVfbWVtKHJlZyk7CiAJc3RydWN0IG52aWZfbW11ICptbXUgPSAmZHJtLT5jbGll
bnQubW11OwotCWNvbnN0IHU4IHR5cGUgPSBtbXUtPnR5cGVbZHJtLT50dG0udHlwZV92cmFtXS50
eXBlOworCXU4IHR5cGUgPSAwOwogCWludCByZXQ7CiAKKwlpZiAoZHJtLT50dG0udHlwZV92cmFt
ID49IDApCisJCXR5cGUgPSBtbXUtPnR5cGVbZHJtLT50dG0udHlwZV92cmFtXS50eXBlOworCiAJ
bXV0ZXhfbG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRleCk7CiByZXRyeToKIAlzd2l0Y2gg
KHJlZy0+bWVtX3R5cGUpIHsKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cg==
