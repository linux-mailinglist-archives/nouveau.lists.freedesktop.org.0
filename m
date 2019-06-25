Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE5556B5
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 20:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BE66E20B;
	Tue, 25 Jun 2019 18:04:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931146E20B
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 18:04:06 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t76so13267412oih.4
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 11:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+ZhBSNWMG71/hoVLbHT+wkJMxkbtm8D8gJnUatkLjU=;
 b=iajd7g3wGmNh9hrTI9CIpirkhSK5HJcDcLRV0URj9kcxG5WXDl4REnpzokf1Eq83Dr
 HqzGWNNQe/fmvkweyAjvr/2Y9r+wwuKtYA5xianvfSxhI9wadm52klDLuiIRKdU5m968
 xCGmu63NnOmXl+EbWehHri60IoGbL+oZ7aFOPEx5jKy0SgBptuXBAzfhb/ovcOIoWO22
 9TIKH/sIIXPsscdLWqruCb8DnUIzDM+nmM1rt6/v6+OPzw78n315y8uGpZIUidIarnZ+
 jyj7T/x85iVzCeoajGsG9U8Op+6zhng0ytKGGUroLRBehk0kuy8ry/Zq0xysyf+Ce3hW
 aswA==
X-Gm-Message-State: APjAAAWHf0Dcr1RRK2SNDk9IflftcE2pP1wstF7Ep+N6hLR5vuJFDz+s
 CoUGuizB1o1ytg6EbfKUKsf/dDCG74IUbnXaN0AA1g==
X-Google-Smtp-Source: APXvYqz6T9TVXWGjVm88Qsyic/J7sZ8rY/3bbGIhMBzOCJnst1XOiiw6CA8iBdJBDNkwj6/NRoOe4+QnfOGQ8i6wx08=
X-Received: by 2002:aca:d60c:: with SMTP id n12mr15532591oig.105.1561485845899; 
 Tue, 25 Jun 2019 11:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
 <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
 <20190625072317.GC30350@lst.de> <20190625150053.GJ11400@dhcp22.suse.cz>
