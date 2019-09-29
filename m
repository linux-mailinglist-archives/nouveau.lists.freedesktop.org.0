Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE34C15D1
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2019 16:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729176E10C;
	Sun, 29 Sep 2019 14:32:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4A96E10C
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2019 14:32:57 +0000 (UTC)
Received: by mail-vk1-f179.google.com with SMTP id j21so2140657vki.11
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2019 07:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DzylgxJC18yMhF36Oi4zjs6RGplMSQueKiySJpT8Uyw=;
 b=XVddDcj1BveCZmZ2FQ4OLmvHEsNhc3D+J/9+NEkLiT92bU8O5h4NiXOiParwZis8GL
 EuP+6H3I091fRQ1TLn3Ugfr3Uav9b9I0QCILA9Z/PVRe+L+j938wsOAbeUkqmuB7xbg9
 x3VWQdgMyrh12Dfg1EYPsLoJzS7/W9kKwx/U5Ec96Rj4UPRAadmkxVHEyJg4RU2y9Gb5
 lJk5n8/pvJ3xDvaXixRQaq/O1DfnxQI8EQ66lBCJKs1AHMawuCfSVoWjYbb3FhljSL7V
 Vjr3b7Ra1nGzBErwbtz+ux9VhNGsAPUeknrcZ3n8HIc3FroU2JSBYSKYZyJVsM4u+sPP
 EdNA==
X-Gm-Message-State: APjAAAXL8/ZEOKunwywA+6PDyqdQGFNHDXqzhIvTZpKq5MtKpooeC91w
 fgGmiUwxtluwki3QDeNsKxf0bugjOMfk35Xbwgs=
X-Google-Smtp-Source: APXvYqwyxQLLVnmLvKFIL70xL0tzIZAVnorOuOcnYEFens6NIP9t6qe+eBmrP7I/PIQaIIBzMtUKhvVwBjMtw/sle20=
X-Received: by 2002:a1f:db43:: with SMTP id s64mr9004129vkg.67.1569767576596; 
 Sun, 29 Sep 2019 07:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190929094544.5e0b9040@ds9>
In-Reply-To: <20190929094544.5e0b9040@ds9>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 29 Sep 2019 10:32:45 -0400
Message-ID: <CAKb7Uvgws_-M+usTAVDD4Y6B8XZGF-CT9nfNVG4xP8kstBrJeg@mail.gmail.com>
To: pete <pg.nikolic1@gmail.com>
Subject: Re: [Nouveau] nouveau locking machine solid
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMjksIDIwMTkgYXQgNDo0NiBBTSBwZXRlIDxwZy5uaWtvbGljMUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4KPiBIaSAuCj4KPiBJIGFtIGhhdmluZyBhIHZlcnkgYW5ub3lpbmcgcHJv
YmxlbSBub3Qgc3VyZSB3aGVyZSB0aGUgcm9vdCBvZiBpdCBsaWVzCj4KPiBXaGVuIHJ1bm5pbmcg
RkxkaWdpIGl0IHJ1bnMgZmluZSBmb3IgYWJvdXQgMTAgbWluZXV0cyB0aGVuIGkgc3RhcnQKPiBn
ZXR0aW5nIGVycm9ycyAgbGVhZGluZyB0byBhIGNvbXBsZXRlIGxvY2sgdXAgdGhhdCBuZWVkcyBh
IHBvd2VyIGJ1dHRvbgo+IHRvIGZyZWUgaXQgdXAgaSBnZXQgdGhlIGZvbGxvd2luZwo+Cj4gWyAg
NjUzLjA4MDQ5N10gbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86IERNQV9QVVNIRVIgLSBjaCAz
CgpUaGlzIGlzIHZlcnkgbXVjaCBhIG5vdXZlYXUgcHJvYmxlbS4gV2UgZG8gc29tZXRoaW5nIHdy
b25nIHdoZW4Kc3dpdGNoaW5nIGNoYW5uZWxzIGFuZCB0aGUgcHVzaGVyIGdldHMgdXBzZXQuIFRo
aXMgYWZmZWN0cyBUZXNsYQpmYW1pbHkgR1BVcyAoRzh4LCBHOXgsIEdUMnh4KS4KCk5vIGtub3du
IHNvbHV0aW9uLgoKQ2hlZXJzLAoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
