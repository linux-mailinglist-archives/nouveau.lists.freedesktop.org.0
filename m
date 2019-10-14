Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA27D62EA
	for <lists+nouveau@lfdr.de>; Mon, 14 Oct 2019 14:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1030A6E2B4;
	Mon, 14 Oct 2019 12:48:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6B6E2B4
 for <nouveau@lists.freedesktop.org>; Mon, 14 Oct 2019 12:48:28 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-MUFUPYFaPcC7kfpCyPOZ0Q-1; Mon, 14 Oct 2019 08:48:25 -0400
Received: by mail-qt1-f197.google.com with SMTP id t25so17808657qtq.9
 for <nouveau@lists.freedesktop.org>; Mon, 14 Oct 2019 05:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXkPHKq1X/wdBr9px25MG4qc3ybVMCjjcUS7bNHfOl0=;
 b=kAo8a0vhhSnLIWTOWq11vtER8bj0TAjU2WmQKUOu4LTVuF1r7F2sFcMnGxYwotsTs6
 c4sE2T6QeqL0oQv2woq+oCXeY7bDzE87Hlf+SZ/gjppiNEsM2+m1TT3toCiPHKQHzdJY
 kiys9ZQcJJLKE9kFf+UE3uJEBgLHbuYAl0xk3gUeuMNOA/E+yJTGITOr/NLzQF0/GdK2
 UTHxrXz7lNaZy1Ud5x3zU+UVBw1/OejIGHGcRsCE+W8rXvP+0SlQzlJM0Q32hl9Zuq/1
 qP2q16N5zm1fdROwuMgPZVEM5N4Is5TEzRzxwNXTJs+kVFv1cQ8ZD/3q880DngaAUZeA
 eeJw==
X-Gm-Message-State: APjAAAUxFWYP52M3c7TcDayFBzMejY1uOij18wrGrNUk+7oey0HZJtms
 ee+/+zsPeXF+4XfmJA/tzNXc0X9av7pyfIcM1GEZtG/0/Za1cZQksAbjIfPBFR+BXEzHFi8DIib
 vC3cVagkurC1oap/oa+9wgBcXiTO+S5QmDWK7wCyYHA==
X-Received: by 2002:a05:6214:134d:: with SMTP id
 b13mr30719433qvw.224.1571057304693; 
 Mon, 14 Oct 2019 05:48:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJzDn9PhT6DqbBBe0MvOolO/UAp6jyIE2du8fHqtXpSbtgBN7d8XPuzLK32N6EQNjTIXiESVqKxS654EeShC0=
X-Received: by 2002:a05:6214:134d:: with SMTP id
 b13mr30719415qvw.224.1571057304373; 
 Mon, 14 Oct 2019 05:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191014064658.2325-1-imirkin@alum.mit.edu>
In-Reply-To: <20191014064658.2325-1-imirkin@alum.mit.edu>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 14 Oct 2019 14:48:13 +0200
Message-ID: <CACO55tuNG9qQmH2-ZDps7uHvndxhH6nXKs5mjHoxt35SqA6Uow@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-MC-Unique: MUFUPYFaPcC7kfpCyPOZ0Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571057307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaJrq54RO5qVRMbuLTQ57bzXdujGg/2vx14LbfGHkyc=;
 b=OuKfbR72N2vQFtllC0UhNn0htJr8duweKOan9R4WfWof7hK5v8uVltA1iqdlxKZYraZ2oU
 lV0afvXTHuJ6TQkfxPvG5STBB5fesFDSFxa1c8zE6x7Ls9lDCbD2gRcKT7XNNoOeJMuzBW
 ZZrDBj9Fvlafb7hmNeICorRYUdkomnA=
Subject: Re: [Nouveau] [PATCH] nv50/ir: mark STORE destination inputs as used
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
Cc: ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gTW9uLCBP
Y3QgMTQsIDIwMTkgYXQgODo0NyBBTSBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+
IHdyb3RlOgo+Cj4gT2JzZXJ2ZWQgYW4gaXNzdWUgd2hlbiBsb29raW5nIGF0IHRoZSBjb2RlIGdl
bmVyYXRlZHkgYnkgdGhlCj4gaW1hZ2UtdmVydGV4LWF0dHJpYi1pbnB1dC1vdXRwdXQgcGlnbGl0
IHRlc3QuIEV2ZW4gdGhvdWdoIHRoZSB0ZXN0Cj4gaXRzZWxmIHdvcmtlZCBmaW5lIChkdWUgdG8g
VElDIDAgYmVpbmcgdXNlZCBmb3IgdGhlIGltYWdlKSwgdGhpcyBuZWVkcwo+IHRvIGJlIGZpeGVk
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+
IC0tLQo+ICBzcmMvZ2FsbGl1bS9kcml2ZXJzL25vdXZlYXUvY29kZWdlbi9udjUwX2lyX2Zyb21f
dGdzaS5jcHAgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1MF9p
cl9mcm9tX3Rnc2kuY3BwIGIvc3JjL2dhbGxpdW0vZHJpdmVycy9ub3V2ZWF1L2NvZGVnZW4vbnY1
MF9pcl9mcm9tX3Rnc2kuY3BwCj4gaW5kZXggZDYyZDM2MDA4ZTYuLjhjNDI5MDI2NDUyIDEwMDY0
NAo+IC0tLSBhL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252NTBfaXJfZnJv
bV90Z3NpLmNwcAo+ICsrKyBiL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9jb2RlZ2VuL252
NTBfaXJfZnJvbV90Z3NpLmNwcAo+IEBAIC0xNTkxLDYgKzE1OTEsMTIgQEAgYm9vbCBTb3VyY2U6
OnNjYW5JbnN0cnVjdGlvbihjb25zdCBzdHJ1Y3QgdGdzaV9mdWxsX2luc3RydWN0aW9uICppbnN0
KQo+ICAgICAgICBpZiAoaW5zbi5nZXRPcGNvZGUoKSA9PSBUR1NJX09QQ09ERV9TVE9SRSAmJgo+
ICAgICAgICAgICAgZHN0LmdldEZpbGUoKSAhPSBUR1NJX0ZJTEVfTUVNT1JZKSB7Cj4gICAgICAg
ICAgIGluZm8tPmlvLmdsb2JhbEFjY2VzcyB8PSAweDI7Cj4gKwo+ICsgICAgICAgICBpZiAoZHN0
LmdldEZpbGUoKSA9PSBUR1NJX0ZJTEVfSU5QVVQpIHsKPiArICAgICAgICAgICAgLy8gVE9ETzog
SGFuZGxlIGluZGlyZWN0IHNvbWVob3c/Cj4gKyAgICAgICAgICAgIGNvbnN0IGludCBpID0gZHN0
LmdldEluZGV4KDApOwo+ICsgICAgICAgICAgICBpbmZvLT5pbltpXS5tYXNrIHw9IDE7Cj4gKyAg
ICAgICAgIH0KPiAgICAgICAgfQo+Cj4gICAgICAgIGlmIChkc3QuZ2V0RmlsZSgpID09IFRHU0lf
RklMRV9PVVRQVVQpIHsKPiAtLQo+IDIuMjEuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXU=
