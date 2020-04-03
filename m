Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E754119DDF6
	for <lists+nouveau@lfdr.de>; Fri,  3 Apr 2020 20:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C672F6EC62;
	Fri,  3 Apr 2020 18:31:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD006EC62
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 18:31:09 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id y17so3075762uap.13
 for <nouveau@lists.freedesktop.org>; Fri, 03 Apr 2020 11:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t/+tAvhZPkT3NQBErD+YA01dd+S7RaKEZEbNC2XphuM=;
 b=mjsasdgC3wcdepIY7IQgPs2prihvAh8X/ejnuCOcnp89VOT3/4NG2NmX9/9/dOx0Xx
 rnKOcbJoDJuXa1/ZzfRfkOqiacbDKIirAxhLLN/U4qtenP4ZZecPGkSXChiF+2SnW4Zf
 qCLBZIiUTVoMY/k390P1S6s5gZm77X/JLzeQcGHBvjFfhzW/zo5uWY6s8dD3eIZDi5rO
 Jo/QmB68RTXonDb20nz3bPCmfvLfEi0QbVbL4yHdBp+C8kKYhy8iYfqKHmf7xvsXWgQt
 FRe3fnHz2rGvkzK4d7+T7jmb5K5bwYZ33H2QPNOu/6aq1nJFwSHwjNwAXJMe/HGx+db3
 YM0Q==
X-Gm-Message-State: AGi0PuYiv5n4F0FzYy4mJHev/Bo+wCBzSp4O5WXmG937CIIEaZ8cT8ve
 h90O3WiwCE5ssoGTCuK4eNrum5Wqd+jXBxkMWBo=
X-Google-Smtp-Source: APiQypJiTag/VKFeJYh64r/Qfk3aoztunfqXQSq/NTW4O6p1gtfjHh67vLpjBVv0Hu6nZXFmXAYfl4xbMWaIlRTVKU0=
X-Received: by 2002:ab0:768b:: with SMTP id v11mr7352210uaq.109.1585938668214; 
 Fri, 03 Apr 2020 11:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
 <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
 <CAOkhzLW42a66wNL7Pz8+d+yO_oyZZJBEps=8WPHaXXFjb54dTQ@mail.gmail.com>
