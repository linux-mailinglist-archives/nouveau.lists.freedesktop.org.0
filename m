Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539923B5131
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9436E198;
	Sun, 27 Jun 2021 03:34:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7B3C6E593;
 Tue, 22 Jun 2021 15:25:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C59731B;
 Tue, 22 Jun 2021 08:25:06 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1ECC3F718;
 Tue, 22 Jun 2021 08:25:05 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 7C5A86837C9; Tue, 22 Jun 2021 16:25:04 +0100 (BST)
Date: Tue, 22 Jun 2021 16:25:04 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-5-tzimmermann@suse.de>
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH v2 04/22] drm: Don't test for IRQ support in
 VBLANK ioctls
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
Cc: heiko@sntech.de, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 john.stultz@linaro.org, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com,
 tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 Xinhui.Pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 tiantao6@hisilicon.com, shawnguo@kernel.org, brian.starkey@arm.com,
 zackr@vmware.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGVsbG8sCgpPbiBUdWUsIEp1biAyMiwgMjAyMSBhdCAwNDowOTo0NFBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPiBGb3IgS01TIGRyaXZlcnMsIHJlcGxhY2UgdGhlIElSUSBjaGVj
ayBpbiBWQkxBTksgaW9jdGxzIHdpdGggYSBjaGVjayBmb3IKPiB2Ymxhbmsgc3VwcG9ydC4gSVJR
cyBtaWdodCBiZSBlbmFibGVkIHd0aG91dCB2YmxhbmtpbmcgYmVpbmcgc3VwcG9ydGVkLgo+IAo+
IFRoaXMgY2hhbmdlIGFsc28gcmVtb3ZlcyB0aGUgRFJNIGZyYW1ld29yaydzIG9ubHkgZGVwZW5k
ZW5jeSBvbiBJUlEgc3RhdGUKPiBmb3Igbm9uLWxlZ2FjeSBkcml2ZXJzLiBGb3IgbGVnYWN5IGRy
aXZlcnMgd2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcsCj4gdGhlIG9yaWdpbmFsIHRlc3QgcmVt
YWlucyBpbiBkcm1fd2FpdF92YmxhbmtfaW9jdGwoKS4KPiAKPiB2MjoKPiAJKiBrZWVwIHRoZSBv
bGQgdGVzdCBmb3IgbGVnYWN5IGRyaXZlcnMgaW4KPiAJICBkcm1fd2FpdF92YmxhbmtfaW9jdGwo
KSAoRGFuaWVsKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jICAgIHwgMTAg
KysrLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIHwgMTMgKysrKysrKysr
LS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9pcnEuYwo+IGluZGV4IGMzYmQ2NjRlYTczMy4uMWQ3Nzg1NzIxMzIzIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2lycS5jCj4gQEAgLTc0LDEwICs3NCw4IEBACj4gICAqIG9ubHkgc3VwcG9ydHMgZGV2
aWNlcyB3aXRoIGEgc2luZ2xlIGludGVycnVwdCBvbiB0aGUgbWFpbiBkZXZpY2Ugc3RvcmVkIGlu
Cj4gICAqICZkcm1fZGV2aWNlLmRldiBhbmQgc2V0IGFzIHRoZSBkZXZpY2UgcGFyYW10ZXIgaW4g
ZHJtX2Rldl9hbGxvYygpLgo+ICAgKgo+IC0gKiBUaGVzZSBJUlEgaGVscGVycyBhcmUgc3RyaWN0
bHkgb3B0aW9uYWwuIERyaXZlcnMgd2hpY2ggcm9sbCB0aGVpciBvd24gb25seQo+IC0gKiBuZWVk
IHRvIHNldCAmZHJtX2RldmljZS5pcnFfZW5hYmxlZCB0byBzaWduYWwgdGhlIERSTSBjb3JlIHRo
YXQgdmJsYW5rCj4gLSAqIGludGVycnVwdHMgYXJlIHdvcmtpbmcuIFNpbmNlIHRoZXNlIGhlbHBl
cnMgZG9uJ3QgYXV0b21hdGljYWxseSBjbGVhbiB1cCB0aGUKPiAtICogcmVxdWVzdGVkIGludGVy
cnVwdCBsaWtlIGUuZy4gZGV2bV9yZXF1ZXN0X2lycSgpIHRoZXkncmUgbm90IHJlYWxseQo+ICsg
KiBUaGVzZSBJUlEgaGVscGVycyBhcmUgc3RyaWN0bHkgb3B0aW9uYWwuIFNpbmNlIHRoZXNlIGhl
bHBlcnMgZG9uJ3QgYXV0b21hdGljYWxseQo+ICsgKiBjbGVhbiB1cCB0aGUgcmVxdWVzdGVkIGlu
dGVycnVwdCBsaWtlIGUuZy4gZGV2bV9yZXF1ZXN0X2lycSgpIHRoZXkncmUgbm90IHJlYWxseQo+
ICAgKiByZWNvbW1lbmRlZC4KPiAgICovCj4gIAo+IEBAIC05MSw5ICs4OSw3IEBACj4gICAqIGFu
ZCBhZnRlciB0aGUgaW5zdGFsbGF0aW9uLgo+ICAgKgo+ICAgKiBUaGlzIGlzIHRoZSBzaW1wbGlm
aWVkIGhlbHBlciBpbnRlcmZhY2UgcHJvdmlkZWQgZm9yIGRyaXZlcnMgd2l0aCBubyBzcGVjaWFs
Cj4gLSAqIG5lZWRzLiBEcml2ZXJzIHdoaWNoIG5lZWQgdG8gaW5zdGFsbCBpbnRlcnJ1cHQgaGFu
ZGxlcnMgZm9yIG11bHRpcGxlCj4gLSAqIGludGVycnVwdHMgbXVzdCBpbnN0ZWFkIHNldCAmZHJt
X2RldmljZS5pcnFfZW5hYmxlZCB0byBzaWduYWwgdGhlIERSTSBjb3JlCj4gLSAqIHRoYXQgdmJs
YW5rIGludGVycnVwdHMgYXJlIGF2YWlsYWJsZS4KPiArICogbmVlZHMuCj4gICAqCj4gICAqIEBp
cnEgbXVzdCBtYXRjaCB0aGUgaW50ZXJydXB0IG51bWJlciB0aGF0IHdvdWxkIGJlIHBhc3NlZCB0
byByZXF1ZXN0X2lycSgpLAo+ICAgKiBpZiBjYWxsZWQgZGlyZWN0bHkgaW5zdGVhZCBvZiB1c2lu
ZyB0aGlzIGhlbHBlciBmdW5jdGlvbi4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiBpbmRleCAzNDE3ZTFh
Yzc5MTguLmE5OGE0YWFkNTAzNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3Zi
bGFuay5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IEBAIC0xNzQ4LDgg
KzE3NDgsMTMgQEAgaW50IGRybV93YWl0X3ZibGFua19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLAo+ICAJdW5zaWduZWQgaW50IHBpcGVfaW5kZXg7Cj4gIAl1bnNpZ25l
ZCBpbnQgZmxhZ3MsIHBpcGUsIGhpZ2hfcGlwZTsKPiAgCj4gLQlpZiAoIWRldi0+aXJxX2VuYWJs
ZWQpCj4gLQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsJaWYgIChkcm1fY29yZV9jaGVja19mZWF0
dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKSB7Cj4gKwkJaWYgKCFkcm1fZGV2X2hhc192Ymxhbmso
ZGV2KSkKPiArCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsJfSBlbHNlIHsKPiArCQlpZiAoIWRl
di0+aXJxX2VuYWJsZWQpCj4gKwkJCXJldHVybiAtRU9QTk9UU1VQUDsKPiArCX0KCkZvciBhIHN5
c3RlbSBjYWxsIHRoYXQgaXMgdXNlZCBxdWl0ZSBhIGxvdCBieSB1c2Vyc3BhY2Ugd2UgaGF2ZSBp
bmNyZWFzZWQgdGhlIGNvZGUgc2l6ZQppbiBhIG5vdGljZWFibGUgd2F5LiBDYW4gd2Ugbm90IGNh
Y2hlIGl0IHByaXZhdGVseT8KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gIAo+ICAJaWYgKHZibHdh
aXQtPnJlcXVlc3QudHlwZSAmIF9EUk1fVkJMQU5LX1NJR05BTCkKPiAgCQlyZXR1cm4gLUVJTlZB
TDsKPiBAQCAtMjAyMyw3ICsyMDI4LDcgQEAgaW50IGRybV9jcnRjX2dldF9zZXF1ZW5jZV9pb2N0
bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJaWYgKCFkcm1fY29yZV9j
aGVja19mZWF0dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQ
UDsKPiAgCj4gLQlpZiAoIWRldi0+aXJxX2VuYWJsZWQpCj4gKwlpZiAoIWRybV9kZXZfaGFzX3Zi
bGFuayhkZXYpKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gIAljcnRjID0gZHJtX2Ny
dGNfZmluZChkZXYsIGZpbGVfcHJpdiwgZ2V0X3NlcS0+Y3J0Y19pZCk7Cj4gQEAgLTIwODIsNyAr
MjA4Nyw3IEBAIGludCBkcm1fY3J0Y19xdWV1ZV9zZXF1ZW5jZV9pb2N0bChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ICAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRl
diwgRFJJVkVSX01PREVTRVQpKQo+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gLQlpZiAo
IWRldi0+aXJxX2VuYWJsZWQpCj4gKwlpZiAoIWRybV9kZXZfaGFzX3ZibGFuayhkZXYpKQo+ICAJ
CXJldHVybiAtRU9QTk9UU1VQUDsKPiAgCj4gIAljcnRjID0gZHJtX2NydGNfZmluZChkZXYsIGZp
bGVfcHJpdiwgcXVldWVfc2VxLT5jcnRjX2lkKTsKPiAtLSAKPiAyLjMyLjAKPiAKCi0tIAo9PT09
PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwK
fCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAg
LwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXUK
