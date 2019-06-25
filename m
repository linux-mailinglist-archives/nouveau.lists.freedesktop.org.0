Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362652338
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 07:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F3D89E63;
	Tue, 25 Jun 2019 05:58:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911C789E63
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 05:58:05 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id a9so11719072lff.7
 for <nouveau@lists.freedesktop.org>; Mon, 24 Jun 2019 22:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWOu4ltCHSlSabx4lD6vFk/Le+Z+5g63c65ERQbDJC0=;
 b=VK38eMUg++oBgDI2tqaBxZ4ffu7iD8CXr020I3ZQIHyElBIJ9vuRkXN8QL3MILJAmn
 ks3+Fz0Y6dKWZiI7JEEP3Q5nsQqsQsIyie8m5UkuSrTQOTzhke7xJuutJ8bGZHMLq8nz
 pOuQb59dmKVEUzgd5kEb5fERYrtW1BTz3B59YP0fKu4UqO+JeqORjOoSLvdivltEZbxX
 8x9wJxX4NE3ehzv39RoKSbL2pOQ679rLFu+YcWHdemaXZPgXFgkvXv7w7RVO5sk/VFGx
 b/t6xi6os2+1pjVC35mxtLPy3BPsH8x99KOEQnkhqIjnJQOYjUtTJ/1w0RYdmnzxyX7c
 0e5A==
X-Gm-Message-State: APjAAAUFifwnxunR3+bsUd+Hp6EMHyoBY1kvFnY2awWowBfnENvc2bH5
 tjw1m5Zkcvc15F10oj1mtQetaN7QX771oaFQpFi9cw==
X-Google-Smtp-Source: APXvYqzPDZ57DP5nP6q2os/1ty3qAsTu7ST9qhQom7ugZL4iE8b3W6TB16IAP5ozn9UxmdjrwbqtXxspFegBnloZ04g=
X-Received: by 2002:a19:750b:: with SMTP id y11mr40627421lfe.16.1561442283949; 
 Mon, 24 Jun 2019 22:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190613063514.15317-1-drake@endlessm.com>
 <20190613200344.GI13533@google.com>
In-Reply-To: <20190613200344.GI13533@google.com>
From: Daniel Drake <drake@endlessm.com>
Date: Tue, 25 Jun 2019 13:57:51 +0800
Message-ID: <CAD8Lp47LM_Z=Y=zg6SYSxMLpGCrWNxHc7i3RDtoTUuLhafK4WQ@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=zWOu4ltCHSlSabx4lD6vFk/Le+Z+5g63c65ERQbDJC0=;
 b=HXycKuoDBi26gxWlaiAXhYBT/qstKlzdqEVztWJxeShHWhDfIuOV6T59iHYXAMfZ/i
 nqEHG2Dgw9x/i6AT7NHrayc16qvBLIIKdciREANPY3DvuuDsPIMo2hAp17+2SMUR2UKZ
 2p8BshgljA8zTdRYpQu8+wNYWkwzJ+g3cQIkXElBI0zdrEH80SD0suV5lYbgGn9TIBbA
 DavKXhV6B2Uj2t+Vs7Gh/WXhjGuIIg/RvVCSyn4nUqOfqQLYC4GhCFfX0N/lL24NDUL/
 +MjL0Ook/tg+3UFhD5NRkikqMUKmol0Ii/YHbLO+mJw23n1nSzgOvUB3iCPLGYQHQtyj
 AQVA==
Subject: Re: [Nouveau] [PATCH] PCI: Expose hidden NVIDIA HDA controllers
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
Cc: Aaron Plattner <aplattner@nvidia.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Maik Freudenberg <hhfeuer@gmx.de>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 =?UTF-8?B?TWFydGluIExvcGF0w6HFmQ==?= <lopin@dataplex.cz>, zigarrre@gmail.com,
 nouveau@lists.freedesktop.org, Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNDowMyBBTSBCam9ybiBIZWxnYWFzIDxoZWxnYWFzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IElzIGl0IHBvc3NpYmxlIHRoYXQgdGhpcyB3b3JrcyBvbiBXaW5k
