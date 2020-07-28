Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433023F895
	for <lists+nouveau@lfdr.de>; Sat,  8 Aug 2020 21:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17D26E241;
	Sat,  8 Aug 2020 19:18:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E476E241;
 Tue, 28 Jul 2020 18:43:11 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2071640000>; Tue, 28 Jul 2020 11:41:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 28 Jul 2020 11:43:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 28 Jul 2020 11:43:11 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 18:43:05 +0000
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.com>, <intel-gfx@lists.freedesktop.com>,
 <nouveau@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <bskeggs@redhat.com>, <alexander.deucher@amd.com>,
 <david1.zhou@amd.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
 <20200727205357.27839-5-ddadap@nvidia.com>
 <3c355e4d-b9ff-66b7-e9e3-86027deeba6d@amd.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <4101c4a9-d97d-ee99-8c67-b8f92fcb4bfa@nvidia.com>
Date: Tue, 28 Jul 2020 13:44:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c355e4d-b9ff-66b7-e9e3-86027deeba6d@amd.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595961700; bh=w5wA9DxednAyQ77Vd7csvDd3uO1uwD2I0XlWLCG8d+8=;
 h=X-PGP-Universal:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=SNkBXL9ij/D7dTOdE+gBDkLNbGuk6CWLrHggrbpfmk7+PqP22Llkg0IGP23fwRJw9
 2ZiOjRJTb+0Io/jBPddVNtXx4e0EW4jyTWmZfjYND8hvLNodILqWRKpirCG+92l1Na
 Rm+aQnBtvbxFZzawxhCIiEYAcVG1PqkqpAPldWvTUUeoyOVPZYEtQS35J6VOxflwHD
 NI0F+pezUhUnsXs+vbEQOZbgeGRbqD7dkqWZX7skGalOxrXe5T0iAU6MB1VqjaUclK
 F2RC4C5AJTSqJoq+0jBaDa+S0VYmgzw9ncFPXAGBShvHJwIO7hYVhw7/LwZBsqYP34
 aJe9XkXleWKYQ==
