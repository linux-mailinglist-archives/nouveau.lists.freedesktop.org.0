Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A199C584
	for <lists+nouveau@lfdr.de>; Sun, 25 Aug 2019 20:24:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105F189237;
	Sun, 25 Aug 2019 18:24:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCFC6EA6F;
 Thu, 22 Aug 2019 08:08:41 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.232.237])
 by smtp-cloud7.xs4all.net with ESMTPA
 id 0i96iaakLThuu0i99ij8lY; Thu, 22 Aug 2019 10:08:40 +0200
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-2-darekm@google.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <38cda4f5-3299-2bd4-65f5-9a0f948902c6@xs4all.nl>
Date: Thu, 22 Aug 2019 10:08:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-2-darekm@google.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPWtQbBtTbaDHxFeyBb7ygW2PsLRysFGSHFJf5O77Fe4xUN5k2EdXnE0k7b/68OB9T5KEn44P6ppCAbw0dKuKCywDe8zm2wKSTiCBpX5SNOGqVkb+NkH
 AJcLKlyAB//eccrjvPOeJLJsJK0K+70oXNtIJaZvhqK/YLWfEEOkUvT0ArUq6VTzPHf7174IRQ+YIGgidYvEejsPLFEqO4uhuQggI19K7VTgah8OIdPO9Syc
 Z7f3kPcFLErs32csa0DU442Kf0WsarTHrq1h84vUwR5/WgiNv1WR2bvY+bpWxVUyuMfbFndXuLHrfnYy20OLCc+SHVhCoR9pJYHsHxjgaG+Ks6c/hAB66KLf
 O6XLRHzKukQFd3u4AMuayXJ1R1Zp2Yt5gQf2X0u+nh5fUlIa2wip6REiiPAFwzznY6poFrYtGgbh+eBswkL7JujosqgNqfRXxVTiqaUIayHykZ7Bz22LSorn
 lETmFGAc/4pT6khECdVKTjraKmIy8KLPJCRSCiVFXNn8yZCS20yAJuUm6NuTVdWMxjJJ/EoG6Arz+/VCb3GrZrbNClOVNMeocFWKcqFVpzq0XQXhvkNaKH98
 KlN2IMqi1QvcP1za1UwcJhpGb1ZZIp1nHDpE9/GW8mHyXz2JQbLYLW7HQ1anGajADr6z6DFfazz0VrECE3YMsM+FHkPaGpJwWI/eEqA4RGk0TkW9k0YpWbr6
 hNq5s6AgmbGrf6n6ha0EQHPan75U8yNT/qPTUQiRdHfQWcVJjzmW7YKAeJ5bjxH5DvX9ve1SyjxOFwF4YSS7W303CBIQy+GFpdBLEkKSuqSbEc8mcWd56sQk
 ZEmk6NHZBNgJqPBkInqxhwHiE3qB6tO4TQDaKcyQYuYzY5QqdOPQv6rJ7Toe4utCVUKOywgFCZRtGoqdeYhQAIGb+l+aTtdLrFDEEgVo
