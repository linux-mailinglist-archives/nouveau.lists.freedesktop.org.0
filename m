Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688A5A46C
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 20:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A17B8984C;
	Fri, 28 Jun 2019 18:44:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1DA6E281
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 18:44:47 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id r6so6981216oti.3
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 11:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNY+UkoJVrKxCjM2c24Xgrzfzfk/Z55i3p1E82IfUT4=;
 b=Zdi0yo8rxQohcV643h7oF3Exvpi1P0z9Ibu5XFLZ1oaN+GNAP9HwRMuXtQ7/noX/3f
 SRyl1sdP2lR0rob/1GqfNDWSVBIkkDAGtjA553Y71SUWL5ggfkidFR8Dt+VKn7LyI8Qz
 UOh1lPJAhIzilbK0l3uVLP/avShYvi5Gfhhh063RS5rl32lPIpMwio6pZ+igid/I/tLg
 Motx35e82AKzKEzSnqX4weinxz9PmxBxOEHScXMF9vSeymVt+nJYvkJs7MLiPPGIsFSR
 8KXPzXPaPHtzGutYR8j43IqxUexK+YccU93BhkfnhMTW2i+jXMIjjGa1FKLn0lTaHrBj
 1oyA==
X-Gm-Message-State: APjAAAVBI1KoqgtvSNPstuFpZkqpeBTr8l9tB5887q9JQf0d2QNklR/z
 OThbf/jR3JfJyc+EW2RCKLuOuPVAGPAhMB+xQ/olTw==
X-Google-Smtp-Source: APXvYqy1WcVZusxQT3gsMqR8FxlPuXMWtxZvhAO+zU3jLT7QJNrvbdWUjpng3sXAK8TgdSWU7HjEXIzdeabvXlDD8go=
X-Received: by 2002:a9d:7b48:: with SMTP id f8mr9063478oto.207.1561747486699; 
 Fri, 28 Jun 2019 11:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
 <20190628182922.GA15242@mellanox.com>
In-Reply-To: <20190628182922.GA15242@mellanox.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 11:44:35 -0700
Message-ID: <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=BNY+UkoJVrKxCjM2c24Xgrzfzfk/Z55i3p1E82IfUT4=;
 b=zI1Rfkj72TaacEJj7GZa9aQH2dQpodMnoVTwnXEaBlMSZNhY5OVVCjVG5znvL8YDvw
 /w4yi2CZ3bmDcg8+jo0W3xW8odrHcZ2aCHGJ87xs+2ltcljxDeJN66gvtxIzrVxNLxkg
 pL7hur4fQE0hdbPpJ33d47KRUWZSM8qnBIPWODQs6LDS5RSktDpzI29k0ILuZRejss34
 xnFlTPIYvocsrjjzZCQI/0Yj+GNH//C0I7LZJ/r3XYMiRT+Tq5iZQhNf2bG7bpRfCfUN
 VI7eLoWpW+vIxkXl125Fq7E2Z95KiI815ewg7Kq0wfihaAtAnAzS1E/XQAxSbE8m8Iyo
 kZOQ==