b3dzIGJ1dCBub3QgTGludXggYmVjYXVzZSB0aGV5Cj4gaGFuZGxlIEFDUEkgaG90cGx1ZyBzbGln
aHRseSBkaWZmZXJlbnRseT8KPgo+IE1hcnRpbiBkaWQgc29tZSBuaWNlIGRlYnVnIFsxXSBhbmQg
Zm91bmQgdGhhdCBfRFNNLCBfUFMwLCBhbmQgX1BTMwo+IGZ1bmN0aW9ucyB3cml0ZSB0aGUgY29u
ZmlnIGJpdCBhdCAweDQ4OC4gIFRoZSBkbWVzZyBsb2cgWzJdIGZyb20KPiB6aWdhcnJyZSBzZWVt
cyB0byBzaG93IHRoYXQgX09TQyBmYWlsZWQgKHdoaWNoIEkgKnRoaW5rKiBtZWFucyB3ZQo+IHdv
bid0IHVzZSBwY2llaHApIGFuZCB0aGF0IHRoZXJlJ3MgYSBzbG90IHJlZ2lzdGVyZWQgYnkgYWNw
aXBocC4KPgo+IE1heWJlIHRoaXMgd29ya3Mgb24gV2luZG93cyB2aWEgYW4gQUNQSSBob3RwbHVn
IGV2ZW50IHRoYXQgcnVucyBBTUwgdG8KPiBmbGlwIHRoZSAweDQ4OCBiaXQgYW5kIHJlc2NhbnMg
dGhlIGJ1cz8gIFRoYXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvCj4gbWUgdGhhbiB0aGUgaWRl
YSB0aGF0IHRoZSBOdmlkaWEgZHJpdmVyIGRvZXMgaXQuICBJIGNvdWxkIGltYWdpbmUgdGhlCj4g
ZHJpdmVyIGZsaXBwaW5nIHRoZSBiaXQsIGJ1dCB0aGUgYnVzIHJlc2NhbiBzZWVtcyBsaWtlIGl0
IHdvdWxkIGJlIG91dAo+IG9mIHRoZSBkcml2ZXIncyBwdXJ2aWV3LgoKT2gsIEkgaGFkIG1pc3Nl
ZCB0aGF0IHBhcnQgb2YgdGhlIGNvbnZlcnNhdGlvbi4gSSBjaGVja2VkIG9uIHRoZSBBY2VyClBy
ZWRhdG9yIEczLTU3MiBhbmQgSSB3YXMgYWJsZSB0byBmaW5kIEFDUEkgY29kZSB0byBtYW5pcHVs
YXRlIHRoZQptYWdpYyBiaXQsIGhvd2V2ZXIgSSBjYW4ndCBzZWUgYW55IGxpbmthZ2UgdG8gX0RT
TSBtZXRob2RzLCBhbmQgdGhlCmNvZGUgbG9va3MgbGlrZSBpdCB3b3VsZCBvbmx5IGJlIHJ1biBv
biBwb3dlci11cC4KCkkgbW9kaWZpZWQgdGhlIERTRFQgdG8gYXZvaWQgdGhlIGNvZGVwYXRocyB0
aGF0IHR3ZWFrIHRoZSBiaXQsIGJvb3RlZApXaW5kb3dzIGFuZCBjb25maXJtZWQgdGhhdCBjaGFu
Z2UgaGFkIHRha2VuIGVmZmVjdC4gVGhlbiBJIGluc3RhbGxlZAp0aGUgbnZpZGlhIGRyaXZlciBh
bmQgb2JzZXJ2ZWQgdGhhdCB0aGUgbWFnaWMgYml0IHdhcyBiZWluZwptYW5pcHVsYXRlZCBhY2Nv
cmRpbmcgdG8gSERNSSBjYWJsZSBzdGF0dXMuCgpTbyBJIGJlbGlldmUgdGhlIG52aWRpYSBXaW5k
b3dzIGRyaXZlciBkb2VzIG5vdCByZWx5IG9uIEFDUEkgZm9yIHRoaXMKdG8gd29yay4gSXQgcHJl
c3VtYWJseSBkb2VzIGl0IGRpcmVjdGx5IGFuZCBjYXVzZXMgcmVzY2FucywgYXMgZXZpbCBhcwp0
aGF0IHNvdW5kcy4gSSBhZGRlZCBtb3JlIGRldGFpbHMgdG8gdGhlIGJ1ZyByZXBvcnQuCgo+IFRo
ZSBkbWVzZyBsb2cgYWxzbyBzaG93cyBzb21lIF9EU00gd2FybmluZ3M7IGFyZSB0aGVzZSBjb3Jy
ZWxhdGVkIHdpdGgKPiBjYWJsZSBwbHVnL3VucGx1Zz8gIElzIHRoZXJlIHNvbWUgYWNwaXBocCBk
ZWJ1ZyB3ZSBjYW4gdHVybiBvbiB0byBnZXQKPiBtb3JlIHZpc2liaWxpdHkgaW50byBob3RwbHVn
IGV2ZW50cyBhbmQgaG93IHdlIGhhbmRsZSB0aGVtPwoKSSBzY2F0dGVyZWQgYSBsb2FkIG9mIGRl
YnVnIG1lc3NhZ2VzIGFyb3VuZCB0aGUgQUNQSSAmIFBDSWUgaG90cGx1Zwpjb2RlIGJ1dCBub3Ro
aW5nIGdldHMgaGl0LiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgYXJjaGl0ZWN0ZWQgdG8gYmUKaGFu
ZGxlZCBieSBleGlzdGluZyBQQ0kgaG90cGx1ZyBtZWNoYW5pc21zLgoKSSBkb24ndCBoYXZlIGFu
eSBfRFNNIHdhcm5pbmdzIG9uIHRoaXMgcHJvZHVjdCwgZXZlbiBhZnRlciBjb25uZWN0aW5nCmFu
ZCBkaXNjb25uZWN0aW5nIHRoZSBIRE1JIGNhYmxlLgoKVGhhbmtzCkRhbmllbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
