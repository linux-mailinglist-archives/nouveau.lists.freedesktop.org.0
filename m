Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C543B5163
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905E66E209;
	Sun, 27 Jun 2021 03:35:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3CB86EB4D;
 Thu, 24 Jun 2021 10:27:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 051AA31B;
 Thu, 24 Jun 2021 03:27:34 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA68A3F718;
 Thu, 24 Jun 2021 03:27:33 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 75E09684F2B; Thu, 24 Jun 2021 11:27:32 +0100 (BST)
Date: Thu, 24 Jun 2021 11:27:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210624102732.3h7lnsik7mkbphgw@e110455-lin.cambridge.arm.com>
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de>
 <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de>
 <877dijtzl2.fsf@intel.com>
 <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH v3 04/27] drm: Don't test for IRQ support in
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
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, melissa.srw@gmail.com, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com,
 benjamin.gaignard@linaro.org, linux@armlinux.org.uk, mihail.atanassov@arm.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, intel-gfx@lists.freedesktop.org,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, Jani Nikula <jani.nikula@linux.intel.com>,
 inki.dae@samsung.com, rodrigosiqueiramelo@gmail.com, john.stultz@linaro.org,
 mripard@kernel.org, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com,
 tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 Xinhui.Pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, linux-sunxi@lists.linux.dev,
 kyungmin.park@samsung.com, kieran.bingham+renesas@ideasonboard.com,
 philippe.cornu@foss.st.com, daniel@ffwll.ch, alexander.deucher@amd.com,
 tiantao6@hisilicon.com, shawnguo@kernel.org, brian.starkey@arm.com,
 zackr@vmware.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjQsIDIwMjEgYXQgMTE6MDc6NTdBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAyNC4wNi4yMSB1bSAxMDo1MSBzY2hyaWViIEphbmkgTmlr
