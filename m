Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC0783709
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AEB6E43C;
	Tue,  6 Aug 2019 16:32:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E3E6E43C
 for <nouveau@lists.freedesktop.org>; Tue,  6 Aug 2019 16:32:49 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id s4so33876873uad.7
 for <nouveau@lists.freedesktop.org>; Tue, 06 Aug 2019 09:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBzLHEesN91kO2jakdA3QtZab6xlW8ups+53KmU/DfE=;
 b=fbC3wu7ZTxwvRelzNeNglOPZuUhHKCkWefDiqutXGCXkTlj9u0B5PHGFNNA/rjzaB/
 7dXosqS/yNjFraePp7WSeqIcn72bf6ty2DzO9CkGDJoe2tK5bOzz5ZSHheh81noNA4As
 MM+wZG+egb3x1qRu8x50pKP2ij0fFW+g9zxXD/eHW4pGxUTe6VsgYl+Urp28uiLEkqoC
 Azr4Pmj3Aq7F7piZJdQp5QOAH/FIg2gfMvRDMeu1ypX87XNjdmTlSkt5Hv6s1kRAxQ3F
 0OaN0kb3aT4NxhMdwyAFHpPi+/z1gOgRGlJ7sFVFgQYu+mUSs6g7BQpYOHu0SkOKgjOW
 XsCQ==
X-Gm-Message-State: APjAAAUFG3rZu+qGN7bY6WjPWj5KY/9C1xRDVtaDLW20UI/FTVpWn/JB
 hI+rNiTatN51Y2Tst3Fw8aZfUYF8iQs0/Da1H4rkOrLB
X-Google-Smtp-Source: APXvYqwwmtSkMWEPirN/4WGyqUCA4FZFAWUfTIS4Zw/G2jv0yPZizsk9CO3olrD5WFo19lUvzakrufNeEXx8rRsXnV4=
X-Received: by 2002:ab0:470e:: with SMTP id h14mr2834722uac.98.1565109168022; 
 Tue, 06 Aug 2019 09:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <qic915$1j2$1@blaine.gmane.org>