In-Reply-To: <20190625150053.GJ11400@dhcp22.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Jun 2019 11:03:53 -0700
Message-ID: <CAPcyv4j1e5dbBHnc+wmtsNUyFbMK_98WxHNwuD_Vxo4dX9Ce=Q@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=v+ZhBSNWMG71/hoVLbHT+wkJMxkbtm8D8gJnUatkLjU=;
 b=JxNg8q13dPoy4++bWTLKe91YyHwlNjFnbzSb9Om/uZZjmzDhnDweJK+SXVAHxvQJR0
 312VGhMneNMNXAmSV6hMRZIzT4bIOEkHXQoVC3M4u9DoF+fAlTSvPDyjEiVH1eTZKAv6
 dp2nCpruoX6QC/iIKdTTjv2kOKKIAnLDyxY0m5z6y8S0clG2ID2Kd3dCyQI6rh541kFT
 eDdVfoEDrUI7YN4BuqjchbcpiBzhNte5u19MgaVZHdA1NCRepz4PjjVsuhg3X5n+bs85
 X+HfBTjHRFVQoAtJFMiji2LpwQIjXK1seUAZDPl9j1P4iwnhlcEX3jRF05VVFomoae2Q
 6U5g==
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgODowMSBBTSBNaWNoYWwgSG9ja28gPG1ob2Nrb0BrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSAyNS0wNi0xOSAwOToyMzoxNywgQ2hyaXN0b3BoIEhl
bGx3aWcgd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAyNCwgMjAxOSBhdCAxMToyNDo0OEFNIC0wNzAw
LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiA+IEkgYXNrZWQgZm9yIHRoaXMgc2ltcGx5IGJlY2F1
c2UgaXQgd2FzIG5vdCBleHBvcnRlZCBoaXN0b3JpY2FsbHkuIEluCj4gPiA+IGdlbmVyYWwgSSB3
YW50IHRvIGVzdGFibGlzaCBleHBsaWNpdCBleHBvcnQtdHlwZSBjcml0ZXJpYSBzbyB0aGUKPiA+
ID4gY29tbXVuaXR5IGNhbiBzcGVuZCBsZXNzIHRpbWUgZGViYXRpbmcgd2hlbiB0byB1c2UgRVhQ
T1JUX1NZTUJPTF9HUEwKPiA+ID4gWzFdLgo+ID4gPgo+ID4gPiBUaGUgdGhvdWdodCBpbiB0aGlz
IGluc3RhbmNlIGlzIHRoYXQgaXQgaXMgbm90IGhpc3RvcmljYWxseSBleHBvcnRlZAo+ID4gPiB0
byBtb2R1bGVzIGFuZCBpdCBpcyBzYWZlciBmcm9tIGEgbWFpbnRlbmFuY2UgcGVyc3BlY3RpdmUg
dG8gc3RhcnQKPiA+ID4gd2l0aCBHUEwtb25seSBmb3IgbmV3IHN5bWJvbHMgaW4gY2FzZSB3ZSBk
b24ndCB3YW50IHRvIG1haW50YWluIHRoYXQKPiA+ID4gaW50ZXJmYWNlIGxvbmctdGVybSBmb3Ig
b3V0LW9mLXRyZWUgbW9kdWxlcy4KPiA+ID4KPiA+ID4gWWVzLCB3ZSBhbHdheXMgcmVzZXJ2ZSB0
aGUgcmlnaHQgdG8gcmVtb3ZlIC8gY2hhbmdlIGludGVyZmFjZXMKPiA+ID4gcmVnYXJkbGVzcyBv
ZiB0aGUgZXhwb3J0IHR5cGUsIGJ1dCBoaXN0b3J5IGhhcyBzaG93biB0aGF0IGV4dGVybmFsCj4g
PiA+IHByZXNzdXJlIHRvIGtlZXAgYW4gaW50ZXJmYWNlIHN0YWJsZSAoY29udHJhcnkgdG8KPiA+
ID4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N0YWJsZS1hcGktbm9uc2Vuc2UucnN0KSB0ZW5kcyB0
byBiZSBsZXNzIGZvcgo+ID4gPiBHUEwtb25seSBleHBvcnRzLgo+ID4KPiA+IEZ1bGx5IGFncmVl
ZC4gIEluIHRoZSBlbmQgdGhlIGRlY2lzaW9uIGlzIHdpdGggdGhlIE1NIG1haW50YWluZXJzLAo+
ID4gdGhvdWdoLCBhbHRob3VnaCBJJ2QgcHJlZmVyIHRvIGtlZXAgaXQgYXMgaW4gdGhpcyBzZXJp
ZXMuCj4KPiBJIGFtIHNvcnJ5IGJ1dCBJIGFtIG5vdCByZWFsbHkgY29udmluY2VkIGJ5IHRoZSBh
Ym92ZSByZWFzb25pbmcgd3J0LiB0bwo+IHRoZSBhbGxvY2F0b3IgQVBJIGFuZCBpdCBoYXMgYmVl
biBhIHN1YmplY3Qgb2YgbWFueSBjaGFuZ2VzIG92ZXIgdGltZS4gSQo+IGRvIG5vdCByZW1lbWJl
ciBhIHNpbmdsZSBjYXNlIHdoZXJlIHdlIHdvdWxkIGJlIGJlbmRpbmcgdGhlIGFsbG9jYXRvcgo+
IEFQSSBiZWNhdXNlIG9mIGV4dGVybmFsIG1vZHVsZXMgYW5kIEkgYW0gcHJldHR5IHN1cmUgd2Ug
d2lsbCBwdXNoIGJhY2sKPiBoZWF2aWx5IGlmIHRoYXQgd2FzIHRoZSBjYXNlIGluIHRoZSBmdXR1
cmUuCgpUaGlzIHNlZW1zIHRvIHNheSB0aGF0IHlvdSBoYXZlIG5vIGRpcmVjdCBleHBlcmllbmNl
IG9mIGRlYWxpbmcgd2l0aApjaGFuZ2luZyBzeW1ib2xzIHRoYXQgdGhhdCBhIHByb21pbmVudCBv
dXQtb2YtdHJlZSBtb2R1bGUgbmVlZHM/IEdQVQpkcml2ZXJzIGFuZCB0aGUgY29yZS1tbSBhcmUg
b24gYSBwYXRoIHRvIGluY3JlYXNlIHRoZWlyIGNvb3BlcmF0aW9uIG9uCm1lbW9yeSBtYW5hZ2Vt
ZW50IG1lY2hhbmlzbXMgb3ZlciB0aW1lLCBhbmQgc3ltYm9sIGV4cG9ydCBjaGFuZ2VzIGZvcgpv
dXQtb2YtdHJlZSBHUFUgZHJpdmVycyBoYXZlIGJlZW4gYSBzaWduaWZpY2FudCBzb3VyY2Ugb2Yg
ZnJpY3Rpb24gaW4KdGhlIHBhc3QuCgo+IFNvIGluIHRoaXMgcGFydGljdWxhciBjYXNlIEkgd291
bGQgZ28gd2l0aCBjb25zaXN0ZW5jeSBhbmQgZXhwb3J0IHRoZQo+IHNhbWUgd2F5IHdlIGRvIHdp
dGggb3RoZXIgZnVuY3Rpb25zLiBBbHNvIHdlIGRvIG5vdCB3YW50IHBlb3BsZSB0bwo+IHJlaW52
ZW50IHRoaXMgQVBJIGFuZCBzY3JldyB0aGF0IGxpa2Ugd2UgaGF2ZSBzZWVuIGluIG90aGVyIGNh
c2VzIHdoZW4KPiBleHRlcm5hbCBtb2R1bGVzIHRyeSByZWltcGxlbWVudCBjb3JlIGZ1bmN0aW9u
YWxpdHkgdGhlbXNlbHZlcy4KCkNvbnNpc3RlbmN5IGlzIGEgd2VhayBhcmd1bWVudCB3aGVuIHRo
ZSBjb3N0IHRvIHRoZSB1cHN0cmVhbSBjb21tdW5pdHkKaXMgbmVnbGlnaWJsZS4gSWYgdGhlIHNh
bWUgZnVuY3Rpb25hbGl0eSB3YXMgYXZhaWxhYmxlIHZpYSBhbm90aGVyIC8KYWxyZWFkeSBleHBv
cnRlZCBpbnRlcmZhY2UgKnRoYXQqIHdvdWxkIGJlIGFuIGFyZ3VtZW50IHRvIG1haW50YWluIHRo
ZQpleGlzdGluZyBleHBvcnQgcG9saWN5LiAiQ29uc2lzdGVuY3kiIGluIGFuZCBvZiBpdHNlbGYg
aXMgbm90IGEKcHJlY2VkZW50IHdlIGNhbiB1c2UgbW9yZSB3aWRlbHkgaW4gZGVmYXVsdCBleHBv
cnQtdHlwZSBkZWNpc2lvbnMuCgpFZmZlY3RpdmVseSBJJ20gYXJndWluZyBFWFBPUlRfU1lNQk9M
X0dQTCBieSBkZWZhdWx0IHdpdGggYSBsYXRlcgpkZWNpc2lvbiB0byBkcm9wIHRoZSBfR1BMLiBT
aW1pbGFyIHRvIGhvdyB3ZSBhcmUgY2FyZWZ1bCB0byBtYXJrIHN5c2ZzCmludGVyZmFjZXMgaW4g
RG9jdW1lbnRhdGlvbi9BQkkvIHRoYXQgd2UgYXJlIG5vdCBmdWxseSBjb21taXR0ZWQgdG8KbWFp
bnRhaW5pbmcgb3ZlciB0aW1lLCBvciBhcmUgb3RoZXJ3aXNlIHNvIG5ldyB0aGF0IHRoZXJlIGlz
IG5vdCB5ZXQgYQpnb29kIHJlYWQgb24gd2hldGhlciB0aGV5IGNhbiBiZSBtYWRlIHBlcm1hbmVu
dC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