dWxhOgo+ID4gT24gVGh1LCAyNCBKdW4gMjAyMSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOgo+ID4gPiBIaQo+ID4gPiAKPiA+ID4gQW0gMjQuMDYuMjEgdW0g
MTA6MDYgc2NocmllYiBKYW5pIE5pa3VsYToKPiA+ID4gPiBPbiBUaHUsIDI0IEp1biAyMDIxLCBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fdmJsYW5rLmMKPiA+ID4gPiA+IGluZGV4IDM0MTdlMWFjNzkxOC4uMTBmZTE2YmFmY2I2
IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+ID4gPiA+ID4gQEAgLTE3
NDgsOCArMTc0OCwxNiBAQCBpbnQgZHJtX3dhaXRfdmJsYW5rX2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gPiA+ID4gPiAgICAJdW5zaWduZWQgaW50IHBpcGVfaW5k
ZXg7Cj4gPiA+ID4gPiAgICAJdW5zaWduZWQgaW50IGZsYWdzLCBwaXBlLCBoaWdoX3BpcGU7Cj4g
PiA+ID4gPiAtCWlmICghZGV2LT5pcnFfZW5hYmxlZCkKPiA+ID4gPiA+IC0JCXJldHVybiAtRU9Q
Tk9UU1VQUDsKPiA+ID4gPiA+ICsjaWYgZGVmaW5lZChDT05GSUdfRFJNX0xFR0FDWSkKPiA+ID4g
PiA+ICsJaWYgICh1bmxpa2VseShkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0xF
R0FDWSkpKSB7Cj4gPiA+ID4gPiArCQlpZiAoIWRldi0+aXJxX2VuYWJsZWQpCj4gPiA+ID4gPiAr
CQkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiA+ID4gKwl9IGVsc2UgLyogaWYgRFJJVkVSX01P
REVTRVQgKi8KPiA+ID4gPiA+ICsjZW5kaWYKPiA+ID4gPiA+ICsJewo+ID4gPiA+ID4gKwkJaWYg
KCFkcm1fZGV2X2hhc192YmxhbmsoZGV2KSkKPiA+ID4gPiA+ICsJCQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gPiA+ID4gPiArCX0KPiA+ID4gPiAKPiA+ID4gPiBTaGVlc2ggSSBoYXRlIHRoaXMga2lu
ZCBvZiBpbmxpbmUgI2lmZGVmcy4KPiA+ID4gPiAKPiA+ID4gPiBUd28gYWx0ZXJuYXRlIHN1Z2dl
c3Rpb25zIHRoYXQgSSBiZWxpZXZlIHNob3VsZCBiZSBhcyBqdXN0IGVmZmljaWVudDoKPiA+ID4g
Cj4gPiA+IE9yIGhvdyBhYm91dDoKPiA+ID4gCj4gPiA+IHN0YXRpYyBib29sIGRybV93YWl0X3Zi
bGFua19zdXBwb3J0ZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiA+ID4gCj4gPiA+IHsKPiA+
ID4gCj4gPiA+IGlmIGRlZmluZWQoQ09ORklHX0RSTV9MRUdBQ1kpCj4gPiA+IAlpZiAgKHVubGlr
ZWx5KGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfTEVHQUNZKSkpCj4gPiA+IAo+
ID4gPiAJCXJldHVybiBkZXYtPmlycV9lbmFibGVkOwo+ID4gPiAKPiA+ID4gI2VuZGlmCj4gPiA+
IAlyZXR1cm4gZHJtX2Rldl9oYXNfdmJsYW5rKGRldik7Cj4gPiA+IAo+ID4gPiB9Cj4gPiA+IAo+
ID4gPiAKPiA+ID4gPwo+ID4gPiAKPiA+ID4gSXQncyBpbmxpbmUsIGJ1dCBzdGlsbCByZWFkYWJs
ZS4KPiA+IAo+ID4gSXQncyBkZWZpbml0ZWx5IGJldHRlciB0aGFuIHRoZSBvcmlnaW5hbCwgYnV0
IGl0J3MgdW5jbGVhciB0byBtZSB3aHkKPiA+IHlvdSdkIHByZWZlciB0aGlzIG92ZXIgb3B0aW9u
IDIpIGJlbG93LiBJIGd1ZXNzIHRoZSBvbmx5IHJlYXNvbiBJIGNhbgo+ID4gdGhpbmsgb2YgaXMg
ZW1waGFzaXppbmcgdGhlIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uLiBIb3dldmVyLAo+ID4gSVNf
RU5BQkxFRCgpIGlzIHdpZGVseSB1c2VkIGluIHRoaXMgbWFubmVyIHNwZWNpZmljYWxseSB0byBh
dm9pZCBpbmxpbmUKPiA+ICNpZiwgYW5kIHRoZSBjb21waWxlciBvcHRpbWl6ZXMgaXQgYXdheS4K
PiAKPiBJdCdzIHNpbXBseSBtb3JlIHJlYWRhYmxlIHRvIG1lIGFzIHRoZSBjb25kaXRpb24gaXMg
c2ltcGxlci4gQnV0IG9wdGlvbiAyIGlzCj4gYWxzbyBvay4KCkVpdGhlciBvcHRpb24gbG9va3Mg
Z29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNv
bT4KClRoYW5rcyBmb3IgZG9pbmcgdGhhdCEKTGl2aXUKCj4gCj4gQmVzdCByZWdhcmRzCj4gVGhv
bWFzCj4gCj4gPiAKPiA+IEJSLAo+ID4gSmFuaS4KPiA+IAo+ID4gCj4gPiA+IAo+ID4gPiBCZXN0
IHJlZ2FyZHMKPiA+ID4gVGhvbWFzCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IDEpIFRoZSBtb3Jl
IHZlcmJvc2U6Cj4gPiA+ID4gCj4gPiA+ID4gI2lmIGRlZmluZWQoQ09ORklHX0RSTV9MRUdBQ1kp
Cj4gPiA+ID4gc3RhdGljIGJvb2wgZHJtX3dhaXRfdmJsYW5rX3N1cHBvcnRlZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQo+ID4gPiA+IHsKPiA+ID4gPiAJaWYgICh1bmxpa2VseShkcm1fY29yZV9j
aGVja19mZWF0dXJlKGRldiwgRFJJVkVSX0xFR0FDWSkpKQo+ID4gPiA+IAkJcmV0dXJuIGRldi0+
aXJxX2VuYWJsZWQ7Cj4gPiA+ID4gCWVsc2UKPiA+ID4gPiAJCXJldHVybiBkcm1fZGV2X2hhc192
YmxhbmsoZGV2KTsKPiA+ID4gPiB9Cj4gPiA+ID4gI2Vsc2UKPiA+ID4gPiBzdGF0aWMgYm9vbCBk
cm1fd2FpdF92Ymxhbmtfc3VwcG9ydGVkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gPiA+ID4g
ewo+ID4gPiA+IAlyZXR1cm4gZHJtX2Rldl9oYXNfdmJsYW5rKGRldik7Cj4gPiA+ID4gfQo+ID4g
PiA+ICNlbmRpZgo+ID4gPiA+IAo+ID4gPiA+IDIpIFRoZSBtb3JlIGNvbXBhY3Q6Cj4gPiA+ID4g
Cj4gPiA+ID4gc3RhdGljIGJvb2wgZHJtX3dhaXRfdmJsYW5rX3N1cHBvcnRlZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQo+ID4gPiA+IHsKPiA+ID4gPiAJaWYgIChJU19FTkFCTEVEKENPTkZJR19E
Uk1fTEVHQUNZKSAmJiB1bmxpa2VseShkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVS
X0xFR0FDWSkpKQo+ID4gPiA+IAkJcmV0dXJuIGRldi0+aXJxX2VuYWJsZWQ7Cj4gPiA+ID4gCWVs
c2UKPiA+ID4gPiAJCXJldHVybiBkcm1fZGV2X2hhc192YmxhbmsoZGV2KTsKPiA+ID4gPiB9Cj4g
PiA+ID4gCj4gPiA+ID4gVGhlbiwgaW4gZHJtX3dhaXRfdmJsYW5rX2lvY3RsKCkuCj4gPiA+ID4g
Cj4gPiA+ID4gCWlmICghZHJtX3dhaXRfdmJsYW5rX3N1cHBvcnRlZChkZXYpKQo+ID4gPiA+IAkJ
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiA+IAo+ID4gPiA+IFRoZSBjb21waWxlciBzaG91bGQg
ZG8gdGhlIHJpZ2h0IHRoaW5nIHdpdGhvdXQgYW55IGV4cGxpY2l0IGlubGluZQo+ID4gPiA+IGtl
eXdvcmRzIGV0Yy4KPiA+ID4gPiAKPiA+ID4gPiBCUiwKPiA+ID4gPiBKYW5pLgo+ID4gPiA+IAo+
ID4gPiA+ID4gICAgCWlmICh2Ymx3YWl0LT5yZXF1ZXN0LnR5cGUgJiBfRFJNX1ZCTEFOS19TSUdO
QUwpCj4gPiA+ID4gPiAgICAJCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gQEAgLTIwMjMsNyAr
MjAzMSw3IEBAIGludCBkcm1fY3J0Y19nZXRfc2VxdWVuY2VfaW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgdm9pZCAqZGF0YSwKPiA+ID4gPiA+ICAgIAlpZiAoIWRybV9jb3JlX2NoZWNrX2Zl
YXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpCj4gPiA+ID4gPiAgICAJCXJldHVybiAtRU9QTk9U
U1VQUDsKPiA+ID4gPiA+IC0JaWYgKCFkZXYtPmlycV9lbmFibGVkKQo+ID4gPiA+ID4gKwlpZiAo
IWRybV9kZXZfaGFzX3ZibGFuayhkZXYpKQo+ID4gPiA+ID4gICAgCQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4gPiA+ID4gPiAgICAJY3J0YyA9IGRybV9jcnRjX2ZpbmQoZGV2LCBmaWxlX3ByaXYsIGdl
dF9zZXEtPmNydGNfaWQpOwo+ID4gPiA+ID4gQEAgLTIwODIsNyArMjA5MCw3IEBAIGludCBkcm1f
Y3J0Y19xdWV1ZV9zZXF1ZW5jZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLAo+ID4gPiA+ID4gICAgCWlmICghZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZF
Ul9NT0RFU0VUKSkKPiA+ID4gPiA+ICAgIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4gPiA+ID4g
LQlpZiAoIWRldi0+aXJxX2VuYWJsZWQpCj4gPiA+ID4gPiArCWlmICghZHJtX2Rldl9oYXNfdmJs
YW5rKGRldikpCj4gPiA+ID4gPiAgICAJCXJldHVybiAtRU9QTk9UU1VQUDsKPiA+ID4gPiA+ICAg
IAljcnRjID0gZHJtX2NydGNfZmluZChkZXYsIGZpbGVfcHJpdiwgcXVldWVfc2VxLT5jcnRjX2lk
KTsKPiA+ID4gPiAKPiA+IAo+IAo+IC0tIAo+IFRob21hcyBaaW1tZXJtYW5uCj4gR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAo+
IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQo+IChIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCj4gCgoK
CgotLSAKPT09PT09PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUg
d29ybGQsICB8CnwgYnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3Vy
Y2UgY29kZSEgIC8KICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
