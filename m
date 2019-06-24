Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7551951A75
	for <lists+nouveau@lfdr.de>; Mon, 24 Jun 2019 20:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFD889CBA;
	Mon, 24 Jun 2019 18:25:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B9389CB3
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jun 2019 18:25:00 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id s184so10483610oie.9
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jun 2019 11:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsFsqmCeB4cJxbUvEFO6xcZSO/kARHjBGNTe6zm2OGk=;
 b=S6jwOu3ds+uMYdtmID1uPGvgPr2JqnyIlFoYjlky1dFz+2vcs1t3x2xZ/6G3pLdsko
 C4k2viZO+k90X349iYzI5UW6t8PM36YYuajSQIYIcBqUcFXQxdXR+HbUCUG+HFDjbst6
 MFTiMGwY+FJm5MNWYhOHVsJllq43eV4a+WdFgHXlJ83Bu/5DD0AlsTTiojBKKBLnVRJd
 T4AlaxY3kBQRgkfH/GtYpSoZPNZlQriUA9Wbu0iZdR/npOddUiM+iLW+j4N+N2gJnFEl
 6qMJxxVH0Sc+8a6NWrttt7jqn1XKwuNWUdDDlhPS6BtHqCvdj4wSyw+XGwQqfMnej7jd
 q2fw==
X-Gm-Message-State: APjAAAV46s6KBl+M88Bv94/kLMm2uOAwjZcEfIdC+7HDFh1uZIh85rN2
 M80NBlnPixFwA8fuwMUrMLWlDjzarx0ejp77EQbaPg==
X-Google-Smtp-Source: APXvYqxMfIu+2D2MtYcv2E7EXzI2zB57kKNYjO9p4H9g9zR42W2XzhT13YcbI1eS8VOBT1jN50QqXbLB+mAAmyIYdBg=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr11696883oii.0.1561400699583; 
 Mon, 24 Jun 2019 11:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
In-Reply-To: <20190620191733.GH12083@dhcp22.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 24 Jun 2019 11:24:48 -0700
Message-ID: <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NsFsqmCeB4cJxbUvEFO6xcZSO/kARHjBGNTe6zm2OGk=;
 b=ISIKS+QlpEyn1hNfgdDi5hMHKw8iit0945EcE3yN7j+0wsgacWlTs5VS/2eHyNPn4P
 zFzHaSyW66Yiy2RhkTwuJ3InCkBlGpTPkGdBxkYOWHXgUlVbX7KrnXrnxhmbl79B80YX
 fCQYLMQ6T4q3GxjWwuuuag5EPhpGhA+skRXUiofVA4jxcOoybEtzKs47HHrVewo4aeOH
 xEgr2mAYq4kDK9twlyulxuXtH8x20UgS6h2b36rjnfm3Zpe3kyRxJhg0wXN2sl5N3Gx9
 a1ANzgYTbnIct0aX4IAsj7uocTALXH4slbfh3ZtWL5Y9qp3yWn0Ovu6E52I1ME72busN
 XZfQ==
Subject: Re: [Nouveau] [PATCH 05/22] mm: export alloc_pages_vma
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMTI6MTcgUE0gTWljaGFsIEhvY2tvIDxtaG9ja29Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUgMTMtMDYtMTkgMTE6NDM6MDgsIENocmlzdG9waCBI
ZWxsd2lnIHdyb3RlOgo+ID4gbm92ZWF1IGlzIGN1cnJlbnRseSB1c2luZyB0aGlzIHRocm91Z2gg
YW4gb2RkIGhtbSB3cmFwcGVyLCBhbmQgSSBwbGFuCj4gPiB0byBzd2l0Y2ggaXQgdG8gdGhlIHJl
YWwgdGhpbmcgbGF0ZXIgaW4gdGhpcyBzZXJpZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiAtLS0KPiA+ICBtbS9tZW1wb2xpY3kuYyB8
IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9tbS9tZW1wb2xpY3kuYyBiL21tL21lbXBvbGljeS5jCj4gPiBpbmRleCAwMTYwMGQ4MGFl
MDEuLmY5MDIzYjVmYmEzNyAxMDA2NDQKPiA+IC0tLSBhL21tL21lbXBvbGljeS5jCj4gPiArKysg
Yi9tbS9tZW1wb2xpY3kuYwo+ID4gQEAgLTIwOTgsNiArMjA5OCw3IEBAIGFsbG9jX3BhZ2VzX3Zt
YShnZnBfdCBnZnAsIGludCBvcmRlciwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPiAg
b3V0Ogo+ID4gICAgICAgcmV0dXJuIHBhZ2U7Cj4gPiAgfQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BM
KGFsbG9jX3BhZ2VzX3ZtYSk7Cj4KPiBBbGwgYWxsb2NhdG9yIGV4cG9ydGVkIHN5bWJvbHMgYXJl
IEVYUE9SVF9TWU1CT0wsIHdoYXQgaXMgYSByZWFzb24gdG8KPiBoYXZlIHRoaXMgb25lIHNwZWNp
YWw/CgpJIGFza2VkIGZvciB0aGlzIHNpbXBseSBiZWNhdXNlIGl0IHdhcyBub3QgZXhwb3J0ZWQg
aGlzdG9yaWNhbGx5LiBJbgpnZW5lcmFsIEkgd2FudCB0byBlc3RhYmxpc2ggZXhwbGljaXQgZXhw
b3J0LXR5cGUgY3JpdGVyaWEgc28gdGhlCmNvbW11bml0eSBjYW4gc3BlbmQgbGVzcyB0aW1lIGRl
YmF0aW5nIHdoZW4gdG8gdXNlIEVYUE9SVF9TWU1CT0xfR1BMClsxXS4KClRoZSB0aG91Z2h0IGlu
IHRoaXMgaW5zdGFuY2UgaXMgdGhhdCBpdCBpcyBub3QgaGlzdG9yaWNhbGx5IGV4cG9ydGVkCnRv
IG1vZHVsZXMgYW5kIGl0IGlzIHNhZmVyIGZyb20gYSBtYWludGVuYW5jZSBwZXJzcGVjdGl2ZSB0
byBzdGFydAp3aXRoIEdQTC1vbmx5IGZvciBuZXcgc3ltYm9scyBpbiBjYXNlIHdlIGRvbid0IHdh
bnQgdG8gbWFpbnRhaW4gdGhhdAppbnRlcmZhY2UgbG9uZy10ZXJtIGZvciBvdXQtb2YtdHJlZSBt
b2R1bGVzLgoKWWVzLCB3ZSBhbHdheXMgcmVzZXJ2ZSB0aGUgcmlnaHQgdG8gcmVtb3ZlIC8gY2hh
bmdlIGludGVyZmFjZXMKcmVnYXJkbGVzcyBvZiB0aGUgZXhwb3J0IHR5cGUsIGJ1dCBoaXN0b3J5
IGhhcyBzaG93biB0aGF0IGV4dGVybmFsCnByZXNzdXJlIHRvIGtlZXAgYW4gaW50ZXJmYWNlIHN0
YWJsZSAoY29udHJhcnkgdG8KRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N0YWJsZS1hcGktbm9uc2Vu
c2UucnN0KSB0ZW5kcyB0byBiZSBsZXNzIGZvcgpHUEwtb25seSBleHBvcnRzLgoKWzFdOiBodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvcGlwZXJtYWlsL2tzdW1taXQtZGlzY3Vzcy8y
MDE4LVNlcHRlbWJlci8wMDU2ODguaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
