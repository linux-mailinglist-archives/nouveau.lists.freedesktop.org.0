Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A9F19DD47
	for <lists+nouveau@lfdr.de>; Fri,  3 Apr 2020 19:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C156EC57;
	Fri,  3 Apr 2020 17:59:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF7B6EC57
 for <nouveau@lists.freedesktop.org>; Fri,  3 Apr 2020 17:59:09 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id a6so8159553ilr.4
 for <nouveau@lists.freedesktop.org>; Fri, 03 Apr 2020 10:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zGqjh8tWIOzg8bYhDujKphXb4w8b8uyQL/GSu4o44fE=;
 b=KZS/mQr5IM4Xv77DJj/Sy7o1do9YRZztAYja3YLa5C3rDOTvHBkchl/fHXZdILzyJD
 lhYg8DiwrZzPjZAaUvFwZQxGosVc8+nTJtU7KuVgMZe3EVMPbDRlE3oTbJ7Kzjbl1A76
 xHebNT5aNoOq1YtPZ57EoByuXgIfJw+cyCEfjkwi7u5QEqLfTD9pXFPyyENLLi8cjYyH
 a5SesUAv9KBTgf3b7sPhP9bSFq5iyD95NM5hBD/PumI2yqsolTdQiKuUbpio4xmxoMWs
 14fjLybG7qkfyezyiATLOoTEFz7hp1HmL5LvVe17klGdlVttZP4r5UFkxJLxD+qduAmp
 4YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zGqjh8tWIOzg8bYhDujKphXb4w8b8uyQL/GSu4o44fE=;
 b=f4o+MN/QTIa/3ELNQfFij7Wbbk3XijRfyafL7WOVg3m4/iU4/qDkA0Viw/Viliup5z
 FxfwRdLjK9DVaUOKm1aUlxvun7Zw+6unejbxN+mGteQXDYMNtxcNXkOrXPMTTbuNR0E4
 kFZBOKSeYDTe9e1euYK+YClv4wpZyucalhcaLFAvSoUTqtJ8x3xDjhkSR9ddwmDUUElt
 n513qYsuwUynTLWfDIiquwwZ1/T/mv8EDCnbgR/I4QVsftjznmshzQ4jBPt0wg5P009o
 Dht1sT7FQ+VNCDZiYy4NrPUbNIjGMfvNSqCKlxVlB1DI3FWTaFOpsFzIYoGu7O9waGop
 UGbg==
X-Gm-Message-State: AGi0PuY6OscOuTwL6S/pqyKYcYihwhmN/CusmdHbt5Os8DhwCU+oyq7g
 JdpXTYSODJv6YAJaJYSRk2HjQjqJf3Py8H2cHT8=
X-Google-Smtp-Source: APiQypLV22UI8hbMaQ9Ris88qX06T72jTuFx9SCF4OIefxzMJSV+YMnG8Qz4wDUnIWas/SylofX6SN506g5UerTyVMA=
X-Received: by 2002:a92:912:: with SMTP id y18mr10118914ilg.299.1585936748782; 
 Fri, 03 Apr 2020 10:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAOkhzLWMB8rr0x4KKfqruCcTLVq4dH6nZ365auMqA1arZ57J7g@mail.gmail.com>
 <CAOkhzLVvmoB0TgS4bioP4PnxwmnT_+h0LbCya2=KkcHu1UT_Zw@mail.gmail.com>
 <CAKb7UvgLr2A88jbx9Zvi3SjXoKbk4iZEg7LNQ4aL3VZhKVQu3A@mail.gmail.com>
 <CAOkhzLU+buL3J3XUbzC6JUAfbnMR-27qwS3Vm7ofrAPPCipXuw@mail.gmail.com>
 <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