In-Reply-To: <CAOkhzLW42a66wNL7Pz8+d+yO_oyZZJBEps=8WPHaXXFjb54dTQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 3 Apr 2020 14:30:56 -0400
Message-ID: <CAKb7Uvh=44_S_EAfma+JX9j_igaE3CSWws_TUqLWwJ50zcmA9Q@mail.gmail.com>
To: Zeno Davatz <zdavatz@gmail.com>
Subject: Re: [Nouveau] acr: failed to load firmware with Kernel 5.6. Kernel
 5.5 works just fine.
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMywgMjAyMCBhdCAxOjU5IFBNIFplbm8gRGF2YXR6IDx6ZGF2YXR6QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAzLCAyMDIwIGF0IDc6MjMgUE0gSWxpYSBNaXJr
aW4gPGltaXJraW5AYWx1bS5taXQuZWR1PiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEFwciAzLCAy
MDIwIGF0IDE6MjEgUE0gWmVubyBEYXZhdHogPHpkYXZhdHpAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gT24gRnJpLCBBcHIgMywgMjAyMCBhdCA2OjU5IFBNIElsaWEgTWlya2luIDxpbWly
a2luQGFsdW0ubWl0LmVkdT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBCZW4gLS0gcHJvYmFibHkg
dGhlIEFDUiBjaGFuZ2VzIGluIDUuNiBkb24ndCBmYWxsIGJhY2sgbmljZWx5IGFueW1vcmUKPiA+
ID4gPiB3aGVuIHRoZXJlJ3Mgbm8gZmlybXdhcmU/IFRoZSBsb2FkIHNob3VsZG4ndCBiZSBmYWls
ZWQsIGp1c3QgR1IKPiA+ID4gPiBkaXNhYmxlZC4uLgo+ID4gPiA+Cj4gPiA+ID4gWmVubyAtLSBp
ZiB5b3UgZ3JhYiBsaW51eC1maXJtd2FyZSwgaXQgc2hvdWxkIGJlIGFsbCBiZXR0ZXIuIE5vdCBz
dXJlCj4gPiA+ID4gaWYgeW91J3JlIG1pc3NpbmcgaXQgb24gcHVycG9zZSBvciBieSBhY2NpZGVu
dC4KPiA+ID4KPiA+ID4gVGhhbmsgeW91LCBJbGlhCj4gPiA+Cj4gPiA+IEkgd2lsbCB0cnkgdGhh
dCBvbiBteSBHZW50b28vRnVudG9vIG1hY2hpbmUgbm93LiBTbyBmYXIgbGludXgtZmlybXdhcmUK
PiA+ID4gd2FzIG5vdCBuZWVkZWQgd2l0aCBLZXJuZWwgNS41LCBzbyBpdCB3YXMgbm90IGluc3Rh
bGxlZCBvbiBteSBtYWNoaW5lLgo+ID4KPiA+IEl0IHdhcyBuZWVkZWQgb24gNS41IGFzIHdlbGwu
IEl0J3MganVzdCB0aGF0IGl0IGZlbGwgYmFjayBncmFjZWZ1bGx5Cj4gPiB3aXRob3V0IGZpcm13
YXJlLCBhbmQgeW91IGRpZG4ndCBnZXQgYW55IGFjY2VsZXJhdGlvbiBmZWF0dXJlcy4KPgo+IERv
IEkgbmVlZCBhbnkgb2YgdGhlc2UgZW5hYmxlZCBmb3IgbGludXgtZmlybXdhcmUgdG8gbG9hZCBw
cm9wZXJseSBpbgo+IEtlcm5lbCA1LjY/Cj4KPiAgLSotIEZpcm13YXJlIGxvYWRpbmcgZmFjaWxp
dHkKPiAgIOKUgiDilIIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgpICAg
IEJ1aWxkIG5hbWVkIGZpcm13YXJlCj4gYmxvYnMgaW50byB0aGUga2VybmVsIGJpbmFyeQo+ICAg
4pSCIOKUgiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyBdICAgRW5hYmxl
IHRoZSBmaXJtd2FyZQo+IHN5c2ZzIGZhbGxiYWNrIG1lY2hhbmlzbQo+ICAg4pSCIOKUgiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyBdICAgRW5hYmxlIGNvbXByZXNzZWQK
PiBmaXJtd2FyZSBzdXBwb3J0CgpEZXBlbmRzIG9uIGRpc3RybyBzcGVjaWZpY3MuIEFsc28gdGhl
IGZpcm13YXJlIGhhcyB0byBiZSBhdmFpbGFibGUgYXQKdGhlIHRpbWUgdGhhdCBub3V2ZWF1IGxv
YWRzLiBUaGUgY29yb2xsYXJ5IHRvIHRoaXMgaXM6CgpJZiBpdCdzIGJ1aWx0IGludG8gdGhlIGtl
cm5lbCwgdGhlbiB0aGUgZmlybXdhcmUgbXVzdCBhbHNvIGJlIGluY2x1ZGVkCmluIHRoZSBrZXJu
ZWwgKHNpbmNlIHRoaXMgaGFwcGVucyBiZWZvcmUgYW55IEZTIHN0dWZmKQpJZiBpdCdzIGxvYWRl
ZCBhcyBhIG1vZHVsZSBmcm9tIGluaXRyZCwgdGhlbiBpbml0cmQgbXVzdCBjb250YWluIHRoZSBm
aXJtd2FyZQoKSWYgeW91IG5lZWQgaGVscCBpbmNsdWRpbmcgZmlybXdhcmUgaW4gdGhlIHJpZ2h0
IHBsYWNlLCBhIGRpc3RybwpzdXBwb3J0IGNoYW5uZWwgaXMgcHJvYmFibHkgeW91ciBiZXN0IHNo
b3QuCgpDaGVlcnMsCgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQo=
