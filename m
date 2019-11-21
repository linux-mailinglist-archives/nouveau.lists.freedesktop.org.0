Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3861050FC
	for <lists+nouveau@lfdr.de>; Thu, 21 Nov 2019 12:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5BB6E091;
	Thu, 21 Nov 2019 11:04:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546586E086;
 Thu, 21 Nov 2019 11:04:04 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id m15so2527427otq.7;
 Thu, 21 Nov 2019 03:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dh9d0dUVp1CFrTbKfXBJy2XPGIAj+Ygua+R35GCU6hA=;
 b=qPcIr1QM7A4z12dE0sOpvqvyt56MwWDBDBZCHSvQM2LAWlRsXjRdRfC3+5iCTXp1XY
 uuLrlUQ9dwkzrDKAdld4PZBITvcsF0F3KIcRZSNJQPkNlNsfu6j+pK9gwDVy9jcXGd7U
 7wJstIL/bv7KFeEyqL8N+NkkUCSvH/QStoZQGiXWrDUm0h0f51bBscfieJsquJvm128H
 HDiFtabLjQJNIOAxu4CFrLUMmktne/N1h9lVYHS6p7uhAPbKKWYQMheapYpxG8xAROXM
 woP5uktkuRgY4vW7L3zznYoB98GAsNVVU5+II8wj7WIwe4iuI0jDkABb4FLYEcAHWXUt
 gcfQ==
X-Gm-Message-State: APjAAAWBWCZ70tgwbMQMELpPQzektWd/qlGuO1D7CJRZZ4tnpVWD13b1
 vgJ+kOreqgiJ93G8abb9drSAgy5wTWv5b50toNQ=
X-Google-Smtp-Source: APXvYqxFx3DFSmzLCJ7ozSiCIihOvli+a1PB/uoGzpaXFKpQWnkJxSiM2BLoRgZ+7H45DsO/f1Iw3wvPYrdDHoAhYOQ=
X-Received: by 2002:a9d:6b91:: with SMTP id b17mr5820414otq.189.1574334243469; 
 Thu, 21 Nov 2019 03:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
In-Reply-To: <20191121101423.GQ11621@lahna.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 21 Nov 2019 12:03:52 +0100
Message-ID: <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MTQgQU0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEw
OjM2OjMxUE0gKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+IHdpdGggdGhlIGJyYW5jaCBh
bmQgcGF0Y2ggYXBwbGllZDoKPiA+IGh0dHBzOi8vZ2lzdC5naXRodWJ1c2VyY29udGVudC5jb20v
a2Fyb2xoZXJic3QvMDNjNGM4MTQxYjBmYTI5MmQ3ODFiYWRmYTE4NjQ3OWUvcmF3LzVjNjI2NDBh
ZmJjNTdkNmU2OWVhOTI0YzMzOGJkMjgzNmU3NzBkMDIvZ2lzdGZpbGUxLnR4dAo+Cj4gVGhhbmtz
IGZvciB0ZXN0aW5nLiBUb28gYmFkIGl0IGRpZCBub3QgaGVscCA6KCBJIHN1cHBvc2UgdGhlcmUg
aXMgbm8KPiBjaGFuZ2UgaWYgeW91IGluY3JlYXNlIHRoZSBkZWxheSB0byBzYXkgMXM/CgpXZWxs
LCBsb29rIGF0IHRoZSBvcmlnaW5hbCBwYXRjaCBpbiB0aGlzIHRocmVhZC4KCldoYXQgaXQgZG9l
cyBpcyB0byBwcmV2ZW50IHRoZSBkZXZpY2UgKEdQVSBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSkK
ZnJvbSBnb2luZyBpbnRvIGEgUENJIGxvdy1wb3dlciBzdGF0ZSBiZWZvcmUgaW52b2tpbmcgQU1M
IHRvIHBvd2VyIGl0CmRvd24gKHRoZSBBTUwgaXMgc3RpbGwgaW52b2tlZCBhZnRlciB0aGlzIHBh
dGNoIEFGQUlDUyksIHNvIHdoeSB3b3VsZAp0aGF0IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0aCB0
aGUgZGVsYXlzPwoKVGhlIG9ubHkgcmVhc29uIHdvdWxkIGJlIHRoZSBBTUwgcnVubmluZyB0b28g
ZWFybHksIGJ1dCB0aGF0IGRvZXNuJ3QKc2VlbSBsaWtlbHkuICBJTU8gbW9yZSBsaWtlbHkgaXMg
dGhhdCB0aGUgQU1MIGRvZXMgc29tZXRoaW5nIHdoaWNoCmNhbm5vdCBiZSBkb25lIHRvIGEgZGV2
aWNlIGluIGEgUENJIGxvdy1wb3dlciBzdGF0ZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
