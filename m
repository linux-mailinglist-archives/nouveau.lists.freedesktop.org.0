Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7840E737C3
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 21:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BE86E63B;
	Wed, 24 Jul 2019 19:21:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CFA6E63B
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2019 19:21:56 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w190so34599205qkc.6
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2019 12:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=q7VJ5lbRcag+sb2GFiCBi0ogY7ktByen10i6R5SYdYM=;
 b=nIJaRrs0o4kh/3tKHGR/vpRKlswb7TOOqwYLYhxPFdWhLZUKLBYYRqMYb5EKiiuA3X
 AQu00niBfwn7Mjt8kYLx7zJy71Rmwk1VjY4ikGskF8Waw5GJQjBOlKPWuaDv8YKdO4Iy
 k/Fc1cJo0mt7c6h6IF1flVWiSwq6InJ/lkcAzjJr2i0FbbLLwYAqnR7HvlWhSCR2YK6T
 p9XZEtrI9RMGmRhuNRXYB2hyerI7i1ip5k/lgi526hRZxmp3up+ADyLFYMvo2v6YQtvy
 2k3JEyEKxGP1AxfbgAb42ttLlLJ2tOwET9+EbYrvdw6VOfdeCkn/zvT/NVaYszGx329R
 f4uA==
X-Gm-Message-State: APjAAAXbyLj/5gg83Q+xnmK2rjJlbqHtebYIhyvaCD/C98sPNQeQB6SY
 kHXayD10mFOC0ASTk8sEOZX9bw==
X-Google-Smtp-Source: APXvYqxIqRA+0VLqS5/ktYsyx1BSHKocPYVvc0BAedibqfRz0wbPwwvU+Y1GIKj2RSb05TRVjFqKEg==
X-Received: by 2002:a05:620a:1425:: with SMTP id
 k5mr56337391qkj.146.1563996116084; 
 Wed, 24 Jul 2019 12:21:56 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id l19sm27634792qtb.6.2019.07.24.12.21.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jul 2019 12:21:55 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hqMpn-0006gr-3W; Wed, 24 Jul 2019 16:21:55 -0300
Date: Wed, 24 Jul 2019 16:21:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20190724192155.GG28493@ziepe.ca>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz>
 <20190724180837.GF28493@ziepe.ca>
 <20190724185617.GE6410@dhcp22.suse.cz>
 <20190724185910.GF6410@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724185910.GF6410@dhcp22.suse.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=q7VJ5lbRcag+sb2GFiCBi0ogY7ktByen10i6R5SYdYM=;
 b=ZyJ3zgq6h4cja/hdaLrA6IkzBFDVRDUJUFtWz1fzLJwFO3+4I4Mk/FCq69MWFKhPkn
 VmJtaQRVCCbTW4B/7vtp3EFV7mKQ0Du9zN1ddOb32MyshNPl6WhBSEDHrm+k6o2CyMMO
 4KyPGLB4T/6MfLf1NsYTF9rAzr1pU8FsMWEvqr8KtU1D2GgXOl729S0aNG0wyoeil1db
 UU7GVtf1oaMsSE860psV8LYDQAfcq3WrN/GcPafu+19PCrIlmB/lcCJJ/hsWVBf9sq/S
 3j9mLwgItOsVezznIUV4U2H56ZO80MnsJTCG1n8+5OJ16YnPZyPc+ck/lacJ5FRZiPcz
 PO7Q==
Subject: Re: [Nouveau] [PATCH] mm/hmm: replace hmm_update with
 mmu_notifier_range
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDg6NTk6MTBQTSArMDIwMCwgTWljaGFsIEhvY2tvIHdy
b3RlOgo+IE9uIFdlZCAyNC0wNy0xOSAyMDo1NjoxNywgTWljaGFsIEhvY2tvIHdyb3RlOgo+ID4g
T24gV2VkIDI0LTA3LTE5IDE1OjA4OjM3LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+IE9u
IFdlZCwgSnVsIDI0LCAyMDE5IGF0IDA3OjU4OjU4UE0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3cm90
ZToKPiA+IFsuLi5dCj4gPiA+ID4gTWF5YmUgbmV3IHVzZXJzIGhhdmUgc3RhcnRlZCByZWx5aW5n
IG9uIGEgbmV3IHNlbWFudGljIGluIHRoZSBtZWFudGltZSwKPiA+ID4gPiBiYWNrIHRoZW4sIG5v
bmUgb2YgdGhlIG5vdGlmaWVyIGhhcyBldmVuIHN0YXJ0ZWQgYW55IGFjdGlvbiBpbiBibG9ja2lu
Zwo+ID4gPiA+IG1vZGUgb24gYSBFQUdBSU4gYmFpbG91dC4gTW9zdCBvZiB0aGVtIHNpbXBseSBk
aWQgdHJ5bG9jayBlYXJseSBpbiB0aGUKPiA+ID4gPiBwcm9jZXNzIGFuZCBiYWlsZWQgb3V0IHNv
IHRoZXJlIHdhcyBub3RoaW5nIHRvIGRvIGZvciB0aGUgcmFuZ2VfZW5kCj4gPiA+ID4gY2FsbGJh
Y2suCj4gPiA+IAo+ID4gPiBTaW5nbGUgbm90aWZpZXJzIGFyZSBub3QgdGhlIHByb2JsZW0uIEkg
dHJpZWQgdG8gbWFrZSB0aGlzIGNsZWFyIGluCj4gPiA+IHRoZSBjb21taXQgbWVzc2FnZSwgYnV0
IGxldHMgYmUgbW9yZSBleHBsaWNpdC4KPiA+ID4gCj4gPiA+IFdlIGhhdmUgKnR3byogbm90aWZp
ZXJzIHJlZ2lzdGVyZWQgdG8gdGhlIG1tLCBBIGFuZCBCOgo+ID4gPiAKPiA+ID4gQSBpbnZhbGlk
YXRlX3JhbmdlX3N0YXJ0OiAoaGFzIG5vIGJsb2NraW5nKQo+ID4gPiAgICAgc3Bpbl9sb2NrKCkK
PiA+ID4gICAgIGNvdW50ZXIrKwo+ID4gPiAgICAgc3Bpbl91bmxvY2soKQo+ID4gPiAKPiA+ID4g
QSBpbnZhbGlkYXRlX3JhbmdlX2VuZDoKPiA+ID4gICAgIHNwaW5fbG9jaygpCj4gPiA+ICAgICBj
b3VudGVyLS0KPiA+ID4gICAgIHNwaW5fdW5sb2NrKCkKPiA+ID4gCj4gPiA+IEFuZCB0aGlzIG9u
ZToKPiA+ID4gCj4gPiA+IEIgaW52YWxpZGF0ZV9yYW5nZV9zdGFydDogKGhhcyBibG9ja2luZykK
PiA+ID4gICAgIGlmICghdHJ5X211dGV4X2xvY2soKSkKPiA+ID4gICAgICAgICByZXR1cm4gLUVB
R0FJTjsKPiA+ID4gICAgIGNvdW50ZXIrKwo+ID4gPiAgICAgbXV0ZXhfdW5sb2NrKCkKPiA+ID4g
Cj4gPiA+IEIgaW52YWxpZGF0ZV9yYW5nZV9lbmQ6Cj4gPiA+ICAgICBzcGluX2xvY2soKQo+ID4g
PiAgICAgY291bnRlci0tCj4gPiA+ICAgICBzcGluX3VubG9jaygpCj4gPiA+IAo+ID4gPiBTbyBu
b3cgdGhlIG9vbSBwYXRoIGRvZXM6Cj4gPiA+IAo+ID4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0
X25vbl9ibG9ja2luZzoKPiA+ID4gIGZvciBlYWNoIG1uOgo+ID4gPiAgICBhLT5pbnZhbGlkYXRl
X3JhbmdlX3N0YXJ0Cj4gPiA+ICAgIGItPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQKPiA+ID4gICAg
cmMgPSBFQUdBSU4KPiA+ID4gCj4gPiA+IE5vdyB3ZSBTS0lQIEEncyBpbnZhbGlkYXRlX3Jhbmdl
X2VuZCBldmVuIHRob3VnaCBBIGhhZCBubyBpZGVhIHRoaXMKPiA+ID4gd291bGQgaGFwcGVuIGhh
cyBzdGF0ZSB0aGF0IG5lZWRzIHRvIGJlIHVud291bmQuIEEgaXMgYnJva2VuLgo+ID4gPiAKPiA+
ID4gQiBzdXJ2aXZlZCBqdXN0IGZpbmUuCj4gPiA+IAo+ID4gPiBBIGFuZCBCICphbG9uZSogd29y
ayBmaW5lLCBjb21iaW5lZCB0aGV5IGZhaWwuCj4gPiAKPiA+IEJ1dCB0aGF0IHJlcXVpcmVzIHRo
YXQgdGhleSBzaGFyZSBzb21lIHN0YXRlLCByaWdodD8KPiA+IAo+ID4gPiBXaGVuIHRoZSBjb21t
aXQgd2FzIGxhbmRlZCB5b3UgY2FuIHVzZSBLVk0gYXMgYW4gZXhhbXBsZSBvZiBBIGFuZCBSRE1B
Cj4gPiA+IE9EUCBhcyBhbiBleGFtcGxlIG9mIEIKPiA+IAo+ID4gQ291bGQgeW91IHBvaW50IG1l
IHdoZXJlIHRob3NlIHR3byBzaGFyZSB0aGUgc3RhdGUgcGxlYXNlPyBLVk0gc2VlbXMgdG8KPiA+
IGJlIHVzaW5nIGt2bS0+bW11X25vdGlmaWVyX2NvdW50IGJ1dCBJIGRvIG5vdCBrbm93IHdoZXJl
IHRvIGxvb2sgZm9yIHRoZQo+ID4gUkRNQS4uLgo+IAo+IFNjcmF0Y2ggdGhhdC4gRUxPTkdEQVku
Li4gSSBjYW4gc2VlIHlvdXIgcG9pbnQuIEl0IGlzIGFsbCBvciBub3RoaW5nCj4gdGhhdCBkb2Vz
bid0IHJlYWxseSB3b3JrIGhlcmUuIExvb2tpbmcgYmFjayBhdCB5b3VyIHBhdGNoIGl0IHNlZW1z
Cj4gcmVhc29uYWJsZSBidXQgSSBhbSBub3Qgc3VyZSB3aGF0IGlzIHN1cHBvc2VkIHRvIGJlIGEg
YmVoYXZpb3IgZm9yCj4gbm90aWZpZXJzIHRoYXQgZmFpbGVkLgoKT2theSwgZ29vZCB0byBrbm93
IEknbSBub3QgbWlzc2luZyBzb21ldGhpbmcuIFRoZSBpZGVhIHdhcyB0aGUgZmFpbGVkCm5vdGlm
aWVyIHdvdWxkIGhhdmUgdG8gaGFuZGxlIHRoZSBtYW5kYXRvcnkgX2VuZCBjYWxsYmFjay4KCkkn
dmUgcmVmbGVjdGVkIG9uIGl0IHNvbWUgbW9yZSwgYW5kIEkgaGF2ZSBhIHNjaGVtZSB0byBiZSBh
YmxlIHRvCid1bmRvJyB0aGF0IGlzIHNhZmUgYWdhaW5zdCBjb25jdXJyZW50IGhsaXN0X2RlbF9y
Y3UuCgpJZiB3ZSBjaGFuZ2UgdGhlIHJlZ2lzdGVyIHRvIGtlZXAgdGhlIGhsaXN0IHNvcnRlZCBi
eSBhZGRyZXNzIHRoZW4gd2UKY2FuIGRvIGEgdGFyZ2V0dGVkICd1bmRvJyBvZiBwYXN0IHN0YXJ0
cyB0ZXJtaW5hdGVkIGJ5IGFkZHJlc3MKbGVzcy10aGFuIGNvbXBhcmlzb24gb2YgdGhlIGZpcnN0
IGZhaWxpbmcgc3RydWN0IG1tdV9ub3RpZmllci4KCkl0IHJlbGllcyBvbiB0aGUgZmFjdCB0aGF0
IHJjdSBpcyBvbmx5IHVzZWQgdG8gcmVtb3ZlIGl0ZW1zLCB0aGUgbGlzdAphZGRzIGFyZSBhbGwg
cHJvdGVjdGVkIGJ5IG1tIGxvY2tzLCBhbmQgdGhlIG51bWJlciBvZiBtbXUgbm90aWZpZXJzIGlz
CnZlcnkgc21hbGwuCgpUaGlzIHNlZW1zIHdvcmthYmxlIGFuZCBkb2VzIG5vdCBuZWVkIG1vcmUg
ZHJpdmVyIHJldmlldy91cGRhdGUuLi4KCkhvd2V2ZXIsIGhtbSdzIGltcGxlbWVudGF0aW9uIHN0
aWxsIG5lZWRzIG1vcmUgZml4aW5nLgoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
