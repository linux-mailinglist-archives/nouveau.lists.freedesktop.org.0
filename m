Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5151B8356
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1FA6EB95;
	Sat, 25 Apr 2020 02:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DE66ECAB
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 20:58:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1AA1321;
 Fri,  3 Apr 2020 22:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1585947523;
 bh=r1GrVagGVf+cLqppeQukbfI4sbglM384SDw3qTyPMH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQWesMTrvI2XdOj5QRAXKvmCt9sJHCbXlpHJGuZjN2Om14+opTAl/f7sWOGzATCtq
 h5HSaI0gWIQ/L5uIUich7PABCu7guvMSfA7PVXR8jdmBOljFTz2uGW5AVuRu09ml24
 UObw8u1TAgrt02YHNLg7utkhIEJ1+Y6/nd/x3lmI=
Date: Fri, 3 Apr 2020 23:58:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20200403205455.GD20301@pendragon.ideasonboard.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403204008.14864-4-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:58 +0000
Subject: Re: [Nouveau] [PATCH v2 03/17] drm: Nuke mode->vrefresh
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 Inki Dae <inki.dae@samsung.com>, CK Hu <ck.hu@mediatek.com>,
 linux-amlogic@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgVmlsbGUsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIEZyaSwgQXByIDAzLCAyMDIw
