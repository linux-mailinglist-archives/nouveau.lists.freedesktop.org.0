Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EF3B5147
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636EF6E1F4;
	Sun, 27 Jun 2021 03:35:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9682C6E59D;
 Tue, 22 Jun 2021 15:26:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2E9031B;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D102D3F718;
 Tue, 22 Jun 2021 08:26:33 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 938E46850D7; Tue, 22 Jun 2021 16:26:32 +0100 (BST)
Date: Tue, 22 Jun 2021 16:26:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20210622152632.647akpp5nqcdfozk@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-7-tzimmermann@suse.de>
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH v2 06/22] drm/malidp: Don't set struct
 drm_device.irq_enabled
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMDQ6MDk6NDZQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGZpZWxkIGRybV9kZXZpY2UuaXJxX2VuYWJsZWQgaXMgb25seSB1c2Vk
IGJ5IGxlZ2FjeSBkcml2ZXJzCj4gd2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcuIERvbid0IHNl
dCBpdCBpbiBtYWxpZHAuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFy
bS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L21hbGlkcF9kcnYuYyB8IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMgYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+IGluZGV4IGRlNTlmMzMwMjUxNi4uNzhkMTVi
MDRiMTA1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiBAQCAtODQ3LDggKzg0Nyw2
IEBAIHN0YXRpYyBpbnQgbWFsaWRwX2JpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAJaWYgKHJl
dCA8IDApCj4gIAkJZ290byBpcnFfaW5pdF9mYWlsOwo+ICAKPiAtCWRybS0+aXJxX2VuYWJsZWQg
PSB0cnVlOwo+IC0KPiAgCXJldCA9IGRybV92YmxhbmtfaW5pdChkcm0sIGRybS0+bW9kZV9jb25m
aWcubnVtX2NydGMpOwo+ICAJaWYgKHJldCA8IDApIHsKPiAgCQlEUk1fRVJST1IoImZhaWxlZCB0
byBpbml0aWFsaXNlIHZibGFua1xuIik7Cj4gQEAgLTg3NCw3ICs4NzIsNiBAQCBzdGF0aWMgaW50
IG1hbGlkcF9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgdmJsYW5rX2ZhaWw6Cj4gIAltYWxp
ZHBfc2VfaXJxX2ZpbmkoaHdkZXYpOwo+ICAJbWFsaWRwX2RlX2lycV9maW5pKGh3ZGV2KTsKPiAt
CWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiAgaXJxX2luaXRfZmFpbDoKPiAgCWRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKGRybSk7Cj4gIAljb21wb25lbnRfdW5iaW5kX2FsbChkZXYsIGRy
bSk7Cj4gQEAgLTkwOSw3ICs5MDYsNiBAQCBzdGF0aWMgdm9pZCBtYWxpZHBfdW5iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldikKPiAgCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7Cj4gIAlt
YWxpZHBfc2VfaXJxX2ZpbmkoaHdkZXYpOwo+ICAJbWFsaWRwX2RlX2lycV9maW5pKGh3ZGV2KTsK
PiAtCWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKPiAgCWNvbXBvbmVudF91bmJpbmRfYWxsKGRl
diwgZHJtKTsKPiAgCW9mX25vZGVfcHV0KG1hbGlkcC0+Y3J0Yy5wb3J0KTsKPiAgCW1hbGlkcC0+
Y3J0Yy5wb3J0ID0gTlVMTDsKPiAtLSAKPiAyLjMyLjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09
PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdy
ZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0t
LS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
