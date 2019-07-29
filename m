Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310578A8A
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 13:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C42789B30;
	Mon, 29 Jul 2019 11:29:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B98893CB
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2019 11:29:25 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id 201so43796754qkm.9
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2019 04:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=W6tMYXytvCyQcDV1Ya2OBLuGzCdn6H/t0nuDWrLRKaw=;
 b=Y5fWI5j+CHRxs6lBwVHgbF+zf25RFSjXaNla5Dh7lG5nabsgNiqUSq09GdsWvZ4PqA
 UaPyzzYtOMy+dYBdffn8ZBrKXkYmTXAnCL/XB3UsRb7GMo2ca2tuVBHJVdcdyGYWM69f
 Eed93aX1bP6H1IYvnHWpm/ZKAgV1KDP0J1MRwLuttc4zc1mWHXMT3HxQ3N03+PZTXV7e
 dFqYe5gqWMI11x+aqiZ+UZlkeKPioWKC34Rbitvi9dQprCUbr1La6YL9H0fWjbLMVdEi
 /J6cFQPSBPW8LnIsdmdVNGr2B+70hEqnM+71UAdg0BxYf70RGo88AEvhfWPdXC34lNQv
 k09w==
X-Gm-Message-State: APjAAAXu3voa1AE5mU8HHcs5Ql2JRynpAONfkEO+CdA0/2UvY7yrmIq2
 k1Y6pTF4gfTT/fJxensJiQUBfaqI
X-Google-Smtp-Source: APXvYqxq/JFQbauokMLZfre1XSuQCDWs3kePGj43RzXTI+ucDobWWW/rGdoFTmCrLG957bdOZBcW0w==
X-Received: by 2002:a37:4c01:: with SMTP id z1mr75356770qka.144.1564399764258; 
 Mon, 29 Jul 2019 04:29:24 -0700 (PDT)
Received: from [192.168.0.32] (ns1.wonder.com.br. [177.126.110.42])
 by smtp.gmail.com with ESMTPSA id o22sm24560694qkk.50.2019.07.29.04.29.22
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 04:29:23 -0700 (PDT)
To: nouveau@lists.freedesktop.org
References: <20190727113726.2EF4D21F78@orac.inputplus.co.uk>
 <CAKb7UvhqXGz7_t9EXJvu02J+f0STGB7wvwNcSM8F7YHCcJ3KbA@mail.gmail.com>
From: Solerman Kaplon <solerman@gmail.com>
Message-ID: <97a6ab0d-89bc-0bd6-76d3-445255952d97@gmail.com>
Date: Mon, 29 Jul 2019 08:29:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UvhqXGz7_t9EXJvu02J+f0STGB7wvwNcSM8F7YHCcJ3KbA@mail.gmail.com>
Content-Language: pt-BR
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=W6tMYXytvCyQcDV1Ya2OBLuGzCdn6H/t0nuDWrLRKaw=;
 b=N+hctDmRFNMnO1b2ZGDHJ8XNPeQGbDh2gj+MPwVt5iSltjWdI25dVSPUP13w2UZNFA
 GFLbjucYyXIUrx3KXrbNXSRRRefIUQt5CrdG8bZapBEIDQ+UkC/UwG73gBXCOu64NCMo
 1WiFfACjNXwJNMR6Bnm236NCmDKmyn3PWAqOolqWBWY9tuxlk2KFJQthzwdrjAzWt+zE
 GMyrVGx8OnJaJXAza/Kzq4xX592rC/QzhVKw1ZcsF9u+l24oKsfti7Z2GUoxjZSLhu/Y
 I8hXf6Mg77Fc/2+aAn0qVVMBXyrke5zq8AorN4+j88Xdvs1186j7XF9zf46SigVtIoWz
 jbNA==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

