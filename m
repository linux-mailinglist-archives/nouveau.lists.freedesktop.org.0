Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD5A43723
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 16:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0AC7897D0;
	Thu, 13 Jun 2019 14:15:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E84897D0
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 14:15:49 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id j8so7361377uan.6
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gP+xjaHSjrvOavBzG4SkUOtbcADdwKtLg+5ix/IeTX8=;
 b=SHkfQwm2MaxOFDhVZ7LOlX9FQZuKdZ02K3hXPP08rpOkEJ75bpEdFqpxy4HbTFnDC2
 eL2+oEgjiOK7bFZ7b8EaBO1Frvfbhclnuh7dbcraloG/nSMlkOcvkrOwgJKQOhPEgasF
 QUKr9Yor27gjbr9ZW0bCpiBf6N3t9aNHqMtXPaU7bBCHNajMDKV9Rb/Lj8NoPDy7/DKe
 8w041EuljPrO6GLZ7cPiQKkBwysLSOHGatd0pHma8nx4RKRz34sj6ZqFzJsfpugfPLLB
 dpFWfHDQNzz8WiRpZBZ7KcO7dy2+IfT5KrT5TSl3+LY+wXI7X+AOHikfa3AXRJoYX7YJ
 j7Bw==
X-Gm-Message-State: APjAAAXzX4w91cmU6Ll4Gs0+feqwC5iDAYxswVdA+uH1GHfMXCGBTBE2
 mWnpyoPeSsWx4dD3JZsapzEh7sdI7NqQLWRX8ORANSiP
X-Google-Smtp-Source: APXvYqweF93EUDwjFnrH8VNZlYKtl+6Nt+qbt8rFCLNNVpKtKPBpUzn9HdGYFiunAQjtLuxTyUINBu8fkv6a4e6gnkQ=
X-Received: by 2002:ab0:2b0a:: with SMTP id e10mr19635965uar.109.1560435349002; 
 Thu, 13 Jun 2019 07:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MSTo-h0aOj25dJNmoavQvRLTjEEekKFVSV3ixdLLcZwmJ_dQ@mail.gmail.com>
In-Reply-To: <CA+MSTo-h0aOj25dJNmoavQvRLTjEEekKFVSV3ixdLLcZwmJ_dQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 13 Jun 2019 10:15:37 -0400
Message-ID: <CAKb7UvjBDZkV606QdM9Knw6PUYjrmubUrcXU2dkToFmuumUQrg@mail.gmail.com>
To: Fernando Sahmkow <fsahmkow27@gmail.com>
Subject: Re: [Nouveau] Question on interoperability with Nouveau
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