X-Mailman-Approved-At: Sat, 08 Aug 2020 19:18:33 +0000
Subject: Re: [Nouveau] [PATCH 4/4] radeon: fall back to ACPI EDID retrieval
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gNy8yOC8yMCAxOjUwIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Cj4gQW0gMjcuMDcu
MjAgdW0gMjI6NTMgc2NocmllYiBEYW5pZWwgRGFkYXA6Cj4+IEZhbGwgYmFjayB0byByZXRyaWV2
aW5nIHRoZSBFRElEIHZpYSB0aGUgQUNQSSBfRERDIG1ldGhvZCwgd2hlbiBwcmVzZW50Cj4+IGZv
ciBub3RlYm9vayBpbnRlcm5hbCBwYW5lbHMsIHdoZW4gcmV0cmlldmluZyBCSU9TLWVtYmVkZGVk
IEVESURzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgRGFkYXAgPGRkYWRhcEBudmlkaWEu
Y29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5j
IHwgNiArKystLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2NvbWJpb3MuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb21iaW9zLmMK
Pj4gaW5kZXggYzNlNDljOTczODEyLi5kZTgwMWQ5ZmNhNTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2NvbWJpb3MuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9jb21iaW9zLmMKPj4gQEAgLTQwMSw5ICs0MDEsOCBAQCBib29sIHJh
ZGVvbl9jb21iaW9zX2NoZWNrX2hhcmRjb2RlZF9lZGlkKHN0cnVjdCAKPj4gcmFkZW9uX2Rldmlj
ZSAqcmRldikKPj4gwqAgc3RydWN0IGVkaWQgKgo+PiDCoCByYWRlb25fYmlvc19nZXRfaGFyZGNv
ZGVkX2VkaWQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4+IMKgIHsKPj4gLcKgwqDCoMKg
IHN0cnVjdCBlZGlkICplZGlkOwo+PiAtCj4+IMKgwqDCoMKgwqAgaWYgKHJkZXYtPm1vZGVfaW5m
by5iaW9zX2hhcmRjb2RlZF9lZGlkKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGVkaWQgKmVkaWQ7Cj4KPiBUaGF0J3MgYW4gdW5yZWxhdGVkIGFuIGluY29ycmVjdCBzdHls
ZSBjaGFuZ2UuIFlvdSBuZWVkIGEgYmxhbmsgbGluZQo+IGFmdGVyIGRlY2xhcmF0aW9uLgoKCkFo
LCB5ZXMsIHRoYXQgZG9lc24ndCByZWFsbHkgbmVlZCB0byBiZSBjaGFuZ2VkLiBJJ2xsIHJlbW92
ZSBpdCBmcm9tIAp0aGlzIHBhdGNoLiBXb3VsZCBhIHNlcGFyYXRlIHBhdGNoIHRvIGNoYW5nZSB0
aGUgc2NvcGUgb2YgdGhhdCAKZGVjbGFyYXRpb24gKHdpdGggYSBibGFuayBsaW5lIGFmdGVyKSBi
ZSB3ZWxjb21lLCBvciBzaG91bGQgSSBqdXN0IGxlYXZlIAppdCBhbG9uZT8KCgo+Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVkaWQgPSAKPj4ga21hbGxvYyhyZGV2LT5tb2RlX2luZm8u
Ymlvc19oYXJkY29kZWRfZWRpZF9zaXplLCBHRlBfS0VSTkVMKTsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKGVkaWQpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1lbWNweSgodW5zaWduZWQgY2hhciAqKWVkaWQsCj4+IEBAIC00MTIsNyAr
NDExLDggQEAgcmFkZW9uX2Jpb3NfZ2V0X2hhcmRjb2RlZF9lZGlkKHN0cnVjdCAKPj4gcmFkZW9u
X2RldmljZSAqcmRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBlZGlkOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDC
oMKgwqAgfQo+PiAtwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+ICsKPj4gK8KgwqDCoMKgIHJldHVy
biBkcm1fZ2V0X2VkaWRfYWNwaSgpOwo+Cj4gSW4gZ2VuZXJhbCBhIGdvb2QgaWRlYSwgYnV0IEkn
bSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIHJlYWxseSBkbyB0aGlzIHNvCj4gdW5jb25kaXRpb25h
bGx5IGhlcmUuCj4KCkknbSBub3QgcGVyc29uYWxseSBhd2FyZSBvZiBhbnkgQU1EIG5vdGVib29r
IGRlc2lnbnMgdGhhdCByZXF1aXJlIHRoZSAKQUNQSSBfRERDIEVESUQgcmV0cmlldmFsLiBJJ3Zl
IG9ubHkgc2VlbiBpdCBvbiBOVklESUErSW50ZWwgaHlicmlkIApzeXN0ZW1zIGFuZCBvbiBhIHNt
YWxsIG51bWJlciBvZiBOVklESUEgZGlzY3JldGUtb25seSBzeXN0ZW1zLiBJIGp1c3QgCmZpZ3Vy
ZWQgSSdkIHVwZGF0ZSB0aGUgcmFkZW9uIERSTS1LTVMgZHJpdmVyIHdoaWxlIHVwZGF0aW5nIGk5
MTUgYW5kIApOb3V2ZWF1LCBmb3IgY29tcGxldGVuZXNzLCBhcyBpdCBjb3VsZCBiZSBoZWxwZnVs
IHNob3VsZCBzdWNoIGEgZGVzaWduIApleGlzdC4gQXMgZm9yIHdoZXRoZXIgdGhlcmUgc2hvdWxk
IGJlIHNvbWUgY29uZGl0aW9uIGFyb3VuZCB0aGlzLCBJIApzdXBwb3NlIHRoYXQncyByZWFzb25h
YmxlLCBidXQgSSdtIG5vdCByZWFsbHkgc3VyZSB3aGF0IHdvdWxkIG1ha2Ugc2Vuc2UgCmFzIGEg
Y29uZGl0aW9uLiBBcyBpdCBzdGFuZHMsIGRybV9lZGlkX2FjcGkoKSBvbmx5IHJldHVybnMgYSB2
YWx1ZSBpZiBhdCAKbGVhc3Qgb25lIG9mIHRoZSBWR0Egb3IgM0QgY29udHJvbGxlcnMgb24gdGhl
IHN5c3RlbSBwcm92aWRlcyBhbiBBQ1BJIApfRERDIG1ldGhvZCwgYW5kIGlmIHRoYXQgQUNQSSBt
ZXRob2Qgc3VjY2Vzc2Z1bGx5IHJldHVybnMgYW4gRURJRC4KCk9uIHRoZSBjYWxsZXIncyBlbmQs
IGl0J3MgY3VycmVudGx5IHBhcnQgb2YgdGhlIHBhdGggd2hlcmUgdGhlIHJhZGVvbiAKZHJpdmVy
IGlzIGFscmVhZHkgdHJ5aW5nIHRvIGZhbGwgYmFjayB0byBhIGhhcmRjb2RlZCBFRElEIHByb3Zp
ZGVkIGJ5IAp0aGUgc3lzdGVtLiBQZXJoYXBzIGluc3RlYWQgaWYgd2UgY2FsbCBpdCB3aXRoaW4g
dGhlIExWRFMgfHwgZURQIApjb25kaXRpb24gaGVyZSwgaW5zdGVhZD8KCgogwqDCoMKgwqDCoMKg
wqAgaWYgKHJkZXYtPmlzX2F0b21fYmlvcykgewogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBz
b21lIGxhcHRvcHMgcHJvdmlkZSBhIGhhcmRjb2RlZCBlZGlkIGluIHJvbSBmb3IgTENEcyAqLwog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoKChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09
IERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTKSB8fAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VE
UCkpKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhZGVvbl9jb25uZWN0b3ItPmVk
aWQgPSAKcmFkZW9uX2Jpb3NfZ2V0X2hhcmRjb2RlZF9lZGlkKHJkZXYpOwogwqDCoMKgwqDCoMKg
wqAgfSBlbHNlIHsKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogc29tZSBzZXJ2ZXJzIHByb3Zp
ZGUgYSBoYXJkY29kZWQgZWRpZCBpbiByb20gZm9yIEtWTXMgKi8KIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmFkZW9uX2Nvbm5lY3Rvci0+ZWRpZCA9IHJhZGVvbl9iaW9zX2dldF9oYXJkY29kZWRf
ZWRpZChyZGV2KTsKfQoKVGhhdCB3b3VsZCBiZSBtb3JlIGluIGxpbmUgd2l0aCB0aGUgY2hhbmdl
cyBpbiB0aGlzIHBhdGNoc2V0IGZvciBpOTE1IAphbmQgbm91dmVhdS4KCgo+IFJlZ2FyZHMsCj4g
Q2hyaXN0aWFuLgo+Cj4+IMKgIH0KPj4KPj4gwqAgc3RhdGljIHN0cnVjdCByYWRlb25faTJjX2J1
c19yZWMgY29tYmlvc19zZXR1cF9pMmNfYnVzKHN0cnVjdCAKPj4gcmFkZW9uX2RldmljZSAqcmRl
diwKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2
ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
