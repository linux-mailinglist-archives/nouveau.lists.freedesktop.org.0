Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D59A515608A
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2020 22:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBBC6E11A;
	Fri,  7 Feb 2020 21:10:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2080D6E119;
 Fri,  7 Feb 2020 21:10:36 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3dd20f0000>; Fri, 07 Feb 2020 13:09:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Feb 2020 13:10:35 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Feb 2020 13:10:35 -0800
Received: from [172.20.40.97] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Feb
 2020 21:10:34 +0000
From: James Jones <jajones@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, <bskeggs@redhat.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20200206101942.1412-1-tzimmermann@suse.de>
 <20200206101942.1412-5-tzimmermann@suse.de>
 <616dead7-030a-b678-3040-9e317549812e@nvidia.com>
 <5d0bc649-9d82-295e-fe00-58e9350f6d94@suse.de>
 <5d18f259-9d1c-2b83-428d-6e21b6cf779c@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <9695f3cf-076a-de49-53c9-75944bb4fb8b@nvidia.com>
Date: Fri, 7 Feb 2020 13:11:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5d18f259-9d1c-2b83-428d-6e21b6cf779c@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1581109775; bh=nWsrTqxVMpyEcjmL1DofVw0mxNb/+vF9DQKh9bZJJXs=;
 h=X-PGP-Universal:Subject:From:To:CC:References:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=eDPZw3JufJN4Jxa4lvF6XCR8OYSmeI8MecOyCFz8v/uaO9VmXxI6/Mu3mJKbVGcCe
 w7jB8k7g8yxCt7bAJVjsJqePIWlcTC9wNzKlXNB84UBG1ZnWHKJ3DR/9iHAiIoknRB
 ZmijpVPHs5hkX+lsrikITfWTCxkJ1GrEM/lkp9czKZZObvcfrVPZdvVXgKqjH0gUBg
 1Uxw1xf2E7fZxaSjcogPXyJv0xGFQgsIjauH3C+lundnuQmL9pmhJ6tKJwlthIR1qV
 R8fxj8L0PCWI+r0pgN4FXnWgF1j+zpUvH93ZxsBPH+wkAdDejmFDDNLX+0TEifQxot
 lZSSrDRnnhlUA==
