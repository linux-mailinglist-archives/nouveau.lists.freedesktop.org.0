Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D215D99CA
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2019 21:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256756E9BA;
	Wed, 16 Oct 2019 19:14:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A70F6E435;
 Wed, 16 Oct 2019 19:14:26 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 959BF20854;
 Wed, 16 Oct 2019 19:14:25 +0000 (UTC)
Date: Wed, 16 Oct 2019 14:14:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20191016191424.GA59381@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016144449.24646-1-kherbst@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1571253266;
 bh=MbOPIie1/joNY6qNFn+X7RLr1Za1qIcYWbFu+np+HD8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EC5NWWyicNXgsT9Ep7Gs/UFTrH3sXKInGqgh3oxy5Mm1vLK/yP5j3UK5mwF4IxKQm
 QlqpyaEFWGAVp7rbrRTTv/Pt8kfebXt1TYWcp84idg6m9gngJPFQgpVVJzlylFCBZ+
 hNk7TcAh/l71FysyYxa22Fu+nb1/uhFQTz+ZRPTk=
Subject: Re: [Nouveau] [PATCH v3] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 Mika Westerberg <mika.westerberg@intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDQ6NDQ6NDlQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IEZpeGVzIHN0YXRlIHRyYW5zaXRpb25zIG9mIE52aWRpYSBQYXNjYWwgR1BVcyBmcm9t
IEQzY29sZCBpbnRvIGhpZ2hlciBkZXZpY2UKPiBzdGF0ZXMuCj4gCj4gdjI6IGNvbnZlcnQgdG8g
cGNpX2RldiBxdWlyawo+ICAgICBwdXQgYSBwcm9wZXIgdGVjaG5pY2FsIGV4cGxhbmF0aW9uIG9m
IHRoZSBpc3N1ZSBhcyBhIGluLWNvZGUgY29tbWVudAo+IHYzOiBkaXNhYmxlIGl0IG9ubHkgZm9y
IGNlcnRhaW4gY29tYmluYXRpb25zIG9mIGludGVsIGFuZCBudmlkaWEgaGFyZHdhcmUKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KPiBDYzogQmpv
cm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KPiBDYzogUmFmYWVsIEouIFd5c29ja2kgPHJqd0Byand5c29ja2kubmV0Pgo+
IENjOiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+Cj4gQ2M6IGxp
bnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtcG1Admdlci5rZXJuZWwub3JnCj4g
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiAtLS0KPiAgZHJpdmVycy9wY2kvcGNpLmMgICAgfCAxMSArKysrKysr
KysrCj4gIGRyaXZlcnMvcGNpL3F1aXJrcy5jIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9wY2kuaCAgfCAgMSArCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9wY2kuYyBiL2RyaXZlcnMvcGNpL3BjaS5jCj4gaW5kZXggYjk3ZDllMTBjOWNjLi44ZTA1
NmViN2U2ZmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wY2kvcGNpLmMKPiArKysgYi9kcml2ZXJz
L3BjaS9wY2kuYwo+IEBAIC04MDUsNiArODA1LDEzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwbGF0
Zm9ybV9wY2lfYnJpZGdlX2QzKHN0cnVjdCBwY2lfZGV2ICpkZXYpCj4gIAlyZXR1cm4gcGNpX3Bs
YXRmb3JtX3BtID8gcGNpX3BsYXRmb3JtX3BtLT5icmlkZ2VfZDMoZGV2KSA6IGZhbHNlOwo+ICB9
Cj4gIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcGFyZW50X2Jyb2tlbl9jaGlsZF9wbShzdHJ1Y3Qg
cGNpX2RldiAqZGV2KQo+ICt7Cj4gKwlpZiAoIWRldi0+YnVzIHx8ICFkZXYtPmJ1cy0+c2VsZikK
PiArCQlyZXR1cm4gZmFsc2U7Cj4gKwlyZXR1cm4gZGV2LT5idXMtPnNlbGYtPmJyb2tlbl9udl9y
dW5wbSAmJiBkZXYtPmJyb2tlbl9udl9ydW5wbTsKPiArfQo+ICsKPiAgLyoqCj4gICAqIHBjaV9y
YXdfc2V0X3Bvd2VyX3N0YXRlIC0gVXNlIFBDSSBQTSByZWdpc3RlcnMgdG8gc2V0IHRoZSBwb3dl
ciBzdGF0ZSBvZgo+ICAgKgkJCSAgICAgZ2l2ZW4gUENJIGRldmljZQo+IEBAIC04NTAsNiArODU3
LDEwIEBAIHN0YXRpYyBpbnQgcGNpX3Jhd19zZXRfcG93ZXJfc3RhdGUoc3RydWN0IHBjaV9kZXYg
KmRldiwgcGNpX3Bvd2VyX3Qgc3RhdGUpCj4gIAkgICB8fCAoc3RhdGUgPT0gUENJX0QyICYmICFk
ZXYtPmQyX3N1cHBvcnQpKQo+ICAJCXJldHVybiAtRUlPOwo+ICAKPiArCS8qIGNoZWNrIGlmIHRo
ZSBidXMgY29udHJvbGxlciBjYXVzZXMgaXNzdWVzICovCj4gKwlpZiAoc3RhdGUgIT0gUENJX0Qw
ICYmIHBhcmVudF9icm9rZW5fY2hpbGRfcG0oZGV2KSkKPiArCQlyZXR1cm4gMDsKPiArCj4gIAlw
Y2lfcmVhZF9jb25maWdfd29yZChkZXYsIGRldi0+cG1fY2FwICsgUENJX1BNX0NUUkwsICZwbWNz
cik7Cj4gIAo+ICAJLyoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcXVpcmtzLmMgYi9kcml2
ZXJzL3BjaS9xdWlya3MuYwo+IGluZGV4IDQ0YzRhZTFhYmQwMC4uYzJmMjBiNzQ1ZGQ0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcGNpL3F1aXJrcy5jCj4gKysrIGIvZHJpdmVycy9wY2kvcXVpcmtz
LmMKPiBAQCAtNTI2OCwzICs1MjY4LDU1IEBAIHN0YXRpYyB2b2lkIHF1aXJrX3Jlc2V0X2xlbm92
b190aGlua3BhZF9wNTBfbnZncHUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gIERFQ0xBUkVfUENJ
X0ZJWFVQX0NMQVNTX0ZJTkFMKFBDSV9WRU5ET1JfSURfTlZJRElBLCAweDEzYjEsCj4gIAkJCSAg
ICAgIFBDSV9DTEFTU19ESVNQTEFZX1ZHQSwgOCwKPiAgCQkJICAgICAgcXVpcmtfcmVzZXRfbGVu
b3ZvX3RoaW5rcGFkX3A1MF9udmdwdSk7Cj4gKwo+ICsvKgo+ICsgKiBTb21lIEludGVsIFBDSWUg
YnJpZGdlcyBjYXVzZSBkZXZpY2VzIHRvIGRpc2FwcGVhciBmcm9tIHRoZSBQQ0llIGJ1cyBhZnRl
cgo+ICsgKiB0aG9zZSB3ZXJlIHB1dCBpbnRvIEQzY29sZCBzdGF0ZSBpZiB0aGV5IHdlcmUgcHV0
IGludG8gYSBub24gRDAgUENJIFBNCj4gKyAqIGRldmljZSBzdGF0ZSBiZWZvcmUgZG9pbmcgc28u
Cj4gKyAqCj4gKyAqIFRoaXMgbGVhZHMgdG8gdmFyaW91cyBpc3N1ZSBkaWZmZXJlbnQgaXNzdWVz
IHdoaWNoIGFsbCBtYW5pZmVzdCBkaWZmZXJlbnRseSwKPiArICogYnV0IGhhdmUgdGhlIHNhbWUg
cm9vdCBjYXVzZToKPiArICogIC0gQUlNTCBjb2RlIGV4ZWN1dGlvbiBoaXRzIGFuIGluZmluaXRl
IGxvb3AgKGFzIHRoZSBjb2Ugd2FpdHMgb24gZGV2aWNlCj4gKyAqICAgIG1lbW9yeSB0byBjaGFu
Z2UpLgo+ICsgKiAgLSBrZXJuZWwgY3Jhc2hlcywgYXMgYWxsIHBjaSByZWFkcyByZXR1cm4gLTEs
IHdoaWNoIG1vc3QgY29kZSBpc24ndCBhYmxlCj4gKyAqICAgIHRvIGhhbmRsZSB3ZWxsIGVub3Vn
aC4KPiArICogIC0gc3VkZGVuIHNodXRkb3ducywgYXMgdGhlIGtlcm5lbCBpZGVudGlmaWVkIGFu
IHVucmVjb3ZlcmFibGUgZXJyb3IgYWZ0ZXIKPiArICogICAgdXNlcnNwYWNlIHRyaWVzIHRvIGFj
Y2VzcyB0aGUgR1BVLgo+ICsgKgo+ICsgKiBJbiBhbGwgY2FzZXMgZG1lc2cgd2lsbCBjb250YWlu
IGF0IGxlYXN0IG9uZSBsaW5lIGxpa2UgdGhpczoKPiArICogJ25vdXZlYXUgMDAwMDowMTowMC4w
OiBSZWZ1c2VkIHRvIGNoYW5nZSBwb3dlciBzdGF0ZSwgY3VycmVudGx5IGluIEQzJwo+ICsgKiBm
b2xsb3dlZCBieSBhIGxvdCBvZiBub3V2ZWF1IHRpbWVvdXRzLgo+ICsgKgo+ICsgKiBBQ1BJIGNv
ZGUgd3JpdGVzIGJpdCAweDgwIHRvIHRoZSBub3QgZG9jdW1lbnRlZCBQQ0kgcmVnaXN0ZXIgMHgy
NDggb2YgdGhlCj4gKyAqIFBDSWUgYnJpZGdlIGNvbnRyb2xsZXIgaW4gb3JkZXIgdG8gcG93ZXIg
ZG93biB0aGUgR1BVLgo+ICsgKiBOb25ldGhlbGVzcywgdGhlcmUgYXJlIG90aGVyIGNvZGUgcGF0
aHMgaW5zaWRlIHRoZSBBQ1BJIGZpcm13YXJlIHdoaWNoIHVzZQo+ICsgKiBvdGhlciByZWdpc3Rl
cnMsIHdoaWNoIHNlZW0gdG8gd29yayBmaW5lOgo+ICsgKiAgLSAweGJjIGJpdCAweDIwIChwdWJs
aWNseSBhdmFpbGFibGUgZG9jdW1lbnRhdGlvbiBjbGFpbXMgJ3Jlc2VydmVkJykKPiArICogIC0g
MHhiMCBiaXQgMHgxMCAobGluayBkaXNhYmxlKQo+ICsgKiBDaGFuZ2luZyB0aGUgY29uZGl0aW9u
cyBpbnNpZGUgdGhlIGZpcm13YXJlIGJ5IHBva2luZyBpbnRvIHRoZSByZWxldmFudAo+ICsgKiBh
ZGRyZXNzZXMgZG9lcyByZXNvbHZlIHRoZSBpc3N1ZSwgYnV0IGl0IHNlZW1lZCB0byBiZSBBQ1BJ
IHByaXZhdGUgbWVtb3J5Cj4gKyAqIGFuZCBub3QgYW55IGRldmljZSBhY2Nlc3NpYmxlIG1lbW9y
eSBhdCBhbGwsIHNvIHRoZXJlIGlzIG5vIHBvcnRhYmxlIHdheSBvZgo+ICsgKiBjaGFuZ2luZyB0
aGUgY29uZGl0aW9ucy4KPiArICoKPiArICogVGhlIG9ubHkgc3lzdGVtcyB3aGVyZSB0aGlzIGJl
aGF2aW9yIGNhbiBiZSBzZWVuIGFyZSBoeWJyaWQgZ3JhcGhpY3MgbGFwdG9wcwo+ICsgKiB3aXRo
IGEgc2Vjb25kYXJ5IE52aWRpYSBQYXNjYWwgR1BVLiBJdCBjYW5ub3QgYmUgcnVsZWQgb3V0IHRo
YXQgdGhpcyBpc3N1ZQo+ICsgKiBvbmx5IG9jY3VycyBpbiBjb21iaW5hdGlvbiB3aXRoIGxpc3Rl
ZCBJbnRlbCBQQ0llIGJyaWRnZSBjb250cm9sbGVycyBhbmQKPiArICogdGhlIG1lbnRpb25lZCBH
UFVzIG9yIGlmIGl0J3Mgb25seSBhIGh3IGJ1ZyBpbiB0aGUgYnJpZGdlIGNvbnRyb2xsZXIuCj4g
KyAqCj4gKyAqIEJ1dCBiZWNhdXNlIHRoaXMgaXNzdWUgd2FzIE5PVCBzZWVuIG9uIGxhcHRvcHMg
d2l0aCBhbiBOdmlkaWEgUGFzY2FsIEdQVQo+ICsgKiBhbmQgYW4gSW50ZWwgQ29mZmVlIExha2Ug
U29DLCB0aGVyZSBpcyBhIGhpZ2hlciBjaGFuY2Ugb2YgdGhlcmUgYmVpbmcgYSBidWcKPiArICog
aW4gdGhlIGJyaWRnZSBjb250cm9sbGVyIHJhdGhlciB0aGFuIGluIHRoZSBHUFUuCj4gKyAqCj4g
KyAqIFRoaXMgaXNzdWUgd2FzIG5vdCBhYmxlIHRvIGJlIHJlcHJvZHVjZWQgb24gbm9uIGxhcHRv
cCBzeXN0ZW1zLgo+ICsgKi8KPiArCj4gK3N0YXRpYyB2b2lkIHF1aXJrX2Jyb2tlbl9udl9ydW5w
bShzdHJ1Y3QgcGNpX2RldiAqZGV2KQo+ICt7Cj4gKwlkZXYtPmJyb2tlbl9udl9ydW5wbSA9IDE7
CgpDYW4geW91IHVzZSB0aGUgZXhpc3RpbmcgUENJX0RFVl9GTEFHU19OT19EMyBmbGFnIGZvciB0
aGlzIGluc3RlYWQgb2YKYWRkaW5nIGEgbmV3IGZsYWc/CgpJIHdvdWxkIHB1dCB0aGUgcGFyZW50
X2Jyb2tlbl9jaGlsZF9wbSgpIGxvZ2ljIGhlcmUsIGlmIHBvc3NpYmxlLAplLmcuLCBzb21ldGhp
bmcgbGlrZToKCiAgc3RydWN0IHBjaV9kZXYgKmJyaWRnZSA9IHBjaV91cHN0cmVhbV9icmlkZ2Uo
ZGV2KTsKCiAgaWYgKGJyaWRnZSAmJgogICAgICBicmlkZ2UtPnZlbmRvciA9PSBQQ0lfVkVORE9S
X0lEX0lOVEVMICYmIGJyaWRnZS0+ZGV2aWNlID09IDB4MTkwMSkKCWRldi0+ZGV2X2ZsYWdzIHw9
IFBDSV9ERVZfRkxBR1NfTk9fRDM7Cgo+ICt9Cj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0NMQVNTX0ZJ
TkFMKFBDSV9WRU5ET1JfSURfTlZJRElBLCBQQ0lfQU5ZX0lELAo+ICsJCQkgICAgICBQQ0lfQkFT
RV9DTEFTU19ESVNQTEFZLCAxNiwKPiArCQkJICAgICAgcXVpcmtfYnJva2VuX252X3J1bnBtKTsK
PiArLyoga2FieSBsYWtlICovCj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBDSV9WRU5ET1Jf
SURfSU5URUwsIDB4MTkwMSwKPiArCQkJcXVpcmtfYnJva2VuX252X3J1bnBtKTsKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9wY2kuaCBiL2luY2x1ZGUvbGludXgvcGNpLmgKPiBpbmRleCBh
YzhhNmM0ZTE3OTIuLjkwM2EwYjNhMzllYyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3Bj
aS5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9wY2kuaAo+IEBAIC00MTYsNiArNDE2LDcgQEAgc3Ry
dWN0IHBjaV9kZXYgewo+ICAJdW5zaWduZWQgaW50CV9fYWVyX2Zpcm13YXJlX2ZpcnN0X3ZhbGlk
OjE7Cj4gIAl1bnNpZ25lZCBpbnQJX19hZXJfZmlybXdhcmVfZmlyc3Q6MTsKPiAgCXVuc2lnbmVk
IGludAlicm9rZW5faW50eF9tYXNraW5nOjE7CS8qIElOVHggbWFza2luZyBjYW4ndCBiZSB1c2Vk
ICovCj4gKwl1bnNpZ25lZCBpbnQJYnJva2VuX252X3J1bnBtOjE7CS8qIHNvbWUgY29tYmluYXRp
b25zIG9mIGludGVsIGJyaWRnZSBjb250cm9sbGVyIGFuZCBudmlkaWEgR1BVcyBicmVhayBydGQz
ICovCj4gIAl1bnNpZ25lZCBpbnQJaW9fd2luZG93XzFrOjE7CQkvKiBJbnRlbCBicmlkZ2UgMUsg
SS9PIHdpbmRvd3MgKi8KPiAgCXVuc2lnbmVkIGludAlpcnFfbWFuYWdlZDoxOwo+ICAJdW5zaWdu
ZWQgaW50CWhhc19zZWNvbmRhcnlfbGluazoxOwo+IC0tIAo+IDIuMjEuMAo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
