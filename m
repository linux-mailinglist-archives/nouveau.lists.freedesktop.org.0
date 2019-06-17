Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02D49097
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 21:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0FE89EEB;
	Mon, 17 Jun 2019 19:54:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E17889E39;
 Mon, 17 Jun 2019 19:54:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 76A8B30872E1;
 Mon, 17 Jun 2019 19:54:28 +0000 (UTC)
Received: from redhat.com (ovpn-125-143.rdu2.redhat.com [10.10.125.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 522804146;
 Mon, 17 Jun 2019 19:54:27 +0000 (UTC)
Date: Mon, 17 Jun 2019 15:54:25 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Message-ID: <20190617195425.GA4085@redhat.com>
References: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zYmL2P9w0Z4yfPtB=ftiy-H6-_beYsXJq-nD9T5OAw6Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFqt6zYmL2P9w0Z4yfPtB=ftiy-H6-_beYsXJq-nD9T5OAw6Dg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 17 Jun 2019 19:54:33 +0000 (UTC)
Subject: Re: [Nouveau] [PATCH] drm/nouveau/svm: Convert to use
 hmm_range_fault()
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jasojgg@ziepe.ca, bskeggs@redhat.com, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDgsIDIwMTkgYXQgMTI6MTQ6NTBBTSArMDUzMCwgU291cHRpY2sgSm9hcmRl
ciB3cm90ZToKPiBIaSBKYXNvbiwKPiAKPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAxMjoyNyBB
TSBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
Q29udmVydCB0byB1c2UgaG1tX3JhbmdlX2ZhdWx0KCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+Cj4gCj4gV291bGQgeW91IGxp
a2UgdG8gdGFrZSBpdCB0aHJvdWdoIHlvdXIgbmV3IGhtbSB0cmVlIG9yIGRvIEkKPiBuZWVkIHRv
IHJlc2VuZCBpdCA/CgpUaGlzIHBhdGNoIGlzIHdyb25nIGFzIHRoZSBBUEkgaXMgZGlmZmVyZW50
IGJldHdlZW4gdGhlIHR3byBzZWUgd2hhdAppcyBpbiBobW0uaCB0byBzZWUgdGhlIGRpZmZlcmVu
Y2VzIGJldHdlZW4gaG1tX3ZtYV9mYXVsdCgpIGhtbV9yYW5nZV9mYXVsdCgpCmEgc2ltcGxlIHJl
bmFtZSBicmVhayB0aGluZ3MuCgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9zdm0uYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3Zt
LmMKPiA+IGluZGV4IDkzZWQ0M2MuLjhkNTZiZDYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3N2bS5jCj4gPiBAQCAtNjQ5LDcgKzY0OSw3IEBAIHN0cnVjdCBub3V2ZWF1
X3N2bW0gewo+ID4gICAgICAgICAgICAgICAgIHJhbmdlLnZhbHVlcyA9IG5vdXZlYXVfc3ZtX3Bm
bl92YWx1ZXM7Cj4gPiAgICAgICAgICAgICAgICAgcmFuZ2UucGZuX3NoaWZ0ID0gTlZJRl9WTU1f
UEZOTUFQX1YwX0FERFJfU0hJRlQ7Cj4gPiAgYWdhaW46Cj4gPiAtICAgICAgICAgICAgICAgcmV0
ID0gaG1tX3ZtYV9mYXVsdCgmcmFuZ2UsIHRydWUpOwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9
IGhtbV9yYW5nZV9mYXVsdCgmcmFuZ2UsIHRydWUpOwo+ID4gICAgICAgICAgICAgICAgIGlmIChy
ZXQgPT0gMCkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfbG9jaygmc3ZtbS0+
bXV0ZXgpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFobW1fdm1hX3JhbmdlX2Rv
bmUoJnJhbmdlKSkgewo+ID4gLS0KPiA+IDEuOS4xCj4gPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXU=
