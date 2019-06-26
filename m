Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F9256E3C
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 18:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044146E488;
	Wed, 26 Jun 2019 16:01:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6FC6E488
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jun 2019 16:00:59 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id v186so2332102oie.5
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jun 2019 09:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/963AMc32TjFW8pz2sb81LGtvemWumKWmOSWi/w+uo=;
 b=PcssDr0jPO4LJ0rJeIF1wbu44lTGe1c0XoUtdj1qXoCI8M/3k1CBfT5TzVgHedUDim
 HIyS4JURIBki3DEukUfLymYfJoxJ/BitZ5X2eXVnOZtfZ7GPP9TbOjo7IUw8uIk/04Sw
 DVoSPTK/RncqUlj3Het8iaOAQElrlYWGZ5wXCRPcarLSwigMx8BlUtgvpnSWNMtTcO4I
 fgTL8nqaWMtTnMHlMQmSbwKL4MCxGKNous5lfSg5Aa0dKfwMug1W7Uy0Q836cMNbRmE7
 Auq+lKJjqwGNJSo1YJluIrthcsEPVA7SSYMpgeIVpWMeNIg0/uMOdgqT639qrnHQUty2
 6BCg==
X-Gm-Message-State: APjAAAXYp3CvxtyE76HvYzHDHqzPvP45S70tIDgIjelS3Ad4mL5q7+vU
 zb6qu4M6/8kUw3ZC3xF4q07IaBelbkMSdmLYRKuyIgHDtjM=
X-Google-Smtp-Source: APXvYqw+HKEk3o1E4qvsumKbcYL8DeGoSSUg6kQouoUdfkWJuiZCSiMJzuF3+UevbQqRwbob+TxTsET5oJi5oxrpxxs=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr2276731oii.0.1561564858765;
 Wed, 26 Jun 2019 09:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-5-hch@lst.de>
In-Reply-To: <20190626122724.13313-5-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 26 Jun 2019 09:00:47 -0700
Message-ID: <CAPcyv4gTOf+EWzSGrFrh2GrTZt5HVR=e+xicUKEpiy57px8J+w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r/963AMc32TjFW8pz2sb81LGtvemWumKWmOSWi/w+uo=;
 b=FEqk4AyqvI2SzCotbI6w47r7lIg1pbMai4XViymaBkOSAtj0NfKwJKshzu/N8BPJFi
 PPN0xns9/GQ3UjW0F9OUD+lLQxT0bLvpRO6rEeExsKdp48k3oiJcMS1RfpUHWI3YgQSe
 P3swXsvQ9fmeXBT6oobBozcpVgRGWN23FavhhN4cCEGhqIdsUZ+QWbmxpT1xgQhmYaLI
 wRlJBZOCxG1HxsggNiXJVMbdqx15uDTKnIMPx8OZYBLCprh9CGs/eCgDPe7/TAMtVU5d
 oafpIZj3xnh4RTWYjvBCXah4DbVlLssHna403/2Qrtq8aZqQJ+EBDW0IKrQkvHB1zCgf
 +PXw==
Subject: Re: [Nouveau] [PATCH 04/25] mm: remove MEMORY_DEVICE_PUBLIC support
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
Cc: Michal Hocko <mhocko@suse.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org, "Weiny,
 Ira" <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

WyBhZGQgSXJhIF0KCk9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDU6MjcgQU0gQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+Cj4gVGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBz
aW5jZSBpdCB3YXMgYWRkZWQgdG8gdGhlIHRyZWUsIGFuZCBkb2Vzbid0Cj4gYXBwZWFyIHRvIGFj
dHVhbGx5IGJlIHVzYWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5j
b20+Cj4gQWNrZWQtYnk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpbLi5dCj4gZGlm
ZiAtLWdpdCBhL21tL3N3YXAuYyBiL21tL3N3YXAuYwo+IGluZGV4IDdlZGUzZWRkYzEyYS4uODMx
MDc0MTBkMjlmIDEwMDY0NAo+IC0tLSBhL21tL3N3YXAuYwo+ICsrKyBiL21tL3N3YXAuYwo+IEBA
IC03NDAsMTcgKzc0MCw2IEBAIHZvaWQgcmVsZWFzZV9wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
LCBpbnQgbnIpCj4gICAgICAgICAgICAgICAgIGlmIChpc19odWdlX3plcm9fcGFnZShwYWdlKSkK
PiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPgo+IC0gICAgICAgICAgICAgICAv
KiBEZXZpY2UgcHVibGljIHBhZ2UgY2FuIG5vdCBiZSBodWdlIHBhZ2UgKi8KPiAtICAgICAgICAg
ICAgICAgaWYgKGlzX2RldmljZV9wdWJsaWNfcGFnZShwYWdlKSkgewo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGlmIChsb2NrZWRfcGdkYXQpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmxvY2tlZF9wZ2RhdC0+bHJ1X2xvY2ssCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZs
YWdzKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2tlZF9wZ2RhdCA9IE5V
TEw7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHBhZ2UpOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+IC0gICAgICAgICAgICAgICB9Cj4gLQoKVGhpcyBjb2xsaWRlcyB3aXRoIEly
YSdzIGJ1ZyBmaXggWzFdLiBUaGUgTUVNT1JZX0RFVklDRV9GU0RBWCBjYXNlCm5lZWRzIHRoaXMg
dG8gYmUgY29udmVydGVkIHRvIGJlIGluZGVwZW5kZW50IG9mICJwdWJsaWMiIHBhZ2VzLgpQZXJo
YXBzIGl0IHNob3VsZCBiZSBwdWxsZWQgb3V0IG9mIC1tbSBhbmQgaW5jb3Jwb3JhdGVkIGluIHRo
aXMKc2VyaWVzLgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNjA1MjE0
OTIyLjE3Njg0LTEtaXJhLndlaW55QGludGVsLmNvbS8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
