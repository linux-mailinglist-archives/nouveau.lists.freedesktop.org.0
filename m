Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF034F7BB
	for <lists+nouveau@lfdr.de>; Sat, 22 Jun 2019 20:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E846E4D0;
	Sat, 22 Jun 2019 18:10:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B64E6E4D0
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 18:10:24 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i10so248049iol.13
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 11:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l8d48d9b5sI/lf04I2pGaS6zccQn8vsOnJboHKqEaBc=;
 b=jJ6YMKj/QdDqD/uQOO4RNl1YcIhege1ZzxjCTSZ+TpFGqy7uMfzb47W0gYXta5Ttrw
 WP799ipwWN4LKwNX+P/3sElS5USmplILR1KqKL3rMXKQwIs9mrG3zABGAjvoNPbH4blQ
 ciusUygpyQNIe+hTk76SpfRgI+1rU9ltUif6ChwMvhvv2zPVRvZa4Ttr/QwZukEXFvqr
 +mDxbJbD0mjZ4MHGUR5P4cVJrDuHxk2Zge8EsZ4AnRPZv8AsXJkQ1SgB9ck+/+ftAvTd
 e4Hh3UtUTpcUi/edLqnwto5Eo/MhiSjHJ11J4T6bEwF+bbhP9V8/HNawJd+6wMGIAA8d
 TLOg==
X-Gm-Message-State: APjAAAVQNr1iTZyKTU8yKw9OSgo7cO3BJ4i4//YMgYBHklurc/Oac1sm
 gqQU+VVEJvOkdMZkHfrgNQcxOQwiKb4ksrA7KXQpfQ==
X-Google-Smtp-Source: APXvYqxbQh9MeAYw4pY0HRN+jx7mWB8E2EKq4M+LS1g6IK/DeDaxVFNdQaB3IyM+i8dRiQkXxLh4QrBGgpuj30JEoq0=
X-Received: by 2002:a02:70d6:: with SMTP id
 f205mr22012440jac.138.1561227023845; 
 Sat, 22 Jun 2019 11:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190620001343.11046-1-imirkin@alum.mit.edu>
 <20190621181026.GG21486@arch-x1c3>
In-Reply-To: <20190621181026.GG21486@arch-x1c3>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 22 Jun 2019 20:10:12 +0200
Message-ID: <CACO55tsz6gqjbG8f2GMgFp3vQEVoGyMBy8jbqgRKJ4OungfcdQ@mail.gmail.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix bogus GPL-2 license header
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBKdW4g
MjEsIDIwMTkgYXQgODoxMiBQTSBFbWlsIFZlbGlrb3YgPGVtaWwubC52ZWxpa292QGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBPbiAyMDE5LzA2LzE5LCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IFRoZSBi
dWxrIFNQRFggYWRkaXRpb24gbWFkZSBhbGwgdGhlc2UgZmlsZXMgaW50byBHUEwtMi4wIGxpY2Vu
c2VkIGZpbGVzLgo+ID4gSG93ZXZlciB0aGUgcmVtYWluZGVyIG9mIHRoZSBwcm9qZWN0IGlzIE1J
VC1saWNlbnNlZCwgdGhlc2UgZmlsZXMKPiA+IChwcmltYXJpbHkgaGVhZGVyIGZpbGVzKSB3ZXJl
IHNpbXBseSBtaXNzaW5nIHRoZSBib2lsZXIgcGxhdGUgYW5kIGdvdAo+ID4gY2F1Z2h0IHVwIGlu
IHRoZSBnbG9iYWwgdXBkYXRlLgo+ID4KPiA+IEZpeGVzOiBiMjQ0MTMxODBmNSAoTGljZW5zZSBj
bGVhbnVwOiBhZGQgU1BEWCBHUEwtMi4wIGxpY2Vuc2UgaWRlbnRpZmllciB0byBmaWxlcyB3aXRo
IG5vIGxpY2Vuc2UpCj4gPiBTaWduZWQtb2ZmLWJ5OiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVt
Lm1pdC5lZHU+Cj4gPiAtLS0KPiA+Cj4gPiBCZW4sIHlvdSBkaWQgbGlrZSA5OS43JSBvZiB0aGlz
IHdvcmssIHNvIHVsdGltYXRlbHkgeW91ciBjYWxsLiBQcmV0dHkKPiA+IG11Y2ggYWxsIG9mIHRo
ZXNlIHdlcmUgc3BsaXQgb3V0IGZyb20gb3RoZXIgTUlULWxpY2Vuc2VkIGZpbGVzLCBhbmQgbW9z
dAo+ID4gYXJlIGhlYWRlciBmaWxlcyBhbnl3YXlzLgo+ID4KPiBBbGwgb2YgbXkgZ2xvcmlvdXMg
MjMgcGF0Y2hlcyB0byBub3V2ZWF1IGFyZSBtZWFudCB0byBiZSB1bmRlciBNSVQuCj4gQWNrZWQt
Ynk6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21haWwuY29tPgo+Cj4gPiBBbm90aGVy
IGNoYW5nZSBtaWdodCBiZSB0byBhZGQgdGhlIFNQRFggaWRlbnRpZmllciB0byBmaWxlcyAqd2l0
aCoKPiA+IHRoZSBNSVQgYm9pbGVycGxhdGUsIGJ1dCBJIGRpZG4ndCB3YW50IHRvIGRvIHRvbyBt
dWNoIGhlcmUuCj4gPgo+IE5vIG9iamVjdGlvbnMgb24gbXkgZW5kIDotKQo+Cj4gLUVtaWwKPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVh
dSBtYWlsaW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
