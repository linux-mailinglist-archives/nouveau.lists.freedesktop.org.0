Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DBC8D24B
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 13:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA87D6E148;
	Wed, 14 Aug 2019 11:37:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from relay05.pair.com (relay05.pair.com [216.92.24.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93E66E130
 for <nouveau@lists.freedesktop.org>; Wed, 14 Aug 2019 11:37:54 +0000 (UTC)
Received: from orac.inputplus.co.uk (unknown [87.113.169.30])
 by relay05.pair.com (Postfix) with ESMTP id 057461A27AB;
 Wed, 14 Aug 2019 07:37:52 -0400 (EDT)
Received: from orac.inputplus.co.uk (orac.inputplus.co.uk [IPv6:::1])
 by orac.inputplus.co.uk (Postfix) with ESMTP id 31EE721EEB;
 Wed, 14 Aug 2019 12:37:51 +0100 (BST)
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Ralph Corderoy <ralph@inputplus.co.uk>
MIME-Version: 1.0
In-reply-to: <CAKb7UvhqXGz7_t9EXJvu02J+f0STGB7wvwNcSM8F7YHCcJ3KbA@mail.gmail.com>
References: <20190727113726.2EF4D21F78@orac.inputplus.co.uk>
 <CAKb7UvhqXGz7_t9EXJvu02J+f0STGB7wvwNcSM8F7YHCcJ3KbA@mail.gmail.com>
Date: Wed, 14 Aug 2019 12:37:51 +0100
Message-Id: <20190814113751.31EE721EEB@orac.inputplus.co.uk>
Subject: Re: [Nouveau] Video Hardware Decoding: Jittery Rectangles on Nvidia
 GT218 NVA8 VP4.
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgSWxpYSwKCkEgZm9ydG5pZ2h0IGFnbywgeW91IHdyb3RlOgo+ID4gVGhlIHZpZGVvIHBsYXlz
LCBDUFUgbG9hZCBpcyBsZXNzIChteSBhaW0pLCBidXQgdGhlcmUncyDigJh0ZWFyaW5n4oCZIG9m
Cj4gPiB0aGUgcGljdHVyZSBhcyBpZiBzbWFsbCByZWN0YW5nbGVzIHRoYXQgYXJlIHVwZGF0ZXMg
YXJlIGFwcGVhcmluZyBpbgo+ID4gdGhlIHdyb25nIGxvY2F0aW9uLCBvZmYgYnkgYSBsaXR0bGUu
ICBJZiBJIHN0ZXAgdGhyb3VnaCB0aGUgZnJhbWVzCj4gPiB3aXRoIG1wdidzIOKAmC7igJkgYW5k
IOKAmCzigJkgdGhlbiBJJ3ZlIGZvdW5kIGEgcGF0dGVybjogb25lIGZyYW1lJ3MKPiA+IHBpY3R1
cmUgaXMgZ29vZCwgZm9sbG93ZWQgYnkgTiBiYWQgb25lcyB3aGVyZSBOIGlzIDMgb3IgNywgaS5l
Lgo+ID4gZXZlcnkgNHRoIG9yIDh0aCBmcmFtZSBpcyBva2F5LiAgRG9uJ3Qga25vdyBpZiB0aGF0
J3MgYSBjbHVlIG9yCj4gPiBoZWxwcyBzb21lb25lIGhlcmUgcmVjb2duaXNlIGEga25vd24gcHJv
YmxlbS4KPgo+IFVuZm9ydHVuYXRlbHkgSSd2ZSBuZXZlciB0cmFja2VkIGRvd24gdGhlIGNhdXNl
IGZvciB0aGlzLgo+IGh0dHBzOi8vbm91dmVhdS5mcmVlZGVza3RvcC5vcmcvd2lraS9WaWRlb0Fj
Y2VsZXJhdGlvbi8gLSBzZWUgbm90ZSAjNC4KClRoYXQgc291bmRzIGxpa2UgdGhlIHByb2JsZW0s
IGJ1dCBpdCBpcyBhbGwgdGhlIHdheSB0aHJvdWdoIFRWIHByb2dyYW1tZQpmcm9tIHRoZSBCQkMg
aVBsYXllcidzIHNlcnZpY2UuCgo+IEkgaGF2ZSwgb3ZlciB0aW1lLCBjb2xsZWN0ZWQgc29tZSBz
YW1wbGUgdmlkZW9zIHdoZXJlIHRoaXMgaGFwcGVucyBpbgo+IHRoZSBmaXJzdCBmZXcgZnJhbWVz
LiBUaGUgcGxhbiB3YXMgdG8gZG8gbW10IHRyYWNlcyBvZiB0aGUgYmxvYgo+IGRyaXZlciwgYW5k
IGZpZ3VyZSBvdXQgd2hhdCBpdCB3YXMgZG9pbmcgZGlmZmVyZW50bHkuIElmIHRoaXMgaXMKPiBz
b21ldGhpbmcgeW91J3JlIGludGVyZXN0ZWQgaW4sIEknZCBiZSBoYXBweSB0byBwcm92aWRlIHNv
bWUgZ3VpZGFuY2UuCgpJJ3ZlIHR3byBtbWlvIHRyYWNlcywgbm91dmVhdSBhbmQgbnZpZGlhLCBl
YWNoIHVzaW5nIG1wdigxKSB0byBwbGF5IHRoZQpzYW1lIHRlbi1zZWNvbmQgZXh0cmFjdCBvZiBh
biBpUGxheWVyIE1QNCwgd2l0aCBhbmQgd2l0aG91dCDigJgtLXZvPXZkcGF1Ci0taHdkZWM9dmRw
YXXigJkuCgogICAgJCBncmVwIC1uIF5NQVJLIG52aWRpYS00Lm1taW90cmFjZQogICAgMjA6TUFS
SyA2NTY0NS4zMDI5MzkgYnVmZmVyX3NpemVfa2I6IDUyNDI4OAogICAgMjE6TUFSSyA2NTY0NS4z
ODU3NzYgc3RhcnRpbmcgeAogICAgMTQ0NzU1NDpNQVJLIDY1NjgxLjk3OTg5MiB4IHN0YXJ0ZWQK
ICAgIDE0NDg1NjA6TUFSSyA2NTY4Mi40NDY3NDcgbXB2IG5vbmUgc3RhcnQKICAgIDE4NjgxOTc6
TUFSSyA2NTcwMS4xNTM3NzAgbXB2IG5vbmUgZG9uZQogICAgMTg2OTQ2MjpNQVJLIDY1NzAyLjc0
ODAwNSBtcHYgdm8gc3RhcnQKICAgIDI2MzM3Mjk6TUFSSyA2NTcyNC40NjUxNTQgbXB2IHZvIGRv
bmUKICAgIDI2MzQ5NTY6TUFSSyA2NTcyNi4yNTk4MjkgbXB2IHZvIGh3ZGVjIHN0YXJ0CiAgICA1
MzQ3NTIwOk1BUksgNjU3NTkuODQxNDMyIG1wdiB2byBod2RlYyBkb25lCiAgICA1MzQ5MDE5Ok1B
UksgNjU3NjIuNDMxMTM3IGtpbGxpbmcgY2F0CiAgICAkCgpod2RlYyBvbiBudmlkaWEgZWFzaWx5
IG92ZXJmbG93ZWQgdGhlIGRlZmF1bHQgMSw0MDjCoEtpQiB0cmFjZSBidWZmZXIsCndoZXJlYXMg
bm91dmVhdSBkaWRuJ3QuCgpBcmUgdGhlc2UgaGVscGZ1bD8gIFNoYWxsIEkgc3VibWl0IHRoZW0g
dG8gdGhlIEdtYWlsIGFkZHJlc3MgZ2l2ZW4gaW4KaHR0cHM6Ly9ub3V2ZWF1LmZyZWVkZXNrdG9w
Lm9yZy93aWtpL01taW9UcmFjZS8KCi0tIApDaGVlcnMsIFJhbHBoLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