Subject: Re: [Nouveau] [PATCH 16/25] device-dax: use the dev_pagemap
 internal refcount
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6MjkgQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDEwOjEwOjEyQU0g
LTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDEw
OjA4IEFNIERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6MDIgQU0gSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgSnVuIDI4
LCAyMDE5IGF0IDA5OjI3OjQ0QU0gLTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToKPiA+ID4gPiA+
IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDg6MzkgQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT24gV2VkLCBKdW4gMjYs
IDIwMTkgYXQgMDI6Mjc6MTVQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+
ID4gPiA+ID4gVGhlIGZ1bmN0aW9uYWxpdHkgaXMgaWRlbnRpY2FsIHRvIHRoZSBvbmUgY3VycmVu
dGx5IG9wZW4gY29kZWQgaW4KPiA+ID4gPiA+ID4gPiBkZXZpY2UtZGF4Lgo+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Cj4gPiA+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVs
LmNvbT4KPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9kYXgvZGF4LXByaXZhdGUuaCB8ICA0IC0tLS0K
PiA+ID4gPiA+ID4gPiAgZHJpdmVycy9kYXgvZGV2aWNlLmMgICAgICB8IDQzIC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQ3IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBEYW5XOiBJIHRoaW5r
IHRoaXMgc2VyaWVzIGhhcyByZWFjaGVkIGVub3VnaCByZXZpZXcsIGRpZCB5b3Ugd2FudAo+ID4g
PiA+ID4gPiB0byBhY2svdGVzdCBhbnkgZnVydGhlcj8KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
VGhpcyBuZWVkcyB0byBsYW5kIGluIGhtbS5naXQgc29vbiB0byBtYWtlIHRoZSBtZXJnZSB3aW5k
b3cuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSSB3YXMgYXdhaXRpbmcgYSBkZWNpc2lvbiBhYm91dCBy
ZXNvbHZpbmcgdGhlIGNvbGxpc2lvbiB3aXRoIElyYSdzCj4gPiA+ID4gPiBwYXRjaCBiZWZvcmUg
dGVzdGluZyB0aGUgZmluYWwgcmVzdWx0IGFnYWluIFsxXS4gWW91IGNhbiBnbyBhaGVhZCBhbmQK
PiA+ID4gPiA+IGFkZCBteSByZXZpZXdlZC1ieSBmb3IgdGhlIHNlcmllcywgYnV0IG15IHRlc3Rl
ZC1ieSBzaG91bGQgYmUgb24gdGhlCj4gPiA+ID4gPiBmaW5hbCBzdGF0ZSBvZiB0aGUgc2VyaWVz
Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGNvbmZsaWN0IGxvb2tzIE9LIHRvIG1lLCBJIHRoaW5rIHdl
IGNhbiBsZXQgQW5kcmV3IGFuZCBMaW51cwo+ID4gPiA+IHJlc29sdmUgaXQuCj4gPiA+Cj4gPiA+
IEFuZHJldydzIHRyZWUgZWZmZWN0aXZlbHkgYWx3YXlzIHJlYmFzZXMgc2luY2UgaXQncyBhIHF1
aWx0IHNlcmllcy4KPiA+ID4gSSdkIHJlY29tbWVuZCBwdWxsaW5nIElyYSdzIHBhdGNoIG91dCBv
ZiAtbW0gYW5kIGFwcGx5aW5nIGl0IHdpdGggdGhlCj4gPiA+IHJlc3Qgb2YgaG1tIHJld29ya3Mu
IEFueSBvdGhlciBnaXQgdHJlZSBJJ2QgYWdyZWUgd2l0aCBqdXN0IGRvaW5nIHRoZQo+ID4gPiBs
YXRlIGNvbmZsaWN0IHJlc29sdXRpb24sIGJ1dCBJJ20gbm90IGNsZWFyIG9uIHdoYXQncyB0aGUg
YmVzdAo+ID4gPiBwcmFjdGljZSB3aGVuIGNvbmZsaWN0aW5nIHdpdGggLW1tLgo+Cj4gV2hhdCBo
YXBwZW5zIGRlcGVuZHMgb24gdGltaW5nIGFzIHRoaW5ncyBhcnJpdmUgdG8gTGludXMuIEkgcHJv
bWlzZWQKPiB0byBzZW5kIGhtbS5naXQgZWFybHksIHNvIEkgdW5kZXJzdGFuZCB0aGF0IEFuZHJl
dyB3aWxsIHF1aWx0IHJlYmFzZQo+IGhpcyB0cmVlIHRvIExpbnVzJ3MgYW5kIGZpeCB0aGUgY29u
ZmxpY3QgaW4gSXJhJ3MgcGF0Y2ggYmVmb3JlIGhlCj4gc2VuZHMgaXQuCj4KPiA+IFJlZ2FyZGxl
c3MgdGhlIHBhdGNoIGlzIGJ1Z2d5LiBJZiB5b3Ugd2FudCB0byBkbyB0aGUgY29uZmxpY3QKPiA+
IHJlc29sdXRpb24gaXQgc2hvdWxkIGJlIGJlY2F1c2UgdGhlIERFVklDRV9QVUJMSUMgcmVtb3Zh
bCBlZmZlY3RpdmVseQo+ID4gZG9lcyB0aGUgc2FtZSBmaXggb3RoZXJ3aXNlIHdlJ3JlIGtub3dp
bmdseSBsZWF2aW5nIGEgYnJva2VuIHBvaW50IGluCj4gPiB0aGUgaGlzdG9yeS4KPgo+IEknbSBu
b3Qgc3VyZSBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLCBpcyB0aGVyZSBzb21ldGhpbmcgd3Jv
bmcgd2l0aAo+IENIJ3Mgc2VyaWVzIGFzIGl0IHN0YW5kcz8gaG1tIGlzIGEgbm9uLXJlYmFzaW5n
IGdpdCB0cmVlLCBzbyBhcyBsb25nCj4gYXMgdGhlIHNlcmllcyBpcyBjb3JyZWN0ICp3aGVuIEkg
YXBwbHkgaXQqIHRoZXJlIGlzIG5vIGJyb2tlbiBoaXN0b3J5Lgo+Cj4gSSBhc3N1bWVkIHRoZSBj
b25mbGljdCByZXNvbHV0aW9uIGZvciBJcmEncyBwYXRjaCB3YXMgdG8gc2ltcGx5IHRha2UKPiB0
aGUgZGVsZXRpb24gb2YgdGhlIGlmIGJsb2NrIGZyb20gQ0gncyBzZXJpZXMgLSByaWdodD8KPgo+
IElmIHdlIGRvIG5lZWQgdG8gdGFrZSBJcmEncyBwYXRjaCBpbnRvIGhtbS5naXQgaXQgd2lsbCBn
byBhZnRlciBDSCdzCj4gc2VyaWVzIChhbmQgSXJhIHdpbGwgaGF2ZSB0byByZWJhc2UvcmVwb3N0
IGl0KSwgc28gSSB0aGluayB0aGVyZSBpcwo+IG5vdGhpbmcgdG8gZG8gYXQgdGhpcyBtb21lbnQg
LSB1bmxlc3MgeW91IGFyZSBzYXlpbmcgdGhlcmUgaXMgYQo+IHByb2JsZW0gd2l0aCB0aGUgc2Vy
aWVzIGluIENIJ3MgZ2l0IHRyZWU/CgpUaGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGUgc2VyaWVz
IGluIENIJ3MgdHJlZS4gSXQgcmVtb3ZlcyB0aGUKLT5wYWdlX2ZyZWUoKSBjYWxsYmFjayBmcm9t
IHRoZSByZWxlYXNlX3BhZ2VzKCkgcGF0aCBiZWNhdXNlIGl0IGdvZXMKdG9vIGZhciBhbmQgcmVt
b3ZlcyB0aGUgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UoKSBjYWxsLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
