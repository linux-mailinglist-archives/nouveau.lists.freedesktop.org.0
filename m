Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE447181
	for <lists+nouveau@lfdr.de>; Sat, 15 Jun 2019 20:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4718929A;
	Sat, 15 Jun 2019 18:09:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599DF8929C
 for <nouveau@lists.freedesktop.org>; Sat, 15 Jun 2019 18:09:21 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id p4so893849oti.0
 for <nouveau@lists.freedesktop.org>; Sat, 15 Jun 2019 11:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cb0Hmo2zAZrYDyoCgAidl3UeL9kc8+XrLoGdt6CrXZE=;
 b=GXlvk2qKVrk8mM0iFo+abpNgKHzdYBfyjE+6ga/emOf/hXczGXPk61B72MJt9VDfEt
 aiL3s9BKZUpIVPxaxxZixv+ZBE5WlAkXRLKKCeR3vjQI8zQmuZuxi+0MkM+bzfJkms6S
 XivRG0bNYKJmeN+9IkO6LRdJoL9BE43qk0CwOg+BlGB//RNDWpBwcXdpNBJhEy8Gshe/
 QPq2FUPXhxBRIG05l2e7fAMtFKYyP6NMv0KyYyNPEmlkj5q49Lflt6VOMcyka2TZjKwb
 qxhodnj0NB5JdUd3TOUP7o3Btn56ssN/sY6j8Jm6JL3XL0ebH7LyCTHfiDzIgKGPMoPN
 YECg==
X-Gm-Message-State: APjAAAVOL3OG8gRjiSNfPxSfa0HqtP46Oj58WnNH8quwFTW/mcnU39Ag
 C+NKzFS+PZSnGMSGk/oAbpRd3qTNLZL37eBgEzKWmg==
X-Google-Smtp-Source: APXvYqxK2ja20GipaVbp7qq4Oaf290msf2s3XleRazQ4mdHqmcalk7o8VyutGF6B5iu+bOwCwwdJPEhdvYDhbnFupMs=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr44930666otn.71.1560622160642; 
 Sat, 15 Jun 2019 11:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190614061333.GC7246@lst.de>
 <CAPcyv4jmk6OBpXkuwjMn0Ovtv__2LBNMyEOWx9j5LWvWnr8f_A@mail.gmail.com>
 <20190615083356.GB23406@lst.de>
In-Reply-To: <20190615083356.GB23406@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 15 Jun 2019 11:09:09 -0700
Message-ID: <CAPcyv4jkDC3hRt_pj1e8j_OmzJ-wdumy-o1bN0ab=JVE_gfKdg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Cb0Hmo2zAZrYDyoCgAidl3UeL9kc8+XrLoGdt6CrXZE=;
 b=EY/IUPVbu+1KTXp5GI53vNwR2z9Nvu64XsQUizbEMMU+aGYsXWtd2lTzv6Rx3V/2OG
 ZCHaTlatz8Y6DgkD78CATBQ1yUSjk/05HpPEqetVEj/+F5+Kom/9e7XbdGpDgyQQCBnL
 yj7evXXPdyreGRqDjU90YAS5Z/xg/+W8t5onIf68LdBa/3dqW/rLtaWBvtaURMP28S5L
 ACzapU9ov4J0F0u3SlQrs+vm8YDjsJurYg/jGuJheOXTmxVlf3qQXGWQIp1J0v1wmtf3
 4CKVxNLpNlkzY6vy0HsyUqk2Hkklo6bAEUB4ced5+znlBd2UCAgiXhA0LcanxooGfjdt
 jtDg==
Subject: Re: [Nouveau] dev_pagemap related cleanups
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
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMTUsIDIwMTkgYXQgMTozNCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAwNjoxNDo0NVBNIC0wNzAw
LCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAxMToxNCBQ
TSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRo
dSwgSnVuIDEzLCAyMDE5IGF0IDExOjI3OjM5QU0gLTA3MDAsIERhbiBXaWxsaWFtcyB3cm90ZToK
PiA+ID4gPiBJdCBhbHNvIHR1cm5zIG91dCB0aGUgbnZkaW1tIHVuaXQgdGVzdHMgY3Jhc2ggd2l0
aCB0aGlzIHNpZ25hdHVyZSBvbgo+ID4gPiA+IHRoYXQgYnJhbmNoIHdoZXJlIGJhc2UgdjUuMi1y
YzMgcGFzc2VzOgo+ID4gPgo+ID4gPiBIb3cgZG8geW91IHJ1biB0aGF0IHRlc3Q/Cj4gPgo+ID4g
VGhpcyBpcyB0aGUgdW5pdCB0ZXN0IHN1aXRlIHRoYXQgZ2V0cyBraWNrZWQgb2ZmIGJ5IHJ1bm5p
bmcgIm1ha2UKPiA+IGNoZWNrIiBmcm9tIHRoZSBuZGN0bCBzb3VyY2UgcmVwb3NpdG9yeS4gSW4g
dGhpcyBjYXNlIGl0IHJlcXVpcmVzIHRoZQo+ID4gbmZpdF90ZXN0IHNldCBvZiBtb2R1bGVzIHRv
IGNyZWF0ZSBhIGZha2UgbnZkaW1tIGVudmlyb25tZW50Lgo+ID4KPiA+IFRoZSBzZXR1cCBpbnN0
cnVjdGlvbnMgYXJlIGluIHRoZSBSRUFETUUsIGJ1dCBmZWVsIGZyZWUgdG8gc2VuZCBtZQo+ID4g
YnJhbmNoZXMgYW5kIEkgY2FuIGtpY2sgb2ZmIGEgdGVzdC4gT25lIG9mIHRoZXNlIHdlJ2xsIGdl
dCBhcm91bmQgdG8KPiA+IG1ha2luZyBpdCBhdXRvbWF0ZWQgZm9yIHBhdGNoIHN1Ym1pc3Npb25z
IHRvIHRoZSBsaW51eC1udmRpbW0gbWFpbGluZwo+ID4gbGlzdC4KPgo+IE9oLCBub3cgSSByZW1l
bWJlciwgYW5kIHRoYXQgd2FzIHRoZSBidW1tZXIgYXMgYW55dGhpbmcgcmVxdWlyaW5nIG1vZHVs
ZXMKPiBqdXN0IGRvZXMgbm90IGZpdCBhdCBhbGwgaW50byBteSBub3JtYWwgdGVzdCBmbG93cyB0
aGF0IGp1c3QgaW5qZWN0Cj4ga2VybmVsIGltYWdlcyBhbmQgdXNlIG90aGVyd2lzZSBzdGF0aWMg
aW1hZ2VzLgoKWWVhaC4uLiBhbHRob3VnaCB3ZSBkbyBoYXZlIHNvbWUgY2hhbmdlcyBiZWluZyBw
cm9wb3NlZCBmcm9tIG5vbi14ODYKZGV2cyB0byBhbGxvdyBhIHN1YnNldCBvZiB0aGUgdGVzdHMg
dG8gcnVuIHdpdGhvdXQgdGhlIG5maXRfdGVzdAptb2R1bGVzOiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzEwOTgwNzc5LwoKLi4uc28gdGhpcyBwcm9tcHRzIG1lIHRvIGdvIHJl
dmlldyB0aGF0IHBhdGNoLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