VGhpcyBpcyBkb25lIHdpdGggYSBzZXF1ZW5jZSBvZiBibGl0cywgZnJvbSBsZXZlbCAwIC0+IGxl
dmVsIDEsIHRoZW4KbGV2ZWwgMSAtPiBsZXZlbCAyLCBldGMuIHN0L21lc2EgaGFzIGEgaGVscGVy
IHdoaWNoIHdpbGwgY2FsbCB0aGUKZ2FsbGl1bSBkcml2ZXIncyBibGl0IG1ldGhvZCB3aXRoIHRo
ZSBhcHByb3ByaWF0ZSBwYXJhbWV0ZXJzLgoKSW50ZXJuYWxseSwgYXNzdW1pbmcgdGhlcmUncyBu
b3RoaW5nIHRvbyBmdW5reSBnb2luZyBvbiwgd2UnbGwgdXNlIHRoZQoyZCBibGl0IGxvZ2ljIChj
bGFzcyAweDkwMmQpLiBJZiB0aGUgM2QgbG9naWMgaXMgaW52b2tlZCwgaXQncyBhCnNpbXBsZSBz
aGFkZXIgdGhhdCB0ZXh0dXJlcyB0aGUgc291cmNlIGFuZCBwcm9kdWNlcyB0aGUgb3V0cHV0LiBX
ZSBkbwp1c2Ugc29tZSBmdW5reSBzZXR0aW5ncyB3aGVuIGludm9raW5nIHRoYXQgc2hhZGVyIHRo
b3VnaCAtLSBtb3N0Cmxpa2VseSB0aGluZyB0aGF0IHlvdSBtaWdodCBub3QgaGF2ZSBpbXBsZW1l
bnRlZCBpbiB5b3VyIGVtdWxhdG9yIGlzCnRoYXQgd2UgZGlzYWJsZSBWSUVXUE9SVF9UUkFOU0ZP
Uk1fRU4sIHNvIHRoZSBjb29yZGluYXRlcyBwcm9kdWNlZCBieQp0aGUgdmVydGV4IHNoYWRlciBh
cmUgbm9uLW5vcm1hbGl6ZWQuIFdlIGFsc28gdXNlIGVub3Jtb3VzIGNvb3JkaW5hdGVzCnRvIGRy
YXcgYSBzaW5nbGUgdHJpYW5nbGUgdGhhdCB3aWxsIGNvdmVyIGFueSBwb3NzaWJsZSBmYiBzaXpl
LgoKVGhpcyBpcyB0aGUgZnVsbCBibGl0IGZ1bmN0aW9uOgpodHRwczovL2NnaXQuZnJlZWRlc2t0
b3Aub3JnL21lc2EvbWVzYS90cmVlL3NyYy9nYWxsaXVtL2RyaXZlcnMvbm91dmVhdS9udmMwL252
YzBfc3VyZmFjZS5jI24xNTczCgpUaGUgMmQgY2FzZSBpcyBoYW5kbGVkIGJ5IG52YzBfYmxpdF9l
bmcyZCwgd2hpbGUgM2QgaXMgaGFuZGxlZCBieQpudmMwX2JsaXRfM2QuIFRoZSAzZCBjYXNlIHNl
dHMgdXAgdGhlIHJhc3Rlcml6ZXIgZm9yIHRoZSBleHBlY3RhdGlvbnMKb2YgdGhlIHZlcnQgYW5k
IGZyYWcgc2hhZGVycywgdGhlbiBzdGlja3Mgc29tZSBkYXRhIGludG8gYSBjcHUtbWFwcGVkClZC
TywgYW5kIGV4ZWN1dGVzIGl0LgoKRG9uJ3Qgd29ycnkgYWJvdXQgdGhlIGFjdHVhbCBzaGFkZXIg
Y29udGVudHMgLS0gdGhleSdyZSBlbnRpcmVseQp1bnN1cnByaXNpbmcuIEJ1dCBpZiB5b3UncmUg
cmVhbGx5IGludGVyZXN0ZWQsIHRoZSBmcCBzaGFkZXIgaXMKZ2VuZXJhdGVkIGluIG52NTAvbnY1
MF9zdXJmYWNlLmMuCgpIb3BlIHRoaXMgaGVscHMsCgogIC1pbGlhCgpPbiBUaHUsIEp1biAxMywg
MjAxOSBhdCA5OjQyIEFNIEZlcm5hbmRvIFNhaG1rb3cgPGZzYWhta293MjdAZ21haWwuY29tPiB3
cm90ZToKPgo+IEhpIGd1eXMgYWdhaW4uIEEgaG9tZWJyZXcgZGV2ZWxvcGVyIChob21lYnJldyBp
cyBjdXN0b20gc29mdHdhcmUgbWFkZSBmb3IgdGhlIHN3aXRjaCB1c2luZyBvcGVuR0wgdW5kZXIg
bm91dmVhdSkgcmVwb3J0ZWQgdG8gbWUgdGhhdCAnZ2xHZW5lcmF0ZU1pcG1hcCcgd2Fzbid0IHdv
cmtpbmcgb24geXV6dSAoTmludGVuZG8gU3dpdGNoIGVtdWxhdG9yKS4gSSBsb29rZWQgaW50byBp
dCBhbmQgSSBub3RpY2VkIGFsbCB0aGUgdHJpYW5nbGUgZGF0YSB1c2VkIGJ5IG5vdXZlYXUgdG8g
cmVuZGVyIHRoZSBtaXBtYXBzIHdhcyBhbGwgemVyb2VkIG91dCwgbWVhbmluZyB0aGF0IHByb2Jh
Ymx5IHdlIGRvbid0IGltcGxlbWVudCB0aGUgbWVjaGFuaXNtIHlvdSBndXlzIHVzZSB0byB1cGxv
YWQgdGhhdCBkYXRhLgo+Cj4gSG93IGNhbiBJIHRyYWNrIHRoaXMgaW4geW91ciBjb2RlIGFuZCBr
bm93IHdoYXQgeW91IGd1eXMgdXNlIHRvIHVwbG9hZCB0aGUgdHJpYW5nbGVzIGRhdGEgaW50byBn
cHUgbWVtb3J5ID8KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