In-Reply-To: <CAKb7UvhvBG49P7t6XD==26q70YywmhUHvP=hW=wj8mT6V0gpHA@mail.gmail.com>
From: Zeno Davatz <zdavatz@gmail.com>
Date: Fri, 3 Apr 2020 19:58:57 +0200
Message-ID: <CAOkhzLW42a66wNL7Pz8+d+yO_oyZZJBEps=8WPHaXXFjb54dTQ@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
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

T24gRnJpLCBBcHIgMywgMjAyMCBhdCA3OjIzIFBNIElsaWEgTWlya2luIDxpbWlya2luQGFsdW0u
bWl0LmVkdT4gd3JvdGU6Cj4KPiBPbiBGcmksIEFwciAzLCAyMDIwIGF0IDE6MjEgUE0gWmVubyBE
YXZhdHogPHpkYXZhdHpAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEFwciAzLCAy
MDIwIGF0IDY6NTkgUE0gSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PiB3cm90ZToK
PiA+ID4KPiA+ID4gQmVuIC0tIHByb2JhYmx5IHRoZSBBQ1IgY2hhbmdlcyBpbiA1LjYgZG9uJ3Qg
ZmFsbCBiYWNrIG5pY2VseSBhbnltb3JlCj4gPiA+IHdoZW4gdGhlcmUncyBubyBmaXJtd2FyZT8g
VGhlIGxvYWQgc2hvdWxkbid0IGJlIGZhaWxlZCwganVzdCBHUgo+ID4gPiBkaXNhYmxlZC4uLgo+
ID4gPgo+ID4gPiBaZW5vIC0tIGlmIHlvdSBncmFiIGxpbnV4LWZpcm13YXJlLCBpdCBzaG91bGQg
YmUgYWxsIGJldHRlci4gTm90IHN1cmUKPiA+ID4gaWYgeW91J3JlIG1pc3NpbmcgaXQgb24gcHVy
cG9zZSBvciBieSBhY2NpZGVudC4KPiA+Cj4gPiBUaGFuayB5b3UsIElsaWEKPiA+Cj4gPiBJIHdp
bGwgdHJ5IHRoYXQgb24gbXkgR2VudG9vL0Z1bnRvbyBtYWNoaW5lIG5vdy4gU28gZmFyIGxpbnV4
LWZpcm13YXJlCj4gPiB3YXMgbm90IG5lZWRlZCB3aXRoIEtlcm5lbCA1LjUsIHNvIGl0IHdhcyBu
b3QgaW5zdGFsbGVkIG9uIG15IG1hY2hpbmUuCj4KPiBJdCB3YXMgbmVlZGVkIG9uIDUuNSBhcyB3
ZWxsLiBJdCdzIGp1c3QgdGhhdCBpdCBmZWxsIGJhY2sgZ3JhY2VmdWxseQo+IHdpdGhvdXQgZmly
bXdhcmUsIGFuZCB5b3UgZGlkbid0IGdldCBhbnkgYWNjZWxlcmF0aW9uIGZlYXR1cmVzLgoKRG8g
SSBuZWVkIGFueSBvZiB0aGVzZSBlbmFibGVkIGZvciBsaW51eC1maXJtd2FyZSB0byBsb2FkIHBy
b3Blcmx5IGluCktlcm5lbCA1LjY/CgogLSotIEZpcm13YXJlIGxvYWRpbmcgZmFjaWxpdHkKICDi
lIIg4pSCICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKSAgICBCdWlsZCBu
YW1lZCBmaXJtd2FyZQpibG9icyBpbnRvIHRoZSBrZXJuZWwgYmluYXJ5CiAg4pSCIOKUgiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyBdICAgRW5hYmxlIHRoZSBmaXJtd2Fy
ZQpzeXNmcyBmYWxsYmFjayBtZWNoYW5pc20KICDilIIg4pSCICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBbIF0gICBFbmFibGUgY29tcHJlc3NlZApmaXJtd2FyZSBzdXBwb3J0
CgpCZXN0Clplbm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