X-Mailman-Approved-At: Sun, 25 Aug 2019 18:24:31 +0000
Subject: Re: [Nouveau] [PATCH v7 1/9] drm_dp_cec: add connector info support.
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Lim <Thomas.Lim@amd.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Leo Li <sunpeng.li@amd.com>,
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Anthony Koo <Anthony.Koo@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QWxleCwgVmlsbGUvUm9kcmlnbywgQmVuLAoKQ2FuIHlvdSAoaG9wZWZ1bGx5KSBBY2sgdGhpcyBw
YXRjaCBzbyB0aGF0IEkgY2FuIG1lcmdlIGl0PwoKVGhhbmsgeW91IQoKCUhhbnMKCk9uIDgvMTQv
MTkgMTI6NDQgUE0sIERhcml1c3ogTWFyY2lua2lld2ljeiB3cm90ZToKPiBQYXNzIHRoZSBjb25u
ZWN0b3IgaW5mbyB0byB0aGUgQ0VDIGFkYXB0ZXIuIFRoaXMgbWFrZXMgaXQgcG9zc2libGUKPiB0
byBhc3NvY2lhdGUgdGhlIENFQyBhZGFwdGVyIHdpdGggdGhlIGNvcnJlc3BvbmRpbmcgZHJtIGNv
bm5lY3Rvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRhcmVr
bUBnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lz
Y29AeHM0YWxsLm5sPgo+IFRlc3RlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4
czRhbGwubmw+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMgICB8ICAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfY2VjLmMgICAgICAgICAg
ICAgICAgICB8IDI1ICsrKysrKysrKysrKy0tLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jICAgICAgIHwgIDQgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMgICB8ICAzICstLQo+ICBpbmNsdWRlL2RybS9kcm1fZHBf
aGVscGVyLmggICAgICAgICAgICAgICAgICAgfCAxNyArKysrKystLS0tLS0tCj4gIDUgZmlsZXMg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90
eXBlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1f
bXN0X3R5cGVzLmMKPiBpbmRleCAxNjIxOGEyMDJiNTkxLi41ZWMxNGVmZDRkOGNiIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21z
dF90eXBlcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1fbXN0X3R5cGVzLmMKPiBAQCAtNDE2LDcgKzQxNiw3IEBAIHZvaWQgYW1kZ3B1X2Rt
X2luaXRpYWxpemVfZHBfY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyICpk
bSwKPiAgCj4gIAlkcm1fZHBfYXV4X3JlZ2lzdGVyKCZhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4
KTsKPiAgCWRybV9kcF9jZWNfcmVnaXN0ZXJfY29ubmVjdG9yKCZhY29ubmVjdG9yLT5kbV9kcF9h
dXguYXV4LAo+IC0JCQkJICAgICAgYWNvbm5lY3Rvci0+YmFzZS5uYW1lLCBkbS0+YWRldi0+ZGV2
KTsKPiArCQkJCSAgICAgICZhY29ubmVjdG9yLT5iYXNlKTsKPiAgCWFjb25uZWN0b3ItPm1zdF9t
Z3IuY2JzID0gJmRtX21zdF9jYnM7Cj4gIAlkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9pbml0KAo+
ICAJCSZhY29ubmVjdG9yLT5tc3RfbWdyLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2NlYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9jZWMuYwo+IGluZGV4IGIxNWNl
ZTg1YjcwMmIuLmI0NTdjMTZjM2E4YmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9jZWMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfY2VjLmMKPiBAQCAtOCw3
ICs4LDkgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgv
bW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJt
X2Nvbm5lY3Rvci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kcF9oZWxwZXIuaD4KPiArI2luY2x1
ZGUgPGRybS9kcm1QLmg+Cj4gICNpbmNsdWRlIDxtZWRpYS9jZWMuaD4KPiAgCj4gIC8qCj4gQEAg
LTI5NSw3ICsyOTcsMTAgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2NlY191bnJlZ2lzdGVyX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAgKi8KPiAgdm9pZCBkcm1fZHBfY2VjX3NldF9l
ZGlkKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIGNvbnN0IHN0cnVjdCBlZGlkICplZGlkKQo+ICB7
Cj4gLQl1MzIgY2VjX2NhcHMgPSBDRUNfQ0FQX0RFRkFVTFRTIHwgQ0VDX0NBUF9ORUVEU19IUEQ7
Cj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gYXV4LT5jZWMuY29ubmVjdG9y
Owo+ICsJdTMyIGNlY19jYXBzID0gQ0VDX0NBUF9ERUZBVUxUUyB8IENFQ19DQVBfTkVFRFNfSFBE
IHwKPiArCQkgICAgICAgQ0VDX0NBUF9DT05ORUNUT1JfSU5GTzsKPiArCXN0cnVjdCBjZWNfY29u
bmVjdG9yX2luZm8gY29ubl9pbmZvOwo+ICAJdW5zaWduZWQgaW50IG51bV9sYXMgPSAxOwo+ICAJ
dTggY2FwOwo+ICAKPiBAQCAtMzQ0LDEzICszNDksMTcgQEAgdm9pZCBkcm1fZHBfY2VjX3NldF9l
ZGlkKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIGNvbnN0IHN0cnVjdCBlZGlkICplZGlkKQo+ICAK
PiAgCS8qIENyZWF0ZSBhIG5ldyBhZGFwdGVyICovCj4gIAlhdXgtPmNlYy5hZGFwID0gY2VjX2Fs
bG9jYXRlX2FkYXB0ZXIoJmRybV9kcF9jZWNfYWRhcF9vcHMsCj4gLQkJCQkJICAgICBhdXgsIGF1
eC0+Y2VjLm5hbWUsIGNlY19jYXBzLAo+ICsJCQkJCSAgICAgYXV4LCBjb25uZWN0b3ItPm5hbWUs
IGNlY19jYXBzLAo+ICAJCQkJCSAgICAgbnVtX2xhcyk7Cj4gIAlpZiAoSVNfRVJSKGF1eC0+Y2Vj
LmFkYXApKSB7Cj4gIAkJYXV4LT5jZWMuYWRhcCA9IE5VTEw7Cj4gIAkJZ290byB1bmxvY2s7Cj4g
IAl9Cj4gLQlpZiAoY2VjX3JlZ2lzdGVyX2FkYXB0ZXIoYXV4LT5jZWMuYWRhcCwgYXV4LT5jZWMu
cGFyZW50KSkgewo+ICsKPiArCWNlY19maWxsX2Nvbm5faW5mb19mcm9tX2RybSgmY29ubl9pbmZv
LCBjb25uZWN0b3IpOwo+ICsJY2VjX3NfY29ubl9pbmZvKGF1eC0+Y2VjLmFkYXAsICZjb25uX2lu
Zm8pOwo+ICsKPiArCWlmIChjZWNfcmVnaXN0ZXJfYWRhcHRlcihhdXgtPmNlYy5hZGFwLCBjb25u
ZWN0b3ItPmRldi0+ZGV2KSkgewo+ICAJCWNlY19kZWxldGVfYWRhcHRlcihhdXgtPmNlYy5hZGFw
KTsKPiAgCQlhdXgtPmNlYy5hZGFwID0gTlVMTDsKPiAgCX0gZWxzZSB7Cj4gQEAgLTQwNiwyMiAr
NDE1LDIwIEBAIEVYUE9SVF9TWU1CT0woZHJtX2RwX2NlY191bnNldF9lZGlkKTsKPiAgLyoqCj4g
ICAqIGRybV9kcF9jZWNfcmVnaXN0ZXJfY29ubmVjdG9yKCkgLSByZWdpc3RlciBhIG5ldyBjb25u
ZWN0b3IKPiAgICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKPiAtICogQG5hbWU6IG5h
bWUgb2YgdGhlIENFQyBkZXZpY2UKPiAtICogQHBhcmVudDogcGFyZW50IGRldmljZQo+ICsgKiBA
Y29ubmVjdG9yOiBkcm0gY29ubmVjdG9yCj4gICAqCj4gICAqIEEgbmV3IGNvbm5lY3RvciB3YXMg
cmVnaXN0ZXJlZCB3aXRoIGFzc29jaWF0ZWQgQ0VDIGFkYXB0ZXIgbmFtZSBhbmQKPiAgICogQ0VD
IGFkYXB0ZXIgcGFyZW50IGRldmljZS4gQWZ0ZXIgcmVnaXN0ZXJpbmcgdGhlIG5hbWUgYW5kIHBh
cmVudAo+ICAgKiBkcm1fZHBfY2VjX3NldF9lZGlkKCkgaXMgY2FsbGVkIHRvIGNoZWNrIGlmIHRo
ZSBjb25uZWN0b3Igc3VwcG9ydHMKPiAgICogQ0VDIGFuZCB0byByZWdpc3RlciBhIENFQyBhZGFw
dGVyIGlmIHRoYXQgaXMgdGhlIGNhc2UuCj4gICAqLwo+IC12b2lkIGRybV9kcF9jZWNfcmVnaXN0
ZXJfY29ubmVjdG9yKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIGNvbnN0IGNoYXIgKm5hbWUsCj4g
LQkJCQkgICBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQpCj4gK3ZvaWQgZHJtX2RwX2NlY19yZWdpc3Rl
cl9jb25uZWN0b3Ioc3RydWN0IGRybV9kcF9hdXggKmF1eCwKPiArCQkJCSAgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCj4gIHsKPiAgCVdBUk5fT04oYXV4LT5jZWMuYWRhcCk7Cj4g
IAlpZiAoV0FSTl9PTighYXV4LT50cmFuc2ZlcikpCj4gIAkJcmV0dXJuOwo+IC0JYXV4LT5jZWMu
bmFtZSA9IG5hbWU7Cj4gLQlhdXgtPmNlYy5wYXJlbnQgPSBwYXJlbnQ7Cj4gKwlhdXgtPmNlYy5j
b25uZWN0b3IgPSBjb25uZWN0b3I7Cj4gIAlJTklUX0RFTEFZRURfV09SSygmYXV4LT5jZWMudW5y
ZWdpc3Rlcl93b3JrLAo+ICAJCQkgIGRybV9kcF9jZWNfdW5yZWdpc3Rlcl93b3JrKTsKPiAgfQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKPiBpbmRleCAxMDkyNDk5MTE1
NzYwLi5kZTI0ODZmZTdiZjJkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYwo+IEBAIC01NDk3LDcgKzU0OTcsNiBAQCBzdGF0aWMgaW50Cj4gIGludGVsX2RwX2Nv
bm5lY3Rvcl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICB7Cj4g
IAlzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwID0gaW50ZWxfYXR0YWNoZWRfZHAoY29ubmVjdG9y
KTsKPiAtCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjb25uZWN0b3ItPmRldjsKPiAgCWludCBy
ZXQ7Cj4gIAo+ICAJcmV0ID0gaW50ZWxfY29ubmVjdG9yX3JlZ2lzdGVyKGNvbm5lY3Rvcik7Cj4g
QEAgLTU1MTIsOCArNTUxMSw3IEBAIGludGVsX2RwX2Nvbm5lY3Rvcl9yZWdpc3RlcihzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAJaW50ZWxfZHAtPmF1eC5kZXYgPSBjb25uZWN0
b3ItPmtkZXY7Cj4gIAlyZXQgPSBkcm1fZHBfYXV4X3JlZ2lzdGVyKCZpbnRlbF9kcC0+YXV4KTsK
PiAgCWlmICghcmV0KQo+IC0JCWRybV9kcF9jZWNfcmVnaXN0ZXJfY29ubmVjdG9yKCZpbnRlbF9k
cC0+YXV4LAo+IC0JCQkJCSAgICAgIGNvbm5lY3Rvci0+bmFtZSwgZGV2LT5kZXYpOwo+ICsJCWRy
bV9kcF9jZWNfcmVnaXN0ZXJfY29ubmVjdG9yKCZpbnRlbF9kcC0+YXV4LCBjb25uZWN0b3IpOwo+
ICAJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfY29ubmVjdG9yLmMKPiBpbmRleCAzMzBkN2QyOWE2ZTM0Li44YWE3MDMzNDdlYjU0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29ubmVjdG9yLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Nvbm5lY3Rvci5jCj4gQEAgLTE0
MTYsOCArMTQxNiw3IEBAIG5vdXZlYXVfY29ubmVjdG9yX2NyZWF0ZShzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAo+ICAJc3dpdGNoICh0eXBlKSB7Cj4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9E
aXNwbGF5UG9ydDoKPiAgCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX2VEUDoKPiAtCQlkcm1fZHBf
Y2VjX3JlZ2lzdGVyX2Nvbm5lY3RvcigmbnZfY29ubmVjdG9yLT5hdXgsCj4gLQkJCQkJICAgICAg
Y29ubmVjdG9yLT5uYW1lLCBkZXYtPmRldik7Cj4gKwkJZHJtX2RwX2NlY19yZWdpc3Rlcl9jb25u
ZWN0b3IoJm52X2Nvbm5lY3Rvci0+YXV4LCBjb25uZWN0b3IpOwo+ICAJCWJyZWFrOwo+ICAJfQo+
ICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oCj4gaW5kZXggODM2NDUwMmY5MmNmZS4uNzk3MmI5MjVhOTUyYiAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKPiArKysgYi9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKPiBAQCAtMTIzMCwyMCArMTIzMCwxOSBAQCBzdHJ1Y3QgZHJt
X2RwX2F1eF9tc2cgewo+ICAKPiAgc3RydWN0IGNlY19hZGFwdGVyOwo+ICBzdHJ1Y3QgZWRpZDsK
PiArc3RydWN0IGRybV9jb25uZWN0b3I7Cj4gIAo+ICAvKioKPiAgICogc3RydWN0IGRybV9kcF9h
dXhfY2VjIC0gRGlzcGxheVBvcnQgQ0VDLVR1bm5lbGluZy1vdmVyLUFVWAo+ICAgKiBAbG9jazog
bXV0ZXggcHJvdGVjdGluZyB0aGlzIHN0cnVjdAo+ICAgKiBAYWRhcDogdGhlIENFQyBhZGFwdGVy
IGZvciBDRUMtVHVubmVsaW5nLW92ZXItQVVYIHN1cHBvcnQuCj4gLSAqIEBuYW1lOiBuYW1lIG9m
IHRoZSBDRUMgYWRhcHRlcgo+IC0gKiBAcGFyZW50OiBwYXJlbnQgZGV2aWNlIG9mIHRoZSBDRUMg
YWRhcHRlcgo+ICsgKiBAY29ubmVjdG9yOiB0aGUgY29ubmVjdG9yIHRoaXMgQ0VDIGFkYXB0ZXIg
aXMgYXNzb2NpYXRlZCB3aXRoCj4gICAqIEB1bnJlZ2lzdGVyX3dvcms6IHVucmVnaXN0ZXIgdGhl
IENFQyBhZGFwdGVyCj4gICAqLwo+ICBzdHJ1Y3QgZHJtX2RwX2F1eF9jZWMgewo+ICAJc3RydWN0
IG11dGV4IGxvY2s7Cj4gIAlzdHJ1Y3QgY2VjX2FkYXB0ZXIgKmFkYXA7Cj4gLQljb25zdCBjaGFy
ICpuYW1lOwo+IC0Jc3RydWN0IGRldmljZSAqcGFyZW50Owo+ICsJc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcjsKPiAgCXN0cnVjdCBkZWxheWVkX3dvcmsgdW5yZWdpc3Rlcl93b3JrOwo+
ICB9Owo+ICAKPiBAQCAtMTQ1MSw4ICsxNDUwLDggQEAgZHJtX2RwX2hhc19xdWlyayhjb25zdCBz
dHJ1Y3QgZHJtX2RwX2Rlc2MgKmRlc2MsIGVudW0gZHJtX2RwX3F1aXJrIHF1aXJrKQo+ICAKPiAg
I2lmZGVmIENPTkZJR19EUk1fRFBfQ0VDCj4gIHZvaWQgZHJtX2RwX2NlY19pcnEoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCk7Cj4gLXZvaWQgZHJtX2RwX2NlY19yZWdpc3Rlcl9jb25uZWN0b3Ioc3Ry
dWN0IGRybV9kcF9hdXggKmF1eCwgY29uc3QgY2hhciAqbmFtZSwKPiAtCQkJCSAgIHN0cnVjdCBk
ZXZpY2UgKnBhcmVudCk7Cj4gK3ZvaWQgZHJtX2RwX2NlY19yZWdpc3Rlcl9jb25uZWN0b3Ioc3Ry
dWN0IGRybV9kcF9hdXggKmF1eCwKPiArCQkJCSAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IpOwo+ICB2b2lkIGRybV9kcF9jZWNfdW5yZWdpc3Rlcl9jb25uZWN0b3Ioc3RydWN0IGRy
bV9kcF9hdXggKmF1eCk7Cj4gIHZvaWQgZHJtX2RwX2NlY19zZXRfZWRpZChzdHJ1Y3QgZHJtX2Rw
X2F1eCAqYXV4LCBjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCk7Cj4gIHZvaWQgZHJtX2RwX2NlY191
bnNldF9lZGlkKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgpOwo+IEBAIC0xNDYxLDkgKzE0NjAsOSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtX2RwX2NlY19pcnEoc3RydWN0IGRybV9kcF9hdXggKmF1
eCkKPiAgewo+ICB9Cj4gIAo+IC1zdGF0aWMgaW5saW5lIHZvaWQgZHJtX2RwX2NlY19yZWdpc3Rl
cl9jb25uZWN0b3Ioc3RydWN0IGRybV9kcF9hdXggKmF1eCwKPiAtCQkJCQkJIGNvbnN0IGNoYXIg
Km5hbWUsCj4gLQkJCQkJCSBzdHJ1Y3QgZGV2aWNlICpwYXJlbnQpCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZAo+ICtkcm1fZHBfY2VjX3JlZ2lzdGVyX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RwX2F1eCAq
YXV4LAo+ICsJCQkgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICB7Cj4g
IH0KPiAgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
