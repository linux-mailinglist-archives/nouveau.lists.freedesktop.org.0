Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF76D409
	for <lists+nouveau@lfdr.de>; Thu, 18 Jul 2019 20:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D375B6E45E;
	Thu, 18 Jul 2019 18:35:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202CC6E2D7;
 Thu, 18 Jul 2019 01:45:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72CD32F8BE3;
 Thu, 18 Jul 2019 01:45:37 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9840219C78;
 Thu, 18 Jul 2019 01:45:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 17 Jul 2019 21:42:47 -0400
Message-Id: <20190718014329.8107-25-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 18 Jul 2019 01:45:37 +0000 (UTC)
X-Mailman-Approved-At: Thu, 18 Jul 2019 18:35:44 +0000
Subject: [Nouveau] [PATCH 24/26] drm/dp_mst: Add basic topology reprobing
 when resuming
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, nouveau@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, Harry Wentland <hwentlan@amd.com>,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, Juston Li <juston.li@intel.com>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RmluYWxseSEgRm9yIGEgdmVyeSBsb25nIHRpbWUsIG91ciBNU1QgaGVscGVycyBoYXZlIGhhZCBv
bmUgdmVyeQphbm5veWluZyBpc3N1ZTogVGhleSBkb24ndCBrbm93IGhvdyB0byByZXByb2JlIHRo
ZSB0b3BvbG9neSBzdGF0ZSB3aGVuCmNvbWluZyBvdXQgb2Ygc3VzcGVuZC4gVGhpcyBtZWFucyB0
aGF0IGlmIGEgdXNlciBoYXMgYSBtYWNoaW5lIGNvbm5lY3RlZAp0byBhbiBNU1QgdG9wb2xvZ3kg
YW5kIGRlY2lkZXMgdG8gc3VzcGVuZCB0aGVpciBtYWNoaW5lLCB3ZSBsb3NlIGFsbAp0b3BvbG9n
eSBjaGFuZ2VzIHRoYXQgaGFwcGVuZWQgZHVyaW5nIHRoYXQgcGVyaW9kLiBUaGF0IGNhbiBiZSBh
IGJpZwpwcm9ibGVtIGlmIHRoZSBtYWNoaW5lIHdhcyBjb25uZWN0ZWQgdG8gYSBkaWZmZXJlbnQg
dG9wb2xvZ3kgb24gdGhlIHNhbWUKcG9ydCBiZWZvcmUgcmVzdW1pbmcsIGFzIHdlIHdvbid0IGJv
dGhlciByZXByb2JpbmcgYW55IG9mIHRoZSBwb3J0cyBhbmQKbGlrZWx5IGNhdXNlIHRoZSB1c2Vy
J3MgbW9uaXRvcnMgbm90IHRvIGNvbWUgYmFjayB1cCBhcyBleHBlY3RlZC4KClNvLCB3ZSBzdGFy
dCBmaXhpbmcgdGhpcyBieSB0ZWFjaGluZyBvdXIgTVNUIGhlbHBlcnMgaG93IHRvIHJlcHJvYmUg
dGhlCmxpbmsgYWRkcmVzc2VzIG9mIGVhY2ggY29ubmVjdGVkIHRvcG9sb2d5IHdoZW4gcmVzdW1p
bmcuIEFzIGl0IHR1cm5zCm91dCwgdGhlIGJlaGF2aW9yIHRoYXQgd2Ugd2FudCBoZXJlIGlzIGlk
ZW50aWNhbCB0byB0aGUgYmVoYXZpb3Igd2Ugd2FudAp3aGVuIGluaXRpYWxseSBwcm9iaW5nIGEg
bmV3bHkgY29ubmVjdGVkIE1TVCB0b3BvbG9neSwgd2l0aCBhIGNvdXBsZSBvZgppbXBvcnRhbnQg
ZGlmZmVyZW5jZXM6CgotIFdlIG5lZWQgdG8gYmUgbW9yZSBjYXJlZnVsIGFib3V0IGhhbmRsaW5n
IHRoZSBwb3RlbnRpYWwgcmFjZXMgYmV0d2VlbgogIGV2ZW50cyBmcm9tIHRoZSBNU1QgaHViIHRo
YXQgY291bGQgY2hhbmdlIHRoZSB0b3BvbG9neSBzdGF0ZSBhcyB3ZSdyZQogIHBlcmZvcm1pbmcg
dGhlIGxpbmsgYWRkcmVzcyByZXByb2JlCi0gV2UgbmVlZCB0byBiZSBtb3JlIGNhcmVmdWwgYWJv
dXQgaGFuZGxpbmcgdW5saWtlbHkgc3RhdGUgY2hhbmdlcyBvbgogIHBvcnRzIC0gc3VjaCBhcyBh
biBpbnB1dCBwb3J0IHR1cm5pbmcgaW50byBhbiBvdXRwdXQgcG9ydCwgc29tZXRoaW5nCiAgdGhh
dCB3b3VsZCBiZSBmYXIgbW9yZSBsaWtlbHkgdG8gaGFwcGVuIGluIHNpdHVhdGlvbnMgbGlrZSB0
aGUgTVNUIGh1YgogIHdlJ3JlIGNvbm5lY3RlZCB0byBiZWluZyBjaGFuZ2VkIHdoaWxlIHdlJ3Jl
IHN1c3BlbmQKCkJvdGggb2Ygd2hpY2ggaGF2ZSBiZWVuIHNvbHZlZCBieSBwcmV2aW91cyBjb21t
aXRzLiBUaGF0IGxlYXZlcyBvbmUKcmVxdWlyZW1lbnQ6CgotIFdlIG5lZWQgdG8gcHJ1bmUgYW55
IE1TVCBwb3J0cyBpbiBvdXIgaW4tbWVtb3J5IHRvcG9sb2d5IHN0YXRlIHRoYXQKICB3ZXJlIHBy
ZXNlbnQgd2hlbiBzdXNwZW5kaW5nLCBidXQgaGF2ZSBub3QgYXBwZWFyZWQgaW4gdGhlIHBvc3Qt
cmVzdW1lCiAgbGluayBhZGRyZXNzIHJlc3BvbnNlIGZyb20gdGhlaXIgcGFyZW50IGJyYW5jaCBk
ZXZpY2UKCldoaWNoIHdlIGNhbiBub3cgaGFuZGxlIGluIHRoaXMgY29tbWl0IGJ5IG1vZGlmeWlu
Zwpkcm1fZHBfc2VuZF9saW5rX2FkZHJlc3MoKS4gV2UgdGhlbiBpbnRyb2R1Y2Ugc3VzcGVuZC9y
ZXN1bWUgcmVwcm9iaW5nCmJ5IGludHJvZHVjaW5nIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2lu
dmFsaWRhdGVfbXN0YigpLCB3aGljaCB3ZSBjYWxsCmluIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
X3N1c3BlbmQoKSB0byB0cmF2ZXJzZSB0aGUgaW4tbWVtb3J5IHRvcG9sb2d5CnN0YXRlIHRvIGlu
ZGljYXRlIHRoYXQgZWFjaCBtc3RiIG5lZWRzIGl0J3MgbGluayBhZGRyZXNzIHJlc2VudCBhbmQg
UEJOCnJlc291cmNlcyByZXByb2JlZC4KCk9uIHJlc3VtZSwgd2Ugc3RhcnQgYmFjayB1cCAmbWdy
LT53b3JrIGFuZCBoYXZlIGl0IHJlcHJvYmUgdGhlIHRvcG9sb2d5CmluIHRoZSBzYW1lIHdheSB3
ZSB3b3VsZCBvbiBhIGhvdHBsdWcsIHJlbW92aW5nIGFueSBsZWZ0b3ZlciBwb3J0cyB0aGF0Cm5v
IGxvbmdlciBhcHBlYXIgaW4gdGhlIHRvcG9sb2d5IHN0YXRlLgoKQ2M6IEp1c3RvbiBMaSA8anVz
dG9uLmxpQGludGVsLmNvbT4KQ2M6IEltcmUgRGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4KQ2M6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBIYXJy
eSBXZW50bGFuZCA8aHdlbnRsYW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8
bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMgICAgICAgICB8IDEzOCArKysrKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAuYyAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jICAgICAgIHwgICA2ICstCiBpbmNsdWRlL2RybS9kcm1fZHBfbXN0
X2hlbHBlci5oICAgICAgICAgICAgICAgfCAgIDMgKy0KIDUgZmlsZXMgY2hhbmdlZCwgMTEyIGlu
c2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGUzM2UwODBjZjE2ZC4uMmViZDQ4
MTFmZjQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKQEAgLTgyOSw3ICs4MjksNyBAQCBzdGF0aWMgdm9pZCBzM19oYW5kbGVfbXN0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgc3VzcGVuZCkKIAkJaWYgKHN1c3BlbmQpIHsK
IAkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3N1c3BlbmQobWdyKTsKIAkJfSBlbHNlIHsKLQkJ
CXJldCA9IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZShtZ3IpOworCQkJcmV0ID0gZHJt
X2RwX21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKG1nciwgdHJ1ZSk7CiAJCQlpZiAocmV0IDwgMCkg
ewogCQkJCWRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3NldF9tc3QobWdyLCBmYWxzZSk7CiAJCQkJ
bmVlZF9ob3RwbHVnID0gdHJ1ZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmlu
ZGV4IDEyNmRiMzZjOTMzNy4uMzIwMTU4OTcwZTI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMKQEAgLTE5MzEsNiArMTkzMSwxNCBAQCBkcm1fZHBfbXN0X2hhbmRsZV9saW5r
X2FkZHJlc3NfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCiAJCWdvdG8gZmFp
bF91bmxvY2s7CiAJfQogCisJLyoKKwkgKiBJZiB0aGlzIHBvcnQgd2Fzbid0IGp1c3QgY3JlYXRl
ZCwgdGhlbiB3ZSdyZSByZXByb2JpbmcgYmVjYXVzZQorCSAqIHdlJ3JlIGNvbWluZyBvdXQgb2Yg
c3VzcGVuZC4gSW4gdGhpcyBjYXNlLCBhbHdheXMgcmVzZW5kIHRoZSBsaW5rCisJICogYWRkcmVz
cyBpZiB0aGVyZSdzIGFuIE1TVEIgb24gdGhpcyBwb3J0CisJICovCisJaWYgKCFjcmVhdGVkICYm
IHBvcnQtPnBkdCA9PSBEUF9QRUVSX0RFVklDRV9NU1RfQlJBTkNISU5HKQorCQlzZW5kX2xpbmtf
YWRkciA9IHRydWU7CisKIAlpZiAoc2VuZF9saW5rX2FkZHIpIHsKIAkJbXV0ZXhfbG9jaygmbWdy
LT5sb2NrKTsKIAkJaWYgKHBvcnQtPm1zdGIpIHsKQEAgLTI0NDMsNyArMjQ1MSw4IEBAIHN0YXRp
YyB2b2lkIGRybV9kcF9zZW5kX2xpbmtfYWRkcmVzcyhzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9n
eV9tZ3IgKm1nciwKIHsKIAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ190eCAqdHhtc2c7CiAJ
c3RydWN0IGRybV9kcF9saW5rX2FkZHJlc3NfYWNrX3JlcGx5ICpyZXBseTsKLQlpbnQgaSwgbGVu
LCByZXQ7CisJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCwgKnRtcDsKKwlpbnQgaSwgbGVu
LCByZXQsIHBvcnRfbWFzayA9IDA7CiAKIAl0eG1zZyA9IGt6YWxsb2Moc2l6ZW9mKCp0eG1zZyks
IEdGUF9LRVJORUwpOwogCWlmICghdHhtc2cpCkBAIC0yNDczLDkgKzI0ODIsMjggQEAgc3RhdGlj
IHZvaWQgZHJtX2RwX3NlbmRfbGlua19hZGRyZXNzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5
X21nciAqbWdyLAogCiAJZHJtX2RwX2NoZWNrX21zdGJfZ3VpZChtc3RiLCByZXBseS0+Z3VpZCk7
CiAKLQlmb3IgKGkgPSAwOyBpIDwgcmVwbHktPm5wb3J0czsgaSsrKQorCWZvciAoaSA9IDA7IGkg
PCByZXBseS0+bnBvcnRzOyBpKyspIHsKKwkJcG9ydF9tYXNrIHw9IEJJVChyZXBseS0+cG9ydHNb
aV0ucG9ydF9udW1iZXIpOwogCQlkcm1fZHBfbXN0X2hhbmRsZV9saW5rX2FkZHJlc3NfcG9ydCht
c3RiLCBtZ3ItPmRldiwKIAkJCQkJCSAgICAmcmVwbHktPnBvcnRzW2ldKTsKKwl9CisKKwkvKiBQ
cnVuZSBhbnkgcG9ydHMgdGhhdCBhcmUgY3VycmVudGx5IGEgcGFydCBvZiBtc3RiIGluIG91ciBp
bi1tZW1vcnkKKwkgKiB0b3BvbG9neSwgYnV0IHdlcmUgbm90IHNlZW4gaW4gdGhpcyBsaW5rIGFk
ZHJlc3MuIFVzdWFsbHkgdGhpcworCSAqIG1lYW5zIHRoYXQgdGhleSB3ZXJlIHJlbW92ZWQgd2hp
bGUgdGhlIHRvcG9sb2d5IHdhcyBvdXQgb2Ygc3luYywKKwkgKiBlLmcuIGR1cmluZyBzdXNwZW5k
L3Jlc3VtZQorCSAqLworCW11dGV4X2xvY2soJm1nci0+bG9jayk7CisJbGlzdF9mb3JfZWFjaF9l
bnRyeV9zYWZlKHBvcnQsIHRtcCwgJm1zdGItPnBvcnRzLCBuZXh0KSB7CisJCWlmIChwb3J0X21h
c2sgJiBCSVQocG9ydC0+cG9ydF9udW0pKQorCQkJY29udGludWU7CisKKwkJRFJNX0RFQlVHX0tN
UygicG9ydCAlZCB3YXMgbm90IGluIGxpbmsgYWRkcmVzcywgcmVtb3ZpbmdcbiIsCisJCQkgICAg
ICBwb3J0LT5wb3J0X251bSk7CisJCWxpc3RfZGVsKCZwb3J0LT5uZXh0KTsKKwkJZHJtX2RwX21z
dF90b3BvbG9neV9wdXRfcG9ydChwb3J0KTsKKwl9CisJbXV0ZXhfdW5sb2NrKCZtZ3ItPmxvY2sp
OwogCiAJZHJtX2ttc19oZWxwZXJfaG90cGx1Z19ldmVudChtZ3ItPmRldik7CiAKQEAgLTMwNzIs
NiArMzEwMCwyMyBAQCBpbnQgZHJtX2RwX21zdF90b3BvbG9neV9tZ3Jfc2V0X21zdChzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwgYm9vbCBtcwogfQogRVhQT1JUX1NZTUJPTChk
cm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KTsKIAorc3RhdGljIHZvaWQKK2RybV9kcF9t
c3RfdG9wb2xvZ3lfbWdyX2ludmFsaWRhdGVfbXN0YihzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2gg
Km1zdGIpCit7CisJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydDsKKworCS8qIFRoZSBsaW5r
IGFkZHJlc3Mgd2lsbCBuZWVkIHRvIGJlIHJlLXNlbnQgb24gcmVzdW1lICovCisJbXN0Yi0+bGlu
a19hZGRyZXNzX3NlbnQgPSBmYWxzZTsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkocG9ydCwgJm1z
dGItPnBvcnRzLCBuZXh0KSB7CisJCS8qIFRoZSBQQk4gZm9yIGVhY2ggcG9ydCB3aWxsIGFsc28g
bmVlZCB0byBiZSByZS1wcm9iZWQgKi8KKwkJcG9ydC0+YXZhaWxhYmxlX3BibiA9IDA7CisKKwkJ
aWYgKHBvcnQtPm1zdGIpCisJCQlkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9pbnZhbGlkYXRlX21z
dGIocG9ydC0+bXN0Yik7CisJfQorfQorCiAvKioKICAqIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
X3N1c3BlbmQoKSAtIHN1c3BlbmQgdGhlIE1TVCBtYW5hZ2VyCiAgKiBAbWdyOiBtYW5hZ2VyIHRv
IHN1c3BlbmQKQEAgLTMwODgsNjAgKzMxMzMsODUgQEAgdm9pZCBkcm1fZHBfbXN0X3RvcG9sb2d5
X21ncl9zdXNwZW5kKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQogCWZsdXNo
X3dvcmsoJm1nci0+dXBfcmVxX3dvcmspOwogCWZsdXNoX3dvcmsoJm1nci0+d29yayk7CiAJZmx1
c2hfd29yaygmbWdyLT5kZXN0cm95X2Nvbm5lY3Rvcl93b3JrKTsKKworCW11dGV4X2xvY2soJm1n
ci0+bG9jayk7CisJaWYgKG1nci0+bXN0X3N0YXRlICYmIG1nci0+bXN0X3ByaW1hcnkpCisJCWRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyX2ludmFsaWRhdGVfbXN0YihtZ3ItPm1zdF9wcmltYXJ5KTsK
KwltdXRleF91bmxvY2soJm1nci0+bG9jayk7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3Rf
dG9wb2xvZ3lfbWdyX3N1c3BlbmQpOwogCiAvKioKICAqIGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
X3Jlc3VtZSgpIC0gcmVzdW1lIHRoZSBNU1QgbWFuYWdlcgogICogQG1ncjogbWFuYWdlciB0byBy
ZXN1bWUKKyAqIEBzeW5jOiB3aGV0aGVyIG9yIG5vdCB0byBwZXJmb3JtIHRvcG9sb2d5IHJlcHJv
YmluZyBzeW5jaHJvbm91c2x5CiAgKgogICogVGhpcyB3aWxsIGZldGNoIERQQ0QgYW5kIHNlZSBp
ZiB0aGUgZGV2aWNlIGlzIHN0aWxsIHRoZXJlLAogICogaWYgaXQgaXMsIGl0IHdpbGwgcmV3cml0
ZSB0aGUgTVNUTSBjb250cm9sIGJpdHMsIGFuZCByZXR1cm4uCiAgKgotICogaWYgdGhlIGRldmlj
ZSBmYWlscyB0aGlzIHJldHVybnMgLTEsIGFuZCB0aGUgZHJpdmVyIHNob3VsZCBkbworICogSWYg
dGhlIGRldmljZSBmYWlscyB0aGlzIHJldHVybnMgLTEsIGFuZCB0aGUgZHJpdmVyIHNob3VsZCBk
bwogICogYSBmdWxsIE1TVCByZXByb2JlLCBpbiBjYXNlIHdlIHdlcmUgdW5kb2NrZWQuCisgKgor
ICogRHVyaW5nIHN5c3RlbSByZXN1bWUgKHdoZXJlIGl0IGlzIGFzc3VtZWQgdGhhdCB0aGUgZHJp
dmVyIHdpbGwgYmUgY2FsbGluZworICogZHJtX2F0b21pY19oZWxwZXJfcmVzdW1lKCkpIHRoaXMg
ZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCBiZWZvcmVoYW5kIHdpdGgKKyAqIEBzeW5jIHNldCB0
byB0cnVlLiBJbiBjb250ZXh0cyBsaWtlIHJ1bnRpbWUgcmVzdW1lIHdoZXJlIHRoZSBkcml2ZXIg
aXMgbm90CisgKiBleHBlY3RlZCB0byBiZSBjYWxsaW5nIGRybV9hdG9taWNfaGVscGVyX3Jlc3Vt
ZSgpLCB0aGlzIGZ1bmN0aW9uIHNob3VsZCBiZQorICogY2FsbGVkIHdpdGggQHN5bmMgc2V0IHRv
IGZhbHNlIGluIG9yZGVyIHRvIGF2b2lkIGRlYWRsb2NraW5nLgorICoKKyAqIFJldHVybnM6IC0x
IGlmIHRoZSBNU1QgdG9wb2xvZ3kgd2FzIHJlbW92ZWQgd2hpbGUgd2Ugd2VyZSBzdXNwZW5kZWQs
IDAKKyAqIG90aGVyd2lzZS4KICAqLwotaW50IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3Vt
ZShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikKK2ludCBkcm1fZHBfbXN0X3Rv
cG9sb2d5X21ncl9yZXN1bWUoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IsCisJ
CQkJICAgYm9vbCBzeW5jKQogewotCWludCByZXQgPSAwOworCWludCByZXQ7CisJdTggZ3VpZFsx
Nl07CiAKIAltdXRleF9sb2NrKCZtZ3ItPmxvY2spOworCWlmICghbWdyLT5tc3RfcHJpbWFyeSkK
KwkJZ290byBvdXRfZmFpbDsKIAotCWlmIChtZ3ItPm1zdF9wcmltYXJ5KSB7Ci0JCWludCBzcmV0
OwotCQl1OCBndWlkWzE2XTsKKwlyZXQgPSBkcm1fZHBfZHBjZF9yZWFkKG1nci0+YXV4LCBEUF9E
UENEX1JFViwgbWdyLT5kcGNkLAorCQkJICAgICAgIERQX1JFQ0VJVkVSX0NBUF9TSVpFKTsKKwlp
ZiAocmV0ICE9IERQX1JFQ0VJVkVSX0NBUF9TSVpFKSB7CisJCURSTV9ERUJVR19LTVMoImRwY2Qg
cmVhZCBmYWlsZWQgLSB1bmRvY2tlZCBkdXJpbmcgc3VzcGVuZD9cbiIpOworCQlnb3RvIG91dF9m
YWlsOworCX0KIAotCQlzcmV0ID0gZHJtX2RwX2RwY2RfcmVhZChtZ3ItPmF1eCwgRFBfRFBDRF9S
RVYsIG1nci0+ZHBjZCwgRFBfUkVDRUlWRVJfQ0FQX1NJWkUpOwotCQlpZiAoc3JldCAhPSBEUF9S
RUNFSVZFUl9DQVBfU0laRSkgewotCQkJRFJNX0RFQlVHX0tNUygiZHBjZCByZWFkIGZhaWxlZCAt
IHVuZG9ja2VkIGR1cmluZyBzdXNwZW5kP1xuIik7Ci0JCQlyZXQgPSAtMTsKLQkJCWdvdG8gb3V0
X3VubG9jazsKLQkJfQorCXJldCA9IGRybV9kcF9kcGNkX3dyaXRlYihtZ3ItPmF1eCwgRFBfTVNU
TV9DVFJMLAorCQkJCSBEUF9NU1RfRU4gfAorCQkJCSBEUF9VUF9SRVFfRU4gfAorCQkJCSBEUF9V
UFNUUkVBTV9JU19TUkMpOworCWlmIChyZXQgPCAwKSB7CisJCURSTV9ERUJVR19LTVMoIm1zdCB3
cml0ZSBmYWlsZWQgLSB1bmRvY2tlZCBkdXJpbmcgc3VzcGVuZD9cbiIpOworCQlnb3RvIG91dF9m
YWlsOworCX0KIAotCQlyZXQgPSBkcm1fZHBfZHBjZF93cml0ZWIobWdyLT5hdXgsIERQX01TVE1f
Q1RSTCwKLQkJCQkJIERQX01TVF9FTiB8IERQX1VQX1JFUV9FTiB8IERQX1VQU1RSRUFNX0lTX1NS
Qyk7Ci0JCWlmIChyZXQgPCAwKSB7Ci0JCQlEUk1fREVCVUdfS01TKCJtc3Qgd3JpdGUgZmFpbGVk
IC0gdW5kb2NrZWQgZHVyaW5nIHN1c3BlbmQ/XG4iKTsKLQkJCXJldCA9IC0xOwotCQkJZ290byBv
dXRfdW5sb2NrOwotCQl9CisJLyogU29tZSBodWJzIGZvcmdldCB0aGVpciBndWlkcyBhZnRlciB0
aGV5IHJlc3VtZSAqLworCXJldCA9IGRybV9kcF9kcGNkX3JlYWQobWdyLT5hdXgsIERQX0dVSUQs
IGd1aWQsIDE2KTsKKwlpZiAocmV0ICE9IDE2KSB7CisJCURSTV9ERUJVR19LTVMoImRwY2QgcmVh
ZCBmYWlsZWQgLSB1bmRvY2tlZCBkdXJpbmcgc3VzcGVuZD9cbiIpOworCQlnb3RvIG91dF9mYWls
OworCX0KKwlkcm1fZHBfY2hlY2tfbXN0Yl9ndWlkKG1nci0+bXN0X3ByaW1hcnksIGd1aWQpOwog
Ci0JCS8qIFNvbWUgaHVicyBmb3JnZXQgdGhlaXIgZ3VpZHMgYWZ0ZXIgdGhleSByZXN1bWUgKi8K
LQkJc3JldCA9IGRybV9kcF9kcGNkX3JlYWQobWdyLT5hdXgsIERQX0dVSUQsIGd1aWQsIDE2KTsK
LQkJaWYgKHNyZXQgIT0gMTYpIHsKLQkJCURSTV9ERUJVR19LTVMoImRwY2QgcmVhZCBmYWlsZWQg
LSB1bmRvY2tlZCBkdXJpbmcgc3VzcGVuZD9cbiIpOwotCQkJcmV0ID0gLTE7Ci0JCQlnb3RvIG91
dF91bmxvY2s7Ci0JCX0KLQkJZHJtX2RwX2NoZWNrX21zdGJfZ3VpZChtZ3ItPm1zdF9wcmltYXJ5
LCBndWlkKTsKKwkvKiBGb3IgdGhlIGZpbmFsIHN0ZXAgb2YgcmVzdW1pbmcgdGhlIHRvcG9sb2d5
LCB3ZSBuZWVkIHRvIGJyaW5nIHRoZQorCSAqIHN0YXRlIG9mIG91ciBpbi1tZW1vcnkgdG9wb2xv
Z3kgYmFjayBpbnRvIHN5bmMgd2l0aCByZWFsaXR5LiBTbywKKwkgKiByZXN0YXJ0IHRoZSBwcm9i
aW5nIHByb2Nlc3MgYXMgaWYgd2UncmUgcHJvYmluZyBhIG5ldyBodWIKKwkgKi8KKwlxdWV1ZV93
b3JrKHN5c3RlbV9sb25nX3dxLCAmbWdyLT53b3JrKTsKKwltdXRleF91bmxvY2soJm1nci0+bG9j
ayk7CiAKLQkJcmV0ID0gMDsKLQl9IGVsc2UKLQkJcmV0ID0gLTE7CisJaWYgKHN5bmMpIHsKKwkJ
RFJNX0RFQlVHX0tNUygiV2FpdGluZyBmb3IgbGluayBwcm9iZSB3b3JrIHRvIGZpbmlzaCByZS1z
eW5jaW5nIHRvcG9sb2d5Li4uXG4iKTsKKwkJZmx1c2hfd29yaygmbWdyLT53b3JrKTsKKwl9CiAK
LW91dF91bmxvY2s6CisJcmV0dXJuIDA7CisKK291dF9mYWlsOgogCW11dGV4X3VubG9jaygmbWdy
LT5sb2NrKTsKLQlyZXR1cm4gcmV0OworCXJldHVybiAtMTsKIH0KIEVYUE9SVF9TWU1CT0woZHJt
X2RwX21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jCmluZGV4IDBlYjVkNjZmODdhNy4uNzE5MGZmNWMzNjQ5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jCkBAIC03MzY2LDcgKzczNjYsOCBAQCB2b2lk
IGludGVsX2RwX21zdF9yZXN1bWUoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQog
CQlpZiAoIWludGVsX2RwLT5jYW5fbXN0KQogCQkJY29udGludWU7CiAKLQkJcmV0ID0gZHJtX2Rw
X21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKCZpbnRlbF9kcC0+bXN0X21ncik7CisJCXJldCA9IGRy
bV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jlc3VtZSgmaW50ZWxfZHAtPm1zdF9tZ3IsCisJCQkJCQkg
ICAgIHRydWUpOwogCQlpZiAocmV0KSB7CiAJCQlpbnRlbF9kcC0+aXNfbXN0ID0gZmFsc2U7CiAJ
CQlkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9zZXRfbXN0KCZpbnRlbF9kcC0+bXN0X21nciwKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCA3YmEzNzNmNDkzYjIuLmM0
NGI1NGVlZGRjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAt
MTMwMCwxNCArMTMwMCwxNCBAQCBudjUwX21zdG1fZmluaShzdHJ1Y3QgbnY1MF9tc3RtICptc3Rt
KQogfQogCiBzdGF0aWMgdm9pZAotbnY1MF9tc3RtX2luaXQoc3RydWN0IG52NTBfbXN0bSAqbXN0
bSkKK252NTBfbXN0bV9pbml0KHN0cnVjdCBudjUwX21zdG0gKm1zdG0sIGJvb2wgcnVudGltZSkK
IHsKIAlpbnQgcmV0OwogCiAJaWYgKCFtc3RtIHx8ICFtc3RtLT5tZ3IubXN0X3N0YXRlKQogCQly
ZXR1cm47CiAKLQlyZXQgPSBkcm1fZHBfbXN0X3RvcG9sb2d5X21ncl9yZXN1bWUoJm1zdG0tPm1n
cik7CisJcmV0ID0gZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKCZtc3RtLT5tZ3IsICFy
dW50aW1lKTsKIAlpZiAocmV0ID09IC0xKSB7CiAJCWRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Nl
dF9tc3QoJm1zdG0tPm1nciwgZmFsc2UpOwogCQlkcm1fa21zX2hlbHBlcl9ob3RwbHVnX2V2ZW50
KG1zdG0tPm1nci5kZXYpOwpAQCAtMjI1Nyw3ICsyMjU3LDcgQEAgbnY1MF9kaXNwbGF5X2luaXQo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgYm9vbCByZXN1bWUsIGJvb2wgcnVudGltZSkKIAkJaWYg
KGVuY29kZXItPmVuY29kZXJfdHlwZSAhPSBEUk1fTU9ERV9FTkNPREVSX0RQTVNUKSB7CiAJCQlz
dHJ1Y3Qgbm91dmVhdV9lbmNvZGVyICpudl9lbmNvZGVyID0KIAkJCQlub3V2ZWF1X2VuY29kZXIo
ZW5jb2Rlcik7Ci0JCQludjUwX21zdG1faW5pdChudl9lbmNvZGVyLT5kcC5tc3RtKTsKKwkJCW52
NTBfbXN0bV9pbml0KG52X2VuY29kZXItPmRwLm1zdG0sIHJ1bnRpbWUpOwogCQl9CiAJfQogCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2RwX21zdF9oZWxwZXIuaAppbmRleCBhZWQ2OGQ3ZTY0OTIuLmVlY2UyODUyNWQ1MiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZHBfbXN0X2hlbHBlci5oCkBAIC02ODMsNyArNjgzLDggQEAgdm9pZCBkcm1fZHBfbXN0
X2R1bXBfdG9wb2xvZ3koc3RydWN0IHNlcV9maWxlICptLAogCiB2b2lkIGRybV9kcF9tc3RfdG9w
b2xvZ3lfbWdyX3N1c3BlbmQoc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3IpOwog
aW50IF9fbXVzdF9jaGVjawotZHJtX2RwX21zdF90b3BvbG9neV9tZ3JfcmVzdW1lKHN0cnVjdCBk
cm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKTsKK2RybV9kcF9tc3RfdG9wb2xvZ3lfbWdyX3Jl
c3VtZShzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKKwkJCSAgICAgICBib29s
IHN5bmMpOwogc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfc3RhdGUgKmRybV9hdG9taWNfZ2V0
X21zdF90b3BvbG9neV9zdGF0ZShzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJCQkJ
CQkJCSAgICBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncik7CiBpbnQgX19tdXN0
X2NoZWNrCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