In-Reply-To: <qic915$1j2$1@blaine.gmane.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 6 Aug 2019 12:32:37 -0400
Message-ID: <CAKb7Uvg-7UVzYJXy3YBpV038yfsZx2hx-LZ7omR9HnCiZwYmXA@mail.gmail.com>
To: James <bjlockie@lockie.ca>
Subject: Re: [Nouveau] unstable refresh rate
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpJIHNlbWktcmVjZW50bHkgYWRkZWQgc3VwcG9ydCBmb3IgSERNSSAyLjAgKGlu
IDQuMjArLCBzbyB5b3UncmUgZ29vZCksCndoaWNoIGlzIHdoeSB5b3UgZ290IDYwSHogaW4gdGhl
IGZpcnN0IHBsYWNlLiBJbiBvcmRlciBmb3IgdGhlIGhpZ2gKcmF0ZXMgdG8gd29yaywgc29tZXRo
aW5nIGNhbGxlZCAic2NyYW1ibGluZyIgbXVzdCBiZSBlbmFibGVkLiBUaGlzIGlzCmRvbmUgYnkg
Mi1wYXJ0eSBhZ3JlZW1lbnQgYmV0d2VlbiB0aGUgc2luayBhbmQgdGhlIHNvdXJjZS4gVGhlIHNp
bmsKd2lsbCBpbmZvcm0gdGhlIHNvdXJjZSB0aGF0IGl0J3MgYWJvdXQgdG8gdXNlIHNjcmFtYmxp
bmcgKGJ5IHdyaXRpbmcKdG8gdGhlIFNDREMgcmVnaXN0ZXIgb24gdGhlIGRpc3BsYXkgb3ZlciBp
MmMpLgoKSW4gbXkgcGVyc29uYWwgZXhwZXJpbWVudHMsIG9uIGEgTEcgQzYgc2VyaWVzIFRWLCBJ
IGZvdW5kIHRoYXQgd2hpbGUKRURJRCB3b3JrcyB3aGlsZSB0aGUgVFYgaXMgb2ZmLCB0aGUgU0NE
QyB3cml0ZSBkb2VzIG5vdC4gU28geW91IGNhbgphY3R1YWxseSAidHVybiBvbiIgdGhlIGRpc3Bs
YXkgb24gdGhlIGNvbXB1dGVyIHdoaWxlIHRoZSBUViBpdHNlbGYgaXMKb2ZmLCBhbmQgdGhlIHNj
cmFtYmxpbmcgc2V0dGluZyB3aWxsIG5vdCBoYXZlIGJlZW4gcHJvcGFnYXRlZC4gVGhlbgp3aGVu
IHlvdSB0dXJuIHRoZSBUViBvbiwgaXQgZG9lc24ndCB3b3JrLiBJbiBvcmRlciB0byByZW1lZHkg
dGhpcywgeW91Cm5lZWQgdG8gZGlzYWJsZSB0aGUgZGlzcGxheSBsaW51eC1zaWRlLCBhbmQgcmUt
ZW5hYmxlIGl0LgoKVGhlIGluZGljYXRvciBmb3IgdGhpcyBzb3J0IG9mIGlzc3VlIHdvdWxkIGJl
IHNvbWV0aGluZyBhYm91dCBTQ0RDCnJlYWRzL3dyaXRlcyBmYWlsaW5nIGluIGRtZXNnIC0tIGRv
IHlvdSBzZWUgYW55dGhpbmcgb2YgdGhlIHNvcnQ/CihTb21ldGhpbmcgbGlrZSAiRmFpbHVyZSB0
byB3cml0ZSBTQ0RDX1RNRFNfQ09ORklHIikKCklmIG5vdCwgaXQncyBwcm9iYWJseSBzb21ldGhp
bmcgZWxzZS4gQnV0IHRoaXMgc2VlbXMgbGlrZSBhIGxpa2VseSBjYW5kaWRhdGUuCgpPbiBUdWUs
IEF1ZyA2LCAyMDE5IGF0IDEyOjE0IFBNIEphbWVzIDxiamxvY2tpZUBsb2NraWUuY2E+IHdyb3Rl
Ogo+Cj4gSSBoYXZlIGEgR2lnYWJ5dGUgR2VGb3JjZSAxMDUwIGNvbm5lY3RlZCBieSBEVkkgdG8g
YSBtb25pdG9yICgxOTIweDEyMDAKPiByZXNvbHV0aW9uIEAgNTkuOTUwMiBIeikgYW5kIGEgVFYg
dmlhIEhETUkgKDM4NDB4MjE2MCBAMzAgSHopLgo+IFRoZSBwcm9ibGVtIGlzIHRoZSBUViB1c2Vk
ICB0byB3b3JrIGF0IDU5Ljk2ODUgSHogYnV0IHRoZW4gaXQgc3RhcnRlZAo+IHNob3dpbmcgIk5v
IHNpZ25hbCIgb24gdGhlIFRWLgo+IEkgd2FzIGNoYW5naW5nIHNldHRpbmdzIHRyeWluZyB0byBn
ZXQgaXQgdG8gd29yayBhZ2FpbiBhbmQgSSBoYXBwZW5lZCB0bwo+IGNoYW5nZSBpdCB0byAzMEh6
IGFuZCBpdCB3b3JrZWQuCj4gVGhlIHNwZWNzIGFyZSBoZXJlOgo+IGh0dHBzOi8vd3d3LmdpZ2Fi
eXRlLmNvbS9HcmFwaGljcy1DYXJkL0dWLU4xMDUwT0MtMkdEL3NwI3NwCj4gID5EaWdpdGFsIG1h
eCByZXNvbHV0aW9uOiA3NjgweDQzMjAKPiBJIHNob3VsZCBiZSBvayByZXNvbHV0aW9uIHdpc2Uu
Cj4gQ291bGQgaXQgYmUgYSBwb29yIGNhYmxlPwo+IGtlcm5lbDogNS4wLjAtMjMtZ2VuZXJpYwo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBOb3V2
ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