w4BzIDE0OjQ2IGRlIDI3LzA3LzIwMTksIElsaWEgTWlya2luIGVzY3JldmV1Ogo+IE9uIFNhdCwg
SnVsIDI3LCAyMDE5IGF0IDc6MzcgQU0gUmFscGggQ29yZGVyb3kgPHJhbHBoQGlucHV0cGx1cy5j
by51az4gd3JvdGU6Cj4+IFRoZSB2aWRlbyBwbGF5cywgQ1BVIGxvYWQgaXMgbGVzcyAobXkgYWlt
KSwgYnV0IHRoZXJlJ3Mg4oCYdGVhcmluZ+KAmSBvZiB0aGUKPj4gcGljdHVyZSBhcyBpZiBzbWFs
bCByZWN0YW5nbGVzIHRoYXQgYXJlIHVwZGF0ZXMgYXJlIGFwcGVhcmluZyBpbiB0aGUKPj4gd3Jv
bmcgbG9jYXRpb24sIG9mZiBieSBhIGxpdHRsZS4gIElmIEkgc3RlcCB0aHJvdWdoIHRoZSBmcmFt
ZXMgd2l0aAo+PiBtcHYncyDigJgu4oCZIGFuZCDigJgs4oCZIHRoZW4gSSd2ZSBmb3VuZCBhIHBh
dHRlcm46IG9uZSBmcmFtZSdzIHBpY3R1cmUgaXMKPj4gZ29vZCwgZm9sbG93ZWQgYnkgTiBiYWQg
b25lcyB3aGVyZSBOIGlzIDMgb3IgNywgaS5lLiBldmVyeSA0dGggb3IgOHRoCj4+IGZyYW1lIGlz
IG9rYXkuICBEb24ndCBrbm93IGlmIHRoYXQncyBhIGNsdWUgb3IgaGVscHMgc29tZW9uZSBoZXJl
Cj4+IHJlY29nbmlzZSBhIGtub3duIHByb2JsZW0uCjxzbmlwPgo+PiBVbmZvcnR1bmF0ZWx5IEkn
dmUgbmV2ZXIgdHJhY2tlZCBkb3duIHRoZSBjYXVzZSBmb3IgdGhpcy4KPj4gaHR0cHM6Ly9ub3V2
ZWF1LmZyZWVkZXNrdG9wLm9yZy93aWtpL1ZpZGVvQWNjZWxlcmF0aW9uLyAtIHNlZSBub3RlICM0
Lgo+Pgo+PiBJIGhhdmUsIG92ZXIgdGltZSwgY29sbGVjdGVkIHNvbWUgc2FtcGxlIHZpZGVvcyB3
aGVyZSB0aGlzIGhhcHBlbnMgaW4KPj4gdGhlIGZpcnN0IGZldyBmcmFtZXMuIFRoZSBwbGFuIHdh
cyB0byBkbyBtbXQgdHJhY2VzIG9mIHRoZSBibG9iCj4+IGRyaXZlciwgYW5kIGZpZ3VyZSBvdXQg
d2hhdCBpdCB3YXMgZG9pbmcgZGlmZmVyZW50bHkuCgo8c25pcD4KCkkgZG9uJ3QgcmVhbGx5IGtu
b3cgYW55dGhpbmcgYWJvdXQgaHcgY29kaW5nLCBidXQgbG9va2luZyBmcm9tIHRoZSBvdXRzaWRl
LCBpdCAKc2VlbXMgc29tZSBraW5kIG9mIHJpbmcgYnVmZmVyIHdpdGggZXhhY3QgMyBmcmFtZXMg
bWF5YmUgaW50ZW5kZWQgdG8gd29yayBraW5kYSAKbGlrZSB1c2luZyB0cmlwcGxlIGJ1ZmZlcmlu
Zz8gSSBrbm93IGZvciBvbmNlIHRoYXQgbnZpZGlhIHdvcmtzIGJldHRlciB1c2luZyAKdHJpcHBs
ZSBidWZmZXJpbmcgZnJvbSB3aGF0IEkndmUgcmVhZCBmcm9tIHRoZSBrd2luIHRocmVhZHMuCgoK
U29sZXJtYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