IGF0IDExOjM5OjU0UE0gKzAzMDAsIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gRnJvbTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBHZXQgcmlkIG9m
IG1vZGUtPnZyZWZyZXNoIGFuZCBqdXN0IGNhbGN1bGF0ZSBpdCBvbiBkZW1hbmQuIFNhdmVzCj4g
YSBiaXQgb2Ygc3BhY2UgYW5kIGF2b2lkcyB0aGUgY2FjaGVkIHZhbHVlIGdldHRpbmcgb3V0IG9m
IHN5bmMKPiB3aXRoIHJlYWxpdHkuCj4gCj4gTW9zdGx5IGRvbmUgd2l0aCBjb2NjaSwgd2l0aCB0
aGUgZm9sbG93aW5nIG1hbnVhbCBmaXh1cHM6Cj4gLSBSZW1vdmUgdGhlIG5vdyBlbXB0eSBsb29w
IGluIGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcygpCj4gLSBGaXggX19N
T0RFKCkgbWFjcm8gaW4gY2g3MDA2X21vZGUuYwo+IC0gRml4IERSTV9NT0RFX0FSRygpIG1hY3Jv
IGluIGRybV9tb2Rlcy5oCj4gLSBSZW1vdmUgbGVmdG92ZXIgY29tbWVudCBmcm9tIHNhbXN1bmdf
czZkMTZkMF9tb2RlCj4gLSBEcm9wIHRoZSBUT0RPCj4gCj4gQEAKPiBAQAo+IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlIHsKPiAJLi4uCj4gLQlpbnQgdnJlZnJlc2g7Cj4gCS4uLgo+IH07Cj4gCj4g
QEAKPiBpZGVudGlmaWVyIE47Cj4gZXhwcmVzc2lvbiBFOwo+IEBACj4gc3RydWN0IGRybV9kaXNw
bGF5X21vZGUgTiA9IHsKPiAtCS52cmVmcmVzaCA9IEUKPiB9Owo+IAo+IEBACj4gaWRlbnRpZmll
ciBOOwo+IGV4cHJlc3Npb24gRTsKPiBAQAo+IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIE5bLi4u
XSA9IHsKPiAuLi4sCj4gewo+IC0JLnZyZWZyZXNoID0gRQo+IH0KPiAsLi4uCj4gfTsKPiAKPiBA
QAo+IGV4cHJlc3Npb24gRTsKPiBAQAo+IHsKPiAJRFJNX01PREUoLi4uKSwKPiAtCS52cmVmcmVz
aCA9IEUsCj4gfQo+IAo+IEBACj4gaWRlbnRpZmllciBNLCBSOwo+IEBACj4gaW50IGRybV9tb2Rl
X3ZyZWZyZXNoKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpNKQo+IHsKPiAgIC4uLgo+
IC0gaWYgKE0tPnZyZWZyZXNoID4gMCkKPiAtIAlSID0gTS0+dnJlZnJlc2g7Cj4gLSBlbHNlCj4g
ICBpZiAoLi4uKSB7Cj4gICAuLi4KPiAgIH0KPiAgIC4uLgo+IH0KPiAKPiBAQAo+IHN0cnVjdCBk
cm1fZGlzcGxheV9tb2RlICpwOwo+IGV4cHJlc3Npb24gRTsKPiBAQAo+ICgKPiAtIHAtPnZyZWZy
ZXNoID0gRTsKPiB8Cj4gLSBwLT52cmVmcmVzaAo+ICsgZHJtX21vZGVfdnJlZnJlc2gocCkKPiAp
Cj4gCj4gQEAKPiBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBzOwo+IGV4cHJlc3Npb24gRTsKPiBA
QAo+ICgKPiAtIHMudnJlZnJlc2ggPSBFOwo+IHwKPiAtIHMudnJlZnJlc2gKPiArIGRybV9tb2Rl
X3ZyZWZyZXNoKCZzKQo+ICkKPiAKPiBAQAo+IGV4cHJlc3Npb24gRTsKPiBAQAo+IC0gZHJtX21v
ZGVfdnJlZnJlc2goRSkgPyBkcm1fbW9kZV92cmVmcmVzaChFKSA6IGRybV9tb2RlX3ZyZWZyZXNo
KEUpCj4gKyBkcm1fbW9kZV92cmVmcmVzaChFKQo+IAo+IEBmaW5kX3N1YnN0cnVjdEAKPiBpZGVu
dGlmaWVyIFg7Cj4gaWRlbnRpZmllciBTOwo+IEBACj4gc3RydWN0IFggewo+IC4uLgo+IAlzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSBTOwo+IC4uLgo+IH07Cj4gCj4gQEAKPiBpZGVudGlmaWVyIGZp
bmRfc3Vic3RydWN0LlM7Cj4gZXhwcmVzc2lvbiBFOwo+IGlkZW50aWZpZXIgSTsKPiBAQAo+IHsK
PiAuUyA9IHsKPiAtCS52cmVmcmVzaCA9IEUKPiB9Cj4gfQo+IAo+IEBACj4gaWRlbnRpZmllciBm
aW5kX3N1YnN0cnVjdC5TOwo+IGlkZW50aWZpZXIgZmluZF9zdWJzdHJ1Y3QuWDsKPiBleHByZXNz
aW9uIEU7Cj4gaWRlbnRpZmllciBJOwo+IEBACj4gc3RydWN0IFggSVsuLi5dID0gewo+IC4uLiwK
PiAuUyA9IHsKPiAtCS52cmVmcmVzaCA9IEUKPiB9Cj4gLC4uLgo+IH07Cj4gCj4gdjI6IERyb3Ag
VE9ETwo+IAo+IENjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgo+IENjOiBO
ZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gQ2M6IExhdXJlbnQgUGlu
Y2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogSm9uYXMgS2Fy
bG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+IENjOiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFi
ZWNAc2lvbC5uZXQ+Cj4gQ2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiBDYzog
Sm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGltQHNhbXN1bmcuY29tPgo+IENjOiBTZXVuZy1Xb28g
S2ltIDxzdzAzMTIua2ltQHNhbXN1bmcuY29tPgo+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21p
bi5wYXJrQHNhbXN1bmcuY29tPgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+Cj4gQ2M6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gQ2M6IFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNv
bT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IENjOiBKZXJyeSBIYW4g
PGhhbnh1NUBodWFxaW4uY29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+Cj4gQ2M6IEljZW5vd3kgWmhl
bmcgPGljZW5vd3lAYW9zYy5pbz4KPiBDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0
aW9ucy5jb20+Cj4gQ2M6IFN0ZWZhbiBNYXZyb2RpZXYgPHN0ZWZhbkBvbGltZXguY29tPgo+IENj
OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gQ2M6ICJHdWlkbyBHw7xu
dGhlciIgPGFneEBzaWd4Y3B1Lm9yZz4KPiBDYzogUHVyaXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxA
cHVyaS5zbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFy
by5vcmc+Cj4gQ2M6IFZpbmNlbnQgQWJyaW91IDx2aW5jZW50LmFicmlvdUBzdC5jb20+Cj4gQ2M6
IFZNd2FyZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgo+
IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gQ2M6IGxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJv
cmEuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4g
QWNrZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAgICAgICAgICAgICAg
fCAgMjAgLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgICAgICAgICAgICAg
IHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYyAgICAgICAg
ICB8ICAgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyAgICAgICAgICAgICAgICAg
ICAgfCAzMjggKysrKysrKysrLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMu
YyAgICAgICAgICAgICAgICAgICB8ICAgOSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2Jl
X2hlbHBlci5jICAgICAgICAgICAgfCAgIDMgLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19oZG1pLmMgICAgICAgICAgfCAgIDUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfbWl4ZXIuYyAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9pMmMvY2g3
MDA2X21vZGUuYyAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZGlzcGxheS5jICB8ICAgMSAtCj4gIC4uLi9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXlfZGVidWdmcy5jICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMgICAgICAgfCAgMTAgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF90di5jICAgICAgIHwgICAzIC0KPiAgZHJpdmVycy9ncHUvZHJtL21jZGUv
bWNkZV9kc2kuYyAgICAgICAgICAgICAgIHwgICA2ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8ICAgNCArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYyAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX3ZlbmNfY3Zicy5jICAgICAgIHwgICAyIC0KPiAgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyAgIHwgICA1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1hcm0tdmVyc2F0aWxlLmMgICB8ICAgNCAtCj4gIGRyaXZlcnMvZ3B1L2RybS9w
YW5lbC9wYW5lbC1ib2UtaGltYXg4Mjc5ZC5jICB8ICAgMyArLQo+ICAuLi4vZ3B1L2RybS9wYW5l
bC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMgICAgfCAgIDYgKy0KPiAgZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWVsaWRhLWtkMzV0MTMzLmMgIHwgICAzICstCj4gIC4uLi9ncHUvZHJtL3Bh
bmVsL3BhbmVsLWZlaXhpbi1rMTAxLWltMmJhMDIuYyB8ICAgMyArLQo+ICAuLi4vZHJtL3BhbmVs
L3BhbmVsLWZlaXlhbmctZnkwNzAyNGRpMjZhMzBkLmMgfCAgIDMgKy0KPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5MzIyLmMgIHwgICA3IC0KPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWlsaXRlay1pbGk5ODgxYy5jIHwgICAzICstCj4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1pbm5vbHV4LXAwNzl6Y2EuYyB8ICAgNCArLQo+ICAuLi4vZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1qZGktbHQwNzBtZTA1MDAwLmMgICAgfCAgIDMgKy0KPiAgLi4uL2RybS9w
YW5lbC9wYW5lbC1raW5nZGlzcGxheS1rZDA5N2QwNC5jICAgIHwgICAzICstCj4gIC4uLi9kcm0v
cGFuZWwvcGFuZWwtbGVhZHRlay1sdGs1MDBoZDE4MjkuYyAgICB8ICAgMyArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtbGctbGIwMzVxMDIuYyAgICAgfCAgIDEgLQo+ICBkcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtbGctbGc0NTczLmMgICAgICAgfCAgIDMgKy0KPiAgZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5lYy1ubDgwNDhobDExLmMgIHwgICAxIC0KPiAgZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5vdmF0ZWstbnQzNTUxMC5jIHwgICAxIC0KPiAgZHJpdmVy
cy9ncHUvZHJtL3BhbmVsL3BhbmVsLW5vdmF0ZWstbnQzOTAxNi5jIHwgICAxIC0KPiAgLi4uL2Ry
bS9wYW5lbC9wYW5lbC1vbGltZXgtbGNkLW9saW51eGluby5jICAgIHwgICAxIC0KPiAgLi4uL2dw
dS9kcm0vcGFuZWwvcGFuZWwtb3Jpc2V0ZWNoLW90bTgwMDlhLmMgIHwgICAzICstCj4gIC4uLi9k
cm0vcGFuZWwvcGFuZWwtb3NkLW9zZDEwMXQyNTg3LTUzdHMuYyAgICB8ICAgMyArLQo+ICAuLi4v
ZHJtL3BhbmVsL3BhbmVsLXBhbmFzb25pYy12dngxMGYwMzRuMDAuYyAgfCAgIDMgKy0KPiAgLi4u
L2RybS9wYW5lbC9wYW5lbC1yYXNwYmVycnlwaS10b3VjaHNjcmVlbi5jIHwgICA0ICstCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjcxOTEuYyB8ICAgMyArLQo+ICBk
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS1ybTY4MjAwLmMgfCAgIDMgKy0KPiAg
Li4uL2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jICAgIHwgICA1ICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb25iby1yYjA3MGQzMC5jICB8ICAgMSAtCj4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZDE2ZDAuYyB8ICAgNiAtCj4g
IGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTNoYTIuYyB8ICAgNCArLQo+
ICAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzajB4MDMuYyAgfCAgIDMgKy0K
PiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jIHwgICAzICst
Cj4gIC4uLi9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTg4YTAtYW1zNDUyZWYwMS5jICB8ICAgMSAt
Cj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zZWlrby00M3d2ZjFnLmMgICB8ICAgMyAr
LQo+ICAuLi4vZ3B1L2RybS9wYW5lbC9wYW5lbC1zaGFycC1scTEwMXIxc3gwMS5jICAgfCAgIDMg
Ky0KPiAgLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwMzd2N2R3MDEuYyAgIHwgICAx
IC0KPiAgLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2hhcnAtbHMwNDN0MWxlMDEuYyAgIHwgICAz
ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyAgICAgICAgICB8ICA4
NyArLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAxLmMg
fCAgIDIgKy0KPiAgLi4uL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3Nzg5di5jICAg
IHwgICAzICstCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zb255LWFjeDQyNGFrcC5j
ICB8ICAgMiAtCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zb255LWFjeDU2NWFrbS5j
ICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5j
ICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwNDNtdGVhMS5j
ICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdHBnMTEwLmMgICAg
ICB8ICAgNSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cnVseS1udDM1NTk3LmMg
ICB8ICAgMSAtCj4gIC4uLi9ncHUvZHJtL3BhbmVsL3BhbmVsLXhpbnBlbmcteHBwMDU1YzI3Mi5j
ICB8ICAgMyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZGEuYyAgICAgICAgICAgICAg
ICAgfCAgIDEgLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyAgICAgICAg
ICAgfCAgIDIgLQo+ICBpbmNsdWRlL2RybS9kcm1fbW9kZXMuaCAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTIgKy0KPiAgNjYgZmlsZXMgY2hhbmdlZCwgMjE4IGluc2VydGlvbnMoKyksIDQxNyBk
ZWxldGlvbnMoLSkKCltzbmlwXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUv
bWNkZV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKPiBpbmRleCA3YWY1
ZWJiMGM0MzYuLjUyMDMxZDgyNmYyYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNk
ZS9tY2RlX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYwo+IEBA
IC01MzgsNyArNTM4LDcgQEAgc3RhdGljIHZvaWQgbWNkZV9kc2lfc2V0dXBfdmlkZW9fbW9kZShz
dHJ1Y3QgbWNkZV9kc2kgKmQsCj4gIAkgKi8KPiAgCS8qIChwcy9zKSAvIChwaXhlbHMvcykgPSBw
cy9waXhlbHMgKi8KPiAgCXBjbGsgPSBESVZfUk9VTkRfVVBfVUxMKDEwMDAwMDAwMDAwMDAsCj4g
LQkJCQkobW9kZS0+dnJlZnJlc2ggKiBtb2RlLT5odG90YWwgKiBtb2RlLT52dG90YWwpKTsKPiAr
CQkJCShkcm1fbW9kZV92cmVmcmVzaChtb2RlKSAqIG1vZGUtPmh0b3RhbCAqIG1vZGUtPnZ0b3Rh
bCkpOwoKU2hvdWxkbid0IHlvdSBqdXN0IHVzZSB0aGUgcGl4ZWwgY2xvY2sgaGVyZSA/CgpVcGRh
dGU6IFRoZXJlJ3MgYSBwYXRjaCBmdXJ0aGVyIGluIHRoaXMgc2VyaWVzIHRoYXQgaGFuZGxlcyB0
aGlzLCBncmVhdAo6LSkKCj4gIAlkZXZfZGJnKGQtPmRldiwgInBpY29zZWNvbmRzIGJldHdlZW4g
dHdvIHBpeGVsczogJWxsdVxuIiwKPiAgCQlwY2xrKTsKPiAgCgpbc25pcF0KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gaW5kZXggOWE5YTdmNTAwM2Qz
Li5hYzgwYjFhYzQ1OWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9jb25uZWN0b3IuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
Y29ubmVjdG9yLmMKPiBAQCAtNTksNyArNTksNiBAQCBub3V2ZWF1X2Nvbm5fbmF0aXZlX21vZGUo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgCWludCBoaWdoX3cgPSAwLCBoaWdo
X2ggPSAwLCBoaWdoX3YgPSAwOwo+ICAKPiAgCWxpc3RfZm9yX2VhY2hfZW50cnkobW9kZSwgJmNv
bm5lY3Rvci0+cHJvYmVkX21vZGVzLCBoZWFkKSB7Cj4gLQkJbW9kZS0+dnJlZnJlc2ggPSBkcm1f
bW9kZV92cmVmcmVzaChtb2RlKTsKPiAgCQlpZiAoaGVscGVyLT5tb2RlX3ZhbGlkKGNvbm5lY3Rv
ciwgbW9kZSkgIT0gTU9ERV9PSyB8fAo+ICAJCSAgICAobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9G
TEFHX0lOVEVSTEFDRSkpCj4gIAkJCWNvbnRpbnVlOwo+IEBAIC04MCwxMiArNzksMTIgQEAgbm91
dmVhdV9jb25uX25hdGl2ZV9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4g
IAkJCWNvbnRpbnVlOwo+ICAKPiAgCQlpZiAobW9kZS0+aGRpc3BsYXkgPT0gaGlnaF93ICYmIG1v
ZGUtPnZkaXNwbGF5ID09IGhpZ2hfaCAmJgo+IC0JCSAgICBtb2RlLT52cmVmcmVzaCA8IGhpZ2hf
dikKPiArCQkgICAgZHJtX21vZGVfdnJlZnJlc2gobW9kZSkgPCBoaWdoX3YpCgpIZXJlIHRvbywg
c2hvdWxkIHRoZSBsb2dpYyBiZSBtb2RpZmllZCB0byB1c2UgdGhlIGNsb2NrID8KClRoaXMgY2Fu
IGJlIGFkZHJlc3NlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLCBzbyBmb3IgdGhpcywKClJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
Cgo+ICAJCQljb250aW51ZTsKPiAgCj4gIAkJaGlnaF93ID0gbW9kZS0+aGRpc3BsYXk7Cj4gIAkJ
aGlnaF9oID0gbW9kZS0+dmRpc3BsYXk7Cj4gLQkJaGlnaF92ID0gbW9kZS0+dnJlZnJlc2g7Cj4g
KwkJaGlnaF92ID0gZHJtX21vZGVfdnJlZnJlc2gobW9kZSk7Cj4gIAkJbGFyZ2VzdCA9IG1vZGU7
Cj4gIAl9Cj4gCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