Subject: Re: [Nouveau] [PATCH 4/4] drm/nouveau: Remove struct
 nouveau_framebuffer
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SSd2ZSBzZW50IG91dCBhIHY0IHZlcnNpb24gb2YgdGhlIGZvcm1hdCBtb2RpZmllciBwYXRjaGVz
IHdoaWNoIGF2b2lkIApjYWNoaW5nIHZhbHVlcyBpbiB0aGUgbm91dmVhdV9mcmFtZWJ1ZmZlciBz
dHJ1Y3QuICBJdCB3aWxsIGhhdmUgYSBmZXcgCnRyaXZpYWwgY29uZmxpY3RzIHdpdGggeW91ciBz
ZXJpZXMsIGJ1dCBzaG91bGQgbWFrZSB0aGVtIHN0cnVjdHVyYWxseSAKY29tcGF0aWJsZS4KCkkn
bSBmaW5lIHdpdGggZWl0aGVyIHYzIG9yIHY0IG9mIG15IHNlcmllcyBwZXJzb25hbGx5LCBidXQg
aWYgdGhlc2UgCmNsZWFudXAgcGF0Y2hlcyBhcmUgdGFrZW4sIG9ubHkgdjQgd2lsbCB3b3JrLgoK
VGhhbmtzLAotSmFtZXMKCk9uIDIvNi8yMCA4OjQ1IEFNLCBKYW1lcyBKb25lcyB3cm90ZToKPiBZ
ZXMsIHRoYXQncyBjZXJ0YWlubHkgdmlhYmxlLsKgIElmIHRoYXQncyB0aGUgZ2VuZXJhbCBwcmVm
ZXJlbmNlIGluIAo+IGRpcmVjdGlvbiwgSSdsbCByZXdvcmsgdGhhdCBwYXRjaGVzIHRvIGRvIHNv
Lgo+IAo+IFRoYW5rcywKPiAtSmFtZXMKPiAKPiBPbiAyLzYvMjAgNzo0OSBBTSwgVGhvbWFzIFpp
bW1lcm1hbm4gd3JvdGU6Cj4+IEhpIEphbWVzCj4+Cj4+IEFtIDA2LjAyLjIwIHVtIDE2OjE3IHNj
aHJpZWIgSmFtZXMgSm9uZXM6Cj4+PiBOb3RlIEknbSBhZGRpbmcgc29tZSBmaWVsZHMgdG8gbm91
dmVhdV9mcmFtZWJ1ZmZlciBpbiB0aGUgc2VyaWVzCj4+PiAiZHJtL25vdXZlYXU6IFN1cHBvcnQg
TlZJRElBIGZvcm1hdCBtb2RpZmllcnMuIsKgIEkgc2VudCBvdXQgdjMgb2YgdGhhdAo+Pj4geWVz
dGVyZGF5LsKgIEl0IHdvdWxkIHByb2JhYmx5IHN0aWxsIGJlIHBvc3NpYmxlIHRvIGF2b2lkIHRo
ZW0gYnkKPj4+IHJlLWV4dHJhY3RpbmcgdGhlIHJlbGV2YW50IGRhdGEgZnJvbSB0aGUgZm9ybWF0
IG1vZGlmaWVyIG9uIHRoZSBmbHkgd2hlbgo+Pj4gbmVlZGVkLCBidXQgaXQgaXMgc2ltcGxlciBh
bmQgbGlrZWx5IGxlc3MgZXJyb3ItcHJvbmUgd2l0aCB0aGUgd3JhcHBlcgo+Pj4gc3RydWN0Lgo+
Pgo+PiBUaGFua3MgZm9yIHRoZSBub3RlLgo+Pgo+PiBJIGp1c3QgdG9vayBhIGxvb2sgYXQgeW91
ciBwYXRjaHNldC4gSSB0aGluayBzdHJ1Y3Qgbm91dmVhdV9mcmFtZWJ1ZmZlcgo+PiBzaG91bGQg
bm90IHN0b3JlIHRpbGVfbW9kZSBhbmQga2luZC4gQUZBSUNUIHRoZXJlIGFyZSBvbmx5IHR3byB0
cml2aWFsCj4+IHBsYWNlcyB3aGVyZSB0aGVzZSB2YWx1ZXMgYXJlIHVzZWQgYW5kIHRoZXkgY2Fu
IGJlIGV4dHJhY3RlZCBmcm9tIHRoZQo+PiBmcmFtZWJ1ZmZlciBhdCBhbnkgdGltZS4KPj4KPj4g
SSdkIHN1Z2dlc3QgdG8gZXhwYW5kIG5vdXZlYXVfZGVjb2RlX21vZCgpIHRvIHRha2UgYSBkcm1f
ZnJhbWVidWZmZXIgYW5kCj4+IHJldHVybiB0aGUgY29ycmVjdCB2YWx1ZXMuIEtpbmQgb2Ygd2hh
dCB5b3UgZG8gaW4KPj4gbm91dmVhdV9mcmFtZWJ1ZmZlcl9uZXcoKSBuZWFyIGxpbmUgMzMwLgo+
Pgo+PiBUaG91Z2h0cz8KPj4KPj4gQmVzdCByZWdhcmRzCj4+IFRob21hcwo+Pgo+PiBbMV0gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy83MDc4Ni8jcmV2Mwo+Pgo+Pj4K
Pj4+IFRoYW5rcywKPj4+IC1KYW1lcwo+Pj4KPj4+IE9uIDIvNi8yMCAyOjE5IEFNLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToKPj4+PiBBZnRlciBpdHMgY2xlYW51cCwgc3RydWN0IG5vdXZlYXVf
ZnJhbWVidWZmZXIgaXMgb25seSBhIHdyYXBwZXIgYXJvdW5kCj4+Pj4gc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlci4gVXNlIHRoZSBsYXR0ZXIgZGlyZWN0bHkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPj4+PiAtLS0KPj4+PiDC
oMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL3duZHcuY8KgwqAgfCAyNiAKPj4+
PiArKysrKysrKysrKy0tLS0tLS0tLS0tLQo+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kaXNwbGF5LmMgfCAxNCArKysrKystLS0tLS0KPj4+PiDCoMKgIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5oIHwgMTIgKy0tLS0tLS0tLS0KPj4+PiDC
oMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmJjb24uY8KgwqAgfCAxNCArKysr
KystLS0tLS0KPj4+PiDCoMKgIDQgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMzgg
ZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvd25kdy5jCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC93bmR3LmMKPj4+PiBpbmRleCBiYTEzOTk5NjVhMWMuLjRhNjdhNjU2ZTAwNyAxMDA2NDQKPj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93bmR3LmMKPj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC93bmR3LmMKPj4+PiBAQCAtNDAsMTEg
KzQwLDExIEBAIG52NTBfd25kd19jdHhkbWFfZGVsKHN0cnVjdCBudjUwX3duZHdfY3R4ZG1hIAo+
Pj4+ICpjdHhkbWEpCj4+Pj4gwqDCoCB9Cj4+Pj4gwqDCoCDCoCBzdGF0aWMgc3RydWN0IG52NTBf
d25kd19jdHhkbWEgKgo+Pj4+IC1udjUwX3duZHdfY3R4ZG1hX25ldyhzdHJ1Y3QgbnY1MF93bmR3
ICp3bmR3LCBzdHJ1Y3QKPj4+PiBub3V2ZWF1X2ZyYW1lYnVmZmVyICpmYikKPj4+PiArbnY1MF93
bmR3X2N0eGRtYV9uZXcoc3RydWN0IG52NTBfd25kdyAqd25kdywgc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAKPj4+PiAqZmIpCj4+Pj4gwqDCoCB7Cj4+Pj4gLcKgwqDCoCBzdHJ1Y3Qgbm91dmVhdV9k
cm0gKmRybSA9IG5vdXZlYXVfZHJtKGZiLT5iYXNlLmRldik7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qg
bm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKGZiLT5kZXYpOwo+Pj4+IMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgbnY1MF93bmR3X2N0eGRtYSAqY3R4ZG1hOwo+Pj4+IC3CoMKgwqAgc3RydWN0IG5v
dXZlYXVfYm8gKm52Ym8gPSBub3V2ZWF1X2dlbV9vYmplY3QoZmItPmJhc2Uub2JqWzBdKTsKPj4+
PiArwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1fb2JqZWN0KGZi
LT5vYmpbMF0pOwo+Pj4+IMKgwqDCoMKgwqDCoCBjb25zdCB1OMKgwqDCoCBraW5kID0gbnZiby0+
a2luZDsKPj4+PiDCoMKgwqDCoMKgwqAgY29uc3QgdTMyIGhhbmRsZSA9IDB4ZmIwMDAwMDAgfCBr
aW5kOwo+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgewo+Pj4+IEBAIC0yMzYsMTYgKzIzNiwxNiBA
QCBudjUwX3duZHdfYXRvbWljX2NoZWNrX2FjcXVpcmUoc3RydWN0IG52NTBfd25kdwo+Pj4+ICp3
bmR3LCBib29sIG1vZGVzZXQsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBudjUwX3duZHdfYXRvbSAqYXN5dywKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG52NTBfaGVhZF9hdG9tICphc3lo
KQo+Pj4+IMKgwqAgewo+Pj4+IC3CoMKgwqAgc3RydWN0IG5vdXZlYXVfZnJhbWVidWZmZXIgKmZi
ID0KPj4+PiBub3V2ZWF1X2ZyYW1lYnVmZmVyKGFzeXctPnN0YXRlLmZiKTsKPj4+PiArwqDCoMKg
IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gYXN5dy0+c3RhdGUuZmI7Cj4+Pj4gwqDCoMKg
wqDCoMKgIHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0od25kdy0+cGxhbmUu
ZGV2KTsKPj4+PiAtwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1f
b2JqZWN0KGZiLT5iYXNlLm9ialswXSk7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgbm91dmVhdV9ibyAq
bnZibyA9IG5vdXZlYXVfZ2VtX29iamVjdChmYi0+b2JqWzBdKTsKPj4+PiDCoMKgwqDCoMKgwqAg
aW50IHJldDsKPj4+PiDCoMKgIMKgwqDCoMKgwqAgTlZfQVRPTUlDKGRybSwgIiVzIGFjcXVpcmVc
biIsIHduZHctPnBsYW5lLm5hbWUpOwo+Pj4+IMKgwqAgLcKgwqDCoCBpZiAoYXN5dy0+c3RhdGUu
ZmIgIT0gYXJtdy0+c3RhdGUuZmIgfHwgIWFybXctPnZpc2libGUgfHwKPj4+PiBtb2Rlc2V0KSB7
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGFzeXctPmltYWdlLncgPSBmYi0+YmFzZS53aWR0aDsKPj4+
PiAtwqDCoMKgwqDCoMKgwqAgYXN5dy0+aW1hZ2UuaCA9IGZiLT5iYXNlLmhlaWdodDsKPj4+PiAr
wqDCoMKgIGlmIChmYiAhPSBhcm13LT5zdGF0ZS5mYiB8fCAhYXJtdy0+dmlzaWJsZSB8fCBtb2Rl
c2V0KSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFzeXctPmltYWdlLncgPSBmYi0+d2lkdGg7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGFzeXctPmltYWdlLmggPSBmYi0+aGVpZ2h0Owo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGFzeXctPmltYWdlLmtpbmQgPSBudmJvLT5raW5kOwo+Pj4+IMKgwqAg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IG52NTBfd25kd19hdG9taWNfY2hlY2tfYWNxdWlyZV9y
Z2IoYXN5dyk7Cj4+Pj4gQEAgLTI2MSwxMyArMjYxLDEzIEBAIG52NTBfd25kd19hdG9taWNfY2hl
Y2tfYWNxdWlyZShzdHJ1Y3QgbnY1MF93bmR3Cj4+Pj4gKnduZHcsIGJvb2wgbW9kZXNldCwKPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXN5dy0+aW1hZ2UuYmxvY2to
ID0gbnZiby0+bW9kZSA+PiA0Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxz
ZQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhc3l3LT5pbWFnZS5i
bG9ja2ggPSBudmJvLT5tb2RlOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFzeXctPmlt
YWdlLmJsb2Nrc1swXSA9IGZiLT5iYXNlLnBpdGNoZXNbMF0gLyA2NDsKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBhc3l3LT5pbWFnZS5ibG9ja3NbMF0gPSBmYi0+cGl0Y2hlc1swXSAvIDY0
Owo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXN5dy0+aW1hZ2UucGl0Y2hbMF0g
PSAwOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhc3l3LT5pbWFnZS5sYXlvdXQgPSAxOwo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYXN5dy0+aW1hZ2UuYmxvY2toID0gMDsKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGFzeXctPmltYWdlLmJsb2Nrc1swXSA9IDA7Cj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYXN5dy0+aW1hZ2UucGl0Y2hbMF0gPSBmYi0+YmFzZS5waXRjaGVz
WzBdOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFzeXctPmltYWdlLnBpdGNoWzBdID0g
ZmItPnBpdGNoZXNbMF07Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqAgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICghYXN5aC0+c3RhdGUuYXN5bmNfZmxpcCkKPj4+PiBAQCAtNDg2
LDE2ICs0ODYsMTYgQEAgbnY1MF93bmR3X2NsZWFudXBfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxh
bmUsCj4+Pj4gc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqb2xkX3N0YXRlKQo+Pj4+IMKgwqAgc3Rh
dGljIGludAo+Pj4+IMKgwqAgbnY1MF93bmR3X3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUsIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUKPj4+PiAqc3RhdGUpCj4+Pj4gwqDCoCB7Cj4+
Pj4gLcKgwqDCoCBzdHJ1Y3Qgbm91dmVhdV9mcmFtZWJ1ZmZlciAqZmIgPSBub3V2ZWF1X2ZyYW1l
YnVmZmVyKHN0YXRlLT5mYik7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpm
YiA9IHN0YXRlLT5mYjsKPj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm0g
PSBub3V2ZWF1X2RybShwbGFuZS0+ZGV2KTsKPj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IG52NTBf
d25kdyAqd25kdyA9IG52NTBfd25kdyhwbGFuZSk7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBu
djUwX3duZHdfYXRvbSAqYXN5dyA9IG52NTBfd25kd19hdG9tKHN0YXRlKTsKPj4+PiAtwqDCoMKg
IHN0cnVjdCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9nZW1fb2JqZWN0KHN0YXRlLT5mYi0+
b2JqWzBdKTsKPj4+PiArwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2JvICpudmJvID0gbm91dmVhdV9n
ZW1fb2JqZWN0KGZiLT5vYmpbMF0pOwo+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbnY1MF9oZWFk
X2F0b20gKmFzeWg7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBudjUwX3duZHdfY3R4ZG1hICpj
dHhkbWE7Cj4+Pj4gwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4+Pj4gwqDCoCAtwqDCoMKgIE5WX0FU
T01JQyhkcm0sICIlcyBwcmVwYXJlOiAlcFxuIiwgcGxhbmUtPm5hbWUsIHN0YXRlLT5mYik7Cj4+
Pj4gK8KgwqDCoCBOVl9BVE9NSUMoZHJtLCAiJXMgcHJlcGFyZTogJXBcbiIsIHBsYW5lLT5uYW1l
LCBmYik7Cj4+Pj4gwqDCoMKgwqDCoMKgIGlmICghYXN5dy0+c3RhdGUuZmIpCj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gwqDCoCBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCj4+Pj4gaW5kZXggYmJiZmY1NWViNWQ1Li45NGY3ZmQ0
OGUxY2YgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
aXNwbGF5LmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3Bs
YXkuYwo+Pj4+IEBAIC0yMDcsMTAgKzIwNywxMCBAQCBpbnQKPj4+PiDCoMKgIG5vdXZlYXVfZnJh
bWVidWZmZXJfbmV3KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQsCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdl
bSwKPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgbm91dmVhdV9mcmFtZWJ1ZmZl
ciAqKnBmYikKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2ZyYW1lYnVm
ZmVyICoqcGZiKQo+Pj4+IMKgwqAgewo+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgbm91dmVhdV9k
cm0gKmRybSA9IG5vdXZlYXVfZHJtKGRldik7Cj4+Pj4gLcKgwqDCoCBzdHJ1Y3Qgbm91dmVhdV9m
cmFtZWJ1ZmZlciAqZmI7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsK
Pj4+PiDCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgwqDCoCAv
KiBZVVYgb3ZlcmxheXMgaGF2ZSBzcGVjaWFsIHJlcXVpcmVtZW50cyBwcmUtTlY1MCAqLwo+Pj4+
IEBAIC0yMzYsMTAgKzIzNiwxMCBAQCBub3V2ZWF1X2ZyYW1lYnVmZmVyX25ldyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAo+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoIShmYiA9ICpwZmIgPSBremFsbG9j
KHNpemVvZigqZmIpLCBHRlBfS0VSTkVMKSkpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FTk9NRU07Cj4+Pj4gwqDCoCAtwqDCoMKgIGRybV9oZWxwZXJfbW9kZV9maWxsX2ZiX3N0
cnVjdChkZXYsICZmYi0+YmFzZSwgbW9kZV9jbWQpOwo+Pj4+IC3CoMKgwqAgZmItPmJhc2Uub2Jq
WzBdID0gZ2VtOwo+Pj4+ICvCoMKgwqAgZHJtX2hlbHBlcl9tb2RlX2ZpbGxfZmJfc3RydWN0KGRl
diwgZmIsIG1vZGVfY21kKTsKPj4+PiArwqDCoMKgIGZiLT5vYmpbMF0gPSBnZW07Cj4+Pj4gwqDC
oCAtwqDCoMKgIHJldCA9IGRybV9mcmFtZWJ1ZmZlcl9pbml0KGRldiwgJmZiLT5iYXNlLAo+Pj4+
ICZub3V2ZWF1X2ZyYW1lYnVmZmVyX2Z1bmNzKTsKPj4+PiArwqDCoMKgIHJldCA9IGRybV9mcmFt
ZWJ1ZmZlcl9pbml0KGRldiwgZmIsICZub3V2ZWF1X2ZyYW1lYnVmZmVyX2Z1bmNzKTsKPj4+PiDC
oMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZnJlZShmYik7
Cj4+Pj4gwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4gQEAgLTI1MCw3ICsyNTAsNyBAQCBu
b3V2ZWF1X3VzZXJfZnJhbWVidWZmZXJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlCj4+Pj4gKmRl
diwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9m
aWxlICpmaWxlX3ByaXYsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICptb2RlX2NtZCkKPj4+PiDCoMKgIHsKPj4+
PiAtwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2ZyYW1lYnVmZmVyICpmYjsKPj4+PiArwqDCoMKgIHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOwo+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKmdlbTsKPj4+PiDCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4+PiDCoMKgIEBAIC0y
NjAsNyArMjYwLDcgQEAgbm91dmVhdV91c2VyX2ZyYW1lYnVmZmVyX2NyZWF0ZShzdHJ1Y3QKPj4+
PiBkcm1fZGV2aWNlICpkZXYsCj4+Pj4gwqDCoCDCoMKgwqDCoMKgIHJldCA9IG5vdXZlYXVfZnJh
bWVidWZmZXJfbmV3KGRldiwgbW9kZV9jbWQsIGdlbSwgJmZiKTsKPj4+PiDCoMKgwqDCoMKgwqAg
aWYgKHJldCA9PSAwKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gJmZiLT5iYXNlOwo+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmI7Cj4+Pj4gwqDCoCDCoMKgwqDCoMKgIGRybV9nZW1f
b2JqZWN0X3B1dF91bmxvY2tlZChnZW0pOwo+Pj4+IMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BU
UihyZXQpOwo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2Rpc3BsYXkuaAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5
LmgKPj4+PiBpbmRleCA1NmMxZGVjOGZjMjguLjA4MmJiMDY3ZDU3NSAxMDA2NDQKPj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuaAo+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGlzcGxheS5oCj4+Pj4gQEAgLTgsMjEgKzgs
MTEgQEAKPj4+PiDCoMKgIMKgICNpbmNsdWRlIDxkcm0vZHJtX2ZyYW1lYnVmZmVyLmg+Cj4+Pj4g
wqDCoCAtc3RydWN0IG5vdXZlYXVfZnJhbWVidWZmZXIgewo+Pj4+IC3CoMKgwqAgc3RydWN0IGRy
bV9mcmFtZWJ1ZmZlciBiYXNlOwo+Pj4+IC19Owo+Pj4+IC0KPj4+PiAtc3RhdGljIGlubGluZSBz
dHJ1Y3Qgbm91dmVhdV9mcmFtZWJ1ZmZlciAqCj4+Pj4gLW5vdXZlYXVfZnJhbWVidWZmZXIoc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIpCj4+Pj4gLXsKPj4+PiAtwqDCoMKgIHJldHVybiBjb250
YWluZXJfb2YoZmIsIHN0cnVjdCBub3V2ZWF1X2ZyYW1lYnVmZmVyLCBiYXNlKTsKPj4+PiAtfQo+
Pj4+IC0KPj4+PiDCoMKgIGludAo+Pj4+IMKgwqAgbm91dmVhdV9mcmFtZWJ1ZmZlcl9uZXcoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnN0IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICptb2RlX2NtZCwKPj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtLAo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2ZyYW1lYnVmZmVyICoqcGZiKTsKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICoqcGZiKTsKPj4+
PiDCoMKgIMKgIHN0cnVjdCBub3V2ZWF1X2Rpc3BsYXkgewo+Pj4+IMKgwqDCoMKgwqDCoCB2b2lk
ICpwcml2Owo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2ZiY29uLmMKPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmJjb24uYwo+
Pj4+IGluZGV4IDAyYjM2YjQ0NDA5Yy4uZDc4YmMwM2FkM2I4IDEwMDY0NAo+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmJjb24uYwo+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZmJjb24uYwo+Pj4+IEBAIC0zMTIsNyArMzEyLDcgQEAg
bm91dmVhdV9mYmNvbl9jcmVhdGUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciwKPj4+PiDC
oMKgwqDCoMKgwqAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShkZXYpOwo+
Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbnZpZl9kZXZpY2UgKmRldmljZSA9ICZkcm0tPmNsaWVu
dC5kZXZpY2U7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBmYl9pbmZvICppbmZvOwo+Pj4+IC3C
oMKgwqAgc3RydWN0IG5vdXZlYXVfZnJhbWVidWZmZXIgKmZiOwo+Pj4+ICvCoMKgwqAgc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmI7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2No
YW5uZWwgKmNoYW47Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2JvICpudmJvOwo+
Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiBtb2RlX2NtZDsKPj4+PiBA
QCAtMzY3LDcgKzM2Nyw3IEBAIG5vdXZlYXVfZmJjb25fY3JlYXRlKHN0cnVjdCBkcm1fZmJfaGVs
cGVyICpoZWxwZXIsCj4+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgIMKgwqDCoMKgwqAgLyog
c2V0dXAgaGVscGVyICovCj4+Pj4gLcKgwqDCoCBmYmNvbi0+aGVscGVyLmZiID0gJmZiLT5iYXNl
Owo+Pj4+ICvCoMKgwqAgZmJjb24tPmhlbHBlci5mYiA9IGZiOwo+Pj4+IMKgwqAgwqDCoMKgwqDC
oCBpZiAoIWNoYW4pCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5mby0+ZmxhZ3MgPSBGQklO
Rk9fSFdBQ0NFTF9ESVNBQkxFRDsKPj4+PiBAQCAtMzkzLDcgKzM5Myw3IEBAIG5vdXZlYXVfZmJj
b25fY3JlYXRlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIsCj4+Pj4gwqDCoCDCoMKgwqDC
oMKgIC8qIFRvIGFsbG93IHJlc2l6ZWluZyB3aXRob3V0IHN3YXBwaW5nIGJ1ZmZlcnMgKi8KPj4+
PiDCoMKgwqDCoMKgwqAgTlZfSU5GTyhkcm0sICJhbGxvY2F0ZWQgJWR4JWQgZmI6IDB4JWxseCwg
Ym8gJXBcbiIsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGZiLT5iYXNlLndpZHRoLCBmYi0+YmFzZS5o
ZWlnaHQsIG52Ym8tPmJvLm9mZnNldCwgbnZibyk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGZiLT53
aWR0aCwgZmItPmhlaWdodCwgbnZiby0+Ym8ub2Zmc2V0LCBudmJvKTsKPj4+PiDCoMKgIMKgwqDC
oMKgwqAgdmdhX3N3aXRjaGVyb29fY2xpZW50X2ZiX3NldChkZXYtPnBkZXYsIGluZm8pOwo+Pj4+
IMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+PiBAQCAtNDEzLDE4ICs0MTMsMTggQEAgbm91dmVh
dV9mYmNvbl9jcmVhdGUoc3RydWN0IGRybV9mYl9oZWxwZXIgCj4+Pj4gKmhlbHBlciwKPj4+PiDC
oMKgIHN0YXRpYyBpbnQKPj4+PiDCoMKgIG5vdXZlYXVfZmJjb25fZGVzdHJveShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3Qgbm91dmVhdV9mYmRldgo+Pj4+ICpmYmNvbikKPj4+PiDCoMKg
IHsKPj4+PiAtwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2ZyYW1lYnVmZmVyICpub3V2ZWF1X2ZiID0K
Pj4+PiBub3V2ZWF1X2ZyYW1lYnVmZmVyKGZiY29uLT5oZWxwZXIuZmIpOwo+Pj4+ICvCoMKgwqAg
c3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBmYmNvbi0+aGVscGVyLmZiOwo+Pj4+IMKgwqDC
oMKgwqDCoCBzdHJ1Y3Qgbm91dmVhdV9ibyAqbnZibzsKPj4+PiDCoMKgIMKgwqDCoMKgwqAgZHJt
X2ZiX2hlbHBlcl91bnJlZ2lzdGVyX2ZiaSgmZmJjb24tPmhlbHBlcik7Cj4+Pj4gwqDCoMKgwqDC
oMKgIGRybV9mYl9oZWxwZXJfZmluaSgmZmJjb24tPmhlbHBlcik7Cj4+Pj4gwqDCoCAtwqDCoMKg
IGlmIChub3V2ZWF1X2ZiICYmIG5vdXZlYXVfZmItPmJhc2Uub2JqWzBdKSB7Cj4+Pj4gLcKgwqDC
oMKgwqDCoMKgIG52Ym8gPSBub3V2ZWF1X2dlbV9vYmplY3Qobm91dmVhdV9mYi0+YmFzZS5vYmpb
MF0pOwo+Pj4+ICvCoMKgwqAgaWYgKGZiICYmIGZiLT5vYmpbMF0pIHsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgbnZibyA9IG5vdXZlYXVfZ2VtX29iamVjdChmYi0+b2JqWzBdKTsKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBub3V2ZWF1X3ZtYV9kZWwoJmZiY29uLT52bWEpOwo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG5vdXZlYXVfYm9fdW5tYXAobnZibyk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbm91dmVhdV9ib191bnBpbihudmJvKTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgZHJtX2Zy
YW1lYnVmZmVyX3B1dCgmbm91dmVhdV9mYi0+YmFzZSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRy
bV9mcmFtZWJ1ZmZlcl9wdXQoZmIpOwo+Pj4+IMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoCDCoMKg
wqDCoMKgIHJldHVybiAwOwo+Pj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1Cg==
